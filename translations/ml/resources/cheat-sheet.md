# കമാൻഡുകൾ ചീറ്റ് ഷീറ്റ് - അടിസ്ഥാന AZD കമാൻഡുകൾ

**എല്ലാ അധ്യായങ്ങൾക്കും വേഗത്തിലുള്ള റഫറൻസ്**
- **📚 കോഴ്സ് ഹോം**: [AZD തുടക്കക്കാർക്കായി](../README.md)
- **📖 ക്വിക്ക് സ്റ്റാർട്ട്**: [അധ്യായം 1: അടിസ്ഥാനവും ക്വിക് സ്റ്റാർട്ടും](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI കമാൻഡുകൾ**: [അധ്യായം 2: AI-ഫസ്റ്റ് ഡവലപ്പ്മെന്റ്](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 അഡ്വാൻസ്ഡ്**: [അധ്യായം 4: ഇൻഫ്രാസ്ട്രക്ചർ അസ്കോഡ്](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## പരിചയം

ഈ സമഗ്രമായ ചീറ്റ് ഷീറ്റ് ഫലപ്രദമായ ഉദാഹരണങ്ങളോടുകൂടിയ വിവിധ വിഭാഗങ്ങളായി ക്രമീകരിച്ചിട്ടുള്ള ഏറ്റവും സാധാരണ ഉപയോഗിക്കുന്ന Azure ഡവലപ്പർ CLI കമാൻഡുകൾ വേഗത്തിൽ റഫറൻസ് ചെയ്യാനും സഹായിക്കുന്നു. azd പ്രോജക്ടുകളോടുള്ള വികസന കാലത്ത്, പിൻകാര്യം കണ്ടെത്തുമ്പോൾ, ദിവസേന പ്രവർത്തനങ്ങൾ നടത്തുമ്പോൾ ഇത് വളരെ ഉപകാരപ്രദമാണ്.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ചീറ്റ് ഷീറ്റ് ഉപയോഗിച്ച്, നിങ്ങൾക്ക്:
- അവശ്യ Azure ഡവലപ്പർ CLI കമാൻഡുകളും സിന്ടാക്സും തത്സമയ പ്രവേശനമുണ്ടാകുക
- പ്രവർത്തന വിഭാഗങ്ങളുടെയും ഉപയോഗ കേസുകളുടെയും അടിസ്ഥാനത്തിൽ കമാൻഡുകൾ ക്രമീകരിച്ചുള്ള ധാരണ നേടുക
- സാധാരണ ഡവലപ്പ്മെന്റ്, ഡിപ്ലോയ്‌മെന്റ് സാഹചര്യം എന്നിവയ്ക്ക് പ്രായോഗിക ഉദാഹരണങ്ങൾ കാണുക
- പ്രശ്നപരിഹാര കമാൻഡുകൾ ഉപയോഗിച്ച് വേഗത്തിലുള്ള പ്രശ്നപരിഹാരത്തിലേക്ക് പ്രവേശിക്കുക
- ഉയർന്ന വ്യവസ്ഥാപനവും അവകാശവാദവും എളുപ്പത്തിൽ കണ്ടെത്തുക
- പരിസ്ഥിതി മാനേജ്മെന്റും മൾട്ടി-പരിസ്ഥിതി വർക്ക്‌ഫ്ലോ കമാൻഡുകളും കണ്ടെത്തുക

## പഠന ഫലങ്ങൾ

പതിനൊന്നാം വീതി സ്വകാര്യ ഡോക്യുമെന്റ് വീക്ഷിക്കുമ്പോൾ നിങ്ങൾക്ക് സാധിക്കും:
- പൂർണ്ണ ഡോക്യൂമെന്റേഷൻ പരിശോധിക്കാതെ azd കമാൻഡുകൾ ആത്മവിശ്വാസത്തോടെ ഉപയോഗിക്കുക
- അനുയോജ്യമായ ഡയഗ്നോളിസ്റ്റിക് കമാൻഡുകൾ ഉപയോഗിച്ച് സാധാരണ പ്രശ്നങ്ങൾ വേഗത്തിൽ പരിഹരിക്കുക
- നിരവധി പരിസ്ഥിതികളും ഡിപ്ലോയ്‌മെന്റ് സാഹചര്യങ്ങളും ഫലപ്രദമായി നിയന്ത്രിക്കുക
- ആവശ്യമുള്ളപ്പോൾ azd ന്റെ ഉയർന്ന സവിശേഷതകളും കോൺഫിഗറേഷൻ ഓപ്ഷനുകളും ഉപയോഗിക്കുക
- സിസ്റ്റമാറ്റിക് കമാൻഡ് സീക്വൻസുകൾ ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- azd ഷോർട്ട്‌കട്ടുകളും ഓപ്ഷനുകളും ഫലപ്രദമായി ഉപയോഗിച്ച് വർക്ക്‌ഫ്ലോകൾ തൽസമയമായി മെച്ചപ്പെടുത്തുക

## തുടക്കം കുറക്കുന്ന കമാൻഡുകൾ

### ഓതന്റിക്കേഷൻ
```bash
# AZD വഴി Azure ലോഗിൻ ചെയ്യുക
azd auth login

# Azure CLI ലോഗിൻ ചെയ്യുക (AZD ഇതിന് താഴെയായി ഉപയോഗിക്കുന്നു)
az login

# നിലവിലെ അക്കൗണ്ട് പരിശോധിക്കുക
az account show

# ഡീഫോൾട്ട് സബ്‌സ്‌ക്രിപ്റ്റ് സജ്ജമാക്കുക
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ൽ നിന്നു ലോ​​ഗ്ഔട്ട് ചെയ്യുക
azd auth logout

# Azure CLI യിൽ നിന്നു ലോ​​ഗ്ഔട്ട് ചെയ്യുക
az logout
```

### പ്രോജക്ട് ആരംഭിക്കൽ
```bash
# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
azd template list

# ടെംപ്ലേറ്റിൽ നിന്ന് തുടങ്ങുക
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# നിലവിലെ ഡയറക്ടറിയിൽ തുടങ്ങുക
azd init .

# ഇഷ്ടാനുസൃത നാമത്തോടെ തുടങ്ങുക
azd init --template todo-nodejs-mongo my-awesome-app
```

## കോർ ഡിപ്ലോയ്മെന്റ് കമാൻഡുകൾ

### സമ്പೂರ್ಣ ഡിപ്ലോയ്മെന്റ് വർക്ക്‌ഫ്ലോ
```bash
# എല്ലാം വിന്യസിക്കുക (പ്രൊവിഷൻ + വിന്യാസം)
azd up

# സ്ഥിരീകരണ പ്രാംപ്റ്റുകൾ പ്രവർത്തനരഹിതമാക്കി വിന്യസിക്കുക
azd up --confirm-with-no-prompt

# ഒരു പ്രത്യേക പരിതസ്ഥിതിയിലേക്ക് വിന്യസിക്കുക
azd up --environment production

# ഇഷ്ടാനുസൃത പാരാമീറ്ററുകളോടെ വിന്യസിക്കുക
azd up --parameter location=westus2
```

### ഇൻഫ്രാസ്ട്രക്ചർ മാത്രമേ
```bash
# ആസ്യൂർ റിസോഴ്‌സുകൾ നൽകുക
azd provision

# 🧪 ഉപയോഗശീല ഭാവി മാറ്റങ്ങൾ കാണിക്കുക
azd provision --preview
# സൃഷ്ടിക്കപ്പെടുകയോ/മാറ്റം വരുത്തുകയോ/നശിപ്പിക്കുകയോ ചെയ്യുന്ന റിസോഴ്‌സുകൾ കാഴ്ചയിലാക്കുന്ന ഡ്രൈ-റൺ കാഴ്ച
# 'terraform plan' അല്ലെങ്കിൽ 'bicep what-if' എന്നവയെപോലെ - സുരക്ഷിതമായി പ്രവർത്തിക്കാൻ, മാറ്റങ്ങൾ പ്രയോഗിക്കപ്പെടുന്നില്ല
```

### ആപ്ലിക്കേഷൻ മാത്രമേ
```bash
# അപ്ലിക്കേഷൻ കോഡ് വിന്യസിക്കുക
azd deploy

# പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy --all
```

### ബിൽഡ് ചെയ്യുക, പാക്കേജ് ചെയ്യുക
```bash
# ആപ്ളിക്കേഷൻ ആശ്രിതത്വങ്ങൾ പുനഃസ്ഥാപിക്കുക (ഡൗൺലോഡ് ചെയ്യുക)
azd restore

# ഒരു പ്രത്യേക സേവനം പുനഃസ്ഥാപിക്കുക
azd restore --service api

# വിന്യാസം ചെയ്യാതെ ഡിപ്ലോയ് ചെയ്യാനാകുന്ന ആർട്ടിഫാക്ട് നിർമ്മിക്കുക
azd package

# പ്രത്യേക സേവനം നിർമിക്കുക
azd package --service api
```

> **`azd restore`** നിങ്ങളുടെ ആപ്പിന്റെ ആശ്രിതങ്ങൾ (npm, pip, NuGet, Maven, തുടങ്ങിയവ) ഡൗൺലോഡ് ചെയ്യുന്നു. ഇത് സ്വയം `azd package` ഒപ്പം `azd deploy` കമാൻഡുകൾക്കിടെ ഓടുന്നതാണ്, അതിനാൽ നിങ്ങൾക്ക് നേരിട്ട് വിളിക്കേണ്ടതില്ല—ആശ്രിതങ്ങൾ മുൻകൂർ ഡൗൺലോഡിനായി ഇത് കൈമാറാം (ഉദാഹരണത്തിന്, CI ക缓存 ഉണരാനും ഓൺലൈൻ അല്ലാതെ പ്രവർത്തിക്കാനും).

> **`azd package`** ഡിപ്ലോയിബിള്‍ ആർട്ടിഫാക്റ (ഒരു കണ്ടെയ്‌നർ ഇമേജ് അല്ലെങ്കിൽ സിപ്പ്) **പുഷ് ചെയ്യാതെ** Azure-ലേക്ക് നിർമിക്കുന്നു. ബിൽഡ് വിജയിച്ചുവെന്ന് പരിശോധിക്കാനും ഔട്ട്പുട്ട് അവലോകനം ചെയ്യാനും വേറെ പ്രോസസ്സ് പിന്നീട് ഡിപ്ലോയ്മെന്റ് നടത്താനായി ആർട്ടിഫാക്റ്റ് സൃഷ്ടിക്കാനിനി ഇതിനെ സ്വതന്ത്രമായി ഉപയോഗിക്കാം. `azd deploy` പാക്കേജിംഗ് സ്വയം ചെയ്യുന്നതുകൊണ്ട്, ഡിപ്ലോയ്മെന്റ് ചെയ്യില്ലാതെ ആർട്ടിഫാക്റ്റ് വേണമെങ്കിൽ മാത്രമേ `azd package` ആവശ്യമുള്ളു.


## 🌍 പരിസ്ഥിതി മാനേജ്മെന്റ്

### പരിസ്ഥിതി ഓപറേഷനുകൾ
```bash
# എല്ലാ പരിസ്ഥിതികളും ലിസ്റ്റ് ചെയ്യുക
azd env list

# പുതിയ പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new development
azd env new staging --location westus2

# പരിസ്ഥിതിയെ തിരഞ്ഞെടുക്കുക
azd env select production

# ലഭ്യമായ പരിസ്ഥിതികൾ പ്രദർശിപ്പിക്കുക
azd env list

# പരിസ്ഥിതി സ്ഥിതി പുതുക്കുക
azd env refresh
```

### പരിസ്ഥിതി വ്യത്യാസങ്ങൾ
```bash
# പരിസ്ഥിതി 변ിച്ചേര അജസ്റ്റ് ചെയ്യുക
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# പരിസ്ഥിതി변ചു 얻다
azd env get API_KEY

# 모든 പരിസ്ഥിതി 변치് 목록 കാണിക്കുക
azd env get-values

# പരിസ്ഥിതി변치് ഇല്ലാതാക്കുക
azd env unset DEBUG
```

## ⚙️ കോൺഫിഗറേഷൻ കമാൻഡുകൾ

### ആഗോള കോൺഫിഗറേഷൻ
```bash
# എല്ലാ ക്രമീകരണങ്ങളും ലിസ്റ്റുചെയ്യുക
azd config show

# ഗ്ലോബൽ ഡീഫോൾട്ടുകൾ സജ്ജമാക്കുക
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ക്രമീകരണം നീക്കംചെയ്യുക
azd config unset defaults.location

# എല്ലാ ക്രമീകരണങ്ങളും റീസെറ്റ് ചെയ്യുക
azd config reset
```

### പ്രോജക്ട് കോൺഫിഗറേഷൻ
```bash
# ആസൂർ.yaml പരിശോധന ചെയ്യുക
azd config validate

# പ്രോജക്ട് വിവരം കാണിക്കുക
azd show

# സർവീസ് എൻഡ്പോയിന്റുകൾ നേടുക
azd show --output json
```

## 📊 നിരീക്ഷണവും ഡയഗ്നോസ്റ്റിക്സും

### നിരീക്ഷണ ഡാഷ്ബോർഡ്
```bash
# Azure പോർട്ടൽ നിരീക്ഷണ ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ലൈവ് മെട്രിക്ക്‌സ് തുറക്കുക
azd monitor --live

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ലോഗ്സ് ബ്ലേഡ് തുറക്കുക
azd monitor --logs

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് അവലോകനം തുറക്കുക
azd monitor --overview
```

### കണ്ടെയ്‌നർ ലോഗുകൾ കാണുക
```bash
# Azure CLI (Container Apps-ക്കായി) വഴി ലോഗുകൾ കാണുക
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ലോഗുകൾ റിയൽ-ടൈമിൽ കാണുക
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal-ൽ നിന്ന് ലോഗുകൾ കാണുക
azd monitor --logs
```

### ലോഗ് ആനാലിറ്റിക്സ് ക്വെറികൾ
```bash
# ആസ്യൂർ പോർട്ടൽ വഴി ആക്‌സസ് ലോഗ് അനലിറ്റിക്സ്
azd monitor --logs

# ആസ്യൂർ CLI ഉപയോഗിച്ച് ലോഗുകൾ ക്വറി ചെയ്യുക
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ മെയിൻറ്റനൻസ് കമാൻഡുകൾ

### ക്ലീൻഅപ്പ്
```bash
# എലAzure സ്രോതസ്സുകളും നീക്കം ചെയ്യുക
azd down

# സ്ഥിരീകരണം കൂടാതെ ബലമായി മായ്ക്കുക
azd down --force

# സോഫ്റ്റ്-ഡിലീറ്റ് ചെയ്ത സ്രോതസ്സുകൾ പർജ് ചെയ്യുക
azd down --purge

# സമ്പൂർണമായും ശുചീകരണം
azd down --force --purge
```

### അപ്ഡേറ്റുകൾ
```bash
# azd അപ്‌ഡേറ്റുകൾ പരിശോധിക്കുക
azd version

# നിലവിലുള്ള പതിപ്പ് നേടുക
azd version

# നിലവിലെ കോൺഫിഗറേഷൻ കാണുക
azd config show
```

## 🔧 അഡ്വാൻസ്ഡ് കമാൻഡുകൾ

### പൈപ്പ്‌ലൈൻ, CI/CD
```bash
# GitHub പ്രവർത്തനങ്ങൾ വിന്യസിക്കുക
azd pipeline config

# ആസ്യൂർ ഡെവ്ഓപ്സിനെ വിന്യസിക്കുക
azd pipeline config --provider azdo

# পাইപ്പ്‌ലൈൻ കോൺഫിഗറേഷൻ കാണിക്കുക
azd pipeline show
```

### ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്മെന്റ്
```bash
# ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ സൃഷ്ടിക്കുന്നു
azd infra generate

# 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ & പ്ലാനിങ്
azd provision --preview
# വിന്യസിക്കാതെ ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് അനുകരിക്കുന്നു
# Bicep/Terraform ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്ത് പ്രദർശിപ്പിക്കുന്നു:
# - ചേർക്കേണ്ട റിസോഴ്‌സുകൾ (പച്ച +)
# - മാറ്റേണ്ട റിസോഴ്‌സുകൾ (മഞ്ഞ ~)
# - ഇല്ലാതാക്കേണ്ട റിസോഴ്‌സുകൾ (ചുവപ്പ് -)
# സുരക്ഷിതമായി പ്രവർത്തിപ്പിക്കാം - അസ്യൂർ പരിസ്ഥിതിയിൽ യാതൊരു യഥാർത്ഥ മാറ്റവും ചെയ്യാത്തത്

# azure.yaml ലിൽ നിന്നും ഇൻഫ്രാസ്ട്രക്ചർ സംശ്ലേഷണം ചെയ്യുന്നു
azd infra synth
```

### പ്രോജക്ട് വിവരം
```bash
# പ്രോജക്ട് നിലയും എൻഡ്‌പോയിന്റുകളും കാണിക്കുക
azd show

# വിശദമായ പ്രോജക്ട് വിവരങ്ങൾ JSON ആയി കാണിക്കുക
azd show --output json

# സേവന എൻഡ്‌പോയിന്റുകൾ നേടുക
azd show --output json | jq '.services'
```

## 🤖 AI & എക്സ്റ്റെൻഷൻസ് കമാൻഡുകൾ

### AZD എക്സ്റ്റെൻഷൻസ്
```bash
# ലഭ്യമായ എല്ലാ\Extensionകളേയും പട്ടികപ്പെടുത്തുക (AI ഉൾപ്പെടെ)
azd extension list

# Foundry ഏജന്റ്സ്\Extension ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.agents

# ഏജന്റ് സ്കിൽസ്\Extension ഇൻസ്റ്റാൾ ചെയ്യുക (പ്രിവ്യൂ)
azd extension install azure.ai.skills

# Foundry കണക്ഷൻസ്\Extension ഇൻസ്റ്റാൾ ചെയ്യുക (പ്രിവ്യൂ)
azd extension install azure.ai.connections

# ഫൈൻ-ട്യൂണിംഗ്\Extension ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.finetune

# കസ്റ്റം മോഡലുകൾ\Extension ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.models

# ഇൻസ്റ്റാൾ ചെയ്ത എല്ലാവിധ\Extensionകളുടെയും അപ്ഗ്രേഡ് ചെയ്യുക
azd extension upgrade --all
```

### AI ഏജന്റ് കമാൻഡുകൾ
```bash
# ഒരു മാനിഫസ്റ്റ് മുതൽ ഒരു ഏജന്റ് പ്രോജക്ട് ആരംഭിക്കുക
azd ai agent init -m <manifest-path-or-uri>

# ഒരു নির്ദിഷ്ട Foundry പ്രോജക്ട് ലക്ഷ്യമിടുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ഏജന്റിന്റെ സ്രോതസ് ഡയറക്ടറി വ്യക്തമാക്കുക
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ഒരു ഹോസ്റ്റിംഗ് ടാർഗറ്റ് തിരഞ്ഞെടുക്കുക
azd ai agent init -m agent-manifest.yaml --host containerapp

# വിന്യസിച്ചഏജന്റ് പരിശോധന നടത്തുക (ലേറ്റൻസി + സമയത്തെ ആദ്യ ബൈറ്റ് ടൈം പ്രിന്റ് ചെയ്യുന്നു)
azd ai agent invoke

# ലൈവ് എന്റ്പോയിന്റിന്റെ കോൺഫിഗറേഷൻ കാണിക്കുക
azd ai agent endpoint show

# ഒരു മൂല്യനിർണയ ഡാറ്റാസെറ്റ് സൃഷ്ടിച്ച്, തുടർന്ന് ഏജന്റ് മെച്ചപ്പെടുത്തുക
azd ai agent eval generate
azd ai agent optimize

# കോഡ് അടിസ്ഥാനമാക്കിയ ഹോസ്റ്റുചെയ്യപ്പെട്ട ഏജന്റിന്റെ വിന്യസിച്ച സ്രോതസ് ഡൗൺലോഡ് ചെയ്യുക
azd ai agent code download

# ഒരു ഹോസ്റ്റുചെയ്യപ്പെട്ട ഏജന്റും അതിന്റെ എല്ലാ പതിപ്പുകളും നീക്കം ചെയ്യുക (--force സജീവ സെഷനുകൾ അവസാനിപ്പിക്കുന്നു)
azd ai agent delete --force
```

### MCP സർവർ (ആൽഫ)
```bash
# നിങ്ങളുടെ പ്രോജക്റ്റിന് MCP സർവർ ആരംഭിക്കുക
azd mcp start

# MCP പ്രവർത്തനങ്ങൾക്കുള്ള ടൂൾ സമ്മതം നിയന്ത്രിക്കുക
azd copilot consent list
```

### ഇൻഫ്രാസ്ട്രക്ചർ ജനറേഷൻ
```bash
# നിങ്ങളുടെ പ്രോജക്റ്റ് നിർവചനത്തിൽ നിന്ന് IaC ഫയലുകൾ സൃഷ്ടിക്കുക
azd infra generate

# azure.yaml ൽ നിന്നുള്ള ഇൻഫ്രാസ്ട്രക്ചർ സംശ്ലേഷിക്കുക
azd infra synth
```

---

## 🎯 വേഗത്തിലുള്ള വർക്ക്‌ഫ്ലോകൾ

### ഡവലപ്പ്മെന്റ് വർക്ക്‌ഫ്ലോ
```bash
# പുതിയ പ്രോജക്ട് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo
cd my-project

# വികസനത്തിന് വിന്യസിക്കുക
azd env new dev
azd up

# മാറ്റങ്ങൾ ചെയ്യൂ, വീണ്ടും വിന്യസിക്കുക
azd deploy

# നിരീക്ഷണ ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --live
```

### മൾട്ടി-പരിസ്ഥിതി വർക്ക്‌ഫ്ലോ
```bash
# പരിസ്ഥിതികൾ സജ്ജീകരിക്കുക
azd env new dev
azd env new staging  
azd env new production

# ഡെവലപ്‌മെന്റിലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
azd env select dev
azd up

# പരീക്ഷിച്ച് സ്റ്റേജിംഗിലേക്ക് പ്രോത്സാഹിപ്പിക്കുക
azd env select staging
azd up

# പ്രൊഡക്ഷനിലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
azd env select production
azd up
```

### പ്രശ്നപരിഹാര വർക്ക്‌ഫ്ലോ
```bash
# ഡീബഗ് മോഡ് സജ്ജമാക്കുക
export AZD_DEBUG=true

# വിന്യാസ നില പരിശോധിക്കുക
azd show

# കോൺഫിഗറേഷൻ സാധുത പരിശോധിക്കുക
azd config show

# ലോഗുകൾക്കായുള്ള മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --logs

# വിഭവങ്ങളുടെ സ്ഥിതി പരിശോധിക്കുക
azd show --output json
```

## 🔍 ഡീബഗിങ് കമാൻഡുകൾ

### ഡീബഗ് വിവരം
```bash
# ഡിബഗ്ഔട്ട്പുട്ട് സജീവമാക്കുക
export AZD_DEBUG=true
azd <command> --debug

# കൂടുതൽ ശുദ്ധമായ ഔട്ട്പുട്ടിനായി ടെലിമെട്രി അപ്രാപ്തമാക്കുക
export AZD_DISABLE_TELEMETRY=true

# നിലവിലുള്ള ക്രമ ക്രമീകരണം പരിശോധിക്കുക
azd config show

# പ്രാമാണീകരണ നില പരിശോധിക്കുക
az account show
```

### ടെംപ്ലേറ്റ് ഡീബഗിങ്
```bash
# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ വിശദാംശങ്ങളോടെ ലിസ്റ്റ് ചെയ്യുക
azd template list --output json

# ടെംപ്ലേറ്റ് വിവരങ്ങൾ പ്രദർശിപ്പിക്കുക
azd template show <template-name>

# തുടങ്ങിയതിന് മുൻപായി ടെംപ്ലേറ്റ് സാധുത പരിശോധിക്കുക
azd template validate <template-name>
```

## 📁 ഫയൽ, ഡയറക്ടറി കമാൻഡുകൾ

### പ്രോജക്ട് ഘടന
```bash
# നിലവിലെ ഡയറക്ടറിയുടെ ഘടനപ്രദർശിപ്പിക്കുക
tree /f  # വിൻഡോസ്
find . -type f  # ലിനക്സും/macOS

# azd പ്രോജക്ട് മൂലത്തിലേക്ക് നാവിഗേറ്റ് ചെയ്യുക
cd $(azd root)

# azd കോൺഫിഗറേഷൻ ഡയറക്ടറി കാണിക്കുക
echo $AZD_CONFIG_DIR  # സാധാരണയായി ~/.azd
```

## 🎨 ഔട്ട്പുട്ട് ഫോർമാറ്റിങ്

### JSON ഔട്ട്പുട്ട്
```bash
# സ്‌ക്രിപ്റ്റിംഗിന് JSON ഔട്ട്‌പുട്ട് ലഭിക്കുക
azd show --output json
azd env list --output json
azd config show --output json

# jq ഉപയോഗിച്ച് പാഴ്‌സ് ചെയ്യുക
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ടേബിൾ ഔട്ട്പുട്ട്
```bash
# പട്ടികയായി ഫോര്മാറ്റ് ചെയ്യുക
azd env list --output table

# വിന്യസ്തമാക്കിയ സേവനങ്ങൾ കാണുക
azd show --output json | jq '.services | keys'
```

## 🔧 സാധാരണ കമാൻഡ് കോംബിനേഷനുകൾ

### ഹെൽത്ത് ചെക്ക് സ്‌ക്രിപ്റ്റ്
```bash
#!/bin/bash
# ദ്രുത ആരോഗ്യ പരിശോധന
azd show
azd env get-values
azd monitor --logs
```

### ഡിപ്ലോയ്‌മെന്റ് వാലിഡേഷൻ
```bash
#!/bin/bash
# മുൻ-പ്രവേശന പരിശോധന
azd show
azd provision --preview  # വിന്യസിക്കുന്നതിന് മുൻപ് മാറ്റങ്ങൾ മുൻനിർത്തി നോക്കുക
az account show
```

### പരിസ്ഥിതി താരതമ്യം
```bash
#!/bin/bash
# പരിസ്ഥിതികൾ തുല്യപ്പെടുത്തുക
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### റെസോഴ്‌സ് ക്ലീൻഅപ്പ് സ്‌ക്രിപ്റ്റ്
```bash
#!/bin/bash
# പഴയ പരിതസ്ഥിതികൾ ശുചീകരിക്കുക
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 പരിസ്ഥിതി വ്യത്യാസങ്ങൾ

### സാധാരണ പരിസ്ഥിതി വ്യത്യാസങ്ങൾ
```bash
# അസ്യൂർ ക്രമീകരണം
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD ക്രമീകരണം
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# അപ്ലിക്കേഷൻ ക്രമീകരണം
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 അടിയന്തര കമാൻഡുകൾ

### വേഗത്തിലുള്ള പരിഹാരങ്ങൾ
```bash
# ഓതന്റിക്കേഷൻ റീസെറ്റ് ചെയ്യുക
az account clear
az login

# പരിസ്ഥിതി ഫോഴ്സ് റിഫ്രെഷ് ചെയ്യുക
azd env refresh

# എല്ലാ സേവനങ്ങളും വീണ്ടും വിന്യസിക്കുക
azd deploy

# വിന്യസന നില പരിശോധിക്കുക
azd show --output json
```

### പുനരുദ്ധരണ കമാൻഡുകൾ
```bash
# പരാജയപ്പെട്ട വിന്യാസത്തിൽ നിന്നും പുനരുദ്ധരിക്കുക - ശുദ്ധീകരിച്ച് മടങ്ങി വിന്യസിക്കുക
azd down --force --purge
azd up

# നിർമാണ ഭേദഗതി മാത്രം മടക്കുക
azd provision

# അപ്ലിക്കേഷൻ മാത്രം വീണ്ടും വിന്യസിക്കുക
azd deploy
```

## 💡 പ്രൊ ടിപ്പുകൾ

### വേഗമുള്ള വർക്ക്‌ഫ്ലോയ്ക്ക് അലിയാസുകൾ
```bash
# നിങ്ങളുടെ .bashrc അല്ലെങ്കിൽ .zshrc ൽ ചേർക്കുക
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ഫങ്‌ഷൻ ഷോർട്ട്‌കട്ടുകൾ
```bash
# വേഗത്തിലുള്ള പരിസ്ഥിതി മാറൽ
azd-env() {
    azd env select $1 && azd show
}

# നിരീക്ഷണത്തോടെയുള്ള വേഗത്തിലുള്ള മുനമ്പ്
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

### സഹായം ലഭിക്കുക
```bash
# പൊതുവായ സഹായം
azd --help
azd help

# കമാൻഡ്-സ്പെസിഫിക്ക് സഹായം
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

# ടെംപ്ലേറ്റ് ഡോക്യുമെന്റേഷൻ കാണിക്കുക
azd template show <template-name> --docs
```

---

**ടിപ്പ്**: ഈ ചീറ്റ് ഷീറ്റ് ബുക്ക്മാർക്ക് ചെയ്യുക, നിങ്ങൾക്ക് വേണ്ട കമാൻഡുകൾ വേഗത്തിൽ കണ്ടെത്താൻ `Ctrl+F` ഉപയോഗിക്കുക!

---

**നാവിഗേഷൻ**
- **മുമ്പത്തെ പാഠം**: [പ്രിഫ്ലൈറ്റ് ചെക്കുകൾ](../docs/pre-deployment/preflight-checks.md)
- **അടുത്ത പാഠം**: [ഗ്ലോസറി](glossary.md)

---

> **💡 നിങ്ങളുടെ എഡിറ്ററിലെ Azure കമാൻഡ് സഹായം വേണോ?** `npx skills add microsoft/github-copilot-for-azure` പ്രയോഗിച്ച് [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ഇൻസ്റ്റാൾ ചെയ്യുക — AI, Foundry, ഡിപ്ലോയ്മെന്റ്, ഡയഗ്നോസ്റ്റിക്സ് തുടങ്ങിയ 37 സ്കില്ലുകൾ ലഭ്യമാണ്.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->