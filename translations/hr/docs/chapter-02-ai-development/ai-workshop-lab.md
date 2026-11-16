# AI Radionica: Kako učiniti svoje AI rješenja AZD-Deployabilnim

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvi razvoj
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za AI u produkciji](../chapter-08-production/production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled radionice

Ova praktična radionica vodi programere kroz proces preuzimanja postojećeg AI predloška i njegovog implementiranja pomoću Azure Developer CLI (AZD). Naučit ćete ključne obrasce za produkcijska AI rješenja koristeći Microsoft Foundry usluge.

> **Pregled izdanja (2026-11-04):** Upute za AZD naredbe i nazivi primjera konfiguracija provjeravani su u odnosu na `azd` `1.37.2` izdanje i trenutačnu konfiguraciju povezanog primjera. Ovo je pregled dokumentacije, a ne potvrda implementacije uživo. RAG laboratorij ne zahtijeva agent ekstenziju; za procjene agenata koristite zasebnu `azure.ai.evaluations` ekstenziju i [trenutni radni tijek procjene](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), a ne naslijeđene naredbe za procjenu agenata.

**Trajanje:** 2-3 sata  
**Razina:** Srednja  
**Preduvjeti:** Osnovno znanje Azure, poznavanje AI/ML koncepata

## 🎓 Ciljevi učenja

Do kraja ove radionice moći ćete:
- ✅ Istražiti postojeći AI AZD predložak i planirati konverziju vlastite aplikacije
- ✅ Konfigurirati Microsoft Foundry usluge pomoću AZD-a
- ✅ Implementirati sigurnu upravu vjerodajnicama za AI usluge
- ✅ Implementirati referentnu AI aplikaciju s nadzorom
- ✅ Rješavati uobičajene probleme pri AI implementacijama

## Preduvjeti

### Potrebni alati
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instaliran
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instaliran
- [Git](https://git-scm.com/) instaliran
- Uređivač koda (preporuča se VS Code)

Ovi blokovi naredbi koriste Bash sintaksu (uključujući nastavke redaka i `grep`). Na Windowsu koristite Git Bash/WSL ili ih prevedite u PowerShell. Također instalirajte jezik, upravitelja paketa i alate za kontejnere navedene u [lokalnom postavljanju okruženja uzorka](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure resursi
- Azure pretplata s dopuštenjima za kreiranje resursa i dodjelu uloga (Contributor sam nije dovoljan za stvaranje RBAC dodjela; koristite autoriziranog administratora uloga ili dokumentirani ekvivalent iz uzorka)
- Pristup uslugama Microsoft Foundry Models (ili mogućnost zahtjeva za pristup)
- Dopuštenja za kreiranje grupe resursa

### Prethodno znanje
- Osnovno razumijevanje Azure usluga
- Poznavanje sučelja naredbene linije
- Osnovni koncepti AI/ML (API-jevi, modeli, upiti)

## Postavljanje laboratorija

### Korak 1: Priprema okruženja

1. **Provjerite instalacije alata:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Ako radite na više stanara ili vaša pretplata nije automatski prepoznata, pokušajte ponovno s `azd auth login --tenant-id <tenant-id>`.

2. **Klonirajte repozitorij radionice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumijevanje strukture AZD za AI aplikacije

### Anatomija AI AZD predloška

Istražite ključne datoteke u AZD predlošku spremnom za AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Provjereni uzorak može se promijeniti; `.azure/` se pojavljuje nakon inicijalizacije okruženja, ne nužno u svježem klonu. Pregledajte stvarni checkout umjesto da stvarate nedostajuće direktorije kako biste se uskladili s ovom shemom.

### **Vježba u laboratoriju 1.1: Istražite konfiguraciju**

1. **Pogledajte datoteku azure.yaml:**
```bash
cat azure.yaml
```

**Na što obratiti pozornost:**
- Definicije usluga za AI komponente
- Preslikavanje varijabli okruženja
- Konfiguracije hosta

2. **Pregledajte glavnu infrastrukturu u main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI obrasci za prepoznati:**
- Provisioniranje Microsoft Foundry Models usluge
- Integracija Azure AI Searcha
- Sigurno upravljanje ključevima
- Konfiguracije mrežne sigurnosti

### **Diskusija:** Zašto su ovi obrasci važni za AI

- **Zavisnosti usluga**: AI aplikacije često zahtijevaju koordinirane više usluga
- **Sigurnost**: Potrebno je sigurno upravljanje API ključevima i krajnjim točkama
- **Skalabilnost**: AI radni opterećenja imaju jedinstvene zahtjeve skaliranja
- **Upravljanje troškovima**: AI usluge mogu biti skupe ako nisu pravilno konfigurirane

## Modul 2: Postavite svoju prvu AI aplikaciju

### Korak 2.1: Inicijalizirajte okruženje

1. **Kreirajte novo AZD okruženje:**
```bash
azd env new myai-workshop
```

2. **Postavite potrebne parametre:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Korak 2.2: Postavite infrastrukturu i aplikaciju

1. **Postavite s AZD-om:**
```bash
azd up
```

**Što se događa tijekom `azd up`:**
- ✅ Provisionira Microsoft Foundry Models uslugu
- ✅ Kreira Azure AI Search uslugu
- ✅ Postavlja Azure Container Apps za backend i zapakirani frontend (trenutni zadani uzorak)
- ✅ Konfigurira mrežu i sigurnost
- ✅ Postavlja aplikacijski kod
- ✅ Postavlja nadzor i bilježenje

2. **Pratite napredak postavljanja** i zabilježite resurse koji se stvaraju.

### Korak 2.3: Provjerite postavljanje

1. **Provjerite postavljene resurse:**
```bash
azd show
```

2. **Otvorite postavljenu aplikaciju:**
```bash
azd show
```

Otvorite web krajnju točku prikazanu u izlazu `azd show`.

3. **Testirajte AI funkcionalnost:**
   - Navigirajte do web aplikacije
   - Isprobajte primjere upita
   - Provjerite rade li AI odgovori

### **Vježba u laboratoriju 2.1: Vježba rješavanja problema**

**Scenarij**: Vaše postavljanje je uspjelo, ali AI ne odgovara.

**Uobičajeni problemi za provjeriti:**
1. **Autentifikacija**: Provjerite upravljani identitet i dodjele uloga; API ključeve provjerite samo ako ste namjerno omogućili autentifikaciju na temelju ključeva
2. **Dostupnost modela**: Provjerite podržava li vaša regija model
3. **Mrežna povezanost**: Provjerite mogu li usluge komunicirati
4. **RBAC dopuštenja**: Provjerite može li aplikacija pristupiti OpenAI-ju

**Naredbe za otklanjanje poteškoća:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagodba AI aplikacija vašim potrebama

### Korak 3.1: Izmijenite AI konfiguraciju

1. **Ažurirajte OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Dodajte dodatne AI usluge:**

Uredite `infra/main.bicep` za dodavanje Document Intelligence:

Slijedi ilustrativni isječak, ne potpuni predložak. Uzorak možda već provisionira usluge za obradu dokumenata: provjerite trenutnu infrastrukturu prije dodavanja dupliciranih resursa. Prilagodbe zahtijevaju povezivanje izlaza, identiteta i konfiguracije aplikacije.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Korak 3.2: Konfiguracije specifične za okruženje

**Najbolja praksa**: Različite konfiguracije za razvoj i produkciju.

1. **Kreirajte produkcijsko okruženje:**
```bash
azd env new myai-production
```

2. **Postavite parametre specifične za produkciju:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Ova imena dolaze iz [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) uzorka. `azd env set` pohranjuje vrijednost, ali ne čini proizvoljnu varijablu učinkovitu: predložak ga mora koristiti. Pregledajte [upute za mrežnu izolaciju](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) prije onemogućavanja javnog pristupa i koristite `azd up` za primjenu promjena infrastrukture. SKU OpenAI `S0` sam ne određuje propusnost modela; tip i kapacitet implementacije također utječu.

### **Vježba u laboratoriju 3.1: Optimizacija troškova**

**Izazov**: Konfigurirajte predložak za ekonomičan razvoj.

**Zadaci:**
1. Odaberite privremeno radno okruženje radionice: `azd env select myai-workshop`.
2. Zabilježite trenutni SKU za Search i kapacitet modela iz `infra/main.parameters.json` i odabranog okruženja.
3. Koristite podržane unose u nastavku, nakon potvrde kvote modela/regije:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Provjerite SKU Searcha i kapacitet implementacije na portalu te procijenite razliku pomoću kalkulatora cijena. Nemojte očekivati odmah ažuriranje podataka o naplati.

**Kriteriji uspjeha:** Search koristi Basic, implementacija chat-a ima traženi podržani kapacitet, a aplikacija i dalje odgovara na primjer pitanja. Kapacitet `10` je dodjela ograničenja brzine, a ne popust na cijenu tokena. Promjene u razini Searcha mogu biti ograničene ili zahtijevati rekreaciju; ne eksperimentirajte na produkcijskim resursima. F0 je specifičan za uslugu i nije SKU modela Azure OpenAI.

## Modul 4: Sigurnost i najbolje prakse za produkciju

### Korak 4.1: Sigurno upravljanje vjerodajnicama

**Trenutni izazov**: Mnoge AI aplikacije tvrdokodiraju API ključeve ili koriste nesigurno pohranjivanje.

**AZD rješenje**: Upravljani identitet + integracija Key Vault-a.

1. **Pregledajte sigurnosnu konfiguraciju u vašem predlošku:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Provjerite radi li upravljani identitet:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Mrežna sigurnost

1. **Omogućite privatne krajnje točke** koristeći mrežnu konfiguraciju podržanu u uzorku (ako već nije konfigurirano).

Za vlastiti predložak, ovaj ilustrativni isječak prikazuje vezu do OpenAI krajnje točke. Potreban je i VNet, privatna DNS konfiguracija i povezanost aplikacije; nemojte ga zalijepiti nepromijenjenog u uzorak koji već ima module za privatne krajnje točke:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
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

### Korak 4.3: Nadzor i promatranje

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Omogućite integraciju Application Insights uzorka:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Instrumentacija uzorka emitira telemetriju; proizvoljna postavka `OPENAI_MONITOR_ENABLED` ne uključuje AI metrike. Pregledajte tragove za pozive modela, latenciju, kvarove i korištenje tokena te izbjegavajte bilježenje osjetljivih upita ili odgovora.

### **Vježba u laboratoriju 4.1: Sigurnosni pregled**

**Zadatak**: Pregledajte svoje postavljanje s obzirom na najbolje sigurnosne prakse.

**Lista za provjeru:**
- [ ] Nema tvrdokodiranih tajni u kodu ili konfiguraciji
- [ ] Upravljani identitet koristi se za autentifikaciju između usluga
- [ ] Key Vault pohranjuje osjetljivu konfiguraciju
- [ ] Pristup mreži je pravilno ograničen
- [ ] Omogućen nadzor i bilježenje

## Modul 5: Pretvaranje vlastite AI aplikacije

### Korak 5.1: Radni list za procjenu

**Prije pretvaranja svoje aplikacije**, odgovorite na ova pitanja:

1. **Arhitektura aplikacije:**
   - Koje AI usluge koristi vaša aplikacija?
   - Koje računalne resurse treba?
   - Treba li joj baza podataka?
   - Koje su zavisnosti između usluga?

2. **Zahtjevi za sigurnost:**
   - Koje osjetljive podatke aplikacija obrađuje?
   - Koje zahtjeve prema usklađenosti imate?
   - Trebate li privatnu mrežu?

3. **Zahtjevi za skaliranje:**
   - Koje je očekivano opterećenje?
   - Trebate li automatsko skaliranje?
   - Imate li regionalne zahtjeve?

### Korak 5.2: Kreirajte svoj AZD predložak

**Slijedite ovaj obrazac za pretvorbu aplikacije:**

**Samo kostur:** Ovaj odjeljak ne sadrži izvorni kod API/web aplikacije, hostske infrastrukture, implementacija modela, identiteta/RBAC, ili kompletni `main.parameters.json`. Infrastruktura unutar Bicep modula pokazuje sastav modula; tipična ulazna točka AZD pretplate mora kreirati grupu resursa i pozvati je na toj razini. Nemojte očekivati da `azd up` implementira kompletnu aplikaciju samo kopiranjem ovih isječaka. Za pokretničku bazu nastavite koristiti RAG predložak iz Modula 1.

1. **Kreirajte osnovnu strukturu:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Kreirajte azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Kreirajte infrastrukturne predloške:**

**infra/main.bicep** - Glavni predložak:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI modul:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Vježba u laboratoriju 5.1: Izazov u stvaranju predloška**

**Izazov**: Kreirajte AZD predložak za AI aplikaciju za obradu dokumenata.

**Zahtjevi:**
- Microsoft Foundry Models za analizu sadržaja
- Document Intelligence za OCR
- Storage Account za prijenos dokumenata
- Function App za procesnu logiku
- Web aplikacija za korisničko sučelje

**Bonus bodovi:**
- Dodajte ispravno rukovanje pogreškama
- Uključite procjenu troškova
- Postavite nadzorne nadzorne ploče

## Modul 6: Rješavanje čestih problema

### Česti problemi pri postavljanju

#### Problem 1: Prekoračenje kvote OpenAI usluge
**Simptomi:** Postavljanje ne uspijeva s pogreškom kvote
**Rješenja:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model nije dostupan u regiji
**Simptomi:** AI odgovori ne uspijevaju ili su pogreške pri implementaciji modela
**Rješenja:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problem 3: Problemi s dozvolama
**Simptomi:** 403 Forbidden pogreške prilikom pozivanja AI usluga
**Rješenja:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi s performansama

#### Problem 4: Spori AI odgovori
**Koraci istraživanja:**
1. Provjerite metrike performansi u Application Insights
2. Pregledajte metrike OpenAI usluge u Azure portalu
3. Potvrdite mrežnu povezanost i latenciju

**Rješenja:**
- Implementirajte keširanje za uobičajene upite
- Koristite odgovarajući OpenAI model za svoj slučaj uporabe
- Skalirajte replike aplikacije tek nakon provjere ograničenja RPM/TPM modela; Azure OpenAI implementacije ne izlažu generičku postavku "read replica" baze podataka

### **Vježba u laboratoriju 6.1: Izazov u otklanjanju pogrešaka**

**Scenarij**: Vaše postavljanje je uspjelo, ali aplikacija vraća 500 pogreške.

**Zadaci za otklanjanje poteškoća:**
1. Provjerite dnevnike aplikacije
2. Provjerite povezanost usluga
3. Testiranje autentifikacije
4. Pregled konfiguracije

**Alati za korištenje:**
- `azd show` za pregled implementacije
- Azure portal za detaljne zapisnike usluge
- Application Insights za telemetriju aplikacije

## Modul 7: Praćenje i optimizacija

### Korak 7.1: Postavljanje sveobuhvatnog praćenja

1. **Izrada prilagođenih nadzornih ploča:**

Idite u Azure portal i napravite nadzornu ploču s:
- Brojem i kašnjenjem zahtjeva za OpenAI
- Stupnjem pogrešaka aplikacije
- Korištenjem resursa
- Praćenjem troškova

2. **Postavljanje upozorenja:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Provjerite ispušta li komponenta telemetriju zahtjeva i dodajte akcijsku grupu ako su obavijesti potrebne. Mjerač je broj, a ne postotak pogrešaka; upozorenje o stopi zahtijeva odgovarajući upit i nazivnik.

### Korak 7.2: Optimizacija troškova

1. **Analiza trenutnih troškova:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Zamijenite rezervirane znakove za datume. Podrška za Consumption API varira ovisno o ugovoru o naplati; koristite Cost Management u portalu ako detalji korištenja nisu dostupni. Troškovi su zakašnjeli, nisu testni orakl u stvarnom vremenu.

2. **Implementacija kontrole troškova:**
- Postavite upozorenja za proračun
- Koristite politike automatskog skaliranja
- Implementirajte spremanje odgovora u predmemoriju (caching)
- Pratite korištenje tokena za OpenAI

### **Laboratorijska vježba 7.1: Optimizacija performansi**

**Zadatak**: Optimizirajte svoju AI aplikaciju za performanse i troškove.

**Mjerni pokazatelji za poboljšanje:**
- Smanjiti prosječno vrijeme odgovora za 20%
- Smanjiti mjesečne troškove za 15%
- Definirati SLO dostupnosti od 99,9% i vremenski prozor za mjerenje (kratka laboratorijska vježba ne može pokazati mjesečni uptime)

**Strategije za isprobati:**
- Implementirati spremanje odgovora u predmemoriju
- Optimizirati upite za učinkovitost tokena
- Koristiti odgovarajuće SKU za računalne resurse
- Postaviti pravilno automatsko skaliranje

## Završni izazov: Implementacija od početka do kraja

### Scenarij izazova

Ovo je **neobavezni arhitektonski/dizajnerski izazov**, a ne isporučena vježba za pokretanje ili certifikacija za produkciju. Predložite AI chatbot za korisničku službu i dokumentirajte koje zahtjeve je potrebno dodatno implementirati i dokazati:

**Funkcionalni zahtjevi:**
- Web sučelje za korisničku interakciju
- Integracija s Microsoft Foundry Models za odgovore
- Mogućnost pretraživanja dokumenata pomoću Azure AI Search
- Integracija s postojećom bazom podataka korisnika
- Podrška za više jezika

**Nefunkcionalni zahtjevi:**
- Podrška za 1000 istovremenih korisnika
- SLA za dostupnost od 99,9%
- Usklađenost sa SOC 2
- Trošak ispod 500 USD mjesečno
- Implementacija u više okruženja (dev, staging, prod)

Ovo su hipotetska ograničenja dionika, a ne jamstva za istovremeni ishod. Definirajte stopu zahtjeva, veličine upita/odgovora te trajanje sesije prije procjene troškova; 1.000 istovremenih korisnika ne određuje opterećenje niti dokazuje izvedivost proračuna od 500 USD. SOC 2 je ishod organizacijskog audita, ne prekidač omogućen AZD predloškom. Identificirajte kompromise i odbacite neizvedive uvjete s dokazima.

### Koraci implementacije

1. **Dizajnirajte arhitekturu**
2. **Napravite AZD predložak**
3. **Implementirajte sigurnosne mjere**
4. **Postavite praćenje i upozorenja**
5. **Izradite implementacijske pipelineove**
6. **Dokumentirajte rješenje**

### Kriteriji ocjenjivanja

- ✅ **Funkcionalnost**: Jesu li implementirane sposobnosti demonstrirane, a preostale praznine jasno označene?
- ✅ **Sigurnost**: Jesu li implementirane najbolje prakse?
- ✅ **Skalabilnost**: Može li podnijeti opterećenje?
- ✅ **Održavanje**: Je li kod i infrastruktura dobro organizirana?
- ✅ **Troškovi**: Ostaje li unutar proračuna?

## Dodatni resursi

### Microsoft dokumentacija
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Dokumentacija](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Primjeri predložaka
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resursi zajednice
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Kontrolna točka završetka

Čestitamo! Završili ste AI radionicu. Sada biste trebali moći:

- ✅ Objasniti kako prilagoditi postojeću AI aplikaciju za AZD predložak
- ✅ Implementirati i testirati referentnu AI aplikaciju
- ✅ Implementirati najbolje sigurnosne prakse za AI radna opterećenja
- ✅ Pratiti i optimizirati performanse AI aplikacije
- ✅ Rješavati uobičajene probleme s implementacijom

**Čišćenje:** Pokrenite `azd env list`, odaberite svako jednokratno okruženje stvoreno u ovoj radionici (`myai-workshop`, i ako je implementirano `myai-production`/`myai-quota-test`), i pokrenite `azd down` u svakom. Pregledajte plan brisanja; samo brisanje lokalne konfiguracije okruženja ne briše Azure resurse. Izbjegavajte `--purge` osim ako ne razumijete nepovratno uklanjanje soft deleted resursa.

### Sljedeći koraci
1. Primijenite ove obrasce na svoje AI projekte
2. Doprinesite predlošcima nazad zajednici
3. Pridružite se Microsoft Foundry Discord zajednici za kontinuiranu podršku
4. Istražite napredne teme poput implementacija u više regija

---

**Povratne informacije o radionici**: Pomozite nam poboljšati ovu radionicu dijeleći svoje iskustvo u [Microsoft Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija poglavljem:**
- **📚 Početak tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvi razvoj
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse AI za produkciju](../chapter-08-production/production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se našoj zajednici za podršku i rasprave o AZD-u i AI implementacijama.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->