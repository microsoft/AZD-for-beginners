<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-18T13:21:51+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "my"
}
-->
# AZD အခြေခံ - Azure Developer CLI ကိုနားလည်ခြင်း

# AZD အခြေခံ - အဓိကအကြောင်းအရာများနှင့် အခြေခံအဆင့်များ

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာမူလ**: [AZD အခြေခံသင်ခန်းစာ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ အရင်အခန်း**: [သင်ခန်းစာအကျဉ်းချုပ်](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ နောက်အခန်း**: [Installation & Setup](installation.md)
- **🚀 နောက်အခန်း**: [အခန်း 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## မိတ်ဆက်

ဒီသင်ခန်းစာမှာ Azure Developer CLI (azd) ကိုမိတ်ဆက်ပေးမှာဖြစ်ပြီး၊ ဒါဟာ သင့်ရဲ့ ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure ကို deploy လုပ်ရာအထိ အလျင်အမြန်ရောက်ရှိစေတဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ azd က cloud-native application deployment ကိုရိုးရှင်းစေတဲ့ အဓိကအကြောင်းအရာများ၊ အဓိက features တွေကို သင်လေ့လာရမှာဖြစ်ပါတယ်။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီသင်ခန်းစာအဆုံးမှာ သင်:
- Azure Developer CLI (azd) ဆိုတာဘာလဲ၊ အဓိကရည်ရွယ်ချက်ကဘာလဲဆိုတာနားလည်မယ်
- Template, Environment, Service တို့ရဲ့ အဓိကအကြောင်းအရာတွေကိုလေ့လာမယ်
- Template-Driven Development နဲ့ Infrastructure as Code ရဲ့ အဓိက features တွေကိုလေ့လာမယ်
- azd project structure နဲ့ workflow ကိုနားလည်မယ်
- azd ကို သင့် development environment အတွက် install နဲ့ configure လုပ်ဖို့ ပြင်ဆင်ထားမယ်

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးတဲ့အခါမှာ သင်:
- azd ရဲ့ အခန်းကဏ္ဍကို ခေတ်မီ cloud development workflow တွေမှာ ရှင်းပြနိုင်မယ်
- azd project structure ရဲ့ components တွေကို ဖော်ပြနိုင်မယ်
- Template, Environment, Service တွေဘယ်လိုပေါင်းစည်းပြီး အလုပ်လုပ်တယ်ဆိုတာ ရှင်းပြနိုင်မယ်
- azd နဲ့ Infrastructure as Code ရဲ့ အကျိုးကျေးဇူးတွေကို နားလည်မယ်
- azd commands အမျိုးမျိုးနဲ့ သူတို့ရဲ့ ရည်ရွယ်ချက်တွေကို သိရှိနိုင်မယ်

## Azure Developer CLI (azd) ဆိုတာဘာလဲ?

Azure Developer CLI (azd) က ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure ကို deploy လုပ်ရာအထိ အလျင်အမြန်ရောက်ရှိစေဖို့ ရည်ရွယ်ထားတဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ Cloud-native application တွေကို Azure မှာ တည်ဆောက်၊ deploy လုပ်၊ စီမံခန့်ခွဲဖို့ လုပ်ငန်းစဉ်တွေကို ရိုးရှင်းစေပါတယ်။

## အဓိကအကြောင်းအရာများ

### Templates
Templates တွေက azd ရဲ့ အခြေခံအဆင့်ဖြစ်ပါတယ်။ Template တွေမှာ:
- **Application code** - သင့်ရဲ့ source code နဲ့ dependencies
- **Infrastructure definitions** - Azure resources တွေကို Bicep သို့မဟုတ် Terraform နဲ့ ဖော်ပြထားတာ
- **Configuration files** - Settings နဲ့ environment variables
- **Deployment scripts** - Automated deployment workflows

### Environments
Environments တွေက deployment targets အမျိုးမျိုးကို ကိုယ်စားပြုပါတယ်:
- **Development** - စမ်းသပ်ခြင်းနဲ့ ဖွံ့ဖြိုးတိုးတက်မှုအတွက်
- **Staging** - Pre-production environment
- **Production** - Live production environment

Environment တစ်ခုစီမှာ:
- Azure resource group
- Configuration settings
- Deployment state ကို ကိုယ်ပိုင်ထားပါတယ်

### Services
Services တွေက သင့် application ရဲ့ အဆောက်အအုံဖြစ်ပါတယ်:
- **Frontend** - Web applications, SPAs
- **Backend** - APIs, microservices
- **Database** - Data storage solutions
- **Storage** - File နဲ့ blob storage

## အဓိက Features

### 1. Template-Driven Development
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure ရဲ့ domain-specific language
- **Terraform** - Multi-cloud infrastructure tool
- **ARM Templates** - Azure Resource Manager templates

### 3. Integrated Workflows
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Environment Management
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Project Structure

azd project structure ရဲ့ ပုံမှန်:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Configuration Files

### azure.yaml
Project configuration file အဓိက:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Environment-specific configuration:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Common Workflows

### Project အသစ်စတင်ခြင်း
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Development Cycle
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## `azd down --force --purge` ကိုနားလည်ခြင်း
`azd down --force --purge` command က azd environment နဲ့ ဆက်စပ်နေတဲ့ resource တွေကို အပြည့်အဝဖျက်သိမ်းဖို့ အလွန်အစွမ်းထက်တဲ့နည်းလမ်းတစ်ခုဖြစ်ပါတယ်။ ဒီ flag တစ်ခုစီရဲ့ အဓိကအကြောင်းအရာတွေကတော့:
```
--force
```
- Confirmation prompts တွေကို ကျော်လွှားတယ်။
- Manual input မလိုအပ်တဲ့ automation သို့မဟုတ် scripting အတွက် အသုံးဝင်တယ်။
- CLI က အဆင်မပြေမှုတွေကို detect လုပ်ရင်တောင် interruption မရှိဘဲ teardown လုပ်နိုင်စေတယ်။

```
--purge
```
**Metadata အားလုံး** ကို ဖျက်သိမ်းတယ်၊ အထူးသဖြင့်:
Environment state
Local `.azure` folder
Cached deployment info
azd ရဲ့ "remembering" အခြေအနေကို ဖယ်ရှားပေးပြီး၊ resource group မကိုက်ညီမှု သို့မဟုတ် stale registry references စတဲ့ပြဿနာတွေကို ကာကွယ်ပေးတယ်။

### ဘာကြောင့် နှစ်ခုလုံးကို အသုံးပြုသင့်လဲ?
`azd up` ကို lingering state သို့မဟုတ် partial deployments ကြောင့် အဆင်မပြေတဲ့အခါမှာ ဒီ combo က **သန့်ရှင်းတဲ့အခြေအနေ** ကိုအာမခံပေးတယ်။

အထူးသဖြင့် Azure portal မှာ manual resource deletions လုပ်ပြီးနောက် သို့မဟုတ် template, environment, resource group naming conventions တွေကို ပြောင်းလဲတဲ့အခါမှာ အထူးအသုံးဝင်ပါတယ်။

### Multiple Environments ကို စီမံခန့်ခွဲခြင်း
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Navigation Commands

### Discovery
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Project Management
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitoring
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## အကောင်းဆုံးအလေ့အကျင့်များ

### 1. အဓိပ္ပာယ်ရှိတဲ့နာမည်တွေကို အသုံးပြုပါ
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Templates ကို အသုံးချပါ
- ရှိပြီးသား templates တွေနဲ့ စတင်ပါ
- သင့်လိုအပ်ချက်အတွက် customize လုပ်ပါ
- သင့်အဖွဲ့အစည်းအတွက် reusable templates တွေကို ဖန်တီးပါ

### 3. Environment Isolation ကို အသုံးပြုပါ
- dev/staging/prod အတွက် environment တွေကို ခွဲခြားအသုံးပြုပါ
- ဒေသတွင်းကနေ production ကို တိုက်ရိုက် deploy လုပ်မထားပါနှင့်
- Production deployments အတွက် CI/CD pipelines ကို အသုံးပြုပါ

### 4. Configuration Management ကို အားထားပါ
- Sensitive data အတွက် environment variables ကို အသုံးပြုပါ
- Configuration ကို version control မှာ ထိန်းသိမ်းပါ
- Environment-specific settings တွေကို documentation ထဲမှာ ထည့်သွင်းပါ

## သင်ယူမှုအဆင့်များ

### Beginner (Week 1-2)
1. azd ကို install လုပ်ပြီး authenticate လုပ်ပါ
2. ရိုးရှင်းတဲ့ template တစ်ခုကို deploy လုပ်ပါ
3. Project structure ကိုနားလည်ပါ
4. အခြေခံ commands (up, down, deploy) ကို လေ့လာပါ

### Intermediate (Week 3-4)
1. Templates တွေကို customize လုပ်ပါ
2. Multiple environments ကို စီမံပါ
3. Infrastructure code ကိုနားလည်ပါ
4. CI/CD pipelines ကို set up လုပ်ပါ

### Advanced (Week 5+)
1. Custom templates တွေကို ဖန်တီးပါ
2. Infrastructure patterns advanced ဖြစ်စေပါ
3. Multi-region deployments ကို လုပ်ဆောင်ပါ
4. Enterprise-grade configurations ကို အသုံးပြုပါ

## နောက်တစ်ဆင့်

**📖 အခန်း 1 သင်ယူမှုကို ဆက်လက်လုပ်ဆောင်ပါ:**
- [Installation & Setup](installation.md) - azd ကို install နဲ့ configure လုပ်ပါ
- [Your First Project](first-project.md) - လက်တွေ့ tutorial ကို ပြီးမြောက်ပါ
- [Configuration Guide](configuration.md) - အဆင့်မြင့် configuration ရွေးချယ်မှုများ

**🎯 နောက်အခန်းအဆင့်သို့ ပြင်ဆင်ပါ:**
- [အခန်း 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md) - AI applications တွေကို စတင်တည်ဆောက်ပါ

## အပိုဆောင်းအရင်းအမြစ်များ

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာမူလ**: [AZD အခြေခံသင်ခန်းစာ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန်စတင်ခြင်း  
- **⬅️ အရင်အခန်း**: [သင်ခန်းစာအကျဉ်းချုပ်](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ နောက်အခန်း**: [Installation & Setup](installation.md)
- **🚀 နောက်အခန်း**: [အခန်း 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူလဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။