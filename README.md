# Codyssey Basic B5-2

## 🚀 빠른 시작(Quick Start)

처음 시작한다면 아래 순서만 따라갑니다.

1. [`training/round-01-clear/START-CHECK.md`](training/round-01-clear/START-CHECK.md) — 시작 전 지식 확인
2. [`training/round-01-clear/BEGINNER-GUIDE.md`](training/round-01-clear/BEGINNER-GUIDE.md) — 전체 수행 가이드
3. `training/round-01-clear/environment/verify.sh` — 실행 전 검증(Verification)
4. 실제 `localhost:8000` Runtime → CRUD → PRG → SQLite → Not Found 확인
5. [`training/round-01-clear/evidence/README.md`](training/round-01-clear/evidence/README.md) — 실제 증빙 자료(Evidence) 수집

```text
Reference Build / Pre-runtime Audit
≠ Runtime PASS
≠ Evidence Complete
≠ Mission CLEAR
```

## 📑 목차

- [구분](#구분)
- [시작 위치](#시작-위치)
- [공식 원본](#공식-원본)
- [Round 01 Reference Build](#round-01-reference-build)
- [현재 사전감사 상태](#현재-사전감사-상태)
- [상태](#상태)

## 구분

- 선택 미션 (OPTIONAL)
- 현재 훈련 체계: Round 01 — CLEAR
- 현재 작업 모드: Phase A — REFERENCE BUILD / PRE-RUNTIME AUDIT

## 시작 위치

`training/round-01-clear/BEGINNER-GUIDE.md`부터 진행합니다.

## 공식 원본

- `b5-2-mission.pdf`
- `b5-2-mission.md`
- `b5-2-evaluation.md`

공식 원본은 수정하지 않습니다. 훈련 결과는 `training/` 아래에서 차수별로 독립 관리합니다.

## Round 01 Reference Build

현재 `training/round-01-clear/reference/`에 Memo 단일 도메인의 FastAPI/Jinja2/SQLAlchemy/SQLite CRUD 기준본을 준비했습니다.

주요 준비물:

- 홈/목록/상세/등록/수정/삭제 서버 측 렌더링(Server-Side Rendering, SSR) 흐름
- `303` POST-리다이렉트-GET(Post-Redirect-Get, PRG)
- Router / Service / Repository / Model 분리
- `Depends(get_db)` DB Session 주입
- SQLite 직접 확인 도구
- Reference verify/setup/reset
- Requirements Mapping / Evaluation Q&A / Evidence Guide
- Beginner Guide / Checklist

## 현재 사전감사 상태

2026-08-31 기준으로 공식 Mission/Evaluation과 현재 `main`의 Reference를 다시 대조했습니다.

- 상세 화면의 **전체 모델 필드 표시** 요구에 맞춰 `id` 표시를 보완했습니다.
- `verify.sh`에 Python 3.10+, 공식 의존성 허용 목록, 전체 필드, 폼/홈/SSR 구조 검사를 추가했습니다.
- `BEGINNER-GUIDE.md`에 빠른 시작(Quick Start), 클릭 가능한 목차, STOP/GO 경로를 보완했습니다.
- 격리된 사전 재현 테스트에서 홈, 목록, 등록, 수정, 삭제, 303 Redirect, 404, 입력 검증, SQLite 생성 흐름을 확인했습니다.

이 사전 재현 테스트는 사용자 MAC-V/WIN-V의 실제 Runtime PASS나 Evidence를 대신하지 않습니다.

## 상태

**Reference 핵심 기준본 + Pre-runtime Audit 완료 / 실제 Runtime 미시작 / `✅ CLEAR` 아님**

실제 `localhost:8000`, 브라우저 CRUD, 303 Redirect/F5, SQLite 데이터, Not Found, README 재현, Evidence는 Phase C에서 실제 지원 실행환경에서 검증합니다.
