# Integrácia Microsoft Foundry s AZD

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-prvý vývoj
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia**: [AI agenti](agents.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad

Tento sprievodca ukazuje, ako integrovať služby Microsoft Foundry s Azure Developer CLI (AZD) pre zjednodušené nasadenie AI aplikácií. Microsoft Foundry poskytuje komplexnú platformu na vytváranie, nasadzovanie a správu AI aplikácií, zatiaľ čo AZD zjednodušuje infraštruktúru a proces nasadenia.

## Čo je Microsoft Foundry?

Microsoft Foundry je jednotná platforma Microsoftu pre vývoj AI, ktorá zahŕňa:

- **Katalóg modelov**: Prístup k najmodernejším AI modelom
- **Prompt Flow**: Vizuálny návrhár AI pracovných tokov
- **Portál Microsoft Foundry**: Integrované vývojové prostredie pre AI aplikácie
- **Možnosti nasadenia**: Viaceré možnosti hostovania a škálovania
- **Bezpečnosť a ochrana**: Vstavané funkcie zodpovednej AI

## AZD + Microsoft Foundry: Lepšie spolu

| Funkcia | Microsoft Foundry | Výhody integrácie s AZD |
|---------|-----------------|------------------------|
| **Nasadenie modelu** | Manuálne nasadenie cez portál | Automatizované, opakovateľné nasadenia |
| **Infraštuktúra** | Konfigurácia projektu a zdrojov | Začnite s `azure.yaml`; pri potrebe použite Bicep alebo Terraform |
| **Správa prostredia** | Zameranie na jediné prostredie | Viacero prostredí (vývoj/test/prod) |
| **Integrácia CI/CD** | Služby nasadenia a vyhodnocovania | Použitie konfigurácie v GitHub Actions alebo Azure DevOps |
| **Správa nákladov** | Základný monitoring | Optimalizácia nákladov podľa prostredia |

## Predpoklady

- Azure predplatné s príslušnými povoleniami
- Azure Developer CLI verzia 1.37.0 alebo novšia pre GA Foundry workflow
- Prístup ku službám Microsoft Foundry Models
- Základná znalosť Microsoft Foundry

> **Foundry GA aktualizácia (2026-11-09):** Balíček rozšírení `microsoft.foundry` dosiahol verziu 1.0 a všeobecnú dostupnosť [5. novembra 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Nižšie uvedený návod zodpovedá tomuto oznámeniu a prepojenému rýchlemu štartu Microsoft Learn. Toto je revízia dokumentácie, nie overenie živého nasadenia. Voliteľné náhľadové funkcie a samostatne vydávané rozšírenia si zachovávajú svoj vlastný stav vydania.

**Výsledky učenia:** Nainštalujte GA balíček, prejdite si agentov `azure.yaml`, porovnajte lokálne a nasadené odpovede a vysvetlite hodnotenie, CI/CD a hranice čistenia. Pre krok za krokom nasadenie agenta prejdite na [návod s hosteným agentom](#hosted-agent-walkthrough-ga). Nižšie uvedené fragmenty zdrojov pokrývajú ďalšie integračné vzory.

## Základné integračné vzory

**Rozsah príkladov:** Bicep nižšie obsahuje ilustračné fragmenty zdrojov, nie kompletný nasaditeľný šablón. Obsahujúca šablóna musí definovať mená, `location`, referencované zdroje, identity, výstupy a hosťovanie aplikácie. Použite prepojený vzor ako spustiteľný východiskový bod. Bash príklady vyžadujú samostatnú autentifikáciu cez Azure CLI nezávisle od `azd auth login`.

### Vzor 1: Integrácia modelov Microsoft Foundry

**Použitie**: Nasadenie chatovacích aplikácií s Azure OpenAI modelmi v Microsoft Foundry

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

**Infraštuktúra (main.bicep):**
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

Volajúci potrebuje priradenú managed identity a `Cognitive Services OpenAI User` na úrovni konta; deaktivácia kľúčov nepriznáva prístup. Pred nasadením skontrolujte dostupnosť regiónu/modelu/SKU a kvótu.

### Vzor 2: AI Vyhľadávanie + RAG Integrácia

**Použitie**: Nasadenie aplikácií so získavaním a generovaním doplnených údajov (RAG)

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

Pre túto integráciu nie je k dispozícii ARM zdroj `Microsoft.Search/searchServices/dataConnections`. Konfigurujte vyhľadávací index, zdroj údajov, indexer/skillset alebo vectorizer cez podporované Search data-plane API. Ak Search volá embedding model, povolte jeho managed identity, priraďte príslušnú modelovú rolu a konfigurujte embedding skill/vectorizer. Viď [integrovaná vektorizácia](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Vzor 3: Integrácia Document Intelligence

**Použitie**: Pracovné toky na spracovanie a analýzu dokumentov

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

Okrem dokumentovaných nastavení AZD ako `AZURE_LOCATION` sú toto **vlastné mená vstupov šablóny**. Nemajú účinok, ak ich šablóna/aplikácia nespracováva cez parametre a mapovania hosťovacieho prostredia. Pre `azure-search-openai-demo` použite jeho skutočné mená ako `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` a `AZURE_SEARCH_SERVICE_SKU`. Kapacita modelu nie je SKU konta.

**Produkčná konfigurácia:**
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

**Vývojová konfigurácia:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Bezpečná konfigurácia pomocou Key Vault

Preferujte Entra ID s lokálne vypnutou autentifikáciou pomocou kľúčov. Nasledujúce je len **alternatíva na báze kľúčovej autentifikácie pre staršie aplikácie**, ktoré vyžadujú kľúče: vyžaduje účet s povolenou autentifikáciou kľúčov, priradenú identitu aplikácii a funkčný prístup/sieťovanie Key Vaultu. Nekombinujte získavanie kľúčov s `disableLocalAuth: true` a neočakávajte funkčné volania na základe kľúčov.

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

## Pracovné postupy nasadenia

### Rozšírenia AZD pre Foundry

Pre GA workflow nainštalujte balíček `microsoft.foundry` namiesto ručného zostavovania základných rozšírení jednotlivé:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Balíček inštaluje agentov, pripojenia, inšpektora, projekty, rutinové skripty, schopnosti a nástroje. Nepridáva skupinu príkazov `microsoft.foundry`. Hodnotenia, dátové súbory, doladenie a vlastné modely sa inštalujú samostatne podľa potreby. Viď [referenciu balenia rozšírení](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Sprievodca hosťovaným agentom (GA)

**Hosťovaný agent** spúšťa váš agent kód na Foundry spravovanej výpočtovej kapacite. Tento príklad používa štandardný Python Agent Framework Responses API vzorku, nie klasické fragmenty Agent Service SDK z iných lekcií.

#### 1. Príprava a inicializácia

Použite prázdny adresár mimo tohto klonu kurzu. Nainštalujte Python 3.13 alebo novší a aktuálne vydanie [uv](https://docs.astral.sh/uv/getting-started/installation/). Samostatné inštalácie uv môžu použiť `uv self update`. Skontrolujte [povolenia hosťovaného agenta](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), dostupnosť modelu a kvótu vo vašom predplatnom a regióne pred provisionovaním. Azure zdroje a lokálne volania modelov sú účtované.

Dokončite inštaláciu `azd auth login` a balíkov vyššie. Miestny ukážkový kód používa `DefaultAzureCredential`; ak používate povolenia Azure CLI, prihláste sa pomocou `az login` rovnakým kontom a tenantom ako AZD. Samotné prihlásenie do AZD nie je prihlásením do Azure CLI.

Spustite tento jednotný príkaz v Bash alebo PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Vyberte nový alebo existujúci projekt Foundry a zamýšľané predplatné a región. Ak chcete znovu použiť nasadenie modelu, pridajte `--model-deployment <existing-deployment-name>` do inicializačného príkazu **pred jeho spustením** a vyberte existujúci projekt. Zostaňte v adresári obsahujúcom vygenerovaný `azure.yaml` pre zostávajúce príkazy.

#### 2. Skontrolujte definíciu nasadenia

Otvorte `azure.yaml` a nájdite tieto nastavenia v [upstream ukážke](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Nastavenie | Čo skontrolovať |
|---------|---------------|
| `host: azure.ai.project` a `deployments` | Zamýšľaný projekt Foundry a názov modelu, verzia, SKU nasadenia a kapacita |
| `host: azure.ai.agent` a `project` | Hostovaný agent a adresár obsahujúci jeho zdrojový kód |
| `codeConfiguration` | Python runtime a vstupný bod; kontrolovaný príklad používa `python_3_13` a `main.py` |
| `uses` | Závislosť na službe projektu Foundry |
| `container.resources` | CPU a pridelovanie pamäte, aj keď je kód zostavený vzdialene |
| `env` | Mapovanie nasadenia modelu a `PYTHONNOUSERSITE: "1"` na zakázanie načítania balíkov používateľského miesta |
| `infra.provider` | `microsoft.foundry`, ktorý syntetizuje potrebnú infraštruktúru |

Spolu potvrďte kontrolovaný `azure.yaml` a kód agenta. Na začiatok nie je potrebná ručne písaná infraštruktúra; ak potrebujete upraviteľné súbory provisioning, riaďte sa [vysunutím infraštruktúry](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) pre Bicep alebo Terraform a pokračujte v používaní `azd provision`. Neukladajte do repozitára poverenia ani stav prostredia `.azure/`.

#### 3. Provisionujte a testujte lokálne

```bash
azd provision
azd ai agent run
```

Provisioning môže vytvoriť chýbajúce nasadenia modelov **aj v znovu použitom projekte**. Skontrolujte výzvy modelov a vyberte dostupný typ online nasadenia, napríklad Global Standard alebo Data Zone Standard; kvóty a regionálna podpora sa líšia.

Lokálne spustenie pripravuje závislosti a otvára **Agent Inspector**, kde môžete kontrolovať požiadavky, odpovede a aktivitu nástrojov/modelov. Nechajte ho bežať a otvorte druhý terminál v tom istom projektovom adresári:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Kontrolný bod:** Potvrďte, že dostávate relevantnú odpoveď a môžete skontrolovať súvisiacu lokálnu aktivitu. Lokálne vykonávanie stále volá vaše Azure modelové nasadenie; nie je to offline alebo bezplatný test. Používajte syntetické výzvy a vyhýbajte sa vystavovaniu tajomstiev alebo citlivých dát v zobrazení inspektora.

#### 4. Nasadenie a porovnanie

Ukončite lokálne spustenie pomocou Ctrl+C po dokončení. Pred vzdialeným volaním nakonfigurujte alebo overte [pripojenie a prístup k čítaniu stopiek Application Insights](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) projektu.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

V režime nasadenia kódu AZD nahrá zdroj pre vzdialenú zostavu Foundry; pre túto cestu nie je potrebné lokálne zostavenie kontajnera. Výstup nasadenia poskytuje odkazy na playground a endpoint. Overte odpoveď od nasadeného agenta a jeho cloudovú stopu; lokálne udalosti inspektora samy o sebe nedokazujú funkčnosť cloudového trasovania.

Pri následných zmenách skontrolujte podporovanú konfiguráciu hosteného agenta s `azd deploy --preview`. Streamujte denníky s `azd ai agent monitor --follow` alebo diagnostikujte nastavenie a problémy s prístupom cez `azd ai agent doctor`. Náhľad nasadenia nie je kompletnou infraštruktúrnou ani bezpečnostnou kontrolou.

#### 5. Pridajte opakovateľnú kontrolu kvality

Nainštalujte samostatne vydané rozšírenie evaluácií, potom vygenerujte koncept testovacích materiálov:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Opíšte zamýšľané správanie agenta a vyberte **Dataset and evaluator**, potom **Turn**. Skontrolujte a upravte vygenerované prípady a hodnotiacu stupnicu, vrátane prípadu nepodporovanej otázky, pred konfiguráciou evaluácie:

```bash
azd ai eval init --name quality
```

Vyberte kontrolovaný dataset a stupnicu a potvrďte nasadenie modelu sudcu. Skontrolujte `evals/azure.eval.yaml` a jeho referenciu služby evaluácie v `azure.yaml`, potom zaregistrujte aktíva a spustite:

```bash
azd up
azd ai eval run start --eval quality
```

Skontrolujte skóre a neúspešné alebo chybné prípady; dokončená evaluácia nie je automaticky certifikátom kvality. Generovanie a skórovanie tiež účtuje poplatky za model. Uložte neutajované konfigurácie, datasety a stupnice, aby si spolupracovníci mohli porovnať zmeny. `azd ai agent optimize` môže znovu použiť kompatibilnú evaluáciu ako východiskovú hodnotu, ale pred explicitným nasadením kandidátov preverte. Pozrite [kvalitné brány a migráciu](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pre staršie projekty a CI.

#### 6. Znovu použite pracovný tok v CI/CD

Po úspešnom `azd up` spustite `azd pipeline config` a skontrolujte vygenerované GitHub Actions alebo Azure DevOps workflow. Nainštalujte `microsoft.foundry` na runner, plus `azure.ai.evaluations`, ak bežia evaluácie. Zachovajte vygenerované nastavenia checkout, prihlásenia a prostredia; samotná inštalácia nezabezpečuje autentifikáciu pipeline.

Používajte samostatné prostredie AZD pre každú fázu, udelte pipeline identity potrebné povolenia pre zdroje a Foundry, a uchovávajte poverenia v pipeline secrets alebo používajte federovanú identitu. Uložte evaluačné aktíva a overte, či identita má prístup k odkazovaným datasetom/evaluátorom. Pozrite [príklad pipeline kurzu](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) a [Foundry CI/CD príručku](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Úmyselné vyčistenie

Pre **nový projekt vytvorený týmto prostredím** skontrolujte zdroje zobrazené `azd down` pred potvrdením: odstráni sa skupina zdrojov a všetko v nej.

Pre **znovu použitý projekt**, `azd down` ponechá projekt, hosteného agenta a ďalšie zdroje nedotknuté. Odstráňte iba nechcené vlastnené zdroje podľa [rýchlych pokynov na čistenie](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); neodstraňujte zdieľanú skupinu zdrojov na vyčistenie jedného cvičenia.

**Kontrola dokončenia:** Vysvetlite, ktoré nastavenia riadia lokálne a cloudové správanie, ukážte lokálne a nasadené odpovede, skontrolujte výsledok evaluácie a identifikujte, ktoré zdroje zostávajú po vyčistení.

### Voliteľné: Scaffoldovanie so schopnosťou Microsoft Foundry

Nainštalujte [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) pre váš hostiteľský kodeovací agent, potom otvorte samostatný prázdny priečinok. Požiadajte ho, aby scaffoldoval základný Python Agent Framework Responses API príklad v režime nasadenia kódu, vysvetlite vygenerovaný `azure.yaml` a navrhnite predplatné, región, projekt a nasadenie modelu. Požadujte schválenie **pred vytvorením Azure zdrojov**, žiadajte lokálny test a zastavte sa pred nasadením. Skontrolujte jeho výstup a pokračujte s krokmi nasadenia len ak ste pripravení.

Pre existujúce projekty, `--template`/`-t` nahrádza zastaranú pravopisnú verziu `--manifest`/`-m`; zmena príznaku neprenáša staré manifesty ani vnorené konfigurácie agenta. Pozrite si [referenciu AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Nasadenie jedným príkazom

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Nasadenia špecifické pre prostredie

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
```

Tým sa zriaďuje zdroj Insights, nie telemetrická inštrumentácia. Keď vaša aplikácia začne vysielať odchádzajúce modelové volania, spustite v Application Insights Logs tento ilustratívny dotaz (prispôsobte filter opravdivým názvom vašich spanov):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorovanie nákladov

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

Použite skutočného príjemcu a overte oprávnenia na fakturačný rozsah. Rozpočet posiela upozornenia; nie je to limit výdavkov.

## 🔐 Najlepšie bezpečnostné praktiky

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

Tento fragment koncového bodu tiež vyžaduje súkromnú DNS zónu/skupinu, VNet prepojenia, konektivitu aplikácie k VNet a explicitnú politiku prístupu verejnosti. Vytvorenie súkromného koncového bodu samo o sebe nezakáže verejný prístup.

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

### Stratégie cacheovania

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

Azure Cache for Redis Basic/Standard/Premium je na [ceste do dôchodku](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); pre nové nasadenia používajte Azure Managed Redis a riaďte sa jeho aktuálnym návodom na šablóny/autentifikáciu. Obmedzte dočasne uložené AI odpovede podľa autorizácie, modelu/inštrukcií a verzie dát s expiráciou; nikdy nezdieľajte súkromné odpovede iba pomocou textu dotazu.

### Konfigurácia automatického škálovania

**Čiastkový zdroj:** zlúčte tieto nastavenia škálovania/prístupu do kompletného Container App so spravovaným prostredím, obrazom kontajnera a limitmi zdrojov. Viac replík nezvyšuje kvótu modelu.

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
- Nasadenie zlyháva s chybami kvóty
- 429 chyby v aplikačných logoch

**Riešenia:**
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

Vyššie uvedená premenná kapacity platí len pre vlastnú šablónu, ktorá ju používa. Pre príklad RAG používajte `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Neměňte `AZURE_LOCATION` na presunutie existujúcich zdrojov; vytvorte samostatné prostredie pre novú oblasť a naplánujte migráciu/čistenie.

### Problém 2: Zlyhania autentifikácie

**Príznaky:**
- 401/403 chyby pri volaní AI služieb
- Správy "Prístup odepretý"

**Riešenia:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problém 3: Problémy s nasadením modelu

**Príznaky:**
- Modely nie sú k dispozícii v nasadení
- Niektoré verzie modelov zlyhávajú

**Riešenia:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Ukážkové šablóny

Toto sú alternatívy, nie postupné príkazy. Každý začnite v samostatnom prázdnom adresári. Explicitné cieľové umiestnenie `.` uchová inicializáciu vo vašom aktuálnom adresári; inak môže aktuálny AZD vytvoriť podadresár s názvom šablóny bez zmeny pracovného adresára shellu.

### RAG Chat aplikácia (Python)

**Repozitár**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Referenčná aplikácia RAG chat pre otázky nad vašimi dokumentmi s vyhľadávaním Azure AI Search. Pred použitím si preštudujte podporované modely, voliteľné funkcie, cenové usmernenia a prípravu pre produkciu súčasného príkladu; nasadenie ukážky nezaručuje výrobnú pripravenosť aplikácie.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat aplikácia (.NET)

**Repozitár**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# ekvivalent Python RAG chat ukážky. Postavené s ASP.NET Core Minimal API a Blazor WebAssembly frontendom. Obsahuje hlasový chat, podporu GPT-4o-mini vision a sprievodného .NET MAUI Blazor Hybrid desktop/mobilného klienta.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat aplikácia (Java)

**Repozitár**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verzia RAG chat ukážky používajúca Langchain4J pre AI orchestráciu. Podporuje mikroservisnú event-driven architektúru, viaceré vyhľadávacie stratégie (textová, vektorová, hybridná), nahrávanie dokumentov s Azure Document Intelligence a nasadenie buď na Azure Container Apps alebo Azure Kubernetes Service.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Podnikový maloobchodný Copilot s Microsoft Foundry

**Repozitár**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: Koncový retail RAG copilot využívajúci Microsoft Foundry a Prompty. Chatbot maloobchodného predajcu Contoso Outdoor s odpoveďami založenými na dátach produktového katalógu a zákazníckych objednávok. Demonštruje celý GenAIOps pracovný postup — prototypovanie s Prompty, hodnotenie AI asistovanými vyhodnocovačmi a nasadenie cez AZD do Container Apps.

**Rýchly štart**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreatívna písacia multiagentová aplikácia

**Repozitár**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Multiagentný príklad predvádzajúci orchestráciu AI agentov s Prompty. Používa výskumného agenta (Bing Grounding v Azure AI Agent Service), produktu agenta (Azure AI Search), pisateľa a redaktora na spoluprácu pri tvorbe dobre preverených článkov. Obsahuje CI/CD s vyhodnocovaním v GitHub Actions.

**Rýchly štart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozitár**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Popis**: Plne serverless RAG chatbot využívajúci LangChain.js s Azure Functions pre API a Azure Static Web Apps na hosťovanie. Používa Azure Cosmos DB ako vektorový obchod i databázu histórie chatu. Podporuje lokálny vývoj s Ollama pre beznákladové testovanie.

**Rýchly štart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Riešenie Chat with Your Data Solution Accelerator

**Repozitár**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Microsoft Foundry + Azure Container Apps (web/API/ingestia) + Azure AI Search s Cosmos DB alebo PostgreSQL s pgvector

**Popis**: Chatový urýchľovač založený na dokumentoch s citáciami. Súčasná ukážka hosťuje React frontend, FastAPI backend a Functions ingestion worker na Container Apps; možnosti orkestra sú Agent Framework a LangGraph. Výber databázy a spôsob vyhľadávania sa určuje pri nasadení. Je to východiskový bod, nie hotový produkčný systém; nepredpokladajte, že staršie varianty App Service, Semantic Kernel alebo Prompt Flow opisujú aktuálny predvolený stav.

**Rýchly štart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI cestovné agenti – multiagentná MCP orchestrácia

**Repozitár**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP servery (.NET, Python, Java, TypeScript)

**Popis**: Referenčná aplikácia pre multi-agentnú AI orchestráciu používajúca tri frameworky (LangChain.js, LlamaIndex.TS a Microsoft Agent Framework). Obsahuje MCP (Model Context Protocol) servery vo štyroch jazykoch nasadené ako serverless Azure Container Apps s OpenTelemetry monitorovaním.

**Rýchly štart**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Prezrite si ďalšie šablóny**: Navštívte [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pre aktuálne dostupné šablóny v rôznych jazykoch a scenároch. Každý prepojený príklad je externý repozitár, nie lokálny príklad poskytnutý týmto kurzom; pred nasadením si preskúmajte jeho aktuálne požiadavky a výrobné usmernenia.

## Ďalšie kroky

1. **Vyskúšajte príklady**: Začnite so šablónou, ktorá zodpovedá vášmu prípadu použitia
2. **Prispôsobte si ju**: Modifikujte infraštruktúru a aplikačný kód
3. **Pridajte monitorovanie**: Implementujte komplexnú pozorovateľnosť
4. **Optimalizujte náklady**: Doladte konfigurácie podľa vášho rozpočtu
5. **Zaistite svoje nasadenie**: Implementujte podnikové bezpečnostné vzory
6. **Rozšírte na produkciu**: Pridajte multi-regionálne a vysoko dostupné funkcie

## 🎯 Praktické cvičenia

### Cvičenie 1: Nasadenie Microsoft Foundry Models Chat App (30 minút)
**Cieľ**: Nasadiť a otestovať referenčnú AI chat aplikáciu

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

**Kritériá úspešnosti:**
- [ ] Nasadenie prebehne bez chýb kvóty
- [ ] Môže sa otvoriť chat rozhranie v prehliadači
- [ ] Môže klásť otázky a dostať odpovede poháňané AI
- [ ] Application Insights ukazuje telemetrické dáta
- [ ] Úspešne vyčistiť zdroje

**Náklady:** Pred nasadením si prezrite aktuálny návod na náklady a vybrané SKU. Fakturácia pokračuje, kým nie sú zdroje vymazané; neexistuje pevný 30-minútový odhad platný pre všetky konfigurácie.

### Cvičenie 2: Konfigurácia nasadenia viacerých modelov (45 minút)
**Cieľ**: Nasadiť viaceré AI modely s rôznymi konfiguráciami

**Východiskový bod:** Existujúci Azure OpenAI účet a modul AZD group-resources, ktorý môže volať tento súbor. Vytvorte `infra/ai-models.bicep` s nasledujúcim obsahom pomocou vášho editora. Nie je automaticky nasadený len preto, že je pod `infra/`.

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

Z modulu scoped na resource-group vlastniaceho účet pridajte volanie modulu (prispôsobte symbol názvu vášmu skutočnému účtu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nenapínajte rovnaké nasadenia v oboch moduloch. Ak je vstupný bod AZD scoped na subscription, zavolajte to z jeho dieťaťa scoped na resource-group a upravte relatívnu cestu. Postavte tento obsahujúci modul s `az bicep build --file <path-to-containing-module>`, potom:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kritériá úspešnosti:**
- [ ] Viaceré modely úspešne nasadené
- [ ] Aplikované rôzne nastavenia kapacity
- [ ] Modely dostupné cez API
- [ ] Môžu volat oba modely z aplikácie

### Cvičenie 3: Implementácia monitorovania nákladov (20 minút)
**Cieľ**: Nastaviť upozornenia rozpočtu a sledovanie nákladov

**Východiskový bod:** Vzor rozpočtu uvedený vyššie a infraštruktúrny modul scoped na resource-group. Pridajte tento zdroj pomocou editora; odovzdajte `budgetStartDate` cez mapovanie parametrov (neduplikujte parameter, ak je už deklarovaný). Nahraďte príjemcu a potvrďte, že máte práva na zápis rozpočtu.

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

Očakávané: odpoveď obsahuje `amount: 200`, oba prahy a vášho príjemcu. Skontrolujte Cost Management v portáli pre aktuálne náklady; údaje o nákladoch sú oneskorené a počas krátkeho cvičenia nemusí alert vyvolať.

**Kritériá úspešnosti:**
- [ ] V Azure vytvorený alert na rozpočet
- [ ] Konfigurované e-mailové upozornenia
- [ ] Môže sa pozrieť na údaje o nákladoch v Azure Portáli
- [ ] Správne nastavené prahy rozpočtu

## 💡 Často kladené otázky

<details>
<summary><strong>Ako znížiť náklady Microsoft Foundry Models počas vývoja?</strong></summary>

1. **Skontrolujte ceny**: Neexistuje univerzálny mesačný bezplatný limit 50 000 tokenov pre Azure OpenAI modely
2. **Nastavte správnu kapacitu**: Kapacita `10` zvyčajne predstavuje 10 000 TPM pre tieto štandardné textové modely, nie 10 TPM. Zníženie tohto limitu neovplyvní cenu za tokeny
3. **Použite azd down**: Vymažte dočasné zdroje, keď aktívne nevyvíjate (nie je to deallokácia)
4. **Cache odpovede**: Implementujte Redis cache pre opakované dotazy
5. **Použite prompt engineering**: Znížte využitie tokenov efektívnymi promptmi

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Aký je rozdiel medzi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnosť a súlad
- Integrácia súkromnej siete
- SLA záruky
- Autentifikácia spravovanou identitou
- Vyššie dostupné kvóty

**OpenAI API**: Samostatný poskytovateľ / API s vlastnou dostupnosťou modelov, cenami, autentifikáciou a možnosťami podnikovej konektivity. Porovnajte aktuálne ponuky namiesto predpokladania, že ide o internet verejnej siete alebo že modely vždy prídu ako prve.

Vyberajte podľa potrieb vašej organizácie; príklady spravovanej identity špecifické pre Azure a private-link v tomto kurze sa vzťahujú na služby hostené Azure, nie na každý model/poskytovateľa v katalógu Foundry.
</details>

<details>
<summary><strong>Ako riešiť chyby prekročenia kvóty Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Môžem použiť vlastné dáta s Microsoft Foundry Models?</strong></summary>

Áno! Použite **Azure AI Search** pre RAG (Retrieval Augmented Generation):

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

Pozrite sa na šablónu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Ako zabezpečím koncové body AI modelov?</strong></summary>

**Najlepšie postupy**:
1. Používajte Managed Identity (žiadne API kľúče)
2. Povoliť Private Endpoints
3. Nakonfigurujte skupiny zabezpečenia siete
4. Implementujte obmedzenie rýchlosti (rate limiting)
5. Použite Azure Key Vault pre tajné údaje

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
- **AZD GitHub**: [Problémy a diskusie](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiálna dokumentácia](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Inštalujte schopnosti Azure + Foundry agenta vo vašom editore cez `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-First vývoj
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia kapitola**: [AI agenti](agents.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa k diskusiám v našej komunite alebo otvorte problém v repozitári. Komunita Azure AI + AZD je tu, aby vám pomohla uspieť!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->