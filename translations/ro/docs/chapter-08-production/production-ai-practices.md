# Practici Optime pentru Sarcini AI de Producție cu AZD

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 8 - Modele de Producție & Enterprise
- **⬅️ Capitol Anterior**: [Capitolul 7: Depanare](../chapter-07-troubleshooting/debugging.md)
- **⬅️ De asemenea Relevant**: [Laborator Workshop AI](ai-workshop-lab.md)
- **🎯 Curs Finalizat**: [AZD Pentru Începători](../../README.md)

## Prezentare Generală

Acest ghid oferă practici optime cuprinzătoare pentru implementarea sarcinilor AI gata de producție folosind Azure Developer CLI (AZD). Bazat pe feedback-ul comunității Microsoft Foundry Discord și implementările din lumea reală ale clienților, aceste practici abordează cele mai comune provocări în sistemele AI de producție.

## Provocări Cheie Abordate

Pe baza rezultatelor sondajului comunității noastre, acestea sunt principalele provocări cu care se confruntă dezvoltatorii:

- **45%** au dificultăți în implementările AI multi-serviciu
- **38%** întâmpină probleme cu gestionarea acreditărilor și secretelor  
- **35%** consideră dificilă pregătirea pentru producție și scalarea
- **32%** au nevoie de strategii mai bune de optimizare a costurilor
- **29%** solicită îmbunătățiri în monitorizare și depanare

## Modele de Arhitectură pentru AI de Producție

### Model 1: Arhitectura AI cu Microservicii

**Când să folosești**: Aplicații AI complexe cu multiple capabilități

```mermaid
graph TD
    Frontend[Interfață Web] --- Gateway[Poarta API] --- LB[Balancer de Sarcină]
    Gateway --> Chat[Serviciu Chat]
    Gateway --> Image[Serviciu Imagine]
    Gateway --> Text[Serviciu Text]
    Chat --> OpenAI[Modele Microsoft Foundry]
    Image --> Vision[Viziune Computerizată]
    Text --> DocIntel[Inteligenta Documentelor]
```
**Implementare AZD**:

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

### Model 2: Procesare AI Bazată pe Evenimente

**Când să folosești**: Procesare în loturi, analiză de documente, fluxuri de lucru asincrone

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

## Gândind la Starea Sănătății Agentului AI

Când o aplicație web tradițională se sparge, simptomele sunt familiare: o pagină nu se încarcă, o API returnează o eroare sau o implementare eșuează. Aplicațiile alimentate de AI pot eșua în toate aceste moduri—dar pot avea și comportamente subtile care nu produc mesaje clare de eroare.

Această secțiune te ajută să construiești un model mental pentru monitorizarea sarcinilor AI ca să știi unde să cauți când ceva nu pare în regulă.

### Cum Diferă Starea Agentului de Starea Aplicației Tradiționale

O aplicație tradițională fie funcționează, fie nu. Un agent AI poate părea că funcționează, dar să producă rezultate slabe. Gândește-te la starea agentului în două niveluri:

| Nivel | Ce să Monitorizezi | Unde să Cauți |
|-------|-------------------|--------------|
| **Starea infrastructurii** | Serviciul funcționează? Sunt resursele provisionate? Sunt punctele finale accesibile? | `azd monitor`, starea resurselor în portalul Azure, jurnalele containerului/aplicației |
| **Starea comportamentului** | Agentul răspunde corect? Răspunsurile sunt la timp? Modelul este apelat corect? | Trasee din Application Insights, metrici de latență pentru apelurile modelului, jurnale de calitate a răspunsului |

Starea infrastructurii este familiară—este aceeași pentru orice aplicație azd. Starea comportamentală este stratul nou pe care-l introduc sarcinile AI.

### Unde să Cauți Când Aplicațiile AI Nu Se Comportă Cum Te Aștepți

Dacă aplicația ta AI nu produce rezultatele așteptate, iată o listă conceptuala:

1. **Începe cu elementele de bază.** Aplicația rulează? Poate ajunge la dependențele sale? Verifică `azd monitor` și starea resurselor la fel cum ai face pentru orice aplicație.
2. **Verifică conexiunea cu modelul.** Aplicația ta apelează cu succes modelul AI? Apelurile eșuate sau cu timeout către model sunt cauza cea mai comună a problemelor aplicațiilor AI și vor apărea în jurnalele aplicației.
3. **Uită-te la ce a primit modelul.** Răspunsurile AI depind de input (promptul și orice context preluat). Dacă ieșirea este greșită, de obicei inputul e greșit. Verifică dacă aplicația ta trimite datele corecte modelului.
4. **Revizuiește latența răspunsului.** Apelurile către modelele AI sunt mai lente decât apelurile API obișnuite. Dacă aplicația se simte lentă, verifică dacă timpii de răspuns ai modelului au crescut—acesta poate indica limitări de resurse, limite de capacitate sau congestie la nivel de regiune.
5. **Urmărește semnalele de cost.** Creșteri neașteptate în consumul de tokeni sau apeluri API pot indica o buclă, un prompt greșit configurat sau retrieri excesive.

Nu trebuie să stăpânești imediat unelte de observabilitate. Concluzia principală este că aplicațiile AI au un strat suplimentar de comportament de monitorizat, iar monitorizarea încorporată azd (`azd monitor`) îți oferă un punct de plecare pentru investigarea ambelor niveluri.

---

## Practici Optime de Securitate

### 1. Modelul de Securitate Zero-Trust

**Strategie de Implementare**:
- Fără comunicare serviciu-la-serviciu fără autentificare
- Toate apelurile API folosesc identități gestionate
- Izolare de rețea cu puncte finale private
- Controlul accesului cu cele mai mici privilegii

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

### 2. Gestionare Securizată a Secretelor

**Model Integrare Key Vault**:

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

### 3. Securitatea Rețelei

**Configurare Punct Endpoint Privat**:

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

## Performanță și Scalare

### 1. Strategii de Auto-Scalare

**Auto-scalarea Container Apps**:

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

### 2. Strategii de Caching

**Cache Redis pentru Răspunsuri AI**:

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

### 3. Echilibrare a Sarcinii și Managementul Traficului

**Application Gateway cu WAF**:

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

## 💰 Optimizarea Costurilor

### 1. Dimensionare Corectă a Resurselor

**Configurații Specifice Mediului**:

```bash
# Mediu de dezvoltare
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Mediu de producție
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Monitorizarea Costurilor și Bugete

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

### 3. Optimizarea Utilizării Tokenilor

**Gestionarea Costurilor OpenAI**:

```typescript
// Optimizarea token-urilor la nivel de aplicație
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Trunchiați contextul, nu intrarea utilizatorului
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Estimare aproximativă: 1 token ≈ 4 caractere
    return Math.ceil(text.length / 4);
  }
}
```

## Monitorizare și Observabilitate

### 1. Application Insights cuprinzător

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

### 2. Monitorizare Specifică AI

**Dashboard-uri personalizate pentru metrici AI**:

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

### 3. Verificări de sănătate și monitorizare uptime

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

## Recuperare în caz de dezastru și disponibilitate ridicată

### 1. Implementare Multi-Regiune

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

### 2. Backup și Recuperare Date

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

## Integrare DevOps și CI/CD

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

### 2. Validarea Infrastructurii

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Verifică dacă toate serviciile necesare rulează
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Validează implementările modelelor OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Testează conectivitatea serviciului AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Lista de Verificare pentru Pregătirea Producției

### Securitate ✅
- [ ] Toate serviciile folosesc identități gestionate
- [ ] Secretele sunt stocate în Key Vault
- [ ] Puncte finale private configurate
- [ ] Grupuri de securitate pentru rețea implementate
- [ ] RBAC cu privilegii minime
- [ ] WAF activat pe punctele finale publice

### Performanță ✅
- [ ] Auto-scalare configurată
- [ ] Caching implementat
- [ ] Configurare echilibrare a sarcinii
- [ ] CDN pentru conținut static
- [ ] Pooling pentru conexiuni baze de date
- [ ] Optimizare utilizare tokeni

### Monitorizare ✅
- [ ] Application Insights configurat
- [ ] Metrici personalizate definite
- [ ] Reguli de alertare setate
- [ ] Dashboard creat
- [ ] Verificări de sănătate implementate
- [ ] Politici de retenție a jurnalelor

### Fiabilitate ✅
- [ ] Implementare multi-regiune
- [ ] Plan de backup și recuperare
- [ ] Circuit breaker implementat
- [ ] Politici de retry configurate
- [ ] Degradare grațioasă
- [ ] Puncte finale pentru verificări de sănătate

### Management Costuri ✅
- [ ] Alarme de buget configurate
- [ ] Dimensionare corectă a resurselor
- [ ] Discounturi pentru dev/test aplicate
- [ ] Instanțe rezervate achiziționate
- [ ] Dashboard de monitorizare costuri
- [ ] Revizuiri regulate ale costurilor

### Conformitate ✅
- [ ] Cerințe privind rezidența datelor respectate
- [ ] Auditarea jurnalelor activată
- [ ] Politici de conformitate aplicate
- [ ] Baze de securitate implementate
- [ ] Evaluări regulate de securitate
- [ ] Plan de răspuns la incidente

## Repere de Performanță

### Metrici Tipice de Producție

| Metrică | Țintă | Monitorizare |
|--------|--------|------------|
| **Timp Răspuns** | < 2 secunde | Application Insights |
| **Disponibilitate** | 99.9% | Monitorizare uptime |
| **Rată de Eroare** | < 0.1% | Jurnale aplicație |
| **Utilizare Tokeni** | < $500/lună | Management costuri |
| **Utilizatori Concurenți** | 1000+ | Testare de încărcare |
| **Timp Recuperare** | < 1 oră | Teste recuperare dezastre |

### Testare de Încărcare

```bash
# Script de testare a încărcării pentru aplicații AI
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Practici Optime din Comunitate

Bazat pe feedback-ul comunității Microsoft Foundry Discord:

### Recomandările de Top ale Comunității:

1. **Începe mic, crește gradual**: Pornește cu SKU-uri de bază și scalează în funcție de utilizare
2. **Monitorizează tot**: Configurează monitorizare cuprinzătoare de la prima zi
3. **Automatizează securitatea**: Folosește infrastructură ca și cod pentru securitate consistentă
4. **Testează temeinic**: Include testare specifică AI în pipeline-ul tău
5. **Planifică costurile**: Monitorizează utilizarea tokenilor și setează alerte de buget devreme

### Capcane Comune de Evitat:

- ❌ Codificarea directă a cheilor API în cod
- ❌ Lipsa configurării monitorizării adecvate
- ❌ Ignorarea optimizării costurilor
- ❌ Lipsa testării scenariilor de eșec
- ❌ Implementarea fără verificări de sănătate

## Comenzi și Extensii AZD AI CLI

AZD include un set în creștere de comenzi și extensii specifice AI care simplifică fluxurile de lucru AI în producție. Aceste unelte fac legătura între dezvoltarea locală și implementarea în producție a sarcinilor AI.

### Extensii AZD pentru AI

AZD utilizează un sistem de extensii pentru a adăuga capabilități specifice AI. Instalează și gestionează extensiile cu:

```bash
# Listează toate extensiile disponibile (inclusiv AI)
azd extension list

# Instalează extensia agenților Foundry
azd extension install azure.ai.agents

# Instalează extensia de ajustare fină
azd extension install azure.ai.finetune

# Instalează extensia modelelor personalizate
azd extension install azure.ai.models

# Actualizează toate extensiile instalate
azd extension upgrade --all
```

**Extensii AI disponibile:**

| Extensie | Scop | Stare |
|-----------|---------|--------|
| `azure.ai.agents` | Management serviciu Foundry Agent | Preview |
| `azure.ai.finetune` | Fine-tuning modele Foundry | Preview |
| `azure.ai.models` | Modele personalizate Foundry | Preview |
| `azure.coding-agent` | Configurare agent de codare | Disponibil |

### Inițializarea Proiectelor Agent cu `azd ai agent init`

Comanda `azd ai agent init` generează un proiect agent AI gata de producție integrat cu Microsoft Foundry Agent Service:

```bash
# Inițializează un nou proiect agent dintr-un manifest agent
azd ai agent init -m <manifest-path-or-uri>

# Inițializează și vizează un proiect Foundry specific
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Inițializează cu un director sursă personalizat
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vizează Container Apps ca gazdă
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Flag-uri cheie:**

| Flag | Descriere |
|------|-------------|
| `-m, --manifest` | Cale sau URI către un manifest agent de adăugat în proiect |
| `-p, --project-id` | ID-ul proiectului Microsoft Foundry existent pentru mediul azd |
| `-s, --src` | Director pentru descărcarea definiției agentului (implicit `src/<agent-id>`) |
| `--host` | Suprascrie gazda implicită (ex. `containerapp`) |
| `-e, --environment` | Mediul azd de utilizat |

**Sfat de producție**: Folosește `--project-id` pentru a te conecta direct la un proiect Foundry existent, menținând astfel codul agentului și resursele cloud legate de la început.

### Protocolul Model Context (MCP) cu `azd mcp`

AZD include suport încorporat pentru server MCP (Alpha), care permite agenților AI și uneltelor să interacționeze cu resursele tale Azure printr-un protocol standardizat:

```bash
# Porniți serverul MCP pentru proiectul dvs.
azd mcp start

# Gestionați consimțământul pentru instrument pentru operațiunile MCP
azd mcp consent
```

Serverul MCP expune contextul proiectului azd—medii, servicii și resurse Azure—către unelte de dezvoltare asistate de AI. Acest lucru permite:

- **Implementare asistată de AI**: Permite agenților de codare să interogheze starea proiectului și să declanșeze implementări
- **Descoperire resurse**: Uneltele AI pot identifica ce resurse Azure utilizează proiectul tău
- **Management medii**: Agenții pot comuta între medii de dezvoltare/staging/producție

### Generarea Infrastructurii cu `azd infra generate`

Pentru sarcini AI de producție, poți genera și personaliza Infrastructure as Code în loc să te bazezi pe provisioning automat:

```bash
# Generează fișiere Bicep/Terraform din definiția proiectului tău
azd infra generate
```

Acesta scrie IaC pe disc astfel încât să poți:
- Revizui și audita infrastructura înainte de implementare
- Adăuga politici de securitate personalizate (reguli de rețea, puncte finale private)
- Integra în procesele existente de revizuire IaC
- Controla versiunile modificărilor infrastructurii separat de codul aplicației

### Hook-uri pentru Ciclu de Viață Producție

Hook-urile AZD îți permit să injectezi logică personalizată în fiecare etapă a ciclului de implementare—esențial pentru fluxuri de lucru AI în producție:

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
# Rulează manual un anumit hook în timpul dezvoltării
azd hooks run predeploy
```

**Hook-uri recomandate pentru sarcini AI în producție:**

| Hook | Caz de utilizare |
|------|------------------|
| `preprovision` | Validarea cotelor abonamentului pentru capacitatea modelului AI |
| `postprovision` | Configurarea punctelor finale private, implementarea greutăților modelului |
| `predeploy` | Rulare teste de siguranță AI, validarea șabloanelor de prompt |
| `postdeploy` | Teste rapide ale răspunsurilor agentului, verificarea conectivității modelului |

### Configurarea Pipeline-ului CI/CD

Folosește `azd pipeline config` pentru a conecta proiectul la GitHub Actions sau Azure Pipelines cu autentificare Azure securizată:

```bash
# Configurează fluxul CI/CD (interactiv)
azd pipeline config

# Configurează cu un furnizor specific
azd pipeline config --provider github
```

Această comandă:
- Creează un principal de serviciu cu acces cu privilegii minime
- Configurează acreditări federate (fără secrete stocate)
- Generează sau actualizează fișierul de definiție pipeline
- Setează variabilele de mediu necesare în sistemul tău CI/CD

**Flux de lucru de producție cu configurarea pipeline:**

```bash
# 1. Configurează mediul de producție
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Configurează pipeline-ul
azd pipeline config --provider github

# 3. Pipeline-ul execută azd deploy la fiecare push către main
```

### Adăugarea de Componente cu `azd add`

Adaugă incremental servicii Azure unui proiect existent:

```bash
# Adaugă un nou component de serviciu interactiv
azd add
```

Aceasta este deosebit de util pentru extinderea aplicațiilor AI în producție—de exemplu, adăugarea unui serviciu de căutare vectorială, un nou endpoint agent sau un component de monitorizare într-o implementare existentă.

## Resurse Suplimentare
- **Cadrul Azure Well-Architected**: [Ghid pentru sarcini AI](https://learn.microsoft.com/azure/well-architected/ai/)
- **Documentația Microsoft Foundry**: [Documentație oficială](https://learn.microsoft.com/azure/ai-studio/)
- **Șabloane comunitare**: [Azure Samples](https://github.com/Azure-Samples)
- **Comunitatea Discord**: [canal #Azure](https://discord.gg/microsoft-azure)
- **Competențe Agent pentru Azure**: [microsoft/github-copilot-for-azure pe skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 de competențe deschise pentru agent pentru Azure AI, Foundry, implementare, optimizarea costurilor și diagnosticare. Instalați în editorul dvs.:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigare capitol:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 8 - Modele pentru Producție & Întreprinderi
- **⬅️ Capitolul anterior**: [Capitolul 7: Depanare](../chapter-07-troubleshooting/debugging.md)
- **⬅️ De asemenea relevant**: [Laborator AI Workshop](ai-workshop-lab.md)
- **� Curs finalizat**: [AZD Pentru Începători](../../README.md)

**Rețineți**: Sarcinile AI pentru producție necesită planificare atentă, monitorizare și optimizare continuă. Începeți cu aceste modele și adaptați-le la cerințele dvs. specifice.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă o traducere profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->