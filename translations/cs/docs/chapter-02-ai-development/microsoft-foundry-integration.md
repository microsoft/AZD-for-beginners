# Integrace Microsoft Foundry s AZD

**Navigace kapitolou:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [Nasazení AI modelu](ai-model-deployment.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled

Tento průvodce ukazuje, jak integrovat služby Microsoft Foundry s Azure Developer CLI (AZD) pro zjednodušené nasazování AI aplikací. Microsoft Foundry poskytuje komplexní platformu pro vytváření, nasazování a správu AI aplikací, zatímco AZD zjednodušuje infrastrukturu a proces nasazení.

## Co je Microsoft Foundry?

Microsoft Foundry je sjednocená platforma Microsoftu pro vývoj AI, která zahrnuje:

- **Model Catalog**: Přístup k moderním AI modelům
- **Prompt Flow**: Vizuální návrhář pro AI workflowy
- **AI Foundry Portal**: Integrované vývojové prostředí pro AI aplikace
- **Deployment Options**: Různé možnosti hostování a škálování
- **Safety and Security**: Vestavěné funkce zodpovědného AI

## AZD + Microsoft Foundry: Lepě společně

| Funkce | Microsoft Foundry | Výhoda integrace s AZD |
|---------|-----------------|------------------------|
| **Nasazení modelu** | Ruční nasazení přes portál | Automatizovaná, opakovatelná nasazení |
| **Infrastruktura** | Zřizování přes průvodce (click-through) | Infrastruktura jako kód (Bicep) |
| **Správa prostředí** | Zaměření na jedno prostředí | Více prostředí (dev/staging/prod) |
| **Integrace CI/CD** | Omezená | Nativní podpora GitHub Actions |
| **Správa nákladů** | Základní monitorování | Optimalizace nákladů podle prostředí |

## Požadavky

- Azure předplatné s odpovídajícími oprávněními
- Azure Developer CLI nainstalovaný
- Přístup ke službám Azure OpenAI
- Základní seznámení s Microsoft Foundry

## Základní integrační vzory

### Vzor 1: Integrace Azure OpenAI

**Případ použití**: Nasazení chatovacích aplikací s modely Azure OpenAI

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

**Infrastruktura (main.bicep):**
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

### Vzor 2: Integrace AI Search + RAG

**Případ použití**: Nasazení aplikací založených na retrieval-augmented generation (RAG)

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

### Vzor 3: Integrace Document Intelligence

**Případ použití**: Zpracování dokumentů a analytické pracovní postupy

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

## 🔧 Konfigurační vzory

### Nastavení proměnných prostředí

**Konfigurace pro produkci:**
```bash
# Jádrové služby AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurace modelů
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Nastavení výkonu
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurace pro vývoj:**
```bash
# Nákladově optimalizovaná nastavení pro vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Bezplatná úroveň
```

### Bezpečná konfigurace pomocí Key Vault

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

## Pracovní postupy nasazení

### Nasazení jedním příkazem

```bash
# Nasadit vše jedním příkazem
azd up

# Nebo nasadit postupně
azd provision  # Pouze infrastruktura
azd deploy     # Pouze aplikace
```

### Nasazení specifické pro prostředí

```bash
# Vývojové prostředí
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkční prostředí
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorování a pozorovatelnost

### Integrace s Application Insights

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

### Monitorování nákladů

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

## 🔐 Nejlepší postupy zabezpečení

### Konfigurace spravované identity

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

### Síťové zabezpečení

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

## Optimalizace výkonu

### Strategie cachování

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

### Konfigurace automatického škálování

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

## Odstraňování běžných problémů

### Problém 1: Překročení kvóty OpenAI

**Příznaky:**
- Nasazení selže s chybami kvóty
- Chyby 429 v protokolech aplikace

**Řešení:**
```bash
# Zkontrolujte aktuální využití kvóty
az cognitiveservices usage list --location eastus

# Zkuste jiný region
azd env set AZURE_LOCATION westus2
azd up

# Dočasně snižte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problém 2: Autentizační selhání

**Příznaky:**
- Chyby 401/403 při volání AI služeb
- "Přístup odepřen" zprávy

**Řešení:**
```bash
# Ověřte přiřazení rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Zkontrolujte konfiguraci spravované identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Ověřte přístup ke Key Vaultu
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasazením modelu

**Příznaky:**
- Modely nejsou k dispozici v nasazení
- Konkrétní verze modelů selhávají

**Řešení:**
```bash
# Vypsat dostupné modely podle regionu
az cognitiveservices model list --location eastus

# Aktualizovat verzi modelu v bicep šabloně
# Zkontrolovat požadavky na kapacitu modelu
```

## Ukázkové šablony

### Základní chatovací aplikace

**Repozitář**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Cognitive Search + App Service

**Rychlé spuštění**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline zpracování dokumentů

**Repozitář**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Služby**: Document Intelligence + Storage + Functions

**Rychlé spuštění**:
```bash
azd init --template ai-document-processing
azd up
```

### Podnikový chat s RAG

**Repozitář**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Rychlé spuštění**:
```bash
azd init --template contoso-chat
azd up
```

## Další kroky

1. **Vyzkoušejte příklady**: Začněte s předpřipravenou šablonou, která odpovídá vašemu scénáři použití
2. **Přizpůsobte podle potřeb**: Upravte infrastrukturu a aplikační kód
3. **Přidejte monitorování**: Implementujte komplexní pozorovatelnost
4. **Optimalizujte náklady**: Doladěte konfigurace podle svého rozpočtu
5. **Zabezpečte nasazení**: Implementujte podnikové bezpečnostní vzory
6. **Škálování do produkce**: Přidejte funkce víceregionálního nasazení a vysoké dostupnosti

## 🎯 Praktická cvičení

### Cvičení 1: Nasazení chatovací aplikace Azure OpenAI (30 minut)
**Cíl**: Nasadit a otestovat produkčně připravenou AI chatovací aplikaci

```bash
# Inicializovat šablonu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastavit proměnné prostředí
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Nasadit
azd up

# Otestovat aplikaci
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorovat operace AI
azd monitor

# Vyčistit
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Nasazení proběhne bez chyb kvóty
- [ ] Přístup k rozhraní chatu v prohlížeči
- [ ] Lze pokládat otázky a získávat odpovědi s podporou AI
- [ ] Application Insights zobrazuje telemetrická data
- [ ] Úspěšně uvolněné prostředky

**Odhadované náklady**: $5–10 za 30 minut testování

### Cvičení 2: Konfigurace nasazení více modelů (45 minut)
**Cíl**: Nasadit několik AI modelů s různými konfiguracemi

```bash
# Vytvořit vlastní konfiguraci Bicep
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

# Nasadit a ověřit
azd provision
azd show
```

**Kritéria úspěchu:**
- [ ] Více modelů nasazeno úspěšně
- [ ] Aplikována různá nastavení kapacity
- [ ] Modely dostupné přes API
- [ ] Aplikace může volat oba modely

### Cvičení 3: Implementace monitorování nákladů (20 minut)
**Cíl**: Nastavit upozornění na rozpočet a sledování nákladů

```bash
# Přidat upozornění o rozpočtu do Bicep
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

# Nasadit upozornění o rozpočtu
azd provision

# Zkontrolovat aktuální náklady
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kritéria úspěchu:**
- [ ] V Azure vytvořeno upozornění na rozpočet
- [ ] Nastaveny e-mailové notifikace
- [ ] Lze zobrazit údaje o nákladech v Azure Portalu
- [ ] Práh rozpočtu nastaven vhodně

## 💡 Často kladené otázky

<details>
<summary><strong>Jak snížit náklady Azure OpenAI během vývoje?</strong></summary>

1. **Využijte bezplatnou úroveň**: Azure OpenAI nabízí 50 000 tokenů/měsíc zdarma
2. **Snížení kapacity**: Nastavte kapacitu na 10 TPM místo 30+ pro vývoj
3. **Použijte azd down**: Uvolněte prostředky, když zrovna nevyvíjíte
4. **Ukládejte odpovědi do cache**: Implementujte Redis cache pro opakované dotazy
5. **Využijte prompt engineering**: Snižte spotřebu tokenů efektivními promptami

```bash
# Konfigurace pro vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Jaký je rozdíl mezi Azure OpenAI a OpenAI API?</strong></summary>

**Azure OpenAI**:
- Podniková bezpečnost a dodržování předpisů
- Integrace do privátní sítě
- Záruky SLA
- Autentizace pomocí spravované identity
- Vyšší dostupné kvóty

**OpenAI API**:
- Rychlejší přístup k novým modelům
- Jednodušší nastavení
- Nižší překážka vstupu
- Pouze veřejný internet

Pro produkční aplikace je doporučeno **Azure OpenAI**.
</details>

<details>
<summary><strong>Jak řeším chyby překročení kvóty Azure OpenAI?</strong></summary>

```bash
# Zkontrolujte aktuální kvótu
az cognitiveservices usage list --location eastus2

# Vyzkoušejte jiný region
azd env set AZURE_LOCATION westus2
azd up

# Dočasně snižte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Požádejte o zvýšení kvóty
# Přejděte do Azure Portal > Kvóty > Požádejte o zvýšení
```
</details>

<details>
<summary><strong>Mohu použít svá vlastní data s Azure OpenAI?</strong></summary>

Ano! Použijte **Azure AI Search** pro RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Podívejte se na šablonu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jak zabezpečit koncové body AI modelů?</strong></summary>

**Doporučené postupy**:
1. Používejte spravovanou identitu (bez API klíčů)
2. Povolit privátní koncové body
3. Nakonfigurujte síťové bezpečnostní skupiny
4. Implementujte omezení požadavků (rate limiting)
5. Použijte Azure Key Vault pro tajné údaje

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
- **Microsoft Learn**: [Oficiální dokumentace](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigace kapitolou:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [Nasazení AI modelu](ai-model-deployment.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k diskuzím komunity nebo otevřete issue v repozitáři. Komunita Azure AI + AZD je tu, aby vám pomohla uspět!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění ani chybné interpretace vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->