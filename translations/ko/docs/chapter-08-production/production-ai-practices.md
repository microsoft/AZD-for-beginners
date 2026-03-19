# AZD와 함께하는 프로덕션 AI 워크로드 모범 사례

**챕터 내비게이션:**  
- **📚 코스 홈**: [AZD 초보자용](../../README.md)  
- **📖 현재 챕터**: 챕터 8 - 프로덕션 및 엔터프라이즈 패턴  
- **⬅️ 이전 챕터**: [챕터 7: 문제 해결](../chapter-07-troubleshooting/debugging.md)  
- **⬅️ 관련 자료**: [AI 워크숍 랩](ai-workshop-lab.md)  
- **🎯 코스 완료**: [AZD 초보자용](../../README.md)  

## 개요

이 가이드는 Azure Developer CLI(AZD)를 사용하여 프로덕션 준비가 된 AI 워크로드를 배포하는 포괄적인 모범 사례를 제공합니다. Microsoft Foundry Discord 커뮤니티 피드백과 실제 고객 배포 사례를 토대로, 프로덕션 AI 시스템에서 가장 흔히 직면하는 문제들을 다룹니다.

## 다루는 주요 과제

커뮤니티 설문 결과를 바탕으로, 개발자들이 겪는 주요 과제는 다음과 같습니다:

- **45%**: 다중 서비스 AI 배포의 어려움  
- **38%**: 자격 증명 및 시크릿 관리 문제  
- **35%**: 프로덕션 준비 및 확장성 문제  
- **32%**: 비용 최적화 전략 필요  
- **29%**: 모니터링 및 문제 해결 개선 필요  

## 프로덕션 AI를 위한 아키텍처 패턴

### 패턴 1: 마이크로서비스 AI 아키텍처

**사용 시기**: 여러 기능을 가진 복잡한 AI 애플리케이션

```mermaid
graph TD
    Frontend[웹 프론트엔드] --- Gateway[API 게이트웨이] --- LB[로드 밸런서]
    Gateway --> Chat[채팅 서비스]
    Gateway --> Image[이미지 서비스]
    Gateway --> Text[텍스트 서비스]
    Chat --> OpenAI[마이크로소프트 파운드리 모델]
    Image --> Vision[컴퓨터 비전]
    Text --> DocIntel[문서 인텔리전스]
```
**AZD 구현**:

```yaml
# azure.yaml
name: enterprise-ai-platform
services:
  web:
    project: ./web
    host: staticwebapp
  api-gateway:
    project: ./api-gateway
    host: containerapp
  chat-service:
    project: ./services/chat
    host: containerapp
  vision-service:
    project: ./services/vision
    host: containerapp
  text-service:
    project: ./services/text
    host: containerapp
```

### 패턴 2: 이벤트 기반 AI 처리

**사용 시기**: 배치 처리, 문서 분석, 비동기 워크플로우

```bicep
// Event Hub for AI processing pipeline
resource eventHub 'Microsoft.EventHub/namespaces@2023-01-01-preview' = {
  name: eventHubNamespaceName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}

// Service Bus for reliable message processing
resource serviceBus 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: 'Premium'
    tier: 'Premium'
    capacity: 1
  }
}

// Function App for processing
resource functionApp 'Microsoft.Web/sites@2023-01-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp,linux'
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'AZURE_OPENAI_ENDPOINT'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=openai-endpoint)'
        }
      ]
    }
  }
}
```

## AI 에이전트 상태 고려하기

전통적인 웹 앱이 고장 나면 일반적으로 페이지가 로드되지 않거나 API가 오류를 반환하거나 배포가 실패하는 등 명확한 증상이 나타납니다. AI 기반 애플리케이션 역시 동일한 방식으로 고장 날 수 있지만, 명확한 오류 메시지를 내지 않는 미묘한 이상 증상도 발생할 수 있습니다.

이 섹션은 AI 워크로드를 모니터링하는 마인드셋을 구축하는 데 도움이 되어, 이상 징후가 있을 때 어디를 살펴봐야 하는지 알려줍니다.

### 에이전트 상태가 전통적 앱 상태와 다른 점

전통적 앱은 동작하거나 그렇지 않거나 두 가지 상태 중 하나입니다. AI 에이전트는 작동하는 것처럼 보여도 부정확한 결과를 낼 수 있습니다. 에이전트 상태를 두 가지 계층으로 나누어 생각하세요:

| 계층 | 관찰 대상 | 어디서 확인할지 |
|-------|------------|-----------------|
| **인프라 상태** | 서비스가 실행 중인지? 리소스가 프로비저닝되었는지? 엔드포인트가 접근 가능한지? | `azd monitor`, Azure 포털 리소스 상태, 컨테이너/앱 로그 |
| **행동 상태** | 에이전트가 정확히 응답하는지? 응답 속도는 적절한지? 모델이 올바르게 호출되는지? | Application Insights 추적, 모델 호출 지연 시간 지표, 응답 품질 로그 |

인프라 상태는 익숙한 개념으로, 모든 azd 앱에서 동일합니다. 행동 상태는 AI 워크로드가 새롭게 도입한 계층입니다.

### AI 앱이 예상과 다르게 동작할 때 점검 위치

AI 애플리케이션이 기대한 결과를 내지 않을 경우, 개념적 점검 리스트는 다음과 같습니다:

1. **기본부터 시작하세요.** 앱이 실행 중인지? 의존성에 접근 가능한지? 다른 앱 점검하듯 `azd monitor`와 리소스 상태를 확인하세요.  
2. **모델 연결 상태를 점검하세요.** 애플리케이션이 AI 모델을 정상적으로 호출하는지? 모델 호출 실패나 타임아웃은 AI 앱 문제의 가장 흔한 원인이며 앱 로그에 나타납니다.  
3. **모델에 전달된 입력을 보세요.** AI 응답은 입력(프롬프트 및 가져온 컨텍스트)에 따라 달라집니다. 출력이 잘못됐다면 입력이 잘못됐을 가능성이 높습니다. 애플리케이션이 올바른 데이터를 모델에 보내는지 확인하세요.  
4. **응답 지연 시간을 검토하세요.** AI 모델 호출은 일반 API 호출보다 느립니다. 앱이 느리다고 느껴진다면 모델 응답 시간이 늘었는지 확인하세요. 이는 쓰로틀링, 용량 한계, 지역별 혼잡을 의미할 수 있습니다.  
5. **비용 신호를 관찰하세요.** 예상치 못한 토큰 사용량 급증이나 API 호출 증가는 무한 루프, 잘못된 프롬프트 구성, 과도한 재시도 등을 암시할 수 있습니다.

즉시 관측 도구를 마스터할 필요는 없습니다. 핵심은 AI 앱에 모니터링해야 할 행동 계층이 추가로 존재한다는 점이며, azd의 내장 모니터링(`azd monitor`)이 두 계층 모두를 조사할 출발점 역할을 해준다는 것입니다.

---

## 보안 모범 사례

### 1. 제로 트러스트 보안 모델

**구현 전략**:  
- 인증 없는 서비스 간 통신 금지  
- 모든 API 호출에 관리형 ID 사용  
- 프라이빗 엔드포인트로 네트워크 격리  
- 최소 권한 접근 제어  

```bicep
// Managed Identity for each service
resource chatServiceIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'chat-service-identity'
  location: location
}

// Role assignments with minimal permissions
resource openAIUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, chatServiceIdentity.id, openAIUserRoleDefinitionId)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: chatServiceIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### 2. 안전한 시크릿 관리

**Key Vault 통합 패턴**:

```bicep
// Key Vault with proper access policies
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'premium'  // Use premium for production
    }
    enableRbacAuthorization: true  // Use RBAC instead of access policies
    enablePurgeProtection: true    // Prevent accidental deletion
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
  }
}

// Store all AI service credentials
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
    attributes: {
      enabled: true
    }
  }
}
```

### 3. 네트워크 보안

**프라이빗 엔드포인트 구성**:

```bicep
// Virtual Network for AI services
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'ai-services-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
      {
        name: 'app-services-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'Microsoft.Web/serverFarms'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private endpoints for all AI services
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

## 성능 및 확장성

### 1. 자동 확장 전략

**컨테이너 앱 자동 확장**:

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
        transport: 'http'
      }
    }
    template: {
      scale: {
        minReplicas: 2  // Always have 2 instances minimum
        maxReplicas: 50 // Scale up to 50 for high load
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '20'  // Scale when >20 concurrent requests
              }
            }
          }
          {
            name: 'cpu-scaling'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'  // Scale when CPU >70%
              }
            }
          }
        ]
      }
    }
  }
}
```

### 2. 캐싱 전략

**AI 응답을 위한 Redis 캐시**:

```bicep
// Redis Premium for production workloads
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Premium'
      family: 'P'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
    redisConfiguration: {
      'maxmemory-policy': 'allkeys-lru'
    }
    // Enable clustering for high availability
    redisVersion: '6.0'
    shardCount: 2
  }
}

// Cache configuration in application
var cacheConnectionString = '${redisCache.properties.hostName}:6380,password=${redisCache.listKeys().primaryKey},ssl=True,abortConnect=False'
```

### 3. 로드 밸런싱 및 트래픽 관리

**WAF가 포함된 Application Gateway**:

```bicep
// Application Gateway with Web Application Firewall
resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: appGatewayName
  location: location
  properties: {
    sku: {
      name: 'WAF_v2'
      tier: 'WAF_v2'
      capacity: 2
    }
    webApplicationFirewallConfiguration: {
      enabled: true
      firewallMode: 'Prevention'
      ruleSetType: 'OWASP'
      ruleSetVersion: '3.2'
    }
    // Backend pools for AI services
    backendAddressPools: [
      {
        name: 'ai-services-pool'
        properties: {
          backendAddresses: [
            {
              fqdn: '${containerApp.properties.configuration.ingress.fqdn}'
            }
          ]
        }
      }
    ]
  }
}
```

## 💰 비용 최적화

### 1. 리소스 적정 크기 설정

**환경별 구성**:

```bash
# 개발 환경
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# 운영 환경
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. 비용 모니터링 및 예산 관리

```bicep
// Cost management and budgets
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 2000  // $2000 monthly budget
    category: 'Cost'
    notifications: {
      warning: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'finance@company.com'
          'engineering@company.com'
        ]
        contactRoles: [
          'Owner'
          'Contributor'
        ]
      }
      critical: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 95
        contactEmails: [
          'cto@company.com'
        ]
      }
    }
  }
}
```

### 3. 토큰 사용 최적화

**OpenAI 비용 관리**:

```typescript
// 애플리케이션 레벨 토큰 최적화
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // 사용자 입력이 아닌 컨텍스트 잘라내기
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // 대략적인 추정: 1 토큰 ≈ 4자
    return Math.ceil(text.length / 4);
  }
}
```

## 모니터링 및 가시성

### 1. 종합 Application Insights

```bicep
// Application Insights with advanced features
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    SamplingPercentage: 100  // Full sampling for AI apps
    DisableIpMasking: false  // Enable for security
  }
}

// Custom metrics for AI operations
resource aiMetricAlerts 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'ai-high-error-rate'
  location: 'global'
  properties: {
    description: 'Alert when AI service error rate is high'
    severity: 2
    enabled: true
    scopes: [
      applicationInsights.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'high-error-rate'
          metricName: 'requests/failed'
          operator: 'GreaterThan'
          threshold: 10
          timeAggregation: 'Count'
        }
      ]
    }
  }
}
```

### 2. AI 전용 모니터링

**AI 지표용 맞춤형 대시보드**:

```json
// Dashboard configuration for AI workloads
{
  "dashboard": {
    "name": "AI Application Monitoring",
    "tiles": [
      {
        "name": "OpenAI Request Volume",
        "query": "requests | where name contains 'openai' | summarize count() by bin(timestamp, 5m)"
      },
      {
        "name": "AI Response Latency",
        "query": "requests | where name contains 'openai' | summarize avg(duration) by bin(timestamp, 5m)"
      },
      {
        "name": "Token Usage",
        "query": "customMetrics | where name == 'openai_tokens_used' | summarize sum(value) by bin(timestamp, 1h)"
      },
      {
        "name": "Cost per Hour",
        "query": "customMetrics | where name == 'openai_cost' | summarize sum(value) by bin(timestamp, 1h)"
      }
    ]
  }
}
```

### 3. 상태 확인 및 가동 시간 모니터링

```bicep
// Application Insights availability tests
resource availabilityTest 'Microsoft.Insights/webtests@2022-06-15' = {
  name: 'ai-app-availability-test'
  location: location
  tags: {
    'hidden-link:${applicationInsights.id}': 'Resource'
  }
  properties: {
    SyntheticMonitorId: 'ai-app-availability-test'
    Name: 'AI Application Availability Test'
    Description: 'Tests AI application endpoints'
    Enabled: true
    Frequency: 300  // 5 minutes
    Timeout: 120    // 2 minutes
    Kind: 'ping'
    Locations: [
      {
        Id: 'us-east-2-azr'
      }
      {
        Id: 'us-west-2-azr'
      }
    ]
    Configuration: {
      WebTest: '''
        <WebTest Name="AI Health Check" 
                 Id="8d2de8d2-a2b0-4c2e-9a0d-8f9c9a0b8c8d" 
                 Enabled="True" 
                 CssProjectStructure="" 
                 CssIteration="" 
                 Timeout="120" 
                 WorkItemIds="" 
                 xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" 
                 Description="" 
                 CredentialUserName="" 
                 CredentialPassword="" 
                 PreAuthenticate="True" 
                 Proxy="default" 
                 StopOnError="False" 
                 RecordedResultFile="" 
                 ResultsLocale="">
          <Items>
            <Request Method="GET" 
                     Guid="a5f10126-e4cd-570d-961c-cea43999a200" 
                     Version="1.1" 
                     Url="${webApp.properties.defaultHostName}/health" 
                     ThinkTime="0" 
                     Timeout="120" 
                     ParseDependentRequests="True" 
                     FollowRedirects="True" 
                     RecordResult="True" 
                     Cache="False" 
                     ResponseTimeGoal="0" 
                     Encoding="utf-8" 
                     ExpectedHttpStatusCode="200" 
                     ExpectedResponseUrl="" 
                     ReportingName="" 
                     IgnoreHttpStatusCode="False" />
          </Items>
        </WebTest>
      '''
    }
  }
}
```

## 재해 복구 및 고가용성

### 1. 다중 지역 배포

```yaml
# azure.yaml - Multi-region configuration
name: ai-app-multiregion
services:
  api-primary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=eastus
  api-secondary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=westus2
```

```bicep
// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: trafficManagerProfileName
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: trafficManagerProfileName
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
      intervalInSeconds: 30
      toleratedNumberOfFailures: 3
      timeoutInSeconds: 10
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryAppService.id
          endpointStatus: 'Enabled'
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryAppService.id
          endpointStatus: 'Enabled'
          priority: 2
        }
      }
    ]
  }
}
```

### 2. 데이터 백업 및 복구

```bicep
// Backup configuration for critical data
resource backupVault 'Microsoft.DataProtection/backupVaults@2023-05-01' = {
  name: backupVaultName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    storageSettings: [
      {
        datastoreType: 'VaultStore'
        type: 'LocallyRedundant'
      }
    ]
  }
}

// Backup policy for AI models and data
resource backupPolicy 'Microsoft.DataProtection/backupVaults/backupPolicies@2023-05-01' = {
  parent: backupVault
  name: 'ai-data-backup-policy'
  properties: {
    policyRules: [
      {
        backupParameters: {
          backupType: 'Full'
          objectType: 'AzureBackupParams'
        }
        trigger: {
          schedule: {
            repeatingTimeIntervals: [
              'R/2024-01-01T02:00:00+00:00/P1D'  // Daily at 2 AM
            ]
          }
          objectType: 'ScheduleBasedTriggerContext'
        }
        dataStore: {
          datastoreType: 'VaultStore'
          objectType: 'DataStoreInfoBase'
        }
        name: 'BackupDaily'
        objectType: 'AzureBackupRule'
      }
    ]
  }
}
```

## DevOps 및 CI/CD 통합

### 1. GitHub Actions 워크플로우

```yaml
# .github/workflows/deploy-ai-app.yml
name: Deploy AI Application

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
          
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install pytest
          
      - name: Run tests
        run: pytest tests/
        
      - name: AI Safety Tests
        run: |
          python scripts/test_ai_safety.py
          python scripts/validate_prompts.py

  deploy-staging:
    needs: test
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Staging
        run: |
          azd env select staging
          azd deploy

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Production
        run: |
          azd env select production
          azd deploy
          
      - name: Run Production Health Checks
        run: |
          python scripts/health_check.py --env production
```

### 2. 인프라 검증

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# 모든 필수 서비스가 실행 중인지 확인
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI 모델 배포 검증
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI 서비스 연결 테스트
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## 프로덕션 준비 체크리스트

### 보안 ✅
- [ ] 모든 서비스는 관리형 ID 사용  
- [ ] 시크릿은 Key Vault에 저장  
- [ ] 프라이빗 엔드포인트 구성 완료  
- [ ] 네트워크 보안 그룹 구현  
- [ ] 최소 권한 RBAC 적용  
- [ ] 공개 엔드포인트에 WAF 적용  

### 성능 ✅
- [ ] 자동 확장 구성 완료  
- [ ] 캐싱 구현 완료  
- [ ] 로드 밸런싱 설정  
- [ ] 정적 콘텐츠 CDN 구성  
- [ ] 데이터베이스 연결 풀링  
- [ ] 토큰 사용 최적화  

### 모니터링 ✅
- [ ] Application Insights 구성  
- [ ] 맞춤형 지표 정의  
- [ ] 경고 규칙 설정  
- [ ] 대시보드 작성 완료  
- [ ] 상태 확인 구현  
- [ ] 로그 보존 정책  

### 안정성 ✅
- [ ] 다중 지역 배포  
- [ ] 백업 및 복구 계획  
- [ ] 회로 차단기 구현  
- [ ] 재시도 정책 구성  
- [ ] 우아한 서비스 저하  
- [ ] 상태 확인 엔드포인트  

### 비용 관리 ✅
- [ ] 예산 경고 설정  
- [ ] 리소스 적정 크기 설정  
- [ ] 개발/테스트 할인 적용  
- [ ] 예약 인스턴스 구매  
- [ ] 비용 모니터링 대시보드  
- [ ] 정기 비용 검토  

### 규제 준수 ✅
- [ ] 데이터 거주 요구사항 충족  
- [ ] 감사 로깅 활성화  
- [ ] 규정 준수 정책 적용  
- [ ] 보안 기준 구현  
- [ ] 정기 보안 평가  
- [ ] 사고 대응 계획  

## 성능 벤치마크

### 전형적인 프로덕션 지표

| 지표 | 목표치 | 모니터링 방법 |
|-------|---------|---------------|
| **응답 시간** | 2초 미만 | Application Insights |
| <strong>가용성</strong>   | 99.9% | 가동 시간 모니터링 |
| <strong>오류율</strong>   | 0.1% 미만 | 애플리케이션 로그 |
| **토큰 사용량** | 월 $500 미만 | 비용 관리 |
| **동시 사용자 수** | 1000명 이상 | 부하 테스트 |
| **복구 시간** | 1시간 미만 | 재해 복구 테스트 |

### 부하 테스트

```bash
# AI 애플리케이션용 부하 테스트 스크립트
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 커뮤니티 모범 사례

Microsoft Foundry Discord 커뮤니티 피드백 기반:

### 커뮤니티 주요 권장 사항:

1. **작게 시작하고 점진적 확장**: 기본 SKU로 시작해 실제 사용량에 따라 확장  
2. **모든 것 모니터링**: 시작부터 포괄적 모니터링 구축  
3. **보안 자동화**: 일관된 보안을 위한 인프라 코드 사용  
4. **철저한 테스트**: AI 전용 테스트 포함  
5. **비용 계획 수립**: 토큰 사용량 모니터링 및 조기 예산 경고 설정  

### 흔한 실수 방지:

- ❌ 코드 내 API 키 하드코딩  
- ❌ 적절한 모니터링 미구축  
- ❌ 비용 최적화 무시  
- ❌ 실패 시나리오 미테스트  
- ❌ 상태 확인 없이 배포  

## AZD AI CLI 명령과 확장

AZD는 프로덕션 AI 워크플로우를 간소화하는 AI 전용 명령과 확장 세트를 지속해서 추가 중입니다. 이 도구들은 로컬 개발과 프로덕션 배포 간 간극을 메워줍니다.

### AI용 AZD 확장

AZD는 확장 시스템을 통해 AI 전용 기능을 추가합니다. 확장 설치 및 관리는 다음과 같이 수행합니다:

```bash
# 사용 가능한 모든 확장 프로그램 나열 (AI 포함)
azd extension list

# Foundry 에이전트 확장 프로그램 설치
azd extension install azure.ai.agents

# 파인튜닝 확장 프로그램 설치
azd extension install azure.ai.finetune

# 맞춤형 모델 확장 프로그램 설치
azd extension install azure.ai.models

# 설치된 모든 확장 프로그램 업그레이드
azd extension upgrade --all
```

**사용 가능한 AI 확장:**

| 확장 | 목적 | 상태 |
|-------|----------|---------|
| `azure.ai.agents` | Foundry 에이전트 서비스 관리 | Preview |
| `azure.ai.finetune` | Foundry 모델 파인튜닝 | Preview |
| `azure.ai.models` | Foundry 커스텀 모델 | Preview |
| `azure.coding-agent` | 코딩 에이전트 구성 | 사용 가능 |

### `azd ai agent init`으로 에이전트 프로젝트 초기화

`azd ai agent init` 명령은 Microsoft Foundry Agent Service와 통합된 프로덕션 준비 AI 에이전트 프로젝트를 스캐폴딩합니다:

```bash
# 에이전트 매니페스트에서 새로운 에이전트 프로젝트 초기화
azd ai agent init -m <manifest-path-or-uri>

# 특정 Foundry 프로젝트 초기화 및 타겟팅
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 사용자 지정 소스 디렉토리로 초기화
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 호스트로서 컨테이너 앱 타겟팅
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**주요 플래그:**

| 플래그 | 설명 |
|--------|-------|
| `-m, --manifest` | 프로젝트에 추가할 에이전트 매니페스트의 경로나 URI |
| `-p, --project-id` | azd 환경의 기존 Microsoft Foundry 프로젝트 ID |
| `-s, --src` | 에이전트 정의를 다운로드할 디렉터리 (기본값: `src/<agent-id>`) |
| `--host` | 기본 호스트 재정의 (예: `containerapp`) |
| `-e, --environment` | 사용할 azd 환경 |

**프로덕션 팁**: `--project-id`를 사용해 기존 Foundry 프로젝트에 직접 연결하면 에이전트 코드와 클라우드 리소스를 처음부터 연동 상태로 유지할 수 있습니다.

### `azd mcp`와 모델 컨텍스트 프로토콜(MCP)

AZD는 AI 에이전트 및 도구가 Azure 리소스와 표준화된 프로토콜로 상호작용할 수 있게 MCP 서버 지원(알파)을 내장하고 있습니다:

```bash
# 프로젝트를 위한 MCP 서버를 시작하십시오
azd mcp start

# MCP 작업을 위한 도구 동의 관리
azd mcp consent
```

MCP 서버는 azd 프로젝트 컨텍스트—환경, 서비스, Azure 리소스—를 AI 지원 개발 도구에 노출합니다. 이를 통해:

- **AI 지원 배포**: 코딩 에이전트가 프로젝트 상태를 쿼리하고 배포를 실행하게 할 수 있음  
- **리소스 탐색**: AI 도구가 프로젝트가 사용하는 Azure 리소스를 발견 가능  
- **환경 관리**: 에이전트가 개발/스테이징/프로덕션 환경 간 전환 가능  

### `azd infra generate`로 인프라 생성

프로덕션 AI 워크로드를 위해 자동 프로비저닝 대신 인프라 코드를 생성 및 사용자 지정할 수 있습니다:

```bash
# 프로젝트 정의로부터 Bicep/Terraform 파일을 생성합니다
azd infra generate
```

이는 IaC를 디스크에 작성해 다음을 가능하게 합니다:  
- 배포 전 인프라 검토 및 감사  
- 맞춤 보안 정책 추가 (네트워크 규칙, 프라이빗 엔드포인트)  
- 기존 IaC 검토 프로세스와 통합  
- 애플리케이션 코드와 별도로 인프라 변경 사항 버전 관리  

### 프로덕션 수명주기 훅

AZD 훅을 사용하면 배포 수명주기 각 단계에서 사용자 지정 로직을 삽입할 수 있습니다—프로덕션 AI 워크플로우에 필수적입니다:

```yaml
# azure.yaml - Production hooks example
name: ai-production-app
hooks:
  preprovision:
    shell: sh
    run: scripts/validate-quotas.sh    # Check AI model quota before provisioning
  postprovision:
    shell: sh
    run: scripts/configure-networking.sh  # Set up private endpoints
  predeploy:
    shell: sh
    run: scripts/run-ai-safety-tests.sh  # Run prompt safety checks
  postdeploy:
    shell: sh
    run: scripts/smoke-test.sh           # Verify agent responses post-deploy
services:
  agent-api:
    project: ./src/agent
    host: containerapp
    hooks:
      predeploy:
        shell: sh
        run: scripts/validate-model-access.sh  # Per-service hook
```

```bash
# 개발 중에 특정 후크를 수동으로 실행하십시오
azd hooks run predeploy
```

**AI 워크로드용 권장 프로덕션 훅:**

| 훅 | 사용 사례 |
|-----|----------|
| `preprovision` | AI 모델 용량을 위한 구독 쿼터 검증 |
| `postprovision` | 프라이빗 엔드포인트 구성, 모델 가중치 배포 |
| `predeploy` | AI 안전 테스트 실행, 프롬프트 템플릿 검증 |
| `postdeploy` | 에이전트 응답 스모크 테스트, 모델 연결 확인 |

### CI/CD 파이프라인 구성

`azd pipeline config`를 통해 프로젝트를 GitHub Actions 또는 Azure Pipelines에 안전한 Azure 인증과 함께 연결하세요:

```bash
# CI/CD 파이프라인 구성 (대화형)
azd pipeline config

# 특정 공급자로 구성하기
azd pipeline config --provider github
```

이 명령은:  
- 최소 권한 액세스 권한을 가진 서비스 주체 생성  
- 연합된 자격 증명 구성 (저장된 비밀 없음)  
- 파이프라인 정의 파일 생성 또는 업데이트  
- CI/CD 시스템에 필요한 환경 변수 설정  

**프로덕션 워크플로우 파이프라인 구성:**  

```bash
# 1. 프로덕션 환경 설정
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. 파이프라인 구성
azd pipeline config --provider github

# 3. 파이프라인은 main에 푸시할 때마다 azd 배포를 실행합니다
```

### `azd add`로 구성 요소 추가

기존 프로젝트에 Azure 서비스를 점진적으로 추가하세요:

```bash
# 새 서비스 구성 요소를 대화형으로 추가하기
azd add
```

이 방법은 프로덕션 AI 애플리케이션을 확장할 때 특히 유용합니다—예를 들어 벡터 검색 서비스, 새 에이전트 엔드포인트, 모니터링 구성 요소 등을 기존 배포에 추가할 때 적합합니다.

## 추가 자료
- **Azure Well-Architected Framework**: [AI 작업 부하 지침](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [공식 문서](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure 샘플](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure 채널](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, 배포, 비용 최적화 및 진단을 위한 37개 공개 에이전트 기술. 에디터에 설치:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**챕터 탐색:**
- **📚 코스 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 8장 - 프로덕션 및 엔터프라이즈 패턴
- **⬅️ 이전 챕터**: [7장: 문제 해결](../chapter-07-troubleshooting/debugging.md)
- **⬅️ 관련 자료**: [AI 워크숍 랩](ai-workshop-lab.md)
- **� 코스 완료**: [초보자를 위한 AZD](../../README.md)

<strong>기억하세요</strong>: 프로덕션 AI 작업 부하는 신중한 계획, 모니터링 및 지속적인 최적화가 필요합니다. 이 패턴부터 시작하여 특정 요구 사항에 맞게 조정하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의해 주시기 바랍니다. 원본 문서는 해당 언어의 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 사람 번역을 권장합니다. 이 번역 사용으로 인한 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->