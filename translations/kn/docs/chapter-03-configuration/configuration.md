# ಸಂರಚನಾ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಸಂರಚನೆ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## ಪರಿಚಯ

ಈ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ನಿಯೋಜನೆ ವರ್ಕ್ಫ್ಲೋಗಳಿಗಾಗಿ Azure Developer CLI ಅನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡುವ ಎಲ್ಲಾ ಆಯಾಮಗಳನ್ನು ಮಾಹಿತಿಪಡಿಸುತ್ತದೆ. ನೀವು ಸಂರಚನಾ ಹೈರಾರ್ಕಿ, ಪರಿಸರ ನಿರ್ವಹಣೆ, ಪ್ರಾಮಾಣೀಕರಣ ವಿಧಾನಗಳು, ಮತ್ತು ಸುರಕ್ಷಿತ ಮತ್ತು ಪರಿಣಾಮಕಾರಿಯಾದ Azure ನಿಯೋಜನೆಗಳನ್ನು ಸಾಧ್ಯ ಮಾಡಿಸುವ ಉನ್ನತ ಸಂರಚನಾ ಮಾದರಿಗಳನ್ನು ಅಧ್ಯಯನ ಮಾಡುತ್ತೀರಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಪಾಠದ ಕೊನೆಯಲ್ಲಿ ನೀವು:
- azd ಸಂರಚನಾ ಹೈರಾರ್ಕಿಯನ್ನು ನಿಪುಣರಾಗಿರಬೇಕು ಮತ್ತು ಸೆಟ್ಟಿಂಗ್ಗಳನ್ನು ಹೇಗೆ ಆದ್ಯತೆಯಾದರೂ ತಿಳಿಯಬೇಕು
- ಗ್ಲೋಬಲ್ ಮತ್ತು ಪ್ರಾಜೆಕ್ಟ್-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಸಂರಚಿಸಬೇಕು
- ವಿಭಿನ್ನ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಅನೇಕ ವಾತಾವರಣಗಳನ್ನು ನಿರ್ವಹಿಸಬೇಕು
- ಸುರಕ್ಷಿತ ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ಮಾದರಿಗಳನ್ನು ಜಾರಿಗೆ ತರುವಿರಿ
- ಸಂಕೀರ್ಣ ಸಂದರ್ಭಗಳಿಗೆ ಉನ್ನತ ಸಂರಚನಾ ಮಾದರಿಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠವನ್ನು ಸಂಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಮರ್ಥ್ಯ ಹೊಂದಿರುತ್ತೀರಿ:
- azd ಅನ್ನು ಸಾಧನೆಯುಳ್ಳ ಅಭಿವೃದ್ಧಿ ವರ್ಕ್ಫ್ಲೋಗಳಿಗಾಗಿ ಸಂರಚಿಸಲು
- ಬಹು ನಿಯೋಜನೆ ವಾತಾವರಣಗಳನ್ನು ಸ್ಥಾಪಿಸಿ ಮತ್ತು ನಿರ್ವಹಿಸಲು
- ಸುರಕ್ಷಿತ ಸಂರಚನಾ ನಿರ್ವಹಣಾ ಪಧ್ಧತಿಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
- ಸಂರಚನೆ-ಸಂಬಂಧಿತ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಲು
- ನಿರ್ದಿಷ್ಟ ಸಂಘಟನಾ ಅಗತ್ಯಗಳಿಗೆ azd ನಡೆಚಲು ಕಸ್ಟಮೈಸ್ ಮಾಡಲು

ಈ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ನಿಯೋಜನೆ ವರ್ಕ್ಫ್ಲೋಗಳಿಗಾಗಿ Azure Developer CLI ಅನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡುವ ಎಲ್ಲಾ ಆಯಾಮಗಳನ್ನು ಮಾಹಿತಿಪಡಿಸುತ್ತದೆ.

## azd ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ AI ಏಜೆಂಟ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

ನೀವು AI ಏಜೆಂಟ್‌ಗಳಿಗೆ ಹೊಸವಿದ್ದರೆ, azd ಜಗತ್ತಿನಲ್ಲಿ ಅವುಗಳನ್ನು ಹೇಗೆ ಯೋಚಿಸಬಹುದು ಎಂಬ ಸರಳ ರೀತಿಯ ವಿವರಣೆ ಇಲ್ಲಿದೆ.

### ಏಜೆಂಟ್ ಎಂದರೇನು?

ಏಜೆಂಟ್ ಒಂದು ಸೋಫ್ಟ್‌ವೇರ್ ಕಣ that can receive a request, reason about it, and take actions—often by calling an AI model, looking up data, or invoking other services. azd ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ, ಏಜೆಂಟ್ ನಿಮ್ಮ ವೆಬ್ ಫ್ರಂಟ್‌ಎಂಡ್ ಅಥವಾ API ಬ್ಯಾಕೆಂಡ್ ಜೊತೆಯಲ್ಲಿರುವ ಇನ್ನೊಂದು **ಸೇವೆ** ಮಾತ್ರ.

### ಏಜೆಂಟ್‌ಗಳು azd ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಗೆ ಹೇಗೆ ಹೊಂದಿಕೊಳ್ಳುತ್ತವೆ

azd ಪ್ರಾಜೆಕ್ಟ್ ಮೂರು ಹಂತಗಳಿಂದ ನಿರ್ಮಿತವಾಗಿದೆ: **ಒಳಸೌಕರ್ಯ**, **ಕೋಡ್**, ಮತ್ತು **ಸಂರಚನೆ**. ಏಜೆಂಟ್‌ಗಳು ಈ ಹಂತಗಳಲ್ಲಿ ಯಾವುದೇ ಬೇರೆ ಸೇವೆ ಹಾಗೆ ಸೇರಿಕೊಳ್ಳುತ್ತವೆ:

| ಮಟ್ಟ | ಸಾಂಪ್ರದಾಯಿಕ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಇದು ಮಾಡುವುದು | ಏಜೆಂಟ್‌ಗೆ ಇದು ಮಾಡುವುದು |
|-------|-------------------------------------|---------------------------|
| **ಒಳಸೌಕರ್ಯ** (`infra/`) | ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಮತ್ತು ಡೇಟಾಬೇಸ್ ಅನ್ನು ಒದಗಿಸುತ್ತದೆ | AI ಮಾದರಿ ಎಂಡ್ಪಾಯಿಂಟ್, ಶೋಧ ಸೂಚ್ಯಂಕ, ಅಥವಾ ಏಜೆಂಟ್ ಹೋಸ್ಟ್ ಅನ್ನು ಒದಗಿಸುತ್ತದೆ |
| **ಕೋಡ್** (`src/`) | ನಿಮ್ಮ ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು API ಮೂಲ ಕೋಡ್ ಅನ್ನು ಹೊಂದಿದೆ | ನಿಮ್ಮ ಏಜೆಂಟ್ ಲಾಜಿಕ್ ಮತ್ತು ಪ್ರಾಂಪ್ಟ್ ವ್ಯಾಖ್ಯಾನಗಳನ್ನು ಒಳಗೊಂಡಿದೆ |
| **ಕಾನ್ಫಿಗ್ರೇಶನ್** (`azure.yaml`) | ನಿಮ್ಮ ಸೇವೆಗಳನ್ನು ಮತ್ತು ಅವುಗಳ ಹೋಸ್ಟಿಂಗ್ ಗುರಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡುತ್ತದೆ | ನಿಮ್ಮ ಏಜೆಂಟ್ ಅನ್ನು ಒಂದು ಸೇವೆಯಾಗಿ ಪಟ್ಟಿ ಮಾಡುತ್ತದೆ, ಅದರ ಕೋಡ್ ಮತ್ತು ಹೋಸ್ಟ್ ಕಡೆಗೆ ಸೂಚಿಸುತ್ತದೆ |

### `azure.yaml` ರ ಪಾತ್ರ

ನೀವು ಈಗಲೇ ಸಿಂಟ್ಯಾಕ್ಸ್‌ ಅನ್ನು ಮೆಮೊರೈಸ್ ಮಾಡಬೇಕಾಗಿಲ್ಲ. ನಿರೂಪಣಾತ್ಮಕವಾಗಿ, `azure.yaml` ಪ್ರತಿ azd ಪ್ರಾಜೆಕ್ಟ್‌ನಲ್ಲಿ ನೀವು azdಗೆ ಹೇಳುವ ಫೈಲ್: *"ಇವು ನನ್ನ ಅಪ್ಲಿಕೇಶನನ್ನು ರೂಪಿಸುವ ಸೇವೆಗಳಿವು, ಮತ್ತು ಅವುಗಳ ಕೋಡ್ ಅನ್ನು ಎಲ್ಲಿಂದ ಪಡೆಯಬೇಕೋ ಅಷ್ಟೇ ಇಲ್ಲಿದೆ."*

ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್ ಒಂದು AI ಏಜೆಂಟ್ ಅನ್ನು ಒಳಗೊಂಡಿದ್ದಾಗ, `azure.yaml` ಸರಳವಾಗಿ ಆ ಏಜೆಂಟ್ ಅನ್ನು ಒಂದು ಸೇವೆಯಾಗಿ ಪಟ್ಟಿ ಮಾಡುತ್ತದೆ. azd ನಂತರ ಸರಿಯಾದ ಒಳಸೌಕರ್ಯವನ್ನು (ಉದಾಹರಣೆಗೆ Microsoft Foundry Models ಎಂಡ್ಪಾಯಿಂಟ್ ಅಥವಾ ಏಜೆಂಟ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡಲು Container App) ಪ್ರೊವಿಷನ್ ಮಾಡಬೇಕೆಂದು ಗೊತ್ತಿಸುತ್ತದೆ ಮತ್ತು ನಿಮ್ಮ ಏಜೆಂಟ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ—ವೆಬ್ ಅಪ್ ಅಥವಾ API ಗೆ ಮಾಡುವಂತೆ.

ಇದರಿಂದ ಮೂಲತಃ ಹೊಸದಾಗಿಯೇ ಕಲಿಯಬೇಕಾದುದಿಲ್ಲ. ನೀವು azd ಹೇಗೆ ಒಂದು ವೆಬ್ ಸೇವೆಯನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆಯೋ ಅಷ್ಟೇ, ಏಜೆಂಟ್‌ನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುತ್ತದೆಯೋ ನಿಮಗೆ ತಿಳಿದಿಗೊಡುತ್ತದೆ.

## ಸಂರಚನಾ ಹೈರಾರ್ಕಿ

azd ಒಂದು ಹೈರಾರ್ಕಿಕ ಸಂರಚನಾ ಸಿಸ್ಟಂ ಬಳಸುತ್ತದೆ:
1. **Command-line flags** (ಅತ್ಯಂತ ಪ್ರಾಮುಖ್ಯತೆ)
2. **ಪರಿಸರ ಚರಗಳು**
3. **ಸ್ಥಳೀಯ ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ** (`.azd/config.json`)
4. **ಗ್ಲೋಬಲ್ ಬಳಕೆದಾರ ಸಂರಚನೆ** (`~/.azd/config.json`)
5. **ಡೀಫಾಲ್ಟ್ ಮೌಲ್ಯಗಳು** (ಕಡಿಮೆ ಆದ್ಯತೆ)

## ಜಾಗತಿಕ ಸಂರಚನೆ

### ಜಾಗತಿಕ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ಸೆಟ್ಟಿಂಗ್ ಮಾಡುವುದು
```bash
# ಡೀಫಾಲ್ಟ್ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ಡೀಫಾಲ್ಟ್ ಸ್ಥಳವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.location "eastus2"

# ಡೀಫಾಲ್ಟ್ ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ನಾಮಕರಣ ನಿಯಮವನ್ನು ನಿಗದಿಪಡಿಸಿ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ಎಲ್ಲಾ ಜಾಗತಿಕ ಸಂರಚನೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd config show

# ಒಂದು ಸಂರಚನೆಯನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location
```

### ಸಾಮಾನ್ಯ ಜಾಗತಿಕ ಸೆಟ್ಟಿಂಗ್ಗಳು
```bash
# ಅಭಿವೃದ್ಧಿ ಆಯ್ಕೆಗಳು
azd config set alpha.enable true                    # ಆಲ್ಫಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set telemetry.enabled false             # ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
azd config set output.format json                  # ಔಟ್‌ಪುಟ್ ಸ್ವರೂಪವನ್ನು ಹೊಂದಿಸಿ

# ಭದ್ರತಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
azd config set auth.useAzureCliCredential true     # ಪ್ರಮಾಣೀಕರಣಕ್ಕಾಗಿ Azure CLI ಬಳಸಿ
azd config set tls.insecure false                  # TLS ಪರಿಶೀಲನೆಯನ್ನು ಕಡ್ಡಾಯಗೊಳಿಸಿ

# ಕಾರ್ಯಕ್ಷಮತೆ ಸುಧಾರಣೆ
azd config set provision.parallelism 5             # ಸಮಾಂತರ ಸಂಪನ್ಮೂಲ ರಚನೆ
azd config set deploy.timeout 30m                  # ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಯ ಮಿತಿ
```

## 🏗️ ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ

### azure.yaml ರಚನೆ
`azure.yaml` ಫೈಲ್ ನಿಮ್ಮ azd ಪ್ರಾಜೆಕ್ಟ್‌ನ ಹೃದಯವಾಗಿದೆ:

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

### ಸೇವೆ ಸಂರಚನಾ ಆಯ್ಕೆಗಳು

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

#### ಭಾಷಾ-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್ಗಳು
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
# ಹೊಸ ಪರಿಸರವನ್ನು ಸೃಷ್ಟಿಸಿ
azd env new development

# ನಿರ್ದಿಷ್ಟ ಸ್ಥಳದೊಂದಿಗೆ ಸೃಷ್ಟಿಸಿ
azd env new staging --location "westus2"

# ಮಾದರಿಯಿಂದ ಸೃಷ್ಟಿಸಿ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ವಾತಾವರಣ ಸಂರಚನೆ
ಪ್ರತಿಯೊಂದು ವಾತಾವರಣದ ತನ್ನದೇ ಸಂರಚನೆ `.azure/<env-name>/config.json` ನಲ್ಲಿ ಇರುತ್ತದೆ:

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

### ವಾತಾವರಣ ಚರಗಳು
```bash
# ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ಪರಿಸರದ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values

# ನಿರೀಕ್ಷಿತ ಪಲಿತಾಂಶ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ಪರಿಸರ ಚರವನ್ನು ತೆಗೆದುಹಾಕಿ
azd env unset DEBUG

# ತೆಗೆದುಹಾಕುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep DEBUG
# (ಏನೂ ಹಿಂತಿರುಗಬಾರದು)
```

### ವಾತಾವರಣ ಟೆಂಪ್ಲೇಟುಗಳು
ಸಮಮಾನದ ವಾತಾವರಣ ಸೆಟ್‌ಅಪ್‌ಗಾಗಿ `.azure/env.template` ರಚಿಸಿ:
```bash
# ಅಗತ್ಯವಾದ ಚರಗಳು
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

### ತಂಡದೊಳಗೆ ವಾತಾವರಣಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳುವುದು

ಒಂದು ಪ್ರಾಜೆಕ್ಟ್ ಮೇಲೆ ಹಲವು ಜನರು ಕೆಲಸ ಮಾಡಿದಾಗ, **ರಿಪೋ ಜೊತೆಗೆ ಏನು ಸಾಗುತ್ತದೆ ಮತ್ತು ಏನು ಸ್ಥಳೀಯರಾಗಿಯೇ ಉಳಿಯುತ್ತದೆ** ಎಂಬದರಲ್ಲಿ ಒಪ್ಪಿಕೊಳ್ಳುವುದು ಅಗತ್ಯ. azd ಪ್ರತಿ ವಾತಾವರಣವನ್ನು `.azure/` ಫೋಲ್ಡರ್ ಅಡಿಯಲ್ಲಿ ಇಡುತ್ತದೆ, ಮತ್ತು ಇದರ ಎಲ್ಲಾ ಭಾಗವನ್ನು ಕಮಿಟ್ ಮಾಡಬಾರದು.

**`.azure/` ನಲ್ಲಿ ಏನು ಇದೆ:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**ಯಾವುದನ್ನು gitignore ಮಾಡಬೇಕು.** azdನ ಡೀಫಾಲ್ಟ್ `.gitignore` ಈಗಾಗಲೇ `.azure/` ಅನ್ನು ಹೊರತುಪಡಿಸುತ್ತದೆ. ಅದನ್ನು ಅಷ್ಟು ಬದಲಿಸಬೇಡಿ—`.env` ಫೈಲ್‌ಗಳಲ್ಲಿ ರಹಸ್ಯಗಳು ಇರಬಹುದು, ಮತ್ತು ಸಂಪನ್ಮೂಲ IDಗಳು ಯಾರು ಪ್ರೊವಿಷನ್ ಮಾಡಿದ್ದಾರೆ ಅವರಿಗೇ ವಿಶೇಷವಾಗಿರುತ್ತವೆ. ಪ್ರತಿ ತಂಡದ ಸದಸ್ಯರು ಸ್ಥಳೀಯವಾಗಿ ತಮ್ಮ **ತಮ್ಮದೇ** ವಾತಾವರಣವನ್ನು ರಚಿಸುತ್ತಾರೆ:

```bash
# ಪ್ರತಿ ಡೆವಲಪರ್ ತನ್ನದೇ ಆದ ಬೇರ್ಪಟ್ಟ ಪರಿಸರವನ್ನು ಪಡೆಯಲು ಇದನ್ನು ಒಂದೇ ಬಾರಿ ನಡೆಸುತ್ತಾನೆ
azd env new dev-alice
azd up
```

**ವಾತಾವರಣಗಳ ನಡುವೆ ಸ್ವಿಚ್ ಮಾಡುವುದು.** ಹಲವು ವಾತಾವರಣಗಳನ್ನು ನಿರ್ವಹಿಸುವ ಡೆವಲಪರ್, ಕಮಾಂಡ್‌ಗಳನ್ನು ಚಲಾಯಿಸುವ ಮೊದಲು ಸಕ್ರಿಯ ವಾತಾವರಣವನ್ನು ಆಯ್ಕೆಮಾಡುತ್ತಾರೆ:

```bash
azd env list                 # ಎಲ್ಲಾ ಸ್ಥಳೀಯ ಪರಿಸರಗಳನ್ನು ಮತ್ತು ಯಾವುದು ಡೀಫಾಲ್ಟ್ ಎಂದು ನೋಡಿ
azd env select staging       # 'staging' ಅನ್ನು ಸಕ್ರಿಯ ಪರಿಸರವಾಗಿ ಮಾಡಿ
azd env get-values           # ನೀವು ಸರಿಯಾದದನ್ನು ಸೂಚಿಸುತ್ತಿದ್ದೀರಾ ಎಂಬುದನ್ನು ದೃಢಪಡಿಸಿ
```

**ಟೀಮಿಗೆ ರಹಸ್ಯವಲ್ಲದ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ಒದಗಿಸುವುದು.** ಒಂದು ಟೆಂಪ್ಲೇಟ್ (`.azure/env.template` ಹೋಲಿದಂತೆ) ಕಮಿಟ್ ಮಾಡಿ ताकि ಎಲ್ಲರೂ ಯಾವ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಬೇಕು ಎಂದು ತಿಳಿದುಕೊಳ್ಳುತ್ತಾರೆ—ಆದರೆ ಭರ್ತಿಯಾದ ಮೌಲ್ಯಗಳನ್ನು ಎಂದಿಗೂ ಕಮಿಟ್ ಮಾಡಬೇಡಿ. ಹೊಸ ತಂಡದ ಸದಸ್ಯರು ಟೆಂಪ್ಲೇಟನ್ನು ನಕಲಿಸಿ ತಮ್ಮದೇ ಮೌಲ್ಯಗಳನ್ನು ತುಂಬುತ್ತಾರೆ.

**CI/CD ನಲ್ಲಿ ವಾತಾವರಣಗಳು.** ಪೈಪ್‌ಲೈನ್ಗಳು ನಿಮ್ಮ ಸ್ಥಳೀಯ `.azure/` ಫೋಲ್ಡರ್ ಅನ್ನು ಓದುತ್ತವೆಲ್ಲ. ಬದಲಾಗಿ, ವಾತಾವರಣ ಮೌಲ್ಯಗಳನ್ನು ಪೈಪ್‌ಲೈನ್ ವೇರಿಯಬಲ್ಗಳ/ಸೀಕ್ರೆಟ್ಗಳಾಗಿ ಒದಗಿಸಿ, ಮತ್ತು azd ಅವುಗಳನ್ನು ಪ್ರosseಸ್ ವಾತಾವರಣದಿಂದ ಓದುತ್ತದೆ:

```bash
# CIನಲ್ಲಿ, azd ಅವುಗಳನ್ನು .azure/ ನಿಂದವಲ್ಲ, ಪರಿಸರದಿಂದ ಓದುತ್ತದೆ.
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **ಹಣಿಕೆಯ ನಿಯಮ:** ಒಳಸೌಕರ್ಯ ಕೋಡ್ (`infra/`, `azure.yaml`) Git ನಲ್ಲಿ ಹಂಚಲಾಗುತ್ತದೆ; ವಾತಾವರಣದ *ಸ್ಥಿತಿ ಮತ್ತು ರಹಸ್ಯಗಳು* (`.azure/`) ಪ್ರತಿ-ಡೆವಲಪರ್ ಮತ್ತು ಪ್ರತಿ-ಪೈಪ್‌ಲೈನ್‌ಗಾಗಿ ವಿಭಿನ್ನವಾಗಿರುತ್ತವೆ. `azd pipeline config` ನಿಮ್ಮಿಗಾಗಿ ಪೈಪ್‌ಲೈನ್ ವೇರಿಯಬಲ್ಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಹೊಂದಿಸುತ್ತದೆ.

## 🔐 ಪ್ರಾಮಾಣೀಕರಣ ಸಂರಚನೆ

### Azure CLI ಸಂಯೋಜನೆ
```bash
# Azure CLI ಪ್ರಮಾಣಿ ವಿವರಗಳನ್ನು ಬಳಸಿ (ಡೀಫಾಲ್ಟ್)
azd config set auth.useAzureCliCredential true

# ನಿರ್ದಿಷ್ಟ ಟೆನಂಟ್‌ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login --tenant <tenant-id>

# ಡೀಫಾಲ್ಟ್ ಚಂದಾದಾರಿಕೆಯನ್ನು ಹೊಂದಿಸಿ
az account set --subscription <subscription-id>
```

### ಸರ್ವೀಸ್ ಪ್ರಿನ್ಸಿಪಲ್ ಪ್ರಾಮಾಣೀಕರಣ
CI/CD ಪೈಪ್‌ಲೈನ್ಗಳಿಗಾಗಿ:
```bash
# ವಾತಾವರಣ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ಅಥವಾ ನೇರವಾಗಿ ಸಂರಚಿಸಿ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ಮ್ಯಾನೇಜ್ಡ್ ಐಡೆಂಟಿಟಿ
Azure-ಆಧಾರಿತ ಪರಿಸರವಿನಲ್ಲಿ:
```bash
# ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಪ್ರಮಾಣೀಕರಣವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ಮೂಲಸೌಕರ್ಯ ಸಂರಚನೆ

### Bicep ಪರಿಮಾಣಗಳು
`infra/main.parameters.json` ನಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ ಪರಿಮಾಣಗಳನ್ನು ಸಂರಚಿಸಿ:
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

### Terraform ಸಂರಚನೆ
Terraform ಪ್ರಾಜೆಕ್ಟ್‌ಗಳಿಗೆ, `infra/terraform.tfvars` ನಲ್ಲಿ ಸಂರಚಿಸಿ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ನಿಯೋಜನೆ ಸಂರಚನೆ

### ಬಿಲ್ಡ್ ಸಂರಚನೆ
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
ಉದಾಹರಣೆ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ಉನ್ನತ ಸಂರಚನೆ

### ಕಸ್ಟಮ್ ನಿರ್ವಹಣಾ ನಾಮಕರಣ
```bash
# ಹೆಸರಿನ ನಿಯಮಗಳನ್ನು ನಿಗದಿಪಡಿಸಿ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ನೆಟ್ವರ್ಕ್ ಸಂರಚನೆ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ಮಾನಿಟರಿಂಗ್ ಸಂರಚನೆ
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

## 🎯 ವಾತಾವರಣಾನುಸಾರ ಸಂರಚನೆಗಳು

### ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣ
```bash
# .azure/ವಿಕಾಸ/.env
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

## 🔍 ಸಂರಚನೆ ಪರಿಶೀಲನೆ

### ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸು
```bash
# ಕಾನ್ಫಿಗರೇಶನ್ ವಾಕ್ಯರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd config validate

# ಪರಿಸರ ಚರಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
azd env get-values

# ಅಧಾರಭೂತ ಸಂರಚನೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd provision --dry-run
```

### ಸಂರಚನಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
ವ್ಯಾಲಿಡೇಶನ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು `scripts/` ನಲ್ಲಿ ರಚಿಸಿ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ಅಗತ್ಯವಾದ ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ಫೈಲ್‌ನ ವಾಕ್ಯರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
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

### 2. ಸಂರಚನಾ ಫೈಲ್‌ಗಳನ್ನು ಸಂಘಟಿಸಿ
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

### 3. ಆವೃತ್ತಿ ನಿಯಂತ್ರಣದ ವಿಚಾರಣೆಗಳು
```bash
# .gitignore
.azure/*/config.json         # ಪರಿಸರ ಸಂರಚನೆಗಳು (ಸಂಪನ್ಮೂಲ ಐಡಿಗಳನ್ನು ಹೊಂದಿರುತ್ತವೆ)
.azure/*/.env               # ಪರಿಸರ ಚರಗಳು (ರಹಸ್ಯಗಳನ್ನು ಹೊಂದಿರಬಹುದು)
.env                        # ಸ್ಥಳೀಯ ಪರಿಸರ ಫೈಲ್
```

### 4. ಸಂರಚನೆ ಡಾಕ್ಯುಮೆಂಟೇಷನ್
ನಿಮ್ಮ ಸಂರಚನೆಯನ್ನು `CONFIG.md` ನಲ್ಲಿ ದಾಖಲೆ ಮಾಡಲು:
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

## 🎯 ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: ಬಹು-ವಾತಾವರಣ ಸಂರಚನೆ (15 ನಿಮಿಷ)

**ಗುರಿ**: ವಿಭಿನ್ನ ಸೆಟ್ಟಿಂಗ್ಗಳೊಂದಿಗೆ ಮೂರು ವಾತಾವರಣಗಳನ್ನು ರಚಿಸಿ ಮತ್ತು ಸಂರಚಿಸಿ

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

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ಮೂರು ವಾತಾವರಣಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ
- [ ] ಪ್ರತಿ ವಾತಾವರಣಕ್ಕೂ ವಿಭಿನ್ನ ಸಂರಚನೆ ಇದೆ
- [ ] ದೋಷರಹಿತವಾಗಿ ವಾತಾವರಣಗಳ ನಡುವೆ ಸ್ವಿಚ್ ಮಾಡಬಹುದು
- [ ] `azd env list` ಮೂರು ವಾತಾವರಣಗಳನ್ನೂ ತೋರಿಸುತ್ತದೆ

### ಅಭ್ಯಾಸ 2: ರಹಸ್ಯ ನಿರ್ವಹಣೆ (10 ನಿಮಿಷ)

**ಗುರಿ**: ಸಂವೇದನಶೀಲ ಡೇಟಾ ಮೂಲಕ ಸುರಕ್ಷಿತ ಸಂರಚನೆ ಅಭ್ಯಾಸ ಮಾಡಿ

```bash
# ರಹಸ್ಯಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ (ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ತೋರಿಸಲಾಗುವುದಿಲ್ಲ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ರಹಸ್ಯವಲ್ಲದ ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ಪರಿಸರವನ್ನು ನೋಡಿ (ರಹಸ್ಯಗಳು ಅಪ್ರಕಟವಾಗಿರಬೇಕು)
azd env get-values

# ರಹಸ್ಯಗಳು ಸಂಗ್ರಹವಾಗಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get DB_PASSWORD  # ನಿಜವಾದ ಮೌಲ್ಯವನ್ನು ತೋರಿಸಬೇಕು
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ರಹಸ್ಯಗಳು ಟರ್ಮಿನಲ್‌ನಲ್ಲಿ ಪ್ರದರ್ಶಿಸದೇ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ
- [ ] `azd env get-values` ರೆಡ್ಯಾಕ್ಟ್ ಮಾಡಿದ ರಹಸ್ಯಗಳನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] ವೈಯಕ್ತಿಕ `azd env get <SECRET_NAME>` ನಿಜವಾದ ಮೌಲ್ಯವನ್ನು ಪಡೆದುತ್ತದೆ

## ಮುಂದಿನ ಹಂತಗಳು

- [Your First Project](first-project.md) - ನೈಜಪ್ರಯೋಗದಲ್ಲಿ ಸಂರಚನೆ ಅನ್ವಯಿಸಿ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ನಿಯೋಜನೆಗಾಗಿ ಸಂರಚನೆ ಬಳಸಿ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ಉತ್ಪಾದನಾ-ತಯಾರ ಆದ ಸಂರಚನೆಗಳು

## ಉಲ್ಲೇಖಗಳು

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಸಂರಚನೆ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->