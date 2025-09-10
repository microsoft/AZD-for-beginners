<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:06:49+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "pa"
}
-->
# AZD ਬੁਨਿਆਦੀਆਂ - Azure Developer CLI ਨੂੰ ਸਮਝਣਾ

## ਪਰਿਚਯ

ਇਹ ਪਾਠ ਤੁਹਾਨੂੰ Azure Developer CLI (azd) ਨਾਲ ਜਾਣੂ ਕਰਵਾਉਂਦਾ ਹੈ, ਜੋ ਕਿ ਇੱਕ ਸ਼ਕਤੀਸ਼ਾਲੀ ਕਮਾਂਡ-ਲਾਈਨ ਟੂਲ ਹੈ ਜੋ ਤੁਹਾਡੇ ਸਥਾਨਕ ਵਿਕਾਸ ਤੋਂ Azure ਡਿਪਲੌਇਮੈਂਟ ਤੱਕ ਦੇ ਸਫਰ ਨੂੰ ਤੇਜ਼ ਕਰਦਾ ਹੈ। ਤੁਸੀਂ ਮੁੱਖ ਧਾਰਨਾਵਾਂ, ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਬਾਰੇ ਸਿੱਖੋਗੇ ਅਤੇ ਸਮਝੋਗੇ ਕਿ azd ਕਲਾਉਡ-ਨੈਟਿਵ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਕਿਵੇਂ ਸਧਾਰਨ ਬਣਾਉਂਦਾ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- ਸਮਝ ਪਾਉਣਗੇ ਕਿ Azure Developer CLI ਕੀ ਹੈ ਅਤੇ ਇਸ ਦਾ ਮੁੱਖ ਉਦੇਸ਼ ਕੀ ਹੈ
- ਟੈਂਪਲੇਟਸ, ਇਨਵਾਇਰਮੈਂਟਸ, ਅਤੇ ਸੇਵਾਵਾਂ ਦੀਆਂ ਮੁੱਖ ਧਾਰਨਾਵਾਂ ਬਾਰੇ ਸਿੱਖੋਗੇ
- ਟੈਂਪਲੇਟ-ਚਲਿਤ ਵਿਕਾਸ ਅਤੇ Infrastructure as Code ਸਮੇਤ ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਦੀ ਖੋਜ ਕਰੋਗੇ
- azd ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ ਅਤੇ ਵਰਕਫਲੋ ਨੂੰ ਸਮਝੋਗੇ
- ਆਪਣੇ ਵਿਕਾਸ ਦੇ ਮਾਹੌਲ ਲਈ azd ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋਵੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੇ ਬਾਅਦ, ਤੁਸੀਂ:
- ਆਧੁਨਿਕ ਕਲਾਉਡ ਵਿਕਾਸ ਵਰਕਫਲੋਜ਼ ਵਿੱਚ azd ਦੀ ਭੂਮਿਕਾ ਦੀ ਵਿਆਖਿਆ ਕਰ ਸਕਦੇ ਹੋ
- azd ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ ਦੇ ਘਟਕਾਂ ਦੀ ਪਛਾਣ ਕਰ ਸਕਦੇ ਹੋ
- ਸਮਝ ਸਕਦੇ ਹੋ ਕਿ ਟੈਂਪਲੇਟਸ, ਇਨਵਾਇਰਮੈਂਟਸ, ਅਤੇ ਸੇਵਾਵਾਂ ਕਿਵੇਂ ਇਕੱਠੇ ਕੰਮ ਕਰਦੇ ਹਨ
- azd ਨਾਲ Infrastructure as Code ਦੇ ਫਾਇਦੇ ਸਮਝ ਸਕਦੇ ਹੋ
- ਵੱਖ-ਵੱਖ azd ਕਮਾਂਡਸ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਉਦੇਸ਼ਾਂ ਨੂੰ ਪਛਾਣ ਸਕਦੇ ਹੋ

## Azure Developer CLI (azd) ਕੀ ਹੈ?

Azure Developer CLI (azd) ਇੱਕ ਕਮਾਂਡ-ਲਾਈਨ ਟੂਲ ਹੈ ਜੋ ਤੁਹਾਡੇ ਸਥਾਨਕ ਵਿਕਾਸ ਤੋਂ Azure ਡਿਪਲੌਇਮੈਂਟ ਤੱਕ ਦੇ ਸਫਰ ਨੂੰ ਤੇਜ਼ ਕਰਦਾ ਹੈ। ਇਹ Azure 'ਤੇ ਕਲਾਉਡ-ਨੈਟਿਵ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ, ਡਿਪਲੌਇ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਨ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਧਾਰਨ ਬਣਾਉਂਦਾ ਹੈ।

## ਮੁੱਖ ਧਾਰਨਾਵਾਂ

### ਟੈਂਪਲੇਟਸ
ਟੈਂਪਲੇਟਸ azd ਦੀ ਬੁਨਿਆਦ ਹਨ। ਇਹ ਸ਼ਾਮਲ ਕਰਦੇ ਹਨ:
- **ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ** - ਤੁਹਾਡਾ ਸੋਰਸ ਕੋਡ ਅਤੇ ਡਿਪੈਂਡੈਂਸੀਜ਼
- **ਇੰਫਰਾਸਟਰਕਚਰ ਦੀ ਪਰਿਭਾਸ਼ਾ** - Bicep ਜਾਂ Terraform ਵਿੱਚ ਪਰਿਭਾਸ਼ਿਤ Azure ਸਰੋਤ
- **ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ** - ਸੈਟਿੰਗਸ ਅਤੇ ਇਨਵਾਇਰਮੈਂਟ ਵੈਰੀਏਬਲ
- **ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟਸ** - ਆਟੋਮੈਟਿਕ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼

### ਇਨਵਾਇਰਮੈਂਟਸ
ਇਨਵਾਇਰਮੈਂਟਸ ਵੱਖ-ਵੱਖ ਡਿਪਲੌਇਮੈਂਟ ਟਾਰਗਟਸ ਨੂੰ ਦਰਸਾਉਂਦੇ ਹਨ:
- **ਡਿਵੈਲਪਮੈਂਟ** - ਟੈਸਟਿੰਗ ਅਤੇ ਵਿਕਾਸ ਲਈ
- **ਸਟੇਜਿੰਗ** - ਪ੍ਰੀ-ਪ੍ਰੋਡਕਸ਼ਨ ਇਨਵਾਇਰਮੈਂਟ
- **ਪ੍ਰੋਡਕਸ਼ਨ** - ਲਾਈਵ ਪ੍ਰੋਡਕਸ਼ਨ ਇਨਵਾਇਰਮੈਂਟ

ਹਰ ਇਨਵਾਇਰਮੈਂਟ ਆਪਣਾ:
- Azure ਰਿਸੋਰਸ ਗਰੁੱਪ
- ਕਨਫਿਗਰੇਸ਼ਨ ਸੈਟਿੰਗਸ
- ਡਿਪਲੌਇਮੈਂਟ ਸਟੇਟ

### ਸੇਵਾਵਾਂ
ਸੇਵਾਵਾਂ ਤੁਹਾਡੇ ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਬਿਲਡਿੰਗ ਬਲਾਕ ਹਨ:
- **ਫਰੰਟਐਂਡ** - ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ, SPAs
- **ਬੈਕਐਂਡ** - APIs, ਮਾਈਕ੍ਰੋਸੇਵਾਵਾਂ
- **ਡਾਟਾਬੇਸ** - ਡਾਟਾ ਸਟੋਰੇਜ ਹੱਲ
- **ਸਟੋਰੇਜ** - ਫਾਈਲ ਅਤੇ ਬਲੌਬ ਸਟੋਰੇਜ

## ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ

### 1. ਟੈਂਪਲੇਟ-ਚਲਿਤ ਵਿਕਾਸ
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure ਦੀ ਡੋਮੇਨ-ਸਪੈਸਿਫਿਕ ਲੈਂਗਵੇਜ
- **Terraform** - ਮਲਟੀ-ਕਲਾਉਡ ਇੰਫਰਾਸਟਰਕਚਰ ਟੂਲ
- **ARM ਟੈਂਪਲੇਟਸ** - Azure Resource Manager ਟੈਂਪਲੇਟਸ

### 3. ਇੰਟੀਗ੍ਰੇਟਡ ਵਰਕਫਲੋਜ਼
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. ਇਨਵਾਇਰਮੈਂਟ ਪ੍ਰਬੰਧਨ
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ

ਇੱਕ ਆਮ azd ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ

### azure.yaml
ਮੁੱਖ ਪ੍ਰੋਜੈਕਟ ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲ:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
ਇਨਵਾਇਰਮੈਂਟ-ਸਪੈਸਿਫਿਕ ਕਨਫਿਗਰੇਸ਼ਨ:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 ਆਮ ਵਰਕਫਲੋਜ਼

### ਨਵਾਂ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰਨਾ
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### ਵਿਕਾਸ ਚੱਕਰ
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## `azd down --force --purge` ਨੂੰ ਸਮਝਣਾ
`azd down --force --purge` ਕਮਾਂਡ ਤੁਹਾਡੇ azd ਇਨਵਾਇਰਮੈਂਟ ਅਤੇ ਸਾਰੇ ਸੰਬੰਧਿਤ ਸਰੋਤਾਂ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਹਟਾਉਣ ਦਾ ਇੱਕ ਸ਼ਕਤੀਸ਼ਾਲੀ ਤਰੀਕਾ ਹੈ। ਇੱਥੇ ਹਰ ਫਲੈਗ ਦਾ ਵਿਸਤਾਰ ਹੈ:
```
--force
```
- ਪੁਸ਼ਟੀਕਰਨ ਪ੍ਰੰਪਟਸ ਨੂੰ ਸਕਿਪ ਕਰਦਾ ਹੈ।
- ਆਟੋਮੇਸ਼ਨ ਜਾਂ ਸਕ੍ਰਿਪਟਿੰਗ ਲਈ ਲਾਭਦਾਇਕ ਜਿੱਥੇ ਮੈਨੂਅਲ ਇਨਪੁਟ ਸੰਭਵ ਨਹੀਂ।
- ਇਹ ਯਕੀਨੀ ਬਣਾਉਂਦਾ ਹੈ ਕਿ CLI ਦੁਆਰਾ ਅਸੰਗਤੀਆਂ ਦਾ ਪਤਾ ਲਗਣ ਦੇ ਬਾਵਜੂਦ ਹਟਾਉਣ ਬਿਨਾਂ ਰੁਕਾਵਟ ਦੇ ਅੱਗੇ ਵਧਦਾ ਹੈ।

```
--purge
```
**ਸਾਰੇ ਸੰਬੰਧਿਤ ਮੈਟਾਡੇਟਾ** ਨੂੰ ਹਟਾਉਂਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:
- ਇਨਵਾਇਰਮੈਂਟ ਸਟੇਟ
- ਸਥਾਨਕ `.azure` ਫੋਲਡਰ
- Cached ਡਿਪਲੌਇਮੈਂਟ ਜਾਣਕਾਰੀ
- azd ਨੂੰ ਪਿਛਲੇ ਡਿਪਲੌਇਮੈਂਟਸ "ਯਾਦ" ਕਰਨ ਤੋਂ ਰੋਕਦਾ ਹੈ, ਜੋ ਕਿ ਮਿਸਮੈਚਡ ਰਿਸੋਰਸ ਗਰੁੱਪ ਜਾਂ ਸਟੇਲ ਰਜਿਸਟਰੀ ਰਿਫਰੰਸਾਂ ਵਰਗੇ ਮੁੱਦੇ ਪੈਦਾ ਕਰ ਸਕਦਾ ਹੈ।

### ਦੋਨੋਂ ਨੂੰ ਕਿਉਂ ਵਰਤਣਾ?
ਜਦੋਂ ਤੁਸੀਂ `azd up` ਨਾਲ ਅਟਕ ਜਾਂਦੇ ਹੋ ਕਿਉਂਕਿ ਲਿੰਗਰਿੰਗ ਸਟੇਟ ਜਾਂ ਆਧੇ ਡਿਪਲੌਇਮੈਂਟਸ, ਇਹ ਕੌਂਬੋ **ਸਾਫ਼ ਸਲੇਟ** ਯਕੀਨੀ ਬਣਾਉਂਦਾ ਹੈ।

ਇਹ ਖਾਸ ਤੌਰ 'ਤੇ ਮੈਨੂਅਲ ਸਰੋਤ ਹਟਾਉਣ ਤੋਂ ਬਾਅਦ Azure ਪੋਰਟਲ ਵਿੱਚ ਜਾਂ ਟੈਂਪਲੇਟਸ, ਇਨਵਾਇਰਮੈਂਟਸ, ਜਾਂ ਰਿਸੋਰਸ ਗਰੁੱਪ ਨਾਂਕਰਨ ਰੀਤੀ-ਰਿਵਾਜਾਂ ਨੂੰ ਬਦਲਣ ਸਮੇਂ ਲਾਭਦਾਇਕ ਹੈ।

### ਕਈ ਇਨਵਾਇਰਮੈਂਟਸ ਦਾ ਪ੍ਰਬੰਧਨ
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 ਨੈਵੀਗੇਸ਼ਨ ਕਮਾਂਡਸ

### ਖੋਜ
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### ਪ੍ਰੋਜੈਕਟ ਪ੍ਰਬੰਧਨ
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### ਮਾਨੀਟਰਿੰਗ
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## ਬਿਹਤਰ ਅਭਿਆਸ

### 1. ਅਰਥਪੂਰਨ ਨਾਂ ਵਰਤੋ
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. ਟੈਂਪਲੇਟਸ ਦਾ ਲਾਭ ਉਠਾਓ
- ਮੌਜੂਦਾ ਟੈਂਪਲੇਟਸ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
- ਆਪਣੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- ਆਪਣੇ ਸੰਗਠਨ ਲਈ ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਟੈਂਪਲੇਟਸ ਬਣਾਓ

### 3. ਇਨਵਾਇਰਮੈਂਟ ਆਈਸੋਲੇਸ਼ਨ
- dev/staging/prod ਲਈ ਵੱਖਰੇ ਇਨਵਾਇਰਮੈਂਟਸ ਵਰਤੋ
- ਸਥਾਨਕ ਮਸ਼ੀਨ ਤੋਂ ਸਿੱਧੇ ਪ੍ਰੋਡਕਸ਼ਨ ਵਿੱਚ ਕਦੇ ਵੀ ਡਿਪਲੌਇ ਨਾ ਕਰੋ
- ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟਸ ਲਈ CI/CD ਪਾਈਪਲਾਈਨਸ ਵਰਤੋ

### 4. ਕਨਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ
- ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਲਈ ਇਨਵਾਇਰਮੈਂਟ ਵੈਰੀਏਬਲ ਵਰਤੋ
- ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਵਰਜਨ ਕੰਟਰੋਲ ਵਿੱਚ ਰੱਖੋ
- ਇਨਵਾਇਰਮੈਂਟ-ਸਪੈਸਿਫਿਕ ਸੈਟਿੰਗਸ ਦਾ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ

## ਸਿੱਖਣ ਦੀ ਪ੍ਰਗਤੀ

### ਸ਼ੁਰੂਆਤੀ (ਹਫ਼ਤਾ 1-2)
1. azd ਇੰਸਟਾਲ ਕਰੋ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ਪ੍ਰਾਪਤ ਕਰੋ
2. ਇੱਕ ਸਧਾਰਨ ਟੈਂਪਲੇਟ ਡਿਪਲੌਇ ਕਰੋ
3. ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ ਨੂੰ ਸਮਝੋ
4. ਬੁਨਿਆਦੀ ਕਮਾਂਡਸ ਸਿੱਖੋ (up, down, deploy)

### ਮੱਧਮ (ਹਫ਼ਤਾ 3-4)
1. ਟੈਂਪਲੇਟਸ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ
2. ਕਈ ਇਨਵਾਇਰਮੈਂਟਸ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ
3. ਇਨਫਰਾਸਟਰਕਚਰ ਕੋਡ ਨੂੰ ਸਮਝੋ
4. CI/CD ਪਾਈਪਲਾਈਨਸ ਸੈਟ ਕਰੋ

### ਉੱਚ (ਹਫ਼ਤਾ 5+)
1. ਕਸਟਮ ਟੈਂਪਲੇਟਸ ਬਣਾਓ
2. ਉੱਚ-ਤਰੀਕੇ ਦੇ ਇਨਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨਸ
3. ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟਸ
4. ਐਂਟਰਪ੍ਰਾਈਜ਼-ਗਰੇਡ ਕਨਫਿਗਰੇਸ਼ਨਸ

## ਅਗਲੇ ਕਦਮ

- [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ](installation.md) - azd ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰੋ
- [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) - ਹੈਂਡਸ-ਆਨ ਟਿਊਟੋਰਿਅਲ
- [ਕਨਫਿਗਰੇਸ਼ਨ ਗਾਈਡ](configuration.md) - ਉੱਚ-ਤਰੀਕੇ ਦੇ ਕਨਫਿਗਰੇਸ਼ਨ ਵਿਕਲਪ

## ਵਾਧੂ ਸਰੋਤ

- [Azure Developer CLI ਝਲਕ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ਟੈਂਪਲੇਟ ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [ਕਮਿਊਨਿਟੀ ਸੈਂਪਲ](https://github.com/Azure-Samples)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [README](../../README.md)
- **ਅਗਲਾ ਪਾਠ**: [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ](installation.md)

---

**ਅਸਵੀਕਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।