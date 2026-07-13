# AI 워크숍 랩: AI 솔루션의 AZD 배포 가능하게 만들기

**챕터 내비게이션:**
- **📚 강의 홈**: [AZD 초보자 가이드](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI 우선 개발
- **⬅️ 이전**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ 다음**: [프로덕션 AI 모범 사례](production-ai-practices.md)
- **🚀 다음 챕터**: [챕터 3: 구성 설정](../chapter-03-configuration/configuration.md)

## 워크숍 개요

이 실습 랩은 개발자가 기존 AI 템플릿을 Azure Developer CLI (AZD)를 사용해 배포하는 과정을 안내합니다. Microsoft Foundry 서비스를 활용한 프로덕션 AI 배포의 필수 패턴을 배우게 됩니다.

> **검증 주의사항 (2026-07-13):** 이 워크숍은 `azd` `1.27.1` 버전을 기준으로 검토되었습니다. 로컬 설치 버전이 더 오래된 경우, 아래 단계의 인증, 템플릿 및 배포 흐름 일치를 위해 AZD를 업데이트한 후 시작하세요.

**소요 시간:** 2-3 시간  
**난이도:** 중급  
**사전 지식:** 기본 Azure 지식, AI/ML 개념 익숙함

## 🎓 학습 목표

이 워크숍 완료 후, 다음을 할 수 있게 됩니다:
- ✅ 기존 AI 애플리케이션을 AZD 템플릿으로 변환
- ✅ AZD로 Microsoft Foundry 서비스 구성
- ✅ AI 서비스용 안전한 자격 증명 관리 구현
- ✅ 모니터링을 갖춘 프로덕션 준비 AI 애플리케이션 배포
- ✅ 일반적인 AI 배포 문제 해결

## 사전 준비

### 필요 도구
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 설치
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 설치
- [Git](https://git-scm.com/) 설치
- 코드 편집기 (VS Code 권장)

### Azure 리소스
- 기여자 권한이 있는 Azure 구독
- Microsoft Foundry Models 서비스 접근 권한 (또는 요청 가능한 권한)
- 리소스 그룹 생성 권한

### 지식 사전 조건
- Azure 서비스 기본 이해
- 명령줄 인터페이스에 익숙함
- AI/ML 기본 개념 (API, 모델, 프롬프트)

## 실습 환경 설정

### 1단계: 환경 준비

1. **도구 설치 확인:**
```bash
# AZD 설치 확인
azd version

# Azure CLI 확인
az --version

# AZD 워크플로우를 위한 Azure 로그인
azd auth login

# 진단 중에 az 명령어를 실행할 계획이 있는 경우에만 Azure CLI 로그인
az login
```

여러 테넌트에서 작업하거나 구독이 자동으로 인식되지 않는 경우, `azd auth login --tenant-id <tenant-id>`를 사용해 다시 로그인하세요.

2. **워크숍 저장소 클론:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 모듈 1: AI 애플리케이션을 위한 AZD 구조 이해

### AI AZD 템플릿 구성요소 해부

AI 준비된 AZD 템플릿 주요 파일 탐색:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
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

**주목할 점:**
- AI 구성 요소용 서비스 정의
- 환경 변수 매핑
- 호스트 구성

2. **main.bicep 인프라 검토:**
```bash
cat infra/main.bicep
```

**확인할 주요 AI 패턴:**
- Microsoft Foundry Models 서비스 프로비저닝
- Azure AI 검색 통합
- 보안 키 관리
- 네트워크 보안 구성

### **토론 포인트:** AI에 이 패턴이 중요한 이유

- **서비스 의존성**: AI 앱은 여러 조율된 서비스 필요
- <strong>보안</strong>: API 키와 엔드포인트를 안전하게 관리해야 함
- <strong>확장성</strong>: AI 작업 부하는 독특한 확장 요구 사항
- **비용 관리**: 적절히 구성하지 않으면 AI 서비스 비용 증가 가능

## 모듈 2: 첫 AI 애플리케이션 배포

### 2.1단계: 환경 초기화

1. **새 AZD 환경 생성:**
```bash
azd env new myai-workshop
```

2. **필요한 매개변수 설정:**
```bash
# 선호하는 Azure 지역 설정
azd env set AZURE_LOCATION eastus

# 선택 사항: 특정 OpenAI 모델 설정
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 2.2단계: 인프라 및 애플리케이션 배포

1. **AZD로 배포:**
```bash
azd up
```

**`azd up` 실행 시 발생하는 일:**
- ✅ Microsoft Foundry Models 서비스 프로비저닝
- ✅ Azure AI 검색 서비스 생성
- ✅ 웹 앱 서비스 설정
- ✅ 네트워킹 및 보안 구성
- ✅ 애플리케이션 코드 배포
- ✅ 모니터링 및 로깅 설정

2. **배포 진행 모니터링** 및 생성 중인 리소스 확인.

### 2.3단계: 배포 확인

1. **배포된 리소스 점검:**
```bash
azd show
```

2. **배포된 애플리케이션 열기:**
```bash
azd show
```

`azd show` 출력에 표시된 웹 엔드포인트를 엽니다.

3. **AI 기능 테스트:**
   - 웹 애플리케이션 접속
   - 샘플 쿼리 시도
   - AI 응답 정상 작동 확인

### **실습 2.1: 문제 해결 연습**

<strong>시나리오</strong>: 배포는 성공했으나 AI가 응답하지 않음.

**확인할 일반 문제들:**
1. **OpenAI API 키**: 올바르게 설정되었는지 확인
2. **모델 가용성**: 해당 지역이 모델 지원하는지 점검
3. **네트워크 연결**: 서비스 간 통신 가능 여부 확인
4. **RBAC 권한**: 애플리케이션의 OpenAI 접근 권한 확인

**디버깅 명령어:**
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
# 다른 모델로 변경 (해당 지역에서 사용 가능한 경우)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 새 구성으로 다시 배포
azd deploy
```

2. **추가 AI 서비스 추가:**

Document Intelligence를 추가하려면 `infra/main.bicep` 편집:

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

**모범 사례**: 개발 환경과 프로덕션 환경에 맞게 다른 구성을 사용.

1. **프로덕션 환경 생성:**
```bash
azd env new myai-production
```

2. **프로덕션 전용 매개변수 설정:**
```bash
# 생산은 일반적으로 더 높은 SKU를 사용합니다
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 추가 보안 기능을 활성화합니다
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **실습 3.1: 비용 최적화**

**도전 과제**: 비용 효율적인 개발용 템플릿 구성.

**과제:**
1. 무료/기본 등급으로 설정 가능한 SKU 식별
2. 최소 비용을 위한 환경 변수 구성
3. 배포 후 프로덕션 구성과 비용 비교

**해결 힌트:**
- 가능 시 Azure AI 서비스에 F0(무료) 등급 사용
- 개발 환경에서 검색 서비스는 기본 등급 사용
- Functions에는 소비량 기반 플랜 고려

## 모듈 4: 보안 및 프로덕션 모범 사례

### 4.1단계: 안전한 자격 증명 관리

**현재 과제**: 많은 AI 앱이 API 키를 하드코딩하거나 안전하지 않은 저장소 사용.

**AZD 솔루션**: 관리형 ID + 키 볼트 통합.

1. **템플릿의 보안 구성 검토:**
```bash
# 키 볼트 및 관리 ID 구성을 확인하세요
grep -r "keyVault\|managedIdentity" infra/
```

2. **관리형 ID 동작 확인:**
```bash
# 웹 앱이 올바른 ID 구성인가 확인하십시오
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2단계: 네트워크 보안

1. **프라이빗 엔드포인트 활성화** (아직 설정 안 된 경우):

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
# Application Insights가 자동으로 구성되어야 합니다
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

<strong>과제</strong>: 배포물을 보안 모범 사례에 따라 검토하기.

**체크리스트:**
- [ ] 코드나 구성에 하드코딩된 비밀 없음
- [ ] 서비스 간 인증에 관리형 ID 사용
- [ ] 중요한 구성 정보는 키 볼트에 저장
- [ ] 네트워크 접근이 적절히 제한됨
- [ ] 모니터링 및 로깅 활성화됨

## 모듈 5: 나만의 AI 애플리케이션 변환

### 5.1단계: 평가 워크시트

**앱 변환 전에 다음 질문에 답하세요:**

1. **애플리케이션 아키텍처:**
   - 앱이 사용하는 AI 서비스는?
   - 필요한 컴퓨트 자원은?
   - 데이터베이스가 필요한가?
   - 서비스 간 의존성은?

2. **보안 요구사항:**
   - 처리하는 민감한 데이터는?
   - 준수해야 할 규정은?
   - 프라이빗 네트워킹 필요 여부?

3. **확장 요구사항:**
   - 예상 부하는?
   - 자동 확장 필요 여부?
   - 지역별 요구사항은?

### 5.2단계: AZD 템플릿 생성

**다음 패턴을 따라 앱을 변환하세요:**

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

**도전 과제**: 문서 처리 AI 앱의 AZD 템플릿 만들기.

**요구사항:**
- 콘텐츠 분석용 Microsoft Foundry Models
- OCR용 Document Intelligence
- 문서 업로드용 저장소 계정
- 처리 로직용 함수 앱
- 사용자 인터페이스용 웹 앱

**보너스 점수:**
- 적절한 오류 처리 추가
- 비용 추정 포함
- 모니터링 대시보드 설정

## 모듈 6: 일반적인 문제 해결

### 일반 배포 문제

#### 문제 1: OpenAI 서비스 할당량 초과
**증상:** 할당량 오류로 배포 실패
**해결책:**
```bash
# 현재 할당량 확인
az cognitiveservices usage list --location eastus

# 할당량 증액 요청 또는 다른 지역 시도
azd env set AZURE_LOCATION westus2
azd up
```

#### 문제 2: 지역에서 모델 미지원
**증상:** AI 응답 실패 또는 모델 배포 오류
**해결책:**
```bash
# 지역별 모델 가용성 확인
az cognitiveservices model list --location eastus

# 사용 가능한 모델로 업데이트
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 문제 3: 권한 문제
**증상:** AI 서비스 호출 시 403 Forbidden 오류
**해결책:**
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

#### 문제 4: AI 응답 지연
**조사 단계:**
1. Application Insights에서 성능 지표 확인
2. Azure 포털에서 OpenAI 서비스 메트릭 검토
3. 네트워크 연결 및 지연율 확인

**해결책:**
- 자주 쓰이는 쿼리 캐싱 구현
- 사용 사례에 적합한 OpenAI 모델 선택
- 고부하 시 읽기 전용 복제본 고려

### **실습 6.1: 디버깅 도전 과제**

<strong>시나리오</strong>: 배포는 성공했지만 애플리케이션이 500 오류 반환.

**디버깅 작업:**
1. 애플리케이션 로그 확인
2. 서비스 연결성 확인
3. 인증 테스트
4. 구성 검토

**사용 도구:**
- 배포 개요용 `azd show`
- 상세 서비스 로그용 Azure 포털
- 애플리케이션 텔레메트리용 Application Insights

## 모듈 7: 모니터링 및 최적화

### 7.1단계: 종합 모니터링 설정

1. **맞춤 대시보드 생성:**

Azure 포털에서 다음과 같은 항목으로 대시보드 생성:
- OpenAI 요청 수 및 지연 시간
- 애플리케이션 오류율
- 리소스 활용도
- 비용 추적

2. **알림 설정:**
```bash
# 높은 오류율에 대한 경고
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

2. **비용 관리 조치:**
- 예산 알림 설정
- 자동 확장 정책 사용
- 요청 캐싱 구현
- OpenAI 토큰 사용량 모니터링

### **실습 7.1: 성능 최적화**

<strong>과제</strong>: AI 애플리케이션을 성능과 비용 모두 최적화하기.

**개선 목표:**
- 평균 응답 시간 20% 감소
- 월별 비용 15% 감소
- 99.9% 가용성 유지

**시도할 전략:**
- 응답 캐싱 구현
- 토큰 효율성을 위한 프롬프트 최적화
- 적절한 컴퓨트 SKU 사용
- 적절한 자동 확장 설정

## 최종 도전 과제: 엔드 투 엔드 구현

### 도전 과제 시나리오

다음 요구사항을 갖춘 프로덕션 준비 AI 기반 고객 서비스 챗봇을 만드세요:

**기능적 요구사항:**
- 고객 상호작용을 위한 웹 인터페이스
- Microsoft Foundry Models와 연동한 응답 생성
- Azure AI Search를 이용한 문서 검색 기능
- 기존 고객 데이터베이스 통합
- 다국어 지원

**비기능적 요구사항:**
- 1000명의 동시 사용자 처리
- 99.9% 가용성 SLA
- SOC 2 컴플라이언스 준수
- 월 $500 이하 비용
- 개발, 스테이징, 프로덕션 등 다중 환경 배포

### 구현 단계

1. **아키텍처 설계**
2. **AZD 템플릿 생성**
3. **보안 조치 구현**
4. **모니터링 및 알림 설정**
5. **배포 파이프라인 생성**
6. **솔루션 문서화**

### 평가 기준

- ✅ <strong>기능성</strong>: 모든 요구사항 충족 여부
- ✅ <strong>보안</strong>: 모범 사례 구현 여부
- ✅ <strong>확장성</strong>: 부하 처리 능력
- ✅ **유지 관리성**: 코드와 인프라 조직 상태
- ✅ <strong>비용</strong>: 예산 내 유지 여부

## 추가 자료

### Microsoft 문서
- [Azure Developer CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 서비스 문서](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 문서](https://learn.microsoft.com/azure/ai-studio/)

### 샘플 템플릿
- [Microsoft Foundry Models 챗 앱](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 챗 앱 퀵스타트](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### 커뮤니티 리소스
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 수료증

축하합니다! AI 워크숍 랩을 완료하셨습니다. 이제 다음을 할 수 있습니다:

- ✅ 기존 AI 애플리케이션을 AZD 템플릿으로 변환하기
- ✅ 프로덕션 준비가 된 AI 애플리케이션 배포하기
- ✅ AI 워크로드를 위한 보안 모범 사례 구현하기
- ✅ AI 애플리케이션 성능 모니터링 및 최적화하기
- ✅ 일반 배포 문제 해결하기

### 다음 단계
1. 이 패턴을 자신의 AI 프로젝트에 적용하기
2. 템플릿을 커뮤니티에 기여하기
3. Microsoft Foundry Discord에 가입하여 지속적인 지원 받기
4. 다중 지역 배포와 같은 고급 주제 탐색하기

---

**워크숍 피드백**: [Microsoft Foundry Discord #Azure 채널](https://discord.gg/microsoft-azure)에서 경험을 공유하여 이 워크숍 개선에 도움을 주세요.

---

**챕터 내비게이션:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI-퍼스트 개발
- **⬅️ 이전**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ 다음**: [프로덕션 AI 모범 사례](production-ai-practices.md)
- **🚀 다음 챕터**: [챕터 3: 구성](../chapter-03-configuration/configuration.md)

**도움이 필요하신가요?** AZD와 AI 배포에 관한 지원과 토론을 위해 커뮤니티에 참여하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->