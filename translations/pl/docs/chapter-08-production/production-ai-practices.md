# Najlepsze praktyki obsługi AI w produkcji z AZD

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 8 - Wzorce produkcyjne i korporacyjne
- **⬅️ Poprzedni rozdział**: [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Powiązane również**: [Laboratorium warsztatów AI](ai-workshop-lab.md)
- **🎯 Kurs ukończony**: [AZD dla początkujących](../../README.md)

## Przegląd

Ten przewodnik zawiera kompleksowe najlepsze praktyki dotyczące wdrażania gotowych do produkcji obciążeń AI za pomocą Azure Developer CLI (AZD). Oparte na opiniach społeczności Microsoft Foundry Discord oraz rzeczywistych wdrożeniach klientów, praktyki te rozwiązują najczęstsze wyzwania w systemach AI produkcyjnych.

## Najważniejsze wyzwania

Na podstawie wyników ankiety społeczności deweloperów, oto główne problemy, z jakimi się mierzą:

- **45%** ma trudności z wdrażaniem AI w wielu usługach
- **38%** ma problemy z zarządzaniem poświadczeniami i sekretami  
- **35%** uważa za trudne zapewnienie gotowości produkcyjnej i skalowalności
- **32%** potrzebuje lepszych strategii optymalizacji kosztów
- **29%** wymaga poprawy monitorowania i rozwiązywania problemów

## Wzorce architektury dla produkcyjnego AI

### Wzorzec 1: Architektura AI oparta na mikroserwisach

**Kiedy stosować**: Złożone aplikacje AI z wieloma funkcjami

```mermaid
graph TD
    Frontend[Frontend internetowy] --- Gateway[Brama API] --- LB[Równoważnik obciążenia]
    Gateway --> Chat[Usługa czatu]
    Gateway --> Image[Usługa obrazów]
    Gateway --> Text[Usługa tekstu]
    Chat --> OpenAI[Modele Microsoft Foundry]
    Image --> Vision[Wizja komputerowa]
    Text --> DocIntel[Inteligencja dokumentów]
```
**Implementacja AZD**:

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

### Wzorzec 2: Przetwarzanie AI sterowane zdarzeniami

**Kiedy stosować**: Przetwarzanie wsadowe, analiza dokumentów, asynchroniczne procesy

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

## Myślenie o zdrowiu agenta AI

Gdy tradycyjna aplikacja sieciowa przestaje działać, objawy są znane: strona się nie ładuje, API zwraca błąd lub wdrożenie kończy się niepowodzeniem. Aplikacje zasilane AI mogą zawodzić w tych samych sposób — ale mogą też zachowywać się nieprawidłowo w subtelniejszy sposób, który nie generuje oczywistych komunikatów o błędach.

Ta sekcja pomaga stworzyć model mentalny do monitorowania obciążeń AI, by wiedzieć, gdzie szukać problemów, gdy coś jest nie tak.

### Jak zdrowie agenta różni się od zdrowia tradycyjnej aplikacji

Tradycyjna aplikacja albo działa, albo nie. Agent AI może działać na pozór poprawnie, ale generować słabe wyniki. Zdrowie agenta można rozważać na dwóch warstwach:

| Warstwa | Co obserwować | Gdzie szukać |
|---------|---------------|--------------|
| **Zdrowie infrastruktury** | Czy usługa działa? Czy zasoby są przydzielone? Czy endpointy są dostępne? | `azd monitor`, zdrowie zasobów w Azure Portal, logi kontenerów/aplikacji |
| **Zdrowie zachowania** | Czy agent odpowiada dokładnie? Czy odpowiedzi są na czas? Czy model jest wywoływany prawidłowo? | śledzenia Application Insights, metryki opóźnień wywołań modelu, logi jakości odpowiedzi |

Zdrowie infrastruktury jest znane — to to samo dla każdej aplikacji azd. Zdrowie zachowania to nowa warstwa wprowadzona przez obciążenia AI.

### Gdzie szukać, gdy aplikacje AI nie zachowują się zgodnie z oczekiwaniami

Jeśli Twoja aplikacja AI nie generuje oczekiwanych rezultatów, oto konceptualna lista kontrolna:

1. **Zacznij od podstaw.** Czy aplikacja działa? Czy może połączyć się z zależnościami? Sprawdź `azd monitor` i zdrowie zasobów, tak jak w przypadku każdej aplikacji.
2. **Sprawdź połączenie z modelem.** Czy Twoja aplikacja skutecznie wywołuje model AI? Nieudane lub zbyt długie wywołania są najczęstszą przyczyną problemów i pojawią się w logach aplikacji.
3. **Spójrz, co model otrzymał.** Odpowiedzi AI zależą od danych wejściowych (prompt i ewentualnego pobranego kontekstu). Jeśli wynik jest błędny, zwykle problem jest z wejściem. Sprawdź, czy aplikacja wysyła odpowiednie dane do modelu.
4. **Przejrzyj opóźnienia odpowiedzi.** Wywołania modeli AI są wolniejsze niż typowe wywołania API. Jeśli aplikacja działa wolno, sprawdź, czy czasy odpowiedzi modelu się wydłużyły — może to oznaczać ograniczenia przepustowości, limity pojemności lub przeciążenie regionu.
5. **Obserwuj sygnały kosztowe.** Niespodziewane skoki w zużyciu tokenów lub wywołaniach API mogą wskazywać pętlę, błędną konfigurację prompta lub nadmierne ponawianie prób.

Nie musisz od razu opanowywać narzędzi do obserwacji. Kluczowe jest zrozumienie, że aplikacje AI mają dodatkową warstwę zachowania do monitorowania, a wbudowane monitorowanie azd (`azd monitor`) daje punkt startowy do badania obu warstw.

---

## Najlepsze praktyki bezpieczeństwa

### 1. Model bezpieczeństwa Zero-Trust

**Strategia wdrożenia**:
- Brak komunikacji między usługami bez uwierzytelnienia
- Wszystkie wywołania API używają tożsamości zarządzanych
- Izolacja sieciowa poprzez prywatne endpointy
- Kontrola dostępu na zasadzie najmniejszych uprawnień

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

### 2. Bezpieczne zarządzanie sekretami

**Wzorzec integracji z Key Vault**:

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

### 3. Bezpieczeństwo sieci

**Konfiguracja prywatnych endpointów**:

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

## Wydajność i skalowanie

### 1. Strategie automatycznego skalowania

**Automatyczne skalowanie Kontenerowych Aplikacji**:

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

### 2. Strategie pamięci podręcznej

**Redis Cache dla odpowiedzi AI**:

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

### 3. Równoważenie obciążenia i zarządzanie ruchem

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

## 💰 Optymalizacja kosztów

### 1. Dopasowanie zasobów

**Konfiguracje specyficzne dla środowiska**:

```bash
# Środowisko deweloperskie
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Środowisko produkcyjne
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Monitorowanie kosztów i budżety

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

### 3. Optymalizacja wykorzystania tokenów

**Zarządzanie kosztami OpenAI**:

```typescript
// Optymalizacja tokenów na poziomie aplikacji
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Obcinaj kontekst, nie dane wejściowe użytkownika
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Przybliżone oszacowanie: 1 token ≈ 4 znaki
    return Math.ceil(text.length / 4);
  }
}
```

## Monitoring i obserwowalność

### 1. Kompleksowe Application Insights

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

### 2. Monitoring specyficzny dla AI

**Własne pulpity kontrolne dla metryk AI**:

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

### 3. Kontrole stanu i monitorowanie dostępności

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

## Odzyskiwanie po awarii i wysoka dostępność

### 1. Wdrożenie wieloregionalne

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

### 2. Kopia zapasowa i odzyskiwanie danych

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

## Integracja DevOps i CI/CD

### 1. Workflow GitHub Actions

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

### 2. Walidacja infrastruktury

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Sprawdź, czy wszystkie wymagane usługi działają
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Zweryfikuj wdrożenia modeli OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Przetestuj łączność z usługą AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Lista kontrolna gotowości produkcyjnej

### Bezpieczeństwo ✅
- [ ] Wszystkie usługi używają tożsamości zarządzanych
- [ ] Sekrety przechowywane w Key Vault
- [ ] Skonfigurowane prywatne endpointy
- [ ] Zaimplementowane grupy zabezpieczeń sieciowych
- [ ] RBAC z zasadą najmniejszych uprawnień
- [ ] WAF włączony na publicznych endpointach

### Wydajność ✅
- [ ] Skonfigurowane automatyczne skalowanie
- [ ] Wdrożona pamięć podręczna
- [ ] Skonfigurowane równoważenie obciążenia
- [ ] CDN dla zawartości statycznej
- [ ] Połączenia do baz danych z poolingiem
- [ ] Optymalizacja wykorzystania tokenów

### Monitoring ✅
- [ ] Skonfigurowane Application Insights
- [ ] Zdefiniowane metryki niestandardowe
- [ ] Skonfigurowane reguły alertów
- [ ] Utworzony pulpit kontrolny
- [ ] Zaimplementowane kontrole stanu
- [ ] Polityki przechowywania logów

### Niezawodność ✅
- [ ] Wdrożenie wieloregionalne
- [ ] Plan kopii zapasowej i odzyskiwania
- [ ] Wdrożone zabezpieczenia (circuit breakers)
- [ ] Skonfigurowane polityki ponawiania prób
- [ ] Łagodne degradacje
- [ ] Endpointy kontroli stanu

### Zarządzanie kosztami ✅
- [ ] Skonfigurowane alerty budżetowe
- [ ] Dopasowanie zasobów
- [ ] Zastosowane zniżki dla dev/test
- [ ] Zakupione rezerwacje instancji
- [ ] Pulpit do monitorowania kosztów
- [ ] Regularne przeglądy kosztów

### Zgodność ✅
- [ ] Spełnione wymagania dotyczące lokalizacji danych
- [ ] Włączone logowanie audytowe
- [ ] Zastosowane polityki zgodności
- [ ] Wdrożone standardy bezpieczeństwa
- [ ] Regularne oceny bezpieczeństwa
- [ ] Plan reagowania na incydenty

## Wskaźniki wydajności

### Typowe metryki produkcyjne

| Metryka | Cel | Monitoring |
|---------|-----|------------|
| **Czas odpowiedzi** | < 2 sekundy | Application Insights |
| **Dostępność** | 99,9% | Monitorowanie dostępności |
| **Wskaźnik błędów** | < 0,1% | Logi aplikacji |
| **Zużycie tokenów** | < 500 USD/miesiąc | Zarządzanie kosztami |
| **Liczba jednoczesnych użytkowników** | 1000+ | Testy obciążeniowe |
| **Czas odzyskiwania** | < 1 godzina | Testy odzyskiwania po awarii |

### Testy obciążeniowe

```bash
# Skrypt testów obciążeniowych dla aplikacji AI
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Najlepsze praktyki społeczności

Na podstawie opinii społeczności Microsoft Foundry Discord:

### Najważniejsze zalecenia społeczności:

1. **Zacznij od małych zasobów, skaluj stopniowo**: Zacznij od podstawowych SKU i zwiększaj w oparciu o rzeczywiste zapotrzebowanie
2. **Monitoruj wszystko**: Ustaw kompleksowy monitoring od pierwszego dnia
3. **Automatyzuj bezpieczeństwo**: Wykorzystuj infrastrukturę jako kod dla spójnego bezpieczeństwa
4. **Dokładnie testuj**: Uwzględnij w pipeline testy specyficzne dla AI
5. **Planuj koszty**: Monitoruj zużycie tokenów i wczesne alerty budżetowe

### Typowe pułapki do unikania:

- ❌ Twarde kodowanie kluczy API w kodzie
- ❌ Brak właściwego monitorowania
- ❌ Ignorowanie optymalizacji kosztów
- ❌ Brak testów scenariuszy awaryjnych
- ❌ Wdrożenia bez kontroli stanu

## Polecenia i rozszerzenia AI w AZD

AZD zawiera rosnący zestaw poleceń i rozszerzeń specyficznych dla AI, które usprawniają produkcyjne workflow AI. Narzędzia te łączą lokalny rozwój z wdrożeniem produkcyjnym obciążeń AI.

### Rozszerzenia AZD dla AI

AZD korzysta z systemu rozszerzeń dodających funkcje specyficzne dla AI. Instaluj i zarządzaj rozszerzeniami za pomocą:

```bash
# Wyświetl wszystkie dostępne rozszerzenia (w tym AI)
azd extension list

# Sprawdź szczegóły zainstalowanego rozszerzenia
azd extension show azure.ai.agents

# Zainstaluj rozszerzenie agentów Foundry
azd extension install azure.ai.agents

# Zainstaluj rozszerzenie do dostrajania
azd extension install azure.ai.finetune

# Zainstaluj rozszerzenie modeli niestandardowych
azd extension install azure.ai.models

# Uaktualnij wszystkie zainstalowane rozszerzenia
azd extension upgrade --all
```

**Dostępne rozszerzenia AI:**

| Rozszerzenie | Przeznaczenie | Status |
|--------------|---------------|--------|
| `azure.ai.agents` | Zarządzanie usługą Foundry Agent | Preview |
| `azure.ai.finetune` | Dostosowywanie modeli Foundry | Preview |
| `azure.ai.models` | Niestandardowe modele Foundry | Preview |
| `azure.coding-agent` | Konfiguracja agenta kodującego | Dostępne |

### Inicjalizacja projektów agentów za pomocą `azd ai agent init`

Polecenie `azd ai agent init` szkicuje projekt agenta AI gotowego do produkcji zintegrowany z usługą Microsoft Foundry Agent Service:

```bash
# Zainicjuj nowy projekt agenta z manifestu agenta
azd ai agent init -m <manifest-path-or-uri>

# Zainicjuj i wybierz konkretny projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Zainicjuj z niestandardowym katalogiem źródłowym
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Wybierz Container Apps jako hosta
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Kluczowe flagi:**

| Flaga | Opis |
|-------|------|
| `-m, --manifest` | Ścieżka lub URI manifestu agenta do dodania do projektu |
| `-p, --project-id` | Istniejące ID projektu Microsoft Foundry dla środowiska azd |
| `-s, --src` | Katalog do pobrania definicji agenta (domyślnie `src/<agent-id>`) |
| `--host` | Nadpisanie domyślnego hosta (np. `containerapp`) |
| `-e, --environment` | Środowisko azd do użycia |

**Wskazówka produkcyjna**: Użyj `--project-id`, aby połączyć się bezpośrednio z istniejącym projektem Foundry, utrzymując kod agenta i zasoby chmurowe powiązane od samego początku.

### Protokół kontekstowy modelu (MCP) z `azd mcp`

AZD zawiera wbudowaną obsługę serwera MCP (Alpha), umożliwiającą agentom AI i narzędziom interakcję z Twoimi zasobami Azure za pomocą standardowego protokołu:

```bash
# Uruchom serwer MCP dla swojego projektu
azd mcp start

# Przejrzyj aktualne zasady zgody Copilot na wykonanie narzędzia
azd copilot consent list
```

Serwer MCP udostępnia kontekst projektu azd — środowiska, usługi i zasoby Azure — narzędziom deweloperskim wspomaganym AI. To umożliwia:

- **Wdrożenia wspomagane AI**: Pozwól agentom kodowania pytać o stan projektu i wywoływać wdrożenia
- **Odkrywanie zasobów**: Narzędzia AI mogą poznać, jakich zasobów Azure używa projekt
- **Zarządzanie środowiskami**: Agenci mogą przełączać się między środowiskami dev/staging/production

### Generowanie infrastruktury z `azd infra generate`

Dla produkcyjnych obciążeń AI możesz generować i dostosowywać Infrastrukturę jako Kod zamiast polegać na automatycznym provisioningu:

```bash
# Generuj pliki Bicep/Terraform z definicji projektu
azd infra generate
```

Zapisuje to IaC na dysku, abyś mógł:
- Przejrzeć i audytować infrastrukturę przed wdrożeniem
- Dodawać niestandardowe polityki bezpieczeństwa (reguły sieciowe, prywatne endpointy)
- Integracja z istniejącymi procesami przeglądu IaC
- Kontrolować wersje zmian infrastruktury oddzielnie od kodu aplikacji

### Haki cyklu życia produkcyjnego

Haki AZD pozwalają wstrzykiwać niestandardową logikę na każdym etapie cyklu wdrożenia — co jest kluczowe dla produkcyjnych workflow AI:

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
# Ręczne uruchomienie określonego hooka podczas tworzenia
azd hooks run predeploy
```

**Zalecane haki produkcyjne dla obciążeń AI:**

| Hak | Przypadek użycia |
|-----|------------------|
| `preprovision` | Walidacja limitów subskrypcji na pojemność modeli AI |
| `postprovision` | Konfiguracja prywatnych endpointów, wdrożenie wag modeli |
| `predeploy` | Uruchamianie testów bezpieczeństwa AI, walidacja szablonów promptów |
| `postdeploy` | Testy dymne odpowiedzi agenta, weryfikacja łączności z modelem |

### Konfiguracja pipeline CI/CD

Użyj `azd pipeline config` do połączenia projektu z GitHub Actions lub Azure Pipelines z bezpiecznym uwierzytelnieniem Azure:

```bash
# Skonfiguruj pipeline CI/CD (interaktywnie)
azd pipeline config

# Skonfiguruj z określonym dostawcą
azd pipeline config --provider github
```

To polecenie:
- Tworzy service principal z dostępem minimalnych uprawnień
- Konfiguruje federowane poświadczenia (bez przechowywanych sekretów)
- Generuje lub aktualizuje plik definicji pipeline
- Ustawia wymagane zmienne środowiskowe w systemie CI/CD

**Produkcyjny workflow z konfiguracją pipeline:**

```bash
# 1. Skonfiguruj środowisko produkcyjne
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Skonfiguruj potok
azd pipeline config --provider github

# 3. Potok uruchamia azd deploy przy każdym pushu do main
```

### Dodawanie komponentów za pomocą `azd add`

Stopniowo dodawaj usługi Azure do istniejącego projektu:

```bash
# Dodaj nowy komponent usługi interaktywnie
azd add
```

Jest to szczególnie przydatne do rozszerzania produkcyjnych aplikacji AI — na przykład dodanie usługi wyszukiwania wektorowego, nowego endpointu agenta czy komponentu monitorującego do istniejącego wdrożenia.

## Dodatkowe zasoby
- **Azure Well-Architected Framework**: [Wytyczne dotyczące obciążeń AI](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Oficjalna dokumentacja](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Przykłady Azure](https://github.com/Azure-Samples)
- **Discord Community**: [Kanał #Azure](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 dostępnych umiejętności agenta dla Azure AI, Foundry, wdrożeń, optymalizacji kosztów i diagnostyki. Zainstaluj w swoim edytorze:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 8 - Wzorce produkcyjne i korporacyjne
- **⬅️ Poprzedni rozdział**: [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Również powiązane**: [Laboratorium warsztatów AI](ai-workshop-lab.md)
- **� Kurs ukończony**: [AZD dla początkujących](../../README.md)

**Pamiętaj**: Produkcyjne obciążenia AI wymagają starannego planowania, monitorowania i ciągłej optymalizacji. Zacznij od tych wzorców i dostosuj je do swoich specyficznych wymagań.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uważany za źródło wiążące. Dla informacji krytycznych zalecane jest profesjonalne tłumaczenie wykonywane przez człowieka. Nie ponosimy odpowiedzialności za wszelkie nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->