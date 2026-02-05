# Tuotantokäyttöön tarkoitettujen AI-työkuormien parhaat käytännöt AZD:n avulla

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 8 - Tuotanto- ja yrityskäytännöt
- **⬅️ Edellinen luku**: [Luku 7: Vianetsintä](../troubleshooting/debugging.md)
- **⬅️ Myös liittyvä**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Kurssi valmis**: [AZD Aloittelijoille](../../README.md)

## Yleiskatsaus

Tämä opas tarjoaa kattavat parhaat käytännöt tuotantovalmiiden AI-työkuormien käyttöönottoon Azure Developer CLI:n (AZD) avulla. Microsoft Foundry Discord -yhteisön palautteen ja todellisten asiakasprojektien perusteella nämä käytännöt käsittelevät yleisimpiä haasteita tuotantokäytössä olevissa AI-järjestelmissä.

## Keskeiset haasteet

Yhteisön kyselyn tulosten perusteella nämä ovat kehittäjien yleisimmät haasteet:

- **45 %** kamppailee monipalveluisten AI-järjestelmien käyttöönotossa
- **38 %** kohtaa ongelmia tunnusten ja salaisuuksien hallinnassa  
- **35 %** pitää tuotantovalmiuden ja skaalautuvuuden saavuttamista vaikeana
- **32 %** tarvitsee parempia kustannusten optimointistrategioita
- **29 %** kaipaa parannuksia seurantaan ja vianetsintään

## Arkkitehtuurimallit tuotantokäyttöön tarkoitettuihin AI-järjestelmiin

### Malli 1: Mikroservices AI-arkkitehtuuri

**Milloin käyttää**: Monimutkaiset AI-sovellukset, joissa on useita toiminnallisuuksia

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

**AZD-toteutus**:

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

### Malli 2: Tapahtumapohjainen AI-prosessointi

**Milloin käyttää**: Eräajot, asiakirjojen analysointi, asynkroniset työnkulut

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

## Turvallisuuden parhaat käytännöt

### 1. Zero-Trust-turvamalli

**Toteutusstrategia**:
- Ei palveluiden välistä viestintää ilman autentikointia
- Kaikki API-kutsut käyttävät hallittuja identiteettejä
- Verkon eristäminen yksityisillä päätepisteillä
- Vähimmäisoikeuksien käyttöoikeudet

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

### 2. Salaisuuksien turvallinen hallinta

**Key Vault -integraatiomalli**:

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

### 3. Verkkoturvallisuus

**Yksityisten päätepisteiden konfigurointi**:

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

## Suorituskyky ja skaalautuvuus

### 1. Automaattisen skaalauksen strategiat

**Container Apps -automaattinen skaalaus**:

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

### 2. Välimuististrategiat

**Redis Cache AI-vastauksille**:

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

### 3. Kuormituksen tasapainotus ja liikenteen hallinta

**Application Gateway WAF:lla**:

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

## 💰 Kustannusten optimointi

### 1. Resurssien oikea mitoitus

**Ympäristökohtaiset konfiguraatiot**:

```bash
# Kehitysympäristö
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Tuotantoympäristö
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Kustannusten seuranta ja budjetit

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

### 3. Tokenien käytön optimointi

**OpenAI-kustannusten hallinta**:

```typescript
// Sovellustason token-optimointi
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Katkaise konteksti, ei käyttäjän syötettä
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Karkea arvio: 1 token ≈ 4 merkkiä
    return Math.ceil(text.length / 4);
  }
}
```

## Seuranta ja näkyvyys

### 1. Kattavat Application Insights -näkymät

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

### 2. AI-spesifinen seuranta

**Mukautetut hallintapaneelit AI-metriikoille**:

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

### 3. Terveystarkistukset ja käyttöajan seuranta

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

## Katastrofipalautus ja korkea käytettävyys

### 1. Monialueinen käyttöönotto

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

### 2. Tietojen varmuuskopiointi ja palautus

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

## DevOps ja CI/CD-integraatio

### 1. GitHub Actions -työnkulku

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

### 2. Infrastruktuurin validointi

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Tarkista, että kaikki vaaditut palvelut ovat käynnissä
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Vahvista OpenAI-mallien käyttöönotot
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Testaa AI-palvelun yhteys
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Tuotantovalmiuden tarkistuslista

### Turvallisuus ✅
- [ ] Kaikki palvelut käyttävät hallittuja identiteettejä
- [ ] Salaisuudet tallennettu Key Vaultiin
- [ ] Yksityiset päätepisteet konfiguroitu
- [ ] Verkkoturvallisuusryhmät toteutettu
- [ ] RBAC vähimmäisoikeuksilla
- [ ] WAF aktivoitu julkisilla päätepisteillä

### Suorituskyky ✅
- [ ] Automaattinen skaalaus konfiguroitu
- [ ] Välimuisti toteutettu
- [ ] Kuormituksen tasapainotus asetettu
- [ ] CDN staattiselle sisällölle
- [ ] Tietokantayhteyksien poolaus
- [ ] Tokenien käytön optimointi

### Seuranta ✅
- [ ] Application Insights konfiguroitu
- [ ] Mukautetut metriikat määritelty
- [ ] Hälytyssäännöt asetettu
- [ ] Hallintapaneeli luotu
- [ ] Terveystarkistukset toteutettu
- [ ] Lokien säilytyspolitiikat

### Luotettavuus ✅
- [ ] Monialueinen käyttöönotto
- [ ] Varmuuskopiointi- ja palautussuunnitelma
- [ ] Piirikatkaisijat toteutettu
- [ ] Uudelleenkokeilupolitiikat konfiguroitu
- [ ] Hallittu heikentyminen
- [ ] Terveystarkistuspäätepisteet

### Kustannusten hallinta ✅
- [ ] Budjettihälytykset konfiguroitu
- [ ] Resurssien oikea mitoitus
- [ ] Kehitys/testialennukset käytössä
- [ ] Varatut instanssit ostettu
- [ ] Kustannusten seurannan hallintapaneeli
- [ ] Säännölliset kustannuskatsaukset

### Vaatimustenmukaisuus ✅
- [ ] Tietojen sijaintivaatimukset täytetty
- [ ] Auditointilokit aktivoitu
- [ ] Vaatimustenmukaisuuskäytännöt sovellettu
- [ ] Turvallisuusperustat toteutettu
- [ ] Säännölliset turvallisuusarvioinnit
- [ ] Tapahtumien hallintasuunnitelma

## Suorituskykyvertailut

### Tyypilliset tuotantomittarit

| Mittari | Tavoite | Seuranta |
|---------|---------|----------|
| **Vasteaika** | < 2 sekuntia | Application Insights |
| **Käytettävyys** | 99,9 % | Käyttöajan seuranta |
| **Virheprosentti** | < 0,1 % | Sovelluslokit |
| **Tokenien käyttö** | < $500/kuukausi | Kustannusten hallinta |
| **Samanaikaiset käyttäjät** | 1000+ | Kuormitustestaus |
| **Palautusaika** | < 1 tunti | Katastrofipalautustestit |

### Kuormitustestaus

```bash
# Kuormitustestausskripti tekoälysovelluksille
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Yhteisön parhaat käytännöt

Microsoft Foundry Discord -yhteisön palautteen perusteella:

### Yhteisön tärkeimmät suositukset:

1. **Aloita pienestä, skaalaa vähitellen**: Aloita perus-SKU:illa ja skaalaa käyttöön perustuen
2. **Seuraa kaikkea**: Ota kattava seuranta käyttöön alusta alkaen
3. **Automatisoi turvallisuus**: Käytä infrastruktuuria koodina johdonmukaisen turvallisuuden varmistamiseksi
4. **Testaa huolellisesti**: Sisällytä AI-spesifinen testaus putkistoon
5. **Suunnittele kustannukset**: Seuraa tokenien käyttöä ja aseta budjettihälytykset ajoissa

### Yleiset sudenkuopat, joita kannattaa välttää:

- ❌ API-avainten kovakoodaus koodiin
- ❌ Seurannan laiminlyönti
- ❌ Kustannusten optimoinnin sivuuttaminen
- ❌ Vikatilanteiden testaamatta jättäminen
- ❌ Käyttöönotto ilman terveystarkistuksia

## Lisäresurssit

- **Azure Well-Architected Framework**: [AI-työkuormien ohjeistus](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry -dokumentaatio**: [Viralliset dokumentit](https://learn.microsoft.com/azure/ai-studio/)
- **Yhteisön mallipohjat**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord-yhteisö**: [#Azure-kanava](https://discord.gg/microsoft-azure)

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 8 - Tuotanto- ja yrityskäytännöt
- **⬅️ Edellinen luku**: [Luku 7: Vianetsintä](../troubleshooting/debugging.md)
- **⬅️ Myös liittyvä**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎆 Kurssi valmis**: [AZD Aloittelijoille](../../README.md)

**Muista**: Tuotantokäyttöön tarkoitetut AI-työkuormat vaativat huolellista suunnittelua, seurantaa ja jatkuvaa optimointia. Aloita näillä malleilla ja mukauta ne omiin tarpeisiisi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->