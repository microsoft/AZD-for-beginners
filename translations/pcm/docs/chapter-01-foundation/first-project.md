# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Welcome to your first Azure Developer CLI project! This comprehensive hands-on tutorial provides a complete walkthrough of creating, deploying, and managing a full-stack application on Azure using azd. You'll work with a real todo application that includes a React frontend, Node.js API backend, and MongoDB database.

## Learning Goals

By completing this tutorial, you will:
- Master the azd project initialization workflow using templates
- Understand Azure Developer CLI project structure and configuration files
- Execute complete application deployment to Azure with infrastructure provisioning
- Implement application updates and redeployment strategies
- Manage multiple environments for development and staging
- Apply resource cleanup and cost management practices

## Learning Outcomes

Upon completion, you will be able to:
- Initialize and configure azd projects from templates independently
- Navigate and modify azd project structures effectively
- Deploy full-stack applications to Azure using single commands
- Troubleshoot common deployment issues and authentication problems
- Manage multiple Azure environments for different deployment stages
- Implement continuous deployment workflows for application updates

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication completed with `azd auth login`
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

Before you continue, run the setup validator from the repository root:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verify Your Setup
```bash
# Make sure say azd don install
azd version

# Make sure say AZD authentication dey work
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

Let's start with a popular todo application template that includes a React frontend and Node.js API backend.

```bash
# Check di templates wey dey
azd template list

# Set up di todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow di things dem go ask you:
# - Put name for di environment: "dev"
# - Pick one subscription (if you get many)
# - Pick a region: "East US 2" (or di region wey you prefer)
```

### What Just Happened?
- Downloaded the template code to your local directory
- Created an `azure.yaml` file with service definitions
- Set up infrastructure code in the `infra/` directory
- Created an environment configuration

## Step 2: Explore the Project Structure

Let's examine what azd created for us:

```bash
# See di project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
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
# See di project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# See di infrastructure code
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Before deploying, you can customize the application:

### Modify the Frontend
```bash
# Open di React app component
code src/web/src/App.tsx
```

Make a simple change:
```typescript
// Find di title an change am
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Set environment variables wey you want
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# See all di environment variables
azd env get-values
```

## Step 4: Deploy to Azure

Now for the exciting part - deploy everything to Azure!

```bash
# Deploy di infrastructure and di application
azd up

# Dis command go do:
# 1. Go set up Azure resources (App Service, Cosmos DB, etc.)
# 2. Go build your application
# 3. Deploy to di resources wey dem don set up
# 4. Show di application URL
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
Click on the URL provided in the deployment output, or get it anytime:
```bash
# Find di app endpoints
azd show

# Open di app for your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - Click "Add Todo" and enter a task
2. **Mark as complete** - Check off completed items
3. **Delete items** - Remove todos you no longer need

### Monitor Your Application
```bash
# Open Azure portal make you fit access your resources
azd monitor

# See app log dem
azd monitor --logs

# See live metrics dem
azd monitor --live
```

## Step 6: Make Changes and Redeploy

Let's make a change and see how easy it is to update:

### Modify the API
```bash
# Edit di API code
code src/api/src/routes/lists.js
```

Add a custom response header:
```javascript
// Find di route handler, den add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Deploy just di app code (no touch di infrastructure)
azd deploy

# E much faster pass 'azd up' because di infrastructure don already dey
```

## Step 7: Manage Multiple Environments

Create a staging environment to test changes before production:

```bash
# Make one new staging environment
azd env new staging

# Deploy go staging
azd up

# Switch back go dev environment
azd env select dev

# List all environment dem
azd env list
```

### Environment Comparison
```bash
# Check di dev environment
azd env select dev
azd show

# Check di staging environment
azd env select staging
azd show
```

## Step 8: Clean Up Resources

When you're done experimenting, clean up to avoid ongoing charges:

```bash
# Comot all Azure resources wey dey this environment
azd down

# Force comot no need confirm and purge resources wey dem soft-delete
azd down --force --purge

# Comot specific environment
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

You just deployed a traditional web application. But what if you wanted to deploy an AI-powered app instead—say, a chat application backed by Microsoft Foundry Models?

The good news: **the workflow is identical.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

The only difference is the **template** you start from. An AI template includes additional infrastructure (like an Microsoft Foundry Models resource or an AI Search index), but azd handles all of that for you. You don't need to learn new commands, adopt a different tool, or change how you think about deployment.

This is the core principle of azd: **one workflow, any workload.** The skills you practiced in this tutorial—initializing, deploying, monitoring, redeploying, and cleaning up—apply equally to AI applications and agents.

---

## What You've Learned

Congratulations! You've successfully:
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
# Make we try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Make sure say deployment dey okay
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Make we clear up
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
- [ ] Custom environment created successfully
- [ ] Environment variables set and retrievable
- [ ] Application deploys with custom configuration
- [ ] Can verify custom settings in deployed app

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# Set up di dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note di dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Set up di staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note di staging URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Compare di environments
azd env list

# Test both of dem environments
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Clean up both of dem
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
# Sign in again to Azure
az login

# Check say you get access to the subscription
az account show
```

### Deployment Failures
```bash
# Make debug logging dey
export AZD_DEBUG=true
azd up --debug

# See di application logs for Azure
azd monitor --logs

# If na Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# Make you use unique name for the environment
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Make sure say ports dey available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Now that you've completed your first project, explore these advanced topics:

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
# Check template dem by category
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

**Congratulations on completing your first azd project!** You're now ready to build and deploy amazing applications on Azure with confidence.

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
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automatic translations fit get errors or mistakes. Di original document for im original language suppose be di official source. For serious or important information, we recommend make una use professional human translation. We no dey responsible for any misunderstanding or wrong interpretation wey fit arise from using dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->