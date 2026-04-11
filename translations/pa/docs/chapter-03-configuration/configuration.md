# ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਗਾਈਡ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 3 - ਕੰਫ਼ਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਿਛਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **➡️ ਅਗਲਾ**: [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 4: ਇੰਫਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ](../chapter-04-infrastructure/deployment-guide.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਦੀਆਂ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਲਈ ਕੁੱਝ ਵੀ ਆਵਸ਼ਯਕ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਪਹੁੰਚਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ, ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ, ਪ੍ਰਮਾਣਿਕਤਾ ਵਿਕਲਪਾਂ, ਅਤੇ ਉੱਨਤ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਪੈਟਰਨਸ ਬਾਰੇ ਸਿੱਖੋਗੇ ਜੋ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਅਤੇ ਸੁਰੱਖਿਅਤ Azure ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਆਗੂਈ ਕਰਦੇ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- azd ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ 'ਤੇ ਮਾਹਿਰ ਹੋਵੋਗੇ ਅਤੇ ਸਮਝੋਗੇ ਕਿ ਸੈਟਿੰਗਸ ਨੂੰ ਕਿਵੇਂ ਤਰਜੀਹ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ
- ਗਲੋਬਲ ਅਤੇ ਪ੍ਰੋਜੈਕਟ-ਖ਼ਾਸ ਸੈਟਿੰਗਸ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਕੰਫ਼ਿਗਰ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਕਨਫ਼ਿਗਰੇਸ਼ਨਾਂ ਵਾਲੀਆਂ ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕਰਨਾ
- ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰਣ ਪੈਟਰਨ ਲਾਗੂ ਕਰਨਾ
- ਜਟਿਲ ਸਕੀਨਰੀਓਜ਼ ਲਈ ਉੱਨਤ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਪੈਟਰਨਸ ਨੂੰ ਸਮਝਣਾ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਮੁਕੰਮਲ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- azd ਨੂੰ ਉੱਤਮ ਵਿਕਾਸ ਵਰਕਫਲੋਜ਼ ਲਈ ਕੰਫ਼ਿਗਰ ਕਰਨਾ
- ਕਈ ਡਿਪਲੋਇਮੈਂਟ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨਾ
- ਸੁਰੱਖਿਅਤ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰਨਾ
- ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਸਬੰਧੀ ਮੁੱਦਿਆਂ ਨੂੰ ਟਰਬਲਸ਼ੂਟ ਕਰਨਾ
- ਵਿਸ਼ੇਸ਼ ਸੰਗਠਨਕ ਜ਼ਰੂਰਤਾਂ ਲਈ azd ਵਰਤਾਰਾ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਦੀਆਂ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਲਈ ਕੁਝ ਵੀ ਆਵਸ਼ਯਕ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਪਹੁੰਚਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ।

## azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ AI ਏਜੰਟਸ ਨੂੰ ਸਮਝਣਾ

ਜੇ ਤੁਸੀਂ AI ਏਜੰਟਸ ਲਈ ਨਵੇਂ ਹੋ, ਤਾਂ ਇਥੇ ਇੱਕ ਸਧਾਰਣ ਤਰੀਕਾ ਹੈ ਇਨ੍ਹਾਂ ਨੂੰ azd ਦੁਨੀਆ ਵਿੱਚ ਸੋਚਣ ਦਾ।

### ਏਜੰਟ ਕੀ ਹੈ?

ਏਜੰਟ ਇੱਕ ਸਾਫਟਵੇਅਰ ਹਿੱਸਾ ਹੈ ਜੋ ਰਿਕਵੇਸਟ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦਾ ਹੈ, ਉਸ ਬਾਰੇ ਤਰਕ ਕਰ ਸਕਦਾ ਹੈ, ਅਤੇ ਕਾਰਵਾਈਆਂ ਕਰ ਸਕਦਾ ਹੈ—ਅਕਸਰ ਕਿਸੇ AI ਮਾਡਲ ਨੂੰ ਕਾਲ ਕਰਨ, ਡਾਟਾ ਲੱਭਣ ਜਾਂ ਹੋਰ ਸੇਵਾਵਾਂ ਨੂੰ ਇਨਵੋਕ ਕਰਨ ਰਾਹੀਂ। ਇੱਕ azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ, ਇੱਕ ਏਜੰਟ ਤੁਹਾਡੇ ਵੈੱਬ ਫਰੰਟਐਂਡ ਜਾਂ API ਬੈਕਐਂਡ ਦੇ ਨਾਲ ਇੱਕ ਹੋਰ **ਸੇਵਾ** ਹੀ ਹੈ।

### ਏਜੰਟ azd ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ ਵਿੱਚ ਕਿਵੇਂ ਫਿੱਟ ਹੁੰਦੇ ਹਨ

ਇੱਕ azd ਪ੍ਰੋਜੈਕਟ ਤਿੰਨ ਪرتਾਂ 'ਚ ਬਣਿਆ ਹੁੰਦਾ ਹੈ: **ਇੰਫਰਾਸਟਰੱਕਚਰ**, **ਕੋਡ**, ਅਤੇ **ਕਨਫ਼ਿਗਰੇਸ਼ਨ**। ਏਜੰਟ ਇਨ੍ਹਾਂ ਪرتਾਂ ਵਿੱਚ ਉਸੇ ਤਰ੍ਹਾਂ ਪਲੱਗ-ਇਨ ਹੁੰਦਾ ਹੈ ਜਿਵੇਂ ਹੋਰ ਕੋਈ ਵੀ ਸੇਵਾ:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **ਇੰਫਰਾਸਟਰੱਕਚਰ** (`infra/`) | ਇੱਕ ਵੈੱਬ ਐਪ ਅਤੇ ਡੇਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ | ਇੱਕ AI ਮਾਡਲ ਐਂਡਪੌਇੰਟ, سرچ ਇੰਡੈਕਸ, ਜਾਂ ਏਜੰਟ ਹੋਸਟ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ |
| **ਕੋਡ** (`src/`) | ਤੁਹਾਡੇ ਫਰੰਟਐਂਡ ਅਤੇ API ਸਰੋਤ ਕੋਡ ਨੂੰ ਰੱਖਦਾ ਹੈ | ਤੁਹਾਡੇ ਏਜੰਟ ਲਾਜਿਕ ਅਤੇ ਪ੍ਰੋਂਪਟ ਪਰਿਭਾਸ਼ਾਵਾਂ ਨੂੰ ਰੱਖਦਾ ਹੈ |
| **ਕਨਫ਼ਿਗਰੇਸ਼ਨ** (`azure.yaml`) | ਤੁਹਾਡੀਆਂ ਸੇਵਾਵਾਂ ਅਤੇ ਉਹਨਾਂ ਦੇ ਹੋਸਟਿੰਗ ਟਾਰਗੇਟ ਦੀ ਸੂਚੀ ਬਣਾਉਂਦਾ ਹੈ | ਤੁਹਾਡੇ ਏਜੰਟ ਨੂੰ ਇੱਕ ਸੇਵਾ ਵਜੋਂ ਸੂਚੀਬੱਧ ਕਰਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਉਸ ਦੇ ਕੋਡ ਅਤੇ ਹੋਸਟ ਦੀ ਨਿਸ਼ਾਨਦੇਹੀ ਹੁੰਦੀ ਹੈ |

### `azure.yaml` ਦੀ ਭੂਮਿਕਾ

ਤੁਹਾਨੂੰ ਹੁਣ ਹੀ ਸਿੰਟੈਕਸ ਯਾਦ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ। ਧਾਰਨਾਤਮਕ ਤੌਰ 'ਤੇ, `azure.yaml` ਉਹ ਫਾਇਲ ਹੈ ਜਿਸ ਵਿੱਚ ਤੁਸੀਂ azd ਨੂੰ ਦੱਸਦੇ ਹੋ: "ਇਹ ਮੇਰੇ ਐਪਲੀਕੇਸ਼ਨ ਦੀਆਂ ਸੇਵਾਵਾਂ ਹਨ, ਅਤੇ ਇਹ ਉਨ੍ਹਾਂ ਦੇ ਕੋਡ ਕਿੱਥੇ ਮਿਲਦੇ ਹਨ।"

ਜਦੋਂ ਤੁਹਾਡੇ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਇੱਕ AI ਏਜੰਟ ਸ਼ਾਮਲ ਹੁੰਦਾ ਹੈ, `azure.yaml` ਸਿਰਫ਼ ਉਸ ਏਜੰਟ ਨੂੰ ਇੱਕ ਸੇਵਾ ਵਜੋਂ ਸੂਚੀਬੱਧ ਕਰਦਾ ਹੈ। azd ਫਿਰ ਸਹੀ ਇੰਫਰਾਸਟਰੱਕਚਰ (ਜਿਵੇਂ Microsoft Foundry Models ਐਂਡਪੌਇੰਟ ਜਾਂ ਏਜੰਟ ਨੂੰ ਹੋਸਟ ਕਰਨ ਲਈ Container App) ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨ ਅਤੇ ਤੁਹਾਡੇ ਏਜੰਟ ਕੋਡ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨ ਲਈ ਜਾਣਦਾ ਹੈ—ਬਿਲਕੁਲ ਉਸੇ ਤਰ੍ਹਾਂ ਜਿਵੇਂ ਇਹ ਵੈੱਬ ਐਪ ਜਾਂ API ਲਈ ਕਰਦਾ ਹੈ।

ਇਸ ਦਾ ਮਤਲਬ ਇਹ ਹੈ ਕਿ ਬੁਨਿਆਦੀ ਤੌਰ 'ਤੇ ਨਵੇਂ ਸਿੱਖਣ ਵਾਲੀ ਕੋਈ ਗੱਲ ਨਹੀਂ ਹੈ। ਜੇ ਤੁਸੀਂ ਸਮਝਦੇ ਹੋ ਕਿ azd ਕਿਸ ਤਰ੍ਹਾਂ ਇੱਕ ਵੈੱਬ ਸੇਵਾ ਦਾ ਪ੍ਰਬੰਧ ਕਰਦਾ ਹੈ, ਤਾਂ ਤੁਸੀਂ ਪਹਿਲਾਂ ਹੀ ਸਮਝਦੇ ਹੋ ਕਿ ਇਹ ਇੱਕ ਏਜੰਟ ਦਾ ਪ੍ਰਬੰਧ ਕਿਵੇਂ ਕਰਦਾ ਹੈ।

## ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ

azd ਇੱਕ ਹਾਇਰਾਰਕੀ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਸਿਸਟਮ ਵਰਤਦਾ ਹੈ:
1. **ਕਮਾਂਡ-ਲਾਈਨ ਫਲੈਗ** (ਸਭ ਤੋਂ ਉੱਚੀ ਤਰਜੀਹ)
2. **ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ**
3. **ਲੋਕਲ ਪ੍ਰੋਜੈਕਟ ਕਨਫ਼ਿਗਰੇਸ਼ਨ** (`.azd/config.json`)
4. **ਗਲੋਬਲ ਯੂਜ਼ਰ ਕਨਫ਼ਿਗਰੇਸ਼ਨ** (`~/.azd/config.json`)
5. **ਡੀਫੌਲਟ ਮੁੱਲ** (ਸਭ ਤੋਂ ਘੱਟ ਤਰਜੀਹ)

## ਗਲੋਬਲ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਡੀਫੌਲਟ ਸੈਟ ਕਰਨਾ
```bash
# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ਡਿਫਾਲਟ ਸਥਾਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.location "eastus2"

# ਡਿਫਾਲਟ ਰਿਸੋਰਸ ਗਰੁੱਪ ਨਾਮਕਰਨ ਰਵਾਇਤ ਸੈੱਟ ਕਰੋ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ਸਭ ਗਲੋਬਲ ਸੰਰਚਨਾ ਵੇਖੋ
azd config show

# ਇੱਕ ਸੰਰਚਨਾ ਹਟਾਓ
azd config unset defaults.location
```

### ਆਮ ਗਲੋਬਲ ਸੈਟਿੰਗਸ
```bash
# ਵਿਕਾਸ ਦੀਆਂ ਪਸੰਦਾਂ
azd config set alpha.enable true                    # ਅਲਫਾ ਫੀਚਰਾਂ ਚਾਲੂ ਕਰੋ
azd config set telemetry.enabled false             # ਟੈਲੀਮੇਟਰੀ ਅਯੋਗ ਕਰੋ
azd config set output.format json                  # ਆਉਟਪੁੱਟ ਫਾਰਮੈਟ ਸੈੱਟ ਕਰੋ

# ਸੁਰੱਖਿਆ ਸੈਟਿੰਗਾਂ
azd config set auth.useAzureCliCredential true     # ਪ੍ਰਮਾਣਕਰਨ ਲਈ Azure CLI ਵਰਤੋ
azd config set tls.insecure false                  # TLS ਪੁਸ਼ਟੀਕਰਨ ਲਾਗੂ ਕਰੋ

# ਕਾਰਕਰਦਗੀ ਸੁਧਾਰ
azd config set provision.parallelism 5             # ਸਮਾਂਤਰੀ ਸੰਸਾਧਨ ਬਣਾਉਣਾ
azd config set deploy.timeout 30m                  # ਤੈਨਾਤੀ ਸਮਾਂ-ਸੀਮਾ
```

## 🏗️ ਪ੍ਰੋਜੈਕਟ ਕਨਫਿਗਰੇਸ਼ਨ

### azure.yaml ਦੀ ਸੰਰਚਨਾ
The `azure.yaml` file is the heart of your azd project:

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

### ਸਰਵਿਸ ਕਨਫਿਗਰੇਸ਼ਨ ਵਿਕਲਪ

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

#### ਭਾਸ਼ਾ-ਖ਼ਾਸ ਸੈਟਿੰਗਸ
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

## 🌟 ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ

### ਵਾਤਾਵਰਣ ਬਣਾਉਣਾ
```bash
# ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new development

# ਨਿਰਧਾਰਤ ਸਥਾਨ ਨਾਲ ਬਣਾਓ
azd env new staging --location "westus2"

# ਟੈਮਪਲੇਟ ਤੋਂ ਬਣਾਓ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ
Each environment has its own configuration in `.azure/<env-name>/config.json`:

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

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
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

# ਮਾਹੌਲ-ਵੈਰੀਏਬਲ ਹਟਾਓ
azd env unset DEBUG

# ਹਟਾਉਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd env get-values | grep DEBUG
# (ਕੁਝ ਵੀ ਨਹੀਂ ਵਾਪਸ ਹੋਣਾ ਚਾਹੀਦਾ)
```

### ਵਾਤਾਵਰਣ ਟੈਮਪਲੇਟ
Create `.azure/env.template` for consistent environment setup:
```bash
# ਜ਼ਰੂਰੀ ਵੈਰੀਏਬਲ
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

## 🔐 ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

### Azure CLI ਇੰਟੀਗਰੇਸ਼ਨ
```bash
# Azure CLI ਪ੍ਰਮਾਣ-ਪੱਤਰ (ਡਿਫੌਲਟ) ਦੀ ਵਰਤੋਂ ਕਰੋ
azd config set auth.useAzureCliCredential true

# ਨਿਰਧਾਰਿਤ ਟੇਨੈਂਟ ਨਾਲ ਲੌਗਇਨ ਕਰੋ
az login --tenant <tenant-id>

# ਡਿਫੌਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈਟ ਕਰੋ
az account set --subscription <subscription-id>
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ ਪ੍ਰਮਾਣਿਕਤਾ
For CI/CD pipelines:
```bash
# ਮਾਹੌਲ ਚਲਕਾਂ ਸੈੱਟ ਕਰੋ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ਜਾਂ ਸਿੱਧੇ ਤੌਰ ਤੇ ਸੰਰਚਿਤ ਕਰੋ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ਮੈਨੇਜਡ ਆਈਡੇਂਟੀਟੀ
For Azure-hosted environments:
```bash
# ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਪ੍ਰਮਾਣਿਕਤਾ ਨੂੰ ਯੋਗ ਕਰੋ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ਇੰਫਰਾਸਟਰੱਕਚਰ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

### Bicep ਪੈਰਾਮੀਟਰ
Configure infrastructure parameters in `infra/main.parameters.json`:
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

### Terraform ਕਨਫ਼ਿਗਰੇਸ਼ਨ
For Terraform projects, configure in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ਡਿਪਲੋਇਮੈਂਟ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

### ਬਿਲਡ ਕਨਫ਼ਿਗਰੇਸ਼ਨ
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

### Docker ਕਨਫ਼ਿਗਰੇਸ਼ਨ
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

## 🔧 ਉੱਨਤ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

### ਕਸਟਮ ਰਿਸੋਰਸ ਨਾਮਕਰਨ
```bash
# ਨਾਮਕਰਨ ਦੇ ਨਿਯਮ ਨਿਰਧਾਰਤ ਕਰੋ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ਨੈੱਟਵਰਕ ਕਨਫ਼ਿਗਰੇਸ਼ਨ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ਮਾਨੀਟਰਿੰਗ ਕਨਫ਼ਿਗਰੇਸ਼ਨ
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

## 🎯 ਵਾਤਾਵਰਣ-ਖ਼ਾਸ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

### ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਮਾਨਤਾ ਜਾਂਚ

### ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
# ਕੰਫਿਗਰੇਸ਼ਨ ਦੇ ਸਿਨਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
azd config validate

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਜ਼ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values

# ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd provision --dry-run
```

### ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟਸ
Create validation scripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ਲੋੜੀਂਦੇ ਵਾਤਾਵਰਣ ਚਲਕਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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

## 🎓 ਸ਼੍ਰੇਸ਼ਠ ਅਭਿਆਸ

### 1. ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਦੀ ਵਰਤੋਂ ਕਰੋ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਦਾ ਸੁਚੱਜਾ ਪ੍ਰਬੰਧ ਕਰੋ
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

### 3. ਵਰਜਨ ਕੰਟਰੋਲ ਸੰਬੰਧੀ ਵਿਚਾਰ
```bash
# .gitignore
.azure/*/config.json         # ਵਾਤਾਵਰਣ ਸੰਰਚਨਾਵਾਂ (ਜਿਨ੍ਹਾਂ ਵਿੱਚ ਸੰਸਾਧਨ ID ਹੁੰਦੇ ਹਨ)
.azure/*/.env               # ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ (ਇਨ੍ਹਾਂ ਵਿੱਚ ਸ਼ਾਇਦ ਰਾਜ਼ ਹੋ ਸਕਦੇ ਹਨ)
.env                        # ਸਥਾਨਕ ਵਾਤਾਵਰਣ ਫਾਇਲ
```

### 4. ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ
Document your configuration in `CONFIG.md`:
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

## 🎯 ਹੱਥ-ਅਨ ਅਭਿਆਸ ਕਸਰਤਾਂ

### ਕਸਰਤ 1: ਬਹੁ-ਵਾਤਾਵਰਣ ਕਨਫ਼ਿਗਰੇਸ਼ਨ (15 ਮਿੰਟ)

**ਮਕਸਦ**: ਤਿੰਨ ਵਾਤਾਵਰਣ ਬਣਾਓ ਅਤੇ ਵੱਖ-ਵੱਖ ਸੈਟਿੰਗਸ ਨਾਲ ਕੰਫ਼ਿਗਰ ਕਰੋ

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

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ:**
- [ ] ਤਿੰਨ ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਏ ਗਏ
- [ ] ਹਰ ਵਾਤਾਵਰਣ ਦੀ ਵਿਲੱਖਣ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਹੈ
- [ ] ਗਲਤੀਆਂ ਦੇ ਬਗ਼ੈਰ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਬਦਲ ਸਕਦੇ ਹੋ
- [ ] `azd env list` ਸਾਰੇ ਤਿੰਨ ਵਾਤਾਵਰਣ ਦਿਖਾਉਂਦਾ ਹੈ

### ਕਸਰਤ 2: ਸੀਕ੍ਰੇਟ ਪ੍ਰਬੰਧਨ (10 ਮਿੰਟ)

**ਮਕਸਦ**: ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਨਾਲ ਸੁਰੱਖਿਅਤ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਦਾ ਅਭਿਆਸ ਕਰੋ

```bash
# ਸੀਕ੍ਰੇਟ ਸੈੱਟ ਕਰੋ (ਆਉਟਪੁੱਟ ਵਿੱਚ ਨਹੀਂ ਦਿਖਾਏ ਜਾਣਗੇ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ਗੈਰ-ਰਹੱਸ ਕਨਫਿਗ ਸੈੱਟ ਕਰੋ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ਮਾਹੌਲ ਵੇਖੋ (ਸੀਕ੍ਰੇਟ ਲੁਕਾਏ ਜਾਣੇ ਚਾਹੀਦੇ ਹਨ)
azd env get-values

# ਇਹ ਪੱਕਾ ਕਰੋ ਕਿ ਸੀਕ੍ਰੇਟ ਸਟੋਰ ਕੀਤੇ ਗਏ ਹਨ
azd env get DB_PASSWORD  # ਵਾਸਤਵਿਕ ਮੁੱਲ ਦਿਖਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
```

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ:**
- [ ] ਸੀਕਰੇਟ ਟਰਮੀਨਲ 'ਚ ਦਿਖਾਏ ਬਿਨਾਂ ਭੰਡਾਰਿਤ ਕੀਤੇ ਗਏ
- [ ] `azd env get-values` ਰੇਡੈਕਟ ਕੀਤੇ ਹੋਏ ਸੀਕਰੇਟ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਇੰਡੀਵਿਜ਼ੂਅਲ `azd env get <SECRET_NAME>` ਅਸਲ ਮੁੱਲ ਪ੍ਰਾਪਤ ਕਰਦਾ ਹੈ

## ਅਗਲੇ ਕਦਮ

- [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) - ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਨੂੰ ਅਮਲ ਵਿੱਚ ਲਾਗੂ ਕਰੋ
- [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) - ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਵਰਤੋ
- [ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](../chapter-04-infrastructure/provisioning.md) - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

## ਹਵਾਲੇ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 3 - ਕੰਫ਼ਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਿਛਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **➡️ ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 4: ਇੰਫਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ](../chapter-04-infrastructure/deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਰਨ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰ ਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕوشਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਠੀਕਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਤਪੰਨ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਵਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->