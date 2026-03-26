# Microsoft Foundry와 AZD 통합

**챕터 네비게이션:**
- **📚 코스 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 챕터 2 - AI-우선 개발
- **⬅️ 이전 챕터**: [챕터 1: 첫 번째 프로젝트](../chapter-01-foundation/first-project.md)
- **➡️ 다음**: [AI 모델 배포](ai-model-deployment.md)
- **🚀 다음 챕터**: [챕터 3: 설정](../chapter-03-configuration/configuration.md)

## 개요

이 가이드는 Microsoft Foundry 서비스를 Azure Developer CLI(AZD)와 통합하여 AI 애플리케이션 배포를 간소화하는 방법을 보여줍니다. Microsoft Foundry는 AI 애플리케이션을 구축, 배포 및 관리하기 위한 종합 플랫폼을 제공하며, AZD는 인프라와 배포 과정을 단순화합니다.

## Microsoft Foundry란?

Microsoft Foundry는 Microsoft의 통합 AI 개발 플랫폼으로 다음을 포함합니다:

- **모델 카탈로그**: 최신 AI 모델에 대한 접근
- **프롬프트 플로우**: AI 워크플로우를 위한 시각적 디자이너
- **Microsoft Foundry 포털**: AI 애플리케이션을 위한 통합 개발 환경
- **배포 옵션**: 다양한 호스팅 및 확장 옵션
- **안전과 보안**: 내장된 책임감 있는 AI 기능

## AZD + Microsoft Foundry: 함께 더 나은

| 기능 | Microsoft Foundry | AZD 통합 이점 |
|---------|-----------------|------------------------|
| **모델 배포** | 수동 포털 배포 | 자동화된 반복 가능한 배포 |
| <strong>인프라</strong> | 클릭-스루 프로비저닝 | 코드로서의 인프라(Bicep) |
| **환경 관리** | 단일 환경 집중 | 다중 환경(개발/스테이징/운영) |
| **CI/CD 통합** | 제한적 | 네이티브 GitHub Actions 지원 |
| **비용 관리** | 기본 모니터링 | 환경별 비용 최적화 |

## 사전 준비사항

- 적절한 권한이 부여된 Azure 구독
- Azure Developer CLI 설치
- Microsoft Foundry Models 서비스 접근권한
- Microsoft Foundry 기본 이해

## 주요 통합 패턴

### 패턴 1: Microsoft Foundry Models 통합

**사용 사례**: Microsoft Foundry Models 모델로 채팅 애플리케이션 배포

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
// Microsoft Foundry Models Account
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

**사용 사례**: 검색 증강 생성(RAG) 애플리케이션 배포

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

**사용 사례**: 문서 처리 및 분석 워크플로우

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
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 무료 계층
```

### 키 볼트로 보안 설정

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

## 배포 워크플로우

### Foundry용 AZD 확장

AZD는 Microsoft Foundry 서비스와 작업할 때 AI 전용 기능을 추가하는 확장을 제공합니다:

```bash
# Foundry 에이전트 확장 프로그램 설치
azd extension install azure.ai.agents

# 파인튜닝 확장 프로그램 설치
azd extension install azure.ai.finetune

# 맞춤형 모델 확장 프로그램 설치
azd extension install azure.ai.models

# 설치된 확장 프로그램 목록 보기
azd extension list
```

### 에이전트 우선 배포 `azd ai`

에이전트 매니페스트가 있는 경우 `azd ai agent init`을 사용하여 Foundry Agent 서비스에 연결된 프로젝트를 스캐폴딩합니다:

```bash
# 에이전트 매니페스트에서 초기화
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure에 배포
azd up
```

전체 명령 참조 및 플래그는 [AZD AI CLI 명령](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)을 참조하세요.

### 단일 명령 배포

```bash
# 한 명령어로 모든 것 배포
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

## 모니터링 및 관측 가능성

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

### 관리형 ID 구성

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

## 일반적인 문제 해결

### 문제 1: OpenAI 할당량 초과

**증상:**
- 할당량 오류로 배포 실패
- 애플리케이션 로그에 429 오류 발생

**해결책:**
```bash
# 현재 할당량 사용량 확인
az cognitiveservices usage list --location eastus

# 다른 지역 시도
azd env set AZURE_LOCATION westus2
azd up

# 용량을 일시적으로 줄이기
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 문제 2: 인증 실패

**증상:**
- AI 서비스 호출 시 401/403 오류
- "액세스 거부" 메시지

**해결책:**
```bash
# 역할 할당 확인
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 관리 아이덴티티 구성 검사
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 키 볼트 액세스 검증
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 문제 3: 모델 배포 문제

**증상:**
- 배포에 모델이 없거나
- 특정 모델 버전 실패

**해결책:**
```bash
# 지역별 사용 가능한 모델 목록
az cognitiveservices model list --location eastus

# 비셉 템플릿에서 모델 버전 업데이트
# 모델 용량 요구 사항 확인
```

## 예제 템플릿

### RAG 채팅 애플리케이션 (Python)

<strong>저장소</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>서비스</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>설명</strong>: 가장 인기 있는 Azure AI 샘플 — 자체 문서에 대해 질문할 수 있는 프로덕션용 RAG 채팅 앱. GPT-4.1-mini를 채팅에, text-embedding-ada-002를 임베딩에, Azure AI Search를 검색에 사용. 다중 모달 문서, 음성 입력/출력, Microsoft Entra 인증 및 Application Insights 추적 지원.

**빠른 시작**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 채팅 애플리케이션 (.NET)

<strong>저장소</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>서비스</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>설명</strong>: Python RAG 채팅 샘플의 .NET/C# 버전. ASP.NET Core Minimal API와 Blazor WebAssembly 프런트엔드로 제작. 음성 채팅, GPT-4o-mini 비전 지원, 데스크톱/모바일 클라이언트용 .NET MAUI Blazor 하이브리드 포함.

**빠른 시작**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 채팅 애플리케이션 (Java)

<strong>저장소</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>서비스</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>설명</strong>: Langchain4J를 사용한 Java 버전 RAG 샘플로 AI 오케스트레이션을 지원. 마이크로서비스 이벤트 기반 아키텍처, 여러 검색 전략(텍스트, 벡터, 하이브리드), Azure Document Intelligence로 문서 업로드, Azure Container Apps 또는 AKS에 배포 가능.

**빠른 시작**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

<strong>저장소</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>서비스</strong>: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>설명</strong>: Azure AI Foundry와 Prompty를 이용한 엔드투엔드 소매 RAG 코파일럿. Contoso Outdoor 소매점 채팅봇으로 제품 카탈로그와 고객 주문 데이터를 기반으로 응답 생성. 전체 GenAIOps 워크플로우를 보여줌 — Prompty로 프로토타입, AI 지원 평가자와 평가, AZD로 Container Apps에 배포.

**빠른 시작**:
```bash
azd init --template contoso-chat
azd up
```

### 창작 멀티 에이전트 애플리케이션

<strong>저장소</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>서비스</strong>: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>설명</strong>: Prompty를 이용한 AI 에이전트 오케스트레이션의 멀티 에이전트 샘플. 리서치 에이전트(Bing Grounding in Azure AI Agent Service), 제품 에이전트(Azure AI Search), 작가 에이전트, 편집자 에이전트가 협력하여 잘 조사된 문서 작성. GitHub Actions에서 평가가 포함된 CI/CD 지원.

**빠른 시작**:
```bash
azd init --template contoso-creative-writer
azd up
```

### 서버리스 RAG 채팅 (JavaScript/TypeScript)

<strong>저장소</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>서비스</strong>: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>설명</strong>: LangChain.js를 사용하고 API는 Azure Functions, 호스팅은 Azure Static Web Apps를 이용하는 완전 서버리스 RAG 챗봇. Azure Cosmos DB를 벡터 저장소 및 채팅 히스토리 DB로 사용. Ollama를 사용하여 로컬 개발 및 무상 테스트 지원.

**빠른 시작**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 데이터 기반 챗 솔루션 가속기

<strong>저장소</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>서비스</strong>: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>설명</strong>: 문서 업로드/관리용 관리자 포털, 여러 오케스트레이터 옵션(Semantic Kernel, LangChain, Prompt Flow), 음성-텍스트 변환, Microsoft Teams 통합, PostgreSQL 또는 Cosmos DB 백엔드 선택이 가능한 엔터프라이즈급 RAG 솔루션 가속기. 프로덕션 RAG 시나리오를 위한 사용자 지정 가능 시작점 제공.

**빠른 시작**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 여행 에이전트 — 멀티 에이전트 MCP 오케스트레이션

<strong>저장소</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>서비스</strong>: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP 서버(.NET, Python, Java, TypeScript)

<strong>설명</strong>: 세 가지 프레임워크(LangChain.js, LlamaIndex.TS, Microsoft Agent Framework)를 사용하는 멀티 에이전트 AI 오케스트레이션 참조 애플리케이션. 네 가지 언어로 작성된 MCP(모델 컨텍스트 프로토콜) 서버가 서버리스 Azure Container Apps로 배포되며 OpenTelemetry 모니터링 포함.

**빠른 시작**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 스타터

<strong>저장소</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>서비스</strong>: Azure AI 서비스 + Azure OpenAI

<strong>설명</strong>: 머신러닝 모델이 구성된 Azure AI 서비스를 배포하는 최소 Bicep 템플릿. 완전한 애플리케이션 스택이 필요 없고 Azure AI 인프라만 프로비저닝할 때 가벼운 출발점.

**빠른 시작**:
```bash
azd init --template azd-ai-starter
azd up
```

> **더 많은 템플릿 보기**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai)에서 80개 이상의 AI 전용 AZD 템플릿을 언어와 시나리오별로 만나보세요.

## 다음 단계

1. **예제 시도하기**: 사용 사례에 맞는 사전 구축 템플릿으로 시작
2. **필요에 맞게 맞춤 설정**: 인프라 및 애플리케이션 코드 수정
3. **모니터링 추가**: 포괄적인 관측 가능성 구현
4. **비용 최적화**: 예산에 맞게 구성 조정
5. **배포 보안 강화**: 엔터프라이즈 보안 패턴 적용
6. **프로덕션 확장**: 다중 지역 및 고가용성 기능 추가

## 🎯 실습 연습

### 연습 1: Microsoft Foundry Models 채팅 앱 배포 (30분)
<strong>목표</strong>: 프로덕션 준비가 된 AI 채팅 애플리케이션 배포 및 테스트

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

# 정리 작업
azd down --force --purge
```

**성공 기준:**
- [ ] 할당량 오류 없이 배포 완료
- [ ] 브라우저에서 채팅 인터페이스 접근 가능
- [ ] 질문을 하고 AI 응답 받기 가능
- [ ] Application Insights에서 텔레메트리 데이터 확인
- [ ] 리소스 정상 삭제 완료

**예상 비용**: 30분 테스트에 5-10달러

### 연습 2: 다중 모델 배포 구성 (45분)
<strong>목표</strong>: 서로 다른 구성으로 여러 AI 모델 배포

```bash
# 사용자 지정 Bicep 구성 생성
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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

# 배포 및 확인
azd provision
azd show
```

**성공 기준:**
- [ ] 여러 모델 배포 성공
- [ ] 서로 다른 용량 설정 적용
- [ ] API를 통해 모델 접근 가능
- [ ] 애플리케이션에서 두 모델 모두 호출 가능

### 연습 3: 비용 모니터링 구현 (20분)
<strong>목표</strong>: 예산 경고 및 비용 추적 설정

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
- [ ] Azure에서 예산 경고 생성
- [ ] 이메일 알림 구성
- [ ] Azure 포털에서 비용 데이터 조회 가능
- [ ] 적절한 예산 임계값 설정

## 💡 자주 묻는 질문

<details>
<summary><strong>개발 중 Microsoft Foundry Models 비용을 어떻게 줄일 수 있나요?</strong></summary>

1. **무료 요금제 사용**: Microsoft Foundry Models는 월 50,000 토큰 무료 제공
2. **용량 축소**: 개발 시 30+ 대신 10 TPM으로 용량 설정
3. **azd down 사용**: 개발하지 않을 때 리소스 할당 해제
4. **응답 캐시**: 반복 쿼리에 Redis 캐시 구현
5. **프롬프트 엔지니어링**: 효율적인 프롬프트로 토큰 사용 감소

```bash
# 개발 구성
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models와 OpenAI API의 차이점은 무엇인가요?</strong></summary>

**Microsoft Foundry Models**:
- 엔터프라이즈 보안 및 규정 준수
- 프라이빗 네트워크 통합
- SLA 보장
- 관리형 ID 인증
- 더 높은 할당량 지원

**OpenAI API**:
- 최신 모델에 더 빠른 접근
- 간단한 설정
- 낮은 진입 장벽
- 공개 인터넷 전용

프로덕션 앱에는 <strong>Microsoft Foundry Models를 권장</strong>합니다.
</details>

<details>
<summary><strong>Microsoft Foundry Models 할당량 초과 오류를 어떻게 처리하나요?</strong></summary>

```bash
# 현재 할당량 확인
az cognitiveservices usage list --location eastus2

# 다른 지역 시도
azd env set AZURE_LOCATION westus2
azd up

# 일시적으로 용량 감소
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 할당량 증가 요청
# Azure 포털 > 할당량 > 증가 요청으로 이동
```
</details>

<details>
<summary><strong>Microsoft Foundry Models에 내 데이터를 사용할 수 있나요?</strong></summary>

네! RAG(검색 증강 생성)에는 <strong>Azure AI Search</strong>를 사용하세요:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 템플릿을 참조하세요.
</details>

<details>
<summary><strong>AI 모델 엔드포인트를 어떻게 보안하나요?</strong></summary>

**모범 사례**:
1. 관리되는 ID 사용(API 키 없음)
2. 사설 엔드포인트 활성화
3. 네트워크 보안 그룹 구성
4. 속도 제한 구현
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
- **Agent Skills**: [skills.sh의 Microsoft Foundry 기술](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - `npx skills add microsoft/github-copilot-for-azure` 명령어로 에디터에 Azure + Foundry 에이전트 기술 설치

---

**챕터 탐색:**
- **📚 코스 홈**: [AZD 입문](../../README.md)
- **📖 현재 챕터**: 2장 - AI 우선 개발
- **⬅️ 이전 챕터**: [1장: 첫 프로젝트](../chapter-01-foundation/first-project.md)
- **➡️ 다음**: [AI 모델 배포](ai-model-deployment.md)
- **🚀 다음 챕터**: [3장: 구성](../chapter-03-configuration/configuration.md)

**도움이 필요하신가요?** 커뮤니티 토론에 참여하거나 저장소에 이슈를 올려주세요. Azure AI + AZD 커뮤니티가 여러분의 성공을 지원합니다!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역은 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원본 문서는 해당 원어로 된 문서가 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우 전문 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 어떠한 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->