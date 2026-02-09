# Production AI Workload Best Practices with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD For Beginners](../../README.md)

## সংক্ষিপ্ত বিবরণ

এই গাইডটি Azure Developer CLI (AZD) ব্যবহার করে প্রোডাকশন-রেডি AI ওয়ার্কলোড ডিপ্লয় করার জন্য বিস্তৃত সেরা অনুশীলন প্রদান করে। Microsoft Foundry Discord কমিউনিটির প্রতিক্রিয়া এবং বাস্তব গ্রাহক ডিপ্লয়মেন্টের ভিত্তিতে, এই অনুশীলনগুলি প্রোডাকশন AI সিস্টেমে সবচেয়ে সাধারণ চ্যালেঞ্জগুলিকে সমাধান করে।

## সমাধানকৃত মূল চ্যালেঞ্জসমূহ

কমিউনিটি পোলের ফলাফলের ভিত্তিতে, ডেভেলপাররা নিম্নলিখিত শীর্ষ চ্যালেঞ্জগুলির মুখোমুখি হন:

- **45%** মাল্টি-সার্ভিস AI ডিপ্লয়মেন্ট নিয়ে সমস্যায় পড়েন
- **38%** ক্রেডেনশিয়াল এবং সিক্রেট ম্যানেজমেন্ট নিয়ে সমস্যা আছে  
- **35%** প্রোডাকশন রেডিনেস এবং স্কেলিং কঠিন মনে করেন
- **32%** আরও ভাল খরচ অপ্টিমাইজেশন কৌশল দরকার
- **29%** উন্নত মনিটরিং এবং ট্রাবলশুটিং প্রয়োজন

## প্রোডাকশন AI এর আর্কিটেকচার প্যাটার্নসমূহ

### Pattern 1: Microservices AI Architecture

**কখন ব্যবহার করবেন**: বহু ক্ষমতা বিশিষ্ট জটিল AI অ্যাপ্লিকেশনগুলির জন্য

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

**AZD বাস্তবায়ন**:

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

**কখন ব্যবহার করবেন**: ব্যাচ প্রসেসিং, ডকুমেন্ট বিশ্লেষণ, অ্যাসিঙ্ক্রোনাস ওয়ার্কফ্লো

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

## নিরাপত্তার সেরা অনুশীলন

### 1. জিরো-ট্রাস্ট নিরাপত্তা মডেল

**বাস্তবায়ন কৌশল**:
- অথেনটিকেশন ছাড়া সার্ভিস-টু-সার্ভিস যোগাযোগ নেই
- সকল API কল managed identities ব্যবহার করবে
- প্রাইভেট এন্ডপয়েন্টের মাধ্যমে নেটওয়ার্ক পৃথকীকরণ
- ন্যূনতম অনুমতির অ্যাক্সেস কন্ট্রোল

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

### 2. সুরক্ষিত সিক্রেট ব্যবস্থাপনা

**Key Vault ইন্টিগ্রেশন প্যাটার্ন**:

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

### 3. নেটওয়ার্ক নিরাপত্তা

**প্রাইভেট এন্ডপয়েন্ট কনফিগারেশন**:

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

## পারফরম্যান্স এবং স্কেলিং

### 1. অটো-স্কেলিং কৌশল

**Container Apps অটো-স্কেলিং**:

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

### 2. ক্যাশিং কৌশল

**AI রেসপন্সের জন্য Redis ক্যাশ**:

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

### 3. লোড ব্যালান্সিং এবং ট্রাফিক ম্যানেজমেন্ট

**WAF সহ Application Gateway**:

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

## 💰 খরচ অপ্টিমাইজেশন

### 1. রিসোর্স রাইট-সাইজিং

**পরিবেশ-নির্দিষ্ট কনফিগারেশনগুলো**:

```bash
# উন্নয়ন পরিবেশ
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# উৎপাদন পরিবেশ
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. খরচ পর্যবেক্ষণ এবং বাজেট

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

### 3. টোকেন ব্যবহারের অপ্টিমাইজেশন

**OpenAI খরচ ব্যবস্থাপনা**:

```typescript
// অ্যাপ্লিকেশন-স্তরের টোকেন অপ্টিমাইজেশন
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // প্রসঙ্গটি ছাঁটুন, ব্যবহারকারীর ইনপুট নয়
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // মোটামুটি অনুমান: 1 টোকেন ≈ 4 অক্ষর
    return Math.ceil(text.length / 4);
  }
}
```

## মনিটরিং এবং অবজার্ভেবিলিটি

### 1. ব্যাপক Application Insights

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

### 2. AI-নির্দিষ্ট মনিটরিং

**AI মেট্রিক্সের জন্য কাস্টম ড্যাশবোর্ড**:

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

### 3. হেলথ চেকস এবং আপটাইম মনিটরিং

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

## ডিজাস্টার রিকভারি এবং হাই অবেলিবিলিটি

### 1. মাল্টি-রিজিওন ডিপ্লয়মেন্ট

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

### 2. ডেটা ব্যাকআপ এবং রিকভারি

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

## DevOps এবং CI/CD ইন্টিগ্রেশন

### 1. GitHub Actions ওয়ার্কফ্লো

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

### 2. ইনফ্রাস্ট্রাকচার ভ্যালিডেশন

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# সব প্রয়োজনীয় সার্ভিসগুলো চলছে কি না পরীক্ষা করুন
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI মডেল ডিপ্লয়মেন্টগুলো যাচাই করুন
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI সার্ভিসের সংযোগ পরীক্ষা করুন
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## প্রোডাকশন রেডিনেস চেকলিস্ট

### নিরাপত্তা ✅
- [ ] সকল সার্ভিস ম্যানেজড আইডেন্টিটিজ ব্যবহার করে
- [ ] সিক্রেটগুলো Key Vault-এ সংরক্ষিত
- [ ] প্রাইভেট এন্ডপয়েন্ট কনফিগার করা
- [ ] নেটওয়ার্ক সিকিউরিটি গ্রুপগুলো প্রয়োগ করা
- [ ] ন্যূনতম অনুমতির সঙ্গে RBAC
- [ ] পাবলিক এন্ডপয়েন্টে WAF সক্রিয় করা হয়েছে

### পারফরম্যান্স ✅
- [ ] অটো-স্কেলিং কনফিগার করা হয়েছে
- [ ] ক্যাশিং প্রয়োগ করা হয়েছে
- [ ] লোড ব্যালান্সিং সেটআপ করা হয়েছে
- [ ] স্ট্যাটিক কন্টেন্টের জন্য CDN
- [ ] ডাটাবেস কানেকশন পুলিং
- [ ] টোকেন ব্যবহারের অপ্টিমাইজেশন

### মনিটরিং ✅
- [ ] Application Insights কনফিগার করা হয়েছে
- [ ] কাস্টম মেট্রিক্স সংজ্ঞায়িত করা হয়েছে
- [ ] অলার্টিং রুলস সেটআপ করা হয়েছে
- [ ] ড্যাশবোর্ড তৈরি করা হয়েছে
- [ ] হেলথ চেকস প্রয়োগ করা হয়েছে
- [ ] লগ সংরক্ষণ নীতি

### নির্ভরযোগ্যতা ✅
- [ ] মাল্টি-রিজিওন ডিপ্লয়মেন্ট করা হয়েছে
- [ ] ব্যাকআপ এবং রিকভারির পরিকল্পনা
- [ ] সার্কিট ব্রেকার প্রয়োগ করা হয়েছে
- [ ] রিট্রি পলিসি কনফিগার করা হয়েছে
- [ ] গ্রেসফুল ডিগ্রেডেশন
- [ ] হেলথ চেক এন্ডপয়েন্ট

### খরচ ব্যবস্থাপনা ✅
- [ ] বাজেট অ্যালার্ট কনফিগার করা হয়েছে
- [ ] রিসোর্স রাইট-সাইজিং
- [ ] ডেভ/টেস্ট ডিসকাউন্ট প্রয়োগ করা হয়েছে
- [ ] রিজার্ভড ইনস্ট্যান্স কেনা হয়েছে
- [ ] খরচ মনিটরিং ড্যাশবোর্ড
- [ ] নিয়মিত খরচ পর্যালোচনা

### সম্মতি ✅
- [ ] ডেটা রেসিডেন্সি প্রয়োজনীয়তা পূরণ করেছে
- [ ] অডিট লগিং সক্ষম করা হয়েছে
- [ ] কমপ্লায়েন্স পলিসি প্রয়োগ করা হয়েছে
- [ ] নিরাপত্তা বেসলাইন প্রয়োগ করা হয়েছে
- [ ] নিয়মিত নিরাপত্তা মূল্যায়ন
- [ ] ইনসিডেন্ট রেসপন্স পরিকল্পনা

## পারফরম্যান্স বেঞ্চমার্ক

### সাধারণ প্রোডাকশন মেট্রিক্স

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### লোড টেস্টিং

```bash
# এআই অ্যাপ্লিকেশনগুলির জন্য লোড টেস্টিং স্ক্রিপ্ট
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 কমিউনিটির সেরা অনুশীলন

Microsoft Foundry Discord কমিউনিটির প্রতিক্রিয়ার ভিত্তিতে:

### কমিউনিটির শীর্ষ সুপারিশসমূহ:

1. **ছোট থেকে শুরু করুন, ধীরে ধীরে স্কেল করুন**: প্রাথমিকভাবে বেসিক SKU দিয়ে শুরু করুন এবং বাস্তব ব্যবহার অনুযায়ী স্কেল করুন
2. **প্রতিটি জিনিস মনিটর করুন**: প্রথম দিন থেকেই ব্যাপক মনিটরিং সেট আপ করুন
3. **নিরাপত্তা অটোমেট করুন**: সুসংগত নিরাপত্তার জন্য ইনফ্রাস্ট্রাকচার অ্যাজ কোড ব্যবহার করুন
4. **পরীক্ষা সম্পূর্ণভাবে করুন**: আপনার পাইপলাইনে AI-নির্দিষ্ট টেস্টিং অন্তর্ভুক্ত করুন
5. **খরচ পরিকল্পনা করুন**: টোকেন ব্যবহার মনিটর করুন এবং আগে থেকেই বাজেট অ্যালার্ট সেট করুন

### প্রচলিত ভুলগুলি এড়িয়ে চলুন:

- ❌ কোডে API কীগুলো হার্ডকোড করা
- ❌ সঠিক মনিটরিং সেট আপ না করা
- ❌ খরচ অপ্টিমাইজেশন উপেক্ষা করা
- ❌ ব্যর্থতার পরিস্থিতি টেস্ট না করা
- ❌ হেলথ চেক ছাড়া ডিপ্লয় করা

## অতিরিক্ত রিসোর্স

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

**মনে রাখবেন**: প্রোডাকশন AI ওয়ার্কলোডগুলোর জন্য সতর্ক পরিকল্পনা, মনিটরিং, এবং ধারাবাহিক অপ্টিমাইজেশন প্রয়োজন। এই প্যাটার্নগুলো দিয়ে শুরু করুন এবং আপনার নির্দিষ্ট প্রয়োজন অনুযায়ী সেগুলোকে অভিযোজিত করুন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদকৃত। আমরা যতটা সম্ভব সঠিকতা বজায় রাখার চেষ্টা করি, তবুও অনুগ্রহ করে লক্ষ্য রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল নথিটি তার নিজ ভাষায়ই কর্তৃপক্ষসম্মত উৎস হিসেবে বিবেচিত হবে। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করা প্রস্তাবিত। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো বিভ্রান্তি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->