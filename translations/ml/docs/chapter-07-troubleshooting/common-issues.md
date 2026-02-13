# സാധാരണ പ്രശ്നങ്ങളും പരിഹാരങ്ങളും

**അധ്യായ നാവിഗേഷൻ:**
- **📚 Course Home**: [AZD - തുടക്കക്കാർ](../../README.md)
- **📖 നിലവിലുള്ള അധ്യായം**: അധ്യായം 7 - പ്രശ്നപരിഹാരവും ഡീബഗിംഗും
- **⬅️ Previous Chapter**: [അധ്യായം 6: പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [ഡീബഗിംഗ് ഗൈഡ്](debugging.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 8: ഉത്പാദനവും എന്റർപ്രൈസ് മാതൃകകളും](../chapter-08-production/production-ai-practices.md)

## ആമുഖം

ഈ സമഗ്രമുള്ള ട്രബിള്ഷൂട്ടിംഗ് ഗൈഡ് Azure Developer CLI ഉപയോഗത്തിൽ ഏറ്റവും അധികം കാണപ്പെടുന്ന പ്രശ്നങ്ങളെ ഉൾക്കൊള്ളുന്നു. ഓതന്റിക്കേഷൻ, ഡിപ്ലോയ്മെന്റ്, ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ്, ആപ്ലിക്കേഷൻ കോൺഫിഗറേഷൻ എന്നിവയുമായി ബന്ധപ്പെട്ട സാധാരണ പ്രശ്നങ്ങളെ കണ്ടെത്താനും, ട്രബിള്ഷൂട്ടുചെയ്യാനും, പരിഹരിക്കാനും ഇതിലൂടെ പഠിക്കാം. ഓരോ പ്രശ്നത്തിനും വിശദമായ ലക്ഷണങ്ങൾ, മൂലകാരണങ്ങൾ, ഘട്ടംതെറും പരിഹാര നടപടികൾ ഉൾപ്പെടുത്തിയിട്ടുണ്ട്.

## പഠനലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കുമ്പോൾ നിങ്ങൾക്ക്:
- Azure Developer CLI പ്രശ്നങ്ങൾക്കുള്ള ഡയഗ്നോസ്റ്റിക് സാങ്കേതികതകളിൽ നിപുണത നേടുക
- സാധാരണ ഓതന്റിക്കേഷൻയും അനുവാദ പ്രശ്നങ്ങളും അവയുടെയുള്ള പരിഹാരങ്ങൾ മനസിലാക്കുക
- ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ, ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് പിശകുകൾ, കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- പ്രോസേജീവ് മോണിറ്ററിംഗ് এবং ഡീബഗിംഗ് തന്ത്രങ്ങൾ നടപ്പിലാക്കുക
- ഹ്രസ്വവും സമഗ്രവുമായ സമസ്യ നിർണയ രീതികൾ പ്രയോഗിക്കുക
- ഭാവിയിലെ പ്രശ്നങ്ങൾ ഒഴിവാക്കാൻ ശരിയായ ലോഗ്ഗിംഗും മോണിറ്ററിംഗും ക്രമീകരിക്കുക

## പഠനഫലങ്ങൾ

പൂർത്തിയാക്കി കഴിഞ്ഞാൽ നിങ്ങൾ കഴിയും:
- ബിൽറ്റ്-ഇൻ ഡയഗ്നോസ്റ്റിക് ടൂളുകൾ ഉപയോഗിച്ച് Azure Developer CLI പ്രശ്നങ്ങൾ ഡയഗ്നോസ് ചെയ്യുക
- ഓതന്റിക്കേഷൻ, സബ്സ്ക്രിപ്ഷൻ, അനുവാദ സംബന്ധമായ പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി പരിഹരിക്കുക
- ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങളും ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് പിശകുകളും ഫലപ്രദമായി ട്രബിള്ഷൂട്ടുചെയ്യുക
- ആപ്ലിക്കേഷൻ കോൺഫിഗറേഷൻ പ്രശ്നങ്ങളും പരിസ്ഥിതി-നിശ്ചിത പ്രശ്നങ്ങളും ഡീബഗ് ചെയ്യുക
- സാദ്ധ്യമായ പ്രശ്നങ്ങൾ മുൻകൂട്ടി കണ്ടെത്താൻ മോണിറ്ററിംഗ്, അലേർട്ടിംഗ് നടപ്പിലാക്കുക
- ലോഗ്ഗിംഗ്, ഡീബഗിംഗ്, പ്രശ്നപരിഹാര പ്രക്രിയകൾക്കുള്ള മികച്ച പ്രവൃത്തികൾ പ്രയോഗിക്കുക

## ദ്രുത പരിശോധനകൾ

നിങ്ങൾ പ്രത്യേക പ്രശ്നങ്ങളിൽ ആഴത്തിൽ പോത്ത് തുടങ്ങുന്നതിന് മുമ്പ്, ഡയഗ്നോസ്റ്റിക് വിവരങ്ങൾ ശേഖരിക്കാൻ ഈ കമാൻഡുകൾ പ്രവർത്തിപ്പിക്കുക:

```bash
# azd പതിപ്പും പ്രവർത്തനസ്ഥിതിയും പരിശോധിക്കുക
azd version
azd config list

# Azure പ്രാമാണീകരണം സ്ഥിരീകരിക്കുക
az account show
az account list

# നിലവിലെ പരിസ്ഥിതി പരിശോധിക്കുക
azd env show
azd env get-values

# ഡീബഗ് ലോഗിംഗ് സജീവമാക്കുക
export AZD_DEBUG=true
azd <command> --debug
```

## പ്രാമാണീകരണ പ്രശ്നങ്ങൾ

### പ്രശ്നം: "പ്രവേശന ടോക്കൺ ലഭിക്കാൻ പരാജയപ്പെട്ടു"
**ലക്ഷണങ്ങൾ:**
- `azd up` പ്രാമാണികതാ പിശകുകൾ കാരണം പരാജയപ്പെടുന്നു
- കമാൻഡുകൾ "unauthorized" അല്ലെങ്കിൽ "access denied" തിരികെ നൽകുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. Azure CLI ഉപയോഗിച്ച് വീണ്ടും പ്രാമാണീകരിക്കുക
az login
az account show

# 2. കാഷിൽ സൂക്ഷിച്ചിരിക്കുന്ന ക്രെഡൻഷ്യലുകൾ നീക്കം ചെയ്യുക
az account clear
az login

# 3. ഡിവൈസ് കോഡ് ഫ്ലോ ഉപയോഗിക്കുക (ഹെഡ്‌ലെസ് സിസ്റ്റങ്ങൾക്കായി)
az login --use-device-code

# 4. സ്പഷ്ടമായ സബ്സ്ക്രിപ്ഷൻ ക്രമീകരിക്കുക
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### പ്രശ്നം: വിന്യാസ സമയത്ത് "Insufficient privileges"
**ലക്ഷണങ്ങൾ:**
- ഡിപ്ലോയ്മെന്റ് അനുവാദ പിശകുകളോടെ പരാജയപ്പെടുന്നു
- ചില Azure റിസോഴ്‌സുകൾ സൃഷ്ടിക്കാൻ കഴിയുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. നിങ്ങളുടെ Azure റോൾ നിയോഗങ്ങൾ പരിശോധിക്കുക
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. നിങ്ങൾക്ക് ആവശ്യമായ റോളുകൾ ഉണ്ടെന്ന് ഉറപ്പാക്കുക
# - Contributor (റിസോഴ്‌സ് സൃഷ്ടിക്കാനുള്ള)
# - User Access Administrator (റോൾ നിയോഗങ്ങൾക്കായി)

# 3. ശരിയായ അനുമതികൾക്കായി നിങ്ങളുടെ Azure അഡ്മിനിസ്ട്രേറ്ററെ ബന്ധപ്പെടുക
```

### പ്രശ്നം: മൾട്ടി-ടെനന്റ് ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ
**പരിഹാരങ്ങൾ:**
```bash
# 1. ഒരു നിർദ്ദിഷ്ട ടെനന്റുമായി ലോഗിൻ ചെയ്യുക
az login --tenant "your-tenant-id"

# 2. ക്രമീകരണത്തിൽ ടെനന്റ് സജ്ജീകരിക്കുക
azd config set auth.tenantId "your-tenant-id"

# 3. ടെനന്റുകൾ മാറ്റുമ്പോൾ ടെനന്റ് കാഷെ ശൂന്യപ്പെടുത്തുക
az account clear
```

## 🏗️ ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് പിശകുകൾ

### പ്രശ്നം: റിസോഴ്‌സ് പേര് സംഘർഷം
**ലക്ഷണങ്ങൾ:**
- "The resource name already exists" എന്നുള്ള പിശകുകൾ
- റിസോഴ്‌സ് സൃഷ്ടിക്കൽ സമയത്ത് ഡിപ്ലോയ്മെന്റ് പരാജയപ്പെടുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. ടോക്കണുകൾ ഉപയോഗിച്ച് അദ്വිතീയ റിസോഴ്സ് പേരുകൾ ഉപയോഗിക്കുക
# നിങ്ങളുടെ Bicep ടെംപ്ലേറ്റിൽ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. പരിസ്ഥിതി പേര് മാറ്റുക
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. നിലവിലുള്ള റിസോഴ്സുകൾ നീക്കം ചെയ്യുക
azd down --force --purge
```

### പ്രശ്നം: ലൊക്കേഷൻ/റീജിയൺ ലഭ്യമല്ല
**ലക്ഷണങ്ങൾ:**
- "The location 'xyz' is not available for resource type"
- തിരഞ്ഞെടുക്കപ്പെട്ട റീജിയനിൽ ചില SKUs ലഭ്യമല്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. റിസോഴ്‌സ് തരംകൾക്കുള്ള ലഭ്യമായ ലൊക്കേഷനുകൾ പരിശോധിക്കുക
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. സാധാരണ ലഭ്യമായ മേഖലകൾ ഉപയോഗിക്കുക
azd config set defaults.location eastus2
# അതവാ
azd env set AZURE_LOCATION eastus2

# 3. മേഖലപ്രകാരമുള്ള സേവന ലഭ്യത പരിശോധിക്കുക
# സന്ദർശിക്കുക: https://azure.microsoft.com/global-infrastructure/services/
```

### പ്രശ്നം: ക്വോട്ടാ മീതെ പോയ പിശകുകൾ
**ലക്ഷണങ്ങൾ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**പരിഹാരങ്ങൾ:**
```bash
# 1. നിലവിലുള്ള ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az vm list-usage --location eastus2 -o table

# 2. Azure പോർട്ടലിലൂടെ ക്വോട്ട വർധനക്കായി അപേക്ഷിക്കുക
# പോകുക: Subscriptions > Usage + quotas

# 3. ഡെവലപ്പ്മെന്റിനായി ചെറിയ SKUകൾ ഉപയോഗിക്കുക
# main.parameters.json ൽ:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ഉപയോഗിക്കപ്പെടാത്ത റിസോഴ്‌സുകൾ നീക്കം ചെയ്യുക
az resource list --query "[?contains(name, 'unused')]" -o table
```

### പ്രശ്നം: Bicep ടെംപ്ലേറ്റ് പിശകുകൾ
**ലക്ഷണങ്ങൾ:**
- ടെംപ്ലേറ്റ് സാധുതാ പരിശോധന പരാജയങ്ങൾ
- Bicep ഫയലുകളിൽ സിന്താക്സ് പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. Bicep സിന്റാക്സ് സാധുവെന്ന് സ്ഥിരീകരിക്കുക
az bicep build --file infra/main.bicep

# 2. Bicep ലിന്റർ ഉപയോഗിക്കുക
az bicep lint --file infra/main.bicep

# 3. പാരാമീറ്റർ ഫയൽ സിന്റാക്സ് പരിശോധിക്കുക
cat infra/main.parameters.json | jq '.'

# 4. ഡിപ്പ്ലോയ്മെന്റ് മാറ്റങ്ങൾ മുൻവീക്ഷിക്കുക
azd provision --preview
```

## 🚀 ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ

### പ്രശ്നം: ബിൽഡ് പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ഡിപ്ലോയ്മെന്റ് സമയത്ത് ആപ്ലിക്കേഷൻ ബിൽഡ് ആകുന്നില്ല
- പാക്കേജ് ഇൻസ്റ്റാളേഷൻ പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. ഡീബഗ് ഫ്ലാഗ് ഉപയോഗിച്ച് ബിൽഡ് ഔട്ട്പുട്ട് പരിശോധിക്കുക
azd deploy --service web --debug

# 2. ഡിപ്ലോയുചെയ്‌ത സേവനത്തിന്റെ നില കാണുക
azd show

# 3. ലോക്കലിൽ ബിൽഡ് പരീക്ഷിക്കുക
cd src/web
npm install
npm run build

# 3. Node.js/Python പതിപ്പുകളുടെ പൊരുത്തം പരിശോധിക്കുക
node --version  # azure.yaml ക്രമീകരണങ്ങളുമായി പൊരുത്തപ്പെടണം
python --version

# 4. ബിൽഡ് കാഷെ വൃത്തിയാക്കുക
rm -rf node_modules package-lock.json
npm install

# 5. കണ്ടെയ്നറുകൾ ഉപയോഗിക്കുന്നുവെങ്കിൽ Dockerfile പരിശോധിക്കുക
docker build -t test-image .
docker run --rm test-image
```

### പ്രശ്നം: കണ്ടെയ്‌നർ ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- കണ്ടെയ്‌നർ ആപ്ലിക്കേഷനുകൾ ആരംഭിക്കാറില്ല
- ഇമേജ് പുൾ പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. Docker ബിൽഡ് ലോക്കലായി പരീക്ഷിക്കുക
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ഉപയോഗിച്ച് കണ്ടെയ്‌നർ ലോഗുകൾ പരിശോധിക്കുക
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd മുഖേന അപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --logs

# 3. കണ്ടെയ്‌നർ റെജിസ്ട്രി ആക്സസ് സ്ഥിരീകരിക്കുക
az acr login --name myregistry

# 4. കണ്ടെയ്‌നർ ആപ്പ് ക്രമീകരണം പരിശോധിക്കുക
az containerapp show --name my-app --resource-group my-rg
```

### പ്രശ്നം: ഡാറ്റാബേസ് കണക്ഷൻ പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ആപ്ലിക്കേഷൻ ഡാറ്റാബേസുമായി കണക്ട് ചെയ്യാൻ കഴിയുന്നില്ല
- കണക്ഷൻ ടൈംഔട്ട് പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. ഡാറ്റാബേസ് ഫയർവാൾ നയങ്ങൾ പരിശോധിക്കുക
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. അപ്ലിക്കേഷനിൽ നിന്ന് കണക്റ്റിവിറ്റി പരിശോധിക്കുക
# താൽക്കാലികമായി നിങ്ങളുടെ ആപ്പിലേക്ക് ചേർക്കുക:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. കണക്ഷൻ സ്ട്രിംഗ് ഫോർമാറ്റ് പരിശോധിക്കുക
azd env get-values | grep DATABASE

# 4. ഡാറ്റാബേസ് സെർവർ നില പരിശോധിക്കുക
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ

### പ്രശ്നം: എൻവയർണ്മെന്റ് വേരിയബ്ളുകൾ പ്രവർത്തിക്കുന്നില്ല
**ലക്ഷണങ്ങൾ:**
- ആപ്പ് കോൺഫിഗറേഷൻ മൂല്യങ്ങൾ വായിക്കാൻ കഴിയുന്നില്ല
- എൻവയർണ്മെന്റ് വേരിയബ്ളുകൾ ശൂന്യമായി കാണപ്പെടുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. പരിസ്ഥിതി വേരിയബിളുകൾ സജ്ജമാണെന്ന് സ്ഥിരീകരിക്കുക
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ഫയലിലെ വേരിയബിളുകൾ പരിശോധിക്കുക
cat azure.yaml | grep -A 5 env:

# 3. ആപ്ലിക്കേഷൻ പുനരാരംഭിക്കുക
azd deploy --service web

# 4. ആപ് സർവീസ് ക്രമീകരണം പരിശോധിക്കുക
az webapp config appsettings list --name myapp --resource-group myrg
```

### പ്രശ്നം: SSL/TLS സർട്ടിഫിക്കറ്റ് പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- HTTPS പ്രവർത്തിക്കുന്നില്ല
- സർട്ടിഫിക്കറ്റ് സാധുത പരിശോധന പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. SSL സർട്ടിഫിക്കറ്റിന്റെ നില പരിശോധിക്കുക
az webapp config ssl list --resource-group myrg

# 2. HTTPS മാത്രം സജ്ജമാക്കുക
az webapp update --name myapp --resource-group myrg --https-only true

# 3. കസ്റ്റം ഡൊമെയ്ൻ ചേർക്കുക (ആവശ്യമെങ്കിൽ)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### പ്രശ്നം: CORS കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ഫ്രണ്ട്‌എൻഡ് API കോൾ ചെയ്യാൻ ആലോചിക്കുമ്പോൾ തടസം
- ക്രോസ്-ഒറിജിൻ അഭ്യർത്ഥന നിയന്ത്രിക്കപ്പെട്ടിരിക്കുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. App Service-ന് വേണ്ടി CORS ക്രമീകരിക്കുക
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS കൈകാര്യം ചെയ്യാൻ API അപ്‌ഡേറ്റ് ചെയ്യുക
# Express.js-ൽ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. ശരിയായ URL-കളിൽ പ്രവർത്തിക്കുന്നുണ്ടോ എന്ന് പരിശോധിക്കുക
azd show
```

## 🌍 പരിസ്ഥിതി മാനേജ്മെന്റ് പ്രശ്നങ്ങൾ

### പ്രശ്നം: പരിസ്ഥിതി മാറുന്നതിലുള്ള പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- തെറ്റായ പരിസ്ഥിതി ഉപയോഗത്തിൽ വരുന്നു
- കോൺഫിഗറേഷൻ ശരിയായി മാറുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. എല്ലാ എൻവയൺമെന്റുകളും പട്ടികപ്പെടുത്തുക
azd env list

# 2. സ്പഷ്ടമായി എൻവയൺമെന്റ് തിരഞ്ഞെടുക്കുക
azd env select production

# 3. നിലവിലെ എൻവയൺമെന്റ് പരിശോധിക്കുക
azd env show

# 4. തകരാറിലായാൽ പുതിയ എൻവയൺമെന്റ് സൃഷ്ടിക്കുക
azd env new production-new
azd env select production-new
```

### പ്രശ്നം: പരിസ്ഥിതി കറപ്ഷൻ
**ലക്ഷണങ്ങൾ:**
- പരിസ്ഥിതി അസാധുവായ നില കാണിക്കുന്നു
- റിസോഴ്‌സുകൾ കോൺഫിഗറേഷനുമായി പൊരുത്തപ്പെടുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. പരിസ്ഥിതിയുടെ അവസ്ഥ പുതുക്കുക
azd env refresh

# 2. പരിസ്ഥിതിയുടെ ക്രമീകരണം പുനഃസജ്ജമാക്കുക
azd env new production-reset
# ആവശ്യമായ പരിസ്ഥതി വേറിയബിളുകൾ പകർത്തുക
azd env set DATABASE_URL "your-value"

# 3. നിലവിലുള്ള റിസോഴ്സുകൾ ഇറക്കുമതി ചെയ്യുക (ശക്യമായെങ്കിൽ)
# കൈയായി .azure/production/config.json ഫയൽ റിസോഴ്‌സ് ഐഡികളോടെ അപ്ഡേറ്റ് ചെയ്യുക
```

## 🔍 പ്രകടന പ്രശ്നങ്ങൾ

### പ്രശ്നം: ഡിപ്ലോയ്മെൻ്റ് സമയങ്ങൾ വളരെ നീളം​
**ലക്ഷണങ്ങൾ:**
- ഡിപ്ലോയ്മെന്റുകൾ വളരെ സമയം എടുക്കുന്നു
- ഡിപ്ലോയ്മെന്റ് സമയത്ത് ടൈംഔട്ട് സംഭവിക്കുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. വേഗത്തിൽ ആവർത്തിക്കാൻ പ്രത്യേക സേവനങ്ങൾ വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# 2. ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റമില്ലെങ്കിൽ കോഡ് മാത്രം വിന്യാസം ഉപയോഗിക്കുക
azd deploy  # azd up-നേക്കാൾ വേഗമാണ്

# 3. ബിൽഡ് പ്രക്രിയ മെച്ചപ്പെടുത്തുക
# package.json ഫയലിൽ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. റിസോഴ്‌സ് ലൊക്കേഷനുകൾ പരിശോധിക്കുക (ഒന്നே റീജിയൻ ഉപയോഗിക്കുക)
azd config set defaults.location eastus2
```

### പ്രശ്നം: ആപ്ലിക്കേഷൻ പ്രവർത്തനക്ഷമത പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- പ്രതികരണം വൈകുന്നത്
- ഉയർന്ന റിസോഴ്‌സ് ഉപയോഗം

**പരിഹാരങ്ങൾ:**
```bash
# 1. റിസോഴ്‌സുകൾ വർധിപ്പിക്കുക
# main.parameters.json-ൽ SKU പുതുക്കുക:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights നിരീക്ഷണം സജ്ജമാക്കുക
azd monitor --overview

# 3. Azure-ൽ ആപ്ലിക്കേഷൻ ലോഗുകൾ പരിശോധിക്കുക
az webapp log tail --name myapp --resource-group myrg
# അതവാ Container Apps-ക്കായി:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. കാഷിംഗ് നടപ്പിലാക്കുക
# Redis കാഷെ നിങ്ങളുടെ ഇൻഫ്രാസ്ട്രക്ചറിൽ ചേർക്കുക
```

## 🛠️ ട്രബിള്ഷൂട്ടിംഗ് ടൂളുകളും കമാൻഡുകളും

### ഡീബഗ് കമാൻഡുകൾ
```bash
# സമഗ്രമായ ഡീബഗിംഗ്
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd പതിപ്പ് പരിശോധിക്കുക
azd version

# നിലവിലെ ക്രമീകരണം കാണുക
azd config list

# കണക്ടിവിറ്റി പരിശോധന
curl -v https://myapp.azurewebsites.net/health
```

### ലോഗ് വിശകലനം
```bash
# Azure CLI വഴി ആപ്ലിക്കേഷൻ ലോഗുകൾ
az webapp log tail --name myapp --resource-group myrg

# azd ഉപയോഗിച്ച് ആപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --logs
azd monitor --live

# Azure റിസോഴ്‌സ് ലോഗുകൾ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# കണ്ടെയ്‌നർ ലോഗുകൾ (Container Apps ന് വേണ്ടി)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### റിസോഴ്‌സ് അന്വേഷണം
```bash
# എല്ലാ റിസോഴ്‌സുകളും പട്ടികപ്പെടുത്തുക
az resource list --resource-group myrg -o table

# റിസോഴ്‌സിന്റെ നില പരിശോധിക്കുക
az webapp show --name myapp --resource-group myrg --query state

# നെറ്റ്‌വർക്ക് ഡയഗ്നോസ്റ്റിക്സ്
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 കൂടുതൽ സഹായം ലഭ്യമാക്കുക

### എപ്പോൾ എസ്കലേറ്റുചെയ്യണം
- എല്ലാ പരിഹാരങ്ങളും ശ്രമിച്ചതിന് ശേഷവും ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ തുടരുന്നപ്പോൾ
- Azure സേവനങ്ങളുമായി ബന്ധപ്പെട്ട ഇൻഫ്രാസ്ട്രക്ചർ പ്രശ്നങ്ങൾ ഉണ്ടെങ്കിൽ
- ബില്ലിംഗ് അല്ലെങ്കിൽ സബ്സ്ക്രിപ്ഷൻ ബന്ധപ്പെട്ട പ്രശ്നങ്ങൾ ഉണ്ടായാൽ
- സുരക്ഷാ ആശങ്കകൾ അല്ലെങ്കിൽ സംഭവങ്ങൾ ഉണ്ടായാൽ

### സഹായ ചാനലുകൾ
```bash
# 1. Azure സേവന ആരോഗ്യ നില പരിശോധിക്കുക
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure പിന്തുണ ടിക്കറ്റ് സൃഷ്‌ടിക്കുക
# പോകുക: https://portal.azure.com -> സഹായം + പിന്തുണ

# 3. കമ്മ്യൂണിറ്റി സ്രോതസ്സുകൾ
# - Stack Overflow: azure-developer-cli ടാഗ്
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ശേഖരിക്കേണ്ട വിവരങ്ങൾ
സഹായം കണക്ട് ചെയ്യുന്നതിന് മുൻപ് തുടങ്ങിയ്ക്കുക:
- `azd version` ഔട്ട്‌പുട്ട്
- `azd config list` ഔട്ട്‌പുട്ട്
- `azd show` ഔട്ട്‌പുട്ട് (നിലവിലെ ഡിപ്ലോയ്മെന്റ് സ്റ്റാറ്റസ്)
- പിശകു സന്ദേശങ്ങൾ (പൂർണ്ണ വാചകം)
- പ്രശ്നം പുനരാവർത്തിപ്പെടുത്താനുള്ള ചുവടുകൾ
- പരിസ്ഥിതി വിശദാംശങ്ങൾ (`azd env show`)
- പ്രശ്നം ആരംഭിച്ചതിന്റെ സമയരേഖ

### ലോഗ് ശേഖരണ സ്ക്രിപ്റ്റ്
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 പ്രശ്നം തടയൽ

### പ്രീ-ഡിപ്ലോയ്മെന്റ് ചെക്ക്ലിസ്റ്റ്
```bash
# 1. പ്രാമാണീകരണം സ്ഥിരീകരിക്കുക
az account show

# 2. ക്വോട്ടകളും പരിമിതികളും പരിശോധിക്കുക
az vm list-usage --location eastus2

# 3. ടെംപ്ലേറ്റുകൾ സാധുവെന്ന് പരിശോധിക്കുക
az bicep build --file infra/main.bicep

# 4. ആദ്യം ലോക്കലായി പരീക്ഷിക്കുക
npm run build
npm run test

# 5. ഡ്രൈ-റൺ വിന്യാസങ്ങൾ ഉപയോഗിക്കുക
azd provision --preview
```

### മോണിറ്ററിംഗ് ക്രമീകരണം
```bash
# Application Insights സജീവമാക്കുക
# main.bicep-ലേക്ക് ചേർക്കുക:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# അലേർട്ടുകൾ ക്രമീകരിക്കുക
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### നിയമിത പരിപാലനം
```bash
# ആഴ്ചവാരി ആരോഗ്യ പരിശോധനകൾ
./scripts/health-check.sh

# മാസിക ചെലവുകളുടെ അവലോകനം
az consumption usage list --billing-period-name 202401

# ത്രൈമാസിക സുരക്ഷാ അവലോകനം
az security assessment list --resource-group myrg
```

## ബന്ധപ്പെട്ട വിഭവങ്ങൾ

- [ഡീബഗിംഗ് ഗൈഡ്](debugging.md) - ആഡ്വാൻസ്ഡ് ഡീബഗിംഗ് തന്ത്രങ്ങൾ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ഇൻഫ്രാസ്ട്രക്ചർ ട്രബിള്ഷൂട്ടിംഗ്
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് പ്ലാനിംഗ് മാർഗ്ദർശനം
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - സർവീസ് ടിയർ ശുപാർശകൾ

---

**ടിപ്**: ഈ ഗൈഡ് ബുക്ക്‌മാർക്ക് ചെയ്ത് നിങ്ങൾക്ക് പ്രശ്നങ്ങളുണ്ടായപ്പോൾ ഇതിലേക്ക് സമീപിക്കുക. അധികഭാഗം പ്രശ്നങ്ങൾ മുമ്പ് തന്നെ കണ്ടിട്ടുള്ളവയാണ് കൂടിയുള്ള പരിഹാരങ്ങളും നിലവിലുണ്ട്!

---

**നാവിഗേഷൻ**
- ** Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- ** Next Lesson**: [ഡീബഗിംഗ് ഗൈഡ്](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
അസ്വീകാര്യ കുറിപ്പ്:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷ ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിച്ചിട്ടുണ്ടെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിശകുകളും അകൃത്യതകളും ഉണ്ടായിരിക്കുന്നതിനാൽ ഇത് ശ്രദ്ധിക്കുക. മൗലിക ഭാഷയിലുള്ള യഥാർത്ഥ രേഖയെ അധികൃത ഉറവിടമായി കണക്കാക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക് വൃത്തിപരമായ മനുഷ്യപരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ചതിന്റെ ഫലമായി ഉണ്ടാകാവുന്ന quaisquer തെറ്റിദ്ധാരണങ്ങൾക്കും വ്യാഖ്യാന പിഴവുകൾക്കും ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->