# AI Radionica Laboratorij: Kako Vaša AI Rješenja Učiniti AZD-Deployabilnima

**Navigacija po poglavljima:**
- **📚 Početna stranica tečaja**: [AZD Za Početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-First razvoj
- **⬅️ Prethodno**: [Postavljanje AI Modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za proizvodni AI](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled radionice

Ovaj praktični laboratorij vodi programere kroz proces uzimanja postojećeg AI predloška i njegove implementacije koristeći Azure Developer CLI (AZD). Naučit ćete ključne obrasce za produkcijske AI implementacije koristeći Microsoft Foundry usluge.

**Trajanje:** 2-3 sata  
**Razina:** Srednja  
**Preduvjeti:** Osnovno znanje o Azuru, poznavanje AI/ML koncepata

## 🎓 Ciljevi učenja

Na kraju ove radionice moći ćete:
- ✅ Pretvoriti postojeću AI aplikaciju za korištenje AZD predložaka
- ✅ Konfigurirati Microsoft Foundry usluge pomoću AZD-a
- ✅ Implementirati sigurno upravljanje vjerodajnicama za AI usluge
- ✅ Implementirati proizvodne AI aplikacije s nadzorom
- ✅ Rješavati uobičajene probleme u implementaciji AI-a

## Preduvjeti

### Potrebni alati
- Instaliran [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Instaliran [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Instaliran [Git](https://git-scm.com/)
- Uređivač koda (preporuča se VS Code)

### Azure resursi
- Pretplata na Azure s pristupom suradnika
- Pristup Microsoft Foundry Models uslugama (ili mogućnost zahtjeva pristupa)
- Dozvole za kreiranje resursnih grupa

### Znanja
- Osnovno razumijevanje Azure usluga
- Poznavanje naredbenog sučelja
- Osnovni AI/ML koncepti (API-ji, modeli, upiti)

## Postavljanje laboratorija

### Korak 1: Priprema okruženja

1. **Provjerite instalacije alata:**
```bash
# Provjerite instalaciju AZD
azd version

# Provjerite Azure CLI
az --version

# Prijava u Azure
az login
azd auth login
```

2. **Klonirajte repozitorij radionice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumijevanje AZD strukture za AI aplikacije

### Anatomija AI AZD predloška

Istražite ključne datoteke u AI spremnom AZD predlošku:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab vježba 1.1: Istražite konfiguraciju**

1. **Pregledajte datoteku azure.yaml:**
```bash
cat azure.yaml
```

**Na što obratiti pažnju:**
- Definicije usluga za AI komponente
- Mapiranja varijabli okoline
- Konfiguracije domaćina

2. **Pregledajte glavnu infrastrukturu main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI obrasci za prepoznati:**
- Provisioniranje Microsoft Foundry Models usluge
- Integracija Cognitive Search-a
- Sigurno upravljanje ključevima
- Konfiguracije mrežne sigurnosti

### **Tema rasprave:** Zašto su ovi obrasci važni za AI

- **Ovisnosti o uslugama**: AI aplikacije često zahtijevaju koordinirane višestruke usluge
- **Sigurnost**: API ključevi i krajnje točke trebaju sigurno upravljanje
- **Skalabilnost**: AI radna opterećenja imaju jedinstvene zahtjeve skaliranja
- **Upravljanje troškovima**: AI usluge mogu biti skupe ako nisu pravilno konfigurirane

## Modul 2: Implementirajte svoju prvu AI aplikaciju

### Korak 2.1: Inicijalizacija okruženja

1. **Kreirajte novo AZD okruženje:**
```bash
azd env new myai-workshop
```

2. **Postavite potrebne parametre:**
```bash
# Postavite željenu Azure regiju
azd env set AZURE_LOCATION eastus

# Opcionalno: Postavite određeni OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Korak 2.2: Implementirajte infrastrukturu i aplikaciju

1. **Implementirajte s AZD:**
```bash
azd up
```

**Što se događa tijekom `azd up`:**
- ✅ Kreira Microsoft Foundry Models uslugu
- ✅ Kreira Cognitive Search uslugu
- ✅ Postavlja App Service za web aplikaciju
- ✅ Konfigurira mrežu i sigurnost
- ✅ Implementira aplikacijski kod
- ✅ Postavlja nadzor i zapisivanje

2. **Pratite napredak implementacije** i zabilježite kreirane resurse.

### Korak 2.3: Provjerite implementaciju

1. **Provjerite implementirane resurse:**
```bash
azd show
```

2. **Otvorite implementiranu aplikaciju:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testirajte AI funkcionalnost:**
   - Posjetite web aplikaciju
   - Isprobajte uzorke upita
   - Provjerite rade li AI odgovori ispravno

### **Lab vježba 2.1: Vježba otklanjanja problema**

**Scenarij**: Implementacija je uspjela, ali AI ne odgovara.

**Uobičajeni problemi za provjeru:**
1. **OpenAI API ključevi**: Provjerite jesu li ispravno postavljeni
2. **Dostupnost modela**: Provjerite podržava li regija model
3. **Mrežna povezanost**: Provjerite mogu li usluge međusobno komunicirati
4. **RBAC dozvole**: Provjerite ima li aplikacija pristup OpenAI-u

**Naredbe za otklanjanje problema:**
```bash
# Provjeri varijable okoline
azd env get-values

# Pogledaj zapisnike implementacije
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Provjeri status implementacije OpenAI-a
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagodba AI aplikacija vašim potrebama

### Korak 3.1: Izmjena AI konfiguracije

1. **Ažurirajte OpenAI model:**
```bash
# Promijenite u drugi model (ako je dostupan u vašoj regiji)
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

### Korak 3.2: Konfiguracije specifične za okruženje

**Najbolja praksa**: Različite konfiguracije za razvoj i proizvodnju.

1. **Kreirajte produkcijsko okruženje:**
```bash
azd env new myai-production
```

2. **Postavite parametre specifične za produkciju:**
```bash
# U proizvodnji se obično koriste skuplji SKU-ovi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogući dodatne sigurnosne značajke
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab vježba 3.1: Optimizacija troškova**

**Zadatak**: Konfigurirajte predložak za ekonomičnu razvojnu upotrebu.

**Zadaci:**
1. Identificirajte koje SKU-ove možete postaviti na besplatne/osnovne razine
2. Konfigurirajte varijable okoline za minimalne troškove
3. Implementirajte i usporedite troškove s produkcijskom konfiguracijom

**Pokazatelji rješenja:**
- Koristite F0 (besplatni) nivo za Cognitive Services gdje je moguće
- Koristite osnovni nivo za Search service u razvoju
- Razmislite o korištenju planova potrošnje za Functions

## Modul 4: Sigurnost i najbolje prakse za proizvodnju

### Korak 4.1: Sigurno upravljanje vjerodajnicama

**Trenutni izazov**: Mnoge AI aplikacije tvrdo ugrađuju API ključeve ili koriste nesigurno spremište.

**AZD rješenje**: Managed Identity + integracija s Key Vaultom.

1. **Pregledajte sigurnosnu konfiguraciju u svom predlošku:**
```bash
# Potražite konfiguraciju Key Vaulta i Managed Identityja
grep -r "keyVault\|managedIdentity" infra/
```

2. **Provjerite funkcionira li Managed Identity:**
```bash
# Provjerite ima li web aplikacija ispravnu konfiguraciju identiteta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Mrežna sigurnost

1. **Omogućite privatne krajnje točke** (ako nisu već konfigurirane):

Dodajte u bicep predložak:
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

### Korak 4.3: Nadzor i opažanje

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights bi trebao biti automatski konfiguriran
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

### **Lab vježba 4.1: Sigurnosni audit**

**Zadatak**: Pregledajte vašu implementaciju u smislu sigurnosnih najboljih praksi.

**Kontrolna lista:**
- [ ] Nema tvrdo ugrađenih tajni u kodu ili konfiguraciji
- [ ] Managed Identity se koristi za autentikaciju usluga
- [ ] Key Vault pohranjuje osjetljive konfiguracije
- [ ] Pristup mreži je pravilno ograničen
- [ ] Nadzor i zapisivanje su omogućeni

## Modul 5: Pretvaranje vlastite AI aplikacije

### Korak 5.1: Radni list za procjenu

**Prije pretvaranja svoje aplikacije**, odgovorite na sljedeća pitanja:

1. **Arhitektura aplikacije:**
   - Koje AI usluge koristi vaša aplikacija?
   - Koji računalni resursi su potrebni?
   - Treba li baza podataka?
   - Koje su ovisnosti između usluga?

2. **Sigurnosni zahtjevi:**
   - Koje osjetljive podatke vaša aplikacija obrađuje?
   - Koje zahtjeve usklađenosti imate?
   - Trebate li privatnu mrežu?

3. **Zahtjevi skaliranja:**
   - Koje je očekivano opterećenje?
   - Trebate li automatsko skaliranje?
   - Postoje li regionalni zahtjevi?

### Korak 5.2: Kreirajte svoj AZD predložak

**Slijedite ovaj obrazac za pretvaranje aplikacije:**

1. **Napravite osnovnu strukturu:**
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab vježba 5.1: Izazov izrade predloška**

**Izazov**: Izradite AZD predložak za AI aplikaciju za obradu dokumenata.

**Zahtjevi:**
- Microsoft Foundry Models za analizu sadržaja
- Document Intelligence za OCR
- Storage Account za upload dokumenata
- Function App za logiku obrade
- Web aplikacija za korisničko sučelje

**Bonus bodovi:**
- Dodajte pravilno rukovanje greškama
- Uključite procjenu troškova
- Postavite nadzorne nadzorne ploče

## Modul 6: Rješavanje uobičajenih problema

### Uobičajeni problemi prilikom implementacije

#### Problem 1: Prekoračenje kvote OpenAI usluge
**Simptomi:** Implementacija ne uspijeva uz poruku o kvoti
**Rješenja:**
```bash
# Provjerite trenutne kvote
az cognitiveservices usage list --location eastus

# Zatražite povećanje kvote ili pokušajte drugu regiju
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model nije dostupan u regiji
**Simptomi:** AI odgovori ne rade ili pogreške u implementaciji modela
**Rješenja:**
```bash
# Provjeri dostupnost modela po regiji
az cognitiveservices model list --location eastus

# Ažuriraj na dostupni model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Problemi s dozvolama
**Simptomi:** 403 Forbidden greške kod poziva AI usluga
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
1. Provjerite metrike performansi u Application Insights
2. Pregledajte OpenAI metrike u Azure portalu
3. Provjerite mrežnu povezanost i latenciju

**Rješenja:**
- Implementirajte cache za često korištene upite
- Koristite prikladan OpenAI model za vaš slučaj
- Razmislite o čitanju replika za visokoprometne scenarije

### **Lab vježba 6.1: Izazov otklanjanja problema**

**Scenarij**: Vaša implementacija je uspjela, ali aplikacija vraća 500 greške.

**Zadaci za otklanjanje problema:**
1. Provjerite aplikacijske dnevnike
2. Potvrdite povezivost usluga
3. Testirajte autentikaciju
4. Pregledajte konfiguraciju

**Alati za korištenje:**
- `azd show` za pregled implementacije
- Azure portal za detaljne dnevnike servisa
- Application Insights za telemetriju aplikacije

## Modul 7: Nadzor i optimizacija

### Korak 7.1: Postavljanje sveobuhvatnog nadzora

1. **Kreirajte prilagođene nadzorne ploče:**

Idite u Azure portal i kreirajte ploču s:
- Brojem OpenAI zahtjeva i kašnjenjem
- Stope grešaka aplikacije
- Korištenje resursa
- Praćenje troškova

2. **Postavite upozorenja:**
```bash
# Upozorenje za visok postotak pogrešaka
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Korak 7.2: Optimizacija troškova

1. **Analizirajte trenutne troškove:**
```bash
# Koristite Azure CLI za dobivanje podataka o troškovima
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementirajte kontrole troškova:**
- Postavite budžetne alarme
- Koristite politike automatskog skaliranja
- Implementirajte cache zahtjeva
- Pratite korištenje tokena za OpenAI

### **Lab vježba 7.1: Optimizacija performansi**

**Zadatak**: Optimizirajte svoju AI aplikaciju i za performanse i troškove.

**Metričke za poboljšati:**
- Smanjite prosječno vrijeme odgovora za 20%
- Smanjite mjesečne troškove za 15%
- Održavajte 99,9% dostupnosti

**Strategije za isprobati:**
- Implementirajte cache odgovora
- Optimizirajte upite za učinkovitost tokena
- Koristite prikladne SKU-ove za računanje
- Postavite pravilno automatsko skaliranje

## Završni izazov: Implementacija od početka do kraja

### Scenarij izazova

Zadatak vam je izraditi produkcijski spremnog AI-pogonjenog chatbota za korisničku službu s ovim zahtjevima:

**Funkcionalni zahtjevi:**
- Web sučelje za korisničku komunikaciju
- Integracija s Microsoft Foundry Models za odgovore
- Mogućnost pretraživanja dokumenata koristeći Cognitive Search
- Integracija s postojećom bazom podataka korisnika
- Podrška za više jezika

**Nefunkcionalni zahtjevi:**
- Podrška za 1000 istovremenih korisnika
- 99,9% SLA dostupnost
- SOC 2 usklađenost
- Trošak ispod 500 USD/mjesečno
- Implementacija u više okruženja (razvoj, staging, produkcija)

### Koraci implementacije

1. **Dizajnirajte arhitekturu**
2. **Kreirajte AZD predložak**
3. **Implementirajte sigurnosne mjere**
4. **Postavite nadzor i upozorenja**
5. **Kreirajte pipelines za implementaciju**
6. **Dokumentirajte rješenje**

### Kriteriji ocjenjivanja

- ✅ **Funkcionalnost**: Zadovoljava li sve zahtjeve?
- ✅ **Sigurnost**: Jesu li najbolje prakse implementirane?
- ✅ **Skalabilnost**: Može li podnijeti opterećenje?
- ✅ **Održavanje**: Je li kod i infrastruktura dobro organizirana?
- ✅ **Trošak**: Ostaje li unutar budžeta?

## Dodatni resursi

### Microsoft dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service dokumentacija](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Primjeri predložaka
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Zajednički resursi
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Potvrda o završenom tečaju

Čestitamo! Završili ste AI radionicu laboratorij. Sada biste trebali moći:
- ✅ Pretvori postojeće AI aplikacije u AZD predloške
- ✅ Izvedi AI aplikacije spremne za proizvodnju
- ✅ Implementiraj najbolje sigurnosne prakse za AI radna opterećenja
- ✅ Nadgledaj i optimiziraj performanse AI aplikacija
- ✅ Rješavaj uobičajene probleme pri implementaciji

### Sljedeći koraci
1. Primijeni ove obrasce na vlastite AI projekte
2. Vrati predloške zajednici
3. Pridruži se Microsoft Foundry Discordu za kontinuiranu podršku
4. Istraži napredne teme poput implementacija u više regija

---

**Povratne informacije o radionici**: Pomozite nam poboljšati ovu radionicu dijeleći svoje iskustvo u [Microsoft Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvi razvoj
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za proizvodni AI](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se našoj zajednici za podršku i rasprave o AZD-u i AI implementacijama.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim izvorom. Za važne informacije preporučuje se stručni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->