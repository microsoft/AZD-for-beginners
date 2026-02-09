# ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ - ਹੱਥੋਂ-ਹੱਥ ਟਿਊਟੋਰਿਅਲ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ](installation.md)
- **➡️ ਅਗਲਾ**: [ਕੰਫਿਗਰੇਸ਼ਨ](configuration.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਫਰਸਟ ਡਿਵੈਲਪਮੈਂਟ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਪਰਿਚਯ

ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ ਪਹਿਲੇ Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਸੁਆਗਤ ਹੈ! ਇਹ ਵਿਸਤ੍ਰਿਤ ਹੱਥ-ਭਰਿਆ ਟਿਊਟੋਰਿਅਲ azd ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure 'ਤੇ ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ, ਡਿਪਲੋਇ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਦੀ ਪੂਰੀ ਰਾਹ-ਦਰਸ਼ਨ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ। ਤੁਸੀਂ ਇੱਕ ਅਸਲੀ todo ਐਪਲੀਕੇਸ਼ਨ ਨਾਲ ਕੰਮ ਕਰੋਗੇ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ, Node.js API ਬੈਕਐਂਡ, ਅਤੇ MongoDB ਡੇਟਾਬੇਸ ਸ਼ਾਮਲ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਟਿਊਟੋਰਿਅਲ ਨੂੰ ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ:
- ਟੈਮਪਲੇਟਸ ਦੀ ਵਰਤੋਂ ਕਰਕੇ azd ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂਆਤ ਵਰਕਫਲੋ ਵਿੱਚ ਮਾਹਿਰ ਹੋਵੋਗੇ
- Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਦੀ ਰਚਨਾ ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਇਨਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨਾਲ Azure 'ਤੇ ਪੂਰਾ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰਨ ਦੇ ਨਿਰਪਰਕ ਕਰ ਸਕੋਗੇ
- ਐਪਲੀਕੇਸ਼ਨ ਅੱਪਡੇਟਾਂ ਅਤੇ ਦੁਬਾਰਾ ਡਿਪਲੋਇ ਕਰਨ ਦੀਆਂ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਡਿਵੈਲਪਮੈਂਟ ਅਤੇ ਸਟੇਜਿੰਗ ਲਈ ਕਈ ਇਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧ ਕਰ ਸਕੋਗੇ
- ਰਿਸੋਰਸ ਕਲੀਨਅਪ ਅਤੇ ਖ਼ਰਚੇ ਪ੍ਰਬੰਧਕ ਪ੍ਰੈਕਟਿਸਜ਼ ਲਾਗੂ ਕਰ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਮੁਕੰਮਲ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਟੈਮਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਸਵਤੰਤਰ ਤੌਰ 'ਤੇ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਅਤੇ ਸੰਰਚਿਤ ਕਰਨਾ
- azd ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਨੈਵੀਗੇਟ ਅਤੇ ਸੋਧਣਾ
- ਇਕੱਲੇ ਕਮਾਂਡਾਂ ਨਾਲ Azure 'ਤੇ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰਨਾ
- ਆਮ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਡਿਪਲੋਇਮੈਂਟ ਪੜਾਵਾਂ ਲਈ ਕਈ Azure ਇਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧ ਕਰਨਾ
- ਐਪ ਅੱਪਡੇਟ ਲਈ ਲਗਾਤਾਰ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਆਂ ਲਾਗੂ ਕਰਨਾ

## ਸ਼ੁਰੂ ਕਰੋ

### ਲੋੜੀਂਦੀਆਂ ਸ਼ਰਤਾਂ ਦੀ ਜਾਂਚ ਸੂਚੀ
- ✅ Azure Developer CLI ਇੰਸਟਾਲ ਹੋਇਆ ([ਇੰਸਟਾਲੇਸ਼ਨ ਮਾਰਗਦਰਸ਼ਕ](installation.md))
- ✅ Azure CLI ਇੰਸਟਾਲ ਅਤੇ ਪ੍ਰਮਾਣਿਤ
- ✅ ਤੁਹਾਡੇ ਸਿਸਟਮ 'ਤੇ Git ਇੰਸਟਾਲ
- ✅ Node.js 16+ (ਇਸ ਟਿਊਟੋਰਿਅਲ ਲਈ)
- ✅ Visual Studio Code (ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ)

### ਆਪਣੀ ਸੈਟਅਪ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
# azd ਦੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version
```
### Azure ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ

```bash
az account show
```

### Node.js ਵਰਜਨ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
node --version
```

## ਕਦਮ 1: ਇੱਕ ਟੈਮਪਲੇਟ ਚੁਣੋ ਅਤੇ ਸ਼ੁਰੂ ਕਰੋ

ਆਓ ਇੱਕ ਲੋਕਪ੍ਰਿਯ todo ਐਪਲੀਕੇਸ਼ਨ ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੀਏ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ ਅਤੇ Node.js API ਬੈਕਐਂਡ ਸ਼ਾਮਲ ਹਨ।

```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਬ੍ਰਾਉਜ਼ ਕਰੋ
azd template list

# ਟੂ-ਡੂ ਐਪ ਟੈਮਪਲੇਟ ਨੂੰ ਆਰੰਭ ਕਰੋ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ਦਿੱਤੇ ਗਏ ਨਿਰਦੇਸ਼ਾਂ ਦੀ ਪਾਲਨਾ ਕਰੋ:
# - ਇੱਕ ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਦਰਜ ਕਰੋ: "dev"
# - ਇੱਕ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਚੁਣੋ (ਜੇਕਰ ਤੁਹਾਡੇ ਕੋਲ ਕਈ ਹਨ)
# - ਇੱਕ ਰੀਜਨ ਚੁਣੋ: "East US 2" (ਜਾਂ ਆਪਣੀ ਪਸੰਦੀਦਾ ਰੀਜਨ)
```

### ਹੁਣੇ ਕੀ ਹੋਇਆ?
- ਟੈਮਪਲੇਟ ਕੋਡ ਤੁਹਾਡੇ ਲੋਕਲ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ
- ਸੇਵਾ ਵਿਆਖਿਆਵਾਂ ਨਾਲ `azure.yaml` ਫਾਇਲ ਬਣਾਈ ਗਈ
- `infra/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇਨਫਰਾਸਟ੍ਰਕਚਰ ਕੋਡ ਸੈਟ ਕੀਤਾ ਗਿਆ
- ਇਕ ਇਨਵਾਇਰਨਮੈਂਟ ਕੰਫਿਗਰੇਸ਼ਨ ਬਣਾਇਆ ਗਿਆ

## ਕਦਮ 2: ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ ਦੀ ਖੋਜ ਕਰੋ

ਆਓ ਦੇਖੀਏ azd ਨੇ ਸਾਡੇ ਲਈ ਕੀ ਬਣਾਇਆ:

```bash
# ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ ਵੇਖੋ
tree /f   # ਵਿੰਡੋਜ਼
# ਜਾਂ
find . -type f | head -20   # ਮੈਕਓਐਸ/ਲਿਨਕਸ
```

ਤੁਹਾਨੂੰ ਇਹ ਵੇਖਣਾ ਚਾਹੀਦਾ ਹੈ:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ਸਮਝਣ ਲਈ ਮੁੱਖ ਫਾਈਲਾਂ

**azure.yaml** - ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਕੇਂਦਰ:
```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਵੇਖੋ
cat azure.yaml
```

**infra/main.bicep** - ਇਨਫਰਾਸਟ੍ਰਕਚਰ ਪਰਿਭਾਸ਼ਾ:
```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦਾ ਕੋਡ ਵੇਖੋ
head -30 infra/main.bicep
```

## ਕਦਮ 3: ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਓ (ਆਪਸ਼ਨਲ)

ਡਿਪਲੋਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਸੀਂ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਅਨੁਕੂਲ ਕਰ ਸਕਦੇ ਹੋ:

### ਫਰੰਟਐਂਡ ਸੋਧੋ
```bash
# React ਐਪ ਕੰਪੋਨੈਂਟ ਖੋਲ੍ਹੋ
code src/web/src/App.tsx
```

ਇੱਕ ਸਧਾਰਨ ਤਬਦੀਲੀ ਕਰੋ:
```typescript
// ਸਿਰਲੇਖ ਲੱਭੋ ਅਤੇ ਇਸਨੂੰ ਬਦਲੋ
<h1>My Awesome Todo App</h1>
```

### ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਾਂ ਸੰਰਚਿਤ ਕਰੋ
```bash
# ਕਸਟਮ ਮਾਹੌਲੀ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ਸਾਰੇ ਮਾਹੌਲੀ ਵੈਰੀਏਬਲ ਵੇਖੋ
azd env get-values
```

## ਕਦਮ 4: Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ

ਹੁਣ ਮਜ਼ੇਦਾਰ ਹਿੱਸਾ - ਸਭ ਕੁਝ Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ!

```bash
# ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd up

# ਇਹ ਕਮਾਂਡ ਇਹ ਕਰੇਗੀ:
# 1. Azure ਸੰਸਾਧਨ ਤਿਆਰ ਕਰੇਗੀ (App Service, Cosmos DB, ਆਦਿ)
# 2. ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਬਣਾਏਗੀ
# 3. ਤਿਆਰ ਕੀਤੇ ਗਏ ਸੰਸਾਧਨਾਂ 'ਤੇ ਤੈਨਾਤ ਕਰੇਗੀ
# 4. ਐਪਲੀਕੇਸ਼ਨ ਦਾ URL ਦਿਖਾਏगी
```

### ਡਿਪਲੋਇਮੈਂਟ ਦੌਰਾਨ ਕੀ ਹੋ ਰਿਹਾ ਹੈ?

`azd up` ਕਮਾਂਡ ਇਹ ਕਦਮ ਕਰਦੀ ਹੈ:
1. **Provision** (`azd provision`) - Azure ਸਰੋਤ ਬਣਾਉਂਦਾ ਹੈ
2. **Package** - ਤੁਹਾਡੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਬਿਲਡ ਕਰਦਾ ਹੈ
3. **Deploy** (`azd deploy`) - ਕੋਡ ਨੂੰ Azure ਸਰੋਤਾਂ 'ਤੇ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ

### ਉਮੀਦ ਕੀਤੀ ਗਈ ਆਉਟਪੁੱਟ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ਕਦਮ 5: ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਟੈਸਟਿੰਗ ਕਰੋ

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਤੱਕ ਪਹੁੰਚ
ਡਿਪਲੋਇਮੈਂਟ ਆਉਟਪੁੱਟ 'ਚ ਦਿੱਤੇ URL 'ਤੇ ਕਲਿਕ ਕਰੋ, ਜਾਂ ਇਸਨੂੰ ਕਿਸੇ ਵੀ ਵੇਲੇ ਪ੍ਰਾਪਤ ਕਰੋ:
```bash
# ਐਪਲਿਕੇਸ਼ਨ ਦੇ ਐਂਡਪੋਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show

# ਆਪਣੇ ਬ੍ਰਾਉਜ਼ਰ ਵਿੱਚ ਐਪਲਿਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ਐਪ ਦੀ ਜਾਂਚ ਕਰੋ
1. **ਇੱਕ todo ਆਈਟਮ ਜੋੜੋ** - "ਟੂਡੋ ਜੋੜੋ" 'ਤੇ ਕਲਿਕ ਕਰੋ ਅਤੇ ਇੱਕ ਟਾਸਕ ਦਰਜ ਕਰੋ
2. **ਪੂਰਾ ਚਿੰਨ੍ਹੋ** - ਮੁਕੰਮਲ ਆਈਟਮਾਂ ਨੂੰ ਚੈੱਕ ਕਰੋ
3. **ਆਈਟਮ ਮਿਟਾਓ** - ਉਹ todos ਹਟਾਓ ਜਿੰਨ੍ਹਾਂ ਦੀ ਤੁਹਾਨੂੰ ਹੋਰ ਲੋੜ ਨਹੀਂ

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
```bash
# ਆਪਣੇ ਸਰੋਤਾਂ ਲਈ Azure ਪੋਰਟਲ ਖੋਲ੍ਹੋ
azd monitor

# ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਲਾਈਵ ਮੈਟਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

## ਕਦਮ 6: ਤਬਦੀਲੀਆਂ ਕਰੋ ਅਤੇ ਦੁਬਾਰਾ ਡਿਪਲੋਇ ਕਰੋ

ਆਓ ਇੱਕ ਤਬਦੀਲੀ ਕਰੀਏ ਅਤੇ ਵੇਖੀਏ ਕਿ ਅੱਪਡੇਟ ਕਰਨਾ ਕਿੰਨਾ ਆਸਾਨ ਹੈ:

### API ਸੋਧੋ
```bash
# API ਕੋਡ ਸੋਧੋ
code src/api/src/routes/lists.js
```

ਇੱਕ ਕਸਟਮ ਰਿਸਪਾਂਸ ਹੈਡਰ ਜੋੜੋ:
```javascript
// ਰੂਟ ਹੈਂਡਲਰ ਲੱਭੋ ਅਤੇ ਸ਼ਾਮਲ ਕਰੋ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ਸਿਰਫ ਕੋਡ ਤਬਦੀਲੀਆਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ
```bash
# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਤੈਅਨਾਤ ਕਰੋ (ਢਾਂਚਾ ਛੱਡੋ)
azd deploy

# ਇਹ 'azd up' ਨਾਲੋਂ ਕਾਫੀ ਤੇਜ਼ ਹੈ ਕਿਉਂਕਿ ਢਾਂਚਾ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ
```

## ਕਦਮ 7: ਕਈ ਇਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧ ਕਰੋ

ਉਤਪਾਦਨ ਤੋਂ ਪਹਿਲਾਂ ਤਬਦੀਲੀਆਂ ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਇੱਕ ਸਟੇਜਿੰਗ ਇਨਵਾਇਰਨਮੈਂਟ ਬਣਾਓ:
```bash
# ਇੱਕ ਨਵਾਂ ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new staging

# ਸਟੇਜਿੰਗ ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਡੈਵ ਵਾਤਾਵਰਣ ਤੇ ਮੁੜ ਸਵਿੱਚ ਕਰੋ
azd env select dev

# ਸਾਰੇ ਵਾਤਾਵਰਣਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd env list
```

### ਇਨਵਾਇਰਨਮੈਂਟ ਤੁਲਨਾ
```bash
# ਡੈਵ ਇਨਵਾਇਰਨਮੈਂਟ ਵੇਖੋ
azd env select dev
azd show

# ਸਟੇਜਿੰਗ ਇਨਵਾਇਰਨਮੈਂਟ ਵੇਖੋ
azd env select staging
azd show
```

## ਕਦਮ 8: ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ

ਜਦੋਂ ਤੁਸੀਂ ਪ੍ਰਯੋਗ ਕਰਨਾ ਮੁਕੰਮਲ ਕਰ ਲਓ, ਲੱਗਾਤਾਰ ਖਰਚਾਂ ਤੋਂ ਬਚਣ ਲਈ ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ:
```bash
# ਮੌਜੂਦਾ ਵਾਤਾਵਰਣ ਲਈ ਸਾਰੇ Azure ਸਰੋਤ ਹਟਾਓ
azd down

# ਪੁਸ਼ਟੀ ਦੇ ਬਿਨਾਂ ਜਬਰਦਸਤੀ ਹਟਾਓ ਅਤੇ ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਹੋਏ ਸਰੋਤਾਂ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਾਫ਼ ਕਰੋ
azd down --force --purge

# ਨਿਰਧਾਰਤ ਵਾਤਾਵਰਣ ਹਟਾਓ
azd env select staging
azd down --force --purge
```

## ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ

ਮੁਬਾਰਕਾਂ! ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ:
- ✅ ਇੱਕ ਟੈਮਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕੀਤਾ
- ✅ ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਅਤੇ ਮੁੱਖ ਫਾਇਲਾਂ ਦੀ ਖੋਜ ਕੀਤੀ
- ✅ ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੋਇ ਕੀਤਾ
- ✅ ਕੋਡ ਤਬਦੀਲੀਆਂ ਕੀਤੀਆਂ ਅਤੇ ਮੁੜ ਡਿਪਲੋਇ ਕੀਤਾ
- ✅ ਕਈ ਇਨਵਾਇਰਨਮੈਂਟਸ ਨੂੰ ਪ੍ਰਬੰਧ ਕੀਤਾ
- ✅ ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕੀਤਾ

## 🎯 ਸਕਿਲ ਪ੍ਰਮਾਣਿਕਤਾ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਇੱਕ ਵੱਖਰਾ ਟੈਮਪਲੇਟ ਡਿਪਲੋਇ ਕਰੋ (15 ਮਿੰਟ)
**ਲਕਸ਼**: azd init ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਵਿੱਚ ਮਾਹਰਤਾ ਦਿਖਾਉਣਾ

```bash
# Python + MongoDB ਸਟੈਕ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ਡਿਪਲਾਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਬਿਨਾਂ ਤਰੁੱਟੀਆਂ ਦੇ ਡਿਪਲੋਇ ਹੁੰਦੀ ਹੈ
- [ ] ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ URL ਤੱਕ ਪਹੁੰਚ ਹੋ ਸਕਦੀ ਹੈ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਠੀਕ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਦੀ ਹੈ (ਟੂਡੋ ਜੋੜੋ/ਹਟਾਓ)
- [ ] ਸਾਰੇ ਸਰੋਤ ਸਫਲਤਾਪੂਰਵਕ ਕਲੀਨਅਪ ਕੀਤੇ ਗਏ

### ਅਭਿਆਸ 2: ਸੰਰਚਨਾ ਨੂੰ ਅਨੁਕੂਲ ਕਰੋ (20 ਮਿੰਟ)
**ਲਕਸ਼**: ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੰਰਚਨਾ ਦਾ ਅਭਿਆਸ

```bash
cd my-first-azd-app

# ਕਸਟਮ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new custom-config

# ਕਸਟਮ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values | grep APP_TITLE

# ਕਸਟਮ ਕੰਫਿਗ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
azd up
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਕਸਟਮ ਇਨਵਾਇਰਨਮੈਂਟ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ
- [ ] ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈਟ ਅਤੇ ਪ੍ਰਾਪਤ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਕਸਟਮ ਸੰਰਚਨਾ ਨਾਲ ਡਿਪਲੋਇ ਹੁੰਦੀ ਹੈ
- [ ] ਡਿਪਲੋਇ ਕੀਤੀ ਐਪ ਵਿੱਚ ਕਸਟਮ ਸੈਟਿੰਗਜ਼ ਦੀ ਪੁਸ਼ਟੀ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ

### ਅਭਿਆਸ 3: ਬਹੁ-ਇਨਵਾਇਰਨਮੈਂਟ ਵਰਕਫਲੋ (25 ਮਿੰਟ)
**ਲਕਸ਼**: ਇਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀਆਂ 'ਤੇ ਮਾਹਿਰ ਹੋਣਾ

```bash
# ਡੈਵ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ਡੈਵ URL ਨੋਟ ਕਰੋ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ਸਟੇਜਿੰਗ URL ਨੋਟ ਕਰੋ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ਵਾਤਾਵਰਣਾਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
azd env list

# ਦੋਹਾਂ ਵਾਤਾਵਰਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# ਦੋਹਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਵਾਲੇ ਦੋ ਇਨਵਾਇਰਨਮੈਂਟ ਬਣਾਏ ਗਏ
- [ ] ਦੋਹਾਂ ਇਨਵਾਇਰਨਮੈਂਟ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੋਇ ਕੀਤੇ ਗਏ
- [ ] `azd env select` ਦੀ ਵਰਤੋਂ ਕਰ ਕੇ ਇਨਵਾਇਰਨਮੈਂਟ ਕਿਸੇ ਵੀ ਸਮੇਂ ਬਦਲੀ ਜਾ ਸਕਦੀ ਹੈ
- [ ] ਇਨਵਾਇਰਨਮੈਂਟਾਂ ਵਿੱਚ ਵੈਰੀਏਬਲ ਵੱਖ-ਵੱਖ ਹਨ
- [ ] ਦੋਹਾਂ ਇਨਵਾਇਰਨਮੈਂਟ ਸਫਲਤਾਪੂਰਵਕ ਕਲੀਨਅਪ ਕੀਤੇ ਗਏ

## 📊 ਤੁਹਾਡੀ ਪ੍ਰਗਤੀ

**ਲਗਾਇਆ ਸਮਾਂ**: ~60-90 ਮਿੰਟ  
**ਹਾਸਿਲ ਕੀਤੀਆਂ ਹੁਨਰਾਂ**:
- ✅ ਟੈਮਪਲੇਟ-ਆਧਾਰਿਤ ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ੇਸ਼ਨ
- ✅ Azure ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ
- ✅ ਇਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ
- ✅ ਸੰਰਚਨਾ ਪ੍ਰਬੰਧਨ
- ✅ ਸਰੋਤ ਕਲੀਨਅਪ ਅਤੇ ਖ਼ਰਚ ਪ੍ਰਬੰਧਨ

**ਅਗਲਾ ਪੱਧਰ**: ਤੁਸੀਂ [ਕੰਫਿਗਰੇਸ਼ਨ ਗਾਈਡ](configuration.md) ਲਈ ਤਿਆਰ ਹੋ ਕਿ ਅਧੁਨਿਕ ਸੰਰਚਨਾ ਪੈਟਰਨ ਸਿੱਖੋ!

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਮਾਧਾਨ

### ਪ੍ਰਮਾਣਿਕਤਾ ਤਰੁੱਟੀਆਂ
```bash
# Azure ਨਾਲ ਮੁੜ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ
az login

# ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਦੀ ਪਹੁੰਚ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```

### ਡਿਪਲੋਇਮੈਂਟ ਫੇਲ
```bash
# ਡੀਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd up --debug

# Azure ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਾਂ ਵੇਖੋ
azd monitor --logs

# ਕੰਟੇਨਰ ਐਪਸ ਲਈ, Azure CLI ਵਰਤੋਂ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ਸਰੋਤ ਨਾਮ ਟਕਰਾਅ
```bash
# ਇੱਕ ਵਿਲੱਖਣ ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਵਰਤੋਂ
azd env new dev-$(whoami)-$(date +%s)
```

### ਪੋਰਟ/ਨੈੱਟਵਰਕ ਸਮੱਸਿਆਵਾਂ
```bash
# ਪੋਰਟਾਂ ਉਪਲਬਧ ਹਨ ਜਾਂ ਨਹੀਂ ਜਾਂਚੋ
netstat -an | grep :3000
netstat -an | grep :3100
```

## ਅਗਲੇ ਕਦਮ

ਹੁਣ ਜਦੋਂ ਤੁਸੀਂ ਆਪਣਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ ਮੁਕੰਮਲ ਕਰ ਲਿਆ ਹੈ, ਇਨ੍ਹਾਂ ਅਗੇਤਲੇ ਵਿਸਿਆਂ ਦੀ ਖੋਜ ਕਰੋ:

### 1. ਇਨਫਰਾਸਟ੍ਰਕਚਰ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਓ
- [ਇਨਫਰਾਸਟ੍ਰਕਚਰ ਐਜ਼ ਕੋਡ](../chapter-04-infrastructure/provisioning.md)
- [ਡੇਟਾਬੇਸ, ਸਟੋਰੇਜ ਅਤੇ ਹੋਰ ਸੇਵਾਵਾਂ ਜੋੜੋ](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ਸੈਟਅੱਪ ਕਰੋ
- [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) - ਪੂਰੇ CI/CD ਵਰਕਫਲੋ
- [Azure Developer CLI ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ਪਾਈਪਲਾਈਨ ਸੰਰਚਨਾ

### 3. ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਸਰਵੋਤਮ ਅਭਿਆਸ
- [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) - ਸੁਰੱਖਿਆ, ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਨਿਗਰਾਨੀ

### 4. ਹੋਰ ਟੈਮਪਲੇਟ ਭਾਲੋ
```bash
# ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ ਟੈਮਪਲੇਟਾਂ ਵੇਖੋ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ਵੱਖ-ਵੱਖ ਤਕਨੀਕੀ ਸਟੈਕਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ਵਾਧੂ ਸਰੋਤ

### ਸਿੱਖਣ ਸਮੱਗਰੀ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### ਕਮਿਊਨਿਟੀ ਅਤੇ ਸਹਾਇਤਾ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ਟੈਮਪਲੇਟ ਅਤੇ ਉਦਾਹਰਣਾਂ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ਤੁਹਾਡੇ ਪਹਿਲੇ azd ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਮੁਕੰਮਲ ਕਰਨ 'ਤੇ ਮੁਬਾਰਕਾਂ!** ਤੁਸੀਂ ਹੁਣ ਨਿਰਭਰਤਾ ਨਾਲ Azure 'ਤੇ ਸ਼ਾਨਦਾਰ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੋਇ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ।

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ](installation.md)
- **➡️ ਅਗਲਾ**: [ਕੰਫਿਗਰੇਸ਼ਨ](configuration.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਫਰਸਟ ਡਿਵੈਲਪਮੈਂਟ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **ਅਗਲਾ ਪਾਠ**: [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਜਵਾਬਦੇਹੀ ਤੋਂ ਇਨਕਾਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਨੂੰ ਯਕੀਨੀ ਬਣਾਉਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->