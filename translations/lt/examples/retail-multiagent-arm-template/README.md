<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-24T09:14:34+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "lt"
}
-->
# Mažmeninės prekybos daugiaveikės sprendimo - infrastruktūros šablonas

**5 skyrius: Produkcijos diegimo paketas**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Susijęs skyrius**: [5 skyrius: Daugiaveikės AI sprendimai](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenarijaus vadovas**: [Pilna architektūra](../retail-scenario.md)
- **🎯 Greitas diegimas**: [Vieno paspaudimo diegimas](../../../../examples/retail-multiagent-arm-template)

> **⚠️ TIK INFRASTRUKTŪROS ŠABLONAS**  
> Šis ARM šablonas diegia **Azure resursus** daugiaveikės sistemos projektui.  
>  
> **Kas bus įdiegta (15-25 minutės):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, įterpimai 3 regionuose)
> - ✅ AI paieškos paslauga (tuščia, paruošta indeksų kūrimui)
> - ✅ Konteinerių programos (vietos rezervavimo vaizdai, paruošti jūsų kodui)
> - ✅ Saugykla, Cosmos DB, Key Vault, Application Insights
>  
> **Kas neįtraukta (reikalingas kūrimas):**
> - ❌ Agentų įgyvendinimo kodas (Klientų agentas, Inventoriaus agentas)
> - ❌ Maršrutizavimo logika ir API galiniai taškai
> - ❌ Priekinės sąsajos pokalbių UI
> - ❌ Paieškos indeksų schemos ir duomenų srautai
> - ❌ **Numatomas kūrimo laikas: 80-120 valandų**
>  
> **Naudokite šį šabloną, jei:**
> - ✅ Norite paruošti Azure infrastruktūrą daugiaveikės projekto poreikiams
> - ✅ Planuojate atskirai kurti agentų įgyvendinimą
> - ✅ Reikia produkcijai paruoštos infrastruktūros bazės
>  
> **Nenaudokite, jei:**
> - ❌ Tikitės iškart veikiančio daugiaveikės demonstracinio sprendimo
> - ❌ Ieškote pilnų aplikacijos kodo pavyzdžių

## Apžvalga

Šiame kataloge yra išsamus Azure Resource Manager (ARM) šablonas, skirtas diegti **infrastruktūros pagrindą** daugiaveikės klientų aptarnavimo sistemai. Šablonas paruošia visus reikalingus Azure paslaugas, tinkamai sukonfigūruotas ir tarpusavyje sujungtas, paruoštas jūsų aplikacijos kūrimui.

**Po diegimo turėsite:** Produkcijai paruoštą Azure infrastruktūrą  
**Norint užbaigti sistemą, reikia:** Agentų kodo, priekinės sąsajos UI ir duomenų konfigūracijos (žr. [Architektūros vadovą](../retail-scenario.md))

## 🎯 Kas bus įdiegta

### Pagrindinė infrastruktūra (būsena po diegimo)

✅ **Azure OpenAI paslaugos** (Paruošta API užklausoms)
  - Pagrindinis regionas: GPT-4o diegimas (20K TPM pajėgumas)
  - Antrinis regionas: GPT-4o-mini diegimas (10K TPM pajėgumas)
  - Tretinis regionas: Teksto įterpimų modelis (30K TPM pajėgumas)
  - Vertinimo regionas: GPT-4o vertinimo modelis (15K TPM pajėgumas)
  - **Būsena:** Pilnai funkcionalus - galima iškart naudoti API užklausoms

✅ **Azure AI paieška** (Tuščia - paruošta konfigūracijai)
  - Įjungtos vektorinės paieškos galimybės
  - Standartinis lygis su 1 skaidiniu, 1 replika
  - **Būsena:** Paslauga veikia, bet reikia sukurti indeksą
  - **Reikalingas veiksmas:** Sukurti paieškos indeksą pagal jūsų schemą

✅ **Azure saugyklos paskyra** (Tuščia - paruošta įkėlimams)
  - Blob konteineriai: `documents`, `uploads`
  - Saugus konfigūravimas (tik HTTPS, be viešojo prieigos)
  - **Būsena:** Paruošta failų priėmimui
  - **Reikalingas veiksmas:** Įkelti jūsų produktų duomenis ir dokumentus

⚠️ **Konteinerių programų aplinka** (Įdiegti vietos rezervavimo vaizdai)
  - Agentų maršrutizavimo programa (nginx numatytasis vaizdas)
  - Priekinės sąsajos programa (nginx numatytasis vaizdas)
  - Automatinis mastelio keitimas (0-10 instancijų)
  - **Būsena:** Veikia vietos rezervavimo konteineriai
  - **Reikalingas veiksmas:** Sukurti ir įdiegti jūsų agentų programas

✅ **Azure Cosmos DB** (Tuščia - paruošta duomenims)
  - Iš anksto sukonfigūruota duomenų bazė ir konteineris
  - Optimizuota mažo vėlavimo operacijoms
  - Įjungtas TTL automatinio valymo funkcijai
  - **Būsena:** Paruošta pokalbių istorijos saugojimui

✅ **Azure Key Vault** (Pasirinktinai - paruošta slaptažodžiams)
  - Įjungtas minkštas ištrynimas
  - RBAC sukonfigūruotas valdomoms tapatybėms
  - **Būsena:** Paruošta API raktų ir prisijungimo eilutėms saugoti

✅ **Application Insights** (Pasirinktinai - stebėjimas aktyvus)
  - Sujungta su Log Analytics darbo sritimi
  - Suvestiniai metrikai ir įspėjimai sukonfigūruoti
  - **Būsena:** Paruošta priimti telemetriją iš jūsų programų

✅ **Dokumentų intelektas** (Paruošta API užklausoms)
  - S0 lygis produkcijos darbo krūviams
  - **Būsena:** Paruošta apdoroti įkeltus dokumentus

✅ **Bing paieškos API** (Paruošta API užklausoms)
  - S1 lygis realaus laiko paieškoms
  - **Būsena:** Paruošta interneto paieškos užklausoms

### Diegimo režimai

| Režimas | OpenAI pajėgumas | Konteinerių instancijos | Paieškos lygis | Saugyklos atsparumas | Geriausiai tinka |
|--------|------------------|------------------------|----------------|---------------------|------------------|
| **Minimalus** | 10K-20K TPM | 0-2 replikos | Bazinis | LRS (lokalus) | Kūrimas/testavimas, mokymasis, koncepcijos įrodymas |
| **Standartinis** | 30K-60K TPM | 2-5 replikos | Standartinis | ZRS (zoninis) | Produkcija, vidutinis srautas (<10K vartotojų) |
| **Premium** | 80K-150K TPM | 5-10 replikų, zoninis atsparumas | Premium | GRS (geografinis) | Įmonės, didelis srautas (>10K vartotojų), 99.99% SLA |

**Kainos poveikis:**
- **Minimalus → Standartinis:** ~4x kainos padidėjimas ($100-370/mėn → $420-1,450/mėn)
- **Standartinis → Premium:** ~3x kainos padidėjimas ($420-1,450/mėn → $1,150-3,500/mėn)
- **Pasirinkite pagal:** Tikėtiną apkrovą, SLA reikalavimus, biudžeto apribojimus

**Pajėgumo planavimas:**
- **TPM (žodžių per minutę):** Bendras visų modelių diegimų pajėgumas
- **Konteinerių instancijos:** Automatinio mastelio keitimo diapazonas (min-max replikos)
- **Paieškos lygis:** Įtakoja užklausų našumą ir indeksų dydžio ribas

## 📋 Būtinos sąlygos

### Reikalingi įrankiai
1. **Azure CLI** (versija 2.50.0 ar naujesnė)
   ```bash
   az --version  # Patikrinkite versiją
   az login      # Autentifikuoti
   ```

2. **Aktyvi Azure prenumerata** su savininko arba bendradarbio prieiga
   ```bash
   az account show  # Patikrinkite prenumeratą
   ```

### Reikalingos Azure kvotos

Prieš diegimą patikrinkite, ar jūsų tiksliniuose regionuose yra pakankamai kvotų:

```bash
# Patikrinkite Azure OpenAI prieinamumą savo regione
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Patikrinkite OpenAI kvotą (pavyzdys gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Patikrinkite Container Apps kvotą
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimaliai reikalingos kvotos:**
- **Azure OpenAI:** 3-4 modelių diegimai skirtinguose regionuose
  - GPT-4o: 20K TPM (žodžių per minutę)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Pastaba:** GPT-4o kai kuriuose regionuose gali būti laukimo sąraše - patikrinkite [modelių prieinamumą](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Konteinerių programos:** Valdoma aplinka + 2-10 konteinerių instancijų
- **AI paieška:** Standartinis lygis (bazinis netinka vektorinei paieškai)
- **Cosmos DB:** Standartinis numatytas pajėgumas

**Jei kvotų nepakanka:**
1. Eikite į Azure Portal → Kvotos → Prašyti padidinimo
2. Arba naudokite Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Apsvarstykite alternatyvius regionus su prieinamumu

## 🚀 Greitas diegimas

### 1 variantas: Naudojant Azure CLI

```bash
# Nukopijuokite arba atsisiųskite šablono failus
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Padarykite diegimo scenarijų vykdomą
chmod +x deploy.sh

# Diegti su numatytaisiais nustatymais
./deploy.sh -g myResourceGroup

# Diegti gamybai su aukščiausios kokybės funkcijomis
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### 2 variantas: Naudojant Azure Portal

[![Diegti į Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 3 variantas: Naudojant tiesiogiai Azure CLI

```bash
# Sukurti išteklių grupę
az group create --name myResourceGroup --location eastus2

# Įdiegti šabloną
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Diegimo laiko juosta

### Ko tikėtis

| Fazių pavadinimas | Trukmė | Kas vyksta |
|-------------------|--------|-----------||
| **Šablono validacija** | 30-60 sekundžių | Azure tikrina ARM šablono sintaksę ir parametrus |
| **Resursų grupės nustatymas** | 10-20 sekundžių | Sukuriama resursų grupė (jei reikia) |
| **OpenAI diegimas** | 5-8 minutės | Sukuriamos 3-4 OpenAI paskyros ir diegiami modeliai |
| **Konteinerių programos** | 3-5 minutės | Sukuriama aplinka ir diegiami vietos rezervavimo konteineriai |
| **Paieška ir saugykla** | 2-4 minutės | Diegiama AI paieškos paslauga ir saugyklos paskyros |
| **Cosmos DB** | 2-3 minutės | Sukuriama duomenų bazė ir konfigūruojami konteineriai |
| **Stebėjimo nustatymas** | 2-3 minutės | Nustatoma Application Insights ir Log Analytics |
| **RBAC konfigūracija** | 1-2 minutės | Konfigūruojamos valdomos tapatybės ir leidimai |
| **Bendras diegimas** | **15-25 minutės** | Pilnai paruošta infrastruktūra |

**Po diegimo:**
- ✅ **Infrastruktūra paruošta:** Visos Azure paslaugos įdiegtos ir veikia
- ⏱️ **Aplikacijos kūrimas:** 80-120 valandų (jūsų atsakomybė)
- ⏱️ **Indekso konfigūracija:** 15-30 minučių (reikalinga jūsų schema)
- ⏱️ **Duomenų įkėlimas:** Priklauso nuo duomenų rinkinio dydžio
- ⏱️ **Testavimas ir validacija:** 2-4 valandos

---

## ✅ Patikrinkite diegimo sėkmę

### 1 žingsnis: Patikrinkite resursų diegimą (2 minutės)

```bash
# Patikrinkite, ar visi ištekliai sėkmingai įdiegti
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Tikėtina:** Tuščia lentelė (visi resursai rodo "Succeeded" būseną)

### 2 žingsnis: Patikrinkite Azure OpenAI diegimus (3 minutės)

```bash
# Išvardykite visus OpenAI paskyras
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Patikrinkite modelio diegimus pagrindiniame regione
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Tikėtina:** 
- 3-4 OpenAI paskyros (pagrindinis, antrinis, tretinis, vertinimo regionai)
- 1-2 modelių diegimai per paskyrą (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### 3 žingsnis: Testuokite infrastruktūros galinius taškus (5 minutės)

```bash
# Gauti konteinerio programos URL
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testuoti maršrutizatoriaus galinį tašką (atsakys vietos rezervavimo paveikslėlis)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Tikėtina:** 
- Konteinerių programos rodo "Running" būseną
- Vietos rezervavimo nginx atsako su HTTP 200 arba 404 (dar nėra aplikacijos kodo)

### 4 žingsnis: Patikrinkite Azure OpenAI API prieigą (3 minutės)

```bash
# Gauti OpenAI galinį tašką ir raktą
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Išbandyti GPT-4o diegimą
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Tikėtina:** JSON atsakas su pokalbio užbaigimu (patvirtina, kad OpenAI veikia)

### Kas veikia ir kas neveikia

**✅ Veikia po diegimo:**
- Azure OpenAI modeliai įdiegti ir priima API užklausas
- AI paieškos paslauga veikia (tuščia, dar nėra indeksų)
- Konteinerių programos veikia (vietos rezervavimo nginx vaizdai)
- Saugyklos paskyros prieinamos ir paruoštos įkėlimams
- Cosmos DB paruošta duomenų operacijoms
- Application Insights renka infrastruktūros telemetriją
- Key Vault paruošta slaptažodžių saugojimui

**❌ Dar neveikia (reikalingas kūrimas):**
- Agentų galiniai taškai (dar nėra aplikacijos kodo)
- Pokalbių funkcionalumas (reikalinga priekinė + galinė sąsaja)
- Paieškos užklausos (dar nėra sukurto paieškos indekso)
- Dokumentų apdorojimo srautas (dar nėra įkeltų duomenų)
- Individuali telemetrija (reikalinga aplikacijos instrumentacija)

**Kiti žingsniai:** Žr. [Po diegimo konfigūracija](../../../../examples/retail-multiagent-arm-template) aplikacijos kūrimui ir diegimui

---

## ⚙️ Konfigūracijos parinktys

### Šablono parametrai

| Parametras | Tipas | Numatytasis | Aprašymas |
|------------|-------|------------|-----------|
| `projectName` | string | "retail" | Visų resursų pavadinimų priešdėlis |
| `location` | string | Resursų grupės vieta | Pagrindinis diegimo regionas |
| `secondaryLocation` | string | "westus2" | Antrinis regionas daugiaveikės diegimui |
| `tertiaryLocation` | string | "francecentral" | Regionas įterpimų modeliui |
| `environmentName` | string | "dev" | Aplinkos paskirtis (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Diegimo konfigūracija (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Įjungti daugiaveikės diegimą |
| `enableMonitoring` | bool | true | Įjungti Application Insights ir logų stebėjimą |
| `enableSecurity` | bool | true | Įjungti Key Vault ir sustiprintą saugumą |

### Parametrų pritaikymas

Redaguokite `azuredeploy.parameters.json`:

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

## 🏗️ Architektūros apžvalga

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

## 📖 Diegimo scenarijaus naudojimas

`deploy.sh` scenarijus suteikia interaktyvią diegimo patirtį:

```bash
# Rodyti pagalbą
./deploy.sh --help

# Pagrindinis diegimas
./deploy.sh -g myResourceGroup

# Išplėstinis diegimas su pasirinktiniais nustatymais
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Diegimas kūrimui be kelių regionų
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Scenarijaus funkcijos

- ✅ **Būtinybių validacija** (Azure CLI, prisijungimo būsena, šablono failai)
- ✅ **Resursų grupės valdymas** (sukuria, jei neegzistuoja)
- ✅ **Šablono validacija** prieš diegimą
> **📝 Svarbu:** Infrastruktūra jau įdiegta, tačiau jums reikia sukurti ir įdiegti programos kodą.

### 1 etapas: Sukurkite agentų programas (Jūsų atsakomybė)

ARM šablonas sukuria **tuščias Container Apps** su vietos rezervavimo nginx atvaizdais. Jums reikia:

**Reikalingas kūrimas:**
1. **Agentų įgyvendinimas** (30-40 valandų)
   - Klientų aptarnavimo agentas su GPT-4o integracija
   - Inventoriaus agentas su GPT-4o-mini integracija
   - Agentų maršrutizavimo logika

2. **Frontend kūrimas** (20-30 valandų)
   - Pokalbių sąsajos UI (React/Vue/Angular)
   - Failų įkėlimo funkcionalumas
   - Atsakymų pateikimas ir formatavimas

3. **Backend paslaugos** (12-16 valandų)
   - FastAPI arba Express maršrutizatorius
   - Autentifikacijos tarpinė programinė įranga
   - Telemetrijos integracija

**Žiūrėkite:** [Architektūros vadovas](../retail-scenario.md) dėl detalių įgyvendinimo modelių ir kodo pavyzdžių

### 2 etapas: Suformuokite AI paieškos indeksą (15-30 minučių)

Sukurkite paieškos indeksą, atitinkantį jūsų duomenų modelį:

```bash
# Gauti paieškos paslaugos informaciją
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Sukurti indeksą pagal jūsų schemą (pavyzdys)
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

**Ištekliai:**
- [AI paieškos indekso schemos kūrimas](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vektorinės paieškos konfigūracija](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### 3 etapas: Įkelkite savo duomenis (laikas skiriasi)

Kai turite produktų duomenis ir dokumentus:

```bash
# Gauti saugyklos paskyros informaciją
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Įkelkite savo dokumentus
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Pavyzdys: Įkelti vieną failą
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### 4 etapas: Sukurkite ir įdiekite savo programas (8-12 valandų)

Kai sukūrėte savo agentų kodą:

```bash
# 1. Sukurkite Azure Container Registry (jei reikia)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Sukurkite ir įkelkite agento maršrutizatoriaus atvaizdą
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Sukurkite ir įkelkite priekinio plano atvaizdą
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Atnaujinkite Container Apps su savo atvaizdais
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Suaktyvinkite aplinkos kintamuosius
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### 5 etapas: Išbandykite savo programą (2-4 valandos)

```bash
# Gaukite savo programos URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Išbandykite agento galinį tašką (kai jūsų kodas bus įdiegtas)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Patikrinkite programos žurnalus
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Įgyvendinimo ištekliai

**Architektūra ir dizainas:**
- 📖 [Pilnas architektūros vadovas](../retail-scenario.md) - Detalūs įgyvendinimo modeliai
- 📖 [Daugiagentiniai dizaino modeliai](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Kodo pavyzdžiai:**
- 🔗 [Azure OpenAI pokalbių pavyzdys](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG modelis
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agentų karkasas (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agentų orkestracija (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Daugiagentiniai pokalbiai

**Numatomas bendras darbo laikas:**
- Infrastruktūros diegimas: 15-25 minutės (✅ Baigta)
- Programų kūrimas: 80-120 valandų (🔨 Jūsų darbas)
- Testavimas ir optimizavimas: 15-25 valandos (🔨 Jūsų darbas)

## 🛠️ Trikčių šalinimas

### Dažnos problemos

#### 1. Azure OpenAI kvotos viršytos

```bash
# Patikrinkite dabartinį kvotos naudojimą
az cognitiveservices usage list --location eastus2

# Prašyti kvotos padidinimo
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps diegimas nepavyko

```bash
# Patikrinkite konteinerio programos žurnalus
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Paleiskite konteinerio programą iš naujo
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Paieškos paslaugos inicijavimas

```bash
# Patikrinkite paieškos paslaugos būseną
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Išbandykite paieškos paslaugos ryšį
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Diegimo patikrinimas

```bash
# Patikrinkite, ar visi ištekliai sukurti
az resource list \
  --resource-group myResourceGroup \
  --output table

# Patikrinkite išteklių būklę
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Saugumo aspektai

### Raktų valdymas
- Visi slapti duomenys saugomi Azure Key Vault (jei įjungta)
- Container Apps naudoja valdomą tapatybę autentifikacijai
- Saugyklos paskyros turi saugius numatytuosius nustatymus (tik HTTPS, nėra viešos prieigos prie blob)

### Tinklo saugumas
- Container Apps naudoja vidinį tinklą, kai įmanoma
- Paieškos paslauga sukonfigūruota su privačių galinių taškų parinktimi
- Cosmos DB sukonfigūruota su minimaliais būtinais leidimais

### RBAC konfigūracija
```bash
# Priskirkite reikalingus vaidmenis valdomai tapatybei
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Išlaidų optimizavimas

### Išlaidų įvertinimai (mėnesiniai, USD)

| Režimas | OpenAI | Container Apps | Paieška | Saugykla | Bendra suma |
|---------|--------|----------------|---------|----------|-------------|
| Minimalus | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standartinis | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Išlaidų stebėjimas

```bash
# Nustatyti biudžeto įspėjimus
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Atnaujinimai ir priežiūra

### Šablono atnaujinimai
- Versijuokite ARM šablono failus
- Pirmiausia išbandykite pakeitimus kūrimo aplinkoje
- Naudokite inkrementinio diegimo režimą atnaujinimams

### Išteklių atnaujinimai
```bash
# Atnaujinti su naujais parametrais
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Atsarginės kopijos ir atkūrimas
- Cosmos DB automatinės atsarginės kopijos įjungtos
- Key Vault minkštas ištrynimas įjungtas
- Container Apps versijos saugomos atkūrimui

## 📞 Pagalba

- **Šablono problemos**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure pagalba**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Bendruomenė**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Pasiruošę diegti savo daugiagentinį sprendimą?**

Pradėkite su: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->