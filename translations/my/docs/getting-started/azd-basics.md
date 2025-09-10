<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:14:51+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "my"
}
-->
# AZD အခြေခံ - Azure Developer CLI ကိုနားလည်ခြင်း

## အကျဉ်းချုပ်

ဒီသင်ခန်းစာမှာ Azure Developer CLI (azd) ကိုမိတ်ဆက်ပေးမှာဖြစ်ပြီး၊ ဒါဟာ သင့်ရဲ့ ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure ပေါ်မှာ deployment အထိ အလျင်အမြန်ရောက်ရှိစေတဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ သင် azd ရဲ့ အခြေခံအယူအဆများ၊ အဓိကအင်္ဂါရပ်များကိုလေ့လာပြီး cloud-native application deployment ကိုရိုးရှင်းစေတဲ့နည်းလမ်းများကိုနားလည်သွားပါမယ်။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီသင်ခန်းစာအဆုံးမှာ သင်:
- Azure Developer CLI ရဲ့ အဓိကရည်ရွယ်ချက်ကိုနားလည်မယ်
- Template, Environment, Service စတဲ့ အခြေခံအယူအဆများကိုလေ့လာမယ်
- Template-Driven Development နဲ့ Infrastructure as Code အပါအဝင် အဓိက feature များကိုလေ့လာမယ်
- azd project structure နဲ့ workflow ကိုနားလည်မယ်
- သင့် development environment အတွက် azd ကို install နဲ့ configure လုပ်ဖို့ ပြင်ဆင်ထားမယ်

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးပြီးနောက်မှာ သင်:
- အခေတ်မီ cloud development workflow တွေမှာ azd ရဲ့บทบาทကိုရှင်းပြနိုင်မယ်
- azd project structure ရဲ့ components တွေကိုသိရှိနိုင်မယ်
- Template, Environment, Service တွေဘယ်လိုပေါင်းစည်းလုပ်ဆောင်တယ်ဆိုတာဖော်ပြနိုင်မယ်
- azd နဲ့ Infrastructure as Code ရဲ့ အကျိုးကျေးဇူးတွေကိုနားလည်နိုင်မယ်
- azd command များနဲ့၎င်းတို့ရဲ့ရည်ရွယ်ချက်ကိုသိရှိနိုင်မယ်

## Azure Developer CLI (azd) ဆိုတာဘာလဲ?

Azure Developer CLI (azd) ဟာ ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure ပေါ်မှာ deployment အထိ အလျင်အမြန်ရောက်ရှိစေဖို့အတွက် specially design လုပ်ထားတဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ ဒါဟာ Azure ပေါ်မှာ cloud-native application တွေကို တည်ဆောက်ခြင်း၊ deploy လုပ်ခြင်း၊ စီမံခန့်ခွဲခြင်းလုပ်ငန်းစဉ်တွေကိုရိုးရှင်းစေပါတယ်။

## အခြေခံအယူအဆများ

### Templates
Templates တွေဟာ azd ရဲ့ အခြေခံအဆောက်အအုံဖြစ်ပါတယ်။ Template တွေမှာပါဝင်တာတွေက:
- **Application code** - သင့်ရဲ့ source code နဲ့ dependencies
- **Infrastructure definitions** - Azure resources တွေကို Bicep သို့မဟုတ် Terraform နဲ့ဖော်ပြထားတာ
- **Configuration files** - Settings နဲ့ environment variables
- **Deployment scripts** - Automated deployment workflows

### Environments
Environments တွေဟာ deployment targets အမျိုးမျိုးကိုကိုယ်စားပြုပါတယ်:
- **Development** - စမ်းသပ်ခြင်းနဲ့ ဖွံ့ဖြိုးတိုးတက်မှုအတွက်
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
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
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

azd project structure ရဲ့ typical အဆောက်အအုံ:
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
azd down --force --purge
```

### Managing Multiple Environments
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

## အကောင်းဆုံးအလေ့အထများ

### 1. အဓိပ္ပါယ်ရှိတဲ့နာမည်တွေကိုသုံးပါ
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Templates ကိုအသုံးချပါ
- ရှိပြီးသား templates တွေနဲ့စတင်ပါ
- သင့်လိုအပ်ချက်အတွက် customize လုပ်ပါ
- သင့်အဖွဲ့အစည်းအတွက် reusable templates တွေဖန်တီးပါ

### 3. Environment Isolation
- dev/staging/prod အတွက် environment တွေကိုသီးသန့်အသုံးပြုပါ
- ဒေသတွင်းကနေ production ကိုတိုက်ရိုက် deploy မလုပ်ပါနဲ့
- Production deployments အတွက် CI/CD pipelines ကိုအသုံးပြုပါ

### 4. Configuration Management
- Sensitive data အတွက် environment variables ကိုအသုံးပြုပါ
- Configuration ကို version control မှာထိန်းသိမ်းပါ
- Environment-specific settings တွေကို documentation လုပ်ပါ

## သင်ယူမှုအဆင့်များ

### Beginner (Week 1-2)
1. azd ကို install လုပ်ပြီး authenticate လုပ်ပါ
2. ရိုးရှင်းတဲ့ template တစ်ခုကို deploy လုပ်ပါ
3. Project structure ကိုနားလည်ပါ
4. အခြေခံ command (up, down, deploy) တွေကိုလေ့လာပါ

### Intermediate (Week 3-4)
1. Templates တွေကို customize လုပ်ပါ
2. Multiple environments တွေကိုစီမံပါ
3. Infrastructure code ကိုနားလည်ပါ
4. CI/CD pipelines တွေကို set up လုပ်ပါ

### Advanced (Week 5+)
1. Custom templates တွေဖန်တီးပါ
2. Infrastructure patterns advance တွေကိုလေ့လာပါ
3. Multi-region deployments တွေကိုလုပ်ဆောင်ပါ
4. Enterprise-grade configurations တွေကိုအသုံးပြုပါ

## နောက်တစ်ဆင့်

- [Installation & Setup](installation.md) - azd ကို install နဲ့ configure လုပ်ပါ
- [Your First Project](first-project.md) - လက်တွေ့ tutorial
- [Configuration Guide](configuration.md) - Advanced configuration options

## အပိုဆောင်းအရင်းအမြစ်များ

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

**Navigation**
- **Previous Lesson**: [README](../../README.md)
- **Next Lesson**: [Installation & Setup](installation.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားယူမှားမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။