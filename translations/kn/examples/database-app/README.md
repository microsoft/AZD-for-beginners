# AZD ಬಳಸಿ Microsoft SQL ಡೇಟಾಬೇಸ್ ಮತ್ತು ವೆಬ್ ಆಪ್ ಅನ್ನು ನಿಯೋಜಿಸುವುದು

⏱️ **ಅಂದಾಜು ಸಮಯ**: 20-30 ನಿಮಿಷಗಳು | 💰 **ಅಂದಾಜು ವೆಚ್ಚ**: ~$15-25/ತಿಂಗಳು | ⭐ **ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ

ಈ **ಪೂರ್ಣ, ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಉದಾಹರಣೆ** ಹೇಗೆ [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) ಬಳಸಿ Python Flask ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Microsoft SQL ಡೇಟಾಬೇಸ್ ಜೊತೆಗೆ Azure ಗೆ ನಿಯೋಜಿಸಲು നിർದರ್ಶಿಸುತ್ತದೆ. ಎಲ್ಲಾ ಕೋಡ್ ಸೇರಿಸಲಾಗಿದೆ ಮತ್ತು ಪರೀಕ್ಷಿಸಲಾಗಿದೆ—ಯಾವುದೇ ಹೊರಗಿನ ಅವಲಂಬನೆಗಳು ಅಗತ್ಯವಿಲ್ಲ.

## ನೀವು ಏನು ಕಲಿಯುತ್ತೀರಿ

ಈ ಉದಾಹರಣೆ_completion ಮಾಡಿದರೆ, ನೀವು:
- ಮೂಲಸೌಕರ್ಯ-ರಾಮ್ಗಳನ್ನು ಕೂಡಿಸಿ (web app + database) ಒಂದು ಬಹು-ಹಂತದ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸುವುದನ್ನು ಕಲಿತೀರಿ
- ರಹಸ್ಯಗಳನ್ನು ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡದೆ ಸುರಕ್ಷಿತ ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕಗಳನ್ನು ಸಂರಚಿಸುವುದು
- Application Insights ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಆರೋಗ್ಯವನ್ನು ಮಾನಿಟರ್ ಮಾಡುವುದು
- AZD CLI ಬಳಸಿ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನಿರ್ವಹಿಸುವುದು
- ಭದ್ರತೆ, ವೆಚ್ಚ ಉಳಿತಾಯ ಮತ್ತು ಡಿಸ್ಬರ್ವೇಬಿಲಿಟಿ (observability)ಗಾಗಿ Azure ಶ್ರೇಷ್ಠ ಅಭ್ಯಾಸಗಳನ್ನು ಅನುಸರಿಸುವುದು

## ದೃಶ್ಯಾವಳಿ ಅವಲೋಕನ
- **Web App**: ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕದೊಡನೆ Python Flask REST API
- **Database**: ಮಾದರಿ ಡೇಟಾವಿದ್ದ Azure SQL Database
- **Infrastructure**: Bicep ಬಳಸಿ ಪ್ರೊವಿಷನ್ ಮಾಡಲಾಗಿದೆ (ಮೊಡ್ಯುಲರ್, ಮರುಬಳಕೆಗೋಕು)
- **Deployment**: `azd` ಕಮಾಂಡ್‌ಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ ಸ್ವಯಂಚಾಲಿತ
- **Monitoring**: ಲಾಗ್‌ಗಳು ಮತ್ತು ಟೆಲಿಮೆಟ್ರಿಗೆ Application Insights

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

### ಅಗತ್ಯ ಸಾಧನಗಳು

ಆರಂಭಿಸುವ ಮೊದಲು, ಈ ಸಾಧನಗಳು ಸ್ಥಾಪಿತವಾಗಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (ಆವೃತ್ತಿ 2.50.0 ಅಥವಾ ಹೆಚ್ಚಿನದು)
   ```sh
   az --version
   # ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ: azure-cli 2.50.0 ಅಥವಾ ಅದಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ಆವೃತ್ತಿ
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (ಆವೃತ್ತಿ 1.0.0 ಅಥವಾ ಹೆಚ್ಚಿನದು)
   ```sh
   azd version
   # ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ: azd ಆವೃತ್ತಿ 1.0.0 ಅಥವಾ ಅದಕ್ಕಿಂತ ಮೇಲಿನ
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (ಸ್ಥಳೀಯ ಅಭಿವೃದ್ಧಿಗೆ)
   ```sh
   python --version
   # ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ: Python 3.8 ಅಥವಾ ಹೆಚ್ಚಿನ ಆವೃತ್ತಿ
   ```

4. **[Docker](https://www.docker.com/get-started)** (ಐಚ್ಛಿಕ, ಸ್ಥಳೀಯ ಕಂಟೈನರ್ ಅಭಿವೃದ್ಧಿಗೆ)
   ```sh
   docker --version
   # ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ: Docker ಆವೃತ್ತಿ 20.10 ಅಥವಾ ಅದಕ್ಕಿಂತ ಹೆಚ್ಚು
   ```

### Azure ಅವಶ್ಯಕತೆಗಳು

- ಸಕ್ರಿಯ **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- ನಿಮ್ಮ subscription ನಲ್ಲಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುವ ಅನುಮತಿಗಳು
- ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅಥವಾ ರಿಸೋರ್ಸ್ ಗುಂಪಿನ ಮೇಲೆ **Owner** ಅಥವಾ **Contributor** ಹಕ್ಕು

### ಜ್ಞಾನ ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

ಇದು ಒಂದು **ಮಧ್ಯಮ-ತಳದ** ಉದಾಹರಣೆ. ನೀವು ಇವುಗಳ ಕುರಿತು ಪರಿಚಿತರಾಗಿರಬೇಕು:
- ಮೂಲ ಕಮಾಂಡ್-ಲೈನ್ ಕಾರ್ಯಗಳು
- ಕ್ಲೌಡ್ ಮೂಲಭೂತ ಸಂकल्पನೆಗಳು (ಸಂಪನ್ಮೂಲಗಳು, resource groups)
- ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಮತ್ತು ಡೇಟಾಬೇಸ್‌ಗಳ ಮೂಲಭೂತ ಜ್ಞಾನ

**AZD ಹೊಸದು՞** ಪ್ರಥಮವಾಗಿ [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ.

## ವಾಸ್ತುಶಿಲ್ಪ

ಈ ಉದಾಹರಣೆ ಒಂದು ದ್ವಿ-ತಲೆ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ: ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಮತ್ತು SQL ಡೇಟಾಬೇಸ್:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**ಸಂಪನ್ಮೂಲ ನಿಯೋಜನೆ:**
- **Resource Group**: ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳಿಗಾಗಿ ಕಂಟೈನರ್
- **App Service Plan**: Linux ಆಧಾರಿತ ಹೋಸ್ಟಿಂಗ್ (ವೆಚ್ಚದ ದೃಷ್ಠಿಯಿಂದ B1 ಟಿಯರ್)
- **Web App**: Python 3.11 ರuntime ಜೊತೆಗೆ Flask ಅಪ್ಲಿಕೇಶನ್
- **SQL Server**: TLS 1.2 ಕನಿಷ್ಠ ಮತ್ತು ನಿರ್ವಹಿತ ಡೇಟಾಬೇಸ್ ಸರ್ವರ್
- **SQL Database**: Basic ಟಿಯರ್ (2GB, ಅಭಿವೃದ್ಧಿ/ಪರೀಕ್ಷೆಗಾಗಿ ಸೂಕ್ತ)
- **Application Insights**: ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್
- **Log Analytics Workspace**: ಕೇಂದ್ರಿತ ಲಾಗ್ ಸಂಗ್ರಹಣೆ

**ಉಪಮಾನ**: ಇದನ್ನು ರೆಸ್ಟೋರೆಂಟ್ (ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್) ಮತ್ತು ವಾಕ್-ಇನ್ ಫ್ರೀಜರ್ (ಡೇಟಾಬೇಸ್) ಎಂದು ಭಾವಿಸಿ. ಗ್ರಾಹಕರು ಮೆನು (API endpoints) ನಿಂದ ಆದೇಶಿಸುತ್ತಾರೆ, ಮತ್ತು ಕಿಚನ್ (Flask ಅಪ್ಲಿಕೇಶನ್) ಫ್ರೀಜರ್‌ನಿಂದ (ಡೇಟಾ) ಪದಾರ್ಥಗಳನ್ನು ತರಿಸುತ್ತದೆ. ರೆಸ್ಟೋರೆಂಟ್ ಮ್ಯಾನೇಜರ್ (Application Insights) ಎಲ್ಲಾ ಘಟನೆಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡುತ್ತಾನೆ.

## ಫೋಲ್ಡರ್ ರಚನೆ

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ ಎಲ್ಲಾ ಫೈಲುಗಳು ಸೇರಿಸಲಾಗಿದೆ—ಯಾವುದೇ ಹೊರಗಿನ ಅವಲಂಬನೆಗಳು ಅಗತ್ಯವಿಲ್ಲ:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**ಪ್ರತಿ ಫೈಲ್ ಏನು ಮಾಡುತ್ತದೆ:**
- **azure.yaml**: AZD ನಿಮಗೆ ಏನು ನಿಯೋಜಿಸಬೇಕೆಂದು ಮತ್ತು ಎಲ್ಲಿ ಎನ್ನುತ್ತದೆ
- **infra/main.bicep**: ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸಂಯೋಜಿಸುತ್ತದೆ
- **infra/resources/*.bicep**: ಪ್ರತ್ಯೇಕ ಸಂಪನ್ಮೂಲ ವ್ಯಾಖ್ಯಾನಗಳು (ಮರುಬಳಕೆಗೆ ಮೊಡ್ಯುಲರ್)
- **src/web/app.py**: ಡೇಟಾಬೇಸ್ ಲಾಜಿಕ್ಸ್ ಇರುವ Flask ಅಪ್ಲಿಕೇಶನ್
- **requirements.txt**: Python ಪ್ಯಾಕೇಜ್ ಅವಲಂಬನೆಗಳು
- **Dockerfile**: ನಿಯೋಜನೆಗೆ ಕಂಟೈನರ್ ಸೂಚನೆಗಳು

## ವೇಗದ ಪ್ರಾರಂಭ (ಹಂತದಿಂದ ಹಂತಕ್ಕೆ)

### ಹಂತ 1: ರೆಪೊ ಕ್ಲೋನ್ ಮಾಡಿ ಮತ್ತು ಪ್ರವೇಶಿಸಿ

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು `azure.yaml` ಮತ್ತು `infra/` ಫೋಲ್ಡರ್ ಅನ್ನು ನೋಡುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ:
```sh
ls
# ನಿರೀಕ್ಷಿತ: README.md, azure.yaml, infra/, src/
```

### ಹಂತ 2: Azure ಮೂಲಕ ಪ್ರಮಾಣೀಕರಣ

```sh
azd auth login
```

ಇದು ನಿಮ್ಮ ಬ್ರೌಸರ್ ಅನ್ನು ತೆರೆಯುತ್ತದೆ ಮತ್ತು Azure ಪ್ರಮಾಣೀಕರಣೆಗೆ ಅನುಮತಿಸುತ್ತದೆ. ನಿಮ್ಮ Azure ಪ್ರಮಾಣಪತ್ರಗಳೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ.

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು ಇದನ್ನು ನೋಡಬೇಕು:
```
Logged in to Azure.
```

### ಹಂತ 3: ಪರಿಸರವನ್ನು ಪ್ರಾರಂಭಿಸಿ

```sh
azd init
```

**ಏನಾಗುತ್ತದೆ**: AZD ನಿಮ್ಮ ನಿಯೋಜನೆಗಾಗಿ ಸ್ಥಳೀಯ ಸಂರಚನೆಯನ್ನು ರಚಿಸುತ್ತದೆ.

**ನೀವು ನೋಡುವ ಪ್ರಾಂಪ್ಟ್‌ಗಳು**:
- **Environment name**: ಒಂದು ಸಣ್ಣ ಹೆಸರು ನಮೂದಿಸಿ (ಉದಾಹರಣೆ: `dev`, `myapp`)
- **Azure subscription**: ಪಟ್ಟಿ ಇಂದ ನಿಮ್ಮ subscription ಆಯ್ಕೆಮಾಡಿ
- **Azure location**: ಒಂದು ಪ್ರದೇಶ ಆಯ್ಕೆಮಾಡಿ (ಉದಾಹರಣೆ: `eastus`, `westeurope`)

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು ಇದನ್ನು ನೋಡಬೇಕು:
```
SUCCESS: New project initialized!
```

### ಹಂತ 4: Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪ್ರೊವಿಷನ್ ಮಾಡಿ

```sh
azd provision
```

**ಏನಾಗುತ್ತದೆ**: AZD ಎಲ್ಲಾ ಮೂಲಸೌಕರ್ಯಗಳನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ (5-8 ನಿಮಿಷ ತೆಗೆದುಕೊಳ್ಳಬಹುದು):
1. Resource group ರಚಿಸುತ್ತದೆ
2. SQL Server ಮತ್ತು Database ರಚಿಸುತ್ತದೆ
3. App Service Plan ರಚಿಸುತ್ತದೆ
4. Web App ರಚಿಸುತ್ತದೆ
5. Application Insights ರಚಿಸುತ್ತದೆ
6. ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಭದ್ರತೆಯನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತದೆ

**ನಿಮಗೆ ಕೇಳಲಾಗುವುದು**:
- **SQL admin username**: ಒಂದು ಬಳಕೆದಾರಹೆಸರು ನಮೂದಿಸಿ (ಉದಾಹರಣೆ: `sqladmin`)
- **SQL admin password**:一个 ಬಲವಾದ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ (ಇದರನ್ನು ಸಂರಕ್ಷಿಸಿ!)

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು ಇದನ್ನು ನೋಡಬೇಕು:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ ಸಮಯ**: 5-8 ನಿಮಿಷಗಳು

### ಹಂತ 5: ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ

```sh
azd deploy
```

**ಏನಾಗುತ್ತದೆ**: AZD ನಿಮ್ಮ Flask ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿರ್ಮಿಸಿ ನಿಯೋಜಿಸುತ್ತದೆ:
1. Python ಅಪ್ಲಿಕೇಶನ್ ಪ್ಯಾಕೇಜ್ ಮಾಡುತ್ತದೆ
2. Docker ಕಂಟೈನರ್ ಅನ್ನು ನಿರ್ಮಿಸುತ್ತದೆ
3. Azure Web App ಗೆ ಪುಷ್ ಮಾಡುತ್ತದೆ
4. ಮಾದರಿ ಡೇಟಾ ಜೊತೆ ಡೇಟಾಬೇಸ್ ಅನ್ನು ಪ್ರಾರಂಭಿಕೀಕರಿಸುತ್ತದೆ
5. ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸುತ್ತದೆ

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು ಇದನ್ನು ನೋಡಬೇಕು:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ ಸಮಯ**: 3-5 ನಿಮಿಷಗಳು

### ಹಂತ 6: ಅಪ್ಲಿಕೇಶನ್ನನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ

```sh
azd browse
```

ಇದು `https://app-<unique-id>.azurewebsites.net` ನಲ್ಲಿ ನಿಮ್ಮ ನಿಯೋಜಿತ ವೆಬ್ ಆಪ್ ಅನ್ನು ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯುತ್ತದೆ

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು JSON ಔಟ್‌ಪುಟ್ ಅನ್ನು ನೋಡಬೇಕು:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### ಹಂತ 7: API ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ

**ಹೆಲ्थ್ ಚೆಕ್** (ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**अपೇಕ್ಷಿತ ಪ್ರತಿಕ್ರಿಯೆ**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**ಉತ್ಪನ್ನಗಳ ಪಟ್ಟಿ** (ಮಾದರಿ ಡೇಟಾ):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**अपೇಕ್ಷಿತ ಪ್ರತಿಕ್ರಿಯೆ**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**ಏಕಲಿಂಗ ಉತ್ಪನ್ನ ಪಡೆಯಿರಿ**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ಎಲ್ಲಾ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು ದೋಷಗಳಿಲ್ಲದೆ JSON ಡೇಟಾವನ್ನು ಹಿಂತಿರುಗಿಸಬೇಕು.

---

**🎉 ಅಭಿನಂದನೆಗಳು!** ನೀವು AZD ಬಳಸಿ Azure ಗೆ ಡೇಟಾಬೇಸ್ ಹೊಂದಿರುವ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಿದ್ದೀರಿ.

## ಸಂರಚನೆ - ಆಳವಾದ ಅವಲೋಕನ

### ಪರಿಸರ ಚರಗಳು

ರಹಸ್ಯಗಳನ್ನು ಸುರಕ್ಷಿತವಾಗಿ Azure App Service ಸಂರಚನೆಯ ಮೂಲಕ ನಿರ್ವಹಿಸಲಾಗುತ್ತದೆ—**ಸೋದ_Source ಕೋಡ್‌ನಲ್ಲಿ ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡಬೇಡಿ**.

**AZD ಮೂಲಕ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಂರಚಿತ**:
- `SQL_CONNECTION_STRING`: ಎನ್ಕ್ರಿಪ್ಟ್ ಮಾಡಿದ ರಹಸ್ಯಗಳೊಂದಿಗೆ ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: ಮಾನಿಟರಿಂಗ್ ಟೆಲಿಮೆಟ್ರಿ ಎಂಡ್ಪಾಯಿಂಟ್
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: ಸ್ವಯಂಚಾಲಿತ ಅವಲಂಬನೆ ಸ್ಥಾಪನೆ ಚಲಾಯಿಸುತ್ತದೆ

**ರಹಸ್ಯಗಳು ಎಲ್ಲಿ ಸಂಗ್ರಹವಾಗುತ್ತವೆ**:
1. `azd provision` ವೇಳೆ, ನೀವು SQL ಕ್ರೆಡೆನ್ಶಿಯಲ್ಸ್ ಸುರಕ್ಷಿತ ಪ್ರಾಂಪ್ಟ್ ಮೂಲಕ ನೀಡುತ್ತೀರಿ
2. AZD ಅವುಗಳನ್ನು ನಿಮ್ಮ ಸ್ಥಳೀಯ `.azure/<env-name>/.env` ಫೈಲ್‌ನಲ್ಲಿ ಸಂಗ್ರಹಿಸುತ್ತದೆ (git-ignored)
3. AZD ಅವುಗಳನ್ನು Azure App Service ಸಂರಚನೆಯಲ್ಲಿ ಸೆಟ್ ಮಾಡುತ್ತದೆ (ಸ್ಥಿತಿಯಲ್ಲಿ ಎನ್ಕ್ರಿಪ್ಟ್ ಆಗಿರುತ್ತದೆ)
4. ಅಪ್ಲಿಕೇಶನ್ ರನ್‌ಟೈಮಿನಲ್ಲಿ ಅವುಗಳನ್ನು `os.getenv()` ಮೂಲಕ ಓದುತ್ತದೆ

### ಸ್ಥಳೀಯ ಅಭಿವೃದ್ಧಿ

ಆದ್ದರಿಂದ ಸ್ಥಳೀಯ ಪರೀಕ್ಷೆಗಾಗಿ, ಮಾದರಿಯಿಂದ `.env` ಫೈಲ್ ಅನ್ನು ರಚಿಸಿ:

```sh
cp .env.sample .env
# ನಿಮ್ಮ ಸ್ಥಳೀಯ ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕದೊಂದಿಗೆ .env ಅನ್ನು ಸಂಪಾದಿಸಿ
```

**ಸ್ಥಳೀಯ ಅಭಿವೃದ್ಧಿ ಕೆಲಸದ ಹರಿವು**:
```sh
# ಅವಲಂಬನೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
cd src/web
pip install -r requirements.txt

# ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
export SQL_CONNECTION_STRING="your-local-connection-string"

# ಅನ್ವಯಿಕೆಯನ್ನು ಚಲಾಯಿಸಿ
python app.py
```

**ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ**:
```sh
curl http://localhost:8000/health
# ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ: {"status": "healthy", "database": "connected"}
```

### ಕೋಡ್ ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ

ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳು **Bicep ಟೆಂಪ್ಲೇಟುಗಳಲ್ಲಿ** (`infra/` ಫೋಲ್ಡರ್) ವ್ಯಾಖ್ಯಾನಿಸಲ್ಪಟ್ಟಿವೆ:

- **ಮೊಡ್ಯುಲರ್ ವಿನ್ಯಾಸ**: ಪ್ರತಿ ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಕ್ಕೆ ತನ್ನದೇ ಫೈಲ್ ಇದೆ ಮರುಬಳಕೆಗೆ ಅನುಕೂಲಕರ
- **ಪ್ಯಾರಾಮೆಟರೈಸ್ ಮಾಡಲಾದ**: SKUs, ಪ್ರದೇಶಗಳು, ನಾಮಕರಣ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದು
- **ಶ್ರೇಷ್ಠ ಅಭ್ಯಾಸಗಳು**: Azure ನಾಮಕರಣ ಮಾನದಂಡ ಮತ್ತು ಭದ್ರತಾ ಡೀಫಾಲ್ಟ್ಗಳನ್ನು ಅನುಸರಿಸುತ್ತದೆ
- **ವರ್ಷನ್ ಕಂಟ್ರೋಲ್**: ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳು Git ನಲ್ಲಿ ಟ್ರ್ಯಾಕ್ ಆಗುತ್ತವೆ

**ಕಸ್ಟಮೈಜೇಶನ್ ಉದಾಹರಣೆ**:
ಡೇಟಾಬೇಸ್ ಟಿಯರ್ ಬದಲಾಯಿಸಲು, `infra/resources/sql-database.bicep` ಅನ್ನು ಸಂಪಾದಿಸಿ:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

ಈ ಉದಾಹರಣೆ Azure ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನುಸರಿಸುತ್ತದೆ:

### 1. **ಸೋರ್ಸ್ ಕೋಡ್‌ನಲ್ಲಿ ರಹಸ್ಯಗಳು ಇಲ್ಲ**
- ✅ ಕ್ರೆಡೆನ್ಶಿಯಲ್ಸ್ Azure App Service ಸಂರಚನೆಯಲ್ಲಿ ಸಂಗ್ರಹವಿದೆ (ಎನ್ಕ್ರಿಪ್ಟ್ ಆಗಿದೆ)
- ✅ `.env` ಫೈಲ್‌ಗಳು Git ನಲ್ಲಿ ಹೊರಗೊಳ್ಳಲಿಲ್ಲ (`.gitignore`)
- ✅ ಪ್ರೊವಿಷನಿಂಗ್ ಸಮಯದಲ್ಲಿ ರಹಸ್ಯಗಳು ಸುರಕ್ಷಿತ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳ ಮೂಲಕ ಪಾಸ್ ಮಾಡಲಾಗುತ್ತವೆ

### 2. **ಎನ್ಕ್ರಿಪ್ಟ್ ಮಾಡಿದ ಸಂಪರ್ಕಗಳು**
- ✅ SQL Server ಗೆ TLS 1.2 ಕನಿಷ್ಠ
- ✅ Web App ಗೆ ಮಾತ್ರ HTTPS ಅನುವು (HTTPS-only) ಪಾಲಿಸಲಾಗಿದೆ
- ✅ ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕಗಳು ಎನ್ಕ್ರಿಪ್ಟ್ ಚಾನೆಲ್ ಬಳಕೆ ಮಾಡುತ್ತವೆ

### 3. **ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತೆ**
- ✅ SQL Server ಫೈರ್‌ವಾಲ್ Azure ಸೇವೆಗಳಿಗಷ್ಟೇ ಅನುಮತಿಸುತ್ತದೆ
- ✅ ಪಬ್ಲಿಕ್ ನೆಟ್ವರ್ಕ್ ಪ್ರವೇಶ ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ (ಖಾಸಗಿ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳೊಂದಿಗೆ ಮತ್ತಷ್ಟು ಗಟ್ಟಿಯಾಗಿಸಬಹುದು)
- ✅ Web App ನಲ್ಲಿ FTPS ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ

### 4. **ಪ್ರಮಾಣೀಕರಣ & ನಿರ್ವಾಹಕತೆ**
- ⚠️ **ಪ್ರಸ್ತುತ**: SQL authentication (username/password)
- ✅ **ಉತ್ಪಾದನೆ ಶಿಫಾರಸು**: ಪಾಸ್ವರ್ಡ್ ರಹಿತ ಪ್ರಮಾಣೀಕರಣಕ್ಕೆ Azure Managed Identity ಬಳಸಿ

**Managed Identity ಗೆ ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಲು** (ಉತ್ಪಾದನೆಗಾಗಿ):
1. Web App ನಲ್ಲಿ managed identity ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
2. ಆ ಐಡెంటಿಟಿಗೆ SQL ಅನುಮತಿಗಳನ್ನು ನೀಡಿ
3. ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್ ಅನ್ನು managed identity ಬಳಕೆಗಾಗಿ ನವೀಕರಿಸಿ
4. ಪಾಸ್‌ವರ್ಡ್ ಆಧಾರಿತ authentication ಅನ್ನು ತೆಗೆದುಹಾಕಿ

### 5. **ಆಡಿಟಿಂಗ್ & ಕಲಂಬನೀಯತೆ (Compliance)**
- ✅ Application Insights ಎಲ್ಲಾ ವಿನಂತಿ ಮತ್ತು ದೋಷಗಳನ್ನು ಲಾಗ್ ಮಾಡುತ್ತದೆ
- ✅ SQL Database auditing ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ (ಕಂಪ್ಲಯನ್ಸ್‌ಗಾಗಿ ಕಾನ್ಫಿಗರ್ ಮಾಡಬಹುದು)
- ✅ ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳು ಸರ್ಕಾರಾತ್ಮಕ ಮಾರ್ಗದರ್ಶನಕ್ಕಾಗಿ ಟ್ಯಾಗ್ ಮಾಡಲ್ಪಟ್ಟಿವೆ

**ಉತ್ಪಾದನೆಗೆ ಮೊದಲು ಭದ್ರತಾ ಚೆಕ್ಬ್ಲಿಸ್ಟ್**:
- [ ] Azure Defender for SQL ಸಕ್ರಿಯಗೊಳಿಸಿ
- [ ] SQL Database ಗೆ Private Endpoints ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
- [ ] Web Application Firewall (WAF) ಸಕ್ರಿಯಗೊಳಿಸಿ
- [ ] ರಹಸ್ಯ ರೋಟೇಶನಿಗಾಗಿ Azure Key Vault ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- [ ] Azure AD ಪ್ರಮಾಣೀಕರಣವನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
- [ ] ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ

## ವೆಚ್ಚದ ಅನುಕೂಲತೆ

**ಅಂದಾಜು ಮಾಸಿಕ ವೆಚ್ಚಗಳು** (ನವೆಂಬರ್ 2025 ರ ಅನುಸಾರ):

| ಸಂಪನ್ಮೂಲ | SKU/ಟಿಯರ್ | ಅಂದಾಜು ವೆಚ್ಚ |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (ಕೆಳಗಿನ ಟ್ರಾಫಿಕ್) |
| **ಒಟ್ಟು** | | **~$20/month** |

**💡 ವೆಚ್ಚ ಉಳಿತಾಯ ಸಲಹೆಗಳು**:

1. **ಶಿಕ్షಣಕ್ಕಾಗಿ ಫ್ರೀ ಟಿಯರ್ ಬಳಸಿ**:
   - App Service: F1 ಟಿಯರ್ ( ಉಚಿತ, hours ಮಿತಿಯಿದೆ )
   - SQL Database: Azure SQL Database serverless ಬಳಸಿ
   - Application Insights: 5GB/ತಿಂಗಳು ಉಚಿತ ಇಂಜೆಕ್ಷನ್

2. **ಬಳಸದಾಗ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಲ್ಲಿಸಿ**:
   ```sh
   # ವೆಬ್ ಅಪ್ಲಿಕೇಶನನ್ನು ನಿಲ್ಲಿಸಿ (ಡೇಟಾಬೇಸ್‌ಗಾಗಿ ಶುಲ್ಕ ಇನ್ನೂ ವಿಧಿಸಲಾಗುತ್ತದೆ)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # ಅಗತ್ಯವಾದಾಗ ಮರುಪ್ರಾರಂಭಿಸಿ
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **ಪರೀಕ್ಷೆಯ ನಂತರ ಎಲ್ಲವನ್ನೂ ಅಳಿಸಿ**:
   ```sh
   azd down
   ```
   ಇದರಿಂದ سڀ ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳು ಅಳಿಸಲಾಗುವುದು ಮತ್ತು ಶುಲ್ಕಗಳು ನಿಲ್ಲಿವು.

4. **ಅಭಿವೃದ್ಧಿ vs. ಉತ್ಪಾದನೆ SKUs**:
   - **ಅಭಿವೃದ್ಧಿ**: ಈ ಉದಾಹರಣೆಯಲ್ಲಿ ಬಳಸಲಾದ Basic ಟಿಯರ್
   - **ಉತ್ಪಾದನೆ**: redundancy ಇರುವ Standard/Premium ಟಿಯರ್

**ವೆಚ್ಚ ಗಮನವಿಟ್ಟು ಕೇರ್**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) ನಲ್ಲಿ ವೆಚ್ಚಗಳನ್ನು ನೋಡಿ
- ಆಘಾತಗಳನ್ನು ತಪ್ಪಿಸಲು ವೆಚ್ಚ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
- ಟ್ರ್ಯಾಕಿಂಗ್‌ಗಾಗಿ ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳಿಗೆ `azd-env-name` ಟ್ಯಾಗ್ ನೀಡಿ

**ಉಚಿತ ಟಿಯರ್ ಪರ್ಯಾಯ**:
ಅಧ್ಯಯನಕ್ಕಾಗಿ, ನೀವು `infra/resources/app-service-plan.bicep` ಅನ್ನು ತಿದ್ದುಕೊಡಬಹುದು:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**ಸೂಚನೆ**: ಉಚಿತ ಟಿಯರ್‌ಗಳಿಗೆ ಮಿತಿ ಇದೆ (60 ನಿಮಿ/ದಿನ CPU, ಯಾವಾಗಲೂ-ಆನ್ ಇಲ್ಲ).

## ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ದೃಶ್ಯತೆ

### Application Insights ಸಮನ್ವಯ

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ ವಿಸ್ತೃತ ಮಾನಿಟರಿಂಗ್‌ಗೆ **Application Insights** ಸೇರಿಸಲಾಗಿದೆ:

**ಯಾವುವು கணಿತವಾಗುತ್ತಿದೆ**:
- ✅ HTTP ವಿನಂತಿಗಳು (ಲೆಾಟೆನ್ಸಿ, ಸ್ಥಿತಿಗೊಡೆ, ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು)
- ✅ ಅಪ್ಲಿಕೇಶನ್ ದೋಷಗಳು ಮತ್ತು исключенияಗಳು
- ✅ Flask ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಕಸ್ಟಮ್ ಲಾಗಿಂಗ್
- ✅ ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ಆರೋಗ್ಯ
- ✅ ಪ್ರದರ್ಶನ ಮ್ಯೆಟ್ರಿಕ್ಸ್ (CPU, ಮೆಮರಿ)

**Application Insights ಅನ್ನು ಪ್ರವೇಶಿಸುವುದು**:
1. [Azure Portal](https://portal.azure.com) ತೆರೆಯಿರಿ
2. ನಿಮ್ಮ resource group (`rg-<env-name>`) ಗೆ ನ್ಯಾವಿಗೇಟ್ ಮಾಡಿ
3. Application Insights ಸಂಪನ್ಮೂಲ (`appi-<unique-id>`) ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ

**ಉಪಯುಕ್ತ ಪ್ರಶ್ನೆಗಳು** (Application Insights → Logs):

**ಎಲ್ಲಾ ವಿನಂತಿಗಳನ್ನು ನೋಡಿ**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**ದೋಷಗಳನ್ನು ಹುಡುಕಿ**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**ಹೆಲ್ತ್ ಎಂಡ್ಪಾಯಿಂಟ್ ಪರಿಶೀಲಿಸಿ**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database ಆಡಿಟಿಂಗ್

**SQL Database auditing ಸಕ್ರಿಯವಾಗಿದೆ** ಟ್ರ್ಯಾಕ್ ಮಾಡಲು:
- ಡೇಟಾಬೇಸ್ ಪ್ರವೇಶ ಮಾದರಿಗಳು
- ವಿಫಲ ಲಾಗಿನ್ ಪ್ರಯತ್ನಗಳು
- ಸ್ಕೀಮಾ ಬದಲಾವಣೆಗಳು
- ಡೇಟಾ ಪ್ರವೇಶ (ಕಂಪ್ಲಯನ್ಸ್‌ಗಾಗಿ)

**ಆಡಿಟ್ ಲಾಗ್‌ಗಳನ್ನು ಪ್ರವೇಶಿಸುವುದು**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics workspace ನಲ್ಲಿ ಲಾಗ್‌ಗಳನ್ನು ನೋಡಿ

### ರಿಯಲ್-ಟೈಮ್ ಮಾನಿಟರಿಂಗ್

**ಲೈವ್ ಮ್ಯೆಟ್ರಿಕ್ಸ್ ನೋಡಿರಿ**:
1. Application Insights → Live Metrics
2. ರಿಯಲ್-ಟೈಮ್‌ನಲ್ಲಿ ವಿನಂತಿಗಳು, ವಿಫಲತೆಗಳು ಮತ್ತು ಪ್ರದರ್ಶನವನ್ನು ನೋಡಿ

**ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ**:
ಗಂಭೀರ ಘಟನೆಗಳಿಗಾಗಿ ಎಚ್ಚರಿಕೆಗಳನ್ನು ರಚಿಸಿ:
- HTTP 500 ದೋಷಗಳು > 5 within 5 ನಿಮಿಷಗಳು
- ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ವಿಫಲತೆಗಳು
- ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯ ಹೆಚ್ಚಿನದು (>2 ಸೆಕೆಂಡುಗಳು)

**ಎಚ್ಚರಿಕೆ ಸೃಷ್ಟಿಸುವ ಉದಾಹರಣೆ**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## ಸಮಸ್ಯೆ ಪರಿಹಾರ

### ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು

#### 1. `azd provision` "Location not available" ಎಂಬ ದೋಷದೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ

**ಲಕ್ಷಣ**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**ಪರಿಹಾರ**:
ಬೇರೊಂದು Azure ಪ್ರದೇಶವನ್ನು ಆರಿಸಿ ಅಥವಾ ರೆಸೋರ್ಸ್ ಪ್ರೊವೈಡರ್ ಅನ್ನು ನೋಂದಣಿ ಮಾಡಿ:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. ನಿಯೋಜನೆ ಸಮಯದಲ್ಲಿ SQL ಸಂಪರ್ಕ ವಿಫಲವಾಗಿದೆ

**ಲಕ್ಷಣ**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**ಪರಿಹಾರ**:
- SQL Server ಫೈರ್‌ವಾಲ್ Azure ಸೇವೆಗಳಿಗೆ ಅನುಮತಿಸುತ್ತದೆ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ (ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಂರಚಿತ)
- `azd provision` ನ ಸಂದರ್ಭದಲ್ಲಿ SQL ನಿರ್ವಾಹಕ ಗುಪ್ತಪದವನ್ನು ಸರಿಯಾಗಿ ನಮೂದಿಸಲಾಗಿದೆ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ
- SQL Server ಸಂಪೂರ್ಣವಾಗಿ provision ಆಗಿರುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ (ಇದು 2-3 ನಿಮಿಷಗಳಾಗಬಹುದು)

**ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ**:
```sh
# Azure ಪೋರ್ಟಲ್‌ನಿಂದ, SQL ಡೇಟಾಬೇಸ್ → ಕ್ವೇರಿ ಸಂಪಾದಕಕ್ಕೆ ಹೋಗಿ
# ನಿಮ್ಮ ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ಬಳಸಿ ಸಂಪರ್ಕಿಸಲು ಪ್ರಯತ್ನಿಸಿ
```

#### 3. ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ "Application Error" ಅನ್ನು ತೋರಿಸುತ್ತದೆ

**ಲಕ್ಷಣ**:
ಬ್ರೌಸರ್ ಸಾಮಾನ್ಯ ದೋಷ ಪುಟವನ್ನು ತೋರಿಸುತ್ತದೆ.

**ಪರಿಹಾರ**:
ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:
```sh
# ಇತ್ತೀಚಿನ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**ಸಾಮಾನ್ಯ ಕಾರಣಗಳು**:
- ಪರಿಸರ ಚರಗಳು ಕಾಣೆಯಾಗಿವೆ (App Service → Configuration ಪರಿಶೀಲಿಸಿ)
- Python ಪ್ಯಾಕೇಜ್ ಸ್ಥಾಪನೆ ವಿಫಲವಾಗಿದೆ (ನಿಯೋಜನೆ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ)
- ಡೇಟಾಬೇಸ್ ಆರಂಭಿಕಕರಣ ದೋಷ (SQL ಸಂಪರ್ಕತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ)

#### 4. `azd deploy` "Build Error" ಎಂಬ ದೋಷದೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ

**ಲಕ್ಷಣ**:
```
Error: Failed to build project
```

**ಪರಿಹಾರ**:
- `requirements.txt` ನಲ್ಲಿ ಯಾವುದೇ ಸಿಂಟ್ಯಾಕ್ಸ್ ದೋಷಗಳಿಲ್ಲವೆಂದು ಖಚಿತಪಡಿಸಿ
- `infra/resources/web-app.bicep` ನಲ್ಲಿ Python 3.11 ಸೂಚಿಸಲಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
- Dockerfile ನಲ್ಲಿ ಸರಿಯಾದ base image ಇದೆ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ

**ಸ್ಥಳೀಯವಾಗಿ ಡಿಬಗ್ ಮಾಡಿ**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD ಆಜ್ಞೆಗಳು ಚಾಲನೆ ಮಾಡುವಾಗ "Unauthorized" ಬರುತ್ತದೆ

**ಲಕ್ಷಣ**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**ಪರಿಹಾರ**:
Azure ಗೆ ಮರು-ಪ್ರಮಾಣೀಕರಣ ಮಾಡಿ:
```sh
azd auth login
az login
```

ಸಬ್ಸ್ಕ್ರಿಪ್‌ಶನ್‌ನಲ್ಲಿ ನಿಮಗೆ ಸರಿಯಾದ ಅನುಮತಿಗಳು (Contributor ಪಾತ್ರ) ಇದ್ದಾರೆ ಎಂದು ಪರಿಶೀಲಿಸಿ.

#### 6. ಡೇಟಾಬೇಸ್ ವೆಚ್ಚಗಳು ಹೆಚ್ಚಿನದು

**ಲક્ષણ**:
ಅನಿರೀಕ್ಷಿತ Azure ಬಿಲ್.

**ಪರಿಹಾರ**:
- ಪರೀಕ್ಷೆಯ ನಂತರ `azd down` ಅನ್ನು ನಡೆಸಲು ಮರೆತಿರುವುದಿಲ್ಲವೆಂದು ಪರಿಶೀಲಿಸಿ
- SQL Database Basic ಟಿಯರ್ ಬಳಸುತ್ತಿದೆ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ (Premium ಅಲ್ಲ)
- Azure Cost Management ನಲ್ಲಿ ವೆಚ್ಚಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
- ವೆಚ್ಚ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಹೊಂದಿಸಿ

### ಸಹಾಯ ಪಡೆಯಲು

**ಎಲ್ಲಾ AZD ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ**:
```sh
azd env get-values
```

**ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳಿಗೆ ಪ್ರವೇಶ ಪಡೆಯಿರಿ**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**ಹೆಚ್ಚಿನ ಸಹಾಯ ಬೇಕೆ?**
- [AZD ಸಮಸ್ಯೆ ಪರಿಹಾರ ಗೈಡ್](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service ಸಮಸ್ಯೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL ಸಮಸ್ಯೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ (ಆರಂಭಿಕ)

**ಉದ್ದೇಶ**: ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳು ನಿಯೋಜಿಸಲಾಗಿದೆ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೇ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ.

**ಹಂತಗಳು**:
1. ನಿಮ್ಮ ರಿಸೋರ್ಸ್ ಗುಂಪಿನಲ್ಲಿ ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **ನಿರೀಕ್ಷಿತ**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. ಎಲ್ಲಾ API ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **ನಿರೀಕ್ಷಿತ**: ಎಲ್ಲಾ ದೋಷರಹಿತ ಮಾನ್ಯ JSON ಅನ್ನು 반환ಿಸುತ್ತವೆ

3. Application Insights ಅನ್ನು ಪರಿಶೀಲಿಸಿ:
   - Azure Portal ನಲ್ಲಿ Application Insights ಗೆ ಹೋಗಿ
   - "Live Metrics" ಗೆ ಹೋಗಿ
   - ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಬ್ರೌಸರ್ ಅನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ
   **ನಿರೀಕ್ಷಿತ**: ರಿಯಲ್-ಟೈಮ್‌ನಲ್ಲಿ ವಿನಂತಿಗಳು ಕಾಣಿಸಿಕೊಳ್ಳುತ್ತವೆ

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು**: ಎಲ್ಲಾ 6-7 ಸಂಪನ್ಮೂಲಗಳು ಅಸ್ತಿತ್ವದಲ್ಲಿರುತ್ತವೆ, ಎಲ್ಲಾ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು ಡೇಟಾ 반환ಿಸುತ್ತವೆ, Live Metrics ಚಟುವಟಿಕೆಯನ್ನು ತೋರಿಸುತ್ತದೆ.

---

### ಅಭ್ಯಾಸ 2: ಹೊಸ API ಎಂಡ್‌ಪಾಯಿಂಟ್ ಸೇರಿಸಿ (ಮಧ್ಯಂತರ)

**ಉದ್ದೇಶ**: ಹೊಸ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ನೊಂದಿಗೆ Flask ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ವಿಸ್ತರಿಸಿ.

**ಆರಂಭಿಕ ಕೋಡ್**: ಪ್ರಸ್ತುತ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು `src/web/app.py` ನಲ್ಲಿ

**ಹಂತಗಳು**:
1. `src/web/app.py` ಅನ್ನು ಸಂಪಾದಿಸಿ ಮತ್ತು `get_product()` ಫಂಕ್ಷನ್ ನಂತರ ಹೊಸ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಸೇರಿಸಿ:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. ನವೀಕೃತ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ:
   ```sh
   azd deploy
   ```

3. ಹೊಸ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **ನಿರೀಕ್ಷಿತ**: "laptop" ಗೆ ಹೊಂದಿಕೊಳ್ಳುವ ಉತ್ಪನ್ನಗಳನ್ನು 반환ಿಸುತ್ತದೆ

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು**: ಹೊಸ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ, ಶೋಧಿತ ಫಲಿತಾಂಶಗಳನ್ನು 반환ಿಸುತ್ತದೆ, Application Insights ಲಾಗ್‌ಗಳಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ.

---

### ಅಭ್ಯಾಸ 3: ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೇರಿಸಿ (ಉನ್ನತ)

**ಉದ್ದೇಶ**: ಎಚ್ಚರಿಕೆಗಳೊಂದಿಗೆ ಪ್ರೊಆಕ್ಟಿವ್ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಸ್ಥಾಪಿಸಿ.

**ಹಂತಗಳು**:
1. HTTP 500 ದೋಷಗಳಿಗೆ ಎಚ್ಚರಿಕೆ ನಿಯಮವನ್ನು ರಚಿಸಿ:
   ```sh
   # Application Insights ಸಂಪನ್ಮೂಲ ID ಅನ್ನು ಪಡೆಯಿರಿ
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # ಎಚ್ಚರಿಕೆ ಸೃಷ್ಟಿಸಿ
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. ದೋಷಗಳನ್ನು ಉಂಟುಮಾಡಿ ಎಚ್ಚರಿಕೆಯನ್ನು ಟ್ರಿಗರ್ ಮಾಡಿ:
   ```sh
   # ಅಸ್ತಿತ್ವದಲ್ಲಿಲ್ಲದ ಉತ್ಪನ್ನವನ್ನು ವಿನಂತಿಸು
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. ಎಚ್ಚರಿಕೆ ಕಾರ್ಯಗತವಾಗಿದೆ ಅಥವಾ ಇಲ್ಲವೋ ಪರಿಶೀಲಿಸಿ:
   - Azure Portal → Alerts → Alert Rules
   - ನಿಮ್ಮ ಇಮೇಲ್ ಪರಿಶೀಲಿಸಿ (ಸೆಟ್ ಮಾಡಿದ್ದರೆ)

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು**: ಎಚ್ಚರಿಕೆ ನಿಯಮ ರಚಿಸಲಾಗಿದೆ, ದೋಷಗಳ ಮೇಲೆ ಟ್ರಿಗರ್ ಆಗುತ್ತದೆ, ಸೂಚನೆಗಳನ್ನು ಸ್ವೀಕರಿಸಲಾಗಿದೆ.

---

### ಅಭ್ಯಾಸ 4: ಡೇಟಾಬೇಸ್ ಸ್ಕೀಮಾ ಬದಲಾವಣೆಗಳು (ಉನ್ನತ)

**ಉದ್ದೇಶ**: ಹೊಸ ಟೇಬಲ್ ಅನ್ನು ಸೇರಿಸಿ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಅದನ್ನು ಬಳಸುವಂತೆ ಬದಲಾಯಿಸಿ.

**ಹಂತಗಳು**:
1. Azure Portal Query Editor ಮೂಲಕ SQL Database ಗೆ ಸಂಪರ್ಕಿಸಿ

2. ಹೊಸ `categories` ಟೇಬಲ್ ರಚಿಸಿ:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. ಪ್ರತಿಕ್ರಿಯೆಗಳಲ್ಲಿ ವರ್ಗ ಮಾಹಿತಿಯನ್ನು ಸೇರಿಸಲು `src/web/app.py` ನವೀಕರಿಸಿ

4. ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು**: ಹೊಸ ಟೇಬಲ್ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ, ಉತ್ಪನ್ನಗಳು ವರ್ಗ ಮಾಹಿತಿ ತೋರಿಸುತ್ತವೆ, ಅಪ್ಲಿಕೇಶನ್ ಇನ್ನೂ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ.

---

### ಅಭ್ಯಾಸ 5: ಕ್ಯಾಶಿಂಗ್ ಅನುಷ್ಟಾನಗೊಳಿಸಿ (ತಜ್ಞ)

**ಉದ್ದೇಶ**: ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಸುಧಾರಿಸಲು Azure Redis Cache ಅನ್ನು ಸೇರಿಸಿ.

**ಹಂತಗಳು**:
1. `infra/main.bicep` ಗೆ Redis Cache ಅನ್ನು ಸೇರಿಸಿ
2. ಉತ್ಪನ್ನದ ಪ್ರಶ್ನೆಗಳನ್ನು ಕ್ಯಾಶ್ ಮಾಡಲು `src/web/app.py` ನವೀಕರಿಸಿ
3. Application Insights ಬಳಸಿ ಕಾರ್ಯಕ್ಷಮತೆಯ ಸುಧಾರಣೆಯನ್ನು ಅಳೆಯಿರಿ
4. ಕ್ಯಾಶಿಂಗ್ ಮೊದಲು/ನಂತರ ಪ್ರತಿಕ್ರಿಯೆ ಕಾಲವನ್ನು ಹೋಲಿಸಿ

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು**: Redis ನಿಯೋಜಿಸಲಾಗಿದೆ, ಕ್ಯಾಶಿಂಗ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ, ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯಗಳು 50% ಕ್ಕಿಂತ ಹೆಚ್ಚು ಸುಧಾರಿತವಾಗಿರಬೇಕು.

**ಸೂಚನೆ**: ಪ್ರಾರಂಭಿಸಲು [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/) ಅನ್ನು ನೋಡಿ.

---

## ಸ್ವಚ್ಛಗೊಳಿಸುವಿಕೆ

ನಿರಂತರ ಶುಲ್ಕಗಳನ್ನು ತಡೆಯಲು, ಮುಗಿಸಿದ ನಂತರ ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಳಿಸಿ:

```sh
azd down
```

**ದೃಢೀಕರಣ ಕೇಳುವಿಕೆ**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` ಅನ್ನು ಟೈಪ್ ಮಾಡಿ ದೃಢೀಕರಿಸಲು.

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: 
- Azure Portal ನಿಂದ ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳು ಅಳಿಸಲಾಗಿದೆ
- ಯಾವುದೇ ನಿರಂತರ ಶುಲ್ಕಗಳಿಲ್ಲ
- ಸ್ಥಳೀಯ `.azure/<env-name>` ಫೋಲ್ಡರ್ ಅನ್ನು ಅಳಿಸಬಹುದು

**ವಿಕಲ್ಪ** (ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಉಳಿಸಿ, ಡೇಟಾ ಅಳಿಸಿ):
```sh
# ಕೆವಲ ಸಂಪನ್ಮೂಲ ಗುಂಪನ್ನು ಅಳಿಸಿ (AZD ಸಂರಚನೆಯನ್ನು ಉಳಿಸು)
az group delete --name rg-<env-name> --yes
```
## ಇನ್ನಷ್ಟು ತಿಳಿದುಕೊಳ್ಳಿ

### ಸಂಬಂಧಿತ ಡಾಕ್ಯುಮೆಂಟೇಷನ್
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/app-service/)
- [Application Insights ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep ಭಾಷಾ ಉಲ್ಲೇಖ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### ಕೋರ್ಸ್‌ನ ಮುಂದಿನ ಹಂತಗಳು
- **[Container Apps Example](../../../../examples/container-app)**: Azure Container Apps ಬಳಸಿ ಮೈಕ್ರೋಸರ್ವಿಸ್ಗಳನ್ನು ನಿಯೋಜಿಸಿ
- **[AI Integration Guide](../../../../docs/ai-foundry)**: ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ AI ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಸೇರಿಸಿ
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: ಉತ್ಪಾದನಾ ನಿಯೋಜನೆ ಮಾದರಿಗಳು

### ಉನ್ನತ ವಿಷಯಗಳು
- **Managed Identity**: ಪಾಸ್‌ವರ್ಡ್‌ಗಳನ್ನು ತೆಗೆದುಹಾಕಿ ಮತ್ತು Azure AD ಪ್ರಮಾಣೀಕರಣವನ್ನು ಬಳಸಿ
- **Private Endpoints**: ವರ್ಚುವಲ್ ನೆಟ್‌ವರ್ಕ್ ಒಳಗೆ ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕಗಳನ್ನು ಭದ್ರಗೊಳಿಸಿ
- **CI/CD Integration**: GitHub Actions ಅಥವಾ Azure DevOps ನೊಂದಿಗೆ ನಿಯೋಜನೆಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ
- **Multi-Environment**: dev, staging ಮತ್ತು production ಪರಿಸರಗಳನ್ನು ಹೊಂದಿಸಿ
- **Database Migrations**: ಸ್ಕೀಮಾ ವರ್ಝನಿಂಗ್‌ಗೆ Alembic ಅಥವಾ Entity Framework ಬಳಸಿ

### ಇತರ ವಿಧಾನಗಳೊಂದಿಗೆ ಹೋಲಿಕೆ

**AZD vs. ARM ಟೆಂಪ್ಲೇಟ್ಸ್**:
- ✅ AZD: ಮೇಲ್ಮಟ್ಟದ ಅಭಿವ್ಯಕ್ತಿ, ಸರಳ ಆಜ್ಞೆಗಳು
- ⚠️ ARM: ಹೆಚ್ಚು ವಿವರಣಾತ್ಮಕ, ಸೂಕ್ಷ್ಮ ನಿಯಂತ್ರಣ

**AZD vs. Terraform**:
- ✅ AZD: Azure-ನೇಟಿವ್, Azure ಸೇವೆಗಳೊಂದಿಗೆ ಏಕೀಕೃತ
- ⚠️ Terraform: ಬಹು-ಕ್ಲೌಡ್ ಬೆಂಬಲ, ದೊಡ್ಡ ಇಕೋಸಿಸ್ಟಮ್

**AZD vs. Azure Portal**:
- ✅ AZD: ಪುನರಾವರ್ತನೀಯ, ವರ್ಝನ್-ನಿಯಂತ್ರಿತ, ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಬಹುದಾದ
- ⚠️ Portal: ಕೈಯೊಂದಿಗೆ ಕ್ಲಿಕ್ ಮಾಡುವಿಕೆ, ಪುನಃ ಉತ್ಪಾದಿಸಲು ಕಷ್ಟ

**AZD ಅನ್ನು ಈ ರೀತಿಯಾಗಿ ಯೋಚಿಸಿ**: Azure ಗೆ Docker Compose — ಸಂಕೀರ್ಣ ನಿಯೋಜನೆಗಳಿಗೆ ಸರಳಗೊಳಿಸಿದ ಸಂರಚನೆ.

---

## ಹೆಚ್ಚಾಗಿ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು

**Q: ನಾನು ಬೇರೆ ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆ ಬಳಸಬಹುದುವೇ?**  
A: ಹೌದು! `src/web/` ಅನ್ನು Node.js, C#, Go, ಅಥವಾ ಯಾವುದೇ ಭಾಷೆಯೊಂದಿಗೆ ಬದಲಾಯಿಸಿ. ಅಗತ್ಯವಾಗಿ `azure.yaml` ಮತ್ತು Bicep ನವೀಕರಿಸಿ.

**Q: ಇನ್ನಷ್ಟು ಡೇಟಾಬೇಸ್‌ಗಳನ್ನು ನಾನು ಹೇಗೆ ಸೇರಿಸಬಹುದು?**  
A: ಮತ್ತೊಂದು SQL Database ಮಾಡ್ಯೂಲ್ ಅನ್ನು `infra/main.bicep` ಗೆ ಸೇರಿಸಿ ಅಥವಾ Azure Database ಸೇವೆಗಳಿಂದ PostgreSQL/MySQL ಬಳಸಿರಿ.

**Q: ಇದನ್ನು ಉತ್ಪಾದನೆಯಲ್ಲಿ ಬಳಸಬಹುದುವೇ?**  
A: ಇದು ಪ್ರಾರಂಭಿಕ ಬಿಂದುವಾಗಿದೆ. ಉತ್ಪಾದನೆಗಾಗಿ ಸೇರಿಸಬೇಕಾದವು: managed identity, private endpoints, redundancy, ಬ್ಯಾಕಪ್ ತಂತ್ರ, WAF, ಮತ್ತು ಹೆಚ್ಚಿಸಿದ ಮಾನಿಟರಿಂಗ್.

**Q: ಕೋಡ್ ನಿಯೋಜನೆಯ ಬದಲು ಕಂಟೈನರ್‌ಗಳನ್ನು ಬಳಸಲು ನಾನು ಪ್ರಯತ್ನಿಸಿದರೆ ಏನು?**  
A: Docker ಕಂಟೈನರ್‌ಗಳನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಬಳಸಿ ಉದಾಹರಣೆಗೆ [Container Apps Example](../../../../examples/container-app) ನೋಡಿ.

**Q: ನಾನು ಸ್ಥಳೀಯ ಯಂತ್ರದಿಂದ ಡೇಟಾಬೇಸ್‌ರಿಗೆ ಹೇಗೆ ಸಂಪರ್ಕಿಸಬಹುದು?**  
A: ನಿಮ್ಮ IP ಅನ್ನು SQL Server ಫೈರ್‌ವಾಲ್‌ಗೆ ಸೇರಿಸಿ:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: ಹೊಸದನ್ನು ರಚಿಸುವ ಬದಲು ಇರುವ ಡೇಟಾಬೇಸ್ ಬಳಸಿಬಹುದುವೇ?**  
A: ಹೌದು, ಇತ್ತೀಚಿನ SQL Server ಅನ್ನು ಉಲ್ಲೇಖಿಸಲು `infra/main.bicep` ನವೀಕರಿಸಿ ಮತ್ತು ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್ ಪ್ಯಾರಾಮೀಟರ್ಗಳನ್ನು ಅಪ್‌ಡೆಟ್ ಮಾಡಿ.

---

> **ಗಮನಿಸಿ:** ಈ ಉದಾಹರಣೆ AZD ಬಳಸಿ ಡೇಟಾಬೇಸ್‌ ಜೊತೆಗೆ ವೆಬ್ ಆ್ಯಪ್ ಅನ್ನು ನಿಯೋಜಿಸುವ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ. ಇದರಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಕೋಡ್, ಸಮಗ್ರ ದಸ್ತಾವೇಜಾತ್ಮಕತೆ ಮತ್ತು ಕಲಿಕೆಯನ್ನು ಬಲಪಡಿಸುವ ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸಗಳಿವೆ. ಉತ್ಪಾದನಾ ನಿಯೋಜನೆಗಳಿಗಾಗಿ, ನಿಮ್ಮ ಸಂಸ್ಥೆಗೆ ವಿಶೇಷವಾದ ಭದ್ರತೆ, ಸ್ಕೇಲಿಂಗ್, ಅನುಕೂಲತೆ ಮತ್ತು ವೆಚ್ಚ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ.

**📚 ಕೋರ್ಸ್ ನ್ಯಾವಿಗೇಶನ್:**
- ← ಹಿಂದೆ: [Container Apps Example](../../../../examples/container-app)
- → ಮುಂದೆ: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [ಕೋರ್ಸ್ ಹೋಮ್](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಕಾಯ್ದುಕೊಳ್ಳಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ — ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅನಿಖರತೆಗಳಿರಬಹುದಾಗಿದೆ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆಯನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸುಿಸಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಗೊಂದಲಗಳು ಅಥವಾ ತಪ್ಪಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಂತಹ ಪರಿಣಾಮಗಳಿಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->