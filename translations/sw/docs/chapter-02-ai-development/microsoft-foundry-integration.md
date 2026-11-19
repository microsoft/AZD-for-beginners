# Muunganiko wa Microsoft Foundry na AZD

**Mpangilio wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Sura ya Awali**: [Sura ya 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Wakala wa AI](agents.md)
- **🚀 Sura Ifuatayo**: [Sura ya 3: Mpangilio](../chapter-03-configuration/configuration.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Microsoft Foundry na Azure Developer CLI (AZD) kwa utaratibu rahisi wa kuweka na kuendesha programu za AI. Microsoft Foundry hutoa jukwaa kamili la kujenga, kuweka kwenye uendeshaji, na kusimamia programu za AI, wakati AZD hurahisisha mchakato wa miundombinu na uendeshaji.

## Microsoft Foundry ni nini?

Microsoft Foundry ni jukwaa linalounganika la maendeleo ya AI la Microsoft linalojumuisha:

- **Katalogi ya Modeli**: Ufikiaji wa modeli za AI za kisasa
- **Mtiririko wa Prompt**: Mbunifu wa kuona kwa mitiririko ya AI
- **Portal ya Microsoft Foundry**: Mazingira ya maendeleo yaliyojumuishwa kwa programu za AI
- **Chaguzi za Utekelezaji**: Chaguzi nyingi za kuwahudumia na kupanua
- **Usalama na Ulinzi**: Sifa za AI yenye uwajibikaji zilizojengwa ndani

## AZD + Microsoft Foundry: Wana Faida Zaidi Pamoja

| Kipengele | Microsoft Foundry | Faida ya Muunganiko wa AZD |
|---------|-----------------|------------------------|
| **Utekelezaji wa Modeli** | Utekelezaji wa portal kwa mkono | Utekelezaji wa kiotomatiki, unaorudiwa |
| **Miundombinu** | Mpangilio wa mradi na rasilimali | Anza kutoka `azure.yaml`; toa Bicep au Terraform unapohitajika |
| **Usimamizi wa Mazingira** | Kuzingatia mazingira moja | Mazingira mengi (dev/staging/prod) |
| **Muungano wa CI/CD** | Huduma za utekelezaji na tathmini | Tumia tena mpangilio kwenye GitHub Actions au Azure DevOps |
| **Usimamizi wa Gharama** | Ufuatiliaji wa msingi | Uboreshaji wa gharama kwa mazingira maalum |

## Masharti ya Awali

- Usajili wa Azure wenye ruhusa zinazofaa
- Azure Developer CLI 1.37.0 au zaidi kwa mtiririko wa kazi wa Foundry GA
- Ufikiaji wa huduma za Microsoft Foundry Models
- Uelewa wa msingi wa Microsoft Foundry

> **Sasisho la Foundry GA (2026-11-09):** Kiambatisho cha `microsoft.foundry` kilifikia toleo 1.0 na upatikanaji wa jumla tarehe [5 Novemba, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Mwongozo huu unafuata tangazo hilo na mwanzo wa haraka wa Microsoft Learn uliounganishwa. Hii ni ukaguzi wa nyaraka, si uthibitisho wa utekelezaji wa moja kwa moja. Vipengele vya awali vya hiari na viambatisho vilivyotolewa kwa kujitegemea bado vina hadhi zao za utoaji.

**Matokeo ya Kujifunza:** Sakinisha kifurushi cha GA, angalia `azure.yaml` ya wakala, linganisha majibu ya ndani na yaliyotekelezwa, na eleza mipaka ya tathmini, CI/CD, na usafishaji. Kwa hatua kwa hatua ya utekelezaji wa wakala, nenda kwenye [mwongozo wa wakala aliyehifadhiwa](#hosted-agent-walkthrough-ga). Vifungu vya rasilimali hapo chini vinashughulikia mifumo mingine ya muunganiko.

## Mifumo ya Msingi ya Muunganiko

**Upeo wa mifano:** Bicep hapo chini ina vipande vya rasilimali vinavyoonyesha, si templeti kamili inayoweza kutekelezwa. Templeti inayoshikilia lazima itaje majina, `location`, rasilimali zinazotajwa, utambulisho, matokeo, na mwenyeji wa programu. Tumia sampuli iliyounganishwa kama mwanzo wa utekelezaji. Mifano ya Bash inahitaji uthibitishaji wa Azure CLI tofauti na `azd auth login`.

### Mfano 1: Muunganiko wa Microsoft Foundry Models

**Matumizi**: Tekeleza programu za mazungumzo na modeli za Azure OpenAI katika Microsoft Foundry

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

**Miundombinu (main.bicep):**
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

Mpigaji lazima awe na kitambulisho kilichounganishwa kinachosimamiwa na `Cognitive Services OpenAI User` kwenye kiwango cha akaunti; kuzima funguo hakutoa ufikiaji. Hakiki upatikanaji wa mkoa/modeli/SKU na kiwango kabla ya utekelezaji.

### Mfano 2: Muunganiko wa Utafutaji wa AI + RAG

**Matumizi**: Tekeleza programu za kizazi kilichoongezwa na upokezi (RAG)

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

Hakuna rasilimali ya ARM ya `Microsoft.Search/searchServices/dataConnections` kwa muunganiko huu. Sanidi kiashiria cha Utafutaji, chanzo cha data, indexer/skillset au vectorizer kupitia API zilizoidhinishwa za usemi wa data wa Utafutaji. Ikiwa Utafutaji unaita modeli ya embedding, wezesha kitambulisho chake kinachosimamiwa, na mkabidhi jukumu la modeli husika, na sanidi ujuzi wa embedding/vectorizer. Angalia [umeunganisha vectorization](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mfano 3: Muunganiko wa Akili ya Hati

**Matumizi**: Mitiririko ya usindikaji na uchambuzi wa hati

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

## 🔧 Mifumo ya Mpangilio

### Mpangilio wa Vigezo vya Mazingira

Isipokuwa mipangilio ya AZD iliyodokumentwa kama `AZURE_LOCATION`, hizi ni **majina ya pembejeo ya templeti maalum**. Haya hayaathiri isipokuwa templeti/ programu inavitumia kupitia ramani za vigezo na mazingira ya mwenyeji. Kwa `azure-search-openai-demo`, tumia majina halisi kama `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` na `AZURE_SEARCH_SERVICE_SKU` badala yake. Uwezo wa modeli sio SKU ya akaunti.

**Mpangilio wa Uzalishaji:**
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

**Mpangilio wa Maendeleo:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Usalama wa Mpangilio kwa Key Vault

Pendelea Entra ID na uthibitishaji wa funguo wa ndani uliozimwa. Ifuatayo ni **mbadala wa zamani wa uthibitishaji wa funguo** kwa programu zinazo hitaji funguo: inahitaji akaunti yenye uthibitishaji wa funguo umewezeshwa, kitambulisho cha programu kilichoambatishwa na mwenyeji wake, na ufikiaji/mtandao wa Key Vault unaofanya kazi. Usichanganye upokeaji wa funguo na `disableLocalAuth: true` na usitarajia simu za kutumia funguo zifanye kazi.

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

## Mtiririko wa Kuweka Kwenye Utekelezaji

### Ongeza za AZD kwa Foundry

Kwa mtiririko wa kazi wa GA, sakini kifurushi cha `microsoft.foundry` badala ya kukusanya viambatisho vya msingi moja baada ya nyingine:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Kifurushi huweka wakala, muunganisho, msuli, miradi, taratibu, ujuzi, na masanduku ya zana. Hakiongezi kundi la amri la `microsoft.foundry`. Tathmini, seti za data, urekebishaji, na modeli maalum hutaswa kutengwa inapohitajika. Angalia [marejeleo ya ufungaji wa viambatisho](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Mwongozo wa Wakala Aliyehifadhiwa (GA)

**Wakala aliyehifadhiwa** huendesha nambari yako ya wakala kwenye kompyuta inayosimamiwa na Foundry. Zoee hili linatumia sampuli ya API ya Majibu ya Mfumo wa Wakala wa Python wa msingi wa awali, si vipande vya SDK vya Huduma za Wakala vya kihistoria katika somo jingine.

#### 1. Andaa na anzisha

Tumia saraka tupu nje ya sehemu hii ya kozi iliyopakuliwa. Sakinisha Python 3.13 au zaidi na toleo la hivi karibuni la [uv](https://docs.astral.sh/uv/getting-started/installation/). Ufungaji huru wa uv unaweza kutumia `uv self update`. Kagua [ruksa za wakala aliyehifadhiwa](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), upatikanaji wa modeli, na kiwango katika usajili na mkoa kabla ya upangaji. Rasilimali za Azure na simu za modeli za ndani husababisha gharama.

Kamilisha ufungaji wa `azd auth login` na kifurushi hapo juu. Nambari ya sampuli ya ndani hutumia `DefaultAzureCredential`; ikiwa unatumia vitambulisho vya Azure CLI, ingia kwa kutumia `az login` ukitumia akaunti na mtemi sawa na AZD. Kuingia kwa AZD pekee si kuingia kwa Azure CLI.

Endesha amri hii ya mstari mmoja katika Bash au PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Chagua mradi mpya au uliopo wa Foundry na usajili na mkoa unaokusudia. Ili kutumia tena utekelezaji wa modeli, ongeza `--model-deployment <existing-deployment-name>` kwenye amri ya kutangiza **kabla ya kuiendesha**, na chagua mradi uliopo. Kaa ndani ya saraka inayoshikilia `azure.yaml` iliyotengenezwa kwa amri zinazofuata.

#### 2. Kagua ufafanuzi wa utekelezaji

Fungua `azure.yaml` na tafuta mipangilio hii katika [sampuli ya juu](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Mpangilio | Kitu cha kukagua |
|---------|---------------|
| `host: azure.ai.project` na `deployments` | Mradi uliokusudiwa wa Foundry na jina la modeli, toleo, SKU la utekelezaji, na uwezo |
| `host: azure.ai.agent` na `project` | Wakala aliyehifadhiwa na saraka inayoshikilia chanzo chake |
| `codeConfiguration` | Muda wa kuendesha wa Python na eneo la kuingia; sampuli iliyokaguliwa inatumia `python_3_13` na `main.py` |
| `uses` | Kutegemea huduma ya mradi wa Foundry |
| `container.resources` | Mgawanyo wa CPU na kumbukumbu, ingawa nambari imejengwa mbali |
| `env` | Ramani ya utekelezaji wa modeli na `PYTHONNOUSERSITE: "1"` kuzuia upakiaji wa kifurushi cha tovuti ya mtumiaji |
| `infra.provider` | `microsoft.foundry`, inayochanganya miundombinu inayohitajika |

Thibitisha uchambuzi wa `azure.yaml` na nambari ya wakala pamoja. Hakuna miundombinu iliyoandikwa kwa mkono inayohitajika kuanza; unapotaka faili za upangaji za kuhariri, fuata [kuondolewa kwa miundombinu](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) kwa Bicep au Terraform na endelea kutumia `azd provision`. Usijumuishe nyaraka au hali ya mazingira ya `.azure/`.

#### 3. Panga na jaribu kwa ndani

```bash
azd provision
azd ai agent run
```

Upangaji unaweza kuunda utekelezaji wa modeli uliokosekana **hata katika mradi uliotumika tena**. Kagua mashinikizo ya modeli na chagua aina inayopatikana ya utekelezaji wa mtandaoni kama Global Standard au Data Zone Standard; kiwango na usaidizi wa kikanda hutofautiana.

Kuendesha kwa ndani kunaandaa mategemeo na hufungua **Mchunguzi wa Wakala**, ambapo unaweza kuchunguza maombi, majibu, na shughuli za zana/modeli. Endelea kuendesha na fungua dirisha la pili katika saraka hiyo hiyo ya mradi:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Kagua:** Thibitisha unapata jibu linalofaa na unaweza kuchunguza shughuli ya ndani inayohusiana. Utekelezaji wa ndani bado huuita utekelezaji wa modeli wa Azure; si jaribio la nje au bure. Tumia mashinikizo ya bandia na epuka kuonyesha siri au data nyeti katika matokeo ya mchunguzi.

#### 4. Tekeleza na linganisha

Simamisha utendaji wa ndani kwa Ctrl+C ukimaliza. Kabla ya mwito wa mbali, sanidi au thibitisha [muunganisho wa Application Insights na ufikiaji wa msimbo wa mfuatiliaji wa mradi](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Katika hali ya utekelezaji wa nambari, AZD hutuma chanzo kwa ujenzi wa mbali wa Foundry; hautaji ujenzi wa chombo cha ndani kwa njia hii. Matokeo ya utekelezaji hutoa viungo vya mapumziko na sehemu ya mwisho. Hakiki jibu kutoka kwa wakala aliyewekwa na mfuatiliaji wake wa wingu; matukio ya mchunguzi wa ndani pekee hayaonyeshi ufuatiliaji wa wingu unavyofanya kazi.

Kwa mabadiliko yajayo, kagua usanidi wa wakala aliyehifadhiwa unaounga mkono na `azd deploy --preview`. Ongea rekodi na `azd ai agent monitor --follow`, au gundua matatizo ya usanidi na ufikiaji kwa `azd ai agent doctor`. Mwonekano wa utekelezaji si mapitio kamili ya miundombinu au usalama.

#### 5. Ongeza ukaguzi wa ubora unaorudiwa

Sakinisha kiendelezi cha tathmini kilichotolewa kwa kujitegemea, kisha tengeneza rasimu ya vipengee vya mtihani:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Eleza tabia inayokusudiwa ya wakala na chagua **Seti ya Data na mtathmini**, kisha **Geuza**. Kagua na hariri kesi zilizotengenezwa pamoja na kauli ya alama, ikiwa ni pamoja na kesi ya swali lisilounga mkono, kabla ya kusanidi tathmini:

```bash
azd ai eval init --name quality
```

Chagua seti ya data iliyokaguliwa na kauli na thibitisha utekelezaji wa modeli wa mjahimu. Chunguza `evals/azure.eval.yaml` na rejea yake ya huduma ya tathmini katika `azure.yaml`, kisha jisajili vipengee na fanya utekelezaji:

```bash
azd up
azd ai eval run start --eval quality
```

Kagua alama na kesi zilizofaulu duni au zenye makosa; tathmini iliyokamilika si moja kwa moja kupita ubora. Uundaji na kulinganisha pia husababisha gharama za modeli. Jisajili usanidi usio wa siri, seti za data, na kauli ili wenzako waweze kulinganisha mabadiliko. `azd ai agent optimize` inaweza kutumia tena tathmini inayofanana kama msingi, lakini hakiki wagombea kabla ya kutekeleza moja wazi. Angalia [mizinga ya ubora na uhamisho](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) kwa miradi ya zamani na CI.

#### 6. Tumia tena mtiririko wa kazi katika CI/CD

Baada ya `azd up` kufanikisha, endesha `azd pipeline config` na kagua mtiririko wa kazi wa GitHub Actions au Azure DevOps uliotengenezwa. Sakinisha `microsoft.foundry` kwenye mtekaji, pamoja na `azure.ai.evaluations` ikiwa unafanya tathmini. Hifadhi usanidi wa kujiondoa, kuingia, na mazingira; ufungaji pekee hauthibitishi njia ya mchakato.

Tumia mazingira ya AZD tofauti kwa kila hatua, wape kitambulisho cha njia ya mchakato ruhusa za rasilimali na Foundry zinazohitajika, na hifadhi nyaraka kwa siri za njia ya mchakato au tumia kitambulisho kinachoshirikishwa. Jisajili vipengee vya tathmini na thibitisha kitambulisho kinaweza kufikia seti za data/matathmini yaliyotajwa. Angalia [mfano wa njia ya mchakato wa kozi](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) na [mwongozo wa Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Safisha kwa makusudi

Kwa **mradi mpya ulioundwa na mazingira haya**, kagua rasilimali zilizoorodheshwa na `azd down` kabla ya kuthibitisha: inafuta kundi la rasilimali na kila kitu kilicho ndani yake.

Kwa **mradi uliotumika tena**, `azd down` huacha mradi, wakala aliyehifadhiwa, na rasilimali nyingine mahali pake. Ondoa tu rasilimali zisizohitajika unazomiliki kwa kutumia [miongozo ya usafishaji wa mwanzo](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); usifute kundi la rasilimali linaloshirikiwa kusafisha zoee moja.

**Ukaguzi wa kumaliza:** Eleza mipangilio inayodhibiti tabia za ndani na za wingu, onyesha majibu ya ndani na yaliyotekelezwa, kagua matokeo ya tathmini, na bainisha rasilimali zipi zinaendelea baada ya usafishaji.

### Hiari: Tengeneza mfano na Ujuzi wa Microsoft Foundry

Sakinisha [Ujuzi wa Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) kwa mwenyeji wa wakala wako wa kuandika nambari, kisha fungua folda tupu tofauti. Muombe aandae sampuli ya msingi ya API ya Majibu ya Mfumo wa Wakala wa Python katika hali ya utekelezaji wa nambari, eleza `azure.yaml` iliyotengenezwa, na pendekeza usajili, mkoa, mradi, na utekelezaji wa modeli. Hitaji idhini **kabla ya kuunda rasilimali za Azure**, omba jaribio la ndani, na simamisha kabla ya utekelezaji. Kagua matokeo yake na endelea na hatua za utekelezaji hapo juu tu wakati uko tayari.

Kwa miradi iliyopo, `--template`/`-t` inachukua nafasi ya tahajia iliyookolewa ya `--manifest`/`-m`; kubadilisha bendera hakupeleki maandishi ya kale au usanidi wa wakala ulioko ndani. Angalia [marejeleo ya AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Utekelezaji wa Amri Moja

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Utekelezaji Maalum kwa Mazingira

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

## Ufuatiliaji na Uwezo wa Kuona

### Uunganisho wa Application Insights

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

Hii inatengeneza rasilimali ya Insights, si kifaa cha upimaji telemetry. Mara tu programu yako itakapotoa milio ya simu za mfano zinazotoka, fanya swali hili la mfano katika Rekodi za Application Insights (rekebisha kichujio kwa majina halisi ya milio yako):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Ufuatiliaji wa Gharama

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

Tumia mpokeaji halisi na hakikisha una ruhusa za eneo la bili. Bajeti hutuma arifa; si kikomo cha matumizi.

## 🔐 Mazoea Bora ya Usalama

### Usanidi wa Utambulisho Uliofadhiliwa

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

### Usalama wa Mtandao

Kipande hiki cha mwisho cha huduma pia kinahitaji eneo/kikundi cha DNS kibinafsi, viungo vya VNet, muunganisho wa programu kwa VNet, na sera ya wazi ya upatikanaji wa umma. Kuunda sehemu binafsi pekee hakufanyi upatikanaji wa umma kuzimwa.

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

## Uboreshaji wa Utendaji

### Mikakati ya Kuhifadhi Kache

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

Azure Cache kwa Redis Basic/Standard/Premium iko kwenye [njia ya kuondoka](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); tumia Azure Managed Redis kwa utekelezaji mpya na fuata mwongozo wake wa sasa wa mfano/uthibitishaji. Fafanua majibu ya AI yaliyohifadhiwa kwa idhini, mfano/maelekezo, na toleo la data, pamoja na muda wa kumalizika; usishiriki majibu binafsi ukitumia tu maandishi ya swali.

### Usanidi wa Kuongeza Kasi Kiotomatiki

**Rasilimali ya Sehemu:** Changanya mipangilio hii ya upanuzi/mwangizaji katika Programu Kamili ya Kontena yenye mazingira yaliyosimamiwa, picha ya kontena, na mipaka ya rasilimali. Nakala zaidi haziongezi ukubwa wa kategoria ya mfano.

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

## Kutatua Masuala ya Kawaida

### Tatizo 1: Kiwango cha OpenAI Kimezidiwa

**Dalili:**
- Utekelezaji unashindwa kwa makosa ya kiwango
- Makosa ya 429 katika rekodi za programu

**Suluhisho:**
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

Kigezo cha uwezo kilicho hapo juu kinahusu tu mfano wa kibinafsi uliounganishwa kiasi hicho. Kwa sampuli ya RAG, tumia `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Usibadilishe `AZURE_LOCATION` kuhamisha rasilimali zilizopo mahali pake; tengeneza mazingira tofauti kwa mkoa mpya na panga uhamisho/usafishaji.

### Tatizo 2: Kushindwa Kuingia Kwenye Huduma

**Dalili:**
- Makosa ya 401/403 wakati wa kuita huduma za AI
- Ujumbe wa "Upatikanaji umekataliwa"

**Suluhisho:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Tatizo 3: Masuala ya Utekelezaji wa Mfano

**Dalili:**
- Mifano haipatikani katika utekelezaji
- Toleo maalum la mfano linashindwa

**Suluhisho:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Mifano ya Violezo

Hizi ni mbadala, sio amri mfululizo. Anza kila moja katika saraka tupu tofauti. Mahali pa wazi pa `.` huhifadhi uanzishaji katika saraka yako ya sasa; vinginevyo AZD ya sasa inaweza kuunda saraka ndogo ya jina la mfano bila kubadili saraka ya kazi ya shell yako.

### Programu ya Mazungumzo ya RAG (Python)

**Hifadhidata**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Maelezo**: Programu ya mfano ya mazungumzo ya RAG kwa maswali juu ya nyaraka zako, kwa kutumia upatikanaji wa Azure AI Search. Pitia mifano ya sasa ya michoro inayoungwa mkono, vipengele vya hiari, mwongozo wa gharama, na kuimarishwa kwa uzalishaji kabla ya matumizi; kutekeleza mfano hakufanyi programu kuwa tayari kwa uzalishaji.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Programu ya Mazungumzo ya RAG (.NET)

**Hifadhidata**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Maelezo**: Sawia ya .NET/C# ya sampuli ya mazungumzo ya RAG ya Python. Imetengenezwa na ASP.NET Core Minimal API na Blazor WebAssembly mbele. Inajumuisha mazungumzo ya sauti, msaada wa GPT-4o-mini vision, na mteja mwandamizi wa .NET MAUI Blazor Hybrid wa desktop/mkononi.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Programu ya Mazungumzo ya RAG (Java)

**Hifadhidata**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Maelezo**: Toleo la Java la sampuli ya mazungumzo ya RAG likitumia Langchain4J kwa upangaji wa AI. Inaunga mkono usanifu wa huduma ndogo unaoendeshwa na matukio, mikakati mingi ya utafutaji (maandishi, vector, mchanganyiko), upakiaji wa nyaraka kwa Azure Document Intelligence, na utekelezaji kwenye Azure Container Apps au Azure Kubernetes Service.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Msaidizi wa Masoko wa Biashara na Microsoft Foundry

**Hifadhidata**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Huduma**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Maelezo**: Msaidizi wa RAG wa rejareja wa kuanzia mpaka kumaliza akitumia Microsoft Foundry na Prompty. Chatbot ya Contoso Outdoor inayotegemea majibu katika kategoria ya bidhaa na data za oda za wateja. Inaonyesha mchakato kamili wa GenAIOps — mfano na Prompty, tathmini na watahiniwa wa kusaidia AI, na utekelezaji kupitia AZD hadi Container Apps.

**Anza Haraka**:
```bash
azd init --template contoso-chat .
azd up
```

### Programu ya Waandishi Wanaoendeshwa na Wakala Wengi

**Hifadhidata**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Huduma**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Maelezo**: Sampuli ya wakala wengi ikionyesha upangaji wa wakala wa AI na Prompty. Inatumia wakala wa utafiti (Bing Grounding katika Azure AI Agent Service), wakala wa bidhaa (Azure AI Search), mwandishi, na mhariri kushirikiana kuunda makala zilizo na utafiti mzuri. Inajumuisha CI/CD na tathmini katika GitHub Actions.

**Anza Haraka**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Mazungumzo Isiyo na Server (JavaScript/TypeScript)

**Hifadhidata**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Huduma**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB kwa NoSQL + LangChain.js

**Maelezo**: Chatbot kamili isiyo na server ya RAG ikitumia LangChain.js na Azure Functions kwa API na Azure Static Web Apps kwa mwenyeji. Inatumia Azure Cosmos DB kama duka la vector na hifadhidata ya historia ya mazungumzo. Inasaidia maendeleo ya ndani na Ollama kwa upimaji wa gharama sifuri.

**Anza Haraka**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Kihariri Mazungumzo na Data Yako

**Hifadhidata**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Huduma**: Microsoft Foundry + Azure Container Apps (mtandao/API/ingestion) + Azure AI Search na Cosmos DB, au PostgreSQL na pgvector

**Maelezo**: Kihariri mazungumzo kilichotegemea nyaraka na marejeleo. Sampuli ya sasa ina mwenyeji wa mbele wa React, mgongoni wa FastAPI, na mfanyakazi wa ingestion kwenye Container Apps; chaguzi za mpangilio ni Agent Framework na LangGraph. Chaguzi za hifadhidata/upatikanaji hutengwa wakati wa utekelezaji. Ni sehemu ya kuanzia, si mfumo kamili wa uzalishaji; usidhani toleo la zamani la App Service, Semantic Kernel, au Prompt Flow ni chaguo la sasa.

**Anza Haraka**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Wakala wa Kusafiri wa AI — Uandaaji wa Wakala Wengi MCP

**Hifadhidata**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Huduma**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Maelezo**: Programu ya rejareja kwa upangaji wa wakala wengi wa AI ikitumia mifumo mitatu (LangChain.js, LlamaIndex.TS, na Microsoft Agent Framework). Inajumuisha seva za MCP (Model Context Protocol) katika lugha nne zikiwekwa kama Azure Container Apps zisizo na server na ufuatiliaji wa OpenTelemetry.

**Anza Haraka**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Tafuta majalada zaidi**: Tembelea [Kukusanya Violezo vya Ajabu vya AZD AI](https://azure.github.io/awesome-azd/?tags=ai) kwa violezo vinavyopatikana sasa kwa lugha na hali mbalimbali. Kila mfano uliounganishwa ni hifadhidata ya nje, si mfano wa eneo wa kozi hii; hakiki masharti na mwongozo wa uzalishaji kabla ya utekelezaji.

## Hatua Zifuatazo

1. **Jaribu Mifano**: Anza na muundo uliotengenezwa tayari unaolingana na matumizi yako
2. **Fanya Kila Kitu Kiwe Maalum Kwa Mahitaji Yako**: Badilisha miundombinu na msimbo wa programu
3. **Ongeza Ufuatiliaji**: Tekeleza uangaliaji mpana
4. **Boresha Gharama**: Rekebisha mipangilio kwa bajeti yako
5. **Linda Utekelezaji Wako**: Tekeleza mifumo ya usalama wa biashara
6. **Panua Uzalishaji**: Ongeza vipengele vya mikoa mingi na upatikanaji wa juu

## 🎯 Mazoezi ya Vitendo

### Zoefu 1: Tekeleza Programu ya Mazungumzo ya Microsoft Foundry Models (Dakika 30)
**Lengo**: Tekeleza na jaribu programu ya rejeleo ya mazungumzo ya AI

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

**Vigezo vya Mafanikio:**
- [ ] Utekelezaji umekamilika bila makosa ya kiwango
- [ ] Inawezekana kufikia kiolesura cha mazungumzo kwa kivinjari
- [ ] Inaweza kuuliza maswali na kupata majibu yanayochochewa na AI
- [ ] Application Insights inaonyesha data ya telemetry
- [ ] Rasilimali zimefanyiwa usafi kwa mafanikio

**Gharama:** Kagua mwongozo wa gharama wa sampuli ya sasa na vitengo vilivyochaguliwa kabla ya utekelezaji. Malipo yanaendelea mpaka rasilimali zifutwe; hakuna makadirio thabiti ya dakika 30 inayotumika kwa mipangilio yote.

### Zoefu 2: Sanidi Utekelezaji wa Mifano Mingi (Dakika 45)
**Lengo**: Tekeleza mifano mingi ya AI yenye usanidi tofauti

**Mahali pa kuanzia:** Akaunti ya Azure OpenAI iliyopo na moduli ya kikundi cha rasilimali cha AZD inayoweza kuita hili faili. Tengeneza `infra/ai-models.bicep` na yaliyomo yafuatayo ukitumia mhariri wako. Hii haiutekelezwi kiotomatiki kwa sababu tu iko ndani ya `infra/`.

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

Kutoka kwa moduli inayomiliki kikundi cha rasilimali kinachoendana na akaunti, ongeza wito wa moduli (rekebisha jina la alama kwa akaunti yako halisi):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Usitangaze utekelezaji sawa katika moduli zote mbili. Ikiwa sehemu ya kuingilia ya AZD ni ya maeneo, itaamsha hii kutoka kwa moduli ndogo inayomiliki kikundi cha rasilimali na rekebisha njia ya uhusiano. Tengeneza moduli inayoyahudumia na `az bicep build --file <path-to-containing-module>`, kisha:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Vigezo vya Mafanikio:**
- [ ] Mifano mingi imetekelezwa kwa mafanikio
- [ ] Mipangilio tofauti ya uwezo imetumika
- [ ] Mifano inapatikana kupitia API
- [ ] Inaweza kuita mifano yote miwili kutoka kwa programu

### Zoefu 3: Tekeleza Ufuatiliaji wa Gharama (Dakika 20)
**Lengo**: Sanidi arifu la bajeti na ufuatiliaji wa gharama

**Mahali pa kuanzia:** Mfano wa bajeti hapo juu na moduli ya miundombinu iliyopangwa kwa kikundi cha rasilimali. Ongeza rasilimali hii ukitumia mhariri wako; pita `budgetStartDate` kutoka kwa ramani ya vigezo vyako (usiirudie parameter ikiwa tayari imetangazwa). Badilisha mpokeaji na hakikisha una ruhusa ya kuandika bajeti.

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

Kinachotarajiwa: jibu lina `amount: 200`, vizingiti vyote viwili, na mpokeaji wako. Kagua Usimamizi wa Gharama katika lango kwa malipo halisi; data ya gharama huchukua muda na arifa haipaswi kuwaka wakati wa zoefu fupi.

**Vigezo vya Mafanikio:**
- [ ] Arifa ya bajeti imetengenezwa katika Azure
- [ ] Arifa za barua pepe zimesanidiwa
- [ ] Inawezekana kuona data ya gharama katika Azure Portal
- [ ] Vizingiti vya bajeti vimewekwa ipasavyo

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Ninawezaje kupunguza gharama za Microsoft Foundry Models wakati wa maendeleo?</strong></summary>

1. **Kagua bei**: Hakuna mfuko wa bure wa tiketi 50,000 kwa mwezi kwa mfano wa Azure OpenAI
2. **Chagua uwezo unaofaa**: Uwezo `10` kawaida unaonyesha TPM 10,000 kwa mifano ya maandishi ya Standard, si TPM 10. Kupunguza kiwango hiki hakupunguzi bei kwa tiketi
3. **Tumia azd down**: Futa rasilimali zisizotumika wakati husitengenezwi (hii si kufuta kwa mara moja)
4. **Hifadhi Majibu**: Tekeleza kache ya Redis kwa maswali yanayojirudia
5. **Tumia Mbinu za Prompt Engineering**: Punguza matumizi ya tiketi kwa maandishi bora

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Tofauti gani kati ya Microsoft Foundry Models na OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Usalama wa biashara na uzingatiaji
- Muunganisho wa mtandao wa binafsi
- Dhamana za SLA
- Uthibitishaji wa utambulisho uliofadhiliwa
- Kiwango kikubwa zaidi kinapatikana

**OpenAI API**: Mtoa huduma/APi tofauti yenye upatikanaji wake wa mfano, bei, uthibitishaji, na chaguzi za muunganisho wa biashara. Linganisha ofa za sasa badala ya kudhani ni za mtandao wa umma tu au daima huhamisha mifano kwanza.

Chagua kulingana na mahitaji ya shirika lako; mifano ya utambulisho uliofadhiliwa na mfano wa viungo vya binafsi vya Azure katika kozi hii inahusu huduma za Azure, si kila mfano/mtoa huduma katika katalogi ya Foundry.
</details>

<details>
<summary><strong>Ninawezaje kushughulikia makosa ya kipimo kilichozidiwa ya Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Ninaweza kutumia data yangu mwenyewe na Microsoft Foundry Models?</strong></summary>

Ndiyo! Tumia **Azure AI Search** kwa RAG (Mizidisho ya Utoaji wa Taarifa):

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

Tazama njia ya [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jinsi gani ninaweza kulinda sehemu za mwisho za mfano wa AI?</strong></summary>

**Mazingira Bora**:
1. Tumia Utambulisho Usimamiwa (bila funguo za API)
2. Washa Sehemu za Mwisho Binafsi
3. Sanidi vikundi vya usalama vya mtandao
4. Tekeleza ukomo wa kiwango cha maombi
5. Tumia Azure Key Vault kwa siri

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

## Jamii na Msaada

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Masuala na mijadala](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Nyaraka Rasmi](https://learn.microsoft.com/azure/ai-studio/)
- **Ujuzi wa Wakala**: [Ujuzi wa Microsoft Foundry kwenye skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Sakinisha ujuzi wa wakala wa Azure + Foundry katika mhariri wako ukitumia `npx skills add microsoft/github-copilot-for-azure`

---

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Sura ya Awali**: [Sura 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Wakala wa AI](agents.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na mijadala ya jamii yetu au fungua suala kwenye hifadhi. Jamii ya Azure AI + AZD iko hapa kukusaidia kufanikiwa!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->