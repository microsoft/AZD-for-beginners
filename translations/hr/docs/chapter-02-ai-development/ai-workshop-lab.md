# AI Radionica Lab: Izrada Vaših AI Rješenja koja se Mogu Rasporediti putem AZD-a

**Navigacija po poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-Prvo Razvoj
- **⬅️ Prethodno**: [Raspoređivanje AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled radionice

Ovaj praktični laboratorij vodi programere kroz proces preuzimanja postojećeg AI predloška i njegovog raspoređivanja pomoću Azure Developer CLI-ja (AZD). Naučit ćete ključne obrasce za produkcijsko raspoređivanje AI rješenja koristeći Microsoft Foundry usluge.

> **Napomena o validaciji (2026-03-25):** Ova radionica je pregledana s verzijom `azd` `1.23.12`. Ako je vaša lokalna instalacija starija, ažurirajte AZD prije početka kako bi autentikacija, predložak i tijek raspoređivanja odgovarali koracima u nastavku.

**Trajanje:** 2-3 sata  
**Razina:** Srednja  
**Preduvjeti:** Osnovno znanje o Azureu, upoznatost s AI/ML konceptima

## 🎓 Ciljevi učenja

Do kraja ove radionice bit ćete sposobni:
- ✅ Pretvoriti postojeću AI aplikaciju da koristi AZD predloške
- ✅ Konfigurirati Microsoft Foundry usluge putem AZD-a
- ✅ Implementirati sigurnu upravu vjerodajnicama za AI usluge
- ✅ Rasporediti produkcijski spremne AI aplikacije s nadzorom
- ✅ Rješavati uobičajene probleme pri AI raspoređivanju

## Preduvjeti

### Potrebni alati
- Instaliran [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Instaliran [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Instaliran [Git](https://git-scm.com/)
- Uređivač koda (preporuča se VS Code)

### Azure resursi
- Azure pretplata s pristupom doprinosaču
- Pristup Microsoft Foundry Models uslugama (ili mogućnost zahtjeva pristupa)
- Dozvole za kreiranje grupe resursa

### Znanje preduvjeti
- Osnovno razumijevanje Azure usluga
- Upoznavanje s komandnom linijom
- Osnovni AI/ML koncepti (API-ji, modeli, upiti)

## Postavljanje laboratorija

### Korak 1: Priprema okoline

1. **Potvrdite instalacije alata:**
```bash
# Provjerite instalaciju AZD-a
azd version

# Provjerite Azure CLI
az --version

# Prijavite se u Azure za AZD radne procese
azd auth login

# Prijavite se u Azure CLI samo ako planirate pokretati az naredbe tijekom dijagnostike
az login
```

Ako radite u više klijenata ili vaša pretplata nije automatski detektirana, pokušajte ponovno s `azd auth login --tenant-id <tenant-id>`.

2. **Klonirajte repozitorij radionice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumijevanje AZD strukture za AI aplikacije

### Anatomija AZD predloška za AI

Istražite ključne datoteke u AI-pretposloženom AZD predlošku:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Vježba u laboratoriju 1.1: Istražite konfiguraciju**

1. **Pregledajte datoteku azure.yaml:**
```bash
cat azure.yaml
```

**Što tražiti:**
- Definicije usluga za AI komponente
- Mapiranje varijabli okoline
- Konfiguracije hosta

2. **Pregled glavnog bicep infrastrukture:**
```bash
cat infra/main.bicep
```

**Ključni AI obrasci za prepoznati:**
- Provisioning Microsoft Foundry Models usluge
- Integracija Azure AI Search
- Sigurno upravljanje ključevima
- Konfiguracija mrežne sigurnosti

### **Diskusijska točka:** Zašto su ovi obrasci važni za AI

- **Ovisnosti o uslugama:** AI aplikacije često zahtijevaju koordinirane višestruke usluge
- **Sigurnost:** API ključevi i krajnje točke zahtijevaju sigurnu upravu
- **Skalabilnost:** AI radna opterećenja imaju jedinstvene zahtjeve za skaliranjem
- **Upravljanje troškovima:** AI usluge mogu biti skupe ako nisu pravilno konfigurirane

## Modul 2: Rasporedite svoju prvu AI aplikaciju

### Korak 2.1: Inicijalizacija okoline

1. **Kreirajte novu AZD okolinu:**
```bash
azd env new myai-workshop
```

2. **Postavite potrebne parametre:**
```bash
# Postavite željenu Azure regiju
azd env set AZURE_LOCATION eastus

# Opcionalno: Postavite određeni OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Korak 2.2: Raspored infrastrukture i aplikacije

1. **Rasporedite s AZD-om:**
```bash
azd up
```

**Što se događa tijekom `azd up`:**
- ✅ Provisonira Microsoft Foundry Models uslugu
- ✅ Kreira Azure AI Search uslugu
- ✅ Postavlja App Service za web aplikaciju
- ✅ Konfigurira mrežu i sigurnost
- ✅ Raspoređuje aplikacijski kod
- ✅ Postavlja nadzor i zapisivanje

2. **Pratite napredak raspoređivanja** i zabilježite kreirane resurse.

### Korak 2.3: Provjerite raspoređivanje

1. **Provjerite raspoređene resurse:**
```bash
azd show
```

2. **Otvorite raspoređenu aplikaciju:**
```bash
azd show
```

Otvorite web krajnju točku prikazanu u izlazu `azd show`.

3. **Testirajte AI funkcionalnost:**
   - Posjetite web aplikaciju
   - Isprobajte primjere upita
   - Provjerite funkcioniraju li AI odgovori

### **Vježba u laboratoriju 2.1: Praksa rješavanja problema**

**Scenarij:** Vaše raspoređivanje je uspjelo, ali AI ne odgovara.

**Uobičajeni problemi za provjeru:**
1. **OpenAI API ključevi**: Provjerite jesu li ispravno postavljeni
2. **Dostupnost modela**: Provjerite podržava li vaša regija model
3. **Mrežna povezanost**: Osigurajte da usluge mogu međusobno komunicirati
4. **RBAC dopuštenja**: Provjerite može li aplikacija pristupiti OpenAI

**Naredbe za otklanjanje poteškoća:**
```bash
# Provjerite varijable okoline
azd env get-values

# Pogledajte dnevnike implementacije
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Provjerite status OpenAI implementacije
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagodba AI aplikacija za vaše potrebe

### Korak 3.1: Izmijenite AI konfiguraciju

1. **Ažurirajte OpenAI model:**
```bash
# Promijenite na drugi model (ako je dostupan u vašoj regiji)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ponovno implementirajte s novom konfiguracijom
azd deploy
```

2. **Dodajte dodatne AI usluge:**

Uredite `infra/main.bicep` za dodavanje Document Intelligence:

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

### Korak 3.2: Konfiguracije specifične za okolinu

**Najbolja praksa**: Različite konfiguracije za razvoj i produkciju.

1. **Kreirajte produkcijsku okolinu:**
```bash
azd env new myai-production
```

2. **Postavite parametre specifične za produkciju:**
```bash
# Proizvodnja obično koristi više SKU-ova
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogući dodatne sigurnosne značajke
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Vježba u laboratoriju 3.1: Optimizacija troškova**

**Izazov:** Konfigurirajte predložak za razvoj s kontrolom troškova.

**Zadaci:**
1. Identificirajte koje SKU-ove je moguće postaviti na besplatni/osnovni plan
2. Konfigurirajte varijable okoline za minimalne troškove
3. Rasporedite i usporedite troškove s produkcijskom konfiguracijom

**Načini rješenja:**
- Koristite F0 (besplatni) nivo za Azure AI usluge gdje je moguće
- Koristite osnovni nivo za Search service tijekom razvoja
- Razmotrite korištenje Consumption plana za Functions

## Modul 4: Sigurnost i najbolja praksa za produkciju

### Korak 4.1: Sigurna uprava vjerodajnicama

**Trenutni izazov:** Mnoge AI aplikacije hardkodiraju API ključeve ili koriste nesigurno pohranjivanje.

**AZD rješenje:** Upravljani identitet + integracija s Key Vaultom.

1. **Pregledajte sigurnosnu konfiguraciju u vašem predlošku:**
```bash
# Potražite konfiguraciju Key Vault-a i upravljanog identiteta
grep -r "keyVault\|managedIdentity" infra/
```

2. **Provjerite radi li Managed Identity:**
```bash
# Provjerite ima li web aplikacija ispravnu konfiguraciju identiteta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Sigurnost mreže

1. **Omogućite privatne krajnje točke** (ako već nisu konfigurirane):

Dodajte u vaš bicep predložak:
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

### Korak 4.3: Nadzor i mogućnost opažanja

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights treba biti automatski konfiguriran
# Provjerite konfiguraciju:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Postavite AI-specifični nadzor:**

Dodajte prilagođene metrike za AI operacije:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Vježba u laboratoriju 4.1: Sigurnosni pregled**

**Zadatak:** Pregledajte svoje raspoređivanje za sigurnosne najbolje prakse.

**Kontrolni popis:**
- [ ] Nema hardkodiranih tajni u kodu ili konfiguraciji
- [ ] Koristi se Managed Identity za autenticiranje usluga
- [ ] Key Vault pohranjuje osjetljive konfiguracije
- [ ] Mrežni pristup je pravilno ograničen
- [ ] Nadzor i zapisivanje su omogućeni

## Modul 5: Pretvorba vlastite AI aplikacije

### Korak 5.1: Upitnik za procjenu

**Prije pretvorbe vaše aplikacije**, odgovorite na sljedeća pitanja:

1. **Arhitektura aplikacije:**
   - Koje AI usluge vaša aplikacija koristi?
   - Koje računalne resurse zahtijeva?
   - Treba li joj baza podataka?
   - Koje su ovisnosti između usluga?

2. **Sigurnosni zahtjevi:**
   - Koje osjetljive podatke aplikacija obrađuje?
   - Koje su vaše zahtjeve za usklađenošću?
   - Trebate li privatnu mrežu?

3. **Zahtjevi skaliranja:**
   - Koje je očekivano opterećenje?
   - Trebate li automatsko skaliranje?
   - Postoje li regionalni zahtjevi?

### Korak 5.2: Kreirajte svoj AZD predložak

**Slijedite ovaj obrazac za pretvorbu vaše aplikacije:**

1. **Kreirajte osnovnu strukturu:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicijaliziraj AZD predložak
azd init --template minimal
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

3. **Kreirajte infrastrukturalne predloške:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Vježba u laboratoriju 5.1: Izazov izrade predloška**

**Izazov:** Izradite AZD predložak za AI aplikaciju za obradu dokumenata.

**Zahtjevi:**
- Microsoft Foundry Models za analizu sadržaja
- Document Intelligence za OCR
- Storage Account za učitavanje dokumenata
- Function App za logiku obrade
- Web aplikacija za korisničko sučelje

**Bonus bodovi:**
- Dodajte ispravno rukovanje greškama
- Uključite procjenu troškova
- Postavite nadzorne nadzorne ploče

## Modul 6: Rješavanje uobičajenih problema

### Uobičajeni problemi pri raspoređivanju

#### Problem 1: Dosegnut kvota OpenAI usluge
**Simptomi:** Raspoređivanje ne uspijeva s porukom o kvoti  
**Rješenja:**
```bash
# Provjerite trenutne kvote
az cognitiveservices usage list --location eastus

# Zatražite povećanje kvote ili pokušajte drugu regiju
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model nije dostupan u regiji
**Simptomi:** AI odgovori ne rade ili greške pri raspoređivanju modela  
**Rješenja:**
```bash
# Provjerite dostupnost modela po regiji
az cognitiveservices model list --location eastus

# Ažuriraj na dostupni model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Problemi s dopuštenjima
**Simptomi:** 403 Forbidden greške pri pozivima AI usluga  
**Rješenja:**
```bash
# Provjeri dodjele uloga
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Dodaj nedostajuće uloge
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi s performansama

#### Problem 4: Spori AI odgovori
**Koraci istraživanja:**
1. Provjerite Application Insights metrike performansi
2. Pregledajte metrike OpenAI usluge u Azure portalu
3. Provjerite mrežnu povezanost i latenciju

**Rješenja:**
- Implementirajte međuspremnik za česte upite
- Koristite odgovarajući OpenAI model za vaš slučaj upotrebe
- Razmotrite korištenje read replica za velika opterećenja

### **Vježba u laboratoriju 6.1: Izazov otklanjanja grešaka**

**Scenarij:** Raspoređivanje je uspješno, ali aplikacija vraća 500 greške.

**Zadaci za otklanjanje poteškoća:**
1. Pregledajte aplikacijske dnevnike
2. Provjerite povezanost usluga
3. Testirajte autentikaciju
4. Pregledajte konfiguraciju

**Alati za korištenje:**
- `azd show` za pregled raspoređivanja
- Azure portal za detaljne dnevnike usluga
- Application Insights za telemetriju aplikacije

## Modul 7: Nadzor i optimizacija

### Korak 7.1: Postavite sveobuhvatni nadzor

1. **Kreirajte prilagođene nadzorne ploče:**

U Azure portalu kreirajte ploču s:
- Brojem i latencijom OpenAI zahtjeva
- Stopama grešaka aplikacije
- Iskorištenjem resursa
- Praćenjem troškova

2. **Postavite upozorenja:**
```bash
# Upozorenje za visoku stopu pogrešaka
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Korak 7.2: Optimizacija troškova

1. **Analizirajte postojeće troškove:**
```bash
# Koristite Azure CLI za dobivanje podataka o troškovima
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Provedite kontrole troškova:**
- Postavite budžetska upozorenja
- Koristite politike automatskog skaliranja
- Implementirajte međuspremnik zahtjeva
- Nadgledajte potrošnju tokena za OpenAI

### **Vježba u laboratoriju 7.1: Optimizacija performansi**

**Zadatak:** Optimizirajte AI aplikaciju i za performanse i za troškove.

**Metrički ciljevi:**
- Smanjite prosječno vrijeme reakcije za 20%
- Smanjite mjesečne troškove za 15%
- Održavajte 99.9% dostupnosti

**Strategije za isprobati:**
- Implementirajte caching odgovora
- Optimizirajte upite za učinkovitost tokena
- Koristite odgovarajuće SKU-ove računalnih resursa
- Postavite pravilno automatsko skaliranje

## Završni izazov: Implementacija od početka do kraja

### Scenarij izazova

Zadani vam je zadatak da kreirate produkcijski spremnog AI pokretanog chatbota za korisničku službu sa sljedećim zahtjevima:

**Funkcionalni zahtjevi:**
- Web sučelje za interakciju s korisnicima
- Integracija s Microsoft Foundry Models za odgovore
- Mogućnost pretraživanja dokumenata putem Azure AI Search
- Integracija s postojećom bazom podataka korisnika
- Podrška za više jezika

**Nefunkcionalni zahtjevi:**
- Podržava 1000 istovremenih korisnika
- 99.9% SLA dostupnost
- SOC 2 usklađenost
- Trošak ispod 500 USD mjesečno
- Raspoređivanje u više okolina (razvoj, test, produkcija)

### Koraci implementacije

1. **Dizajnirajte arhitekturu**
2. **Kreirajte AZD predložak**
3. **Implementirajte sigurnosne mjere**
4. **Postavite nadzor i upozorenja**
5. **Kreirajte pipeline-ove za raspoređivanje**
6. **Dokumentirajte rješenje**

### Kriteriji ocjenjivanja

- ✅ **Funkcionalnost:** Zadovoljava li sve zahtjeve?
- ✅ **Sigurnost:** Jesu li implementirane najbolje prakse?
- ✅ **Skalabilnost:** Može li podnijeti opterećenje?
- ✅ **Održavanje:** Je li kod i infrastruktura dobro organizirana?
- ✅ **Troškovi:** Ostaje li unutar budžeta?

## Dodatni resursi

### Microsoft dokumentacija
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija Microsoft Foundry Models usluge](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Primjer predložaka
- [Microsoft Foundry Models Chat aplikacija](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resursi zajednice
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Potvrda o završetku

Čestitamo! Završili ste AI Workshop Lab. Sada biste trebali moći:

- ✅ Pretvoriti postojeće AI aplikacije u AZD predloške
- ✅ Implementirati AI aplikacije spremne za produkciju
- ✅ Primijeniti najbolje sigurnosne prakse za AI radna opterećenja
- ✅ Pratiti i optimizirati performanse AI aplikacija
- ✅ Rješavati uobičajene probleme s implementacijom

### Sljedeći koraci
1. Primijenite ove obrasce na vlastite AI projekte
2. Doprinijeti predlošcima zajednici
3. Pridružite se Microsoft Foundry Discordu za stalnu podršku
4. Istražite napredne teme poput implementacija u više regija

---

**Povratne informacije o radionici**: Pomozite nam poboljšati ovu radionicu dijeljenjem svojih iskustava na [Microsoft Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo razvoj
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se našoj zajednici za podršku i rasprave o AZD-u i AI implementacijama.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->