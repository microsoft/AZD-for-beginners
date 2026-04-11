# Delavnica AI: Priprava vaših AI rešitev za uvajanje z AZD

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, osredotočen na AI
- **⬅️ Prejšnje**: [Uvajanje AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse za AI v produkciji](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled delavnice

Ta praktični laboratorij vodi razvijalce skozi postopek prevzema obstoječe AI predloge in njenega uvajanja z uporabo Azure Developer CLI (AZD). Naučili se boste ključnih vzorcev za uvajanje AI v produkcijo z uporabo storitev Microsoft Foundry.

> **Opomba validate (2026-03-25):** Ta delavnica je bila pregledana z `azd` `1.23.12`. Če je vaša lokalna namestitev starejša, posodobite AZD pred začetkom, da bo avtentikacija, predloga in potek uvajanja ujemal korake spodaj.

**Trajanje:** 2-3 ure  
**Raven:** Srednja  
**Predpogoji:** Osnovno znanje Azure, seznanjenost s koncepti AI/ML

## 🎓 Cilji učenja

Do konca te delavnice boste sposobni:
- ✅ Pretvoriti obstoječo AI aplikacijo za uporabo AZD predlog
- ✅ Konfigurirati Microsoft Foundry storitve z AZD
- ✅ Uvesti varno upravljanje poverilnic za AI storitve
- ✅ Uvesti produkcijsko pripravljene AI aplikacije z nadzorom
- ✅ Odpravljati pogoste težave pri uvajanju AI

## Predpogoji

### Zahtevana orodja
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nameščen
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nameščen
- [Git](https://git-scm.com/) nameščen
- Urejevalnik kode (priporočamo VS Code)

### Azure viri
- Azure naročnina z dovoljenji Contributor
- Dostop do Microsoft Foundry Models storitev (ali možnost zahtevka za dostop)
- Pravice za ustvarjanje skupin virov

### Potrebno znanje
- Osnovno razumevanje Azure storitev
- Seznanjenost z ukazno vrstico
- Osnovni AI/ML koncepti (API-ji, modeli, pozivi)

## Nastavitev laboratorija

### Korak 1: Priprava okolja

1. **Preverite nameščena orodja:**
```bash
# Preverite namestitev AZD
azd version

# Preverite Azure CLI
az --version

# Prijavite se v Azure za AZD poteke dela
azd auth login

# Prijavite se v Azure CLI samo, če nameravate med diagnostiko zagnati ukaze az
az login
```

Če delate v več najemnikih ali vaša naročnina ni samodejno zaznana, poskusite znova z `azd auth login --tenant-id <tenant-id>`.

2. **Klonirajte repozitorij delavnice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumevanje strukture AZD za AI aplikacije

### Zgradba AI AZD predloge

Raziščite ključne datoteke v AZD predlogi, pripravljeni za AI:

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

### **Laboratorijska vaja 1.1: Raziščite konfiguracijo**

1. **Preučite datoteko azure.yaml:**
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

**Ključni AI vzorci, ki jih morate prepoznati:**
- Provisioning Microsoft Foundry Models storitve
- Integracija Cognitive Search
- Varno upravljanje ključev
- Konfiguracije omrežne varnosti

### **Točka za razpravo:** Zakaj so ti vzorci pomembni za AI

- **Odvisnosti storitev**: AI aplikacije pogosto zahtevajo več usklajenih storitev
- **Varnost**: API ključi in končne točke je treba varno upravljati
- **Skalabilnost**: AI obremenitve imajo posebne zahteve po skaliranju
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso pravilno konfigurirane

## Modul 2: Uvedite svojo prvo AI aplikacijo

### Korak 2.1: Inicializirajte okolje

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite zahtevane parametre:**
```bash
# Nastavite želeno Azure regijo
azd env set AZURE_LOCATION eastus

# Neobvezno: Nastavite določen model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Korak 2.2: Uvedite infrastrukturo in aplikacijo

1. **Uvedite z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Provisionira Microsoft Foundry Models storitev
- ✅ Ustvari Cognitive Search storitev
- ✅ Nastavi App Service za spletno aplikacijo
- ✅ Konfigurira omrežje in varnost
- ✅ Uvede kodo aplikacije
- ✅ Nastavi nadzor in beleženje

2. **Spremljajte napredek uvajanja** in opazujte vire, ki se ustvarjajo.

### Korak 2.3: Preverite svojo uvedbo

1. **Preverite uvedene vire:**
```bash
azd show
```

2. **Odprite uvedeno aplikacijo:**
```bash
azd show
```

Odprite spletno končno točko, prikazano v izpisu `azd show`.

3. **Preizkusite AI funkcionalnost:**
   - Pojdite na spletno aplikacijo
   - Preizkusite vzorčne poizvedbe
   - Preverite, ali AI odgovori delujejo

### **Laboratorijska vaja 2.1: Vaja odpravljanja napak**

**Scenarij**: Uvedba je bila uspešna, vendar AI ne odgovarja.

**Pogoste težave za preveriti:**
1. **OpenAI API ključi**: Preverite, da so pravilno nastavljeni
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Omrežna povezljivost**: Zagotovite, da se storitve lahko povežejo
4. **RBAC dovoljenja**: Preverite, ali aplikacija lahko dostopa do OpenAI

**Ukazi za odpravljanje napak:**
```bash
# Preveri spremenljivke okolja
azd env get-values

# Ogled dnevnikov razmestitve
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Preveri stanje razmestitve OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagajanje AI aplikacij vašim potrebam

### Korak 3.1: Spremenite AI konfiguracijo

1. **Posodobite OpenAI model:**
```bash
# Preklopite na drug model (če je na voljo v vaši regiji)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ponovno razmestite z novo konfiguracijo
azd deploy
```

2. **Dodajte dodatne AI storitve:**

Uredite `infra/main.bicep` in dodajte Document Intelligence:

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

### **Laboratorijska vaja 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte predlogo za cenovno ugoden razvoj.

**Naloge:**
1. Določite, kateri SKU-ji se lahko nastavijo na brezplačne/osnovne ravni
2. Konfigurirajte okoljske spremenljivke za minimalne stroške
3. Uvedite in primerjajte stroške s produkcijsko konfiguracijo

**Namigi za rešitev:**
- Uporabite F0 (brezplačno) raven za Cognitive Services, kjer je mogoče
- Uporabite osnovno raven za Search Service v razvoju
- Razmislite o uporabi Consumption načrta za Functions

## Modul 4: Varnost in najboljše prakse za produkcijo

### Korak 4.1: Varno upravljanje poverilnic

**Trenutni izziv**: Veliko AI aplikacij vgrajuje API ključe neposredno v kodo ali uporablja negotovo shranjevanje.

**Rešitev z AZD**: Integracija Managed Identity in Key Vault.

1. **Preglejte varnostno konfiguracijo v svoji predlogi:**
```bash
# Poiščite konfiguracijo Key Vault in upravljane identitete
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, ali Managed Identity deluje:**
```bash
# Preverite, ali ima spletna aplikacija pravilno konfiguracijo identitete
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
# Application Insights naj bi bil samodejno konfiguriran
# Preverite konfiguracijo:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavite nadzor specifičen za AI:**

Dodajte po meri metrike za AI operacije:
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

**Naloga**: Preglejte svojo uvedbo glede najboljših varnostnih praks.

**Kontrolni seznam:**
- [ ] Brez vgrajenih skrivnosti v kodi ali konfiguraciji
- [ ] Uporabljena Managed Identity za avtentikacijo med storitvami
- [ ] Key Vault hrani občutljive konfiguracije
- [ ] Omrežni dostop je ustrezno omejen
- [ ] Nadzor in beleženje sta omogočena

## Modul 5: Pretvorba vaše lastne AI aplikacije

### Korak 5.1: Ocena - delovni list

**Pred pretvorbo vaše aplikacije**, odgovorite na naslednja vprašanja:

1. **Arhitektura aplikacije:**
   - Katere AI storitve uporablja vaša aplikacija?
   - Kateri računski viri so potrebni?
   - Ali potrebuje bazo podatkov?
   - Kakšne so odvisnosti med storitvami?

2. **Varnostne zahteve:**
   - S katerimi občutljivimi podatki se ukvarja vaša aplikacija?
   - Katere zahteve skladnosti imate?
   - Potrebujete zasebno omrežje?

3. **Zahteve po skaliranju:**
   - Kakšna je pričakovana obremenitev?
   - Potrebujete samodejno skaliranje?
   - Ali imate regionalne zahteve?

### Korak 5.2: Ustvarite svojo AZD predlogo

**Sledite tem korakom za pretvorbo aplikacije:**

1. **Ustvarite osnovno strukturo:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializiraj predlogo AZD
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

### **Laboratorijska vaja 5.1: Izziv - ustvarjanje predloge**

**Izziv**: Ustvarite AZD predlogo za AI aplikacijo za obdelavo dokumentov.

**Zahteve:**
- Microsoft Foundry Models za analizo vsebine
- Document Intelligence za OCR
- Storage Account za nalaganje dokumentov
- Function App za procesno logiko
- Spletna aplikacija za uporabniški vmesnik

**Dodatne točke:**
- Dodajte ustrezno ravnanje z napakami
- Vključite oceno stroškov
- Nastavite nadzorne nadzorne plošče

## Modul 6: Odpravljanje pogostih težav

### Pogoste težave pri uvajanju

#### Težava 1: Kvota storitve OpenAI presežena
**Simptomi:** Uvedba ne uspe zaradi napake kvote
**Rešitve:**
```bash
# Preverite trenutne kvote
az cognitiveservices usage list --location eastus

# Zahtevajte povečanje kvote ali poskusite drugo regijo
azd env set AZURE_LOCATION westus2
azd up
```

#### Težava 2: Model ni na voljo v regiji
**Simptomi:** AI odgovori ne delujejo ali napake pri uvajanju modela
**Rešitve:**
```bash
# Preveri razpoložljivost modela po regijah
az cognitiveservices model list --location eastus

# Posodobi na razpoložljiv model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Težava 3: Težave s dovoljenji
**Simptomi:** 403 Forbidden napake pri klicih AI storitev
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

#### Težava 4: Počasi odgovarjanje AI
**Koraki preiskave:**
1. Preverite Application Insights za metrike zmogljivosti
2. Preglejte metrike OpenAI storitve v Azure portalu
3. Preverite omrežno povezanost in zakasnitve

**Rešitve:**
- Uvedite predpomnjenje za pogoste poizvedbe
- Uporabite ustrezen OpenAI model za vaš primer uporabe
- Razmislite o replikah za branje za visoko obremenitev

### **Laboratorijska vaja 6.1: Izziv odpravljanja napak**

**Scenarij**: Uvedba je bila uspešna, vendar aplikacija vrača 500 napake.

**Naloge za odpravljanje napak:**
1. Preverite dnevnike aplikacije
2. Preverite povezljivost storitev
3. Preizkusite avtentikacijo
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled uvedbe
- Azure portal za podrobne dnevnike storitev
- Application Insights za telemetrijo aplikacije

## Modul 7: Nadzor in optimizacija

### Korak 7.1: Nastavite celovit nadzor

1. **Ustvarite prilagojene nadzorne plošče:**

Pojdite v Azure portal in ustvarite nadzorno ploščo z:
- Štetjem zahtev OpenAI in latenco
- Stopnjami napak aplikacije
- Izrabo virov
- Sledenjem stroškom

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

2. **Vzpostavite kontrole stroškov:**
- Nastavite opozorila za proračun
- Uporabljajte politike samodejnega skaliranja
- Uvedite predpomnjenje zahtev
- Spremljajte porabo tokenov za OpenAI

### **Laboratorijska vaja 7.1: Optimizacija zmogljivosti**

**Naloga**: Optimizirajte vašo AI aplikacijo za zmogljivost in stroške.

**Metrične vrednosti za izboljšanje:**
- Znižajte povprečni odzivni čas za 20%
- Znižajte mesečne stroške za 15%
- Ohranjajte 99,9% razpoložljivost

**Strategije za preizkus:**
- Uvedite predpomnjenje odgovorov
- Optimizirajte pozive za učinkovitost tokenov
- Uporabite ustrezne compute SKU-je
- Nastavite pravilno samodejno skaliranje

## Zaključni izziv: Celovita implementacija

### Scenarij izziva

Dodeljeni ste za ustvarjanje produkcijsko pripravljene AI-poganjane klepetalnice za podporo strankam z naslednjimi zahtevami:

**Funkcionalne zahteve:**
- Spletni vmesnik za interakcije s strankami
- Integracija z Microsoft Foundry Models za odgovore
- Iskanje dokumentov z uporabo Cognitive Search
- Integracija z obstoječo bazo strank
- Podpora več jezikov

**Ne-funkcionalne zahteve:**
- Obdelava 1000 sočasnih uporabnikov
- 99,9% SLA za razpoložljivost
- SOC 2 skladnost
- Stroški pod $500/mesec
- Uvajanje v več okolij (dev, staging, prod)

### Koraki implementacije

1. **Načrtujte arhitekturo**
2. **Ustvarite AZD predlogo**
3. **Izvedite varnostne ukrepe**
4. **Nastavite nadzor in opozarjanje**
5. **Ustvarite cevovode za uvajanje**
6. **Dokumentirajte rešitev**

### Kriteriji ocenjevanja

- ✅ **Funkcionalnost**: Ali izpolnjuje vse zahteve?
- ✅ **Varnost**: Ali so uveljavljene najboljše prakse?
- ✅ **Skalabilnost**: Ali lahko prenese obremenitev?
- ✅ **Vzdržljivost**: Ali sta koda in infrastruktura dobro organizirani?
- ✅ **Stroški**: Ali ostaja v okviru proračuna?

## Dodatni viri

### Microsoftova dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Vzorne predloge
- [Aplikacija za klepet Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Hitri začetek OpenAI Chat App](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Viri skupnosti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI na GitHubu](https://github.com/Azure/azure-dev)
- [Odlične predloge AZD](https://azure.github.io/awesome-azd/)

## 🎓 Potrdilo o zaključenju

Čestitamo! Zaključili ste AI delavnico. Zdaj bi morali biti sposobni:

- ✅ Pretvoriti obstoječe AI aplikacije v predloge AZD
- ✅ Razmestiti produkcijsko pripravljene AI aplikacije
- ✅ Uvesti najboljše varnostne prakse za AI delovne obremenitve
- ✅ Spremljati in optimizirati zmogljivost AI aplikacij
- ✅ Odpravljati pogoste težave pri razmestitvi

### Naslednji koraki
1. Uporabite te vzorce v svojih AI projektih
2. Prispevajte predloge nazaj skupnosti
3. Pridružite se Microsoft Foundry Discord za stalno podporo
4. Raziščite napredne teme, kot so razmestitve v več regijah

---

**Povratne informacije delavnice**: Pomagajte nam izboljšati to delavnico tako, da delite svoje izkušnje v [Microsoft Foundry Discord #Azure kanal](https://discord.gg/microsoft-azure).

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, osredotočen na AI
- **⬅️ Prejšnje**: [Razmestitev AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse za produkcijski AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o razmestitvah AZD in AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje, ki uporablja umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem matičnem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo strokoven človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->