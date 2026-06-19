# 使用 AZD 的生產 AI 工作負載最佳實務

**章節導覽:**
- **📚 課程主頁**: [AZD 初學者](../../README.md)
- **📖 目前章節**: 第 8 章 - 生產與企業模式
- **⬅️ 上一章**: [第 7 章：排除故障](../chapter-07-troubleshooting/debugging.md)
- **⬅️ 也相關**: [AI 工作坊實驗室](ai-workshop-lab.md)
- **🎯 完成課程**: [AZD 初學者](../../README.md)

## 概述

本指南提供使用 Azure Developer CLI (AZD) 部署生產就緒 AI 工作負載的完整最佳實務。根據 Microsoft Foundry Discord 社群的回饋與實際客戶部署經驗，這些做法針對生產 AI 系統中最常見的挑戰提出因應策略。

## 主要解決的挑戰

根據我們的社群投票結果，以下是開發者面臨的主要挑戰：

- **45%** 在多服務 AI 部署方面有困難
- **38%** 在認證與機密管理上有問題  
- **35%** 覺得生產就緒性與擴展較為困難
- **32%** 需要更好的成本最佳化策略
- **29%** 需要改進監控與除錯能力

## 生產 AI 的架構模式

### 模式 1：微服務 AI 架構

<strong>何時使用</strong>：具多種能力的複雜 AI 應用程式

```mermaid
graph TD
    Frontend[網頁前端] --- Gateway[API 閘道] --- LB[負載平衡器]
    Gateway --> Chat[聊天服務]
    Gateway --> Image[影像服務]
    Gateway --> Text[文字服務]
    Chat --> OpenAI[微軟 Foundry 模型]
    Image --> Vision[電腦視覺]
    Text --> DocIntel[文件智慧]
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

### 模式 2：事件驅動的 AI 處理

<strong>何時使用</strong>：批次處理、文件分析、非同步工作流程

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

## 思考 AI 代理的健康狀態

當傳統 Web 應用發生故障時，症狀通常很明顯：頁面載入失敗、API 回傳錯誤或部署失敗。AI 驅動的應用也會以相同方式故障—但它們也可能以較細微、不會產生明顯錯誤訊息的方式表現不佳。

本節幫助你建立監控 AI 工作負載的心智模型，以便當事情看起來不對勁時你知道該從哪裡著手檢查。

### 代理健康與傳統應用健康的差異

傳統應用要麼運作，要麼不運作。AI 代理可能看起來在運作，但輸出結果卻不佳。可將代理健康視為兩個層面：

| 層級 | 觀察項目 | 檢查位置 |
|-------|--------------|---------------|
| <strong>基礎設施健康</strong> | 服務是否在執行？資源是否已配置？端點是否可存取？ | `azd monitor`, Azure Portal 的資源健康、容器/應用程式日誌 |
| <strong>行為健康</strong> | 代理的回應是否準確？回應是否及時？模型的呼叫是否正確？ | Application Insights 追蹤、模型呼叫延遲指標、回應品質日誌 |

基礎設施健康是你熟悉的——對任何 azd 應用都相同。行為健康是 AI 工作負載所引入的新層面。

### 當 AI 應用行為異常時該從哪裡查看

如果你的 AI 應用沒有產生預期結果，以下是一個概念性檢查清單：

1. **從基本開始。** 應用程式是否在執行？能否連到其相依服務？像檢查任何應用一樣，查看 `azd monitor` 與資源健康。
2. **檢查模型連線。** 應用程式是否成功呼叫 AI 模型？失敗或超時的模型呼叫是 AI 應用問題最常見的原因，會出現在你的應用程式日誌中。
3. **查看模型收到的內容。** AI 回應取決於輸入（提示 (prompt) 與任何檢索到的上下文）。如果輸出錯誤，通常是輸入有問題。檢查你的應用程式是否將正確的資料傳送給模型。
4. **檢視回應延遲。** AI 模型呼叫比典型 API 呼叫慢。如果你的應用感覺遲緩，檢查模型回應時間是否增加——這可能表示節流、容量限制或區域層級的擁堵。
5. **注意成本信號。** Token 使用或 API 呼叫的意外暴增可能表示迴圈、錯誤配置的提示 (prompt)，或過度重試。

你不需要馬上精通可觀察性工具。重點是 AI 應用多了一個行為層需要監控，而 azd 的內建監控（`azd monitor`）可作為調查這兩個層面的起點。

---

## 安全最佳實務

### 1. 零信任安全模型

<strong>實作策略</strong>:
- 任何服務對服務的通訊都需經過驗證
- 所有 API 呼叫使用受管理的身分識別 (managed identities)
- 使用私有端點實現網路隔離
- 最小權限的存取控制

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

**Key Vault 整合範式**：

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

<strong>私有端點設定</strong>：

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

### 1. 自動調整策略

**Container Apps 自動調整**：

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

**用於 AI 回應的 Redis 快取**：

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

**搭配 WAF 的 Application Gateway**：

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

### 1. 資源適當調整

<strong>環境專屬設定</strong>：

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

### 2. 成本監控與預算

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

### 3. Token 使用優化

**OpenAI 成本管理**：

```typescript
// 應用層級的令牌最佳化
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // 截斷上下文，而不是使用者輸入
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // 粗略估計：1 個令牌 ≈ 4 個字元
    return Math.ceil(text.length / 4);
  }
}
```

## 監控與可觀察性

### 1. 完整的 Application Insights

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

### 2. AI 專屬監控

**AI 指標的自訂儀表板**：

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

### 3. 健康檢查與可用性監控

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

### 1. 跨區域部署

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
        uses: Azure/setup-azd@v2
        
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
        uses: Azure/setup-azd@v2
        
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

# 檢查所有必要的服務是否正在執行
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
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# 測試 AI 服務連線
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## 生產準備檢查清單

### 安全 ✅
- [ ] 所有服務使用受管理的身分識別
- [ ] 機密儲存在 Key Vault
- [ ] 已設定私有端點
- [ ] 已實作網路安全群組
- [ ] RBAC 以最小權限方式
- [ ] 公開端點已啟用 WAF

### 效能 ✅
- [ ] 已配置自動調整
- [ ] 已實作快取
- [ ] 已設定負載平衡
- [ ] 靜態內容使用 CDN
- [ ] 資料庫連線池
- [ ] Token 使用已優化

### 監控 ✅
- [ ] 已配置 Application Insights
- [ ] 已定義自訂指標
- [ ] 已設定警示規則
- [ ] 已建立儀表板
- [ ] 已實作健康檢查
- [ ] 日誌保留政策

### 可靠性 ✅
- [ ] 跨區域部署
- [ ] 備份與復原計畫
- [ ] 已實作斷路器
- [ ] 已配置重試策略
- [ ] 優雅降級
- [ ] 健康檢查端點

### 成本管理 ✅
- [ ] 已配置預算警示
- [ ] 資源適當調整
- [ ] 已套用開發/測試折扣
- [ ] 已購買預留實例
- [ ] 成本監控儀表板
- [ ] 定期成本檢討

### 合規 ✅
- [ ] 符合資料駐留要求
- [ ] 已啟用稽核日誌
- [ ] 已套用合規政策
- [ ] 已實作安全基準
- [ ] 定期安全評估
- [ ] 事故回應計畫

## 效能基準

### 典型生產指標

| 指標 | 目標 | 監控 |
|--------|--------|------------|
| <strong>回應時間</strong> | < 2 seconds | Application Insights |
| <strong>可用性</strong> | 99.9% | 可用性監控 |
| <strong>錯誤率</strong> | < 0.1% | 應用程式日誌 |
| **Token 使用** | < $500/month | 成本管理 |
| <strong>同時使用者</strong> | 1000+ | 負載測試 |
| <strong>復原時間</strong> | < 1 hour | 災難復原測試 |

### 負載測試

```bash
# 用於 AI 應用程式的負載測試腳本
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 社群最佳實務

根據 Microsoft Foundry Discord 社群的回饋：

### 社群的主要建議：

1. **從小開始，逐步擴展**：從基本的 SKU 開始，依實際使用情況再擴充
2. <strong>監控所有項目</strong>：從第一天起就建立完整的監控
3. <strong>自動化安全</strong>：使用基礎設施即程式碼以確保安全性一致
4. <strong>徹底測試</strong>：在你的管線中加入 AI 專屬測試
5. <strong>規劃成本</strong>：監控 token 使用並及早設定預算警示

### 常見陷阱（避免）：

- ❌ 在程式碼中硬編 API 金鑰
- ❌ 未設定適當的監控
- ❌ 忽略成本最佳化
- ❌ 未測試失敗情境
- ❌ 未部署健康檢查就上線

## AZD AI CLI 指令與擴充套件

AZD 包含日益成長的一組 AI 專屬指令與擴充套件，能簡化生產 AI 的工作流程。這些工具縮短本地開發與 AI 工作負載的生產部署之間的差距。

### AZD 的 AI 擴充套件

AZD 使用擴充系統來新增 AI 專屬功能。使用以下指令安裝與管理擴充套件：

```bash
# 列出所有可用的擴充功能（包括 AI）
azd extension list

# 檢視已安裝擴充功能的詳細資訊
azd extension show azure.ai.agents

# 安裝 Foundry agents 擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 升級所有已安裝的擴充功能
azd extension upgrade --all
```

**可用的 AI 擴充套件：**

| 擴充套件 | 目的 | 狀態 |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent Service 管理 | 預覽 |
| `azure.ai.skills` | 可重複使用的代理技能 | 預覽 |
| `azure.ai.connections` | Foundry 連線（資料來源、工具） | 預覽 |
| `azure.ai.finetune` | Foundry 模型微調 | 預覽 |
| `azure.ai.models` | Foundry 自訂模型 | 預覽 |
| `azure.coding-agent` | 程式碼代理配置 | 可用 |

> `azure.ai.agents` 擴充套件變化迅速。本課程驗證的版本為 `0.1.40-preview`。執行 `azd extension upgrade --all` 以取用最新指令集，並使用 `azd extension show azure.ai.agents` 確認已安裝的版本。

**較新的 `skills` 與 `connections` 擴充套件是什麼？**

兩個預覽擴充套件與代理工具同時出現，即使作為新手也值得理解：

- **`azure.ai.skills`** — 一個 **skill（技能）** 是可重複使用的能力（已封裝的工具或行為），你可以把它附加到一個或多個代理上，而不用每次都重新實作。把它想像成共用的構建區塊：定義一次「搜尋文件」或「查詢訂單」的技能，然後在多個代理間重複使用。這能使多代理系統（第 5 章）保持一致並避免複製貼上。
- **`azure.ai.connections`** — 一個 **connection（連線）** 是從你的 Foundry 專案到代理所需外部資源的受管理連結——一個資料來源（如 Azure AI Search）、工具端點或其他服務。連線會集中管理代理存取資料的「位置」與「方式」，讓認證與端點維護於單一受治理的位置，而不是散落於程式碼中。

你不需要這些就能部署你的第一批代理——在學習階段可先使用 `azure.ai.agents`。當你發現自己在多個代理間重複相同工具時，考慮使用 `skills`；當多個代理共用相同資料來源時，考慮使用 `connections`。

### 使用 `azd ai agent init` 初始化代理專案

`azd ai agent init` 指令會為 Microsoft Foundry Agent Service 整合的生產就緒 AI 代理專案建立腳手架：

```bash
# 從代理程式描述檔初始化一個新的代理專案
azd ai agent init -m <manifest-path-or-uri>

# 初始化並指定特定的 Foundry 專案為目標
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 使用自訂的來源目錄進行初始化
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 將 Container Apps 指定為主機
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**主要旗標：**

| 旗標 | 說明 |
|------|-------------|
| `-m, --manifest` | 要新增到專案的代理清單路徑或 URI |
| `-p, --project-id` | 用於你的 azd 環境的現有 Microsoft Foundry Project ID |
| `-s, --src` | 下載代理定義的目錄（預設為 `src/<agent-id>`） |
| `--host` | 覆寫預設的 host（例如 `containerapp`） |
| `-e, --environment` | 要使用的 azd 環境 |

<strong>生產提示</strong>：使用 `--project-id` 可直接連接到現有的 Foundry 專案，讓你的代理程式碼與雲端資源從一開始就保持連結。

### 管理代理的生命週期

除了 `init` 之外，`azure.ai.agents` 擴充套件提供完整託管代理生命週期的指令——包含測試、檢視、優化與退役：

```bash
# 呼叫已部署的代理並檢視伺服器回應時間
# （總延遲與首字節時間）
azd ai agent invoke

# 在變更之前顯示即時端點的設定
azd ai agent endpoint show

# 為代理生成評估資料集
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# 根據您的評估資料對代理指令進行優化
# （代理專案中需要有 optimization_model）
azd ai agent optimize

# 下載基於程式碼的託管代理之已部署原始碼
# （含 SHA-256 驗證）
azd ai agent code download

# 刪除一個託管代理及其所有版本
# （--force 會終止活動中的會話）
azd ai agent delete --force
```

**生命週期一覽：**

| 階段 | 指令 | 生產用法 |
|-------|---------|----------------|
| 測試 | `azd ai agent invoke` | 在發布前驗證回應並測量延遲 |
| 檢查 | `azd ai agent endpoint show` | 檢視端點認證/設定；及早發現中斷性變更 |
| 測量 | `azd ai agent eval generate` | 從實際追蹤建立可重複的評估集 |
| 改進 | `azd ai agent optimize` | 依據量測品質調整指令 |
| 復原 | `azd ai agent code download` | 取得實際部署的原始程式以供稽核/回滾 |
| 退役 | `azd ai agent delete --force` | 清除代理及其版本 |

> 這些為預覽指令，可能會在擴充套件更新間有所變動。執行 `azd ai agent --help` 查看你已安裝版本中可用的子指令。

### 使用 `azd mcp` 的模型上下文協定 (MCP)
AZD includes built-in MCP server support (Alpha), enabling AI agents and tools to interact with your Azure resources through a standardized protocol:

```bash
# 為你的專案啟動 MCP 伺服器
azd mcp start

# 檢視目前 Copilot 關於工具執行的同意規則
azd copilot consent list
```

MCP 伺服器將您的 azd 專案內容—環境、服務、和 Azure 資源—揭露給 AI 驅動的開發工具。這能讓：

- **AI-assisted deployment**: 讓程式碼代理查詢您的專案狀態並觸發部署
- **Resource discovery**: AI 工具可以找出您的專案使用了哪些 Azure 資源
- **Environment management**: 代理可以在 dev/staging/production 環境之間切換

### Infrastructure Generation with `azd infra generate`

對於生產環境的 AI 工作負載，您可以產生並自訂基礎設施即程式碼，而非依賴自動佈建：

```bash
# 從您的專案定義產生 Bicep/Terraform 檔案
azd infra generate
```

這會將 IaC 寫到磁碟，所以您可以：
- 在部署前檢閱並稽核基礎架構
- 新增自訂安全政策（網路規則、私人端點）
- 整合現有的 IaC 審查流程
- 將基礎架構變更與應用程式程式碼分開進行版本控制

### Production Lifecycle Hooks

AZD hooks 讓您在部署生命週期的每個階段注入自訂邏輯——對生產 AI 工作流程來說至關重要：

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
# 在開發期間手動執行特定的掛勾
azd hooks run predeploy
```

**Recommended production hooks for AI workloads:**

| Hook | Use Case |
|------|----------|
| `preprovision` | 驗證訂閱配額以符合 AI 模型容量需求 |
| `postprovision` | 設定私人端點、部署模型權重 |
| `predeploy` | 執行 AI 安全測試、驗證提示模板 |
| `postdeploy` | 對代理回應進行冒煙測試、驗證模型連線性 |

### CI/CD Pipeline Configuration

Use `azd pipeline config` to connect your project to GitHub Actions or Azure Pipelines with secure Azure authentication:

```bash
# 設定 CI/CD 管線（互動式）
azd pipeline config

# 使用特定供應商進行設定
azd pipeline config --provider github
```

此指令會：
- 建立具最小權限存取的服務主體
- 設定聯合憑證（不儲存祕密）
- 產生或更新您的管線定義檔
- 在您的 CI/CD 系統中設定所需的環境變數

#### Step-by-step: your first GitHub Actions pipeline

Here's the full walkthrough from a working azd project to automated deployments on every push.

**1. Make sure your project is on GitHub**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. Run pipeline config**

```bash
azd pipeline config --provider github
```

azd will, interactively:
- Ask which Azure subscription and environment to target
- Create an Entra **app registration + service principal** for the pipeline
- Set up **federated credentials (OIDC)**—so GitHub authenticates to Azure with short-lived tokens and **no secrets are stored**
- Push the required **variables** to your GitHub repo (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. Understand the generated workflow**

azd adds `.github/workflows/azure-dev.yml`. The key parts look like this:

```yaml
# .github/workflows/azure-dev.yml
on:
  push:
    branches: [ main ]
  workflow_dispatch:        # lets you run it manually too

permissions:
  id-token: write           # required for OIDC federated login
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      AZURE_CLIENT_ID: ${{ vars.AZURE_CLIENT_ID }}
      AZURE_TENANT_ID: ${{ vars.AZURE_TENANT_ID }}
      AZURE_SUBSCRIPTION_ID: ${{ vars.AZURE_SUBSCRIPTION_ID }}
      AZURE_ENV_NAME: ${{ vars.AZURE_ENV_NAME }}
      AZURE_LOCATION: ${{ vars.AZURE_LOCATION }}
    steps:
      - uses: actions/checkout@v4
      - name: Install azd
        uses: Azure/setup-azd@v2
      - name: Log in with OIDC
        run: azd auth login --client-id "$AZURE_CLIENT_ID" --federated-credential-provider "github" --tenant-id "$AZURE_TENANT_ID"
      - name: Provision infrastructure
        run: azd provision --no-prompt
      - name: Deploy application
        run: azd deploy --no-prompt
```

**4. Verify it works**

```bash
# 推送一個變更以觸發管線
git commit -am "Trigger pipeline" --allow-empty
git push
```

Open the **Actions** tab in your GitHub repo and watch the workflow run `azd provision` and `azd deploy` automatically.

> **Why federated credentials matter:** older pipelines stored a client secret in GitHub. OIDC federated credentials remove that secret entirely—GitHub requests a short-lived token at runtime, which is both more secure and nothing to rotate or leak. This is the default `azd pipeline config` sets up.

> **Secrets vs. variables:** non-sensitive identifiers (`AZURE_CLIENT_ID`, etc.) go in repo **variables**. If your app genuinely needs a secret at build time, add it as a GitHub **secret** and reference it with `${{ secrets.NAME }}`—but prefer Key Vault + managed identity at runtime (see [第 3 章](../chapter-03-configuration/authsecurity.md)).

**Production workflow with pipeline config:**

```bash
# 1. 設定生產環境
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. 設定管線
azd pipeline config --provider github

# 3. 管線在每次推送到 main 分支時執行 azd deploy
```

#### Step-by-step: Azure DevOps Pipelines

Prefer Azure DevOps over GitHub Actions? azd supports it natively with the `azdo` provider. The flow is nearly identical—azd generates the pipeline file, creates a service connection, and wires up authentication.

**1. Make sure you have an Azure DevOps project**

You need an organization and a project at `https://dev.azure.com/<your-org>`. Generate a Personal Access Token (PAT) with **Build (Read & execute)**, **Code (Read & write)**, and **Service Connections (Read, query & manage)** scopes—azd will prompt you for it.

**2. Configure the pipeline**

```bash
azd pipeline config --provider azdo
```

azd will:
- Ask for your Azure DevOps organization and project
- Create (or reuse) a **service connection** to Azure using a service principal
- Configure **workload identity federation (OIDC)** so no client secret is stored
- Commit an `azure-dev.yml` pipeline definition to your repo

**3. Review the generated `azure-dev.yml`**

azd writes a pipeline that provisions and deploys on every push to `main`:

```yaml
# azure-dev.yml
trigger:
  - main

pool:
  vmImage: ubuntu-latest

steps:
  - task: setup-azd@1
    displayName: Install azd

  - script: azd provision --no-prompt
    displayName: Provision Infrastructure
    env:
      AZURE_SUBSCRIPTION_ID: $(AZURE_SUBSCRIPTION_ID)
      AZURE_ENV_NAME: $(AZURE_ENV_NAME)
      AZURE_LOCATION: $(AZURE_LOCATION)

  - script: azd deploy --no-prompt
    displayName: Deploy Application
    env:
      AZURE_SUBSCRIPTION_ID: $(AZURE_SUBSCRIPTION_ID)
      AZURE_ENV_NAME: $(AZURE_ENV_NAME)
      AZURE_LOCATION: $(AZURE_LOCATION)
```

**4. Where the variables come from**

azd stores the environment values (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) as a **variable group** in Azure DevOps so the pipeline can read them. You can view and edit them under **Pipelines → Library**.

> **Same OIDC benefit as GitHub:** the `azdo` provider also configures workload identity federation by default, so there's no client secret stored in the service connection—Azure DevOps exchanges a short-lived token at runtime. Pass `--auth-type client-credentials` only if your organization can't use OIDC yet.

**5. Run it**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Open **Pipelines** in Azure DevOps to watch `azd provision` and `azd deploy` run.

### Adding Components with `azd add`

Incrementally add Azure services to an existing project:

```bash
# 以互動方式新增一個服務元件
azd add
```

This is particularly useful for expanding production AI applications—for example, adding a vector search service, a new agent endpoint, or a monitoring component to an existing deployment.

## Additional Resources

- **Azure Well-Architected Framework**: [AI workload guidance](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Official docs](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure channel](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent skills for Azure AI, Foundry, deployment, cost optimization, and diagnostics. Install in your editor:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD 新手入門](../../README.md)
- **📖 Current Chapter**: 第 8 章 - 生產與企業模式
- **⬅️ Previous Chapter**: [第 7 章：除錯](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI 工作坊實驗室](ai-workshop-lab.md)
- **� 課程完成**: [AZD 新手入門](../../README.md)

**Remember**: Production AI workloads require careful planning, monitoring, and continuous optimization. Start with these patterns and adapt them to your specific requirements.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->