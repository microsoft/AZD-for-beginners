# ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ - ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಟ್ಯುಟೋರಿಯಲ್

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಮುಖ್ಯಪುಟ**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 Current Chapter**: Chapter 1 - ಮೂಲಭೂತ & ದ್ರುತ ಪ್ರಾರಂಭ
- **⬅️ Previous**: [ಸ್ಥಾಪನೆ ಮತ್ತು ಸೆಟ್‌ಅಪ್](installation.md)
- **➡️ Next**: [ಸಂರಚನೆ](configuration.md)
- **🚀 Next Chapter**: [ಅಧ್ಯಾಯ 2: ಎಐ-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ಪರಿಚಯ

ನಿಮ್ಮ ಮೊದಲ Azure Developer CLI ಪ್ರಾಜೆಕ್ಟಿಗೆ ಸ್ವಾಗತ! ಈ ಸಮಗ್ರ ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಟ್ಯುಟೋರಿಯಲ್ azd ಬಳಸಿ Azure ಮೇಲೆ ಪೂರ್ಣ-ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ರಚಿಸುವುದು, ನಿಯೋಜಿಸುವುದು, ಮತ್ತು ನಿರ್ವಹಿಸುವುದರ ಸಂಪೂರ್ಣ ಹಾದಿಯನ್ನು ಒದಗಿಸುತ್ತದೆ. ನೀವು React ಫ್ರಂಟ್‌ಎಂಡ್, Node.js API ಬ್ಯಾಕ್‌ಎಂಡ್ ಮತ್ತು MongoDB ಡೇಟಾಬೇಸ್ ಹೊಂದಿರುವ ನೈಜ todo ಅಪ್ಲಿಕೇಶನ್ನಿನಲ್ಲಿ ಕೆಲಸ ಮಾಡಲಿದ್ದೀರಿ.

## ಕಲಿಕಾ ಗುರಿಗಳು

ಈ ಟ್ಯುಟೋರಿಯಲ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬಳಸಿ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸುವ ಕಾರ್ಯಪ್ರವಾಹದಲ್ಲಿ ಪರಿಣತಿ ಪಡೆಯುವುದು
- Azure Developer CLI ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಸಂರಚನಾ ಫೈಲ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ರೊವಿಷನಿಂಗ್‌ೊಂದಿಗೆ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ಪೂರ್ಣವಾಗಿ ನಿಯೋಜಿಸುವುದು
- ಅಪ್ಲಿಕೇಶನ್ ನವೀಕರಣಗಳು ಮತ್ತು ಮರುನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
- ಡೆವಲಪ್‌ಮೆಂಟ್ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್‌ಗೆ ಹಲವಾರು ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು
- ಸಂಪನ್ಮೂಲ ಶುದ್ಧೀಕರಣ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣಾ ಕ್ರಮಗಳನ್ನು ಅನ್ವಯಿಸುವುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಹೊಂದಿರುತ್ತೀರಿ:
- ಟೆಂಪ್ಲೇಟಿನಿಂದ ಸ್ವತಂತ್ರವಾಗಿ azd ಪ್ರಾಜೆಕ್ಟ್ ಗಳನ್ನು ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ಸಂರಚಿಸಲು
- azd ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನ್ಯಾವಿಗೇಟ್ ಮತ್ತು ಸಂಪಾದಿಸಲು
- ಏಕಾ ಆಜ್ಞೆಗಳ ಮೂಲಕ ಪೂರ್ಣ-ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು Azure ಗೆ ನಿಯೋಜಿಸಲು
- ಸಾಮಾನ್ಯ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ ಸಮಸ್ಯೆಗಳನ್ನು ನಿಭಾಯಿಸಲು
- ವಿಭಿನ್ನ ನಿಯೋಜನೆ ಹಂತಗಳಿಗಾಗಿ ಬಹು Azure ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಲು
- ಅಪ್ಲಿಕೇಶನ್ ನವೀಕರಣಗಳಿಗೆ ನಿರಂತರ ನಿಯೋಜನೆ ಕೆಲಸವಾಣಿ ಅನುಷ್ಠಾನಗೊಳ್ಳಿಸಲು

## ಪ್ರಾರಂಭಿಸೋಣ

### ಮುಂಚಿತ ಅಗತ್ಯಗಳ ಪರಿಶೀಲನಾ ಪಟ್ಟಿಕೆ
- ✅ Azure Developer CLI ಸ್ಥಾಪಿಸಲಾಗಿದೆ ([ಸ್ಥಾಪನೆ ಮಾರ್ಗದರ್ಶಿ](installation.md))
- ✅ Azure CLI ಸ್ಥಾಪಿತ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಿಸಲಾಗಿದೆ
- ✅ ನಿಮ್ಮ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ Git ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- ✅ Node.js 16+ (ಈ ಟ್ಯುಟೋರಿಯಲ್‌ಗಾಗಿ)
- ✅ Visual Studio Code (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)

### ನಿಮ್ಮ ಸೆಟ್ಅಪ್ ಪರಿಶೀಲಿಸಿ
```bash
# azd ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version
```
### Azure ಪ್ರಮಾಣೀಕರಣ ಪರಿಶೀಲಿಸಿ

```bash
az account show
```

### Node.js ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
```bash
node --version
```

## ಹಂತ 1: ಟೆಂಪ್ಲೇಟನ್ನು ಆಯ್ಕೆ ಮಾಡಿ ಮತ್ತು ಪ್ರಾರಂಭಿಸಿ

ನಮಗೆ React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು Node.js API ಬ್ಯಾಕ್‌ಎಂಡ್ ಅನ್ನು ಒಳಗೊಂಡಿರುವ ಜನಪ್ರಿಯ todo ಅಪ್ಲಿಕೇಶನ್ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸೋಣ.

```bash
# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
azd template list

# ಟುಡೋ ಆಪ್ ಟೆಂಪ್ಲೇಟನ್ನು ಆರಂಭಿಸಿ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಅನುಸರಿಸಿ:
# - ಒಂದು ಪರಿಸರದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ: "dev"
# - ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಆಯ್ಕೆಮಾಡಿ (ನಿಮಗೆ ಒಂದಕ್ಕಿಂತ ಹೆಚ್ಚು ಇದ್ದರೆ)
# - ಪ್ರದೇಶವನ್ನು ಆಯ್ಕೆಮಾಡಿ: "East US 2" (ಅಥವಾ ನಿಮ್ಮ ಇಚ್ಛಿತ ಪ್ರದೇಶ)
```

### ಈಗ ಏನಾಯಿತು?
- ಟೆಂಪ್ಲೇಟಿನ ಕೋಡ್ ನಿಮ್ಮ ಸ್ಥಳೀಯ ಡೈರೆಕ್ಟರಿಗೆ ಡೌನ್ಲೋಡ್ ಮಾಡಲಾಯಿತು
- ಸರ್ವಿಸ್ ವ್ಯಾಖ್ಯಾನಗಳೊಂದಿಗೆ `azure.yaml` ಫೈಲ್ ರಚಿಸಲಾಯಿತು
- `infra/` ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಕೋಡ್ ಸಜ್ಜಾಗಿದೆ
- ಒಂದು ಪರಿಸರ ಸಂರಚನೆ ರಚಿಸಲಾಯಿತು

## ಹಂತ 2: ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಯನ್ನು ಅನ್ವೇಷಿಸಿ

azd ನಮಗಾಗಿ ಏನು ರಚಿಸಿದೆ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸೋಣ:

```bash
# ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
tree /f   # ವಿಂಡೋಸ್
# ಅಥವಾ
find . -type f | head -20   # ಮ್ಯಾಕ್‌ಒಎಸ್/ಲಿನಕ್ಸ್
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

### ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಕಾದ ಪ್ರಮುಖ ಫೈಲ್‌ಗಳು

**azure.yaml** - ನಿಮ್ಮ azd ಪ್ರಾಜೆಕ್ಟಿನ ಹೃದಯ:
```bash
# ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
cat azure.yaml
```

**infra/main.bicep** - ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ವ್ಯಾಖ್ಯಾನ:
```bash
# ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಕೋಡ್ ಅನ್ನು ವೀಕ್ಷಿಸಿ
head -30 infra/main.bicep
```

## ಹಂತ 3: ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ (ಐಚ್ಛಿಕ)

ನಿಯೋಜಿಸುವುದಕ್ಕೆ ಮೊದಲು, ನೀವು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದು:

### ಫ್ರಂಟ್‌ಎಂಡ್ ಅನ್ನು ಬದಲಾಯಿಸಿ
```bash
# React ಆಪ್ ಕಂಪೋನಂಟ್ ಅನ್ನು ತೆರೆಯಿರಿ
code src/web/src/App.tsx
```

ಒಂದು ಸರಳ ಬದಲಾವಣೆ ಮಾಡಿ:
```typescript
// ಶೀರ್ಷಿಕೆಯನ್ನು ಹುಡುಕಿ ಮತ್ತು ಅದನ್ನು ಬದಲಾಯಿಸಿ
<h1>My Awesome Todo App</h1>
```

### ಪರಿಸರ ಚರಗಳನ್ನು ಸಂರಚಿಸಿ
```bash
# ಕಸ್ಟಮ್ ಪರಿಸರ ಚರಗಳನ್ನು ನಿಗದಿಪಡಿಸಿ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values
```

## ಹಂತ 4: Azure ಗೆ ನಿಯೋಜಿಸಿ

ಇಗೀಗ ರೋಚಕ ಭಾಗ — ಎಲ್ಲವನ್ನೂ Azure ಗೆ ನಿಯೋಜಿಸಿ!

```bash
# ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಈ ಕಮಾಂಡ್ ಕೆಳಕಂಡ ಕಾರ್ಯಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ:
# 1. Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸು (App Service, Cosmos DB, ಇತ್ಯಾದಿ)
# 2. ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿರ್ಮಿಸಿ
# 3. ಒದಗಿಸಿದ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ನಿಯೋಜಿಸಿ
# 4. ಅಪ್ಲಿಕೇಶನ್ URL ಅನ್ನು ಪ್ರದರ್ಶಿಸಿ
```

### ನಿಯೋಜನೆಯ ಸಮಯದಲ್ಲಿ ಏನು ನಡೆಯುತ್ತದೆ?

`azd up` ಆಜ್ಞೆಯು ಈ ಹಂತಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ:
1. **Provision** (`azd provision`) - Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುತ್ತದೆ
2. **Package** - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿರ್ಮಿಸುತ್ತದೆ
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

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಪ್ರಾಪ್ತಿ
ನಿಯೋಜನೆ ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ನೀಡಿರುವ URL ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ, ಅಥವಾ ಯಾವುದೇ ಸಂದರ್ಭದಲ್ಲಿಯೂ ಅದನ್ನು ಪಡೆಯಿರಿ:
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show

# ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ತೆರೆಯಿರಿ
azd show --output json | jq -r '.services.web.endpoint'
```

### ಟುಡೋ ಆಪ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
1. **ಒಂದು ಟುಡೋ ಐಟಂ ಸೇರಿಸಿ** - "Add Todo" ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ ಮತ್ತು ಕಾರ್ಯದ ವಿವರಣೆ ಸೇರಿಸಿ
2. **ಪೂರ್ಣಗೊಂಡಂತೆ ಗುರುತಿಸಿ** - ಪೂರ್ಣಗೊಂಡ ಐಟಂಗಳನ್ನು ಟಿಕ್ ಮಾಡಿ
3. **ಐಟಂಗಳನ್ನು ಅಳಿಸಿ** - ನೀವು ಇನ್ನಷ್ಟೇ ಬೇಕಾಗದ ಟುಡೋಗಳನ್ನು ತೆಗೆದುಹಾಕಿ

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಗಾ ವಹಿಸಿ
```bash
# ನಿಮ್ಮ ಸಂಪನ್ಮೂಲಗಳಿಗೆ Azure ಪೋರ್ಟಲ್ ತೆರೆಯಿರಿ
azd monitor

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಲೈವ್ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live
```

## ಹಂತ 6: ಬದಲಾವಣೆಗಳ ಮಾಡಿ ಮತ್ತು ಮರುನಿಯೋಜಿಸಿ

ಒಂದು ಬದಲಾವಣೆ ಮಾಡಿ ಮತ್ತು ಅದನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡುವುದು ಎಷ್ಟು ಸುಲಭ ಎಂದು ನೋಡೋಣ:

### API ಅನ್ನು ಬದಲಾಯಿಸಿ
```bash
# API ಕೋಡ್ ಸಂಪಾದಿಸಿ
code src/api/src/routes/lists.js
```

ಕಸ್ಟಮ್ ಪ್ರತಿಕ್ರಿಯಾ ಹೆಡರ್ ಸೇರಿಸಿ:
```javascript
// ರೌಟ್ ಹ್ಯಾಂಡ್ಲರ್ ಅನ್ನು ಹುಡುಕಿ ಮತ್ತು ಸೇರಿಸಿ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ಕೇವಲ ಕೋಡ್ ಬದಲಾವಣೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಮಾತ್ರ ನಿಯೋಜಿಸಿ (ಇಂಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಬಿಟ್ಟುಬಿಡಿ)
azd deploy

# ಇಂಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಈಗಾಗಲೇ ಇರುವ ಕಾರಣ ಇದು 'azd up'ಕ್ಕಿಂತ ಬಹಳವೇ ವೇಗವಾಗಿದೆ
```

## ಹಂತ 7: ಹಲವಾರು ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಿ

ಉತ್ಪಾದನೆಗೂ ಮುಂಚೆ ಬದಲಾವಣೆಗಳನ್ನು ಪರೀಕ್ಷಿಸಲು ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ ರಚಿಸಿ:

```bash
# ಹೊಸ ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new staging

# ಸ್ಟೇಜಿಂಗ್‌ಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಮತ್ತೆ dev ಪರಿಸರಕ್ಕೆ ಹಿಂತಿರುಗಿ
azd env select dev

# ಎಲ್ಲಾ ಪರಿಸರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env list
```

### ಪರಿಸರ ಹೋಲಿಕೆ
```bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರ ವೀಕ್ಷಿಸಿ
azd env select dev
azd show

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ ವೀಕ್ಷಿಸಿ
azd env select staging
azd show
```

## ಹಂತ 8: ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶುದ್ಧಗೊಳಿಸಿ

ಪ್ರಯೋಗ ಮುಗಿಸಿದ ನಂತರ, ನಿರಂತರ ಶುಲ್ಕಗಳನ್ನು ತಪ್ಪಿಸಲು ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶುದ್ಧಗೊಳಿಸಿ:

```bash
# ಪ್ರಸ್ತುತ ಪರಿಸರದ ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಳಿಸಿ
azd down

# ದೃಢೀಕರಣವಿಲ್ಲದೆ ಬಲವಂತವಾಗಿ ಅಳಿಸಿ ಮತ್ತು ಸಾಫ್ಟ್-ಅಳಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಿ
azd down --force --purge

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರವನ್ನು ಅಳಿಸಿ
azd env select staging
azd down --force --purge
```

## ಕ್ಲಾಸಿಕ್ ಆಪ್ vs. ಎಐ-ಚಾಲಿತ ಆಪ್: ಅದೇ ಕಾರ್ಯಪ್ರವಾಹ

ನೀವು appena ಸಾಮಾಜಿಕ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿದ್ದರು. ಆದರೆ ಬದಲಾಗಿ ಎಐ-ಚಾಲಿತ ಆಪ್ ಅನ್ನು ನಿಯೋಜಿಸಲು ಇಚ್ಛಿಸಿದರೆ—ಉದಾಹರಣೆಗೆ Microsoft Foundry Models ಮೂಲಕ ಬೆಂಬಲಿತ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್—ಎಂತಾದರೂ?

ಒಳ್ಳೆಯ ಸುದ್ದಿ: **ಕಾರ್ಯಪ್ರವಾಹವು ಒಂದೇ.**

| ಹಂತ | ಕ್ಲಾಸಿಕ್ ಟುಡೋ ಆಪ್ | ಎಐ ಚಾಟ್ ಆಪ್ |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ತಾರತಮ್ಯವೇನಂದರೆ ನೀವು ಯಾವ **ಟೆಂಪ್ಲೇಟ್ನಿಂದ** ಪ್ರಾರಂಭಿಸುತ್ತೀರಿ ಎಂಬುದಾಗಿದೆಯೆಂದು ಮಾತ್ರ. ಎಐ ಟೆಂಪ್ಲೇಟ್ ನಲ್ಲಿ ಹೆಚ್ಚುವರಿ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ (ಉದಾ., Microsoft Foundry Models ಸಂಪನ್ಮೂಲ ಅಥವಾ AI Search ಇಂಡೆಕ್ಸ್ನಂತಹವು) ಇರಬಹುದು, ಆದರೆ azd ಅವುಗಳನ್ನೆಲ್ಲ ನಿಮ್ಮ ಪರವಾಗಿ ನಿರ್ವಹಿಸುತ್ತದೆ. ನಿಮಗೆ ಹೊಸ ಆಜ್ಞೆಗಳು ಕಲಿಯಬೇಕಾದ ಅಗತ್ಯವಿಲ್ಲ, ವಿಭಿನ್ನ ಟೂಲ್ ಅಂಗೀಕರಿಸುವ ಅಗತ್ಯವಿಲ್ಲ, ಅಥವಾ ನಿಯೋಜನೆ ಕುರಿತು ನಿಮ್ಮ ಚಿಂತನೆ ಬದಲಾಯಿಸುವ ಅಗತ್ಯವಿಲ್ಲ.

ಇದು azd ನ ಮೂಲ ತತ್ವ: **ಒಂದು ಕಾರ್ಯಪ್ರವಾಹ, ಯಾವುದೇ ಕೆಲಸ.** ನೀವು ಈ ಟ್ಯುಟೋರಿಯಲ್‌ನಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿದ ಕೌಶಲ್ಯಗಳು — ಪ್ರಾರಂಭಿಸುವುದು, ನಿಯೋಜಿಸುವುದು, ನಿಗಾವಹಿಸುವುದು, ಮರುನಿಯೋಜಿಸುವುದು ಮತ್ತು ಶುದ್ಧಗೊಳಿಸುವುದು — ಎಐ ಅಪ್ಲಿಕೇಶನ್ಗಳು ಮತ್ತು ಏಜೆಂಟ್ಗಳಿಗೂ ಸಮಾನವಾಗಿ ಅನ್ವಯಿಸುತ್ತವೆ.

---

## ನೀವು ಏನು ಕಲಿತಿರಿ

ಅಭಿನಂದನೆಗಳು! ನೀವು ಯಶಸ್ವಿಯಾಗಿ:
- ✅ ಟೆಂಪ್ಲೇಟಿನಿಂದ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿದರು
- ✅ ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಪ್ರಮುಖ ಫೈಲ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿದರು
- ✅ ಪೂರ್ಣ-ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ನಿಯೋಜಿಸಿದರು
- ✅ ಕೋಡ್ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮರುನಿಯೋಜನೆ ಮಾಡಿದರು
- ✅ ಹಲವಾರು ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಿದರು
- ✅ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶುದ್ಧಗೊಳಿಸಿದರು

## 🎯 ಕೌಶಲ್ಯ ಪರಿಶೀಲನಾ ವ್ಯಾಯಾಮಗಳು

### ವ್ಯಾಯಾಮ 1: ಬೇರೆ ಟೆಂಪ್ಲೇಟನ್ನು ನಿಯೋಜಿಸಿ (15 ನಿಮಿಷಗಳು)
**ಲಕ್ಷ್ಯ**: azd init ಮತ್ತು ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹದ ಪರಿಣತಿಯನ್ನು ಪ್ರದರ್ಶಿಸಿ

```bash
# Python + MongoDB ಸ್ಟ್ಯಾಕ್ ಪ್ರಯತ್ನಿಸಿ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಪರಿಶೀಲಿಸಿ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಅಪ್ಲಿಕೇಶನ್ ದೋಷರಹಿತವಾಗಿ ನಿಯೋಜಿತವಾಗುತ್ತದೆ
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ URL ಅನ್ನು ಪ್ರವೇಶಿಸಬಹುದು
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡುತ್ತದೆ (ಟುಡೋಗಳನ್ನು ಸೇರಿಸಿ/ಅಳಿಸಿ)
- [ ] ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಶುದ್ಧಗೊಳಿಸಲಾಗಿದೆ

### ವ್ಯಾಯಾಮ 2: ಸಂರಚನೆಯನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ (20 ನಿಮಿಷಗಳು)
**ಲಕ್ಷ್ಯ**: ಪರಿಸರ ಚರಗಳ ಸಂರಚನೆ ಅಭ್ಯಾಸ ಮಾಡಿ

```bash
cd my-first-azd-app

# ಕಸ್ಟಮ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new custom-config

# ಕಸ್ಟಮ್ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep APP_TITLE

# ಕಸ್ಟಮ್ ಸಂರಚನೆಯೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಕಸ್ಟಮ್ ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ
- [ ] ಪರಿಸರ ಚರಗಳು ಸೆಟ್ ಆಗಿವೆ ಮತ್ತು ಪಡೆಯಬಹುದಾಗಿದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಕಸ್ಟಮ್ ಸಂರಚನೆಯೊಂದಿಗೆ ನಿಯೋಜಿತವಾಗಿದೆ
- [ ] ನಿಯೋಜಿತ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಕಸ್ಟಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಬಹುದು

### ವ್ಯಾಯಾಮ 3: ಬಹು-ಪರಿಸರ ಕಾರ್ಯಪ್ರವಾಹ (25 ನಿಮಿಷಗಳು)
**ಲಕ್ಷ್ಯ**: ಪರಿಸರ ನಿರ್ವಹಣೆ ಮತ್ತು ನಿಯೋಜನೆ ತಂತ್ರಗಳಲ್ಲಿ ಪರಿಣತಿ ಪಡೆದುಕೊಳ್ಳಿ

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
- [ ] ವಿಭಿನ್ನ ಸಂರಚನೆಯೊಂದಿಗೆ ಎರಡು ಪರಿಸರಗಳು ರಚಿಸಲಾಗಿದೆ
- [ ] ಎರಡೂ ಪರಿಸರಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] `azd env select` ಬಳಸಿ ಪರಿಸರಗಳ ನಡುವೆ ಬದಲಾಯಿಸಬಹುದು
- [ ] ಪರಿಸರಗಳ ನಡುವೆ ಪರಿಸರ ಚರಗಳು ವಿಭಿನ್ನವಾಗಿವೆ
- [ ] ಎರಡೂ ಪರಿಸರಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಶುದ್ಧಗೊಳಿಸಲಾಗಿದೆ

## 📊 ನಿಮ್ಮ ಪ್ರಗತಿ

**ಕಾಲ ಹೂಡಿಕೆ**: ~60-90 ನಿಮಿಷಗಳು  
**ಅರ್ಜಿಸಿದ ಕೌಶಲ್ಯಗಳು**:
- ✅ ಟೆಂಪ್ಲೇಟ್ ಆಧारित ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸುವುದು
- ✅ Azure ಸಂಪನ್ಮೂಲ ಪ್ರೊವಿಷನಿಂಗ್
- ✅ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳು
- ✅ ಪರಿಸರ ನಿರ್ವಹಣೆ
- ✅ ಸಂರಚನಾ ನಿರ್ವಹಣೆ
- ✅ ಸಂಪನ್ಮೂಲ ಶುದ್ಧೀಕರಣ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣೆ

**ಮುಂದಿನ ಹಂತ**: ನೀವು [ಸಂರಚನೆ ಮಾರ್ಗದರ್ಶಿ](configuration.md) ನೋಡಲು ಸಿದ್ಧರಿದ್ದೀರಿ ಮತ್ತು ಉನ್ನತ ಸಂರಚನಾ ಮಾದರಿಗಳನ್ನು ಕಲಿಯಬಹುದಾಗಿದೆ!

## ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ

### ಪ್ರಾಮಾಣೀಕರಣ ದೋಷಗಳು
```bash
# Azure ನೊಂದಿಗೆ ಪುನಃ ಪ್ರಮಾಣೀಕರಿಸಿ
az login

# ಚಂದಾದಾರಿಕೆಯ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳು
```bash
# ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd up --debug

# Azure ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# Container Apps ಗಾಗಿ Azure CLI ಅನ್ನು ಬಳಸಿ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ಸಂಪನ್ಮೂಲ ಹೆಸರು ಸಂಘರ್ಷಗಳು
```bash
# ವಿಶಿಷ್ಟ ವಾತಾವರಣ ಹೆಸರನ್ನು ಬಳಸಿ
azd env new dev-$(whoami)-$(date +%s)
```

### ಪೋರ್ಟ್/ನೆಟ್ವರ್ಕ್ ಸಮಸ್ಯೆಗಳು
```bash
# ಪೋರ್ಟ್‌ಗಳು ಲಭ್ಯವಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
netstat -an | grep :3000
netstat -an | grep :3100
```

## ಮುಂದಿನ ಹಂತಗಳು

ಈಗ ನೀವು ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ, ಈ ಮುಂದುವರಿದ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

### 1. ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ
- [ಕೋಡ್ ರೂಪದಲ್ಲಿ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್](../chapter-04-infrastructure/provisioning.md)
- [ಡೇಟಾಬೇಸ್ಗಳು, ಸ್ಟೋರೇಜ್ ಮತ್ತು ಇತರೆ ಸೇವೆಗಳನ್ನು ಸೇರಿಸುವುದು](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ಸೆಟ್‌ಅಪ್ ಮಾಡಿ
- [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ಸಂಪೂರ್ಣ CI/CD ಕಾರ್ಯಪ್ರವಾಹಗಳು
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ಪೈಪ್‌ಲೈನ್ ಸಂರಚನೆ

### 3. ಉತ್ಪಾದನಾ ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳು
- [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ಸುರಕ್ಷತೆ, ಕಾರ್ಯಕ್ಷಮತೆ, ಮತ್ತು ನಿಗಾ ವಹಿಸುವಿಕೆ

### 4. ಇನ್ನಷ್ಟು ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನ ಅನ್ವೇಷಿಸಿ
```bash
# ವರ್ಗದ ಪ್ರಕಾರ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ವಿಭಿನ್ನ ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್‌ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಅಧ್ಯಯನ ಸಾಮಗ್ರಿಗಳು
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
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

**ನಿಮ್ಮ ಮೊದಲ azd ಪ್ರಾಜೆಕ್ಟ್‌ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದಕ್ಕಾಗಿ ಅಭಿನಂದನೆಗಳು!** ನೀವು ಈಗ ಆತ್ಮವಿಶ್ವಾಸದಿಂದ Azure ಮೇಲೆ ಅದ್ಭುತ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಲು ಸಿದ್ಧರಾಗಿದ್ದೀರಿ.

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಮುಖ್ಯಪುಟ**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 Current Chapter**: Chapter 1 - ಮೂಲಭೂತ & ದ್ರುತ ಪ್ರಾರಂಭ
- **⬅️ Previous**: [ಸ್ಥಾಪನೆ ಮತ್ತು ಸೆಟ್‌ಅಪ್](installation.md)
- **➡️ Next**: [ಸಂರಚನೆ](configuration.md)
- **🚀 Next Chapter**: [ಅಧ್ಯಾಯ 2: ಎಐ-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕರಣ**:
ಈ ದಸ್ತಾವೇಜನ್ನು ಎಐ ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಯಥಾರ್ಥತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುಗಳಿರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿಡಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಜ್ಜು ಅಥವಾ ತಪ್ಪು ವಿವರಣೆಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->