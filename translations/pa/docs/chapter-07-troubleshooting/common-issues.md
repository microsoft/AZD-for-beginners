# ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ

**ਅਧਿਆਇ ਨੇਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 7 - ਸਮੱਸਿਆ ਨਿਵਾਰਨ ਅਤੇ ਡੀਬੱਗਿੰਗ
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 6: ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਸ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ਅੱਗੇ**: [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 8: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਂਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨਜ਼](../chapter-08-production/production-ai-practices.md)

## ਪਰਚਿਆ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਗਾਈਡ ਆਜ਼ੂਰ ਡਿਵੈਲਪਰ CLI ਨੂੰ ਵਰਤਦੇ ਸਮੇਂ ਆਮ ਤੌਰ 'ਤੇ ਮਿਲਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਪ੍ਰਮਾਣੀਕਰਨ, ਪ੍ਰਦਾਨਗੀ, ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ কনফਿਗਰেশন ਨਾਲ ਸੰਬੰਧਿਤ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ, ਨਿਵਾਰਣ ਅਤੇ ਹੱਲ ਸਿੱਖੋ। ਹਰ ਸਮੱਸਿਆ ਵਿੱਚ ਵਿਸਥਾਰ ਨਾਲ ਲੱਛਣ,੧ਮੂਲ ਕਾਰਨ ਅਤੇ ਕਦਮ-ਦਰ-कਦਮ ਹੱਲ ਦੇ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਦਿੱਤੀ ਗਈ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕੜੀ

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਆਜ਼ੂਰ ਡਿਵੈਲਪਰ CLI ਸਮੱਸਿਆਵਾਂ ਲਈ ਨਿਦਾਨ ਤਕਨੀਕਾਂ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ
- ਆਮ ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਅਧਿਕਾਰ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਉਹਨਾਂ ਦੇ ਹੱਲਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਪ੍ਰਦਾਨਗੀ ਦੀਆਂ ਅਸਫਲਤਾਵਾਂ, ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦੀਆਂ ਗਲਤੀਆਂ ਅਤੇ ਕਾਨਫਿਗਰেশন ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕੱਢੋਗੇ
- ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਨਿਗਰਾਨੀ ਅਤੇ ਡੀਬੱਗਿੰਗ ਅਸਤਰਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਲਈ ਸਿਸਟਮੈਟਿਕ ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਵਿੱਧੀਆਂ ਲਾਗੂ ਕਰੋਗੇ
- ਭਵਿੱਖ ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ ਤੋਂ ਬਚਣ ਲਈ ਸਹੀ ਲੋਗਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਬਿਲਟ-ਇਨ ਨਿਦਾਨੀ ਸੰਦਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਜ਼ੂਰ ਡਿਵੈਲਪਰ CLI ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਕਰੋ
- ਪ੍ਰਮਾਣੀਕਰਨ, ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਅਤੇ ਅਧਿਕਾਰ ਸਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ ਤੇ ਹੱਲ ਕਰੋ
- ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰਦਾਨਗੀ ਦੀਆਂ ਅਸਫਲਤਾਵਾਂ ਅਤੇ ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਗਲਤੀਆਂ ਦਾ ਸਮਾਧਾਨ ਕਰੋ
- ਐਪਲੀਕੇਸ਼ਨ ਕਾਨਫਿਗਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਮਾਹੌਲ-ਵਿਸ਼ੇਸ਼ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
- ਸੰਭਾਵਿਤ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਹਿਲਾਂ ਹੀ ਪਛਾਣ ਲਈ ਨਿਗਰਾਨੀ ਅਤੇ ਅਲਰਟਿੰਗ ਲਾਗੂ ਕਰੋ
- ਲੋਗਿੰਗ, ਡੀਬੱਗਿੰਗ ਅਤੇ ਸਮੱਸਿਆ ਹੱਲ ਕਾਰਜ ਪ੍ਰਵਾਹਾਂ ਲਈ ਸਰਵਸ਼੍ਰੇਸ਼ਠ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋ

## ਤੇਜ਼ ਨਿਦਾਨੀ

> ਉਦਾਹਰਨ ਨਾਂ/IDs ਨੂੰ ਆਪਣੇ ਮਾਹੌਲ ਦੇ ਮੁੱਲਾਂ ਨਾਲ ਬਦਲੋ। ਬੈਸ਼, ਬਾਈਸਪ, ਜਾਵਾਸਕ੍ਰਿਪਟ, ਅਤੇ ਪੈਰਾਮੀਟਰ-ਫਾਈਲ ਖੰਡਾਂ ਨੂੰ ਵੱਖ-ਵੱਖ ਲੇਬਲ ਕੀਤਾ ਗਿਆ ਹੈ; ਇਹ ਇੱਕ ਇਕੱਲੀ ਸਕ੍ਰਿਪਟ ਨਹੀਂ ਹਨ। ਨੁਕਸਾਨਦਾਇਕ ਪ੍ਰਕਿਰਿਆਵਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ ਅਤੇ ਨਿਦਾਨ ਵੰਡਣ ਤੋਂ ਪਹਿਲਾਂ ਰਾਜ ਰੱਖੋ। `azd monitor --logs` ਇੱਕ ਬਰਾਉਜ਼ਰ ਖੋਲ੍ਹਦਾ ਹੈ; ਇਹ ਟਰਮੀਨਲ ਲਾਗ ਸਟ੍ਰੀਮ ਨਹੀਂ ਕਰਦਾ।

ਵਿਸ਼ੇਸ਼ ਸਮੱਸਿਆਵਾਂ ਵਿੱਚ ਜਾਣ ਤੋਂ ਪਹਿਲਾਂ, ਨਿਦਾਨੀ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਨ ਲਈ ਇਹ ਹੁਕਮ ਚਲਾਓ:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## ਪ੍ਰਮਾਣੀਕਰਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: "ਐਕਸੈਸ ਟੋਕਨ ਪ੍ਰਾਪਤ ਕਰਨ ਵਿੱਚ ਅਸਫਲ"
**ਲੱਛਣ:**
- `azd up` ਪ੍ਰਮਾਣੀਕਰਨ ਗਲਤੀਆਂ ਨਾਲ ਅਸਫਲ ਰਹਿੰਦਾ ਹੈ
- ਹੁਕਮ "ਅਣਅਧਿਕ੍ਰਿਤ" ਜਾਂ "ਪਹੁੰਚ ਨਕਾਰ ਦਿੱਤੀ" ਵਾਪਸ ਕਰਦੇ ਹਨ

**ਹੱਲ:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### ਸਮੱਸਿਆ: ਪ੍ਰਦਾਨਗੀ ਦੌਰਾਨ "ਅਪਰਿਆਪਤ ਅਧਿਕਾਰ"
**ਲੱਛਣ:**
- ਪ੍ਰਦਾਨਗੀ ਅਧਿਕਾਰ ਗਲਤੀਆਂ ਨਾਲ ਅਸਫਲ ਹੁੰਦੀ ਹੈ
- ਕੁਝ ਆਜ਼ੂਰ ਸਰੋਤ ਬਣਾਉਣ ਤੋਂ ਅਸਮਰੱਥ

**ਹੱਲ:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### ਸਮੱਸਿਆ: ਮਲਟੀ-ਟੈਨੈਂਟ ਪ੍ਰਮਾਣੀਕਰਨ ਸਮੱਸਿਆਵਾਂ
**ਹੱਲ:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਗਲਤੀਆਂ

### ਸਮੱਸਿਆ: ਸਰੋਤ ਨਾਮ ਟਕਰਾਅ
**ਲੱਛਣ:**
- "ਸਰੋਤ ਦਾ ਨਾਮ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ" ਗਲਤੀਆਂ
- ਸਰੋਤ ਬਣਾਉਣ ਦੌਰਾਨ ਪ੍ਰਦਾਨਗੀ ਅਸਫਲ

**ਹੱਲ:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### ਸਮੱਸਿਆ: ਸਥਾਨ/ਖੇਤਰ ਉਪਲੱਬਧ ਨਹੀਂ ਹੈ
**ਲੱਛਣ:**
- "ਸਰੋਤ ਕਿਸਮ ਲਈ ਸਥਾਨ 'xyz' ਉਪਲਬਧ ਨਹੀਂ ਹੈ"
- ਚੁਣੇ ਖੇਤਰ ਵਿੱਚ ਕੁਝ SKU ਉਪਲੱਬਧ ਨਹੀਂ

**ਹੱਲ:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

ਸਥਾਨ ਵੇਰੀਏਬਲ ਨੂੰ ਬਦਲਣ ਨਾਲ ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਦਾ ਮਾਈਗਰੇਸ਼ਨ ਨਹੀਂ ਹੁੰਦਾ। ਮੌਜੂਦਾ ਸਰੋਤ ਗਰੁੱਪ ਜਾਂ ਸਰੋਤ ਸਥਾਨ ਬਦਲਣ ਨੂੰ ਮਨਜ਼ੂਰਣ ਨਹੀਂ ਕਰ ਸਕਦੇ; ਖੇਤਰੀ ਪ੍ਰਦਾਨਗੀ ਲਈ ਵੱਖਰਾ ਮਾਹੌਲ ਵਰਤੋਂ।

### ਸਮੱਸਿਆ: ਕੁਝੋਤਾ ਪਾਰ ਹੋਣ ਦੀਆਂ ਤਰੁੱਟੀਆਂ
**ਲੱਛਣ:**
- "ਸਰੋਤ ਕਿਸਮ ਲਈ ਕੁQuotaਾ ਪਾਰ ਹੋ ਗਿਆ"
- "ਸਰੋਤਾਂ ਦੀ ਵੱਧ ਤੋਂ ਵੱਧ ਸੰਖਿਆ ਪਾਈ ਗਈ"

**ਹੱਲ:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

ਵਿਕਾਸ ਲਈ, `infra/main.parameters.json` ਵਿੱਚ ਸਹਾਇਕ ਛੋਟਾ SKU ਚੁਣੋ:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ਸਮੱਸਿਆ: ਬਾਈਸਪ ਟੈਮਪਲੇਟ ਗਲਤੀਆਂ
**ਲੱਛਣ:**
- ਟੈਮਪਲੇਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਅਸਫਲਤਾਵਾਂ
- ਬਾਈਸਪ ਫਾਈਲਾਂ ਵਿੱਚ ਸਮਾਂਤਰੀ ਗਲਤੀਆਂ

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

## 🚀 ਪ੍ਰਦਾਨਗੀ ਅਸਫਲਤਾਵਾਂ

### ਸਮੱਸਿਆ: ਬਿਲਡ ਅਸਫਲਤਾਵਾਂ
**ਲੱਛਣ:**
- ਪ੍ਰਦਾਨਗੀ ਦੌਰਾਨ ਐਪਲੀਕੇਸ਼ਨ ਬਿਲਡ ਅਸਫਲ
- ਪੈਕੇਜ ਇੰਸਟਾਲੇਸ਼ਨ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਪ੍ਰਦਾਨਗੀ ਅਸਫਲਤਾਵਾਂ
**ਲੱਛਣ:**
- ਕੰਟੇਨਰ ਐਪ ਸਟਾਰਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ
- ਇਮੇਜ ਪੁਲ ਦੀਆਂ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### ਸਮੱਸਿਆ: ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਅਸਫਲਤਾਵਾਂ
**ਲੱਛਣ:**
- ਐਪ ਡਾਟਾਬੇਸ ਨਾਲ ਜੁੜ ਨਹੀਂ ਪਾ ਰਿਹਾ
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

## 🔧 ਕਾਨਫਿਗਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਕੰਮ ਨਹੀਂ ਕਰ ਰਹੇ
**ਲੱਛਣ:**
- ਐਪ ਕਾਨਫਿਗਰਸ਼ਨ ਮੁੱਲ ਨਹੀਂ ਪੜ੍ਹ ਸਕਦਾ
- ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਖ਼ਾਲੀ ਦਿਖਾਈ ਦੇ ਰਹੇ ਹਨ

**ਹੱਲ:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### ਸਮੱਸਿਆ: SSL/TLS ਸਰਟੀਫਿਕੇਟ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- HTTPS ਕੰਮ ਨਹੀਂ ਕਰ ਰਿਹਾ
- ਸਰਟੀਫਿਕੇਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ਸਮੱਸਿਆ: CORS ਕਾਨਫਿਗੁਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਫਰੰਟਐਂਡ API ਨੂੰ ਕਾਲ ਨਹੀਂ ਕਰ ਪਾ ਰਿਹਾ
- ਕ੍ਰਾਸ-ਉਤਪੱਤੀ ਬੇਨਤੀ ਰੋਕੀ ਗਈ

**ਹੱਲ:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. ਆਪਣੇ ਮੌਜੂਦਾ ਐਕਸਪ੍ਰੈੱਸ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਅੱਪਡੇਟ ਕਰੋ (ਜਿਸ ਵਿੱਚ `cors` ਇੰਪੋਰਟ ਕੀਤਾ ਹੋਇਆ ਹੈ):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 ਐਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਐਨਵਾਇਰਨਮੈਂਟ ਸਵਿੱਚਿੰਗ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਗਲਤ ਐਨਵਾਇਰਨਮੈਂਟ ਵਰਤਿਆ ਜਾ ਰਿਹਾ ਹੈ
- ਕਾਨਫਿਗਰਸ਼ਨ ਠੀਕ ਤਰ੍ਹਾਂ ਨਹੀਂ ਬਦਲ ਰਿਹਾ

**ਹੱਲ:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### ਸਮੱਸਿਆ: ਐਨਵਾਇਰਨਮੈਂਟ ਕਰਪਸ਼ਨ
**ਲੱਛਣ:**
- ਐਨਵਾਇਰਨਮੈਂਟ ਗਲਤ ਹਾਲਤ ਦਿਖਾ ਰਿਹਾ ਹੈ
- ਸਰੋਤ ਕਾਨਫਿਗਰਸ਼ਨ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ

**ਹੱਲ:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਪ੍ਰਦਾਨਗੀ ਲਈ ਦੇਰ
**ਲੱਛਣ:**
- ਪ੍ਰਦਾਨਗੀਆਂ ਲੰਬਾ ਸਮਾਂ ਲੈ ਰਹੀਆਂ ਹਨ
- ਪ੍ਰਦਾਨਗੀ ਦੌਰਾਨ ਸਮਾਂ ਸੀਮਾ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### ਸਮੱਸਿਆ: ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਜਵਾਬ ਦੇਣ ਦੀ ਗਤੀ ਹੌਲੀ
- ਵੱਧ ਸਰੋਤ ਵਰਤੋਂ

**ਹੱਲ:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ ਸਮੱਸਿਆ ਨਿਵਾਰਨ ਸੰਦ ਅਤੇ ਹੁਕਮ

### ਡੀਬੱਗ ਹੁਕਮ
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ਲਾਗ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

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

## 🆘 ਵਾਧੂ ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਕਰਨਾ

### ਕਦੋਂ ਐਸਕਲੇਟ ਕਰਨਾ ਹੈ
- ਸਮੱਸਿਆ ਲੱਗਾਤਾਰ ਰਹਿੰਦੀ ਹੈ ਤਾਂ ਸਭ ਹੱਲਾਂ ਕਰਨ ਤੋਂ ਬਾਅਦ ਵੀ
- ਆਜ਼ੂਰ ਸੇਵਾਵਾਂ ਨਾਲ ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਸਮੱਸਿਆਵਾਂ
- ਬਿਲਿੰਗ ਜਾਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸਬੰਧੀ ਸਮੱਸਿਆਵਾਂ
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

### ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਨ ਲਈ
ਸਹਾਇਤਾ ਨਾਲ ਸੰਪਰਕ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਇਕੱਠੇ ਕਰੋ:
- `azd version` ਆਉਟਪੁੱਟ
- `azd config show` ਆਉਟਪੁੱਟ
- `azd show` ਆਉਟਪੁੱਟ (ਮੌਜੂਦਾ ਪ੍ਰਦਾਨਗੀ ਸਥਿਤੀ)
- ਗਲਤੀ ਦੇ ਸੁਨੇਹੇ (ਪੂਰਾ ਟੈਕਸਟ)
- ਸਮੱਸਿਆ ਨੂੰ ਦੁਹਰਾਉਣ ਲਈ ਕਦਮ
- ਜਾਣ-ਪਛਾਣ ਦਿਤੀਆਂ ਜਾਣਕਾਰੀਆਂ ਦਾ ਰੂਪ ਰਿਹਾ (ਕਦੇ ਵੀ ਕੱਚੇ `azd env get-values` ਨਾ ਸਾਂਝੇ ਕਰੋ, ਜੋ ਰਾਜ ਰੱਖ ਸਕਦੇ ਹਨ)
- ਸਮੱਸਿਆ ਕਦੋਂ ਸ਼ੁਰੂ ਹੋਈ ਸੀ ਉਸਦਾ ਰੂਪਰੇਖਾ

### ਲਾਗ ਸੰਗ੍ਰਹਿ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ਸਮੱਸਿਆ ਰੋਧ

### ਪ੍ਰਦਾਨਗੀ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਜਾਂਚ ਸੂਚੀ
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

### ਨਿਗਰਾਨੀ ਸੈਟਅਪ
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### ਨਿਯਮਤ ਬਰਕਰਾਰੀ
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## ਸਬੰਧਤ ਸਰੋਤ

- [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md) - ਉੱਨਤ ਡੀਬੱਗਿੰਗ ਤਕਨੀਕਾਂ
- [ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਰੋਤ](../chapter-04-infrastructure/provisioning.md) - ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਸਮੱਸਿਆ ਨਿਵਾਰਣ
- [ਕੈਪੇਸਿਟੀ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਸਰੋਤ ਯੋਜਨਾ ਮਾਰਗਦਰਸ਼ਨ
- [SKU ਚੋਣ](../chapter-06-pre-deployment/sku-selection.md) - ਸੇਵਾ ਟੀਅਰ ਸਿਫਾਰਸ਼ਾਂ

---

**ਸੁਝਾਅ**: ਇਸ ਗਾਈਡ ਨੂੰ ਬੁੱਕਮਾਰਕ ਕਰਕੇ ਰੱਖੋ ਅਤੇ ਜਦੋਂ ਵੀ ਤੁਸੀਂ ਸਮੱਸਿਆਵਾਂ ਸਾਮ੍ਹਣੇ ਆਉਣ, ਇਸ ਨੂੰ ਸੰਦਾਰਭ ਕਰੋ। ਜ਼ਿਆਦਾਤਰ ਸਮੱਸਿਆਵਾਂ ਪਹਿਲਾਂ ਵੀ ਵੇਖੀਆਂ ਗਈਆਂ ਹਨ ਅਤੇ ਉਹਨਾਂ ਦੇ ਹੱਲ ਲਭ ਚੁਕੇ ਹਨ!

---

**ਨੇਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਸਬਕ**: [ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਰੋਤ](../chapter-04-infrastructure/provisioning.md)
- **ਅਗਲਾ ਸਬਕ**: [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->