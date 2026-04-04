# AI Workshop Lab: ਆਪਣੀਆਂ AI ਸੋਲੂਸ਼ਨਜ਼ ਨੂੰ AZD-Deployable ਬਣਾਉਣਾ

**Chapter Navigation:**
- **📚 Course Home**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 Current Chapter**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ Previous**: [AI ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ Next**: [ਪ੍ਰੋਡਕਸ਼ਨ AI ਚੰਗੇ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 Next Chapter**: [ਅਧਿਆਇ 3: Configuration](../chapter-03-configuration/configuration.md)

## ਵਰਕਸ਼ਾਪ ਓਵਰਵਿਊ

ਇਹ ਹੱਥ-ਵਰਤੋਂ ਲੈਬ ਵਿਕਾਸਕਾਰਾਂ ਨੂੰ ਮੌਜੂਦਾ AI ਟੈਮਪਲੇਟ ਲੈ ਕੇ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਨਾਲ ਡਿਪਲੋਯ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਰਾਹੀਂ ਰਾਹਨੁਮਾਈ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਿਆਂ ਪ੍ਰੋਡਕਸ਼ਨ AI ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਜਰੂਰੀ ਪੈਟਰਨ ਸਿੱਖੋਗੇ।

> **Validation note (2026-03-25):** ਇਹ ਵਰਕਸ਼ਾਪ `azd` `1.23.12` ਦੇ ਖ਼ਿਲਾਫ਼ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ ਸੀ। ਜੇ ਤੁਹਾਡੀ ਲੋਕਲ ਇੰਸਟਾਲੇਸ਼ਨ ਪੁਰਾਣੀ ਹੈ, ਤਾਂ ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ AZD ਅਪਡੇਟ ਕਰੋ ਤਾਂ ਜੋ auth, template, ਅਤੇ deployment ਵਰਕਫਲੋ ਹੇਠ ਦਿੱਤੇ ਕਦਮਾਂ ਨਾਲ ਮਿਲਦੇ ਹੋਣ।

**Duration:** 2-3 ਘੰਟੇ  
**Level:** ਦਰਮਿਆਨਾ  
**Prerequisites:** ਬੁਨਿਆਦੀ Azure ਗਿਆਨ, AI/ML ਧਾਰਣਾਵਾਂ ਨਾਲ ਜਾਣੂਤਾ

## 🎓 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ تک, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਮਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਲਈ ਰੂਪਾਂਤਰਿਤ ਕਰਨਾ
- ✅ AZD ਨਾਲ Microsoft Foundry ਸੇਵਾਵਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨਾ
- ✅ AI ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਕ੍ਰੈਡੇਂਸ਼ਲ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰਨਾ
- ✅ ਨਿਗਰਾਨੀ ਸਮੇਤ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਯਾਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਯ ਕਰਨਾ
- ✅ ਆਮ AI ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰਾਬਲਸ਼ੂਟ ਕਰਨਾ

## ਤਿਆਰੀਆਂ

### ਲੋੜੀਂਦੇ ਟੂਲ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਐਡੀਟਰ (VS Code ਦੀ ਸਿਫਾਰਸ਼)

### Azure ਸਰੋਤ
- Contributor ਅਕਸੇਸ ਵਾਲੀ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- Microsoft Foundry Models ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰਨ ਦੀ ਯੋਗਤਾ)
- Resource group ਬਣਾਉਣ ਦੀ ਆਗਿਆ

### ਗਿਆਨ-ਸਬੰਧੀ ਤਿਆਰੀ
- Azure ਸੇਵਾਵਾਂ ਦੀ ਮੂਲ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸ ਦੀ ਜਾਣੂਤਾ
- ਬੁਨਿਆਦੀ AI/ML ਧਾਰਣਾਵਾਂ (APIs, ਮਾਡਲ, ਪ੍ਰਾਮਪਟਸ)

## ਲੈਬ ਸੈਟਅਪ

### ਕਦਮ 1: ਵਾਤਾਵਰਣ ਤਿਆਰ ਕਰਨਾ

1. **ਟੂਲ ਇੰਸਟਾਲੇਸ਼ਨਾਂ ਦੀ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ:**
```bash
# AZD ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# Azure CLI ਦੀ ਜਾਂਚ ਕਰੋ
az --version

# AZD ਵਰਕਫਲੋਜ਼ ਲਈ Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
azd auth login

# ਜੇ ਤੁਸੀਂ ਡਾਇਗਨੋਸਟਿਕਸ ਦੌਰਾਨ az ਕਮਾਂਡ ਚਲਾਉਣ ਦੀ ਯੋਜਨਾ ਬਣਾਉਂਦੇ ਹੋ ਤਾਂ ਹੀ Azure CLI ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
az login
```

ਜੇ ਤੁਸੀਂ ਕਈ ਟੇਨੈਂਟਾਂ 'ਚ ਕੰਮ ਕਰਦੇ ਹੋ ਜਾਂ ਤੁਹਾਡੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਪਤਾ ਨਹੀਂ ਲੱਗਦੀ, ਤਾਂ `azd auth login --tenant-id <tenant-id>` ਨਾਲ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।

2. **ਵਰਕਸ਼ਾਪ ਰੀਪੋ ਜ਼ ਕਲੋਨ ਕਰੋ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ਮਾਡਿਊਲ 1: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ AZD ਢਾਂਚਾ ਸਮਝਣਾ

### AI AZD ਟੈਮਪਲੇਟ ਦੀ ਰਚਨਾ

AI-ਰੇਡੀ AZD ਟੈਮਪਲੇਟ ਵਿੱਚ ਮੁੱਖ ਫਾਈਲਾਂ ਦੀ ਪੜਚੋਲ ਕਰੋ:

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

### **ਲੈਬ ਅਭਿਆਸ 1.1: ਸੰਰਚਨਾ ਦੀ ਪੜਚੋਲ**

1. **azure.yaml ਫਾਈਲ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਕੀ ਦੇਖਣਾ ਹੈ:**
- AI ਕੰਪੋਨੈਂਟਾਂ ਲਈ ਸੇਵਾ ਪਰਿਭਾਸ਼ਾਵਾਂ
- Environment variable ਮੈਪਿੰਗ
- ਹੋਸਟ ਸੰਰਚਨਾਵਾਂ

2. **main.bicep ਇਨਫਰੇਸਟਰੱਕਚਰ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**ਪਛਾਣ ਕਰਨ ਯੋਗ ਮੁੱਖ AI ਪੈਟਰਨ:**
- Microsoft Foundry Models ਸੇਵਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- Cognitive Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੀ ਪ੍ਰਬੰਧਨ
- ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾਵਾਂ

### **ਚਰਚਾ ਦਾ ਵਿਸ਼ਾ:** AI ਲਈ ਇਹ ਪੈਟਰਨ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹਨ

- **ਸੇਵਾ ਨਿਰਭਰਤਾਵਾਂ**: AI ਐਪਸ ਨੂੰ ਅਕਸਰ ਕਈ ਕੋਆਰਡੀਨੇਟ ਕੀਤੀਆਂ ਸੇਵਾਵਾਂ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **ਸੁਰੱਖਿਆ**: API ਕੀਜ਼ ਅਤੇ ਐਂਡਪੋਇੰਟਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਦੀ ਲੋੜ ਹੈ
- **ਸਕੇਲਬਿਲਟੀ**: AI ਵਰਕਲੋਡਾਂ ਦੀਆਂ ਵਿਲੱਖਣ ਸਕੇਲਿੰਗ ਦੀਆਂ ਲੋੜਾਂ ਹੁੰਦੀਆਂ ਹਨ
- **ਲਾਗਤ ਪ੍ਰਬੰਧਨ**: ਜੇ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਨਾ ਕੀਤਾ ਜਾਵੇ ਤਾਂ AI ਸੇਵਾਵਾਂ ਮਹਿੰਗੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ

## ਮਾਡਿਊਲ 2: ਆਪਣੀ ਪਹਿਲੀ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਯ ਕਰੋ

### ਕਦਮ 2.1: ਵਾਤਾਵਰਣ ਸ਼ੁਰੂਆਤ ਕਰੋ

1. **ਨਵਾਂ AZD ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-workshop
```

2. **ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# ਆਪਣਾ ਮਨਪਸੰਦ Azure ਰੀਜ਼ਨ ਸੈਟ ਕਰੋ
azd env set AZURE_LOCATION eastus

# ਵਿਕਲਪ: ਖਾਸ OpenAI ਮਾਡਲ ਸੈਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ਕਦਮ 2.2: ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਯ ਕਰੋ

1. **AZD ਨਾਲ ਡਿਪਲੋਯ ਕਰੋ:**
```bash
azd up
```

**`azd up` ਦੌਰਾਨ ਕੀ ਹੁੰਦਾ ਹੈ:**
- ✅ Microsoft Foundry Models ਸੇਵਾ ਪ੍ਰੋਵੀਜਨ ਹੋ ਜਾਂਦੀ ਹੈ
- ✅ Cognitive Search ਸੇਵਾ ਬਣਾਈ ਜਾਂਦੀ ਹੈ
- ✅ ਵੈਬ ਐਪਲਿਕੇਸ਼ਨ ਲਈ App Service ਸੈੱਟ ਕੀਤਾ ਜਾਂਦਾ ਹੈ
- ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੰਰਚਿਤ ਕੀਤੀ ਜਾਂਦੀ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੋਯ ਹੁੰਦਾ ਹੈ
- ✅ ਨਿਗਰਾਨੀ ਅਤੇ ਲੌਗਿੰਗ ਸੈੱਟ ਕੀਤੀ ਜਾਂਦੀ ਹੈ

2. **ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਗਤੀ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੇ ਸਰੋਤਾਂ ਨੂੰ ਨੋਟ ਕਰੋ।

### ਕਦਮ 2.3: ਆਪਣੀ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ

1. **ਡਿਪਲੋਯ ਕੀਤੇ ਸਰੋਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਡਿਪਲੋਯ ਕੀਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਖੋਲ੍ਹੋ:**
```bash
azd show
```

`azd show` ਆਉਟਪੁਟ ਵਿੱਚ ਦਿੱਤਾ ਵੈਬ ਐਂਡਪੋਇੰਟ ਖੋਲ੍ਹੋ।

3. **AI ਫੰਕਸ਼ਨਾਲਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ:**
   - ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ 'ਤੇ ਜਾਓ
   - ਨਮੂਨਾ ਕੁਏਰੀਜ਼ ਕੋਸ਼ਿਸ਼ ਕਰੋ
   - ਪ੍ਰਮਾਣਿਤ ਕਰੋ ਕਿ AI ਜਵਾਬ ਕੰਮ ਕਰ ਰਹੇ ਹਨ

### **ਲੈਬ ਅਭਿਆਸ 2.1: ਟਰਬਲਸ਼ੂਟਿੰਗ ਅਭਿਆਸ**

**ਦੀਨਾਰਥ:** ਤੁਹਾਡੀ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਹੋਈ ਪਰ AI ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਆਮ ਸਮੱਸਿਆਵਾਂ ਜਿਨ੍ਹਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
1. **OpenAI API keys**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਉਹ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੈੱਟ ਹਨ
2. **ਮਾਡਲ ਉਪਲਬਧਤਾ**: ਦੇਖੋ ਕਿ ਤੁਹਾਡੇ ਰੀਜਨ ਵਿੱਚ ਮਾਡਲ ਸਹਾਇਤ ਹੁੰਦਾ ਹੈ ਕਿ ਨਹੀਂ
3. **ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਸੇਵਾਵਾਂ ਆਪਸ ਵਿੱਚ ਸੰਚਾਰ ਕਰ ਸਕਦੀਆਂ ਹਨ
4. **RBAC ਅਨੁਮਤੀਆਂ**: ਪ੍ਰਮਾਣਿਤ ਕਰੋ ਕਿ ਐਪ OpenAI ਨੂੰ ਐਕਸੈੱਸ ਕਰ ਸਕਦਾ ਹੈ

**ਡਿਬੱਗਿੰਗ ਕਮਾਂਡਾਂ:**
```bash
# ਮਾਹੌਲ ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values

# ਡਿਪਲੋਇਮੈਂਟ ਲਾਗਾਂ ਵੇਖੋ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ਮਾਡਿਊਲ 3: ਆਪਣੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

### ਕਦਮ 3.1: AI ਸੰਰਚਨਾ ਵਿੱਚ ਸੋਧ ਕਰੋ

1. **OpenAI ਮਾਡਲ ਨੂੰ ਅੱਪਡੇਟ ਕਰੋ:**
```bash
# ਜੇ ਤੁਹਾਡੇ ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ ਹੋਵੇ ਤਾਂ ਕਿਸੇ ਹੋਰ ਮਾਡਲ 'ਤੇ ਬਦਲੋ
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ਨਵੀਂ ਸੰਰਚਨਾ ਨਾਲ ਦੁਬਾਰਾ ਤਾਇਨਾਤ ਕਰੋ
azd deploy
```

2. **ਵਾਧੂ AI ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ:**

Document Intelligence ਸ਼ਾਮਲ ਕਰਨ ਲਈ `infra/main.bicep` ਨੂੰ ਸੋਧੋ:

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

### ਕਦਮ 3.2: ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਿਤ ਸੰਰਚਨਾਵਾਂ

**ਚੰਗੀ ਅਭਿਆਸ**: ਡਿਵੈਲਪਮੈਂਟ ਵਰਸਸ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ।

1. **ਇਕ ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-production
```

2. **ਪ੍ਰੋਡਕਸ਼ਨ-ਨਿਰਧਾਰਿਤ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# ਉਤਪਾਦਨ ਆਮ ਤੌਰ ਤੇ ਉੱਚੇ SKUs ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ਅਤਿਰਿਕਤ ਸੁਰੱਖਿਆ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨੂੰ ਚਾਲੂ ਕਰੋ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ਲੈਬ ਅਭਿਆਸ 3.1: ਲਾਗਤ ਸੁਧਾਰ**

**ਚੈਲੇੰਜ**: ਵਿਕਾਸ ਲਈ ਲਾਗਤ-ਕੁਸ਼ਲ ਟੈਮਪਲੇਟ ਸੰਰਚਿਤ ਕਰੋ।

**ਕਾਰਜ:**
1. ਪਛਾਣ ਕਰੋ ਕਿ ਕਿਹੜੇ SKUs ਨੂੰ ਫ্রি/ਬੇਸਿਕ ਟੀਅਰ 'ਤੇ ਰੱਖਿਆ ਜਾ ਸਕਦਾ ਹੈ
2. ਘੱਟ ਤੋਂ ਘੱਟ ਲਾਗਤ ਲਈ environment variables ਸੰਰਚਿਤ ਕਰੋ
3. ਡਿਪਲੋਯ ਕਰੋ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਸੰਰਚਨਾ ਨਾਲ ਲਾਗਤ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਹੱਲ ਲਈ ਸੁਝਾਵ:**
- ਜਿੱਥੇ ਸੰਭਵ ਹੋ F0 (ਫ੍ਰੀ) ਟੀਅਰ Cognitive Services ਲਈ ਵਰਤੋ
- ਡਿਵੈਲਪਮੈਂਟ ਵਿੱਚ Search Service ਲਈ Basic ਟੀਅਰ ਵਰਤੋ
- Functions ਲਈ Consumption ਪਲੈਨ ਵਰਤਣ 'ਤੇ ਵਿਚਾਰ ਕਰੋ

## ਮਾਡਿਊਲ 4: ਸੁਰੱਖਿਆ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਚੰਗੀਆਂ ਅਭਿਆਸ

### ਕਦਮ 4.1: ਸੁਰੱਖਿਅਤ ਕ੍ਰੈਡੇਂਸ਼ਲ ਪ੍ਰਬੰਧਨ

**ਮੌਜੂਦਾ ਚੁਣੌਤੀ**: ਬਹੁਤ ਸਾਰੇ AI ਐਪਸ API ਕੀਜ਼ ਹਾਰਡਕੋਡ ਕਰਦੇ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਵਰਤਦੇ ਹਨ।

**AZD ਹੱਲ**: Managed Identity + Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ।

1. **ਆਪਣੇ ਟੈਮਪਲੇਟ ਵਿੱਚ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
# ਕੀ ਵੌਲਟ ਅਤੇ ਮੈਨੇਜਡ ਆਈਡੈਂਟੀਟੀ ਦੀ ਸੰਰਚਨਾ ਲਈ ਖੋਜ ਕਰੋ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity ਕੰਮ ਕਰ ਰਹੀ ਹੈ ਕਿ ਨਹੀਂ ਜਾਂਚੋ:**
```bash
# ਜਾਂਚੋ ਕਿ ਵੈੱਬ ਐਪ ਦੀ ਆਈਡੈਂਟੀ ਸੰਰਚਨਾ ਸਹੀ ਹੈ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ਕਦਮ 4.2: ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ

1. **ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੋਇੰਟਸ ਚਾਲੂ ਕਰੋ** (ਜੇ ਪਹਿਲਾਂ ਤੋਂ ਸੰਰਚਿਤ ਨਾ ਹੋਵੇ):

ਆਪਣੇ bicep ਟੈਮਪਲੇਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:
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

### ਕਦਮ 4.3: ਨਿਗਰਾਨੀ ਅਤੇ ਦਿੱਖਯੋਗਤਾ

1. **Application Insights ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ:**
```bash
# Application Insights ਨੂੰ ਆਪਣੇ ਆਪ ਸੰਰਚਿਤ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
# ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ਖਾਸ ਨਿਗਰਾਨੀ ਸੈੱਟ ਕਰੋ:**

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

### **ਲੈਬ ਅਭਿਆਸ 4.1: ਸੁਰੱਖਿਆ ਆਡਿਟ**

**ਕਾਰਜ**: ਆਪਣੀ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸੁਰੱਖਿਆ ਚੰਗੀਆਂ ਅਭਿਆਸ ਲਈ ਸਮੀਖਿਆ ਕਰੋ।

**ਚੈੱਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਸੰਰਚਨਾ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਕੀ_SECRET ਨਹੀਂ
- [ ] ਸੇਵਾ-ਟੂ-ਸੇਵਾ ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ Managed Identity ਵਰਤੀ ਗਈ ਹੈ
- [ ] ਸੰਵੇਦਨਸ਼ੀਲ ਸੰਰਚਨਾ Key Vault ਵਿੱਚ ਸਟੋਰ ਕੀਤੀ ਗਈ ਹੈ
- [ ] ਨੈੱਟਵਰਕ ਆਕਸੇਸ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਸੀਮਿਤ ਹੈ
- [ ] ਨਿਗਰਾਨੀ ਅਤੇ ਲੌਗਿੰਗ ਚਾਲੂ ਹਨ

## ਮਾਡਿਊਲ 5: ਆਪਣੀ ਮੌਜੂਦਾ AI ਐਪ ਨੂੰ ਰੂਪਾਂਤਰਿਤ ਕਰਨਾ

### ਕਦਮ 5.1: ਮੁਲਾਂਕਣ ਵਰਕਸ਼ੀਟ

**ਆਪਣੀ ਐਪ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਸਵਾਲਾਂ ਦੇ ਜਵਾਬ ਦਿਓ:

1. **ਐਪਲੀਕੇਸ਼ਨ ਆਰਕਿਟੈਕਚਰ:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਹੜੀਆਂ AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦੀ ਹੈ?
   - ਇਸਨੂੰ ਕਿਹੜੇ ਕਮਪਿਊਟ ਸਰੋਤਾਂ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡੇਟਾਬੇਸ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਦਰਮਿਆਨ ਨਿਰਭਰਤਾਵਾਂ ਕੀ ਹਨ?

2. **ਸੁਰੱਖਿਆ ਲੋੜਾਂ:**
   - ਤੁਹਾਡੀ ਐਪ ਕਿਹੜਾ ਸੰਵੇਦਨਸ਼ੀਲ ਡੇਟਾ ਹੈਂਡਲ ਕਰਦੀ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਹੜੀਆਂ ਕੰਪਲਾਇੰਸ ਲੋੜਾਂ ਹਨ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈੱਟਵਰਕਿੰਗ ਦੀ ਲੋੜ ਹੈ?

3. **ਸਕੇਲਿੰਗ ਲੋੜਾਂ:**
   - ਤੁਹਾਡਾ ਅਨੁਮਾਨਿਤ ਲੋਡ ਕੀ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਰੀਜਨਲ ਲੋੜਾਂ ਹਨ?

### ਕਦਮ 5.2: ਆਪਣਾ AZD ਟੈਮਪਲੇਟ ਬਣਾਓ

**ਆਪਣੀ ਐਪ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਲਈ ਇਸ ਪੈਟਰਨ ਦੀ ਪਾਲਨਾ ਕਰੋ:**

1. **ਮੁੱਢਲੀ ਸੰਰਚਨਾ ਬਣਾਓ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ਟੈਮਪਲੇਟ ਨੂੰ ਆਰੰਭ ਕਰੋ
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

3. **ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਟੈਮਪਲੇਟ ਬਣਾਓ:**

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

### **ਲੈਬ ਅਭਿਆਸ 5.1: ਟੈਮਪਲੇਟ ਬਣਾਉਣ ਦੀ ਚੈਲੇੰਜ**

**ਚੈਲੇੰਜ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ AI ਐਪ ਲਈ AZD ਟੈਮਪਲੇਟ ਬਣਾਓ।

**ਲੋੜਾਂ:**
- ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Microsoft Foundry Models
- OCR ਲਈ Document Intelligence
- ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਲਈ Storage Account
- ਪ੍ਰੋਸੈਸਿੰਗ ਲਾਜਿਕ ਲਈ Function App
- ਯੂਜ਼ਰ ਇੰਟਰਫੇਸ ਲਈ Web app

**ਬੋਨਸ ਅੰਕ:**
- ਠੀਕ ਤਰ੍ਹਾਂ ਐਰਰ ਹੈਂਡਲਿੰਗ ਜੋੜੋ
- ਲਾਗਤ ਅਨੁਮਾਨ ਸ਼ਾਮਲ ਕਰੋ
- ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ ਸੈੱਟ ਕਰੋ

## ਮਾਡਿਊਲ 6: ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 1: OpenAI ਸੇਵਾ ਕੋਟਾ ਬਹੁਤ ਹੋ ਗਿਆ
**ਲੱਛਣ:** ਡਿਪਲੋਇਮੈਂਟ ਕੋਟਾ error ਨਾਲ ਫੇਲ ਹੁੰਦੀ ਹੈ
**ਹੱਲ:**
```bash
# ਮੌਜੂਦਾ ਕੋਟਿਆਂ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਕੋਟਾ ਵਧਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ ਜਾਂ ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਨੂੰ ਆਜ਼ਮਾਓ
azd env set AZURE_LOCATION westus2
azd up
```

#### ਸਮੱਸਿਆ 2: ਮਾਡਲ ਰੀਜਨ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ
**ਲੱਛਣ:** AI ਜਵਾਬ ਫੇਲ ਜਾਂ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ 에ਰਰ
**ਹੱਲ:**
```bash
# ਖੇਤਰ ਅਨੁਸਾਰ ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਜਾਂਚੋ
az cognitiveservices model list --location eastus

# ਉਪਲਬਧ ਮਾਡਲ 'ਤੇ ਅਪਡੇਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### ਸਮੱਸਿਆ 3: ਪਰਮਿਸ਼ਨ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਦਿਆਂ 403 Forbidden errors
**ਹੱਲ:**
```bash
# ਰੋਲ ਸੌਂਪਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਗਾਇਬ ਰੋਲ ਜੋੜੋ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 4: Slow AI Responses
**ਜਾਂਚ ਕਦਮ:**
1. Application Insights ਵਿੱਚ ਪ੍ਰਦਰਸ਼ਨ ਮੈਟ੍ਰਿਕਸ ਚੈੱਕ ਕਰੋ
2. Azure ਪੋਰਟਲ ਵਿੱਚ OpenAI ਸੇਵਾ ਮੈਟ੍ਰਿਕਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਅਤੇ ਲੈਟੈਂਸੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

**ਹੱਲ:**
- ਆਮ ਕੁਏਰੀਜ਼ ਲਈ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਆਪਣੇ ਵਰਤੇ ਕੇਸ ਲਈ ਉਚਿਤ OpenAI ਮਾਡਲ ਵਰਤੋਂ
- ਉੱਚ-ਲੋਡ ਸੈਨਾਰਿਓਜ਼ ਲਈ ਰੀਡ ਰੈਪਲਿਕਾਸ 'ਤੇ ਵਿਚਾਰ ਕਰੋ

### **ਲੈਬ ਅਭਿਆਸ 6.1: ਡਿਬੱਗਿੰਗ ਚੈਲੇੰਜ**

**ਦੀਨਾਰਥ:** ਤੁਹਾਡੀ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਹੋਈ, ਪਰ ਐਪਲੀਕੇਸ਼ਨ 500 errors ਵਾਪਸ ਕਰਦਾ ਹੈ।

**ਡਿਬੱਗਿੰਗ ਕਾਰਜ:**
1. ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਸ ਚੈੱਕ ਕਰੋ
2. ਸੇਵਾ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
3. ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਜਾਂਚ ਕਰੋ
4. ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ

**ਉਪਕਾਰਣ ਜੋ ਵਰਤਣੇ ਹਨ:**
- ਡਿਪਲੋਇਮੈਂਟ ਓਵਰਵਿਊ ਲਈ `azd show`
- ਵਿਸਥਾਰਿਤ ਸੇਵਾ ਲੌਗਸ ਲਈ Azure ਪੋਰਟਲ
- ਐਪਲੀਕੇਸ਼ਨ ਟੈਲੀਮੇਟਰੀ ਲਈ Application Insights

## ਮਾਡਿਊਲ 7: ਨਿਗਰਾਨੀ ਅਤੇ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

### ਕਦਮ 7.1: ਵਿਸਤ੍ਰਿਤ ਨਿਗਰਾਨੀ ਸੈੱਟ ਕਰੋ

1. **ਕਸਟਮ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ:**

Azure ਪੋਰਟਲ ਤੇ ਜਾ ਕੇ ਇਹਨਾਂ ਨਾਲ ਇਕ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ:
- OpenAI ਬੇਨਤੀ ਗਿਣਤੀ ਅਤੇ ਲੈਟੈਂਸੀ
- ਐਪਲੀਕੇਸ਼ਨ ਐਰਰ ਰੇਟ
- ਸਰੋਤ ਉਪਯੋਗਤਾ
- ਲਾਗਤ ਟ੍ਰੈਕਿੰਗ

2. **ਅਲਰਟਸ ਸੈੱਟ ਕਰੋ:**
```bash
# ਉੱਚੀ ਗਲਤੀ ਦਰ ਲਈ ਚੇਤਾਵਨੀ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ਕਦਮ 7.2: ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

1. **ਮੌਜੂਦਾ ਲਾਗਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲਾਗਤ ਡੇਟਾ ਪ੍ਰਾਪਤ ਕਰੋ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ਲਾਗਤ ਨਿਯੰਤਰਣ ਲਾਗੂ ਕਰੋ:**
- ਬਜਟ ਅਲਰਟਸ ਸੈੱਟ ਕਰੋ
- ਆਟੋਸਕੇਲਿੰਗ ਨੀਤੀਆਂ ਵਰਤੋ
- ਬੇਨਤੀ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- OpenAI ਲਈ ਟੋਕਨ ਉਪਯੋਗ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ

### **ਲੈਬ ਅਭਿਆਸ 7.1: ਪ੍ਰਦਰਸ਼ਨ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ**

**ਕਾਰਜ**: ਆਪਣੇ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਲਾਗਤ ਦੋਹਾਂ ਲਈ optimize ਕਰੋ।

**ਬਿਹਤਰ ਬਣਾਉਣ ਲਈ ਮੈਟ੍ਰਿਕਸ:**
- ਔਸਤ ਪ੍ਰਤੀਸਾਦ ਸਮਾਂ 20% ਘਟਾਓ
- ਮਹੀਨਾਵਾਰੀ ਲਾਗਤ 15% ਘਟਾਓ
- 99.9% uptime ਬਣਾਈ ਰੱਖੋ

**ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਰਣਨੀਤੀਆਂ:**
- ਪ੍ਰਤੀਸਾਦ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਟੋਕਨ ਕੁਸ਼ਲਤਾ ਲਈ ਪ੍ਰਾਮਪਟ ਸਧਾਰਨ ਕਰੋ
- ਉਚਿਤ ਕਮਪਿਊਟ SKUs ਵਰਤੋ
- ਢੰਗ ਨਾਲ ਆਟੋਸਕੇਲਿੰਗ ਸੈੱਟ ਕਰੋ

## ਅਖੀਰਲਾ ਚੈਲੇੰਜ: ਐਂਡ-ਟੂ-ਐਂਡ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ

### ਚੈਲੇੰਜ ਸਿਨਾਰਿਓ

ਤੁਹਾਨੂੰ ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਯਾਰ AI ਪਾਵਰਡ ਕਸਟਮਰ ਸਰਵਿਸ ਚੈਟਬੋਟ ਬਣਾਉਣ ਦਾ ਟਾਸਕ ਦਿੱਤਾ ਗਿਆ ਹੈ ਜਿਸ ਦੀਆਂ ਲੋੜਾਂ:

**ਫੰਕਸ਼ਨਲ ਲੋੜਾਂ:**
- ਗਾਹਕ ਇੰਟਰੈਕਸ਼ਨਾਂ ਲਈ ਵੈਬ ਇੰਟਰਫੇਸ
- ਜਵਾਬਾਂ ਲਈ Microsoft Foundry Models ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- Cognitive Search ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਦਸਤਾਵੇਜ਼ ਖੋਜ ਯੋਗਤਾ
- ਮੌਜੂਦਾ ਗਾਹਕ ਡੈਟਾਬੇਸ ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਬਹੁ-ਭਾਸ਼ਾਈ ਸਹਿਯੋਗ

**ਗੈਰ-ਫੰਕਸ਼ਨਲ ਲੋੜਾਂ:**
- 1000 ਸਮਕਾਲੀ ਯੂਜ਼ਰ ਸੰਭਾਲ ਸਕੇ
- 99.9% uptime SLA
- SOC 2 ਕੰਪਲਾਇੰਸ
- ਮਹੀਨੇ ਦਾ ਖਰਚ $500 ਤੋਂ ਘੱਟ
- ਕਈ ਵਾਤਾਵਰਣਾਂ (dev, staging, prod) ਤੇ ਡਿਪਲੋਯ

### ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਕਦਮ

1. **ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਈਨ ਕਰੋ**
2. **AZD ਟੈਮਪਲੇਟ ਬਣਾਓ**
3. **ਸੁਰੱਖਿਆ ਉਪਾਇਆ ਲਾਗੂ ਕਰੋ**
4. **ਨਿਗਰਾਨੀ ਅਤੇ ਅਲਰਟਿੰਗ ਸੈੱਟ ਕਰੋ**
5. **ਡਿਪਲੋਇਮੈਂਟ ਪਾਈਪਲਾਈਨ ਬਣਾਓ**
6. **ਸੋਲੂਸ਼ਨ ਦਾ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ**

### ਮೌಲਿਆੰਕਣ ਮਾਪਦੰਡ

- ✅ **ਫੰਕਸ਼ਨਾਲਿਟੀ**: ਕੀ ਇਹ ਸਾਰੀਆਂ ਲੋੜਾਂ ਪੂਰੀਆਂ ਕਰਦਾ ਹੈ?
- ✅ **ਸੁਰੱਖਿਆ**: ਕੀ ਚੰਗੀਆਂ ਅਭਿਆਸ ਲਾਗੂ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ?
- ✅ **ਸਕੇਲਬਿਲਟੀ**: ਕੀ ਇਹ ਲੋਡ ਸੰਭਾਲ ਸਕਦਾ ਹੈ?
- ✅ **ਬਰਕਚਯੋਗਤਾ**: ਕੀ ਕੋਡ ਅਤੇ ਇਨਫ੍ਰਾ ਵਿਵਸਥਿਤ ਹਨ?
- ✅ **ਲਾਗਤ**: ਕੀ ਇਹ ਬਜਟ ਦੇ ਅੰਦਰ ਰਹਿੰਦਾ ਹੈ?

## ਵਾਧੂ ਸਰੋਤ

### Microsoft ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### ਨਮੂਨਾ ਟੈਮਪਲੇਟਸ
- [Microsoft Foundry ਮਾਡਲ ਚੈਟ ਐਪ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI ਚੈਟ ਐਪ ਕਵਿਕਸਟਾਰਟ](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso ਚੈਟ](https://github.com/Azure-Samples/contoso-chat)

### ਕਮਿਊਨਿਟੀ ਸਰੋਤ
- [Microsoft Foundry ਡਿਸਕੋਰਡ](https://discord.gg/microsoft-azure)
- [Azure ਡਿਵੈਲਪਰ CLI GitHub](https://github.com/Azure/azure-dev)
- [ਸ਼ਾਨਦਾਰ AZD ਟੈਮਪਲੇਟਸ](https://azure.github.io/awesome-azd/)

## 🎓 ਸਮਾਪਤੀ ਸਰਟੀਫਿਕੇਟ

ਬਧਾਈਆਂ! ਤੁਸੀਂ AI ਵਰਕਸ਼ਾਪ ਲੈਬ ਮੁਕੰਮਲ ਕਰ ਲਈ ਹੈ। ਹੁਣ ਤੁਹਾਨੂੰ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ:

- ✅ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ AZD ਟੈਮਪਲੇਟਾਂ ਵਿੱਚ ਬਦਲਣਾ
- ✅ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਏ ਕਰਨਾ
- ✅ AI ਲੋਡਾਂ ਲਈ ਸੁਰੱਖਿਆ ਦੀਆਂ ਸਰਵੋਤਮ ਪ੍ਰਥਾਵਾਂ ਲਾਗੂ ਕਰਨਾ
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਕਾਰکردਗੀ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਸੁਧਾਰ
- ✅ ਆਮ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਮਾਧਾਨ ਕਰਨਾ

### ਅਗਲੇ ਕਦਮ
1. ਇਹ ਨਮੂਨੇ ਆਪਣੇ AI ਪ੍ਰੋਜੈਕਟਾਂ 'ਤੇ ਲਾਗੂ ਕਰੋ
2. ਟੈਮਪਲੇਟਸ ਨੂੰ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਵਾਪਸ ਯੋਗਦਾਨ ਦਿਓ
3. ਲਗਾਤਾਰ ਸਹਾਇਤਾ ਲਈ Microsoft Foundry ਡਿਸਕੋਰਡ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ
4. ਬਹੁ-ਖੇਤਰ ਡਿਪਲੋਇਮੈਂਟ ਵਰਗੇ ਅੱਗੇਲੇ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ

---

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: ਸਾਨੂੰ ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਸੁਧਾਰਨ ਵਿੱਚ ਮਦਦ ਕਰੋ ਆਪਣਾ ਅਨੁਭਵ ਸਾਂਝਾ ਕਰਕੇ [Microsoft Foundry ਡਿਸਕੋਰਡ #Azure ਚੈਨਲ](https://discord.gg/microsoft-azure).

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਪ੍ਰੋਡਕਸ਼ਨ AI ਸਰਵੋਤਮ ਅਭਿਆਸ](production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

**ਮਦਦ ਚਾਹੀਦੀ ਹੈ?** AZD ਅਤੇ AI ਡਿਪਲੋਇਮੈਂਟਾਂ ਬਾਰੇ ਸਹਾਇਤਾ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੇ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੁਆਰਾ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਥਿਰਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->