<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T21:49:14+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "tl"
}
-->
# Karaniwang Isyu at Solusyon

## Panimula

Ang komprehensibong gabay na ito sa pag-troubleshoot ay tumatalakay sa mga madalas na nararanasang isyu kapag ginagamit ang Azure Developer CLI. Matutunan kung paano mag-diagnose, mag-troubleshoot, at magresolba ng mga karaniwang problema sa authentication, deployment, provisioning ng infrastructure, at configuration ng application. Ang bawat isyu ay may detalyadong sintomas, sanhi, at hakbang-hakbang na solusyon.

## Layunin ng Pag-aaral

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magiging bihasa sa mga teknik sa pag-diagnose ng mga isyu sa Azure Developer CLI
- Maiintindihan ang mga karaniwang problema sa authentication at permiso, pati na rin ang kanilang mga solusyon
- Malulutas ang mga pagkabigo sa deployment, mga error sa provisioning ng infrastructure, at mga isyu sa configuration
- Makakapagpatupad ng mga proaktibong monitoring at debugging na estratehiya
- Makakagamit ng sistematikong pamamaraan sa pag-troubleshoot ng mga komplikadong problema
- Makakapag-configure ng tamang logging at monitoring upang maiwasan ang mga susunod na isyu

## Mga Resulta ng Pag-aaral

Sa pagtatapos, magagawa mo ang sumusunod:
- Mag-diagnose ng mga isyu sa Azure Developer CLI gamit ang mga built-in na diagnostic tools
- Malutas ang mga problema sa authentication, subscription, at permiso nang mag-isa
- Mag-troubleshoot ng mga pagkabigo sa deployment at mga error sa provisioning ng infrastructure nang epektibo
- Mag-debug ng mga isyu sa configuration ng application at mga problemang partikular sa environment
- Magpatupad ng monitoring at alerting upang proaktibong matukoy ang mga potensyal na isyu
- Mag-apply ng mga pinakamahusay na kasanayan sa logging, debugging, at workflows sa pagresolba ng problema

## Mabilisang Diagnostics

Bago tumutok sa mga partikular na isyu, patakbuhin ang mga command na ito upang makakuha ng diagnostic na impormasyon:

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

## Mga Isyu sa Authentication

### Isyu: "Hindi makuha ang access token"
**Mga Sintomas:**
- Nabibigo ang `azd up` dahil sa mga error sa authentication
- Ang mga command ay nagbabalik ng "unauthorized" o "access denied"

**Mga Solusyon:**
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

### Isyu: "Hindi sapat na pribilehiyo" sa panahon ng deployment
**Mga Sintomas:**
- Nabibigo ang deployment dahil sa mga error sa permiso
- Hindi makagawa ng ilang Azure resources

**Mga Solusyon:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Isyu: Mga problema sa multi-tenant authentication
**Mga Solusyon:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Mga Error sa Provisioning ng Infrastructure

### Isyu: Mga conflict sa pangalan ng resource
**Mga Sintomas:**
- Mga error na "The resource name already exists"
- Nabibigo ang deployment sa panahon ng paglikha ng resource

**Mga Solusyon:**
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

### Isyu: Lokasyon/Rehiyon hindi available
**Mga Sintomas:**
- "The location 'xyz' is not available for resource type"
- Ang ilang SKUs ay hindi available sa napiling rehiyon

**Mga Solusyon:**
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

### Isyu: Mga error sa quota exceeded
**Mga Sintomas:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Mga Solusyon:**
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

### Isyu: Mga error sa Bicep template
**Mga Sintomas:**
- Mga pagkabigo sa validation ng template
- Mga syntax error sa mga Bicep file

**Mga Solusyon:**
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

## 🚀 Mga Pagkabigo sa Deployment

### Isyu: Mga pagkabigo sa build
**Mga Sintomas:**
- Nabibigo ang application na mag-build sa panahon ng deployment
- Mga error sa pag-install ng package

**Mga Solusyon:**
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

### Isyu: Mga pagkabigo sa deployment ng container
**Mga Sintomas:**
- Nabibigo ang mga container app na magsimula
- Mga error sa image pull

**Mga Solusyon:**
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

### Isyu: Mga pagkabigo sa koneksyon ng database
**Mga Sintomas:**
- Hindi makakonekta ang application sa database
- Mga error sa connection timeout

**Mga Solusyon:**
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

## 🔧 Mga Isyu sa Configuration

### Isyu: Hindi gumagana ang mga environment variable
**Mga Sintomas:**
- Hindi mabasa ng app ang mga configuration value
- Ang mga environment variable ay mukhang walang laman

**Mga Solusyon:**
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

### Isyu: Mga problema sa SSL/TLS certificate
**Mga Sintomas:**
- Hindi gumagana ang HTTPS
- Mga error sa validation ng certificate

**Mga Solusyon:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isyu: Mga problema sa CORS configuration
**Mga Sintomas:**
- Hindi makatawag ang frontend sa API
- Na-block ang cross-origin request

**Mga Solusyon:**
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

## 🌍 Mga Isyu sa Pamamahala ng Environment

### Isyu: Mga problema sa paglipat ng environment
**Mga Sintomas:**
- Mali ang environment na ginagamit
- Hindi maayos na nagbabago ang configuration

**Mga Solusyon:**
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

### Isyu: Korapsyon ng environment
**Mga Sintomas:**
- Ipinapakita ng environment ang invalid na estado
- Hindi tumutugma ang mga resources sa configuration

**Mga Solusyon:**
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

## 🔍 Mga Isyu sa Performance

### Isyu: Mabagal na deployment times
**Mga Sintomas:**
- Napakatagal ng deployment
- Mga timeout sa panahon ng deployment

**Mga Solusyon:**
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

### Isyu: Mga problema sa performance ng application
**Mga Sintomas:**
- Mabagal na response times
- Mataas na paggamit ng resources

**Mga Solusyon:**
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

## 🛠️ Mga Tools at Command sa Pag-troubleshoot

### Mga Debug Command
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

### Pagsusuri ng Log
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Pagsisiyasat ng Resource
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Pagkuha ng Karagdagang Tulong

### Kailan Mag-eskalate
- Patuloy ang mga isyu sa authentication kahit sinubukan na ang lahat ng solusyon
- Mga problema sa infrastructure na may kaugnayan sa Azure services
- Mga isyu sa billing o subscription
- Mga alalahanin sa seguridad o insidente

### Mga Channel ng Suporta
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

### Impormasyon na Dapat Kolektahin
Bago makipag-ugnayan sa suporta, kolektahin ang:
- Output ng `azd version`
- Output ng `azd info`
- Mga error message (buong teksto)
- Mga hakbang upang maulit ang isyu
- Mga detalye ng environment (`azd env show`)
- Timeline kung kailan nagsimula ang isyu

### Script sa Pagkolekta ng Log
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

## 📊 Pag-iwas sa Isyu

### Checklist Bago ang Deployment
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

### Setup ng Monitoring
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

### Regular na Maintenance
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Mga Kaugnay na Resources

- [Debugging Guide](debugging.md) - Mga advanced na teknik sa debugging
- [Provisioning Resources](../deployment/provisioning.md) - Pag-troubleshoot ng infrastructure
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Gabay sa pagpaplano ng resources
- [SKU Selection](../pre-deployment/sku-selection.md) - Mga rekomendasyon sa service tier

---

**Tip**: I-bookmark ang gabay na ito at gamitin ito tuwing makakaranas ng mga isyu. Karamihan sa mga problema ay nakita na dati at may mga nakahandang solusyon!

---

**Navigation**
- **Nakaraang Aralin**: [Provisioning Resources](../deployment/provisioning.md)
- **Susunod na Aralin**: [Debugging Guide](debugging.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.