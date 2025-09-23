<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:12:18+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ko"
}
-->
# AI 워크숍 실습: AZD 배포 가능한 AI 솔루션 만들기

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI 우선 개발
- **⬅️ 이전**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ 다음**: [프로덕션 AI 모범 사례](production-ai-practices.md)
- **🚀 다음 챕터**: [챕터 3: 구성](../getting-started/configuration.md)

## 워크숍 개요

이 실습은 기존 AI 템플릿을 사용하여 Azure Developer CLI (AZD)를 통해 배포하는 과정을 개발자들에게 안내합니다. Azure AI Foundry 서비스를 활용하여 프로덕션 AI 배포를 위한 필수 패턴을 배우게 됩니다.

**소요 시간:** 2-3시간  
**난이도:** 중급  
**사전 요구사항:** 기본적인 Azure 지식, AI/ML 개념에 대한 이해

## 🎓 학습 목표

이 워크숍을 완료하면 다음을 수행할 수 있습니다:
- ✅ 기존 AI 애플리케이션을 AZD 템플릿으로 변환
- ✅ AZD를 사용하여 Azure AI Foundry 서비스 구성
- ✅ AI 서비스에 대한 안전한 자격 증명 관리 구현
- ✅ 모니터링이 포함된 프로덕션 준비 AI 애플리케이션 배포
- ✅ 일반적인 AI 배포 문제 해결

## 사전 요구사항

### 필수 도구
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 설치
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 설치
- [Git](https://git-scm.com/) 설치
- 코드 편집기 (VS Code 권장)

### Azure 리소스
- 기여자 액세스 권한이 있는 Azure 구독
- Azure OpenAI 서비스 액세스 (또는 액세스 요청 가능)
- 리소스 그룹 생성 권한

### 지식 요구사항
- Azure 서비스에 대한 기본 이해
- 명령줄 인터페이스에 대한 친숙함
- 기본 AI/ML 개념 (API, 모델, 프롬프트)

## 실습 설정

### 1단계: 환경 준비

1. **도구 설치 확인:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **워크숍 저장소 클론:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## 모듈 1: AI 애플리케이션을 위한 AZD 구조 이해

### AI AZD 템플릿의 구성 요소

AI 준비된 AZD 템플릿의 주요 파일을 탐색합니다:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```


### **실습 1.1: 구성 살펴보기**

1. **azure.yaml 파일 검토:**
```bash
cat azure.yaml
```

**확인할 내용:**
- AI 구성 요소에 대한 서비스 정의
- 환경 변수 매핑
- 호스트 구성

2. **main.bicep 인프라 검토:**
```bash
cat infra/main.bicep
```

**확인할 주요 AI 패턴:**
- Azure OpenAI 서비스 프로비저닝
- Cognitive Search 통합
- 안전한 키 관리
- 네트워크 보안 구성

### **토론 주제:** 이러한 패턴이 AI에 중요한 이유

- **서비스 종속성**: AI 앱은 여러 서비스의 조율이 필요
- **보안**: API 키와 엔드포인트는 안전하게 관리되어야 함
- **확장성**: AI 워크로드는 고유한 확장 요구사항을 가짐
- **비용 관리**: AI 서비스는 적절히 구성되지 않으면 비용이 높아질 수 있음

## 모듈 2: 첫 번째 AI 애플리케이션 배포

### 2.1단계: 환경 초기화

1. **새로운 AZD 환경 생성:**
```bash
azd env new myai-workshop
```

2. **필수 매개변수 설정:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### 2.2단계: 인프라 및 애플리케이션 배포

1. **AZD로 배포:**
```bash
azd up
```

**`azd up` 실행 시 발생하는 작업:**
- ✅ Azure OpenAI 서비스 프로비저닝
- ✅ Cognitive Search 서비스 생성
- ✅ 웹 애플리케이션을 위한 App Service 설정
- ✅ 네트워킹 및 보안 구성
- ✅ 애플리케이션 코드 배포
- ✅ 모니터링 및 로깅 설정

2. **배포 진행 상황 모니터링** 및 생성된 리소스 확인

### 2.3단계: 배포 확인

1. **배포된 리소스 확인:**
```bash
azd show
```

2. **배포된 애플리케이션 열기:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI 기능 테스트:**
   - 웹 애플리케이션으로 이동
   - 샘플 쿼리 시도
   - AI 응답이 작동하는지 확인

### **실습 2.1: 문제 해결 연습**

**시나리오**: 배포는 성공했지만 AI가 응답하지 않음.

**확인해야 할 일반적인 문제:**
1. **OpenAI API 키**: 올바르게 설정되었는지 확인
2. **모델 가용성**: 해당 지역에서 모델이 지원되는지 확인
3. **네트워크 연결**: 서비스 간 통신이 가능한지 확인
4. **RBAC 권한**: 앱이 OpenAI에 액세스할 수 있는지 확인

**디버깅 명령어:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## 모듈 3: AI 애플리케이션 사용자 정의

### 3.1단계: AI 구성 수정

1. **OpenAI 모델 업데이트:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **추가 AI 서비스 추가:**

`infra/main.bicep`를 편집하여 Document Intelligence 추가:

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


### 3.2단계: 환경별 구성

**모범 사례**: 개발과 프로덕션에 대해 다른 구성 사용.

1. **프로덕션 환경 생성:**
```bash
azd env new myai-production
```

2. **프로덕션 전용 매개변수 설정:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **실습 3.1: 비용 최적화**

**도전 과제**: 비용 효율적인 개발을 위한 템플릿 구성.

**작업:**
1. 무료/기본 계층으로 설정할 수 있는 SKU 식별
2. 최소 비용을 위한 환경 변수 구성
3. 배포 후 프로덕션 구성과 비용 비교

**해결 힌트:**
- 가능한 경우 Cognitive Services에 F0(무료) 계층 사용
- 개발에서 Search Service에 기본 계층 사용
- Functions에 소비 계획 사용 고려

## 모듈 4: 보안 및 프로덕션 모범 사례

### 4.1단계: 자격 증명 관리 보안

**현재 문제**: 많은 AI 앱이 API 키를 하드코딩하거나 안전하지 않은 저장소를 사용.

**AZD 솔루션**: Managed Identity + Key Vault 통합.

1. **템플릿의 보안 구성 검토:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity 작동 확인:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### 4.2단계: 네트워크 보안

1. **프라이빗 엔드포인트 활성화** (이미 구성되지 않은 경우):

bicep 템플릿에 추가:
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


### 4.3단계: 모니터링 및 관찰 가능성

1. **Application Insights 구성:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI 전용 모니터링 설정:**

AI 작업에 대한 사용자 정의 메트릭 추가:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```


### **실습 4.1: 보안 감사**

**작업**: 배포를 보안 모범 사례에 대해 검토.

**체크리스트:**
- [ ] 코드 또는 구성에 하드코딩된 비밀 없음
- [ ] 서비스 간 인증에 Managed Identity 사용
- [ ] Key Vault에 민감한 구성 저장
- [ ] 네트워크 액세스가 적절히 제한됨
- [ ] 모니터링 및 로깅 활성화됨

## 모듈 5: 자체 AI 애플리케이션 변환

### 5.1단계: 평가 워크시트

**앱을 변환하기 전에**, 다음 질문에 답하세요:

1. **애플리케이션 아키텍처:**
   - 앱이 사용하는 AI 서비스는 무엇인가요?
   - 필요한 컴퓨팅 리소스는 무엇인가요?
   - 데이터베이스가 필요한가요?
   - 서비스 간 종속성은 무엇인가요?

2. **보안 요구사항:**
   - 앱이 처리하는 민감한 데이터는 무엇인가요?
   - 준수해야 할 규정은 무엇인가요?
   - 프라이빗 네트워킹이 필요한가요?

3. **확장 요구사항:**
   - 예상되는 부하는 무엇인가요?
   - 자동 확장이 필요한가요?
   - 지역별 요구사항이 있나요?

### 5.2단계: AZD 템플릿 생성

**앱을 변환하려면 다음 패턴을 따르세요:**

1. **기본 구조 생성:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```


### **실습 5.1: 템플릿 생성 도전 과제**

**도전 과제**: 문서 처리 AI 앱을 위한 AZD 템플릿 생성.

**요구사항:**
- 콘텐츠 분석을 위한 Azure OpenAI
- OCR을 위한 Document Intelligence
- 문서 업로드를 위한 Storage Account
- 처리 로직을 위한 Function App
- 사용자 인터페이스를 위한 웹 앱

**추가 점수:**
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

# Request quota increase or try different region
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
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### 문제 3: 권한 문제
**증상:** AI 서비스 호출 시 403 Forbidden 오류
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
1. Application Insights에서 성능 메트릭 확인
2. Azure 포털에서 OpenAI 서비스 메트릭 검토
3. 네트워크 연결 및 지연 시간 확인

**해결책:**
- 일반적인 쿼리에 대한 캐싱 구현
- 사용 사례에 적합한 OpenAI 모델 사용
- 고부하 시 읽기 복제본 고려

### **실습 6.1: 디버깅 도전 과제**

**시나리오**: 배포는 성공했지만 애플리케이션이 500 오류를 반환.

**디버깅 작업:**
1. 애플리케이션 로그 확인
2. 서비스 연결 확인
3. 인증 테스트
4. 구성 검토

**사용할 도구:**
- `azd show`로 배포 개요 확인
- Azure 포털에서 상세 서비스 로그 확인
- Application Insights에서 애플리케이션 텔레메트리 확인

## 모듈 7: 모니터링 및 최적화

### 7.1단계: 종합적인 모니터링 설정

1. **사용자 정의 대시보드 생성:**

Azure 포털로 이동하여 다음을 포함한 대시보드 생성:
- OpenAI 요청 수 및 지연 시간
- 애플리케이션 오류율
- 리소스 사용량
- 비용 추적

2. **알림 설정:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```


### 7.2단계: 비용 최적화

1. **현재 비용 분석:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **비용 통제 구현:**
- 예산 알림 설정
- 자동 확장 정책 사용
- 요청 캐싱 구현
- OpenAI 토큰 사용량 모니터링

### **실습 7.1: 성능 최적화**

**작업**: 성능과 비용 모두를 최적화하도록 AI 애플리케이션을 개선.

**개선할 메트릭:**
- 평균 응답 시간을 20% 줄이기
- 월간 비용을 15% 줄이기
- 99.9% 가동 시간 유지

**시도할 전략:**
- 응답 캐싱 구현
- 토큰 효율성을 위한 프롬프트 최적화
- 적합한 컴퓨팅 SKU 사용
- 적절한 자동 확장 설정

## 최종 도전 과제: 엔드 투 엔드 구현

### 도전 시나리오

다음 요구사항을 가진 프로덕션 준비 AI 기반 고객 서비스 챗봇을 생성하세요:

**기능 요구사항:**
- 고객 상호작용을 위한 웹 인터페이스
- 응답을 위한 Azure OpenAI 통합
- Cognitive Search를 사용한 문서 검색 기능
- 기존 고객 데이터베이스와 통합
- 다국어 지원

**비기능 요구사항:**
- 1000명의 동시 사용자 처리
- 99.9% 가동 시간 SLA
- SOC 2 준수
- 월 비용 $500 이하
- 여러 환경(개발, 스테이징, 프로덕션)으로 배포

### 구현 단계

1. **아키텍처 설계**
2. **AZD 템플릿 생성**
3. **보안 조치 구현**
4. **모니터링 및 알림 설정**
5. **배포 파이프라인 생성**
6. **솔루션 문서화**

### 평가 기준

- ✅ **기능성**: 모든 요구사항을 충족하는가?
- ✅ **보안**: 모범 사례가 구현되었는가?
- ✅ **확장성**: 부하를 처리할 수 있는가?
- ✅ **유지관리성**: 코드와 인프라가 잘 조직되어 있는가?
- ✅ **비용**: 예산 내에서 유지되는가?

## 추가 자료

### Microsoft 문서
- [Azure Developer CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI 서비스 문서](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry 문서](https://learn.microsoft.com/azure/ai-studio/)

### 샘플 템플릿
- [Azure OpenAI 채팅 앱](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 채팅 앱 빠른 시작](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso 채팅](https://github.com/Azure-Samples/contoso-chat)

### 커뮤니티 자료
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 완료 인증서
축하합니다! AI 워크숍 실습을 완료하셨습니다. 이제 다음을 수행할 수 있습니다:

- ✅ 기존 AI 애플리케이션을 AZD 템플릿으로 변환
- ✅ 프로덕션 준비가 완료된 AI 애플리케이션 배포
- ✅ AI 워크로드에 대한 보안 모범 사례 구현
- ✅ AI 애플리케이션 성능 모니터링 및 최적화
- ✅ 일반적인 배포 문제 해결

### 다음 단계
1. 이러한 패턴을 자신의 AI 프로젝트에 적용하세요
2. 템플릿을 커뮤니티에 기여하세요
3. 지속적인 지원을 위해 Azure AI Foundry Discord에 참여하세요
4. 다중 지역 배포와 같은 고급 주제를 탐구하세요

---

**워크숍 피드백**: [Azure AI Foundry Discord #Azure 채널](https://discord.gg/microsoft-azure)에서 경험을 공유하여 워크숍 개선에 도움을 주세요.

---

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI 우선 개발
- **⬅️ 이전**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ 다음**: [프로덕션 AI 모범 사례](production-ai-practices.md)
- **🚀 다음 챕터**: [챕터 3: 구성](../getting-started/configuration.md)

**도움이 필요하신가요?** AZD 및 AI 배포에 대한 지원과 논의를 위해 커뮤니티에 참여하세요.

---

