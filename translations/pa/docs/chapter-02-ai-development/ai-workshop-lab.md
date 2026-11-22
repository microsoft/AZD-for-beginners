# ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ: ਤੁਹਾਡੇ ਏਆਈ ਹੱਲਾਂ ਨੂੰ AZD-ਡਿਪਲੋਏਬਲ ਬਣਾਉਣਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [ਆਰੰਭਿਕਾਂ ਲਈ AZD](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - ਏਆਈ-ਫਰਸਟ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [ਏਆਈ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਉਤਪਾਦਨ ਏਆਈ ਸਭ ਤੋਂ ਚੰਗੇ ਅਭਿਆਸ](../chapter-08-production/production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

## ਵਰਕਸ਼ਾਪ ਦਾ ਝਲਕ

ਇਹ ਹੱਥ-ਆਮਲ ਲੈਬ ਵਿਕਾਸਕਾਰਾਂ ਨੂੰ ਮੌਜੂਦਾ ਏਆਈ ਟੈਮਪਲੇਟ ਨੂੰ ਵਰਤ ਕੇ ਅਜ਼ੂਰ ਡਿਵੈਲਪਰ CLI (AZD) ਦਵਾਰਾ ਡਿਪਲੋਏ ਕਰਨ ਦੇ ਪ੍ਰਕਿਰਿਆ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ। ਤੁਸੀਂ ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਉਂਡਰੀ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰ ਕੇ ਉਤਪਾਦਨ ਏਆਈ ਡਿਪਲੋਏਮੈਂਟ ਲਈ ਜਰੂਰੀ ਪੈਟਰਨ ਸਿੱਖੋਂਗੇ।

> **ਰਿਲੀਜ਼ ਸਮੀਖਿਆ (2026-11-04):** AZD ਕਮਾਂਡ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼ ਅਤੇ ਨਮੂਨਾ ਸੰਰਚਨਾ ਨਾਮਾਂ ਨੂੰ `azd` `1.37.2` ਰਿਲੀਜ਼ ਅਤੇ ਸੰਬੰਧਤ ਨਮੂਨੇ ਦੀ ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਨਾਲ ਜ਼ਾਂਚਿਆ ਗਿਆ। ਇਹ ਦਸਤਾਵੇਜ਼ ਸਮੀਖਿਆ ਹੈ, ਨ ਕਿ ਲਾਈਵ ਡਿਪਲੋਏਮੈਂਟ ਪ੍ਰਮਾਣੀਕਰਨ। RAG ਲੈਬ ਨੂੰ ਏਜੇਂਟ ਐਕਸਟੈਂਸ਼ਨ ਦੀ ਲੋੜ ਨਹੀਂ; ਏਜੇਂਟ ਮੁਲਾਂਕਣ ਲਈ ਵੱਖਰੇ `azure.ai.evaluations` ਐਕਸਟੈਂਸ਼ਨ ਅਤੇ [ਮੌਜੂਦਾ ਮੁਲਾਂਕਣ ਵਰਕਫਲੋ](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ਦੀ ਵਰਤੋਂ ਕਰੋ, ਪੁਰਾਣੇ ਏਜੇਂਟ ਮੁਲਾਂਕਣ ਕਮਾਂਡ ਨਹੀਂ।

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਸਤਰ:** ਦਰਮਿਆਨਾ  
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾ:** ਮੂਲ ਅਜ਼ੂਰ ਜਾਣਕਾਰੀ, ਏਆਈ/ਐਮਐਲ ਧਾਰਣਾਵਾਂ ਨਾਲ ਜਾਣੂ

## 🎓 ਸਿੱਖਣ ਦੇ ਲਕੜੀ

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ✅ ਮੌਜੂਦਾ ਏਆਈ AZD ਟੈਮਪਲੇਟ ਦੀ ਖੋਜ ਕਰਨਾ ਅਤੇ ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਤਬਦੀਲੀ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣਾ
- ✅ AZD ਨਾਲ ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਉਂਡਰੀ ਸੇਵਾਵਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨਾ
- ✅ ਏਆਈ ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣ ਪੱਤਰ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰਨਾ
- ✅ ਨਿਗਰਾਨੀ ਨਾਲ ਏਆਈ ਸੰਦਰਭ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਏ ਕਰਨਾ
- ✅ ਆਮ ਏਆਈ ਡਿਪਲੋਏਮੈਂਟ ਮੁੱਦਿਆਂ ਦਾ ਨਿਵਾਰਣ ਕਰਨਾ

## ਪੂਰਵ-ਆਵਸ਼ਕਤਾ

### ਜਰੂਰੀ ਉਪਕਰਣ
- [ਅਜ਼ੂਰ ਡਿਵੈਲਪਰ CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [ਅਜ਼ੂਰ CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- [Git](https://git-scm.com/) ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਕੋਡ ਐਡੀਟਰ (VS ਕੋਡ ਦੀ ਸਿਫਾਰਸ਼)

ਇਹ ਕਮਾਂਡ ਬਲਾਕ Bash ਸਿੰਟੈਕਸ ਵਰਤਦੇ ਹਨ (ਲਾਈਨ ਜਾਰੀ ਰਹਿਣ ਸਮੇਤ ਅਤੇ `grep`). ਵਿਂਡੋਜ਼ 'ਤੇ, Git Bash/WSL ਵਰਤੋ ਜਾਂ ਇਨ੍ਹਾਂ ਨੂੰ PowerShell ਵਿੱਚ ਅਨੁਵਾਦ ਕਰੋ। ਨਾਲ ਹੀ [ਨਮੂਨੇ ਦੇ ਸਥਾਨਕ ਵਾਤਾਵਰਣ ਸੈੱਟਅੱਪ](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) ਵਿੱਚ ਦਿੱਤੇ ਭਾਸ਼ਾ, ਪੈਕੇਜ-ਮੈਨੇਜਰ, ਅਤੇ ਕੰਟੇਨਰ ਟੂਲਸ ਇੰਸਟਾਲ ਕਰੋ।

### ਅਜ਼ੁਰ ਸਰੋਤ
- ਅਜ਼ੁਰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਿਸ ਵਿੱਚ ਸਰੋਤ ਪ੍ਰਾਪਤੀ ਅਤੇ ਭੂਮਿਕਾ-ਅਸਾਈਨਮੈਂਟ ਦੀਆਂ ਪਰਮੀਸ਼ਨਾਂ ਹੁੰਦੀਆਂ ਹਨ (ਕੇਵਲ Contributor RBAC ਅਸਾਈਨਮੈਂਟ ਨਹੀਂ ਬਣਾ ਸਕਦਾ; ਅਧਿਕਾਰ ਪ੍ਰਾਪਤ ਭੂਮਿਕਾ ਪ੍ਰਬੰਧਕ ਜਾਂ ਨਮੂਨੇ ਦਾ ਦਰਜ ਕੀਤੇ ਸਮਾਨ ਦੀ ਵਰਤੋਂ ਕਰੋ)
- Microsoft Foundry Models ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ (ਜਾਂ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰਨ ਦੀ ਸਮਰੱਥਾ)
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀ ਪਰਮੀਸ਼ਨ

### ਗਿਆਨ ਦੀਆਂ ਜਰੂਰੀਆਂ
- ਅਜ਼ੂਰ ਸੇਵਾਵਾਂ ਦੀ ਬੁਨਿਆਦੀ ਸਮਝ
- ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸਾਂ ਨਾਲ ਜਾਣੂ
- ਬੁਨਿਆਦੀ AI/ML ਧਾਰਣਾਵਾਂ (APIs, ਮਾਡਲ, ਪ੍ਰਾਂਪਟ)

## ਲੈਬ ਸੈਟਅੱਪ

### ਕਦਮ 1: ਪਰਿਵੇਸ਼ ਦੀ ਤਿਆਰੀ

1. **ਟੂਲ ਇੰਸਟਾਲੇਸ਼ਨਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

ਜੇ ਤੁਸੀਂ ਕਈ ਟੇਨੈਂਟਾਂ 'ਤੇ ਕੰਮ ਕਰਦੇ ਹੋ ਜਾਂ ਤੁਹਾਡੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸਵੈਚਲਿਤ ਤੌਰ 'ਤੇ ਪਤਾ ਨਹੀਂ ਲੱਗਦੀ, ਤਾਂ `azd auth login --tenant-id <tenant-id>` ਨਾਲ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।

2. **ਵਰਕਸ਼ਾਪ ਰਿਪੋਜ਼ਿਟਰੀ ਨੂੰ ਕਲੋਨ ਕਰੋ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ਮਾਡਿਊਲ 1: ਏਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ AZD ਸਟ੍ਰਕਚਰ ਨੂੰ ਸਮਝਣਾ

### ਇੱਕ ਏਆਈ AZD ਟੈਂਪਲੇਟ ਦੀ ਬਣਤਰ

ਏਆਈ-ਤਿਆਰ AZD ਟੈਂਪਲੇਟ ਵਿੱਚ ਮੁੱਖ ਫਾਇਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

ਚੈੱਕਆਊਟ ਕੀਤਾ ਗਿਆ ਸੈਂਪਲ ਬਦਲ ਸਕਦਾ ਹੈ; `.azure/` ਮਾਹੌਲ ਦੀ ਸ਼ੁਰੂਆਤ ਬਾਅਦ ਆਉਂਦਾ ਹੈ, ਇਹ ਜ਼ਰੂਰੀ ਨਹੀਂ ਕਿ ਨਵੀਂ ਕਲੋਨ ਵਿੱਚ ਹੋਵੇ। ਇਸ ਡਾਇਗ੍ਰਾਮ ਦੀ ਤੂਲਨਾ ਕਰਨ ਲਈ ਗੁੰਮ ਫੋਲਡਰ ਬਣਾਉਣ ਦੀ ਬਜਾਏ ਅਸਲੀ ਚੈੱਕਆਊਟ ਦੀ ਜਾਂਚ ਕਰੋ।

### **ਲੈਬ ਕਸਰਤ 1.1: ਸੰਰਚਨਾ ਦੀ ਪੜਤਾਲ ਕਰੋ**

1. **azure.yaml ਫਾਇਲ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
cat azure.yaml
```

**ਜਾਣਨ ਯੋਗ ਗੱਲਾਂ:**
- ਏਆਈ ਕੰਪੋਨੈਂਟਾਂ ਲਈ ਸਰਵਿਸ ਡਿਫ਼ਿਨੀਸ਼ਨ
- ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਮੈਪਿੰਗਜ਼
- ਹੋਸਟ ਕੰਫਿਗਰੇਸ਼ਨਜ਼

2. **main.bicep ਢਾਂਚਾ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
cat infra/main.bicep
```

**ਮੁੱਖ AI ਪੈਟਰਨਾਂ ਦੀ ਪਹਿਚਾਣ:**
- Microsoft Foundry ਮਾਡਲਸ ਸੇਵਾ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ
- Azure AI Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਸੁਰੱਖਿਅਤ ਕੀ ਮੈਨੇਜਮੈਂਟ
- ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਅਤਾ ਕੰਫਿਗਰੇਸ਼ਨਜ਼

### **ਚਰਚਾ ਬਿੰਦੂ:** ਇਹ ਪੈਟਰਨ AI ਲਈ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹਨ

- **ਸੇਵਾ ਡਿੱਪੈਂਡੇਨਸੀਆਂ**: AI ਐਪਸ ਅਕਸਰ ਕਈ ਸਹਿਯੋਗੀ ਸੇਵਾਵਾਂ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ
- **ਸੁਰੱਖਿਆ**: API ਕੁੰਜੀਆਂ ਅਤੇ ਐਂਡਪੁਆਇੰਟਸ ਦੀ ਸੁਰੱਖਿਅਤ ਮੈਨੇਜਮੈਂਟ ਚਾਹੀਦੀ ਹੈ
- **ਸਕੇਲਫ਼ਿਲਟੀ**: AI ਵਰਕਲੋਡ ਵਿਅਕਤੀਗਤ ਸਕੇਲਿੰਗ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਨਾਲ ਹੁੰਦੇ ਹਨ
- **ਲਾਗਤ ਮੈਨੇਜਮੈਂਟ**: AI ਸੇਵਾਵਾਂ ਜੇ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸੰਰਚਿਤ ਨਾ ਕੀਤੀਆਂ ਜਾਣ ਤਾਂ ਮਹਿੰਗੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ

## ਮਾਡਯੂਲ 2: ਆਪਣੀ ਪਹਿਲੀ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

### ਕਦਮ 2.1: ਵਾਤਾਵਰਣ ਸ਼ੁਰੂ ਕਰੋ

1. **ਨਵਾਂ AZD ਵਾਤਾਵਰਣ ਬਣਾਓ:**
```bash
azd env new myai-workshop
```

2. **ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### ਕਦਮ 2.2: ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਡਿਪਲੌਇ ਕਰੋ

1. **AZD ਨਾਲ ਡਿਪਲੌਇ ਕਰੋ:**
```bash
azd up
```

**ਦੌਰਾਨ ਕੀ ਹੁੰਦਾ ਹੈ `azd up`:**
- ✅ Microsoft Foundry ਮਾਡਲਸ ਸੇਵਾ ਪ੍ਰੋਵੀਜ਼ਨ ਕਰਦਾ ਹੈ
- ✅ Azure AI Search ਸੇਵਾ ਬਣਾਉਂਦਾ ਹੈ
- ✅ ਬੈਕਐਂਡ ਅਤੇ ਬੰਡਲ ਫ੍ਰੰਟਏਂਡ ਲਈ Azure Container Apps ਸੈੱਟ ਕਰਦਾ ਹੈ (ਮੌਜੂਦਾ ਨਮੂਨਾ ਡੀਫ਼ੌਲਟ)
- ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਅਤਾ ਕੰਫਿਗਰ ਕਰਦਾ ਹੈ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ
- ✅ ਨਿਗਰਾਨੀ ਅਤੇ ਲਾਗਿੰਗ ਸੈੱਟ ਕਰਦਾ ਹੈ

2. **ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਗਤੀ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ** ਅਤੇ ਬਣ ਰਹੀਆਂ ਸਾਂਸਾਧਨਾਂ ਨੂੰ ਨੋਟ ਕਰੋ।

### ਕਦਮ 2.3: ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

1. **ਡਿਪਲੌਇ ਕੀਤੀਆਂ ਸਾਂਸਾਧਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
azd show
```

2. **ਡਿਪਲੌਇ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ:**
```bash
azd show
```

`azd show` ਆਉਟਪੁੱਟ ਵਿੱਚ ਦਿਖਾਏ ਵੈੱਬ ਐਂਡਪੋਇੰਟ ਨੂੰ ਖੋਲ੍ਹੋ।

3. **ਐਆਈ ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਜਾਂਚ ਕਰੋ:**
   - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ 'ਤੇ ਜਾਓ
   - ਨਮੂਨਾ ਪ੍ਰਸ਼ਨਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
   - ਪੱਕਾ ਕਰੋ ਕਿ ਐਆਈ ਉੱਤਰ ਕੰਮ ਕਰ ਰਹੇ ਹਨ

### **ਲੈਬ ਅਭਿਆਸ 2.1: ਸਮੱਸਿਆ ਹਲ ਕਰਨ ਦਾ ਅਭਿਆਸ**

**ਦ੍ਰਿਸ਼ਟੀਕੋਣ**: ਤੁਹਾਡੀ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਰਿਹਾ ਪਰ ਐਆਈ ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ।

**ਆਮ ਸਮੱਸਿਆਵਾਂ ਜਾਂਚੋ:**
1. **ਪ੍ਰਮਾਣਿਕਤਾ**: ਪ੍ਰਬੰਧਿਤ ਪਹਚਾਨ ਅਤੇ ਭੂਮਿਕਾ ਸੌਂਪਣ ਦੀ ਜਾਂਚ ਕਰੋ; ਸਿਰਫ਼ ਉਨ੍ਹਾਂ API ਕੁੰਜੀਆਂ ਨੂੰ ਚੈੱਕ ਕਰੋ ਜੇ ਤੁਸੀਂ ਜਾਣ ਬੂਝ ਕੇ ਕੁੰਜੀ ਅਧਾਰਿਤ ਪ੍ਰਮਾਣਿਕਤਾ ਚਾਲੂ ਕੀਤੀ ਹੈ
2. **ਮਾਡਲ ਉਪਲਬਧਤਾ**: ਚੈੱਕ ਕਰੋ ਕਿ ਤੁਹਾਡੇ ਖੇਤਰ ਵਿੱਚ ਮਾਡਲ ਸਹਾਇਤਾ ਹੈ ਜਾਂ ਨਹੀਂ
3. **ਨੈਟਵਰਕ ਕਨੈਕਟੀਵੀਟੀ**: ਸੇਵਾਵਾਂ ਨੂੰ ਇਕ ਦੂਜੇ ਨਾਲ ਸੰਚਾਰ ਕਰਨ ਦੇ ਯੋਗ ਹੋਣਾ ਪक्का ਕਰੋ
4. **RBAC ਅਧਿਕਾਰ**: ਐਪ ਨੂੰ OpenAI ਦੀ ਪਹੁੰਚ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ

**ਡੀਬੱਗਿੰਗ ਕਮਾਂਡ:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ਮੋਡੀਊਲ 3: ਤੁਹਾਡੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ ਐਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ کسٹਮਾਈਜ਼ੇਸ਼ਨ

### ਕਦਮ 3.1: ਐਆਈ ਸੰਰਚਨਾ ਨੂੰ ਬਦਲੋ

1. **OpenAI ਮਾਡਲ ਨੂੰ ਅਪਡੇਟ ਕਰੋ:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **ਵਾਧੂ ਐਆਈ ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ:**

ਡੌਕਯੂਮੈਂਟ ਇੰਟੈਲੀਜੈਂਸ ਸ਼ਾਮਲ ਕਰਨ ਲਈ `infra/main.bicep` ਨੂੰ ਸੋਧੋ:

ਹੇਠਾਂ ਦਿੱਤਾ ਉਦਾਹਰਣੀ ਟੁਕੜਾ ਹੈ, ਪੂਰਾ ਟੈਮਪਲੇਟ ਨਹੀਂ। ਨਮੂਨਾ ਪਹਿਲਾਂ ਹੀ ਡੌਕਯੂਮੈਂਟ-ਪ੍ਰੋਸੈਸਿੰਗ ਸੇਵਾਵਾਂ ਸਥਾਪਿਤ ਕਰ ਸਕਦਾ ਹੈ: ਨਕਲ ਸਰੋਤ ਸ਼ਾਮਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਇਸ ਦੀ ਮੌਜੂਦਾ ਸਮੱਗਰੀ ਦੀ ਜਾਂਚ ਕਰੋ। ਕਸਟਮ ਸ਼ਾਮਲ ਕਰਨਾ ਆਔਟਪੁੱਟ, ਪਹਚਾਨਾਂ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਸੰਰਚਨਾ ਨਾਲ ਜੁੜਾਈ ਦੀ ਮੰਗ ਕਰਦਾ ਹੈ।

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

### ਕਦਮ 3.2: ਵਾਤਾਵਰਨ-ਵਿਸ਼ੇਸ਼ ਸੰਰਚਨਾਵਾਂ

**ਸਰਵੋਤਮ ਅਭਿਆਸ**: ਵਿਕਾਸ ਅਤੇ ਉਤਪਾਦਨ ਲਈ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ।

1. **ਉਤਪਾਦਨ ਵਾਤਾਵਰਨ ਬਣਾਓ:**
```bash
azd env new myai-production
```

2. **ਉਤਪਾਦਨ-ਵਿਸ਼ੇਸ਼ ਪੈਰਾਮੀਟਰ ਸੈੱਟ ਕਰੋ:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

ਇਹ ਨਾਮ ਨਮੂਨੇ ਦੇ [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) ਤੋਂ ਆਉਂਦੇ ਹਨ। `azd env set` ਇੱਕ ਮੁੱਲ ਸંગ્રਹਿਤ ਕਰਦਾ ਹੈ ਪਰ ਇੱਕ ਮਨਮਾਨਾ ਚਲ ਦੇ ਕਦਮ ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਕਰਦਾ: ਟੈਂਪਲੇਟ ਨੂੰ ਇਸਦੀ ਖਪਤ ਕਰਨੀ ਚਾਹੀਦੀ ਹੈ। ਜਨਤਾ ਪਹੁੰਚ ਬੰਦ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਨਮੂਨੇ ਦੀ [network isolation guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) ਦੀ ਸਮੀਖਿਆ ਕਰੋ, ਅਤੇ ਇੰਫਰਾਸਟਰੱਕਚਰ ਬਦਲਾਅ ਕਰਨ ਲਈ `azd up` ਦੀ ਵਰਤੋਂ ਕਰੋ। OpenAI SKU `S0` ਅਕੇਲਾ ਮਾਡਲ ਦੇ ਥਰੂਪੁੱਟ ਨੂੰ ਨਿਰਧਾਰਤ ਨਹੀਂ ਕਰਦਾ; ਮਾਡਲ ਤਾਇਨਾਤੀ ਕਿਸਮ ਅਤੇ ਸਮਰੱਥਾ ਵੀ ਮਹੱਤਵਪੂਰਨ ਹਨ।

### **ਲੈਬ ਅਭਿਆਸ 3.1: ਲਾਗਤ ਅਨੁਕੂਲਤਾ**

**ਚੁਣੌਤੀ**: ਲਾਗਤ-ਲਾਭਦਾਇਕ ਵਿਕਾਸ ਲਈ ਟੈਂਪਲੇਟ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ।

**ਕੰਮ:**
1. ਫਜੂਲ ਵਰਕਸ਼ਾਪ ਵਾਤਾਵਰਨ ਚੁਣੋ: `azd env select myai-workshop`।
2. ਮੌਜੂਦਾ Search SKU ਅਤੇ ਮਾਡਲ ਸਮਰੱਥਾ ਨੂੰ `infra/main.parameters.json` ਅਤੇ ਚੁਣੇ ਹੋਏ ਵਾਤਾਵਰਨ ਤੋਂ ਦਰਜ ਕਰੋ।
3. ਹੇਠਾਂ ਦਿੱਤੇ ਸਮਰਥਿਤ ਇਨਪੁਟ ਦੀ ਵਰਤੋਂ ਕਰੋ, ਮਾਡਲ/ਖੇਤਰ ਕੋਟਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਤੋਂ ਬਾਅਦ:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. ਪੋਰਟਲ ਵਿੱਚ Search SKU ਅਤੇ ਤਾਇਨਾਤੀ ਸਮਰੱਥਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ ਕੀਮਤ ਕੈਲਕੁਲੇਟਰ ਨਾਲ ਅੰਤਰ ਦਾ ਅੰਦਾਜ਼ਾ ਲਗਾਓ। ਤੁਰੰਤ ਬਿਲਿੰਗ ਡਾਟਾ ਅਪਡੇਟ ਦੀ ਉਮੀਦ ਨਾ ਕਰੋ।

**ਸਫਲਤਾ ਮਾਪਦੰਡ:** Search Basic ਵਰਤਦਾ ਹੈ, ਚੈਟ ਤਾਇਨਾਤੀ ਨੂੰ ਮੰਗੀ ਗਈ ਸਮਰੱਥਾ ਹੈ, ਅਤੇ ਐਪ ਹਜੇ ਵੀ ਨਮੂਨੇ ਦਾ ਪ੍ਰਸ਼ਨ ਜਵਾਬ ਦਿੰਦੀ ਹੈ। ਸਮਰੱਥਾ `10` ਇੱਕ ਦਰ-ਸੀਮਾ ਵੰਡ ਹੈ, ਟੋਕਨ ਕੀਮਤ ਛੂਟ ਨਹੀਂ। Search ਤੀਅਰ ਬਦਲਾਅ ਰੋਕੀ ਜਾਂ ਸਕਦੀ ਹੈ ਜਾਂ ਨਵਾਂ ਬਣਾਉਣ ਦੀ ਜ਼ਰੂਰਤ ਪੈ ਸਕਦੀ ਹੈ; ਉਤਪਾਦਨ ਸੰਸਾਧਨਾਂ 'ਤੇ ਪ੍ਰਯੋਗ ਨਾ ਕਰੋ। F0 ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਹੈ ਅਤੇ Azure OpenAI ਮਾਡਲ SKU ਨਹੀਂ ਹੈ।

## ਮਾਡਿਊਲ 4: ਸੁਰੱਖਿਆ ਅਤੇ ਉਤਪਾਦਨ ਦੀਆਂ ਸਭ ਤੋਂ ਵਧੀਆ ਪੱਕੀਆਂ ਰੀਤਾਂ

### ਕਦਮ 4.1: ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਪੱਤਰ ਪ੍ਰਬੰਧਨ

**ਮੌਜੂਦਾ ਚੁਣੌਤੀ**: ਕਈ AI ਐਪਸ API ਕੁੰਜੀਆਂ ਨੂੰ ਹਾਰਡਕੋਡ ਕਰਦੀਆਂ ਹਨ ਜਾਂ ਅਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਦੀ ਵਰਤੋਂ ਕਰਦੀਆਂ ਹਨ।

**AZD ਹੱਲ**: ਪ੍ਰਬੰਧਿਤ ਪਛਾਣ + ਕੁੰਜੀ ਸੁਰੰਗ ਇੰਟਿਗ੍ਰੇਸ਼ਨ।

1. **ਆਪਣੇ ਟੈਮਪਲੇਟ ਵਿੱਚ ਸੁਰੱਖਿਆ ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ ਕਰੋ:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਕੰਮ ਕਰ ਰਹੀ ਹੈ:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### قدم 4.2: ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ

1. **ਨਮੂਨੇ ਦੀ ਸਪੋਰਟ ਕੀਤੀ ਨੈੱਟਵਰਕ ਸੰਰਚਨਾ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੋਇੰਟਸ ਨੂੰ ਐਨੇਬਲ ਕਰੋ** (ਜੇ ਪਹਿਲਾਂ ਤੋਂ ਸੰਰਚਿਤ ਨਾ ਹੋਇਆ ਹੋਵੇ)।

ਆਪਣੇ ਟੈਮਪਲੇਟ ਲਈ, ਇਹ ਦਰਸਾਉਂਦਾ ਹਿੱਸਾ ਓਪਨਏਆਈ ਐਂਡਪੋਇੰਟ ਕਨੈਕਸ਼ਨ ਵੇਖਾਉਂਦਾ ਹੈ। ਇਹਨੂੰ ਵੀ ਇੱਕ ਵੀਐਨਈਟੀ, ਪ੍ਰਾਈਵੇਟ ਡੀਐਨਐਸ ਸੰਰਚਨਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੁਨੈਕਟਿਵਿਟੀ ਦੀ ਲੋੜ ਹੈ; ਇਸਨੂੰ ਬغير ਬਦਲੇ ਨਮੂਨੇ ਵਿੱਚ ਪੇਸਟ ਨਾ ਕਰੋ, ਜਿਸ ਵਿੱਚ ਪਹਿਲਾਂ ਹੀ ਪ੍ਰਾਈਵੇਟ-ਐਂਡਪੋਇੰਟ ਮਾਡਿਊਲ ਹਨ:
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

### قدم 4.3: ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਨਿਰਖਣਯੋਗਤਾ

1. **ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **ਨਮੂਨੇ ਦੇ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨੂੰ ਐਨੇਬਲ ਕਰੋ:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

ਨਮੂਨੇ ਦੀ ਇੰਸਟ੍ਰੂਮੈਂਟੇਸ਼ਨ ਟੈਲੀਮੈਟਰੀ ਜਾਰੀ ਕਰਦੀ ਹੈ; ਇੱਕ ਮਨਮਾਨਾ `OPENAI_MONITOR_ENABLED` ਸੈਟਿੰਗ ਏ.ਆਈ. ਮੈਟ੍ਰਿਕਸ ਸਹੀ ਤਰ੍ਹਾਂ ਨਹੀਂ ਚਲਾਉਂਦੀ। ਮਾਡਲ ਕਾਲਾਂ, ਲੈਟੈਂਸੀ, ਅਸਫਲਤਾਵਾਂ ਅਤੇ ਟੋਕਨ ਵਰਤੋਂ ਲਈ ਟਰੇਸਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ, ਅਤੇ ਸੰਵੇਦਨਸ਼ੀਲ ਪ੍ਰਾਂਪਟਾਂ ਜਾਂ ਜਵਾਬਾਂ ਨੂੰ ਦਰਜ ਕਰਨ ਤੋਂ ਬਚੋ।

### **ਲੈਬ ਅਭਿਆਸ 4.1: ਸੁਰੱਖਿਆ ਔਡਿਟ**

**ਕੰਮ**: ਆਪਣੇ ਡਿਪਲੋਯਮੈਂਟ ਦੀ ਸੁਰੱਖਿਆ ਲੇਖਾ-ਜੋਖਾ ਕਰੋ।

**ਚੈੱਕਲਿਸਟ:**
- [ ] ਕੋਡ ਜਾਂ ਸੰਰਚਨਾ ਵਿੱਚ ਕੋਈ ਹਾਰਡਕੋਡ ਕੀਤੇ ਗਏ ਸਿਕਰੇਟਸ ਨਾ ਹੋਣ
- [ ] ਸੇਵਾ-ਤੋਂ-ਸੇਵਾ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਵਰਤੀ ਗਈ ਹੈ
- [ ] ਕੀ ਵੌਲਟ ਸੰਵੇਦਨਸ਼ੀਲ ਸੰਰਚਨਾ ਸਟੋਰ ਕਰਦਾ ਹੈ
- [ ] ਨੈੱਟਵਰਕ ਪਹੁੰਚ ਸਹੀ ਤਰ੍ਹਾਂ ਸੀਮਿਤ ਹੈ
- [ ] ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਐਨੇਬਲ ਹਨ

## ਮਾਡਿਊਲ 5: ਆਪਣੀ ਐਆਈ ਐਪਲੀਕੇਸ਼ਨ ਦਾ ਰੂਪਾਂਤਰਣ ਕਰਨਾ

### قدم 5.1: ਮੂਲਿਆਕਨ ਵਰਕਸ਼ੀਟ

**ਆਪਣਾ ਐਪ ਰੂਪਾਂਤਰਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ**, ਇਹ ਸਵਾਲ ਜਵਾਬ ਕਰੋ:

1. **ਐਪਲੀਕੇਸ਼ਨ ਸਥਾਪਨਾ:**
   - ਤੁਹਾਡਾ ਐਪ ਕਿਹੜੀਆਂ ਏਆਈ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ?
   - ਇਹਨੂੰ ਕਿਹੜੇ ਕਮਪਿਊਟ ਸਰੋਤਾਂ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਇਸਨੂੰ ਡੇਟਾਬੇਸ ਦੀ ਲੋੜ ਹੈ?
   - ਸੇਵਾਵਾਂ ਵਿਚਕਾਰ ਕਿਹੜੀਆਂ ਨਿਰਭਰਤਾਵਾਂ ਹਨ?

2. **ਸੁਰੱਖਿਆ ਦੀਆਂ ਲੋੜਾਂ:**
   - ਤੁਹਾਡੇ ਐਪ ਹੇਠਾਂ ਕਿਸ ਤਰ੍ਹਾਂ ਦਾ ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਹੈ?
   - ਤੁਹਾਡੇ ਕੋਲ ਕਿਹੜੀਆਂ ਕਾਮਪਲਾਇੰਸ ਲੋੜਾਂ ਹਨ?
   - ਕੀ ਤੁਹਾਨੂੰ ਪ੍ਰਾਈਵੇਟ ਨੈੱਟਵਰਕਿੰਗ ਦੀ ਲੋੜ ਹੈ?

3. **ਵਧਾਈ ਦੀਆਂ ਲੋੜਾਂ:**
   - ਤੁਹਾਡਾ ਅੰਦਾਜ਼ਾ ਲੋਡ ਕੀ ਹੈ?
   - ਕੀ ਤੁਹਾਨੂੰ ਆਟੋ-ਸਕੇਲਿੰਗ ਦੀ ਲੋੜ ਹੈ?
   - ਕੀ ਕੋਈ ਖੇਤਰੀ ਲੋੜਾਂ ਹਨ?

### ਕਦਮ 5.2: ਆਪਣਾ AZD ਟੈਂਪਲੇਟ ਬਣਾਓ

**ਆਪਣੇ ਐਪ ਨੂੰ ਬਦਲਣ ਲਈ ਇਸ ਪੈਟਰਨ ਨੂੰ ਫਾਲੋ ਕਰੋ:**

**ਸਿਰਫ਼ ਸਕੈਫੋਲਡ:** ਇਸ ਭਾਗ ਵਿੱਚ API/ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਸੋਰਸ, ਹੋਸਟ ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ, ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ, ਪਹਿਚਾਣ/RBAC, ਜਾਂ ਇੱਕ ਪੂਰਾ `main.parameters.json` ਨਹੀਂ ਦਿੱਤਾ ਗਿਆ ਹੈ। ਰਿਸੋਰਸ-ਗਰੁੱਪ-ਸਕੋਪਡ ਬਾਈਸਪ ਮਾਡਿਊਲ ਦੀ ਸੰਰਚਨਾ ਦਿਖਾਉਂਦਾ ਹੈ; ਇੱਕ ਆਮ AZD ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸਕੋਪਡ ਇੰਟਰੀ ਪੌਇੰਟ ਨੂੰ ਇੱਕ ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣਾ ਅਤੇ ਉਸ ਸਕੋਪ 'ਤੇ ਇਹ ਕਾਲ ਕਰਨੀ ਚਾਹੀਦੀ ਹੈ। ਸਿਰਫ ਇਹ ਫ੍ਰੈਗਮੈਂਟ ਕਾਪੀ ਕਰਨ ਤੋਂ ਬਾਅਦ `azd up` ਤੋਂ ਪੂਰਾ ਐਪ ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਉਮੀਦ ਨਾ ਰੱਖੋ। ਚਲਾਉਣਯੋਗ ਬੇਸਲਾਈਨ ਲਈ, ਮੌਡੀਊਲ 1 ਤੋਂ RAG ਟੈਂਪਲੇਟ ਦਾ ਹੀ ਇਸਤੇਮਾਲ ਜਾਰੀ ਰੱਖੋ।

1. **ਮੂਲ ਢਾਂਚਾ ਬਣਾਓ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

3. **ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਟੈਂਪਲੇਟ ਬਣਾਓ:**

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

**infra/modules/openai.bicep** - OpenAI ਮਾਡਿਊਲ:
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **ਲੈਬ ਅਭਿਆਸ 5.1: ਟੈਂਪਲੇਟ ਬਣਾਉਣ ਦੀ ਚੁਣੌਤੀ**

**ਚੁਣੌਤੀ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ AI ਐਪ ਲਈ AZD ਟੈਂਪਲੇਟ ਬਣਾਓ।

**ਲੋੜਾਂ:**
- ਸਮੱਗਰੀ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Microsoft Foundry ਮਾਡਲ
- OCR ਲਈ ਦਸਤਾਵੇਜ਼ ਬੁੱਧੀਮੱਤਾ
- ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਲਈ ਸਟੋਰੇਜ ਅਕਾਊਂਟ
- ਪ੍ਰੋਸੈਸਿੰਗ ਲਾਜਿਕ ਲਈ ਫੰਕਸ਼ਨ ਐਪ
- ਯੂਜ਼ਰ ਇੰਟਰਫੇਸ ਲਈ ਵੈੱਬ ਐਪ

**ਬੋਨਸ ਪੁਆਇੰਟ:**
- ਸਹੀ ਤਰ੍ਹਾਂ ਦੀ ਤ੍ਰੁੱਟੀ ਸਾਂਭਣ ਦੀ ਵਿਵਸਥਾ ਕਰੋ
- ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ਾ ਸ਼ਾਮਲ ਕਰੋ
- ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਸੈੱਟ ਅੱਪ ਕਰੋ

## ਮੌਡੀਊਲ 6: ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ

### ਆਮ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 1: OpenAI ਸੇਵਾ ਕੋਟਾ ਲੰਘ ਗਿਆ
**ਲੱਛਣ:** ਡਿਪਲੋਇਮੈਂਟ ਕੋਟਾ ਗਲਤੀ ਨਾਲ ਅਸਫਲ ਹੁੰਦਾ ਹੈ
**ਹੁੱਲ:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### ਸਮੱਸਿਆ 2: ਖੇਤਰ ਵਿੱਚ ਮਾਡਲ ਉਪਲੱਬਧ ਨਹੀਂ
**ਲੱਛਣ:** AI ਜਵਾਬ ਅਸਫਲ ਜਾਂ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਗਲਤੀਆਂ
**ਹੁੱਲ:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### ਸਮੱਸਿਆ 3: ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:** AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਨ 'ਤੇ 403 ਫਰਬਿਡਨ ਗਲਤੀਆਂ
**ਹੁੱਲ:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ਕਾਰਗੁਜ਼ਾਰੀ ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ

#### ਸਮੱਸਿਆ 4: AI ਜਵਾਬ ਹੌਲੇ ਹਨ
**ਜਾਂਚ ਪੜਤਾਲ ਕਦਮ:**
1. ਕਾਰਗੁਜ਼ਾਰੀ ਮੈਟ੍ਰਿਕਸ ਲਈ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਚੈੱਕ ਕਰੋ
2. ਅਜਰ ਪੋਰਟਲ ਵਿੱਚ OpenAI ਸੇਵਾ ਮੈਟ੍ਰਿਕਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਅਤੇ ਲੇਟੈਂਸੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

**ਹੁੱਲ:**
- ਆਮ ਕਵੈਰੀਜ਼ ਲਈ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਆਪਣੇ ਵਰਤੋਂਕੇਸ ਲਈ ਢੁਕਵਾਂ OpenAI ਮਾਡਲ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਮਾਡਲ RPM/TPM ਸੀਮਾਵਾਂ ਦੀ ਜਾਂਚ ਤੋਂ ਬਾਅਦ ਹੀ ਐਪਲੀਕੇਸ਼ਨ ਰੇਪਲਿਕਾਸ ਦਾ ਸਕੇਲ ਕਰੋ; ਅਜ਼ੂਰ OpenAI ਡਿਪਲੋਇਮੈਂਟ ਜਨਰਿਕ ਡੇਟਾਬੇਸ-ਸਟਾਈਲ "ਰੀਡ ਰੇਪਲਿਕਾ" ਸੈਟਿੰਗ ਪ੍ਰਦਾਨ ਨਹੀਂ ਕਰਦੇ

### **ਲੈਬ ਅਭਿਆਸ 6.1: ਡਿਬੱਗਿੰਗ ਚੁਣੌਤੀ**

**ਪਰਿਸਥਿਤੀ**: ਤੁਹਾਡਾ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਹੋ ਗਿਆ, ਪਰ ਐਪਲੀਕੇਸ਼ਨ 500 ਗਲਤੀਆਂ ਦਿੰਦਾ ਹੈ।

**ਡਿਬੱਗਿੰਗ ਕੰਮ:**
1. ਐਪਲੀਕੇਸ਼ਨ ਲਾਗਜ਼ ਚੈੱਕ ਕਰੋ
2. ਸੇਵਾ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
3. ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਟੈਸਟਿੰਗ
4. ਸੰਰਚਨਾ ਦੀ ਸਮੀਖਿਆ

**ਵਰਤੋਂ ਲਈ ਸੰਦ:**
- ਤਾਇਨਾਤੀ ਦ੍ਰਿਸ਼ਟੀ ਲਈ `azd show`
- ਤਫਸੀਲਵਾਰ ਸਰਵਿਸ ਲਾਗਜ਼ ਲਈ Azure ਪੋਰਟਲ
- ਐਪਲੀਕੇਸ਼ਨ ਟੈਲੀਮੇਟਰੀ ਲਈ Application Insights

## ਮਾਡਿਊਲ 7: ਨਿਗਰਾਨੀ ਅਤੇ ਅਪਟਾਈਮਾਈਜ਼ੇਸ਼ਨ

### ਕਦਮ 7.1: ਵਿਸ਼ਤਾਰਿਤ ਨਿਗਰਾਨੀ ਸੈਟ ਅਪ ਕਰੋ

1. **ਕਸਟਮ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ:**

Azure ਪੋਰਟਲ ਤੇ ਜਾਓ ਅਤੇ ਡੈਸ਼ਬੋਰਡ ਬਣਾਓ ਜਿੱਥੇ:
- OpenAI ਦੀ ਰਿਕਵੇਸਟ ਗਿਣਤੀ ਅਤੇ ਲੇਟੈਂਸੀ
- ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਭੁੱਲ ਦਰ
- ਸਾਧਨ ਉਪਯੋਗ
- ਲਾਗਤ ਟ੍ਰੈਕਿੰਗ

2. **ਅਲਰਟ ਸੈਟ ਅਪ ਕਰੋ:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

ਪੱਕਾ ਕਰੋ ਕਿ ਕੰਪੋਨੈਂਟ ਰਿਕਵੇਸਟ ਟੈਲੀਮੇਟਰੀ ਜਾਰੀ ਕਰਦਾ ਹੈ ਅਤੇ ਜੇ ਸੁਚਨਾਵਾਂ ਦੀ ਲੋੜ ਹੈ ਤਾਂ ਇੱਕ ਐਕਸ਼ਨ ਗਰੁੱਪ ਸ਼ਾਮਲ ਕਰੋ। ਮੈਟ੍ਰਿਕ ਗਿਣਤੀ ਹੈ, ਨਾ ਕਿ ਫੇਲਿਊਰ ਪ੍ਰਤੀਸ਼ਤ; ਇੱਕ ਦਰ ਅਲਰਟ ਲਈ ਉਚਿਤ ਕੁਐਰੀ ਅਤੇ ਹਰ ਸਥਿਰਕ ਹਿਸਾਬਦਾਰ ਦੀ ਲੋੜ ਹੈ।

### ਕਦਮ 7.2: ਲਾਗਤ ਦੀ ਅਪਟਾਈਮਾਈਜ਼ੇਸ਼ਨ

1. **ਮੌਜੂਦਾ ਲਾਗਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

ਤਾਰੀਖ ਦੇ ਪਲੈਸਹੋਲਡਰਾਂ ਨੂੰ ਬਦਲੋ। ਖਪਤ API ਸਹਾਇਤਾ ਬਿਲਿੰਗ ਐਗਰੀਮੈਂਟ ਦੇ ਅਨੁਸਾਰ ਵੱਖ-ਵੱਖ ਹੋ ਸਕਦੀ ਹੈ; ਜੇ ਵਰਤੋਂ ਦੀ ਜਾਣਕਾਰੀ ਉਪਲਬਧ ਨਹੀਂ ਤਾਂ ਪੋਰਟਲ ਵਿੱਚ ਕਾਸਟ ਮੈਨੇਜਮੈਂਟ ਵਰਤੋਂ। ਲਾਗਤਾਂ ਵਿੱਚ ਦੇਰੀ ਹੁੰਦੀ ਹੈ, ਇਹ ਰੀਅਲ-ਟਾਈਮ ਟੈਸਟ ਨਹੀਂ ਹੈ।

2. **ਲਾਗਤ ਨਿਯੰਤਰਣ ਲਾਗੂ ਕਰੋ:**
- ਬਜਟ ਅਲਰਟ ਸੈਟ ਕਰੋ
- ਆਟੋਸਕੇਲਿੰਗ ਨੀਤੀਆਂ ਵਰਤੋਂ
- ਰਿਕਵੇਸਟ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- OpenAI ਲਈ ਟੋਕਨ ਵਰਤੋਂ ਨਿਗਰਾਨੀ ਕਰੋ

### **ਲੈਬ ਕਸਰਤ 7.1: ਪ੍ਰਦਰਸ਼ਨ ਅਪਟਾਈਮਾਈਜ਼ੇਸ਼ਨ**

**ਟਾਸਕ**: ਆਪਣੇ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਲਾਗਤ ਦੋਹਾਂ ਲਈ ਅਪਟਾਈਮਾਈਜ਼ ਕਰੋ।

**ਸੁਧਾਰ ਕਰਨ ਲਈ ਮੈਟ੍ਰਿਕਸ:**
- ਔਸਤ ਪ੍ਰਤੀਕਿਰਿਆ ਸਮਾਂ 20% ਘਟਾਓ
- ਮਹੀਨਾਵਾਰ ਲਾਗਤਾਂ 15% ਘਟਾਓ
- 99.9% ਉਪਲਬਧਤਾ SLO ਨਿਰਧਾਰਤ ਕਰੋ ਅਤੇ ਮਾਪਣ ਦੀ ਖਿੜਕੀ (ਛੋਟੀ ਲੈਬ ਮਹੀਨਾਵਾਰ ਅੱਪਟਾਈਮ ਨਹੀਂ ਦਿਖਾ ਸਕਦੀ)

**ਕੌਸ਼ਲ ਜੋ ਕੋਸ਼ਿਸ਼ ਕਰਨੇ ਹਨ:**
- ਪ੍ਰਤੀਕਿਰਿਆ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
- ਟੋਕਨ ਪ੍ਰਭਾਵੀਤਾ ਲਈ ਪ੍ਰોમਪਟ ਸਧਾਰੋ
- ਉਚਿਤ ਕੰਪਿਊਟ SKU ਵਰਤੋਂ
- ਠੀਕ ਆਟੋਸਕੇਲਿੰਗ ਸੈਟ ਅਪ ਕਰੋ

## ਅੰਤਮ ਚੈਲੇਂਜ: ਅੰਤ-ਤੱਕ ਅਮਲ

### ਚੈਲੇਂਜ ਦਾ ਪੇਸ਼ਪੱਤਰ

ਇਹ ਇੱਕ **ਇੱਛਾ-ਅਨੁਸਾਰ ਅਰਕੀਟੈਕਚਰ/ਡਿਜ਼ਾਈਨ ਚੈਲੇਂਜ** ਹੈ, ਨਾ ਕਿ ਸਪਲਾਈ ਕੀਤੀ ਗਈ ਚਲਾਉਣ ਯੋਗ ਕਸਰਤ ਜਾਂ ਉਤਪਾਦਨ ਪ੍ਰਮਾਣੀਕਰਨ। ਇੱਕ AI-ਸੰਚਾਲਿਤ ਗਾਹਕ ਸੇਵਾ ਚੈਟਬੋਟ ਦਾ ਪ੍ਰਸਤਾਵ ਕਰੋ ਅਤੇ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ ਕਿ ਕਿਹੜੀਆਂ ਜ਼ਰੂਰਤਾਂ ਨੂੰ ਹੋਰ ਅਮਲ ਅਤੇ ਸਬੂਤ ਦੀ ਲੋੜ ਹੈ:

**ਕਾਰਜਨਿਰਤ ਜ਼ਰੂਰਤਾਂ:**
- ਗਾਹਕਾਂ ਨਾਲ ਗੱਲਬਾਤ ਲਈ ਵੈੱਬ ਇੰਟਰਫੇਸ
- ਜਵਾਬ ਲਈ Microsoft Foundry ਮਾਡਲਜ਼ ਨਾਲ ਇੰਟੀਗਰੇਸ਼ਨ
-ਦਸਤਾਵੇਜ਼ ਖੋਜ ਸਮਰੱਥਾ Azure AI Search ਦੀ ਵਰਤੋਂ ਨਾਲ
- ਮੌਜੂਦਾ ਗਾਹਕ ਡੇਟਾਬੇਸ ਨਾਲ ਇੰਟੀਗਰੇਸ਼ਨ
- ਬਹੁ-ਭਾਸ਼ਾਈ ਸਹਾਇਤਾ

**ਗੈਰ-ਕਾਰਜਨਿਰਤ ਜ਼ਰੂਰਤਾਂ:**
- 1000 ਇਕੱਠੇ ਵਰਤੋਂਕਾਰਾਂ ਨੂੰ ਸੰਭਾਲਣਾ
- 99.9% ਉਪਟਾਈਮ SLA
- SOC 2 ਜੋੜ-ਤੋੜ
- ਮਹੀਨਾਵਾਰ $500 ਤੋਂ ਘੱਟ ਲਾਗਤ
- ਕਈ ਵਾਤਾਵਰਨਾਂ (डेਵ, ਸਟੇਜਿੰਗ, ਪ੍ਰੋਡ) ਨੂੰ ਤਾਇਨਾਤੀ

ਇਹ ਸਿਧਾਂਤਕ ਹਿੱਸੇਦਾਰ ਸੀਮਾਵਾਂ ਹਨ, ਇੱਕ ਸਾਥ-ਸਾਥ ਯਕੀਨੀ ਨਤੀਜੇ ਨਹੀਂ। ਲਾਗਤ ਦੀਆਂ ਅੰਦਾਜ਼ੇ ਲਗਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਰਿਕਵੇਸਟ ਦੀ ਦਰ, ਪ੍ਰੋਮਪਟ/ਆਉਟਪੁੱਟ ਦਾ ਆਕਾਰ ਅਤੇ ਸੈਸ਼ਨ ਸਮਾਂ ਨਿਰਧਾਰਤ ਕਰੋ; 1,000 ਇਕੱਠੇ ਵਰਤੋਂਕਾਰ ਕੰਮ ਦਾ ਬੋਝ ਨਹੀਂ ਤੈਅ ਕਰਦੇ ਜਾਂ $500 ਦਾ ਬਜਟ ਸੰਭਵ ਐਸਾ ਸਾਬਤ ਨਹੀਂ ਹੁੰਦਾ। SOC 2 ਇੱਕ ਸੰਗਠਨਾਤਮਕ ਆਡਿਟ ਹੈ, AZD ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਹੋਣ ਵਾਲਾ ਸਵਿੱਚ ਨਹੀਂ। ਟਰੇਡ-ਆਫ਼ ਨੂੰ ਪਛਾਣੋ ਅਤੇ ਅਸੰਭਵ ਸੀਮਾਵਾਂ ਨੂੰ ਸਬੂਤ ਨਾਲ ਰੱਦ ਕਰੋ।

### ਅਮਲੀ ਕਦਮ

1. **ਅਰਕੀਟੈਕਚਰ ਤਿਆਰ ਕਰੋ**
2. **AZD ਟੈਮਪਲੇਟ ਬਣਾਓ**
3. **ਸੁਰੱਖਿਆ ਉਪਾਇਆ ਲਾਗੂ ਕਰੋ**
4. **ਨਿਗਰਾਨੀ ਅਤੇ ਅਲਰਟ ਸੈਟ ਅਪ ਕਰੋ**
5. **ਤਾਇਨਾਤੀ ਪਾਈਪਲਾਈਨ ਬਣਾਓ**
6. **ਹੱਲ ਦਾ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ**

### ਮੁਲਾਂਕਣ ਮਾਪਦੰਡ

- ✅ **ਕਾਰਜਨਿਰਤਾ**: ਲਾਗੂ ਕੀਤੀਆਂ ਯੋਗਤਾਵਾਂ ਦਿਖਾਈਆਂ ਗਈਆਂ ਹਨ ਅਤੇ ਰਹਿ ਗਈਆਂ ਖਾਮੀਆਂ ਸਪਸ਼ਟ ਹਨ?
- ✅ **ਸੁਰੱਖਿਆ**: ਸਭ ਤੋਂ ਵਧੀਆ ਅਮਲ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ?
- ✅ **ਸਕੇਲਬਿਲਟੀ**: ਕੀ ਇਹ ਲੋਡ ਸੰਭਾਲ ਸਕਦਾ ਹੈ?
- ✅ **ਮੈਂਟੇਨੇਬਿਲਟੀ**: ਕੌਡ ਅਤੇ ਇੰਫਰਾਸਟਰੱਕਚਰ ਵਧੀਆ ਤਰੀਕੇ ਨਾਲ ਵਿਠਿਆ ਹੋਇਆ ਹੈ?
- ✅ **ਲਾਗਤ**: ਕੀ ਇਹ ਬਜਟ ਵਿੱਚ ਰਹਿੰਦਾ ਹੈ?

## ਵਾਧੂ ਸਰੋਤ

### Microsoft ਦਸਤਾਵੇਜ਼ਾਂ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### ਨਮੂਨਾ ਟੈਮਪਲੇਟ
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ਕਮਿਊਨਿਟੀ ਸਰੋਤ
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ਪੂਰਨਤਾ ਚੈੱਕਪੌਇੰਟ

ਮੁਬਾਰਕਾਂ! ਤੁਸੀਂ AI ਵਰਕਸ਼ਾਪ ਲੈਬ ਮੁਕੰਮਲ ਕਰ ਲਿਆ ਹੈ। ਹੁਣ ਤੁਹਾਨੂੰ ਸਮਰੱਥਾ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ ਕਿ:

- ✅ ਇਸ ਗੱਲ ਦੀ ਵਿਆਖਿਆ ਕਰੋ ਕਿ ਕਿਸ ਤਰ੍ਹਾਂ ਮੌਜੂਦਾ AI ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ AZD ਟੈਮਪਲੇਟ ਲਈ ਅਨੁਕੂਲਿਤ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
- ✅ ਇੱਕ AI ਸੰਦਰਭ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਤਾਇਨਾਤੀ ਅਤੇ ਟੈਸਟ ਕਰੋ
- ✅ AI ਵਰਕਲੋਡ ਲਈ ਸੁਰੱਖਿਆ ਦੇ ਵਧੀਆ ਅਮਲ ਲਾਗੂ ਕਰੋ
- ✅ AI ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਅਪਟਾਈਮਾਈਜ਼ੇਸ਼ਨ ਕਰੋ
- ✅ ਆਮ ਤਾਇਨਾਤੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰੋ

**ਸਾਫ਼-ਸੁਥਰਾ ਕਰੋ:** `azd env list` ਚਲਾਓ, ਇਸ ਲੈਬ ਵਿੱਚ ਬਣਾਏ ਹਰ ਇੱਕ ਖ਼ਰਾਬ ਕਰਨ ਵਾਲੇ ਵਾਤਾਵਰਣ ਨੂੰ ਚੁਣੋ (`myai-workshop`, ਅਤੇ ਜੇ ਤਾਇਨਾਤੀ ਕੀਤੀ ਗਈ ਹੋਵੇ ਤਾਂ `myai-production`/`myai-quota-test`), ਅਤੇ ਹਰੇਕ ਵਿੱਚ `azd down` ਚਲਾਓ। ਮਿਟਾਉਣ ਦੀ ਯੋਜਨਾ ਦਾ ਸਮੀਖਿਆ ਕਰੋ; ਸਿਰਫ਼ ਵਾਤਾਵਰਣ ਦੀ ਸਥਾਨਕ ਸੰਰਚਨਾ ਮਿਟਾਉਣ ਨਾਲ Azure ਸਰੋਤ ਮਿਟਦੇ ਨਹੀਂ।`--purge` ਤੋਂ ਬਚੋ ਜਦ ਤੱਕ ਕਿ ਤੁਸੀਂ ਬਦਲਣਯੋਗ ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਸਰੋਤ ਹਟਾਉਣ ਨੂੰ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਨਹੀਂ ਸਮਝਦੇ।

### ਅਗਲੇ ਕਦਮ
1. ਇਹ ਪੈਟਰਨ ਆਪਣੇ AI ਪ੍ਰਾਜੈਕਟਾਂ ਲਈ ਲਾਗੂ ਕਰੋ
2. ਟੈਮਪਲੇਟਸ ਕਮਿਊਨਿਟੀ ਨੂੰ ਵਾਪਸ ਦਿਓ
3. ਸਥਾਈ ਸਮਰਥਨ ਲਈ Microsoft Foundry Discord ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ
4. ਬਹੁ-ਖੇਤਰ ਤਾਇਨਾਤੀ ਵਰਗੀਆਂ ਉੱਚ ਕੋਟੀ ਦੀਆਂ ਵਿਸ਼ਿਆਂ ਨੂੰ ਖੋਜੋ

---

**ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: ਆਪਣੇ ਤਜਰਬੇ ਨੂੰ ਸਾਂਝਾ ਕਰਕੇ ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਸੁਧਾਰਨ ਵਿੱਚ ਸਾਡੀ ਮਦਦ ਕਰੋ [Microsoft Foundry Discord #Azure ਚੈਨਲ](https://discord.gg/microsoft-azure) ਵਿੱਚ।

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [AI ਮਾਡਲ ਤਾਇਨਾਤੀ](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [ਉਤਪਾਦਨ AI ਵਧੀਆ ਅਮਲ](../chapter-08-production/production-ai-practices.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

**ਮਦਦ ਚਾਹੀਦੀ ਹੈ?** AZD ਅਤੇ AI ਤਾਇਨਾਤੀ ਬਾਰੇ ਸਹਾਇਤਾ ਅਤੇ ਚਰਚਾ ਲਈ ਸਾਡੀ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->