# Integrácia Microsoft Foundry s AZD

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-First vývoj
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../getting-started/first-project.md)
- **➡️ Ďalej**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../getting-started/configuration.md)

## Prehľad

Táto príručka ukazuje, ako integrovať služby Microsoft Foundry s Azure Developer CLI (AZD) pre efektívne nasadenie AI aplikácií. Microsoft Foundry poskytuje komplexnú platformu na vytváranie, nasadzovanie a správu AI aplikácií, zatiaľ čo AZD zjednodušuje proces infraštruktúry a nasadenia.

## Čo je Microsoft Foundry?

Microsoft Foundry je jednotná platforma od Microsoftu pre vývoj AI, ktorá zahŕňa:

- **Katalóg modelov**: Prístup k najmodernejším AI modelom
- **Prompt Flow**: Vizualizér pre AI pracovné postupy
- **AI Foundry Portal**: Integrované vývojové prostredie pre AI aplikácie
- **Možnosti nasadenia**: Viacero možností hostingu a škálovania
- **Bezpečnosť a ochrana**: Zabudované funkcie zodpovednej AI

## AZD + Microsoft Foundry: Lepšie spolu

| Funkcia | Microsoft Foundry | Výhoda integrácie s AZD |
|---------|-----------------|------------------------|
| **Nasadenie modelu** | Manuálne nasadenie cez portál | Automatizované, opakovateľné nasadenia |
| **Infraštruktúra** | Klikacie zriadenie | Infraštruktúra ako kód (Bicep) |
| **Správa prostredí** | Zameranie na jedno prostredie | Viacero prostredí (dev/staging/prod) |
| **Integrácia CI/CD** | Obmedzená | Natívna podpora GitHub Actions |
| **Správa nákladov** | Základné monitorovanie | Optimalizácia nákladov podľa prostredia |

## Predpoklady

- Azure predplatné s príslušnými oprávneniami
- Nainštalovaný Azure Developer CLI
- Prístup k službám Azure OpenAI
- Základné znalosti Microsoft Foundry

## Základné integračné vzory

### Vzor 1: Integrácia Azure OpenAI

**Použitie**: Nasadenie chatovacích aplikácií s modelmi Azure OpenAI

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

### Vzor 2: AI vyhľadávanie + RAG integrácia

**Použitie**: Nasadenie aplikácií s retrieval-augmented generation (RAG)

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

### Vzor 3: Integrácia inteligencie dokumentov

**Použitie**: Pracovné postupy na spracovanie a analýzu dokumentov

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

## 🔧 Konfiguračné vzory

### Nastavenie premenných prostredia

**Konfigurácia pre produkciu:**
```bash
# Základné AI služby
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurácie modelu
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Nastavenia výkonu
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurácia pre vývoj:**
```bash
# Nákladovo optimalizované nastavenia pre vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Bezplatná úroveň
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

## Pracovné postupy nasadenia

### Nasadenie jedným príkazom

```bash
# Nasadiť všetko jedným príkazom
azd up

# Alebo nasadzovať postupne
azd provision  # Iba infraštruktúru
azd deploy     # Iba aplikáciu
```

### Nasadenia podľa prostredia

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

### Konfigurácia spravovanej identity

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

### Stratégie ukladania do vyrovnávacej pamäte

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
- Nasadenie zlyhá kvôli chybám kvóty
- 429 chyby v logoch aplikácie

**Riešenia:**
```bash
# Skontrolujte aktuálne využitie kvóty
az cognitiveservices usage list --location eastus

# Skúste inú oblasť
azd env set AZURE_LOCATION westus2
azd up

# Dočasne znížte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problém 2: Zlyhanie autentifikácie

**Príznaky:**
- 401/403 chyby pri volaní AI služieb
- Hlásenia "Prístup zamietnutý"

**Riešenia:**
```bash
# Overte priradenie rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Skontrolujte konfiguráciu spravovanej identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Overte prístup k trezoru kľúčov
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasadením modelu

**Príznaky:**
- Modely nie sú dostupné v nasadení
- Zlyhanie konkrétnych verzií modelov

**Riešenia:**
```bash
# Zoznam dostupných modelov podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizovať verziu modelu v bicep šablóne
# Skontrolovať požiadavky na kapacitu modelu
```

## Príkladové šablóny

### Základná chatovacia aplikácia

**Repozitár**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Cognitive Search + App Service

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline na spracovanie dokumentov

**Repozitár**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Služby**: Document Intelligence + Storage + Functions

**Rýchly štart**:
```bash
azd init --template ai-document-processing
azd up
```

### Podnikový chat s RAG

**Repozitár**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Rýchly štart**:
```bash
azd init --template contoso-chat
azd up
```

## Ďalšie kroky

1. **Vyskúšajte príklady**: Začnite s predpripravenou šablónou, ktorá zodpovedá vášmu prípadu použitia
2. **Prispôsobte si podľa potreby**: Upraviť infraštruktúru a kód aplikácie
3. **Pridajte monitorovanie**: Implementujte komplexnú pozorovateľnosť
4. **Optimalizujte náklady**: Doladte konfigurácie podľa vášho rozpočtu
5. **Zabezpečte svoje nasadenie**: Implementujte bezpečnostné vzory pre podniky
6. **Škálujte na produkciu**: Pridajte funkcie pre viac regiónov a vysokú dostupnosť

## 🎯 Praktické cvičenia

### Cvičenie 1: Nasadenie Azure OpenAI chatovacej aplikácie (30 minút)
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

# Monitorovať operácie AI
azd monitor

# Vyčistiť
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Nasadenie prebehne bez chýb kvóty
- [ ] Možnosť prístupu k chatovému rozhraniu v prehliadači
- [ ] Možnosť klásť otázky a dostávať AI odpovede
- [ ] Application Insights zobrazuje telemetrické údaje
- [ ] Úspešne vyčistené zdroje

**Odhadované náklady**: $5-10 za 30 minút testovania

### Cvičenie 2: Konfigurácia nasadenia viacerých modelov (45 minút)
**Cieľ**: Nasadiť viacero AI modelov s rôznymi konfiguráciami

```bash
# Vytvorte vlastnú konfiguráciu Bicep
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
- [ ] Viacero modelov úspešne nasadených
- [ ] Aplikované rôzne nastavenia kapacity
- [ ] Modely dostupné cez API
- [ ] Možnosť volať oba modely z aplikácie

### Cvičenie 3: Implementácia monitorovania nákladov (20 minút)
**Cieľ**: Nastaviť upozornenia na rozpočet a sledovanie nákladov

```bash
# Pridajte upozornenie na rozpočet do Bicep
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

# Skontrolujte aktuálne náklady
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kritériá úspechu:**
- [ ] Vytvorené upozornenie na rozpočet v Azure
- [ ] Nastavené e-mailové notifikácie
- [ ] Možnosť zobraziť údaje o nákladoch v Azure Portáli
- [ ] Nastavené prahové hodnoty rozpočtu

## 💡 Často kladené otázky

<details>
<summary><strong>Ako znížiť náklady na Azure OpenAI počas vývoja?</strong></summary>

1. **Použite bezplatnú vrstvu**: Azure OpenAI ponúka 50,000 tokenov/mesiac zdarma
2. **Znížte kapacitu**: Nastavte kapacitu na 10 TPM namiesto 30+ pre vývoj
3. **Použite azd down**: Deaktivujte zdroje, keď aktívne nevyvíjate
4. **Ukladajte odpovede do cache**: Implementujte Redis cache pre opakované dotazy
5. **Použite Prompt Engineering**: Znížte spotrebu tokenov efektívnymi promptami

```bash
# Konfigurácia vývoja
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Aký je rozdiel medzi Azure OpenAI a OpenAI API?</strong></summary>

**Azure OpenAI**:
- Podniková bezpečnosť a súlad
- Integrácia súkromnej siete
- Záruky SLA
- Autentifikácia spravovanej identity
- Vyššie dostupné kvóty

**OpenAI API**:
- Rýchlejší prístup k novým modelom
- Jednoduchšie nastavenie
- Nižšia vstupná bariéra
- Iba verejný internet

Pre produkčné aplikácie sa **odporúča Azure OpenAI**.
</details>

<details>
<summary><strong>Ako riešiť chyby prekročenia kvóty Azure OpenAI?</strong></summary>

```bash
# Skontrolujte aktuálnu kvótu
az cognitiveservices usage list --location eastus2

# Skúste inú oblasť
azd env set AZURE_LOCATION westus2
azd up

# Dočasne znížte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Požiadajte o zvýšenie kvóty
# Prejdite na Azure Portal > Kvóty > Požiadať o zvýšenie
```
</details>

<details>
<summary><strong>Môžem použiť vlastné údaje s Azure OpenAI?</strong></summary>

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

Pozrite si šablónu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Ako zabezpečiť koncové body AI modelov?</strong></summary>

**Najlepšie postupy**:
1. Použite spravovanú identitu (bez API kľúčov)
2. Aktivujte súkromné koncové body
3. Konfigurujte skupiny sieťovej bezpečnosti
4. Implementujte obmedzenie rýchlosti
5. Použite Azure Key Vault na tajomstvá

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

- **Microsoft Foundry Discord**: [#Azure kanál](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskusie](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiálna dokumentácia](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-First vývoj
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../getting-started/first-project.md)
- **➡️ Ďalej**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../getting-started/configuration.md)

**Potrebujete pomoc?** Pripojte sa k diskusiám komunity alebo otvorte problém v repozitári. Komunita Azure AI + AZD je tu, aby vám pomohla uspieť!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->