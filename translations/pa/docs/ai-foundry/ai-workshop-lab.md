<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:18:35+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "pa"
}
-->
# AI ਵਰਕਸ਼ਾਪ ਲੈਬ: ਆਪਣੀ AI ਹੱਲਾਂ ਨੂੰ AZD-Deployable ਬਣਾਉਣਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-First ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਪ੍ਰੋਡਕਸ਼ਨ AI ਬਿਹਤਰ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਕਨਫਿਗਰੇਸ਼ਨ](../getting-started/configuration.md)

## ਵਰਕਸ਼ਾਪ ਝਲਕ

ਇਹ ਹੱਥ-ਅਨੁਭਵ ਲੈਬ ਡਿਵੈਲਪਰਾਂ ਨੂੰ ਮੌਜੂਦਾ AI ਟੈਂਪਲੇਟ ਲੈ ਕੇ ਅਤੇ ਇਸਨੂੰ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਸਿਖਾਉਂਦੀ ਹੈ। ਤੁਸੀਂ Azure AI Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਪ੍ਰੋਡਕਸ਼ਨ AI ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਜ਼ਰੂਰੀ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਸਤਹ:** ਮੱਧਮ  
**ਪੂਰਵ ਸ਼ਰਤਾਂ:** ਬੁਨਿਆਦੀ Azure ਗਿਆਨ, AI/ML ਸੰਕਲਪਾਂ ਨਾਲ ਜਾਣੂ

## 🎓 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਂਪਲੇਟਾਂ ਵਿੱਚ ਰੂਪਾਂਤਰਿਤ ਕਰੋ
- ✅ AZD ਨਾਲ Azure AI Foundry ਸੇਵਾਵਾਂ ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ
- ✅ AI ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰੋ
- ✅ ਮਾਨਟਰਿੰਗ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ
- ✅ ਆਮ AI ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ

## ਪੂਰਵ ਸ਼ਰਤਾਂ

### ਜ਼ਰੂਰੀ ਟੂਲ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਐਡੀਟਰ (VS Code ਸਿਫਾਰਸ਼ੀ)

### Azure ਸਰੋਤ
- ਕਨਟ੍ਰਿਬਿਊਟਰ ਐਕਸੈਸ ਵਾਲੀ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- Azure OpenAI ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰਨ ਦੀ ਯੋਗਤਾ)
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀ ਇਜਾਜ਼ਤ

### ਗਿਆਨ ਪੂਰਵ ਸ਼ਰਤਾਂ
- Azure ਸੇਵਾਵਾਂ ਦੀ ਬੁਨਿਆਦੀ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸਾਂ ਨਾਲ ਜਾਣੂ
- ਬੁਨਿਆਦੀ AI/ML ਸੰਕਲਪ (APIs, ਮਾਡਲ, ਪ੍ਰੋਮਪਟ)

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


### **ਲੈਬ ਅਭਿਆਸ 1.1: ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਖੋਜ**

1. **azure.yaml ਫਾਈਲ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਕੀ ਦੇਖਣਾ ਹੈ:**
- AI ਕੰਪੋਨੈਂਟਾਂ ਲਈ ਸੇਵਾ ਦੀ ਪਰਿਭਾਸ਼ਾ
- ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਮੈਪਿੰਗ
- ਹੋਸਟ ਕਨਫਿਗਰੇਸ਼ਨ

2. **main.bicep ਇੰਫਰਾਸਟਰਕਚਰ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**AI ਪੈਟਰਨਾਂ ਦੀ ਪਛਾਣ:**
- Azure OpenAI ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- Cognitive Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੁੰਜੀ ਪ੍ਰਬੰਧਨ
- ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰੇਸ਼ਨ

### **ਚਰਚਾ ਬਿੰਦੂ:** AI ਲਈ ਇਹ ਪੈਟਰਨ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹਨ

- **ਸੇਵਾ ਨਿਰਭਰਤਾ:** AI ਐਪਸ ਨੂੰ ਅਕਸਰ ਕਈ ਸੇਵਾਵਾਂ ਦੇ ਸਮਨਵਯ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **ਸੁਰੱਖਿਆ:** API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੌਇੰਟਾਂ ਦਾ ਸੁਰੱਖਿਅਤ ਪ੍ਰਬੰਧਨ ਜ਼ਰੂਰੀ ਹੈ
- **ਸਕੇਲਬਿਲਟੀ:** AI ਵਰਕਲੋਡਾਂ ਦੀਆਂ ਵਿਸ਼ੇਸ਼ ਸਕੇਲਿੰਗ ਜ਼ਰੂਰਤਾਂ ਹੁੰਦੀਆਂ ਹਨ
- **ਲਾਗਤ ਪ੍ਰਬੰਧਨ:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਕਨਫਿਗਰ ਨਾ ਕਰਨ 'ਤੇ ਮਹਿੰਗਾ ਹੋ ਸਕਦਾ ਹੈ

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


### ਪਦਾਅਵਾਰ 2.2: ਇੰਫਰਾਸਟਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

1. **AZD ਨਾਲ ਡਿਪਲੌਇ ਕਰੋ:**
```bash
azd up
```

**`azd up` ਦੌਰਾਨ ਕੀ ਹੁੰਦਾ ਹੈ:**
- ✅ Azure OpenAI ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ
- ✅ Cognitive Search ਸੇਵਾ ਬਣਾਉਂਦਾ ਹੈ
- ✅ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਲਈ App Service ਸੈਟ ਕਰਦਾ ਹੈ
- ✅ ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰ ਕਰਦਾ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ
- ✅ ਮਾਨਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈਟ ਕਰਦਾ ਹੈ

2. **ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਗਤੀ ਦੀ ਮਾਨਟਰਿੰਗ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੇ ਸਰੋਤਾਂ ਨੂੰ ਨੋਟ ਕਰੋ।

### ਪਦਾਅਵਾਰ 2.3: ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

1. **ਡਿਪਲੌਇ ਕੀਤੇ ਸਰੋਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਡਿਪਲੌਇ ਕੀਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਖੋਲ੍ਹੋ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI ਫੰਕਸ਼ਨਲਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ:**
   - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਤੇ ਜਾਓ
   - ਨਮੂਨਾ ਪ੍ਰਸ਼ਨ ਅਜ਼ਮਾਓ
   - ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ AI ਜਵਾਬ ਸਹੀ ਕੰਮ ਕਰ ਰਹੇ ਹਨ

### **ਲੈਬ ਅਭਿਆਸ 2.1: ਟਰਬਲਸ਼ੂਟਿੰਗ ਅਭਿਆਸ**

**ਸਥਿਤੀ:** ਤੁਹਾਡੀ ਡਿਪਲੌਇਮੈਂਟ ਸਫਲ ਹੋ ਗਈ ਹੈ ਪਰ AI ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਜਾਂਚ:**
1. **OpenAI API ਕੁੰਜੀਆਂ:** ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਇਹ ਸਹੀ ਸੈਟ ਕੀਤੀਆਂ ਹਨ
2. **ਮਾਡਲ ਉਪਲਬਧਤਾ:** ਜਾਂਚ ਕਰੋ ਕਿ ਤੁਹਾਡਾ ਖੇਤਰ ਮਾਡਲ ਨੂੰ ਸਹਾਰਦਾ ਹੈ
3. **ਨੈਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ:** ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਸੇਵਾਵਾਂ ਸੰਚਾਰ ਕਰ ਸਕਦੀਆਂ ਹਨ
4. **RBAC ਅਧਿਕਾਰ:** ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਐਪ OpenAI ਤੱਕ ਪਹੁੰਚ ਕਰ ਸਕਦਾ ਹੈ

**ਡਿਬੱਗਿੰਗ ਕਮਾਂਡ:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## ਮੋਡਿਊਲ 3: ਆਪਣੀ ਜ਼ਰੂਰਤਾਂ ਲਈ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

### ਪਦਾਅਵਾਰ 3.1: AI ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਅਪਡੇਟ ਕਰੋ

1. **OpenAI ਮਾਡਲ ਨੂੰ ਅਪਡੇਟ ਕਰੋ:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **ਵਾਧੂ AI ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ:**

`infra/main.bicep` ਨੂੰ ਸੋਧੋ ਅਤੇ Document Intelligence ਸ਼ਾਮਲ ਕਰੋ:

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


### ਪਦਾਅਵਾਰ 3.2: ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਕਨਫਿਗਰੇਸ਼ਨ

**ਸਰਵੋਤਮ ਅਭਿਆਸ:** ਵਿਕਾਸ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵੱਖਰੇ ਕਨਫਿਗਰੇਸ਼ਨ।

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

**ਚੁਣੌਤੀ:** ਵਿਕਾਸ ਲਈ ਲਾਗਤ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਟੈਂਪਲੇਟ ਕਨਫਿਗਰ ਕਰੋ।

**ਕੰਮ:**
1. ਪਛਾਣ ਕਰੋ ਕਿ ਕਿਹੜੇ SKUs ਨੂੰ ਮੁਫ਼ਤ/ਮੁੱਢਲੇ ਪੱਧਰਾਂ 'ਤੇ ਸੈਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
2. ਘੱਟ ਲਾਗਤ ਲਈ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਕਨਫਿਗਰ ਕਰੋ
3. ਡਿਪਲੌਇ ਕਰੋ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਕਨਫਿਗਰੇਸ਼ਨ ਨਾਲ ਲਾਗਤ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਹਲ ਦੇ ਸੁਝਾਅ:**
- ਜਿੱਥੇ ਸੰਭਵ ਹੋਵੇ, Cognitive Services ਲਈ F0 (ਮੁਫ਼ਤ) ਪੱਧਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਵਿਕਾਸ ਵਿੱਚ Search Service ਲਈ Basic ਪੱਧਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- Functions ਲਈ Consumption ਯੋਜਨਾ ਦੀ ਚੋਣ ਕਰੋ

## ਮੋਡਿਊਲ 4: ਸੁਰੱਖਿਆ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਸਰਵੋਤਮ ਅਭਿਆਸ

### ਪਦਾਅਵਾਰ 4.1: ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ

**ਮੌਜੂਦਾ ਚੁਣੌਤੀ:** ਕਈ AI ਐਪਸ API ਕੁੰਜੀਆਂ ਨੂੰ ਕੋਡ ਵਿੱਚ ਹਾਰਡਕੋਡ ਕਰਦੇ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ।

**AZD ਹੱਲ:** Managed Identity + Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ।

1. **ਆਪਣੇ ਟੈਂਪਲੇਟ ਵਿੱਚ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
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

1. **ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਨੂੰ ਯਕੀਨੀ ਬਣਾਓ** (ਜੇਕਰ ਪਹਿਲਾਂ ਕਨਫਿਗਰ ਨਹੀਂ ਕੀਤੇ ਗਏ):

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


### ਪਦਾਅਵਾਰ 4.3: ਮਾਨਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟਾਵਲਤਾ

1. **Application Insights ਕਨਫਿਗਰ ਕਰੋ:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ਵਿਸ਼ੇਸ਼ ਮਾਨਟਰਿੰਗ ਸੈਟ ਕਰੋ:**

AI ਕਾਰਵਾਈਆਂ ਲਈ ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਸ਼ਾਮਲ ਕਰੋ:
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

**ਕੰਮ:** ਸੁਰੱਖਿਆ ਸਰਵੋਤਮ ਅਭਿਆਸਾਂ ਲਈ ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਸਮੀਖਿਆ ਕਰੋ।

**ਚੈੱਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਕਨਫਿਗਰੇਸ਼ਨ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਕੀਤੇ ਗਏ ਰਾਜ ਨਹੀਂ
- [ ] ਸੇਵਾ-ਤੋਂ-ਸੇਵਾ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ Managed Identity ਦੀ ਵਰਤੋਂ ਕੀਤੀ ਗਈ ਹੈ
- [ ] Key Vault ਸੰਵੇਦਨਸ਼ੀਲ ਕਨਫਿਗਰੇਸ਼ਨ ਸਟੋਰ ਕਰਦਾ ਹੈ
- [ ] ਨੈਟਵਰਕ ਪਹੁੰਚ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੀਮਿਤ ਹੈ
- [ ] ਮਾਨਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈਟ ਕੀਤੀ ਗਈ ਹੈ

## ਮੋਡਿਊਲ 5: ਆਪਣਾ AI ਐਪਲੀਕੇਸ਼ਨ ਰੂਪਾਂਤਰਿਤ ਕਰਨਾ

### ਪਦਾਅਵਾਰ 5.1: ਅਸੈਸਮੈਂਟ ਵਰਕਸ਼ੀਟ

**ਆਪਣਾ ਐਪ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਸਵਾਲਾਂ ਦੇ ਜਵਾਬ ਦਿਓ:

1. **ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ:**
   - ਤੁਹਾਡਾ ਐਪ ਕਿਹੜੀਆਂ AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ?
   - ਇਸਨੂੰ ਕਿਹੜੇ ਕੰਪਿਊਟ ਸਰੋਤਾਂ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡਾਟਾਬੇਸ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਦੇ ਵਿਚਕਾਰ ਨਿਰਭਰਤਾਵਾਂ ਕੀ ਹਨ?

2. **ਸੁਰੱਖਿਆ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ:**
   - ਤੁਹਾਡਾ ਐਪ ਕਿਹੜੇ ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਹੜੀਆਂ ਅਨੁਕੂਲਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਹਨ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈਟਵਰਕਿੰਗ ਦੀ ਲੋੜ ਹੈ?

3. **ਸਕੇਲਿੰਗ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ:**
   - ਤੁਹਾਡਾ ਉਮੀਦਵਾਰ ਲੋਡ ਕੀ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਖੇਤਰ-ਵਿਸ਼ੇਸ਼ ਜ਼ਰੂਰਤਾਂ ਹਨ?

### ਪਦਾਅਵਾਰ 5.2: ਆਪਣਾ AZD ਟੈਂਪਲੇਟ ਬਣਾਓ

**ਆਪਣਾ ਐਪ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਲਈ ਇਸ ਪੈਟਰਨ ਦੀ ਪਾਲਣਾ ਕਰੋ:**

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

3. **ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟ ਬਣਾਓ:**

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

**ਚੁਣੌਤੀ:** ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ AI ਐਪ ਲਈ AZD ਟੈਂਪਲੇਟ ਬਣਾਓ।

**ਜ਼ਰੂਰਤਾਂ:**
- ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Azure OpenAI
- OCR ਲਈ Document Intelligence
- ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਲਈ Storage Account
- ਪ੍ਰੋਸੈਸਿੰਗ ਲੌਜਿਕ ਲਈ Function App
- ਯੂਜ਼ਰ ਇੰਟਰਫੇਸ ਲਈ ਵੈੱਬ ਐਪ

**ਬੋਨਸ ਪੌਇੰਟਸ:**
- ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਗਲਤੀ ਸੰਭਾਲਨ ਸ਼ਾਮਲ ਕਰੋ
- ਲਾਗਤ ਦਾ ਅਨੁਮਾਨ ਸ਼ਾਮਲ ਕਰੋ
- ਮਾਨਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਸੈਟ ਕਰੋ

## ਮੋਡਿਊਲ 6: ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 1: OpenAI ਸੇਵਾ ਕੋਟਾ ਪਾਰ ਹੋ ਗਿਆ
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


#### ਸਮੱਸਿਆ 3: ਅਧਿਕਾਰ
ਵਧਾਈਆਂ! ਤੁਸੀਂ AI ਵਰਕਸ਼ਾਪ ਲੈਬ ਪੂਰੀ ਕਰ ਲਈ ਹੈ। ਹੁਣ ਤੁਹਾਨੂੰ ਇਹ ਕਰਨ ਦੀ ਸਮਰਥਾ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ:

- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਂਪਲੇਟ ਵਿੱਚ ਬਦਲਣਾ
- ✅ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰਨਾ
- ✅ AI ਵਰਕਲੋਡ ਲਈ ਸੁਰੱਖਿਆ ਦੇ ਸ੍ਰੇਸ਼ਠ ਤਰੀਕੇ ਲਾਗੂ ਕਰਨਾ
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਢੰਗ ਸਧਾਰਨਾ
- ✅ ਆਮ ਤੈਨਾਤੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰਨਾ

### ਅਗਲੇ ਕਦਮ
1. ਇਹ ਪੈਟਰਨ ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਾਂ 'ਤੇ ਲਾਗੂ ਕਰੋ
2. ਟੈਂਪਲੇਟਾਂ ਨੂੰ ਵਾਪਸ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਯੋਗਦਾਨ ਦੇਵੋ
3. ਲਗਾਤਾਰ ਸਹਾਇਤਾ ਲਈ Azure AI Foundry Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ
4. ਮਲਟੀ-ਰੀਜਨ ਤੈਨਾਤੀ ਵਰਗੇ ਉੱਚ-ਸਤਰੀ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ

---

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰੋ ਅਤੇ ਆਪਣਾ ਅਨੁਭਵ [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) 'ਤੇ ਸਾਂਝਾ ਕਰੋ।

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-First Development
- **⬅️ ਪਿਛਲਾ**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: Configuration](../getting-started/configuration.md)

**ਮਦਦ ਦੀ ਲੋੜ ਹੈ?** AZD ਅਤੇ AI ਤੈਨਾਤੀ ਬਾਰੇ ਸਹਾਇਤਾ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੀ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।

---

