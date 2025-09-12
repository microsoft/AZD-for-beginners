<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "32a717e79e5363b775f9bdac58002a80",
  "translation_date": "2025-09-12T22:48:54+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "my"
}
-->
# AZD အခြေခံ - Azure Developer CLI ကိုနားလည်ခြင်း

**အရင်:** [Installation & Setup](installation.md) | **နောက်တစ်ခု:** [Configuration](configuration.md)

## အကျဉ်းချုပ်

ဒီသင်ခန်းစာမှာ Azure Developer CLI (azd) ကိုမိတ်ဆက်ပေးမှာဖြစ်ပြီး၊ ဒါဟာ သင့်ရဲ့ ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure သို့ deployment ကိုအရှိန်မြှင့်ပေးနိုင်တဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ azd ရဲ့ အခြေခံအယူအဆများ၊ အဓိကအင်္ဂါရပ်များကိုလေ့လာပြီး cloud-native application deployment ကိုရိုးရှင်းစေတဲ့နည်းလမ်းကိုနားလည်နိုင်ပါမယ်။

## သင်ယူရမည့်ရည်ရွယ်ချက်များ

ဒီသင်ခန်းစာအဆုံးမှာ သင်:
- Azure Developer CLI (azd) ဆိုတာဘာလဲ၊ အဓိကရည်ရွယ်ချက်ကဘာလဲဆိုတာနားလည်နိုင်ပါမယ်
- Template, Environment, Service ဆိုတဲ့ အခြေခံအယူအဆတွေကိုလေ့လာနိုင်ပါမယ်
- Template-driven development နဲ့ Infrastructure as Code ရဲ့ အဓိကအင်္ဂါရပ်တွေကိုလေ့လာနိုင်ပါမယ်
- azd project structure နဲ့ workflow ကိုနားလည်နိုင်ပါမယ်
- azd ကို သင့် development environment အတွက် install နဲ့ configure လုပ်ဖို့အဆင်သင့်ဖြစ်ပါမယ်

## သင်ယူပြီးရလာမည့်ရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးပြီးနောက်မှာ သင်:
- azd ရဲ့ အခန်းကဏ္ဍကို modern cloud development workflow တွေမှာရှင်းပြနိုင်ပါမယ်
- azd project structure ရဲ့ components တွေကိုသိနိုင်ပါမယ်
- Template, Environment, Service တွေဘယ်လိုအလုပ်လုပ်တယ်ဆိုတာဖော်ပြနိုင်ပါမယ်
- azd နဲ့ Infrastructure as Code ရဲ့ အကျိုးကျေးဇူးတွေကိုနားလည်နိုင်ပါမယ်
- azd command တွေကိုသိပြီး၊ အဲဒီ command တွေရဲ့ရည်ရွယ်ချက်ကိုနားလည်နိုင်ပါမယ်

## Azure Developer CLI (azd) ဆိုတာဘာလဲ?

Azure Developer CLI (azd) ဟာ ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure deployment ကိုအရှိန်မြှင့်ပေးနိုင်ဖို့အတွက်ဒီဇိုင်းထုတ်ထားတဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ Cloud-native application တွေကို Azure ပေါ်မှာတည်ဆောက်၊ deploy နဲ့ စီမံခန့်ခွဲဖို့အဆင်ပြေစေပါတယ်။

## အခြေခံအယူအဆများ

### Templates
Templates တွေဟာ azd ရဲ့ အခြေခံအဆောက်အအုံဖြစ်ပါတယ်။ Template တွေမှာပါဝင်တာတွေက:
- **Application code** - သင့်ရဲ့ source code နဲ့ dependencies
- **Infrastructure definitions** - Azure resources တွေကို Bicep သို့မဟုတ် Terraform နဲ့ဖော်ပြထားတာ
- **Configuration files** - Settings နဲ့ environment variables
- **Deployment scripts** - Automated deployment workflows

### Environments
Environments တွေဟာ deployment targets အမျိုးမျိုးကိုကိုယ်စားပြုပါတယ်:
- **Development** - စမ်းသပ်မှုနဲ့ ဖွံ့ဖြိုးတိုးတက်မှုအတွက်
- **Staging** - Pre-production environment
- **Production** - Live production environment

Environment တစ်ခုစီမှာ:
- Azure resource group
- Configuration settings
- Deployment state ကိုသီးသန့်ထိန်းသိမ်းထားပါတယ်

### Services
Services တွေဟာ သင့် application ရဲ့ အဆောက်အအုံဖြစ်ပါတယ်:
- **Frontend** - Web applications, SPAs
- **Backend** - APIs, microservices
- **Database** - Data storage solutions
- **Storage** - File နဲ့ blob storage

## အဓိကအင်္ဂါရပ်များ

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

azd project structure ရဲ့ပုံမှန်အဆောက်အအုံ:
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
Main project configuration file:
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

### Starting a New Project
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
`azd down --force --purge` command ဟာ azd environment နဲ့ ဆက်စပ်နေတဲ့ resource တွေကိုလုံးဝဖျက်သိမ်းဖို့အတွက် အင်အားကြီးတဲ့နည်းလမ်းတစ်ခုဖြစ်ပါတယ်။ အဲဒီ flag တွေကဘာလုပ်ပေးလဲဆိုတာကိုအောက်မှာဖော်ပြထားပါတယ်:
```
--force
```
- Confirmation prompts တွေကိုကျော်သွားပါတယ်။
- Manual input မလိုအပ်တဲ့ automation သို့မဟုတ် scripting အတွက်အသုံးဝင်ပါတယ်။
- CLI က အဆင်မပြေမှုတွေကိုတွေ့ရှိရင်တောင်လည်း interruption မရှိဘဲ teardown ကိုဆက်လုပ်နိုင်စေပါတယ်။

```
--purge
```
**Metadata အားလုံး** ကိုဖျက်သိမ်းပါတယ်၊ အဲဒီမှာပါဝင်တာတွေက:
Environment state  
Local `.azure` folder  
Cached deployment info  
azd ရဲ့ "remembering" အခြေအနေကိုဖျက်သိမ်းပြီး၊ resource group မကိုက်ညီမှု သို့မဟုတ် stale registry references လိုပြဿနာတွေကိုရှောင်ရှားနိုင်ပါတယ်။

### ဘာကြောင့်နှစ်ခုလုံးကိုအသုံးပြုသင့်လဲ?
`azd up` ကို lingering state သို့မဟုတ် partial deployments ကြောင့်အဆင်မပြေတဲ့အခါမှာ၊ ဒီ combo ဟာ **သန့်ရှင်းတဲ့အခြေအနေ** ကိုသေချာစေပါတယ်။

အထူးသဖြင့် Azure portal မှာ manual resource deletions လုပ်ပြီးနောက် သို့မဟုတ် template, environment, resource group naming conventions တွေကိုပြောင်းလဲတဲ့အခါမှာအသုံးဝင်ပါတယ်။

### Multiple Environments ကိုစီမံခန့်ခွဲခြင်း
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

### 1. အဓိပ္ပါယ်ရှိတဲ့နာမည်တွေကိုအသုံးပြုပါ
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Templates တွေကိုအသုံးချပါ
- ရှိပြီးသား templates တွေနဲ့စတင်ပါ
- သင့်လိုအပ်ချက်အတွက် customize လုပ်ပါ
- သင့်အဖွဲ့အစည်းအတွက် reusable templates တွေကိုဖန်တီးပါ

### 3. Environment Isolation ကိုအသုံးပြုပါ
- dev/staging/prod အတွက် environment တွေကိုသီးသန့်အသုံးပြုပါ
- ဒေသတွင်းကနေ production ကိုတိုက်ရိုက် deploy မလုပ်ပါနဲ့
- Production deployments အတွက် CI/CD pipelines ကိုအသုံးပြုပါ

### 4. Configuration Management ကိုအသုံးချပါ
- Sensitive data အတွက် environment variables ကိုအသုံးပြုပါ
- Configuration ကို version control မှာထိန်းသိမ်းပါ
- Environment-specific settings တွေကို documentation ထဲမှာဖော်ပြပါ

## သင်ယူမှုအဆင့်များ

### Beginner (Week 1-2)
1. azd ကို install လုပ်ပြီး authenticate လုပ်ပါ
2. ရိုးရှင်းတဲ့ template တစ်ခုကို deploy လုပ်ပါ
3. Project structure ကိုနားလည်ပါ
4. အခြေခံ command တွေ (up, down, deploy) ကိုလေ့လာပါ

### Intermediate (Week 3-4)
1. Templates တွေကို customize လုပ်ပါ
2. Multiple environments ကိုစီမံပါ
3. Infrastructure code ကိုနားလည်ပါ
4. CI/CD pipelines တွေကို set up လုပ်ပါ

### Advanced (Week 5+)
1. Custom templates တွေကိုဖန်တီးပါ
2. Infrastructure patterns advanced ဖြစ်တဲ့အရာတွေကိုလေ့လာပါ
3. Multi-region deployments ကိုလုပ်ပါ
4. Enterprise-grade configurations ကိုအသုံးပြုပါ

## နောက်တစ်ခု

- [Installation & Setup](installation.md) - azd ကို install နဲ့ configure လုပ်ပါ
- [Your First Project](first-project.md) - လက်တွေ့ tutorial
- [Configuration Guide](configuration.md) - Advanced configuration options

## အပိုဆောင်းရင်းမြစ်များ

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

**အရင်:** [Installation & Setup](installation.md) | **နောက်တစ်ခု:** [Configuration](configuration.md)  
- **နောက်သင်ခန်းစာ**: [Installation & Setup](installation.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှု ဝန်ဆောင်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်များ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။