# Command Cheat Sheet - അനിവാര്യമായ AZD കമാൻഡുകൾ

**എല്ലാ അധ്യായങ്ങൾക്കും ദ്രുത അഭിസന്ധി**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../README.md)
- **📖 ദ്രുത തുടക്കം**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI കമാൻഡുകൾ**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ഉയർന്നനില**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## പരിചയം

ഈ സമഗ്രമായ ചീറ്റ് ഷീറ്റ് സാധാരണയായി ഉപയോഗിക്കുന്ന Azure Developer CLI കമാൻഡുകൾ വർഗ്ഗീകരിച്ചും പ്രായോഗിക ഉദാഹരണങ്ങളോടുമുള്ള ദ്രുത പരിചയം നൽകുന്നു. azd പ്രോജക്ടുകളുടെ വികസനത്തിൽ, തകരാറുകൾ കണ്ടെത്തലിൽ, ദൈനംദിന പ്രവർത്തനങ്ങളിൽ ദ്രുതമായി കാണാൻ ഇതു സഹായിക്കുന്നു.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ചീറ്റ് ഷീറ്റ് ഉപയോഗിച്ച്, നിങ്ങൾക്ക്:
- അനിവാര്യമായ Azure Developer CLI കമാൻഡുകൾക്കും സിന്റാക്സിനും ഉടൻ പ്രവേശനം ഉണ്ടാകും
- ഫങ്‌ഷണൽ വിഭാഗങ്ങൾക്കും ഉപയോഗകേസിനെയും അടിസ്ഥാനമാക്കി കമാൻഡുകൾ ഓർഗനൈസ് ചെയ്‌തിരിക്കുന്നതു മനസ്സിലാക്കും
- സാധാരണ വികസനവും വിനിയോഗ സാഹചര്യങ്ങളുമുള്ള പ്രായോഗിക ഉദാഹരണങ്ങളെ സമീപിക്കും
- പെട്ടെന്ന് പ്രശ്‌നങ്ങൾ നിർമ്മാർജ്ജനം ചെയ്യാനുള്ള ട്രബിൽഷൂട്ടിംഗ് കമാൻഡുകൾ എത്തും
- ഉന്നത കോൺഫിഗറേഷൻ മേഖലകളും കസ്റ്റമൈസേഷൻ ഓപ്ഷനുകളും എളുപ്പത്തിൽ കണ്ടെത്തും
- പരിസ്ഥിതി മാനേജ്മെന്റിനും മൾട്ടി-ഇൻവയിരണ്മെന്റ് വർക്ക്‌ഫ്ലോ കമാൻഡുകൾ കണ്ടെത്തും

## പഠന ഫലങ്ങൾ

ഈ ചീറ്റ് ഷീറ്റ് പതിവായി റഫറൻസ് ചെയ്താൽ, നിങ്ങൾക്ക് കഴിയും:
- azd കമാൻഡുകൾ ആത്മവിശ്വാസത്തോടെ പ്രയോഗിച്ച് പൂർണ രേഖകൾ നോക്കാതെ മികവുറ്റതായ പ്രവർത്തനം നടത്തുക
- യോഗ്യമായ ഡയഗ്നോസ്റ്റിക് കമാൻഡുകൾ ഉപയോഗിച്ച് സാധാരണ പ്രശ്‌നങ്ങൾ പെട്ടെന്ന് പരിഹരിക്കുക
- നിരവധി ಪರಿಸരങ്ങളും വിനിയോഗ സാഹചര്യങ്ങളും കാര്യക്ഷമമായി നിയന്ത്രിക്കുക
- ആവശ്യാനുസൃതമായി ഉന്നത azd സവിശേഷതകളും കോൺഫിഗറേഷൻ ഓപ്ഷനുകളും പ്രയോഗിക്കുക
- സമ്പ്രദായമായ കമാൻഡ് ശ്രേണികൾ ഉപയോഗിച്ച് വിനിയോഗ പ്രശ്‌നങ്ങൾ പരിഹരിക്കുക
- azd ഷോർട്കട്ടുകളും ഓപ്ഷനുകളും ഫലപ്രദമായി ഉപയോഗിച്ച് വർക്ക്‌ഫ്ലോകൾ മെച്ചപ്പെടുത്തുക

## തുടക്കക്കാർക്കുള്ള കമാൻഡുകൾ

### ഓത്‌മെന്റിക്കേഷൻ
```bash
# AZD വഴി Azure ലോഗിൻ ചെയ്യുക
azd auth login

# Azure CLI ലോഗിൻ ചെയ്യുക (AZD ഇത് അണ്ടർ ദ ഹുഡ് ഉപയോഗിക്കുന്നു)
az login

# നിലവിലെ അക്കൗണ്ട് പരിശോധിക്കുക
az account show

# ഡിഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZDലോഡ് ലോഗൗട്ട് ചെയ്യുക
azd auth logout

# Azure CLIലോഡ് ലോഗൗട്ട് ചെയ്യുക
az logout
```

### പ്രോജക്ട് തുടങ്ങിയെടുക്കൽ
```bash
# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
azd template list

# ടെംപ്ലേറ്റ് മുതലാക്കുക
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# നിലവിലെ ഡയറക്റ്ററിയിൽ ആരംഭിക്കുക
azd init .

# സ്വന്തമായ പേര് ഉപയോഗിച്ച് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo my-awesome-app
```

## പ്രധാന വിനിയോഗ കമാൻഡുകൾ

### സമ്പൂർണ്ണ വിനിയോഗ വർക്ക്‌ഫ്ലോ
```bash
# എല്ലാം വിന്യസിക്കുക (പ്രൊവിഷൻ + വിന്യസിക്കൽ)
azd up

# സ്ഥിരീകരണ പ്രോംപ്റ്റുകൾ അകറ്റിയിട്ട് വിന്യസിക്കുക
azd up --confirm-with-no-prompt

# 특정 ചുറ്റുപാട് എന്നാൽ വിന്യസിക്കുക
azd up --environment production

# ഇഷ്ടാനുസൃത പാരാമീറ്ററുകളോടെ വിന്യസിക്കുക
azd up --parameter location=westus2
```

### വെറും ഇൻഫ്രാസ്ട്രക്ചർ
```bash
# ആസ്യൂർ വിഭവങ്ങൾ ഒരുക്കുക
azd provision

# 🧪 ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ മുൻകൂർ കാണുക
azd provision --preview
# സൃഷ്ടിക്കപ്പെടുകയോ/പരിഷ്കരിക്കപ്പെടുകയോ/ഒഴിവാക്കപ്പെടുകയോ ചെയ്യുന്ന വിഭവങ്ങളുടെ ഡ്രൈ-run ദൃശ്യമാണ് കാണിക്കുക
# 'terraform plan' അല്ലെങ്കിൽ 'bicep what-if' ഒത്തു പോവുക - പ്രവർത്തിപ്പിക്കാൻ സുരക്ഷിതം, മാറ്റങ്ങൾ ഒന്നും പ്രയോഗിച്ചില്ല
```

### വെറും അപ്ലിക്കേഷൻ
```bash
# അപേക്ഷ കോഡ് വിന്യസിക്കുക
azd deploy

# പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# എല്ലാ സേവনങ്ങളും വിന്യസിക്കുക
azd deploy --all
```

### ബിൽഡ് & പാക്കേജ്
```bash
# ആപ്ലിക്കേഷനുകൾ നിർമ്മിക്കുക
azd package

# പ്രത്യേക സേവനം നിർമ്മിക്കുക
azd package --service api
```

## 🌍 പരിസ്ഥിതി മാനേജ്മെൻറ്

### പരിസ്ഥിതി പ്രവർത്തനങ്ങൾ
```bash
# എല്ലാ പരിതസ്ഥിതികളും പട്ടികവലിക്കുക
azd env list

# പുതിയ പരിതസ്ഥിതിയൊരുക്കുക
azd env new development
azd env new staging --location westus2

# പരിതസ്ഥിതി തിരഞ്ഞെടുക്കുക
azd env select production

# നിലവിലെ പരിതസ്ഥിതി കാണിക്കുക
azd env show

# പരിതസ്ഥിതി നില പുതുക്കുക
azd env refresh
```

### പരിസ്ഥിതിവാരിയബിൾസ്
```bash
# പരിതസ്ഥിതി വ്യത്യാസം സജ്ജീകരിക്കുക
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# പരിതസ്ഥിതി വ്യത്യാസം നേടുക
azd env get API_KEY

# എല്ലാ പരിതസ്ഥിതി വ്യത്യാസങ്ങളും പട്ടിക ചെയ്യുക
azd env get-values

# പരിതസ്ഥിതി വ്യത്യാസം നീക്കം ചെയ്യുക
azd env unset DEBUG
```

## ⚙️ കോൺഫിഗറേഷൻ കമാൻഡുകൾ

### ഗ്ലോബൽ കോൺഫിഗറേഷൻ
```bash
# എല്ലാ കോൺഫിഗറേഷനും പട്ടിക ചെയ്തുകാട്ടുക
azd config list

# ഗ്ലോബൽ ഡീഫോൾട്ടുകൾ സജ്ജീകരിക്കുക
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# കോൺഫിഗറേഷൻ നീക്കം ചെയ്യുക
azd config unset defaults.location

# എല്ലാ കോൺഫിഗറേഷനും പുനരാരംഭിക്കുക
azd config reset
```

### പ്രോജക്ട് കോൺഫിഗറേഷൻ
```bash
# azure.yaml സാധൂകരിക്കുക
azd config validate

# പ്രോജക്ട് വിവരങ്ങൾ പ്രദർശിപ്പിക്കുക
azd show

# സേവന എച്‌പി‌ഐ പോയിന്റുകൾ നേടുക
azd show --output json
```

## 📊 നിരീക്ഷണവും ഡയഗ്നോസ്റ്റിക്സും

### നിരീക്ഷണ ഡാഷ്ബോർഡ്
```bash
# അസ്യൂർ പോർട്ടൽ മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor

# അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ലൈവ് മെറ്റ്‌റിക്‌സ് തുറക്കുക
azd monitor --live

# അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ലോഗ്സ് ബ്ലേഡ് തുറക്കുക
azd monitor --logs

# അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് അവലോകനം തുറക്കുക
azd monitor --overview
```

### കണ്ടെയ്‌നർ ലോഗുകൾ കാണിക്കൽ
```bash
# Azure CLI വഴി ലോഗുകൾ കാണുക (കണ്ടെയ്‌നർ ആപ്പുകൾക്കായി)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ലോഗുകൾ യഥാർത്ഥ സമയത്ത് പിന്തുടരുക
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure പോർട്ടൽ മുതൽ ലോഗുകൾ കാണുക
azd monitor --logs
```

### ലോഗ് അനലറ്റിക്സ് ക്വറികൾ
```bash
# ആസൂർ പോർട്ടലിൽ നിന്ന് ആക്‌സസ് ലോഗ് അനലിറ്റിക്സ്
azd monitor --logs

# ആസൂർ CLI ഉപയോഗിച്ച് ലോഗുകൾ ചോദിക്കുക
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ പരിചരണം കമാൻഡുകൾ

### ക്ലീൻ അപ്
```bash
# എല്ലാ Azure وسائلവും നീക്കം ചെയ്യുക
azd down

# സ്ഥിരീകരണം ഇല്ലാതെ ബലംപ്രയോഗിച്ച് ഡിലീറ്റ് ചെയ്യുക
azd down --force

# സോഫ്റ്റ്-ഡിലീറ്റ് ചെയ്ത وسائلുകൾ പരിഹരിക്കുക
azd down --purge

# പൂര്‍ണ്ണമായ ക്ലീന്‍അപ്പ്
azd down --force --purge
```

### അപ്‌ഡേറ്റുകൾ
```bash
# azd അപ്ഡേറ്റുകൾ പരിശോധിക്കുക
azd version

# നിലവിലെ പതിപ്പ് നേടുക
azd version

# നിലവിലെ ക്രമീകരണം കാണുക
azd config list
```

## 🔧 ഉയർന്നനില കമാൻഡുകൾ

### പൈപ്പ്ലൈൻ & CI/CD
```bash
# GitHub Actions ക്രമീകരിക്കുക
azd pipeline config

# Azure DevOps ക്രമീകരിക്കുക
azd pipeline config --provider azdo

# പൈപ്പ്‌ലൈൻ ക്രമീകരണം പ്രകടിപ്പിക്കുക
azd pipeline show
```

### ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്മെന്റ്
```bash
# ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ സൃഷ്ടിക്കുക
azd infra generate

# 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ & പ്ലാനിംഗ്
azd provision --preview
# വിന്യസിക്കാതെ ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് അനുകരിക്കുന്നു
# Bicep/Terraform ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്യുകയും കാണിക്കുകയും ചെയ്യുന്നു:
# - ചേർക്കേണ്ട വിഭവങ്ങൾ (പച്ച +)
# - മാറ്റേണ്ട വിഭവങ്ങൾ (മഞ്ഞ ~)
# - നീക്കം ചെയ്യേണ്ട വിഭവങ്ങൾ (ചുവപ്പ് -)
# സുരക്ഷിതമായി പ്രവർത്തിക്കാൻ - Azure പരിസ്ഥിതിയിൽ യാഥാർത്ഥ്യ മാറ്റങ്ങളില്ല

# azure.yaml ൽ നിന്ന് ഇൻഫ്രാസ്ട്രക്ചർ സിന്തസൈസ് ചെയ്യുക
azd infra synth
```

### പ്രോജക്ട് വിവരം
```bash
# പ്രോജക്ട് നിലയും എന്റ്പോയിന്റുകളും കാണിക്കുക
azd show

# വിശദമായ പ്രോജക്ട് വിവരങ്ങൾ JSON ആയി കാണിക്കുക
azd show --output json

# സർവീസ് എന്റ്പോയിന്റുകൾ നേടുക
azd show --output json | jq '.services'
```

## 🤖 AI & എക്സ്റ്റൻഷൻസ് കമാൻഡുകൾ

### AZD വിപുലീകരണങ്ങൾ
```bash
# ലഭ്യമായ എല്ലാ എക്സ്റ്റൻഷനുകളും (AI ഉൾപ്പെടെ) പട്ടികപ്പെടുത്തുക
azd extension list

# ഫൗണ്ട്രീ ഏജന്റ്സ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.agents

# ഫൈൻ-ട്യൂണിംഗ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.finetune

# കസ്റ്റം മോഡലുകൾ എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.models

# ഇൻസ്റ്റാൾ ചെയ്യപ്പെട്ട എല്ലാ എക്സ്റ്റൻഷനുകളും അപ്ഗ്രേഡ് ചെയ്യുക
azd extension upgrade --all
```

### AI ഏജന്റ് കമാൻഡുകൾ
```bash
# ഒരു മാനിഫെസ്റ്റ് നിന്ന് ഏജന്റ് പ്രോജക്റ്റ് ആരംഭിക്കുക
azd ai agent init -m <manifest-path-or-uri>

# ഒരു നിർദ്ദിഷ്ട ഫൗണ്ട്രി പ്രോജക്റ്റിനെ ലക്ഷ്യമിടുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ഏജന്റ് സോഴ്സ് ഡയറക്ടറി നിർദ്ദിഷ്ടമാക്കുക
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ഒരു ഹോസ്റ്റിങ് ലക്ഷ്യം തിരഞ്ഞെടുക്കുക
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP സർവർ (ആൽഫ)
```bash
# നിങ്ങളുടെ പ്രോജക്ടിന് MCP സെർവറും ആരംഭിക്കുക
azd mcp start

# MCP പ്രവർത്തനങ്ങൾക്ക് ടൂൾ അംഗീകാരം നിയന്ത്രിക്കുക
azd mcp consent
```

### ഇൻഫ്രാസ്ട്രക്ചർ ജനറേഷൻ
```bash
# നിങ്ങളുടെ പ്രോജക്ട് നിർവചനത്തിൽ നിന്നു IaC ഫയലുകൾ സൃഷ്ടിക്കുക
azd infra generate

# azure.yaml ൽ നിന്നു ഇൻഫ്രാസ്ട്രക്ചർ സynthesizeചെയ്യുക
azd infra synth
```

---

## 🎯 ദ്രുത വർക്ക്‌ഫ്ലോകൾ

### വികസന വർക്ക്‌ഫ്ലോ
```bash
# പുതിയ പ്രോജക്ട് തുടങ്ങിയിരിക്കുക
azd init --template todo-nodejs-mongo
cd my-project

# വികസനത്തിനായി വിന്യസിക്കുക
azd env new dev
azd up

# മാറ്റങ്ങൾ ചെയ്യുകയും വീണ്ടും വിന്യസിക്കുകയും ചെയ്യുക
azd deploy

# നിരീക്ഷണ ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --live
```

### മൾട്ടി-എൻവയിരണ്മെന്റ് വർക്ക്‌ഫ്ലോ
```bash
# പരിസ്ഥിതികൾ സജ്ജമാക്കുക
azd env new dev
azd env new staging  
azd env new production

# ഡെവലപ്‌മെന്റിലേക്ക് വിന്യസിക്കുക
azd env select dev
azd up

# ടെസ്റ്റ് ചെയ്ത് സ്റ്റേജിംഗിലേക്ക് മുൻകൂട്ടി മാറ്റുക
azd env select staging
azd up

# പ്രൊഡക്ഷനിലേക്ക് വിന്യസിക്കുക
azd env select production
azd up
```

### ട്രബിൽഷൂട്ടിംഗ് വർക്ക്‌ഫ്ലോ
```bash
# ഡിബഗ് മോഡ് സജീവമാക്കുക
export AZD_DEBUG=true

# വിന്യാസ അവസ്ഥ പരിശോധിക്കുക
azd show

# കോൺഫിഗറേഷൻ സാധുവാക്കി പരിശോധിക്കുക
azd config list

# ലോഗുകൾക്കുള്ള മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --logs

# റിസോർസ് അവസ്ഥ പരിശോധിക്കുക
azd show --output json
```

## 🔍 ഡീബഗിംഗ് കമാൻഡുകൾ

### ഡീബഗ് വിവരം
```bash
# ഡബഗ് ഔട്ട്‌പുട്ട് പ്രവർത്തിപ്പിക്കുക
export AZD_DEBUG=true
azd <command> --debug

# കൂടുതൽ ശുദ്ധമായ ഔട്ട്‌പുട്ടിനായി ടെലിമെട്രി നിഷ്ക്രിയ Paarthamakuka
export AZD_DISABLE_TELEMETRY=true

# നിലവിലുള്ള കോൺഫിഗറേഷൻ പരിശോധിക്കുക
azd config list

# സംരക്ഷണ നില പരിശോധിക്കുക
az account show
```

### ടെംപ്ലേറ്റു ഡീബഗിംഗ്
```bash
# വിശദങ്ങളോടുകൂടിയ ലഭ്യമായ ടെംപ്ലേറ്റുകൾ പട്ടികപ്പെടുത്തുക
azd template list --output json

# ടെംപ്ലേറ്റ് വിവരങ്ങൾ കാണിക്കുക
azd template show <template-name>

# ആരംഭിക്കുന്നതിന് മുമ്പ് ടെംപ്ലേറ്റ് സാധുത പരിശോധന നടത്തുക
azd template validate <template-name>
```

## 📁 ഫയൽ & ഡയറക്ടറി കമാൻഡുകൾ

### പ്രോജക്ട് ഘടന
```bash
# നിലവിലെ ഡയറക്ടറി ഘടന കാണിക്കുക
tree /f  # വിൻഡോസ്
find . -type f  # ലിനക്സ്/മാക്‌ഒഎസ്

# azd പ്രൊജക്ട് റൂട്ട് വഴി നാവിഗേറ്റ് ചെയ്യുക
cd $(azd root)

# azd കോൺഫിഗറേഷൻ ഡയറക്ടറി കാണിക്കുക
echo $AZD_CONFIG_DIR  # സാധാരണയായി ~/.azd
```

## 🎨 ഔട്ട്‌പുട്ട് ഫോർമാറ്റിംഗ്

### JSON ഔട്ട്‌പുട്ട്
```bash
# സ്ക്രിപ്റ്റിംഗ് සඳහා JSON ഔട്ട്പുട്ട് നേടുക
azd show --output json
azd env list --output json
azd config list --output json

# jq ഉപയോഗിച്ച് പാഴ്സുചെയ്യുക
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ടേബിൾ ഔട്ട്‌പുട്ട്
```bash
# പട്ടിക രൂപത്തിൽ ഫോർമാറ്റ് ചെയ്യുക
azd env list --output table

# വിന്യസിച്ച സേവനങ്ങൾ കാണുക
azd show --output json | jq '.services | keys'
```

## 🔧 സാധാരണ കമാൻഡ് സംയോജിതങ്ങൾ

### ഹെൽത്ത് ചെക്ക് സ്‌ക്രിപ്റ്റ്
```bash
#!/bin/bash
# വേഗത്തിൽ ആരോഗ്യം പരിശോധിക്കുക
azd show
azd env show
azd monitor --logs
```

### വിനിയോഗ വിവരസമർത്ഥനം
```bash
#!/bin/bash
# മുൻ-പ്രവർത്തന പരിശോധന
azd show
azd provision --preview  # വിന്യസിക്കുന്നതിന് മുന്നേ മാറ്റങ്ങൾ കണ്ട് നോക്കുക
az account show
```

### പരിസ്ഥിതി താരതമ്യം
```bash
#!/bin/bash
# പരിസരങ്ങളുമായി താരതമ്യം ചെയ്യുക
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### റിസോഴ്‌സ് ക്ലീൻഅപ്പ് സ്‌ക്രിപ്റ്റ്
```bash
#!/bin/bash
# പഴയ പരിസരങ്ങളെത്തുടങ്ങി ശുചികരിക്കുക
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 പരിസ്ഥിതി വാരിയബിൾസ്

### സാധാരണ പരിസ്ഥിതി വാരിയബിൾസ്
```bash
# അസ്യൂർ കോൺഫിഗറേഷൻ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD കോൺഫിഗറേഷൻ
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# അപ്ലിക്കേഷൻ കോൺഫിഗറേഷൻ
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 അടിയന്തര കമാൻഡുകൾ

### ദ്രുത പരിഹാരങ്ങൾ
```bash
# പ്രാമാണീകരണം പുനഃസജ്ജീകരിക്കുക
az account clear
az login

# പരിതസ്ഥിതി ശക്തമായി പുതുക്കുക
azd env refresh

# എല്ലാ സേവനങ്ങളും വീണ്ടും വിന്യാസം ചെയ്യുക
azd deploy

# വിന്യാസ നില പരിശോധിക്കുക
azd show --output json
```

### പുനരുജ്ജീവന കമാൻഡുകൾ
```bash
# പരാജയപ്പെട്ട വിന್ಯಾಸത്തിൽ നിന്ന് മടങ്ങിവരുക - വൃത്തിയാക്കി വീണ്ടും വിന്യാസ് ചെയ്യുക
azd down --force --purge
azd up

# അടിസ്ഥാന സൗകര്യം മാത്രം പുതുക്കുക
azd provision

# ആപ്ലിക്കേഷൻ മാത്രം വീണ്ടും വിന്യാസ് ചെയ്യുക
azd deploy
```

## 💡 പ്രൊ ടിപ്‌സ്

### വേഗതയുള്ള വർക്ക്‌ഫ്ലോയ്ക്കുള്ള പകരംനാമങ്ങൾ
```bash
# നിങ്ങളുടെ .bashrc അല്ലെങ്കിൽ .zshrc ൽ ചേർക്കുക
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ഫങ്ഷൻ ഷോർട്കട്ടുകൾ
```bash
# വേഗത്തിലുള്ള പരിസ്ഥിതി മാറൽ
azd-env() {
    azd env select $1 && azd show
}

# നിരീക്ഷണത്തോടെ വേഗത്തിലുള്ള വിന്യാസം
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# പരിസ്ഥിതി നിലസ്ഥിതി
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 സഹായവും രേഖകളും

### സഹായം നേടൽ
```bash
# സാധാരണ സഹായം
azd --help
azd help

# കമാൻഡ്-നിർദ്ദിഷ്ട സഹായം
azd up --help
azd env --help
azd config --help

# പതിപ്പ് ಮತ್ತು നിർമ്മാണ വിവരങ്ങൾ പ്രദർശിപ്പിക്കുക
azd version
azd version --output json
```

### രേഖകളുടെ ലിങ്കുകൾ
```bash
# ഡോക്യുമെന്റേഷൻ ബ്രൗസറിൽ തുറക്കുക
azd docs

# ടെംപ്ലേറ്റ് ഡോക്യുമെന്റേഷൻ കാണിക്കുക
azd template show <template-name> --docs
```

---

**ടിപ്പ്**: ഈ ചീറ്റ് ഷീറ്റ് ബുക്ക്‌മാർക്ക് ചെയ്ത് `Ctrl+F` ഉപയോഗിച്ച് നിങ്ങൾക്കാവശ്യമുള്ള കമാൻഡുകൾ ദ്രുതമായി കണ്ടെത്തുക!

---

**നാവിഗേഷൻ**
- **മുൻപുള്ള അധ്യായം**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **അടുത്ത അധ്യായം**: [Glossary](glossary.md)

---

> **💡 നിങ്ങളുടെ എഡിറ്ററിൽ Azure കമാൻഡ് സഹായം വേണോ?** `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിച്ച് [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ഇൻസ്റ്റാൾ ചെയ്യുക — AI, ഫൗണ്ടരി, വിനിയോഗം, ഡയഗ്നോസ്റ്റിക്‌സ്, മറ്റു 37 സ്‌കിൽസുകൾ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**പരാമർശം**:  
ഈ ദസ്താവേസ് AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ചു വിവർത്തനം ചെയ്തതാണ്. നാം യഥാർത്ഥതയ്ക്ക് ശ്രമിച്ചിട്ടുണ്ടെങ്കിലും, സ്വയം പ്രവർത്തിക്കുന്ന വിവർത്തനങ്ങളിൽ പിഴവുകളും അച്ചടക്കക്കുറവുകളും ഉണ്ടായിരിക്കാമെന്ന് ദയവായി ശ്രദ്ധിക്കുക. ദസ്താവേസ് സ്വത്​​വ ഭാഷയിൽ ഉള്ള അസൽ പ്രതിമയായി കണക്കാക്കപ്പെടണം. നിർണായകമായ വിവരങ്ങൾക്കായി, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം നിർദ്ദേശിക്കുന്നു. ഈ വിവർത്തനം ഉപയോഗിക്കുമ്പോൾ നിന്നേക്കാവുന്ന തെറ്റുഅർത്ഥപ്പെടലുകൾക്കോ ആശയക്കുഴപ്പങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->