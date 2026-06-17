# AI ವರ್ಕ್‌ಶಾಪ್ ಲ್ಯಾಬ್: ನಿಮ್ಮ AI ಪರಿಹಾರಗಳನ್ನು AZD-Deployable ಆಗಿಸುವುದು

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

ಈ ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಲ್ಯಾಬ್ ಅಭಿವೃದ್ಧಿಗಾರರನ್ನು ಈಗಿರುವ AI ಟೆಂಪ್ಲೇಟನ್ನು ತೆಗೆದುಕೊಂಡು Azure Developer CLI (AZD) ಬಳಸಿ ಅದನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಪ್ರಕ್ರಿಯೆಯನ್ನು ನೆರವಾಗಿಸುವಂತೆ ಮಾರ್ಗದರ್ಶನ ನೀಡುತ್ತದೆ. ನೀವು Microsoft Foundry ಸೇವೆಗಳ ಬಳಕೆಯೊಂದಿಗೆ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ಗಳಿಗಾಗಿ ಅವಶ್ಯಕ ಮಾದರಿಗಳನ್ನು ಕಲಿಯುತ್ತೀರಿ.

> **Validation note (2026-03-25):** ಈ ಕಾರ್ಯಾಗಾರವನ್ನು `azd` `1.23.12` ಕ್ಕೆ ವಿರುದ್ಧವಾಗಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ. ನಿಮ್ಮ ಸ್ಥಳೀಯ ಸ್ಥಾಪನೆ ಹಳೆದಿದ್ದರೆ, ಪ್ರಾರಂಭಿಸುವ ಮುನ್ನ AZD ಅನ್ನು ನವೀಕರಿಸಿ ताकि auth, ಟೆಂಪ್ಲೇಟು ಮತ್ತು ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಕೆಲಸಪ್ರವಾಹ ಕೆಳಗಿನ ಹಂತಗಳೊಂದಿಗೆ ಸಮ್ಮತಿಯಾಗಿರಲಿ.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

ಈ ಕಾರ್ಯಾಗಾರದ ಅಂತ್ಯಕ್ಕೆ, ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ:
- ✅ ಇತ್ತೀಚಿನ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು AZD ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸುವಂತೆ ಪರಿವರ್ತಿಸುವುದು
- ✅ AZD ಮೂಲಕ Microsoft Foundry ಸೇವೆಗಳನ್ನು ಸಂರಚಿಸುವುದು
- ✅ AI ಸೇವೆಗಳಿಗಾಗಿ ಸುರಕ್ಷಿತ ಕ್ರೆಡೆನ್ಶಿಯಲ್ ನಿರ್ವಹಣೆಯನ್ನು ಕಾರ್ಯಗತಗೊಳಿಸುವುದು
- ✅ ಮോണಿಟರಿಂಗ್ ಒಳಗೊಂಡ ಉತ್ಪಾದನಾ-ತಯಾರಿರುವ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವದು
- ✅ ಸಾಮಾನ್ಯ AI ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಸಮಸ್ಯೆಗಳನ್ನು ಟ್ರಬಲ್‌ಶೂಟ್ ಮಾಡುವುದು

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- ಕೋಡ್ ಎಡಿಟರ್ (VS Code ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)

### Azure Resources
- ಕಂಟ್ರಿಬ್ಯೂಟರ್ ಪ್ರವೇಶದೊಂದಿಗೆ Azure ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್
- Microsoft Foundry Models ಸೇವೆಗಳ ಪ್ರವೇಶ (ಅಥವಾ ಪ್ರವೇಶ ವಿನಂತಿಸಲು ಸಾಧ್ಯತೆ)
- ರಿಸೋರ್ಸ್ ಗುಂಪು ಸೃಷ್ಟಿ ಅನುಮತಿಗಳು

### Knowledge Prerequisites
- Azure ಸೇವೆಗಳ ಮೂಲಭೂತ ಅರಿವು
- ಕಮಾಂಡ್-ಲೈನ್ ಇಂಟರ್ಫೇಸ್‌ಗಳ ಪರಿಚಯ
- AI/ML ಮೂಲಭೂತ ಸಂವಹನಗಳು (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
azd version

# Azure CLI ಪರಿಶೀಲಿಸಿ
az --version

# AZD ಕಾರ್ಯಪ್ರವಾಹಗಳಿಗಾಗಿ Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login

# ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ವೇಳೆ az ಕಮಾಂಡ್‌ಗಳನ್ನು ಚಲಾಯಿಸಲು ಯೋಜನೆ ಇದ್ದರೆ ಮಾತ್ರ Azure CLI ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login
```

ನೀವು ಬಹು ಟೆನೆಂಟ್‌ಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡುತ್ತಿರುವಾಗ ಅಥವಾ ನಿಮ್ಮ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪತ್ತೆಯಾಗದಿದ್ದರೆ, `azd auth login --tenant-id <tenant-id>` ಯೊಂದಿಗೆ ಮರುಪ್ರಯತ್ನಿಸಿ.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI-ಸಿದ್ಧ AZD ಟೆಂಪ್ಲೇಟ್‌ನ ಪ್ರಮುಖ ಫೈಲ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- AI ಘಟಕಗಳಿಗಾಗಿ ಸೇವಾ ವ್ಯಾಖ್ಯಾನಗಳು
- ಪರಿಸರತ್ತದ ಚರ ಮ್ಯಾಪಿಂಗ್‌ಗಳು
- ಹೋಸ್ಟ್ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Microsoft Foundry Models ಸೇವೆಯ ಪ್ರೊವಿಷನಿಂಗ್
- Azure AI Search ಇಂಟಿಗ್ರೇಶನ್
- ಸುರಕ್ಷಿತ ಕೀ ನಿರ್ವಹಣೆ
- ನೆಟ್ವರ್ಕ್ ಸುರಕ್ಷತಾ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು

### **Discussion Point:** These Patterns ಯಾಕೆ ಮಹತ್ವದವು

- **Service Dependencies**: AI ಅಪ್‌ಗಳು ಬಹುತೇಗಾದ ಸೇವೆಗಳನ್ನು ಸಂಯೋಜಿಸಬೇಕಾಗುತ್ತದೆ
- **Security**: API ಕీలు ಮತ್ತು ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ನಿರ್ವಹಿಸಬೇಕು
- **Scalability**: AI ಕೆಲಸಭಾರಗಳಿಗೆ ವಿಶೇಷವಾಗಿ اسڪೇಲಿಂಗ್ ಅಗತ್ಯವಿದೆ
- **Cost Management**: ಸರಿಯಾಗಿ ಕಾನ್ಫಿಗರ್ ಮಾಡದಿದ್ದರೆ AI ಸೇವೆಗಳು ದುಬಾರಿಯಾಗಬಹುದು

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# ನಿಮ್ಮ ಮೆಚ್ಚಿನ Azure ಪ್ರಾಂತ್ಯವನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus

# ಐಚ್ಛಿಕ: ನಿರ್ದಿಷ್ಟ OpenAI ಮಾದರಿಯನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Microsoft Foundry Models ಸೇವೆಯನ್ನು ಪ್ರೊವೈಸನ್ ಮಾಡುತ್ತದೆ
- ✅ Azure AI Search ಸೇವೆಯನ್ನು ರಚಿಸುತ್ತದೆ
- ✅ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ App Service ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡುತ್ತದೆ
- ✅ ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಸುರಕ್ಷತೆಯನ್ನು ಸಂರಚಿಸುತ್ತದೆ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತದೆ
- ✅ ಮോണಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡುತ್ತದೆ

2. **Monitor the deployment progress** ಮತ್ತು ರಚಿಸಲಾಗುತ್ತಿರುವ ರಿಸೋರ್ಸ್ಗಳನ್ನು ಗಮನಿಸಿ.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

`azd show` ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ತೋರಿಸಿದ ವೆಬ್ ಎಂಡ್ಪಾಯಿಂಟ್ ಅನ್ನು ತೆರೆಯಿರಿ.

3. **Test the AI functionality:**
   - ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ನ್ಯavigate ಮಾಡಿ
   - ಸೆಂಪಲ್ ಕ್ವೆರಿಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ
   - AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದ್ದಾರೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಯಶಸ್ವಿಯಾಗಿ ನಡೆದಿದೆ ಆದರೆ AI ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತಿಲ್ಲ.

**Common issues to check:**
1. **OpenAI API keys**: ಅವುಗಳು ಸರಿಯಾಗಿ ಸೆಟ್ ಆಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
2. **Model availability**: ನಿಮ್ಮ ರೀಜನಿನಲ್ಲಿ ಮಾದರಿ ಬೆಂಬಲಿತವ್ಯಾ ಎಂದು ಪರಿಶೀಲಿಸಿ
3. **Network connectivity**: ಸೇವೆಗಳು ಪರಸ್ಪರ ಸಂವಹನ ನಡೆಸಲು ಸಾಧ್ಯವಾಗುತ್ತದೆಯೇ ಎಂದು ಖಚಿತಪಡಿಸಿ
4. **RBAC permissions**: ಅಪ್ಲಿಕೇಶನ್ OpenAI ಗೆ ಪ್ರವೇಶ ಹೊಂದುವಂತೆ ಅನುಮತಿಗಳು ಹಾಕಿರಬಹುದೇ ಎಂದು ಪರಿಶೀಲಿಸಿ

**Debugging commands:**
```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# ಮಾದರಿಯನ್ನು ಬದಲಾಯಿಸಿ (ನಿಮ್ಮ ಪ್ರದೇಶದಲ್ಲಿ ಲಭ್ಯವಿದ್ದರೆ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ಹೊಸ ಸಂರಚನೆಯೊಂದಿಗೆ ಮರುನಿಯೋಜಿಸಿ
azd deploy
```

2. **Add additional AI services:**

`infra/main.bicep` ಅನ್ನು ಸಂಪಾದಿಸಿ Document Intelligence ಸೇರಿಸಲು:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Step 3.2: Environment-Specific Configurations

**Best Practice**: ಡೆವಲಪ್ ಮೆಂಟ್ ಮತ್ತು ಉತ್ಪಾದನೆಗಾಗಿ ವಿಭಿನ್ನ ಕಾನ್ಫಿಗರೇಷನ್‌ಗಳು.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# ಉತ್ಪಾದನೆ ಸಾಮಾನ್ಯವಾಗಿ ಹೆಚ್ಚಿನ SKUಗಳನ್ನು ಬಳಸುತ್ತದೆ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ಹೆಚ್ಚುವರಿ ಭದ್ರತಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: ತಗ್ಗಾದ ವೆಚ್ಚದ ಅಭಿವೃದ್ಧಿಗಾಗಿ ಟೆಂಪ್ಲೇಟನ್ನು ಸಂರಚಿಸಿ.

**Tasks:**
1. ಯಾವುದೇ SKUs ಅನ್ನು free/basic ತಟ್ಟಿಗೆ ಸೆಟ್ ಮಾಡಲು ಗುರುತಿಸು
2. ಕನಿಷ್ಠ ವೆಚ್ಚದಿಗಾಗಿ ಪರಿಸರ ಚರಗಳನ್ನು ಸಂರಚಿಸು
3. ಡಿಪ್ಲಾಯ್ ಮಾಡಿ ಮತ್ತು ಉತ್ಪಾದನಾ ಕಾನ್ಫಿಗರೇಶನ್ ಜೊತೆಗೆ ವೆಚ್ಚಗಳನ್ನು ಹೋಲಿಸು

**Solution hints:**
- ಸಾಧ್ಯವಾದರೆ Azure AI Services ಗೆ F0 (ಫ್ರೀ) ತಯ್ನ್ನು ಬಳಸಿ
- ಅಭಿವೃದ್ಧಿಗಾಗಿ Search Service ಗೆ Basic ತಯ್ನ್ನು ಬಳಸಲು ಪರಿಗಣಿಸಿ
- Functions ಗಾಗಿ Consumption plan ಅನ್ನು ವಿಚಾರಿಸಿ

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: ಅನೇಕ AI ಅಪ್‌ಗಳು API ಕೀಲಿಗಳನ್ನು ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡುತ್ತವೆ ಅಥವಾ ಅಸರಕ್ಷಿತ ಸ್ಟೋರೇಜ್ ಬಳಕೆ ಮಾಡುತ್ತವೆ.

**AZD Solution**: Managed Identity + Key Vault ಏಕೋ ಅಂಟಲಿರುವುದು.

1. **Review the security configuration in your template:**
```bash
# ಕೀ ವಾಲ್ಟ್ ಮತ್ತು ಮ್ಯಾನೇಜ್ಡ್ ಐಡೆಂಟಿಟಿ ಸಂರಚನೆಯನ್ನು ಹುಡುಕಿ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌‌ಗೆ ಸರಿಯಾದ ಗುರುತಿನ ಸಂರಚನೆ ಇದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (ಇದೀಗ ಕಾನ್ಫಿಗರ್ ಆಗಿರದಿದ್ದರೆ):

ನಿಮ್ಮ bicep ಟೆಂಪ್ಲೇಟಿಗೆ ಸೇರಿಸಿ:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಂರಚಿಸಲ್ಪಡಬೇಕು
# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

AI ಕಾರ್ಯಾಚರಣೆಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಸೇರಿಸಿ:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab Exercise 4.1: Security Audit**

**Task**: ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಅನ್ನು ಸುರಕ್ಷತಾ ಉತ್ತಮ ಪದ್ಧತಿಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ.

**Checklist:**
- [ ] ಕೋಡ್ ಅಥವಾ ಕಾನ್ಫಿಗರೇಶನ್‌ನಲ್ಲಿ ಯಾವುದೇ ಹಾರ್ಡ್‌ಕೋಡೆಡ್ ಸೀಕ್ರೆಟ್ಸ್ ಇಲ್ಲ
- [ ] ಸರ್ವೀಸ್-ಟು-ಸರ್ವೀಸ್ ಪ್ರಮಾಣೀಕರಣಕ್ಕೆ Managed Identity ಬಳಸಲಾಗಿದೆ
- [ ] Key Vault ಸಂವೇದನಾಶೀಲ ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಸ್ಟೋರ್ ಮಾಡುತ್ತದೆ
- [ ] ನೆಟ್ವರ್ಕ್ ಪ್ರವೇಶ ಸರಿಯಾಗಿ ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ
- [ ] ಮോണಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಸಕ್ರಿಯವಾಗಿವೆ

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, ಈ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ:

1. **Application Architecture:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ AI ಸೇವೆಗಳನ್ನು ಬಳಸುತ್ತದೆ?
   - ಅದಕ್ಕೆ ಯಾವ ಕಂಪ್ಯೂಟ್ ಸಂಪನ್ಮೂಲಗಳು ಬೇಕಾಗಿವೆ?
   - ಅದಕ್ಕೆ ಡೇಟಾಬೇಸ್ ಬೇಕೇ?
   - ಸೇವೆಗಳ ಮಧ್ಯೆ ಯಾವ ಅವಲಂಬನೆಗಳಿವೆ?

2. **Security Requirements:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ ಸಂವೇದನಾಶೀಲ ಡೇಟಾವನ್ನು ಹೊಂದಿದೆ?
   - ನೀವು ಯಾವ ಅಂಗೀಕಾರ ಆವಶ್ಯಕತೆಗಳನ್ನು ಹೊಂದಿದ್ದೀರಿ?
   - ನಿಮಗೆ ಖಾಸಗಿ ನೆಟ್ವರ್ಕಿಂಗ್ ಬೇಕೆಯೇ?

3. **Scaling Requirements:**
   - ನಿಮ್ಮ ನಿರೀಕ್ಷಿತ ಲೋಡ್ ಎಷ್ಟು?
   - ನಿಮಗೆ auto-scaling ಬೇಕೆಯೇ?
   - ಪ್ರಾದೇಶಿಕ ಅಗತ್ಯಗಳಿದೆಯೇ?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template minimal
```

2. **Create azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Create infrastructure templates:**

**infra/main.bicep** - ಮುಖ್ಯ ಟೆಂಪ್ಲೇಟು:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI ಮೋಡ್ಯೂಲ್:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: ದಸ್ತಾವೇಜು ಪ್ರಕ್ರಿಯೆ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ AZD ಟೆಂಪ್ಲೇಟನ್ನು ರಚಿಸಿ.

**Requirements:**
- ವಿಷಯ ವಿಶ್ಲೇಷಣೆಗೆ Microsoft Foundry Models
- OCR ಗೆ Document Intelligence
- ದസ്തಾವೇಜು ಅಪ್ಲೋಡ್‌ಗಳಿಗಾಗಿ Storage Account
- ಪ್ರಕ್ರಿಯೆ ಲಾಜಿಕ್‌ಗಾಗಿ Function App
- ಬಳಕೆದಾರ ಇಂಟರ್ಫೇಸಿಗೆ ವೆಬ್ ಅಪ್

**Bonus points:**
- ಸೂಕ್ತ ದೋಶ ನಿರ್ವಹಣೆಯನ್ನು ಸೇರಿಸಿ
- ವೆಚ್ಚ ಅಂದಾಜನ್ನು ಒಳಗೊಳ್ಳಿಸಿ
- ಮോണಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ quota ದೋಷದಿಂದ ವಿಫಲವಾಗಿದೆ
**Solutions:**
```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ಕ್ವೋಟಾ ಹೆಚ್ಚಳವನ್ನು ವಿನಂತಿಸಿ ಅಥವಾ ಬೇರೆ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ವ್ಯರ್ಥವಾಗುತ್ತವೆ ಅಥವಾ ಮಾದರಿ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ದೋಷಗಳು
**Solutions:**
```bash
# ಪ್ರಾದೇಶಿಕವಾಗಿ ಮಾದರಿಯ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ
az cognitiveservices model list --location eastus

# ಲಭ್ಯವಿರುವ ಮಾದರಿಗೆ ನವೀಕರಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** AI ಸೇವೆಗಳನ್ನು ಕರೆಸುವಾಗ 403 Forbidden ದೋಷಗಳು
**Solutions:**
```bash
# ಭೂಮಿಕೆ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ಕಾಣೆಯಾಗದ ಭೂಮಿಕೆಗಳನ್ನು ಸೇರಿಸಿ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Application Insights ನಲ್ಲಿ ಪ್ರದರ್ಶನ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
2. Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ OpenAI ಸೇವೆಯ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
3. ನೆಟ್ವರ್ಕ್ ಸಂಪರ್ಕವಂತಿಕೆ ಮತ್ತು ವಿಳಂಬವನ್ನು ಖಚಿತಪಡಿಸಿ

**Solutions:**
- ಸಾಮಾನ್ಯ ಕ್ವೆರಿಗಳಿಗಾಗಿ кешಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ನಿಮ್ಮ ಬಳಕೆಗೆ ಸೂಕ್ತ OpenAI ಮಾದರಿಯನ್ನು ಬಳಸಿ
- ಹೆಚ್ಚಿನ ಲೋಡ್ ಪರಿಸ್ಥಿತಿಗಳಿಗೆ ಓದಲು ರೆಪ್ಲಿಕಾ ಗಳನ್ನು ಪರಿಗಣಿಸಿ

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಯಶಸ್ವಿಯಾಗಿದೆ, ಆದರೆ ಅಪ್ಲಿಕೇಶನ್ 500 ದೋಷಗಳನ್ನು ನೀಡುತ್ತಿದೆ.

**Debugging tasks:**
1. ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
2. ಸರ್ವಿಸ್ ಸಂಪರ್ಕისწಕ್ತಿ ಪರಿಶೀಲಿಸಿ
3. ಅಟೆನ್ಟಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
4. ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ

**Tools to use:**
- ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಅವಲೋಕನಕ್ಕೆ `azd show`
- ಸೇವೆ ಲಾಗ್ಗಳಿಗಾಗಿ Azure ಪೋರ್ಟಲ್
- ಅಪ್ಲಿಕೇಶನ್ ಟೆಲಮೆಟ್ರಿಗಾಗಿ Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure ಪೋರ್ಟಲ್‌ಗೆ ನ್ಯavigate ಮಾಡಿ ಮತ್ತು ಕೆಳಗಿನವುಗಳೊಂದಿಗೆ ಒಂದು ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ರಚಿಸಿ:
- OpenAI ವಿನಂತಿಯ গণನೆ ಮತ್ತು ಲೇಟನ್ಸಿ
- ಅಪ್ಲಿಕೇಶನ್ ದೋಷ ದರಗಳು
- ಸಂಪನ್ಮೂಲ ಬಳಕೆ
- ವೆಚ್ಚ ಟ್ರಕ್ಕಿಂಗ್

2. **Set up alerts:**
```bash
# ಹೆಚ್ಚಿನ ದೋಷ ದರದ ಬಗ್ಗೆ ಎಚ್ಚರಿಕೆ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# ವೆಚ್ಚದ ಡೇಟಾವನ್ನು ಪಡೆಯಲು Azure CLI ಅನ್ನು ಬಳಸಿ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- ಬಜೆಟ್ ಅಲರ್ಟ್‌ಗಳನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ
- autoscaling ನೀತಿಗಳನ್ನು ಬಳಸಿ
- ವಿನಂತಿ ಕೇಶಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- OpenAI ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಮಾನಿಟರ್ ಮಾಡಿ

### **Lab Exercise 7.1: Performance Optimization**

**Task**: ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ವೆಚ್ಚ ಎರಡಕ್ಕೂ ನಿಮ್ಮ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಸುಧಾರಿಸಿ.

**Metrics to improve:**
- ಸರಾಸರಿ ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯವನ್ನು 20% ಕ್ಕೆ ಕಡಿಮೆ ಮಾಡಿ
- ಮಾಸಿಕ ವೆಚ್ಚವನ್ನು 15% ಕ್ಕೆ ಕಡಿಮೆ ಮಾಡಿ
- 99.9% ಅಪ್‌ಟೈಮ್ ಕಾಪಾಡಿ

**Strategies to try:**
- ಪ್ರತಿಕ್ರಿಯೆ ಕೇಶಿಂಗ್ ಅನ್ನು ಅನ್ವಯಿಸಿ
- ಟೋಕನ್ ದಕ್ಷತೆಯಿಗಾಗಿ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಸ್ಥೂಲಗೊಳಿಸಿ
- ಸೂಕ್ತ ಕಂಪ್ಯೂಟ್ SKUಗಳನ್ನು ಬಳಸಿ
- ಸೂಕ್ತ autoscaling ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ

## Final Challenge: End-to-End Implementation

### Challenge Scenario

ನೀವು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಚಾಲಿತ ಗ್ರಾಹಕ ಸೇವಾ ಚಾಟ್‌ಬಾಟ್ ಅನ್ನು ರಚಿಸುವ ಜವಾಬ್ದಾರಿಯನ್ನು ಹೊಂದಿದ್ದೀರಿ, ಕೆಳಗಿನ ಅಗತ್ಯಗಳೊಂದಿಗೆ:

**Functional Requirements:**
- ಗ್ರಾಹಕರ ಸಂವಹನಕ್ಕಾಗಿ ವೆಬ್ ಇಂಟರ್ಫೇಸ್
- ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗೆ Microsoft Foundry Models ಸಹಾಯ
- ದಸ್ತಾವೇಜು ಹುಡುಕಾಟಕ್ಕಾಗಿ Azure AI Search ಐಂಟಿಗ್ರೇಶನ್
- ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಗ್ರಾಹಕ ಡೇಟಾಬೇಸ್‌ಗಾಗಿ ಇಂಟಿಗ್ರೇಶನ್
- ಬಹುಭಾಷಾ ಬೆಂಬಲ

**Non-Functional Requirements:**
- 1000 ಸಮಕಾಲೀನ ಬಳಕೆದಾರರನ್ನು ಹ್ಯಾಂಡಲ್ ಮಾಡುವುದು
- 99.9% ಅಪ್‌ಟೈಮ್ SLA
- SOC 2 ಅನುಸರಣಾ
- ಮಾಸಿಕ ವೆಚ್ಚ $500 ಕ್ಕಿಂತ ಕಡಿಮೆ
- ಬಹು ಪರಿಸರಗಳಿಗೆ ಡಿಪ್ಲಾಯ್ (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: ಎಲ್ಲಾ ಅಗತ್ಯಗಳನ್ನು ಪೂರೈಸುತ್ತದೆಯೇ?
- ✅ **Security**: ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು ಅನುಷ್ಟಿತವಾಗಿದೆಯೇ?
- ✅ **Scalability**: ಲೋಡ್ ಅನ್ನು ಹ್ಯಾಂಡಲ್ ಮಾಡಬಹುದೇ?
- ✅ **Maintainability**: ಕೋಡ್ ಮತ್ತು ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಒರಗನೈಜ್ಡ್ ಆಗಿದೆಯೇ?
- ✅ **Cost**: ಬಜೆಟ್‌ನೊಳಗಾಗಿ ಇದೆಯೇಹೆ?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ಸಮುದಾಯ ಸಂಪನ್ಮೂಲಗಳು
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ಪೂರ್ಣಗೊಳಿಸಿದ ಪ್ರಮಾಣಪತ್ರ

ಹೃತ್ಪೂರ್ವಕ ಅಭಿನಂದನೆಗಳು! ನೀವು AI ಕಾರ್ಯಾಗಾರ ಪ್ರಯೋಗಾಲಯವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ. ಈಗ ನೀವು ಈ ಕಾರ್ಯಗಳನ್ನು ಮಾಡಬಲ್ಲಿರುತ್ತದೆ:

- ✅ ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು AZD ಟೆಂಪ್ಲೇಟ್ಗಳಾಗಿ ಪರಿವರ್ತಿಸುವುದು
- ✅ ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವುದು
- ✅ AI ವರ್ಕ್ಲೋಡ್‌ಗಳಿಗಾಗಿ ಭದ್ರತಾ ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ✅ AI ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ನಿಗಾ ವಹಿಸಿ ಮತ್ತು ಸುಧಾರಿಸುವುದು
- ✅ ಸಾಮಾನ್ಯ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ತಾಂತ್ರಿಕವಾಗಿ ಪರಿಹರಿಸುವುದು

### ಮುಂದಿನ ಹಂತಗಳು
1. ಈ ಮಾದರಿಗಳನ್ನು ನಿಮ್ಮದೇ AI ಪ್ರಾಜೆಕ್ಟ್ಗಳಿಗೆ ಅನ್ವಯಿಸಿ
2. ಸಮುದಾಯಕ್ಕೆ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಕೊಡುಗೆ ಮಾಡಿ
3. ನಿರಂತರ ಬೆಂಬಲಕ್ಕಾಗಿ Microsoft Foundry Discord ಸೇರಿ
4. ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆಗಳಂತಹ ಉನ್ನತ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ

---

**ಕಾರ್ಯಾಗಾರ ಪ್ರತಿಕ್ರಿಯೆ**: [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) ನಲ್ಲಿ ನಿಮ್ಮ ಅನುಭವವನ್ನು ಹಂಚಿಕೊಂಡು ಈ ಕಾರ್ಯಾಗಾರವನ್ನು ಉತ್ತಮಗೊಳಿಸಲು ಸಹಾಯ ಮಾಡಿ.

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಷನ್:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: ಅಧ್ಯಾಯ 2 - AI-First Development
- **⬅️ ಹಿಂದಿನ**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **➡️ ಮುಂದಿನ**: [ಉತ್ಪಾದನಾ AI ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](production-ai-practices.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೆ?** AZD ಮತ್ತು AI ನಿಯೋಜನೆಗಳ ಬಗ್ಗೆ ಬೆಂಬಲ ಮತ್ತು ಚರ್ಚೆಗಾಗಿ ನಮ್ಮ ಸಮುದಾಯದಲ್ಲಿ ಸೇರಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->