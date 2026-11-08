# ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ - ಕೈಗೆಟ್ಟು ತರಬೇತಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: Chapter 1 - ಪೌಂಡೇಶನ್ & ತ್ವರೆಗೆ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [ಇನ್‌ಸ್ಟಾಲೇಶನ್ & ಸೆಟಪ್](installation.md)
- **➡️ ಮುಂದಿನದು**: [ನಿಮ್ಮ ಸ್ವಂತ ಆಪ್ ತಂದುಕೊಡಿ](bring-your-own-app.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ಪರಿಚಯ

ನಿಮ್ಮ ಮೊದಲ Azure Developer CLI ಪ್ರಾಜೆಕ್ಟ್‌ಗೆ ಸ್ವಾಗತ! ನೀವು React ಫ್ರಂಟ್‌ಎಂಡ್, Node.js API ಮತ್ತು Azure Cosmos DB ಮೂಲಕ ಟುಡೋ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಲಾಗುತ್ತದೆ. ಟೆಂಪ್ಲೇಟ್ ಇತಿಹಾಸಿಕ ಹೆಸರು `todo-nodejs-mongo` ಅನ್ನು ಉಳಿಸಿಕೊಂಡಿದ್ದು, ಅದರ ಪ್ರಸ್ತುತ ಮೂಲಸೌಕರ್ಯ Cosmos DB ನೊSQL ನಿಗಾಗಿ ಬಳಸುತ್ತದೆ, ಆದ್ದರಿಂದ ಡೌನ್ಲೋಡ್ ಮಾಡಿದ README ಮತ್ತು `infra/` ಅನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಡೇಟಾಬೇಸ್ API ಯನ್ನು ಹೆಸರಿನಿಂದ ಊಹಿಸಬೇಡಿ.

> ನವೆಂಬರ್ 2026 ರಲ್ಲಿ `azd 1.37.2` ಮತ್ತು ಸಾರ್ವಜನಿಕ ಟೆಂಪ್ಲೇಟನ್ನು ಆಧರಿಸಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ. ಕೆಳಗಿನ ಉದಾಹರಣೆಗಳು Bash ಬಳಸುತ್ತವೆ; JSON ತೆಗೆಯಲು ಕೂಡ `jq` ಬೇಕಾಗುತ್ತದೆ. Azure ನಿಯೋಜನೆಗಳಿಗೆ ಶುಲ್ಕ ಆಗುತ್ತದೆ ಮತ್ತು ಈ ಪರಿಶೀಲನೆ ಸಮಯದಲ್ಲಿ ಕಾರ್ಯಗತಗೊಳಿಸಲಿಲ್ಲ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ತರಬೇತಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸುವ ವರ್ಕ್ಫ್ಲೋವನ್ನು ಟೆಂಪ್ಲೇಟುಗಳಿಂದ ನೀರ್ಗತವಾಗಿ ಆಸಕ್ತರಾಗುವುದು
- Azure Developer CLI ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಸಂರಚನಾ ಕಡತಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಮೂಲಸೌಕರ್ಯ ವಿಹಿತಿಸುವ ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ Azure ಗೆ ನಿಯೋಜಿಸುವುದು
- ಅಪ್ಲಿಕೇಶನ್ ಅಪ್ಡೇಟ್ ಮತ್ತು ಪುನರ್ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್ಿಗಾಗಿ ಅನೇಕ ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು
- ಸಂಪನ್ಮೂಲ ಶುದ್ಧೀಕರಣ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣೆಯ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಅನ್ವಯಿಸುವುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸುವ ನಿಮಗೆ ಸಾಧ್ಯವಾಗುವುದು:
- ಟೆಂಪ್ಲೇಟಿನಿಂದ ಸ್ವತಂತ್ರವಾಗಿ azd ಪ್ರಾಜೆಕ್ಟ್ ಆರಂಭಿಸಿ ಮತ್ತು ಸಂರಚಿಸಬಹುದು
- azd ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಗಳನ್ನು ನಾವಿಗೇಟ್ ಮತ್ತು ಬದಲಾಯಿಸಲು ದಕ್ಷರಾಗಿರಿ
- ಏಕಕಮಾಂಡ್‌ಗಳಿಂದ Azure ಗೆ ಫುಲ್ ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಬಹುದು
- ಸಾಮಾನ್ಯ ನಿಯೋಜನಾ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ದೃಢೀಕರಣ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಬಹುದು
- ವಿವಿಧ ನಿಯೋಜನೆ ಹಂತಗಳಿಗೆ ಅನೇಕ Azure ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಬಹುದು
- ಅಪ್ಲಿಕೇಶನ್ ಅಪ್ಡೇಟ್ಗಾಗಿ ನಿರಂತರ ನಿಯೋಜನೆ ವರ್ಕ್ಫ್ಲೋಗಳನ್ನು ಅನುಷ್ಠಾನ ಮಾಡಬಹುದು

## ಪ್ರಾರಂಭಿಸುವುದು

### ಪೂರ್ವನಿಗಮಣ ಪರಿಶೀಲನಾ ಪಟ್ಟಿಗೆ
- ✅ Azure Developer CLI ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಲಾಗಿದೆ ([ಇನ್‌ಸ್ಟಾಲೇಶನ್ ಮಾರ್ಗದರ್ಶಿ](installation.md))
- ✅ AZD ದೃಢೀಕರಣವು `azd auth login` ಮೂಲಕ ಪೂರ್ಣಗೊಂಡಿದೆ
- ✅ ನಿಮ್ಮ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ Git ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಲಾಗಿದೆ
- ✅ Node.js 22 LTS (ಅಥವಾ ಡೌನ್ಲೋಡ್ ಮಾಡಿದ ಟೆಂಪ್ಲೇಟಿನ ಅಗತ್ಯವಿರುವ ಬೆಂಬಲಿತ ಆವೃತ್ತಿ)
- ✅ Visual Studio Code (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)

ಮುಂದುವರೆಯುವ ಮೊದಲು, ರೆಪೊ ಮೂಲದಿಂದ ಸೆಟಪ್ ಚಾಲಕವನ್ನು ನಿರ್ವಹಿಸಿ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ನಿಮ್ಮ ಸೆಟಪ್ ಪರಿಶೀಲಿಸಿ
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ಐಚ್ಛಿಕ Azure CLI ದೃಢೀಕರಣ ಪರಿಶೀಲಿಸಿ

```bash
az account show
```

### Node.js ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
```bash
node --version
```

## ಹಂತ 1: ಟೆಂಪ್ಲೇಟನ್ನು ಆಯ್ಕೆ ಮಾಡಿ ಪ್ರಾರಂಭಿಸಿ

React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು Node.js API ಬ್ಯಾಕ್‌ಎಂಡ್ ಹೊಂದಿರುವ ಜನಪ್ರಿಯ ಟುಡೋ ಅಪ್ಲಿಕೇಶನ್ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸೋಣ.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ಏನು ನಡೆಯಿತು?
- ಟೆಂಪ್ಲೇಟ್ ಕೋಡ್ ನಿಮ್ಮ ಸ್ಥಳೀಯ ಡೈರೆಕ್ಟರಿಗೆ ಡೌನ್ಲೋಡ್ ಮಾಡಲಾಯಿತು
- ಸೇವೆಗಳ ನಿರ್ಧಾರಗಳೊಂದಿಗೆ ಒಂದು `azure.yaml` ಕಡತ ರಚಿಸಲಾಯಿತು
- ಮೂಲಸೌಕರ್ಯ ಕೋಡ್ ಅನ್ನು `infra/` ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಶೇಖರಿಸಲಾಯಿತು
- ಒಂದು ಪರಿಸರ ಸಂರಚನೆ ರಚಿಸಲಾಯಿತು

## ಹಂತ 2: ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಯನ್ನು ಅನ್ವೇಷಿಸಿ

azd ನಮಗೆ ಏನು ರಚಿಸಿದೆ ಎಂದು ಪರಿಶೀಲಿಸೋಣ:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

ನೀವು ನೋಡಬೇಕು:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಕಾದ ಪ್ರಮುಖ ಕಡತಗಳು

**azure.yaml** - ನಿಮ್ಮ azd ಪ್ರಾಜೆಕ್ಟ್‌ನ ಹೃದಯ ಭಾಗ:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - ಮೂಲಸೌಕರ್ಯ ವಿವರ:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ಹಂತ 3: ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ವೈಯಕ್ತಿಕಗೊಳಿಸಿ (ಐಚ್ಛಿಕ)

ನಿಯೋಜಿಸುವ ಮುಂಚೆಯೇ, ನೀವು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ತಿದ್ದುಪಡಿ ಮಾಡಬಹುದು:

### ಫ್ರಂಟ್‌ಎಂಡ್ ಬದಲಾಯಿಸಿ
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ಸರಳ ಬದಲಾವಣೆ ಮಾಡಿ:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### ಪರಿಸರ ಚರಗಳನ್ನು ಸಂರಚಿಸಿ
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

ಈ ಎರಡು ಕಸ್ಟಮ್ ಮೌಲ್ಯಗಳು ಸ್ಥಳೀಯ ಸಂಗ್ರಹಣೆಯನ್ನು ಮಾತ್ರ ಪ್ರದರ್ಶಿಸುತ್ತವೆ. ಸ್ಟಾಕ್ ಟೆಂಪ್ಲೇಟು `WEBSITE_TITLE` ಅಥವಾ `API_VERSION` ಅನ್ನು ಉಪಯೋಗಿಸುವುದಿಲ್ಲ, ಆದ್ದರಿಂದ ಅವು ಅಪ್ಲಿಕೇಶನ್ ಬದಲಾಯಿಸವೆ. ಮೇಲಿನ ಸ್ಪಷ್ಟ ಮೂಲ ಸಂಪಾದನೆ ಪ್ರದರ್ಶಿಸಲಾದ ಶೀರ್ಷಿಕೆಯನ್ನು ಬದಲಾಯಿಸುತ್ತದೆ.

## ಹಂತ 4: Azure ಗೆ ನಿಯೋಜಿಸಿ

ಈಗ ಮನೋರಂಜನೆಯ ಭಾಗಕ್ಕೆ ಬಂದಿದ್ದೇವೆ - ಎಲ್ಲವನ್ನೂ Azure ಗೆ ನಿಯೋಜಿಸಿ!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ನಿಯೋಜನೆ ಸಮಯದಲ್ಲಿ ಏನು ನಡೆಯುತ್ತಿದೆ?

ವರ್ಕ್ಫ್ಲೋ ಮೂಲಸೌಕರ್ಯವನ್ನು ಒದಗಿಸುತ್ತದೆ ಮತ್ತು ಕೋಡ್ ಪ್ಯಾಕೇಜ್/ನಿಯೋಜನೆಯು ನಡೆಯುತ್ತದೆ. ನಿಖರ ಆದೇಶವನ್ನು `workflows.up` ಅನ್ನು `azure.yaml` ನಲ್ಲಿ ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದು; ಈ ಟೆಂಪ್ಲೇಟ್ Provision ಬಿಟ್ಟು Deploy ಅನ್ನು ಅನುಸರಿಸುತ್ತದೆ. ಪ್ರತಿಯೊಬ್ಬ ಟೆಂಪ್ಲೇಟ್‌ಗೆ ಒಬ್ಬ ಸಾಮಾನ್ಯ ಹಂತ ಆದೇಶ ಮೇಲೆ ನಿರ್ಭರಿಸಬೇಡಿ.

### ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ಹಂತ 5: ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನನ್ನು ಪರೀಕ್ಷಿಸಿ

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರವೇಶಿಸಿ
ನಿಯೋಜನೆ ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ನೀಡಲಾದ URL ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ, ಅಥವಾ ಯಾವುದೆ ಸಮಯದಲ್ಲೂ ಪಡೆಯಿರಿ:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### ಟುಡೋ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
1. **ಟುಡೋ ಐಟಂ ಸೇರಿಸಿ** - "Add Todo" ಅನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ ಮತ್ತು ಒಂದು ಕಾರ್ಯ ನಮೂದಿಸಿ
2. **ಪೂರ್ಣವಾಗಿದೆ ಎಂದು ಗುರುತಿಸಿ** - ಪೂರ್ಣಗೊಂಡ ಐಟಂಗಳನ್ನು ಅನಾವಣಿ ಮಾಡಿ
3. **ಐಟಂಗಳನ್ನು ಅಳಿಸಿ** - ನಿಮಗೆ ಬೇಕಾಗದ ಟುಡೋಗಳನ್ನು ತೆಗೆದುಹಾಕಿ

### ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ ನಿಮ್ಮ ನಿಯೋಜನೆ ಪರಿಶೀಲಿಸಿ

ಮುಂದಿನ ಹಂತಕ್ಕೆ ಹೋಗುವ ಮೊದಲು, ಈ ದ್ರುತ ಪರಿಶೀಲನಾ ಪಟ್ಟಿಯೊಂದಿಗೆ ಎಲ್ಲವೂ ಯಥಾರ್ಥವಾಗಿರುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ—“Deploy Succeeded” ಅರ್ಥ “App Works” ಎಂದು ಊಹಿಸಬೇಡಿ:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಆಗುವಾಗ:**
- ✅ `azd show` ಪತ್ತೆಯಾಗುವ ಎಂಡ್‌ಪಾಯಿಂಟ್ URL ಅನ್ನು ಕೊಡುತ್ತದೆ
- ✅ ಆ URL ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ದೋಷರಹಿತವಾಗಿ ತೆರೆಯುತ್ತದೆ
- ✅ ಪ್ರಮುಖ ವೈಶಿಷ್ಟ್ಯಗಳು ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತವೆ (ಸೇರಿಸುವುದು/ಪೂರ್ಣಗೊಳಿಸುವುದು/ಅಳಿಸುವುದು)
- ✅ `azd monitor --logs` ವಿನಂತಿಗಳನ್ನು ಯಾವುದೇ ಅಪರಿಚಿತ ದೋಷವಿಲ್ಲದೆ ತೋರಿಸುತ್ತದೆ

ಯಾವುದೇ ಪರಿಶೀಲನೆ ವಿಫಲವಾದರೆ, [ಅಧ್ಯಾಯ 7: ತೊಂದರೆ ಪರಿಹಾರ](../chapter-07-troubleshooting/README.md) ಗೆ ಹೋಗಿ.

## ಹಂತ 6: ಬದಲಾವಣೆ ಮಾಡಿ ಪುನರ್ನಿಯೋಜನೆ ಮಾಡಿ

ಬದಲಾವಣೆ ಮಾಡಿ, ಅದನ್ನು ಹೇಗೆ ಸುಲಭವಾಗಿ ಅಪ್ಡೇಟ್ ಮಾಡಬಹುದೋ ನೋಡುಗೊಳ್ಳೋಣ:

### API ಬದಲಾಯಿಸಿ
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

ಕಸ್ಟಮ್ ಪ್ರತಿಕ್ರಿಯಾ ಹೆಡರ್ ಅನ್ನು ಸೇರಿಸಿ:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ಕೇವಲ ಕೋಡ್ ಬದಲಾವಣೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ಹಂತ 7: ಬಹುಪರಿಸರ ನಿರ್ವಹಣೆ

ಉತ್ಪಾದನೆಯ ಮೊದಲು ಬದಲಾವಣೆಗಳನ್ನು ಪರೀಕ್ಷಿಸಲು ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ಸೃಷ್ಟಿಸಿ:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### ಪರಿಸರ ಹೋಲಿಕೆ
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## ಹಂತ 8: ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ

ಪ್ರಯೋಗಮಾಡಿ ಮುಗಿಸಿದ ಮೇಲೆ, ಮುಂದುವರಿದ ಶುಲ್ಕ ತಪ್ಪಿಸಲು ಸ್ವಚ್ಛಗೊಳಿಸಿ:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## ಕ್ಲಾಸಿಕ್ ಅಪ್ಲಿಕೇಶನ್ ವಿರುದ್ಧ AI-ಆಧಾರಿತ ಅಪ್ಲಿಕೇಶನ್: ಸಮಾನ ವರ್ಕ್ಫ್ಲೋ

ನೀವು ಇತ್ತೀಚೆಗೆ ಸಾಂಪ್ರದಾಯಿಕ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿದ್ದೀರಿ. ಆದರೆ ನೀವು AI ಆಧಾರಿತ ಆಪ್, ಉದಾಹರಣೆಗೆ, Microsoft Foundry Models ಮೂಲಕ ಬೆಂಬಲಿತ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಲು ಬಯಸಿದರೆ ಏನು?

ಸುನ ಮಹತ್ವದ ಸಂಗತಿ: **ವರ್ಕ್ಫ್ಲೋ ಒಂದೇ ಆಗಿರುತ್ತದೆ.**

| ಹಂತ | ಕ್ಲಾಸಿಕ್ ಟುಡೋ ಅಪ್ಲಿಕೇಶನ್ | AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ |
|------|-----------------|-------------|
| ಪ್ರಾರಂಭಿಸಿ (ಖಾಲಿ ಡೈರೆಕ್ಟರಿ) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| ದೃಢೀಕರಿಸಿ | `azd auth login` | `azd auth login` |
| ನಿಯೋಜಿಸಿ | `azd up` | `azd up` |
| ಮೇಲ್ವಿಚಾರಣೆ | `azd monitor` | `azd monitor` |
| ಸ್ವಚ್ಛಗೊಳಿಸಿ | `azd down --force --purge` | `azd down --force --purge` |

ಜೀವನಚಕ್ರ ಆಜ್ಞೆಗಳು ಒಂದೇ, ಆದರೆ ಪೂರ್ವನಿಬಂಧನೆಗಳು ಭಿನ್ನವಾಗಿರುತ್ತವೆ. AI ಟೆಂಪ್ಲೇಟುಗೆ ಮಾದರಿ ಪ್ರವೇಶ, ಪ್ರಾಂತಿಯ ಕನಿಷ್ಟ ಪ್ರಮಾಣ, ಡೇಟಾ ಆಮದು ಮತ್ತು ಹೆಚ್ಚುವರಿ ಸಂರಚನೆ ಅಗತ್ಯವಿರಬಹುದು. ನಿಯೋಜನೆಗೂ ಮುನ್ನ ಅದರ README ಅನ್ನು ಓದಿರಿ; `azd up` ಕಳೆದುಹೋಗಿದ ಅನುಮತಿಗಳು ಅಥವಾ ಪ್ರಮಾಣವನ್ನು ಒದಗಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.

ಇದು azd ರ ಮೂಲ ತತ್ತ್ವ: **ಒಂದು ವರ್ಕ್ಫ್ಲೋ, ಯಾವುದೇ ಕಾರ್ಯಭಾರ.** ನೀವು ಈ ತರಬೇತಿಯಲ್ಲಿಟ್ಟು ಅಭ್ಯಾಸ ಮಾಡಿದ ಕೌಶಲ್ಯಗಳು - ಪ್ರಾರಂಭಿಸುವುದು, ನಿಯೋಜಿಸುವುದು, ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡುವುದು, ಪುನರ್ನಿಯೋಜಿಸುವುದು, ಮತ್ತು ಸ್ವಚ್ಛಗೊಳಿಸುವುದು - AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೂ ಮತ್ತು ಏಜೆಂಟ್‌ಗಳಿಗೂ ಸಮಾನವಾಗಿ ಅನ್ವಯಿಸುತ್ತದೆ.

---

## ನೀವು ಏನು ಕಲಿತಿರಿ

ಅಭಿನಂದನೆಗಳು! ನೀವು ಯಶಸ್ವಿಯಾಗಿ:
- ✅ ಟೆಂಪ್ಲೇಟಿಂದ azd ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿದಿರಿ
- ✅ ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಪ್ರಮುಖ ಕಡತಗಳನ್ನು ಅನ್ವೇಷಿಸಿದಿರಿ
- ✅ Azure ಗೆ ಪೂರ್ಣ-ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸಿದಿರಿ
- ✅ ಕೋಡ್ ಬದಲಾವಣೆ ಮಾಡಿ ಪುನರ್ನಿಯೋಜನೆ ಮಾಡಿದಿರಿ
- ✅ ಅನೇಕ ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಿದಿರಿ
- ✅ ಸಂಪನ್ಮೂಲ ಶುದ್ಧೀಕರಣ ಮಾಡಿದ್ದೀರಿ

## 🎯 ಕೌಶಲ್ಯ ಯಥಾರ್ಥತಾ ವ್ಯಾಯಾಮಗಳು

### ವ್ಯಾಯಾಮ 1: ಬೇರೆ ಟೆಂಪ್ಲೇಟ್ನ ನಿಯೋಜನೆ (15 ನಿಮಿಷ)
**ಗುರಿ**: azd init ಮತ್ತು ನಿಯೋಜನಾ ವರ್ಕ್ಫ್ಲೋದಲ್ಲಿ ನಿಪುಣತೆಯನ್ನು ತೋರಿಸಿ

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಅಪ್ಲಿಕೇಶನ್ ದೋಷರಹಿತವಾಗಿ ನಿಯೋಜನೆಗೊಳ್ಳುತ್ತದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್ URL ಬ್ರೌಸರ್ ನಲ್ಲಿ ಪ್ರವೇಶಿಸಬಹುದು
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ (ಸೇರಿಸುವುದು/ತೆಗೆದುಕೊಳ್ಳುವುದು ಟುಡೋಗಳು)
- [ ] ಯಶಸ್ವಿಯಾಗಿ ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಲಾಗಿದೆ

### ವ್ಯಾಯಾಮ 2: ಸಂರಚನೆ ವೈಯುಕ್ತಿಕಗೊಳಿಸಿ (20 ನಿಮಿಷ)
**ಗುರಿ**: ರನ್‌ಟೈಮ್ ಸಂರಚನೆಯೊಂದಿಗೆ ಗೊಂದಲವಿಲ್ಲದೆ ಸ್ಥಳೀಯ ಪರಿಸರ ಮೌಲ್ಯ ಸಂಗ್ರಹಣೆಯನ್ನು ಅಭ್ಯಾಸ ಮಾಡುವುದು

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಕಸ್ಟಮ್ ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ಸೃಷ್ಟಿಸಲಾಗಿದೆ
- [ ] ಪರಿಸರ ಚರಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಗಿದೆ ಮತ್ತು ಪಡೆಯಬಹುದು
- [ ] `azd env get-value APP_TITLE` `My Custom Todo App` ಅನ್ನು ಮುದ್ರಿಸುತ್ತದೆ
- [ ] ಈ ಮೌಲ್ಯಗಳು ಸ್ಟಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಬದಲಾಯಿಸುವುದಿಲ್ಲ ಎಂದು ವಿವರಿಸಬಹುದು (ಕೋಡ್/ಮೂಲಸೌಕರ್ಯದಿಂದ ಉಪಯೋಗಿಸದಿದ್ದರೆ)

### ವ್ಯಾಯಾಮ 3: ಬಹು-ಪರಿಸರ ವರ್ಕ್ಫ್ಲೋ (25 ನಿಮಿಷ)
**ಗುರಿ**: ಪರಿಸರ ನಿರ್ವಹಣೆ ಮತ್ತು ನಿಯೋಜನಾ ತಂತ್ರಗಳನ್ನು ನಿಖರವಾಗಿ ಆಳವಡಿ

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ವಿವಿಧ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಎರಡು ಪರಿಸರಗಳು ಸೃಷ್ಟಿಸಲಾಗಿದೆ
- [ ] ಎರಡೂ ಪರಿಸರಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲಾಗಿದೆ
- [ ] `azd env select` ಬಳಸಿ ಪರಿಸರಗಳ ನಡುವೆ ಬದಲಾವಣೆ ಮಾಡಬಹುದು
- [ ] ಪರಿಸರ ಚರಗಳು ಪರಿಸರಗಳ ನಡುವೆ ಭಿನ್ನವಾಗಿವೆ
- [ ] ಎರಡೂ ಪರಿಸರಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸ್ವಚ್ಛಗೊಳಿಸಲಾಗಿದೆ

## 📊 ನಿಮ್ಮ ಪ್ರಗತಿ

**ನಿವೇಶಿತ ಸಮಯ**: ~60-90 ನಿಮಿಷಗಳು  
**ಅर्जಿತ ಕೌಶಲ್ಯಗಳು**:
- ✅ ಟೆಂಪ್ಲೇಟು ಆಧಾರಿತ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭ
- ✅ Azure ಸಂಪನ್ಮೂಲ ಒದಗಿಸುವಿಕೆ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನಾ ವರ್ಕ್ಫ್ಲೋಗಳು
- ✅ ಪರಿಸರ ನಿರ್ವಹಣೆ
- ✅ ಸಂರಚನಾ ನಿರ್ವಹಣೆ
- ✅ ಸಂಪನ್ಮೂಲ ಶುದ್ಧೀಕರಣ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣೆ

**ಮುಂದಿನ ಹಂತ**: ನೀವು [ಸಂರಚನಾ ಮಾರ್ಗದರ್ಶಿ](../chapter-03-configuration/configuration.md) ಮೂಲಕ ಅಭಿವೃದ್ಧಿಪಡಿಸಿದ ಸಂರಚನಾ ಮಾದರಿಗಳನ್ನು ಕಲಿಯಲು ಸಿದ್ಧರಾಗಿದ್ದೀರಿ!

## ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ

### ದೃಢೀಕರಣದ ದೋಷಗಳು
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### ನಿಯೋಜನಾ ವೈಫಲ್ಯಗಳು
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ಸಂಪನ್ಮೂಲ ಹೆಸರು ಸಂಕಷ್ಟಗಳು
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### ಪೋರ್ಟ್/ನೆಟ್ವರ್ಕ್ ಸಮಸ್ಯೆಗಳು
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## ಮುಂದಿನ ಹಂತಗಳು

ನೀವು ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ, ಈ ಆಧುನಿಕ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

### 1. ಮೂಲಸೌಕರ್ಯವನ್ನು ವೈಯಕ್ತಿಕಗೊಳಿಸಿ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ಡೇಟಾಬೇಸ್ ಮೂಲಸೌಕರ್ಯ ಸೇರಿಸಿ](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD ಸೆಟ್‌ಅಪ್ ಮಾಡಿ
- [ನಿಯೋಜನಾ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ಪೂರ್ಣ CI/CD ವರ್ಕ್ಫ್ಲೋಗಳು
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ಪೈಪ್ಲೈನ್ ಸಂರಚನೆ

### 3. ಉತ್ಪಾದನಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು
- [ನಿಯೋಜನಾ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ಭದ್ರತೆ, ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆ

### 4. ಇನ್ನಷ್ಟು ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಅನ್ವೇಷಿಸಿ
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಕಲಿಕಾ ಸಾಮಗ್ರಿಗಳು
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure ಆರ್ಕಿಟೆಕ್ಚರ್ ಸೆಂಟರ್](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ಒಳ್ಳೆಯ ವಿನ್ಯಾಸದ ಫ್ರೇಮ್ವರ್ಕ್](https://learn.microsoft.com/en-us/azure/well-architected/)

### ಸಮುದಾಯ & ಬೆಂಬಲ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ಟೆಂಪ್ಲೇಟುಗಳು ಮತ್ತು ಉದಾಹರಣೆಗಳು
- [ಅಧಿಕೃತ ಟೆಂಪ್ಲೇಟು ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/)
- [ಸಮುದಾಯ ಟೆಂಪ್ಲೇಟು ಕೊಡುಗೆಗಳು](https://github.com/Azure/awesome-azd)
- [ಟುಡೋ ಟೆಂಪ್ಲೇಟು ಮೂಲ](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**ನಿಮ್ಮ ಮೊದಲ azd ಪ್ರಾಜೆಕ್ಟ್ ಪೂರ್ಣಗೊಳಿಸಿದಕ್ಕಾಗಿ ಅಭಿನಂದನೆಗಳು!** ನೀವು ಈಗ ಆತ್ಮವಿಶ್ವಾಸದಿಂದ Azureನಲ್ಲಿ ಅದ್ಭುತ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ನಿಯೋಜಿಸಲು ಸಿದ್ಧರು.

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: Chapter 1 - ಪೌಂಡೇಶನ್ & ತ್ವರೆಗೆ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [ಇನ್‌ಸ್ಟಾಲೇಶನ್ & ಸೆಟಪ್](installation.md)
- **➡️ ಮುಂದಿನದು**: [ನಿಮ್ಮ ಸ್ವಂತ ಆಪ್ ತಂದುಕೊಡಿ](bring-your-own-app.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->