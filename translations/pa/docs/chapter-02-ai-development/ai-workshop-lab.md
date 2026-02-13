# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਤਾਇਨਾਤ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਉਤਪਾਦਨ AI ਉੱਤਮ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਕੰਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/configuration.md)

## ਵਰਕਸ਼ਾਪ ਓਵਰਵਿਊ

ਇਹ ਹੱਥ-ਅਨੁਭਵ ਲੈਬ ਡਿਵੈਲਪਰਾਂ ਨੂੰ ਮੌਜੂਦਾ AI ਟੈਂਪਲੇਟ ਨੂੰ ਲੈ ਕੇ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਤਾਇਨਾਤ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਰਾਹੀਂ ਗਾਈਡ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹੋਏ ਉਤਪਾਦਨ-ਕੁਸ਼ਲ AI ਤਾਇਨਾਤਾਂ ਲਈ ਮੁੱਖ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਸਤਹ:** ਦਰਮਿਆਨਾ  
**ਪੂਰਵ-ਸ਼ਰਤਾਂ:** Azure ਦੀ ਬੁਨਿਆਦੀ ਜਾਣਕਾਰੀ, AI/ML ਧਾਰਣਾਵਾਂ ਨਾਲ ਜਾਣੂ

## 🎓 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਲਈ ਰੂਪਾਂਤਰਿਤ ਕਰਨਾ
- ✅ AZD ਨਾਲ Microsoft Foundry ਸੇਵਾਵਾਂ ਨੂੰ ਕੰਫਿਗਰ ਕਰਨਾ
- ✅ AI ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਕ੍ਰੇਡੈਂਸ਼ਲ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰਨਾ
- ✅ ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਉਤਪਾਦਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤਾਇਨਾਤ ਕਰਨਾ
- ✅ ਆਮ AI ਤਾਇਨਾਤ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨਾ

## ਪੂਰਵ-ਸ਼ਰਤਾਂ

### ਲੋੜੀਂਦੇ ਟੂਲ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਏਡੀਟਰ (VS Code ਦੀ ਸਿਫਾਰਿਸ਼)

### Azure ਸਰੋਤ
- Contributor ਐਕਸੇਸ ਵਾਲੀ Azure subscription
- Azure OpenAI ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਮੰਗਣ ਦੀ ਸਮਰੱਥਾ)
- Resource group ਬਣਾਉਣ ਦੀਆਂ ਅਨੁਮਤੀਆਂ

### ਗਿਆਨ ਸੰਬੰਧੀ ਪੂਰਵ-ਸ਼ਰਤਾਂ
- Azure ਸੇਵਾਵਾਂ ਦੀ ਬੁਨਿਆਦੀ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸਾਂ ਨਾਲ ਪਰਚਿਤਤਾ
- ਬੁਨਿਆਦੀ AI/ML ਧਾਰਣਾਵਾਂ (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **ਟੂਲ ਦੀਆਂ ਇੰਸਟਾਲੇਸ਼ਨਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:**
```bash
# AZD ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# Azure CLI ਦੀ ਜਾਂਚ ਕਰੋ
az --version

# Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
az login
azd auth login
```

2. **ਵਰਕਸ਼ਾਪ ਰਿਪੋਜ਼ਟਰੀ ਨੂੰ ਕਲੋਨ ਕਰੋ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI-ਤਿਆਰ AZD ਟੈਮਪਲੇਟ ਵਿੱਚ ਮੁੱਖ ਫਾਇਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **azure.yaml ਫਾਇਲ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਕੀ ਦੇਖਣਾ ਹੈ:**
- AI ਕੰਪੋਨੈਂਟਸ ਲਈ ਸਰਵਿਸ ਪਰਿਭਾਸ਼ਾਵਾਂ
- Environment variable mappings
- ਹੋਸਟ ਕੰਫਿਗਰੇਸ਼ਨ

2. **main.bicep ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**ਪਛਾਣਣ ਲਈ ਮੁੱਖ AI ਪੈਟਰਨ:**
- Azure OpenAI service provisioning
- Cognitive Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੀ ਪ੍ਰਬੰਧਨ
- ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾਵਾਂ

### **ਚਰਚਾ ਬਿੰਦੂ:** ਇਹ ਪੈਟਰਨ AI ਲਈ ਕਿਉਂ ਮਹੱਤਵਪੂਰਣ ਹਨ

- **Service Dependencies**: AI ਐਪਾਂ ਨੂੰ ਅਕਸਰ ਕਈ ਸੇਵਾਵਾਂ ਦੀ ਸਮਨਵયਤ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **Security**: API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੌਇੰਟਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਪ੍ਰਬੰਧਨ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **Scalability**: AI ਵਰਕਲੋਡਾਂ ਲਈ ਵਿਲੱਖਣ ਸਕੇਲਿੰਗ ਦੀਆਂ ਲੋੜਾਂ ਹੁੰਦੀਆਂ ਹਨ
- **Cost Management**: ਜੇ ਠੀਕ ਤੌਰ 'ਤੇ ਕੰਫਿਗਰ ਨਾ ਕੀਤਾ ਜਾਵੇ ਤਾਂ AI ਸੇਵਾਵਾਂ ਮਹਿੰਗੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **ਨਵਾਂ AZD environment ਬਣਾਓ:**
```bash
azd env new myai-workshop
```

2. **ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# ਆਪਣਾ ਪਸੰਦੀਦਾ Azure ਖੇਤਰ ਸੈਟ ਕਰੋ
azd env set AZURE_LOCATION eastus

# ਵਿਕਲਪਿਕ: ਕਿਸੇ ਖਾਸ OpenAI ਮਾਡਲ ਨੂੰ ਸੈਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **AZD ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ:**
```bash
azd up
```

**`azd up` ਦੌਰਾਨ ਕੀ ਹੁੰਦਾ ਹੈ:**
- ✅ Azure OpenAI ਸੇਵਾ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ
- ✅ Cognitive Search ਸੇਵਾ ਬਣਾਉਂਦਾ ਹੈ
- ✅ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਲਈ App Service ਸੈੱਟਅਪ ਕਰਦਾ ਹੈ
- ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਨੂੰ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਤਾਇਨਾਤ ਕਰਦਾ ਹੈ
- ✅ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈੱਟ ਕਰਦਾ ਹੈ

2. **ਤਾਇਨਾਤ ਪ੍ਰਗਤੀ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੇ ਰਿਸੋਰਸਾਂ ਨੂੰ ਨੋਟ ਕਰੋ।

### Step 2.3: Verify Your Deployment

1. **ਤਾਇਨਾਤ ਰਿਸੋਰਸਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਤਾਇਨਾਤ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI ਫੰਕਸ਼ਨਲਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ:**
   - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ 'ਤੇ ਜਾਓ
   - ਨਮੂਨੇ ਪ੍ਰਸ਼ਨਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
   - ਪੱਕਾ ਕਰੋ ਕਿ AI ਜਵਾਬ ਕੰਮ ਕਰ ਰਹੇ ਹਨ

### **Lab Exercise 2.1: Troubleshooting Practice**

**ਸਥਿਤੀ**: ਤੁਹਾਡੀ ਤਾਇਨਾਤ ਸਫਲ ਰਹੀ ਹੈ ਪਰ AI ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਆਮ ਸਮੱਸਿਆਵਾਂ ਜਿਨ੍ਹਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
1. **OpenAI API keys**: ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਉਹ ਸਹੀ ਢੰਗ ਨਾਲ ਸੈੱਟ ਹਨ
2. **Model availability**: ਜਾਂਚ ਕਰੋ ਕਿ ਤੁਹਾਡੇ ਖੇਤਰ ਵਿੱਚ ਮਾਡਲ ਸਪੋਰਟ ਹੁੰਦਾ ਹੈ ਜਾਂ ਨਹੀਂ
3. **Network connectivity**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਸੇਵਾਵਾਂ ਆਪਸ ਵਿੱਚ ਸੰਚਾਰ ਕਰ ਸਕਦੀਆਂ ਹਨ
4. **RBAC permissions**: ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਐਪ OpenAI ਤੱਕ ਪਹੁੰਚ ਸਕਦੀ ਹੈ

**ਡੀਬੱਗਿੰਗ ਕਮਾਂਡਸ:**
```bash
# ਮਾਹੌਲ ਦੇ ਵੈਰੀਏਬਲ ਜਾਂਚੋ
azd env get-values

# ਡਿਪਲੋਇਮੈਂਟ ਲੌਗ ਵੇਖੋ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **OpenAI ਮਾਡਲ ਅੱਪਡੇਟ ਕਰੋ:**
```bash
# ਕਿਸੇ ਹੋਰ ਮਾਡਲ ਉੱਤੇ ਬਦਲੋ (ਜੇ ਤੁਹਾਡੇ ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ ਹੋਵੇ)
azd env set AZURE_OPENAI_MODEL gpt-4

# ਨਵੀਂ ਸੰਰਚਨਾ ਨਾਲ ਦੁਬਾਰਾ ਤੈਨਾਤ ਕਰੋ
azd deploy
```

2. **ਵਾਧੂ AI ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ:**

`infra/main.bicep` ਨੂੰ ਸੋਧੋ ਅਤੇ Document Intelligence ਜੋੜੋ:

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

**ਬਿਹਤਰ ਅਭਿਆਸ**: ਡਿਵੈਲਪਮੈਂਟ ਅਤੇ ਉਤਪਾਦਨ ਲਈ ਵੱਖ-ਵੱਖ ਕੰਫਿਗਰੇਸ਼ਨ ਰੱਖੋ।

1. **ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ ਬਣਾਉ:**
```bash
azd env new myai-production
```

2. **ਉਤਪਾਦਨ-ਨਿਰਧਾਰਿਤ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# ਉਤਪਾਦਨ ਆਮ ਤੌਰ ਤੇ ਉੱਚੇ SKUs ਵਰਤਦਾ ਹੈ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ਵਾਧੂ ਸੁਰੱਖਿਆ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਚਾਲੂ ਕਰੋ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**ਚੈਲੈਂਜ**: ਵਿਕਾਸ ਲਈ ਲਾਗਤ-ਕੁਸ਼ਲ ਟੈਂਪਲੇਟ ਸੰਰਚਨਾ ਕਰੋ।

**ਟਾਸਕ:**
1. ਪਛਾਣੋ ਕਿ ਕਿਹੜੇ SKUs ਨੂੰ free/basic ਟੀਅਰ 'ਤੇ ਸੈੱਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
2. ਘੱਟੋ-ਘੱਟ ਲਾਗਤ ਲਈ environment variables ਕੰਫਿਗਰ ਕਰੋ
3. ਤਾਇਨਾਤ ਕਰੋ ਅਤੇ ਉਤਪਾਦਨ ਸੰਰਚਨਾ ਨਾਲ ਲਾਗਤਾਂ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਸੁਝਾਵਾਂ:**
- ਸੰਭਵ ਹੋਵੇ ਤਾਂ Cognitive Services ਲਈ F0 (free) ਟੀਅਰ ਵਰਤੋਂ
- ਵਿਕਾਸ ਲਈ Search Service ਲਈ Basic ਟੀਅਰ ਵਰਤੋਂ
- Functions ਲਈ Consumption ਪਲੈਨ ਬਾਰੇ ਸੋਚੋ

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**ਮੌਜੂਦਾ ਚੈਲੈਂਜ**: ਕਈ AI ਐਪ API ਕੁੰਜੀਆਂ ਨੂੰ ਹਾਰਡਕੋਡ ਕਰਦੇ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਵਰਤਦੇ ਹਨ।

**AZD ਸਲੂਸ਼ਨ**: Managed Identity + Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ।

1. **ਆਪਣੇ ਟੈਂਪਲੇਟ ਵਿੱਚ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
# Key Vault ਅਤੇ Managed Identity ਦੀ ਸੰਰਚਨਾ ਦੀ ਖੋਜ ਕਰੋ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity ਕੰਮ ਕਰ ਰਿਹਾ ਹੈ ਯਾ ਨਹੀਂ ਇਸਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:**
```bash
# ਜਾਂਚੋ ਕਿ ਵੈੱਬ ਐਪ ਦੀ ਪਹਿਚਾਣ ਸੰਰਚਨਾ ਸਹੀ ਹੈ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **ਪਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਨੂੰ ਯੋਗ ਕਰੋ** (ਜੇ ਪਹਿਲਾਂ کانਫਿਗਰ ਨਹੀਂ): 

ਆਪਣੇ bicep ਟੈਂਪਲੇਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:
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

1. **Application Insights ਕੰਫਿਗਰ ਕਰੋ:**
```bash
# Application Insights ਨੂੰ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਸੰਰਚਿਤ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
# ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ਖਾਸ ਮਾਨੀਟਰਿੰਗ ਸੈੱਟ ਕਰੋ:**

AI ਓਪਰੇਸ਼ਨਾਂ ਲਈ ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਸ਼ਾਮਲ ਕਰੋ:
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

**ਟਾਸਕ**: ਆਪਣੇ ਤਾਇਨਾਤ ਦੀ ਸੁਰੱਖਿਆ ਉੱਤਮ ਅਭਿਆਸ ਲਈ ਸਮੀਖਿਆ ਕਰੋ।

**ਚੈਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਸੰਰਚਨਾ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਸਿਕ੍ਰੇਟਸ ਨਾ ਹੋਣ
- [ ] ਸੇਵਾ-ਤੋਂ-ਸੇਵਾ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ Managed Identity ਵਰਤਿਆ ਗਿਆ ਹੋਵੇ
- [ ] Key Vault ਸੰਵੇਦਨਸ਼ੀਲ ਸੰਰਚਨਾ ਸੰਭਾਲਦਾ ਹੋਵੇ
- [ ] ਨੈੱਟਵਰਕ ਪਹੁੰਚ ਢੰਗ ਨਾਲ ਸੀਮਿਤ ਕੀਤੀ ਗਈ ਹੋਵੇ
- [ ] ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਚਾਲੂ ਹੋਣ

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**ਆਪਣੀ ਐਪ ਨੂੰ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਪ੍ਰਸ਼ਨ ਉੱਤਰ ਕਰੋ:

1. **Application Architecture:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਹੜੀਆਂ AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦੀ ਹੈ?
   - ਇਸਨੂੰ ਕਿਹੜੀਆਂ ਕਮਪਿਊਟ ਰਿਸੋਰਸਾਂ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡੇਟਾਬੇਸ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਦੇ ਦਰਮਿਆਨ ਆਧਾਰ-ਨਿਰਭਰਤਾਵਾਂ ਕੀ ਹਨ?

2. **Security Requirements:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਹੜਾ ਸੰਵੇਦਨਸ਼ੀਲ ਡੇਟਾ ਹੈਂਡਲ ਕਰਦੀ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਸ ਤਰ੍ਹਾਂ ਦੀ ਕੰਪਲਾਇੰਸ ਲੋੜ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈੱਟਵਰਕਿੰਗ ਦੀ ਲੋੜ ਹੈ?

3. **Scaling Requirements:**
   - ਤੁਹਾਡਾ ਅੰਦਾਜ਼ਾ ਲੋਡ ਕੀ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਕੋਈ ਖੇਤਰੀ (regional) ਲੋੜਾਂ ਹਨ?

### Step 5.2: Create Your AZD Template

**ਆਪਣੀ ਐਪ ਨੂੰ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਲਈ ਇਸ ਪੈਟਰਨ ਨੂੰ ਫਾਲੋ ਕਰੋ:**

1. **ਮੁਢਲਾ ਢਾਂਚਾ ਬਣਾਓ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ਟੈਮਪਲੇਟ ਨੂੰ ਇਨਿਸ਼ੀਅਲਾਈਜ਼ ਕਰੋ
azd init --template minimal
```

2. **azure.yaml ਬਣਾਓ:**
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

3. **ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੈਂਪਲੇਟ ਬਣਾਓ:**

**infra/main.bicep** - ਮੱਖ ਟੈਂਪਲੇਟ:
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

**infra/modules/openai.bicep** - OpenAI ਮੌਡਿਊਲ:
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

**ਚੈਲੈਂਜ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ AI ਐਪ ਲਈ ਇੱਕ AZD ਟੈਂਪਲੇਟ ਬਣਾਓ।

**ਲੋੜਾਂ:**
- ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Azure OpenAI
- OCR ਲਈ Document Intelligence
- ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਲਈ Storage Account
- ਪ੍ਰੋਸੈਸਿੰਗ ਲੌਜਿਕ ਲਈ Function App
- ਯੂਜ਼ਰ ਇੰਟਰਫੇਸ ਲਈ Web app

**ਬੋਨਸ ਪੌਇੰਟਸ:**
- ਢੁਕਵਾਂ ਐਰਰ ਹੈਂਡਲਿੰਗ ਸ਼ਾਮਲ ਕਰੋ
- ਲਾਗਤ ਅਨੁਮਾਨ ਸ਼ਾਮਲ ਕਰੋ
- ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਸੈੱਟ ਕਰੋ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**ਲੱਛਣ:** ਤਾਇਨਾਤ quota error ਨਾਲ ਫੇਲ ਹੁੰਦੀ ਹੈ  
**ਸਮਾਧਾਨ:**
```bash
# ਮੌਜੂਦਾ ਕੋਟਿਆਂ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਕੋਟੇ ਵਧਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ ਜਾਂ ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਨੂੰ ਅਜ਼ਮਾਓ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**ਲੱਛਣ:** AI ਜਵਾਬ ਫੇਲ ਹੋ ਜਾਂਦੇ ਹਨ ਜਾਂ ਮਾਡਲ ਤਾਇਨਾਤ ਤਰੁੱਟੀਆਂ ਆਉਂਦੀਆਂ ਹਨ  
**ਸਮਾਧਾਨ:**
```bash
# ਖੇਤਰ ਅਨੁਸਾਰ ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਜਾਂਚੋ
az cognitiveservices model list --location eastus

# ਉਪਲਬਧ ਮਾਡਲ ਵਿੱਚ ਅਪਡੇਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**ਲੱਛਣ:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਦਿਆਂ 403 Forbidden errors ਆਉਂਦੇ ਹਨ  
**ਸਮਾਧਾਨ:**
```bash
# ਭੂਮਿਕਾ ਨਿਰਧਾਰਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਗਾਇਬ ਭੂਮਿਕਾਵਾਂ ਜੋੜੋ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**ਜਾਂਚ ਕਦਮ:**
1. Application Insights ਵਿੱਚ ਪਰਫਾਰਮੈਂਸ ਮੈਟ੍ਰਿਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
2. Azure ਪੋਰਟਲ ਵਿੱਚ OpenAI ਸੇਵਾ ਮੈਟ੍ਰਿਕਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਕੁਨੈਕਟਿਵਿਟੀ ਅਤੇ ਲੇਟੇੰਸੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

**ਸਮਾਧਾਨ:**
- ਆਮ ਪ੍ਰਸ਼ਨਾਂ ਲਈ ਕੇਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਆਪਣੇ use-case ਲਈ ਉਚਿਤ OpenAI ਮਾਡਲ ਵਰਤੋਂ
- ਉੱਚ ਲੋਡ ਸਥਿਤੀਆਂ ਲਈ ਰੀਡ ਰੇਪਲਿਕਾਸ ਬਾਰੇ ਸੋਚੋ

### **Lab Exercise 6.1: Debugging Challenge**

**ਸਥਿਤੀ**: ਤੁਹਾਡੀ ਤਾਇਨਾਤ ਸਫਲ ਰਹੀ, ਪਰ ਐਪਲੀਕੇਸ਼ਨ 500 errors ਵਾਪਸ ਕਰ ਰਿਹਾ ਹੈ।

**ਡੀਬੱਗਿੰਗ ਟਾਸਕ:**
1. ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਜ਼ ਚੈੱਕ ਕਰੋ
2. ਸੇਵਾ ਕੁਨੈਕਟਿਵਿਟੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
3. ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
4. ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ

**ਵਰਤੀ ਜਾਣ ਵਾਲੀਆਂ ਟੂਲਸ:**
- `azd show` ਤਾਇਨਾਤ ਓਵਰਵਿਊ ਲਈ
- ਵਿਸਤਾਰਤ ਸੇਵਾ ਲੌਗਜ਼ ਲਈ Azure ਪੋਰਟਲ
- ਐਪਲੀਕੇਸ਼ਨ ਟੈਲੀਮੇਟਰੀ ਲਈ Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **ਕਸਟਮ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ:**

Azure ਪੋਰਟਲ 'ਤੇ ਜਾਓ ਅਤੇ ਇੱਕ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ ਜਿਸ ਵਿੱਚ:
- OpenAI ਦੀਆਂ ਕਰੋੜੀਆਂ ਬੇਨਤੀਆਂ ਅਤੇ ਲੇਟੈਂਸੀ
- ਐਪਲੀਕੇਸ਼ਨ ਐਰਰ ਦਰ
- ਰਿਸੋਰਸ ਉਪਯੋਗਤਾ
- ਲਾਗਤ ਟਰੈਕਿੰਗ

2. **ਅਲਰਟ ਸੈੱਟ ਕਰੋ:**
```bash
# ਉੱਚ ਗਲਤੀ ਦਰ ਲਈ ਚੇਤਾਵਨੀ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **ਮੌਜੂਦਾ ਲਾਗਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲਾਗਤ ਦਾ ਡੇਟਾ ਪ੍ਰਾਪਤ ਕਰੋ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ਲਾਗਤ ਨਿਯੰਤਰਣ ਲਾਗੂ ਕਰੋ:**
- ਬਜਟ ਅਲਰਟ ਸੈੱਟ ਕਰੋ
- ਆਟੋਸਕੇਲਿੰਗ ਨੀਤੀਆਂ ਵਰਤੋਂ
- ਰਿਕਵੇਸਟ ਕੇਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- OpenAI ਲਈ ਟੋਕਨ ਵਰਤੋਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ

### **Lab Exercise 7.1: Performance Optimization**

**ਟਾਸਕ**: ਦੋਹਾਂ ਕਾਰਗੁਜ਼ਾਰੀ ਅਤੇ ਲਾਗਤ ਲਈ ਆਪਣੇ AI ਐਪ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ।

**ਬਿਹਤਰ ਕਰਨ ਲਈ ਮੈਟ੍ਰਿਕਸ:**
- ਔਸਤ ਜਵਾਬ ਸਮੇਂ ਨੂੰ 20% ਘਟਾਓ
- ਮਹੀਨਾਵਾਰ ਲਾਗਤਾਂ 15% ਘਟਾਓ
- 99.9% ਅਪਟਾਈਮ ਬਣਾਈ ਰੱਖੋ

**ਅਜ਼ਮਾਉਣ ਯੋਗ ਰਣਨੀਤੀਆਂ:**
- ਜਵਾਬਾਂ ਦੀ ਕੇਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਟੋਕਨ ਕੁਸ਼ਲਤਾ ਲਈ ਪ੍ਰਾਂਪਟਾਂ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ
- ਉਚਿਤ ਕਮਪਿਊਟ SKUs ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਠੀਕ ਆਟੋਸਕੇਲਿੰਗ ਸੈੱਟ ਕਰੋ

## Final Challenge: End-to-End Implementation

### Challenge Scenario

ਤੁਹਾਨੂੰ ਇੱਕ ਉਤਪਾਦਨ-ਤਿਆਰ AI-ਚਲਿਤ ਗ੍ਰਾਹਕ ਸੇਵਾ ਚੈਟਬੋਟ ਬਣਾਉਣ ਦਾ ਕਾਰਜ ਦਿੱਤਾ ਗਿਆ ਹੈ ਜਿਸ ਦੀਆਂ ਲੋੜਾਂ ਹੇਠਾਂ ਹਨ:

**ਫੰਕਸ਼ਨਲ ਲੋੜਾਂ:**
- ਗਾਹਕ ਇੰਟਰੈਕਸ਼ਨ ਲਈ ਵੈੱਬ ਇੰਟਰਫੇਸ
- ਜਵਾਬਾਂ ਲਈ Azure OpenAI ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- Cognitive Search ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹੋਏ ਦਸਤਾਵੇਜ਼ ਖੋਜ ਸਮਰੱਥਾ
- ਮੌਜੂਦਾ ਗਾਹਕ ਡੇਟਾਬੇਸ ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਬਹੁ-ਭਾਸ਼ਾਈ ਸਮਰਥਨ

**ਨਾ-ਫੰਕਸ਼ਨਲ ਲੋੜਾਂ:**
- 1000 concurrent ਯੂਜ਼ਰ ਹਨਡਲ ਕਰਨੇ
- 99.9% uptime SLA
- SOC 2 ਕੰਪਲਾਇੰਸ
- ਮਹੀਨਾਵਾਰ ਲਾਗਤ $500 ਤੋਂ ਘੱਟ
- ਬਹੁਤ ਸਾਰਿਆਂ ਵਾਤਾਵਰਣਾਂ 'ਤੇ ਤਾਇਨਾਤ (dev, staging, prod)

### Implementation Steps

1. ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਇਨ ਕਰੋ
2. AZD ਟੈਂਪਲੇਟ ਬਣਾਓ
3. ਸੁਰੱਖਿਆ ਉਪਾਇ ਲਾਗੂ ਕਰੋ
4. ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਸੈੱਟ ਕਰੋ
5. ਤਾਇਨਾਤ ਪਾਈਪਲਾਈਨਾਂ ਬਣਾਓ
6. ਸਲੂਸ਼ਨ ਦਾ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ

### Evaluation Criteria

- ✅ **ਕਾਰਗੁਜ਼ਾਰੀ**: ਕੀ ਇਹ ਹਰ ਲੋੜ ਪੂਰੀ ਕਰਦਾ ਹੈ?
- ✅ **ਸੁਰੱਖਿਆ**: ਕੀ ਬਿਹਤਰ ਅਭਿਆਸ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ?
- ✅ **ਸਕੇਲਬਿਲਟੀ**: ਕੀ ਇਹ ਲੋਡ ਸਹਿਣ ਯੋਗ ਹੈ?
- ✅ **ਮੈਂਟੇਨਬਿਲਟੀ**: ਕੀ ਕੋਡ ਅਤੇ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਵਧੀਆ ਤਰੀਕੇ ਨਾਲ ਰਚਿਆ ਗਿਆ ਹੈ?
- ✅ **ਲਾਗਤ**: ਕੀ ਇਹ ਬਜਟ ਦੇ ਅੰਦਰ ਰਹਿੰਦਾ ਹੈ?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ਪੂਰਨਤਾ ਸਰਟੀਫਿਕੇਟ
Congratulations! You've completed the AI Workshop Lab. You should now be able to:

- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ AZD ਟੈਮਪਲੇਟਾਂ ਵਿੱਚ ਬਦਲੋ
- ✅ ਉਤਪਾਦਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਤੈਨਾਤੀ ਕਰੋ
- ✅ AI ਕਾਰਜਭਾਰਾਂ ਲਈ ਸੁਰੱਖਿਆ ਦੇ ਸਰਵੋਤਮ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋ
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਅਨੁਕੂਲਤਾ ਕਰੋ
- ✅ ਆਮ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤਰੱਕੀ ਨਾਲ ਹੱਲ ਕਰੋ

### ਅਗਲੇ ਕਦਮ
1. ਇਹ ਪੈਟਰਨ ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਾਂ 'ਤੇ ਲਾਗੂ ਕਰੋ
2. ਟੈਮਪਲੇਟ ਸਮੁਦਾਇ ਨੂੰ ਵਾਪਸ ਯੋਗਦਾਨ ਦਿਓ
3. ਲਗਾਤਾਰ ਸਹਾਇਤਾ ਲਈ Microsoft Foundry Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ
4. ਬਹੁ-ਖੇਤਰ ਤੈਨਾਤੀਆਂ ਵਰਗੇ ਉਨਤ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ

---

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਸੁਧਾਰਨ ਵਿੱਚ ਸਾਡੀ ਮਦਦ ਕਰੋ — ਆਪਣਾ ਅਨੁਭਵ [Microsoft Foundry Discord #Azure ਚੈਨਲ](https://discord.gg/microsoft-azure) ਵਿੱਚ ਸਾਂਝਾ ਕਰਕੇ।

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੌਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਉਤਪਾਦਨ AI ਸਰਵੋਤਮ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

**ਸਹਾਇਤਾ ਚਾਹੀਦੀ ਹੈ?** AZD ਅਤੇ AI ਡਿਪਲੋਇਮੈਂਟਸ ਬਾਰੇ ਸਹਿਯੋਗ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੇ ਸਮੁਦਾਇ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰਤਾ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਨੂੰ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀਤਾ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਤੀਰਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਵੱਜੋਂ ਹੀ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਗੰਭੀਰ ਜਾਂ ਮਹੱਤਵਪੂਰਕ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਉਪਜਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਠੀਕ-ਨਾਠੀਆਂ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->