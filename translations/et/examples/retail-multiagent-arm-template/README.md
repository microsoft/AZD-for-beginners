<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-24T12:46:29+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "et"
}
-->
# Jaemüügi Multi-Agent Lahendus - Infrastruktuuri Mall

**Peatükk 5: Tootmisse juurutamise pakett**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Seotud peatükk**: [Peatükk 5: Multi-Agent AI Lahendused](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Stsenaariumi juhend**: [Täielik arhitektuur](../retail-scenario.md)
- **🎯 Kiirjuurutus**: [Ühe klõpsuga juurutamine](../../../../examples/retail-multiagent-arm-template)

> **⚠️ AINULT INFRASTRUKTUURI MALL**  
> See ARM mall juurutab **Azure'i ressursid** multi-agent süsteemi jaoks.  
>  
> **Mis juurutatakse (15-25 minutit):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings kolmes regioonis)
> - ✅ AI otsinguteenused (tühjad, valmis indeksi loomiseks)
> - ✅ Konteinerirakendused (kohatäite pildid, valmis teie koodiks)
> - ✅ Salvestus, Cosmos DB, Key Vault, Application Insights
>  
> **Mis EI ole kaasatud (vajab arendust):**
> - ❌ Agentide rakenduskood (Kliendiagent, Inventariagent)
> - ❌ Marsruutimisloogika ja API lõpp-punktid
> - ❌ Esikülje vestlusliides
> - ❌ Otsinguindeksi skeemid ja andmetorustikud
> - ❌ **Hinnanguline arendusaeg: 80-120 tundi**
>  
> **Kasuta seda malli, kui:**
> - ✅ Soovid Azure'i infrastruktuuri multi-agent projekti jaoks
> - ✅ Plaanid agentide rakenduse eraldi arendada
> - ✅ Vajad tootmiskõlblikku infrastruktuuri alust
>  
> **Ära kasuta, kui:**
> - ❌ Ootad kohe töötavat multi-agent demo
> - ❌ Otsid täielikke rakenduskoodi näiteid

## Ülevaade

See kataloog sisaldab terviklikku Azure Resource Manager (ARM) malli, et juurutada **infrastruktuuri alus** multi-agent klienditoe süsteemile. Mall loob kõik vajalikud Azure'i teenused, mis on korralikult konfigureeritud ja omavahel ühendatud, valmis teie rakenduse arenduseks.

**Pärast juurutamist on teil:** Tootmiskõlblik Azure'i infrastruktuur  
**Süsteemi lõpuleviimiseks vajate:** Agentide koodi, esikülje liidest ja andmekonfiguratsiooni (vt [Arhitektuuri juhend](../retail-scenario.md))

## 🎯 Mis juurutatakse

### Põhiinfrastruktuur (seisund pärast juurutamist)

✅ **Azure OpenAI teenused** (Valmis API-kõnedeks)
  - Peamine regioon: GPT-4o juurutus (20K TPM võimekus)
  - Teisene regioon: GPT-4o-mini juurutus (10K TPM võimekus)
  - Kolmas regioon: Teksti embeddings mudel (30K TPM võimekus)
  - Hindamisregioon: GPT-4o hindamismudel (15K TPM võimekus)
  - **Seisund:** Täielikult funktsionaalne - API-kõned võimalikud kohe

✅ **Azure AI otsing** (Tühi - valmis konfiguratsiooniks)
  - Vektoriotsingu võimalused lubatud
  - Standardtase ühe partitsiooni ja ühe replikaga
  - **Seisund:** Teenus töötab, kuid vajab indeksi loomist
  - **Vajalik tegevus:** Loo otsinguindeks oma skeemiga

✅ **Azure salvestuskonto** (Tühi - valmis üleslaadimiseks)
  - Blob konteinerid: `documents`, `uploads`
  - Turvaline konfiguratsioon (ainult HTTPS, avalik juurdepääs keelatud)
  - **Seisund:** Valmis failide vastuvõtmiseks
  - **Vajalik tegevus:** Laadi üles oma tooteandmed ja dokumendid

⚠️ **Konteinerirakenduste keskkond** (Kohatäite pildid juurutatud)
  - Agendi marsruutimisrakendus (nginx vaikimisi pilt)
  - Esikülje rakendus (nginx vaikimisi pilt)
  - Automaatne skaleerimine konfigureeritud (0-10 eksemplari)
  - **Seisund:** Kohatäite konteinerid töötavad
  - **Vajalik tegevus:** Loo ja juuruta oma agendirakendused

✅ **Azure Cosmos DB** (Tühi - valmis andmeteks)
  - Andmebaas ja konteiner eelkonfigureeritud
  - Optimeeritud madala latentsusega operatsioonide jaoks
  - TTL lubatud automaatseks puhastamiseks
  - **Seisund:** Valmis vestlusajaloo salvestamiseks

✅ **Azure Key Vault** (Valikuline - valmis salajaste andmete jaoks)
  - Pehme kustutamine lubatud
  - RBAC konfigureeritud hallatud identiteetide jaoks
  - **Seisund:** Valmis API võtmete ja ühendusstringide salvestamiseks

✅ **Application Insights** (Valikuline - monitooring aktiivne)
  - Ühendatud Log Analytics tööruumiga
  - Kohandatud mõõdikud ja hoiatused konfigureeritud
  - **Seisund:** Valmis teie rakenduste telemeetria vastuvõtmiseks

✅ **Dokumendi intelligentsus** (Valmis API-kõnedeks)
  - S0 tase tootmiskoormuste jaoks
  - **Seisund:** Valmis üleslaaditud dokumentide töötlemiseks

✅ **Bing otsingu API** (Valmis API-kõnedeks)
  - S1 tase reaalajas otsingute jaoks
  - **Seisund:** Valmis veebipäringuteks

### Juurutamisrežiimid

| Režiim | OpenAI võimekus | Konteinerite eksemplarid | Otsingu tase | Salvestuse redundantsus | Parim kasutus |
|-------|-----------------|--------------------------|--------------|-------------------------|--------------|
| **Minimal** | 10K-20K TPM | 0-2 replika | Basic | LRS (kohalik) | Arendus/testimine, õppimine, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 replika | Standard | ZRS (tsoon) | Tootmine, mõõdukas liiklus (<10K kasutajat) |
| **Premium** | 80K-150K TPM | 5-10 replika, tsooni redundantsus | Premium | GRS (geo) | Ettevõte, suur liiklus (>10K kasutajat), 99.99% SLA |

**Kulude mõju:**
- **Minimal → Standard:** ~4x kulude kasv ($100-370/kuus → $420-1,450/kuus)
- **Standard → Premium:** ~3x kulude kasv ($420-1,450/kuus → $1,150-3,500/kuus)
- **Vali vastavalt:** Oodatav koormus, SLA nõuded, eelarve piirangud

**Võimekuse planeerimine:**
- **TPM (Tokens Per Minute):** Kokku kõigi mudelite juurutuste vahel
- **Konteinerite eksemplarid:** Automaatse skaleerimise vahemik (min-max replika)
- **Otsingu tase:** Mõjutab päringute jõudlust ja indeksi suuruse piiranguid

## 📋 Eeltingimused

### Vajalikud tööriistad
1. **Azure CLI** (versioon 2.50.0 või uuem)
   ```bash
   az --version  # Kontrolli versiooni
   az login      # Autendi
   ```

2. **Aktiivne Azure'i tellimus** omaniku või kaastöötaja juurdepääsuga
   ```bash
   az account show  # Kontrolli tellimust
   ```

### Vajalikud Azure'i kvoodid

Enne juurutamist kontrolli piisavaid kvoote sihtregioonides:

```bash
# Kontrolli Azure OpenAI saadavust oma piirkonnas
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Kinnita OpenAI kvoot (näide gpt-4o jaoks)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Kontrolli Container Apps kvooti
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimaalselt vajalikud kvoodid:**
- **Azure OpenAI:** 3-4 mudeli juurutust regioonides
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Märkus:** GPT-4o võib olla ootenimekirjas mõnes regioonis - kontrolli [mudeli saadavust](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Konteinerirakendused:** Hallatud keskkond + 2-10 konteineri eksemplari
- **AI otsing:** Standardtase (Basic ei sobi vektoriotsinguks)
- **Cosmos DB:** Standardne etteantud läbilaskevõime

**Kui kvoot on ebapiisav:**
1. Mine Azure'i portaal → Kvoodid → Taotle suurendust
2. Või kasuta Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Kaalu alternatiivseid regioone saadavusega

## 🚀 Kiirjuurutus

### Valik 1: Kasutades Azure CLI-d

```bash
# Klooni või laadi alla mallifailid
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Muuda juurutusskript käivitatavaks
chmod +x deploy.sh

# Juuruta vaikeseadetega
./deploy.sh -g myResourceGroup

# Juuruta tootmiseks koos premium funktsioonidega
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Valik 2: Kasutades Azure'i portaali

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Valik 3: Kasutades otse Azure CLI-d

```bash
# Loo ressursigrupp
az group create --name myResourceGroup --location eastus2

# Paigalda mall
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Juurutamise ajakava

### Mida oodata

| Faas | Kestus | Mis toimub |
|------|--------|------------||
| **Malli valideerimine** | 30-60 sekundit | Azure valideerib ARM malli süntaksi ja parameetrid |
| **Ressursigrupi seadistamine** | 10-20 sekundit | Loob ressursigrupi (vajadusel) |
| **OpenAI juurutamine** | 5-8 minutit | Loob 3-4 OpenAI kontot ja juurutab mudelid |
| **Konteinerirakendused** | 3-5 minutit | Loob keskkonna ja juurutab kohatäite konteinerid |
| **Otsing ja salvestus** | 2-4 minutit | Juurutab AI otsinguteenuse ja salvestuskontod |
| **Cosmos DB** | 2-3 minutit | Loob andmebaasi ja konfigureerib konteinerid |
| **Monitooringu seadistamine** | 2-3 minutit | Seadistab Application Insights ja Log Analytics |
| **RBAC konfiguratsioon** | 1-2 minutit | Konfigureerib hallatud identiteedid ja õigused |
| **Kogu juurutamine** | **15-25 minutit** | Täielik infrastruktuur valmis |

**Pärast juurutamist:**
- ✅ **Infrastruktuur valmis:** Kõik Azure'i teenused juurutatud ja töötavad
- ⏱️ **Rakenduse arendus:** 80-120 tundi (teie vastutus)
- ⏱️ **Indeksi konfiguratsioon:** 15-30 minutit (vajab teie skeemi)
- ⏱️ **Andmete üleslaadimine:** Sõltub andmekogumi suurusest
- ⏱️ **Testimine ja valideerimine:** 2-4 tundi

---

## ✅ Juurutamise edukuse kontroll

### Samm 1: Kontrolli ressursside juurutamist (2 minutit)

```bash
# Kontrollige, kas kõik ressursid on edukalt juurutatud
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Oodatav:** Tühi tabel (kõik ressursid näitavad "Succeeded" staatust)

### Samm 2: Kontrolli Azure OpenAI juurutusi (3 minutit)

```bash
# Loetle kõik OpenAI kontod
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Kontrolli mudeli juurutusi esmase piirkonna jaoks
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Oodatav:** 
- 3-4 OpenAI kontot (peamine, teisene, kolmas, hindamisregioonid)
- 1-2 mudeli juurutust konto kohta (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Samm 3: Testi infrastruktuuri lõpp-punkte (5 minutit)

```bash
# Hankige konteineri rakenduse URL-id
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testige ruuteri lõpp-punkti (vastab kohatäite pilt)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Oodatav:** 
- Konteinerirakendused näitavad "Running" staatust
- Kohatäite nginx vastab HTTP 200 või 404 (rakenduskoodi pole veel)

### Samm 4: Kontrolli Azure OpenAI API juurdepääsu (3 minutit)

```bash
# Hangi OpenAI lõpp-punkt ja võti
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testi GPT-4o juurutust
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Oodatav:** JSON vastus vestluse lõpetamisega (kinnitab OpenAI funktsionaalsuse)

### Mis töötab vs. mis ei tööta

**✅ Töötab pärast juurutamist:**
- Azure OpenAI mudelid juurutatud ja aktsepteerivad API-kõnesid
- AI otsinguteenused töötavad (tühjad, indeksid puuduvad)
- Konteinerirakendused töötavad (kohatäite nginx pildid)
- Salvestuskontod ligipääsetavad ja valmis üleslaadimiseks
- Cosmos DB valmis andmeoperatsioonideks
- Application Insights kogub infrastruktuuri telemeetriat
- Key Vault valmis salajaste andmete salvestamiseks

**❌ Ei tööta veel (vajab arendust):**
- Agendi lõpp-punktid (rakenduskoodi pole juurutatud)
- Vestlusfunktsionaalsus (vajab esikülje + tagakülje rakendust)
- Otsingupäringud (otsinguindeks pole veel loodud)
- Dokumenditöötluse torustik (andmeid pole üles laaditud)
- Kohandatud telemeetria (vajab rakenduse instrumenteerimist)

**Järgmised sammud:** Vaata [Järgneva konfiguratsiooni juhendit](../../../../examples/retail-multiagent-arm-template), et arendada ja juurutada oma rakendus

---

## ⚙️ Konfiguratsiooni valikud

### Malli parameetrid

| Parameeter | Tüüp | Vaikimisi | Kirjeldus |
|------------|------|-----------|-----------|
| `projectName` | string | "retail" | Kõigi ressursside nimede eesliide |
| `location` | string | Ressursigrupi asukoht | Peamine juurutusregioon |
| `secondaryLocation` | string | "westus2" | Teisene regioon mitme regiooni juurutuseks |
| `tertiaryLocation` | string | "francecentral" | Regioon embeddings mudeli jaoks |
| `environmentName` | string | "dev" | Keskkonna määratlus (arendus/testimine/tootmine) |
| `deploymentMode` | string | "standard" | Juurutuse konfiguratsioon (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Lubab mitme regiooni juurutuse |
| `enableMonitoring` | bool | true | Lubab Application Insights ja logimise |
| `enableSecurity` | bool | true | Lubab Key Vaulti ja täiustatud turvalisuse |

### Parameetrite kohandamine

Muuda `azuredeploy.parameters.json`:

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

## 🏗️ Arhitektuuri ülevaade

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

## 📖 Juurutusskripti kasutamine

`deploy.sh` skript pakub interaktiivset juurutuskogemust:

```bash
# Näita abi
./deploy.sh --help

# Põhiväljaanne
./deploy.sh -g myResourceGroup

# Täiustatud väljaanne kohandatud seadistustega
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Arenduse väljaanne ilma mitme piirkonnata
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Skripti funktsioonid

- ✅ **Eeltingimuste valideerimine** (Azure CLI, sisselogimise staatus, mallifailid)
- ✅ **Ressursigrupi haldamine** (loob, kui puudub)
- ✅ **Malli valideerimine** enne juurutamist
- ✅ **Edenemise jälgimine** värvilise väljundiga
- ✅ **Juurutuse väljundite kuvamine**
- ✅ **Järgneva juurutuse juhendamine**

## 📊 Juurutamise monitooring

### Kontrolli juurutamise staatust

```bash
# Loetle juurutused
az deployment group list --resource-group myResourceGroup --output table

# Hangi juurutuse üksikasjad
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Jälgi juurutuse edenemist
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Juurutuse väljundid

Pärast edukat juurutamist on saadaval järgmised väljundid:

- **Esikülje URL**: Veebiliidese avalik lõpp-punkt
- **Marsruutija URL**: Agendi marsruutija API lõpp-punkt
- **OpenAI lõpp-punktid**: Peamised ja teisene OpenAI teenuse lõpp-punktid
- **Otsinguteenused**: Azure AI otsinguteenuse lõpp-punkt
- **Salvestuskonto**: Dokumentide salvestuskonto nimi
- **Key Vault**: Key Vaulti nimi (kui lubatud)
- **Application Insights**: Monitooringuteenuse nimi (kui lubatud)

## 🔧 Pärast juurutamist: Järgmised sammud
> **📝 Oluline:** Infrastruktuur on juurutatud, kuid rakenduse koodi arendamine ja juurutamine on teie ülesanne.

### Faas 1: Agentide rakenduste arendamine (Teie vastutus)

ARM-mall loob **tühjad Container Apps** koos kohatäite nginx-piltidega. Te peate:

**Nõutav arendus:**
1. **Agentide rakendamine** (30-40 tundi)
   - Klienditeeninduse agent GPT-4o integratsiooniga
   - Inventuuri agent GPT-4o-mini integratsiooniga
   - Agentide suunamisloogika

2. **Frontend arendus** (20-30 tundi)
   - Vestlusliidese UI (React/Vue/Angular)
   - Failide üleslaadimise funktsionaalsus
   - Vastuste kuvamine ja vormindamine

3. **Backend teenused** (12-16 tundi)
   - FastAPI või Express router
   - Autentimise middleware
   - Telemeetria integratsioon

**Vaata:** [Arhitektuuri juhend](../retail-scenario.md) üksikasjalike rakendusmustrite ja koodinäidete jaoks

### Faas 2: AI otsinguindeksi konfigureerimine (15-30 minutit)

Looge otsinguindeks, mis vastab teie andmemudelile:

```bash
# Hankige otsinguteenuse üksikasjad
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Looge indeks oma skeemiga (näide)
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

**Ressursid:**
- [AI otsinguindeksi skeemi kujundus](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vektori otsingu konfiguratsioon](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Faas 3: Andmete üleslaadimine (Aeg varieerub)

Kui teil on tooteandmed ja dokumendid:

```bash
# Hankige salvestuskonto üksikasjad
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Laadige oma dokumendid üles
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Näide: Laadige üles üks fail
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Faas 4: Rakenduste ehitamine ja juurutamine (8-12 tundi)

Kui olete agentide koodi arendanud:

```bash
# 1. Loo Azure Container Registry (kui vaja)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Ehita ja lükka agent routeri pilt
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Ehita ja lükka frontend'i pilt
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Uuenda Container Apps oma piltidega
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigureeri keskkonnamuutujad
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Faas 5: Rakenduse testimine (2-4 tundi)

```bash
# Hankige oma rakenduse URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Testige agendi lõpp-punkti (kui teie kood on juurutatud)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Kontrollige rakenduse logisid
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Rakendamise ressursid

**Arhitektuur ja disain:**
- 📖 [Täielik arhitektuuri juhend](../retail-scenario.md) - Üksikasjalikud rakendusmustrid
- 📖 [Multi-agent disainimustrid](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Koodinäited:**
- 🔗 [Azure OpenAI vestluse näidis](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG muster
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agentide raamistik (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agentide orkestreerimine (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-agent vestlused

**Hinnanguline kogupingutus:**
- Infrastruktuuri juurutamine: 15-25 minutit (✅ Valmis)
- Rakenduse arendamine: 80-120 tundi (🔨 Teie töö)
- Testimine ja optimeerimine: 15-25 tundi (🔨 Teie töö)

## 🛠️ Tõrkeotsing

### Levinud probleemid

#### 1. Azure OpenAI kvoot ületatud

```bash
# Kontrolli praegust kvoodi kasutust
az cognitiveservices usage list --location eastus2

# Taotle kvoodi suurendamist
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps juurutamine ebaõnnestus

```bash
# Kontrolli konteineri rakenduse logisid
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Taaskäivita konteineri rakendus
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Otsinguteenuse initsialiseerimine

```bash
# Kontrolli otsinguteenuse olekut
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testi otsinguteenuse ühenduvust
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Juurutamise valideerimine

```bash
# Kontrolli, et kõik ressursid on loodud
az resource list \
  --resource-group myResourceGroup \
  --output table

# Kontrolli ressursside tervist
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Turvalisuse kaalutlused

### Võtmehaldus
- Kõik saladused salvestatakse Azure Key Vaulti (kui lubatud)
- Container Apps kasutavad hallatud identiteeti autentimiseks
- Salvestuskontod on konfigureeritud turvaliste vaikeseadetega (ainult HTTPS, avalik blobide juurdepääs keelatud)

### Võrguturvalisus
- Container Apps kasutavad võimalusel sisemist võrgustikku
- Otsinguteenuse konfiguratsioon privaatsete lõpp-punktidega
- Cosmos DB konfigureeritud minimaalsete vajalike õigustega

### RBAC konfiguratsioon
```bash
# Määrake hallatud identiteedi jaoks vajalikud rollid
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kulude optimeerimine

### Kulude hinnangud (kuus, USD)

| Režiim | OpenAI | Container Apps | Otsing | Salvestus | Koguhinnang |
|-------|--------|----------------|--------|----------|-------------|
| Minimaalne | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kulude jälgimine

```bash
# Seadista eelarve hoiatused
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Uuendused ja hooldus

### Malli uuendused
- Versioonihaldus ARM-malli failidele
- Testige muudatusi esmalt arenduskeskkonnas
- Kasutage uuenduste jaoks inkrementaalset juurutamisrežiimi

### Ressursside uuendused
```bash
# Uuenda uute parameetritega
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Varundamine ja taastamine
- Cosmos DB automaatne varundamine lubatud
- Key Vault pehme kustutamine lubatud
- Container App versioonid säilitatud tagasipööramiseks

## 📞 Tugi

- **Malliprobleemid**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure tugi**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Kogukond**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Valmis juurutama oma multi-agent lahendust?**

Alustage: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->