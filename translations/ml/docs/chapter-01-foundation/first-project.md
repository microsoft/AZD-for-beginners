# നിങ്ങളുടെ ആദ്യ പ്രോജക്ട് - പ്രായോഗിക പാഠം

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 1 - അടിസ്ഥാനവും വേഗത്തിലുള്ള തുടക്കവും
- **⬅️ മുൻപ്**: [ഇൻസ്റ്റലേഷനും സജ്ജീകരണവും](installation.md)
- **➡️ അടുത്തത്**: [താങ്കളുടെ സ്വന്തം അപ്‌പ്പ് കൊണ്ടുവരുക](bring-your-own-app.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 2: AI-ഫസ്റ്റ് ഡെവലപ്മെന്റ്](../chapter-02-ai-development/microsoft-foundry-integration.md)

## പരിചയം

നിങ്ങളുടെ ആദ്യ Azure ഡെവലപ്പർ CLI പ്രോജക്ടിലേയ്ക്ക് സ്വാഗതം! നിങ്ങൾക്ക് React ഫ്രണ്ട്‌എൻഡ്, Node.js API, Azure Cosmos DB ഉള്ള ഒരു todo ആപ്പ് വിന്യസിക്കാൻ പോകുന്നു. ടെംപ്ലേറ്റ് ചരിത്രപരമായ പേര് `todo-nodejs-mongo` നിലനിർത്തുന്നു; ഇപ്പോഴത്തെ ഇൻഫ്രാസ്ട്രക്ചർ NoSQL-ക്ക് Cosmos DB ഉപയോഗിക്കുന്നു, അതിനാൽ ഡൗൺലോഡ് ചെയ്ത README ഉം `infra/` ഉം പരിശോദിക്കുക, ഡാറ്റാബേസ് API പേരിൽ നിന്നല്ല.

> നവംബർ 2026-ൽ `azd 1.37.2` പിന്നിൽ പൊതുവായ ടെംപ്ലേറ്റ് പരിശോധിച്ചു. താഴെ ഉദാഹരണങ്ങൾ Bash ഉപയോഗിക്കുന്നു; JSON എക്സ്ട്രക്ഷനും `jq` ആവശ്യമുണ്ട്. Azure വിന്യാസങ്ങൾക്ക് ചാർജുകൾ വരാം; ഈ അവലോകനത്തിൽ അത് നടത്തുവാൻ ആയില്ല.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ട്യൂട്ടോറിയൽ പരിപുഷ്ടമാക്കി നിങ്ങൾ:
- ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് azd പ്രോജക്ട് തുടങ്ങിയ പ്രവർത്തനം കൈകാര്യം ചെയ്യാൻ കഴിയും
- Azure ഡെവലപ്പർ CLI പ്രോജക്ട് ഘടനയും കോൺഫിഗറേഷൻ ഫയലുകളും മനസ്സിലാക്കുക
- ഐൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിങ്ങും കൊണ്ട് ആപ്പ് മുഴുവൻ Azure-ലേക്ക് വിന്യസിക്കുക
- ആപ്പ് അപ്‌ഡേറ്റുകളും പുനഃവിറ്റുവിളിയും നടപ്പിലാക്കുക
- വികസനത്തിനും സ്റ്റേജിംഗിനും നിരവധി പരിസ്ഥിതികൾ കൈകാര്യം ചെയ്യുക
- റിസോഴ്സ് ക്ലീനപ് ಮತ್ತು ചെലവ് നിയന്ത്രണ പ്രക്രിയകൾ പ്രയോജനം ചെയ്യുക

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കിയപ്പോള്‍, നിങ്ങൾ കഴിയും:
- ടെംപ്ലേറ്റുകളിൽ നിന്നും സ്വതന്ത്രമായി azd പ്രോജക്റ്റുകൾ ആരംഭിക്കുകയും കോൺഫിഗർ ചെയ്യുകയും
- azd പ്രോജക്ട് ഘടനകൾ ഫലപ്രദമായി നാവിഗേറ്റ് ചെയ്ത് ക്രമീകരിക്കുക
- ഏക കമാൻഡുകൾ ഉപയോഗിച്ച് Azure-ലേക്ക് ഫുൾ-സ്റ്റാക്ക് അപ്ലിക്കേഷനുകൾ വിന്യസിക്കുക
- സാധാരണ വിന്യാസ പ്രശ്നങ്ങളും ആധികാരീകരണ പ്രശ്നങ്ങളും പരിഹരിക്കുക
- വിവിധ വിന്യാസ ഘട്ടങ്ങൾക്കായി ഒന്നിലധികം Azure പരിസ്ഥിതികൾ കൈകാര്യംിക്കുക
- ആപ്പ് അപ്‌ഡേറ്റുകൾക്ക് കൺടിന്യുവസ് ഡെപ്ലോയ്เมന്റ് പ്രവൃത്തികൾ നടപ്പിലാക്കുക

## ആരംഭിക്കാൻ

### മുൻ‌നിർത്തേണ്ട സാധനങ്ങൾ പരിശോധിക്കുക
- ✅ Azure ഡെവലപ്പർ CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ട് ([Installation Guide](installation.md))
- ✅ `azd auth login` ഉപയോഗിച്ച് AZD ആധാരീകരണം പൂർത്തിയായി
- ✅ Git നിങ്ങളുടെ സിസ്റ്റത്തിൽ ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ട്
- ✅ Node.js 22 LTS (അല്ലെങ്കിൽ ഡൗൺലോഡ് ചെയ്ത ടെംപ്ലേറ്റിന് ആവശ്യമായ പിന്തുണയുള്ള വേർഷൻ)
- ✅ Visual Studio Code (അഭികാംക്ഷ്യ)

തുടരുന്നതിന് മുമ്പ്, റിപോസിറ്ററി റൂട്ടിൽ നിന്നും സജ്ജീകരണ പരിശോഥന പ്രവർത്തിപ്പിക്കുക:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### നിങ്ങളുടെ സജ്ജീകരണം പരിശോധിക്കുക
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ഐച്ഛിക Azure CLI ആധാരീകരണം പരിശോധന

```bash
az account show
```

### Node.js വേർഷൻ പരിശോധിക്കുക
```bash
node --version
```

## പടി 1: ടെംപ്ലേറ്റ് തിരഞ്ഞെടുക്കും തുടങ്ങിയും

React ഫ്രണ്ട്‌എൻഡ്, Node.js API ബാക്ക്‌എൻഡ് ഉൾപ്പെടുത്തിയ പ്രസിദ്ധമായ todo ആപ്പ് ടെംപ്ലേറ്റ് കൊണ്ടു തുടങ്ങാം.

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

### എന്ത് നടക്കുന്നു?
- ടെംപ്ലേറ്റ് കോഡ് നിങ്ങളുടെ ലോക്കൽ ഡയറക്ടറിയിലേക്ക് ഡൗൺലോഡ് ചെയ്തു
- സേവിസ് നിർവചനങ്ങളുമായി `azure.yaml` ഫയൽ നിർമ്മിച്ചു
- `infra/` ഡയറക്ടറിയിലെ ഇൻഫ്രാസ്ട്രക്ചർ കോഡ് സജ്ജീകരിച്ചു
- പരിസ്ഥിതി കോൺഫിഗറേഷൻ സൃഷ്ടിച്ചു

## പടി 2: പ്രോജക്ട് ഘടന പരിശോധിക്കുക

azd ഞങ്ങൾക്ക് സൃഷ്ടിച്ചതെയുടെ പരാമർശനമുന്‍ നോക്കാം:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

നിങ്ങൾ കാണുന്നത്:
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

### മനസിലാക്കാനുള്ള പ്രധാന ഫയലുകൾ

**azure.yaml** - നിങ്ങളുടെ azd പ്രോജക്ടിന്റെ ഹൃദയം:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - ഇൻഫ്രാസ്ട്രക്ചർ വിവരണം:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## പടി 3: പ്രോജക്ട് ഇച്ഛാനുസൃതമാക്കുക (ഐച്ഛികം)

വിന്യാസത്തിനു മുമ്പ്, ആപ്പ് ഇച്ഛാനുസൃതമാക്കാം:

### ഫ്രണ്ട്‌എൻഡ് മാറ്റുക
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ഒരു ലളിതമായ മാറ്റം ചെയ്യുക:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### പരിസ്ഥിതി മാറ്റിനിശ്ചയകങ്ങൾ ക്രമീകരിക്കുക
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

ഈ രണ്ട് കസ്റ്റം മൂല്യങ്ങൾ കേവലമായ ലോക്കൽ സ്റ്റോറേജിനെയാണ് കാണിക്കുന്നത്. സ്റ്റോക്ക് ടെംപ്ലേറ്റ് `WEBSITE_TITLE` അല്ലെങ്കിൽ `API_VERSION` ഉപയോഗിക്കുന്നത് അല്ല, അതിനാൽ ആപ്പ് മാറ്റിയില്ല. മുകൾ സോഴ്‌സ് എഡിറ്റ് പ്രദർശിപ്പിച്ച തലക്കെട്ട് മാറ്റുന്നു.

## പടി 4: Azure-ലേക്ക് വിന്യസിക്കുക

ഇപ്പോൾ രസകരമായ ഘട്ടം - എല്ലാം Azure-ലേക്ക് വിന്യസിക്കുക!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### വിന്യാസ സമയത്ത് എന്ത് നടക്കുന്നു?

പ്രവൃത്തി ചട്ടം ഇൻഫ്രാസ്ട്രക്ചർ ഒരുക്കുന്നതും കൊഡും പാക്കേജ് ചെയ്ത് വിന്യസിക്കുന്നതുമാണ്. കൃത്യമായ ഓർഡർ `workflows.up` ആണ് `azure.yaml` ൽ ക്രമീകരിക്കാം; ഈ ടെംപ്ലേറ്റ് പ്രൊവിഷൻ ശേഷം ഡെപ്ലോയ് ചെയ്യുന്നു. എല്ലാ ടെംപ്ലേറ്റുകൾക്കും ഏകസാരമായ ഘട്ടക്രമം ആശ്രയിക്കരുത്.

### പ്രതീക്ഷിക്കുന്ന ഔട്ട്പുട്ട്
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## പടി 5: നിങ്ങളുടെ ആപ്പ് പരിശോധിക്കുക

### ആപ്പിൽ ആക്‌സസ് ചെയ്യുക
വിന്യാസ ഔട്ട്പുട്ടിൽ നൽകിയ URL-ൽ ക്ലിക്ക് ചെയ്യുക അല്ലെങ്കിൽ എപ്പോഴും ലഭിക്കാം:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo ആപ്പ് പരീക്ഷിക്കുക
1. **ഒരു todo ഇനം ചേർക്കുക** - "Add Todo" ക്ലിക്ക് ചെയ്ത് ഒരു ടാസ്‌ക് നൽകുക
2. **തയ്യാറായി അടയാളപ്പെടുത്തുക** - പൂർത്തിയാക്കിയ ഇനങ്ങൾ ചെക്ക് ചെയ്യുക
3. **ഇനങ്ങൾ ഇല്ലാതാക്കുക** - ആവശ്യമില്ലാത്ത TODO കളെ നീക്കം ചെയ്യുക

### നിങ്ങളുടെ ആപ്പ് മോണിറ്റർ ചെയ്യുക
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ നിങ്ങളുടെ വിന്യാസം പരിശോധിക്കുക

മുന്നോട്ട് പോകുന്നതിനു മുൻപ്, മുകളിൽ പറഞ്ഞ ഈ രണ്ടാം പട്ടികയിൽ എല്ലാം ശരിയാണോ എന്ന് ഉറപ്പു വരുത്തുക - "വിന്യാസം വിജയിച്ചു" എന്നത് "ആപ്പ് പ്രവർത്തിക്കുന്നു" എന്നും കാണിക്കണ്ട.

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

**വിന്യാസം ശരിയാണെന്ന് സ്ഥിരീകരിക്കുന്നത്:**
- ✅ `azd show` എത്താനുള്ള URL ലിസ്റ്റ് ചെയ്യുന്നു
- ✅ ബ്രൗസറിൽ URL മേൽ പിഴവ് ഇല്ലാതെ തുറക്കുന്നു
- ✅ പ്രധാന ഫീച്ചറുകൾ പ്രവർത്തിക്കുന്നു (ചേർക്കുക/പൂർത്തിയാക്കുക/ഇല്ലാതാക്കുക TODO)
- ✅ `azd monitor --logs` ക്ക് അഭ്യർത്ഥനകൾ തെറ്റുകൾ ഇല്ലാതെ എത്തുന്നു കാണിക്കുന്നു

ഏതെങ്കിലും പരിശോധന പരാജയപ്പെട്ടാൽ, [അദ്ധ്യായം 7: പ്രശ്നപരിഹാരം](../chapter-07-troubleshooting/README.md) നോക്കുക.

## പടി 6: മാറ്റങ്ങൾ ചെയ്ത് വീണ്ടും വിന്യസിക്കുക

ഒരു മാറ്റം ചെയ്യാം, അപ്‌ഡേറ്റ് എത്ര എളുപ്പമാണെന്ന് കണ്ടു നോക്കാം:

### API മാറ്റുക
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

ഒരു കസ്റ്റം റെസ്പോൺസ് ഹെഡർ ചേർക്കുക:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### വെറും കോഡ് മാറ്റങ്ങൾ വിന്യാസിക്കുക
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## പടി 7: ഒന്നിലധികം പരിസ്ഥിതികൾ കൈകാര്യം ചെയ്യുക

ഉత്പാദനത്തിന് മുൻപ് മാറ്റങ്ങൾ പരീക്ഷിക്കാൻ ഒരു സ്റ്റേജിംഗ് പരിസ്ഥിതി സൃഷ്ടിക്കുക:

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

### പരിസ്ഥിതി താരതമ്യം
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## പടി 8: റിസോഴ്‌സുകൾ ക്ലീൻ ചെയ്യുക

പരീക്ഷണം കഴിഞ്ഞാൽ പിടിച്ചുപറച്ചില്ലാതാക്കാൻ ക്ലീനപ്പ് നടത്തുക:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## പരമ്പരാഗത മൊബൈൽ ആപ്പ് vs AI-പവേർഡ് ആപ്പ്: ഒരേ പ്രവൃത്തി ചട്ടം

നിങ്ങൾ ഇപ്പോഴൾ പരമ്പരാഗത വെബ് ആപ്പ് വിന്യസിച്ചു. പക്ഷേ Microsoft Foundry മോഡലുകളാൽ പിന്തുണയ്ക്കപ്പെട്ട ഒരു AI-പവേർഡ് ചാറ്റ് ആപ്പ് വിന്യാസിക്കാൻ എങ്കിൽ?

നല്ല വാർത്ത: **പ്രവൃത്തി ചട്ടം ഒരു തായി തന്നെ.**

| പടി | പരമ്പരാഗത ടുഡോ ആപ്പ് | AI ചാറ്റ് ആപ്പ് |
|------|-----------------|-------------|
| ആരംഭിക്കൽ (ശൂന്യ ഡയറക്ടറി) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| ആധാരീകരണം | `azd auth login` | `azd auth login` |
| വിന്യാസം | `azd up` | `azd up` |
| മോണിറ്ററിംഗ് | `azd monitor` | `azd monitor` |
| ക്ലീനപ്പ് | `azd down --force --purge` | `azd down --force --purge` |

ജീവചരിത്ര കമാൻഡുകൾ ഒരേ ആയിരിക്കാം, പക്ഷെ മുൻ‌നിർത്തൽ വ്യത്യസ്തമാണ്. AI ടെംപ്ലേറ്റിനു മോഡൽ ആക്‌സസ്, മേഖല്യൻ ക്വോട്ട, ഡാറ്റ ഇൻജെസ്റ്റൻ, അധിക കോൺഫിഗറേഷൻ ആവശ്യമായേക്കാം. README വായിക്കുക; `azd up` ലോക്ശന പരിധി നൽകാനാവില്ല.

azd യുടെ മുഖ്യ സിദ്ധാന്തം: **ഒരു പ്രവൃത്തി ചട്ടം, ഏത് വേലയും.** ഈ ട്യൂട്ടോറിയലിലെ നിങ്ങളുടെ അഭ്യസിച്ച പ്രാവീണ്യങ്ങൾ—ആരംഭിക്കൽ, വിന്യാസം, മോണിറ്ററിംഗ്, പുനഃവിന്യാസം, ക്ലീനപ്പ്—AI ആപ്പുകളും ഏജന്റുകളും ബാധകമാണ്.

---

## നിങ്ങൾ പഠിച്ചത്

അഭിനന്ദനങ്ങൾ! നിങ്ങൾ വിജയിക്കുന്നു:
- ✅ ടെംപ്ലേറ്റ് ഉപയോഗിച്ച് azd പ്രോജക്റ്റ് ആരംഭിച്ചു
- ✅ പ്രോജക്ട് ഘടനയും പ്രധാന ഫയലുകളും പരിശോധിച്ചു
- ✅ Azure-ലേക്ക് ഫുൾ-സ്റ്റാക്ക് ആപ്പ് വിന്യാസിച്ചു
- ✅ കോഡ് മാറ്റങ്ങൾ ചെയ്തു പുനഃവിന്യാസിച്ചു
- ✅ ഒരേതലിൽ ഒന്നിലധികം പരിസ്ഥിതികൾ കൈകാര്യം ചെയ്തു
- ✅ റിസോഴ്‌സുകൾ ക്ലീൻ ചെയ്തു

## 🎯 കഴിവ് തെളിയിക്കൽ അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: വ്യത്യസ്ത ടെംപ്ലേറ്റ് വിന്യാസിക്കുക (15 മിനിറ്റ്)
**ലക്ഷ്യം**: azd initയും വിന്യാസ പ്രവൃത്തിയും കൈകാര്യം ചെയ്യുന്നതിൽ പ്രാവീണ്യം കാണിക്കുക

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

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] ആപ്പ് പിഴവുകളില്ലാതെ വിന്യസിക്കണം
- [ ] ബ്രൗസറിൽ ആപ്പ് URL ആക്‌സസ് ചെയ്യാൻ കഴിയണം
- [ ] ആപ്പ് ശരിയായി പ്രവർത്തിക്കണം (തോഡോകൾ ചേർക്കുക/നീക്കം ചെയ്യുക)
- [ ] എല്ലാ റിസോഴ്‌സുകളും വിജയകരമായി ക്ലീൻ ചെയ്യാൻ കഴിഞ്ഞിട്ടുണ്ടാകണം

### അഭ്യാസം 2: കോൺഫിഗറേഷൻ ഇച്ഛാനുസൃതമാക്കുക (20 മിനിറ്റ്)
**ലക്ഷ്യം**: ലോക്കൽ പരിസ്ഥിതി മൂല്യങ്ങൾ സംഭരിക്കാൻ പരിശീലനം, അവ(Runtime) മാറ്റം എന്ന് തെറ്റിച്ച് കരുതാതെ

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

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] ഇച്ഛാനുസൃത പരിസ്ഥിതി വിജയകരമായി സൃഷ്ടിച്ചു
- [ ] പരിസ്ഥിതി മാറ്റിനിശ്ചയകങ്ങൾ സജ്ജീകരിക്കുകയും കിട്ടുകയും ചെയ്തു
- [ ] `azd env get-value APP_TITLE` `My Custom Todo App` പ്രിന്റ് ചെയ്യുന്നു
- [ ] ഈ മൂല്യങ്ങൾ സ്റ്റോക്ക് ആപ്പ് മാറ്റില്ലെന്നും കോഡ്/ഇൻഫ്രാസ്ട്രക്ചർ ഉണ്ടാക്കാത്തതും വിശദീകരിക്കാനാകും

### അഭ്യാസം 3: ബഹു-പരിസ്ഥിതി പ്രവൃത്തി ചട്ടം (25 മിനിറ്റ്)
**ലക്ഷ്യം**: പരിസ്ഥിതി നിര്വഹണവും വിന്യാസ തന്ത്രങ്ങളും കൈകാര്യം ചെയ്യാൻ പ്രാവീണ്യം

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

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] വ്യത്യസ്ത കോൺഫിഗറേഷനുകളുള്ള രണ്ട് പരിസ്ഥിതികൾ സൃഷ്ടിച്ചു
- [ ] ഇരു പരിസ്ഥിതികളും വിജയകരമായി വിന്യസിച്ചു
- [ ] `azd env select` ഉപയോഗിച്ച് പരിസ്ഥിതികൾ ഇടയിൽ മാറാൻ കഴിയും
- [ ] പരിസ്ഥിതി മാറ്റിനിശ്ചയകങ്ങൾ പരിസ്ഥിതികൾക്കിടയിൽ വ്യത്യസ്തമാണ്
- [ ] രണ്ട് പരിസ്ഥിതികളും വിജയകരമായി ക്ലീൻ ചെയ്തു

## 📊 നിങ്ങളുടെ പുരോഗതി

**കൊടുക്കപ്പെട്ട സമയം**: ~60-90 നിമിഷം  
**കഴിവുകൾ സ്വന്തമാക്കി**:
- ✅ ടെംപ്ലേറ്റ് അടിസ്ഥാനത്തിൽ പ്രോജക്റ്റ് ആരംഭിക്കൽ
- ✅ Azure റിസോഴ്‌സ് പ്രൊവിഷനിങ്ങ്
- ✅ ആപ്പ് വിന്യാസ പ്രവൃത്തികൾ
- ✅ പരിസ്ഥിതി കൈകാര്യം ചെയ്യൽ
- ✅ കോൺഫിഗറേഷൻ മാനേജ്‌മെന്റ്
- ✅ റിസോഴ്‌സ് ക്ലീനപ്പ്‌, ചെലവ് നിയന്ത്രണം

**അടുത്ത പടി**: ഉയർന്ന കോൺഫിഗറേഷൻ പാറ്റൻ പഠിക്കാൻ [Configuration Guide](../chapter-03-configuration/configuration.md) തയാറായി!

## സാധാരണ പ്രശ്നപരിഹാരങ്ങൾ

### ആധാരീകരണ പിശകുകൾ
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### വിന്യാസ പരാജയങ്ങൾ
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### റിസോഴ്‌സ് നാമം സംഘർഷങ്ങൾ
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### പോർട്ട്/നെറ്റ്‌വർക്ക് പ്രശ്നങ്ങൾ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## അടുത്ത ചുവട്

ഇപ്പോൾ നിങ്ങൾ നിങ്ങളുടെ ആദ്യ പ്രോജക്ട് പൂർത്തിയാക്കിയതിനുശേഷം, ഈ ഉയർന്ന തല വിഷയങ്ങൾ അന്വേഷിക്കുക:

### 1. ഇൻഫ്രാസ്ട്രക്ചർ ഇച്ഛാനുസൃതമാക്കുക
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ഡേറ്റാബേസ് ഇൻഫ്രാസ്ട്രക്ചർ ചേർക്കുക](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD സജ്ജീകരിക്കുക
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - പൂര്‍ണ്ണമായ CI/CD പ്രവൃത്തികൾ
- [Azure Developer CLI ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - പൈപ്ലൈൻ കോൺഫിഗറേഷൻ

### 3. ഉത്പാദന മികച്ച രീതി
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - സുരക്ഷ, പ്രകടനം, മോണിറ്ററിംഗ്

### 4. കൂടുതൽ ടെംപ്ലേറ്റുകൾ കണ്ടെത്തുക
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

## അധികം വിഭവങ്ങൾ

### പഠന സാമഗ്രികൾ
- [Azure Developer CLI ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure ആർക്കിടെക്ചർ സെൻറർ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure നല്ല ആർക്കിടെക്ചർ ഫ്രെയിംവർക്കുകൾ](https://learn.microsoft.com/en-us/azure/well-architected/)

### കമ്മ്യൂണിറ്റി & പിന്തുറപ്പ്
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ടെംപ്ലേറ്റുകളും ഉദാഹരണങ്ങളും
- [ഓഫീഷ്യൽ ടെംപ്ലേറ്റ് ഗ്യാലറി](https://azure.github.io/awesome-azd/)
- [കമ്മ്യൂണിറ്റി ടെംപ്ലേറ്റ് സംഭാവനകൾ](https://github.com/Azure/awesome-azd)
- [ടുഡോ ടെംപ്ലേറ്റ് സോഴ്‌സ്](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**നിങ്ങളുടെ ആദ്യ azd പ്രോജക്റ്റ് പൂർത്തിയാക്കിയതിന് അഭിനന്ദനങ്ങൾ!** ഇപ്പോൾ നിങ്ങൾ Azure-ൽ വിശ്വസനീയമായ ആപ്പുകൾ നിർമ്മിക്കുകയും വിന്യസിക്കുകയും ചെയ്യാൻ തയ്യാറാണ്.

---

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 1 - അടിസ്ഥാനവും വേഗത്തിലുള്ള തുടക്കവും
- **⬅️ മുൻപ്**: [ഇൻസ്റ്റലേഷനും സജ്ജീകരണവും](installation.md)
- **➡️ അടുത്തത്**: [താങ്കളുടെ സ്വന്തം അപ്‌പ്പ് കൊണ്ടുവരുക](bring-your-own-app.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 2: AI-ഫസ്റ്റ് ഡെവലപ്മെന്റ്](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->