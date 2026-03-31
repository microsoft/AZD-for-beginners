# ಕಾನ್ಫಿಗರೇಶನ್ ಗೈಡ್

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD - ಪ್ರಾರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಕಾನ್ಫಿಗರೇಶನ್ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ
- **⬅️ ಹಿಂದಿನ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **➡️ ಮುಂದಿನ**: [ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಗೈಡ್](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 4: ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಏಸ್ ಕೋಡ್](../chapter-04-infrastructure/deployment-guide.md)

## ಪರಿಚಯ

ಈ ವ್ಯಾಪಕ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI (azd) ಅನ್ನು ಉತ್ತಮ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ڈಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ ಕಾನ್ಫಿಗರ್ ಮಾಡುವ ಎಲ್ಲಾаспೆಕ್ಟ್‌ಗಳನ್ನು ಮುಚ್ಚುತ್ತದೆ. ನೀವು ಕಾನ್ಫಿಗರೇಶನ್ ಕ್ರಮ, ವಾತಾವರಣ ನಿರ್ವಹಣೆ, ಪ್ರಾಮಾಣೀಕರಣ ವಿಧಾನಗಳು, ಮತ್ತು ಪ್ರಯೋಗಶೀಲ ಮತ್ತು ಸುರಕ್ಷಿತ Azure ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು ಸಾಧಿಸುವ ಸುಧಾರಿತ ಕಾನ್ಫಿಗರೇಶನ್ ಮಾದರಿಗಳನ್ನು ಕುರಿತು ತಿಳಿದುಕೊಳ್ಳುವೀರಿ.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಪಾಠವು समाप्तವಾದಾಗ, ನೀವು:
- azd ಕಾನ್ಫಿಗರೇಶನ್ ಕ್ರಮವನ್ನು ನಿಪುಣವಾಗಿ ತಿಳಿದು ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪ್ರಾಥಮಿಕತೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಜಾಗತಿಕ ಮತ್ತು ಪ್ರಾಜೆಕ್ಟ್-ವಿಶೇಷ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಕಾನ್ಫಿಗರ್ ಮಾಡುವುದು
- ವಿಭಿನ್ನ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳೊಂದಿಗೆ ಬಹು ವಾತಾವರಣಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು
- ಸುರಕ್ಷಿತ ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅಧಿಕೃತೀಕರಣ ಮಾದರಿಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
- ಸಂಕೀರ್ಣ ಪರಿಸ್ಥಿತಿಗಳಿಗಾಗಿ ಸುಧಾರಿತ ಕಾನ್ಫಿಗರೇಶನ್ ಮಾದರಿಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

## ಕಲಿಕೆ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಶಕ್ತರಾಗುವಿರಿ:
- ಉತ್ತಮ ಅಭಿವೃದ್ಧಿ ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ azd ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುವುದು
- ಬಹು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವಾತಾವರಣಗಳನ್ನು ಸ್ಥಾಪಿಸಿ ನಿರ್ವಹಿಸುವುದು
- ಸುರಕ್ಷಿತ ಕಾನ್ಫಿಗರೇಶನ್ ನಿರ್ವಹಣಾ ಅಭ್ಯಾಸಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
- ಕಾನ್ಫಿಗರೇಶನ್-ಸಂಬಂಧಿತ ಸಮಸ್ಯೆಗಳನ್ನು ಡೀಪ್‌ಶೂಟ್ ಮಾಡುವುದು
- ನಿರ್ದಿಷ್ಟ ಸಂಘಟನಾ ಅಗತ್ಯಗಳಿಗಾಗಿ azd ನ ವರ್ತನೆಯನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು

ಈ ವ್ಯಾಪಕ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI (azd) ಅನ್ನು ಉತ್ತಮ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ ಕಾನ್ಫಿಗರ್ ಮಾಡುವ ಎಲ್ಲಾ aspetಗಳನ್ನೂ ಮುಚ್ಚುತ್ತದೆ.

## azd ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ AI ಏಜೆಂಟ್ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

ನೀವು AI ಏಜೆಂಟ್ಗಳಿಗೆ ಹೊಸವರಾದಲ್ಲಿ, azd ಜಗತ್ತಿನ ಒಳಗೆ ಅವುಗಳನ್ನು ಹೇಗೆ ಯೋಚಿಸಬಹುದೆಂಬುದಕ್ಕೆ ಒಂದು ಸರಳ ವಿಧಾನ ಇಲ್ಲಿದೆ.

### ಏಜೆಂಟ್ ಎಂದರೇನು?

ಏಜೆಂಟ್ ಒಂದು ಸಾಫ್ಟ್‌ವೇರ್ ಭಾಗವಾಗಿದ್ದು, ಅದು ಒಂದು ವಿನಂತಿಯನ್ನು ಪಡೆದ ನಂತರ ಅದನ್ನು ವಿಶ್ಲೇಷಿಸಿ ಕ್ರಿಯೆಗಳು ಕೈಗೊಳ್ಳುತ್ತದೆ—ಅಂದರೆ ಆಮೇಲೆ AI ಮಾದರಿಯನ್ನು ಕರೆಸಬಹುದು, ಡೇಟಾವನ್ನು ಹುಡುಕಬಹುದು, ಅಥವಾ ಇತರೆ ಸರ್ವಿಸ್‌ಗಳನ್ನು ಕರೆಸಬಹುದು. azd ಪ್ರಾಜೆಕ್ಟ್ನಲ್ಲಿ, ಏಜೆಂಟ್ ನಿಮ್ಮ ವೆಬ್ ಫ್ರಂಟ್‌ಎಂಡ್ ಅಥವಾ API ಬ್ಯಾಕ್‌ಎಂಡ್ ಎದುರು ಮತ್ತೊಂದು ಸೇವೆಯಂತೆ ಇರುತ್ತದೆ.

### ಏಜೆಂಟ್ಗಳು azd ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಗೆ ಹೇಗೆ ಫಿಟ್ ಆಗುತ್ತವೆ

azd ಪ್ರಾಜೆಕ್ಟ್ ಮೂರು ಪದರಗಳಿಂದ ಉತ್ಪಾದಿತವಾಗಿದೆ: **infrastructure**, **code**, ಮತ್ತು **configuration**. ಏಜೆಂಟ್ಗಳು ಇತರೆ ಯಾವುದೇ ಸೇವೆಯಂತೆ ಈ ಪದರಗಳಿಗೆ ಸರಿಸುಮಾರು ಸೇರುತ್ತವೆ:

| Layer | ಪರಂಪರাগত ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಇದು ಮಾಡುವುದು | ಏಜೆಂಟ್‌ಗೆ ಇದು ಮಾಡುವುದು |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | ವೆಬ್ ಅಪ್ ಮತ್ತು ಡೇಟಾಬೇಸ್ ಅನ್ನು ಪ್ರೊವೈಡ್ ಮಾಡುತ್ತದೆ | ಒಂದು AI ಮಾದರಿ ಎಂಡ್‌ಪಾಯಿಂಟ್, ಹುಡುಕಾಟ ಇಂಡೆಕ್ಸ್, ಅಥವಾ ಏಜೆಂಟ್ ಹೋಸ್ಟ್ ಅನ್ನು ಪ್ರೋವೈಡ್ ಮಾಡುತ್ತದೆ |
| **Code** (`src/`) | ನಿಮ್ಮ ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು API ಮೂಲ ಕೋಡ್ ಅನ್ನು ಹೊಂದಿರುತ್ತದೆ | ನಿಮ್ಮ ಏಜೆಂಟ್ ಲಾಜಿಕ್ ಮತ್ತು ಪ್ರಾಂಪ್ಟ್ ವ್ಯಾಖ್ಯಾನಗಳನ್ನು ಹೊಂದಿರುತ್ತದೆ |
| **Configuration** (`azure.yaml`) | ನಿಮ್ಮ ಸೇವೆಗಳನ್ನು ಮತ್ತು ಅವುಗಳ ಹೋಸ್ಟಿಂಗ್ ಗುರಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡುತ್ತದೆ | ಏಜೆಂಟ್ ಅನ್ನು ಒಂದು ಸೇವೆ ಎಂದು ಪಟ್ಟಿ ಮಾಡಿ, ಅದರ ಕೋಡ್ ಮತ್ತು ಹೋಸ್ಟ್ ಕಡೆಗೆ ಸೂಚಿಸುತ್ತದೆ |

### `azure.yaml` ನ ಪಾತ್ರ

ನೀವು ಈಗಿನಲ್ಲೇ ಸಿಂಟ್ಯಾಕ್ಸ್ ಅನ್ನು ಮೆಮರೈಸ್ ಮಾಡಬೇಕಾಗಿಲ್ಲ. ತತ್ವಗ್ರಹಣವಾಗಿ, `azure.yaml` ಅದು ಫೈಲ್ ಆಗಿದ್ದು ನೀವು azd ಗೆ ಹೇಳುತ್ತಾರೆ: "ಇಗೋ ನನ್ನ ಅಪ್ಲಿಕೇಶನ್ನನ್ನು ರೂಪಿಸುವ ಸೇವೆಗಳು ಇವು, ಮತ್ತು ಅವುಗಳ ಕೋಡ್ ಅನ್ನು ಎಲ್ಲಿಂದ ಹುಡುಕಬೇಕು."

ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ AI ಏಜೆಂಟ್ ಸೇರಿದ್ದಾಗ, `azure.yaml` ಅದನ್ನು ಸೇವೆಗಳಲ್ಲಿ ಒಂದಾಗಿ ಪಟ್ಟಿ ಮಾಡುತ್ತದೆ. ನಂತರ azd ಸರಿಯಾದ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಪ್ರೊವೈಡ್ ಮಾಡಬೇಕು (ಉದಾಹರಣೆಗೆ Microsoft Foundry Models ಎಂಡ್‌ಪಾಯಿಂಟ್ ಅಥವಾ ಏಜೆಂಟ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡುವ Container App) ಮತ್ತು ನಿಮ್ಮ ಏಜೆಂಟ್ ಕೋಡ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತದೆ—ಹಾಗೆಯೇ ಅದು ವೆಬ್ ಅಪ್ ಅಥವಾ API ಗೆ ಮಾಡುವಂತೆ.

ಅಂದರೆ ಇಲ್ಲಿ ಹೊಸದೊಂದು ಮೂಲಭೂತ ಕಲಿಯುವುದೇ ಇಲ್ಲ. ನೀವು azd ಒಂದು ವೆಬ್ ಸೇವೆಯನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುತದೆಂದು ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದರೆ, ನೀವು ಇದು ಏಜೆಂಟ್ ಅನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುತ್ತದೆ ಎನ್ನುವುದನ್ನು ಈಗಾಗಲೇ ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದೀರಿ.

## ಕಾನ್ಫಿಗರೇಶನ್ ಕ್ರಮ

azd ಒಂದು ಹೈರಾರ್ಕಿಕಲ್ ಕಾನ್ಫಿಗರೇಶನ್ ಸಿಸ್ಟಮ್ ಬಳಸುತ್ತದೆ:
1. **ಕಮಾಂಡ್-ಲೈನ್ ಫ್ಲ್ಯಾಗ್‌ಗಳು** (ಅತಿಯಾದ ಪ್ರಾತ್ಯಕ್ಷತೆ)
2. **ಪರಿಸರ ವ್ಯತ್ಯಯಗಳು (Environment variables)**
3. **ಸ್ಥಳೀಯ ಪ್ರಾಜೆಕ್ಟ್ ಕಾನ್ಫಿಗರೇಶನ್** (`.azd/config.json`)
4. **ಗ್ಲೋಬಲ್ ಬಳಕೆದಾರ ಕಾನ್ಫಿಗರೇಶನ್** (`~/.azd/config.json`)
5. **ಡಿಫಾಲ್ಟ್ ಮೌಲ್ಯಗಳು** (ಕಡಿಮೆ ಪ್ರಾಥಮಿಕತೆ)

## ಜಾಗತಿಕ ಕಾನ್ಫಿಗರೇಶನ್

### ಜಾಗತಿಕ ಡಿಫಾಲ್ಟ್‌ಗಳನ್ನು ಹೊಂದಿಸುವುದು
```bash
# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಹೊಂದಿಸಿ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ಡೀಫಾಲ್ಟ್ ಸ್ಥಳವನ್ನು ಹೊಂದಿಸಿ
azd config set defaults.location "eastus2"

# ಡೀಫಾಲ್ಟ್ ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ನಾಮಕರಣ ನಿಯಮವನ್ನು ಹೊಂದಿಸಿ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ಎಲ್ಲಾ ಜಾಗತಿಕ ಸಂರಚನೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd config list

# ಒಂದು ಸಂರಚನೆಯನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location
```

### ಸಾಮಾನ್ಯ ಜಾಗತಿಕ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
```bash
# ಅಭಿವಿಕಾಸ ಆಯ್ಕೆಗಳು
azd config set alpha.enable true                    # ಅಲ್ಫಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set telemetry.enabled false             # ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
azd config set output.format json                  # ಔಟ್‌ಪುಟ್ ಸ್ವರೂಪವನ್ನು ಹೊಂದಿಸಿ

# ಭದ್ರತಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
azd config set auth.useAzureCliCredential true     # ಪ್ರಾಮಾಣೀಕರಣಕ್ಕಾಗಿ Azure CLI ಬಳಸಿ
azd config set tls.insecure false                  # TLS ಪರಿಶೀಲನೆಯನ್ನು ಜಾರಿಗೊಳಿಸಿ

# ಕಾರ್ಯಕ್ಷಮತೆ ಸುಧಾರಣೆ
azd config set provision.parallelism 5             # ಸಮಕಾಲೀನ ಸಂಪನ್ಮೂಲ ರಚನೆ
azd config set deploy.timeout 30m                  # ತೈನಾತಿ ಸಮಯ ಮಿತಿ
```

## 🏗️ ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ

### azure.yaml ರಚನೆ
`azure.yaml` ಫೈಲ್ ನಿಮ್ಮ azd ಪ್ರಾಜೆಕ್ಟ್‌ನ ಹಾರ್ಟ್ ಆಗಿದೆ:

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

### ಸೇವೆ ಕಾನ್ಫಿಗರೇಶನ್ ಆಯ್ಕೆಗಳು

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

#### ಭಾಷಾ-ವಿಶೇಷ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
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

## 🌟 ವಾತಾವರಣ ನಿರ್ವಹಣೆ

### ವಾತಾವರಣಗಳನ್ನು ರಚಿಸುವುದು
```bash
# ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new development

# ನಿರ್ದಿಷ್ಟ ಸ್ಥಳದೊಂದಿಗೆ ರಚಿಸಿ
azd env new staging --location "westus2"

# ಟೆಂಪ್ಲೇಟಿನಿಂದ ರಚಿಸಿ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ವಾತಾವರಣ ಕಾನ್ಫಿಗರೇಶನ್
ಪ್ರತಿ ವಾತಾವರಣಕ್ಕೆ ಅದರದೇ ಕಾನ್ಫಿಗರೇಶನ್ `.azure/<env-name>/config.json` ನಲ್ಲಿ ಇರುತ್ತದೆ:

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

### ವಾತಾವರಣ ವ್ಯತ್ಯಯಗಳು
```bash
# ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ಪರಿಸರ ಚರಗಳನ್ನು ನೋಡಿ
azd env get-values

# ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ಪರಿಸರ ಚರವನ್ನು ತೆಗೆದುಹಾಕಿ
azd env unset DEBUG

# ತೆಗೆಯುವಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep DEBUG
# (ಏನನ್ನೂ ಮರಳಿ ನೀಡಬಾರದು)
```

### ವಾತಾವರಣ ಟೆಂಪ್ಲೇಟ್ಗಳು
ಸಮರ nenvironment ಸ್ಥಾಪನೆಯಿಗಾಗಿ `.azure/env.template` ರಚಿಸಿ:
```bash
# ಆವಶ್ಯಕ ಚರಗಳು
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ಅನ್ವಯಿಕೆಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ಐಚ್ಛಿಕ ಅಭಿವೃದ್ಧಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ಪ್ರಾಮಾಣೀಕರಣ ಸಂರಚನೆ

### Azure CLI ಇಂಟಿಗ್ರೇಷನ್
```bash
# Azure CLI ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ಬಳಸಿ (ಡೀಫಾಲ್ಟ್)
azd config set auth.useAzureCliCredential true

# ನಿಗದಿತ ಟೆನ್ಯಾಂಟ್‌ನೊಂದಿಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login --tenant <tenant-id>

# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಹೊಂದಿಸಿ
az account set --subscription <subscription-id>
```

### ಸರ್ವಿಸ್ ಪ್ರಿಂಸಿಪಲ್ ಪ್ರಾಮಾಣೀಕರಣ
CI/CD ಪೈಪ್ಲೈನ್‌ಗಳಿಗೆ:
```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ಅಥವಾ ನೇರವಾಗಿ ಸಂರಚಿಸಿ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ಮ್ಯಾನೇಜ್ಡ್ ಐಡೆಂಟಿಟಿ
Azure-ಹೋಸ್ಟ್ ಮಾಡಿದ ವಾತಾವರಣಗಳಿಗಾಗಿ:
```bash
# ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಸಂರಚನೆ

### Bicep ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು
ಇನ್‌ಫ್ರಾ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು `infra/main.parameters.json` ನಲ್ಲಿ ಕಾನ್ಫಿಗರ್ ಮಾಡಿ:
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

### Terraform ಕಾನ್ಫಿಗರೇಶನ್
Terraform ಪ್ರಾಜೆಕ್ಟ್‌ಗಳಿಗಾಗಿ, `infra/terraform.tfvars` ನಲ್ಲಿ ಕಾನ್ಫಿಗರ್ ಮಾಡಿ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾನ್ಫಿಗರೇಶನ್

### ಬಿಲ್ಡ್ ಕಾನ್ಫಿಗರೇಶನ್
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

### Docker ಕಾನ್ಫಿಗರೇಶನ್
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
ಉದಾಹರಣೆ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ಸುಧಾರಿತ ಕಾನ್ಫಿಗರೇಶನ್

### ಕಸ್ಟಮ್ ರಿಸೋರ್ಸ್ ನೇಮಿಂಗ್
```bash
# ಹೆಸರಿನ ನಿಯಮಗಳನ್ನು ಹೊಂದಿಸಿ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ನೆಟ್ವರ್ಕ್ ಕಾನ್ಫಿಗರೇಶನ್
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ಮಾನಿಟರಿಂಗ್ ಕಾನ್ಫಿಗರೇಶನ್
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

## 🎯 ವಾತಾವರಣ-ವಿಶೇಷ ಸಂರಚನೆಗಳು

### ಡೆವಲಪ್‌ಮೆಂಟ್ ವಾತಾವರಣ
```bash
# .azure/ಡೆವಲಪ್‌ಮೆಂಟ್/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ಸ್ಟೇಜಿಂಗ್ ವಾತಾವರಣ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ಉತ್ಪಾದನಾ ವಾತಾವರಣ
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ಕಾನ್ಫಿಗರೇಶನ್ ಮಾನ್ಯತೆ

### ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
```bash
# ಸಂರಚನೆಯ ವ್ಯಾಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
azd config validate

# ಪರಿಸರ ಚರಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
azd env get-values

# ಅಧೋಸೌಕರ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
azd provision --dry-run
```

### ಕಾನ್ಫಿಗರೇಶನ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
`scripts/` ನಲ್ಲಿ ಮಾನ್ಯತಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ರಚಿಸಿ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ಅಗತ್ಯವಾದ ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ನ ವ್ಯಾಕರಣವನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಪರಿಸರ ವ್ಯತ್ಯಯಗಳನ್ನು ಬಳಸಿ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ಕಾನ್ಫಿಗರೇಶನ್ ಫೈಲ್‌ಗಳನ್ನು ಆಯೋಜಿಸು
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

### 3. ವರ್ಸನ್ ಕಂಟ್ರೋಲ್ ಪರಿಗಣನೆಗಳು
```bash
# .gitignore
.azure/*/config.json         # ಪರಿಸರ ಸಂರಚನೆಗಳು (ಸಂಪನ್ಮೂಲ IDಗಳನ್ನು ಒಳಗೊಂಡಿವೆ)
.azure/*/.env               # ಪರಿಸರ ಚरಗಳು (ರಹಸ್ಯಗಳನ್ನು ಹೊಂದಿರಬಹುದು)
.env                        # ಸ್ಥಳೀಯ ಪರಿಸರ ಕಡತ
```

### 4. ಕಾನ್ಫಿಗರೇಶನ್ ಡಾಕ್ಯುಮೆಂಟೇಶನ್
ನಿಮ್ಮ ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು `CONFIG.md` ನಲ್ಲಿ ಡಾಕ್ಯುಮೆಂಟ್ ಮಾಡಿ:
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

## 🎯 ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸ ಪ್ರಾಕ್ಟೀಸ್

### ವ್ಯಾಯಾಮ 1: ಬಹು-ವಾತಾವರಣ ಕಾನ್ಫಿಗರೇಶನ್ (15 ನಿಮಿಷ)

**ಗುರಿ**: ವಿಭಿನ್ನ ಸೆಟ್ಟಿಂಗ್‌ಗಳೊಂದಿಗೆ ಮೂರು ವಾತಾವರಣಗಳನ್ನು ರಚಿಸಿ ಮತ್ತು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ

```bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ರಚಿಸಿ
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
- [ ] ಮೂರು ವಾತಾವರಣಗಳು ಯಶಸ್ವಿಯಾಗಿ ರಚಿತವಾಗಿರಬೇಕು
- [ ] ಪ್ರತಿ ವಾತಾವರಣಕ್ಕೆ ವಿಭಿನ್ನ ಕಾನ್ಫಿಗರೇಶನ್ ಇರಬೇಕು
- [ ] ತೊಂದರೆಗಳಿಲ್ಲದೆ ವಾತಾವರಣಗಳ ನಡುವೆ மாறಬಹುದಾಗಿರಬೇಕು
- [ ] `azd env list` ಎಲ್ಲಾ ಮೂರು ವಾತಾವರಣಗಳನ್ನು ತೋರಿಸುತ್ತದೆ

### ವ್ಯಾಯಾಮ 2: ರಹಸ್ಯ ನಿರ್ವಹಣೆ (10 ನಿಮಿಷ)

**ಗುರಿ**: ಸಂವೇದನಶೀಲ ಡೇಟಾೊಂದಿಗೆ ಸುರಕ್ಷಿತ ಕಾನ್ಫಿಗರೇಶನ್ ಅಭ್ಯಾಸವನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ

```bash
# ರಹಸ್ಯಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ (ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ಪ್ರದರ್ಶಿಸಲಾಗುವುದಿಲ್ಲ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ರಹಸ್ಯವಲ್ಲದ ಸಂರಚನೆಯನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ಪರಿಸರವನ್ನು ವೀಕ್ಷಿಸಿ (ರಹಸ್ಯಗಳನ್ನು ಮರೆಮಾಚಬೇಕು)
azd env get-values

# ರಹಸ್ಯಗಳು ಸಂಗ್ರಹವಾಗಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get DB_PASSWORD  # ವಾಸ್ತವಿಕ ಮೌಲ್ಯವನ್ನು ತೋರಿಸಬೇಕು
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಟರ್ಮಿನಲ್‌ನಲ್ಲಿ ಪ್ರದರ್ಶಿಸಲಾಗದೆ ರಹಸ್ಯಗಳು ಸಂಗ್ರಹಿತವಾಗಿರಬೇಕು
- [ ] `azd env get-values` ರಹಸ್ಯಗಳನ್ನು ರೆಡ್ಯಾಕ್ಟ್ ಮಾಡಿಹೊಂದುತ್ತದೆ
- [ ] ವೈಯಕ್ತಿಕ `azd env get <SECRET_NAME>` ನಿಜವಾದ ಮೌಲ್ಯವನ್ನು ಪಡೆದುಕೊಳ್ಳುತ್ತದೆ

## ಮುಂದಿನ ಹಂತಗಳು

- [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md) - ನೈಪುಣ್ಯಕ್ಕಾಗಿ ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಅನ್ವಯಿಸಿ
- [ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಗೈಡ್](../chapter-04-infrastructure/deployment-guide.md) - ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗೆ ಕಾನ್ಫಿಗರೇಶನ್ ಬಳಸಿ
- [ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪ್ರೊವಿಷನ್ ಮಾಡುವುದು](../chapter-04-infrastructure/provisioning.md) - ಉತ್ಪಾದನಾ-ತಯಾರಿನ ಕಾನ್ಫಿಗರೇಶನ್ಗಳು

## ಉಲ್ಲೇಖಗಳು

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD - ಪ್ರಾರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಕಾನ್ಫಿಗರೇಶನ್ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ
- **⬅️ ಹಿಂದಿನ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 4: ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಏಸ್ ಕೋಡ್](../chapter-04-infrastructure/deployment-guide.md)
- **ಮುಂದಿನ ಪಾಠ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮರ್ಪಕತೆಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಗ್ರಹಿಕೆಗಳು ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರು ಅಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->