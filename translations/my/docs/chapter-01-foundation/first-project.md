# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

သင့်ရဲ့ ပထမဆုံး Azure Developer CLI စီမံကိန်းသို့ ကြိုဆိုပါတယ်! ဒီလက်တွေ့ အသုဘက်သင်တန်းမှာ azd ကို အသုံးပြုပြီး React frontend, Node.js API backend, နှင့် MongoDB ဒေတာဘေ့စ်ပါဝင်သော ပြီးပြည့်စုံသော full-stack အက်ပလီကေးရှင်းတစ်ခုကို ဖန်တီး၊ deploy နှင့် စီမံခန့်ခွဲခြင်းကို အပြည့်အစုံ လမ်းပြပေးမှာ ဖြစ်ပါတယ်။

## Learning Goals

ဤသင်တန်းကို ပြီးမြောက်ပါက သင်မှာ:
- azd project initialization workflow ကို template များဖြင့် ကျွမ်းကျင်စွာ ပြုလုပ်နိုင်မည်
- Azure Developer CLI စီမံကိန်း ဖွဲ့စည်းပုံနှင့် configuration ဖိုင်များကို နားလည်နိုင်မည်
- အပြည့်အစုံ application ကို infrastructure provisioning အပါအဝင် Azure သို့ deploy ပြုလုပ်နိုင်မည်
- application update များနှင့် redeployment များကို အကောင်အထည်ဖော်နိုင်မည်
- development နှင့် staging အတွက် အခြေအနေ(environment) များကို စီမံနိုင်မည်
- resource cleanup နှင့် ကုန်ကျစရိတ်စီမံခန့်ခွဲမှုမျာ်ကို အသုံးချနိုင်မည်

## Learning Outcomes

ပြီးမြောက်ပြီးနောက် သင်သည် အောက်ပါအရာများကို လုပ်ဆောင်နိုင်မည်:
- templates ထဲမှ azd projects များကို သီးခြား initialize နှင့် configure ပြုလုပ်နိုင်မည်
- azd project ဖိုင်စုကို ထိထိရောက်ရောက် လမ်းပြနိုင်ပြီး ပြင်ဆင်နိုင်မည်
- တစ်ချက်တည်း command နဲ့ full-stack applications ကို Azure သို့ deploy ပြုလုပ်နိုင်မည်
- deployment အခက်အခဲများနှင့် authentication ပြဿနာများကို အချိုးကျဖြေရှင်းနိုင်မည်
- deployment အဆင့်အမျိုးမျိုးအတွက် Azure environments များကို စီမံနိုင်မည်
- application updates အတွက် continuous deployment workflows များကို အကောင်အထည်ဖော်နိုင်မည်

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ Azure CLI installed and authenticated
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

### Verify Your Setup
```bash
# azd တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version
```
### Verify Azure authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

ကျွန်တော်တို့ စတင်မှာ React frontend နဲ့ Node.js API backend ပါဝင်တဲ့ နာမည်ကြီး todo application template ကို ရွေးယူ initialization လုပ်မယ်။

```bash
# ရနိုင်သော ပုံစံများကို ကြည့်ပါ
azd template list

# todo အက်ပ် ပုံစံကို စတင် ပြုလုပ်ပါ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# အကြောင်းကြားချက်များကို လိုက်နာပါ:
# - ပတ်ဝန်းကျင် နာမည် ထည့်ပါ: "dev"
# - subscription ကို ရွေးချယ်ပါ (အကယ်၍ သင်မှာ များစွာရှိပါက)
# - တိုင်းဒေသကို ရွေးချယ်ပါ: "East US 2" (သို့မဟုတ် သင်နှစ်သက်သော တိုင်းဒေသ)
```

### What Just Happened?
- သင့် local directory ထဲသို့ template ကုဒ်ကို ဒေါင်းလုပ်လုပ်ခဲ့သည်
- `azure.yaml` ဖိုင်ကို service သတ်မှတ်ချက်များနှင့် ဖန်တီးထားသည်
- `infra/` directory အတွင်း infrastructure ကုဒ်ကို သတ်မှတ်ထားသည်
- environment configuration တစ်ခုကို ပြင်ဆင်ထားသည်

## Step 2: Explore the Project Structure

azd က ကျွန်တော်တို့အတွက် ဖန်တီးပေးခဲ့တာတွေကို ကြည့်ရှုကြမယ်။

```bash
# ပရောဂျက် ဖွဲ့စည်းပုံကို ကြည့်ပါ
tree /f   # ဝင်းဒိုး
# သို့မဟုတ်
find . -type f | head -20   # မက်အိုအက်စ်/လင်းနပ်စ်
```

You should see:
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

### Key Files to Understand

**azure.yaml** - The heart of your azd project:
```bash
# ပရောဂျက် ဆက်တင်များကို ကြည့်ပါ
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# အခြေခံအဆောက်အအုံဆိုင်ရာကုဒ်ကို ကြည့်ပါ
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

deploy မလုပ်ခင်မှာ application ကို ကောင်းကောင်းပြင်ဆင်နိုင်ပါတယ်။

### Modify the Frontend
```bash
# React အက်ပ်အစိတ်အပိုင်းကို ဖွင့်ပါ
code src/web/src/App.tsx
```

Make a simple change:
```typescript
// ခေါင်းစဉ်ကို ရှာပြီး ပြောင်းပါ
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# စိတ်ကြိုက် ပတ်ဝန်းကျင် တန်ဖိုးများကို သတ်မှတ်ပါ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ပတ်ဝန်းကျင် တန်ဖိုးအားလုံးကို ကြည့်ပါ
azd env get-values
```

## Step 4: Deploy to Azure

ယခု စိတ်လှုပ်ရှားဖွယ် ကိစ္စ — အားလုံးကို Azure သို့ deploy လုပ်ကြမယ်!

```bash
# အောက်ခံဖွဲ့စည်းပုံနှင့် အက်ပလီကေးရှင်းကို တပ်ဆင်ခြင်း
azd up

# ဤအမိန့်သည်:
# 1. Azure မှ ဝန်ဆောင်မှုများ (App Service, Cosmos DB စသည်) ကို ထူထောင်ပေးမည်
# 2. သင်၏ အက်ပလီကေးရှင်းကို တည်ဆောက်မည်
# 3. ထူထောင်ထားသော ရင်းမြစ်များသို့ တပ်ဆင်မည်
# 4. အက်ပလီကေးရှင်း URL ကို ပြသမည်
```

### What's Happening During Deployment?

The `azd up` command performs these steps:
1. **Provision** (`azd provision`) - Creates Azure resources
2. **Package** - Builds your application code
3. **Deploy** (`azd deploy`) - Deploys code to Azure resources

### Expected Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Step 5: Test Your Application

### Access Your Application
deployment output ထဲမှာပေးထားသော URL ကို နှိပ်၍ သို့မဟုတ် အချိန်မရွေး ရယူနိုင်သည်။
```bash
# အက်ပ်၏ endpoints များကို ရယူပါ
azd show

# ဘရောက်ဇာတွင် အက်ပ်ကို ဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - "Add Todo" ကို နှိပ်ပြီး တာဝန်တစ်ခု ထည့်ရန်
2. **Mark as complete** - ပြီးဆုံးသည့် အရာများကို စစ်မှတ်ချက်ထည့်ရန်
3. **Delete items** - မလိုအပ်တော့သော todos များကို ဖျက်ရန်

### Monitor Your Application
```bash
# သင်၏ အရင်းအမြစ်များအတွက် Azure Portal ကို ဖွင့်ပါ
azd monitor

# အက်ပလီကေးရှင်းမှတ်တမ်းများကို ကြည့်ရှုပါ
azd monitor --logs

# တိုက်ရိုက် မီထရစ်များကို ကြည့်ရှုပါ
azd monitor --live
```

## Step 6: Make Changes and Redeploy

ပြင်ဆင်မှုတစ်ခုလုပ်ပြီး ပြန်တင်ပို့ရတာ 얼마나 လွယ်ကူတယ်ဆိုတာ ကြည့်ကြမယ်။

### Modify the API
```bash
# API ကုဒ်ကို တည်းဖြတ်ပါ
code src/api/src/routes/lists.js
```

Add a custom response header:
```javascript
// route handler ကို ရှာပြီး အောက်ပါအတိုင်း ထည့်ပါ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# အောက်ခံအင်ဖရာကို ကျော်လွှားပြီး အက်ပလီကေးရှင်းကုဒ်ပဲ တပ်ဆင်ပါ
azd deploy

# အောက်ခံအင်ဖရာ ရှိပြီးသားဖြစ်သောကြောင့် 'azd up' ထက် အလွန်လျင်မြန်သည်
```

## Step 7: Manage Multiple Environments

production မတင်ခင်ပြောင်းလဲမှုများကို စမ်းသပ်ရန် staging environment တစ်ခု ဖန်တီးပါ။

```bash
# staging ပတ်ဝန်းကျင် အသစ်တစ်ခု ဖန်တီးပါ
azd env new staging

# staging ပတ်ဝန်းကျင်သို့ ဖြန့်ချိပါ
azd up

# dev ပတ်ဝန်းကျင်သို့ ပြန်ပြောင်းပါ
azd env select dev

# ပတ်ဝန်းကျင်များအားလုံးကို စာရင်းပြပါ
azd env list
```

### Environment Comparison
```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် ကြည့်ရန်
azd env select dev
azd show

# စတေဂျ် ပတ်ဝန်းကျင် ကြည့်ရန်
azd env select staging
azd show
```

## Step 8: Clean Up Resources

စမ်းသပ်ခြင်းပြီးသွားပါက ဆက်လက်ကြေးစရိတ်မထွက်စေရန် ရင်းမြစ်များကို ဖျက်ပစ်ပါ။

```bash
# လက်ရှိ ပတ်ဝန်းကျင်အတွက် Azure အရင်းအမြစ်များအားလုံးကို ဖျက်ပါ
azd down

# အတည်ပြုချက်မမေးပဲ တိုက်ရိုက် ဖျက်၍ soft-deleted အရင်းအမြစ်များကိုလည်း ဖယ်ရှားပါ
azd down --force --purge

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်ကို ဖျက်ပါ
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

သင်အခု ခေတ်မီ web application တစ်ခုကို deploy လုပ်ခဲ့ပြီ။ ဒါပေမယ့် AI အခြေပြု app တစ်ခု—ဥပမာ Microsoft Foundry Models တွေထောက်ခံတဲ့ chat အက်ပလီကေးရှင်းတစ်ခုကို သင် deploy လုပ်ချင်ရင်မှာတော့?

ကောင်းချီး: **workflow က တူတယ်။**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ဘာသာကွာခြားချက်တစ်ခုသာ ရှိတာက စတင်အသုံးပြုမယ့် **template** ဖြစ်ပါတယ်။ AI template တစ်ခုတွင် Microsoft Foundry Models resource သို့မဟုတ် AI Search index ကဲ့သို့သော ထပ်ဆောင်း infrastructure များပါဝင်နိုင်ပေမယ့် azd က အထက်ပါအားလုံးကို ကိုင်တွယ်ပေးပါသည်။ သင့်အနေဖြင့် အာဏာအသစ် command မတွေ့ဖို့၊ တခြား tool ကို အသုံးမပြုရပါ၊ deployment အပေါ် မှတ်ယူပုံကို ပြောင်းလဲစရာ မလိုပါ။

azd ရဲ့ မူလ လက်တွဲအဓိပ္ပာယ်ကတော့: **one workflow, any workload.** ဤသင်တန်းမှာ လေ့ကျင့်ထားသော ကျွမ်းကျင်မှုများ — initialization, deployment, monitoring, redeploying, cleanup — တို့ဟာ AI applications နှင့် agents များတွင်လည်း တူညီစွာ သက်ရောက်ပါသည်။

---

## What You've Learned

ကြိုဆိုပါတယ်! သင် အောင်မြင်စွာ ပြီးမြောက်ခဲ့သည်:
- ✅ template မှ azd project ကို initialize လုပ်နိုင်ခဲ့သည်
- ✅ project ဖွဲ့စည်းပုံနှင့် အဓိကဖိုင်များကို လေ့လာနိုင်ခဲ့သည်
- ✅ full-stack application ကို Azure သို့ deploy လုပ်နိုင်ခဲ့သည်
- ✅ code ပြင်ဆင်မှုများ ပြုလုပ်ပြီး ပြန် deploy လုပ်နိုင်ခဲ့သည်
- ✅ environments များစီမံနိုင်ခဲ့သည်
- ✅ ရင်းမြစ်များကို ဖယ်ရှားစစ်ဆေးပြီး စုဆောင်းမှုများ ပြုလုပ်နိုင်ခဲ့သည်

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrate mastery of azd init and deployment workflow

```bash
# Python နှင့် MongoDB စတက်ကို စမ်းကြည့်ပါ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# တပ်ဆင်မှုကို အတည်ပြုပါ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ရှင်းလင်းပါ
azd down --force --purge
```

**Success Criteria:**
- [ ] Application deploys without errors
- [ ] Can access application URL in browser
- [ ] Application functions correctly (add/remove todos)
- [ ] Successfully cleaned up all resources

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice environment variable configuration

```bash
cd my-first-azd-app

# စိတ်ကြိုက် ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new custom-config

# စိတ်ကြိုက် တန်ဖိုးများ သတ်မှတ်ပါ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# တန်ဖိုးများကို စစ်ဆေးပါ
azd env get-values | grep APP_TITLE

# စိတ်ကြိုက် ဖွဲ့စည်းချက်ဖြင့် တပ်ဆင်ပါ
azd up
```

**Success Criteria:**
- [ ] Custom environment created successfully
- [ ] Environment variables set and retrievable
- [ ] Application deploys with custom configuration
- [ ] Can verify custom settings in deployed app

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# dev ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# dev URL ကို မှတ်သားပါ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# staging ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# staging URL ကို မှတ်သားပါ
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

**Success Criteria:**
- [ ] Two environments created with different configurations
- [ ] Both environments deployed successfully
- [ ] Can switch between environments using `azd env select`
- [ ] Environment variables differ between environments
- [ ] Successfully cleaned up both environments

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: You're ready for [Configuration Guide](configuration.md) to learn advanced configuration patterns!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Azure သို့ ပြန်လက်မှတ်အတည်ပြုပါ
az login

# စာရင်းဝင်ခွင့်ကို စစ်ဆေးပါ
az account show
```

### Deployment Failures
```bash
# debug logging ကို ဖွင့်ပါ
export AZD_DEBUG=true
azd up --debug

# Azure တွင် အက်ပလီကေးရှင်း မှတ်တမ်းများကို ကြည့်ပါ
azd monitor --logs

# Container Apps များအတွက် Azure CLI ကို အသုံးပြုပါ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# ထူးခြားသော ပတ်ဝန်းကျင် အမည် တစ်ခုကို အသုံးပြုပါ
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# ဆိပ်ကမ်းများ အသုံးပြုနိုင်ကြောင်း စစ်ဆေးပါ
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

ယခု သင့်ရဲ့ ပထမဆုံး project ကိုပြီးမြောက်လိုက်ပြီဆိုလျှင် အထက်တန်းအကြောင်းအရာများကို ရှာဖွေနိုင်ပါပြီ။

### 1. Customize Infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Set Up CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Production Best Practices
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Security, performance, and monitoring

### 4. Explore More Templates
```bash
# အမျိုးအစားအလိုက် နမူနာများကို ကြည့်ရှုပါ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# အမျိုးမျိုးသော နည်းပညာ ပေါင်းစပ်မှုများကို စမ်းကြည့်ပါ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Additional Resources

### Learning Materials
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

**Congratulations on completing your first azd project!** သင်ယခု Azure တွင် မျှော်လင့်ရသော application များကို ယုံကြည်စိတ်ချစွာ ဖန်တီး၊ deploy ပြုလုပ်နိုင်ပါပြီ။

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ တိကျမှန်ကန်ရန် ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း ဂရုပြုပါ။ မူလစာရွက်စာတမ်းကို ထို၏ မူရင်းဘာသာစကားဖြင့် အာဏာအရင်းအမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်နိုင်သည့် မနားလည်မှုများ သို့မဟုတ် အဖြစ်မမှန်သတ်မှတ်ချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->