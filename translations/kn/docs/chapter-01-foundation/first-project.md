# ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ - ಪ್ರಾಯೋಗಿಕ ಟ್ಯುಟೋರಿಯಲ್

**ಅಧ್ಯಾಯ ದಿಕ್ಕುಬೆಳೆವಿಕೆ:**
- **📚 ಕೋರ್ಸ್ ಮುಖಪುಟ**: [AZD ಆರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಮೂಲಭೂತ ಮತ್ತು ತ್ವರಿತ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [Installation & Setup](installation.md)
- **➡️ ಮುಂದಿನದು**: [ಕಾನ್ಫಿಗರೇಶನ್](configuration.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ಪರಿಚಯ

ನಿಮ್ಮ ಮೊದಲ Azure Developer CLI ಪ್ರಾಜೆಕ್ಟ್‌ಗೆ ಸ್ವಾಗತ! ಈ ಸಮಗ್ರ ಪ್ರಾಯೋಗಿಕ ಟ್ಯುಟೋರಿಯಲ್ azd ಬಳಸಿ React ಫ್ರಂಟ್‌ಎಂಡ್, Node.js API ಬ್ಯಾಕ್‌ಎಂಡ್ ಮತ್ತು MongoDB ಡೇಟಾಬೇಸ್ ಒಳಗೊಂಡ ಪೂರ್ಣ-ಸ್ಟಾಕ್ todo ಅಪ್ಲಿಕೇಶನ್ ರಚನೆ, ನಿಯೋಜನೆ ಮತ್ತು ನಿರ್ವಹಣೆಯ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶನ ಒದಗಿಸುತ್ತದೆ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಟ್ಯುಟೋರಿಯಲ್ ಅನ್ನು ಪೂರ್ಣಗೊಳ್ಳಿಸುವ ಮೂಲಕ, ನೀವು:
- ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸಿ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸುವ ಕಾರ್ಯಪ್ರವಾಹದಲ್ಲಿ ಪರಿಣತಿ ಪಡೆಯುವಿರಿ
- Azure Developer CLI ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಸಂರಚನಾ ಫೈಲ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಮೂಲಸೌಕರ್ಯ ಪೂರೈಕೆ ಸೇರಿದಂತೆ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ಸಂಪೂರ್ಣವಾಗಿ ನಿಯೋಜಿಸಲು ಅನ್ವಯಿಸುವಿರಿ
- ಅಪ್ಲಿಕೇಶನ್ ನವೀಕರಣಗಳು ಮತ್ತು ಪುನಃನಿಯೋಜನೆ ಕಾರ್ಯತಂತ್ರಗಳನ್ನು ಜಾರಿಗೆ ತರಿಸಿಕೊಳ್ಳುವಿರಿ
- ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್ ಉದ್ದೇಶಗಳಿಗೆ ಬಹು-ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸುವಿರಿ
- ಸಂಪನ್ಮೂಲಗಳ ಸ್ವಚ್ಛಗೊಳಣೆ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣಾ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಅನ್ವಯಿಸುವಿರಿ

## ಕಲಿಕಾ ಫಲಿತಾಂಶಗಳು

ಸಮಾಪ್ತಿಯಾದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುವುದು:
- ಟೆಂಪ್ಲೇಟಿನಿಂದ ಸ್ವತಃ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸು ಮತ್ತು ಸಂರಚಿಸು
- azd ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನ್ಯಾವಿಗೇಟ್ ಮಾಡಿ ಬದಲಾವಣೆ ಮಾಡಿ
- ಏಕಾ-ಕಮಾಂಡ್‌ಗಳ ಮೂಲಕ ಪೂರ್ಣ-ಸ್ಟಾಕ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು Azure ಗೆ ನಿಯೋಜಿಸು
- ಸಾಮಾನ್ಯ ನಿಯೋಜನಾ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪ್ರಮಾಣೀಕರಣ ಸಮಸ್ಯೆಗಳನ್ನು ಟ್ರಬಲ್‌ಶೂಟ್ ಮಾಡು
- ವಿಭಿನ್ನ ನಿಯೋಜನೆ ಹಂತಗಳಿಗೆ ಬಹು Azure ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸು
- ಅಪ್ಲಿಕೇಶನ್ ನವೀಕರಣಗಳಿಗಾಗಿ ನಿರಂತರ ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಜಾರಿಗೆ ತರಿಸು

## ಪ್ರಾರಂಭಿಸಲು

### ಪೂರ್ವಶರತ್ತುಗಳ ಪಟ್ಟಿ
- ✅ Azure Developer CLI ಸ್ಥಾಪಿಸಲಾಗಿದೆ ([Installation Guide](installation.md))
- ✅ Azure CLI ಸ್ಥಾಪಿಸಲಾಗಿದೆ ಮತ್ತು ಪ್ರಮಾಣೀಕೃತವಾಗಿದೆ
- ✅ Git ನಿಮ್ಮ ವ್ಯವಸ್ಥೆಯ ಮೇಲೆ ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- ✅ Node.js 16+ (ಈ ಟ್ಯುಟೋರಿಯಲ್‍ಗಾಗಿ)
- ✅ Visual Studio Code (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)

### ನಿಮ್ಮ ಸೆಟ್‌ಅಪ್ ಪರಿಶೀಲಿಸಿ
```bash
# azd ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version
```
### ಆಜರ್ ಪ್ರಮಾಣೀಕರಣ ಪರಿಶೀಲಿಸಿ

```bash
az account show
```

### Node.js ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
```bash
node --version
```

## ಹಂತ 1: ಟೆಂಪ್ಲೇಟ್ ಆಯ್ಕೆ ಮಾಡಿ ಮತ್ತು ಪ್ರಾರಂಭಿಸಿ

ನಾವು React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು Node.js API ಬ್ಯಾಕ್‌ಎಂಡ್ ಅನ್ನು ಹೊಂದಿರುವ ಜನಪ್ರಿಯ todo ಅಪ್ಲಿಕೇಶನ್ ಟೆಂಪ್ಲೇಟ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸೋಣ.

```bash
# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd template list

# ಟುಡೋ ಆಪ್ ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಅನುಸರಿಸಿ:
# - ಪರಿಸರದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ: "dev"
# - ಚಂದಾದಾರಿಕೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ (ನಿಮಗೆ ಹಲವು ಚಂದಾದಾರಿಕೆಗಳಿದ್ದರೆ)
# - ಪ್ರದೇಶವನ್ನು ಆಯ್ಕೆಮಾಡಿ: "East US 2" (ಅಥವಾ ನಿಮ್ಮ ಇಷ್ಟದ ಪ್ರದೇಶ)
```

### ಏನು ನಡೆದಿದೆ?
- ಟೆಂಪ್ಲೇಟ್ ಕೋಡ್ ನಿಮ್ಮ ಸ್ಥಳೀಯ ಡೈರೆಕ್ಟರಿಗಳಿಗೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಯಿತು
- ಸೇವಾ ವ್ಯಾಖ್ಯಾನಗಳೊಂದಿಗೆ `azure.yaml` ಫೈಲ್ ರಚಿಸಲಾಯಿತು
- `infra/` ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ ಕೋಡ್ ಸೆಟ್ ಅಪ್ ಮಾಡಲಾಯಿತು
- ಒಂದು ಪರಿಸರ ಸಂರಚನೆ ರಚಿಸಲಾಯಿತು

## ಹಂತ 2: ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಯನ್ನು ಅನ್ವೇಷಿಸಿ

azd ನಮಗಾಗಿ 무엇 ರಚಿಸಿದೆ ಎಂದು ಪರೀಕ್ಷಿಸೋಣ:

```bash
# ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
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
# ಪ್ರಾಜೆಕ್ಟಿನ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
cat azure.yaml
```

**infra/main.bicep** - ಮೂಲಸೌಕರ್ಯದ ವ್ಯಾಖ್ಯಾನ:
```bash
# ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಕೋಡ್ ಅನ್ನು ವೀಕ್ಷಿಸಿ
head -30 infra/main.bicep
```

## ಹಂತ 3: ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ (ಐಚ್ಛಿಕ)

ನಿಯೋಜಿಸುವ ಮೊದಲು, ನೀವು ಅಪ್ಲಿಕೇಶನ್ ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದು:

### ಫ್ರಂಟ್‌ಎಂಡ್ ಬದಲಿಸಿ
```bash
# React ಅಪ್ಲಿಕೇಶನ್ ಕಾಂಪೋನೆಂಟ್ ಅನ್ನು ತೆರೆಯಿರಿ
code src/web/src/App.tsx
```

ಸರಳ ಬದಲಾವಣೆ ಮಾಡಿ:
```typescript
// ಶೀರ್ಷಿಕೆಯನ್ನು ಕಂಡು ಅದನ್ನು ಬದಲಾಯಿಸಿ
<h1>My Awesome Todo App</h1>
```

### ಪರಿಸರ ಮೌಲ್ಯಗಳನ್ನು ಸಂರಚಿಸಿ
```bash
# ಕಸ್ಟಮ್ ಪರಿಸರ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values
```

## ಹಂತ 4: Azure ಗೆ ನಿಯೋಜನೆ

ಇತ್ತೀಚಿನ ಮತ್ತು ರೋಮಾಂಚಕರ ಭಾಗಕ್ಕೆ — ಎಲ್ಲವನ್ನೂ Azure ಗೆ ನಿಯೋಜಿಸೋಣ!

```bash
# ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಈ ಕಮಾಂಡ್ ಕೆಳಗಿನ ಕಾರ್ಯಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತದೆ:
# 1. ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸಿದ್ಧಪಡಿಸಿ (App Service, Cosmos DB, ಇತ್ಯಾದಿ)
# 2. ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿರ್ಮಿಸಿ
# 3. ಸಿದ್ಧಪಡಿಸಿದ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ನಿಯೋಜಿಸಿ
# 4. ಅಪ್ಲಿಕೇಶನ್ URL ಅನ್ನು ಪ್ರದರ್ಶಿಸಿ
```

### ನಿಯೋಜನೆಯ ಸಮಯದಲ್ಲಿ ಏನು ನಡೆಯುತ್ತಿದೆ?

`azd up` ಕಮಾಂಡ್ ಇವುಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ:
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

## ಹಂತ 5: ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರೀಕ್ಷಿಸಿ

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರವೇಶಿಸಿ
ನಿಯೋಜನೆ ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ನೀಡಲಾದ URL ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ, ಅಥವಾ ಯಾವಾಗಲಾದರೂ ಇದನ್ನು ಪಡೆಯಿರಿ:
```bash
# ಅಪ್ಲಿಕೇಶನಿನ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show

# ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನನ್ನು ತೆರೆyಿರಿ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
1. **ಟೋಡೋ ಆಯಿಟಂ ಸೇರಿಸಿ** - "Add Todo" ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ ಮತ್ತು ಒಂದು ಟಾಸ್ಕ್ ನಮೂದಿಸಿ
2. **ಸಂಪೂರ್ಣವೆಂದು ಗುರುತಿಸಿ** - ಪೂರ್ಣಗೊಂಡ ಐಟಂಗಳನ್ನು ಚೆಕ್ ಮಾಡಿ
3. **ಐಟಂಗಳನ್ನು ಅಳಿಸಿ** - ನೀವು ಬೇಕಿಲ್ಲದ ಟೋಡೋವನ್ನು ಅಳಿಸಿ

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಗಾ ವಹಿಸಿ
```bash
# ನಿಮ್ಮ ಸಂಪನ್ಮೂಲಗಳಿಗಾಗಿ Azure ಪೋರ್ಟಲ್ ತೆರೆಯಿರಿ
azd monitor

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಲೈವ್ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live
```

## ಹಂತ 6: ಬದಲಾವಣೆ ಮಾಡಿ ಮತ್ತು ಪುನಃನಿಯೋಜಿಸಿ

ಒಂದು ಬದಲಾವಣೆ ಮಾಡಿ ಮತ್ತು ನವೀಕರಣ 얼마나 ಸುಲಭವಾಗಿದೆ ಎಂದು ನೋಡೋಣ:

### API ಅನ್ನು ಬದಲಿಸಿ
```bash
# API ಕೋಡ್ ಅನ್ನು ಸಂಪಾದಿಸಿ
code src/api/src/routes/lists.js
```

ಕಸ್ಟಮ್ ಪ್ರತಿಕ್ರಿಯಾ ಹೆಡರ್ ಸೇರಿಸಿ:
```javascript
// ರೌಟ್ ಹ್ಯಾಂಡ್ಲರ್ ಅನ್ನು ಕಂಡು ಅದಕ್ಕೆ ಸೇರಿಸಿ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ಕೋಡ್ ಬದಲಾವಣೆಗಳನ್ನು ಮಾತ್ರ ನಿಯೋಜಿಸಿ
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಮಾತ್ರ ನಿಯೋಜಿಸಿ (ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಬಿಟ್ಟುಬಿಡಿ)
azd deploy

# ಇದು 'azd up' ಗಿಂತ ಬಹಳವೇ ವೇಗವಾಗಿದೆ ஏಕೆಂದರೆ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಈಗಾಗಲೇ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ
```

## ಹಂತ 7: ಹಲವು ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಿ

ಪ್ರೋಡಕ್ಷನ್‌ಗಾಗಿ ಮೊದಲು ಬದಲಾವಣೆಗಳನ್ನು ಪರೀಕ್ಷಿಸಲು staging ಪರಿಸರವನ್ನು ರಚಿಸಿ:

```bash
# ಹೊಸ ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ಸೃಷ್ಟಿಸಿ
azd env new staging

# ಸ್ಟೇಜಿಂಗ್‌ಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಮತ್ತೆ ಡೆವ್ ಪರಿಸರಕ್ಕೆ ಬದಲಾಯಿಸಿ
azd env select dev

# ಎಲ್ಲಾ ಪರಿಸರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env list
```

### ಪರಿಸರ ಹೋಲಿಕೆ
```bash
# ಡೆವ್ ಪರಿಸರವನ್ನು ವೀಕ್ಷಿಸಿ
azd env select dev
azd show

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ವೀಕ್ಷಿಸಿ
azd env select staging
azd show
```

## ಹಂತ 8: ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ

ಪ್ರಯೋಗ ಮುಗಿದ ನಂತರ, ನಿರಂತರ ಶುಲ್ಕ ತಪ್ಪಿಸಲು ಸ್ವಚ್ಛಗೊಳಿಸಿ:

```bash
# ಪ್ರಸ್ತುತ ಪರಿಸರದ ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಳಿಸಿ
azd down

# ದೃಢೀಕರಣವಿಲ್ಲದೆ ಜೋರಾಗಿ ಅಳಿಸಿ ಮತ್ತು ಸಾಫ್ಟ್-ಅಳಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ತೆಗೆದುಹಾಕಿ
azd down --force --purge

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರವನ್ನು ಅಳಿಸಿ
azd env select staging
azd down --force --purge
```

## ನೀವು ಏನು ಕಲಿತಿರಿ

ಅಭಿನಂದನೆಗಳು! ನೀವು ಯಶಸ್ವಿಯಾಗಿ:
- ✅ ಟೆಂಪ್ಲೇಟಿನಿಂದ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿದ್ದಾರೆ
- ✅ ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಪ್ರಮುಖ ಫೈಲ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿದ್ದಾರೆ
- ✅ ಪೂರ್ಣ-ಸ್ಟಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ನಿಯೋಜಿಸಿದ್ದಾರೆ
- ✅ ಕೋಡ್ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಪುನಃ ನಿಯೋಜಿಸಿದ್ದಾರೆ
- ✅ ಹಲವಾರು ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಿದ್ದಾರೆ
- ✅ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿದ್ದಾರೆ

## 🎯 ಕೌಶಲ್ಯ ಪರಿಶೀಲನಾ ವ್ಯಾಯಾಮಗಳು

### ವ್ಯಾಯಾಮ 1: ಬೇರೆ ಟೆಂಪ್ಲೇಟ್ ನಿಯೋಜಿಸಿ (15 ನಿಮಿಷ)
**ಉದ್ದೇಶ**: azd init ಮತ್ತು ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹದ ನಿಪುಣತೆಯನ್ನು ತೋರಿಸುವುದು

```bash
# Python + MongoDB ಸ್ಟ್ಯಾಕ್ ಪ್ರಯತ್ನಿಸಿ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಸಫಲತಾ ಮಾನದಂಡಗಳು:**
- [ ] ಅಪ್ಲಿಕೇಶನ್ ದೋಷರಹಿತವಾಗಿ ನಿಯೋಜಿಸುತ್ತದೆ
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ URL ಪ್ರವೇಶಿಸಲು ಸಾಧ್ಯವಾಗಿದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ (ಟೋಡೋಗಳನ್ನು ಸೇರಿಸಿ/ತೆಗೆದುಹಾಕಿ)
- [ ] ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸ್ವಚ್ಛಗೊಳಿಸಲಾಗಿದೆ

### ವ್ಯಾಯಾಮ 2: ಕಾನ್ಫಿಗರೇಶನ್ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ (20 ನಿಮಿಷ)
**ಉದ್ದೇಶ**: ಪರಿಸರ ವ್ಯತ್ಯಯಗಳ ಸಂರಚನೆ ಅಭ್ಯಾಸ ಮಾಡುವುದು

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

**ಸಫಲತಾ ಮಾನದಂಡಗಳು:**
- [ ] ಕಸ್ಟಮ್ ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ
- [ ] ಪರಿಸರ ವ್ಯತ್ಯಯಗಳು ಸೆಟ್ ಆಗಿ ಪ್ರಾಪ್ಯವಾಗಿವೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಕಸ್ಟಮ್ ಸಂರಚನೆಯೊಂದಿಗೆ ನಿಯೋಜಿಸಲಾಗಿದೆ
- [ ] ನಿಯೋಜಿತ ಅಪ್ಲಿಕೇಶನಲ್ಲಿ ಕಸ್ಟಮ್ ಸೆಟ್ಟಿಂಗ್ಸ್ ಪರಿಶೀಲಿಸಬಹುದಾಗಿದೆ

### ವ್ಯಾಯಾಮ 3: ಬಹು-ಪರಿಸರ ಕಾರ್ಯಪ್ರವಾಹ (25 ನಿಮಿಷ)
**ಉದ್ದೇಶ**: ಪರಿಸರ ನಿರ್ವಹಣೆ ಮತ್ತು ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ನಿಭಾಯಿಸುವಲ್ಲಿ ಪರಿಣತಿ ಪಡೆಯುವುದು

```bash
# ವಿಕಾಸದ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ವಿಕಾಸದ URL ಅನ್ನು ಗಮನಿಸಿ
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

**ಸಫಲತಾ ಮಾನದಂಡಗಳು:**
- [ ] ವಿಭಿನ್ನ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಎರಡು ಪರಿಸರಗಳು ರಚಿಸಲಾಗಿದೆ
- [ ] ಎರಡೂ ಪರಿಸರಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] `azd env select` ಬಳಸಿ ಪರಿಸರಗಳ ನಡುವೆ ಸ್ವಿಚ್ ಮಾಡಬಹುದು
- [ ] ಪ್ರತಿ ಪರಿಸರದ ನಡುವೆ ಪರಿಸರ ವ್ಯತ್ಯಯಗಳು ಭಿನ್ನವಾಗಿವೆ
- [ ] ಎರಡೂ ಪರಿಸರಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸ್ವಚ್ಛಗೊಳಿಸಲಾಗಿದೆ

## 📊 ನಿಮ್ಮ ಪ್ರಗತಿ

**ಹೂಡಿದ ಸಮಯ**: ~60-90 ನಿಮಿಷಗಳು  
**ಸ್ವೀಕರಿಸಿದ ಕೌಶಲ್ಯಗಳು**:
- ✅ ಟೆಂಪ್ಲೇಟು ಆಧಾರಿತ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭ
- ✅ Azure ಸಂಪನ್ಮೂಲಗಳ ನಿರ್ಮಾಣ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳು
- ✅ ಪರಿಸರ ನಿರ್ವಹಣೆ
- ✅ ಸಂರಚನೆ ನಿರ್ವಹಣೆ
- ✅ ಸಂಪನ್ಮೂಲ ಸ್ವಚ್ಛತೆ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣೆ

**ಮುಂದಿನ ಹಂತ**: ಮುಂದಿನ ಕಾನ್ಫಿಗರೇಶನ್ ಮಾದರಿಗಳನ್ನು ಕಲಿಯಲು ನೀವು [ಕಾನ್ಫಿಗರೇಶನ್ ಮಾರ್ಗದರ್ಶಿ](configuration.md) ಗೆ ಸಿದ್ಧರಾಗಿದ್ದೀರಿ!

## ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸುವಿಕೆ

### ಪ್ರಮಾಣೀಕರಣ ದೋಷಗಳು
```bash
# Azure ನಲ್ಲಿ ಮರುಪ್ರಮಾಣೀಕರಿಸಿ
az login

# ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು
```bash
# ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd up --debug

# ಏಜೂರ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# Container Apps ಗಾಗಿ, Azure CLI ಅನ್ನು ಬಳಸಿ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ಸಂಪನ್ಮೂಲ ಹೆಸರು ಘর্ষಣೆಗಳು
```bash
# ಅದ್ವಿತೀಯ ಪರಿಸರದ ಹೆಸರನ್ನು ಬಳಸಿ
azd env new dev-$(whoami)-$(date +%s)
```

### ಪೋರ್ಟ್/ನೆಟ್‌ವರ್ಕ್ ಸಮಸ್ಯೆಗಳು
```bash
# ಪೋರ್ಟ್‌ಗಳು ಲಭ್ಯವಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
netstat -an | grep :3000
netstat -an | grep :3100
```

## ಮುಂದಿನ ಹಂತಗಳು

ನೀವು ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ ಮುಗಿಸಿರುವ ನಂತರ, ಈ ದರ್ಜೆಯ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

### 1. ಮೂಲಸೌಕರ್ಯ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ
- [ಕோಡ್‌ ರೂಪದಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ](../chapter-04-infrastructure/provisioning.md)
- [ಡೇಟಾಬೇಸ್‌ಗಳು, ಸ್ಟೋರೇಜ್ ಮತ್ತು ಇತರೆ ಸೇವೆಗಳನ್ನು ಸೇರಿಸಿ](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ಸ್ಥಾಪಿಸಿ
- [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ಪೂರ್ಣ CI/CD ಕಾರ್ಯಪ್ರವಾಹಗಳು
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ಪೈಪ್‌ಲೈನ್ ಸಂರಚನೆ

### 3. ಉತ್ಪಾದನಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು
- [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ಭದ್ರತೆ, ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ನಿಗಾವಹಣೆ

### 4. ಇನ್ನಷ್ಟು ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಅನ್ವೇಷಿಸಿ
```bash
# ವರ್ಗದ ಮೂಲಕ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ವಿವಿಧ ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್‌ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಕಲಿಕಾ ವಸ್ತುಗಳು
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### ಸಮುದಾಯ ಮತ್ತು ಬೆಂಬಲ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ಟೆಂಪ್ಲೇಟುಗಳು ಮತ್ತು ಉದಾಹರಣೆಗಳು
- [ಅಧಿಕೃತ ಟೆಂಪ್ಲೇಟ್ ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/)
- [ಸಮುದಾಯ ಟೆಂಪ್ಲೇಟ್‌ಗಳು](https://github.com/Azure-Samples/azd-templates)
- [ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ನಿಮ್ಮ ಮೊದಲ azd ಪ್ರಾಜೆಕ್ಟ್ ಪೂರ್ಣಗೊಳಿಸಿದ್ದಕ್ಕೆ ಅಭಿನಂದನೆಗಳು!** ನೀವು ಈಗ ವಿಶ್ವಾಸದಿಂದ Azure ನಲ್ಲಿ ಅದ್ಭುತ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ನಿಯೋಜಿಸಲು ಸಿದ್ಧರಾಗಿದ್ದೀರಿ.

---

**ಅಧ್ಯಾಯ ದಿಕ್ಕುಬೆಳೆವಿಕೆ:**
- **📚 ಕೋರ್ಸ್ ಮುಖಪುಟ**: [AZD ಆರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಮೂಲಭೂತ ಮತ್ತು ತ್ವರಿತ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [Installation & Setup](installation.md)
- **➡️ ಮುಂದಿನದು**: [ಕಾನ್ಫಿಗರೇಶನ್](configuration.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **ಮುಂದಿನ ಪಾಠ**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ ಅನ್ನು AI ಅನುವಾದ ಸೇವೆ Co-op Translator (https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಯನ್ನು ಕಾಪಾಡಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅನಿಖರತೆಗಳು ಇರಬಹುದೆಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿ ಇಟ್ಟುಕೊಳ್ಳಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆ ಅನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸುವುದು נכון. ಮಹತ್ವದ ಮಾಹಿತಿಗೆ ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಂಜಸತೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->