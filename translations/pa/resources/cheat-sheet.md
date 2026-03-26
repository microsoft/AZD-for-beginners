# ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ - ਜ਼ਰੂਰੀ AZD ਕਮਾਂਡ

**ਸਾਰੇ ਅਧਿਆਇਆਂ ਲਈ ਤੁਰੰਤ ਹਵਾਲਾ**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ AZD](../README.md)
- **📖 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**: [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ਕਮਾਂਡ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ਉन्नਤ**: [ਅਧਿਆਇ 4: ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਐਜ਼ ਕੋਡ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਤ ਚੀਟ ਸ਼ੀਟ ਸਭ ਤੋਂ ਅਕਸਰ ਵਰਤੇ ਜਾਂਦੇ Azure Developer CLI ਕਮਾਂਡਾਂ ਲਈ ਤੁਰੰਤ ਹਵਾਲਾ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ, ਜਿਸ ਨੂੰ ਵਰਗਾਂ ਅਨੁਸਾਰ ਪ੍ਰਯੋਗਕਾਰੀ ਉਦਾਹਰਨਾਂ ਦੇ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕੀਤਾ ਗਿਆ ਹੈ। azd ਪ੍ਰੋਜੈਕਟਾਂ ਨਾਲ ਵਿਕਾਸ, ਸਮੱਸਿਆ ਨਿਵਾਰਣ, ਅਤੇ ਰੋਜ਼ਾਨਾ ਓਪਰੇਸ਼ਨਾਂ ਦੌਰਾਨ ਤੇਜ਼ ਲੁੱਕਅੱਪ ਲਈ ਇਹ ਉੱਤਮ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਚੀਟ ਸ਼ੀਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਤੁਸੀਂ:
- Azure Developer CLI ਦੀਆਂ ਅਹਮ ਕਮਾਂਡਾਂ ਅਤੇ ਸਿੰਟੈਕਸ ਤੁਰੰਤ ਪ੍ਰਾਪਤ ਕਰ ਸਕੋਗੇ
- ਕਮਾਂਡਾਂ ਨੂੰ ਕਾਰਗੁਜ਼ਾਰੀ ਪ੍ਰਕਾਰਾਂ ਅਤੇ ਵਰਤੋਂ ਮਾਮਲਿਆਂ ਅਨੁਸਾਰ ਸਮਝ ਸਕੋਗੇ
- ਆਮ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਸਥਿਤੀਆਂ ਲਈ ਪ੍ਰਯੋਗਕਾਰੀ ਉਦਾਹਰਨਾਂ ਨੂੰ ਹਵਾਲਾ ਦੇ ਸਕੋਗੇ
- ਤੇਜ਼ ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਲਈ ਡਾਇਗਨੋਸਟਿਕ ਕਮਾਂਡਾਂ ਤੱਕ ਪਹੁੰਚ ਰੱਖ ਸਕੋਗੇ
- ਅਡਵਾਂਸਡ ਸੰਰਚਨਾ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਮਾਹੌਲ ਪ੍ਰਬੰਧਨ ਅਤੇ ਬਹੁ-ਮਾਹੌਲ ਵਰਕਫਲੋ ਕਮਾਂਡਾਂ ਨੂੰ ਲਭ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਨਿਯਮਿਤ ਹਵਾਲੇ ਨਾਲ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- ਬਿਨਾਂ ਪੂਰੇ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਵੇਖੇ azd ਕਮਾਂਡਾਂ ਨੂੰ ਆਤਮ-ਵਿਸ਼ਵਾਸ ਨਾਲ ਚਲਾਉਣ ਲਈ
- ਉਚਿਤ ਡਾਇਗਨੋਸਟਿਕ ਕਮਾਂਡਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਹੱਲ ਕਰਨ ਲਈ
- ਕੁਝ ਵਾਤਾਵਰਣ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਸਥਿਤੀਆਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ালী ਢੰਗ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ
- ਲੋੜ ਮੁਤਾਬਕ ਉੱਨਤ azd ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਅਤੇ ਸੰਰਚਨਾ ਵਿਕਲਪਾਂ ਨੂੰ ਲਾਗੂ ਕਰਨ ਲਈ
- ਵਿਧਿਤ ਕਮਾਂਡ ਸੀਕਵੈਂਸਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨ ਲਈ
- azd ਸ਼ਾਰਟਕਟਸ ਅਤੇ ਵਿਕਲਪਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਰਾਹੀਂ ਵਰਕਫਲੋ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰਨ ਲਈ

## ਸ਼ੁਰੂਆਤੀ ਕਮਾਂਡ

### ਪ੍ਰਮਾਣੀਕਰਨ
```bash
# AZD ਰਾਹੀਂ Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
azd auth login

# Azure CLI ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ (AZD ਇਸਨੂੰ ਅੰਦਰੋਂ ਵਰਤਦਾ ਹੈ)
az login

# ਮੌਜੂਦਾ ਖਾਤਾ ਚੈੱਕ ਕਰੋ
az account show

# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ਤੋਂ ਲੌਗਆਉਟ ਕਰੋ
azd auth logout

# Azure CLI ਤੋਂ ਲੌਗਆਉਟ ਕਰੋ
az logout
```

### ਪ੍ਰੋਜੈਕਟ ਦੀ ਸ਼ੁਰੂਆਤ
```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਵੇਖੋ
azd template list

# ਟੈਮਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਸ਼ੁਰੂ ਕਰੋ
azd init .

# ਕਸਟਮ ਨਾਮ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo my-awesome-app
```

## ਮੁੱਖ ਡਿਪਲੋਇਮੈਂਟ ਕਮਾਂਡ

### ਪੂਰਾ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ
```bash
# ਸਭ ਕੁਝ ਡਿਪਲੋਇ ਕਰੋ (ਪ੍ਰੋਵੀਜ਼ਨ + ਡਿਪਲੋਇ)
azd up

# ਪੁਸ਼ਟੀ ਕਰਨ ਵਾਲੇ ਪ੍ਰਾਂਪਟਾਂ ਬੰਦ ਕਰਕੇ ਡਿਪਲੋਇ ਕਰੋ
azd up --confirm-with-no-prompt

# ਨਿਰਧਾਰਤ ਵਾਤਾਵਰਨ 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਦੇ ਨਾਲ ਡਿਪਲੋਇ ਕਰੋ
azd up --parameter location=westus2
```

### ਸਿਰਫ ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ
```bash
# Azure ਸਰੋਤ ਪ੍ਰਦਾਨ ਕਰੋ
azd provision

# 🧪 ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਬਦਲਾਵਾਂ ਦਾ ਪੂਰਵ ਦਰਸ਼ਨ
azd provision --preview
# ਇਹ ਡ੍ਰਾਈ-ਰਨ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਕਿਹੜੇ ਸਰੋਤ ਬਣਾਏ/ਸੰਸ਼ੋਧਿਤ/ਹਟਾਏ ਜਾਣਗੇ
# ਇਹ 'terraform plan' ਜਾਂ 'bicep what-if' ਵਰਗਾ ਹੈ - ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ, ਕੋਈ ਤਬਦੀਲੀ ਲਾਗੂ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ
```

### ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਕਿਸੇ ਖਾਸ ਸੇਵਾ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਭ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy --all
```

### ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ
```bash
# ਐਪਲੀਕੇਸ਼ਨਾਂ ਬਣਾਓ
azd package

# ਨਿਰਧਾਰਤ ਸੇਵਾ ਬਣਾਓ
azd package --service api
```

## 🌍 ਮਾਹੌਲ ਪ੍ਰਬੰਧਨ

### ਮਾਹੌਲ ਕਾਰਜ
```bash
# ਸਾਰੇ ਮਾਹੌਲ ਦਿਖਾਓ
azd env list

# ਨਵਾਂ ਮਾਹੌਲ ਬਣਾਓ
azd env new development
azd env new staging --location westus2

# ਮਾਹੌਲ ਚੁਣੋ
azd env select production

# ਮੌਜੂਦਾ ਮਾਹੌਲ ਦਿਖਾਓ
azd env show

# ਮਾਹੌਲ ਦੀ ਹਾਲਤ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh
```

### ਮਾਹੌਲ ਵੈਰੀਏਬਲ
```bash
# ਵਾਤਾਵਰਣ ਚਰ ਸੈਟ ਕਰੋ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ਵਾਤਾਵਰਣ ਚਰ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get API_KEY

# ਸਾਰੇ ਵਾਤਾਵਰਣ ਚਰਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd env get-values

# ਵਾਤਾਵਰਣ ਚਰ ਹਟਾਓ
azd env unset DEBUG
```

## ⚙️ ਸੰਰਚਨਾ ਕਮਾਂਡ

### ਗਲੋਬਲ ਸੰਰਚਨਾ
```bash
# ਸਾਰੀਆਂ ਸੰਰਚਨਾਵਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd config list

# ਗਲੋਬਲ ਡਿਫ਼ਾਲਟ ਸੈੱਟ ਕਰੋ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ਸੰਰਚਨਾ ਹਟਾਓ
azd config unset defaults.location

# ਸਾਰੀਆਂ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਰੀਸੈਟ ਕਰੋ
azd config reset
```

### ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ
```bash
# azure.yaml ਦੀ ਜਾਂਚ ਕਰੋ
azd config validate

# ਪ੍ਰੋਜੈਕਟ ਦੀ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd show

# ਸੇਵਾ ਦੇ ਐਂਡਪੋਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json
```

## 📊 ਨਿਗਰਾਨੀ ਅਤੇ ਡਾਇਗਨੋਸਟਿਕਸ

### ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ
```bash
# Azure ਪੋਰਟਲ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor

# Application Insights ਲਾਈਵ ਮੈਟਰਿਕਸ ਖੋਲ੍ਹੋ
azd monitor --live

# Application Insights ਲੌਗ ਬਲੇਡ ਖੋਲ੍ਹੋ
azd monitor --logs

# Application Insights ਓਵਰਵਿਊ ਖੋਲ੍ਹੋ
azd monitor --overview
```

### ਕੰਟੇਨਰ ਲੌਗ ਦੇਖਣਾ
```bash
# Azure CLI ਰਾਹੀਂ ਲੌਗ ਵੇਖੋ (Container Apps ਲਈ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ਲੌਗਾਂ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਫਾਲੋ ਕਰੋ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ਪੋਰਟਲ ਤੋਂ ਲੌਗ ਵੇਖੋ
azd monitor --logs
```

### ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਕੁਐਰੀਜ਼
```bash
# Azure ਪੋਰਟਲ ਰਾਹੀਂ ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਤੱਕ ਪਹੁੰਚ ਕਰੋ
azd monitor --logs

# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗਾਂ ਨੂੰ ਕੁਐਰੀ ਕਰੋ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ਮੇਂਟੇਨੈਂਸ ਕਮਾਂਡ

### ਸਫਾਈ
```bash
# ਸਾਰੇ Azure ਰਿਸੋਰਸ ਹਟਾਓ
azd down

# ਪੁਸ਼ਟੀ ਦੇ ਬਿਨਾਂ ਜਬਰਦਸਤੀ ਮਿਟਾਓ
azd down --force

# ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਰਿਸੋਰਸਾਂ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਹਟਾਓ
azd down --purge

# ਮੁਕੰਮਲ ਸਾਫ਼-ਸਫਾਈ
azd down --force --purge
```

### ਅੱਪਡੇਟਸ
```bash
# azd ਅੱਪਡੇਟਾਂ ਲਈ ਜਾਂਚ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਵਰਜਨ ਪ੍ਰਾਪਤ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਵੇਖੋ
azd config list
```

## 🔧 ਉੱਨਤ ਕਮਾਂਡ

### ਪਾਈਪਲਾਈਨ ਅਤੇ CI/CD
```bash
# GitHub Actions ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ
azd pipeline config

# Azure DevOps ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ
azd pipeline config --provider azdo

# ਪਾਈਪਲਾਈਨ ਦੀ ਸੰਰਚਨਾ ਦਿਖਾਓ
azd pipeline show
```

### ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰਬੰਧਨ
```bash
# ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੈਮਪਲੇਟ ਬਣਾਓ
azd infra generate

# 🧪 ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੀਵਿਊ ਅਤੇ ਯੋਜਨਾ
azd provision --preview
# ਡਿਪਲੌਇ ਕੀਤੇ ਬਗੈਰ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦੀ ਨਕਲ ਕਰਦਾ ਹੈ
# Bicep/Terraform ਟੈਮਪਲੇਟਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ ਅਤੇ ਦਿਖਾਉਂਦਾ ਹੈ:
# - ਜੋ ਰਿਸੋਰਸ ਜੋੜੇ ਜਾਣਗੇ (ਹਰਾ +)
# - ਜੋ ਰਿਸੋਰਸ ਬਦਲੇ ਜਾਣਗੇ (ਪੀਲਾ ~)
# - ਜੋ ਰਿਸੋਰਸ ਹਟਾਏ ਜਾਣਗੇ (ਲਾਲ -)
# ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ - Azure ਵਾਤਾਵਰਣ ਵਿੱਚ ਕੋਈ ਵਾਸਤੀ ਬਦਲਾਵ ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ

# azure.yaml ਤੋਂ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਤਿਆਰ ਕਰੋ
azd infra synth
```

### ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ
```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸਥਿਤੀ ਅਤੇ ਐਂਡਪੌਇੰਟਸ ਦਿਖਾਓ
azd show

# ਵਿਸਤ੍ਰਤ ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ ਨੂੰ JSON ਵਜੋਂ ਦਿਖਾਓ
azd show --output json

# ਸੇਵਾ ਦੇ ਐਂਡਪੌਇੰਟਸ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json | jq '.services'
```

## 🤖 AI ਅਤੇ ਐਕਸਟੈਂਸ਼ਨ ਕਮਾਂਡ

### AZD ਐਕਸਟੈਂਸ਼ਨ
```bash
# ਸਾਰੇ ਉਪਲਬਧ ਐਕਸਟੈਂਸ਼ਨ ਦਰਸਾਓ (AI ਸਮੇਤ)
azd extension list

# Foundry agents ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.agents

# fine-tuning ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.finetune

# ਕਸਟਮ ਮਾਡਲ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.models

# ਸਾਰੇ ਇੰਸਟਾਲ ਕੀਤੇ ਹੋਏ ਐਕਸਟੈਂਸ਼ਨ ਅਪਗ੍ਰੇਡ ਕਰੋ
azd extension upgrade --all
```

### AI ਏਜੰਟ ਕਮਾਂਡ
```bash
# ਮੈਨਿਫੈਸਟ ਤੋਂ ਇੱਕ ਏਜੰਟ ਪ੍ਰੋਜੈਕਟ ਆਰੰਭ ਕਰੋ
azd ai agent init -m <manifest-path-or-uri>

# ਕਿਸੇ ਵਿਸ਼ੇਸ਼ Foundry ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਨਿਸ਼ਾਨਾ ਬਣਾਓ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ਏਜੰਟ ਸਰੋਤ ਡਾਇਰੈਕਟਰੀ ਨਿਰਧਾਰਤ ਕਰੋ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ਹੋਸਟਿੰਗ ਲਈ ਨਿਸ਼ਾਨਾ ਚੁਣੋ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP ਸਰਵਰ (ਅਲਫਾ)
```bash
# ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਲਈ MCP ਸਰਵਰ ਸ਼ੁਰੂ ਕਰੋ
azd mcp start

# MCP ਓਪਰੇਸ਼ਨਾਂ ਲਈ ਟੂਲ ਦੀ ਸਹਿਮਤੀ ਨੂੰ ਪ੍ਰਬੰਧ ਕਰੋ
azd mcp consent
```

### ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਜਨਰੇਸ਼ਨ
```bash
# ਤੁਹਾਡੇ ਪ੍ਰੋਜੈਕਟ ਦੀ ਪਰਿਭਾਸ਼ਾ ਤੋਂ IaC ਫਾਈਲਾਂ ਤਿਆਰ ਕਰੋ
azd infra generate

# azure.yaml ਤੋਂ ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਤਿਆਰ ਕਰੋ
azd infra synth
```

---

## 🎯 ਤੇਜ਼ ਵਰਕਫਲੋ

### ਡਿਵੈਲਪਮੈਂਟ ਵਰਕਫਲੋ
```bash
# ਨਵਾਂ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo
cd my-project

# ਡਿਵੈਲਪਮੈਂਟ 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ
azd env new dev
azd up

# ਤਬਦੀਲੀਆਂ ਕਰੋ ਅਤੇ ਮੁੜ ਡਿਪਲੋਇ ਕਰੋ
azd deploy

# ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --live
```

### ਬਹੁ-ਮਾਹੌਲ ਵਰਕਫਲੋ
```bash
# ਵਾਤਾਵਰਣ ਸਥਾਪਿਤ ਕਰੋ
azd env new dev
azd env new staging  
azd env new production

# ਡੈਵ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env select dev
azd up

# ਟੈਸਟ ਕਰੋ ਅਤੇ ਸਟੇਜਿੰਗ 'ਤੇ ਪ੍ਰੋਮੋਟ ਕਰੋ
azd env select staging
azd up

# ਉਤਪਾਦਨ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env select production
azd up
```

### ਟਰਬਲਸ਼ੂਟਿੰਗ ਵਰਕਫਲੋ
```bash
# ਡੀਬੱਗ ਮੋਡ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਚੈੱਕ ਕਰੋ
azd show

# ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd config list

# ਲੌਗਾਂ ਲਈ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --logs

# ਸੰਸਾਧਨ ਦੀ ਸਥਿਤੀ ਚੈੱਕ ਕਰੋ
azd show --output json
```

## 🔍 ਡੀਬੱਗਿੰਗ ਕਮਾਂਡ

### ਡੀਬੱਗ ਜਾਣਕਾਰੀ
```bash
# ਡਿਬੱਗ ਆਉਟਪੁੱਟ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug

# ਸਾਫ਼ ਆਉਟਪੁੱਟ ਲਈ ਟੈਲੀਮੇਟਰੀ ਬੰਦ ਕਰੋ
export AZD_DISABLE_TELEMETRY=true

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
azd config list

# ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az account show
```

### ਟੈਮਪਲੇਟ ਡੀਬੱਗਿੰਗ
```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਵਿਸਥਾਰ ਸਮੇਤ ਸੂਚੀਬੱਧ ਕਰੋ
azd template list --output json

# ਟੈਮਪਲੇਟ ਦੀ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd template show <template-name>

# ਇਨਿਟ ਤੋਂ ਪਹਿਲਾਂ ਟੈਮਪਲੇਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd template validate <template-name>
```

## 📁 ਫਾਇਲ ਅਤੇ ਡਾਇਰੈਕਟਰੀ ਕਮਾਂਡ

### ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ
```bash
# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਦੀ ਸਰਚਨਾ ਦਿਖਾਓ
tree /f  # ਵਿਂਡੋਜ਼
find . -type f  # ਲਿਨਕਸ/macOS

# azd ਪ੍ਰੋਜੈਕਟ ਦੇ ਰੂਟ ਵਿੱਚ ਜਾਓ
cd $(azd root)

# azd ਕੰਫਿਗਰੇਸ਼ਨ ਡਾਇਰੈਕਟਰੀ ਦਿਖਾਓ
echo $AZD_CONFIG_DIR  # ਆਮ ਤੌਰ 'ਤੇ ~/.azd
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

# ਤੈਨਾਤ ਕੀਤੀਆਂ ਸੇਵਾਵਾਂ ਦੇਖੋ
azd show --output json | jq '.services | keys'
```

## 🔧 ਆਮ ਕਮਾਂਡ ਸੰਯੋਜਨ

### ਹੈਲਥ ਚੈਕ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਤੇਜ਼ ਸਿਹਤ ਦੀ ਜਾਂਚ
azd show
azd env show
azd monitor --logs
```

### ਡਿਪਲੋਇਮੈਂਟ ਮਨਜ਼ੂਰੀ
```bash
#!/bin/bash
# ਤੈਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਪੁਸ਼ਟੀ
azd show
azd provision --preview  # ਤੈਨਾਤੀ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਤਬਦੀਲੀਆਂ ਵੇਖੋ
az account show
```

### ਮਾਹੌਲ ਤੁਲਨਾ
```bash
#!/bin/bash
# ਵਾਤਾਵਰਨਾਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ਰਿਸੋਰਸ ਸਫਾਈ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਪੁਰਾਣੇ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ਮਾਹੌਲ ਵੈਰੀਏਬਲ

### ਆਮ ਮਾਹੌਲ ਵੈਰੀਏਬਲ
```bash
# ਅਜ਼ੂਰ ਕੰਫਿਗਰੇਸ਼ਨ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD ਕੰਫਿਗਰੇਸ਼ਨ
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ਐਪਲੀਕੇਸ਼ਨ ਕੰਫਿਗਰੇਸ਼ਨ
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ਐਮਰਜੈਂਸੀ ਕਮਾਂਡ

### ਤੁਰੰਤ ਸੁਧਾਰ
```bash
# ਪ੍ਰਮਾਣਿਕਤਾ ਨੂੰ ਰੀਸੈਟ ਕਰੋ
az account clear
az login

# ਵਾਤਾਵਰਣ ਨੂੰ ਜਬਰਦਸਤੀ ਰੀਫ੍ਰੈਸ਼ ਕਰੋ
azd env refresh

# ਸਭ ਸੇਵਾਵਾਂ ਨੂੰ ਮੁੜ ਤਾਇਨਾਤ ਕਰੋ
azd deploy

# ਤਾਇਨਾਤੀ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show --output json
```

### ਪੁਨਰ-ਪ੍ਰਾਪਤੀ ਕਮਾਂਡ
```bash
# ਅਸਫਲ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਹਾਲ ਕਰੋ - ਸਾਫ਼ ਕਰ ਕੇ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd down --force --purge
azd up

# ਕੇਵਲ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਨੂੰ ਮੁੜ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision

# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy
```

## 💡 ਪ੍ਰੋ ਸੁਝਾਵ

### ਤੇਜ਼ ਵਰਕਫਲੋ ਲਈ ਸ਼ਾਰਟਕਟ ਨਾਮ
```bash
# ਆਪਣੇ .bashrc ਜਾਂ .zshrc ਵਿੱਚ ਸ਼ਾਮਿਲ ਕਰੋ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ਫੰਕਸ਼ਨ ਸ਼ਾਰਟਕਟ
```bash
# ਤੇਜ਼ ਵਾਤਾਵਰਣ ਬਦਲਣਾ
azd-env() {
    azd env select $1 && azd show
}

# ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਤੇਜ਼ ਡਿਪਲੋਇਮੈਂਟ
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

## 📖 ਸਹਾਇਤਾ ਅਤੇ ਦਸਤਾਵੇਜ਼

### ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਕਰਨਾ
```bash
# ਆਮ ਮਦਦ
azd --help
azd help

# ਕਮਾਂਡ-ਖਾਸ ਮਦਦ
azd up --help
azd env --help
azd config --help

# ਵਰਜਨ ਅਤੇ ਬਿਲਡ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd version
azd version --output json
```

### ਦਸਤਾਵੇਜ਼ ਲਿੰਕ
```bash
# ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਨੂੰ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੋ
azd docs

# ਟੈਮਪਲੇਟ ਦੀ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਦਿਖਾਓ
azd template show <template-name> --docs
```

---

**ਟਿਪ**: ਇਸ ਚੀਟਸ਼ੀਟ ਨੂੰ ਬੁੱਕਮਾਰਕ ਕਰੋ ਅਤੇ ਜ਼ਰੂਰੀ ਕਮਾਂਡਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਲੱਭਣ ਲਈ `Ctrl+F` ਦੀ ਵਰਤੋਂ ਕਰੋ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਪ੍ਰੀਫਲਾਈਟ ਚੈੱਕਸ](../docs/pre-deployment/preflight-checks.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸ਼ਬਦਾਵਲੀ](glossary.md)

---

> **💡 ਕੀ ਤੁਸੀਂ ਆਪਣੇ ਐਡੀਟਰ ਵਿੱਚ Azure ਕਮਾਂਡ ਸਹਾਇਤਾ ਚਾਹੁੰਦੇ ਹੋ?** ਇਨਸਟਾਲ ਕਰੋ [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ਨਾਲ `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, ਡਿਪਲੋਇਮੈਂਟ, ਡਾਇਗਨੋਸਟਿਕਸ ਅਤੇ ਹੋਰ ਲਈ 37 ਸਕਿਲਜ਼.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਰਨ**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਟੀਰਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਅਹਿਮ ਮਾਹਿਤੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾਵ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->