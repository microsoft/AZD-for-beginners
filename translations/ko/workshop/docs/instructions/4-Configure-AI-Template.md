# 4. 템플릿 구성하기

!!! tip "이 모듈이 끝날 때쯤 여러분은 다음을 할 수 있을 것입니다"

    - [ ] `azure.yaml` 의 목적 이해하기
    - [ ] `azure.yaml` 의 구조 이해하기
    - [ ] azd 라이프사이클 `hooks` 의 가치 이해하기
    - [ ] **랩 4:** 환경 변수 탐색 및 수정

---

!!! prompt "`azure.yaml` 파일은 무엇을 하나요? 코드 블록을 사용하여 한 줄씩 설명하세요"

      `azure.yaml` 파일은 <strong>Azure Developer CLI(azd)의 구성 파일</strong>입니다. 이 파일은 애플리케이션이 Azure에 어떻게 배포되어야 하는지, 인프라, 서비스, 배포 후크 및 환경 변수를 포함하여 정의합니다.

---

## 1. 목적 및 기능

이 `azure.yaml` 파일은 AI 에이전트 애플리케이션을 위한 **배포 설계도** 역할을 하며 다음을 수행합니다:

1. 배포 전에 **환경을 검증**
2. **Azure AI 서비스** (AI 허브, AI 프로젝트, 검색 등) 프로비저닝
3. Python 애플리케이션을 Azure 컨테이너 앱에 <strong>배포</strong>
4. 채팅과 임베딩 기능을 위한 **AI 모델 구성**
5. AI 애플리케이션에 대한 **모니터링 및 추적 설정**
6. **신규 및 기존** Azure AI 프로젝트 시나리오를 모두 처리

이 파일은 적절한 검증, 프로비저닝 및 배포 후 구성을 통해 완전한 AI 에이전트 솔루션을 **한 명령어 배포**(`azd up`)할 수 있게 합니다.

??? info "확장하여 보기: `azure.yaml`"

      `azure.yaml` 파일은 Azure Developer CLI가 이 AI 에이전트 애플리케이션을 Azure에 배포하고 관리하는 방법을 정의합니다. 한 줄씩 살펴보겠습니다.

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

## 2. 파일 해체하기

파일을 섹션별로 나누어 무엇을 하는지, 그리고 그 이유를 살펴보겠습니다.

### 2.1 **헤더 및 스키마 (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1행**: IDE 지원과 인텔리센스를 위한 YAML 언어 서버 스키마 검증 제공

### 2.2 프로젝트 메타데이터 (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5행**: Azure Developer CLI에서 사용하는 프로젝트 이름 정의
- **6-7행**: 버전 1.0.2 템플릿을 기반으로 함 지정
- **8-9행**: Azure Developer CLI 버전 1.14.0 이상 필요

### 2.3 배포 후크 (11-40)

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

- **11-20행**: **배포 전 후크** - `azd up` 실행 전에 수행

      - Unix/Linux: 검증 스크립트를 실행 가능 상태로 만들고 실행
      - Windows: PowerShell 검증 스크립트 실행
      - 둘 다 대화형이며 실패 시 배포 중지

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
- **21-30행**: **프로비저닝 후 후크** - Azure 리소스 생성 후 실행

  - 환경 변수 작성 스크립트 실행
  - 스크립트 실패 시에도 계속 진행 (`continueOnError: true`)

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
- **31-40행**: **배포 후 후크** - 애플리케이션 배포 후 실행

  - 최종 설정 스크립트 실행
  - 스크립트 실패 시에도 계속 진행

### 2.4 서비스 구성 (41-48)

이 구성은 배포할 애플리케이션 서비스를 설정합니다.

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
- **43행**: 소스 코드가 있는 `./src` 디렉터리 지정
- **44행**: Python 프로그래밍 언어 명시
- **45행**: Azure 컨테이너 앱 호스팅 사용
- **46-48행**: 도커 구성

      - "api_and_frontend" 이미지를 사용
      - 도커 이미지를 Azure에서 원격으로 빌드 (로컬 아님)

### 2.5 파이프라인 변수 (49-76)

이는 자동화를 위한 CI/CD 파이프라인에서 `azd` 실행을 돕는 변수들입니다.

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

이 섹션은 **배포 중에 사용하는** 환경 변수를 범주별로 정의합니다:

- **Azure 리소스 이름 (51-60행)**:
      - 리소스 그룹, AI 허브, AI 프로젝트 등 핵심 Azure 서비스 이름
- **기능 플래그 (61-63행)**:
      - 특정 Azure 서비스 활성화/비활성화 여부를 나타내는 불리언 변수
- **AI 에이전트 구성 (64-71행)**:
      - 메인 AI 에이전트의 이름, ID, 배포 설정, 모델 상세 정보
- **AI 임베딩 구성 (72-79행)**:
      - 벡터 검색을 위한 임베딩 모델 구성
- **검색 및 모니터링 (80-84행)**:
      - 검색 인덱스 이름, 기존 리소스 ID, 모니터링 및 추적 설정

---

## 3. 환경 변수 알아보기
다음 환경 변수는 배포 구성과 동작을 제어하며, 주요 목적별로 정리되어 있습니다. 대부분의 변수는 합리적인 기본값을 가지고 있지만, 특정 요구 사항이나 기존 Azure 리소스에 맞게 사용자 정의할 수 있습니다.

### 3.1 필수 변수

```bash title="" linenums="0"
# 핵심 Azure 구성
AZURE_ENV_NAME                    # 환경 이름(리소스 이름 지정에 사용)
AZURE_LOCATION                    # 배포 지역
AZURE_SUBSCRIPTION_ID             # 대상 구독
AZURE_RESOURCE_GROUP              # 리소스 그룹 이름
AZURE_PRINCIPAL_ID                # RBAC를 위한 사용자 주체

# 리소스 이름(명시하지 않으면 자동 생성)
AZURE_AIHUB_NAME                  # Microsoft Foundry 허브 이름
AZURE_AIPROJECT_NAME              # AI 프로젝트 이름
AZURE_AISERVICES_NAME             # AI 서비스 계정 이름
AZURE_STORAGE_ACCOUNT_NAME        # 스토리지 계정 이름
AZURE_CONTAINER_REGISTRY_NAME     # 컨테이너 레지스트리 이름
AZURE_KEYVAULT_NAME               # 키 볼트 이름(사용 시)
```

### 3.2 모델 구성
```bash title="" linenums="0"
# 채팅 모델 구성
AZURE_AI_AGENT_MODEL_NAME         # 기본값: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # 기본값: OpenAI (또는 Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # 기본값: 사용 가능한 최신 버전
AZURE_AI_AGENT_DEPLOYMENT_NAME    # 채팅 모델 배포 이름
AZURE_AI_AGENT_DEPLOYMENT_SKU     # 기본값: 표준
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # 기본값: 80 (TPM 단위 천)

# 임베딩 모델 구성
AZURE_AI_EMBED_MODEL_NAME         # 기본값: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # 기본값: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # 기본값: 사용 가능한 최신 버전
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 임베딩 배포 이름
AZURE_AI_EMBED_DEPLOYMENT_SKU     # 기본값: 표준
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # 기본값: 50 (TPM 단위 천)

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

Azure Developer CLI를 사용하여 환경 변수를 보고 관리하세요:

```bash title="" linenums="0"
# 현재 환경의 모든 환경 변수를 봅니다
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
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확한 내용이 포함될 수 있음을 유의해 주시기 바랍니다. 원본 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문가에 의한 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->