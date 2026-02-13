# Mazoea Bora kwa Mizigo ya Kazi ya AI za Uzalishaji kwa AZD

**Chapter Navigation:**
- **📚 Nyumbani wa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Sura ya Awali**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Pia Yanayohusiana**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Kozi Imekamilika**: [AZD For Beginners](../../README.md)

## Muhtasari

Mwongozo huu unatoa mazoea bora kwa kupeleka mizigo ya kazi ya AI inayofaa kwa uzalishaji kwa kutumia Azure Developer CLI (AZD). Kulingana na maoni kutoka kwa jamii ya Microsoft Foundry Discord na utekelezaji halisi wa wateja, mazoea haya yanashughulikia changamoto za kawaida zaidi katika mifumo ya AI ya uzalishaji.

## Changamoto Kuu Zinazoshughulikiwa

Kulingana na matokeo ya kura za jamii yetu, hizi ndizo changamoto kuu zinazowakabili watengenezaji:

- **45%** wanapata shida na uzinduzi wa AI wenye huduma nyingi
- **38%** wana matatizo na usimamizi wa vitambulisho na siri  
- **35%** wanapata ugumu katika utoaji wa uzalishaji na upanuaji
- **32%** wanahitaji mikakati bora ya uboreshaji wa gharama
- **29%** wana hitaji la uboreshaji wa ufuatiliaji na utatuzi wa matatizo

## Miundo ya Usanifu kwa AI ya Uzalishaji

### Mfano 1: Usanifu wa AI wa Microservices

**Wakati wa kutumia**: Programu tata za AI zenye uwezo mwingi

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

**Utekelezaji wa AZD**:

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

### Mfano 2: Usindikaji wa AI unaoendeshwa na Matukio

**Wakati wa kutumia**: Usindikaji wa kundi (batch), uchambuzi wa nyaraka, miradi ya kazi zisizo za sambamba

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

## Mbinu Bora za Usalama

### 1. Mfumo wa Usalama wa Zero-Trust

**Mikakati ya Utekelezaji**:
- Hakuna mawasiliano ya huduma kwa huduma bila uthibitisho
- Miito ya API yote inatumia vitambulisho vinavyosimamiwa
- Kutenganishwa kwa mtandao kwa kutumia endpoints za kibinafsi
- Udhibiti wa upatikanaji wa haki ndogo (least privilege)

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

### 2. Usimamizi Salama wa Siri

**Mfumo wa Uunganishaji wa Key Vault**:

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

### 3. Usalama wa Mtandao

**Usanidi wa Endpoint Binafsi**:

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

## Utendaji na Upanuaji

### 1. Mikakati ya Kujiendesha kwa Upanuaji

**Kujiendesha kwa Upanuaji kwa Container Apps**:

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

### 2. Mikakati ya Kuhifadhi Katika Cache

**Redis Cache kwa Majibu ya AI**:

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

### 3. Usawazishaji wa Mzigo na Usimamizi wa Trafiki

**Application Gateway na WAF**:

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

## 💰 Uboreshaji wa Gharama

### 1. Kupima Rasilimali Kwa Ustahili

**Usanidi Maalum kwa Mazingira**:

```bash
# Mazingira ya maendeleo
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Mazingira ya uzalishaji
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Ufuatiliaji wa Gharama na Bajeti

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

### 3. Uboreshaji wa Matumizi ya Tokeni

**Usimamizi wa Gharama za OpenAI**:

```typescript
// Uboreshaji wa tokeni kwa ngazi ya programu
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Fupisha muktadha, sio ingizo la mtumiaji
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Makadirio ya karibu: 1 token ≈ 4 herufi
    return Math.ceil(text.length / 4);
  }
}
```

## Ufuatiliaji na Uwezo wa Kuonekana

### 1. Application Insights Kamili

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

### 2. Ufuatiliaji Maalum kwa AI

**Dashibodi Maalum kwa Vipimo vya AI**:

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

### 3. Mikaguzi ya Afya na Ufuatiliaji wa Uptime

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

## Ufufuaji kwa Ajali na Upatikanaji wa Juu

### 1. Uwekezaji katika Mikoa Nyingi

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

### 2. Nakili za Data na Ufufuaji

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

## DevOps na Uunganishaji wa CI/CD

### 1. Mtiririko wa Kazi wa GitHub Actions

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

### 2. Uthibitishaji wa Miundombinu

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Angalia kama huduma zote zinazohitajika zinafanya kazi
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Thibitisha uenezaji wa modeli za OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Jaribu muunganisho wa huduma ya AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Orodha ya Ukamilishaji kwa Uzalishaji

### Usalama ✅
- [ ] Huduma zote zinatumia vitambulisho vinavyosimamiwa
- [ ] Siri zimehifadhiwa katika Key Vault
- [ ] Endpoints binafsi zimesanidiwa
- [ ] Vikundi vya usalama wa mtandao vimetekelezwa
- [ ] RBAC kwa udhibiti wa haki ndogo
- [ ] WAF imewezeshwa kwenye endpoints za umma

### Utendaji ✅
- [ ] Kujiendesha kwa upanuaji kumesanidiwa
- [ ] Kuhifadhi katika cache kumewekwa
- [ ] Usawazishaji wa mzigo umetayarishwa
- [ ] CDN kwa maudhui yasiyobadilika
- [ ] Pooling ya muunganisho wa hifadhidata
- [ ] Uboreshaji wa matumizi ya tokeni

### Ufuatiliaji ✅
- [ ] Application Insights imesanidiwa
- [ ] Vipimo maalum vimefafanuliwa
- [ ] Kanuni za tahadhari zimesanidiwa
- [ ] Dashibodi imeundwa
- [ ] Mikaguzi ya afya imetekelezwa
- [ ] Sera za uhifadhi wa logi

### Uthabiti ✅
- [ ] Uwekezaji katika mikoa mingi
- [ ] Mpango wa nakili na ufufuaji
- [ ] Vizuizi vya mzunguko vimetekelezwa
- [ ] Sera za kurudia zimewekwa
- [ ] Kupungua kwa heshima polepole (graceful degradation)
- [ ] Endpoints za kukagua afya

### Usimamizi wa Gharama ✅
- [ ] Tahadhari za bajeti zimesanidiwa
- [ ] Kupima rasilimali kwa ustahili
- [ ] Punguzo kwa maendeleo/mtihani yamewekwa
- [ ] Mashine zilizoegeshwa (reserved instances) zimelinunuliwa
- [ ] Dashibodi ya ufuatiliaji wa gharama
- [ ] Mapitio ya gharama ya kawaida

### Uzingatiaji ✅
- [ ] Mahitaji ya makazi ya data yametimizwa
- [ ] Ufuatiliaji wa ukaguzi umewezeshwa
- [ ] Sera za uzingatiaji zimetumika
- [ ] Misingi ya usalama imetekelezwa
- [ ] Tathmini za usalama za kawaida
- [ ] Mpango wa kukabiliana na matukio ya usalama

## Vigezo vya Utendaji

### Vipimo vya Kawaida vya Uzalishaji

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Muda wa Majibu** | < 2 sekunde | Application Insights |
| **Upatikanaji** | 99.9% | Ufuatiliaji wa uptime |
| **Kiwango cha Makosa** | < 0.1% | Logi za programu |
| **Matumizi ya Tokeni** | < $500/mwezi | Usimamizi wa gharama |
| **Watumiaji Wanaofanya kazi kwa wakati mmoja** | 1000+ | Upimaji wa mzigo |
| **Muda wa Ufufuaji** | < 1 hour | Majaribio ya ufufuaji wa dharura |

### Upimaji wa Mzigo

```bash
# Skripti ya upimaji wa mzigo kwa programu za akili bandia
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Mazoea Bora ya Jamii

Kulingana na maoni ya jamii ya Microsoft Foundry Discord:

### Mapendekezo Muhimu kutoka kwa Jamii:

1. **Anza Ndogo, Panua Polepole**: Anza na SKUs za msingi na panua kulingana na matumizi halisi
2. **Fuatilia Kila Kitu**: Sanidi ufuatiliaji kamili tangu siku ya kwanza
3. **Panga Usalama Kiotomatiki**: Tumia miundombinu kama msimbo kwa usalama thabiti
4. **Fanya Majaribio Vizuri**: Jumuisha upimaji maalum kwa AI katika mchakato wako wa utoaji
5. **Panga Gharama**: Fuatilia matumizi ya tokeni na weka tahadhari za bajeti mapema

### Makosa ya Kawaida ya Kuepuka:

- ❌ Kuandika vitufe vya API moja kwa moja katika msimbo
- ❌ Kutosanidi ufuatiliaji unaofaa
- ❌ Kupuuza uboreshaji wa gharama
- ❌ Kutojaribu hali za kushindwa
- ❌ Kupeleka bila mikaguzi ya afya

## Rasilimali Zingine

- **Azure Well-Architected Framework**: [miongozo kwa mzigo wa AI](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [nyaraka rasmi](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Mifano ya Azure](https://github.com/Azure-Samples)
- **Discord Community**: [chaneli ya #Azure](https://discord.gg/microsoft-azure)

---

**Chapter Navigation:**
- **📚 Nyumbani wa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Sura ya Awali**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Pia Yanayohusiana**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎆 Kozi Imekamilika**: [AZD For Beginners](../../README.md)

**Kumbuka**: Mizigo ya kazi ya AI kwa uzalishaji yanahitaji upangaji wa makini, ufuatiliaji, na uboreshaji endelevu. Anza na mifumo hii na uibadilishe kulingana na mahitaji yako maalum.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Angalizo:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa habari muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyofanywa na mtaalamu wa binadamu. Hatuwajibiki kwa uelewa mbaya au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->