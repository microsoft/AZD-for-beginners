# ਆਮ ਮੁੱਦੇ ਅਤੇ ਹੱਲ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 7 - ਸਮੱਸਿਆ ਨਿਰਾਕਰਨ ਅਤੇ ਡੀਬੱਗਿੰਗ
- **⬅️ ਪਿਛਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 6: ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕਸ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ਅੱਗੇ**: [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 8: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਂਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ](../chapter-08-production/production-ai-practices.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਦੌਰਾਨ ਆਮ ਤੌਰ 'ਤੇ ਸਾਹਮਣੇ ਆਉਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਪ੍ਰਮਾਣਿਕਤਾ, ਡਿਪਲੌਇਮੈਂਟ, ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੰਫ਼ਿਗਰੇਸ਼ਨ ਨਾਲ ਸੰਬੰਧਤ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਤਸ਼ਖੀਸ, ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਹੱਲ ਕਰਨ ਦਾ ਤਰੀਕਾ ਸਿੱਖੋ। ਹਰ ਸਮੱਸਿਆ ਵਿੱਚ ਵਿਸ਼ਤ ਲੱਛਣ, ਮੂਲ ਕਾਰਨ ਅਤੇ ਕਦਮ-ਦਰ-ਕਦਮ ਹੱਲ ਪ੍ਰੋਸੀਜਰ ਦਿੱਤੇ ਗਏ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ ਤੁਸੀਂ:
- Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਦੀ ਤਸ਼ਖੀਸ ਲਈ ਨਿਪੁੰਨ ਹੋਵੋਗੇ
- ਆਮ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਹੱਲ ਸਮਝ ਸਕੋਗੇ
- ਡਿਪਲੋਇਮੈਂਟ ਦੀਆਂ ਅਸਫਲਤਾਵਾਂ, ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਦੇ ਤਰੁਟੀਆਂ, ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰ ਸਕੋਗੇ
- ਪ੍ਰੋਐਕਟਿਵ ਨਿਗਰਾਨੀ ਅਤੇ ਡੀਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਲਈ ਪ੍ਰਣਾਲੀਬੱਧ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਵਿਧੀਆਂ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਭਵਿੱਖ ਵਿੱਚ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਰੋਕਣ ਲਈ ਢੰਗ-ਵਾਰ ਲੌਗਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਸੰਰਚਨਾ ਕਾਨਫ਼ਿਗਰ ਕਰ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਬਿਲਟ-ਇਨ ਨਿਧਾਨ ਟੂਲਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਦੀ ਤਸ਼ਖੀਸ ਕਰਨ ਲਈ
- ਪ੍ਰਮਾਣਿਕਤਾ, ਸਬਸਕ੍ਰਿਪਸ਼ਨ, ਅਤੇ ਅਧਿਕਾਰ-ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਹੱਲ ਕਰਨ ਲਈ
- ਡਿਪਲੋਇਮੈਂਟ ਦੀਆਂ ਅਸਫਲਤਾਵਾਂ ਅਤੇ ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਤਰੁਟੀਆਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨ ਲਈ
- ਐਪਲੀਕੇਸ਼ਨ ਕੰਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਵਾਤਾਵਰਨ-ਨਿਰਧਾਰਿਤ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰਨ ਲਈ
- ਸੰਭਾਵਿਤ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਪਹਿਲਾਂ ਤੋਂ ਪਛਾਣਨ ਲਈ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲੈਰਟਿੰਗ ਲਾਗੂ ਕਰਨ ਲਈ
- ਲੌਗਿੰਗ, ਡੀਬੱਗਿੰਗ ਅਤੇ ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਵਰਕਫਲੋਜ਼ ਲਈ ਸ੍ਰੇਸ਼ਠ ਅਭਿਆਸ ਲਾਗੂ ਕਰਨ ਲਈ

## ਤੁਰੰਤ ਨਿਧਾਨ

ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਵਿੱਚ ਡੁਬਕੀ ਲਗਾਉਣ ਤੋਂ ਪਹਿਲਾਂ, ਨਿਧਾਨੀ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਨ ਲਈ ਇਹ ਕਮਾਂਡਾਂ ਚਲਾਓ:

```bash
# azd ਵਰਜਨ ਅਤੇ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd version
azd config list

# Azure ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az account show
az account list

# ਮੌਜੂਦਾ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
azd env show
azd env get-values

# ਡੀਬੱਗ ਲੌਗਿੰਗ ਨੂੰ ਯੋਗ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug
```

## ਪ੍ਰਮਾਣੀਕਰਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: "ਐਕਸੇਸ ਟੋਕਨ ਪ੍ਰਾਪਤ ਕਰਨ ਵਿੱਚ ਅਸਫਲ"
**ਲੱਛਣ:**
- `azd up` ਪ੍ਰਮਾਣਿਕਤਾ ਤਰੁਟੀਆਂ ਨਾਲ ਅਸਫਲ ਹੁੰਦਾ ਹੈ
- ਕਮਾਂਡਾਂ "unauthorized" ਜਾਂ "access denied" ਵਾਪਸ ਕਰਦੀਆਂ ਹਨ

**ਹੱਲ:**
```bash
# 1. Azure CLI ਨਾਲ ਦੁਬਾਰਾ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ
az login
az account show

# 2. ਕੈਸ਼ ਕੀਤੀਆਂ ਪ੍ਰਮਾਣਿਕਤਾ ਜਾਣਕਾਰੀਆਂ ਨੂੰ ਸਾਫ ਕਰੋ
az account clear
az login

# 3. ਡਿਵਾਈਸ ਕੋਡ ਫਲੋ ਦੀ ਵਰਤੋਂ ਕਰੋ (ਹੈੱਡਲੈੱਸ ਸਿਸਟਮਾਂ ਲਈ)
az login --use-device-code

# 4. ਸਪਸ਼ਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ਸਮੱਸਿਆ: ਡਿਪਲੋਇਮੈਂਟ ਦੌਰਾਨ "ਅਪਰਯਾਪਤ ਅਧਿਕਾਰ"
**ਲੱਛਣ:**
- ਡਿਪਲੋਇਮੈਂਟ ਅਧਿਕਾਰ ਤਰੁਟੀਆਂ ਨਾਲ ਅਸਫਲ ਹੁੰਦਾ ਹੈ
- ਕੁਝ Azure ਸਰੋਤ ਬਣਾਏ ਨਹੀਂ ਜਾ سکتے

**ਹੱਲ:**
```bash
# 1. ਆਪਣੇ Azure ਰੋਲ ਅਸਾਈਨਮੈਂਟ ਚੈੱਕ ਕਰੋ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਲੋੜੀਂਦੇ ਰੋਲ ਮੌਜੂਦ ਹਨ
# - Contributor (ਰਿਸੋਰਸ ਬਣਾਉਣ ਲਈ)
# - User Access Administrator (ਰੋਲ ਅਸਾਈਨਮੈਂਟ ਲਈ)

# 3. ਸਹੀ ਅਨੁਮਤੀਆਂ ਲਈ ਆਪਣੇ Azure ਪ੍ਰਸ਼ਾਸਕ ਨਾਲ ਸੰਪਰਕ ਕਰੋ
```

### ਸਮੱਸਿਆ: ਮਲਟੀ-ਟੈਨੈਂਟ ਪ੍ਰਮਾਣੀਕਰਨ ਸਮੱਸਿਆਵਾਂ
**ਹੱਲ:**
```bash
# 1. ਖਾਸ ਟੇਨੈਂਟ ਨਾਲ ਲੌਗਇਨ ਕਰੋ
az login --tenant "your-tenant-id"

# 2. ਕਨਫਿਗਰੇਸ਼ਨ ਵਿੱਚ ਟੇਨੈਂਟ ਸੈਟ ਕਰੋ
azd config set auth.tenantId "your-tenant-id"

# 3. ਜੇ ਟੇਨੈਂਟ ਬਦਲ ਰਹੇ ਹੋ ਤਾਂ ਟੇਨੈਂਟ ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ
az account clear
```

## 🏗️ ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਤਰੁਟੀਆਂ

### ਸਮੱਸਿਆ: ਸਰੋਤ ਨਾਂ ਟਕਰਾਅ
**ਲੱਛਣ:**
- "The resource name already exists" ਤਰੁਟੀਆਂ
- ਸਰੋਤ ਬਣਾਉਣ ਦੌਰਾਨ ਡਿਪਲੋਇਮੈਂਟ ਅਸਫਲ

**ਹੱਲ:**
```bash
# 1. ਟੋਕਨਾਂ ਨਾਲ ਵਿਲੱਖਣ ਰਿਸੋਰਸ ਨਾਂ ਵਰਤੋ
# ਤੁਹਾਡੇ Bicep ਟੈਮਪਲੇਟ ਵਿੱਚ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਬਦਲੋ
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ਮੌਜੂਦਾ ਰਿਸੋਰਸਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

### ਸਮੱਸਿਆ: ਟਿਕਾਣਾ/ਰੀਜਨ ਉਪਲਬਧ ਨਹੀਂ
**ਲੱਛਣ:**
- "'xyz' ਟਿਕਾਣਾ ਸਰੋਤ ਕਿਸਮ ਲਈ ਉਪਲਬਧ ਨਹੀਂ" ਤਰੁਟੀਆਂ
- ਚੁਣੇ ਗਏ ਰੀਜਨ ਵਿੱਚ ਕੁਝ SKUs ਉਪਲਬਧ ਨਹੀਂ

**ਹੱਲ:**
```bash
# 1. ਸਰੋਤ ਕਿਸਮਾਂ ਲਈ ਉਪਲਬਧ ਸਥਾਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ਆਮ ਤੌਰ 'ਤੇ ਉਪਲਬਧ ਖੇਤਰਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
azd config set defaults.location eastus2
# ਜਾਂ
azd env set AZURE_LOCATION eastus2

# 3. ਖੇਤਰ ਅਨੁਸਾਰ ਸੇਵਾ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
# ਵੇਖੋ: https://azure.microsoft.com/global-infrastructure/services/
```

### ਸਮੱਸਿਆ: ਕੋਟਾ ਪਾਰ ਹੋਣ ਦੀਆਂ ਤਰੁਟੀਆਂ
**ਲੱਛਣ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**ਹੱਲ:**
```bash
# 1. ਵਰਤਮਾਨ ਕੋਟਾ ਉਪਯੋਗ ਦੀ ਜਾਂਚ ਕਰੋ
az vm list-usage --location eastus2 -o table

# 2. Azure ਪੋਰਟਲ ਰਾਹੀਂ ਕੋਟਾ ਵਧਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ
# ਜਾਓ: ਸਬਸਕ੍ਰਿਪਸ਼ਨ > ਵਰਤੋਂ + ਕੋਟੇ

# 3. ਵਿਕਾਸ ਲਈ ਛੋਟੇ SKUs ਦੀ ਵਰਤੋਂ ਕਰੋ
# main.parameters.json ਵਿੱਚ:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ਨਾ ਵਰਤੇ ਗਏ ਸੰਸਾਧਨਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ਸਮੱਸਿਆ: Bicep ਟੈਮਪਲੇਟ ਤਰੁਟੀਆਂ
**ਲੱਛਣ:**
- ਟੈਮਪਲੇਟ ਮਾਨਤਾ ਦੀਆਂ ਅਸਫਲਤਾਵਾਂ
- Bicep ਫਾਇਲਾਂ ਵਿੱਚ ਸਿੰਟੈਕਸ ਤਰੁਟੀਆਂ

**ਹੱਲ:**
```bash
# 1. Bicep ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
az bicep build --file infra/main.bicep

# 2. Bicep ਲਿੰਟਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
az bicep lint --file infra/main.bicep

# 3. ਪੈਰਾਮੀਟਰ ਫਾਈਲ ਦੇ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
cat infra/main.parameters.json | jq '.'

# 4. ਡਿਪਲੋਇਮੈਂਟ ਤਬਦੀਲੀਆਂ ਦਾ ਪੂਰਵ-ਦਰਸ਼ਨ ਕਰੋ
azd provision --preview
```

## 🚀 ਡਿਪਲੋਇਮੈਂਟ ਅਸਫਲਤਾਵਾਂ

### ਸਮੱਸਿਆ: ਬਿਲਡ ਫੇਲ੍ਹ
**ਲੱਛਣ:**
- ਡਿਪਲੋਇਮੈਂਟ ਦੌਰਾਨ ਐਪਲੀਕੇਸ਼ਨ ਬਿਲਡ ਨਹੀਂ ਹੁੰਦੀ
- ਪੈਕੇਜ਼ ਇਨਸਟਾਲੇਸ਼ਨ ਦੀਆਂ ਤਰੁਟੀਆਂ

**ਹੱਲ:**
```bash
# 1. ਡੀਬੱਗ ਫਲੈਗ ਨਾਲ ਬਿਲਡ ਆਉਟਪੁੱਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd deploy --service web --debug

# 2. ਤੈਨਾਤ ਕੀਤੀ ਸੇਵਾ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show

# 3. ਬਿਲਡ ਨੂੰ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
cd src/web
npm install
npm run build

# 3. Node.js/Python ਵਰਜਨ ਦੀ ਅਨੁਕੂਲਤਾ ਜਾਂਚੋ
node --version  # ਇਹ azure.yaml ਸੈਟਿੰਗਾਂ ਨਾਲ ਮਿਲਣਾ ਚਾਹੀਦਾ ਹੈ
python --version

# 4. ਬਿਲਡ ਕੈਸ਼ ਸਾਫ ਕਰੋ
rm -rf node_modules package-lock.json
npm install

# 5. ਜੇ ਕੰਟੇਨਰ ਵਰਤ ਰਹੇ ਹੋ ਤਾਂ Dockerfile ਦੀ ਜਾਂਚ ਕਰੋ
docker build -t test-image .
docker run --rm test-image
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਡਿਪਲੋਇਮੈਂਟ ਅਸਫਲ
**ਲੱਛਣ:**
- ਕੰਟੇਨਰ ਐਪਸ ਸ਼ੁਰੂ ਨਹੀਂ ਹੁੰਦੇ
- ਇਮੇਜ ਖਿੱਚਣ ਦੀਆਂ ਤਰੁਟੀਆਂ

**ਹੱਲ:**
```bash
# 1. ਲੋਕਲ ਤੌਰ 'ਤੇ Docker ਬਿਲਡ ਦੀ ਜਾਂਚ ਕਰੋ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੰਟੇਨਰ ਲਾਗ ਚੈੱਕ ਕਰੋ
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ਰਾਹੀਂ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --logs

# 3. ਕੰਟੇਨਰ ਰਜਿਸਟਰੀ ਦੀ ਪਹੁੰਚ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az acr login --name myregistry

# 4. ਕੰਟੇਨਰ ਐਪ ਦੀ ਸੰਰਚਨਾ ਚੈੱਕ ਕਰੋ
az containerapp show --name my-app --resource-group my-rg
```

### ਸਮੱਸਿਆ: ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਫੇਲ੍ਹ
**ਲੱਛਣ:**
- ਐਪਲੀਕੇਸ਼ਨ ਡੇਟਾਬੇਸ ਨਾਲ ਜੁੜ ਨਹੀਂ ਸਕਦੀ
- ਕਨੈਕਸ਼ਨ ਟਾਈਮਆਊਟ ਤਰੁਟੀਆਂ

**ਹੱਲ:**
```bash
# 1. ਡੇਟਾਬੇਸ ਫਾਇਰਵਾਲ ਨਿਯਮਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ਐਪਲੀਕੇਸ਼ਨ ਤੋਂ ਕਨੈਕਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
# ਆਪਣੇ ਐਪ ਵਿੱਚ ਅਸਥਾਈ ਤੌਰ ਤੇ ਸ਼ਾਮਲ ਕਰੋ:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ਕਨੈਕਸ਼ਨ ਸਟਰਿੰਗ ਦੇ ਫਾਰਮੈਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values | grep DATABASE

# 4. ਡੇਟਾਬੇਸ ਸਰਵਰ ਦੀ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ਕੰਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ ਕੰਮ ਨਹੀਂ ਕਰ ਰਹੇ
**ਲੱਛਣ:**
- ਐਪ ਕੰਫਿਗਰੇਸ਼ਨ ਮੁੱਲ ਪੜ੍ਹ ਨਹੀਂ ਪਾ ਰਿਹਾ
- ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ ਖਾਲੀ ਦਿਖਾਈ ਦੇ ਰਹੇ ਹਨ

**ਹੱਲ:**
```bash
# 1. ਪੱਕਾ ਕਰੋ ਕਿ ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕੀਤੇ ਗਏ ਹਨ
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ਵਿੱਚ ਵੈਰੀਏਬਲਾਂ ਦੇ ਨਾਮ ਜਾਂਚੋ
cat azure.yaml | grep -A 5 env:

# 3. ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਰੀਸਟਾਰਟ ਕਰੋ
azd deploy --service web

# 4. ਐਪ ਸਰਵਿਸ ਦੀ ਸੰਰਚਨਾ ਜਾਂਚੋ
az webapp config appsettings list --name myapp --resource-group myrg
```

### ਸਮੱਸਿਆ: SSL/TLS ਸਰਟੀਫਿਕੇਟ ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- HTTPS ਕੰਮ ਨਹੀਂ ਕਰ ਰਿਹਾ
- ਸਰਟੀਫਿਕੇਟ ਮਾਨਤਾ ਦੀਆਂ ਤਰੁਟੀਆਂ

**ਹੱਲ:**
```bash
# 1. SSL ਸਰਟੀਫਿਕੇਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az webapp config ssl list --resource-group myrg

# 2. ਸਿਰਫ HTTPS ਨੂੰ ਯੋਗ ਕਰੋ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. ਕਸਟਮ ਡੋਮੇਨ ਜੋੜੋ (ਜੇ ਲੋੜ ਹੋਵੇ)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ਸਮੱਸਿਆ: CORS ਕੰਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਫਰੰਟਐਂਡ API ਨੂੰ ਕਾਲ ਨਹੀਂ ਕਰ ਸਕਦਾ
- ਕ੍ਰਾਸ-ਅਰਿਜ਼ਨ ਰਿਕਵੇਸਟ ਰੋਕ ਦਿੱਤੀ ਗਈ

**ਹੱਲ:**
```bash
# 1. App Service ਲਈ CORS ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS ਨੂੰ ਸੰਭਾਲਣ ਲਈ API ਨੂੰ ਅਪਡੇਟ ਕਰੋ
# Express.js ਵਿੱਚ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. ਜਾਂਚੋ ਕਿ ਇਹ ਸਹੀ URLs 'ਤੇ ਚੱਲ ਰਿਹਾ ਹੈ ਜਾਂ ਨਹੀਂ
azd show
```

## 🌍 ਵਾਤਾਵਰਨ ਪਰਬੰਧਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਨ ਬਦਲਣ ਵਿੱਚ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਗਲਤ ਵਾਤਾਵਰਨ ਵਰਤਿਆ ਜਾ ਰਿਹਾ ਹੈ
- ਕੰਫਿਗਰੇਸ਼ਨ ਸਹੀ ਤਰ੍ਹਾਂ ਸਵਿੱਚ ਨਹੀਂ ਹੋ ਰਹੀ

**ਹੱਲ:**
```bash
# 1. ਸਾਰੇ ਮਾਹੌਲ ਦਿਖਾਓ
azd env list

# 2. ਮਾਹੌਲ ਨੂੰ ਸਪਸ਼ਟ ਤੌਰ ਤੇ ਚੁਣੋ
azd env select production

# 3. ਮੌਜੂਦਾ ਮਾਹੌਲ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd env show

# 4. ਜੇ ਮਾਹੌਲ ਖਰਾਬ ਹੋਵੇ ਤਾਂ ਨਵਾਂ ਮਾਹੌਲ ਬਣਾਓ
azd env new production-new
azd env select production-new
```

### ਸਮੱਸਿਆ: ਵਾਤਾਵਰਨ ਖਰਾਬ ਹੋਣਾ
**ਲੱਛਣ:**
- ਵਾਤਾਵਰਨ ਅਬੈਧ ਸਥਿਤੀ ਦਿੱਖਾ ਰਿਹਾ ਹੈ
- ਸਰੋਤ ਕੰਫਿਗਰੇਸ਼ਨ ਨਾਲ ਮੇਲ ਨਹੀਂ ਕਰਦੇ

**ਹੱਲ:**
```bash
# 1. ਵਾਤਾਵਰਣ ਦੀ ਸਥਿਤੀ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh

# 2. ਵਾਤਾਵਰਣ ਦੀ ਸੰਰਚਨਾ ਰੀਸੈਟ ਕਰੋ
azd env new production-reset
# ਲੋੜੀਂਦੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਾਂ ਨੂੰ ਨਕਲ ਕਰੋ
azd env set DATABASE_URL "your-value"

# 3. ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਨੂੰ ਆਯਾਤ ਕਰੋ (ਜੇ ਸੰਭਵ ਹੋਵੇ)
# ਹੱਥੋਂ .azure/production/config.json ਨੂੰ ਸਰੋਤ ਆਈਡੀਜ਼ ਨਾਲ ਅਪਡੇਟ ਕਰੋ
```

## 🔍 ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਡਿਪਲੋਇਮੈਂਟ ਸਮੇਂ ਧੀਰੇ ਹੋ ਰਹੇ ਹਨ
**ਲੱਛਣ:**
- ਡਿਪਲੋਇਮੈਂਟ ਬਹੁਤ ਵਧੇਰੇ ਸਮਾਂ ਲੈ ਰਹੇ ਹਨ
- ਡਿਪਲੋਇਮੈਂਟ ਦੌਰਾਨ ਟਾਈਮਆਊਟ

**ਹੱਲ:**
```bash
# 1. ਤੇਜ਼ ਦੁਹਰਾਈ ਲਈ ਨਿਰਧਾਰਿਤ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# 2. ਜਦੋਂ ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਬਦਲਿਆ ਨਾ ਹੋਵੇ ਤਾਂ ਸਿਰਫ ਕੋਡ-ਅਧਾਰਤ ਤੈਨਾਤ ਵਰਤੋ
azd deploy  # azd up ਨਾਲੋਂ ਤੇਜ਼

# 3. ਬਿਲਡ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ
# package.json ਵਿੱਚ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. ਰਿਸੋਰਸ ਸਥਾਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ (ਇੱਕੋ ਰੀਜਨ ਦੀ ਵਰਤੋਂ ਕਰੋ)
azd config set defaults.location eastus2
```

### ਸਮੱਸਿਆ: ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ
**ਲੱਛਣ:**
- ਸਲੋ ਰਿਸਪਾਂਸ ਟਾਈਮ
- ਉੱਚ ਸਰੋਤ ਉਪਯੋਗ

**ਹੱਲ:**
```bash
# 1. ਸਰੋਤ ਵਧਾਓ
# main.parameters.json ਵਿੱਚ SKU ਅਪਡੇਟ ਕਰੋ:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights ਨਿਗਰਾਨੀ ਚਾਲੂ ਕਰੋ
azd monitor --overview

# 3. Azure ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੋਗਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az webapp log tail --name myapp --resource-group myrg
# ਜਾਂ Container Apps ਲਈ:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ
# Redis ਕੈਸ਼ ਨੂੰ ਆਪਣੇ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ
```

## 🛠️ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਟੂਲ ਅਤੇ ਕਮਾਂਡਾਂ

### ਡੀਬੱਗ ਕਮਾਂਡਸ
```bash
# ਵਿਆਪਕ ਡੀਬੱਗਿੰਗ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd ਵਰਜਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਵੇਖੋ
azd config list

# ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ
curl -v https://myapp.azurewebsites.net/health
```

### ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# Azure CLI ਰਾਹੀਂ ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਲੌਗ
az webapp log tail --name myapp --resource-group myrg

# azd ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ
azd monitor --logs
azd monitor --live

# Azure ਰਿਸੋਰਸਾਂ ਦੇ ਲੌਗ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# ਕੰਟੇਨਰ ਲੌਗ (ਕੰਟੇਨਰ ਐਪਸ ਲਈ)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### ਸਰੋਤ ਜਾਂਚ
```bash
# ਸਾਰੇ ਸਰੋਤਾਂ ਦੀ ਸੂਚੀ
az resource list --resource-group myrg -o table

# ਸਰੋਤ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az webapp show --name myapp --resource-group myrg --query state

# ਨੈੱਟਵਰਕ ਨਿਦਾਨ
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ਵਧੇਰੇ ਮਦਦ ਲੈਣਾ

### ਕਦੋਂ ਐਸਕਲੇਟ ਕਰਨਾ
- ਸਾਰੀਆਂ ਕੋਸ਼ਿਸ਼ਾਂ ਦੇ ਬਾਵਜੂਦ ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ ਜਾਰੀ ਰਹਿਣ
- Azure ਸੇਵਾਵਾਂ ਨਾਲ ਸੰਬੰਧਤ ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਸਮੱਸਿਆਵਾਂ
- ਬਿਲਿੰਗ ਜਾਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸੰਬੰਧੀ ਮੁੱਦੇ
- ਸੁਰੱਖਿਆ ਸੰਬੰਧੀ ਚਿੰਤਾਵਾਂ ਜਾਂ ਘਟਨਾਵਾਂ

### ਸਪੋਰਟ ਚੈਨਲ
```bash
# 1. ਏਜ਼ੂਰ ਸੇਵਾ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. ਏਜ਼ੂਰ ਸਹਾਇਤਾ ਟਿਕਟ ਬਣਾਓ
# ਜਾਓ: https://portal.azure.com -> ਮਦਦ + ਸਹਾਇਤਾ

# 3. ਕਮਿਊਨਿਟੀ ਸਰੋਤ
# - Stack Overflow: azure-developer-cli ਟੈਗ
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ਇਕੱਠਾ ਕਰਨ ਲਈ ਜਾਣਕਾਰੀ
ਸਪੋਰਟ ਨਾਲ ਸੰਪਰਕ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਇਕੱਠਾ ਕਰੋ:
- `azd version` ਆਉਟਪੁੱਟ
- `azd config list` ਆਉਟਪੁੱਟ
- `azd show` ਆਉਟਪੁੱਟ (ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਸਥਿਤੀ)
- ਤਰੁਟੀਆਂ ਦੇ ਸੁਨੇਹੇ (ਪੂਰਾ ਟੈਕਸਟ)
- ਸਮੱਸਿਆ ਨੂੰ ਦੁਹਰਾਉਣ ਦੇ ਕਦਮ
- ਵਾਤਾਵਰਨ ਵੇਰਵੇ (`azd env show`)
- ਸਮੇਂ ਦੀ ਲਾਈਨ ਜਦੋਂ ਸਮੱਸਿਆ ਸ਼ੁਰੂ ਹੋਈ

### ਲੌਗ ਇਕੱਠਾ ਕਰਨ ਵਾਲਾ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ਸਮੱਸਿਆ ਰੋਕਥਾਮ

### ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਚੈක්ਲਿਸਟ
```bash
# 1. ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
az account show

# 2. ਕੋਟੇ ਅਤੇ ਸੀਮਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az vm list-usage --location eastus2

# 3. ਟੈਮਪਲੇਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az bicep build --file infra/main.bicep

# 4. ਪਹਿਲਾਂ ਸਥਾਨਕ ਤੌਰ ਤੇ ਟੈਸਟ ਕਰੋ
npm run build
npm run test

# 5. ਡ੍ਰਾਈ-ਰਨ ਡਿਪਲੋਇਮੈਂਟਸ ਵਰਤੋ
azd provision --preview
```

### ਮਾਨੀਟਰਿੰਗ ਸੈਟਅੱਪ
```bash
# Application Insights ਨੂੰ ਯੋਗ ਕਰੋ
# main.bicep ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# ਅਲਰਟ ਸੈੱਟ ਕਰੋ
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ਨਿਯਮਤ ਰਖ-ਰਖਾਵ
```bash
# ਹਫਤਾਵਾਰੀ ਸਿਹਤ ਦੀ ਜਾਂਚ
./scripts/health-check.sh

# ਮਾਸਿਕ ਲਾਗਤ ਦੀ ਸਮੀਖਿਆ
az consumption usage list --billing-period-name 202401

# ਤਿਮਾਹੀ ਸੁਰੱਖਿਆ ਦੀ ਸਮੀਖਿਆ
az security assessment list --resource-group myrg
```

## ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md) - ਅਡਵਾਂਸਡ ਡੀਬੱਗਿੰਗ ਤਕਨੀਕਾਂ
- [ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ](../chapter-04-infrastructure/provisioning.md) - ਇੰਫਰਾਸਟ੍ਰੱਕਚਰ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ
- [ਕੇਪੈਸਿਟੀ ਪਲੈਨਿੰਗ](../chapter-06-pre-deployment/capacity-planning.md) - ਸਰੋਤ ਯੋਜਨਾ ਲਈ ਮਾਰਗਦਰਸ਼ਨ
- [SKU ਚੋਣ](../chapter-06-pre-deployment/sku-selection.md) - ਸੇਵਾ ਟੀਅਰ ਲਈ ਸਿਫਾਰਸ਼ਾਂ

---

**ਟਿਪ**: ਇਸ ਗਾਈਡ ਨੂੰ ਬੁੱਕਮਾਰਕ ਰੱਖੋ ਅਤੇ ਜਦੋਂ ਵੀ ਤੁਸੀਂ ਸਮੱਸਿਆਵਾਂ ਦਿਖੋ ਤਾਂ ਇਸ ਨੂੰ ਦਰਸਾਵੋ। ਜ਼ਿਆਦਾਤਰ ਸਮੱਸਿਆਵਾਂ ਪਹਿਲਾਂ ਵੀ ਵੇਖੀਆਂ ਗਈਆਂ ਹਨ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਸਥਾਪਿਤ ਹੱਲ ਮੌਜੂਦ ਹਨ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ](../chapter-04-infrastructure/provisioning.md)
- **ਅਗਲਾ ਪਾਠ**: [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰ:
ਇਹ ਦਸਤਾਵੇਜ਼ ਏ.ਆਈ. ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ (ਸਵੈਚਾਲਿਤ) ਅਨੁਵਾਦਾਂ ਵਿੱਚ তਰੁਟੀਆਂ ਜਾਂ ਗੈਰ-ਸਹੀ ਜਾਣਕਾਰੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਨਾਜ਼ੁਕ ਜਾਂ ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਵਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->