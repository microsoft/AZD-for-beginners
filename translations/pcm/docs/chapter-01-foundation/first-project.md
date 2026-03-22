# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Welcome to your first Azure Developer CLI project! Dis comprehensive hands-on tutorial go show you step-by-step how to create, deploy, and manage one full-stack application for Azure using azd. You go work with real todo application wey get React frontend, Node.js API backend, and MongoDB database.

## Learning Goals

By completing this tutorial, you go:
- Master the azd project initialization workflow using templates
- Understand Azure Developer CLI project structure and configuration files
- Run complete application deployment to Azure with infrastructure provisioning
- Implement application updates and redeployment strategies
- Manage multiple environments for development and staging
- Apply resource cleanup and cost management practices

## Learning Outcomes

After you finish, you go fit:
- Initialize and configure azd projects from templates on your own
- Navigate and modify azd project structures well
- Deploy full-stack applications to Azure with single commands
- Troubleshoot common deployment and authentication wahalas
- Manage multiple Azure environments for different deployment stages
- Implement continuous deployment workflows for application updates

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ Azure CLI installed and authenticated
- ✅ Git installed for your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

### Verify Your Setup
```bash
# Make sure say azd don install
azd version
```
### Make sure say you don authenticate for Azure

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Make we start with one popular todo application template wey get React frontend and Node.js API backend.

```bash
# Check di templates wey dey
azd template list

# Set up di todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow di prompts:
# - Put environment name: "dev"
# - Choose one subscription (if you get more than one)
# - Choose a region: "East US 2" (or di region wey you prefer)
```

### What Just Happened?
- The template code don download enter your local directory
- `azure.yaml` file don create with service definitions
- Infrastructure code don set for the `infra/` directory
- Environment configuration don create

## Step 2: Explore the Project Structure

Make we check wetin azd create for us:

```bash
# See di project structure
tree /f   # Windows
# abi
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

**azure.yaml** - Na the core of your azd project:
```bash
# See di project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# See di infrastructure code
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Before you deploy, you fit customize the application:

### Modify the Frontend
```bash
# Open di React app component
code src/web/src/App.tsx
```

Do one simple change:
```typescript
// Find di title den change am
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Set di custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# See all di environment variables
azd env get-values
```

## Step 4: Deploy to Azure

Now the exciting part - deploy everything go Azure!

```bash
# Set up infrastructure and app
azd up

# Dis command go do:
# 1. Go set up Azure resources (App Service, Cosmos DB, etc.)
# 2. Go build your app
# 3. Go deploy to di resources wey dem provision
# 4. Show di app URL
```

### What's Happening During Deployment?

The `azd up` command dey do these steps:
1. **Provision** (`azd provision`) - E go create Azure resources
2. **Package** - E go build your application code
3. **Deploy** (`azd deploy`) - E go deploy code go the Azure resources

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
Click the URL wey the deployment output give you, or get am anytime:
```bash
# Get di application endpoints
azd show

# Open di application for your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - Click "Add Todo" and enter the task
2. **Mark as complete** - Check off the items wey done
3. **Delete items** - Remove the todos wey you no need again

### Monitor Your Application
```bash
# Open di Azure portal make you see your resources
azd monitor

# See di application logs
azd monitor --logs

# See di live metrics
azd monitor --live
```

## Step 6: Make Changes and Redeploy

Make we do one change and see how e easy to update:

### Modify the API
```bash
# Change di API code
code src/api/src/routes/lists.js
```

Add one custom response header:
```javascript
// Find di route handler, den add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Deploy only di app code (no touch infrastructure)
azd deploy

# E way faster pass 'azd up' because infrastructure don already dey
```

## Step 7: Manage Multiple Environments

Create staging environment make you test changes before you push to production:

```bash
# Make one new staging environment
azd env new staging

# Deploy am go staging
azd up

# Switch back go dev environment
azd env select dev

# Show all environment dem
azd env list
```

### Environment Comparison
```bash
# See dev environment
azd env select dev
azd show

# See staging environment
azd env select staging
azd show
```

## Step 8: Clean Up Resources

When you don finish to dey experiment, clean up make you no dey incur ongoing charges:

```bash
# Delete all Azure resources wey dey for di current environment
azd down

# Force delete no need confirm, and wipe soft-deleted resources finish
azd down --force --purge

# Delete di specific environment
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

You just deploy one traditional web application. But if you want deploy AI-powered app instead—like chat app wey dey use Microsoft Foundry Models—no wahala.

The good gist: **the workflow na the same.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

The only difference na the **template** wey you start from. AI template fit include extra infrastructure (like Microsoft Foundry Models resource or AI Search index), but azd go manage all that for you. You no need learn new commands, use different tool, or change how you dey reason about deployment.

Na the koko principle of azd be this: **one workflow, any workload.** The skills wey you practice for this tutorial—initializing, deploying, monitoring, redeploying, and cleaning up—dey apply the same for AI applications and agents.

---

## What You've Learned

Congrats! You don successfully:
- ✅ Initialize azd project from template
- ✅ Explore the project structure and important files
- ✅ Deploy full-stack application to Azure
- ✅ Make code changes and redeploy
- ✅ Manage multiple environments
- ✅ Clean up resources

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Show say you sabi azd init and deployment workflow

```bash
# Try use di Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Make sure say deployment dey ok
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Clear up di tins
azd down --force --purge
```

**Success Criteria:**
- [ ] Application deploy without errors
- [ ] Fit access application URL for browser
- [ ] Application dey work as e suppose (add/remove todos)
- [ ] You clean up all resources successfully

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice how to set environment variables

```bash
cd my-first-azd-app

# Make di custom environment
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
- [ ] You fit verify custom settings for the deployed app

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# Make di dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Write down di dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Make di staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Write down di staging URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Compare di environments
azd env list

# Test di both environments
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Clean up dem both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Two environments create with different configurations
- [ ] Both environments deploy successfully
- [ ] You fit switch between environments using `azd env select`
- [ ] Environment variables different between environments
- [ ] You clean up both environments successfully

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

# Check say you get access to di subscription
az account show
```

### Deployment Failures
```bash
# Make debug logging dey on
export AZD_DEBUG=true
azd up --debug

# See di application logs for Azure
azd monitor --logs

# If na Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# Make you use one environment name wey nobody get
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Check if ports dey available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Now wey you don finish your first project, explore these advanced topics:

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
# Check templates wey dem put for each category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different tech stacks
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

**Congratulations on completing your first azd project!** You don ready now to build and deploy beta applications on Azure with confidence.

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
Abeg read:
Dis document don translate wit AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg sabi say automatic translations fit get mistakes or wrong tins. Di original document for im original language suppose be di official/authority source. If na important information, we advise make professional human translator do di translation. We no go take responsibility for any misunderstandings or wrong interpretations wey fit come from using dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->