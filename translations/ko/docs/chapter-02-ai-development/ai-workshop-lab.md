# AI 워크숍 실습: AI 솔루션을 AZD로 배포 가능하게 만들기

**챕터 탐색:**
- **📚 코스 홈**: [AZD For Beginners](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI 우선 개발
- **⬅️ 이전**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ 다음**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 다음 챕터**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## 워크숍 개요

이 핸즈온 랩은 기존 AI 템플릿을 가져와 Azure Developer CLI(AZD)를 사용해 배포하는 과정을 개발자에게 안내합니다. Microsoft Foundry 서비스를 사용한 프로덕션 AI 배포를 위한 필수 패턴을 학습합니다.

**소요 시간:** 2-3 시간  
**난이도:** 중급  
**사전 요구 사항:** 기본 Azure 지식, AI/ML 개념에 대한 익숙함

## 🎓 학습 목표

이 워크숍을 마치면 다음을 할 수 있습니다:
- ✅ 기존 AI 애플리케이션을 AZD 템플릿을 사용하도록 전환
- ✅ AZD로 Microsoft Foundry 서비스 구성
- ✅ AI 서비스에 대한 안전한 자격 증명 관리 구현
- ✅ 모니터링이 포함된 프로덕션 준비된 AI 애플리케이션 배포
- ✅ 일반적인 AI 배포 문제 해결

## 사전 준비

### 필수 도구
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 설치됨
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 설치됨
- [Git](https://git-scm.com/) 설치됨
- 코드 편집기 (VS Code 권장)

### Azure 리소스
- 기여자(contributor) 권한이 있는 Azure 구독
- Azure OpenAI 서비스 접근 권한(또는 접근 요청 가능)
- 리소스 그룹 생성 권한

### 지식 사전 요구 사항
- Azure 서비스에 대한 기본 이해
- 명령줄 인터페이스에 익숙함
- 기본 AI/ML 개념 (API, 모델, 프롬프트)

## 랩 설정

### 1단계: 환경 준비

1. **도구 설치 확인:**
```bash
# AZD 설치 확인
azd version

# Azure CLI 확인
az --version

# Azure에 로그인
az login
azd auth login
```

2. **워크숍 저장소 복제:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 모듈 1: AI 애플리케이션을 위한 AZD 구조 이해

### AI용 AZD 템플릿의 구성 요소

AI 준비가 된 AZD 템플릿의 주요 파일을 살펴보세요:

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

### **실습 1.1: 구성 탐색**

1. **azure.yaml 파일 검토:**
```bash
cat azure.yaml
```

**찾아볼 항목:**
- AI 구성 요소에 대한 서비스 정의
- 환경 변수 매핑
- 호스트 구성

2. **main.bicep 인프라 검토:**
```bash
cat infra/main.bicep
```

**식별할 주요 AI 패턴:**
- Azure OpenAI 서비스 프로비저닝
- Cognitive Search 통합
- 안전한 키 관리
- 네트워크 보안 구성

### **토론 주제:** 이러한 패턴이 AI에 중요한 이유

- **서비스 종속성**: AI 앱은 종종 여러 개의 연동된 서비스를 필요로 합니다
- **보안**: API 키와 엔드포인트는 안전하게 관리되어야 합니다
- **확장성**: AI 워크로드는 고유한 확장 요구사항이 있습니다
- **비용 관리**: AI 서비스는 적절히 구성되지 않으면 비용이 많이 들 수 있습니다

## 모듈 2: 첫 번째 AI 애플리케이션 배포

### 2.1단계: 환경 초기화

1. **새 AZD 환경 생성:**
```bash
azd env new myai-workshop
```

2. **필수 매개변수 설정:**
```bash
# 선호하는 Azure 지역을 설정하세요
azd env set AZURE_LOCATION eastus

# 선택 사항: 특정 OpenAI 모델을 설정하세요
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 2.2단계: 인프라 및 애플리케이션 배포

1. **AZD로 배포:**
```bash
azd up
```

**`azd up` 동안 발생하는 일:**
- ✅ Azure OpenAI 서비스 프로비저닝
- ✅ Cognitive Search 서비스 생성
- ✅ 웹 애플리케이션용 App Service 설정
- ✅ 네트워킹 및 보안 구성
- ✅ 애플리케이션 코드 배포
- ✅ 모니터링 및 로깅 설정

2. **배포 진행 상황 모니터링** 및 생성되는 리소스 확인.

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
   - AI 응답이 정상적으로 작동하는지 확인

### **실습 2.1: 문제 해결 연습**

**시나리오**: 배포는 성공했지만 AI가 응답하지 않습니다.

**확인할 일반적인 문제:**
1. **OpenAI API 키**: 올바르게 설정되었는지 확인
2. **모델 사용 가능성**: 해당 리전에서 모델을 지원하는지 확인
3. **네트워크 연결성**: 서비스들이 통신할 수 있는지 확인
4. **RBAC 권한**: 앱이 OpenAI에 접근할 수 있는지 확인

**디버깅 명령:**
```bash
# 환경 변수 확인
azd env get-values

# 배포 로그 보기
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI 배포 상태 확인
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 모듈 3: 필요에 맞게 AI 애플리케이션 사용자화

### 3.1단계: AI 구성 수정

1. **OpenAI 모델 업데이트:**
```bash
# 다른 모델로 변경하세요 (해당 지역에서 이용 가능한 경우)
azd env set AZURE_OPENAI_MODEL gpt-4

# 새 구성으로 재배포하세요
azd deploy
```

2. **추가 AI 서비스 추가:**

문서 인텔리전스를 추가하려면 `infra/main.bicep`을(를) 편집하세요:

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

**모범 사례**: 개발과 프로덕션에 대해 서로 다른 구성을 사용하세요.

1. **프로덕션 환경 생성:**
```bash
azd env new myai-production
```

2. **프로덕션 전용 매개변수 설정:**
```bash
# 운영 환경에서는 일반적으로 더 높은 SKU를 사용합니다
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 추가 보안 기능을 활성화합니다
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **실습 3.1: 비용 최적화**

**과제**: 비용 효율적인 개발을 위해 템플릿 구성.

**작업:**
1. 어떤 SKU를 무료/기본 등급으로 설정할 수 있는지 식별
2. 최소 비용을 위한 환경 변수 구성
3. 배포하고 프로덕션 구성과 비용 비교

**해결 힌트:**
- 가능하면 Cognitive Services에 F0(무료) 티어 사용
- 개발에서는 Search Service에 Basic 티어 사용
- Functions에는 Consumption 계획 사용 고려

## 모듈 4: 보안 및 프로덕션 모범 사례

### 4.1단계: 안전한 자격 증명 관리

**현재 문제**: 많은 AI 앱이 API 키를 하드코딩하거나 안전하지 않은 저장소를 사용합니다.

**AZD 솔루션**: Managed Identity + Key Vault 통합.

1. **템플릿의 보안 구성을 검토:**
```bash
# Key Vault 및 Managed Identity 구성 확인
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity가 작동하는지 확인:**
```bash
# 웹 앱에 올바른 아이덴티티 구성이 있는지 확인
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2단계: 네트워크 보안

1. **프라이빗 엔드포인트 활성화** (이미 구성되어 있지 않은 경우):

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

### 4.3단계: 모니터링 및 관찰성

1. **Application Insights 구성:**
```bash
# Application Insights는 자동으로 구성되어야 합니다
# 구성을 확인하세요:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI 전용 모니터링 설정:**

AI 작업을 위한 사용자 지정 메트릭 추가:
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

**작업**: 보안 모범 사례에 따라 배포를 검토하세요.

**체크리스트:**
- [ ] 코드나 구성에 하드코딩된 비밀 없음
- [ ] 서비스 간 인증에 Managed Identity 사용
- [ ] Key Vault에 민감한 구성 저장
- [ ] 네트워크 접근이 적절히 제한됨
- [ ] 모니터링 및 로깅이 활성화됨

## 모듈 5: 자체 AI 애플리케이션 변환

### 5.1단계: 평가 워크시트

**애플리케이션을 변환하기 전에**, 다음 질문에 답하세요:

1. 애플리케이션 아키텍처:
   - 애플리케이션이 사용하는 AI 서비스는 무엇인가요?
   - 필요한 컴퓨팅 리소스는 무엇인가요?
   - 데이터베이스가 필요한가요?
   - 서비스 간 의존 관계는 무엇인가요?

2. 보안 요구 사항:
   - 애플리케이션이 처리하는 민감한 데이터는 무엇인가요?
   - 필요한 컴플라이언스 요구 사항은 무엇인가요?
   - 프라이빗 네트워킹이 필요한가요?

3. 확장 요구 사항:
   - 예상되는 부하는 어느 정도인가요?
   - 자동 확장이 필요한가요?
   - 지역적(리전) 요구 사항이 있나요?

### 5.2단계: AZD 템플릿 생성

**애플리케이션을 변환하려면 다음 패턴을 따르세요:**

1. **기본 구조 생성:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD 템플릿 초기화
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

3. **인프라스트럭처 템플릿 생성:**

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

### **실습 5.1: 템플릿 생성 과제**

**과제**: 문서 처리 AI 앱을 위한 AZD 템플릿을 작성하세요.

**요구 사항:**
- 콘텐츠 분석을 위한 Azure OpenAI
- OCR을 위한 Document Intelligence
- 문서 업로드를 위한 Storage Account
- 처리 로직을 위한 Function App
- 사용자 인터페이스를 위한 웹 앱

**보너스 점수:**
- 적절한 오류 처리 추가
- 비용 추정 포함
- 모니터링 대시보드 설정

## 모듈 6: 일반적인 문제 해결

### 일반적인 배포 문제

#### 문제 1: OpenAI 서비스 할당량 초과
**증상:** 할당량 오류로 배포 실패
**해결 방법:**
```bash
# 현재 할당량 확인
az cognitiveservices usage list --location eastus

# 할당량 증가 요청 또는 다른 리전 시도
azd env set AZURE_LOCATION westus2
azd up
```

#### 문제 2: 리전에서 모델을 사용할 수 없음
**증상:** AI 응답 실패 또는 모델 배포 오류
**해결 방법:**
```bash
# 지역별 모델 가용성 확인
az cognitiveservices model list --location eastus

# 사용 가능한 모델로 업데이트
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 문제 3: 권한 문제
**증상:** AI 서비스 호출 시 403 Forbidden 오류
**해결 방법:**
```bash
# 역할 할당 확인
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 누락된 역할 추가
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
3. 네트워크 연결성 및 지연 시간 확인

**해결 방법:**
- 일반 쿼리에 대한 캐싱 구현
- 사용 사례에 적합한 OpenAI 모델 사용
- 고부하 시나리오에 대해 읽기 전용 복제본 고려

### **실습 6.1: 디버깅 과제**

**시나리오**: 배포는 성공했지만 애플리케이션이 500 오류를 반환합니다.

**디버깅 작업:**
1. 애플리케이션 로그 확인
2. 서비스 연결성 확인
3. 인증 테스트
4. 구성 검토

**사용할 도구:**
- 배포 개요용 `azd show`
- 자세한 서비스 로그용 Azure 포털
- 애플리케이션 텔레메트리를 위한 Application Insights

## 모듈 7: 모니터링 및 최적화

### 7.1단계: 종합 모니터링 설정

1. **사용자 지정 대시보드 생성:**

Azure 포털로 이동하여 다음 항목이 포함된 대시보드를 생성하세요:
- OpenAI 요청 수 및 지연 시간
- 애플리케이션 오류율
- 리소스 사용량
- 비용 추적

2. **경고 설정:**
```bash
# 높은 오류율 경고
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
# Azure CLI를 사용하여 비용 데이터를 가져옵니다
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **비용 통제 구현:**
- 예산 경고 설정
- 자동 확장 정책 사용
- 요청 캐싱 구현
- OpenAI 토큰 사용량 모니터링

### **실습 7.1: 성능 최적화**

**작업**: 성능과 비용 모두를 위해 AI 애플리케이션을 최적화하세요.

**개선해야 할 메트릭:**
- 평균 응답 시간을 20% 줄이기
- 월별 비용을 15% 절감
- 99.9% 가동 시간 유지

**시도해볼 전략:**
- 응답 캐싱 구현
- 토큰 효율성을 위해 프롬프트 최적화
- 적절한 컴퓨트 SKU 사용
- 적절한 자동 확장 설정

## 최종 과제: 엔드투엔드 구현

### 과제 시나리오

다음 요구 사항을 갖춘 프로덕션 준비된 AI 기반 고객 서비스 챗봇을 만드는 임무를 맡았습니다:

**기능 요구 사항:**
- 고객 상호작용을 위한 웹 인터페이스
- 응답을 위한 Azure OpenAI 통합
- Cognitive Search를 사용한 문서 검색 기능
- 기존 고객 데이터베이스와 통합
- 다국어 지원

**비기능적 요구 사항:**
- 동시 사용자 1000명 처리
- 99.9% 가동 시간 SLA
- SOC 2 준수
- 월 비용 $500 미만
- 여러 환경으로 배포 (dev, staging, prod)

### 구현 단계

1. **아키텍처 설계**
2. **AZD 템플릿 생성**
3. **보안 조치 구현**
4. **모니터링 및 경고 설정**
5. **배포 파이프라인 생성**
6. **솔루션 문서화**

### 평가 기준

- ✅ **기능성**: 모든 요구 사항을 충족하나요?
- ✅ **보안**: 모범 사례가 구현되었나요?
- ✅ **확장성**: 부하를 처리할 수 있나요?
- ✅ **유지보수성**: 코드와 인프라가 잘 정리되어 있나요?
- ✅ **비용**: 예산 내에 있나요?

## 추가 리소스

### Microsoft 문서
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### 샘플 템플릿
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 커뮤니티 리소스
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 수료증
축하합니다! AI 워크숍 랩을 완료하셨습니다. 이제 다음을 수행할 수 있어야 합니다:

- ✅ 기존 AI 애플리케이션을 AZD 템플릿으로 변환
- ✅ 프로덕션 준비된 AI 애플리케이션 배포
- ✅ AI 워크로드에 대한 보안 모범 사례 구현
- ✅ AI 애플리케이션 성능 모니터링 및 최적화
- ✅ 일반적인 배포 문제 해결

### 다음 단계
1. 이러한 패턴을 본인의 AI 프로젝트에 적용하기
2. 템플릿을 커뮤니티에 기여하기
3. 지속적인 지원을 위해 Microsoft Foundry Discord에 참여하기
4. 다중 지역 배포와 같은 고급 주제 탐색하기

---

**워크숍 피드백**: 이 워크숍을 개선할 수 있도록 경험을 [Microsoft Foundry Discord #Azure 채널](https://discord.gg/microsoft-azure)에서 공유해 주세요.

---

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI-우선 개발
- **⬅️ 이전**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ 다음**: [프로덕션 AI 모범 사례](production-ai-practices.md)
- **🚀 다음 챕터**: [챕터 3: 구성](../chapter-03-configuration/configuration.md)

도움이 필요하신가요? AZD 및 AI 배포에 대한 지원과 토론을 위해 커뮤니티에 참여하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 고지:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역은 오류나 부정확성이 있을 수 있음을 유의해 주십시오. 원문(원어) 문서를 최종적인 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우에는 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->