# Production AI 工作負載最佳實踐與 AZD

**章節導航：**  
- **📚 課程首頁**：[AZD For Beginners](../../README.md)  
- **📖 本章節**：第 8 章 - 生產與企業模式  
- **⬅️ 上一章節**：[第 7 章：疑難排解](../chapter-07-troubleshooting/debugging.md)  
- **⬅️ 相關章節**：[AI 工作坊實驗室](ai-workshop-lab.md)  
- **🎯 課程完成**：[AZD For Beginners](../../README.md)  

## 概覽

本指南提供使用 Azure Developer CLI（AZD）部署生產級 AI 工作負載的全面最佳實踐。這些實踐基於 Microsoft Foundry Discord 社群回饋以及真實客戶部署經驗，針對生產 AI 系統中最常見的挑戰提供解決方案。

## 解決的主要挑戰

根據我們社群投票結果，開發者面臨的主要挑戰如下：

- **45%** 在多服務 AI 部署上遇到困難  
- **38%** 有憑證與秘密管理問題  
- **35%** 單就生產準備度與擴展感到困擾  
- **32%** 需要更好的成本優化策略  
- **29%** 需要改進監控與疑難排解  

## 生產 AI 的架構模式

### 模式 1：微服務 AI 架構

<strong>使用時機</strong>：具有多種功能的複雜 AI 應用

```mermaid
graph TD
    Frontend[網頁前端] --- Gateway[API 閘道] --- LB[負載均衡器]
    Gateway --> Chat[聊天服務]
    Gateway --> Image[圖像服務]
    Gateway --> Text[文本服務]
    Chat --> OpenAI[微軟 Foundry 模型]
    Image --> Vision[電腦視覺]
    Text --> DocIntel[文件智能]
```  
**AZD 實作：**

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

<strong>使用時機</strong>：批量處理、文件分析、非同步工作流

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
  
## 思考 AI 代理健康狀態

傳統網頁應用出現故障時，症狀容易辨識：網頁不載入、API 返回錯誤、部署失敗等。AI 驅動的應用可能會以相同方式出錯——但還可能以較隱晦方式表現不良，沒有明顯錯誤訊息。

本節幫助您建立監控 AI 工作負載的心智模型，讓您在狀況不對時知道從哪裡著手。

### 代理健康狀態與傳統應用健康的差異

傳統應用要麼正常運作，要麼不運作。AI 代理可能看似運作正常，但輸出結果卻不理想。可將代理健康分層思考：

| 層級 | 監測重點 | 檢查位置 |
|-------|------------------|-------------------------|
| <strong>基礎設施健康</strong> | 服務是否運行？資源是否已配置？端點是否可達？ | `azd monitor`、Azure 入口網站資源健康、容器/應用程式日誌 |
| <strong>行為健康</strong> | 代理回應是否準確？回應是否及時？模型調用是否正確？ | Application Insights 追蹤、模型呼叫延遲度量、回應品質日誌 |

基礎設施健康是熟悉的監控層面——對任何 azd 應用都一樣。行為健康是 AI 工作負載新引入的額外監控層。

### AI 應用表現異常時該查看的位置

若 AI 應用未產生預期結果，這裡提供概念檢查清單：

1. <strong>從基本開始。</strong>應用是否運行中？能否連接其依賴項？就像一般應用一樣檢查 `azd monitor` 和資源健康。
2. <strong>檢查模型連線。</strong>您的應用是否成功呼叫 AI 模型？模型呼叫失敗或逾時是 AI 應用問題最常見原因，可從應用日誌發現。
3. **查看模型接收內容。**AI 回應取決於輸入（提示和任何檢索的上下文）。輸出錯誤常因輸入錯誤。確認應用是否將正確資料發送給模型。
4. **檢查回應延遲。**AI 模型呼叫較普通 API 慢。如果應用感覺卡頓，記得檢查模型响应時間是否增加——可能是節流、容量限制或區域級擁塞。
5. <strong>注意成本訊號。</strong>代幣使用或 API 呼叫意外激增，可能表示迴圈、提示錯誤配置或過度重試。

您不需要馬上精通可觀測性工具。關鍵是 AI 應用擁有額外行為層需監控，而 azd 內建監控（`azd monitor`）讓您能同時調查兩層狀況。

---

## 安全最佳實踐

### 1. 零信任安全模型

<strong>實作策略</strong>：
- 未經身份驗證不允許服務間通訊  
- 所有 API 呼叫使用受管身分識別  
- 使用私人端點實現網絡隔離  
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
  
### 2. 安全秘密管理

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
  
### 3. 網絡安全

<strong>私人端點設定</strong>：

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
  
## 性能與擴展

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
  
### 2. 緩存策略

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

**具有 WAF 的應用程式閘道**：

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

### 1. 資源合理配置

<strong>針對不同環境的配置</strong>：

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
  
### 3. 代幣使用優化

**OpenAI 成本管理**：

```typescript
// 應用層級嘅字元優化
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // 截短上下文，唔係用戶輸入
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // 大約估計：1 個字元 ≈ 4 個字元
    return Math.ceil(text.length / 4);
  }
}
```
  
## 監控與可觀測性

### 1. 全面 Application Insights

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
  
### 3. 健康檢查與正常運作監控

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

# 檢查所有所需服務是否正在運行
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

# 測試 AI 服務連接性
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```
  
## 生產準備核對清單

### 安全 ✅  
- [ ] 所有服務使用受管身分識別  
- [ ] 秘密存放於 Key Vault  
- [ ] 已設定私人端點  
- [ ] 網絡安全群組已實施  
- [ ] RBAC 實施最小權限  
- [ ] 公共端點啟用 WAF  

### 性能 ✅  
- [ ] 已設定自動擴展  
- [ ] 已實施緩存  
- [ ] 設置負載平衡  
- [ ] 靜態內容使用 CDN  
- [ ] 資料庫連線池  
- [ ] 代幣使用優化  

### 監控 ✅  
- [ ] 已配置 Application Insights  
- [ ] 定義自訂指標  
- [ ] 設置告警規則  
- [ ] 建立儀表板  
- [ ] 已實施健康檢查  
- [ ] 日誌保留策略  

### 可靠性 ✅  
- [ ] 多區域部署  
- [ ] 備份與復原計劃  
- [ ] 實施斷路器  
- [ ] 設定重試策略  
- [ ] 實現優雅降級  
- [ ] 健康檢查端點  

### 成本管理 ✅  
- [ ] 設置預算警示  
- [ ] 資源合理配置  
- [ ] 已應用開發/測試優惠  
- [ ] 購買預留實例  
- [ ] 成本監控儀表板  
- [ ] 定期成本審查  

### 合規 ✅  
- [ ] 遵守資料駐留規定  
- [ ] 啟用審計日誌  
- [ ] 應用合規政策  
- [ ] 實施安全基準  
- [ ] 定期安全評估  
- [ ] 事故回應計劃  

## 性能基準

### 典型生產指標

| 指標 | 目標 | 監控方式 |
|--------|--------|------------|
| <strong>回應時間</strong> | < 2 秒 | Application Insights |
| <strong>可用性</strong> | 99.9% | 正常運作監測 |
| <strong>錯誤率</strong> | < 0.1% | 應用日誌 |
| <strong>代幣用量</strong> | < $500/月 | 成本管理 |
| <strong>同時使用者</strong> | 1000+ | 負載測試 |
| <strong>復原時間</strong> | < 1 小時 | 災難復原測試 |

### 負載測試

```bash
# AI 應用程式的負載測試腳本
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```
  
## 🤝 社群最佳實踐

根據 Microsoft Foundry Discord 社群反饋：

### 社群頂尖建議：

1. **從小開始，逐步擴展**：先用基礎 SKU，根據實際使用情況擴容  
2. <strong>全面監控</strong>：從第一天起就設置完整監控  
3. <strong>安全自動化</strong>：使用基礎設施即代碼以保持安全一致性  
4. <strong>徹底測試</strong>：在管線中包含 AI 專屬測試  
5. <strong>預算規劃</strong>：盡早監控代幣使用並設定預算提醒  

### 常見誤區避免：

- ❌ 在程式碼裡硬編 API 金鑰  
- ❌ 未設置適當監控  
- ❌ 忽略成本優化  
- ❌ 不測試失敗場景  
- ❌ 部署時未啟用健康檢查  

## AZD AI CLI 命令與擴充套件

AZD 提供越來越多 AI 專屬命令與擴充套件，簡化生產 AI 工作流程。這些工具填補本地開發與生產部署間的鴻溝。

### AI 擴充套件的 AZD

AZD 使用擴充系統增加 AI 專屬功能。可用以下命令安裝與管理擴充：

```bash
# 列出所有可用的擴充功能（包括 AI）
azd extension list

# 檢查已安裝擴充功能的詳細資料
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

| 擴充套件 | 用途 | 狀態 |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry 代理服務管理 | 預覽版 |
| `azure.ai.finetune` | Foundry 模型微調 | 預覽版 |
| `azure.ai.models` | Foundry 自訂模型 | 預覽版 |
| `azure.coding-agent` | 編碼代理配置 | 可用 |

### 使用 `azd ai agent init` 初始化代理專案

`azd ai agent init` 指令可生成一個整合 Microsoft Foundry 代理服務的生產級 AI 代理專案：

```bash
# 從代理清單初始化一個新代理項目
azd ai agent init -m <manifest-path-or-uri>

# 初始化並針對特定 Foundry 項目
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 使用自訂來源目錄初始化
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 將容器應用作為主機
azd ai agent init -m agent-manifest.yaml --host containerapp
```
  
**主要參數：**

| 參數 | 說明 |
|------|-------------|
| `-m, --manifest` | 要加入專案的代理清單路徑或 URI |
| `-p, --project-id` | 既有 Microsoft Foundry 專案 ID，用於 azd 環境 |
| `-s, --src` | 下載代理定義的資料夾（預設為 `src/<agent-id>`） |
| `--host` | 覆寫預設主機（例如 `containerapp`） |
| `-e, --environment` | 指定所使用的 azd 環境 |

<strong>生產建議</strong>：使用 `--project-id` 可直接連接既有 Foundry 專案，從一開始將代理程式碼與雲端資源關聯。

### Model Context Protocol (MCP) 與 `azd mcp`

AZD 內建 MCP 伺服器支持（Alpha），讓 AI 代理及工具可透過標準協定互動您的 Azure 資源：

```bash
# 為你的項目啟動MCP服務器
azd mcp start

# 檢視當前Copilot工具執行的同意規則
azd copilot consent list
```
  
MCP 伺服器將您的 azd 專案上下文——環境、服務與 Azure 資源——暴露給 AI 助力的開發工具。此功能可支援：

- **AI 協助部署**：讓編碼代理查詢專案狀態並觸發部署  
- <strong>資源發現</strong>：AI 工具可發現專案使用的 Azure 資源  
- <strong>環境管理</strong>：代理能切換開發／測試／生產環境  

### 基礎設施生成與 `azd infra generate`

對於生產 AI 工作負載，您可生成並自訂基礎設施即代碼，而非依賴自動配置：

```bash
# 從你的專案定義產生 Bicep/Terraform 檔案
azd infra generate
```
  
此操作會將 IaC 寫入磁碟，讓您能：

- 部署前審核基礎設施  
- 新增自訂安全政策（網路規則、私人端點）  
- 整合既有 IaC 審查流程  
- 將基礎設施變更以版本控制獨立於應用程式碼  

### 生產生命週期掛勾點

AZD 掛勾點讓您在部署生命週期每階段注入客製邏輯——對生產 AI 工作流程至關重要：

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
# 在開發期間手動執行特定的 hook
azd hooks run predeploy
```
  
**推薦用於 AI 工作負載的生產掛勾：**

| 掛勾 | 使用案例 |
|------|----------|
| `preprovision` | 驗證訂閱配額以支援 AI 模型容量 |
| `postprovision` | 設定私人端點，部署模型權重 |
| `predeploy` | 執行 AI 安全測試，驗證提示模板 |
| `postdeploy` | 進行代理冒煙測試，確認模型連線 |

### CI/CD 管線配置

使用 `azd pipeline config` 將專案連接到 GitHub Actions 或 Azure Pipelines，並使用安全的 Azure 身份驗證：

```bash
# 配置 CI/CD 管道（互動式）
azd pipeline config

# 使用特定供應商進行配置
azd pipeline config --provider github
```
  
此命令將會：

- 建立具最小權限的服務主體  
- 配置聯合身份認證（無需儲存秘密）  
- 產生或更新您的管線定義檔  
- 在 CI/CD 系統設定所需環境變數  

**生產工作流程搭配管線配置：**

```bash
# 1. 設置生產環境
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. 配置流水線
azd pipeline config --provider github

# 3. 流水線在每次推送到 main 時運行 azd deploy
```
  
### 使用 `azd add` 增加元件

逐步向現有專案新增 Azure 服務：

```bash
# 互動式新增一個服務組件
azd add
```
  
此功能特別適用於拓展生產 AI 應用，例如新增向量搜尋服務、新代理端點或監控元件。

## 附加資源
- **Azure 卓越架構框架**: [AI 工作負載指導](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry 文件**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- <strong>社群範本</strong>: [Azure 範例](https://github.com/Azure-Samples)
- **Discord 社群**: [#Azure 頻道](https://discord.gg/microsoft-azure)
- **Azure 代理技能**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個 Azure AI、Foundry、部署、成本優化及診斷的開放代理技能。在您的編輯器中安裝：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者](../../README.md)
- **📖 本章節**: 第 8 章 - 生產及企業模式
- **⬅️ 上一章**: [第 7 章：故障排除](../chapter-07-troubleshooting/debugging.md)
- **⬅️ 相關章節**: [AI 工作坊實驗室](ai-workshop-lab.md)
- **� 課程完成**: [AZD 初學者](../../README.md)

<strong>請記住</strong>: 生產環境的 AI 工作負載需要謹慎規劃、監控及持續優化。請從這些模式開始，並根據您的具體需求進行調整。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯的。儘管我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對使用此翻譯所產生的任何誤解或誤讀承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->