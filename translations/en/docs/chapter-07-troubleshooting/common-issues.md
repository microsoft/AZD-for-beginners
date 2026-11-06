# Common Issues and Solutions

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous Chapter**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Debugging Guide](debugging.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

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

> Replace example names/IDs with your environment's values. Bash, Bicep, JavaScript, and parameter-file fragments are labeled separately below; they are not one executable script. Review destructive operations and redact secrets before sharing diagnostics. `azd monitor --logs` opens a browser; it does not stream terminal logs.

Before diving into specific issues, run these commands to gather diagnostic information:

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

## Authentication Issues

### Issue: "Failed to get access token"
**Symptoms:**
- `azd up` fails with authentication errors
- Commands return "unauthorized" or "access denied"

**Solutions:**
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

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastructure Provisioning Errors

### Issue: Resource name conflicts
**Symptoms:**
- "The resource name already exists" errors
- Deployment fails during resource creation

**Solutions:**
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

### Issue: Location/Region not available
**Symptoms:**
- "The location 'xyz' is not available for resource type"
- Certain SKUs not available in selected region

**Solutions:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Changing the location variable does not migrate existing resources. An existing resource group or resource may reject a location change; use a separate environment for a regional redeployment.

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

```

For development, choose a supported smaller SKU in `infra/main.parameters.json`:

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

### Issue: Container deployment failures
**Symptoms:**
- Container apps fail to start
- Image pull errors

**Solutions:**
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
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

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

```

2. Update your existing Express application (with `cors` imported):

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
azd env list

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

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Performance Issues

### Issue: Slow deployment times
**Symptoms:**
- Deployments taking too long
- Timeouts during deployment

**Solutions:**
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

### Issue: Application performance problems
**Symptoms:**
- Slow response times
- High resource usage

**Solutions:**
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
- `azd config show` output
- `azd show` output (current deployment status)
- Error messages (full text)
- Steps to reproduce the issue
- Redacted environment details (never share raw `azd env get-values`, which may contain secrets)
- Timeline of when issue started

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

## Related Resources

- [Debugging Guide](debugging.md) - Advanced debugging techniques
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastructure troubleshooting
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Resource planning guidance
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Service tier recommendations

---

**Tip**: Keep this guide bookmarked and refer to it whenever you encounter issues. Most problems have been seen before and have established solutions!

---

**Navigation**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->