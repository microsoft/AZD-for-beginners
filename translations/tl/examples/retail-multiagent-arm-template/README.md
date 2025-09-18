<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T08:45:18+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "tl"
}
-->
# Retail Multi-Agent Solution - ARM Template Deployment

**Kabanata 5: Production Deployment Package**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Kaugnay na Kabanata**: [Kabanata 5: Multi-Agent AI Solutions](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Gabay sa Scenario**: [Kumpletong Implementasyon](../retail-scenario.md)
- **🎯 Mabilis na Deployment**: [One-Click Deployment](../../../../examples/retail-multiagent-arm-template)

Ang direktoryong ito ay naglalaman ng kumpletong Azure Resource Manager (ARM) template para sa pag-deploy ng retail Multi-Agent Customer Support Solution, na nagbibigay ng infrastructure bilang code para sa buong arkitektura.

## 🎯 Ano ang Na-deploy

### Pangunahing Infrastructure
- **Azure OpenAI Services** (Multi-region para sa mataas na availability)
  - Pangunahing rehiyon: GPT-4o para sa Customer agent
  - Pangalawang rehiyon: GPT-4o-mini para sa Inventory agent  
  - Pangatlong rehiyon: Text embeddings model
  - Rehiyon para sa pagsusuri: GPT-4o grader model
- **Azure AI Search** na may kakayahan sa vector search
- **Azure Storage Account** na may blob containers para sa mga dokumento at uploads
- **Azure Container Apps Environment** na may auto-scaling
- **Container Apps** para sa agent router at frontend
- **Azure Cosmos DB** para sa pag-iimbak ng chat history
- **Azure Key Vault** para sa pamamahala ng mga lihim (opsyonal)
- **Application Insights** at Log Analytics para sa monitoring (opsyonal)
- **Document Intelligence** para sa pagproseso ng dokumento
- **Bing Search API** para sa real-time na impormasyon

### Mga Mode ng Deployment

| Mode | Deskripsyon | Gamit | Mga Resources |
|------|-------------|-------|---------------|
| **Minimal** | Cost-optimized basic deployment | Development, testing | Basic SKUs, single region, reduced capacity |
| **Standard** | Balanced deployment para sa production workloads | Production, moderate scale | Standard SKUs, multi-region, standard capacity |
| **Premium** | High-performance, enterprise-grade deployment | Enterprise, high scale | Premium SKUs, multi-region, high capacity |

## 📋 Mga Kinakailangan

1. **Azure CLI** na naka-install at naka-configure
2. **Aktibong Azure subscription** na may sapat na quotas
3. **Angkop na mga pahintulot** para sa paglikha ng mga resources sa target na subscription
4. **Resource quotas** para sa:
   - Azure OpenAI (suriin ang availability sa rehiyon)
   - Container Apps (nag-iiba depende sa rehiyon)
   - AI Search (inirerekomenda ang standard tier o mas mataas)

## 🚀 Mabilis na Deployment

### Opsyon 1: Gamit ang Azure CLI

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

### Opsyon 2: Gamit ang Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opsyon 3: Gamit ang Azure CLI direkta

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Mga Opsyon sa Configuration

### Mga Parameter ng Template

| Parameter | Uri | Default | Deskripsyon |
|-----------|-----|---------|-------------|
| `projectName` | string | "retail" | Prefix para sa lahat ng resource names |
| `location` | string | Resource group location | Pangunahing rehiyon ng deployment |
| `secondaryLocation` | string | "westus2" | Pangalawang rehiyon para sa multi-region deployment |
| `tertiaryLocation` | string | "francecentral" | Rehiyon para sa embeddings model |
| `environmentName` | string | "dev" | Designasyon ng environment (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuration ng deployment (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Paganahin ang multi-region deployment |
| `enableMonitoring` | bool | true | Paganahin ang Application Insights at logging |
| `enableSecurity` | bool | true | Paganahin ang Key Vault at enhanced security |

### Pag-customize ng Mga Parameter

I-edit ang `azuredeploy.parameters.json`:

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

## 🏗️ Pangkalahatang Arkitektura

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

## 📖 Paggamit ng Deployment Script

Ang `deploy.sh` script ay nagbibigay ng interactive na karanasan sa deployment:

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

### Mga Tampok ng Script

- ✅ **Pag-validate ng mga kinakailangan** (Azure CLI, login status, template files)
- ✅ **Pamamahala ng resource group** (gumagawa kung wala pa)
- ✅ **Pag-validate ng template** bago ang deployment
- ✅ **Pag-monitor ng progreso** na may colored output
- ✅ **Pag-display ng deployment outputs**
- ✅ **Gabay pagkatapos ng deployment**

## 📊 Pag-monitor ng Deployment

### Suriin ang Status ng Deployment

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

### Mga Output ng Deployment

Pagkatapos ng matagumpay na deployment, ang mga sumusunod na outputs ay magagamit:

- **Frontend URL**: Pampublikong endpoint para sa web interface
- **Router URL**: API endpoint para sa agent router
- **OpenAI Endpoints**: Pangunahing at pangalawang OpenAI service endpoints
- **Search Service**: Endpoint ng Azure AI Search service
- **Storage Account**: Pangalan ng storage account para sa mga dokumento
- **Key Vault**: Pangalan ng Key Vault (kung naka-enable)
- **Application Insights**: Pangalan ng monitoring service (kung naka-enable)

## 🔧 Configuration Pagkatapos ng Deployment

### 1. I-configure ang Search Index

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

### 2. Mag-upload ng Paunang Data

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Subukan ang Agent Endpoints

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. I-configure ang Container Apps

Ang ARM template ay nag-deploy ng placeholder container images. Para i-deploy ang aktwal na agent code:

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

## 🛠️ Pag-troubleshoot

### Karaniwang Mga Isyu

#### 1. Naubos ang Azure OpenAI Quota

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Nabigo ang Deployment ng Container Apps

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

#### 3. Initialization ng Search Service

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Pag-validate ng Deployment

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

## 🔐 Mga Pagsasaalang-alang sa Seguridad

### Pamamahala ng Key
- Lahat ng mga lihim ay naka-store sa Azure Key Vault (kung naka-enable)
- Ang container apps ay gumagamit ng managed identity para sa authentication
- Ang storage accounts ay may secure defaults (HTTPS lamang, walang public blob access)

### Seguridad ng Network
- Ang container apps ay gumagamit ng internal networking kung posible
- Ang search service ay naka-configure sa private endpoints option
- Ang Cosmos DB ay naka-configure na may minimal na kinakailangang permissions

### RBAC Configuration
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Pag-optimize ng Gastos

### Mga Tantiya ng Gastos (Buwanang, USD)

| Mode | OpenAI | Container Apps | Search | Storage | Kabuuang Tantiya |
|------|--------|----------------|--------|---------|------------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Pag-monitor ng Gastos

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

## 🔄 Mga Update at Maintenance

### Mga Update sa Template
- I-version control ang mga ARM template files
- Subukan ang mga pagbabago sa development environment muna
- Gumamit ng incremental deployment mode para sa mga update

### Mga Update sa Resource
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup at Recovery
- Naka-enable ang automatic backup ng Cosmos DB
- Naka-enable ang soft delete ng Key Vault
- Ang mga container app revisions ay pinapanatili para sa rollback

## 📞 Suporta

- **Mga Isyu sa Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Suporta sa Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunidad**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Handa ka na bang i-deploy ang iyong multi-agent solution?**

Simulan gamit ang: `./deploy.sh -g myResourceGroup`

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi eksaktong salin. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.