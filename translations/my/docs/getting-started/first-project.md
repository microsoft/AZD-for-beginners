<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T22:47:47+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "my"
}
-->
# သင့်ပထမဆုံး Project - လက်တွေ့လေ့ကျင့်ခန်း

**အရင်:** [Configuration](configuration.md) | **နောက်တစ်ခု:** [Azure AI Foundry Integration](../ai-foundry/azure-ai-foundry-integration.md)

## အကျဉ်းချုပ်

Azure Developer CLI project ကိုစတင်ကြိုဆိုပါတယ်! ဒီလက်တွေ့လေ့ကျင့်ခန်းမှာ azd ကိုအသုံးပြုပြီး Azure ပေါ်မှာ full-stack application တစ်ခုကို ဖန်တီးခြင်း၊ တင်ခြင်းနှင့် စီမံခန့်ခွဲခြင်းအဆင့်ဆင့်ကို လမ်းညွှန်ပေးထားပါတယ်။ React frontend, Node.js API backend, MongoDB database ပါဝင်တဲ့ todo application တစ်ခုကို လက်တွေ့လုပ်ဆောင်ရမှာဖြစ်ပါတယ်။

## သင်ယူရမည့်အချက်များ

ဒီလေ့ကျင့်ခန်းကိုပြီးမြောက်ပါက သင်သည်:
- azd template အသုံးပြု project initialization workflow ကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်မည်
- Azure Developer CLI project structure နှင့် configuration files ကို နားလည်မည်
- Azure ပေါ် application တစ်ခုကို infrastructure provisioning ဖြင့် တင်နိုင်မည်
- application update နှင့် redeployment strategy များကို အကောင်အထည်ဖော်နိုင်မည်
- development နှင့် staging အတွက် environment များစီမံနိုင်မည်
- resource cleanup နှင့် cost management လုပ်ဆောင်နိုင်မည်

## သင်ယူရမည့်ရလဒ်များ

ပြီးမြောက်ပါက သင်သည်:
- azd templates မှ project များကို ကိုယ်တိုင် initialize နှင့် configure လုပ်နိုင်မည်
- azd project structure များကို သက်ဆိုင်ရာပြင်ဆင်နိုင်မည်
- single command ဖြင့် full-stack applications ကို Azure ပေါ်တင်နိုင်မည်
- deployment နှင့် authentication ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- deployment stages များအတွက် Azure environments များစီမံနိုင်မည်
- application updates အတွက် continuous deployment workflow များကို အကောင်အထည်ဖော်နိုင်မည်

## စတင်လိုက်ပါ

### လိုအပ်ချက်များ စစ်ဆေးရန်
- ✅ Azure Developer CLI ကို install လုပ်ထား ([Installation Guide](installation.md))
- ✅ Azure CLI ကို install လုပ်ပြီး authenticated ဖြစ်
- ✅ Git ကို သင့်စနစ်မှာ install လုပ်ထား
- ✅ Node.js 16+ (ဒီလေ့ကျင့်ခန်းအတွက်)
- ✅ Visual Studio Code (အကြံပြု)

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

React frontend နှင့် Node.js API backend ပါဝင်တဲ့ todo application template ကို စတင်လိုက်ပါ။

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

### ဘာတွေဖြစ်ခဲ့သလဲ?
- Template code ကို သင့် local directory သို့ download လုပ်ခဲ့သည်
- `azure.yaml` ဖိုင်ကို service definitions ဖြင့် ဖန်တီးခဲ့သည်
- `infra/` directory ထဲမှာ infrastructure code ကို စီစဉ်ခဲ့သည်
- Environment configuration ကို ဖန်တီးခဲ့သည်

## အဆင့် ၂: Project Structure ကို လေ့လာပါ

azd ဖန်တီးထားတဲ့အရာတွေကို ကြည့်လိုက်ပါ:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

သင့်အနေနဲ့ ကြည့်ရမယ့်အရာများ:
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

### နားလည်ရမယ့် Key Files

**azure.yaml** - azd project ရဲ့ အဓိက:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure ကို ဖော်ပြထားသည်:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## အဆင့် ၃: Project ကို Customize လုပ်ပါ (Optional)

Deploy လုပ်မည့်အခါ မတိုင်မီ application ကို ပြင်ဆင်နိုင်ပါတယ်:

### Frontend ကို ပြင်ဆင်ပါ
```bash
# Open the React app component
code src/web/src/App.tsx
```

ရိုးရှင်းတဲ့ပြင်ဆင်မှုတစ်ခုလုပ်ပါ:
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

အခုတော့ အရေးကြီးတဲ့အပိုင်း - အားလုံးကို Azure သို့ Deploy လုပ်လိုက်ပါ!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Deployment အတွင်း ဘာတွေဖြစ်နေသလဲ?

`azd up` command သည် အောက်ပါအဆင့်များကို လုပ်ဆောင်သည်:
1. **Provision** (`azd provision`) - Azure resources များကို ဖန်တီးသည်
2. **Package** - Application code ကို build လုပ်သည်
3. **Deploy** (`azd deploy`) - Code ကို Azure resources များသို့ တင်သည်

### မျှော်လင့်ရမည့် Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## အဆင့် ၅: Application ကို စမ်းသပ်ပါ

### Application ကို ဝင်ရောက်ကြည့်ပါ
Deployment output မှ URL ကို click လုပ်ပါ၊ သို့မဟုတ် အချိန်မရွေး ရယူနိုင်သည်:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo App ကို စမ်းသပ်ပါ
1. **Todo item တစ်ခုထည့်ပါ** - "Add Todo" ကို click လုပ်ပြီး task တစ်ခုထည့်ပါ
2. **Complete အဖြစ်မှတ်သားပါ** - ပြီးမြောက်သော items များကို check လုပ်ပါ
3. **Items များကို ဖျက်ပါ** - မလိုအပ်တော့သော todos များကို ဖျက်ပါ

### Application ကို Monitor လုပ်ပါ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## အဆင့် ၆: ပြင်ဆင်မှုများလုပ်ပြီး Redeploy လုပ်ပါ

ပြင်ဆင်မှုတစ်ခုလုပ်ပြီး update လုပ်ရတာ ဘယ်လောက်လွယ်ကူတယ်ဆိုတာ ကြည့်လိုက်ပါ:

### API ကို ပြင်ဆင်ပါ
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Custom response header တစ်ခုထည့်ပါ:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Code Changes များကိုသာ Deploy လုပ်ပါ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## အဆင့် ၇: Multiple Environments ကို စီမံပါ

Production မတိုင်မီ changes များကို စမ်းသပ်ရန် staging environment တစ်ခု ဖန်တီးပါ:

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

စမ်းသပ်မှုများပြီးဆုံးပါက အဆက်မပြတ်အခကြေးငွေများကို ရှောင်ရှားရန် cleanup လုပ်ပါ:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## သင်လေ့လာခဲ့သောအရာများ

ဂုဏ်ယူပါတယ်! သင်သည်:
- Template မှ azd project ကို initialize လုပ်ခဲ့သည်
- Project structure နှင့် key files များကို လေ့လာခဲ့သည်
- Full-stack application တစ်ခုကို Azure သို့ Deploy လုပ်ခဲ့သည်
- Code changes များလုပ်ပြီး Redeploy လုပ်ခဲ့သည်
- Multiple environments များကို စီမံခဲ့သည်
- Resources များကို ရှင်းလင်းခဲ့သည်

## အများဆုံးတွေ့ရသောပြဿနာများကို ဖြေရှင်းခြင်း

### Authentication Errors
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Deployment Failures
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Resource Name Conflicts
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## နောက်တစ်ဆင့်

သင့်ပထမဆုံး project ကိုပြီးမြောက်ပြီးနောက် အောက်ပါအဆင့်များကို လေ့လာပါ:

### ၁. Infrastructure ကို Customize လုပ်ပါ
- [Infrastructure as Code](../deployment/provisioning.md)
- [Databases, storage, နှင့် အခြား services များထည့်ပါ](../deployment/provisioning.md#adding-services)

### ၂. CI/CD ကို Set Up လုပ်ပါ
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### ၃. Production အတွက် အကောင်းဆုံးအလေ့အထများ
- [Security configurations](../deployment/best-practices.md#security)
- [Performance optimization](../deployment/best-practices.md#performance)
- [Monitoring နှင့် logging](../deployment/best-practices.md#monitoring)

### ၄. Template များကို ပိုမိုလေ့လာပါ
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

## အပိုဆောင်းရင်းမြစ်များ

### သင်ယူရန်အထောက်အကူများ
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

**သင့်ပထမဆုံး azd project ကိုပြီးမြောက်ခဲ့ပါပြီ!** Azure ပေါ်မှာ application များကို ယုံကြည်စိတ်ချစွာ ဖန်တီးပြီး Deploy လုပ်နိုင်ရန် သင်အဆင်သင့်ဖြစ်ပါပြီ။

---

**အရင်:** [Configuration](configuration.md) | **နောက်တစ်ခု:** [Azure AI Foundry Integration](../ai-foundry/azure-ai-foundry-integration.md)
- **နောက်သင်ခန်းစာ**: [Deployment Guide](../deployment/deployment-guide.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူလဘာသာစကားဖြင့် အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားယူမှားမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။