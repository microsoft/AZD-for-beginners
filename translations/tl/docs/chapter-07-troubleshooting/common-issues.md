# Karaniwang Mga Isyu at Solusyon

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-troubleshoot at Pag-debug
- **⬅️ Nakaraang Kabanata**: [Kabanata 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Susunod**: [Debugging Guide](debugging.md)
- **🚀 Susunod na Kabanata**: [Kabanata 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Panimula

Saklaw ng komprehensibong gabay na ito sa pag-troubleshoot ang mga pinaka-karaniwang isyu kapag gumagamit ng Azure Developer CLI. Matutunan kung paano mag-diagnose, mag-troubleshoot, at lutasin ang mga karaniwang problema sa pag-authenticate, deployment, provisioning ng infrastruktura, at konfigurasyon ng aplikasyon. Ang bawat isyu ay naglalaman ng detalyadong mga sintomas, ugat ng problema, at hakbang-hakbang na mga pamamaraan ng paglutas.

## Mga Layunin ng Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Maging bihasa sa mga teknik ng diagnosis para sa mga isyu ng Azure Developer CLI
- Maunawaan ang mga karaniwang problema sa authentication at permiso at ang kanilang mga solusyon
- Malutas ang mga pagkabigo sa deployment, mga error sa provisioning ng infrastruktura, at mga isyu sa konfigurasyon
- Magpatupad ng proaktibong pagmamanman at mga estratehiya sa pag-debug
- Ilapat ang sistematikong mga metodolohiya sa pag-troubleshoot para sa mga kumplikadong problema
- I-configure ang wastong pag-log at monitoring upang maiwasan ang mga hinaharap na isyu

## Mga Kinalabasan ng Pagkatuto

Sa pagtatapos, magagawa mong:
- Mag-diagnose ng mga isyu ng Azure Developer CLI gamit ang mga built-in na diagnostic na tool
- Malutas ang mga isyu na may kaugnayan sa authentication, subscription, at permiso nang mag-isa
- Mag-troubleshoot ng mga pagkabigo sa deployment at mga error sa provisioning ng infrastruktura nang epektibo
- I-debug ang mga isyu sa konfigurasyon ng aplikasyon at mga problema na partikular sa environment
- Magpatupad ng monitoring at alerting upang proaktibong tuklasin ang mga potensyal na isyu
- Ilapat ang mga pinakamahusay na kasanayan para sa pag-log, pag-debug, at mga workflow ng paglutas ng problema

## Mabilisang Diagnostics

Bago sumisid sa mga partikular na isyu, patakbuhin ang mga utos na ito upang mangalap ng impormasyon sa diagnosis:

```bash
# Suriin ang bersyon at kalusugan ng azd
azd version
azd config list

# Suriin ang awtentikasyon sa Azure
az account show
az account list

# Suriin ang kasalukuyang kapaligiran
azd env show
azd env get-values

# Paganahin ang debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Mga Isyu sa Authentication

### Isyu: "Failed to get access token"
**Sintomas:**
- `azd up` nabibigo na may mga error sa authentication
- Nagbabalik ang mga utos ng "unauthorized" o "access denied"

**Mga Solusyon:**
```bash
# 1. Muling mag-authenticate gamit ang Azure CLI
az login
az account show

# 2. I-clear ang naka-cache na mga kredensyal
az account clear
az login

# 3. Gumamit ng device code flow (para sa mga headless na sistema)
az login --use-device-code

# 4. Itakda ang espesipikong subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Isyu: "Insufficient privileges" habang nagda-deploy
**Sintomas:**
- Nabibigo ang deployment dahil sa mga error sa permiso
- Hindi makalikha ng ilang Azure resources

**Mga Solusyon:**
```bash
# 1. Suriin ang iyong mga itinalagang role sa Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Tiyakin na mayroon ka ng mga kinakailangang role
# - Contributor (para sa paglikha ng mga resource)
# - User Access Administrator (para sa pagtatalaga ng mga role)

# 3. Makipag-ugnayan sa iyong Azure administrator para sa tamang mga pahintulot
```

### Isyu: Mga problema sa multi-tenant authentication
**Mga Solusyon:**
```bash
# 1. Mag-login gamit ang partikular na tenant
az login --tenant "your-tenant-id"

# 2. Itakda ang tenant sa konfigurasyon
azd config set auth.tenantId "your-tenant-id"

# 3. I-clear ang cache ng tenant kapag nagpapalit ng tenant
az account clear
```

## 🏗️ Mga Error sa Provisioning ng Infrastruktura

### Isyu: Pagkakasalungatan ng pangalan ng resource
**Sintomas:**
- Mga error na "The resource name already exists"
- Nabibigo ang deployment habang lumilikha ng resource

**Mga Solusyon:**
```bash
# 1. Gumamit ng natatanging mga pangalan ng resource na may mga token
# Sa iyong Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Palitan ang pangalan ng kapaligiran
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Linisin ang mga umiiral na resource
azd down --force --purge
```

### Isyu: Lokasyon/Region na hindi available
**Sintomas:**
- "The location 'xyz' is not available for resource type"
- Hindi available ang ilang SKUs sa napiling rehiyon

**Mga Solusyon:**
```bash
# 1. Suriin ang mga magagamit na lokasyon para sa mga uri ng resource
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gumamit ng mga karaniwang magagamit na rehiyon
azd config set defaults.location eastus2
# o
azd env set AZURE_LOCATION eastus2

# 3. Suriin ang pagiging magagamit ng serbisyo ayon sa rehiyon
# Bisitahin: https://azure.microsoft.com/global-infrastructure/services/
```

### Isyu: Lumagpas sa quota
**Sintomas:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Mga Solusyon:**
```bash
# 1. Suriin ang kasalukuyang paggamit ng quota
az vm list-usage --location eastus2 -o table

# 2. Humiling ng pagtaas ng quota sa pamamagitan ng Azure portal
# Pumunta sa: Subscriptions > Usage + quotas

# 3. Gumamit ng mas maliit na SKU para sa pag-develop
# Sa main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Linisin ang mga hindi ginagamit na resource
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Isyu: Mga error sa Bicep template
**Sintomas:**
- Nabibigo ang template validation
- Mga syntax error sa mga Bicep file

**Mga Solusyon:**
```bash
# 1. I-validate ang sintaks ng Bicep
az bicep build --file infra/main.bicep

# 2. Gumamit ng linter para sa Bicep
az bicep lint --file infra/main.bicep

# 3. Suriin ang sintaks ng file ng parameter
cat infra/main.parameters.json | jq '.'

# 4. I-preview ang mga pagbabago sa deployment
azd provision --preview
```

## 🚀 Mga Pagkabigo sa Deployment

### Isyu: Mga pagkabigo sa build
**Sintomas:**
- Nabibigo ang aplikasyon na mabuo habang nag-de-deploy
- Mga error sa pag-install ng package

**Mga Solusyon:**
```bash
# 1. Suriin ang output ng build gamit ang debug flag
azd deploy --service web --debug

# 2. Tingnan ang status ng naka-deploy na serbisyo
azd show

# 3. Subukan ang build nang lokal
cd src/web
npm install
npm run build

# 3. Suriin ang pagiging compatible ng bersyon ng Node.js at Python
node --version  # Dapat tumugma sa mga setting ng azure.yaml
python --version

# 4. I-clear ang cache ng build
rm -rf node_modules package-lock.json
npm install

# 5. Suriin ang Dockerfile kung gumagamit ng mga container
docker build -t test-image .
docker run --rm test-image
```

### Isyu: Mga pagkabigo sa pag-deploy ng container
**Sintomas:**
- Nabibigo ang mga container apps na magsimula
- Mga error sa pag-pull ng image

**Mga Solusyon:**
```bash
# 1. Subukan ang pag-build ng Docker sa lokal
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Suriin ang mga log ng container gamit ang Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Subaybayan ang aplikasyon gamit ang azd
azd monitor --logs

# 3. Tiyakin ang pag-access sa registry ng mga container
az acr login --name myregistry

# 4. Suriin ang konfigurasyon ng container app
az containerapp show --name my-app --resource-group my-rg
```

### Isyu: Mga pagkabigo sa koneksyon ng database
**Sintomas:**
- Hindi makakonekta ang aplikasyon sa database
- Mga error sa connection timeout

**Mga Solusyon:**
```bash
# 1. Suriin ang mga patakaran ng firewall ng database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Subukan ang koneksyon mula sa aplikasyon
# Idagdag pansamantala sa iyong app:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Tiyakin ang format ng connection string
azd env get-values | grep DATABASE

# 4. Suriin ang katayuan ng server ng database
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Mga Isyu sa Konfigurasyon

### Isyu: Hindi gumagana ang environment variables
**Sintomas:**
- Hindi mabasa ng app ang mga halaga ng konfigurasyon
- Lumilitaw na walang laman ang environment variables

**Mga Solusyon:**
```bash
# 1. Tiyakin na nakaset ang mga environment variable
azd env get-values
azd env get DATABASE_URL

# 2. Suriin ang mga pangalan ng variable sa azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. I-restart ang aplikasyon
azd deploy --service web

# 4. Suriin ang konfigurasyon ng App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Isyu: Mga problema sa SSL/TLS certificate
**Sintomas:**
- Hindi gumagana ang HTTPS
- Mga error sa pag-validate ng certificate

**Mga Solusyon:**
```bash
# 1. Suriin ang katayuan ng sertipiko ng SSL
az webapp config ssl list --resource-group myrg

# 2. Paganahin ang HTTPS lamang
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Magdagdag ng pasadyang domain (kung kinakailangan)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isyu: Mga problema sa konfigurasyon ng CORS
**Sintomas:**
- Hindi makatawag ang frontend sa API
- Cross-origin request blocked

**Mga Solusyon:**
```bash
# 1. I-configure ang CORS para sa App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. I-update ang API para hawakan ang CORS
# Sa Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Suriin kung tumatakbo sa tamang mga URL
azd show
```

## 🌍 Mga Isyu sa Pamamahala ng Environment

### Isyu: Mga problema sa pag-switch ng environment
**Sintomas:**
- Mali ang environment na ginagamit
- Hindi maayos ang pag-switch ng konfigurasyon

**Mga Solusyon:**
```bash
# 1. Ilista ang lahat ng mga kapaligiran
azd env list

# 2. Tahasang piliin ang kapaligiran
azd env select production

# 3. Suriin ang kasalukuyang kapaligiran
azd env show

# 4. Lumikha ng bagong kapaligiran kung ito ay nasira
azd env new production-new
azd env select production-new
```

### Isyu: Corruption ng environment
**Sintomas:**
- Ipinapakita ng environment ang invalid na estado
- Hindi tumutugma ang mga resources sa konfigurasyon

**Mga Solusyon:**
```bash
# 1. I-refresh ang estado ng kapaligiran
azd env refresh

# 2. I-reset ang konfigurasyon ng kapaligiran
azd env new production-reset
# Kopyahin ang mga kinakailangang variable ng kapaligiran
azd env set DATABASE_URL "your-value"

# 3. I-import ang umiiral na mga resource (kung posible)
# Manu-manong i-update ang .azure/production/config.json gamit ang mga ID ng resource
```

## 🔍 Mga Isyu sa Pagganap

### Isyu: Mabagal na oras ng deployment
**Sintomas:**
- Masyadong matagal ang mga deployment
- Mga timeout habang nag-de-deploy

**Mga Solusyon:**
```bash
# 1. Mag-deploy ng mga tiyak na serbisyo para sa mas mabilis na iterasyon
azd deploy --service web
azd deploy --service api

# 2. Gumamit ng deployment na puro code kapag hindi nagbago ang imprastruktura
azd deploy  # Mas mabilis kaysa sa azd up

# 3. I-optimize ang proseso ng build
# Sa package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Suriin ang lokasyon ng mga resource (gumamit ng parehong rehiyon)
azd config set defaults.location eastus2
```

### Isyu: Mga problema sa pagganap ng aplikasyon
**Sintomas:**
- Mabagal na tugon
- Mataas na paggamit ng resources

**Mga Solusyon:**
```bash
# 1. Palakihin ang mga mapagkukunan
# I-update ang SKU sa main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Paganahin ang pagmamanman ng Application Insights
azd monitor --overview

# 3. Suriin ang mga log ng aplikasyon sa Azure
az webapp log tail --name myapp --resource-group myrg
# o para sa Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Magpatupad ng caching
# Magdagdag ng Redis cache sa iyong imprastruktura
```

## 🛠️ Mga Kasangkapan at Utos para sa Pag-troubleshoot

### Mga Utos para sa Debug
```bash
# Komprehensibong pag-debug
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Suriin ang bersyon ng azd
azd version

# Tingnan ang kasalukuyang konfigurasyon
azd config list

# Subukan ang koneksyon
curl -v https://myapp.azurewebsites.net/health
```

### Pagsusuri ng Log
```bash
# Mga log ng aplikasyon sa pamamagitan ng Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Subaybayan ang aplikasyon gamit ang azd
azd monitor --logs
azd monitor --live

# Mga log ng resource ng Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Mga log ng container (para sa Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Imbestigasyon ng Resource
```bash
# Ilista ang lahat ng mga mapagkukunan
az resource list --resource-group myrg -o table

# Suriin ang katayuan ng mapagkukunan
az webapp show --name myapp --resource-group myrg --query state

# Diagnostiko ng network
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Pagkuha ng Karagdagang Tulong

### Kailan Mag-escalate
- Patuloy ang mga isyu sa authentication pagkatapos subukan ang lahat ng solusyon
- Mga problema sa infrastruktura na may kinalaman sa mga serbisyo ng Azure
- Mga isyu na may kinalaman sa billing o subscription
- Mga alalahanin o insidente sa seguridad

### Mga Channel ng Suporta
```bash
# 1. Suriin ang Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Gumawa ng support ticket sa Azure
# Pumunta sa: https://portal.azure.com -> Tulong + suporta

# 3. Mga mapagkukunan ng komunidad
# - Stack Overflow: tag na azure-developer-cli
# - Mga Isyu sa GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Impormasyong Dapat Tipunin
Bago makipag-ugnayan sa suporta, kolektahin ang:
- `azd version` output
- `azd config list` output
- `azd show` output (kasalukuyang status ng deployment)
- Mga mensahe ng error (buong teksto)
- Mga hakbang upang ma-reproduce ang isyu
- Mga detalye ng environment (`azd env show`)
- Timeline kung kailan nagsimula ang isyu

### Script para sa Pagkolekta ng Log
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

## 📊 Pag-iwas sa Mga Isyu

### Checklist bago mag-deploy
```bash
# Suriin ang awtentikasyon
az account show

# Suriin ang mga quota at limitasyon
az vm list-usage --location eastus2

# Suriin ang mga template
az bicep build --file infra/main.bicep

# Subukan muna nang lokal
npm run build
npm run test

# Gumamit ng dry-run na deployment
azd provision --preview
```

### Setup ng Monitoring
```bash
# Paganahin ang Application Insights
# Idagdag sa main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Mag-set up ng mga alerto
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regular na Pagpapanatili
```bash
# Lingguhang pagsusuri ng kalusugan
./scripts/health-check.sh

# Buwanang pagsusuri ng gastos
az consumption usage list --billing-period-name 202401

# Pagsusuri ng seguridad tuwing tatlong buwan
az security assessment list --resource-group myrg
```

## Mga Kaugnay na Mapagkukunan

- [Debugging Guide](debugging.md) - Advanced na mga teknik sa pag-debug
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Pag-troubleshoot ng infrastruktura
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Patnubay sa pagpaplano ng recurso
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Mga rekomendasyon sa tier ng serbisyo

---

**Tip**: I-bookmark ang gabay na ito at balikan kapag nakaranas ka ng mga isyu. Karamihan sa mga problema ay dati nang naitala at may mga natukoy na solusyon!

---

**Navigation**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring na opisyal na pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->