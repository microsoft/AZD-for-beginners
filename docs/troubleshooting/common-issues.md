# Common Issues & Solutions

## Introduction

This comprehensive troubleshooting guide covers the most frequently encountered issues when using Azure Developer CLI. Learn to diagnose, troubleshoot, and resolve common problems with authentication, deployment, infrastructure provisioning, and application configuration. Each issue includes detailed symptoms, root causes, and step-by-step resolution procedures.

## Learning Goals

By completing this guide, you will:
- Master diagnostic techniques for Azure Developer CLI issues
- Understand common authentication and permission problems and their solutions
- Resolve deployment failures, infrastructure provisioning errors, and configuration issues
- Implement proactive monitoring and debugging strategies
- Apply systematic troubleshooting methodologies for complex problems
- Configure proper logging and monitoring to prevent future issues

## Learning Outcomes

Upon completion, you will be able to:
- Diagnose Azure Developer CLI issues using built-in diagnostic tools
- Resolve authentication, subscription, and permission-related problems independently
- Troubleshoot deployment failures and infrastructure provisioning errors effectively
- Debug application configuration issues and environment-specific problems
- Implement monitoring and alerting to proactively identify potential issues
- Apply best practices for logging, debugging, and problem resolution workflows

## Quick Diagnostics

Before diving into specific issues, run these commands to gather diagnostic information:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Authentication Issues

### Issue: "Failed to get access token"
**Symptoms:**
- `azd up` fails with authentication errors
- Commands return "unauthorized" or "access denied"

**Solutions:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Issue: "Insufficient privileges" during deployment
**Symptoms:**
- Deployment fails with permission errors
- Can't create certain Azure resources

**Solutions:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Issue: Multi-tenant authentication problems
**Solutions:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastructure Provisioning Errors

### Issue: Resource name conflicts
**Symptoms:**
- "The resource name already exists" errors
- Deployment fails during resource creation

**Solutions:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Issue: Location/Region not available
**Symptoms:**
- "The location 'xyz' is not available for resource type"
- Certain SKUs not available in selected region

**Solutions:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Issue: Quota exceeded errors
**Symptoms:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Solutions:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Issue: Bicep template errors
**Symptoms:**
- Template validation failures
- Syntax errors in Bicep files

**Solutions:**
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

### Issue: Build failures
**Symptoms:**
- Application fails to build during deployment
- Package installation errors

**Solutions:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Issue: Container deployment failures
**Symptoms:**
- Container apps fail to start
- Image pull errors

**Solutions:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Issue: Database connection failures
**Symptoms:**
- Application can't connect to database
- Connection timeout errors

**Solutions:**
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

## 🔧 Configuration Issues

### Issue: Environment variables not working
**Symptoms:**
- App can't read configuration values
- Environment variables appear empty

**Solutions:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Issue: SSL/TLS certificate problems
**Symptoms:**
- HTTPS not working
- Certificate validation errors

**Solutions:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Issue: CORS configuration problems
**Symptoms:**
- Frontend can't call API
- Cross-origin request blocked

**Solutions:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Environment Management Issues

### Issue: Environment switching problems
**Symptoms:**
- Wrong environment being used
- Configuration not switching properly

**Solutions:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Issue: Environment corruption
**Symptoms:**
- Environment shows invalid state
- Resources don't match configuration

**Solutions:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Performance Issues

### Issue: Slow deployment times
**Symptoms:**
- Deployments taking too long
- Timeouts during deployment

**Solutions:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Issue: Application performance problems
**Symptoms:**
- Slow response times
- High resource usage

**Solutions:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Troubleshooting Tools and Commands

### Debug Commands
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

## 🆘 Getting Additional Help

### When to Escalate
- Authentication issues persist after trying all solutions
- Infrastructure problems with Azure services
- Billing or subscription-related issues
- Security concerns or incidents

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

### Information to Gather
Before contacting support, collect:
- `azd version` output
- `azd info` output
- Error messages (full text)
- Steps to reproduce the issue
- Environment details (`azd env show`)
- Timeline of when issue started

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
```bash
# Enable Application Insights
# Add to main.bicep:
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
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Related Resources

- [Debugging Guide](debugging.md) - Advanced debugging techniques
- [Provisioning Resources](../deployment/provisioning.md) - Infrastructure troubleshooting
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Resource planning guidance
- [SKU Selection](../pre-deployment/sku-selection.md) - Service tier recommendations

---

**Tip**: Keep this guide bookmarked and refer to it whenever you encounter issues. Most problems have been seen before and have established solutions!

---

**Navigation**
- **Previous Lesson**: [Provisioning Resources](../deployment/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)