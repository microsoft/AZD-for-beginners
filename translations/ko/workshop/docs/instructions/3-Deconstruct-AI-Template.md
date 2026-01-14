<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T10:01:37+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "ko"
}
-->
# 3. 템플릿 분해하기

!!! tip "이 모듈을 완료하면 다음을 할 수 있습니다"

    - [ ] 항목
    - [ ] 항목
    - [ ] 항목
    - [ ] **실습 3:** 

---

AZD 템플릿과 Azure Developer CLI(`azd`)를 사용하면 샘플 코드, 인프라 및 구성 파일을 제공하는 표준화된 저장소를 통해 _스타터_ 프로젝트 형태로 AI 개발 여정을 빠르게 시작할 수 있습니다.

**하지만 이제 우리는 프로젝트 구조와 코드베이스를 이해하고, AZD에 대한 사전 경험이나 이해 없이 AZD 템플릿을 커스터마이징할 수 있어야 합니다!**

---

## 1. GitHub Copilot 활성화하기

### 1.1 GitHub Copilot Chat 설치

[에이전트 모드가 포함된 GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)을 탐색할 시간입니다. 이제 자연어로 작업을 고수준에서 설명하고 실행에 도움을 받을 수 있습니다. 이번 실습에서는 월간 완료 및 채팅 상호작용 제한이 있는 [Copilot 무료 플랜](https://github.com/github-copilot/signup)을 사용합니다.

이 확장은 마켓플레이스에서 설치할 수 있지만, 이미 Codespaces 환경에 제공되어 있을 것입니다. _Copilot 아이콘 드롭다운에서 `Open Chat`을 클릭하고 `What can you do?`와 같은 프롬프트를 입력하세요._ 로그인 요청이 있을 수 있습니다. **GitHub Copilot Chat이 준비되었습니다.**

### 1.2 MCP 서버 설치

에이전트 모드가 효과적이려면 지식을 검색하거나 작업을 수행하는 데 도움을 줄 수 있는 적절한 도구에 접근해야 합니다. 여기서 MCP 서버가 도움을 줄 수 있습니다. 다음 서버를 구성합니다:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

이를 활성화하려면:

1. `.vscode/mcp.json` 파일을 생성합니다(존재하지 않을 경우).
1. 아래 내용을 해당 파일에 복사하고 서버를 시작하세요!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "`npx`가 설치되지 않았다는 오류가 발생할 수 있습니다(확장하여 수정 방법 확인)"

      이를 수정하려면 `.devcontainer/devcontainer.json` 파일을 열고 features 섹션에 다음 줄을 추가하세요. 그런 다음 컨테이너를 다시 빌드하세요. 이제 `npx`가 설치되어야 합니다.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 GitHub Copilot Chat 테스트

**먼저 VS Code 명령줄에서 `az login`을 사용하여 Azure에 인증하세요.**

이제 Azure 구독 상태를 조회하고 배포된 리소스나 구성에 대해 질문할 수 있습니다. 다음 프롬프트를 시도해보세요:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Azure 문서에 대한 질문을 하고 Microsoft Docs MCP 서버에 기반한 응답을 받을 수도 있습니다. 다음 프롬프트를 시도해보세요:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

또는 작업을 완료하기 위한 코드 스니펫을 요청할 수 있습니다. 다음 프롬프트를 시도해보세요:

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` 모드에서는 복사-붙여넣기하여 실행할 수 있는 코드를 제공합니다. `Agent` 모드에서는 한 단계 더 나아가 관련 리소스를 생성하고 설정 스크립트와 문서를 포함하여 작업을 실행하는 데 도움을 줄 수 있습니다.

**이제 템플릿 저장소를 탐색할 준비가 되었습니다.**

---

## 2. 아키텍처 분해하기

??? prompt "ASK: docs/images/architecture.png에 있는 애플리케이션 아키텍처를 1문단으로 설명하세요"

      이 애플리케이션은 Azure에서 구축된 AI 기반 채팅 애플리케이션으로, 현대적인 에이전트 기반 아키텍처를 보여줍니다. 솔루션은 사용자 입력을 처리하고 AI 에이전트를 통해 지능적인 응답을 생성하는 주요 애플리케이션 코드를 호스팅하는 Azure Container App을 중심으로 구성됩니다.
      
      아키텍처는 Azure AI Foundry Project를 AI 기능의 기반으로 활용하며, GPT-4o-mini와 같은 언어 모델 및 에이전트 기능을 제공하는 Azure AI Services와 연결됩니다. 사용자 상호작용은 React 기반 프론트엔드를 통해 FastAPI 백엔드로 전달되며, AI 에이전트 서비스와 통신하여 상황에 맞는 응답을 생성합니다.
      
      시스템은 파일 검색 또는 Azure AI Search 서비스를 통해 지식 검색 기능을 통합하여 에이전트가 업로드된 문서에서 정보를 검색하고 인용할 수 있도록 합니다. 운영 우수성을 위해 아키텍처는 추적, 로깅 및 성능 최적화를 위한 Application Insights 및 Log Analytics Workspace를 포함한 포괄적인 모니터링을 제공합니다.
      
      Azure Storage는 애플리케이션 데이터와 파일 업로드를 위한 Blob 스토리지를 제공하며, Managed Identity는 자격 증명을 저장하지 않고 Azure 리소스 간의 안전한 액세스를 보장합니다. 전체 솔루션은 수요에 따라 자동으로 확장되는 컨테이너화된 애플리케이션과 Azure의 관리 서비스 생태계를 통해 내장된 보안, 모니터링 및 CI/CD 기능을 제공하도록 설계되었습니다.

![Architecture](../../../../../translated_images/architecture.48d94861e6e6cdc0.ko.png)

---

## 3. 저장소 구조

!!! prompt "ASK: 템플릿 폴더 구조를 설명하세요. 시각적 계층 다이어그램으로 시작하세요."

??? info "ANSWER: 시각적 계층 다이어그램"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 구성 및 설정
      │   ├── azure.yaml                    # Azure Developer CLI 구성
      │   ├── docker-compose.yaml           # 로컬 개발 컨테이너
      │   ├── pyproject.toml                # Python 프로젝트 구성
      │   ├── requirements-dev.txt          # 개발 종속성
      │   └── .devcontainer/                # VS Code 개발 컨테이너 설정
      │
      ├── 🏗️ 인프라 (infra/)
      │   ├── main.bicep                    # 주요 인프라 템플릿
      │   ├── api.bicep                     # API 관련 리소스
      │   ├── main.parameters.json          # 인프라 매개변수
      │   └── core/                         # 모듈화된 인프라 구성 요소
      │       ├── ai/                       # AI 서비스 구성
      │       ├── host/                     # 호스팅 인프라
      │       ├── monitor/                  # 모니터링 및 로깅
      │       ├── search/                   # Azure AI Search 설정
      │       ├── security/                 # 보안 및 아이덴티티
      │       └── storage/                  # 스토리지 계정 구성
      │
      ├── 💻 애플리케이션 소스 (src/)
      │   ├── api/                          # 백엔드 API
      │   │   ├── main.py                   # FastAPI 애플리케이션 진입점
      │   │   ├── routes.py                 # API 경로 정의
      │   │   ├── search_index_manager.py   # 검색 기능
      │   │   ├── data/                     # API 데이터 처리
      │   │   ├── static/                   # 정적 웹 자산
      │   │   └── templates/                # HTML 템플릿
      │   ├── frontend/                     # React/TypeScript 프론트엔드
      │   │   ├── package.json              # Node.js 종속성
      │   │   ├── vite.config.ts            # Vite 빌드 구성
      │   │   └── src/                      # 프론트엔드 소스 코드
      │   ├── data/                         # 샘플 데이터 파일
      │   │   └── embeddings.csv            # 사전 계산된 임베딩
      │   ├── files/                        # 지식 기반 파일
      │   │   ├── customer_info_*.json      # 고객 데이터 샘플
      │   │   └── product_info_*.md         # 제품 문서
      │   ├── Dockerfile                    # 컨테이너 구성
      │   └── requirements.txt              # Python 종속성
      │
      ├── 🔧 자동화 및 스크립트 (scripts/)
      │   ├── postdeploy.sh/.ps1           # 배포 후 설정
      │   ├── setup_credential.sh/.ps1     # 자격 증명 구성
      │   ├── validate_env_vars.sh/.ps1    # 환경 변수 검증
      │   └── resolve_model_quota.sh/.ps1  # 모델 할당량 관리
      │
      ├── 🧪 테스트 및 평가
      │   ├── tests/                        # 단위 및 통합 테스트
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # 에이전트 평가 프레임워크
      │   │   ├── evaluate.py               # 평가 실행기
      │   │   ├── eval-queries.json         # 테스트 쿼리
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # 개발 플레이그라운드
      │   │   ├── 1-quickstart.py           # 시작 예제
      │   │   └── aad-interactive-chat.py   # 인증 예제
      │   └── airedteaming/                 # AI 안전성 평가
      │       └── ai_redteaming.py          # 레드팀 테스트
      │
      ├── 📚 문서 (docs/)
      │   ├── deployment.md                 # 배포 가이드
      │   ├── local_development.md          # 로컬 설정 지침
      │   ├── troubleshooting.md            # 일반적인 문제 및 해결책
      │   ├── azure_account_setup.md        # Azure 사전 요구사항
      │   └── images/                       # 문서 자산
      │
      └── 📄 프로젝트 메타데이터
         ├── README.md                     # 프로젝트 개요
         ├── CODE_OF_CONDUCT.md           # 커뮤니티 가이드라인
         ├── CONTRIBUTING.md              # 기여 가이드
         ├── LICENSE                      # 라이선스 조건
         └── next-steps.md                # 배포 후 지침
      ```

### 3.1 핵심 앱 아키텍처

이 템플릿은 **풀스택 웹 애플리케이션** 패턴을 따릅니다:

- **백엔드**: Azure AI 통합 Python FastAPI
- **프론트엔드**: Vite 빌드 시스템을 사용하는 TypeScript/React
- **인프라**: 클라우드 리소스를 위한 Azure Bicep 템플릿
- **컨테이너화**: 일관된 배포를 위한 Docker

### 3.2 코드로 작성된 인프라 (bicep)

인프라 계층은 **Azure Bicep** 템플릿을 모듈화하여 구성합니다:

   - **`main.bicep`**: 모든 Azure 리소스를 오케스트레이션
   - **`core/` 모듈**: 다양한 서비스에 대한 재사용 가능한 구성 요소
      - AI 서비스(Azure OpenAI, AI Search)
      - 컨테이너 호스팅(Azure Container Apps)
      - 모니터링(Application Insights, Log Analytics)
      - 보안(Key Vault, Managed Identity)

### 3.3 애플리케이션 소스 (`src/`)

**백엔드 API (`src/api/`)**:

- FastAPI 기반 REST API
- Azure AI 에이전트 서비스 통합
- 지식 검색을 위한 검색 인덱스 관리
- 파일 업로드 및 처리 기능

**프론트엔드 (`src/frontend/`)**:

- 현대적인 React/TypeScript SPA
- 빠른 개발과 최적화된 빌드를 위한 Vite
- 에이전트 상호작용을 위한 채팅 인터페이스

**지식 기반 (`src/files/`)**:

- 샘플 고객 및 제품 데이터
- 파일 기반 지식 검색을 보여줌
- JSON 및 Markdown 형식 예제

### 3.4 DevOps 및 자동화

**스크립트 (`scripts/`)**:

- 크로스 플랫폼 PowerShell 및 Bash 스크립트
- 환경 검증 및 설정
- 배포 후 구성
- 모델 할당량 관리

**Azure Developer CLI 통합**:

- `azure.yaml` 구성으로 `azd` 워크플로우 지원
- 자동화된 프로비저닝 및 배포
- 환경 변수 관리

### 3.5 테스트 및 품질 보증

**평가 프레임워크 (`evals/`)**:

- 에이전트 성능 평가
- 쿼리-응답 품질 테스트
- 자동화된 평가 파이프라인

**AI 안전성 (`airedteaming/`)**:

- AI 안전성을 위한 레드팀 테스트
- 보안 취약점 스캔
- 책임 있는 AI 실천

---

## 4. 축하합니다 🏆

GitHub Copilot Chat과 MCP 서버를 사용하여 저장소를 성공적으로 탐색했습니다.

- [X] Azure용 GitHub Copilot 활성화
- [X] 애플리케이션 아키텍처 이해
- [X] AZD 템플릿 구조 탐색

이를 통해 이 템플릿의 _코드로 작성된 인프라_ 자산에 대한 감을 잡을 수 있습니다. 다음으로 AZD 구성 파일을 살펴보겠습니다.

---

