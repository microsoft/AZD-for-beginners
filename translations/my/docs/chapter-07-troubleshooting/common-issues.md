# ပေါင်းသင်းကြုံတွေ့ရသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ယခုအခန်း**: အခန်း 7 - ပြဿနာဖြေရှင်းခြင်းနှင့် ချောမွေ့အောင်လုပ်ခြင်း
- **⬅️ ယခင်အခန်း**: [အခန်း 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ နောက်တစ်ခန်း**: [Debugging Guide](debugging.md)
- **🚀 နောက်တစ်ခန်း**: [အခန်း 8: ထုတ်လုပ်မှုနှင့် စက်မှုသုံးပုံစံများ](../chapter-08-production/production-ai-practices.md)

## နိဒါန်း

Azure Developer CLI ကို အသုံးပြုရာတွင် မကြာခဏကြုံတွေ့ရသော ပြဿနာများကို အပြည့်အစုံ လေ့လာနိုင်သည့် ပြဿနာဖြေရှင်းလမ်းညွှန်ဖြစ်သည်။ မှတ်ပုံတင်ခြင်း၊ မျှဝေခြင်း၊ အထောက်အပံ့ပေးခြင်းနှင့် အက်ပလီကေးရှင်း ပြင်ဆင်ခြင်းဆိုင်ရာ စစ်ဆေး၊ ပြသနာရှာဖွေမှုများကို ဉပမာနှင့် အဆင့်လိုက် ဖြေရှင်းနည်းများ စုံလင်စွာ ဖော်ပြထားသည်။

## သင်ယူရန်ရည်မှန်းချက်များ

ဤလမ်းညွှန်အား ပြည့်စုံလျှင်၊ သင်သည်-
- Azure Developer CLI ပြဿနာများအတွက် စစ်ဆေးနည်းများကို ကျွမ်းကျင်လာမည်
- အထွေထွေ မှတ်ပုံတင်ခြင်းနှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပြဿနာများနှင့် ဖြေရှင်းနည်းများကို နားလည်မည်
- မျှဝေရေး မအောင်မြင်မှုများ၊ အထောက်အပံ့ပေးမှု အမှားများနှင့် ပြင်ဆင်ခြင်းပြဿနာများကို ဖြေရှင်းနိုင်မည်
- ကြိုတင်ကြည့်ရှုမည့် စောင့်ကြည့်ခြင်းနှင့် debugging နည်းလမ်းများ ကိုအသုံးပြုနိုင်မည်
- ရှုပ်ထွေးသော ပြဿနာများအတွက် စနစ်တကျ ပြဿနာဖြေရှင်းနည်းများ ကို အသုံးချနိုင်မည်
- နောက်ဆက်တွဲ ပြဿနာကို တားဆီးရန် မှတ်တမ်းတင်စနစ်များနှင့် စောင့်ကြည့်စနစ်များ ကို ထိရောက်စွာ စီမံနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ပြည့်စုံပြီးပါက သင်သည်-
- အဖွဲ့စည်းထဲမှ diagnostic ကိရိယာများ ဖြင့် Azure Developer CLI ပြဿနာများကို ကြည့်စစ်စွမ်းနိုင်မည်
- မှတ်ပုံတင်ခြင်း၊ စာရင်းသွင်းခြင်းနှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်
- မျှဝေရေး မအောင်မြင်မှုများနှင့် အထောက်အပံ့ပေးမှု အမှားများကို ထိရောက်စွာ ပြဿနာဖြေရှင်းနိုင်မည်
- အက်ပလီကေးရှင်း ပြင်ဆင်ခြင်းပြဿနာများနှင့် ပတ်ဝန်းကျင်အထူးပြဿနာများကို debugging နှင့် တိကျစွာရှာဖွေနိုင်မည်
- ဖြစ်နိုင်သော ပြဿနာများကို ကြိုတင်အသိပေးရန် စောင့်ကြည့်ခြင်းနှင့် အသိပေးချက်များ ထားရှိနိုင်မည်
- မှတ်တမ်းတင်ခြင်း၊ debugging နှင့် ပြဿနာဖြေရှင်းခြင်း လုပ်ငန်းစဉ်များအတွက် အကောင်းဆုံး လေ့လာမှုများကို အသုံးပြုနိုင်မည်

## အမြန်ဆုံး စစ်ဆေးခြင်း

> ဥပမာ အမည်များ/ID များကို သင်၏ ပတ်ဝန်းကျင်တန်ဖိုးများဖြင့် လဲလှယ်ပါ။ Bash, Bicep, JavaScript နှင့် parameter-file အပိုင်းအစများ အကြီးအကျယ် သတ်မှတ်ထားသည်။ ၎င်းတို့သည် တစ်ခုတည်းသောဖိုင်မဟုတ်ပါ။ ထိခိုက်မှုများကို စစ်ဆေးပြီး လျှို့ဝှက်ချက်များ ဖျက်ပါ။ `azd monitor --logs` သည် browser ကို ဖွင့်ပြီး terminal log များကို မလွှင့်ပါ။

သီးခြား ပြဿနာများသို့ ဝင်ရန်မပြီမမီ၊ diagnostic အချက်အလက်များ စုဆောင်းရန် အောက်ပါ command များကို ပြေးပါ:

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

## မှတ်ပုံတင်ခြင်းဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: "Access token တောင်းယူမရခြင်း"
**ရလဒ်များ:**
- `azd up` သည် မှတ်ပုံတင်ခြင်း အမှားများဖြင့် မအောင်မြင်
- ဖြည့်စွက် command များတွင် "unauthorized" သို့မဟုတ် "access denied" ပြသ

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: မျှဝေရေးအတွင်း "အခွင့်အရေး မလုံလောက်မှု"
**ရလဒ်များ:**
- မျှဝေရေးမအောင်မြင်ခြင်း permission error များကြားရ
- တချို့ Azure အရင်းအမြစ်ကို မဖန်တီးနိုင်ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### ပြဿနာ: Multi-tenant မှတ်ပုံတင်ခြင်း ပြဿနာများ
**ဖြေရှင်းနည်းများ:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ အဆောက်အအုံ တည်ဆောက်ခြင်း စနစ်ပြဿနာများ

### ပြဿနာ: အရင်းအမြစ်အမည် တူညီမှု
**ရလဒ်များ:**
- "The resource name already exists" အမှားများ
- အရင်းအမြစ် ဖန်တီးရာတွင် မျှဝေရေးမအောင်မြင်ခြင်း

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: တည်နေရာ/ဒေသ မရရှိနိုင်ခြင်း
**ရလဒ်များ:**
- "The location 'xyz' is not available for resource type" အမှား
- ရွေးချယ်ထားသော ဒေသတွင် တချို့ SKU မရရှိနိုင်မှု

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

တည်နေရာ ပြောင်းလဲခြင်းသည် ရှိပြီးသော အရင်းအမြစ်များကို မရွှေ့ပြောင်းပါ။ ရှိပြီးသော resource group သို့ resource များသည် တည်နေရာပြောင်းခြင်းကို ငြင်းဆန်နိုင်သည်။ ဒေသအလိုက် ထပ်မံ မျှဝေလိုပါက သီးခြားပတ်ဝန်းကျင် တစ်ခုကို အသုံးပြုပါ။

### ပြဿနာ: Quota ကျော်လွန်မှု အမှား
**ရလဒ်များ:**
- "Quota exceeded for resource type" အမှား
- "Maximum number of resources reached" ပြဿနာ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

ဖွံ့ဖြိုးရေးအတွက် `infra/main.parameters.json` တွင် ပံ့ပိုးထားသော ပိုသေးငယ်သော SKU ကို ရွေးချယ်ပါ:

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

### ပြဿနာ: Bicep template အမှားများ
**ရလဒ်များ:**
- Template စစ်ဆေးမှု မအောင်မြင်မှုများ
- Bicep ဖိုင်များ၌ အချက်အလက် သင့်မဟုတ်ခြင်းများ

**ဖြေရှင်းနည်းများ:**
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

## 🚀 မျှဝေမှု မအောင်မြင်မှုများ

### ပြဿနာ: တည်ဆောက်မှု မအောင်မြင်ခြင်း
**ရလဒ်များ:**
- မျှဝေရေး အတွင်း အက်ပလီကေးရှင်း တည်ဆောက်မှု မအောင်မြင်ခြင်း
- Package installation အမှားများ

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: container မျှဝေရေး မအောင်မြင်မှု
**ရလဒ်များ:**
- container app မစဖွင့်နိုင်ခြင်း
- image pull အမှားများ

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Database ချိတ်ဆက်မှု မအောင်မြင်ခြင်း
**ရလဒ်များ:**
- အက်ပလီကေးရှင်းမှ database ချိတ်ဆက် မရခြင်း
- ချိတ်ဆက်မှု အချိန်ကုန်ခြင်း အမှားများ

**ဖြေရှင်းနည်းများ:**
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

## 🔧 ပြင်ဆင်မှုဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: ပတ်ဝန်းကျင် မတူညီမှုများ တတ်နိုင်ခြင်း
**ရလဒ်များ:**
- အက်ပလီကေးရှင်းသည် ပြင်ဆင်မှုတန်ဖိုးများကို မဖတ်ရှုနိုင်ခြင်း
- ပတ်ဝန်းကျင် မတူညီမှုများ အသားငယ်နေခြင်း

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: SSL/TLS လက်မှတ်ဆိုင်ရာ ပြဿနာများ
**ရလဒ်များ:**
- HTTPS မလည်ပတ်ခြင်း
- လက်မှတ် စစ်ဆေး မအောင်မြင်ခြင်းများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ပြဿနာ: CORS ပြဿနာများ
**ရလဒ်များ:**
- Frontend မှ API ကို ခေါ်ဆိုရန် မလုပ်နိုင်ခြင်း
- Cross-origin request တားမြစ်ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. သင်၏ ရှိပြီးသား Express application ကို ( `cors` ကို import ပြုလုပ်ပြီး ) update လုပ်ပါ။

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

## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု ပြဿနာများ

### ပြဿနာ: ပတ်ဝန်းကျင်ပြောင်းလဲမှု ပြဿနာများ
**ရလဒ်များ:**
- မှားသော ပတ်ဝန်းကျင် အသုံးပြုခြင်း
- ပြင်ဆင်မှု မမှန်ကန်စွာ ပြောင်းလဲခြင်း

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: ပတ်ဝန်းကျင် ပျက်စီးမှု
**ရလဒ်များ:**
- ပတ်ဝန်းကျင်သည် တရားမဝင် အခြေအနေ ပြသခြင်း
- အရင်းအမြစ်များသည် ပြင်ဆင်မှုနှင့် ကိုက်ညီမှု မရှိခြင်း

**ဖြေရှင်းနည်းများ:**
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

## 🔍 လုပ်ဆောင်မှုဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: မျှဝေရေး အချိန် တောင့်သောမှု
**ရလဒ်များ:**
- မျှဝေမှုများ အချိန် မလုံလောက်စွာကြာခြင်း
- မျှဝေမှု အတွင်း အချိန်ကုန်ဆုံးခြင်း

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: အက်ပလီကေးရှင်း လုပ်ဆောင်ချက် နည်းပါးခြင်း
**ရလဒ်များ:**
- တုံ့ပြန်မှု နှေးကွေးခြင်း
- အရင်းအမြစ် အသုံးပြုမှု များပြားခြင်း

**ဖြေရှင်းနည်းများ:**
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

## 🛠️ ပြဿနာရှာဖွေရေး ကိရိယာများနှင့် command များ

### Debugging command များ
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

### Log ရှာဖွေရေး
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

### အရင်းအမြစ် စုံစမ်းစစ်ဆေးခြင်း
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ပိုမိုကူညီမှု ရယူခြင်း

### ဘယ်အချိန်တွင် တောင်းဆိုရမည်နည်း
- ပြဿနာက သွက်လက်မှုတိုင်းဖြေရှင်းပြီးလည်း မှတ်ပုံတင်ခြင်း ပြဿနာ ဆက်လက် ရှိနေပါက
- Azure ဝန်ဆောင်မှုဆိုင်ရာ အထောက်အပံ့ပြဿနာများ
- ဘီလ်ချောင်းခြင်း သို့မဟုတ် စာရင်းသွင်းခြင်း ဆိုင်ရာ ပြဿနာများ
- လုံခြုံရေး ဆိုင်ရာ အာရုံစိုက်စရာ ထိခိုက်မှုများ သို့မဟုတ် ဖြစ်ရပ်များ

### အထောက်အပံ့ လမ်းကြောင်းများ
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

### စုဆောင်းရမည့် အချက်အလက်များ
အထောက်အပံ့ဆက်သွယ်မည့်အရှေ့မှ ဖော်စပ်ထားရန်
- `azd version` ထွက်လာသော အချက်အလက်
- `azd config show` ထွက်လာသော အချက်အလက်
- `azd show` ထွက်လာသော အချက်အလက် (လက်ရှိ မျှဝေမှု အခြေအနေ)
- အမှားစာသား (ပြည့်စုံ)
- ပြဿနာကို ထပ်မံ ဖန်တီး၍ ပြန်လည် ဖော်ပြပါ
- ပတ်ဝန်းကျင်အသေးစိတ်ကို ဖယ်ရှားထားသည် (အမြဲ raw `azd env get-values` ကို မမျှဝေရန်၊ အဲဒါထဲတွင် လျှို့ဝှက်ချက်များ ပါဝင်နိုင်သည်)
- ပြဿနာ စတင်ပွားပေါက်ချိန်ဇယား

### မှတ်တမ်းစုဆောင်းရေး Script
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

## 📊 ပြဿနာကာကွယ်ခြင်း

### စတင်တပ်ဆင်ခြင်း မတိုင်မီ စစ်ဆေးရမည့်စာရင်း
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

### စောင့်ကြည့်ရေး စနစ်တပ်ဆင်ခြင်း
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

### ပုံမှန် ပြုပြင်ထိန်းသိမ်းခြင်း
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## ဆက်စပ်သတင်းအချက်အလက်များ

- [ဖော်ထုတ်ဖြေရှင်းခြင်း လမ်းညွှန်](debugging.md) - တိုးတက်သော ဖော်ထုတ်ဖြေရှင်းနည်းများ
- [ကုန်ကျငွေမြှင့်တင်မှု ချမွတ်မှု](../chapter-04-infrastructure/provisioning.md) - အခြေခံအဆောက်အအုံ ပြဿနာဖြေရှင်းခြင်း
- [စွမ်းဆောင်ရည်အစီအစဉ်](../chapter-06-pre-deployment/capacity-planning.md) - စွမ်းရည်အစီအစဉ် ညွှန်ကြားချက်များ
- [SKU ရွေးချယ်ခြင်း](../chapter-06-pre-deployment/sku-selection.md) - ဝန်ဆောင်မှု အဆင့် အကြံပြုချက်များ

---

**အကြံပြုချက်**: ဤလမ်းညွှန်ကို စာရင်းသွင်းထားပြီး ပြဿနာတက်လာသောအခါတွင် ဆက်လက်လေ့လာပါ။ များသောပြဿနာများသည် မပြီးဆုံးမီ ရှု့ဖူးပြီး ဖြေရှင်းချက်ရှိနေသည်!

---

**လမ်းညွှန်မှု**
- **ယခင်သင်ခန်းစာ**: [ကုန်ကျငွေမြှင့်တင်မှု ချမွတ်မှု](../chapter-04-infrastructure/provisioning.md)
- **နောက်တရက်သင်ခန်းစာ**: [ဖော်ထုတ်ဖြေရှင်းခြင်း လမ်းညွှန်](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->