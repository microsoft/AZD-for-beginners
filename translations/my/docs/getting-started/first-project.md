<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T13:20:20+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "my"
}
-->
# သင့်ရဲ့ ပထမဆုံး Project - လက်တွေ့ လေ့ကျင့်မှု သင်ခန်းစာ

**အခန်းဆိုင်ရာ လမ်းညွှန်ချက်များ:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်အခန်း**: [Installation & Setup](installation.md)
- **➡️ နောက်အခန်း**: [Configuration](configuration.md)
- **🚀 နောက်အခန်း**: [အခန်း ၂: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## နိဒါန်း

Azure Developer CLI (azd) ကို အသုံးပြုပြီး Azure ပေါ်တွင် အပြည့်အစုံ stack application တစ်ခုကို ဖန်တီးခြင်း၊ တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်းဆိုင်ရာ လမ်းညွှန်ချက်များကို လက်တွေ့ လေ့ကျင့်မှုအဖြစ် သင်ယူကြမည်ဖြစ်သည်။ သင်သည် React frontend, Node.js API backend နှင့် MongoDB database ပါဝင်သော တကယ့် todo application ကို အသုံးပြု၍ လေ့ကျင့်မည်ဖြစ်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်စွာ လေ့ကျင့်ပြီးပါက၊ သင်သည်:
- azd template များကို အသုံးပြု၍ project initialization workflow ကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်မည်
- Azure Developer CLI project ဖွဲ့စည်းမှုနှင့် configuration ဖိုင်များကို နားလည်မည်
- Azure ပေါ်တွင် infrastructure provisioning နှင့်အတူ application တစ်ခုလုံးကို deploy လုပ်နိုင်မည်
- Application ကို update ပြုလုပ်ခြင်းနှင့် redeployment နည်းလမ်းများကို အသုံးပြုနိုင်မည်
- Development နှင့် staging အတွက် အမျိုးမျိုးသော environment များကို စီမံနိုင်မည်
- Resource cleanup နှင့် cost management လုပ်ငန်းစဉ်များကို အသုံးချနိုင်မည်

## သင်ယူပြီးနောက် ရလဒ်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်ပြီးနောက်၊ သင်သည်:
- Template များမှ azd project များကို ကိုယ်တိုင် initialize နှင့် configure လုပ်နိုင်မည်
- azd project ဖွဲ့စည်းမှုများကို ထိန်းချုပ်ပြီး ပြင်ဆင်နိုင်မည်
- Single command များဖြင့် Azure ပေါ်သို့ full-stack application များကို deploy လုပ်နိုင်မည်
- Deployment နှင့် authentication ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- Deployment အဆင့်အမျိုးမျိုးအတွက် Azure environment များကို စီမံနိုင်မည်
- Application update များအတွက် continuous deployment workflow များကို အသုံးပြုနိုင်မည်

## စတင်လိုက်ကြစို့

### လိုအပ်ချက်များ စစ်ဆေးရန် စာရင်း
- ✅ Azure Developer CLI ကို install လုပ်ပြီး ([Installation Guide](installation.md))
- ✅ Azure CLI ကို install လုပ်ပြီး authenticated ဖြစ်ရမည်
- ✅ Git ကို သင့်စနစ်တွင် install လုပ်ထားရမည်
- ✅ Node.js 16+ (ဒီသင်ခန်းစာအတွက်)
- ✅ Visual Studio Code (အကြံပြုသည်)

### သင့် Setup ကို စစ်ဆေးပါ
```bash
# Check azd installation
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

React frontend နှင့် Node.js API backend ပါဝင်သော လူကြိုက်များသော todo application template ကို စတင်လိုက်ကြစို့။

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ဘာတွေ ဖြစ်သွားပြီလဲ?
- Template code ကို သင့် local directory သို့ download လုပ်ပြီး
- `azure.yaml` ဖိုင်တစ်ခုကို service definitions ဖြင့် ဖန်တီးပြီး
- `infra/` directory တွင် infrastructure code များကို ဖန်တီးပြီး
- Environment configuration ကို ဖန်တီးပြီး

## အဆင့် ၂: Project ဖွဲ့စည်းမှုကို စူးစမ်းပါ

azd က ဖန်တီးပေးထားတာတွေကို ကြည့်လိုက်ကြစို့:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

သင့်အနေနှင့် ကြည့်ရမည့်အရာများ:
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure ဖော်ပြချက်:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## အဆင့် ၃: သင့် Project ကို ပြင်ဆင်ပါ (Optional)

Deploy လုပ်မည့်အချိန်မတိုင်မီ application ကို ပြင်ဆင်နိုင်သည်။

### Frontend ကို ပြင်ဆင်ပါ
```bash
# Open the React app component
code src/web/src/App.tsx
```

ရိုးရှင်းတဲ့ ပြင်ဆင်မှုတစ်ခုလုပ်ပါ:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Environment Variables ကို Configure လုပ်ပါ
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## အဆင့် ၄: Azure သို့ Deploy လုပ်ပါ

အခုတော့ စိတ်လှုပ်ရှားစရာ အပိုင်း - အားလုံးကို Azure သို့ Deploy လုပ်လိုက်ကြစို့!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Deployment အတွင်း ဖြစ်နေသော အရာများ

`azd up` command သည် အောက်ပါအဆင့်များကို လုပ်ဆောင်သည်:
1. **Provision** (`azd provision`) - Azure resources များကို ဖန်တီးသည်
2. **Package** - သင့် application code ကို build လုပ်သည်
3. **Deploy** (`azd deploy`) - Code ကို Azure resources များသို့ တင်သည်

### မျှော်မှန်းရမည့် Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## အဆင့် ၅: သင့် Application ကို စမ်းသပ်ပါ

### သင့် Application ကို ဝင်ကြည့်ပါ
Deployment output တွင် ပေးထားသော URL ကို နှိပ်ပါ၊ သို့မဟုတ် အချိန်မရွေး ရယူနိုင်သည်:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo App ကို စမ်းသပ်ပါ
1. **Todo item တစ်ခု ထည့်ပါ** - "Add Todo" ကို နှိပ်ပြီး task တစ်ခု ထည့်ပါ
2. **Complete အဖြစ် အမှတ်အသားပြုပါ** - ပြီးစီးသော item များကို check လုပ်ပါ
3. **Item များကို ဖျက်ပါ** - မလိုအပ်တော့သော todo များကို ဖျက်ပါ

### သင့် Application ကို စောင့်ကြည့်ပါ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## အဆင့် ၆: ပြင်ဆင်မှုများ ပြုလုပ်ပြီး Redeploy လုပ်ပါ

ပြင်ဆင်မှုတစ်ခု ပြုလုပ်ပြီး update လုပ်ရတာ ဘယ်လောက်လွယ်ကူသလဲဆိုတာ ကြည့်လိုက်ကြစို့:

### API ကို ပြင်ဆင်ပါ
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Custom response header တစ်ခု ထည့်ပါ:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Code ပြင်ဆင်မှုများကိုသာ Deploy လုပ်ပါ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## အဆင့် ၇: အမျိုးမျိုးသော Environment များကို စီမံပါ

Production မတိုင်မီ ပြင်ဆင်မှုများကို စမ်းသပ်ရန် staging environment တစ်ခု ဖန်တီးပါ:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Environment များကို နှိုင်းယှဉ်ကြည့်ပါ
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## အဆင့် ၈: Resources များကို ရှင်းလင်းပါ

စမ်းသပ်မှုများ ပြီးဆုံးပါက၊ အဆက်မပြတ် အခကြေးငွေများ မကျသင့်စေရန် Resource များကို ရှင်းလင်းပါ:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## သင့်ရဲ့ သင်ယူမှုများ

ဂုဏ်ယူပါတယ်! သင်သည် အောင်မြင်စွာ:
- Template မှ azd project တစ်ခုကို initialize လုပ်ပြီး
- Project ဖွဲ့စည်းမှုနှင့် အဓိက ဖိုင်များကို စူးစမ်းပြီး
- Full-stack application တစ်ခုကို Azure သို့ deploy လုပ်ပြီး
- Code ပြင်ဆင်မှုများ ပြုလုပ်ပြီး Redeploy လုပ်ပြီး
- အမျိုးမျိုးသော Environment များကို စီမံပြီး
- Resources များကို ရှင်းလင်းပြီး

## ရှေ့ဆက် ပြဿနာများကို ဖြေရှင်းခြင်း

### Authentication ပြဿနာများ
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Deployment မအောင်မြင်မှုများ
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Resource Name ပဋိပက္ခများ
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network ပြဿနာများ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## နောက်တစ်ဆင့်

သင့်ရဲ့ ပထမဆုံး project ကို ပြီးမြောက်ပြီးနောက်၊ အောက်ပါ အဆင့်မြှင့် ခေါင်းစဉ်များကို စူးစမ်းပါ:

### ၁. Infrastructure ကို Customize လုပ်ပါ
- [Infrastructure as Code](../deployment/provisioning.md)
- [Databases, storage, နှင့် အခြား services များ ထည့်သွင်းပါ](../deployment/provisioning.md#adding-services)

### ၂. CI/CD ကို Set Up လုပ်ပါ
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### ၃. Production အတွက် အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ
- [Security configurations](../deployment/best-practices.md#security)
- [Performance optimization](../deployment/best-practices.md#performance)
- [Monitoring နှင့် logging](../deployment/best-practices.md#monitoring)

### ၄. Template များကို ပိုမို စူးစမ်းပါ
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## အပိုဆောင်း အရင်းအမြစ်များ

### သင်ယူမှု ပစ္စည်းများ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template များနှင့် နမူနာများ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**သင့်ရဲ့ ပထမဆုံး azd project ကို ပြီးမြောက်စွာ ပြုလုပ်နိုင်ခဲ့သည့်အတွက် ဂုဏ်ယူပါတယ်!** Azure ပေါ်တွင် အံ့မခန်း applications များကို ယုံကြည်မှုအပြည့်ဖြင့် ဖန်တီးပြီး Deploy လုပ်နိုင်ရန် သင် အဆင်သင့် ဖြစ်ပါပြီ။

---

**အခန်းဆိုင်ရာ လမ်းညွှန်ချက်များ:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်အခန်း**: [Installation & Setup](installation.md)
- **➡️ နောက်အခန်း**: [Configuration](configuration.md)
- **🚀 နောက်အခန်း**: [အခန်း ၂: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)
- **နောက်သင်ခန်းစာ**: [Deployment Guide](../deployment/deployment-guide.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။