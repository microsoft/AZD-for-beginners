# പൊതു പ്രശ്നങ്ങളും പരിഹാരങ്ങളും

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 7 - പ്രശ്നപരിഹാരം & ഡീബഗ്ഗിംഗ്
- **⬅️ മുമ്പത്തെ അധ്യായം**: [അധ്യായം 6: പ്രീ-ഫ്ലൈറ്റ് പരിശോധകൾ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ അടുത്തത്**: [ഡീബഗ്ഗിംഗ് ഗൈഡ്](debugging.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 8: ഉത്പാദനം & എന്റർപ്രൈസ് പാറ്റേണുകൾ](../chapter-08-production/production-ai-practices.md)

## പരിചയം

ഈ സമഗ്ര പ്രശ്നപരിഹാരം ഗൈഡ് Azure Developer CLI ഉപയോഗിക്കുമ്പോഴുള്ള ഏറ്റവും സാധാരണമായി നേരിടുന്ന പ്രശ്നങ്ങളെക്കുറിച്ചാണ്. ഓതന്റിക്കേഷൻ, ഡിപ്ലോയ്മെന്റ്, ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ്, ആപ്ലിക്കേഷൻ കോൺഫിഗറേഷൻ എന്നീ മേഖലകളിലെ പൊതുവായ പ്രശ്നങ്ങളെ തിരിച്ചറിയാനും, പരിഹരിക്കുന്നതിനും പഠിക്കൂ. ഓരോ പ്രശ്നത്തിനും വിശദമായ ലക്ഷണങ്ങൾ, മൂലകാരണം, ഘട്ടംവൈസുള്ള പരിഹാര നടപടിക്രമങ്ങൾ അടങ്ങിയിരിക്കുന്നു.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ നിങ്ങൾക്ക്:
- Azure Developer CLI പ്രശ്നങ്ങളുടെ നിർണയം നടത്താനുള്ള കരുത്ത് നേടുക
- സാധാരണ ഓതന്റിക്കേഷൻ, അനുമതി പ്രശ്നങ്ങളും അവയുടെ പരിഹാരങ്ങളും മനസ്സിലാക്കുക
- ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ, ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് പിശകുകൾ, കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- പ്രോ ആക്ടീവ് മോണിറ്ററിങ്ങും ഡീബഗ്ഗിങ്ങും നടപ്പിലാക്കുക
- സങ്കീർണ്ണ പ്രശ്നങ്ങൾക്ക് സമഗ്രമായ troubleshooting രീതികള്‍ അനുഷ്ഠിക്കുക
- ഭാവിയിൽ പ്രശ്നങ്ങൾ ഒഴിവാക്കാൻ അനുയോജ്യമായ ലോക്കിംഗ്, മോണിറ്ററിംഗ് ക്രമീകരിക്കുക

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കിയപ്പോൾ, നിങ്ങൾക്ക് സാധിക്കും:
- എൻജിനറിയാണ് diagnostic tools ഉപയോഗിച്ച് Azure Developer CLI പ്രശ്നങ്ങൾ നിർണയിക്കുക
- ഓതന്റിക്കേഷൻ, സബ്‌സ്‌ക്രിപ്ഷൻ, അനുമതി സംബന്ധിച്ച പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി പരിഹരിക്കുക
- ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ, ഇൻഫ്രാസ്ട്രക്ചർ പിശകുകൾ ഫലപ്രദമായി പരിഹരിക്കുക
- ആപ്ലിക്കേഷൻ കോൺഫിഗറേഷൻ പ്രശ്നങ്ങളും പരിസ്ഥിതി-നിഷ്ഠിത പ്രശ്നങ്ങളും ഡീബഗ് ചെയ്യുക
- സാധ്യതയുള്ള പ്രശ്നങ്ങളെ മുൻകൂട്ടി കണ്ടെത്താൻ മോണിറ്ററിങ്ങും അലർട്ടിങ്ങും നടപ്പിലാക്കുക
- ലോക്കിംഗ്, ഡീബഗ്ഗിംഗ്, പ്രശ്നപരിഹാരം പ്രവണതകൾക്കുള്ള മികച്ച പ്രവർത്തന രീതി പ്രയോഗിക്കുക

## ക്വിക്ക് ഡയഗ്നോസ്റ്റിക്‌സ്

പ്രത്യേക പ്രശ്നങ്ങളിൽ പ്രവേശിക്കാൻ മുന്‍പ്, ഡയഗ്നോസ്റ്റിക് വിവരങ്ങൾ ശേഖരിക്കാൻ ഈ കമാൻഡുകൾ റൺ ചെയ്യുക:

```bash
# azd പതിപ്പ് மற்றும் ആരോഗ്യ നില പരിശോധിക്കുക
azd version
azd config show

# Azure സാന്ദ്രീകരണം സ്ഥിരീകരിക്കുക
az account show
az account list

# നിലവിലുള്ള പരിസ്ഥിതി പരിശോധിക്കുക
azd env list
azd env get-values

# ഡീബഗ് ലോഗിംഗ് പ്രവർത്തനമാക്കുക
export AZD_DEBUG=true
azd <command> --debug
```

## ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ

### പ്രശ്നം: "ആക്സസ് ടോക്കൺ നേടാൻ പരാജയം"
**ലക്ഷണങ്ങൾ:**
- `azd up` ഓതന്റിക്കേഷൻ പിശകുകളോടെ പരാജയപ്പെടുന്നു
- കമാൻഡുകൾ "അനധികൃതം" അല്ലെങ്കിൽ "ആക്സസ് നിരസിച്ചു" എന്ന് തിരിച്ചറിവ് നൽകുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. Azure CLI ഉപയോഗിച്ച് പുനഃസ്ഥാപിക്കുക
az login
az account show

# 2. ക്യാഷ് ചെയ്ത അംഗീകാരങ്ങൾ മായ്ക്കുക
az account clear
az login

# 3. ഡിവൈസ് കോഡ് ഫ്ലോ ഉപയോഗിക്കുക (പ്രത്യക്ഷമില്ലാത്ത സിസ്റ്റങ്ങൾക്കായി)
az login --use-device-code

# 4. വ്യക്തമായ സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### പ്രശ്നം: ഡിപ്ലോയ്മെന്റിനിടെ "അപര്യാപ്തമായ അനുമതികൾ"
**ലക്ഷണങ്ങൾ:**
- അനുവാദ പിശകുകളോടെ ഡിപ്ലോയ്മെന്റ് പരാജയപ്പെടുന്നു
- ചില Azure വിഭവങ്ങൾ സൃഷ്ടിക്കാൻ കഴിയുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. നിങ്ങളുടെ ആജ്യൂർ റോൾ അസൈൻമെന്റുകൾ പരിശോധിക്കുക
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ആവശ്യമായ റോളുകൾ നിങ്ങൾക്കുണ്ടെന്ന് ഉറപ്പാക്കുക
# - സംഭാവക (റിസോഴ്‌സ് സൃഷ്ടിക്കാൻ)
# - ഉപയോക്തൃ ആക്സസ് അഡ്മിനിസ്ട്രേറ്റർ (റോൾ അസൈൻമെന്റുകൾക്ക്)

# 3. ശരിയായ അനുമതികൾക്കായി നിങ്ങളുടെ ആജ്യൂർ ആഡ്മിനിസ്ട്രേറ്ററെ ബന്ധപ്പെടുക
```

### പ്രശ്നം: മൾട്ടി-ടെനന്റ് ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ
**പരിഹാരങ്ങൾ:**
```bash
# 1. നിർദ്ദിഷ്ടത്തെന്ത്മാർകോടൊപ്പം ലോഗിൻ ചെയ്യുക
az login --tenant "your-tenant-id"

# 2. കോൺഫിഗറേഷനിൽ തെന്ത്മാർ സെറ്റ് ചെയ്യുക
azd config set auth.tenantId "your-tenant-id"

# 3. തെന്ത്മാർ മറികടക്കുമ്പോൾ തെന്ത്മാർ缓存 mൂാങ്കുക
az account clear
```

## 🏗️ ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് പിശകുകൾ

### പ്രശ്നം: വിഭവ നാമം പോരായ്മകൾ
**ലക്ഷണങ്ങൾ:**
- "The resource name already exists" പിശകുകൾ
- വിഭവ സൃഷ്ടിക്കുമ്പോൾ ഡിപ്ലോയ്മെന്റ് പരാജയപ്പെടുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. ടോക്കണുകളുമായി പ്രത്യേകമായ സ്രോതസ്സ് പേരുകൾ ഉപയോഗിക്കുക
# നിങ്ങളുടെ ബൈസിപ് ടെംപ്ലേറ്റിൽ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. പരിസ്ഥിതി പേര് മാറ്റുക
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. നിലവിലുള്ള സ്രോതസ്സ് ക്ലീൻ ചെയ്യുക
azd down --force --purge
```

### പ്രശ്നം: സ്ഥലം/പ്രദേശം ലഭ്യമല്ല
**ലക്ഷണങ്ങൾ:**
- "The location 'xyz' is not available for resource type"
- തെരഞ്ഞെടുത്ത പ്രദേശത്ത് ചില SKUs ലഭ്യമല്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. റിസോർസ് തരം ലഭ്യമായ പ്രദേശങ്ങൾ പരിശോധിക്കുക
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. സാധാരണ ലഭ്യമായ മേഖലകൾ ഉപയോഗിക്കുക
azd config set defaults.location eastus2
# അല്ലെങ്കിൽ
azd env set AZURE_LOCATION eastus2

# 3. മേഖലയുടെ അടിസ്ഥാനത്തിൽ സേവന ലഭ്യത പരിശോധിക്കുക
# സന്ദർശിക്കുക: https://azure.microsoft.com/global-infrastructure/services/
```

### പ്രശ്നം: ക്വോട്ടാ കവിയൽ പിശകുകൾ
**ലക്ഷണങ്ങൾ:**
- "Quota exceeded for resource type"
- "മാസകൂട്ടിയ വിഭവങ്ങളുടെ പരമാവധി എണ്ണം എത്തി"

**പരിഹാരങ്ങൾ:**
```bash
# 1. നിലവിലെ ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az vm list-usage --location eastus2 -o table

# 2. Azure പോർട്ടലിലൂടെ ക്വോട്ട വർദ്ധിപ്പിക്കാൻ അഭ്യർത്ഥിക്കുക
# പോകുക: സബ്സ്ക്രിപ്ഷനുകൾ > ഉപയോഗവും ക്വോട്ടകളും

# 3. വികാസത്തിന് ചെറിയ SKUs ഉപയോഗിക്കുക
# main.parameters.json ല്‍:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ഉപയോഗിക്കാത്ത ആവശ്യമില്ലാത്ത വనങ്ങൾ ശുചീകരിക്കുക
az resource list --query "[?contains(name, 'unused')]" -o table
```

### പ്രശ്നം: Bicep ടെംപ്ലേറ്റ് പിശകുകൾ
**ലക്ഷണങ്ങൾ:**
- ടെംപ്ലേറ്റ് സ്ഥിരീകരണ പരാജയം
- Bicep ഫയൽ സyntaക്‌സ് പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. ബൈസപ് സിന്റാക്സ് സാധുത പരിശോധിക്കുക
az bicep build --file infra/main.bicep

# 2. ബൈസപ് ലിംറ്റർ ഉപയോഗിക്കുക
az bicep lint --file infra/main.bicep

# 3. പരാമിതിയുടെ ഫയൽ സിന്റാക്സ് പരിശോധിക്കുക
cat infra/main.parameters.json | jq '.'

# 4. ഡിപ്ലോയ്മെന്റ് മാറ്റങ്ങൾ പ്രിവ്യൂ ചെയ്യുക
azd provision --preview
```

## 🚀 ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ

### പ്രശ്നം: ബിൽഡ് പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ഡിപ്ലോയ്മെന്റിന്റെ ವೇಳೆ ആപ്ലിക്കേഷൻ നിർമ്മാണത്തിൽ പരാജയം
- പാക്കേജ് ഇൻസ്റ്റാളേഷൻ പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. ഡിബഗ് ഫ്ലാഗുമായി ബിൽഡ് ഔട്ട്‌പുട്ട് പരിശോധിക്കുക
azd deploy --service web --debug

# 2. വിന്യസിച്ച സേവന സ്ഥിതി കാണുക
azd show

# 3. ലോക്കലിൽ ബിൽഡ് ടെസ്റ്റ് ചെയ്യുക
cd src/web
npm install
npm run build

# 3. Node.js/Python വേർഷൻ അനുയോജ്യത പരിശോധിക്കുക
node --version  # azure.yaml ക്രമീകരണങ്ങൾക്കു പൊരംവേണ്ടതാണ്
python --version

# 4. ബിൽഡ് ക്യാഷ് ക്ലിയർ ചെയ്യുക
rm -rf node_modules package-lock.json
npm install

# 5. കണ്ടെയ്‌നർമാർ ഉപയോഗിക്കുന്ന പക്ഷം Dockerfile പരിശോധിക്കുക
docker build -t test-image .
docker run --rm test-image
```

### പ്രശ്നം: കണ്ടെയ്‌നർ ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- കണ്ടെയ്‌നർ ആപ്ലിക്കേഷനുകൾ തുടക്കത്തിൽ പരാജയപ്പെടുന്നു
- ഇമേജ് പുൾ പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. ഡോകർ ബിൽഡ് ലോക്കലിയോട് ടെസ്റ്റ് ചെയ്യുക
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. ആസ്യൂർ CLI ഉപയോഗിച്ച് കോൺറ്റെയ്നർ ലോഗുകൾ പരിശോധിക്കുക
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd വഴി ആപ്ലിക്കേഷനു మാനിറ്റർ ചെയ്യുക
azd monitor --logs

# 3. കോൺറ്റെയ്നർ റജിസ്റ്ററി ആക്സസ് സ്ഥിരീകരിക്കുക
az acr login --name myregistry

# 4. കോൺറ്റെയ്നർ ആപ്പ് കോൺഫിഗറേഷൻ പരിശോധിക്കുക
az containerapp show --name my-app --resource-group my-rg
```

### പ്രശ്നം: ഡാറ്റാബേസ് കണക്റ്റ് പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ആപ്ലിക്കേഷൻ ഡാറ്റാബേസുമായി കണക്റ്റ് ചെയ്യാൻ കഴിയുന്നില്ല
- കണക്ഷൻ ടൈംഔട്ട് പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. ഡേറ്റാബേസ് ഫയർവാൾ റൂളുകൾ പരിശോധിക്കുക
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ആപ്ലിക്കേഷനിൽ നിന്നുള്ള കണക്‌ടിവിറ്റി പരിശ്രമിക്കുക
# താൽക്കാലികമായി നിങ്ങളുടെ ആപ്പിലേക്ക് ചേർക്കുക:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. കണക്ഷൻ സ്ട്രിംഗ് ഫോർമാറ്റ് സ്ഥിരീകരിക്കുക
azd env get-values | grep DATABASE

# 4. ഡേറ്റാബേസ് സർവർ സ്റ്റാറ്റസ് പരിശോധിക്കുക
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ

### പ്രശ്നം: പരിസ്ഥിതിവെറിയബിൾസ് പ്രവർത്തിക്കുന്നില്ല
**ലക്ഷണങ്ങൾ:**
- ആപ്പ് കോൺഫിഗറേഷൻ മൂല്യങ്ങൾ വായിക്കാൻ കഴിയുന്നില്ല
- പരിസ്ഥിതിവെറിയബിൾസ് ശൂന്യമാണെന്ന് കാണിക്കുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. പരിസ്ഥിതി മാറ്റികൾ സജ്ജമാണെന്ന് ഉറപ്പാക്കുക
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ൽ ഉള്ള മാറ്റികളുടെ നാമങ്ങൾ പരിശോധിക്കുക
cat azure.yaml | grep -A 5 env:

# 3. അപ്ലിക്കേഷൻ റീസ്റ്റാർട്ട് ചെയ്യുക
azd deploy --service web

# 4. ആപ്പ് സർവീസ് കോൺഫിഗറേഷൻ പരിശോധിക്കുക
az webapp config appsettings list --name myapp --resource-group myrg
```

### പ്രശ്നം: SSL/TLS സർട്ടിഫിക്കറ്റ് പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- HTTPS പ്രവർത്തിക്കുന്നില്ല
- സർട്ടിഫിക്കറ്റ് സ്ഥിരീകരണ പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. SSL സർട്ടിഫിക്കറ്റ് നില പരിശോധിക്കുക
az webapp config ssl list --resource-group myrg

# 2. HTTPS മാത്രമാകെ സാധൂകരിക്കുക
az webapp update --name myapp --resource-group myrg --https-only true

# 3. ഇഷ്ടാനുസൃത ഡൊമെയ്ൻ ചേർക്കുക (ആവശ്യമെങ്കിൽ)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### പ്രശ്നം: CORS കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ഫ്രണ്ട്എൻഡ് API വിളിക്കാന്‍ കഴിയുന്നില്ല
- ക്രോസ്-ഓറിജിൻ അഭ്യർത്ഥന തടഞ്ഞു

**പരിഹാരങ്ങൾ:**
```bash
# 1. ആപ്പ് സെര്‍വീസിന് CORS ക്രമീകരിക്കുക
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS കൈകാര്യം ചെയ്യുന്നതിനായി API അപ്ഡേറ്റ് ചെയ്യുക
# Express.js ൽ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. ശരിയായ URL-കളിൽ പ്രവർത്തിക്കുന്നുണ്ടോ എന്ന് പരിശോധിക്കുക
azd show
```

## 🌍 പരിസ്ഥിതി മാനേജ്മെന്റ് പ്രശ്നങ്ങൾ

### പ്രശ്നം: പരിസ്ഥിതി മാറ്റം പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- തെറ്റായ പരിസ്ഥിതി ഉപയോഗിക്കുന്നു
- കോൺഫിഗറേഷൻ ശരിയായ രീതിയിൽ മാറുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. എല്ലാ പരിസ്ഥിതികളും പട്ടികപ്പെടുത്തുക
azd env list

# 2. പരിസ്ഥിതി വ്യക്തമാക്കിയായി തിരഞ്ഞെടുക്കുക
azd env select production

# 3. നിലവിലുള്ള പരിസ്ഥിതി സ്ഥിരീകരിക്കുക
azd env list

# 4. നശിച്ചാൽ പുതിയ പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new production-new
azd env select production-new
```

### പ്രശ്നം: പരിസ്ഥിതിയുടെ കൊടുത്തശേഷം തകരാറുകൾ
**ലക്ഷണങ്ങൾ:**
- പരിസ്ഥിതി അസാധുവായ അവസ്ഥ കാണിക്കുന്നു
- വിഭവങ്ങൾ കോൺഫിഗറേഷനുമായി പൊരുത്തപ്പെടുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. പരിസ്ഥിതി അവസ്ഥ പുതുക്കുക
azd env refresh

# 2. പരിസ്ഥിതി രൂപരേഖ പുതുക്കുക
azd env new production-reset
# ആവശ്യമായ പരിസ്ഥിതി ചുരുക്കലുകൾ പകർത്തുക
azd env set DATABASE_URL "your-value"

# 3. നിലവിലുള്ള വనരാഷ്ട്രീയം ഇറക്കുമതി ചെയ്യുക (സാധ്യമെങ്കിൽ)
# .azure/production/config.json റിസോഴ്‌സ് ഐഡികളോടെ മാനുവലായി അപ്‌ഡേറ്റ് ചെയ്യുക
```

## 🔍 കാര്യക്ഷമത പ്രശ്നങ്ങൾ

### പ്രശ്നം: ഡിപ്ലോയ്മെന്റ് സമയം വൈകി നടക്കുന്നത്
**ലക്ഷണങ്ങൾ:**
- ഡിപ്ലോയ്മെന്റ് വളരെ നീണ്ടു മുടുക്കുന്നു
- ഡിപ്ലോയ്മെന്റിനിടയിലുള്ള ടൈംഔട്ടുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. വേഗത്തിലായ പ്രശ്രവത്തിനായി പ്രത്യേക സേവനങ്ങൾ വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# 2. ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റം ഇല്ലാത്തപ്പോൾ കോഡ്-മോൾ മാത്രം വിന്യസിക്കുക
azd deploy  # azd up ൽ നിന്നു വേഗമേറിയത്

# 3. നിർമ്മാണ പ്രക്രിയ മെച്ചപ്പെടുത്തുക
# package.json-ൽ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. സമാന രാജ്യത്തിൽ ഉറവിടങ്ങളായിടങ്ങൾ പരിശോധിക്കുക
azd config set defaults.location eastus2
```

### പ്രശ്നം: ആപ്ലിക്കേഷൻ കാര്യക്ഷമത പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- പ്രതികരണ സമയം മന്ദഗതിയിലാണ്
- ഉയർന്ന വിഭവ ഉപഭോഗം

**പരിഹാരങ്ങൾ:**
```bash
# 1. റിസോഴ്സുകൾ വലുതാക്കി
# main.parameters.json-ൽ SKU അപ്ഡേറ്റ് ചെയ്യുക:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് നിരീക്ഷണം സജീവമാക്കുക
azd monitor --overview

# 3. ആസ്യൂറിൽ ആപ്ലിക്കേഷൻ ലോഗുകൾ പരിശോധിക്കുക
az webapp log tail --name myapp --resource-group myrg
# അല്ലെങ്കിൽ Container Apps-ക്കായി:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. കാഷിംഗ് നടപ്പാക്കുക
# നിങ്ങളുടെ ഇൻഫ്രാസ്ട്രക്ടറിൽ Redis കാഷ് ചേർക്കുക
```

## 🛠️ പ്രശ്നപരിഹാര ഉപകരണങ്ങൾ & കമാൻഡുകൾ

### Debug Commands
```bash
# സമഗ്രമായ ഡീബഗ്ഗിംഗ്
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd പതിപ്പ് പരിശോധിക്കുക
azd version

# നിലവിലെ ക്രമവിന്യാസം കാണുക
azd config show

# ബന്ധം പരിശോധനാ փորձ
curl -v https://myapp.azurewebsites.net/health
```

### ലോഗ് വിശകലനം
```bash
# Azure CLI മുഖാന്തിരം ആപ്ലിക്കേഷൻ ലോഗുകൾ
az webapp log tail --name myapp --resource-group myrg

# azd ഉപയോഗിച്ച് ആപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --logs
azd monitor --live

# Azure റിസോഴ്‌സ് ലോഗുകൾ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# കണ്ടെയ്‌നർ ലോഗുകൾ (കണ്ടെയ്‌നർ ആപ്പുകൾക്ക്)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### വിഭവ പരിശോധന
```bash
# എല്ലാ വിഭവങ്ങളും ലിസ്റ്റ് ചെയ്യുക
az resource list --resource-group myrg -o table

# വിഭവ അവസ്ഥ പരിശോധിക്കുക
az webapp show --name myapp --resource-group myrg --query state

# നെറ്റ്‌വർക്ക് പരിശോധനകൾ
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 അധിക സഹായം എടുക്കൽ

### എപ്പോഴാണ് ഉയർത്തേണ്ടത്
- എല്ലാ പരിഹാരങ്ങളും ശ്രമിച്ചതിനു ശേഷം ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ തുടരുകയാണെങ്കിൽ
- Azure സേവനങ്ങളുമായി ബന്ധപ്പെട്ട ഇൻഫ്രാസ്ട്രക്ചർ പ്രശ്നങ്ങൾ
- ബില്ലിംഗ് അല്ലെങ്കിൽ സബ്‌സ്‌ക്രിപ്ഷൻ സംബന്ധമായ പ്രശ്നങ്ങൾ
- സുരക്ഷാ ആശങ്കകൾ അല്ലെങ്കിൽ സംഭവം

### പിന്തുണാ ചാനലുകൾ
```bash
# 1. അജൂർ സർവീസ് ഹെൽത്ത് പരിശോധിക്കുക
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. അജൂർ സപ്പോർട്ട് ടിക്കറ്റ് സൃഷ്‌ടിക്കുക
# ഇതിലേക്ക് പോകുക: https://portal.azure.com -> സഹായം + പിന്തുണ

# 3. കമ്മ്യൂണിറ്റി വൃത്തങ്ങൾ
# - സ്റ്റാക്ക് ഓവർഫ്ലോ: azure-developer-cli ടാഗ്
# - GitHub പ്രശ്നങ്ങൾ: https://github.com/Azure/azure-dev/issues
# - മൈക്രോസോഫ്റ്റ് Q&A: https://learn.microsoft.com/en-us/answers/
```

### ശേഖരിക്കേണ്ട വിവരം
പിന്തുണ ബന്ധപ്പെടുന്നതിനു മുമ്പ് ശേഖരിക്കുക:
- `azd version` ഔട്ട്‌പുട്ട്
- `azd config show` ഔട്ട്‌പുട്ട്
- `azd show` ഔട്ട്‌പുട്ട് (നിലവിലെ ഡിപ്ലോയ്മെന്റ് നില)
- പിശക് സന്ദേശങ്ങൾ (മുഴുവൻ ടെക്സ്റ്റ്)
- പ്രശ്നം പുനരുത്പാദിപ്പിക്കുന്നതിനുള്ള ഘട്ടങ്ങൾ
- പരിസ്ഥിതി വിശദാംശങ്ങൾ (`azd env get-values`)
- പ്രശ്നം തുടങ്ങിയത് എപ്പോഴെന്ന് ടൈംലൈൻ

### ലോഗ് ശേഖരണ സ്ക്രിപ്  
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 പ്രശ്ന പ്രവൃത്തിവിമുക്തി

### മുൻകൂട്ടി ഡിപ്ലോയ്മെന്റ് പരിശോധന പട്ടിക
```bash
# 1. प्रमाणीकरणം പരിശോധിക്കുക
az account show

# 2. പാട്ടുകളും പരിധികളും പരിശോധിക്കുക
az vm list-usage --location eastus2

# 3. ടെംപ്ലേറ്റുകൾ പരിശോധിക്കുക
az bicep build --file infra/main.bicep

# 4. ആദ്യം ലോകലായി പരീക്ഷിക്കുക
npm run build
npm run test

# 5. ഡ്രൈ-റൺ വിന്യാസങ്ങൾ ഉപയോഗിക്കുക
azd provision --preview
```

### മോണിറ്ററിങ്ങ് ക്രമീകരണം
```bash
# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് സജീവമാക്കുക
# main.bicep ലിൽ ചേർക്കുക:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# അലർട്ടുകൾ ക്രമീകരിക്കുക
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### നിരന്തരം പരിപാലനം
```bash
# ആഴ്ചയിലൊരിക്കൽ ആരോഗ്യ പരിശോധനകൾ
./scripts/health-check.sh

# মাসാന്ത്യ ചെലവ് അവലോകനം
az consumption usage list --billing-period-name 202401

# പാദവാര സുരക്ഷ അവലോകനം
az security assessment list --resource-group myrg
```

## ബന്ധപ്പെട്ട വിഭവങ്ങൾ

- [ഡീബഗ്ഗിംഗ് ഗൈഡ്](debugging.md) - ഉയർന്ന തലത്തിലുള്ള ഡീബഗ്ഗിംഗ് സാങ്കേതികങ്ങൾ
- [വ്യവസ്ഥാപനം വിഭവങ്ങൾ](../chapter-04-infrastructure/provisioning.md) - ഇൻഫ്രാസ്ട്രക്ചർ പ്രശ്നപരിഹാരം
- [ശേഷി പ്ലാനിങ്ങ്](../chapter-06-pre-deployment/capacity-planning.md) - വിഭവ പ്ലാനിങ് മാർഗ്ഗനിർദ്ദേശങ്ങൾ
- [SKU തെരഞ്ഞെടുപ്പ്](../chapter-06-pre-deployment/sku-selection.md) - സർവീസ് ടെയ്ർ ശുപാർശകൾ

---

**ടിപ്പ്**: ഈ ഗൈഡ് ബുക്ക്‌ലിസ്റ്റ് ആയി സൂക്ഷിച്ച് പ്രശ്നങ്ങളുണ്ടാകുമ്പോൾ ഇതിന്റെ സഹായം എടുക്കുക. പല പ്രശ്നങ്ങളും മുമ്പ് കണ്ടിട്ടുണ്ട്, അവയ്ക്ക് ഉറപ്പുള്ള പരിഹാരങ്ങൾ ഉണ്ട്!

---

**നാവിഗേഷൻ**
- **മുമ്പത്തെ പാഠം**: [വ്യവസ്ഥാപനം വിഭവങ്ങൾ](../chapter-04-infrastructure/provisioning.md)
- **അടുത്ത പാഠം**: [ഡീബഗ്ഗിംഗ് ഗൈഡ്](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**വിവരണം**:  
ഈ രേഖ AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾതെളിവായ കൃത്യതയ്ക്ക് ശ്രമിക്കുന്നുണ്ടെങ്കിലും, സ്വയംഭരണ വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അസത്യതകൾ ഉണ്ടാകാൻ സാധ്യതയുള്ളതിനാൽ, ദയവായി ശ്രദ്ധിക്കുക.  
മൂല പ്രമാണം സ്വന്ത ഭാഷയിൽ ഉള്ളത് അധികാരം ഉള്ള ഉറവിടമായി കരുതണം. നിർണായക വിവരങ്ങൾക്കായി, പ്രൊഫഷണൽ മാനവ വിവർത്തനം ശിപാർശകർപ്പെടുന്നു.  
ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നും ഉണ്ടാകുന്ന തെറ്റായ മനസിലാക്കലുകൾക്കോ വ്യാഖ്യാനങ്ങൾക്കും ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->