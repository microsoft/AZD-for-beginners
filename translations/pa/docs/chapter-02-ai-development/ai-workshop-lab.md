# AI ਵਰਕਸ਼ਾਪ ਲੈਬ: ਆਪਣੇ AI ਹੱਲਾਂ ਨੂੰ AZD-ਡਿਪਲੋਏ ਕਰਨ ਯੋਗ ਬਣਾਉਣਾ

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

ਇਹ ਹੱਥ-ਓਪਲੈਬ ਵਿਕਾਸਕਾਰਾਂ ਨੂੰ ਮੌਜੂਦਾ AI ਟੈmplੇਟ ਲੈ ਕੇ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਨਾਲ ਡਿਪਲੋਏ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਵਿਚੋਂ ਲੈ ਜਾਂਦਾ ਹੈ। ਤੁਸੀਂ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਿਆਂ ਪ੍ਰੋਡਕਸ਼ਨ AI ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਅਹੰਕਾਰਿਕ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

> **Validation note (2026-03-25):** ਇਹ ਵਰਕਸ਼ਾਪ `azd` `1.23.12` ਦੇ ਖਿਲਾਫ ਸੰਖੇਪ ਰੂਪ ਵਿੱਚ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ ਸੀ। ਜੇ ਤੁਹਾਡੀ ਲੋਕਲ ਇੰਸਟਾਲੇਸ਼ਨ ਇਸ ਤੋਂ ਪੁਰਾਣੀ ਹੈ, ਤਾਂ ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ AZD ਅਪਡੇਟ ਕਰੋ ਤਾਂ ਜੋ auth, template, ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਹੇਠਾਂ ਦਿੱਤੇ ਕਦਮਾਂ ਨਾਲ ਮੇਲ ਖਾਂਦੇ ਹੋਣ।

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅਖੀਰ ਤੱਕ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈmplੇਟ ਦੀ ਵਰਤੋਂ ਲਈ ਬਦਲਣਾ
- ✅ AZD ਨਾਲ Microsoft Foundry ਸੇਵਾਵਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨਾ
- ✅ AI ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਰਿਹਾਇਸ਼ ਮੈਨੇਜਮੈਂਟ ਲਾਗੂ ਕਰਨਾ
- ✅ ਨਿਗਰਾਨੀ ਸਮੇਤ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਏ ਕਰਨਾ
- ✅ ਆਮ AI ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਲਈ ਟਰਬਲਸ਼ੂਟ ਕਰਨਾ

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਸਥਾਪਿਤ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਸਥਾਪਿਤ
- [Git](https://git-scm.com/) ਸਥਾਪਿਤ
- ਕੋਡ ਐਡੀਟਰ (VS Code ਦੀ ਸਿਫਾਰਿਸ਼)

### Azure Resources
- contributor ਐਕਸੇਸ ਵਾਲੀ Azure subscription
- Microsoft Foundry Models ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰਨ ਦੀ ਸਮਰੱਥਾ)
- Resource group ਬਣਾਉਣ ਦੀਆਂ ਅਨੁਮਤੀਆਂ

### Knowledge Prerequisites
- Azure ਸੇਵਾਵਾਂ ਦੀ ਬੁਨਿਆਦੀ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸਾਂ ਨਾਲ ਪਛਾਣ
- AI/ML ਦੇ ਬੁਨਿਆਦੀ ਧਾਰਣਾਂ (APIs, ਮਾਡਲ, ਪ੍ਰامਪਟਸ)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD ਦੀ ਇੰਸਟਾਲੇਸ਼ਨ ਚੈੱਕ ਕਰੋ
azd version

# Azure CLI ਦੀ ਜਾਂਚ ਕਰੋ
az --version

# AZD ਵਰਕਫਲੋਜ਼ ਲਈ Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
azd auth login

# ਜੇ ਤੁਸੀਂ ਡਾਇਗਨੋਸਟਿਕ ਦੌਰਾਨ az ਕਮਾਂਡਾਂ ਚਲਾਉਣ ਦੀ ਯੋਜਨਾ ਰੱਖਦੇ ਹੋ ਤਾਂ ਹੀ Azure CLI ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI-ਤਿਆਰ AZD ਟੈmplੇਟ ਵਿਚਲੇ ਮੁੱਖ ਫਾਇਲਾਂ ਦੀ ਪੜਚੋਲ ਕਰੋ:

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
- AI ਘਟਕਾਂ ਲਈ ਸੇਵਾ ਪਰਿਭਾਸ਼ਾਵਾਂ
- Environment variable ਨਕਸ਼ੇ
- ਹੋਸਟ ਸੰਰਚਨਾਵਾਂ

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Microsoft Foundry Models ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- Azure AI Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੀ ਮੈਨੇਜਮੈਂਟ
- ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾਵਾਂ

### **Discussion Point:** ਇਹ ਪੈਟਰਨ AI ਲਈ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹਨ

- **Service Dependencies**: AI ਐਪਸ ਅਕਸਰ ਕਈ ਸੇਵਾਵਾਂ ਦੀ ਸਮਨਵਿਤ ਲੋੜ ਰੱਖਦੇ ਹਨ
- **Security**: API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੋਇੰਟਸ ਦੀ ਸੁਰੱਖਿਆ ਨਾਲ ਸੰਭਾਲ ਕੀਤੀ ਜਾਣੀ ਚਾਹੀਦੀ ਹੈ
- **Scalability**: AI ਵਰਕਲੋਡ ਦੀਆਂ ਖਾਸ ਸਕੇਲਿੰਗ ਲੋੜਾਂ ਹੁੰਦੀਆਂ ਹਨ
- **Cost Management**: ਜੇ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਨਾ ਕੀਤਾ ਜਾਵੇ ਤਾਂ AI ਸੇਵਾਵਾਂ ਮਹਿੰਗੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# ਆਪਣਾ ਪਸੰਦੀਦਾ Azure ਰੀਜ਼ਨ ਸੈਟ ਕਰੋ
azd env set AZURE_LOCATION eastus

# ਵਿਕਲਪੀ: ਖਾਸ OpenAI ਮਾਡਲ ਸੈਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Microsoft Foundry Models ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ
- ✅ Azure AI Search ਸੇਵਾ ਬਣਾਈ ਜਾਂਦੀ ਹੈ
- ✅ ਵੈੱਬ ਐਪ ਲਈ App Service ਸੈੱਟਅਪ ਕਰਦਾ ਹੈ
- ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੋਏ ਕਰਦਾ ਹੈ
- ✅ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈੱਟਅਪ ਕਰਦਾ ਹੈ

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output.

3. **Test the AI functionality:**
   - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ 'ਤੇ ਜਾਓ
   - ਨਮੂਨਾ ਕੁਏਰੀਜ਼ ਟਰਾਈ ਕਰੋ
   - ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ AI ਜਵਾਬ ਕਾਰਗਰ ਹਨ

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: ਤੁਹਾਡੀ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਹੋ ਗਿਆ ਪਰ AI ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਆਮ ਸਮੱਸਿਆਵਾਂ ਜੋ ਜਾਂਚਣ ਲਾਇਕ ਹਨ:**
1. **OpenAI API keys**: ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਇਹ ਸਹੀ ਤਰ੍ਹਾਂ ਸੈਟ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ
2. **Model availability**: ਦੇਖੋ ਕਿ ਤੁਹਾਡੇ ਰੀਜਨ ਵਿੱਚ ਮਾਡਲ ਸਪੋਰਟ ਹੁੰਦਾ ਹੈ ਜਾਂ ਨਹੀਂ
3. **Network connectivity**: ਸੁਨਿਸ਼ਚਿਤ ਕਰੋ ਕਿ ਸੇਵਾਵਾਂ ਆਪਸ ਵਿੱਚ ਸੰਚਾਰ ਕਰ ਸਕਦੀਆਂ ਹਨ
4. **RBAC permissions**: ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਐਪ OpenAI ਤੱਕ ਪਹੁੰਚ ਰੱਖਦੀ ਹੈ

**Debugging commands:**
```bash
# ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values

# ਡਿਪਲੋਇਮੈਂਟ ਲੌਗ ਵੇਖੋ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# ਕਿਸੇ ਹੋਰ ਮਾਡਲ ਤੇ ਬਦਲੋ (ਜੇ ਤੁਹਾਡੇ ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ ਹੋਵੇ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ਨਵੀਂ ਕੰਫਿਗਰੇਸ਼ਨ ਨਾਲ ਮੁੜ ਡਿਪਲੋਏ ਕਰੋ
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

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

**Best Practice**: ਵਿਕਾਸ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਰੱਖੋ।

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# ਉਤਪਾਦਨ ਆਮ ਤੌਰ 'ਤੇ ਉੱਚ-ਸ਼੍ਰੇਣੀ SKUs ਵਰਤਦਾ ਹੈ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ਵਾਧੂ ਸੁਰੱਖਿਆ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨੂੰ ਯੋਗ ਕਰੋ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: ਵਿਕਾਸ ਲਈ ਕਿੱਥੇ ਲਾਗਤ-ਕੁਸ਼ਲ ਟੈmplੇਟ ਸੰਰਚਿਤ ਕਰੋ।

**ਟਾਸਕਸ:**
1. ਪਛਾਣੋ ਕਿ ਕਿਹੜੇ SKUs ਨੂੰ free/basic ਟੀਅਰ 'ਤੇ ਸੈਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
2. ਘੱਟੋ-ਘੱਟ ਲਾਗਤ ਲਈ environment variables ਸੰਰਚਿਤ ਕਰੋ
3. ਡਿਪਲੋਏ ਕਰੋ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਸੰਰਚਨਾ ਨਾਲ ਲਾਗਤਾਂ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਸਮਾਧਾਨ ਸਹਾਇਕ ਸੁਝਾਅ:**
- शक ਯੋਗਤਾ ਹੋਵੇ ਤਾਂ Azure AI Services ਲਈ F0 (free) ਟੀਅਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਵਿਕਾਸ ਲਈ Search Service ਲਈ Basic ਟੀਅਰ ਵਰਤੋਂ
- Functions ਲਈ Consumption plan ਬਾਰੇ ਵਿਚਾਰ ਕਰੋ

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**ਮੌਜੂਦਾ ਚੁਣੌਤੀ**: ਬਹੁਤ ਸਾਰੇ AI ਐਪ API ਕੁੰਜੀਆਂ ਨੂੰ ਕੋਡ ਵਿੱਚ ਹਾਰਡਕੋਡ ਕਰਦੇ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਵਰਤਦੇ ਹਨ।

**AZD ਹੱਲ**: Managed Identity + Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ।

1. **Review the security configuration in your template:**
```bash
# Key Vault ਅਤੇ Managed Identity ਦੀ ਸੰਰਚਨਾ ਲਈ ਖੋਜ ਕਰੋ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# ਜਾਂਚੋ ਕਿ ਵੈੱਬ ਐਪ ਦੀ ਪਹਚਾਣ ਸੰਰਚਨਾ ਸਹੀ ਹੈ ਜਾਂ ਨਹੀਂ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (ਜੇ ਪਹਿਲਾਂ ਤੋਂ ਸੰਰਚਿਤ ਨਹੀਂ):

Add to your bicep template:
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
# Application Insights ਨੂੰ ਆਟੋਮੈਟਿਕ ਤੌਰ ਤੇ ਕੰਫ਼ਿਗਰ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
# ਕੰਫ਼ਿਗਰੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

AI ਓਪਰੇਸ਼ਨਾਂ ਲਈ ਕਸਟਮ ਮੈਟਰਿਕਸ ਸ਼ਾਮਲ ਕਰੋ:
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

**ਟਾਸਕ**: ਆਪਣੇ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸੁਰੱਖਿਆ ਉੱਤੇ ਸਮੀਖਿਆ ਕਰੋ।

**ਚੈਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਸੰਰਚਨਾ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਕੀ ਨਹੀਂ ਹੈ
- [ ] Managed Identity ਸੇਵਾ-ਤੋਂ-ਸੇਵਾ ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ ਵਰਤਿਆ ਗਿਆ ਹੈ
- [ ] Key Vault ਸੰਵੇਦਨਸ਼ੀਲ ਸੰਰਚਨਾ ਸਟੋਰ ਕਰਦਾ ਹੈ
- [ ] ਨੈੱਟਵਰਕ ਪਹੁੰਚ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਸੀਮਿਤ ਹੈ
- [ ] ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਚਾਲੂ ਹਨ

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**ਆਪਣੀ ਐਪ ਨੂੰ ਬਦਲਣ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਪ੍ਰਸ਼ਨਾਂ ਦੇ ਜਵਾਬ ਦਿਓ:

1. **Application Architecture:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਹੜੀਆਂ AI ਸੇਵਾਵਾਂ ਵਰਤਦੀ ਹੈ?
   - ਇਸਨੂੰ ਕਿਸ ਤਰ੍ਹਾਂ ਦੇ ਕਮਪਿਊਟ ਸਰੋਤਾਂ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡੇਟਾਬੇਸ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਵਿਚਕਾਰ ਕੀ ਨਿਰਭਰਤਾਵਾਂ ਹਨ?

2. **Security Requirements:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਸ ਸੰਵੇਦਨਸ਼ੀਲ ਡੇਟਾ ਨੂੰ ਹੈਂਡਲ ਕਰਦੀ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਹੜੇ ਕਾਂਪਲਾਇੰਸ ਦੀਆਂ ਲੋੜਾਂ ਹਨ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈੱਟਵਰਕਿੰਗ ਦੀ ਲੋੜ ਹੈ?

3. **Scaling Requirements:**
   - ਤੁਹਾਡਾ ਉਮੀਦ ਕੀਤਾ ਲੋਡ ਕਿੰਨਾ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਚਾਹੀਦੀ ਹੈ?
   - ਕੀ ਕੋਈ ਖੇਤਰੀ ਲੋੜਾਂ ਹਨ?

### Step 5.2: Create Your AZD Template

**ਆਪਣੀ ਐਪ ਨੂੰ ਬਦਲਣ ਲਈ ਇਸ ਪੈਟਰਨ ਦੀ ਪਾਲਣਾ ਕਰੋ:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ਟੈਮਪਲੇਟ ਦੀ ਸ਼ੁਰੂਆਤ ਕਰੋ
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

**infra/main.bicep** - Main template:
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

**infra/modules/openai.bicep** - OpenAI module:
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

**Challenge**: ਇੱਕ ਦਸਤਾਵੇਜ਼ ਪ੍ਰਕਿਰਿਆ AI ਐਪ ਲਈ AZD ਟੈmplੇਟ ਬਣਾਓ।

**ਲੋੜਾਂ:**
- ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Microsoft Foundry Models
- OCR ਲਈ Document Intelligence
- ਦਸਤਾਵੇਜ਼ ਅੱਪਲੋਡ ਲਈ Storage Account
- ਪ੍ਰੋਸੈਸਿੰਗ ਲੌਜਿਕ ਲਈ Function App
- ਉਪਭੋਗਤਾ ਇੰਟਰਫੇਸ ਲਈ Web app

**ਬੋਨਸ ਪੌਇੰਟਸ:**
- ਉਚਿਤ ਐਰਰ ਹੈਂਡਲਿੰਗ ਸ਼ਾਮਲ ਕਰੋ
- ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ਾ ਸ਼ਾਮਲ ਕਰੋ
- ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਸੈੱਟਅਪ ਕਰੋ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** ਡਿਪਲੋਇਮੈਂਟ quota ਐਰਰ ਨਾਲ ਨਾਕਾਮ ਹੁੰਦੀ ਹੈ
**Solutions:**
```bash
# ਮੌਜੂਦਾ ਕੋਟੇ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਕੋਟਾ ਵਾਧੇ ਦੀ ਬੇਨਤੀ ਕਰੋ ਜਾਂ ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਨੂੰ ਅਜ਼ਮਾਓ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI ਜਵਾਬ ਫੇਲ ਜਾਂ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਐਰਰ ਹੁੰਦਾ ਹੈ
**Solutions:**
```bash
# ਇਲਾਕੇ ਅਨੁਸਾਰ ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਜਾਂਚੋ
az cognitiveservices model list --location eastus

# ਉਪਲਬਧ ਮਾਡਲ 'ਤੇ ਅਪਡੇਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਦਿਆਂ 403 Forbidden ਐਰਰ
**Solutions:**
```bash
# ਰੋਲ ਸੌਂਪਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਘੱਟ ਰਹਿ ਗਏ ਰੋਲ ਜੋੜੋ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**ਤਫ਼ਤੀਸ਼ ਕਦਮ:**
1. Application Insights ਵਿਚ ਪ੍ਰਦਰਸ਼ਨ ਮੈਟਰਿਕਸ ਚੈੱਕ ਕਰੋ
2. Azure ਪੋਰਟਲ ਵਿਚ OpenAI ਸੇਵਾ ਮੈਟਰਿਕਸ ਰਿਵਿਊ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਅਤੇ ਲੇਟੈਂਸੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

**ਹੱਲ:**
- ਆਮ ਕੁਏਰੀਜ਼ ਲਈ caching ਲਾਗੂ ਕਰੋ
- ਆਪਣੇ ਉਪਯੋਗ ਕੇਸ ਲਈ ਉਚਿਤ OpenAI ਮਾਡਲ ਵਰਤੋਂ
- ਉੱਚ ਲੋਡ ਸਥਿਤੀਆਂ ਲਈ read replicas ਬਾਰੇ ਸੋਚੋ

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: ਤੁਹਾਡੀ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਹੋ ਗਿਆ, ਪਰ ਐਪਲੀਕੇਸ਼ਨ 500 ਐਰਰ ਰਿਟਰਨ ਕਰਦਾ ਹੈ।

**ਡਿਬੱਗ ਕਰਨ ਦੇ ਟਾਸਕਸ:**
1. ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਸ ਚੈੱਕ ਕਰੋ
2. ਸੇਵਾ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
3. Authentication ਟੈਸਟ ਕਰੋ
4. ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ

**ਵਰਤੋਂ ਲਈ ਟੂਲਸ:**
- ਡਿਪਲੋਇਮੈਂਟ ਓਵਰਵਿਊ ਲਈ `azd show`
- ਵਿਸਤਾਰਿਤ ਸੇਵਾ ਲੌਗਸ ਲਈ Azure portal
- ਐਪਲੀਕੇਸ਼ਨ ਟੇਲੀਮੇਟਰੀ ਲਈ Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure portal 'ਤੇ ਜਾ ਕੇ ਇੱਕ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੇ:
- OpenAI ਬੇਨਤੀਆਂ ਦੀ ਗਿਣਤੀ ਅਤੇ ਲੇਟੈਂਸੀ
- ਐਪਲੀਕੇਸ਼ਨ ਐਰਰ ਰੇਟਸ
- ਸਰੋਤ ਉਪਯੋਗਤਾ
- ਲਾਗਤ ਟ੍ਰੈਕਿੰਗ

2. **Set up alerts:**
```bash
# ਉੱਚੀ ਗਲਤੀ ਦਰ ਲਈ ਚੇਤਾਵਨੀ
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
# ਲਾਗਤ ਦਾ ਡੇਟਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰੋ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- ਬਜਟ ਅਲਰਟਸ ਸੈੱਟ ਕਰੋ
- autoscaling ਨੀਤੀਆਂ ਵਰਤੋਂ
- ਬੇਨਤੀਆਂ ਲਈ caching ਲਾਗੂ ਕਰੋ
- OpenAI ਲਈ ਟੋਕਨ ਉਪਯੋਗ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ

### **Lab Exercise 7.1: Performance Optimization**

**ਟਾਸਕ**: ਆਪਣੇ AI ਐਪ ਨੂੰ ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਲਾਗਤ ਦੋਹਾਂ ਲਈ ਅਪਟਿਮਾਈਜ਼ ਕਰੋ।

**ਸੁਧਾਰਨ ਯੋਗ ਮੈਟਰਿਕਸ:**
- ਔਸਤ ਜਵਾਬ ਸਮਾਂ 20% ਘਟਾਓ
- ਮਹੀਨਾਵਾਰ ਲਾਗਤ 15% ਘਟਾਓ
- 99.9% uptime ਬਰਕਰਾਰ ਰੱਖੋ

**ਇਸਤੋਂ ਕੀਤੀਆਂ ਸਟ੍ਰੈਟੇਜੀਜ਼:**
- ਜਵਾਬ caching ਲਾਗੂ ਕਰੋ
- token ਕੁਸ਼ਲਤਾ ਲਈ ਪ੍ਰਾਮਪਟਸ ਅਪਟਿਮਾਈਜ਼ ਕਰੋ
- ਉਚਿਤ ਕਮਪਿਊਟ SKUs ਵਰਤੋਂ
- ਉਚਿਤ autoscaling ਸੈੱਟਅਪ ਕਰੋ

## Final Challenge: End-to-End Implementation

### Challenge Scenario

ਤੁਹਾਨੂੰ ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI-ਚਲਿਤ ਕਸਟਮਰ ਸਰਵਿਸ ਚੈਟਬੋਟ ਬਣਾਉਣ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਦਿੱਤੀ ਗਈ ਹੈ ਜਿਸ ਦੀਆਂ ਲੋੜਾਂ ਇਹ ਹਨ:

**Functional Requirements:**
- ਗਾਹਕ ਇੰਟਰੈਕਸ਼ਨਾਂ ਲਈ ਵੈੱਬ ਇੰਟਰਫੇਸ
- ਜਵਾਬਾਂ ਲਈ Microsoft Foundry Models ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਦਸਤਾਵੇਜ਼ ਖੋਜ ਸਮਰੱਥਾ Azure AI Search ਦੀ ਵਰਤੋਂ ਨਾਲ
- ਮੌਜੂਦਾ ਗਾਹਕ ਡੇਟਾਬੇਸ ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਬਹੁ-ਭਾਸ਼ਾਈ ਸਮਰਥਨ

**Non-Functional Requirements:**
- 1000 ਸਮਕਾਲੀ ਯੂਜ਼ਰਾਂ ਨੂੰ ਹੈਂਡਲ ਕਰਨ ਦੀ ਸਮਰੱਥਾ
- 99.9% uptime SLA
- SOC 2 ਕੰਪਲਾਇੰਸ
- $500/ਮਹੀਨਾ ਤੋਂ ਘੱਟ ਲਾਗਤ
- ਕਈ ਵਾਤਾਵਰਣਾਂ (dev, staging, prod) ਵਿੱਚ ਡਿਪਲੋਏ

### Implementation Steps

1. ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਈਨ ਕਰੋ
2. AZD ਟੈmplੇਟ ਬਣਾਓ
3. ਸੁਰੱਖਿਆ ਉਪਾਇ ਲਾਗੂ ਕਰੋ
4. ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਸੈੱਟਅਪ ਕਰੋ
5. ਡਿਪਲੋਇਮੈਂਟ ਪਾਈਪਲਾਈਨ ਬਣਾਓ
6. ਹੱਲ ਦੀ ਦਸਤਾਵੇਜ਼ੀ ਕਰੋ

### Evaluation Criteria

- ✅ **Functionality**: ਕੀ ਇਹ ਸਾਰੀਆਂ ਲੋੜਾਂ ਪੂਰੀਆਂ ਕਰਦਾ ਹੈ?
- ✅ **Security**: ਕੀ ਵਧੀਆ ਅਭਿਆਸ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ?
- ✅ **Scalability**: ਕੀ ਇਹ ਲੋਡ ਨੂੰ ਸੰਭਾਲ ਸਕਦਾ ਹੈ?
- ✅ **Maintainability**: ਕੀ ਕੋਡ ਅਤੇ ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਵਿਵਸਥਿਤ ਹਨ?
- ✅ **Cost**: ਕੀ ਇਹ ਬਜਟ ਦੇ ਅੰਦਰ ਰਹਿੰਦਾ ਹੈ?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso ਚੈਟ](https://github.com/Azure-Samples/contoso-chat)

### ਕਮਿਊਨਿਟੀ ਸਰੋਤ
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ਪੂਰਨਤਾ ਸਰਟੀਫਿਕੇਟ

ਵਧਾਈਆਂ! ਤੁਸੀਂ AI ਵਰਕਸ਼ਾਪ ਲੈਬ ਮੁਕੰਮਲ ਕਰ ਲਈ ਹੈ। ਹੁਣ ਤੁਸੀਂ ਇਹ ਕਰਨ ਯੋਗ ਹੋ:

- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ AZD ਟੈਂਪਲੇਟਾਂ ਵਿੱਚ ਬਦਲੋ
- ✅ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
- ✅ AI ਵਰਕਲੋਡ ਲਈ ਸੁਰੱਖਿਆ ਦੀਆਂ ਸਰਵੋੱਤਮ ਪਧਤੀਆਂ ਲਾਗੂ ਕਰੋ
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਕਾਰਗੁਜਾਰੀ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਸੁਧਾਰ ਕਰੋ
- ✅ ਆਮ ਤੌਰ 'ਤੇ ਆਉਣ ਵਾਲੀਆਂ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰੋ

### ਅਗਲੇ ਕਦਮ
1. ਇਹਨਾਂ ਨਮੂਨਿਆਂ ਨੂੰ ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਾਂ 'ਤੇ ਲਾਗੂ ਕਰੋ
2. ਟੈਂਪਲੇਟਾਂ ਨੂੰ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਵਾਪਸ ਯੋਗਦਾਨ ਕਰੋ
3. ਲਗਾਤਾਰ ਸਹਾਇਤਾ ਲਈ Microsoft Foundry Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ
4. ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੋਇਮੈਂਟ ਵਰਗੇ ਉੱਨਤ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ

---

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: ਸਾਡੇ ਨੂੰ ਇਹ ਵਰਕਸ਼ਾਪ ਸੁਧਾਰਨ ਵਿੱਚ ਸਹਾਇਤਾ ਦਿਓ ਆਪਣਾ ਅਨੁਭਵ [Microsoft Foundry Discord #Azure ਚੈਨਲ](https://discord.gg/microsoft-azure) 'ਚ ਸਾਂਝਾ ਕਰਕੇ।

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਪ੍ਰੋਡਕਸ਼ਨ AI ਲਈ ਸਰਵੋਤਮ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

**ਸਹਾਇਤਾ ਚਾਹੀਦੀ ਹੈ?** AZD ਅਤੇ AI ਡਿਪਲੋਇਮੈਂਟਸ ਬਾਰੇ ਸਹਾਇਤਾ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੇ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->