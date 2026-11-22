# Integrace Microsoft Foundry s AZD

**Navigace kapitolou:**
- **📚 Domů kurz**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [AI agenti](agents.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled

Tento průvodce ukazuje, jak integrovat služby Microsoft Foundry s Azure Developer CLI (AZD) pro zjednodušené nasazování AI aplikací. Microsoft Foundry poskytuje komplexní platformu pro vytváření, nasazování a správu AI aplikací, zatímco AZD usnadňuje proces infrastruktury a nasazování.

## Co je Microsoft Foundry?

Microsoft Foundry je sjednocená platforma Microsoftu pro vývoj AI, která zahrnuje:

- **Model Catalog**: Přístup k nejmodernějším AI modelům
- **Prompt Flow**: Vizualní návrhář pracovních toků AI
- **Microsoft Foundry Portal**: Integrované vývojové prostředí pro AI aplikace
- **Možnosti nasazení**: Různé možnosti hostování a škálování
- **Bezpečnost a ochrana**: Vestavěné funkce odpovědné AI

## AZD + Microsoft Foundry: Společně lépe

| Funkce | Microsoft Foundry | Výhody integrace s AZD |
|---------|-----------------|------------------------|
| **Nasazení modelů** | Manuální nasazení přes portál | Automatizované, opakovatelné nasazení |
| **Infrastruktura** | Konfigurace projektu a zdrojů | Začít s `azure.yaml`; v případě potřeby vysunout Bicep nebo Terraform |
| **Správa prostředí** | Zaměření na jedno prostředí | Více prostředí (vývoj/test/prod) |
| **Integrace CI/CD** | Služby nasazení a vyhodnocení | Opakované použití konfigurace v GitHub Actions nebo Azure DevOps |
| **Řízení nákladů** | Základní monitorování | Optimalizace nákladů na konkrétní prostředí |

## Požadavky

- Azure předplatné s odpovídajícími oprávněními
- Azure Developer CLI 1.37.0 nebo novější pro GA Foundry workflow
- Přístup ke službám Microsoft Foundry Models
- Základní znalost Microsoft Foundry

> **Aktualizace Foundry GA (2026-11-09):** Balíček `microsoft.foundry` dosáhl verze 1.0 a obecné dostupnosti dne [5. listopadu 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Níže uvedený průvodce následuje toto oznámení a propojený rychlý start Microsoft Learn. Jedná se o kontrolu dokumentace, nikoli o validaci živého nasazení. Volitelné preview funkce a samostatně vydané rozšíření si zachovávají svůj vlastní stav vydání.

**Výsledky učení:** Nainstalovat GA balíček, zkontrolovat `azure.yaml` agenta, porovnat lokální a nasazené odpovědi a vysvětlit vyhodnocování, CI/CD a hranice úklidu. Pro krok za krokem nasazení agenta přejděte na [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). Níže uvedené zdroje obsahují další integrační vzory.

## Základní integrační vzory

**Rozsah příkladů:** Níže uvedený Bicep obsahuje ilustrativní fragmenty zdrojů, nikoli kompletní šablonu pro nasazení. Obsahující šablona musí definovat názvy, `location`, referencované zdroje, identity, výstupy a hostování aplikace. Pro spustitelný výchozí bod použijte propojený příklad. Bash příklady vyžadují Azure CLI autentizaci samostatně oproti `azd auth login`.

### Vzor 1: Integrace Microsoft Foundry Models

**Použití:** Nasadit chatovací aplikace s Azure OpenAI modely v Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infrastruktura (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Volající potřebuje připojenou spravovanou identitu a `Cognitive Services OpenAI User` na úrovni účtu; zakázání klíčů nepřiděluje přístup. Před nasazením ověřte dostupnost regionu/modelu/SKU a kvóty.

### Vzor 2: AI vyhledávání + RAG integrace

**Použití:** Nasadit aplikace využívající retrieval-augmented generation (RAG)

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

```

Pro tuto integraci není dostupný `Microsoft.Search/searchServices/dataConnections` ARM zdroj. Nakonfigurujte index vyhledávání, datový zdroj, indexer/skillset nebo vektorizér přes podporované Search data-plane API. Pokud Vyhledávání volá embedovací model, povolte jeho spravovanou identitu, dejte relevantní modelovou roli a nakonfigurujte jeho embedding skill/vektorizér. Viz [integrovaná vektorizace](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Vzor 3: Integrace Document Intelligence

**Použití:** Zpracování a analýza dokumentů

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

## 🔧 Vzory konfigurace

### Nastavení proměnných prostředí

Kromě zdokumentovaných nastavení AZD jako `AZURE_LOCATION` jsou to **vstupní názvy vlastních šablon**. Nemají efekt, pokud je šablona/aplikace nevyužívá přes mapování parametrů a hostitelského prostředí. Pro `azure-search-openai-demo` použijte jeho skutečné názvy jako `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` a `AZURE_SEARCH_SERVICE_SKU`. Kapacita modelu není SKU účtu.

**Konfigurace pro produkci:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurace pro vývoj:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Bezpečná konfigurace pomocí Key Vault

Preferujte Entra ID s vypnutou lokální autentizací klíče. Níže uvedené je pouze **alternativa staré autentizace klíčem** pro aplikace vyžadující klíče: vyžaduje účet s povolenou autentizací klíčem, připojenou identitu aplikace k hostiteli a funkční přístup/síť Key Vault. Nekombinujte získávání klíče s `disableLocalAuth: true` s očekáváním, že volání na základě klíče budou fungovat.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

## Pracovní postup nasazení

### Rozšíření AZD pro Foundry

Pro GA workflow nainstalujte balíček `microsoft.foundry` místo sestavování základních rozšíření jednotlivě:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Balíček instaluje agenty, připojení, inspektora, projekty, rutiny, schopnosti a nástroje. Nepřidává skupinu příkazů `microsoft.foundry`. Vyhodnocení, sady dat, doladění a vlastní modely se instalují samostatně podle potřeby. Viz [referenci balení rozšíření](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Prohlídka Hosted-Agent (GA)

**Hosted agent** spouští váš agentní kód na výpočetní kapacitě spravované Foundry. Toto cvičení používá upstream základní Python Agent Framework Responses API příklad, nikoli klasické fragmenty Agent Service SDK v jiných lekcích.

#### 1. Příprava a inicializace

Použijte prázdný adresář mimo tuto checkout kurzu. Nainstalujte Python 3.13 nebo novější a aktuální [release uv](https://docs.astral.sh/uv/getting-started/installation/). Samostatná instalace uv může používat `uv self update`. Ověřte [oprávnění hosted-agenta](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), dostupnost modelu a kvótu ve vašem předplatném a regionu před provisioningem. Azure zdroje a lokální volání modelů jsou zpoplatněny.

Dokončete výše uvedenou instalaci `azd auth login` a balíčku. Lokální ukázkový kód používá `DefaultAzureCredential`; pokud používáte Azure CLI pověření, přihlaste se pomocí `az login` se stejným účtem a tenantem jako AZD. Samotné přihlášení do AZD není přihlášením do Azure CLI.

Spusťte tento příkaz jediného řádku v Bash nebo PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Vyberte nový nebo existující Foundry projekt a zamýšlené předplatné a region. Pro opětovné použití nasazení modelu přidejte `--model-deployment <existing-deployment-name>` k inicializačnímu příkazu **před jeho spuštěním** a vyberte existující projekt. Ponechte se v adresáři obsahujícím generovaný `azure.yaml` pro zbývající příkazy.

#### 2. Přehled definice nasazení

Otevřete `azure.yaml` a najděte tato nastavení v [upstream příkladu](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Nastavení | Co zkontrolovat |
|---------|---------------|
| `host: azure.ai.project` a `deployments` | Zamýšlený Foundry projekt a název modelu, verze, SKU nasazení a kapacita |
| `host: azure.ai.agent` a `project` | Hosted agent a adresář obsahující jeho zdrojový kód |
| `codeConfiguration` | Python runtime a vstupní bod; kontrolovaný příklad používá `python_3_13` a `main.py` |
| `uses` | Závislost na službě Foundry projektu |
| `container.resources` | Přidělení CPU a paměti, i když je kód postaven vzdáleně |
| `env` | Mapování nasazení modelu a `PYTHONNOUSERSITE: "1"` pro deaktivaci načítání balíčků uživatele |
| `infra.provider` | `microsoft.foundry`, který syntetizuje požadovanou infrastrukturu |

Commitněte přezkoumaný `azure.yaml` a agentní kód společně. Pro start není potřeba ručně psaná infrastruktura; když budete potřebovat editovatelné provisioningové soubory, postupujte podle [vysunutí infrastruktury](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) pro Bicep nebo Terraform a pokračujte v používání `azd provision`. Necommitujte přihlašovací údaje ani stav prostředí `.azure/`.

#### 3. Provision a lokální test

```bash
azd provision
azd ai agent run
```

Provisioning může vytvořit chybějící nasazení modelu **i v opakovaně použitém projektu**. Zkontrolujte prompt modelu a vyberte dostupný online typ nasazení, jako Global Standard nebo Data Zone Standard; kvóty a regionální podpora se liší.

Lokální spuštění připraví závislosti a otevře **Agent Inspector**, kde můžete kontrolovat žádosti, odpovědi a aktivitu nástrojů/modelů. Nechte to běžet a otevřete druhý terminál ve stejném projektovém adresáři:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Kontrolní bod:** Potvrďte, že obdržíte relevantní odpověď a můžete zkontrolovat související lokální aktivitu. Lokální spuštění stále volá vaše Azure nasazení modelu; není to offline nebo bezplatný test. Používejte syntetické prompty a vyvarujte se odhalování tajemství či citlivých dat v inspektorovi.

#### 4. Nasazení a porovnání

Ukončete lokální běh pomocí Ctrl+C, když skončíte. Před vzdáleným vyvoláním nakonfigurujte nebo ověřte [připojení Application Insights a přístup ke čtení trasování](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) projektu.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

V režimu nasazení kódu AZD nahraje zdroj pro vzdálenou Foundry build; není potřeba lokální sestavení kontejneru pro tuto cestu. Výstup nasazení poskytuje odkazy na playground a endpoint. Ověřte odpověď od nasazeného agenta a jeho cloudovou trasu; pouze lokální události inspektora neprokazují funkčnost cloudového trasování.

Pro následné změny zkontrolujte podporovanou konfiguraci hosted-agenta pomocí `azd deploy --preview`. Streamujte logy s `azd ai agent monitor --follow` nebo diagnostikujte problémy s nastavením a přístupem pomocí `azd ai agent doctor`. Náhled nasazení není kompletní kontrola infrastruktury ani bezpečnosti.

#### 5. Přidání opakovatelné kontroly kvality

Nainstalujte samostatně vydané rozšíření pro vyhodnocování, pak generujte návrhové testovací zdroje:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Popište zamýšlené chování agenta a vyberte **Dataset a evaluator**, potom **Turn**. Zkontrolujte a upravte generované případy a hodnotící rubriku, včetně případu nepodporované otázky, před nakonfigurováním vyhodnocení:

```bash
azd ai eval init --name quality
```

Vyberte ověřenou sadu dat a rubriku a potvrďte nasazení modelu rozhodčího. Zkontrolujte `evals/azure.eval.yaml` a jeho reference služby vyhodnocení v `azure.yaml`, pak zaregistrujte zdroje a spusťte:

```bash
azd up
azd ai eval run start --eval quality
```

Prohlédněte skóre a neúspěšné či chybně vyhodnocené případy; dokončené vyhodnocení automaticky neznamená průchod kvality. Generování a skórování také ukládá náklady na model. Commitněte neinformační konfiguraci, sady dat a rubriky, aby si kolegové mohli porovnávat změny. `azd ai agent optimize` může znovu použít kompatibilní vyhodnocení jako výchozí bod, ale před explicitním nasazením kandidáty překontrolujte. Viz [quality gates and migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pro starší projekty a CI.

#### 6. Použití workflow v CI/CD

Po úspěšném `azd up` spusťte `azd pipeline config` a prohlédněte generovaný GitHub Actions nebo Azure DevOps workflow. Nainstalujte `microsoft.foundry` na runner, plus `azure.ai.evaluations` pokud spouštíte vyhodnocení. Uchovejte generovaná nastavení checkoutu, přihlášení a prostředí; samotná instalace nepřihlašuje pipeline.

Používejte samostatné prostředí AZD pro každý stupeň, udělte identitě pipeline požadovaná oprávnění ke zdrojům a Foundry a uchovejte přihlašovací údaje v tajemstvích pipeline nebo použijte federovanou identitu. Commitněte vyhodnocovací zdroje a ověřte, že identita má přístup k referencovaným sadám dat/evaluatorům. Viz [příklad pipeline kurzu](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) a [Foundry CI/CD průvodce](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Úklid promyšleně

U **nového projektu vytvořeného tímto prostředím** si před potvrzením zkontrolujte zdroje vyjmenované `azd down`: smaže skupinu zdrojů a vše v ní.

Pro **znovupoužitý projekt** ponechá `azd down` projekt, hostovaného agenta a další prostředky na místě. Odstraňte pouze nechtěné prostředky, které vlastníte, pomocí [návodu rychlého čištění](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); nesmažte sdílenou skupinu prostředků, abyste uklidili jedno cvičení.

**Kontrola dokončení:** Vysvětlete, která nastavení řídí chování místně a v cloudu, ukažte místní a nasazené odpovědi, zkontrolujte výsledek hodnocení a určete, které prostředky zůstanou po úklidu.

### Volitelné: Vytvoření kostry pomocí Microsoft Foundry Skill

Nainstalujte [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) pro hostitele vašeho kódovacího agenta, poté otevřete samostatnou prázdnou složku. Požádejte ho, aby vytvořil kostru základního příkladu Python Agent Framework Responses API v režimu nasazení kódu, vysvětlete vygenerovaný `azure.yaml` a navrhněte předplatné, region, projekt a nasazení modelu. Vyžadujte schválení **před vytvořením prostředků Azure**, požádejte o místní test a zastavte před nasazením. Zkontrolujte jeho výstup a pokračujte v krocích nasazení výše, pouze pokud jste připraveni.

Pro existující projekty nahrazuje `--template`/`-t` zastaralý zápis `--manifest`/`-m`; změna příznaku nepřemisťuje staré manifesty ani vnořené konfigurace agenta. Viz [AI CLI reference](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Jednorázové nasazení příkazem

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Nasazení podle prostředí

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorování a pozorovatelnost

### Integrace Application Insights

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
```

Toto zajišťuje prostředek Insights, ne telemetrickou instrumentaci. Jakmile vaše aplikace vysílá odchozí span události modelových volání, spusťte tento ilustrační dotaz v Application Insights Logs (přizpůsobte filtr aktuálním názvům spanů):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorování nákladů

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Použijte skutečného příjemce a ověřte oprávnění pro billing-scope. Rozpočet odesílá upozornění; není to limit výdajů.

## 🔐 Nejlepší bezpečnostní postupy

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

### Síťová bezpečnost

Tento fragment koncového bodu také vyžaduje soukromou DNS zónu/skupinu, propojení VNet, připojení aplikace k VNet a explicitní politiku veřejného přístupu. Pouhé vytvoření privátního koncového bodu veřejný přístup nezakáže.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache pro Redis Basic/Standard/Premium je na [cestě k ukončení](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); pro nová nasazení používejte Azure Managed Redis a dodržujte aktuální pokyny k šablonám/autentizaci. Scope kešovaných odpovědí AI určujte podle autorizace, modelu/instrukcí a verze dat, s expirací; nikdy nesdílejte soukromé odpovědi pouze textem dotazu.

### Konfigurace automatického škálování

**Částečný prostředek:** sloučte tyto nastavení škálování/ingresu do kompletní aplikace Container App se spravovaným prostředím, obrazem kontejneru a limity prostředků. Více replik nezvyšuje kvótu modelu.

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

## Řešení běžných problémů

### Problém 1: Překročení kvóty OpenAI

**Příznaky:**
- Nasazení selhává s chybami kvóty
- 429 chyby v aplikačních logech

**Řešení:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Proměnná kapacity výše platí pouze pro vlastní šablonu napojenou na její spotřebu. Pro příklad RAG použijte `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Neměňte `AZURE_LOCATION` pro přesun existujících prostředků na místo; vytvořte samostatné prostředí pro nový region a plánujte migraci/úklid.

### Problém 2: Chyby autentizace

**Příznaky:**
- Chyby 401/403 při volání AI služeb
- Zprávy „Přístup odepřen“

**Řešení:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problém 3: Problémy s nasazením modelu

**Příznaky:**
- Modely nejsou dostupné v nasazení
- Selhávají konkrétní verze modelu

**Řešení:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Ukázkové šablony

Jsou to alternativy, nikoliv postupné příkazy. Každý spusťte v samostatném prázdném adresáři. Explicitní cílová `.` ponechává inicializaci ve vašem aktuálním adresáři; jinak může aktuální AZD vytvořit podadresář se jménem šablony, aniž by změnil pracovní adresář vašeho shellu.

### RAG Chat aplikace (Python)

**Repozitář**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Referenční aplikace RAG chat pro dotazy nad vašimi dokumenty, s vyhledáváním Azure AI Search. Před použitím si prostudujte podporované modely, volitelné funkce, návod k nákladům a doporučení pro produkční nasazení; nasazení ukázky nedělá aplikaci připravenou pro produkci.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat aplikace (.NET)

**Repozitář**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# verze Python RAG chat vzorku. Postavena na ASP.NET Core Minimal API a Blazor WebAssembly frontend. Zahrnuje hlasový chat, podporu GPT-4o-mini vision a doprovodného desktop/mobilního klienta .NET MAUI Blazor Hybrid.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat aplikace (Java)

**Repozitář**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verze RAG chat vzorku využívající Langchain4J pro AI orchestraci. Podporuje architekturu mikroservis s event-driven přístupem, více strategií vyhledávání (textové, vektorové, hybridní), nahrávání dokumentů s Azure Document Intelligence a nasazení na Azure Container Apps nebo Azure Kubernetes Service.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot s Microsoft Foundry

**Repozitář**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: Kompletní retail RAG copilot se Microsoft Foundry a Prompty. Chatbot pro prodejce Contoso Outdoor, který opírá odpovědi o katalog produktů a data objednávek zákazníků. Ukazuje kompletní GenAIOps workflow — prototypování s Prompty, vyhodnocení AI asistenty a nasazení přes AZD na Container Apps.

**Rychlý start**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativní multiagentní aplikace pro psaní

**Repozitář**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Ukázka multiagentní orchestraci AI s Prompty. Používá výzkumného agenta (Bing Grounding v Azure AI Agent Service), produktového agenta (Azure AI Search), spisovatelského a editorského agenta k tvorbě dobře prozkoumaných článků. Obsahuje CI/CD s vyhodnocováním v GitHub Actions.

**Rychlý start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG chat (JavaScript/TypeScript)

**Repozitář**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Popis**: Plně serverless RAG chatbot používající LangChain.js s Azure Functions jako API a Azure Static Web Apps jako hosting. Používá Azure Cosmos DB jako vektorové úložiště a databázi historie chatu. Podporuje lokální vývoj s Ollama pro testování zdarma.

**Rychlý start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Accelerator chatování s vašimi daty

**Repozitář**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search s Cosmos DB, nebo PostgreSQL s pgvector

**Popis**: Zvýrazňovač konverzací s dokumenty s citacemi. Aktuální ukázka hostí React frontend, FastAPI backend a Functions ingestion worker na Container Apps; orchestrátor jsou Agent Framework a LangGraph. Databázové a retrieval možnosti jsou výběrem při nasazení. Je to výchozí bod, nikoliv hotové produkční řešení; nepřepokládejte, že starší varianty App Service, Semantic Kernel nebo Prompt Flow odpovídají současnému standardu.

**Rychlý start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP orchestrace

**Repozitář**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP servery (.NET, Python, Java, TypeScript)

**Popis**: Referenční aplikace multiagentní AI orchestraci s třemi frameworky (LangChain.js, LlamaIndex.TS a Microsoft Agent Framework). Obsahuje MCP (Model Context Protocol) servery ve čtyřech jazycích nasazené jako serverless Azure Container Apps s monitoringem OpenTelemetry.

**Rychlý start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Prohlédněte si více šablon**: Navštivte [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pro aktuální šablony různých jazyků a scénářů. Každý odkazovaný příklad je externí repozitář, nikoliv místní příklad z tohoto kurzu; před nasazením zkontrolujte předpoklady a produkční doporučení.

## Další kroky

1. **Vyzkoušejte příklady**: Začněte se šablonou, která odpovídá vašemu případu použití
2. **Přizpůsobte potřebám**: Upravte infrastrukturu a kód aplikace
3. **Přidejte monitorování**: Zajistěte komplexní pozorovatelnost
4. **Optimalizujte náklady**: Vyladění nastavení podle rozpočtu
5. **Zabezpečte nasazení**: Implementace bezpečnostních vzorů pro podnikání
6. **Škálujte do produkce**: Přidejte funkcionalitu multi-region a vysoké dostupnosti

## 🎯 Praktická cvičení

### Cvičení 1: Nasazení Microsoft Foundry Models Chat aplikace (30 minut)
**Cíl**: Nasadit a otestovat referenční AI chat aplikaci

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Kritéria úspěchu:**
- [ ] Nasazení proběhne bez chyb kvóty
- [ ] Přístup k chat rozhraní v prohlížeči
- [ ] Možnost klást otázky a získat AI odpovědi
- [ ] Application Insights zobrazuje telemetrická data
- [ ] Prostředky úspěšně vyčištěny

**Náklady:** Před nasazením prostudujte aktuální návod k nákladům a vybrané SKU. Účtování pokračuje, dokud nejsou prostředky smazány; není stanovena pevná 30minutová odhadovaná doba pro každou konfiguraci.

### Cvičení 2: Konfigurace nasazení více modelů (45 minut)
**Cíl**: Nasadit více AI modelů s různými konfiguracemi

**Výchozí bod:** Existence Azure OpenAI účtu a modulu typu resource-group v AZD, který může volat tento soubor. Vytvořte `infra/ai-models.bicep` s následujícím obsahem pomocí editoru. Nebude automaticky nasazeno pouze proto, že je pod `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Z modulu s platností pro resource-group vlastního účtu přidejte volání modulu (přizpůsobte název symbolu vašemu účtu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nedeclareujte stejná nasazení v obou modulech. Pokud je vstupní bod AZD v rámci odběru, vyvolejte tento z podřízeného modulu pro resource-group a upravte relativní cestu. Sestavte obsahový modul pomocí `az bicep build --file <path-to-containing-module>`, pak:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kritéria úspěchu:**
- [ ] Více modelů bylo úspěšně nasazeno
- [ ] Byla aplikována různá nastavení kapacity
- [ ] Modely jsou dostupné přes API
- [ ] Aplikace může volat oba modely

### Cvičení 3: Implementace monitorování nákladů (20 minut)
**Cíl**: Nastavit rozpočtová upozornění a sledování nákladů

**Výchozí bod:** Vzor rozpočtu výše a modul infrastruktury s platností pro resource-group. Přidejte tento prostředek pomocí editoru; předávejte `budgetStartDate` z mapování parametrů (duplicitně nepřidávejte, pokud již je deklarován). Nahraďte příjemce a ověřte si oprávnění k zápisu rozpočtu.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Očekávané: odpověď obsahuje `amount: 200`, oba práhů a vašeho příjemce. Prohlédněte si v portálu Cost Management skutečné poplatky; data o nákladech jsou zpožděná a upozornění během krátkého cvičení nemusí být vyvoláno.

**Kritéria úspěchu:**
- [ ] Rozpočtové upozornění vytvořeno v Azure
- [ ] Emailová oznámení nakonfigurována
- [ ] Zobrazení dat o nákladech v Azure Portal
- [ ] Práhy rozpočtu správně nastaveny

## 💡 Často kladené otázky

<details>
<summary><strong>Jak snížit náklady Microsoft Foundry Models během vývoje?</strong></summary>

1. **Zkontrolujte ceny**: Neexistuje univerzální měsíční bezplatný limit 50 000 tokenů pro modely Azure OpenAI
2. **Správně nastavte kapacitu**: Kapacita `10` typicky představuje 10 000 TPM pro tyto Standard textové modely, ne 10 TPM. Snížení tohoto limitu rychlosti nesnižuje cenu za token
3. **Použijte azd down**: Smažte odpadní prostředky, pokud nevyvíjíte aktivně (není to uvolnění)
4. **Používejte Cache odpovědí**: Zaveďte Redis cache pro opakované dotazy
5. **Používejte Prompt Engineering**: Snižte využití tokenů efektivními podněty

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Jaký je rozdíl mezi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnost a soulady
- Integrace do privátní sítě
- Záruky SLA
- Autentizace spravovanou identitou
- Dostupné vyšší kvóty

**OpenAI API**: Samostatný poskytovatel/API s vlastní dostupností modelů, cenami, autentizací a podnikatelskými konektivitami. Porovnejte aktuální nabídky, místo přepokladu, že je pouze veřejně dostupné nebo že vždy první dodává modely.

Vyberte podle požadavků vaší organizace; v tomto kurzu uvedené příklady s Azure specifickou spravovanou identitou a privátními odkazy platí pro služby hostované v Azure, ne pro každý model/poskytovatele v katalogu Foundry.
</details>

<details>
<summary><strong>Jak řešit chyby překročení kvóty Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Mohu použít vlastní data s Microsoft Foundry Models?</strong></summary>

Ano! Použijte **Azure AI Search** pro RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Viz šablona [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jak zabezpečit koncové body AI modelů?</strong></summary>

**Nejlepší postupy**:
1. Používejte Managed Identity (žádné API klíče)
2. Povolit soukromé koncové body
3. Nakonfigurujte skupiny zabezpečení sítě
4. Implementujte omezení rychlosti požadavků
5. Používejte Azure Key Vault pro tajné klíče

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
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Nainstalujte si Azure + Foundry agenty dovednosti ve vašem editoru pomocí `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitolou:**
- **📚 Domů ke kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [AI agenti](agents.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k diskusím v naší komunitě nebo otevřete problém v repozitáři. Komunita Azure AI + AZD je zde, aby vám pomohla dosáhnout úspěchu!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->