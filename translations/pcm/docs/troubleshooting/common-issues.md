# Common Issues and Solutions

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous Chapter**: [Chapter 6: Pre-flight Checks](../pre-deployment/preflight-checks.md)
- **➡️ Next**: [Debugging Guide](debugging.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)

## Introduction

Dis guide na full troubleshooting guide wey go help you solve di common wahala wey fit happen wen you dey use Azure Developer CLI. You go learn how to check, troubleshoot, and fix wahala wey concern authentication, deployment, infrastructure provisioning, and application configuration. Each wahala get di symptoms, root cause, and step-by-step solution wey go help you fix am.

## Learning Goals

Wen you finish dis guide, you go sabi:
- How to use diagnostic techniques to solve Azure Developer CLI wahala
- Understand di common authentication and permission wahala and how to fix dem
- Fix deployment failures, infrastructure provisioning errors, and configuration wahala
- Use monitoring and debugging strategies wey go help you prevent wahala
- Apply troubleshooting methods wey go help you solve complex problems
- Set up correct logging and monitoring to stop future wahala

## Learning Outcomes

Wen you don complete dis guide, you go fit:
- Use Azure Developer CLI diagnostic tools to find wahala
- Solve authentication, subscription, and permission wahala by yourself
- Fix deployment failures and infrastructure provisioning errors well
- Debug application configuration wahala and environment-specific problems
- Set up monitoring and alerting to catch wahala before e happen
- Use best practices for logging, debugging, and solving problems

## Quick Diagnostics

Before you start to check di wahala one by one, run dis commands to collect diagnostic info:

```bash
# Check azd version and health
azd version
azd config list

# Confirm say Azure authentication dey work
az account show
az account list

# Check di environment wey dey now
azd env show
azd env get-values

# Turn on debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Authentication Issues

### Wahala: "Failed to get access token"
**Symptoms:**
- `azd up` dey fail with authentication errors
- Commands dey show "unauthorized" or "access denied"

**Solutions:**
```bash
# 1. Do re-authenticate wit Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for systems wey no get head)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Wahala: "Insufficient privileges" during deployment
**Symptoms:**
- Deployment dey fail with permission errors
- You no fit create some Azure resources

**Solutions:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Make sure say you get di roles wey you need
# - Contributor (to fit create resource)
# - User Access Administrator (to fit assign roles)

# 3. Talk to your Azure administrator make dem give you correct permissions
```

### Wahala: Multi-tenant authentication problems
**Solutions:**
```bash
# 1. Login wit specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant for configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if you dey switch tenants
az account clear
```

## 🏗️ Infrastructure Provisioning Errors

### Wahala: Resource name conflicts
**Symptoms:**
- "The resource name already exists" errors dey show
- Deployment dey fail wen e wan create resource

**Solutions:**
```bash
# 1. Use unique resource names wit tokens
# For your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up di resources wey dey already
azd down --force --purge
```

### Wahala: Location/Region no dey available
**Symptoms:**
- "The location 'xyz' is not available for resource type" dey show
- Some SKUs no dey available for di region wey you select

**Solutions:**
```bash
# 1. Check di places wey dey available for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use di regions wey dey common
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check di service wey dey available for each region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Wahala: Quota don finish errors
**Symptoms:**
- "Quota exceeded for resource type" dey show
- "Maximum number of resources reached" dey show

**Solutions:**
```bash
# 1. Check how much quota you don use now
az vm list-usage --location eastus2 -o table

# 2. Ask for quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development work
# For main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Remove resources wey you no dey use
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Wahala: Bicep template errors
**Symptoms:**
- Template validation dey fail
- Syntax errors dey inside Bicep files

**Solutions:**
```bash
# 1. Check say Bicep syntax correct
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check say parameter file syntax correct
cat infra/main.parameters.json | jq '.'

# 4. Look wetin go change for deployment
azd provision --preview
```

## 🚀 Deployment Failures

### Wahala: Build failures
**Symptoms:**
- Application no fit build during deployment
- Package installation dey fail

**Solutions:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build for your machine
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # E suppose match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if you dey use containers
docker build -t test-image .
docker run --rm test-image
```

### Wahala: Container deployment failures
**Symptoms:**
- Container apps no dey start
- Image pull errors dey show

**Solutions:**
```bash
# 1. Test Docker build for di area
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Confirm say you fit access container registry
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Wahala: Database connection failures
**Symptoms:**
- Application no fit connect to database
- Connection dey timeout

**Solutions:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add am to your app for now:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Make sure say connection string format correct
azd env get-values | grep DATABASE

# 4. Check database server dey work
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Configuration Issues

### Wahala: Environment variables no dey work
**Symptoms:**
- App no fit read configuration values
- Environment variables dey show empty

**Solutions:**
```bash
# 1. Make sure say environment variables dey set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names for azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart di application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Wahala: SSL/TLS certificate problems
**Symptoms:**
- HTTPS no dey work
- Certificate validation errors dey show

**Solutions:**
```bash
# 1. Check how SSL certificate dey
az webapp config ssl list --resource-group myrg

# 2. Make sure say na only HTTPS go work
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if e dey necessary)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Wahala: CORS configuration problems
**Symptoms:**
- Frontend no fit call API
- Cross-origin request dey block

**Solutions:**
```bash
# 1. Set CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Change API make e fit handle CORS
# For Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Confirm say e dey run for correct URLs
azd show
```

## 🌍 Environment Management Issues

### Wahala: Environment switching problems
**Symptoms:**
- Wrong environment dey show
- Configuration no dey switch well

**Solutions:**
```bash
# 1. List all di environments
azd env list

# 2. Choose environment clear-clear
azd env select production

# 3. Check di current environment
azd env show

# 4. Make new environment if e don spoil
azd env new production-new
azd env select production-new
```

### Wahala: Environment don spoil
**Symptoms:**
- Environment dey show invalid state
- Resources no match configuration

**Solutions:**
```bash
# 1. Make environment state fresh
azd env refresh

# 2. Reset environment setup
azd env new production-reset
# Copy di environment variables wey you need
azd env set DATABASE_URL "your-value"

# 3. Bring in di resources wey dey already (if e fit work)
# Use hand take update .azure/production/config.json wit resource IDs
```

## 🔍 Performance Issues

### Wahala: Slow deployment times
**Symptoms:**
- Deployments dey take too much time
- Timeouts dey happen during deployment

**Solutions:**
```bash
# 1. Make parallel deployment dey work
azd config set deploy.parallelism 5

# 2. Use deployment wey dey add small small
azd deploy --incremental

# 3. Make build process better
# For package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check where resource dey (use same region)
azd config set defaults.location eastus2
```

### Wahala: Application performance problems
**Symptoms:**
- Response time dey slow
- Resource usage dey high

**Solutions:**
```bash
# 1. Increase resources
# Update SKU for main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Turn on Application Insights monitoring
azd monitor

# 3. Check application logs for where e dey slow
azd logs --service api --follow

# 4. Put caching
# Add Redis cache to your infrastructure
```

## 🛠️ Troubleshooting Tools and Commands

### Debug Commands
```bash
# Full debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Confirm configuration
azd config validate

# Test connection
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# App logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# List all di resources
az resource list --resource-group myrg -o table

# Check di resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Getting Additional Help

### Wen you go need escalate
- Authentication wahala no gree solve after you try all solutions
- Infrastructure wahala wey concern Azure services
- Billing or subscription wahala
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

### Information wey you go gather
Before you contact support, make sure say you collect:
- `azd version` output
- `azd info` output
- Error messages (full text)
- Steps wey you take wey cause di wahala
- Environment details (`azd env show`)
- Timeline of wen di wahala start

### Log Collection Script
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Issue Prevention

### Pre-deployment Checklist
```bash
# 1. Check say authentication correct
az account show

# 2. Check quotas and limits dem
az vm list-usage --location eastus2

# 3. Check say templates correct
az bicep build --file infra/main.bicep

# 4. Test am for local first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Monitoring Setup
```bash
# Enable Application Insights
# Add am for main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regular Maintenance
```bash
# Wíkli helth chék
./scripts/health-check.sh

# Móntli kóst rívíu
az consumption usage list --billing-period-name 202401

# Kwótali sẹkúríti rívíu
az security assessment list --resource-group myrg
```

## Related Resources

- [Debugging Guide](debugging.md) - Advanced debugging techniques
- [Provisioning Resources](../deployment/provisioning.md) - Infrastructure troubleshooting
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Resource planning guidance
- [SKU Selection](../pre-deployment/sku-selection.md) - Service tier recommendations

---

**Tip**: Keep dis guide for hand and use am anytime you see wahala. Most wahala don happen before and solution dey already!

---

**Navigation**
- **Previous Lesson**: [Provisioning Resources](../deployment/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transleshun service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transleshun. Even as we dey try make am accurate, abeg make you sabi say automatik transleshun fit get mistake or no correct well. Di original dokyument wey dey for im native language na di main source wey you go fit trust. For important informashun, e better make professional human transleshun dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transleshun.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->