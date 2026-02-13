# Microsoft Foundry-integrasjon med AZD

**Chapter Navigation:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Gjeldende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige kapittel**: [Kapittel 1: Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [Distribusjon av AI-modell](ai-model-deployment.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Oversikt

Denne veiledningen demonstrerer hvordan du integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for strømlinjeformede AI-applikasjonsdistribusjoner. Microsoft Foundry tilbyr en omfattende plattform for å bygge, distribuere og administrere AI-applikasjoner, mens AZD forenkler infrastruktur- og distribusjonsprosessen.

## Hva er Microsoft Foundry?

Microsoft Foundry er Microsofts samlede plattform for AI-utvikling som inkluderer:

- **Modellkatalog**: Tilgang til toppmoderne AI-modeller
- **Prompt Flow**: Visuell designer for AI-arbeidsflyter
- **AI Foundry Portal**: Integrert utviklingsmiljø for AI-applikasjoner
- **Distribusjonsalternativer**: Flere hosting- og skaleringsalternativer
- **Sikkerhet og samsvar**: Innebygde ansvarlige AI-funksjoner

## AZD + Microsoft Foundry: Bedre sammen

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Forutsetninger

- Azure-abonnement med passende tillatelser
- Azure Developer CLI installert
- Tilgang til Azure OpenAI-tjenester
- Grunnleggende kjennskap til Microsoft Foundry

## Kjerneintegrasjonsmønstre

### Mønster 1: Azure OpenAI-integrasjon

**Brukstilfelle**: Distribuer chatapplikasjoner med Azure OpenAI-modeller

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

### Mønster 2: AI Search + RAG-integrasjon

**Brukstilfelle**: Distribuer retrieval-augmented generation (RAG)-applikasjoner

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

### Mønster 3: Document Intelligence-integrasjon

**Brukstilfelle**: Dokumentbehandlings- og analysearbeidsflyter

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

### Oppsett av miljøvariabler

**Produksjonskonfigurasjon:**
```bash
# Kjerne-AI-tjenester
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

### Sikker konfigurasjon med Key Vault

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

## Distribusjonsarbeidsflyter

### Distribusjon med enkeltkommando

```bash
# Distribuer alt med en kommando
azd up

# Eller distribuer trinnvis
azd provision  # Kun infrastruktur
azd deploy     # Kun applikasjon
```

### Miljøspesifikke distribusjoner

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

## Overvåking og observerbarhet

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

### Kostnadsmonitorering

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

## 🔐 Beste sikkerhetspraksis

### Konfigurasjon av Managed Identity

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

### Caching-strategier

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

### Konfigurasjon for autoskalering

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

## Feilsøking av vanlige problemer

### Problem 1: OpenAI-kvote overskredet

**Symptomer:**
- Distribusjonen feiler med kvotefeil
- 429-feil i applikasjonsloggene

**Løsninger:**
```bash
# Sjekk gjeldende kvotebruk
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
# Verifiser rolletilordninger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontroller konfigurasjon for administrert identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valider tilgang til Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemer med modell-distribusjon

**Symptomer:**
- Modeller tilgjengelige ikke i distribusjonen
- Spesifikke modellversjoner feiler

**Løsninger:**
```bash
# List tilgjengelige modeller per region
az cognitiveservices model list --location eastus

# Oppdater modellversjon i Bicep-mal
# Sjekk modellens kapasitetskrav
```

## Eksempelmaler

### Grunnleggende chatapplikasjon

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Cognitive Search + App Service

**Rask start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentbehandlingspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Tjenester**: Document Intelligence + Storage + Functions

**Rask start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise-chat med RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Rask start**:
```bash
azd init --template contoso-chat
azd up
```

## Neste steg

1. **Prøv eksemplene**: Start med en forhåndsbygget mal som matcher ditt brukstilfelle
2. **Tilpass etter behov**: Endre infrastrukturen og applikasjonskoden
3. **Legg til overvåking**: Implementer omfattende observerbarhet
4. **Optimaliser kostnader**: Finjuster konfigurasjoner for budsjettet ditt
5. **Sikre distribusjonen**: Implementer bedriftsmessige sikkerhetsmønstre
6. **Skaler til produksjon**: Legg til flerregion og høy tilgjengelighet

## 🎯 Praktiske øvelser

### Øvelse 1: Distribuer Azure OpenAI chat-app (30 minutter)
**Mål**: Distribuere og teste en produksjonsklar AI-chatapplikasjon

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
- [ ] Distribusjonen fullføres uten kvotafeil
- [ ] Tilgang til chattegrensesnittet i nettleseren
- [ ] Kan stille spørsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressursene er ryddet opp

**Estimert kostnad**: $5-10 for 30 minutters testing

### Øvelse 2: Konfigurer distribusjon med flere modeller (45 minutter)
**Mål**: Distribuere flere AI-modeller med forskjellige konfigurasjoner

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
- [ ] Flere modeller distribuert vellykket
- [ ] Ulike kapasitetinnstillinger anvendt
- [ ] Modeller tilgjengelige via API
- [ ] Kan kalle begge modellene fra applikasjonen

### Øvelse 3: Implementer kostnadsovervåking (20 minutter)
**Mål**: Sett opp budsjettvarsler og kostnadssporing

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
- [ ] Kan vise kostnadsdata i Azure Portal
- [ ] Budsjettterskler satt passende

## 💡 Ofte stilte spørsmål

<details>
<summary><strong>Hvordan kan jeg redusere Azure OpenAI-kostnader under utvikling?</strong></summary>

1. **Bruk gratisnivået**: Azure OpenAI tilbyr 50 000 tokens/måned gratis
2. **Reduser kapasitet**: Sett kapasiteten til 10 TPM i stedet for 30+ for utvikling
3. **Bruk azd down**: Dealloker ressurser når du ikke aktivt utvikler
4. **Cache svar**: Implementer Redis-cache for gjentatte spørringer
5. **Bruk prompt engineering**: Reduser tokenbruk med effektive prompts

```bash
# Konfigurasjon for utvikling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Hva er forskjellen mellom Azure OpenAI og OpenAI API?</strong></summary>

**Azure OpenAI**:
- Foretaksikkerhet og samsvar
- Integrasjon med private nettverk
- SLA-garantier
- Autentisering med Managed Identity
- Høyere kvoter tilgjengelig

**OpenAI API**:
- Raskere tilgang til nye modeller
- Enklere oppsett
- Lavere inngangsterskel
- Kun offentlig internett

For produksjonsapplikasjoner anbefales **Azure OpenAI**.
</details>

<details>
<summary><strong>Hvordan håndterer jeg feilmeldinger om overskredet Azure OpenAI-kvote?</strong></summary>

```bash
# Sjekk gjeldende kvote
az cognitiveservices usage list --location eastus2

# Prøv en annen region
azd env set AZURE_LOCATION westus2
azd up

# Reduser kapasiteten midlertidig
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Be om økning av kvoten
# Gå til Azure-portalen > Kvoter > Be om økning
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
<summary><strong>Hvordan sikrer jeg endepunkter for AI-modeller?</strong></summary>

**Beste praksis**:
1. Bruk Managed Identity (ingen API-nøkler)
2. Aktiver Private Endpoints
3. Konfigurer nettverkssikkerhetsgrupper
4. Implementer rate limiting
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

## Fellesskap og støtte

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Offisiell dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Gjeldende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige kapittel**: [Kapittel 1: Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [Distribusjon av AI-modell](ai-model-deployment.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i fellesskapsdiskusjonene eller åpne en issue i repoet. Azure AI + AZD-fellesskapet er her for å hjelpe deg å lykkes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved bruk av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell, menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som måtte oppstå ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->