# ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ - ਹੈਂਡਸ-ਆਨ ਟਿਊਟੋਰਿਯਲ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ](installation.md)
- **➡️ ਅਗਲਾ**: [ਕਨਫ਼ਿਗਰੇਸ਼ਨ](configuration.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 2: AI-ਪਹਿਲਾ ਡਿਵੈਲਪਮੈਂਟ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਪਰਿਚయ

ਤੁਹਾਡਾ ਪਹਿਲਾ Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਸਵਾਗਤ ਹੈ! ਇਹ ਵਿਸਤ੍ਰਿਤ ਹੈਂਡਸ-ਆਨ ਟਿਊਟੋਰਿਯਲ azd ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure 'ਤੇ ਪੂਰੇ-ਸਟੈਕ ਐਪਲਿਕੇਸ਼ਨ ਬਣਾਉਣ, ਡਿਪਲੌਇ ਅਤੇ ਪ੍ਰਬੰਧਨ ਦੀ ਪੂਰੀ ਰਾਹ-ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ। ਤੁਸੀਂ ਇੱਕ ਅਸਲੀ todo ਐਪਲਿਕੇਸ਼ਨ ‘ਤੇ ਕੰਮ ਕਰੋਗੇ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ, Node.js API ਬੈਕਐਂਡ, ਅਤੇ MongoDB ਡੇਟਾਬੇਸ ਸ਼ਾਮਲ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲਕੜੀ

ਇਸ ਟਿਊਟੋਰਿਯਲ ਨੂੰ ਪੂਰਾ ਕਰਨ ਨਾਲ, ਤੁਸੀਂ:
- azd ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜੇਸ਼ਨ ਵਰਕਫਲੋ ਨੂੰ ਟੈਮਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਨਾਲ ਮਾਹਿਰ ਬਣਾਉਣਗੇ
- Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ ਨੂੰ ਸਮਝੋਂਗੇ
- ਇੰਫਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੇਤ ਪੂਰੀ ਐਪਲਿਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੌਇ ਕਰਨਗੇ
- ਐਪਲਿਕੇਸ਼ਨ ਅੱਪਡੇਟ ਅਤੇ ਮੁੜ-ਡਿਪਲੌਇ ਦੀਆਂ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨਗੇ
- ਵਿਕਾਸ ਅਤੇ ਸਟੇਜਿੰਗ ਲਈ ਕਈ ਐਨਵਾਇਰਨਮੈਂਟਸ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਨਗੇ
- ਰਿਸੋਰਸ ਕਲੀਨਅਪ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰਨਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਮੁਕੰਮਲ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਟੈਮਪਲੇਟਾਂ ਤੋਂ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ azd ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਅਤੇ ਕੰਫਿਗਰ ਕਰਨ ਦੀ
- azd ਪ੍ਰੋਜੈਕਟ ਢਾਂਚੇ ਵਿੱਚ نیਵੀਗੇਟ ਅਤੇ ਸੋਧ ਕਰਨ ਦੀ
- ਇੱਕ ਕਮਾਂਡ ਨਾਲ Azure 'ਤੇ ਪੂਰੇ-ਸਟੈਕ ਐਪਲਿਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰਨ ਦੀ
- ਆਮ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਪ੍ਰਮਾਣੀਕਰਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟਰਬਲਸ਼ੂਟ ਕਰਨ ਦੀ
- ਵੱਖ-ਵੱਖ ਡਿਪਲੌਇਮੈਂਟ ਸੀਝੰਨ ਲਈ ਕਈ Azure ਐਨਵਾਇਰਨਮੈਂਟਸ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਦੀ
- ਐਪਲਿਕੇਸ਼ਨ ਅੱਪਡੇਟ ਲਈ ਕਾਂਟੀਨਿਊਅਸ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ ਲਾਗੂ ਕਰਨ ਦੀ

## ਸ਼ੁਰੂਆਤ

### ਪਹਿਲਾਂ ਤੋਂ ਲੋੜੀਂਦੇ ਚੀਜ਼ਾਂ ਦੀ ਸੂਚੀ
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authenticated with `azd auth login`
- ✅ Git ਤੁਹਾਡੇ ਸਿਸਟਮ 'ਤੇ نصب
- ✅ Node.js 16+ (ਇਸ ਟਿਊਟੋਰਿਯਲ ਲਈ)
- ✅ Visual Studio Code (ਸਿਫਾਰਸ਼ੀ)

ਜਾਰੀ ਰੱਖਣ ਤੋਂ ਪਹਿਲਾਂ, ਰਿਪੋਜ਼ਿਟਰੀ ਰੂਟ ਤੋਂ setup validator ਚਲਾਓ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ਆਪਣੀ ਸੈਟਅਪ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
# azd ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# AZD ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
azd auth login --check-status
```

### ਵਿਕਲਪੀ Azure CLI ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਜਾਂਚ ਕਰੋ

```bash
az account show
```

### Node.js ਵਰਜ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
node --version
```

## ਕਦਮ 1: ਟੈਮਪਲੇਟ ਚੁਣੋ ਅਤੇ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰੋ

ਆਓ ਇੱਕ ਲੋਕਪ੍ਰਿਯ todo ਐਪ ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੀਏ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ ਅਤੇ Node.js API ਬੈਕਐਂਡ ਸ਼ਾਮਲ ਹੈ।

```bash
# ਉਪਲਬਧ ਟੈਂਪਲੇਟਾਂ ਬਰਾਊਜ਼ ਕਰੋ
azd template list

# ਟੂਡੋ ਐਪ ਟੈਂਪਲੇਟ ਨੂੰ ਆਰੰਭ ਕਰੋ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ਦਿੱਤੇ ਗਏ ਪ੍ਰੋਮਪਟਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ:
# - ਇੱਕ ਵਾਤਾਵਰਨ ਦਾ ਨਾਮ ਦਰਜ ਕਰੋ: "dev"
# - ਇੱਕ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਚੁਣੋ (ਜੇ ਤੁਹਾਡੇ ਕੋਲ ਕਈ ਹਨ)
# - ਇੱਕ ਰੀਜਨ ਚੁਣੋ: "East US 2" (ਜਾਂ ਆਪਣੀ ਪਸੰਦੀਦਾ ਰੀਜਨ)
```

### ਕੀ ਹੁਇਆ ਸੀ?
- ਟੈਮਪਲੇਟ ਕੋਡ ਤੁਹਾਡੇ ਲੋਕਲ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ
- ਸੇਵਾ ਵਿਆਖਿਆਵਾਂ ਨਾਲ ਇੱਕ `azure.yaml` ਫਾਈਲ ਬਣਾਈ ਗਈ
- `infra/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇੰਫਰਾਸਟਰੱਕਚਰ ਕੋਡ ਸੈਟ ਕੀਤਾ ਗਿਆ
- ਇੱਕ ਐਨਵਾਇਰਨਮੈਂਟ ਕੰਫਿਗਰੇਸ਼ਨ ਬਣਾਈ ਗਈ

## ਕਦਮ 2: ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਦੀ ਖੋਜ ਕਰੋ

ਚਲੋ ਵੇਖੀਏ ਕਿ azd ਸਾਡੇ ਲਈ ਕੀ ਬਣਾਇਆ:

```bash
# ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ ਵੇਖੋ
tree /f   # ਵਿੰਡੋਜ਼
# ਜਾਂ
find . -type f | head -20   # ਮੈਕਓਐਸ/ਲਿਨਕਸ
```

ਤੁਹਾਨੂੰ ਇਹ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ:
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
# ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ ਵੇਖੋ
cat azure.yaml
```

**infra/main.bicep** - ਇੰਫਰਾਸਟਰੱਕਚਰ ਪਰਿਭਾਸ਼ਾ:
```bash
# ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਕੋਡ ਵੇਖੋ
head -30 infra/main.bicep
```

## ਕਦਮ 3: ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ (ਇਚਛਿਕ)

ਡਿਪਲੌਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਸੀਂ ਐਪਲਿਕੇਸ਼ਨ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ:

### ਫਰੰਟਐਂਡ ਨੂੰ ਸੋਧੋ
```bash
# ਰੀਐਕਟ ਐਪ ਕੰਪੋਨੈਂਟ ਖੋਲ੍ਹੋ
code src/web/src/App.tsx
```

ਇੱਕ ਸਾਦਾ ਬਦਲਾਅ ਕਰੋ:
```typescript
// ਸਿਰਲੇਖ ਲੱਭੋ ਅਤੇ ਇਸਨੂੰ ਬਦਲੋ
<h1>My Awesome Todo App</h1>
```

### ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਸ ਸੈਟ ਕਰੋ
```bash
# ਕਸਟਮ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ਸਾਰੇ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਵੇਖੋ
azd env get-values
```

## ਕਦਮ 4: Azure 'ਤੇ ਡਿਪਲੌਇ ਕਰੋ

ਹੁਣ ਰੋਮਾਂਚਕ ਹਿੱਸਾ - ਸਭ ਕੁਝ Azure 'ਤੇ ਡਿਪਲੌਇ ਕਰੋ!

```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd up

# ਇਹ ਕਮਾਂਡ ਇਹ ਕਰੇਗੀ:
# 1. Azure ਸਰੋਤ ਪ੍ਰੋਵਾਈਜ਼ਨ ਕਰੇਗੀ (App Service, Cosmos DB ਆਦਿ)
# 2. ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਤਿਆਰ ਕਰੇਗੀ
# 3. ਪ੍ਰੋਵਾਈਜ਼ਨ ਕੀਤੇ ਗਏ ਸਰੋਤਾਂ 'ਤੇ ਤੈਨਾਤ ਕਰੇਗੀ
# 4. ਐਪਲੀਕੇਸ਼ਨ ਦਾ URL ਦਿਖਾਏਗੀ
```

### ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਕੀ ਹੋ ਰਿਹਾ ਹੈ?

`azd up` ਕਮਾਂਡ ਇਹ ਕਦਮ ਕਰਦੀ ਹੈ:
1. **Provision** (`azd provision`) - Azure ਰਿਸੋਰਸ ਬਣਾਉਂਦੀ ਹੈ
2. **Package** - ਤੁਹਾਡੇ ਐਪ ਕੋਡ ਨੂੰ build ਕਰਦੀ ਹੈ
3. **Deploy** (`azd deploy`) - ਕੋਡ ਨੂੰ Azure ਰਿਸੋਰਸਾਂ `ਤੇ ਡਿਪਲੌਇ ਕਰਦੀ ਹੈ

### ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ਕਦਮ 5: ਆਪਣੀ ਐਪਲਿਕੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ

### ਆਪਣੀ ਐਪਲਿਕੇਸ਼ਨ ਤੱਕ ਪਹੁੰਚ
ਡਿਪਲੌਇਮੈਂਟ ਆਉਟਪੁੱਟ ਵਿੱਚ ਦਿੱਤੀ URL 'ਤੇ ਕਲਿੱਕ ਕਰੋ, ਜਾਂ ਕਿਸੇ ਵੀ ਸਮੇਂ ਇਸਨੂੰ ਪ੍ਰਾਪਤ ਕਰੋ:
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show

# ਆਪਣੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ਐਪ ਦੀ ਜਾਂਚ
1. **ਇੱਕ todo ਆਈਟਮ ਜੋੜੋ** - "Add Todo" 'ਤੇ ਕਲਿੱਕ ਕਰੋ ਅਤੇ ਇੱਕ ਟਾਸਕ ਦਾਖਲ ਕਰੋ
2. **ਮੁਕੰਮਲ म्हणून ਦਿੱਵੋ** - ਮੁਕੰਮਲ ਆਈਟਮਾਂ ਨੂੰ ਚੇਕ ਕਰੋ
3. **ਆਈਟਮ ਹਟਾਓ** - ਉਹ todos ਹਟਾਓ ਜੋ ਤੁਹਾਨੂੰ ਲੋੜ ਨਹੀਂ ਰਹੇ

### ਆਪਣੀ ਐਪਲਿਕੇਸ਼ਨ ਦੀ ਮਾਨੀਟਰਿੰਗ
```bash
# ਆਪਣੇ ਸਰੋਤਾਂ ਲਈ Azure ਪੋਰਟਲ ਖੋਲ੍ਹੋ
azd monitor

# ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਾਂ ਵੇਖੋ
azd monitor --logs

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

## ਕਦਮ 6: ਬਦਲਾਅ ਕਰੋ ਅਤੇ ਮੁੜ-ਡਿਪਲੌਇ ਕਰੋ

ਚਲੋ ਇੱਕ ਬਦਲਾਅ ਕਰੀਏ ਅਤੇ ਵੇਖੀਏ ਕਿ ਅੱਪਡੇਟ ਕਰਨਾ ਕਿੰਨਾ ਆਸਾਨ ਹੈ:

### API ਨੂੰ ਸੋਧੋ
```bash
# API ਕੋਡ ਸੋਧੋ
code src/api/src/routes/lists.js
```

ਇੱਕ ਕਸਟਮ ਪ੍ਰਤੀਕਿਰਿਆ ਹੈਡਰ ਜੋੜੋ:
```javascript
// ਇੱਕ ਰੂਟ ਹੈਂਡਲਰ ਲੱਭੋ ਅਤੇ ਜੋੜੋ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ਸਿਰਫ ਕੋਡ ਬਦਲਾਅ ਡਿਪਲੌਇ ਕਰੋ
```bash
# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਨੂੰ ਛੱਡੋ)
azd deploy

# ਇਹ 'azd up' ਨਾਲੋਂ ਕਾਫ਼ੀ ਤੇਜ਼ ਹੈ ਕਿਉਂਕਿ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ
```

## ਕਦਮ 7: ਕਈ ਐਨਵਾਇਰਨਮੈਂਟਸ ਦਾ ਪ੍ਰਬੰਧਨ

ਉਤਪਾਦਨ ਤੋਂ ਪਹਿਲਾਂ ਬਦਲਾਵਾਂ ਦੀ ਜਾਂਚ ਲਈ ਇੱਕ ਸਟੇਜਿੰਗ ਐਨਵਾਇਰਨਮੈਂਟ ਬਣਾਓ:

```bash
# ਇੱਕ ਨਵਾਂ ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new staging

# ਸਟੇਜਿੰਗ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਡੈਵ ਵਾਤਾਵਰਣ 'ਤੇ ਵਾਪਸ ਜਾਓ
azd env select dev

# ਸਾਰੇ ਵਾਤਾਵਰਣਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd env list
```

### ਐਨਵਾਇਰਨਮੈਂਟ ਤુલਨਾ
```bash
# ਡੈਵ ਵਾਤਾਵਰਣ ਵੇਖੋ
azd env select dev
azd show

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਵੇਖੋ
azd env select staging
azd show
```

## ਕਦਮ 8: ਰਿਸੋਰਸਸ ਸਾਫ ਕਰੋ

ਜਦੋਂ ਤੁਸੀਂ ਤਜਰਬਾ ਕਰਨਾ ਮੁਕੰਮਲ ਕਰ ਲੈਂਦੇ ਹੋ, ਲਗਾਤਾਰ ਚਾਰਜ ਤੋਂ ਬਚਣ ਲਈ ਸਾਫ-ਸੁਥਰਾ ਕਰੋ:

```bash
# ਮੌਜੂਦਾ ਵਾਤਾਵਰਣ ਲਈ ਸਾਰੇ Azure ਸਰੋਤ ਹਟਾਓ
azd down

# ਪੁਸ਼ਟੀ ਦੇ ਬਗੈਰ ਜਬਰਦਸਤੀ ਹਟਾਓ ਅਤੇ ਸੋਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਸਰੋਤਾਂ ਨੂੰ ਸਥਾਈ ਤੌਰ 'ਤੇ ਮਿਟਾਓ
azd down --force --purge

# ਨਿਰਧਾਰਿਤ ਵਾਤਾਵਰਣ ਨੂੰ ਹਟਾਓ
azd env select staging
azd down --force --purge
```

## ਰਵਾਇਤੀ ਐਪ ਵਰਸੇਸ AI-ਸਮਰਥਿਤ ਐਪ: ਇੱਕੋ ਵਰਕਫਲੋ

ਤੁਸੀਂ ਹਾਲ ਹੀ ਵਿੱਚ ਇੱਕ ਰਵਾਇਤੀ ਵੈੱਬ ਐਪ ਡਿਪਲੌਇ ਕੀਤਾ। ਪਰ ਜੇ ਤੁਸੀਂ AI-ਸਮਰਥਿਤ ਐਪ—ਜਿਵੇਂ Microsoft Foundry Models ਦੁਆਰਾ ਢੋਕੇ ਹੋਇਆ ਇੱਕ ਚੈਟ ਐਪ—ਡਿਪਲੌਇ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?

ਚੰਗੀ ਖਬਰ: **ਵਰਕਫਲੋ ਇੱਕੋ ਹੀ ਹੈ।**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ਇੱਕੋ ਇਕ ਫਰਕ ਉਹ **ਟੈਮਪਲੇਟ** ਹੈ ਜਿਸ ਤੋਂ ਤੁਸੀਂ ਸ਼ੁਰੂ ਕਰਦੇ ਹੋ। ਇਕ AI ਟੈਮਪਲੇਟ ਵਿੱਚ ਵਧੇਰੇ ਇੰਫਰਾਸਟਰੱਕਚਰ ਸ਼ਾਮਲ ਹੋ ਸਕਦਾ ਹੈ (ਜਿਵੇਂ Microsoft Foundry Models ਰਿਸੋਰਸ ਜਾਂ AI Search ਇੰਡੈਕਸ), ਪਰ azd ਇਹ ਸਭ ਤੁਹਾਡੇ ਲਈ ਸੰਭਾਲ ਲੈਂਦਾ ਹੈ। ਤੁਹਾਨੂੰ ਨਵੇਂ ਕਮਾਂਡਸ ਸਿੱਖਣ ਦੀ ਲੋੜ ਨਹੀਂ, ਵੱਖਰੇ ਟੂਲ ਨੂੰ ਅਪਣਾਉਣ ਦੀ ਲੋੜ ਨਹੀਂ, ਅਤੇ ਨਾ ਹੀ ਡਿਪਲੌਇਮੈਂਟ ਬਾਰੇ ਸੋਚਣ ਦਾ ਤਰੀਕਾ ਬਦਲਣਾ ਪਵੇਗਾ।

ਇਹ azd ਦਾ ਮੁੱਖ ਸਿਧਾਂਤ ਹੈ: **ਇੱਕ ਵਰਕਫਲੋ, ਕਿਸੇ ਵੀ ਵਰਕਲੋਡ ਲਈ।** ਇਸ ਟਿਊਟੋਰਿਯਲ ਵਿੱਚ ਤੁਸੀਂ ਜੋ ਹੁਨਰ ਅਭਿਆਸ ਕੀਤੇ—ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰਨਾ, ਡਿਪਲੌਇ ਕਰਨਾ, ਮਾਨੀਟਰ ਕਰਨਾ, ਮੁੜ-ਡਿਪਲੌਇ ਕਰਨਾ, ਅਤੇ ਸਾਫ ਕਰਨਾ—ਉਹ AI ਐਪਲੀਕੇਸ਼ਨ ਅਤੇ ਏਜੰਟਾਂ 'ਤੇ ਵੀ ਇਕਸਾਰ ਲਾਗੂ ਹੁੰਦੇ ਹਨ।

---

## ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ

ਵਧਾਈਆਂ! ਤੁਸੀਂ ਸਫਲਤਾ ਨਾਲ:
- ✅ ਇੱਕ ਟੈਮਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕੀਤਾ
- ✅ ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਅਤੇ ਮੁੱਖ ਫਾਈਲਾਂ ਦੀ ਖੋਜ ਕੀਤੀ
- ✅ ਇੱਕ ਪੂਰੇ-ਸਟੈਕ ਐਪਲਿਕੇਸ਼ਨ Azure 'ਤੇ ਡਿਪਲੌਇ ਕੀਤਾ
- ✅ ਕੋਡ ਬਦਲਾਅ ਕੀਤੇ ਅਤੇ ਮੁੜ-ਡਿਪਲੌਇ ਕੀਤਾ
- ✅ ਕਈ ਐਨਵਾਇਰਨਮੈਂਟਸ ਦਾ ਪ੍ਰਬੰਧਨ ਕੀਤਾ
- ✅ ਰਿਸੋਰਸਸ ਨੂੰ ਸਾਫ ਕੀਤਾ

## 🎯 ਕੌਸ਼ਲ ਪ੍ਰਮਾਣੀਕਰਨ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਵੱਖਰਾ ਟੈਮਪਲੇਟ ਡਿਪਲੌਇ ਕਰੋ (15 ਮਿੰਟ)
**ਉਦੇਸ਼**: azd init ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ ਦੀ ਮਾਹਰਤਾ ਦਰਸਾਉਣਾ

```bash
# Python + MongoDB ਸਟੈਕ ਨੂੰ ਆਜ਼ਮਾਓ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ਤੈਨਾਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਕੇ ਮਾਪਦੰਡ:**
- [ ] ਐਪਲਿਕੇਸ਼ਨ ਬਿਨਾਂ ਗਲਤੀਆਂ ਦੇ ਡਿਪਲੌਇ ਹੋਵੇ
- [ ] ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪਲਿਕੇਸ਼ਨ URL ਤੱਕ ਪਹੁੰਚ ਹੋ ਸਕੇ
- [ ] ਐਪਲਿਕੇਸ਼ਨ ਠੀਕ ਕੰਮ ਕਰਦੀ ਹੋਵੇ (todo ਜੋੜੋ/ਹਟਾਓ)
- [ ] ਸਾਰੇ ਰਿਸੋਰਸਸ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ ਕੀਤੇ ਗਏ ਹੋਣ

### ਅਭਿਆਸ 2: ਕੰਫਿਗਰੇਸ਼ਨ ਕਸਟਮਾਈਜ਼ ਕਰੋ (20 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਕੰਫਿਗਰੇਸ਼ਨ ਦਾ ਅਭਿਆਸ

```bash
cd my-first-azd-app

# ਕਸਟਮ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new custom-config

# ਕਸਟਮ ਵੇਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ਵੇਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values | grep APP_TITLE

# ਕਸਟਮ ਸੰਰਚਨਾ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
azd up
```

**ਸਫਲਤਾ ਕੇ ਮਾਪਦੰਡ:**
- [ ] ਕਸਟਮ ਐਨਵਾਇਰਨਮੈਂਟ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ
- [ ] ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਸ ਸੈਟ ਅਤੇ ਪ੍ਰਾਪਤਯੋਗ ਹਨ
- [ ] ਐਪਲਿਕੇਸ਼ਨ ਕਸਟਮ ਕੰਫਿਗਰੇਸ਼ਨ ਨਾਲ ਡਿਪਲੌਇ ਹੁੰਦੀ ਹੈ
- [ ] ਡਿਪਲੌਇਡ ਐਪ ਵਿੱਚ ਕਸਟਮ ਸੈਟਿੰਗਸ ਦੀ ਜਾਂਚ ਕੀਤੀ ਜਾ ਸਕੇ

### ਅਭਿਆਸ 3: ਮਲਟੀ-ਐਨਵਾਇਰਨਮੈਂਟ ਵਰਕਫਲੋ (25 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਐਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਵਿੱਚ ਮਾਹਰਤਾ

```bash
# ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਨ ਬਣਾਓ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ਡਿਵੈਲਪਮੈਂਟ URL ਨੋਟ ਕਰੋ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਨ ਬਣਾਓ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ਸਟੇਜਿੰਗ URL ਨੋਟ ਕਰੋ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ਵਾਤਾਵਰਨਾਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
azd env list

# ਦੋਹਾਂ ਵਾਤਾਵਰਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# ਦੋਹਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**ਸਫਲਤਾ ਕੇ ਮਾਪਦੰਡ:**
- [ ] ਦੋ ਐਨਵਾਇਰਨਮੈਂਟ ਵੱਖ-ਵੱਖ ਕੰਫਿਗਰੇਸ਼ਨਾਂ ਨਾਲ ਬਣਾਏ ਗਏ
- [ ] ਦੋਹਾਂ ਐਨਵਾਇਰਨਮੈਂਟਸ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੌਇ ਹੋਏ
- [ ] `azd env select` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਵਿੱਚ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ
- [ ] ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਸ ਵੱਖ-ਵੱਖ ਹਨ
- [ ] ਦੋਹਾਂ ਐਨਵਾਇਰਨਮੈਂਟਸ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ ਕੀਤੇ ਗਏ

## 📊 ਤੁਹਾਡੀ ਪ੍ਰਗਤੀ

**ਲੱਗਾਇਆ ਗਿਆ ਸਮਾਂ**: ~60-90 ਮਿੰਟ  
**ਹਾਸਲ ਕੀਤੇ ਹੁਨਰ**:
- ✅ ਟੈਮਪਲੇਟ-ਆਧਾਰਤ ਪ੍ਰੋਜੈਕਟ ਇਨੀਸ਼ੀਅਲਾਈਜੇਸ਼ਨ
- ✅ Azure ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ✅ ਐਪਲਿਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ
- ✅ ਐਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ
- ✅ ਕੰਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ
- ✅ ਰਿਸੋਰਸ ਕਲੀਨਅਪ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ

**ਅਗਲਾ ਪੱਧਰ**: ਤੁਸੀਂ [ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਗਾਈਡ](configuration.md) ਲਈ ਤਿਆਰ ਹੋ ਉੱਚ-ਸਤਹ ਕੰਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ ਸਿੱਖਣ ਲਈ!

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੇ ਹੱਲ

### ਪ੍ਰਮਾਣੀਕਰਨ ਦੇ ਗਲਤੀਆਂ
```bash
# Azure ਨਾਲ ਦੁਬਾਰਾ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ
az login

# ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਪਹੁੰਚ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az account show
```

### ਡਿਪਲੌਇਮੈਂਟ ਦੀਆਂ ਨਾਕਾਮੀਆਂ
```bash
# ਡੀਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd up --debug

# Azure ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# Container Apps ਲਈ, Azure CLI ਦਾ ਇਸਤੇਮਾਲ ਕਰੋ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ਰਿਸੋਰਸ ਨਾਮ ਟਕਰਾਅ
```bash
# ਇੱਕ ਵਿਲੱਖਣ ਇਨਵਾਇਰਨਮੈਂਟ ਨਾਮ ਵਰਤੋ
azd env new dev-$(whoami)-$(date +%s)
```

### ਪੋਰਟ/ਨੈੱਟਵਰਕ ਸਮੱਸਿਆਵਾਂ
```bash
# ਜਾਂਚੋ ਕਿ ਪੋਰਟਾਂ ਉਪਲਬਧ ਹਨ
netstat -an | grep :3000
netstat -an | grep :3100
```

## ਅਗਲੇ ਕਦਮ

ਹੁਣ ਜਦੋਂ ਕਿ ਤੁਸੀਂ ਆਪਣਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ مکمل ਕਰ ਲਿਆ ਹੈ, ਇਹ ਉੱਚ-ਸਤਹ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ:

### 1. ਇੰਫਰਾਸਟਰੱਕਚਰ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ਸੈਟ ਅਪ ਕਰੋ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਪੂਰੇ CI/CD ਵਰਕਫਲੋ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. ਉਤਪਾਦਨ ਲਈ ਸਰੋਤਾਂ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਸੁਰੱਖਿਆ, ਪ੍ਰਦਰਸ਼ਨ, ਅਤੇ ਮਾਨੀਟਰਿੰਗ

### 4. ਹੋਰ ਟੈਮਪਲੇਟ ਖੋਜੋ
```bash
# ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ ਟੈਮਪਲੇਟ ਬਰਾਊਜ਼ ਕਰੋ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ਵੱਖ-ਵੱਖ ਤਕਨੀਕੀ ਸਟੈਕ ਅਜ਼ਮਾਓ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ਵਾਧੂ ਸਰੋਤ

### ਸਿਖਲਾਈ ਸਮੱਗਰੀ
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

**ਤੁਹਾਡੇ ਪਹਿਲੇ azd ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਪੂਰਾ ਕਰਨ 'ਤੇ ਵਧਾਈਆਂ!** ਹੁਣ ਤੁਸੀਂ ਭਰੋਸੇ ਨਾਲ Azure 'ਤੇ ਸ਼ਾਨਦਾਰ ਐਪਲਿਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ।

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ](installation.md)
- **➡️ ਅਗਲਾ**: [ਕਨਫ਼ਿਗਰੇਸ਼ਨ](configuration.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 2: AI-ਪਹਿਲਾ ਡਿਵੈਲਪਮੈਂਟ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **ਅਗਲਾ ਪਾਠ**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀਅਤ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸ਼ੁੱਧਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਉਤਪੰਨ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->