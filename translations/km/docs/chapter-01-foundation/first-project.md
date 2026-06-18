# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

សូមស្វាគមਨ៍មកកាន់គម្រោង Azure Developer CLI ដំបូងរបស់អ្នក! មេរៀនអនុវត្តប្រៀបនេះផ្តល់ការបណ្តុះបណ្តាលពេញលេញពីការបង្កើត ការចែកចាយ និងការគ្រប់គ្រងកម្មវិធី full-stack នៅលើ Azure ដោយប្រើ azd។ អ្នកនឹងធ្វើការជាមួយកម្មវិធី todo ពិត ដែលមាន React frontend, Node.js API backend និង MongoDB database។

## Learning Goals

ដោយបញ្ចប់មេរៀននេះ អ្នកនឹង:
- អភិវឌ្ឍជំនាញលើធ្វើដំណើរ initialization គម្រោង azd ដោយប្រើសំពាធសាលា (templates)
- យល់ដឹងអំពីរចនាសម្ព័ន្ធគម្រោង Azure Developer CLI និងគ្រប់កំណត់រចនាសម្ព័ន្ធ
- អនុវត្តការចែកចាយកម្មវិធីពេញលេញទៅ Azure រួមទាំងការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ
- អនុវត្តយុទ្ធសាស្រ្តធ្វើបច្ចុប្បន្នភាពកម្មវិធី និងចែកចាយឡើងវិញ
- គ្រប់គ្រងបរិយាកាសច្រើនសម្រាប់ការអភិវឌ្ឍន៍ និង staging
- អនុវត្តការសម្អាតធនធាន និងការគ្រប់គ្រងថ្លៃដើម

## Learning Outcomes

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច:
- Initialize និងកំណត់រចនាសម្ព័ន្ធគម្រោង azd ពាពី templates ដោយធ្វើឡើងដោយឯង
- នាវីហ្គេត និងកែប្រែរចនាសម្ព័ន្ធគម្រោង azd បានយ៉ាងមានប្រសិទ្ធភាព
- ចែកចាយកម្មវិធី full-stack ទៅ Azure ដោយប្រើពាក្យបញ្ជាមួយគត់
- ប្តូរការពិនិត្យបញ្ហាចែកចាយទូទៅ និងបញ្ហាផ្នែក authentication
- គ្រប់គ្រងបរិយាកាស Azure ច្រើនសម្រាប់ដំណាក់កាលចែកចាយខុសគ្នា
- អនុវត្តចរន្តចែកចាយបន្តសម្រាប់ការអាប់ដេតកម្មវិធី

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication completed with `azd auth login`
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

មុននឹងបន្ត សូមរត់កម្មវិធី validator សម្រាប់ការតម្រុយពី root នៃ repository៖

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verify Your Setup
```bash
# ពិនិត្យការដំឡើង azd
azd version

# ពិនិត្យការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ AZD
azd auth login --check-status
```

### Verify optional Azure CLI authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

ចាប់ផ្តើមជាមួយ template todo ដែលពេញនិយម ដែលរួមមាន React frontend និង Node.js API backend។

```bash
# រុករកគំរូដែលមាន
azd template list

# ចាប់ផ្តើមគំរូកម្មវិធី To-Do
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ធ្វើតាមការណែនាំ:
# - បញ្ចូលឈ្មោះបរិស្ថាន: "dev"
# - ជ្រើសរើសការជាវ (បើអ្នកមានច្រើន)
# - ជ្រើសរើសតំបន់: "East US 2" (ឬតំបន់ដែលអ្នកចូលចិត្ត)
```

### What Just Happened?
- បានទាញយកកូដ template មកក្នុងថតបណ្តាញក្នុងเครื่องរបស់អ្នក
- បានបង្កើតឯកសារ `azure.yaml` ដែលមានការពិពណ៌នាសេវាកម្ម
- បានកំណត់កូដហេដ្ឋារចនាសម្ព័ន្ធក្នុងថត `infra/`
- បានបង្កើតការកំណត់បរិយាកាស

## Step 2: Explore the Project Structure

ចាំមើលអ្វីដែល azd បានបង្កើតសម្រាប់យើង៖

```bash
# មើលរចនាសម្ព័ន្ធគម្រោង
tree /f   # វីនដូ
# ឬ
find . -type f | head -20   # ម៉ាក់អូអេស/លីនុច
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

**azure.yaml** - ដើមទ្រូងនៃគម្រោង azd របស់អ្នក:
```bash
# មើលការកំណត់រចនាសម្ព័ន្ធនៃគម្រោង
cat azure.yaml
```

**infra/main.bicep** - ការកំណត់ហេដ្ឋារចនាសម្ព័ន្ធ:
```bash
# មើលកូដរចនាសម្ព័ន្ធ
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

មុនចែកចាយ អ្នកអាចប្ដូរតាមតម្រូវការកម្មវិធីបាន៖

### Modify the Frontend
```bash
# បើកធាតុ (component) នៃកម្មវិធី React
code src/web/src/App.tsx
```

ធ្វើការផ្លាស់ប្តូរពិសេសតូចមួយ:
```typescript
// ស្វែងរកចំណងជើង និងផ្លាស់ប្តូរវា
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# កំណត់អថេរបរិស្ថានផ្ទាល់ខ្លួន
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# មើលអថេរបរិស្ថានទាំងអស់
azd env get-values
```

## Step 4: Deploy to Azure

ឥឡូវនេះទៅកាន់ផ្នែករំភើប - ចែកចាយអ្វីៗទាំងអស់ទៅ Azure!

```bash
# ដាក់ឲ្យដំណើរការ ហេដ្ឋារចនាសម្ព័ន្ធ និងកម្មវិធី
azd up

# ពាក្យបញ្ជានេះនឹង:
# 1. ផ្គត់ផ្គង់ធនធាន Azure (App Service, Cosmos DB, ល។)
# 2. សាងសង់កម្មវិធីរបស់អ្នក
# 3. ដាក់ឲ្យដំណើរការ​ទៅលើ​ធនធាន​ដែលបានផ្គត់ផ្គង់
# 4. បង្ហាញ URL នៃកម្មវិធី
```

### What's Happening During Deployment?

ពាក្យបញ្ជា `azd up` ប្រតិបត្តិជំហានទាំងនេះ:
1. **Provision** (`azd provision`) - បង្កើតធនធាន Azure
2. **Package** - សង់កូដកម្មវិធីរបស់អ្នក
3. **Deploy** (`azd deploy`) - ចែកចាយកូដទៅធនធាន Azure

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
ចុចលើ URL ដែលបានផ្តល់ក្នុងលទ្ធផលចែកចាយ ឬទទួលបានវានៅពេលណាមួយ:
```bash
# យកចំណុចបញ្ចប់នៃកម្មវិធី
azd show

# បើកកម្មវិធីក្នុងកម្មវិធីរុករករបស់អ្នក
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - ចុច "Add Todo" ហើយបញ្ចូលភារៈការ
2. **Mark as complete** - ទទូចឲ្យសញ្ញាសម្គាល់ធាតុដែលបានបញ្ចប់
3. **Delete items** - លុប todo ដែលអ្នកមិនត្រូវការម្តងទៀត

### Monitor Your Application
```bash
# បើកផ្ទាំង Azure សម្រាប់ធនធានរបស់អ្នក
azd monitor

# មើលកំណត់ហេតុកម្មវិធី
azd monitor --logs

# មើលមាត្រដ្ឋានផ្ទាល់
azd monitor --live
```

### ✅ Verify Your Deployment

មុននឹងបន្ត សូមអនុវត្តតាមបញ្ជីពិនិត្យរហ័សនេះដើម្បីបញ្ជាក់ថារបស់ទាំងអស់ធ្វើបាន—កុំសន្មតថា "deploy succeeded" មានន័យថា "កម្មវិធីដំណើរការ":

```bash
# 1. បញ្ជាក់ថាចំណុចបញ្ចប់មានស្រាប់ និងអាចទាក់ទងបាន
azd show

# 2. ធ្វើសាកល្បងសាមញ្ញលើចំណុចបញ្ចប់ (រំពឹង HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. ពិនិត្យចំណុចសុខភាព ប្រសិនបើកម្មវិធីរបស់អ្នកផ្តល់មួយ
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Deployment is verified when:**
- ✅ `azd show` lists a reachable endpoint URL
- ✅ The URL opens in your browser without errors
- ✅ Core features work (add/complete/delete a todo)
- ✅ `azd monitor --logs` shows requests arriving with no unexpected errors

If any check fails, jump to [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

## Step 6: Make Changes and Redeploy

ចាំអនុវត្តចំណ.Modify ហើយមើលថាវាងាយស្រួលប៉ុណ្ណា ក្នុងការអាប់ដេតៈ

### Modify the API
```bash
# កែសម្រួលកូដ API
code src/api/src/routes/lists.js
```

Add a custom response header:
```javascript
// ស្វែងរកកម្មវិធីចាត់ការផ្លូវ ហើយបន្ថែម:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# ដាក់ចេញតែកូដកម្មវិធី (រំលងហេដ្ឋារចនាសម្ព័ន្ធ)
azd deploy

# នេះរហ័សជាង 'azd up' ច្រើន ពីព្រោះហេដ្ឋារចនាសម្ព័ន្ធមានរួចហើយ
```

## Step 7: Manage Multiple Environments

បង្កើតបរិយាកាស staging ដើម្បីសាកល្បងការផ្លាស់ប្ដូរមុនពេលទៅផលិតកម្ម:

```bash
# បង្កើតបរិស្ថានស្តេជថ្មី
azd env new staging

# ដាក់ប្រើទៅបរិស្ថានស្តេជ
azd up

# ប្ដូរវិញទៅបរិស្ថានអភិវឌ្ឍន៍
azd env select dev

# បញ្ជីបរិស្ថានទាំងអស់
azd env list
```

### Environment Comparison
```bash
# មើលបរិយាកាសអភិវឌ្ឍន៍
azd env select dev
azd show

# មើលបរិយាកាសសាកល្បង
azd env select staging
azd show
```

## Step 8: Clean Up Resources

នៅពេលអ្នកបានបញ្ចប់ការសាកល្បង សូមសម្អាតដើម្បីជៀសវាងកម្រៃប្រចាំខែ:

```bash
# លុបធនធាន Azure ទាំងអស់សម្រាប់បរិយាកាសបច្ចុប្បន្ន
azd down

# បង្ខំលុបដោយគ្មានការបញ្ជាក់ និងលុបចោលធនធានដែលបានលុបប្រភេទស្រាល
azd down --force --purge

# លុបបរិយាកាសជាក់លាក់
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

អ្នកទើបបានចែកចាយកម្មវិធីវែបដ៏ប្រពៃណីមួយ។ តែបើអ្នកចង់ចែកចាយកម្មវិធីដែលមានថាមពល AI ជាជម្រើស — ឧទាហរណ៍ app ជជែក ដែលមាន Microsoft Foundry Models ជាថាមពលក្រោយ?

ដំណឹងល្អគឺ៖ **ដំណើរការគឺដូចគ្នា។**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ភាពខុសគ្នាឯងតែមួយគឺ **template** ដែលអ្នកចាប់ផ្តើម។ Template AI អាចរួមបញ្ចូលហេដ្ឋារចនាសម្ព័ន្ធបន្ថែម (ដូចជា Microsoft Foundry Models resource ឬ AI Search index), ប៉ុន្តែ azd ទទួលខុសត្រូវគ្រប់យ៉ាងនោះសម្រាប់អ្នក។ អ្នកមិនចាំបាច់រៀនពាក្យបញ្ជាថ្មី មិនចាំបាច់យកឧបករណ៍ផ្សេង ឬប្ដូរគំនិតរបស់អ្នកអំពីការចែកចាយទេ។

នេះជាគោលការណ៍ស្នូលរបស់ azd៖ **one workflow, any workload.** ជំនាញដែលអ្នកបានអនុវត្តក្នុងមេរៀននេះ—initializing, deploying, monitoring, redeploying, និង cleaning up—អាចប្រើបានដូចគ្នាក្នុងកម្មវិធី AI និង agents។

---

## What You've Learned

សូមអបអរសាទរ! អ្នកបានជោគជ័យក្នុង​ការ:
- ✅ Initialized an azd project from a template
- ✅ Explored the project structure and key files
- ✅ Deployed a full-stack application to Azure
- ✅ Made code changes and redeployed
- ✅ Managed multiple environments
- ✅ Cleaned up resources

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrate mastery of azd init and deployment workflow

```bash
# សាកល្បងស្តាក់ Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ផ្ទៀងផ្ទាត់ការតំឡើង
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# សម្អាត
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

# បង្កើតបរិយាកាសផ្ទាល់ខ្លួន
azd env new custom-config

# កំណត់អថេរផ្ទាល់ខ្លួន
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ផ្ទៀងផ្ទាត់អថេរ
azd env get-values | grep APP_TITLE

# ដាក់ប្រើជាមួយការកំណត់រចនាសម្ព័ន្ធផ្ទាល់ខ្លួន
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
# បង្កើតបរិយាកាសអភិវឌ្ឍន៍
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# កត់សម្គាល់ URL អភិវឌ្ឍន៍
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# បង្កើតបរិយាកាសស្ទេជីង
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# កត់សម្គាល់ URL ស្ទេជីង
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ប្រៀបធៀបបរិយាកាសទាំងពីរ
azd env list

# សាកល្បងបរិយាកាសទាំងពីរ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# សម្អាតបរិយាកាសទាំងពីរ
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
# ផ្ទៀងផ្ទាត់សម្គាល់ជាមួយ Azure ម្តងទៀត
az login

# ផ្ទៀងផ្ទាត់សិទ្ធិចូលប្រើសេវាជាវ
az account show
```

### Deployment Failures
```bash
# បើកកំណត់ហេតុសម្រាប់ការដោះស្រាយកំហុស
export AZD_DEBUG=true
azd up --debug

# មើលកំណត់ហេតុកម្មវិធីនៅក្នុង Azure
azd monitor --logs

# សម្រាប់ Container Apps, សូមប្រើ Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# ប្រើឈ្មោះបរិយាកាសដែលមិនទាន់មាន
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# ពិនិត្យថាច្រកមានសេរីឬទេ
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

ឥឡូវនេះដែលអ្នកបានបញ្ចប់គម្រោងដំបូងរបស់អ្នក សូមស្វែងរកប្រធានបទជំរុញទាំងនេះ៖

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
# រុករកគំរូតាមប្រភេទ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# សាកល្បងសំណុំបច្ចេកវិទ្យាផ្សេងៗ
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

**Congratulations on completing your first azd project!** You're now ready to build and deploy amazing applications on Azure with confidence.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->