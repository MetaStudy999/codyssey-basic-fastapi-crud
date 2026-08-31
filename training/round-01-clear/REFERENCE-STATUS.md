# B5-2 R01 — Reference Status

## Phase A 준비 결과

- [x] Mission/Evaluation 분석
- [x] 단일 Memo 도메인 선정
- [x] FastAPI/Jinja2/SQLite/SQLAlchemy Reference 구조
- [x] routers/services/repositories/models 역할 분리
- [x] 홈/목록/상세/등록/수정/삭제 화면 흐름
- [x] HTML Form + FastAPI `Form()`
- [x] 등록/수정/삭제 `303` PRG 구현
- [x] `Depends(get_db)` 요청별 Session 주입
- [x] SQLAlchemy ORM CRUD Repository
- [x] 상세 화면 전체 Memo 필드 표시
- [x] 404 Not Found 안내 화면
- [x] 공식 허용 의존성 5종만 사용
- [x] 인증/인가 미구현 유지
- [x] 모델 간 관계 미구현 유지
- [x] 최소 서버사이드 필수값 검증
- [x] Reference 실행 가이드
- [x] 강화된 `verify.sh` 준비
- [x] SQLite inspection helper
- [x] conservative reset helper
- [x] Requirement Mapping
- [x] Evaluation Q&A
- [x] Evidence Guide
- [x] Beginner Guide Quick Start / TOC / STOP-GO
- [x] 상세 Checklist
- [x] SQLite runtime 파일 Git ignore

## 2026-08-31 Pre-runtime Audit

공식 `b5-2-mission.pdf` → `b5-2-mission.md` → `b5-2-evaluation.md` → 현재 Repository `main` 순서로 다시 대조했습니다.

확인/보완 결과:

- 공식 요구인 "상세 화면 전체 필드 표시"와 Reference의 차이를 발견하여 `memo.id` 표시를 보완했습니다.
- `verify.sh`에 Python 3.10+, 공식 의존성 allowlist, Python 문법, PRG 303, `Form()`, `Depends(get_db)`, SQLite, Repository CRUD, 상세 전체 필드, 폼 취소 링크, 홈 링크 2개, Jinja2 SSR 검사를 포함했습니다.
- 입문자 가이드에 빠른 시작(Quick Start), 클릭 가능한 목차, Current Runtime Context, STOP/GO를 보완했습니다.
- 격리된 사전 재현 환경에서 홈/목록/등록/수정/삭제/303 Redirect/404/입력 검증/SQLite 생성 흐름을 점검했습니다.

판정:

```text
Pre-runtime static/reproduction audit: known BLOCKER 0 / known MAJOR 0
Actual MAC-V/WIN-V Runtime: NOT RUN
Final BLOCKER/MAJOR Gate: NOT YET
```

격리 사전 재현 결과는 실제 사용자 Runtime PASS나 Evidence로 승격하지 않습니다.

## Phase C에서만 완료

- [ ] 실제 Python 3.10+ 확인
- [ ] 실제 가상환경/패키지 설치
- [ ] 실제 `verify.sh` 실행
- [ ] 실제 localhost:8000 서버 기동
- [ ] 홈 화면 브라우저 확인
- [ ] CRUD 전체 브라우저 흐름
- [ ] 실제 303 Redirect / F5 중복 방지
- [ ] 실제 `database.db` 생성
- [ ] 실제 DB 행 조회
- [ ] 실제 Not Found
- [ ] README 재현성 확인
- [ ] Runtime Evidence
- [ ] 사용자 자기 말 평가 설명
- [ ] BLOCKER/MAJOR 최종 Gate
- [ ] `✅ B5-2 CLEAR`

## 판정

**Reference 핵심 기준본 + Pre-runtime Audit 완료 / Runtime 미시작 / CLEAR 아님**

다음 Gate는 지원 실행환경(MAC-V 또는 WIN-V)에서 Phase C Runtime을 시작하는 것입니다.
