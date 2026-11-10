# AI delavnica Lab: Kako narediti svoje AI rešitve AZD-razpoložljive

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, ki je AI-prvi
- **⬅️ Prejšnje**: [Postavitev AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Prakse najboljšega AI delovanja v produkciji](../chapter-08-production/production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled delavnice

Ta praktična delavnica vodi razvijalce skozi proces uporabe obstoječega AI predloge in njene postavitve z uporabo Azure Developer CLI (AZD). Naučili se boste ključne vzorce za produkcijsko postavitev AI z uporabo storitev Microsoft Foundry.

> **Pregled izdaje (2026-11-04):** Navodila za ukaze AZD in imena primerov konfiguracije so bili preverjeni glede na izdajo `azd` `1.37.2` in trenutno konfiguracijo povezane predloge. To je pregled dokumentacije, ne preverjanje žive postavitve. RAG laboratorij ne zahteva razširitve agenta; za ocene agentov uporabite ločeno razširitev `azure.ai.evaluations` in [trenutni delovni tok ocenjevanja](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), ne ukaze za oceno starejših agentov.

**Trajanje:** 2-3 ure  
**Raven:** Vmesno  
**Predpogoji:** Osnovno poznavanje Azure, seznanjenost s koncepti AI/ML

## 🎓 Cilji učenja

Do konca te delavnice boste lahko:
- ✅ Raziskali obstoječo AI AZD predlogo in načrtovali pretvorbo svoje aplikacije
- ✅ Konfigurirali Microsoft Foundry storitve z AZD
- ✅ Uvedli varno upravljanje poverilnic za AI storitve
- ✅ Postavili referenčno AI aplikacijo z nadzorom
- ✅ Odpravljali pogoste težave pri postavitvi AI

## Predpogoji

### Potrebna orodja
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nameščen
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nameščen
- [Git](https://git-scm.com/) nameščen
- Urejevalnik kode (priporočeno VS Code)

Ti bloki ukazov uporabljajo sintakso Bash (vključno s prekinjanjem vrstic in `grep`). V sistemu Windows uporabite Git Bash/WSL ali jih prevedite v PowerShell. Namestite tudi orodja za jezik, upravitelja paketov in vsebnike, navedena v [lokalni nastavitvi okolja vzorca](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure viri
- Azure naročnina z dovoljenji za zagotavljanje virov in dodeljevanje vlog (samo Contributor ne more ustvariti RBAC dodelitev; uporabite pooblaščenega skrbnika vlog ali dokumentirani ekvivalent vzorca)
- Dostop do storitev Microsoft Foundry Models (ali možnost zahtevka za dostop)
- Dovoljenja za ustvarjanje skupin virov

### Predznanje
- Osnovno razumevanje Azure storitev
- Poznavanje ukazne vrstice
- Osnovni AI/ML koncepti (API-ji, modeli, pozivi)

## Nastavitev laboratorija

### Korak 1: Priprava okolja

1. **Preverite namestitve orodij:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Če delate prek več najemnikov ali vaša naročnina ni samodejno zaznana, poskusite znova z `azd auth login --tenant-id <tenant-id>`.

2. **Klonirajte repozitorij delavnice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumevanje strukture AZD za AI aplikacije

### Anatomija AI AZD predloge

Raziščite ključne datoteke v AI-pripravljeni AZD predlogi:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Preverjeni vzorec se lahko spremeni; `.azure/` se prikaže po inicializaciji okolja, ne nujno pri svežem klonu. Preučite dejanski preverjen izvod, namesto da ustvarjate manjkajoče imenike za uskladitev s to shemo.

### **Laboratorijska vaja 1.1: Raziščite konfiguracijo**

1. **Preglejte datoteko azure.yaml:**
```bash
cat azure.yaml
```

**Na kaj paziti:**
- Definicije storitev za AI komponente
- Preslikave okolijskih spremenljivk
- Konfiguracije gostiteljev

2. **Preglejte infrastrukturo main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI vzorci za prepoznavanje:**
- Zagotavljanje storitve Microsoft Foundry Models
- Integracija Azure AI Search
- Varnostno upravljanje ključev
- Konfiguracije omrežne varnosti

### **Razprava:** Zakaj so ti vzorci pomembni za AI

- **Ovisnosti storitev**: AI aplikacije pogosto zahtevajo več usklajenih storitev
- **Varnost**: API ključi in končne točke potrebujejo varno upravljanje
- **Razširljivost**: AI delovne obremenitve imajo posebne zahteve za skaliranje
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso pravilno konfigurirane

## Modul 2: Namestite svojo prvo AI aplikacijo

### Korak 2.1: Inicializacija okolja

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite zahtevane parametre:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Korak 2.2: Namestite infrastrukturo in aplikacijo

1. **Namestite z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Zagotovi Microsoft Foundry Models storitev
- ✅ Ustvari Azure AI Search storitev
- ✅ Nastavi Azure Container Apps za backend in združeni frontend (privzeto pri trenutnem vzorcu)
- ✅ Konfigurira omrežje in varnost
- ✅ Namesti aplikacijsko kodo
- ✅ Nastavi spremljanje in beleženje

2. **Spremljajte napredek namestitve** in zabeležite ustvarjene vire.

### Korak 2.3: Preverite namestitev

1. **Preverite nameščene vire:**
```bash
azd show
```

2. **Odprite nameščeno aplikacijo:**
```bash
azd show
```

Odprite spletni konec, prikazan v izhodu `azd show`.

3. **Preizkusite AI funkcionalnost:**
   - Odprite spletno aplikacijo
   - Preizkusite vzorčne poizvedbe
   - Preverite, ali AI odgovori delujejo

### **Laboratorijska vaja 2.1: Praksa odpravljanja težav**

**Scenarij**: Vaša namestitev je uspela, a AI ne odgovarja.

**Pogoste težave za preverjanje:**
1. **Avtentikacija**: Preverite upravljano identiteto in dodelitev vlog; API ključe preverjajte le, če ste namerno omogočili avtentikacijo z ključem
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Omrežna povezanost**: Zagotovite, da storitve lahko komunicirajo
4. **RBAC dovoljenja**: Preverite, ali aplikacija lahko dostopa do OpenAI

**Ukazi za odpravljanje napak:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagajanje AI aplikacij vašim potrebam

### Korak 3.1: Spremenite AI konfiguracijo

1. **Posodobite OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Dodajte dodatne AI storitve:**

Uredite `infra/main.bicep`, da dodate Document Intelligence:

Naslednji primer je ilustrativen odlomek, ne popolna predloga. Vzorec lahko že zagotavlja storitve za obdelavo dokumentov: pred dodajanjem podvojenih virov preglejte trenutno infrastrukturo. Prilagoditve zahtevajo povezavo izhodov, identitet in konfiguracijo aplikacije.

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

### Korak 3.2: Okolju specifične konfiguracije

**Najboljša praksa**: Različne konfiguracije za razvoj in produkcijo.

1. **Ustvarite produkcijsko okolje:**
```bash
azd env new myai-production
```

2. **Nastavite produkcijsko specifične parametre:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Ta imena izhajajo iz [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) vzorca. `azd env set` hrani vrednost, vendar ne naredi proizvoljne spremenljivke učinkovite: predloga jo mora uporabiti. Pred onemogočanjem javnega dostopa preglejte [vodnik za omrežno izolacijo](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) vzorca in uporabite `azd up` za uveljavitev sprememb infrastrukture. SKU OpenAI `S0` sam po sebi ne določa prepustnosti modela; pomembna sta tudi tip in zmogljivost namestitve modela.

### **Laboratorijska vaja 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte predlogo za stroškovno učinkoviti razvoj.

**Naloge:**
1. Izberite začasno delavnico okolje: `azd env select myai-workshop`.
2. Zabeležite trenutno Search SKU in kapaciteto modela iz `infra/main.parameters.json` in izbranega okolja.
3. Uporabite spodnje podprte vnose, potem ko potrdite model/regijsko kvoto:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Preverite Search SKU in kapaciteto namestitve v portalu ter ocenite razliko s cenovnim kalkulatorjem. Ne pričakujte takojšnje posodobitve podatkov o obračunu.

**Kriteriji uspeha:** Search uporablja Basic, namestitev klepeta ima zahtevano podprto kapaciteto, aplikacija pa še vedno odgovori na vzorčno vprašanje. Kapaciteta `10` je dodelitev omejitve hitrosti, ne popust na ceno na token. Spremembe nivoja Search so lahko omejene ali zahtevajo ponovno ustvarjanje; ne eksperimentirajte na produkcijskih virih. F0 je specifičen za storitev in ni SKU Azure OpenAI modela.

## Modul 4: Varnost in produkcijske najboljše prakse

### Korak 4.1: Varnostno upravljanje poverilnic

**Trenutni izziv**: Veliko AI aplikacij kodira API ključe ali uporablja nevarno shranjevanje.

**Rešitev AZD**: Upravljana identiteta + integracija Key Vault.

1. **Preglejte varnostno konfiguracijo v vaši predlogi:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, ali upravljana identiteta deluje:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Omrežna varnost

1. **Omogočite zasebne končne točke** z uporabo podprte omrežne konfiguracije vzorca (če še ni konfigurirana).

Za vašo lastno predlogo ta ilustrativni odlomek prikazuje povezavo do OpenAI končne točke. Potrebuje tudi VNet, zasebno DNS konfiguracijo in povezljivost aplikacije; ne prilepite ga nespremenjenega v vzorec, ki že vsebuje module zasebnih končnih točk:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Omogočite integracijo Application Insights vzorca:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Instrumentacija vzorca oddaja telemetrijo; proizvoljna nastavitev `OPENAI_MONITOR_ENABLED` ne omogoči AI metrik. Preglejte sledove klicev modela, zakasnitve, napake in uporabo tokenov, ter se izogibajte zapisovanju občutljivih pozivov ali odgovorov.

### **Laboratorijska vaja 4.1: Varnostni pregled**

**Naloga**: Preglejte vašo namestitev glede najboljših varnostnih praks.

**Kontrolni seznam:**
- [ ] Brez zakodiranih skrivnosti v kodi ali konfiguraciji
- [ ] Uporaba upravljane identitete za avtentikacijo med storitvami
- [ ] Key Vault hrani občutljivo konfiguracijo
- [ ] Omrežni dostop je ustrezno omejen
- [ ] Spremljanje in beleženje sta omogočena

## Modul 5: Pretvorba vaše AI aplikacije

### Korak 5.1: Delovni list ocene

**Pred pretvorbo vaše aplikacije** odgovorite na ta vprašanja:

1. **Arhitektura aplikacije:**
   - Katere AI storitve uporablja vaša aplikacija?
   - Kakšne računalniške vire potrebuje?
   - Ali potrebuje podatkovno bazo?
   - Kakšne so odvisnosti med storitvami?

2. **Zahteve glede varnosti:**
   - Katere občutljive podatke obdeluje aplikacija?
   - Katere zahteve skladnosti imate?
   - Ali potrebujete zasebno omrežje?

3. **Zahteve glede skaliranja:**
   - Kakšen je pričakovani promet?
   - Ali potrebujete samodejno skaliranje?
   - Ali so regionalne zahteve?

### Korak 5.2: Ustvarite svojo AZD predlogo

**Sledite temu vzorcu za pretvorbo vaše aplikacije:**

**Samo okvir:** Ta razdelek ne zagotavlja kodne baze API/spletne aplikacije, infrastrukture gostiteljev, namestitev modelov, identitete/RBAC ali dokončanega `main.parameters.json`. Bicep na ravni skupine virov ilustrira sestavo modula; tipična AZD točka na ravni naročnine mora ustvariti skupino virov in jo tam priklicati. Ne pričakujte, da bo `azd up` po kopiranju samo teh odlomkov namestil celotno aplikacijo. Za zagon ohranite RAG predlogo iz Modula 1.

1. **Ustvarite osnovno strukturo:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Laboratorijska vaja 5.1: Izziv ustvarjanja predloge**

**Izziv**: Ustvarite AZD predlogo za AI aplikacijo za obdelavo dokumentov.

**Zahteve:**
- Microsoft Foundry Models za analizo vsebine
- Document Intelligence za OCR
- Shramba za nalaganje dokumentov
- Function App za poslovno logiko
- Spletna aplikacija za uporabniški vmesnik

**Bonus točke:**
- Dodajte ustrezno obravnavo napak
- Vključite oceno stroškov
- Nastavite nadzorne plošče

## Modul 6: Odpravljanje pogostih težav

### Pogoste težave pri namestitvi

#### Težava 1: Presežena kvota storitve OpenAI
**Simptomi:** Namestitev neuspešna zaradi napake kvote
**Rešitve:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Težava 2: Model ni na voljo v regiji
**Simptomi:** AI odgovori ne uspejo ali napake pri namestitvi modela
**Rešitve:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Težava 3: Težave z dovoljenji
**Simptomi:** 403 Prepovedano napake pri klicih AI storitev
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

### Težave s performansom

#### Težava 4: Počasni AI odgovori
**Koraki za preiskavo:**
1. Preverite metrike performans v Application Insights
2. Preglejte metrike storitve OpenAI v Azure portalu
3. Preverite omrežno povezljivost in zakasnitev

**Rešitve:**
- Uvedite predpomnjenje za pogoste poizvedbe
- Uporabite primeren OpenAI model za vaš primer uporabe
- Razširite replike aplikacije šele po preverjanju mejnih vrednosti modela RPM/TPM; Azure OpenAI namestitve ne omogočajo generične nastavitve "read replica" baze podatkov

### **Laboratorijska vaja 6.1: Izziv odpravljanja napak**

**Scenarij**: Namestitev je uspela, a aplikacija vrača 500 napake.

**Naloge odpravljanja napak:**
1. Preverite dnevnike aplikacije
2. Preverite povezljivost storitev
3. Preizkusite preverjanje pristnosti
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled uvedbe
- Azure portal za podrobne dnevnike storitev
- Application Insights za telemetrijo aplikacij

## Modul 7: Nadzor in optimizacija

### Korak 7.1: Nastavite celovit nadzor

1. **Ustvarite prilagojene nadzorne plošče:**

Pojdite v Azure portal in ustvarite nadzorno ploščo z:
- Številom zahtev OpenAI in zakasnitvijo
- Stopnjami napak aplikacij
- Uporabo virov
- Spremljanjem stroškov

2. **Nastavite opozorila:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Preverite, ali komponenta oddaja telemetrijo zahtev in dodajte skupino dejanj, če so potrebna obvestila. Meritve so štetje, ne odstotek napak; opozorilo za stopnjo zahteva ustrezen poizvedbo in imenovalec.

### Korak 7.2: Optimizacija stroškov

1. **Analizirajte trenutne stroške:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Zamenjajte nadomestne datume. Podpora API porabe se razlikuje glede na pogodbo o zaračunavanju; uporabite Cost Management v portalu, če podatki o uporabi niso na voljo. Stroški so zamujeni, niso trenutni test.

2. **Izvedite nadzor stroškov:**
- Nastavite opozorila o proračunu
- Uporabite politike avtomatskega skaliranja
- Izvedite predpomnjenje zahtev
- Spremljajte uporabo žetonov za OpenAI

### **Lab vaja 7.1: Optimizacija zmogljivosti**

**Opravek**: Optimizirajte svojo AI aplikacijo za zmogljivost in stroške.

**Metrične izboljšave:**
- Zmanjšajte povprečni odzivni čas za 20 %
- Zmanjšajte mesečne stroške za 15 %
- Definirajte 99,9% SLO razpoložljivosti in merilno obdobje (kratek laboratorij ne more pokazati mesečne razpoložljivosti)

**Strategije za preizkus:**
- Izvedite predpomnjenje odzivov
- Optimizirajte pozive za učinkovitost žetonov
- Uporabite ustrezne računske SKU-je
- Nastavite pravilno avtomatsko skaliranje

## Zaključni izziv: Celovita izvedba

### Izziv scenarija

To je **neobvezen arhitekturni/oblikovalski izziv**, ne pripravljena vaja za zagon ali certifikat za proizvodnjo. Predlagajte chatbot za podporo strankam, ki temelji na AI, in dokumentirajte, katere zahteve potrebujejo nadaljnjo izvedbo in dokazila:

**Funkcionalne zahteve:**
- Spletni vmesnik za interakcije s strankami
- Integracija z Microsoft Foundry modeli za odzive
- Iskanje dokumentov z uporabo Azure AI Search
- Integracija z obstoječo bazo podatkov strank
- Podpora za več jezikov

**Nefunkcionalne zahteve:**
- Podpora za 1000 sočasnih uporabnikov
- SLA 99,9% razpoložljivosti
- Skladnost z SOC 2
- Stroški pod 500 $/mesec
- Uvedba v več okolij (razvojno, preizkusno, produkcijsko)

To so hipotetične omejitve deležnikov, ne sočasno zagotovljeni rezultati. Določite hitrost zahtev, velikost poziva/izhoda in trajanje seje pred oceno stroškov; 1.000 sočasnih uporabnikov ne določa obremenitve ali dokazuje izvedljivosti proračuna 500 $. SOC 2 je rezultat organizacijskega pregleda, ne stikalo, ki ga omogoči AZD predloga. Identificirajte kompromise in zavrnite neuresničljive omejitve z dokazi.

### Koraki izvedbe

1. **Oblikujte arhitekturo**
2. **Ustvarite AZD predlogo**
3. **Izvedite varnostne ukrepe**
4. **Nastavite nadzor in opozorila**
5. **Ustvarite uvedbene pipeline**
6. **Dokumentirajte rešitev**

### Merila ocenjevanja

- ✅ **Funkcionalnost**: So prikazane izvedene zmogljivosti in jasna ostala področja?
- ✅ **Varnost**: So uporabljene najboljše prakse?
- ✅ **Razširljivost**: Ali lahko prenese obremenitev?
- ✅ **Vzdrževanje**: Je koda in infrastruktura dobro organizirana?
- ✅ **Stroški**: Ali ostaja znotraj proračuna?

## Dodatni viri

### Microsoftova dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Vzorec predlog
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App hitri začetek](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Skupnostni viri
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Preverjanje dokončanja

Čestitke! Zaključili ste AI delavnico. Zdaj bi morali znati:

- ✅ Razložiti, kako prilagoditi obstoječo AI aplikacijo za AZD predlogo
- ✅ Uvesti in preizkusiti referenčno AI aplikacijo
- ✅ Uvesti varnostne najboljše prakse za AI delovne obremenitve
- ✅ Nadzorovati in optimizirati zmogljivost AI aplikacije
- ✅ Odpravljati pogoste težave pri uvedbi

**Čiščenje:** Zaženite `azd env list`, izberite vsako uporabo okolja ustvarjeno v tej delavnici (`myai-workshop`, in če ste uvedli `myai-production`/`myai-quota-test`), ter zaženite `azd down` v vsakem. Preglejte načrt odstranitve; samo brisanje lokalne konfiguracije okolja ne izbriše Azure virov. Izogibajte se `--purge`, razen če razumete nepovratno odstranitev mehko izbrisanih virov.

### Naslednji koraki
1. Uporabite te vzorce na svojih AI projektih
2. Prispevajte predloge nazaj skupnosti
3. Pridružite se Microsoft Foundry Discord za stalno podporo
4. Raziščite napredne teme, kot so uvedbe v več regijah

---

**Povratne informacije o delavnici**: Pomagajte nam izboljšati to delavnico tako, da delite svoje izkušnje na [Microsoft Foundry Discord #Azure kanalu](https://discord.gg/microsoft-azure).

---

**Navigacija poglavja:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - AI-prvi razvoj
- **⬅️ Prejšnje**: [Uvedba AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse proizvodnega AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o uvedbah AZD in AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->