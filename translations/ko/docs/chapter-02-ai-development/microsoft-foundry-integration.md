# Microsoft Foundry와 AZD 통합

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI 우선 개발
- **⬅️ 이전 챕터**: [챕터 1: 당신의 첫 프로젝트](../chapter-01-foundation/first-project.md)
- **➡️ 다음**: [AI 모델 배포](ai-model-deployment.md)
- **🚀 다음 챕터**: [챕터 3: 구성](../chapter-03-configuration/configuration.md)

## 개요

이 가이드는 Microsoft Foundry 서비스와 Azure Developer CLI(AZD)를 통합하여 AI 애플리케이션 배포를 간소화하는 방법을 설명합니다. Microsoft Foundry는 AI 애플리케이션을 구축, 배포 및 관리하기 위한 포괄적인 플랫폼을 제공하며, AZD는 인프라와 배포 프로세스를 단순화합니다.

## Microsoft Foundry란?

Microsoft Foundry는 다음을 포함하는 Microsoft의 통합 AI 개발 플랫폼입니다:

- **모델 카탈로그**: 최신 AI 모델에 대한 접근
- **프롬프트 플로우**: AI 워크플로를 위한 시각적 디자이너
- **AI Foundry 포탈**: AI 애플리케이션을 위한 통합 개발 환경
- **배포 옵션**: 다양한 호스팅 및 확장 옵션
- **안전 및 보안**: 내장된 책임 있는 AI 기능

## AZD + Microsoft Foundry: 함께하면 더 나은 이유

| 기능 | Microsoft Foundry | AZD 통합 이점 |
|---------|-----------------|------------------------|
| **모델 배포** | 수동 포탈 배포 | 자동화되고 반복 가능한 배포 |
| **인프라** | 클릭형 프로비저닝 | 코드형 인프라(Bicep) |
| **환경 관리** | 단일 환경 중심 | 다중 환경(dev/staging/prod) |
| **CI/CD 통합** | 제한적 | 기본 GitHub Actions 지원 |
| **비용 관리** | 기본 모니터링 | 환경별 비용 최적화 |

## 사전 요구사항

- 적절한 권한이 있는 Azure 구독
- Azure Developer CLI 설치
- Azure OpenAI 서비스 접근 권한
- Microsoft Foundry에 대한 기본적인 이해

## 핵심 통합 패턴

### 패턴 1: Azure OpenAI 통합

**사용 사례**: Azure OpenAI 모델로 채팅 애플리케이션 배포

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**인프라스트럭처 (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### 패턴 2: AI 검색 + RAG 통합

**사용 사례**: 검색 기반 증강 생성(RAG) 애플리케이션 배포

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### 패턴 3: 문서 인텔리전스 통합

**사용 사례**: 문서 처리 및 분석 워크플로

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 구성 패턴

### 환경 변수 설정

**프로덕션 구성:**
```bash
# 핵심 AI 서비스
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 모델 구성
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# 성능 설정
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**개발 구성:**
```bash
# 개발을 위한 비용 최적화 설정
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 무료 등급
```

### Key Vault를 사용한 보안 구성

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## 배포 워크플로

### 단일 명령 배포

```bash
# 한 번의 명령으로 모든 것을 배포
azd up

# 또는 점진적으로 배포
azd provision  # 인프라만
azd deploy     # 애플리케이션만
```

### 환경별 배포

```bash
# 개발 환경
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# 운영 환경
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## 모니터링 및 관측성

### Application Insights 통합

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### 비용 모니터링

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 보안 모범 사례

### 관리 ID 구성

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### 네트워크 보안

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## 성능 최적화

### 캐싱 전략

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### 자동 확장 구성

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## 자주 발생하는 문제 해결

### 문제 1: OpenAI 할당량 초과

**증상:**
- 배포가 할당량 오류로 실패함
- 애플리케이션 로그에 429 오류 발생

**해결 방법:**
```bash
# 현재 할당량 사용량 확인
az cognitiveservices usage list --location eastus

# 다른 리전 시도
azd env set AZURE_LOCATION westus2
azd up

# 용량을 일시적으로 줄이기
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 문제 2: 인증 실패

**증상:**
- AI 서비스를 호출할 때 401/403 오류 발생
- "액세스 거부" 메시지 표시

**해결 방법:**
```bash
# 역할 할당을 확인합니다
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 관리형 ID 구성을 확인합니다
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault 접근 권한을 검증합니다
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 문제 3: 모델 배포 문제

**증상:**
- 배포에 모델이 사용 불가
- 특정 모델 버전이 실패함

**해결 방법:**
```bash
# 지역별로 사용 가능한 모델을 나열
az cognitiveservices model list --location eastus

# bicep 템플릿에서 모델 버전을 업데이트
# 모델 용량 요구 사항을 확인
```

## 예제 템플릿

### 기본 채팅 애플리케이션

**리포지토리**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**서비스**: Azure OpenAI + Cognitive Search + App Service

**빠른 시작**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### 문서 처리 파이프라인

**리포지토리**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**서비스**: 문서 인텔리전스 + 스토리지 + Functions

**빠른 시작**:
```bash
azd init --template ai-document-processing
azd up
```

### 엔터프라이즈 RAG 채팅

**리포지토리**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**서비스**: Azure OpenAI + Search + Container Apps + Cosmos DB

**빠른 시작**:
```bash
azd init --template contoso-chat
azd up
```

## 다음 단계

1. **예제 시도하기**: 사용 사례에 맞는 사전 구성된 템플릿으로 시작하세요
2. **필요에 맞게 사용자화**: 인프라와 애플리케이션 코드를 수정하세요
3. **모니터링 추가**: 포괄적인 관측성 구현
4. **비용 최적화**: 예산에 맞게 구성 조정
5. **배포 보안 강화**: 엔터프라이즈 보안 패턴 적용
6. **프로덕션으로 확장**: 다중 지역 및 고가용성 기능 추가

## 🎯 실습 과제

### 연습 1: Azure OpenAI 채팅 앱 배포 (30분)
**목표**: 프로덕션 준비가 된 AI 채팅 애플리케이션을 배포하고 테스트

```bash
# 템플릿 초기화
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# 환경 변수 설정
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# 배포
azd up

# 애플리케이션 테스트
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI 운영 모니터링
azd monitor

# 정리
azd down --force --purge
```

**성공 기준:**
- [ ] 배포가 할당량 오류 없이 완료됨
- [ ] 브라우저에서 채팅 인터페이스에 접근 가능
- [ ] 질문을 하고 AI 기반 응답을 받을 수 있음
- [ ] Application Insights에 텔레메트리 데이터 표시
- [ ] 리소스 정리 완료

**예상 비용**: $5-10 (30분 테스트 기준)

### 연습 2: 다중 모델 배포 구성 (45분)
**목표**: 서로 다른 구성으로 여러 AI 모델 배포

```bash
# 사용자 지정 Bicep 구성 생성
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# 배포 및 검증
azd provision
azd show
```

**성공 기준:**
- [ ] 여러 모델이 성공적으로 배포됨
- [ ] 서로 다른 용량 설정이 적용됨
- [ ] 모델들이 API를 통해 접근 가능함
- [ ] 애플리케이션에서 두 모델 모두 호출 가능

### 연습 3: 비용 모니터링 구현 (20분)
**목표**: 예산 알림 및 비용 추적 설정

```bash
# Bicep에 예산 경고 추가
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# 예산 경고 배포
azd provision

# 현재 비용 확인
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**성공 기준:**
- [ ] Azure에 예산 경보 생성
- [ ] 이메일 알림 구성
- [ ] Azure 포털에서 비용 데이터 확인 가능
- [ ] 예산 임계값 적절히 설정

## 💡 자주 묻는 질문

<details>
<summary><strong>개발 중 Azure OpenAI 비용을 어떻게 줄이나요?</strong></summary>

1. **무료 티어 사용**: Azure OpenAI는 월 50,000 토큰 무료 제공
2. **용량 축소**: 개발 환경에서는 30+ 대신 10 TPM으로 설정
3. **azd down 사용**: 적극적으로 개발하지 않을 때 리소스 할당 해제
4. **응답 캐시**: 반복 쿼리에 대해 Redis 캐시 구현
5. **프롬프트 엔지니어링 사용**: 효율적인 프롬프트로 토큰 사용량 절감

```bash
# 개발 구성
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI와 OpenAI API의 차이점은 무엇인가요?</strong></summary>

**Azure OpenAI**:
- 엔터프라이즈 보안 및 규정 준수
- 프라이빗 네트워크 통합
- SLA 보장
- 관리 ID 인증
- 더 높은 할당량 가능

**OpenAI API**:
- 새로운 모델에 더 빠르게 접근 가능
- 더 간단한 설정
- 진입 장벽이 낮음
- 퍼블릭 인터넷 전용

프로덕션 앱에는 **Azure OpenAI**를 권장합니다.
</details>

<details>
<summary><strong>Azure OpenAI 할당량 초과 오류를 어떻게 처리하나요?</strong></summary>

```bash
# 현재 할당량 확인
az cognitiveservices usage list --location eastus2

# 다른 리전 시도
azd env set AZURE_LOCATION westus2
azd up

# 용량을 일시적으로 줄이기
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 할당량 증가 요청
# Azure 포털 > 할당량 > 증가 요청
```
</details>

<details>
<summary><strong>내 데이터를 Azure OpenAI와 함께 사용할 수 있나요?</strong></summary>

예! RAG(검색 기반 증강 생성)을 위해 **Azure AI Search**를 사용하세요:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

템플릿은 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)를 참조하세요.
</details>

<details>
<summary><strong>AI 모델 엔드포인트를 어떻게 보호하나요?</strong></summary>

**모범 사례**:
1. 관리 ID 사용(API 키 없음)
2. 프라이빗 엔드포인트 활성화
3. 네트워크 보안 그룹 구성
4. 속도 제한 적용
5. 비밀 관리를 위해 Azure Key Vault 사용

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## 커뮤니티 및 지원

- **Microsoft Foundry Discord**: [#Azure 채널](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [이슈 및 토론](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [공식 문서](https://learn.microsoft.com/azure/ai-studio/)

---

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI 우선 개발
- **⬅️ 이전 챕터**: [챕터 1: 당신의 첫 프로젝트](../chapter-01-foundation/first-project.md)
- **➡️ 다음**: [AI 모델 배포](ai-model-deployment.md)
- **🚀 다음 챕터**: [챕터 3: 구성](../chapter-03-configuration/configuration.md)

**도움이 필요하신가요?** 커뮤니티 토론에 참여하거나 리포지토리에 이슈를 열어주세요. Azure AI + AZD 커뮤니티가 여러분의 성공을 돕기 위해 여기 있습니다!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 조항:
이 문서는 AI 번역 서비스 Co-op Translator(https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나 자동 번역에는 오류나 부정확성이 있을 수 있음을 알려드립니다. 원본 문서(원래 작성된 언어의 문서)를 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 모든 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->