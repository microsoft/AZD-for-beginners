# Microsoft Foundry Integration with AZD

**Navigácia kapitoly:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Prehľad

Tento návod demonštruje, ako integrovať služby Microsoft Foundry s Azure Developer CLI (AZD) pre zjednodušené nasadzovanie AI aplikácií. Microsoft Foundry poskytuje komplexnú platformu na tvorbu, nasadzovanie a správu AI aplikácií, zatiaľ čo AZD zjednodušuje infraštruktúru a proces nasadzovania.

## Čo je Microsoft Foundry?

Microsoft Foundry je jednotná platforma Microsoftu pre vývoj AI, ktorá zahŕňa:

- **Model Catalog**: Prístup k najmodernejším AI modelom
- **Prompt Flow**: Vizualny návrhár pre AI workflowy
- **AI Foundry Portal**: Integrované vývojové prostredie pre AI aplikácie
- **Deployment Options**: Viaceré možnosti hostingu a škálovania
- **Safety and Security**: Vstavané funkcie zodpovednej AI

## AZD + Microsoft Foundry: Lepšie spoločne

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Požiadavky

- Predplatné Azure s vhodnými povoleniami
- Nainštalovaný Azure Developer CLI
- Prístup k Azure OpenAI službám
- Základná oboznámenosť s Microsoft Foundry

## Hlavné integračné vzory

### Vzor 1: Integrácia Azure OpenAI

**Použitie**: Nasadzovanie chatovacích aplikácií s modelmi Azure OpenAI

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

**Infraštruktúra (main.bicep):**
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

### Vzor 2: AI Search + RAG integrácia

**Použitie**: Nasadzovanie aplikácií založených na retrieval-augmented generation (RAG)

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

### Vzor 3: Integrácia Document Intelligence

**Použitie**: Workflowy na spracovanie a analýzu dokumentov

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

## 🔧 Vzory konfigurácie

### Nastavenie premenných prostredia

**Produkčná konfigurácia:**
```bash
# Základné AI služby
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurácie modelov
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Nastavenia výkonu
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Vývojová konfigurácia:**
```bash
# Nákladovo optimalizované nastavenia pre vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Bezplatný plán
```

### Bezpečná konfigurácia s Key Vault

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

## Nasadzovacie pracovné postupy

### Nasadenie jedným príkazom

```bash
# Nasadiť všetko jedným príkazom
azd up

# Alebo nasadiť postupne
azd provision  # Iba infraštruktúra
azd deploy     # Iba aplikácia
```

### Nasadenia špecifické pre prostredie

```bash
# Vývojové prostredie
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkčné prostredie
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorovanie a pozorovateľnosť

### Integrácia Application Insights

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

### Monitorovanie nákladov

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

## 🔐 Najlepšie bezpečnostné postupy

### Konfigurácia Managed Identity

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

### Sieťová bezpečnosť

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

## Optimalizácia výkonu

### Stratégie cachovania

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

### Konfigurácia automatického škálovania

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

## Riešenie bežných problémov

### Problém 1: Prekročenie kvóty OpenAI

**Príznaky:**
- Nasadenie zlyhá s chybami kvóty
- 429 chyby v logoch aplikácie

**Riešenia:**
```bash
# Skontrolovať aktuálne využitie kvóty
az cognitiveservices usage list --location eastus

# Vyskúšať iný región
azd env set AZURE_LOCATION westus2
azd up

# Dočasne znížiť kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problém 2: Autentifikačné zlyhania

**Príznaky:**
- 401/403 chyby pri volaní AI služieb
- Správy „Access denied“

**Riešenia:**
```bash
# Overiť priradenia rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Skontrolovať konfiguráciu spravovanej identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Overiť prístup ku Key Vaultu
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasadením modelu

**Príznaky:**
- Modely nie sú dostupné v nasadení
- Konkrétne verzie modelov zlyhávajú

**Riešenia:**
```bash
# Zobraziť dostupné modely podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizovať verziu modelu v bicep šablóne
# Skontrolovať požiadavky na kapacitu modelu
```

## Príkladové šablóny

### Základná chatovacia aplikácia

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Cognitive Search + App Service

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline na spracovanie dokumentov

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Služby**: Document Intelligence + Storage + Functions

**Rýchly štart**:
```bash
azd init --template ai-document-processing
azd up
```

### Podnikový chat s RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Rýchly štart**:
```bash
azd init --template contoso-chat
azd up
```

## Ďalšie kroky

1. **Vyskúšajte príklady**: Začnite s predpripravenou šablónou, ktorá zodpovedá vášmu prípadu použitia
2. **Prispôsobte podľa potrieb**: Upravte infraštruktúru a aplikačný kód
3. **Pridajte monitorovanie**: Implementujte komplexnú pozorovateľnosť
4. **Optimalizujte náklady**: Dolaďte konfigurácie podľa vášho rozpočtu
5. **Zaistite svoje nasadenie**: Implementujte podnikové bezpečnostné vzory
6. **Škálujte do produkcie**: Pridajte multi-regionálne a vysokodostupnostné prvky

## 🎯 Praktické cvičenia

### Cvičenie 1: Nasadiť Azure OpenAI Chat App (30 minút)
**Cieľ**: Nasadiť a otestovať produkčne pripravenú AI chatovaciu aplikáciu

```bash
# Inicializovať šablónu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastaviť premenné prostredia
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Nasadiť
azd up

# Otestovať aplikáciu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorovať operácie umelej inteligencie
azd monitor

# Vyčistiť
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Nasadenie sa dokončí bez chýb kvóty
- [ ] Prístup k chatovaciemu rozhraniu v prehliadači
- [ ] Možnosť klásť otázky a získať odpovede poháňané AI
- [ ] Application Insights zobrazuje telemetrické dáta
- [ ] Úspešne vyčistené zdroje

**Odhadované náklady**: $5-10 za 30 minút testovania

### Cvičenie 2: Konfigurácia nasadenia viacerých modelov (45 minút)
**Cieľ**: Nasadiť viacero AI modelov s rôznymi konfiguráciami

```bash
# Vytvorte vlastnú Bicep konfiguráciu
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

# Nasadiť a overiť
azd provision
azd show
```

**Kritériá úspechu:**
- [ ] Viaceré modely nasadené úspešne
- [ ] Aplikované rôzne nastavenia kapacity
- [ ] Modely dostupné cez API
- [ ] Možnosť volať oba modely z aplikácie

### Cvičenie 3: Implementovať monitorovanie nákladov (20 minút)
**Cieľ**: Nastaviť upozornenia rozpočtu a sledovanie nákladov

```bash
# Pridať upozornenie na rozpočet do Bicepu
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

# Nasadiť upozornenie na rozpočet
azd provision

# Skontrolovať aktuálne náklady
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kritériá úspechu:**
- [ ] V Azure vytvorené upozornenie rozpočtu
- [ ] Konfigurované e-mailové notifikácie
- [ ] Možnosť zobraziť dáta o nákladoch v Azure Portal
- [ ] Práh rozpočtu nastavený primerane

## 💡 Často kladené otázky

<details>
<summary><strong>Ako znížim náklady Azure OpenAI počas vývoja?</strong></summary>

1. **Use Free Tier**: Azure OpenAI ponúka 50,000 tokenov/mesiac zadarmo
2. **Reduce Capacity**: Nastavte kapacitu na 10 TPM namiesto 30+ pre vývoj
3. **Use azd down**: Deaktivujte zdroje, keď aktívne nevyvíjate
4. **Cache Responses**: Implementujte Redis cache pre opakované dopyty
5. **Use Prompt Engineering**: Znižujte spotrebu tokenov efektívnymi promptami

```bash
# Konfigurácia pre vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Aký je rozdiel medzi Azure OpenAI a OpenAI API?</strong></summary>

**Azure OpenAI**:
- Podniková bezpečnosť a súlad
- Integrácia do súkromnej siete
- SLA záruky
- Overenie pomocou Managed Identity
- Dostupné vyššie kvóty

**OpenAI API**:
- Rýchlejší prístup k novým modelom
- Jednoduchšie nastavenie
- Nižšia bariéra vstupu
- Iba verejný internet

Pre produkčné aplikácie je odporúčané použiť **Azure OpenAI**.
</details>

<details>
<summary><strong>Ako riešiť chyby prekročenia kvóty Azure OpenAI?</strong></summary>

```bash
# Skontrolujte aktuálnu kvótu
az cognitiveservices usage list --location eastus2

# Vyskúšajte iný región
azd env set AZURE_LOCATION westus2
azd up

# Dočasne znížte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Požiadajte o zvýšenie kvóty
# Prejdite do Azure portálu > Kvóty > Požiadajte o zvýšenie
```
</details>

<details>
<summary><strong>Môžem použiť vlastné dáta s Azure OpenAI?</strong></summary>

Áno! Použite **Azure AI Search** pre RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>Ako zabezpečím endpointy AI modelov?</strong></summary>

**Najlepšie praktiky**:
1. Použite Managed Identity (bez API kľúčov)
2. Povoliť Private Endpoints
3. Konfigurovať network security groups
4. Implementovať rate limiting
5. Použiť Azure Key Vault pre tajomstvá

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

## Komunita a podpora

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigácia kapitoly:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pripojte sa k našim komunitným diskusiám alebo otvorte issue v repozitári. Komunita Azure AI + AZD je tu, aby vám pomohla uspieť!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladovej služby Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku treba považovať za rozhodujúci zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo mylné výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->