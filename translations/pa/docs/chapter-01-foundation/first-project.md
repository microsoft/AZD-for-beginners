# ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ - ਹੱਥਾਂ-ਉੱਤੇ ਟਿਊਟੋਰਿਯਲ

**ਅਧਿਆਇ ਨੇਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [ਇਨਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ](installation.md)
- **➡️ ਅਗਲਾ**: [ਆਪਣਾ ਐਪ ਲਿਆਓ](bring-your-own-app.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਪਰਚਿਆ

ਤੁਹਾਡਾ ਪਹਿਲਾ Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਸਵਾਗਤ ਹੈ! ਤੁਸੀਂ ਇੱਕ todo ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ React ਫਰੰਟਐਂਡ, Node.js API ਅਤੇ Azure Cosmos DB ਨਾਲ ਤਿਆਰ ਕਰੋਗੇ। ਟੈਮਪਲੇਟ ਪੁਰਾਣਾ ਨਾਮ `todo-nodejs-mongo` ਰੱਖਦਾ ਹੈ; ਇਸ ਦਾ ਮੌਜੂਦਾ ਢਾਂਚਾ Cosmos DB ਲਈ NoSQL ਵਰਤਦਾ ਹੈ, ਇਸ ਲਈ ਡਾਊਨਲੋਡ ਕੀਤਾ README ਅਤੇ `infra/` ਨੂੰ ਵੇਖੋ ਬਜਾਏ ਕਿ ਨਾਵ ਤੋਂ ਡੈਟਾਬੇਸ API ਬਾਰੇ ਅਨੁਮਾਨ ਲਾਉਣ ਦੇ।

> ਨਵੰਬਰ 2026 ਵਿੱਚ `azd 1.37.2` ਅਤੇ ਪਬਲਿਕ ਟੈਮਪਲੇਟ ਦੇ ਮੁਕਾਬਲੇ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ। ਹੇਠਾਂ ਦਿੱਤੇ ਉਦਾਹਰਨਾਂ ਵਿੱਚ Bash ਵਰਤੀ ਗਈ ਹੈ; JSON ਨਿਕਾਲਣ ਲਈ ਵੀ `jq` ਦੀ ਲੋੜ ਹੈ। Azure ਡਿਪਲੌਏਮੈਂਟ ਚਾਰਜ ਹੁੰਦੇ ਹਨ ਅਤੇ ਇਸ ਸਮੀਖਿਆ ਦੌਰਾਨ ਨਹੀਂ ਕੀਤੇ ਗਏ।

## ਸਿੱਖਣ ਦੇ ਟੀਚੇ

ਇਸ ਟਿਊਟੋਰਿਯਲ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- ਟੈਮਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ azd ਪ੍ਰੋਜੈਕਟ ਇਨਿਸ਼ੀਅਲਾਈਜ਼ੇਸ਼ਨ ਵਰਕਫਲੋ ਵਿੱਚ ਮਾਹਿਰ ਹੋ ਜਾਵੋਗੇ
- Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਅਤੇ ਸੰਰਚਨਾ ਫਾਈਲਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਢਾਂਚਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨਾਲ ਪੂਰੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure ਵਿੱਚ ਤਿਆਰ ਕਰੋਗੇ
- ਐਪਲੀਕੇਸ਼ਨ ਅੱਪਡੇਟ ਅਤੇ ਮੁੜ-ਡਿਪਲੌਏਮੈਂਟ ਯੋਜਨਾਵਾਂ ਲਾਗੂ ਕਰੋਗੇ
- ਵਿਕਾਸ ਅਤੇ ਸਟੇਜਿੰਗ ਲਈ ਕਈ ਵਾਤਾਵਰਣ ਸੰਭਾਲੋਗੇ
- ਸਰੋਤ ਸਾਫ਼-ਸੁਥਰਾ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਹੋਣ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਖੁਦਮੁਖਤਿਆਰ ਤੌਰ 'ਤੇ ਟੈਮਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਅਤੇ ਸੰਰਚਿਤ ਕਰਨਾ
- ਪ੍ਰਭਾਵਸ਼ালী ਤਰੀਕੇ ਨਾਲ azd ਪ੍ਰੋਜੈਕਟ ਸਰੰਜਾਮ ਨੂੰ ਨੈਵੀਗੇਟ ਅਤੇ ਸਾਂਭਣਾ
- ਇੱਕ ਹੁਕਮ ਨਾਲ ਪੂਰੇ ਸਥਰ ਐਪਲੀਕੇਸ਼ਨ Azure ਤੇ ਤਿਆਰ ਕਰਨਾ
- ਆਮ ਤਰ੍ਹਾਂ ਡਿਪਲੌਏਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ਮੁੱਦੇ ਹੱਲ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਤਹਿ Azure ਵਾਤਾਵਰਣ ਸੰਭਾਲਣਾ
- ਐਪਲੀਕੇਸ਼ਨ ਅੱਪਡੇਟਾਂ ਲਈ ਲਗਾਤਾਰ ਡਿਪਲੌਏਮੈਂਟ ਵਰਕਫਲੋ ਲਾਗੂ ਕਰਨਾ

## ਸ਼ੁਰੂਆਤ

### ਲੋੜੀਂਦਾ ਚੈੱਕਲਿਸਟ
- ✅ Azure Developer CLI ਇੰਸਟਾਲ ਕੀਤਾ ([ਇਨਸਟਾਲੇਸ਼ਨ ਗਾਈਡ](installation.md))
- ✅ AZD ਪ੍ਰਮਾਣਿਕਤਾ `azd auth login` ਨਾਲ ਪੂਰੀ ਕੀਤੀ
- ✅ ਆਪਣੇ ਸਿਸਟਮ ਤੇ Git ਇੰਸਟਾਲ ਕੀਤਾ
- ✅ Node.js 22 LTS (ਜਾਂ ਡਾਊਨਲੋਡ ਕੀਤੇ ਟੈਮਪਲੇਟ ਲਈ ਸਹਾਇਕ ਵਰਜਨ)
- ✅ Visual Studio Code (ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਗਈ)

ਜਾਰੀ ਰੱਖਣ ਤੋਂ ਪਹਿਲਾਂ, ਰਿਪੋਜ਼ਟਰੀ ਰੂਟ ਤੋਂ ਸੈਟਅੱਪ ਵੈਲਿਡੇਟਰ ਚਲਾਓ:

**ਵਿੰਡੋਜ਼:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ਤੁਹਾਡੇ ਸੈਟਅੱਪ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ਵਿਕਲਪੀ Azure CLI ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ

```bash
az account show
```

### Node.js ਵਰਜਨ ਚੈੱਕ ਕਰੋ
```bash
node --version
```

## ਕਦਮ 1: ਟੈਮਪਲੇਟ ਚੁਣੋ ਅਤੇ ਸ਼ੁਰੂ ਕਰੋ

ਆਓ ਇੱਕ ਲੋਕਪ੍ਰਿਯ todo ਐਪਲੀਕੇਸ਼ਨ ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੀਏ, ਜੋ React ਫਰੰਟਐਂਡ ਅਤੇ Node.js API ਬੈਕਐਂਡ ਸ਼ਾਮਿਲ ਕਰਦਾ ਹੈ।

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ਕੀ ਹੁਇਆ?
- ਟੈਮਪਲੇਟ ਕੋਡ ਤੁਹਾਡੇ ਲੋਕਲ ਡਾਇਰੇਕਟਰੀ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ
- ਸਰਵਿਸ ਪਰਿਭਾਸ਼ਾਵਾਂ ਵਾਲੀ `azure.yaml` ਫਾਈਲ ਬਣਾਈ
- `infra/` ਡਾਇਰੇਕਟਰੀ ਵਿੱਚ ਢਾਂਚਾਗਤ ਕੋਡ ਸੈੱਟਅੱਪ ਕੀਤਾ
- ਵਾਤਾਵਰਣ ਸੰਰਚਨਾ ਬਣਾਈ

## ਕਦਮ 2: ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ

ਆਓ ਵੇਖੀਏ ਕਿ azd ਨੇ ਸਾਡੇ ਲਈ ਕੀ ਬਣਾਇਆ ਹੈ:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

ਤੁਹਾਨੂੰ ਇਹ ਵਿਖਾਈ ਦੇਣਾ ਚਾਹੀਦਾ ਹੈ:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ਸਮਝਣ ਲਈ ਮੁੱਖ ਫਾਈਲਾਂ

**azure.yaml** - ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਮਨ:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - ਢਾਂਚਾਗਤ ਪਰਿਭਾਸ਼ਾ:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ਕਦਮ 3: ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਨੂੰ حسب-ਜ਼ਰੂਰਤ ਬਦਲੋ (ਵਿਕਲਪੀ)

ਤਿਆਰ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਸੀਂ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਕस्टਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ:

### ਫਰੰਟਐਂਡ ਵਿੱਚ ਬਦਲਾਅ ਕਰੋ
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ਇੱਕ ਸਧਾਰਨ ਬਦਲਾਅ ਕਰੋ:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੰਰਚਿਤ ਕਰੋ
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

ਇਹ ਦੋ ਕਸਟਮ ਮੁੱਲ ਸਿਰਫ਼ ਲੋਕਲ ਸਟੋਰੇਜ ਦਿਖਾਉਂਦੇ ਹਨ। ਸਟਾਕ ਟੈਮਪਲੇਟ `WEBSITE_TITLE` ਜਾਂ `API_VERSION` ਨੂੰ ਵਰਤਦਾ ਨਹੀਂ ਹੈ, ਇਸ ਲਈ ਇਹ ਐਪ ਨੂੰ ਨਹੀਂ ਬਦਲਦੇ। ਉਪਰੋਕਤ ਸਪਸ਼ਟ ਸੋర్స్ ਸੋਧ ਪ੍ਰਦਰਸ਼ਿਤ ਸਿਰਲੇਖ ਬਦਲਦਾ ਹੈ।

## ਕਦਮ 4: Azure 'ਤੇ ਡਿਪਲੌਏ ਕਰੋ

ਹੁਣ ਮਜ਼ੇਦਾਰ ਹਿੱਸਾ - ਸਭ ਕੁਝ Azure 'ਤੇ ਡਿਪਲੌਏ ਕਰੋ!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ਡਿਪਲੌਏਮੈਂਟ ਦੌਰਾਨ ਕੀ ਹੋ ਰਿਹਾ ਹੈ?

ਵਰਕਫਲੋ ਢਾਂਚਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ ਅਤੇ ਕੋਡ ਪੈਕੇਜ/ਡਿਪਲੌਏ ਕਰਦਾ ਹੈ। ਵਿਆਖਿਆ ਸਥਿਰ ਕਰਨੀ ਲੋੜੀਦੀ ਹੈ `workflows.up` ਨੂੰ `azure.yaml` ਵਿੱਚ; ਇਸ ਟੈਮਪਲੇਟ ਵਿੱਚ ਪਹਿਲਾਂ ਪ੍ਰੋਵਿਜ਼ਨ, ਫਿਰ ਡਿਪਲੌਏ ਹੈ। ਹਰ ਟੈਮਪਲੇਟ ਲਈ ਇੱਕ ਉਨਾਂਤ ਧਾਰਾ ਕ੍ਰਮ ਤੇ ਨਿਰਭਰ ਨਾ ਕਰੋ।

### ਉਮੀਦਵਾਰ ਨਤੀਜਾ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ਕਦਮ 5: ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ

### ਆਪਣੀ ਐਪ ਤੇ ਪਹੁੰਚੋ
ਡਿਪਲੌਏਮੈਂਟ ਨਤੀਜੇ ਵਿੱਚ ਦਿੱਤੇ URL 'ਤੇ ਕਲਿਕ ਕਰੋ, ਜਾਂ ਕਦੇ ਵੀ ਪ੍ਰਾਪਤ ਕਰੋ:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo ਐਪ ਦੀ ਜਾਂਚ ਕਰੋ
1. **ਇੱਕ todo ਆਈਟਮ ਸ਼ਾਮਿਲ ਕਰੋ** - "Add Todo" ਤੇ ਕਲਿਕ ਕਰੋ ਅਤੇ ਇੱਕ ਕਾਰਜ ਦਰਜ ਕਰੋ
2. **ਪੂਰਾ ਚਿੰਨ੍ਹ ਲਗਾਓ** - ਪੂਰੇ ਹੋਏ ਆਈਟਮਾਂ ਨੂੰ ਚੈੱਕ ਕਰੋ
3. **ਆਈਟਮ ਹਟਾਓ** - ਉਹ todo ਹਟਾਓ ਜੋ ਤੁਹਾਨੂੰ ਨਹੀਂ ਚਾਹੀਦੇ

### ਆਪਣੀ ਐਪ ਦੀ ਮਾਨੀਟਰਿੰਗ ਕਰੋ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ ਆਪਣਾ ਡਿਪਲੌਏਮੈਂਟ ਸੱਚਮੁੱਚ ਸਾੜਹ ਕਰੋ

ਅੱਗੇ ਵਧਣ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਛੋਟੀ ਚੈੱਕਲਿਸਟ ਆਪਰੀਟ ਕਰੋ ਤਾਂ ਜੋ ਸਭ ਕੁਝ ਠੀਕ ਹੈ ਇਹ ਪੱਕਾ ਹੋ ਜਾਵੇ—"ਡਿਪਲੌਅਏਮੈਂਟ ਸਫਲ" ਹੈ ਇਸ ਦਾ ਅਰਥ "ਐਪ ਕੰਮ ਕਰਦੀ ਹੈ" ਨਹੀਂ:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**ਡਿਪਲੌਏਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਉਸ ਵੇਲੇ ਹੋਈ:**
- ✅ `azd show` ਇੱਕ ਪਹੁੰਚਯੋਗ ਏਂਡਪੌਇੰਟ URL ਦਿਖਾਉਂਦਾ ਹੈ
- ✅ URL ਤੁਹਾਡੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਬਿਨਾਂ ਗਲਤੀਆਂ ਖੁਲਦਾ ਹੈ
- ✅ ਮੁੱਖ ਫੀਚਰ ਕੰਮ ਕਰਦੇ ਹਨ (ਜੋੜੋ/ਪੂਰਾ ਕਰੋ/ਮਿਟਾਓ todo)
- ✅ `azd monitor --logs` ਬਿਨਾਂ ਅਣਉਮੀਦਗੀ ਕੀਤੀਆਂ ਗਲਤੀਆਂ ਦੇ ਬੇਨਤੀ ਆ ਰਹੀਆਂ ਹਨ ਦਿਖਾਉਂਦਾ ਹੈ

ਜੇਕਰ ਕੋਈ ਵੀ ਚੈੱਕ ਫੇਲ ਹੁੰਦੀ ਹੈ, ਤਾਂ [ਅਧਿਆਇ 7: ਸਮੱਸਿਆ ਸੁਲਝਾਉਣਾ](../chapter-07-troubleshooting/README.md) ਤੇ ਜਾਓ।

## ਕਦਮ 6: ਬਦਲਾਅ ਕਰੋ ਅਤੇ ਮੁੜ-ਡਿਪਲੌਏ ਕਰੋ

ਆਓ ਬਦਲਾਅ ਕਰੀਏ ਅਤੇ ਵੇਖੀਏ ਕਿ ਅੱਪਡੇਟ ਕਿਵੇਂ ਆਸਾਨ ਹੈ:

### API ਵਿੱਚ ਬਦਲਾਅ ਕਰੋ
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

ਇੱਕ ਕਸਟਮ ਜਵਾਬ ਹੈਡਰ ਸ਼ਾਮਿਲ ਕਰੋ:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ਸਿਰਫ ਕੋਡ ਬਦਲਾਅ ਨੂੰ ਡਿਪਲੌਏ ਕਰੋ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ਕਦਮ 7: ਕਈ ਵਾਤਾਵਰਣ ਸੰਭਾਲੋ

ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ ਤਾਂ ਜੋ ਉਤਪਾਦਨ ਤੋਂ ਪਹਿਲਾਂ ਬਦਲਾਅ ਟੈਸਟ ਕੀਤੇ ਜਾਣ:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### ਵਾਤਾਵਰਣ ਤੁਲਨਾ
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## ਕਦਮ 8: ਸਰੋਤ ਸਾਫ਼-ਸੁਥਰਾ ਕਰੋ

ਜਦੋਂ ਤੁਸੀਂ آزਮائش ਕਰ ਚੁੱਕੇ ਹੋ, ਤਾਂ ਲਾਗਤ ਬਚਾਉਣ ਲਈ ਸਾਫ਼-ਸੁਥਰਾ ਕਰੋ:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## ਰਵਾਇਤੀ ਐਪ ਵਿਰੁੱਧ AI-ਸੰਚਾਲਿਤ ਐਪ: ਇੱਕੋ ਵਰਕਫਲੋ

ਤੁਸੀਂ ਹੁਣੇ ਹੀ ਇੱਕ ਪਰੰਪਰਾਗਤ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਏ ਕੀਤਾ। ਪਰ ਜੇ ਤੁਸੀਂ AI-ਸੰਚਾਲਿਤ ਐਪ ਜਿਵੇਂ ਕਿ Microsoft Foundry ਮਾਡਲਾਂ ਤੇ ਮੂਲਤਿਆ ਜਾ ਰਿਹਾ ਚੈਟ ਐਪ ਤੋਂਡਿਪਲੌਏ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?

ਅਚਛੀ ਗੱਲ ਹੈ: **ਵਰਕਫਲੋ ਵਹੀ ਹੈ।**

| ਕਦਮ | ਰਵਾਇਤੀ Todo ਐਪ | AI ਚੈਟ ਐਪ |
|------|-----------------|-------------|
| ਸ਼ੁਰੂ ਕਰੋ (ਖਾਲੀ ਡਾਇਰੈਕਟਰੀ) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| ਪ੍ਰਮਾਣਿਤ ਕਰੋ | `azd auth login` | `azd auth login` |
| ਡਿਪਲੌਏ ਕਰੋ | `azd up` | `azd up` |
| ਮਾਨੀਟਰ ਕਰੋ | `azd monitor` | `azd monitor` |
| ਸਾਫ਼-ਸੁਥਰਾ ਕਰੋ | `azd down --force --purge` | `azd down --force --purge` |

ਜੀਵਨਚੱਕਰ ਕਮਾਂਡ ਇੱਕੋ ਹਨ, ਪਰ ਲੋੜੀਂਦੇ ਤੱਤ ਵੱਖ-ਵੱਖ ਹਨ। ਇਕ AI ਟੈਮਪਲੇਟ ਮਾਡਲ ਐਕਸੈਸ, ਖੇਤਰੀ ਕੁਆਟਾ, ਡੇਟਾ ਇੰਜੈਸ਼ਨ ਅਤੇ ਹੋਰ ਸੰਰਚਨਾ ਮੰਗ ਸਕਦਾ ਹੈ। ਇਸ ਦਾ README ਡਿਪਲੌਏਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਪੜ੍ਹੋ; `azd up` ਗੁੰਮ Permissions ਜਾਂ ਕੁਆਟਾ ਨਹੀਂ ਦੇ ਸਕਦਾ।

ਇਹ azd ਦਾ ਮੁੱਖ ਮੂਲ ਹੈ: **ਇੱਕ ਵਰਕਫਲੋ, ਕੋਈ ਵੀ ਕੰਮ ਭਾਰ।** ਤੁਸੀਂ ਇਸ ਟਿਊਟੋਰਿਯਲ ਵਿੱਚ ਕੀਤੇ ਕੁਸਲਤਾ - ਸ਼ੁਰੂ ਕਰਨਾ, ਡਿਪਲੌਏ ਕਰਨਾ, ਮਾਨੀਟਰ ਕਰਨਾ, ਮੁੜ-ਡਿਪਲੌਏ ਕਰਨਾ, ਅਤੇ ਸਾਫ਼-ਸੁਥਰਾ ਕਰਨਾ - AI ਐਪਲੀਕੇਸ਼ਨ ਅਤੇ ਏਜੰਟਾਂ 'ਤੇ ਬਰਾਬਰ ਲਾਗੂ ਹੁੰਦੇ ਹਨ।

---

## ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ

ਵਧਾਈ ਹੋਵੇ! ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ:
- ✅ ਇੱਕ ਟੈਮਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕੀਤਾ
- ✅ ਪ੍ਰੋਜੈਕਟ ਦਾ ਢਾਂਚਾ ਅਤੇ ਮੁੱਖ ਫਾਈਲਾਂ ਵੇਖੀਆਂ
- ✅ ਪੂਰੇ ਸਥਰ ਦੀ ਐਪਲੀਕੇਸ਼ਨ Azure ਤੇ ਡਿਪਲੌਏ ਕੀਤੀ
- ✅ ਕੋਡ ਬਦਲਾਅ ਕੀਤੇ ਅਤੇ ਮੁੜ ਡਿਪਲੌਏ ਕੀਤੀ
- ✅ ਕਈ ਵਾਤਾਵਰਣ ਸੰਭਾਲੇ
- ✅ ਸਰੋਤ ਸਾਫ਼ ਕੀਤੇ

## 🎯 ਕੁਸਲਤਾ ਪੁਸ਼ਟੀ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਵੱਖਰਾ ਟੈਮਪਲੇਟ ਡਿਪਲੌਏ ਕਰੋ (15 ਮਿੰਟ)
**ਟੀਚਾ**: azd init ਅਤੇ ਡਿਪਲੌਏਮੈਂਟ ਵਰਕਫਲੋ ਦਾ ਪ੍ਰਬੰਧ ਕਰਨ ਦਾ ਪ੍ਰਦਰਸ਼ਨ

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਬਿਨਾਂ ਗਲਤੀਆਂ ਡਿਪਲੌਏ ਹੁੰਦੀ ਹੈ
- [ ] ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਐਪ URL ਨੂੰ ਪਹੁੰਚ ਸਕਦਾ ਹੈ
- [ ] ਐਪ ਸਹੀ ਕਾਰਜ ਕਰਦੀ ਹੈ (todo ਜੋੜੋ/ਹਟਾਓ)
- [ ] ਸਾਰਿਆਂ ਸਰੋਤਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਕੀਤਾ

### ਅਭਿਆਸ 2: ਸੰਰਚਨਾ ਕਸਟਮਾਈਜ਼ ਕਰੋ (20 ਮਿੰਟ)
**ਟੀਚਾ**: ਰਨ-ਟਾਈਮ ਸੰਰਚਨਾ ਨੂੰ ਗਲਤੀ ਨਾਲ ਸਮਝੋਂ ਬਿਨਾਂ ਸਥਾਨਕ ਵਾਤਾਵਰਣ ਮੁੱਲਾਂ ਦਾ ਅਭਿਆਸ ਕਰੋ

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਕਸਟਮ ਵਾਤਾਵਰਣ ਸਫਲਤਾ ਨਾਲ ਬਣਾਇਆ ਗਿਆ
- [ ] ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕੀਤੇ ਅਤੇ ਪ੍ਰਾਪਤ ਕੀਤੇ
- [ ] `azd env get-value APP_TITLE` 출력 ਕਰਦਾ ਹੈ `My Custom Todo App`
- [ ] ਸਮਝਾ ਸਕਦੇ ਹੋ ਕਿ ਇਹ ਮੁੱਲ ਸਟਾਕ ਐਪ ਨੂੰ ਕਿਵੇਂ ਬਦਲਦੇ ਨਹੀਂ ਜਦ ਤੱਕ ਕੋਡ/ਢਾਂਚਾ ਇਹਨਾਂ ਨੂੰ ਵਰਤਦਾ ਨਾ ਹੋਵੇ

### ਅਭਿਆਸ 3: ਬਹੁ-ਵਾਤਾਵਰਣ ਵਰਕਫਲੋ (25 ਮਿੰਟ)
**ਟੀਚਾ**: ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਅਤੇ ਡਿਪਲੌਏਮੈਂਟ ਯੋਜਨਾਵਾਂ ਵਿੱਚ ਨਿਪੁੰਨ ਹੋਵੋ

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਨਾਲ ਦੋ ਵਾਤਾਵਰਣ ਬਣਾਏ
- [ ] ਦੋਹਾਂ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੌਏ ਕੀਤਾ
- [ ] `azd env select` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਵਾਤਾਵਰਣਾਂ ਵਿਚਕਾਰ ਬਦਲਾਅ ਕਰ ਸਕਦੇ ਹੋ
- [ ] ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਵੱਖ-ਵੱਖ ਹਨ
- [ ] ਦੋਹਾਂ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਕੀਤਾ

## 📊 ਤੁਹਾਡੀ ਤਰੱਕੀ

**ਸਮਾਂ ਲਾਇਆ**: ~60-90 ਮਿੰਟ  
**ਹਾਸਲ ਕੀਤੀਆਂ ਕੁਸ਼ਲਤਾਵਾਂ**:
- ✅ ਟੈਮਪਲੇਟ-ਆਧਾਰਿਤ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂਆਤ
- ✅ Azure ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਏਮੈਂਟ ਵਰਕਫਲੋ
- ✅ ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ
- ✅ ਸੰਰਚਨਾ ਪ੍ਰਬੰਧਨ
- ✅ ਸਰੋਤ ਸਾਫ਼ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ

**ਅਗਲਾ ਪੱਧਰ**: ਤਰੱਕੀਸ਼ੀਲ ਸੰਰਚਨਾ ਪੈਟਰਨ ਸਿੱਖਣ ਲਈ ਤੁਸੀਂ ਹੋਣ [Configuration Guide](../chapter-03-configuration/configuration.md) ਲਈ ਤਿਆਰ ਹੋ!

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਸੁਧਾਰ

### ਪ੍ਰਮਾਣਿਕਤਾ ਗਲਤੀਆਂ
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### ਡਿਪਲੌਏਮੈਂਟ ਅਸਫਲਤਾ
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ਸਰੋਤ ਨਾਂ ਟਕਰਾਅ
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### ਪੋਰਟ/ਨੈਟਵਰਕ ਮੁੱਦੇ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## ਅਗਲੇ ਕਦਮ

ਹੁਣ ਜਦੋਂ ਤੁਸੀਂ ਆਪਣਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ, ਇਹ ਉੱਚ ਪੱਧਰ ਦੇ ਵਿਸ਼ਿਆਂ ਦੀ ਜਾਂਚ ਕਰੋ:

### 1. ਡਿਢਾਂਚਾ ਨਿੱਜੀਕਰਨ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ਡਾਟਾਬੇਸ ਢਾਂਚਾ ਸ਼ਾਮਿਲ ਕਰੋ](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD ਸੈਟਅੱਪ ਕਰੋ
- [ਡਿਪਲੌਏਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) - ਪੂਰੇ CI/CD ਵਰਕਫਲੋ
- [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ਪਾਈਪਲਾਈਨ ਸੰਰਚਨਾ

### 3. ਉਤਪਾਦਨ ਸਿਖਲਾਈਆਂ
- [ਡਿਪਲੌਏਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) - ਸੁਰੱਖਿਆ, ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਨਿਗਰਾਨੀ

### 4. ਹੋਰ ਟੈਮਪਲੇਟਾਂ ਦੀ ਖੋਜ ਕਰੋ
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## ਵਾਧੂ ਸਰੋਤ

### ਸਿੱਖਣ ਸਮੱਗਰੀ
- [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure ਆਰਕੀਟੈਕਚਰ ਸੈਂਟਰ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ਵੈਲ-ਆਰਕੀਟੈਕਟਡ ਫਰੇਮਵਰਕ](https://learn.microsoft.com/en-us/azure/well-architected/)

### ਕਮਿਊਨਿਟੀ ਅਤੇ ਸਹਾਇਤਾ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ਟੈਮਪਲੇਟ ਅਤੇ ਉਦਾਹਰਨਾਂ
- [ਅਧਿਕਾਰਕ ਟੈਮਪਲੇਟ ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [ਕਮਿਊਨਿਟੀ ਟੈਮਪਲੇਟ ਯੋਗਦਾਨ](https://github.com/Azure/awesome-azd)
- [Todo ਟੈਮਪਲੇਟ ਸਰੋਤ](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**ਤੁਹਾਡਾ ਪਹਿਲਾ azd ਪ੍ਰੋਜੈਕਟ ਪੂਰਾ ਕਰਨ 'ਤੇ ਵਧਾਈ!** ਹੁਣ ਤੁਸੀਂ Azure 'ਤੇ ਗ਼ਜ਼ਬ ਦੀਆਂ ਐਪਲੀਕੇਸ਼ਨਾਂ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੌਏ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ।

---

**ਅਧਿਆਇ ਨੇਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [ਇਨਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ](installation.md)
- **➡️ ਅਗਲਾ**: [ਆਪਣਾ ਐਪ ਲਿਆਓ](bring-your-own-app.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->