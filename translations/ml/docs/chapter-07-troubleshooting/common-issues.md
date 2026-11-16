# സാധാരണ പ്രശ്നങ്ങളും പരിഹാരങ്ങളും

**അദ്ധ്യായം നവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 7 - പ്രശ്നപരിഹാരം & ഡിബഗ്ഗിംഗ്
- **⬅️ മുൻ അദ്ധ്യായം**: [അദ്ധ്യായം 6: പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ അടുത്തത്**: [ഡിബഗ്ഗിംഗ് ഗൈഡ്](debugging.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 8: പ്രൊഡക്ഷൻ & എന്റർപ്രൈസ് പാറ്റേണുകൾ](../chapter-08-production/production-ai-practices.md)

## പരിചയം

ഈ സമഗ്രമായ പ്രശ്നപരിഹാര ഗൈഡ് Azure Developer CLI ഉപയോഗിക്കുമ്പോഴുള്ള ഏറ്റവും പ്രശ്നപരിചിതമായ വിഷയങ്ങൾ ഉൾക്കൊള്ളുന്നു. ഓതന്റികേഷൻ, ഡിപ്പ്ലോയ്മെന്റ്, ഇൻഫ്രാസ്ട്രക്ഷർ പ്രൊവിഷനിംഗ്, ആപ്ലിക്കേഷൻ കോൺഫിഗറേഷൻ എന്നീ മേഖലകളിലെ പൊതുവായ പ്രശ്നങ്ങൾ തിരിച്ചറിയാനും, പരിഹരിക്കാനും പഠിക്കൂ. ഓരോ പ്രശ്നത്തിനും വിശദമായ ലക്ഷണങ്ങൾ, മൂല കാരണങ്ങൾ, ഘട്ടംഘട്ടമായ പരിഹാര നടപടികൾ ഉൾപ്പെടുന്നു.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കുമ്പോൾ, നിങ്ങൾക്ക് സാധിക്കും:
- Azure Developer CLI പ്രശ്നങ്ങൾക്കുള്ള ഡയഗ്നോസ്റ്റിക് സാങ്കേതികവിദ്യയിൽ മാഹിതി നേടുക
- സാധാരണ ഓതന്റിക്കേഷൻ, അനുമതി പ്രശ്നങ്ങൾക്കും അവയുടെ പരിഹാരങ്ങൾക്കും മനസിലാക്കുക
- ഡിപ്പ്ലോയ്മെന്റ് പരാജയങ്ങൾ, ഇൻഫ്രാസ്ട്രക്ഷർ പ്രൊവിഷനിംഗ് പിശകുകൾ, കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- മുൻകൂറിൽ പരിശോധനയും ഡിബഗ്ഗിംഗും നടപ്പിലാക്കുക
- സങ്കീർണമായ പ്രശ്നങ്ങൾക്ക് ക്രമസമ്ബന്ധമായ പ്രശ്നപരിഹാര രീതി സ്വീകരിക്കുക
- ഭാവിയിലെ പ്രശ്നങ്ങൾ ഒഴിവാക്കാൻ ശരിയായ ലോഗിംഗ്, മോണിറ്ററിംഗ് ക്രമീകരിക്കുക

## പഠന ഫലം

പൂർത്തിയായ ശേഷം, നിങ്ങൾക്ക് കഴിയും:
- ഉൾപ്പെടുത്തിയിരിക്കുന്ന ഡയഗ്നോസ്റ്റിക് ഉപകരണങ്ങൾ ഉപയോഗിച്ച് Azure Developer CLI പ്രശ്നങ്ങൾ നിർദേശിക്കുക
- ഓതന്റിക്കേഷൻ, സബ്സ്ക്രിപ്ഷൻ, അനുമതി സംബന്ധമായ പ്രശ്നങ്ങൾ സ്വതંત્રമായി പരിഹരിക്കുക
- ഡിപ്പ്ലോയ്മെന്റ് പരാജയങ്ങളും ഇൻഫ്രാസ്ട്രക്ഷർ പിശകുകളും ഫലപ്രദമായി പരിഹരിക്കുക
- ആപ്ലിക്കേഷൻ കോൺഫിഗറേഷൻ പ്രശ്നങ്ങളും പരിസ്ഥിതി പ്രത്യേക പ്രശ്നങ്ങളും ഡിബഗ് ചെയ്യുക
- സാധ്യതയുള്ള പ്രശ്നങ്ങൾ മുൻകൂറായി തിരിച്ചറിയാൻ മോണിറ്ററിംഗ്, അലേർട്ടിംഗ് നടപ്പിലാക്കുക
- ലോഗിംഗ്, ഡിബഗ്ഗിംഗ്, പ്രശ്നപരിഹാര പ്രവൃത്തിവരികൾക്കായി മികച്ച രീതികൾ ഉപയോഗിക്കുക

## വേഗത്തിൽ ഡയഗ്നോസിസ്

> ഉദാഹരണ പേരു/ഐഡിയെ നിങ്ങളുടെ പരിസ്ഥിതിയുടെ മൂല്യങ്ങളോടെ മാറ്റുക. ബാഷ്, ബിസെപ്, ജാവാസ്ക്രിപ്റ്റ്, പാരാമീറ്റർ-ഫയർ ഘടകങ്ങൾ താഴെ വേര്‍പെടുത്തിയിട്ടുണ്ട്; അവ ഒന്നായി പ്രവർത്തിക്കുന്ന സ്ക്രിപ്റ്റ് അല്ല. വിനാശകാരിയായ പ്രവർത്തനങ്ങൾ പരിശോധിച്ച് രഹസ്യങ്ങൾ മാറ്റിക്കൊടുക്കുക. `azd monitor --logs` ഒരു ബ്രൗസർ തുറക്കും; ടെർമിനൽ ലോഗുകൾ സ്ട്രീം ചെയ്‌തുകൊണ്ടിട്ടില്ല.

പ്രത്യേക പ്രശ്നങ്ങളിൽ ചാക്കുവേശിക്കുന്നതിന് മുമ്പ് താഴെ കൊടുത്തിരിക്കുന്ന കമാൻഡുകൾ പ്രവർത്തിപ്പിച്ച് ഡയഗ്നോസ്റ്റിക് വിവരങ്ങൾ ശേഖരിക്കുക:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ

### പ്രശ്നം: "ആക്സസ് ടോക്കൺ നേടാൻ പരാജയം"
**ലക്ഷണങ്ങൾ:**
- `azd up` ഓതന്റിക്കേഷൻ പിശകുകളുമായി പരാജയപ്പെടുന്നു
- കമാൻഡുകൾ "അനധികൃതം" അല്ലെങ്കിൽ "ആക്സസ് നിരാകരിച്ചു" എന്ന സന്ദേശങ്ങൾ നൽകുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### പ്രശ്നം: ഡിപ്പ്ലോയ്മെന്റ് സമയത്ത് "പര്യാപ്തമായ അനുമതികൾ ഇല്ല"
**ലക്ഷണങ്ങൾ:**
- അനുമതി പിശകുകളാൽ ഡിപ്പ്ലോയ്മെന്റ് പരാജയപ്പെടുന്നു
- ചില Azure റിസോസ്രസുകൾ സൃഷ്ടിക്കാൻ കഴിയുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### പ്രശ്നം: മൾട്ടി-ടെനന്റ് ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ
**പരിഹാരങ്ങൾ:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ ഇൻഫ്രാസ്ട്രക്ഷർ പ്രൊവിഷനിംഗ് പിശകുകൾ

### പ്രശ്നം: റിസോഴ്‌സ് പേര് പൊരുത്തക്കേടുകൾ
**ലക്ഷണങ്ങൾ:**
- "റിസോഴ്‌സ് പേര് ഇതിനകം നിലവിലുണ്ട്" പിശകുകൾ
- റിസോഴ്‌സ് സൃഷ്ടിക്കുമ്പോൾ ഡിപ്പ്ലോയ്മെന്റ് പരാജയപ്പെടുന്നു

**പരിഹാരങ്ങൾ:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### പ്രശ്നം: സ്ഥലം/പ്രദേശം ലഭ്യമല്ല
**ലക്ഷണങ്ങൾ:**
- "നിർദ്ദിഷ്ട 'xyz' സ്ഥലം റിസോഴ്‌സ് തരം ലഭ്യമല്ല"
- തിരഞ്ഞെടുത്ത പ്രദേശത്ത് ചില SKU കളില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

സ്ഥലം വ്യത്യാസപ്പെടുത്തുക നിലവിലുള്ള റിസോഴ്‌സുകൾ മാറ്റം വരുത്തുകയില്ല. നിലവിലുള്ള ഒരു റിസോഴ്‌സ് ഗ്രൂപ്പ് അല്ലെങ്കിൽ റിസോഴ്‌സ് സ്ഥലം മാറ്റം നിരസിക്കാം; പ്രാദേശികമായി പുനർ ഡിപ്പ്ലോയ്മെന്റ് നടത്താൻ വേർതിരിച്ച പരിസ്ഥിതി ഉപയോഗിക്കുക.

### പ്രശ്നം: ക്വോട്ട മറികടക്കൽ പിശകുകൾ
**ലക്ഷണങ്ങൾ:**
- "റിസോഴ്‌സ് തരം ക്വോട്ട മറികടക്കപ്പെട്ടു"
- "പരമാവധി റിസോഴ്‌സുകളുടെ എണ്ണം എത്തിയിരിക്കുന്നു"

**പരിഹാരങ്ങൾ:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

വികസനത്തിനായി, `infra/main.parameters.json` വഴി പിന്തുണയ്ക്കുന്ന ചെറിയ SKU ഒരു തിരഞ്ഞെടുക്കുക:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### പ്രശ്നം: Bicep ടെംപ്ലേറ്റ് പിശകുകൾ
**ലക്ഷണങ്ങൾ:**
- ടെംപ്ലേറ്റ് സാധുവാക്കൽ പരാജയങ്ങൾ
- Bicep ഫയലുകളിലെ സിന്റാക്സ് പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 ഡിപ്പ്ലോയ്മെന്റ് പരാജയങ്ങൾ

### പ്രശ്നം: ബിൽഡ് പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ഡിപ്പ്ലോയ്മെന്റ് സമയത്ത് ആപ്ലിക്കേഷൻ ബിൽഡ് ചെയ്യാൻ കഴിയുന്നില്ല
- പാക്കേജ് ഇൻസ്റ്റലേഷൻ പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### പ്രശ്നം: കണ്ടൈനർ ഡിപ്പ്ലോയ്മെന്റ് പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- കണ്ടൈനർ ആപ്പുകൾ ആരംഭിക്കാൻ കഴിയില്ല
- ഇമേജ് പുൾ പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### പ്രശ്നം: ഡേറ്റാബേസ് കണക്ഷൻ പരാജയങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ആപ്ലിക്കേഷൻ ഡേറ്റാബേസുമായി കണക്ട് ചെയ്യാനാകുന്നില്ല
- കണക്ഷൻ ടൈം ഔട്ട് പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ

### പ്രശ്നം: പരിസ്ഥിതി വேரിയബിളുകൾ പ്രവർത്തിക്കാതെ പോകുന്നു
**ലക്ഷണങ്ങൾ:**
- ആപ്പ് കോൺഫിഗറേഷൻ മൂല്യങ്ങൾ വായിക്കാനാകുന്നില്ല
- പരിസ്ഥിതി വേരിയബിളുകൾ ശൂന്യമാണെന്നു തോന്നുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### പ്രശ്നം: SSL/TLS സർട്ടിഫിക്കറ്റ് പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- HTTPS പ്രവർത്തിക്കുന്നില്ല
- സർട്ടിഫിക്കറ്റ് സാധുത പരിശോധന പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### പ്രശ്നം: CORS കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- ഫ്രണ്ട്‌എൻഡ് API ഇടപാട് ചെയ്യാൻ കഴിയുന്നില്ല
- ക്രോസ്-ഓറിജിൻ അഭ്യര്‍ഥന തടഞ്ഞു

**പരിഹാരങ്ങൾ:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. നിങ്ങളുടെ നിലവിലുള്ള Express ആപ്ലിക്കേഷൻ അപ്ഡേറ്റ് ചെയ്യുക (with `cors` ഇംപോർട്ടുചെയ്ത്):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 പരിസ്ഥിതി മാനേജ്‌മെന്റ് പ്രശ്നങ്ങൾ

### പ്രശ്നം: പരിസ്ഥിതി മാറൽ പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- തെറ്റായ പരിസ്ഥിതി ഉപയോഗിക്കുന്നു
- കോൺഫിഗറേഷൻ ശരിയായി മാറുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### പ്രശ്നം: പരിസ്ഥിതി കേടുപാടുകൾ
**ലക്ഷണങ്ങൾ:**
- പരിസ്ഥിതി അസാധുവായ നില കാണിക്കുന്നു
- റിസോഴ്‌സുകൾ കോൺഫിഗറേഷനുമായി പൊരുത്തപ്പെടുന്നില്ല

**പരിഹാരങ്ങൾ:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 പ്രകടന പ്രശ്നങ്ങൾ

### പ്രശ്നം: ഡിപ്പ്ലോയ്മെന്റ് സമയം വൈകി
**ലക്ഷണങ്ങൾ:**
- ഡിപ്പ്ലോയ്മെന്റുകൾ വേണ്ടിയുള്ള സമയവും കൂടുന്നു
- ഡിപ്പ്ലോയ്മെന്റ് സമയത്ത് ടൈംഔട്ട്

**പരിഹാരങ്ങൾ:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### പ്രശ്നം: ആപ്ലിക്കേഷൻ പ്രകടന പ്രശ്നങ്ങൾ
**ലക്ഷണങ്ങൾ:**
- പ്രതികരണ സമയം മന്ദമാണ്
- ഉയർന്ന റിസോഴ്‌സ് ഉപയോഗം

**പരിഹാരങ്ങൾ:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ പ്രശ്നപരിഹാര ഉപകരണങ്ങളും കമാൻഡുകളും

### ഡിബഗ് കമാൻഡുകൾ
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ലോഗ് വിശകലനം
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### റിസോഴ്‌സ് പരിശോധന
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 അധിക സഹായം നേടുക

### എപ്പോൾ ഉയർത്തണം
- എല്ലാ പരിഹാരങ്ങളും ശ്രമിച്ചതിനുശേഷവും ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ തുടരുന്നു
- Azure സേവനങ്ങളുടെ ഇൻഫ്രാസ്ട്രക്ഷർ പ്രശ്നങ്ങൾ
- ബില്ലിംഗ് അല്ലെങ്കിൽ സബ്സ്ക്രിപ്ഷൻ സംബന്ധിച്ച പ്രശ്നങ്ങൾ
- സുരക്ഷാ ആശങ്കകൾ അല്ലെങ്കിൽ സംഭവങ്ങൾ

### സഹായ ചാനലുകൾ
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ശേഖരിക്കേണ്ട വിവരങ്ങൾ
സഹായം തേടുന്നതിന് മുമ്പ് ശേഖരിക്കുക:
- `azd version` ഔട്ട്പുട്ട്
- `azd config show` ഔട്ട്പുട്ട്
- `azd show` ഔട്ട്പുട്ട് (നിലവിലെ ഡിപ്പ്ലോയ്മെന്റ് സ്ഥിതി)
- പിശക് സന്ദേശങ്ങൾ (പൂർണ്ണ പാഠം)
- പ്രശ്നം പുനഃപ്രസരിപ്പിക്കാനുള്ള നടപടികൾ
- ഡാറ്റകൾ റിഡാക്റ്റ് ചെയ്ത പരിസ്ഥിതി വിവരങ്ങൾ (മൂല `azd env get-values` ഒരിക്കലും പങ്കിടേണ്ടതില്ല, രഹസ്യങ്ങൾ അടങ്ങിയ 있을ാവുന്നതാണ്)
- പ്രശ്നം ആരംഭിച്ച തിയതി

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 പ്രശ്നം തടയൽ

### പ്രീ-ഡിപ്പ്ലോയ്മെന്റ് ചെക്ക്ലിസ്റ്റ്
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### മോണിറ്ററിംഗ് ക്രമീകരണം
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### സാധാരണ പരിപാലനം
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## ബന്ധപ്പെട്ട വിഭവങ്ങൾ

- [ഡിബഗ്ഗിംഗ് ഗൈഡ്](debugging.md) - പുരോഗമന ഡിബഗ്ഗിംഗ് സാങ്കേതികവിദ്യകൾ
- [പ്രൊവിഷനിംഗ് റിസോഴ്‌സുകൾ](../chapter-04-infrastructure/provisioning.md) - ഇൻഫ്രാസ്ട്രക്ഷർ പ്രശ്നപരിഹാരം
- [കപ്പാസിറ്റി പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് പ്ലാനിംഗ് മാർഗ്ഗനിർദേശങ്ങൾ
- [SKU തിരഞ്ഞെടുപ്പ്](../chapter-06-pre-deployment/sku-selection.md) - സർവീസ് ടയർ ശിപാർശകൾ

---

**ടിപ്പ്**: ഈ ഗൈഡ് ബുക്ക്മാർക്ക് ചെയ്ത് പ്രശ്നങ്ങൾ നേരിടുമ്പോൾ അവയെ സമീപിച്ച് കാണാൻ ശീലിക്കുക. പല പ്രശ്നങ്ങളും നേരത്തേ കാണപ്പെട്ടിട്ടുണ്ട്, അവയ്ക്ക് ഉറപ്പുള്ള പരിഹാരങ്ങൾ ഉണ്ട്!

---

**നവിഗേഷൻ**
- **മുൻപുള്ള പాఠം**: [പ്രൊവിഷനിംഗ് റിസോഴ്‌സുകൾ](../chapter-04-infrastructure/provisioning.md)
- **അടുത്ത പാഠം**: [ഡിബഗ്ഗിംഗ് ഗൈഡ്](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->