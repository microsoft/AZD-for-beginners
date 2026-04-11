# Common Wahala & How to Solve Dem

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous Chapter**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Debugging Guide](debugging.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Introduction

Dis full troubleshooting guide dey cover di common wahala wey people dey face wen dem dey use Azure Developer CLI. Learn how to diagnose, troubleshoot, and fix common problems like authentication, deployment, infrastructure provisioning, and app configuration. Every problem get how e show, wetin cause am, and step-by-step way to fix am.

## Learning Goals

After you finish dis guide, you go:
- Master how to diagnose Azure Developer CLI wahala
- Understand common authentication and permission gbege and how to fix dem
- Solve deployment failures, infrastructure provisioning errors, and configuration wahala
- Put proactive monitoring and debugging strategies for place
- Use systematic troubleshooting methods for complex problems
- Configure proper logging and monitoring to prevent future wahala

## Learning Outcomes

When you don finish, you go fit:
- Diagnose Azure Developer CLI problems using di tools wey dey build-in
- Solve authentication, subscription, and permission yawa on your own
- Troubleshoot deployment failures and infrastructure provisioning errors well
- Debug application configuration problems and environment-specific gbege
- Implement monitoring and alerting to catch potential problems early
- Follow best practices for logging, debugging, and resolving problems

## Quick Diagnostics

Before you waka into specific problems, run these commands make you gather diagnostic information:

```bash
# Check azd version and whether e dey healthy
azd version
azd config show

# Confirm say Azure authentication dey valid
az account show
az account list

# Check di current environment
azd env list
azd env get-values

# Turn on debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Authentication Issues

### Problem: "Failed to get access token"
**How e dey show:**
- `azd up` dey fail with authentication errors
- Commands dey return "unauthorized" or "access denied"

**How to fix am:**
```bash
# 1. Sign in again wit Azure CLI
az login
az account show

# 2. Remove di cached credentials
az account clear
az login

# 3. Use di device code flow (for machines wey no get screen)
az login --use-device-code

# 4. Set di specific subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Insufficient privileges" during deployment
**How e dey show:**
- Deployment dey fail with permission errors
- No fit create certain Azure resources

**How to fix am:**
```bash
# 1. Make you check di roles wey dem assign you for Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Make sure say you get di roles wey dem require
# - Contributor (to fit create resources)
# - User Access Administrator (to fit assign roles)

# 3. Make you contact your Azure administrator to get di correct permissions
```

### Problem: Multi-tenant authentication problems
**How to fix am:**
```bash
# 1. Log in wit particular tenant
az login --tenant "your-tenant-id"

# 2. Put di tenant for configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if you dey switch tenants
az account clear
```

## 🏗️ Infrastructure Provisioning Errors

### Problem: Resource name conflicts
**How e dey show:**
- "The resource name already exists" errors
- Deployment dey fail during resource creation

**How to fix am:**
```bash
# 1. Make resource names dem unique wit tokens
# For your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change di environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up di existing resources
azd down --force --purge
```

### Problem: Location/Region not available
**How e dey show:**
- "The location 'xyz' is not available for resource type"
- Certain SKUs no dey for di selected region

**How to fix am:**
```bash
# 1. Check di locations wey dey available for di kain resource dem
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use regions wey dey commonly available
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check if service dey available for each region
# Waka go: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Quota exceeded errors
**How e dey show:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**How to fix am:**
```bash
# 1. Check how much of the quota you don use
az vm list-usage --location eastus2 -o table

# 2. Request make dem increase the quota through the Azure portal
# Waka go: Subscriptions > Usage + quotas

# 3. Make you use smaller SKUs for development
# Inside main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Remove resources we no dey use
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Bicep template errors
**How e dey show:**
- Template validation dey fail
- Syntax errors for Bicep files

**How to fix am:**
```bash
# 1. Make sure say Bicep syntax dey correct
az bicep build --file infra/main.bicep

# 2. Use Bicep linter make e check di code
az bicep lint --file infra/main.bicep

# 3. Check di parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview wetin deployment go change
azd provision --preview
```

## 🚀 Deployment Failures

### Problem: Build failures
**How e dey show:**
- App no fit build during deployment
- Package installation errors

**How to fix am:**
```bash
# 1. Make sure say build output dey with debug flag
azd deploy --service web --debug

# 2. Check di deployed service status
azd show

# 3. Test di build locally
cd src/web
npm install
npm run build

# 3. Check if Node.js/Python versions dey compatible
node --version  # E suppose match di settings wey dey for azure.yaml
python --version

# 4. Clear di build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if you dey use containers
docker build -t test-image .
docker run --rm test-image
```

### Problem: Container deployment failures
**How e dey show:**
- Container apps no dey start
- Image pull errors

**How to fix am:**
```bash
# 1. Try build Docker for local machine
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Use Azure CLI check container logs
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Watch the app with azd
azd monitor --logs

# 3. Make sure say you get access to the container registry
az acr login --name myregistry

# 4. Make sure say container app configuration correct
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Database connection failures
**How e dey show:**
- App no fit connect to database
- Connection timeout errors

**How to fix am:**
```bash
# 1. Check di database firewall rule dem
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test if di app fit connect
# Add to your app temporarily: Add am to your app for now:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Make sure say di connection string format correct
azd env get-values | grep DATABASE

# 4. Check if di database server dey up
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Configuration Issues

### Problem: Environment variables not working
**How e dey show:**
- App no dey read configuration values
- Environment variables dey show empty

**How to fix am:**
```bash
# 1. Confirm say environment variables don set
azd env get-values
azd env get DATABASE_URL

# 2. Check di variable names wey dey for azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart di application
azd deploy --service web

# 4. Check di app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: SSL/TLS certificate problems
**How e dey show:**
- HTTPS no dey work
- Certificate validation errors

**How to fix am:**
```bash
# 1. Make sure say SSL certificate still dey valid
az webapp config ssl list --resource-group myrg

# 2. Make na HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain if e necessary
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS configuration problems
**How e dey show:**
- Frontend no fit call API
- Cross-origin request dey block

**How to fix am:**
```bash
# 1. Make CORS dey work for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API make e fit handle CORS
# Inside Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check say e dey run for correct URLs
azd show
```

## 🌍 Environment Management Issues

### Problem: Environment switching problems
**How e dey show:**
- Wrong environment dey used
- Configuration no dey switch properly

**How to fix am:**
```bash
# 1. Show all environment dem
azd env list

# 2. Pick the environment for sure
azd env select production

# 3. Confirm the environment wey dey now
azd env list

# 4. Make new environment if e don spoil
azd env new production-new
azd env select production-new
```

### Problem: Environment corruption
**How e dey show:**
- Environment dey show invalid state
- Resources no match configuration

**How to fix am:**
```bash
# 1. Refresh di environment state
azd env refresh

# 2. Reset di environment configuration
azd env new production-reset
# Copy di required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import di existing resources (if e fit)
# Update .azure/production/config.json by hand with di resource IDs
```

## 🔍 Performance Issues

### Problem: Slow deployment times
**How e dey show:**
- Deployments dey take too long
- Timeouts during deployment

**How to fix am:**
```bash
# 1. Deploy di specific services make e faster to test changes
azd deploy --service web
azd deploy --service api

# 2. Use code-only deployment when infrastructure no change
azd deploy  # Faster pass azd up

# 3. Make di build process more efficient
# Inside package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check di resource locations (make dem dey for same region)
azd config set defaults.location eastus2
```

### Problem: Application performance problems
**How e dey show:**
- Slow response times
- High resource usage

**How to fix am:**
```bash
# 1. Increase di resources
# Update di SKU for main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights make e dey monitor
azd monitor --overview

# 3. Check di application logs for Azure
az webapp log tail --name myapp --resource-group myrg
# or if na Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Set up caching
# Add Redis cache to your infrastructure
```

## 🛠️ Troubleshooting Tools and Commands

### Debug Commands
```bash
# Debug everytin well
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check which azd version dey
azd version

# See di current configuration
azd config show

# Test if connection dey
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# App logs through di Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor di app wit azd
azd monitor --logs
azd monitor --live

# Logs for Azure resource dem
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# Make list of all resources
az resource list --resource-group myrg -o table

# Check di status of resources
az webapp show --name myapp --resource-group myrg --query state

# Run network check
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Getting Additional Help

### When to Escalate
- Authentication wahala still dey after you try all solutions
- Infrastructure problems wey involve Azure services
- Billing or subscription-related gbege
- Security concerns or incidents

### Support Channels
```bash
# 1. Make you check di Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Make ticket for Azure support
# Waka go: https://portal.azure.com -> Help + support

# 3. Resources wey di community get
# - Stack Overflow: di 'azure-developer-cli' tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Information to Gather
Before you contact support, collect:
- `azd version` output
- `azd config show` output
- `azd show` output (current deployment status)
- Error messages (full text)
- Steps to reproduce the problem
- Environment details (`azd env get-values`)
- Timeline of when di problem start

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
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Issue Prevention

### Pre-deployment Checklist
```bash
# 1. Make sure say authentication dey valid
az account show

# 2. Check quota dem and limit dem
az vm list-usage --location eastus2

# 3. Make sure template dem dey valid
az bicep build --file infra/main.bicep

# 4. First test am locally
npm run build
npm run test

# 5. Use dry-run deployment dem
azd provision --preview
```

### Monitoring Setup
```bash
# Make Application Insights dey on
# Add am for main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Arrange di alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regular Maintenance
```bash
# Every week check di health
./scripts/health-check.sh

# Every month check di cost
az consumption usage list --billing-period-name 202401

# Every three months check di security
az security assessment list --resource-group myrg
```

## Related Resources

- [Debugging Guide](debugging.md) - Advanced debugging techniques
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastructure troubleshooting
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Resource planning guidance
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Service tier recommendations

---

**Tip**: Keep dis guide bookmarked and refer to am anytime you meet wahala. Most problems don don happen before and dem get known solutions!

---

**Navigation**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate with AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am accurate, abeg note say automated translations fit get errors or inaccuracies. The original document for im native language suppose be the authoritative source. For critical information, make professional human translation do am. We no go liable for any misunderstandings or misinterpretations wey fit arise from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->