# ਕਮਾਂਡ ਚੀਟ ਸੀਟ - ਮਹੱਤਵਪੂਰਨ AZD ਕਮਾਂਡ

**ਸਾਰੇ ਅਧਿਆਇਆਂ ਲਈ ਤੁਰੰਤ ਸੰਦਰਭ**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [ਆਰੰਭਿਕਾਂ ਲਈ AZD](../README.md)
- **📖 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**: [ਅਧਿਆਏ 1: ਮੂਲ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ਕਮਾਂਡਾਂ**: [ਅਧਿਆਏ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ਉੱਨਤ**: [ਅਧਿਆਏ 4: ਇੰਫਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਚੀਟ ਸੀਟ ਆਮ ਤੌਰ 'ਤੇ ਵਰਤੇ ਜਾਣ ਵਾਲੇ Azure Developer CLI ਕਮਾਂਡਾਂ ਲਈ ਤੁਰੰਤ ਸੰਦਰਭ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ, ਜੋ ਵਰਗਾਂ ਅਨੁਸਾਰ ਵਿਹਾਰਿਕ ਉਦਾਹਰਣਾਂ ਨਾਲ ਸੰਗਠਿਤ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ। azd ਪ੍ਰੋਜੈਕਟਾਂ ਦੇ ਵਿਕਾਸ, ਟਰਬਲਸ਼ੂਟਿੰਗ, ਅਤੇ ਰੋਜ਼ਾਨਾ ਓਪਰੇਸ਼ਨਾਂ ਦੌਰਾਨ ਤੇਜ਼ ਰੂਪ ਵਿੱਚ ਵੇਖਣ ਲਈ ਇਹ ਬਹੁਤ ਉਚਿਤ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਚੀਟ ਸੀਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਤੁਸੀਂ:
- ਅਹਿਮ Azure Developer CLI ਕਮਾਂਡਾਂ ਅਤੇ ਸਿੰਟੈਕਸ ਤੱਕ ਤੁਰੰਤ ਪਹੁੰਚ ਪ੍ਰਾਪਤ ਕਰੋਗੇ
- ਫੰਕਸ਼ਨਲ ਵਰਗਾਂ ਅਤੇ ਉਪਯੋਗ-ਕੇਸਾਂ ਅਨੁਸਾਰ ਕਮਾਂਡਾਂ ਦੀ ਵਿਵਸਥਾ ਸਮਝ ਸਕੋਗੇ
- ਆਮ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ ਲਈ ਵਿਹਾਰਿਕ ਉਦਾਹਰਣਾਂ ਨੂੰ ਸੰਦਰਭ ਰੂਪ ਵਿੱਚ ਵੇਖ ਸਕੋਗੇ
- ਤੇਜ਼ ਸਮੱਸਿਆ-ਨਿਰਾਕਰਨ ਲਈ ਟਰਬਲਸ਼ੂਟਿੰਗ ਕਮਾਂਡਾਂ ਤੱਕ ਪਹੁੰਚ ਪ੍ਰਾਪਤ ਕਰੋਗੇ
- ਉੱਨਤ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਵਿਕਲਪ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਲੱਭ ਸਕੋਗੇ
- ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਅਤੇ ਬਹੁ-ਵਾਤਾਵਰਣ ਵਰਕਫਲੋ ਕਮਾਂਡਾਂ ਨੂੰ ਲੱਭ ਅਤੇ ਵਰਤ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਚੀਟ ਸੀਟ ਨੂੰ ਨਿਯਮਤ ਤੌਰ 'ਤੇ ਦੇਖਣ ਨਾਲ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋ ਜਾਵੋਗੇ:
- ਪੂਰੀ ਡੌਕਯੁਮੈਂਟੇਸ਼ਨ ਦਾ ਸੰਦਰਭ ਲਈ ਬਿਨਾਂ azd ਕਮਾਂਡਾਂ ਨੂੰ ਆਤਮਵਿਸ਼ਵਾਸ ਨਾਲ ਚਲਾਉਣਾ
- ਉਪਯੁਕਤ ਨਿਰੀਖਣ ਕਮਾਂਡਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਹੱਲ ਕਰਨਾ
- ਕਈ ਵਾਤਾਵਰਣਾਂ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਪਰਿਦ੍ਰਸ਼ਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰਨਾ
- ਲੋੜ ਮੁਤਾਬਕ ਉੱਨਤ azd ਫੀਚਰਾਂ ਅਤੇ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਲਾਗੂ ਕਰਨਾ
- ਸਿਸਟਮੈਟਿਕ ਕਮਾਂਡ ਲੜੀਆਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦੀ ਟਰਬਲਸ਼ੂਟਿੰਗ ਕਰਨਾ
- azd ਸ਼ਾਰਟਕੱਟਸ ਅਤੇ ਵਿਕਲਪਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਰਾਹੀਂ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਓਪਟੀਮਾਈਜ਼ ਕਰਨਾ

## ਸ਼ੁਰੂਆਤ ਕਰਨ ਵਾਲੀਆਂ ਕਮਾਂਡਾਂ

### ਪ੍ਰਮਾਣੀਕਰਨ
```bash
# AZD ਰਾਹੀਂ Azure ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ
azd auth login

# Azure CLI ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ (AZD ਇਸਨੂੰ ਅੰਦਰੋਂ ਵਰਤਦਾ ਹੈ)
az login

# ਮੌਜੂਦਾ ਖਾਤਾ ਜਾਂਚੋ
az account show

# ਡਿਫੌਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ਤੋਂ ਲੌਗਆਊਟ ਕਰੋ
azd auth logout

# Azure CLI ਤੋਂ ਲੌਗਆਊਟ ਕਰੋ
az logout
```

### ਪ੍ਰੋਜੈਕਟ ਦੀ ਸ਼ੁਰੂਆਤ
```bash
# ਉਪਲਬਧ ਟੈਂਪਲੇਟ ਵੇਖੋ
azd template list

# ਟੈਂਪਲੇਟ ਤੋਂ ਆਰੰਭ ਕਰੋ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਆਰੰਭ ਕਰੋ
azd init .

# ਕਸਟਮ ਨਾਮ ਨਾਲ ਆਰੰਭ ਕਰੋ
azd init --template todo-nodejs-mongo my-awesome-app
```

## ਮੁੱਖ ਡਿਪਲੌਇਮੈਂਟ ਕਮਾਂਡਾਂ

### ਪੂਰਾ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ
```bash
# ਸਭ ਕੁਝ ਤਾਇਨਾਤ ਕਰੋ (ਪ੍ਰੋਵਿਜ਼ਨ + ਡਿਪਲੋਏ)
azd up

# ਪੁਸ਼ਟੀ ਪ੍ਰਾਂਪਟ ਬੰਦ ਕਰਕੇ ਤਾਇਨਾਤ ਕਰੋ
azd up --confirm-with-no-prompt

# ਨਿਰਧਾਰਿਤ ਵਾਤਾਵਰਣ ਵਿੱਚ ਤਾਇਨਾਤ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
azd up --parameter location=westus2
```

### ਸਿਰਫ਼ ਢਾਂਚਾ
```bash
# Azure ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision

# 🧪 ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਵਿੱਚ ਹੋਣ ਵਾਲੇ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰੀਵਿਊ
azd provision --preview
# ਇਹ ਡ੍ਰਾਈ-ਰਨ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਕਿਹੜੇ ਸਰੋਤ ਬਣਾਏ, ਸੰਸ਼ੋਧਿਤ ਜਾਂ ਹਟਾਏ ਜਾਣਗੇ
# ਇਹ 'terraform plan' ਜਾਂ 'bicep what-if' ਵਰਗਾ ਹੈ - ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ, ਕੋਈ ਬਦਲਾਵ ਲਾਗੂ ਨਹੀਂ ਹੁੰਦੇ
```

### ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਨਿਰਦਿਸ਼ਟ ਸੇਵਾ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਭ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy --all
```

### ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਦੀਆਂ ਨਿਰਭਰਤਾਵਾਂ ਨੂੰ ਮੁੜ ਪ੍ਰਾਪਤ (ਡਾਊਨਲੋਡ) ਕਰੋ
azd restore

# ਨਿਰਧਾਰਿਤ ਸੇਵਾ ਨੂੰ ਮੁੜ ਪ੍ਰਾਪਤ ਕਰੋ
azd restore --service api

# ਇੱਕ ਤੈਨਾਤ ਕਰਨ ਯੋਗ ਆਰਟੀਫੈਕਟ ਬਣਾਓ ਬਿਨਾਂ ਤੈਨਾਤ ਕੀਤੇ
azd package

# ਨਿਰਧਾਰਿਤ ਸੇਵਾ ਬਣਾਓ
azd package --service api
```

> **`azd restore`** ਤੁਹਾਡੇ ਐਪ ਦੀਆਂ ਡੀਪੈਂਡੇਨਸੀਜ਼ (npm, pip, NuGet, Maven, ਆਦਿ) ਡਾਊਨਲੋਡ ਕਰਦਾ ਹੈ। ਇਹ ਆਪੋ-ਆਪ `azd package` ਅਤੇ `azd deploy` ਦੌਰਾਨ ਚੱਲਦਾ ਹੈ, ਇਸ ਲਈ ਤੁਸੀਂ ਇਸਨੂੰ ਸਿੱਧਾ ਘੱਟ ਹੀ ਚਲਾਉਂਦੇ ਹੋ — ਇਸਨੂੰ ਮੈਨੂਅਲ ਤੌਰ 'ਤੇ ਚਲਾਓ ਤਾਂ ਕਿ ਡੀਪੈਂਡੇਨਸੀਜ਼ ਪਹਿਲਾਂ ਤੋਂ ਪ੍ਰੀ-ਫੈਚ ਹੋ ਜਾਣ (ਉਦਾਹਰਣ ਲਈ CI cache ਨੂੰ ਗਰਮ ਕਰਨ ਜਾਂ ਬਾਅਦ ਵਿੱਚ ਆਫਲਾਈਨ ਕੰਮ ਕਰਨ ਲਈ)।

> **`azd package`** ਡਿਪਲੋਏ ਕਰਨ ਯੋਗ ਆਰਟੀਫੈਕਟ (ਇਕ ਕੰਟੇਨਰ ਇਮੇਜ ਜਾਂ zip) ਤਿਆਰ ਕਰਦਾ ਹੈ **ਬਿਨਾਂ** ਇਸਨੂੰ Azure 'ਤੇ ਪਹੁੰਚਾਏ। ਇਕੱਲੇ ਇਸਨੂੰ ਵਰਤੋ ਜੇਕਰ ਤੁਸੀਂ ਬਿਲਡ ਦੀ ਸਫਲਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨੀ ਹੋਵੇ, ਆਉਟਪੁੱਟ ਦੀ ਜਾਂਚ ਕਰਨੀ ਹੋਵੇ, ਜਾਂ ਐਸਾ ਆਰਟੀਫੈਕਟ ਬਣਾਉਣਾ ਹੋਵੇ ਜਿਸਨੂੰ ਕਿਸੇ ਵੱਖਰੀ ਪ੍ਰਕਿਰਿਆ ਦੁਆਰਾ ਬਾਅਦ ਵਿੱਚ ਡਿਪਲੌਇ ਕੀਤਾ ਜਾਵੇ। `azd deploy` ਆਪੋ-ਆਪ ਪੈਕੇਜ ਕਰਦਾ ਹੈ, ਇਸ ਲਈ ਤੁਹਾਨੂੰ ਸਿਰਫ਼ ਉਸ ਵੇਲੇ `azd package` ਦੀ ਲੋੜ ਹੈ ਜਦੋਂ ਤੁਸੀਂ ਡਿਪਲੌਯ ਕੀਤੇ ਬਿਨਾਂ ਆਰਟੀਫੈਕਟ ਚਾਹੁੰਦੇ ਹੋ।

## 🌍 ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ

### ਵਾਤਾਵਰਣ ਕਾਰਜ
```bash
# ਸਾਰੇ ਵਾਤਾਵਰਣਾਂ ਦੀ ਸੂਚੀ
azd env list

# ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new development
azd env new staging --location westus2

# ਵਾਤਾਵਰਣ ਚੁਣੋ
azd env select production

# ਉਪਲਬਧ ਵਾਤਾਵਰਣਾਂ ਦਿਖਾਓ
azd env list

# ਵਾਤਾਵਰਣ ਦੀ ਸਥਿਤੀ ਤਾਜ਼ਾ ਕਰੋ
azd env refresh
```

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
```bash
# ਇੰਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ਇੰਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get API_KEY

# ਸਾਰੇ ਇੰਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਦਿਖਾਓ
azd env get-values

# ਇੰਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਹਟਾਓ
azd env unset DEBUG
```

## ⚙️ ਕੰਫ਼ਿਗਰੇਸ਼ਨ ਕਮਾਂਡਾਂ

### ਗਲੋਬਲ ਕੰਫ਼ਿਗਰੇਸ਼ਨ
```bash
# ਸਾਰੀਆਂ ਕਨਫਿਗਰੇਸ਼ਨਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd config show

# ਗਲੋਬਲ ਡਿਫੌਲਟ ਸੈੱਟ ਕਰੋ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ਕਨਫਿਗਰੇਸ਼ਨ ਹਟਾਓ
azd config unset defaults.location

# ਸਾਰੀਆਂ ਕਨਫਿਗਰੇਸ਼ਨਾਂ ਨੂੰ ਰੀਸੈਟ ਕਰੋ
azd config reset
```

### ਪ੍ਰੋਜੈਕਟ ਕੰਫ਼ਿਗਰੇਸ਼ਨ
```bash
# azure.yaml ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd config validate

# ਪ੍ਰੋਜੈਕਟ ਦੀ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd show

# ਸੇਵਾ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json
```

## 📊 ਨਿਗਰਾਨੀ ਅਤੇ ਨਿਰੀਖਣ

### ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ
```bash
# Azure ਪੋਰਟਲ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲੋ
azd monitor

# Application Insights ਦੀ ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਖੋਲੋ
azd monitor --live

# Application Insights ਲੌਗਜ਼ ਬਲੇਡ ਖੋਲੋ
azd monitor --logs

# Application Insights ਓਵਰਵਿਊ ਖੋਲੋ
azd monitor --overview
```

### ਕੰਟੇਨਰ ਲੌਗ ਵੇਖਣਾ
```bash
# Azure CLI ਰਾਹੀਂ ਲੌਗ ਵੇਖੋ (ਕੰਟੇਨਰ ਐਪਸ ਲਈ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ਲੌਗਾਂ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਫੋਲੋ ਕਰੋ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ਪੋਰਟਲ ਤੋਂ ਲੌਗ ਵੇਖੋ
azd monitor --logs
```

### ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਕਵੇਰੀਆਂ
```bash
# Azure ਪੋਰਟਲ ਰਾਹੀਂ ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਤੱਕ ਪਹੁੰਚ
azd monitor --logs

# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗਾਂ ਤੇ ਕਵੈਰੀ ਚਲਾਓ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ਰੱਖ-ਰਖਾਵ ਕਮਾਂਡਾਂ

### ਸਾਫ਼-ਸਫਾਈ
```bash
# ਸਾਰੇ ਐਜ਼ੂਰ ਸਰੋਤ ਹਟਾਓ
azd down

# ਪੁਸ਼ਟੀ ਦੇ ਬਿਨਾਂ ਜ਼ਬਰਦਸਤੀ ਮਿਟਾਓ
azd down --force

# ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਗਏ ਸਰੋਤਾਂ ਨੂੰ ਸਥਾਈ ਤੌਰ 'ਤੇ ਮਿਟਾਓ
azd down --purge

# ਮੁਕੰਮਲ ਸਫਾਈ
azd down --force --purge
```

### ਅੱਪਡੇਟਸ
```bash
# azd ਅੱਪਡੇਟਾਂ ਲਈ ਜਾਂਚ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਵਰਜਨ ਪ੍ਰਾਪਤ ਕਰੋ
azd version

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਵੇਖੋ
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

### ਇੰਫਰਾਸਟਰੱਕਚਰ ਪ੍ਰਬੰਧਨ
```bash
# ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੈਮਪਲੇਟ ਬਣਾਓ
azd infra generate

# 🧪 ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੀਵਿਊ ਅਤੇ ਯੋਜਨਾ
azd provision --preview
# ਤੈਨਾਤ ਕੀਤੇ ਬਿਨਾਂ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦੀ ਨਕਲ ਕਰਦਾ ਹੈ
# Bicep/Terraform ਟੈਮਪਲੇਟਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ ਅਤੇ ਦਿਖਾਉਂਦਾ ਹੈ:
# - ਸ਼ਾਮਲ ਕੀਤੀਆਂ ਜਾਣ ਵਾਲੀਆਂ ਰਿਸੋਰਸ (ਹਰਾ +)
# - ਸੋਧ ਕੀਤੀਆਂ ਜਾਣ ਵਾਲੀਆਂ ਰਿਸੋਰਸ (ਪੀਲਾ ~)
# - ਮਿਟਾਈਆਂ ਜਾਣ ਵਾਲੀਆਂ ਰਿਸੋਰਸ (ਲਾਲ -)
# ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ - Azure ਵਾਤਾਵਰਣ ਵਿੱਚ ਕੋਈ ਅਸਲ ਤਬਦੀਲੀ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ

# azure.yaml ਤੋਂ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਬਣਾਓ
azd infra synth
```

### ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ
```bash
# ਪ੍ਰੋਜੈਕਟ ਦੀ ਸਥਿਤੀ ਅਤੇ ਐਂਡਪਾਇੰਟ ਦਿਖਾਓ
azd show

# ਵਿਸਤ੍ਰਿਤ ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ ਨੂੰ JSON ਵਜੋਂ ਦਿਖਾਓ
azd show --output json

# ਸੇਵਾ ਦੇ ਐਂਡਪਾਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json | jq '.services'
```

## 🤖 AI ਅਤੇ ਐਕਸਟੈਂਸ਼ਨ ਕਮਾਂਡਾਂ

### AZD ਐਕਸਟੈਂਸ਼ਨ
```bash
# ਸਾਰੇ ਉਪਲਬਧ ਐਕਸਟੇਸ਼ਨ (ਏਆਈ ਸਮੇਤ) ਦਿਖਾਓ
azd extension list

# Foundry ਏਜੰਟ ਐਕਸਟੇਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.agents

# ਏਜੰਟ ਕੌਸ਼ਲ ਐਕਸਟੇਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ (ਪ੍ਰੀਵਿਊ)
azd extension install azure.ai.skills

# Foundry ਕਨੈਕਸ਼ਨਜ਼ ਐਕਸਟੇਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ (ਪ੍ਰੀਵਿਊ)
azd extension install azure.ai.connections

# ਫਾਈਨ-ਟਿਊਨਿੰਗ ਐਕਸਟੇਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.finetune

# ਕਸਟਮ ਮਾਡਲ ਐਕਸਟੇਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.models

# ਸਾਰੇ ਇੰਸਟਾਲ ਕੀਤੇ ਐਕਸਟੇਸ਼ਨਾਂ ਨੂੰ ਅਪਗ੍ਰੇਡ ਕਰੋ
azd extension upgrade --all
```

### AI ਏਜਨਟ ਕਮਾਂਡਾਂ
```bash
# ਮੈਨਿਫੈਸਟ ਤੋਂ ਏਜੰਟ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd ai agent init -m <manifest-path-or-uri>

# ਕਿਸੇ ਨਿਰਦਿਸ਼ਟ Foundry ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਨਿਸ਼ਾਨਾ ਬਣਾਓ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ਏਜੰਟ ਸਰੋਤ ਡਾਇਰੈਕਟਰੀ ਨਿਰਧਾਰਤ ਕਰੋ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ਇੱਕ ਹੋਸਟਿੰਗ ਨਿਸ਼ਾਨਾ ਚੁਣੋ
azd ai agent init -m agent-manifest.yaml --host containerapp

# ਡਿਪਲੋਇਡ ਕੀਤਾ ਗਿਆ ਏਜੰਟ ਟੈਸਟ ਕਰੋ (ਲੈਟੈਂਸੀ ਅਤੇ ਪਹਿਲੀ-ਬਾਈਟ ਤੱਕ ਦਾ ਸਮਾਂ ਪ੍ਰਿੰਟ ਕਰਦਾ ਹੈ)
azd ai agent invoke

# ਲਾਈਵ ਐਂਡਪੌਇੰਟ ਦੀ ਸੰਰਚਨਾ ਦਿਖਾਓ
azd ai agent endpoint show

# ਇੱਕ ਮੁੱਲਾਂਕਣ ਡੇਟਾਸੈੱਟ ਬਣਾਓ, ਫਿਰ ਏਜੰਟ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ
azd ai agent eval generate
azd ai agent optimize

# ਕੋਡ-ਆਧਾਰਿਤ ਹੋਸਟ ਕੀਤੇ ਏਜੰਟ ਦਾ ਡਿਪਲੋਇਡ ਕੀਤਾ ਗਿਆ ਸਰੋਤ ਡਾਊਨਲੋਡ ਕਰੋ
azd ai agent code download

# ਹੋਸਟ ਕੀਤੇ ਏਜੰਟ ਅਤੇ ਇਸ ਦੇ ਸਾਰੇ ਵਰਜ਼ਨ ਮਿਟਾਓ (--force ਸਰਗਰਮ ਸੈਸ਼ਨਾਂ ਨੂੰ ਖਤਮ ਕਰਦਾ ਹੈ)
azd ai agent delete --force
```

### MCP ਸਰਵਰ (ਅਲਫਾ)
```bash
# ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਲਈ MCP ਸਰਵਰ ਸ਼ੁਰੂ ਕਰੋ
azd mcp start

# MCP ਓਪਰੇਸ਼ਨਾਂ ਲਈ ਟੂਲ ਦੀ ਸਹਿਮਤੀ ਪ੍ਰਬੰਧ ਕਰੋ
azd copilot consent list
```

### ਇੰਫਰਾਸਟਰੱਕਚਰ ਜਨਰੇਸ਼ਨ
```bash
# ਤੁਹਾਡੇ ਪ੍ਰੋਜੈਕਟ ਦੀ ਪਰਿਭਾਸ਼ਾ ਤੋਂ IaC ਫਾਈਲਾਂ ਤਿਆਰ ਕਰੋ
azd infra generate

# azure.yaml ਤੋਂ ਇਨਫਰਾਸਟ੍ਰੱਕਚਰ ਤਿਆਰ ਕਰੋ
azd infra synth
```

---

## 🎯 ਤੇਜ਼ ਵਰਕਫਲੋ

### ਵਿਕਾਸ ਵਰਕਫਲੋ
```bash
# ਨਵਾਂ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo
cd my-project

# ਡਿਵੈਲਪਮੈਂਟ ਮਾਹੌਲ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd env new dev
azd up

# ਤਬਦੀਲੀਆਂ ਕਰੋ ਅਤੇ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --live
```

### ਬਹੁ-ਵਾਤਾਵਰਣ ਵਰਕਫਲੋ
```bash
# ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਕਰੋ
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
# ਡਿਬੱਗ ਮੋਡ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show

# ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਤਸਦੀਕ ਕਰੋ
azd config show

# ਲੌਗਾਂ ਲਈ ਨਿਰੀਖਣ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --logs

# ਸੰਸਾਧਨਾਂ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show --output json
```

## 🔍 ਡੀਬੱਗਿੰਗ ਕਮਾਂਡਾਂ

### ਡੀਬੱਗ ਜਾਣਕਾਰੀ
```bash
# ਡੀਬੱਗ ਆਉਟਪੁੱਟ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug

# ਸਾਫ਼ ਆਉਟਪੁੱਟ ਲਈ ਟੈਲੀਮੀਟਰੀ ਅਯੋਗ ਕਰੋ
export AZD_DISABLE_TELEMETRY=true

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਜਾਂਚੋ
azd config show

# ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
az account show
```

### ਟੈਂਪਲੇਟ ਡੀਬੱਗਿੰਗ
```bash
# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਵਿਸਥਾਰ ਸਮੇਤ ਸੂਚੀਬੱਧ ਕਰੋ
azd template list --output json

# ਟੈਮਪਲੇਟ ਦੀ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd template show <template-name>

# init ਤੋਂ ਪਹਿਲਾਂ ਟੈਮਪਲੇਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd template validate <template-name>
```

## 📁 ਫਾਈਲ ਅਤੇ ਡਾਇਰੈਕਟਰੀ ਕਮਾਂਡਾਂ

### ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ
```bash
# ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਰਚਨਾ ਦਿਖਾਓ
tree /f  # ਵਿੰਡੋਜ਼
find . -type f  # ਲਿਨਕਸ/ਮੈਕਓਐਸ

# azd ਪ੍ਰੋਜੈਕਟ ਰੂਟ ਤੇ ਜਾਓ
cd $(azd root)

# azd ਸੰਰਚਨਾ ਡਾਇਰੈਕਟਰੀ ਦਿਖਾਓ
echo $AZD_CONFIG_DIR  # ਆਮ ਤੌਰ ਤੇ ~/.azd
```

## 🎨 ਆਉਟਪੁੱਟ ਫਾਰਮੈਟਿੰਗ

### JSON ਆਉਟਪੁੱਟ
```bash
# ਸਕ੍ਰਿਪਟਿੰਗ ਲਈ JSON ਆਉਟਪੁੱਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd show --output json
azd env list --output json
azd config show --output json

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

## 🔧 ਆਮ ਕਮਾਂਡਾਂ ਦੇ ਸੰਯੋਜਨ

### ਹੈਲਥ ਚੈੱਕ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਤੇਜ਼ ਸਿਹਤ ਜਾਂਚ
azd show
azd env get-values
azd monitor --logs
```

### ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਜਾਂਚ
```bash
#!/bin/bash
# ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਤਸਦੀਕ
azd show
azd provision --preview  # ਲਾਗੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਤਬਦੀਲੀਆਂ ਦਾ ਜਾਇਜ਼ਾ ਲਓ
az account show
```

### ਵਾਤਾਵਰਣ ਤੁਲਨਾ
```bash
#!/bin/bash
# ਮਾਹੌਲਾਂ ਦੀ ਤੁਲਨਾ
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ਸਰੋਤ ਸਾਫ਼-ਸਫਾਈ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# ਪੁਰਾਣੇ ਮਾਹੌਲ ਸਾਫ਼ ਕਰੋ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ

### ਆਮ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
```bash
# Azure ਸੰਰਚਨਾ
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

### ਤੇਜ਼ ਠੀਕ-ਕਰਨ
```bash
# ਪ੍ਰਮਾਣਿਕਤਾ ਰੀਸੈਟ ਕਰੋ
az account clear
az login

# ਵਾਤਾਵਰਣ ਨੂੰ ਜ਼ਬਰਦਸਤੀ ਰੀਫ੍ਰੈਸ਼ ਕਰੋ
azd env refresh

# ਸਭ ਸੇਵਾਵਾਂ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show --output json
```

### ਰਿਕਵਰੀ ਕਮਾਂਡਾਂ
```bash
# ਅਸਫਲ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਹਾਲ ਕਰੋ - ਸਾਫ਼ ਕਰੋ ਅਤੇ ਮੁੜ ਡਿਪਲੋਇ ਕਰੋ
azd down --force --purge
azd up

# ਕੇਵਲ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਨੂੰ ਮੁੜ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision

# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਮੁੜ ਡਿਪਲੋਇ ਕਰੋ
azd deploy
```

## 💡 ਪ੍ਰੋ ਸੁਝਾਅ

### ਤੇਜ਼ ਵਰਕਫਲੋ ਲਈ ਐਲਿਆਸ
```bash
# ਇਸਨੂੰ ਆਪਣੀ .bashrc ਜਾਂ .zshrc ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ਫੰਕਸ਼ਨ ਸ਼ਾਰਟਕੱਟਸ
```bash
# ਮਾਹੌਲ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਬਦਲਣਾ
azd-env() {
    azd env select $1 && azd show
}

# ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਤੇਜ਼ ਤੌਰ ਤੇ ਡਿਪਲੌਇਮੈਂਟ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ਮਾਹੌਲ ਦੀ ਸਥਿਤੀ
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ਸਹਾਇਤਾ ਅਤੇ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ

### ਮਦਦ ਪ੍ਰਾਪਤ ਕਰਨਾ
```bash
# ਆਮ ਮਦਦ
azd --help
azd help

# ਕਮਾਂਡ-ਖਾਸ ਮਦਦ
azd up --help
azd env --help
azd config --help

# ਵਰਜ਼ਨ ਅਤੇ ਬਿਲਡ ਜਾਣਕਾਰੀ ਦਿਖਾਓ
azd version
azd version --output json
```

### ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਲਿੰਕ
```bash
# ਦਸਤਾਵੇਜ਼ੀकरण ਨੂੰ ਬ੍ਰਾਉਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੋ
azd docs

# ਟੈਮਪਲੇਟ ਦਸਤਾਵੇਜ਼ੀकरण ਦਿਖਾਓ
azd template show <template-name> --docs
```

---

**ਟਿਪ**: ਇਸ ਚੀਟ ਸੀਟ ਨੂੰ ਬੁੱਕਮਾਰਕ ਕਰੋ ਅਤੇ ਜ਼ਰੂਰਤ ਵਾਲੀਆਂ ਕਮਾਂਡਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਲੱਭਣ ਲਈ `Ctrl+F` ਵਰਤੋਂ ਕਰੋ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਪ੍ਰੀਫਲਾਈਟ ਜਾਂਚ](../docs/pre-deployment/preflight-checks.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸ਼ਬਦਾਵਲੀ](glossary.md)

---

> **💡 ਕੀ ਤੁਸੀਂ ਆਪਣੇ ਐਡੀਟਰ ਵਿੱਚ Azure ਕਮਾਂਡ ਸਹਾਇਤਾ ਚਾਹੁੰਦੇ ਹੋ?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, ਡਿਪਲੌਇਮੈਂਟ, ਡਾਇਅਗਨੋਸਟਿਕਸ ਅਤੇ ਹੋਰ ਲਈ 37 ਸਕਿਲਾਂ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->