# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen na AI
- **⬅️ Prejšnje**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Naslednje**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Ta praktična laboratorijska vaja vodi razvijalce skozi postopek prevzemanja obstoječega AI predloge in njene nameščanju z uporabo Azure Developer CLI (AZD). Naučili se boste bistvenih vzorcev za produkcijsko uvajanje AI z uporabo storitev Microsoft Foundry.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

Ob koncu delavnice boste lahko:
- ✅ Pretvorili obstoječo AI aplikacijo za uporabo AZD predlog
- ✅ Konfigurirali Microsoft Foundry storitve z AZD
- ✅ Uvedli varno upravljanje poverilnic za AI storitve
- ✅ Nameščali produkcijsko pripravljene AI aplikacije z nadzorom
- ✅ Odpravljali pogoste težave pri uvajanju AI

## Predpogoji

### Potrebna orodja
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nameščen
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nameščen
- [Git](https://git-scm.com/) nameščen
- Urejevalnik kode (priporočeno VS Code)

### Azure viri
- Azure naročnina s pravicami Contributor
- Dostop do Microsoft Foundry Models storitev (ali možnost zahteve za dostop)
- Pooblastila za ustvarjanje skupin virov

### Potrebno znanje
- Osnovno razumevanje storitev Azure
- Poznavanje ukazne vrstice
- Osnovni AI/ML koncepti (API-ji, modeli, pozivi)

## Lab Setup

### Korak 1: Priprava okolja

1. **Preverite nameščena orodja:**
```bash
# Preverite namestitev AZD
azd version

# Preverite Azure CLI
az --version

# Prijavite se v Azure
az login
azd auth login
```

2. **Klonirajte repozitorij delavnice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Raziščite ključne datoteke v AZD predlogi pripravljeni na AI:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Preglejte datoteko azure.yaml:**
```bash
cat azure.yaml
```

**Na kaj paziti:**
- Definicije storitev za AI komponente
- Mapiranje okoljskih spremenljivk
- Konfiguracije gostitelja

2. **Preglejte infrastrukturo main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI vzorci za prepoznavo:**
- Provisioning storitve Microsoft Foundry Models
- Integracija Cognitive Search
- Varen upravljanje ključev
- Konfiguracije omrežne varnosti

### **Točka za razpravo:** Zakaj so ti vzorci pomembni za AI

- **Ovisnosti storitev**: AI aplikacije pogosto zahtevajo več usklajenih storitev
- **Varnost**: API ključi in končne točke morajo biti varno upravljani
- **Razširljivost**: AI delovne obremenitve imajo posebne zahteve za skaliranje
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso ustrezno konfigurirane

## Module 2: Deploy Your First AI Application

### Korak 2.1: Inicializacija okolja

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite zahtevane parametre:**
```bash
# Nastavite želeno regijo Azure
azd env set AZURE_LOCATION eastus

# Neobvezno: Nastavite določen model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Korak 2.2: Namestitev infrastrukture in aplikacije

1. **Namestite z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Provisioning storitve Microsoft Foundry Models
- ✅ Ustvarjanje storitve Cognitive Search
- ✅ Nastavitev App Service za spletno aplikacijo
- ✅ Konfiguracija omrežja in varnosti
- ✅ Namestitev kode aplikacije
- ✅ Nastavitev nadzora in beleženja

2. **Spremljajte napredek nameščanja** in beležite ustvarjene vire.

### Korak 2.3: Preverite vašo namestitev

1. **Preverite nameščene vire:**
```bash
azd show
```

2. **Odprite nameščeno aplikacijo:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Preizkusite AI funkcionalnost:**
   - Pojdite na spletno aplikacijo
   - Preizkusite vzorčne poizvedbe
   - Preverite, ali AI odgovori delujejo

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenarij**: Nameščanje je uspelo, vendar AI ne odgovarja.

**Pogoste težave, ki jih preverite:**
1. **OpenAI API ključi**: Preverite, ali so pravilno nastavljeni
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Omrežna povezljivost**: Zagotovite, da se storitve lahko povežejo
4. **RBAC dovoljenja**: Preverite, ali aplikacija lahko dostopa do OpenAI

**Ukazi za odpravljanje napak:**
```bash
# Preveri spremenljivke okolja
azd env get-values

# Poglej dnevnike uvajanja
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Preveri stanje uvajanja OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Korak 3.1: Sprememba AI konfiguracije

1. **Posodobite OpenAI model:**
```bash
# Preklopite na drug model (če je na voljo v vaši regiji)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ponovno razmestite z novo konfiguracijo
azd deploy
```

2. **Dodajte dodatne AI storitve:**

Uredite `infra/main.bicep`, da dodate Document Intelligence:

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

### Korak 3.2: Konfiguracije, specifične za okolje

**Najboljša praksa**: Različne konfiguracije za razvoj in produkcijo.

1. **Ustvarite produkcijsko okolje:**
```bash
azd env new myai-production
```

2. **Nastavite parametre specifične za produkcijo:**
```bash
# V produkciji se običajno uporabljajo višji SKU-ji
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogoči dodatne varnostne funkcije
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte predlogo za stroškovno učinkovit razvoj.

**Naloge:**
1. Določite, kateri SKU-ji se lahko nastavijo na free/basic nivoje
2. Konfigurirajte okoljske spremenljivke za minimalne stroške
3. Namestite in primerjajte stroške s produkcijsko konfiguracijo

**Namigi za rešitev:**
- Uporabite F0 (free) nivo za Cognitive Services, kjer je mogoče
- Za razvoj uporabite Basic nivo za Search Service
- Razmislite o uporabi Consumption načrta za Functions

## Module 4: Security and Production Best Practices

### Korak 4.1: Varen management poverilnic

**Trenutni izziv**: Mnoge AI aplikacije imajo v kodi zakodirane API ključe ali uporabijo negotovo shrambo.

**AZD rešitev**: Upravljana identiteta + integracija Key Vault.

1. **Preglejte varnostno konfiguracijo v vaši predlogi:**
```bash
# Poiščite konfiguracijo Key Vaulta in upravljene identitete
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, ali upravljana identiteta deluje:**
```bash
# Preveri, ali ima spletna aplikacija pravilno konfiguracijo identitete.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Omrežna varnost

1. **Omogočite zasebne končne točke** (če še niso konfigurirane):

Dodajte v vaš bicep predlogo:
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
# Application Insights bi moral biti samodejno konfiguriran
# Preverite konfiguracijo:
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

### **Lab Exercise 4.1: Varnostni pregled**

**Naloga**: Preglejte vašo namestitev glede najboljših varnostnih praks.

**Kontrolni seznam:**
- [ ] Nobenih zakodiranih skrivnosti v kodi ali konfiguraciji
- [ ] Uporabljena upravljana identiteta za avtentikacijo med storitvami
- [ ] Key Vault hrani občutljive konfiguracije
- [ ] Dostop do omrežja je ustrezno omejen
- [ ] Nadzor in beleženje sta omogočena

## Module 5: Converting Your Own AI Application

### Korak 5.1: Ocena - delovni list

**Preden pretvorite vašo aplikacijo**, odgovorite na ta vprašanja:

1. **Arhitektura aplikacije:**
   - Katere AI storitve uporablja vaša aplikacija?
   - Kateri računski viri so potrebni?
   - Ali potrebuje bazo podatkov?
   - Kakšne so odvisnosti med storitvami?

2. **Varnostne zahteve:**
   - Katere občutljive podatke obdeluje vaša aplikacija?
   - Katere skladnostne zahteve imate?
   - Ali potrebujete zasebno omrežje?

3. **Zahteve za skaliranje:**
   - Kakšna je pričakovana obremenitev?
   - Ali potrebujete avtomatsko skaliranje?
   - Ali obstajajo regionalne zahteve?

### Korak 5.2: Ustvarite svojo AZD predlogo

**Sledite temu vzorcu za pretvorbo vaše aplikacije:**

1. **Ustvarite osnovno strukturo:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializiraj AZD predlogo
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

3. **Ustvarite predloge za infrastrukturo:**

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

### **Lab Exercise 5.1: Izziv za ustvarjanje predloge**

**Izziv**: Ustvarite AZD predlogo za aplikacijo za obdelavo dokumentov z AI.

**Zahteve:**
- Microsoft Foundry Models za analizo vsebine
- Document Intelligence za OCR
- Storage Account za nalaganje dokumentov
- Function App za obdelovalno logiko
- Spletna aplikacija za uporabniški vmesnik

**Bonus točke:**
- Dodajte ustrezno rokovanje z napakami
- Vključite oceno stroškov
- Nastavite nadzorne plošče

## Module 6: Troubleshooting Common Issues

### Pogoste težave pri nameščanju

#### Težava 1: Presežena kvota storitve OpenAI
**Simptomi:** Namestitev ne uspe zaradi napake kvote
**Rešitve:**
```bash
# Preveri trenutne kvote
az cognitiveservices usage list --location eastus

# Zahtevaj povečanje kvote ali poskusi drugo regijo
azd env set AZURE_LOCATION westus2
azd up
```

#### Težava 2: Model ni na voljo v regiji
**Simptomi:** AI odgovori ne delujejo ali pride do napak pri nameščanju modela
**Rešitve:**
```bash
# Preveri razpoložljivost modela po regijah
az cognitiveservices model list --location eastus

# Posodobi na razpoložljiv model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Težava 3: Težave s dovoljenji
**Simptomi:** 403 Forbidden napake pri klicanju AI storitev
**Rešitve:**
```bash
# Preverite dodelitve vlog
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Dodajte manjkajoče vloge
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Vztrajnostne/performančne težave

#### Težava 4: Počasni AI odgovori
**Koraki za preiskavo:**
1. Preverite Application Insights za metrike zmogljivosti
2. Preglejte metrike storitve OpenAI v Azure portalu
3. Preverite omrežno povezljivost in zakasnitev

**Rešitve:**
- Implementirajte predpomnjenje za pogoste poizvedbe
- Uporabite primeren OpenAI model za vaš primer uporabe
- Razmislite o replikah za branje pri visokih obremenitvah

### **Lab Exercise 6.1: Izziv odpravljanja napak**

**Scenarij**: Nameščanje je uspelo, vendar aplikacija vrača 500 napake.

**Naloge za odpravljanje napak:**
1. Preverite dnevnike aplikacije
2. Preverite povezljivost storitev
3. Preizkusite avtentikacijo
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled nameščanja
- Azure portal za podrobne dnevnike storitev
- Application Insights za telemetrijo aplikacije

## Module 7: Monitoring and Optimization

### Korak 7.1: Nastavite celovit nadzor

1. **Ustvarite prilagojene nadzorne plošče:**

Pojdite v Azure portal in ustvarite nadzorno ploščo z:
- Števec zahtev OpenAI in zakasnitev
- Stopnje napak aplikacije
- Izraba virov
- Sledenje stroškov

2. **Nastavite opozorila:**
```bash
# Opozorilo o visoki stopnji napak
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
# Uporabite Azure CLI za pridobitev podatkov o stroških
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Uvedite kontrole stroškov:**
- Nastavite opozorila za proračun
- Uporabite politike samodejnega skaliranja
- Implementirajte predpomnjenje zahtev
- Spremljajte porabo tokenov za OpenAI

### **Lab Exercise 7.1: Optimizacija zmogljivosti**

**Naloga**: Optimizirajte vašo AI aplikacijo za zmogljivost in stroške.

**Metrike za izboljšanje:**
- Znižajte povprečni čas odziva za 20%
- Znižajte mesečne stroške za 15%
- Ohranite 99.9% razpoložljivosti

**Strategije, ki jih poskusiti:**
- Implementirajte predpomnjenje odgovorov
- Optimizirajte pozive za učinkovitost tokenov
- Uporabite ustrezne računske SKU-je
- Nastavite ustrezno samodejno skaliranje

## Final Challenge: End-to-End Implementation

### Scenarij izziva

Naloga je ustvariti produkcijsko pripravljenega klepetalnega robota za podporo strankam, ki izpolnjuje te zahteve:

**Funkcionalne zahteve:**
- Spletni vmesnik za interakcijo s strankami
- Integracija z Microsoft Foundry Models za odgovore
- Iskanje dokumentov z uporabo Cognitive Search
- Integracija z obstoječo bazo strank
- Podpora več jezikom

**Ne-funkcionalne zahteve:**
- Obvladovanje 1000 sočasnih uporabnikov
- 99.9% SLA razpoložljivosti
- SOC 2 skladnost
- Stroški pod $500/mesec
- Namestitev v več okolij (dev, staging, prod)

### Koraki implementacije

1. **Oblikujte arhitekturo**
2. **Ustvarite AZD predlogo**
3. **Izvedite varnostne ukrepe**
4. **Nastavite nadzor in opozarjanje**
5. **Ustvarite pipelines za nameščanje**
6. **Dokumentirajte rešitev**

### Kriteriji za ocenjevanje

- ✅ **Funkcionalnost**: Ali izpolnjuje vse zahteve?
- ✅ **Varnost**: Ali so implementirane najboljše prakse?
- ✅ **Razširljivost**: Ali lahko prenese obremenitev?
- ✅ **Vzdržnost**: Ali sta koda in infrastruktura dobro organizirani?
- ✅ **Stroški**: Ali ostaja znotraj proračuna?

## Dodatni viri

### Microsoft dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Vzorčne predloge
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Skupnostni viri
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

Čestitke! Dokončali ste AI Workshop Lab. Zdaj bi morali biti sposobni:
- ✅ Pretvorite obstoječe AI aplikacije v predloge AZD
- ✅ Nameščite produkcijsko pripravljene AI aplikacije
- ✅ Uvedite najboljše varnostne prakse za AI delovne obremenitve
- ✅ Nadzorujte in optimizirajte delovanje AI aplikacij
- ✅ Odpravite pogoste težave z nameščanjem

### Naslednji koraki
1. Uveljavite te vzorce v svojih AI projektih
2. Prispevajte predloge nazaj skupnosti
3. Pridružite se Discordu Microsoft Foundry za nadaljnjo podporo
4. Raziščite napredne teme, kot je nameščanje v več regijah

---

**Povratne informacije delavnice**: Pomozite nam izboljšati to delavnico tako, da delite svoje izkušnje v [kanalu Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, osredotočen na AI
- **⬅️ Prejšnje**: [Nameščanje AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o AZD in nameščanju AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatski prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvor­nem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo strokoven človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->