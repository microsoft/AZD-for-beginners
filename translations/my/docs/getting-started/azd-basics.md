<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4dc26ed8004b58a51875efd07203340f",
  "translation_date": "2025-09-26T18:47:25+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "my"
}
-->
# AZD အခြေခံ - Azure Developer CLI ကိုနားလည်ခြင်း

# AZD အခြေခံ - အဓိကအကြောင်းအရာများနှင့် အခြေခံအချက်များ

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံသင်ခန်းစာ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်**: [သင်ခန်းစာအကျဉ်းချုပ်](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ နောက်တစ်ခု**: [Installation & Setup](installation.md)
- **🚀 နောက်အခန်း**: [အခန်း 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## မိတ်ဆက်

ဒီသင်ခန်းစာမှာ Azure Developer CLI (azd) ကိုမိတ်ဆက်ပေးမှာဖြစ်ပြီး၊ ဒါဟာ သင့်ရဲ့ ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure သို့ deployment ကို အရှိန်မြှင့်ပေးနိုင်တဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ azd က cloud-native application deployment ကိုရိုးရှင်းစေတဲ့နည်းလမ်းတွေ၊ အဓိကအင်္ဂါရပ်တွေကို သင်လေ့လာနိုင်မှာဖြစ်ပြီး၊ အခြေခံအချက်တွေကိုနားလည်စေမှာဖြစ်ပါတယ်။

## သင်ယူရမည့်အချက်များ

ဒီသင်ခန်းစာအဆုံးမှာ သင်:
- Azure Developer CLI (azd) ဆိုတာဘာလဲ၊ အဓိကရည်ရွယ်ချက်ကဘာလဲဆိုတာနားလည်နိုင်ပါမယ်
- Template, Environment, Service တွေကို အခြေခံအကြောင်းအရာများကိုလေ့လာနိုင်ပါမယ်
- Template-driven development နဲ့ Infrastructure as Code အင်္ဂါရပ်တွေကို ရှာဖွေတွေ့ရှိနိုင်ပါမယ်
- azd project structure နဲ့ workflow ကိုနားလည်နိုင်ပါမယ်
- သင့် development environment အတွက် azd ကို install နဲ့ configure လုပ်ဖို့ ပြင်ဆင်နိုင်ပါမယ်

## သင်ယူရမည့်ရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးတဲ့အခါမှာ သင်:
- azd ရဲ့ modern cloud development workflow မှာ အရေးပါမှုကိုရှင်းပြနိုင်ပါမယ်
- azd project structure ရဲ့ components တွေကိုသိရှိနိုင်ပါမယ်
- Template, Environment, Service တွေဘယ်လိုပေါင်းစပ်လုပ်ဆောင်တယ်ဆိုတာဖော်ပြနိုင်ပါမယ်
- azd နဲ့ Infrastructure as Code ရဲ့ အကျိုးကျေးဇူးတွေကိုနားလည်နိုင်ပါမယ်
- azd command တွေကို အသုံးပြုနည်းနဲ့ ရည်ရွယ်ချက်တွေကိုသိရှိနိုင်ပါမယ်

## Azure Developer CLI (azd) ဆိုတာဘာလဲ?

Azure Developer CLI (azd) က ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုကနေ Azure deployment ကို အရှိန်မြှင့်ပေးနိုင်တဲ့ command-line tool တစ်ခုဖြစ်ပါတယ်။ Cloud-native application တွေကို Azure မှာ တည်ဆောက်ခြင်း၊ deploy လုပ်ခြင်း၊ စီမံခန့်ခွဲခြင်းလုပ်ငန်းစဉ်တွေကို ရိုးရှင်းစေပါတယ်။

## အဓိကအကြောင်းအရာများ

### Templates
Templates တွေက azd ရဲ့ အခြေခံအချက်ဖြစ်ပါတယ်။ Template တွေမှာပါဝင်တာတွေက:
- **Application code** - သင့်ရဲ့ source code နဲ့ dependencies
- **Infrastructure definitions** - Azure resources တွေကို Bicep သို့မဟုတ် Terraform နဲ့ သတ်မှတ်ထားခြင်း
- **Configuration files** - Settings နဲ့ environment variables
- **Deployment scripts** - Automated deployment workflows

### Environments
Environments တွေက deployment targets ကို ကိုယ်စားပြုပါတယ်:
- **Development** - စမ်းသပ်ခြင်းနဲ့ ဖွံ့ဖြိုးတိုးတက်မှုအတွက်
- **Staging** - Pre-production environment
- **Production** - Live production environment

Environment တစ်ခုစီမှာ:
- Azure resource group
- Configuration settings
- Deployment state ကို ကိုယ်ပိုင်ထားပါတယ်

### Services
Services တွေက သင့် application ရဲ့ အဆောက်အအုံတွေဖြစ်ပါတယ်:
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

azd project structure ရဲ့ ပုံမှန်အဆောက်အအုံ:
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
`azd down --force --purge` command က azd environment နဲ့ ဆက်စပ် resource တွေကို အပြည့်အဝဖျက်သိမ်းဖို့ အင်အားကြီးတဲ့နည်းလမ်းတစ်ခုဖြစ်ပါတယ်။ Flag တစ်ခုစီရဲ့လုပ်ဆောင်ချက်ကို အောက်မှာဖော်ပြထားပါတယ်:
```
--force
```
- Confirmation prompts တွေကို ကျော်လွှားပါတယ်။
- Manual input မလိုအပ်တဲ့ automation သို့မဟုတ် scripting အတွက် အသုံးဝင်ပါတယ်။
- CLI က အဆင်မပြေမှုတွေကို detect လုပ်ရင်တောင် အတားအဆီးမရှိဘဲ teardown ကို ဆက်လက်လုပ်ဆောင်နိုင်ပါတယ်။

```
--purge
```
Metadata အားလုံးကို ဖျက်သိမ်းပါတယ်၊ အပါအဝင်:
Environment state
ဒေသတွင်း `.azure` folder
Cached deployment info
azd ရဲ့ "remembering" အခြေအနေကို ဖယ်ရှားပေးပြီး၊ resource group မကိုက်ညီမှု သို့မဟုတ် stale registry references စတဲ့ပြဿနာတွေကို ကာကွယ်ပေးပါတယ်။

### အဘယ်ကြောင့် နှစ်ခုလုံးကို အသုံးပြုသင့်သလဲ?
`azd up` မှာ lingering state သို့မဟုတ် partial deployments ကြောင့် အခက်အခဲရှိတဲ့အခါမှာ ဒီ combo က **သန့်ရှင်းတဲ့အခြေအနေ** ကိုအာမခံပေးပါတယ်။

Azure portal မှာ manual resource deletions လုပ်ပြီးနောက် သို့မဟုတ် template, environment, resource group naming conventions တွေကို ပြောင်းလဲတဲ့အခါမှာ အထူးအသုံးဝင်ပါတယ်။

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

## 🔐 Authentication နဲ့ Credentials

Authentication ကိုနားလည်ခြင်းက azd deployments အောင်မြင်ဖို့အတွက် အရေးကြီးပါတယ်။ Azure က authentication methods အမျိုးမျိုးကို အသုံးပြုပြီး၊ azd က Azure tools အခြားတွေမှာ အသုံးပြုတဲ့ credential chain ကိုပဲ leverage လုပ်ပါတယ်။

### Azure CLI Authentication (`az login`)

azd ကို အသုံးပြုမည့်အခါမှာ Azure နဲ့ authenticate လုပ်ဖို့လိုအပ်ပါတယ်။ အများဆုံးအသုံးပြုတဲ့နည်းလမ်းက Azure CLI ကို အသုံးပြုခြင်းဖြစ်ပါတယ်:

```bash
# Interactive login (opens browser)
az login

# Login with specific tenant
az login --tenant <tenant-id>

# Login with service principal
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# Check current login status
az account show

# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription <subscription-id>
```

### Authentication Flow
1. **Interactive Login**: သင့် default browser ကိုဖွင့်ပြီး authenticate လုပ်ခြင်း
2. **Device Code Flow**: Browser access မရှိတဲ့ environment တွေအတွက်
3. **Service Principal**: Automation နဲ့ CI/CD scenarios အတွက်
4. **Managed Identity**: Azure-hosted applications အတွက်

### DefaultAzureCredential Chain

`DefaultAzureCredential` က credential type တစ်ခုဖြစ်ပြီး၊ credential sources အမျိုးမျိုးကို အတိအကျအဆင့်လိုက်စမ်းသပ်ပေးတဲ့ simplified authentication အတွေ့အကြုံကိုပေးပါတယ်:

#### Credential Chain Order
```mermaid
graph TD
    A[DefaultAzureCredential] --> B[Environment Variables]
    B --> C[Workload Identity]
    C --> D[Managed Identity]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[Interactive Browser]
```

#### 1. Environment Variables
```bash
# Set environment variables for service principal
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
အလိုအလျောက်အသုံးပြုသော:
- Azure Kubernetes Service (AKS) နဲ့ Workload Identity
- GitHub Actions နဲ့ OIDC federation
- အခြား federated identity scenarios

#### 3. Managed Identity
Azure resources အတွက်:
- Virtual Machines
- App Service
- Azure Functions
- Container Instances

```bash
# Check if running on Azure resource with managed identity
az account show --query "user.type" --output tsv
# Returns: "servicePrincipal" if using managed identity
```

#### 4. Developer Tools Integration
- **Visual Studio**: Signed-in account ကို အလိုအလျောက်အသုံးပြုခြင်း
- **VS Code**: Azure Account extension credentials ကို အသုံးပြုခြင်း
- **Azure CLI**: `az login` credentials ကို အသုံးပြုခြင်း (ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုအတွက် အများဆုံးအသုံးပြု)

### AZD Authentication Setup

```bash
# Method 1: Use Azure CLI (Recommended for development)
az login
azd auth login  # Uses existing Azure CLI credentials

# Method 2: Direct azd authentication
azd auth login --use-device-code  # For headless environments

# Method 3: Check authentication status
azd auth login --check-status

# Method 4: Logout and re-authenticate
azd auth logout
azd auth login
```

### Authentication Best Practices

#### ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှုအတွက်
```bash
# 1. Login with Azure CLI
az login

# 2. Verify correct subscription
az account show
az account set --subscription "Your Subscription Name"

# 3. Use azd with existing credentials
azd auth login
```

#### CI/CD Pipelines အတွက်
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### Production Environments အတွက်
- Azure resources မှာ run လုပ်တဲ့အခါ **Managed Identity** ကိုအသုံးပြုပါ
- Automation scenarios အတွက် **Service Principal** ကိုအသုံးပြုပါ
- Credentials တွေကို code သို့မဟုတ် configuration files မှာ သိမ်းဆည်းခြင်းကိုရှောင်ပါ
- Sensitive configuration အတွက် **Azure Key Vault** ကိုအသုံးပြုပါ

### Common Authentication Issues နဲ့ Solutions

#### ပြဿနာ: "No subscription found"
```bash
# Solution: Set default subscription
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### ပြဿနာ: "Insufficient permissions"
```bash
# Solution: Check and assign required roles
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Common required roles:
# - Contributor (for resource management)
# - User Access Administrator (for role assignments)
```

#### ပြဿနာ: "Token expired"
```bash
# Solution: Re-authenticate
az logout
az login
azd auth logout
azd auth login
```

### Authentication in Different Scenarios

#### ဒေသတွင်းဖွံ့ဖြိုးတိုးတက်မှု
```bash
# Personal development account
az login
azd auth login
```

#### အဖွဲ့ဖွံ့ဖြိုးတိုးတက်မှု
```bash
# Use specific tenant for organization
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### Multi-tenant Scenarios
```bash
# Switch between tenants
az login --tenant tenant1.onmicrosoft.com
# Deploy to tenant 1
azd up

az login --tenant tenant2.onmicrosoft.com  
# Deploy to tenant 2
azd up
```

### Security Considerations

1. **Credential Storage**: Credentials တွေကို source code မှာ သိမ်းဆည်းမထားပါနှင့်
2. **Scope Limitation**: Service principals အတွက် least-privilege principle ကိုအသုံးပြုပါ
3. **Token Rotation**: Service principal secrets တွေကို regular လုပ်ပြီး rotate လုပ်ပါ
4. **Audit Trail**: Authentication နဲ့ deployment activities တွေကို စောင့်ကြည့်ပါ
5. **Network Security**: Private endpoints ကို အသုံးပြုပါ

### Troubleshooting Authentication

```bash
# Debug authentication issues
azd auth login --check-status
az account show
az account get-access-token

# Common diagnostic commands
whoami                          # Current user context
az ad signed-in-user show      # Azure AD user details
az group list                  # Test resource access
```

## `azd down --force --purge` ကိုနားလည်ခြင်း

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

## Best Practices

### 1. အဓိပ္ပါယ်ရှိတဲ့နာမည်တွေကို အသုံးပြုပါ
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Templates ကို အသုံးပြုပါ
- ရှိပြီးသား templates တွေနဲ့ စတင်ပါ
- သင့်လိုအပ်ချက်အတွက် customize လုပ်ပါ
- သင့်အဖွဲ့အစည်းအတွက် reusable templates တွေကို ဖန်တီးပါ

### 3. Environment Isolation
- Dev/Staging/Prod အတွက် environment တွေကို သီးသန့်အသုံးပြုပါ
- ဒေသတွင်းစက်ကနေ production ကို တိုက်ရိုက် deploy မလုပ်ပါနှင့်
- Production deployments အတွက် CI/CD pipelines ကို အသုံးပြုပါ

### 4. Configuration Management
- Sensitive data အတွက် environment variables ကို အသုံးပြုပါ
- Configuration ကို version control မှာ သိမ်းဆည်းပါ
- Environment-specific settings တွေကို documentation လုပ်ပါ

## သင်ယူမှုတိုးတက်မှု

### Beginner (Week 1-2)
1. azd ကို install လုပ်ပြီး authenticate လုပ်ပါ
2. ရိုးရှင်းတဲ့ template တစ်ခုကို deploy လုပ်ပါ
3. Project structure ကိုနားလည်ပါ
4. Basic commands (up, down, deploy) တွေကို လေ့လာပါ

### Intermediate (Week 3-4)
1. Templates တွေကို customize လုပ်ပါ
2. Multiple environments ကို စီမံခန့်ခွဲပါ
3. Infrastructure code ကိုနားလည်ပါ
4. CI/CD pipelines တွေကို setup လုပ်ပါ

### Advanced (Week 5+)
1. Custom templates တွေကို ဖန်တီးပါ
2. Infrastructure patterns advanced တွေကို လေ့လာပါ
3. Multi-region deployments ကို လုပ်ဆောင်ပါ
4. Enterprise-grade configurations ကို အသုံးပြုပါ

## နောက်တစ်ဆင့်

**📖 အခန်း 1 သင်ယူမှုဆက်လက်လုပ်ဆောင်ရန်:**
- [Installation & Setup](installation.md) - azd ကို install နဲ့ configure လုပ်ပါ
- [Your First Project](first-project.md) - လက်တွေ့ tutorial ကို ပြီးမြောက်ပါ
- [Configuration Guide](configuration.md) - Configuration options advanced တွေကို လေ့လာပါ

**🎯 နောက်အခန်းအဆင့်သို့ ပြင်ဆင်ပါ:**
- [အခန်း 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md) - AI applications တွေကို စတင်တည်ဆောက်ပါ

## အပိုဆောင်းအရင်းအမြစ်များ

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံသင်ခန်းစာ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန်စတင်ခြင်း  
- **⬅️ ယခင်**: [သင်ခန်းစာအကျဉ်းချုပ်](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ နောက်တစ်ခု**: [Installation & Setup](installation.md)
- **🚀 နောက်အခန်း**: [အခန်း 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

---

