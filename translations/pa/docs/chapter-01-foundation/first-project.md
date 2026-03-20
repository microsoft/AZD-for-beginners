# ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ - ਹੱਥੋਂ-ਹੱਥ ਟਿਊਟੋਰਿਯਲ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [Installation & Setup](installation.md)
- **➡️ ਅਗਲਾ**: [Configuration](configuration.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਪਰਿਚਯ

ਤੁਹਾਡੇ ਪਹਿਲੇ Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਸਵਾਗਤ ਹੈ! ਇਹ ਵਿਸਤ੍ਰਿਤ ਹੱਥ-ਅਨੁਭਵ ਟਿਊਟੋਰਿਯਲ azd ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure 'ਤੇ ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ, ਤैनਾਤ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਦੀ ਪੂਰੀ ਪ੍ਰਕਿਰਿਆ ਦਿਖਾਉਂਦਾ ਹੈ। ਤੁਸੀਂ ਇੱਕ ਅਸਲ todo ਐਪਲੀਕੇਸ਼ਨ ਨਾਲ ਕੰਮ ਕਰੋਗੇ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ, Node.js API ਬੈਕਐਂਡ, ਅਤੇ MongoDB ਡੇਟਾਬੇਸ ਸ਼ਾਮਲ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲਕੜ

ਇਸ ਟਿਊਟੋਰਿਯਲ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- ਟੈਮਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ azd ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ੇਸ਼ਨ ਵਰਕਫਲੋ 'ਤੇ ਕਬਜ਼ਾ ਹਾਸਲ ਕਰੋਗੇ
- Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਇੰਫਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੇਤ Azure 'ਤੇ ਪੂਰੇ ਐਪ ਦੀ ਡਿਪਲਾਇਮੈਂਟ ਚਲਾਉਣਗੇ
- ਐਪ ਅੱਪਡੇਟ ਅਤੇ ਰੀਡਿਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨਗੇ
- ਵਿਕਾਸ ਅਤੇ ਸਟੇਜਿੰਗ ਲਈ ਕਈ ਪਰਿਆਵਰਣਾਂ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨਗੇ
- ਸਰੋਤ ਸਾਫ਼-ਸਫ਼ਾਈ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉਪਰਾਂਤ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਟੈਮਪਲੇਟਾਂ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਅਤੇ ਸਕੰਮ ਕਰਨਾ
- azd ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਵਿਚ ਨੈਵੀਗੇਟ ਅਤੇ ਸੋਧ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਕਰਨਾ
- ਇੱਕ ਕਮਾਂਡ ਨਾਲ Azure 'ਤੇ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨਾ
- ਆਮ ਡਿਪਲਾਇਮੈਂਟ ਮੁੱਦਿਆਂ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਡਿਪਲੋਇਮੈਂਟ ਚਰਨਾਂ ਲਈ ਕਈ Azure ਪਰਿਆਵਰਣਾਂ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨਾ
- ਐਪ ਅੱਪਡੇਟਸ ਲਈ ਲਗਾਤਾਰ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ ਲਾਗੂ ਕਰਨਾ

## ਸ਼ੁਰੂਆਤ

### ਲੋੜੀਂਦੇ ਚੀਜ਼ਾਂ ਦੀ ਚੈੱਕਲਿਸਟ
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ Azure CLI installed and authenticated
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

### ਆਪਣੀ ਸੈਟਅਪ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
# azd ਦੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version
```
### ਐਜ਼ਰ ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ

```bash
az account show
```

### Node.js ਵਰਜਨ ਚੈੱਕ ਕਰੋ
```bash
node --version
```

## ਕਦਮ 1: ਇੱਕ ਟੈਮਪਲੇਟ ਚੁਣੋ ਅਤੇ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰੋ

ਆਓ ਇੱਕ ਮਸ਼ਹੂਰ todo ਐਪਲੀਕੇਸ਼ਨ ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੀਏ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ ਅਤੇ Node.js API ਬੈਕਐਂਡ ਸ਼ਾਮਲ ਹਨ।

```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਵੇਖੋ
azd template list

# ਟੂ-ਡੋ ਐਪ ਟੈਮਪਲੇਟ ਆਰੰਭ ਕਰੋ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ਦਿੱਤੇ ਗਏ ਪ੍ਰੰਪਟਾਂ ਦੀ ਪਾਲਨਾ ਕਰੋ:
# - ਇੱਕ ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਦਰਜ ਕਰੋ: "dev"
# - ਇੱਕ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਚੁਣੋ (ਜੇ ਤੁਹਾਡੇ ਕੋਲ ਕਈ ਹਨ)
# - ਇੱਕ ਖੇਤਰ ਚੁਣੋ: "East US 2" (ਜਾਂ ਆਪਣੀ ਪਸੰਦੀਦਾ ਖੇਤਰ)
```

### ਹੁਣ ਕੀ ਹੋਇਆ?
- ਟੈਮਪਲੇਟ ਕੋਡ ਤੁਹਾਡੇ ਲੋਕਲ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ
- ਸਰਵਿਸ ਪਰਿਭਾਸ਼ਾਵਾਂ ਸਮੇਤ ਇੱਕ `azure.yaml` ਫਾਇਲ ਬਣਾਈ گئی
- `infra/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇੰਫਰਾਸਟਰੱਕਚਰ ਕੋਡ ਸੈਟਅਪ ਕੀਤਾ ਗਿਆ
- ਇੱਕ ਪਰਿਆਵਰਣ ਕੰਫਿਗਰੇਸ਼ਨ ਬਣਾਈ ਗਈ

## ਕਦਮ 2: ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਦੀ ਜਾਂਚ ਕਰੋ

ਆਓ ਵੇਖੀਏ ਕਿ azd ਨੇ ਸਾਡੇ ਲਈ ਕੀ ਬਣਾਇਆ:

```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਵੇਖੋ
tree /f   # ਵਿੰਡੋਜ਼
# ਜਾਂ
find . -type f | head -20   # ਮੈਕਓਐਸ/ਲਿਨਕਸ
```

ਤੁਹਾਨੂੰ ਇਹ ਦਿਖਾਈ ਦੇਣਾ ਚਾਹੀਦਾ ਹੈ:
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

### ਸਮਝਣ ਲਈ ਮੁੱਖ ਫਾਇਲਾਂ

**azure.yaml** - ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਰੁੱਤਬਾ:
```bash
# ਪ੍ਰੋਜੈਕਟ ਕੰਫਿਗਰੇਸ਼ਨ ਵੇਖੋ
cat azure.yaml
```

**infra/main.bicep** - ਇੰਫਰਾਸਟਰੱਕਚਰ ਪਰਿਭਾਸ਼ਾ:
```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦਾ ਕੋਡ ਵੇਖੋ
head -30 infra/main.bicep
```

## ਕਦਮ 3: ਆਪਣਾ ਪ੍ਰੋਜੈਕਟ ਕਸਟਮਾਈਜ਼ ਕਰੋ (ਚੌਣਵਾਂ)

ਡਿਪਲਾਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਸੀਂ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ:

### ਫਰੰਟਐਂਡ ਬਦਲੋ
```bash
# ਰੀਐਕਟ ਐਪ ਕੰਪੋਨੈਂਟ ਖੋਲ੍ਹੋ
code src/web/src/App.tsx
```

ਇੱਕ ਸਧਾਰਣ ਬਦਲਾਅ ਕਰੋ:
```typescript
// ਸਿਰਲੇਖ ਲੱਭੋ ਅਤੇ ਬਦਲੋ
<h1>My Awesome Todo App</h1>
```

### ਪਰਿਆਵਰਣ ਵੈਰੀਏਬਲ ਸੰਰਚਨਾ ਕਰੋ
```bash
# ਕਸਟਮ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈਟ ਕਰੋ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ਸਾਰੇ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਵੇਖੋ
azd env get-values
```

## ਕਦਮ 4: Azure 'ਤੇ ਡਿਪਲਾਇ ਕਰੋ

ਹੁਣ ਮਜ਼ੇਦਾਰ ਹਿੱਸਾ - ਸਭ ਕੁਝ Azure 'ਤੇ ਡਿਪਲਾਇ ਕਰੋ!

```bash
# ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd up

# ਇਹ ਕਮਾਂਡ ਇਹ ਕਰੇਗੀ:
# 1. Azure ਸਰੋਤ (App Service, Cosmos DB, ਆਦਿ) ਪ੍ਰੋਵਾਈਜ਼ਨ ਕਰੇਗੀ
# 2. ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਬਿਲਡ ਕਰੇਗੀ
# 3. ਪ੍ਰੋਵਾਈਜ਼ਨ ਕੀਤੇ ਗਏ ਸਰੋਤਾਂ 'ਤੇ ਤੈਨਾਤ ਕਰੇਗੀ
# 4. ਐਪਲੀਕੇਸ਼ਨ ਦਾ URL ਦਿਖਾਏਗੀ
```

### ਡਿਪਲਾਇਮੈਂਟ ਦੌਰਾਨ ਕੀ ਹੋ ਰਿਹਾ ਹੈ?

`azd up` ਕਮਾਂਡ ਇਹ ਕਦਮ ਕਰਦੀ ਹੈ:
1. **Provision** (`azd provision`) - Azure ਸਰੋਤ ਬਣਾਉਂਦੀ ਹੈ
2. **Package** - ਤੁਹਾਡੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਬਿਲਡ ਕਰਦੀ ਹੈ
3. **Deploy** (`azd deploy`) - ਕੋਡ ਨੂੰ Azure ਸਰੋਤਾਂ 'ਤੇ ਡਿਪਲਾਇ ਕਰਦੀ ਹੈ

### ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ਕਦਮ 5: ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਪਰਖ ਕਰੋ

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਤੱਕ ਪਹੁੰਚ
ਡਿਪਲਾਇਮੈਂਟ ਆਉਟਪੁੱਟ ਵਿੱਚ ਦਿੱਤੇ URL 'ਤੇ ਕਲਿਕ ਕਰੋ, ਜਾਂ ਕਦੇ ਵੀ ਪ੍ਰਾਪਤ ਕਰੋ:
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਐਂਡਪੋਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show

# ਆਪਣੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ਐਪ ਦੀ ਜਾਂਚ
1. **ਇਕ ਟੋਡੋ ਆਈਟਮ ਸ਼ਾਮਲ ਕਰੋ** - "Add Todo" 'ਤੇ ਕਲਿਕ ਕਰੋ ਅਤੇ ਇੱਕ ਟਾਸਕ ਦਰਜ ਕਰੋ
2. **ਮੁਕੰਮਲ ਵਜੋਂ ਨਿਸ਼ਾਨ ਲਾਓ** - ਮੁਕੰਮਲ ਹੋਏ ਆਈਟਮਾਂ ਨੂੰ ਚੈਕ ਕਰੋ
3. **ਆਈਟਮਾਂ ਨੂੰ ਹਟਾਓ** - ਉਹ ਟੂਡੋ ਰਿਮੂੰਵ ਕਰੋ ਜੋ ਤੁਹਾਨੂੰ ਲੋੜ ਨਹੀਂ

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
```bash
# ਆਪਣੇ ਰਿਸੋਰਸਾਂ ਲਈ Azure ਪੋਰਟਲ ਖੋਲ੍ਹੋ
azd monitor

# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਲਾਈਵ ਮੇਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

## ਕਦਮ 6: ਬਦਲਾਅ ਕਰੋ ਅਤੇ ਮੁੜ ਡਿਪਲਾਇ ਕਰੋ

ਆਓ ਇੱਕ ਬਦਲਾਅ ਕਰੀਏ ਅਤੇ ਵੇਖੀਏ ਕਿ ਅੱਪਡੇਟ ਕਰਨਾ ਕਿੰਨਾ ਆਸਾਨ ਹੈ:

### API ਸੋਧੋ
```bash
# API ਕੋਡ ਸੋਧੋ
code src/api/src/routes/lists.js
```

ਇੱਕ ਕਸਟਮ ਰਿਸਪਾਂਸ ਹੈਡਰ ਸ਼ਾਮਲ ਕਰੋ:
```javascript
// ਇੱਕ ਰੂਟ ਹੈਂਡਲਰ ਲੱਭੋ ਅਤੇ ਜੋੜੋ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ਸਿਰਫ ਕੋਡ ਬਦਲਾਵਾਂ ਨੂੰ ਡਿਪਲਾਇ ਕਰੋ
```bash
# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ (ਇੰਫਰਾਸਟਰੱਕਚਰ ਨੂੰ ਛੱਡੋ)
azd deploy

# ਇਹ 'azd up' ਨਾਲੋਂ ਬਹੁਤ ਤੇਜ਼ ਹੈ ਕਿਉਂਕਿ ਇੰਫਰਾਸਟਰੱਕਚਰ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ
```

## ਕਦਮ 7: ਕਈ ਪਰਿਆਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ

ਉਤਪਾਦਨ ਤੋਂ ਪਹਿਲਾਂ ਬਦਲਾਅ ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਇੱਕ ਸਟੇਜਿੰਗ ਪਰਿਆਵਰਣ ਬਣਾਓ:

```bash
# ਇੱਕ ਨਵਾਂ ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new staging

# ਸਟੇਜਿੰਗ ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਡੈਵ ਵਾਤਾਵਰਣ ਤੇ ਵਾਪਸ ਬਦਲੋ
azd env select dev

# ਸਾਰੇ ਵਾਤਾਵਰਣਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd env list
```

### ਪਰਿਆਵਰਣ ਦੀ ਤੁਲਨਾ
```bash
# ਡੈਵ ਇੰਵਾਇਰਨਮੈਂਟ ਵੇਖੋ
azd env select dev
azd show

# ਸਟੇਜਿੰਗ ਇੰਵਾਇਰਨਮੈਂਟ ਵੇਖੋ
azd env select staging
azd show
```

## ਕਦਮ 8: ਸਰੋਤ ਸਾਫ਼-ਸਫ਼ਾਈ ਕਰੋ

ਜਦੋਂ ਤੁਸੀਂ ਪ੍ਰਯੋਗ ਖਤਮ ਕਰ ਲਓ, ਤਾੰ ਚਲ ਰਹੀਆਂ ਲਾਗਤਾਂ ਤੋਂ ਬਚਣ ਲਈ ਸਾਫ਼-ਸਫ਼ਾਈ ਕਰੋ:

```bash
# ਮੌਜੂਦਾ ਵਾਤਾਵਰਣ ਲਈ ਸਾਰੇ Azure ਸਰੋਤ ਮਿਟਾਓ
azd down

# ਪੁਸ਼ਟੀ ਦੇ ਬਿਨਾਂ ਜਬਰਦਸਤੀ ਮਿਟਾਓ ਅਤੇ ਸੋਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਸਰੋਤ ਪੂਰੀ ਤਰ੍ਹਾਂ ਹਟਾਓ
azd down --force --purge

# ਨਿਰਧਾਰਿਤ ਵਾਤਾਵਰਣ ਮਿਟਾਓ
azd env select staging
azd down --force --purge
```

## ਕਲਾਸਿਕ ਐਪ ਵਸਾਬਤ AI-ਪਾਵਰਡ ਐਪ: ਇੱਕੋ ਵਰਕਫਲੋ

ਤੁਸੀਂ ਹਾਲ ਹੀ ਵਿੱਚ ਇੱਕ ਰਵਾਇਤੀ ਵੈੱਬ ਐਪ ਤੈਨਾਤ ਕੀਤੀ। ਪਰ ਜੇ ਤੁਸੀਂ ਇੱਕ AI-ਪਾਵਰਡ ਐਪ, ਉਦਾਹਰਨ ਲਈ Microsoft Foundry Models ਨਾਲ ਬੈਕਡ ਚੈਟ ਐਪ ਡਿਪਲਾਇ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ ਤਾਂ?

ਚੰਗੀ ਖਬਰ: **ਵਰਕਫਲੋ ਇੱਕੋ ਜਿਹਾ ਹੈ.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ਇੱਕਮੈਤਲੱਬ ਮਾਤਰ ਇਹ ਹੈ ਕਿ ਤੁਸੀਂ ਕਿਸ ਟੈਮਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰ ਰਹੇ ਹੋ। ਕੋਈ AI ਟੈਮਪਲੇਟ ਵਾਧੂ ਇੰਫਰਾਸਟਰੱਕਚਰ (ਜਿਵੇਂ ਕਿ Microsoft Foundry Models ਸਰੋਤ ਜਾਂ ਇੱਕ AI Search ਇੰਡੈਕਸ) ਸ਼ਾਮਲ ਕਰ ਸਕਦਾ ਹੈ, ਪਰ azd ਇਹ ਸਭ ਤੁਹਾਡੇ ਲਈ ਸੰਭਾਲਦਾ ਹੈ। ਤੁਹਾਨੂੰ ਨਵੇਂ ਕਮਾਂਡ ਸਿੱਖਣ, ਵੱਖਰਾ ਟੂਲ ਅਪਣਾਉਣ ਜਾਂ ਡਿਪਲਾਇਮੈਂਟ ਬਾਰੇ ਸੋਚਣ ਦਾ ਤਰੀਕਾ ਬਦਲਣ ਦੀ ਜ਼ਰੂਰਤ ਨਹੀਂ।

ਇਹ azd ਦਾ ਮੁੱਖ ਸਿਧਾਂਤ ਹੈ: **ਇੱਕ ਵਰਕਫਲੋ, ਕਿਸੇ ਵੀ ਲੋਡ ਲਈ.** ਇਸ ਟਿਊਟੋਰਿਯਲ ਵਿਚ ਜੋ ਤੁਸੀਂ ਅਭਿਆਸ ਕੀਤਾ — ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰਨਾ, ਡਿਪਲਾਇ ਕਰਨਾ, ਨਿਗਰਾਨੀ, ਮੁੜ ਡਿਪਲਾਇ ਅਤੇ ਸਾਫ਼-ਸਫ਼ਾਈ — ਇਹ ਸਾਰੇ ਹੁਨਰ AI ਐਪਲਿਕੇਸ਼ਨਾਂ ਅਤੇ ਏਜਨਟਾਂ 'ਤੇ ਵੀ ਲਾਗੂ ਹੁੰਦੇ ਹਨ।

---

## ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ

ਵਧਾਈਆਂ! ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ:
- ✅ ਟੈਮਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕੀਤਾ
- ✅ ਪ੍ਰੋਜੈਕਟ ਬਣਤਰ ਅਤੇ ਮੁੱਖ ਫਾਇਲਾਂ ਦੀ ਜਾਂਚ ਕੀਤੀ
- ✅ ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪ Azure 'ਤੇ ਡਿਪਲਾਇ ਕੀਤੀ
- ✅ ਕੋਡ ਬਦਲਾਅ ਕੀਤੇ ਅਤੇ ਮੁੜ ਡਿਪਲਾਇ ਕੀਤਾ
- ✅ ਕਈ ਪਰਿਆਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕੀਤਾ
- ✅ ਸਰੋਤ ਸਾਫ਼-ਸਫ਼ਾਈ ਕੀਤੀ

## 🎯 ਹੁਨਰ ਜਾਚ ਪ੍ਰੈਕਟਿਸ

### ਅਭਿਆਸ 1: ਵੱਖਰਾ ਟੈਮਪਲੇਟ ਡਿਪਲਾਇ ਕਰੋ (15 ਮਿੰਟ)
**ਲਕੜ**: azd init ਅਤੇ ਡਿਪਲਾਇਮੈਂਟ ਵਰਕਫਲੋ 'ਤੇ ਪ੍ਰਖਰਤਾ ਦਰਸਾਉਣਾ

```bash
# Python + MongoDB ਸਟੈਕ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਬਿਨਾਂ ਤਰੁਟੀਆਂ ਦੇ ਡਿਪਲਾਇ ਹੁੰਦੀ ਹੈ
- [ ] ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ URL ਤੱਕ ਪਹੁੰਚ ਸਕਦੇ ਹੋ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਠੀਕ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਦੀ ਹੈ (ਟੂਡੋ ਜੋੜੋ/ਹਟਾਓ)
- [ ] ਸਾਰੇ ਸਰੋਤ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਕੀਤੇ ਗਏ

### ਅਭਿਆਸ 2: ਕਨਫਿਗਰੇਸ਼ਨ ਕਸਟਮਾਈਜ਼ ਕਰੋ (20 ਮਿੰਟ)
**ਲਕੜ**: ਪਰਿਆਵਰਣ ਵੈਰੀਏਬਲ ਸੰਰਚਨਾ ਦਾ ਅਭਿਆਸ

```bash
cd my-first-azd-app

# ਕਸਟਮ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new custom-config

# ਕਸਟਮ ਵੇਰੀਏਬਲਾਂ ਸੈੱਟ ਕਰੋ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ਵੇਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values | grep APP_TITLE

# ਕਸਟਮ ਸੰਰਚਨਾ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
azd up
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਕਸਟਮ ਪਰਿਆਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ
- [ ] ਪਰਿਆਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਅਤੇ ਪ੍ਰਾਪਤ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਕਸਟਮ ਸੰਰਚਨਾ ਨਾਲ ਡਿਪਲਾਇ ਹੁੰਦੀ ਹੈ
- [ ] ਡਿਪਲਾਇ ਕੀਤੀ ਐਪ ਵਿੱਚ ਕਸਟਮ ਸੈਟਿੰਗਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ

### ਅਭਿਆਸ 3: ਬਹੁ-ਪਰਿਆਵਰਣ ਵਰਕਫਲੋ (25 ਮਿੰਟ)
**ਲਕੜ**: ਪਰਿਆਵਰਣ ਪ੍ਰਬੰਧਨ ਅਤੇ ਡਿਪਲਾਇਮੈਂਟ ਰਣਨੀਤੀਆਂ 'ਤੇ ਮਾਹਿਰ ਬਣੋ

```bash
# ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ਡਿਵੈਲਪਮੈਂਟ URL ਨੋਟ ਕਰੋ
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

# ਦੋਹਾਂ ਨੂੰ ਸਾਫ ਕਰੋ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਦੋ ਪਰਿਆਵਰਣ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਨਾਲ ਬਣਾਏ ਗਏ
- [ ] ਦੋਹਾਂ ਪਰਿਆਵਰਣਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲਾਇ ਕੀਤਾ ਗਿਆ
- [ ] `azd env select` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਪਰਿਆਵਰਣਾਂ ਵਿਚ ਸਵਿੱਚ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
- [ ] ਪਰਿਆਵਰਣਾਂ ਵਿਚ ਵੈਰੀਏਬਲ ਵੱਖਰੇ ਹਨ
- [ ] ਦੋਹਾਂ ਪਰਿਆਵਰਣਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਕੀਤਾ ਗਿਆ

## 📊 ਤੁਹਾਡੀ ਪ੍ਰਗਟੀ

**ਖਰਚ ਕੀਤਾ ਸਮਾਂ**: ~60-90 ਮਿੰਟ  
**ਹਾਸਲ ਕੀਤੀਆਂ ਹੁਨਰਾਂ**:
- ✅ ਟੈਮਪਲੇਟ-ਆਧਾਰਿਤ ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ੇਸ਼ਨ
- ✅ Azure ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲਾਇਮੈਂਟ ਵਰਕਫਲੋ
- ✅ ਪਰਿਆਵਰਣ ਪ੍ਰਬੰਧਨ
- ✅ ਕੰਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ
- ✅ ਸਰੋਤ ਸਾਫ਼-ਸਫ਼ਾਈ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ

**ਅਗਲਾ ਪੱਧਰ**: ਤੁਸੀਂ [Configuration Guide](configuration.md) ਲਈ ਤਿਆਰ ਹੋ ਉੱਚ ਤਹਿ ਦੀ ਸੰਰਚਨਾ ਪੈਟਰਨ ਸਿੱਖਣ ਲਈ!

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ

### ਪ੍ਰਮਾਣਿਕਤਾ ਗਲਤੀਆਂ
```bash
# Azure ਨਾਲ ਮੁੜ ਪ੍ਰਮਾਣੀਕਰਨ ਕਰੋ
az login

# ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਪਹੁੰਚ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```

### ਡਿਪਲਾਇਮੈਂਟ ਵਿੱਚ ਨਾਕਾਮੀਆਂ
```bash
# ਡਿਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd up --debug

# ਐਜ਼ੂਰ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਕੰਟੇਨਰ ਐਪਸ ਲਈ Azure CLI ਵਰਤੋਂ ਕਰੋ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ਸਰੋਤ ਨਾਮ ਟਕਰਾਅ
```bash
# ਇੱਕ ਵਿਲੱਖਣ ਮਾਹੌਲ ਦਾ ਨਾਮ ਵਰਤੋ
azd env new dev-$(whoami)-$(date +%s)
```

### ਪੋਰਟ/ਨੈੱਟਵਰਕ ਸਮੱਸਿਆਵਾਂ
```bash
# ਚੈੱਕ ਕਰੋ ਕਿ ਪੋਰਟਾਂ ਉਪਲਬਧ ਹਨ
netstat -an | grep :3000
netstat -an | grep :3100
```

## ਅਗਲੇ ਕਦਮ

ਹੁਣ ਜਦੋਂ ਤੁਸੀਂ ਆਪਣਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ, ਇਹ ਉੱਨਤ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ:

### 1. ਇੰਫਰਾਸਟਰੱਕਚਰ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ਸੈਟਅਪ ਕਰੋ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਪੂਰੇ CI/CD ਵਰਕਫਲੋ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ਪਾਈਪਲਾਈਨ ਕੰਫਿਗਰੇਸ਼ਨ

### 3. ਉਤਪਾਦਨ ਦੇ ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਸੁਰੱਖਿਆ, ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਨਿਗਰਾਨੀ

### 4. ਹੋਰ ਟੈਮਪਲੇਟ ਅਨੁਸ਼ੀਲਨ ਕਰੋ
```bash
# ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਵੇਖੋ
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

### ਟੈਮਪਲੇਟਸ ਅਤੇ ਉਦਾਹਰਣ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ਤੁਹਾਡੇ ਪਹਿਲੇ azd ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਵਧਾਈਆਂ!** ਹੁਣ ਤੁਸੀਂ ਭਰੋਸੇ ਨਾਲ Azure 'ਤੇ ਸ਼ਾਨਦਾਰ ਐਪ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲਾਇ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ।

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [Installation & Setup](installation.md)
- **➡️ ਅਗਲਾ**: [Configuration](configuration.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **ਅਗਲਾ ਪਾਠ**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਭੁੱਲਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਹੀ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਉੱਪਜਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->