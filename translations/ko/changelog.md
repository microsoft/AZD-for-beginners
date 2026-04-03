# 변경 로그 - AZD For Beginners

## 소개

이 변경 로그는 AZD For Beginners 리포지토리의 모든 주목할 만한 변경사항, 업데이트 및 개선사항을 문서화합니다. 우리는 시맨틱 버전 관리 원칙을 따르며, 사용자가 버전 간에 무엇이 변경되었는지 이해할 수 있도록 이 로그를 유지합니다.

## 학습 목표

이 변경 로그를 검토하면 다음을 할 수 있습니다:
- 새로운 기능 및 콘텐츠 추가에 대한 최신 정보 유지
- 기존 문서에 대한 개선사항 이해
- 정확성을 보장하기 위한 버그 수정 및 정정 추적
- 학습 자료의 시간에 따른 진화를 따르기

## 학습 성과

변경 로그 항목을 검토한 후, 귀하는 다음을 할 수 있습니다:
- 학습을 위해 사용 가능한 새로운 콘텐츠와 리소스를 식별
- 어떤 섹션이 업데이트되었거나 개선되었는지 이해
- 최신 자료를 기반으로 학습 경로 계획
- 향후 개선을 위한 피드백과 제안 기여

## 버전 기록

### [v3.19.1] - 2026-03-27

#### 초보자 온보딩 명확화, 설정 검증 및 최종 AZD 명령 정리
**이 버전은 AZD 1.23 검증 작업을 이어 초보자 중심의 문서 정리를 수행합니다: AZD 우선 인증 지침을 명확히 하고, 로컬 설정 검증 스크립트를 추가하며, 주요 명령을 라이브 AZD CLI에 대해 검증하고, 변경 로그 외부에 남아 있던 마지막 불필요한 영어 원본 명령 참조를 제거합니다.**

#### 추가됨
- **🧪 초보자 설정 검증 스크립트** `validate-setup.ps1` 및 `validate-setup.sh`를 포함하여 학습자가 1장을 시작하기 전에 필요한 도구를 확인할 수 있도록 함
- **✅ 사전 설정 검증 단계** 루트 README 및 Chapter 1 README에 추가하여 `azd up` 전에 누락된 전제 조건을 발견할 수 있도록 함

#### 변경됨
- **🔐 초보자 인증 지침** 이제 `azd auth login`을 AZD 워크플로우의 기본 경로로 일관되게 취급하며, Azure CLI 명령을 직접 사용하지 않는 한 `az login`은 선택 사항으로 명시
- **📚 1장 온보딩 흐름** 이제 학습자가 설치, 인증 및 첫 배포 단계 전에 로컬 설정을 검증하도록 안내
- **🛠️ 검증기 메시징** 이제 차단 요구사항과 AZD 전용 초보기준의 선택적 Azure CLI 경고를 명확히 구분
- **📖 구성, 문제 해결 및 예제 문서** 이제 필요한 AZD 인증과 선택적 Azure CLI 로그인 사이의 차이를 구분하여 이전에 맥락 없이 함께 제시되던 부분을 정리

#### 수정됨
- **📋 남아 있던 영어 원본 명령 참조** 치트시트의 `azd config show` 포함하여 최신 AZD 형식으로 업데이트하고, Azure 포털 개요 안내가 의도된 경우 `azd monitor --overview`로 수정
- **🧭 1장의 초보자 주장** 모든 템플릿 및 Azure 리소스에서 오류 없음 또는 롤백 보장을 과장하지 않도록 완화
- **🔎 라이브 CLI 검증** `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, 및 `azd down --force --purge`에 대한 현재 지원을 확인

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

#### AZD 1.23.12 검증, 워크숍 환경 확대 및 AI 모델 갱신
**이 버전은 `azd` `1.23.12`에 대해 문서 검증 스윕을 수행하고, 오래된 AZD 명령 예제를 업데이트하며, AI 모델 지침을 현재 기본값으로 갱신하고, 워크숍 지침을 GitHub Codespaces 외에도 dev 컨테이너 및 로컬 클론을 지원하도록 범위를 확장합니다.**

#### 추가됨
- **✅ 핵심 챕터 및 워크숍 문서 전반에 걸친 검증 노트** 학습자가 더 새롭거나 오래된 CLI 빌드를 사용할 때 테스트된 AZD 기준을 명확히 알 수 있도록
- **⏱️ 배포 타임아웃 지침** 장시간 실행되는 AI 앱 배포를 위한 `azd deploy --timeout 1800` 예시
- **🔎 확장 기능 검사 단계** AI 워크플로우 문서에 `azd extension show azure.ai.agents` 추가
- **🌐 더 넓은 워크숍 환경 지침** GitHub Codespaces, dev 컨테이너 및 MkDocs를 사용하는 로컬 클론을 모두 다룸

#### 변경됨
- **📚 챕터 소개 README** 이제 foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, production 섹션 전반에서 `azd 1.23.12`에 대한 검증을 일관되게 표기
- **🛠️ AZD 명령 참조** 문서 전반에서 최신 형식으로 업데이트:
  - `azd config list` → `azd config show`
  - `azd env show` → 상황에 따라 `azd env list` 또는 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights 개요가 의도된 경우 `azd monitor --overview`
- **🧪 프로비저닝 미리보기 예제** `azd provision --preview` 및 `azd provision --preview -e production`와 같은 현재 지원되는 사용법으로 단순화
- **🧭 워크숍 흐름** 이제 학습자가 Codespaces, dev 컨테이너 또는 로컬 클론에서 실습을 완료할 수 있도록 업데이트되어 Codespaces 전용 실행을 가정하지 않음
- **🔐 인증 지침** 이제 AZD 워크플로우에는 `azd auth login`을 권장하고, Azure CLI 명령을 직접 사용하는 경우에만 `az login`을 선택 사항으로 위치시킴

#### 수정됨
- **🪟 Windows 설치 명령** 설치 가이드에서 현재 `winget` 패키지 대소문자 표기로 정규화
- **🐧 Linux 설치 지침** 배포판별로 지원되지 않는 `azd` 패키지 관리자 지침을 피하도록 수정하고 적절한 경우 릴리스 자산을 가리키도록 변경
- **📦 AI 모델 예제** 오래된 기본값(예: `gpt-35-turbo`, `text-embedding-ada-002`)을 `gpt-4.1-mini`, `gpt-4.1`, `text-embedding-3-large`와 같은 현재 예제로 갱신
- **📋 배포 및 진단 스니펫** 로그, 스크립트 및 문제 해결 단계에서 현재 환경 및 상태 명령을 사용하도록 수정
- **⚙️ GitHub Actions 지침** `Azure/setup-azd@v1.0.0`에서 `Azure/setup-azd@v2`로 업데이트
- **🤖 MCP/Copilot 동의 지침** `azd mcp consent`에서 `azd copilot consent list`로 업데이트

#### 개선됨
- **🧠 AI 챕터 지침** 이제 미리보기 민감 `azd ai` 동작, 테넌트별 로그인, 현재 확장 기능 사용법 및 업데이트된 모델 배포 권장사항을 더 잘 설명
- **🧪 워크숍 지침** 실습을 위한 보다 현실적인 버전 예제와 명확한 환경 설정 언어 사용
- **📈 운영 및 문제 해결 문서** 모니터링, 대체 모델 및 비용 티어 예제와 더 잘 정렬

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

#### AZD AI CLI 명령, 콘텐츠 검증 및 템플릿 확장
**이 버전은 `azd ai`, `azd extension`, `azd mcp` 명령의 적용 범위를 모든 AI 관련 챕터로 확장하고, agents.md의 끊어진 링크 및 더 이상 사용되지 않는 코드를 수정하며, 치트시트를 업데이트하고, 검증된 설명과 새로운 Azure AI AZD 템플릿으로 예제 템플릿 섹션을 개편합니다.**

#### 추가됨
- **🤖 AZD AI CLI 적용 범위** 7개 파일에 걸쳐 확대(이전에는 8장에만 있었음):
  - `docs/chapter-01-foundation/azd-basics.md` — `azd extension`, `azd ai agent init`, `azd mcp`를 소개하는 새 "Extensions and AI Commands" 섹션
  - `docs/chapter-02-ai-development/agents.md` — 옵션 4: 템플릿 대 매니페스트 접근 방식 비교 표와 함께 `azd ai agent init`
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" 및 "Agent-First Deployment" 하위 섹션
  - `docs/chapter-05-multi-agent/README.md` — 퀵 스타트에 템플릿 기반 및 매니페스트 기반 배포 경로 모두 표시
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 배포 섹션에 `azd ai agent init` 옵션 포함
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "진단을 위한 AZD AI 확장 명령" 하위 섹션
  - `resources/cheat-sheet.md` — `azd extension`, `azd ai agent init`, `azd mcp`, `azd infra generate`를 포함한 새 "AI & Extensions Commands" 섹션
- **📦 새로운 AZD AI 예제 템플릿** `microsoft-foundry-integration.md`에 추가:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel 및 음성 채팅 지원을 갖춘 .NET RAG 채팅
  - **azure-search-openai-demo-java** — ACA/AKS 배포 옵션을 사용하는 Langchain4J 기반 Java RAG 채팅
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding 및 Prompty를 사용하는 멀티에이전트 창작 작가 앱
  - **serverless-chat-langchainjs** — Ollama 로컬 개발 지원이 포함된 Azure Functions + LangChain.js + Cosmos DB를 사용하는 서버리스 RAG
  - **chat-with-your-data-solution-accelerator** — 관리자 포털, Teams 통합 및 PostgreSQL/Cosmos DB 옵션이 포함된 엔터프라이즈 RAG 가속기
  - **azure-ai-travel-agents** — .NET, Python, Java 및 TypeScript로 된 서버를 가진 멀티에이전트 MCP 오케스트레이션 참조 앱
  - **azd-ai-starter** — 최소한의 Azure AI 인프라 Bicep 스타터 템플릿
  - **🔗 Awesome AZD AI 갤러리 링크** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) 참조 (80+ 템플릿)

#### 수정됨
- **🔗 agents.md 내비게이션**: 이전/다음 링크가 이제 Chapter 2 README 수업 순서(Microsoft Foundry Integration → Agents → AI Model Deployment)에 맞게 조정
- **🔗 agents.md 끊어진 링크**: `production-ai-practices.md`를 `../chapter-08-production/production-ai-practices.md`로 수정(3곳)
- **📦 agents.md의 더 이상 사용되지 않는 코드**: `opencensus`를 `azure-monitor-opentelemetry` + OpenTelemetry SDK로 교체
- **🐛 agents.md의 잘못된 API**: `max_tokens`를 `create_agent()`에서 `create_run()`의 `max_completion_tokens`로 이동
- **🔢 agents.md 토큰 계산**: 대략적인 `len//4` 추정 대신 `tiktoken.encoding_for_model()` 사용으로 교체
- **azure-search-openai-demo**: 서비스 설명을 "Cognitive Search + App Service"에서 기본 호스트 변경(2024년 10월)으로 인해 "Azure AI Search + Azure Container Apps"로 수정
- **contoso-chat**: 설명을 저장소의 실제 제목 및 기술 스택에 맞춰 Azure AI Foundry + Prompty를 참조하도록 업데이트

#### 제거됨
- **ai-document-processing**: 작동하지 않는 템플릿 참조 제거(리포지토리가 AZD 템플릿으로 공개적으로 접근 불가)

#### 향상됨
- **📝 agents.md exercises**: 연습 1에는 이제 예상 출력과 `azd monitor` 단계가 표시됩니다; 연습 2에는 전체 `FunctionTool` 등록 코드가 포함되어 있습니다; 연습 3은 모호한 지침을 구체적인 `prepdocs.py` 명령으로 대체합니다
- **📚 agents.md resources**: 문서 링크를 최신 Azure AI Agent Service 문서 및 빠른 시작으로 업데이트함
- **📋 agents.md Next Steps table**: 전체 챕터 범위를 위한 AI Workshop Lab 링크 추가

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

#### 코스 탐색 향상

**이 버전은 향상된 테이블 형식으로 README.md의 챕터 탐색을 개선합니다.**

#### 변경
- **Course Map Table**: 직접 레슨 링크, 소요 시간 추정치 및 복잡도 평가가 추가되어 향상됨
- **Folder Cleanup**: 중복된 이전 폴더 (deployment/, getting-started/, pre-deployment/, troubleshooting/) 제거
- **Link Validation**: Course Map 표의 21개 이상의 내부 링크 모두 검증됨

### [v3.16.0] - 2026-02-05

#### 제품 이름 업데이트

**이 버전은 제품 참조를 현재 Microsoft 브랜드로 업데이트합니다.**

#### 변경
- **Microsoft Foundry → Microsoft Foundry**: 비번역 파일 전반에서 모든 참조가 업데이트됨
- **Azure AI Agent Service → Foundry Agents**: 현재 브랜드를 반영하도록 서비스 이름 업데이트됨

#### 업데이트된 파일
- `README.md` - 메인 코스 랜딩 페이지
- `changelog.md` - 버전 기록
- `course-outline.md` - 코스 구조
- `docs/chapter-02-ai-development/agents.md` - AI 에이전트 가이드
- `examples/README.md` - 예제 문서
- `workshop/README.md` - 워크숍 랜딩 페이지
- `workshop/docs/index.md` - 워크숍 인덱스
- `workshop/docs/instructions/*.md` - 모든 워크숍 지침 파일

---

### [v3.15.0] - 2026-02-05

#### 주요 리포지토리 재구성: 챕터 기반 폴더 이름

**이 버전은 더 명확한 탐색을 위해 문서를 전용 챕터 폴더로 재구성합니다.**

#### 폴더 이름 변경
이전 폴더는 챕터 번호가 매겨진 폴더로 대체되었습니다:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### 파일 마이그레이션
| 파일 | 원본 | 대상 |
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### 추가됨
- **📚 Chapter README files**: 각 챕터 폴더에 README.md를 생성하고 다음을 포함:
  - 학습 목표 및 소요 시간
  - 레슨 표 및 설명
  - 빠른 시작 명령
  - 다른 챕터로의 네비게이션

#### 변경
- **🔗 Updated all internal links**: 78개 이상의 경로가 모든 문서 파일에서 업데이트됨
- **🗺️ Main README.md**: 새로운 챕터 구조로 Course Map 업데이트됨
- **📝 examples/README.md**: 챕터 폴더에 대한 교차 참조 업데이트

#### 제거됨
- 이전 폴더 구조 제거 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 리포지토리 재구성: 챕터 네비게이션

**이 버전은 챕터 네비게이션 README 파일을 추가했습니다(v3.15.0에서 대체됨).**

---

### [v3.13.0] - 2026-02-05

#### 새로운 AI 에이전트 가이드

**이 버전은 Azure Developer CLI로 AI 에이전트를 배포하는 포괄적인 가이드를 추가합니다.**

#### 추가됨
- **🤖 docs/microsoft-foundry/agents.md**: 다음을 포함하는 전체 가이드:
  - AI 에이전트가 무엇인지와 챗봇과 어떻게 다른지
  - 세 가지 빠른 시작 에이전트 템플릿 (Foundry Agents, Prompty, RAG)
  - 에이전트 아키텍처 패턴 (단일 에이전트, RAG, 멀티 에이전트)
  - 도구 구성 및 사용자화
  - 모니터링 및 메트릭 추적
  - 비용 고려사항 및 최적화
  - 일반적인 문제 해결 시나리오
  - 성공 기준이 있는 세 가지 실습 연습

#### 콘텐츠 구조
- **Introduction**: 초보자를 위한 에이전트 개념
- **Quick Start**: `azd init --template get-started-with-ai-agents`로 에이전트 배포
- **Architecture Patterns**: 에이전트 패턴의 시각적 다이어그램
- **Configuration**: 도구 설정 및 환경 변수
- **Monitoring**: Application Insights 통합
- **Exercises**: 점진적인 실습 학습(각 20~45분)

---

### [v3.12.0] - 2026-02-05

#### DevContainer 환경 업데이트

**이 버전은 AZD 학습 환경을 위해 최신 도구와 더 나은 기본값으로 개발 컨테이너 구성을 업데이트합니다.**

#### 변경
- **🐳 Base Image**: `python:3.12-bullseye`에서 `python:3.12-bookworm`(최신 Debian stable)으로 업데이트
- **📛 Container Name**: 명확성을 위해 "Python 3"에서 "AZD for Beginners"로 이름 변경

#### 추가됨
- **🔧 새로운 Dev Container 기능**:
  - Bicep 지원이 활성화된 `azure-cli`
  - `node:20` (AZD 템플릿용 LTS 버전)
  - 템플릿 관리를 위한 `github-cli`
  - 컨테이너 앱 배포를 위한 `docker-in-docker`

- **🔌 포트 포워딩**: 일반 개발을 위한 사전 구성된 포트:
  - 8000 (MkDocs 미리보기)
  - 3000 (웹 앱)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 새로운 VS Code 확장**:
  - `ms-python.vscode-pylance` - 향상된 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 지원
  - `ms-azuretools.vscode-docker` - Docker 지원
  - `ms-azuretools.vscode-bicep` - Bicep 언어 지원
  - `ms-azure-devtools.azure-resource-groups` - Azure 리소스 관리
  - `yzhang.markdown-all-in-one` - Markdown 편집
  - `DavidAnson.vscode-markdownlint` - Markdown 린팅
  - `bierner.markdown-mermaid` - Mermaid 다이어그램 지원
  - `redhat.vscode-yaml` - YAML 지원 (azure.yaml 용)
  - `eamodio.gitlens` - Git 시각화
  - `mhutchie.git-graph` - Git 히스토리

- **⚙️ VS Code 설정**: Python 인터프리터, 저장 시 포맷, 공백 제거에 대한 기본 설정 추가

- **📦 requirements-dev.txt 업데이트**:
  - MkDocs minify 플러그인 추가
  - 코드 품질을 위한 pre-commit 추가
  - Azure SDK 패키지 추가(azure-identity, azure-mgmt-resource)

#### 수정됨
- **Post-Create Command**: 컨테이너 시작 시 AZD 및 Azure CLI 설치를 이제 확인함

---

### [v3.11.0] - 2026-02-05

#### 초심자 친화적 README 개편

**이 버전은 README.md를 초보자에게 더 접근하기 쉽게 크게 개선하고 AI 개발자를 위한 필수 리소스를 추가합니다.**

#### 추가됨
- **🆚 Azure CLI vs AZD 비교**: 각 도구를 언제 사용해야 하는지 실용적인 예제로 명확히 설명함
- **🌟 Awesome AZD 링크**: 커뮤니티 템플릿 갤러리 및 기여 리소스에 대한 직접 링크:
  - [Awesome AZD 갤러리](https://azure.github.io/awesome-azd/) - 200개 이상의 즉시 배포 가능한 템플릿
  - [템플릿 제출](https://github.com/Azure/awesome-azd/issues) - 커뮤니티 기여
- **🎯 빠른 시작 가이드**: 간소화된 3단계 시작 섹션(설치 → 로그인 → 배포)
- **📊 경험 기반 네비게이션 표**: 개발자 경험에 따라 어디서 시작할지에 대한 명확한 안내

#### 변경
- **README 구조**: 점진적 공개 방식으로 재구성 - 핵심 정보 우선
- **Introduction Section**: 완전 초보자를 위해 "The Magic of `azd up`"을 설명하도록 다시 작성됨
- **중복 콘텐츠 제거**: 중복된 문제 해결 섹션 제거
- **문제 해결 명령**: `azd logs` 참조를 유효한 `azd monitor --logs`로 수정함

#### 수정됨
- **🔐 인증 명령**: `azd auth login` 및 `azd auth logout`을 cheat-sheet.md에 추가함
- **잘못된 명령 참조**: README의 문제 해결 섹션에서 남아있는 `azd logs` 제거

#### 참고
- **적용 범위**: 변경 사항은 main README.md 및 resources/cheat-sheet.md에 적용됨
- **대상 독자**: 변경 사항은 AZD에 익숙하지 않은 개발자를 위해 특별히 설계됨

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 명령 정확성 업데이트

**이 버전은 문서 전반에 걸쳐 존재하지 않는 AZD 명령을 수정하여 모든 코드 예제가 유효한 Azure Developer CLI 구문을 사용하도록 합니다.**

#### 수정됨
- **🔧 존재하지 않는 AZD 명령 제거**: 잘못된 명령에 대한 포괄적인 감사 및 수정:
  - `azd logs` (존재하지 않음) → `azd monitor --logs` 또는 Azure CLI 대안으로 교체됨
  - `azd service` 하위 명령(존재하지 않음) → `azd show` 및 Azure CLI로 대체됨
  - `azd infra import/export/validate`(존재하지 않음) → 제거되거나 유효한 대안으로 교체됨
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 플래그(존재하지 않음) → 제거됨
  - `azd provision --what-if/--rollback` 플래그(존재하지 않음) → `--preview` 사용으로 업데이트됨
  - `azd config validate`(존재하지 않음) → `azd config list`로 교체됨
  - `azd info`, `azd history`, `azd metrics`(존재하지 않음) → 제거됨

- **📚 명령 수정이 적용된 파일**:
  - `resources/cheat-sheet.md`: 명령 참조의 대대적 개편
  - `docs/deployment/deployment-guide.md`: 롤백 및 배포 전략 수정
  - `docs/troubleshooting/debugging.md`: 로그 분석 섹션 수정
  - `docs/troubleshooting/common-issues.md`: 문제 해결 명령 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD 디버깅 섹션 수정
  - `docs/getting-started/azd-basics.md`: 모니터링 명령 수정
  - `docs/getting-started/first-project.md`: 모니터링 및 디버깅 예제 업데이트
  - `docs/getting-started/installation.md`: 도움말 및 버전 예제 수정
  - `docs/pre-deployment/application-insights.md`: 로그 보기 명령 수정
  - `docs/pre-deployment/coordination-patterns.md`: 에이전트 디버깅 명령 수정

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: 하드코딩된 `1.5.0` 버전을 일반 `1.x.x`로 변경하고 릴리스 링크 추가

#### 변경
- **롤백 전략**: AZD는 네이티브 롤백을 제공하지 않으므로 Git 기반 롤백을 사용하도록 문서 업데이트
- **로그 보기**: `azd logs` 참조를 `azd monitor --logs`, `azd monitor --live`, 및 Azure CLI 명령으로 대체함
- **성능 섹션**: 존재하지 않는 병렬/증분 배포 플래그를 제거하고 유효한 대안 제공

#### 기술 세부사항
- **유효한 AZD 명령**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **유효한 azd monitor 플래그**: `--live`, `--logs`, `--overview`
- **제거된 기능**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 참고
- <strong>검증</strong>: 명령어는 Azure Developer CLI v1.23.x 기준으로 검증됨

---

### [v3.9.0] - 2026-02-05

#### 워크숍 완료 및 문서 품질 업데이트
**이 버전은 대화형 워크숍 모듈을 완료하고, 모든 끊어진 문서 링크를 수정하며, Microsoft AZD를 사용하는 AI 개발자를 위한 전반적인 콘텐츠 품질을 향상합니다.**

#### 추가
- **📝 CONTRIBUTING.md**: 새로운 기여 가이드 문서로:
  - 이슈 보고 및 변경 제안에 대한 명확한 지침
  - 신규 콘텐츠에 대한 문서 표준
  - 코드 예제 지침 및 커밋 메시지 규칙
  - 커뮤니티 참여 정보

#### 완료
- **🎯 Workshop Module 7 (Wrap-up)**: 완전한 정리 모듈로 완료:
  - 워크숍 성과에 대한 포괄적인 요약
  - AZD, 템플릿 및 Microsoft Foundry를 다루는 핵심 개념 섹션
  - 학습 여정 지속 권장 사항
  - 난이도 등급이 포함된 워크숍 과제 연습 문제
  - 커뮤니티 피드백 및 지원 링크

- **📚 Workshop Module 3 (Deconstruct)**: 학습 목표 업데이트:
  - GitHub Copilot과 MCP 서버 활성화 안내
  - AZD 템플릿 폴더 구조 이해
  - Infrastructure-as-code(Bicep) 조직 패턴
  - 실습 랩 지침

- **🔧 Workshop Module 6 (Teardown)**: 완료됨:
  - 리소스 정리 및 비용 관리 목표
  - 안전한 인프라 해체를 위한 `azd down` 사용법
  - 소프트 삭제된 Cognitive Services 복구 안내
  - GitHub Copilot 및 Azure Portal에 대한 추가 탐색 프롬프트

#### 수정됨
- **🔗 끊어진 링크 수정**: 내부 문서의 15개 이상 끊어진 링크 해결:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md로의 경로 수정
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md 및 production-ai-practices.md 경로 수정
  - `docs/getting-started/first-project.md`: 존재하지 않는 cicd-integration.md를 deployment-guide.md로 교체
  - `examples/retail-scenario.md`: FAQ 및 문제 해결 가이드 경로 수정
  - `examples/container-app/microservices/README.md`: 코스 홈 및 배포 가이드 경로 수정
  - `resources/faq.md` 및 `resources/glossary.md`: AI 챕터 참조 업데이트
  - `course-outline.md`: 강사 가이드 및 AI 워크숍 랩 참조 수정

- **📅 워크숍 상태 배너**: 배너를 "Under Construction"에서 활성 워크숍 상태로 2026년 2월 날짜로 업데이트함

- **🔗 워크숍 내비게이션**: 워크숍 README.md의 잘못된 lab-1-azd-basics 폴더를 가리키는 내비게이션 링크 수정

#### 변경됨
- **워크숍 발표**: "under construction" 경고 제거, 워크숍이 이제 완료되어 사용 가능
- **내비게이션 일관성**: 모든 워크숍 모듈에 적절한 모듈 간 내비게이션 보장
- **학습 경로 참조**: 장(챕터) 간 교차 참조를 올바른 microsoft-foundry 경로로 업데이트

#### 검증됨
- ✅ 모든 영어 마크다운 파일의 내부 링크 유효성 확인
- ✅ 워크숍 모듈 0-7이 학습 목표와 함께 완성됨
- ✅ 챕터 및 모듈 간 내비게이션이 올바르게 작동함
- ✅ 콘텐츠가 Microsoft AZD를 사용하는 AI 개발자에게 적합함
- ✅ 초보자 친화적인 언어 및 구조 유지
- ✅ CONTRIBUTING.md가 커뮤니티 기여자에게 명확한 지침 제공

#### 기술적 구현
- **링크 검증**: PowerShell 자동화 스크립트로 모든 .md 내부 링크 검증
- **콘텐츠 감사**: 워크숍 완성도 및 초보자 적합성에 대한 수동 검토
- **내비게이션 시스템**: 일관된 챕터 및 모듈 내비게이션 패턴 적용

#### 참고
- <strong>범위</strong>: 변경 사항은 영어 문서에만 적용됨
- <strong>번역</strong>: 이번 버전에서는 번역 폴더가 업데이트되지 않음(자동 번역은 이후 동기화 예정)
- **워크숍 소요 시간**: 전체 워크숍은 이제 3-4시간의 실습 학습 제공

---

### [v3.8.0] - 2025-11-19

#### 고급 문서: 모니터링, 보안 및 다중 에이전트 패턴
**이 버전은 Application Insights 통합, 인증 패턴 및 프로덕션 배포를 위한 다중 에이전트 조정에 대한 포괄적인 A급 강의를 추가합니다.**

#### 추가
- **📊 Application Insights 통합 강의**: `docs/pre-deployment/application-insights.md`에 추가:
  - 자동 프로비저닝을 포함한 AZD 중심 배포
  - Application Insights + Log Analytics에 대한 완전한 Bicep 템플릿
  - 커스텀 텔레메트리를 포함한 작동 가능한 Python 애플리케이션(1,200+ 라인)
  - AI/LLM 모니터링 패턴(Microsoft Foundry Models 토큰/비용 추적)
  - 6개의 Mermaid 다이어그램(아키텍처, 분산 추적, 텔레메트리 흐름)
  - 3개의 실습 연습문제(경고, 대시보드, AI 모니터링)
  - Kusto 쿼리 예제 및 비용 최적화 전략
  - 실시간 메트릭 스트리밍 및 실시간 디버깅
  - 40-50분 학습 시간, 프로덕션 준비 패턴 포함

- **🔐 인증 및 보안 패턴 강의**: `docs/getting-started/authsecurity.md`에 추가:
  - 3가지 인증 패턴(연결 문자열, Key Vault, 관리 ID)
  - 안전한 배포를 위한 완전한 Bicep 인프라 템플릿
  - Azure SDK 통합이 포함된 Node.js 애플리케이션 코드
  - 3개의 완전한 연습(관리형 ID 활성화, 사용자 할당 ID, Key Vault 롤링)
  - 보안 모범 사례 및 RBAC 구성
  - 문제 해결 가이드 및 비용 분석
  - 프로덕션 준비 비밀번호 없는 인증 패턴

- **🤖 다중 에이전트 조정 패턴 강의**: `docs/pre-deployment/coordination-patterns.md`에 추가:
  - 5가지 조정 패턴(순차, 병렬, 계층적, 이벤트 기반, 합의)
  - 완전한 오케스트레이터 서비스 구현(Python/Flask, 1,500+ 라인)
  - 3개의 특화된 에이전트 구현(Research, Writer, Editor)
  - 메시지 큐잉을 위한 Service Bus 통합
  - 분산 시스템 상태 관리를 위한 Cosmos DB 사용
  - 에이전트 상호작용을 보여주는 6개의 Mermaid 다이어그램
  - 3개의 고급 연습문제(타임아웃 처리, 재시도 로직, 서킷 브레이커)
  - 비용 내역($240-565/월) 및 최적화 전략
  - 모니터링을 위한 Application Insights 통합

#### 향상됨
- **Pre-deployment 챕터**: 이제 포괄적인 모니터링 및 조정 패턴 포함
- **Getting Started 챕터**: 전문적인 인증 패턴으로 향상
- **프로덕션 준비성**: 보안에서 관측성까지의 완전한 범위 제공
- **강의 개요**: 챕터 3 및 6의 새 강의를 참조하도록 업데이트

#### 변경됨
- **학습 진행**: 코스 전반에 보안과 모니터링의 통합 개선
- **문서 품질**: 새 강의 전반에 걸쳐 일관된 A급 표준(95-97%)
- **프로덕션 패턴**: 엔터프라이즈 배포를 위한 엔드 투 엔드 완전 커버리지

#### 개선됨
- **개발자 경험**: 개발에서 프로덕션 모니터링까지의 명확한 경로
- **보안 표준**: 인증 및 시크릿 관리에 대한 전문 패턴
- <strong>관측성</strong>: AZD와 통합된 완전한 Application Insights 구현
- **AI 워크로드**: Microsoft Foundry Models 및 다중 에이전트 시스템에 대한 전문 모니터링

#### 검증됨
- ✅ 모든 강의에 완전한 작동 코드 포함(코드 스니펫 아님)
- ✅ 시각 학습을 위한 Mermaid 다이어그램 포함(3개 강의에 총 19개)
- ✅ 검증 단계가 있는 실습 연습문제 포함(총 9개)
- ✅ `azd up`으로 배포 가능한 프로덕션 준비 Bicep 템플릿
- ✅ 비용 분석 및 최적화 전략 포함
- ✅ 문제 해결 가이드 및 모범 사례 포함
- ✅ 검증 명령이 포함된 지식 점검

#### 문서 등급 결과
- **docs/pre-deployment/application-insights.md**: - 포괄적인 모니터링 가이드
- **docs/getting-started/authsecurity.md**: - 전문적인 보안 패턴
- **docs/pre-deployment/coordination-patterns.md**: - 고급 다중 에이전트 아키텍처
- **전체 신규 콘텐츠**: - 일관된 고품질 표준

#### 기술적 구현
- **Application Insights**: Log Analytics + 커스텀 텔레메트리 + 분산 추적
- <strong>인증</strong>: Managed Identity + Key Vault + RBAC 패턴
- **다중 에이전트**: Service Bus + Cosmos DB + Container Apps + 오케스트레이션
- <strong>모니터링</strong>: 실시간 메트릭 + Kusto 쿼리 + 경고 + 대시보드
- **비용 관리**: 샘플링 전략, 보존 정책, 예산 제어

### [v3.7.0] - 2025-11-19

#### 문서 품질 개선 및 Microsoft Foundry Models 예제 추가
**이 버전은 리포지토리 전반의 문서 품질을 향상시키고 gpt-4.1 채팅 인터페이스를 포함한 완전한 Microsoft Foundry Models 배포 예제를 추가합니다.**

#### 추가
- **🤖 Microsoft Foundry Models 채팅 예제**: `examples/azure-openai-chat/`에 완전한 gpt-4.1 배포 및 작동 구현:
  - Microsoft Foundry Models 인프라(완전한 gpt-4.1 모델 배포)
  - 대화 기록이 포함된 Python 커맨드라인 채팅 인터페이스
  - 안전한 API 키 저장을 위한 Key Vault 통합
  - 토큰 사용 추적 및 비용 추정
  - 속도 제한 및 오류 처리
  - 35-45분 배포 가이드가 포함된 포괄적 README
  - 11개의 프로덕션 준비 파일(Bicep 템플릿, Python 앱, 구성 파일 등)
- **📚 문서 연습문제**: 구성 가이드에 실습 연습문제 추가:
  - 연습 1: 다중 환경 구성(15분)
  - 연습 2: 시크릿 관리 연습(10분)
  - 명확한 성공 기준 및 검증 단계 포함
- **✅ 배포 검증**: 배포 가이드에 검증 섹션 추가:
  - 헬스 체크 절차
  - 성공 기준 체크리스트
  - 모든 배포 명령에 대한 예상 출력
  - 문제 해결 빠른 참조

#### 향상됨
- **examples/README.md**: A급 품질로 업데이트(93%):
  - 모든 관련 섹션에 azure-openai-chat 추가
  - 로컬 예제 수를 3개에서 4개로 업데이트
  - AI 애플리케이션 예제 표에 추가
  - 중급 사용자를 위한 빠른 시작에 통합
  - Microsoft Foundry 템플릿 섹션에 추가
  - 비교 매트릭스 및 기술 탐색 섹션 업데이트
- **문서 품질**: docs 폴더 전반에서 B+(87%) → A-(92%)로 향상:
  - 중요한 명령 예제에 예상 출력 추가
  - 구성 변경에 대한 검증 단계 포함
  - 실습 학습을 강화하기 위한 실무 연습 추가

#### 변경됨
- **학습 진행**: 중급 학습자를 위한 AI 예제의 통합 개선
- **문서 구조**: 명확한 결과를 가진 보다 실행 가능한 연습 문제
- **검증 프로세스**: 주요 워크플로우에 명시적 성공 기준 추가

#### 개선됨
- **개발자 경험**: Microsoft Foundry Models 배포 시간이 35-45분으로 단축(복잡한 대안의 60-90분 대비)
- **비용 투명성**: Microsoft Foundry Models 예제에 대한 명확한 비용 추정($50-200/월)
- **학습 경로**: azure-openai-chat으로 AI 개발자에 대한 명확한 진입점 제공
- **문서 표준**: 일관된 예상 출력 및 검증 단계

#### 검증됨
- ✅ Microsoft Foundry Models 예제가 `azd up`으로 완전 작동함
- ✅ 11개의 구현 파일 모두 문법적으로 올바름
- ✅ README 지침이 실제 배포 경험과 일치함
- ✅ 문서 링크가 8곳 이상에서 업데이트됨
- ✅ 예제 인덱스가 4개의 로컬 예제를 정확히 반영함
- ✅ 표에 중복된 외부 링크 없음
- ✅ 모든 내비게이션 참조가 올바름

#### 기술적 구현
- **Microsoft Foundry Models 아키텍처**: gpt-4.1 + Key Vault + Container Apps 패턴
- <strong>보안</strong>: 관리형 ID 준비, Key Vault에 시크릿 저장
- <strong>모니터링</strong>: Application Insights 통합
- **비용 관리**: 토큰 추적 및 사용량 최적화
- <strong>배포</strong>: 전체 설정을 위한 단일 `azd up` 명령

### [v3.6.0] - 2025-11-19

#### 주요 업데이트: Container App 배포 예제
**이 버전은 Azure Developer CLI(AZD)를 사용한 포괄적이고 프로덕션 준비된 컨테이너 애플리케이션 배포 예제를 도입하며, 완전한 문서화 및 학습 경로 통합을 포함합니다.**

#### 추가
- **🚀 Container App 예제**: `examples/container-app/`에 새로운 로컬 예제:
  - [Master Guide](examples/container-app/README.md): 컨테이너화된 배포에 대한 완전한 개요, 빠른 시작, 프로덕션 및 고급 패턴
  - [Simple Flask API](../../examples/container-app/simple-flask-api): 스케일-투-제로, 헬스 프로브, 모니터링 및 문제 해결을 갖춘 초급자용 REST API
  - [Microservices Architecture](../../examples/container-app/microservices): 프로덕션 준비 다중 서비스 배포(API Gateway, Product, Order, User, Notification), 비동기 메시징, Service Bus, Cosmos DB, Azure SQL, 분산 추적, 블루-그린/카나리 배포
- **모범 사례**: 컨테이너 워크로드를 위한 보안, 모니터링, 비용 최적화 및 CI/CD 지침
- **코드 샘플**: 완전한 `azure.yaml`, Bicep 템플릿 및 다중 언어 서비스 구현(Python, Node.js, C#, Go)
- **테스트 및 문제 해결**: 종단간 테스트 시나리오, 모니터링 명령, 문제 해결 지침

#### 변경됨
- **README.md**: "Local Examples - Container Applications" 아래에 새로운 컨테이너 앱 예제를 추가하고 링크하도록 업데이트됨
- **examples/README.md**: 컨테이너 앱 예제를 강조하고 비교 매트릭스 항목을 추가하며 기술/아키텍처 참조 업데이트
- **Course Outline & Study Guide**: 관련 챕터에서 새로운 컨테이너 앱 예제와 배포 패턴을 참조하도록 업데이트됨

#### 검증됨
- ✅ 모든 새로운 예제가 `azd up`로 배포 가능하며 모범 사례를 따름
- ✅ 문서 교차 링크 및 탐색이 업데이트됨
- ✅ 예제는 초급부터 고급 시나리오(프로덕션 마이크로서비스 포함)를 다룸

#### 참고
- <strong>범위</strong>: 영어 문서와 예제만
- **다음 단계**: 향후 릴리스에서 추가 고급 컨테이너 패턴 및 CI/CD 자동화를 확장

### [v3.5.0] - 2025-11-19

#### 제품 리브랜딩: Microsoft Foundry
**이 버전은 Microsoft의 공식 리브랜딩을 반영하여 영어 문서 전체에서 제품 이름을 "Microsoft Foundry"에서 "Microsoft Foundry"로 포괄적으로 변경합니다.**

#### 변경됨
- **🔄 제품 이름 업데이트**: "Microsoft Foundry"로의 완전한 리브랜딩
  - `docs/` 폴더의 영어 문서 전반에 걸친 모든 참조 업데이트
  - 폴더 이름 변경: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 파일 이름 변경: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 총: 7개의 문서 파일에 걸쳐 23개의 콘텐츠 참조 업데이트

- **📁 폴더 구조 변경**:
  - `docs/ai-foundry/`가 `docs/microsoft-foundry/`로 이름 변경됨
  - 모든 교차 참조가 새 폴더 구조를 반영하도록 업데이트됨
  - 문서 전반에서 내비게이션 링크가 검증됨

- **📄 파일 이름 변경**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 모든 내부 링크가 새 파일 이름을 참조하도록 업데이트됨

#### 업데이트된 파일들
- **챕터 문서** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 내비게이션 링크 3건 업데이트
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 제품 이름 참조 4건 업데이트
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 이전 업데이트에서 이미 Microsoft Foundry 사용
  - `docs/microsoft-foundry/production-ai-practices.md` - 참조 3건 업데이트(개요, 커뮤니티 피드백, 문서)
  - `docs/getting-started/azd-basics.md` - 교차 참조 링크 4건 업데이트
  - `docs/getting-started/first-project.md` - 챕터 내비게이션 링크 2건 업데이트
  - `docs/getting-started/installation.md` - 다음 챕터 링크 2건 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md` - 참조 3건 업데이트(내비게이션, Discord 커뮤니티)
  - `docs/troubleshooting/common-issues.md` - 내비게이션 링크 1건 업데이트
  - `docs/troubleshooting/debugging.md` - 내비게이션 링크 1건 업데이트

- **강의 구조 파일** (2 files):
  - `README.md` - 참조 17건 업데이트(강의 개요, 챕터 제목, 템플릿 섹션, 커뮤니티 인사이트)
  - `course-outline.md` - 참조 14건 업데이트(개요, 학습 목표, 챕터 자료)

#### 검증됨
- ✅ 영어 문서에서 남아 있는 "ai-foundry" 폴더 경로 참조 없음
- ✅ 영어 문서에서 남아 있는 "Microsoft Foundry" 제품 이름 참조 없음
- ✅ 새 폴더 구조로 모든 내비게이션 링크 정상 작동
- ✅ 파일 및 폴더 이름 변경이 성공적으로 완료됨
- ✅ 챕터 간 교차 참조가 검증됨

#### 참고
- <strong>범위</strong>: 변경사항은 `docs/` 폴더의 영어 문서에만 적용됨
- <strong>번역</strong>: 번역 폴더(`translations/`)는 이번 버전에 업데이트되지 않음
- <strong>워크숍</strong>: 워크숍 자료(`workshop/`)는 이번 버전에 업데이트되지 않음
- <strong>예제</strong>: 일부 예제 파일은 여전히 이전 명칭을 참조할 수 있음(향후 업데이트에서 처리 예정)
- **외부 링크**: 외부 URL 및 GitHub 리포지토리 참조는 변경되지 않음

#### 기여자를 위한 마이그레이션 가이드
로컬 브랜치나 이전 구조를 참조하는 문서가 있는 경우:
1. 폴더 참조 업데이트: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 파일 참조 업데이트: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 제품 이름 교체: "Microsoft Foundry" → "Microsoft Foundry"
4. 내부 문서 링크가 여전히 작동하는지 검증

---

### [v3.4.0] - 2025-10-24

#### 인프라 미리보기 및 검증 개선
**이 버전은 새로운 Azure Developer CLI 프리뷰 기능에 대한 포괄적인 지원을 도입하고 워크숍 사용자 경험을 향상시킵니다.**

#### 추가됨
- **🧪 azd provision --preview 기능 문서화**: 새로운 인프라 미리보기 기능에 대한 포괄적 설명
  - 명령 참조 및 치트시트의 사용 예시
  - 활용 사례 및 이점과 함께 프로비저닝 가이드에 상세 통합
  - 더 안전한 배포 검증을 위한 사전 점검 통합
  - 안전 우선 배포 관행을 반영한 시작 가이드 업데이트
- **🚧 워크숍 상태 배너**: 워크숍 개발 상태를 표시하는 전문적인 HTML 배너
  - 명확한 사용자 커뮤니케이션을 위한 그라디언트 디자인 및 공사 표식
  - 투명성을 위한 최종 업데이트 타임스탬프
  - 모든 기기 타입에 대응하는 모바일 반응형 디자인

#### 향상됨
- **인프라 안전성**: 문서 전반에 프리뷰 기능 통합
- **사전 배포 검증**: 자동화된 스크립트에 인프라 미리보기 테스트 포함
- **개발자 워크플로우**: 모범 사례로서 프리뷰를 포함하는 명령 시퀀스 업데이트
- **워크숍 경험**: 콘텐츠 개발 상태에 대한 명확한 기대치 설정

#### 변경됨
- **배포 모범 사례**: 프리뷰 우선 워크플로우가 권장 접근 방식으로 변경
- **문서 흐름**: 학습 과정에서 인프라 검증의 위치가 앞당겨짐
- **워크숍 발표**: 명확한 개발 일정과 함께 전문적인 상태 커뮤니케이션

#### 개선됨
- **안전 우선 접근**: 배포 전에 인프라 변경을 검증할 수 있음
- **팀 협업**: 검토와 승인을 위해 프리뷰 결과를 공유 가능
- **비용 인식**: 프로비저닝 전에 리소스 비용을 더 잘 이해
- **위험 완화**: 사전 검증을 통해 배포 실패 감소

#### 기술적 구현
- **다중 문서 통합**: 프리뷰 기능이 4개의 핵심 파일에서 문서화됨
- **명령 패턴**: 문서 전반에서 일관된 문법 및 예시 제공
- **모범 사례 통합**: 검증 워크플로우와 스크립트에 프리뷰 포함
- **시각적 표시기**: 새로운 기능 발견을 위한 명확한 NEW 표시

#### 워크숍 인프라
- **상태 커뮤니케이션**: 그라디언트 스타일의 전문적인 HTML 배너
- **사용자 경험**: 명확한 개발 상태로 혼동 방지
- **전문적 발표**: 기대치 설정과 함께 리포지토리 신뢰성 유지
- **타임라인 투명성**: 책임성을 위한 2025년 10월 최종 업데이트 타임스탬프

### [v3.3.0] - 2025-09-24

#### 향상된 워크숍 자료 및 인터랙티브 학습 경험
**이 버전은 브라우저 기반 인터랙티브 가이드와 구조화된 학습 경로를 포함한 포괄적인 워크숍 자료를 도입합니다.**

#### 추가됨
- **🎥 인터랙티브 워크숍 가이드**: MkDocs 미리보기 기능을 활용한 브라우저 기반 워크숍 경험
- **📝 구조화된 워크숍 지침**: 발견부터 맞춤화까지의 7단계 가이드 학습 경로
  - 0-Introduction: 워크숍 개요 및 설정
  - 1-Select-AI-Template: 템플릿 발견 및 선택 과정
  - 2-Validate-AI-Template: 배포 및 검증 절차
  - 3-Deconstruct-AI-Template: 템플릿 아키텍처 이해
  - 4-Configure-AI-Template: 구성 및 맞춤화
  - 5-Customize-AI-Template: 고급 수정 및 반복
  - 6-Teardown-Infrastructure: 정리 및 리소스 관리
  - 7-Wrap-up: 요약 및 다음 단계
- **🛠️ 워크숍 도구화**: 향상된 학습 경험을 위한 Material 테마의 MkDocs 구성
- **🎯 실습 학습 경로**: 3단계 방법론(발견 → 배포 → 맞춤화)
- **📱 GitHub Codespaces 통합**: 원활한 개발 환경 설정

#### 향상됨
- **AI 워크숍 랩**: 2-3시간의 구조화된 학습 경험으로 확장
- **워크숍 문서화**: 내비게이션 및 시각 자료를 포함한 전문적 발표
- **학습 진행**: 템플릿 선택부터 프로덕션 배포까지 단계별 명확한 안내
- **개발자 경험**: 통합된 도구로 개발 워크플로우 간소화

#### 개선됨
- <strong>접근성</strong>: 검색, 복사 기능 및 테마 토글을 갖춘 브라우저 기반 인터페이스
- **자기 주도 학습**: 다양한 학습 속도를 수용하는 유연한 워크숍 구조
- **실무 적용**: 실제 AI 템플릿 배포 시나리오
- **커뮤니티 통합**: 워크숍 지원과 협업을 위한 Discord 통합

#### 워크숍 기능
- **내장 검색**: 빠른 키워드 및 레슨 검색
- **코드 블록 복사**: 모든 코드 예제에 호버-투-복사 기능
- **테마 토글**: 선호에 따른 다크/라이트 모드 지원
- **시각 자산**: 이해를 돕기 위한 스크린샷 및 다이어그램
- **도움말 통합**: 커뮤니티 지원을 위한 직접 Discord 접근

### [v3.2.0] - 2025-09-17

#### 주요 내비게이션 재구성 및 챕터 기반 학습 시스템
**이 버전은 리포지토리 전체에 걸친 향상된 내비게이션과 함께 포괄적인 챕터 기반 학습 구조를 도입합니다.**

#### 추가됨
- **📚 챕터 기반 학습 시스템**: 전체 코스를 8개의 점진적 학습 챕터로 재구성
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 포괄적 내비게이션 시스템**: 모든 문서에서 일관된 내비게이션 헤더 및 푸터 적용
- **🎯 진행 추적**: 코스 완료 체크리스트 및 학습 검증 시스템
- **🗺️ 학습 경로 안내**: 다양한 경험 수준과 목표에 맞는 명확한 진입점
- **🔗 교차 참조 내비게이션**: 관련 챕터 및 선행 조건을 명확히 연결

#### 향상됨
- **README 구조**: 챕터 기반 조직으로 구조화된 학습 플랫폼으로 전환
- **문서 내비게이션**: 모든 페이지에 챕터 컨텍스트 및 진행 안내 포함
- **템플릿 조직**: 예제와 템플릿을 적절한 학습 챕터에 매핑
- **리소스 통합**: 치트시트, FAQ 및 학습 가이드가 관련 챕터에 연결됨
- **워크숍 통합**: 실습 랩을 여러 챕터 학습 목표에 매핑

#### 변경됨
- **학습 진행 방식**: 선형 문서 구성에서 유연한 챕터 기반 학습으로 전환
- **구성 안내 위치**: 더 나은 학습 흐름을 위해 구성 가이드를 챕터 3으로 재배치
- **AI 콘텐츠 통합**: 학습 여정 전반에 AI 관련 내용의 더 나은 통합
- **프로덕션 콘텐츠**: 고급 패턴을 기업용 학습자 대상으로 챕터 8에 통합

#### 개선됨
- **사용자 경험**: 명확한 내비게이션 브레드크럼 및 챕터 진행 표시
- <strong>접근성</strong>: 코스 탐색을 용이하게 하는 일관된 내비게이션 패턴
- **전문적 발표**: 학술 및 기업 교육에 적합한 대학 스타일의 코스 구조
- **학습 효율성**: 개선된 구성으로 관련 콘텐츠를 찾는 시간 단축

#### 기술적 구현
- **내비게이션 헤더**: 40개 이상의 문서 파일에 걸쳐 표준화된 챕터 내비게이션 적용
- **푸터 내비게이션**: 일관된 진행 안내 및 챕터 완료 표시
- **교차 링크**: 관련 개념을 연결하는 포괄적 내부 링크 시스템
- **챕터 매핑**: 템플릿과 예제를 학습 목표에 명확히 연결

#### 학습 가이드 향상
- **📚 포괄적 학습 목표**: 8챕터 시스템에 맞게 재구성된 학습 가이드
- **🎯 챕터 기반 평가**: 각 챕터에 특정 학습 목표와 실습 과제 포함
- **📋 진행 추적**: 측정 가능한 결과 및 완료 체크리스트가 포함된 주간 학습 일정
- **❓ 평가 질문**: 각 챕터별 지식 검증 질문과 전문적 결과
- **🛠️ 실습 과제**: 실제 배포 시나리오 및 문제 해결을 포함한 실무 활동
- **📊 기술 발전**: 기초 개념에서 엔터프라이즈 패턴까지의 명확한 진전 및 경력 개발 초점
- **🎓 인증 프레임워크**: 전문 개발 결과 및 커뮤니티 인정 시스템
- **⏱️ 타임라인 관리**: 마일스톤 검증이 포함된 10주 구조화된 학습 계획

### [v3.1.0] - 2025-09-17

#### 향상된 멀티-에이전트 AI 솔루션
**이 버전은 에이전트 명명 규칙 개선 및 문서 강화로 소매 멀티-에이전트 솔루션을 향상시킵니다.**

#### 변경됨
- **멀티-에이전트 용어집**: 소매 멀티-에이전트 솔루션 전반에서 "Cora agent"를 더 명확한 이해를 위해 "Customer agent"로 교체
- **에이전트 아키텍처**: 모든 문서, ARM 템플릿 및 코드 예제를 일관된 "Customer agent" 명칭으로 업데이트
- **구성 예제**: 업데이트된 명명 규칙으로 에이전트 구성 패턴 현대화
- **문서 일관성**: 모든 참조가 전문적이고 설명적인 에이전트 이름을 사용하도록 보장

#### 향상됨
- **ARM Template Package**: retail-multiagent-arm-template을 Customer 에이전트 참조로 업데이트
- **Architecture Diagrams**: 업데이트된 에이전트 명칭으로 Mermaid 다이어그램 새로고침
- **Code Examples**: Python 클래스와 구현 예제가 이제 CustomerAgent 명명 사용
- **Environment Variables**: 모든 배포 스크립스를 CUSTOMER_AGENT_NAME 규약으로 업데이트

#### Improved
- **Developer Experience**: 문서에서 에이전트 역할과 책임이 더 명확해짐
- **Production Readiness**: 엔터프라이즈 명명 규칙과 더 잘 정렬됨
- **Learning Materials**: 교육 목적으로 더 직관적인 에이전트 명명
- **Template Usability**: 에이전트 기능과 배포 패턴 이해가 단순화됨

#### Technical Details
- Mermaid 아키텍처 다이어그램을 CustomerAgent 참조로 업데이트
- Python 예제에서 CoraAgent 클래스명을 CustomerAgent로 교체
- ARM 템플릿 JSON 구성을 "customer" 에이전트 타입을 사용하도록 수정
- 환경 변수를 CORA_AGENT_*에서 CUSTOMER_AGENT_* 패턴으로 업데이트
- 모든 배포 명령과 컨테이너 구성을 새로고침

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: AI 개발자 및 엔지니어를 우선시하는 완전한 구조 재편
- **Microsoft Foundry Integration Guide**: AZD를 Microsoft Foundry 서비스와 연결하는 포괄적 문서
- **AI Model Deployment Patterns**: 모델 선택, 구성 및 프로덕션 배포 전략을 다루는 상세 가이드
- **AI Workshop Lab**: AI 애플리케이션을 AZD 배포 가능 솔루션으로 전환하는 2-3시간 실습 워크숍
- **Production AI Best Practices**: 확장, 모니터링 및 AI 워크로드 보안을 위한 엔터프라이즈 준비 패턴
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services 및 AI 배포 이슈에 대한 포괄적 문제 해결 가이드
- **AI Template Gallery**: 복잡도 등급이 있는 Microsoft Foundry 템플릿 추천 모음
- **Workshop Materials**: 실습 랩과 참조 자료를 포함한 완전한 워크숍 구조

#### Enhanced
- **README Structure**: AI 개발자 중심으로 재구성되었으며 Microsoft Foundry Discord의 45% 커뮤니티 관심 데이터 반영
- **Learning Paths**: 학생 및 DevOps 엔지니어를 위한 전통적 경로와 함께 전용 AI 개발자 여정 제공
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart를 포함한 추천 AI 템플릿
- **Community Integration**: AI 전용 채널 및 토론을 포함한 Discord 커뮤니티 지원 강화

#### Security & Production Focus
- **Managed Identity Patterns**: AI 전용 인증 및 보안 구성
- **Cost Optimization**: 토큰 사용 추적 및 AI 워크로드 예산 제어
- **Multi-Region Deployment**: 글로벌 AI 애플리케이션 배포 전략
- **Performance Monitoring**: AI 전용 지표 및 Application Insights 통합

#### Documentation Quality
- **Linear Course Structure**: 초급에서 고급 AI 배포 패턴까지의 논리적 진행
- **Validated URLs**: 외부 리포지토리 링크 모두 검증 및 접근 가능
- **Complete Reference**: 내부 문서 링크 모두 검증 및 정상 작동
- **Production Ready**: 실제 사례가 포함된 엔터프라이즈 배포 패턴

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: 모든 문서 페이지에 이제 Introduction, Learning Goals, Learning Outcomes 섹션 추가
- **Navigation System**: 안내형 학습 진행을 위해 모든 문서에 Previous/Next 레슨 링크 추가
- **Study Guide**: 학습 목표, 실습 문제 및 평가 자료를 포함한 포괄적 study-guide.md
- **Professional Presentation**: 접근성 및 전문성 향상을 위해 모든 이모지 아이콘 제거
- **Enhanced Content Structure**: 학습 자료의 조직 및 흐름 개선

#### Changed
- **Documentation Format**: 일관된 학습 중심 구조로 모든 문서 표준화
- **Navigation Flow**: 모든 학습 자료에 대한 논리적 진행 구현
- **Content Presentation**: 장식적 요소를 제거하고 명확하고 전문적인 포맷으로 변경
- **Link Structure**: 새로운 내비게이션 시스템을 지원하도록 모든 내부 링크 업데이트

#### Improved
- **Accessibility**: 화면 낭독기 호환성을 위해 이모지 의존성 제거
- **Professional Appearance**: 엔터프라이즈 학습에 적합한 깔끔한 학문적 스타일
- **Learning Experience**: 각 레슨의 명확한 목표와 결과를 갖춘 구조화된 접근 방식
- **Content Organization**: 관련 주제 간의 더 나은 논리적 흐름 및 연결

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - 완전한 시작 가이드 시리즈
  - 포괄적인 배포 및 프로비저닝 문서
  - 상세한 문제 해결 리소스 및 디버깅 가이드
  - 사전 배포 검증 도구 및 절차

- **Getting Started Module**
  - AZD Basics: 핵심 개념 및 용어
  - Installation Guide: 플랫폼별 설정 지침
  - Configuration Guide: 환경 설정 및 인증
  - First Project Tutorial: 단계별 실습 학습

- **Deployment and Provisioning Module**
  - Deployment Guide: 전체 워크플로 문서
  - Provisioning Guide: Bicep을 사용한 Infrastructure as Code
  - 프로덕션 배포를 위한 모범 사례
  - 다중 서비스 아키텍처 패턴

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure 리소스 가용성 검증
  - SKU Selection: 서비스 계층에 대한 포괄적 안내
  - Pre-flight Checks: 자동화된 검증 스크립트(PowerShell 및 Bash)
  - 비용 추정 및 예산 계획 도구

- **Troubleshooting Module**
  - Common Issues: 자주 발생하는 문제와 해결책
  - Debugging Guide: 체계적인 문제 해결 방법론
  - 고급 진단 기법 및 도구
  - 성능 모니터링 및 최적화

- **Resources and References**
  - Command Cheat Sheet: 필수 명령에 대한 빠른 참조
  - Glossary: 용어 및 약어 정의
  - FAQ: 자주 묻는 질문에 대한 상세 답변
  - 외부 리소스 링크 및 커뮤니티 연결

- **Examples and Templates**
  - Simple Web Application 예제
  - Static Website 배포 템플릿
  - Container Application 구성
  - 데이터베이스 통합 패턴
  - 마이크로서비스 아키텍처 예제
  - 서버리스 함수 구현

#### Features
- **Multi-Platform Support**: Windows, macOS, Linux에 대한 설치 및 구성 가이드
- **Multiple Skill Levels**: 학생부터 전문 개발자까지를 위한 콘텐츠
- **Practical Focus**: 실습 예제 및 실제 시나리오 중심
- **Comprehensive Coverage**: 기본 개념부터 고급 엔터프라이즈 패턴까지
- **Security-First Approach**: 전반에 걸쳐 통합된 보안 모범 사례
- **Cost Optimization**: 비용 효율적인 배포 및 리소스 관리를 위한 안내

#### Documentation Quality
- **Detailed Code Examples**: 실용적이며 테스트된 코드 샘플
- **Step-by-Step Instructions**: 명확하고 실행 가능한 지침
- **Comprehensive Error Handling**: 일반적인 문제에 대한 문제 해결
- **Best Practices Integration**: 업계 표준 및 권장 사항 통합
- **Version Compatibility**: 최신 Azure 서비스 및 azd 기능과 최신 상태 유지

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning 및 커스텀 모델 통합 패턴
- **AI Agent Frameworks**: LangChain, Semantic Kernel, AutoGen 배포를 위한 템플릿
- **Advanced RAG Patterns**: Azure AI Search 외의 벡터 DB 옵션(Pinecone, Weaviate 등)
- **AI Observability**: 모델 성능, 토큰 사용량 및 응답 품질에 대한 향상된 모니터링

#### Developer Experience
- **VS Code Extension**: AZD + Microsoft Foundry 통합 개발 경험
- **GitHub Copilot Integration**: AI 지원 AZD 템플릿 생성
- **Interactive Tutorials**: AI 시나리오에 대한 자동 검증이 포함된 실습 코딩 연습
- **Video Content**: AI 배포에 중점을 둔 시각 학습자를 위한 보완 동영상 튜토리얼

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI 모델 거버넌스, 규정 준수 및 감사 추적
- **Multi-Tenant AI**: 격리된 AI 서비스를 통해 여러 고객을 제공하는 패턴
- **Edge AI Deployment**: Azure IoT Edge 및 컨테이너 인스턴스와의 통합
- **Hybrid Cloud AI**: AI 워크로드를 위한 멀티클라우드 및 하이브리드 배포 패턴

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning 파이프라인과의 MLOps 통합
- **Advanced Security**: 제로 트러스트 패턴, private endpoints 및 고급 위협 방어
- **Performance Optimization**: 고처리량 AI 애플리케이션을 위한 고급 튜닝 및 스케일링 전략
- **Global Distribution**: AI 애플리케이션을 위한 콘텐츠 전송 및 엣지 캐싱 패턴

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: 향상된 IDE 및 에디터 통합 가이드
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: 모바일 학습을 위한 반응형 디자인
- **Offline Access**: 다운로드 가능한 문서 패키지
- **Enhanced IDE Integration**: AZD + AI 워크플로우용 VS Code 확장
- **Community Dashboard**: 실시간 커뮤니티 지표 및 기여 추적

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- 새로운 기능, 문서 섹션 또는 기능
- 새로운 예제, 템플릿 또는 학습 리소스
- 추가 도구, 스크립트 또는 유틸리티

#### Changed
- 기존 기능 또는 문서에 대한 수정
- 명확성 또는 정확성 향상을 위한 업데이트
- 콘텐츠 또는 조직 재구성

#### Deprecated
- 단계적으로 제거되는 기능 또는 접근 방식
- 제거 예정인 문서 섹션
- 더 나은 대안이 있는 방법

#### Removed
- 더 이상 관련이 없는 기능, 문서 또는 예제
- 오래된 정보 또는 더 이상 사용되지 않는 접근 방식
- 중복되거나 통합된 콘텐츠

#### Fixed
- 문서 또는 코드의 오류 수정
- 보고된 문제 또는 문제 해결
- 정확성 또는 기능성 개선

#### Security
- 보안 관련 개선 또는 수정
- 보안 모범 사례 업데이트
- 보안 취약점 해결

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- 사용자 조치가 필요한 브레이킹 변경
- 콘텐츠 또는 조직의 중대한 재구성
- 근본적 접근 방식 또는 방법론을 변경하는 변경사항

#### Minor Version (X.Y.0)
- 새로운 기능 또는 콘텐츠 추가
- 하위 호환성을 유지하는 향상
- 추가 예제, 도구 또는 리소스

#### Patch Version (X.Y.Z)
- 버그 수정 및 정정
- 기존 콘텐츠에 대한 소규모 개선
- 설명 및 작은 향상

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: 문제 보고 또는 개선 제안 (AI 관련 이슈 환영)
- **Discord Discussions**: 아이디어 공유 및 Microsoft Foundry 커뮤니티 참여
- **Pull Requests**: 특히 AI 템플릿 및 가이드에 대한 직접적인 콘텐츠 개선 기여
- **Microsoft Foundry Discord**: AZD + AI 토론을 위한 #Azure 채널 참여
- **Community Forums**: 광범위한 Azure 개발자 토론 참여

### Feedback Categories
- **AI Content Accuracy**: AI 서비스 통합 및 배포 정보의 정확성 수정
- **Learning Experience**: AI 개발자 학습 흐름 개선 제안
- **Missing AI Content**: 추가 AI 템플릿, 패턴 또는 예제 요청
- **Accessibility**: 다양한 학습 요구를 위한 개선
- **AI Tool Integration**: 더 나은 AI 개발 워크플로우 통합 제안
- **Production AI Patterns**: 엔터프라이즈 AI 배포 패턴 요청

### Response Commitment
- **Issue Response**: 보고된 문제에 대해 48시간 이내 응답
- **Feature Requests**: 일주일 내 평가
- **Community Contributions**: 일주일 내 검토
- **Security Issues**: 즉시 우선 처리 및 신속한 대응

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: 콘텐츠 정확성 및 링크 검증
- **Quarterly Updates**: 주요 콘텐츠 추가 및 개선
- **Semi-Annual Reviews**: 종합적인 재구성 및 향상
- **Annual Releases**: 중대한 개선이 포함된 주요 버전 업데이트

### Monitoring and Quality Assurance
- **Automated Testing**: 코드 예제 및 링크의 정기적 검증
- **Community Feedback Integration**: 사용자 제안의 정기적 반영
- **Technology Updates**: 최신 Azure 서비스 및 azd 릴리스에 대한 정렬
- **Accessibility Audits**: 포괄적 디자인 원칙에 대한 정기 검토

## Version Support Policy
- **최신 메이저 버전**: 정기적인 업데이트로 완전 지원
- **이전 메이저 버전**: 12개월 동안 보안 업데이트 및 중요 수정 제공
- **레거시 버전**: 커뮤니티 지원만 제공, 공식 업데이트 없음

### 마이그레이션 안내
메이저 버전이 출시될 때 다음을 제공합니다:
- **마이그레이션 가이드**: 단계별 전환 지침
- **호환성 노트**: 비호환 변경에 대한 세부 정보
- **도구 지원**: 마이그레이션을 돕는 스크립트 또는 유틸리티
- **커뮤니티 지원**: 마이그레이션 관련 질문을 위한 전용 포럼

---

<strong>탐색</strong>
- **이전 레슨**: [학습 가이드](resources/study-guide.md)
- **다음 레슨**: [메인 README](README.md)로 돌아가기

**업데이트 확인**: 새 릴리스 및 학습 자료의 중요한 업데이트에 대한 알림을 받기 위해 이 저장소를 지켜보세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 알려드립니다. 원문(원어) 문서는 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사가 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->