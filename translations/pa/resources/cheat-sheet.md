# ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ - ਜ਼ਰੂਰੀ AZD ਕਮਾਂਡਾਂ

**ਸਾਰੇ ਅਧਿਆਇਆਂ ਲਈ ਤਤਕਾਲ ਸੰਦਰਭ**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../README.md)
- **📖 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**: [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ਕਮਾਂਡਾਂ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ਉਨੱਤ**: [ਅਧਿਆਇ 4: ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਏਜ਼ ਕੋਡ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਚੀਟ ਸ਼ੀਟ ਸਭ ਤੋਂ ਆਮ ਤੌਰ 'ਤੇ ਵਰਤੀਆਂ ਜਾਣ ਵਾਲੀਆਂ Azure Developer CLI ਕਮਾਂਡਾਂ ਲਈ ਤਤਕਾਲ ਸੰਦਰਭ ਦਿੰਦੀ ਹੈ, ਜਿਨ੍ਹਾਂ ਨੂੰ ਵਰਗਾਂ ਮੁਤਾਬਕ ਯਥਾਰਥ ਉਦਾਹਰਣਾਂ ਨਾਲ ਵਿਵਸਥਿਤ ਕੀਤਾ ਗਿਆ ਹੈ। ਵਿਕਾਸ, ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਅਤੇ azd ਪ੍ਰੋਜੈਕਟਾਂ ਨਾਲ ਰੋਜ਼ਾਨਾ ਆਪਰੇਸ਼ਨਾਂ ਦੌਰਾਨ ਤੇਜ਼ ਦਿਖਾਈ ਲਈ ਇਹ ਬਿਹਤਰ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਚੀਟ ਸ਼ੀਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਤੁਸੀਂ:
- ਮੌਜੂਦਾ Azure Developer CLI ਕਮਾਂਡਾਂ ਅਤੇ ਸਿੰਟੈਕਸ ਤੱਕ ਤੁਰੰਤ ਪਹੁੰਚ ਪਾਵੋਗੇ
- ਕਾਰਜਾਤਮਕ ਵਰਗਾਂ ਅਤੇ ਉਪਯੋਗ ਮਾਮਲਿਆਂ ਦੁਆਰਾ ਕਮਾਂਡਾਂ ਦੀ ਸੰਗਠਨਾ ਨੂੰ ਸਮਝੋਗੇ
- ਆਮ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਦ੍ਰਿਸ਼ਾਂ ਲਈ ਪਰੈਕਟਿਕਲ ਉਦਾਹਰਣਾਂ ਨੂੰ ਹਵਾਲਾ ਦੇ ਸਕੋਗੇ
- ਤੁਰੰਤ ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਲਈ ਡਾਇਗਨੋਸਟਿਕ ਕਮਾਂਡਾਂ ਤੱਕ ਪਹੁੰਚ ਪ੍ਰਾਪਤ ਕਰੋਗੇ
- ਉੱਨਤ ਸੰਰਚਨਾ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਲੱਭ ਸਕੋਗੇ
- ਐਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ ਅਤੇ ਬਹੁ-ਐਨਵਾਇਰਨਮੈਂਟ ਵਰਕਫਲੋ ਕਮਾਂਡਾਂ ਨੂੰ ਲੱਭ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਨਿਯਮਤ ਰੂਪ ਵਿੱਚ ਇਸ ਚੀਟ ਸ਼ੀਟ ਦਾ ਹਵਾਲਾ ਦੇਣ ਨਾਲ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਪੂਰੇ ਦਸਤਾਵੇਜ਼ਾਂ ਤੋਂ ਬਿਨਾਂ azd ਕਮਾਂਡਾਂ ਨਿਰਭਰ ਹੋਕੇ ਚਲਾਉਣ
- ਉਚਿਤ ਡਾਇਗਨੋਸਟਿਕ ਕਮਾਂਡਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਹੱਲ ਕਰਨ
- ਕਈ ਐਨਵਾਇਰਨਮੈਂਟਾਂ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਦ੍ਰਿਸ਼ਾਂ ਨੂੰ ਸੁਚੱਜੇ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰਨ
- ਲੋੜ ਅਨੁਸਾਰ ਉੱਨਤ azd ਫੀਚਰ ਅਤੇ ਸੰਰਚਨਾ ਵਿਕਲਪ ਲਾਗੂ ਕਰਨ
- ਵਿਧੀਵਤ ਕਮਾਂਡ ਸੀਕਵੈਂਸ ਦੇ ਜ਼ਰੀਏ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨ
- azd ਸ਼ਾਰਟਕਟਾਂ ਅਤੇ ਵਿਕਲਪਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਰਾਹੀਂ ਵਰਕਫਲੋਜ਼ ਦਾ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਕਰਨ

## ਸ਼ੁਰੂਆਤ ਕਰਨ ਦੀਆਂ ਕਮਾਂਡਾਂ

### ਪ੍ਰਮਾਣਿਕਤਾ
```bash
# AZD ਰਾਹੀਂ Azure ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ
azd auth login

# Azure CLI ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ (AZD ਪਿਛੋਕੜ ਵਿੱਚ ਇਸ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ)
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
# ਉਪਲਬਧ ਟੈਂਪਲੇਟਾਂ ਵੇਖੋ
azd template list

# ਟੈਂਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਸ਼ੁਰੂ ਕਰੋ
azd init .

# ਕਸਟਮ ਨਾਮ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo my-awesome-app
```

## ਕੇਂਦਰੀ ਡਿਪਲੋਇਮੈਂਟ ਕਮਾਂਡਾਂ

### ਪੂਰਾ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ
```bash
# ਸਭ ਕੁਝ ਤੈਨાત ਕਰੋ (ਪ੍ਰੋਵਿਜ਼ਨ + ਡਿਪਲੋਏ)
azd up

# ਪੁਸ਼ਟੀ ਪ੍ਰਾਂਪਟਾਂ ਬੰਦ ਕਰਕੇ ਤੈਨਾਤ ਕਰੋ
azd up --confirm-with-no-prompt

# ਨਿਰਧਾਰਿਤ ਮਾਹੌਲ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਦੇ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --parameter location=westus2
```

### ਸਿਰਫ ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ
```bash
# Azure ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision

# 🧪 ਢਾਂਚਾਗਤ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰੀਵਿਊ
azd provision --preview
# ਇਹ ਇੱਕ ਡ੍ਰਾਈ-ਰਨ ਨਜ਼ਾਰਾ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਕਿਹੜੇ ਸਰੋਤ ਬਣਾਏ, ਸੋਧੇ ਜਾਂ ਮਿਟਾਏ ਜਾਣਗੇ
# 'terraform plan' ਜਾਂ 'bicep what-if' ਵਰਗਾ - ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ, ਕੋਈ ਤਬਦੀਲੀ ਲਾਗੂ ਨਹੀਂ ਹੋਵੇਗੀ
```

### ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਖਾਸ ਸੇਵਾ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy --all
```

### ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ
```bash
# ਐਪਲੀਕੇਸ਼ਨਾਂ ਬਣਾਓ
azd package

# ਖਾਸ ਸੇਵਾ ਬਣਾਓ
azd package --service api
```

## 🌍 ਐਨਵਾਇਰਨਮੈਂਟ ਪ੍ਰਬੰਧਨ

### ਐਨਵਾਇਰਨਮੈਂਟ ਕਾਰਵਾਈਆਂ
```bash
# ਸਾਰੇ ਇਨਵਾਇਰਮੈਂਟਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd env list

# ਨਵਾਂ ਇਨਵਾਇਰਮੈਂਟ ਬਣਾਓ
azd env new development
azd env new staging --location westus2

# ਇਨਵਾਇਰਮੈਂਟ ਚੁਣੋ
azd env select production

# ਮੌਜੂਦਾ ਇਨਵਾਇਰਮੈਂਟ ਦਿਖਾਓ
azd env show

# ਇਨਵਾਇਰਮੈਂਟ ਦੀ ਸਥਿਤੀ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh
```

### ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ
```bash
# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get API_KEY

# ਸਾਰੇ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਾਂ ਨੂੰ ਲਿਸਟ ਕਰੋ
azd env get-values

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਹਟਾਓ
azd env unset DEBUG
```

## ⚙️ ਸੰਰਚਨਾ ਕਮਾਂਡਾਂ

### ਗਲੋਬਲ ਸੰਰਚਨਾ
```bash
# ਸਭ ਕੰਫਿਗਰੇਸ਼ਨ ਦਿਖਾਓ
azd config list

# ਗਲੋਬਲ ਡਿਫਾਲਟ ਸੈੱਟ ਕਰੋ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ਕੰਫਿਗਰੇਸ਼ਨ ਹਟਾਓ
azd config unset defaults.location

# ਸਭ ਕੰਫਿਗਰੇਸ਼ਨ ਰੀਸੈਟ ਕਰੋ
azd config reset
```

### ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ
```bash
# azure.yaml ਦੀ ਜਾਂਚ ਕਰੋ
azd config validate

# ਪ੍ਰੋਜੈਕਟ ਦੀ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd show

# ਸੇਵਾ ਐਂਡਪਾਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json
```

## 📊 ਨਿਗਰਾਨੀ ਅਤੇ ਡਾਇਗਨੋਸਟਿਕਸ

### ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ
```bash
# Azure ਪੋਰਟਲ ਵਿੱਚ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor

# Application Insights ਦੀ ਲਾਈਵ ਮੈਟਰਿਕਸ ਖੋਲ੍ਹੋ
azd monitor --live

# Application Insights ਦਾ ਲੌਗਜ਼ ਬਲੇਡ ਖੋਲ੍ਹੋ
azd monitor --logs

# Application Insights ਦਾ ਓਵਰਵਿਊ ਖੋਲ੍ਹੋ
azd monitor --overview
```

### ਕੰਟੇਨਰ ਲੌਗ ਵੇਖਣਾ
```bash
# Azure CLI ਰਾਹੀਂ ਲੌਗ ਵੇਖੋ (Container Apps ਲਈ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਲੌਗਾਂ ਦਾ ਅਨੁਸਰਣ ਕਰੋ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal ਤੋਂ ਲੌਗ ਵੇਖੋ
azd monitor --logs
```

### ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਕਵੇਰੀਜ਼
```bash
# Azure ਪੋਰਟਲ ਰਾਹੀਂ ਲਾਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤੱਕ ਪਹੁੰਚ ਕਰੋ
azd monitor --logs

# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲਾਗਾਂ ਨੂੰ ਕਵੇਰੀ ਕਰੋ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ਰਖ-ਰਖਾਵ ਕਮਾਂਡਾਂ

### ਸਾਫ਼-ਸਫਾਈ
```bash
# ਸਾਰੇ Azure ਸੰਸਾਧਨਾਂ ਨੂੰ ਹਟਾਓ
azd down

# ਬਿਨਾਂ ਪੁਸ਼ਟੀ ਦੇ ਜ਼ਬਰਦਸਤੀ ਮਿਟਾਓ
azd down --force

# ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੀਆਂ ਸੰਸਾਧਨਾਂ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਨਸ਼ਟ ਕਰੋ
azd down --purge

# ਮੁਕੰਮਲ ਸਫਾਈ
azd down --force --purge
```

### ਅਪਡੇਟ
```bash
# azd ਲਈ ਅਪਡੇਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਵਰਜਨ ਪ੍ਰਾਪਤ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਵੇਖੋ
azd config list
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

### ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰਬੰਧਨ
```bash
# ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਮਪਲੇਟ ਤਿਆਰ ਕਰੋ
azd infra generate

# 🧪 ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੀਵਿਊ ਅਤੇ ਯੋਜਨਾ
azd provision --preview
# ਬਿਨਾਂ ਡਿਪਲੋਇ ਕੀਤੇ ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਦੀ ਨਕਲ ਕਰਦਾ ਹੈ
# Bicep/Terraform ਟੈਮਪਲੇਟਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ ਅਤੇ ਦਿਖਾਉਂਦਾ ਹੈ:
# - ਸ਼ਾਮਲ ਕੀਤੇ ਜਾਣ ਵਾਲੇ ਸਰੋਤ (ਹਰਾ +)
# - ਸੋਧੇ ਜਾਣ ਵਾਲੇ ਸਰੋਤ (ਪੀਲਾ ~)
# - ਮਿਟਾਏ ਜਾਣ ਵਾਲੇ ਸਰੋਤ (ਲਾਲ -)
# ਚਲਾਉਣਾ ਸੁਰੱਖਿਅਤ ਹੈ - Azure ਮਾਹੌਲ ਵਿੱਚ ਕੋਈ ਅਸਲ ਬਦਲਾਵ ਨਹੀਂ ਕੀਤੇ ਜਾਣਗੇ

# azure.yaml ਤੋਂ ਇੰਫਰਾਸਟਰਕਚਰ ਤਿਆਰ ਕਰੋ
azd infra synth
```

### ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ
```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸਥਿਤੀ ਅਤੇ ਐਂਡਪੌਇੰਟ ਦਿਖਾਓ
azd show

# JSON ਵਜੋਂ ਵਿਸਥਾਰਪੂਰਕ ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd show --output json

# ਸੇਵਾ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json | jq '.services'
```

## 🎯 ਤੇਜ਼ ਵਰਕਫਲੋਜ਼

### ਵਿਕਾਸ ਵਰਕਫਲੋ
```bash
# ਨਵਾਂ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo
cd my-project

# ਵਿਕਾਸ ਮਾਹੌਲ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ
azd env new dev
azd up

# ਤਬਦੀਲੀਆਂ ਕਰੋ ਅਤੇ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --live
```

### ਬਹੁ-ਐਨਵਾਇਰਨਮੈਂਟ ਵਰਕਫਲੋ
```bash
# ਵਾਤਾਵਰਣਾਂ ਤਿਆਰ ਕਰੋ
azd env new dev
azd env new staging  
azd env new production

# ਡੈਵ ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env select dev
azd up

# ਟੈਸਟ ਕਰੋ ਅਤੇ ਸਟੇਜਿੰਗ ਵਿੱਚ ਪ੍ਰਮੋਟ ਕਰੋ
azd env select staging
azd up

# ਉਤਪਾਦਨ ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env select production
azd up
```

### ਸਮੱਸਿਆ ਸਮਾਧਾਨ ਵਰਕਫਲੋ
```bash
# ਡੀਬੱਗ ਮੋਡ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true

# ਤੈਨਾਤੀ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show

# ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd config list

# ਲੌਗਾਂ ਲਈ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --logs

# ਸੰਸਾਧਨ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show --output json
```

## 🔍 ਡੀਬੱਗਿੰਗ ਕਮਾਂਡਾਂ

### ਡੀਬੱਗ ਜਾਣਕਾਰੀ
```bash
# ਡੀਬੱਗ ਆਉਟਪੁੱਟ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug

# ਸਾਫ਼ ਆਉਟਪੁੱਟ ਲਈ ਟੈਲੀਮੀਟਰੀ ਬੰਦ ਕਰੋ
export AZD_DISABLE_TELEMETRY=true

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
azd config list

# ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```

### ਟੈਮਪਲੇਟ ਡੀਬੱਗਿੰਗ
```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਵੇਰਵਿਆਂ ਸਮੇਤ ਲਿਸਟ ਕਰੋ
azd template list --output json

# ਟੈਮਪਲੇਟ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd template show <template-name>

# init ਤੋਂ ਪਹਿਲਾਂ ਟੈਮਪਲੇਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd template validate <template-name>
```

## 📁 ਫਾਇਲ ਅਤੇ ਡਾਇਰੈਕਟਰੀ ਕਮਾਂਡਾਂ

### ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ
```bash
# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਦਾ ਢਾਂਚਾ ਦਿਖਾਓ
tree /f  # ਵਿੰਡੋਜ਼
find . -type f  # ਲਿਨਕਸ/ਮੈਕਓਐਸ

# azd ਪ੍ਰੋਜੈਕਟ ਰੂਟ ਤੇ ਜਾਓ
cd $(azd root)

# azd ਦੀ ਕੰਫਿਗਰੇਸ਼ਨ ਡਾਇਰੈਕਟਰੀ ਦਿਖਾਓ
echo $AZD_CONFIG_DIR  # ਆਮ ਤੌਰ ਤੇ ~/.azd
```

## 🎨 ਆਉਟਪੁੱਟ ਫਾਰਮੇਟਿੰਗ

### JSON ਆਉਟਪੁੱਟ
```bash
# ਸਕ੍ਰਿਪਟਿੰਗ ਲਈ JSON ਆਉਟਪੁੱਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json
azd env list --output json
azd config list --output json

# jq ਨਾਲ ਪਾਰਸ ਕਰੋ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ਟੇਬਲ ਆਉਟਪੁੱਟ
```bash
# ਟੇਬਲ ਵਜੋਂ ਫਾਰਮੈਟ ਕਰੋ
azd env list --output table

# ਤੈਨਾਤ ਕੀਤੀਆਂ ਸੇਵਾਵਾਂ ਵੇਖੋ
azd show --output json | jq '.services | keys'
```

## 🔧 ਆਮ ਕਮਾਂਡ ਜੋੜੇ

### ਹੈਲਥ ਚੈੱਕ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਛੇਤੀ ਸਿਹਤ ਦੀ ਜਾਂਚ
azd show
azd env show
azd monitor --logs
```

### ਡਿਪਲੋਇਮੈਂਟ ਤਸਦੀਕ
```bash
#!/bin/bash
# ਤਾਇਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਦਾ ਪ੍ਰਮਾਣੀਕਰਨ
azd show
azd provision --preview  # ਤਾਇਨਾਤੀ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਝਲਕ
az account show
```

### ਐਨਵਾਇਰਨਮੈਂਟ ਤੁਲਨਾ
```bash
#!/bin/bash
# ਵਾਤਾਵਰਣਾਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ਰੀਸੋਰਸ ਸਾਫ਼-ਸੁਥਰਾ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਪੁਰਾਣੇ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸਾਫ ਕਰੋ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ

### ਆਮ ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ
```bash
# ਅਜ਼ੂਰ ਕਨਫਿਗਰੇਸ਼ਨ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD ਕਨਫਿਗਰੇਸ਼ਨ
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ਐਪਲੀਕੇਸ਼ਨ ਕਨਫਿਗਰੇਸ਼ਨ
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ਐਮਰਜੈਂਸੀ ਕਮਾਂਡਾਂ

### ਤੁਰੰਤ ਸੁਧਾਰ
```bash
# ਪ੍ਰਮਾਣਿਕਤਾ ਰੀਸੈਟ ਕਰੋ
az account clear
az login

# ਮਾਹੌਲ ਨੂੰ ਜਬਰਦਸਤੀ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh

# ਸਭ ਸੇਵਾਵਾਂ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਤੈਨਾਤੀ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show --output json
```

### ਪੁਨਰ ਪ੍ਰਾਪਤੀ ਕਮਾਂਡਾਂ
```bash
# ਨਾਕਾਮ ਤੈਨਾਤੀ ਤੋਂ ਬਹਾਲ ਕਰੋ - ਸਾਫ ਕਰੋ ਅਤੇ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd down --force --purge
azd up

# ਸਿਰਫ਼ ਢਾਂਚੇ ਨੂੰ ਮੁੜ ਪ੍ਰੋਵੀਜ਼ਨ ਕਰੋ
azd provision

# ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy
```

## 💡 ਪ੍ਰੋ ਸੁਝਾਅ

### ਤੇਜ਼ ਵਰਕਫਲੋ ਲਈ ਉਪਨਾਮ
```bash
# ਆਪਣੇ .bashrc ਜਾਂ .zshrc ਵਿੱਚ ਜੋੜੋ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ਫੰਕਸ਼ਨ ਸ਼ਾਰਟਕਟ
```bash
# ਵਾਤਾਵਰਣ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਬਦਲਣਾ
azd-env() {
    azd env select $1 && azd show
}

# ਨਿਗਰਾਨੀ ਸਮੇਤ ਤੇਜ਼ ਡਿਪਲੋਇਮੈਂਟ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ਵਾਤਾਵਰਣ ਦੀ ਸਥਿਤੀ
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ਮਦਦ ਅਤੇ ਡੌਕਯੂਮੈੰਟੇਸ਼ਨ

### ਮਦਦ ਪ੍ਰਾਪਤ ਕਰਨਾ
```bash
# ਸਧਾਰਣ ਸਹਾਇਤਾ
azd --help
azd help

# ਕਮਾਂਡ-ਨਿਰਧਾਰਿਤ ਸਹਾਇਤਾ
azd up --help
azd env --help
azd config --help

# ਵਰਜ਼ਨ ਅਤੇ ਬਿਲਡ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd version
azd version --output json
```

### ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਲਿੰਕ
```bash
# ਡੌਕੂਮੈਂਟੇਸ਼ਨ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੋ
azd docs

# ਟੈਮਪਲੇਟ ਡੌਕੂਮੈਂਟੇਸ਼ਨ ਦਿਖਾਓ
azd template show <template-name> --docs
```

---

**ਟਿੱਪ**: ਇਸ ਚੀਟ ਸ਼ੀਟ ਨੂੰ ਬੁੱਕਮਾਰਕ ਕਰੋ ਅਤੇ ਜਲਦੀ ਕਮਾਂਡ ਲੱਭਣ ਲਈ `Ctrl+F` ਦੀ ਵਰਤੋਂ ਕਰੋ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਪ੍ਰੀਫਲਾਈਟ ਜਾਂਚ](../docs/pre-deployment/preflight-checks.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸ਼ਬਦਾਵਲੀ](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰ ਨੋਟਿਸ:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਤਰੁੱਟੀਆਂ ਜਾਂ ਗਲਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਭੁੱਲਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->