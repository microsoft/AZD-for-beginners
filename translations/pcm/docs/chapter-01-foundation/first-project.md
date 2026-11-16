# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Welcome to your first Azure Developer CLI project! You go deploy todo application wey get React frontend, Node.js API, plus Azure Cosmos DB. Di template still get di old name `todo-nodejs-mongo`; di infrastructure wey e dey use now na Cosmos DB for NoSQL, so make you check di README wey you download plus `infra/`, no base database API for di name alone.

> Dem review am based on `azd 1.37.2` plus di public template for November 2026. Di examples below dey use Bash; JSON extraction still need `jq`. Azure deployments go charge and dem no really run am during dis review.

## Learning Goals

If you finish dis tutorial, you go:
- Master azd project initialization workflow using templates
- Understand Azure Developer CLI project structure and configuration files
- Run full application deployment to Azure with infrastructure setup
- Apply application update and redeployment methods
- Manage multiple environments for development and staging
- Carry resource cleanup plus cost management for road

## Learning Outcomes

After you don finish, you go fit:
- Start and configure azd projects from templates by yourself
- Navigate and change azd project structure well well
- Deploy full-stack applications to Azure with single commands
- Solve common deployment problems and authentication wahala
- Manage different Azure environments for different deployment levels
- Run continuous deployment workflow for application updates

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication don finish using `azd auth login`
- ✅ Git don install for your system
- ✅ Node.js 22 LTS (or version wey di downloaded template need)
- ✅ Visual Studio Code (we recommend)

Before you continue, run setup checker from top of di repository:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Check Your Setup
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Check if you do optional Azure CLI authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Make we start with one popular todo application template wey get React frontend plus Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Wetin Just Happen?
- The template code don download go your local directory
- `azure.yaml` file plus service definitions don create
- Infrastructure code don set for `infra/` directory
- Environment configuration don create

## Step 2: Explore the Project Structure

Make we see wetin azd take create for us:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

You suppose see:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Important Files to Understand

**azure.yaml** - Na di heart of your azd project be dis:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Before you deploy, you fit try customize the application:

### Change the Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Make one simple change:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Set Environment Variables
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

These two custom values na local storage only. Di normal template no dey use `WEBSITE_TITLE` or `API_VERSION`, dem no go change the app. Di explicit source edit wey dey above don change di title wey e dey show.

## Step 4: Deploy to Azure

Now na di beta part - deploy everything go Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Wetin Dey Happen During Deployment?

Di workflow go set up infrastructure and package/deploy code. You fit arrange am through `workflows.up` for `azure.yaml`; dis template talk say make provision first then deploy. No use one style for every template like dat.

### Wetin You Fit Expect As Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Step 5: Test Your Application

### Open Your Application
Click di URL wey dey di deployment output, or find am anytime:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Test the Todo App
1. **Add todo item** - Click "Add Todo" then enter task
2. **Mark as complete** - Check completed items
3. **Delete items** - Remove todos wey you no need again

### Watch Over Your Application
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Confirm Your Deployment

Before you move on, run dis quick checklist to make sure everything really work—no just think "deploy succeed" mean say "app dey work":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Deployment dey confirmed when:**
- ✅ `azd show` get reachable endpoint URL
- ✅ URL open well for your browser, no wahala
- ✅ Main features dey work (add/complete/delete todo)
- ✅ `azd monitor --logs` dey show requests wey no get unexpected error

If any check fail, go [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

## Step 6: Make Changes and Redeploy

Make we change small and see how e easy to update:

### Change the API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Add one custom response header:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Only di Code Changes
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Step 7: Manage Multiple Environments

Create staging environment to test changes before production:

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

### Compare Environments
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Step 8: Clean Up Resources

When you don finish dey try, clean am so that dem no go continue charge you:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Classic App vs. AI-Powered App: The Same Workflow

You don deploy normal web application. But if you wan deploy AI-powered app—for example chat app wey Microsoft Foundry Models dey back am?

Good news be say: **di workflow na e same.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize (empty directory) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Di lifecycle commands na di same, but prerequisites dey differ. AI template fit need model access, regional quota, data ingestion, plus extra setup. Read di README before deployment; `azd up` no fit provide missing permissions or quota.

Dis na di main idea of azd: **one workflow, any workload.** Di skills wey you practice for dis tutorial—starting, deploying, monitoring, redeploying, plus cleanup—dem go work well for AI applications and agents.

---

## Wetin You Don Learn

Congrats! You:
- ✅ Don start azd project from template
- ✅ Don explore project structure plus important files
- ✅ Don deploy full-stack application to Azure
- ✅ Don change code and redeploy am
- ✅ Don manage multiple environments
- ✅ Don clean up resources

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy Different Template (15 minutes)
**Goal**: Show say you sabi azd init and deployment workflow

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Success Criteria:**
- [ ] Application go deploy no error
- [ ] You fit reach application URL for browser
- [ ] Application go work well (add/remove todos)
- [ ] You go clean all resources well well

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice local environment value storage no confuse am with runtime configuration

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Success Criteria:**
- [ ] Custom environment create well well
- [ ] Environment variables set and fit get dem back
- [ ] `azd env get-value APP_TITLE` go print `My Custom Todo App`
- [ ] You fit explain why dis values no go change di stock app unless code/infrastructure dey use am

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment methods

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Two environments don create with different settings
- [ ] Both environments don deploy well well
- [ ] You fit switch between environments using `azd env select`
- [ ] Environment variables different for each environment
- [ ] You don clean both environments well well

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project start
- ✅ Azure resource provisioning
- ✅ Application deployment workflow
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: You ready for [Configuration Guide](../chapter-03-configuration/configuration.md) to learn advanced configuration patterns!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Deployment Failures
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
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

## Next Steps

Now wey you don finish your first project, try these advanced topics:

### 1. Customize Infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add database infrastructure](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Set Up CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Production Best Practices
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Security, performance, plus monitoring

### 4. Explore More Templates
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
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
- [Community Template Contributions](https://github.com/Azure/awesome-azd)
- [Todo Template Source](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Congrats as you finish your first azd project!** You ready now to build and deploy better applications for Azure with confidence.

---

**Chapter Navigation:**
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