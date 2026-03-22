# ਕੰਫਿਗਰੇਸ਼ਨ ਗਾਈਡ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 3 - ਕੰਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਿਛਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **➡️ ਅੱਗੇ**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤਾਰਪੂਰਕ ਗਾਈਡ Azure Developer CLI ਨੂੰ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੋਏਮੈਂਟ ਵਰਕਫ਼ਲੋਜ਼ ਲਈ ਬਿਹਤਰ ਰੂਪ ਵਿੱਚ ਸੰਰਚਿਤ ਕਰਨ ਦੇ ਸਮੂਹ پہਲੂਆਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ ਕੰਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ, ਵਾਤਾਵਰਨ ਪ੍ਰਬੰਧਨ, ਪ੍ਰਮਾਣਿਕਤਾ ਦੇ ਤਰੀਕੇ ਅਤੇ ਉन्नਤ ਕੰਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ ਬਾਰੇ ਸਿੱਖੋਗੇ ਜੋ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਅਤੇ ਸੁਰੱਖਿਅਤ Azure ਡਿਪਲੋਏਮੈਂਟ ਨੂੰ ਯਕੀਨੀ ਬਣਾਉਂਦੇ ਹਨ।

## ਸਿਖਣ ਦੇ ਲੱਖਣ

ਇਸ ਪਾਠ ਦੇ ਅਖੀਰ ਤੱਕ, ਤੁਸੀਂ:
- azd ਕੰਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ ਵਿੱਚ ਨਿਪੁੰਨ ਹੋ ਜਾਵੋਗੇ ਅਤੇ ਸਮਝੋ گے ਕਿ ਸੈਟਿੰਗਾਂ ਕਿਵੇਂ ਤਰਜੀਹ ਦਿੱਤੀ ਜਾਂਦੀਆਂ ਹਨ
- ਗਲੋਬਲ ਅਤੇ ਪ੍ਰੋਜੈਕਟ-ਵਿਸ਼ੇਸ਼ ਸੈਟਿੰਗਾਂ ਪ੍ਰਭਾਵੀ ਢੰਗ ਨਾਲ ਕੰਫਿਗਰ ਕਰਨਗੇ
- ਵੱਖ-ਵੱਖ ਕੰਫਿਗਰੇਸ਼ਨਾਂ ਵਾਲੇ ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਨਗੇ
- ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ ਪੈਟਰਨ ਲਾਗੂ ਕਰਨਗੇ
- ਜਟਿਲ ਦ੍ਰਿਸ਼ਾਂ ਲਈ ਉन्नਤ ਕੰਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ ਸਮਝਣਗੇ

## ਸਿਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਵਿਕਾਸੀ ਵਰਕਫ਼ਲੋ ਲਈ azd ਨੂੰ ਸੰਰਚਿਤ ਕਰਨ
- ਕਈ ਡਿਪਲੋਏਮੈਂਟ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਅਤੇ ਪ੍ਰਬੰਧ ਕਰਨ
- ਸੁਰੱਖਿਅਤ ਕੰਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰਨ
- ਕੰਫਿਗਰੇਸ਼ਨ-ਸਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰੱਬਲਸ਼ੂਟਿੰਗ ਕਰਨ
- ਵਿਸ਼ੇਸ਼ ਸੰਗਠਨਾਤਮਕ ਲੋੜਾਂ ਲਈ azd ਵਿਹਾਰ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨ

ਇਹ ਵਿਸਤਾਰਪੂਰਕ ਗਾਈਡ Azure Developer CLI ਨੂੰ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੋਏਮੈਂਟ ਵਰਕਫ਼ਲੋਜ਼ ਲਈ ਬਿਹਤਰ ਰੂਪ ਵਿੱਚ ਸੰਰਚਿਤ ਕਰਨ ਦੇ ਸਮੂਹ پہਲੂਆਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ।

## azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ AI ਏਜੰਟਸ ਨੂੰ ਸਮਝਣਾ

ਜੇ ਤੁਸੀਂ AI ਏਜੰਟਸ ਲਈ ਨਵੇਂ ਹੋ, ਤਾਂ azd ਦੁਨੀਆ ਵਿੱਚ ਉਹਨਾਂ ਨੂੰ ਸੋਚਣ ਦਾ ਇੱਕ ਸਧਾਰਨ ਤਰੀਕਾ ਇਹ ਹੈ।

### ਏਜੰਟ ਕੀ ਹੈ?

ਇੱਕ ਏਜੰਟ ਇੱਕ ਸਾਫਟਵੇਅਰ ਟੁਕੜਾ ਹੈ ਜੋ ਇਕ ਬੇਨਤੀ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦਾ ਹੈ, ਉਸ ਬਾਰੇ ਸੋਚ-ਵਿਚਾਰ ਕਰਦਾ ਹੈ, ਅਤੇ ਕਾਰਵਾਈਆਂ ਕਰਦਾ ਹੈ—ਅਕਸਰ ਇੱਕ AI ਮਾਡਲ ਨੂੰ ਕਾਲ ਕਰਕੇ, ਡੇਟਾ ਲੱਭ ਕੇ, ਜਾਂ ਹੋਰ ਸੇਵਾਵਾਂ ਨੂੰ ਆਮੰਤ੍ਰਿਤ ਕਰਕੇ। ਇੱਕ azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ, ਇੱਕ ਏਜੰਟ ਤੁਹਾਡੇ ਵੈੱਬ ਫਰੰਟਐਂਡ ਜਾਂ API ਬੈਕਐਂਡ ਦੇ ਨਾਲ ਇੱਕ ਹੋਰ **ਸੇਵਾ** ਹੀ ਹੈ।

### ਏਜੰਟ azd ਪ੍ਰੋਜੈਕਟ ਸੜਕਚਿੱਠੀ ਵਿੱਚ ਕਿਵੇਂ ਫਿੱਟ ਹੁੰਦੇ ਹਨ

ਇੱਕ azd ਪ੍ਰੋਜੈਕਟ ਤਿੰਨ ਪਰਤਾਂ ਵਿੱਚ ਬਣਿਆ ਹੁੰਦਾ ਹੈ: **ਇੰਫਰਾਸਟਰੱਕਚਰ**, **ਕੋਡ**, ਅਤੇ **ਕੰਫਿਗਰੇਸ਼ਨ**। ਏਜੰਟ ਇਨ੍ਹਾਂ ਪਰਤਾਂ ਵਿੱਚ ਉਸੇ ਤਰੀਕੇ ਨਾਲ ਜੁੜਦਾ ਹੈ ਜਿਸ ਤਰ੍ਹਾਂ ਕੋਈ ਹੋਰ ਸੇਵਾ ਕਰਦੀ ਹੈ:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | ਇੱਕ ਵੈੱਬ ਐਪ ਅਤੇ ਡੇਟਾਬੇਸ ਪ੍ਰੋਵਾਈਜ਼ਨ ਕਰਦਾ ਹੈ | ਇੱਕ AI ਮਾਡਲ ਐਂਡਪੋਇੰਟ, ਸਰਚ ਇੰਡੈਕਸ, ਜਾਂ ਏਜੰਟ ਹੋਸਟ ਪ੍ਰੋਵਾਈਜ਼ਨ ਕਰਦਾ ਹੈ |
| **Code** (`src/`) | ਤੁਹਾਡੇ ਫਰੰਟਐਂਡ ਅਤੇ API ਦਾ ਸੋર્સ ਕੋਡ ਰੱਖਦਾ ਹੈ | ਤੁਹਾਡੇ ਏਜੰਟ ਲੌਜਿਕ ਅਤੇ ਪ੍ਰਾਂਪਟ ਪਰਿਭਾਸ਼ਾਵਾਂ ਰੱਖਦਾ ਹੈ |
| **Configuration** (`azure.yaml`) | ਤੁਹਾਡੀਆਂ ਸੇਵਾਵਾਂ ਅਤੇ ਉਹਨਾਂ ਦੇ ਹੋਸਟਿੰਗ ਟਾਰਗਟਾਂ ਨੂੰ ਸੂਚੀਬੱਧ ਕਰਦਾ ਹੈ | ਤੁਹਾਡੇ ਏਜੰਟ ਨੂੰ ਇੱਕ ਸੇਵਾ ਵਜੋਂ ਸੂਚੀਬੱਧ ਕਰਦਾ ਹੈ, ਜੋ ਇਸਦੇ ਕੋਡ ਅਤੇ ਹੋਸਟ ਵਲਿ ਇਸ਼ਾਰਾ ਕਰਦਾ ਹੈ |

### `azure.yaml` ਦੀ ਭੂਮਿਕਾ

ਤੁਹਾਨੂੰ ਹੁਣੇ ਹੀ ਸਿੰਟੈਕਸ ਯਾਦ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ ਹੈ। ਧਾਰਣਾਤਮਕ ਤੌਰ 'ਤੇ, `azure.yaml` ਉਹ ਫਾਈਲ ਹੈ ਜਿੱਥੇ ਤੁਸੀਂ azd ਨੂੰ ਦੱਸਦੇ ਹੋ: "ਇਹ ਮੇਰੀ ਐਪਲੀਕੇਸ਼ਨ ਦੀਆਂ ਸੇਵਾਵਾਂ ਹਨ, ਅਤੇ ਇਹਾਂ ਉਨ੍ਹਾਂ ਦੇ ਕੋਡ ਨੂੰ ਲੱਭਣ ਦੀ ਥਾਂ ਹੈ।"

ਜਦੋਂ ਤੁਹਾਡੇ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਇੱਕ AI ਏਜੰਟ ਸ਼ਾਮਿਲ ਹੁੰਦਾ ਹੈ, `azure.yaml` ਸਿਰਫ ਉਸ ਏਜੰਟ ਨੂੰ ਇੱਕ ਸੇਵਾ ਵਜੋਂ ਸੂਚੀਬੱਧ ਕਰਦਾ ਹੈ। azd ਫਿਰ ਸਹੀ ਇੰਪ੍ਰਾਸਟਰੱਕਚਰ (ਉਦਾਹਰਣ ਲਈ Microsoft Foundry Models ਐਂਡਪੋਇੰਟ ਜਾਂ ਏਜੰਟ ਨੂੰ ਹੋਸਟ ਕਰਨ ਲਈ Container App) ਪ੍ਰੋਵਾਈਜ਼ਨ ਕਰਨ ਅਤੇ ਤੁਹਾਡੇ ਏਜੰਟ ਕੋਡ ਨੂੰ ਡਿਪਲੋਏ ਕਰਨ ਲਈ ਜਾਣਦਾ ਹੈ—ਜਿਵੇਂ ਇਹ ਵੈੱਬ ਐਪ ਜਾਂ API ਲਈ ਕਰਦਾ ਹੈ।

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਕੁਝ ਬੁਨਿਆਦੀ ਤੌਰ 'ਤੇ ਨਵਾਂ ਸਿੱਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਹੈ। ਜੇ ਤੁਸੀਂ ਸਮਝਦੇ ਹੋ ਕਿ azd ਇੱਕ ਵੈੱਬ ਸੇਵਾ ਨੂੰ ਕਿਵੇਂ ਪ੍ਰਬੰਧਿਤ ਕਰਦਾ ਹੈ, ਤਾਂ ਤੁਸੀਂ ਪਹਿਲਾਂ ਹੀ ਇਹ ਸਮਝਦੇ ਹੋ ਕਿ ਇਹ ਇੱਕ ਏਜੰਟ ਨੂੰ ਕਿਵੇਂ ਪ੍ਰਬੰਧਿਤ ਕਰਦਾ ਹੈ।

## ਕੰਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ

azd ਇੱਕ ਹਾਇਰਾਰਕੀ ਕੰਫਿਗਰੇਸ਼ਨ ਪ੍ਰਣਾਲੀ ਵਰਤਦਾ ਹੈ:
1. **ਕਮਾਂਡ-ਲਾਈਨ ਫਲੈਗ** (ਸਭ ਤੋਂ ਉੱਚੀ ਪ੍ਰਾਥਮਿਕਤਾ)
2. **ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ**
3. **ਲੋਕਲ ਪ੍ਰੋਜੈਕਟ ਕੰਫਿਗਰੇਸ਼ਨ** (`.azd/config.json`)
4. **ਗਲੋਬਲ ਯੂਜ਼ਰ ਕੰਫਿਗਰੇਸ਼ਨ** (`~/.azd/config.json`)
5. **ਡਿਫਾਲਟ ਮੁੱਲ** (ਸਭ ਤੋਂ ਘੱਟ ਪ੍ਰਾਥਮਿਕਤਾ)

## ਗਲੋਬਲ ਕੰਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਡਿਫਾਲਟ ਸੈਟ ਕਰਨਾ
```bash
# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ਡਿਫਾਲਟ ਲੋਕੇਸ਼ਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.location "eastus2"

# ਡਿਫਾਲਟ ਰਿਸੋਰਸ ਗਰੁੱਪ ਲਈ ਨਾਮਕਰਨ ਦੀ ਰੀਤੀ ਸੈੱਟ ਕਰੋ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ਸਾਰੇ ਗਲੋਬਲ ਕੰਫਿਗਰੇਸ਼ਨ ਵੇਖੋ
azd config list

# ਇੱਕ ਕੰਫਿਗਰੇਸ਼ਨ ਹਟਾਓ
azd config unset defaults.location
```

### ਆਮ ਗਲੋਬਲ ਸੈਟਿੰਗਜ਼
```bash
# ਵਿਕਾਸ ਪਸੰਦਾਂ
azd config set alpha.enable true                    # ਅਲਫਾ ਫੀਚਰਾਂ ਚਾਲੂ ਕਰੋ
azd config set telemetry.enabled false             # ਟੈਲੀਮੇਟਰੀ ਬੰਦ ਕਰੋ
azd config set output.format json                  # ਆਉਟਪੁੱਟ ਫਾਰਮੈਟ ਸੈੱਟ ਕਰੋ

# ਸੁਰੱਖਿਆ ਸੈਟਿੰਗਾਂ
azd config set auth.useAzureCliCredential true     # ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ Azure CLI ਵਰਤੋ
azd config set tls.insecure false                  # TLS ਪੁਸ਼ਟੀਕਰਨ ਲਾਗੂ ਕਰੋ

# ਕਾਰਗੁਜ਼ਾਰੀ ਟਿਊਨਿੰਗ
azd config set provision.parallelism 5             # ਸਮਾਂਤਰ ਸੰਸਾਧਨ ਬਣਾਉਣਾ
azd config set deploy.timeout 30m                  # ਤੈਨਾਤੀ ਸਮੇਂ ਦੀ ਸੀਮਾ
```

## 🏗️ ਪ੍ਰੋਜੈਕਟ ਕੰਫਿਗਰੇਸ਼ਨ

### azure.yaml ਦੀ ਬਣਤਰ
`azure.yaml` ਫਾਈਲ ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਕੇਂਦਰ ਹੈ:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### ਸੇਵਾ ਕੰਫਿਗਰੇਸ਼ਨ ਵਿਕਲਪ

#### ਹੋਸਟ ਕਿਸਮਾਂ
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### ਭਾਸ਼ਾ-ਵਿਸ਼ੇਸ਼ ਸੈਟਿੰਗਜ਼
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 ਵਾਤਾਵਰਨ ਪ੍ਰਬੰਧਨ

### ਵਾਤਾਵਰਨ ਬਣਾਉਣਾ
```bash
# ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new development

# ਖਾਸ ਸਥਾਨ ਨਾਲ ਬਣਾਓ
azd env new staging --location "westus2"

# ਟੈਮਪਲੇਟ ਤੋਂ ਬਣਾਓ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ਵਾਤਾਵਰਨ ਕੰਫਿਗਰੇਸ਼ਨ
ਹਰ ਵਾਤਾਵਰਨ ਦੀ ਆਪਣੀ ਕੰਫਿਗਰੇਸ਼ਨ `.azure/<env-name>/config.json` ਵਿੱਚ ਹੁੰਦੀ ਹੈ:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ
```bash
# ਮਾਹੌਲ-ਵਿਸ਼ੇਸ਼ ਵੇਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ਮਾਹੌਲ ਦੇ ਵੇਰੀਏਬਲ ਵੇਖੋ
azd env get-values

# ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ਮਾਹੌਲ ਦਾ ਵੇਰੀਏਬਲ ਹਟਾਓ
azd env unset DEBUG

# ਹਟਾਉਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd env get-values | grep DEBUG
# (ਕੁਝ ਵੀ ਵਾਪਸ ਨਹੀਂ ਆਉਣਾ ਚਾਹੀਦਾ)
```

### ਵਾਤਾਵਰਨ ਟੈਮਪਲੇਟ
ਇੱਕ ਸਥਿਰ ਵਾਤਾਵਰਨ ਸੈਟਅਪ ਲਈ `.azure/env.template` ਬਣਾਓ:
```bash
# ਲਾਜ਼ਮੀ ਵੈਰੀਏਬਲ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ਐਪਲੀਕੇਸ਼ਨ ਸੈਟਿੰਗਾਂ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ਵਿਕਲਪਿਕ ਵਿਕਾਸ ਸੈਟਿੰਗਾਂ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ਪ੍ਰਮਾਣਿਕਤਾ ਕੰਫਿਗਰੇਸ਼ਨ

### Azure CLI ਇੰਟੀਗ੍ਰੇਸ਼ਨ
```bash
# Azure CLI ਦੀਆਂ ਪ੍ਰਮਾਣਿਕਤਾਵਾਂ ਵਰਤੋ (ਡਿਫਾਲਟ)
azd config set auth.useAzureCliCredential true

# ਨਿਰਧਾਰਿਤ ਟੈਨੈਂਟ ਨਾਲ ਲੌਗਇਨ ਕਰੋ
az login --tenant <tenant-id>

# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription <subscription-id>
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ ਪ੍ਰਮਾਣਿਕਤਾ
CI/CD ਪਾਇਪਲਾਈਨ ਲਈ:
```bash
# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ਜਾਂ ਸਿੱਧਾ ਸੰਰਚਿਤ ਕਰੋ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ
Azure-ਹੋਸਟ ਕੀਤੀਆਂ ਵਾਤਾਵਰਨਾਂ ਲਈ:
```bash
# ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਪ੍ਰਮਾਣੀਕਰਨ ਨੂੰ ਯੋਗ ਕਰੋ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ਇੰਫਰਾਸਟਰੱਕਚਰ ਕੰਫਿਗਰੇਸ਼ਨ

### Bicep ਪੈਰਾਮੀਟਰ
ਇੰਫਰਾਸਟਰੱਕਚਰ ਪੈਰਾਮੀਟਰ `infra/main.parameters.json` ਵਿੱਚ ਸੰਰਚਿਤ ਕਰੋ:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform ਕੰਫਿਗਰੇਸ਼ਨ
Terraform ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ, `infra/terraform.tfvars` ਵਿੱਚ ਸੰਰਚਿਤ ਕਰੋ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ਡਿਪਲੋਏਮੈਂਟ ਕੰਫਿਗਰੇਸ਼ਨ

### ਬਿਲਡ ਕੰਫਿਗਰੇਸ਼ਨ
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker ਕੰਫਿਗਰੇਸ਼ਨ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
ਉਦਾਹਰਨ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ਉन्नਤ ਕੰਫਿਗਰੇਸ਼ਨ

### ਕਸਟਮ ਰਿਸੋਰਸ ਨਾਮਕਰਨ
```bash
# ਨਾਮਕਰਨ ਦੇ ਨਿਯਮ ਨਿਰਧਾਰਤ ਕਰੋ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ਨੈਟਵਰਕ ਕੰਫਿਗਰੇਸ਼ਨ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ਮੋନੀਟਰਨਿੰਗ ਕੰਫਿਗਰੇਸ਼ਨ
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 ਵਾਤਾਵਰਨ-ਵਿਸ਼ੇਸ਼ ਕੰਫਿਗਰੇਸ਼ਨ

### ਵਿਕਾਸ ਵਾਤਾਵਰਨ
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਨ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਨ
```bash
# .ਅਜ਼ੂਰ/ਪ੍ਰੋਡਕਸ਼ਨ/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ਕੰਫਿਗਰੇਸ਼ਨ ਵੈਲੀਡੇਸ਼ਨ

### ਕੰਫਿਗਰੇਸ਼ਨ ਨੂੰ ਵੈਲੀਡੇਟ ਕਰੋ
```bash
# ਕੰਫਿਗਰੇਸ਼ਨ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
azd config validate

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਾਂ ਟੈਸਟ ਕਰੋ
azd env get-values

# ਢਾਂਚੇ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd provision --dry-run
```

### ਕੰਫਿਗਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟਸ
ਵੈਲੀਡੇਸ਼ਨ ਸਕ੍ਰਿਪਟਸ `scripts/` ਵਿੱਚ ਬਣਾਓ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ਲੋੜੀਂਦੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ਦੀ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ਬੈਸਟ ਪ੍ਰੈਕਟਿਸਜ਼

### 1. ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਵਰਤੋ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ਕੰਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ ਨੂੰ ਢਾਂਚਾਬੱਧ ਕਰੋ
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. ਵਰਜ਼ਨ ਕੰਟਰੋਲ ਵਿਚ ਵਿਚਾਰ
```bash
# .gitignore
.azure/*/config.json         # ਵਾਤਾਵਰਣ ਕੰਫਿਗਰੇਸ਼ਨ (ਸੰਸਾਧਨ ID ਸ਼ਾਮਿਲ ਹੋ ਸਕਦੇ ਹਨ)
.azure/*/.env               # ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ (ਗੁਪਤ ਜਾਣਕਾਰੀ ਹੋ ਸਕਦੀ ਹੈ)
.env                        # ਸਥਾਨਕ ਵਾਤਾਵਰਣ ਫਾਈਲ
```

### 4. ਕੰਫਿਗਰੇਸ਼ਨ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ
ਆਪਣੀ ਕੰਫਿਗਰੇਸ਼ਨ ਨੂੰ `CONFIG.md` ਵਿੱਚ ਡੌਕਯੂਮੈਂਟ ਕਰੋ:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 ਹੱਥ-ਉੱਤੇ ਅਭਿਆਸ ਕਸਰਤਾਂ

### ਕਸਰਤ 1: ਬਹੁ-ਵਾਤਾਵਰਨ ਕੰਫਿਗਰੇਸ਼ਨ (15 ਮਿੰਟ)

**ਲક્ષ্য**: ਤਿੰਨ ਵਾਤਾਵਰਨ ਬਣਾਓ ਅਤੇ ਵੱਖ-ਵੱਖ ਸੈਟਿੰਗਾਂ ਨਾਲ ਕੰਫਿਗਰ ਕਰੋ

```bash
# ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ਹਰ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਤਿੰਨ ਵਾਤਾਵਰਨ ਸਫਲਤਾਪੂਰਕ ਬਣਾਏ ਗਏ
- [ ] ਹਰ ਵਾਤਾਵਰਨ ਦੀ ਵਿਲੱਖਣ ਕੰਫਿਗਰੇਸ਼ਨ ਹੈ
- [ ] ਵਾਤਾਵਰਨਾਂ ਦਰਮਿਆਨ ਬਿਨਾਂ ਔਖੜੀ ਦੇ ਬਦਲੀ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ
- [ ] `azd env list` ਸਾਰੇ ਤਿੰਨ ਵਾਤਾਵਰਨ ਦਿਖਾਉਂਦਾ ਹੈ

### ਕਸਰਤ 2: ਸੀਕਰੇਟ ਪ੍ਰਬੰਧਨ (10 ਮਿੰਟ)

**ਲਖ਼ਯ**: ਸੰਵੇਦਨਸ਼ੀਲ ਡੇਟਾ ਨਾਲ ਸੁਰੱਖਿਅਤ ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਪ੍ਰੈਕਟਿਸ ਕਰੋ

```bash
# ਰਹੱਸ ਸੈੱਟ ਕਰੋ (ਆਉਟਪੁੱਟ ਵਿੱਚ ਨਹੀਂ ਦਿਖਾਏ ਜਾਣਗੇ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ਗੈਰ-ਰਹੱਸ ਸੰਰਚਨਾ ਸੈੱਟ ਕਰੋ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ਵਾਤਾਵਰਨ ਵੇਖੋ (ਰਹੱਸ ਛਿਪਾਏ ਜਾਣੇ ਚਾਹੀਦੇ ਹਨ)
azd env get-values

# ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਰਹੱਸ ਸਟੋਰ ਕੀਤੇ ਗਏ ਹਨ
azd env get DB_PASSWORD  # ਅਸਲ ਮੁੱਲ ਦਿਖਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਸੀਕਰੇਟ ਟਰਮੀਨਲ 'ਚ ਦਰਸਾਏ ਬਿਨਾਂ ਸਟੋਰ ਕੀਤੇ ਗਏ
- [ ] `azd env get-values` ਰੈਡੈਕਟ ਕੀਤੇ ਹੋਏ ਸੀਕਰੇਟ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਵਿਅਕਤੀਗਤ `azd env get <SECRET_NAME>` ਅਸਲ ਮੁੱਲ ਪ੍ਰਾਪਤ ਕਰਦਾ ਹੈ

## ਅਗਲੇ ਕਦਮ

- [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) - ਪ੍ਰਯੋਗ ਵਿੱਚ ਕੰਫਿਗਰੇਸ਼ਨ ਲਾਗੂ ਕਰੋ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਡਿਪਲੋਏਮੈਂਟ ਲਈ ਕੰਫਿਗਰੇਸ਼ਨ ਵਰਤੋ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ਉਤਪਾਦ-ਤਿਆਰ ਕੰਫਿਗਰੇਸ਼ਨ

## ਸੰਦਰਭ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 3 - ਕੰਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਿਛਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **➡️ ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਡਿਸਕਲੇਮਰ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤ੍ਰੁਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਵਜੋਂ ਮਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਉਤਪੰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->