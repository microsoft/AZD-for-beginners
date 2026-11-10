# AI 워크샵 랩: AI 솔루션을 AZD 배포 가능하게 만들기

**챕터 탐색:**
- **📚 강좌 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 2장 - AI 우선 개발
- **⬅️ 이전**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ 다음**: [프로덕션 AI 모범 사례](../chapter-08-production/production-ai-practices.md)
- **🚀 다음 챕터**: [3장: 구성](../chapter-03-configuration/configuration.md)

## 워크샵 개요

이 실습 랩은 개발자가 기존 AI 템플릿을 가져와 Azure Developer CLI (AZD)를 사용해 배포하는 과정을 안내합니다. Microsoft Foundry 서비스를 사용한 프로덕션 AI 배포의 필수 패턴을 배우게 됩니다.

> **릴리스 검토 (2026-11-04):** AZD 명령 안내와 샘플 구성 이름은 `azd` `1.37.2` 릴리스 및 연결된 샘플의 현재 구성과 대조 확인했습니다. 이는 문서 검토이며 실제 배포 검증은 아닙니다. RAG 랩은 에이전트 확장이 필요 없으며, 에이전트 평가에는 별도의 `azure.ai.evaluations` 확장과 [현재 평가 워크플로](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks)를 사용하시기 바랍니다. 이전 에이전트 평가 명령은 사용하지 않습니다.

**소요 시간:** 2~3시간  
**난이도:** 중급  
**선수 지식:** 기본 Azure 지식, AI/ML 개념 친숙도

## 🎓 학습 목표

이 워크샵을 마치면 다음을 수행할 수 있습니다:
- ✅ 기존 AI AZD 템플릿 탐색 및 자체 애플리케이션 변환 계획 수립
- ✅ AZD로 Microsoft Foundry 서비스 구성
- ✅ AI 서비스용 보안 자격 증명 관리 구현
- ✅ 모니터링 포함 AI 참조 애플리케이션 배포
- ✅ 일반적인 AI 배포 문제 해결

## 선수 조건

### 필수 도구
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 설치
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 설치
- [Git](https://git-scm.com/) 설치
- 코드 편집기 (VS Code 권장)

이 명령 블록은 Bash 구문(라인 연속 포함 및 `grep`)을 사용합니다. Windows에서는 Git Bash/WSL을 사용하거나 PowerShell로 변환하세요. 또한 [샘플의 로컬 환경 설정](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment)에 나열된 언어, 패키지 관리자 및 컨테이너 도구를 설치하세요.

### Azure 리소스
- 리소스 프로비저닝 및 역할 할당 권한이 있는 Azure 구독 (기여자 역할만으로는 RBAC 할당을 생성할 수 없으며, 권한이 있는 역할 관리자 또는 샘플에서 문서화된 동등한 권한 사용)
- Microsoft Foundry Models 서비스 접근 권한 (또는 접근 요청 권한)
- 리소스 그룹 생성 권한

### 지식 전제 조건
- Azure 서비스에 대한 기본 이해
- 명령줄 인터페이스 사용 경험
- 기본 AI/ML 개념 (API, 모델, 프롬프트)

## 실습 환경 설정

### 1단계: 환경 준비

1. **도구 설치 확인:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

여러 테넌트에서 작업하거나 구독이 자동으로 감지되지 않는 경우, `azd auth login --tenant-id <tenant-id>`를 사용해 재시도하세요.

2. **워크숍 저장소 복제:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 모듈 1: AI 애플리케이션을 위한 AZD 구조 이해

### AI AZD 템플릿의 구성

AI 준비가 된 AZD 템플릿의 주요 파일을 살펴보세요:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

체크아웃된 샘플은 변경될 수 있습니다; `.azure/`는 환경 초기화 이후에 나타나며, 반드시 새 클론에서 보이지는 않습니다. 이 도식에 맞추기 위해 누락된 디렉터리를 생성하지 말고 실제 체크아웃 상태를 확인하세요.

### **실습 1.1: 구성 탐색**

1. **azure.yaml 파일 검토:**
```bash
cat azure.yaml
```

**중점 확인 사항:**
- AI 구성 요소에 대한 서비스 정의
- 환경 변수 매핑
- 호스트 구성

2. **main.bicep 인프라 검토:**
```bash
cat infra/main.bicep
```

**확인할 주요 AI 패턴:**
- Microsoft Foundry Models 서비스 프로비저닝
- Azure AI Search 통합
- 안전한 키 관리
- 네트워크 보안 구성

### **토론 주제:** AI에서 이러한 패턴이 중요한 이유

- **서비스 종속성**: AI 앱은 여러 연동 서비스가 필요한 경우가 많음
- <strong>보안</strong>: API 키와 엔드포인트는 안전하게 관리되어야 함
- <strong>확장성</strong>: AI 워크로드는 고유한 확장 요구 사항이 있음
- **비용 관리**: AI 서비스는 적절히 구성하지 않으면 비용이 많이 들 수 있음

## 모듈 2: 첫 AI 애플리케이션 배포

### 2.1단계: 환경 초기화

1. **새 AZD 환경 생성:**
```bash
azd env new myai-workshop
```

2. **필수 매개변수 설정:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### 2.2단계: 인프라 및 애플리케이션 배포

1. **AZD로 배포:**
```bash
azd up
```

**`azd up` 동안 발생하는 작업:**
- ✅ Microsoft Foundry Models 서비스 프로비저닝
- ✅ Azure AI Search 서비스 생성
- ✅ 백엔드 및 번들된 프런트엔드용 Azure Container Apps 설정 (현재 샘플 기본값)
- ✅ 네트워크 및 보안 구성
- ✅ 애플리케이션 코드 배포
- ✅ 모니터링 및 로깅 설정

2. **배포 진행 상황 모니터링** 및 생성되는 리소스를 확인하세요.

### 2.3단계: 배포 확인

1. **배포된 리소스 확인:**
```bash
azd show
```

2. **배포된 애플리케이션 열기:**
```bash
azd show
```

`azd show` 출력에 표시된 웹 엔드포인트를 엽니다.

3. **AI 기능 테스트:**
   - 웹 애플리케이션으로 이동
   - 샘플 쿼리 시도
   - AI 응답이 작동하는지 확인

### **실습 2.1: 문제 해결 연습**

<strong>시나리오</strong>: 배포는 성공했으나 AI가 응답하지 않음.

**확인해야 할 일반적인 문제:**
1. <strong>인증</strong>: 관리형 ID와 역할 할당을 확인하세요; API 키 인증을 의도적으로 활성화한 경우에만 API 키를 확인하세요.
2. **모델 지원 여부**: 지역에서 모델을 지원하는지 확인하세요.
3. **네트워크 연결성**: 서비스 간 통신이 가능한지 확인하세요.
4. **RBAC 권한**: 앱이 OpenAI에 접근할 수 있는지 확인하세요.

**디버깅 명령어:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 모듈 3: 필요에 맞게 AI 애플리케이션 맞춤화

### 단계 3.1: AI 구성 수정

1. **OpenAI 모델 업데이트:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **추가 AI 서비스 추가:**

Document Intelligence를 추가하기 위해 `infra/main.bicep` 를 편집하세요:

다음은 전체 템플릿이 아닌 설명용 일부입니다. 샘플이 이미 문서 처리 서비스를 프로비저닝 할 수도 있으니, 중복 리소스 추가 전 현재 인프라를 검토하세요. 사용자 지정 추가는 출력, ID 및 애플리케이션 구성을 연결해야 합니다.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### 단계 3.2: 환경별 구성

**모범 사례**: 개발과 운영에서 다른 구성을 사용하세요.

1. **운영 환경 생성:**
```bash
azd env new myai-production
```

2. **운영 전용 매개변수 설정:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

이 이름들은 샘플의 [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json)에서 가져온 것입니다. `azd env set` 는 값을 저장하지만 임의 변수를 활성화하지는 않습니다: 템플릿이 이를 사용해야 합니다. 공개 액세스 비활성화 전에 샘플의 [네트워크 격리 가이드](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md)를 검토하고, 인프라 변경 적용에 `azd up` 를 사용하세요. OpenAI SKU `S0` 단독으로는 모델 처리량을 결정하지 않습니다; 모델 배포 유형과 용량도 중요합니다.

### **실습 3.1: 비용 최적화**

<strong>과제</strong>: 비용 효율적인 개발을 위해 템플릿 구성하기.

**작업:**
1. 폐기 가능한 워크숍 환경 선택: `azd env select myai-workshop`.
2. `infra/main.parameters.json` 와 선택한 환경에서 현재 Search SKU 및 모델 용량 기록.
3. 모델/지역 할당량을 확인 후 아래 지원 입력 값 사용:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. 포털에서 Search SKU 및 배포 용량 확인, 가격 계산기로 차이 추정. 청구 데이터가 즉시 업데이트 되지 않을 수 있습니다.

**성공 기준:** Search는 Basic을 사용하고, 챗 배포는 요청한 용량을 가지며, 앱이 샘플 질문에 응답할 것. 용량 `10` 는 토큰 가격 할인 아닌 속도 제한 할당입니다. Search 등급 변경은 제한되거나 재생성이 필요할 수 있으니 운영 리소스에 실험하지 마세요. F0는 서비스별이며 Azure OpenAI 모델 SKU가 아닙니다.

## 모듈 4: 보안 및 운영 모범 사례

### 단계 4.1: 자격 증명 보안 관리

**현재 문제**: 많은 AI 앱이 API 키를 하드코딩하거나 안전하지 않은 저장소를 사용함.

**AZD 솔루션**: 관리형 ID + Key Vault 통합.

1. **템플릿에서 보안 구성을 검토하세요:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **관리되는 ID가 작동하는지 확인:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### 4.2단계: 네트워크 보안

1. **샘플이 지원하는 네트워크 구성을 사용하여 프라이빗 엔드포인트를 활성화** 합니다(이미 구성되지 않은 경우).

자신의 템플릿에 대해 이 예시 조각은 OpenAI 엔드포인트 연결을 보여줍니다. 또한 VNet, 프라이빗 DNS 구성, 애플리케이션 연결이 필요하며, 이미 프라이빗 엔드포인트 모듈이 있는 샘플에 변경 없이 붙여넣지 마십시오:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### 4.3단계: 모니터링 및 가시성

1. **Application Insights 구성:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **샘플의 Application Insights 통합 활성화:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

샘플의 계측은 텔레메트리를 전송합니다; 임의의 `OPENAI_MONITOR_ENABLED` 설정은 AI 지표를 활성화하지 않습니다. 모델 호출, 대기 시간, 실패, 토큰 사용 추적을 검토하고 민감한 프롬프트나 응답 기록은 피하십시오.

### **실습 4.1: 보안 감사**

<strong>작업</strong>: 배포의 보안 모범 사례를 검토합니다.

**체크리스트:**
- [ ] 코드나 구성에 하드코딩된 비밀이 없음
- [ ] 서비스 간 인증에 관리되는 ID 사용
- [ ] Key Vault에 민감한 구성 저장
- [ ] 네트워크 접근이 적절히 제한됨
- [ ] 모니터링 및 로깅이 활성화됨

## 5단계: 본인 AI 애플리케이션 변환

### 5.1단계: 평가 워크시트

**애플리케이션을 변환하기 전에** 다음 질문에 답하세요:

1. **애플리케이션 아키텍처:**
   - 애플리케이션에서 사용하는 AI 서비스는 무엇인가요?
   - 필요한 컴퓨팅 자원은 무엇인가요?
   - 데이터베이스가 필요한가요?
   - 서비스 간 종속성은 무엇인가요?

2. **보안 요구사항:**
   - 애플리케이션이 처리하는 민감한 데이터는 무엇인가요?
   - 준수해야 하는 규정은 무엇인가요?
   - 프라이빗 네트워킹이 필요한가요?

3. **확장 요구사항:**
   - 예상되는 부하는 어느 정도인가요?
   - 자동 확장이 필요한가요?
   - 지역 제한 사항이 있나요?

### 5.2단계: AZD 템플릿 생성

**애플리케이션 변환 시 이 패턴을 따르세요:**

**스캐폴딩만 제공:** 이 섹션은 API/웹 애플리케이션 소스, 호스트 인프라, 모델 배포, ID/RBAC, 완성된 `main.parameters.json`를 제공하지 않습니다. 리소스 그룹 범위의 Bicep은 모듈 구성을 보여줍니다; 일반적인 AZD 구독 범위 진입점은 리소스 그룹을 생성하고 해당 범위에서 호출해야 합니다. 이러한 조각들만 복사해도 `azd up`이 완전한 앱을 배포할 것으로 기대하지 마십시오. 실행 가능한 기본값은 1단계의 RAG 템플릿을 계속 사용하세요.

1. **기본 구조 생성:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **azure.yaml 생성:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **인프라 템플릿 생성:**

**infra/main.bicep** - 메인 템플릿:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI 모듈:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **실습 5.1: 템플릿 생성 챌린지**

<strong>챌린지</strong>: 문서 처리 AI 앱을 위한 AZD 템플릿 생성.

**요구사항:**
- 콘텐츠 분석용 Microsoft Foundry 모델
- OCR용 문서 인텔리전스
- 문서 업로드용 스토리지 계정
- 처리 로직용 펑션 앱
- 사용자 인터페이스용 웹 앱

**보너스 점수:**
- 적절한 오류 처리 추가
- 비용 추정 포함
- 모니터링 대시보드 설정

## 모듈 6: 일반적인 문제 해결

### 일반적인 배포 문제

#### 문제 1: OpenAI 서비스 할당량 초과
**증상:** 할당량 오류로 배포 실패
**해결책:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### 문제 2: 지역에서 모델 사용 불가
**증상:** AI 응답 실패 또는 모델 배포 오류
**해결책:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### 문제 3: 권한 문제
**증상:** AI 서비스 호출 시 403 금지 오류
**해결책:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 성능 문제

#### 문제 4: 느린 AI 응답
**조사 단계:**
1. Application Insights에서 성능 지표 확인
2. Azure 포털에서 OpenAI 서비스 지표 검토
3. 네트워크 연결 및 지연 시간 확인

**해결책:**
- 일반 쿼리에 대한 캐싱 구현
- 사용 사례에 적합한 OpenAI 모델 사용
- 모델 RPM/TPM 한도를 확인한 후에만 애플리케이션 복제본 확장; Azure OpenAI 배포는 일반적인 데이터베이스 스타일의 "읽기 복제본" 설정을 제공하지 않음

### **실습 6.1: 디버깅 도전 과제**

<strong>시나리오</strong>: 배포는 성공했으나 애플리케이션이 500 오류를 반환함.

**디버깅 작업:**
1. 애플리케이션 로그 확인
2. 서비스 연결 확인
3. 인증 테스트
4. 구성 검토

**사용할 도구:**
- 배포 개요를 위한 `azd show`
- 자세한 서비스 로그를 위한 Azure 포털
- 애플리케이션 텔레메트리를 위한 Application Insights

## 모듈 7: 모니터링 및 최적화

### 7.1단계: 종합 모니터링 설정

1. **맞춤형 대시보드 생성:**

Azure 포털로 이동하여 다음과 함께 대시보드를 만듭니다:
- OpenAI 요청 수 및 대기 시간
- 애플리케이션 오류율
- 리소스 사용량
- 비용 추적

2. **알림 설정:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

구성요소가 요청 텔레메트리를 전송하는지 확인하고 알림이 필요하면 작업 그룹을 추가하십시오. 이 메트릭은 실패 비율이 아닌 개수이며, 비율 알림은 적절한 쿼리와 분모가 필요합니다.

### 7.2단계: 비용 최적화

1. **현재 비용 분석:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

날짜 자리 표시자를 교체하세요. 소비 API 지원은 청구 계약에 따라 다르며, 사용 내역이 없으면 포털 내 비용 관리를 사용하십시오. 비용은 지연되고 실시간 테스트 오라클이 아닙니다.

2. **비용 통제 구현:**
- 예산 알림 설정
- 자동 확장 정책 사용
- 요청 캐싱 구현
- OpenAI 토큰 사용 모니터링

### **실습 7.1: 성능 최적화**

<strong>과제</strong>: AI 애플리케이션의 성능과 비용을 모두 최적화하세요.

**향상할 지표:**
- 평균 응답 시간 20% 단축
- 월간 비용 15% 절감
- 99.9% 가용성 SLO 및 측정 창 정의 (짧은 실습으로는 월간 가동 시간 증명이 어렵습니다)

**시도할 전략:**
- 응답 캐싱 구현
- 토큰 효율성을 위한 프롬프트 최적화
- 적합한 컴퓨트 SKU 사용
- 적절한 자동 확장 설정

## 최종 도전 과제: 엔드 투 엔드 구현

### 도전 시나리오

이것은 <strong>선택적 아키텍처/설계 도전 과제</strong>이며, 제공된 실행 가능한 실습이나 생산 인증이 아닙니다. AI 기반 고객 서비스 챗봇을 제안하고 추가 구현 및 증거가 필요한 요구 사항을 문서화하십시오:

**기능적 요구 사항:**
- 고객 상호작용을 위한 웹 인터페이스
- 응답을 위한 Microsoft Foundry 모델 통합
- Azure AI 검색을 이용한 문서 검색 기능
- 기존 고객 데이터베이스 통합
- 다국어 지원

**비기능적 요구 사항:**
- 1000명의 동시 사용자 처리
- 99.9% 가동 시간 SLA
- SOC 2 컴플라이언스
- 월 비용 500달러 이하
- 여러 환경에 배포(개발, 스테이징, 운영)

이는 가상의 이해관계자 제약 조건일 뿐 동시에 보장되는 결과가 아닙니다. 비용을 추정하기 전에 요청률, 프롬프트/출력 크기 및 세션 지속 시간을 정의하세요; 1,000 동시 사용자가 워크로드를 확립하거나 500달러 예산의 현실성을 입증하지 않습니다. SOC 2는 조직 감사 결과이며 AZD 템플릿으로 활성화되는 스위치가 아닙니다. 절충점을 파악하고 실행 불가능한 제약 조건을 증거와 함께 거부하세요.

### 구현 단계

1. **아키텍처 설계**
2. **AZD 템플릿 작성**
3. **보안 조치 구현**
4. **모니터링 및 알림 설정**
5. **배포 파이프라인 생성**
6. **솔루션 문서화**

### 평가 기준

- ✅ <strong>기능성</strong>: 구현된 기능이 입증되었고 남은 격차가 명확한가?
- ✅ <strong>보안</strong>: 모범 사례가 구현되었는가?
- ✅ <strong>확장성</strong>: 부하를 처리할 수 있는가?
- ✅ <strong>유지관리성</strong>: 코드와 인프라가 잘 조직되어 있는가?
- ✅ <strong>비용</strong>: 예산 내인가?

## 추가 자료

### Microsoft 문서
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### 샘플 템플릿
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 커뮤니티 리소스
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 완료 확인점

축하합니다! AI 워크숍 실습을 완료했습니다. 이제 다음을 수행할 수 있습니다:

- ✅ 기존 AI 애플리케이션을 AZD 템플릿에 맞게 조정하는 방법 설명
- ✅ AI 참조 애플리케이션 배포 및 테스트
- ✅ AI 작업 부하를 위한 보안 모범 사례 구현
- ✅ AI 애플리케이션 성능 모니터링 및 최적화
- ✅ 일반적인 배포 문제 해결

**정리:** `azd env list`를 실행하고, 이 실습에서 생성된 각 임시 환경(`myai-workshop`, 그리고 배포된 경우 `myai-production`/`myai-quota-test`)을 선택한 뒤 각 환경에서 `azd down`를 실행하세요. 삭제 계획을 검토하세요; 환경의 로컬 구성만 삭제해도 Azure 리소스는 삭제되지 않습니다. 되돌릴 수 없는 소프트 삭제 리소스 제거는 이해하지 못하면 `--purge`를 피하세요.

### 다음 단계
1. 이러한 패턴을 자신의 AI 프로젝트에 적용하세요
2. 커뮤니티에 템플릿을 기여하세요
3. 지속적인 지원을 위해 Microsoft Foundry Discord에 참여하세요
4. 다중 지역 배포와 같은 고급 주제를 탐색하세요

---

**워크숍 피드백**: [Microsoft Foundry Discord #Azure 채널](https://discord.gg/microsoft-azure)에서 경험을 공유하여 이 워크숍 개선에 도움을 주세요.

---

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 2장 - AI 우선 개발
- **⬅️ 이전**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ 다음**: [생산 AI 모범 사례](../chapter-08-production/production-ai-practices.md)
- **🚀 다음 챕터**: [3장: 구성](../chapter-03-configuration/configuration.md)

**도움이 필요하신가요?** AZD 및 AI 배포에 관한 지원과 토론을 위해 커뮤니티에 참여하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->