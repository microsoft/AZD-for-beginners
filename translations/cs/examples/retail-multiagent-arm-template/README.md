<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T10:18:03+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "cs"
}
-->
# Maloobchodní řešení s více agenty - Nasazení pomocí ARM šablony

**Kapitola 5: Balíček pro nasazení do produkce**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Související kapitola**: [Kapitola 5: Pokročilá řešení s více agenty](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Průvodce scénářem**: [Kompletní implementace](../retail-scenario.md)
- **🎯 Rychlé nasazení**: [Jedno kliknutí pro nasazení](../../../../examples/retail-multiagent-arm-template)

Tento adresář obsahuje kompletní šablonu Azure Resource Manager (ARM) pro nasazení maloobchodního řešení zákaznické podpory s více agenty, poskytující infrastrukturu jako kód pro celou architekturu.

## 🎯 Co se nasazuje

### Základní infrastruktura
- **Azure OpenAI Services** (více regionů pro vysokou dostupnost)
  - Primární region: GPT-4o pro zákaznického agenta
  - Sekundární region: GPT-4o-mini pro agenta inventáře  
  - Terciární region: Model pro textové vektory
  - Evaluační region: Model hodnotící GPT-4o
- **Azure AI Search** s možnostmi vektorového vyhledávání
- **Azure Storage Account** s blob kontejnery pro dokumenty a nahrávky
- **Azure Container Apps Environment** s automatickým škálováním
- **Container Apps** pro směrovač agentů a frontend
- **Azure Cosmos DB** pro ukládání historie chatu
- **Azure Key Vault** pro správu tajných klíčů (volitelné)
- **Application Insights** a Log Analytics pro monitorování (volitelné)
- **Document Intelligence** pro zpracování dokumentů
- **Bing Search API** pro získávání aktuálních informací

### Režimy nasazení

| Režim | Popis | Použití | Zdroje |
|-------|-------|---------|--------|
| **Minimal** | Nákladově optimalizované základní nasazení | Vývoj, testování | Základní SKUs, jeden region, snížená kapacita |
| **Standard** | Vyvážené nasazení pro produkční zátěž | Produkce, střední škála | Standardní SKUs, více regionů, standardní kapacita |
| **Premium** | Vysoce výkonné nasazení pro podniky | Podniky, vysoká škála | Prémiové SKUs, více regionů, vysoká kapacita |

## 📋 Předpoklady

1. **Azure CLI** nainstalované a nakonfigurované
2. **Aktivní Azure předplatné** s dostatečnými kvótami
3. **Odpovídající oprávnění** pro vytváření zdrojů v cílovém předplatném
4. **Kvóty zdrojů** pro:
   - Azure OpenAI (ověřte dostupnost v regionech)
   - Container Apps (liší se podle regionu)
   - AI Search (doporučen standardní tarif nebo vyšší)

## 🚀 Rychlé nasazení

### Možnost 1: Použití Azure CLI

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

### Možnost 2: Použití Azure Portálu

[![Nasadit do Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Možnost 3: Přímé použití Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Možnosti konfigurace

### Parametry šablony

| Parametr | Typ | Výchozí hodnota | Popis |
|----------|-----|-----------------|-------|
| `projectName` | string | "retail" | Prefix pro všechny názvy zdrojů |
| `location` | string | Umístění skupiny zdrojů | Primární region nasazení |
| `secondaryLocation` | string | "westus2" | Sekundární region pro nasazení ve více regionech |
| `tertiaryLocation` | string | "francecentral" | Region pro model vektorů |
| `environmentName` | string | "dev" | Označení prostředí (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurace nasazení (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Povolit nasazení ve více regionech |
| `enableMonitoring` | bool | true | Povolit Application Insights a logování |
| `enableSecurity` | bool | true | Povolit Key Vault a zvýšenou bezpečnost |

### Přizpůsobení parametrů

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

## 🏗️ Přehled architektury

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

## 📖 Použití nasazovacího skriptu

Skript `deploy.sh` poskytuje interaktivní zážitek z nasazení:

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

### Funkce skriptu

- ✅ **Ověření předpokladů** (Azure CLI, stav přihlášení, soubory šablon)
- ✅ **Správa skupin zdrojů** (vytvoří, pokud neexistuje)
- ✅ **Ověření šablony** před nasazením
- ✅ **Monitorování průběhu** s barevným výstupem
- ✅ **Zobrazení výstupů nasazení**
- ✅ **Pokyny po nasazení**

## 📊 Monitorování nasazení

### Kontrola stavu nasazení

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

### Výstupy nasazení

Po úspěšném nasazení jsou k dispozici následující výstupy:

- **Frontend URL**: Veřejný koncový bod pro webové rozhraní
- **Router URL**: API koncový bod pro směrovač agentů
- **OpenAI Endpoints**: Primární a sekundární koncové body služby OpenAI
- **Search Service**: Koncový bod služby Azure AI Search
- **Storage Account**: Název účtu úložiště pro dokumenty
- **Key Vault**: Název Key Vault (pokud je povoleno)
- **Application Insights**: Název monitorovací služby (pokud je povoleno)

## 🔧 Konfigurace po nasazení

### 1. Nastavení indexu vyhledávání

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

### 2. Nahrání počátečních dat

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testování koncových bodů agentů

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigurace Container Apps

ARM šablona nasazuje zástupné obrazy kontejnerů. Pro nasazení skutečného kódu agentů:

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

## 🛠️ Řešení problémů

### Běžné problémy

#### 1. Překročení kvóty Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Selhání nasazení Container Apps

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

#### 3. Inicializace služby vyhledávání

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Ověření nasazení

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

## 🔐 Bezpečnostní úvahy

### Správa klíčů
- Všechny tajné klíče jsou uloženy v Azure Key Vault (pokud je povoleno)
- Container Apps používají spravovanou identitu pro autentizaci
- Účty úložiště mají zabezpečené výchozí nastavení (pouze HTTPS, žádný veřejný přístup k blobům)

### Síťová bezpečnost
- Container Apps používají interní síť, kde je to možné
- Služba vyhledávání je nakonfigurována s možností privátních koncových bodů
- Cosmos DB je nakonfigurována s minimálními potřebnými oprávněními

### Konfigurace RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimalizace nákladů

### Odhady nákladů (měsíčně, USD)

| Režim | OpenAI | Container Apps | Search | Storage | Celkem odhad. |
|-------|--------|----------------|--------|---------|---------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorování nákladů

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

## 🔄 Aktualizace a údržba

### Aktualizace šablony
- Verzujte soubory ARM šablon
- Testujte změny nejprve v prostředí pro vývoj
- Používejte režim inkrementálního nasazení pro aktualizace

### Aktualizace zdrojů
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Zálohování a obnova
- Automatické zálohování Cosmos DB je povoleno
- Funkce soft delete v Key Vault je povolena
- Revidování kontejnerových aplikací umožňuje návrat zpět

## 📞 Podpora

- **Problémy se šablonou**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Podpora Azure**: [Portál podpory Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunita**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Připraveni nasadit své řešení s více agenty?**

Začněte s: `./deploy.sh -g myResourceGroup`

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.