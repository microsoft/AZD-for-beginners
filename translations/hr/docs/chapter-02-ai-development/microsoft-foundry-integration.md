# Microsoft Foundry integracija s AZD-om

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo programiranje
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [AI agenti](agents.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ovaj vodič prikazuje kako integrirati Microsoft Foundry usluge s Azure Developer CLI (AZD) za pojednostavljene implementacije AI aplikacija. Microsoft Foundry pruža sveobuhvatnu platformu za izradu, implementaciju i upravljanje AI aplikacijama, dok AZD pojednostavljuje infrastrukturu i proces implementacije.

## Što je Microsoft Foundry?

Microsoft Foundry je Microsoftova jedinstvena platforma za razvoj AI-a koja uključuje:

- **Katalog modela**: Pristup najmodernijim AI modelima
- **Prompt Flow**: Vizualni dizajner AI tijekova rada
- **Microsoft Foundry portal**: Integrirano razvojno okruženje za AI aplikacije
- **Opcije implementacije**: Više opcija hostinga i skaliranja
- **Sigurnost i zaštita**: Ugrađene značajke odgovornog AI-a

## AZD + Microsoft Foundry: Bolje zajedno

| Značajka | Microsoft Foundry | Prednost integracije s AZD-om |
|---------|-----------------|------------------------|
| **Implementacija modela** | Ručna implementacija putem portala | Automatske, ponovljive implementacije |
| **Infrastruktura** | Konfiguracija projekta i resursa | Početak od `azure.yaml`; izvadi Bicep ili Terraform po potrebi |
| **Upravljanje okruženjem** | Fokus na jedno okruženje | Više okruženja (razvoj/test/produkcija) |
| **CI/CD integracija** | Usluge implementacije i evaluacije | Ponovna upotreba konfiguracije u GitHub Actions ili Azure DevOps |
| **Upravljanje troškovima** | Osnovno praćenje | Optimizacija troškova specifičnih za okruženje |

## Preduvjeti

- Pretplata na Azure s odgovarajućim dopuštenjima
- Azure Developer CLI 1.37.0 ili noviji za GA Foundry tijek rada
- Pristup Microsoft Foundry Models uslugama
- Osnovno poznavanje Microsoft Foundry-a

> **Foundry GA ažuriranje (2026-11-09):** Paket proširenja `microsoft.foundry` dosegao je verziju 1.0 i opću dostupnost [5. studenoga 2026.](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Donji vodič prati tu objavu i povezani Microsoft Learn brzi početak. Ovo je pregled dokumentacije, a ne provjera aktivnog implementiranja. Opcionalne značajke u pregledu i samostalno objavljena proširenja zadržavaju svoj vlastiti status izdavanja.

**Ishodi učenja:** Instalirajte GA paket, pregledajte `azure.yaml` agenta, usporedite lokalne i implementirane odgovore i objasnite granice evaluacije, CI/CD i čišćenja. Za korak-po-korak implementaciju agenta, idite na [vodič za hostiranog agenta](#hosted-agent-walkthrough-ga). Donji fragmenti resursa pokrivaju druge obrasce integracije.

## Osnovni obrasci integracije

**Opseg primjera:** Bicep u nastavku sadrži ilustrativne fragmente resursa, a ne cjeloviti predložak spreman za implementaciju. Sadržani predložak mora definirati imena, `location`, referencirane resurse, identitete, izlaze i hosting aplikacije. Za početnu točku upotrijebite povezani uzorak. Bash primjeri zahtijevaju zasebnu autentifikaciju s Azure CLI odvojeno od `azd auth login`.

### Obrasci 1: Integracija Microsoft Foundry modela

**Upotreba:** Implementirajte chat aplikacije s Azure OpenAI modelima u Microsoft Foundry

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

Pozivatelj treba pridruženi upravljani identitet i `Cognitive Services OpenAI User` na razini računa; onemogućivanje ključeva ne daje pristup. Provjerite dostupnost regije/modela/SKU i kvotu prije implementacije.

### Obrasci 2: AI pretraživanje + RAG integracija

**Upotreba:** Implementirajte aplikacije za generiranje s proširenim dohvatom (RAG)

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

Za ovu integraciju ne postoji `Microsoft.Search/searchServices/dataConnections` ARM resurs. Konfigurirajte indeks pretraživanja, izvor podataka, indeksator/skup vještina ili vektorizator putem podržanih API-ja za podatkovnu ravninu pretraživanja. Ako pretraživanje poziva model ugrađivanja, omogućite njegov upravljani identitet, dodijelite odgovarajuću ulogu modelu i konfigurirajte njegovu ugrađivačku vještinu/vektorizator. Pogledajte [integriranu vektorizaciju](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Obrasci 3: Integracija inteligencije dokumenata

**Upotreba:** Radni tokovi obrade i analize dokumenata

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

## 🔧 Obrasci konfiguracije

### Postavljanje varijabli okoline

Osim dokumentiranih postavki AZD poput `AZURE_LOCATION`, ovo su **nazivi unosa prilagođenog predloška**. Nemaju učinak osim ako ih predložak/aplikacija ne koristi kroz mapiranja parametara i okoline domaćina. Za `azure-search-openai-demo` upotrijebite stvarna imena poput `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` i `AZURE_SEARCH_SERVICE_SKU`. Kapacitet modela nije SKU računa.

**Produkcijska konfiguracija:**
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

**Razvojna konfiguracija:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Sigurna konfiguracija s Key Vaultom

Prednost dajte Entra ID-u s onemogućenim lokalnim autentificiranjem ključeva. Sljedeće je samo **alternativa za staru autentifikaciju ključeva** za aplikacije koje zahtijevaju ključeve: zahtijeva račun s omogućenim autentificiranjem ključeva, identitet aplikacije pridružen njenom domu i ispravan pristup/networking Key Vaultu. Nemojte kombinirati dohvaćanje ključeva s `disableLocalAuth: true` i očekivati da će pozivi temeljeni na ključu raditi.

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

## Radni tokovi implementacije

### AZD proširenja za Foundry

Za GA radni tok instalirajte paket `microsoft.foundry` umjesto da sastavljate osnovne dodatke jedan po jedan:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Paket instalira agente, veze, inspektora, projekte, rutine, vještine i kutije alata. Ne dodaje naredbenu grupu `microsoft.foundry`. Evaluacije, skupovi podataka, fino podešavanje i prilagođeni modeli instaliraju se zasebno po potrebi. Pogledajte [referencu pakiranja proširenja](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Vodič za hostiranog agenta (GA)

**Hostirani agent** izvršava vaš kod agenta na Foundry upravljanom računalstvu. Ova vježba koristi uzorak osnovnog Python Agent Framework Responses API-ja izvornog projekta, a ne klasične fragmente Agent Service SDK-ja iz drugih lekcija.

#### 1. Priprema i inicijalizacija

Koristite prazan direktorij izvan preuzimanja ovog tečaja. Instalirajte Python 3.13 ili noviji i trenutnu [uv verziju](https://docs.astral.sh/uv/getting-started/installation/). Samostalne uv instalacije mogu koristiti `uv self update`. Provjerite [dozvole hostiranog agenta](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), dostupnost modela i kvotu u vašem pretplati i regiji prije provisioniranja. Azure resursi i lokalni pozivi modelu se naplaćuju.

Dovršite instalaciju paketa i `azd auth login` gore. Lokalni uzorak koristi `DefaultAzureCredential`; ako koristite vjerodajnice Azure CLI, prijavite se s `az login` koristeći isti račun i zakupnika kao AZD. Sam AZD login nije Azure CLI login.

Pokrenite ovu naredbu u jednom retku u Bashu ili PowerShellu:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Odaberite novi ili postojeći Foundry projekt i namjeravanu pretplatu i regiju. Za ponovnu upotrebu implementacije modela dodajte `--model-deployment <existing-deployment-name>` naredbi za inicijalizaciju **prije pokretanja**, i odaberite postojeći projekt. Budite u direktoriju gdje je generiran `azure.yaml` za preostale naredbe.

#### 2. Pregled definicije implementacije

Otvorite `azure.yaml` i pronađite ove postavke u [uzorku izvornog projekta](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Postavka | Što provjeriti |
|---------|---------------|
| `host: azure.ai.project` i `deployments` | Namjeravani Foundry projekt i ime modela, verzija, SKU implementacije i kapacitet |
| `host: azure.ai.agent` i `project` | Hostirani agent i direktorij izvora |
| `codeConfiguration` | Python runtime i ulazna točka; pregledani uzorak koristi `python_3_13` i `main.py` |
| `uses` | Ovisnost o Foundry projekt servisu |
| `container.resources` | Dodjela CPU-a i memorije, iako se kod izvršava udaljeno |
| `env` | Mapiranje implementacije modela i `PYTHONNOUSERSITE: "1"` za onemogućavanje učitavanja paketa korisničke lokacije |
| `infra.provider` | `microsoft.foundry`, koji sintetizira potrebnu infrastrukturu |

Svežite pregledani `azure.yaml` i kod agenta zajedno. Za početak nije potrebna ručno napisana infrastruktura; kad trebate uređive datoteke za provisioniranje, slijedite [izvoz infrastrukture](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) za Bicep ili Terraform i nastavite koristiti `azd provision`. Nemojte svezati vjerodajnice ili stanje okoline `.azure/`.

#### 3. Provisionirajte i testirajte lokalno

```bash
azd provision
azd ai agent run
```

Provisioniranje može stvoriti nedostajuće implementacije modela **čak i u ponovnoj upotrebi projekta**. Pregledajte upite modela i odaberite dostupnu internetsku vrstu implementacije poput Global Standard ili Data Zone Standard; kvota i podrška po regijama variraju.

Lokalno izvršavanje priprema ovisnosti i otvara **Agent Inspector**, gdje možete pregledavati zahtjeve, odgovore i aktivnost alata/modela. Držite ga otvorenog i otvorite drugi terminal u istom projektu:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Kontrolna točka:** Potvrdite da primate relevantan odgovor i možete pregledati povezanu lokalnu aktivnost. Lokalno izvršavanje i dalje poziva vašu Azure implementaciju modela; nije offline ili besplatni test. Koristite sintetičke upite i izbjegavajte izlaganje tajni ili osjetljivih podataka u izlazu inspektora.

#### 4. Implementirajte i usporedite

Zaustavite lokalno izvršavanje s Ctrl+C kad završite. Prije daljinskog poziva konfigurirajte ili provjerite [Application Insights vezu projekta i pristup za čitanje tragova](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

U načinu implementacije koda AZD učitava izvor za udaljenu Foundry izgradnju; za ovu putanju nije potrebna lokalna izgradnja kontejnera. Izlaz implementacije daje poveznice za playground i endpoint. Potvrdite odgovor od implementiranog agenta i njegov trag u oblaku; lokalni događaji inspektora sami po sebi ne dokazuju pravilno funkcioniranje praćenja u oblaku.

Za naknadne promjene pregledajte podržanu konfiguraciju hostiranog agenta uz `azd deploy --preview`. Strimajte dnevnike s `azd ai agent monitor --follow` ili dijagnosticirajte postavljanje i pristupne probleme s `azd ai agent doctor`. Pregled implementacije nije cjelovita infrastruktura ili sigurnosna provjera.

#### 5. Dodajte ponovnu provjeru kvalitete

Instalirajte samostalno objavljeno proširenje evaluacija, zatim generirajte skice testnih sredstava:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Opisati namjeravano ponašanje agenta i odaberite **Dataset and evaluator**, zatim **Turn**. Pregledajte i uredite generirane slučajeve i kriterije ocjenjivanja, uključujući slučaj ne-podržanog pitanja, prije konfiguracije evaluacije:

```bash
azd ai eval init --name quality
```

Odaberite pregledani skup podataka i rubriku te potvrdite model implementacije suca. Pregledajte `evals/azure.eval.yaml` i njegovu referencu u evaluacijskom servisu u `azure.yaml`, zatim registrirajte sredstva i izvršite:

```bash
azd up
azd ai eval run start --eval quality
```

Pregledajte rezultate i neuspjele ili neispravne slučajeve; dovršena evaluacija nije automatski prolaz kvalitete. Generiranje i ocjenjivanje također generiraju troškove modela. Svežite nekonfidencijalnu konfiguraciju, skupove podataka i rubrike da bi kolege mogli usporediti promjene. `azd ai agent optimize` može ponovno koristiti kompatibilnu evaluaciju kao osnovu, ali pregledajte kandidate prije eksplicitne implementacije. Pogledajte [kvalitetna vrata i migraciju](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) za starije projekte i CI.

#### 6. Ponovno koristite radni tok u CI/CD

Nakon uspješnog `azd up` pokrenite `azd pipeline config` i pregledajte generirani GitHub Actions ili Azure DevOps radni tok. Instalirajte `microsoft.foundry` na runner, plus `azure.ai.evaluations` ako pokrećete evaluacije. Zadržite generirane postavke za checkout, prijavu i okolinu; sama instalacija ne autentificira pipeline.

Koristite zasebno AZD okruženje za svaku fazu, dodijelite identitet pipelineu potrebne resursne i Foundry dozvole te držite vjerodajnice u pipeline tajnama ili koristite saveznički identitet. Svežite sredstva evaluacije i provjerite da identitet može pristupiti referenciranim skupovima podataka/evaluatora. Pogledajte [primjer pipelinea tečaja](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) i [Foundry CI/CD vodič](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Očistite ciljano

Za **novi projekt kreiran ovim okruženjem**, pregledajte resurse navedene u `azd down` prije potvrde: briše grupu resursa i sve u njoj.

Za **ponovno korišteni projekt**, `azd down` ostavlja projekt, hostiranog agenta i ostale resurse na mjestu. Uklonite samo neželjene resurse koje posjedujete koristeći [brzo čišćenje](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); nemojte brisati zajedničku grupu resursa da biste očistili jednu vježbu.

**Provjera dovršenosti:** Objasnite koje postavke upravljaju lokalnim i oblačnim ponašanjem, prikažite lokalne i implementirane odgovore, pregledajte rezultat evaluacije i identificirajte koji resursi ostaju nakon čišćenja.

### Opcionalno: Scaffold s Microsoft Foundry Skill

Instalirajte [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) za vaš domaćin kodirajućeg agenta i otvorite zasebnu praznu mapu. Zamolite ga da scaffolda osnovni Python Agent Framework Responses API uzorak u načinu implementacije koda, objasni generirani `azure.yaml` i predloži pretplatu, regiju, projekt i implementaciju modela. Zahtijevajte odobrenje **prije stvaranja Azure resursa**, zatražite lokalni test i zaustavite prije implementacije. Pregledajte njegov izlaz i nastavite s gore navedenim koracima implementacije samo kad ste spremni.

Za postojeće projekte, `--template`/`-t` zamjenjuje zastarjeli pravopis `--manifest`/`-m`; promjena oznake ne migrira naslijeđene manifeste ili ugrađenu konfiguraciju agenata. Pogledajte [AI CLI referencu](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Implementacija jedne naredbe

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Implementacije specifične za okruženje

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

## Nadzor i promatranje

### Integracija s Application Insights

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

Ovo postavlja resurs Insights, a ne telemetrijsku instrumentaciju. Kad vaša aplikacija emitira izlazne spanove poziva modela, pokrenite ovaj ilustrativni upit u Application Insights Logs (prilagodite filter prema stvarnim nazivima spanova):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Praćenje troškova

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

Koristite stvarnog primatelja i provjerite dozvole za prostor za naplatu. Proračun šalje upozorenja; nije ograničenje potrošnje.

## 🔐 Najbolje prakse sigurnosti

### Konfiguracija upravljanog identiteta

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

### Sigurnost mreže

Ovaj fragment krajnje točke također zahtijeva privatnu DNS zonu/grupu, VNet veze, povezivanje aplikacije s VNet-om te izričitu politiku za javni pristup. Samo stvaranje privatne krajnje točke ne onemogućuje javni pristup.

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

## Optimizacija performansi

### Strategije keširanja

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

Azure Cache za Redis Basic/Standard/Premium ide u [penziju](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); koristite Azure Managed Redis za nove implementacije i slijedite njegovu trenutnu predložak/autentifikaciju. Ograničite keširane AI odgovore po autorizaciji, modelu/uputama i verziji podataka, s istekom valjanosti; nikad nemojte dijeliti privatne odgovore koristeći samo tekst upita.

### Konfiguracija automatskog skaliranja

**Djelomični resurs:** spojite ove postavke skaliranja/ulaza u potpunu aplikaciju za kontejnere s upravljanim okruženjem, slikom kontejnera i ograničenjima resursa. Više replika ne povećava kvotu modela.

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

## Rješavanje uobičajenih problema

### Problem 1: Prekoračenje kvote za OpenAI

**Simptomi:**
- Implementacija ne uspijeva sa greškama kvote
- 429 grešaka u zapisima aplikacije

**Rješenja:**
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

Varijabla kapaciteta gore primjenjuje se samo na prilagođeni predložak povezan da je koristi. Za RAG primjer, koristite `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nemojte mijenjati `AZURE_LOCATION` da biste premjestili postojeće resurse; stvorite zasebno okruženje za novu regiju i planirajte migraciju/čišćenje.

### Problem 2: Neuspjesi autentifikacije

**Simptomi:**
- 401/403 grešaka prilikom pozivanja AI usluga
- Poruke "Pristup odbijen"

**Rješenja:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Problemi s implementacijom modela

**Simptomi:**
- Modeli nisu dostupni u implementaciji
- Određene verzije modela ne uspijevaju

**Rješenja:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Primjeri predložaka

Ovo su alternative, a ne sekvencijalne naredbe. Pokrenite svaki u zasebnom praznom direktoriju. Izričita `.` destinacija drži inicijalizaciju u vašem trenutnom direktoriju; inače trenutni AZD može stvoriti poddirektorij naziva predloška bez promjene radnog direktorija vašeg shell-a.

### RAG Chat aplikacija (Python)

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Referentna RAG chat aplikacija za pitanja nad vašim dokumentima, uz Azure AI Search dohvat. Pregledajte trenutačne podržane modele, opcionalne značajke, vodič za troškove i pripremu za produkciju prije korištenja; implementacija primjera ne čini aplikaciju spremnom za produkciju.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat aplikacija (.NET)

**Repozitorij**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG chat primjera. Izgrađeno s ASP.NET Core Minimal API i Blazor WebAssembly frontendom. Uključuje glasovni chat, GPT-4o-mini vizualnu podršku i pratećeg .NET MAUI Blazor Hybrid desktop/mobitel klijenta.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat aplikacija (Java)

**Repozitorij**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java verzija RAG chat primjera koristeći Langchain4J za AI orkestraciju. Podržava mikroservisnu arhitekturu vođenu događajima, više strategija pretraživanja (tekst, vektor, hibrid), prijenos dokumenata s Azure Document Intelligence i implementaciju na Azure Container Apps ili Azure Kubernetes Service.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot s Microsoft Foundry

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usluge**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: End-to-end retail RAG copilot koristeći Microsoft Foundry i Prompty. Contoso Outdoor trgovinski chatbot koji temelji odgovore na katalogu proizvoda i podacima o narudžbama kupaca. Demonstrira potpuno GenAIOps radni tok — prototip s Prompty, evaluaciju s AI-pomoćnim evaluatorima i implementaciju putem AZD u Container Apps.

**Brzi početak**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativna višestruka agentska aplikacija

**Repozitorij**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Usluge**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Primjer višestrukih agenata koji prikazuje orkestraciju AI agenata s Prompty. Koristi istraživačkog agenta (Bing Grounding u Azure AI Agent Service), proizvodnog agenta (Azure AI Search), pisca i urednika da zajednički stvore dobro istražene članke. Uključuje CI/CD s evaluacijom u GitHub Actions.

**Brzi početak**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG chat (JavaScript/TypeScript)

**Repozitorij**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Usluge**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Potpuno serverless RAG chatbot koristeći LangChain.js s Azure Functions za API i Azure Static Web Apps za hosting. Koristi Azure Cosmos DB kao spremište vektora i bazu podataka za povijest chata. Podržava lokalni razvoj s Ollama za testiranje bez troškova.

**Brzi početak**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Repozitorij**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Usluge**: Microsoft Foundry + Azure Container Apps (web/API/ingestija) + Azure AI Search s Cosmos DB, ili PostgreSQL s pgvector

**Opis**: Ubrzivač chat-a temeljen na dokumentima s citatima. Trenutni primjer hosta React frontend, FastAPI backend i Functions ingestion worker na Container Apps; opcije orkestratora su Agent Framework i LangGraph. Opcije baze podataka/dohvata se biraju pri implementaciji. To je polazna točka, a ne gotov proizvodni sustav; nemojte pretpostavljati da stariji App Service, Semantic Kernel ili Prompt Flow varijante opisuju trenutačni zadani sustav.

**Brzi početak**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — višestruka orkestracija MCP agenata

**Repozitorij**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Usluge**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Opis**: Referentna aplikacija za višestruku orkestraciju AI agenata koristeći tri okvira (LangChain.js, LlamaIndex.TS i Microsoft Agent Framework). Sadrži MCP (Model Context Protocol) poslužitelje na četiri jezika implementirane kao serverless Azure Container Apps s OpenTelemetry nadzorom.

**Brzi početak**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Pregledajte više predložaka**: Posjetite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za trenutačno dostupne predloške po jezicima i scenarijima. Svaki povezani primjer je vanjski repozitorij, a ne lokalni primjer iz ovog tečaja; pregledajte njegove trenutne preduvjete i smjernice za produkciju prije implementacije.

## Sljedeći koraci

1. **Isprobajte primjere**: Počnite s unaprijed izrađenim predloškom koji odgovara vašem slučaju upotrebe
2. **Prilagodite prema svojim potrebama**: Izmijenite infrastrukturu i kôd aplikacije
3. **Dodajte nadzor**: Implementirajte cjelovit sustav promatranja
4. **Optimizirajte troškove**: Fino podesite konfiguracije prema svom proračunu
5. **Osigurajte implementaciju**: Primijenite sigurnosne obrasce za poduzeća
6. **Prerastite u produkciju**: Dodajte značajke za više regija i visoku dostupnost

## 🎯 Praktične vježbe

### Vježba 1: Implementirajte Microsoft Foundry Models Chat aplikaciju (30 minuta)
**Cilj**: Implementirati i testirati referentnu AI chat aplikaciju

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

**Kriteriji uspjeha:**
- [ ] Implementacija dovršena bez grešaka kvote
- [ ] Moguć pristup chat sučelju u pregledniku
- [ ] Moguće postavljanje pitanja i dobivanje AI-pokretanih odgovora
- [ ] Application Insights pokazuje telemetrijske podatke
- [ ] Resursi uspješno očišćeni

**Trošak:** Pregledajte trenutačne smjernice troškova i odabrane SKU-ove prije implementacije. Naplata traje dok se resursi ne izbrišu; nema fiksne 30-minutne procjene koja vrijedi za svaku konfiguraciju.

### Vježba 2: Konfigurirajte višemodelsku implementaciju (45 minuta)
**Cilj**: Implementirati više AI modela s različitim konfiguracijama

**Polazna točka:** Postojeći Azure OpenAI račun i AZD modul za resource group koji može pozvati ovu datoteku. Stvorite `infra/ai-models.bicep` s ovom sadržajem u svom uređivaču. Nije automatski implementiran samo zato što je u okviru `infra/`.

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

Iz modula ograničenog na resource group koji posjeduje račun, dodajte poziv modula (prilagodite naziv simbola prema stvarnom računu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nemojte deklarirati iste implementacije u oba modula. Ako je AZD ulazna točka u okviru pretplate, pozovite ovo iz podmodula ograničenog na resource group i prilagodite relativnu putanju. Izgradite taj sadržeći modul s `az bicep build --file <path-to-containing-module>`, zatim:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kriteriji uspjeha:**
- [ ] Više modela uspješno implementirano
- [ ] Primijenjene različite postavke kapaciteta
- [ ] Modeli dostupni putem API-ja
- [ ] Moguće pozivanje oba modela iz aplikacije

### Vježba 3: Implementirajte praćenje troškova (20 minuta)
**Cilj**: Postaviti upozorenja proračuna i praćenje troškova

**Polazna točka:** Uzorak proračuna gore i infrastrukturni modul ograničen na resource group. Dodajte ovaj resurs u svom uređivaču; proslijedite `budgetStartDate` iz mapiranja parametara (ne duplicirajte parametar ako je već deklariran). Zamijenite primatelja i potvrdite da imate pisane dozvole za proračun.

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

Očekivano: odgovor sadrži `amount: 200`, oba praga i vašeg primatelja. Pregledajte Cost Management u portalu za stvarne troškove; podaci o troškovima su odgođeni i upozorenje ne mora biti pokrenuto tijekom kratke vježbe.

**Kriteriji uspjeha:**
- [ ] U Azureu kreirano upozorenje za proračun
- [ ] Konfigurirane email obavijesti
- [ ] Moguć pregled podataka o troškovima u Azure Portal
- [ ] Pragu proračuna postavljeni prikladno

## 💡 Često postavljana pitanja

<details>
<summary><strong>Kako smanjiti troškove Microsoft Foundry Models tijekom razvoja?</strong></summary>

1. **Provjerite cijene**: Ne postoji univerzalna mjesečna naknada od 50.000 tokena besplatno za Azure OpenAI modele
2. **Prilagodite kapacitet**: Kapacitet `10` obično predstavlja 10.000 TPM za ove Standardne tekstualne modele, a ne 10 TPM. Smanjenje ograničenja brzine ne smanjuje cijene po tokenu
3. **Koristite azd down**: Izbrišite resurse kad ih ne koristite aktivno (nije de-alokacija)
4. **Keširajte odgovore**: Implementirajte Redis cache za ponovljene upite
5. **Koristite prompt engineering**: Smanjite potrošnju tokena učinkovitim promptovima

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Koja je razlika između Microsoft Foundry Models i OpenAI API-ja?</strong></summary>

**Microsoft Foundry Models**:
- Sigurnost i usklađenost na razini poduzeća
- Integracija privatnih mreža
- Garantije SLA-a
- Autentikacija upravljanim identitetom
- Dostupne veće kvote

**OpenAI API**: Odvojeni pružatelj/API s vlastitom dostupnošću modela, cijenama, autentikacijom i opcijama za povezivanje poduzeća. Usporedite trenutačne ponude umjesto da pretpostavljate da je samo za javni internet ili da modeli uvijek prvi stižu na njega.

Odaberite ovisno o zahtjevima svoje organizacije; Azure-specifični primjeri upravljanog identiteta i privatnog linka iz ovog tečaja primjenjuju se na usluge hostane na Azure-u, a ne svaki model/pružatelj u Foundry katalogu.
</details>

<details>
<summary><strong>Kako se nositi s pogreškama prekoračenja kvote za Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Mogu li koristiti vlastite podatke s Microsoft Foundry Models?</strong></summary>

Da! Koristite **Azure AI Search** za RAG (retrieval augmented generation - generiranje povećano dohvatom):

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

Pogledajte predložak [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Kako osigurati krajnje točke AI modela?</strong></summary>

**Najbolje prakse**:
1. Koristite Upravljani identitet (bez API ključeva)
2. Omogućite Privatne krajnje točke
3. Konfigurirajte mrežne sigurnosne skupine
4. Implementirajte ograničenje brzine
5. Koristite Azure Key Vault za tajne

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

## Zajednica i podrška

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Pitanja i rasprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Službena dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry vještina na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalirajte Azure + Foundry agent vještine u vaš uređivač pomoću `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo programiranje
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [AI agenti](agents.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se našim zajedničkim raspravama ili otvorite problem u spremištu. Zajednica Azure AI + AZD tu je da vam pomogne uspjeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->