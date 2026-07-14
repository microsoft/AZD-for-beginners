# AI delavnica: Kako vaše rešitve AI narediti AZD-razpoložljive

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - AI-prvi razvoj
- **⬅️ Prejšnje**: [Namestitev AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse proizvodnega AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled delavnice

Ta praktični laboratorij vodi razvijalce skozi proces uporabe obstoječega AI vzorca in njegovo nameščanje z uporabo Azure Developer CLI (AZD). Naučili se boste bistvenih vzorcev za proizvodne namestitve AI z uporabo Microsoft Foundry storitev.

> **Opomba o preverjanju (2026-07-13):** Ta delavnica je bila preverjena z `azd` `1.27.1`. Če je vaša lokalna namestitev starejša, posodobite AZD pred začetkom, da bodo avtentikacija, vzorec in potek namestitve skladni z naslednjimi koraki.

**Trajanje:** 2-3 ure  
**Raven:** Srednje zahtevno  
**Predznanje:** Osnove Azure, seznanjenost s koncepti AI/ML

## 🎓 Cilji učenja

Ob koncu te delavnice boste znali:
- ✅ Pretvoriti obstoječo AI aplikacijo za uporabo AZD vzorcev
- ✅ Konfigurirati Microsoft Foundry storitve z AZD
- ✅ Uvesti varno upravljanje poverilnic za AI storitve
- ✅ Namestiti proizvodne AI aplikacije z nadzorom
- ✅ Odpraviti pogoste težave pri namestitvi AI

## Predpogoji

### Potrebna orodja
- Namestitev [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Namestitev [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Namestitev [Git](https://git-scm.com/)
- Urejevalnik kode (priporočamo VS Code)

### Azure viri
- Azure naročnina z dostopom »contributor«
- Dostop do Microsoft Foundry Models storitev (ali možnost zahtevka za dostop)
- Pravice za ustvarjanje skupine virov

### Predznanje
- Osnovno razumevanje Azure storitev
- Seznanjenost z ukazno vrstico
- Osnovni koncepti AI/ML (API-ji, modeli, spodbujevalniki)

## Nastavitev laboratorija

### Korak 1: Priprava okolja

1. **Preverite namestitev orodij:**
```bash
# Preveri namestitev AZD
azd version

# Preveri Azure CLI
az --version

# Prijava v Azure za AZD delovne tokove
azd auth login

# Prijava v Azure CLI samo, če nameravate med diagnostiko izvajati az ukaze
az login
```

Če delate čez več najemnikov ali vaša naročnina ni samodejno zaznana, poskusite znova z `azd auth login --tenant-id <tenant-id>`.

2. **Klonirajte repozitorij delavnice:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Razumevanje strukture AZD za AI aplikacije

### Anatomija AI AZD vzorca

Raziščite ključne datoteke v AI-pripravljenem AZD vzorcu:

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

### **Laboratorijska vaja 1.1: Raziščite konfiguracijo**

1. **Preglejte datoteko azure.yaml:**
```bash
cat azure.yaml
```

**Na kaj bodite pozorni:**
- Definicije storitev za AI komponente
- Preslikave okoljskih spremenljivk
- Konfiguracije gostiteljev

2. **Preglejte infrastrukturo main.bicep:**
```bash
cat infra/main.bicep
```

**Ključni AI vzorci za prepoznavanje:**
- Zagotavljanje Microsoft Foundry Models storitve
- Integracija Azure AI Search
- Varno upravljanje ključev
- Omrežne varnostne nastavitve

### **Diskusijska točka:** Zakaj so ti vzorci pomembni za AI

- **Odvisnosti med storitvami**: AI aplikacije pogosto potrebujejo več usklajenih storitev
- **Varnost**: API ključi in končne točke morajo biti varno upravljani
- **Razširljivost**: Delovne obremenitve AI imajo posebne zahteve za skaliranje
- **Upravljanje stroškov**: AI storitve so lahko drage, če niso pravilno konfigurirane

## Modul 2: Namestitev vaše prve AI aplikacije

### Korak 2.1: Inicializacija okolja

1. **Ustvarite novo AZD okolje:**
```bash
azd env new myai-workshop
```

2. **Nastavite potrebne parametre:**
```bash
# Nastavite svojo željeno regijo Azure
azd env set AZURE_LOCATION eastus

# Neobvezno: Nastavite specifičen model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Korak 2.2: Namestitev infrastrukture in aplikacije

1. **Namestite z AZD:**
```bash
azd up
```

**Kaj se zgodi med `azd up`:**
- ✅ Zagotovi Microsoft Foundry Models storitev
- ✅ Ustvari Azure AI Search storitev
- ✅ Nastavi App Service za spletno aplikacijo
- ✅ Konfigurira omrežje in varnost
- ✅ Namesti kodo aplikacije
- ✅ Nastavi nadzor in beleženje

2. **Spremljajte napredek namestitve** in zabeležite ustvarjene vire.

### Korak 2.3: Preverite vašo namestitev

1. **Preverite nameščene vire:**
```bash
azd show
```

2. **Odprite nameščeno aplikacijo:**
```bash
azd show
```

Odprite spletni konektor, prikazan v izpitu `azd show`.

3. **Testirajte AI funkcionalnost:**
   - Pomaknite se do spletne aplikacije
   - Preizkusite vzorčne poizvedbe
   - Preverite, da AI odgovori delujejo

### **Laboratorijska vaja 2.1: Vaja odpravljanja težav**

**Scenarij**: Namestitev je uspela, vendar AI ne odgovarja.

**Pogoste težave za pregled:**
1. **OpenAI API ključi**: Preverite, da so pravilno nastavljeni
2. **Razpoložljivost modela**: Preverite, ali vaša regija podpira model
3. **Omrežna povezljivost**: Zagotovite, da storitve lahko komunicirajo
4. **RBAC dovoljenja**: Preverite, da aplikacija lahko dostopa do OpenAI

**Ukazi za odpravljanje napak:**
```bash
# Preveri okoljske spremenljivke
azd env get-values

# Poglej dnevnike nameščanja
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Preveri stanje nameščanja OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prilagajanje AI aplikacij za vaše potrebe

### Korak 3.1: Spremenite AI konfiguracijo

1. **Posodobite OpenAI model:**
```bash
# Spremenite na drug model (če je na voljo v vaši regiji)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ponovno zaženite z novo konfiguracijo
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

### Korak 3.2: Okolju specifične konfiguracije

**Najboljša praksa**: Različne konfiguracije za razvoj in proizvodnjo.

1. **Ustvarite proizvodno okolje:**
```bash
azd env new myai-production
```

2. **Nastavite proizvodno specifične parametre:**
```bash
# Proizvodnja običajno uporablja višje SKU-je
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Omogoči dodatne varnostne funkcije
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorijska vaja 3.1: Optimizacija stroškov**

**Izziv**: Konfigurirajte vzorec za stroškovno učinkovito razvojno okolje.

**Naloge:**
1. Določite, kateri SKU-ji se lahko nastavijo na brezplačne/osnovne stopnje
2. Konfigurirajte okoljske spremenljivke za minimalne stroške
3. Namestite in primerjajte stroške s proizvodno konfiguracijo

**Namigi za rešitev:**
- Uporabite F0 (brezplačno) stopnjo za Azure AI storitve, če je mogoče
- Uporabite osnovno stopnjo za Search Service v razvoju
- Razmislite o uporabi Consumption načrta za Functions

## Modul 4: Varnost in najboljše proizvodne prakse

### Korak 4.1: Varen upravljanje poverilnic

**Trenutni izziv**: Mnoge AI aplikacije imajo zakodirane API ključe ali uporabljajo nezavarovano shrambo.

**AZD rešitev**: Uporaba Managed Identity + integracija s Key Vault.

1. **Preglejte varnostno konfiguracijo v vašem vzorcu:**
```bash
# Poiščite konfiguracijo Key Vault in Upravljane identitete
grep -r "keyVault\|managedIdentity" infra/
```

2. **Preverite, da Managed Identity deluje:**
```bash
# Preverite, ali spletna aplikacija ima pravilno konfiguracijo identitete
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Korak 4.2: Omrežna varnost

1. **Omogočite zasebne končne točke** (če še niso konfigurirane):

Dodajte v vaš bicep vzorec:
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
# Application Insights bi morali biti samodejno konfigurirani
# Preverite konfiguracijo:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavite AI-specifični nadzor:**

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

**Naloga**: Preglejte vašo namestitev glede najboljših varnostnih praks.

**Kontrolni seznam:**
- [ ] Brez zakodiranih skrivnosti v kodi ali konfiguraciji
- [ ] Uporabljena Managed Identity za avtentikacijo med storitvami
- [ ] Key Vault hrani občutljivo konfiguracijo
- [ ] Omrežni dostop je pravilno omejen
- [ ] Nadzor in beleženje sta omogočena

## Modul 5: Pretvorba vaše lastne AI aplikacije

### Korak 5.1: Ocena

**Pred pretvorbo aplikacije** odgovorite na naslednja vprašanja:

1. **Arhitektura aplikacije:**
   - Katere AI storitve uporablja vaša aplikacija?
   - Kateri računalniški viri so potrebni?
   - Ali potrebuje podatkovno bazo?
   - Kakšne so odvisnosti med storitvami?

2. **Varnostne zahteve:**
   - Katere občutljive podatke vaša aplikacija obravnava?
   - Katere zahteve glede skladnosti imate?
   - Ali potrebujete zasebno omrežje?

3. **Zahteve za skaliranje:**
   - Kakšna je pričakovana obremenitev?
   - Ali potrebujete samodejno skaliranje?
   - Ali so regionalne zahteve?

### Korak 5.2: Ustvarite svoj AZD vzorec

**Sledite temu vzorcu za pretvorbo vaše aplikacije:**

1. **Ustvarite osnovno strukturo:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializirajte AZD predlogo
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

3. **Ustvarite infrastrukturne vzorce:**

**infra/main.bicep** - glavni vzorec:
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

### **Laboratorijska vaja 5.1: Izziv ustvarjanja vzorca**

**Izziv**: Ustvarite AZD vzorec za AI aplikacijo za obdelavo dokumentov.

**Zahteve:**
- Microsoft Foundry Models za analizo vsebine
- Document Intelligence za OCR
- Shramba za nalaganje dokumentov
- Funkcijska aplikacija za obdelavo logike
- Spletna aplikacija za uporabniški vmesnik

**Bonus točke:**
- Dodajte ustrezno obravnavo napak
- Vključite oceno stroškov
- Nastavite nadzorne nadzorne plošče

## Modul 6: Odpravljanje pogostih težav

### Pogoste težave pri namestitvi

#### Težava 1: Presežen kvota za OpenAI storitev
**Simptomi:** Namestitev ne uspe zaradi napake kvote
**Rešitve:**
```bash
# Preveri trenutne kvote
az cognitiveservices usage list --location eastus

# Zahtevaj povečanje kvote ali poizkusi z drugo regijo
azd env set AZURE_LOCATION westus2
azd up
```

#### Težava 2: Model ni na voljo v regiji
**Simptomi:** AI odgovori ne delujejo ali napake pri namestitvi modela
**Rešitve:**
```bash
# Preveri razpoložljivost modela po regijah
az cognitiveservices model list --location eastus

# Posodobi na razpoložljiv model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Težava 3: Težave z dovoljenji
**Simptomi:** 403 Zavrnjeno napake pri klicanju AI storitev
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
**Koraki za raziskovanje:**
1. Preverite metrike uspešnosti v Application Insights
2. Preglejte metrike OpenAI storitve v Azure portalu
3. Preverite omrežno povezljivost in zakasnitev

**Rešitve:**
- Uvedite predpomnjenje za pogoste poizvedbe
- Uporabite ustrezen OpenAI model za vaš primer uporabe
- Razmislite o berljivih kopijah za scenarije z veliko obremenitvijo

### **Laboratorijska vaja 6.1: Izziv odpravljanja napak**

**Scenarij**: Namestitev je uspela, vendar aplikacija vrača napake 500.

**Naloge odpravljanja napak:**
1. Preglejte dnevnike aplikacije
2. Preverite povezljivost storitev
3. Preizkusite avtentikacijo
4. Preglejte konfiguracijo

**Orodja za uporabo:**
- `azd show` za pregled namestitve
- Azure portal za podrobne dnevnike storitev
- Application Insights za telemetrijo aplikacije

## Modul 7: Nadzor in optimizacija

### Korak 7.1: Nastavitev celovitega nadzora

1. **Ustvarite prilagojene nadzorne plošče:**

Pomaknite se v Azure portal in ustvarite nadzorno ploščo z:
- Število in zakasnitev zahtev OpenAI
- Stopnja napak aplikacije
- Uporaba virov
- Spremljanje stroškov

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

2. **Uvedite stroškovne kontrole:**
- Nastavite opozorila proračuna
- Uporabite politike samodejnega skaliranja
- Uvedite predpomnjenje zahtev
- Spremljajte uporabo žetonov za OpenAI

### **Laboratorijska vaja 7.1: Optimizacija zmogljivosti**

**Naloga**: Optimizirajte vašo AI aplikacijo tako za zmogljivost kot stroške.

**Metrične izboljšave:**
- Zmanjšajte povprečni čas odziva za 20%
- Zmanjšajte mesečne stroške za 15%
- Ohranjajte 99,9% razpoložljivost

**Strategije za poskus:**
- Uvedite predpomnjenje odzivov
- Optimizirajte spodbujevalnike za učinkovitost žetonov
- Uporabite ustrezne računalniške SKU-je
- Nastavite pravilno samodejno skaliranje

## Zaključni izziv: Celovita implementacija

### Scenarij izziva

Vaša naloga je ustvariti proizvodni AI poganjan klepetalni robot za podporo strankam z naslednjimi zahtevami:

**Funkcionalne zahteve:**
- Spletni vmesnik za interakcijo s strankami
- Integracija z Microsoft Foundry Models za odgovore
- Iskanje po dokumentih z uporabo Azure AI Search
- Integracija z obstoječo bazo podatkov strank
- Podpora za več jezikov

**Ne-funkcionalne zahteve:**
- Podpora za 1000 sočasnih uporabnikov
- 99,9% garancija razpoložljivosti SLA
- Skladnost s SOC 2
- Stroški pod 500 $/mesec
- Namestitev v več okoljih (dev, staging, prod)

### Koraki izvedbe

1. **Načrtujte arhitekturo**
2. **Ustvarite AZD vzorec**
3. **Izvedite varnostne ukrepe**
4. **Nastavite nadzor in opozorila**
5. **Ustvarite cevi za namestitev**
6. **Dokumentirajte rešitev**

### Merila za ocenjevanje

- ✅ **Funkcionalnost**: Ali izpolnjuje vse zahteve?
- ✅ **Varnost**: So najboljše prakse implementirane?
- ✅ **Razširljivost**: Ali lahko prenese obremenitev?
- ✅ **Vzdržljivost**: Ali sta koda in infrastruktura dobro organizirani?
- ✅ **Stroški**: Ali ostaja znotraj proračuna?

## Dodatni viri

### Microsoft dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija Microsoft Foundry Models storitve](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacija Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Vzorci
- [Microsoft Foundry Models Chat Aplikacija](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Hitri začetek OpenAI Chat Aplikacije](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Skupnostni viri
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Potrdilo o zaključku

Čestitamo! Zaključili ste delavnico AI. Zdaj bi morali biti sposobni:

- ✅ Pretvoriti obstoječe AI aplikacije v AZD predloge
- ✅ Namestiti produkcijsko pripravljene AI aplikacije
- ✅ Izvesti varnostne najboljše prakse za AI obremenitve
- ✅ Nadzorovati in optimizirati delovanje AI aplikacij
- ✅ Reševati pogoste težave z nameščanjem

### Naslednji koraki
1. Uporabite te vzorce v svojih AI projektih
2. Prispevajte predloge skupnosti nazaj
3. Pridružite se Microsoft Foundry Discord za stalno podporo
4. Raziščite napredne teme, kot so nameščanja v več regijah

---

**Povratne informacije delavnice**: Pomagajte nam izboljšati to delavnico tako, da delite svoje izkušnje v [kanalu #Azure na Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - AI-prvo razvoj
- **⬅️ Prejšnje**: [Nameščanje AI modela](ai-model-deployment.md)
- **➡️ Naslednje**: [Najboljše prakse produkcijske AI](production-ai-practices.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se naši skupnosti za podporo in razprave o AZD in nameščanju AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->