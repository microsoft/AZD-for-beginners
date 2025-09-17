<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T22:09:54+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "pa"
}
-->
# ਰਿਟੇਲ ਮਲਟੀ-ਏਜੰਟ ਹੱਲ - ARM ਟੈਂਪਲੇਟ ਡਿਪਲੌਇਮੈਂਟ

**ਅਧਿਆਇ 5: ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਪੈਕੇਜ**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਫਾਰ ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਸੰਬੰਧਿਤ ਅਧਿਆਇ**: [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ AI ਹੱਲ](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 ਸਿਨਾਰਿਓ ਗਾਈਡ**: [ਪੂਰੀ ਅਮਲਵਾਰੀ](../retail-scenario.md)
- **🎯 ਤੁਰੰਤ ਡਿਪਲੌਇਮੈਂਟ**: [ਇੱਕ-ਕਲਿੱਕ ਡਿਪਲੌਇਮੈਂਟ](../../../../examples/retail-multiagent-arm-template)

ਇਹ ਡਾਇਰੈਕਟਰੀ ਰਿਟੇਲ ਮਲਟੀ-ਏਜੰਟ ਕਸਟਮਰ ਸਪੋਰਟ ਹੱਲ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਪੂਰਾ Azure Resource Manager (ARM) ਟੈਂਪਲੇਟ ਸ਼ਾਮਲ ਕਰਦੀ ਹੈ, ਜੋ ਪੂਰੇ ਆਰਕੀਟੈਕਚਰ ਲਈ ਕੋਡ ਦੇ ਤੌਰ ਤੇ ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ।

## 🎯 ਕੀ ਡਿਪਲੌਇ ਹੁੰਦਾ ਹੈ

### ਕੋਰ ਇੰਫਰਾਸਟਰਕਚਰ
- **Azure OpenAI ਸੇਵਾਵਾਂ** (ਉੱਚ ਉਪਲਬਧਤਾ ਲਈ ਮਲਟੀ-ਰੀਜਨ)
  - ਪ੍ਰਾਇਮਰੀ ਰੀਜਨ: GPT-4o ਕਸਟਮਰ ਏਜੰਟ ਲਈ
  - ਸੈਕੰਡਰੀ ਰੀਜਨ: GPT-4o-mini ਇਨਵੈਂਟਰੀ ਏਜੰਟ ਲਈ  
  - ਤੀਜਾ ਰੀਜਨ: ਟੈਕਸਟ ਐਮਬੈਡਿੰਗ ਮਾਡਲ
  - ਮੁਲਾਂਕਣ ਰੀਜਨ: GPT-4o ਗਰੇਡਰ ਮਾਡਲ
- **Azure AI Search** ਵੈਕਟਰ ਖੋਜ ਸਮਰਥਨ ਦੇ ਨਾਲ
- **Azure Storage Account** ਦਸਤਾਵੇਜ਼ਾਂ ਅਤੇ ਅਪਲੋਡ ਲਈ ਬਲੌਬ ਕੰਟੇਨਰਾਂ ਦੇ ਨਾਲ
- **Azure Container Apps Environment** ਆਟੋ-ਸਕੇਲਿੰਗ ਦੇ ਨਾਲ
- **Container Apps** ਏਜੰਟ ਰਾਊਟਰ ਅਤੇ ਫਰੰਟਐਂਡ ਲਈ
- **Azure Cosmos DB** ਚੈਟ ਇਤਿਹਾਸ ਸਟੋਰੇਜ ਲਈ
- **Azure Key Vault** ਰਾਜ਼ਾਂ ਦੇ ਪ੍ਰਬੰਧਨ ਲਈ (ਵਿਕਲਪਿਕ)
- **Application Insights** ਅਤੇ ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਮਾਨੀਟਰਿੰਗ ਲਈ (ਵਿਕਲਪਿਕ)
- **Document Intelligence** ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ ਲਈ
- **Bing Search API** ਰੀਅਲ-ਟਾਈਮ ਜਾਣਕਾਰੀ ਲਈ

### ਡਿਪਲੌਇਮੈਂਟ ਮੋਡ

| ਮੋਡ | ਵੇਰਵਾ | ਵਰਤੋਂ ਦਾ ਕੇਸ | ਸਰੋਤ |
|------|-------------|----------|-----------|
| **ਮਿਨੀਮਲ** | ਲਾਗਤ-ਅਨੁਕੂਲ ਬੁਨਿਆਦੀ ਡਿਪਲੌਇਮੈਂਟ | ਵਿਕਾਸ, ਟੈਸਟਿੰਗ | ਬੁਨਿਆਦੀ SKUs, ਇੱਕ ਰੀਜਨ, ਘਟਾਈ ਸਮਰੱਥਾ |
| **ਸਟੈਂਡਰਡ** | ਪ੍ਰੋਡਕਸ਼ਨ ਵਰਕਲੋਡ ਲਈ ਸੰਤੁਲਿਤ ਡਿਪਲੌਇਮੈਂਟ | ਪ੍ਰੋਡਕਸ਼ਨ, ਮੱਧਮ ਪੱਧਰ ਦਾ ਪੈਮਾਨਾ | ਸਟੈਂਡਰਡ SKUs, ਮਲਟੀ-ਰੀਜਨ, ਸਟੈਂਡਰਡ ਸਮਰੱਥਾ |
| **ਪ੍ਰੀਮੀਅਮ** | ਉੱਚ-ਪ੍ਰਦਰਸ਼ਨ, ਇੰਟਰਪ੍ਰਾਈਜ਼-ਗਰੇਡ ਡਿਪਲੌਇਮੈਂਟ | ਇੰਟਰਪ੍ਰਾਈਜ਼, ਉੱਚ ਪੈਮਾਨਾ | ਪ੍ਰੀਮੀਅਮ SKUs, ਮਲਟੀ-ਰੀਜਨ, ਉੱਚ ਸਮਰੱਥਾ |

## 📋 ਪੂਰਵ ਸ਼ਰਤਾਂ

1. **Azure CLI** ਇੰਸਟਾਲ ਅਤੇ ਸੰਰਚਿਤ
2. **ਸਕ੍ਰਿਆ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ** ਯੋਗ ਕੋਟਿਆਂ ਦੇ ਨਾਲ
3. **ਉਚਿਤ ਅਧਿਕਾਰ** ਟਾਰਗਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਿੱਚ ਸਰੋਤ ਬਣਾਉਣ ਲਈ
4. **ਸਰੋਤ ਕੋਟੇ**:
   - Azure OpenAI (ਰੀਜਨਲ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ)
   - Container Apps (ਰੀਜਨ ਦੁਆਰਾ ਵੱਖ-ਵੱਖ)
   - AI Search (ਸਟੈਂਡਰਡ ਟੀਅਰ ਜਾਂ ਉੱਚਾ ਸਿਫਾਰਸ਼ੀ)

## 🚀 ਤੁਰੰਤ ਡਿਪਲੌਇਮੈਂਟ

### ਵਿਕਲਪ 1: Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ

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

### ਵਿਕਲਪ 2: Azure ਪੋਰਟਲ ਦੀ ਵਰਤੋਂ ਕਰਕੇ

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### ਵਿਕਲਪ 3: ਸਿੱਧੇ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ ਸੰਰਚਨਾ ਵਿਕਲਪ

### ਟੈਂਪਲੇਟ ਪੈਰਾਮੀਟਰ

| ਪੈਰਾਮੀਟਰ | ਕਿਸਮ | ਡਿਫਾਲਟ | ਵੇਰਵਾ |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | ਸਾਰੇ ਸਰੋਤ ਨਾਮਾਂ ਲਈ ਪ੍ਰੀਫਿਕਸ |
| `location` | string | Resource group location | ਪ੍ਰਾਇਮਰੀ ਡਿਪਲੌਇਮੈਂਟ ਰੀਜਨ |
| `secondaryLocation` | string | "westus2" | ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਸੈਕੰਡਰੀ ਰੀਜਨ |
| `tertiaryLocation` | string | "francecentral" | ਐਮਬੈਡਿੰਗ ਮਾਡਲ ਲਈ ਰੀਜਨ |
| `environmentName` | string | "dev" | ਵਾਤਾਵਰਣ ਨਿਰਧਾਰਨ (dev/staging/prod) |
| `deploymentMode` | string | "standard" | ਡਿਪਲੌਇਮੈਂਟ ਸੰਰਚਨਾ (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ ਯੋਗ ਕਰੋ |
| `enableMonitoring` | bool | true | Application Insights ਅਤੇ ਲੌਗਿੰਗ ਯੋਗ ਕਰੋ |
| `enableSecurity` | bool | true | Key Vault ਅਤੇ ਵਧੇਰੇ ਸੁਰੱਖਿਆ ਯੋਗ ਕਰੋ |

### ਪੈਰਾਮੀਟਰਾਂ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

`azuredeploy.parameters.json` ਨੂੰ ਸੋਧੋ:

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

## 🏗️ ਆਰਕੀਟੈਕਚਰ ਝਲਕ

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

## 📖 ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ ਦੀ ਵਰਤੋਂ

`deploy.sh` ਸਕ੍ਰਿਪਟ ਇੱਕ ਇੰਟਰੈਕਟਿਵ ਡਿਪਲੌਇਮੈਂਟ ਅਨੁਭਵ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ:

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

### ਸਕ੍ਰਿਪਟ ਫੀਚਰ

- ✅ **ਪੂਰਵ ਸ਼ਰਤਾਂ ਦੀ ਪੁਸ਼ਟੀ** (Azure CLI, ਲੌਗਇਨ ਸਥਿਤੀ, ਟੈਂਪਲੇਟ ਫਾਈਲਾਂ)
- ✅ **ਸਰੋਤ ਸਮੂਹ ਪ੍ਰਬੰਧਨ** (ਹੈ ਜੇਕਰ ਨਹੀਂ ਹੈ ਤਾਂ ਬਣਾਉਂਦਾ ਹੈ)
- ✅ **ਟੈਂਪਲੇਟ ਵੈਧਤਾ** ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ
- ✅ **ਪ੍ਰਗਤੀ ਮਾਨੀਟਰਿੰਗ** ਰੰਗੀਨ ਆਉਟਪੁੱਟ ਦੇ ਨਾਲ
- ✅ **ਡਿਪਲੌਇਮੈਂਟ ਆਉਟਪੁੱਟ** ਪ੍ਰਦਰਸ਼ਨ
- ✅ **ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਮਾਰਗਦਰਸ਼ਨ**

## 📊 ਡਿਪਲੌਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ

### ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ

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

### ਡਿਪਲੌਇਮੈਂਟ ਆਉਟਪੁੱਟ

ਸਫਲ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ, ਹੇਠਾਂ ਦਿੱਤੇ ਆਉਟਪੁੱਟ ਉਪਲਬਧ ਹਨ:

- **ਫਰੰਟਐਂਡ URL**: ਵੈੱਬ ਇੰਟਰਫੇਸ ਲਈ ਪਬਲਿਕ ਐਂਡਪੌਇੰਟ
- **ਰਾਊਟਰ URL**: ਏਜੰਟ ਰਾਊਟਰ ਲਈ API ਐਂਡਪੌਇੰਟ
- **OpenAI ਐਂਡਪੌਇੰਟਸ**: ਪ੍ਰਾਇਮਰੀ ਅਤੇ ਸੈਕੰਡਰੀ OpenAI ਸੇਵਾ ਐਂਡਪੌਇੰਟਸ
- **Search Service**: Azure AI Search ਸੇਵਾ ਐਂਡਪੌਇੰਟ
- **Storage Account**: ਦਸਤਾਵੇਜ਼ਾਂ ਲਈ ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਦਾ ਨਾਮ
- **Key Vault**: Key Vault ਦਾ ਨਾਮ (ਜੇ ਯੋਗ ਕੀਤਾ ਗਿਆ)
- **Application Insights**: ਮਾਨੀਟਰਿੰਗ ਸੇਵਾ ਦਾ ਨਾਮ (ਜੇ ਯੋਗ ਕੀਤਾ ਗਿਆ)

## 🔧 ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਸੰਰਚਨਾ

### 1. ਖੋਜ ਇੰਡੈਕਸ ਸੰਰਚਿਤ ਕਰੋ

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

### 2. ਸ਼ੁਰੂਆਤੀ ਡਾਟਾ ਅਪਲੋਡ ਕਰੋ

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. ਏਜੰਟ ਐਂਡਪੌਇੰਟਸ ਦੀ ਜਾਂਚ ਕਰੋ

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Container Apps ਸੰਰਚਿਤ ਕਰੋ

ARM ਟੈਂਪਲੇਟ placeholder ਕੰਟੇਨਰ ਚਿੱਤਰਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਦੀ ਹੈ। ਅਸਲ ਏਜੰਟ ਕੋਡ ਡਿਪਲੌਇ ਕਰਨ ਲਈ:

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

## 🛠️ ਸਮੱਸਿਆ ਹੱਲ

### ਆਮ ਸਮੱਸਿਆਵਾਂ

#### 1. Azure OpenAI ਕੋਟਾ ਪਾਰ ਹੋਇਆ

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps ਡਿਪਲੌਇਮੈਂਟ ਅਸਫਲ

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

#### 3. Search Service ਸ਼ੁਰੂਆਤ

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### ਡਿਪਲੌਇਮੈਂਟ ਵੈਧਤਾ

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

## 🔐 ਸੁਰੱਖਿਆ ਵਿਚਾਰ

### ਕੁੰਜੀ ਪ੍ਰਬੰਧਨ
- ਸਾਰੇ ਰਾਜ਼ Azure Key Vault ਵਿੱਚ ਸਟੋਰ ਕੀਤੇ ਜਾਂਦੇ ਹਨ (ਜੇ ਯੋਗ ਕੀਤਾ ਗਿਆ)
- ਕੰਟੇਨਰ ਐਪਸ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ ਪ੍ਰਬੰਧਿਤ ਪਹਿਚਾਣ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ
- ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਸੁਰੱਖਿਅਤ ਡਿਫਾਲਟਸ ਦੇ ਨਾਲ ਹਨ (ਕੇਵਲ HTTPS, ਕੋਈ ਪਬਲਿਕ ਬਲੌਬ ਪਹੁੰਚ ਨਹੀਂ)

### ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ
- ਕੰਟੇਨਰ ਐਪਸ ਸੰਭਵ ਹੋਣ 'ਤੇ ਅੰਦਰੂਨੀ ਨੈੱਟਵਰਕਿੰਗ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ
- ਖੋਜ ਸੇਵਾ ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟ ਵਿਕਲਪ ਦੇ ਨਾਲ ਸੰਰਚਿਤ ਕੀਤੀ ਗਈ ਹੈ
- Cosmos DB ਘੱਟੋ-ਘੱਟ ਜ਼ਰੂਰੀ ਅਧਿਕਾਰਾਂ ਨਾਲ ਸੰਰਚਿਤ ਕੀਤੀ ਗਈ ਹੈ

### RBAC ਸੰਰਚਨਾ
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 ਲਾਗਤ ਅਨੁਕੂਲਤਾ

### ਲਾਗਤ ਅਨੁਮਾਨ (ਮਹੀਨਾਵਾਰ, USD)

| ਮੋਡ | OpenAI | Container Apps | Search | Storage | ਕੁੱਲ ਅਨੁਮਾਨ |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ

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

## 🔄 ਅਪਡੇਟਸ ਅਤੇ ਰਖ-ਰਖਾਅ

### ਟੈਂਪਲੇਟ ਅਪਡੇਟਸ
- ARM ਟੈਂਪਲੇਟ ਫਾਈਲਾਂ ਨੂੰ ਵਰਜਨ ਕੰਟਰੋਲ ਕਰੋ
- ਪਹਿਲਾਂ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਵਿੱਚ ਬਦਲਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
- ਅਪਡੇਟਸ ਲਈ incremental deployment mode ਦੀ ਵਰਤੋਂ ਕਰੋ

### ਸਰੋਤ ਅਪਡੇਟਸ
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### ਬੈਕਅਪ ਅਤੇ ਰਿਕਵਰੀ
- Cosmos DB ਆਟੋਮੈਟਿਕ ਬੈਕਅਪ ਯੋਗ ਕੀਤਾ ਗਿਆ
- Key Vault soft delete ਯੋਗ ਕੀਤਾ ਗਿਆ
- ਕੰਟੇਨਰ ਐਪਸ ਰਿਵੀਜ਼ਨ ਰੋਲਬੈਕ ਲਈ ਰੱਖੇ ਗਏ

## 📞 ਸਹਾਇਤਾ

- **ਟੈਂਪਲੇਟ ਸਮੱਸਿਆਵਾਂ**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure ਸਹਾਇਤਾ**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **ਕਮਿਊਨਿਟੀ**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ ਆਪਣਾ ਮਲਟੀ-ਏਜੰਟ ਹੱਲ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਤਿਆਰ?**

ਸ਼ੁਰੂ ਕਰੋ: `./deploy.sh -g myResourceGroup`

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਨਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤ ਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।