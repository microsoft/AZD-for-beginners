<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:47:52+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "hr"
}
-->
# AI Workshop Lab: Izrada AI rješenja spremnih za AZD implementaciju

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - Razvoj s fokusom na AI
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za AI u produkciji](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../getting-started/configuration.md)

## Pregled radionice

Ova praktična radionica vodi programere kroz proces preuzimanja postojećeg AI predloška i njegove implementacije pomoću Azure Developer CLI (AZD). Naučit ćete ključne obrasce za implementaciju AI rješenja u produkciji koristeći Azure AI Foundry usluge.

**Trajanje:** 2-3 sata  
**Razina:** Srednja  
**Preduvjeti:** Osnovno znanje o Azureu, poznavanje AI/ML koncepata

## 🎓 Ciljevi učenja

Na kraju ove radionice moći ćete:
- ✅ Pretvoriti postojeću AI aplikaciju u AZD predložak
- ✅ Konfigurirati Azure AI Foundry usluge pomoću AZD-a
- ✅ Implementirati sigurno upravljanje vjerodajnicama za AI usluge
- ✅ Implementirati AI aplikacije spremne za produkciju s praćenjem
- ✅ Rješavati uobičajene probleme pri implementaciji AI-a

## Preduvjeti

### Potrebni alati
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instaliran
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instaliran
- [Git](https://git-scm.com/) instaliran
- Uređivač koda (preporučuje se VS Code)

### Azure resursi
- Azure pretplata s pristupom za suradnike
- Pristup Azure OpenAI uslugama (ili mogućnost zahtjeva za pristup)
- Dozvole za kreiranje grupa resursa

### Preduvjeti znanja
- Osnovno razumijevanje Azure usluga
- Poznavanje sučelja naredbenog retka
- Osnovni AI/ML koncepti (API-ji, modeli, upiti)

## Postavljanje laboratorija

### Korak 1: Priprema okruženja

1. **Provjerite instalaciju alata:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Klonirajte repozitorij radionice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## Modul 1: Razumijevanje AZD strukture za AI aplikacije

### Anatomija AZD predloška spremnog za AI

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


### **Vježba 1.1: Istraživanje konfiguracije**

1. **Pregledajte datoteku azure.yaml:**
```bash
cat azure.yaml
```

**Na što obratiti pažnju:**
- Definicije usluga za AI komponente
- Mapiranja varijabli okruženja
- Konfiguracije hosta

2. **Pregledajte glavnu bicep infrastrukturu:**
```bash
cat infra/main.bicep
```

**Ključni AI obrasci koje treba identificirati:**
- Provisioning Azure OpenAI usluge
- Integracija Cognitive Search-a
- Sigurno upravljanje ključevima
- Konfiguracije mrežne sigurnosti

### **Točka za raspravu:** Zašto su ovi obrasci važni za AI

- **Ovisnosti usluga**: AI aplikacije često zahtijevaju koordinaciju više usluga
- **Sigurnost**: API ključevi i krajnje točke trebaju sigurno upravljanje
- **Skalabilnost**: AI radna opterećenja imaju jedinstvene zahtjeve za skaliranje
- **Upravljanje troškovima**: AI usluge mogu biti skupe ako nisu pravilno konfigurirane

## Modul 2: Implementacija vaše prve AI aplikacije

### Korak 2.1: Inicijalizacija okruženja

1. **Kreirajte novo AZD okruženje:**
```bash
azd env new myai-workshop
```

2. **Postavite potrebne parametre:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### Korak 2.2: Implementacija infrastrukture i aplikacije

1. **Implementirajte pomoću AZD-a:**
```bash
azd up
```

**Što se događa tijekom `azd up`:**
- ✅ Provisioning Azure OpenAI usluge
- ✅ Kreiranje Cognitive Search usluge
- ✅ Postavljanje App Service-a za web aplikaciju
- ✅ Konfiguracija mreže i sigurnosti
- ✅ Implementacija koda aplikacije
- ✅ Postavljanje praćenja i zapisivanja

2. **Pratite napredak implementacije** i zabilježite kreirane resurse.

### Korak 2.3: Provjera implementacije

1. **Provjerite implementirane resurse:**
```bash
azd show
```

2. **Otvorite implementiranu aplikaciju:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testirajte AI funkcionalnost:**
   - Navigirajte do web aplikacije
   - Isprobajte uzorke upita
   - Provjerite rade li AI odgovori

### **Vježba 2.1: Praksa rješavanja problema**

**Scenario**: Vaša implementacija je uspjela, ali AI ne odgovara.

**Uobičajeni problemi koje treba provjeriti:**
1. **OpenAI API ključevi**: Provjerite jesu li ispravno postavljeni
2. **Dostupnost modela**: Provjerite podržava li vaša regija model
3. **Mrežna povezanost**: Osigurajte da se usluge mogu povezati
4. **RBAC dozvole**: Provjerite može li aplikacija pristupiti OpenAI-u

**Naredbe za otklanjanje grešaka:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## Modul 3: Prilagodba AI aplikacija vašim potrebama

### Korak 3.1: Modifikacija AI konfiguracije

1. **Ažurirajte OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

**Najbolja praksa**: Različite konfiguracije za razvoj i produkciju.

1. **Kreirajte produkcijsko okruženje:**
```bash
azd env new myai-production
```

2. **Postavite parametre specifične za produkciju:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Vježba 3.1: Optimizacija troškova**

**Izazov**: Konfigurirajte predložak za isplativ razvoj.

**Zadaci:**
1. Identificirajte koje SKU-ove možete postaviti na besplatne/osnovne razine
2. Konfigurirajte varijable okruženja za minimalne troškove
3. Implementirajte i usporedite troškove s produkcijskom konfiguracijom

**Savjeti za rješenje:**
- Koristite F0 (besplatnu) razinu za Cognitive Services kad je moguće
- Koristite osnovnu razinu za Search Service u razvoju
- Razmotrite korištenje Consumption plana za Functions

## Modul 4: Sigurnost i najbolje prakse za produkciju

### Korak 4.1: Sigurno upravljanje vjerodajnicama

**Trenutni izazov**: Mnoge AI aplikacije hardkodiraju API ključeve ili koriste nesigurno pohranjivanje.

**AZD rješenje**: Upravljani identitet + integracija s Key Vaultom.

1. **Pregledajte sigurnosnu konfiguraciju u svom predlošku:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Provjerite radi li upravljani identitet:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### Korak 4.2: Mrežna sigurnost

1. **Omogućite privatne krajnje točke** (ako nisu već konfigurirane):

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


### Korak 4.3: Praćenje i preglednost

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Postavite praćenje specifično za AI:**

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


### **Vježba 4.1: Sigurnosna revizija**

**Zadatak**: Pregledajte svoju implementaciju prema najboljim sigurnosnim praksama.

**Kontrolna lista:**
- [ ] Nema hardkodiranih tajni u kodu ili konfiguraciji
- [ ] Upravljani identitet koristi se za autentifikaciju između usluga
- [ ] Key Vault pohranjuje osjetljive konfiguracije
- [ ] Mrežni pristup je pravilno ograničen
- [ ] Praćenje i zapisivanje su omogućeni

## Modul 5: Pretvaranje vlastite AI aplikacije

### Korak 5.1: Procjena aplikacije

**Prije nego što pretvorite svoju aplikaciju**, odgovorite na ova pitanja:

1. **Arhitektura aplikacije:**
   - Koje AI usluge koristi vaša aplikacija?
   - Koje računalne resurse treba?
   - Treba li bazu podataka?
   - Koje su ovisnosti između usluga?

2. **Sigurnosni zahtjevi:**
   - Koje osjetljive podatke obrađuje vaša aplikacija?
   - Koje zahtjeve za usklađenost imate?
   - Trebate li privatnu mrežu?

3. **Zahtjevi za skaliranje:**
   - Koje je očekivano opterećenje?
   - Trebate li automatsko skaliranje?
   - Postoje li regionalni zahtjevi?

### Korak 5.2: Kreiranje AZD predloška

**Slijedite ovaj obrazac za pretvaranje svoje aplikacije:**

1. **Kreirajte osnovnu strukturu:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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


### **Vježba 5.1: Izazov kreiranja predloška**

**Izazov**: Kreirajte AZD predložak za AI aplikaciju za obradu dokumenata.

**Zahtjevi:**
- Azure OpenAI za analizu sadržaja
- Document Intelligence za OCR
- Storage Account za prijenos dokumenata
- Function App za logiku obrade
- Web aplikacija za korisničko sučelje

**Bonus bodovi:**
- Dodajte pravilno rukovanje greškama
- Uključite procjenu troškova
- Postavite nadzorne ploče za praćenje

## Modul 6: Rješavanje uobičajenih problema

### Uobičajeni problemi pri implementaciji

#### Problem 1: Prekoračen kvota OpenAI usluge
**Simptomi:** Implementacija ne uspijeva s greškom kvote
**Rješenja:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### Problem 2: Model nije dostupan u regiji
**Simptomi:** AI odgovori ne uspijevaju ili greške pri implementaciji modela
**Rješenja:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### Problem 3: Problemi s dozvolama
**Simptomi:** 403 Forbidden greške pri pozivanju AI usluga
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
**Koraci istrage:**
1. Provjerite metrike performansi u Application Insights
2. Pregledajte metrike OpenAI usluge u Azure portalu
3. Provjerite mrežnu povezanost i kašnjenje

**Rješenja:**
- Implementirajte predmemoriranje za uobičajene upite
- Koristite odgovarajući OpenAI model za svoju upotrebu
- Razmotrite read replike za scenarije visokog opterećenja

### **Vježba 6.1: Izazov otklanjanja grešaka**

**Scenario**: Vaša implementacija je uspjela, ali aplikacija vraća 500 greške.

**Zadaci otklanjanja grešaka:**
1. Provjerite zapisnike aplikacije
2. Provjerite povezanost usluga
3. Testirajte autentifikaciju
4. Pregledajte konfiguraciju

**Alati za korištenje:**
- `azd show` za pregled implementacije
- Azure portal za detaljne zapisnike usluga
- Application Insights za telemetriju aplikacije

## Modul 7: Praćenje i optimizacija

### Korak 7.1: Postavljanje sveobuhvatnog praćenja

1. **Kreirajte prilagođene nadzorne ploče:**

Navigirajte do Azure portala i kreirajte nadzornu ploču s:
- Brojem zahtjeva i kašnjenjem OpenAI-a
- Stopama grešaka aplikacije
- Iskorištenjem resursa
- Praćenjem troškova

2. **Postavite upozorenja:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementirajte kontrolu troškova:**
- Postavite upozorenja za proračun
- Koristite politike automatskog skaliranja
- Implementirajte predmemoriranje zahtjeva
- Pratite korištenje tokena za OpenAI

### **Vježba 7.1: Optimizacija performansi**

**Zadatak**: Optimizirajte svoju AI aplikaciju za performanse i troškove.

**Metrike za poboljšanje:**
- Smanjite prosječno vrijeme odgovora za 20%
- Smanjite mjesečne troškove za 15%
- Održavajte 99.9% dostupnosti

**Strategije za isprobavanje:**
- Implementirajte predmemoriranje odgovora
- Optimizirajte upite za učinkovitost tokena
- Koristite odgovarajuće SKU-ove za računalne resurse
- Postavite pravilno automatsko skaliranje

## Završni izazov: Implementacija od početka do kraja

### Scenarij izazova

Vaš zadatak je kreirati produkcijski spreman AI chatbot za korisničku podršku s ovim zahtjevima:

**Funkcionalni zahtjevi:**
- Web sučelje za interakciju s korisnicima
- Integracija s Azure OpenAI za odgovore
- Pretraživanje dokumenata pomoću Cognitive Search-a
- Integracija s postojećom bazom podataka korisnika
- Podrška za više jezika

**Nefunkcionalni zahtjevi:**
- Obrada 1000 istovremenih korisnika
- SLA dostupnosti od 99.9%
- Usklađenost sa SOC 2
- Trošak ispod $500/mjesečno
- Implementacija u više okruženja (razvoj, testiranje, produkcija)

### Koraci implementacije

1. **Dizajnirajte arhitekturu**
2. **Kreirajte AZD predložak**
3. **Implementirajte sigurnosne mjere**
4. **Postavite praćenje i upozorenja**
5. **Kreirajte pipeline za implementaciju**
6. **Dokumentirajte rješenje**

### Kriteriji evaluacije

- ✅ **Funkcionalnost**: Zadovoljava li sve zahtjeve?
- ✅ **Sigurnost**: Jesu li implementirane najbolje prakse?
- ✅ **Skalabilnost**: Može li podnijeti opterećenje?
- ✅ **Održavanje**: Jesu li kod i infrastruktura dobro organizirani?
- ✅ **Trošak**: Ostaje li unutar proračuna?

## Dodatni resursi

### Microsoft dokumentacija
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija za Azure OpenAI uslugu](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacija za Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Primjeri predložaka
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resursi zajednice
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikat o završetku
Čestitamo! Završili ste radionicu AI Workshop Lab. Sada biste trebali biti sposobni:

- ✅ Pretvoriti postojeće AI aplikacije u AZD predloške
- ✅ Implementirati AI aplikacije spremne za produkciju
- ✅ Primijeniti najbolje sigurnosne prakse za AI radna opterećenja
- ✅ Pratiti i optimizirati performanse AI aplikacija
- ✅ Rješavati uobičajene probleme pri implementaciji

### Sljedeći koraci
1. Primijenite ove obrasce na vlastite AI projekte
2. Doprinesite predlošcima zajednici
3. Pridružite se Azure AI Foundry Discordu za kontinuiranu podršku
4. Istražite napredne teme poput implementacija u više regija

---

**Povratne informacije o radionici**: Pomozite nam poboljšati ovu radionicu dijeleći svoje iskustvo u [Azure AI Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - Razvoj usmjeren na AI
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Najbolje prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../getting-started/configuration.md)

**Trebate pomoć?** Pridružite se našoj zajednici za podršku i rasprave o AZD-u i AI implementacijama.

---

