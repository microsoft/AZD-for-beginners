<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-23T21:32:34+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "sl"
}
-->
# AI Workshop Lab: Priprava vaših AI rešitev za AZD-uvajanje

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z AI na prvem mestu
- **⬅️ Prejšnje**: [Uvajanje AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../getting-started/configuration.md)

## Pregled delavnice

Ta praktična delavnica vodi razvijalce skozi proces uporabe obstoječe AI predloge in njene uvedbe z uporabo Azure Developer CLI (AZD). Naučili se boste ključnih vzorcev za produkcijsko uvajanje AI z uporabo storitev Microsoft Foundry.

**Trajanje:** 2-3 ure  
**Raven:** Srednja  
**Predpogoji:** Osnovno znanje o Azure, poznavanje konceptov AI/ML

## 🎓 Cilji učenja

Do konca te delavnice boste sposobni:
- ✅ Pretvoriti obstoječo AI aplikacijo za uporabo AZD predlog
- ✅ Konfigurirati storitve Microsoft Foundry z AZD
- ✅ Uvesti varno upravljanje poverilnic za AI storitve
- ✅ Uvajati produkcijsko pripravljene AI aplikacije z nadzorom
- ✅ Odpravljati pogoste težave pri uvajanju AI

## Predpogoji

### Potrebna orodja
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nameščen
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nameščen
- [Git](https://git-scm.com/) nameščen
- Urejevalnik kode (priporočen VS Code)

### Azure viri
- Azure naročnina z dostopom za sodelavce
- Dostop do storitev Azure OpenAI (ali možnost zahteve za dostop)
- Dovoljenja za ustvarjanje skupin virov

### Znanje
- Osnovno razumevanje storitev Azure
- Poznavanje vmesnikov ukazne vrstice
- Osnovni koncepti AI/ML (API-ji, modeli, pozivi)

## Priprava delavnice

### Korak 1: Priprava okolja

1. **Preverite namestitev orodij:**
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

### **Vaja 1.1: Raziskovanje konfiguracije**

1. **Preglejte datoteko azure.yaml:**
```bash
cat azure.yaml
```

**Kaj iskati:**
- Definicije storitev za AI komponente
- Preslikave spremenljivk okolja
- Konfiguracije gostitelja

2. **Preglejte glavno infrastrukturo main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI vzorci za prepoznavanje:**
- Uvajanje storitve Azure OpenAI
- Integracija Cognitive Search
- Varno upravljanje ključev
- Konfiguracije omrežne varnosti

### **Točka za razpravo:** Zakaj so ti vzorci pomembni za AI

- **Odvisnosti storitev**: AI aplikacije pogosto zahtevajo več koordiniranih storitev
- **Varnost**: API ključi in končne točke potrebujejo varno upravljanje
- **Razširljivost**: AI delovne obremenitve imajo edinstvene zahteve glede razširljivosti
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso pravilno konfigurirane

## Modul 2: Uvajanje vaše prve AI aplikacije

### Korak 2.1: Inicializacija okolja

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite zahtevane parametre:**
```bash
# Nastavite svojo želeno regijo Azure
azd env set AZURE_LOCATION eastus

# Izbirno: Nastavite specifičen OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Korak 2.2: Uvajanje infrastrukture in aplikacije

1. **Uvajanje z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Uvajanje storitve Azure OpenAI
- ✅ Ustvarjanje storitve Cognitive Search
- ✅ Nastavitev App Service za spletno aplikacijo
- ✅ Konfiguracija omrežja in varnosti
- ✅ Uvajanje kode aplikacije
- ✅ Nastavitev nadzora in beleženja

2. **Spremljajte napredek uvajanja** in zabeležite ustvarjene vire.

### Korak 2.3: Preverjanje uvajanja

1. **Preverite uvedene vire:**
```bash
azd show
```

2. **Odprite uvedeno aplikacijo:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Preizkusite funkcionalnost AI:**
   - Pomaknite se do spletne aplikacije
   - Preizkusite vzorčne poizvedbe
   - Preverite, ali AI odgovori delujejo

### **Vaja 2.1: Praksa odpravljanja težav**

**Scenarij**: Vaše uvajanje je uspelo, vendar AI ne odgovarja.

**Pogoste težave za preverjanje:**
1. **OpenAI API ključi**: Preverite, ali so pravilno nastavljeni
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Omrežna povezljivost**: Prepričajte se, da storitve lahko komunicirajo
4. **RBAC dovoljenja**: Preverite, ali aplikacija lahko dostopa do OpenAI

**Ukazi za odpravljanje težav:**
```bash
# Preveri okoljske spremenljivke
azd env get-values

# Ogled dnevnikov uvajanja
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Preveri stanje uvajanja OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagajanje AI aplikacij vašim potrebam

### Korak 3.1: Spreminjanje konfiguracije AI

1. **Posodobite OpenAI model:**
```bash
# Spremenite na drug model (če je na voljo v vaši regiji)
azd env set AZURE_OPENAI_MODEL gpt-4

# Znova uvedite z novo konfiguracijo
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

### Korak 3.2: Konfiguracije, specifične za okolje

**Najboljša praksa**: Različne konfiguracije za razvoj in produkcijo.

1. **Ustvarite produkcijsko okolje:**
```bash
azd env new myai-production
```

2. **Nastavite parametre, specifične za produkcijo:**
```bash
# Proizvodnja običajno uporablja višje SKU-je
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogoči dodatne varnostne funkcije
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Vaja 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte predlogo za stroškovno učinkovit razvoj.

**Naloge:**
1. Ugotovite, katere SKU-je je mogoče nastaviti na brezplačne/osnovne nivoje
2. Konfigurirajte spremenljivke okolja za minimalne stroške
3. Uvedite in primerjajte stroške s produkcijsko konfiguracijo

**Namigi za rešitev:**
- Uporabite F0 (brezplačni) nivo za Cognitive Services, kadar je to mogoče
- Uporabite osnovni nivo za Search Service v razvoju
- Razmislite o uporabi načrta Consumption za Functions

## Modul 4: Varnost in najboljše prakse za produkcijo

### Korak 4.1: Varno upravljanje poverilnic

**Trenutni izziv**: Veliko AI aplikacij trdo kodira API ključe ali uporablja nezavarovano shranjevanje.

**AZD rešitev**: Upravljana identiteta + integracija Key Vault.

1. **Preglejte varnostno konfiguracijo v vaši predlogi:**
```bash
# Poiščite konfiguracijo Key Vault in Upravljane Identitete
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, ali upravljana identiteta deluje:**
```bash
# Preverite, ali ima spletna aplikacija pravilno konfiguracijo identitete
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Omrežna varnost

1. **Omogočite zasebne končne točke** (če še niso konfigurirane):

Dodajte v vašo bicep predlogo:
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
# Aplikacija Insights bi morala biti samodejno konfigurirana
# Preverite konfiguracijo:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavite AI-specifičen nadzor:**

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

### **Vaja 4.1: Varnostni pregled**

**Naloga**: Preglejte vaše uvajanje za najboljše prakse varnosti.

**Kontrolni seznam:**
- [ ] Brez trdo kodiranih skrivnosti v kodi ali konfiguraciji
- [ ] Upravljana identiteta uporabljena za avtentikacijo med storitvami
- [ ] Key Vault shranjuje občutljivo konfiguracijo
- [ ] Dostop do omrežja je ustrezno omejen
- [ ] Nadzor in beleženje sta omogočena

## Modul 5: Pretvorba vaše AI aplikacije

### Korak 5.1: Ocena

**Pred pretvorbo vaše aplikacije** odgovorite na ta vprašanja:

1. **Arhitektura aplikacije:**
   - Katere AI storitve uporablja vaša aplikacija?
   - Katere računske vire potrebuje?
   - Ali potrebuje bazo podatkov?
   - Kakšne so odvisnosti med storitvami?

2. **Varnostne zahteve:**
   - Katere občutljive podatke obdeluje vaša aplikacija?
   - Kakšne zahteve glede skladnosti imate?
   - Ali potrebujete zasebno omrežje?

3. **Zahteve glede razširljivosti:**
   - Kakšna je vaša pričakovana obremenitev?
   - Ali potrebujete samodejno razširjanje?
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

### **Vaja 5.1: Izziv ustvarjanja predloge**

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

### Pogoste težave pri uvajanju

#### Težava 1: Presežena kvota storitve OpenAI
**Simptomi:** Uvajanje ne uspe zaradi napake kvote
**Rešitve:**
```bash
# Preverite trenutne kvote
az cognitiveservices usage list --location eastus

# Zahtevajte povečanje kvote ali poskusite drugo regijo
azd env set AZURE_LOCATION westus2
azd up
```

#### Težava 2: Model ni na voljo v regiji
**Simptomi:** AI odgovori ne uspejo ali napake pri uvajanju modela
**Rešitve:**
```bash
# Preverite razpoložljivost modela po regijah
az cognitiveservices model list --location eastus

# Posodobite na razpoložljiv model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Težava 3: Težave z dovoljenji
**Simptomi:** 403 Forbidden napake pri klicanju AI storitev
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

### Težave z zmogljivostjo

#### Težava 4: Počasni AI odgovori
**Koraki preiskave:**
1. Preverite metrike zmogljivosti v Application Insights
2. Preglejte metrike storitve OpenAI v Azure portalu
3. Preverite omrežno povezljivost in zakasnitve

**Rešitve:**
- Uvedite predpomnjenje za pogoste poizvedbe
- Uporabite ustrezen OpenAI model za vaš primer uporabe
- Razmislite o replikah za branje pri visokih obremenitvah

### **Vaja 6.1: Izziv odpravljanja napak**

**Scenarij**: Vaše uvajanje je uspelo, vendar aplikacija vrača 500 napake.

**Naloge odpravljanja napak:**
1. Preverite dnevnike aplikacije
2. Preverite povezljivost storitev
3. Preizkusite avtentikacijo
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled uvajanja
- Azure portal za podrobne dnevnike storitev
- Application Insights za telemetrijo aplikacije

## Modul 7: Nadzor in optimizacija

### Korak 7.1: Nastavitev celovitega nadzora

1. **Ustvarite prilagojene nadzorne plošče:**

Pomaknite se do Azure portala in ustvarite nadzorno ploščo z:
- Število zahtev OpenAI in zakasnitve
- Stopnje napak aplikacije
- Uporaba virov
- Sledenje stroškov

2. **Nastavite opozorila:**
```bash
# Opozorilo za visoko stopnjo napak
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
- Nastavite opozorila o proračunu
- Uporabite politike samodejnega razširjanja
- Uvedite predpomnjenje zahtev
- Spremljajte uporabo žetonov za OpenAI

### **Vaja 7.1: Optimizacija zmogljivosti**

**Naloga**: Optimizirajte vašo AI aplikacijo za zmogljivost in stroške.

**Metrike za izboljšanje:**
- Zmanjšajte povprečni odzivni čas za 20%
- Zmanjšajte mesečne stroške za 15%
- Ohranite 99,9% razpoložljivost

**Strategije za preizkus:**
- Uvedite predpomnjenje odgovorov
- Optimizirajte pozive za učinkovitost žetonov
- Uporabite ustrezne računske SKU-je
- Nastavite ustrezno samodejno razširjanje

## Končni izziv: Celovita implementacija

### Scenarij izziva

Vaša naloga je ustvariti produkcijsko pripravljeno AI-podprto klepetalno aplikacijo za podporo strankam z naslednjimi zahtevami:

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
- Uvajanje v več okolij (razvoj, testiranje, produkcija)

### Koraki implementacije

1. **Oblikujte arhitekturo**
2. **Ustvarite AZD predlogo**
3. **Uvedite varnostne ukrepe**
4. **Nastavite nadzor in opozorila**
5. **Ustvarite uvajalne pipeline**
6. **Dokumentirajte rešitev**

### Merila ocenjevanja

- ✅ **Funkcionalnost**: Ali izpolnjuje vse zahteve?
- ✅ **Varnost**: Ali so uvedene najboljše prakse?
- ✅ **Razširljivost**: Ali lahko obvlada obremenitev?
- ✅ **Vzdržljivost**: Ali sta koda in infrastruktura dobro organizirani?
- ✅ **Stroški**: Ali ostaja znotraj proračuna?

## Dodatni viri

### Microsoft dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija storitve Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacija Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Vzorčne predloge
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Viri skupnosti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Potrdilo o zaključku
Čestitamo! Zaključili ste delavnico AI Workshop Lab. Zdaj bi morali biti sposobni:

- ✅ Pretvoriti obstoječe AI aplikacije v AZD predloge
- ✅ Uvajati AI aplikacije, pripravljene za produkcijo
- ✅ Uvesti najboljše varnostne prakse za AI delovne obremenitve
- ✅ Spremljati in optimizirati delovanje AI aplikacij
- ✅ Odpravljati pogoste težave pri uvajanju

### Naslednji koraki
1. Uporabite te vzorce pri svojih AI projektih
2. Prispevajte predloge nazaj v skupnost
3. Pridružite se Microsoft Foundry Discordu za stalno podporo
4. Raziskujte napredne teme, kot so uvajanja v več regijah

---

**Povratne informacije o delavnici**: Pomagajte nam izboljšati to delavnico tako, da delite svoje izkušnje v [Microsoft Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z AI na prvem mestu
- **⬅️ Prejšnje**: [Uvajanje AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../getting-started/configuration.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o AZD in AI uvajanjih.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->