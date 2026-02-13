# AI Workshop Lab: Priprava vaših AI rešitev za razmestitev z AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Trenutno poglavje 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Pregled delavnice

Ta praktična delavnica vodi razvijalce skozi postopek prevzema obstoječe AI predloge in njene razmestitve z uporabo Azure Developer CLI (AZD). Naučili se boste ključnih vzorcev za produkcijske razmestitve AI z uporabo storitev Microsoft Foundry.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Cilji učenja

Do konca delavnice boste sposobni:
- ✅ Pretvoriti obstoječo AI aplikacijo za uporabo AZD predlog
- ✅ Konfigurirati Microsoft Foundry storitve z AZD
- ✅ Uvesti varno upravljanje poverilnic za AI storitve
- ✅ Razmestiti produkcijsko pripravljene AI aplikacije z nadzorom
- ✅ Odpravljati pogoste težave pri razmestitvi AI

## Predpogoji

### Potrebna orodja
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nameščeno
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nameščeno
- [Git](https://git-scm.com/) nameščen
- Urejevalnik kode (priporočamo VS Code)

### Azure viri
- Azure naročnina z dostopom Contributor
- Dostop do storitev Azure OpenAI (ali možnost zahtevati dostop)
- Pravice za ustvarjanje skupin virov

### Potrebno znanje
- Osnovno razumevanje Azure storitev
- Poznavanje ukazne vrstice
- Osnovni koncepti AI/ML (API-ji, modeli, pozivi/prompts)

## Nastavitev delavnice

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

## Modul 1: Razumevanje strukture AZD za AI aplikacije

### Anatomija AI AZD predloge

Raziščite ključne datoteke v AZD predlogi pripravljeni za AI:

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

### **Laboratorijska vaja 1.1: Raziščite konfiguracijo**

1. **Preučite datoteko azure.yaml:**
```bash
cat azure.yaml
```

**Na kaj morate biti pozorni:**
- Definicije storitev za AI komponente
- Preslikave okoljskih spremenljivk
- Konfiguracije gostiteljev

2. **Preglejte infrastrukturo main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI vzorci, ki jih morate prepoznati:**
- Uvedba storitve Azure OpenAI
- Integracija Cognitive Search
- Varnostno upravljanje ključev
- Konfiguracije varnosti omrežja

### **Diskusijska točka:** Zakaj so ti vzorci pomembni za AI

- **Odvisnosti storitev**: AI aplikacije pogosto zahtevajo več usklajenih storitev
- **Varnost**: API ključi in končne točke zahtevajo varno upravljanje
- **Razširljivost**: AI delovne obremenitve imajo posebne zahteve za skaliranje
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso pravilno konfigurirane

## Modul 2: Razmestite svojo prvo AI aplikacijo

### Korak 2.1: Inicializirajte okolje

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite zahtevane parametre:**
```bash
# Nastavite želeno regijo za Azure
azd env set AZURE_LOCATION eastus

# Neobvezno: Nastavite določen model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Korak 2.2: Razmestite infrastrukturo in aplikacijo

1. **Razmestite z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Uvede storitev Azure OpenAI
- ✅ Ustvari storitev Cognitive Search
- ✅ Nastavi App Service za spletno aplikacijo
- ✅ Konfigurira omrežje in varnost
- ✅ Razmestí kodo aplikacije
- ✅ Vzpostavi nadzor in beleženje

2. **Spremljajte napredek razmestitve** in si zabeležite ustvarjene vire.

### Korak 2.3: Preverite svojo razmestitev

1. **Preverite razmeščene vire:**
```bash
azd show
```

2. **Odprite razmeščeno aplikacijo:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Preizkusite AI funkcionalnost:**
   - Pojdite na spletno aplikacijo
   - Preizkusite vzorčne poizvedbe
   - Preverite, ali AI odgovori delujejo

### **Laboratorijska vaja 2.1: Vaja odpravljanja težav**

**Scenarij**: Vaša razmestitev je uspela, vendar AI ne odgovarja.

**Pogoste težave, ki jih je treba preveriti:**
1. **API ključi OpenAI**: Preverite, da so pravilno nastavljeni
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Povezljivost omrežja**: Zagotovite, da se storitve lahko medsebojno povezujejo
4. **RBAC dovoljenja**: Preverite, ali aplikacija lahko dostopa do OpenAI

**Ukazi za razhroščevanje:**
```bash
# Preveri spremenljivke okolja
azd env get-values

# Ogled dnevnikov nameščanja
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Preveri stanje nameščanja OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagajanje AI aplikacij vašim potrebam

### Korak 3.1: Spremenite konfiguracijo AI

1. **Posodobite OpenAI model:**
```bash
# Preklopite na drug model (če je na voljo v vaši regiji)
azd env set AZURE_OPENAI_MODEL gpt-4

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

### Korak 3.2: Konfiguracije specifične za okolje

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

# Omogočite dodatne varnostne funkcije
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorijska vaja 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte predlogo za cenovno ugoden razvoj.

**Naloge:**
1. Ugotovite, katerim SKU-jem je mogoče nastaviti brezplačne/osnovne ravni
2. Konfigurirajte okoljske spremenljivke za minimalne stroške
3. Razmestite in primerjajte stroške s produkcijsko konfiguracijo

**Namigi za rešitev:**
- Kjer je mogoče, uporabite F0 (brezplačno) raven za Cognitive Services
- Za Search Service v razvoju uporabite Basic raven
- Razmislite o uporabi Consumption načrta za Functions

## Modul 4: Varnost in najboljše prakse za produkcijo

### Korak 4.1: Varen način upravljanja poverilnic

**Trenutni izziv**: Veliko AI aplikacij vgrajuje API ključe v kodo ali uporablja nezavarovano shranjevanje.

**Rešitev z AZD**: Managed Identity + integracija Key Vault.

1. **Preglejte varnostno konfiguracijo v vaši predlogi:**
```bash
# Poiščite konfiguracijo Key Vaulta in upravljane identitete
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, ali Managed Identity deluje:**
```bash
# Preverite, ali ima spletna aplikacija pravilno konfiguracijo identitete
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Varnost omrežja

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

### Korak 4.3: Nadzor in opaznost

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights naj bi bil samodejno konfiguriran
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

### **Laboratorijska vaja 4.1: Varnostni pregled**

**Naloga**: Preglejte svojo razmestitev glede najboljših praks varnosti.

**Kontrolni seznam:**
- [ ] Brez vgrajenih skrivnosti v kodi ali konfiguraciji
- [ ] Managed Identity uporabljena za avtentikacijo med storitvami
- [ ] Key Vault hrani občutljivo konfiguracijo
- [ ] Dostop do omrežja je ustrezno omejen
- [ ] Nadzor in beleženje sta omogočena

## Modul 5: Pretvorba vaše lastne AI aplikacije

### Korak 5.1: Ocena - delovni list

**Pred pretvorbo aplikacije**, odgovorite na ta vprašanja:

1. **Arhitektura aplikacije:**
   - Katere AI storitve uporablja vaša aplikacija?
   - Kateri računski viri so potrebni?
   - Ali zahteva podatkovno bazo?
   - Kakšne so odvisnosti med storitvami?

2. **Varnostne zahteve:**
   - S katerimi občutljivimi podatki se vaša aplikacija ukvarja?
   - Kakšne zahteve glede skladnosti imate?
   - Ali potrebujete zasebno omrežje?

3. **Zahteve glede skaliranja:**
   - Kakšna je pričakovana obremenitev?
   - Ali potrebujete samodejno skaliranje?
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

3. **Ustvarite infrastrukturne predloge:**

**infra/main.bicep** - Main template:
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

**infra/modules/openai.bicep** - OpenAI module:
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

**Izziv**: Ustvarite AZD predlogo za AI aplikacijo za obdelavo dokumentov.

**Zahteve:**
- Azure OpenAI za analizo vsebine
- Document Intelligence za OCR
- Storage Account za nalaganje dokumentov
- Function App za logiko obdelave
- Spletna aplikacija za uporabniški vmesnik

**Dodatne točke:**
- Dodajte ustrezno obravnavo napak
- Vključite oceno stroškov
- Nastavite nadzorne plošče

## Modul 6: Odpravljanje pogostih težav

### Pogoste težave pri razmestitvi

#### Težava 1: Presežena kvota storitve OpenAI
**Simptomi:** Razmestitev ne uspe zaradi napake kvote
**Rešitve:**
```bash
# Preverite trenutne kvote
az cognitiveservices usage list --location eastus

# Zahtevajte povečanje kvote ali poskusite drugo regijo
azd env set AZURE_LOCATION westus2
azd up
```

#### Težava 2: Model ni na voljo v regiji
**Simptomi:** AI odgovori ne delujejo ali napake pri razmestitvi modela
**Rešitve:**
```bash
# Preveri razpoložljivost modela po regijah
az cognitiveservices model list --location eastus

# Posodobi na razpoložljiv model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Težava 3: Težave s dovoljenji
**Simptomi:** 403 Forbidden napake pri klicu AI storitev
**Rešitve:**
```bash
# Preveri dodelitve vlog
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Dodaj manjkajoče vloge
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Težave s zmogljivostjo

#### Težava 4: Počasni AI odgovori
**Koraki preiskave:**
1. Preverite Application Insights za metrike zmogljivosti
2. Preglejte metrike storitve OpenAI v Azure portalu
3. Preverite povezljivost omrežja in latenco

**Rešitve:**
- Uvedite predpomnjenje za pogoste poizvedbe
- Uporabite ustrezen OpenAI model za vaš primer uporabe
- Razmislite o read replica rešitvah za visoke obremenitve

### **Laboratorijska vaja 6.1: Izziv razhroščevanja**

**Scenarij**: Razmestitev je uspela, vendar aplikacija vrača 500 napak.

**Naloge za odpravljanje napak:**
1. Preverite dnevnike aplikacije
2. Preverite povezljivost storitev
3. Preizkusite avtentikacijo
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled razmestitve
- Azure portal za podrobne dnevnike storitev
- Application Insights za telemetrijo aplikacije

## Modul 7: Nadzor in optimizacija

### Korak 7.1: Nastavite celovit nadzor

1. **Ustvarite prilagojene nadzorne plošče:**

Pojdite v Azure portal in ustvarite nadzorno ploščo z:
- Številom zahtev OpenAI in latenco
- Stopnjo napak aplikacije
- Uporabo virov
- Sledenje stroškom

2. **Nastavite opozorila:**
```bash
# Opozorilo zaradi visoke stopnje napak
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

2. **Uvedite nadzor stroškov:**
- Nastavite opozorila proračuna
- Uporabite politike samodejnega skaliranja
- Uvedite predpomnjenje zahtev
- Spremljajte porabo tokenov za OpenAI

### **Laboratorijska vaja 7.1: Optimizacija zmogljivosti**

**Naloga**: Optimizirajte svojo AI aplikacijo za zmogljivost in stroške.

**Merila za izboljšanje:**
- Zmanjšajte povprečni odzivni čas za 20%
- Zmanjšajte mesečne stroške za 15%
- Ohranjajte 99,9% razpoložljivost

**Strategije za preizkus:**
- Uvedite predpomnjenje odgovorov
- Optimizirajte pozive za učinkovitost tokenov
- Uporabite ustrezne računske SKU-je
- Nastavite ustrezno samodejno skaliranje

## Zaključni izziv: Implementacija od začetka do konca

### Scenarij izziva

Vaša naloga je ustvariti produkcijsko pripravljen klepetalni bot za podporo strankam, ki temelji na AI, z naslednjimi zahtevami:

**Funkcionalne zahteve:**
- Spletni vmesnik za interakcijo s strankami
- Integracija z Azure OpenAI za odgovore
- Iskanje dokumentov z uporabo Cognitive Search
- Integracija z obstoječo bazo strank
- Večjezična podpora

**Nefunkcionalne zahteve:**
- Obvladovanje 1000 vzporednih uporabnikov
- 99,9% SLA razpoložljivosti
- SOC 2 skladnost
- Strošek pod $500/mesec
- Razmestitev v več okoljih (dev, staging, prod)

### Koraki izvajanja

1. Naredite zasnovo arhitekture
2. Ustvarite AZD predlogo
3. Uvedite varnostne ukrepe
4. Nastavite nadzor in opozorila
5. Ustvarite pipeline za razmestitev
6. Dokumentirajte rešitev

### Kriteriji ocenjevanja

- ✅ **Funkcionalnost**: Ali izpolnjuje vse zahteve?
- ✅ **Varnost**: Ali so uvedene najboljše prakse?
- ✅ **Razširljivost**: Ali lahko prenese obremenitev?
- ✅ **Vzdržljivost**: Ali je koda in infrastruktura dobro organizirana?
- ✅ **Stroški**: Ali ostaja znotraj proračuna?

## Dodatni viri

### Microsoft dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Vzorčni predlogi
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Skupnostni viri
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Potrdilo o zaključku
Čestitamo! Dokončali ste AI delavnico. Zdaj bi morali znati:

- ✅ Pretvoriti obstoječe AI aplikacije v AZD predloge
- ✅ Razmestiti AI aplikacije, pripravljene za produkcijo
- ✅ Uvesti najboljše varnostne prakse za AI delovne obremenitve
- ✅ Spremljati in optimizirati zmogljivost AI aplikacij
- ✅ Odpravljati pogoste težave pri razmestitvi

### Naslednji koraki
1. Uporabite te vzorce v svojih AI projektih
2. Prispevajte predloge skupnosti
3. Pridružite se Microsoft Foundry Discord za nadaljnjo podporo
4. Raziščite napredne teme, kot so razmestitve v več regijah

---

**Povratne informacije o delavnici**: Pomagajte nam izboljšati to delavnico tako, da delite svoje izkušnje v [Microsoft Foundry Discord #Azure kanal](https://discord.gg/microsoft-azure).

---

**Navigacija po poglavjih:**
- **📚 Osnovna stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen na AI
- **⬅️ Prejšnje**: [Razmestitev AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o AZD in razmestitvah AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za avtomatski prevod z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v svojem izvor­nem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za kakršnekoli nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->