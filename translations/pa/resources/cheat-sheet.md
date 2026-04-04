# ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ - ਮਹੱਤਵਪੂਰਨ AZD ਕਮਾਂਡਾਂ

**ਸਾਰੀਆਂ ਅਧਿਆਇਆਂ ਲਈ ਤੁਰੰਤ ਸੰਦਰਭ**
- **📚 ਕੋਰਸ ਮੁੱਖ ਸਫ਼ਾ**: [AZD For Beginners](../README.md)
- **📖 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**: [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ਕਮਾਂਡਾਂ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ਉੱਨਤ**: [ਅਧਿਆਇ 4: ਇੰਫਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ਪ੍ਰਸਤਾਵਨਾ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਚੀਟ ਸ਼ੀਟ ਸਭ ਤੋਂ ਆਮ ਤੌਰ 'ਤੇ ਵਰਤੀ ਜਾਣ ਵਾਲੀਆਂ Azure Developer CLI ਕਮਾਂਡਾਂ ਲਈ ਤੇਜ਼ ਸੰਦਰਭ ਦਿੰਦੀ ਹੈ, ਜੋ ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ ਅਤੇ ਪ੍ਰਯੋਗਿਕ ਉਦਾਹਰਣਾਂ ਦੇ ਨਾਲ ਹੈ। azd ਪ੍ਰੋਜੈਕਟਾਂ ਦੇ ਵਿਕਾਸ, ਸਮੱਸਿਆ-ਨਿਵਾਰਣ ਅਤੇ ਰੋਜ਼ਾਨਾ ਓਪਰੇਸ਼ਨਾਂ ਦੌਰਾਨ ਤੇਜ਼ ਲੁਕਅੱਪ ਲਈ ਬਿਲਕੁਲ موزੂਨ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਚੀਟ ਸ਼ੀਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਤੁਸੀਂ:
- ਆਜ਼ਰ ਡਿਵੈਲਪਰ CLI ਦੀਆਂ ਜਰੂਰੀ ਕਮਾਂਡਾਂ ਅਤੇ ਸਿੰਟੈਕਸ ਤੁਰੰਤ ਪ੍ਰਾਪਤ ਕਰ ਸਕੋਗੇ
- ਕਾਰਜਾਤਮਕ ਸ਼੍ਰੇਣੀਆਂ ਅਤੇ ਉਪਯੋਗ ਕੇਸਾਂ ਦੁਆਰਾ ਕਮਾਂਡਾਂ ਦੀ ਵਿਵਸਥਾ ਸਮਝ ਸਕੋਗੇ
- ਆਮ ਵਿਕਾਸ ਅਤੇ ਤਾਇਨਾਤੀ ਸਿਸਟਮਾਂ ਲਈ ਪ੍ਰਯੋਗਿਕ ਉਦਾਹਰਣਾਂ ਨੂੰ ਰੁਫ-ਰੁਪ ਵਿੱਚ ਦੇਖ ਸਕੋਗੇ
- ਸਮੱਸਿਆ-ਨਿਵਾਰਣ ਲਈ ਜਲਦੀ ਵਿਗਿਆਨਕ ਕਮਾਂਡਾਂ ਤੱਕ ਪਹੁੰਚ ਪ੍ਰਾਪਤ ਕਰ ਸਕੋਗੇ
- ਉੱਨਤ ਸੰਰਚਨਾ ਅਤੇ ਵਿਅਕਤੀਗਤ ਕਰਨ ਦੇ ਵਿਕਲਪਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਲੱਭ ਸਕੋਗੇ
- ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਅਤੇ ਬਹੁ-ਵਾਤਾਵਰਣ ਵਰਕਫਲੋ ਕਮਾਂਡਾਂ ਨੂੰ ਲੱਭ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਚੀਟ ਸ਼ੀਟ ਨੂੰ ਨਿਯਮਿਤ ਰੂਪ ਵਿੱਚ ਦੇਖਦੇ ਹੋਏ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਬਿਨਾ ਪੂਰੇ ਦਸਤਾਵੇਜ਼ਾਂ ਦਾ ਹਵਾਲਾ ਲਈਏ azd ਕਮਾਂਡਾਂ ਨੂੰ ਨਿਸ਼ਚਿੰਤ ਤੌਰ 'ਤੇ ਚਲਾਉਣ ਲਈ
- ਉਪਯੁਕਤ ਨਿਰਿਦੇਸ਼ਕ ਕਮਾਂਡਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਜਲਦੀ ਹੱਲ ਕਰਨ ਲਈ
- ਬਹੁ-ਵਾਤਾਵਰਣ ਅਤੇ ਤਾਇਨਾਤੀ ਸਥਿਤੀਆਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ
- ਜਰੂਰਤ ਪੈਣ 'ਤੇ ਉੱਨਤ azd ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਅਤੇ ਸੰਰਚਨਾ ਵਿਕਲਪ ਲਾਗੂ ਕਰਨ ਲਈ
- ਪ੍ਰਣਾਲੀਬੱਧ ਕਮਾਂਡ ਕ੍ਰਮਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਤਾਇਨਾਤੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤਸ਼ਖੀਸ ਕਰਨ ਲਈ
- azd ਸ਼ਾਰਟਕੱਟਸ ਅਤੇ ਵਿਕਲਪਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਰਾਹੀਂ ਵਰਕਫਲੋ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰਨ ਲਈ

## ਸ਼ੁਰੂਆਤੀ ਕਮਾਂਡਾਂ

### ਪ੍ਰਮਾਣੀਕਰਣ
```bash
# AZD ਰਾਹੀਂ Azure ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ
azd auth login

# Azure CLI ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ (AZD ਪਿੱਛੇ ਇਸਦਾ ਉਪਯੋਗ ਕਰਦਾ ਹੈ)
az login

# ਮੌਜੂਦਾ ਖਾਤਾ ਜਾਂਚੋ
az account show

# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ਤੋਂ ਲੌਗਆਊਟ ਕਰੋ
azd auth logout

# Azure CLI ਤੋਂ ਲੌਗਆਊਟ ਕਰੋ
az logout
```

### ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂਆਤ
```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਬਰਾਊਜ਼ ਕਰੋ
azd template list

# ਟੈਮਪਲੇਟ ਤੋਂ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰੋ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰੋ
azd init .

# ਕਸਟਮ ਨਾਮ ਨਾਲ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰੋ
azd init --template todo-nodejs-mongo my-awesome-app
```

## ਮੁੱਖ ਡਿਪਲੋਇਮੈਂਟ ਕਮਾਂਡਾਂ

### ਸੰਪੂਰਨ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ
```bash
# ਸਭ ਕੁਝ ਤੈਨਾਤ ਕਰੋ (ਪ੍ਰੋਵਿਜ਼ਨ + ਡਿਪਲੋਇ)
azd up

# ਪੁਸ਼ਟੀ ਪ੍ਰਾਂਪਟ ਬੰਦ ਕਰਕੇ ਤੈਨਾਤ ਕਰੋ
azd up --confirm-with-no-prompt

# ਨਿਰਧਾਰਿਤ ਵਾਤਾਵਰਣ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ تੈਨਾਤ ਕਰੋ
azd up --parameter location=westus2
```

### ਸਿਰਫ ਇੰਫਰਾਸਟਰਕਚਰ
```bash
# Azure ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision

# 🧪 ਇੰਫਰਾਸਟਰਕਚਰ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰੀਵਿਊ
azd provision --preview
# ਇਹ ਡ੍ਰਾਈ-ਰਨ ਨਜ਼ਾਰਾ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਕਿਹੜੇ ਸਰੋਤ ਬਣਾਏ/ਸੋਧੇ/ਮਿਟਾਏ ਜਾਣਗੇ
# ਇਹ 'terraform plan' ਜਾਂ 'bicep what-if' ਵਰਗਾ ਹੈ - ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ, ਕੋਈ ਬਦਲਾਵ ਲਾਗੂ ਨਹੀਂ ਹੁੰਦੇ
```

### ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਨਿਰਦਿਸ਼ਟ ਸੇਵਾ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਭ ਸੇਵਾਵਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd deploy --all
```

### ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ
```bash
# ਐਪਲੀਕੇਸ਼ਨਾਂ ਬਣਾਓ
azd package

# ਨਿਰਧਾਰਤ ਸੇਵਾ ਬਣਾਓ
azd package --service api
```

## 🌍 ਵਾਤਾਵਰਣ ਪਰਬੰਧਨ

### ਵਾਤਾਵਰਣ ਕਾਰਵਾਈਆਂ
```bash
# ਸਭ ਵਾਤਾਵਰਣਾਂ ਦੀ ਸੂਚੀ
azd env list

# ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new development
azd env new staging --location westus2

# ਵਾਤਾਵਰਣ ਚੁਣੋ
azd env select production

# ਉਪਲਬਧ ਵਾਤਾਵਰਣ ਦਿਖਾਓ
azd env list

# ਵਾਤਾਵਰਣ ਦੀ ਸਥਿਤੀ ਨੂੰ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh
```

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
```bash
# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get API_KEY

# ਸਾਰੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਦਿਖਾਓ
azd env get-values

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਹਟਾਓ
azd env unset DEBUG
```

## ⚙️ ਕੰਫਿਗਰੇਸ਼ਨ ਕਮਾਂਡਾਂ

### ਗਲੋਬਲ ਕੰਫਿਗਰੇਸ਼ਨ
```bash
# ਸਾਰੀਆਂ ਸੰਰਚਨਾਵਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd config show

# ਗਲੋਬਲ ਡਿਫਾਲਟ ਸੈੱਟ ਕਰੋ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ਸੰਰਚਨਾ ਹਟਾਓ
azd config unset defaults.location

# ਸਾਰੀਆਂ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਰੀਸੈਟ ਕਰੋ
azd config reset
```

### ਪ੍ਰੋਜੈਕਟ ਕੰਫਿਗਰੇਸ਼ਨ
```bash
# azure.yaml ਦੀ ਜਾਂਚ ਕਰੋ
azd config validate

# ਪ੍ਰੋਜੈਕਟ ਦੀ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd show

# ਸੇਵਾ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json
```

## 📊 ਨਿਗਰਾਨੀ ਅਤੇ ਨਿਧਾਨ

### ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ
```bash
# Azure ਪੋਰਟਲ ਦਾ ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ ਖੋਲੋ
azd monitor

# Application Insights ਦੀ ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਖੋਲੋ
azd monitor --live

# Application Insights ਦੇ ਲੌਗਜ਼ ਬਲੇਡ ਖੋਲੋ
azd monitor --logs

# Application Insights ਦਾ ਓਵਰਵਿਊ ਖੋਲੋ
azd monitor --overview
```

### ਕੰਟੇਨਰ ਲੋਗ ਦੇਖਣਾ
```bash
# Azure CLI ਰਾਹੀਂ ਲੌਗ ਵੇਖੋ (Container Apps ਲਈ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ਲੌਗਾਂ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਫਾਲੋ ਕਰੋ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal ਤੋਂ ਲੌਗ ਵੇਖੋ
azd monitor --logs
```

### ਲਾਗ ਐਨਾਲਿਟਿਕਸ ਕੁਐਰੀਆਂ
```bash
# Azure ਪੋਰਟਲ ਰਾਹੀਂ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤੱਕ ਪਹੁੰਚ
azd monitor --logs

# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗਾਂ ਉੱਤੇ ਕੁਐਰੀ ਚਲਾਓ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ਰਖ-ਰਖਾਵ ਕਮਾਂਡਾਂ

### ਸਾਫ਼-ਸੁਥਰਾ
```bash
# ਸਾਰੇ ਏਜ਼ਰ ਸਰੋਤ ਹਟਾਓ
azd down

# ਪੁਸ਼ਟੀ ਦੇ ਬਗੈਰ ਜਬਰਦਸਤੀ ਮਿਟਾਓ
azd down --force

# ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਸਰੋਤ ਪੂਰੀ ਤਰ੍ਹਾਂ ਹਟਾਓ
azd down --purge

# ਸੰਪੂਰਨ ਸਫਾਈ
azd down --force --purge
```

### ਅਪਡੇਟਸ
```bash
# azd ਅਪਡੇਟ ਲਈ ਜਾਂਚ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਵਰਜਨ ਪ੍ਰਾਪਤ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਵਿਨਿਆਸ ਵੇਖੋ
azd config show
```

## 🔧 ਉੱਨਤ ਕਮਾਂਡਾਂ

### ਪਾਈਪਲਾਈਨ ਅਤੇ CI/CD
```bash
# GitHub Actions ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
azd pipeline config

# Azure DevOps ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
azd pipeline config --provider azdo

# ਪਾਈਪਲਾਈਨ ਦੀ ਸੰਰਚਨਾ ਦਿਖਾਓ
azd pipeline show
```

### ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰਬੰਧਨ
```bash
# ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਟੈਮਪਲੇਟ ਬਣਾਓ
azd infra generate

# 🧪 ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਪੂਰਵ-ਜਾਇਜ਼ਾ ਅਤੇ ਯੋਜਨਾ
azd provision --preview
# ਬਿਨਾਂ ਤੈਨਾਤ ਕੀਤੇ ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦੀ ਨਕਲ ਕਰਦਾ ਹੈ
# Bicep/Terraform ਟੈਮਪਲੇਟਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ ਅਤੇ ਦਿਖਾਉਂਦਾ ਹੈ:
# - ਜੋੜੇ ਜਾਣ ਵਾਲੇ ਸੰਸਾਧਨ (ਹਰਾ +)
# - ਸੋਧੇ ਜਾਣ ਵਾਲੇ ਸੰਸਾਧਨ (ਪੀਲਾ ~)
# - ਮਿਟਾਏ ਜਾਣ ਵਾਲੇ ਸੰਸਾਧਨ (ਲਾਲ -)
# ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ - Azure ਵਾਤਾਵਰਣ ਵਿੱਚ ਕੋਈ ਅਸਲ ਬਦਲਾਅ ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ

# azure.yaml ਤੋਂ ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਤਿਆਰ ਕਰੋ
azd infra synth
```

### ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ
```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸਥਿਤੀ ਅਤੇ ਐਂਡਪੌਇੰਟ ਦਿਖਾਓ
azd show

# ਪ੍ਰੋਜੈਕਟ ਦੀ ਵਿਸਤ੍ਰਿਤ ਜਾਣਕਾਰੀ JSON ਵਜੋਂ ਦਿਖਾਓ
azd show --output json

# ਸੇਵਾ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json | jq '.services'
```

## 🤖 AI ਅਤੇ ਐਕਸਟੈਂਸ਼ਨ ਕਮਾਂਡਾਂ

### AZD ਐਕਸਟੈਂਸ਼ਨ
```bash
# ਸਾਰੇ ਉਪਲਬਧ ਐਕਸਟੈਂਸ਼ਨਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ (AI ਸਮੇਤ)
azd extension list

# Foundry agents ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.agents

# ਫਾਈਨ-ਟਿਊਨਿੰਗ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.finetune

# ਕਸਟਮ ਮਾਡਲਾਂ ਦੀ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.models

# ਸਾਰੇ ਇੰਸਟਾਲ ਕੀਤੇ ਐਕਸਟੈਂਸ਼ਨਾਂ ਨੂੰ ਅੱਪਗਰੇਡ ਕਰੋ
azd extension upgrade --all
```

### AI ਏਜੰਟ ਕਮਾਂਡਾਂ
```bash
# ਮੈਨਿਫੈਸਟ ਤੋਂ ਇੱਕ ਏਜੰਟ ਪ੍ਰੋਜੈਕਟ ਆਰੰਭ ਕਰੋ
azd ai agent init -m <manifest-path-or-uri>

# ਕਿਸੇ ਖਾਸ ਫਾਊਂਡਰੀ ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਨਿਸ਼ਾਨਾ ਬਣਾਓ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ਏਜੰਟ ਸਰੋਤ ਡਾਇਰੈਕਟਰੀ ਨਿਰਧਾਰਤ ਕਰੋ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ਕੋਈ ਹੋਸਟਿੰਗ ਟਾਰਗੇਟ ਚੁਣੋ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP ਸਰਵਰ (Alpha)
```bash
# ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਲਈ MCP ਸਰਵਰ ਸ਼ੁਰੂ ਕਰੋ
azd mcp start

# MCP ਓਪਰੇਸ਼ਨਾਂ ਲਈ ਟੂਲ ਦੀ ਸਹਿਮਤੀ ਪ੍ਰਬੰਧ ਕਰੋ
azd copilot consent list
```

### ਇੰਫਰਾਸਟਰਕਚਰ ਜਨਰੇਸ਼ਨ
```bash
# ਆਪਣੀ ਪ੍ਰੋਜੈਕਟ ਦੀ ਪਰਿਭਾਸ਼ਾ ਤੋਂ IaC ਫਾਈਲਾਂ ਬਣਾਓ
azd infra generate

# azure.yaml ਤੋਂ ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਬਣਾਓ
azd infra synth
```

---

## 🎯 ਤੇਜ਼ ਵਰਕਫਲੋਜ਼

### ਡਿਵੈਲਪਮੈਂਟ ਵਰਕਫਲੋ
```bash
# ਨਵਾਂ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo
cd my-project

# ਡੈਵਲਪਮੈਂਟ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env new dev
azd up

# ਤਬਦੀਲੀਆਂ ਕਰੋ ਅਤੇ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --live
```

### ਬਹੁ-ਵਾਤਾਵਰਣ ਵਰਕਫਲੋ
```bash
# ਵਾਤਾਵਰਣ ਤਿਆਰ ਕਰੋ
azd env new dev
azd env new staging  
azd env new production

# ਡਿਵੈਲਪਮੈਂਟ ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env select dev
azd up

# ਟੈਸਟ ਕਰੋ ਅਤੇ ਸਟੇਜਿੰਗ ਤੇ ਪ੍ਰਮੋਟ ਕਰੋ
azd env select staging
azd up

# ਪ੍ਰੋਡਕਸ਼ਨ ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env select production
azd up
```

### ਸਮੱਸਿਆ ਨਿਵਾਰਨ ਵਰਕਫਲੋ
```bash
# ਡੀਬੱਗ ਮੋਡ ਨੂੰ ਯੋਗ ਕਰੋ
export AZD_DEBUG=true

# ਤੈਨਾਤੀ ਦੀ ਸਥਿਤੀ ਜਾਂਚ ਕਰੋ
azd show

# ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd config show

# ਲੌਗਾਂ ਲਈ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --logs

# ਸੰਸਾਧਨ ਦੀ ਸਥਿਤੀ ਜਾਂਚ ਕਰੋ
azd show --output json
```

## 🔍 ਡਿਬੱਗਿੰਗ ਕਮਾਂਡਾਂ

### ਡਿਬੱਗ ਜਾਣਕਾਰੀ
```bash
# ਡੀਬੱਗ ਆਉਟਪੁੱਟ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug

# ਸਾਫ਼ ਆਉਟਪੁੱਟ ਲਈ ਟੈਲੀਮੇਟਰੀ ਬੰਦ ਕਰੋ
export AZD_DISABLE_TELEMETRY=true

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
azd config show

# ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```

### ਟੈਮਪਲੇਟ ਡਿਬੱਗ
```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਵੇਰਵਿਆਂ ਸਮੇਤ ਸੂਚੀਬੱਧ ਕਰੋ
azd template list --output json

# ਟੈਮਪਲੇਟ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd template show <template-name>

# init ਤੋਂ ਪਹਿਲਾਂ ਟੈਮਪਲੇਟ ਦੀ ਵੈਧਤਾ ਜਾਂਚੋ
azd template validate <template-name>
```

## 📁 ਫਾਇਲ ਅਤੇ ਡਾਇਰੈਕਟਰੀ ਕਮਾਂਡਾਂ

### ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ
```bash
# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਢਾਂਚਾ ਦਿਖਾਓ
tree /f  # ਵਿਂਡੋਜ਼
find . -type f  # ਲਿਨਕਸ/ਮੈਕਓਐਸ

# azd ਪ੍ਰੋਜੈਕਟ ਰੂਟ ਤੇ ਜਾਓ
cd $(azd root)

# azd ਸੰਰਚਨਾ ਡਾਇਰੈਕਟਰੀ ਦਿਖਾਓ
echo $AZD_CONFIG_DIR  # ਆਮ ਤੌਰ 'ਤੇ ~/.azd
```

## 🎨 ਆਊਟਪੁੱਟ ਫਾਰਮੇਟਿੰਗ

### JSON ਆਊਟਪੁੱਟ
```bash
# ਸਕ੍ਰਿਪਟਿੰਗ ਲਈ JSON ਆਉਟਪੁੱਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json
azd env list --output json
azd config show --output json

# jq ਨਾਲ ਪਾਰਸ ਕਰੋ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ਟੇਬਲ ਆਊਟਪੁੱਟ
```bash
# ਟੇਬਲ ਵਜੋਂ ਫਾਰਮੈਟ ਕਰੋ
azd env list --output table

# ਤੈਨਾਤ ਕੀਤੀਆਂ ਸੇਵਾਵਾਂ ਵੇਖੋ
azd show --output json | jq '.services | keys'
```

## 🔧 ਆਮ ਕਮਾਂਡ ਜੋੜ

### ਹੈਲਥ ਚੈਕ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਤੁਰੰਤ ਸਿਹਤ ਜਾਂਚ
azd show
azd env get-values
azd monitor --logs
```

### ਡਿਪਲੋਇਮੈਂਟ ਵੈਲਿਡੇਸ਼ਨ
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### ਵਾਤਾਵਰਣ ਤੁਲਨਾ
```bash
#!/bin/bash
# ਮਾਹੌਲਾਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ਰਿਸੋਰਸ ਸਾਫ਼-ਸੁਥਰਾ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਪੁਰਾਣੇ ਵਾਤਾਵਰਣਾਂ ਸਾਫ਼ ਕਰੋ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ

### ਆਮ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
```bash
# ਅਜ਼ੂਰ ਸੰਰਚਨਾ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD ਸੰਰਚਨਾ
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ਐਪਲੀਕੇਸ਼ਨ ਸੰਰਚਨਾ
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ਐਮਰਜੈਂਸੀ ਕਮਾਂਡਾਂ

### ਤੁਰੰਤ ਸਮਾਧਾਨ
```bash
# ਪ੍ਰਮਾਣਿਕਤਾ ਰੀਸੈਟ ਕਰੋ
az account clear
az login

# ਮਾਹੌਲ ਨੂੰ ਮਜ਼ਬੂਰੀ ਨਾਲ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh

# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਨੂੰ ਦੁਬਾਰਾ ਤਾਇਨਾਤ ਕਰੋ
azd deploy

# ਤਾਇਨਾਤੀ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show --output json
```

### ਰਿਕਵਰੀ ਕਮਾਂਡਾਂ
```bash
# ਫੇਲ ਹੋਏ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਹਾਲ ਕਰੋ - ਸਾਫ਼ ਕਰੋ ਅਤੇ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd down --force --purge
azd up

# ਸਿਰਫ਼ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਨੂੰ ਦੁਬਾਰਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision

# ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy
```

## 💡 ਪ੍ਰੋ ਟਿੱਪਸ

### ਤੇਜ਼ ਵਰਕਫਲੋ ਲਈ ਐਲਿਆਸ
```bash
# ਆਪਣੇ .bashrc ਜਾਂ .zshrc ਵਿੱਚ ਸ਼ਾਮِل ਕਰੋ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ਫੰਕਸ਼ਨ ਸ਼ਾਰਟਕਟ
```bash
# ਤੇਜ਼ ਵਾਤਾਵਰਣ ਬਦਲਾਅ
azd-env() {
    azd env select $1 && azd show
}

# ਨਿਗਰਾਨੀ ਨਾਲ ਤੇਜ਼ ਤੈਨਾਤੀ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ਵਾਤਾਵਰਣ ਦੀ ਸਥਿਤੀ
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ਸਹਾਇਤਾ ਅਤੇ ਦਸਤਾਵੇਜ਼

### ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਕਰਨਾ
```bash
# ਸਧਾਰਨ ਸਹਾਇਤਾ
azd --help
azd help

# ਕਮਾਂਡ-ਵਿਸ਼ੇਸ਼ ਸਹਾਇਤਾ
azd up --help
azd env --help
azd config --help

# ਵਰਜ਼ਨ ਅਤੇ ਬਿਲਡ ਸੰਬੰਧੀ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd version
azd version --output json
```

### ਦਸਤਾਵੇਜ਼ ਲਿੰਕ
```bash
# ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਨੂੰ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੋ
azd docs

# ਟੈਂਪਲੇਟ ਦੀ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਦਿਖਾਓ
azd template show <template-name> --docs
```

---

**ਸੁਝਾਅ**: ਇਸ ਚੀਟ ਸ਼ੀਟ ਨੂੰ ਬੁੱਕਮਾਰਕ ਕਰੋ ਅਤੇ `Ctrl+F` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਜਲਦੀ ਆਪਣੇ ਲੋੜੀਂਦੇ ਕਮਾਂਡ ਲੱਭੋ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਪ੍ਰੀਫਲਾਈਟ ਚੈਕਸ](../docs/pre-deployment/preflight-checks.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸ਼ਬਦਾਵਲੀ](glossary.md)

---

> **💡 ਕੀ ਤੁਸੀਂ ਆਪਣੇ ਐਡੀਟਰ ਵਿੱਚ Azure ਕਮਾਂਡ ਮਦਦ ਚਾਹੁੰਦੇ ਹੋ?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, deployment, diagnostics ਅਤੇ ਹੋਰ ਲਈ 37 ਸਕਿਲਜ਼।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਸਮਝਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਪ੍ਰਯੋਗ ਤੋਂ ਉਤਪੰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->