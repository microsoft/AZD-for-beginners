<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T07:26:03+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "nl"
}
-->
# Retail Multi-Agent Oplossing - ARM Template Implementatie

**Hoofdstuk 5: Productie Implementatiepakket**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Gerelateerd Hoofdstuk**: [Hoofdstuk 5: Multi-Agent AI Oplossingen](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenario Gids**: [Volledige Implementatie](../retail-scenario.md)
- **🎯 Snelle Implementatie**: [One-Click Implementatie](../../../../examples/retail-multiagent-arm-template)

Deze map bevat een complete Azure Resource Manager (ARM) template voor het implementeren van de retail Multi-Agent Klantenservice Oplossing, waarbij infrastructuur als code wordt geleverd voor de gehele architectuur.

## 🎯 Wat Wordt Geïmplementeerd

### Kerninfrastructuur
- **Azure OpenAI Services** (Multi-regio voor hoge beschikbaarheid)
  - Primaire regio: GPT-4o voor Klantenagent
  - Secundaire regio: GPT-4o-mini voor Inventarisagent  
  - Tertiaire regio: Tekst embeddings model
  - Evaluatieregio: GPT-4o beoordelingsmodel
- **Azure AI Search** met vectorzoekmogelijkheden
- **Azure Storage Account** met blobcontainers voor documenten en uploads
- **Azure Container Apps Environment** met automatische schaalvergroting
- **Container Apps** voor agent router en frontend
- **Azure Cosmos DB** voor opslag van chatgeschiedenis
- **Azure Key Vault** voor geheimenbeheer (optioneel)
- **Application Insights** en Log Analytics voor monitoring (optioneel)
- **Document Intelligence** voor documentverwerking
- **Bing Search API** voor realtime informatie

### Implementatiemodi

| Modus | Beschrijving | Gebruikssituatie | Resources |
|-------|--------------|------------------|-----------|
| **Minimal** | Kosten-geoptimaliseerde basisimplementatie | Ontwikkeling, testen | Basis SKUs, enkele regio, verminderde capaciteit |
| **Standard** | Gebalanceerde implementatie voor productie workloads | Productie, gemiddelde schaal | Standaard SKUs, multi-regio, standaard capaciteit |
| **Premium** | Hoogwaardige, enterprise-grade implementatie | Enterprise, grote schaal | Premium SKUs, multi-regio, hoge capaciteit |

## 📋 Vereisten

1. **Azure CLI** geïnstalleerd en geconfigureerd
2. **Actief Azure abonnement** met voldoende quota
3. **Geschikte rechten** om resources te maken in het doelabonnement
4. **Resource quota** voor:
   - Azure OpenAI (controleer regionale beschikbaarheid)
   - Container Apps (verschilt per regio)
   - AI Search (standaard tier of hoger aanbevolen)

## 🚀 Snelle Implementatie

### Optie 1: Gebruik Azure CLI

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

### Optie 2: Gebruik Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Optie 3: Gebruik Azure CLI direct

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Configuratieopties

### Template Parameters

| Parameter | Type | Standaard | Beschrijving |
|-----------|------|-----------|--------------|
| `projectName` | string | "retail" | Voorvoegsel voor alle resource namen |
| `location` | string | Resource group locatie | Primaire implementatieregio |
| `secondaryLocation` | string | "westus2" | Secundaire regio voor multi-regio implementatie |
| `tertiaryLocation` | string | "francecentral" | Regio voor embeddings model |
| `environmentName` | string | "dev" | Omgevingsaanduiding (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Implementatieconfiguratie (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Multi-regio implementatie inschakelen |
| `enableMonitoring` | bool | true | Application Insights en logging inschakelen |
| `enableSecurity` | bool | true | Key Vault en verbeterde beveiliging inschakelen |

### Parameters Aanpassen

Bewerk `azuredeploy.parameters.json`:

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

## 🏗️ Architectuuroverzicht

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

## 📖 Gebruik van Implementatiescript

Het `deploy.sh` script biedt een interactieve implementatie-ervaring:

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

### Scriptfuncties

- ✅ **Validatie van vereisten** (Azure CLI, loginstatus, templatebestanden)
- ✅ **Beheer van resourcegroepen** (maakt aan indien niet aanwezig)
- ✅ **Templatevalidatie** vóór implementatie
- ✅ **Voortgangsmonitoring** met gekleurde output
- ✅ **Weergave van implementatie-uitvoer**
- ✅ **Richtlijnen na implementatie**

## 📊 Implementatie Monitoren

### Controleer Implementatiestatus

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

### Implementatie-uitvoer

Na succesvolle implementatie zijn de volgende uitvoer beschikbaar:

- **Frontend URL**: Publiek eindpunt voor de webinterface
- **Router URL**: API eindpunt voor de agent router
- **OpenAI Eindpunten**: Primaire en secundaire OpenAI service eindpunten
- **Search Service**: Azure AI Search service eindpunt
- **Storage Account**: Naam van de opslagaccount voor documenten
- **Key Vault**: Naam van de Key Vault (indien ingeschakeld)
- **Application Insights**: Naam van de monitoringservice (indien ingeschakeld)

## 🔧 Configuratie na Implementatie

### 1. Zoekindex Configureren

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

### 2. Initiële Data Uploaden

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Test Agent Eindpunten

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Container Apps Configureren

De ARM template implementeert placeholder container images. Om daadwerkelijke agentcode te implementeren:

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

## 🛠️ Problemen Oplossen

### Veelvoorkomende Problemen

#### 1. Azure OpenAI Quota Overschreden

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps Implementatie Mislukt

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

#### 3. Initialisatie van Zoekservice

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validatie van Implementatie

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

## 🔐 Beveiligingsoverwegingen

### Sleutelbeheer
- Alle geheimen worden opgeslagen in Azure Key Vault (indien ingeschakeld)
- Container apps gebruiken managed identity voor authenticatie
- Storage accounts hebben veilige standaardinstellingen (alleen HTTPS, geen openbare blobtoegang)

### Netwerkbeveiliging
- Container apps gebruiken interne netwerken waar mogelijk
- Zoekservice geconfigureerd met optie voor private endpoints
- Cosmos DB geconfigureerd met minimale benodigde rechten

### RBAC Configuratie
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostenoptimalisatie

### Kostenramingen (Maandelijks, USD)

| Modus | OpenAI | Container Apps | Search | Storage | Totale Schatting |
|-------|--------|----------------|--------|---------|------------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kosten Monitoren

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

## 🔄 Updates en Onderhoud

### Template Updates
- Versiebeheer de ARM template bestanden
- Test wijzigingen eerst in ontwikkelomgeving
- Gebruik incrementele implementatiemodus voor updates

### Resource Updates
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Back-up en Herstel
- Cosmos DB automatische back-up ingeschakeld
- Key Vault soft delete ingeschakeld
- Container app revisies behouden voor rollback

## 📞 Ondersteuning

- **Template Problemen**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Ondersteuning**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Klaar om je multi-agent oplossing te implementeren?**

Start met: `./deploy.sh -g myResourceGroup`

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.