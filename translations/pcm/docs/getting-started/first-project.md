# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Welcome to your first Azure Developer CLI project! Dis tutorial go show you step by step how you go fit create, deploy, and manage one full-stack app for Azure using azd. You go dey work with one real todo app wey get React frontend, Node.js API backend, and MongoDB database.

## Learning Goals

By di time you finish dis tutorial, you go sabi:
- How to use azd project initialization workflow with templates
- Understand di structure and configuration files for Azure Developer CLI project
- Deploy full app go Azure with infrastructure provisioning
- Update app and redeploy am
- Manage different environments for development and staging
- Clean up resources and manage cost

## Learning Outcomes

When you finish, you go fit:
- Start and configure azd projects from templates by yourself
- Navigate and change azd project structure well
- Deploy full-stack apps go Azure with just one command
- Solve common deployment wahala and authentication issues
- Manage multiple Azure environments for different deployment stages
- Set up continuous deployment workflows for app updates

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI don dey your system ([Installation Guide](installation.md))
- ✅ Azure CLI don dey and you don authenticate
- ✅ Git don dey your system
- ✅ Node.js 16+ (na wetin we go use for dis tutorial)
- ✅ Visual Studio Code (we recommend am)

### Verify Your Setup
```bash
# Check azd don install
azd version
```
### Verify Azure authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Make we start with one popular todo app template wey get React frontend and Node.js API backend.

```bash
# Check templates wey dey available
azd template list

# Start the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the instructions:
# - Put environment name: "dev"
# - Pick subscription (if you get plenty)
# - Pick region: "East US 2" (or any region wey you like)
```

### Wetin Just Happen?
- E download di template code go your local directory
- E create one `azure.yaml` file wey get service definitions
- E set up infrastructure code for di `infra/` directory
- E create environment configuration

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

**azure.yaml** - Na di main file for your azd project:
```bash
# Check how di project dey set up
cat azure.yaml
```

**infra/main.bicep** - Na di infrastructure definition:
```bash
# See di infrastructure code
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Before you deploy, you fit customize di app:

### Modify the Frontend
```bash
# Open di React app component
code src/web/src/App.tsx
```

Make small change:
```typescript
// Find di title make you change am
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# See all environment variables
azd env get-values
```

## Step 4: Deploy to Azure

Now na di exciting part - deploy everything go Azure!

```bash
# Set up infrastructure and application
azd up

# Dis command go:
# 1. Arrange Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Put am for the resources wey dem arrange
# 4. Show the application URL
```

### Wetin Dey Happen During Deployment?

Di `azd up` command dey do dis steps:
1. **Provision** (`azd provision`) - E go create Azure resources
2. **Package** - E go build your app code
3. **Deploy** (`azd deploy`) - E go deploy di code go Azure resources

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
Click di URL wey dey for di deployment output, or you fit get am anytime:
```bash
# Get di application endpoints
azd show

# Open di application for your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test di Todo App
1. **Add a todo item** - Click "Add Todo" and enter one task
2. **Mark as complete** - Check di ones wey you don complete
3. **Delete items** - Remove di todos wey you no need again

### Monitor Your Application
```bash
# Open Azure portal for your resources
azd monitor

# Check application logs
azd logs
```

## Step 6: Make Changes and Redeploy

Make we make one change and see how e easy to update:

### Modify the API
```bash
# Change di API code
code src/api/src/routes/lists.js
```

Add one custom response header:
```javascript
// Find route handler and put am:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Deploy only di application code (skip infrastructure)
azd deploy

# Dis one fast pass 'azd up' because infrastructure don already dey
```

## Step 7: Manage Multiple Environments

Create one staging environment to test changes before production:

```bash
# Create new staging environment
azd env new staging

# Deploy go staging
azd up

# Switch go back to dev environment
azd env select dev

# List all environments
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

When you don finish experiment, clean up to avoid dey pay for resources wey you no dey use:

```bash
# Delete all Azure resources for di current environment
azd down

# Force delete witout confirmation and clear soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Wetin You Don Learn

Congrats! You don successfully:
- ✅ Start azd project from template
- ✅ Check di project structure and key files
- ✅ Deploy full-stack app go Azure
- ✅ Make code changes and redeploy
- ✅ Manage multiple environments
- ✅ Clean up resources

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Show say you sabi azd init and deployment workflow

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Check say deployment dey work well
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Clear di place
azd down --force --purge
```

**Success Criteria:**
- [ ] App deploy without errors
- [ ] You fit access app URL for browser
- [ ] App dey work well (add/remove todos)
- [ ] You don clean up all resources

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice how to configure environment variables

```bash
cd my-first-azd-app

# Make custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Check di variables
azd env get-values | grep APP_TITLE

# Deploy wit custom config
azd up
```

**Success Criteria:**
- [ ] You don create custom environment
- [ ] Environment variables don set and you fit retrieve dem
- [ ] App deploy with custom configuration
- [ ] You fit confirm custom settings for di deployed app

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Sabi how to manage environments and deployment strategies

```bash
# Make dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Write dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Make staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Write staging URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Check environments
azd env list

# Test both environments
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Clear both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Two environments don dey with different configurations
- [ ] Both environments don deploy successfully
- [ ] You fit switch between environments using `azd env select`
- [ ] Environment variables dey different for di environments
- [ ] You don clean up both environments

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ App deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: You ready for [Configuration Guide](configuration.md) to learn advanced configuration patterns!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Do re-authenticate wit Azure
az login

# Check say you fit access subscription
az account show
```

### Deployment Failures
```bash
# Make debug logging dey work
export AZD_DEBUG=true
azd up --debug

# See logs wey get plenty detail
azd logs --service api
azd logs --service web
```

### Resource Name Conflicts
```bash
# Use unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Check if ports dey available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Now wey you don finish your first project, check dis advanced topics:

### 1. Customize Infrastructure
- [Infrastructure as Code](../deployment/provisioning.md)
- [Add databases, storage, and other services](../deployment/provisioning.md#adding-services)

### 2. Set Up CI/CD
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Production Best Practices
- [Security configurations](../deployment/best-practices.md#security)
- [Performance optimization](../deployment/best-practices.md#performance)
- [Monitoring and logging](../deployment/best-practices.md#monitoring)

### 4. Explore More Templates
```bash
# Check templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
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

**Congrats say you don complete your first azd project!** You don ready to build and deploy better apps for Azure with confidence.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator) do di translation. Even as we dey try make am accurate, abeg sabi say machine translation fit get mistake or no dey correct well. Di original dokyument wey dey for im native language na di main source wey you go trust. For important mata, e good make professional human translation dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->