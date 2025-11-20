<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-20T15:52:00+00:00",
  "source_file": "docs/microsoft-foundry/production-ai-practices.md",
  "language_code": "mr"
}
-->
# उत्पादन AI वर्कलोडसाठी AZD सह सर्वोत्तम पद्धती

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 चालू अध्याय**: अध्याय 8 - उत्पादन आणि एंटरप्राइझ पॅटर्न्स
- **⬅️ मागील अध्याय**: [अध्याय 7: समस्या निवारण](../troubleshooting/debugging.md)
- **⬅️ संबंधित**: [AI वर्कशॉप लॅब](ai-workshop-lab.md)
- **🎯 कोर्स पूर्ण**: [AZD फॉर बिगिनर्स](../../README.md)

## आढावा

ही मार्गदर्शिका Azure Developer CLI (AZD) वापरून उत्पादन-तयार AI वर्कलोड्स तैनात करण्यासाठी व्यापक सर्वोत्तम पद्धती प्रदान करते. Microsoft Foundry Discord समुदाय आणि वास्तविक ग्राहक तैनातींमधून मिळालेल्या अभिप्रायावर आधारित, या पद्धती उत्पादन AI प्रणालींमधील सर्वात सामान्य आव्हानांना संबोधित करतात.

## मुख्य आव्हाने

आमच्या समुदाय सर्वेक्षणाच्या निकालांनुसार, विकसकांना भेडसावणारी शीर्ष आव्हाने ही आहेत:

- **45%** मल्टी-सर्व्हिस AI तैनातींमध्ये अडचण
- **38%** क्रेडेन्शियल आणि गुप्त व्यवस्थापनाशी संबंधित समस्या  
- **35%** उत्पादन तयारी आणि स्केलिंग कठीण वाटते
- **32%** खर्च ऑप्टिमायझेशन धोरणांची आवश्यकता
- **29%** मॉनिटरिंग आणि समस्या निवारण सुधारण्याची गरज

## उत्पादन AI साठी आर्किटेक्चर पॅटर्न्स

### पॅटर्न 1: मायक्रोसर्व्हिसेस AI आर्किटेक्चर

**कधी वापरावे**: अनेक क्षमतांसह जटिल AI अनुप्रयोग

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

**AZD अंमलबजावणी**:

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

### पॅटर्न 2: इव्हेंट-ड्रिव्हन AI प्रक्रिया

**कधी वापरावे**: बॅच प्रक्रिया, दस्तऐवज विश्लेषण, असिंक्रोनस वर्कफ्लो

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

## सुरक्षा सर्वोत्तम पद्धती

### 1. झिरो-ट्रस्ट सुरक्षा मॉडेल

**अंमलबजावणी धोरण**:
- प्रमाणीकरणाशिवाय कोणतीही सेवा-ते-सेवा संवाद नाही
- सर्व API कॉल्स व्यवस्थापित ओळख वापरतात
- खाजगी एंडपॉइंट्ससह नेटवर्क अलगाव
- कमीतकमी विशेषाधिकार प्रवेश नियंत्रण

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

### 2. सुरक्षित गुप्त व्यवस्थापन

**की व्हॉल्ट इंटिग्रेशन पॅटर्न**:

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

### 3. नेटवर्क सुरक्षा

**खाजगी एंडपॉइंट कॉन्फिगरेशन**:

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

## कार्यक्षमता आणि स्केलिंग

### 1. ऑटो-स्केलिंग धोरणे

**कंटेनर अॅप्स ऑटो-स्केलिंग**:

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

### 2. कॅशिंग धोरणे

**Redis Cache for AI Responses**:

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

### 3. लोड बॅलन्सिंग आणि ट्रॅफिक व्यवस्थापन

**Application Gateway with WAF**:

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

## 💰 खर्च ऑप्टिमायझेशन

### 1. संसाधन योग्य आकार देणे

**पर्यावरण-विशिष्ट कॉन्फिगरेशन्स**:

```bash
# विकास वातावरण
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# उत्पादन वातावरण
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. खर्च मॉनिटरिंग आणि बजेट्स

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

### 3. टोकन वापर ऑप्टिमायझेशन

**OpenAI खर्च व्यवस्थापन**:

```typescript
// अनुप्रयोग-स्तरीय टोकन ऑप्टिमायझेशन
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // संदर्भ कमी करा, वापरकर्त्याचा इनपुट नाही
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // अंदाजे गणना: 1 टोकन ≈ 4 अक्षरे
    return Math.ceil(text.length / 4);
  }
}
```

## मॉनिटरिंग आणि निरीक्षण

### 1. व्यापक अनुप्रयोग अंतर्दृष्टी

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

### 2. AI-विशिष्ट मॉनिटरिंग

**AI मेट्रिक्ससाठी कस्टम डॅशबोर्ड्स**:

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

### 3. हेल्थ चेक्स आणि अपटाइम मॉनिटरिंग

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

## आपत्ती पुनर्प्राप्ती आणि उच्च उपलब्धता

### 1. मल्टी-रीजन तैनाती

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

### 2. डेटा बॅकअप आणि पुनर्प्राप्ती

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

## DevOps आणि CI/CD इंटिग्रेशन

### 1. GitHub Actions वर्कफ्लो

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

### 2. इन्फ्रास्ट्रक्चर व्हॅलिडेशन

```bash
# स्क्रिप्ट्स/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# सर्व आवश्यक सेवा चालू आहेत का ते तपासा
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI मॉडेल डिप्लॉयमेंट्स सत्यापित करा
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI सेवेशी कनेक्टिव्हिटी तपासा
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## उत्पादन तयारी चेकलिस्ट

### सुरक्षा ✅
- [ ] सर्व सेवा व्यवस्थापित ओळख वापरतात
- [ ] गुप्त की व्हॉल्टमध्ये संग्रहित
- [ ] खाजगी एंडपॉइंट्स कॉन्फिगर केले
- [ ] नेटवर्क सुरक्षा गट अंमलात आणले
- [ ] कमीतकमी विशेषाधिकारांसह RBAC
- [ ] सार्वजनिक एंडपॉइंट्सवर WAF सक्षम

### कार्यक्षमता ✅
- [ ] ऑटो-स्केलिंग कॉन्फिगर केले
- [ ] कॅशिंग अंमलात आणले
- [ ] लोड बॅलन्सिंग सेटअप
- [ ] स्थिर सामग्रीसाठी CDN
- [ ] डेटाबेस कनेक्शन पूलिंग
- [ ] टोकन वापर ऑप्टिमायझेशन

### मॉनिटरिंग ✅
- [ ] अनुप्रयोग अंतर्दृष्टी कॉन्फिगर केली
- [ ] कस्टम मेट्रिक्स परिभाषित
- [ ] अलर्टिंग नियम सेटअप
- [ ] डॅशबोर्ड तयार
- [ ] हेल्थ चेक्स अंमलात आणले
- [ ] लॉग रिटेन्शन धोरणे

### विश्वसनीयता ✅
- [ ] मल्टी-रीजन तैनाती
- [ ] बॅकअप आणि पुनर्प्राप्ती योजना
- [ ] सर्किट ब्रेकर्स अंमलात आणले
- [ ] पुनर्प्रयत्न धोरणे कॉन्फिगर केली
- [ ] ग्रेसफुल डिग्रेडेशन
- [ ] हेल्थ चेक एंडपॉइंट्स

### खर्च व्यवस्थापन ✅
- [ ] बजेट अलर्ट्स कॉन्फिगर केले
- [ ] संसाधन योग्य आकार देणे
- [ ] Dev/test सवलती लागू केल्या
- [ ] आरक्षित उदाहरणे खरेदी केली
- [ ] खर्च मॉनिटरिंग डॅशबोर्ड
- [ ] नियमित खर्च पुनरावलोकने

### अनुपालन ✅
- [ ] डेटा निवासी आवश्यकता पूर्ण केल्या
- [ ] ऑडिट लॉगिंग सक्षम
- [ ] अनुपालन धोरणे लागू केली
- [ ] सुरक्षा बेसलाइन अंमलात आणली
- [ ] नियमित सुरक्षा मूल्यांकन
- [ ] घटना प्रतिसाद योजना

## कार्यक्षमता बेंचमार्क्स

### सामान्य उत्पादन मेट्रिक्स

| मेट्रिक | लक्ष्य | मॉनिटरिंग |
|--------|--------|------------|
| **प्रतिक्रिया वेळ** | < 2 सेकंद | अनुप्रयोग अंतर्दृष्टी |
| **उपलब्धता** | 99.9% | अपटाइम मॉनिटरिंग |
| **त्रुटी दर** | < 0.1% | अनुप्रयोग लॉग्स |
| **टोकन वापर** | < $500/महिना | खर्च व्यवस्थापन |
| **सहकारी वापरकर्ते** | 1000+ | लोड टेस्टिंग |
| **पुनर्प्राप्ती वेळ** | < 1 तास | आपत्ती पुनर्प्राप्ती चाचण्या |

### लोड टेस्टिंग

```bash
# एआय अनुप्रयोगांसाठी लोड चाचणी स्क्रिप्ट
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 समुदाय सर्वोत्तम पद्धती

Microsoft Foundry Discord समुदायाच्या अभिप्रायावर आधारित:

### समुदायाकडून शीर्ष शिफारसी:

1. **लहान सुरुवात करा, हळूहळू स्केल करा**: मूलभूत SKUs सह प्रारंभ करा आणि वास्तविक वापरावर आधारित स्केल करा
2. **सर्वकाही मॉनिटर करा**: पहिल्या दिवसापासून व्यापक मॉनिटरिंग सेट करा
3. **सुरक्षा स्वयंचलित करा**: सुसंगत सुरक्षेसाठी कोड म्हणून इन्फ्रास्ट्रक्चर वापरा
4. **पूर्णपणे चाचणी करा**: आपल्या पाइपलाइनमध्ये AI-विशिष्ट चाचणी समाविष्ट करा
5. **खर्चाची योजना करा**: टोकन वापर मॉनिटर करा आणि लवकर बजेट अलर्ट सेट करा

### टाळण्याचे सामान्य त्रुटी:

- ❌ कोडमध्ये API की हार्डकोड करणे
- ❌ योग्य मॉनिटरिंग सेटअप न करणे
- ❌ खर्च ऑप्टिमायझेशन दुर्लक्षित करणे
- ❌ अपयश परिस्थितींची चाचणी न करणे
- ❌ हेल्थ चेक्सशिवाय तैनात करणे

## अतिरिक्त संसाधने

- **Azure Well-Architected Framework**: [AI वर्कलोड मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry दस्तऐवज**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)
- **समुदाय टेम्पलेट्स**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord समुदाय**: [#Azure चॅनल](https://discord.gg/microsoft-azure)

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 चालू अध्याय**: अध्याय 8 - उत्पादन आणि एंटरप्राइझ पॅटर्न्स
- **⬅️ मागील अध्याय**: [अध्याय 7: समस्या निवारण](../troubleshooting/debugging.md)
- **⬅️ संबंधित**: [AI वर्कशॉप लॅब](ai-workshop-lab.md)
- **🎆 कोर्स पूर्ण**: [AZD फॉर बिगिनर्स](../../README.md)

**लक्षात ठेवा**: उत्पादन AI वर्कलोड्ससाठी काळजीपूर्वक नियोजन, मॉनिटरिंग आणि सतत ऑप्टिमायझेशन आवश्यक आहे. या पॅटर्न्ससह प्रारंभ करा आणि आपल्या विशिष्ट गरजेनुसार त्यांना अनुकूल करा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपयास लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावासह असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->