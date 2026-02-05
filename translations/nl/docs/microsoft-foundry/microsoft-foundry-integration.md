# Microsoft Foundry-integratie met AZD

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../getting-started/first-project.md)
- **➡️ Volgende**: [AI Model Implementatie](ai-model-deployment.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../getting-started/configuration.md)

## Overzicht

Deze handleiding laat zien hoe je Microsoft Foundry-diensten kunt integreren met Azure Developer CLI (AZD) voor gestroomlijnde implementaties van AI-toepassingen. Microsoft Foundry biedt een uitgebreid platform voor het bouwen, implementeren en beheren van AI-toepassingen, terwijl AZD het infrastructuur- en implementatieproces vereenvoudigt.

## Wat is Microsoft Foundry?

Microsoft Foundry is het uniforme platform van Microsoft voor AI-ontwikkeling en omvat:

- **Modelcatalogus**: Toegang tot geavanceerde AI-modellen
- **Prompt Flow**: Visuele ontwerper voor AI-workflows
- **AI Foundry Portal**: Geïntegreerde ontwikkelomgeving voor AI-toepassingen
- **Implementatieopties**: Meerdere hosting- en schaalopties
- **Veiligheid en Beveiliging**: Ingebouwde functies voor verantwoorde AI

## AZD + Microsoft Foundry: Samen Sterker

| Functie | Microsoft Foundry | Voordeel van AZD-integratie |
|---------|-------------------|----------------------------|
| **Modelimplementatie** | Handmatige implementatie via portal | Geautomatiseerde, herhaalbare implementaties |
| **Infrastructuur** | Klik-en-klaar provisioning | Infrastructure as Code (Bicep) |
| **Omgevingsbeheer** | Focus op één omgeving | Multi-omgeving (dev/staging/prod) |
| **CI/CD-integratie** | Beperkt | Native GitHub Actions-ondersteuning |
| **Kostenbeheer** | Basisbewaking | Omgevingsspecifieke kostenoptimalisatie |

## Vereisten

- Azure-abonnement met de juiste machtigingen
- Azure Developer CLI geïnstalleerd
- Toegang tot Azure OpenAI-diensten
- Basiskennis van Microsoft Foundry

## Kernintegratiepatronen

### Patroon 1: Azure OpenAI-integratie

**Gebruiksscenario**: Chattoepassingen implementeren met Azure OpenAI-modellen

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Infrastructuur (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Patroon 2: AI Search + RAG-integratie

**Gebruiksscenario**: Implementeren van retrieval-augmented generation (RAG)-toepassingen

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Patroon 3: Document Intelligence-integratie

**Gebruiksscenario**: Documentverwerkings- en analyseworkflows

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Configuratiepatronen

### Instellen van Omgevingsvariabelen

**Productieconfiguratie:**
```bash
# Kern AI-diensten
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelconfiguraties
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Prestatie-instellingen
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Ontwikkelconfiguratie:**
```bash
# Kosten-geoptimaliseerde instellingen voor ontwikkeling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratis niveau
```

### Veilige Configuratie met Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Implementatieworkflows

### Implementatie met één opdracht

```bash
# Alles implementeren met één opdracht
azd up

# Of incrementeel implementeren
azd provision  # Alleen infrastructuur
azd deploy     # Alleen applicatie
```

### Omgevingsspecifieke implementaties

```bash
# Ontwikkelomgeving
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Productieomgeving
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring en Observatie

### Integratie met Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Kostenbewaking

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 Beveiligingsrichtlijnen

### Configuratie van Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Netwerkbeveiliging

```bicep
// Private endpoints for AI services
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

## Prestatieoptimalisatie

### Cachingstrategieën

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### Configuratie van Auto-scaling

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Problemen Oplossen

### Probleem 1: OpenAI Quota Overschreden

**Symptomen:**
- Implementatie mislukt met quotafouten
- 429-fouten in applicatielogs

**Oplossingen:**
```bash
# Controleer het huidige quotagebruik
az cognitiveservices usage list --location eastus

# Probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up

# Verminder de capaciteit tijdelijk
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probleem 2: Authenticatiefouten

**Symptomen:**
- 401/403-fouten bij het aanroepen van AI-diensten
- "Toegang geweigerd"-meldingen

**Oplossingen:**
```bash
# Verifieer roltoewijzingen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Controleer configuratie van beheerde identiteit
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valideer toegang tot Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Problemen met Modelimplementatie

**Symptomen:**
- Modellen niet beschikbaar in implementatie
- Specifieke modelversies falen

**Oplossingen:**
```bash
# Lijst beschikbare modellen per regio
az cognitiveservices model list --location eastus

# Werk modelversie bij in bicep-sjabloon
# Controleer modelcapaciteitsvereisten
```

## Voorbeeldsjablonen

### Basis Chattoepassing

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Diensten**: Azure OpenAI + Cognitive Search + App Service

**Snelstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Documentverwerkingspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Diensten**: Document Intelligence + Storage + Functions

**Snelstart**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat met RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Diensten**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Snelstart**:
```bash
azd init --template contoso-chat
azd up
```

## Volgende Stappen

1. **Probeer de Voorbeelden**: Begin met een vooraf gebouwd sjabloon dat bij jouw gebruiksscenario past
2. **Pas Aan voor Jouw Behoeften**: Wijzig de infrastructuur en applicatiecode
3. **Voeg Monitoring Toe**: Implementeer uitgebreide observatie
4. **Optimaliseer Kosten**: Stem configuraties af op jouw budget
5. **Beveilig Jouw Implementatie**: Implementeer beveiligingspatronen voor bedrijven
6. **Schaal naar Productie**: Voeg multi-regio en hoge beschikbaarheidsfuncties toe

## 🎯 Praktische Oefeningen

### Oefening 1: Implementeer Azure OpenAI Chat App (30 minuten)
**Doel**: Implementeer en test een productieklare AI-chattoepassing

```bash
# Initialiseer sjabloon
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Stel omgevingsvariabelen in
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Implementeren
azd up

# Test de applicatie
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Bewaak AI-operaties
azd monitor

# Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Implementatie voltooid zonder quotafouten
- [ ] Toegang tot chatinterface in browser
- [ ] Vragen stellen en AI-gestuurde antwoorden ontvangen
- [ ] Application Insights toont telemetriegegevens
- [ ] Resources succesvol opgeruimd

**Geschatte Kosten**: $5-10 voor 30 minuten testen

### Oefening 2: Configureer Multi-Model Implementatie (45 minuten)
**Doel**: Meerdere AI-modellen implementeren met verschillende configuraties

```bash
# Maak aangepaste Bicep-configuratie
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Implementeren en verifiëren
azd provision
azd show
```

**Succescriteria:**
- [ ] Meerdere modellen succesvol geïmplementeerd
- [ ] Verschillende capaciteitsinstellingen toegepast
- [ ] Modellen toegankelijk via API
- [ ] Beide modellen kunnen worden aangeroepen vanuit de applicatie

### Oefening 3: Implementeer Kostenbewaking (20 minuten)
**Doel**: Stel budgetwaarschuwingen en kostenbewaking in

```bash
# Voeg budgetwaarschuwing toe aan Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Implementeer budgetwaarschuwing
azd provision

# Controleer huidige kosten
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Succescriteria:**
- [ ] Budgetwaarschuwing aangemaakt in Azure
- [ ] E-mailmeldingen geconfigureerd
- [ ] Kostenoverzicht zichtbaar in Azure Portal
- [ ] Budgetdrempels correct ingesteld

## 💡 Veelgestelde Vragen

<details>
<summary><strong>Hoe verlaag ik Azure OpenAI-kosten tijdens ontwikkeling?</strong></summary>

1. **Gebruik Gratis Tier**: Azure OpenAI biedt 50.000 tokens/maand gratis
2. **Verlaag Capaciteit**: Stel capaciteit in op 10 TPM in plaats van 30+ voor ontwikkeling
3. **Gebruik azd down**: Schakel resources uit wanneer je niet actief ontwikkelt
4. **Cache Antwoorden**: Implementeer Redis-cache voor herhaalde queries
5. **Gebruik Prompt Engineering**: Verminder tokengebruik met efficiënte prompts

```bash
# Ontwikkelingsconfiguratie
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Wat is het verschil tussen Azure OpenAI en OpenAI API?</strong></summary>

**Azure OpenAI**:
- Beveiliging en compliance voor bedrijven
- Integratie met privé-netwerken
- SLA-garanties
- Authenticatie via Managed Identity
- Hogere quota beschikbaar

**OpenAI API**:
- Snellere toegang tot nieuwe modellen
- Eenvoudigere setup
- Lagere instapdrempel
- Alleen openbaar internet

Voor productie-apps wordt **Azure OpenAI aanbevolen**.
</details>

<details>
<summary><strong>Hoe los ik Azure OpenAI quota overschreden fouten op?</strong></summary>

```bash
# Controleer huidige quota
az cognitiveservices usage list --location eastus2

# Probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up

# Verminder capaciteit tijdelijk
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Vraag quota verhoging aan
# Ga naar Azure Portal > Quota's > Verzoek om verhoging
```
</details>

<details>
<summary><strong>Kan ik mijn eigen data gebruiken met Azure OpenAI?</strong></summary>

Ja! Gebruik **Azure AI Search** voor RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Zie het [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sjabloon.
</details>

<details>
<summary><strong>Hoe beveilig ik AI-modelendpoints?</strong></summary>

**Beste Praktijken**:
1. Gebruik Managed Identity (geen API-sleutels)
2. Schakel Private Endpoints in
3. Configureer netwerkbeveiligingsgroepen
4. Implementeer rate limiting
5. Gebruik Azure Key Vault voor geheimen

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Community en Ondersteuning

- **Microsoft Foundry Discord**: [#Azure kanaal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues en discussies](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)

---

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../getting-started/first-project.md)
- **➡️ Volgende**: [AI Model Implementatie](ai-model-deployment.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../getting-started/configuration.md)

**Hulp Nodig?** Doe mee aan onze communitydiscussies of open een issue in de repository. De Azure AI + AZD-community staat klaar om je te helpen slagen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->