# 구성 가이드

**챕터 내비게이션:**
- **📚 과정 홈**: [AZD For Beginners](../../README.md)
- **📖 현재 챕터**: 챕터 3 - 구성 및 인증
- **⬅️ 이전**: [첫 번째 프로젝트](first-project.md)
- **➡️ 다음**: [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 다음 챕터**: [챕터 4: 코드로서의 인프라](../chapter-04-infrastructure/deployment-guide.md)

## 소개

이 종합 가이드는 최적의 개발 및 배포 워크플로를 위해 Azure Developer CLI를 구성하는 모든 측면을 다룹니다. 구성 계층, 환경 관리, 인증 방법 및 효율적이고 안전한 Azure 배포를 가능하게 하는 고급 구성 패턴에 대해 학습할 수 있습니다.

## 학습 목표

이 수업이 끝나면 다음을 할 수 있습니다:
- azd 구성 계층을 마스터하고 설정이 어떻게 우선순위가 매겨지는지 이해
- 전역 및 프로젝트별 설정을 효과적으로 구성
- 서로 다른 구성을 가진 여러 환경 관리
- 안전한 인증 및 권한 부여 패턴 구현
- 복잡한 시나리오를 위한 고급 구성 패턴 이해

## 학습 결과

이 수업을 완료한 후 다음을 할 수 있습니다:
- azd를 최적의 개발 워크플로에 맞게 구성
- 여러 배포 환경 설정 및 관리
- 안전한 구성 관리 관행 구현
- 구성 관련 문제 해결
- 조직 요구사항에 맞게 azd 동작 맞춤화

이 종합 가이드는 최적의 개발 및 배포 워크플로를 위해 Azure Developer CLI를 구성하는 모든 측면을 다룹니다.

## azd 프로젝트 내 AI 에이전트 이해하기

AI 에이전트가 처음이라면 azd 세계 내에서 그것들을 이해하는 간단한 방법이 있습니다.

### 에이전트란 무엇인가?

에이전트는 요청을 받고, 이를 추론하며, AI 모델 호출, 데이터 조회 또는 다른 서비스 호출을 통해 동작을 수행하는 소프트웨어 조각입니다. azd 프로젝트에서 에이전트는 웹 프런트엔드나 API 백엔드와 함께 또 하나의 <strong>서비스</strong>일 뿐입니다.

### 에이전트가 azd 프로젝트 구조에 포함되는 방식

azd 프로젝트는 세 개의 계층으로 구성됩니다: <strong>인프라</strong>, <strong>코드</strong>, <strong>구성</strong>. 에이전트는 다른 서비스처럼 이 계층들에 연결됩니다:

| 계층 | 전통적 앱에 하는 역할 | 에이전트에 하는 역할 |
|-------|-------------------------|-----------------------|
| <strong>인프라</strong> (`infra/`) | 웹 앱과 데이터베이스 프로비저닝 | AI 모델 엔드포인트, 검색 인덱스 또는 에이전트 호스트 프로비저닝 |
| <strong>코드</strong> (`src/`) | 프런트엔드 및 API 소스 코드 포함 | 에이전트 로직과 프롬프트 정의 포함 |
| <strong>구성</strong> (`azure.yaml`) | 서비스와 그 호스팅 대상 목록 | 에이전트를 서비스로 목록화하며 코드와 호스트 위치 지정 |

### `azure.yaml`의 역할

지금 문법을 외울 필요는 없습니다. 개념적으로 `azure.yaml`은 azd에게 <em>"내 애플리케이션을 구성하는 서비스들이며, 이들의 코드는 여기 있다"</em>고 알려주는 파일입니다.

프로젝트에 AI 에이전트가 포함되면 `azure.yaml`은 단순히 그 에이전트를 서비스 중 하나로 나열합니다. azd는 Microsoft Foundry Models 엔드포인트나 에이전트를 호스팅하는 컨테이너 앱과 같은 적절한 인프라를 프로비저닝하고, 에이전트 코드를 배포할 방법을 알게 됩니다—웹 앱이나 API와 동일한 방식으로 처리합니다.

이는 본질적으로 새로 배워야 할 것이 없다는 뜻입니다. azd가 웹 서비스를 어떻게 관리하는지 이해하면, 에이전트 관리 방법도 이미 이해한 것입니다.

## 구성 계층

azd는 계층적 구성 시스템을 사용합니다:
1. **명령줄 플래그** (최고 우선순위)
2. **환경 변수**
3. **로컬 프로젝트 구성** (`.azd/config.json`)
4. **전역 사용자 구성** (`~/.azd/config.json`)
5. <strong>기본값</strong> (최저 우선순위)

## 전역 구성

### 전역 기본값 설정
```bash
# 기본 구독 설정
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 기본 위치 설정
azd config set defaults.location "eastus2"

# 기본 리소스 그룹 명명 규칙 설정
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# 모든 전역 구성 보기
azd config list

# 구성 제거
azd config unset defaults.location
```

### 공통 전역 설정
```bash
# 개발 환경 설정
azd config set alpha.enable true                    # 알파 기능 활성화
azd config set telemetry.enabled false             # 원격 측정 비활성화
azd config set output.format json                  # 출력 형식 설정

# 보안 설정
azd config set auth.useAzureCliCredential true     # 인증에 Azure CLI 사용
azd config set tls.insecure false                  # TLS 검증 강제 적용

# 성능 조정
azd config set provision.parallelism 5             # 병렬 리소스 생성
azd config set deploy.timeout 30m                  # 배포 시간 초과
```

## 🏗️ 프로젝트 구성

### azure.yaml 구조
`azure.yaml` 파일은 azd 프로젝트의 핵심입니다:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### 서비스 구성 옵션

#### 호스트 유형
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### 언어별 설정
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 환경 관리

### 환경 생성
```bash
# 새 환경 생성
azd env new development

# 특정 위치에 생성
azd env new staging --location "westus2"

# 템플릿에서 생성
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 환경 구성
각 환경은 `.azure/<env-name>/config.json`에 고유 구성을 가집니다:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### 환경 변수
```bash
# 환경별 변수 설정
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# 환경 변수 보기
azd env get-values

# 예상 출력:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=비밀-api-키
# DEBUG=참

# 환경 변수 제거
azd env unset DEBUG

# 제거 확인
azd env get-values | grep DEBUG
# (아무것도 반환하지 않아야 함)
```

### 환경 템플릿
일관된 환경 설정을 위해 `.azure/env.template` 생성:
```bash
# 필수 변수
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# 애플리케이션 설정
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# 선택적 개발 설정
DEBUG=false
LOG_LEVEL=info
```

## 🔐 인증 구성

### Azure CLI 통합
```bash
# Azure CLI 자격 증명 사용(기본값)
azd config set auth.useAzureCliCredential true

# 특정 테넌트로 로그인
az login --tenant <tenant-id>

# 기본 구독 설정
az account set --subscription <subscription-id>
```

### 서비스 주체 인증
CI/CD 파이프라인용:
```bash
# 환경 변수를 설정합니다
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# 또는 직접 구성합니다
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### 관리형 ID
Azure 호스팅 환경용:
```bash
# 관리형 ID 인증 활성화
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ 인프라 구성

### Bicep 매개변수
`infra/main.parameters.json`에서 인프라 매개변수 구성:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform 구성
Terraform 프로젝트의 경우 `infra/terraform.tfvars`에서 구성:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 배포 구성

### 빌드 구성
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### 도커 구성
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
예시 `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml

## 🔧 고급 구성

### 사용자 지정 리소스 명명
```bash
# 명명 규칙 설정
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### 네트워크 구성
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### 모니터링 구성
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 환경 별 구성

### 개발 환경
```bash
# .azure/개발/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### 스테이징 환경
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### 프로덕션 환경
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 구성 검증

### 구성 검증
```bash
# 구성 구문 확인
azd config validate

# 환경 변수 테스트
azd env get-values

# 인프라 검증
azd provision --dry-run
```

### 구성 스크립트
`scripts/`에 검증 스크립트 작성:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 필수 환경 변수 확인
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml 구문 검증
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 모범 사례

### 1. 환경 변수 사용
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. 구성 파일 정리
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. 버전 관리 고려사항
```bash
# .gitignore
.azure/*/config.json         # 환경 설정 (리소스 ID 포함)
.azure/*/.env               # 환경 변수 (비밀 정보 포함 가능)
.env                        # 로컬 환경 파일
```

### 4. 구성 문서화
구성 내용을 `CONFIG.md`에 문서화:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 실습 연습 문제

### 연습 1: 다중 환경 구성 (15분)

<strong>목표</strong>: 서로 다른 설정을 가진 세 개의 환경을 생성 및 구성

```bash
# 개발 환경 생성
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# 스테이징 환경 생성
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# 프로덕션 환경 생성
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# 각 환경 확인
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**성공 기준:**
- [ ] 세 개 환경이 성공적으로 생성됨
- [ ] 각 환경은 고유한 구성 보유
- [ ] 환경 간 오류 없이 전환 가능
- [ ] `azd env list`에 세 개 환경 모두 표시

### 연습 2: 비밀 관리 (10분)

<strong>목표</strong>: 민감한 데이터로 안전한 구성을 실습

```bash
# 비밀 설정 (출력에 표시되지 않음)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 비밀이 아닌 구성 설정
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 환경 보기 (비밀은 편집되어야 함)
azd env get-values

# 비밀이 저장되었는지 확인
azd env get DB_PASSWORD  # 실제 값이 표시되어야 함
```

**성공 기준:**
- [ ] 비밀이 터미널에 표시되지 않고 저장됨
- [ ] `azd env get-values`가 편집된(가려진) 비밀 보여줌
- [ ] 개별 `azd env get <SECRET_NAME>`이 실제 값 반환

## 다음 단계

- [첫 번째 프로젝트](first-project.md) - 실습으로 구성 적용
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md) - 배포를 위한 구성 사용
- [리소스 프로비저닝](../chapter-04-infrastructure/provisioning.md) - 프로덕션 준비 구성

## 참고 문헌

- [azd 구성 참조](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 스키마](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [환경 변수](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**챕터 내비게이션:**
- **📚 과정 홈**: [AZD For Beginners](../../README.md)
- **📖 현재 챕터**: 챕터 3 - 구성 및 인증
- **⬅️ 이전**: [첫 번째 프로젝트](first-project.md)
- **➡️ 다음 챕터**: [챕터 4: 코드로서의 인프라](../chapter-04-infrastructure/deployment-guide.md)
- **다음 수업**: [첫 번째 프로젝트](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역은 오류나 부정확성이 포함될 수 있음을 유의해 주시기 바랍니다. 원문 문서는 권위 있는 공식 출처로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인한 오해나 잘못된 해석에 대해 당사는 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->