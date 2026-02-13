# AZD सह प्रॉडक्शन AI वर्कलोडसाठी सर्वोत्तम पद्धती

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 8 - Production & Enterprise Patterns
- **⬅️ मागील अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/debugging.md)
- **⬅️ असेही संबंधित**: [AI वर्कशॉप लॅब](ai-workshop-lab.md)
- **🎯 कोर्स पूर्ण**: [AZD नवशिक्यांसाठी](../../README.md)

## अवलोकन

हा मार्गदर्शक Azure Developer CLI (AZD) वापरून प्रॉडक्शन-तयार AI वर्कलोडस् तैनात करण्यासाठी विस्तृत सर्वोत्तम पद्धती प्रदान करतो. Microsoft Foundry Discord समुदायाच्या अभिप्राय आणि वास्तविक ग्राहकांच्या तैनातींवर आधारित, या पद्धती प्रॉडक्शन AI सिस्टीममधील सर्वात सामान्य आव्हानांचे निराकरण करतात.

## निवारण केलेली प्रमुख आव्हाने

आमच्या समुदायातील मतदानाच्या निकालांनुसार, विकसकांना खालील शीर्ष आव्हानांचा सामना करावा लागतो:

- **45%** अनेक-सेवा AI डिप्लॉयमेंट्समध्ये अडचणी
- **38%** प्रमाणपत्र व रहस्य व्यवस्थापनाशी संबंधित समस्या  
- **35%** प्रॉडक्शन तयारी आणि स्केलिंग कठीण वाटते
- **32%** खर्च अनुकूलन धोरणांची गरज आहे
- **29%** ग्राहकांना सुधारित निरीक्षण व डीबगिंग आवश्यक आहे

## प्रॉडक्शन AI साठी आर्किटेक्चर पॅटर्न्स

### पॅटर्न 1: मायक्रोसर्व्हिसेस AI आर्किटेक्चर

**केव्हा वापरावे**: अनेक क्षमता असलेल्या क्लिष्ट AI अनुप्रयोगांसाठी

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

### पॅटर्न 2: इव्हेंट-ड्रिव्हन AI प्रोसेसिंग

**केव्हा वापरावे**: बॅच प्रोसेसिंग, दस्तऐवज विश्लेषण, असिंक्रोनस वर्कफ्लो साठी

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
- प्रमाणीकरणाशिवाय कोणताही सेवा-ते-सेवा संवाद नाही
- सर्व API कॉल्स व्यवस्थापित ओळखी (managed identities) वापरतात
- खाजगी एंडपॉइंटसह नेटवर्क विभाजन
- किमान विशेषाधिकार प्रवेश नियंत्रण

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

### 2. सुरक्षित गुप्त माहिती व्यवस्थापन

**Key Vault समाकलन नमुना**:

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

## कामगिरी आणि स्केलिंग

### 1. ऑटो-स्केलिंग धोरणे

**कंटेनर ऍप्स ऑटो-स्केलिंग**:

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

**AI प्रतिसादांसाठी Redis कॅश**:

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

**WAF सह Application Gateway**:

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

## 💰 खर्च अनुकूलन

### 1. संसाधनांचे योग्य आकारकरण

**पर्यावरण-विशिष्ट कॉन्फिगरेशन**:

```bash
# विकास पर्यावरण
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# उत्पादन पर्यावरण
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. खर्च निरीक्षण आणि बजेट्स

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

### 3. टोकन वापर अनुकूलन

**OpenAI खर्च व्यवस्थापन**:

```typescript
// अनुप्रयोग-स्तरीय टोकन अनुकूलन
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // संदर्भ कापा, वापरकर्त्याचे इनपुट कापू नका
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // अंदाजे: 1 टोकन ≈ 4 अक्षरे
    return Math.ceil(text.length / 4);
  }
}
```

## निरीक्षण आणि अवलोकनक्षमता

### 1. व्यापक Application Insights

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

### 2. AI-विशिष्ट निरीक्षण

**AI मेट्रिक्ससाठी सानुकूल डॅशबोर्ड**:

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

### 3. हेल्थ चेक्स आणि अपटाइम निरीक्षण

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

### 1. मल्टी-रिजन डिप्लॉयमेंट

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

## DevOps आणि CI/CD समाकलन

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

### 2. इन्फ्रास्ट्रक्चर वैधता तपासणी

```bash
# scripts/validate_infrastructure.sh
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

# OpenAI मॉडेलच्या तैनातींची पडताळणी करा
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# एआय सेवा कनेक्टिव्हिटीची तपासणी करा
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## प्रॉडक्शन रेडीनेस चेकलिस्ट

### सुरक्षा ✅
- [ ] सर्व सेवा व्यवस्थापित ओळखी वापरतात
- [ ] गुप्त माहिती Key Vault मध्ये संग्रहित केली आहे
- [ ] खाजगी एंडपॉइंट कॉन्फिगर केले गेले आहेत
- [ ] नेटवर्क सुरक्षा समूह अंमलात आणले गेले आहेत
- [ ] किमान विशेषाधिकारांसह RBAC
- [ ] सार्वजनिक एंडपॉइंट्सवर WAF सक्षम केले आहे

### कामगिरी ✅
- [ ] ऑटो-स्केलिंग कॉन्फिगर केले आहे
- [ ] कॅशिंग अंमलात आणले आहे
- [ ] लोड बॅलन्सिंग सेटअप केले आहे
- [ ] स्थिर सामग्रीसाठी CDN
- [ ] डेटाबेस कनेक्शन पूलिंग
- [ ] टोकन वापर अनुकूलन

### निरीक्षण ✅
- [ ] Application Insights कॉन्फिगर केले गेले आहेत
- [ ] सानुकूल मेट्रिक्स परिभाषित केले आहेत
- [ ] अलर्टिंग नियम सेट केले आहेत
- [ ] डॅशबोर्ड तयार केले आहे
- [ ] हेल्थ चेक्स अंमलात आणले आहेत
- [ ] लॉग रिटेन्शन धोरणे

### विश्वसनीयता ✅
- [ ] मल्टी-रिजन डिप्लॉयमेंट
- [ ] बॅकअप आणि पुनर्प्राप्ती योजना
- [ ] सर्किट ब्रेकर अंमलात आणले आहेत
- [ ] रीट्राय पॉलिसीज कॉन्फिगर केल्या आहेत
- [ ] क्रमशः कमी क्षमता दाखवण्याच्या धोरणे (Graceful degradation)
- [ ] हेल्थ चेक एंडपॉइंट्स

### खर्च व्यवस्थापन ✅
- [ ] बजेट अलर्ट्स कॉन्फिगर केले आहेत
- [ ] संसाधनांचे योग्य आकारकरण
- [ ] Dev/test सवलती लागू केल्या आहेत
- [ ] आरक्षित इन्स्टन्सेस खरेदी केल्या आहेत
- [ ] खर्च निरीक्षण डॅशबोर्ड
- [ ] नियमित खर्च पुनरावलोकने

### अनुपालन ✅
- [ ] डेटा निवास आवश्यकता पूर्ण केल्या आहेत
- [ ] ऑडिट लॉगिंग सक्षम केले आहे
- [ ] अनुपालन धोरणे लागू केली आहेत
- [ ] सुरक्षा बेसलाईन्स अंमलात आणल्या आहेत
- [ ] नियमित सुरक्षा मूल्यांकन
- [ ] अपघटन प्रतिसाद योजना

## कामगिरी बेंचमार्क

### सामान्य प्रॉडक्शन मेट्रिक्स

| Metric | Target | Monitoring |
|--------|--------|------------|
| **प्रतिक्रिया वेळ** | < 2 seconds | Application Insights |
| **उपलब्धता** | 99.9% | Uptime monitoring |
| **त्रुटी दर** | < 0.1% | Application logs |
| **टोकन वापर** | < $500/month | Cost management |
| **समानकालीन वापरकर्ते** | 1000+ | Load testing |
| **पुनर्प्राप्ती वेळ** | < 1 hour | Disaster recovery tests |

### लोड चाचणी

```bash
# एआय अनुप्रयोगांसाठी लोड चाचणी स्क्रिप्ट
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 समुदायातील सर्वोत्तम पद्धती

Microsoft Foundry Discord समुदायाच्या अभिप्रायावर आधारित:

### समुदायाकडून शीर्ष शिफारसी:

1. **लहानपासून सुरू करा, हळूहळू स्केल करा**: प्राथमिक SKUs ने प्रारंभ करा आणि वास्तविक वापरावर आधारित स्केल करा
2. **सर्वकाही निरीक्षण करा**: पहिल्यापासून व्यापक निरीक्षण सेट करा
3. **सुरक्षा ऑटोमेट करा**: सातत्यपूर्ण सुरक्षेसाठी इन्फ्रास्ट्रक्चर-अॅज-कोड वापरा
4. **पूर्णपणे तपासा**: आपल्या पाइपलाइनमध्ये AI-विशिष्ट चाचण्या समाविष्ट करा
5. **खर्चांची योजना करा**: टोकन वापर निरीक्षण करा आणि लवकरच बजेट अलर्ट सेट करा

### टाळावयाच्या सामान्य चुका:

- ❌ कोडमध्ये API की हार्डकोड करणे
- ❌ योग्य निरीक्षण न सेट करणे
- ❌ खर्च अनुकूलन दुर्लक्षित करणे
- ❌ अपयश परिस्थितींची चाचणी न करणे
- ❌ हेल्थ चेकशिवाय तैनात करणे

## अतिरिक्त संसाधने

- **Azure Well-Architected Framework**: [AI वर्कलोड मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry दस्तऐवज**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)
- **समुदाय साचा**: [Azure नमुने](https://github.com/Azure-Samples)
- **Discord समुदाय**: [#Azure चॅनेल](https://discord.gg/microsoft-azure)

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 8 - Production & Enterprise Patterns
- **⬅️ मागील अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/debugging.md)
- **⬅️ असेही संबंधित**: [AI वर्कशॉप लॅब](ai-workshop-lab.md)
- **🎆 कोर्स पूर्ण**: [AZD नवशिक्यांसाठी](../../README.md)

**लक्षात ठेवा**: उत्पादन AI वर्कलोडसाठी काळजीपूर्वक योजना, निरीक्षण आणि सततचे अनुकूलन आवश्यक आहे. या पॅटर्नपासून सुरुवात करा आणि त्यांना आपल्या विशिष्ट आवश्यकता नुसार रूपांतरित करा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हे दस्तऐवज AI अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केले गेले आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेचा अभाव असू शकतो. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थ लावल्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->