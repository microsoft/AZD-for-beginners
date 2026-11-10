# Mga Karaniwang Isyu at Solusyon

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-troubleshoot at Pag-debug
- **⬅️ Nakaraang Kabanata**: [Kabanata 6: Mga Pre-flight Check](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Susunod**: [Gabayan sa Pag-debug](debugging.md)
- **🚀 Susunod na Kabanata**: [Kabanata 8: Mga Pattern sa Produksyon at Enterprise](../chapter-08-production/production-ai-practices.md)

## Panimula

Saklaw ng komprehensibong gabay na ito sa pag-troubleshoot ang mga madalas na nararanasang isyu sa paggamit ng Azure Developer CLI. Matutunan kung paano mag-diagnose, mag-troubleshoot, at magresolba ng mga karaniwang problema sa authentication, deployment, provisioning ng imprastraktura, at konfigurasyon ng aplikasyon. Ang bawat isyu ay may kasamang detalyadong mga sintomas, pangunahing sanhi, at mga hakbang sa pagresolba.

## Mga Layunin sa Pag-aaral

Sa pagkumpleto ng gabay na ito, ikaw ay:
- Mamahasa sa mga teknik sa pag-diagnose ng mga isyu sa Azure Developer CLI
- Maiintindihan ang mga karaniwang problema sa authentication at permiso pati ang mga solusyon nito
- Masosolusyunan ang mga pagkabigo sa deployment, pagkakamali sa provisioning ng imprastraktura, at mga isyu sa konfigurasyon
- Maipatutupad ang mga proaktibong estratehiya sa pagmamanman at pag-debug
- Magagamit ang sistematikong mga metodolohiya sa pag-troubleshoot para sa mas kumplikadong mga problema
- Makonpigura ang tamang paglo-log at pagmamanman para maiwasan ang mga susunod na isyu

## Mga Kinalabasan ng Pagkatuto

Kapag natapos mo ito, magkakaroon ka ng kakayahang:
- Mag-diagnose ng mga isyu ng Azure Developer CLI gamit ang mga built-in na diagnostic tool
- Solusyunan nang mag-isa ang mga isyu sa authentication, subscription, at permiso
- Magsagawa ng epektibong pag-troubleshoot sa mga pagkabigo sa deployment at mga pagkakamali sa provisioning ng imprastraktura
- Mag-debug ng mga isyu sa konfigurasyon ng aplikasyon at mga problema sa environment na tiyak
- Magpatupad ng pagmamanman at alerto upang proaktibong matukoy ang mga posibleng isyu
- Gumamit ng mga pinakamahusay na kasanayan sa paglo-log, pag-debug, at mga workflow ng paglutas ng problema

## Mabilis na Diagnostics

> Palitan ang mga halimbawa ng pangalan/ID ng mga halaga ng iyong kapaligiran. Ang mga fragment ng Bash, Bicep, JavaScript, at parameter-file ay hiwalay na nilagyan ng label sa ibaba; hindi ito isang execuatable na script. Suriin ang mga destruktibong operasyon at itago ang mga sikreto bago ibahagi ang mga diagnostics. `azd monitor --logs` ay magbubukas ng browser; hindi nito isinesend ang mga log ng terminal.

Bago sumabak sa mga partikular na isyu, patakbuhin ang mga utos na ito para mangalap ng impormasyon sa diagnostics:

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

## Mga Isyu sa Authentication

### Isyu: "Nabigong kunin ang access token"
**Mga Sintomas:**
- Nabibigo ang `azd up` na may mga error sa authentication
- Nagbabalik ang mga utos ng "hindi awtorisado" o "access denied"

**Mga Solusyon:**
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

### Isyu: "Kulang sa mga pribilehiyo" habang nagdedeposito
**Mga Sintomas:**
- Nabibigo ang deployment dahil sa mga error sa permiso
- Hindi makalikha ng ilang Azure na mga resource

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

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Mga Error sa Provisioning ng Imprastraktura

### Isyu: Hindi pagkakatugma sa pangalan ng resource
**Mga Sintomas:**
- Mga error na "Ang pangalan ng resource ay mayroon na"
- Nabibigo ang deployment habang nililikha ang resource

**Mga Solusyon:**
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

### Isyu: Lokasyon/Rehiyon hindi magagamit
**Mga Sintomas:**
- "Ang lokasyon 'xyz' ay hindi magagamit para sa uri ng resource"
- Hindi magagamit ang ilang SKU sa napiling rehiyon

**Mga Solusyon:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Ang pagbabago ng lokasyon na variable ay hindi naglalipat ng umiiral na mga resource. Maaaring tanggihan ng umiiral na resource group o resource ang pagbabago ng lokasyon; gumamit ng hiwalay na environment para sa regional redeployment.

### Isyu: Mga error sa labis na quota
**Mga Sintomas:**
- "Labis ang quota para sa uri ng resource"
- "Naabot ang pinakamataas na bilang ng mga resource"

**Mga Solusyon:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Para sa development, pumili ng suportadong mas maliit na SKU sa `infra/main.parameters.json`:

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

### Isyu: Mga error sa template ng Bicep
**Mga Sintomas:**
- Nabibigo ang validation ng template
- Mga error sa syntax ng mga Bicep file

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
- Nabibigo ang aplikasyon na mabuo habang nagdedeposito
- Mga error sa pag-install ng package

**Mga Solusyon:**
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

### Isyu: Mga pagkabigo sa deployment ng container
**Mga Sintomas:**
- Nabibigo ang pagsisimula ng mga container apps
- Mga error sa pag-pull ng image

**Mga Solusyon:**
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

### Isyu: Mga pagkabigo sa koneksyon sa database
**Mga Sintomas:**
- Hindi makakonekta ang aplikasyon sa database
- Mga error sa timeout ng koneksyon

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

## 🔧 Mga Isyu sa Konfigurasyon

### Isyu: Hindi gumagana ang mga environment variable
**Mga Sintomas:**
- Hindi mabasa ng app ang mga halaga ng konfigurasyon
- Mukhang walang laman ang mga environment variable

**Mga Solusyon:**
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

### Isyu: Mga problema sa SSL/TLS certificate
**Mga Sintomas:**
- Hindi gumagana ang HTTPS
- Mga error sa pag-validate ng certificate

**Mga Solusyon:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isyu: Mga problema sa konfigurasyon ng CORS
**Mga Sintomas:**
- Hindi makatawag ng API ang frontend
- Na-block ang cross-origin request

**Mga Solusyon:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. I-update ang iyong umiiral na Express application (kasama ang `cors` na na-import):

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

## 🌍 Mga Isyu sa Pamamahala ng Environment

### Isyu: Mga problema sa pagpapalit ng environment
**Mga Sintomas:**
- Nabibigay ang maling environment
- Hindi maayos na nagpapalit ang konfigurasyon

**Mga Solusyon:**
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

### Isyu: Pagkakasira ng environment
**Mga Sintomas:**
- Ipinapakita ng environment ang hindi wastong estado
- Hindi tugma ang mga resource sa konfigurasyon

**Mga Solusyon:**
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

## 🔍 Mga Isyu sa Pagganap

### Isyu: Mabagal na oras ng deployment
**Mga Sintomas:**
- Sobrang tagal ng deployment
- Mga timeout habang nagdedeposito

**Mga Solusyon:**
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

### Isyu: Mga problema sa pagganap ng aplikasyon
**Mga Sintomas:**
- Mabagal na pagresponde
- Mataas na paggamit ng resource

**Mga Solusyon:**
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

## 🛠️ Mga Kasangkapan at Utos para sa Pag-troubleshoot

### Mga Utos sa Pag-debug
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

### Pagsusuri ng Log
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

### Kailan Mag-eskala
- Patuloy ang mga isyu sa authentication pagkatapos subukan ang lahat ng solusyon
- Mga problema sa imprastraktura ng mga serbisyo ng Azure
- Mga isyu tungkol sa billing o subscription
- Mga alalahanin o insidente sa seguridad

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

### Impormasyon na Hahanapin
Bago makipag-ugnayan sa suporta, mangalap ng:
- Output ng `azd version`
- Output ng `azd config show`
- Output ng `azd show` (kasalukuyang status ng deployment)
- Mga mensahe ng error (buong teksto)
- Mga hakbang upang ulitin ang isyu
- Tinanggal na detalye ng environment (huwag kailanman ibahagi ang raw `azd env get-values`, na maaaring naglalaman ng mga sikreto)
- Takdang oras kung kailan nagsimula ang isyu

### Script sa Pagkolekta ng Log
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

## 📊 Pag-iwas sa Isyu

### Checklist bago mag-deploy
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

### Pagsasaayos ng Monitoring
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

### Regular na Maintenance
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Mga Kaugnay na Mapagkukunan

- [Gabayan sa Pag-debug](debugging.md) - Mga advanced na teknik sa pag-debug
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Pag-troubleshoot sa imprastraktura
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Gabay sa pagpaplano ng resource
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Mga rekomendasyon sa tier ng serbisyo

---

**Tip**: Panatilihing naka-bookmark ang gabay na ito at balikan ito kapag nakatagpo ng mga isyu. Karamihan sa mga problema ay dati nang nasaksihan at may mga naitatag na solusyon!

---

**Pag-navigate**
- **Nakaraang Aralin**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Susunod na Aralin**: [Gabayan sa Pag-debug](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->