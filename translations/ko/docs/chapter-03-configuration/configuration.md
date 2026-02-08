# 구성 가이드

**챕터 내비게이션:**
- **📚 코스 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 챕터 3 - 구성 및 인증
- **⬅️ 이전**: [첫 번째 프로젝트](first-project.md)
- **➡️ 다음**: [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 다음 챕터**: [챕터 4: 인프라를 코드로](../chapter-04-infrastructure/deployment-guide.md)

## 소개

이 포괄적인 가이드는 최적의 개발 및 배포 워크플로를 위한 Azure Developer CLI 구성의 모든 측면을 다룹니다. 구성 계층, 환경 관리, 인증 방법 및 효율적이고 안전한 Azure 배포를 가능하게 하는 고급 구성 패턴에 대해 배우게 됩니다.

## 학습 목표

이 강의를 마치면 다음을 수행할 수 있습니다:
- azd 구성 계층을 숙달하고 설정의 우선순위가 어떻게 결정되는지 이해합니다
- 전역 및 프로젝트별 설정을 효과적으로 구성합니다
- 서로 다른 구성을 가진 여러 환경을 관리합니다
- 보안 인증 및 권한 부여 패턴을 구현합니다
- 복잡한 시나리오를 위한 고급 구성 패턴을 이해합니다

## 학습 성과

이 강의를 완료한 후, 당신은 다음을 할 수 있습니다:
- 최적의 개발 워크플로를 위해 azd를 구성할 수 있습니다
- 여러 배포 환경을 설정하고 관리할 수 있습니다
- 보안 구성 관리 관행을 구현할 수 있습니다
- 구성 관련 문제를 해결할 수 있습니다
- 특정 조직 요구사항에 맞게 azd 동작을 사용자화할 수 있습니다

이 포괄적인 가이드는 최적의 개발 및 배포 워크플로를 위한 Azure Developer CLI 구성의 모든 측면을 다룹니다.

## 구성 계층

azd는 계층형 구성 시스템을 사용합니다:
1. **명령줄 플래그** (가장 높은 우선순위)
2. **환경 변수**
3. **로컬 프로젝트 구성** (`.azd/config.json`)
4. **전역 사용자 구성** (`~/.azd/config.json`)
5. **기본값** (가장 낮은 우선순위)

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
azd config set telemetry.enabled false             # 텔레메트리 비활성화
azd config set output.format json                  # 출력 형식 설정

# 보안 설정
azd config set auth.useAzureCliCredential true     # 인증에 Azure CLI 사용
azd config set tls.insecure false                  # TLS 검증 강제 적용

# 성능 튜닝
azd config set provision.parallelism 5             # 리소스 병렬 생성
azd config set deploy.timeout 30m                  # 배포 타임아웃
```

## 🏗️ 프로젝트 구성

### azure.yaml 구조
이 `azure.yaml` 파일은 azd 프로젝트의 핵심입니다:

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
# 새 환경을 생성합니다
azd env new development

# 특정 위치에 생성합니다
azd env new staging --location "westus2"

# 템플릿에서 생성합니다
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 환경 구성
각 환경은 `.azure/<env-name>/config.json`에 별도의 구성을 가집니다:

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
# 환경별 변수를 설정합니다
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# 환경 변수를 확인합니다
azd env get-values

# 예상 출력:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# 환경 변수를 제거합니다
azd env unset DEBUG

# 제거 여부를 확인합니다
azd env get-values | grep DEBUG
# (아무것도 반환하지 않아야 함)
```

### 환경 템플릿
일관된 환경 설정을 위해 `.azure/env.template`을 생성합니다:
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
# Azure CLI 자격 증명 사용 (기본)
azd config set auth.useAzureCliCredential true

# 특정 테넌트로 로그인
az login --tenant <tenant-id>

# 기본 구독 설정
az account set --subscription <subscription-id>
```

### 서비스 프린시펄 인증
CI/CD 파이프라인의 경우:
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
Azure 호스트 환경의 경우:
```bash
# 관리형 ID 인증을 활성화합니다
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ 인프라 구성

### Bicep 매개변수
인프라 매개변수를 `infra/main.parameters.json`에서 구성합니다:
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
Terraform 프로젝트의 경우 `infra/terraform.tfvars`에서 구성합니다:
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

### 사용자 지정 리소스 이름
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

## 🎯 환경별 구성

### 개발 환경
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### 스테이징 환경
```bash
# .azure/스테이징/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### 운영 환경
```bash
# .azure/운영/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 구성 검증

### 구성 유효성 검사
```bash
# 구성 문법 확인
azd config validate

# 환경 변수 테스트
azd env get-values

# 인프라 검증
azd provision --dry-run
```

### 구성 스크립트
유효성 검사 스크립트를 `scripts/`에 생성합니다:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 필수 환경 변수 확인
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml 구문 검사
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
.azure/*/config.json         # 환경 구성(리소스 ID 포함)
.azure/*/.env               # 환경 변수(비밀을 포함할 수 있음)
.env                        # 로컬 환경 파일
```

### 4. 구성 문서화
구성 내용을 `CONFIG.md`에 문서화하십시오:
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

**목표**: 서로 다른 설정을 가진 세 개의 환경을 생성하고 구성합니다

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

# 각 환경 검증
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**성공 기준:**
- [ ] 세 개의 환경이 성공적으로 생성됨
- [ ] 각 환경이 고유한 구성을 가짐
- [ ] 오류 없이 환경 간 전환 가능
- [ ] `azd env list`가 세 환경 모두를 표시함

### 연습 2: 비밀 관리 (10분)

**목표**: 민감한 데이터로 보안 구성을 연습합니다

```bash
# 비밀 설정(출력에 표시되지 않음)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 비밀이 아닌 구성 설정
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 환경 보기(비밀은 가려져야 함)
azd env get-values

# 비밀이 저장되었는지 확인
azd env get DB_PASSWORD  # 실제 값이 표시되어야 함
```

**성공 기준:**
- [ ] 비밀이 터미널에 표시되지 않도록 저장됨
- [ ] `azd env get-values`가 마스킹된 비밀을 표시함
- [ ] 개별 `azd env get <SECRET_NAME>`가 실제 값을 검색함

## 다음 단계

- [첫 번째 프로젝트](first-project.md) - 구성을 실제로 적용
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md) - 배포에 구성 사용
- [리소스 프로비저닝](../chapter-04-infrastructure/provisioning.md) - 운영 환경에 적합한 구성

## 참고 자료

- [azd 구성 참조](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 스키마](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [환경 변수](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**챕터 내비게이션:**
- **📚 코스 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 챕터 3 - 구성 및 인증
- **⬅️ 이전**: [첫 번째 프로젝트](first-project.md)
- **➡️ 다음 챕터**: [챕터 4: 인프라를 코드로](../chapter-04-infrastructure/deployment-guide.md)
- **다음 강의**: [첫 번째 프로젝트](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 고지:
이 문서는 AI 번역 서비스 Co-op Translator(https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 있을 수 있음을 양지하시기 바랍니다. 원어로 된 원본 문서를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->