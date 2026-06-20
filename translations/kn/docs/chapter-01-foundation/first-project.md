# ನಿಮ್ಮ ಮೊದಲ ಯೋಜನೆ - ಪ್ರಾಯೋಗಿಕ ಟ್ಯುಟೋರಿಯಲ್

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ಪರಿಚಯ

ನಿಮ್ಮ ಮೊದಲ Azure Developer CLI ಪ್ರಾಜೆಕ್ಟಿಗೆ ಸ್ವಾಗತ! ಈ ಸಂಪೂರ್ಣ ಪ್ರಾಯೋಗಿಕ ಟ್ಯುಟೋರಿಯಲ್ azd ಬಳಸಿ React ಫ್ರಂಟ್‌ಎಂಡ್, Node.js API ಬ್ಯಾಕೆಂಡ್ ಮತ್ತು MongoDB ಡೇಟಾಬೇಸ್ ಹೊಂದಿರುವ ಪೂರ್ಣ ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ರಚಿಸುವುದು, ನಿಯೋಜಿಸುವುದು ಮತ್ತು ನಿರ್ವಹಿಸುವುದನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ವಿವರಿಸುತ್ತದೆ.

## ಅಧ್ಯಯನ ಗುರಿಗಳು

ಈ ಟ್ಯುಟೋರಿಯಲ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬಳಸಿ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸುವ ಕಾರ್ಯಪ್ರವಾಹದಲ್ಲಿ ಪರಿಣತಿ ಪಡೆಯುವುದು
- Azure Developer CLI ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಸಂರಚನಾ ಫೈಲ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವಿಧಾನ ಸೇರಿದಂತೆ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ಸಂಪೂರ್ಣವಾಗಿ ನಿಯೋಜಿಸುವುದು
- ಅಪ್ಲಿಕೇಶನ್ ಅಪ್ಡೇಟ್ಗಳು ಮತ್ತು ಮರುನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
- ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್ ಗಾಗಿ ಹಲವು ವಾತಾವರಣಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು
- ಸಂಪನ್ಮೂಲಗಳ ತೆರವುಗೊಳಿಸುವಿಕೆ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣಾ ಅಭ್ಯಾಸಗಳನ್ನು ಅನ್ವಯಿಸುವುದು

## ಅಧ್ಯಯನ ಫಲಿತಾಂಶಗಳು

ಸಂಪೂರ್ಣಗೊಳಿಸಿದಾಗ, ನೀವು ಸಾಧ್ಯವಾಗುವುದು:
- ಟೆಂಪ್ಲೇಟ್ಅಂದಿಂದ ಸ್ವತಃ azd ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಲು ಮತ್ತು ಸಂರಚಿಸಲು
- azd ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನಾವಿಗೇಟ್ ಮತ್ತು ಪರಿಷ್ಕರಿಸಲು
- ಏಕ ಒಡನಾಟದ ಕಮಾಂಡ್‌ಗಳ ಮೂಲಕ ಪೂರ್ಣ-ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್ಗಳನ್ನು Azure ಗೆ ನಿಯೋಜಿಸಲು
- ಸಾಮಾನ್ಯ ನಿಯೋಜನಾ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣಾ ಸಮಸ್ಯೆಗಳನ್ನು ತಿದ್ದಲು
- ವಿಭಿನ್ನ ನಿಯೋಜನೆ ಹಂತಗಳಿಗೆ ಅನೇಕ Azure ವಾತಾವರಣಗಳನ್ನು ನಿರ್ವಹಿಸಲು
- ಅಪ್ಲಿಕೇಶನ್ ಅಪ್ಡೇಟ್ಗಳಿಗಾಗಿ ನಿರಂತರ ನಿಯೋಜನೆ ವರ್ಕ್ಫ್ಲೋಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದನ್ನು

## ಆರಂಭಿಸುವುದು

### ಪೂರ್ವಶರತ್ತುಗಳ ಪರಿಶೀಲನಾ ಪಟ್ಟಿ
- ✅ Azure Developer CLI ಸ್ಥಾಪಿಸಲಾಗಿದೆ ([ಸ್ಥಾಪನೆ ಮಾರ್ಗದರ್ಶಿ](installation.md))
- ✅ azd ಮೂಲಕ ದೃಢೀಕರಣ (ಹೆಚ್ಚಿನ ಮಾಹಿತಿಗೆ `azd auth login`)
- ✅ ನಿಮ್ಮ ಸಿಸ್ಟಮಿನಲ್ಲಿ Git ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- ✅ Node.js 16+ (ಈ ಟ್ಯುಟೋರಿಯಲ್ ಗಾಗಿ)
- ✅ Visual Studio Code (ಶಿಫಾರಸು)

ಮುಂದಕ್ಕೆ ಹೋಗುವುದಕ್ಕಿಂತ ಮೊದಲು, ರೆಪೊರಿಟರಿ ರೂಟ್‌ನಿಂದ ಸೆಟ್‌ಅಪ್-validator ಅನ್ನು ಚಲಾಯಿಸಿ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ನಿಮ್ಮ ಸೆಟ್‌ಅಪ್ ಪರಿಶೀಲಿಸಿ
```bash
# azd ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# AZD ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
azd auth login --check-status
```

### ಐಚ್ಛಿಕ Azure CLI ದೃಢೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ

```bash
az account show
```

### Node.js ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
```bash
node --version
```

## ಹಂತ 1: ಟೆಂಪ್ಲೇಟನ್ನು ಆಯ್ಕೆ ಮಾಡಿ ಮತ್ತು ಪ್ರಾರಂಭಿಸಿ

React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು Node.js API ಬ್ಯಾಕೆಂಡ್ ಹೊಂದಿರುವ ಜನಪ್ರಿಯ todo ಅಪ್ಲಿಕೇಶನ್ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸೋಣ.

```bash
# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
azd template list

# ಟುಡೋ ಆ್ಯಪ್ ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಅನುಸರಿಸಿ:
# - ಪರಿಸರದ ಹೆಸರನ್ನು ನಮೂದಿಸಿರಿ: "dev"
# - ಚಂದಾದಾರಿಕೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ (ನಿಮಗೆ ಹಲವು ಇದ್ದರೆ)
# - ಪ್ರದೇಶವನ್ನು ಆಯ್ಕೆಮಾಡಿ: "East US 2" (ಅಥವಾ ನಿಮ್ಮ ಇಚ್ಛಿತ ಪ್ರದೇಶ)
```

### ಈಗ ಏನಾಯಿತು?
- ಟೆಂಪ್ಲೇಟಿನ ಕೋಡ್ ಅನ್ನು ನಿಮ್ಮ ಸ್ಥಳೀಯ ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಯಿತು
- ಸೇವೆಗಳ ವ್ಯಾಖ್ಯಾನಗಳೊಂದಿಗೆ `azure.yaml` ಫೈಲ್ ಸೃಷ್ಟಿಸಲಾಯಿತು
- `infra/` ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ ಕೋಡ್ ಸೆಟ್ ಅಪ್ ಮಾಡಲಾಯಿತು
- ಒಂದು ವಾತಾವರಣ ಸಂರಚನೆ ರಚಿಸಲಾಯಿತು

## ಹಂತ 2: ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಯನ್ನು ಪರಿಷೀಲಿಸಿ

azd ನಮಗೆ ಏನು ರಚಿಸಿತು ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸೋಣ:

```bash
# ಪ್ರಾಜೆಕ್ಟಿನ ರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
tree /f   # ವಿಂಡೋಸ್
# ಅಥವಾ
find . -type f | head -20   # ಮ್ಯಾಕ್‌ಒಎಸ್/ಲಿನಕ್ಸ
```

ನೀವು ನೋಡಬೇಕು:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಪ್ರಮುಖ ಫೈಲ್‌ಗಳು

**azure.yaml** - ನಿಮ್ಮ azd ಪ್ರಾಜೆಕ್ಟಿನ ಹೃದಯ:
```bash
# ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
cat azure.yaml
```

**infra/main.bicep** - ಮೂಲಸೌಕರ್ಯ ವ್ಯಾಖ್ಯಾನ:
```bash
# ಮೂಲಸೌಕರ್ಯದ ಕೋಡ್ ಅನ್ನು ವೀಕ್ಷಿಸಿ
head -30 infra/main.bicep
```

## ಹಂತ 3: ನಿಮ್ಮ ಪ್ರాజೆಕ್ಟ್ ಅನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ (ಐಚ್ಛಿಕ)

ನಿಯೋಜಿಸುವ ಮೊದಲು, ನೀವು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಕಸ್ಟಮೈಜ್ ಮಾಡಬಹುದು:

### ಫ್ರಂಟ್‌ಎಂಡ್ ಅನ್ನು ಪರಿಷ್ಕರಿಸಿ
```bash
# React ಆಪ್ ಕಂಪೋನಂಟ್ ತೆರೆಯಿರಿ
code src/web/src/App.tsx
```

ಸರಳ ಬದಲಾವಣೆಯನ್ನು ಮಾಡಿ:
```typescript
// ಶೀರ್ಷಿಕೆಯನ್ನು ಕಂಡು ಅದನ್ನು ಬದಲಿಸಿ
<h1>My Awesome Todo App</h1>
```

### ವಾತಾವರಣ ಚರಾಗಳನ್ನು ಸಂರಚಿಸಿ
```bash
# ಸ್ವನಿರ್ದಿಷ್ಟ ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values
```

## ಹಂತ 4: Azure ಗೆ ನಿಯೋಜಿಸಿ

ಇಗೋ ರೋಚಕ ಭಾಗ — ಎಲ್ಲವನ್ನೂ Azure ಗೆ ನಿಯೋಜಿಸೋಣ!

```bash
# ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಈ ಕಮಾಂಡ್ ಕೆಳಗಿನವುಗಳನ್ನು ಮಾಡುತ್ತದೆ:
# 1. Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸಿ (App Service, Cosmos DB ಇತ್ಯಾದಿ)
# 2. ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿರ್ಮಿಸಿ
# 3. ಒದಗಿಸಿದ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ನಿಯೋಜಿಸಿ
# 4. ಅಪ್ಲಿಕೇಶನ್ URL ಅನ್ನು ಪ್ರದರ್ಶಿಸಿ
```

### ನಿಯೋಜನೆಯ ಸಮಯದಲ್ಲಿ ಏನಾಗುತ್ತಿದೆ?

`azd up` ಕಮಾಂಡ್ ಈ ಹಂತಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ:
1. **Provision** (`azd provision`) - Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುತ್ತದೆ
2. **Package** - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಕಟ್ಟುತ್ತದೆ
3. **Deploy** (`azd deploy`) - ಕೋಡ್ ಅನ್ನು Azure ಸಂಪನ್ಮೂಲಗಳಿಗೆ ನಿಯೋಜಿಸುತ್ತದೆ

### ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ಹಂತ 5: ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಪ್ರವೇಶಿಸಿ
ನಿಯೋಜನೆ ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ನೀಡಲಾದ URL ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ, ಅಥವಾ ಯಾವಾಗ ಬೇಕಾದರೂ ಅದನ್ನು ಪಡೆಯಿರಿ:
```bash
# ಆಪ್‌ಲಿಕೇಶನ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show

# ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಆಪ್‌ಲಿಕೇಶನ್ ತೆರೆಯಿರಿ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
1. **ಒಂದು todo ಐಟಂ ಸೇರಿಸಿ** - "Add Todo" ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ ಮತ್ತು ಒಂದು ಕಾರ್ಯವನ್ನು ನಮೂದಿಸಿ
2. **ಸಂಪೂರ್ಣವಾಗಿ ಗುರುತಿಸಿ** - ಪೂರ್ಣಗೊಳಿಸಿದ ಐಟಂಗಳನ್ನು ಟೆಕ್ ಮಾಡಿ
3. **ಐಟಂಗಳನ್ನು ಅಳಿಸಿ** - ನೀವು ಮತ್ತೊಂದು ಬಾರದ esos todoಗಳನ್ನು удалಿಸಿ

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
```bash
# ನಿಮ್ಮ ಸಂಪನ್ಮೂಲಗಳಿಗಾಗಿ Azure ಪೋರ್ಟ್‌ಲ್ ತೆರೆಯಿರಿ
azd monitor

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live
```

### ✅ ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ

ಮುಂದಕ್ಕೆ ಹೋಗುವ ಮುನ್ನ, ಎಲ್ಲವೂ ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡುತ್ತಿರುವುದನ್ನು ದೃಢೀಕರಿಸಲು ಈ ತ್ವರಿತ ಪರಿಶೀಲನಾ ಪಟ್ಟಿಯನ್ನು ಅನುಸರಿಸಿ—"deploy succeeded" ಎಂದರೇ "app works" ಎನ್ನಿಕೊಳ್ಳಬೇಡಿ:

```bash
# 1. ಎಂಡ್ಪಾಯಿಂಟ್ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆಯೇ ಮತ್ತು ಅದಕ್ಕೆ ತಲುಪಬಹುದೇ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
azd show

# 2. ಎಂಡ್ಪಾಯಿಂಟ್ ಅನ್ನು ಸ್ಮೋಕ್-ಟೆಸ್ಟ್ ಮಾಡಿ (HTTP 200 ನಿರೀಕ್ಷಿಸಲಾಗುತ್ತದೆ)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಒಂದು ಹೆಲ್ತ್ ಎಂಡ್ಪಾಯಿಂಟ್ ಹೊಂದಿದ್ದರೆ ಅದನ್ನು ಪರಿಶೀಲಿಸಿ
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**ನಿಯೋಜನೆ ಈ ರೀತಿ ದೃಢವಾಗಿದೆ:**
- ✅ `azd show` ಒಂದು ಲಭ್ಯವಿರುವ endpoint URL ಅನ್ನು ಪಟ್ಟಿಸುತ್ತದೆ
- ✅ URL ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ದೋಷವಿಲ್ಲದೆ ತೆರೆದುಕೊಳ್ಳುತ್ತದೆ
- ✅ ಮೂಲ ವೈಶಿಷ್ಟ್ಯಗಳು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತವೆ (ಒಂದು todo ಸೇರಿಸಿ/ಪೂರ್ಣಗೊಳಿಸಿ/ಅಳಿಸಿ)
- ✅ `azd monitor --logs` ಅನಿರೀಕ್ಷಿತ ದೋಷಗಳಿಲ್ಲದೆ ಬಂದಿರುವ ವಿನಂತಿಗಳನ್ನು ತೋರಿಸುತ್ತದೆ

ಯಾವುದಾದರೂ ಪರಿಶೀಲನೆ ವಿಫಲವಾದರೆ, [ಅಧ್ಯಾಯ 7: ಸಮಸ್ಯೆ ಪರಿಹಾರ](../chapter-07-troubleshooting/README.md) ಗೆ ಹೋಗಿ.

## ಹಂತ 6: ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮತ್ತು ಮರುನಿಯೋಜನೆ ಮಾಡಿ

ಒಂದು ಬದಲಾವಣೆ ಮಾಡಿ ಮತ್ತು ಅದನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡುವುದು ಎಷ್ಟು ಸುಲಭವೋ ನೋಡೋಣ:

### API ಅನ್ನು ಪರಿಷ್ಕರಿಸಿ
```bash
# API ಕೋಡ್ ಸಂಪಾದಿಸಿ
code src/api/src/routes/lists.js
```

ಒಂದು ಕಸ್ಟಮ್ ಪ್ರತಿಕ್ರಿಯಾ ಹೆಡರ್ ಸೇರಿಸಿ:
```javascript
// ರೌಟ್ ಹ್ಯಾಂಡ್ಲರ್ ಅನ್ನು ಕಂಡು, ಕೆಳಕಂಡದನ್ನು ಸೇರಿಸಿ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ಕೇವಲ ಕೋಡ್ ಬದಲಾವಣೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
```bash
# ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ (ಇಂಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಹೊರತುಮಾಡಿ)
azd deploy

# ಇದು 'azd up' ಗಿಂತ ಬಹಳ ವೇಗವಾಗಿದೆ, ಏಕೆಂದರೆ ಇಂಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಈಗಾಗಲೇ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ
```

## ಹಂತ 7: ಬಹು ವಾತಾವರಣಗಳನ್ನು ನಿರ್ವಹಿಸಿ

ಉತ್ಪಾದನೆಗಿಂತ ಮೊದಲು ಬದಲಾವಣೆಗಳನ್ನು ಪರೀಕ್ಷಿಸಲು ಒಂದು ಸ್ಟೇಜಿಂಗ್ ವಾತಾವರಣವನ್ನು ರಚಿಸಿ:

```bash
# ಹೊಸ ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new staging

# ಸ್ಟೇಜಿಂಗ್‌ಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಡೆವ್ ಪರಿಸರಕ್ಕೆ ಹಿಂದಕ್ಕೆ ಬದಲಾಯಿಸಿ
azd env select dev

# ಎಲ್ಲಾ ಪರಿಸರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env list
```

### ವಾತಾವರಣ ಹೋಲಿಕೆ
```bash
# ಡೆವ್ ಪರಿಸರವನ್ನು ವೀಕ್ಷಿಸಿ
azd env select dev
azd show

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ವೀಕ್ಷಿಸಿ
azd env select staging
azd show
```

## ಹಂತ 8: ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ

ಪ್ರಯೋಗ ಮುಗಿಸಿದ ನಂತರ, ನಿರಂತರ ಶುಲ್ಕಗಳನ್ನು ತಪ್ಪಿಸಲು ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ:

```bash
# ಪ್ರಸ್ತುತ ಪರಿಸರದ ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಳಿಸಿ
azd down

# ದೃಢೀಕರಣವಿಲ್ಲದೆ ಬಲವಾಗಿ ಅಳಿಸಿ ಮತ್ತು ಸಾಫ್ಟ್-ಡಿಲೀಟ್ ಮಾಡಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಿ
azd down --force --purge

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರವನ್ನು ಅಳಿಸಿ
azd env select staging
azd down --force --purge
```

## ಕ್ಲಾಸಿಕ್ ಅಪ್ಲಿಕೇಶನ್ vs AI-ಸಶಕ್ತ ಅಪ್ಲಿಕೇಶನ್: ಅದೇ ವರ್ಕ್ಫ್ಲೋ

ನೀವು appena ಒಂದು ಪರಂಪರागत ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸಿದ್ದೀರಿ. ಆದರೆ ನೀವು Microsoft Foundry Models ಮೂಲಕ ಬೆಂಬಲಿತ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಮುಂತಾದ AI-ಸಶಕ್ತ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಲು ಇಚ್ಛಿಸಿದರೆ?

ಒಳ್ಳೆಯ ಸುದ್ದಿ: **ಕಾರ್ಯಪ್ರವಾಹವು ಅದೇ ಇದ್ದೇ ಇರುತ್ತದೆ.**

| ಹಂತ | ಪಾರಂಪರಿಕ Todo ಅಪ್ಲಿಕೇಶನ್ | AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

唯ಕೆ ಭಿನ್ನತೆ ಸೋಮ **ಟೆಂಪ್ಲೇಟ್** ಮುಖಾಂತರ ಮಾತ್ರ. AI ಟೆಂಪ್ಲೇಟ್‌ಗಳು ಹೆಚ್ಚುವರಿ ಮೂಲಸೌಕರ್ಯಗಳನ್ನು (ಉದಾಹರಣೆಗೆ Microsoft Foundry Models ಸಂಪನ್ಮೂಲ ಅಥವಾ AI Search ಸೂಚ್ಯಂಕ) ಒಳಗೊಂಡಿರಬಹುದು, ಆದರೆ azd ಆ ಎಲ್ಲಾ ಅನ್ನು ನಿಭಾಯಿಸುತ್ತದೆ. ನಿಮಗೆ ಹೊಸ ಕಮಾಂಡ್‌ಗಳನ್ನು ಕಲಿಯಬೇಕಾಗುವುದಿಲ್ಲ, ಬೇರೆ ಸಾಧನವನ್ನು ಅಳವಡಿಸಬೇಕಾಗುವುದಿಲ್ಲ, ಅಥವಾ ನಿಯೋಜನೆ ಬಗ್ಗೆ ನಿಮ್ಮ ರೀತಿಯನ್ನು ಬದಲಾಯಿಸುವ ಅಗತ್ಯವಿಲ್ಲ.

ಇದು azd‌ನ ಮೂಲ ತತ್ವ: **ಒಂದು ವರ್ಕ್ಫ್ಲೋ, ಯಾವುದಾದರೂ ಕೆಲಸ.** ನೀವು ಈ ಟ್ಯುಟೋರಿಯಲ್‌ನಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿದ ಕೌಶಲ್ಯಗಳು — ಪ್ರಾರಂಭಿಸುವುದು, ನಿಯೋಜಿಸುವುದು, ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡುವುದು, ಮರುನಿಯೋಜನೆ ಮಾಡುವುದು ಮತ್ತು ತೆರವುಗೊಳಿಸುವುದು — AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಮತ್ತು ಏಜೆಂಟ್ಗಳಿಗೂ ಸಮಾನವಾಗಿ ಅನ್ವಯಿಸುತ್ತವೆ.

---

## ನೀವು ಏನ್ನು ಕಲಿತಿರಿ

ಹಾರ್ದಿಕ ಶುಭಾಶಯಗಳು! ನೀವು ಯಶಸ್ವಿಯಾಗಿ:
- ✅ ಟೆಂಪ್ಲೇಟಿನಿಂದ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿದ್ದರು
- ✅ ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಪ್ರಮುಖ ಫೈಲ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿದ್ದೀರಿ
- ✅ ಪೂರ್ಣ-ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ನಿಯೋಜಿಸಿದ್ದೀರಿ
- ✅ ಕೋಡ್ ಬದಲಾವಣೆಯನ್ನು ಮಾಡಿ ಮರುನಿಯೋಜನೆ ಮಾಡಿದ್ದೀರಿ
- ✅ ಅನೇಕ ವಾತಾವರಣಗಳನ್ನು ನಿರ್ವಹಿಸಿದ್ದೀರಿ
- ✅ ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆರವುಗೊಳಿಸಿದ್ದೀರಿ

## 🎯 ಕೌಶಲ್ಯ ಪರಿಶೀಲನಾ ಅಭ್ಯಾಸಗಳು

### ತರಬೇತಿ 1: ಬೇರೆ ಟೆಂಪ್ಲೇಟನ್ನು ನಿಯೋಜಿಸಿ (15 ನಿಮಿಷ)
**ಗೋಲ್**: `azd init` ಮತ್ತು ನಿಯೋಜನಾ ಕಾರ್ಯಪ್ರವಾಹದಲ್ಲಿ ಪಾವತಿ ತೋರಿಸುವುದು

```bash
# ಪೈಥಾನ್ + ಮೊಂಗೋಡಿಬಿ ಸ್ಟ್ಯಾಕ್ ಅನ್ನು ಪ್ರಯತ್ನಿಸಿ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ನಿಯೋಜನೆ ಪರಿಶೀಲಿಸಿ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಅಪ್ಲಿಕೇಶನ್ ದೋಷರಹಿತವಾಗಿ ನಿಯೋಜಿಸಿದೆ
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ URL ಅನ್ನು ಪ್ರವೇಶಿಸಬಹುದು
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ (ಎರಗಿನ/ತೆಗೆದುಹಾಕುವ todo ಗಳು)
- [ ] ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ

### ತರಬೇತಿ 2: ಸಂರಚನೆಯನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ (20 ನಿಮಿಷ)
**ಗೋಲ್**: ವಾತಾವರಣ ಚರಗಳ ಸಂರಚನೆ ಅಭ್ಯಾಸ

```bash
cd my-first-azd-app

# ಕಸ್ಟಮ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new custom-config

# ಕಸ್ಟಮ್ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep APP_TITLE

# ಕಸ್ಟಮ್ ಸಂರಚನೆಯೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಕಸ್ಟಮ್ ವಾತಾವರಣ ಯಶಸ್ವಿಯಾಗಿ ಸೃಷ್ಟಿಸಲಾಗಿದೆ
- [ ] ವಾತಾವರಣ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ ಪರಿಶೀಲಿಸಬಹುದಾಗಿದೆ
- [ ] ಕಸ್ಟಮ್ ಸಂರಚನೆಯೊಂದಿಗೆ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸಲಾಗಿದೆ
- [ ] ನಿಯೋಜಿತ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಕಸ್ಟಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ದೃಢೀಕರಿಸಬಹುದು

### ತರಬೇತಿ 3: ಬಹು-ವಾತಾವರಣ ವರ್ಕ್ಫ್ಲೋ (25 ನಿಮಿಷ)
**ಗೋಲ್**: ವಾತಾವರಣ ನಿರ್ವಹಣೆ ಮತ್ತು ನಿಯೋಜನಾ ತಂತ್ರಗಳಲ್ಲಿ ಪರಿಣತಿ

```bash
# ಡೆವ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ಡೆವ್ URL ಅನ್ನು ಗಮನಿಸಿ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ಸ್ಟೇಜಿಂಗ್ URL ಅನ್ನು ಗಮನಿಸಿ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ಪರಿಸರಗಳನ್ನು ಹೋಲಿಸಿ
azd env list

# ಎರಡೂ ಪರಿಸರಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# ಎರಡೂ ಪರಿಸರಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ವಿಭಿನ್ನ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಎರಡು ವಾತಾವರಣಗಳು ನಿರ್ಮಿಸಲಾಗಿದೆ
- [ ] ಎರಡೂ ವಾತಾವರಣಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] `azd env select` ಬಳಸಿ ವಾತಾವರಣಗಳ ನಡುವೆ ನವಿಗೇಟ್ ಮಾಡುವುದು ಸಾಧ್ಯ
- [ ] ವಾತಾವರಣ ಚರಗಳು ವಾತಾವರಣಗಳ бойынша ವ್ಯತ್ಯಾಸವಾಗಿವೆ
- [ ] ಎರಡೂ ವಾತಾವರಣಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ

## 📊 ನಿಮ್ಮ ಪ್ರಗತಿ

**ಹೂಡಿಕೆ ಸಮಯ**: ~60-90 ನಿಮಿಷ  
**ಅರ್ಜಿತ ಕೌಶಲ್ಯಗಳು**:
- ✅ ಟೆಂಪ್ಲೇಟ್ ಆಧಾರಿತ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸುವಿಕೆ
- ✅ Azure ಸಂಪನ್ಮೂಲ ಪ್ರೊವಿಷನಿಂಗ್
- ✅ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನಾ ವರ್ಕ್ಫ್ಲೋಗಳು
- ✅ ವಾತಾವರಣ ನಿರ್ವಹಣೆ
- ✅ ಸಂರಚನಾ ನಿರ್ವಹಣೆ
- ✅ ಸಂಪನ್ಮೂಲ ತೆರವುಗೊಳಿಸುವಿಕೆ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣೆ

**ಮುಂದಿನ ಹಂತ**: ನೀವು [Configuration Guide](configuration.md) ಗೆ ಸಿದ್ಧರಾಗಿದ್ದೀರಿ, ಅಲ್ಲಿ ಸುಧಾರಿತ ಸಂರಚನಾ ಮಾದರಿಗಳನ್ನು ಕಲಿಯಿರಿ!

## ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ

### ಪ್ರಾಮಾಣೀಕರಣ ದೋಷಗಳು
```bash
# Azure ನೊಂದಿಗೆ ಮರು-ಪ್ರಮಾಣೀಕರಿಸಿ
az login

# ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳು
```bash
# ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd up --debug

# Azure ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# Container Apps ಗಾಗಿ, Azure CLI ಬಳಸಿ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ಸಂಪನ್ಮೂಲ ಹೆಸರಿನ ಸಂಘರ್ಷಗಳು
```bash
# ಅದ್ವಿತೀಯ ಪರಿಸರ ಹೆಸರನ್ನು ಬಳಸಿ
azd env new dev-$(whoami)-$(date +%s)
```

### ಪೋರ್ಟ್/ನೆಟ್‌ವರ್ಕ್ ಸಮಸ್ಯೆಗಳು
```bash
# ಪೋರ್ಟ್‌ಗಳು ಲಭ್ಯವಿವೆ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ
netstat -an | grep :3000
netstat -an | grep :3100
```

## ಮುಂದಿನ ಹಂತಗಳು

ಈಗ ನೀವು ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ, ಈ ಸುಧಾರಿತ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

### 1. ಮೂಲಸೌಕರ್ಯವನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ಸ್ಥಾಪಿಸಿ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ಸಂಪೂರ್ಣ CI/CD ವರ್ಕ್ಫ್ಲೋಗಳು
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ಪೈಪ್‌ಲೈನ್ ಸಂರಚನೆ

### 3. ಉತ್ಪಾದನಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ಭದ್ರತೆ, ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆ

### 4. ಹೆಚ್ಚಿನ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ
```bash
# ವರ್ಗ ಪ್ರಕಾರ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ವಿಭಿನ್ನ ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್‌ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಅಧ್ಯಯನ ವಸ್ತುಗಳು
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### ಸಮುದಾಯ ಮತ್ತು ಬೆಂಬಲ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ಟೆಂಪ್ಲೇಟ್ಗಳು ಮತ್ತು ಉದಾಹರಣೆಗಳು
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ನಿಮ್ಮ ಮೊದಲ azd ಪ್ರಾಜೆಕ್ಟ್ ಪೂರ್ಣಗೊಳಿಸಿದ್ದಕ್ಕೆ ಅಭಿನಂದನೆಗಳು!** ನೀವು ಈಗ ವಿಶ್ವಾಸದಿಂದ Azure ಮೇಲೆ ಅದ್ಭುತ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಲು ಸಿದ್ಧರಾಗಿದ್ದೀರಿ.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->