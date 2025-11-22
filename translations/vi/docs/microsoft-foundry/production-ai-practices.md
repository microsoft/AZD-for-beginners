<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-22T11:29:28+00:00",
  "source_file": "docs/microsoft-foundry/production-ai-practices.md",
  "language_code": "vi"
}
-->
# Thực hành tốt nhất cho khối lượng công việc AI sản xuất với AZD

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 8 - Mô hình sản xuất & doanh nghiệp
- **⬅️ Chương trước**: [Chương 7: Khắc phục sự cố](../troubleshooting/debugging.md)
- **⬅️ Cũng liên quan**: [Phòng thí nghiệm AI Workshop](ai-workshop-lab.md)
- **🎯 Hoàn thành khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)

## Tổng quan

Hướng dẫn này cung cấp các thực hành tốt nhất toàn diện để triển khai khối lượng công việc AI sẵn sàng sản xuất bằng Azure Developer CLI (AZD). Dựa trên phản hồi từ cộng đồng Microsoft Foundry Discord và các triển khai thực tế của khách hàng, các thực hành này giải quyết những thách thức phổ biến nhất trong hệ thống AI sản xuất.

## Những thách thức chính được giải quyết

Dựa trên kết quả khảo sát cộng đồng của chúng tôi, đây là những thách thức hàng đầu mà các nhà phát triển gặp phải:

- **45%** gặp khó khăn với triển khai AI đa dịch vụ
- **38%** gặp vấn đề với quản lý thông tin đăng nhập và bí mật  
- **35%** thấy khó khăn trong việc chuẩn bị sản xuất và mở rộng quy mô
- **32%** cần chiến lược tối ưu hóa chi phí tốt hơn
- **29%** yêu cầu cải thiện giám sát và khắc phục sự cố

## Mô hình kiến trúc cho AI sản xuất

### Mô hình 1: Kiến trúc AI Microservices

**Khi nào sử dụng**: Ứng dụng AI phức tạp với nhiều khả năng

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Web Frontend  │────│   API Gateway   │────│  Load Balancer  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                ┌───────────────┼───────────────┐
                │               │               │
        ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
        │ Chat Service │ │Image Service│ │Text Service│
        └──────────────┘ └─────────────┘ └────────────┘
                │               │               │
        ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
        │Azure OpenAI  │ │Computer     │ │Document    │
        │              │ │Vision       │ │Intelligence│
        └──────────────┘ └─────────────┘ └────────────┘
```

**Triển khai AZD**:

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

### Mô hình 2: Xử lý AI theo sự kiện

**Khi nào sử dụng**: Xử lý theo lô, phân tích tài liệu, quy trình làm việc không đồng bộ

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

## Thực hành tốt nhất về bảo mật

### 1. Mô hình bảo mật Zero-Trust

**Chiến lược triển khai**:
- Không có giao tiếp giữa các dịch vụ mà không có xác thực
- Tất cả các cuộc gọi API sử dụng danh tính được quản lý
- Cách ly mạng với các điểm cuối riêng tư
- Kiểm soát truy cập với quyền tối thiểu

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

### 2. Quản lý bí mật an toàn

**Mô hình tích hợp Key Vault**:

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

### 3. Bảo mật mạng

**Cấu hình điểm cuối riêng tư**:

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

## Hiệu suất và mở rộng quy mô

### 1. Chiến lược tự động mở rộng

**Tự động mở rộng ứng dụng container**:

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

### 2. Chiến lược bộ nhớ đệm

**Redis Cache cho phản hồi AI**:

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

### 3. Cân bằng tải và quản lý lưu lượng

**Application Gateway với WAF**:

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

## 💰 Tối ưu hóa chi phí

### 1. Điều chỉnh kích thước tài nguyên

**Cấu hình theo môi trường**:

```bash
# Môi trường phát triển
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Môi trường sản xuất
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Giám sát chi phí và ngân sách

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

### 3. Tối ưu hóa sử dụng token

**Quản lý chi phí OpenAI**:

```typescript
// Tối ưu hóa token ở cấp độ ứng dụng
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Cắt ngắn ngữ cảnh, không phải đầu vào của người dùng
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Ước tính sơ bộ: 1 token ≈ 4 ký tự
    return Math.ceil(text.length / 4);
  }
}
```

## Giám sát và quan sát

### 1. Thông tin ứng dụng toàn diện

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

### 2. Giám sát cụ thể AI

**Bảng điều khiển tùy chỉnh cho các chỉ số AI**:

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

### 3. Kiểm tra sức khỏe và giám sát thời gian hoạt động

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

## Khôi phục thảm họa và khả năng sẵn sàng cao

### 1. Triển khai đa vùng

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

### 2. Sao lưu và khôi phục dữ liệu

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

## Tích hợp DevOps và CI/CD

### 1. Quy trình làm việc GitHub Actions

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

### 2. Xác thực hạ tầng

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Kiểm tra nếu tất cả các dịch vụ cần thiết đang chạy
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Xác thực triển khai mô hình OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Kiểm tra kết nối dịch vụ AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Danh sách kiểm tra sẵn sàng sản xuất

### Bảo mật ✅
- [ ] Tất cả các dịch vụ sử dụng danh tính được quản lý
- [ ] Bí mật được lưu trữ trong Key Vault
- [ ] Điểm cuối riêng tư được cấu hình
- [ ] Nhóm bảo mật mạng được triển khai
- [ ] RBAC với quyền tối thiểu
- [ ] WAF được kích hoạt trên các điểm cuối công cộng

### Hiệu suất ✅
- [ ] Tự động mở rộng được cấu hình
- [ ] Bộ nhớ đệm được triển khai
- [ ] Cân bằng tải được thiết lập
- [ ] CDN cho nội dung tĩnh
- [ ] Kết nối cơ sở dữ liệu được tối ưu hóa
- [ ] Tối ưu hóa sử dụng token

### Giám sát ✅
- [ ] Thông tin ứng dụng được cấu hình
- [ ] Các chỉ số tùy chỉnh được định nghĩa
- [ ] Quy tắc cảnh báo được thiết lập
- [ ] Bảng điều khiển được tạo
- [ ] Kiểm tra sức khỏe được triển khai
- [ ] Chính sách lưu giữ nhật ký

### Độ tin cậy ✅
- [ ] Triển khai đa vùng
- [ ] Kế hoạch sao lưu và khôi phục
- [ ] Bộ ngắt mạch được triển khai
- [ ] Chính sách thử lại được cấu hình
- [ ] Giảm thiểu sự cố một cách nhẹ nhàng
- [ ] Điểm cuối kiểm tra sức khỏe

### Quản lý chi phí ✅
- [ ] Cảnh báo ngân sách được cấu hình
- [ ] Điều chỉnh kích thước tài nguyên
- [ ] Giảm giá cho môi trường phát triển/thử nghiệm được áp dụng
- [ ] Các phiên bản đặt trước được mua
- [ ] Bảng điều khiển giám sát chi phí
- [ ] Đánh giá chi phí thường xuyên

### Tuân thủ ✅
- [ ] Yêu cầu về nơi lưu trữ dữ liệu được đáp ứng
- [ ] Nhật ký kiểm toán được kích hoạt
- [ ] Chính sách tuân thủ được áp dụng
- [ ] Các tiêu chuẩn bảo mật được triển khai
- [ ] Đánh giá bảo mật thường xuyên
- [ ] Kế hoạch phản ứng sự cố

## Tiêu chuẩn hiệu suất

### Các chỉ số sản xuất điển hình

| Chỉ số | Mục tiêu | Giám sát |
|--------|----------|----------|
| **Thời gian phản hồi** | < 2 giây | Thông tin ứng dụng |
| **Khả dụng** | 99.9% | Giám sát thời gian hoạt động |
| **Tỷ lệ lỗi** | < 0.1% | Nhật ký ứng dụng |
| **Sử dụng token** | < $500/tháng | Quản lý chi phí |
| **Người dùng đồng thời** | 1000+ | Kiểm tra tải |
| **Thời gian khôi phục** | < 1 giờ | Kiểm tra khôi phục thảm họa |

### Kiểm tra tải

```bash
# Tập lệnh kiểm tra tải cho các ứng dụng AI
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Thực hành tốt nhất từ cộng đồng

Dựa trên phản hồi từ cộng đồng Microsoft Foundry Discord:

### Các khuyến nghị hàng đầu từ cộng đồng:

1. **Bắt đầu nhỏ, mở rộng dần**: Bắt đầu với các SKU cơ bản và mở rộng dựa trên sử dụng thực tế
2. **Giám sát mọi thứ**: Thiết lập giám sát toàn diện ngay từ đầu
3. **Tự động hóa bảo mật**: Sử dụng hạ tầng dưới dạng mã để đảm bảo bảo mật nhất quán
4. **Kiểm tra kỹ lưỡng**: Bao gồm kiểm tra cụ thể AI trong quy trình của bạn
5. **Lập kế hoạch chi phí**: Giám sát sử dụng token và thiết lập cảnh báo ngân sách sớm

### Những lỗi phổ biến cần tránh:

- ❌ Mã hóa cứng các khóa API trong mã
- ❌ Không thiết lập giám sát đúng cách
- ❌ Bỏ qua tối ưu hóa chi phí
- ❌ Không kiểm tra các kịch bản lỗi
- ❌ Triển khai mà không có kiểm tra sức khỏe

## Tài nguyên bổ sung

- **Khung Kiến trúc Tốt của Azure**: [Hướng dẫn khối lượng công việc AI](https://learn.microsoft.com/azure/well-architected/ai/)
- **Tài liệu Microsoft Foundry**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)
- **Mẫu cộng đồng**: [Mẫu Azure](https://github.com/Azure-Samples)
- **Cộng đồng Discord**: [Kênh #Azure](https://discord.gg/microsoft-azure)

---

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 8 - Mô hình sản xuất & doanh nghiệp
- **⬅️ Chương trước**: [Chương 7: Khắc phục sự cố](../troubleshooting/debugging.md)
- **⬅️ Cũng liên quan**: [Phòng thí nghiệm AI Workshop](ai-workshop-lab.md)
- **🎆 Hoàn thành khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)

**Nhớ rằng**: Khối lượng công việc AI sản xuất yêu cầu lập kế hoạch cẩn thận, giám sát và tối ưu hóa liên tục. Bắt đầu với các mô hình này và điều chỉnh chúng theo yêu cầu cụ thể của bạn.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->