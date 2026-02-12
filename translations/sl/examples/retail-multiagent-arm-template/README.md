# Rešitev za več agentov v maloprodaji - Predloga infrastrukture

**Poglavje 5: Paket za produkcijsko uvedbo**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Povezano poglavje**: [Poglavje 5: Rešitve z več agenti AI](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Vodnik scenarija**: [Celotna arhitektura](../retail-scenario.md)
- **🎯 Hitro uvajanje**: [Uvajanje z enim klikom](../../../../examples/retail-multiagent-arm-template)

> **⚠️ SAMO PREDLOGA INFRASTRUKTURE**  
> Ta ARM predloga uvaja **Azure vire** za sistem z več agenti.  
>  
> **Kaj se uvede (15-25 minut):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, vektorske predstavitve v treh regijah)
> - ✅ Storitev AI Search (prazna, pripravljena za ustvarjanje indeksov)
> - ✅ Container Apps (slike z rezerviranimi mesti, pripravljene za vašo kodo)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **Kaj NI vključeno (zahteva razvoj):**
> - ❌ Koda za implementacijo agentov (Agent za stranke, Agent za zaloge)
> - ❌ Logika usmerjanja in API končne točke
> - ❌ Uporabniški vmesnik za klepet na sprednji strani
> - ❌ Sheme iskalnih indeksov in podatkovni tokovi
> - ❌ **Ocenjeni razvojni napor: 80-120 ur**
>  
> **Uporabite to predlogo, če:**
> - ✅ Želite pripraviti Azure infrastrukturo za projekt z več agenti
> - ✅ Načrtujete ločen razvoj implementacije agentov
> - ✅ Potrebujete osnovo za infrastrukturo, pripravljeno za produkcijo
>  
> **Ne uporabljajte, če:**
> - ❌ Pričakujete takojšen delujoč demo z več agenti
> - ❌ Iščete popolne primere aplikacijske kode

## Pregled

Ta mapa vsebuje celovito predlogo Azure Resource Manager (ARM) za uvajanje **osnovne infrastrukture** sistema za podporo strankam z več agenti. Predloga pripravi vse potrebne Azure storitve, pravilno konfigurirane in medsebojno povezane, pripravljene za vaš razvoj aplikacij.

**Po uvedbi boste imeli:** Infrastrukturo Azure, pripravljeno za produkcijo  
**Za dokončanje sistema potrebujete:** Kodo agentov, uporabniški vmesnik in konfiguracijo podatkov (glejte [Vodnik arhitekture](../retail-scenario.md))

## 🎯 Kaj se uvede

### Osnovna infrastruktura (status po uvedbi)

✅ **Azure OpenAI storitve** (Pripravljene za API klice)
  - Primarna regija: GPT-4o uvedba (zmogljivost 20K TPM)
  - Sekundarna regija: GPT-4o-mini uvedba (zmogljivost 10K TPM)
  - Tretja regija: Model za vektorske predstavitve (zmogljivost 30K TPM)
  - Evalvacija regije: GPT-4o model za ocenjevanje (zmogljivost 15K TPM)
  - **Status:** Popolnoma funkcionalno - takoj pripravljeno za API klice

✅ **Azure AI Search** (Prazno - pripravljeno za konfiguracijo)
  - Omogočene zmogljivosti vektorskega iskanja
  - Standardna stopnja z 1 particijo, 1 repliko
  - **Status:** Storitev deluje, vendar zahteva ustvarjanje indeksov
  - **Potrebno ukrepanje:** Ustvarite iskalni indeks z vašo shemo

✅ **Azure Storage Account** (Prazno - pripravljeno za nalaganje)
  - Posode za blob: `documents`, `uploads`
  - Varna konfiguracija (samo HTTPS, brez javnega dostopa)
  - **Status:** Pripravljeno za sprejemanje datotek
  - **Potrebno ukrepanje:** Naložite podatke o izdelkih in dokumente

⚠️ **Container Apps Environment** (Uvedene slike z rezerviranimi mesti)
  - Aplikacija za usmerjanje agentov (privzeta slika nginx)
  - Aplikacija na sprednji strani (privzeta slika nginx)
  - Samodejno skaliranje konfigurirano (0-10 primerkov)
  - **Status:** Delujoče posode z rezerviranimi mesti
  - **Potrebno ukrepanje:** Zgradite in uvedite aplikacije za agente

✅ **Azure Cosmos DB** (Prazno - pripravljeno za podatke)
  - Predkonfigurirana baza podatkov in posoda
  - Optimizirano za operacije z nizko zakasnitvijo
  - TTL omogočen za samodejno čiščenje
  - **Status:** Pripravljeno za shranjevanje zgodovine klepeta

✅ **Azure Key Vault** (Neobvezno - pripravljeno za shranjevanje skrivnosti)
  - Omogočeno mehko brisanje
  - RBAC konfiguriran za upravljane identitete
  - **Status:** Pripravljeno za shranjevanje API ključev in povezovalnih nizov

✅ **Application Insights** (Neobvezno - aktivno spremljanje)
  - Povezano z delovnim prostorom Log Analytics
  - Konfigurirane prilagojene metrike in opozorila
  - **Status:** Pripravljeno za sprejemanje telemetrije iz vaših aplikacij

✅ **Document Intelligence** (Pripravljeno za API klice)
  - S0 stopnja za produkcijske obremenitve
  - **Status:** Pripravljeno za obdelavo naloženih dokumentov

✅ **Bing Search API** (Pripravljeno za API klice)
  - S1 stopnja za iskanje v realnem času
  - **Status:** Pripravljeno za spletne iskalne poizvedbe

### Načini uvajanja

| Način | Zmogljivost OpenAI | Primerki posod | Stopnja iskanja | Redundanca shranjevanja | Najbolj primerno za |
|-------|--------------------|----------------|------------------|-------------------------|---------------------|
| **Minimalno** | 10K-20K TPM | 0-2 replike | Osnovno | LRS (Lokalno) | Razvoj/testiranje, učenje, dokaz koncepta |
| **Standardno** | 30K-60K TPM | 2-5 replike | Standardno | ZRS (Cona) | Produkcija, zmerni promet (<10K uporabnikov) |
| **Premium** | 80K-150K TPM | 5-10 replike, redundanca po conah | Premium | GRS (Geo) | Podjetje, visok promet (>10K uporabnikov), 99,99% SLA |

**Vpliv na stroške:**
- **Minimalno → Standardno:** ~4x povečanje stroškov ($100-370/mesec → $420-1,450/mesec)
- **Standardno → Premium:** ~3x povečanje stroškov ($420-1,450/mesec → $1,150-3,500/mesec)
- **Izberite glede na:** Pričakovano obremenitev, zahteve SLA, proračunske omejitve

**Načrtovanje zmogljivosti:**
- **TPM (žetoni na minuto):** Skupno število vseh uvedb modelov
- **Primerki posod:** Obseg samodejnega skaliranja (min-max replike)
- **Stopnja iskanja:** Vpliva na zmogljivost poizvedb in omejitve velikosti indeksov

## 📋 Predpogoji

### Zahtevana orodja
1. **Azure CLI** (različica 2.50.0 ali novejša)
   ```bash
   az --version  # Preveri različico
   az login      # Avtenticiraj
   ```

2. **Aktivna naročnina Azure** z dostopom lastnika ali sodelavca
   ```bash
   az account show  # Preveri naročnino
   ```

### Zahtevane kvote Azure

Pred uvedbo preverite zadostne kvote v ciljnih regijah:

```bash
# Preverite razpoložljivost Azure OpenAI v vaši regiji
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Preverite kvoto OpenAI (primer za gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Preverite kvoto za Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimalne zahtevane kvote:**
- **Azure OpenAI:** 3-4 uvedbe modelov v regijah
  - GPT-4o: 20K TPM (žetoni na minuto)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Opomba:** GPT-4o je lahko na čakalni listi v nekaterih regijah - preverite [razpoložljivost modelov](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Upravljano okolje + 2-10 primerkov posod
- **AI Search:** Standardna stopnja (osnovna ni primerna za vektorsko iskanje)
- **Cosmos DB:** Standardna zagotovljena prepustnost

**Če kvote niso zadostne:**
1. Pojdite na Azure Portal → Kvote → Zahtevajte povečanje
2. Ali uporabite Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Razmislite o alternativnih regijah z razpoložljivostjo

## 🚀 Hitro uvajanje

### Možnost 1: Uporaba Azure CLI

```bash
# Klonirajte ali prenesite predložne datoteke
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Naredite skripto za uvajanje izvedljivo
chmod +x deploy.sh

# Uvedite z privzetimi nastavitvami
./deploy.sh -g myResourceGroup

# Uvedite za produkcijo s premium funkcijami
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Možnost 2: Uporaba Azure Portal

[![Uvedi v Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Možnost 3: Neposredno z uporabo Azure CLI

```bash
# Ustvari skupino virov
az group create --name myResourceGroup --location eastus2

# Namesti predlogo
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Časovni okvir uvajanja

### Kaj pričakovati

| Faza | Trajanje | Kaj se zgodi |
|------|----------|--------------||
| **Validacija predloge** | 30-60 sekund | Azure preveri sintakso ARM predloge in parametre |
| **Nastavitev skupine virov** | 10-20 sekund | Ustvari skupino virov (če je potrebno) |
| **Uvajanje OpenAI** | 5-8 minut | Ustvari 3-4 OpenAI račune in uvede modele |
| **Container Apps** | 3-5 minut | Ustvari okolje in uvede posode z rezerviranimi mesti |
| **Iskanje in shranjevanje** | 2-4 minute | Pripravi storitev AI Search in račune za shranjevanje |
| **Cosmos DB** | 2-3 minute | Ustvari bazo podatkov in konfigurira posode |
| **Nastavitev spremljanja** | 2-3 minute | Nastavi Application Insights in Log Analytics |
| **Konfiguracija RBAC** | 1-2 minuti | Konfigurira upravljane identitete in dovoljenja |
| **Skupno uvajanje** | **15-25 minut** | Popolna infrastruktura pripravljena |

**Po uvedbi:**
- ✅ **Infrastruktura pripravljena:** Vsi Azure viri so uvedeni in delujejo
- ⏱️ **Razvoj aplikacij:** 80-120 ur (vaša odgovornost)
- ⏱️ **Konfiguracija indeksov:** 15-30 minut (zahteva vašo shemo)
- ⏱️ **Nalaganje podatkov:** Odvisno od velikosti nabora podatkov
- ⏱️ **Testiranje in validacija:** 2-4 ure

---

## ✅ Preverite uspešnost uvajanja

### Korak 1: Preverite uvedbo virov (2 minuti)

```bash
# Preverite, ali so vsi viri uspešno uvedeni
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Pričakovano:** Prazna tabela (vsi viri prikazujejo status "Uspešno")

### Korak 2: Preverite uvedbe Azure OpenAI (3 minute)

```bash
# Naštej vse OpenAI račune
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Preveri namestitve modelov za primarno regijo
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Pričakovano:** 
- 3-4 OpenAI računi (primarna, sekundarna, tretja, evalvacija regije)
- 1-2 uvedbe modelov na račun (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Korak 3: Testirajte končne točke infrastrukture (5 minut)

```bash
# Pridobi URL-je aplikacije Container
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Preizkusi končno točko usmerjevalnika (odzvala se bo nadomestna slika)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Pričakovano:** 
- Container Apps prikazujejo status "Deluje"
- Rezervirani nginx odgovarja s HTTP 200 ali 404 (še ni aplikacijske kode)

### Korak 4: Preverite dostop do Azure OpenAI API (3 minute)

```bash
# Pridobi OpenAI končno točko in ključ
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Preizkusi GPT-4o uvajanje
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Pričakovano:** JSON odgovor z dokončanjem klepeta (potrjuje funkcionalnost OpenAI)

### Kaj deluje in kaj ne

**✅ Deluje po uvedbi:**
- Azure OpenAI modeli uvedeni in sprejemajo API klice
- Storitev AI Search deluje (prazna, brez indeksov)
- Container Apps delujejo (rezervirane slike nginx)
- Računi za shranjevanje dostopni in pripravljeni za nalaganje
- Cosmos DB pripravljen za podatkovne operacije
- Application Insights zbira telemetrijo infrastrukture
- Key Vault pripravljen za shranjevanje skrivnosti

**❌ Še ne deluje (zahteva razvoj):**
- Končne točke agentov (ni uvedene aplikacijske kode)
- Funkcionalnost klepeta (zahteva sprednji + zadnji del implementacije)
- Iskalne poizvedbe (ni ustvarjenega iskalnega indeksa)
- Tok obdelave dokumentov (ni naloženih podatkov)
- Prilagojena telemetrija (zahteva instrumentacijo aplikacije)

**Naslednji koraki:** Glejte [Konfiguracija po uvedbi](../../../../examples/retail-multiagent-arm-template) za razvoj in uvedbo vaše aplikacije

---

## ⚙️ Možnosti konfiguracije

### Parametri predloge

| Parameter | Tip | Privzeto | Opis |
|-----------|------|---------|------|
| `projectName` | string | "retail" | Predpona za vsa imena virov |
| `location` | string | Lokacija skupine virov | Primarna regija uvajanja |
| `secondaryLocation` | string | "westus2" | Sekundarna regija za uvajanje v več regijah |
| `tertiaryLocation` | string | "francecentral" | Regija za model vektorskih predstavitev |
| `environmentName` | string | "dev" | Oznaka okolja (razvoj/testiranje/produkcija) |
| `deploymentMode` | string | "standard" | Konfiguracija uvajanja (minimalno/standardno/premium) |
| `enableMultiRegion` | bool | true | Omogoči uvajanje v več regijah |
| `enableMonitoring` | bool | true | Omogoči Application Insights in beleženje |
| `enableSecurity` | bool | true | Omogoči Key Vault in izboljšano varnost |

### Prilagajanje parametrov

Uredite `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Pregled arhitekture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Uporaba skripta za uvajanje

Skript `deploy.sh` omogoča interaktivno izkušnjo uvajanja:

```bash
# Prikaži pomoč
./deploy.sh --help

# Osnovna namestitev
./deploy.sh -g myResourceGroup

# Napredna namestitev s prilagojenimi nastavitvami
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Razvojna namestitev brez več regij
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funkcije skripta

- ✅ **Validacija predpogojev** (Azure CLI, status prijave, datoteke predloge)
- ✅ **Upravljanje skupine virov** (ustvari, če ne obstaja)
- ✅ **Validacija predloge** pred uvajanjem
- ✅ **Spremljanje napredka** z barvnim izpisom
- ✅ **Prikaz rezultatov uvajanja**
- ✅ **Vodnik po uvedbi**

## 📊 Spremljanje uvajanja

### Preverite status uvajanja

```bash
# Seznam namestitev
az deployment group list --resource-group myResourceGroup --output table

# Pridobite podrobnosti o namestitvi
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Spremljajte napredek namestitve
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Rezultati uvajanja

Po uspešni uvedbi so na voljo naslednji rezultati:

- **URL sprednjega dela:** Javni naslov za spletni vmesnik
- **URL usmerjevalnika:** API naslov za usmerjevalnik agentov
- **OpenAI končne točke:** Primarne in sekundarne končne točke storitve OpenAI
- **Storitev iskanja:** Naslov storitve Azure AI Search
- **Račun za shranjevanje:** Ime računa za shranjevanje dokumentov
- **Key Vault:** Ime Key Vault (če je omogočeno)
- **Application Insights:** Ime storitve za spremljanje (če je omogočeno)

## 🔧 Po uvedbi: Naslednji koraki
> **📝 Pomembno:** Infrastruktura je nameščena, vendar morate razviti in namestiti aplikacijsko kodo.

### Faza 1: Razvoj aplikacij agentov (Vaša odgovornost)

ARM predloga ustvari **prazne aplikacije Container Apps** s predhodno nameščenimi slikami nginx. Vaša naloga je:

**Potrebni razvojni koraki:**
1. **Implementacija agentov** (30-40 ur)
   - Agent za podporo strankam z integracijo GPT-4o
   - Agent za inventar z integracijo GPT-4o-mini
   - Logika usmerjanja agentov

2. **Razvoj uporabniškega vmesnika** (20-30 ur)
   - UI za klepet (React/Vue/Angular)
   - Funkcionalnost za nalaganje datotek
   - Prikaz in formatiranje odgovorov

3. **Zaledne storitve** (12-16 ur)
   - FastAPI ali Express router
   - Middleware za avtentikacijo
   - Integracija telemetrije

**Glej:** [Vodnik za arhitekturo](../retail-scenario.md) za podrobne vzorce implementacije in primere kode

### Faza 2: Konfiguracija AI iskalnega indeksa (15-30 minut)

Ustvarite iskalni indeks, ki ustreza vašemu podatkovnemu modelu:

```bash
# Pridobite podrobnosti storitve iskanja
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Ustvarite indeks s svojo shemo (primer)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Viri:**
- [Oblikovanje sheme AI iskalnega indeksa](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfiguracija iskanja z vektorji](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Faza 3: Nalaganje vaših podatkov (čas se razlikuje)

Ko imate podatke o izdelkih in dokumente:

```bash
# Pridobite podrobnosti o računu za shranjevanje
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Naložite svoje dokumente
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Primer: Naložite eno datoteko
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Faza 4: Razvoj in namestitev vaših aplikacij (8-12 ur)

Ko ste razvili kodo za agente:

```bash
# 1. Ustvari Azure Container Registry (če je potrebno)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Zgradi in potisni sliko agent routerja
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Zgradi in potisni sliko frontend-a
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Posodobi Container Apps s svojimi slikami
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfiguriraj okoljske spremenljivke
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Faza 5: Testiranje vaše aplikacije (2-4 ure)

```bash
# Pridobite URL vaše aplikacije
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Preizkusite končno točko agenta (ko je vaša koda nameščena)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Preverite dnevniške zapise aplikacije
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Viri za implementacijo

**Arhitektura in dizajn:**
- 📖 [Celoten vodnik za arhitekturo](../retail-scenario.md) - Podrobni vzorci implementacije
- 📖 [Vzorci dizajna za več agentov](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Primeri kode:**
- 🔗 [Primer klepeta Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Vzorec RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Okvir za agente (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orkestracija agentov (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Pogovori med več agenti

**Ocenjeni skupni čas:**
- Namestitev infrastrukture: 15-25 minut (✅ Končano)
- Razvoj aplikacij: 80-120 ur (🔨 Vaše delo)
- Testiranje in optimizacija: 15-25 ur (🔨 Vaše delo)

## 🛠️ Odpravljanje težav

### Pogoste težave

#### 1. Prekoračena kvota Azure OpenAI

```bash
# Preveri trenutno uporabo kvote
az cognitiveservices usage list --location eastus2

# Zahtevaj povečanje kvote
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Napaka pri namestitvi aplikacij Container Apps

```bash
# Preveri dnevnike aplikacije vsebnika
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Znova zaženi aplikacijo vsebnika
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicializacija iskalne storitve

```bash
# Preverite stanje storitve iskanja
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Preizkusite povezljivost storitve iskanja
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validacija namestitve

```bash
# Preverite, ali so vsi viri ustvarjeni
az resource list \
  --resource-group myResourceGroup \
  --output table

# Preverite stanje virov
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Varnostni vidiki

### Upravljanje ključev
- Vsi skrivni podatki so shranjeni v Azure Key Vault (če je omogočeno)
- Aplikacije Container Apps uporabljajo upravljano identiteto za avtentikacijo
- Računi za shranjevanje imajo varne privzete nastavitve (samo HTTPS, brez javnega dostopa do blobov)

### Omrežna varnost
- Aplikacije Container Apps uporabljajo interno omrežje, kjer je to mogoče
- Iskalna storitev je konfigurirana z možnostjo zasebnih končnih točk
- Cosmos DB je konfiguriran z minimalno potrebnimi dovoljenji

### Konfiguracija RBAC
```bash
# Dodelite potrebne vloge za upravljano identiteto
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimizacija stroškov

### Ocenjeni stroški (mesečno, USD)

| Način | OpenAI | Container Apps | Search | Storage | Skupaj ocena |
|-------|--------|----------------|--------|---------|--------------|
| Minimalno | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardno | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Spremljanje stroškov

```bash
# Nastavite opozorila o proračunu
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Posodobitve in vzdrževanje

### Posodobitve predloge
- Upravljajte različice datotek ARM predloge
- Najprej preizkusite spremembe v razvojnem okolju
- Za posodobitve uporabite način inkrementalne namestitve

### Posodobitve virov
```bash
# Posodobi z novimi parametri
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Varnostno kopiranje in obnovitev
- Samodejno varnostno kopiranje Cosmos DB omogočeno
- Mehka izbris Key Vault omogočena
- Revizije aplikacij Container Apps so ohranjene za povrnitev

## 📞 Podpora

- **Težave s predlogo**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Podpora Azure**: [Portal za podporo Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Skupnost**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Pripravljeni na namestitev vaše rešitve z več agenti?**

Začnite z: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->