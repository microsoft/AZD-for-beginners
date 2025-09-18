<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T10:18:32+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "sk"
}
-->
# Retail Multi-Agent Solution - Nasadenie ARM šablóny

**Kapitola 5: Produkčný balík nasadenia**
- **📚 Domov kurzu**: [AZD Pre Začiatočníkov](../../README.md)
- **📖 Súvisiaca kapitola**: [Kapitola 5: Multi-Agent AI Riešenia](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenár sprievodca**: [Kompletná implementácia](../retail-scenario.md)
- **🎯 Rýchle nasadenie**: [Jedno-klikové nasadenie](../../../../examples/retail-multiagent-arm-template)

Tento adresár obsahuje kompletnú Azure Resource Manager (ARM) šablónu na nasadenie maloobchodného Multi-Agent Customer Support riešenia, poskytujúcu infraštruktúru ako kód pre celú architektúru.

## 🎯 Čo sa nasadí

### Základná infraštruktúra
- **Azure OpenAI Services** (Multi-region pre vysokú dostupnosť)
  - Primárny región: GPT-4o pre zákazníckeho agenta
  - Sekundárny región: GPT-4o-mini pre agenta inventára  
  - Tretí región: Model textových embeddingov
  - Evaluačný región: GPT-4o hodnotiaci model
- **Azure AI Search** s funkciami vektorového vyhľadávania
- **Azure Storage Account** s blob kontajnermi pre dokumenty a nahrávky
- **Azure Container Apps Environment** s automatickým škálovaním
- **Container Apps** pre router agentov a frontend
- **Azure Cosmos DB** pre ukladanie histórie chatu
- **Azure Key Vault** pre správu tajomstiev (voliteľné)
- **Application Insights** a Log Analytics pre monitorovanie (voliteľné)
- **Document Intelligence** pre spracovanie dokumentov
- **Bing Search API** pre získavanie informácií v reálnom čase

### Režimy nasadenia

| Režim | Popis | Použitie | Zdroje |
|-------|-------|----------|--------|
| **Minimal** | Nákladovo optimalizované základné nasadenie | Vývoj, testovanie | Základné SKUs, jeden región, znížená kapacita |
| **Standard** | Vyvážené nasadenie pre produkčné pracovné zaťaženie | Produkcia, stredná škála | Štandardné SKUs, multi-region, štandardná kapacita |
| **Premium** | Výkonné, podnikové nasadenie | Podnik, vysoká škála | Prémiové SKUs, multi-region, vysoká kapacita |

## 📋 Predpoklady

1. **Azure CLI** nainštalované a nakonfigurované
2. **Aktívne Azure predplatné** s dostatočnými kvótami
3. **Príslušné oprávnenia** na vytváranie zdrojov v cieľovom predplatnom
4. **Kvóty zdrojov** pre:
   - Azure OpenAI (skontrolujte regionálnu dostupnosť)
   - Container Apps (líši sa podľa regiónu)
   - AI Search (odporúčaný štandardný tier alebo vyšší)

## 🚀 Rýchle nasadenie

### Možnosť 1: Použitie Azure CLI

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

### Možnosť 2: Použitie Azure Portálu

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Možnosť 3: Priame použitie Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Možnosti konfigurácie

### Parametre šablóny

| Parameter | Typ | Predvolené | Popis |
|-----------|-----|------------|-------|
| `projectName` | string | "retail" | Prefix pre všetky názvy zdrojov |
| `location` | string | Lokácia skupiny zdrojov | Primárny región nasadenia |
| `secondaryLocation` | string | "westus2" | Sekundárny región pre multi-region nasadenie |
| `tertiaryLocation` | string | "francecentral" | Región pre embedding model |
| `environmentName` | string | "dev" | Označenie prostredia (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurácia nasadenia (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Povoliť multi-region nasadenie |
| `enableMonitoring` | bool | true | Povoliť Application Insights a logovanie |
| `enableSecurity` | bool | true | Povoliť Key Vault a rozšírenú bezpečnosť |

### Prispôsobenie parametrov

Upravte `azuredeploy.parameters.json`:

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

## 🏗️ Prehľad architektúry

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

## 📖 Použitie skriptu na nasadenie

Skript `deploy.sh` poskytuje interaktívne nasadenie:

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

### Funkcie skriptu

- ✅ **Validácia predpokladov** (Azure CLI, stav prihlásenia, súbory šablóny)
- ✅ **Správa skupiny zdrojov** (vytvorí, ak neexistuje)
- ✅ **Validácia šablóny** pred nasadením
- ✅ **Monitorovanie pokroku** s farebným výstupom
- ✅ **Zobrazenie výstupov nasadenia**
- ✅ **Pokyny po nasadení**

## 📊 Monitorovanie nasadenia

### Kontrola stavu nasadenia

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

### Výstupy nasadenia

Po úspešnom nasadení sú dostupné nasledujúce výstupy:

- **Frontend URL**: Verejný endpoint pre webové rozhranie
- **Router URL**: API endpoint pre router agentov
- **OpenAI Endpoints**: Primárne a sekundárne OpenAI endpointy
- **Search Service**: Endpoint služby Azure AI Search
- **Storage Account**: Názov úložného účtu pre dokumenty
- **Key Vault**: Názov Key Vault (ak je povolený)
- **Application Insights**: Názov monitorovacej služby (ak je povolená)

## 🔧 Konfigurácia po nasadení

### 1. Konfigurácia indexu vyhľadávania

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

### 2. Nahratie počiatočných dát

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testovanie endpointov agentov

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigurácia Container Apps

ARM šablóna nasadí zástupné kontajnerové obrazy. Na nasadenie skutočného kódu agentov:

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

## 🛠️ Riešenie problémov

### Bežné problémy

#### 1. Prekročená kvóta Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Zlyhanie nasadenia Container Apps

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

#### 3. Inicializácia služby vyhľadávania

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validácia nasadenia

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

## 🔐 Bezpečnostné úvahy

### Správa kľúčov
- Všetky tajomstvá sú uložené v Azure Key Vault (ak je povolený)
- Container apps používajú spravovanú identitu na autentifikáciu
- Účty úložiska majú bezpečné predvolené nastavenia (iba HTTPS, žiadny verejný prístup k blobom)

### Sieťová bezpečnosť
- Container apps používajú interné sieťovanie, kde je to možné
- Služba vyhľadávania je nakonfigurovaná s možnosťou privátnych endpointov
- Cosmos DB je nakonfigurovaná s minimálnymi potrebnými oprávneniami

### Konfigurácia RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimalizácia nákladov

### Odhady nákladov (Mesačne, USD)

| Režim | OpenAI | Container Apps | Search | Storage | Celkový odhad |
|-------|--------|----------------|--------|---------|---------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorovanie nákladov

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

## 🔄 Aktualizácie a údržba

### Aktualizácie šablóny
- Verziujte súbory ARM šablóny
- Testujte zmeny najskôr v prostredí vývoja
- Používajte režim inkrementálneho nasadenia pre aktualizácie

### Aktualizácie zdrojov
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Zálohovanie a obnova
- Automatické zálohovanie Cosmos DB je povolené
- Soft delete pre Key Vault je povolené
- Revízie kontajnerových aplikácií sú udržiavané pre rollback

## 📞 Podpora

- **Problémy so šablónou**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Podpora Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunita**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Pripravení nasadiť vaše multi-agent riešenie?**

Začnite s: `./deploy.sh -g myResourceGroup`

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.