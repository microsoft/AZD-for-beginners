# Komon Wahala dem and How to Solve am

**Chapte Navigashion:**
- **📚 Kurs Home**: [AZD For Beginners](../../README.md)
- **📖 Dis Chapte**: Chapte 7 - Troubleshooting & Debugging
- **⬅️ Previous Chapte**: [Chapte 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Debugging Guide](debugging.md)
- **🚀 Next Chapte**: [Chapte 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Introdakshon

Dis beta guide for troubleshooting cover di most komon wahala wey person fit face wen e dey use Azure Developer CLI. Learn how to diagnose, troubleshoot, and solve the usual problems wey get to do with authentication, deployment, infrastructure provisioning, and how app configuration take be. Each wahala get di detailed signs, root causes, and step-by-step way to solve am.

## Wetin You Go Learn

As you finish dis guide, you go fit:
- Master diagnostic methods for Azure Developer CLI wahala
- Understand common wahala about authentication and permission and how to solve dem
- Solve deployment failure, infrastructure provisioning mistakes, and configuration wahala
- Use better monitoring and debugging strategies
- Apply proper troubleshooting methods for wahala wey hard well-well
- Set correct logging and monitoring to prevent future wahala dem

## Wetin You Go Fit Do After

When you don finish, you go fit:
- Diagnose Azure Developer CLI wahala using the tools wey dey inside
- Solve authentication, subscription, and permission wahala by yourself
- Troubleshoot deployment failure and infrastructure provisioning wahala well
- Debug app configuration wahala and environment-specific problems
- Use monitoring and alerting to kpeme for possible future wahala
- Apply correct way for logging, debugging, and solving wahala workflow

## Quick Diagnostics

> Change example names/IDs to your environment ones. Bash, Bicep, JavaScript, and parameter-file bits dey label separate below; dem no be one script wey you fit run together. Check any wahala wey fit destroy data and hide secrets before you share diagnostics. `azd monitor --logs` go open browser; e no dey show terminal logs.

Before you start to check specific wahala, run these commands to gather info:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Wahala for Authentication

### Wahala: "No fit get access token"
**Signs:**
- `azd up` dey fail wit authentication errors
- Commands dey return "unauthorized" or "access denied"

**How to Solve am:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Wahala: "You no get enough rights" for deployment
**Signs:**
- Deployment dey fail wit permission errors
- E no fit create some Azure resources

**How to Solve am:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Wahala: Multi-tenant authentication wahala
**How to Solve am:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastructure Provisioning Wahala

### Wahala: Resource name conflicts
**Signs:**
- "The resource name already exists" errors
- Deployment dey fail when e wan create resource

**How to Solve am:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Wahala: Location/Region no dey available
**Signs:**
- "The location 'xyz' is not available for resource type"
- Some SKUs no dey for the selected region

**How to Solve am:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Changing the location variable no go move existing resources. Resource group or resource wey dey already fit reject location change; make you use separate environment for regional redeployment.

### Wahala: Quota pass level errors
**Signs:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**How to Solve am:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

For development, pick smaller SKU wey dem support inside `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Wahala: Bicep template errors
**Signs:**
- Template validation failure
- Syntax errors for Bicep files

**How to Solve am:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Deployment Failures

### Wahala: Build failures
**Signs:**
- Application no fit build during deployment
- Package installation problems

**How to Solve am:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Wahala: Container deployment failures
**Signs:**
- Container apps no dey start
- Image pull errors

**How to Solve am:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Wahala: Database connection failures
**Signs:**
- App no fit connect to database
- Connection timeout errors

**How to Solve am:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Configuration Wahala

### Wahala: Environment variables no dey work
**Signs:**
- App no fit read configuration values
- Environment variables dey show as empty

**How to Solve am:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Wahala: SSL/TLS certificate problems
**Signs:**
- HTTPS no dey work
- Certificate validation errors

**How to Solve am:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Wahala: CORS configuration problems
**Signs:**
- Frontend no fit call API
- Cross-origin request block

**How to Solve am:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Update your current Express app (wey `cors` dey import):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Environment Management Wahala

### Wahala: Environment switching wahala
**Signs:**
- Wrong environment dey use
- Configuration no dey switch well

**How to Solve am:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Wahala: Environment spoil
**Signs:**
- Environment dey show invalid state
- Resources no match configuration

**How to Solve am:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Performance Wahala

### Wahala: Slow deployment time
**Signs:**
- Deployment dey take too long
- Timeout dey happen during deployment

**How to Solve am:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Wahala: Application performance wahala
**Signs:**
- Response dey slow
- Resources dey use plenty

**How to Solve am:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Troubleshooting Tools and Commands

### Debug Commands
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 How to Get More Help

### When to Take Am Higher
- Authentication wahala still dey after you try all solution dem
- Infrastructure problems with Azure services
- Billing or subscription wahala dem
- Security wahala or incidents

### Support Channels
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Wetin to Collect Gather
Before you contact support, collect:
- `azd version` output
- `azd config show` output
- `azd show` output (deployment wey you get now)
- Full error messages
- Steps wey you take to cause the wahala
- Environment details wey you hide sensitive info (no share raw `azd env get-values`, e fit get secrets)
- Timeline of when wahala start

### Log Collection Script
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 How to Prevent Wahala

### Pre-deployment Checklist
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Monitoring Setup
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Regular Maintenance
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Resources Wey Still Fit Help You

- [Debugging Guide](debugging.md) - Advanced debugging skills
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastructure troubleshooting
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Guidance for resource planning
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Service tier advice

---

**Tip**: Keep dis guide bookmarked and check am anytime you get wahala. Most wahala dem don happen before and solution dem dey ground already!

---

**Navigashion**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->