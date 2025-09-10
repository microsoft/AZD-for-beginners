# Your First Project - Hands-On Tutorial

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
- ✅ Azure CLI installed and authenticated
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
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

Let's start with a popular todo application template that includes a React frontend and Node.js API backend.

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

### What Just Happened?
- Downloaded the template code to your local directory
- Created an `azure.yaml` file with service definitions
- Set up infrastructure code in the `infra/` directory
- Created an environment configuration

## Step 2: Explore the Project Structure

Let's examine what azd created for us:

```bash
# View the project structure
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Before deploying, you can customize the application:

### Modify the Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Make a simple change:
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

Now for the exciting part - deploy everything to Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
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
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - Click "Add Todo" and enter a task
2. **Mark as complete** - Check off completed items
3. **Delete items** - Remove todos you no longer need

### Monitor Your Application
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Step 6: Make Changes and Redeploy

Let's make a change and see how easy it is to update:

### Modify the API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Add a custom response header:
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

Create a staging environment to test changes before production:

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

When you're done experimenting, clean up to avoid ongoing charges:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## What You've Learned

Congratulations! You've successfully:
- Initialized an azd project from a template
- Explored the project structure and key files
- Deployed a full-stack application to Azure
- Made code changes and redeployed
- Managed multiple environments
- Cleaned up resources

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

Now that you've completed your first project, explore these advanced topics:

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

**Congratulations on completing your first azd project!** You're now ready to build and deploy amazing applications on Azure with confidence.

---

**Navigation**
- **Previous Lesson**: [Configuration](configuration.md)
- **Next Lesson**: [Deployment Guide](../deployment/deployment-guide.md)