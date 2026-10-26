# B6-2 · 00단계 | 쉽고 작은 학습부터 시작하기

> **00단계: PLAN_ONLY** · **01 공식 요구: NOT_STARTED** · **새 코드: NOT_STARTED / 승인 PENDING** · **실행·학습 성취: NOT_VERIFIED**

**30초 요약:** 이 미션은 **FastAPI로 만드는 CRUD 웹서비스**에 대해 배웁니다. 첫 번째 용어는 <mark>CRUD</mark>입니다. **개념 하나 → 그림 하나 → 질문 하나**를 이해한 후 다음으로 넘어가면 됩니다.

## 00단계의 4개 학습 영역

| 영역 | 바로가기 |
|---|---|
| A. 처음 시작하기 | [시작](#b62-00-start) |
| B. 기술 배우기 | [첫 개념·Mermaid](#b62-00-learn) |
| C. 진행 확인하기 | [현재 상태](#b62-00-status) |
| D. 상세 참고자료 | [더 알아보기](#b62-00-more) |

<a name="b62-00-start"></a>

## A. 처음 시작하기

**무엇을 배우나요?** FastAPI로 만드는 CRUD 웹서비스. 공식 필수 요구사항은 **01단계**에서 평가표 원문과 연결합니다.

**아래에서 한 가지 출발점을 선택하세요.**

- 처음 배우기 → 아래 **B. 기술 배우기**
- 전체 개념도·기술 용어 미리보기 → [기술 학습 개요](TECHNICAL-LEARNING-OUTLINE.md)
- 현재 진행 상태만 확인 → 아래 **C. 진행 확인하기**

<a name="b62-00-learn"></a>

## B. 기술 배우기 — 오늘은 한 개념만

### 오늘의 용어: CRUD

데이터를 생성(Create)·조회(Read)·수정(Update)·삭제(Delete)하는 네 가지 기본 기능을 묶어 부르는 말입니다.

**그림으로 보기 (교육용 개념도):**

```mermaid
flowchart LR
 A["사용자 요청"] --> B["API·DB 처리"]
 B --> C["생성·조회·수정·삭제 결과"]
```

**생각할 질문:** 게시글 내용을 바꾸는 작업은 CRUD 중 무엇인가요?

**답과 이유:** 수정(Update)에 해당합니다.
### 내 말로 설명·종이 재현 (Teach-back / Dry-run)

**두 문장으로 설명:** CRUD(Create, Read, Update, Delete)는 데이터를 만들고 읽고 수정하고 지우는 네 가지 기본 행동입니다. 웹서비스 요청이 어떤 종류인지 구분하도록 돕습니다.

**종이에 실행 흐름을 그려보세요.**
1. **입력:** 사용자가 게시글 수정을 요청했다고 가정.
2. **처리:** 요청값을 확인하고 수정 작업을 처리할 계획 세우기.
3. **예상 결과:** 수정된 내용 또는 오류를 응답한다고 예상.

**흔한 오해:** CRUD 네 작업이 실제로 성공했다는 주장은 HTTP 상태·데이터 결과·테스트 검증을 요구합니다.

<ins>교육용 가상 재현과 실제 신규 코드의 실행·테스트를 구분합니다.</ins> [한글·영어·약어 용어표](TECHNICAL-LEARNING-OUTLINE.md)를 더 읽어보세요.


다음 개념은 [B6-2 기술 학습 9요소](TECHNICAL-LEARNING-OUTLINE.md)에서 하나씩 확인하세요. 전체 학습 흐름은 **용어 → 개념 → 비유 → 아키텍처 → 주요 코드 → 실행 흐름 → 오류 해결 → 실습 → 평가**입니다.

<ins>위 그림은 실제 신규 코드나 시험 결과가 아닙니다. 신규 설계는 03단계, 구현은 별도 승인 후 04단계입니다.</ins>

<a name="b62-00-status"></a>

## C. 진행 확인하기

| 구분 | 상태 |
|---|---|
| **00단계 교육·계획 개요** | PLAN_ONLY — 문서 작성 |
| **01단계 공식 요구 분석** | NOT_STARTED |
| **03단계 상세 설계** | NOT_STARTED |
| **04단계 신규 코드** | NOT_STARTED / 승인 PENDING |
| **실제 실행·슬라이드·학습자 숙달** | NOT_VERIFIED 또는 NOT_STARTED |

**중요:** 계획/자료 반영 PASS와 **미션 기능 PASS·학습자 MASTER**는 다릅니다. 이전 Round의 결과는 보존합니다.

<a name="b62-00-more"></a>

## D. 상세 참고자료

| 더 알고 싶은 내용 | 문서 |
|---|---|
| 용어·아키텍처·학습 예정 코드 | [기술 학습 개요](TECHNICAL-LEARNING-OUTLINE.md) |
| PRIMM·AI 힌트·L1~L5 평가 계획 | [학습체계 계획](LEARNING-SYSTEM-PLAN.md) |
| 발표·학습·심화·복습 4종 자료 | [슬라이드 계획](SLIDE-PACKAGE-PLAN.md) |
| 후속 개발단계 | [01 요구](../01-requirements/README.md) · [02 분석](../02-analysis/README.md) · [03 설계](../03-design/README.md) |
| 전체 공통 교육 규칙 | [중앙 학습 표준](https://github.com/MetaStudy999/codyssey-basic/blob/main/standards/LEARNER-CENTERED-AI-LEARNING-STANDARD.md) |

**다음 단계:** 공식 미션 PDF 및 평가표를 확인하는 01단계입니다. 새로운 코드 개발·실행은 아직 승인되지 않았습니다.

---

## 기존 00단계 계획·승인 기록 (원문 보존)

**기존 제목:** B6-2 — 공식 요구·목차·승인

Round 04 Agent 전용 공간입니다. 현재 PLAN_ONLY: 승인 전 신규 구현·실행 없음. 이전 Round 자료 보존.

## 선행 단계

[01 공식 요구](../01-requirements/README.md) → [02 기존 분석](../02-analysis/README.md) → [03 신규 설계](../03-design/README.md). 계획 문서·승인 관리와 실제 구현·검증을 구분합니다.

## 4종 학습·발표 승인 (2026-10-26)

[계획](SLIDE-PACKAGE-PLAN.md): 발표 16장 · 학습 45장 · 심화 15~25장 · 복습 1~2장. **PLAN_ONLY**.

## 학습자 중심 AI 교육체계 승인 (2026-10-26)

[학습 통합 계획](LEARNING-SYSTEM-PLAN.md) · M01~M16, PRIMM, H1~H4, L1~L5, QG-01~08, 진단·회상 복습. 신규 구현·실제 학습 자료는 아직 미제작.

## 기술 학습 9요소 — 입문자용 개요 (2026-10-26)

[B6-2 기술 용어·개념·Mermaid 개념 아키텍처·주요 코드·실습·평가 안내](TECHNICAL-LEARNING-OUTLINE.md). **용어 → 개념 → 비유 → 아키텍처 → 주요 코드 → 실행 흐름 → 오류 해결 → 실습 → 평가**를 이번 미션 기술에 맞춰 적용합니다.

현재는 **PLAN_ONLY**이며 실제 신규 구현·실행·학습자 평가 **NOT_STARTED / NOT_VERIFIED**, 개발 승인 **PENDING**은 유지합니다.
