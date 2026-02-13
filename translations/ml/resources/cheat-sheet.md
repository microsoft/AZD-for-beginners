# കമാൻഡ് ചീറ്റ് ഷീറ്റ - അത്യാവശ്യ AZD കമാൻഡുകൾ

**എല്ലാ അധ്യായങ്ങൾക്കും ദ്രുത റഫറൻസുകൾ**  
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../README.md)  
- **📖 ദ്രുത തുടക്കം**: [അധ്യായം 1: ഫൗണ്ടേഷൻ & ദ്രുത തുടക്കം](../README.md#-chapter-1-foundation--quick-start)  
- **🤖 AI കമാൻഡുകൾ**: [അധ്യായം 2: AI-ഫസ്റ്റ് ഡെവലപ്‌മെന്റ്](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)  
- **🔧 ഉന്നതതരം**: [അധ്യായം 4: ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ്](../README.md#️-chapter-4-infrastructure-as-code--deployment)  

## അവതാരിക

ഈ സമഗ്ര ചീറ്റ് ഷീറ്റ് സാധാരണയായി ഉപയോഗിക്കുന്ന Azure Developer CLI കമാൻഡുകൾ ക്യാറ്റഗറി പ്രകാരം ക്രമീകരിച്ച് പ്രായോഗിക ഉദാഹരണങ്ങളോടെ വേഗത്തിൽ റഫറൻസ് ചെയ്യാനുള്ള വിധം നൽകുന്നു. azd പ്രോജക്റ്റുകളുടെ ഡെവലപ്മെന്റ്, പ്രയാസ് പരിഹാരം, ദിവസേന പ്രവർത്തനങ്ങൾക്ക് വേഗത്തിലുള്ള സമീപനം ഇതിനെ അനുയോജ്യമായി മാറ്റുന്നു.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ചീറ്റ് ഷീറ്റ് ഉപയോഗിച്ച്, നിങ്ങൾക്ക്:  
- അത്യാവശ്യ Azure Developer CLI കമാൻഡുകളും സിന്റാക്സും ഇടയ്ക്കിടെ എളുപ്പത്തിൽ ലഭിക്കും  
- കമാൻഡുകൾ ഫംഗ്ഷണൽ ക്യാറ്റഗറികൾക്കും ഉപയോഗത്തിനുമനുസരിച്ച് എളുപ്പം മനസ്സിലാകും  
- സാധാരണ ഡെവലപ്മെന്റ്, വിനിയോഗ നിരീക്ഷണത്തിനുള്ള പ്രായോഗിക ഉദാഹരണങ്ങൾ ലഭിക്കും  
- പ്രശ്ന പരിഹാരത്തിന് ആവശ്യമായ കമാൻഡുകൾ വേഗത്തിൽ കണ്ടെത്താനാകും  
- ഉന്നത നിലവാരത്തിലുള്ള കോൺഫിഗറേഷൻ, കസ്റ്റമൈസേഷൻ ഓപ്ഷനുകൾ കാര്യക്ഷമമായി ഉപയോഗിക്കാം  
- പരിതസ്ഥിതി നിയന്ത്രണവും മൾട്ടി-പരിതസ്ഥിതി പ്രവൃത്തിചെയ്യൽ കമാൻഡുകളും എളുപ്പത്തിൽ കണ്ടെത്താം  

## പഠന ഫലങ്ങൾ

ഈ ചീറ്റ് ഷീറ്റ് പതിവായി ഉപയോഗിച്ചാൽ, നിങ്ങൾക്ക്  
- முழു ഡോക്യുമെന്റേഷൻ ഡൗൺ ചെയ്യാതെ azd കമാൻഡുകൾ ആത്മവിശ്വാസത്തോടെ പ്രവർത്തിപ്പിക്കാൻ കഴിയും  
- അനുയോജ്യമായ ഡയഗ്നോസ്റ്റിക് കമാൻഡുകൾ ഉപയോഗിച്ച് പൊതുവായ പ്രശ്നങ്ങൾ വേഗത്തിൽ പരിഹരിക്കാം  
- മൾട്ടി-പരിതസ്ഥിതികളും വിനിയോഗ സാഹചര്യങ്ങളും കാര്യക്ഷമമായി കൈകാര്യം ചെയ്യാം  
- ആവശ്യമെങ്കിൽ azd സവിശേഷതകളും കോൺഫിഗറേഷനും ആപേക്ഷികമായി ഉപയോഗിക്കാം  
- പദ്ധതികളുടെ വിനിയോഗ പ്രശ്നങ്ങൾ സമ്പ്രദായമായ കമാൻഡ് ക്രമങ്ങളിലൂടെ ഫലപ്രദമായി പരിഹരിക്കാം  
- azd ഷോർട്ട്കട്ടുകളും ഓപ്ഷനുകളും ഉപയോഗിച്ച് പ്രവൃത്തിചെയ്യൽ പ്രക്രിയകൾ മെച്ചപ്പെടുത്താം  

## ആരംഭ കമാൻഡുകൾ

### അത്തിലരാജ്യം  
```bash
# AZD വഴി Azure ലോഗിൻ ചെയ്യുക
azd auth login

# Azure CLI ലോഗിൻ ചെയ്യുക (AZD ഇത് പിന്നേറ്റായി ഉപയോഗിക്കുന്നു)
az login

# നിലവിലെ അക്കൗണ്ട് പരിശോധിക്കുക
az account show

# ഡിഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD-യിൽ നിന്നും ലോ/logout ചെയ്യുക
azd auth logout

# Azure CLI-യിൽ നിന്നും ലോ/logout ചെയ്യുക
az logout
```
  
### പ്രോജക്ട് തുടക്കം  
```bash
# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
azd template list

# ടെംപ്ലേറ്റ് മുതൽ ആരംഭിക്കുക
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# നിലവിലെ ഡയറക്ടറിയിൽ ആരംഭിക്കുക
azd init .

# ഇഷ്ടനാമത്തോടെ ആരംഭിക്കുക
azd init --template todo-nodejs-mongo my-awesome-app
```
  
## കോർ വിനിയോഗ കമാൻഡുകൾ

### പൂര്‍ണ വിനിയോഗ പ്രവൃത്തി പ്രക്രിയ  
```bash
# എല്ലാം വിന്യസിക്കുക (പ്രവേശിപ്പിക്കൽ + വിന്യാസം)
azd up

# സ്ഥിരീകരണ പ്രാമ്പ്റ്റുകൾ അപ്രാപ്തമാക്കി വിന്യസിക്കുക
azd up --confirm-with-no-prompt

# പ്രത്യേക പരിസ്ഥിതിയിലേക്ക് വിന്യസിക്കുക
azd up --environment production

# ഇഷ്ടാനുസൃത പാരാമീറ്ററുകളോടുകൂടി വിന്യാസം
azd up --parameter location=westus2
```
  
### ഇൻഫ്രാസ്ട്രക്ചർ മാത്രമേ ആയിരിയ്ക്കൂ  
```bash
# Azure വിഭവങ്ങൾ ഒരുക്കുക
azd provision

# 🧪 അടിസ്ഥാന സൗകര്യ മാറ്റങ്ങൾ പൂർവദൃഷ്‌ടീകരിക്കുക
azd provision --preview
# സൃഷ്ടിക്കപ്പെടുക/പരിഷ്‌കരിക്കുക/നശിപ്പിക്കുക എന്ന സ്രോതസുകൾ എന്തെല്ലാം ആയിരിക്കും എന്ന് ഡ്രൈ-റൺ കാഴ്ച കാണിക്കുന്നു
# 'terraform plan' അല്ലെങ്കിൽ 'bicep what-if' പോലെ - സുരക്ഷിതമായി പ്രവർത്തിക്കാം, യാതൊരു മാറ്റവും പ്രയോഗം ചെയ്യില്ല
```
  
### ആപ്പ്ലിക്കേഷൻ മാത്രം  
```bash
# ആപ്ലിക്കേഷൻ കോഡ് വിന്യസിക്കുക
azd deploy

# പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy --all
```
  
### ബിൽഡ് ആൻഡ് പാക്കേജ്  
```bash
# അപ്ലിക്കേഷനുകൾ നിർമ്മിക്കുക
azd package

# പ്രത്യേക സേവനം നിർമ്മിക്കുക
azd package --service api
```
  
## 🌍 പരിതസ്ഥിതി മാനേജ്‌മെന്റ്  

### പരിതസ്ഥിതി പ്രവർത്തനങ്ങൾ  
```bash
# എല്ലാ പരിസ്ഥിതികളും ലിസ്റ്റുചെയ്യുക
azd env list

# പുതിയ പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new development
azd env new staging --location westus2

# പരിസ്ഥിതി തിരഞ്ഞെടുക്കുക
azd env select production

# നിലവിലുള്ള പരിസ്ഥിതി കാണിക്കുക
azd env show

# പരിസ്ഥിതി നില പുതുക്കുക
azd env refresh
```
  
### പരിതസ്ഥിതി വേരിയബിൾസ്  
```bash
# പരിസ്ഥിതി വ്യത്യാസം സജ്ജമാക്കുക
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# പരിസ്ഥിതി വ്യത്യാസം നേടുക
azd env get API_KEY

# എല്ലാ പരിസ്ഥിതി വ്യത്യാസങ്ങളും പട്ടികപ്പെടുത്തുക
azd env get-values

# പരിസ്ഥിതി വ്യത്യാസം നീക്കം ചെയ്യുക
azd env unset DEBUG
```
  
## ⚙️ കോൺഫിഗറേഷൻ കമാൻഡുകൾ

### ഗ്ലോബൽ കോൺഫിഗറേഷൻ  
```bash
# എല്ലാ കോൺഫിഗറേഷനുകളും ലിസ്റ്റുചെയ്യുക
azd config list

# ഗ്ലോബൽ ഡീഫോൾട്ടുകൾ സജ്ജമാക്കുക
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# കോൺഫിഗറേഷൻ നീക്കം ചെയ്യുക
azd config unset defaults.location

# എല്ലാ കോൺഫിഗറേഷനുകളും റീസെറ്റ് ചെയ്യുക
azd config reset
```
  
### പ്രോജക്റ്റ് കോൺഫിഗറേഷൻ  
```bash
# azure.yaml സ്ഥിരീകരിക്കുക
azd config validate

# പ്രോജക്ട് വിവരങ്ങൾ കാണിക്കുക
azd show

# സർവീസ് എൻഡ്പോയിന്റുകൾ നേടുക
azd show --output json
```
  
## 📊 നിരീക്ഷണവും ഡയഗ്നോസിസും

### നിരീക്ഷണ ഡാഷ്ബോർഡ്  
```bash
# അസ്യൂർ പോർട്ടൽ മേൽനോട്ട ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ലൈവ് മെട്രിക്‌സ് തുറക്കുക
azd monitor --live

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് ലോഗ്സ് ബ്ലേഡ് തുറക്കുക
azd monitor --logs

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് അവലോകനം തുറക്കുക
azd monitor --overview
```
  
### കണ്ടെയ്‌നർ ലോഗുകൾ കാണുക  
```bash
# ലോഗുകൾ Azure CLI വഴിയും (Container Apps-നായി) കാണുക
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ലോഗുകൾ യഥാർത്ഥ സമയത്ത് പിന്തുടരുക
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure പോർട്ടലിൽ നിന്ന് ലോഗുകൾ കാണുക
azd monitor --logs
```
  
### ലോക്ക് അനലിറ്റിക്സ് ക്വെറിയുകൾ  
```bash
# ആസ്യൂർ പോർട്ടലിലൂടെ ആക്‌സസ് ലോഗ് അനലിറ്റിക്സ്
azd monitor --logs

# ആസ്യൂർ CLI ഉപയോഗിച്ച് ലോഗുകൾ ക്വറി ചെയ്യുക
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```
  
## 🛠️ പരിപാലന കമാൻഡുകൾ

### ക്ലീൻഅപ്പ്  
```bash
# എല്ലാ Azure വിഭവങ്ങളെയും നീക്കം ചെയ്യുക
azd down

# സ്ഥിരീകരണം ഇല്ലാതെ ബലാൽസഹായത്തോടെ നീക്കം ചെയ്യുക
azd down --force

# സോഫ്റ്റ്-ഡിലീറ്റ് ചെയ്‌ത വിഭവങ്ങൾ ശുദ്ധീകരിക്കുക
azd down --purge

# പൂർണ്ണമായ ക്ലീനപ്പ്
azd down --force --purge
```
  
### അപ്‌ഡേറ്റുകൾ  
```bash
# azd അപ്‌ഡേറ്റുകൾ പരിശോധിക്കുക
azd version

# നിലവിലെ പതിപ്പ് നേടുക
azd version

# നിലവിലെ കോൺഫിഗറേഷൻ കാണുക
azd config list
```
  
## 🔧 ഉന്നത കമാൻഡുകൾ

### പൈപ്പ്‌ലൈൻ & CI/CD  
```bash
# GitHub Actions ക്രമീകരിക്കുക
azd pipeline config

# Azure DevOps ക്രമീകരിക്കുക
azd pipeline config --provider azdo

# പൈപ്പ്ലൈൻ ക്രമീകരണം കാണിക്കുക
azd pipeline show
```
  
### ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്‌മെന്റ്  
```bash
# ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ സൃഷ്‌ടിക്കുക
azd infra generate

# 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ & പദ്ധതി
azd provision --preview
# വിന്യാസം നടത്താതെ ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് അനുകരിക്കുന്നു
# ബൈസപ്/ടെറാഫോം ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്ത് കാണിക്കുന്നു:
# - ചേർക്കേണ്ട വിഭവങ്ങൾ (പച്ച +)
# - മാറ്റേണ്ട വിഭവങ്ങൾ (മഞ്ഞ ~)
# - നീക്കം ചെയ്യേണ്ട വിഭവങ്ങൾ (ചുവപ്പ് -)
# സുരക്ഷിതമായി പ്രവർത്തിക്കാൻ - അസ്യൂർ പരിതസ്ഥിതിയിലേക്ക് യഥാർത്ഥ മാറ്റങ്ങൾ ഇല്ല

# azure.yaml ൽ നിന്നുള്ള ഇൻഫ്രാസ്ട്രക്ചർ സംയോജിപ്പിക്കുക
azd infra synth
```
  
### പ്രോജക്റ്റ് വിവരങ്ങൾ  
```bash
# പ്രോജക്ട് നിലയും എന്റ്പോയിന്റുകളും കാണിക്കുക
azd show

# വിതരണമായ പ്രോജക്ട് വിവരങ്ങൾ JSON ആയി കാണിക്കുക
azd show --output json

# സേവന എന്റ്പോയിന്റുകൾ ലഭിക്കുക
azd show --output json | jq '.services'
```
  
## 🎯 ദ്രുത പ്രവൃത്തി പ്രക്രിയകൾ

### ഡെവലപ്മെന്റ് പ്രവൃത്തി പ്രക്രിയ  
```bash
# പുതിയ പ്രോജക്ട് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo
cd my-project

# വികസനത്തിലേക്ക് വിന്യസിക്കുക
azd env new dev
azd up

# മാറ്റങ്ങൾ ചെയ്യുക ಮತ್ತು മടങ്ങിവിന്യസിക്കുക
azd deploy

# മോനിറ്ററിംഗ് ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --live
```
  
### മൾട്ടി-പരിതസ്ഥിതി പ്രവൃത്തി പ്രക്രിയ  
```bash
# പരിസ്ഥിതികൾ സജ്ജീകരിക്കുക
azd env new dev
azd env new staging  
azd env new production

# ഡെവിലേക്ക് വിന്യസിക്കുക
azd env select dev
azd up

# പരീക്ഷിച്ച് സ്റ്റേജിംഗിലേക്ക് പ്രോത്സാഹിപ്പിക്കുക
azd env select staging
azd up

# ഉൽപ്പാദനത്തിലേക്കു വിന്യസിക്കുക
azd env select production
azd up
```
  
### പ്രശ്ന പരിഹാര പ്രവൃത്തി പ്രക്രിയ  
```bash
# ഡീബഗ് മോഡ് സജ്ജമാക്കുക
export AZD_DEBUG=true

# വിന്യസന നില പരിശോധിക്കുക
azd show

# കോൺഫിഗറേഷൻ സാധുത പരിശോധിക്കുക
azd config list

# ലോഗുകൾക്കായി മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --logs

# സ്രോതസ്സ് സ്ഥിതി പരിശോധിക്കുക
azd show --output json
```
  
## 🔍 ഡീബഗിംഗ് കമാൻഡുകൾ

### ഡീബഗ് വിവരങ്ങൾ  
```bash
# ഡീബഗ് ഔട്ട്പുട്ട് ചാലൂ ചെയ്യുക
export AZD_DEBUG=true
azd <command> --debug

# മികച്ച ഔട്ട്പുട്ടിനായി ടെലിമെട്രി முடക്കുക
export AZD_DISABLE_TELEMETRY=true

# നിലവിലെ വിവാഹം പരിശോധിക്കുക
azd config list

# ഓത്യന്റിക്കേഷൻ നില പരിശോധിക്കുക
az account show
```
  
### ടെംപ്ലേറ്റ് ഡീബഗിംഗ്  
```bash
# വിശദാംശങ്ങളോടെയും ലഭ്യമായ ടാമ്പ്‌ലേറ്റുകൾ ലിസ്റ്റ് ചെയ്യുക
azd template list --output json

# ടാമ്പ്‌ലേറ്റ് വിവരങ്ങൾ കാണിക്കുക
azd template show <template-name>

# തുടങ്ങി മുമ്പ് ടാമ്പ്‌ലേറ്റ് സാധു പരിശോധിക്കുക
azd template validate <template-name>
```
  
## 📁 ഫയൽ & ഡയറക്ടറി കമാൻഡുകൾ

### പ്രോജക്റ്റ് ഘടന  
```bash
# നിലവിലെ ഡയറക്ടറി ഘടന കാണിക്കുക
tree /f  # വിൻഡോസ്
find . -type f  # ലിനക്‌സ്/മാക്‌ഓ‌എസ്

# azd പ്രോജക്റ്റ് റൂട്ടിലേക്ക് നാവിഗേറ്റ് ചെയ്യുക
cd $(azd root)

# azd കോൺഫിഗറേഷൻ ഡയറക്ടറി കാണിക്കുക
echo $AZD_CONFIG_DIR  # സാധാരണയായി ~/.azd
```
  
## 🎨 ഔട്ട്പുട്ട് ഫോർമാറ്റിംഗ്

### JSON ഔട്ട്പുട്ട്  
```bash
# സ്ക്രിപ്റ്റിങ്ങിനായി JSON output നേടുക
azd show --output json
azd env list --output json
azd config list --output json

# jq ഉപയോഗിച്ച് പാഴ് ചെയ്യുക
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```
  
### ടേബിൾ ഔട്ട്പുട്ട്  
```bash
# പട്ടികയായി ഫോർമാറ്റ് ചെയ്യുക
azd env list --output table

# വിന്യസിച്ച സേവനങ്ങൾ കാണുക
azd show --output json | jq '.services | keys'
```
  
## 🔧 സാധാരണ കമാൻഡ് സംയോജനം

### ഹെൽത്ത് ചെക്ക് സ്ക്രിപ്റ്റ്  
```bash
#!/bin/bash
# അതിവേഗ ആരോഗ്യ പരിശോധന
azd show
azd env show
azd monitor --logs
```
  
### വിനിയോഗ വാലിഡേഷൻ  
```bash
#!/bin/bash
# മുൻ-പ്രവർത്തന പരിശോധന
azd show
azd provision --preview  # വിന്യസിക്കുന്നതിന് മുമ്പ് മാറ്റങ്ങൾ പ്രിവ്യൂ ചെയ്യുക
az account show
```
  
### പരിതസ്ഥിതി താരതമ്യം  
```bash
#!/bin/bash
# പരിസ്ഥിതികൾ താരതമ്യം ചെയ്യുക
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```
  
### വിഭവശുദ്ധി സ്ക്രിപ്റ്റ്  
```bash
#!/bin/bash
# പഴയ പരിസ്ഥിതികള്‍ ശുദ്ധമാക്കുക
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```
  
## 📝 പരിതസ്ഥിതി വേരിയബിൾസ്

### സാധാരണ പരിതസ്ഥിതി വേരിയബിൾസ്  
```bash
# ആസ്യൂർ കോൺഫിഗറേഷൻ
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
# പ്രാമാണീകരണം മടക്കം സജ്ജമാക്കുക
az account clear
az login

# പരിസ്ഥിതി ശക്തമായി പുതുക്കുക
azd env refresh

# എല്ലാ സേവനങ്ങളും വീണ്ടും വിന്യസിക്കുക
azd deploy

# വിന്യസനത്തിന്റെ സ്ഥിതി പരിശോധിക്കുക
azd show --output json
```
  
### പുനരുദ്ധാരണ കമാൻഡുകൾ  
```bash
# പരാജയപ്പെട്ട വിന്യാസത്തിൽ നിന്നും മടക്കം നേടുക - സുതാര്യമായി പുനർവിന്യസിക്കുക
azd down --force --purge
azd up

# അടിസ്ഥാനഘടന മാത്രം പുനരാഘാടിക്കുക
azd provision

# അപേക്ഷ മാത്രം പുനർവിന്യസിക്കുക
azd deploy
```
  
## 💡 പ്രൊ ടിപ്‌സ്

### വേഗത്തിൽ പ്രവൃത്തി പിന്നോട്ടുള്ള അലിയാസുകൾ  
```bash
# നിങ്ങളുടെ .bashrc അല്ലെങ്കിൽ .zshrc ലേക്ക് ചേർക്കുക
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```
  
### ഫംഗ്ഷൻ ഷോർട്ട്കട്ടുകൾ  
```bash
# სწრაფი გარემოს შეცვლა
azd-env() {
    azd env select $1 && azd show
}

# სწრაფი განთავსება მონიტორინგით
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# გარემოს სტატუსი
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```
  
## 📖 സഹായവും ഡോക്ക്യുമെന്റേഷനും

### സഹായം ലഭിക്കുക  
```bash
# പൊതുവായ സഹായം
azd --help
azd help

# കമാൻഡ്-സവിശേഷ സഹായം
azd up --help
azd env --help
azd config --help

# പതിപ്പ് மற்றும் ബിൽഡ് വിവരങ്ങൾ കാണിക്കുക
azd version
azd version --output json
```
  
### ഡോക്യുമെന്റേഷൻ ലിങ്കുകൾ  
```bash
# ബ്രൗസറിൽ ഡോക്യുമെന്റേഷൻ തുറക്കുക
azd docs

# ടെംപ്ലേറ്റ് ഡോക്യുമെന്റേഷൻ കാണിക്കുക
azd template show <template-name> --docs
```
  
---

**ടിപ്പ്**: ഈ ചീറ്റ് ഷീറ്റിനെ ബുക്ക്മാർക്ക് ചെയ്തു `Ctrl+F` ഉപയോഗിച്ച് നിങ്ങൾക്കു വേണ്ട കമാൻഡുകൾ വേഗത്തിൽ കണ്ടെത്തൂ!

---

**നാവിഗേഷൻ**  
- **മുൻപത്തെ പാഠം**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)  
- **അടുത്ത പാഠം**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസൂയം**:  
ഈ ഡോക്യുമെന്റ് AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം ശരിയായ വിവർത്തനത്തിനായി ശ്രമിക്കുന്നിരിക്കുമ്പോഴും, സ്വയം പ്രവർത്തിക്കുന്ന വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അകൃത്യതകൾ ഉണ്ടാവാൻ സാധ്യതയുള്ളതാണ്. ആ സാക്ഷരതയുള്ള ഭാഷയിൽ ഉള്ള അസൽ ഡോക്യുമെന്റ് പ്രാമാണിക ഉറവിടമായി കണക്കാക്കേണ്ടതാണ്. പ്രധാനപ്പെട്ട വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മാനവ വിവർത്തനം ശുഭ്രമമാണ്. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകാവുന്ന любых തെറ്റിദ്ധാരണകൾക്കോ അർത്ഥ ലാപങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളായിരിക്കില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->