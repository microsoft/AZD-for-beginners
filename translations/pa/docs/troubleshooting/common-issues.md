<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T19:28:56+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "pa"
}
-->
# ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ Azure Developer CLI ਵਰਤਣ ਦੌਰਾਨ ਆਮ ਤੌਰ 'ਤੇ ਆਉਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਪ੍ਰਮਾਣਿਕਤਾ, ਡਿਪਲੌਇਮੈਂਟ, ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ, ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕਨਫਿਗਰੇਸ਼ਨ ਨਾਲ ਜੁੜੀਆਂ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ, ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ, ਅਤੇ ਹੱਲ ਕਰਨ ਦੇ ਤਰੀਕੇ ਸਿੱਖੋ। ਹਰ ਸਮੱਸਿਆ ਵਿੱਚ ਵਿਸਤ੍ਰਿਤ ਲੱਛਣ, ਮੁੱਖ ਕਾਰਨ, ਅਤੇ ਕਦਮ-ਦਰ-ਕਦਮ ਹੱਲ ਦੀ ਪ੍ਰਕਿਰਿਆ ਸ਼ਾਮਲ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੁਆਰਾ, ਤੁਸੀਂ:
- Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਲਈ ਡਾਇਗਨੋਸਟਿਕ ਤਕਨੀਕਾਂ ਵਿੱਚ ਮਾਹਰ ਹੋ ਜਾਵੋਗੇ
- ਆਮ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਹੱਲ ਨੂੰ ਸਮਝੋਗੇ
- ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ, ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਗਲਤੀਆਂ, ਅਤੇ ਕਨਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- ਪ੍ਰੋ-ਐਕਟਿਵ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਡਿਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਲਈ ਪ੍ਰਣਾਲੀਬੱਧ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਵਿਧੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਭਵਿੱਖ ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਰੋਕਣ ਲਈ ਸਹੀ ਲੌਗਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਕਨਫਿਗਰ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਕਰਨ ਲਈ ਅੰਦਰੂਨੀ ਡਾਇਗਨੋਸਟਿਕ ਟੂਲਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਪ੍ਰਮਾਣਿਕਤਾ, ਸਬਸਕ੍ਰਿਪਸ਼ਨ, ਅਤੇ ਅਨੁਮਤੀ-ਸਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਖੁਦ ਹੱਲ ਕਰੋ
- ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ ਅਤੇ ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਗਲਤੀਆਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰੋ
- ਐਪਲੀਕੇਸ਼ਨ ਕਨਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡਿਬੱਗ ਕਰੋ
- ਸੰਭਾਵਿਤ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਕਰਨ ਲਈ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਲਾਗੂ ਕਰੋ
- ਲੌਗਿੰਗ, ਡਿਬੱਗਿੰਗ, ਅਤੇ ਸਮੱਸਿਆ ਹੱਲ ਕਰਨ ਦੇ ਵਰਕਫਲੋਜ਼ ਲਈ ਸ੍ਰੇਸ਼ਠ ਤਰੀਕਿਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋ

## ਤੇਜ਼ ਡਾਇਗਨੋਸਟਿਕ

ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਵਿੱਚ ਡੁੱਬਣ ਤੋਂ ਪਹਿਲਾਂ, ਡਾਇਗਨੋਸਟਿਕ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਨ ਲਈ ਇਹ ਕਮਾਂਡ ਚਲਾਓ:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: "ਐਕਸੈਸ ਟੋਕਨ ਪ੍ਰਾਪਤ ਕਰਨ ਵਿੱਚ ਅਸਫਲ"
**ਲੱਛਣ:**
- `azd up` ਪ੍ਰਮਾਣਿਕਤਾ ਗਲਤੀਆਂ ਨਾਲ ਫੇਲ੍ਹ ਹੋ ਜਾਂਦਾ ਹੈ
- ਕਮਾਂਡ "ਅਨਅਥਰਾਈਜ਼ਡ" ਜਾਂ "ਐਕਸੈਸ ਡਿਨਾਇਡ" ਵਾਪਸ ਕਰਦੀਆਂ ਹਨ

**ਹੱਲ:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ਸਮੱਸਿਆ: ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ "ਅਪਰਾਪਤ ਅਧਿਕਾਰ"
**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਅਨੁਮਤੀ ਗਲਤੀਆਂ ਨਾਲ ਫੇਲ੍ਹ ਹੋ ਜਾਂਦਾ ਹੈ
- ਕੁਝ Azure ਸਰੋਤ ਬਣਾਉਣ ਵਿੱਚ ਅਸਮਰਥ

**ਹੱਲ:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### ਸਮੱਸਿਆ: ਮਲਟੀ-ਟੈਨੈਂਟ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ
**ਹੱਲ:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਗਲਤੀਆਂ

### ਸਮੱਸਿਆ: ਸਰੋਤ ਨਾਮ ਟਕਰਾਅ
**ਲੱਛਣ:**
- "ਸਰੋਤ ਨਾਮ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ" ਗਲਤੀਆਂ
- ਸਰੋਤ ਬਣਾਉਣ ਦੌਰਾਨ ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ

**ਹੱਲ:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### ਸਮੱਸਿਆ: ਸਥਾਨ/ਖੇਤਰ ਉਪਲਬਧ ਨਹੀਂ
**ਲੱਛਣ:**
- "ਸਰੋਤ ਕਿਸਮ ਲਈ ਸਥਾਨ 'xyz' ਉਪਲਬਧ ਨਹੀਂ ਹੈ"
- ਚੁਣੇ ਗਏ ਖੇਤਰ ਵਿੱਚ ਕੁਝ SKUs ਉਪਲਬਧ ਨਹੀਂ

**ਹੱਲ:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### ਸਮੱਸਿਆ: ਕੋਟਾ ਪਾਰ ਗਲਤੀਆਂ
**ਲੱਛਣ:**
- "ਸਰੋਤ ਕਿਸਮ ਲਈ ਕੋਟਾ ਪਾਰ ਹੋਇਆ"
- "ਸਰੋਤਾਂ ਦੀ ਵੱਧ ਤੋਂ ਵੱਧ ਗਿਣਤੀ ਪਹੁੰਚ ਗਈ"

**ਹੱਲ:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ਸਮੱਸਿਆ: Bicep ਟੈਂਪਲੇਟ ਗਲਤੀਆਂ
**ਲੱਛਣ:**
- ਟੈਂਪਲੇਟ ਵੈਲੀਡੇਸ਼ਨ ਫੇਲ੍ਹ
- Bicep ਫਾਈਲਾਂ ਵਿੱਚ ਸਿੰਟੈਕਸ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ

### ਸਮੱਸਿਆ: ਬਿਲਡ ਫੇਲ੍ਹ
**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਐਪਲੀਕੇਸ਼ਨ ਬਿਲਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ
- ਪੈਕੇਜ ਇੰਸਟਾਲੇਸ਼ਨ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ
**ਲੱਛਣ:**
- ਕੰਟੇਨਰ ਐਪਸ ਸ਼ੁਰੂ ਕਰਨ ਵਿੱਚ ਅਸਫਲ
- ਇਮੇਜ ਪੂਲ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### ਸਮੱਸਿਆ: ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਫੇਲ੍ਹ
**ਲੱਛਣ:**
- ਐਪਲੀਕੇਸ਼ਨ ਡਾਟਾਬੇਸ ਨਾਲ ਕਨੈਕਟ ਨਹੀਂ ਕਰ ਸਕਦਾ
- ਕਨੈਕਸ਼ਨ ਟਾਈਮਆਉਟ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ਕਨਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਕੰਮ ਨਹੀਂ ਕਰ ਰਹੇ
**ਲੱਛਣ:**
- ਐਪ ਕਨਫਿਗਰੇਸ਼ਨ ਮੁੱਲਾਂ ਨੂੰ ਪੜ੍ਹ ਨਹੀਂ ਸਕਦਾ
- ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਖਾਲੀ ਦਿਖਾਈ ਦਿੰਦੇ ਹਨ

**ਹੱਲ:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### ਸਮੱਸਿਆ: SSL/TLS ਸਰਟੀਫਿਕੇਟ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- HTTPS ਕੰਮ ਨਹੀਂ ਕਰ ਰਿਹਾ
- ਸਰਟੀਫਿਕੇਟ ਵੈਲੀਡੇਸ਼ਨ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ਸਮੱਸਿਆ: CORS ਕਨਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਫਰੰਟਐਂਡ API ਨੂੰ ਕਾਲ ਨਹੀਂ ਕਰ ਸਕਦਾ
- ਕ੍ਰਾਸ-ਓਰਿਜਨ ਰਿਕਵੈਸਟ ਰੋਕੀ ਗਈ

**ਹੱਲ:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਣ ਸਵਿੱਚ ਕਰਨ ਦੀ ਸਮੱਸਿਆ
**ਲੱਛਣ:**
- ਗਲਤ ਵਾਤਾਵਰਣ ਵਰਤਿਆ ਜਾ ਰਿਹਾ ਹੈ
- ਕਨਫਿਗਰੇਸ਼ਨ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਸਵਿੱਚ ਨਹੀਂ ਕਰ ਰਿਹਾ

**ਹੱਲ:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਣ ਖਰਾਬੀ
**ਲੱਛਣ:**
- ਵਾਤਾਵਰਣ ਅਵੈਧ ਸਥਿਤੀ ਦਿਖਾਉਂਦਾ ਹੈ
- ਸਰੋਤ ਕਨਫਿਗਰੇਸ਼ਨ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ

**ਹੱਲ:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਡਿਪਲੌਇਮੈਂਟ ਸਮਾਂ ਸਲੋ
**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਬਹੁਤ ਜ਼ਿਆਦਾ ਸਮਾਂ ਲੈ ਰਹੇ ਹਨ
- ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਟਾਈਮਆਉਟ

**ਹੱਲ:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### ਸਮੱਸਿਆ: ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਸਲੋ ਰਿਸਪਾਂਸ ਸਮਾਂ
- ਉੱਚ ਸਰੋਤ ਵਰਤੋਂ

**ਹੱਲ:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਟੂਲ ਅਤੇ ਕਮਾਂਡ

### ਡਿਬੱਗ ਕਮਾਂਡ
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### ਸਰੋਤ ਜਾਂਚ
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ਵਾਧੂ ਮਦਦ ਪ੍ਰਾਪਤ ਕਰਨਾ

### ਕਦੋਂ ਵਧਾਉਣਾ ਹੈ
- ਸਾਰੇ ਹੱਲਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਦੇ ਬਾਅਦ ਵੀ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ ਜਾਰੀ ਹਨ
- Azure ਸੇਵਾਵਾਂ ਨਾਲ ਇੰਫਰਾਸਟਰਕਚਰ ਸਮੱਸਿਆਵਾਂ
- ਬਿਲਿੰਗ ਜਾਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸਬੰਧੀ ਸਮੱਸਿਆਵਾਂ
- ਸੁਰੱਖਿਆ ਚਿੰਤਾਵਾਂ ਜਾਂ ਘਟਨਾਵਾਂ

### ਸਹਾਇਤਾ ਚੈਨਲ
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ਇਕੱਠੀ ਕਰਨ ਲਈ ਜਾਣਕਾਰੀ
ਸਹਾਇਤਾ ਨਾਲ ਸੰਪਰਕ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਇਕੱਠਾ ਕਰੋ:
- `azd version` ਆਉਟਪੁੱਟ
- `azd info` ਆਉਟਪੁੱਟ
- ਗਲਤੀ ਸੁਨੇਹੇ (ਪੂਰਾ ਪਾਠ)
- ਸਮੱਸਿਆ ਨੂੰ ਦੁਹਰਾਉਣ ਦੇ ਕਦਮ
- ਵਾਤਾਵਰਣ ਵੇਰਵੇ (`azd env show`)
- ਸਮੱਸਿਆ ਸ਼ੁਰੂ ਹੋਣ ਦਾ ਸਮਾਂ

### ਲੌਗ ਇਕੱਠਾ ਕਰਨ ਦੀ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ਸਮੱਸਿਆ ਰੋਕਥਾਮ

### ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਚੈੱਕਲਿਸਟ
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### ਮਾਨੀਟਰਿੰਗ ਸੈਟਅਪ
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ਨਿਯਮਿਤ ਰਖਰਖਾਅ
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਡਿਬੱਗਿੰਗ ਗਾਈਡ](debugging.md) - ਉੱਚ-ਸਤਹ ਡਿਬੱਗਿੰਗ ਤਕਨੀਕਾਂ
- [ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਰੋਤ](../deployment/provisioning.md) - ਇੰਫਰਾਸਟਰਕਚਰ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ
- [ਸਮਰੱਥਾ ਯੋਜਨਾ](../pre-deployment/capacity-planning.md) - ਸਰੋਤ ਯੋਜਨਾ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼
- [SKU ਚੋਣ](../pre-deployment/sku-selection.md) - ਸੇਵਾ ਟੀਅਰ ਸਿਫਾਰਸ਼ਾਂ

---

**ਸੁਝਾਅ**: ਇਸ ਗਾਈਡ ਨੂੰ ਬੁੱਕਮਾਰਕ ਰੱਖੋ ਅਤੇ ਜਦੋਂ ਵੀ ਤੁਸੀਂ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰੋ ਤਾਂ ਇਸਨੂੰ ਵੇਖੋ। ਜ਼ਿਆਦਾਤਰ ਸਮੱਸਿਆਵਾਂ ਪਹਿਲਾਂ ਹੀ ਦੇਖੀਆਂ ਗਈਆਂ ਹਨ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਸਥਾਪਿਤ ਹੱਲ ਹਨ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਰੋਤ](../deployment/provisioning.md)
- **ਅਗਲਾ ਪਾਠ**: [ਡਿਬੱਗਿੰਗ ਗਾਈਡ](debugging.md)

---

**ਅਸਵੀਕਾਰਨਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਨਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।