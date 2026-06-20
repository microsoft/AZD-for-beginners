# Your Fes Project - Hands-On Tutorial

**How to waka between chapters:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Welcome to your fust Azure Developer CLI project! Dis complete hands-on tutorial go show you step-by-step how to create, deploy, and manage full-stack application for Azure using azd. You go work with real todo app wey get React frontend, Node.js API backend, and MongoDB database.

## Learning Goals

If you complete dis tutorial, you go:
- Master how to initialize azd project using templates
- Understand Azure Developer CLI project structure and configuration files
- Deploy the complete application to Azure plus provision infrastructure
- Implement application updates and redeployment strategies
- Manage multiple environments for development and staging
- Apply resource cleanup and cost management practices

## Learning Outcomes

After you finish, you go fit:
- Initialize and configure azd projects from templates on your own
- Navigate and change azd project structure well
- Deploy full-stack applications to Azure with single commands
- Troubleshoot common deployment issues and authentication wahala
- Manage multiple Azure environments for different deployment stages
- Implement continuous deployment workflows for application updates

## Getting Started

### Things wey you need
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication done with `azd auth login`
- ✅ Git installed for your machine
- ✅ Node.js 16+ (for dis tutorial)
- ✅ Visual Studio Code (we recommend am)

Before you continue, run the setup validator from the repository root:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verify Your Setup
```bash
# Check say azd don install
azd version

# Check say AZD don log in
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

Make we start with popular todo application template wey get React frontend and Node.js API backend.

```bash
# Check di templates wey dey available
azd template list

# Set up di todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow wetin dem dey ask:
# - Put di environment name: "dev"
# - Choose one subscription (if you get more dan one)
# - Pick a region: "East US 2" (or di region wey you prefer)
```

### Wetin just happen?
- Template code don download go your local directory
- `azure.yaml` file don create with service definitions
- Infrastructure code don set up for the `infra/` directory
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

### Files wey important to sabi

**azure.yaml** - Di heart of your azd project:
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

### Change the Frontend
```bash
# Open di React app component
code src/web/src/App.tsx
```

Make small change:
```typescript
// Find di title den change am
<h1>My Awesome Todo App</h1>
```

### Set Environment Variables
```bash
# Mek your own environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# See all environment variables
azd env get-values
```

## Step 4: Deploy to Azure

Now di kain wey sweet - deploy everything go Azure!

```bash
# Deploy di infrastructure an di application
azd up

# Dis command go do:
# 1. Go set up Azure resources (App Service, Cosmos DB, etc.)
# 2. Go build your application
# 3. Deploy to di resources wey dem don set up
# 4. Go show di application URL
```

### Wetin dey happen during deployment?

Di `azd up` command dey do these steps:
1. **Provision** (`azd provision`) - E dey create Azure resources
2. **Package** - E go build your application code
3. **Deploy** (`azd deploy`) - E go deploy code go Azure resources

### Wetin you suppose see as output
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
Click the URL wey deployment output give you, or get am anytime:
```bash
# Find di app endpoints
azd show

# Open di app for your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - Click "Add Todo" and enter a task
2. **Mark as complete** - Check off completed items
3. **Delete items** - Remove todos wey you no need again

### Monitor Your Application
```bash
# Open Azure portal make you fit see your resources
azd monitor

# See di app logs
azd monitor --logs

# See di live metrics
azd monitor --live
```

### ✅ Make sure deployment really work

Before you move on, run this quick checklist to confirm say everything dey work—no assume "deploy succeeded" mean "app works":

```bash
# 1. Make sure say the endpoint dey and you fit reach am
azd show

# 2. Do small smoke-test for the endpoint (e dey expect HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Check the health endpoint if your app get am
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Deployment dey verified when:**
- ✅ `azd show` lists a reachable endpoint URL
- ✅ The URL open for your browser without errors
- ✅ Core features dey work (add/complete/delete a todo)
- ✅ `azd monitor --logs` dey show requests wey dey arrive without unexpected errors

If any check fail, waka go [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

## Step 6: Make Changes and Redeploy

Make we do one change and see how e easy to update:

### Modify the API
```bash
# Edit di API code
code src/api/src/routes/lists.js
```

Add one custom response header:
```javascript
// Find di route handler den add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy only the code changes
```bash
# Deploy only di application code (no need to touch di infrastructure)
azd deploy

# E way faster pass 'azd up' because di infrastructure don already dey
```

## Step 7: Manage Multiple Environments

Create staging environment to test changes before production:

```bash
# Make new staging environment
azd env new staging

# Deploy go staging
azd up

# Go back to dev environment
azd env select dev

# Show all environment dem
azd env list
```

### Compare environments
```bash
# See di dev environment
azd env select dev
azd show

# See di staging environment
azd env select staging
azd show
```

## Step 8: Clean Up Resources

When you don finish to experiment, clean up make dem no dey charge you:

```bash
# Comot all Azure resources wey dey for dis current environment
azd down

# Force comot no need confirmation, and purge resources wey dem soft-delete
azd down --force --purge

# Comot di specific environment
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Na The Same Workflow

You just deploy classic web application. But if you want deploy AI-powered app—like chat app wey use Microsoft Foundry Models—no worry:

Di good thing be: **the workflow na identical.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Only difference na di **template** wey you start from. AI template fit include extra infrastructure (like Microsoft Foundry Models resource or AI Search index), but azd go handle all dat for you. You no need learn new commands, adopt different tool, or change how you reason about deployment.

Dis na di core principle of azd: **one workflow, any workload.** Di skills wey you practice for dis tutorial—initializing, deploying, monitoring, redeploying, and cleaning up—dem apply the same for AI applications and agents.

---

## Wetin you don learn

Congrats! You don successfully:
- ✅ Initialize azd project from template
- ✅ Explore project structure and key files
- ✅ Deploy full-stack application to Azure
- ✅ Make code changes and redeploy
- ✅ Manage multiple environments
- ✅ Clean up resources

## 🎯 Exercises wey go check your skill

### Exercise 1: Deploy another Template (15 minutes)
**Goal**: Show say you sabi azd init and deployment workflow

```bash
# Make we try di Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Confirm say deployment correct
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Make e clean
azd down --force --purge
```

**Success Criteria:**
- [ ] Application deploy without errors
- [ ] Fit open application URL for browser
- [ ] Application dey work correct (add/remove todos)
- [ ] Resources don clean up successfully

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice setting environment variables

```bash
cd my-first-azd-app

# Make custom environment
azd env new custom-config

# Set di custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Make sure say di variables dey correct
azd env get-values | grep APP_TITLE

# Deploy wit di custom config
azd up
```

**Success Criteria:**
- [ ] Custom environment don create successfully
- [ ] Environment variables don set and fit retrieve
- [ ] Application deploy with custom configuration
- [ ] Fit verify custom settings for deployed app

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

# Test di two environments
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Clean up di two environments
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Two environments don create with different configurations
- [ ] Both environments deploy successfully
- [ ] Fit switch between environments using `azd env select`
- [ ] Environment variables different between environments
- [ ] Successfully clean up both environments

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
# Sign in to Azure again
az login

# Make sure say you get access to the subscription
az account show
```

### Deployment Failures
```bash
# Make debug logging dey
export AZD_DEBUG=true
azd up --debug

# Check di application logs for Azure
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

Now wey you don finish your first project, check these advanced topics:

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

**Congrats on completing your first azd project!** You don ready to build and deploy beta correct applications on Azure with confidence.

---

**How to waka between chapters:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->