# AI delavnica Lab: Priprava vaših AI rešitev za razmestitev z AZD

**Navigacija po poglavjih:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 2 - AI-prvi razvoj
- **⬅️ Previous**: [Razmestitev AI modela](ai-model-deployment.md)
- **➡️ Next**: [Prakse za proizvodni AI](production-ai-practices.md)
- **🚀 Next Chapter**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled delavnice

Ta praktična delavnica vodi razvijalce skozi postopek prevzema obstoječe AI predloge in njene razmestitve z uporabo Azure Developer CLI (AZD). Naučili se boste ključnih vzorcev za proizvodne razmestitve AI z uporabo storitev Microsoft Foundry.

> **Opomba o preverjanju (2026-03-25):** Ta delavnica je bila preverjena z `azd` `1.23.12`. Če je vaša lokalna namestitev starejša, posodobite AZD pred začetkom, da se postopek overjanja, predloge in razmestitve ujema s spodnjimi koraki.

**Trajanje:** 2-3 ure  
**Raven:** Srednja  
**Predpogoji:** Osnovno znanje o Azure, seznanjenost z AI/ML koncepti

## 🎓 Cilji učenja

Na koncu delavnice boste sposobni:
- ✅ Pretvoriti obstoječo AI aplikacijo za uporabo AZD predlog
- ✅ Konfigurirati Microsoft Foundry storitve z AZD
- ✅ Uvesti varno upravljanje poverilnic za AI storitve
- ✅ Razmestiti proizvodno pripravljene AI aplikacije s spremljanjem
- ✅ Odpravljati pogoste težave pri razmestitvi AI

## Predpogoji

### Zahtevana orodja
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nameščena
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nameščen
- [Git](https://git-scm.com/) nameščen
- Urejevalnik kode (priporočamo VS Code)

### Azure viri
- Azure naročnina s pravicami Contributor
- Dostop do Microsoft Foundry Models storitev (ali možnost zahtevka za dostop)
- Dovoljenja za ustvarjanje skupin virov

### Potrebno znanje
- Osnovno razumevanje Azure storitev
- Seznanjenost s ukazno vrstico
- Osnovni AI/ML koncepti (API-ji, modeli, pozivi)

## Priprava delavnice

### Korak 1: Priprava okolja

1. **Preverite nameščena orodja:**
```bash
# Preverite namestitev AZD
azd version

# Preverite Azure CLI
az --version

# Prijavite se v Azure za AZD poteke dela
azd auth login

# Prijavite se v Azure CLI le, če nameravate med diagnostiko zagnati ukaze az
az login
```

Če delate čez več najemnikov ali vaša naročnina ni samodejno zaznana, poskusite znova z `azd auth login --tenant-id <tenant-id>`.

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
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab vaja 1.1: Raziščite konfiguracijo**

1. **Preglejte datoteko azure.yaml:**
```bash
cat azure.yaml
```

**Na kaj paziti:**
- Opisi storitev za AI komponente
- Preslikave okoljskih spremenljivk
- Konfiguracije gostiteljev

2. **Preglejte infrastrukturo main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI vzorci za prepoznavo:**
- Vzpostavitev storitve Microsoft Foundry Models
- Integracija Azure AI Search
- Varen način upravljanja ključev
- Konfiguracije omrežne varnosti

### **Točka razprave:** Zakaj so ti vzorci pomembni za AI

- **Odvisnost storitev**: AI aplikacije pogosto zahtevajo več usklajenih storitev
- **Varnost**: API ključi in končne točke potrebujejo varno upravljanje
- **Elastičnost**: AI delovne obremenitve imajo posebne zahteve glede skaliranja
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso pravilno konfigurirane

## Modul 2: Razmestite svojo prvo AI aplikacijo

### Korak 2.1: Inicializirajte okolje

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite potrebne parametre:**
```bash
# Nastavite želeno Azure regijo
azd env set AZURE_LOCATION eastus

# Neobvezno: Nastavite določen model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Korak 2.2: Razmestitev infrastrukture in aplikacije

1. **Razmestite z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Vzpostavi storitev Microsoft Foundry Models
- ✅ Ustvari storitev Azure AI Search
- ✅ Nastavi App Service za spletno aplikacijo
- ✅ Konfigurira omrežje in varnost
- ✅ Razmesti kodo aplikacije
- ✅ Nastavi spremljanje in beleženje

2. Spremljajte potek razmestitve in opazujte ustvarjene vire.

### Korak 2.3: Preverite vašo razmestitev

1. **Preverite razmestjene vire:**
```bash
azd show
```

2. **Odprite razmestjeno aplikacijo:**
```bash
azd show
```

Odprite spletni končni naslov, prikazan v izhodu `azd show`.

3. **Preizkusite AI funkcionalnost:**
   - Pojdite na spletno aplikacijo
   - Preizkusite primerne poizvedbe
   - Preverite, ali AI odgovori delujejo

### **Lab vaja 2.1: Praksa odpravljanja napak**

**Scenarij**: Razmestitev je uspela, vendar AI ne odgovarja.

**Pogoste težave za preveriti:**
1. **OpenAI API ključi**: Preverite, ali so pravilno nastavljeni
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Omrežna povezljivost**: Prepričajte se, da se storitve lahko povežejo
4. **Dovoljenja RBAC**: Preverite, ali aplikacija lahko dostopa do OpenAI

**Ukazi za razhroščevanje:**
```bash
# Preveri spremenljivke okolja
azd env get-values

# Prikaži dnevnike uvajanja
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Preveri stanje uvajanja OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagajanje AI aplikacij vašim potrebam

### Korak 3.1: Spremenite AI konfiguracijo

1. **Posodobite OpenAI model:**
```bash
# Preklopite na drug model (če je v vaši regiji na voljo)
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
# V proizvodnji se običajno uporabljajo višji SKU-ji
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogoči dodatne varnostne funkcije
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab vaja 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte predlogo za stroškovno učinkoviti razvoj.

**Naloge:**
1. Določite, katere SKU-je je mogoče nastaviti na brezplačne/osnovne nivoje
2. Konfigurirajte okoljske spremenljivke za minimalne stroške
3. Razmestite in primerjajte stroške s produkcijsko konfiguracijo

**Namigi za rešitev:**
- Po možnosti uporabite nivo F0 (brezplačno) za Azure AI storitve
- V razvoju uporabite osnovni nivo za Search Service
- Razmislite o uporabi Consumption načrta za Functions

## Modul 4: Varnost in najboljše prakse za produkcijo

### Korak 4.1: Varen način upravljanja poverilnic

**Trenutni izziv**: Veliko AI aplikacij vgrajuje API ključe ali uporablja nezavarovano shrambo.

**AZD rešitev**: Integracija Managed Identity in Key Vault.

1. **Preglejte varnostno konfiguracijo v vaši predlogi:**
```bash
# Poiščite konfiguracijo Key Vaulta in upravljane identitete
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, ali Managed Identity deluje:**
```bash
# Preveri, ali ima spletna aplikacija pravilno konfiguracijo identitete
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

### Korak 4.3: Spremljanje in opazovanje

1. **Konfigurirajte Application Insights:**
```bash
# Application Insights naj bi bil samodejno konfiguriran
# Preverite konfiguracijo:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavite spremljanje specifično za AI:**

Dodajte po meri prilagojene meritve za AI operacije:
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

### **Lab vaja 4.1: Varnostni pregled**

**Naloga**: Preglejte vašo razmestitev glede varnostnih najboljših praks.

**Kontrolni seznam:**
- [ ] Brez vgrajenih skrivnosti v kodi ali konfiguraciji
- [ ] Uporablja se Managed Identity za overjanje med storitvami
- [ ] Key Vault hrani občutljive konfiguracije
- [ ] Dostop do omrežja je pravilno omejen
- [ ] Spremljanje in beleženje sta omogočena

## Modul 5: Pretvorba vaše AI aplikacije

### Korak 5.1: Ocena - delovni list

**Pred pretvorbo aplikacije**, odgovorite na ta vprašanja:

1. **Arhitektura aplikacije:**
   - Katerih AI storitev vaša aplikacija uporablja?
   - Kakšne računske vire potrebuje?
   - Ali potrebuje bazo podatkov?
   - Kakšne so odvisnosti med storitvami?

2. **Varnostne zahteve:**
   - S katerimi občutljivimi podatki aplikacija upravlja?
   - Kakšne zahteve za skladnost imate?
   - Ali potrebujete zasebno omrežje?

3. **Zahteve za skaliranje:**
   - Kakšna je pričakovana obremenitev?
   - Ali potrebujete avtomatsko skaliranje?
   - Ali obstajajo regionalne zahteve?

### Korak 5.2: Ustvarite svojo AZD predlogo

**Sledite temu vzorcu za pretvorbo aplikacije:**

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

### **Lab vaja 5.1: Izziv ustvarjanja predloge**

**Izziv**: Ustvarite AZD predlogo za AI aplikacijo za obdelavo dokumentov.

**Zahteve:**
- Microsoft Foundry Models za analizo vsebine
- Document Intelligence za OCR
- Storage Account za nalaganje dokumentov
- Function App za obdelovalno logiko
- Spletna aplikacija za uporabniški vmesnik

**Dodatne točke:**
- Dodajte pravilno obravnavo napak
- Vključite oceno stroškov
- Nastavite nadzorne plošče za spremljanje

## Modul 6: Odpravljanje pogostih težav

### Pogoste težave pri razmestitvi

#### Težava 1: Presežena kvota storitve OpenAI
**Simptomi:** Razmestitev ne uspe zaradi napake kvote
**Rešitve:**
```bash
# Preverite trenutne kvote
az cognitiveservices usage list --location eastus

# Zahtevajte povečanje kvote ali poskusite z drugo regijo
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
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Težava 3: Težave s dovoljenji
**Simptomi:** Napake 403 Forbidden pri klicih AI storitev
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
**Koraki za preiskavo:**
1. Preverite Application Insights za metrike zmogljivosti
2. Preglejte metrike OpenAI storitve v Azure portalu
3. Preverite omrežno povezljivost in zakasnitev

**Rešitve:**
- Uvedite predpomnjenje za pogoste poizvedbe
- Uporabite ustrezen OpenAI model za vaš primer uporabe
- Razmislite o bralnih replikah za scenarije z veliko obremenitvijo

### **Lab vaja 6.1: Izziv razhroščevanja**

**Scenarij**: Razmestitev je uspela, vendar aplikacija vrača napake 500.

**Naloge za razhroščevanje:**
1. Preverite dnevnike aplikacije
2. Preverite povezljivost storitev
3. Preizkusite overjanje
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled razmestitve
- Azure portal za podrobne dnevnike storitev
- Application Insights za telemetrijo aplikacije

## Modul 7: Spremljanje in optimizacija

### Korak 7.1: Nastavite celovito spremljanje

1. **Ustvarite prilagojene nadzorne plošče:**

Pojdite v Azure portal in ustvarite nadzorno ploščo z:
- Število zahtev in zakasnitev OpenAI
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

2. **Uvedite ukrepe za nadzor stroškov:**
- Nastavite proračunska opozorila
- Uporabite politike avtomatskega skaliranja
- Uvedite predpomnjenje zahtev
- Spremljajte porabo tokenov za OpenAI

### **Lab vaja 7.1: Optimizacija zmogljivosti**

**Naloga**: Optimizirajte AI aplikacijo tako za zmogljivost kot stroške.

**Metrike za izboljšanje:**
- Zmanjšajte povprečni odzivni čas za 20%
- Zmanjšajte mesečne stroške za 15%
- Ohranjajte 99,9% razpoložljivost

**Strategije za preizkus:**
- Uvedite predpomnjenje odgovorov
- Optimirajte pozive za učinkovitost tokenov
- Uporabite ustrezne računske SKU-je
- Nastavite ustrezno avtomatsko skaliranje

## Zaključni izziv: Celovita implementacija

### Scenarij izziva

Vaša naloga je ustvariti produkcijsko pripraven chatbot za podporo strankam, pogonjen z AI, s temi zahtevami:

**Funkcionalne zahteve:**
- Spletni vmesnik za interakcije s strankami
- Integracija z Microsoft Foundry Models za odgovore
- Možnost iskanja dokumentov z uporabo Azure AI Search
- Integracija z obstoječo bazo strank
- Podpora za več jezikov

**Ne-funkcionalne zahteve:**
- Podpreti 1000 sočasnih uporabnikov
- SLA z 99,9% razpoložljivostjo
- Skladnost z SOC 2
- Stroški pod $500/mesec
- Razmestiti v več okolij (dev, staging, prod)

### Koraki implementacije

1. Načrtujte arhitekturo
2. Ustvarite AZD predlogo
3. Izvedite varnostne ukrepe
4. Nastavite spremljanje in opozarjanje
5. Ustvarite cevi za razmestitev
6. Dokumentirajte rešitev

### Kriteriji ocenjevanja

- ✅ Funkcionalnost: Ali izpolnjuje vse zahteve?
- ✅ Varnost: Ali so implementirane najboljše prakse?
- ✅ Skalabilnost: Ali lahko prenese obremenitev?
- ✅ Vzdrževanje: Ali sta koda in infrastruktura dobro organizirani?
- ✅ Stroški: Ali ostaja znotraj proračuna?

## Dodatni viri

### Microsoft dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Vzorcne predloge
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Viri skupnosti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Potrdilo o zaključku

Čestitke! Zaključili ste AI delavnico. Sedaj bi morali biti sposobni:

- ✅ Pretvoriti obstoječe AI aplikacije v AZD predloge
- ✅ Razmestiti AI aplikacije, pripravljene za produkcijo
- ✅ Uvesti varnostne najboljše prakse za AI delovne obremenitve
- ✅ Nadzorovati in optimizirati zmogljivost AI aplikacij
- ✅ Odpravljati pogoste težave pri razmestitvi

### Naslednji koraki
1. Uporabite te vzorce v svojih AI projektih
2. Prispevajte predloge skupnosti
3. Pridružite se Microsoft Foundry Discord za nadaljnjo podporo
4. Raziščite napredne teme, kot so razmestitve v več regijah

---

**Povratne informacije o delavnici**: Pomagajte nam izboljšati to delavnico tako, da delite svoje izkušnje v [Microsoft Foundry Discord kanalu #Azure](https://discord.gg/microsoft-azure).

---

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, ki daje prednost AI
- **⬅️ Prejšnje**: [Razmestitev AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o AZD in razmestitvah AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->