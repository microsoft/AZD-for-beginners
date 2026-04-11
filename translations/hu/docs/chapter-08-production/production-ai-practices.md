# Termelési AI-munkaterhelés legjobb gyakorlatai AZD-vel

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD For Beginners](../../README.md)
- **📖 Aktuális fejezet**: 8. fejezet - Termelési és vállalati minták
- **⬅️ Előző fejezet**: [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Kapcsolódó**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Tanfolyam befejezve**: [AZD For Beginners](../../README.md)

## Áttekintés

Ez az útmutató átfogó legjobb gyakorlatokat kínál AI-munkaterhelések termelési szintű telepítéséhez Azure Developer CLI (AZD) használatával. A Microsoft Foundry Discord közösség visszajelzései és valós ügyféltelepítések alapján ezek a gyakorlatok a termelési AI rendszerek leggyakoribb kihívásait célozzák meg.

## A kezelt főbb kihívások

Közösségi szavazásunk eredményei alapján a fejlesztők legnagyobb problémái:

- **45%** küzd több szolgáltatásos AI telepítésekkel
- **38%** hitelesítő adatok és titkok kezelésével kapcsolatos problémák  
- **35%** a termelési készenlét és skálázás nehézségeit tapasztalja
- **32%** jobb költségoptimalizálási stratégiákra van szükség
- **29%** fejlettebb monitorozást és hibakeresést igényel

## Termelési AI architektúra minták

### 1. minta: Mikro-szolgáltatásos AI architektúra

**Mikor használjuk**: Több képességgel rendelkező összetett AI alkalmazások

```mermaid
graph TD
    Frontend[Webes Frontend] --- Gateway[API Átjáró] --- LB[Terheléselosztó]
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

### 2. minta: Eseményvezérelt AI feldolgozás

**Mikor használjuk**: Kötetes feldolgozás, dokumentumelemzés, aszinkron munkafolyamatok

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

## Az AI ügynök egészségi állapota

Amikor egy hagyományos webalkalmazás meghibásodik, a tünetek ismerősek: egy oldal nem tölt be, egy API hibát ad vissza, vagy egy telepítés sikertelen. Az AI-t használó alkalmazások ugyanilyen módokon hibásodhatnak meg—de van egy finomabb, kevésbé nyilvánvaló hibajelenségük is, amelyek nem produkálnak egyértelmű hibakódokat.

Ez a rész segít mentális modellt kialakítani az AI munkaterhelések monitorozásához, hogy tudd, hova nézz, ha valami nem tűnik rendben lévőnek.

### Hogyan különbözik az ügynök egészsége a hagyományos alkalmazás egészségétől

Egy hagyományos alkalmazás vagy működik, vagy nem. Egy AI ügynök működhet, de gyenge eredményeket produkálhat. Gondolj az ügynök egészségére két rétegben:

| Réteg | Mire figyelj | Hol nézd meg |
|-------|--------------|--------------|
| **Infrastruktúra állapota** | Fut-e a szolgáltatás? Foglaltak-e az erőforrások? Elérhetők-e az endpointok? | `azd monitor`, Azure Portal erőforrás állapot, konténer/app naplók |
| **Viselkedési állapot** | Pontosan válaszol-e az ügynök? Időben érkeznek a válaszok? Helyesen hívják-e meg a modellt? | Application Insights trace-ek, modell hívási késleltetés mutatók, válaszminőség naplók |

Az infrastruktúra egészsége ismerős—ugyanaz, mint bármely azd alkalmazásnál. A viselkedési állapot az a réteg, amit az AI munkaterhelések hoznak újként.

### Hova nézz, ha az AI alkalmazások nem úgy működnek, ahogy várnád

Ha az AI alkalmazás nem a várt eredményeket adja, itt egy fogalmi ellenőrző lista:

1. **Kezdd az alapokkal.** Fut az alkalmazás? Eléri a függőségeit? Nézd meg az `azd monitor` és az erőforrás állapotot, mint bármely más alkalmazásnál.
2. **Ellenőrizd a modell kapcsolatot.** Vajon az alkalmazás sikeresen hívja az AI modellt? Sikertelen vagy időtúllépéses modellhívások a leggyakoribb AI alkalmazáshibák okai, ezek az alkalmazás naplóiban látszanak.
3. **Nézd meg, mit kapott a modell.** Az AI válaszok a bemenettől (prompt és visszakeresett kontextus) függnek. Ha rossz a kimenet, általában rossz a bemenet is. Ellenőrizd, hogy az alkalmazás a megfelelő adatokat küldi-e a modellnek.
4. **Vizsgáld meg a válasz késleltetést.** Az AI modellhívások lassabbak, mint a tipikus API hívások. Ha az app lassúnak tűnik, nézd meg, nem nőtt-e a válaszidő—ez jelezhet korlátozást, kapacitásgondokat, vagy területi torlódást.
5. **Figyeld a költségjelzéseket.** Váratlan tokenhasználat vagy API hívási kiugrások jelezhetnek végtelen ciklust, hibás promptot vagy túlzott újrapróbálkozást.

Nem kell rögtön mesteri szinten kezelni az észlelhetőséget (observability tool-okat). A legfontosabb, hogy az AI alkalmazásoknak van egy plusz viselkedési rétegük, amit monitorozni kell, az azd beépített monitorozó eszköze (`azd monitor`) pedig jó kiindulópont mindkét réteg vizsgálatához.

---

## Biztonsági legjobb gyakorlatok

### 1. Zero-Trust biztonsági modell

**Megvalósítási stratégia**:
- Nincs szolgáltatás-szolgáltatás közti kommunikáció hitelesítés nélkül
- Minden API hívás menedzselt identitásokkal történik
- Hálózati izoláció privát endpointokkal
- Legkisebb jogosultság elvén alapuló hozzáférés vezérlés

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

### 2. Biztonságos titokkezelés

**Key Vault integrációs minta**:

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

### 3. Hálózati biztonság

**Privát endpoint konfiguráció**:

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

## Teljesítmény és skálázás

### 1. Auto-scaling stratégiák

**Container Apps automatikus skálázás**:

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

**Redis gyorsítótár AI válaszokhoz**:

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

### 3. Terheléselosztás és forgalomkezelés

**Application Gateway WAF-pal**:

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

### 1. Erőforrások méretezése környezethez igazítva

```bash
# Fejlesztői környezet
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

### 2. Költségfigyelés és -tervezés

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

**OpenAI költségkezelés**:

```typescript
// Alkalmazásszintű token optimalizálás
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // A kontextust vágjuk, ne a felhasználói bemenetet
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

## Monitorozás és észlelhetőség

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

**Egyedi AI mérőszámok dashboardjai**:

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

### 3. Egészségellenőrzések és rendelkezésre állás monitorozása

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

## Katasztrófakezelés és magas rendelkezésre állás

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

## DevOps és CI/CD integráció

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

### 2. Infrastruktúra érvényesítés

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Ellenőrizze, hogy az összes szükséges szolgáltatás fut-e
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Érvényesítse az OpenAI modell telepítéseket
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Tesztelje az AI szolgáltatás kapcsolódását
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Termelési készenlét ellenőrző lista

### Biztonság ✅
- [ ] Minden szolgáltatás menedzselt identitásokat használ
- [ ] Titkok tárolása Key Vaultban
- [ ] Privát endpointok konfigurálva
- [ ] Hálózati biztonsági csoportok alkalmazva
- [ ] RBAC legkisebb jogosultsággal
- [ ] WAF engedélyezve a nyilvános endpointokon

### Teljesítmény ✅
- [ ] Automatikus skálázás beállítva
- [ ] Gyorsítótárazás megvalósítva
- [ ] Terheléselosztás beállítva
- [ ] CDN statikus tartalmakhoz
- [ ] Adatbázis kapcsolatok poolozása
- [ ] Tokenhasználat optimalizálása

### Monitorozás ✅
- [ ] Application Insights konfigurálva
- [ ] Egyedi mérőszámok definiálva
- [ ] Értesítési szabályok beállítva
- [ ] Dashboard létrehozva
- [ ] Egészségellenőrzések megvalósítva
- [ ] Naplómegőrzési szabályzatok

### Megbízhatóság ✅
- [ ] Több régiós telepítés
- [ ] Biztonsági mentés és helyreállítási terv
- [ ] Megszakító (circuit breaker) megvalósítva
- [ ] Újrapróbálkozási szabályzatok
- [ ] Szépen degradáló működés
- [ ] Egészségellenőrző végpontok

### Költségkezelés ✅
- [ ] Költségkeret értesítések beállítva
- [ ] Erőforrások megfelelő méretezése
- [ ] Fejlesztői / teszt kedvezmények alkalmazása
- [ ] Foglalási előfizetések vásárlása
- [ ] Költségfigyelő dashboard
- [ ] Rendszeres költségértékelések

### Megfelelőség ✅
- [ ] Adatok tárolási helyének megfelelősége
- [ ] Audit naplózás engedélyezve
- [ ] Megfelelőségi szabályzatok alkalmazva
- [ ] Biztonsági alapvonalak megvalósítva
- [ ] Rendszeres biztonsági értékelések
- [ ] Eseménykezelési terv

## Teljesítmény mérőszámok

### Tipikus termelési mutatók

| Mutató | Célérték | Monitorozás |
|--------|----------|-------------|
| **Válaszidő** | < 2 másodperc | Application Insights |
| **Elérhetőség** | 99,9% | Rendelkezésre állás monitorozás |
| **Hibaarány** | < 0,1% | Alkalmazási naplók |
| **Tokenhasználat** | < 500 $/hó | Költségkezelés |
| **Egyidejű felhasználók** | 1000+ | Terheléses tesztelés |
| **Helyreállítási idő** | < 1 óra | Katasztrófakezelési tesztek |

### Terheléses tesztelés

```bash
# Terhelés tesztelő szkript AI alkalmazásokhoz
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Közösségi legjobb gyakorlatok

A Microsoft Foundry Discord közösség visszajelzései alapján:

### A közösség legfontosabb javaslatai:

1. **Kezdj kicsiben, skálázz fokozatosan**: Kezdd alap SKUk használatával, és a tényleges igények alapján bővítsd
2. **Figyelj mindenre**: Átfogó monitorozás beállítása az első naptól fogva
3. **Automatizáld a biztonságot**: Infrastruktúra mint kód segítségével a következetes biztonságért
4. **Tesztelj alaposan**: Csak AI-specifikus teszteket is illessz be a fejlesztői folyamatba
5. **Tervezd meg a költségeket**: Korán figyeld a tokenhasználatot és állíts be költségértesítéseket

### Gyakori buktatók, amiket kerülj el:

- ❌ API kulcsok kódba égetése
- ❌ Nem megfelelő monitorozás beállítása
- ❌ Költségoptimalizálás figyelmen kívül hagyása
- ❌ Hibakezelési forgatókönyvek tesztelésének mellőzése
- ❌ Telepítés egészségellenőrzések nélkül

## AZD AI CLI parancsok és bővítmények

Az AZD folyamatosan bővülő AI-specifikus parancskészlettel és bővítményekkel rendelkezik, amelyek egyszerűsítik az AI termelési munkafolyamatokat. Ezek az eszközök hidat képeznek a helyi fejlesztés és a termelési telepítés között AI munkaterhelések esetén.

### AI bővítmények az AZD-hez

Az AZD bővítményrendszert használ AI-specifikus képességek hozzáadására. Telepítsd és kezeld a bővítményeket:

```bash
# Sorolja fel az összes elérhető bővítményt (beleértve az AI-t is)
azd extension list

# Ellenőrizze a telepített bővítmények részleteit
azd extension show azure.ai.agents

# Telepítse a Foundry ügynökök bővítményt
azd extension install azure.ai.agents

# Telepítse a finomhangolási bővítményt
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek bővítményt
azd extension install azure.ai.models

# Frissítsen minden telepített bővítményt
azd extension upgrade --all
```

**Elérhető AI bővítmények:**

| Bővítmény | Cél | Státusz |
|-----------|-----|---------|
| `azure.ai.agents` | Foundry Agent szolgáltatás kezelése | Előnézet |
| `azure.ai.finetune` | Foundry modell finomhangolás | Előnézet |
| `azure.ai.models` | Foundry egyedi modellek | Előnézet |
| `azure.coding-agent` | Kódoló ügynök konfiguráció | Elérhető |

### Ügynök projektek inicializálása `azd ai agent init` paranccsal

Az `azd ai agent init` parancs előkészít egy termelési szintű AI ügynök projektet, amely integrált Microsoft Foundry Agent szolgáltatással:

```bash
# Egy új ügynökprojekt inicializálása egy ügynök-manifesztből
azd ai agent init -m <manifest-path-or-uri>

# Egy adott Foundry projekthez inicializálás és célzás
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Egy egyedi forráskönyvtárral történő inicializálás
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# A Container Apps célzása mint a hoszt
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Fontos kapcsolók:**

| Kapcsoló | Leírás |
|----------|---------|
| `-m, --manifest` | Ügynök manifeszt elérési út vagy URI, amit a projekthez ad |
| `-p, --project-id` | Létező Microsoft Foundry projektazonosító az azd környezethez |
| `-s, --src` | Könyvtár az ügynök definíció letöltéséhez (alapértelmezett: `src/<agent-id>`) |
| `--host` | Alapértelmezett host felülírása (pl. `containerapp`) |
| `-e, --environment` | Az azd környezet megadása |

**Termelési tipp**: Használd a `--project-id` kapcsolót, hogy közvetlenül egy meglévő Foundry projekthez csatlakozz, így az ügynök kód és a felhő erőforrások már a kezdetektől összekapcsoltak.

### Model Kontextus Protokoll (MCP) az `azd mcp` paranccsal

Az AZD beépített MCP szervert támogat (Alfa állapotban), amely lehetővé teszi AI ügynökök és eszközök számára, hogy szabványos protokollon keresztül érjék el az Azure erőforrásaidat:

```bash
# Indítsa el az MCP szervert a projektjéhez
azd mcp start

# Tekintse át az aktuális Copilot beleegyezési szabályokat az eszköz végrehajtásához
azd copilot consent list
```

Az MCP szerver megmutatja az azd projekted kontextusát – környezeteket, szolgáltatásokat és Azure erőforrásokat – AI-alapú fejlesztői eszközöknek. Ez lehetővé teszi:

- **AI által támogatott telepítést**: A kódoló ügynökök lekérdezhetik a projekt állapotát és indíthatják a telepítéseket
- **Erőforrás-felderítést**: AI eszközök megtalálhatják, milyen Azure erőforrásokat használ a projekt
- **Környezetkezelést**: Az ügynökök válthatnak dev/staging/termelési környezet között

### Infrastruktúra generálás `azd infra generate` paranccsal

Termelési AI munkaterhelésekhez generálhatsz és testreszabhatsz Infrastrukturát mint Kódot az automatikus előíráshoz képest:

```bash
# Bicep/Terraform fájlok generálása a projektdefinícióból
azd infra generate
```

Ez IaC-t ír lemezen így teheted:
- Átnézni és auditálni az infrastruktúrát a telepítés előtt
- Egyedi biztonsági szabályokat hozzáadni (hálózati szabályok, privát endpointok)
- Integrálódni a meglévő IaC felülvizsgálati folyamatokkal
- Verziókövetéssel különválasztani az infrastruktúra változtatásokat az alkalmazás kódtól

### Termelési életciklus hook-ok

Az AZD hook-ok lehetővé teszik egyedi logika beszúrását a telepítési életciklus minden pontján—kritikusak a termelési AI folyamatokhoz:

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
# Egy adott hook kézi futtatása fejlesztés közben
azd hooks run predeploy
```

**Ajánlott termelési hook-ok AI munkaterhelésekhez:**

| Hook | Használati eset |
|------|-----------------|
| `preprovision` | Feliratkozási kvóták ellenőrzése a modell kapacitáshoz |
| `postprovision` | Privát endpointok konfigurálása, modell súlyok telepítése |
| `predeploy` | AI biztonsági tesztek futtatása, prompt sémák ellenőrzése |
| `postdeploy` | Ügynök válaszok gyors tesztelése, modellkapcsolat ellenőrzése |

### CI/CD Pipeline konfiguráció

Használd az `azd pipeline config` parancsot, hogy projekted GitHub Actions vagy Azure Pipelines rendszerhez kapcsolódjon biztonságos Azure hitelesítéssel:

```bash
# CI/CD folyamat konfigurálása (interaktív)
azd pipeline config

# Konfigurálás egy adott szolgáltatóval
azd pipeline config --provider github
```

A parancs:
- Létrehoz egy legkisebb jogosultságú szolgáltatói fiókot
- Konfigurál federált hitelesítést (titkok tárolása nélkül)
- Létrehozza vagy frissíti a pipeline definíciós fájlt
- Beállítja a szükséges környezeti változókat a CI/CD rendszerben

**Termelési munkafolyamat pipeline konfigurációval:**

```bash
# 1. Állítsa be a termelési környezetet
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Állítsa be a folyamatot
azd pipeline config --provider github

# 3. A folyamat azd deploy parancsot futtat minden fő ágra történő push esetén
```

### Komponensek hozzáadása `azd add` paranccsal

Fokozatosan adj hozzá Azure szolgáltatásokat egy létező projekthez:

```bash
# Új szolgáltatáskomponens interaktív hozzáadása
azd add
```

Ez különösen hasznos a termelési AI alkalmazások bővítésénél — például vektor kereső szolgáltatás, új ügynök végpont vagy monitorozó komponens hozzáadása egy meglévő telepítéshez.

## További erőforrások
- **Azure jól felépített keretrendszer**: [Mesterséges intelligencia munkaterhelés iránymutatás](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry dokumentáció**: [Hivatalos dokumentumok](https://learn.microsoft.com/azure/ai-studio/)
- **Közösségi sablonok**: [Azure minták](https://github.com/Azure-Samples)
- **Discord közösség**: [#Azure csatorna](https://discord.gg/microsoft-azure)
- **Agent tudások az Azure-hoz**: [microsoft/github-copilot-for-azure a skills.sh-en](https://skills.sh/microsoft/github-copilot-for-azure) - 37 nyílt agent tudás az Azure AI, Foundry, telepítés, költségoptimalizálás és diagnosztika területén. Telepítsd a szerkesztődbe:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 8. fejezet - Termelés és vállalati minták
- **⬅️ Előző fejezet**: [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Kapcsolódó**: [AI műhely labor](ai-workshop-lab.md)
- **� Tanfolyam befejezve**: [AZD kezdőknek](../../README.md)

**Ne feledd**: a termelési mesterséges intelligencia munkaterhelések gondos tervezést, folyamatos figyelést és optimalizálást igényelnek. Kezdd ezekkel a mintákkal, és igazítsd őket a saját igényeidhez.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum a saját nyelvén tekintendő elsődleges forrásnak. Kritikus információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->