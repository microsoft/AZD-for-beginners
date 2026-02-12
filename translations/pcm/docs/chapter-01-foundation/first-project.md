# Ya First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Welcome to ya first Azure Developer CLI project! Dis hands-on tutorial go show you step-by-step how to create, deploy, and manage one full-stack application for Azure using azd. You go work with real todo app wey get React frontend, Node.js API backend, and MongoDB database.

## Learning Goals

By finishing dis tutorial, you go:
- Make you sabi how azd project initialization dey work using templates
- Understand Azure Developer CLI project structure and configuration files
- Deploy complete application to Azure with infrastructure provisioning
- Implement app updates and redeployment strategies
- Manage multiple environments for development and staging
- Use resource cleanup and cost management best practices

## Learning Outcomes

After you finish, you go fit:
- Initialize and configure azd projects from templates on your own
- Navigate and change azd project structure well
- Deploy full-stack apps to Azure with single commands
- Troubleshoot common deployment and authentication problems
- Manage many Azure environments for different deployment stages
- Implement continuous deployment workflows for app updates

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ Azure CLI installed and authenticated
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

### Verify Your Setup
```bash
# Make sure say azd don install
azd version
```
### Check say you don authenticate for Azure

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Make we start with popular todo application template wey get React frontend and Node.js API backend.

```bash
# Check di templates wey dey available
azd template list

# Set up di todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow di prompts:
# - Put di environment name: "dev"
# - Pick di subscription (if you get more than one)
# - Pick di region: "East US 2" (or di region wey you prefer)
```

### Wetin Just Happen?
- Template code don download enter your local directory
- `azure.yaml` file don create with service definitions
- Infrastructure code don set up for the `infra/` directory
- Environment configuration don create

## Step 2: Explore the Project Structure

Make we check wetin azd don create for us:

```bash
# See di project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

You suppose see:
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

**azure.yaml** - Na di heart of your azd project:
```bash
# Check di project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# Check di infrastructure code
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Before you deploy, you fit customize the app:

### Modify the Frontend
```bash
# Open di React app component
code src/web/src/App.tsx
```

Make small change:
```typescript
// Find di title den change am
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Make environment variables wey you want
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# See all environment variables wey dey
azd env get-values
```

## Step 4: Deploy to Azure

Now di koko part - deploy everything to Azure!

```bash
# Deploy di infrastructure and di application
azd up

# Dis command go do:
# 1. Go set up Azure resources (App Service, Cosmos DB, etc.)
# 2. Go build your app
# 3. Go deploy to di resources wey dem don provide
# 4. Show di app URL
```

### Wetin Dey Happen During Deployment?

The `azd up` command go do these steps:
1. **Provision** (`azd provision`) - e go create Azure resources
2. **Package** - e go build your application code
3. **Deploy** (`azd deploy`) - e go deploy code go Azure resources

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
Click di URL wey deployment output give you, or get am anytime:
```bash
# Find di endpoints for di application
azd show

# Open di application for di browser wey you dey use
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - Click "Add Todo" and enter the task
2. **Mark as complete** - Check off items wey you don finish
3. **Delete items** - Remove todos wey you no need again

### Monitor Your Application
```bash
# Open Azure portal make you fit see your resources
azd monitor

# See di application logs
azd monitor --logs

# See di live metrics
azd monitor --live
```

## Step 6: Make Changes and Redeploy

Make we change small and see how e easy to update:

### Modify the API
```bash
# Change di API code
code src/api/src/routes/lists.js
```

Add custom response header:
```javascript
// Find di route handler, den add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Deploy na only di application code (no need to deploy infrastructure)
azd deploy

# E plenty faster pass 'azd up' because di infrastructure don already dey
```

## Step 7: Manage Multiple Environments

Create staging environment make you test changes before production:

```bash
# Make one new staging environment
azd env new staging

# Put am for staging
azd up

# Change back go dev environment
azd env select dev

# Show all environments
azd env list
```

### Environment Comparison
```bash
# See di dev environment
azd env select dev
azd show

# See di staging environment
azd env select staging
azd show
```

## Step 8: Clean Up Resources

When you don finish dey experiment, clean up so you no go continue to pay:

```bash
# Delete all Azure resources for di current environment
azd down

# Force delete without confirmation and permanently remove resources wey don soft-delete
azd down --force --purge

# Delete di specific environment
azd env select staging
azd down --force --purge
```

## Wetin You Don Learn

Congrats! You don successfully:
- ✅ Initialize azd project from template
- ✅ Explore project structure and key files
- ✅ Deploy full-stack application to Azure
- ✅ Make code changes and redeploy
- ✅ Manage multiple environments
- ✅ Clean up resources

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Show say you sabi azd init and deployment workflow

```bash
# Try use Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Make sure say deployment dey work
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Tidy up
azd down --force --purge
```

**Success Criteria:**
- [ ] Application deploy without errors
- [ ] You fit access application URL for browser
- [ ] Application dey work correct (add/remove todos)
- [ ] All resources don clean up successfully

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice environment variable configuration

```bash
cd my-first-azd-app

# Make wan custom environment
azd env new custom-config

# Set di custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Check di variables
azd env get-values | grep APP_TITLE

# Deploy wit di custom config
azd up
```

**Success Criteria:**
- [ ] Custom environment create successfully
- [ ] Environment variables set and you fit retrieve dem
- [ ] Application deploy with custom configuration
- [ ] You fit verify custom settings for deployed app

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# Make di dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note di dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Make di staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note di staging URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Compare di environments
azd env list

# Test both di environments
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Clean up both of dem
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Two environments create with different configurations
- [ ] Both environments deploy successfully
- [ ] You fit switch between environments using `azd env select`
- [ ] Environment variables different between environments
- [ ] Both environments clean up successfully

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: You ready for [Configuration Guide](configuration.md) to learn advanced configuration patterns!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Sign in again wit Azure
az login

# Confirm sey di subscription get access
az account show
```

### Deployment Failures
```bash
# Make debug logging dey on
export AZD_DEBUG=true
azd up --debug

# See app logs for Azure
azd monitor --logs

# If na Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# Make you use one unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Make sure say ports dey available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Now wey you don complete your first project, explore these advanced topics:

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
# Find template dem by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different tech stack dem
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

**Congrats on completing your first azd project!** You don ready to build and deploy beta fine applications on Azure with confidence.

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
Disclaimer:
Dis document don translate by AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make everything correct, abeg sabi say automated translations fit get mistakes or wrong meanings. The original document for im original language na di correct/authoritative one. If na important matter, make una use professional human translation. We no dey liable for any misunderstanding or wrong interpretation wey fit come from this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->