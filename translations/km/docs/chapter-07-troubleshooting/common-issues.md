# បញ្ហាប្រឈមទូទៅ និងដំណោះស្រាយ

**ការរុករកទីតាំងជំពូក៖**
- **📚 ទំព័រដើមវគ្គ**: [AZD សម្រាប់អ្នកថ្មី](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 7 - ការរំខាន និង ការកែសម្រួលកំហុស
- **⬅️ ជំពូកមុន**: [ជំពូក 6: ការត្រួតពិនិត្យមុនហោះហើរ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ បន្ទាប់**: [មគ្គុទេសក៍កែសម្រួលកំហុស](debugging.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 8: គំរូផលិតកម្ម និង សហគ្រិន](../chapter-08-production/production-ai-practices.md)

## ការណែនាំ

មគ្គុទេសក៍កែសម្រួលកំហុសនេះគ្របដណ្តប់បញ្ហាទូទៅដែលជួបប្រទៈបំផុតពេលប្រើ Azure Developer CLI។ ជ្រាបពីរបៀបវាយតម្លៃ កែសម្រួល និងដោះស្រាយបញ្ហាតាមទម្លាប់ជាមួយការផ្ទៀងផ្ទាត់ អនុញ្ញាត ការតម្លើង​, ការផ្តល់ឱ្យដោយសភា និង ការកំណត់អនុវត្តកម្មវិធី។ ពីរបញ្ហាទាំងអស់មានរាយនាមអំពីរលក្ខណៈរោលរាល មូលហេតុ និងនីតិវិធីដោះស្រាយជាលំដាប់ជំហាន។

## គោលបំណងការស្វែងយល់

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹង៖
- ឯកទេសពីរបៀបវាយតម្លៃបញ្ហា Azure Developer CLI
- យល់ដឹងពីបញ្ហាអនុញ្ញាត និងការអនុញ្ញាតទូទៅ និងដំណោះស្រាយរបស់វា
- ដោះស្រាយបញ្ហា​ការផ្ទុក, កំហុសផ្តល់ដោយសភា និងបញ្ហាការកំណត់លក្ខណៈ
- អនុវត្តវិធីសាស្ត្រត្រួតពិនិត្យ និងកែសម្រួលជាមុន
- ប្រើវិធីសាស្ត្រកែសម្រួលបញ្ហាដោយមានរបៀបរៀបចំសម្រាប់បញ្ហាស្មុគស្មាញ
- កំណត់កំណត់ត្រា និងការត្រួតពិនិត្យសមរម្យដើម្បីទប់ស្កាត់បញ្ហាក្រោយ

## លទ្ធផលការស្វែងយល់

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- វាយតម្លៃបញ្ហា Azure Developer CLI ដោយប្រើឧបករណ៍វាយតម្លៃក្នុងខ្លួន
- ដោះស្រាយបញ្ហាអនុញ្ញាត, ការជាវ និងទាក់ទងនឹងការអនុញ្ញាតដោយដោយឯករាជ្យ
- កែសម្រួលបញ្ហាការផ្ទុក និងកំហុសផ្តល់ដោយសភាដោយមានប្រសិទ្ធភាព
- កែសម្រួលបញ្ហាកំណត់អនុវត្តកម្មវិធី និងបញ្ហាគ្រប់ពិសេសបរិយាកាស
- អនុវត្តការត្រួតពិនិត្យ និងរោទកដើម្បីរកឃើញបញ្ហាផ្លូវមុន
- ប្រើប្រាស់ការអនុវត្តល្អបំផុតសម្រាប់កំណត់ត្រា កែសម្រួល និងការ​ដោះស្រាយបញ្ហា

## វិធីសាស្ត្រវាយតម្លៃរហ័ស

> ជំនួសឈ្មោះ/លេខសម្គាល់គំរូជាមួយតម្លៃបរិយាកាសរបស់អ្នក។ ភាគទេស Bash, Bicep, JavaScript និងឯកសារ​ព៉ារ៉ាម៉ែត្រ​ត្រូវបានស្លាកបំបែកខុសគ្នា ខ្ទង់Scriptនេះមិនមែនជា Script ធ្វើបានមួយទេ។ សូមពិនិត្យប្រតិបត្តិការឧបសគ្គ និងលុបចោលសម្ងាត់មុនចែករំលែកវិភាគ ។ `azd monitor --logs` បើកកម្មវិធីរុករកមិនភ្ជាប់ចាក់បញ្ចូលកំណត់ត្រាតែម្តងទេ។

មុនបញ្ចូលលម្អិតបញ្ហា ប្រតិបត្តិការបញ្ជាខាងក្រោមដើម្បីប្រមូលព័ត៌មាន វិភាគ៖

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

## បញ្ហាអនុញ្ញាត

### បញ្ហា៖ "បរាជ័យក្នុងការទទួលបានកាតសម្រាប់ចូលប្រើ"
**រោលរាល៖**
- `azd up` បរាជ័យដោយកំហុសអនុញ្ញាត
- ពាក្យបញ្ជាបញ្ចេញ "ហាមឃាត់" ឬ "ហាមឃាត់ចូល"

**ដំណោះស្រាយ៖**
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

### បញ្ហា៖ "អំណាចមិនគ្រប់គ្រាន់" ខណៈពេលផ្ទុក
**រោលរាល៖**
- ការផ្ទុកបរាជ័យដោយកំហុសសិទ្ធិ
- មិនអាចបង្កើតធនធាន Azure មួយចំនួន

**ដំណោះស្រាយ៖**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### បញ្ហា៖ បញ្ហាអនុញ្ញាតច្រើនអ្នកជួល
**ដំណោះស្រាយ៖**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ កំហុសផ្តល់ដោយសភា

### បញ្ហា៖ បញ្ហាឈ្មោះធនធានដដែល
**រោលរាល៖**
- កំហុស "ឈ្មោះធនធានមានរួចហើយ"
- ការផ្ទុកបរាជ័យខណៈពេលបង្កើតធនធាន

**ដំណោះស្រាយ៖**
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

### បញ្ហា៖ ទីតាំង/តំបន់មិនអាចប្រើបាន
**រោលរាល៖**
- "ទីតាំង 'xyz' មិនអាចប្រើបានសម្រាប់ប្រភេទធនធាន"
- SKU មួយចំនួនមិនមាននៅតំបន់ដែលបានជ្រើស

**ដំណោះស្រាយ៖**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

ការផ្លាស់ប្ដូរតម្លៃទីតាំងមិនបម្លែងធនធានដែលមានរួចទេ។ ក្រុមធនធានឬធនធានដែលមានស្រាប់អាចបដិសេធការផ្លាស់ទីតាំង; ប្រើបរិយាកាសផ្សេងសម្រាប់ការផ្ទុកឡើងវិញតំបន់។

### បញ្ហា៖ កំហុសលើគោលដៅសមត្ថភាពលើស
**រោលរាល៖**
- "គោលដៅលើសសម្រាប់ប្រភេទធនធាន"
- "ចំនួនលើសសម្រាប់ធនធាន"

**ដំណោះស្រាយ៖**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

សម្រាប់ការអភិវឌ្ឍ ការជ្រើស SKU តូចជាងគេបានគាំទ្រ នៅក្នុង `infra/main.parameters.json`:

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

### បញ្ហា៖ កំហុសគំរូ Bicep
**រោលរាល៖**
- ការបរាជ័យក្នុងការត្រួតពិនិត្យគំរូ
- កំហុសវចនានុក្រមក្នុងឯកសារ Bicep

**ដំណោះស្រាយ៖**
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

## 🚀 ការផ្ទុកបរាជ័យ

### បញ្ហា៖ ការបិទបង្កើតបរាជ័យ
**រោលរាល៖**
- កម្មវិធីបរាជ័យក្នុងការបង្កើតខណៈពេលផ្ទុក
- កំហុសក្នុងការតំឡើងកញ្ចប់

**ដំណោះស្រាយ៖**
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

### បញ្ហា៖ ការផ្ទុកកុងតឺន័របរាជ័យ
**រោលរាល៖**
- កម្មវិធីកុងតឺន័របរាជ័យក្នុងការចាប់ផ្ដើម
- កំហុសទាញរូបភាព

**ដំណោះស្រាយ៖**
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

### បញ្ហា៖ ការតភ្ជាប់មួយទៅមូលដ្ឋានទិន្នន័យបរាជ័យ
**រោលរាល៖**
- កម្មវិធីមិនអាចភ្ជាប់ទៅមូលដ្ឋានទិន្នន័យ
- កំហុសពេលវេលាកំណត់ភ្ជាប់

**ដំណោះស្រាយ៖**
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

## 🔧 បញ្ហាការកំណត់ការ

### បញ្ហា៖ អថេរបរិយាកាសមិនដំណើរការ
**រោលរាល៖**
- កម្មវិធីមិនអាចអានតម្លៃកំណត់ការ
- អថេរបរិយាកាសបង្ហាញថាវាវិញ្ញាបនបត្រពុំមានអ្វីទេ

**ដំណោះស្រាយ៖**
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

### បញ្ហា៖ បញ្ហាសញ្ញាបត្រ SSL/TLS
**រោលរាល៖**
- HTTPS មិនដំណើរការ
- កំហុសការត្រួតពិនិត្យសញ្ញាបត្រ

**ដំណោះស្រាយ៖**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### បញ្ហា៖ បញ្ហាការកំណត់ CORS
**រោលរាល៖**
- ផ្នែកមុខមិនអាចហៅ API
- សំណើឆ្លងដែនត្រូវបានរារាំង

**ដំណោះស្រាយ៖**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. បិទបន្តាកម្មវិធី Express ដែលមានស្រាប់របស់អ្នក (ដោយនាំចូល `cors`):

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

## 🌍 បញ្ហាការគ្រប់គ្រងបរិយាកាស

### បញ្ហា៖ បញ្ហាការប្ដូរបរិយាកាស
**រោលរាល៖**
- ប្រើបរិយាកាសខុស
- ការកំណត់មិនបានប្ដូរផ្អែកល្អ

**ដំណោះស្រាយ៖**
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

### បញ្ហា៖ បរិយាកាសខូចខាត
**រោលរាល៖**
- បរិយាកាសបង្ហាញស្ថានភាពមិនត្រឹមត្រូវ
- ធនធានមិនត្រូវនឹងការកំណត់ការ

**ដំណោះស្រាយ៖**
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

## 🔍 បញ្ហាផលិតភាព

### បញ្ហា៖ ពេលវេលាផ្ទុកយឺត
**រោលរាល៖**
- ការផ្ទុកចាំយូរពេក
- ការចាំនៅពេលផ្ទុក

**ដំណោះស្រាយ៖**
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

### បញ្ហា៖ បញ្ហាផលិតភាពកម្មវិធី
**រោលរាល៖**
- ពេលប្រតិកម្មយឺត
- ការប្រើប្រាស់ធនធានខ្ពស់

**ដំណោះស្រាយ៖**
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

## 🛠️ ឧបករណ៍និងបញ្ជាការកែសម្រួលកំហុស

### បញ្ជាការកែសម្រួលកំហុស
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

### វិភាគកំណត់ត្រា
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

### ស៊ើបអង្កេតធនធាន
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ទទួលជំនួយបន្ថែម

### ពេលវេលាដែលត្រូវបន្ថែមកំឡាំង
- បញ្ហាអនុញ្ញាតបន្តបន្ទាប់ពីបានសាកល្បងដំណោះស្រាយទាំងអស់
- បញ្ហាផ្លូវតំណរភ្ជាប់ទៅសេវាកម្ម Azure
- បញ្ហាអំពីវិក្កយបត្រឬការជាវ
- បញ្ហាសម្របសម្រួលសុវត្ថិភាពឬគ្រោះថ្នាក់

### បណ្តាញគាំទ្រ
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

### ព័ត៌មានដែលត្រូវប្រមូល
មុនពេលទាក់ទងគាំទ្រ សូមប្រមូល៖
- លទ្ធផល `azd version`
- លទ្ធផល `azd config show`
- លទ្ធផល `azd show` (ស្ថានភាពផ្ទុកបច្ចុប្បន្ន)
- សារកំហុស (អត្ថបទពេញលេញ)
- ជំហានដើម្បីបង្កើតបញ្ហា
- ព័ត៌មានបរិយាកាសដែលបានលុបចោល (មិនដែលចែករំលែក `azd env get-values` រៀងរាល់ពេលមានសម្ងាត់)
- រយៈពេលចាប់ផ្ដើមបញ្ហា

### Script ប្រមូលកំណត់ត្រា
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

## 📊 ការការពារបញ្ហា

### បញ្ជីត្រួតពិនិត្យមុនការផ្ទុក
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

### ការតំឡើងការត្រួតពិនិត្យ
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

### ការថែទាំទៀងទាត់
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## ធនធានដែលទាក់ទង

- [មគ្គុទេសក៍កែសម្រួលកំហុស](debugging.md) - វិធីសាស្ត្រកែសម្រួលកំហុសកម្រិតខ្ពស់
- [ការផ្តល់ឱ្យធនធាន](../chapter-04-infrastructure/provisioning.md) - ការកែសម្រួលបញ្ហាផ្លូវតំណរ
- [ការធ្វើផែនការកម្លាំង](../chapter-06-pre-deployment/capacity-planning.md) - និស្ស័យផែនការសម្ភារៈ
- [ជ្រើសរើសSKU](../chapter-06-pre-deployment/sku-selection.md) - ផ្នែកផ្តល់យោងថ្នាក់សេវា

---

**គន្លឹះ**៖ រក្សាមគ្គុទេសក៍នេះជាសៀវភៅចំណាំ និងយោងវាយ៉ាងសក្តានុពលពេលដែលអ្នកប្រឈមមុខបញ្ហា។ បញ្ហាច្រើនត្រូវបានឃើញមុនហើយមានដំណោះស្រាយថេររួច!

---

**ការរុករក**
- **មេរៀនមុន**៖ [ការផ្តល់ឱ្យធនធាន](../chapter-04-infrastructure/provisioning.md)
- **មេរៀនបន្ទាប់**៖ [មគ្គុទេសក៍កែសម្រួលកំហុស](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->