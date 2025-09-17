<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T23:41:53+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "da"
}
-->
# Retail Multi-Agent Solution - ARM Template Deployment

**Kapitel 5: Produktionsimplementeringspakke**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Relateret kapitel**: [Kapitel 5: Multi-Agent AI-løsninger](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenarieguide**: [Komplet implementering](../retail-scenario.md)
- **🎯 Hurtig implementering**: [One-Click Deployment](../../../../examples/retail-multiagent-arm-template)

Denne mappe indeholder en komplet Azure Resource Manager (ARM)-skabelon til implementering af detail Multi-Agent Customer Support Solution, som leverer infrastruktur som kode for hele arkitekturen.

## 🎯 Hvad bliver implementeret

### Kerneinfrastruktur
- **Azure OpenAI Services** (Multi-region for høj tilgængelighed)
  - Primær region: GPT-4o til kundeagent
  - Sekundær region: GPT-4o-mini til lageragent  
  - Tertiær region: Tekstindlejringsmodel
  - Evalueringsregion: GPT-4o grader-model
- **Azure AI Search** med vektorsøgningsfunktioner
- **Azure Storage Account** med blob-containere til dokumenter og uploads
- **Azure Container Apps Environment** med auto-skalering
- **Container Apps** til agent-router og frontend
- **Azure Cosmos DB** til lagring af chat-historik
- **Azure Key Vault** til hemmelighedshåndtering (valgfrit)
- **Application Insights** og Log Analytics til overvågning (valgfrit)
- **Document Intelligence** til dokumentbehandling
- **Bing Search API** til realtidsinformation

### Implementeringsmodi

| Mode | Beskrivelse | Anvendelse | Ressourcer |
|------|-------------|------------|------------|
| **Minimal** | Omkostningsoptimeret grundlæggende implementering | Udvikling, test | Basis-SKUs, enkelt region, reduceret kapacitet |
| **Standard** | Balanceret implementering til produktionsarbejdsbelastninger | Produktion, moderat skala | Standard-SKUs, multi-region, standard kapacitet |
| **Premium** | Højtydende, virksomhedsklar implementering | Virksomhed, stor skala | Premium-SKUs, multi-region, høj kapacitet |

## 📋 Forudsætninger

1. **Azure CLI** installeret og konfigureret
2. **Aktivt Azure-abonnement** med tilstrækkelige kvoter
3. **Passende tilladelser** til at oprette ressourcer i det målrettede abonnement
4. **Ressourcekvoter** for:
   - Azure OpenAI (tjek regional tilgængelighed)
   - Container Apps (varierer efter region)
   - AI Search (standardniveau eller højere anbefales)

## 🚀 Hurtig implementering

### Mulighed 1: Brug Azure CLI

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

### Mulighed 2: Brug Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Mulighed 3: Brug Azure CLI direkte

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Konfigurationsmuligheder

### Skabelonparametre

| Parameter | Type | Standard | Beskrivelse |
|-----------|------|----------|-------------|
| `projectName` | string | "retail" | Præfiks for alle ressourcenavne |
| `location` | string | Ressourcegruppens placering | Primær implementeringsregion |
| `secondaryLocation` | string | "westus2" | Sekundær region for multi-region implementering |
| `tertiaryLocation` | string | "francecentral" | Region for indlejringsmodel |
| `environmentName` | string | "dev" | Miljøbetegnelse (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Implementeringskonfiguration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktiver multi-region implementering |
| `enableMonitoring` | bool | true | Aktiver Application Insights og logning |
| `enableSecurity` | bool | true | Aktiver Key Vault og forbedret sikkerhed |

### Tilpasning af parametre

Rediger `azuredeploy.parameters.json`:

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

## 🏗️ Arkitekturoversigt

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

## 📖 Brug af implementeringsscript

`deploy.sh`-scriptet giver en interaktiv implementeringsoplevelse:

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

### Scriptfunktioner

- ✅ **Validering af forudsætninger** (Azure CLI, loginstatus, skabelonfiler)
- ✅ **Håndtering af ressourcegrupper** (opretter, hvis den ikke findes)
- ✅ **Skabelonvalidering** før implementering
- ✅ **Overvågning af fremskridt** med farvet output
- ✅ **Visning af implementeringsresultater**
- ✅ **Vejledning efter implementering**

## 📊 Overvågning af implementering

### Tjek implementeringsstatus

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

### Implementeringsresultater

Efter en vellykket implementering er følgende resultater tilgængelige:

- **Frontend URL**: Offentlig endpoint til webgrænsefladen
- **Router URL**: API-endpoint til agent-router
- **OpenAI Endpoints**: Primære og sekundære OpenAI-service endpoints
- **Search Service**: Azure AI Search service endpoint
- **Storage Account**: Navn på lagerkontoen til dokumenter
- **Key Vault**: Navn på Key Vault (hvis aktiveret)
- **Application Insights**: Navn på overvågningstjenesten (hvis aktiveret)

## 🔧 Konfiguration efter implementering

### 1. Konfigurer søgeindeks

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

### 2. Upload initial data

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Test agent-endpoints

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigurer Container Apps

ARM-skabelonen implementerer pladsholder-containerbilleder. For at implementere faktisk agentkode:

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

## 🛠️ Fejlfinding

### Almindelige problemer

#### 1. Azure OpenAI-kvote overskredet

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps implementering mislykkedes

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

#### 3. Initialisering af søgetjeneste

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validering af implementering

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

## 🔐 Sikkerhedsovervejelser

### Nøglehåndtering
- Alle hemmeligheder gemmes i Azure Key Vault (hvis aktiveret)
- Container apps bruger administreret identitet til autentifikation
- Lagerkonti har sikre standardindstillinger (kun HTTPS, ingen offentlig blob-adgang)

### Netværkssikkerhed
- Container apps bruger intern netværk, hvor det er muligt
- Søgetjeneste konfigureret med privat endpoint-mulighed
- Cosmos DB konfigureret med minimale nødvendige tilladelser

### RBAC-konfiguration
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Omkostningsoptimering

### Omkostningsestimater (Månedligt, USD)

| Mode | OpenAI | Container Apps | Search | Storage | Total Est. |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Overvågning af omkostninger

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

## 🔄 Opdateringer og vedligeholdelse

### Skabelonopdateringer
- Versionskontrol af ARM-skabelonfiler
- Test ændringer i udviklingsmiljø først
- Brug inkrementel implementeringsmodus til opdateringer

### Ressourceopdateringer
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup og gendannelse
- Cosmos DB automatisk backup aktiveret
- Key Vault soft delete aktiveret
- Container app-revisioner opretholdt til rollback

## 📞 Support

- **Skabelonproblemer**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Klar til at implementere din multi-agent løsning?**

Start med: `./deploy.sh -g myResourceGroup`

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.