# 변경 로그 - AZD 초보자용

## 소개

이 변경 로그는 AZD 초보자용 저장소에 대한 모든 주목할 만한 변경 사항, 업데이트 및 개선 사항을 문서화합니다. 우리는 의미 체계 버전 관리 원칙을 준수하며, 이 로그를 통해 사용자가 버전 간 변경 내용을 이해할 수 있도록 유지합니다.

## 학습 목표

이 변경 로그를 검토함으로써, 당신은:
- 새로운 기능 및 콘텐츠 추가 사항을 파악할 수 있습니다.
- 기존 문서에 이루어진 개선 사항을 이해할 수 있습니다.
- 정확성을 보장하기 위한 버그 수정 및 정정 사항을 추적할 수 있습니다.
- 학습 자료의 진화를 시간에 따라 따라갈 수 있습니다.

## 학습 성과

변경 로그 항목을 검토한 후, 당신은:
- 학습에 사용할 수 있는 새로운 콘텐츠와 리소스를 식별할 수 있습니다.
- 어떤 섹션이 업데이트되었거나 개선되었는지 이해할 수 있습니다.
- 최신 자료를 기반으로 학습 경로를 계획할 수 있습니다.
- 향후 개선을 위한 피드백과 제안을 제공할 수 있습니다.

## 버전 이력

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 명령어, 콘텐츠 검증 및 템플릿 확장
**이 버전은 모든 AI 관련 챕터에 `azd ai`, `azd extension`, `azd mcp` 명령어 지원을 추가하고, agents.md의 끊어진 링크와 더 이상 사용되지 않는 코드를 수정하며, 치트 시트를 업데이트하고, 검증된 설명과 새로운 Azure AI AZD 템플릿으로 예제 템플릿 섹션을 대대적으로 개편합니다.**

#### 추가됨
- **🤖 AZD AI CLI 지원** 7개 파일에 확장 (기존에는 8장에만 적용):
  - `docs/chapter-01-foundation/azd-basics.md` — `azd extension`, `azd ai agent init`, `azd mcp`를 소개하는 "확장 및 AI 명령" 새 섹션
  - `docs/chapter-02-ai-development/agents.md` — 옵션 4: `azd ai agent init` 및 템플릿 대 매니페스트 접근 방식 비교 표
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry용 AZD 확장"과 "Agent-First 배포" 하위 섹션
  - `docs/chapter-05-multi-agent/README.md` — 빠른 시작에 템플릿 및 매니페스트 방식 배포 경로 모두 표시
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 배포 섹션에 `azd ai agent init` 옵션 포함
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "진단을 위한 AZD AI 확장 명령" 하위 섹션
  - `resources/cheat-sheet.md` — `azd extension`, `azd ai agent init`, `azd mcp`, `azd infra generate`를 포함한 "AI 및 확장 명령" 새 섹션
- **📦 새로운 AZD AI 예제 템플릿** `microsoft-foundry-integration.md`에 추가:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel 및 음성 채팅 지원하는 .NET RAG 챗
  - **azure-search-openai-demo-java** — ACA/AKS 배포 옵션이 포함된 Langchain4J 기반 Java RAG 챗
  - **contoso-creative-writer** — Azure AI Agent 서비스, Bing Grounding, Prompty 기반 다중 에이전트 창작 앱
  - **serverless-chat-langchainjs** — Ollama 로컬 개발 지원 포함 Azure Functions + LangChain.js + Cosmos DB 서버리스 RAG
  - **chat-with-your-data-solution-accelerator** — 관리 포털, Teams 통합 및 PostgreSQL/Cosmos DB 옵션이 포함된 엔터프라이즈 RAG 가속기
  - **azure-ai-travel-agents** — .NET, Python, Java, TypeScript 서버를 갖춘 다중 에이전트 MCP 오케스트레이션 참조 앱
  - **azd-ai-starter** — 최소한의 Azure AI 인프라 Bicep 시작 템플릿
  - **🔗 Awesome AZD AI 갤러리 링크** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) 참조 (80개 이상의 템플릿)

#### 수정됨
- **🔗 agents.md 내비게이션**: 이전/다음 링크를 장 2 README 수업 순서에 맞게 수정 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md 끊어진 링크**: `production-ai-practices.md`를 `../chapter-08-production/production-ai-practices.md`로 수정 (3회 발생)
- **📦 agents.md 더 이상 지원되지 않는 코드**: `opencensus`를 `azure-monitor-opentelemetry` + OpenTelemetry SDK로 교체
- **🐛 agents.md 잘못된 API**: `create_agent()`에서 `create_run()`로 `max_tokens`를 `max_completion_tokens`로 이동
- **🔢 agents.md 토큰 계산**: 대략적인 `len//4` 추정 방식을 `tiktoken.encoding_for_model()`로 대체
- **azure-search-openai-demo**: 서비스 설명을 "Cognitive Search + App Service"에서 "Azure AI Search + Azure Container Apps"로 수정 (기본 호스트 2024년 10월 변경)
- **contoso-chat**: 설명을 Azure AI Foundry + Prompty로 업데이트하여 저장소 실제 제목 및 기술 스택과 일치시킴

#### 제거됨
- **ai-document-processing**: 작동하지 않는 템플릿 참조 삭제 (공개적으로 AZD 템플릿으로 접근 불가)

#### 개선됨
- **📝 agents.md 연습 문제**: 1번 연습 문제에 예상 출력과 `azd monitor` 단계 추가; 2번 연습 문제에 전체 `FunctionTool` 등록 코드 포함; 3번 연습 문제에 모호한 지시 사항을 구체적인 `prepdocs.py` 명령으로 대체
- **📚 agents.md 자료**: Azure AI Agent 서비스의 최신 문서 및 빠른 시작 링크로 업데이트
- **📋 agents.md 다음 단계 표**: 전체 장 커버리지를 위한 AI 워크숍 실습 링크 추가

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

#### 코스 내비게이션 개선
**이 버전은 README.md 챕터 내비게이션을 향상된 테이블 형식으로 개선했습니다.**

#### 변경됨
- **코스 맵 테이블**: 직접 수업 링크, 예상 소요 시간, 난이도 등급이 포함되도록 개선
- **폴더 정리**: 중복된 오래된 폴더 삭제 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **링크 검증**: 코스 맵 테이블 내 21개 이상의 내부 링크 모두 검증 완료

### [v3.16.0] - 2026-02-05

#### 제품명 업데이트
**이 버전은 Microsoft의 최신 브랜드명을 반영하도록 제품 참조를 업데이트했습니다.**

#### 변경됨
- **Microsoft Foundry → Microsoft Foundry**: 번역 대상이 아닌 파일 전체에서 모든 참조 업데이트
- **Azure AI Agent Service → Foundry Agents**: 서비스 명칭을 최신 브랜드명에 맞게 변경

#### 업데이트된 파일
- `README.md` - 메인 코스 랜딩 페이지
- `changelog.md` - 버전 이력
- `course-outline.md` - 코스 구조
- `docs/chapter-02-ai-development/agents.md` - AI 에이전트 가이드
- `examples/README.md` - 예제 문서
- `workshop/README.md` - 워크숍 랜딩 페이지
- `workshop/docs/index.md` - 워크숍 인덱스
- `workshop/docs/instructions/*.md` - 워크숍 지침 파일 모두

---

### [v3.15.0] - 2026-02-05

#### 주요 저장소 구조 개편: 챕터별 폴더명
**이 버전은 문서들을 명확한 내비게이션을 위해 전용 챕터 폴더로 재구조화했습니다.**

#### 폴더명 변경
기존 폴더가 챕터 번호가 붙은 폴더로 대체됨:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 새로 추가됨: `docs/chapter-05-multi-agent/`

#### 파일 이동
| 파일 | 이전 위치 | 새 위치 |
|------|----------|--------|
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
- **📚 챕터 README 파일**: 각 챕터 폴더에 README.md 생성, 내용:
  - 학습 목표 및 소요 시간
  - 설명이 포함된 강의 표
  - 빠른 시작 명령어
  - 다른 챕터로의 내비게이션

#### 변경됨
- **🔗 모든 내부 링크 업데이트**: 문서 전반에 걸쳐 78개 이상의 경로 수정
- **🗺️ 메인 README.md**: 신규 챕터 구조로 코스 맵 업데이트
- **📝 examples/README.md**: 챕터 폴더에 맞게 교차 참조 업데이트

#### 제거됨
- 기존 폴더 구조 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 저장소 구조 개편: 챕터 내비게이션
**이 버전은 챕터 내비게이션 README 파일을 추가했습니다 (v3.15.0에 의해 대체됨).**

---

### [v3.13.0] - 2026-02-05

#### 새로운 AI 에이전트 가이드
**이 버전은 Azure Developer CLI를 사용해 AI 에이전트를 배포하는 종합 가이드를 추가했습니다.**

#### 추가됨
- **🤖 docs/microsoft-foundry/agents.md**: 다음 내용을 포함하는 완전한 가이드:
  - AI 에이전트란 무엇인지, 챗봇과의 차이
  - 3가지 빠른 시작 에이전트 템플릿(Foundry Agents, Prompty, RAG)
  - 에이전트 아키텍처 패턴(단일 에이전트, RAG, 다중 에이전트)
  - 도구 설정 및 사용자 정의
  - 모니터링 및 지표 추적
  - 비용 고려사항 및 최적화
  - 일반적인 문제 해결 시나리오
  - 성공 기준이 포함된 3가지 실습 연습

#### 콘텐츠 구성
- <strong>소개</strong>: 초보자를 위한 에이전트 개념
- **빠른 시작**: `azd init --template get-started-with-ai-agents` 명령으로 에이전트 배포
- **아키텍처 패턴**: 에이전트 패턴 시각적 다이어그램
- <strong>구성</strong>: 도구 설정 및 환경 변수 설명
- <strong>모니터링</strong>: Application Insights 통합 안내
- <strong>실습</strong>: 단계별 실습 학습(각 20-45분 소요)

---

### [v3.12.0] - 2026-02-05

#### DevContainer 환경 업데이트
**이 버전은 AZD 학습 경험을 위해 최신 도구 및 향상된 기본값으로 개발 컨테이너 구성을 업데이트했습니다.**

#### 변경됨
- **🐳 베이스 이미지**: `python:3.12-bullseye`에서 `python:3.12-bookworm`(최신 Debian 안정 버전)으로 변경
- **📛 컨테이너 이름**: 명확성을 위해 "Python 3"에서 "AZD for Beginners"로 변경

#### 추가됨
- **🔧 새로운 개발 컨테이너 기능**:
  - Bicep 지원이 활성화된 `azure-cli`
  - `node:20` (AZD 템플릿용 LTS 버전)
  - 템플릿 관리를 위한 `github-cli`
  - 컨테이너 앱 배포를 위한 `docker-in-docker`

- **🔌 포트 포워딩**: 일반 개발에 사전 구성된 포트:
  - 8000 (MkDocs 미리보기)
  - 3000 (웹 앱)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 새로운 VS 코드 확장**:
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

- **⚙️ VS 코드 설정**: Python 인터프리터, 저장 시 포맷, 공백 제거에 대한 기본 설정 추가

- **📦 requirements-dev.txt 업데이트**:
  - MkDocs minify 플러그인 추가
  - 코드 품질을 위한 pre-commit 추가
  - Azure SDK 패키지 추가 (azure-identity, azure-mgmt-resource)

#### 수정
- **Post-Create 명령**: 컨테이너 시작 시 AZD 및 Azure CLI 설치 여부 확인 추가

---

### [v3.11.0] - 2026-02-05

#### 초보자 친화적 README 개편
**이 버전은 README.md를 초보자에게 더 접근하기 쉽게 크게 개선하고 AI 개발자를 위한 필수 리소스를 추가했습니다.**

#### 추가됨
- **🆚 Azure CLI와 AZD 비교**: 각 도구 사용 시기 명확히 설명 및 실제 예제 제공
- **🌟 멋진 AZD 링크 모음**: 커뮤니티 템플릿 갤러리 및 기여 리소스 직접 링크:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200개 이상 배포 준비된 템플릿
  - [템플릿 제출](https://github.com/Azure/awesome-azd/issues) - 커뮤니티 기여 페이지
- **🎯 빠른 시작 가이드**: 간소화된 3단계 시작 절차 (설치 → 로그인 → 배포)
- **📊 경험 기반 내비게이션 표**: 개발자 경험에 따라 어디서 시작할지 명확한 안내

#### 변경됨
- **README 구조**: 점진적 공개 방식으로 재구성 — 핵심 정보 우선 배치
- **소개 섹션**: 완전 초보자를 위한 "The Magic of `azd up`" 설명으로 재작성
- **중복 내용 제거**: 중복된 문제 해결 섹션 삭제
- **문제 해결 명령어**: `azd logs` 관련 내용 유효한 `azd monitor --logs` 명령어로 수정

#### 수정됨
- **🔐 인증 명령어**: `cheat-sheet.md`에 `azd auth login` 및 `azd auth logout` 추가
- **잘못된 명령 참조**: README 문제 해결 섹션에서 남은 `azd logs` 제거

#### 참고
- **대상 범위**: main README.md 및 resources/cheat-sheet.md에 변경 적용
- **대상 독자**: AZD 초보 개발자를 위한 개선

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 명령 정확도 업데이트
**이 버전은 문서 전반에 존재하지 않는 AZD 명령을 수정하여 모든 코드 예제가 유효한 Azure Developer CLI 구문을 사용하도록 합니다.**

#### 수정됨
- **🔧 존재하지 않는 AZD 명령 제거**: 무효한 명령 전면 검토 및 수정:
  - `azd logs` (존재하지 않음) → `azd monitor --logs` 또는 Azure CLI 대체
  - `azd service` 하위 명령 (존재하지 않음) → `azd show` 및 Azure CLI 대체
  - `azd infra import/export/validate` (존재하지 않음) → 삭제 또는 유효한 대체
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 플래그 (존재하지 않음) → 삭제
  - `azd provision --what-if/--rollback` 플래그 (존재하지 않음) → `--preview`로 변경
  - `azd config validate` (존재하지 않음) → `azd config list`로 변경
  - `azd info`, `azd history`, `azd metrics` (존재하지 않음) → 삭제

- **📚 명령 수정 적용 파일**:
  - `resources/cheat-sheet.md`: 명령 참조 전면 개편
  - `docs/deployment/deployment-guide.md`: 롤백 및 배포 전략 수정
  - `docs/troubleshooting/debugging.md`: 로그 분석 섹션 수정
  - `docs/troubleshooting/common-issues.md`: 문제 해결 명령 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD 디버깅 섹션 수정
  - `docs/getting-started/azd-basics.md`: 모니터링 명령 수정
  - `docs/getting-started/first-project.md`: 모니터링 및 디버깅 예제 수정
  - `docs/getting-started/installation.md`: 도움말 및 버전 예제 수정
  - `docs/pre-deployment/application-insights.md`: 로그 보기 명령 수정
  - `docs/pre-deployment/coordination-patterns.md`: 에이전트 디버깅 명령 수정

- **📝 버전 참조 업데이트**:
  - `docs/getting-started/installation.md`: 하드코딩된 `1.5.0` 버전을 일반적인 `1.x.x`로 변경 및 릴리스 링크 추가

#### 변경됨
- **롤백 전략**: Git 기반 롤백 사용으로 문서 업데이트 (AZD 자체 롤백 기능 없음)
- **로그 보기**: `azd logs` 참조를 `azd monitor --logs`, `azd monitor --live`, Azure CLI 명령으로 변경
- **성능 섹션**: 존재하지 않는 병렬/증분 배포 플래그 삭제, 유효한 대체 제공

#### 기술 세부사항
- **유효한 AZD 명령**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **유효한 azd monitor 플래그**: `--live`, `--logs`, `--overview`
- **제거된 기능**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 참고
- <strong>검증</strong>: Azure Developer CLI v1.23.x 기준 명령어 검증 완료

---

### [v3.9.0] - 2026-02-05

#### 워크숍 완성 및 문서 품질 개선
**이 버전은 대화형 워크숍 모듈을 완성하고 모든 깨진 문서 링크를 수정하며 Microsoft AZD를 사용하는 AI 개발자를 위한 콘텐츠 품질을 향상시킵니다.**

#### 추가됨
- **📝 CONTRIBUTING.md**: 새로운 기여 지침 문서로:
  - 문제 보고 및 변경 제안 명확한 안내
  - 신규 콘텐츠 문서화 표준
  - 코드 예제 가이드라인 및 커밋 메시지 규칙
  - 커뮤니티 참여 정보

#### 완료됨
- **🎯 워크숍 모듈 7 (마무리)**: 완전 완성된 마무리 모듈로:
  - 워크숍 성과 종합 요약
  - AZD, 템플릿, Microsoft Foundry 관련 핵심 개념 마스터 섹션
  - 학습 여정 지속 권장 사항
  - 난이도 별 워크숍 챌린지 연습 문제
  - 커뮤니티 피드백 및 지원 링크

- **📚 워크숍 모듈 3 (분해)**: 학습 목표 업데이트:
  - MCP 서버와 연동한 GitHub Copilot 활성화 안내
  - AZD 템플릿 폴더 구조 이해
  - 코드형 인프라(Bicep) 조직 패턴
  - 실습 랩 지침

- **🔧 워크숍 모듈 6 (해체)**: 완성:
  - 리소스 정리 및 비용 관리 목표
  - 안전한 인프라 제거를 위한 `azd down` 사용법
  - 소프트 삭제된 인지 서비스 복구 안내
  - GitHub Copilot 및 Azure Portal 추가 탐색 안내

#### 수정됨
- **🔗 깨진 링크 수정**: 15개 이상 내부 문서 링크 문제 해결:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md 경로 수정
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md 및 production-ai-practices.md 경로 보정
  - `docs/getting-started/first-project.md`: 없는 cicd-integration.md를 deployment-guide.md로 변경
  - `examples/retail-scenario.md`: FAQ 및 문제 해결 가이드 경로 수정
  - `examples/container-app/microservices/README.md`: 코스 홈 및 배포 가이드 경로 수정
  - `resources/faq.md` 및 `resources/glossary.md`: AI 챕터 참조 업데이트
  - `course-outline.md`: 강사 가이드 및 AI 워크숍 랩 참조 수정

- **📅 워크숍 상태 배너**: "공사 중"에서 2026년 2월의 활성 워크숍 상태로 변경

- **🔗 워크숍 내비게이션**: README.md 내 깨진 링크 수정, 존재하지 않는 lab-1-azd-basics 폴더 참조 제거

#### 변경됨
- **워크숍 발표**: "공사 중" 경고 제거, 워크숍 완성 및 사용 준비 완료
- **내비게이션 일관성**: 모든 모듈 간 적절한 내비게이션 확보
- **학습 경로 참조**: 올바른 microsoft-foundry 경로로 챕터 교차 참조 업데이트

#### 검증됨
- ✅ 모든 영어 마크다운 파일 내부 링크 유효 확인
- ✅ 워크숍 모듈 0~7 완성 및 학습 목표 포함
- ✅ 챕터 및 모듈 간 내비게이션 정상 작동
- ✅ Microsoft AZD를 사용하는 AI 개발자에 적합한 콘텐츠
- ✅ 초보자 친화적 언어 및 구조 전반 유지
- ✅ CONTRIBUTING.md가 커뮤니티 기여자에게 명확한 안내 제공

#### 기술 구현
- **링크 검증**: 자동화된 PowerShell 스크립트로 모든 .md 내부 링크 검증 완료
- **콘텐츠 감사**: 워크숍 완성도 및 초보자 적합성 수동 검토
- **내비게이션 시스템**: 일관된 챕터 및 모듈 내비게이션 패턴 적용

#### 참고
- <strong>범위</strong>: 영어 문서에만 변경 적용
- <strong>번역</strong>: 이 버전에서는 번역 폴더 미업데이트 (자동 번역 추후 동기화 예정)
- **워크숍 소요 시간**: 완성된 워크숍은 3~4시간 실습 학습 제공

---

### [v3.8.0] - 2025-11-19

#### 고급 문서: 모니터링, 보안, 다중 에이전트 패턴
**이 버전은 Application Insights 통합, 인증 패턴, 생산용 배포용 다중 에이전트 협업에 관한 종합적인 A급 강의를 추가합니다.**

#### 추가됨
- **📊 Application Insights 통합 강의**: `docs/pre-deployment/application-insights.md`에서:
  - AZD 중심 배포와 자동 프로비저닝
  - Application Insights + Log Analytics 완전한 Bicep 템플릿
  - 커스텀 텔레메트리 포함 Python 애플리케이션 (1,200+ 줄)
  - AI/LLM 모니터링 패턴 (Microsoft Foundry 모델 토큰/비용 추적)
  - 6개의 Mermaid 다이어그램 (아키텍처, 분산 추적, 텔레메트리 흐름)
  - 3가지 실습 (알림, 대시보드, AI 모니터링)
  - Kusto 쿼리 예제 및 비용 최적화 전략
  - 실시간 메트릭 스트리밍 및 실시간 디버깅
  - 40~50분 학습 시간, 생산 준비용 패턴 포함

- **🔐 인증 및 보안 패턴 강의**: `docs/getting-started/authsecurity.md`에서:
  - 3가지 인증 패턴 (연결 문자열, Key Vault, 관리 ID)
  - 보안 배포를 위한 완전한 Bicep 인프라 템플릿
  - Azure SDK 통합된 Node.js 애플리케이션 코드
  - 3가지 완전한 실습 (관리 ID 활성화, 사용자 할당 ID, Key Vault 회전)
  - 보안 모범 사례 및 RBAC 구성
  - 문제 해결 가이드 및 비용 분석
  - 생산용 무암호 인증 패턴

- **🤖 다중 에이전트 협력 패턴 강의**: `docs/pre-deployment/coordination-patterns.md`에서:
  - 5가지 협력 패턴 (순차, 병렬, 계층적, 이벤트 기반, 합의)
  - 완전한 오케스트레이터 서비스 구현 (Python/Flask, 1,500+ 줄)
  - 3가지 특화 에이전트 구현 (연구, 작성, 편집)
  - 서비스 버스 통합 메시지 큐잉
  - 분산 시스템을 위한 Cosmos DB 상태 관리
  - 6개의 Mermaid 다이어그램 (에이전트 상호작용)
  - 3가지 고급 실습 (타임아웃 처리, 재시도 로직, 서킷 브레이커)
  - 비용 분석 ($240-$565/월) 및 최적화 전략
  - 모니터링을 위한 Application Insights 통합

#### 향상됨
- **사전 배포 챕터**: 종합적인 모니터링 및 협력 패턴 포함
- **시작하기 챕터**: 전문 인증 패턴으로 강화
- **생산 준비**: 보안부터 가시성까지 완벽한 커버리지
- **강의 개요**: 3장과 6장의 새로운 강의 참조 업데이트

#### 변경됨
- **학습 진행**: 보안과 모니터링의 통합적 적용 개선
- **문서 품질**: 새로운 강의 전반에 걸쳐 일관된 A급 기준(95-97%) 유지
- **생산 패턴**: 기업 배포를 위한 완전한 엔드투엔드 커버리지

#### 향상됨
- **개발자 경험**: 개발에서 생산 모니터링까지 명확한 경로
- **보안 표준**: 인증 및 비밀 관리에 대한 전문 패턴
- **관측 가능성**: AZD와 완전한 Application Insights 통합
- **AI 워크로드**: Microsoft Foundry 모델과 다중 에이전트 시스템을 위한 전문 모니터링

#### 검증 완료
- ✅ 모든 수업에 완전한 작동 코드 포함(코드 조각 아님)
- ✅ 시각적 학습을 위한 Mermaid 다이어그램 포함(3개 수업에 걸쳐 총 19개)
- ✅ 검증 단계가 포함된 실습 과제(총 9개)
- ✅ `azd up`으로 배포 가능한 프로덕션 준비 Bicep 템플릿
- ✅ 비용 분석 및 최적화 전략
- ✅ 문제 해결 가이드 및 모범 사례
- ✅ 검증 명령어가 포함된 지식 점검

#### 문서 평가 결과
- **docs/pre-deployment/application-insights.md**: - 포괄적인 모니터링 가이드
- **docs/getting-started/authsecurity.md**: - 전문적인 보안 패턴
- **docs/pre-deployment/coordination-patterns.md**: - 고급 다중 에이전트 아키텍처
- **전체 신규 콘텐츠**: - 일관되게 높은 품질 기준

#### 기술 구현
- **Application Insights**: 로그 분석 + 맞춤 원격 측정 + 분산 추적
- <strong>인증</strong>: 관리형 ID + Key Vault + RBAC 패턴
- **다중 에이전트**: 서비스 버스 + Cosmos DB + 컨테이너 앱 + 오케스트레이션
- <strong>모니터링</strong>: 라이브 메트릭 + Kusto 쿼리 + 경고 + 대시보드
- **비용 관리**: 샘플링 전략, 보존 정책, 예산 제어

### [v3.7.0] - 2025-11-19

#### 문서 품질 개선 및 신규 Microsoft Foundry 모델 예제 추가
**이번 버전은 저장소 전반의 문서 품질을 향상시키고 gpt-4.1 채팅 인터페이스를 갖춘 완전한 Microsoft Foundry 모델 배포 예제를 추가합니다.**

#### 추가됨
- **🤖 Microsoft Foundry 모델 채팅 예제**: `examples/azure-openai-chat/`에서 완전한 gpt-4.1 배포 및 작동 구현 포함:
  - Microsoft Foundry 모델 인프라(전체 gpt-4.1 모델 배포)
  - 대화 기록이 포함된 Python 명령줄 채팅 인터페이스
  - 안전한 API 키 저장을 위한 Key Vault 통합
  - 토큰 사용 추적 및 비용 추산
  - 속도 제한 및 오류 처리
  - 35~45분 배포 가이드가 포함된 포괄적 README
  - 프로덕션 준비가 된 11개 파일(Bicep 템플릿, Python 앱, 구성)
- **📚 문서 실습 과제**: 구성 가이드에 실습 과제 추가:
  - 과제 1: 다중 환경 구성(15분)
  - 과제 2: 비밀 관리 실습(10분)
  - 명확한 성공 기준 및 검증 단계 포함
- **✅ 배포 검증**: 배포 가이드에 검증 섹션 추가:
  - 상태 점검 절차
  - 성공 기준 체크리스트
  - 모든 배포 명령어의 예상 출력
  - 문제 해결 빠른 참조

#### 향상됨
- **examples/README.md**: A 등급 품질(93%)로 업데이트:
  - azure-openai-chat를 모든 관련 섹션에 추가
  - 로컬 예제 수 3개에서 4개로 업데이트
  - AI 애플리케이션 예제 표에 추가
  - 중급 사용자용 빠른 시작에 통합
  - Microsoft Foundry 템플릿 섹션에 추가
  - 비교 매트릭스 및 기술 발견 섹션 업데이트
- **문서 품질**: docs 폴더 전반에 걸쳐 B+(87%) → A-(92%)로 향상:
  - 중요 명령 예제에 예상 출력 추가
  - 구성 변경에 대한 검증 단계 포함
  - 실습 학습 강화 및 실제 연습 포함

#### 변경됨
- **학습 진행**: 중급 학습자를 위한 AI 예제 더 좋은 통합
- **문서 구조**: 명확한 결과가 있는 더 실행 가능한 실습 과제
- **검증 프로세스**: 주요 작업 흐름에 명확한 성공 기준 추가

#### 개선됨
- **개발자 경험**: Microsoft Foundry 모델 배포 시간 35~45분으로 단축(기존 복잡한 대안은 60~90분)
- **비용 투명성**: Microsoft Foundry 모델 예제의 명확한 비용 추산($50~200/월)
- **학습 경로**: azure-openai-chat으로 AI 개발자가 명확한 진입점 확보
- **문서 기준**: 예상 출력과 검증 단계 일관성 유지

#### 검증 완료
- ✅ `azd up`으로 Microsoft Foundry 모델 예제 완전 작동 확인
- ✅ 11개 구현 파일 모두 구문적으로 올바름
- ✅ README 지침이 실제 배포 경험과 일치
- ✅ 8개 이상의 위치에 문서 링크 업데이트 완료
- ✅ 예제 인덱스가 4개 로컬 예제를 정확하게 반영
- ✅ 표 내 중복 외부 링크 없음
- ✅ 모든 내비게이션 참조 정확

#### 기술 구현
- **Microsoft Foundry 모델 아키텍처**: gpt-4.1 + Key Vault + 컨테이너 앱 패턴
- <strong>보안</strong>: 관리형 ID 준비, Key Vault 내 비밀
- <strong>모니터링</strong>: Application Insights 통합
- **비용 관리**: 토큰 추적 및 사용 최적화
- <strong>배포</strong>: 단일 `azd up` 명령으로 전체 설정

### [v3.6.0] - 2025-11-19

#### 주요 업데이트: 컨테이너 앱 배포 예제
**이번 버전은 Azure Developer CLI(AZD)를 사용하여 완전한 문서화와 학습 경로 통합이 포함된 프로덕션 준비 컨테이너 애플리케이션 배포 예제를 소개합니다.**

#### 추가됨
- **🚀 컨테이너 앱 예제**: `examples/container-app/`에 새로운 로컬 예제:
  - [마스터 가이드](examples/container-app/README.md): 컨테이너화 배포, 빠른 시작, 프로덕션 및 고급 패턴 전체 개요
  - [간단한 Flask API](../../examples/container-app/simple-flask-api): 스케일 투 제로, 상태 검사, 모니터링, 문제 해결을 갖춘 초보자 친화 REST API
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices): 프로덕션 준비 다중 서비스 배포(API Gateway, Product, Order, User, Notification), 비동기 메시징, 서비스 버스, Cosmos DB, Azure SQL, 분산 추적, 블루-그린/카나리아 배포
- **모범 사례**: 컨테이너화 워크로드를 위한 보안, 모니터링, 비용 최적화, CI/CD 지침
- **코드 샘플**: 완전한 `azure.yaml`, Bicep 템플릿, 다중 언어 서비스 구현(Python, Node.js, C#, Go)
- **테스트 및 문제 해결**: 엔드 투 엔드 테스트 시나리오, 모니터링 명령, 문제 해결 가이드

#### 변경됨
- **README.md**: "로컬 예제 - 컨테이너 애플리케이션" 아래 새 컨테이너 앱 예제 링크 및 특징 업데이트
- **examples/README.md**: 컨테이너 앱 예제 강조, 비교 매트릭스 항목 추가, 기술/아키텍처 참조 업데이트
- **과정 개요 및 학습 가이드**: 관련 챕터에서 새 컨테이너 앱 예제 및 배포 패턴 참조로 업데이트

#### 검증 완료
- ✅ 새 예제 전부 `azd up`으로 배포 가능하며 모범 사례 준수
- ✅ 문서 간 크로스 링크 및 내비게이션 업데이트
- ✅ 초보자부터 고급 시나리오, 프로덕션 마이크로서비스 포함

#### 참고
- <strong>범위</strong>: 영어 문서와 예제에 한함
- **향후 계획**: 추가 고급 컨테이너 패턴 및 CI/CD 자동화 확대 예정

### [v3.5.0] - 2025-11-19

#### 제품 리브랜딩: Microsoft Foundry
**이번 버전은 영어 문서 전체에서 "Microsoft Foundry"에 대한 포괄적인 제품명 변경을 적용하여 Microsoft의 공식 리브랜딩을 반영합니다.**

#### 변경됨
- **🔄 제품명 업데이트**: "Microsoft Foundry"로 완전 리브랜딩
  - `docs/` 폴더 내 모든 영어 문서 참조 업데이트
  - 폴더명 변경: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 파일명 변경: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 총 7개 문서에서 23개 콘텐츠 참조 변경

- **📁 폴더 구조 변경**:
  - `docs/ai-foundry/` → `docs/microsoft-foundry/`로 이름 변경
  - 모든 크로스 참조 반영하여 업데이트
  - 문서 내비게이션 링크 검증 완료

- **📄 파일명 변경**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 내부 링크 전부 새 파일명으로 업데이트

#### 업데이트된 파일
- **챕터 문서** (7개 파일):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 내비게이션 링크 3건 업데이트
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 제품명 참조 4건 업데이트
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 이미 Microsoft Foundry 사용 중(이전 업데이트 포함)
  - `docs/microsoft-foundry/production-ai-practices.md` - 참조 3건 업데이트(개요, 커뮤니티 피드백, 문서)
  - `docs/getting-started/azd-basics.md` - 크로스 참조 링크 4건 업데이트
  - `docs/getting-started/first-project.md` - 챕터 내비게이션 링크 2건 업데이트
  - `docs/getting-started/installation.md` - 다음 챕터 링크 2건 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md` - 참조 3건 업데이트(내비게이션, Discord 커뮤니티)
  - `docs/troubleshooting/common-issues.md` - 내비게이션 링크 1건 업데이트
  - `docs/troubleshooting/debugging.md` - 내비게이션 링크 1건 업데이트

- **과정 구조 파일** (2개 파일):
  - `README.md` - 17건 참조 업데이트(과정 개요, 챕터 제목, 템플릿 섹션, 커뮤니티 인사이트)
  - `course-outline.md` - 14건 참조 업데이트(개요, 학습 목표, 챕터 리소스)

#### 검증 완료
- ✅ 영어 문서에 남아있는 "ai-foundry" 폴더 경로 참조 0건
- ✅ 영어 문서에 남아있는 "Microsoft Foundry" 제품명 참조 0건
- ✅ 새 폴더 구조에 따른 내비게이션 링크 기능 정상
- ✅ 파일 및 폴더명 변경 완전 완료
- ✅ 챕터 간 크로스 참조 검증 완료

#### 참고
- <strong>범위</strong>: 영어 `docs/` 폴더 문서에만 변경 적용
- <strong>번역문서</strong>: `translations/` 폴더는 이번 버전에서 업데이트 없음
- **워크숍 자료**: `workshop/` 폴더는 이번 버전에서 업데이트 없음
- <strong>예제</strong>: 예제 파일은 아직 이전 이름 참조 가능(차후 업데이트 예정)
- **외부 링크**: 외부 URL 및 GitHub 저장소 참조는 변경 없음

#### 기여자용 마이그레이션 가이드
지역 브랜치나 문서가 이전 구조를 참조하는 경우:
1. 폴더 참조 업데이트: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 파일 참조 업데이트: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 제품명 교체: "Microsoft Foundry" → "Microsoft Foundry"
4. 내부 문서 링크 정상 작동 여부 검증

---

### [v3.4.0] - 2025-10-24

#### 인프라 미리보기 및 검증 강화
**이번 버전은 Azure Developer CLI 미리보기 기능 전면 지원을 도입하고 워크숍 사용자 경험을 향상시킵니다.**

#### 추가됨
- **🧪 azd provision --preview 기능 문서**: 신규 인프라 미리보기 기능을 포괄적으로 커버
  - 명령어 참조 및 치트 시트 사용 예시 포함
  - 프로비저닝 가이드에 상세 통합, 사용 사례 및 장점 설명
  - 사전 점검(Pre-flight) 통합으로 안정적 배포 검증 지원
  - 안전 우선 배포 관행 반영한 시작 가이드 업데이트
- **🚧 워크숍 상태 배너**: 워크숍 개발 상태를 나타내는 전문 HTML 배너
  - 그라디언트 디자인과 공사 표시로 명확한 사용자 커뮤니케이션
  - 최종 수정 시간 표시로 투명성 제공
  - 모든 기기 대응 모바일 반응형 디자인

#### 향상됨
- **인프라 안전성**: 배포 문서 전반에 미리보기 기능 통합
- **사전 배포 검증**: 자동화 스크립트에 인프라 미리보기 검증 포함
- **개발자 워크플로우**: 미리보기 포함 명령어 시퀀스가 모범 사례로 업데이트
- **워크숍 경험**: 개발 상태에 대한 명확한 기대치 설정

#### 변경됨
- **배포 모범 사례**: 미리보기 우선 워크플로우를 권장하는 접근법으로 변경
- **문서 흐름**: 학습 과정 중 인프라 검증 단계를 앞당김
- **워크숍 발표**: 전문적 상태 커뮤니케이션과 명확한 개발 일정 안내

#### 개선됨
- **안전 우선 접근법**: 배포 전 인프라 변경 사항 검증 가능
- **팀 협업**: 미리보기 결과 공유로 검토 및 승인 지원
- **비용 인식**: 프로비저닝 전 자원 비용 명확히 파악
- **위험 완화**: 사전 검증으로 배포 실패율 저감

#### 기술 구현
- **다중 문서 통합**: 4개 주요 파일에 미리보기 기능 문서화
- **명령어 패턴**: 일관된 문법과 예제 모두 문서에 반영
- **모범 사례 통합**: 검증 워크플로우 및 스크립트에 미리보기 포함
- **시각적 표시**: 신규 기능 식별용 명확한 NEW 마크업 적용

#### 워크숍 인프라
- **상태 커뮤니케이션**: 그라디언트 스타일의 전문 HTML 배너
- **사용자 경험**: 명확한 개발 상태 표시로 혼란 방지
- **전문성 유지**: 저장소 신뢰성 유지 및 기대치 설정
- **일정 투명성**: 2025년 10월 최종 업데이트 시점 표시

### [v3.3.0] - 2025-09-24

#### 향상된 워크숍 자료 및 인터랙티브 학습 경험
**이번 버전은 브라우저 기반 인터랙티브 가이드와 구조화된 학습 경로를 포함한 포괄적인 워크숍 자료를 도입합니다.**

#### 추가됨
- **🎥 대화형 워크숍 가이드**: MkDocs 미리보기 기능을 갖춘 브라우저 기반 워크숍 경험  
- **📝 구조화된 워크숍 지침**: 발견부터 맞춤화까지 7단계의 안내 학습 경로  
  - 0-소개: 워크숍 개요 및 설정  
  - 1-AI-템플릿-선택: 템플릿 발견 및 선택 과정  
  - 2-AI-템플릿-검증: 배포 및 검증 절차  
  - 3-AI-템플릿-해체: 템플릿 아키텍처 이해  
  - 4-AI-템플릿-구성: 구성 및 맞춤화  
  - 5-AI-템플릿-사용자화: 고급 수정 및 반복  
  - 6-인프라-해체: 정리 및 리소스 관리  
  - 7-마무리: 요약 및 다음 단계  
- **🛠️ 워크숍 도구**: 향상된 학습 경험을 위한 Material 테마가 적용된 MkDocs 구성  
- **🎯 실습 학습 경로**: 3단계 방법론 (발견 → 배포 → 맞춤화)  
- **📱 GitHub Codespaces 통합**: 원활한 개발 환경 설정  

#### 향상됨  
- **AI 워크숍 랩**: 2-3시간 구조화된 종합 학습 경험 확장  
- **워크숍 문서화**: 내비게이션 및 시각적 보조 자료가 포함된 전문적 프레젠테이션  
- **학습 진행**: 템플릿 선택부터 프로덕션 배포까지 단계별 명확한 안내  
- **개발자 경험**: 통합 도구로 효율적인 개발 워크플로우 제공  

#### 개선됨  
- <strong>접근성</strong>: 검색, 복사 기능 및 테마 전환을 지원하는 브라우저 기반 인터페이스  
- **자율 학습**: 다양한 학습 속도를 수용하는 유연한 워크숍 구조  
- **실용적 응용**: 실제 AI 템플릿 배포 시나리오  
- **커뮤니티 통합**: 워크숍 지원 및 협업을 위한 Discord 통합  

#### 워크숍 기능  
- **내장 검색**: 빠른 키워드 및 강의 탐색  
- **코드 블록 복사**: 모든 코드 예제에 마우스 오버 시 복사 기능  
- **테마 전환**: 선호도에 따른 다크/라이트 모드 지원  
- **시각적 자료**: 이해를 돕는 스크린샷 및 다이어그램  
- **도움말 통합**: 커뮤니티 지원을 위한 직접 Discord 접근  

### [v3.2.0] - 2025-09-17  

#### 주요 내비게이션 재구성 및 챕터 기반 학습 시스템  
**이 버전은 저장소 전체에 향상된 내비게이션과 포괄적인 챕터 기반 학습 구조를 도입합니다.**  

#### 추가됨  
- **📚 챕터 기반 학습 시스템**: 8개의 점진적 학습 챕터로 전체 과정 재구성  
  - 챕터 1: 기초 및 빠른 시작 (⭐ - 30-45분)  
  - 챕터 2: AI 우선 개발 (⭐⭐ - 1-2시간)  
  - 챕터 3: 구성 및 인증 (⭐⭐ - 45-60분)  
  - 챕터 4: 코드로서의 인프라 및 배포 (⭐⭐⭐ - 1-1.5시간)  
  - 챕터 5: 다중 에이전트 AI 솔루션 (⭐⭐⭐⭐ - 2-3시간)  
  - 챕터 6: 배포 전 검증 및 계획 (⭐⭐ - 1시간)  
  - 챕터 7: 문제 해결 및 디버깅 (⭐⭐ - 1-1.5시간)  
  - 챕터 8: 프로덕션 및 엔터프라이즈 패턴 (⭐⭐⭐⭐ - 2-3시간)  
- **📚 종합 내비게이션 시스템**: 모든 문서에 일관된 내비게이션 헤더 및 푸터 적용  
- **🎯 진행 추적**: 과정 완료 체크리스트 및 학습 확인 시스템  
- **🗺️ 학습 경로 안내**: 다양한 경험 수준과 목표에 따른 명확한 진입 지점  
- **🔗 교차 참조 내비게이션**: 관련 챕터 및 필수 과목 명확히 연결  

#### 향상됨  
- **README 구조**: 챕터 기반 구성으로 구조화된 학습 플랫폼으로 변환  
- **문서 내비게이션**: 각 페이지에 챕터 맥락 및 진행 안내 포함  
- **템플릿 구성**: 예제 및 템플릿을 적절한 학습 챕터에 매핑  
- **자원 통합**: 관련 챕터에 연계된 치트 시트, FAQ, 학습 가이드  
- **워크숍 통합**: 다양한 챕터 학습 목표에 매핑된 실습 랩  

#### 변경됨  
- **학습 진행**: 선형 문서에서 유연한 챕터 기반 학습으로 전환  
- **구성 위치**: 학습 흐름 향상을 위해 구성 가이드를 챕터 3으로 재배치  
- **AI 콘텐츠 통합**: AI 특화 콘텐츠를 학습 여정 전반에 더 잘 통합  
- **프로덕션 콘텐츠**: 고급 패턴을 엔터프라이즈 학습자용으로 챕터 8에 통합  

#### 개선됨  
- **사용자 경험**: 명확한 내비게이션 브레드크럼 및 챕터 진행 표시기  
- <strong>접근성</strong>: 과정 탐색을 위한 일관성 있는 내비게이션 패턴  
- **전문적 프레젠테이션**: 학술 및 기업 교육에 적합한 대학 스타일 과정 구조  
- **학습 효율성**: 향상된 구성으로 관련 콘텐츠 탐색 시간 단축  

#### 기술 구현  
- **내비게이션 헤더**: 40개 이상의 문서 파일에 표준화된 챕터 내비게이션 적용  
- **푸터 내비게이션**: 일관된 진행 안내 및 챕터 완료 표시기 제공  
- **교차 링크**: 관련 개념을 연결하는 종합 내부 링크 시스템  
- **챕터 매핑**: 학습 목표에 명확히 연계된 템플릿 및 예제  

#### 학습 가이드 향상  
- **📚 종합 학습 목표**: 8개 챕터 체계에 맞춘 구조화된 학습 가이드  
- **🎯 챕터 기반 평가**: 각 챕터별 구체적 학습 목표와 실습 문제 포함  
- **📋 진행 추적**: 측정 가능한 결과 및 완료 체크리스트가 있는 주간 학습 일정  
- **❓ 평가 질문**: 각 챕터별 지식 검증 질문 및 전문적 결과  
- **🛠️ 실습 과제**: 실제 배포 시나리오 및 문제 해결이 포함된 실습 활동  
- **📊 기술 발전**: 기초 개념부터 엔터프라이즈 패턴까지 명확한 기술 향상 및 경력 개발 집중  
- **🎓 인증 체계**: 전문성 개발 결과 및 커뮤니티 인정 시스템  
- **⏱️ 일정 관리**: 마일스톤 검증이 포함된 구조화된 10주 학습 계획  

### [v3.1.0] - 2025-09-17  

#### 향상된 다중 에이전트 AI 솔루션  
**이 버전은 에이전트 명명 및 문서 개선을 통해 소매 다중 에이전트 솔루션을 향상시켰습니다.**  

#### 변경됨  
- **다중 에이전트 명명법**: 소매 다중 에이전트 솔루션 전반에서 "Cora agent"를 "Customer agent"로 교체하여 이해도를 높임  
- **에이전트 아키텍처**: 모든 문서, ARM 템플릿, 코드 예제에서 일관된 "Customer agent" 명칭 사용  
- **구성 예제**: 최신 명명법을 적용한 에이전트 구성 패턴 현대화  
- **문서 일관성**: 전문적이고 설명적인 에이전트 명칭으로 모든 참조 통일  

#### 향상됨  
- **ARM 템플릿 패키지**: retail-multiagent-arm-template에 Customer agent 참조 업데이트  
- **아키텍처 다이어그램**: 최신 명칭으로 Mermaid 다이어그램 새로 고침  
- **코드 예제**: Python 클래스 및 구현 예제가 CustomerAgent 명칭 사용  
- **환경 변수**: 모든 배포 스크립트에서 CUSTOMER_AGENT_NAME 규칙으로 업데이트  

#### 개선됨  
- **개발자 경험**: 문서 내 에이전트 역할 및 책임 명확화  
- **프로덕션 준비도**: 엔터프라이즈 명명 규칙과 더 나은 일치  
- **학습 자료**: 교육용으로 더 직관적인 에이전트 명칭  
- **템플릿 사용성**: 에이전트 기능 및 배포 패턴 이해 용이성 향상  

#### 기술 세부사항  
- CustomerAgent 참조로 Mermaid 아키텍처 다이어그램 업데이트  
- Python 예제의 CoraAgent 클래스명을 CustomerAgent로 교체  
- ARM 템플릿 JSON 구성에서 "customer" 에이전트 유형 사용  
- 환경 변수 CORA_AGENT_*에서 CUSTOMER_AGENT_* 패턴으로 변경  
- 모든 배포 명령 및 컨테이너 구성 새로 고침  

### [v3.0.0] - 2025-09-12  

#### 주요 변경사항 - AI 개발자 집중 및 Microsoft Foundry 통합  
**이 버전은 저장소를 AI 중심 학습 자료로 전환하며 Microsoft Foundry 통합을 포함합니다.**  

#### 추가됨  
- **🤖 AI 우선 학습 경로**: AI 개발자 및 엔지니어 우선 구조로 완전 재구성  
- **Microsoft Foundry 통합 가이드**: AZD와 Microsoft Foundry 서비스 연결에 관한 종합 문서  
- **AI 모델 배포 패턴**: 모델 선택, 구성 및 프로덕션 배포 전략에 대한 상세 가이드  
- **AI 워크숍 랩**: AI 애플리케이션을 AZD 배포 솔루션으로 전환하기 위한 2-3시간 실습 워크숍  
- **프로덕션 AI 모범 사례**: AI 워크로드 확장, 모니터링 및 보안을 위한 엔터프라이즈 패턴  
- **AI 전용 문제 해결 가이드**: Microsoft Foundry 모델, Cognitive Services 및 AI 배포 문제에 대한 포괄적 해결책  
- **AI 템플릿 갤러리**: 복잡도 등급이 매겨진 Microsoft Foundry 템플릿 컬렉션  
- **워크숍 자료**: 실습 랩과 참조 자료가 포함된 완전한 워크숍 구조  

#### 향상됨  
- **README 구조**: Microsoft Foundry Discord의 45% 커뮤니티 관심도를 반영한 AI 개발자 중심  
- **학습 경로**: 학생, DevOps 엔지니어와 병행하는 전용 AI 개발자 여정  
- **템플릿 추천**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart 등 추천 AI 템플릿  
- **커뮤니티 통합**: AI 전용 채널 및 토론을 포함한 Discord 커뮤니티 지원 강화  

#### 보안 및 프로덕션 집중  
- **관리형 ID 패턴**: AI 특화 인증 및 보안 구성  
- **비용 최적화**: AI 워크로드의 토큰 사용 추적 및 예산 제어  
- **다중 지역 배포**: 글로벌 AI 애플리케이션 배포 전략  
- **성능 모니터링**: AI 전용 지표 및 Application Insights 통합  

#### 문서 품질  
- **선형 과정 구조**: 초급에서 고급 AI 배포 패턴으로 논리적 진행  
- **검증된 URL**: 모든 외부 저장소 링크 확인 및 접근 보장  
- **완전한 참조**: 내부 문서 링크 모두 유효 및 작동  
- **프로덕션 준비됨**: 실제 사례가 포함된 엔터프라이즈 배포 패턴  

### [v2.0.0] - 2025-09-09  

#### 주요 변경사항 - 저장소 구조 재편 및 전문성 강화  
**이 버전은 저장소 구조 및 콘텐츠 프레젠테이션에서 중대한 개편을 나타냅니다.**  

#### 추가됨  
- **구조화된 학습 프레임워크**: 모든 문서 페이지에 소개, 학습 목표, 학습 성과 섹션 포함  
- **내비게이션 시스템**: 모든 문서에 이전/다음 강의 링크 추가로 안내 학습 진행  
- **학습 가이드**: 학습 목표, 실습 과제 및 평가 자료를 포함한 종합 study-guide.md  
- **전문적 프레젠테이션**: 접근성을 위해 모든 이모지 아이콘 제거  
- **개선된 내용 구조**: 학습 자료의 조직 및 흐름 개선  

#### 변경됨  
- **문서 형식**: 일관된 학습 중심 구조로 모든 문서 표준화  
- **내비게이션 흐름**: 모든 학습 자료를 통한 논리적 진행 구현  
- **콘텐츠 표현**: 장식 요소 제거 및 명확하고 전문적인 형식으로 전환  
- **링크 구조**: 새 내비게이션 시스템 지원을 위해 내부 링크 모두 업데이트  

#### 개선됨  
- <strong>접근성</strong>: 화면 판독기 호환성을 위한 이모지 의존성 제거  
- **전문적 외관**: 엔터프라이즈 학습에 적합한 깔끔한 학술 스타일 프레젠테이션  
- **학습 경험**: 각 강의의 명확한 목표 및 성과로 구조화된 접근법  
- **콘텐츠 조직**: 관련 주제 간의 논리적 흐름 및 연결 개선  

### [v1.0.0] - 2025-09-09  

#### 초기 릴리스 - 포괄적 AZD 학습 저장소  

#### 추가됨  
- **핵심 문서 구조**  
  - 완전한 시작 가이드 시리즈  
  - 종합적인 배포 및 프로비저닝 문서  
  - 상세한 문제 해결 자원 및 디버깅 가이드  
  - 배포 전 검증 도구 및 절차  

- **시작 모듈**  
  - AZD 기본: 핵심 개념 및 용어  
  - 설치 가이드: 플랫폼별 설정 지침  
  - 구성 가이드: 환경 설정 및 인증  
  - 첫 프로젝트 튜토리얼: 단계별 실습 학습  

- **배포 및 프로비저닝 모듈**  
  - 배포 가이드: 완벽한 워크플로우 문서  
  - 프로비저닝 가이드: Bicep을 활용한 코드로서의 인프라  
  - 프로덕션 배포를 위한 모범 사례  
  - 다중 서비스 아키텍처 패턴  

- **배포 전 검증 모듈**  
  - 용량 계획: Azure 리소스 가용성 검증  
  - SKU 선택: 종합 서비스 등급 가이드  
  - 사전점검: 자동화된 검증 스크립트(PowerShell 및 Bash)  
  - 비용 추정 및 예산 계획 도구  

- **문제 해결 모듈**  
  - 일반 문제: 자주 발생하는 문제 및 해결책  
  - 디버깅 가이드: 체계적 문제 해결 방법론  
  - 고급 진단 기법 및 도구  
  - 성능 모니터링 및 최적화  

- **자원 및 참고 문헌**  
  - 명령 치트 시트: 필수 명령 신속 참조  
  - 용어집: 포괄적 용어 및 약어 정의  
  - 자주 묻는 질문: 상세한 답변  
  - 외부 자원 링크 및 커뮤니티 연결  

- **예제 및 템플릿**  
  - 간단한 웹 애플리케이션 예제  
  - 정적 웹사이트 배포 템플릿  
  - 컨테이너 애플리케이션 구성  
  - 데이터베이스 통합 패턴  
  - 마이크로서비스 아키텍처 예제  
  - 서버리스 함수 구현  

#### 특징  
- **다중 플랫폼 지원**: Windows, macOS, Linux용 설치 및 구성 가이드  
- **다양한 숙련도 대상**: 학생부터 전문 개발자까지 설계된 콘텐츠  
- **실용 중심**: 실습 예제 및 실제 시나리오  
- **포괄적 범위**: 기본 개념부터 고급 엔터프라이즈 패턴까지  
- **보안 우선 접근법**: 전반에 걸친 보안 모범 사례  
- **비용 최적화**: 비용 효율적인 배포 및 리소스 관리 가이드  

#### 문서 품질  
- **상세 코드 예제**: 실용적이고 검증된 코드 샘플  
- **단계별 지침**: 명확하고 실행 가능한 안내  
- **포괄적 오류 처리**: 일반 문제에 대한 문제 해결법  
- **모범 사례 통합**: 업계 표준 및 권장 사항  
- **버전 호환성**: 최신 Azure 서비스 및 azd 기능과 업데이트 유지  

## 향후 예정된 기능 개선  

### Version 3.1.0 (예정)  
#### AI 플랫폼 확장  
- **멀티 모델 지원**: Hugging Face, Azure Machine Learning, 맞춤형 모델 통합 패턴  
- **AI 에이전트 프레임워크**: LangChain, Semantic Kernel, AutoGen 배포 템플릿  
- **고급 RAG 패턴**: Azure AI Search 외의 벡터 데이터베이스 옵션(Pinecone, Weaviate 등)  
- **AI 관측 가능성**: 모델 성능, 토큰 사용량, 응답 품질 향상 모니터링  

#### 개발자 환경  
- **VS Code 확장**: 통합 AZD + Microsoft Foundry 개발 환경  
- **GitHub Copilot 통합**: AI 지원 AZD 템플릿 생성  
- **인터랙티브 튜토리얼**: AI 시나리오 자동 검증이 포함된 실습 코딩 연습  
- **영상 콘텐츠**: AI 배포에 초점을 맞춘 보조 동영상 튜토리얼  

### 버전 4.0.0 (예정)  
#### 엔터프라이즈 AI 패턴  
- **거버넌스 프레임워크**: AI 모델 거버넌스, 규정 준수, 감사 추적  
- **멀티 테넌트 AI**: 독립된 AI 서비스를 여러 고객에 제공하는 패턴  
- **엣지 AI 배포**: Azure IoT Edge 및 컨테이너 인스턴스와의 통합  
- **하이브리드 클라우드 AI**: AI 워크로드를 위한 멀티 클라우드 및 하이브리드 배포 패턴  

#### 고급 기능  
- **AI 파이프라인 자동화**: Azure Machine Learning 파이프라인과 MLOps 통합  
- **고급 보안**: 제로 트러스트 패턴, 프라이빗 엔드포인트, 고급 위협 보호  
- **성능 최적화**: 고처리량 AI 애플리케이션을 위한 고급 튜닝 및 확장 전략  
- **글로벌 배포**: AI 애플리케이션을 위한 콘텐츠 전송 및 엣지 캐싱 패턴  

### 버전 3.0.0 (예정) - 현재 릴리스에 의해 대체됨  
#### 제안된 추가 기능 - v3.0.0에 구현 완료  
- ✅ **AI 중심 콘텐츠**: 포괄적인 Microsoft Foundry 통합 (완료)  
- ✅ **인터랙티브 튜토리얼**: 실습 AI 워크숍 랩 (완료)  
- ✅ **고급 보안 모듈**: AI 전용 보안 패턴 (완료)  
- ✅ **성능 최적화**: AI 워크로드 튜닝 전략 (완료)  

### 버전 2.1.0 (예정) - 일부가 v3.0.0에 구현됨  
#### 소규모 개선 - 현재 릴리스에서 일부 완료  
- ✅ **추가 예제**: AI 중심 배포 시나리오 (완료)  
- ✅ **확장된 FAQ**: AI 관련 질문 및 문제 해결 (완료)  
- **도구 통합**: 향상된 IDE 및 편집기 통합 가이드  
- ✅ **모니터링 확장**: AI 전용 모니터링 및 알림 패턴 (완료)  

#### 향후 릴리스를 위한 계획  
- **모바일 친화적 문서**: 모바일 학습을 위한 반응형 디자인  
- **오프라인 액세스**: 다운로드 가능한 문서 패키지  
- **향상된 IDE 통합**: AZD + AI 워크플로우용 VS Code 확장  
- **커뮤니티 대시보드**: 실시간 커뮤니티 지표 및 기여 추적  

## 변경 로그 기여 방법

### 변경 사항 보고  
이 저장소에 기여할 때 변경 로그 항목에는 다음이 포함되어야 합니다:  

1. **버전 번호**: 시맨틱 버전 관리(주.부.패치) 준수  
2. <strong>날짜</strong>: YYYY-MM-DD 형식의 릴리스 또는 업데이트 날짜  
3. <strong>카테고리</strong>: 추가, 변경, 사용 중단, 제거, 수정, 보안  
4. **명확한 설명**: 변경된 내용에 대한 간결한 설명  
5. **영향 평가**: 변경 사항이 기존 사용자에 미치는 영향  

### 변경 카테고리

#### 추가  
- 새로운 기능, 문서 섹션 또는 기능성  
- 새로운 예제, 템플릿 또는 학습 자원  
- 추가 도구, 스크립트 또는 유틸리티  

#### 변경  
- 기존 기능 또는 문서의 수정  
- 명확성 또는 정확도를 높이기 위한 업데이트  
- 내용 또는 구조 재구성  

#### 사용 중단  
- 단계적으로 폐지되는 기능 또는 접근 방식  
- 제거 예정인 문서 섹션  
- 더 나은 대체 방법이 있는 방식  

#### 제거  
- 더 이상 관련 없는 기능, 문서 또는 예제  
- 구식 정보 또는 사용 중단된 접근법  
- 중복되거나 통합된 콘텐츠  

#### 수정  
- 문서나 코드의 오류 수정  
- 보고된 문제 해결  
- 정확성 또는 기능성 향상  

#### 보안  
- 보안 관련 개선 또는 수정 사항  
- 보안 모범 사례 업데이트  
- 보안 취약점 해결  

### 시맨틱 버전 관리 지침

#### 주요 버전 (X.0.0)  
- 사용자 조치가 필요한 비호환성 변경  
- 중요한 내용 또는 조직 재구성  
- 근본적인 접근 방식 또는 방법론 변경  

#### 부 버전 (X.Y.0)  
- 새로운 기능 또는 콘텐츠 추가  
- 하위 호환성을 유지하는 개선 사항  
- 추가 예제, 도구 또는 리소스  

#### 패치 버전 (X.Y.Z)  
- 버그 수정 및 정정  
- 기존 콘텐츠에 대한 소규모 개선  
- 설명 및 작은 증진 사항  

## 커뮤니티 피드백 및 제안

이 학습 리소스 향상을 위해 커뮤니티 피드백을 적극 권장합니다:  

### 피드백 제공 방법  
- **GitHub 이슈**: 문제 보고 또는 개선 제안 (AI 관련 이슈 환영)  
- **Discord 토론**: 아이디어 공유 및 Microsoft Foundry 커뮤니티 참여  
- **풀 리퀘스트**: AI 템플릿 및 가이드에 대한 직접 개선 기여  
- **Microsoft Foundry Discord**: AZD + AI 논의를 위한 #Azure 채널 참여  
- **커뮤니티 포럼**: 더 넓은 Azure 개발자 토론 참여  

### 피드백 카테고리  
- **AI 콘텐츠 정확성**: AI 서비스 통합 및 배포 정보의 수정  
- **학습 경험**: AI 개발자 학습 흐름 개선 제안  
- **누락된 AI 콘텐츠**: 추가 AI 템플릿, 패턴 또는 예제 요청  
- <strong>접근성</strong>: 다양한 학습자의 요구에 대한 개선  
- **AI 도구 통합**: AI 개발 워크플로우 통합 개선 제안  
- **운영 환경 AI 패턴**: 엔터프라이즈 AI 배포 패턴 요청  

### 응답 약속  
- **이슈 응답**: 보고된 문제 48시간 이내  
- **기능 요청**: 1주일 이내 평가  
- **커뮤니티 기여**: 1주일 이내 검토  
- **보안 문제**: 즉각적 우선순위 및 신속 응답  

## 유지 관리 일정

### 정기 업데이트  
- **월별 검토**: 콘텐츠 정확성 및 링크 확인  
- **분기별 업데이트**: 주요 콘텐츠 추가 및 개선  
- **반기별 검토**: 포괄적 재구성 및 향상  
- **연간 릴리스**: 주요 버전 업데이트 및 주요 개선  

### 모니터링 및 품질 보증  
- **자동화 테스트**: 코드 예제 및 링크 정기 검증  
- **커뮤니티 피드백 통합**: 사용자 제안 반영 정기 시행  
- **기술 업데이트**: 최신 Azure 서비스 및 azd 릴리스와 정렬  
- **접근성 감사**: 포괄적 디자인 원칙 정기 검토  

## 버전 지원 정책

### 현재 버전 지원  
- **최신 주요 버전**: 정기 업데이트를 포함한 전체 지원  
- **이전 주요 버전**: 12개월간 보안 업데이트 및 중요 수정 지원  
- **레거시 버전**: 커뮤니티 지원만, 공식 업데이트 없음  

### 마이그레이션 안내  
주요 버전이 릴리스될 때 다음을 제공합니다:  
- **마이그레이션 가이드**: 단계별 전환 안내  
- **호환성 노트**: 비호환 변경사항 세부정보  
- **도구 지원**: 마이그레이션 보조 스크립트 및 유틸리티  
- **커뮤니티 지원**: 마이그레이션 질문용 전용 포럼  

---

<strong>탐색</strong>  
- **이전 강의**: [Study Guide](resources/study-guide.md)  
- **다음 강의**: [Main README](README.md)로 돌아가기  

**최신 상태 유지**: 이 저장소를 감시하여 새 릴리스 및 학습 자료 중요 업데이트 알림을 받으세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역에는 오류나 부정확한 부분이 포함될 수 있음을 유의해 주시기 바랍니다. 원문은 해당 언어의 원본 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 어떠한 오해나 잘못된 해석에 대해 당사는 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->