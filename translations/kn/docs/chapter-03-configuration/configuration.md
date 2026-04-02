# ಸಂರಚನಾ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜೆಡಿವಿಗೆ ಆರಂಭಿಕರು](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಸಂರಚನೆ ಮತ್ತು ಪ್ರಮಾಣೀಕರಣ
- **⬅️ ಹಿಂದಿನದು**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **➡️ ಮುಂದಿನದು**: [ವಿಭಾಜನಾ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 4: ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಆಸ್ ಕೋಡ್](../chapter-04-infrastructure/deployment-guide.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶನವು ಅಜೂರ್ ಡೆವಲಪರ್ CLI ಯನ್ನು ಸರಿಯಾಗಿಯೂ ಪರಿಣಾಮಕಾರಿಯಾದ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ ಮತ್ತು ವಿಭಾಗೀಕರಣ ಕಾರ್ಯವಿಧಾನಗಳಿಗಾಗಿ ಹೇಗೆ ಇಟ್ಟುಕೊಳ್ಳಬೇಕೆಂಬುದರ ಎಲ್ಲ ಅಂಶಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ನೀವು ಸಂರಚನಾ ಹಿರಾರ್ಕಿ, ಪರಿಸರ ನಿರ್ವಹಣೆ, ಪ್ರಮಾಣೀಕರಣ ವಿಧಾನಗಳು ಮತ್ತು ಸುಧಾರಿತ ಸಂರಚನಾ ವಿನ್ಯಾಸಗಳು ಇವುಗಳನ್ನು ತಿಳಿದುಕೊಳ್ತೀರಿ, ಇವು ಕ್ಲಿಷ್ಟಕರ ಮತ್ತು ಭದ್ರವಾದ ಅಜೂರ್ ವಿಭಾಗಗಳಿಗಾಗಿ ಸಹಾಯಕವಿದೆ.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಪಾಠದ ಅಂತ್ಯಕ್ಕೆ ನೀವು:
- ಅಜ್ ಡಿ ಸಂರಚನಾ ಹಿರಾರ್ಕಿಯನ್ನು ಪರಿಪೂರ್ಣವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತಾರೆ ಮತ್ತು ಸೆಟ್ಟಿಂಗ್ಸ್ ಅನ್ನು ಹೇಗೆ ಪ್ರಾಮುಖ್ಯತೆ ನೀಡಲಾಗುತ್ತದೆ ಎಂದು ತಿಳಿಯೋದು
- ಜಾಗತಿಕ ಮತ್ತು ಪ್ರಾಜೆಕ್ಟ್-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್ಸ್ ಅನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಸಂರಚಿಸುವುದು
- ವಿಭಿನ್ನ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಬಹುಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು
- ಭದ್ರವಾಗಿ ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಪ್ರಾಧಿಕರಣ ವಿನ್ಯಾಸಗಳನ್ನು ಜಾರಿಗೆ ತರಲು
- ಸಂಕೀರ್ಣ ಸಂದರ್ಭಗಳಿಗೆ ಸೂಕ್ತ ಸುಧಾರಿತ ಸಂರಚನಾ ವಿನ್ಯಾಸಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

## ಕಲಿಕೆ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠದ ನಂತರ, ನೀವು:
- ಅಭಿವೃದ್ಧಿ ಕಾರ್ಯವಿಧಾನಗಳಿಗೆ ಅಜ್ ಡಿಯನ್ನು ಮೆರೆಯುವಂತೆ ಸಂರಚಿಸುವುದು
- ಮತ್ತು ಬಹು ವಿಭಾಗೀಕರಣ ಪರಿಸರಗಳನ್ನು ಸಿದ್ಧಪಡಿಸಿ ನಿರ್ವಹಿಸುವುದು
- ಭದ್ರವಾದ ಸಂರಚನಾ ನಿರ್ವಹಣಾ ಅಭ್ಯಾಸಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
- ಸಂರಚನೆಗೆ ಸಂಬಂಧಿಸಿದ ಸಮಸ್ಯೆಗಳನ್ನು ಪತ್ತೆಹಚ್ಚುವ ಮೂಲಕ ಪರಿಹರಿಸುವುದು
- ನಿಮ್ಮ ಸಂಸ್ಥೆಯ ನಿರ್ದಿಷ್ಟ ಅಗತ್ಯಗಳಿಗೆ ತಕ್ಕಂತೆ ಅಜ್ ಡಿಯ ವರ್ತನೆಗಳನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ ಅಜೂರ್ ಡೆವಲಪರ್ CLI ಸಂರಚನೆಯನ್ನು ಸುಗಮ ಮತ್ತು ಪರಿಣಾಮಕಾರಿಯಾದ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ ಮತ್ತು ವಿಭಾಗೀಕರಣ ಕಾರ್ಯವಿಧಾನಗಳಿಗಾಗಿ ಹೇಗೆ ಮಾಡಬೇಕೆಂದರ ಬಗ್ಗೆ ವಿವರಿಸಿದೆ.

## ಅಜ್ ಡಿ ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ AI ಏಜೆಂಟುಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

ನೀವು AI ಏಜೆಂಟ್‌ಗಳ ಬಗ್ಗೆ ಹೊಸದಾಗಿ ಇದ್ದರೆ, ಅಜ್ ಡಿ ಪ್ರಪಂಚದಲ್ಲಿ ಅವುಗಳನ್ನು ಹೇಗೆ ನೋಡಿಕೊಳ್ಳಬೇಕು ಎಂಬ ಸರಳ ರೀತಿಯ ವಿವರಣೆ.

### ಏಜೆಂಟ್ ಎಂದರೆ ಏನು?

ಏಜೆಂಟ್ ಎಂದು ತೃಟಿಸುವುದು ಒಂದು ಸಾಫ್ಟ್‌ವೇರ್ ಭಾಗವಾಗಿದ್ದು ಅದು ವಿನಂತಿಯನ್ನು ಸ್ವೀಕರಿಸಿ, ಅದನ್ನು ವಿಶ್ಲೇಷಿಸಿ, ಕ್ರಮ ಕೈಗೊಳ್ಳುತ್ತದೆ — ಸಾಮಾನ್ಯವಾಗಿ AI ಮಾದರಿಯನ್ನು ಕರೆಸುವುದು, ಡೇಟಾವನ್ನು ಹುಡುಕುವುದು ಅಥವಾ ಇತರ ಸೇವೆಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳುವುದು. ಅಜ್ ಡಿ ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ, ಏಜೆಂಟ್ ನಿಮ್ಮ ವೆಬ್ ಫ್ರಂಟ್‌ಎಂಡ್ ಅಥವಾ API ಬ್ಯಾಕ್‌ಎಂಡ್ ಜೊತೆಗೆ ಒಂದು **ಸೇವೆಯಾಗಿದ್ದು**.

### ಏಜೆಂಟ್‌ಗಳು ಅಜ್ ಡಿ ಪ್ರಾಜೆಕ್ಟಿನ ರಚನೆಗೆ ಹೊಂದಿಕೊಳ್ಳುವುದು

ಅಜ್ ಡಿ ಪ್ರಾಜೆಕ್ಟ್ ಮೂವರು ಪದರಗಳಿಂದ ರೂಪುಗೊಂಡಿದೆ: **ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್**, **ಕೋಡ್**, ಮತ್ತು **ಸಂರಚನೆ**. ಏಜೆಂಟ್‌ಗಳು ಈ ಪದರಗಳಲ್ಲಿ ಯಾವುದೇ ಇತರೆ ಸೇವೆಯಂತೆ ಸೆರೆಹೊರಕೊಳ್ಳುತ್ತವೆ:

| ಪದರ | ಷರತ್ತು: ಸಾಮಾನ್ಯ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಏನು ಮಾಡುತ್ತದೆ | ಏಜೆಂಟ್‌ಗೆ ಏನು ಮಾಡುತ್ತದೆ |
|-------|-------------------------------------|---------------------------|
| **ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್** (`infra/`) | ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಮತ್ತು ಡೇಟಾಬೇಸ್ ಒದಗಿಸು | AI ಮಾದರಿ ತುದಿ, ಹುಡುಕಾಟ ಸೂಚ್ಯಂಕ ಅಥವಾ ಏಜೆಂಟ್ ಹೋಸ್ಟ್ ಒದಗಿಸು |
| **ಕೋಡ್** (`src/`) | ನಿಮ್ಮ ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು API ಮೂಲ ಕೋಡ್ | ನಿಮ್ಮ ಏಜೆಂಟ್ ನಿಯಮಗಳು ಮತ್ತು ಪ್ರಾಂಪ್ಟ್ ವ್ಯಾಖ್ಯಾನಗಳು ಇವೆ |
| **ಸಂರಚನೆ** (`azure.yaml`) | ನಿಮ್ಮ ಸೇವೆಗಳು ಮತ್ತು ಅವುಗಳ ಹೋಸ್ಟಿಂಗ್ ಗುರಿಗಳು | ಏಜೆಂಟ್ ಅನ್ನು ಸೇವೆಯಾಗಿ ಪುರಸ್ಕರಿಸಿ ಅದರ ಕೋಡ್ ಮತ್ತು ಹೋಸ್ಟ್ ಸೂಚಿಸುವುದು |

### `azure.yaml`ನ ಪಾತ್ರ

ನೀವು ಈಗಾಗಲೇ ಹರಟಿಸಬೇಕಾಗಿಲ್ಲ. ಸಿಂಧಾಂತಿಕವಾಗಿ, `azure.yaml` ಫೈಲ್ ಅಜ್ ಡಿಗೆ ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಹೊಂದಿರುವ ಸೇವೆಗಳ ಪಟ್ಟಿಯಾಗಿದೆ ಮತ್ತು ಅದರ ಕೋಡ್ ಎಲ್ಲಿದೆ ಎಂದು ತಿಳಿಸುವುದು.

ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ AI ಏಜೆಂಟ್ ಸೇರಿಸಿದಾಗ, `azure.yaml` ಆ ಏಜೆಂಟ್ ಅನ್ನು ಸೇವೆಯಾಗಿ ಪಟ್ಟಿಮಾಡುತ್ತದೆ. ಅಜ್ ಡಿ ನಿರ್ದಿಷ್ಟವಾಗಿ ಸರಿಯಾದ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಮಂಜೂರು ಮಾಡುತ್ತದೆ (ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮಾದರಿ ತುದಿ ಅಥವಾ ಏಜೆಂಟ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡಲಾದ ಕಂಟೈನರ್ ಅಪ್ ಮುಂತಾದವು) ಮತ್ತು ನಿಮ್ಮ ಏಜೆಂಟ್ ಕೋಡ್ ಅನ್ನು ವಿಭಾಗಿಸುತ್ತದೆ — ಇದು ವೆಬ್ ಅಪ್ ಅಥವಾ API ಗೆ ಆಗುವಂತೆ.

ಇದು ಮೂಲತಃ ಹೊಸದಾಗಿ ಕಲಿಯಬೇಕಾದುದಿಲ್ಲ ಎಂಬುದನ್ನು ಸೂಚಿಸುತ್ತದೆ. ನೀವು ನಮೂದಿಸಿದಂತೆ, ಅಜ್ ಡಿ ವೆಬ್ ಸೇವೆ ಅಥವಾ ಏಜೆಂಟ್ ಅನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುತ್ತದೆ ಎಂದು ನೀವು ಈಗಾಗಲೇ ಅರಿತಿದ್ದೀರಾ.

## ಸಂರಚನಾ ಹಿರಾರ್ಕಿ

ಅಜ್ ಡಿ ಹಿರಾರ್ಕಿಕಲ್ (ಹರಿವು ಕಂಡುಹಿಡಿದ) ಸಂರಚನಾ ವ್ಯವಸ್ಥೆಯನ್ನು ಬಳಸುತ್ತದೆ:
1. **ಕಮಾಂಡ್-ಲೈನ್ ಧ್ವಜಗಳು** (ಅತ್ಯುಚ್ಚ ಪ್ರಾಮುಖ್ಯತೆ)
2. **ಪರಿಸರ ಚರಗಳು**
3. **ಸ್ಥಳೀಯ ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ** (`.azd/config.json`)
4. **ಜಾಗತಿಕ ಬಳಕೆದಾರ ಸಂರಚನೆ** (`~/.azd/config.json`)
5. **ಪೂರ್ವನಿರ್ಧಾರಿತ ಬೆಲೆಗಳು** (ಕಡಿಮೆ ಅಗ್ರತೆ)

## ಜಾಗತಿಕ ಸಂರಚನೆ

### ಜಾಗತಿಕ ಪೂರ್ವನಿರ್ಧಾರಗಳನ್ನು ಹೊಂದಿಸುವುದು
```bash
# ಡಿಫಾಲ್ಟ್ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ಡಿಫಾಲ್ಟ್ ಸ್ಥಳವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.location "eastus2"

# ಡಿಫಾಲ್ಟ್ ರಿಸೋರ್ಸ್ ಗುಂಪು ಹೆಸರಿನ ಪದ್ಧತಿಯನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ಎಲ್ಲಾ ಗ್ಲೋಬಲ್ ಕಾನ್ಫಿಗರೇಷನ್ ಅನ್ನು ದರ್ಶನ ಮಾಡಿ
azd config show

# ಒಂದು ಕಾನ್ಫಿಗರೇಷನ್ ಅನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location
```

### ಸಾಮಾನ್ಯ ಜಾಗತಿಕ ಸೆಟ್ಟಿಂಗ್ಸ್
```bash
# ಅಭಿವೃದ್ಧಿ ಮೆಚ್ಚುಗೆಗಳು
azd config set alpha.enable true                    # ಆಲ್ಫಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set telemetry.enabled false             # ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರೀಯಗೊಳಿಸಿ
azd config set output.format json                  # ಔಟ್‌ಪುಟ್ ರೂಪವನ್ನು ಹೊಂದಿಸಿ

# ಸುರಕ್ಷತಾ ಹೊಂದಾಣಿಕೆಗಳು
azd config set auth.useAzureCliCredential true     # ಪ್ರಾಮಾಣೀಕರಣಕ್ಕಾಗಿ ಏಜ್ಯೂರ್ CLI ಬಳಸಿ
azd config set tls.insecure false                  # TLS ಪರಿಶೀಲನೆಯನ್ನು ಜಾರಿಗೊಳಿಸಿ

# ಕಾರ್ಯಕ್ಷಮತೆಯ ಕುಳಿತೊಕ್ಕು
azd config set provision.parallelism 5             # ಸಮಾಂತರ ಸಂಪನ್ಮೂಲ ರಚನೆ
azd config set deploy.timeout 30m                  # ನಿಯೋಜನೆ ಸಮಯ ಮಿತಿ
```

## 🏗️ ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ

### azure.yaml ರಚನೆ
`azure.yaml` ಫೈಲ್ ನಿಮ್ಮ ಅಜ್ ಡಿ ಪ್ರಾಜೆಕ್ಟ್‌ನ ಹೃದಯವಾಗಿದೆ:

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

### ಸೇವೆಯ ಸಂರಚನಾ ಆಯ್ಕೆಗಳು

#### ಹೋಸ್ಟ್ ಪ್ರಕಾರಗಳು
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

#### ಭಾಷಾ-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್ಸ್
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

## 🌟 ಪರಿಸರ ನಿರ್ವಹಣೆ

### ಪರಿಸರಗಳನ್ನು ರಚಿಸುವುದು
```bash
# ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new development

# ನಿರ್ದಿಷ್ಟ ಸ್ಥಳದೊಂದಿಗೆ ರಚಿಸಿ
azd env new staging --location "westus2"

# ಟೆಂಪ್ಲೇಟಿನಿಂದ ರಚಿಸಿ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ಪರಿಸರ ಸಂರಚನೆ
ಪ್ರತಿ ಪರಿಸರ ತಮ್ಮದೇ ಸಂರಚನೆಯನ್ನು `.azure/<env-name>/config.json` ನಲ್ಲಿ ಹೊಂದಿರುತ್ತದೆ:

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

### ಪರಿಸರ ಚರಗಳು
```bash
# ಪರಿಸರ-ವಿಶೇಷ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values

# ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ಪರಿಸರ ಚರವನ್ನು ತೆಗೆದುಹಾಕಿ
azd env unset DEBUG

# ತೆಗೆದುಹಾಕುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep DEBUG
# (ಯಾವುದೂ ವಾಪಸು ಸಿಗಬಾರದು)
```

### ಪರಿಸರ ಟೆಂಪ್ಲೇಟುಗಳು
ಸ್ಥಿರ ಪರಿಸರ ಹೊಂದಿಸುವಿಗಾಗಿ `.azure/env.template` ರಚಿಸಿ:
```bash
# ಅಗತ್ಯದ ಚರಗಳು
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ಅಪ್ಲಿಕೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ಐಚ್ಛಿಕ ಅಭಿವೃದ್ಧಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ಪ್ರಮಾಣೀಕರಣ ಸಂರಚನೆ

### ಅಜೂರ್ CLI ಏಕರೂಪ
```bash
# ಆಜೂರ್ CLI ಕ್ರೆಡೆಂಶಿಯಲ್ಸ್ ಬಳಸಿ (ಡೀಫಾಲ್ಟ್)
azd config set auth.useAzureCliCredential true

# ನಿರ್ದಿಷ್ಟ ಟೆನಂಟ್‌ನೊಂದಿಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login --tenant <tenant-id>

# ಡೀಫಾಲ್ಟ್ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್ ಸೆಟ್ ಮಾಡಿ
az account set --subscription <subscription-id>
```

### ಸೇವಾ ಪ್ರಿನ್‌ಸಿಪಲ್ ಪ್ರಮಾಣೀಕರಣ
CI/CD ಪೈಪ್ಲೈನ್ಗಳಿಗಾಗಿ:
```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ಅಥವಾ ನೇರವಾಗಿ ಸಂರಚಿಸಿ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ವ್ಯವಸ್ಥಾಪಿತ ಐಡೆಂಟిటీ
ಅಜೂರ್-ಹೋಸ್ಟ್ ಮಾಡಿದ ಪರಿಸರಗಳಿಗೆ:
```bash
# ನಿರ್ವಹಿಸಲಾದ ಗುರುತು ಪರಿಶೀಲನೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಸಂರಚನೆ

### ಬೈಸೆಪ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು
`infra/main.parameters.json` ನಲ್ಲಿ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ:
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

### ಟೆರ್‌ರಾಫಾರ್ಮ್ ಸಂರಚನೆ
ಟೆರ್‌ರಾಫಾರ್ಮ್ ಪ್ರಾಜೆಕ್ಟ್‌ಗಳಿಗೆ, `infra/terraform.tfvars` ನಲ್ಲಿ ಸಂರಚಿಸಿ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ವಿಭಾಗೀಕರಣ ಸಂರಚನೆ

### ನಿರ್ಮಾಣ ಸಂರಚನೆ
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

### ಡೋಕರ್ ಸಂರಚನೆ
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
ಉದಾಹರಣೆಯ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ಸುಧಾರಿತ ಸಂರಚನೆ

### ಕಸ್ಟಮ್ ಸಂಪನ್ಮೂಲ ಹೆಸರುಕರಣ
```bash
# ಹೆಸರು ನೀಡುವ ನಿಯಮಗಳನ್ನು ನಿಗದಿ ಮಾಡಿ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ಜಾಲ ಸಂರಚನೆ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ಗಮನವ DEFAULT ನಿರ್ದೇಶನ
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

## 🎯 ಪರಿಸರ ಸ್ಪೆಸಿಫಿಕ್ ಸಂರಚನೆಗಳು

### ಅಭಿವೃದ್ಧಿ ಪರಿಸರ
```bash
# .azure/ವಿಕಾಸ/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ಉತ್ಪಾದನಾ ಪರಿಸರ
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ಸಂರಚನೆ ಮಾನ್ಯತೆ

### ಸಂರಚನೆ ಪರಿಶೀಲನೆ
```bash
# ಸಂರಚನಾ ವಾಕ್ಯರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd config validate

# ಪರಿಸರ ಚರಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
azd env get-values

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd provision --dry-run
```

### ಸಂರಚನಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
`scripts/` ನಲ್ಲಿ ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ರಚಿಸಿ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ಅಗತ್ಯವಿರುವ ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ವ್ಯಾಕರಣವನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಪರಿಸರ ಚರಗಳನ್ನು ಬಳಸಿ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ಸಂರಚನಾ ಫೈಲ್‌ಗಳನ್ನು ವ್ಯವಸ್ಥಿತಗೊಳಿಸಿ
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

### 3. ಆವೃತ್ತಿ ನಿಯಂತ್ರಣ ಪರಿಗಣನೆಗಳು
```bash
# .gitignore
.azure/*/config.json         # ಪರಿಸರ ಸಂರಚನೆಗಳು (ಸಂಪನ್ಮೂಲ IDಗಳನ್ನು ಹೊಂದಿರಬಹುದು)
.azure/*/.env               # ಪರಿಸರ ಚರಗಳು (ರಹಸ್ಯಗಳನ್ನು ಹೊಂದಿರಬಹುದು)
.env                        # ಸ್ಥಳೀಯ ಪರಿಸರ ಫೈಲ್
```

### 4. ಸಂರಚನಾ ಡಾಕ್ಯುಮೆಂಟೇಷನ್
ನಿಮ್ಮ ಸಂರಚನೆಯನ್ನು `CONFIG.md` ನಲ್ಲಿ ದಾಖಲಿಸಿ:
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

## 🎯 ಕೈಗಾರಿಕೆ ಅಭ್ಯಾಸವುಳ್ಳ ವ್ಯಾಯಾಮಗಳು

### ವ್ಯಾಯಾಮ 1: ಬಹು-ಪರಿಸರ ಸಂರಚನೆ (15 ನಿಮಿಷ)

**ಗುರಿ**: ವಿಭಿನ್ನ ಸೆಟ್ಟಿಂಗ್ಸ್ ಹೊಂದಿರುವ ಮೂರು ಪರಿಸರಗಳನ್ನು ರಚಿಸಿ ಮತ್ತು ಸಂರಚಿಸಿ

```bash
# ಡೆವಲಪ್ಮೆಂಟ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ಉತ್ಪಾದನಾ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ಪ್ರತಿ ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಮೂರು ಪರಿಸರಗಳು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ಪ್ರತೀ ಪರಿಸರವು ವಿಶಿಷ್ಟ ಸಂರಚನೆಯಿದೆ
- [ ] ಯಾವುದೇ ದೋಷ ಇಲ್ಲದೆ ಪರಿಸರಗಳ ನಡುವೆ ಬದಲಾಯಿಸಬಹುದು
- [ ] `azd env list` ಎಲ್ಲಾ ಮೂರು ಪರಿಸರಗಳನ್ನು ತೋರಿಸುತ್ತದೆ

### ವ್ಯಾಯಾಮ 2: ರಹಸ್ಯ ನಿರ್ವಹಣೆ (10 ನಿಮಿಷ)

**ಗುರಿ**: ಸಂವೇದನಾಶೀಲ ಡೇಟಾ ಹೊಂದಿರುವ ಭದ್ರ ಸಂರಚನೆಯಲ್ಲಿ ಅಭ್ಯಾಸಮಾಡಿ

```bash
# ರಹಸ್ಯಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ (ಔಟ್ಪುಟ್‌ನಲ್ಲಿ ತೋರಿಸಲಾಗುವುದಿಲ್ಲ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ರಹಸ್ಯವಲ್ಲದ ಕಾನ್ಫಿಗ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ಪರಿಸರವನ್ನು ನೋಡಿ (ರಹಸ್ಯಗಳನ್ನು ರೆಡ್ಯಾಕ್ಟ್ ಮಾಡಬೇಕು)
azd env get-values

# ರಹಸ್ಯಗಳು ಸಂಗ್ರಹಿಸಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get DB_PASSWORD  # ನಿಜವಾದ ಮೌಲ್ಯವನ್ನು ತೋರಿಸಬೇಕು
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ರಹಸ್ಯಗಳನ್ನು ಟರ್ಮಿನಲ್‌ನಲ್ಲಿ ತೋರಿಸದಂತೆ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ
- [ ] `azd env get-values` ರೆಡಾಕ್ಟ್ ಮಾಡಿದ ರಹಸ್ಯಗಳನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] ವೈಯಕ್ತಿಕ `azd env get <SECRET_NAME>` ನಿಜವಾದ ಮೌಲ್ಯವನ್ನು ಪಡೆಯುತ್ತದೆ

## ಮುಂದಿನ ಹಂತಗಳು

- [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md) - ಪ್ರಾಯೋಗಿಕವಾಗಿ ಸಂರಚನೆಯನ್ನು ಅನ್ವಯಿಸಿ
- [ವಿಭಾಜನಾ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ವಿಭಾಗೀಕರಣಕ್ಕಾಗಿ ಸಂರಚನೆಯನ್ನು ಬಳಸಿ
- [ಸಂಪನ್ಮೂಲ ವಿತರಣೆ](../chapter-04-infrastructure/provisioning.md) - ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಸಂರಚನೆಗಳು

## ಉಲ್ಲೇಖಗಳು

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜೆಡಿವಿಗೆ ಆರಂಭಿಕರು](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಸಂರಚನೆ ಮತ್ತು ಪ್ರಮಾಣೀಕರಣ
- **⬅️ ಹಿಂದಿನದು**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 4: ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಆಸ್ ಕೋಡ್](../chapter-04-infrastructure/deployment-guide.md)
- **ಮುಂದಿನ ಪಾಠ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ನಿರಾಕರಣೆ**:  
ಈ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವೆಲ್ಲ ಪ್ರಯತ್ನಿಸುವುದಾದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸತ್ಯತತೆಗಳಿರಬಹುದು. ಮೌಲಿಕ ಭಾಷೆಯಲ್ಲಿ ಇರುವ ಮೂಲ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು ಅಧಿಕೃತ ಮೂಲವಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ. ಈ ಅನುವಾದ ಬಳಕೆಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪುಗ್ರಹಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥೈಸುವಿಕೆಗೆ ನಾವು ಜವಾಬ್ದಾರರಾಗಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->