# AI Radionica Lab: Kako napraviti da vaša AI rješenja budu AZD-deployabilna

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-Prvi razvoj
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za AI u produkciji](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled radionice

Ovaj praktični lab vodi programere kroz proces preuzimanja postojećeg AI predloška i njegovo implementiranje pomoću Azure Developer CLI (AZD). Naučit ćete ključne uzorke za produkcijsku AI implementaciju koristeći Microsoft Foundry usluge.

> **Napomena o validaciji (2026-07-13):** Ova radionica je testirana s `azd` verzijom `1.27.1`. Ako je vaša lokalna instalacija starija, ažurirajte AZD prije početka kako bi autorizacija, predložak i tok rada implementacije odgovarali donjim koracima.

**Trajanje:** 2-3 sata  
**Razina:** Srednja  
**Preduvjeti:** Osnovno znanje o Azure, poznavanje AI/ML pojmova

## 🎓 Ciljevi učenja

Do kraja ove radionice moći ćete:
- ✅ Pretvoriti postojeću AI aplikaciju da koristi AZD predloške
- ✅ Konfigurirati Microsoft Foundry usluge s AZD-om
- ✅ Implementirati sigurnu upravu vjerodajnica za AI usluge
- ✅ Implementirati produkcijske AI aplikacije s praćenjem
- ✅ Rješavati uobičajene probleme s implementacijom AI

## Preduvjeti

### Potrebni alati
- Instaliran [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Instaliran [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Instaliran [Git](https://git-scm.com/)
- Uređivač koda (preporučeni VS Code)

### Azure Resursi
- Azure pretplata s pristupom kao suradnik
- Pristup Microsoft Foundry Models uslugama (ili mogućnost zahtjeva pristupa)
- Dozvole za kreiranje grupe resursa

### Znanje kao preduvjet
- Osnovno razumijevanje Azure usluga
- Poznavanje naredbenog retka
- Osnovni AI/ML pojmovi (API-ji, modeli, upiti)

## Postavljanje laboratorija

### Korak 1: Priprema okruženja

1. **Provjerite instalirane alate:**
```bash
# Provjerite instalaciju AZD-a
azd version

# Provjerite Azure CLI
az --version

# Prijavite se u Azure za AZD tijekove rada
azd auth login

# Prijavite se u Azure CLI samo ako planirate pokretati az naredbe tijekom dijagnostike
az login
```

Ako radite u više tenant okruženja ili vaša pretplata nije automatski prepoznata, pokušajte ponovno s `azd auth login --tenant-id <tenant-id>`.

2. **Klonirajte repozitorij radionice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumijevanje AZD strukture za AI aplikacije

### Anatomija AI AZD predloška

Istražite ključne datoteke u AI-pripremljenom AZD predlošku:

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

### **Vježba iz laboratorija 1.1: Istražite konfiguraciju**

1. **Pregledajte datoteku azure.yaml:**
```bash
cat azure.yaml
```

**Što tražiti:**
- Definicije servisa za AI komponente
- Preslikavanja varijabli okoline
- Konfiguracije hosta

2. **Pregledajte main.bicep infrastrukturu:**
```bash
cat infra/main.bicep
```

**Ključni AI uzorci koje prepoznati:**
- Provođenje Microsoft Foundry Models servisa
- Integracija Azure AI Search-a
- Sigurno upravljanje ključevima
- Konfiguracije mrežne sigurnosti

### **Točka za raspravu:** Zašto su ovi uzorci važni za AI

- **Ovisnosti servisa**: AI aplikacije često zahtijevaju koordinirane višestruke servise
- **Sigurnost**: API ključevi i endpointi trebaju sigurnu upravu
- **Skalabilnost**: AI radna opterećenja imaju specifične zahtjeve za skaliranje
- **Upravljanje troškovima**: AI servisi mogu biti skupi ako nisu pravilno konfigurirani

## Modul 2: Implementirajte svoju prvu AI aplikaciju

### Korak 2.1: Inicijalizirajte okruženje

1. **Kreirajte novo AZD okruženje:**
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

### Korak 2.2: Implementirajte infrastrukturu i aplikaciju

1. **Implementirajte pomoću AZD:**
```bash
azd up
```

**Što se događa tijekom `azd up`:**
- ✅ Provođenje Microsoft Foundry Models servisa
- ✅ Kreira Azure AI Search servis
- ✅ Postavljanje App Service za web aplikaciju
- ✅ Konfigurira mrežu i sigurnost
- ✅ Implementira aplikacijski kod
- ✅ Postavlja nadzor i logiranje

2. **Pratite napredak implementacije** i zabilježite stvarane resurse.

### Korak 2.3: Potvrdite vašu implementaciju

1. **Provjerite implementirane resurse:**
```bash
azd show
```

2. **Otvorite implementiranu aplikaciju:**
```bash
azd show
```

Otvorite web endpoint prikazan u `azd show` izlazu.

3. **Testirajte AI funkcionalnost:**
   - Navigirajte do web aplikacije
   - Isprobajte uzorke upita
   - Potvrdite da AI odgovori funkcioniraju

### **Vježba iz laboratorija 2.1: Vježba rješavanja problema**

**Scenarij**: Vaša implementacija je uspjela, ali AI ne reagira.

**Uobičajeni problemi za provjeru:**
1. **OpenAI API ključevi**: Provjerite jesu li ispravno postavljeni
2. **Dostupnost modela**: Provjerite podržava li vaša regija model
3. **Mrežna povezanost**: Provjerite mogu li servisi komunicirati
4. **RBAC dozvole**: Provjerite ima li aplikacija pristup OpenAI-u

**Naredbe za debugiranje:**
```bash
# Provjeri varijable okoline
azd env get-values

# Pogledaj zapise implementacije
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Provjeri status OpenAI implementacije
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagodba AI aplikacija po vašim potrebama

### Korak 3.1: Promijenite AI konfiguraciju

1. **Ažurirajte OpenAI model:**
```bash
# Promijenite u drugi model (ako je dostupan u vašoj regiji)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ponovno implementirajte s novom konfiguracijom
azd deploy
```

2. **Dodajte dodatne AI servise:**

Uredite `infra/main.bicep` da dodate Document Intelligence:

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
# Proizvodnja obično koristi više SKU-a
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogući dodatne sigurnosne značajke
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Vježba iz laboratorija 3.1: Optimizacija troškova**

**Izazov**: Konfigurirajte predložak za ekonomičan razvoj.

**Zadaci:**
1. Identificirajte SKU-ove koje je moguće postaviti na besplatne/osnovne slojeve
2. Konfigurirajte varijable okoline za minimalne troškove
3. Implementirajte i usporedite troškove s produkcijskom konfiguracijom

**Smeri za rješenje:**
- Koristite F0 (besplatni) sloj za Azure AI usluge kad je moguć
- Koristite osnovni sloj za Search servis u razvoju
- Razmotrite korištenje potrošnje za Functions

## Modul 4: Sigurnost i najbolje proizvodne prakse

### Korak 4.1: Sigurno upravljanje vjerodajnicama

**Trenutni izazov**: Mnoge AI aplikacije hardkodiraju API ključeve ili koriste nesigurno spremište.

**AZD rješenje**: Managed Identity + integracija Key Vaulta.

1. **Pregledajte sigurnosnu konfiguraciju u svom predlošku:**
```bash
# Potražite konfiguraciju Key Vault i Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Provjerite radi li Managed Identity:**
```bash
# Provjerite ima li web aplikacija ispravnu konfiguraciju identiteta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Mrežna sigurnost

1. **Omogućite privatne endpointove** (ako već nisu konfigurirani):

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

### Korak 4.3: Praćenje i opažanje

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights bi trebao biti automatski konfiguriran
# Provjerite konfiguraciju:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Postavite AI-specifično praćenje:**

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

### **Vježba iz laboratorija 4.1: Sigurnosni audit**

**Zadatak**: Pregledajte svoju implementaciju za najbolje sigurnosne prakse.

**Kontrolni popis:**
- [ ] Nema hardkodiranih tajni u kodu ili konfiguraciji
- [ ] Managed Identity se koristi za autentikaciju između servisa
- [ ] Key Vault pohranjuje osjetljive konfiguracije
- [ ] Pristup mreži je ispravno ograničen
- [ ] Praćenje i logiranje su omogućeni

## Modul 5: Pretvaranje vlastite AI aplikacije

### Korak 5.1: Radni list za procjenu

**Prije pretvaranja aplikacije**, odgovorite na ova pitanja:

1. **Arhitektura aplikacije:**
   - Koje AI servise vaša aplikacija koristi?
   - Koje računalne resurse treba?
   - Treba li bazu podataka?
   - Koje su ovisnosti među servisima?

2. **Sigurnosni zahtjevi:**
   - Koje osjetljive podatke vaša aplikacija obrađuje?
   - Koji su vaši zahtjevi usklađenosti?
   - Trebate li privatnu mrežu?

3. **Zahtjevi za skaliranje:**
   - Koje je predviđeno opterećenje?
   - Trebate li automatsko skaliranje?
   - Postoje li regionalni zahtjevi?

### Korak 5.2: Kreirajte svoj AZD predložak

**Slijedite ovaj uzorak za pretvorbu aplikacije:**

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

### **Vježba iz laboratorija 5.1: Izazov kreiranja predloška**

**Izazov**: Kreirajte AZD predložak za AI aplikaciju za obradu dokumenata.

**Zahtjevi:**
- Microsoft Foundry Models za analizu sadržaja
- Document Intelligence za OCR
- Storage račun za prijenos dokumenata
- Function App za obradu logike
- Web aplikacija za korisničko sučelje

**Bonus bodovi:**
- Dodajte ispravno rukovanje greškama
- Uključite procjenu troškova
- Postavite nadzorne ploče

## Modul 6: Rješavanje uobičajenih problema

### Uobičajeni problemi s implementacijom

#### Problem 1: Prekoračenje kvote OpenAI servisa
**Simptomi:** Implementacija ne uspijeva s greškom kvote
**Rješenja:**
```bash
# Provjerite trenutne kvote
az cognitiveservices usage list --location eastus

# Zatražite povećanje kvote ili pokušajte drugu regiju
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model nije dostupan u regiji
**Simptomi:** AI odgovori ne uspijevaju ili greške pri implementaciji modela
**Rješenja:**
```bash
# Provjerite dostupnost modela po regiji
az cognitiveservices model list --location eastus

# Ažuriraj na dostupni model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Problemi s dozvolama
**Simptomi:** 403 Forbidden greške pri pozivanju AI servisa
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
**Koraci za istragu:**
1. Provjerite metrike performansi u Application Insights
2. Pregledajte OpenAI servisne metrike u Azure portalu
3. Potvrdite mrežnu povezanost i latenciju

**Rješenja:**
- Implementirajte caching za česte upite
- Koristite odgovarajući OpenAI model za svoj slučaj
- Razmotrite read replica za visoke opterećenje

### **Vježba iz laboratorija 6.1: Izazov debugiranja**

**Scenarij**: Implementacija je uspjela, ali aplikacija vraća 500 greške.

**Zadaci debugiranja:**
1. Provjerite aplikacijske zapise
2. Provjerite povezanost servisa
3. Testirajte autentikaciju
4. Pregledajte konfiguraciju

**Alati za korištenje:**
- `azd show` za pregled implementacije
- Azure portal za detaljne zapise servisa
- Application Insights za telemetriju aplikacije

## Modul 7: Praćenje i optimizacija

### Korak 7.1: Postavite sveobuhvatni nadzor

1. **Kreirajte prilagođene nadzorne ploče:**

U Azure portalu kreirajte nadzornu ploču sa:
- Broj i latencija OpenAI zahtjeva
- Stope pogrešaka aplikacije
- Korištenje resursa
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
# Koristite Azure CLI za dohvat podataka o troškovima
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Provedite kontrole troškova:**
- Postavite budžetske alarme
- Koristite politike automatskog skaliranja
- Implementirajte keširanje zahtjeva
- Pratite korištenje tokena za OpenAI

### **Vježba iz laboratorija 7.1: Optimizacija performansi**

**Zadatak**: Optimizirajte svoju AI aplikaciju za performanse i troškove.

**Metrike za poboljšanje:**
- Smanjite prosječno vrijeme odgovora za 20%
- Smanjite mjesečne troškove za 15%
- Održavajte 99.9% dostupnosti

**Strategije za isprobati:**
- Implementirajte keširanje odgovora
- Optimizirajte upite za efikasnost tokena
- Koristite odgovarajuće računalne SKU-eve
- Postavite pravilno automatsko skaliranje

## Završni izazov: Implementacija od početka do kraja

### Izazov scenarija

Zaduženi ste za stvaranje produkcijski spremnog AI chatbot za korisničku službu sa sljedećim zahtjevima:

**Funkcionalni zahtjevi:**
- Web sučelje za korisničke interakcije
- Integracija s Microsoft Foundry Models za odgovore
- Pretraživanje dokumenata pomoću Azure AI Search
- Integracija s postojećom bazom korisnika
- Podrška za više jezika

**Nefunkcionalni zahtjevi:**
- Podržava 1000 istovremenih korisnika
- 99,9% SLA dostupnost
- Usklađenost sa SOC 2
- Troškovno ograničenje ispod $500 mjesečno
- Implementacija u više okruženja (dev, staging, prod)

### Koraci implementacije

1. **Dizajnirajte arhitekturu**
2. **Kreirajte AZD predložak**
3. **Implementirajte sigurnosne mjere**
4. **Postavite nadzor i obavijesti**
5. **Kreirajte pipeline za implementaciju**
6. **Dokumentirajte rješenje**

### Kriteriji ocjenjivanja

- ✅ **Funkcionalnost**: Zadovoljava li sve zahtjeve?
- ✅ **Sigurnost**: Jesu li najbolje prakse provedene?
- ✅ **Skalabilnost**: Može li podnijeti opterećenje?
- ✅ **Održavanje**: Je li kod i infrastruktura dobro organizirana?
- ✅ **Trošak**: Ostaje li unutar budžeta?

## Dodatni resursi

### Microsoft dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service dokumentacija](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Primjer predložaka
- [Microsoft Foundry Models Chat aplikacija](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resursi zajednice
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD predlošci](https://azure.github.io/awesome-azd/)

## 🎓 Potvrda o završetku

Čestitamo! Završili ste AI radionicu. Sada biste trebali moći:

- ✅ Pretvoriti postojeće AI aplikacije u AZD predloške
- ✅ Implementirati AI aplikacije spremne za produkciju
- ✅ Provoditi najbolje sigurnosne prakse za AI radne procese
- ✅ Pratiti i optimizirati performanse AI aplikacija
- ✅ Rješavati uobičajene probleme kod implementacije

### Sljedeći koraci
1. Primijenite ove obrasce na vlastite AI projekte
2. Doprinesite predlošcima zajednici
3. Pridružite se Microsoft Foundry Discord za kontinuiranu podršku
4. Istražite napredne teme poput implementacija u više regija

---

**Povratne informacije o radionici**: Pomozite nam poboljšati ovu radionicu dijeljenjem svojih iskustava u [Microsoft Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija po poglavljima:**
- **📚 Početak tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo razvoj
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za AI u produkciji](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se našoj zajednici za podršku i rasprave o AZD i AI implementacijama.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->