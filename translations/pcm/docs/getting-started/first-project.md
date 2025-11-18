<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-11-18T19:25:04+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "pcm"
}
-->
# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## Introduction

Welcome to your first Azure Developer CLI project! Dis tutorial go show you step by step how you fit create, deploy, and manage one full-stack app for Azure using azd. You go dey work with one real todo app wey get React frontend, Node.js API backend, and MongoDB database.

## Learning Goals

When you finish dis tutorial, you go:
- Sabi how azd project initialization workflow dey work using templates
- Understand Azure Developer CLI project structure and configuration files
- Deploy full app go Azure with infrastructure provisioning
- Update app and redeploy am
- Manage different environments for development and staging
- Learn how to clean resources and manage cost

## Learning Outcomes

When you don complete am, you go fit:
- Start azd projects from templates by yourself
- Navigate and change azd project structure well
- Deploy full-stack apps go Azure with just one command
- Solve common deployment wahala and authentication issues
- Manage multiple Azure environments for different deployment stages
- Set up continuous deployment workflows for app updates

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI don install ([Installation Guide](installation.md))
- ✅ Azure CLI don install and authenticated
- ✅ Git don dey your system
- ✅ Node.js 16+ (for dis tutorial)
- ✅ Visual Studio Code (recommended)

### Verify Your Setup
```bash
# Check azd installation
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
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Wetin Just Happen?
- Template code don download go your local directory
- `azure.yaml` file don create with service definitions
- Infrastructure code don dey inside `infra/` directory
- Environment configuration don set up

## Step 2: Explore the Project Structure

Make we check wetin azd don create for us:

```bash
# View the project structure
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Before you deploy, you fit change di app small:

### Modify the Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Make small change:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Step 4: Deploy to Azure

Now na di exciting part - deploy everything go Azure!

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

Di `azd up` command dey do dis steps:
1. **Provision** (`azd provision`) - E go create Azure resources
2. **Package** - E go build your app code
3. **Deploy** (`azd deploy`) - E go deploy code go Azure resources

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
Click di URL wey dey di deployment output, or get am anytime:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test di Todo App
1. **Add a todo item** - Click "Add Todo" and enter task
2. **Mark as complete** - Check off completed items
3. **Delete items** - Remove todos wey you no need again

### Monitor Your Application
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Step 6: Make Changes and Redeploy

Make we change something and see how e easy to update:

### Modify the API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Add custom response header:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
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

### Environment Comparison
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Step 8: Clean Up Resources

When you don finish experiment, clean up to avoid dey pay extra money:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Wetin You Don Learn

Congrats! You don:
- Start azd project from template
- Check di project structure and key files
- Deploy full-stack app go Azure
- Make code changes and redeploy
- Manage multiple environments
- Clean up resources

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Deployment Failures
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
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

Now wey you don complete your first project, check dis advanced topics:

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
# Browse templates by category
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
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even as we dey try make am accurate, abeg sabi say automated translation fit get mistake or no dey correct well. Di original dokyument for im native language na di main source wey you go trust. For important mata, na beta make you use professional human translation. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen from di use of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->