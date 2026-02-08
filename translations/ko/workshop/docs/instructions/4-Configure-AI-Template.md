# 4. 템플릿 구성하기

!!! tip "이 모듈이 끝나면 할 수 있습니다"

    - [ ] `azure.yaml`의 목적 이해하기
    - [ ] `azure.yaml`의 구조 이해하기
    - [ ] azd 수명주기 `hooks`의 가치 이해하기
    - [ ] **실습 4:** 환경 변수 탐색 및 수정하기

---

!!! prompt "`azure.yaml` 파일은 무엇을 하나요? 코드 블록을 사용해 각 라인별로 설명하세요"

      `azure.yaml` 파일은 **Azure Developer CLI(azd)의 구성 파일**입니다. 인프라, 서비스, 배포 훅, 환경 변수 등 애플리케이션이 Azure에 어떻게 배포될지 정의합니다.

---

## 1. 목적 및 기능

이 `azure.yaml` 파일은 AI 에이전트 애플리케이션의 **배포 설계도** 역할을 합니다. 이 애플리케이션은 다음을 수행합니다:

1. 배포 전 **환경 검증**
2. Azure AI 서비스 프로비저닝 (AI 허브, AI 프로젝트, 검색 등)
3. Python 애플리케이션을 Azure Container Apps에 배포
4. 채팅 및 임베딩 기능을 위한 AI 모델 구성
5. AI 애플리케이션에 대한 모니터링 및 추적 설정
6. 신규 및 기존 Azure AI 프로젝트 시나리오 모두 처리

이 파일을 통해 적절한 검증, 프로비저닝, 배포 후 구성을 포함한 완전한 AI 에이전트 솔루션을 **한 명령어로 배포**(`azd up`)할 수 있습니다.

??? info "확대 보기: `azure.yaml`"

      `azure.yaml` 파일은 Azure Developer CLI가 이 AI 에이전트 애플리케이션을 Azure에 배포하고 관리하는 방법을 정의합니다. 각 라인별로 살펴보겠습니다.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

파일을 섹션별로 나누어 각 부분이 무엇을 하고 왜 필요한지 살펴보겠습니다.

### 2.1 **헤더 및 스키마 (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1행**: IDE 지원과 IntelliSense를 위한 YAML 언어 서버 스키마 유효성 검사 제공

### 2.2 프로젝트 메타데이터 (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5행**: Azure Developer CLI가 사용할 프로젝트 이름 정의
- **6-7행**: 템플릿 버전 1.0.2를 기반으로 함을 명시
- **8-9행**: Azure Developer CLI 버전 1.14.0 이상 필요

### 2.3 배포 훅 (11-40)

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

- **11-20행**: **배포 전 훅** - `azd up` 실행 이전에 실행

      - Unix/Linux: 검증 스크립트 실행 권한을 부여하고 실행
      - Windows: PowerShell 검증 스크립트 실행
      - 두 경우 모두 대화형이며 실패 시 배포 중단

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
- **21-30행**: **프로비저닝 후 훅** - Azure 리소스 생성 후 실행

  - 환경 변수 작성 스크립트 실행
  - 스크립트 실패 시에도 계속 진행(`continueOnError: true`)

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
- **31-40행**: **배포 후 훅** - 애플리케이션 배포 완료 후 실행

  - 최종 설정 스크립트 실행
  - 스크립트 실패 시에도 계속 진행

### 2.4 서비스 구성 (41-48)

배포할 애플리케이션 서비스를 구성합니다.

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

- **42행**: "api_and_frontend"라는 서비스 정의
- **43행**: 소스 코드 디렉터리를 `./src`로 지정
- **44행**: 프로그래밍 언어를 Python으로 지정
- **45행**: 호스팅 플랫폼으로 Azure Container Apps 사용
- **46-48행**: Docker 구성

      - 이미지 이름은 "api_and_frontend"
      - Docker 이미지를 클라우드에서 원격 빌드

### 2.5 파이프라인 변수 (49-76)

자동화를 위한 CI/CD 파이프라인에서 `azd` 실행 시 사용하는 변수들입니다.

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

이 섹션은 **배포 중에 사용하는** 환경 변수들을 카테고리별로 정리합니다:

- **Azure 리소스 이름 (51-60행)**: 리소스 그룹, AI 허브, AI 프로젝트 등 핵심 Azure 서비스 이름
- **기능 플래그 (61-63행)**: 특정 Azure 서비스 활성화/비활성화용 불리언 변수
- **AI 에이전트 구성 (64-71행)**: AI 에이전트 이름, ID, 배포 설정, 모델 정보
- **AI 임베딩 구성 (72-79행)**: 벡터 검색용 임베딩 모델 설정
- **검색 및 모니터링 (80-84행)**: 검색 인덱스 이름, 기존 리소스 ID, 모니터링 및 추적 설정

---

## 3. 환경 변수 이해하기
아래 환경 변수들은 배포 설정과 동작을 제어하며 기본값이 있지만 필요에 따라 맞춤 설정할 수 있습니다. 변수들은 주요 목적별로 구분되어 있습니다.

### 3.1 필수 변수 

```bash title="" linenums="0"
# 핵심 Azure 구성
AZURE_ENV_NAME                    # 환경 이름 (리소스 명명에 사용)
AZURE_LOCATION                    # 배포 지역
AZURE_SUBSCRIPTION_ID             # 대상 구독
AZURE_RESOURCE_GROUP              # 리소스 그룹 이름
AZURE_PRINCIPAL_ID                # RBAC용 사용자 주체

# 리소스 이름 (지정하지 않으면 자동 생성)
AZURE_AIHUB_NAME                  # Microsoft Foundry 허브 이름
AZURE_AIPROJECT_NAME              # AI 프로젝트 이름
AZURE_AISERVICES_NAME             # AI 서비스 계정 이름
AZURE_STORAGE_ACCOUNT_NAME        # 스토리지 계정 이름
AZURE_CONTAINER_REGISTRY_NAME     # 컨테이너 레지스트리 이름
AZURE_KEYVAULT_NAME               # 키 볼트 이름 (사용 시)
```

### 3.2 모델 구성 
```bash title="" linenums="0"
# 채팅 모델 구성
AZURE_AI_AGENT_MODEL_NAME         # 기본값: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # 기본값: OpenAI (또는 Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # 기본값: 최신 사용 가능 버전
AZURE_AI_AGENT_DEPLOYMENT_NAME    # 채팅 모델의 배포 이름
AZURE_AI_AGENT_DEPLOYMENT_SKU     # 기본값: 표준
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # 기본값: 80 (천 단위 TPM)

# 임베딩 모델 구성
AZURE_AI_EMBED_MODEL_NAME         # 기본값: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # 기본값: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # 기본값: 최신 사용 가능 버전
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 임베딩 배포 이름
AZURE_AI_EMBED_DEPLOYMENT_SKU     # 기본값: 표준
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # 기본값: 50 (천 단위 TPM)

# 에이전트 구성
AZURE_AI_AGENT_NAME               # 에이전트 표시 이름
AZURE_EXISTING_AGENT_ID           # 기존 에이전트 사용 (선택 사항)
```

### 3.3 기능 토글
```bash title="" linenums="0"
# 선택적 서비스
USE_APPLICATION_INSIGHTS         # 기본값: true
USE_AZURE_AI_SEARCH_SERVICE      # 기본값: false
USE_CONTAINER_REGISTRY           # 기본값: true

# 모니터링 및 추적
ENABLE_AZURE_MONITOR_TRACING     # 기본값: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # 기본값: false

# 검색 구성
AZURE_AI_SEARCH_INDEX_NAME       # 검색 인덱스 이름
AZURE_SEARCH_SERVICE_NAME        # 검색 서비스 이름
```

### 3.4 AI 프로젝트 구성 
```bash title="" linenums="0"
# 기존 리소스 사용
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # 기존 AI 프로젝트의 전체 리소스 ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # 기존 프로젝트의 엔드포인트 URL
```

### 3.5 변수 확인하기

Azure Developer CLI를 사용해 환경 변수를 조회하고 관리할 수 있습니다:

```bash title="" linenums="0"
# 현재 환경에 대한 모든 환경 변수를 봅니다
azd env get-values

# 특정 환경 변수를 가져옵니다
azd env get-value AZURE_ENV_NAME

# 환경 변수를 설정합니다
azd env set AZURE_LOCATION eastus

# .env 파일에서 여러 변수를 설정합니다
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확한 내용이 포함될 수 있음을 알려드립니다. 원문의 원어 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보에 대해서는 전문 인력의 번역을 권장합니다. 본 번역의 사용으로 인한 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->