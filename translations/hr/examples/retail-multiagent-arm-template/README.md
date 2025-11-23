<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-23T18:48:22+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "hr"
}
-->
# Maloprodajna rješenja s više agenata - Infrastrukturni predložak

**Poglavlje 5: Paket za produkcijsko postavljanje**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Povezano poglavlje**: [Poglavlje 5: AI rješenja s više agenata](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Vodič scenarija**: [Kompletna arhitektura](../retail-scenario.md)
- **🎯 Brzo postavljanje**: [Jednostavno postavljanje](../../../../examples/retail-multiagent-arm-template)

> **⚠️ SAMO INFRASTRUKTURNI PREDLOŽAK**  
> Ovaj ARM predložak postavlja **Azure resurse** za sustav s više agenata.  
>  
> **Što se postavlja (15-25 minuta):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, ugrađeni modeli u 3 regije)
> - ✅ AI pretraživačka usluga (prazna, spremna za kreiranje indeksa)
> - ✅ Container Apps (slikovne oznake, spremne za vaš kod)
> - ✅ Pohrana, Cosmos DB, Key Vault, Application Insights
>  
> **Što NIJE uključeno (zahtijeva razvoj):**
> - ❌ Kod za implementaciju agenata (Agent za korisnike, Agent za inventar)
> - ❌ Logika usmjeravanja i API krajnje točke
> - ❌ Korisničko sučelje za chat
> - ❌ Sheme pretraživačkih indeksa i podatkovni cjevovodi
> - ❌ **Procijenjeni razvojni napor: 80-120 sati**
>  
> **Koristite ovaj predložak ako:**
> - ✅ Želite postaviti Azure infrastrukturu za projekt s više agenata
> - ✅ Planirate zasebno razviti implementaciju agenata
> - ✅ Trebate osnovnu infrastrukturu spremnu za produkciju
>  
> **Nemojte koristiti ako:**
> - ❌ Očekujete odmah funkcionalan demo sustava s više agenata
> - ❌ Tražite kompletne primjere aplikacijskog koda

## Pregled

Ovaj direktorij sadrži sveobuhvatan Azure Resource Manager (ARM) predložak za postavljanje **temelja infrastrukture** sustava za korisničku podršku s više agenata. Predložak postavlja sve potrebne Azure usluge, pravilno konfigurirane i međusobno povezane, spremne za razvoj vaše aplikacije.

**Nakon postavljanja imat ćete:** Infrastrukturu Azure spremnu za produkciju  
**Za dovršetak sustava trebate:** Kod agenata, korisničko sučelje i konfiguraciju podataka (vidi [Vodič za arhitekturu](../retail-scenario.md))

## 🎯 Što se postavlja

### Osnovna infrastruktura (status nakon postavljanja)

✅ **Azure OpenAI usluge** (Spremne za API pozive)
  - Primarna regija: GPT-4o postavljanje (kapacitet 20K TPM)
  - Sekundarna regija: GPT-4o-mini postavljanje (kapacitet 10K TPM)
  - Tercijarna regija: Model za tekstualne ugrađene elemente (kapacitet 30K TPM)
  - Regija za evaluaciju: GPT-4o model za ocjenjivanje (kapacitet 15K TPM)
  - **Status:** Potpuno funkcionalno - API pozivi mogu se odmah izvršavati

✅ **Azure AI pretraživačka usluga** (Prazna - spremna za konfiguraciju)
  - Omogućene mogućnosti vektorskog pretraživanja
  - Standardni nivo s 1 particijom, 1 replikom
  - **Status:** Usluga radi, ali zahtijeva kreiranje indeksa
  - **Potrebna akcija:** Kreirajte pretraživački indeks prema vašoj shemi

✅ **Azure Storage Account** (Prazna - spremna za prijenos)
  - Blob spremnici: `documents`, `uploads`
  - Sigurna konfiguracija (samo HTTPS, bez javnog pristupa)
  - **Status:** Spremna za primanje datoteka
  - **Potrebna akcija:** Prenesite podatke o proizvodima i dokumente

⚠️ **Okruženje za Container Apps** (Postavljene slikovne oznake)
  - Aplikacija za usmjeravanje agenata (zadana nginx slika)
  - Frontend aplikacija (zadana nginx slika)
  - Automatsko skaliranje konfigurirano (0-10 instanci)
  - **Status:** Pokrenuti spremnici s oznakama
  - **Potrebna akcija:** Izgradite i postavite aplikacije za agente

✅ **Azure Cosmos DB** (Prazna - spremna za podatke)
  - Baza podataka i spremnik unaprijed konfigurirani
  - Optimizirano za operacije s niskom latencijom
  - Omogućeno automatsko čišćenje putem TTL-a
  - **Status:** Spremna za pohranu povijesti razgovora

✅ **Azure Key Vault** (Opcionalno - spremna za tajne)
  - Omogućeno mekano brisanje
  - RBAC konfiguriran za upravljane identitete
  - **Status:** Spremna za pohranu API ključeva i nizova za povezivanje

✅ **Application Insights** (Opcionalno - aktivno praćenje)
  - Povezano s Log Analytics radnim prostorom
  - Konfigurirane prilagođene metrike i upozorenja
  - **Status:** Spremna za primanje telemetrije iz vaših aplikacija

✅ **Document Intelligence** (Spremna za API pozive)
  - S0 nivo za produkcijske radne opterećenja
  - **Status:** Spremna za obradu prenesenih dokumenata

✅ **Bing Search API** (Spremna za API pozive)
  - S1 nivo za pretraživanja u stvarnom vremenu
  - **Status:** Spremna za web pretraživanja

### Načini postavljanja

| Način | Kapacitet OpenAI | Instance spremnika | Nivo pretraživanja | Redundancija pohrane | Najbolje za |
|-------|------------------|--------------------|--------------------|---------------------|-------------|
| **Minimalno** | 10K-20K TPM | 0-2 replike | Osnovno | LRS (Lokalno) | Razvoj/testiranje, učenje, dokaz koncepta |
| **Standardno** | 30K-60K TPM | 2-5 replika | Standardno | ZRS (Zona) | Produkcija, umjeren promet (<10K korisnika) |
| **Premium** | 80K-150K TPM | 5-10 replika, redundancija zona | Premium | GRS (Geo) | Poduzeća, veliki promet (>10K korisnika), 99.99% SLA |

**Utjecaj na troškove:**
- **Minimalno → Standardno:** ~4x povećanje troškova ($100-370/mj → $420-1,450/mj)
- **Standardno → Premium:** ~3x povećanje troškova ($420-1,450/mj → $1,150-3,500/mj)
- **Odaberite na temelju:** Očekivanog opterećenja, SLA zahtjeva, ograničenja proračuna

**Planiranje kapaciteta:**
- **TPM (Tokeni po minuti):** Ukupno za sva postavljanja modela
- **Instance spremnika:** Raspon automatskog skaliranja (min-max replike)
- **Nivo pretraživanja:** Utječe na performanse upita i ograničenja veličine indeksa

## 📋 Preduvjeti

### Potrebni alati
1. **Azure CLI** (verzija 2.50.0 ili novija)
   ```bash
   az --version  # Provjeri verziju
   az login      # Autentificiraj
   ```

2. **Aktivna Azure pretplata** s pristupom vlasnika ili suradnika
   ```bash
   az account show  # Provjeri pretplatu
   ```

### Potrebne Azure kvote

Prije postavljanja provjerite dovoljne kvote u ciljnim regijama:

```bash
# Provjerite dostupnost Azure OpenAI u vašoj regiji
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Provjerite OpenAI kvotu (primjer za gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Provjerite kvotu za Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimalno potrebne kvote:**
- **Azure OpenAI:** 3-4 postavljanja modela u regijama
  - GPT-4o: 20K TPM (Tokeni po minuti)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Napomena:** GPT-4o može biti na listi čekanja u nekim regijama - provjerite [dostupnost modela](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Upravljano okruženje + 2-10 instanci spremnika
- **AI pretraživanje:** Standardni nivo (Osnovni nije dovoljan za vektorsko pretraživanje)
- **Cosmos DB:** Standardni osigurani kapacitet

**Ako kvote nisu dovoljne:**
1. Idite na Azure Portal → Kvote → Zatražite povećanje
2. Ili koristite Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Razmotrite alternativne regije s dostupnošću

## 🚀 Brzo postavljanje

### Opcija 1: Korištenje Azure CLI-a

```bash
# Klonirajte ili preuzmite datoteke predloška
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Napravite skriptu za implementaciju izvršivom
chmod +x deploy.sh

# Implementirajte s zadanim postavkama
./deploy.sh -g myResourceGroup

# Implementirajte za produkciju s premium značajkama
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opcija 2: Korištenje Azure Portala

[![Postavi na Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opcija 3: Izravno korištenje Azure CLI-a

```bash
# Kreiraj grupu resursa
az group create --name myResourceGroup --location eastus2

# Implementiraj predložak
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Vremenska crta postavljanja

### Što očekivati

| Faza | Trajanje | Što se događa |
|------|----------|--------------||
| **Validacija predloška** | 30-60 sekundi | Azure provjerava sintaksu ARM predloška i parametre |
| **Postavljanje grupe resursa** | 10-20 sekundi | Kreira grupu resursa (ako je potrebno) |
| **Postavljanje OpenAI-a** | 5-8 minuta | Kreira 3-4 OpenAI računa i postavlja modele |
| **Container Apps** | 3-5 minuta | Kreira okruženje i postavlja spremnike s oznakama |
| **Pretraživanje i pohrana** | 2-4 minute | Postavlja AI pretraživačku uslugu i račune za pohranu |
| **Cosmos DB** | 2-3 minute | Kreira bazu podataka i konfigurira spremnike |
| **Postavljanje praćenja** | 2-3 minute | Postavlja Application Insights i Log Analytics |
| **RBAC konfiguracija** | 1-2 minute | Konfigurira upravljane identitete i dozvole |
| **Ukupno postavljanje** | **15-25 minuta** | Kompletna infrastruktura spremna |

**Nakon postavljanja:**
- ✅ **Infrastruktura spremna:** Sve Azure usluge postavljene i pokrenute
- ⏱️ **Razvoj aplikacije:** 80-120 sati (vaša odgovornost)
- ⏱️ **Konfiguracija indeksa:** 15-30 minuta (zahtijeva vašu shemu)
- ⏱️ **Prijenos podataka:** Ovisi o veličini skupa podataka
- ⏱️ **Testiranje i validacija:** 2-4 sata

---

## ✅ Provjera uspješnosti postavljanja

### Korak 1: Provjerite postavljanje resursa (2 minute)

```bash
# Provjerite jesu li svi resursi uspješno implementirani
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Očekivano:** Prazna tablica (svi resursi prikazuju status "Succeeded")

### Korak 2: Provjerite Azure OpenAI postavljanja (3 minute)

```bash
# Popis svih OpenAI računa
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Provjeri implementacije modela za primarnu regiju
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Očekivano:** 
- 3-4 OpenAI računa (primarna, sekundarna, tercijarna, regija za evaluaciju)
- 1-2 postavljanja modela po računu (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Korak 3: Testirajte krajnje točke infrastrukture (5 minuta)

```bash
# Dohvati URL-ove aplikacije Container
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testiraj krajnju točku routera (odgovorit će rezervirana slika)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Očekivano:** 
- Container Apps prikazuju status "Running"
- Zadani nginx odgovara s HTTP 200 ili 404 (još nema aplikacijskog koda)

### Korak 4: Provjerite pristup Azure OpenAI API-ju (3 minute)

```bash
# Dohvati OpenAI krajnju točku i ključ
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testiraj GPT-4o implementaciju
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Očekivano:** JSON odgovor s dovršenjem razgovora (potvrđuje da OpenAI funkcionira)

### Što radi, a što ne

**✅ Radi nakon postavljanja:**
- Azure OpenAI modeli postavljeni i prihvaćaju API pozive
- AI pretraživačka usluga radi (prazna, bez indeksa)
- Container Apps rade (zadane nginx slike)
- Računi za pohranu dostupni i spremni za prijenos
- Cosmos DB spreman za operacije s podacima
- Application Insights prikuplja telemetriju infrastrukture
- Key Vault spreman za pohranu tajni

**❌ Još ne radi (zahtijeva razvoj):**
- Krajnje točke agenata (nema postavljenog aplikacijskog koda)
- Funkcionalnost chata (zahtijeva frontend + backend implementaciju)
- Upiti pretraživanja (nije kreiran pretraživački indeks)
- Cjevovod za obradu dokumenata (nema prenesenih podataka)
- Prilagođena telemetrija (zahtijeva instrumentaciju aplikacije)

**Sljedeći koraci:** Pogledajte [Konfiguracija nakon postavljanja](../../../../examples/retail-multiagent-arm-template) za razvoj i postavljanje vaše aplikacije

---

## ⚙️ Opcije konfiguracije

### Parametri predloška

| Parametar | Tip | Zadano | Opis |
|-----------|------|--------|------|
| `projectName` | string | "retail" | Prefiks za sve nazive resursa |
| `location` | string | Lokacija grupe resursa | Primarna regija postavljanja |
| `secondaryLocation` | string | "westus2" | Sekundarna regija za postavljanje u više regija |
| `tertiaryLocation` | string | "francecentral" | Regija za model ugrađenih elemenata |
| `environmentName` | string | "dev" | Oznaka okruženja (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfiguracija postavljanja (minimalno/standardno/premium) |
| `enableMultiRegion` | bool | true | Omogućuje postavljanje u više regija |
| `enableMonitoring` | bool | true | Omogućuje Application Insights i praćenje |
| `enableSecurity` | bool | true | Omogućuje Key Vault i poboljšanu sigurnost |

### Prilagodba parametara

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

## 📖 Korištenje skripte za postavljanje

Skripta `deploy.sh` pruža interaktivno iskustvo postavljanja:

```bash
# Prikaži pomoć
./deploy.sh --help

# Osnovno postavljanje
./deploy.sh -g myResourceGroup

# Napredno postavljanje s prilagođenim postavkama
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Razvojno postavljanje bez više regija
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Značajke skripte

- ✅ **Validacija preduvjeta** (Azure CLI, status prijave, datoteke predloška)
- ✅ **Upravljanje grupom resursa** (kreira ako ne postoji)
- ✅ **Validacija predloška** prije postavljanja
- ✅ **Praćenje napretka** s obojenim izlazom
- ✅ **Prikaz rezultata postavljanja**
- ✅ **Vodič nakon postavljanja**

## 📊 Praćenje postavljanja

### Provjera statusa postavljanja

```bash
# Popis implementacija
az deployment group list --resource-group myResourceGroup --output table

# Dohvati detalje implementacije
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Prati napredak implementacije
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Rezultati postavljanja

Nakon uspješnog postavljanja, dostupni su sljedeći rezultati:

- **URL korisničkog sučelja**: Javni krajnji punkt za web sučelje
- **URL usmjerivača**: API krajnji punkt za usmjerivač agenata
- **OpenAI krajnje točke**: Primarne i sekundarne OpenAI usluge
- **Pretraživačka usluga**: Krajnji punkt Azure AI pretraživačke usluge
- **Račun za pohranu**: Naziv računa za pohranu dokumenata
- **Key Vault**: Naziv Key Vault-a (ako je omogućeno)
- **Application Insights**: Naziv usluge za praćenje (ako je omogućeno)

## 🔧 Nakon postavljanja: Sljedeći koraci
> **📝 Važno:** Infrastruktura je implementirana, ali trebate razviti i implementirati aplikacijski kod.

### Faza 1: Razvijte aplikacije za agente (Vaša odgovornost)

ARM predložak stvara **prazne Container Apps** s privremenim nginx slikama. Morate:

**Potrebni razvoj:**
1. **Implementacija agenata** (30-40 sati)
   - Agent za korisničku podršku s integracijom GPT-4o
   - Agent za inventar s integracijom GPT-4o-mini
   - Logika usmjeravanja agenata

2. **Razvoj sučelja** (20-30 sati)
   - UI za chat sučelje (React/Vue/Angular)
   - Funkcionalnost za prijenos datoteka
   - Prikaz i formatiranje odgovora

3. **Backend usluge** (12-16 sati)
   - FastAPI ili Express router
   - Middleware za autentifikaciju
   - Integracija telemetrije

**Pogledajte:** [Vodič za arhitekturu](../retail-scenario.md) za detaljne obrasce implementacije i primjere koda

### Faza 2: Konfigurirajte AI indeks pretraživanja (15-30 minuta)

Kreirajte indeks pretraživanja koji odgovara vašem podatkovnom modelu:

```bash
# Dohvati detalje usluge pretraživanja
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Kreiraj indeks s vašom shemom (primjer)
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

**Resursi:**
- [Dizajn sheme AI indeksa pretraživanja](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfiguracija vektorskog pretraživanja](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Faza 3: Prenesite svoje podatke (Vrijeme varira)

Kada imate podatke o proizvodima i dokumentima:

```bash
# Dohvati detalje računa za pohranu
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Prenesite svoje dokumente
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Primjer: Prenesite jednu datoteku
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Faza 4: Izgradite i implementirajte svoje aplikacije (8-12 sati)

Kada razvijete kod za agenta:

```bash
# 1. Kreirajte Azure Container Registry (ako je potrebno)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Izgradite i gurnite sliku agent routera
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Izgradite i gurnite sliku frontend-a
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Ažurirajte Container Apps sa vašim slikama
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigurirajte varijable okruženja
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Faza 5: Testirajte svoju aplikaciju (2-4 sata)

```bash
# Nabavite URL svoje aplikacije
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Testirajte krajnju točku agenta (kada je vaš kod implementiran)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Provjerite zapisnike aplikacije
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Resursi za implementaciju

**Arhitektura i dizajn:**
- 📖 [Kompletan vodič za arhitekturu](../retail-scenario.md) - Detaljni obrasci implementacije
- 📖 [Obrasci dizajna za više agenata](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Primjeri koda:**
- 🔗 [Azure OpenAI Chat primjer](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG obrazac
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Okvir za agente (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orkestracija agenata (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Razgovori s više agenata

**Procijenjeni ukupni napor:**
- Implementacija infrastrukture: 15-25 minuta (✅ Završeno)
- Razvoj aplikacije: 80-120 sati (🔨 Vaš rad)
- Testiranje i optimizacija: 15-25 sati (🔨 Vaš rad)

## 🛠️ Rješavanje problema

### Uobičajeni problemi

#### 1. Prekoračena kvota za Azure OpenAI

```bash
# Provjeri trenutnu upotrebu kvote
az cognitiveservices usage list --location eastus2

# Zatraži povećanje kvote
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Neuspjela implementacija Container Apps

```bash
# Provjerite zapisnike aplikacije kontejnera
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Ponovno pokrenite aplikaciju kontejnera
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicijalizacija usluge pretraživanja

```bash
# Provjerite status usluge pretraživanja
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testirajte povezanost usluge pretraživanja
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validacija implementacije

```bash
# Provjerite jesu li svi resursi stvoreni
az resource list \
  --resource-group myResourceGroup \
  --output table

# Provjerite stanje resursa
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Sigurnosni aspekti

### Upravljanje ključevima
- Svi tajni podaci pohranjeni su u Azure Key Vault (ako je omogućeno)
- Container Apps koriste upravljani identitet za autentifikaciju
- Računi za pohranu imaju sigurne zadane postavke (samo HTTPS, bez javnog pristupa blobovima)

### Mrežna sigurnost
- Container Apps koriste internu mrežu gdje je to moguće
- Usluga pretraživanja konfigurirana je s opcijom privatnih krajnjih točaka
- Cosmos DB konfiguriran s minimalno potrebnim dozvolama

### RBAC konfiguracija
```bash
# Dodijelite potrebne uloge za upravljani identitet
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimizacija troškova

### Procjena troškova (mjesečno, USD)

| Način | OpenAI | Container Apps | Pretraživanje | Pohrana | Ukupno procijenjeno |
|-------|--------|----------------|---------------|---------|----------------------|
| Minimalno | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardno | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Praćenje troškova

```bash
# Postavite upozorenja o proračunu
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Ažuriranja i održavanje

### Ažuriranja predloška
- Verzionirajte ARM predloške
- Testirajte promjene prvo u razvojnom okruženju
- Koristite način inkrementalne implementacije za ažuriranja

### Ažuriranja resursa
```bash
# Ažuriraj s novim parametrima
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sigurnosne kopije i oporavak
- Automatska sigurnosna kopija za Cosmos DB omogućena
- Soft delete za Key Vault omogućeno
- Verzije Container Apps održavane za povratak na prethodnu verziju

## 📞 Podrška

- **Problemi s predloškom**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure podrška**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Zajednica**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Spremni za implementaciju svoje multi-agentne solucije?**

Započnite s: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne odgovaramo za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->