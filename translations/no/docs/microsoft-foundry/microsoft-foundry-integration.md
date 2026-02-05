# Microsoft Foundry-integrasjon med AZD

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige Kapittel**: [Kapittel 1: Ditt Første Prosjekt](../getting-started/first-project.md)
- **➡️ Neste**: [AI-modellutplassering](ai-model-deployment.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

## Oversikt

Denne veiledningen viser hvordan du kan integrere Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for en mer effektiv utplassering av AI-applikasjoner. Microsoft Foundry tilbyr en omfattende plattform for å bygge, utplassere og administrere AI-applikasjoner, mens AZD forenkler infrastrukturen og utplasseringsprosessen.

## Hva er Microsoft Foundry?

Microsoft Foundry er Microsofts enhetlige plattform for AI-utvikling som inkluderer:

- **Modellkatalog**: Tilgang til avanserte AI-modeller
- **Prompt Flow**: Visuell designer for AI-arbeidsflyter
- **AI Foundry Portal**: Integrert utviklingsmiljø for AI-applikasjoner
- **Utplasseringsalternativer**: Flere hosting- og skaleringsalternativer
- **Sikkerhet og Ansvarlighet**: Innebygde funksjoner for ansvarlig AI

## AZD + Microsoft Foundry: Bedre Sammen

| Funksjon | Microsoft Foundry | Fordel med AZD-integrasjon |
|----------|-------------------|---------------------------|
| **Modellutplassering** | Manuell utplassering via portal | Automatiserte, repeterbare utplasseringer |
| **Infrastruktur** | Klikkbasert klargjøring | Infrastruktur som kode (Bicep) |
| **Miljøadministrasjon** | Fokus på ett miljø | Multi-miljø (dev/staging/prod) |
| **CI/CD-integrasjon** | Begrenset | Innebygd støtte for GitHub Actions |
| **Kostnadsadministrasjon** | Grunnleggende overvåking | Miljøspesifikk kostnadsoptimalisering |

## Forutsetninger

- Azure-abonnement med riktige tillatelser
- Azure Developer CLI installert
- Tilgang til Azure OpenAI-tjenester
- Grunnleggende kjennskap til Microsoft Foundry

## Kjerneintegrasjonsmønstre

### Mønster 1: Azure OpenAI-integrasjon

**Brukstilfelle**: Utplassere chat-applikasjoner med Azure OpenAI-modeller

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

**Infrastruktur (main.bicep):**
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

### Mønster 2: AI-søk + RAG-integrasjon

**Brukstilfelle**: Utplassere applikasjoner med retrieval-augmented generation (RAG)

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

### Mønster 3: Dokumentintelligens-integrasjon

**Brukstilfelle**: Arbeidsflyter for dokumentbehandling og analyse

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

## 🔧 Konfigurasjonsmønstre

### Oppsett av Miljøvariabler

**Produksjonskonfigurasjon:**
```bash
# Kjerne AI-tjenester
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurasjoner
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Ytelsesinnstillinger
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Utviklingskonfigurasjon:**
```bash
# Kostnadsoptimaliserte innstillinger for utvikling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratisnivå
```

### Sikker Konfigurasjon med Key Vault

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

## Utplasseringsarbeidsflyter

### Utplassering med Én Kommando

```bash
# Distribuer alt med én kommando
azd up

# Eller distribuer gradvis
azd provision  # Kun infrastruktur
azd deploy     # Kun applikasjon
```

### Miljøspesifikke Utplasseringer

```bash
# Utviklingsmiljø
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produksjonsmiljø
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Overvåking og Observabilitet

### Integrasjon med Application Insights

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

### Kostnadsovervåking

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

## 🔐 Sikkerhetspraksis

### Konfigurasjon av Administrert Identitet

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

### Nettverkssikkerhet

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

## Ytelsesoptimalisering

### Cache-strategier

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

### Konfigurasjon for Autoskalering

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

## Feilsøking av Vanlige Problemer

### Problem 1: OpenAI-kvote overskredet

**Symptomer:**
- Utplassering mislykkes med kvotefeil
- 429-feil i applikasjonslogger

**Løsninger:**
```bash
# Sjekk nåværende kvotebruk
az cognitiveservices usage list --location eastus

# Prøv en annen region
azd env set AZURE_LOCATION westus2
azd up

# Reduser kapasiteten midlertidig
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Autentiseringsfeil

**Symptomer:**
- 401/403-feil ved kall til AI-tjenester
- "Access denied"-meldinger

**Løsninger:**
```bash
# Verifiser rolleoppgaver
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Sjekk administrert identitetskonfigurasjon
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valider tilgang til Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemer med Modellutplassering

**Symptomer:**
- Modeller ikke tilgjengelige i utplasseringen
- Spesifikke modellversjoner mislykkes

**Løsninger:**
```bash
# Liste tilgjengelige modeller etter region
az cognitiveservices model list --location eastus

# Oppdater modellversjon i bicep-mal
# Sjekk krav til modellkapasitet
```

## Eksempelmaler

### Grunnleggende Chat-applikasjon

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Cognitive Search + App Service

**Hurtigstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentbehandlingspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Tjenester**: Dokumentintelligens + Lagring + Funksjoner

**Hurtigstart**:
```bash
azd init --template ai-document-processing
azd up
```

### Bedriftschat med RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Søk + Container Apps + Cosmos DB

**Hurtigstart**:
```bash
azd init --template contoso-chat
azd up
```

## Neste Steg

1. **Prøv Eksemplene**: Start med en ferdigmal som passer ditt brukstilfelle
2. **Tilpass til Dine Behov**: Endre infrastrukturen og applikasjonskoden
3. **Legg til Overvåking**: Implementer omfattende observabilitet
4. **Optimaliser Kostnader**: Finjuster konfigurasjoner for ditt budsjett
5. **Sikre Utplasseringen**: Implementer sikkerhetsmønstre for bedrifter
6. **Skaler til Produksjon**: Legg til multi-region og høy tilgjengelighet

## 🎯 Praktiske Øvelser

### Øvelse 1: Utplassere Azure OpenAI Chat-applikasjon (30 minutter)
**Mål**: Utplassere og teste en produksjonsklar AI-chat-applikasjon

```bash
# Initialiser mal
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Sett miljøvariabler
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Distribuer
azd up

# Test applikasjonen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Overvåk AI-operasjoner
azd monitor

# Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Utplassering fullføres uten kvotefeil
- [ ] Kan få tilgang til chat-grensesnittet i nettleseren
- [ ] Kan stille spørsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressurser ryddet opp etter testing

**Estimert Kostnad**: $5-10 for 30 minutters testing

### Øvelse 2: Konfigurere Multi-Modell Utplassering (45 minutter)
**Mål**: Utplassere flere AI-modeller med ulike konfigurasjoner

```bash
# Opprett tilpasset Bicep-konfigurasjon
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

# Distribuer og verifiser
azd provision
azd show
```

**Suksesskriterier:**
- [ ] Flere modeller utplassert vellykket
- [ ] Ulike kapasitetsinnstillinger brukt
- [ ] Modeller tilgjengelige via API
- [ ] Kan kalle begge modellene fra applikasjonen

### Øvelse 3: Implementere Kostnadsovervåking (20 minutter)
**Mål**: Sette opp budsjettvarsler og kostnadssporing

```bash
# Legg til budsjettvarsel i Bicep
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

# Distribuer budsjettvarsel
azd provision

# Sjekk nåværende kostnader
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Suksesskriterier:**
- [ ] Budsjettvarsel opprettet i Azure
- [ ] E-postvarsler konfigurert
- [ ] Kan se kostnadsdata i Azure Portal
- [ ] Budsjettgrenser satt riktig

## 💡 Ofte Stilte Spørsmål

<details>
<summary><strong>Hvordan kan jeg redusere Azure OpenAI-kostnader under utvikling?</strong></summary>

1. **Bruk Gratisnivå**: Azure OpenAI tilbyr 50,000 tokens/måned gratis
2. **Reduser Kapasitet**: Sett kapasitet til 10 TPM i stedet for 30+ for utvikling
3. **Bruk azd down**: Dealloker ressurser når du ikke aktivt utvikler
4. **Cache Svar**: Implementer Redis-cache for gjentatte forespørsler
5. **Bruk Prompt Engineering**: Reduser tokenbruk med effektive prompts

```bash
# Utviklingskonfigurasjon
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Hva er forskjellen mellom Azure OpenAI og OpenAI API?</strong></summary>

**Azure OpenAI**:
- Sikkerhet og samsvar for bedrifter
- Privat nettverksintegrasjon
- SLA-garantier
- Autentisering med administrert identitet
- Høyere kvoter tilgjengelig

**OpenAI API**:
- Raskere tilgang til nye modeller
- Enklere oppsett
- Lavere terskel for oppstart
- Kun offentlig internett

For produksjonsapplikasjoner anbefales **Azure OpenAI**.
</details>

<details>
<summary><strong>Hvordan håndterer jeg Azure OpenAI-kvote overskredet-feil?</strong></summary>

```bash
# Sjekk nåværende kvote
az cognitiveservices usage list --location eastus2

# Prøv en annen region
azd env set AZURE_LOCATION westus2
azd up

# Reduser kapasiteten midlertidig
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Be om kvoteøkning
# Gå til Azure Portal > Kvoter > Be om økning
```
</details>

<details>
<summary><strong>Kan jeg bruke mine egne data med Azure OpenAI?</strong></summary>

Ja! Bruk **Azure AI Search** for RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Se malen [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Hvordan sikrer jeg AI-modellendepunkter?</strong></summary>

**Beste Praksis**:
1. Bruk Administrert Identitet (ingen API-nøkler)
2. Aktiver Private Endepunkter
3. Konfigurer nettverkssikkerhetsgrupper
4. Implementer hastighetsbegrensning
5. Bruk Azure Key Vault for hemmeligheter

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

## Fellesskap og Støtte

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemer og diskusjoner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Offisiell dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige Kapittel**: [Kapittel 1: Ditt Første Prosjekt](../getting-started/first-project.md)
- **➡️ Neste**: [AI-modellutplassering](ai-model-deployment.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

**Trenger Hjelp?** Bli med i fellesskapsdiskusjoner eller åpne en sak i repository. Azure AI + AZD-fellesskapet er her for å hjelpe deg med å lykkes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->