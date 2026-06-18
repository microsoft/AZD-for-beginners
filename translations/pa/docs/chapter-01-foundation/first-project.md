# ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ - ਹੈਂਡਸ-ਆਨ ਟਯੂਟੋਰਿਅਲ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [Installation & Setup](installation.md)
- **➡️ ਅਗਲਾ**: [Configuration](configuration.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਪਰਿਚਯ

ਤੁਹਾਡੇ ਪਹਿਲੇ Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਸਵਾਗਤ ਹੈ! ਇਹ ਵਿਸਥਾਰਪੂਰਕ ਹੈਂਡਸ-ਆਨ ਟਯੂਟੋਰਿਅਲ azd ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਉੱਤੇ ਇੱਕ ਪੂਰਨ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ, ਡਿਪਲੋਇ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਨ ਕਰਨ ਦੀ ਪੂਰੀ ਚਾਲ-ਚਲਾਉਣ ਦਿਖਾਉਂਦਾ ਹੈ। ਤੁਸੀਂ ਇੱਕ ਅਸਲ tod o ਐਪਲੀਕੇਸ਼ਨ ਨਾਲ ਕੰਮ ਕਰੋਗੇ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ, Node.js API ਬੈਕਐਂਡ ਅਤੇ MongoDB ਡੇਟਾਬੇਸ ਸ਼ਾਮਲ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕੜੀ ਲੱਛਣ

ਇਸ ਟਯੂਟੋਰਿਅਲ ਨੂੰ ਪੂਰੋ ਕਰਨ ਨਾਲ ਤੁਸੀਂ:
- ਟੈਮਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ azd ਪ੍ਰੋਜੈਕਟ ਆਰੰਭਣ ਵਰਕਫਲੋ ਵਿੱਚ ਪ੍ਰਾਵੀਣ ਹੋਵੋਗੇ
- Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਅਤੇ ਸੰਰਚਨਾ ਫਾਇਲਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਇੰਫ਼ਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨਾਲ Azure ਤੇ ਪੂਰਾ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰਨ ਦੇ ਕਦਮ ਚਲਾਉਣਗੇ
- ਐਪਲੀਕੇਸ਼ਨ ਅੱਪਡੇਟ ਅਤੇ ਮੁੜ-ਡਿਪਲੋਇ ਕਰਨ ਦੀਆਂ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋਗੇ
- ਵਿਕਾਸ ਅਤੇ ਸਟੇਜਿੰਗ ਲਈ ਇਕ ਤੋਂ ਵੱਧ ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋਗੇ
- ਰਿਸੋਰਸ ਕਲੀਨਅਪ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਮਗਰੋਂ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਟੈਮਪਲੇਟਾਂ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਆਰੰਭ ਅਤੇ ਸੰਰਚਿਤ ਕਰਨ
- azd ਪ੍ਰੋਜੈਕਟ ਦੀਆਂ ਬਣਤਰਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ালী ਢੰਗ ਨਾਲ ਨੈਵੀਗੇਟ ਅਤੇ ਸੋਧ ਕਰਨ
- ਇੱਕ ਹੁਕਮ ਨਾਲ Azure ਤੇ ਪੂਰਾ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰਨ
- ਆਮ ਡਿਪਲੋਇ ਮਸਲਿਆਂ ਅਤੇ ਪ੍ਰਮਾਣੀਕਰਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟਰਬਲਸ਼ੂਟ ਕਰਨ
- ਵੱਖ-ਵੱਖ ਡਿਪਲੋਇਮੈਂਟ ਸਟੇਜਾਂ ਲਈ ਇਕ ਤੋਂ ਵੱਧ Azure ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਨ
- ਐਪ ਅੱਪਡੇਟ ਲਈ ਲਗਾਤਾਰ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਲਾਗੂ ਕਰਨ

## ਸ਼ੁਰੂਆਤ

### ਲਾਜ਼ਮੀ ਚੈਕਲਿਸਟ
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication completed with `azd auth login`
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

ਜਾਰੀ ਰੱਖਣ ਤੋਂ ਪਹਿਲਾਂ, ਰਿਪੋਜ਼ਿਟਰੀ ਰੂਟ ਤੋਂ ਸੈਟਅਪ ਵੈਲਿਡੇਟਰ ਚਲਾਓ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ਆਪਣੀ ਸੈਟਅਪ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
```bash
# azd ਦੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# AZD ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
azd auth login --check-status
```

### ਵਿਕਲਪੀ Azure CLI ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਪੁਸ਼ਟੀ

```bash
az account show
```

### Node.js ਸੰਸਕਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
node --version
```

## ਕਦਮ 1: ਇੱਕ ਟੈਮਪਲੇਟ ਚੁਣੋ ਅਤੇ ਆਰੰਭ ਕਰੋ

ਆਓ ਇੱਕ ਪ੍ਰਸਿੱਧ todo ਐਪਲੀਕੇਸ਼ਨ ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੀਏ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ ਅਤੇ Node.js API ਬੈਕਐਂਡ ਸ਼ਾਮਲ ਹੈ।

```bash
# ਉਪਲਬਧ ਟੈਂਪਲੇਟ ਵੇਖੋ
azd template list

# todo ਐਪ ਟੈਮਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ਪ੍ਰੰਪਟਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ:
# - ਇੱਕ ਵਾਤਾਵਰਣ ਨਾਮ ਦਰਜ ਕਰੋ: "dev"
# - ਇੱਕ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਚੁਣੋ (ਜੇ ਤੁਹਾਡੇ ਕੋਲ ਕਈ ਹਨ)
# - ਇੱਕ ਖੇਤਰ ਚੁਣੋ: "East US 2" (ਜਾਂ ਆਪਣੀ ਪਸੰਦੀਦਾ ਖੇਤਰ)
```

### ਹੁਣ ਕੀ ਹੋਇਆ?
- ਟੈਮਪਲੇਟ ਕੋਡ ਤੁਹਾਡੇ ਲੋਕਲ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਡਾਉਨਲੋਡ ਹੋਇਆ
- ਸੇਵਾ ਪਰਿਭਾਸ਼ਾਵਾਂ ਨਾਲ ਇੱਕ `azure.yaml` ਫਾਈਲ ਬਣਾਈ ਗਈ
- `infra/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇੰਫ਼ਰਾਸਟ੍ਰੱਕਚਰ ਕੋਡ ਸੈਟਅਪ ਕੀਤਾ ਗਿਆ
- ਇੱਕ ਐਨਵਾਇਰਨਮੈਂਟ ਸੰਰਚਨਾ ਬਣਾਈ ਗਈ

## ਕਦਮ 2: ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਦੀ ਜਾਂਚ ਕਰੋ

ਆਓ ਦੇਖੀਏ ਕਿ azd ਸਾਡੇ ਲਈ ਕੀ ਬਣਾਇਆ:

```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਵੇਖੋ
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

### ਸਮਝਣ ਲਈ ਮੁੱਖ ਫਾਇਲਾਂ

**azure.yaml** - ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਕੇਂਦਰ:
```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਵੇਖੋ
cat azure.yaml
```

**infra/main.bicep** - ਇੰਫ਼ਰਾਸਟ੍ਰੱਕਚਰ ਪਰਿਭਾਸ਼ਾ:
```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦਾ ਕੋਡ ਵੇਖੋ
head -30 infra/main.bicep
```

## ਕਦਮ 3: ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ (ਵਿਕਲਪੀ)

ਡਿਪਲੋਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਸੀਂ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ:

### ਫਰੰਟਐਂਡ ਸੋਧੋ
```bash
# ਰੀਐਕਟ ਐਪ ਕੰਪੋਨੈਂਟ ਖੋਲ੍ਹੋ
code src/web/src/App.tsx
```

ਇੱਕ ਸਧਾਰਣ ਬਦਲਾਅ ਕਰੋ:
```typescript
// ਸਿਰਲੇਖ ਲੱਭੋ ਅਤੇ ਇਸਨੂੰ ਬਦਲੋ
<h1>My Awesome Todo App</h1>
```

### ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਕੰਫਿਗਰ ਕਰੋ
```bash
# ਕਸਟਮ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ਸਾਰੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਵੇਖੋ
azd env get-values
```

## ਕਦਮ 4: Azure ਤੇ ਡਿਪਲੋਇ ਕਰੋ

ਹੁਣ ਰੋਮਾਂਚਕ ਹਿੱਸਾ - ਸਭ ਕੁਝ Azure ਤੇ ਡਿਪਲੋਇ ਕਰੋ!

```bash
# ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd up

# ਇਹ ਕਮਾਂਡ ਇਹ ਕਰੇਗੀ:
# 1. Azure ਰਿਸੋਰਸਾਂ ਨੂੰ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੇਗੀ (App Service, Cosmos DB ਆਦਿ)
# 2. ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਬਿਲਡ ਕਰੇਗੀ
# 3. ਪ੍ਰੋਵਿਜ਼ਨ ਕੀਤੇ ਗਏ ਰਿਸੋਰਸਾਂ 'ਤੇ ਡਿਪਲੋਇ ਕਰੇਗੀ
# 4. ਐਪਲੀਕੇਸ਼ਨ ਦਾ URL ਦਿਖਾਏਗੀ
```

### ਡਿਪਲੋਇਮੈਂਟ ਦੌਰਾਨ ਕੀ ਹੋ ਰਿਹਾ ਹੈ?

`azd up` ਕਮਾਂਡ ਇਹ ਕਦਮ ਕਰਦੀ ਹੈ:
1. **Provision** (`azd provision`) - Azure ਰਿਸੋਰਸ ਬਣਾਉਂਦਾ ਹੈ
2. **Package** - ਤੁਹਾਡੇ ਐਪ ਕੋਡ ਨੂੰ ਬਣਾਉਂਦਾ ਹੈ
3. **Deploy** (`azd deploy`) - ਕੋਡ ਨੂੰ Azure ਰਿਸੋਰਸਾਂ 'ਤੇ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ

### ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ਕਦਮ 5: ਆਪਣੀ ਐਪ ਨੂੰ ਟੈਸਟ ਕਰੋ

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਤੱਕ ਪਹੁੰਚ
ਡਿਪਲੋਇਮੈਂਟ ਆਉਟਪੁੱਟ ਵਿੱਚ ਦਿੱਤੇ URL 'ਤੇ ਕਲਿੱਕ ਕਰੋ, ਜਾਂ ਕਦੇ ਵੀ ਪ੍ਰਾਪਤ ਕਰੋ:
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show

# ਆਪਣੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ਐਪ ਦੀ ਜਾਂਚ ਕਰੋ
1. **ਇੱਕ todo ਆਈਟਮ ਸ਼ਾਮਲ ਕਰੋ** - "Add Todo" 'ਤੇ ਕਲਿੱਕ ਕਰੋ ਅਤੇ ਇੱਕ ਟਾਸਕ ਦਰਜ ਕਰੋ
2. **ਮੁਕੰਮਲ ਵਜੋਂ ਚੀਨ੍ਹਾ ਕਰੋ** - ਮੁਕੰਮਲ ਹੋਏ ਆਈਟਮਾਂ ਨੂੰ ਚੈਕ ਕਰੋ
3. **ਆਈਟਮ ਮਿਟਾਓ** - ਉਹ todos ਹਟਾਓ ਜੋ ਤੁਹਾਨੂੰ ਹੋਰ ਨਹੀਂ ਚਾਹੀਦੇ

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
```bash
# ਆਪਣੇ ਰਿਸੋਰਸਾਂ ਲਈ Azure ਪੋਰਟਲ ਖੋਲ੍ਹੋ
azd monitor

# ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

### ✅ ਆਪਣੇ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

ਅੱਗੇ ਵਧਣ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਛੋਟੀ ਚੈਕਲਿਸਟ ਚਲਾਓ ਤਾਂ ਜੋ ਇਹ ਪੁਸ਼ਟੀ ਹੋ ਜਾਵੇ ਕਿ ਸਭ ਕੁਝ ਬਿਲਕੁਲ ਕੰਮ ਕਰ ਰਿਹਾ ਹੈ—ਸਿਰਫ਼ "deploy succeeded" ਮਨ ਲੈਣ ਨਾਲ ਹੀ "app works" ਨਹੀਂ ਮੰਨੋ:

```bash
# 1. ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਐਂਡਪੌਇੰਟ ਮੌਜੂਦ ਹੈ ਅਤੇ ਪਹੁੰਚਯੋਗ ਹੈ
azd show

# 2. ਐਂਡਪੌਇੰਟ ਦਾ ਸਮੋਕ-ਟੈਸਟ ਕਰੋ (HTTP 200 ਦੀ ਉਮੀਦ)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. ਜੇ ਤੁਹਾਡੀ ਐਪ ਕੋਈ ਹੈਲਥ ਐਂਡਪੌਇੰਟ ਪੇਸ਼ ਕਰਦੀ ਹੈ ਤਾਂ ਉਸ ਦੀ ਜਾਂਚ ਕਰੋ
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**ਡਿਪਲੋਇਮੈਂਟ ਤਦ ਪ੍ਰਮਾਣਿਤ ਮੰਨਿਆ ਜਾਂਦਾ ਹੈ ਜਦੋਂ:**
- ✅ `azd show` ਇੱਕ ਪਹੁੰਚਯੋਗ endpoint URL ਦਰਸਾਉਂਦਾ ਹੈ
- ✅ URL ਤੁਹਾਡੇ ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਬਿਨਾਂ ਏਰਰਾਂ ਖੁਲਦਾ ਹੈ
- ✅ ਮੁੱਖ ਫੀਚਰ ਕੰਮ ਕਰਦੇ ਹਨ (todo ਸ਼ਾਮਲ/ਮੁਕੰਮਲ/ਹਟਾਓ)
- ✅ `azd monitor --logs` ਬਿਨਾਂ ਅਣਚਾਹੇ ਏਰਰਾਂ ਦੇ ਆਗਮਨ ਦਿਖਾਉਂਦਾ ਹੈ

ਜੇ ਕੋਈ ਚੈਕ ਫੇਲ ਹੋਵੇ, ਤਾਂ ਜਾਵੋ [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

## ਕਦਮ 6: ਤਬਦੀਲੀਆਂ ਕਰੋ ਅਤੇ ਮੁੜ-ਡਿਪਲੋਇ ਕਰੋ

ਆਓ ਇੱਕ ਤਬਦੀਲੀ ਕਰਦੇ ਹਾਂ ਅਤੇ ਦੇਖਦੇ ਹਾਂ ਕਿ ਅੱਪਡੇਟ ਕਰਨਾ ਕਿੰਨਾ ਆਸਾਨ ਹੈ:

### API ਸੋਧੋ
```bash
# API ਕੋਡ ਨੂੰ ਸੋਧੋ
code src/api/src/routes/lists.js
```

ਇੱਕ ਕਸਟਮ ਰਿਸਪਾਂਸ ਹੈਡਰ ਸ਼ਾਮਲ ਕਰੋ:
```javascript
// ਇੱਕ ਰੂਟ ਹੈਂਡਲਰ ਲੱਭੋ ਅਤੇ ਸ਼ਾਮِل ਕਰੋ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ਸਿਰਫ਼ ਕੋਡ ਤਬਦੀਲੀਆਂ ਡਿਪਲੋਇ ਕਰੋ
```bash
# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਤੈਨਾਤ ਕਰੋ (ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਛੱਡੋ)
azd deploy

# ਇਹ 'azd up' ਨਾਲੋਂ ਕਾਫੀ ਤੇਜ਼ ਹੈ ਕਿਉਂਕਿ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ
```

## ਕਦਮ 7: ਕਈ ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ

ਉਤਪਾਦਨ ਤੋਂ ਪਹਿਲਾਂ ਬਦਲਾਅ ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਇੱਕ ਸਟੇਜਿੰਗ ਐਨਵਾਇਰਨਮੈਂਟ ਬਣਾਓ:

```bash
# ਨਵਾਂ ਸਟੇਜਿੰਗ ਇਨਵਾਇਰਨਮੈਂਟ ਬਣਾਓ
azd env new staging

# ਸਟੇਜਿੰਗ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਡੈਵ ਇਨਵਾਇਰਨਮੈਂਟ 'ਤੇ ਵਾਪਸ ਜਾਓ
azd env select dev

# ਸਾਰੇ ਇਨਵਾਇਰਨਮੈਂਟ ਦਿਖਾਓ
azd env list
```

### ਐਨਵਾਇਰਨਮੈਂਟ ਤੁਲਨਾ
```bash
# ਡੈव ਵਾਤਾਵਰਣ ਵੇਖੋ
azd env select dev
azd show

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਵੇਖੋ
azd env select staging
azd show
```

## ਕਦਮ 8: ਰਿਸੋਰਸ ਸਾਫ਼ ਕਰੋ

ਜਦੋਂ ਤੁਸੀਂ ਪ੍ਰਯੋਗ ਕਰਨਾ ਖਤਮ ਕਰ ਲੈਂਦੇ ਹੋ, ਲਗਾਤਾਰ ਚਾਰਜਾਂ ਤੋਂ ਬਚਣ ਲਈ ਸਾਫ਼-ਸਫਾਈ ਕਰੋ:

```bash
# ਮੌਜੂਦਾ ਵਾਤਾਵਰਣ ਲਈ ਸਾਰੇ Azure ਸਰੋਤ ਹਟਾਓ
azd down

# ਪੁਸ਼ਟੀ ਦੇ ਬਿਨਾਂ ਜਬਰਦਸਤ ਤੌਰ ਤੇ ਮਿਟਾਓ ਅਤੇ ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਸਰੋਤਾਂ ਨੂੰ ਸਥਾਈ ਤੌਰ ਤੇ ਸਾਫ਼ ਕਰੋ
azd down --force --purge

# ਨਿਰਧਾਰਤ ਵਾਤਾਵਰਣ ਹਟਾਓ
azd env select staging
azd down --force --purge
```

## ਰਵਾਇਤੀ ਐਪ vs. AI-ਪਾਵਰਡ ਐਪ: ਇੱਕੋ ਵਰਕਫਲੋ

ਤੁਸੀਂ ਅਜੇਹੀ ਇੱਕ ਰਵਾਇਤੀ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕੀਤਾ। ਪਰ ਜੇ ਤੁਸੀਂ AI-ਪਾਵਰਡ ਐਪ—ਉਦਾਹਰਨ ਵਜੋਂ ਇੱਕ ਚੈਟ ਐਪ ਜੋ Microsoft Foundry Models ਨਾਲ ਸਪੋਰਟਡ ਹੋਵੇ—ਡਿਪਲੋਇ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ ਤਾਂ?

ਚੰਗੀ ਖਬਰ: **ਵਰਕਫਲੋ ਇਕੋ ਹੀ ਹੈ।**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ਇੱਕਮਾਤਰ ਫਰਕ ਉਹ **ਟੈਮਪਲੇਟ** ਹੈ ਜਿਸ ਤੋਂ ਤੁਹਾਨੂੰ ਸ਼ੁਰੂਆਤ ਕਰਨੀ ਹੈ। ਇੱਕ AI ਟੈਮਪਲੇਟ ਵਾਧੂ ਇੰਫ਼ਰਾਸਟ੍ਰੱਕਚਰ (ਜਿਵੇਂ Microsoft Foundry Models ਰਿਸੋਰਸ ਜਾਂ AI Search ਇੰਡੈਕਸ) ਸ਼ਾਮਲ ਕਰਦਾ ਹੈ, ਪਰ azd ਇਹ ਸਭ ਤੁਹਾਡੇ ਲਈ ਹੋਸਟ ਕਰਦਾ ਹੈ। ਤੁਹਾਨੂੰ ਨਵੇਂ ਹੁਕਮ ਸਿੱਖਣ ਦੀ ਲੋੜ ਨਹੀਂ, ਵੱਖ-ਵੱਖ ਟੂਲ اپنਾਣ ਦੀ ਲੋੜ ਨਹੀਂ, ਜਾਂ ਡਿਪਲੋਇਮੈਂਟ ਬਾਰੇ ਸੋਚਣ ਦਾ ਤਰੀਕਾ ਬਦਲਣ ਦੀ ਲੋੜ ਨਹੀਂ।

ਇਹ azd ਦਾ ਮੂਲ ਸਿਧਾਂਤ ਹੈ: **one workflow, any workload.** ਤੁਸੀਂ ਜੋ ਹੁਨਰ ਇਸ ਟਯੂਟੋਰਿਅਲ ਵਿੱਚ ਅਭਿਆਸ ਕੀਤੇ—ਆਰੰਭਣਾ, ਡਿਪਲੋਇ, ਨਿਗਰਾਨੀ, ਮੁੜ-ਡਿਪਲੋਇ ਅਤੇ ਸਾਫ਼-ਸਫਾਈ—ਉਹ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਅਤੇ ਏਜੰਟਾਂ 'ਤੇ ਵੀ ਇਕਸਾਰ ਲਾਗੂ ਹੁੰਦੇ ਹਨ।

---

## ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ

ਵਧਾਈਆਂ! ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ:
- ✅ ਇੱਕ ਟੈਮਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਆਰੰਭ ਕੀਤਾ
- ✅ ਪ੍ਰੋਜੈਕਟ ਬਣਤਰ ਅਤੇ ਮੁੱਖ ਫਾਇਲਾਂ ਦੀ ਜਾਂਚ ਕੀਤੀ
- ✅ Azure ਤੇ ਇੱਕ ਪੂਰਾ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕੀਤਾ
- ✅ ਕੋਡ ਤਬਦੀਲੀਆਂ ਕੀਤੀਆਂ ਅਤੇ ਮੁੜ-ਡਿਪਲੋਇ ਕੀਤਾ
- ✅ ਇਕ ਤੋਂ ਵੱਧ ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕੀਤਾ
- ✅ ਰਿਸੋਰਸਾਂ ਨੂੰ ਸਾਫ़ ਕੀਤਾ

## 🎯 ਹੁਨਰ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਵਾਲੇ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਇੱਕ ਵੱਖਰਾ ਟੈਮਪਲੇਟ ਡਿਪਲੋਇ ਕਰੋ (15 ਮਿੰਟ)
**ਲੱਛਣ**: azd init ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਦੀ ਮਾਹਰਤਾ ਦਿਖਾਉਣਾ

```bash
# Python + MongoDB ਸਟੈਕ ਨੂੰ ਅਜ਼ਮਾਓ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

**ਕامیابی ਮਾਪਦੰਡ:**
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਬਿਨਾਂ ਐਰਰ ਦੇ ਡਿਪਲੋਇ ਹੋਵੇ
- [ ] ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ URL ਤੱਕ ਪਹੁੰਚ ਹੋ ਸਕੇ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਠੀਕ ਕੰਮ ਕਰਦਾ ਹੋਵੇ (todo ਸ਼ਾਮਲ/ਹਟਾਓ)
- [ ] ਸਾਰੇ ਰਿਸੋਰਸ ਸਫਾਈ ਨਾਲ ਹਟਾਏ ਗਏ

### ਅਭਿਆਸ 2: ਸੰਰਚਨਾ ਕਸਟਮਾਈਜ਼ ਕਰੋ (20 ਮਿੰਟ)
**ਲੱਛਣ**: ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਦੀ ਸੰਰਚਨਾ ਦਾ ਅਭਿਆਸ

```bash
cd my-first-azd-app

# ਕਸਟਮ ਮਾਹੌਲ ਬਣਾਓ
azd env new custom-config

# ਕਸਟਮ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values | grep APP_TITLE

# ਕਸਟਮ ਕਨਫਿਗ ਦੇ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up
```

**ਕامیابی ਮਾਪਦੰਡ:**
- [ ] ਕਸਟਮ ਐਨਵਾਇਰਨਮੈਂਟ ਸਫਲਤਾਪੂਰਵਕ ਬਣਿਆ
- [ ] ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਸੈੱਟ ਕੀਤੇ ਅਤੇ ਪ੍ਰਾਪਤ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਕਸਟਮ ਸੰਰਚਨਾ ਨਾਲ ਡਿਪਲੋਇ ਕੀਤਾ ਗਿਆ
- [ ] ਡਿਪਲੋਇ ਕੀਤੇ ਐਪ ਵਿੱਚ ਕਸਟਮ ਸੈਟਿੰਗਾਂ ਦੀ ਪੁਸ਼ਟੀ ਹੋ ਸਕੇ

### ਅਭਿਆਸ 3: ਮੁਲਟੀ-ਐਨਵਾਇਰਨਮੈਂਟ ਵਰਕਫਲੋ (25 ਮਿੰਟ)
**ਲੱਛਣ**: ਐਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀਆਂ 'ਤੇ ਮਾਹਰਤਾ

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

# ਦੋਵਾਂ ਵਾਤਾਵਰਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# ਦੋਵਾਂ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸਾਫ ਕਰੋ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**ਕامیابی ਮਾਪਦੰਡ:**
- [ ] ਦੋ ਐਨਵਾਇਰਨਮੈਂਟ ਵਿਚ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਨਾਲ ਬਣਾਏ ਗਏ
- [ ] ਦੋਹਾਂ ਐਨਵਾਇਰਨਮੈਂਟ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੋਇ ਕੀਤੇ ਗਏ
- [ ] `azd env select` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਵਿੱਚ ਬਦਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
- [ ] ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਵਿੱਚ ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਵੱਖਰੇ ਹਨ
- [ ] ਦੋਹਾਂ ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਕੀਤਾ ਗਿਆ

## 📊 ਤੁਹਾਡੀ ਪ੍ਰਗਤੀ

**ਲੱਗਾਇਆ ਸਮਾਂ**: ~60-90 ਮਿੰਟ  
**ਹਾਸਲ ਕੀਤੇ ਹੁਨਰ**:
- ✅ ਟੈਮਪਲੇਟ-ਆਧਾਰਤ ਪ੍ਰੋਜੈਕਟ ਆਰੰਭਣਾ
- ✅ Azure ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼
- ✅ ਐਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ
- ✅ ਸੰਰਚਨਾ ਪ੍ਰਬੰਧਨ
- ✅ ਰਿਸੋਰਸ ਸਾਫ਼-ਸਫਾਈ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ

**ਅਗਲਾ ਪੱਧਰ**: ਤੁਸੀਂ [Configuration Guide](configuration.md) ਲਈ ਤਿਆਰ ਹੋ ਕਿ ਉੱਚ-ਸਤਹ ਦੀਆਂ ਸੰਰਚਨਾ ਪੈਟਰਨ ਸਿੱਖੋ!

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਪ੍ਰਮਾਣੀਕਰਨ ਤੇ ਆਮ ਗਲਤੀਆਂ
```bash
# Azure ਨਾਲ ਦੁਬਾਰਾ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ
az login

# ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਦੀ ਪਹੁੰਚ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```

### ਡਿਪਲੋਇਮੈਂਟ ਫੇਲਿਆਂ
```bash
# ਡੀਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd up --debug

# Azure ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# Container Apps ਲਈ, Azure CLI ਵਰਤੋ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ਰਿਸੋਰਸ ਨਾਮ ਟਕਰਾਅ
```bash
# ਇੱਕ ਵਿਲੱਖਣ ਮਾਹੌਲ ਦਾ ਨਾਮ ਵਰਤੋ
azd env new dev-$(whoami)-$(date +%s)
```

### ਪੋਰਟ/ਨੈੱਟਵਰਕ ਸਮੱਸਿਆਵਾਂ
```bash
# ਪੋਰਟਾਂ ਉਪਲਬਧ ਹਨ ਜਾਂ ਨਹੀਂ ਚੈੱਕ ਕਰੋ
netstat -an | grep :3000
netstat -an | grep :3100
```

## ਅਗਲੇ ਕਦਮ

ਹੁਣ ਜਦੋਂ ਤੁਸੀਂ ਆਪਣਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ, ਇਨ੍ਹਾਂ ਅਡਵਾਂਸ ਵਿਸ਼ਿਆਂ ਦੀ ਜਾਂਚ ਕਰੋ:

### 1. ਇੰਫ਼ਰਾਸਟ੍ਰੱਕਚਰ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ਸੈਟ ਅਪ ਕਰੋ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਪੂਰੇ CI/CD ਵਰਕਫਲੋਜ਼
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ਪਾਈਪਲਾਈਨ ਸੰਰਚਨਾ

### 3. ਪ੍ਰੋਡਕਸ਼ਨ ਸਰੋੜਨੀਆਂ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਸੁਰੱਖਿਆ, ਪ੍ਰਦਰਸ਼ਨ, ਅਤੇ ਨਿਗਰਾਨੀ

### 4. ਹੋਰ ਟੈਮਪਲੇਟ ਖੋਜੋ
```bash
# ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ ਟੈਮਪਲੇਟ ਬ੍ਰਾਊਜ਼ ਕਰੋ
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

### ਟੈਮਪਲੇਟ ਅਤੇ ਉਦਾਹਰਨਾਂ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ਤੁਹਾਡੇ ਪਹਿਲੇ azd ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਵਧਾਈਆਂ!** ਹੁਣ ਤੁਸੀਂ ਵਿਸ਼ਵਾਸ ਨਾਲ Azure 'ਤੇ ਸ਼ਾਨਦਾਰ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੋਇ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ।

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [Installation & Setup](installation.md)
- **➡️ ਅਗਲਾ**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->