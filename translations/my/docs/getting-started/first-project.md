# သင်၏ ပထမဆုံး Project - လက်တွေ့လေ့ကျင့်ခန်း သင်ခန်းစာ

**အခန်း လမ်းကြောင်း:**
- **📚 သင်ခန်းစာ အိမ်**: [AZD အခြေခံသင်ခန်းစာ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်**: [Installation & Setup](installation.md)
- **➡️ နောက်တစ်ခု**: [Configuration](configuration.md)
- **🚀 နောက်အခန်း**: [အခန်း ၂: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## မိတ်ဆက်

Azure Developer CLI project ကို စတင်ကြိုဆိုပါတယ်! ဒီလက်တွေ့လေ့ကျင့်ခန်း သင်ခန်းစာမှာ React frontend, Node.js API backend, MongoDB database ပါဝင်တဲ့ အပြည့်အစုံ application ကို Azure ပေါ်မှာ ဖန်တီး၊ တင်သွင်း၊ စီမံခန့်ခွဲခြင်းအထိ လမ်းညွှန်ပေးပါမည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်စွာ လုပ်ဆောင်ပြီးနောက်တွင်:
- azd project initialization workflow ကို template များဖြင့် ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- Azure Developer CLI project structure နှင့် configuration ဖိုင်များကို နားလည်နိုင်မည်
- Azure ပေါ်တွင် application တစ်ခုလုံးကို infrastructure provisioning ဖြင့် deploy လုပ်နိုင်မည်
- application update နှင့် redeployment strategy များကို အကောင်အထည်ဖော်နိုင်မည်
- development နှင့် staging အတွက် environment များစီမံနိုင်မည်
- resource cleanup နှင့် cost management လုပ်ဆောင်နိုင်မည်

## သင်ယူရမည့် ရလဒ်များ

သင်ခန်းစာပြီးမြောက်ပြီးနောက်တွင်:
- Template များမှ azd project များကို ကိုယ်တိုင် initialize နှင့် configure လုပ်နိုင်မည်
- azd project structure များကို သက်ဆိုင်ရာ ပြင်ဆင်နိုင်မည်
- Azure ပေါ်တွင် full-stack application များကို single command ဖြင့် deploy လုပ်နိုင်မည်
- deployment နှင့် authentication ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- deployment အဆင့်များအတွက် Azure environment များစီမံနိုင်မည်
- application update များအတွက် continuous deployment workflow များကို အကောင်အထည်ဖော်နိုင်မည်

## စတင်ခြင်း

### လိုအပ်ချက်များ စစ်ဆေးရန်
- ✅ Azure Developer CLI install လုပ်ပြီး ([Installation Guide](installation.md))
- ✅ Azure CLI install လုပ်ပြီး authentication ပြုလုပ်ထား
- ✅ Git ကို သင့်စနစ်တွင် install လုပ်ထား
- ✅ Node.js 16+ (ဒီသင်ခန်းစာအတွက်)
- ✅ Visual Studio Code (အကြံပြုထားသည်)

### သင့် Setup ကို စစ်ဆေးပါ
```bash
# azd တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version
```
### Azure authentication ကို စစ်ဆေးပါ

```bash
az account show
```

### Node.js version ကို စစ်ဆေးပါ
```bash
node --version
```

## အဆင့် ၁: Template ရွေးချယ်ပြီး Initialize လုပ်ပါ

React frontend နှင့် Node.js API backend ပါဝင်တဲ့ todo application template ကို စတင်ပါ။

```bash
# ရရှိနိုင်သော template များကိုကြည့်ရှုပါ
azd template list

# todo app template ကို initialize လုပ်ပါ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# အညွှန်းများကိုလိုက်နာပါ:
# - ပတ်ဝန်းကျင်အမည်ကိုထည့်သွင်းပါ: "dev"
# - subscription ကိုရွေးချယ်ပါ (သင်မှာအများအပြားရှိပါက)
# - ဒေသကိုရွေးချယ်ပါ: "East US 2" (သို့မဟုတ်သင်နှစ်သက်သောဒေသ)
```

### ဘာတွေဖြစ်ခဲ့သလဲ?
- Template code ကို သင့် local directory သို့ download လုပ်ခဲ့သည်
- `azure.yaml` ဖိုင်ကို service definitions ဖြင့် ဖန်တီးခဲ့သည်
- `infra/` directory တွင် infrastructure code ကို စီစဉ်ခဲ့သည်
- Environment configuration ကို ဖန်တီးခဲ့သည်

## အဆင့် ၂: Project Structure ကို စူးစမ်းပါ

azd ဖန်တီးထားသော အရာများကို စစ်ဆေးကြည့်ပါ:

```bash
# ပရောဂျက်ဖွဲ့စည်းမှုကိုကြည့်ပါ
tree /f   # ဝင်းဒိုး
# သို့မဟုတ်
find . -type f | head -20   # macOS/Linux
```

သင်တွေ့ရမည့်အရာများ:
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

### နားလည်ရန် အရေးကြီးသော ဖိုင်များ

**azure.yaml** - azd project ရဲ့ အဓိက:
```bash
# ပရောဂျက်ဖွဲ့စည်းမှုကိုကြည့်ပါ
cat azure.yaml
```

**infra/main.bicep** - Infrastructure ကို ဖော်ပြထားသည်:
```bash
# အခြေခံအဆောက်အအုံကုဒ်ကိုကြည့်ပါ
head -30 infra/main.bicep
```

## အဆင့် ၃: Project ကို Customize လုပ်ပါ (Optional)

Deploy လုပ်မည့်အခါ မတိုင်မီ application ကို ပြင်ဆင်နိုင်ပါသည်:

### Frontend ကို ပြင်ဆင်ပါ
```bash
# React app component ကိုဖွင့်ပါ
code src/web/src/App.tsx
```

ရိုးရှင်းသော ပြင်ဆင်မှုတစ်ခုလုပ်ပါ:
```typescript
// ခေါင်းစဉ်ကိုရှာပြီး ပြောင်းပါ
<h1>My Awesome Todo App</h1>
```

### Environment Variables ကို Configure လုပ်ပါ
```bash
# အထူးပတ်ဝန်းကျင်အပြောင်းအလဲများကို သတ်မှတ်ပါ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ပတ်ဝန်းကျင်အပြောင်းအလဲအားလုံးကို ကြည့်ရှုပါ
azd env get-values
```

## အဆင့် ၄: Azure သို့ Deploy လုပ်ပါ

အခုတော့ စိတ်လှုပ်ရှားဖွယ် အပိုင်း - အားလုံးကို Azure သို့ Deploy လုပ်ပါ!

```bash
# အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်းကို တင်သွင်းပါ
azd up

# ဒီအမိန့်က:
# 1. Azure အရင်းအမြစ်များ (App Service, Cosmos DB, စသည်) ကို ပြင်ဆင်ပါ
# 2. သင့်အက်ပလီကေးရှင်းကို တည်ဆောက်ပါ
# 3. ပြင်ဆင်ထားသော အရင်းအမြစ်များသို့ တင်သွင်းပါ
# 4. အက်ပလီကေးရှင်း URL ကို ပြပါ
```

### Deployment အတွင်း ဖြစ်နေသော အရာများ

`azd up` command သည် အောက်ပါအဆင့်များကို လုပ်ဆောင်သည်:
1. **Provision** (`azd provision`) - Azure resources များကို ဖန်တီးသည်
2. **Package** - သင့် application code ကို build လုပ်သည်
3. **Deploy** (`azd deploy`) - Azure resources များသို့ code ကို deploy လုပ်သည်

### မျှော်လင့်ရမည့် Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## အဆင့် ၅: သင့် Application ကို စမ်းသပ်ပါ

### သင့် Application ကို ဝင်ရောက်ကြည့်ပါ
Deployment output မှ URL ကို click လုပ်ပါ၊ သို့မဟုတ် အချိန်မရွေး ရယူနိုင်ပါသည်:
```bash
# အက်ပ်လိပ်စာများကိုရယူပါ
azd show

# သင့်ဘရောက်ဇာတွင်အက်ပ်ကိုဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo App ကို စမ်းသပ်ပါ
1. **Todo item တစ်ခု ထည့်ပါ** - "Add Todo" ကို click လုပ်ပြီး task ထည့်ပါ
2. **Complete အဖြစ် အမှတ်အသားပြုပါ** - ပြီးမြောက်သော items ကို check လုပ်ပါ
3. **Items များကို ဖျက်ပါ** - မလိုအပ်သော todos များကို ဖျက်ပါ

### သင့် Application ကို Monitor လုပ်ပါ
```bash
# သင့်ရဲ့ resources များအတွက် Azure portal ကိုဖွင့်ပါ
azd monitor

# အက်ပလီကေးရှင်း log များကိုကြည့်ပါ
azd logs
```

## အဆင့် ၆: ပြင်ဆင်မှုများလုပ်ပြီး Redeploy လုပ်ပါ

ပြင်ဆင်မှုတစ်ခုလုပ်ပြီး update လုပ်ရလွယ်ကူပုံကို ကြည့်ပါ:

### API ကို ပြင်ဆင်ပါ
```bash
# API ကုဒ်ကို တည်းဖြတ်ပါ
code src/api/src/routes/lists.js
```

Custom response header တစ်ခု ထည့်ပါ:
```javascript
// လမ်းကြောင်းကို ရှာဖွေပြီး ထည့်ပါ။
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Code ပြင်ဆင်မှုများကိုသာ Deploy လုပ်ပါ
```bash
# အက်ဥ်းချုပ်ကိုသာ တင်ဆောင်ပါ (အခြေခံအဆောက်အအုံကို ကျော်လွှားပါ)
azd deploy

# 'azd up' ထက် အလွန်မြန်ဆန်သည်၊ အခြေခံအဆောက်အအုံ ရှိပြီးသားဖြစ်သောကြောင့်
```

## အဆင့် ၇: Multiple Environments ကို စီမံပါ

Production မတိုင်မီ ပြင်ဆင်မှုများကို စမ်းသပ်ရန် staging environment တစ်ခု ဖန်တီးပါ:

```bash
# အဆင့်မြှင့်ပတ်ဝန်းကျင်အသစ်တစ်ခုဖန်တီးပါ
azd env new staging

# အဆင့်မြှင့်ပတ်ဝန်းကျင်သို့ တင်ပို့ပါ
azd up

# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်သို့ ပြန်လည်ပြောင်းပါ
azd env select dev

# ပတ်ဝန်းကျင်အားလုံးကို စာရင်းပြုစုပါ
azd env list
```

### Environment Comparison
```bash
# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကိုကြည့်ရှုပါ
azd env select dev
azd show

# စတေဂျင်းပတ်ဝန်းကျင်ကိုကြည့်ရှုပါ
azd env select staging
azd show
```

## အဆင့် ၈: Resources များကို Clean Up လုပ်ပါ

စမ်းသပ်မှုများပြီးဆုံးပါက အဆက်မပြတ် အခကြေးငွေများ မရှိစေရန် Clean Up လုပ်ပါ:

```bash
# လက်ရှိပတ်ဝန်းကျင်အတွက် Azure အရင်းအမြစ်အားလုံးကို ဖျက်ပါ
azd down

# အတည်ပြုမှုမရှိဘဲ အတင်းဖျက်ပြီး soft-deleted အရင်းအမြစ်များကို ဖျက်ပစ်ပါ
azd down --force --purge

# သတ်မှတ်ထားသောပတ်ဝန်းကျင်ကို ဖျက်ပါ
azd env select staging
azd down --force --purge
```

## သင်လေ့လာခဲ့သော အရာများ

ဂုဏ်ယူပါတယ်! သင်အောင်မြင်စွာ:
- ✅ Template မှ azd project ကို initialize လုပ်ခဲ့သည်
- ✅ Project structure နှင့် အရေးကြီးသော ဖိုင်များကို စူးစမ်းခဲ့သည်
- ✅ Full-stack application ကို Azure သို့ deploy လုပ်ခဲ့သည်
- ✅ Code ပြင်ဆင်မှုများလုပ်ပြီး redeploy လုပ်ခဲ့သည်
- ✅ Multiple environments ကို စီမံခဲ့သည်
- ✅ Resources များကို Clean Up လုပ်ခဲ့သည်

## 🎯 ကျွမ်းကျင်မှု အတည်ပြု လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း ၁: Template တစ်ခုကို Deploy လုပ်ပါ (၁၅ မိနစ်)
**ရည်မှန်းချက်**: azd init နှင့် deployment workflow ကို ကျွမ်းကျင်စွာ ပြသပါ

```bash
# Python + MongoDB စနစ်ကို စမ်းကြည့်ပါ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# တင်သွင်းမှုကို အတည်ပြုပါ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ရှင်းလင်းပါ
azd down --force --purge
```

**အောင်မြင်မှု စံနှုန်းများ:**
- [ ] Application ကို error မရှိဘဲ deploy လုပ်နိုင်သည်
- [ ] Application URL ကို browser မှာ ဝင်ရောက်ကြည့်နိုင်သည်
- [ ] Application သင့်တော်စွာ လုပ်ဆောင်နိုင်သည် (add/remove todos)
- [ ] Resources များကို အောင်မြင်စွာ Clean Up လုပ်နိုင်သည်

### လေ့ကျင့်ခန်း ၂: Configuration ကို Customize လုပ်ပါ (၂၀ မိနစ်)
**ရည်မှန်းချက်**: Environment variable configuration ကို လေ့ကျင့်ပါ

```bash
cd my-first-azd-app

# အထူးပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new custom-config

# အထူးအပြောင်းအလဲများကို သတ်မှတ်ပါ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# အပြောင်းအလဲများကို အတည်ပြုပါ
azd env get-values | grep APP_TITLE

# အထူး configuration ဖြင့် Deploy လုပ်ပါ
azd up
```

**အောင်မြင်မှု စံနှုန်းများ:**
- [ ] Custom environment ကို အောင်မြင်စွာ ဖန်တီးနိုင်သည်
- [ ] Environment variables များကို set လုပ်ပြီး retrieve လုပ်နိုင်သည်
- [ ] Application ကို custom configuration ဖြင့် deploy လုပ်နိုင်သည်
- [ ] Deployed app တွင် custom settings ကို အတည်ပြုနိုင်သည်

### လေ့ကျင့်ခန်း ၃: Multi-Environment Workflow (၂၅ မိနစ်)
**ရည်မှန်းချက်**: Environment management နှင့် deployment strategy များကို ကျွမ်းကျင်စွာ လုပ်ဆောင်ပါ

```bash
# ဖွဲ့စည်းရေးပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ဖွဲ့စည်းရေး URL ကို မှတ်သားပါ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# စမ်းသပ်ရေးပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# စမ်းသပ်ရေး URL ကို မှတ်သားပါ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ပတ်ဝန်းကျင်များကို နှိုင်းယှဉ်ပါ
azd env list

# ပတ်ဝန်းကျင်နှစ်ခုလုံးကို စမ်းသပ်ပါ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# နှစ်ခုလုံးကို ရှင်းလင်းပါ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**အောင်မြင်မှု စံနှုန်းများ:**
- [ ] Configuration မတူညီသော environment နှစ်ခုကို ဖန်တီးနိုင်သည်
- [ ] Environment နှစ်ခုလုံးကို အောင်မြင်စွာ deploy လုပ်နိုင်သည်
- [ ] `azd env select` ကို အသုံးပြု၍ environment များအကြား switch လုပ်နိုင်သည်
- [ ] Environment variables များသည် environment အလိုက် မတူညီသည်
- [ ] Environment နှစ်ခုလုံးကို အောင်မြင်စွာ Clean Up လုပ်နိုင်သည်

## 📊 သင့်တိုးတက်မှု

**ရင်းနှီးချိန်**: ~၆၀-၉၀ မိနစ်  
**ရရှိသော ကျွမ်းကျင်မှုများ**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup နှင့် cost management

**နောက်တစ်ဆင့်**: Advanced configuration patterns ကို လေ့လာရန် [Configuration Guide](configuration.md) သို့ သွားပါ!

## အများဆုံးတွေ့ရသော ပြဿနာများကို ဖြေရှင်းခြင်း

### Authentication Errors
```bash
# Azure နှင့် ပြန်လည်အတည်ပြုခြင်း
az login

# Subscription access ကိုအတည်ပြုပါ
az account show
```

### Deployment Failures
```bash
# ဒါဘက်လော့ဂ်များကိုဖွင့်ပါ
export AZD_DEBUG=true
azd up --debug

# အသေးစိတ်လော့ဂ်များကိုကြည့်ပါ
azd logs --service api
azd logs --service web
```

### Resource Name Conflicts
```bash
# ထူးခြားတဲ့ပတ်ဝန်းကျင်အမည်ကို အသုံးပြုပါ
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# ပို့များရရှိနိုင်မရှိစစ်ဆေးပါ
netstat -an | grep :3000
netstat -an | grep :3100
```

## နောက်တစ်ဆင့်

သင်၏ ပထမဆုံး project ကို ပြီးမြောက်စွာ လုပ်ဆောင်ပြီးနောက်တွင် အောက်ပါ အဆင့်မြှင့်တင်မှုများကို စူးစမ်းပါ:

### ၁. Infrastructure ကို Customize လုပ်ပါ
- [Infrastructure as Code](../deployment/provisioning.md)
- [Databases, storage, နှင့် အခြား services များ ထည့်သွင်းပါ](../deployment/provisioning.md#adding-services)

### ၂. CI/CD ကို Set Up လုပ်ပါ
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### ၃. Production Best Practices
- [Security configurations](../deployment/best-practices.md#security)
- [Performance optimization](../deployment/best-practices.md#performance)
- [Monitoring နှင့် logging](../deployment/best-practices.md#monitoring)

### ၄. Template များကို စူးစမ်းပါ
```bash
# အမျိုးအစားအလိုက် template များကိုကြည့်ရှုပါ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# နည်းပညာ stack များကိုကွဲပြားစွာစမ်းသပ်ကြည့်ပါ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## အပိုဆောင်း ရင်းမြစ်များ

### သင်ယူရန် အထောက်အကူများ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Examples
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**သင်၏ ပထမဆုံး azd project ကို ပြီးမြောက်စွာ လုပ်ဆောင်ခဲ့သည်ကို ဂုဏ်ယူပါတယ်!** Azure ပေါ်တွင် အံ့မခန်း applications များကို ယုံကြည်စိတ်ချစွာ ဖန်တီးပြီး deploy လုပ်နိုင်ရန် သင်အဆင်သင့်ဖြစ်ပါပြီ။

---

**အခန်း လမ်းကြောင်း:**
- **📚 သင်ခန်းစာ အိမ်**: [AZD အခြေခံသင်ခန်းစာ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်**: [Installation & Setup](installation.md)
- **➡️ နောက်တစ်ခု**: [Configuration](configuration.md)
- **🚀 နောက်အခန်း**: [အခန်း ၂: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- **နောက်သင်ခန်းစာ**: [Deployment Guide](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->