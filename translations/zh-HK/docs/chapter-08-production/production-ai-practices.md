# 使用 AZD 的生產 AI 工作負載最佳實踐

**章節導航：**
- **📚 課程主頁**: [AZD 入門](../../README.md)
- **📖 當前章節**: 第8章 - 生產 & 企業模式
- **⬅️ 上一章節**: [第7章：疑難排解](../chapter-07-troubleshooting/debugging.md)
- **⬅️ 相關章節**: [AI 工作坊實驗室](ai-workshop-lab.md)
- **🎯 課程完成**: [AZD 入門](../../README.md)

## 概述

本指南提供使用 Azure Developer CLI (AZD) 部署生產級 AI 工作負載的全面最佳實踐。這些實踐根據 Microsoft Foundry Discord 社群反饋及真實客戶部署經驗，解決生產 AI 系統中最常見的挑戰。

## 主要挑戰

根據我們的社群調查結果，開發者面對的主要挑戰如下：

- **45%** 面對多服務 AI 部署的困難  
- **38%** 遇到認證和機密管理問題  
- **35%** 發現生產準備和擴展具挑戰性  
- **32%** 需要更好的成本優化策略  
- **29%** 需要改善監控和故障排除  

## 生產 AI 架構模式

### 模式 1：微服務 AI 架構

<strong>使用時機</strong>：具多功能的複雜 AI 應用

```mermaid
graph TD
    Frontend[網頁前端] --- Gateway[API 閘道] --- LB[負載平衡器]
    Gateway --> Chat[聊天服務]
    Gateway --> Image[圖像服務]
    Gateway --> Text[文本服務]
    Chat --> OpenAI[微軟 Foundry 模型]
    Image --> Vision[電腦視覺]
    Text --> DocIntel[文件智能]
```
**AZD 實作**：

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

### 模式 2：事件驅動 AI 處理

<strong>使用時機</strong>：批次處理、文件分析、非同步工作流程

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

## 思考 AI Agent 健康狀態

當傳統網頁應用程式發生故障時，症狀通常熟悉：頁面無法載入、API 回傳錯誤，或部署失敗。AI 驅動的應用也會出現這些情況，但還會表現出更微妙的異常，沒有明顯錯誤訊息。

本節協助你建立監控 AI 工作負載的心智模型，讓你在狀況異常時知道該從哪裡開始檢查。

### Agent 健康狀態與傳統應用健康的差異

傳統應用要嘛運作，要嘛不運作。AI agent 可能看似運作，卻輸出差的結果。將 agent 健康分為兩層：

| 層級 | 監控重點 | 查看位置 |
|-------|--------------|---------------|
| <strong>基礎設施健康</strong> | 服務是否執行？資源是否佈建？端點是否可達？ | `azd monitor`、Azure 入口網站資源狀態、容器/應用日誌 |
| <strong>行為健康</strong> | agent 回應是否準確？回應是否及時？模型呼叫是否正確？ | Application Insights 跟蹤記錄、模型呼叫延遲指標、回應品質日誌 |

基礎設施健康是常識，對任何 azd 應用皆相同。行為健康則是 AI 工作負載新增的層級。

### AI 應用異常時應檢查的重點

如果 AI 應用未產生預期結果，這是一個概念性檢查清單：

1. <strong>從基礎開始</strong>。應用是否啟動？是否能存取其依賴的資源？檢查 `azd monitor` 及資源健康狀態，就如同對一般應用所進行的檢查。
2. <strong>檢查模型連線</strong>。應用是否成功呼叫 AI 模型？模型呼叫失敗或超時是 AI 應用問題最常見的原因，會在應用日誌中出現。
3. <strong>查看模型收到的輸入</strong>。AI 回應依賴輸入（提示及檢索到的上下文）。若輸出錯誤，輸入通常有誤。檢查應用是否傳送正確資料給模型。
4. <strong>檢視回應延遲</strong>。AI 模型呼叫比一般 API 呼叫慢。如應用感覺遲鈍，檢查模型回應時間是否增加——這可能代表限制、容量上限或區域擁堵。
5. <strong>留意成本訊號</strong>。代幣使用或 API 呼叫異常激增，可能表示迴圈、提示設定錯誤或過度重試。

不需一開始就精通可觀察性工具。關鍵是 AI 應用多了「行為」監控層，azd 內建監控 (`azd monitor`) 提供你調查這兩層的起點。

---

## 安全最佳實踐

### 1. 零信任安全模型

<strong>實施策略</strong>：
- 所有服務通信皆需認證
- 全部 API 呼叫使用管理身份
- 透過私有端點進行網路隔離
- 採用最小權限存取控制

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

### 2. 安全機密管理

**Key Vault 整合模式**：

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

### 3. 網路安全

<strong>私有端點配置</strong>：

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

## 效能與擴展

### 1. 自動擴展策略

<strong>容器應用自動擴展</strong>：

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

### 2. 快取策略

**使用 Redis 快取 AI 回應**：

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

### 3. 負載平衡與流量管理

**帶有 WAF 的應用閘道**：

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

## 💰 成本優化

### 1. 資源適當規模化

<strong>環境特定配置</strong>：

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

### 2. 成本監控和預算管理

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

### 3. 代幣使用優化

**OpenAI 成本管理**：

```typescript
// 應用層級令牌優化
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
    // 粗略估算：1 個令牌 ≈ 4 個字元
    return Math.ceil(text.length / 4);
  }
}
```

## 監控與可觀察性

### 1. 全面性的 Application Insights

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

### 2. AI 專用監控

**AI 指標自訂儀表板**：

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

### 3. 健康檢查和正常運作時間監控

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

## 災難復原與高可用性

### 1. 多區域部署

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

### 2. 資料備份與復原

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

## DevOps 與 CI/CD 整合

### 1. GitHub Actions 工作流程

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

### 2. 基礎設施驗證

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# 檢查所有必需服務是否正在運行
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

# 測試 AI 服務連接性
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## 生產準備核對清單

### 安全 ✅
- [ ] 所有服務使用管理身份
- [ ] 機密存於 Key Vault
- [ ] 配置私有端點
- [ ] 網路安全群組實作
- [ ] 使用最小權限角色基礎存取控制 (RBAC)
- [ ] 公開端點啟用 WAF

### 效能 ✅
- [ ] 配置自動擴展
- [ ] 實作快取
- [ ] 設置負載平衡
- [ ] 靜態內容使用 CDN
- [ ] 資料庫連線池
- [ ] 代幣使用優化

### 監控 ✅
- [ ] 配置 Application Insights
- [ ] 定義自訂指標
- [ ] 設定警示規則
- [ ] 創建儀表板
- [ ] 實作健康檢查
- [ ] 日誌保留政策

### 可靠性 ✅
- [ ] 多區域部署
- [ ] 備份及復原計劃
- [ ] 實作斷路器
- [ ] 配置重試政策
- [ ] 平滑降級
- [ ] 健康檢查端點

### 成本管理 ✅
- [ ] 配置預算警示
- [ ] 資源適當規模化
- [ ] 應用開發/測試折扣
- [ ] 購買預留實例
- [ ] 成本監控儀表板
- [ ] 定期成本審查

### 合規性 ✅
- [ ] 遵守資料所在地要求
- [ ] 啟用稽核日誌
- [ ] 實施合規政策
- [ ] 實作安全基準
- [ ] 定期安全評估
- [ ] 制定事件回應計劃

## 效能基準

### 典型生產指標

| 指標 | 目標 | 監控工具 |
|--------|--------|------------|
| <strong>回應時間</strong> | < 2 秒 | Application Insights |
| <strong>可用性</strong> | 99.9% | 正常運作時間監控 |
| <strong>錯誤率</strong> | < 0.1% | 應用日誌 |
| <strong>代幣使用</strong> | < $500/月 | 成本管理 |
| <strong>同時使用者數</strong> | 1000+ | 負載測試 |
| <strong>復原時間</strong> | < 1 小時 | 災難復原測試 |

### 負載測試

```bash
# 用於人工智能應用的負載測試腳本
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 社群最佳實踐

根據 Microsoft Foundry Discord 社群意見回饋：

### 社群頂尖推薦：

1. **從小做起，逐步擴展**：從基本 SKU 開始，根據實際使用調整規模  
2. <strong>全面監控</strong>：從第1天起建立完整監控  
3. <strong>自動化安全管理</strong>：使用基礎設施即代碼確保安全一致性  
4. <strong>徹底測試</strong>：將 AI 專屬測試納入流程  
5. <strong>成本規劃</strong>：提前監控代幣使用並設定預算警示  

### 常見避雷：

- ❌ 在程式碼中硬編 API 金鑰  
- ❌ 未設置恰當監控  
- ❌ 忽視成本優化  
- ❌ 不測試失敗場景  
- ❌ 未設健康檢查即部署  

## AZD AI CLI 指令與擴展

AZD 包含越來越多 AI 專用指令和擴展，助你簡化生產 AI 工作流程。這些工具彌補本地開發與生產部署間的鴻溝。

### AI 專用 AZD 擴展

AZD 使用擴展系統來新增 AI 專屬功能。可透過以下指令安裝及管理擴展：

```bash
# 列出所有可用的擴充功能（包括人工智能）
azd extension list

# 安裝 Foundry agents 擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 升級所有已安裝的擴充功能
azd extension upgrade --all
```

**可用 AI 擴展：**

| 擴展 | 用途 | 狀態 |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent 服務管理 | 預覽版 |
| `azure.ai.finetune` | Foundry 模型微調 | 預覽版 |
| `azure.ai.models` | Foundry 自訂模型 | 預覽版 |
| `azure.coding-agent` | 程式碼編輯代理配置 | 可用 |

### 使用 `azd ai agent init` 初始化 Agent 專案

`azd ai agent init` 指令可建立與 Microsoft Foundry Agent 服務整合的生產級 AI agent 專案：

```bash
# 從代理清單初始化一個新的代理項目
azd ai agent init -m <manifest-path-or-uri>

# 初始化並針對特定的 Foundry 項目
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 使用自訂的來源目錄初始化
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 目標設為容器應用程式作為主機
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**主要參數：**

| 參數 | 說明 |
|------|-------------|
| `-m, --manifest` | agent 描述清單路徑或 URI，新增至專案 |
| `-p, --project-id` | 既有 Microsoft Foundry 專案 ID，綁定 azd 環境 |
| `-s, --src` | 下載 agent 定義的目錄（預設為 `src/<agent-id>`） |
| `--host` | 覆寫預設 host (例如 `containerapp`) |
| `-e, --environment` | 使用的 azd 環境 |

<strong>生產秘訣</strong>：使用 `--project-id` 直接連接已存在 Foundry 專案，從一開始就將 agent 程式碼與雲端資源連結。

### 使用 `azd mcp` 的模型上下文協定 (MCP)

AZD 內建 MCP 伺服器支援 (Alpha)，讓 AI agent 與工具能透過標準協定操作你的 Azure 資源：

```bash
# 為你的專案啟動 MCP 伺服器
azd mcp start

# 管理 MCP 操作的工具同意權限
azd mcp consent
```

MCP 伺服器會暴露你的 azd 專案上下文—環境、服務及 Azure 資源—給 AI 驅動的開發工具。這帶來：

- **AI 協助部署**：讓程式碼代理查詢專案狀態並觸發部署  
- <strong>資源探索</strong>：AI 工具可發掘專案使用的 Azure 資源  
- <strong>環境管理</strong>：agent 可在開發/預備/生產環境間切換  

### 使用 `azd infra generate` 產生基礎設施

對於生產 AI 工作負載，你可產生並自訂基礎設施即代碼，而非依賴自動佈建：

```bash
# 從你的專案定義產生 Bicep/Terraform 檔案
azd infra generate
```

此舉會將 IaC 寫入磁碟，讓你能：

- 部署前審查與稽核基礎設施  
- 新增自訂安全政策（網路規則、私有端點）  
- 整合既有 IaC 審查流程  
- 將基礎設施變更與應用程式程式碼分開版本控制  

### 生產生命週期鉤子 (Lifecycle Hooks)

AZD 鉤子允許你在部署的各階段注入自訂邏輯，對生產 AI 工作流程而言至關重要：

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
# 在開發期間手動運行特定的鉤子
azd hooks run predeploy
```

**AI 工作負載推薦的生產鉤子：**

| 鉤子 | 用例 |
|------|----------|
| `preprovision` | 驗證訂閱配額以確保 AI 模型容量足夠 |
| `postprovision` | 配置私有端點、部署模型權重 |
| `predeploy` | 執行 AI 安全測試、驗證提示模板 |
| `postdeploy` | 執行 agent 煙霧測試，驗證模型連通性 |

### CI/CD 管線配置

使用 `azd pipeline config` 將專案連接 GitHub Actions 或 Azure Pipelines，搭配安全 Azure 認證：

```bash
# 配置 CI/CD 流水線（互動式）
azd pipeline config

# 使用指定供應商配置
azd pipeline config --provider github
```

此指令會：

- 建立最小權限服務主體  
- 配置聯邦認證（無需儲存機密）  
- 產生或更新管線定義檔  
- 在 CI/CD 系統中設置必需環境變數  

**生產流程配置範例：**

```bash
# 1. 設置生產環境
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. 配置流水線
azd pipeline config --provider github

# 3. 流水線於每次推送至 main 分支時執行 azd deploy
```

### 使用 `azd add` 新增元件

逐步為現有專案新增 Azure 服務：

```bash
# 互動式新增一個服務組件
azd add
```

此方式特別適合擴展生產 AI 應用，例如為既有部署新增向量搜尋服務、新代理端點或監控元件。

## 額外資源
- **Azure 優良架構框架**: [AI 工作負載指引](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry 文件**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- <strong>社群範本</strong>: [Azure 範例](https://github.com/Azure-Samples)
- **Discord 社群**: [#Azure 頻道](https://discord.gg/microsoft-azure)
- **Azure 代理技能**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個 Azure AI、Foundry、部署、成本優化及診斷的開放代理技能。安裝於您的編輯器：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**章節導航：**
- **📚 課程主頁**: [AZD 初學者](../../README.md)
- **📖 目前章節**: 第 8 章 - 生產與企業模式
- **⬅️ 上一章**: [第 7 章：疑難排解](../chapter-07-troubleshooting/debugging.md)
- **⬅️ 相關章節**: [AI 工作坊實驗室](ai-workshop-lab.md)
- **� 課程完成**: [AZD 初學者](../../README.md)

<strong>提醒</strong>：生產環境 AI 工作負載需要謹慎規劃、監控及持續優化。請從這些模式開始，並根據您的具體需求進行調整。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本的文件應被視為權威來源。對於關鍵資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或錯誤詮釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->