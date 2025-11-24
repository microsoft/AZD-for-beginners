<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-24T10:31:12+00:00",
  "source_file": "docs/microsoft-foundry/production-ai-practices.md",
  "language_code": "lt"
}
-->
# Geriausios praktikos dirbant su gamybiniais AI darbo krūviais naudojant AZD

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 8 skyrius - Gamybiniai ir įmonių modeliai
- **⬅️ Ankstesnis skyrius**: [7 skyrius: Trikčių šalinimas](../troubleshooting/debugging.md)
- **⬅️ Taip pat susiję**: [AI dirbtuvių laboratorija](ai-workshop-lab.md)
- **🎯 Kurso pabaiga**: [AZD pradedantiesiems](../../README.md)

## Apžvalga

Šis vadovas pateikia išsamias geriausias praktikas, kaip diegti gamybai paruoštus AI darbo krūvius naudojant Azure Developer CLI (AZD). Remiantis „Microsoft Foundry“ Discord bendruomenės atsiliepimais ir realių klientų diegimais, šios praktikos sprendžia dažniausiai pasitaikančius iššūkius gamybiniuose AI sistemose.

## Pagrindiniai sprendžiami iššūkiai

Remiantis mūsų bendruomenės apklausos rezultatais, tai yra pagrindiniai iššūkiai, su kuriais susiduria kūrėjai:

- **45%** susiduria su daugiapaslaugiais AI diegimais
- **38%** turi problemų su kredencialų ir slaptų duomenų valdymu  
- **35%** sunku užtikrinti gamybinį pasirengimą ir mastelį
- **32%** reikia geresnių kaštų optimizavimo strategijų
- **29%** reikia patobulinto stebėjimo ir trikčių šalinimo

## Architektūros modeliai gamybiniam AI

### Modelis 1: Mikroservisų AI architektūra

**Kada naudoti**: Sudėtingoms AI programoms su keliomis funkcijomis

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

**AZD įgyvendinimas**:

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

### Modelis 2: Įvykių pagrindu veikiantis AI apdorojimas

**Kada naudoti**: Partijų apdorojimui, dokumentų analizei, asinchroniniams darbo srautams

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

## Saugumo geriausios praktikos

### 1. „Zero-Trust“ saugumo modelis

**Įgyvendinimo strategija**:
- Jokio paslaugų tarpusavio ryšio be autentifikacijos
- Visi API skambučiai naudoja valdomas tapatybes
- Tinklo izoliacija su privačiais galiniais taškais
- Minimalios privilegijos prieigos kontrolė

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

### 2. Saugus slaptų duomenų valdymas

**Key Vault integracijos modelis**:

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

### 3. Tinklo saugumas

**Privačių galinių taškų konfigūracija**:

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

## Našumas ir mastelio keitimas

### 1. Automatinio mastelio keitimo strategijos

**Konteinerių programų automatinis mastelio keitimas**:

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

### 2. Kešavimo strategijos

**Redis Cache AI atsakymams**:

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

### 3. Apkrovos balansavimas ir srauto valdymas

**Application Gateway su WAF**:

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

## 💰 Kaštų optimizavimas

### 1. Išteklių tinkamo dydžio nustatymas

**Aplinkai pritaikytos konfigūracijos**:

```bash
# Kūrimo aplinka
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Gamybos aplinka
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Kaštų stebėjimas ir biudžetai

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

### 3. Žetonų naudojimo optimizavimas

**OpenAI kaštų valdymas**:

```typescript
// Programos lygio žetonų optimizavimas
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Sutrumpinti kontekstą, o ne vartotojo įvestį
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Apytikslis įvertinimas: 1 žetonas ≈ 4 simboliai
    return Math.ceil(text.length / 4);
  }
}
```

## Stebėjimas ir stebimumas

### 1. Išsamūs programos įžvalgos

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

### 2. AI specifinis stebėjimas

**Individualūs prietaisų skydeliai AI metrikoms**:

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

### 3. Sveikatos patikros ir veikimo stebėjimas

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

## Atsigavimas po nelaimių ir didelis prieinamumas

### 1. Diegimas keliuose regionuose

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

### 2. Duomenų atsarginės kopijos ir atkūrimas

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

## DevOps ir CI/CD integracija

### 1. GitHub Actions darbo eiga

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

### 2. Infrastruktūros patikrinimas

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Patikrinkite, ar visi reikalingi paslaugos veikia
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Patvirtinkite OpenAI modelių diegimus
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Patikrinkite AI paslaugos ryšį
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Gamybinio pasirengimo kontrolinis sąrašas

### Saugumas ✅
- [ ] Visos paslaugos naudoja valdomas tapatybes
- [ ] Slapti duomenys saugomi Key Vault
- [ ] Suprivačiai galiniai taškai sukonfigūruoti
- [ ] Įgyvendintos tinklo saugumo grupės
- [ ] RBAC su minimaliomis privilegijomis
- [ ] WAF įjungtas viešuose galiniuose taškuose

### Našumas ✅
- [ ] Suprivačiai automatinis mastelio keitimas
- [ ] Įgyvendintas kešavimas
- [ ] Apkrovos balansavimas nustatytas
- [ ] CDN statiniam turiniui
- [ ] Duomenų bazės ryšių telkimas
- [ ] Žetonų naudojimo optimizavimas

### Stebėjimas ✅
- [ ] Programos įžvalgos sukonfigūruotos
- [ ] Apibrėžtos individualios metrikos
- [ ] Sukurtos įspėjimo taisyklės
- [ ] Sukurtas prietaisų skydelis
- [ ] Įgyvendintos sveikatos patikros
- [ ] Žurnalų saugojimo politika

### Patikimumas ✅
- [ ] Diegimas keliuose regionuose
- [ ] Atsarginių kopijų ir atkūrimo planas
- [ ] Įgyvendinti grandinės pertraukikliai
- [ ] Suprivačiai pakartojimo politikos
- [ ] Malonus degradavimas
- [ ] Sveikatos patikros galiniai taškai

### Kaštų valdymas ✅
- [ ] Suprivačiai biudžeto įspėjimai
- [ ] Išteklių tinkamo dydžio nustatymas
- [ ] Taikomos nuolaidos kūrimui/testavimui
- [ ] Įsigytos rezervuotos instancijos
- [ ] Kaštų stebėjimo prietaisų skydelis
- [ ] Reguliarūs kaštų peržiūros

### Atitiktis ✅
- [ ] Atitinka duomenų rezidencijos reikalavimus
- [ ] Įjungtas audito žurnalų vedimas
- [ ] Taikomos atitikties politikos
- [ ] Įgyvendinti saugumo pagrindai
- [ ] Reguliarūs saugumo vertinimai
- [ ] Incidentų reagavimo planas

## Našumo etalonai

### Tipiniai gamybiniai rodikliai

| Rodiklis | Tikslas | Stebėjimas |
|----------|---------|------------|
| **Atsako laikas** | < 2 sekundės | Programos įžvalgos |
| **Prieinamumas** | 99.9% | Veikimo stebėjimas |
| **Klaidos rodiklis** | < 0.1% | Programos žurnalai |
| **Žetonų naudojimas** | < $500/mėn. | Kaštų valdymas |
| **Vienu metu vartotojai** | 1000+ | Apkrovos testavimas |
| **Atkūrimo laikas** | < 1 valanda | Atsigavimo po nelaimių testai |

### Apkrovos testavimas

```bash
# Apkrovos testavimo scenarijus AI programoms
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Bendruomenės geriausios praktikos

Remiantis „Microsoft Foundry“ Discord bendruomenės atsiliepimais:

### Pagrindinės bendruomenės rekomendacijos:

1. **Pradėkite nuo mažo, auginkite palaipsniui**: Pradėkite nuo bazinių SKU ir didinkite pagal faktinį naudojimą
2. **Stebėkite viską**: Nuo pirmos dienos įdiekite išsamų stebėjimą
3. **Automatizuokite saugumą**: Naudokite infrastruktūrą kaip kodą nuosekliam saugumui
4. **Kruopščiai testuokite**: Įtraukite AI specifinį testavimą į savo procesą
5. **Planuokite kaštus**: Stebėkite žetonų naudojimą ir anksti nustatykite biudžeto įspėjimus

### Dažniausiai pasitaikančios klaidos, kurių reikia vengti:

- ❌ API raktų kietasis kodavimas kode
- ❌ Tinkamo stebėjimo neįdiegimas
- ❌ Kaštų optimizavimo ignoravimas
- ❌ Gedimų scenarijų netestavimas
- ❌ Diegimas be sveikatos patikrų

## Papildomi ištekliai

- **Azure gerai suprojektuotos architektūros pagrindai**: [AI darbo krūvių gairės](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry dokumentacija**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Bendruomenės šablonai**: [Azure pavyzdžiai](https://github.com/Azure-Samples)
- **Discord bendruomenė**: [#Azure kanalas](https://discord.gg/microsoft-azure)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 8 skyrius - Gamybiniai ir įmonių modeliai
- **⬅️ Ankstesnis skyrius**: [7 skyrius: Trikčių šalinimas](../troubleshooting/debugging.md)
- **⬅️ Taip pat susiję**: [AI dirbtuvių laboratorija](ai-workshop-lab.md)
- **🎆 Kurso pabaiga**: [AZD pradedantiesiems](../../README.md)

**Prisiminkite**: Gamybiniai AI darbo krūviai reikalauja kruopštaus planavimo, stebėjimo ir nuolatinio optimizavimo. Pradėkite nuo šių modelių ir pritaikykite juos pagal savo specifinius poreikius.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->