<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-17T20:56:11+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "pa"
}
-->
# ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ: ਆਪਣੀ ਏਆਈ ਹੱਲਾਂ ਨੂੰ AZD-Deployable ਬਣਾਉਣਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [ਏਆਈ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਉਤਪਾਦਨ ਏਆਈ ਸਰਵੋਤਮ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਕਨਫਿਗਰੇਸ਼ਨ](../getting-started/configuration.md)

## ਵਰਕਸ਼ਾਪ ਝਲਕ

ਇਹ ਹੱਥ-ਅਭਿਆਸ ਲੈਬ ਡਿਵੈਲਪਰਾਂ ਨੂੰ ਮੌਜੂਦਾ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਲੈ ਕੇ ਉਸਨੂੰ ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI (AZD) ਦੀ ਵਰਤੋਂ ਨਾਲ ਡਿਪਲੋਏਬਲ ਬਣਾਉਣ ਦੀ ਪ੍ਰਕਿਰਿਆ ਸਿਖਾਉਂਦੀ ਹੈ। ਤੁਸੀਂ ਐਜ਼ਰ ਏਆਈ ਫਾਉਂਡਰੀ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਉਤਪਾਦਨ ਏਆਈ ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਜ਼ਰੂਰੀ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਪੱਧਰ:** ਦਰਮਿਆਨਾ  
**ਪੂਰਵ ਸ਼ਰਤਾਂ:** ਬੁਨਿਆਦੀ ਐਜ਼ਰ ਗਿਆਨ, ਏਆਈ/ਐਮਐਲ ਸੰਕਲਪਾਂ ਨਾਲ ਜਾਣ-ਪਛਾਣ

## 🎓 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਂਪਲੇਟਾਂ ਵਿੱਚ ਬਦਲਣਾ
- ✅ AZD ਨਾਲ ਐਜ਼ਰ ਏਆਈ ਫਾਉਂਡਰੀ ਸੇਵਾਵਾਂ ਨੂੰ ਕਨਫਿਗਰ ਕਰਨਾ
- ✅ ਏਆਈ ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰਨਾ
- ✅ ਨਿਗਰਾਨੀ ਨਾਲ ਉਤਪਾਦਨ-ਤਿਆਰ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰਨਾ
- ✅ ਆਮ ਏਆਈ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰਨਾ

## ਪੂਰਵ ਸ਼ਰਤਾਂ

### ਲੋੜੀਂਦੇ ਟੂਲ
- [ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [ਐਜ਼ਰ CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਐਡੀਟਰ (VS Code ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਗਈ ਹੈ)

### ਐਜ਼ਰ ਸਰੋਤ
- ਕਨਟ੍ਰੀਬਿਊਟਰ ਐਕਸੈਸ ਵਾਲੀ ਐਜ਼ਰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- ਐਜ਼ਰ OpenAI ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰਨ ਦੀ ਯੋਗਤਾ)
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀ ਇਜਾਜ਼ਤ

### ਗਿਆਨ ਪੂਰਵ ਸ਼ਰਤਾਂ
- ਐਜ਼ਰ ਸੇਵਾਵਾਂ ਦੀ ਬੁਨਿਆਦੀ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸ ਨਾਲ ਜਾਣ-ਪਛਾਣ
- ਬੁਨਿਆਦੀ ਏਆਈ/ਐਮਐਲ ਸੰਕਲਪ (API, ਮਾਡਲ, ਪ੍ਰਾਂਪਟ)

## ਲੈਬ ਸੈਟਅੱਪ

### ਕਦਮ 1: ਵਾਤਾਵਰਣ ਤਿਆਰੀ

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

## ਮਾਡਿਊਲ 1: ਏਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ AZD ਸਟ੍ਰਕਚਰ ਨੂੰ ਸਮਝਣਾ

### ਏਆਈ AZD ਟੈਂਪਲੇਟ ਦੀ ਬਣਾਵਟ

ਏਆਈ-ਤਿਆਰ AZD ਟੈਂਪਲੇਟ ਵਿੱਚ ਮੁੱਖ ਫਾਈਲਾਂ ਦੀ ਪੜਚੋਲ ਕਰੋ:

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

### **ਲੈਬ ਅਭਿਆਸ 1.1: ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਪੜਚੋਲ ਕਰੋ**

1. **azure.yaml ਫਾਈਲ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਕੀ ਦੇਖਣਾ ਹੈ:**
- ਏਆਈ ਕੰਪੋਨੈਂਟਾਂ ਲਈ ਸੇਵਾ ਪਰਿਭਾਸ਼ਾਵਾਂ
- ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਮੈਪਿੰਗ
- ਹੋਸਟ ਕਨਫਿਗਰੇਸ਼ਨ

2. **main.bicep ਇੰਫਰਾਸਟਰਕਚਰ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**ਪਛਾਣ ਕਰਨ ਲਈ ਮੁੱਖ ਏਆਈ ਪੈਟਰਨ:**
- ਐਜ਼ਰ OpenAI ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ਕਾਗਨੀਟਿਵ ਸਰਚ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੁੰਜੀ ਪ੍ਰਬੰਧਨ
- ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰੇਸ਼ਨ

### **ਚਰਚਾ ਬਿੰਦੂ:** ਇਹ ਪੈਟਰਨ ਏਆਈ ਲਈ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹਨ

- **ਸੇਵਾ ਨਿਰਭਰਤਾਵਾਂ**: ਏਆਈ ਐਪਸ ਨੂੰ ਅਕਸਰ ਕਈ ਸੇਵਾਵਾਂ ਦੇ ਸਹਿ-ਸੰਚਾਲਨ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ  
- **ਸੁਰੱਖਿਆ**: API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੋਇੰਟਾਂ ਦਾ ਸੁਰੱਖਿਅਤ ਪ੍ਰਬੰਧਨ ਜ਼ਰੂਰੀ ਹੈ  
- **ਸਕੇਲਬਿਲਟੀ**: ਏਆਈ ਵਰਕਲੋਡਾਂ ਦੀਆਂ ਵਿਲੱਖਣ ਸਕੇਲਿੰਗ ਲੋੜਾਂ ਹੁੰਦੀਆਂ ਹਨ  
- **ਲਾਗਤ ਪ੍ਰਬੰਧਨ**: ਜੇ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਕਨਫਿਗਰ ਨਾ ਕੀਤਾ ਜਾਵੇ ਤਾਂ ਏਆਈ ਸੇਵਾਵਾਂ ਮਹਿੰਗੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ  

## ਮਾਡਿਊਲ 2: ਆਪਣੀ ਪਹਿਲੀ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰੋ

### ਕਦਮ 2.1: ਵਾਤਾਵਰਣ ਸ਼ੁਰੂ ਕਰੋ

1. **ਨਵਾਂ AZD ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-workshop
```

2. **ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ਕਦਮ 2.2: ਇੰਫਰਾਸਟਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰੋ

1. **AZD ਨਾਲ ਡਿਪਲੋਇ ਕਰੋ:**
```bash
azd up
```

**`azd up` ਦੌਰਾਨ ਕੀ ਹੁੰਦਾ ਹੈ:**
- ✅ ਐਜ਼ਰ OpenAI ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ  
- ✅ ਕਾਗਨੀਟਿਵ ਸਰਚ ਸੇਵਾ ਬਣਾਉਂਦਾ ਹੈ  
- ✅ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਲਈ ਐਪ ਸੇਵਾ ਸੈੱਟ ਕਰਦਾ ਹੈ  
- ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰ ਕਰਦਾ ਹੈ  
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ  
- ✅ ਨਿਗਰਾਨੀ ਅਤੇ ਲਾਗਿੰਗ ਸੈੱਟ ਕਰਦਾ ਹੈ  

2. **ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਗਤੀ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੇ ਸਰੋਤਾਂ ਨੂੰ ਨੋਟ ਕਰੋ।

### ਕਦਮ 2.3: ਆਪਣੀ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

1. **ਡਿਪਲੋਇ ਕੀਤੇ ਸਰੋਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਡਿਪਲੋਇ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **ਏਆਈ ਫੰਕਸ਼ਨਾਲਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ:**
   - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਤੇ ਜਾਓ  
   - ਨਮੂਨਾ ਪ੍ਰਸ਼ਨ ਅਜ਼ਮਾਓ  
   - ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਏਆਈ ਜਵਾਬ ਸਹੀ ਕੰਮ ਕਰ ਰਹੇ ਹਨ  

### **ਲੈਬ ਅਭਿਆਸ 2.1: ਟਰਬਲਸ਼ੂਟਿੰਗ ਅਭਿਆਸ**

**ਸਥਿਤੀ**: ਤੁਹਾਡੀ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਹੋ ਗਈ ਹੈ ਪਰ ਏਆਈ ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਜਾਂਚਣ ਲਈ ਆਮ ਸਮੱਸਿਆਵਾਂ:**
1. **OpenAI API ਕੁੰਜੀਆਂ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਇਹ ਸਹੀ ਸੈੱਟ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ  
2. **ਮਾਡਲ ਉਪਲਬਧਤਾ**: ਜਾਂਚੋ ਕਿ ਤੁਹਾਡਾ ਖੇਤਰ ਮਾਡਲ ਦਾ ਸਮਰਥਨ ਕਰਦਾ ਹੈ  
3. **ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਸੇਵਾਵਾਂ ਸੰਚਾਰ ਕਰ ਸਕਦੀਆਂ ਹਨ  
4. **RBAC ਅਧਿਕਾਰ**: ਜਾਂਚੋ ਕਿ ਐਪ OpenAI ਤੱਕ ਪਹੁੰਚ ਕਰ ਸਕਦਾ ਹੈ  

**ਡਿਬੱਗਿੰਗ ਕਮਾਂਡ:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ਮਾਡਿਊਲ 3: ਆਪਣੀਆਂ ਲੋੜਾਂ ਲਈ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

### ਕਦਮ 3.1: ਏਆਈ ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਅਪਡੇਟ ਕਰੋ

1. **OpenAI ਮਾਡਲ ਅਪਡੇਟ ਕਰੋ:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **ਵਾਧੂ ਏਆਈ ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ:**

`infra/main.bicep` ਨੂੰ ਸੋਧੋ ਅਤੇ ਡੌਕਯੂਮੈਂਟ ਇੰਟੈਲੀਜੈਂਸ ਸ਼ਾਮਲ ਕਰੋ:

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

### ਕਦਮ 3.2: ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਕਨਫਿਗਰੇਸ਼ਨ

**ਸਰਵੋਤਮ ਅਭਿਆਸ**: ਵਿਕਾਸ ਅਤੇ ਉਤਪਾਦਨ ਲਈ ਵੱਖਰੇ ਕਨਫਿਗਰੇਸ਼ਨ।

1. **ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-production
```

2. **ਉਤਪਾਦਨ-ਵਿਸ਼ੇਸ਼ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ਲੈਬ ਅਭਿਆਸ 3.1: ਲਾਗਤ ਅਨੁਕੂਲਤਾ**

**ਚੁਣੌਤੀ**: ਵਿਕਾਸ ਲਈ ਟੈਂਪਲੇਟ ਨੂੰ ਲਾਗਤ-ਅਨੁਕੂਲ ਬਣਾਓ।

**ਕੰਮ:**
1. ਪਛਾਣੋ ਕਿ ਕਿਹੜੇ SKU ਨੂੰ ਮੁਫ਼ਤ/ਮੁੱਢਲੇ ਪੱਧਰਾਂ 'ਤੇ ਸੈੱਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ  
2. ਘੱਟੋ-ਘੱਟ ਲਾਗਤ ਲਈ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਕਨਫਿਗਰ ਕਰੋ  
3. ਡਿਪਲੋਇ ਕਰੋ ਅਤੇ ਉਤਪਾਦਨ ਕਨਫਿਗਰੇਸ਼ਨ ਨਾਲ ਲਾਗਤ ਦੀ ਤੁਲਨਾ ਕਰੋ  

**ਸੁਝਾਅ:**
- ਜਿੱਥੇ ਸੰਭਵ ਹੋਵੇ, ਕਾਗਨੀਟਿਵ ਸੇਵਾਵਾਂ ਲਈ F0 (ਮੁਫ਼ਤ) ਟੀਅਰ ਦੀ ਵਰਤੋਂ ਕਰੋ  
- ਵਿਕਾਸ ਵਿੱਚ ਸਰਚ ਸੇਵਾ ਲਈ ਬੇਸਿਕ ਟੀਅਰ ਦੀ ਵਰਤੋਂ ਕਰੋ  
- ਫੰਕਸ਼ਨ ਲਈ ਖਪਤ ਯੋਜਨਾ ਦੀ ਚਿੰਤਾ ਕਰੋ  

...
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 ਪੂਰਨਤਾ ਸਰਟੀਫਿਕੇਟ  

ਵਧਾਈਆਂ! ਤੁਸੀਂ AI ਵਰਕਸ਼ਾਪ ਲੈਬ ਪੂਰੀ ਕਰ ਲਈ ਹੈ। ਹੁਣ ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋ:  

- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨਜ਼ ਨੂੰ AZD ਟੈਂਪਲੇਟਸ ਵਿੱਚ ਬਦਲੋ  
- ✅ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਜ਼ ਨੂੰ ਡਿਪਲੌਇ ਕਰੋ  
- ✅ AI ਵਰਕਲੋਡਸ ਲਈ ਸੁਰੱਖਿਆ ਦੇ ਸਰਵੋਤਮ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋ  
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਠੀਕ ਕਰੋ  
- ✅ ਆਮ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰੋ  

### ਅਗਲੇ ਕਦਮ  
1. ਇਹ ਪੈਟਰਨ ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਸ 'ਤੇ ਲਾਗੂ ਕਰੋ  
2. ਟੈਂਪਲੇਟਸ ਨੂੰ ਵਾਪਸ ਕਮਿਊਨਟੀ ਵਿੱਚ ਯੋਗਦਾਨ ਦੇਵੋ  
3. ਲਗਾਤਾਰ ਸਹਾਇਤਾ ਲਈ Azure AI Foundry Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ  
4. ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ ਵਰਗੇ ਉੱਚ-ਪੱਧਰੀ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ  

---  

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: ਸਾਡੇ ਨਾਲ ਆਪਣਾ ਅਨੁਭਵ ਸਾਂਝਾ ਕਰਕੇ ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰੋ [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) 'ਤੇ।  

---  

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**  
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)  
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ  
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ](ai-model-deployment.md)  
- **➡️ ਅਗਲਾ**: [ਪ੍ਰੋਡਕਸ਼ਨ AI ਸਰਵੋਤਮ ਅਭਿਆਸ](production-ai-practices.md)  
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../getting-started/configuration.md)  

**ਮਦਦ ਦੀ ਲੋੜ ਹੈ?** AZD ਅਤੇ AI ਡਿਪਲੌਇਮੈਂਟਸ ਬਾਰੇ ਸਹਾਇਤਾ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੇ ਕਮਿਊਨਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।  

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੇ ਪ੍ਰਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।  