# AI ਵਰਕਸ਼ਾਪ ਲੈਬ: ਤੁਹਾਡੇ AI ਹੱਲਾਂ ਨੂੰ AZD-ਡਿਪਲੋਏਬਲ ਬਣਾਉਣਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [ਨਵੀਂ ਸ਼ੁਰੂਆਤ ਲਈ AZD](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾਂ**: [AI ਮਾਡਲ ਡਿਪਲੋਏਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅੱਗੇ**: [ਉਤਪਾਦਨ AI ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

## ਵਰਕਸ਼ਾਪ ਸੰਖੇਪ

ਇਹ ਹੱਥੋਂ-ਹੱਥ ਲੈਬ ਵਿਕਾਸਕਾਰਾਂ ਨੂੰ ਮੌਜੂਦਾ AI ਟੈਮਪਲੇਟ ਨੂੰ ਲੈ ਕੇ ਉਸਨੂੰ Azure Developer CLI (AZD) ਦਾ ਉਪਯੋਗ ਕਰਦੇ ਹੋਏ ਡਿਪਲੋਏ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਉਤਪਾਦਨ AI ਡਿਪਲੋਏਮੈਂਟ ਲਈ ਜਰੂਰੀ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

> **ਮਾਨਤਾ ਨੋਟ (2026-07-13):** ਇਹ ਵਰਕਸ਼ਾਪ `azd` `1.27.1` ਵਰਜਨ ਦੇ ਹਵਾਲੇ ਨਾਲ ਸਮੀਖਿਆ ਗਈ ਹੈ। ਜੇਕਰ ਤੁਹਾਡੀ ਸਥਾਨਕ ਇੰਸਟਾਲੇਸ਼ਨ ਪੁਰਾਣੀ ਹੈ, ਤਾਂ AZD ਨੂੰ ਅਪਡੇਟ ਕਰੋ ਤਾਂ ਜੋ ਪ੍ਰਮਾਣਿਕਤਾ, ਟੈਮਪਲੇਟ ਅਤੇ ਡਿਪਲੋਏਮੈਂਟ ਵਰਕਫਲੋਵ ਹੇਠ ਦਿੱਤੇ ਕਦਮਾਂ ਨਾਲ ਮਿਲਦਾ ਜੁਲਦਾ ਰਹੇ।

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਪੱਧਰ:** ਦਰਮਿਆਨਾ  
**ਪূರ್ವ-ਸ਼ਰਤਾਂ:** ਬੇਸਿਕ Azure ਗਿਆਨ, AI/ML ਧਾਰਨਾਵਾਂ ਨਾਲ ਜਾਣੂ

## 🎓 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਂਗੇ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਮਪਲੇਟਾਂ ਨਾਲ ਬਦਲਣਾ
- ✅ AZD ਨਾਲ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਸੰਰਚਨਾ ਕਰਨੀ
- ✅ AI ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰਨਾ
- ✅ ਨਿਗਰਾਨੀ ਦੇ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਏ ਕਰਨਾ
- ✅ ਆਮ AI ਡਿਪਲੋਏਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਧਾਰਨਾ

## ਪੂರ್ವ-ਸ਼ਰਤਾਂ

### ਜਰੂਰੀ ਸੰਦ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਸੰਪਾਦਕ (VS Code ਦੀ ਸਿਫਾਰਸ਼)

### Azure ਸਰੋਤ
- ਦਾ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਿਸ ਵਿੱਚ ਕਾਨਟ੍ਰੀਬਿਊਟਰ ਐਕਸੈਸ ਹੁੰਦਾ ਹੋਵੇ
- Microsoft Foundry ਮਾਡਲ ਸੇਵਾਵਾਂ ਲਈ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਮੰਗਣ ਦੀ ਸਮਰੱਥਾ)
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀ ਅਨੁਮਤੀ

### ਗਿਆਨ ਦੀਆਂ ਪੂਰਵ-ਸ਼ਰਤਾਂ
- Azure ਸੇਵਾਵਾਂ ਦੀ ਮੁਢਲੀ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸ ਨਾਲ ਜਾਣੂ
- ਮੁੱਲ-ਭੂਤ AI/ML ਧਾਰਨਾਵਾਂ (API, ਮਾਡਲ, ਪ੍ਰਾਂਪਟ)

## ਲੈਬ ਸੈਟਅਪ

### ਕਦਮ 1: ਵਾਤਾਵਰਨ ਦੀ ਤਿਆਰੀ

1. **ਸੰਦਾਂ ਦੀ ਵੈਰੀਫਿਕੇਸ਼ਨ ਕਰੋ:**
```bash
# AZD ਇੰਸਟਾਲੇਸ਼ਨ ਜਾਂਚੋ
azd version

# Azure CLI ਜਾਂਚੋ
az --version

# AZD ਵਰਕਫਲੋਜ਼ ਲਈ Azure ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ
azd auth login

# ਜਦੋਂ ਤੁਸੀਂ ਡਾਇਗਨੋਸਟਿਕਸ ਦੌਰਾਨ az ਕਮਾਂਡ ਚਲਾਣ ਦਾ ਯੋਜਨਾ ਬਣਾਉਂਦੇ ਹੋ ਤਾਂ ਹੀ Azure CLI ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ
az login
```

ਜੇ ਤੁਸੀਂ ਕਈ ਟੈਨੈਂਟਾਂ ਵਿੱਚ ਕੰਮ ਕਰਦੇ ਹੋ ਜਾਂ ਤੁਹਾਡੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਆਪ-ਮਹੈਤਾ ਅਟੋਮੈਟਿਕਲੀ ਪਛਾਣੀ ਨਹੀਂ ਜਾਂਦੀ, ਤਾਂ `azd auth login --tenant-id <tenant-id>` ਨਾਲ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।

2. **ਵਰਕਸ਼ਾਪ ਰਿਪੋਜ਼ਟੋਰੀ ਕਲੋਨ ਕਰੋ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ਮੌਡੀਊਲ 1: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ AZD ਸੰਰਚਨਾ ਦੀ ਸਮਝ

### ਇੱਕ AI AZD ਟੈਮਪਲੇਟ ਦੀ ਬੰਨ੍ਹਟ

ਏਕ AI-ਤਿਆਰ AZD ਟੈਮਪਲੇਟ ਵਿੱਚ ਮਹੱਤਵਪੂਰਨ ਫਾਇਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:

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

### **ਲੈਬ ਅਭਿਆਸ 1.1: ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ**

1. **azure.yaml ਫਾਇਲ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਜੋ ਦੇਖਣਾ ਹੈ:**
- AI ਕੰਪੋਨੈਂਟਾਂ ਲਈ ਸੇਵਾ ਪਰਿਭਾਸ਼ਾ
- ਵਾਤਾਵਰਨ ਚਲਨ ਵਰਤਣ ਵਾਲੇ ਨਕਸ਼ੇ
- ਹੋਸਟ ਸੰਰਚਨਾ

2. **ਮੁੱਖ ਬਾਈਸਪ ਇੰਫ੍ਰਾਸਟ੍ਰੱਕਚਰ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**ਮੁੱਖ AI ਪੈਟਰਨ ਜੋ ਪਛਾਣੇ ਜਾਣ:**
- Microsoft Foundry ਮਾਡਲ ਸੇਵਾ ਪ੍ਰਦਾਨ ਕਰਨਾ
- Azure AI Search ਇੰਟਿਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੀ ਪ੍ਰਬੰਧਨ
- ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾ

### **ਚਰਚਾ ਬਿੰਦੂ:** AI ਲਈ ਇਹ ਪੈਟਰਨ ਕਿਉਂ ਜਰੂਰੀ ਹਨ

- **ਸੇਵਾ ਨਿਰਭਰਤਾ**: AI ਐਪ ਨੂੰ ਅਕਸਰ ਕਈ ਸੇਵਾਵਾਂ ਦੀ ਸਮਨਵਿਤ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **ਸੁਰੱਖਿਆ**: API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੌਇੰਟ ਸੁਰੱਖਿਅਤ ਪ੍ਰਬੰਧਨ ਦੀ ਲੋੜ
- **ਮਾਪਯੋਗਤਾ**: AI ਕਾਰਜਭਾਰ ਲਈ ਵਿਲੱਖਣ ਸਕੇਲਿੰਗ ਦੀਆਂ ਲੋੜਾਂ
- **ਲਾਗਤ ਪ੍ਰਬੰਧਨ**: ਜੇਕਰ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਨਾ ਕੀਤਾ ਜਾਵੇ ਤਾਂ AI ਸੇਵਾਵਾਂ ਮਹਿੰਗੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ

## ਮੌਡੀਊਲ 2: ਆਪਣਾ ਪਹਿਲਾ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਏ ਕਰੋ

### ਕਦਮ 2.1: ਵਾਤਾਵਰਨ ਸ਼ੁਰੂ ਕਰੋ

1. **ਨਵਾਂ AZD ਵਾਤਾਵਰਨ ਬਣਾਓ:**
```bash
azd env new myai-workshop
```

2. **ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰ ਸੈਟ ਕਰੋ:**
```bash
# ਆਪਣਾ ਪਸੰਦੀਦਾ ਅਜ਼ੂਰ ਖੇਤਰ ਸੈਟ ਕਰੋ
azd env set AZURE_LOCATION eastus

# ਵਿਕਲਪਕ: ਖਾਸ OpenAI ਮਾਡਲ ਸੈਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ਕਦਮ 2.2: ਇੰਫ੍ਰਾਸਟ੍ਰੱਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਏ ਕਰੋ

1. **AZD ਨਾਲ ਡਿਪਲੋਏ ਕਰੋ:**
```bash
azd up
```

**`azd up` ਹਿੱਸੇ ਵਿਚ ਕੀ ਹੁੰਦਾ ਹੈ:**
- ✅ Microsoft Foundry ਮਾਡਲਾਂ ਦੀ ਸੇਵਾ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ
- ✅ Azure AI Search ਸੇਵਾ ਬਣਾਉਂਦਾ ਹੈ
- ✅ ਵੈੱਬ ਐਪ ਲਈ ਐਪ ਸਰਵਿਸ ਸੈਟ ਕਰਦਾ ਹੈ
- ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੋਏ ਕਰਦਾ ਹੈ
- ✅ ਨਿਗਰਾਨੀ ਅਤੇ ਲੌਗਿੰਗ ਸੈਟ ਕਰਦਾ ਹੈ

2. **ਡਿਪਲੋਏਮੈਂਟ ਪ੍ਰਗਤੀ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੇ ਸਰੋਤਾਂ ਦਾ ਧਿਆਨ ਰੱਖੋ।

### ਕਦਮ 2.3: ਆਪਣੀ ਡਿਪਲੋਏਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ

1. **ਡਿਪਲੋਏ ਕੀਤੇ ਸਰੋਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਡਿਪਲੋਏ ਕੀਤੇ ਐਪ ਖੋਲ੍ਹੋ:**
```bash
azd show
```

`azd show` आउटਪੁੱਟ ਵਿੱਚ ਦਿਖਾਈ ਗਈ ਵੈੱਬ ਐਂਡਪਾਇੰਟ ਖੋਲ੍ਹੋ।

3. **AI ਫੰਕਸ਼ਨਲਟੀ ਨੂੰ ਟੈਸਟ ਕਰੋ:**
   - ਵੈੱਬ ਐਪ ਵਿੱਚ ਜਾਓ
   - ਸੈਂਪਲ ਕੁਐਰੀਜ਼ ਕੋਸ਼ਿਸ਼ ਕਰੋ
   - ਯਕੀਨੀ ਬਣਾਓ ਕਿ AI ਜਵਾਬ ਕਾਮ ਕਰ ਰਹੇ ਹਨ

### **ਲੈਬ ਅਭਿਆਸ 2.1: ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਅਭਿਆਸ**

**ਦ੍ਰਿਸ਼ਟੀਕੋਣ**: ਤੁਹਾਡੀ ਡਿਪਲੋਏਮੈਂਟ ਸਫਲ ਰਹੀ ਪਰ AI ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਆਮ ਸਮੱਸਿਆਵਾਂ ਜਿਨ੍ਹਾਂ ਨੂੰ ਜਾਂਚੋ:**
1. **OpenAI API ਕੁੰਜੀਆਂ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਉਹ ਸਹੀ ਤਰ੍ਹਾਂ ਸੈਟ ਹਨ
2. **ਮਾਡਲ ਉਪਲਬਧਤਾ**: ਚੈੱਕ ਕਰੋ ਕਿ ਤੁਹਾਡਾ ਵੀਲਯੂ ਕ੍ਰਮ ਮਾਡਲ ਲਈ ਕਿਵੇਂ ਸਮਰਥਿਤ ਹੈ
3. **ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ**: ਸੁਨਿਸ਼ਚਿਤ ਕਰੋ ਕਿ ਸੇਵਾਵਾਂ ਸੰਜੋਗ ਕਰ ਸਕਦੀਆਂ ਹਨ
4. **RBAC ਅਨੁਮਤੀਆਂ**: ਯਕੀਨ ਕਰੋ ਕਿ ਐਪ OpenAI ਤੇ ਪਹੁੰਚ ਸਕਦਾ ਹੈ

**ਡੀਬੱਗਿੰਗ ਕਮਾਂਡਾਂ:**
```bash
# ਵਾਤਾਵਰਣ ਚਰਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values

# ਤਾਇਨਾਤੀ ਲאָג ਵੇਖੋ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ਦੀ ਤਾਇਨਾਤੀ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ਮੌਡੀਊਲ 3: ਆਪਣੀਆਂ ਲੋੜਾਂ ਲਈ AI ਐਪ ਨੂੰ ਵਿਅਕਤੀਗਤ ਕਰਨਾ

### ਕਦਮ 3.1: AI ਸੰਰਚਨਾ ਨੂੰ ਸੋਧੋ

1. **OpenAI ਮਾਡਲ ਅਪਡੇਟ ਕਰੋ:**
```bash
# ਵੱਖਰੇ ਮਾਡਲ ਵਿੱਚ ਬਦਲੋ (ਜੇ ਤੁਹਾਡੇ ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ ਹੋਵੇ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ਨਵੀਂ ਸੰਰਚਨਾ ਨਾਲ ਮੁੜ ਤਾਇਨਾਤ ਕਰੋ
azd deploy
```

2. **ਹੋਰ AI ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ:**

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

### ਕਦਮ 3.2: ਵਾਤਾਵਰਨ-ਵਿਸ਼ੇਸ਼ ਸੰਰਚਨਾ

**ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ**: ਵਿਕਾਸ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾ।

1. **ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਨ ਬਣਾਓ:**
```bash
azd env new myai-production
```

2. **ਪ੍ਰੋਡਕਸ਼ਨ ਵਿਸ਼ੇਸ਼ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# ਉਤਪਾਦਨ ਆਮ ਤੌਰ 'ਤੇ ਵੱਧ SKUs ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ਵਾਧੂ ਸੁਰੱਖਿਆ ਮੁਹੱਈਆ ਕਰਨ ਵਾਲੀਆਂ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨੂੰ ਸ੍ਰਿਜਨਾਤਮਕ ਬਣਾਓ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ਲੈਬ ਅਭਿਆਸ 3.1: ਲਾਗਤ ਅਨੁਕੂਲਤਾ**

**ਚੁਣੌਤੀ**: ਟੈਮਪਲੇਟ ਨੂੰ ਖਰਚਾ-ਪ੍ਰਭਾਵੀ ਵਿਕਾਸ ਲਈ ਸੰਰਚਿਤ ਕਰੋ।

**ਟਾਸਕ:**
1. ਪਛਾਣੋ ਕਿ ਕਿਹੜੇ SKU ਮੁਫ਼ਤ/ਬੇਸਿਕ ਟੀਅਰ ਵਿੱਚ ਸੈਟ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ
2. ਘੱਟੋ-ਘੱਟ ਖਰਚ ਲਈ ਵਾਤਾਵਰਨ ਚਲਨ ਵਰਤਣ ਵਾਲੇ ਸੈੱਟ ਕਰੋ
3. ਪ੍ਰੋਡਕਸ਼ਨ ਸੰਰਚਨਾ ਨਾਲ ਡਿਪਲੋਏ ਕਰੋ ਅਤੇ ਖਰਚ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਸਮਾਧਾਨ ਸੁਝਾਵ:**
- ਜੇ ਸੰਭਵ ਹੋਵੇ ਤਾਂ Azure AI ਸੇਵਾਵਾਂ ਲਈ F0 (ਮੁਫ਼ਤ) ਟੀਅਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਵਿਕਾਸ ਵਿੱਚ Search ਸੇਵਾ ਲਈ ਬੇਸਿਕ ਟੀਅਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਫੰਕਸ਼ਨ ਲਈ ਖਪਤ ਯੋਜਨਾ ਬਾਰੇ ਸੋਚੋ

## ਮੌਡੀਊਲ 4: ਸੁਰੱਖਿਆ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵਧੀਆ ਅਭਿਆਸ

### ਕਦਮ 4.1: ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ

**ਮੌਜੂਦਾ ਚੁਣੌਤੀ**: ਬਹੁਤ ਸਾਰੇ AI ਐਪ API ਕੀਜ਼ ਹਾਰਡ ਕੋਡ ਕਰਦੇ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਵਰਤਦੇ ਹਨ।

**AZD ਦਾ ਉਪਾਇ**: Managed Identity + Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ।

1. **ਆਪਣੇ ਟੈਮਪਲੇਟ ਦੀ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
# ਕੀ ਵੌਲਟ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਪਹਚਾਣ ਸੰਰਚਨਾ ਲਈ ਖੋਜੋ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Manage Identity ਕੰਮ ਕਰ ਰਹੀ ਹੈ ਕਿ ਨਹੀਂ ਜਾਂਚੋ:**
```bash
# ਜਾਂਚੋ ਕਿ ਵੈੱਬ ਐਪ ਵਿੱਚ ਸਹੀ ਪਹਚਾਣ ਸੰਰਚਨਾ ਹੈ ਕੀ ਨਹੀਂ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ਕਦਮ 4.2: ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ

1. **ਆਇਡੀਆਂ (ਜਿਵੇਂ ਕਿ ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟ) ਨੂੰ ਸਰਗਰਮ ਕਰੋ** (ਜੇ ਪਹਿਲਾਂ ਸੰਰਚਿਤ ਨਾ ਹੋਇਆ ਹੋਵੇ):

ਆਪਣੀ ਬਾਈਸਪ ਟੈਮਪਲੇਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:
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

### ਕਦਮ 4.3: ਨਿਗਰਾਨੀ ਅਤੇ ਦੇਖਭਾਲ

1. **ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਸੰਰਚਿਤ ਕਰੋ:**
```bash
# ਐਪਲਿਕੇਸ਼ਨ ਇੰਸਾਈਟਸ ਨੂੰ ਆਪੋ-ਆਪਣੀ ਸੰਰਚਨਾ ਕਰਨੀ ਚਾਹੀਦੀ ਹੈ
# ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ਵਿਸ਼ੇਸ਼ ਨਿਗਰਾਨੀ ਸੈੱਟ ਕਰੋ:**

AI ਆਪਰੇਸ਼ਨਾਂ ਲਈ ਕਸਟਮ ਮੈਟਰਿਕਸ ਸ਼ਾਮਲ ਕਰੋ:
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

**ਟਾਸਕ**: ਆਪਣੇ ਡਿਪਲੋਏਮੈਂਟ ਦੀ ਸੁਰੱਖਿਆ ਵਧੀਆ ਅਭਿਆਸ ਲਈ ਸਮੀਖਿਆ ਕਰੋ।

**ਚੈੱਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਸੰਰਚਨਾ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਸਿਕ੍ਰੇਟ ਨਹੀਂ
- [ ] ਸੇਵਾ-ਤੋਂ-ਸੇਵਾ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ Managed Identity ਦੀ ਵਰਤੋਂ
- [ ] Key Vault ਸੰਵੇਦਨਸ਼ੀਲ ਸੰਰਚਨਾ ਸਟੋਰ ਕਰਦਾ ਹੈ
- [ ] ਨੈੱਟਵਰਕ ਪਹੁੰਚ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੀਮਤ ਕੀਤੀ ਗਈ ਹੈ
- [ ] ਨਿਗਰਾਨੀ ਅਤੇ ਲੌਗਿੰਗ ਚਾਲੂ ਹਨ

## ਮੌਡੀਊਲ 5: ਆਪਣਾ ਖੁਦ ਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਬਦਲਣਾ

### ਕਦਮ 5.1: ਮੂਲਿਆਂਕਣ ਵਰਕਸ਼ੀਟ

**ਆਪਣੇ ਐਪ ਨੂੰ ਬਦਲਣ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਸਵਾਲ ਜਵਾਬ ਦਿਓ:

1. **ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਸੰਰਚਨਾ:**
   - ਤੁਹਾਡਾ ਐਪ ਕਿਹੜੀਆਂ AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ?
   - ਇਸਨੂੰ ਕਿਹੜੇ ਕੰਪਿਊਟ ਸਰੋਤਾਂ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡਾਟਾਬੇਸ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਵਿਚਕਾਰ ਕੀ ਨਿਰਭਰਤਾ ਹੈ?

2. **ਸੁਰੱਖਿਆ ਦੀਆਂ ਲੋੜਾਂ:**
   - ਤੁਹਾਡਾ ਐਪ ਕਿਹੜੇ ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਹੜੀਆਂ ਪਾਲਣਾ ਲੋੜਾਂ ਹਨ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈੱਟਵਰਕਿੰਗ ਦੀ ਜਰੂਰਤ ਹੈ?

3. **ਮਾਪਯੋਗਤਾ ਦੀਆਂ ਲੋੜਾਂ:**
   - ਤੁਹਾਡਾ ਅਪੇक्षित ਬੋਝ ਕਿੰਨਾ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਦੀ ਜਰੂਰਤ ਹੈ?
   - ਕੀ ਭੂਗੋਲਿਕ ਲੋੜਾਂ ਹਨ?

### ਕਦਮ 5.2: ਆਪਣਾ AZD ਟੈਮਪਲੇਟ ਬਣਾਓ

**ਆਪਣੇ ਐਪ ਨੂੰ ਬਦਲਣ ਲਈ ਇਹ ਪੈਟਰਨ ਫੋਲੋ ਕਰੋ:**

1. **ਮੂਲ ਸੰਰਚਨਾ ਬਣਾਓ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ਟੈਮਪਲੇਟ ਸ਼ੁਰੂ ਕਰੋ
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

3. **ਇੰਫ੍ਰਾਸਟ੍ਰੱਕਚਰ ਟੈਮਪਲੇਟ ਬਣਾਓ:**

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

**infra/modules/openai.bicep** - OpenAI ਮੌਡੀਊਲ:
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

### **ਲੈਬ ਅਭਿਆਸ 5.1: ਟੈਮਪਲੇਟ ਬਣਾਉਣ ਦੀ ਚੁਣੌਤੀ**

**ਚੁਣੌਤੀ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ AI ਐਪ ਲਈ AZD ਟੈਮਪਲੇਟ ਬਣਾਓ।

**ਲੋੜਾਂ:**
- Microsoft Foundry Models ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ
- Document Intelligence OCR ਲਈ
- ਦਸਤਾਵੇਜ਼ ਅੱਪਲੋਡ ਲਈ Storage Account
- ਪ੍ਰੋਸੈਸਿੰਗ ਲਾਜਿਕ ਲਈ ਫੰਕਸ਼ਨ ਐਪ
- ਉਪਭੋਗਤਾ ਇੰਟਰਫੇਸ ਲਈ ਵੈੱਬ ਐਪ

**ਬੋਨਸ ਪਾਇੰਟਸ:**
- ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਏਰਰ ਹੇਂਡਲਿੰਗ ਸ਼ਾਮਲ ਕਰੋ
- ਖਰਚਾ ਅੰਦਾਜ਼ਾ ਸ਼ਾਮਲ ਕਰੋ
- ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ ਸੈੱਟ ਕਰੋ

## ਮੌਡੀਊਲ 6: ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਚੁਕਾਉ

### ਆਮ ਡਿਪਲੋਏਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 1: OpenAI ਸੇਵਾ ਕੋਟਾ ਪਾਰ ਹੋਇਆ
**ਲਕੜੀਆਂ:** ਡਿਪਲੋਏਮੈਂਟ ਕੋਟਾ ਗਲਤੀ ਕਰਕੇ ਫੇਲ ਹੁੰਦਾ ਹੈ
**ਸਮਾਧਾਨ:**
```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਚੈੱਕ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਕੋਟਾ ਵੱਧਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ ਜਾਂ ਵੱਖਰਾ ਖੇਤਰ ਅਜਮਾਓ
azd env set AZURE_LOCATION westus2
azd up
```

#### ਸਮੱਸਿਆ 2: ਮਾਡਲ ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ
**ਲਕੜੀਆਂ:** AI ਜਵਾਬ ਫੇਲ ਜਾਂ ਮਾਡਲ ਡਿਪਲੋਏਮੈਂਟ ਗਲਤੀਆਂ
**ਸਮਾਧਾਨ:**
```bash
# ਖੇਤਰ ਅਨੁਸਾਰ ਮਾਡਲ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices model list --location eastus

# ਉਪਲਬਧ ਮਾਡਲ ਵਿੱਚ ਅੱਪਡੇਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### ਸਮੱਸਿਆ 3: ਅਨੁਮਤੀ ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ
**ਲਕੜੀਆਂ:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਨ ਵੇਲੈ 403 ਫੋਰਬਿਡਨ ਗਲਤੀਆਂ
**ਸਮਾਧਾਨ:**
```bash
# ਭੂਮਿਕਾ ਨਿਰਧਾਰਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਗੁੰਮ ਭੂਮਿਕਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 4: ਆਸਤਮਾਈ ਜਵਾਬ ਦੇਣ ਵਿੱਚ ਧੀਮਪਨ
**ਜਾਂਚ ਕਦਮ:**
1. ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਵਿੱਚ ਪ੍ਰਦਰਸ਼ਨ ਮੈਟਰਿਕਸ ਚੈੱਕ ਕਰੋ
2. Azure ਪੋਰਟਲ ਵਿੱਚ OpenAI ਸੇਵਾ ਮੈਟਰਿਕਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਅਤੇ ਲੇਟੈਂਸੀ ਦੀ ਸੈਧਾਂਤਿਕ ਜਾਂਚ ਕਰੋ

**ਸਮਾਧਾਨ:**
- ਆਮ ਪੁੱਛੀਆਂ ਜਾਂਦੀਆਂ ਕੁਐਰੀਜ਼ ਲਈ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਆਪਣੇ ਉਪਯੋਗ ਮਾਮਲੇ ਲਈ ਉਚਿਤ OpenAI ਮਾਡਲ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਉੱਚ-ਭਾਰ ਦ੍ਰਿਸ਼ਾਂਤਾਂ ਲਈ ਪੜ੍ਹਨ ਦੇ ਦੁਹਰਾਅ ਵਾਲੇ ਨਕਲ ਕਰਨ ਵਾਲਿਆਂ ਬਾਰੇ ਸੋਚੋ

### **ਲੈਬ ਅਭਿਆਸ 6.1: ਡੀਬੱਗਿੰਗ ਚੁਣੌਤੀ**

**ਦ੍ਰਿਸ਼ਟੀਕੋਣ**: ਤੁਹਾਡੀ ਡਿਪਲੋਏਮੈਂਟ ਸਫਲ ਰਹੀ, ਪਰ ਐਪਲੀਕੇਸ਼ਨ 500 ਗਲਤੀਆਂ ਵਾਪਸ ਕਰਦਾ ਹੈ।

**ਡੀਬੱਗਿੰਗ ਟਾਸਕ:**
1. ਐਪ ਲਈ ਲੌਗ ਚੈੱਕ ਕਰੋ
2. ਸੇਵਾ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ
3. ਪ੍ਰਮਾਣਿਕਤਾ ਟੈਸਟ ਕਰੋ
4. ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ

**ਵਰਤੋਂ ਲਈ ਸੰਦ:**
- ਡਿਪਲੋਏਮੈਂਟ ਦੇ ਓਵਰਵਿਊ ਲਈ `azd show`
- ਵਿਸਥਾਰਪੂਰਕ ਸੇਵਾ ਲੌਗ ਲਈ Azure ਪੋਰਟਲ
- ਐਪਲੀਕੇਸ਼ਨ ਟੈਲੀਮੇਟਰੀ ਲਈ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ

## ਮੌਡੀਊਲ 7: ਨਿਗਰਾਨੀ ਅਤੇ ਅਨੁਕੂਲਤਾ

### ਕਦਮ 7.1: ਵਿਆਪਕ ਨਿਗਰਾਨੀ ਸੈੱਟ ਕਰੋ

1. **ਕਸਟਮ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ:**

Azure ਪੋਰਟਲ ਵਿੱਚ ਜਾਓ ਅਤੇ ਇੱਕ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੇ:
- OpenAI ਬੇਨਤੀ ਗਿਣਤੀ ਅਤੇ ਲੇਟੈਂਸੀ
- ਐਪਲੀਕੇਸ਼ਨ ਗਲਤੀ ਦਰ
- ਸਰੋਤ ਦੀ ਵਰਤੋਂ
- ਖਰਚ ਦੀ ਟ੍ਰੈਕਿੰਗ

2. **ਅਲਰਟ ਸੈੱਟ ਕਰੋ:**
```bash
# ਉੱਚ ਗੜਬੜ ਦਰ ਲਈ ਚੇਤਾਵਨੀ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ਕਦਮ 7.2: ਖਰਚ ਅਨੁਕੂਲਤਾ

1. **ਮੌਜੂਦਾ ਖਰਚ ਦੀ ਵਿਸ਼ਲੇਸ਼ਣਾ ਕਰੋ:**
```bash
# ਖ਼ਰਚੇ ਦਾ ਡਾਟਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰੋ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ਖਰਚ ਨਿਯੰਤਰਣ ਲਾਗੂ ਕਰੋ:**
- ਬਜਟ ਅਲਰਟ ਸੈੱਟ ਕਰੋ
- ਆਟੋਸਕੇਲਿੰਗ ਨੀਤੀਆਂ ਵਰਤੋਂ
- ਬੇਨਤੀ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- OpenAI ਲਈ ਟੋਕਨ ਵਰਤੋਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ

### **ਲੈਬ ਅਭਿਆਸ 7.1: ਪ੍ਰਦਰਸ਼ਨ ਵਿੱਚ ਸੁਧਾਰ**

**ਟਾਸਕ**: ਆਪਣੇ AI ਐਪ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਖਰਚ ਦੋਹਾਂ ਨੂੰ ਅਨੁਕੂਲ ਕਰੋ।

**ਸੁਧਾਰ ਕਰਨ ਵਾਲੇ ਮੈਟਰਿਕਸ:**
- ਔਸਤ ਜਵਾਬ ਸਮਾਂ 20% ਘਟਾਓ
- ਮਹੀਨਾਵਾਰ ਖਰਚ 15% ਘਟਾਓ
- 99.9% ਅਪਟਾਈਮ ਬਣਾਈ ਰੱਖੋ

**ਕੋਸ਼ਿਸ਼ ਕਰਨ ਵਾਲੀ ਰਣਨੀਤੀਆਂ:**
- ਜਵਾਬ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਟੋਕਨ ਦਰ ਦੀ ਕੁਸ਼ਲਤਾਂ ਲਈ ਪ੍ਰਾਂਪਟਸ ਨੂੰ ਅਨੁਕੂਲ ਕਰੋ
- ਉਚਿਤ ਕੰਪਿਊਟ SKU ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਠੀਕ ਆਟੋਸਕੇਲਿੰਗ ਸੈੱਟ ਕਰੋ

## ਅੰਤਿਮ ਚੁਣੌਤੀ: ਪੂਰਾ ਕਾਰਜਨ्वੇਸ਼ਨ

### ਚੁਣੌਤੀ ਦਾ ਦ੍ਰਿਸ਼ਟੀਕੋਣ

ਤੁਹਾਨੂੰ ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI-ਸਮਰਥਿਤ ਗਾਹਕ ਸੇਵਾ ਚੈਟਬੋਟ ਬਣਾਉਣ ਲਈ ਕਿਰਤ ਸੌਂਪੀ ਗਈ ਹੈ ਜਿਸ ਵਿੱਚ ਇਹ ਲੋੜਾਂ ਹਨ:

**ਕਾਰਜਕਾਰੀ ਲੋੜਾਂ:**
- ਗਾਹਕ ਸੰਵਾਦਾਂ ਲਈ ਵੈੱਬ ਇੰਟਰਫੇਸ
- ਜਵਾਬ ਲਈ Microsoft Foundry Models ਨਾਲ ਇਕੀਕਰਨ
- ਦਸਤਾਵੇਜ਼ ਖੋਜ ਲਈ Azure AI Search ਵਰਤੋਂ
- ਮੌਜੂਦਾ ਗਾਹਕ ਡਾਟਾਬੇਸ ਨਾਲ ਇਕੀਕਰਨ
- ਬਹੁ-ਭਾਸ਼ਾਈ ਸਹਾਇਤਾ

**ਗੈਰ-ਕਾਰਜਕਾਰੀ ਲੋੜਾਂ:**
- 1000 ਸਮਕਾਲੀ ਉਪਭੋਗਤਿਆਂ ਨੂੰ ਸੰਭਾਲਣਾ
- 99.9% ਅਪਟਾਈਮ SLA
- SOC 2 ਪਾਲਣਾ
- $500 ਪ੍ਰਤੀ ਮਹੀਨਾ ਤੋਂ ਘੱਟ ਖਰਚ
- ਕਈ ਵਾਤਾਵਰਨਾਂ (ਦੇਵ, ਸਟੇਜਿੰਗ, ਪ੍ਰੋਡ) ਵਿੱਚ ਡਿਪਲੋਏ

### ਕਾਰਜਨ੍ਵੇਸ਼ਨ ਕਦਮ

1. **ਸੰਰਚਨਾ ਡਿਜ਼ਾਈਨ ਕਰੋ**
2. **AZD ਟੈਮਪਲੇਟ ਬਣਾਓ**
3. **ਸੁਰੱਖਿਆ ਉਪਾਇ ਲਾਗੂ ਕਰੋ**
4. **ਨਿਗਰਾਨੀ ਅਤੇ ਅਲਰਟਿੰਗ ਸੈੱਟ ਕਰੋ**
5. **ਡਿਪਲੋਏਮੈਂਟ ਪਾਈਪਲਾਈਨ ਬਣਾਓ**
6. **ਹੱਲ ਦੀ ਡਾਕੂਮੈਂਟੇਸ਼ਨ ਕਰੋ**

### ਮੁਲਾਂਕਣ ਮਾਪਦੰਡ

- ✅ **ਕਾਰਕਿਰਦਗੀ**: ਕੀ ਇਹ ਸਾਰੀਆਂ ਲੋੜਾਂ ਨੂੰ ਪੂਰਾ ਕਰਦਾ ਹੈ?
- ✅ **ਸੁਰੱਖਿਆ**: ਕੀ ਵਧੀਆ ਅਭਿਆਸ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ?
- ✅ **ਮਾਪਯੋਗਤਾ**: ਕੀ ਇਹ ਬੋਝ ਸੰਭਾਲ ਸਕਦਾ ਹੈ?
- ✅ **ਰੱਖ-ਰਖਾਅ ਜੋਗਤਾ**: ਕੀ ਕੋਡ ਅਤੇ ਇੰਫ੍ਰਾਸਟ੍ਰੱਕਚਰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਵਿਵਸਥਿਤ ਹਨ?
- ✅ **ਲਾਗਤ**: ਕੀ ਇਹ ਬਜਟ ਵਿੱਚ ਰਹਿੰਦਾ ਹੈ?

## ਵਾਧੂ ਸਰੋਤ

### Microsoft ਦਸਤਾਵੇਜ਼
- [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/ai-studio/)

### ਨਮੂਨਾ ਟੈਮਪਲੇਟ
- [Microsoft Foundry Models ਚੈਟ ਐਪ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI ਚੈਟ ਐਪ ਕਵਿਕਸਟਾਰਟ](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ਕਮਿਊਨਿਟੀ ਸਰੋਤ
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ਸਮਾਪਤੀ ਪ੍ਰਮਾਣਪੱਤਰ

ਮੁਬਾਰਕਾਂ! ਤੁਸੀਂ AI ਵਰਕਸ਼ਾਪ ਲੈਬ ਪੂਰੀ ਕਰ ਲਈ ਹੈ। ਹੁਣ ਤੁਹਾਨੂੰ ਇਹ ਸਮਰੱਥਾ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ ਕਿ ਤੁਸੀਂ:

- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ AZD ਟੈਂਪਲੇਟਾਂ ਵਿੱਚ ਬਦਲ ਸਕਦੇ ਹੋ
- ✅ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨ ਤਾਇਨਾਤ ਕਰ ਸਕਦੇ ਹੋ
- ✅ AI ਵਰਕਲੋਡ ਲਈ ਸੁਰੱਖਿਆ ਦੀਆਂ ਸਾਰੀਆਂ ਵਧੀਆ ਅਮਲਾਂ ਨੂੰ ਲਾਗੂ ਕਰ ਸਕਦੇ ਹੋ
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਸੁਧਾਰ ਕਰ ਸਕਦੇ ਹੋ
- ✅ ਆਮ ਤਾਇਨਾਤ ਮੁਸ਼ਕਲਾਂ ਨੂੰ ਸੂਝ-ਬੂਝ ਨਾਲ ਹੱਲ ਕਰ ਸਕਦੇ ਹੋ

### ਅਗਲੇ ਕਦਮ
1. ਇਹ ਪੈਟਰਨ ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਾਂ 'ਤੇ ਲਾਗੂ ਕਰੋ
2. ਟੈਂਪਲੇਟਾਂ ਨੂੰ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਵਾਪਸ ਯੋਗਦਾਨ ਦਿਓ
3. ਲਗਾਤਾਰ ਸਹਿਯੋਗ ਲਈ Microsoft Foundry Discord 'ਚ ਸ਼ਾਮਿਲ ਹੋਵੋ
4. ਮਲਟੀ-ਰੀਜਨ ਤਾਇਨਾਤ ਵਰਗੀਆਂ ਵਿਕਸਿਤ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ

---

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਅਨੁਭਵ [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) ਵਿੱਚ ਸਾਂਝਾ ਕਰਕੇ ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਬеҳਤਰ ਬਣਾਉਣ ਵਿੱਚ ਸਾਡੀ ਮਦਦ ਕਰੋ।

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [ਨਵਾਂ ਸਿਖਨ ਵਾਲਿਆਂ ਲਈ AZD](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾਂ**: [AI ਮਾਡਲ ਤਾਇਨਾਤ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਪ੍ਰੋਡਕਸ਼ਨ AI ਵਧੀਆ ਅਮਲ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

**ਸਹਾਇਤਾ ਚਾਹੀਦੀ ਹੈ?** AZD ਅਤੇ AI ਤਾਇਨਾਤ ਬਾਰੇ ਸਹਿਯੋਗ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੀ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->