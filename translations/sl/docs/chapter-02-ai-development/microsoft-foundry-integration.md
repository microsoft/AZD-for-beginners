# Microsoft Foundry integracija z AZD

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z umetno inteligenco kot prvo
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [AI agenti](agents.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ta vodič prikazuje, kako integrirati Microsoft Foundry storitve z Azure Developer CLI (AZD) za poenostavljene namestitve AI aplikacij. Microsoft Foundry zagotavlja celovito platformo za gradnjo, nameščanje in upravljanje AI aplikacij, medtem ko AZD poenostavlja infrastrukturo in postopek nameščanja.

## Kaj je Microsoft Foundry?

Microsoft Foundry je združena platforma Microsofta za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do najnovejših AI modelov
- **Prompt Flow**: Vizualni oblikovalec za AI delovne procese
- **Microsoft Foundry portal**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti nameščanja**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije odgovorne AI

## AZD + Microsoft Foundry: Bolje skupaj

| Funkcija | Microsoft Foundry | Prednost integracije z AZD |
|---------|-----------------|----------------------------|
| **Nameščanje modelov** | Ročno nameščanje preko portala | Avtomatizirane, ponovljive namestitve |
| **Infrastruktura** | Nastavitev projektov in virov | Začni z `azure.yaml`; po potrebi izvozi Bicep ali Terraform |
| **Upravljanje okolja** | Osredotočeno na eno okolje | Več okolij (dev/staging/prod) |
| **Integracija CI/CD** | Storitev za namestitev in evalvacijo | Ponovna uporaba konfiguracije v GitHub Actions ali Azure DevOps |
| **Upravljanje stroškov** | Osnovno spremljanje | Optimizacija stroškov za posamezno okolje |

## Predpogoji

- Azure naročnina z ustreznimi dovoljenji
- Azure Developer CLI verzija 1.37.0 ali novejša za GA Foundry delovni potek
- Dostop do Microsoft Foundry Models storitev
- Osnovno poznavanje Microsoft Foundry

> **Foundry GA posodobitev (2026-11-09):** Paket razširitve `microsoft.foundry` je dosegel verzijo 1.0 in splošno dostopnost  [5. novembra 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Spodnji vodnik sledi temu obvestilu in povezanim hitrim začetkom Microsoft Learn. To je pregled dokumentacije, ne pa preverjanje namestitve v živo. Neobvezne predogledne funkcije in samostojno izdane razširitve ohranjajo svoj status izida.

**Cilji učenja:** Namestiti GA paket, pregledati `azure.yaml` agenta, primerjati lokalne in nameščene odgovore ter pojasniti meje evalvacije, CI/CD in čiščenja. Za korak-po-korak namestitev agentov pojdite na [vodnik za gostujoče agente](#hosted-agent-walkthrough-ga). Spodnji delčki virov pokrivajo druge integracijske vzorce.

## Osnovni integracijski vzorci

**Obseg primerov:** Spodnji Bicep vsebuje ilustrativne dele virov, ne pa celotnega izvedljivega predloge. Vsebujejoča predloga mora definirati imena, `location`, referenčne vire, identitete, izhode in gostovanje aplikacij. Za zagon uporabite povezani primer. Bash primeri zahtevajo ločeno avtentikacijo Azure CLI od `azd auth login`.

### Vzorec 1: Integracija Microsoft Foundry Modelov

**Uporaba**: Namestitev klepetalnih aplikacij z Azure OpenAI modeli v Microsoft Foundry

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

Klicalec potrebuje pripeto upravljano identiteto in `Cognitive Services OpenAI User` na ravni računa; onemogočitev ključev ne podeli dostopa. Pred namestitvijo preverite razpoložljivost regije/modela/SKU in kvote.

### Vzorec 2: AI Iskanje + RAG integracija

**Uporaba**: Namestitev aplikacij za generacijo z izboljšano vrnitvijo (RAG)

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

Za to integracijo ne obstaja ARM vir `Microsoft.Search/searchServices/dataConnections`. Konfigurirajte Search indeks, podatkovni vir, indexer/skillset ali vektorizer prek podprtih Search data-plane API-jev. Če Search pokliče model za vektorizacijo, omogočite njegovo upravljano identiteto, dodelite ustrezno vlogo modela in konfigurirajte njegovo embedding skill/vektorizer. Glejte [integrirano vektorizacijo](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Vzorec 3: Integracija inteligence dokumentov

**Uporaba**: Delovni procesi za obdelavo in analizo dokumentov

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

## 🔧 Konfiguracijski vzorci

### Nastavitev okoljskih spremenljivk

Razen dokumentiranih AZD nastavitev, kot je `AZURE_LOCATION`, so to **vhodna imena po meri šablone**. Nimajo učinka, razen če jih šablona/aplikacija uporablja preko parametrov in preslikav gostiteljskega okolja. Za `azure-search-openai-demo` uporabite dejanska imena, kot sta `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` in `AZURE_SEARCH_SERVICE_SKU`. Kapaciteta modela ni SKU računa.

**Konfiguracija za produkcijo:**
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

**Konfiguracija za razvoj:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Varna konfiguracija s Key Vault

Prednost dajte Entra ID z lokalno avtentikacijo ključev onemogočeno. Naslednje je samo **zamikana alternativa avtentikacije preko ključev** za aplikacije, ki potrebujejo ključe: zahteva račun z omogočeno avtentikacijo ključev, identiteto aplikacije pripeto na njen gostitelj in delujoč dostop do Key Vault/a ter mrežne nastavitve. Ne kombinirajte pridobivanja ključev z `disableLocalAuth: true` in ne pričakujte, da bodo klici s ključi delovali.

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

## Delovni poteki nameščanja

### AZD razširitve za Foundry

Za GA delovni potek namestite paket `microsoft.foundry` namesto, da sestavljate osnovne razširitve eno po eno:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Paket namesti agente, povezave, inšpektorja, projekte, rutine, veščine in orodjarne. Ne doda skupine ukazov `microsoft.foundry`. Evalvacije, nizi podatkov, fino nastavljanje in prilagojeni modeli se namestijo ločeno po potrebi. Glejte [referenco pakiranja razširitev](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Vodnik za gostujočega agenta (GA)

**Gostujoči agent** izvaja vašo kodo agenta na računalništvu, ki ga upravlja Foundry. Ta vaja uporablja osnovni Python Agent Framework Responses API vzorec, ne klasične SDK fragmente Agent Service v drugih lekcijah.

#### 1. Priprava in inicializacija

Uporabite prazno mapo zunaj te izvorne mape tečaja. Namestite Python 3.13 ali novejši in aktualno [uv izdajo](https://docs.astral.sh/uv/getting-started/installation/). Samostojne uv namestitve lahko uporabijo `uv self update`. Pred namestitvijo preverite [dovoljenja gostujočega agenta](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), razpoložljivost modela in kvoto v vaši naročnini in regiji. Azure viri in lokalni klici modelov prinašajo stroške.

Dokončajte zgornjo namestitev `azd auth login` in paketa. Lokalna vzorčna koda uporablja `DefaultAzureCredential`; če uporabljate poverilnice Azure CLI, se prijavite z `az login` z istim računom in najemnikom kot AZD. Prijava le v AZD ni enaka prijavi v Azure CLI.

Zaženite ta ukaz v eni vrstici v Bash ali PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Izberite nov ali obstoječ Foundry projekt ter želeno naročnino in regijo. Za ponovno uporabo nameščanja modela dodajte `--model-deployment <existing-deployment-name>` v inicializacijski ukaz **pred njegovo izvedbo** in izberite obstoječ projekt. Ostanite v mapi, ki vsebuje generirani `azure.yaml` za naslednje ukaze.

#### 2. Pregled definicije namestitve

Odprite `azure.yaml` in poiščite te nastavitve v [zgornjem vzorcu](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Nastavitev | Kaj preveriti |
|---------|---------------|
| `host: azure.ai.project` in `deployments` | Namen projekta Foundry in ime modela, verzija, SKU namestitve in kapaciteta |
| `host: azure.ai.agent` in `project` | Gostujoči agent in mapa z njegovo izvorno kodo |
| `codeConfiguration` | Python runtime in vhodna točka; preučevani vzorec uporablja `python_3_13` in `main.py` |
| `uses` | Odvisnost od storitve Foundry projekta |
| `container.resources` | Dodelitev CPU-ja in pomnilnika, čeprav se koda izvaja oddaljeno |
| `env` | Preslikava namestitve modela in `PYTHONNOUSERSITE: "1"` za onemogočanje nalaganja paketov uporabniške lokacije |
| `infra.provider` | `microsoft.foundry`, ki sintetizira potrebno infrastrukturo |

Potrdite preglede skupaj z `azure.yaml` in kodo agenta. Ni potrebna ročno pisana infrastruktura za začetek; ko potrebujete datoteke za urejanje namestitve, sledite [izvozu infrastrukture](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) za Bicep ali Terraform ter nadaljujte z uporabo `azd provision`. Ne potrdite poverilnic ali stanje okolja `.azure/`.

#### 3. Namestitev in lokalno testiranje

```bash
azd provision
azd ai agent run
```

Namestitev lahko ustvari manjkajoče namestitve modelov **tudi v ponovno uporabljenem projektu**. Preverite izzive modelov in izberite razpoložljiv tip namestitve prek spleta, kot je Global Standard ali Data Zone Standard; kvote in regionalna podpora se razlikujejo.

Lokalni zagon pripravi odvisnosti in odpre **Agent Inspector**, kjer lahko pregledate zahteve, odgovore in aktivnost orodij/modelov. Naj teče in odprite drug terminal v isti projektni mapi:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Kontrolna točka:** Potrdite, da prejmete ustrezen odgovor in lahko pregledate povezano lokalno aktivnost. Lokalno izvajanje še vedno kliče vašo Azure namestitev modela; to ni brezžični ali brezplačni preizkus. Uporabljajte sintetične izzive in se izogibajte razkrivanju skrivnosti ali občutljivih podatkov v izhodu inšpektorja.

#### 4. Namestite in primerjajte

Zaustavite lokalni zagon s Ctrl+C, ko končate. Pred oddaljenim klicem konfigurirajte ali preverite [povezavo Application Insights projekta in dostop do branja sledov](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

V načinu namestitve kode AZD naloži izvor za oddaljeno sestavo Foundry; lokalna sestava kontejnerja ni potrebna za to pot. Izhod namestitve zagotavlja povezave do igralne površine in končnih točk. Preverite odgovor nameščenega agenta in njegovo oblačno sled; dogodki lokalnega inšpektorja sami po sebi ne dokazujejo, da oblačno sledenje deluje.

Za nadaljnje spremembe preglejte podprto konfiguracijo gostujočega agenta z `azd deploy --preview`. Pretakajte dnevnike z `azd ai agent monitor --follow` ali diagnosticirajte nastavitvene in dostopne težave z `azd ai agent doctor`. Predogled namestitve ni popoln pregled infrastrukture ali varnosti.

#### 5. Dodajte ponovljiv preverjanje kakovosti

Namestite samostojno izdano razširitev evalvacij, nato ustvarite osnutke testnih sredstev:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Opisujte predvideno vedenje agenta in izberite **Nabor podatkov in ocenjevalec**, nato **Zaženi**. Preglejte in uredite ustvarjene primere in ocenjevalno matriko, vključno s primerom nepodprtega vprašanja, preden konfigurirate evalvacijo:

```bash
azd ai eval init --name quality
```

Izberite pregledani nabor podatkov in matriko ter potrdite nameščanje ocenjevalnega modela. Preglejte `evals/azure.eval.yaml` in njegovo referenco za evalvacijsko storitev v `azure.yaml`, nato registrirajte sredstva in izvedite:

```bash
azd up
azd ai eval run start --eval quality
```

Preglejte rezultate in neuspešne ali napake primerov; zaključen pregled ni samodejno potrdilo kakovosti. Generiranje in ocenjevanje povzročata tudi stroške modelov. Potrdite ne skrivno konfiguracijo, nabore podatkov in ocenjevalne matrike, da lahko sodelavci primerjajo spremembe. `azd ai agent optimize` lahko ponovno uporabi združljivo evalvacijo kot osnovo, vendar pregledajte kandidate pred eksplicitno namestitvijo ene. Glejte [kakovostna vrata in migracijo](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) za starejše projekte in CI.

#### 6. Ponovna uporaba delovnega toka v CI/CD

Po uspešnem `azd up` zaženite `azd pipeline config` in preglejte ustvarjen GitHub Actions ali Azure DevOps delovni tok. Namestite `microsoft.foundry` na izvajalca, plus `azure.ai.evaluations`, če izvajate evalvacije. Ohranjajte ustvarjene nastavitve preverjanja, prijave in okolja; sama namestitev ne avtenticira kanala.

Uporabite ločeno AZD okolje za vsako stopnjo, podelite identiteti kanala potrebna dovoljenja za vire in Foundry, ter hranite poverilnice v skrivnostih kanala ali uporabite zvezno identiteto. Potrdite evalvacijske vire in preverite, da ima identiteta dostop do referenciranih podatkovnih nizov/ocenjevalcev. Glejte [primer kanala tečaja](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) in [Foundry vodič za CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Namerna odstranitev

Za **nov projekt, ustvarjen s tem okoljem**, pregledajte vire, ki jih navede `azd down` preden potrdite: izbriše skupino virov in vse v njej.

Za **ponovno uporabljen projekt**, `azd down` pusti projekt, gostiteljskega agenta in druge vire na mestu. Odstranite samo nezaželene vire, ki jih imate v lasti, z uporabo [navodil za hitro čiščenje](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); ne brišite skupne skupine virov za čiščenje ene vaje.

**Preverjanje dokončnosti:** Pojasnite, katera nastavitev nadzoruje lokalno in oblačno vedenje, pokažite lokalne in nameščene odzive, preglejte rezultat ocene in identificirajte, kateri viri ostanejo po čiščenju.

### Izbirno: Pripravite ogrodje z Microsoft Foundry Skill

Namestite [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) za vašega gostiteljskega agenta za kodiranje, nato odprite ločeno prazno mapo. Prosite ga, naj pripravi osnovni vzorec Python Agent Framework Responses API v načinu uvajanja kode, pojasnite ustvarjen `azure.yaml` in predlagajte naročnino, regijo, projekt in uvajanje modela. Zahtevajte odobritev **pred ustvarjanjem Azure virov**, zaprosite za lokalni preizkus in se ustavite pred uvajanjem. Preglejte njegov izhod in nadaljujte z zgornjimi koraki uvajanja le, ko ste pripravljeni.

Za obstoječe projekte nadomešča `--template`/`-t` zastarelo črkovanje `--manifest`/`-m`; sprememba zastavice ne migrira starejših manifestov ali večplastne konfiguracije agentov. Oglejte si [referenco AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Namestitev z eno samo ukazno vrstico

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Namestitve glede na okolje

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

## Nadzor in opazovanje

### Integracija Application Insights

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

To zagotovi vir Insights, ne telemetrične instrumentacije. Ko vaša aplikacija odda odhodne razpone klicev modelov, zaženite ta ilustrativni poizvedbo v Application Insights Logs (filtrirajte glede na dejanska imena razponov):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Nadzor stroškov

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

Uporabite pravi naslovnik in preverite dovoljenja obsega zaračunavanja. Proračun pošilja opozorila; ni omejitev porabe.

## 🔐 Varnostni najboljši postopki

### Konfiguracija upravljane identitete

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

### Omrežna varnost

Ta fragment končne točke potrebuje tudi zasebno DNS cona/skupino, povezave VNet, povezljivost aplikacijskega VNet in izrecno politiko javnega dostopa. Samo ustvarjanje zasebne končne točke ne onemogoči javnega dostopa.

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

## Optimizacija zmogljivosti

### Strategije predpomnjenja

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

Azure Cache for Redis Basic/Standard/Premium je na [poti upokojitve](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); za nove namestitve uporabite Azure Managed Redis in sledite njegovim trenutnim navodilom o predlogi/avtentikaciji. Obseg predpomnjenih AI odgovorov določite glede na avtorizacijo, model/navodila in različico podatkov ter rok veljavnosti; nikoli ne delite zasebnih odgovorov samo z besedilom poizvedbe.

### Konfiguracija samodejnega skaliranja

**Delni vir:** združite te nastavitve škale/zugripa v popolno aplikacijo Container z upravljanim okoljem, sliko kontejnerja in omejitvami virov. Več replik ne poveča kvote modela.

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

## Reševanje pogostih težav

### Težava 1: Presežena OpenAI kvota

**Simptomi:**
- Namestitev spodleti z napakami kvote
- 429 napak v dnevnikih aplikacije

**Rešitve:**
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

Spremenljivka kapacitete zgoraj velja le za prilagojeno predlogo, ki jo uporablja. Za vzorec RAG uporabite `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ne spreminjajte `AZURE_LOCATION` za premik obstoječih virov; ustvarite ločeno okolje za novo regijo in načrtujte migracijo/čiščenje.

### Težava 2: Neuspehi pri avtentikaciji

**Simptomi:**
- 401/403 napake ob klicu AI storitev
- Sporočila "Dostop zavrnjen"

**Rešitve:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Težava 3: Težave z namestitvijo modela

**Simptomi:**
- Modeli niso na voljo v namestitvi
- Neuspehi določenih različic modelov

**Rešitve:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Primeri predlog

To so alternative, ne zaporedni ukazi. Začnite vsak v ločeni prazni mapi. Izrecno določeno ciljno mesto `.` ohranja inicializacijo v vaši trenutni mapi; sicer lahko trenutno AZD ustvari otroško mapo s predlogo brez spremembe delovnega imenika vašega lupine.

### RAG klepetalnica (Python)

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Referenčna RAG klepetalnica za vprašanja o vaših dokumentih z iskanjem Azure AI Search. Pred uporabo preverite podprte modele vzorca, dodatne funkcije, smernice stroškov in pripravo za produkcijo; namestitev vzorca ne naredi aplikacije pripravne za produkcijo.

**Hiter začetek**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG klepetalnica (.NET)

**Repozitorij**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG klepetalnice. Zgrajena z ASP.NET Core Minimal API in Blazor WebAssembly frontend. Vključuje glasovno klepetalnico, podporo GPT-4o-mini vision in spremljevalnega .NET MAUI Blazor Hybrid odjemalca za namizje/mobilne naprave.

**Hiter začetek**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG klepetalnica (Java)

**Repozitorij**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java različica RAG klepetalnice z uporabo Langchain4J za AI orkestracijo. Podpira mikroservisno arhitekturo z dogodki, več strategij iskanja (besedilo, vektor, hibrid), nalaganje dokumentov z Azure Document Intelligence in namestitev na Azure Container Apps ali Azure Kubernetes Service.

**Hiter začetek**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot z Microsoft Foundry

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitve**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Celoviti maloprodajni RAG copilot z Microsoft Foundry in Prompty. Contoso Outdoor prodajni klepetalni robot, ki utemeljuje odgovore v katalogu izdelkov in podatkih o naročilih strank. Prikazuje celotni GenAIOps delovni proces — prototip s Prompty, ocena s pomočjo AI ocenjevalcev in namestitev preko AZD v Container Apps.

**Hiter začetek**:
```bash
azd init --template contoso-chat .
azd up
```

### Večagentna aplikacija za ustvarjalno pisanje

**Repozitorij**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Storitve**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Večagentni vzorec, ki prikazuje orkestracijo AI agentov s Prompty. Uporablja raziskovalnega agenta (Bing Grounding v Azure AI Agent Service), produkcijskega agenta (Azure AI Search), pisateljskega agenta in uredniškega agenta za skupno pripravo dobro raziskovanih člankov. Vključuje CI/CD z ocenjevanjem v GitHub Actions.

**Hiter začetek**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Brezstrežni RAG klepet (JavaScript/TypeScript)

**Repozitorij**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Storitve**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Popolnoma brezstrežni RAG klepetalni robot z uporabo LangChain.js z Azure Functions za API in Azure Static Web Apps za gostovanje. Uporablja Azure Cosmos DB kot shrambo vektorjev in bazo klepetalnih zgodovin. Podpira lokalni razvoj z Ollama za brezplačno testiranje.

**Hiter začetek**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Akcelerator rešitve Chat with Your Data

**Repozitorij**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Storitve**: Microsoft Foundry + Azure Container Apps (spletno/API/vnos) + Azure AI Search s Cosmos DB, ali PostgreSQL s pgvector

**Opis**: Klepetalni akcelerator utemeljen na dokumentih z navedbami. Trenutni vzorec gosti React frontend, FastAPI backend in Functions vnosni delavnik na Container Apps; možnosti orkestratorja so Agent Framework in LangGraph. Možnosti baze podatkov/iskanja so izbrane ob namestitvi. Je izhodišče, ne ključna proizvodna rešitev; starejše različice App Service, Semantic Kernel ali Prompt Flow ne opisujejo trenutnega privzetega stanja.

**Hiter začetek**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Potovalni AI agenti — večagentna orkestracija MCP

**Repozitorij**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Storitve**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP strežniki (.NET, Python, Java, TypeScript)

**Opis**: Referenčna aplikacija za večagentno AI orkestracijo s tremi ogrodji (LangChain.js, LlamaIndex.TS in Microsoft Agent Framework). Vključuje MCP (Model Context Protocol) strežnike v štirih jezikih, nameščene kot brezstrežne Azure Container Apps z OpenTelemetry nadzorom.

**Hiter začetek**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Ogled več predlog:** Obiščite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za trenutno razpoložljive predloge po jezikih in scenarijih. Vsak povezan primer je zunanji repozitorij, ne lokalni primer, ki ga ponuja ta tečaj; pred namestitvijo preverite trenutne predpogoje in smernice za proizvodnjo.

## Naslednji koraki

1. **Preizkusite primere**: Začnite s predlogo, ki ustreza vašemu primeru uporabe
2. **Prilagodite svojim potrebam**: Spremenite infrastrukturo in kodo aplikacije
3. **Dodajte nadzor**: Implementirajte celovito opazovanje
4. **Optimirajte stroške**: Nastavite konfiguracije glede na proračun
5. **Zavarujte namestitev**: Uporabite varnostne vzorce za podjetja
6. **Razširite na produkcijo**: Dodajte večregijske in visoko razpoložljive funkcije

## 🎯 Praktične vaje

### vaja 1: Namestitev klepetalne aplikacije Microsoft Foundry Models (30 minut)
**Cilj**: Namestiti in testirati referenčno aplikacijo za AI klepet

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

**Merila uspeha:**
- [ ] Namestitev se zaključi brez napak kvote
- [ ] Dostop do klepetalnega vmesnika v brskalniku
- [ ] Možnost postavljanja vprašanj in prejemanja AI-podprtih odgovorov
- [ ] Aplikacija Insights prikazuje podatke o telemetriji
- [ ] Uspešno čiščenje virov

**Stroški:** Pred namestitvijo preglejte trenutni vodnik po stroških vzorca in izbrane SKU-je. Zaračunavanje traja, dokler viri niso izbrisani; ni fiksnega 30-minutnega ocenjevanja za vse konfiguracije.

### vaja 2: Konfiguracija večmodelne namestitve (45 minut)
**Cilj**: Namestiti več AI modelov z različnimi konfiguracijami

**Začetna točka:** Obstoječ Azure OpenAI račun in modul skupine virov AZD, ki lahko kliče to datoteko. Ustvarite `infra/ai-models.bicep` z naslednjo vsebino v svojem urejevalniku. Samodejno ni nameščen le zato, ker je pod `infra/`.

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

Iz modula z obsegom skupine virov, ki je lastnik računa, dodajte klic modula (prilagodite ime simbola svojemu dejanskemu računu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ne navajajte iste namestitve v obeh modulih. Če je vhodna točka AZD z obsegom naročnine, jo kličite iz podrejenega modula z obsegom skupine virov in prilagodite relativno pot. Zgradite ta vsebinski modul z `az bicep build --file <path-to-containing-module>`, nato:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Merila uspeha:**
- [ ] Več modelov uspešno nameščenih
- [ ] Uporabljene različne nastavitve kapacitete
- [ ] Modeli dostopni preko API-ja
- [ ] Možnost klica obeh modelov iz aplikacije

### vaja 3: Implementirajte nadzor stroškov (20 minut)
**Cilj**: Nastaviti proračunska opozorila in sledenje stroškov

**Začetna točka:** Vzorec proračuna zgoraj in modul infrastrukture z obsegom skupine virov. Dodajte ta vir z urejevalnikom; posredujte `budgetStartDate` iz svojega preslikovalnika parametrov (ne podvajajte parametra, če je že deklariran). Zamenjajte naslovnika in potrdite, da imate pravice za zapisovanje proračuna.

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

Pričakovano: odgovor vsebuje `amount: 200`, oba pragova in vašega naslovnika. Preverite Cost Management v portalu za dejanske stroške; podatki o stroških so zamaknjeni in opozorilo se ni treba sprožiti med kratko vajo.

**Merila uspeha:**
- [ ] Opozorilo proračuna ustvarjeno v Azure
- [ ] Elektronska pošta za obvestila nastavljena
- [ ] Ogled podatkov o stroških v Azure Portal
- [ ] Proračunski pragovi ustrezno nastavljeni

## 💡 Pogosto zastavljena vprašanja

<details>
<summary><strong>Kako znižati stroške Microsoft Foundry Models med razvojem?</strong></summary>

1. **Preverite cene**: Za modele Azure OpenAI ni univerzalne brezplačne mesečne omejitve 50.000 tokenov
2. **Pravilno velikost kapacitete**: Kapaciteta `10` običajno predstavlja 10.000 TPM za te Standard tekstne modele, ne 10 TPM. Zmanjšanje te omejitve hitrosti ne zniža cen na token
3. **Uporabljajte azd down**: Brišite odvečne vire, ko ne razvijate aktivno (to ni deallokacija)
4. **Predpomnite odgovore**: Uporabite Redis cache za ponavljajoče poizvedbe
5. **Uporabite Prompt Engineering**: Zmanjšajte uporabo tokenov z učinkovitimi napotki

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Kakšna je razlika med Microsoft Foundry Models in OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Varnost in skladnost za podjetja
- Integracija zasebnega omrežja
- Zagotovitve SLA
- Avtentikacija z upravljano identiteto
- Na voljo višje kvote

**OpenAI API**: Ločen ponudnik/API s svojo razpoložljivostjo modelov, cenami, avtentikacijo in možnostmi povezljivosti za podjetja. Primerjajte trenutne ponudbe, namesto da predpostavljate, da je vedno javni internet ali vedno prvi pošilja modele.

Izberite glede na zahteve vaše organizacije; primeri upravljane identitete in zasebne povezave, specifični za Azure, v tem tečaju veljajo za storitve gostovane v Azure, ne za vsak model/ponudnika v katalogu Foundry.
</details>

<details>
<summary><strong>Kako ravnati z napakami prekoračitve kvote Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Ali lahko uporabim svoje podatke z Microsoft Foundry Models?</strong></summary>

Da! Uporabite **Azure AI Search** za RAG (Retrieval Augmented Generation):

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

Oglejte si predlogo [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Kako zavarujem končne točke modelov umetne inteligence?</strong></summary>

**Najboljše prakse**:
1. Uporabite Upravljano identiteto (brez API ključev)
2. Omogočite zasebne končne točke
3. Konfigurirajte varnostne skupine omrežja
4. Uvedite omejitev hitrosti
5. Uporabite Azure Key Vault za skrivnosti

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

## Skupnost in Podpora

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Težave in razprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry veščine na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Namestite Azure + Foundry agent veščine v vaš urejevalnik z `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen na umetno inteligenco
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [AI agenti](agents.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se razpravam skupnosti ali odprite težavo v repozitoriju. Skupnost Azure AI + AZD je tukaj, da vam pomaga uspeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->