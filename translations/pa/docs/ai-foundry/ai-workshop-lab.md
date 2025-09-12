<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T19:24:09+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "pa"
}
-->
# AI ਵਰਕਸ਼ਾਪ ਲੈਬ: ਆਪਣੀ AI ਹੱਲਾਂ ਨੂੰ AZD-Deployable ਬਣਾਉਣਾ

**ਪਿਛਲਾ:** [AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ](ai-model-deployment.md) | **ਅਗਲਾ:** [ਪ੍ਰੋਡਕਸ਼ਨ AI ਪ੍ਰੈਕਟਿਸ](production-ai-practices.md)

## ਵਰਕਸ਼ਾਪ ਝਲਕ

ਇਹ ਹੱਥ-ਅਨੁਭਵ ਲੈਬ ਵਿਕਾਸਕਾਰਾਂ ਨੂੰ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਲੈ ਕੇ ਅਤੇ ਇਸਨੂੰ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੌਇਬਲ ਬਣਾਉਣ ਦੀ ਪ੍ਰਕਿਰਿਆ ਸਿਖਾਉਂਦੀ ਹੈ। ਤੁਸੀਂ Azure AI Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਪ੍ਰੋਡਕਸ਼ਨ AI ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਜ਼ਰੂਰੀ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਸਤਹ:** ਮੱਧਮ  
**ਪੂਰਵ ਸ਼ਰਤਾਂ:** ਬੁਨਿਆਦੀ Azure ਗਿਆਨ, AI/ML ਸੰਕਲਪਾਂ ਨਾਲ ਜਾਣੂ

## 🎓 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਂਪਲੇਟਸ ਵਿੱਚ ਰੂਪਾਂਤਰਿਤ ਕਰੋ
- ✅ AZD ਨਾਲ Azure AI Foundry ਸੇਵਾਵਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
- ✅ AI ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰੋ
- ✅ ਮਾਨਟਰਿੰਗ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ
- ✅ ਆਮ AI ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ

## ਪੂਰਵ ਸ਼ਰਤਾਂ

### ਜ਼ਰੂਰੀ ਟੂਲ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਐਡੀਟਰ (VS Code ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਗਈ ਹੈ)

### Azure ਸਰੋਤ
- ਕਾਂਟ੍ਰਿਬਿਊਟਰ ਪਹੁੰਚ ਵਾਲੀ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- Azure OpenAI ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰਨ ਦੀ ਯੋਗਤਾ)
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀਆਂ ਇਜਾਜ਼ਤਾਂ

### ਗਿਆਨ ਪੂਰਵ ਸ਼ਰਤਾਂ
- Azure ਸੇਵਾਵਾਂ ਦੀ ਬੁਨਿਆਦੀ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸਾਂ ਨਾਲ ਜਾਣੂ
- AI/ML ਸੰਕਲਪਾਂ (APIs, ਮਾਡਲ, ਪ੍ਰੋਮਪਟਸ) ਦੀ ਬੁਨਿਆਦੀ ਜਾਣਕਾਰੀ

## ਲੈਬ ਸੈਟਅਪ

### ਪਦਾਅਵਾਰ 1: ਵਾਤਾਵਰਣ ਤਿਆਰੀ

1. **ਟੂਲ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **ਵਰਕਸ਼ਾਪ ਰਿਪੋਜ਼ਟਰੀ ਕਲੋਨ ਕਰੋ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ਮੋਡਿਊਲ 1: AI ਐਪਲੀਕੇਸ਼ਨ ਲਈ AZD ਸਟ੍ਰਕਚਰ ਦੀ ਸਮਝ

### AI AZD ਟੈਂਪਲੇਟ ਦੀ ਬਣਤਰ

AI-ਤਿਆਰ AZD ਟੈਂਪਲੇਟ ਵਿੱਚ ਮੁੱਖ ਫਾਈਲਾਂ ਦੀ ਖੋਜ ਕਰੋ:

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

### **ਲੈਬ ਅਭਿਆਸ 1.1: ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ**

1. **azure.yaml ਫਾਈਲ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਕੀ ਦੇਖਣਾ ਹੈ:**
- AI ਕੰਪੋਨੈਂਟਸ ਲਈ ਸੇਵਾ ਪਰਿਭਾਸ਼ਾਵਾਂ
- ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਮੈਪਿੰਗ
- ਹੋਸਟ ਸੰਰਚਨਾਵਾਂ

2. **main.bicep ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**ਪਛਾਣ ਕਰਨ ਲਈ ਮੁੱਖ AI ਪੈਟਰਨ:**
- Azure OpenAI ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- Cognitive Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੁੰਜੀ ਪ੍ਰਬੰਧਨ
- ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾਵਾਂ

### **ਚਰਚਾ ਬਿੰਦੂ:** AI ਲਈ ਇਹ ਪੈਟਰਨ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹਨ

- **ਸੇਵਾ ਨਿਰਭਰਤਾਵਾਂ**: AI ਐਪਸ ਨੂੰ ਅਕਸਰ ਕਈ ਸੇਵਾਵਾਂ ਦੇ ਸਮਨਵਯ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **ਸੁਰੱਖਿਆ**: API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੌਇੰਟਸ ਦਾ ਸੁਰੱਖਿਅਤ ਪ੍ਰਬੰਧਨ ਜ਼ਰੂਰੀ ਹੈ
- **ਸਕੇਲਬਿਲਿਟੀ**: AI ਵਰਕਲੋਡਸ ਦੇ ਵਿਲੱਖਣ ਸਕੇਲਿੰਗ ਦੀਆਂ ਲੋੜਾਂ ਹੁੰਦੀਆਂ ਹਨ
- **ਲਾਗਤ ਪ੍ਰਬੰਧਨ**: AI ਸੇਵਾਵਾਂ ਨੂੰ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਨਾ ਕੀਤਾ ਜਾਵੇ ਤਾਂ ਇਹ ਮਹਿੰਗੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ

## ਮੋਡਿਊਲ 2: ਆਪਣਾ ਪਹਿਲਾ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

### ਪਦਾਅਵਾਰ 2.1: ਵਾਤਾਵਰਣ ਸ਼ੁਰੂ ਕਰੋ

1. **ਨਵਾਂ AZD ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-workshop
```

2. **ਜ਼ਰੂਰੀ ਪੈਰਾਮੀਟਰ ਸੈਟ ਕਰੋ:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ਪਦਾਅਵਾਰ 2.2: ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

1. **AZD ਨਾਲ ਡਿਪਲੌਇ ਕਰੋ:**
```bash
azd up
```

**`azd up` ਦੌਰਾਨ ਕੀ ਹੁੰਦਾ ਹੈ:**
- ✅ Azure OpenAI ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ
- ✅ Cognitive Search ਸੇਵਾ ਬਣਾਉਂਦਾ ਹੈ
- ✅ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਲਈ App Service ਸੈਟਅਪ ਕਰਦਾ ਹੈ
- ✅ ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ
- ✅ ਮਾਨਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈਟਅਪ ਕਰਦਾ ਹੈ

2. **ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਗਤੀ ਦੀ ਮਾਨਟਰਿੰਗ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੇ ਸਰੋਤਾਂ ਨੂੰ ਨੋਟ ਕਰੋ।

### ਪਦਾਅਵਾਰ 2.3: ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

1. **ਡਿਪਲੌਇ ਕੀਤੇ ਸਰੋਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਡਿਪਲੌਇ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI ਫੰਕਸ਼ਨਲਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ:**
   - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਤੇ ਜਾਓ
   - ਨਮੂਨਾ ਪ੍ਰਸ਼ਨ ਅਜ਼ਮਾਓ
   - ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ AI ਜਵਾਬ ਸਹੀ ਕੰਮ ਕਰ ਰਹੇ ਹਨ

### **ਲੈਬ ਅਭਿਆਸ 2.1: ਟਰਬਲਸ਼ੂਟਿੰਗ ਅਭਿਆਸ**

**ਸਥਿਤੀ**: ਤੁਹਾਡੀ ਡਿਪਲੌਇਮੈਂਟ ਸਫਲ ਹੋ ਗਈ ਹੈ ਪਰ AI ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਜਾਂਚਣ ਲਈ ਆਮ ਸਮੱਸਿਆਵਾਂ:**
1. **OpenAI API ਕੁੰਜੀਆਂ**: ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਇਹ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੈਟ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ
2. **ਮਾਡਲ ਉਪਲਬਧਤਾ**: ਜਾਂਚ ਕਰੋ ਕਿ ਤੁਹਾਡਾ ਖੇਤਰ ਮਾਡਲ ਦਾ ਸਮਰਥਨ ਕਰਦਾ ਹੈ
3. **ਨੈਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਸੇਵਾਵਾਂ ਸੰਚਾਰ ਕਰ ਸਕਦੀਆਂ ਹਨ
4. **RBAC ਅਧਿਕਾਰ**: ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਐਪ OpenAI ਤੱਕ ਪਹੁੰਚ ਕਰ ਸਕਦਾ ਹੈ

**ਡਿਬੱਗਿੰਗ ਕਮਾਂਡਸ:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ਮੋਡਿਊਲ 3: ਆਪਣੀ ਲੋੜਾਂ ਲਈ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

### ਪਦਾਅਵਾਰ 3.1: AI ਸੰਰਚਨਾ ਨੂੰ ਅਪਡੇਟ ਕਰੋ

1. **OpenAI ਮਾਡਲ ਅਪਡੇਟ ਕਰੋ:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **ਵਾਧੂ AI ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ:**

`infra/main.bicep` ਨੂੰ ਸੰਪਾਦਿਤ ਕਰੋ Document Intelligence ਸ਼ਾਮਲ ਕਰਨ ਲਈ:

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

### ਪਦਾਅਵਾਰ 3.2: ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਸੰਰਚਨਾਵਾਂ

**ਸਰਵੋਤਮ ਅਭਿਆਸ**: ਵਿਕਾਸ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ।

1. **ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-production
```

2. **ਪ੍ਰੋਡਕਸ਼ਨ-ਵਿਸ਼ੇਸ਼ ਪੈਰਾਮੀਟਰ ਸੈਟ ਕਰੋ:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ਲੈਬ ਅਭਿਆਸ 3.1: ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ**

**ਚੁਣੌਤੀ**: ਵਿਕਾਸ ਲਈ ਲਾਗਤ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਟੈਂਪਲੇਟ ਸੰਰਚਿਤ ਕਰੋ।

**ਕੰਮ:**
1. ਪਛਾਣ ਕਰੋ ਕਿ ਕਿਹੜੇ SKUs ਨੂੰ ਮੁਫ਼ਤ/ਮੁੱਢਲੇ ਪੱਧਰਾਂ 'ਤੇ ਸੈਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
2. ਘੱਟੋ-ਘੱਟ ਲਾਗਤ ਲਈ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੰਰਚਿਤ ਕਰੋ
3. ਡਿਪਲੌਇ ਕਰੋ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਸੰਰਚਨਾ ਨਾਲ ਲਾਗਤ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਹਲ ਦੇ ਸੰਕੇਤ:**
- ਜਿੱਥੇ ਸੰਭਵ ਹੋਵੇ Cognitive Services ਲਈ F0 (ਮੁਫ਼ਤ) ਪੱਧਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਵਿਕਾਸ ਵਿੱਚ Search Service ਲਈ Basic ਪੱਧਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- Functions ਲਈ Consumption ਯੋਜਨਾ ਦੀ ਚੋਣ ਕਰੋ

## ਮੋਡਿਊਲ 4: ਸੁਰੱਖਿਆ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਸਰਵੋਤਮ ਅਭਿਆਸ

### ਪਦਾਅਵਾਰ 4.1: ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ

**ਮੌਜੂਦਾ ਚੁਣੌਤੀ**: ਕਈ AI ਐਪਸ API ਕੁੰਜੀਆਂ ਨੂੰ ਕੋਡ ਵਿੱਚ ਹਾਰਡਕੋਡ ਕਰਦੇ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ।

**AZD ਹੱਲ**: Managed Identity + Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ।

1. **ਆਪਣੇ ਟੈਂਪਲੇਟ ਵਿੱਚ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity ਦੀ ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ਪਦਾਅਵਾਰ 4.2: ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ

1. **ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਨੂੰ ਯਕੀਨੀ ਬਣਾਓ** (ਜੇਕਰ ਪਹਿਲਾਂ ਸੰਰਚਿਤ ਨਹੀਂ ਕੀਤੇ ਗਏ):

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

### ਪਦਾਅਵਾਰ 4.3: ਮਾਨਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟਤਾ

1. **Application Insights ਸੰਰਚਿਤ ਕਰੋ:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ਵਿਸ਼ੇਸ਼ ਮਾਨਟਰਿੰਗ ਸੈਟਅਪ ਕਰੋ:**

AI ਕਾਰਵਾਈਆਂ ਲਈ ਕਸਟਮ ਮੈਟਰਿਕਸ ਸ਼ਾਮਲ ਕਰੋ:
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

### **ਲੈਬ ਅਭਿਆਸ 4.1: ਸੁਰੱਖਿਆ ਆਡਿਟ**

**ਕੰਮ**: ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਸੁਰੱਖਿਆ ਸਰਵੋਤਮ ਅਭਿਆਸਾਂ ਲਈ ਸਮੀਖਿਆ ਕਰੋ।

**ਚੈੱਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਸੰਰਚਨਾ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਕੀਤੇ ਗਏ ਰਾਜ ਨਹੀਂ
- [ ] ਸੇਵਾ-ਤੋਂ-ਸੇਵਾ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ Managed Identity ਦੀ ਵਰਤੋਂ ਕੀਤੀ ਗਈ ਹੈ
- [ ] Key Vault ਸੰਵੇਦਨਸ਼ੀਲ ਸੰਰਚਨਾ ਨੂੰ ਸਟੋਰ ਕਰਦਾ ਹੈ
- [ ] ਨੈਟਵਰਕ ਪਹੁੰਚ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਸੀਮਿਤ ਹੈ
- [ ] ਮਾਨਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੰਰਚਿਤ ਕੀਤੇ ਗਏ ਹਨ

## ਮੋਡਿਊਲ 5: ਆਪਣਾ AI ਐਪਲੀਕੇਸ਼ਨ ਰੂਪਾਂਤਰਿਤ ਕਰਨਾ

### ਪਦਾਅਵਾਰ 5.1: ਅਸੈਸਮੈਂਟ ਵਰਕਸ਼ੀਟ

**ਆਪਣੇ ਐਪ ਨੂੰ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਪ੍ਰਸ਼ਨ ਦੇ ਜਵਾਬ ਦਿਓ:

1. **ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ:**
   - ਤੁਹਾਡਾ ਐਪ ਕਿਹੜੀਆਂ AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ?
   - ਇਸਨੂੰ ਕਿਹੜੇ ਕੰਪਿਊਟ ਸਰੋਤਾਂ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡਾਟਾਬੇਸ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਦੇ ਵਿਚਕਾਰ ਕਿਹੜੀਆਂ ਨਿਰਭਰਤਾਵਾਂ ਹਨ?

2. **ਸੁਰੱਖਿਆ ਦੀਆਂ ਲੋੜਾਂ:**
   - ਤੁਹਾਡਾ ਐਪ ਕਿਹੜੇ ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਹੜੀਆਂ ਅਨੁਕੂਲਤਾ ਦੀਆਂ ਲੋੜਾਂ ਹਨ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈਟਵਰਕਿੰਗ ਦੀ ਲੋੜ ਹੈ?

3. **ਸਕੇਲਿੰਗ ਦੀਆਂ ਲੋੜਾਂ:**
   - ਤੁਹਾਡਾ ਉਮੀਦਵਾਰ ਲੋਡ ਕੀ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਖੇਤਰ-ਵਿਸ਼ੇਸ਼ ਲੋੜਾਂ ਹਨ?

### ਪਦਾਅਵਾਰ 5.2: ਆਪਣਾ AZD ਟੈਂਪਲੇਟ ਬਣਾਓ

**ਆਪਣੇ ਐਪ ਨੂੰ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਲਈ ਇਸ ਪੈਟਰਨ ਦੀ ਪਾਲਣਾ ਕਰੋ:**

1. **ਮੁੱਢਲੀ ਬਣਤਰ ਬਣਾਓ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

3. **ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟਸ ਬਣਾਓ:**

**infra/main.bicep** - ਮੁੱਖ ਟੈਂਪਲੇਟ:
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

**infra/modules/openai.bicep** - OpenAI ਮੋਡਿਊਲ:
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

### **ਲੈਬ ਅਭਿਆਸ 5.1: ਟੈਂਪਲੇਟ ਬਣਾਉਣ ਦੀ ਚੁਣੌਤੀ**

**ਚੁਣੌਤੀ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ AI ਐਪ ਲਈ AZD ਟੈਂਪਲੇਟ ਬਣਾਓ।

**ਲੋੜਾਂ:**
- ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Azure OpenAI
- OCR ਲਈ Document Intelligence
- ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਲਈ Storage Account
- ਪ੍ਰੋਸੈਸਿੰਗ ਲੌਜਿਕ ਲਈ Function App
- ਯੂਜ਼ਰ ਇੰਟਰਫੇਸ ਲਈ ਵੈੱਬ ਐਪ

**ਬੋਨਸ ਪਾਇੰਟਸ:**
- ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਗਲਤੀ ਸੰਭਾਲਨ ਸ਼ਾਮਲ ਕਰੋ
- ਲਾਗਤ ਦਾ ਅਨੁਮਾਨ ਸ਼ਾਮਲ ਕਰੋ
- ਮਾਨਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡਸ ਸੈਟਅਪ ਕਰੋ

## ਮੋਡਿਊਲ 6: ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 1: OpenAI ਸੇਵਾ ਕੋਟਾ ਪਾਰ ਹੋਇਆ
**ਲੱਛਣ:** ਡਿਪਲੌਇਮੈਂਟ ਕੋਟਾ ਗਲਤੀ ਨਾਲ ਫੇਲ੍ਹ ਹੋ ਜਾਂਦਾ ਹੈ  
**ਹੱਲ:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### ਸਮੱਸਿਆ 2: ਮਾਡਲ ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ
**ਲੱਛਣ:** AI ਜਵਾਬ ਫੇਲ੍ਹ ਜਾਂ ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਗਲਤੀਆਂ  
**ਹੱਲ:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### ਸਮੱਸਿਆ 3: ਅਧਿਕਾਰ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਨ ਵੇਲੇ 403 Forbidden ਗਲਤੀਆਂ  
**ਹੱਲ:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ਕਾਰਗੁਜ਼ਾਰੀ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 4: AI ਜਵਾਬ ਹੌਲੀ ਹਨ
**ਜਾਂਚਣ ਦੇ ਕਦਮ:
- ✅ AI ਵਰਕਲੋਡ ਲਈ ਸੁਰੱਖਿਆ ਦੇ ਸਰਵੋਤਮ ਤਰੀਕੇ ਲਾਗੂ ਕਰੋ  
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਢੰਗ ਸਧਾਰੋ  
- ✅ ਆਮ ਤੌਰ 'ਤੇ ਆਉਣ ਵਾਲੀਆਂ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰੋ  

### ਅਗਲੇ ਕਦਮ  
1. ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਾਂ ਵਿੱਚ ਇਹ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ  
2. ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਵਾਪਸ ਟੈਂਪਲੇਟਸ ਯੋਗਦਾਨ ਪਾਉ  
3. ਸਹਾਇਤਾ ਲਈ Azure AI Foundry Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ  
4. ਬਹੁ-ਖੇਤਰ ਡਿਪਲੌਇਮੈਂਟ ਵਰਗੇ ਉੱਚ-ਸਤਹ ਦੇ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ  

---

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) ਵਿੱਚ ਆਪਣਾ ਅਨੁਭਵ ਸਾਂਝਾ ਕਰਕੇ ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰੋ।  

---

**ਪਿਛਲਾ:** [AI Model Deployment](ai-model-deployment.md) | **ਅਗਲਾ:** [Production AI Practices](production-ai-practices.md)  

**ਮਦਦ ਚਾਹੀਦੀ ਹੈ?** AZD ਅਤੇ AI ਡਿਪਲੌਇਮੈਂਟਸ ਬਾਰੇ ਸਹਾਇਤਾ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੀ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।  

---

**ਅਸਵੀਕਾਰਨਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੀਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।