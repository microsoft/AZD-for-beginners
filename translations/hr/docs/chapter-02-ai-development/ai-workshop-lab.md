# AI Radionica: Izrada AI Rješenja Spremnih za AZD-Implementaciju

**Navigacija po poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-First razvoj
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za AI u produkciji](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled radionice

Ova praktična radionica vodi developere kroz proces uzimanja postojeće AI predloške i implementacije koristeći Azure Developer CLI (AZD). Naučit ćete ključne obrasce za produkcijske AI implementacije koristeći Microsoft Foundry servise.

> **Napomena za validaciju (2026-03-25):** Ova radionica je verificirana s `azd` verzijom `1.23.12`. Ako je vaša lokalna instalacija starija, ažurirajte AZD prije početka kako bi autentifikacija, predložak i tijek implementacije odgovarali koracima u nastavku.

**Trajanje:** 2-3 sata  
**Razina:** Srednja  
**Preduvjeti:** Osnovno znanje o Azure-u, upoznatost s AI/ML pojmovima

## 🎓 Ciljevi učenja

Do kraja ove radionice moći ćete:
- ✅ Pretvoriti postojeću AI aplikaciju da koristi AZD predloške
- ✅ Konfigurirati Microsoft Foundry servise pomoću AZD-a
- ✅ Implementirati sigurnu upravu vjerodajnicama za AI servise
- ✅ Implementirati produkcijske AI aplikacije s nadzorom
- ✅ Rješavati uobičajene probleme kod AI implementacije

## Preduvjeti

### Potrebni alati
- Instaliran [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Instaliran [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Instaliran [Git](https://git-scm.com/)
- Uređivač koda (preporučen VS Code)

### Azure resursi
- Pretplata na Azure s pristupom suradnika
- Pristup Microsoft Foundry Models servisima (ili mogućnost traženja pristupa)
- Dozvole za kreiranje resursnih grupa

### Znanja
- Osnovno razumijevanje Azure servisa
- Poznavanje komandne linije
- Osnovni AI/ML pojmovi (API-ji, modeli, upiti)

## Postavljanje laboratorija

### Korak 1: Priprema okruženja

1. **Provjerite instalaciju alata:**
```bash
# Provjeri instalaciju AZD-a
azd version

# Provjeri Azure CLI
az --version

# Prijava na Azure za AZD radne tokove
azd auth login

# Prijavi se na Azure CLI samo ako planiraš pokretati az naredbe tijekom dijagnostike
az login
```

Ako radite preko više zakupaca ili vaša pretplata nije automatski detektirana, pokušajte ponovno s `azd auth login --tenant-id <tenant-id>`.

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
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Zadataka 1.1: Istražite konfiguraciju**

1. **Pregledajte datoteku azure.yaml:**
```bash
cat azure.yaml
```

**Na što obratiti pozornost:**
- Definicije servisa za AI komponente
- Mapiranje varijabli okruženja
- Konfiguracije hosta

2. **Pregledajte glavnu bicep infrastrukturu:**
```bash
cat infra/main.bicep
```

**Ključni AI obrasci koje treba prepoznati:**
- Provisioniranje Microsoft Foundry Models servisa
- Integracija Cognitive Search-a
- Sigurno upravljanje ključevima
- Mrežne sigurnosne konfiguracije

### **Diskusijska točka:** Zašto su ovi obrasci važni za AI

- **Ovisnosti servisa**: AI aplikacije često zahtijevaju koordinirane više servisa
- **Sigurnost**: API ključevi i endpoints moraju biti sigurno upravljani
- **Skalabilnost**: AI radna opterećenja imaju specifične zahtjeve za skaliranje
- **Upravljanje troškovima**: AI servisi mogu biti skupi ako nisu pravilno konfigurirani

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

# Opcionalno: Postavite specifični OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Korak 2.2: Implementirajte infrastrukturu i aplikaciju

1. **Pokrenite implementaciju s AZD:**
```bash
azd up
```

**Što se događa tijekom `azd up`:**
- ✅ Provisionira Microsoft Foundry Models servis
- ✅ Kreira Cognitive Search servis
- ✅ Podešava App Service za web aplikaciju
- ✅ Konfigurira mrežu i sigurnost
- ✅ Implementira kod aplikacije
- ✅ Postavlja nadzor i logiranje

2. **Pratite napredak implementacije** i zabilježite stvarane resurse.

### Korak 2.3: Provjerite implementaciju

1. **Provjerite implementirane resurse:**
```bash
azd show
```

2. **Otvorite implementiranu aplikaciju:**
```bash
azd show
```

Otvorite web adresu prikazanu u `azd show` izlazu.

3. **Testirajte AI funkcionalnost:**
   - Posjetite web aplikaciju
   - Isprobajte primjere upita
   - Provjerite rade li AI odgovori

### **Zadatak 2.1: Vježba rješavanja problema**

**Scenarij**: Implementacija je uspjela, ali AI ne reagira.

**Česti problemi za provjeriti:**
1. **OpenAI API ključevi**: Provjerite jesu li ispravno postavljeni
2. **Dostupnost modela**: Provjerite podržava li vaš regija model
3. **Mrežna povezanost**: Provjerite mogu li servisi međusobno komunicirati
4. **RBAC dopuštenja**: Provjerite ima li aplikacija pristup OpenAI-ju

**Naredbe za ispravljanje problema:**
```bash
# Provjerite varijable okoline
azd env get-values

# Pogledajte dnevnike implementacije
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Provjerite status OpenAI implementacije
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagodba AI aplikacija vašim potrebama

### Korak 3.1: Izmjena AI konfiguracije

1. **Ažurirajte OpenAI model:**
```bash
# Promijenite na drugi model (ako je dostupan u vašoj regiji)
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

2. **Postavite parametre za produkciju:**
```bash
# Proizvodnja obično koristi više SKU-ova
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogući dodatne sigurnosne značajke
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Zadatak 3.1: Optimizacija troškova**

**Zadatak**: Konfigurirajte predložak za isplativ razvoj.

**Zadaci:**
1. Prepoznajte koje SKU-ove možete postaviti na besplatni/osnovni nivo
2. Konfigurirajte varijable okruženja za minimalne troškove
3. Implementirajte i usporedite troškove s produkcijskom konfiguracijom

**Savjeti:**
- Koristite F0 (besplatni) sloj za Cognitive Services kad je moguće
- Koristite osnovni sloj za Search Service tijekom razvoja
- Razmotrite korištenje Consumption plana za Functions

## Modul 4: Sigurnost i najbolje prakse u produkciji

### Korak 4.1: Sigurno upravljanje vjerodajnicama

**Trenutni problem**: Mnoge AI aplikacije tvrdo kodiraju API ključeve ili koriste nesigurno spremište.

**AZD rješenje**: Managed Identity + integracija Key Vault-a.

1. **Pregledajte sigurnosnu konfiguraciju u vašem predlošku:**
```bash
# Potražite konfiguraciju Key Vault i Upravljanog identiteta
grep -r "keyVault\|managedIdentity" infra/
```

2. **Provjerite funkcionira li Managed Identity:**
```bash
# Provjerite ima li web aplikacija ispravnu konfiguraciju identiteta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Mrežna sigurnost

1. **Omogućite privatne endpoint-e** (ako već nisu konfigurirani):

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

### Korak 4.3: Nadzor i vidljivost

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights treba biti automatski konfiguriran
# Provjerite konfiguraciju:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Postavite AI-specifičan nadzor:**

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

### **Zadatak 4.1: Sigurnosni pregled**

**Zadatak**: Pregledajte svoju implementaciju radi sigurnosnih najboljih praksi.

**Kontrolna lista:**
- [ ] Nema tvrdo kodiranih tajni u kodu ili konfiguraciji
- [ ] Managed Identity koristi se za autentifikaciju servis prema servisu
- [ ] Key Vault pohranjuje osjetljive konfiguracije
- [ ] Pristup mreži je adekvatno ograničen
- [ ] Nadzor i logiranje su omogućeni

## Modul 5: Pretvorba vlastite AI aplikacije

### Korak 5.1: Radni list za procjenu

**Prije pretvorbe aplikacije, odgovorite na slijedeća pitanja:**

1. **Arhitektura aplikacije:**
   - Koje AI servise vaša aplikacija koristi?
   - Koje računalne resurse treba?
   - Treba li bazu podataka?
   - Koje su ovisnosti između servisa?

2. **Sigurnosni zahtjevi:**
   - Koje osjetljive podatke vaša aplikacija obrađuje?
   - Koji su zahtjevi za usklađenost?
   - Trebate li privatnu mrežu?

3. **Zahtjevi za skaliranje:**
   - Koje je očekivano opterećenje?
   - Trebate li automatsko skaliranje?
   - Postoje li regionalni zahtjevi?

### Korak 5.2: Kreirajte svoj AZD predložak

**Slijedite ovaj obrazac za pretvorbu aplikacije:**

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

### **Zadatak 5.1: Izazov kreiranja predloška**

**Zadatak**: Kreirajte AZD predložak za AI aplikaciju za obradu dokumenata.

**Zahtjevi:**
- Microsoft Foundry Models za analizu sadržaja
- Document Intelligence za OCR
- Storage račun za učitavanje dokumenata
- Function App za logiku obrade
- Web aplikacija za korisničko sučelje

**Bonus bodovi:**
- Dodajte ispravno rukovanje pogreškama
- Uključite procjenu troškova
- Postavite nadzorne nadzorne ploče

## Modul 6: Rješavanje uobičajenih problema

### Uobičajeni problemi kod implementacije

#### Problem 1: Preko kvote na OpenAI servisu
**Simptomi:** Implementacija ne uspije zbog greške kvote  
**Rješenja:**
```bash
# Provjerite trenutne kvote
az cognitiveservices usage list --location eastus

# Zahtjevajte povećanje kvote ili pokušajte s drugom regijom
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model nije dostupan u regiji
**Simptomi:** AI odgovori ne uspijevaju ili greške prilikom implementacije modela  
**Rješenja:**
```bash
# Provjerite dostupnost modela po regijama
az cognitiveservices model list --location eastus

# Ažuriraj na dostupni model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Problemi s dopuštenjima
**Simptomi:** 403 Forbidden greške pri pozivanju AI servisa  
**Rješenja:**
```bash
# Provjerite dodjele uloga
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Dodajte nedostajuće uloge
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi s performansama

#### Problem 4: Spori AI odgovori
**Koraci za istragu:**
1. Provjerite Application Insights za metrike performansi
2. Pregledajte OpenAI servisne metrike na Azure portalu
3. Provjerite mrežnu povezanost i latenciju

**Rješenja:**
- Implementirajte cache za česte upite
- Koristite odgovarajući OpenAI model za vaš slučaj upotrebe
- Razmotrite čitanje replika za scenarije visokog opterećenja

### **Zadatak 6.1: Izazov otklanjanja poteškoća**

**Scenarij**: Implementacija je uspjela, ali aplikacija vraća 500 greške.

**Zadaci za otklanjanje poteškoća:**
1. Provjerite logove aplikacije
2. Provjerite povezanost servisa
3. Testirajte autentifikaciju
4. Pregledajte konfiguraciju

**Alati za korištenje:**
- `azd show` za pregled implementacije
- Azure portal za detaljne servisne logove
- Application Insights za telemetriju aplikacije

## Modul 7: Nadzor i optimizacija

### Korak 7.1: Postavite sveobuhvatan nadzor

1. **Kreirajte prilagođene nadzorne ploče:**

Idite na Azure portal i kreirajte ploču s:  
- Broj i kašnjenje OpenAI zahtjeva  
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
# Koristite Azure CLI za dobivanje podataka o troškovima
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Provedite kontrole troškova:**
- Postavite upozorenja za budžete
- Koristite politike automatskog skaliranja
- Implementirajte keširanje zahtjeva
- Pratite potrošnju tokena za OpenAI

### **Zadatak 7.1: Optimizacija performansi**

**Zadatak**: Optimizirajte AI aplikaciju za performanse i troškove.

**Metrike za poboljšanje:**
- Smanjite prosječno vrijeme odgovora za 20%
- Smanjite mjesečne troškove za 15%
- Održite 99,9% dostupnosti

**Strategije za isprobati:**
- Implementirajte keširanje odgovora
- Optimizirajte upite za efikasnost tokena
- Koristite odgovarajuće compute SKU-ove
- Postavite odgovarajuće automatsko skaliranje

## Završni izazov: Implementacija od kraja do kraja

### Scenarij izazova

Zaduženi ste za kreiranje produkcijski spremnog AI chatbota za korisničku podršku s ovim zahtjevima:

**Funkcionalni zahtjevi:**
- Web sučelje za interakciju s korisnicima
- Integracija s Microsoft Foundry Models za odgovore
- Mogućnost pretraživanja dokumenata preko Cognitive Search-a
- Integracija s postojećom bazom korisnika
- Višejezična podrška

**Nefunkcionalni zahtjevi:**
- Podrška za 1000 istovremenih korisnika
- SLA od 99,9% dostupnosti
- SOC 2 usklađenost
- Trošak ispod 500 USD/mjesečno
- Implementacija u više okruženja (dev, staging, prod)

### Koraci implementacije

1. **Dizajnirajte arhitekturu**
2. **Kreirajte AZD predložak**
3. **Implementirajte sigurnosne mjere**
4. **Postavite nadzor i upozorenja**
5. **Kreirajte pipelineove za implementaciju**
6. **Dokumentirajte rješenje**

### Kriteriji evaluacije

- ✅ **Funkcionalnost**: Zadovoljava li sve zahtjeve?
- ✅ **Sigurnost**: Jesu li implementirane najbolje prakse?
- ✅ **Skalabilnost**: Može li podnijeti opterećenje?
- ✅ **Održavanje**: Je li kod i infrastruktura dobro organizirana?
- ✅ **Troškovi**: Je li u okviru budžeta?

## Dodatni resursi

### Microsoft dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models servis dokumentacija](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Primjeri predložaka
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resursi zajednice
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Potvrda o završenom

Čestitamo! Završili ste AI radionicu. Sada biste trebali biti u mogućnosti:

- ✅ Pretvoriti postojeće AI aplikacije u AZD predloške
- ✅ Implementirati AI aplikacije spremne za produkciju
- ✅ Primijeniti sigurnosne najbolje prakse za AI radna opterećenja
- ✅ Pratiti i optimizirati performanse AI aplikacija
- ✅ Rješavati uobičajene probleme pri implementaciji

### Sljedeći koraci
1. Primijenite ove obrasce u vlastitim AI projektima
2. Doprinesite predlošcima za zajednicu
3. Pridružite se Microsoft Foundry Discordu za kontinuiranu podršku
4. Istražite napredne teme poput višeregionalnih implementacija

---

**Povratne informacije o radionici**: Pomozite nam poboljšati ovu radionicu dijeljenjem svog iskustva u [Microsoft Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo razvoja
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se našoj zajednici za podršku i rasprave o AZD-u i AI implementacijama.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI usluge prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalan ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili pogrešne interpretacije proizašle iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->