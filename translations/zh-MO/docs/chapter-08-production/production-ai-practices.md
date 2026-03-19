# Production AI Workload Best Practices with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD For Beginners](../../README.md)

## Overview

本指南提供使用 Azure Developer CLI (AZD) 部署生產就緒 AI 工作負載的完整最佳實務。根據 Microsoft Foundry Discord 社群的反饋與真實客戶部署經驗，這些實務針對生產 AI 系統中最常見的挑戰。

## Key Challenges Addressed

根據我們的社群投票結果，以下是開發人員面對的主要挑戰：

- **45%** 在多服務 AI 部署上遇到困難
- **38%** 在認證與機密管理上有問題  
- **35%** 覺得生產就緒與擴展困難
- **32%** 需要更好的成本最佳化策略
- **29%** 需要改進監控與故障排除

## Architecture Patterns for Production AI

### Pattern 1: Microservices AI Architecture

**When to use**: 複雜且具有多種功能的 AI 應用程式

```mermaid
graph TD
    Frontend[網頁前端] --- Gateway[API 網關] --- LB[負載平衡器]
    Gateway --> Chat[聊天服務]
    Gateway --> Image[影像服務]
    Gateway --> Text[文字服務]
    Chat --> OpenAI[微軟 Foundry 模型]
    Image --> Vision[電腦視覺]
    Text --> DocIntel[文件智能]
```
**AZD Implementation**：

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

### Pattern 2: Event-Driven AI Processing

**When to use**: 批次處理、文件分析、非同步工作流程

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

## Thinking About AI Agent Health

當傳統的網頁應用程式發生故障時，症狀通常很熟悉：頁面無法載入、API 回傳錯誤，或部署失敗。AI 驅動的應用程式也會以相同方式出錯——但它們也可能以較為微妙的方式異常運作，而不會產生明顯的錯誤訊息。

本節協助你建立監控 AI 工作負載的心智模型，讓你在情況異常時知道該從哪裡著手檢查。

### How Agent Health Differs from Traditional App Health

傳統應用程式要麼運作，要麼不運作。AI 代理可能看似運作，但輸出結果不佳。可將代理健康視為兩層：

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | 服務是否在運行？資源是否已佈建？端點是否可達？ | `azd monitor`, Azure Portal 資源健康, container/app logs |
| **Behavior health** | 代理是否回應準確？回應是否及時？模型是否被正確呼叫？ | Application Insights 跟蹤、模型呼叫延遲指標、回應品質日誌 |

基礎設施健康是熟悉的——對任何 azd 應用都是相同的。行為健康是 AI 工作負載引入的新層面。

### Where to Look When AI Apps Don't Behave as Expected

如果你的 AI 應用程式沒有產生預期結果，這裡有一份概念性檢查清單：

1. **先從基本項目開始。** 應用程式是否在運行？是否能連到相依服務？像檢查任何應用程式一樣，先查看 `azd monitor` 和資源健康狀態。
2. **檢查模型連線。** 應用程式是否成功呼叫 AI 模型？失敗或逾時的模型呼叫是 AI 應用問題最常見的原因，通常會出現在應用日誌中。
3. **查看模型收到的內容。** AI 回應取決於輸入（提示和任何檢索到的上下文）。若輸出錯誤，通常是輸入有問題。檢查應用程式是否把正確的資料送到模型。
4. **檢閱回應延遲。** AI 模型呼叫比一般 API 呼叫慢。若應用程式感覺遲緩，檢查模型回應時間是否增加——這可能表示被節流、容量限制或區域性擁塞。
5. **注意成本訊號。** 代幣使用量或 API 呼叫的意外激增，可能表示循環、錯誤設定的提示，或過度重試。

你不需要立即精通所有可觀察性工具。關鍵重點是：AI 應用程式多了一層行為需要監控，而 azd 的內建監控（`azd monitor`）為調查這兩層提供了起點。

---

## Security Best Practices

### 1. Zero-Trust Security Model

**Implementation Strategy**：
- 無經過驗證不允許服務間通訊
- 所有 API 呼叫使用受管身分識別（managed identities）
- 使用私人端點進行網路隔離
- 最小權限存取控制

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

### 2. Secure Secret Management

**Key Vault Integration Pattern**：

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

### 3. Network Security

**Private Endpoint Configuration**：

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

## Performance and Scaling

### 1. Auto-Scaling Strategies

**Container Apps Auto-scaling**：

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

### 2. Caching Strategies

**Redis Cache for AI Responses**：

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

### 3. Load Balancing and Traffic Management

**Application Gateway with WAF**：

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

## 💰 Cost Optimization

### 1. Resource Right-Sizing

**Environment-Specific Configurations**：

```bash
# 開發環境
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# 生產環境
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Cost Monitoring and Budgets

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

### 3. Token Usage Optimization

**OpenAI Cost Management**：

```typescript
// 應用程式層級的詞元優化
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // 截斷上下文，而非用戶輸入
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // 粗略估算：1 個詞元 ≈ 4 個字元
    return Math.ceil(text.length / 4);
  }
}
```

## Monitoring and Observability

### 1. Comprehensive Application Insights

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

### 2. AI-Specific Monitoring

**Custom Dashboards for AI Metrics**：

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

### 3. Health Checks and Uptime Monitoring

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

## Disaster Recovery and High Availability

### 1. Multi-Region Deployment

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

### 2. Data Backup and Recovery

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

## DevOps and CI/CD Integration

### 1. GitHub Actions Workflow

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

### 2. Infrastructure Validation

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# 檢查所有所需服務是否正在執行
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# 驗證 OpenAI 模型部署
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# 測試 AI 服務的連線
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Production Readiness Checklist

### Security ✅
- [ ] 所有服務使用受管身分識別
- [ ] 機密儲存在 Key Vault
- [ ] 已設定私人端點
- [ ] 已實作網路安全群組
- [ ] 使用最小權限的 RBAC
- [ ] 對公共端點啟用 WAF

### Performance ✅
- [ ] 已設定自動擴充
- [ ] 已實作快取
- [ ] 已設定負載平衡
- [ ] 靜態內容使用 CDN
- [ ] 資料庫連線池化
- [ ] 代幣使用優化

### Monitoring ✅
- [ ] 已設定 Application Insights
- [ ] 已定義自訂指標
- [ ] 已設定警示規則
- [ ] 已建立儀表板
- [ ] 已實作健康檢查
- [ ] 已設定日誌保留政策

### Reliability ✅
- [ ] 多區域部署
- [ ] 已有備份與復原計劃
- [ ] 已實作斷路器（circuit breakers）
- [ ] 已設定重試策略
- [ ] 優雅降級
- [ ] 健康檢查端點

### Cost Management ✅
- [ ] 已設定預算警示
- [ ] 已調整資源規模
- [ ] 已套用開發/測試折扣
- [ ] 已購買預留執行個體
- [ ] 已建立成本監控儀表板
- [ ] 定期檢視成本

### Compliance ✅
- [ ] 滿足資料駐留要求
- [ ] 啟用稽核日誌
- [ ] 已套用合規性政策
- [ ] 已實作安全基準
- [ ] 定期安全評估
- [ ] 事件回應計劃

## Performance Benchmarks

### Typical Production Metrics

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### Load Testing

```bash
# 用於 AI 應用程式的負載測試腳本
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Community Best Practices

根據 Microsoft Foundry Discord 社群的回饋：

### Top Recommendations from the Community:

1. **Start Small, Scale Gradually**：從基本的 SKU 開始，根據實際使用情況再擴充
2. **Monitor Everything**：從第一天起就建立全面的監控
3. **Automate Security**：使用基礎設施即程式碼來確保一致性的安全性
4. **Test Thoroughly**：在你的管線中加入 AI 專屬測試
5. **Plan for Costs**：監控代幣使用並及早設定預算警示

### Common Pitfalls to Avoid:

- ❌ 在程式碼中硬編 API 金鑰
- ❌ 未設定適當的監控
- ❌ 忽視成本最佳化
- ❌ 未測試失敗情境
- ❌ 未部署健康檢查便上線

## AZD AI CLI Commands and Extensions

AZD 包含越來越多的 AI 專屬指令與擴充，可簡化生產 AI 工作流程。這些工具彌合了本地開發與 AI 工作負載的生產部署之間的差距。

### AZD Extensions for AI

AZD 使用擴充系統來加入 AI 專屬功能。使用以下指令安裝與管理擴充：

```bash
# 列出所有可用擴充套件（包括 AI）
azd extension list

# 安裝 Foundry agents 擴充套件
azd extension install azure.ai.agents

# 安裝微調擴充套件
azd extension install azure.ai.finetune

# 安裝自訂模型擴充套件
azd extension install azure.ai.models

# 升級所有已安裝的擴充套件
azd extension upgrade --all
```

**Available AI extensions:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent Service management | Preview |
| `azure.ai.finetune` | Foundry model fine-tuning | Preview |
| `azure.ai.models` | Foundry custom models | Preview |
| `azure.coding-agent` | Coding agent configuration | Available |

### Initializing Agent Projects with `azd ai agent init`

`azd ai agent init` 指令會為 Microsoft Foundry Agent Service 整合的生產就緒 AI 代理專案建立範本：

```bash
# 從代理程式清單初始化一個新的代理專案
azd ai agent init -m <manifest-path-or-uri>

# 初始化並指定目標為特定 Foundry 專案
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 使用自訂來源目錄初始化
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 以 Container Apps 作為主機
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Key flags:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | 要新增到專案的代理清單檔案路徑或 URI |
| `-p, --project-id` | 用於你的 azd 環境的現有 Microsoft Foundry 專案 ID |
| `-s, --src` | 下載代理定義的目錄（預設為 `src/<agent-id>`） |
| `--host` | 覆寫預設主機（例如：`containerapp`） |
| `-e, --environment` | 要使用的 azd 環境 |

**Production tip**：使用 `--project-id` 可直接連接到現有的 Foundry 專案，讓你的代理程式碼與雲端資源從一開始就保持連結。

### Model Context Protocol (MCP) with `azd mcp`

AZD 包含內建的 MCP 伺服器支援（Alpha），讓 AI 代理與工具能透過標準化協議與你的 Azure 資源互動：

```bash
# 為你的專案啟動 MCP 伺服器
azd mcp start

# 管理工具對 MCP 操作的同意權限
azd mcp consent
```

MCP 伺服器會對外暴露你的 azd 專案上下文——環境、服務與 Azure 資源——給 AI 驅動的開發工具。這可實現：

- **AI-assisted deployment**：讓程式編寫代理查詢你的專案狀態並觸發部署
- **Resource discovery**：AI 工具可發現你的專案使用了哪些 Azure 資源
- **Environment management**：代理可以在 dev/staging/production 環境之間切換

### Infrastructure Generation with `azd infra generate`

針對生產 AI 工作負載，你可以產生並自訂基礎設施即程式碼，而不是依賴自動佈建：

```bash
# 從你的專案定義產生 Bicep/Terraform 檔案
azd infra generate
```

此命令會將 IaC 寫入磁碟，讓你可以：
- 在部署前審查與稽核基礎設施
- 新增自訂安全政策（網路規則、私人端點）
- 整合到現有的 IaC 審核流程
- 將基礎設施變更與應用程式程式碼分別做版本控制

### Production Lifecycle Hooks

AZD hooks 讓你在部署生命週期的每個階段注入自訂邏輯——這對生產 AI 工作流程至關重要：

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
# 在開發期間手動執行特定的鉤子
azd hooks run predeploy
```

**Recommended production hooks for AI workloads:**

| Hook | Use Case |
|------|----------|
| `preprovision` | 驗證 AI 模型容量的訂閱配額 |
| `postprovision` | 設定私人端點、部署模型權重 |
| `predeploy` | 執行 AI 安全測試、驗證提示範本 |
| `postdeploy` | 對代理回應做冒煙測試、驗證模型連通性 |

### CI/CD Pipeline Configuration

使用 `azd pipeline config` 將你的專案連接到 GitHub Actions 或 Azure Pipelines，並配置安全的 Azure 驗證：

```bash
# 設定 CI/CD 流程（互動式）
azd pipeline config

# 使用特定的供應商進行設定
azd pipeline config --provider github
```

此命令會：
- 建立具有最小權限的 service principal
- 配置聯合認證（無需儲存秘密）
- 產生或更新你的管線定義檔
- 在你的 CI/CD 系統中設定所需的環境變數

**Production workflow with pipeline config：**

```bash
# 1. 設定生產環境
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. 設定管線
azd pipeline config --provider github

# 3. 管線在每次推送到 main 分支時執行 azd deploy
```

### Adding Components with `azd add`

逐步將 Azure 服務新增到現有專案：

```bash
# 以互動方式新增一個服務元件
azd add
```

這對擴展生產 AI 應用特別有用——例如，向現有部署新增向量搜尋服務、新的代理端點，或監控元件。

## Additional Resources
- **Azure Well-Architected Framework**: [AI 工作負載指引](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure 範例](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure 頻道](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure 在 skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個開放的 agent 技能，適用於 Azure AI、Foundry、部署、成本最佳化和診斷。 在您的編輯器中安裝：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD 新手入門](../../README.md)
- **📖 Current Chapter**: 第 8 章 - 生產與企業範式
- **⬅️ Previous Chapter**: [第7章：疑難排解](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI 工作坊實驗室](ai-workshop-lab.md)
- **� 課程完成**: [AZD 新手入門](../../README.md)

<strong>記住</strong>: 生產環境的 AI 工作負載需要謹慎規劃、監控，並持續優化。從這些模式開始，並將它們調整以符合您特定的需求。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。儘管我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為具權威性的來源。若涉及重要資訊，建議採用專業人工翻譯。我們不會對因使用本翻譯而導致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->