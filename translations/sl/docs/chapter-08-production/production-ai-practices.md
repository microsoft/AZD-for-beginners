# Najboljše prakse za produkcijsko obremenitev AI z AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 8 - Produkcijski & podjetniški vzorci
- **⬅️ Previous Chapter**: [Poglavje 7: Odpravljanje napak](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI delavnica](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD za začetnike](../../README.md)

## Pregled

Ta vodnik ponuja celovite najboljše prakse za uvajanje produkcijsko pripravnih AI obremenitev z uporabo Azure Developer CLI (AZD). Na podlagi povratnih informacij iz skupnosti Microsoft Foundry Discord in dejanskih implementacij pri strankah ti pristopi obravnavajo najpogostejše izzive v produkcijskih AI sistemih.

## Ključni obravnavani izzivi

Glede na rezultate naše ankete v skupnosti so to glavni izzivi, s katerimi se razvijalci srečujejo:

- **45%** se bori z več-storitvenimi AI namestitvami
- **38%** ima težave z upravljanjem poverilnic in skrivnosti  
- **35%** najde proizvodno pripravljenost in skaliranje kot zahtevno
- **32%** potrebuje boljše strategije optimizacije stroškov
- **29%** zahteva izboljšano spremljanje in odpravljanje napak

## Arhitekturni vzorci za produkcijski AI

### Pattern 1: Arhitektura mikrostoritev za AI

**Kdaj uporabiti**: Kompleksne AI aplikacije z več zmožnostmi

```mermaid
graph TD
    Frontend[Spletni vmesnik] --- Gateway[API prehod] --- LB[Uravnoteževalnik obremenitve]
    Gateway --> Chat[Storitev klepeta]
    Gateway --> Image[Storitev za slike]
    Gateway --> Text[Storitev za besedilo]
    Chat --> OpenAI[Modeli Microsoft Foundry]
    Image --> Vision[Računalniški vid]
    Text --> DocIntel[Inteligenca dokumentov]
```
**AZD implementacija**:

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

### Pattern 2: Dogodkovno vodeno obdelovanje AI

**Kdaj uporabiti**: Serijska obdelava, analiza dokumentov, asinhroni poteki dela

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

## Razmišljanje o zdravju AI agentov

Ko se tradicionalna spletna aplikacija pokvari, so simptomi znani: stran se ne naloži, API vrne napako ali namestitev ne uspe. AI-podprte aplikacije se lahko pokvarijo na vse iste načine — vendar se lahko tudi obnašajo nepravilno na bolj subtilne načine, ki ne ustvarijo očitnih sporočil o napaki.

Ta razdelek vam pomaga zgraditi mentalni model za spremljanje AI obremenitev, da boste vedeli, kje iskati, ko stvari ne delujejo, kot bi morale.

### Kako se zdravje agenta razlikuje od zdravja tradicionalne aplikacije

Tradicionalna aplikacija ali deluje ali ne. AI agent se lahko zdi, da deluje, a daje slabe rezultate. Razmislite o zdravju agenta v dveh plasteh:

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | Ali storitev teče? Ali so viri provisionani? Ali so končne točke dosegljive? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | Ali agent odgovarja natančno? So odzivi pravočasni? Ali je model pravilno poklican? | Application Insights traces, model call latency metrics, response quality logs |

Zdravje infrastrukture je znano — enako je za katero koli azd aplikacijo. Zdravje obnašanja je nova plast, ki jo uvajajo AI obremenitve.

### Kje iskati, ko AI aplikacije ne delujejo kot pričakovano

Če vaša AI aplikacija ne daje pričakovanih rezultatov, je tukaj konceptualni kontrolni seznam:

1. **Začnite z osnovami.** Ali aplikacija deluje? Ali se lahko poveže na odvisnosti? Preverite `azd monitor` in zdravje virov, tako kot bi to storili pri kateri koli aplikaciji.
2. **Preverite povezavo na model.** Ali vaša aplikacija uspešno kliče AI model? Neuspešni ali časovno potekli klici modela so najpogostejši vzrok težav z AI aplikacijami in se bodo pojavili v dnevnikih aplikacije.
3. **Poglejte, kaj je model prejel.** Odzivi AI so odvisni od vhoda (prompt in kakršnega koli pridobljenega konteksta). Če je izhod napačen, je običajno vhod napačen. Preverite, ali vaša aplikacija pošilja modelu pravilne podatke.
4. **Preglejte latenco odziva.** Klici modela AI so počasnejši od običajnih API klicev. Če aplikacija deluje počasno, preverite, ali se je čas odziva modela povečal — to lahko kaže na omejevanje, kapacitete ali zasedenost na ravni regije.
5. **Opazujte signal o stroških.** Nepričakovani skoki v porabi tokenov ali API klicih lahko nakazujejo zanko, nepravilno konfiguriran prompt ali pretirane ponovitve.

Ni vam treba takoj obvladati orodij za opazovanje. Ključna ugotovitev je, da imajo AI aplikacije dodatno plast vedenja, ki jo je treba spremljati, in vgrajeno spremljanje azd (`azd monitor`) vam daje izhodišče za preiskovanje obeh plasti.

---

## Varnostne najboljše prakse

### 1. Model varnosti z ničelnim zaupanjem

**Strategija uvedbe**:
- Brez komunikacije med storitvami brez avtentikacije
- Vsi API klici uporabljajo managed identities
- Omrežna izolacija z zasebnimi končnimi točkami
- Nadzor dostopa z najmanjšimi privilegiji

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

### 2. Varen upravljalec skrivnosti

**Vzorec integracije Key Vault**:

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

### 3. Omrežna varnost

**Konfiguracija zasebne končne točke**:

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

## Zmogljivost in skaliranje

### 1. Strategije samodejnega skaliranja

**Samodejno skaliranje Container Apps**:

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

### 2. Strategije predpomnjenja

**Redis Cache za AI odgovore**:

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

### 3. Uravnoteženje obremenitve in upravljanje prometa

**Application Gateway z WAF**:

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

## 💰 Optimizacija stroškov

### 1. Pravilna dimenzioniranje virov

**Konfiguracije specifične za okolje**:

```bash
# Razvojno okolje
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Produkcijsko okolje
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Spremljanje stroškov in proračuni

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

### 3. Optimizacija porabe tokenov

**Upravljanje stroškov OpenAI**:

```typescript
// Optimizacija porabe žetonov na ravni aplikacije
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Skrajšajte kontekst, ne uporabniškega vnosa
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Približna ocena: 1 žeton ≈ 4 znaki
    return Math.ceil(text.length / 4);
  }
}
```

## Spremljanje in opazovanje

### 1. Celovito Application Insights

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

### 2. AI-specifično spremljanje

**Prilagojene nadzorne plošče za AI metrike**:

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

### 3. Preverjanje zdravja in spremljanje razpoložljivosti

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

## Obnova po nesrečah in visoka razpoložljivost

### 1. Namestitev v več regijah

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

### 2. Varnostno kopiranje podatkov in obnova

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

## DevOps in integracija CI/CD

### 1. GitHub Actions delovni tok

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

### 2. Validacija infrastrukture

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Preveri, ali so vse zahtevane storitve zagnane
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Preveri uvajanja modelov OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Preizkusi povezljivost storitve AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Kontrolni seznam priprave za produkcijo

### Varnost ✅
- [ ] Vse storitve uporabljajo managed identities
- [ ] Skrivnosti shranjene v Key Vault
- [ ] Zasebne končne točke konfigurirane
- [ ] Implementirane skupine omrežnih pravil (Network Security Groups)
- [ ] RBAC z najmanjšimi privilegiji
- [ ] WAF omogočen na javnih končnih točkah

### Zmogljivost ✅
- [ ] Samodejno skaliranje konfigurirano
- [ ] Predpomnjenje implementirano
- [ ] Nastavljeno uravnoteženje obremenitve
- [ ] CDN za statično vsebino
- [ ] Upravljanje povezav do podatkovne baze
- [ ] Optimizacija porabe tokenov

### Spremljanje ✅
- [ ] Application Insights konfiguriran
- [ ] Prilagojene metrike definirane
- [ ] Pravila za opozarjanje nastavljena
- [ ] Ustvarjena nadzorna plošča
- [ ] Implementirane preveritve zdravja
- [ ] Politike zadrževanja dnevnikov

### Zanesljivost ✅
- [ ] Namestitev v več regijah
- [ ] Načrt za varnostno kopiranje in obnovo
- [ ] Implementirani preklopni mehanizmi (circuit breakers)
- [ ] Konfigurirane politike ponovnih poizkusov
- [ ] Graceful degradation (prijazno degradiranje)
- [ ] Končne točke za preverjanje zdravja

### Upravljanje stroškov ✅
- [ ] Opozorila proračuna konfigurirana
- [ ] Pravilno dimenzioniranje virov
- [ ] Uporabljeni popusti za razvoj/test
- [ ] Nakup rezerviranih instanc
- [ ] Nadzorna plošča za stroške
- [ ] Redni pregledi stroškov

### Skladnost ✅
- [ ] Izpolnjene zahteve glede lokacije podatkov
- [ ] Omogočeno revizijsko beleženje
- [ ] Uveljavljene skladnostne politike
- [ ] Izvedene varnostne osnove
- [ ] Redne varnostne ocene
- [ ] Načrt odziva na incidente

## Benchmarki zmogljivosti

### Tipične produkcijske meritve

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### Preskus obremenitve

```bash
# Skripta za obremenitveno testiranje AI aplikacij
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Prakse skupnosti

Na podlagi povratnih informacij skupnosti Microsoft Foundry Discord:

### Najboljša priporočila skupnosti:

1. **Začnite majhno, skalirajte postopoma**: Začnite z osnovnimi SKU-ji in povečujte glede na dejansko uporabo
2. **Spremljajte vse**: Postavite celovito spremljanje od prvega dne
3. **Avtomatizirajte varnost**: Uporabite infrastrukturo kot kodo za dosledno varnost
4. **Temeljito testirajte**: Vključite AI-specifično testiranje v vaš cevovod
5. **Načrtujte stroške**: Spremljajte porabo tokenov in čim prej nastavite opozorila proračuna

### Pogoste pasti, ki se jim izognite:

- ❌ Shranjevanje API ključev v kodi
- ❌ Nepravilna nastavitev spremljanja
- ❌ Ignoriranje optimizacije stroškov
- ❌ Ne testiranje scenarijev napak
- ❌ Namestitev brez preverjanj zdravja

## Ukazi AZD AI CLI in razširitve

AZD vključuje rastoč nabor AI-specifičnih ukazov in razširitev, ki poenostavijo produkcijske AI delovne tokove. Ta orodja zmanjšujejo vrzel med lokalnim razvojem in produkcijsko namestitvijo AI obremenitev.

### Razširitve AZD za AI

AZD uporablja sistem razširitev za dodajanje AI-specifičnih zmožnosti. Namestite in upravljajte razširitve z:

```bash
# Prikaži vse razpoložljive razširitve (vključno z AI)
azd extension list

# Namesti razširitev Foundry agents
azd extension install azure.ai.agents

# Namesti razširitev za fino prilagajanje
azd extension install azure.ai.finetune

# Namesti razširitev za prilagojene modele
azd extension install azure.ai.models

# Nadgradi vse nameščene razširitve
azd extension upgrade --all
```

**Na voljo AI razširitve:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Upravljanje Foundry Agent Service | Predogled |
| `azure.ai.finetune` | Fino uravnavanje modelov Foundry | Predogled |
| `azure.ai.models` | Prilagojeni modeli Foundry | Predogled |
| `azure.coding-agent` | Konfiguracija coding agenta | Na voljo |

### Inicializacija projektov agentov z `azd ai agent init`

Ukaz `azd ai agent init` pripravi ogrodje produkcijsko pripravljenega AI agent projekta, integriranega z Microsoft Foundry Agent Service:

```bash
# Inicializirajte nov projekt agenta iz agentnega manifesta
azd ai agent init -m <manifest-path-or-uri>

# Inicializirajte in ciljno nastavite določen projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Initialize with a custom source directory
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Nastavite Container Apps kot gostitelja
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Ključni preklopi:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Pot ali URI do manifesta agenta, ki ga želite dodati v projekt |
| `-p, --project-id` | Obstoječi Microsoft Foundry Project ID za vaše azd okolje |
| `-s, --src` | Direktorij za prenos definicije agenta (privzeto `src/<agent-id>`) |
| `--host` | Prekini privzet gostitelj (npr. `containerapp`) |
| `-e, --environment` | Azd okolje, ki ga želite uporabiti |

**Produkcijski nasvet**: Uporabite `--project-id` za neposredno povezavo z obstoječim Foundry projektom, da bo vaša koda agenta in oblačni viri povezana od začetka.

### Model Context Protocol (MCP) z `azd mcp`

AZD vključuje vgrajeno podporo za MCP strežnik (Alpha), kar omogoča AI agentom in orodjem interakcijo z vašimi Azure viri prek standardiziranega protokola:

```bash
# Zaženi MCP strežnik za vaš projekt
azd mcp start

# Upravljajte soglasja orodij za operacije MCP
azd mcp consent
```

MCP strežnik izpostavi kontekst vašega azd projekta — okolja, storitve in Azure vire — AI-podprtim orodjem za razvoj. To omogoča:

- **AI-asistirana namestitev**: Dovolite coding agentom, da poizvedujejo stanje vašega projekta in sprožijo namestitve
- **Odkritje virov**: AI orodja lahko odkrijejo, katere Azure vire vaš projekt uporablja
- **Upravljanje okolij**: Agenti lahko preklapljajo med dev/staging/production okolji

### Generiranje infrastrukture z `azd infra generate`

Za produkcijske AI obremenitve lahko generirate in prilagodite Infrastructure as Code namesto zanašanja na samodejno provisioniranje:

```bash
# Ustvari Bicep/Terraform datoteke iz definicije vašega projekta
azd infra generate
```

To zapiše IaC na disk, da lahko:
- Pregledate in revidirate infrastrukturo pred namestitvijo
- Dodate prilagojene varnostne politike (omrežna pravila, zasebne končne točke)
- Integrirate z obstoječimi postopki pregleda IaC
- Vpeljete spremembe infrastrukture v sistem nadzora različic ločeno od kode aplikacije

### Produkcijski življenjski klici (Hooks)

AZD hooks vam omogočajo vstavljanje lastne logike v vsako fazo življenjskega cikla namestitve — ključnega pomena za produkcijske AI delovne tokove:

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
# Ročno zaženi določen hook med razvojem
azd hooks run predeploy
```

**Priporočeni produkcijski hooks za AI obremenitve:**

| Hook | Use Case |
|------|----------|
| `preprovision` | Preverite kvote naročnine za kapaciteto modela |
| `postprovision` | Konfigurirajte zasebne končne točke, razmestite uteži modela |
| `predeploy` | Zaženite AI varnostne teste, preverite predloge promptov |
| `postdeploy` | Izvedite osnovne teste agentov, preverite povezljivost modela |

### Konfiguracija CI/CD cevovoda

Uporabite `azd pipeline config` za povezavo vašega projekta z GitHub Actions ali Azure Pipelines z varno Azure avtentikacijo:

```bash
# Konfigurirajte CI/CD cevovod (interaktivno)
azd pipeline config

# Konfigurirajte za določenega ponudnika
azd pipeline config --provider github
```

Ta ukaz:
- Ustvari service principal z najmanjšimi potrebnimi dovoljenji
- Konfigurira federirane poverilnice (brez shranjenih skrivnosti)
- Ustvari ali posodobi definicijsko datoteko vašega cevovoda
- Nastavi zahtevane okoljske spremenljivke v vašem CI/CD sistemu

**Produkcijski delovni tok z pipeline config:**

```bash
# 1. Nastavite produkcijsko okolje
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Konfigurirajte cevovod
azd pipeline config --provider github

# 3. Cevovod zažene azd deploy ob vsakem pushu v vejo main
```

### Dodajanje komponent z `azd add`

Postopoma dodajajte Azure storitve v obstoječ projekt:

```bash
# Dodajte novo komponento storitve interaktivno
azd add
```

To je posebej uporabno za širitev produkcijskih AI aplikacij — na primer dodajanje storitve vektornega iskanja, novega agentnega končnega vtičnika ali spremljevalne komponente za obstoječo namestitev.

## Dodatni viri
- **Azure Well-Architected Framework**: [Smernice za AI delovne obremenitve](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 odprtih agentnih veščin za Azure AI, Foundry, uvajanje, optimizacijo stroškov in diagnostiko. Namestite v svoj urejevalnik:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 8 - Vzorci za produkcijo in podjetja
- **⬅️ Prejšnje poglavje**: [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Tudi povezano**: [AI delavnica](ai-workshop-lab.md)
- **� Tečaj dokončan**: [AZD For Beginners](../../README.md)

**Ne pozabite**: Produkcijske AI delovne obremenitve zahtevajo skrbno načrtovanje, spremljanje in stalno optimizacijo. Začnite s temi vzorci in jih prilagodite vašim posebnim zahtevam.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Opozorilo**:
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Za kakršnekoli nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda, ne odgovarjamo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->