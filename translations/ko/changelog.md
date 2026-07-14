# 변경 로그 - AZD 초보자용

## 소개

이 변경 로그는 AZD 초보자용 저장소에 대한 모든 주요 변경 사항, 업데이트 및 개선 사항을 문서화합니다. 우리는 의미 있는 버전 관리 원칙을 따르며, 사용자가 버전 간 변경 사항을 이해하는 데 도움이 되도록 이 로그를 유지합니다.

## 학습 목표

이 변경 로그를 검토함으로써, 여러분은:
- 새로운 기능과 콘텐츠 추가에 대해 정보를 얻을 수 있습니다.
- 기존 문서에 이루어진 개선 사항을 이해할 수 있습니다.
- 정확성을 보장하기 위해 버그 수정 및 정정 사항을 추적할 수 있습니다.
- 학습 자료의 발전 과정을 시간에 따라 따라갈 수 있습니다.

## 학습 성과

변경 로그 항목을 검토한 후, 여러분은 다음을 할 수 있게 됩니다:
- 학습에 사용할 수 있는 새로운 콘텐츠와 자원을 식별합니다.
- 어떤 섹션이 업데이트되었거나 개선되었는지 이해합니다.
- 최신 자료를 기반으로 학습 경로를 계획합니다.
- 향후 개선을 위한 피드백과 제안을 제공합니다.

## 버전 내역

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 갱신: 버전 최신화 업데이트
**이 버전은 `azd` `1.27.1` (2026년 7월, 최신 안정 릴리스) 및 현재 프리뷰 AI 에이전트 확장 `azure.ai.agents` `1.0.0-beta.5`에 대한 강좌의 유효성을 재검증하여 1.26.0, 1.27.0, 1.27.1 릴리스 후 모든 "검증됨" 배너를 최신 상태로 만듭니다.**

#### 변경 사항
- <strong>✅ 검증 기준선 업데이트</strong>가 루트 README, 모든 챕터 README, 챕터 1 개발 컨테이너 강의(고정 버전 예제 포함), 챕터 4 사용자 지정 템플릿 강의, 챕터 5 다중 에이전트 강의, 워크숍 문서 전반에 `azd 1.25.6` (2026년 6월)에서 `azd 1.27.1` (2026년 7월)으로 변경됨
- <strong>🤖 챕터 2 기준선 갱신</strong>이 `azd 1.23.12` (2026년 3월)에서 `azd 1.27.1`로 `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, `microsoft-foundry-integration.md`에 적용되고 검증 노트 날짜가 2026-07-13로 업데이트됨
- <strong>🧩 AI 에이전트 확장 버전 상승</strong>이 챕터 2 README 및 `agents.md`에서 `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview`에서 현재 `1.0.0-beta.5` 릴리스로 변경됨
- **🧪 워크숍 검증 예제**(`azd version` 출력)가 `1.27.1`으로 업데이트됨

#### 관련 azd 릴리스 참고 (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions Flex Consumption 용 Go 지원, `azd config sub-filter` 테넌트별 구독 필터, 독립 실행형 확장 번들(`azd x pack --bundle`), 및 `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** `azure.yaml`에서 직접 Azure AI Foundry 프로젝트/에이전트 모델링(비셉/테라폼 불필요 초기화), App Service용 컨테이너 배포 지원(`host: appservice` + `language: docker`), `azd extension` 명령어에 대한 직접 `-s/--source`, 및 `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install`에 `--no-dependencies` 플래그 추가, 기본적으로 카탈로그/쿼터 프롬프트에서 제외된 사용 중단 모델, 및 여러 버그 수정

#### 업데이트된 파일
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### 초보자 갭 채우기 #2: 템플릿 작성, 개발 컨테이너, Pulumi, Azure DevOps, 서비스 프린시펄, 기타
**이 버전은 azd-커버리지 분석에서 드러난 나머지 중급 격차를 해소합니다: 나만의 템플릿 작성 및 게시 방법, 재현 가능한 개발 컨테이너 및 Codespaces 환경, Pulumi 인프라 제공자, Azure DevOps CI/CD 워크스루, 서비스 프린시펄 인증, 호스트 선택 가이드(AKS/Spring Apps), `azd restore`/`azd package` 설명, 훅 에러 처리, 팀/공유 환경 실습 등입니다.**

#### 추가됨
- **🧱 새로운 챕터 4 강의** `docs/chapter-04-infrastructure/custom-templates.md` — 직접 azd 템플릿 작성하기: 필요한 구조(`azure.yaml`, `infra/`, `src/`), `metadata.template` 필드, `uniqueString()` 리소스 토큰과 `azd-env-name` 태그를 통한 인프라 매개변수화, `azd init --template <local-path>`로 로컬 테스트, GitHub에 게시, Awesome AZD 갤러리 제출
- **📦 새로운 챕터 1 강의** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers와 GitHub Codespaces를 사용한 재현 가능한 azd 환경: 공식 `ghcr.io/azure/azure-dev/azd` 피처를 활용한 최소 `.devcontainer/devcontainer.json`, 언어별 피처, 컨테이너 호스트용 `docker-in-docker`, 원격 로그인용 `azd auth login --use-device-code`
- **🧩 azd와 Pulumi** 섹션이 `docs/chapter-04-infrastructure/provisioning.md`에 추가됨 — `infra.provider: pulumi`, Pulumi 폴더 구조, azd 환경에 매핑된 스택, 필수 출력/태깅, 동일한 `azd up` / `azd down` 워크플로우
- <strong>🎯 호스트 선택 가이드</strong>가 `docs/chapter-04-infrastructure/provisioning.md`에 추가됨 — 초보자용 `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, `springapp` 비교 및 AKS 또는 Azure Spring Apps 선택 시기 안내
- <strong>🛠️ Azure DevOps CI/CD 워크스루</strong>가 `docs/chapter-08-production/production-ai-practices.md`에 추가됨 — `azd pipeline config --provider azdo`, 작업 부하 ID 연합(OIDC)을 이용한 서비스 연결, 생성된 `azure-dev.yml`, 변수 그룹 설정
- **🔑 서비스 프린시펄(패턴 4)** 가 `docs/chapter-03-configuration/authsecurity.md`에 추가됨 — `az ad sp create-for-rbac`, 클라이언트 시크릿과 연합/OIDC 인증을 이용한 비대화형 `azd auth login`, 사용 시기 및 안전한 자격 증명 저장법
- **🪝 훅 에러 처리** 소단원이 `docs/chapter-04-infrastructure/deployment-guide.md`에 추가됨 — 종료 코드와 `set -e`, `continueOnError`, `azd hooks run`을 사용한 훅 개별 테스트, 운영체제별 셸, `--debug`
- **👥 팀 / 공유 환경** 섹션이 `docs/chapter-03-configuration/configuration.md`에 추가됨 — `.azure/`의 내용, gitignore 대상, 개발자별 환경, `azd env list`/`select` 명령, CI/CD에서 환경 값 제공 방법
- **🧰 `azd restore` 및 확장된 `azd package`** 설명이 `resources/cheat-sheet.md`에 추가됨 — 의존성 복원 및 배포 없이 배포 가능한 아티팩트 빌드

#### 변경됨
- <strong>🧭 챕터 4 강의 테이블</strong>에 "직접 템플릿 작성하기" 새 강의(Lesson 3)가 추가됨
- <strong>🧭 챕터 1 강의 테이블</strong>에 "Dev Containers & Codespaces" 새 강의(Lesson 5)가 추가됨; `bring-your-own-app.md`와 `dev-containers.md` 사이의 내비게이션 하단 연결 추가

### [v3.21.0] - 2026-06-16

#### 초보자 갭 채우기: 실습 다중 에이전트 강의, "내 앱 추가하기", Terraform, CI/CD 워크스루
**이 버전은 두 개의 새 실습 강의(배포 가능한 다중 에이전트 워크스루와 기존 앱에 azd 추가하기), 초보자용 훅 소개, azd와 함께하는 Terraform 섹션, 단계별 GitHub Actions 파이프라인 워크스루, 새 프리뷰 확장 기능 설명, 명시적 배포 검증 체크리스트를 추가하여 완전한 초보자 가이드를 완성합니다.**

#### 추가됨
- **🤝 새로운 챕터 5 강의** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 실습 기반 완전 배포 가능한 2 에이전트 워크스루(오케스트레이터 + 전문가)로 `contoso-creative-writer` 실제 템플릿 사용, 다중 에이전트 사용 시기, `azd up` 워크플로우, 배포된 리소스 이해, 에이전트 간 트레이싱, 맞춤화, 정리
- **📦 새로운 챕터 1 강의** `docs/chapter-01-foundation/bring-your-own-app.md` — 기존 프로젝트에 `azd init`으로 azd 추가하기("현재 디렉터리 코드 사용"), `azure.yaml` 및 `infra/` 이해, `azd infra generate`, 호스트 감지, `azd up`으로 배포
- **🌐 azd와 Terraform** 섹션이 `docs/chapter-04-infrastructure/provisioning.md`에 추가됨 — `infra.provider: terraform` 설정, `.tf` 폴더 구조, 필수 `AZURE_*` 출력 및 `azd-env-name` 태그, 동일한 `azd up` / `azd down` 워크플로우 (Terraform 지원은 명시되었으나 이전엔 비셉만 보여준 갭 해소)
- <strong>⚙️ 단계별 GitHub Actions 워크스루</strong>가 `docs/chapter-08-production/production-ai-practices.md`에 추가됨 — GitHub 저장소부터 자동 배포까지: `azd pipeline config`, 시크릿 저장 없는 OIDC 연합 인증, 생성된 `azure-dev.yml`, 시크릿 대 변수 사용 가이드
- <strong>🪝 초보자용 "훅이란?" 소개</strong>가 `docs/chapter-04-infrastructure/deployment-guide.md`에 추가됨 — 훅이란, 훅 단계 표, 최소한의 첫 훅, 수동 훅 실행(`azd hooks run`)
- <strong>✅ "배포 확인하기" 체크리스트</strong>가 `docs/chapter-01-foundation/first-project.md` 5단계에 추가됨 — 스모크 테스트, 상태 엔드포인트 점검, 명확한 성공 기준
- **🧩 새 프리뷰 확장 기능 설명** `azure.ai.skills` 및 `azure.ai.connections`가 `docs/chapter-08-production/production-ai-practices.md`에 추가됨 (의미와 사용 시기 안내)

#### 변경됨
- **🧭 챕터 5 강의 테이블** 수정: `multi-agent-basics.md`가 이제 1강(유일한 실습 강의)으로 변경되고, 2강은 챕터 6에서 다루며 소매 시나리오는 아키텍처 청사진이지 단일 명령 템플릿이 아님을 명확히 함
- <strong>🧭 챕터 1 강의 테이블</strong>에 새 "내 앱 추가하기" 강의(4강) 포함
- **🔗 내비게이션 하단** 업데이트: `first-project.md`가 앞으로 `bring-your-own-app.md`를 링크하도록 변경

#### 수정됨
- **🧱 누락된 Terraform 갭 해소** — 강좌에서 Terraform 지원을 언급했으나 보여주지 않던 부분을 해결함
- **🔀 오해 소지가 있는 챕터 5 교차 링크 수정** — 전체 다중 에이전트 구현이 있다고 오해할 수 있었던 링크 정정(실제는 아키텍처 청사진임)

#### 업데이트된 파일
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(새로 추가됨)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(새로 추가됨)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 갱신, 전체 에이전트 수명 주기 명령 및 Aspire 리브랜딩

**이 버전은 `azd` `1.25.6` (2026년 6월) 및 `azure.ai.agents` `0.1.40-preview` 확장에 대해 과정을 재검증하고, AI 가이드를 "에이전트 구성"에서 완전한 에이전트 수명 주기(테스트 → 평가 → 최적화 → 검사 → 삭제)로 확장하며, 새로운 `azure.ai.skills` 및 `azure.ai.connections` 미리보기 확장을 소개하고, ".NET Aspire" → "Aspire" 제품 리브랜딩을 알립니다.**

#### 추가됨
- **🔁 초보자와 AI 엔지니어를 위한 전체 에이전트 수명 주기 커버리지** 문서 전반에 걸쳐:
  - `docs/chapter-01-foundation/azd-basics.md` — 확장 및 AI 명령 섹션에 수명 주기 표(구성 → 테스트 → 측정 → 개선 → 검사 → 정리) 추가
  - `docs/chapter-08-production/production-ai-practices.md` — `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, `delete --force`를 다루는 새로운 "에이전트 수명 주기 관리" 섹션
  - `resources/cheat-sheet.md` — `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, `delete --force`가 확장된 AI 에이전트 명령어
- **🧩 새 미리보기 확장 문서화**: `azure.ai.skills` (재사용 가능한 에이전트 스킬) 및 `azure.ai.connections` (Foundry 연결) 추가, 확장 테이블과 치트 시트에 포함
- **⏱️ 응답 시간 지침** — `azd ai agent invoke` 예제에서 총 지연 시간과 첫 바이트 시간 출력이 언급됨
- **📌 버전 배너** 루트 README에 `azd version` 및 `azd upgrade` 안내 표시

#### 변경됨
- **✅ 검증 기준선 업그레이드** 모든 챕터 README와 워크숍 문서에서 `azd 1.23.12`(2026년 3월)에서 `azd 1.25.6`(2026년 6월)로 업데이트
- **🤖 챕터 2 확장 노트** `azure.ai.agents` `0.1.18-preview`에서 `0.1.40-preview`로 업데이트
- **🧪 워크숍 검증 예제** (`azd version` 출력) `1.25.6`으로 업데이트
- **🧭 README "오늘의 azd 신규 기능"** 에이전트 수명 주기 전반, 새로운 AI 확장, 최근 품질 개선 사항(`azd init` 멱등성, `azd auth login` 만료 토큰 클리어, `azd tool` 첫 실행 프롬프트) 강조
- **📖 챕터 2 agents.md (옵션 4)** 배포 후 수명 주기 명령으로 안내, `azd up`에서 멈추지 않도록 수정

#### 수정됨
- **🏷️ 제품 명명** Aspire 리브랜딩 노트 추가 (".NET Aspire"는 단순히 "Aspire"로 변경); azd의 Aspire 지원은 변경 없음
- **🔎 실시간 릴리스 검증** Azure 개발자 CLI 릴리스 피드와 일치 확인: 안정 CLI `1.25.6` (2026-06-12) 및 `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### 업데이트된 파일
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### 초보자 온보딩 명확화, 설정 검증 및 최종 AZD 명령어 정리
**이 버전은 AZD 1.23 검증 점검 후속으로, 초보자 중심 문서 작업을 진행했습니다: AZD 우선 인증 지침을 명확히 하고, 로컬 설정 검증 스크립트를 추가하며, 주요 명령어를 실시간 AZD CLI와 대조 검증하고, 변경 로그 외에 마지막 남은 구식 영어 원본 명령어 참조를 제거했습니다.**

#### 추가됨
- **🧪 초보자용 설정 검증 스크립트** `validate-setup.ps1` 및 `validate-setup.sh`로 1장 시작 전에 필수 도구 확인 가능
- **✅ 사전 설정 검증 단계** 루트 README와 1장 README에 추가되어 `azd up` 이전에 누락된 필수 조건 잡아냄

#### 변경됨
- **🔐 초보자 인증 안내** `azd auth login`을 AZD 워크플로우 주 경로로 일관되게 취급, Azure CLI 명령 직접 사용 시가 아니면 `az login`은 선택적임을 명시
- **📚 1장 온보딩 흐름** 설치, 인증, 첫 배포 전에 로컬 설정 검증하도록 안내
- **🛠️ 검증기 메시징** AZD 전용 경로에서 차단 요구사항과 선택적 Azure CLI 경고를 명확히 구분
- **📖 구성, 문제 해결, 예제 문서** 필수 AZD 인증과 선택적 Azure CLI 로그인 구분하여 문맥 없이 혼용되던 점 수정

#### 수정됨
- **📋 남은 영어 원본 명령어 참조** 최신 AZD 명령어(`azd config show` 치트 시트, Azure 포털 개요 대신 `azd monitor --overview`)로 업데이트
- **🧭 1장 초보자 설명** 모든 템플릿 및 Azure 리소스에서 오류 없는 보장 또는 롤백 동작을 과도하게 약속하지 않도록 완화
- **🔎 실시간 CLI 검증** `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, `azd down --force --purge` 현행 지원 확인

#### 업데이트된 파일
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 검증, 워크숍 환경 확장 및 AI 모델 갱신
**이 버전은 `azd` `1.23.12` 문서 검증 점검을 수행하고, 구식 AZD 명령어 예제를 업데이트하며, AI 모델 가이드를 최신 기본값으로 갱신하고, 워크숍 지침을 GitHub Codespaces를 넘어 개발 컨테이너 및 로컬 복제까지 지원하도록 확장합니다.**

#### 추가됨
- **✅ 핵심 챕터 및 워크숍 문서 전반에 걸친 검증 주석** 최신 또는 이전 CLI 빌드를 사용하는 학습자에게 테스트된 AZD 기준선을 명확히 알림
- **⏱️ 긴 AI 앱 배포 타임아웃 가이드** `azd deploy --timeout 1800` 사용법 문서화
- **🔎 AI 워크플로우 문서에 확장 검사 단계** `azd extension show azure.ai.agents` 추가
- **🌐 워크숍 환경 가이드 확장** GitHub Codespaces 외에 dev 컨테이너와 로컬 복제 지원, MkDocs 활용

#### 변경됨
- **📚 챕터 소개 README** 기초, 구성, 인프라, 다중 에이전트, 배포 전, 문제 해결, 프로덕션 섹션 전반에 걸쳐 `azd 1.23.12` 검증 명시 일관화
- **🛠️ AZD 명령어 참조** 문서 전반 최신 형태로 업데이트:
  - `azd config list` → `azd config show`
  - `azd env show` → 맥락에 따라 `azd env list` 또는 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights 개요 지향 시 `azd monitor --overview`
- **🧪 프리뷰 프로비전 예제** 지원되는 현재 사용법(`azd provision --preview` 및 `azd provision --preview -e production`)로 간소화
- **🧭 워크숍 흐름** Codespaces 전용 실행 가정 대신 Codespaces, dev 컨테이너, 로컬 복제 환경에서 실습 완료 가능하도록 업데이트
- **🔐 인증 안내** AZD 워크플로우에 `azd auth login` 선호, Azure CLI 명령 직접 사용 시에만 `az login` 선택적 위치 강조

#### 수정됨
- **🪟 윈도우 설치 명령어** 설치 가이드에서 최신 `winget` 패키지 대소문자 표준화
- **🐧 리눅스 설치 안내** 지원하지 않는 배포판별 `azd` 패키지 관리자 명령 제거, 적절 시 릴리스 자산으로 안내 변경
- **📦 AI 모델 예제** `gpt-35-turbo`, `text-embedding-ada-002` 같은 구형 기본값에서 `gpt-4.1-mini`, `gpt-4.1`, `text-embedding-3-large`와 같은 최신 예제로 갱신
- **📋 배포 및 진단 스니펫** 로그, 스크립트, 문제 해결 단계에서 현재 환경과 상태 명령으로 수정
- **⚙️ GitHub Actions 안내** `Azure/setup-azd@v1.0.0`에서 `Azure/setup-azd@v2`로 업데이트
- **🤖 MCP/Copilot 동의 안내** `azd mcp consent`에서 `azd copilot consent list`로 변경

#### 개선됨
- **🧠 AI 챕터 안내** 프리뷰 민감 `azd ai` 동작, 테넌트별 로그인, 현재 확장 사용법, 최신 모델 배포 권장 사항 더 잘 설명
- **🧪 워크숍 지침** 보다 현실적인 버전 예제 및 명확한 환경 설정 언어 사용으로 실습 강화
- **📈 프로덕션 및 문제 해결 문서** 현재 모니터링, 대체 모델, 비용 등급 예제와 더 잘 일치하도록 개선

#### 업데이트된 파일
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 명령어, 콘텐츠 검증 및 템플릿 확장
**이 버전은 모든 AI 관련 챕터에 `azd ai`, `azd extension`, `azd mcp` 명령어를 추가하고, agents.md의 깨진 링크와 사용 중단된 코드를 수정하며, 치트 시트를 업데이트하고, 검증된 설명과 새로운 Azure AI AZD 템플릿으로 예제 템플릿 섹션을 개편합니다.**

#### 추가됨
- **🤖 7개 파일에 걸친 AZD AI CLI 커버리지 추가** (이전엔 챕터 8에만 존재):
  - `docs/chapter-01-foundation/azd-basics.md` — `azd extension`, `azd ai agent init`, `azd mcp`를 소개하는 새로운 "확장과 AI 명령어" 섹션
  - `docs/chapter-02-ai-development/agents.md` — 옵션 4: 템플릿과 매니페스트 접근 방식 비교표와 함께 `azd ai agent init`
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry용 AZD 확장"과 "에이전트 우선 배포" 하위 섹션

  - `docs/chapter-05-multi-agent/README.md` — 빠른 시작에서 템플릿 및 매니페스트 기반 배포 경로 모두 표시
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 배포 섹션에 `azd ai agent init` 옵션 포함
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "진단을 위한 AZD AI 확장 명령어" 하위 섹션 추가
  - `resources/cheat-sheet.md` — `azd extension`, `azd ai agent init`, `azd mcp`, 및 `azd infra generate`가 포함된 새 "AI 및 확장 명령어" 섹션
- <strong>📦 새로운 AZD AI 예제 템플릿</strong>가 `microsoft-foundry-integration.md`에 추가됨:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, 음성 채팅 지원을 포함한 .NET RAG 채팅
  - **azure-search-openai-demo-java** — Langchain4J를 사용한 Java RAG 채팅, ACA/AKS 배포 옵션 포함
  - **contoso-creative-writer** — Azure AI 에이전트 서비스, Bing Grounding, Prompty를 활용한 다중 에이전트 창작 작가 앱
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB 기반의 서버리스 RAG, Ollama 로컬 개발 지원 포함
  - **chat-with-your-data-solution-accelerator** — 관리자 포털, Teams 통합, PostgreSQL/Cosmos DB 옵션이 포함된 엔터프라이즈 RAG 가속기
  - **azure-ai-travel-agents** — .NET, Python, Java, TypeScript 서버를 사용하는 다중 에이전트 MCP 오케스트레이션 참조 앱
  - **azd-ai-starter** — 최소한의 Azure AI 인프라 Bicep 시작 템플릿
  - **🔗 놀라운 AZD AI 갤러리 링크** — [awesome-azd AI 갤러리](https://azure.github.io/awesome-azd/?tags=ai) 참조 (80개 이상 템플릿)

#### 수정됨
- **🔗 agents.md 내비게이션**: 이전/다음 링크가 2장 README 수업 순서와 일치하도록 수정됨 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md 깨진 링크**: `production-ai-practices.md`가 `../chapter-08-production/production-ai-practices.md`로 수정됨 (3회 발생)
- **📦 agents.md Deprecated 코드**: `opencensus`를 `azure-monitor-opentelemetry` + OpenTelemetry SDK로 교체
- **🐛 agents.md 잘못된 API**: `max_tokens` 매개변수가 `create_agent()`에서 `create_run()`의 `max_completion_tokens`로 이동
- **🔢 agents.md 토큰 계산**: 대략적인 `len//4` 추정 대신 `tiktoken.encoding_for_model()` 사용으로 교체
- **azure-search-openai-demo**: 서비스 명칭을 "Cognitive Search + App Service"에서 "Azure AI Search + Azure Container Apps"로 수정함 (2024년 10월 기본 호스트 변경)
- **contoso-chat**: 설명을 Azure AI Foundry + Prompty 참조로 업데이트하여 저장소의 실제 제목과 기술 스택에 맞춤

#### 제거됨
- **ai-document-processing**: 작동하지 않는 템플릿 참조 제거함 (AZD 템플릿으로 공개되지 않음)

#### 향상됨
- **📝 agents.md 연습 문제**: 연습 1은 예상 출력 및 `azd monitor` 단계 포함; 연습 2는 완전한 `FunctionTool` 등록 코드 포함; 연습 3은 모호한 지침 대신 구체적 `prepdocs.py` 명령어로 대체
- **📚 agents.md 자료**: 최신 Azure AI Agent Service 문서 및 빠른 시작 링크로 업데이트
- **📋 agents.md 다음 단계 표**: 챕터 전체 커버리지를 위한 AI 워크숍 실습 링크 추가

#### 업데이트된 파일
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### 강의 탐색 개선
**이번 버전에서는 README.md 챕터 내비게이션을 개선된 표 형식으로 개선했습니다.**

#### 변경됨
- **강의 지도 표**: 직접 수업 링크, 소요 시간 예측, 난이도 평점으로 강화됨
- **폴더 정리**: 중복된 옛 폴더(deployment/, getting-started/, pre-deployment/, troubleshooting/) 제거
- **링크 검증**: 강의 지도 표 내 모든 21개 이상의 내부 링크 검증 완료

### [v3.16.0] - 2026-02-05

#### 제품명 업데이트
**이번 버전은 제품 참조를 최신 Microsoft 브랜드로 업데이트합니다.**

#### 변경됨
- **Microsoft Foundry → Microsoft Foundry**: 번역되지 않은 파일 내 모든 참조 업데이트
- **Azure AI Agent Service → Foundry Agents**: 서비스 이름을 최신 브랜드에 맞게 수정

#### 업데이트된 파일
- `README.md` - 메인 강의 랜딩 페이지
- `changelog.md` - 버전 기록
- `course-outline.md` - 강의 구조
- `docs/chapter-02-ai-development/agents.md` - AI 에이전트 가이드
- `examples/README.md` - 예제 문서
- `workshop/README.md` - 워크숍 랜딩 페이지
- `workshop/docs/index.md` - 워크숍 인덱스
- `workshop/docs/instructions/*.md` - 모든 워크숍 지침 파일

---

### [v3.15.0] - 2026-02-05

#### 주요 저장소 재구성: 챕터 기반 폴더 이름 변경
**이번 버전에서는 더 명확한 탐색을 위해 문서를 전용 챕터 폴더로 재구성했습니다.**

#### 폴더 이름 변경
옛 폴더들이 챕터 번호가 붙은 폴더로 대체됨:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 신규 폴더 추가: `docs/chapter-05-multi-agent/`

#### 파일 이동
| 파일 | 이전 위치 | 새 위치 |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| 모든 pre-deployment 파일 | pre-deployment/ | chapter-06-pre-deployment/ |
| 모든 troubleshooting 파일 | troubleshooting/ | chapter-07-troubleshooting/ |

#### 추가됨
- **📚 챕터 README 파일**: 각 챕터 폴더에 README.md 생성, 다음 포함:
  - 학습 목표 및 소요 시간
  - 설명이 포함된 수업 테이블
  - 빠른 시작 명령어
  - 다른 챕터로의 내비게이션

#### 변경됨
- **🔗 모든 내부 링크 업데이트**: 78개 이상 경로가 모든 문서 파일에서 수정됨
- **🗺️ 메인 README.md**: 새 챕터 구조에 맞게 강의 지도 업데이트
- **📝 examples/README.md**: 챕터 폴더 참조 수정

#### 제거됨
- 옛 폴더 구조 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 저장소 재구성: 챕터 내비게이션
**이번 버전은 챕터 내비게이션 README 파일을 추가함(v3.15.0에서 대체됨).**

---

### [v3.13.0] - 2026-02-05

#### 신규 AI 에이전트 가이드
**이번 버전은 Azure Developer CLI로 AI 에이전트를 배포하는 종합 가이드를 추가했습니다.**

#### 추가됨
- **🤖 docs/microsoft-foundry/agents.md**: 다음 내용 포함 완전 가이드:
  - AI 에이전트란 무엇이며 챗봇과 다른 점
  - 세 가지 빠른 시작 에이전트 템플릿 (Foundry Agents, Prompty, RAG)
  - 에이전트 아키텍처 패턴 (단일 에이전트, RAG, 다중 에이전트)
  - 도구 구성 및 맞춤 설정
  - 모니터링 및 메트릭 추적
  - 비용 고려 및 최적화
  - 일반적인 문제 해결 시나리오
  - 성공 기준이 포함된 세 가지 실습 연습

#### 내용 구성
- <strong>소개</strong>: 초보자용 에이전트 개념 설명
- **빠른 시작**: `azd init --template get-started-with-ai-agents`로 에이전트 배포
- **아키텍처 패턴**: 에이전트 패턴 시각 다이어그램
- <strong>구성</strong>: 도구 설정 및 환경 변수
- <strong>모니터링</strong>: Application Insights 통합
- **연습 문제**: 점진적 실습 학습 (각 20-45분)

---

### [v3.12.0] - 2026-02-05

#### DevContainer 환경 업데이트
**이번 버전은 AZD 학습 경험을 위한 최신 도구 및 개선된 기본값과 함께 개발 컨테이너 구성을 업데이트합니다.**

#### 변경됨
- **🐳 베이스 이미지**: `python:3.12-bullseye`에서 `python:3.12-bookworm`(최신 Debian 안정판)으로 업데이트
- **📛 컨테이너 이름**: "Python 3"에서 "AZD for Beginners"로 명확하게 변경

#### 추가됨
- **🔧 신규 Dev Container 기능**:
  - Bicep 지원이 활성화된 `azure-cli`
  - AZD 템플릿을 위한 LTS 버전인 `node:20`
  - 템플릿 관리용 `github-cli`
  - 컨테이너 앱 배포를 위한 `docker-in-docker`

- **🔌 포트 포워딩**: 일반 개발 용도로 사전 구성된 포트:
  - 8000 (MkDocs 미리보기)
  - 3000 (웹 앱)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 신규 VS Code 확장**:
  - `ms-python.vscode-pylance` - 향상된 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 지원
  - `ms-azuretools.vscode-docker` - Docker 지원
  - `ms-azuretools.vscode-bicep` - Bicep 언어 지원
  - `ms-azure-devtools.azure-resource-groups` - Azure 리소스 관리
  - `yzhang.markdown-all-in-one` - Markdown 편집
  - `DavidAnson.vscode-markdownlint` - Markdown 린팅
  - `bierner.markdown-mermaid` - Mermaid 다이어그램 지원
  - `redhat.vscode-yaml` - YAML 지원 (azure.yaml용)
  - `eamodio.gitlens` - Git 시각화
  - `mhutchie.git-graph` - Git 히스토리

- **⚙️ VS Code 설정**: Python 인터프리터, 저장 시 포맷 및 공백 제거의 기본 설정 추가

- **📦 requirements-dev.txt 업데이트**:
  - MkDocs minify 플러그인 추가
  - 코드 품질을 위한 pre-commit 추가
  - Azure SDK 패키지 추가 (azure-identity, azure-mgmt-resource)

#### 수정됨
- **Post-Create 명령**: 컨테이너 시작 시 AZD 및 Azure CLI 설치 확인 기능 추가

---

### [v3.11.0] - 2026-02-05

#### 초보자 친화적 README 개편
**이번 버전에서는 README.md를 초보자에게 더 접근하기 쉽게 크게 개선하고 AI 개발에 필수적인 자료를 추가했습니다.**

#### 추가됨
- **🆚 Azure CLI vs AZD 비교**: 각 툴을 언제 사용해야 하는지 실용적 예제로 명확히 설명
- **🌟 놀라운 AZD 링크**: 커뮤니티 템플릿 갤러리 및 기여 자료의 직접 링크:
  - [Awesome AZD 갤러리](https://azure.github.io/awesome-azd/) - 200개 이상의 배포 준비된 템플릿
  - [템플릿 제출하기](https://github.com/Azure/awesome-azd/issues) - 커뮤니티 기여
- **🎯 빠른 시작 가이드**: 간소화된 3단계 시작 섹션 (설치 → 로그인 → 배포)
- **📊 경험 기반 내비게이션 표**: 개발자 경험에 따른 명확한 시작 지침

#### 변경됨
- **README 구조**: 점진적 공개 방식으로 재구성 - 주요 정보 우선 제공
- **소개 섹션**: 완전 초보자를 위한 "azd up의 마법" 설명으로 재작성
- **중복 콘텐츠 제거**: 중복된 문제 해결 섹션 제거
- **문제 해결 명령어**: `azd logs` 참조를 유효한 `azd monitor --logs`로 수정

#### 수정됨

- **🔐 인증 명령어**: `azd auth login` 및 `azd auth logout`를 cheat-sheet.md에 추가
- **잘못된 명령어 참조**: README 문제 해결 섹션에서 남아 있던 `azd logs` 제거

#### 참고
- <strong>범위</strong>: 주요 README.md 및 resources/cheat-sheet.md에 변경사항 적용
- **대상 독자**: AZD를 처음 접하는 개발자를 위한 개선 사항

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 명령어 정확도 업데이트
**이번 버전은 존재하지 않는 AZD 명령어들을 문서 전반에서 수정하여 모든 코드 예제가 유효한 Azure Developer CLI 구문을 사용하도록 보장합니다.**

#### 수정됨
- **🔧 존재하지 않는 AZD 명령어 제거**: 잘못된 명령어에 대한 포괄적 감사 및 수정:
  - `azd logs` (존재하지 않음) → `azd monitor --logs` 또는 Azure CLI 대체로 교체
  - `azd service` 하위 명령어 (존재하지 않음) → `azd show` 및 Azure CLI로 교체
  - `azd infra import/export/validate` (존재하지 않음) → 제거 또는 올바른 대안으로 교체
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 플래그 (존재하지 않음) → 제거
  - `azd provision --what-if/--rollback` 플래그 (존재하지 않음) → `--preview` 사용으로 업데이트
  - `azd config validate` (존재하지 않음) → `azd config list`로 교체
  - `azd info`, `azd history`, `azd metrics` (존재하지 않음) → 제거

- **📚 명령어 수정 적용 파일**:
  - `resources/cheat-sheet.md`: 명령어 참조의 대대적 정비
  - `docs/deployment/deployment-guide.md`: 롤백 및 배포 전략 수정
  - `docs/troubleshooting/debugging.md`: 로그 분석 섹션 수정
  - `docs/troubleshooting/common-issues.md`: 문제 해결 명령어 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD 디버깅 섹션 수정
  - `docs/getting-started/azd-basics.md`: 모니터링 명령어 수정
  - `docs/getting-started/first-project.md`: 모니터링 및 디버깅 예제 업데이트
  - `docs/getting-started/installation.md`: 도움말 및 버전 예제 수정
  - `docs/pre-deployment/application-insights.md`: 로그 보기 명령어 수정
  - `docs/pre-deployment/coordination-patterns.md`: 에이전트 디버깅 명령어 수정

- **📝 버전 참조 업데이트**:
  - `docs/getting-started/installation.md`: 고정된 `1.5.0` 버전을 일반화된 `1.x.x`로 변경, 릴리스 링크 포함

#### 변경됨
- **롤백 전략**: AZD는 기본 롤백 기능이 없으므로 Git 기반 롤백 문서로 업데이트
- **로그 보기**: `azd logs` 참조를 `azd monitor --logs`, `azd monitor --live`, Azure CLI 명령어로 교체
- **성능 섹션**: 존재하지 않는 병렬/증분 배포 플래그 제거, 올바른 대안 제시

#### 기술 세부사항
- **유효한 AZD 명령어**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **유효한 azd monitor 플래그**: `--live`, `--logs`, `--overview`
- **제거된 기능**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 참고
- <strong>검증</strong>: 명령어는 Azure Developer CLI v1.23.x에 대해 검증됨

---

### [v3.9.0] - 2026-02-05

#### 워크숍 완료 및 문서 품질 업데이트
**이번 버전은 인터랙티브 워크숍 모듈을 완료하며, 모든 깨진 문서 링크를 수정하고, Microsoft AZD를 사용하는 AI 개발자를 위한 내용 품질을 향상합니다.**

#### 추가됨
- **📝 CONTRIBUTING.md**: 새로운 기여 가이드 문서로:
  - 이슈 보고 및 변경 제안 명확한 지침
  - 신규 콘텐츠 문서화 표준
  - 코드 예제 가이드라인 및 커밋 메시지 규칙
  - 커뮤니티 참여 정보

#### 완료됨
- **🎯 워크숍 모듈 7 (마무리)**: 완전히 완료된 마무리 모듈로:
  - 워크숍 성과의 포괄적 요약
  - AZD, 템플릿, Microsoft Foundry 핵심 개념 숙달 섹션
  - 학습 여정 계속 추천
  - 난이도 평가가 포함된 워크숍 도전 과제
  - 커뮤니티 피드백 및 지원 링크

- **📚 워크숍 모듈 3 (분해)**: 학습 목표 업데이트로:
  - GitHub Copilot과 MCP 서버 활성화 안내
  - AZD 템플릿 폴더 구조 이해
  - 인프라스트럭처 코드(Bicep) 구성 패턴
  - 실습 실험실 지침

- **🔧 워크숍 모듈 6 (해체)**: 완료됨:
  - 리소스 정리 및 비용 관리 목표
  - 안전한 인프라 프로비저닝 해제용 `azd down` 사용법
  - 소프트 삭제된 인지 서비스 복구 안내
  - GitHub Copilot 및 Azure Portal 탐색 보너스

#### 수정됨
- **🔗 깨진 링크 수정**: 15개 이상의 내부 문서 링크 문제 해결:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md 경로 수정
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md 및 production-ai-practices.md 경로 수정
  - `docs/getting-started/first-project.md`: 존재하지 않는 cicd-integration.md를 deployment-guide.md로 교체
  - `examples/retail-scenario.md`: FAQ 및 문제 해결 가이드 경로 수정
  - `examples/container-app/microservices/README.md`: 과정 홈 및 배포 가이드 경로 수정
  - `resources/faq.md` 및 `resources/glossary.md`: AI 챕터 참조 업데이트
  - `course-outline.md`: 강사 가이드 및 AI 워크숍 실습 참조 수정

- **📅 워크숍 상태 배너**: "공사 중"에서 2026년 2월 활성 워크숍 상태로 업데이트

- **🔗 워크숍 내비게이션**: 존재하지 않는 lab-1-azd-basics 폴더를 가리키는 README.md 내 깨진 내비게이션 링크 수정

#### 변경됨
- **워크숍 발표**: "공사 중" 경고 제거, 워크숍 완료 및 사용 준비 완료
- **내비게이션 일관성**: 모든 워크숍 모듈 간 올바른 내비게이션 보장
- **학습 경로 참조**: 올바른 microsoft-foundry 경로를 사용하도록 챕터 교차 참조 업데이트

#### 검증됨
- ✅ 모든 영어 마크다운 파일 내부 링크 유효성 확인
- ✅ 워크숍 모듈 0-7 완성 및 학습 목표 포함
- ✅ 챕터 및 모듈 간 내비게이션 정상 작동
- ✅ Microsoft AZD를 사용하는 AI 개발자에 적합한 콘텐츠
- ✅ 초보자 친화적 언어 및 구조 유지
- ✅ CONTRIBUTING.md에 커뮤니티 기여자 위한 명확한 가이드 제공

#### 기술 구현
- **링크 검증**: 자동화된 PowerShell 스크립트로 모든 .md 내부 링크 확인
- **콘텐츠 감사**: 워크숍 완성도 및 초심자 적합성 수동 검토
- **내비게이션 시스템**: 일관된 챕터 및 모듈 내비게이션 패턴 적용

#### 참고
- <strong>범위</strong>: 영어 문서에만 변경사항 적용
- <strong>번역</strong>: 이번 버전에서는 번역 폴더 업데이트 없음 (자동 번역 후 동기화 예정)
- **워크숍 기간**: 이제 워크숍이 3-4시간의 실습 학습을 제공

---

### [v3.8.0] - 2025-11-19

#### 고급 문서: 모니터링, 보안, 다중 에이전트 패턴
**이번 버전은 Application Insights 통합, 인증 패턴, 프로덕션 배포용 다중 에이전트 조정에 대한 포괄적인 A급 강의를 추가합니다.**

#### 추가됨
- **📊 Application Insights 통합 강의**: `docs/pre-deployment/application-insights.md`에서:
  - AZD 중심 배포 및 자동 프로비저닝
  - Application Insights + Log Analytics를 위한 완전한 Bicep 템플릿
  - 맞춤 텔레메트리로 작동하는 Python 애플리케이션 (1,200라인 이상)
  - AI/LLM 모니터링 패턴 (Microsoft Foundry 모델 토큰/비용 추적)
  - 6개의 Mermaid 다이어그램 (아키텍처, 분산 추적, 텔레메트리 흐름)
  - 3개의 실습 연습 (알림, 대시보드, AI 모니터링)
  - 쿼리 예제 및 비용 최적화 전략
  - 라이브 메트릭 스트리밍 및 실시간 디버깅
  - 40-50분 학습 시간, 프로덕션 준비된 패턴 포함

- **🔐 인증 및 보안 패턴 강의**: `docs/getting-started/authsecurity.md`에서:
  - 3가지 인증 패턴 (연결 문자열, Key Vault, 관리형 ID)
  - 보안 배포용 완전한 Bicep 인프라 템플릿
  - Azure SDK 통합 Node.js 애플리케이션 코드
  - 3가지 완전한 실습 (관리형 ID 활성화, 사용자 할당 ID, Key Vault 회전)
  - 보안 모범 사례 및 RBAC 구성
  - 문제 해결 가이드 및 비용 분석
  - 프로덕션 준비된 비밀번호 없는 인증 패턴

- **🤖 다중 에이전트 조정 패턴 강의**: `docs/pre-deployment/coordination-patterns.md`에서:
  - 5가지 조정 패턴 (순차, 병렬, 계층, 이벤트 기반, 합의)
  - 완전한 오케스트레이터 서비스 구현 (Python/Flask, 1,500라인 이상)
  - 3가지 특수 에이전트 구현 (연구, 작성, 편집)
  - 메시지 큐용 서비스 버스 통합
  - 분산 시스템용 Cosmos DB 상태 관리
  - 에이전트 상호작용을 보여주는 6개의 Mermaid 다이어그램
  - 3가지 고급 실습 (타임아웃 처리, 재시도 로직, 회로 차단기)
  - 비용 분석($240-565/월) 및 최적화 전략
  - 모니터링용 Application Insights 통합

#### 향상됨
- **사전 배포 챕터**: 이제 포괄적인 모니터링 및 조정 패턴 포함
- **시작하기 챕터**: 전문 인증 패턴으로 강화
- **프로덕션 준비도**: 보안부터 관측성까지 완전한 커버리지
- **과정 개요**: 챕터 3 및 6의 새 강의 참조로 업데이트

#### 변경됨
- **학습 진도**: 과정 전반에 보안 및 모니터링 통합 개선
- **문서 품질**: 새 강의 전반에 걸친 일관된 A급 기준(95-97%)
- **프로덕션 패턴**: 엔터프라이즈 배포용 완전한 엔드투엔드 커버리지

#### 개선됨
- **개발자 경험**: 개발부터 프로덕션 모니터링까지 명확한 경로
- **보안 표준**: 인증 및 비밀 관리에 대한 전문 패턴
- <strong>관측성</strong>: AZD와 완전한 Application Insights 통합
- **AI 워크로드**: Microsoft Foundry 모델 및 다중 에이전트 시스템 전용 모니터링

#### 검증됨
- ✅ 모든 강의에 완전한 작동 코드 포함 (스니펫 아님)
- ✅ 시각 학습용 Mermaid 다이어그램 (3강의 합계 19개)
- ✅ 검증 단계가 포함된 실습 연습 (총 9개)
- ✅ `azd up`로 배포 가능한 프로덕션 준비 Bicep 템플릿
- ✅ 비용 분석 및 최적화 전략
- ✅ 문제 해결 가이드 및 모범 사례
- ✅ 검증 명령 포함 지식 점검

#### 문서 등급 결과
- **docs/pre-deployment/application-insights.md**: - 포괄적 모니터링 가이드
- **docs/getting-started/authsecurity.md**: - 전문 보안 패턴
- **docs/pre-deployment/coordination-patterns.md**: - 고급 다중 에이전트 아키텍처
- **전체 신규 콘텐츠**: - 일관된 고품질 기준

#### 기술 구현
- **Application Insights**: Log Analytics + 맞춤형 텔레메트리 + 분산 추적
- <strong>인증</strong>: 관리형 ID + Key Vault + RBAC 패턴
- **다중 에이전트**: 서비스 버스 + Cosmos DB + 컨테이너 앱 + 오케스트레이션
- <strong>모니터링</strong>: 라이브 메트릭 + Kusto 쿼리 + 알림 + 대시보드
- **비용 관리**: 샘플링 전략, 보존 정책, 예산 통제

### [v3.7.0] - 2025-11-19

#### 문서 품질 개선 및 새로운 Microsoft Foundry Models 예제 추가
**이번 버전은 리포지토리 내 문서 품질을 향상시키고 gpt-4.1 채팅 인터페이스를 포함한 완전한 Microsoft Foundry Models 배포 예제를 추가합니다.**

#### 추가됨
- **🤖 Microsoft Foundry Models 채팅 예제**: `examples/azure-openai-chat/`에 완전한 gpt-4.1 배포 및 작동 구현:
  - 완전한 Microsoft Foundry Models 인프라 (gpt-4.1 모델 배포)
  - 대화 기록이 포함된 Python 명령줄 채팅 인터페이스
  - 보안 API 키 저장용 Key Vault 통합
  - 토큰 사용량 추적 및 비용 추정
  - 속도 제한 및 오류 처리
  - 35-45분 배포 가이드가 포함된 포괄적 README
  - 11개의 프로덕션 준비 파일 (Bicep 템플릿, Python 앱, 구성)
- **📚 문서 실습**: 구성 가이드에 실습 연습 추가:
  - 연습 1: 다중 환경 구성 (15분)
  - 연습 2: 비밀 관리 실습 (10분)
  - 명확한 성공 기준 및 검증 단계
- **✅ 배포 검증**: 배포 가이드에 검증 섹션 추가:
  - 상태 점검 절차
  - 성공 기준 체크리스트
  - 모든 배포 명령의 예상 출력
  - 문제 해결 빠른 참조

#### 향상됨
- **examples/README.md**: A급 품질로 업데이트 (93%):
  - 모든 관련 섹션에 azure-openai-chat 추가
  - 로컬 예제 수 3에서 4로 증가
  - AI 애플리케이션 예제 테이블에 추가
  - 중급 사용자를 위한 빠른 시작에 통합
  - Microsoft Foundry 템플릿 섹션에 추가
  - 비교 매트릭스 및 기술 조합 섹션 업데이트
- **문서 품질**: docs 폴더 내 B+(87%)에서 A-(92%)로 개선

  - 중요한 명령어 예제에 예상 출력 추가
  - 구성 변경 사항 검증 단계 포함
  - 실습 중심 학습 강화

#### 변경 사항
- **학습 진행**: 중급 학습자를 위해 AI 예제 통합 개선
- **문서 구조**: 명확한 결과를 가진 실행 가능한 연습 문제 추가
- **검증 프로세스**: 주요 워크플로우에 명시적인 성공 기준 추가

#### 향상된 점
- **개발자 경험**: Microsoft Foundry 모델 배포 시간이 35-45분으로 단축됨 (복잡한 대안은 60-90분 소요)
- **비용 투명성**: Microsoft Foundry 모델 예제의 명확한 비용 추정($50-200/월)
- **학습 경로**: AI 개발자들이 azure-openai-chat으로 명확한 진입점 확보
- **문서 표준**: 일관된 예상 출력 및 검증 단계 적용

#### 검증됨
- ✅ Microsoft Foundry 모델 예제가 `azd up`으로 완벽하게 작동
- ✅ 모든 11개 구현 파일 문법 오류 없음
- ✅ README 지침이 실제 배포 경험과 일치
- ✅ 8곳 이상의 문서 링크 최신화
- ✅ 예제 인덱스가 4개 로컬 예제를 정확히 반영
- ✅ 표 내 중복 외부 링크 없음
- ✅ 모든 탐색 참조가 정확함

#### 기술 구현
- **Microsoft Foundry 모델 아키텍처**: gpt-4.1 + Key Vault + 컨테이너 앱 패턴
- <strong>보안</strong>: 관리형 ID 준비 완료, Key Vault 내 비밀 관리
- <strong>모니터링</strong>: Application Insights 통합
- **비용 관리**: 토큰 추적 및 사용 최적화
- <strong>배포</strong>: 단일 `azd up` 명령으로 완전 설치

### [v3.6.0] - 2025-11-19

#### 주요 업데이트: 컨테이너 앱 배포 예제
**이번 버전은 Azure Developer CLI (AZD)를 사용한 종합적이며 생산 준비가 된 컨테이너 앱 배포 예제를 도입하며, 완전한 문서화와 학습 경로 통합을 제공합니다.**

#### 추가됨
- **🚀 컨테이너 앱 예제**: `examples/container-app/`에 새로운 로컬 예제 추가:
  - [마스터 가이드](examples/container-app/README.md): 컨테이너화된 배포 개요, 빠른 시작, 프로덕션 및 고급 패턴 포함
  - [간단한 Flask API](../../examples/container-app/simple-flask-api): 스케일 투 제로, 상태 검사, 모니터링, 문제 해결이 포함된 초보자 친화적 REST API
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices): 생산 준비된 다중 서비스 배포(API 게이트웨이, 상품, 주문, 사용자, 알림), 비동기 메시징, 서비스 버스, Cosmos DB, Azure SQL, 분산 추적, 블루-그린/카나리 배포
- **모범 사례**: 보안, 모니터링, 비용 최적화 및 CI/CD 가이드 제공
- **코드 샘플**: 완전한 `azure.yaml`, Bicep 템플릿과 다중 언어 서비스 구현(Python, Node.js, C#, Go)
- **테스트 및 문제 해결**: 종단 간 테스트 시나리오, 모니터링 명령어, 문제 해결 가이드

#### 변경됨
- **README.md**: "로컬 예제 - 컨테이너 애플리케이션" 섹션에 새 컨테이너 앱 예제로 업데이트 및 링크 추가
- **examples/README.md**: 컨테이너 앱 예제 강조, 비교 매트릭스 항목 추가 및 기술/아키텍처 참조 업데이트
- **강의 개요 및 학습 가이드**: 관련 장에 새 컨테이너 앱 예제 및 배포 패턴 참조 반영

#### 검증됨
- ✅ 모든 새 예제가 `azd up`으로 배포 가능하며 모범 사례 준수
- ✅ 문서 내부 링크 및 탐색 업데이트 완료
- ✅ 예제가 초보자에서 고급 시나리오(프로덕션 마이크로서비스 포함)를 모두 커버함

#### 참고 사항
- <strong>범위</strong>: 영어 문서 및 예제만 포함
- **향후 계획**: 추가 고급 컨테이너 패턴과 CI/CD 자동화 확장 예정

### [v3.5.0] - 2025-11-19

#### 제품 재브랜딩: Microsoft Foundry
**이번 버전은 모든 영어 문서에서 "Microsoft Foundry"로 제품명 변경을 포괄적으로 적용하여 마이크로소프트 공식 리브랜딩을 반영합니다.**

#### 변경됨
- **🔄 제품명 업데이트**: "Microsoft Foundry"로 완전한 리브랜딩 적용
  - `docs/` 폴더 내 모든 영어 문서 참조 업데이트
  - 폴더명 변경: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 파일명 변경: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 총 7개 문서 파일에 23개 내용 참조 업데이트 완료

- **📁 폴더 구조 변경**:
  - `docs/ai-foundry/` → `docs/microsoft-foundry/`로 이름 변경
  - 모든 교차 참조가 새 폴더 구조에 맞게 업데이트됨
  - 문서 전체 탐색 링크 검증 완료

- **📄 파일 이름 변경**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 모든 내부 링크가 새 파일명 참조로 업데이트됨

#### 업데이트된 파일
- **장별 문서** (7개 파일):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3개 탐색 링크 업데이트
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4개 제품명 참조 업데이트
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 이전 업데이트로 이미 Microsoft Foundry 사용 중
  - `docs/microsoft-foundry/production-ai-practices.md` - 3개 참조 업데이트(개요, 커뮤니티 피드백, 문서)
  - `docs/getting-started/azd-basics.md` - 4개 교차 참조 링크 업데이트
  - `docs/getting-started/first-project.md` - 2개 장 탐색 링크 업데이트
  - `docs/getting-started/installation.md` - 2개 다음 장 링크 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md` - 3개 참조 업데이트 (탐색, Discord 커뮤니티)
  - `docs/troubleshooting/common-issues.md` - 1개 탐색 링크 업데이트
  - `docs/troubleshooting/debugging.md` - 1개 탐색 링크 업데이트

- **강의 구조 파일** (2개 파일):
  - `README.md` - 17개 참조 업데이트 (강의 개요, 장 제목, 템플릿 섹션, 커뮤니티 인사이트)
  - `course-outline.md` - 14개 참조 업데이트 (개요, 학습 목표, 장 자원)

#### 검증됨
- ✅ 영어 문서에서 더 이상 "ai-foundry" 폴더 경로 참조 없음
- ✅ 영어 문서에서 더 이상 "Microsoft Foundry" 제품명 참조 없음
- ✅ 새 폴더 구조에 맞는 모든 탐색 링크 정상 작동
- ✅ 파일 및 폴더 이름 변경 성공적 완료
- ✅ 장 간 교차 참조 검증 완료

#### 참고 사항
- <strong>범위</strong>: `docs/` 폴더 내 영어 문서에만 변경 적용
- <strong>번역본</strong>: 이번 버전에서는 번역 폴더(`translations/`) 미업데이트
- <strong>워크숍</strong>: 워크숍 자료(`workshop/`) 미업데이트
- <strong>예제</strong>: 예제 파일은 아직 이전 명칭 참조 가능 (다음 업데이트에서 개선 예정)
- **외부 링크**: 외부 URL 및 GitHub 저장소 참조는 변경 없음

#### 기여자용 마이그레이션 가이드
기존 로컬 브랜치나 문서가 이전 구조를 참조하는 경우:
1. 폴더 참조 업데이트: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 파일 참조 업데이트: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 제품명 교체: "Microsoft Foundry" → "Microsoft Foundry"
4. 모든 내부 문서 링크가 정상 작동하는지 검증

---

### [v3.4.0] - 2025-10-24

#### 인프라 미리보기 및 검증 강화
**이번 버전은 새로운 Azure Developer CLI 미리보기 기능에 대한 포괄적 지원을 도입하고 워크숍 사용자 경험을 향상시킵니다.**

#### 추가됨
- **🧪 azd provision --preview 기능 문서화**: 새로운 인프라 미리보기 기능 자세히 다룸
  - 명령어 참조 및 치트 시트 예제 포함
  - 프로비저닝 가이드에 상세 통합, 사용 사례 및 이점 포함
  - 안전한 배포 검증을 위한 사전 점검 통합
  - 안전 우선 배포 관행 포함 시작 가이드 업데이트
- **🚧 워크숍 상태 배너**: 워크숍 진행 상태 알리는 전문 HTML 배너
  - 그래디언트 디자인 및 건설 중 표시로 명확한 사용자 소통
  - 투명성을 위한 마지막 업데이트 타임스탬프 포함
  - 모든 디바이스에 모바일 반응형 디자인 지원

#### 향상됨
- **인프라 안전성**: 배포 문서 전반에 미리보기 기능 통합
- **사전 배포 검증**: 자동화 스크립트에 인프라 미리보기 테스트 포함
- **개발자 워크플로우**: 명령어 순서에 미리보기 기능 포함을 권장 관례로 업데이트
- **워크숍 경험**: 콘텐츠 개발 상태에 대한 명확한 사용자 기대 설정

#### 변경됨
- **배포 모범 사례**: 미리보기 우선 워크플로우를 권장 접근법으로 변경
- **문서 흐름**: 인프라 검증을 학습 과정 초반으로 이동
- **워크숍 발표**: 개발 상태를 명확히 알리는 전문적 상태 메시지 추가

#### 개선됨
- **안전 우선 접근**: 인프라 변경 사항을 배포 전에 검증 가능
- **팀 협업**: 미리보기 결과를 공유하여 검토 및 승인 가능
- **비용 인식**: 프로비저닝 전 자원 비용에 대한 이해도 향상
- **위험 완화**: 사전 검증으로 배포 실패 감소

#### 기술 구현
- **다문서 통합**: 4개 주요 문서에 미리보기 기능 문서화
- **명령어 패턴**: 모든 문서에서 일관된 문법과 예제 사용
- **모범 사례 통합**: 검증 워크플로우 및 스크립트에 미리보기 포함
- **시각적 표시기**: 새로운 기능임을 명확히 알리는 표기

#### 워크숍 인프라
- **상태 소통**: 그래디언트 스타일의 전문 HTML 배너
- **사용자 경험**: 명확한 개발 상태 안내로 혼란 방지
- **전문적 발표**: 저장소 신뢰성 유지 및 기대치 설정
- **타임라인 투명성**: 2025년 10월 최종 업데이트 타임스탬프 제공

### [v3.3.0] - 2025-09-24

#### 강화된 워크숍 자료 및 대화형 학습 경험
**이번 버전은 브라우저 기반 대화형 안내와 구조화된 학습 경로가 포함된 종합적 워크숍 자료를 도입합니다.**

#### 추가됨
- **🎥 대화형 워크숍 가이드**: MkDocs 미리보기 기능을 이용한 브라우저 기반 워크숍 체험 제공
- **📝 구조화된 워크숍 지침**: 발견부터 맞춤화까지 7단계 안내 경로
  - 0-소개: 워크숍 개요 및 설정
  - 1-AI-템플릿 선택: 템플릿 발견 및 선택 과정
  - 2-AI-템플릿 검증: 배포 및 검증 절차
  - 3-AI-템플릿 해체: 템플릿 아키텍처 이해
  - 4-AI-템플릿 구성: 설정 및 맞춤화
  - 5-AI-템플릿 맞춤화: 고급 수정 및 반복
  - 6-인프라 정리: 리소스 관리 및 정리
  - 7-요약: 정리 및 다음 단계
- **🛠️ 워크숍 도구**: Material 테마가 적용된 MkDocs 설정으로 학습 경험 강화
- **🎯 실습 학습 경로**: 3단계 방법론 (발견 → 배포 → 맞춤화)
- **📱 GitHub Codespaces 통합**: 원활한 개발 환경 구축 지원

#### 향상됨
- **AI 워크숍 랩**: 2-3시간 분량의 구조화된 심층 학습 경험 추가
- **워크숍 문서화**: 탐색과 시각 자료가 포함된 전문적 구성
- **학습 진행**: 템플릿 선택에서 프로덕션 배포까지 단계적 안내 제공
- **개발자 경험**: 통합 도구로 개발 워크플로우 간소화

#### 개선됨
- <strong>접근성</strong>: 검색, 복사 기능, 테마 전환이 가능한 브라우저 인터페이스
- **자기 주도 학습**: 다양한 학습 속도를 수용하는 유연한 워크숍 구조
- **실용적 적용**: 실제 AI 템플릿 배포 시나리오 제공
- **커뮤니티 통합**: Discord 연동으로 워크숍 지원 및 협업 강화

#### 워크숍 기능
- **내장 검색**: 키워드 및 레슨 신속 탐색
- **코드 블록 복사**: 모든 코드 예제에 호버 복사 기능 제공
- **테마 전환**: 사용자 선호에 따른 다크/라이트 모드 지원
- **시각 자료**: 이해를 돕는 스크린샷 및 다이어그램 제공
- **지원 연동**: Discord 커뮤니티에 직접 접근 가능

### [v3.2.0] - 2025-09-17

#### 주요 내비게이션 재구성 및 장 기반 학습 시스템
**이번 버전은 리포지토리 전체에 향상된 내비게이션과 포괄적인 장 기반 학습 구조를 도입합니다.**

#### 추가됨
- **📚 장 기반 학습 시스템**: 전체 강의를 8개 점진적 학습 장으로 재구성
  - 제1장: 기초 및 빠른 시작 (⭐ - 30-45분)
  - 제2장: AI 우선 개발 (⭐⭐ - 1-2시간)
  - 제3장: 구성 및 인증 (⭐⭐ - 45-60분)
  - 제4장: 코드형 인프라 및 배포 (⭐⭐⭐ - 1-1.5시간)
  - 제5장: 다중 에이전트 AI 솔루션 (⭐⭐⭐⭐ - 2-3시간)
  - 제6장: 배포 전 검증 및 계획 (⭐⭐ - 1시간)
  - 제7장: 문제 해결 및 디버깅 (⭐⭐ - 1-1.5시간)
  - 제8장: 프로덕션 및 엔터프라이즈 패턴 (⭐⭐⭐⭐ - 2-3시간)
- **📚 종합 내비게이션 시스템**: 모든 문서에 일관된 탐색 헤더 및 푸터 적용
- **🎯 진도 추적**: 강의 완료 체크리스트 및 학습 검증 시스템 도입
- **🗺️ 학습 경로 안내**: 경험 수준과 목표에 따른 명확한 진입점 제공
- **🔗 교차 참조 내비게이션**: 관련 장과 선수 학습 목록 명확히 연결

#### 향상됨
- **README 구조**: 챕터 기반 조직으로 구조화된 학습 플랫폼으로 전환
- **문서 내비게이션**: 모든 페이지에 장별 맥락 및 진행 안내 포함
- **템플릿 정리**: 예제와 템플릿을 적절한 학습 장에 매핑

- **리소스 통합**: 관련 장에 연결된 치트 시트, FAQ 및 학습 가이드
- **워크숍 통합**: 여러 장 학습 목표에 매핑된 실습 랩

#### 변경 사항
- **학습 진행**: 선형 문서에서 유연한 장 기반 학습으로 이동
- **구성 위치**: 더 나은 학습 흐름을 위해 구성 가이드를 3장으로 재배치
- **AI 콘텐츠 통합**: 학습 여정 전체에 AI 전용 콘텐츠 더 나은 통합
- **프로덕션 콘텐츠**: 엔터프라이즈 학습자를 위한 고급 패턴을 8장에 통합

#### 개선 사항
- **사용자 경험**: 명확한 탐색 경로 표시 및 장 진행 표시기
- <strong>접근성</strong>: 더 쉬운 강좌 탐색을 위한 일관된 탐색 패턴
- **전문 프레젠테이션**: 학술 및 기업 교육에 적합한 대학 스타일 코스 구조
- **학습 효율성**: 개선된 조직으로 관련 콘텐츠 탐색 시간 단축

#### 기술 구현
- **탐색 헤더**: 40개 이상의 문서 파일 전반에 표준화된 장 탐색
- **풋터 탐색**: 일관된 진행 안내 및 장 완료 표시기
- **교차 링크**: 관련 개념을 연결하는 포괄적인 내부 링크 시스템
- **장 매핑**: 학습 목표와 명확히 연계된 템플릿 및 예제

#### 학습 가이드 개선
- **📚 종합 학습 목표**: 8장 체계에 맞게 재구성된 학습 가이드
- **🎯 장 기반 평가**: 각 장별 특정 학습 목표와 실습 과제 포함
- **📋 진행 추적**: 주간 학습 일정과 측정 가능한 결과 및 완료 체크리스트
- **❓ 평가 질문**: 각 장별 전문적인 결과를 위한 지식 검증 질문
- **🛠️ 실습 과제**: 실제 배포 시나리오 및 문제 해결이 포함된 실습 활동
- **📊 기술 진척도**: 기본 개념에서 엔터프라이즈 패턴까지 명확한 발전과 경력 개발 초점
- **🎓 인증 프레임워크**: 전문성 개발 결과 및 커뮤니티 인정 시스템
- **⏱️ 일정 관리**: 마일스톤 검증이 포함된 10주 구조화 학습 계획

### [v3.1.0] - 2025-09-17

#### 향상된 멀티 에이전트 AI 솔루션
**이번 버전은 멀티 에이전트 소매 솔루션에서 에이전트 명칭과 문서화를 개선했습니다.**

#### 변경 사항
- **멀티 에이전트 용어**: 소매 멀티 에이전트 솔루션 전반에서 "Cora agent"를 "Customer agent"로 대체하여 명확성 향상
- **에이전트 아키텍처**: 모든 문서, ARM 템플릿, 코드 예제에 일관된 "Customer agent" 명칭 적용
- **구성 예제**: 에이전트 구성 패턴을 최신 명칭 규칙으로 현대화
- **문서 일관성**: 모든 참조가 전문적이고 설명적인 에이전트 명칭 사용 보장

#### 향상 사항
- **ARM 템플릿 패키지**: retail-multiagent-arm-template 에 Customer agent 참조 업데이트
- **아키텍처 다이어그램**: Mermaid 다이어그램을 업데이트된 에이전트 명칭으로 새로고침
- **코드 예제**: Python 클래스 및 구현 예제에 CustomerAgent 명칭 사용
- **환경 변수**: 모든 배포 스크립트에 CUSTOMER_AGENT_NAME 명명 규칙 반영

#### 개선 사항
- **개발자 경험**: 문서에서 더 명확한 에이전트 역할과 책임 설명
- **프로덕션 준비도**: 엔터프라이즈 명명 규칙에 더 적합하게 조정
- **학습 자료**: 교육 목적에 더 직관적인 에이전트 명칭 적용
- **템플릿 사용성**: 에이전트 기능과 배포 패턴 이해 용이성 향상

#### 기술 세부사항
- CustomerAgent 참조로 Mermaid 아키텍처 다이어그램 업데이트
- Python 예제에서 CoraAgent 클래스 명칭을 CustomerAgent로 변경
- ARM 템플릿 JSON 구성에서 "customer" 에이전트 타입 사용으로 수정
- 환경 변수를 CORA_AGENT_*에서 CUSTOMER_AGENT_* 패턴으로 업데이트
- 모든 배포 명령어와 컨테이너 구성을 새로고침

### [v3.0.0] - 2025-09-12

#### 주요 변경 사항 - AI 개발자 중심과 Microsoft Foundry 통합
**이번 버전은 Microsoft Foundry 통합과 함께 AI 중심 학습 리소스로 레포지토리를 완전 변환했습니다.**

#### 추가된 항목
- **🤖 AI 우선 학습 경로**: AI 개발자 및 엔지니어 우선 재구성
- **Microsoft Foundry 통합 가이드**: AZD와 Microsoft Foundry 서비스 연결에 대한 종합 문서
- **AI 모델 배포 패턴**: 모델 선택, 구성, 프로덕션 배포 전략을 다룬 상세 가이드
- **AI 워크숍 랩**: AI 애플리케이션을 AZD 배포 솔루션으로 전환하는 2 ~ 3시간 실습 워크숍
- **프로덕션 AI 최적 관행**: AI 작업 부하의 확장, 모니터링 및 보안을 위한 엔터프라이즈 수준 패턴
- **AI 전용 문제 해결 가이드**: Microsoft Foundry 모델, 인지 서비스 및 AI 배포 문제 해결 종합 자료
- **AI 템플릿 갤러리**: Microsoft Foundry 템플릿 모음 및 복잡도 등급
- **워크숍 자료**: 실습 랩과 참조 자료를 포함한 완전한 워크숍 구조

#### 향상된 사항
- **README 구조**: Microsoft Foundry Discord의 45% 커뮤니티 관심 데이터를 반영한 AI 개발자 중심 구성
- **학습 경로**: 학생 및 DevOps 엔지니어용 기존 경로와 함께 AI 개발자 전용 여정 추가
- **템플릿 추천**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart를 포함한 AI 템플릿 주목
- **커뮤니티 통합**: AI 전용 채널 및 토론을 강화한 Discord 커뮤니티 지원 확대

#### 보안 및 프로덕션 초점
- **관리되는 ID 패턴**: AI 전용 인증 및 보안 구성
- **비용 최적화**: AI 작업 부하에 대한 토큰 사용 추적 및 예산 제어
- **다중 지역 배포**: 글로벌 AI 애플리케이션 배포 전략
- **성능 모니터링**: AI 전용 메트릭 및 Application Insights 통합

#### 문서 품질
- **선형 강좌 구조**: 초보자에서 고급 AI 배포 패턴까지 논리적 진행
- **검증된 URL**: 모든 외부 저장소 링크 검증 및 접근 가능
- **완전한 참조**: 모든 내부 문서 링크 검증 및 동작 확인
- **프로덕션 준비**: 실제 사례가 포함된 엔터프라이즈 배포 패턴

### [v2.0.0] - 2025-09-09

#### 주요 변경 사항 - 레포지토리 재구조화 및 전문성 강화
**이번 버전은 레포지토리 구조와 콘텐츠 표현에 중대한 개편을 반영합니다.**

#### 추가된 항목
- **구조화된 학습 프레임워크**: 모든 문서 페이지에 소개, 학습 목표, 학습 성과 섹션 포함
- **탐색 시스템**: 모든 문서에 이전/다음 강좌 링크 추가로 학습 진행 안내
- **학습 가이드**: 학습 목표, 실습 및 평가 자료를 포함한 종합적 study-guide.md
- **전문 프레젠테이션**: 접근성 및 전문성 향상을 위한 모든 이모지 아이콘 제거
- **향상된 콘텐츠 구조**: 학습 자료 조직 및 흐름 개선

#### 변경 사항
- **문서 형식**: 일관된 학습 중심 구조로 모든 문서 표준화
- **탐색 흐름**: 모든 학습 자료 논리적 진행 구현
- **콘텐츠 표현**: 명확하고 전문적인 형식을 위해 장식 요소 제거
- **링크 구조**: 새로운 탐색 시스템 지원을 위한 모든 내부 링크 업데이트

#### 개선 사항
- <strong>접근성</strong>: 화면 판독기 호환성 강화를 위해 이모지 의존성 제거
- **전문적 외관**: 기업 학습에 적합한 깔끔하고 학술적인 프레젠테이션
- **학습 경험**: 각 강좌별 명확한 목표 및 결과가 포함된 구조화된 접근법
- **콘텐츠 조직**: 관련 주제 간 더 나은 논리적 흐름 및 연결성

### [v1.0.0] - 2025-09-09

#### 초기 릴리스 - 종합 AZD 학습 저장소

#### 추가된 항목
- **핵심 문서 구조**
  - 완전한 시작 가이드 시리즈
  - 종합 배포 및 프로비저닝 문서
  - 상세 문제 해결 리소스 및 디버깅 가이드
  - 사전 배포 검증 도구 및 절차

- **시작하기 모듈**
  - AZD 기본: 핵심 개념 및 용어
  - 설치 가이드: 플랫폼별 설정 지침
  - 구성 가이드: 환경 설정 및 인증
  - 첫 프로젝트 튜토리얼: 단계별 실습 학습

- **배포 및 프로비저닝 모듈**
  - 배포 가이드: 완전한 워크플로우 문서
  - 프로비저닝 가이드: Bicep을 활용한 코드형 인프라
  - 프로덕션 배포 최적 관행
  - 다중 서비스 아키텍처 패턴

- **사전 배포 검증 모듈**
  - 용량 계획: Azure 리소스 가용성 검증
  - SKU 선택: 포괄적인 서비스 티어 안내
  - 사전 점검: 자동화 검증 스크립트(파워셸 및 배시)
  - 비용 추정 및 예산 계획 도구

- **문제 해결 모듈**
  - 일반 문제: 자주 발생하는 문제 및 해결책
  - 디버깅 가이드: 체계적인 문제 해결 방법론
  - 고급 진단 기법 및 도구
  - 성능 모니터링 및 최적화

- **리소스 및 참고 자료**
  - 명령 치트 시트: 필수 명령 빠른 참조
  - 용어집: 종합 용어 및 약어 정의
  - FAQ: 자주 묻는 질문에 대한 상세 답변
  - 외부 리소스 링크 및 커뮤니티 연결

- **예제 및 템플릿**
  - 간단한 웹 애플리케이션 예제
  - 정적 웹사이트 배포 템플릿
  - 컨테이너 애플리케이션 구성
  - 데이터베이스 통합 패턴
  - 마이크로서비스 아키텍처 예제
  - 서버리스 함수 구현

#### 특징
- **다중 플랫폼 지원**: Windows, macOS 및 Linux 설치 및 구성 가이드
- **다양한 숙련도 수준**: 학생부터 전문가 개발자까지를 위한 콘텐츠 설계
- **실용 중심**: 실습 예제 및 실제 시나리오
- **포괄적 범위**: 기본 개념부터 고급 엔터프라이즈 패턴까지
- **보안 우선 접근법**: 전 과정에 통합된 보안 최적 관행
- **비용 최적화**: 비용 효율적인 배포 및 리소스 관리 가이드

#### 문서 품질
- **상세 코드 예제**: 실용적이고 테스트된 코드 샘플
- **단계별 지침**: 명확하고 실행 가능한 안내
- **포괄적 오류 처리**: 일반적인 문제에 대한 문제 해결
- **최선 관행 통합**: 업계 표준 및 권고사항
- **버전 호환성**: 최신 Azure 서비스와 azd 기능에 맞춤

## 계획된 향후 개선 사항

### 버전 3.1.0 (계획)
#### AI 플랫폼 확장
- **멀티 모델 지원**: Hugging Face, Azure Machine Learning 및 맞춤 모델 통합 패턴
- **AI 에이전트 프레임워크**: LangChain, Semantic Kernel, AutoGen 배포용 템플릿
- **고급 RAG 패턴**: Azure AI Search 외 벡터 데이터베이스 옵션(Pinecone, Weaviate 등)
- **AI 관찰성**: 모델 성능, 토큰 사용 및 응답 품질 향상된 모니터링

#### 개발자 경험
- **VS 코드 확장**: 통합 AZD + Microsoft Foundry 개발 경험
- **GitHub Copilot 통합**: AI 지원 AZD 템플릿 생성
- **대화형 튜토리얼**: AI 시나리오에 대한 자동 검증 핸즈온 코딩 실습
- **비디오 콘텐츠**: AI 배포에 초점 맞춘 시각 학습자를 위한 보조 비디오 튜토리얼

### 버전 4.0.0 (계획)
#### 엔터프라이즈 AI 패턴
- **거버넌스 프레임워크**: AI 모델 거버넌스, 규정 준수 및 감사 기록
- **멀티 테넌트 AI**: 격리된 AI 서비스를 통해 여러 고객 지원 패턴
- **엣지 AI 배포**: Azure IoT Edge 및 컨테이너 인스턴스 통합
- **하이브리드 클라우드 AI**: 다중 클라우드 및 하이브리드 AI 작업 부하 배포 패턴

#### 고급 기능
- **AI 파이프라인 자동화**: Azure Machine Learning 파이프라인과 MLOps 통합
- **고급 보안**: 제로 트러스트 패턴, 프라이빗 엔드포인트 및 고급 위협 방어
- **성능 최적화**: 고처리량 AI 애플리케이션을 위한 고급 튜닝 및 확장 전략
- **글로벌 배포**: AI 애플리케이션을 위한 콘텐츠 전송 및 엣지 캐싱 패턴

### 버전 3.0.0 (계획) - 현재 릴리스로 대체됨
#### 제안된 추가 사항 - v3.0.0에 구현 완료
- ✅ **AI 중심 콘텐츠**: Microsoft Foundry 통합 완성(완료)
- ✅ **대화형 튜토리얼**: 핸즈온 AI 워크숍 랩 (완료)
- ✅ **고급 보안 모듈**: AI 전용 보안 패턴 (완료)
- ✅ **성능 최적화**: AI 작업 부하 튜닝 전략 (완료)

### 버전 2.1.0 (계획) - 일부 v3.0.0에 구현됨
#### 소규모 개선 사항 - 현재 릴리스에 일부 완료
- ✅ **추가 예제**: AI 중심 배포 시나리오 (완료)
- ✅ **확장 FAQ**: AI 전용 질문 및 문제 해결 (완료)
- **도구 통합**: IDE 및 편집기 통합 가이드 강화
- ✅ **모니터링 확장**: AI 전용 모니터링 및 경보 패턴 (완료)

#### 아직 향후 릴리스로 계획됨
- **모바일 친화 문서**: 모바일 학습을 위한 반응형 디자인
- **오프라인 접근**: 다운로드 가능한 문서 패키지
- **향상된 IDE 통합**: AZD + AI 워크플로우용 VS 코드 확장
- **커뮤니티 대시보드**: 실시간 커뮤니티 지표 및 기여 추적

## 변경 로그 기여 안내

### 변경 보고 방법
이 저장소에 기여할 때, 변경 로그 항목에 다음을 포함해 주세요:

1. **버전 번호**: 시멘틱 버전 규칙(major.minor.patch) 따라 작성
2. <strong>날짜</strong>: YYYY-MM-DD 형식의 릴리스 또는 업데이트 날짜
3. <strong>카테고리</strong>: 추가됨, 변경됨, 사용 중단, 제거됨, 수정됨, 보안
4. **명확한 설명**: 변경 사항에 대한 간결한 설명
5. **영향 평가**: 변경이 기존 사용자에게 미치는 영향

### 변경 카테고리

#### 추가됨
- 신규 기능, 문서 섹션 또는 기능
- 신규 예제, 템플릿 또는 학습 자료
- 추가 도구, 스크립트 또는 유틸리티

#### 변경됨
- 기존 기능이나 문서의 수정
- 명확성 또는 정확성 개선 업데이트
- 내용 또는 조직의 재구성

#### 사용 중단됨
- 단계적으로 제거되는 기능 또는 접근법
- 제거 예정인 문서 섹션
- 더 나은 대안이 있는 방법

#### 제거됨
- 더 이상 관련 없는 기능, 문서 또는 예제
- 구식 정보 또는 사용 중단된 접근법
- 중복되거나 통합된 콘텐츠

#### 수정됨
- 문서 또는 코드의 오류 수정
- 보고된 문제나 결함 해결
- 정확성 또는 기능성 향상


#### 보안
- 보안 관련 개선사항 또는 수정사항
- 보안 모범 사례 업데이트
- 보안 취약점 해결

### 시맨틱 버전 관리 가이드라인

#### 메이저 버전 (X.0.0)
- 사용자의 조치가 필요한 중대한 변경사항
- 내용 또는 조직의 중요한 구조 조정
- 근본적인 접근법이나 방법론을 변경하는 변경사항

#### 마이너 버전 (X.Y.0)
- 새로운 기능 또는 콘텐츠 추가
- 하위 호환성을 유지하는 개선사항
- 추가적인 예제, 도구 또는 리소스

#### 패치 버전 (X.Y.Z)
- 버그 수정 및 정정
- 기존 콘텐츠의 사소한 개선
- 명확화 및 작은 향상사항

## 커뮤니티 피드백 및 제안

이 학습 리소스 개선을 위해 커뮤니티 피드백을 적극 권장합니다:

### 피드백 제공 방법
- **GitHub Issues**: 문제를 보고하거나 개선사항을 제안 (AI 관련 문제도 환영)
- **Discord 토론**: 아이디어 공유 및 Microsoft Foundry 커뮤니티 참여
- **Pull Requests**: AI 템플릿 및 가이드 등 콘텐츠 직접 개선 기여
- **Microsoft Foundry Discord**: AZD + AI 논의를 위한 #Azure 채널 참여
- **커뮤니티 포럼**: 광범위한 Azure 개발자 토론 참여

### 피드백 분류
- **AI 콘텐츠 정확성**: AI 서비스 통합 및 배포 정보 수정
- **학습 경험**: AI 개발자 학습 흐름 개선 제안
- **누락된 AI 콘텐츠**: 추가 AI 템플릿, 패턴 또는 예제 요청
- <strong>접근성</strong>: 다양한 학습 니즈에 맞춘 개선
- **AI 도구 통합**: AI 개발 워크플로우 통합 개선 제안
- **프로덕션 AI 패턴**: 엔터프라이즈 AI 배포 패턴 요청

### 응답 약속
- **이슈 응답**: 보고된 문제에 대해 48시간 이내 답변
- **기능 요청**: 1주일 이내 평가
- **커뮤니티 기여**: 1주일 이내 검토
- **보안 문제**: 즉각 우선순위 처리 및 신속 대응

## 유지보수 일정

### 정기 업데이트
- **월간 점검**: 콘텐츠 정확성 및 링크 검증
- **분기별 업데이트**: 주요 내용 추가 및 개선
- **반기별 점검**: 전면 구조 조정 및 향상
- **연간 릴리즈**: 주요 버전 업데이트 및 중대한 개선사항

### 모니터링 및 품질 보증
- **자동화 테스트**: 코드 예제 및 링크의 정기 검증
- **커뮤니티 피드백 통합**: 사용자 제안 정기 반영
- **기술 업데이트**: 최신 Azure 서비스 및 azd 릴리즈와의 정합성 유지
- **접근성 감사**: 포괄적 설계 원칙 정기 검토

## 버전 지원 정책

### 현재 버전 지원
- **최신 메이저 버전**: 정기 업데이트와 함께 완전 지원
- **이전 메이저 버전**: 12개월간 보안 업데이트 및 중요 수정 제공
- <strong>구버전</strong>: 커뮤니티 지원만 제공, 공식 업데이트 없음

### 마이그레이션 가이드
메이저 버전이 발표되면 다음을 제공합니다:
- **마이그레이션 가이드**: 단계별 이전 안내
- **호환성 안내**: 주요 변경 사항에 대한 상세 정보
- **도구 지원**: 마이그레이션 지원 스크립트 또는 유틸리티
- **커뮤니티 지원**: 마이그레이션 문의를 위한 전용 포럼

---

<strong>탐색</strong>
- **이전 강의**: [Study Guide](resources/study-guide.md)
- **다음 강의**: [Main README](README.md)로 돌아가기

**최신 정보 유지하기**: 이 저장소를 주시하여 새 릴리즈 및 학습 자료의 중요 업데이트 알림을 받아보세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->