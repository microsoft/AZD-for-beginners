<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T23:06:54+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "sl"
}
-->
# AI Workshop Lab: Priprava AI rešitev za AZD-implementacijo

**Prejšnje:** [AI Model Deployment](ai-model-deployment.md) | **Naslednje:** [Production AI Practices](production-ai-practices.md)

## Pregled delavnice

Ta praktična delavnica vodi razvijalce skozi proces prilagoditve obstoječe AI aplikacije za implementacijo z uporabo Azure Developer CLI (AZD). Naučili se boste ključnih vzorcev za produkcijske AI implementacije z uporabo storitev Azure AI Foundry.

**Trajanje:** 2-3 ure  
**Raven:** Srednja  
**Predpogoji:** Osnovno znanje o Azure, poznavanje konceptov AI/ML

## 🎓 Cilji učenja

Do konca delavnice boste sposobni:
- ✅ Prilagoditi obstoječo AI aplikacijo za uporabo AZD predlog
- ✅ Konfigurirati storitve Azure AI Foundry z AZD
- ✅ Implementirati varno upravljanje poverilnic za AI storitve
- ✅ Implementirati produkcijsko pripravljene AI aplikacije z nadzorom
- ✅ Odpravljati pogoste težave pri implementaciji AI

## Predpogoji

### Potrebna orodja
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nameščen
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nameščen
- [Git](https://git-scm.com/) nameščen
- Urejevalnik kode (priporočen VS Code)

### Azure viri
- Azure naročnina z dostopom za prispevanje
- Dostop do storitev Azure OpenAI (ali možnost zahteve za dostop)
- Dovoljenja za ustvarjanje skupin virov

### Zahtevano znanje
- Osnovno razumevanje storitev Azure
- Poznavanje ukaznih vrstic
- Osnovni koncepti AI/ML (API-ji, modeli, pozivi)

## Priprava laboratorija

### Korak 1: Priprava okolja

1. **Preverite nameščena orodja:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Klonirajte repozitorij delavnice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumevanje strukture AZD za AI aplikacije

### Anatomija AZD predloge za AI

Raziskujte ključne datoteke v AZD predlogi, pripravljeni za AI:

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

### **Laboratorijska vaja 1.1: Raziskovanje konfiguracije**

1. **Preglejte datoteko azure.yaml:**
```bash
cat azure.yaml
```

**Kaj iskati:**
- Definicije storitev za AI komponente
- Preslikave okoljskih spremenljivk
- Konfiguracije gostitelja

2. **Preglejte glavno infrastrukturo main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI vzorci za identifikacijo:**
- Provisioniranje storitve Azure OpenAI
- Integracija Cognitive Search
- Upravljanje varnih ključev
- Konfiguracije omrežne varnosti

### **Točka za razpravo:** Zakaj so ti vzorci pomembni za AI

- **Odvisnosti storitev**: AI aplikacije pogosto zahtevajo več usklajenih storitev
- **Varnost**: API ključi in končne točke potrebujejo varno upravljanje
- **Razširljivost**: AI delovne obremenitve imajo edinstvene zahteve glede razširljivosti
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso pravilno konfigurirane

## Modul 2: Implementacija vaše prve AI aplikacije

### Korak 2.1: Inicializacija okolja

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite zahtevane parametre:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Korak 2.2: Implementacija infrastrukture in aplikacije

1. **Implementirajte z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Provisionira storitev Azure OpenAI
- ✅ Ustvari storitev Cognitive Search
- ✅ Nastavi App Service za spletno aplikacijo
- ✅ Konfigurira omrežje in varnost
- ✅ Implementira kodo aplikacije
- ✅ Nastavi nadzor in beleženje

2. **Spremljajte napredek implementacije** in zabeležite ustvarjene vire.

### Korak 2.3: Preverite svojo implementacijo

1. **Preverite implementirane vire:**
```bash
azd show
```

2. **Odprite implementirano aplikacijo:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Preizkusite funkcionalnost AI:**
   - Pomaknite se do spletne aplikacije
   - Preizkusite vzorčne poizvedbe
   - Preverite, ali AI odgovori delujejo

### **Laboratorijska vaja 2.1: Praksa odpravljanja težav**

**Scenarij**: Vaša implementacija je uspela, vendar AI ne odgovarja.

**Pogoste težave za preverjanje:**
1. **API ključi OpenAI**: Preverite, ali so pravilno nastavljeni
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Omrežna povezljivost**: Prepričajte se, da se storitve lahko povežejo
4. **RBAC dovoljenja**: Preverite, ali aplikacija lahko dostopa do OpenAI

**Ukazi za odpravljanje težav:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagajanje AI aplikacij vašim potrebam

### Korak 3.1: Spremenite konfiguracijo AI

1. **Posodobite model OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Dodajte dodatne AI storitve:**

Uredite `infra/main.bicep` za dodajanje Document Intelligence:

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

### Korak 3.2: Konfiguracije specifične za okolje

**Najboljša praksa**: Različne konfiguracije za razvoj in produkcijo.

1. **Ustvarite produkcijsko okolje:**
```bash
azd env new myai-production
```

2. **Nastavite parametre specifične za produkcijo:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorijska vaja 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte predlogo za stroškovno učinkovit razvoj.

**Naloge:**
1. Identificirajte, katere SKU-je je mogoče nastaviti na brezplačne/osnovne nivoje
2. Konfigurirajte okoljske spremenljivke za minimalne stroške
3. Implementirajte in primerjajte stroške s produkcijsko konfiguracijo

**Namigi za rešitev:**
- Uporabite F0 (brezplačni) nivo za Cognitive Services, kadar je to mogoče
- Uporabite osnovni nivo za Search Service v razvoju
- Razmislite o uporabi Consumption načrta za Functions

## Modul 4: Varnost in najboljše prakse za produkcijo

### Korak 4.1: Upravljanje poverilnic

**Trenutni izziv**: Veliko AI aplikacij trdo kodira API ključe ali uporablja nezavarovano shranjevanje.

**AZD rešitev**: Upravljana identiteta + integracija Key Vault.

1. **Preglejte varnostno konfiguracijo v vaši predlogi:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, ali upravljana identiteta deluje:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Omrežna varnost

1. **Omogočite zasebne končne točke** (če še niso konfigurirane):

Dodajte v svojo bicep predlogo:
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

### Korak 4.3: Nadzor in opazovanje

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavite nadzor specifičen za AI:**

Dodajte prilagojene metrike za AI operacije:
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

### **Laboratorijska vaja 4.1: Varnostni pregled**

**Naloga**: Preglejte svojo implementacijo za najboljše prakse varnosti.

**Kontrolni seznam:**
- [ ] Brez trdo kodiranih skrivnosti v kodi ali konfiguraciji
- [ ] Upravljana identiteta uporabljena za avtentikacijo med storitvami
- [ ] Key Vault shranjuje občutljivo konfiguracijo
- [ ] Dostop do omrežja je ustrezno omejen
- [ ] Nadzor in beleženje sta omogočena

## Modul 5: Pretvorba vaše AI aplikacije

### Korak 5.1: Ocena aplikacije

**Preden pretvorite svojo aplikacijo**, odgovorite na ta vprašanja:

1. **Arhitektura aplikacije:**
   - Katere AI storitve uporablja vaša aplikacija?
   - Katere računske vire potrebuje?
   - Ali potrebuje podatkovno bazo?
   - Kakšne so odvisnosti med storitvami?

2. **Varnostne zahteve:**
   - Katere občutljive podatke obdeluje vaša aplikacija?
   - Kakšne zahteve glede skladnosti imate?
   - Ali potrebujete zasebno omrežje?

3. **Zahteve glede razširljivosti:**
   - Kakšna je vaša pričakovana obremenitev?
   - Ali potrebujete samodejno razširljivost?
   - Ali obstajajo regionalne zahteve?

### Korak 5.2: Ustvarite svojo AZD predlogo

**Sledite temu vzorcu za pretvorbo vaše aplikacije:**

1. **Ustvarite osnovno strukturo:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Ustvarite azure.yaml:**
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

3. **Ustvarite infrastrukturne predloge:**

**infra/main.bicep** - Glavna predloga:
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

**infra/modules/openai.bicep** - Modul OpenAI:
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

### **Laboratorijska vaja 5.1: Izziv ustvarjanja predloge**

**Izziv**: Ustvarite AZD predlogo za aplikacijo za obdelavo dokumentov z AI.

**Zahteve:**
- Azure OpenAI za analizo vsebine
- Document Intelligence za OCR
- Storage Account za nalaganje dokumentov
- Function App za logiko obdelave
- Spletna aplikacija za uporabniški vmesnik

**Bonus točke:**
- Dodajte ustrezno obravnavo napak
- Vključite oceno stroškov
- Nastavite nadzorne plošče za spremljanje

## Modul 6: Odpravljanje pogostih težav

### Pogoste težave pri implementaciji

#### Težava 1: Presežena kvota storitve OpenAI
**Simptomi:** Implementacija ne uspe zaradi napake kvote
**Rešitve:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Težava 2: Model ni na voljo v regiji
**Simptomi:** AI odgovori ne uspejo ali napake pri implementaciji modela
**Rešitve:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Težava 3: Težave z dovoljenji
**Simptomi:** Napake 403 Forbidden pri klicanju AI storitev
**Rešitve:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Težave z zmogljivostjo

#### Težava 4: Počasni AI odgovori
**Koraki preiskave:**
1. Preverite metrike zmogljivosti v Application Insights
2. Preglejte metrike storitve OpenAI v Azure portalu
3. Preverite omrežno povezljivost in zakasnitve

**Rešitve:**
- Implementirajte predpomnjenje za pogoste poizvedbe
- Uporabite ustrezen model OpenAI za vaš primer uporabe
- Razmislite o bralnih replikah za scenarije z visoko obremenitvijo

### **Laboratorijska vaja 6.1: Izziv odpravljanja napak**

**Scenarij**: Vaša implementacija je uspela, vendar aplikacija vrača napake 500.

**Naloge odpravljanja težav:**
1. Preverite dnevniške zapise aplikacije
2. Preverite povezljivost storitev
3. Preizkusite avtentikacijo
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled implementacije
- Azure portal za podrobne dnevniške zapise storitev
- Application Insights za telemetrijo aplikacije

## Modul 7: Nadzor in optimizacija

### Korak 7.1: Nastavite celovit nadzor

1. **Ustvarite prilagojene nadzorne plošče:**

Pomaknite se do Azure portala in ustvarite nadzorno ploščo z:
- Število zahtev OpenAI in zakasnitve
- Stopnje napak aplikacije
- Uporaba virov
- Sledenje stroškov

2. **Nastavite opozorila:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Korak 7.2: Optimizacija stroškov

1. **Analizirajte trenutne stroške:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementirajte nadzor stroškov:**
- Nastavite opozorila o proračunu
- Uporabite politike samodejne razširljivosti
- Implementirajte predpomnjenje zahtev
- Spremljajte uporabo žetonov za OpenAI

### **Laboratorijska vaja 7.1: Optimizacija zmogljivosti**

**Naloga**: Optimizirajte svojo AI aplikacijo za zmogljivost in stroške.

**Metrike za izboljšanje:**
- Zmanjšajte povprečni odzivni čas za 20%
- Zmanjšajte mesečne stroške za 15%
- Ohranite 99,9% razpoložljivost

**Strategije za preizkus:**
- Implementirajte predpomnjenje odgovorov
- Optimizirajte pozive za učinkovitost žetonov
- Uporabite ustrezne SKU-je za računalniške vire
- Nastavite ustrezno samodejno razširljivost

## Končni izziv: Implementacija od začetka do konca

### Scenarij izziva

Vaša naloga je ustvariti produkcijsko pripravljeno AI aplikacijo za podporo strankam s temi zahtevami:

**Funkcionalne zahteve:**
- Spletni vmesnik za interakcije s strankami
- Integracija z Azure OpenAI za odgovore
- Zmožnost iskanja dokumentov z uporabo Cognitive Search
- Integracija z obstoječo bazo podatkov strank
- Podpora za več jezikov

**Nefunkcionalne zahteve:**
- Obdelava 1000 sočasnih uporabnikov
- SLA razpoložljivosti 99,9%
- Skladnost s SOC 2
- Stroški pod $500/mesec
- Implementacija v več okoljih (razvoj, testiranje, produkcija)

### Koraki implementacije

1. **Oblikujte arhitekturo**
2. **Ustvarite AZD predlogo**
3. **Implementirajte varnostne ukrepe**
4. **Nastavite nadzor in opozorila**
5. **Ustvarite implementacijske pipeline**
6. **Dokumentirajte rešitev**

### Merila za ocenjevanje

- ✅ **Funkcionalnost**: Ali izpolnjuje vse zahteve?
- ✅ **Varnost**: Ali so implementirane najboljše prakse?
- ✅ **Razširljivost**: Ali lahko obvlada obremenitev?
- ✅ **Vzdržljivost**: Ali je koda in infrastruktura dobro organizirana?
- ✅ **Stroški**: Ali ostaja znotraj proračuna?

## Dodatni viri

### Microsoft dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacija Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Vzorčne predloge
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Skupnostni viri
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikat o zaključku

Čestitke! Zaključili ste AI Workshop Lab. Zdaj bi morali biti sposobni:

- ✅ Prilagoditi obstoječe AI aplikacije za AZD predloge
- ✅ Implementirati produkcijsko pripravljene AI aplikacije
- ✅ Uvedite najboljše varnostne prakse za delovne obremenitve AI
- ✅ Spremljajte in optimizirajte delovanje AI aplikacij
- ✅ Odpravljajte pogoste težave pri uvajanju

### Naslednji koraki
1. Uporabite te vzorce v svojih AI projektih
2. Prispevajte predloge nazaj v skupnost
3. Pridružite se Discord skupini Azure AI Foundry za stalno podporo
4. Raziskujte napredne teme, kot so uvajanja v več regijah

---

**Povratne informacije o delavnici**: Pomagajte nam izboljšati to delavnico tako, da delite svoje izkušnje v [Azure AI Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Prejšnje:** [Uvajanje AI modelov](ai-model-deployment.md) | **Naslednje:** [Prakse za produkcijo AI](production-ai-practices.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o AZD in uvajanjih AI.

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna napačna razumevanja ali napačne interpretacije, ki bi nastale zaradi uporabe tega prevoda.