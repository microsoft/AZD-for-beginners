# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD 초보자용](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

이 실습 랩은 기존 AI 템플릿을 가져와 Azure Developer CLI (AZD)를 사용해 배포하는 과정을 개발자에게 안내합니다. Microsoft Foundry 서비스 를 사용한 프로덕션 AI 배포를 위한 필수 패턴을 배우게 됩니다.

> **검증 메모 (2026-03-25):** 이 워크숍은 `azd` `1.23.12` 기준으로 검토되었습니다. 로컬 설치 버전이 더 낮으면 시작하기 전에 AZD를 업데이트하여 인증, 템플릿 및 배포 워크플로가 아래 단계와 일치하도록 하세요.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** 기본적인 Azure 지식, AI/ML 개념에 대한 친숙도

## 🎓 Learning Objectives

By the end of this workshop, you will be able to:
- ✅ 기존 AI 애플리케이션을 AZD 템플릿으로 변환하기
- ✅ AZD로 Microsoft Foundry 서비스 구성하기
- ✅ AI 서비스에 대한 안전한 자격 증명 관리 구현하기
- ✅ 모니터링이 포함된 프로덕션 준비 AI 애플리케이션 배포하기
- ✅ 일반적인 AI 배포 문제 해결하기

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 설치됨
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 설치됨
- [Git](https://git-scm.com/) 설치됨
- 코드 편집기 (VS Code 권장)

### Azure Resources
- 기여자(contributor) 권한이 있는 Azure 구독
- Microsoft Foundry Models 서비스에 대한 접근 권한(또는 접근 요청 가능)
- 리소스 그룹 생성 권한

### Knowledge Prerequisites
- Azure 서비스에 대한 기본 이해
- 명령줄 인터페이스에 대한 친숙도
- 기본 AI/ML 개념(API, 모델, 프롬프트)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD 설치 확인
azd version

# Azure CLI 확인
az --version

# AZD 워크플로우를 위해 Azure에 로그인
azd auth login

# 진단 중 az 명령을 실행할 계획이 있는 경우에만 Azure CLI에 로그인하세요
az login
```

여러 테넌트에서 작업하거나 구독이 자동으로 감지되지 않는 경우 `azd auth login --tenant-id <tenant-id>`로 다시 시도하세요.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI 준비된 AZD 템플릿의 주요 파일을 살펴보세요:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- AI 구성 요소에 대한 서비스 정의
- 환경 변수 매핑
- 호스트 구성

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Microsoft Foundry Models 서비스 프로비저닝
- Cognitive Search 통합
- 안전한 키 관리
- 네트워크 보안 구성

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI 앱은 종종 여러 조정된 서비스가 필요합니다
- **Security**: API 키와 엔드포인트는 안전하게 관리되어야 합니다
- **Scalability**: AI 워크로드는 고유한 확장 요구사항이 있습니다
- **Cost Management**: AI 서비스는 적절히 구성되지 않으면 비용이 많이 들 수 있습니다

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# 선호하는 Azure 리전을 설정하세요
azd env set AZURE_LOCATION eastus

# 선택 사항: 특정 OpenAI 모델을 설정하세요
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Microsoft Foundry Models 서비스 프로비저닝
- ✅ Cognitive Search 서비스 생성
- ✅ 웹 애플리케이션을 위한 App Service 설정
- ✅ 네트워킹 및 보안 구성
- ✅ 애플리케이션 코드 배포
- ✅ 모니터링 및 로깅 설정

2. **Monitor the deployment progress** 및 생성되는 리소스를 확인하세요.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

`azd show` 출력에 표시된 웹 엔드포인트를 엽니다.

3. **Test the AI functionality:**
   - 웹 애플리케이션으로 이동
   - 샘플 쿼리 시도
   - AI 응답이 정상적으로 작동하는지 확인

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: 배포는 성공했지만 AI가 응답하지 않습니다.

**Common issues to check:**
1. **OpenAI API keys**: 올바르게 설정되었는지 확인
2. **Model availability**: 지역에서 모델을 지원하는지 확인
3. **Network connectivity**: 서비스 간 통신이 가능한지 확인
4. **RBAC permissions**: 애플리케이션이 OpenAI에 액세스할 수 있는지 확인

**Debugging commands:**
```bash
# 환경 변수 확인
azd env get-values

# 배포 로그 보기
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI 배포 상태 확인
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# 다른 모델로 변경하세요(해당 지역에서 사용 가능한 경우)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 새 구성으로 재배포하세요
azd deploy
```

2. **Add additional AI services:**

`infra/main.bicep`을 편집하여 Document Intelligence를 추가하세요:

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: 개발과 프로덕션에 대해 서로 다른 구성을 사용하세요.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# 운영 환경에서는 일반적으로 더 높은 SKU를 사용합니다.
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 추가 보안 기능을 활성화합니다.
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: 개발에 비용 효율적인 템플릿으로 구성하세요.

**Tasks:**
1. 무료/기본 계층으로 설정할 수 있는 SKU 식별
2. 최소 비용을 위한 환경 변수 구성
3. 배포 후 프로덕션 구성과 비용 비교

**Solution hints:**
- 가능한 경우 Cognitive Services에 F0(무료) 계층 사용
- 개발 환경에서는 Search Service에 Basic 계층 사용
- Functions에는 Consumption 플랜 고려

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: 많은 AI 앱이 API 키를 하드코딩하거나 안전하지 않은 저장소를 사용합니다.

**AZD Solution**: Managed Identity + Key Vault 통합.

1. **Review the security configuration in your template:**
```bash
# Key Vault 및 관리형 ID 구성을 확인하세요
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# 웹 앱이 올바른 아이덴티티 구성을 가지고 있는지 확인하세요.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (이미 구성되어 있지 않은 경우):

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

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights는 자동으로 구성되어야 합니다
# 구성을 확인하세요:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

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

### **Lab Exercise 4.1: Security Audit**

**Task**: 배포를 보안 모범 사례에 따라 검토하세요.

**Checklist:**
- [ ] 코드나 구성에 하드코딩된 비밀이 없음
- [ ] 서비스 간 인증에 Managed Identity 사용
- [ ] Key Vault가 민감한 구성을 저장
- [ ] 네트워크 액세스가 적절히 제한됨
- [ ] 모니터링 및 로깅이 활성화됨

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, 다음 질문에 답하세요:

1. **Application Architecture:**
   - 애플리케이션이 사용하는 AI 서비스는 무엇인가요?
   - 필요한 컴퓨트 리소스는 무엇인가요?
   - 데이터베이스가 필요한가요?
   - 서비스 간의 종속성은 무엇인가요?

2. **Security Requirements:**
   - 애플리케이션이 처리하는 민감한 데이터는 무엇인가요?
   - 준수해야 할 컴플라이언스 요건은 무엇인가요?
   - 프라이빗 네트워킹이 필요한가요?

3. **Scaling Requirements:**
   - 예상 부하는 어떻게 되나요?
   - 자동 확장이 필요한가요?
   - 지역별 요구사항이 있나요?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD 템플릿 초기화
azd init --template minimal
```

2. **Create azure.yaml:**
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

3. **Create infrastructure templates:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: 문서 처리 AI 앱을 위한 AZD 템플릿을 만드세요.

**Requirements:**
- 콘텐츠 분석을 위한 Microsoft Foundry Models
- OCR을 위한 Document Intelligence
- 문서 업로드를 위한 Storage Account
- 처리 로직을 위한 Function App
- 사용자 인터페이스를 위한 웹 앱

**Bonus points:**
- 적절한 오류 처리 추가
- 비용 추정 포함
- 모니터링 대시보드 설정

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** 할당량 오류로 배포 실패
**Solutions:**
```bash
# 현재 쿼터를 확인하세요
az cognitiveservices usage list --location eastus

# 쿼터 증가를 요청하거나 다른 리전을 시도하세요
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI 응답 실패 또는 모델 배포 오류
**Solutions:**
```bash
# 지역별 모델 가용성 확인
az cognitiveservices model list --location eastus

# 사용 가능한 모델로 업데이트
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** AI 서비스 호출 시 403 Forbidden 오류
**Solutions:**
```bash
# 역할 할당 확인
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 누락된 역할 추가
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Application Insights에서 성능 메트릭 확인
2. Azure 포털에서 OpenAI 서비스 메트릭 검토
3. 네트워크 연결 및 지연 시간 확인

**Solutions:**
- 공통 쿼리에 대해 캐싱 구현
- 사용 사례에 적합한 OpenAI 모델 사용
- 고부하 시나리오에 대해 읽기 복제본 고려

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: 배포는 성공했지만 애플리케이션이 500 오류를 반환합니다.

**Debugging tasks:**
1. 애플리케이션 로그 확인
2. 서비스 연결성 확인
3. 인증 테스트
4. 구성 검토

**Tools to use:**
- 배포 개요용 `azd show`
- 상세 서비스 로그용 Azure 포털
- 애플리케이션 텔레메트리용 Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure 포털로 이동하여 다음을 포함한 대시보드를 만드세요:
- OpenAI 요청 수 및 지연 시간
- 애플리케이션 오류율
- 리소스 사용률
- 비용 추적

2. **Set up alerts:**
```bash
# 높은 오류율에 대한 경고
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Azure CLI를 사용하여 비용 데이터를 가져옵니다.
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- 예산 경고 설정
- 자동 확장 정책 사용
- 요청 캐싱 구현
- OpenAI의 토큰 사용량 모니터링

### **Lab Exercise 7.1: Performance Optimization**

**Task**: 성능과 비용 모두에 대해 AI 애플리케이션을 최적화하세요.

**Metrics to improve:**
- 평균 응답 시간 20% 감소
- 월간 비용 15% 감소
- 99.9% 가동 시간 유지

**Strategies to try:**
- 응답 캐싱 구현
- 토큰 효율성을 위한 프롬프트 최적화
- 적절한 컴퓨트 SKU 사용
- 적절한 자동 확장 설정

## Final Challenge: End-to-End Implementation

### Challenge Scenario

프로덕션 준비가 된 AI 기반 고객 서비스 챗봇을 만드는 과제가 주어졌습니다. 요구사항은 다음과 같습니다:

**Functional Requirements:**
- 고객 상호작용을 위한 웹 인터페이스
- 응답을 위한 Microsoft Foundry Models 통합
- Cognitive Search를 사용한 문서 검색 기능
- 기존 고객 데이터베이스와의 통합
- 다국어 지원

**Non-Functional Requirements:**
- 동시 사용자 1000명 처리
- 99.9% 가동 시간 SLA
- SOC 2 준수
- 월 비용 $500 이하
- 여러 환경(dev, staging, prod)으로 배포

### Implementation Steps

1. 아키텍처 설계
2. AZD 템플릿 생성
3. 보안 조치 구현
4. 모니터링 및 경고 설정
5. 배포 파이프라인 생성
6. 솔루션 문서화

### Evaluation Criteria

- ✅ **Functionality**: 모든 요구사항을 충족하는가?
- ✅ **Security**: 모범 사례가 구현되었는가?
- ✅ **Scalability**: 부하를 처리할 수 있는가?
- ✅ **Maintainability**: 코드와 인프라가 잘 정리되어 있는가?
- ✅ **Cost**: 예산 내에 있는가?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models 채팅 앱](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 채팅 앱 빠른 시작](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso 채팅](https://github.com/Azure-Samples/contoso-chat)

### 커뮤니티 리소스
- [Microsoft Foundry 디스코드](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD 템플릿](https://azure.github.io/awesome-azd/)

## 🎓 수료 증명서

축하합니다! AI 워크숍 실습을 완료했습니다. 이제 다음을 할 수 있어야 합니다:

- ✅ 기존 AI 애플리케이션을 AZD 템플릿으로 변환하기
- ✅ 운영 환경에 적합한 AI 애플리케이션 배포하기
- ✅ AI 워크로드에 대한 보안 모범 사례 적용하기
- ✅ AI 애플리케이션 성능 모니터링 및 최적화하기
- ✅ 일반적인 배포 문제 해결하기

### 다음 단계
1. 이 패턴들을 본인의 AI 프로젝트에 적용하세요
2. 템플릿을 커뮤니티에 기여하기
3. 지속적인 지원을 위해 Microsoft Foundry Discord에 참여하세요
4. 다중 리전 배포와 같은 고급 주제 탐색하기

---

**Workshop Feedback**: 이 워크숍을 개선할 수 있도록 [Microsoft Foundry Discord #Azure 채널](https://discord.gg/microsoft-azure)에서 경험을 공유해 주세요.

---

**챕터 탐색:**
- **📚 Course Home**: [초보자를 위한 AZD](../../README.md)
- **📖 Current Chapter**: 챕터 2 - AI 우선 개발
- **⬅️ Previous**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ Next**: [프로덕션 AI 모범 사례](production-ai-practices.md)
- **🚀 Next Chapter**: [챕터 3: 구성](../chapter-03-configuration/configuration.md)

**도움이 필요하신가요?** AZD 및 AI 배포에 대한 지원과 토론을 위해 커뮤니티에 참여하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만, 자동 번역은 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문(원어) 문서를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->