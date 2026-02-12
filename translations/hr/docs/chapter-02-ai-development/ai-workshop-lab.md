# AI radionica: Kako učiniti vaša AI rješenja deployabilnima s AZD

**Navigacija poglavljima:**
- **📚 Početna tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - Razvoj usmjeren na AI
- **⬅️ Prethodno**: [Raspoređivanje AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za AI u produkciji](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled radionice

Ova praktična radionica vodi razvojne inženjere kroz proces preuzimanja postojećeg AI predloška i njegovog raspoređivanja pomoću Azure Developer CLI (AZD). Naučit ćete ključne obrasce za produkcijska AI raspoređivanja koristeći Microsoft Foundry usluge.

**Trajanje:** 2-3 sata  
**Razina:** Srednja  
**Preduvjeti:** Osnovno znanje o Azureu, poznavanje koncepata AI/ML

## 🎓 Ciljevi učenja

Na kraju ove radionice moći ćete:
- ✅ Konvertirati postojeću AI aplikaciju za korištenje AZD predložaka
- ✅ Konfigurirati usluge Microsoft Foundry pomoću AZD-a
- ✅ Implementirati sigurno upravljanje vjerodajnicama za AI usluge
- ✅ Rasporediti AI aplikacije spremne za produkciju s nadzorom
- ✅ Otkloniti uobičajene probleme pri raspoređivanju AI-ja

## Preduvjeti

### Potrebni alati
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instaliran
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instaliran
- [Git](https://git-scm.com/) instaliran
- Uređivač koda (preporuča se VS Code)

### Azure resursi
- Pretplata na Azure s pristupom suradnika (contributor)
- Pristup Azure OpenAI uslugama (ili mogućnost zatraživanja pristupa)
- Dozvole za kreiranje grupa resursa

### Prethodno znanje
- Osnovno razumijevanje Azure usluga
- Poznavanje sučelja naredbenog retka
- Osnovni AI/ML pojmovi (API-ji, modeli, promptovi)

## Postavljanje laboratorija

### Korak 1: Priprema okoline

1. **Provjerite instalacije alata:**
```bash
# Provjerite instalaciju AZD
azd version

# Provjerite Azure CLI
az --version

# Prijavite se u Azure
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

Istražite ključne datoteke u AZD predlošku spremnom za AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Vježba 1.1: Istražite konfiguraciju**

1. **Pregledajte datoteku azure.yaml:**
```bash
cat azure.yaml
```

**Na što obratiti pažnju:**
- Definicije usluga za AI komponente
- Mapiranja varijabli okoline
- Konfiguracije hosta

2. **Pregledajte infrastrukturu main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI obrasci koje treba identificirati:**
- Postavljanje Azure OpenAI usluge
- Integracija Cognitive Search
- Sigurno upravljanje ključevima
- Konfiguracije mrežne sigurnosti

### **Diskusija:** Zašto su ovi obrasci važni za AI

- **Ovisnosti o uslugama**: AI aplikacije često zahtijevaju više koordiniranih usluga
- **Sigurnost**: API ključevi i krajnje točke trebaju sigurno upravljanje
- **Skalabilnost**: AI radna opterećenja imaju jedinstvene zahtjeve za skaliranjem
- **Upravljanje troškovima**: AI usluge mogu biti skupe ako nisu pravilno konfigurirane

## Modul 2: Rasporedite svoju prvu AI aplikaciju

### Korak 2.1: Inicijalizirajte okolinu

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

### Korak 2.2: Rasporedite infrastrukturu i aplikaciju

1. **Rasporedite pomoću AZD-a:**
```bash
azd up
```

**Što se događa tijekom `azd up`:**
- ✅ Postavlja Azure OpenAI uslugu
- ✅ Kreira Cognitive Search uslugu
- ✅ Postavlja App Service za web aplikaciju
- ✅ Konfigurira mrežu i sigurnost
- ✅ Raspoređuje kod aplikacije
- ✅ Postavlja nadzor i zapisivanje (logging)

2. **Pratite napredak raspoređivanja** i zabilježite resurse koji se kreiraju.

### Korak 2.3: Provjerite svoje raspoređivanje

1. **Provjerite raspoređene resurse:**
```bash
azd show
```

2. **Otvorite raspoređenu aplikaciju:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testirajte AI funkcionalnost:**
   - Idite na web aplikaciju
   - Isprobajte primjere upita
   - Potvrdite da AI odgovori rade

### **Vježba 2.1: Vježba otklanjanja pogrešaka**

**Scenarij**: Raspoređivanje je uspjelo, ali AI ne odgovara.

**Uobičajeni problemi koje treba provjeriti:**
1. **OpenAI API ključevi**: Provjerite jesu li ispravno postavljeni
2. **Dostupnost modela**: Provjerite podržava li vaša regija model
3. **Mrežna povezanost**: Osigurajte da usluge mogu komunicirati
4. **RBAC dozvole**: Provjerite može li aplikacija pristupiti OpenAI-u

**Naredbe za otklanjanje pogrešaka:**
```bash
# Provjeri varijable okruženja
azd env get-values

# Prikaži logove implementacije
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Provjeri status OpenAI implementacije
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagodba AI aplikacija vašim potrebama

### Korak 3.1: Izmijenite AI konfiguraciju

1. **Ažurirajte OpenAI model:**
```bash
# Pređite na drugi model (ako je dostupan u vašoj regiji)
azd env set AZURE_OPENAI_MODEL gpt-4

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

1. **Kreirajte produkcijsko okruženje:**
```bash
azd env new myai-production
```

2. **Postavite parametre specifične za produkciju:**
```bash
# U produkcijskom okruženju se obično koriste SKU-ovi viših razina
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogućite dodatne sigurnosne značajke
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Vježba 3.1: Optimizacija troškova**

**Izazov**: Konfigurirajte predložak za ekonomičan razvoj.

**Zadaci:**
1. Identificirajte koje SKU-ove možete postaviti na besplatne/osnovne razine
2. Konfigurirajte varijable okoline za minimalne troškove
3. Rasporedite i usporedite troškove s produkcijskom konfiguracijom

**Sugerirane smjernice za rješenje:**
- Koristite F0 (besplatni) sloj za Cognitive Services kad je moguće
- Koristite Basic sloj za Search Service u razvoju
- Razmotrite korištenje Consumption plana za Functions

## Modul 4: Sigurnost i najbolje prakse za produkciju

### Korak 4.1: Sigurno upravljanje vjerodajnicama

**Trenutni izazov**: Mnoge AI aplikacije ugrađuju API ključeve u kôd ili koriste nesigurno pohranjivanje.

**AZD rješenje**: Integracija Managed Identity + Key Vaulta.

1. **Pregledajte sigurnosnu konfiguraciju u vašem predlošku:**
```bash
# Potražite konfiguraciju Key Vaulta i upravljanog identiteta.
grep -r "keyVault\|managedIdentity" infra/
```

2. **Provjerite radi li Managed Identity:**
```bash
# Provjerite ima li web-aplikacija ispravnu konfiguraciju identiteta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Mrežna sigurnost

1. **Omogućite private endpoints** (ako već nisu konfigurirani):

Dodajte u svoj bicep predložak:
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

### Korak 4.3: Nadzor i uočljivost

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights bi trebao biti automatski konfiguriran
# Provjerite konfiguraciju:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Postavite nadzor specifičan za AI:**

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

### **Vježba 4.1: Sigurnosni audit**

**Zadatak**: Pregledajte svoje raspoređivanje u skladu s najboljim sigurnosnim praksama.

**Kontrolna lista:**
- [ ] Nema hardkodiranih tajni u kôdu ili konfiguraciji
- [ ] Managed Identity koristi se za autentikaciju između usluga
- [ ] Key Vault pohranjuje osjetljive konfiguracije
- [ ] Pristup mreži je pravilno ograničen
- [ ] Nadzor i zapisivanje su omogućeni

## Modul 5: Pretvaranje vaše AI aplikacije

### Korak 5.1: Upitnik za procjenu

**Prije nego što pretvorite aplikaciju**, odgovorite na ova pitanja:

1. **Arhitektura aplikacije:**
   - Koje AI usluge vaša aplikacija koristi?
   - Koje računalne resurse treba?
   - Zahteva li bazu podataka?
   - Koje su ovisnosti između usluga?

2. **Zahtjevi za sigurnost:**
   - Koje osjetljive podatke aplikacija obrađuje?
   - Koje zahtjeve usklađenosti imate?
   - Trebate li privatnu mrežu?

3. **Zahtjevi za skaliranje:**
   - Koje je očekivano opterećenje?
   - Trebate li automatsko skaliranje?
   - Postoje li regionalni zahtjevi?

### Korak 5.2: Kreirajte svoj AZD predložak

**Slijedite ovaj obrazac za pretvaranje aplikacije:**

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

### **Vježba 5.1: Izazov izrade predloška**

**Izazov**: Napravite AZD predložak za AI aplikaciju za obradu dokumenata.

**Zahtjevi:**
- Azure OpenAI za analizu sadržaja
- Document Intelligence za OCR
- Storage Account za prijenos dokumenata
- Function App za logiku obrade
- Web aplikacija za korisničko sučelje

**Bonus bodovi:**
- Dodajte odgovarajuće rukovanje pogreškama
- Uključite procjenu troškova
- Postavite nadzorne ploče

## Modul 6: Otklanjanje čestih problema

### Česti problemi pri raspoređivanju

#### Problem 1: Prekoračen kvota OpenAI usluge
**Simptomi:** Raspoređivanje ne uspijeva s pogreškom kvote
**Rješenja:**
```bash
# Provjerite trenutne kvote
az cognitiveservices usage list --location eastus

# Zatražite povećanje kvote ili pokušajte drugu regiju
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model nije dostupan u regiji
**Simptomi:** AI odgovori ne uspijevaju ili pogreške pri raspoređivanju modela
**Rješenja:**
```bash
# Provjerite dostupnost modela po regiji
az cognitiveservices model list --location eastus

# Ažurirajte na dostupan model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Problemi s dozvolama
**Simptomi:** 403 Forbidden pogreške prilikom poziva AI usluga
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
1. Provjerite Application Insights za metrike performansi
2. Pregledajte metrike OpenAI usluge u Azure portalu
3. Provjerite mrežnu povezanost i latenciju

**Rješenja:**
- Implementirajte keširanje za uobičajene upite
- Koristite odgovarajući OpenAI model za vaš slučaj upotrebe
- Razmislite o replicama za čitanje za scenarije visokog opterećenja

### **Vježba 6.1: Izazov otklanjanja pogrešaka**

**Scenarij**: Raspoređivanje je uspjelo, ali aplikacija vraća 500 pogrešaka.

**Zadaci za otklanjanje pogrešaka:**
1. Provjerite logove aplikacije
2. Provjerite povezanost usluga
3. Testirajte autentikaciju
4. Pregledajte konfiguraciju

**Alati za korištenje:**
- `azd show` za pregled raspoređivanja
- Azure portal za detaljne logove usluga
- Application Insights za telemetriju aplikacije

## Modul 7: Nadzor i optimizacija

### Korak 7.1: Postavite sveobuhvatan nadzor

1. **Kreirajte prilagođene nadzorne ploče:**

Idite u Azure portal i kreirajte ploču s:
- Broj zahtjeva prema OpenAI i latencija
- Stope pogrešaka aplikacije
- Iskorištenost resursa
- Praćenje troškova

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

1. **Analizirajte trenutne troškove:**
```bash
# Koristite Azure CLI za dohvaćanje podataka o troškovima
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementirajte kontrole troškova:**
- Postavite upozorenja za proračun
- Koristite politiku automatskog skaliranja
- Implementirajte keširanje zahtjeva
- Pratite upotrebu tokena za OpenAI

### **Vježba 7.1: Optimizacija performansi**

**Zadatak**: Optimizirajte svoju AI aplikaciju za performanse i troškove.

**Metrike za poboljšanje:**
- Smanjiti prosječno vrijeme odgovora za 20%
- Smanjiti mjesečne troškove za 15%
- Održavati 99,9% dostupnosti

**Strategije za isprobati:**
- Implementirajte keširanje odgovora
- Optimizirajte promptove za učinkovitost tokena
- Koristite odgovarajuće compute SKU-ove
- Postavite odgovarajuće automatsko skaliranje

## Završni izazov: Implementacija od kraja do kraja

### Scenarij izazova

Zadano vam je da napravite proizvodno spremnog AI chatbota za korisničku podršku sa sljedećim zahtjevima:

**Funkcionalni zahtjevi:**
- Web sučelje za interakcije s korisnicima
- Integracija s Azure OpenAI za odgovore
- Mogućnost pretraživanja dokumenata koristeći Cognitive Search
- Integracija s postojećom bazom podataka korisnika
- Podrška za više jezika

**Nefunkcionalni zahtjevi:**
- Podržati 1000 istovremenih korisnika
- 99,9% SLA dostupnosti
- Usklađenost sa SOC 2
- Trošak ispod $500/mjesečno
- Rasporediti u više okruženja (dev, staging, prod)

### Koraci implementacije

1. **Dizajnirajte arhitekturu**
2. **Kreirajte AZD predložak**
3. **Implementirajte sigurnosne mjere**
4. **Postavite nadzor i upozorenja**
5. **Kreirajte pipelines za raspoređivanje**
6. **Dokumentirajte rješenje**

### Kriteriji evaluacije

- ✅ **Funkcionalnost**: Zadovoljava li sve zahtjeve?
- ✅ **Sigurnost**: Jesu li implementirane najbolje prakse?
- ✅ **Skalabilnost**: Može li podnijeti opterećenje?
- ✅ **Održavanje**: Jesu li kôd i infrastruktura dobro organizirani?
- ✅ **Troškovi**: Ostaje li unutar budžeta?

## Dodatni resursi

### Microsoft dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Primjeri predložaka
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resursi zajednice
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikat o završetku
Čestitamo! Završili ste AI Workshop Lab. Sada biste trebali biti u mogućnosti:

- ✅ Pretvoriti postojeće AI aplikacije u AZD predloške
- ✅ Rasporediti proizvodno-spremne AI aplikacije
- ✅ Primijeniti najbolje sigurnosne prakse za AI radna opterećenja
- ✅ Nadzirati i optimizirati performanse AI aplikacija
- ✅ Otkloniti uobičajene probleme pri raspoređivanju

### Sljedeći koraci
1. Primijenite ove obrasce na vlastite AI projekte
2. Doprinesite predloške zajednici
3. Pridružite se Microsoft Foundry Discordu za kontinuiranu podršku
4. Istražite napredne teme poput raspoređivanja u više regija

---

**Povratne informacije o radionici**: Pomozite nam poboljšati ovu radionicu dijeljenjem vašeg iskustva u [Microsoft Foundry Discord #Azure kanal](https://discord.gg/microsoft-azure).

---

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - Razvoj usmjeren na AI
- **⬅️ Prethodno**: [Raspoređivanje AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za AI u produkciji](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se našoj zajednici za podršku i rasprave o AZD-u i raspoređivanju AI rješenja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj dokument preveden je pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni prijevod koji izvodi ljudski prevoditelj. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->