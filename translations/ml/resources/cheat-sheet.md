# കമാൻഡ് ചീറ്റ് ഷീറ്റ് - അനിവാര്യമായ AZD കമാൻഡുകൾ

**എല്ലാ അധ്യായങ്ങൾക്കും വേഗത്തിലുള്ള റഫറൻസ്**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../README.md)
- **📖 ക്വിക് സ്റ്റാർട്ട്**: [അധ്യായം 1: അടിസ്ഥാനവും ക്വിക് സ്റ്റാർട്ടും](../README.md#-chapter-1-foundation--quick-start)
- **🤖 എഐ കമാൻഡുകൾ**: [അധ്യായം 2: എഐ-ഫസ്റ്റ് ഡെവലപ്മെന്റ്](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 പരിചയസമ്പന്നർ**: [അധ്യായം 4: ഇന്‌ഫ്രാസ്ട്രക്ചർ അസ്കോഡ്](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## പരിചയം

ഈ സമഗ്രമായ ചീറ്റ് ഷീറ്റ് ഏറ്റവും സാധാരണമായി ഉപയോഗിക്കുന്ന ആസ്യൂർ ഡെവലപർ CLI കമാൻഡുകൾക്ക് വേഗത്തിലുള്ള റഫറൻസ് നൽകുന്നു, പ്രായോഗിക ഉദാഹരണങ്ങളോടുകൂടി വിഭാഗങ്ങൾ അനുസരിച്ച് സമ്പാദ്യമായിരിക്കുന്നു. ഡെവലപ്മെന്റ്, പ്രശ്നപരിഹാരം, ദിവസാന്ത്യ പ്രവർത്തനങ്ങൾ എന്നിവയ്ക്കായി azd പ്രോജెక్టുകൾ ഉപയോഗിക്കുമ്പോൾ വേഗത്തിൽ പരിശോധിക്കാൻ വളരെ യുക്തമായതാണ്.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ചീറ്റ് ഷീറ്റ് ഉപയോഗിച്ച്, നിങ്ങൾക്കു്:
- അനിവാര്യമായ ആസ്യൂർ ഡെവലപർ CLI കമാൻഡുകൾക്കും സിന്ടാക്സിനും ഉടൻ ആക്‌സസ് ലഭിക്കും
- ഫംഗ്ഷണൽ വിഭാഗങ്ങൾക്കും ഉപയോഗകേസുകൾക്കുമനുസരിച്ച് കമാൻഡുകൾ എങ്ങനെ ക്രമീകരിക്കാമെന്ന് മനസ്സിലാക്കും
- സാധാരണ ഡെവലപ്മെന്റ്, വിനയിടൽ രംഗങ്ങളിലേക്കുള്ള പ്രായോഗിക ഉദാഹരണങ്ങൾ റഫറൻസ് ചെയ്യാം
- പ്രശ്നപരിഹാര കമാൻഡുകൾ വേഗത്തിൽ ഉപയോഗിച്ചു പ്രശ്നങ്ങൾ പരിഹരിക്കാം
- പരിചയസമ്പന്നമായ ക്രമീകരണവും ആസ്വാദനങ്ങളും എളുപ്പത്തിൽ കണ്ടെത്താം
- പരിസ്ഥിതി മാനേജ്മെന്റ്, മൾടി-പരിസ്ഥിതി വർക്ക്‌ഫ്ലോ കമാൻഡുകൾ അവഗണിക്കാതെ കണ്ടെത്താൻ കഴിയും

## പഠന ഫലങ്ങൾ

ഈ ചീറ്റ് ഷീറ്റ് പണിതുപയോഗിച്ച്, നിങ്ങൾക്ക് കഴിയും:
- azd കമാൻഡുകൾ പൂർണ്ണ ഡോക്യുമെന്റേഷൻ നോക്കാതെ ആത്മവിശ്വാസത്തോടെ പ്രവർത്തിപ്പിക്കുക
- അനുയോജ്യമായ ഡയഗ്നസ്റ്റിക് കമാൻഡുകൾ ഉപയോഗിച്ച് സാധാരണ പ്രശ്നങ്ങൾ വേഗം പരിഹരിക്കുക
- മൾട്ടി-പരിസ്ഥിതികളും വിനയിടൽ ദൃശ്യങ്ങളും കാര്യക്ഷമമായി കൈകാര്യം ചെയ്യുക
- ആവശ്യമുള്ളപ്പോൾ പരിചയസമ്പന്നമായ azd ഫീച്ചറുകളും ക്രമീകരണ ഓപ്ഷനുകളും ഉപയോഗിക്കുക
- സിസ്റ്റമാറ്റിക് കമാൻഡ് ക്രമങ്ങൾ ഉപയോഗിച്ച് വിനയിടൽ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- azd ഷോർട്കട്ടുകളും ഓപ്ഷന്റെയും സഹായത്തോടെ വർക്ക്‌ഫ്ലോകൾ മെച്ചപ്പെടുത്തുക

## തുടക്കം കുറിക്കുന്ന കമാൻഡുകൾ

### തിരിച്ചറിയൽ
```bash
# AZD വഴി Azure ലോഗിൻ ചെയ്യുക
azd auth login

# Azure CLI ലോഗിൻ ചെയ്യുക (AZD ഇതിനെ അണ്ടർ ദി ഹുഡിൽ ഉപയോഗിക്കുന്നു)
az login

# നിലവിലെ അക്കൗണ്ട് പരിശോധിക്കുക
az account show

# ഡിഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സെറ്റ് ചെയ്യുക
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZDയിൽ നിന്നും ലോഗൗട്ട് ചെയ്യുക
azd auth logout

# Azure CLIയിൽ നിന്നും ലോഗൗട്ട് ചെയ്യുക
az logout
```

### പ്രോജക്ട് ആരംഭിക്കൽ
```bash
# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
azd template list

# ടെംപ്ലേറ്റിൽ നിന്ന് തുടക്കം കുറിക്കുക
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# നിലവിലെ ഡയറക്ടറിയിൽ തുടക്കം കുറിക്കുക
azd init .

# ഇഷ്ടാനുസൃത പേരോടെ തുടക്കം കുറിക്കുക
azd init --template todo-nodejs-mongo my-awesome-app
```

## കോർ വിനയിടൽ കമാൻഡുകൾ

### സമഗ്ര വിനയിടൽ വർക്ക്‌ഫ്ലോ
```bash
# എല്ലാം വിന്യസിക്കുക (പ്രൊവിഷൻ + വിന്യസിക്കുക)
azd up

# സ്ഥിരീകരണ പ്രാമ്പ്റ്റുകൾ അപ്രാപ്തമാക്കി വിന്യസിക്കുക
azd up --confirm-with-no-prompt

# പ്രത്യേക പരിസ്ഥിതിക്ക് വിന്യസിക്കുക
azd up --environment production

# കസ്റ്റം പരാമീറ്ററുകൾ ഉപയോഗിച്ച് വിന്യസിക്കുക
azd up --parameter location=westus2
```

### സാങ്കേതിക അടിസ്ഥാനങ്ങൾ മാത്രം
```bash
# ആസ്യൂർ വിഭവങ്ങൾ ഒരുക്കുക
azd provision

# 🧪 നിർമാണ വ്യവസ്ഥാനങ്ങളിൽ முன்னറിവ്
azd provision --preview
# സ്രഷ്ടിക്കപ്പെടുന്നതും/മാറുന്നത്/അഴിച്ചുവിടുന്നതും ആയ വിഭവങ്ങളുടെ ഡ്രൈ-റൺ ദൃശ്യങ്ങൾ കാണിക്കുന്നു
# 'ടെറാഫോം പ്ലാൻ' അല്ലെങ്കിൽ 'ബൈസപ് ഹ്വാറ്റ്-ഇഫ്' പോലെയാണ് - സുരക്ഷിതമായി പ്രവർത്തിപ്പിക്കാൻ, മാറ്റങ്ങൾ വരുത്തുന്നില്ല
```

### അപ്ലിക്കേഷൻ മാത്രം
```bash
# അപേക്ഷാ കോഡ് നിലയിൽ വെക്കുക
azd deploy

# പ്രത്യേക സേവനം നിലയിൽ വെക്കുക
azd deploy --service web
azd deploy --service api

# എല്ലാ സേവനങ്ങളും നിലയിൽ വെക്കുക
azd deploy --all
```

### ബിൽഡ്‌ ചെയ്യൽ, പാക്കേജ്
```bash
# ആപ്ലിക്കേഷനുകൾ നിർമ്മിക്കുക
azd package

# പ്രത്യേക സേവനം നിർമ്മിക്കുക
azd package --service api
```

## 🌍 പരിസ്ഥിതി മാനേജ്മെന്റ്

### പരിസ്ഥിതി പ്രവർത്തനങ്ങൾ
```bash
# എല്ലാ പരിസരങ്ങളും പട്ടിക ചെയ്‌ത് കാണിക്കുക
azd env list

# പുതിയ പരിസരം സൃഷ്‌ടിക്കുക
azd env new development
azd env new staging --location westus2

# പരിസരം തിരഞ്ഞെടുക്കുക
azd env select production

# ലഭ്യമായ പരിസരങ്ങൾ പ്രദർശിപ്പിക്കുക
azd env list

# പരിസരത്തിന്റെ നില പുതുക്കുക
azd env refresh
```

### പരിസ്ഥിതി ചാരങ്ങൾ
```bash
# പരിസ്ഥിതി 변수 സജ്ജമാക്കുക
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# പരിസ്ഥിതി 변수 കൊണ്ടുവരുക
azd env get API_KEY

# എല്ലാ പരിസ്ഥിതി 변수കളും പട്ടികപ്പെടുത്തുക
azd env get-values

# പരിസ്ഥിതി 변수 നീക്കം ചെയ്യുക
azd env unset DEBUG
```

## ⚙️ ക്രമീകരണ കമാൻഡുകൾ

### ആഗോള ക്രമീകരണം
```bash
# എല്ലാ കോൺഫിഗറേഷനും പ്രസൂചിപ്പിക്കുക
azd config show

# ആഗോള ഡിഫോൾട്ടുകൾ സജ്ജീകരിക്കുക
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# കോൺഫിഗറേഷൻ നീക്കം ചെയ്യുക
azd config unset defaults.location

# ഒരുമിച്ചുള്ള എല്ലാ കോൺഫിഗറേഷനും റീസെറ്റ് ചെയ്യുക
azd config reset
```

### പ്രോജക്ട് ക്രമീകരണം
```bash
# azure.yaml ചട്ടമുള്ളതാണോ എന്ന് പരിശോദിക്കുക
azd config validate

# പ്രോജക്ട് വിവരങ്ങൾ പ്രദർശിപ്പിക്കുക
azd show

# സേവന എന്റ്പോയിന്റുകൾ നേടുക
azd show --output json
```

## 📊 നിരീക്ഷണവും ഡയഗ്നോസ്റ്റിക്‌സും

### നിരീക്ഷണ ഡാഷ്‌ബോർഡ്
```bash
# ആസ്യൂർ പോർട്ടൽ നിരീക്ഷണ ഡാഷ്ബോാർഡ് തുറക്കുക
azd monitor

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ലൈവ് മെട്രിക്‌സ് തുറക്കുക
azd monitor --live

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ലോഗ്സ് ബ്ലേഡ് തുറക്കുക
azd monitor --logs

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് അവലോകനം തുറക്കുക
azd monitor --overview
```

### കണ്ടെയ്‌നർ ലോഗുകൾ കാണുക
```bash
# ആസ്യൂർ CLI മുഖേന ലോഗുകൾ കാണുക (കന്റെയിനർ ആപ്പുകൾക്കായി)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# യഥാർത്ഥ സമയത്ത് ലോഗുകൾ പിന്തുടരുക
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ആസ്യൂർ പോർട്ടൽ നിന്ന് ലോഗുകൾ കാണുക
azd monitor --logs
```

### ലോഗ് അനലിറ്റിക്സ് ക്വറികൾ
```bash
# ആസ്യൂർ പോർട്ടലിലൂടെ ആക്‌സസ് ലോഗ് അനലിറ്റിക്സ്
azd monitor --logs

# Azure CLI ഉപയോഗിച്ച് ലോഗുകൾ ക്വറിയുചെയ്യുക
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ പരിപാലന കമാൻഡുകൾ

### ശുചീകരണം
```bash
# എല്ലാ അസ്യൂർ വിഭവങ്ങളും നീക്കം ചെയ്യുക
azd down

# സ്ഥിരീകരണം നൽകാതെ ബലാത്കരിച്ച് ഇല്ലാക്കുക
azd down --force

# സോഫ്റ്റ്-ഡിലീറ്റ് ചെയ്ത വിഭവങ്ങൾ പൂർണ്ണമായി നീക്കം ചെയ്യുക
azd down --purge

# പൂർണ്ണമായ ക്ലീനപ്പ് 완료
azd down --force --purge
```

### അപ്‌ഡേറ്റുകൾ
```bash
# azd അപ്‌ഡേറ്റുകൾ പരിശോധിക്കുക
azd version

# നിലവിലെ പതിപ്പ് നേടുക
azd version

# നിലവിലെ കോൺഫിഗറേഷൻ കാണുക
azd config show
```

## 🔧 പരിചയസമ്പന്ന കമാൻഡുകൾ

### പൈപ്പ്ലൈൻ, CI/CD
```bash
# ഗിറ്റ്‍ഹബ് ആക്ഷൻസുകൾ ക്രമീകരിക്കുക
azd pipeline config

# അസ്യൂർ ഡവ്ഒപ്സ് ക്രമീകരിക്കുക
azd pipeline config --provider azdo

# പൈപ്പ്ലൈൻ ക്രമീകരണം കാണിക്കുക
azd pipeline show
```

### സാങ്കേതിക അടിസ്ഥാന മാനേജ്മെന്റ്
```bash
# ഇൻഫ്രാസ്ട്രക്‌ചർ ടെംപ്ലേറ്റുകൾ സൃഷ്‌ടിക്കുക
azd infra generate

# 🧪 ഇൻഫ്രാസ്ട്രക്‌ചർ പ്രീവ്യൂ & പ്ലാനിംഗ്
azd provision --preview
# വിന്യസിക്കാതെ ഇൻഫ്രാസ്ട്രക്‌ചർ പ്രൊവിഷനിംഗ് അനുകരിക്കുന്നു
# ബൈസപ്/ടെറഫോം ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്ത് കാണിക്കുന്നു:
# - ചേർക്കേണ്ട റിസോഴ്‌സുകൾ (പച്ച +)
# - മാറ്റം വരുത്തേണ്ട റിസോഴ്‌സുകൾ (മഞ്ഞ ~)
# - നീക്കം ചെയ്യേണ്ട റിസോഴ്‌സുകൾ (ചുവപ്പ് -)
# സുരക്ഷിതമായ ഓടിക്കൽ - അസ്യൂർ പരിസ്ഥിതിക്ക് യാതൊരു യഥാർഥ മാറ്റവും ഉണ്ടായിട്ടില്ല

# azure.yaml ൽ നിന്ന് ഇൻഫ്രാസ്ട്രക്‌ചർ സംയോജിപ്പിക്കുക
azd infra synth
```

### പ്രോജക്ട് വിവരം
```bash
# പ്രോജക്ട് നിലയും എൻഡ്‌പോയിന്റുകളും കാണിക്കുക
azd show

# JSON ആയി വിശദമായ പ്രോജക്ട് വിവരങ്ങൾ കാണിക്കുക
azd show --output json

# സർവീസ് എൻഡ്‌പോയിന്റുകൾ നേടുക
azd show --output json | jq '.services'
```

## 🤖 എഐ & എക്സ്റ്റൻഷൻസ് കമാൻഡുകൾ

### AZD എക്സ്റ്റൻഷൻസ്
```bash
# ലഭ്യമായ എല്ലാ എക്സ്റ്റെൻഷനുകളും സൂചിപ്പിക്കുക (AI ഉൾപ്പെടെ)
azd extension list

# ഫൗൻഡ്രി ഏജന്റ്സ് എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.agents

# ഫൈൻ-ട്യൂണിംഗ് എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.finetune

# കസ്റ്റം മോഡലുകൾ എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.models

# ഇൻസ്റ്റാൾ ചെയ്ത എല്ലാ എക്സ്റ്റെൻഷനുകളും അപ്ഗ്രേഡ് ചെയ്യുക
azd extension upgrade --all
```

### AI ഏജന്റ് കമാൻഡുകൾ
```bash
# ഒരു മാനിഫെസ്റ്റിൽ നിന്നുള്ള ഒരു ഏജന്റ് പ്രോജക്ട് ആരംഭിക്കുക
azd ai agent init -m <manifest-path-or-uri>

# ഒരു പ്രത്യേക ഫൗണ്ടറി പ്രോജക്ടിനെ ലക്ഷ്യമിടുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ഏജന്റ് സോഴ്‌സ് ഡയറക്ടറി നിശ്ചയിക്കുക
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ഒരു ഹോസ്റ്റിംഗ് ലക്ഷ്യം തിരഞ്ഞെടുക്കുക
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP സർവർ (ആൽഫ)
```bash
# നിങ്ങളുടെ പ്രൊജക്റ്റിനുള്ള MCP സേർവർ ആരംഭിക്കുക
azd mcp start

# MCP പ്രവർത്തനങ്ങൾക്കുള്ള ടൂൾ সম্মതി നിയന്ത്രിക്കുക
azd copilot consent list
```

### ഇൻഫ്രാസ്ട്രക്ചർ ജനറേഷൻ
```bash
# നിങ്ങളുടെ പ്രോജക്റ്റ് നിർവചനത്തിൽനിന്ന് IaC ഫയലുകൾ സൃഷ്‌ടിക്കുക
azd infra generate

# azure.yaml-യിൽനിന്ന് ഇൻഫ്രാസ്ട്രക്ചർ സിന്തസൈസ് ചെയ്യുക
azd infra synth
```

---

## 🎯 വേഗതയുള്ള വർക്ക്‌ഫ്ലോകൾ

### ഡെവലപ്മെന്റ് വർക്ക്‌ഫ്ലോ
```bash
# പുതിയ പ്രോജക്ട് തുടങ്ങുക
azd init --template todo-nodejs-mongo
cd my-project

# വികസനത്തിലേക്ക് ഡിപ്ലോയ്മെന്റ് നടത്തുക
azd env new dev
azd up

# മാറ്റങ്ങൾ ചെയ്യുകയും വീണ്ടും ഡിപ്ലോയ് ചെയ്‌യുകയും ചെയ്യുക
azd deploy

# നിരീക്ഷണ ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --live
```

### മൾട്ടി-പരിസ്ഥിതി വർക്ക്‌ഫ്ലോ
```bash
# പരിസ്ഥിതികൾ സജ്ജമാക്കുക
azd env new dev
azd env new staging  
azd env new production

# ഡെവലപ്മെന്റിലേക്ക് വിന്യസിക്കുക
azd env select dev
azd up

# പരിശോധന നടത്തി സ്റ്റേജിംഗിലേക്ക് ഉയർത്തുക
azd env select staging
azd up

# ഉല്പാദനത്തിലേക്ക് വിന്യസിക്കുക
azd env select production
azd up
```

### പ്രശ്നപരിഹാര വർക്ക്‌ഫ്ലോ
```bash
# ഡീബഗ് മോഡ് സജീവമാക്കുക
export AZD_DEBUG=true

# വിന്യാസ സ്ഥിതിയെ പരിശോധിക്കുക
azd show

# ക്രമീകരണം സാധൂകരിക്കുക
azd config show

# ലോഗുകൾക്കായുള്ള മേൽനോട്ട ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --logs

# വിഭവങ്ങളുടെ നില പരിശോധിക്കുക
azd show --output json
```

## 🔍 ഡീബഗിംഗ് കമാൻഡുകൾ

### ഡീബഗ് വിവരങ്ങൾ
```bash
# ഡിബഗ് ഔട്ട്പുട്ട് സജ്ജമാക്കുക
export AZD_DEBUG=true
azd <command> --debug

# ശുഭ്രമായ ഔട്ട്പുട്ടിന് ടെലിമെട്രി അപ്രാപ്തമാക്കുക
export AZD_DISABLE_TELEMETRY=true

# നിലവിലെ കോൺഫിഗറേഷൻ പരിശോധിക്കുക
azd config show

# യഥാര്‍ഥീകരണ സ്ഥിതിവിവരം പരിശോധിക്കുക
az account show
```

### ടെംപ്ലേറ്റ് ഡീബഗിംഗ്
```bash
# വിശദാംശങ്ങളോടെ ലഭ്യമായ ടেম്പ്‌ളേറ്റുകൾ പട്ടികവരിക്കുക
azd template list --output json

# ടെമ്പ്‌ളേറ്റ് വിവരങ്ങൾ കാണിക്കുക
azd template show <template-name>

# ഇൻഷിയലൈസ്‌ ചെയ്യുന്നതിന് മുമ്പ് ടെമ്പ്‌ളേറ്റ് സവിശേഷതകൾ പരിശോധിക്കുക
azd template validate <template-name>
```

## 📁 ഫയൽ, ഡയറക്ടറി കമാൻഡുകൾ

### പ്രോജക്ട് ഘടന
```bash
# നിലവിലെ ഡയറക്ടറി ഘടന കാണിക്കുക
tree /f  # വിൻഡോസ്
find . -type f  # ലിനക്സ്/macOS

# azd പ്രോജക്റ്റ് റൂട്ട്‌ിലേക്ക് നാവിഗേറ്റ് ചെയ്യുക
cd $(azd root)

# azd കോൺഫിഗറേഷൻ ഡയറക്ടറി കാണിക്കുക
echo $AZD_CONFIG_DIR  # സാധാരണയായി ~/.azd
```

## 🎨 ഔട്ട്പുട്ട് ഫോർമാറ്റിംഗ്

### JSON ഔട്ട്പുട്ട്
```bash
# സ്ക്രിപ്റ്റിങ്ങിനായി JSON ഔട്ട്പുട്ട് നേടുക
azd show --output json
azd env list --output json
azd config show --output json

# jq ഉപയോഗിച്ച് പാഴ്സ് ചെയ്യുക
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ടേബിൾ ഔട്ട്പുട്ട്
```bash
# പട്ടികയായി ഫോർമാറ്റ് ചെയ്യുക
azd env list --output table

# വിന്യാസം ചെയ്ത സേവനങ്ങൾ കാണുക
azd show --output json | jq '.services | keys'
```

## 🔧 പൊതുവായ കമാൻഡ് സംയോജനം

### ഹെൽത്ത് ചെക്ക് സ്ക്രിപ്റ്റ്
```bash
#!/bin/bash
# വേഗത്തിലുള്ള ആരോഗ്യം പരിശോധിക്കൽ
azd show
azd env get-values
azd monitor --logs
```

### വിനയിടൽ വിലയിരുത്തൽ
```bash
#!/bin/bash
# പ്രീ-ഡിപ്ലോയ്മെന്റ് പരിശോദ്ധന
azd show
azd provision --preview  # ഡിപ്ലോയ്മെന്റ് നടത്തുന്നതിന് മുമ്പ് മാറ്റങ്ങൾ പരിഗണിക്കുക
az account show
```

### പരിസ്ഥിതി താരതമ്യം
```bash
#!/bin/bash
# പരിസ്ഥിതികൾ сопെടുചെയ്യുക
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### റിസോഴ്‌സ് ശുചീകരണ സ്ക്രിപ്റ്റ്
```bash
#!/bin/bash
# പഴയ അന്തരീക്ഷങ്ങൾ ശുചിയാക്കുക
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 പരിസ്ഥിതി ചാരങ്ങൾ

### പൊതുവായ പരിസ്ഥിതി ചാരങ്ങൾ
```bash
# ആഷർ കോൺഫിഗറേഷൻ
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

### വേഗം പരിഹാരങ്ങൾ
```bash
# ഓതന്റിക്കേഷൻ മടങ്ങിസ്ഥാപിക്കുക
az account clear
az login

# പരിസ്ഥിതി ബലപ്രയോജനം പുതുക്കുക
azd env refresh

# ഏവം സേവനങ്ങളും പുനഃസ്ഥാപിക്കുക
azd deploy

# വിന്യാസ സ്ഥിതി പരിശോധിക്കുക
azd show --output json
```

### പുനരുദ്ധാരണ കമാൻഡുകൾ
```bash
# പരാജയപ്പെട്ട വിന്യാസത്തിൽ നിന്നും മടങ്ങി വരുക - ശുദ്ധീകരിച്ച് വീണ്ടും വിന്യസിക്കുക
azd down --force --purge
azd up

# അടിസ്ഥാന സജ്ജീകരണം മാത്രം പുനർനിർമ്മിക്കുക
azd provision

# അപേക്ഷ മാത്രം വീണ്ടും വിന്യസിക്കുക
azd deploy
```

## 💡 പ്രൊ ടിപ്‌സ്

### വേഗത്തിലുള്ള വർക്ക്‌ഫ്ലോവിന് ആലിയാസുകൾ
```bash
# നിങ്ങളുടെ .bashrc അല്ലെങ്കിൽ .zshrc ലേക്ക് ചേർക്കുക
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ഫังก്ഷൻ ഷോർട്കട്ടുകൾ
```bash
# വേഗത്തിൽ പരിസ്ഥിതി മാറൽ
azd-env() {
    azd env select $1 && azd show
}

# നിരീക്ഷണത്തോടെ വേഗത്തിലുള്ള വിന്യാസം
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# പരിസ്ഥിതി നില
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 സഹായവും ഡോക്യുമെന്റേഷനും

### സഹായം നേടൽ
```bash
# പൊതുവായ സഹായം
azd --help
azd help

# കമാൻഡ്-നിർദ്ദേശിത സഹായം
azd up --help
azd env --help
azd config --help

# പതിപ്പ് மற்றும் നിർമ്മാണ വിവരങ്ങൾ കാണിക്കുക
azd version
azd version --output json
```

### ഡോക്യുമെന്റേഷൻ ലിങ്കുകൾ
```bash
# ബ്രൗസറിൽ ഡോക്യുമെന്റേഷൻ തുറക്കുക
azd docs

# മാറ്റിവെച്ചു ഡോക്യുമെന്റേഷൻ കാണിക്കുക
azd template show <template-name> --docs
```

---

**ടിപ്പ്**: ഈ ചീറ്റ് ഷീറ്റ് ബുക്ക്മാർക്ക് ചെയ്തിട്ട് `Ctrl+F` ഉപയോഗിച്ച് നിങ്ങൾക്കാവശ്യമായ കമാൻഡുകൾ വേഗത്തിൽ കണ്ടെത്തൂ!

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **അടുത്ത പാഠം**: [Glossary](glossary.md)

---

> **💡 നിങ്ങളുടെ എഡിറ്ററിൽ ആസ്യൂർ കമാൻഡ് സഹായം വേണോ?** `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിച്ച് [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ഇൻസ്റ്റാൾ ചെയ്യൂ — AI, Foundry, വിനയിടൽ, ഡയഗ്നോസ്റ്റിക്‌സ് എന്നിവയ്‌ക്കായി 37 സ്കിൽസ്.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസൂയം**:  
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം കൃത്യതയ്ക്കായി പരിശ്രമിച്ചെങ്കിലും, സ്വയംক্রിയപരിഭാഷകൾ പിശകുകൾ അല്ലെങ്കിൽ അശുദ്ധികൾ ഉള്ളതായി ഉണ്ടായിരിക്കാം. ഓരിജിനൽ രേഖ അതിന്റെ മാതൃഭാഷയിൽ മാത്രമാണ് അധികാരപരമായ ഉറവിടം എന്നു പരിഗണിക്കേണ്ടത്. നിർണായക വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷയുടെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും தவറുകളോ അർത്ഥമാറ്റങ്ങളോ സംബന്ധിച്ച് ഞങ്ങൾ ബാധ്യസ്ഥരല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->