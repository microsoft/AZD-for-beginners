# ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ਅਗਲਾ**: [Debugging Guide](debugging.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ Azure Developer CLI ਵਰਤਣ ਸਮੇਂ ਆਮ ਤੌਰ 'ਤੇ ਦਰਪੇਸ਼ ਆਉਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ ਦਾ ਕਵਰ ਕਰਦੀ ਹੈ। ਪ੍ਰਮਾਣਿਕਤਾ, ਡਿਪਲੌਇਮੈਂਟ, ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਸੰਰਚਨਾ ਨਾਲ ਸੰਬੰਧਤ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਨਿਧਾਨ ਲਗਾਉਣ, ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨ ਅਤੇ ਹੱਲ ਕਰਨ ਦੇ ਤਰੀਕੇ ਜਾਣੋ। ਹਰ ਸਮੱਸਿਆ ਵਿੱਚ ਵਿਸਥਾਰਪੂਰਵਕ ਲੱਛਣ, ਮੂਲ ਕਾਰਨ ਅਤੇ ਕਦਮ-ਦਰ-ਕਦਮ ਹੱਲ ਦਿੱਤੇ ਗਏ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ ਤੁਸੀਂ:
- Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਲਈ ਡਾਇਗਨੋਸਟਿਕ ਤਕਨੀਕਾਂ 'ਤੇ ਮਾਹਿਰ ਹੋਵੋਗੇ
- ਆਮ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਹੱਲ ਨੂੰ ਸਮਝੋਗੇ
- ਡਿਪਲੌਇਮੈਂਟ ਫੇਲਿਅਰ, ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ایرਰਾਂ ਅਤੇ ਸੰਰਚਨਾ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰਨਾ ਸਿੱਖੋਗੇ
- ਪ੍ਰੋਐਕਟਿਵ ਮਾਨੀਟਰਨਿੰਗ ਅਤੇ ਡਿਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋਗੇ
- ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਲਈ ਪ੍ਰਣਾਲੀਬੱਧ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਮੇਥਡੋਲਾਜੀਜ਼ ਲਾਗੂ ਕਰੋਗੇ
- ਭਵਿੱਖ ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਰੋਕਣ ਲਈ ਠੀਕ ਲੌਗਿੰਗ ਅਤੇ ਮਾਨੀਟਰਨਿੰਗ ਸੰਰਚਨਾ ਬਣਾਓਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉਪਰੰਤ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਬਿਲਟ-ਇਨ ਡਾਇਗਨੋਸਟਿਕ ਟੂਲਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਦੀ ਤਸ਼ਖੀਸ ਕਰਨ ਲਈ
- ਪ੍ਰਮਾਣਿਕਤਾ, ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਅਤੇ ਅਨੁਮਤੀ-ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਹੱਲ ਕਰਨ ਲਈ
- ਡਿਪਲੌਇਮੈਂਟ ਫੇਲਿਅਰਾਂ ਅਤੇ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ایرਰਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨ ਲਈ
- ਐਪਲੀਕੇਸ਼ਨ ਸੰਰਚਨਾ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਵਾਤਾਵਰਨ-ਨਿਰਧਾਰਤ ਸਮੱਸਿਆਵਾਂ ਦਾ ਡਿਬੱਗ ਕਰਨ ਲਈ
- ਸੰਭਾਵਿਤ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਹਿਲਾਂ ਤੋਂ ਪਹਚਾਨ ਲਈ ਮਾਨੀਟਰਨਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਲਾਗੂ ਕਰਨ ਲਈ
- ਲੌਗਿੰਗ, ਡਿਬੱਗਿੰਗ ਅਤੇ ਸਮੱਸਿਆ ਹੱਲ ਵਰਕਫਲੋ ਲਈ ਸਰੋਤਾਂ ਦੀਆਂ ਬਿਹਤਰੀਨ ਅਮਲਾਂ ਨੂੰ Lagu ਕਰਨ ਲਈ

## ਤੁਰੰਤ ਡਾਇਗਨੋਸਟਿਕ

ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਵਿਚ ਡੁੱਬਣ ਤੋਂ ਪਹਿਲਾਂ, ਨਿਧਾਨ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਨ ਲਈ ਇਹ ਕਮਾਂਡਾਂ ਚਲਾਓ:

```bash
# azd ਵਰਜਨ ਅਤੇ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd version
azd config show

# Azure ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az account show
az account list

# ਮੌਜੂਦਾ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
azd env list
azd env get-values

# ਡਿਬੱਗ ਲੌਗਿੰਗ ਨੂੰ ਯੋਗ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug
```

## ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: "Failed to get access token"
**ਲੱਛਣ:**
- `azd up` ਪ੍ਰਮਾਣਿਕਤਾ ਗਲਤੀਆਂ ਨਾਲ ਅਸਫਲ ਹੁੰਦਾ ਹੈ
- ਕਮਾਂਡਾਂ "unauthorized" ਜਾਂ "access denied" ਵਾਪਸ ਕਰਦੀਆਂ ਹਨ

**ਹੱਲ:**
```bash
# 1. Azure CLI ਨਾਲ ਦੁਬਾਰਾ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ
az login
az account show

# 2. ਕੈਸ਼ ਕੀਤੇ ਗਏ ਪ੍ਰਮਾਣ ਪੱਤਰ ਸਾਫ਼ ਕਰੋ
az account clear
az login

# 3. ਡਿਵਾਈਸ ਕੋਡ ਫਲੋ ਵਰਤੋ (ਹੈਡਲੈਸ ਸਿਸਟਮਾਂ ਲਈ)
az login --use-device-code

# 4. ਖਾਸ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ਸਮੱਸਿਆ: "Insufficient privileges" deployment ਦੌਰਾਨ
**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਅਨੁਮਤੀ ਵਿਸ਼ਿਆਂ ਕਾਰਨ ਅਸਫਲ ਹੁੰਦਾ ਹੈ
- ਕੁਝ Azure ਸਰੋਤ ਬਣਾਉਣ ਨਹੀਂ ਸੱਕਦੇ

**ਹੱਲ:**
```bash
# 1. ਆਪਣੇ Azure ਰੋਲ ਅਸਾਈਨਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਲੋੜੀਂਦੇ ਰੋਲ ਹਨ
# - Contributor (ਸੰਸਾਧਨ ਬਣਾਉਣ ਲਈ)
# - User Access Administrator (ਰੋਲ ਅਸਾਈਨਮੈਂਟ ਲਈ)

# 3. ਸਹੀ ਅਧਿਕਾਰਾਂ ਲਈ ਆਪਣੇ Azure ਪ੍ਰਸ਼ਾਸਕ ਨਾਲ ਸੰਪਰਕ ਕਰੋ
```

### ਸਮੱਸਿਆ: ਮਲਟੀ-ਟੇਨੈਂਟ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ
**ਹੱਲ:**
```bash
# 1. ਖਾਸ ਟੇਨੈਂਟ ਨਾਲ ਲਾਗਇਨ ਕਰੋ
az login --tenant "your-tenant-id"

# 2. ਸੰਰਚਨਾ ਵਿੱਚ ਟੇਨੈਂਟ ਸੈੱਟ ਕਰੋ
azd config set auth.tenantId "your-tenant-id"

# 3. ਜੇ ਟੇਨੈਂਟ ਬਦਲ ਰਹੇ ਹੋ ਤਾਂ ਟੇਨੈਂਟ ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ
az account clear
```

## 🏗️ ਇੰਫਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਤਰੁੱਟੀਆਂ

### ਸਮੱਸਿਆ: ਰਿਸੋਰਸ ਨਾਂ ਟਕਰਾਅ
**ਲੱਛਣ:**
- "The resource name already exists" ਵਗੈਰਾ ਗਲਤੀਆਂ
- ਰਿਸੋਰਸ ਬਣਾਉਣ ਦੌਰਾਨ ਡਿਪਲੌਇਮੈਂਟ ਅਸਫਲ

**ਹੱਲ:**
```bash
# 1. ਟੋਕਨਾਂ ਨਾਲ ਵਿਲੱਖਣ ਸਰੋਤ ਨਾਮ ਵਰਤੋ
# ਤੁਹਾਡੇ Bicep ਟੈਮਪਲੇਟ ਵਿੱਚ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਬਦਲੋ
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

### ਸਮੱਸਿਆ: ਸਥਾਨ/ਰੀਜਨ ਉਪਲਬਧ ਨਹੀਂ
**ਲੱਛਣ:**
- "The location 'xyz' is not available for resource type"
- ਚੁਣੀ ਹੋਈ ਰੀਜਨ ਵਿੱਚ ਕੁਝ SKUs ਉਪਲਬਧ ਨਹੀਂ

**ਹੱਲ:**
```bash
# 1. ਸਰੋਤ ਕਿਸਮਾਂ ਲਈ ਉਪਲਬਧ ਸਥਾਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ਆਮ ਤੌਰ 'ਤੇ ਉਪਲਬਧ ਖੇਤਰਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
azd config set defaults.location eastus2
# ਜਾਂ
azd env set AZURE_LOCATION eastus2

# 3. ਖੇਤਰ ਮੁਤਾਬਕ ਸੇਵਾ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
# ਵੇਖੋ: https://azure.microsoft.com/global-infrastructure/services/
```

### ਸਮੱਸਿਆ: ਕੋਟਾ ਬਰ੍ਹ ਗਿਆ (Quota exceeded) ਗਲਤੀਆਂ
**ਲੱਛਣ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**ਹੱਲ:**
```bash
# 1. ਮੌਜੂਦਾ ਕੋਟਾ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
az vm list-usage --location eastus2 -o table

# 2. Azure ਪੋਰਟਲ ਰਾਹੀਂ ਕੋਟਾ ਵਾਧੇ ਦੀ ਬੇਨਤੀ ਕਰੋ
# ਜਾਓ: ਸਬਸਕ੍ਰਿਪਸ਼ਨ > ਵਰਤੋਂ + ਕੋਟੇ

# 3. ਡਿਵੈਲਪਮੈਂਟ ਲਈ ਛੋਟੇ SKUs ਵਰਤੋ
# main.parameters.json ਵਿੱਚ:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ਬਿਨਾ ਵਰਤੋਂ ਵਾਲੇ ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ਸਮੱਸਿਆ: Bicep ਟੈਮਪਲੇਟ ਗਲਤੀਆਂ
**ਲੱਛਣ:**
- ਟੈਮਪਲੇਟ ਵੈਲਿਡੇਸ਼ਨ ਫੇਲ੍ਹ ਹੋਣਾ
- Bicep ਫਾਇਲਾਂ ਵਿੱਚ ਸਿੰਟੈਕ्स ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Bicep ਸਿੰਟੈਕਸ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az bicep build --file infra/main.bicep

# 2. Bicep ਲਿੰਟਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
az bicep lint --file infra/main.bicep

# 3. ਪੈਰਾਮੀਟਰ ਫਾਇਲ ਦੇ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
cat infra/main.parameters.json | jq '.'

# 4. ਡਿਪਲੋਇਮੈਂਟ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰੀਵਿਊ ਕਰੋ
azd provision --preview
```

## 🚀 ਡਿਪਲੌਇਮੈਂਟ ਅਸਫਲਤਾਵਾਂ

### ਸਮੱਸਿਆ: ਬਿਲਡ ਫੇਲਿਅਰ
**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਐਪਲੀਕੇਸ਼ਨ ਬਿਲਡ ਨਹੀਂ ਹੁੰਦੀ
- ਪੈਕੇਜ ਇੰਸਟਾਲੇਸ਼ਨ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. ਡੀਬੱਗ ਫਲੈਗ ਨਾਲ ਬਿਲਡ ਆਉਟਪੁੱਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd deploy --service web --debug

# 2. ਡਿਪਲੋਇਡ ਕੀਤੀ ਸੇਵਾ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show

# 3. ਬਿਲਡ ਨੂੰ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
cd src/web
npm install
npm run build

# 3. Node.js/Python ਦੇ ਵਰਜਨਾਂ ਦੀ ਸੰਗਤਤਾ ਜਾਂਚੋ
node --version  # Should match azure.yaml settings
python --version

# 4. ਬਿਲਡ ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ
rm -rf node_modules package-lock.json
npm install

# 5. ਜੇ ਕੰਟੇਨਰ ਵਰਤ ਰਹੇ ਹੋ ਤਾਂ Dockerfile ਚੈੱਕ ਕਰੋ
docker build -t test-image .
docker run --rm test-image
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਡਿਪਲੌਇਮੈਂਟ ਫੇਲਿਅਰ
**ਲੱਛਣ:**
- ਕੰਟੇਨਰ ਐਪਸ ਸਟਾਰਟ ਨਹੀਂ ਹੁੰਦੀਆਂ
- ਇਮੇਜ ਪੂਲ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. Docker ਬਿਲਡ ਨੂੰ ਸਥਾਨਕ ਤੌਰ ਤੇ ਟੈਸਟ ਕਰੋ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੰਟੇਨਰ ਲੌਗਜ਼ ਦੀ ਜਾਂਚ ਕਰੋ
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ਰਾਹੀਂ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --logs

# 3. ਕੰਟੇਨਰ ਰਜਿਸਟਰੀ ਦੀ ਪਹੁੰਚ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az acr login --name myregistry

# 4. ਕੰਟੇਨਰ ਐਪ ਦੀ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az containerapp show --name my-app --resource-group my-rg
```

### ਸਮੱਸਿਆ: ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਫੇਲਿਅਰ
**ਲੱਛਣ:**
- ਐਪਲੀਕੇਸ਼ਨ ਡੇਟਾਬੇਸ ਨਾਲ ਜੁੜ ਨਹੀਂ ਪਾਉਂਦੀ
- ਕਨੈਕਸ਼ਨ ਟਾਈਮਆਊਟ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. ਡੇਟਾਬੇਸ ਫਾਇਰਵਾਲ ਨਿਯਮਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ਐਪਲੀਕੇਸ਼ਨ ਤੋਂ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ
# ਆਪਣੀ ਐਪ ਵਿੱਚ ਅਸਥਾਈ ਤੌਰ 'ਤੇ ਸ਼ਾਮِل ਕਰੋ:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ਕਨੈਕਸ਼ਨ ਸਟ੍ਰਿੰਗ ਦੇ ਫਾਰਮੈਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd env get-values | grep DATABASE

# 4. ਡੇਟਾਬੇਸ ਸਰਵਰ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ਸੰਰਚਨਾ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲਜ਼ ਕੰਮ ਨਹੀਂ ਕਰ ਰਹੇ
**ਲੱਛਣ:**
- ਐਪ ਸੰਰਚਨਾ ਮੁੱਲ ਪੜ੍ਹ ਨਹੀਂ ਪਾ ਰਹੀ
- ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲਜ਼ ਖਾਲੀ ਦਿਖਾਈ ਦੇ ਰਹੇ ਹਨ

**ਹੱਲ:**
```bash
# 1. ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ ਸੈਟ ਕੀਤੇ ਗਏ ਹਨ
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ਵਿੱਚ ਵੈਰੀਏਬਲ ਦੇ ਨਾਮ ਜਾਂਚੋ
cat azure.yaml | grep -A 5 env:

# 3. ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਰੀਸਟਾਰਟ ਕਰੋ
azd deploy --service web

# 4. ਐਪ ਸਰਵਿਸ ਦੀ ਸੰਰਚਨਾ ਜਾਂਚੋ
az webapp config appsettings list --name myapp --resource-group myrg
```

### ਸਮੱਸਿਆ: SSL/TLS ਸਰਟੀਫਿਕੇਟ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- HTTPS ਕੰਮ ਨਹੀਂ ਕਰ ਰਿਹਾ
- ਸਰਟੀਫਿਕੇਟ ਵੈਲਿਡੇਸ਼ਨ ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# 1. SSL ਸਰਟੀਫਿਕੇਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az webapp config ssl list --resource-group myrg

# 2. ਸਿਰਫ HTTPS ਹੀ ਯੋਗ ਕਰੋ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. ਕਸਟਮ ਡੋਮੇਨ ਜੋੜੋ (ਜੇ ਲੋੜ ਹੋਵੇ)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ਸਮੱਸਿਆ: CORS ਸੰਰਚਨਾ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਫਰੰਟਐਂਡ API ਨੂੰ کال ਨਹੀਂ ਕਰ ਸਕਦਾ
- ਕ੍ਰੋਸ-ਓਰੀਜਿਨ ਰਿਕਵੇਸਟ ਰੋਕ ਦਿੱਤੀ ਗਈ

**ਹੱਲ:**
```bash
# 1. App Service ਲਈ CORS ਕਨਫਿਗਰ ਕਰੋ
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API ਨੂੰ CORS ਹੈਂਡਲ ਕਰਨ ਲਈ ਅਪਡੇਟ ਕਰੋ
# Express.js ਵਿੱਚ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. ਜਾਂਚੋ ਕਿ ਇਹ ਸਹੀ URLs 'ਤੇ ਚੱਲ ਰਹੇ ਹਨ
azd show
```

## 🌍 ਵਾਤਾਵਰਨ ਪ੍ਰਬੰਧਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਨ ਸਵਿੱਚਿੰਗ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਗਲਤ ਵਾਤਾਵਰਨ ਵਰਤਿਆ ਜਾ ਰਿਹਾ ਹੈ
- ਸੰਰਚਨਾ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਬਦਲੀ ਨਹੀਂ ਹੋ ਰਹੀ

**ਹੱਲ:**
```bash
# 1. ਸਾਰੇ ਵਾਤਾਵਰਣ ਦਿਖਾਓ
azd env list

# 2. ਵਾਤਾਵਰਣ ਨੂੰ ਸਪੱਸ਼ਟ ਤੌਰ 'ਤੇ ਚੁਣੋ
azd env select production

# 3. ਮੌਜੂਦਾ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
azd env list

# 4. ਜੇ ਖਰਾਬ ਹੋਵੇ ਤਾਂ ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new production-new
azd env select production-new
```

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਨ ਕਰਪਸ਼ਨ
**ਲੱਛਣ:**
- ਵਾਤਾਵਰਨ ਗਲਤ ਸਟੇਟ ਦਿਖਾ ਰਿਹਾ ਹੈ
- ਸਰੋਤ ਸੰਰਚਨਾ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ

**ਹੱਲ:**
```bash
# 1. ਵਾਤਾਵਰਨ ਦੀ ਸਥਿਤੀ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh

# 2. ਵਾਤਾਵਰਨ ਦੀ ਸੰਰਚਨਾ ਰੀਸੈੱਟ ਕਰੋ
azd env new production-reset
# ਲੋੜੀਂਦੇ ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲਾਂ ਨੂੰ ਕਾਪੀ ਕਰੋ
azd env set DATABASE_URL "your-value"

# 3. ਮੌਜੂਦਾ ਰਿਸੋਰਸਾਂ ਨੂੰ ਆਯਾਤ ਕਰੋ (ਜੇ ਸੰਭਵ ਹੋਵੇ)
# ਮੈਨੂਅਲੀ ਤੌਰ 'ਤੇ .azure/production/config.json ਨੂੰ ਰਿਸੋਰਸ ID ਨਾਲ ਅੱਪਡੇਟ ਕਰੋ
```

## 🔍 ਕਾਰਗਰਤਾ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਸਮੇਂ ਧੀਮਾ ਹੋਣਾ
**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਬਹੁਤ ਸਮਾਂ ਲੈ ਰਹੇ ਹਨ
- ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਟਾਈਮਆਊਟ

**ਹੱਲ:**
```bash
# 1. ਤੇਜ਼ ਇਟਰੇਸ਼ਨ ਲਈ ਨਿਰਧਾਰਿਤ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# 2. ਜਦੋਂ ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਬਦਲੀ ਨਾ ਹੋਵੇ ਤਾਂ ਸਿਰਫ ਕੋਡ-ਆਧਾਰਤ ਤੈਨਾਤੀ ਵਰਤੋ
azd deploy  # azd up ਨਾਲੋਂ ਤੇਜ਼

# 3. ਬਿਲਡ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ
# package.json ਵਿੱਚ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. ਰਿਸੋਰਸ ਲੋਕੇਸ਼ਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ (ਉਸੇ ਰੀਜਨ ਦੀ ਵਰਤੋਂ ਕਰੋ)
azd config set defaults.location eastus2
```

### ਸਮੱਸਿਆ: ਐਪਲੀਕੇਸ਼ਨ ਕਾਰਗਰਤਾ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਜਵਾਬ ਦੇਣ 'ਚ ਦੇਰੀ
- ਉੱਚ ਰਿਸੋਰਸ ਉਪਯੋਗ

**ਹੱਲ:**
```bash
# 1. ਸਰੋਤ ਵਧਾਓ
# main.parameters.json ਵਿੱਚ SKU ਅੱਪਡੇਟ ਕਰੋ:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights ਨਿਗਰਾਨੀ ਚਾਲੂ ਕਰੋ
azd monitor --overview

# 3. Azure ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲਾਗ ਚੈੱਕ ਕਰੋ
az webapp log tail --name myapp --resource-group myrg
# ਜਾਂ Container Apps ਲਈ:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
# ਆਪਣੀ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਵਿੱਚ Redis cache ਜੋੜੋ
```

## 🛠️ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਟੂਲ ਅਤੇ ਕਮਾਂਡਾਂ

### ਡਿਬੱਗ ਕਮਾਂਡਾਂ
```bash
# ਵਿਆਪਕ ਡੀਬੱਗਿੰਗ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd ਵਰਜਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਵੇਖੋ
azd config show

# ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ
curl -v https://myapp.azurewebsites.net/health
```

### ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# Azure CLI ਰਾਹੀਂ ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ
az webapp log tail --name myapp --resource-group myrg

# azd ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --logs
azd monitor --live

# Azure ਸੰਸਾਧਨਾਂ ਦੇ ਲੌਗ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# ਕੰਟੇਨਰ ਲੌਗ (Container Apps ਲਈ)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### ਰਿਸੋਰਸ ਜਾਂਚ
```bash
# ਸਾਰੇ ਸਰੋਤਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
az resource list --resource-group myrg -o table

# ਸਰੋਤ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az webapp show --name myapp --resource-group myrg --query state

# ਨੈੱਟਵਰਕ ਤਸ਼ਖੀਸ
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ਵਾਧੂ ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ

### ਕਦੋਂ ਐਸਕਲੇਟ ਕਰਨਾ
- ਸਾਰੀਆਂ ਕੋਸ਼ਿਸ਼ਾਂ ਦੇ ਬਾਵਜੂਦ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ ਜਾਰੀ ਰਹਿਣ
- Azure ਸਰਵਿਸਜ਼ ਨਾਲ ਸੰਬੰਧਤ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਸਮੱਸਿਆਵਾਂ
- ਬਿਲਿੰਗ ਜਾਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸੰਬੰਧੀ ਮੁੱਦੇ
- ਸੁਰੱਖਿਆ ਸੰਬੰਧੀ ਚਿੰਤਾਵਾਂ ਜਾਂ ਘਟਨਾਵਾਂ

### ਸਪੋਰਟ ਚੈਨਲ
```bash
# 1. Azure ਸੇਵਾ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure ਸਪੋਰਟ ਟਿਕਟ ਬਣਾਓ
# ਜਾਓ: https://portal.azure.com -> ਮਦਦ + ਸਹਾਇਤਾ

# 3. ਕਮਿਊਨਿਟੀ ਸਰੋਤ
# - Stack Overflow: azure-developer-cli ਟੈਗ
# - GitHub ਮੁੱਦੇ: https://github.com/Azure/azure-dev/issues
# - Microsoft ਸਵਾਲ-ਜਵਾਬ: https://learn.microsoft.com/en-us/answers/
```

### ਇਕੱਠੀ ਕਰਨ ਲਈ ਜਾਣਕਾਰੀ
ਸਹਾਇਤਾ ਨਾਲ ਸੰਪਰਕ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਇਕੱਠਾ ਕਰੋ:
- `azd version` ਆਉਟਪੁੱਟ
- `azd config show` ਆਉਟਪੁੱਟ
- `azd show` ਆਉਟਪੁੱਟ (ਮੌਜੂਦਾ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀ)
- ਐਰਰ ਸਨੇਸ਼ (ਪੂਰਾ ਟੈਕਸਟ)
- ਸਮੱਸਿਆ ਦੁਹਰਾਉਣ ਦੇ ਕਦਮ
- ਵਾਤਾਵਰਨ ਵਿਸਥਾਰ (`azd env get-values`)
- ਸਮੱਸਿਆ ਕਦੋਂ ਸ਼ੁਰੂ ਹੋਈ ਦਾ ਟਾਈਮਲਾਈਨ

### ਲੌਗ ਇਕੱਠਾ ਕਰਨ ਸਕ੍ਰਿਪਟ
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
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ਸਮੱਸਿਆ ਰੋਕਥਾਮ

### ਪੂਰਵ-ਤੈਅਨਾਤੀ ਚੈੱਕਲਿਸਟ
```bash
# 1. ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az account show

# 2. ਕੋਟੇ ਅਤੇ ਸੀਮਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az vm list-usage --location eastus2

# 3. ਟੈਮਪਲੇਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az bicep build --file infra/main.bicep

# 4. ਪਹਿਲਾਂ ਲੋਕਲ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
npm run build
npm run test

# 5. ਡ੍ਰਾਈ-ਰਨ ਡਿਪਲਾਇਮੈਂਟ ਵਰਤੋ
azd provision --preview
```

### ਮਾਨੀਟਰਨਿੰਗ ਸੈਟਅਪ
```bash
# Application Insights ਨੂੰ ਯੋਗ ਕਰੋ
# main.bicep ਵਿੱਚ ਜੋੜੋ:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# ਅਲਰਟਾਂ ਸੈਟ ਕਰੋ
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ਨਿਯਮਤ ਰੱਖ-ਰਖਾਵ
```bash
# ਸਾਪਤਾਹਿਕ ਸਿਹਤ ਜਾਂਚਾਂ
./scripts/health-check.sh

# ਮਾਸਿਕ ਲਾਗਤ ਦੀ ਸਮੀਖਿਆ
az consumption usage list --billing-period-name 202401

# ਤਿਮਾਹੀ ਸੁਰੱਖਿਆ ਸਮੀਖਿਆ
az security assessment list --resource-group myrg
```

## ਸੰਬੰਧਿਤ ਸਰੋਤ

- [Debugging Guide](debugging.md) - ਅਡਵਾਂਸਡ ਡਿਬੱਗਿੰਗ ਤਕਨੀਕਾਂ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - ਸਰੋਤ ਯੋਜਨਾ ਗਾਈਡ
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - ਸਰਵਿਸ ਟੀਅਰ ਸਿਫਾਰਸ਼ਾਂ

---

**ਟਿੱਪ**: ਇਸ ਗਾਈਡ ਨੂੰ ਬੁੱਕਮਾਰਕ ਕਰਕੇ ਰੱਖੋ ਅਤੇ ਜਦੋਂ ਵੀ ਕੋਈ ਸਮੱਸਿਆ ਆਵੇ ਇਸ ਨੂੰ ਵੇਖੋ।ਜ਼ਿਆਦਾਤਰ ਸਮੱਸਿਆਵਾਂ ਪਹਿਲਾਂ ਵੀ ਆਈਆਂ ਹਨ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਲਈ ਹੱਲ ਮੌਜੂਦ ਹਨ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **ਅਗਲਾ ਪਾਠ**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰਨ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤ੍ਰੁੱਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਅਹਿਮ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤ ਫ਼ਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਨਹੀਂ ਲੈਂਦੇ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->