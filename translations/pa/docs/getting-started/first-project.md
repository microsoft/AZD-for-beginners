<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:05:42+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "pa"
}
-->
# ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ - ਹੈਂਡਸ-ਆਨ ਟਿਊਟੋਰਿਅਲ

## ਪਰਿਚਯ

ਆਪਣੇ ਪਹਿਲੇ Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਸਵਾਗਤ ਹੈ! ਇਹ ਵਿਸਤ੍ਰਿਤ ਹੈਂਡਸ-ਆਨ ਟਿਊਟੋਰਿਅਲ ਤੁਹਾਨੂੰ azd ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure 'ਤੇ ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ, ਡਿਪਲੌਇ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਦੀ ਪੂਰੀ ਪ੍ਰਕਿਰਿਆ ਦਿਖਾਉਂਦਾ ਹੈ। ਤੁਸੀਂ ਇੱਕ ਅਸਲੀ ਟੂਡੂ ਐਪਲੀਕੇਸ਼ਨ 'ਤੇ ਕੰਮ ਕਰੋਗੇ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ, Node.js API ਬੈਕਐਂਡ, ਅਤੇ MongoDB ਡਾਟਾਬੇਸ ਸ਼ਾਮਲ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਟਿਊਟੋਰਿਅਲ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ azd ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰਨ ਦੀ ਵਰਕਫਲੋ ਵਿੱਚ ਮਾਹਰ ਹੋ ਜਾਵੋਗੇ
- Azure Developer CLI ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਅਤੇ ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ ਨੂੰ ਸਮਝੋਗੇ
- Azure 'ਤੇ ਪੂਰੀ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦੇ ਨਾਲ ਅੰਜ਼ਾਮ ਦੋਗੇ
- ਐਪਲੀਕੇਸ਼ਨ ਅਪਡੇਟ ਅਤੇ ਰੀਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਵਿਕਾਸ ਅਤੇ ਸਟੇਜਿੰਗ ਲਈ ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋਗੇ
- ਸਰੋਤਾਂ ਦੀ ਸਫਾਈ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਦੇ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ:
- ਟੈਂਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਵਿੱਚ ਸੁਤੰਤਰ ਹੋਵੋਗੇ
- azd ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਨੈਵੀਗੇਟ ਅਤੇ ਸੋਧ ਸਕੋਗੇ
- ਸਿੰਗਲ ਕਮਾਂਡ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੌਇ ਕਰ ਸਕੋਗੇ
- ਆਮ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰ ਸਕੋਗੇ
- ਵੱਖ-ਵੱਖ ਡਿਪਲੌਇਮੈਂਟ ਸਟੇਜਾਂ ਲਈ ਕਈ Azure ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰ ਸਕੋਗੇ
- ਐਪਲੀਕੇਸ਼ਨ ਅਪਡੇਟ ਲਈ ਲਗਾਤਾਰ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਲਾਗੂ ਕਰ ਸਕੋਗੇ

## ਸ਼ੁਰੂਆਤ ਕਰਨਾ

### ਪੂਰਵ ਸ਼ਰਤਾਂ ਦੀ ਚੈੱਕਲਿਸਟ
- ✅ Azure Developer CLI ਇੰਸਟਾਲ ਕੀਤਾ ([ਇੰਸਟਾਲੇਸ਼ਨ ਗਾਈਡ](installation.md))
- ✅ Azure CLI ਇੰਸਟਾਲ ਅਤੇ ਪ੍ਰਮਾਣਿਤ
- ✅ Git ਤੁਹਾਡੇ ਸਿਸਟਮ 'ਤੇ ਇੰਸਟਾਲ ਕੀਤਾ
- ✅ Node.js 16+ (ਇਸ ਟਿਊਟੋਰਿਅਲ ਲਈ)
- ✅ Visual Studio Code (ਸਿਫਾਰਸ਼ੀ)

### ਆਪਣੀ ਸੈਟਅਪ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
```bash
# Check azd installation
azd version
```
### Azure ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

```bash
az account show
```

### Node.js ਵਰਜਨ ਚੈੱਕ ਕਰੋ
```bash
node --version
```

## ਕਦਮ 1: ਟੈਂਪਲੇਟ ਚੁਣੋ ਅਤੇ ਸ਼ੁਰੂ ਕਰੋ

ਆਓ ਇੱਕ ਪ੍ਰਸਿੱਧ ਟੂਡੂ ਐਪਲੀਕੇਸ਼ਨ ਟੈਂਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੀਏ ਜਿਸ ਵਿੱਚ React ਫਰੰਟਐਂਡ ਅਤੇ Node.js API ਬੈਕਐਂਡ ਸ਼ਾਮਲ ਹੈ।

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ਕੀ ਹੋਇਆ?
- ਟੈਂਪਲੇਟ ਕੋਡ ਤੁਹਾਡੇ ਸਥਾਨਕ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕੀਤਾ
- ਸੇਵਾ ਦੀ ਪਰਿਭਾਸ਼ਾਵਾਂ ਨਾਲ ਇੱਕ `azure.yaml` ਫਾਈਲ ਬਣਾਈ
- `infra/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇੰਫਰਾਸਟਰਕਚਰ ਕੋਡ ਸੈਟਅਪ ਕੀਤਾ
- ਇੱਕ ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ ਬਣਾਈ

## ਕਦਮ 2: ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਦੀ ਜਾਂਚ ਕਰੋ

ਆਓ ਵੇਖੀਏ ਕਿ azd ਨੇ ਸਾਡੇ ਲਈ ਕੀ ਬਣਾਇਆ:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

ਤੁਹਾਨੂੰ ਇਹ ਦੇਖਣਾ ਚਾਹੀਦਾ ਹੈ:
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - ਇੰਫਰਾਸਟਰਕਚਰ ਦੀ ਪਰਿਭਾਸ਼ਾ:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ਕਦਮ 3: ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ (ਵਿਕਲਪਿਕ)

ਡਿਪਲੌਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਸੀਂ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ:

### ਫਰੰਟਐਂਡ ਨੂੰ ਸੋਧੋ
```bash
# Open the React app component
code src/web/src/App.tsx
```

ਇੱਕ ਸਧਾਰਨ ਬਦਲਾਅ ਕਰੋ:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਾਂ ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## ਕਦਮ 4: Azure 'ਤੇ ਡਿਪਲੌਇ ਕਰੋ

ਹੁਣ ਸਭ ਤੋਂ ਰੋਮਾਂਚਕ ਹਿੱਸਾ - ਸਭ ਕੁਝ Azure 'ਤੇ ਡਿਪਲੌਇ ਕਰੋ!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਕੀ ਹੋ ਰਿਹਾ ਹੈ?

`azd up` ਕਮਾਂਡ ਇਹ ਕਦਮ ਕਰਦੀ ਹੈ:
1. **Provision** (`azd provision`) - Azure ਸਰੋਤ ਬਣਾਉਂਦਾ ਹੈ
2. **Package** - ਤੁਹਾਡੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਬਣਾਉਂਦਾ ਹੈ
3. **Deploy** (`azd deploy`) - ਕੋਡ ਨੂੰ Azure ਸਰੋਤਾਂ 'ਤੇ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ

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

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਤੱਕ ਪਹੁੰਚ ਕਰੋ
ਡਿਪਲੌਇਮੈਂਟ ਆਉਟਪੁੱਟ ਵਿੱਚ ਦਿੱਤੇ URL 'ਤੇ ਕਲਿਕ ਕਰੋ, ਜਾਂ ਕਿਸੇ ਵੀ ਸਮੇਂ ਇਸਨੂੰ ਪ੍ਰਾਪਤ ਕਰੋ:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### ਟੂਡੂ ਐਪ ਦੀ ਜਾਂਚ ਕਰੋ
1. **ਟੂਡੂ ਆਈਟਮ ਸ਼ਾਮਲ ਕਰੋ** - "Add Todo" 'ਤੇ ਕਲਿਕ ਕਰੋ ਅਤੇ ਇੱਕ ਟਾਸਕ ਦਰਜ ਕਰੋ
2. **ਪੂਰਾ ਹੋਣ ਦੇ ਨਿਸ਼ਾਨ ਲਗਾਓ** - ਪੂਰੇ ਹੋਏ ਆਈਟਮਾਂ ਨੂੰ ਚੈੱਕ ਕਰੋ
3. **ਆਈਟਮ ਮਿਟਾਓ** - ਉਹ ਟੂਡੂ ਹਟਾਓ ਜੋ ਤੁਹਾਨੂੰ ਹੁਣ ਲੋੜੀਂਦੇ ਨਹੀਂ

### ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## ਕਦਮ 6: ਬਦਲਾਅ ਕਰੋ ਅਤੇ ਰੀਡਿਪਲੌਇ ਕਰੋ

ਆਓ ਇੱਕ ਬਦਲਾਅ ਕਰੀਏ ਅਤੇ ਵੇਖੀਏ ਕਿ ਅਪਡੇਟ ਕਰਨਾ ਕਿੰਨਾ ਆਸਾਨ ਹੈ:

### API ਨੂੰ ਸੋਧੋ
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

ਇੱਕ ਕਸਟਮ ਰਿਸਪਾਂਸ ਹੈਡਰ ਸ਼ਾਮਲ ਕਰੋ:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ਸਿਰਫ ਕੋਡ ਬਦਲਾਅ ਡਿਪਲੌਇ ਕਰੋ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ਕਦਮ 7: ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ

ਪ੍ਰੋਡਕਸ਼ਨ ਤੋਂ ਪਹਿਲਾਂ ਬਦਲਾਅ ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਇੱਕ ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ:

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

### ਵਾਤਾਵਰਣ ਦੀ ਤੁਲਨਾ
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## ਕਦਮ 8: ਸਰੋਤਾਂ ਦੀ ਸਫਾਈ ਕਰੋ

ਜਦੋਂ ਤੁਸੀਂ ਪ੍ਰਯੋਗ ਕਰਨਾ ਖਤਮ ਕਰ ਲੈਂਦੇ ਹੋ, ਤਾਂ ਚਾਰਜਾਂ ਤੋਂ ਬਚਣ ਲਈ ਸਫਾਈ ਕਰੋ:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ ਹੈ

ਮੁਬਾਰਕਾਂ! ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ:
- ਇੱਕ ਟੈਂਪਲੇਟ ਤੋਂ azd ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕੀਤਾ
- ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਅਤੇ ਮੁੱਖ ਫਾਈਲਾਂ ਦੀ ਜਾਂਚ ਕੀਤੀ
- ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੌਇ ਕੀਤਾ
- ਕੋਡ ਬਦਲਾਅ ਕੀਤੇ ਅਤੇ ਰੀਡਿਪਲੌਇ ਕੀਤਾ
- ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕੀਤਾ
- ਸਰੋਤਾਂ ਦੀ ਸਫਾਈ ਕੀਤੀ

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਪਟਾਰਾ

### ਪ੍ਰਮਾਣਿਕਤਾ ਦੀਆਂ ਗਲਤੀਆਂ
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### ਸਰੋਤ ਨਾਮ ਸੰਘਰਸ਼
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### ਪੋਰਟ/ਨੈਟਵਰਕ ਸਮੱਸਿਆਵਾਂ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## ਅਗਲੇ ਕਦਮ

ਹੁਣ ਜਦੋਂ ਤੁਸੀਂ ਆਪਣਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ, ਇਨ੍ਹਾਂ ਉੱਚ-ਸਤਰੀਆਂ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ:

### 1. ਇੰਫਰਾਸਟਰਕਚਰ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- [Infrastructure as Code](../deployment/provisioning.md)
- [ਡਾਟਾਬੇਸ, ਸਟੋਰੇਜ, ਅਤੇ ਹੋਰ ਸੇਵਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ](../deployment/provisioning.md#adding-services)

### 2. CI/CD ਸੈਟਅਪ ਕਰੋ
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. ਪ੍ਰੋਡਕਸ਼ਨ ਬਿਹਤਰ ਅਭਿਆਸ
- [ਸੁਰੱਖਿਆ ਕਨਫਿਗਰੇਸ਼ਨ](../deployment/best-practices.md#security)
- [ਪ੍ਰਦਰਸ਼ਨ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ](../deployment/best-practices.md#performance)
- [ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ](../deployment/best-practices.md#monitoring)

### 4. ਹੋਰ ਟੈਂਪਲੇਟ ਦੀ ਖੋਜ ਕਰੋ
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ਵਾਧੂ ਸਰੋਤ

### ਸਿੱਖਣ ਦੇ ਸਮੱਗਰੀ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### ਕਮਿਊਨਿਟੀ ਅਤੇ ਸਹਾਇਤਾ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ਟੈਂਪਲੇਟ ਅਤੇ ਉਦਾਹਰਨ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ਤੁਹਾਡੇ ਪਹਿਲੇ azd ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਪੂਰਾ ਕਰਨ 'ਤੇ ਮੁਬਾਰਕਾਂ!** ਹੁਣ ਤੁਸੀਂ ਭਰੋਸੇ ਨਾਲ Azure 'ਤੇ ਸ਼ਾਨਦਾਰ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ।

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [Configuration](configuration.md)
- **ਅਗਲਾ ਪਾਠ**: [Deployment Guide](../deployment/deployment-guide.md)

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਣਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।