# AI ਵਰਕਸ਼ਾਪ ਲੈਬ: ਤੁਹਾਡੇ AI ਹੱਲਾਂ ਨੂੰ AZD-ਤੇ ਤਾਇਨਾਤ ਕਰਨ ਯੋਗ ਬਣਾਉਣਾ

**Chapter Navigation:**
- **📚 Course Home**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI ਮਾਡਲ ਤਾਇਨਾਤ](ai-model-deployment.md)
- **➡️ Next**: [ਪ੍ਰੋਡਕਸ਼ਨ AI ਲਈ ਬਿਹਤਰ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 Next Chapter**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

## Workshop Overview

ਇਹ ਹੱਥ-ਅਨੁਭਵੀ ਲੈਬ ਵਿਕਾਸਕਾਰਾਂ ਨੂੰ ਮੌਜੂਦਾ AI ਟੈਮਪਲੇਟ ਨੂੰ ਲੈ ਕੇ ਇਸਨੂੰ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਨਾਲ ਤਾਇਨਾਤ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਰਾਹ ਦਿਖਾਉਂਦੀ ਹੈ। ਤੁਸੀਂ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹੋਏ ਪ੍ਰੋਡਕਸ਼ਨ AI ਤਾਇਨਾਤ ਲਈ ਆਵਸ਼ਯਕ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਮਪਲੇਟ ਦੀ ਵਰਤੋਂ ਲਈ ਬਦਲਣਾ
- ✅ AZD ਨਾਲ Microsoft Foundry ਸੇਵਾਵਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨਾ
- ✅ AI ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਕ੍ਰੈਡੈਂਸ਼ਲ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰਨਾ
- ✅ ਮਾਨੀਟਰਿੰਗ ਸਹਿਤ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨ ਤਾਇਨਾਤ ਕਰਨਾ
- ✅ ਆਮ AI ਤਾਇਨਾਤ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨਾ

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਐਡੀਟਰ (VS Code ਦੀ ਸਿਫਾਰਿਸ਼)

### Azure Resources
- Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਿਸ ਵਿੱਚ ਕੰਟ੍ਰੀਬਿਊਟਰ ਐਕਸੈਸ ਹੋਵੇ
- Microsoft Foundry Models ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰਨ ਦੀ ਸਮਰੱਥਾ)
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀਆਂ ਆਗਿਆਵਾਂ

### Knowledge Prerequisites
- Azure ਸੇਵਾਵਾਂ ਦੀ ਮੂਲ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸਾਂ ਨਾਲ ਪਰਿਚਿਤਤਾ
- AI/ML ਦੀਆਂ ਮੁਢਲੀ ਦੀਆਂ ਸੰਕਲਪਾਂ (APIs, ਮਾਡਲ, ਪ੍ਰਾਂਪਟ)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD ਇੰਸਟਾਲੇਸ਼ਨ ਚੈੱਕ ਕਰੋ
azd version

# Azure CLI ਚੈੱਕ ਕਰੋ
az --version

# Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ AZD ਸੰਰਚਨਾ ਨੂੰ ਸਮਝਣਾ

### AI AZD ਟੈਮਪਲੇਟ ਦੀ ਬਣਤਰ

AI-ਤਿਆਰ AZD ਟੈਮਪਲੇਟ ਵਿੱਚ ਮੁੱਖ ਫਾਇਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **ਲੇਬ ਅਭਿਆਸ 1.1: ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ**

1. **azure.yaml ਫਾਈਲ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਕਿਹੜੀਆਂ ਚੀਜ਼ਾਂ 'ਤੇ ਧਿਆਨ ਦਿਓ:**
- AI ਕੰਪੋਨੈਂਟਾਂ ਲਈ ਸੇਵਾ ਪਰਿਭਾਸ਼ਾਵਾਂ
- ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਮੈਪਿੰਗ
- ਹੋਸਟ ਸੰਰਚਨਾਵਾਂ

2. **main.bicep ਇੰਫ਼੍ਰਾਸਟ੍ਰਕਚਰ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**ਪਛਾਣ ਕਰਨ ਲਈ ਮੁੱਖ AI ਪੈਟਰਨ:**
- Microsoft Foundry Models ਸੇਵਾ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- Cognitive Search ਇੰਟਿਗਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੀ ਪ੍ਰਬੰਧਨ
- ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾਂ

### **ਚਰਚਾ ਬਿੰਦੂ:** AI ਲਈ ਇਹ ਪੈਟਰਨ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹਨ

- **Service Dependencies**: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਅਕਸਰ ਕਈ ਸਹਿਯੋਗੀ ਸੇਵਾਵਾਂ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **Security**: API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੋਇੰਟਸ ਨੂੰ ਸੁਰੱਖਿਅਤ ਪ੍ਰਬੰਧਨ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **Scalability**: AI ਵਰਕਲੋਡਾਂ ਲਈ ਵਿਲੱਖਣ ਸਕੇਲਿੰਗ ਦੀਆਂ ਲੋੜਾਂ ਹੁੰਦੀਆਂ ਹਨ
- **Cost Management**: ਜੇ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਨਾ ਕੀਤਾ ਜਾਵੇ ਤਾਂ AI ਸੇਵਾਵਾਂ ਮਹਿੰਗੀਆਂ ਪੈ ਸਕਦੀਆਂ ਹਨ

## Module 2: ਆਪਣੀ ਪਹਿਲੀ AI ਐਪਲੀਕੇਸ਼ਨ ਤਾਇਨਾਤ ਕਰੋ

### Step 2.1: Environment ਸ਼ੁਰੂ ਕਰੋ

1. **ਨਵਾਂ AZD ਇਨਵਾਇਰਨਮੈਂਟ ਬਣਾਓ:**
```bash
azd env new myai-workshop
```

2. **ਜ਼ਰੂਰੀ ਪੈਰਾਮੀਟਰ ਸੈਟ ਕਰੋ:**
```bash
# ਆਪਣੀ ਪਸੰਦੀਦਾ Azure ਰੀਜਨ ਸੈੱਟ ਕਰੋ
azd env set AZURE_LOCATION eastus

# ਵਿਕਲਪਿਕ: ਖਾਸ OpenAI ਮਾਡਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: ਇੰਫ਼੍ਰਾਸਟ੍ਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤਾਇਨਾਤ ਕਰੋ

1. **AZD ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ:**
```bash
azd up
```

**`azd up` ਦੌਰਾਨ ਕੀ ਹੁੰਦਾ ਹੈ:**
- ✅ Microsoft Foundry Models ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕੀਤੀ ਜਾਂਦੀ ਹੈ
- ✅ Cognitive Search ਸੇਵਾ ਬਣਾਈ ਜਾਂਦੀ ਹੈ
- ✅ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਲਈ App Service ਸੈਟ ਕੀਤਾ ਜਾਂਦਾ ਹੈ
- ✅ ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੰਰਚਿਤ ਕੀਤੀ ਜਾਂਦੀ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤਾਇਨਾਤ ਕੀਤਾ ਜਾਂਦਾ ਹੈ
- ✅ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈਟ ਕੀਤੇ ਜਾਂਦੇ ਹਨ

2. **ਤਾਇਨਾਤੀ ਉੱਨਤੀ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੀਆਂ ਰਿਸੋਰਸਾਂ ਨੂੰ ਨੋਟ ਕਰੋ।

### Step 2.3: ਆਪਣੀ ਤਾਇਨਾਤ ਦੀ ਜਾਂਚ ਕਰੋ

1. **ਤਾਇਨਾਤ ਕੀਤੀਆਂ ਰਿਸੋਰਸਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਤਾਇਨਾਤ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI ਫੰਕਸ਼ਨਾਲਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ:**
   - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ 'ਤੇ ਨੈਵੀਗੇਟ ਕਰੋ
   - ਨਮੂਨਾ ਕੁਇਰੀਆਂ ਅਜ਼ਮਾਓ
   - ਜਾਂਚੋ ਕਿ AI ਦੇ ਜਵਾਬ ਕੰਮ ਕਰ ਰਹੇ ਹਨ

### **ਲੇਬ ਅਭਿਆਸ 2.1: ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਭਿਆਸ**

**ਪਰਿਸਥਿਤੀ**: ਤੁਸੀਂ ਤਾਇਨਾਤ ਸਫਲ ਕਰ ਲਈ, ਪਰ AI ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਆਮ ਸਮੱਸਿਆਵਾਂ ਜਾਂਚਣ ਲਈ:**
1. **OpenAI API ਕੁੰਜੀਆਂ**: ਜਾਂਚੋ ਕਿ ਇਹ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੈਟ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ
2. **Model availability**: ਦੇਖੋ ਕਿ ਤੁਹਾਡੇ ਰੀਜ਼ਨ ਵਿੱਚ ਮਾਡਲ ਸਮਰਥਿਤ ਹੈ ਜਾਂ ਨਹੀਂ
3. **Network connectivity**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਸੇਵਾਵਾਂ ਆਪਸ ਵਿੱਚ ਸੰਚਾਰ ਕਰ ਸਕਦੀਆਂ ਹਨ
4. **RBAC permissions**: ਜਾਂਚੋ ਕਿ ਐਪ OpenAI ਤੱਕ ਪਹੁੰਚ ਸਕਦੀ ਹੈ

**ਡੈਬੱਗਿੰਗ ਕਮਾਂਡਾਂ:**
```bash
# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values

# ਡਿਪਲੋਇਮੈਂਟ ਲੌਗਾਂ ਵੇਖੋ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਚੈੱਕ ਕਰੋ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: ਆਪਣੀਆਂ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਆਪਣੇ ਲੋੜਾਂ ਅਨੁਸਾਰ ਅਨੁਕੂਲ ਕਰੋ

### Step 3.1: AI ਸੰਰਚਨਾ ਸੋਧੋ

1. **OpenAI ਮਾਡਲ ਅਪਡੇਟ ਕਰੋ:**
```bash
# ਕਿਸੇ ਹੋਰ ਮਾਡਲ ਵਿੱਚ ਬਦਲੋ (ਜੇ ਤੁਹਾਡੇ ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ ਹੋਵੇ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ਨਵੀਂ ਸੰਰਚਨਾ ਨਾਲ ਮੁੜ ਡਿਪਲੋਇ ਕਰੋ
azd deploy
```

2. **ਸਾਤੀ AI ਸੇਵਾਵਾਂ ਸ਼ਾਮਿਲ ਕਰੋ:**

Document Intelligence ਸ਼ਾਮਿਲ ਕਰਨ ਲਈ `infra/main.bicep` ਨੂੰ ਸੋਧੋ:

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

### Step 3.2: ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਿਤ ਸੰਰਚਨਾਵਾਂ

**ਬਿਹਤਰ ਅਭਿਆਸ**: ਵਿਕਾਸ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਰੱਖੋ।

1. **ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-production
```

2. **ਪ੍ਰੋਡਕਸ਼ਨ-ਨਿਰਧਾਰਿਤ ਪੈਰਾਮੀਟਰ ਸੈਟ ਕਰੋ:**
```bash
# ਉਤਪਾਦਨ ਆਮ ਤੌਰ ਤੇ ਉੱਚ-ਸਤਰ ਦੇ SKUs ਵਰਤਦਾ ਹੈ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ਵਾਧੂ ਸੁਰੱਖਿਆ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਚਾਲੂ ਕਰੋ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ਰੇਬ ਅਭਿਆਸ 3.1: ਲਾਗਤ ਅਨੁਕੂਲਣ**

**ਚੈਲੈਂਜ**: ਟੈਮਪਲੇਟ ਨੂੰ ਖਰਚ-ਕੁਸ਼ਲ ਵਿਕਾਸ ਲਈ ਸੰਰਚਿਤ ਕਰੋ।

**ਟਾਸਕ:**
1. ਪਛਾਣ ਕਰੋ ਕਿ ਕਿਹੜੀਆਂ SKUs ਨੂੰ ਫਰੀ/ਬੇਸਿਕ ਟੀਅਰ 'ਤੇ ਸੈਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
2. ਘੱਟੋ-ਘੱਟ ਲਾਗਤ ਲਈ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਕਨਫਿਗਰ ਕਰੋ
3. ਤਾਇਨਾਤ ਕਰੋ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਸੰਰਚਨਾ ਨਾਲ ਲਾਗਤ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਸੁਝਾਅ:**
- ਸੰਭਵ ਹੋਵੇ ਤਾਂ Cognitive Services ਲਈ F0 (free) ਟੀਅਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਵਿਕਾਸ ਲਈ Search Service ਲਈ Basic ਟੀਅਰ ਵਰਤੋ
- Functions ਲਈ Consumption ਯੋਜਨਾ ਦੇ ਬਾਰੇ ਵਿਚਾਰ ਕਰੋ

## Module 4: ਸੁਰੱਖਿਆ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਬਿਹਤਰ ਅਭਿਆਸ

### Step 4.1: ਸੁਰੱਖਿਅਤ ਕ੍ਰੈਡੈਂਸ਼ਲ ਪ੍ਰਬੰਧਨ

**ਮੌਜੂਦਾ ਚੁਣੌਤੀ**: ਕਈ AI ਐਪ API ਕੁੰਜੀਆਂ ਹਾਰਡਕੋਡ ਕਰਦੇ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਵਰਤਦੇ ਹਨ।

**AZD ਹੱਲ**: Managed Identity + Key Vault ਇੰਟਿਗਰੇਸ਼ਨ।

1. **ਆਪਣੇ ਟੈਮਪਲੇਟ ਵਿੱਚ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
# Key Vault ਅਤੇ Managed Identity ਦੀ ਸੰਰਚਨਾ ਲਈ ਲੱਭੋ
grep -r "keyVault\|managedIdentity" infra/
```

2. **ਸੁਰੱਖਿਅਤ Managed Identity ਕੰਮ ਕਰ ਰਹੀ ਹੈ ਜਾਂ ਨਹੀਂ, ਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
# ਜਾਂਚੋ ਕਿ ਵੈੱਬ ਐਪ ਵਿੱਚ ਸਹੀ ਆਈਡੈਂਟਿਟੀ ਸੰਰਚਨਾ ਹੈ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ

1. **ਪ੍ਰਾਈਵੇਟ ਐਂਡਪਾਇੰਟਸ ਯੋਗ ਕਰੋ** (ਜੇ ਪਹਿਲਾਂ ਤੋਂ ਸੰਰਚਿਤ ਨਾ ਹੋਵੇ):

ਆਪਣੇ bicep ਟੈਮਪਲੇਟ ਵਿੱਚ ਸ਼ਾਮਿਲ ਕਰੋ:
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

### Step 4.3: ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਪਰਖਣਯੋਗਤਾ

1. **Application Insights ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ:**
```bash
# Application Insights ਨੂੰ ਆਟੋਮੈਟਿਕ ਤੌਰ ਤੇ ਕੰਫਿਗਰ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
# ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ਖਾਸ ਮਾਨੀਟਰਿੰਗ ਸੈਟਅਪ ਕਰੋ:**

AI ਓਪਰੇਸ਼ਨਾਂ ਲਈ ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਸ਼ਾਮਿਲ ਕਰੋ:
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

### **ਲੇਬ ਅਭਿਆਸ 4.1: ਸੁਰੱਖਿਆ ਆਡਿਟ**

**ਟਾਸਕ**: ਆਪਣੀ ਤਾਇਨਾਤ ਦੀ ਸੁਰੱਖਿਆ ਬਿਹਤਰ ਅਭਿਆਸ ਲਈ ਸਮੀਖਿਆ ਕਰੋ।

**ਚੈੱਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਸੰਰਚਨਾ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਕੀਤਾ ਗਿਆ ਸੀਕਰੇਟ ਨਾ ਹੋਵੇ
- [ ] ਸੇਵਾ-ਤੋਂ-ਸੇਵਾ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ Managed Identity ਵਰਤੀ ਜਾਵੇ
- [ ] ਸੰਵੇਦਨਸ਼ੀਲ ਸੰਰਚਨਾ Key Vault ਵਿੱਚ ਸਟੋਰ ਹੋਵੇ
- [ ] ਨੈਟਵਰਕ ਪਹੁੰਚ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਸੀਮਿਤ ਹੋਵੇ
- [ ] ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਯੋਗ ਕੀਤੇ ਹੋਣ

## Module 5: ਆਪਣੀ ਆਪਣੀ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਤਬਦੀਲ ਕਰਨਾ

### Step 5.1: ਮੁਲਾਂਕਣ ਵਰਕਸ਼ੀਟ

**ਆਪਣੀ ਐਪ ਨੂੰ ਤਬਦੀਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਪ੍ਰਸ਼ਨ ਜਵਾਬ ਦਿਓ:

1. **Application Architecture:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਹੜੀਆਂ AI ਸੇਵਾਵਾਂ ਵਰਤਦੀ ਹੈ?
   - ਇਸਨੂੰ ਕਿਹੜੀਆਂ ਕੰਪਿਊਟ ਸੰਸਾਧਨ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡੈਟਾਬੇਜ਼ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਦਰਮਿਆਨ ਨਿਰਭਰਤਾਵਾਂ ਕੀ ਹਨ?

2. **Security Requirements:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਹੜੇ ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਨੂੰ ਹੈਂਡਲ ਕਰਦੀ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਹੜੀਆਂ ਕੰਪਲਾਇੰਸ ਲੋੜਾਂ ਹਨ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈਟਵਰਕਿੰਗ ਦੀ ਲੋੜ ਹੈ?

3. **Scaling Requirements:**
   - ਤੁਹਾਡਾ ਉਮੀਦ ਕੀਤਾ ਲੋਡ ਕਿੱਦਾ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਰੀਜ਼ਨਲ ਲੋੜਾਂ ਹਨ?

### Step 5.2: ਆਪਣਾ AZD ਟੈਮਪਲੇਟ ਬਣਾਓ

**ਆਪਣੀ ਐਪ ਨੂੰ ਬਦਲਣ ਲਈ ਇਹ ਪੈਟਰਨ ਫੋਲੋ ਕਰੋ:**

1. **ਬੇਸਿਕ ਸੰਰਚਨਾ ਬਣਾਓ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ਟੈਮਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
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

3. **ਇੰਫ਼੍ਰਾਸਟ੍ਰਕਚਰ ਟੈਮਪਲੇਟ ਬਣਾਓ:**

**infra/main.bicep** - ਮੁੱਖ ਟੈਮਪਲੇਟ:
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

**infra/modules/openai.bicep** - OpenAI ਮੋਡੀਊਲ:
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

### **ਲੇਬ ਅਭਿਆਸ 5.1: ਟੈਮਪਲੇਟ ਬਣਾਉਣ ਚੈਲੈਂਜ**

**ਚੈਲੈਂਜ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ AI ਐਪ ਲਈ AZD ਟੈਮਪਲੇਟ ਬਣਾਓ।

**ਮੰਗਾਂ:**
- ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Microsoft Foundry Models
- OCR ਲਈ Document Intelligence
- ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਲਈ Storage Account
- ਪ੍ਰੋਸੈਸਿੰਗ ਲੌਜਿਕ ਲਈ Function App
- ਯੂਜ਼ਰ ਇੰਟਰਫੇਸ ਲਈ ਵੈੱਬ ਐਪ

**ਬੋਨਸ ਪੌਇੰਟਸ:**
- ਠੀਕ ਏਰਰ ਹੈਂਡਲਿੰਗ ਸ਼ਾਮਿਲ ਕਰੋ
- ਲਾਗਤ ਅੰਦਾਜ਼ਾ ਸ਼ਾਮਿਲ ਕਰੋ
- ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਸੈਟਅਪ ਕਰੋ

## Module 6: ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਤਾਇਨਾਤ ਸਮੱਸਿਆਵਾਂ

#### Issue 1: OpenAI Service Quota Exceeded
**ਲੱਛਣ:** ਤਾਇਨਾਤ quota ਐਰਰ ਨਾਲ ਅਸਫਲ
**ਹੱਲ:**
```bash
# ਮੌਜੂਦਾ ਕੋਟਿਆਂ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਕੋਟੇ ਵਧਾਉਣ ਲਈ ਬੇਨਤੀ ਕਰੋ ਜਾਂ ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**ਲੱਛਣ:** AI ਜਵਾਬ ਫੇਲ ਜਾਂ ਮਾਡਲ ਤਾਇਨਾਤ ਏਰਰ
**ਹੱਲ:**
```bash
# ਖੇਤਰ ਅਨੁਸਾਰ ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices model list --location eastus

# ਉਪਲਬਧ ਮਾਡਲ 'ਤੇ ਅਪਡੇਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**ਲੱਛਣ:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਨ ਵੇਲੇ 403 Forbidden ਐਰਰ
**ਹੱਲ:**
```bash
# ਰੋਲ ਨਿਯੁਕਤੀਆਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਗਾਇਬ ਰੋਲ ਜੋੜੋ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

#### Issue 4: Slow AI Responses
**ਜਾਂਚਣ ਲਈ ਕਦਮ:**
1. ਪ੍ਰਦਰਸ਼ਨ ਮੈਟ੍ਰਿਕਸ ਲਈ Application Insights ਚੈੱਕ ਕਰੋ
2. Azure ਪੋਰਟਲ ਵਿੱਚ OpenAI ਸੇਵਾ ਮੈਟ੍ਰਿਕਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
3. ਨੈਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਅਤੇ ਲੈਟੈਂਸੀ ਦੀ ਜਾਂਚ ਕਰੋ

**ਹੱਲ:**
- ਆਮ ਕੁਇਰੀਆਂ ਲਈ ਕੇਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਆਪਣੇ ਉਏਸਕੇਸ ਲਈ ਉਚਿਤ OpenAI ਮਾਡਲ ਵਰਤੋ
- ਉੱਚ-ਲੋਡ ਹਾਲਾਤਾਂ ਲਈ ਰੀਡ ਰੈਪਲਿਕਾਸ 'ਤੇ ਵਿਚਾਰ ਕਰੋ

### **ਲੇਬ ਅਭਿਆਸ 6.1: ਡੈਬੱਗਿੰਗ ਚੈਲੈਂਜ**

**ਪਰਿਸਥਿਤੀ**: ਤੁਹਾਡੀ ਤਾਇਨਾਤ ਸਫਲ ਹੋਈ, ਪਰ ਐਪਲਿਕੇਸ਼ਨ 500 ਐਰਰ ਰਿਟਰਨ ਕਰ ਰਿਹਾ ਹੈ।

**ਡੈਬੱਗਿੰਗ ਟਾਸਕ:**
1. ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਚੈੱਕ ਕਰੋ
2. ਸੇਵਾ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ
3. ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
4. ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ

**ਵਰਤਣ ਵਾਲੇ ਟੂਲ:**
- `azd show` ਤਾਇਨਾਤ ਓਵਰਵਿਊ ਲਈ
- ਵਿਕਸਤ ਸੇਵਾ ਲੌਗਸ ਲਈ Azure ਪੋਰਟਲ
- ਐਪਲੀਕੇਸ਼ਨ ਟੈਲੀਮੇਟਰੀ ਲਈ Application Insights

## Module 7: ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਨੁਕੂਲਣ

### Step 7.1: ਵਿਸਤृत ਮਾਨੀਟਰਿੰਗ ਸੈਟਅਪ ਕਰੋ

1. **ਕਸਟਮ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ:**

Azure ਪੋਰਟਲ 'ਤੇ ਜਾਓ ਅਤੇ ਹੇਠਾਂ ਵਾਲੇ ਨਾਲ ਇੱਕ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ:
- OpenAI ਬੇਨਤੀ ਗਿਣਤੀ ਅਤੇ ਲੇਟੈਂਸੀ
- ਐਪਲੀਕੇਸ਼ਨ ਐਰਰ ਦੀ ਦਰ
- ਰਿਸੋਰਸ ਉਪਯੋਗਤਾ
- ਲਾਗਤ ਟਰੈਕਿੰਗ

2. **ਅਲਰਟਸ ਸੈਟਅਪ ਕਰੋ:**
```bash
# ਉੱਚ ਗਲਤੀ ਦਰ ਲਈ ਚੇਤਾਵਨੀ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: ਲਾਗਤ ਅਨੁਕੂਲਣ

1. **ਮੌਜੂਦਾ ਲਾਗਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲਾਗਤ ਡਾਟਾ ਪ੍ਰਾਪਤ ਕਰੋ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ਲਾਗਤ ਨਿਯੰਤਰਣ ਲਾਗੂ ਕਰੋ:**
- ਬਜਟ ਅਲਰਟ ਸੈਟ ਕਰੋ
- ਆਟੋਸਕੇਲਿੰਗ ਨੀਤੀਆਂ ਵਰਤੋਂ
- ਰਿਕਵੇਸਟ ਕੇਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- OpenAI ਲਈ ਟੋਕਨ ਵਰਤੋਂ ਦੀ ਨਗਰਾਨੀ ਕਰੋ

### **ਲੇਬ ਅਭਿਆਸ 7.1: ਪ੍ਰਦਰਸ਼ਨ ਅਨੁਕੂਲਣ**

**ਟਾਸਕ**: ਆਪਣੀ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਲਾਗਤ ਦੋਹਾਂ ਲਈ ਅਨੁਕੂਲ ਕਰੋ।

**ਸੁਧਾਰ ਕਰਨ ਲਈ ਮੈਟ੍ਰਿਕਸ:**
- ਔਸਤ ਪ੍ਰਤੀਕਿਰਿਆ ਸਮਾਂ 20% ਘਟਾਓ
- ਮਹੀਨਾਵਾਰ ਲਾਗਤ 15% ਘਟਾਓ
- 99.9% uptime ਬਣਾਈ ਰੱਖੋ

**ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਰਣਨੀਤੀਆਂ:**
- ਜਵਾਬ ਕੇਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਟੋਕਨ ਕੁਸ਼ਲਤਾ ਲਈ ਪ੍ਰਾਂਪਟਾਂ ਦਾ ਅਨੁਕੂਲਣ ਕਰੋ
- ਉਚਿਤ ਕੰਪਿਊਟ SKUs ਵਰਤੋਂ
- ਠੀਕ ਆਟੋਸਕੇਲਿੰਗ ਸੰਰਚਨਾ ਕਰੋ

## ਅੰਤਿਮ ਚੈਲੈਂਜ: ਐਂਡ-ਟੂ-ਐਂਡ ਇਮਪਲੀਮੈਂਟੇਸ਼ਨ

### ਚੈਲੈਂਜ ਪਰਿਸਥਿਤੀ

ਤੁਹਾਨੂੰ ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI-ਚਲਾਏ ਗ੍ਰਾਹਕ ਸੇਵਾ ਚੈਟਬੋਟ ਬਣਾਉਣ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਦਿੱਤੀ ਗਈ ਹੈ ਜਿਸ ਦੀਆਂ ਇਹ ਲੋੜਾਂ ਹਨ:

**ਫੰਕਸ਼ਨਲ ਲੋੜਾਂ:**
- ਗ੍ਰਾਹਕ ਇੰਟਰੈਕਸ਼ਨਾਂ ਲਈ ਵੈੱਬ ਇੰਟਰਫੇਸ
- ਜਵਾਬਾਂ ਲਈ Microsoft Foundry Models ਨਾਲ ਇੰਟਿਗਰੇਸ਼ਨ
- ਦਸਤਾਵੇਜ਼ ਖੋਜ ਸਮਰਥਾ Cognitive Search ਦੀ ਵਰਤੋਂ ਨਾਲ
- ਮੌਜੂਦਾ ਗ੍ਰਾਹਕ ਡੇਟਾਬੇਸ ਨਾਲ ਇੰਟਿਗਰੇਸ਼ਨ
- ਬਹੁ-ਭਾਸ਼ਾ ਸਹਾਇਤਾ

**ਗੈਰ-ਫੰਕਸ਼ਨਲ ਲੋੜਾਂ:**
- 1000 ਸਮਕਾਲੀ ਯੂਜ਼ਰ ਨੂੰ ਸਹਾਲੀ ਸੰਭਾਲ
- 99.9% uptime SLA
- SOC 2 compliance
- $500/ਮਹੀਨਾ ਤੋਂ ਘੱਟ ਲਾਗਤ
- ਕਈ ਵਾਤਾਵਰਣਾਂ (dev, staging, prod) ਵਿੱਚ ਤਾਇਨਾਤ

### ਇਮਪਲੀਮੈਂਟੇਸ਼ਨ ਕਦਮ

1. ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਈਨ ਕਰੋ
2. AZD ਟੈਮਪਲੇਟ ਬਣਾਓ
3. ਸੁਰੱਖਿਆ ਉਪਾਇ ਲਾਗੂ ਕਰੋ
4. ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਸੈਟਅਪ ਕਰੋ
5. ਤਾਇਨਾਤ ਪਾਈਪਲਾਈਨ ਬਣਾਓ
6. ਹੱਲ ਦੀ ਦਸਤਾਵੇਜ਼ ਤਿਆਰ ਕਰੋ

### ਮੂਲਾਂਕਣ ਮਾਪਦੰਡ

- ✅ **Functionality**: ਕੀ ਇਹ ਸਾਰੀਆਂ ਲੋੜਾਂ ਪੂਰੀਆਂ ਕਰਦਾ ਹੈ?
- ✅ **Security**: ਕੀ ਬਿਹਤਰ ਅਭਿਆਸ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ?
- ✅ **Scalability**: ਕੀ ਇਹ ਲੋਡ ਨੂੰ ਸੰਭਾਲ ਸਕਦਾ ਹੈ?
- ✅ **Maintainability**: ਕੀ ਕੋਡ ਅਤੇ ਇੰਫ਼੍ਰਾਸਟ੍ਰਕਚਰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਠੀਕ ਢੰਗ ਨਾਲ ਗਠਿਤ ਹਨ?
- ✅ **Cost**: ਕੀ ਇਹ ਬਜਟ ਵਿੱਚ ਰਹਿੰਦਾ ਹੈ?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

ਵਧਾਈਆਂ! ਤੁਸੀਂ AI ਵਰਕਸ਼ਾਪ ਲੈਬ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ। ਹੁਣ ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਣੇ ਚਾਹੀਦੇ ਹੋ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ AZD ਟੈਂਪਲੇਟਾਂ ਵਿੱਚ ਬਦਲੋ
- ✅ ਉਤਪਾਦਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰੋ
- ✅ AI ਵਰਕਲੋਡ ਲਈ ਸੁਰੱਖਿਆ ਲਈ ਬਿਹਤਰ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋ
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ ਅਤੇ ਉਸਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ
- ✅ ਆਮ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਪਟਾਰਾ ਕਰੋ

### ਅਗਲੇ ਕਦਮ
1. ਇਹ ਨਮੂਨੇ ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਾਂ 'ਤੇ ਲਾਗੂ ਕਰੋ
2. ਟੈਂਪਲੇਟਾਂ ਨੂੰ ਕਮਿਊਨਿਟੀ ਨੂੰ ਵਾਪਸ ਯੋਗਦਾਨ ਦਿਓ
3. ਜਾਰੀ ਸਮਰਥਨ ਲਈ Microsoft Foundry Discord ਵਿੱਚ ਜੁੜੋ
4. ਬਹੁ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ ਵਰਗੇ ਉੱਚ-ਸਤਹ ਦੇ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ

---

**Workshop Feedback**: ਸਾਨੂੰ ਇਹ ਵਰਕਸ਼ਾਪ ਸੁਧਾਰਨ ਵਿੱਚ ਮਦਦ ਕਰੋ — ਆਪਣਾ ਅਨੁਭਵ [Microsoft Foundry Discord #Azure ਚੈਨਲ](https://discord.gg/microsoft-azure) 'ਤੇ ਸਾਂਝਾ ਕਰਕੇ.

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਉਤਪਾਦਨ AI ਲਈ ਬਿਹਤਰ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

**ਮਦਦ ਚਾਹੀਦੀ?** AZD ਅਤੇ AI ਡਿਪਲੌਇਮੈਂਟ ਬਾਰੇ ਸਹਾਇਤਾ ਅਤੇ ਚਰਚਾਵਾਂ ਲਈ ਸਾਡੇ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਅਸਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਤਪੰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਭੁੱਲ-ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->