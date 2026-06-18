# ਕਾਨਫਿਗਰੇਸ਼ਨ ਗਾਈਡ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 3 - ਸੰਰਚਨਾ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਿਛਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **➡️ ਅਗਲਾ**: [ਡੈਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 4: ਇੰਫਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ](../chapter-04-infrastructure/deployment-guide.md)

## ਪਰਚਾਰਨਾ

ਇਹ ਵਿਸਥਾਰਪੂਰਕ ਗਾਈਡ Azure Developer CLI ਨੂੰ ਵਧੀਆ ਵਿਕਾਸ ਅਤੇ ਡੈਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਲਈ ਕਾਨਫਿਗਰ ਕਰਨ ਦੇ ਸਾਰੇ ਪੱਖਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ ਕਾਨਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ, ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ, ਪ੍ਰਮਾਣਿਕਤਾ ਮੈਥਡ, ਅਤੇ ਉਹ ਅਡਵਾਂਸਡ ਕਾਨਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ ਸیکھੋਗੇ ਜੋ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਅਤੇ ਸੁਰੱਖਿਅਤ Azure ਡੈਪਲੋਇਮੈਂਟ ਨੂੰ ਯੋਗ ਬਣਾਉਂਦੇ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲੱਛਣ

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- azd ਕਾਨਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ ਵਿੱਚ ਨਿਪੁણ ਹੋ ਜਾਵੋਗੇ ਅਤੇ ਸਮਝੋਗੇ ਕਿ ਸੈਟਿੰਗਾਂ ਨੂੰ ਕਿਵੇਂ ਪ੍ਰਾਇਓਰਿਟਾਈਜ਼ ਕੀਤਾ ਜਾਂਦਾ ਹੈ
- ਗਲੋਬਲ ਅਤੇ ਪ੍ਰੋਜੈਕਟ-ਖਾਸ ਸੈਟਿੰਗਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਸੈਟ ਕਰੋਗੇ
- ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਵਾਲੇ ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋਗੇ
- ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ ਸਾਂਝ-ਪੈਟਰਨ ਲਾਗੂ ਕਰੋਗੇ
- ਜਟਿਲ ਸਥਿਤੀਆਂ ਲਈ ਅਡਵਾਂਸਡ ਕਾਨਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ ਸਮਝੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਵਿਕਾਸੀ ਵਰਕਫਲੋਜ਼ ਲਈ azd ਨੂੰ ਠੀਕ ਤਰ੍ਹਾਂ ਕਾਨਫਿਗਰ ਕਰਨਾ
- ਕਈ ਡੈਪਲੋਇਮੈਂਟ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਅਤੇ ਪ੍ਰਬੰਧਨ ਕਰਨਾ
- ਸੁਰੱਖਿਅਤ ਕਾਨਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰਨਾ
- ਕਾਨਫਿਗਰੇਸ਼ਨ-ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰਾਬਲਸ਼ੂਟ ਕਰਨਾ
- ਵਿਸ਼ੇਸ਼ ਸੰਗਠਨਾਤਮਕ ਲੋੜਾਂ ਲਈ azd ਦੇ ਵਿਹਾਰ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

ਇਹ ਵਿਸਥਾਰਪੂਰਕ ਗਾਈਡ Azure Developer CLI ਨੂੰ ਵਧੀਆ ਵਿਕਾਸ ਅਤੇ ਡੈਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਲਈ ਕਾਨਫਿਗਰ ਕਰਨ ਦੇ ਸਾਰੇ ਪੱਖਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ।

## azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ AI ਏਜੰਟਸ ਨੂੰ ਸਮਝਣਾ

ਜੇ ਤੁਸੀਂ AI ਏਜੰਟਸ ਵਿੱਚ ਨਵੇਂ ਹੋ, ਤਾਂ ਇਹ ਇੱਕ ਸਧਾਰਨ ਤਰੀਕਾ ਹੈ ਉਨ੍ਹਾਂ ਨੂੰ azd ਦੀ ਦੁਨੀਆ ਵਿੱਚ ਸੋਚਣ ਦਾ।

### ਏਜੰਟ ਕੀ ਹੁੰਦਾ ਹੈ?

ਏਜੰਟ ਇੱਕ ਸੌਫਟਵੇਅਰ ਦਾ ਟੁਕੜਾ ਹੁੰਦਾ ਹੈ ਜੋ ਇਕ ਬੇਨਤੀ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦਾ ਹੈ, ਉਸ ਬਾਰੇ ਸੋਚ ਸਕਦਾ ਹੈ, ਅਤੇ ਕਾਰਵਾਈਆਂ ਕਰ ਸਕਦਾ ਹੈ—ਅਕਸਰ ਕਿਸੇ AI ਮਾਡਲ ਨੂੰ ਕਾਲ ਕਰਕੇ, ਡੇਟਾ ਵੇਖ ਕੇ, ਜਾਂ ਹੋਰ ਸੇਵਾਵਾਂ ਨੂੰ ਚਲਾਕੀ ਨਾਲ ਵਰਤ ਕੇ। ਇੱਕ azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ, ਏਜੰਟ ਤੁਹਾਡੇ ਵੈੱਬ ਫਰੰਟਐਂਡ ਜਾਂ API ਬੈਕਐਂਡ ਦੇ ਨਾਲ ਇਕ ਹੋਰ ਸੇਵਾ ਹੈ।

### ਏਜੰਟ azd ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ ਵਿੱਚ ਕਿਵੇਂ ਫਿੱਟ ਹੁੰਦੇ ਹਨ

azd ਪ੍ਰੋਜੈਕਟ ਤਿੰਨ ਪਰਤਾਂ ਤੋਂ ਬਣਿਆ ਹੁੰਦਾ ਹੈ: **ਇੰਫਰਾਸਟਰੱਕਚਰ**, **ਕੋਡ**, ਅਤੇ **ਕਾਨਫਿਗਰੇਸ਼ਨ**। ਏਜੰਟ ਇਨ੍ਹਾਂ ਪਰਤਾਂ ਵਿੱਚ ਓਹੀ ਤਰ੍ਹਾਂ ਪਲੱਗ ਹੁੰਦੇ ਹਨ ਜਿਵੇਂ ਕੋਈ ਹੋਰ ਸੇਵਾ:

| Layer | ਪਰੰਪਰਾਗਤ ਐਪ ਲਈ ਇਹ ਕੀ ਕਰਦਾ ਹੈ | ਏਜੰਟ ਲਈ ਇਹ ਕੀ ਕਰਦਾ ਹੈ |
|-------|-------------------------------------|---------------------------|
| **ਇੰਫਰਾਸਟਰੱਕਚਰ** (`infra/`) | ਇੱਕ ਵੈੱਬ ਐਪ ਅਤੇ ਡੇਟਾਬੇਸ ਪ੍ਰੋਵਾਈਜ਼ ਕਰਦਾ ਹੈ | ਇੱਕ AI ਮਾਡਲ endpoint, search index, ਜਾਂ ਏਜੰਟ ਹੋਸਟ ਪ੍ਰੋਵਾਈਜ਼ ਕਰਦਾ ਹੈ |
| **ਕੋਡ** (`src/`) | ਤੁਹਾਡੇ ਫਰੰਟਐਂਡ ਅਤੇ API ਸੋਰਸ ਕੋਡ ਨੂੰ ਰੱਖਦਾ ਹੈ | ਤੁਹਾਡੇ ਏਜੰਟ ਲੋਜਿਕ ਅਤੇ ਪ੍ਰਾਂਪਟ ਡੇਫਿਨੀਸ਼ਨ ਰੱਖਦਾ ਹੈ |
| **ਕਾਨਫਿਗਰੇਸ਼ਨ** (`azure.yaml`) | ਤੁਹਾਡੀਆਂ ਸੇਵਾਵਾਂ ਅਤੇ ਉਹਨਾਂ ਦੇ ਹੋਸਟਿੰਗ ਟਾਰਗੇਟ ਦੀ ਸੂਚੀ ਦਿਖਾਉਂਦਾ ਹੈ | ਤੁਹਾਡੇ ਏਜੰਟ ਨੂੰ ਇਕ ਸੇਵਾ ਵਜੋਂ ਦਰਸਾਉਂਦਾ ਹੈ, ਜੋ ਇਸਦੇ ਕੋਡ ਅਤੇ ਹੋਸਟ ਵੱਲ ਇਸ਼ਾਰਾ ਕਰਦਾ ਹੈ |

### `azure.yaml` ਦੀ ਭੂਮਿਕਾ

ਤੁਹਾਨੂੰ ਹੁਣੇ ਹੀ ਸਿੰਟੈਕਸ ਯਾਦ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ। ਧਾਰਣਾਤਮਕ ਤੌਰ 'ਤੇ, `azure.yaml` ਉਹ ਫਾਇਲ ਹੈ ਜਿੱਥੇ ਤੁਸੀਂ azd ਨੂੰ ਦੱਸਦੇ ਹੋ: *"ਇਹ ਹਨ ਉਹ ਸੇਵਾਵਾਂ ਜੋ ਮੇਰੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਬਣਾਉਂਦੀਆਂ ਹਨ, ਅਤੇ ਇਹ ਹੈ ਜਿੱਥੇ ਉਹਨਾਂ ਦਾ ਕੋਡ ਮਿਲੇਗਾ."*

ਜਦੋਂ ਤੁਹਾਡੇ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਇਕ AI ਏਜੰਟ ਸ਼ਾਮਲ ਹੁੰਦਾ ਹੈ, `azure.yaml` ਆਸਾਨੀ ਨਾਲ ਉਸ ਏਜੰਟ ਨੂੰ ਇੱਕ ਸੇਵਾ ਵਜੋਂ ਸੂਚੀਬੱਧ ਕਰਦਾ ਹੈ। azd ਫਿਰ ਸਹੀ ਇੰਫਰਾਸਟਰੱਕਚਰ (ਜਿਵੇਂ Microsoft Foundry Models endpoint ਜਾਂ ਏਜੰਟ ਨੂੰ ਹੋਸਟ ਕਰਨ ਲਈ Container App) ਪ੍ਰੋਵਾਈਜ਼ ਕਰਨਾ ਅਤੇ ਤੁਹਾਡੇ ਏਜੰਟ ਕੋਡ ਨੂੰ ਡਿਪਲੋਏ ਕਰਨਾ ਜਾਣਦਾ ਹੈ—ਜਿਵੇਂ ਇਹ ਕਿਸੇ ਵੈੱਬ ਐਪ ਜਾਂ API ਲਈ ਕਰਦਾ।

ਇਸਦਾ ਮਤਲਬ ਇਹ ਹੈ ਕਿ ਸਿੱਖਣ ਲਈ ਕੁਝ ਨਵਾਂ ਬੁਨਿਆਦੀ ਤੌਰ 'ਤੇ ਨਹੀਂ ਹੈ। ਜੇ ਤੁਸੀਂ ਸਮਝਦੇ ਹੋ ਕਿ azd ਇੱਕ ਵੈੱਬ ਸੇਵਾ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਦਾ ਹੈ, ਤਾਂ ਤੁਸੀਂ ਪਹਿਲਾਂ ਹੀ ਸਮਝਦੇ ਹੋ ਕਿ ਇਹ ਇੱਕ ਏਜੰਟ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਦਾ ਹੈ।

## ਕਾਨਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ

azd ਹਾਇਰਾਰਕਿਕਲ ਕਾਨਫਿਗਰੇਸ਼ਨ ਸਿਸਟਮ ਵਰਤਦਾ ਹੈ:
1. **ਕਮਾਂਡ-ਲਾਈਨ ਫਲੈਗ** (ਸਭ ਤੋਂ ਉੱਚੀ ਪ੍ਰਾਇਓਰਿਟੀ)
2. **Environment variables**
3. **ਲੋਕਲ ਪ੍ਰੋਜੈਕਟ ਕਾਨਫਿਗਰੇਸ਼ਨ** (`.azd/config.json`)
4. **ਗਲੋਬਲ ਯੂਜ਼ਰ ਕਾਨਫਿਗਰੇਸ਼ਨ** (`~/.azd/config.json`)
5. **ਡਿਫ਼ਾਲਟ ਮੁੱਲ** (ਸਭ ਤੋਂ ਘੱਟ ਪ੍ਰਾਇਓਰਿਟੀ)

## ਗਲੋਬਲ ਕਾਨਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਡਿਫ਼ਾਲਟ ਸੈਟ ਕਰਨਾ
```bash
# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ਡਿਫਾਲਟ ਸਥਾਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.location "eastus2"

# ਡਿਫਾਲਟ ਰਿਸੋਰਸ ਗਰੁੱਪ ਦਾ ਨਾਂਕਰਨ ਨਿਯਮ ਸੈੱਟ ਕਰੋ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ਸਾਰੇ ਗਲੋਬਲ ਕੰਫਿਗਰੇਸ਼ਨ ਵੇਖੋ
azd config show

# ਇੱਕ ਕੰਫਿਗਰੇਸ਼ਨ ਹਟਾਓ
azd config unset defaults.location
```

### ਆਮ ਗਲੋਬਲ ਸੈਟਿੰਗਜ਼
```bash
# ਡਿਵੈਲਪਮੈਂਟ ਪਸੰਦਾਂ
azd config set alpha.enable true                    # ਅਲਫਾ ਫੀਚਰ ਚਾਲੂ ਕਰੋ
azd config set telemetry.enabled false             # ਟੈਲੀਮੀਟਰੀ ਨਿਸ਼ਕ੍ਰਿਆ ਕਰੋ
azd config set output.format json                  # ਆਉਟਪੁਟ ਫਾਰਮੈਟ ਸੈੱਟ ਕਰੋ

# ਸੁਰੱਖਿਆ ਸੈਟਿੰਗਜ਼
azd config set auth.useAzureCliCredential true     # ਪ੍ਰਮਾਣਕਰਨ ਲਈ Azure CLI ਵਰਤੋਂ ਕਰੋ
azd config set tls.insecure false                  # TLS ਜਾਂਚ ਲਾਗੂ ਕਰੋ

# ਕਾਰਗੁਜ਼ਾਰੀ ਸੁਧਾਰ
azd config set provision.parallelism 5             # ਸਮਾਂਤਰੀ ਸਰੋਤ ਬਣਾਉਣਾ
azd config set deploy.timeout 30m                  # ਡਿਪਲੋਇਮੈਂਟ ਟਾਈਮਆਊਟ
```

## 🏗️ ਪ੍ਰੋਜੈਕਟ ਕਾਨਫਿਗਰੇਸ਼ਨ

### azure.yaml ਸਟ੍ਰਕਚਰ
`azure.yaml` ਫਾਇਲ ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਕੇਂਦਰ ਹੈ:

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

### ਸੇਵਾ ਕਾਨਫਿਗਰੇਸ਼ਨ ਓਪਸ਼ਨ

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

#### ਭਾਸ਼ਾ-ਖਾਸ ਸੈਟਿੰਗਜ਼
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
# ਇੱਕ ਨਵਾਂ ਇਨਵਾਇਰਨਮੈਂਟ ਬਣਾਓ
azd env new development

# ਨਿਰਧਾਰਿਤ ਸਥਾਨ ਨਾਲ ਬਣਾਓ
azd env new staging --location "westus2"

# ਟੈਮਪਲੇਟ ਤੋਂ ਬਣਾਓ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ਵਾਤਾਵਰਣ ਕਾਨਫਿਗਰੇਸ਼ਨ
ਹਰ ਵਾਤਾਵਰਣ ਦੀ ਆਪਣੀ ਕਾਨਫਿਗਰੇਸ਼ਨ `.azure/<env-name>/config.json` ਵਿੱਚ ਹੁੰਦੀ ਹੈ:

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

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਜ਼
```bash
# ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਵੇਖੋ
azd env get-values

# ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁਟ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਹਟਾਓ
azd env unset DEBUG

# ਹਟਾਏ ਜਾਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd env get-values | grep DEBUG
# (ਕੁਝ ਵੀ ਵਾਪਸ ਨਹੀਂ ਆਉਣਾ ਚਾਹੀਦਾ)
```

### ਵਾਤਾਵਰਣ ਟੈਂਪਲੇਟ
ਇੱਕ ਸੁਸੰਗਤ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਲਈ `.azure/env.template` ਬਣਾਓ:
```bash
# ਲਾਜ਼ਮੀ ਵੈਰੀਏਬਲ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ਐਪਲੀਕੇਸ਼ਨ ਸੈਟਿੰਗਾਂ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ਵਿਕਾਸ ਲਈ ਵਿਕਲਪਿਕ ਸੈਟਿੰਗਾਂ
DEBUG=false
LOG_LEVEL=info
```

### ਟੀਮ ਵਿੱਚ ਵਾਤਾਵਰਣਾਂ ਸਾਂਝੇ ਕਰਨਾ

ਜਦੋਂ ਇੱਕ ਪ੍ਰੋਜੈਕਟ 'ਤੇ ਇੱਕ ਤੋਂ ਵੱਧ ਲੋਕ ਕੰਮ ਕਰਦੇ ਹਨ, ਤਾਂ ਤੁਹਾਨੂੰ ਇਹ ਮਨਜ਼ੂਰ ਕਰਨਾ ਪੈਂਦਾ ਹੈ ਕਿ **ਕਿਹੜੀ ਚੀਜ਼ ਰੇਪੋ ਸਾਥ ਲੈ ਕੇ ਚੱਲਦੀ ਹੈ ਅਤੇ ਕੀ ਲੋਕਲ ਹੀ ਰਹਿੰਦੀ ਹੈ**। azd ਹਰ ਵਾਤਾਵਰਣ ਨੂੰ `.azure/` ਫੋਲਡਰ ਹੇਠਾਂ ਰੱਖਦਾ ਹੈ, ਅਤੇ ਇਸ ਦਾ ਸਾਰਾ ਹਿੱਸਾ ਕਮਿੱਟ ਨਹੀਂ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ।

**`.azure/` ਵਿੱਚ ਕੀ ਹੁੰਦਾ ਹੈ:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**ਕੀ ਗਿਟਇਗਨੋਰ ਕਰਨਾ ਹੈ.** azd ਦੀ ਡਿਫ਼ਾਲਟ `.gitignore` ਪਹਿਲਾਂ ਹੀ `.azure/` ਨੂੰ ਬਾਹਰ ਰੱਖਦੀ ਹੈ। ਇਹ ਉਸੇ ਤਰ੍ਹਾਂ ਰੱਖੋ—`.env` ਫਾਇਲਾਂ ਵਿਚ ਸੀਕ੍ਰੇਟ ਹੋ ਸਕਦੇ ਹਨ, ਅਤੇ ਰਿਸੋਰਸ IDs ਜਿਸਨੇ ਪ੍ਰੋਵਾਈਜ਼ ਕੀਤੇ ਉਹਨਾਂ ਲਈ ਖਾਸ ਹੁੰਦੇ ਹਨ। ਹਰ ਟੀਮ ਮੈਂਬਰ ਆਪਣਾ **ਖੁਦ ਦਾ** ਵਾਤਾਵਰਣ ਲੋਕਲੀ ਬਣਾਉਂਦਾ ਹੈ:

```bash
# ਹਰ ਡਿਵੈਲਪਰ ਇਸਨੂੰ ਇਕ ਵਾਰੀ ਚਲਾਉਂਦਾ ਹੈ ਤਾਂ ਕਿ ਉਹ ਆਪਣਾ ਅਲੱਗ ਵਾਤਾਵਰਣ ਪ੍ਰਾਪਤ ਕਰ ਸਕੇ।
azd env new dev-alice
azd up
```

**ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਤਬਦੀਲੀ ਕਰਨਾ.** ਇੱਕ ਡਿਵੈਲਪਰ ਜੋ ਕਈ ਵਾਤਾਵਰਣ ਸੰਭਾਲਦਾ ਹੈ, ਕਮਾਂਡ ਚਲਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਐਕਟਿਵ ਇੱਕ ਨੂੰ ਚੁਣਦਾ ਹੈ:

```bash
azd env list                 # ਸਾਰੇ ਲੋਕਲ ਇੰਵਾਇਰਨਮੈਂਟ ਵੇਖੋ ਅਤੇ ਕਿਹੜਾ ਡਿਫਾਲਟ ਹੈ
azd env select staging       # 'staging' ਨੂੰ ਐਕਟਿਵ ਇੰਵਾਇਰਨਮੈਂਟ ਬਣਾਓ
azd env get-values           # ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਤੁਸੀਂ ਸਹੀ ਇਕ ਨੂੰ ਨਿਸ਼ਾਨਾ ਬਣਾਇਆ ਹੋਇਆ ਹੈ
```

**ਟੀਮ ਨੂੰ ਗੈਰ-ਸੀਕ੍ਰੇਟ ਡਿਫ਼ਾਲਟ ਮੁੱਲ ਦੇਣਾ.** ਇੱਕ ਟੈਂਪਲੇਟ (ਜਿਵੇਂ `.azure/env.template` ਉਪਰ) ਕਮਿੱਟ ਕਰੋ ਤਾਂ ਕਿ ਸਭ ਨੂੰ ਪਤਾ ਹੋਵੇ ਕਿ ਕਿਹੜੇ ਵੈਰੀਏਬਲ ਸੈਟ ਕਰਨੇ ਹਨ—ਪਰ ਕਦੇ ਵੀ ਭਰੇ ਹੋਏ ਮੁੱਲ ਕਮਿੱਟ ਨਾ ਕਰੋ। ਨਵੇਂ ਟੀਮ ਮੈਂਬਰ ਟੈਂਪਲੇਟ ਦੀ ਨਕਲ ਕਰਕੇ ਆਪਣੀਆਂ ਵੈਲਿਊਜ਼ ਭਰਦੇ ਹਨ।

**CI/CD ਵਿੱਚ ਵਾਤਾਵਰਣ.** ਪਾਈਪਲਾਈਨ ਤੁਹਾਡੇ ਲੋਕਲ `.azure/` ਫੋਲਡਰ ਨੂੰ ਨਹੀਂ ਪੜ੍ਹਦੀ। ਇਸ ਦੀ ਥਾਂ, ਵਾਤਾਵਰਣ ਮੁੱਲ ਪਾਈਪਲਾਈਨ ਵੈਰੀਏਬਲ/ਸੀਕ੍ਰੇਟ ਵਜੋਂ ਦਿਓ, ਅਤੇ azd ਉਨ੍ਹਾਂ ਨੂੰ ਪ੍ਰੋਸੈੱਸ ਦੇ Environment ਤੋਂ ਪੜ੍ਹਦਾ ਹੈ:

```bash
# CI ਵਿੱਚ, azd ਇਹਨਾਂ ਨੂੰ ਮਾਹੌਲ (environment) ਤੋਂ ਪੜ੍ਹਦਾ ਹੈ, .azure/ ਤੋਂ ਨਹੀਂ
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** infrastructure code (`infra/`, `azure.yaml`) Git ਵਿੱਚ ਸਾਂਝਾ ਕੀਤਾ ਜਾਂਦਾ ਹੈ; ਵਾਤਾਵਰਣ ਦੀ *ਸਟੇਟ ਅਤੇ ਸੀਕ੍ਰੇਟਸ* (`.azure/`) ਹਰ-ਡਿਵੈਲਪਰ ਅਤੇ ਹਰ-ਪਾਈਪਲਾਈਨ ਲਈ ਵੱਖ-ਵੱਖ ਹੁੰਦੇ ਹਨ। `azd pipeline config` ਤੁਹਾਡੇ ਲਈ ਪਾਈਪਲਾਈਨ ਵੈਰੀਏਬਲ ਆਪਣੇ ਆਪ ਸੈਟ ਕਰਦੇ ਹੈ।

## 🔐 ਪ੍ਰਮਾਣਿਕਤਾ ਕਾਨਫਿਗਰੇਸ਼ਨ

### Azure CLI ਇੰਟੀਗ੍ਰੇਸ਼ਨ
```bash
# Azure CLI ਦੀਆਂ ਕ੍ਰੈਡੈਂਸ਼ੀਅਲ ਦੀ ਵਰਤੋਂ ਕਰੋ (ਡਿਫਾਲਟ)
azd config set auth.useAzureCliCredential true

# ਨਿਰਧਾਰਿਤ ਟੇਨੈਂਟ ਨਾਲ ਲੌਗਇਨ ਕਰੋ
az login --tenant <tenant-id>

# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription <subscription-id>
```

### ਸਰਵਿਸ ਪ੍ਰਿਨਸਿਪਲ ਪ੍ਰਮਾਣਿਕਤਾ
CI/CD ਪਾਈਪਲਾਈਨਾਂ ਲਈ:
```bash
# ਮਾਹੌਲਿਕ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ਜਾਂ ਸਿੱਧਾ ਕਨਫਿਗਰ ਕਰੋ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ
Azure-ਹੋਸਟ ਕੀਤੇ ਵਾਤਾਵਰਣਾਂ ਲਈ:
```bash
# ਪ੍ਰਬੰਧਿਤ ਪਛਾਣ ਪ੍ਰਮਾਣੀਕਰਨ ਚਾਲੂ ਕਰੋ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ਇੰਫਰਾਸਟਰੱਕਚਰ ਕਾਨਫਿਗਰੇਸ਼ਨ

### Bicep ਪੈਰਾਮੀਟਰ
`infra/main.parameters.json` ਵਿੱਚ ਇੰਫਰਾਸਟਰੱਕਚਰ ਪੈਰਾਮੀਟਰ ਕਾਨਫਿਗਰ ਕਰੋ:
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

### Terraform ਕਾਨਫਿਗਰੇਸ਼ਨ
Terraform ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ, `infra/terraform.tfvars` ਵਿੱਚ ਕਾਨਫਿਗਰ ਕਰੋ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ਡੈਪਲੋਇਮੈਂਟ ਕਾਨਫਿਗਰੇਸ਼ਨ

### ਬਿਲਡ ਕਾਨਫਿਗਰੇਸ਼ਨ
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

### Docker ਕਾਨਫਿਗਰੇਸ਼ਨ
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
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ਅਡਵਾਂਸਡ ਕਾਨਫਿਗਰੇਸ਼ਨ

### ਕਸਟਮ ਰਿਸੋਰਸ ਨੇਮਿੰਗ
```bash
# ਨਾਮਕਰਨ ਦੇ ਨਿਯਮ ਨਿਰਧਾਰਤ ਕਰੋ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ਨੈੱਟਵਰਕ ਕਾਨਫਿਗਰੇਸ਼ਨ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ਮੋਨੀਟਰਿੰਗ ਕਾਨਫਿਗਰੇਸ਼ਨ
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

## 🎯 ਵਾਤਾਵਰਣ-ਖਾਸ ਕਾਨਫਿਗਰੇਸ਼ਨ

### ਵਿਕਾਸ ਵਾਤਾਵਰਣ
```bash
# .ਅਜ਼ੂਰ/ਡਿਵੈਲਪਮੈਂਟ/.env
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

## 🔍 ਕਾਨਫਿਗਰੇਸ਼ਨ ਵੈਰੀਫਿਕੇਸ਼ਨ

### ਕਾਨਫਿਗਰੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
# ਕੰਫਿਗਰੇਸ਼ਨ ਦੇ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
azd config validate

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਜ਼ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values

# ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd provision --dry-run
```

### ਕਾਨਫਿਗਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟਸ
`scripts/` ਵਿੱਚ ਵੈਲਿਡੇਸ਼ਨ ਸਕ੍ਰਿਪਟ ਬਣਾਓ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ਲੋੜੀਂਦੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ਦੇ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ਸ਼੍ਰੇਸ਼ਠ ਅਭਿਆਸ

### 1. Environment Variables ਦੀ ਵਰਤੋਂ ਕਰੋ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ਕਾਨਫਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਦਾ ਆਯੋਜਨ ਕਰੋ
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

### 3. ਵਰਜਨ ਕੰਟਰੋਲ ਬਾਰੇ ਵਿਚਾਰ
```bash
# .gitignore
.azure/*/config.json         # ਵਾਤਾਵਰਣ ਸੰਰਚਨਾਵਾਂ (ਸੰਸਾਧਨ ID ਸ਼ਾਮਲ ਹੋ ਸਕਦੇ ਹਨ)
.azure/*/.env               # ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ (ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ)
.env                        # ਲੋਕਲ ਵਾਤਾਵਰਣ ਫਾਇਲ
```

### 4. ਕਾਨਫਿਗਰੇਸ਼ਨ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ
ਆਪਣੀ ਕਾਨਫਿਗਰੇਸ਼ਨ ਨੂੰ `CONFIG.md` ਵਿੱਚ ਡਾਕਯੂਮੈਂਟ ਕਰੋ:
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

## 🎯 ਹੈਂਡਸ-ਆਨ ਅਭਿਆਸ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਬਹੁ-ਵਾਤਾਵਰਣ ਕਾਨਫਿਗਰੇਸ਼ਨ (15 ਮਿੰਟ)

**ਉਦੇਸ਼**: ਤਿੰਨ ਵਾਤਾਵਰਣ ਬਣਾਓ ਅਤੇ ਵੱਖ-ਵੱਖ ਸੈਟਿੰਗਜ਼ ਨਾਲ ਕਾਨਫਿਗਰ ਕਰੋ

```bash
# ਡਿਵੈਲਪਮੈਂਟ ਮਾਹੌਲ ਤਿਆਰ ਕਰੋ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ਸਟੇਜਿੰਗ ਮਾਹੌਲ ਤਿਆਰ ਕਰੋ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ਪ੍ਰੋਡਕਸ਼ਨ ਮਾਹੌਲ ਤਿਆਰ ਕਰੋ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ਹਰ ਮਾਹੌਲ ਦੀ ਜਾਂਚ ਕਰੋ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਤਿੰਨ ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਕ ਬਣਾਏ ਗਏ
- [ ] ਹਰ ਵਾਤਾਵਰਣ ਦੀ ਅਲੱਗ ਕਾਨਫਿਗਰੇਸ਼ਨ ਹੈ
- [ ] ਵਾਤਾਵਰਣਾਂ ਦੇ ਵਿਚਕਾਰ ਬਿਨਾਂ ਐਰਰਸ ਦੇ ਸਵਿੱਚ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
- [ ] `azd env list` ਤਿੰਨੋਂ ਵਾਤਾਵਰਣ ਦਿਖਾਉਂਦਾ ਹੈ

### ਅਭਿਆਸ 2: ਸੀਕ੍ਰੇਟ ਪ੍ਰਬੰਧਨ (10 ਮਿੰਟ)

**ਉਦੇਸ਼**: ਸੰਵੇਦਨਸ਼ੀਲ ਡੇਟਾ ਨਾਲ ਸੁਰੱਖਿਅਤ ਕਾਨਫਿਗਰੇਸ਼ਨ ਦਾ ਅਭਿਆਸ ਕਰੋ

```bash
# ਗੁਪਤ ਸੈੱਟ ਕਰੋ (ਆਉਟਪੁਟ ਵਿੱਚ ਨਹੀਂ ਦਿਖਾਇਆ ਜਾਵੇਗਾ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ਗੈਰ-ਗੁਪਤ ਸੰਰਚਨਾ ਸੈੱਟ ਕਰੋ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੇਖੋ (ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਨੂੰ ਲੁਕਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ)
azd env get-values

# ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਸਟੋਰ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ
azd env get DB_PASSWORD  # ਅਸਲ ਮੁੱਲ ਦਿਖਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਸੀਕ੍ਰੇਟ ਟਰਮੀਨਲ ਵਿੱਚ ਦਿਖਾਏ ਬਿਨਾਂ ਸਟੋਰ ਕੀਤੇ ਗਏ
- [ ] `azd env get-values` ਰੈਡੈਕਟ ਕੀਤੇ ਹੋਏ ਸੀਕ੍ਰੇਟ ਦਿਖਾਂਦਾ ਹੈ
- [ ] ਵੱਖ-ਵੱਖ `azd env get <SECRET_NAME>` ਅਸਲ ਮੁੱਲ ਪ੍ਰਾਪਤ ਕਰਦਾ ਹੈ

## ਅਗਲੇ ਕਦਮ

- [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) - ਪ੍ਰੈਕਟਿਸ ਵਿੱਚ ਕਾਨਫਿਗਰੇਸ਼ਨ ਲਾਗੂ ਕਰੋ
- [ਡੈਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) - ਡੈਪਲੋਇਮੈਂਟ ਲਈ ਕਾਨਫਿਗਰੇਸ਼ਨ ਵਰਤੋ
- [ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](../chapter-04-infrastructure/provisioning.md) - ਪ੍ਰੋਡਕਸ਼ਨ-ਰੈਡੀ ਕਾਨਫਿਗਰੇਸ਼ਨ

## ਹਵਾਲੇ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 3 - ਸੰਰਚਨਾ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਿਛਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 4: ਇੰਫਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ](../chapter-04-infrastructure/deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->