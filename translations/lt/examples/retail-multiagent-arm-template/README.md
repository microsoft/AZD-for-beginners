<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T14:24:38+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "lt"
}
-->
# Mažmeninės prekybos daugiaveikės agentų sprendimas - ARM šablono diegimas

**5 skyrius: Produkcijos diegimo paketas**
- **📚 Kurso pagrindinis puslapis**: [AZD pradedantiesiems](../../README.md)
- **📖 Susijęs skyrius**: [5 skyrius: Pažangūs daugiaveikės AI sprendimai](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenarijaus vadovas**: [Pilnas įgyvendinimas](../retail-scenario.md)
- **🎯 Greitas diegimas**: [Vieno paspaudimo diegimas](../../../../examples/retail-multiagent-arm-template)

Šiame kataloge yra pilnas „Azure Resource Manager“ (ARM) šablonas, skirtas mažmeninės prekybos daugiaveikės klientų aptarnavimo sprendimo diegimui, pateikiantis infrastruktūrą kaip kodą visai architektūrai.

## 🎯 Kas bus įdiegta

### Pagrindinė infrastruktūra
- **Azure OpenAI paslaugos** (daug regionų, siekiant užtikrinti aukštą prieinamumą)
  - Pagrindinis regionas: GPT-4o klientų agentui
  - Antrinis regionas: GPT-4o-mini inventoriaus agentui  
  - Tretinis regionas: Teksto įterpimo modelis
  - Vertinimo regionas: GPT-4o vertinimo modelis
- **Azure AI paieška** su vektorinės paieškos galimybėmis
- **Azure saugojimo paskyra** su blob konteineriais dokumentams ir įkėlimams
- **Azure konteinerių programų aplinka** su automatinio mastelio keitimu
- **Konteinerių programos** agentų maršrutizatoriui ir sąsajai
- **Azure Cosmos DB** pokalbių istorijos saugojimui
- **Azure Key Vault** slaptažodžių valdymui (pasirinktinai)
- **Application Insights** ir Log Analytics stebėjimui (pasirinktinai)
- **Dokumentų intelektas** dokumentų apdorojimui
- **Bing paieškos API** realaus laiko informacijai

### Diegimo režimai

| Režimas | Aprašymas | Naudojimo atvejis | Ištekliai |
|--------|-----------|-------------------|-----------|
| **Minimalus** | Optimizuotas mažoms sąnaudoms | Kūrimas, testavimas | Baziniai SKUs, vienas regionas, sumažinta talpa |
| **Standartinis** | Subalansuotas diegimas produkcijai | Produkcija, vidutinė apimtis | Standartiniai SKUs, daug regionų, standartinė talpa |
| **Premium** | Aukštos kokybės, įmonės lygio diegimas | Įmonė, didelė apimtis | Premium SKUs, daug regionų, didelė talpa |

## 📋 Būtinos sąlygos

1. **Įdiegta ir sukonfigūruota Azure CLI**
2. **Aktyvi Azure prenumerata** su pakankamais kvotais
3. **Tinkami leidimai** kurti išteklius tikslinėje prenumeratoje
4. **Išteklių kvotos**:
   - Azure OpenAI (patikrinkite regioninį prieinamumą)
   - Konteinerių programos (skiriasi pagal regioną)
   - AI paieška (rekomenduojama standartinė arba aukštesnė pakopa)

## 🚀 Greitas diegimas

### 1 variantas: Naudojant Azure CLI

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

### 2 variantas: Naudojant Azure portalą

[![Diegti į Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### 3 variantas: Naudojant tiesiogiai Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Konfigūracijos parinktys

### Šablono parametrai

| Parametras | Tipas | Numatytasis | Aprašymas |
|------------|-------|-------------|-----------|
| `projectName` | string | "retail" | Visų išteklių pavadinimų priešdėlis |
| `location` | string | Išteklių grupės vieta | Pagrindinis diegimo regionas |
| `secondaryLocation` | string | "westus2" | Antrinis regionas daug regionų diegimui |
| `tertiaryLocation` | string | "francecentral" | Regionas įterpimo modeliui |
| `environmentName` | string | "dev" | Aplinkos paskirtis (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Diegimo konfigūracija (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Įjungti daug regionų diegimą |
| `enableMonitoring` | bool | true | Įjungti Application Insights ir žurnalų stebėjimą |
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

### Scenarijaus funkcijos

- ✅ **Būtinų sąlygų patikrinimas** (Azure CLI, prisijungimo būsena, šablono failai)
- ✅ **Išteklių grupės valdymas** (sukuria, jei neegzistuoja)
- ✅ **Šablono patikrinimas** prieš diegimą
- ✅ **Progreso stebėjimas** su spalvotu išvestimi
- ✅ **Diegimo išvestis** rodoma
- ✅ **Po diegimo gairės**

## 📊 Diegimo stebėjimas

### Patikrinkite diegimo būseną

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

### Diegimo išvestis

Po sėkmingo diegimo bus pasiekiami šie rezultatai:

- **Sąsajos URL**: Viešasis žiniatinklio sąsajos galinis taškas
- **Maršrutizatoriaus URL**: API galinis taškas agentų maršrutizatoriui
- **OpenAI galiniai taškai**: Pagrindinis ir antrinis OpenAI paslaugų galiniai taškai
- **Paieškos paslauga**: Azure AI paieškos paslaugos galinis taškas
- **Saugojimo paskyra**: Dokumentų saugojimo paskyros pavadinimas
- **Key Vault**: Key Vault pavadinimas (jei įjungta)
- **Application Insights**: Stebėjimo paslaugos pavadinimas (jei įjungta)

## 🔧 Po diegimo konfigūracija

### 1. Konfigūruokite paieškos indeksą

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

### 2. Įkelkite pradinius duomenis

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testuokite agentų galinius taškus

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigūruokite konteinerių programas

ARM šablonas diegia vietos rezervavimo konteinerių vaizdus. Norėdami įdiegti tikrąjį agentų kodą:

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

## 🛠️ Trikčių šalinimas

### Dažnos problemos

#### 1. Azure OpenAI kvota viršyta

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Konteinerių programų diegimas nepavyko

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

#### 3. Paieškos paslaugos inicializavimas

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Diegimo patikrinimas

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

## 🔐 Saugumo aspektai

### Raktų valdymas
- Visi slaptažodžiai saugomi Azure Key Vault (jei įjungta)
- Konteinerių programos naudoja valdomą tapatybę autentifikacijai
- Saugojimo paskyros turi saugius numatytuosius nustatymus (tik HTTPS, nėra viešo blob prieigos)

### Tinklo saugumas
- Konteinerių programos naudoja vidinį tinklą, kai įmanoma
- Paieškos paslauga sukonfigūruota su privačių galinių taškų parinktimi
- Cosmos DB sukonfigūruota su minimaliais būtinais leidimais

### RBAC konfigūracija
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Sąnaudų optimizavimas

### Sąnaudų įvertinimai (mėnesiniai, USD)

| Režimas | OpenAI | Konteinerių programos | Paieška | Saugojimas | Bendras įvertinimas |
|--------|--------|-----------------------|--------|-----------|---------------------|
| Minimalus | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standartinis | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Sąnaudų stebėjimas

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

## 🔄 Atnaujinimai ir priežiūra

### Šablono atnaujinimai
- Versijuokite ARM šablono failus
- Pirmiausia testuokite pakeitimus kūrimo aplinkoje
- Naudokite inkrementinio diegimo režimą atnaujinimams

### Išteklių atnaujinimai
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Atsarginės kopijos ir atkūrimas
- Cosmos DB automatinės atsarginės kopijos įjungtos
- Key Vault minkštas ištrynimas įjungtas
- Konteinerių programų versijos saugomos atsarginėms kopijoms

## 📞 Pagalba

- **Šablono problemos**: [GitHub problemos](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure pagalba**: [Azure pagalbos portalas](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Bendruomenė**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Pasiruošę diegti savo daugiaveikės agentų sprendimą?**

Pradėkite su: `./deploy.sh -g myResourceGroup`

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, kylančius dėl šio vertimo naudojimo.