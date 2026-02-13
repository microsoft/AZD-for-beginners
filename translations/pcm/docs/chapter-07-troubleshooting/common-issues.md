# Common Wahala and How to Solve Dem

**How to waka through Chapters:**
- **📚 Home for di Course**: [AZD for People Wey Just Dey Start](../../README.md)
- **📖 Chapter wey you dey now**: Chapter 7 - How to fix wahala & Debug
- **⬅️ Previous Chapter**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Debugging Guide](debugging.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Intro

Dis comprehensive troubleshooting guide dey cover di most common wahala wey people dey meet wen dem dey use Azure Developer CLI. Learn how to diagnose, troubleshoot, and fix common problems for authentication, deployment, infrastructure provisioning, and application configuration. Every issue get detailed signs (symptoms), root causes, and step-by-step fix procedures.

## Wetin you go learn

By finishing dis guide, you go:
- Master diagnostic techniques for Azure Developer CLI issues
- Understand common authentication and permission problems and how to fix dem
- Fix deployment failures, infrastructure provisioning errors, and configuration wahala
- Put proactive monitoring and debugging strategies for place
- Use systematic troubleshooting methods for complex problems
- Configure correct logging and monitoring to prevent wahala for future

## Wetin you go fit do after

After you finish, you go fit:
- Diagnose Azure Developer CLI issues using built-in diagnostic tools
- Fix authentication, subscription, and permission-related problems by yourself
- Troubleshoot deployment failures and infrastructure provisioning errors well
- Debug application configuration wahala and environment-specific problems
- Put monitoring and alerting to detect potential issues first
- Follow best practices for logging, debugging, and problem resolution workflows

## Quick Diagnostics

Before you start for specific issues, run these commands to gather diagnostic information:

```bash
# Check azd version and if e dey healthy
azd version
azd config list

# Confirm say Azure authentication correct
az account show
az account list

# Check di current environment
azd env show
azd env get-values

# Make debug logging dey on
export AZD_DEBUG=true
azd <command> --debug
```

## Authentication Issues

### Issue: "Failed to get access token"
**Symptoms:**
- `azd up` fails with authentication errors
- Commands return "unauthorized" or "access denied"

**How to fix:**
```bash
# 1. Log in again wit Azure CLI
az login
az account show

# 2. Clear di cached credentials
az account clear
az login

# 3. Use di device code flow (for systems wey no get screen)
az login --use-device-code

# 4. Set di specific subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Issue: "Insufficient privileges" during deployment
**Symptoms:**
- Deployment fails with permission errors
- Can't create certain Azure resources

**How to fix:**
```bash
# 1. Check wetin dem assign for your Azure roles
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Make sure say you get the roles wey you need
# - Contributor (to fit create resources)
# - User Access Administrator (to fit assign roles)

# 3. Contact your Azure administrator make dem give you the correct permissions
```

### Issue: Multi-tenant authentication problems
**How to fix:**
```bash
# 1. Login wit di particular tenant
az login --tenant "your-tenant-id"

# 2. Set tenant for di configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear di tenant cache if you dey switch tenants
az account clear
```

## 🏗️ Infrastructure Provisioning Errors

### Issue: Resource name conflicts
**Symptoms:**
- "The resource name already exists" errors
- Deployment fails during resource creation

**How to fix:**
```bash
# 1. Make resource names dey unique wit tokens
# For di Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change di environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up di existing resources
azd down --force --purge
```

### Issue: Location/Region not available
**Symptoms:**
- "The location 'xyz' is not available for resource type"
- Certain SKUs not available in selected region

**How to fix:**
```bash
# 1. Check di locations wey dey available for di resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use regions wey people dey use often
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check if di service dey available for each region
# Go visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Issue: Quota exceeded errors
**Symptoms:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**How to fix:**
```bash
# 1. Check how much quota you don use now
az vm list-usage --location eastus2 -o table

# 2. Request make dem increase your quota via Azure portal
# Waka go: Subscriptions > Usage + quotas

# 3. Use smaller SKUs when you dey do development
# For main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up resources wey no dey used
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Issue: Bicep template errors
**Symptoms:**
- Template validation failures
- Syntax errors in Bicep files

**How to fix:**
```bash
# 1. Make sure say Bicep syntax dey correct
az bicep build --file infra/main.bicep

# 2. Run Bicep linter make e check di code
az bicep lint --file infra/main.bicep

# 3. Check parameter file make sure syntax dey correct
cat infra/main.parameters.json | jq '.'

# 4. Preview wetin deployment go change
azd provision --preview
```

## 🚀 Deployment Failures

### Issue: Build failures
**Symptoms:**
- Application fails to build during deployment
- Package installation errors

**How to fix:**
```bash
# 1. Make sure say you check di build output wit di debug flag
azd deploy --service web --debug

# 2. See di deployed service status
azd show

# 3. Test di build for local
cd src/web
npm install
npm run build

# 3. Check if Node.js/Python versions dey compatible
node --version  # E suppose match di azure.yaml settings
python --version

# 4. Clear di build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if you dey use containers
docker build -t test-image .
docker run --rm test-image
```

### Issue: Container deployment failures
**Symptoms:**
- Container apps fail to start
- Image pull errors

**How to fix:**
```bash
# 1. Make sure say Docker fit build for your local machine
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs with Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Use azd to monitor the app
azd monitor --logs

# 3. Make sure say you get access to the container registry
az acr login --name myregistry

# 4. Make sure say the container app configuration dey correct
az containerapp show --name my-app --resource-group my-rg
```

### Issue: Database connection failures
**Symptoms:**
- Application can't connect to database
- Connection timeout errors

**How to fix:**
```bash
# 1. Check di database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test say di app fit connect
# Add am to your app for now:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Confirm say connection string format correct
azd env get-values | grep DATABASE

# 4. Check di database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Configuration Issues

### Issue: Environment variables not working
**Symptoms:**
- App can't read configuration values
- Environment variables appear empty

**How to fix:**
```bash
# 1. Make sure say environment variables don set
azd env get-values
azd env get DATABASE_URL

# 2. Check the variable names wey dey for azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the app
azd deploy --service web

# 4. Make sure say the app service configuration correct
az webapp config appsettings list --name myapp --resource-group myrg
```

### Issue: SSL/TLS certificate problems
**Symptoms:**
- HTTPS not working
- Certificate validation errors

**How to fix:**
```bash
# 1. Check di SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Make only HTTPS dey enabled
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if e needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Issue: CORS configuration problems
**Symptoms:**
- Frontend can't call API
- Cross-origin request blocked

**How to fix:**
```bash
# 1. Make CORS ready for di App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API make e fit handle CORS
# For Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check say e dey run for di correct URLs
azd show
```

## 🌍 Environment Management Issues

### Issue: Environment switching problems
**Symptoms:**
- Wrong environment being used
- Configuration not switching properly

**How to fix:**
```bash
# 1. Make list of all environment dem
azd env list

# 2. Pick di environment well-well
azd env select production

# 3. Check di environment wey dey now
azd env show

# 4. Create new environment if e don spoil
azd env new production-new
azd env select production-new
```

### Issue: Environment corruption
**Symptoms:**
- Environment shows invalid state
- Resources don't match configuration

**How to fix:**
```bash
# 1. Refresh di environment state
azd env refresh

# 2. Reset di environment configuration
azd env new production-reset
# Copy ova di required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import di existing resources (if e possible)
# Update .azure/production/config.json by hand wit di resource IDs
```

## 🔍 Performance Issues

### Issue: Slow deployment times
**Symptoms:**
- Deployments taking too long
- Timeouts during deployment

**How to fix:**
```bash
# 1. Deploy di specific services make iteration quick
azd deploy --service web
azd deploy --service api

# 2. Use code-only deployment if infrastructure no change
azd deploy  # Faster pass azd up

# 3. Optimize di build process
# Inside package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check di resource locations (make dem dey for di same region)
azd config set defaults.location eastus2
```

### Issue: Application performance problems
**Symptoms:**
- Slow response times
- High resource usage

**How to fix:**
```bash
# 1. Make di resources bigger
# Change di SKU for main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Make Application Insights monitoring dey
azd monitor --overview

# 3. Check di application logs for Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Make caching dey
# Put Redis cache for your infrastructure
```

## 🛠️ Troubleshooting Tools and Commands

### Debug Commands
```bash
# Debug wey cover everything
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check which azd version dey
azd version

# See di current configuration
azd config list

# Test if connection dey
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# Application log dem through Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor di application wit azd
azd monitor --logs
azd monitor --live

# Azure resource log dem
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container log dem (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# Make list of all resource dem
az resource list --resource-group myrg -o table

# Check how resource dem dey
az webapp show --name myapp --resource-group myrg --query state

# Check network for wahala
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Getting Additional Help

### When to Escalate
- Authentication issues still dey after you don try all solutions
- Infrastructure problems wey concern Azure services
- Billing or subscription-related wahala
- Security concerns or incidents

### Support Channels
```bash
# 1. Make una check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Make una open Azure support ticket
# Waka go: https://portal.azure.com -> Help + support

# 3. Resources wey di community get
# - Stack Overflow: di azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Information to Gather
Before you contact support, collect:
- `azd version` output
- `azd config list` output
- `azd show` output (current deployment status)
- Error messages (full text)
- Steps to reproduce the issue
- Environment details (`azd env show`)
- Timeline of when issue start

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
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Issue Prevention

### Pre-deployment Checklist
```bash
# Make sure say authentication dey valid
az account show

# Check quota dem and limit dem
az vm list-usage --location eastus2

# Make sure say template dem dey valid
az bicep build --file infra/main.bicep

# Test am locally first
npm run build
npm run test

# Use dry-run deployment dem
azd provision --preview
```

### Monitoring Setup
```bash
# Make Application Insights dey active
# Put for main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Arrange alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regular Maintenance
```bash
# Every week dem go check health
./scripts/health-check.sh

# Every month dem go review cost
az consumption usage list --billing-period-name 202401

# Every three months dem go review security
az security assessment list --resource-group myrg
```

## Related Resources

- [Debugging Guide](debugging.md) - Advanced debugging techniques
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastructure troubleshooting
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Resource planning guidance
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Service tier recommendations

---

**Tip**: Keep dis guide bookmarked and refer am anytime you meet wahala. Most problems don show before and dem don get solutions already!

---

**Navigation**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Abeg note:
Dis document na AI translate wey dem do with Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, make you sabi say automated translations fit get errors or no too accurate. The original document for im own language na the correct source. For important or critical information, e better to use professional human translation. We no go liable for any wahala, misunderstanding, or wrong interpretation wey fit arise from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->