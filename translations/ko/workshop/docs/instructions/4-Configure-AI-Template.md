<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T10:07:50+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "ko"
}
-->
# 4. 템플릿 구성하기

!!! tip "이 모듈을 완료하면 다음을 할 수 있습니다"

    - [ ] `azure.yaml`의 목적을 이해합니다.
    - [ ] `azure.yaml`의 구조를 이해합니다.
    - [ ] azd 라이프사이클 `hooks`의 가치를 이해합니다.
    - [ ] **실습 3:** 

---

!!! prompt "`azure.yaml` 파일은 무엇을 하나요? 코드펜스를 사용하여 줄별로 설명하세요"

      `azure.yaml` 파일은 **Azure Developer CLI (azd)의 구성 파일**입니다. 이 파일은 애플리케이션을 Azure에 배포하는 방법을 정의하며, 인프라, 서비스, 배포 hooks, 환경 변수 등을 포함합니다.

---

## 1. 목적과 기능

`azure.yaml` 파일은 AI 에이전트 애플리케이션의 **배포 청사진** 역할을 합니다:

1. 배포 전에 **환경을 검증**합니다.
2. **Azure AI 서비스**를 프로비저닝합니다 (AI Hub, AI Project, Search 등).
3. **Python 애플리케이션**을 Azure Container Apps에 배포합니다.
4. **AI 모델**을 채팅 및 임베딩 기능에 맞게 구성합니다.
5. AI 애플리케이션에 대한 **모니터링 및 추적**을 설정합니다.
6. **새로운 Azure AI 프로젝트와 기존 프로젝트** 모두를 처리합니다.

이 파일은 **단일 명령 배포** (`azd up`)를 통해 적절한 검증, 프로비저닝, 배포 후 설정을 포함한 완전한 AI 에이전트 솔루션을 제공합니다.

??? info "`azure.yaml` 보기"

      `azure.yaml` 파일은 Azure Developer CLI가 이 AI 에이전트 애플리케이션을 Azure에 배포하고 관리하는 방법을 정의합니다. 줄별로 살펴보겠습니다.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: hooks가 필요한가요? 
      # TODO: 모든 변수가 필요한가요?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. 파일 분석

파일을 섹션별로 살펴보며, 각 섹션이 무엇을 하고 왜 필요한지 이해해 봅시다.

### 2.1 **헤더와 스키마 (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1번 줄**: IDE 지원 및 IntelliSense를 위한 YAML 언어 서버 스키마 검증 제공

### 2.2 프로젝트 메타데이터 (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5번 줄**: Azure Developer CLI에서 사용되는 프로젝트 이름 정의
- **6-7번 줄**: 템플릿 버전 1.0.2 기반임을 명시
- **8-9번 줄**: Azure Developer CLI 버전 1.14.0 이상 필요

### 2.3 배포 Hooks (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **11-20번 줄**: **배포 전 hook** - `azd up` 실행 전에 실행

      - Unix/Linux: 검증 스크립트를 실행 가능하게 설정하고 실행
      - Windows: PowerShell 검증 스크립트 실행
      - 둘 다 인터랙티브하며 실패 시 배포를 중단

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **21-30번 줄**: **프로비저닝 후 hook** - Azure 리소스 생성 후 실행

  - 환경 변수 작성 스크립트 실행
  - 스크립트 실패 시에도 배포 계속 진행 (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **31-40번 줄**: **배포 후 hook** - 애플리케이션 배포 후 실행

  - 최종 설정 스크립트 실행
  - 스크립트 실패 시에도 계속 진행

### 2.4 서비스 구성 (41-48)

배포하려는 애플리케이션 서비스를 구성합니다.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **42번 줄**: "api_and_frontend"라는 서비스 정의
- **43번 줄**: 소스 코드가 있는 `./src` 디렉토리 지정
- **44번 줄**: Python을 프로그래밍 언어로 지정
- **45번 줄**: Azure Container Apps를 호스팅 플랫폼으로 사용
- **46-48번 줄**: Docker 구성

      - "api_and_frontend"를 이미지 이름으로 사용
      - Azure에서 원격으로 Docker 이미지를 빌드 (로컬 아님)

### 2.5 파이프라인 변수 (49-76)

CI/CD 파이프라인에서 `azd`를 자동으로 실행할 수 있도록 돕는 변수들입니다.

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

이 섹션은 **배포 중** 사용되는 환경 변수를 정의하며, 카테고리별로 정리되어 있습니다:

- **Azure 리소스 이름 (51-60번 줄)**:
      - 리소스 그룹, AI Hub, AI Project 등 주요 Azure 서비스 리소스 이름
- **기능 플래그 (61-63번 줄)**:
      - 특정 Azure 서비스를 활성화/비활성화하는 Boolean 변수
- **AI 에이전트 구성 (64-71번 줄)**:
      - 주요 AI 에이전트의 이름, ID, 배포 설정, 모델 세부 정보
- **AI 임베딩 구성 (72-79번 줄)**:
      - 벡터 검색에 사용되는 임베딩 모델 구성
- **검색 및 모니터링 (80-84번 줄)**:
      - 검색 인덱스 이름, 기존 리소스 ID, 모니터링/추적 설정

---

## 3. 환경 변수 알아보기
다음 환경 변수는 배포의 구성과 동작을 제어하며, 주요 목적에 따라 정리되어 있습니다. 대부분의 변수는 적절한 기본값을 가지지만, 특정 요구 사항이나 기존 Azure 리소스에 맞게 사용자 정의할 수 있습니다.

### 3.1 필수 변수 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 모델 구성 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 기능 토글
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 AI 프로젝트 구성 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 변수 확인하기

Azure Developer CLI를 사용하여 환경 변수를 확인하고 관리하세요:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

