<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "db39cf7acc134578c846d7accd6bb04d",
  "translation_date": "2025-09-12T19:33:46+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "ne"
}
-->
# उत्पादन AI कार्यभारको लागि AZD संग उत्कृष्ट अभ्यासहरू

**अघिल्लो:** [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md) | **अर्को:** [AI समस्या समाधान मार्गदर्शक](../troubleshooting/ai-troubleshooting.md)

## अवलोकन

यो मार्गदर्शकले Azure Developer CLI (AZD) प्रयोग गरेर उत्पादन-तयार AI कार्यभारहरू तैनात गर्नका लागि व्यापक उत्कृष्ट अभ्यासहरू प्रदान गर्दछ। Azure AI Foundry Discord समुदाय र वास्तविक ग्राहक तैनातीहरूबाट प्राप्त प्रतिक्रियामा आधारित, यी अभ्यासहरूले उत्पादन AI प्रणालीहरूमा सबैभन्दा सामान्य चुनौतीहरूलाई सम्बोधन गर्छ।

## सम्बोधित प्रमुख चुनौतीहरू

हाम्रो समुदायको सर्वेक्षण परिणामहरूमा आधारित, विकासकर्ताहरूले सामना गर्ने शीर्ष चुनौतीहरू यस्ता छन्:

- **४५%** बहु-सेवा AI तैनातीमा संघर्ष गर्छन्
- **३८%** प्रमाणपत्र र गोप्य व्यवस्थापनमा समस्या छ  
- **३५%** उत्पादन तयारी र स्केलिङलाई कठिन मान्छन्
- **३२%** लागत अनुकूलन रणनीतिहरू सुधार गर्न आवश्यक छ
- **२९%** निगरानी र समस्या समाधान सुधार गर्न आवश्यक छ

## उत्पादन AI को लागि वास्तुकला ढाँचाहरू

### ढाँचा १: माइक्रोसर्भिसेस AI वास्तुकला

**कहिले प्रयोग गर्ने**: बहु-क्षमताहरू भएको जटिल AI अनुप्रयोगहरू

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

**AZD कार्यान्वयन**:

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

### ढाँचा २: घटना-चालित AI प्रशोधन

**कहिले प्रयोग गर्ने**: ब्याच प्रशोधन, दस्तावेज विश्लेषण, असिंक्रोन वर्कफ्लोहरू

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

## सुरक्षा उत्कृष्ट अभ्यासहरू

### १. शून्य-विश्वास सुरक्षा मोडेल

**कार्यान्वयन रणनीति**:
- प्रमाणीकरण बिना कुनै सेवा-सेवा संचार छैन
- सबै API कलहरू प्रबन्धित पहिचानहरू प्रयोग गर्छन्
- निजी अन्त बिन्दुहरूसँग नेटवर्क अलगाव
- न्यूनतम विशेषाधिकार पहुँच नियन्त्रण

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

### २. सुरक्षित गोप्य व्यवस्थापन

**Key Vault एकीकरण ढाँचा**:

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

### ३. नेटवर्क सुरक्षा

**निजी अन्त बिन्दु कन्फिगरेसन**:

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

## प्रदर्शन र स्केलिङ

### १. स्वतः-स्केलिङ रणनीतिहरू

**कन्टेनर अनुप्रयोगहरू स्वतः-स्केलिङ**:

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

### २. क्यासिङ रणनीतिहरू

**Redis Cache को लागि AI प्रतिक्रियाहरू**:

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

### ३. लोड ब्यालेन्सिङ र ट्राफिक व्यवस्थापन

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

## 💰 लागत अनुकूलन

### १. स्रोतको सही आकार निर्धारण

**पर्यावरण-विशिष्ट कन्फिगरेसनहरू**:

```bash
# Development environment
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Production environment  
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### २. लागत निगरानी र बजेटहरू

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

### ३. टोकन प्रयोग अनुकूलन

**OpenAI लागत व्यवस्थापन**:

```typescript
// Application-level token optimization
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Truncate context, not user input
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Rough estimation: 1 token ≈ 4 characters
    return Math.ceil(text.length / 4);
  }
}
```

## निगरानी र अवलोकनीयता

### १. व्यापक अनुप्रयोग अन्तर्दृष्टि

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

### २. AI-विशिष्ट निगरानी

**AI मेट्रिक्सको लागि कस्टम ड्यासबोर्डहरू**:

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

### ३. स्वास्थ्य जाँच र अपटाइम निगरानी

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

## आपदा पुनर्प्राप्ति र उच्च उपलब्धता

### १. बहु-क्षेत्र तैनाती

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

### २. डेटा ब्याकअप र पुनर्प्राप्ति

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

## DevOps र CI/CD एकीकरण

### १. GitHub Actions वर्कफ्लो

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

### २. पूर्वाधार मान्यता

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Check if all required services are running
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Validate OpenAI model deployments
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Test AI service connectivity
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## उत्पादन तयारी चेकलिस्ट

### सुरक्षा ✅
- [ ] सबै सेवाहरूले प्रबन्धित पहिचानहरू प्रयोग गर्छन्
- [ ] गोप्य Key Vault मा भण्डारण गरिएको छ
- [ ] निजी अन्त बिन्दुहरू कन्फिगर गरिएको छ
- [ ] नेटवर्क सुरक्षा समूहहरू कार्यान्वित गरिएको छ
- [ ] न्यूनतम विशेषाधिकारको साथ RBAC
- [ ] सार्वजनिक अन्त बिन्दुहरूमा WAF सक्षम गरिएको छ

### प्रदर्शन ✅
- [ ] स्वतः-स्केलिङ कन्फिगर गरिएको छ
- [ ] क्यासिङ कार्यान्वित गरिएको छ
- [ ] लोड ब्यालेन्सिङ सेटअप गरिएको छ
- [ ] स्थिर सामग्रीको लागि CDN
- [ ] डाटाबेस कनेक्शन पूलिङ
- [ ] टोकन प्रयोग अनुकूलन

### निगरानी ✅
- [ ] अनुप्रयोग अन्तर्दृष्टि कन्फिगर गरिएको छ
- [ ] कस्टम मेट्रिक्स परिभाषित गरिएको छ
- [ ] चेतावनी नियमहरू सेटअप गरिएको छ
- [ ] ड्यासबोर्ड सिर्जना गरिएको छ
- [ ] स्वास्थ्य जाँच कार्यान्वित गरिएको छ
- [ ] लग प्रतिधारण नीतिहरू

### विश्वसनीयता ✅
- [ ] बहु-क्षेत्र तैनाती
- [ ] ब्याकअप र पुनर्प्राप्ति योजना
- [ ] सर्किट ब्रेकरहरू कार्यान्वित गरिएको छ
- [ ] पुन: प्रयास नीतिहरू कन्फिगर गरिएको छ
- [ ] ग्रेसफुल डिग्रेडेशन
- [ ] स्वास्थ्य जाँच अन्त बिन्दुहरू

### लागत व्यवस्थापन ✅
- [ ] बजेट चेतावनीहरू कन्फिगर गरिएको छ
- [ ] स्रोतको सही आकार निर्धारण
- [ ] विकास/परीक्षण छुटहरू लागू गरिएको छ
- [ ] आरक्षित उदाहरणहरू खरिद गरिएको छ
- [ ] लागत निगरानी ड्यासबोर्ड
- [ ] नियमित लागत समीक्षा

### अनुपालन ✅
- [ ] डेटा निवास आवश्यकताहरू पूरा गरिएको छ
- [ ] अडिट लग सक्षम गरिएको छ
- [ ] अनुपालन नीतिहरू लागू गरिएको छ
- [ ] सुरक्षा आधाररेखा कार्यान्वित गरिएको छ
- [ ] नियमित सुरक्षा मूल्यांकनहरू
- [ ] घटना प्रतिक्रिया योजना

## प्रदर्शन बेंचमार्कहरू

### सामान्य उत्पादन मेट्रिक्स

| मेट्रिक | लक्ष्य | निगरानी |
|--------|--------|------------|
| **प्रतिक्रिया समय** | < २ सेकेन्ड | अनुप्रयोग अन्तर्दृष्टि |
| **उपलब्धता** | ९९.९% | अपटाइम निगरानी |
| **त्रुटि दर** | < ०.१% | अनुप्रयोग लगहरू |
| **टोकन प्रयोग** | < $५००/महिना | लागत व्यवस्थापन |
| **समानान्तर प्रयोगकर्ता** | १०००+ | लोड परीक्षण |
| **पुनर्प्राप्ति समय** | < १ घण्टा | आपदा पुनर्प्राप्ति परीक्षणहरू |

### लोड परीक्षण

```bash
# Load testing script for AI applications
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 समुदाय उत्कृष्ट अभ्यासहरू

Azure AI Foundry Discord समुदायको प्रतिक्रियामा आधारित:

### समुदायबाट शीर्ष सिफारिसहरू:

1. **सानो सुरु गर्नुहोस्, क्रमिक रूपमा स्केल गर्नुहोस्**: आधारभूत SKUs बाट सुरु गर्नुहोस् र वास्तविक प्रयोगको आधारमा स्केल गर्नुहोस्
2. **सबै कुरा निगरानी गर्नुहोस्**: पहिलो दिनदेखि व्यापक निगरानी सेटअप गर्नुहोस्
3. **सुरक्षा स्वचालित गर्नुहोस्**: निरन्तर सुरक्षाको लागि पूर्वाधार कोडको रूपमा प्रयोग गर्नुहोस्
4. **थोरै परीक्षण गर्नुहोस्**: आफ्नो पाइपलाइनमा AI-विशिष्ट परीक्षण समावेश गर्नुहोस्
5. **लागतको योजना बनाउनुहोस्**: टोकन प्रयोग निगरानी गर्नुहोस् र प्रारम्भिक बजेट चेतावनी सेट गर्नुहोस्

### सामान्य गल्तीहरूबाट बच्नुहोस्:

- ❌ कोडमा API कुञ्जीहरू हार्डकोड गर्नुहोस्
- ❌ उचित निगरानी सेटअप नगर्नुहोस्
- ❌ लागत अनुकूलनलाई बेवास्ता गर्नुहोस्
- ❌ असफलता परिदृश्यहरू परीक्षण नगर्नुहोस्
- ❌ स्वास्थ्य जाँच बिना तैनाती गर्नुहोस्

## थप स्रोतहरू

- **Azure राम्रो-आर्किटेक्चर फ्रेमवर्क**: [AI कार्यभार मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Azure AI Foundry दस्तावेजीकरण**: [आधिकारिक दस्तावेज](https://learn.microsoft.com/azure/ai-studio/)
- **समुदाय टेम्प्लेटहरू**: [Azure नमूनाहरू](https://github.com/Azure-Samples)
- **Discord समुदाय**: [#Azure च्यानल](https://discord.gg/microsoft-azure)

---

**अघिल्लो:** [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md) | **अर्को:** [AI समस्या समाधान मार्गदर्शक](../troubleshooting/ai-troubleshooting.md)

**स्मरण गर्नुहोस्**: उत्पादन AI कार्यभारहरू सावधानीपूर्वक योजना, निगरानी, र निरन्तर अनुकूलन आवश्यक छ। यी ढाँचाहरूबाट सुरु गर्नुहोस् र तिनीहरूलाई तपाईंको विशिष्ट आवश्यकताहरूमा अनुकूलित गर्नुहोस्।

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।