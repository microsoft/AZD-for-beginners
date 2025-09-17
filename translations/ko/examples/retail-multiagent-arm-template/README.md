<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T15:16:08+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ko"
}
-->
# 소매 멀티 에이전트 솔루션 - ARM 템플릿 배포

**5장: 프로덕션 배포 패키지**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 관련 장**: [5장: 멀티 에이전트 AI 솔루션](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 시나리오 가이드**: [완전한 구현](../retail-scenario.md)
- **🎯 빠른 배포**: [원클릭 배포](../../../../examples/retail-multiagent-arm-template)

이 디렉토리에는 소매 멀티 에이전트 고객 지원 솔루션을 배포하기 위한 완전한 Azure Resource Manager (ARM) 템플릿이 포함되어 있으며, 전체 아키텍처를 코드로 제공하는 인프라를 제공합니다.

## 🎯 배포되는 항목

### 핵심 인프라
- **Azure OpenAI 서비스** (고가용성을 위한 멀티 지역)
  - 주요 지역: 고객 에이전트를 위한 GPT-4o
  - 보조 지역: 재고 에이전트를 위한 GPT-4o-mini  
  - 3차 지역: 텍스트 임베딩 모델
  - 평가 지역: GPT-4o 평가 모델
- **Azure AI 검색** 벡터 검색 기능 포함
- **Azure Storage Account** 문서 및 업로드를 위한 Blob 컨테이너 포함
- **Azure Container Apps 환경** 자동 확장 기능 포함
- **컨테이너 앱** 에이전트 라우터 및 프론트엔드용
- **Azure Cosmos DB** 채팅 기록 저장용
- **Azure Key Vault** 비밀 관리용 (선택 사항)
- **Application Insights** 및 Log Analytics 모니터링용 (선택 사항)
- **문서 인텔리전스** 문서 처리용
- **Bing Search API** 실시간 정보 제공용

### 배포 모드

| 모드 | 설명 | 사용 사례 | 리소스 |
|------|-------------|----------|-----------|
| **Minimal** | 비용 최적화된 기본 배포 | 개발, 테스트 | 기본 SKU, 단일 지역, 축소된 용량 |
| **Standard** | 프로덕션 워크로드를 위한 균형 잡힌 배포 | 프로덕션, 중간 규모 | 표준 SKU, 멀티 지역, 표준 용량 |
| **Premium** | 고성능, 엔터프라이즈급 배포 | 엔터프라이즈, 대규모 | 프리미엄 SKU, 멀티 지역, 고용량 |

## 📋 사전 요구 사항

1. **Azure CLI** 설치 및 구성 완료
2. **활성 Azure 구독** 충분한 할당량 보유
3. **적절한 권한** 대상 구독에서 리소스 생성 가능
4. **리소스 할당량**:
   - Azure OpenAI (지역 가용성 확인)
   - Container Apps (지역별로 다름)
   - AI 검색 (표준 등급 이상 권장)

## 🚀 빠른 배포

### 옵션 1: Azure CLI 사용

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### 옵션 2: Azure 포털 사용

[![Azure에 배포](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 옵션 3: Azure CLI 직접 사용

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ 구성 옵션

### 템플릿 매개변수

| 매개변수 | 유형 | 기본값 | 설명 |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | 모든 리소스 이름의 접두사 |
| `location` | string | 리소스 그룹 위치 | 주요 배포 지역 |
| `secondaryLocation` | string | "westus2" | 멀티 지역 배포를 위한 보조 지역 |
| `tertiaryLocation` | string | "francecentral" | 임베딩 모델을 위한 지역 |
| `environmentName` | string | "dev" | 환경 지정 (dev/staging/prod) |
| `deploymentMode` | string | "standard" | 배포 구성 (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | 멀티 지역 배포 활성화 |
| `enableMonitoring` | bool | true | Application Insights 및 로깅 활성화 |
| `enableSecurity` | bool | true | Key Vault 및 보안 강화 활성화 |

### 매개변수 사용자 정의

`azuredeploy.parameters.json` 수정:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ 아키텍처 개요

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 배포 스크립트 사용법

`deploy.sh` 스크립트는 인터랙티브한 배포 경험을 제공합니다:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### 스크립트 기능

- ✅ **사전 요구 사항 검증** (Azure CLI, 로그인 상태, 템플릿 파일)
- ✅ **리소스 그룹 관리** (존재하지 않을 경우 생성)
- ✅ **템플릿 검증** 배포 전
- ✅ **진행 상황 모니터링** 색상 출력 포함
- ✅ **배포 출력** 표시
- ✅ **배포 후 안내**

## 📊 배포 모니터링

### 배포 상태 확인

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### 배포 출력

성공적인 배포 후 다음 출력이 제공됩니다:

- **프론트엔드 URL**: 웹 인터페이스의 공개 엔드포인트
- **라우터 URL**: 에이전트 라우터의 API 엔드포인트
- **OpenAI 엔드포인트**: 주요 및 보조 OpenAI 서비스 엔드포인트
- **검색 서비스**: Azure AI 검색 서비스 엔드포인트
- **스토리지 계정**: 문서용 스토리지 계정 이름
- **Key Vault**: Key Vault 이름 (활성화된 경우)
- **Application Insights**: 모니터링 서비스 이름 (활성화된 경우)

## 🔧 배포 후 구성

### 1. 검색 인덱스 구성

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. 초기 데이터 업로드

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. 에이전트 엔드포인트 테스트

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. 컨테이너 앱 구성

ARM 템플릿은 플레이스홀더 컨테이너 이미지를 배포합니다. 실제 에이전트 코드를 배포하려면:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ 문제 해결

### 일반적인 문제

#### 1. Azure OpenAI 할당량 초과

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. 컨테이너 앱 배포 실패

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. 검색 서비스 초기화

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### 배포 검증

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 보안 고려 사항

### 키 관리
- 모든 비밀은 Azure Key Vault에 저장됨 (활성화된 경우)
- 컨테이너 앱은 관리 ID를 사용하여 인증
- 스토리지 계정은 안전한 기본값 사용 (HTTPS만 허용, 공개 Blob 액세스 없음)

### 네트워크 보안
- 컨테이너 앱은 가능한 경우 내부 네트워킹 사용
- 검색 서비스는 프라이빗 엔드포인트 옵션으로 구성
- Cosmos DB는 최소한의 필요한 권한으로 구성

### RBAC 구성
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 비용 최적화

### 비용 추정 (월별, USD)

| 모드 | OpenAI | 컨테이너 앱 | 검색 | 스토리지 | 총 예상 비용 |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### 비용 모니터링

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 업데이트 및 유지 관리

### 템플릿 업데이트
- ARM 템플릿 파일 버전 관리
- 개발 환경에서 변경 사항 테스트
- 업데이트를 위한 증분 배포 모드 사용

### 리소스 업데이트
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### 백업 및 복구
- Cosmos DB 자동 백업 활성화
- Key Vault 소프트 삭제 활성화
- 컨테이너 앱 리비전 유지 관리로 롤백 가능

## 📞 지원

- **템플릿 문제**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure 지원**: [Azure 지원 포털](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **커뮤니티**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ 멀티 에이전트 솔루션 배포 준비 완료?**

다음 명령으로 시작하세요: `./deploy.sh -g myResourceGroup`

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서(원어로 작성된 문서)를 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.  