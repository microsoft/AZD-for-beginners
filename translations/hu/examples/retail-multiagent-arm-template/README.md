# Kiskereskedelmi Többügynökös Megoldás - Infrastruktúra Sablon

**5. fejezet: Éles telepítési csomag**
- **📚 Kurzus kezdőlapja**: [AZD Kezdőknek](../../README.md)
- **📖 Kapcsolódó fejezet**: [5. fejezet: Többügynökös AI megoldások](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Forgatókönyv útmutató**: [Teljes architektúra](../retail-scenario.md)
- **🎯 Gyors telepítés**: [Egykattintásos telepítés](../../../../examples/retail-multiagent-arm-template)

> **⚠️ CSAK INFRASTRUKTÚRA SABLON**  
> Ez az ARM sablon **Azure erőforrásokat** telepít egy többügynökös rendszerhez.  
>  
> **Mi kerül telepítésre (15-25 perc):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, beágyazások 3 régióban)
> - ✅ AI keresési szolgáltatás (üres, készen áll az index létrehozására)
> - ✅ Konténeralkalmazások (helyőrző képek, készen állnak a kódodra)
> - ✅ Tárhely, Cosmos DB, Key Vault, Application Insights
>  
> **Mi NEM tartozik bele (fejlesztést igényel):**
> - ❌ Ügynök implementációs kód (Ügyfélügynök, Készletügynök)
> - ❌ Útvonal logika és API végpontok
> - ❌ Frontend chat UI
> - ❌ Keresési index sémák és adatfolyamatok
> - ❌ **Becsült fejlesztési idő: 80-120 óra**
>  
> **Használd ezt a sablont, ha:**
> - ✅ Azure infrastruktúrát szeretnél biztosítani egy többügynökös projekthez
> - ✅ Az ügynök implementációt külön szeretnéd fejleszteni
> - ✅ Éles infrastruktúra alapot keresel
>  
> **Ne használd, ha:**
> - ❌ Azonnal működő többügynökös demót vársz
> - ❌ Teljes alkalmazáskód példákat keresel

## Áttekintés

Ez a könyvtár egy átfogó Azure Resource Manager (ARM) sablont tartalmaz a többügynökös ügyfélszolgálati rendszer **infrastruktúra alapjának** telepítéséhez. A sablon minden szükséges Azure szolgáltatást biztosít, megfelelően konfigurálva és összekapcsolva, készen áll az alkalmazásfejlesztésre.

**Telepítés után:** Éles Azure infrastruktúra  
**A rendszer befejezéséhez szükséges:** Ügynökkód, frontend UI és adatkonfiguráció (lásd [Architektúra útmutató](../retail-scenario.md))

## 🎯 Mi kerül telepítésre

### Alapvető infrastruktúra (Telepítés utáni állapot)

✅ **Azure OpenAI Szolgáltatások** (Készen áll API hívásokra)
  - Elsődleges régió: GPT-4o telepítés (20K TPM kapacitás)
  - Másodlagos régió: GPT-4o-mini telepítés (10K TPM kapacitás)
  - Harmadlagos régió: Szövegbeágyazási modell (30K TPM kapacitás)
  - Értékelési régió: GPT-4o értékelő modell (15K TPM kapacitás)
  - **Állapot:** Teljesen működőképes - azonnal API hívásokat végezhet

✅ **Azure AI Keresés** (Üres - készen áll a konfigurációra)
  - Vektorkeresési képességek engedélyezve
  - Standard szint 1 partícióval, 1 replikával
  - **Állapot:** Szolgáltatás fut, de index létrehozása szükséges
  - **Szükséges lépés:** Hozd létre a keresési indexet a saját sémáddal

✅ **Azure Tárhely Fiók** (Üres - készen áll a feltöltésekre)
  - Blob konténerek: `documents`, `uploads`
  - Biztonságos konfiguráció (csak HTTPS, nincs nyilvános hozzáférés)
  - **Állapot:** Készen áll fájlok fogadására
  - **Szükséges lépés:** Töltsd fel a termékadataidat és dokumentumaidat

⚠️ **Konténeralkalmazások Környezet** (Helyőrző képek telepítve)
  - Ügynök útválasztó alkalmazás (nginx alapértelmezett kép)
  - Frontend alkalmazás (nginx alapértelmezett kép)
  - Automatikus skálázás konfigurálva (0-10 példány)
  - **Állapot:** Helyőrző konténerek futnak
  - **Szükséges lépés:** Építsd meg és telepítsd az ügynök alkalmazásaidat

✅ **Azure Cosmos DB** (Üres - készen áll az adatokra)
  - Adatbázis és konténer előre konfigurálva
  - Optimalizálva alacsony késleltetésű műveletekre
  - TTL engedélyezve automatikus tisztításhoz
  - **Állapot:** Készen áll chat történet tárolására

✅ **Azure Key Vault** (Opcionális - készen áll titkokra)
  - Soft delete engedélyezve
  - RBAC konfigurálva kezelt identitásokhoz
  - **Állapot:** Készen áll API kulcsok és kapcsolat karakterláncok tárolására

✅ **Application Insights** (Opcionális - aktív monitorozás)
  - Csatlakoztatva Log Analytics munkaterülethez
  - Egyedi metrikák és riasztások konfigurálva
  - **Állapot:** Készen áll az alkalmazásod telemetriájának fogadására

✅ **Dokumentum Intelligencia** (Készen áll API hívásokra)
  - S0 szint éles munkaterhelésekhez
  - **Állapot:** Készen áll feltöltött dokumentumok feldolgozására

✅ **Bing Keresési API** (Készen áll API hívásokra)
  - S1 szint valós idejű keresésekhez
  - **Állapot:** Készen áll webes keresési lekérdezésekre

### Telepítési módok

| Mód | OpenAI Kapacitás | Konténer Példányok | Keresési Szint | Tárhely Redundancia | Legjobb Felhasználás |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **Minimális** | 10K-20K TPM | 0-2 replikák | Alap | LRS (Helyi) | Fejlesztés/tesztelés, tanulás, koncepció igazolás |
| **Standard** | 30K-60K TPM | 2-5 replikák | Standard | ZRS (Zóna) | Éles, mérsékelt forgalom (<10K felhasználó) |
| **Prémium** | 80K-150K TPM | 5-10 replikák, zóna-redundáns | Prémium | GRS (Geo) | Vállalati, nagy forgalom (>10K felhasználó), 99.99% SLA |

**Költséghatás:**
- **Minimális → Standard:** ~4x költségnövekedés ($100-370/hó → $420-1,450/hó)
- **Standard → Prémium:** ~3x költségnövekedés ($420-1,450/hó → $1,150-3,500/hó)
- **Válassz az alapján:** Várható terhelés, SLA követelmények, költségvetési korlátok

**Kapacitás tervezés:**
- **TPM (Tokenek Per Perc):** Összesen minden modell telepítés között
- **Konténer Példányok:** Automatikus skálázási tartomány (min-max replikák)
- **Keresési Szint:** Hatással van a lekérdezési teljesítményre és az index méretkorlátokra

## 📋 Előfeltételek

### Szükséges Eszközök
1. **Azure CLI** (2.50.0 vagy újabb verzió)
   ```bash
   az --version  # Ellenőrizze a verziót
   az login      # Hitelesítés
   ```

2. **Aktív Azure előfizetés** Tulajdonos vagy Hozzájáruló hozzáféréssel
   ```bash
   az account show  # Ellenőrizze az előfizetést
   ```

### Szükséges Azure Kvóták

Telepítés előtt ellenőrizd a megfelelő kvótákat a célrégióidban:

```bash
# Ellenőrizze az Azure OpenAI elérhetőségét a régiójában
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Ellenőrizze az OpenAI kvótát (példa a gpt-4o-ra)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Ellenőrizze a Container Apps kvótát
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimálisan Szükséges Kvóták:**
- **Azure OpenAI:** 3-4 modell telepítés régiók között
  - GPT-4o: 20K TPM (Tokenek Per Perc)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Megjegyzés:** GPT-4o néhány régióban várólistán lehet - ellenőrizd [modell elérhetőség](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Konténeralkalmazások:** Kezelt környezet + 2-10 konténer példány
- **AI Keresés:** Standard szint (Alap nem elegendő vektorkereséshez)
- **Cosmos DB:** Standard biztosított átbocsátás

**Ha kvóta nem elegendő:**
1. Menj az Azure Portál → Kvóták → Növelés kérése
2. Vagy használd az Azure CLI-t:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Fontold meg alternatív régiókat elérhetőséggel

## 🚀 Gyors Telepítés

### 1. opció: Azure CLI használatával

```bash
# Klónozza vagy töltse le a sablonfájlokat
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Tegye végrehajthatóvá a telepítési szkriptet
chmod +x deploy.sh

# Telepítés alapértelmezett beállításokkal
./deploy.sh -g myResourceGroup

# Telepítés gyártási környezetbe prémium funkciókkal
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### 2. opció: Azure Portál használatával

[![Telepítés Azure-ra](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 3. opció: Azure CLI közvetlen használatával

```bash
# Hozzon létre erőforráscsoportot
az group create --name myResourceGroup --location eastus2

# Telepítse a sablont
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Telepítési Idővonal

### Mire számíthatsz

| Fázis | Időtartam | Mi történik |
|-------|----------|--------------||
| **Sablon Ellenőrzés** | 30-60 másodperc | Azure ellenőrzi az ARM sablon szintaxist és paramétereket |
| **Erőforrás Csoport Létrehozás** | 10-20 másodperc | Létrehozza az erőforrás csoportot (ha szükséges) |
| **OpenAI Telepítés** | 5-8 perc | Létrehozza 3-4 OpenAI fiókot és telepíti a modelleket |
| **Konténeralkalmazások** | 3-5 perc | Létrehozza a környezetet és telepíti a helyőrző konténereket |
| **Keresés és Tárhely** | 2-4 perc | AI keresési szolgáltatást és tárhely fiókokat biztosít |
| **Cosmos DB** | 2-3 perc | Létrehozza az adatbázist és konfigurálja a konténereket |
| **Monitorozási Beállítások** | 2-3 perc | Beállítja az Application Insights-t és Log Analytics-t |
| **RBAC Konfiguráció** | 1-2 perc | Konfigurálja a kezelt identitásokat és engedélyeket |
| **Teljes Telepítés** | **15-25 perc** | Teljes infrastruktúra készen áll |

**Telepítés után:**
- ✅ **Infrastruktúra Készen:** Minden Azure szolgáltatás biztosítva és fut
- ⏱️ **Alkalmazás Fejlesztés:** 80-120 óra (a te felelősséged)
- ⏱️ **Index Konfiguráció:** 15-30 perc (saját séma szükséges)
- ⏱️ **Adatfeltöltés:** Az adatkészlet méretétől függ
- ⏱️ **Tesztelés és Ellenőrzés:** 2-4 óra

---

## ✅ Telepítés Sikerességének Ellenőrzése

### 1. lépés: Erőforrások Ellenőrzése (2 perc)

```bash
# Ellenőrizze, hogy minden erőforrás sikeresen települt
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Várható:** Üres táblázat (minden erőforrás "Sikeres" állapotot mutat)

### 2. lépés: Azure OpenAI Telepítések Ellenőrzése (3 perc)

```bash
# Listázza az összes OpenAI fiókot
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Ellenőrizze a modell telepítéseket az elsődleges régióban
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Várható:** 
- 3-4 OpenAI fiók (elsődleges, másodlagos, harmadlagos, értékelési régiók)
- 1-2 modell telepítés fiókonként (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### 3. lépés: Infrastruktúra Végpontok Tesztelése (5 perc)

```bash
# Szerezze meg a konténer alkalmazás URL-jeit
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Tesztelje a router végpontot (helyőrző kép fog válaszolni)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Várható:** 
- Konténeralkalmazások "Futó" állapotot mutatnak
- Helyőrző nginx HTTP 200 vagy 404 választ ad (még nincs alkalmazáskód)

### 4. lépés: Azure OpenAI API Hozzáférés Ellenőrzése (3 perc)

```bash
# Szerezze meg az OpenAI végpontot és kulcsot
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Tesztelje a GPT-4o telepítést
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Várható:** JSON válasz chat befejezéssel (megerősíti, hogy az OpenAI működik)

### Mi működik és mi nem

**✅ Telepítés után működik:**
- Azure OpenAI modellek telepítve és API hívásokat fogadnak
- AI keresési szolgáltatás fut (üres, még nincs index)
- Konténeralkalmazások futnak (helyőrző nginx képek)
- Tárhely fiókok elérhetők és készen állnak feltöltésekre
- Cosmos DB készen áll adat műveletekre
- Application Insights gyűjti az infrastruktúra telemetriát
- Key Vault készen áll titkok tárolására

**❌ Még nem működik (Fejlesztést igényel):**
- Ügynök végpontok (még nincs alkalmazáskód telepítve)
- Chat funkció (frontend + backend implementáció szükséges)
- Keresési lekérdezések (még nincs keresési index létrehozva)
- Dokumentum feldolgozási folyamat (még nincs adat feltöltve)
- Egyedi telemetria (alkalmazás instrumentáció szükséges)

**Következő lépések:** Lásd [Telepítés utáni Konfiguráció](../../../../examples/retail-multiagent-arm-template) az alkalmazás fejlesztéséhez és telepítéséhez

---

## ⚙️ Konfigurációs Opciók

### Sablon Paraméterek

| Paraméter | Típus | Alapértelmezett | Leírás |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Minden erőforrás név előtagja |
| `location` | string | Erőforrás csoport helye | Elsődleges telepítési régió |
| `secondaryLocation` | string | "westus2" | Másodlagos régió több régiós telepítéshez |
| `tertiaryLocation` | string | "francecentral" | Régió beágyazási modellhez |
| `environmentName` | string | "dev" | Környezet megjelölés (fejlesztés/tesztelés/éles) |
| `deploymentMode` | string | "standard" | Telepítési konfiguráció (minimális/standard/prémium) |
| `enableMultiRegion` | bool | true | Több régiós telepítés engedélyezése |
| `enableMonitoring` | bool | true | Application Insights és naplózás engedélyezése |
| `enableSecurity` | bool | true | Key Vault és fokozott biztonság engedélyezése |

### Paraméterek Testreszabása

Szerkeszd az `azuredeploy.parameters.json` fájlt:

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

## 🏗️ Architektúra Áttekintés

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

## 📖 Telepítési Script Használata

A `deploy.sh` script interaktív telepítési élményt nyújt:

```bash
# Súgó megjelenítése
./deploy.sh --help

# Alapvető telepítés
./deploy.sh -g myResourceGroup

# Haladó telepítés egyedi beállításokkal
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Fejlesztési telepítés több régió nélkül
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Script Funkciók

- ✅ **Előfeltételek ellenőrzése** (Azure CLI, bejelentkezési állapot, sablon fájlok)
- ✅ **Erőforrás csoport kezelés** (létrehozza, ha nem létezik)
- ✅ **Sablon ellenőrzés** telepítés előtt
> **📝 Fontos:** Az infrastruktúra telepítve van, de az alkalmazáskódot még fejleszteni és telepíteni kell.

### 1. fázis: Ügynökalkalmazások fejlesztése (Az Ön felelőssége)

Az ARM sablon **üres Container Apps**-okat hoz létre helyőrző nginx képekkel. Önnek kell:

**Szükséges fejlesztések:**
1. **Ügynök implementáció** (30-40 óra)
   - Ügyfélszolgálati ügynök GPT-4o integrációval
   - Készletkezelő ügynök GPT-4o-mini integrációval
   - Ügynökirányítási logika

2. **Frontend fejlesztés** (20-30 óra)
   - Chat felület UI (React/Vue/Angular)
   - Fájl feltöltési funkció
   - Válaszok megjelenítése és formázása

3. **Backend szolgáltatások** (12-16 óra)
   - FastAPI vagy Express router
   - Hitelesítési middleware
   - Telemetria integráció

**Lásd:** [Architektúra útmutató](../retail-scenario.md) a részletes implementációs mintákért és kódpéldákért

### 2. fázis: AI keresési index konfigurálása (15-30 perc)

Hozzon létre egy keresési indexet, amely megfelel az adatmodelljének:

```bash
# Szerezze be a keresési szolgáltatás részleteit
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Hozzon létre indexet a saját séma alapján (példa)
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

**Erőforrások:**
- [AI keresési index séma tervezés](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vektorkeresés konfiguráció](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### 3. fázis: Adatok feltöltése (Időtartam változó)

Amint rendelkezésre állnak a termékadatok és dokumentumok:

```bash
# Szerezze be a tárhelyfiók adatait
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Töltse fel a dokumentumait
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Példa: Egyetlen fájl feltöltése
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### 4. fázis: Alkalmazások fejlesztése és telepítése (8-12 óra)

Amint elkészült az ügynökkód:

```bash
# 1. Hozzon létre Azure Container Registry-t (ha szükséges)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Építse meg és tolja fel az agent router képet
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Építse meg és tolja fel a frontend képet
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Frissítse a Container Apps-t a képeivel
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigurálja a környezeti változókat
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### 5. fázis: Az alkalmazás tesztelése (2-4 óra)

```bash
# Szerezze meg az alkalmazás URL-jét
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Tesztelje az ügynök végpontját (miután a kódot telepítették)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Ellenőrizze az alkalmazás naplóit
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Implementációs erőforrások

**Architektúra és tervezés:**
- 📖 [Teljes architektúra útmutató](../retail-scenario.md) - Részletes implementációs minták
- 📖 [Többügynökös tervezési minták](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Kódpéldák:**
- 🔗 [Azure OpenAI Chat példa](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG minta
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Ügynök keretrendszer (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Ügynökök összehangolása (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Többügynökös beszélgetések

**Becsült teljes időráfordítás:**
- Infrastruktúra telepítése: 15-25 perc (✅ Kész)
- Alkalmazásfejlesztés: 80-120 óra (🔨 Az Ön munkája)
- Tesztelés és optimalizálás: 15-25 óra (🔨 Az Ön munkája)

## 🛠️ Hibaelhárítás

### Gyakori problémák

#### 1. Azure OpenAI kvóta túllépve

```bash
# Ellenőrizze az aktuális kvóta használatát
az cognitiveservices usage list --location eastus2

# Kérjen kvóta növelést
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps telepítése sikertelen

```bash
# Ellenőrizze a konténer alkalmazás naplóit
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Indítsa újra a konténer alkalmazást
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Keresési szolgáltatás inicializálása

```bash
# Ellenőrizze a keresési szolgáltatás állapotát
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Tesztelje a keresési szolgáltatás csatlakozását
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Telepítés érvényesítése

```bash
# Ellenőrizze, hogy minden erőforrás létrehozva van-e
az resource list \
  --resource-group myResourceGroup \
  --output table

# Ellenőrizze az erőforrások állapotát
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Biztonsági szempontok

### Kulcskezelés
- Minden titok az Azure Key Vault-ban van tárolva (ha engedélyezve van)
- A Container Apps kezelt identitást használ hitelesítéshez
- A tárfiókok biztonságos alapértelmezésekkel rendelkeznek (csak HTTPS, nyilvános blob hozzáférés nincs)

### Hálózati biztonság
- A Container Apps lehetőség szerint belső hálózatot használ
- A keresési szolgáltatás privát végpont opcióval van konfigurálva
- A Cosmos DB minimális szükséges jogosultságokkal van beállítva

### RBAC konfiguráció
```bash
# Hozzárendelni a szükséges szerepköröket a kezelt identitáshoz
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Költségoptimalizálás

### Költségbecslések (havi, USD)

| Mód | OpenAI | Container Apps | Keresés | Tárhely | Teljes becsült |
|-----|--------|----------------|---------|---------|----------------|
| Minimális | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Prémium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Költségfigyelés

```bash
# Állítsa be a költségvetési figyelmeztetéseket
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Frissítések és karbantartás

### Sablonfrissítések
- Verziókezelje az ARM sablonfájlokat
- Először tesztelje a változtatásokat fejlesztési környezetben
- Használjon inkrementális telepítési módot a frissítésekhez

### Erőforrásfrissítések
```bash
# Frissítés új paraméterekkel
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Biztonsági mentés és helyreállítás
- Cosmos DB automatikus biztonsági mentés engedélyezve
- Key Vault soft delete engedélyezve
- Container App verziók megőrzése visszaállításhoz

## 📞 Támogatás

- **Sablonproblémák**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure támogatás**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Közösség**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Készen áll a többügynökös megoldás telepítésére?**

Kezdje ezzel: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->