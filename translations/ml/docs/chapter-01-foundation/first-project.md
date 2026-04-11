# നിങ്ങളുടെ ആദ്യ പ്രോജക്ട് - ഹാൻഡ്സ് ഓൺ ട്യൂട്ടോറിയൽ

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അധ്യായം**: Chapter 1 - Foundation & Quick Start
- **⬅️ മുമ്പത്തെ**: [Installation & Setup](installation.md)
- **➡️ അടുത്തത്**: [Configuration](configuration.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## പരിചയം

നിങ്ങളുടെ ആദ്യ Azure Developer CLI പ്രോജക്ടിലേക്ക് സ്വാഗതം! azd ഉപയോഗിച്ച് Azure-യിൽ ഒരു ഫുൾ-സ്റ്റാക്ക് അപ്ലിക്കേഷൻ നിർമ്മിക്കുന്നതും വിന്യസിക്കുന്നതും മാനേജുചെയ്യുന്നതും സംബന്ധിച്ച സമഗ്രമായ ഹാൻഡ്സ്-ഓൺ ട്യൂട്ടോറിയലാണ് ഇത്. നിങ്ങൾ ഒരു യഥാർത്ഥ todo അപ്ലിക്കേഷൻ ഉപയോഗിക്കും, ഇതിൽ React ഫ്രണ്ട്‌എൻഡ്, Node.js API ബാക്ക്‌എൻഡ്, MongoDB ഡാറ്റാബേസ് എന്നിവ ഉൾപ്പെടുന്നു.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ട്യൂട്ടോറിയൽ പൂർത്തിയാക്കിയാൽ, നിങ്ങൾക്ക്:
- ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് azd പ്രോജക്ട് തുടങ്ങിയ പ്രക്രിയയിൽ നിപുണത നേടാനാകും
- Azure Developer CLI പ്രോജക്ട് ഘടനയും കോൺഫിഗറേഷൻ ഫയലുകളും മനസ്സിലാക്കാം
- ഇൻഫ്രാസ്ട്രക്‌ചർ പ്രൊവിഷനിംഗ് ചേർത്ത് Azure-ൽ പൂർത്തിയുള്ള അപ്ലിക്കേഷൻ വിന്യസിക്കാനാകും
- അപ്ലിക്കേഷൻ അപ്ഡേറ്റുകളും പുനർവിന്യാസവും നടപ്പിലാക്കാൻ കഴിയും
- വികസനത്തിനും സ്റ്റേജിംഗിനും നിരവധി എൻവയോൺമെന്റുകൾ മാനേജുചെയ്യാം
- റിസോഴ്സ് ക്ലീൻ അപ്പ്, ചെലവ് നിയന്ത്രണം എന്നിവ പ്രയോഗിക്കാം

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കിയാൽ, നിങ്ങൾക്ക് സാധിക്കും:
- ടെംപ്ലേറ്റുകളിൽ നിന്നു സ്വാതന്ത്ര്യമായി azd പ്രോജക്ടുകൾ ആരംഭിക്കുകയും കോൺഫിഗർ ചെയ്യുകയും ചെയ്യുക
- azd പ്രോജക്ട് ഘടന നന്നായി നാവിഗേറ്റ് ചെയ്യുകയും മാറ്റങ്ങൾ നടത്തുകയും ചെയ്യുക
- ഏകമാത്രമായ കമാൻഡുകൾ ഉപയോഗിച്ച് Azure-ലേക്ക് ഫുൾ-സ്റ്റാക്ക് അപ്ലിക്കേഷനുകൾ പണിയാൻ
- സാധാരണ വിന്യാസ പിഴവുകളും അഡ്മിനിസ്റ്റ്രേഷൻ പ്രശ്‌നങ്ങളും പരിഹരിക്കാൻ
- വിവിധ വിന്യാസ ഘട്ടങ്ങൾക്ക് അനുസരിച്ച് Azure എൻവയോൺമെന്റുകൾ മാനേജുചെയ്യാൻ
- അപ്ലിക്കേഷൻ അപ്ഡേറ്റുകൾക്കായി തുടർച്ചയായ വിന്യാസ വർക്‌ഫ്ലോകൾ നടപ്പിലാക്കാൻ

## ആരംഭിക്കുന്നത്

### മുൻകൂടെ തയ്യാറെടുപ്പുകൾ പട്ടിക
- ✅ Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ട് ([Installation Guide](installation.md))
- ✅ `azd auth login` ഉപയോഗിച്ച് AZD ഓാഥെന്റിക്കേഷൻ പൂർത്തിയാക്കി
- ✅ നിങ്ങളുടെ സിസ്റ്റത്തിൽ Git ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ട്
- ✅ Node.js 16+ (ഈ ട്യൂട്ടോറിയലിനായി)
- ✅ Visual Studio Code (ശിപാർശ ചെയ്യുന്നു)

തുടങ്ങുമ മുന്നേ, സംഭരണിയിലെ റൂട്ടിൽ നിന്നു സജ്ജീകരണ പരിശോധന നടത്തുക:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### നിങ്ങളുടെ സജ്ജീകരണം പരിശോധന ചെയ്യുക
```bash
# azd ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
azd version

# AZD പാസ്സവേഡ് പരിശോധന നടത്തുക
azd auth login --check-status
```

### ഐച്ഛിക Azure CLI ഓാഥെന്റിക്കേഷൻ പരിശോധിക്കുക

```bash
az account show
```

### Node.js പതിപ്പ് പരിശോധിക്കുക
```bash
node --version
```

## ഘട്ടം 1: ടെംപ്ലേറ്റ് തിരഞ്ഞെടുക്കുകയും ആരംഭിക്കുകയും ചെയ്യുക

React ഫ്രണ്ട്‌എൻഡ്, Node.js API ബാക്ക്‌എൻഡ് ഉള്‍പ്പെടുന്ന പ്രചാരത്തിലുള്ള todo അപ്ലിക്കേഷൻ ടെംപ്ലേറ്റ് ഉപയോഗിച്ച് തുടങ്ങാം.

```bash
# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
azd template list

# ടുഡൂ ആപ്പ് ടെംപ്ലേറ്റ് ആരംഭിക്കുക
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# പ്രോംപ്റ്റുകൾ പാലിക്കുക:
# - ഒരു എൻവയോൺമെന്റ് നാമം ചേർക്കുക: "dev"
# - ഒരു സബ്സ്ക്രിപ്ഷൻ തിരഞ്ഞെടുക്കുക (നിങ്ങൾക്ക് ഒന്നിലധികമുണ്ടെങ്കിൽ)
# - ഒരു റീജിയൻ തിരഞ്ഞെടുക്കുക: "East US 2" (അഥവാ നിങ്ങളുടെ ഇഷ്ട റീജിയൻ)
```

### എന്താണ് ഇപ്പോൾ സംഭവിച്ചത്?
- ടെംപ്ലേറ്റ് കോഡ് ലോക്കൽ ഡയറക്ടറിയിലേക്ക് ഡൗൺലോഡ് ചെയ്തു
- സർവീസ് വിവരണങ്ങളോടെ `azure.yaml` ഫയൽ സൃഷ്ടിച്ചു
- `infra/` ഡയറക്ടറിയിൽ ഇൻഫ്രാസ്ട്രക്‌ചർ കോഡ് സജ്ജമാക്കി
- ഒരു എൻവയോൺമെന്റ് കോൺഫിഗറേഷൻ സൃഷ്ടിച്ചു

## ഘട്ടം 2: പ്രോജക്ട് ഘടന പരിശോധിക്കുക

azd ഞങ്ങൾക്ക് എന്തൊക്കെ സൃഷ്ടിച്ചു എന്നു നാം പരിശോധിക്കാം:

```bash
# പ്രോജക്ട് ഘടന കാണുക
tree /f   # വിൻഡോസ്
# അല്ലെങ്കിൽ
find . -type f | head -20   # macOS/Linux
```

നിങ്ങൾ കാണേണ്ടത്:
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

### മനസ്സിലാക്കേണ്ട പ്രധാന ഫയലുകൾ

**azure.yaml** - നിങ്ങളുടെ azd പ്രോജക്ടിന്റെ ഹൃദയം:
```bash
# പ്രോജക്ട് കോൺഫിഗറേഷൻ കാണുക
cat azure.yaml
```

**infra/main.bicep** - ഇൻഫ്രാസ്ട്രക്‌ചർ നിർവചനം:
```bash
# ഇൻഫ്രാസ്ട്രക്ചർ കോഡ് കാണുക
head -30 infra/main.bicep
```

## ഘട്ടം 3: നിങ്ങളുടെ പ്രോജക്ട് കസ്റ്റമൈസ് ചെയ്യുക (ഐച്ഛികം)

വിന്യാസത്തിന് മുമ്പ്, നിങ്ങൾ അപ്ലിക്കേഷൻ ഇഷ്ടാനുസരിച്ച് മാറ്റാം:

### ഫ്രണ്ട്‌എൻഡ് തിരുത്തുക
```bash
# റിയാക്റ്റ് ആപ്പ് കോംപോണന്റ് തുറക്കുക
code src/web/src/App.tsx
```

സരളമായ ഒരു മാറ്റം ചെയ്യുക:
```typescript
// തലക്കെട്ട് കണ്ടെത്തി മാറ്റൂ
<h1>My Awesome Todo App</h1>
```

### എൻവയോൺമെന്റ് മാറ്റങ്ങൾ കോൺഫിഗർ ചെയ്യുക
```bash
# ഇഷ്‌ടാനുസൃത പരിസ്ഥിതി ചരങ്ങൾ സെറ്റ് ചെയ്യുക
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# എല്ലാ പരിസ്ഥിതി ചരങ്ങളും കാണുക
azd env get-values
```

## ഘട്ടം 4: Azure-ലേക്ക് വിന്യസിക്കുക

ഇപ്പോൾ രസകരമായ ഭാഗം - എല്ലാം Azure-യിൽ വിന്യസിക്കാം!

```bash
# ഇൻഫ്രാസ്ട്രക്ചർ ಮತ್ತು അപ്ലിക്കേഷൻ വിന്യസിക്കുക
azd up

# ഈ കമാൻഡ് ചെയ്യുന്നത്:
# 1. അസ്യൂർ റിസോഴ്‌സുകൾ (ആപ് സർവീസ്, കോസ്മോസ് ഡിബി മുതലായവ) സജ്ജീകരിക്കുക
# 2. നിങ്ങളുടെ അപ്ലിക്കേഷൻ നിർമ്മിക്കുക
# 3. സജ്ജമാക്കിയ റിസോഴ്‌സുകളിൽ വിന്യസിക്കുക
# 4. അപ്ലിക്കേഷൻ URL പ്രദർശിപ്പിക്കുക
```

### വിന്യാസ സമയത്ത് സംഭവിക്കുന്നത് എന്തൊക്കെയാണ്?

`azd up` കമാൻഡ് ഈ പ്രവർത്തനങ്ങൾ നിർവഹിക്കുന്നു:
1. **Provision** (`azd provision`) - Azure റിസോഴ്സ് സൃഷ്ടിക്കുന്നു
2. **Package** - നിങ്ങളുടെ അപ്ലിക്കേഷൻ കോഡ് ബിൽഡ് ചെയ്യുന്നു
3. **Deploy** (`azd deploy`) - Azure റിസോഴ്സ്‌ಗಳಿಗೆ കോഡ് വിന്യസിക്കുന്നു

### പ്രതീക്ഷിക്കുന്ന ഔട്ട്‌പുട്ട്
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ഘട്ടം 5: നിങ്ങളുടെ അപ്ലിക്കേഷൻ പരീക്ഷിക്കുക

### നിങ്ങളുടെ അപ്ലിക്കേഷനിലേക്ക് പ്രവേശനം
വിന്യാസ ഔട്ട്പുട്ടിൽ നൽകിയിരിക്കുന്ന URL ക്ലിക്ക് ചെയ്യുക, അല്ലെങ്കിൽ ഏപ്പോൾ വേണമെങ്കിലും അതിന് പ്രവേശനം നേടുക:
```bash
# ആപ്ലിക്കേഷൻ എൻഡ്‌പോയിന്റുകൾ നേടുക
azd show

# നിങ്ങളുടെ ബ്രൗസറിൽ ആപ്ലിക്കേഷൻ തുറക്കുക
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ആപ്പ് പരിശോദിക്കുക
1. **ഒരു todo ഇനത്തിന് ചേർക്കുക** - "Add Todo" ക്ലിക്ക് ചെയ്ത് ഒരു ടാസ്‌ക്ക് നൽകുക
2. **പൂർത്തിയാക്കിയതായി മാർക്ക് ചെയ്യുക** - പൂർത്തിയായ ഇനങ്ങൾ ചെക്കുചെയ്യുക
3. **ഇനങ്ങൾ നീക്കം ചെയ്യുക** - വേണ്ടാത്ത todoകൾ ഒഴിവാക്കുക

### നിങ്ങളുടെ അപ്ലിക്കേഷൻ മോണിട്ടർ ചെയ്യുക
```bash
# നിങ്ങളുടെ സ്രോതസുകൾക്കായി ആസ്യൂർ പോർട്ടൽ തുറക്കുക
azd monitor

# അപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക
azd monitor --logs

# ലൈവ് മെട്രിക്സ് കാണുക
azd monitor --live
```

## ഘട്ടം 6: മാറ്റങ്ങൾ ചെയ്ത് പുനർവിന്യാസം ചെയ്യുക

ഒരു മാറ്റം നടത്താം, അപ്ഡേറ്റ് എത്ര എളുപ്പമാണെന്ന് നോക്കാം:

### API പരിഷ്കരിക്കുക
```bash
# API കോഡ് എഡിറ്റ് ചെയ്യുക
code src/api/src/routes/lists.js
```

ഒരു കസ്റ്റം റെസ്പോൺസ് ഹെഡർ ചേർക്കുക:
```javascript
// ഒരു മാര്‍ഗം കൈകാര്യം ചെയ്യുന്നവനെ കണ്ടെത്തി ചേർക്കൂ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### കോഡ് മാറ്റങ്ങൾ മാത്രം വിന്യസിക്കുക
```bash
# അപ്ലിക്കേഷൻ കോഡ് മാത്രം വിന്യസിക്കുക (ഇൻഫ്രാസ്ട്രക്ചർ ഒഴിവാക്കുക)
azd deploy

# ഇൻഫ്രാസ്ട്രക്ചർ ഇതിനകം നിലവില olduğതിനാൽ ഇത് 'azd up' ൽ നിന്നു വളരെ വേഗമാണ്
```

## ഘട്ടം 7: പല എൻവയോൺമെന്റുകളും മാനേജ് ചെയ്യുക

പ്രൊഡക്ഷൻ മുമ്പ് മാറ്റങ്ങൾ പരീക്ഷിക്കാൻ സ്റ്റേജിംഗ് എൻവയോൺമെന്റ് സൃഷ്ടിക്കുക:

```bash
# ഒരു പുതിയ സ്റ്റേജിംഗ് പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new staging

# സ്റ്റേജിംഗിലേക്ക് വിന്യസിക്കുക
azd up

# ഡെവ് പരിസ്ഥിതിയിലേക്ക് മടങ്ങുക
azd env select dev

# എല്ലാ പരിസ്ഥിതികളും ലിസ്റ്റ് ചെയ്യുക
azd env list
```

### എൻവയോൺമെന്റ് താരതമ്യം
```bash
# ഡെവ് പരിതസ്ഥിതി കാണുക
azd env select dev
azd show

# സ്റ്റേജിംഗ് പരിതസ്ഥിതി കാണുക
azd env select staging
azd show
```

## ഘട്ടം 8: റിസോഴ്സ് ക്ലീൻ അപ്പ് ചെയ്യുക

പരീക്ഷണങ്ങൾ പൂർത്തിയായതിനുശേഷം തുടർച്ചയായ ചാർജുകൾ ഒഴിവാക്കാൻ ക്ലീൻ അപ്പ് ചെയ്യുക:

```bash
# നിലവിലെ അന്തരീക്ഷത്തിനായുള്ള എല്ലാ അസ്യൂർ വിഭവങ്ങളും നീക്കം ചെയ്യുക
azd down

# സ്ഥിരീകരണം കൂടാതെ ബലംപ്രയോഗിച്ച് നീക്കം ചെയ്യുക കൂടാതെ സോഫ്‌റ്റ്-ഡീലീറ്റ് ചെയ്ത വിഭവങ്ങൾ പർജ് ചെയ്യുക
azd down --force --purge

# പ്രത്യേക അന്തരീക്ഷം നീക്കം ചെയ്യുക
azd env select staging
azd down --force --purge
```

## പാരമ്പര്യ ആപ്പ് vs AI-പോവേർഡ് ആപ്പ്: ഒരേ വർക്‌ഫ്ലോ

നിങ്ങൾ justo ഒരു പരമ്പരാഗത വെബ് അപ്ലിക്കേഷൻ വിന്യസിച്ചു. എന്നാൽ Microsoft Foundry മോഡലുകളാൽ പിന്തുണയ്ക്കപ്പെട്ട ഒരു AI-പോവേർഡ് ചാറ്റ് അപ്ലിക്കേഷൻ വിന്യസിക്കാൻ ആഗ്രഹിച്ചാൽ?

നല്ല വാർത്ത: **വർക്‌ഫ്ലോ തുല്യമാണ്.**

| ഘട്ടം | പാരമ്പര്യ Todo ആപ്പ് | AI ചാറ്റ് ആപ്പ് |
|------|-----------------|-------------|
| തുടക്കം | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| ഓഥെന്റിക്കേറ്റ് ചെയ്യുക | `azd auth login` | `azd auth login` |
| വിന്യസിക്കുക | `azd up` | `azd up` |
| മോണിറ്റർ ചെയ്യുക | `azd monitor` | `azd monitor` |
| ക്ലീൻ അപ്പ് | `azd down --force --purge` | `azd down --force --purge` |

മാത്രം വ്യത്യാസം നിങ്ങള് ആരംഭിക്കുന്നത് **ടെംപ്ലേറ്റ്** ആണ്. AI ടെംപ്ലേറ്റിൽ Microsoft Foundry മോഡൽസ് റിസോഴ്സ് അല്ലെങ്കിൽ AI Search ഇൻഡക്സ് പോലെയുള്ള അധിക ഇൻഫ്രാസ്ട്രക്‌ചർ ഉണ്ടാകാം, എന്നാൽ azd നിങ്ങൾക്കായി എല്ലാം കൈകാര്യം ചെയ്യും. നിങ്ങൾ പുതിയ കമാൻഡുകൾ പഠിക്കേണ്ടതില്ല, മറ്റൊരു ടൂൾ സ്വീകരിക്കേണ്ടതില്ല, അല്ലെങ്കിൽ വിന്യാസത്തിനായി നിങ്ങളുടെ വികൃതി മാറ്റേണ്ടതില്ല.

azd-യുടെ പ്രധാന തത്വം: **ഒന്നു വർക്‌ഫ്ലോ, ഏതു സൃഷ്ടിയും.** ഈ ട്യൂട്ടോറിയലിൽ നിങ്ങൾ അഭ്യസിച്ച നൈപുണ്യങ്ങൾ - തുടങ്ങൽ, വിന്യാസം, മോണിറ്ററിംഗ്, പുനർവിന്യാസം, ക്ലീൻ അപ്പ് തുടങ്ങിയവ - AI അപ്ലിക്കേഷനുകളിലും ഏജന്റുകളിലും തുല്യമായി ബാധകമാണ്.

---

## നിങ്ങൾ പഠിച്ച കാര്യം

അഭിനന്ദനങ്ങൾ! നിങ്ങൾ വിജയകരമായി:
- ✅ ടെംപ്ലേറ്റിൽ നിന്നു azd പ്രോജക്ട് തുടങ്ങിയിട്ടുണ്ട്
- ✅ പ്രോജക്ട് ഘടനയും പ്രധാന ഫയലുകളും പരിശോധിച്ചു
- ✅ Azure-ലേക്ക് ഒരു ഫുൾ-സ്റ്റാക്ക് അപ്ലിക്കേഷൻ വിന്യസിച്ചു
- ✅ കോഡ് മാറ്റങ്ങൾ ചെയ്തു പുനർവിന്യാസം ചെയ്തു
- ✅ പല എൻവയോൺമെന്റുകളും മാനേജ് ചെയ്തു
- ✅ റിസോഴ്സ് ക്ലീൻ അപ്പ് ചെയ്തു

## 🎯 നൈപുണ്യ പരിശോധന അഭ്യാസങ്ങൾ

### അഭിന്യാസം 1: മറ്റൊരു ടെംപ്ലേറ്റ് വിന്യസിക്കുക (15 മിനിറ്റ്)
**ലക്ഷ്യം**: azd init, വിന്യാസ വർക്‌ഫ്ലോയിൽ പ്രാവീണ്യം കാണിക്കുക

```bash
# Python + MongoDB സ്റ്റാക്ക് പരീക്ഷിക്കുക
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# വിന്യാസം ಪರಿಶೀಲിക്കുക
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ശുചീകരിക്കുക
azd down --force --purge
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] അപ്ലിക്കേഷൻ പിഴവുകൾ കൂടാതെ വിന്യസിച്ചിരിക്കണം
- [ ] ബ്രൗസറിൽ അപ്ലിക്കേഷൻ URL തുറക്കാൻ കഴിയണം
- [ ] അപ്ലിക്കേഷൻ സരളമായി പ്രവർത്തിക്കണം (todoകൾ ചേർക്കാനും നീക്കാനും)
- [ ] എല്ലാ റിസോഴ്സുകളും വിജയകരമായി ക്ലീൻ അപ്പ് ചെയ്തിരിക്കണം

### അഭിന്യാസം 2: കോൺഫിഗറേഷൻ കസ്റ്റമൈസ് ചെയ്യുക (20 മിനിറ്റ്)
**ലക്ഷ്യം**: എൻവയോൺമെന്റ് വേരിയബിൾ കോൺഫിഗറേഷൻ അഭ്യാസം

```bash
cd my-first-azd-app

# കസ്റ്റം പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new custom-config

# കസ്റ്റം വ്യത്യസ്ഥങ്ങൾ സജ്ജമാക്കുക
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# വ്യത്യസ്ഥങ്ങൾ സ്ഥിരീകരിക്കുക
azd env get-values | grep APP_TITLE

# കസ്റ്റം കോൺഫിഗ് ഉപയോഗിച്ച് വിന്യസിക്കുക
azd up
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] കസ്റ്റം എൻവയോൺമെന്റ് വിജയകരമായി സൃഷ്ടിച്ചതായി കാണുക
- [ ] എൻവയോൺമെന്റ് വേരിയബിളുകൾ സെറ്റ് ചെയ്ത് കിട്ടുമെന്ന് സ്ഥിരീകരിക്കുക
- [ ] കസ്റ്റം കോൺഫിഗറേഷനോടെയുള്ള അപ്ലിക്കേഷൻ വിന്യസിക്കുക
- [ ] വിന്യസിക്കപ്പെട്ട അപ്ലിക്കേഷനിൽ കസ്റ്റം സെറ്റിംഗ്സ് പരിശോധിക്കാം

### അഭിന്യാസം 3: ബഹുഎൻവയോൺമെന്റ് വർക്‌ഫ്ലോ (25 മിനിറ്റ്)
**ലക്ഷ്യം**: എൻവയോൺമെന്റ് മാനേജ്മെൻറും വിന്യാസ തന്ത്രങ്ങളും നൈപുണ്യം നേടുക

```bash
# ഡെവൽപ്‌മെന്റ് പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ഡെവ് URL ശ്രദ്ധിക്കുക
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# സ്റ്റേജിംഗ് പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# സ്റ്റേജിംഗ് URL ശ്രദ്ധിക്കുക
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# പരിസ്ഥിതികൾ താരതമ്യം ചെയ്യുക
azd env list

# രണ്ടുപരി‌സ്ഥിതികളും പരീക്ഷിക്കുക
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# ഇരുപരിസ്ഥിതികളും ശുചിയാക്കുക
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] വ്യത്യസ്ത കോൺഫിഗറേഷനുകളോടെ രണ്ടു എൻവയോൺമെന്റുകൾ സൃഷ്ടിച്ചു
- [ ] രണ്ടു എൻവയോൺമെന്റുകളും വിജയകരമായി വിന്യസിച്ചു
- [ ] `azd env select` ഉപയോഗിച്ച് എൻവയോൺമെന്റുകൾ തമ്മിൽ മാറുക
- [ ] എൻവയോൺമെന്റ് വേരിയബിളുകൾ വ്യത്യസ്തമാണെന്ന് പരിശോധിക്കുക
- [ ] രണ്ട് എൻവയോൺമെന്റുകളും വിജയകരമായി ക്ലീൻ അപ്പ് ചെയ്തു

## 📊 നിങ്ങളുടെ പുരോഗതി

**വലിയ സമയം**: ~60-90 മിനിറ്റ്  
**നൈപുണ്യങ്ങൾ നേടിയത്**:
- ✅ ടെംപ്ലേറ്റ് അടിസ്ഥാന പ്രോജക്ട് ആരംഭിക്കൽ
- ✅ Azure റിസോഴ്സ് പ്രൊവിഷനിംഗ്
- ✅ അപ്ലിക്കേഷൻ വിന്യാസ വർക്‌ഫ്ലോ
- ✅ എൻവയോൺമെന്റ് മാനേജ്മെന്റ്
- ✅ കോൺഫിഗറേഷൻ മാനേജ്മെന്റ്
- ✅ റിസോഴ്സ് ക്ലീൻ അപ്പ്, ചെലവ് നിയന്ത്രണം

**അടുത്ത തലമുറ**: നിങ്ങൾക്ക് [Configuration Guide](configuration.md) വഴി അധിക കോൺഫിഗറേഷൻ പാറ്റേണുകൾ പഠിക്കാൻ തയ്യാറാണ്!

## പൊതു പ്രശ്‌നപരിഗണനം

### ഓഥെന്റിക്കേഷൻ പിഴവുകൾ
```bash
# അജൂറുമായി വീണ്ടും പ്രാമാണീകരിക്കുക
az login

# സബ്‌സ്‌ക്രിപ്ഷൻ ആക്‌സസ് സ്ഥിരീകരിക്കുക
az account show
```

### വിന്യാസ തകരാറുകൾ
```bash
# ഡീബഗ് ലോഗിംഗ് സക്രീയമാക്കുക
export AZD_DEBUG=true
azd up --debug

# ആസ്യൂറിൽ ആപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക
azd monitor --logs

# കണ്ടെയ്നർ ആപ്പുകൾക്കായി, ആസ്യൂർ CLI ഉപയോഗിക്കുക:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### റിസോഴ്സ് നാമ സംഘർഷങ്ങൾ
```bash
# ഒരു അതുല്യമായ പരിസ്ഥിതി പേര് ഉപയോഗിക്കുക
azd env new dev-$(whoami)-$(date +%s)
```

### പോർട്ട്/നെറ്റ്‌വർക് പ്രശ്‌നങ്ങൾ
```bash
# പോർട്ടുകൾ ലഭ്യമായാതെ കാണുക
netstat -an | grep :3000
netstat -an | grep :3100
```

## അടുത്ത ഘട്ടങ്ങൾ

നിങ്ങളുടെ ആദ്യ പ്രോജക്ട് പൂർത്തിയായതിനുശേഷം ഉയർന്ന തലത്തിലുള്ള വിദ്യകൾ പരിശോധിക്കുക:

### 1. ഇൻഫ്രാസ്ട്രക്‌ചർ കസ്റ്റമൈസ് ചെയ്യുക
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ഡേറ്റാബേസുകൾ, സംഭരണം, മറ്റു സർവീസുകൾ ചേർക്കുക](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD സജ്ജമാക്കുക
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - സമഗ്ര CI/CD വർക്‌ഫ്ലോകൾ
- [Azure Developer CLI ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - പൈപ്പ്ലൈൻ കോൺഫിഗറേഷൻ

### 3. പ്രൊഡക്ഷൻ മികച്ച പ്രാക്ടിസുകൾ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - സുരക്ഷ, പ്രകടനം, മന്ത്രിക്കൽ

### 4. കൂടുതൽ ടെംപ്ലേറ്റുകൾ പരിശോധിക്കുക
```bash
# വിഭാഗംപ്രകാരം ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
azd template list --filter web
azd template list --filter api
azd template list --filter database

# വിവിധ സാങ്കേതിക സ്റ്റാക്കുകൾ പരീക്ഷിക്കുക
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## അധിക സ്രോതസ്സുകൾ

### പഠന സാമഗ്രികള്‍
- [Azure Developer CLI ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### കമ്മ്യൂണിറ്റി & സഹായ്യം
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ടെംപ്ലേറ്റുകളും ഉദാഹരണങ്ങളും
- [ഓഫിഷ്യൽ ടെംപ്ലേറ്റ് ഗ്യാലറി](https://azure.github.io/awesome-azd/)
- [കമ്മ്യൂണിറ്റി ടെംപ്ലേറ്റുകൾ](https://github.com/Azure-Samples/azd-templates)
- [എന്റർപ്രൈസ് പാറ്റേണുകൾ](https://github.com/Azure/azure-dev/tree/main/templates)

---

**നിങ്ങളുടെ ആദ്യ azd പ്രോജക്ട് പൂർത്തിയായതിൽ അഭിനന്ദനങ്ങൾ!** നിങ്ങളുടെ വിശ്വാസത്തോടെ Azure-ൽ അത്ഭുതകരമായ അപ്ലിക്കേഷനുകൾ നിർമ്മിച്ച് വിന്യസിക്കാൻ നിങ്ങൾ തയ്യാറാണ്.

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അധ്യായം**: Chapter 1 - Foundation & Quick Start
- **⬅️ മുമ്പത്തെ**: [Installation & Setup](installation.md)
- **➡️ അടുത്തത്**: [Configuration](configuration.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **അടുത്ത പാഠം**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അപരാഹ്നാവകാശം**:  
ഈ ഡോക്യുമെന്റ് [Co-op Translator](https://github.com/Azure/co-op-translator) എന്ന AI വിവർത്തന സേവനം ഉപയോഗിച്ച് വിവർത്തനം ചെയ്യപ്പെട്ടതാണ്. നമുക്ക് വസ്തുതാപരമായതിനു ശ്രമിച്ചാലും, കമ്പനിയുടെ സ്വാഭാവിക ഭാഷയിലുള്ള മിക്കവാറും ഡോക്യുമെന്റാണ് പ്രാമാണികമായ സ്രോതസ്സായി கரുതേണ്ടത്. നിർണായക വിവരങ്ങൾക്കായി പ്രൊഫഷണലായ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടായേക്കാവുന്ന തെറ്റാണോ തെറ്റിദ്ധാരണയോ കൂടിയ ഉത്തരവാദിത്വം ഞങ്ങൾ ഏറ്റെടുക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->