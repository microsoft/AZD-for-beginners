<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T10:17:30+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "hu"
}
-->
# Retail Multi-Agent Solution - ARM Template Telepítés

**5. fejezet: Éles telepítési csomag**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Kapcsolódó fejezet**: [5. fejezet: Többügynökös AI megoldások](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Forgatókönyv útmutató**: [Teljes megvalósítás](../retail-scenario.md)
- **🎯 Gyors telepítés**: [Egykattintásos telepítés](../../../../examples/retail-multiagent-arm-template)

Ez a könyvtár egy teljes Azure Resource Manager (ARM) sablont tartalmaz a kiskereskedelmi Többügynökös Ügyfélszolgálati Megoldás telepítéséhez, amely kód formájában biztosítja az infrastruktúrát az egész architektúrához.

## 🎯 Mi kerül telepítésre

### Alapvető infrastruktúra
- **Azure OpenAI Szolgáltatások** (Több régió a magas rendelkezésre állás érdekében)
  - Elsődleges régió: GPT-4o az Ügyfélszolgálati ügynök számára
  - Másodlagos régió: GPT-4o-mini a Készletkezelő ügynök számára  
  - Harmadlagos régió: Szövegbeágyazási modell
  - Értékelési régió: GPT-4o értékelő modell
- **Azure AI Search** vektorkeresési képességekkel
- **Azure Storage Account** blob tárolókkal dokumentumokhoz és feltöltésekhez
- **Azure Container Apps Környezet** automatikus skálázással
- **Container Apps** az ügynök routerhez és frontendhez
- **Azure Cosmos DB** a csevegési előzmények tárolásához
- **Azure Key Vault** titkok kezeléséhez (opcionális)
- **Application Insights** és Log Analytics a monitorozáshoz (opcionális)
- **Document Intelligence** dokumentumfeldolgozáshoz
- **Bing Search API** valós idejű információkhoz

### Telepítési módok

| Mód | Leírás | Felhasználási eset | Erőforrások |
|-----|--------|--------------------|-------------|
| **Minimal** | Költséghatékony alaptelepítés | Fejlesztés, tesztelés | Alapvető SKUk, egy régió, csökkentett kapacitás |
| **Standard** | Kiegyensúlyozott telepítés éles munkaterhelésekhez | Éles, közepes skála | Standard SKUk, több régió, normál kapacitás |
| **Premium** | Nagy teljesítményű, vállalati szintű telepítés | Vállalati, nagy skála | Prémium SKUk, több régió, nagy kapacitás |

## 📋 Előfeltételek

1. **Azure CLI** telepítve és konfigurálva
2. **Aktív Azure előfizetés** elegendő kvótával
3. **Megfelelő jogosultságok** az erőforrások létrehozásához a cél előfizetésben
4. **Erőforrás kvóták**:
   - Azure OpenAI (ellenőrizze a regionális elérhetőséget)
   - Container Apps (régiónként eltérő)
   - AI Search (standard szint vagy magasabb ajánlott)

## 🚀 Gyors telepítés

### 1. opció: Azure CLI használata

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### 2. opció: Azure Portál használata

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 3. opció: Közvetlen Azure CLI használata

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Konfigurációs lehetőségek

### Sablon paraméterek

| Paraméter | Típus | Alapértelmezett | Leírás |
|-----------|-------|-----------------|--------|
| `projectName` | string | "retail" | Az összes erőforrás nevének előtagja |
| `location` | string | Erőforráscsoport helye | Elsődleges telepítési régió |
| `secondaryLocation` | string | "westus2" | Másodlagos régió több régiós telepítéshez |
| `tertiaryLocation` | string | "francecentral" | Régió a beágyazási modellhez |
| `environmentName` | string | "dev" | Környezet megjelölése (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Telepítési konfiguráció (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Több régiós telepítés engedélyezése |
| `enableMonitoring` | bool | true | Application Insights és naplózás engedélyezése |
| `enableSecurity` | bool | true | Key Vault és fokozott biztonság engedélyezése |

### Paraméterek testreszabása

Szerkessze az `azuredeploy.parameters.json` fájlt:

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

## 🏗️ Architektúra áttekintése

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

## 📖 Telepítési szkript használata

A `deploy.sh` szkript interaktív telepítési élményt nyújt:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Szkript funkciók

- ✅ **Előfeltételek ellenőrzése** (Azure CLI, bejelentkezési állapot, sablonfájlok)
- ✅ **Erőforráscsoport kezelése** (létrehozza, ha nem létezik)
- ✅ **Sablon ellenőrzése** telepítés előtt
- ✅ **Haladás figyelése** színes kimenettel
- ✅ **Telepítési eredmények** megjelenítése
- ✅ **Telepítés utáni útmutatás**

## 📊 Telepítés monitorozása

### Telepítési állapot ellenőrzése

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Telepítési eredmények

Sikeres telepítés után az alábbi eredmények érhetők el:

- **Frontend URL**: Nyilvános végpont a webes felülethez
- **Router URL**: API végpont az ügynök routerhez
- **OpenAI végpontok**: Elsődleges és másodlagos OpenAI szolgáltatási végpontok
- **Keresési szolgáltatás**: Azure AI Search szolgáltatási végpont
- **Tárolófiók**: Dokumentumok tárolására szolgáló tárolófiók neve
- **Key Vault**: Key Vault neve (ha engedélyezve van)
- **Application Insights**: Monitorozási szolgáltatás neve (ha engedélyezve van)

## 🔧 Telepítés utáni konfiguráció

### 1. Keresési index konfigurálása

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Kezdeti adatok feltöltése

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Ügynök végpontok tesztelése

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Container Apps konfigurálása

Az ARM sablon helyőrző konténerképeket telepít. Az ügynök kódjának telepítéséhez:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Hibakeresés

### Gyakori problémák

#### 1. Azure OpenAI kvóta túllépése

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps telepítés sikertelen

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Keresési szolgáltatás inicializálása

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Telepítés ellenőrzése

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Biztonsági szempontok

### Kulcskezelés
- Minden titok az Azure Key Vault-ban van tárolva (ha engedélyezve van)
- A konténeralkalmazások kezelt identitást használnak az autentikációhoz
- A tárolófiókok biztonságos alapértelmezésekkel rendelkeznek (csak HTTPS, nincs nyilvános blob hozzáférés)

### Hálózati biztonság
- A konténeralkalmazások lehetőség szerint belső hálózatot használnak
- A keresési szolgáltatás privát végpontokkal van konfigurálva
- A Cosmos DB minimális szükséges jogosultságokkal van konfigurálva

### RBAC konfiguráció
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Költségoptimalizálás

### Költségbecslések (havi, USD)

| Mód | OpenAI | Container Apps | Search | Storage | Összes becsült |
|-----|--------|----------------|--------|---------|----------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Költségfigyelés

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Frissítések és karbantartás

### Sablon frissítések
- Verziókezelje az ARM sablonfájlokat
- Tesztelje a változtatásokat először fejlesztési környezetben
- Használjon inkrementális telepítési módot a frissítésekhez

### Erőforrás frissítések
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Biztonsági mentés és helyreállítás
- Cosmos DB automatikus biztonsági mentés engedélyezve
- Key Vault soft delete engedélyezve
- Konténeralkalmazás verziók megőrzése visszaállításhoz

## 📞 Támogatás

- **Sablon problémák**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure támogatás**: [Azure Támogatási Portál](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Közösség**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Készen áll a többügynökös megoldás telepítésére?**

Kezdje ezzel: `./deploy.sh -g myResourceGroup`

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.