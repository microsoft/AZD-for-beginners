# Retail Multi-Agent Solution - ARM Template Deployment

**Chapter 5: Production Deployment Package**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Related Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenario Guide**: [Complete Implementation](../retail-scenario.md)
- **🎯 Quick Deploy**: [One-Click Deployment](#-quick-deployment)

This directory contains a complete Azure Resource Manager (ARM) template for deploying the retail Multi-Agent Customer Support Solution, providing infrastructure as code for the entire architecture.

## 🎯 What Gets Deployed

### Core Infrastructure
- **Azure OpenAI Services** (Multi-region for high availability)
  - Primary region: GPT-4o for Customer agent
  - Secondary region: GPT-4o-mini for Inventory agent  
  - Tertiary region: Text embeddings model
  - Evaluation region: GPT-4o grader model
- **Azure AI Search** with vector search capabilities
- **Azure Storage Account** with blob containers for documents and uploads
- **Azure Container Apps Environment** with auto-scaling
- **Container Apps** for agent router and frontend
- **Azure Cosmos DB** for chat history storage
- **Azure Key Vault** for secrets management (optional)
- **Application Insights** and Log Analytics for monitoring (optional)
- **Document Intelligence** for document processing
- **Bing Search API** for real-time information

### Deployment Modes

| Mode | Description | Use Case | Resources |
|------|-------------|----------|-----------|
| **Minimal** | Cost-optimized basic deployment | Development, testing | Basic SKUs, single region, reduced capacity |
| **Standard** | Balanced deployment for production workloads | Production, moderate scale | Standard SKUs, multi-region, standard capacity |
| **Premium** | High-performance, enterprise-grade deployment | Enterprise, high scale | Premium SKUs, multi-region, high capacity |

## 📋 Prerequisites

1. **Azure CLI** installed and configured
2. **Active Azure subscription** with sufficient quotas
3. **Appropriate permissions** to create resources in the target subscription
4. **Resource quotas** for:
   - Azure OpenAI (check regional availability)
   - Container Apps (varies by region)
   - AI Search (standard tier or higher recommended)

## 🚀 Quick Deployment

### Option 1: Using Azure CLI

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

### Option 2: Using Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Option 3: Using Azure CLI directly

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Configuration Options

### Template Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefix for all resource names |
| `location` | string | Resource group location | Primary deployment region |
| `secondaryLocation` | string | "westus2" | Secondary region for multi-region deployment |
| `tertiaryLocation` | string | "francecentral" | Region for embeddings model |
| `environmentName` | string | "dev" | Environment designation (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Deployment configuration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Enable multi-region deployment |
| `enableMonitoring` | bool | true | Enable Application Insights and logging |
| `enableSecurity` | bool | true | Enable Key Vault and enhanced security |

### Customizing Parameters

Edit `azuredeploy.parameters.json`:

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

## 🏗️ Architecture Overview

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

## 📖 Deployment Script Usage

The `deploy.sh` script provides an interactive deployment experience:

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

### Script Features

- ✅ **Prerequisites validation** (Azure CLI, login status, template files)
- ✅ **Resource group management** (creates if doesn't exist)
- ✅ **Template validation** before deployment
- ✅ **Progress monitoring** with colored output
- ✅ **Deployment outputs** display
- ✅ **Post-deployment guidance**

## 📊 Monitoring Deployment

### Check Deployment Status

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

### Deployment Outputs

After successful deployment, the following outputs are available:

- **Frontend URL**: Public endpoint for the web interface
- **Router URL**: API endpoint for the agent router
- **OpenAI Endpoints**: Primary and secondary OpenAI service endpoints
- **Search Service**: Azure AI Search service endpoint
- **Storage Account**: Name of the storage account for documents
- **Key Vault**: Name of the Key Vault (if enabled)
- **Application Insights**: Name of the monitoring service (if enabled)

## 🔧 Post-Deployment Configuration

### 1. Configure Search Index

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

### 2. Upload Initial Data

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Test Agent Endpoints

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Configure Container Apps

The ARM template deploys placeholder container images. To deploy actual agent code:

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

## 🛠️ Troubleshooting

### Common Issues

#### 1. Azure OpenAI Quota Exceeded

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps Deployment Failed

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

#### 3. Search Service Initialization

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Deployment Validation

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

## 🔐 Security Considerations

### Key Management
- All secrets are stored in Azure Key Vault (when enabled)
- Container apps use managed identity for authentication
- Storage accounts have secure defaults (HTTPS only, no public blob access)

### Network Security
- Container apps use internal networking where possible
- Search service configured with private endpoints option
- Cosmos DB configured with minimal necessary permissions

### RBAC Configuration
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Cost Optimization

### Cost Estimates (Monthly, USD)

| Mode | OpenAI | Container Apps | Search | Storage | Total Est. |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Cost Monitoring

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

## 🔄 Updates and Maintenance

### Template Updates
- Version control the ARM template files
- Test changes in development environment first
- Use incremental deployment mode for updates

### Resource Updates
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup and Recovery
- Cosmos DB automatic backup enabled
- Key Vault soft delete enabled
- Container app revisions maintained for rollback

## 📞 Support

- **Template Issues**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Ready to deploy your multi-agent solution?**

Start with: `./deploy.sh -g myResourceGroup`