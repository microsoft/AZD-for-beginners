# Production AI Workload Best Practices with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD For Beginners](../../README.md)

## ภาพรวม

คำแนะนำนี้ให้แนวปฏิบัติที่ดีที่สุดอย่างครอบคลุมสำหรับการปรับใช้เวิร์กโหลด AI ที่พร้อมใช้งานจริงโดยใช้ Azure Developer CLI (AZD) อิงจากความคิดเห็นจากชุมชน Microsoft Foundry บน Discord และการปรับใช้ของลูกค้าในโลกจริง แนวปฏิบัติเหล่านี้แก้ไขปัญหาที่พบบ่อยที่สุดในระบบ AI สำหรับการผลิต

## ความท้าทายหลักที่แก้ไข

จากผลการสำรวจของชุมชน เราพบว่าปัญหาหลักที่นักพัฒนาพบคือ:

- **45%** ประสบปัญหาในการปรับใช้ AI หลายบริการ
- **38%** มีปัญหาเรื่องการจัดการข้อมูลรับรองและความลับ  
- **35%** รู้สึกว่าการเตรียมความพร้อมสำหรับการผลิตและการปรับขนาดเป็นเรื่องยาก
- **32%** ต้องการกลยุทธ์การเพิ่มประสิทธิภาพค่าใช้จ่ายที่ดีกว่า
- **29%** ต้องการการตรวจสอบและการแก้ไขปัญหาที่ดีขึ้น

## รูปแบบสถาปัตยกรรมสำหรับ AI ในการใช้งานจริง

### รูปแบบที่ 1: สถาปัตยกรรม AI แบบไมโครเซอร์วิส

**เมื่อใดควรใช้**: แอปพลิเคชัน AI ที่ซับซ้อนที่มีความสามารถหลายอย่าง

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

**การนำไปใช้ด้วย AZD**:

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

### รูปแบบที่ 2: การประมวลผล AI แบบขับเคลื่อนด้วยเหตุการณ์

**เมื่อใดควรใช้**: การประมวลผลแบบแบตช์, การวิเคราะห์เอกสาร, เวิร์กโฟลว์แบบไม่พร้อมกัน

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

## แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย

### 1. โมเดลความปลอดภัยแบบ Zero-Trust

**กลยุทธ์การนำไปใช้**:
- ไม่อนุญาตให้บริการสื่อสารกันโดยไม่มีการพิสูจน์ตัวตน
- การเรียก API ทั้งหมดใช้ managed identities
- แยกเครือข่ายด้วย private endpoints
- การควบคุมการเข้าถึงแบบสิทธิ์ขั้นต่ำที่จำเป็น

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

### 2. การจัดการความลับอย่างปลอดภัย

**รูปแบบการผสานรวมกับ Key Vault**:

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

### 3. ความปลอดภัยของเครือข่าย

**การกำหนดค่า Private Endpoint**:

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

## ประสิทธิภาพและการปรับขนาด

### 1. กลยุทธ์การปรับขนาดอัตโนมัติ

**การปรับขนาดอัตโนมัติสำหรับ Container Apps**:

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

### 2. กลยุทธ์การแคช

**Redis Cache สำหรับการตอบกลับของ AI**:

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

### 3. การกระจายโหลดและการจัดการทราฟฟิก

**Application Gateway พร้อม WAF**:

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

## 💰 การเพิ่มประสิทธิภาพค่าใช้จ่าย

### 1. การปรับขนาดทรัพยากรให้เหมาะสม

**การกำหนดค่าตามสภาพแวดล้อม**:

```bash
# สภาพแวดล้อมการพัฒนา
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# สภาพแวดล้อมการผลิต
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. การติดตามค่าใช้จ่ายและงบประมาณ

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

### 3. การปรับปรุงการใช้โทเค็น

**การจัดการต้นทุน OpenAI**:

```typescript
// การเพิ่มประสิทธิภาพโทเค็นระดับแอปพลิเคชัน
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // ตัดบริบท ไม่ใช่ข้อมูลนำเข้าของผู้ใช้
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // ประมาณคร่าวๆ: 1 โทเค็น ≈ 4 ตัวอักษร
    return Math.ceil(text.length / 4);
  }
}
```

## การตรวจสอบและความสามารถในการสังเกต

### 1. Application Insights แบบครอบคลุม

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

### 2. การตรวจสอบเฉพาะทางสำหรับ AI

**แดชบอร์ดที่กำหนดเองสำหรับเมตริกของ AI**:

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

### 3. การตรวจสุขภาพและการตรวจสอบเวลาที่ใช้งานได้

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

## การกู้คืนจากภัยพิบัติและความพร้อมใช้งานสูง

### 1. การปรับใช้หลายภูมิภาค

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

### 2. การสำรองข้อมูลและการกู้คืน

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

## การผสาน DevOps และ CI/CD

### 1. เวิร์กโฟลว์ GitHub Actions

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

### 2. การตรวจสอบความถูกต้องของโครงสร้างพื้นฐาน

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# ตรวจสอบว่าบริการทั้งหมดที่จำเป็นกำลังทำงานอยู่หรือไม่
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# ตรวจสอบการปรับใช้โมเดล OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# ทดสอบการเชื่อมต่อกับบริการ AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## รายการตรวจสอบความพร้อมสำหรับการใช้งานจริง

### ความปลอดภัย ✅
- [ ] บริการทั้งหมดใช้ managed identities
- [ ] เก็บความลับใน Key Vault
- [ ] กำหนดค่า private endpoints
- [ ] ใช้งาน Network Security Groups
- [ ] RBAC พร้อมสิทธิ์ขั้นต่ำที่จำเป็น
- [ ] เปิดใช้งาน WAF บน endpoints สาธารณะ

### ประสิทธิภาพ ✅
- [ ] ตั้งค่า auto-scaling
- [ ] มีการใช้งานแคช
- [ ] ตั้งค่าการกระจายโหลด
- [ ] ใช้ CDN สำหรับเนื้อหาแบบคงที่
- [ ] การจัดกลุ่มการเชื่อมต่อฐานข้อมูล
- [ ] การปรับปรุงการใช้โทเค็น

### การตรวจสอบ ✅
- [ ] กำหนดค่า Application Insights
- [ ] กำหนดเมตริกที่ปรับแต่ง
- [ ] ตั้งค่ากฎการแจ้งเตือน
- [ ] สร้างแดชบอร์ด
- [ ] ใช้งานการตรวจสุขภาพ
- [ ] นโยบายการเก็บรักษาโลก์

### ความเชื่อถือได้ ✅
- [ ] ปรับใช้หลายภูมิภาค
- [ ] แผนสำรองข้อมูลและการกู้คืน
- [ ] ใช้งาน circuit breakers
- [ ] กำหนดค่านโยบายการลองใหม่
- [ ] การเสื่อมสภาพอย่างยืดหยุ่น
- [ ] endpoints สำหรับตรวจสุขภาพ

### การจัดการค่าใช้จ่าย ✅
- [ ] กำหนดค่าแจ้งเตืองบประมาณ
- [ ] ปรับขนาดทรัพยากรให้เหมาะสม
- [ ] ใช้ส่วนลดสำหรับการพัฒนา/ทดสอบ
- [ ] ซื้อ Reserved instances
- [ ] แดชบอร์ดติดตามค่าใช้จ่าย
- [ ] ทบทวนค่าใช้จ่ายเป็นประจำ

### การปฏิบัติตามข้อกำหนด ✅
- [ ] ปฏิบัติตามข้อกำหนดเรื่องภูมิลำเนาของข้อมูล
- [ ] เปิดใช้งานการบันทึกการตรวจสอบ
- [ ] ใช้แนวทางการปฏิบัติตามข้อกำหนด
- [ ] ใช้งานมาตรฐานความปลอดภัย
- [ ] การประเมินความปลอดภัยเป็นประจำ
- [ ] แผนตอบสนองเหตุการณ์

## เกณฑ์มาตรฐานประสิทธิภาพ

### เมตริกทั่วไปในสภาพแวดล้อมการผลิต

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### การทดสอบโหลด

```bash
# สคริปต์ทดสอบโหลดสำหรับแอปพลิเคชัน AI
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 แนวปฏิบัติที่ดีที่สุดจากชุมชน

อิงจากความคิดเห็นของชุมชน Microsoft Foundry บน Discord:

### คำแนะนำอันดับต้นจากชุมชน:

1. **เริ่มจากขนาดเล็ก ขยายทีละน้อย**: เริ่มด้วย SKU พื้นฐานและขยายตามการใช้งานจริง
2. **ติดตามทุกอย่าง**: ตั้งค่าการตรวจสอบอย่างครอบคลุมตั้งแต่วันแรก
3. **ทำให้อัตโนมัติด้านความปลอดภัย**: ใช้ infrastructure as code เพื่อความสม่ำเสมอด้านความปลอดภัย
4. **ทดสอบอย่างละเอียด**: รวมการทดสอบเฉพาะทาง AI ในพายไลน์ของคุณ
5. **วางแผนเรื่องค่าใช้จ่าย**: ติดตามการใช้โทเค็นและตั้งแจ้งเตืองบประมาณตั้งแต่ต้น

### ข้อควรระวังที่พบบ่อยที่ควรหลีกเลี่ยง:

- ❌ การฝังคีย์ API แบบเขียนตรงในโค้ด
- ❌ ไม่ตั้งค่าการตรวจสอบอย่างเหมาะสม
- ❌ ละเลยการปรับปรุงค่าใช้จ่าย
- ❌ ไม่ทดสอบสถานการณ์ล้มเหลว
- ❌ ปรับใช้โดยไม่ตรวจสุขภาพ

## แหล่งข้อมูลเพิ่มเติม

- **Azure Well-Architected Framework**: [AI workload guidance](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Official docs](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure channel](https://discord.gg/microsoft-azure)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎆 Course Complete**: [AZD For Beginners](../../README.md)

**โปรดจำไว้**: งาน AI สำหรับการใช้งานจริงต้องการการวางแผน การตรวจสอบ และการปรับปรุงอย่างต่อเนื่อง เริ่มจากรูปแบบเหล่านี้และปรับให้เข้ากับข้อกำหนดเฉพาะของคุณ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิดชอบ:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI Co-op Translator (https://github.com/Azure/co-op-translator) แม้ว่าเราจะมุ่งมั่นเพื่อความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำได้ เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งข้อมูลที่เป็นหลัก สำหรับข้อมูลที่มีความสำคัญ แนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใดๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->