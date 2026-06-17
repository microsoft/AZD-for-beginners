# Production AI Munkaterhelés Legjobb Gyakorlatai AZD-vel

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 8. fejezet - Termelési és vállalati mintázatok
- **⬅️ Előző fejezet**: [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Kapcsolódó**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Kurzus befejezése**: [AZD Kezdőknek](../../README.md)

## Áttekintés

Ez az útmutató átfogó legjobb gyakorlatokat nyújt termelésre kész AI munkaterhelések üzembe helyezéséhez az Azure Developer CLI (AZD) segítségével. A Microsoft Foundry Discord közösség visszajelzéseire és valós ügyfél-telepítésekre alapozva ezek a gyakorlatok a termelési AI rendszerek leggyakoribb kihívásait célozzák meg.

## Kezelt Főbb Kihívások

Közösségi felmérésünk eredményei alapján ezek a legfőbb kihívások, amelyekkel a fejlesztők szembesülnek:

- **45%** nehézséget okoz a több szolgáltatásból álló AI telepítés
- **38%** hitelesítési és titokkezelési problémák
- **35%** nehézségek a termelésre való felkészülés és skálázás terén
- **32%** jobb költségoptimalizálási stratégiák szükségesek
- **29%** fejlettebb monitorozásra és hibakeresésre van szükség

## Termelési AI Architektúra Mintázatok

### Mintázat 1: Mikroszolgáltatás alapú AI architektúra

**Mikor használjuk**: Komplex AI alkalmazások több funkcióval

```mermaid
graph TD
    Frontend[Web Frontend] --- Gateway[API Kapu] --- LB[Terheléselosztó]
    Gateway --> Chat[Chat Szolgáltatás]
    Gateway --> Image[Kép Szolgáltatás]
    Gateway --> Text[Szöveg Szolgáltatás]
    Chat --> OpenAI[Microsoft Foundry Modellek]
    Image --> Vision[Számítógépes Látás]
    Text --> DocIntel[Dokumentum Intelligencia]
```

**AZD megvalósítás**:

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

### Mintázat 2: Eseményvezérelt AI feldolgozás

**Mikor használjuk**: Csomagolt feldolgozás, dokumentumelemzés, aszinkron munkafolyamatok

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

## Az AI Ügynök Egészségének Gondolata

Amikor egy hagyományos webalkalmazás hibásan működik, a tünetek ismerősek: egy oldal nem tölt be, egy API hibát ad vissza, vagy egy telepítés sikertelen. Az AI-alapú alkalmazások ugyanilyen módon hibásak lehetnek — de finomabb, kevésbé nyilvánvaló módon is hibázhatnak, amelyek nem produkálnak egyértelmű hibaüzeneteket.

Ez a rész segít kialakítani egy mentális modellt az AI munkaterhelések monitorozásához, hogy tudd, hol keress, ha valami nem tűnik rendben lévőnek.

### Hogyan tér el az Ügynök Egészsége a Hagyományos Alkalmazás Egészségétől

Egy hagyományos alkalmazás vagy működik, vagy nem. Egy AI ügynök úgy tűnhet, hogy működik, de rossz eredményeket adhat. Gondoljuk az ügynök egészségét két rétegben:

| Réteg | Mit figyeljünk | Hol nézzünk |
|-------|----------------|--------------|
| **Infrastruktúra egészsége** | Futtatott-e a szolgáltatás? Biztosítottak-e az erőforrások? Elérhetőek-e a végpontok? | `azd monitor`, Azure Portal erőforrás egészség, konténer/alkalmazás naplók |
| **Viselkedés egészsége** | Pontosan reagál az ügynök? Időben vannak a válaszok? Helyesen hívják a modellt? | Application Insights nyomok, modell hívási késleltetési metrikák, válasz minőségi naplók |

Az infrastruktúra egészsége ismerős – ez ugyanaz, mint bármely azd alkalmazásnál. A viselkedés egészsége az a réteg, amit az AI munkaterhelések hoznak be újként.

### Hol Nézzünk, Ha Az AI Alkalmazások Nem Úgy Viselkednek, Ahogy Várnánk

Ha az AI alkalmazásod nem produkálja a várt eredményeket, itt egy konceptuális ellenőrző lista:

1. **Kezdj a legalapvetőbb dolgokkal.** Futtat-e az alkalmazás? Eléri-e a függőségeit? Ellenőrizd az `azd monitor` és az erőforrás egészséget, ahogy bármely alkalmazásnál tennéd.
2. **Ellenőrizd a modellkapcsolatot.** Sikeresen hívja az alkalmazás az AI modellt? Sikertelen vagy időtúllépéses modellhívások az AI alkalmazások leggyakoribb problémái, ezek megjelennek az alkalmazás naplóiban.
3. **Nézd meg, mit kapott a modell.** Az AI válaszai az inputtól függenek (a prompttól és az előhívott kontextustól). Ha az output hibás, általában az input a rossz. Ellenőrizd, hogy az alkalmazás a megfelelő adatokat küldi-e a modellnek.
4. **Tekintsd át a válasz késleltetését.** Az AI modellhívások lassabbak, mint a tipikus API hívások. Ha az alkalmazás lassúnak tűnik, nézd meg, nőtt-e a modell válaszideje – ez jelezhet korlátozásokat, kapacitás problémákat vagy régiós forgalmi torlódásokat.
5. **Figyelj a költségjelzésekre.** Váratlan tokenhasználati vagy API-hívás csúcsok jelezhetnek hurkot, helytelen prompt beállítást vagy túlzott újrapróbálkozást.

Nem kell azonnal mesteri szinten értened az observability eszközöket. A fő tanulság, hogy az AI alkalmazásoknak van egy extra viselkedési rétegük, amit monitorozni kell, és az azd beépített monitorozása (`azd monitor`) kiindulópontot ad a két réteg vizsgálatához.

---

## Biztonsági Legjobb Gyakorlatok

### 1. Zero-Trust Biztonsági Modell

**Megvalósítási stratégia**:
- Nincs szolgáltatás-szolgáltatás közti kommunikáció hitelesítés nélkül
- Minden API hívás kezelőazonosságokat használ
- Hálózati izoláció privát végpontokkal
- Minimális jogosultság elve szerinti hozzáférésvezérlés

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

### 2. Biztonságos Titokkezelés

**Key Vault integrációs mintázat**:

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

### 3. Hálózatbiztonság

**Privát végpont konfiguráció**:

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

## Teljesítmény és Skálázás

### 1. Automatikus skálázási stratégiák

**Konténeralkalmazások automatikus skálázása**:

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

### 2. Gyorsítótárazási stratégiák

**Redis cache AI válaszokhoz**:

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

### 3. Terheléselosztás és Forgalomkezelés

**Alkalmazás átjáró WAF-fel**:

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

## 💰 Költségoptimalizálás

### 1. Erőforrás megfelelő méretezése

**Környezet-specifikus konfigurációk**:

```bash
# Fejlesztési környezet
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Éles környezet
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Költségfigyelés és költségvetés

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

### 3. Tokenhasználat optimalizálása

**OpenAI költségmenedzsment**:

```typescript
// Alkalmazásszintű token optimalizálás
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Kontexteket vágjuk le, nem a felhasználói bevitel
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Durva becslés: 1 token ≈ 4 karakter
    return Math.ceil(text.length / 4);
  }
}
```

## Monitorozás és Megfigyelhetőség

### 1. Átfogó Application Insights

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

### 2. AI-specifikus monitorozás

**Egyedi irányítópultok AI metrikákhoz**:

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

### 3. Egészségügyi ellenőrzések és rendelkezésre állás monitorozása

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

## Katasztrófa-helyreállítás és Magas rendelkezésre állás

### 1. Több régiós telepítés

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

### 2. Adatmentés és helyreállítás

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

## DevOps és CI/CD Integráció

### 1. GitHub Actions munkafolyamat

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
        uses: Azure/setup-azd@v2
        
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
        uses: Azure/setup-azd@v2
        
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

### 2. Infrastruktúra validálás

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Ellenőrizze, hogy minden szükséges szolgáltatás fut-e
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Érvényesítse az OpenAI modell telepítéseit
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Tesztelje az AI szolgáltatás kapcsolatát
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Termelésre Felkészültségi Ellenőrzőlista

### Biztonság ✅
- [ ] Minden szolgáltatás kezelőazonosságot használ
- [ ] Titkok Key Vault-ban tárolva
- [ ] Privát végpontok konfigurálva
- [ ] Hálózati biztonsági csoportok implementálva
- [ ] Minimális jogosultságú RBAC
- [ ] WAF engedélyezve nyilvános végpontokon

### Teljesítmény ✅
- [ ] Automatikus skálázás konfigurálva
- [ ] Gyorsítótárazás megvalósítva
- [ ] Terheléselosztás beállítva
- [ ] CDN statikus tartalomhoz
- [ ] Adatbázis kapcsolat-pooling
- [ ] Tokenhasználat optimalizálása

### Monitorozás ✅
- [ ] Application Insights konfigurálva
- [ ] Egyedi metrikák definiálva
- [ ] Riasztási szabályok beállítva
- [ ] Irányítópult létrehozva
- [ ] Egészségügyi ellenőrzések implementálva
- [ ] Naplómegőrzési szabályozás

### Megbízhatóság ✅
- [ ] Több régióba való telepítés
- [ ] Mentési és helyreállítási terv
- [ ] Áramkör szakítók alkalmazása
- [ ] Újrapróbálkozási szabályok konfigurálva
- [ ] Kegyes degradáció
- [ ] Egészségügyi ellenőrző végpontok

### Költségmenedzsment ✅
- [ ] Költségvetési riasztások beállítva
- [ ] Erőforrás méretezés optimalizálva
- [ ] Fejlesztői/tesztelési kedvezmények alkalmazva
- [ ] Lefoglalt példányok megvásárolva
- [ ] Költségmonitorozó irányítópult
- [ ] Rendszeres költség-áttekintések

### Megfelelőség ✅
- [ ] Adathely szerinti követelmények teljesítve
- [ ] Audit naplózás engedélyezve
- [ ] Megfelelőségi irányelvek alkalmazva
- [ ] Biztonsági alapvonalak implementálva
- [ ] Rendszeres biztonsági értékelések
- [ ] Incidens válasz terv

## Teljesítmény Mérőszámok

### Tipikus termelési metrikák

| Mérőszám | Cél | Monitorozás |
|----------|-----|-------------|
| **Válaszidő** | < 2 másodperc | Application Insights |
| **Elérhetőség** | 99,9% | Rendelkezésre állás monitorozás |
| **Hibaarány** | < 0,1% | Alkalmazás naplók |
| **Tokenhasználat** | < 500 $/hó | Költségmenedzsment |
| **Egyidejű felhasználók** | 1000+ | Terheléses tesztelés |
| **Helyreállítási idő** | < 1 óra | Katasztrófa helyreállítási tesztek |

### Terheléses tesztelés

```bash
# Terheléses tesztelési szkript AI alkalmazásokhoz
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Közösségi Legjobb Gyakorlatok

A Microsoft Foundry Discord közösségi visszajelzései alapján:

### A közösség fő ajánlásai:

1. **Kezdj kis léptékben, skálázz fokozatosan**: Alapkezdeti SKU-kal indulj, majd a tényleges használat alapján skálázz fel
2. **Figyelj mindent**: Átfogó monitorozást állíts be az első naptól
3. **Automatizáld a biztonságot**: Infrastruktúra-kódként használj automatizálást a konzisztens biztonsághoz
4. **Tesztelj alaposan**: AI-specifikus teszteket is iktass be a folyamatba
5. **Tervezd meg a költségeket**: Korán figyeld a tokenhasználatot és állíts be költségvetési riasztásokat

### Elkerülendő gyakori hibák:

- ❌ API kulcsok hardkódolása a kódban
- ❌ Megfelelő monitorozás hiánya
- ❌ Költségoptimalizálás figyelmen kívül hagyása
- ❌ Hibaforgatókönyvek tesztelésének mellőzése
- ❌ Egészségügyi ellenőrzések nélküli telepítés

## AZD AI CLI Parancsok és Kiterjesztések

Az AZD egy növekvő számú AI-specifikus parancsot és kiterjesztést tartalmaz, amelyek egyszerűsítik a termelési AI munkafolyamatokat. Ezek az eszközök hidat képeznek a helyi fejlesztés és a termelési telepítés között AI munkaterhelések esetén.

### AZD AI Kiterjesztések

Az AZD kiterjesztésrendszert használ az AI-specifikus képességek hozzáadására. Telepítsd és kezeld a kiterjesztéseket:

```bash
# Listázza az összes elérhető bővítményt (beleértve az AI-t)
azd extension list

# Ellenőrizze a telepített bővítmény részleteit
azd extension show azure.ai.agents

# Telepítse a Foundry ügynökök bővítményt
azd extension install azure.ai.agents

# Telepítse a finomhangoló bővítményt
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek bővítményt
azd extension install azure.ai.models

# Frissítse az összes telepített bővítményt
azd extension upgrade --all
```

**Elérhető AI kiterjesztések:**

| Kiterjesztés | Cél | Állapot |
|--------------|-----|---------|
| `azure.ai.agents` | Foundry Agent szolgáltatás kezelése | Előnézet |
| `azure.ai.skills` | Újrahasználható ügynök készségek | Előnézet |
| `azure.ai.connections` | Foundry kapcsolatok (adatforrások, eszközök) | Előnézet |
| `azure.ai.finetune` | Foundry modell finomhangolás | Előnézet |
| `azure.ai.models` | Foundry egyedi modellek | Előnézet |
| `azure.coding-agent` | Kódoló ügynök konfiguráció | Elérhető |

> Az `azure.ai.agents` kiterjesztés gyorsan fejlődik. Ez a tanfolyam a `0.1.40-preview` verzióhoz igazodik. Futtasd az `azd extension upgrade --all` parancsot a legújabb parancssor készlethez, majd az `azd extension show azure.ai.agents` parancsot az telepített verzió megerősítéséhez.

**Mik az újabb `skills` és `connections` kiterjesztések?**

Két előnézeti kiterjesztés jelent meg az ügynök eszközhöz kapcsolódóan, amelyek megértése kezdőként is hasznos:

- **`azure.ai.skills`** — Egy **készség** egy újrahasználható képesség (egy csomagolt eszköz vagy viselkedés), amelyet egy vagy több ügynökhöz csatolhatsz anélkül, hogy minden alkalommal újra implementálnád. Gondolj rá úgy, mint egy közös építőkockára: határozz meg egyszer egy „dokumentumok keresése” vagy „rendelés lekérdezése” készséget, és használd újra az ügynökök között. Ez egységessé teszi a több ügynökös rendszereket (5. fejezet) és elkerüli a másolgatást.
- **`azure.ai.connections`** — Egy **kapcsolat** egy kezelt hivatkozás a Foundry projekted és egy külső erőforrás között, amelyre az ügynökeidnek szüksége van — egy adatforrás (például Azure AI Search), egy eszköz végpont vagy más szolgáltatás. A kapcsolatok központosítják, *hol* és *hogyan* férnek hozzá az ügynökök az adatokhoz, így a hitelesítő adatok és végpontok egy szabályozott helyen vannak ahelyett, hogy szétszórva lennének a kódban.

Első ügynökeid telepítéséhez nincs szükséged rájuk — maradj az `azure.ai.agents` mellett tanulás közben. Nyúlj a `skills` felé, ha ugyanazt az eszközt többször másolod egyik ügynökről a másikra, és a `connections` felé, ha több ügynök közösen használ ugyanazt az adatforrást.

### Ügynök projektek inicializálása `azd ai agent init` használatával

Az `azd ai agent init` parancs előkészít egy termelésre kész AI ügynök projektet, amely integrálódik a Microsoft Foundry Agent Szolgáltatással:

```bash
# Új ügynök projekt inicializálása egy ügynök manifesztből
azd ai agent init -m <manifest-path-or-uri>

# Egy adott Foundry projekt inicializálása és célozása
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Egyéni forráskönyvtárral inicializálás
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Container Apps mint gazdagép kiválasztása
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Főbb kapcsolók:**

| Kapcsoló | Leírás |
|----------|---------|
| `-m, --manifest` | Elérési út vagy URI egy ügynök manifesthez, amelyet a projekthez adunk |
| `-p, --project-id` | Létező Microsoft Foundry projektazonosító az azd környezetedhez |
| `-s, --src` | Könyvtár, ahová letöltődik az ügynök definíciója (alapértelmezett: `src/<agent-id>`) |
| `--host` | Alapértelmezett hoszt felülbírálása (pl. `containerapp`) |
| `-e, --environment` | Az azd környezet, amit használni kívánsz |

**Termelési tipp**: Használd a `--project-id` opciót, hogy közvetlenül kapcsolódj egy meglévő Foundry projekthez, így az ügynök kódod és a felhő erőforrásaid elejétől összekapcsoltak lesznek.

### Az ügynök életciklusának kezelése

Az `azure.ai.agents` kiterjesztés teljes életciklusra kínál parancsokat a hosztolt ügynökhöz — teszteléshez, értékeléshez, optimalizáláshoz és selejtezéshez:

```bash
# Hívjon meg egy telepített ügynököt és tekintse meg a szerver válaszidőit
# (teljes késleltetés és az első bájtig eltelt idő)
azd ai agent invoke

# Mutassa meg az élő végpont konfigurációját a módosítás előtt
azd ai agent endpoint show

# Generáljon értékelő adatállományt az ügynök számára
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# Optimalizálja az ügynök utasításait az értékelési adatai alapján
# (ez igényli egy optimalizációs_modellt az ügynök projektben)
azd ai agent optimize

# Töltse le egy kódalapú hosztolt ügynök telepített forrását
# (SHA-256 ellenőrzéssel)
azd ai agent code download

# Töröljön egy hosztolt ügynököt és az összes verzióját
# (--force megszakítja az aktív munkameneteket)
azd ai agent delete --force
```

**Életciklus egy pillantásra:**

| Fázis | Parancs | Termelési használat |
|-------|---------|---------------------|
| Teszt | `azd ai agent invoke` | Válaszok validálása és késleltetés mérése a kiadás előtt |
| Ellenőrzés | `azd ai agent endpoint show` | Végpont hitelesítés/konfiguráció áttekintése; törés korai észlelése |
| Méret | `azd ai agent eval generate` | Ismételhető értékelési halmaz építése valós nyomokból |
| Fejlesztés | `azd ai agent optimize` | Utasítások finomhangolása a mért minőség alapján |
| Helyreállítás | `azd ai agent code download` | A pontos telepített forrás lekérése auditáláshoz/visszagörgetéshez |
| Selejtezés | `azd ai agent delete --force` | Egy ügynök és verzióinak tiszta leszedése |

> Ezek előnézeti parancsok, változhatnak a kiterjesztés kiadásaival. Futtasd az `azd ai agent --help` parancsot, hogy lásd a telepített verziódban elérhető pontos alkparancsokat.

### Modell Kontextus Protokoll (MCP) az `azd mcp`-vel
AZD beépített MCP szervertámogatást tartalmaz (Alfa), amely lehetővé teszi az AI ügynökök és eszközök számára, hogy szabványosított protokollon keresztül kapcsolódjanak Azure erőforrásaidhoz:

```bash
# Indítsa el az MCP szervert a projektjéhez
azd mcp start

# Tekintse át a jelenlegi Copilot hozzájárulási szabályokat az eszköz futtatásához
azd copilot consent list
```

Az MCP szerver elérhetővé teszi az azd projektkörnyezeted – környezetek, szolgáltatások és Azure erőforrások – AI által vezérelt fejlesztői eszközök számára. Ez lehetővé teszi:

- **AI által támogatott telepítés**: Engedd, hogy a kódoló ügynökök lekérdezzék a projekt állapotát és indítsanak telepítéseket
- **Erőforrás-felderítés**: AI eszközök felfedezhetik, milyen Azure erőforrásokat használ a projekted
- **Környezetkezelés**: Ügynökök válthatnak fejlesztői/teszt/éles környezetek között

### Infrastruktúra generálása az `azd infra generate` segítségével

Éles AI munkaterhelésekhez generálhatod és testre szabhatod az Infrastructure as Code-ot ahelyett, hogy automatikus előállításra hagyatkoznál:

```bash
# Bicep/Terraform fájlok generálása a projekt definícióból
azd infra generate
```

Ez lemezre írja az IaC-t, így teheted meg a következőket:
- Áttekintened és auditálnod az infrastruktúrát a telepítés előtt
- Egyedi biztonsági szabályokat hozzáadnod (hálózati szabályok, privát végpontok)
- Integrálni meglévő IaC átvizsgálási folyamatokkal
- Verziókövetéssel külön kezelni az infrastruktúra változásait az alkalmazáskódtól

### Éles élettartam horgok

AZD horgok lehetővé teszik, hogy minden telepítési életciklus szakaszban egyedi logikát injektálj – kritikus az éles AI munkafolyamatok számára:

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
# Futtass egy adott hookot kézzel fejlesztés közben
azd hooks run predeploy
```

**Ajánlott éles horgok AI munkaterhelésekhez:**

| Horog | Használati eset |
|------|----------|
| `preprovision` | Előfizetés kvóták ellenőrzése AI modellkapacitásra |
| `postprovision` | Privát végpontok konfigurálása, modell súlyok telepítése |
| `predeploy` | AI biztonsági tesztek futtatása, prompt sablonok ellenőrzése |
| `postdeploy` | Ügynök válaszok gyorstesztelése, modellkapcsolat ellenőrzése |

### CI/CD pipeline konfiguráció

Használd az `azd pipeline config` parancsot, hogy a projektedet GitHub Actions-hoz vagy Azure Pipelines-hoz csatlakoztasd biztonságos Azure hitelesítéssel:

```bash
# CI/CD folyamat konfigurálása (interaktív)
azd pipeline config

# Konfigurálás egy adott szolgáltatóval
azd pipeline config --provider github
```

Ez a parancs:
- Létrehoz egy minimális jogosultságokkal rendelkező szolgáltatásfiókot
- Konfigurálja a federált hitelesítést (nem tárol titkokat)
- Generálja vagy frissíti a pipeline definíciós fájlt
- Beállítja a szükséges környezeti változókat a CI/CD rendszeredben

#### Lépésről lépésre: az első GitHub Actions pipeline

Az alábbiakban részletesen bemutatjuk, hogyan megy az automatikus telepítés egy működő azd projektből minden push esetén.

**1. Ellenőrizd, hogy a projekted GitHubon legyen**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. Futtasd a pipeline config-ot**

```bash
azd pipeline config --provider github
```

Az azd interaktívan:
- Megkérdezi, mely Azure előfizetést és környezetet célozd meg
- Létrehoz egy Entra **app regisztrációt + szolgáltatásfiókot** a pipeline számára
- Beállítja a **federált hitelesítést (OIDC)** – így a GitHub rövid élettartamú tokennel hitelesít az Azure felé, és **nem tárolódnak titkok**
- Feltolja a szükséges **változókat** a GitHub repódba (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. Ismerd meg a generált workflow-t**

azd hozzáadja a `.github/workflows/azure-dev.yml` fájlt. A legfontosabb részek így néznek ki:

```yaml
# .github/workflows/azure-dev.yml
on:
  push:
    branches: [ main ]
  workflow_dispatch:        # lets you run it manually too

permissions:
  id-token: write           # required for OIDC federated login
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      AZURE_CLIENT_ID: ${{ vars.AZURE_CLIENT_ID }}
      AZURE_TENANT_ID: ${{ vars.AZURE_TENANT_ID }}
      AZURE_SUBSCRIPTION_ID: ${{ vars.AZURE_SUBSCRIPTION_ID }}
      AZURE_ENV_NAME: ${{ vars.AZURE_ENV_NAME }}
      AZURE_LOCATION: ${{ vars.AZURE_LOCATION }}
    steps:
      - uses: actions/checkout@v4
      - name: Install azd
        uses: Azure/setup-azd@v2
      - name: Log in with OIDC
        run: azd auth login --client-id "$AZURE_CLIENT_ID" --federated-credential-provider "github" --tenant-id "$AZURE_TENANT_ID"
      - name: Provision infrastructure
        run: azd provision --no-prompt
      - name: Deploy application
        run: azd deploy --no-prompt
```

**4. Ellenőrizd, hogy működik-e**

```bash
# Nyomj egy változtatást a pipeline elindításához
git commit -am "Trigger pipeline" --allow-empty
git push
```

Nyisd meg a GitHub repóban az **Actions** fület, és figyeld, hogy a workflow automatikusan lefuttatja az `azd provision` és `azd deploy` parancsokat.

> **Miért fontos a federált hitelesítés:** a régebbi pipeline-ok kliens titkot tároltak GitHub-on. Az OIDC federált hitelesítés teljesen eltávolítja ezt a titkot – a GitHub futásidőben kér egy rövid élettartamú tokent, ami biztonságosabb és nem kell forgatni vagy szivárogtatni. Ez az alapértelmezett beállítás az `azd pipeline config` parancsnál.

> **Titkok vs. változók:** nem érzékeny azonosítók (`AZURE_CLIENT_ID`, stb.) kerüljenek a repo **változóiba**. Ha az alkalmazásnak tényleg szüksége van titokra build időben, akkor add hozzá GitHub **titokként**, és hivatkozz rá `${{ secrets.NAME }}` szintaxissal – de inkább Key Vault + managed identity használata futási időben (lásd [3. fejezet](../chapter-03-configuration/authsecurity.md)).

**Éles munkafolyamat pipeline configbal:**

```bash
# 1. Állítsa be a termelési környezetet
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Konfigurálja a futószalagot
azd pipeline config --provider github

# 3. A futószalag minden main ágba történő push esetén lefuttatja az azd deploy-t
```

#### Lépésről lépésre: Azure DevOps Pipelines

GitHub Actions helyett inkább Azure DevOps-t használsz? azd natívan támogatja az `azdo` szolgáltatót. A folyamat szinte ugyanaz – azd generálja a pipeline fájlt, létrehoz egy szolgáltatáskapcsolatot és összehangolja a hitelesítést.

**1. Győződj meg róla, hogy van Azure DevOps projekted**

Szükséged van egy szervezetre és projektre a `https://dev.azure.com/<your-org>` címen. Generálj egy Személyes Hozzáférési Tokent (PAT) **Build (Olvasás és végrehajtás)**, **Code (Olvasás és írás)**, illetve **Service Connections (Olvasás, lekérdezés és kezelés)** jogosultságokkal – az azd promtolja majd.

**2. Konfiguráld a pipeline-t**

```bash
azd pipeline config --provider azdo
```

azd a következőket teszi:
- Megkérdezi Azure DevOps szervezet és projekt nevét
- Létrehozza (vagy újrahasználja) az Azure szolgáltatáshoz való **szolgáltatáskapcsolatot** egy szolgáltatásfiókkal
- Konfigurálja az **workload identity federation-t (OIDC)**, így nincs kliens titok tárolva
- Feltölti a `azure-dev.yml` pipeline definíciós fájlt a repóba

**3. Nézd át a generált `azure-dev.yml` fájlt**

azd egy olyan pipeline-t ír, amely minden `main` branch-re történt push után előállítja és telepíti a szolgáltatást:

```yaml
# azure-dev.yml
trigger:
  - main

pool:
  vmImage: ubuntu-latest

steps:
  - task: setup-azd@1
    displayName: Install azd

  - script: azd provision --no-prompt
    displayName: Provision Infrastructure
    env:
      AZURE_SUBSCRIPTION_ID: $(AZURE_SUBSCRIPTION_ID)
      AZURE_ENV_NAME: $(AZURE_ENV_NAME)
      AZURE_LOCATION: $(AZURE_LOCATION)

  - script: azd deploy --no-prompt
    displayName: Deploy Application
    env:
      AZURE_SUBSCRIPTION_ID: $(AZURE_SUBSCRIPTION_ID)
      AZURE_ENV_NAME: $(AZURE_ENV_NAME)
      AZURE_LOCATION: $(AZURE_LOCATION)
```

**4. Honnan származnak a változók**

azd az környezeti értékeket (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) egy **változó csoportként** tárolja az Azure DevOpsban, hogy a pipeline olvasni tudja azokat. Megtekintheted és módosíthatod őket a **Pipelines → Library** menü alatt.

> **Ugyanaz az OIDC előny, mint GitHub esetében:** az `azdo` szolgáltató alapértelmezésben beállítja a workload identity federation-t, így a szolgáltatáskapcsolatban nem tárolódik kliens titok – Azure DevOps futásidőben cserél rövid élettartamú tokent. Csak akkor add meg a `--auth-type client-credentials` opciót, ha a szervezeted még nem használhat OIDC-t.

**5. Futtasd**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Nyisd meg az Azure DevOps **Pipelines** szekciót, és figyeld, hogy lefut az `azd provision` és az `azd deploy`.

### Komponensek hozzáadása az `azd add` használatával

Fokozatosan adj hozzá Azure szolgáltatásokat egy meglévő projekthez:

```bash
# Új szolgáltatáskomponens hozzáadása interaktívan
azd add
```

Ez különösen hasznos éles AI alkalmazások bővítéséhez – például egy vektor kereső szolgáltatás, új ügynök végpont vagy egy meglévő telepítéshez monitorozási komponens hozzáadásához.

## További források

- **Azure Well-Architected Framework**: [AI munkaterhelési útmutató](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry dokumentáció**: [Hivatalos dokumentáció](https://learn.microsoft.com/azure/ai-studio/)
- **Közösségi sablonok**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord közösség**: [#Azure csatorna](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure a skills.sh-en](https://skills.sh/microsoft/github-copilot-for-azure) - 37 nyílt agent skill Azure AI, Foundry, telepítés, költségoptimalizálás és diagnosztika témákban. Telepítsd a szerkesztődbe:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 8. fejezet - Éles & Vállalati minták
- **⬅️ Előző fejezet**: [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Kapcsolódó**: [AI Workshop Labor](ai-workshop-lab.md)
- **� Kurzus vége**: [AZD Kezdőknek](../../README.md)

**Ne feledd**: Az éles AI munkaterhelések gondos tervezést, figyelést és folyamatos optimalizálást igényelnek. Kezdd ezekkel a mintákkal, és igazítsd őket az egyedi igényeidhez.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->