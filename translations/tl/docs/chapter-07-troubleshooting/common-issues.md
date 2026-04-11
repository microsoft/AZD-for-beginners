# Common Issues and Solutions

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 7 - Troubleshooting & Debugging
- **⬅️ Previous Chapter**: [Kabanata 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Gabay sa Pag-debug](debugging.md)
- **🚀 Next Chapter**: [Kabanata 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Panimula

Ang komprehensibong gabay sa troubleshooting na ito ay sumasaklaw sa mga pinaka-karaniwang isyu kapag ginagamit ang Azure Developer CLI. Matutunan kung paano mag-diagnose, mag-troubleshoot, at lutasin ang mga karaniwang problema sa autentikasyon, deployment, pag-provision ng imprastruktura, at konfigurasyon ng aplikasyon. Bawat isyu ay may kasamang detalyadong sintomas, ugat ng sanhi, at hakbang-hakbang na mga pamamaraan ng paglutas.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magsanay ng mga teknik sa diagnosis para sa mga isyu ng Azure Developer CLI
- Maintindihan ang mga karaniwang problema sa autentikasyon at permiso at ang kanilang mga solusyon
- Makalutas ng mga pagkabigo sa deployment, mga error sa pag-provision ng imprastruktura, at mga isyu sa konfigurasyon
- Magpatupad ng proaktibong pagmo-monitor at mga estratehiya sa pag-debug
- Mag-apply ng sistematikong mga metodolohiya ng troubleshooting para sa mga kumplikadong problema
- I-configure ang tamang logging at monitoring upang maiwasan ang mga hinaharap na isyu

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto, magagawa mong:
- Mag-diagnose ng mga isyu ng Azure Developer CLI gamit ang mga built-in na diagnostic tools
- Lutasin nang mag-isa ang mga problema na may kinalaman sa autentikasyon, subscription, at permiso
- Mag-troubleshoot nang epektibo ng mga pagkabigo sa deployment at mga error sa pag-provision ng imprastruktura
- I-debug ang mga isyu sa konfigurasyon ng aplikasyon at mga problema na partikular sa kapaligiran
- Magpatupad ng monitoring at alerting upang proaktibong matukoy ang mga potensyal na isyu
- Mag-apply ng pinakamahusay na kasanayan para sa logging, debugging, at mga workflow sa paglutas ng problema

## Mabilis na Diagnostiko

Bago tumalon sa mga partikular na isyu, patakbuhin ang mga utos na ito upang mangalap ng impormasyon sa diagnosis:

```bash
# Suriin ang bersyon at kalusugan ng azd
azd version
azd config show

# Suriin ang pagpapatotoo ng Azure
az account show
az account list

# Suriin ang kasalukuyang kapaligiran
azd env list
azd env get-values

# Paganahin ang pag-log ng debug
export AZD_DEBUG=true
azd <command> --debug
```

## Mga Isyu sa Autentikasyon

### Isyu: "Failed to get access token"
**Sintomas:**
- `azd up` ay nabibigo na may mga error sa autentikasyon
- Ang mga utos ay nagbabalik ng "unauthorized" o "access denied"

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

# 4. Itakda ang tiyak na subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Isyu: "Insufficient privileges" during deployment
**Sintomas:**
- Nabibigo ang deployment na may mga error sa permiso
- Hindi makalikha ng ilang Azure resources

**Mga Solusyon:**
```bash
# 1. Suriin ang iyong mga pagtatalaga ng papel sa Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Tiyakin na mayroon kang mga kinakailangang papel
# - Contributor (para sa paglikha ng mga resource)
# - User Access Administrator (para sa mga pagtatalaga ng papel)

# 3. Makipag-ugnayan sa iyong Azure administrator para sa wastong mga pahintulot
```

### Isyu: Multi-tenant authentication problems
**Mga Solusyon:**
```bash
# 1. Mag-login sa isang partikular na tenant
az login --tenant "your-tenant-id"

# 2. Itakda ang tenant sa konfigurasyon
azd config set auth.tenantId "your-tenant-id"

# 3. Linisin ang cache ng tenant kapag lumilipat sa ibang tenant
az account clear
```

## 🏗️ Mga Error sa Pag-provision ng Imprastruktura

### Isyu: Resource name conflicts
**Sintomas:**
- "The resource name already exists" errors
- Nabibigo ang deployment habang lumilikha ng resource

**Mga Solusyon:**
```bash
# 1. Gumamit ng natatanging mga pangalan ng resource na may mga token
# Sa iyong Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Palitan ang pangalan ng environment
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Linisin ang mga umiiral na resource
azd down --force --purge
```

### Isyu: Location/Region not available
**Sintomas:**
- "The location 'xyz' is not available for resource type"
- Ang ilang SKUs ay hindi magagamit sa napiling rehiyon

**Mga Solusyon:**
```bash
# 1. Suriin ang mga magagamit na lokasyon para sa mga uri ng resource
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gumamit ng mga rehiyong karaniwang magagamit
azd config set defaults.location eastus2
# o
azd env set AZURE_LOCATION eastus2

# 3. Suriin ang pagiging magagamit ng serbisyo sa bawat rehiyon
# Bisitahin: https://azure.microsoft.com/global-infrastructure/services/
```

### Isyu: Quota exceeded errors
**Sintomas:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Mga Solusyon:**
```bash
# 1. Suriin ang kasalukuyang paggamit ng quota
az vm list-usage --location eastus2 -o table

# 2. Humiling ng pagtaas ng quota sa pamamagitan ng Azure portal
# Pumunta sa: Subscriptions > Usage + quotas

# 3. Gumamit ng mas maliliit na mga SKU para sa development
# Sa main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Linisin ang mga hindi nagagamit na resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Isyu: Bicep template errors
**Sintomas:**
- Mga pagkabigo sa validation ng template
- Mga syntax error sa mga Bicep file

**Mga Solusyon:**
```bash
# 1. Suriin ang sintaks ng Bicep
az bicep build --file infra/main.bicep

# 2. Gamitin ang linter ng Bicep
az bicep lint --file infra/main.bicep

# 3. Suriin ang sintaks ng file ng parameter
cat infra/main.parameters.json | jq '.'

# 4. Paunang tingnan ang mga pagbabago sa pag-deploy
azd provision --preview
```

## 🚀 Mga Kabiguan sa Deployment

### Isyu: Build failures
**Sintomas:**
- Nabibigo ang aplikasyon na mag-build habang nagde-deploy
- Mga error sa pag-install ng package

**Mga Solusyon:**
```bash
# 1. Suriin ang output ng build gamit ang debug flag
azd deploy --service web --debug

# 2. Tingnan ang katayuan ng na-deploy na serbisyo
azd show

# 3. Subukan ang build nang lokal
cd src/web
npm install
npm run build

# 3. Suriin ang pagkakatugma ng bersyon ng Node.js/Python
node --version  # Dapat tumugma sa mga setting ng azure.yaml
python --version

# 4. Linisin ang cache ng build
rm -rf node_modules package-lock.json
npm install

# 5. Suriin ang Dockerfile kung gumagamit ng mga container
docker build -t test-image .
docker run --rm test-image
```

### Isyu: Container deployment failures
**Sintomas:**
- Nabibigo ang mga container app na magsimula
- Mga error sa paghila ng imahe

**Mga Solusyon:**
```bash
# 1. Subukan ang lokal na pagbuo ng Docker
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Suriin ang mga log ng container gamit ang Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Subaybayan ang aplikasyon gamit ang azd
azd monitor --logs

# 3. Tiyakin ang pag-access sa container registry
az acr login --name myregistry

# 4. Suriin ang konfigurasyon ng container app
az containerapp show --name my-app --resource-group my-rg
```

### Isyu: Database connection failures
**Sintomas:**
- Hindi makakonekta ang aplikasyon sa database
- Mga timeout sa koneksyon

**Mga Solusyon:**
```bash
# 1. Suriin ang mga patakaran ng firewall ng database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Subukan ang koneksyon mula sa aplikasyon
# Idagdag sa iyong app pansamantala:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Suriin ang format ng string ng koneksyon
azd env get-values | grep DATABASE

# 4. Suriin ang status ng server ng database
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Mga Isyu sa Konfigurasyon

### Isyu: Environment variables not working
**Sintomas:**
- Hindi mabasa ng app ang mga halaga ng konfigurasyon
- Mukhang walang laman ang mga environment variable

**Mga Solusyon:**
```bash
# 1. Tiyakin na naka-set ang mga environment variable
azd env get-values
azd env get DATABASE_URL

# 2. Suriin ang mga pangalan ng variable sa azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. I-restart ang aplikasyon
azd deploy --service web

# 4. Suriin ang konfigurasyon ng app service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Isyu: SSL/TLS certificate problems
**Sintomas:**
- Hindi gumagana ang HTTPS
- Mga error sa pag-validate ng sertipiko

**Mga Solusyon:**
```bash
# 1. Suriin ang katayuan ng sertipiko ng SSL
az webapp config ssl list --resource-group myrg

# 2. Paganahin ang HTTPS lamang
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Magdagdag ng pasadyang domain (kung kinakailangan)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isyu: CORS configuration problems
**Sintomas:**
- Hindi makatawag ang frontend sa API
- Na-block ang cross-origin request

**Mga Solusyon:**
```bash
# 1. I-configure ang CORS para sa App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. I-update ang API upang pangasiwaan ang CORS
# Sa Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Suriin kung tumatakbo sa tamang mga URL
azd show
```

## 🌍 Mga Isyu sa Pamamahala ng Kapaligiran

### Isyu: Environment switching problems
**Sintomas:**
- Mali ang kapaligiran na ginagamit
- Hindi tama ang paglipat ng konfigurasyon

**Mga Solusyon:**
```bash
# 1. Ilista ang lahat ng mga kapaligiran
azd env list

# 2. Hayagang piliin ang kapaligiran
azd env select production

# 3. Suriin ang kasalukuyang kapaligiran
azd env list

# 4. Gumawa ng bagong kapaligiran kung ito ay nasira
azd env new production-new
azd env select production-new
```

### Isyu: Environment corruption
**Sintomas:**
- Ipinapakita ng kapaligiran ang hindi wastong estado
- Hindi tumutugma ang mga resources sa konfigurasyon

**Mga Solusyon:**
```bash
# 1. I-refresh ang estado ng kapaligiran
azd env refresh

# 2. I-reset ang konfigurasyon ng kapaligiran
azd env new production-reset
# Kopyahin ang mga kinakailangang variable ng kapaligiran
azd env set DATABASE_URL "your-value"

# 3. I-import ang mga umiiral na resources (kung maaari)
# Manu-manong i-update ang .azure/production/config.json gamit ang mga ID ng resource
```

## 🔍 Mga Isyu sa Pagganap

### Isyu: Slow deployment times
**Sintomas:**
- Masyadong matagal ang mga deployment
- Mga timeout habang nagde-deploy

**Mga Solusyon:**
```bash
# 1. Ilunsad ang mga partikular na serbisyo para sa mas mabilis na iterasyon
azd deploy --service web
azd deploy --service api

# 2. Gamitin ang pag-deploy na puro code kapag hindi nagbago ang imprastruktura
azd deploy  # Mas mabilis kaysa sa azd up

# 3. I-optimize ang proseso ng build
# Sa package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Suriin ang lokasyon ng mga resource (gamitin ang parehong rehiyon)
azd config set defaults.location eastus2
```

### Isyu: Application performance problems
**Sintomas:**
- Mabagal ang oras ng pagtugon
- Mataas ang paggamit ng resources

**Mga Solusyon:**
```bash
# 1. Palakihin ang mga mapagkukunan
# I-update ang SKU sa main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Paganahin ang monitoring ng Application Insights
azd monitor --overview

# 3. Suriin ang mga log ng application sa Azure
az webapp log tail --name myapp --resource-group myrg
# o para sa Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Ipatupad ang caching
# Magdagdag ng Redis cache sa iyong imprastruktura
```

## 🛠️ Mga Kasangkapan at Utos para sa Pag-troubleshoot

### Debug Commands
```bash
# Komprehensibong pag-debug
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Suriin ang bersyon ng azd
azd version

# Tingnan ang kasalukuyang konfigurasyon
azd config show

# Subukan ang koneksyon
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# Mga log ng aplikasyon gamit ang Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Subaybayan ang aplikasyon gamit ang azd
azd monitor --logs
azd monitor --live

# Mga log ng resource ng Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Mga log ng container (para sa Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# Ilista ang lahat ng mga mapagkukunan
az resource list --resource-group myrg -o table

# Suriin ang katayuan ng mapagkukunan
az webapp show --name myapp --resource-group myrg --query state

# Pagsusuri ng network
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Pagkuha ng Karagdagang Tulong

### Kailan i-eskalate
- Patuloy ang mga isyu sa autentikasyon kahit sinubukan na ang lahat ng solusyon
- Mga problema sa imprastruktura na may kinalaman sa mga serbisyo ng Azure
- Mga isyu na may kinalaman sa billing o subscription
- Mga alalahanin o insidente sa seguridad

### Mga Channel ng Suporta
```bash
# 1. Suriin ang Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Gumawa ng ticket sa suporta ng Azure
# Pumunta sa: https://portal.azure.com -> Tulong + suporta

# 3. Mga mapagkukunan ng komunidad
# - Stack Overflow: tag na azure-developer-cli
# - Mga Isyu sa GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Impormasyon na Dapat Kolektahin
Bago makipag-ugnayan sa suporta, kolektahin ang:
- `azd version` output
- `azd config show` output
- `azd show` output (kasalukuyang status ng deployment)
- Mga mensahe ng error (buong teksto)
- Mga hakbang para ma-reproduce ang isyu
- Detalye ng kapaligiran (`azd env get-values`)
- Timeline kung kailan nagsimula ang isyu

### Script para sa Pangangalap ng Log
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

# Gumamit ng dry-run na mga pag-deploy
azd provision --preview
```

### Pag-set up ng Monitoring
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

# Kuwarteral na pagsusuri ng seguridad
az security assessment list --resource-group myrg
```

## Mga Kaugnay na Mapagkukunan

- [Gabay sa Pag-debug](debugging.md) - Advanced debugging techniques
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastructure troubleshooting
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Resource planning guidance
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Service tier recommendations

---

**Payo**: I-bookmark ang gabay na ito at balik-balikan kapag nakatagpo ka ng mga isyu. Karamihan sa mga problema ay dati nang na-encounter at may umiiral na mga solusyon!

---

**Nawigasyon**
- **Naunang Aralin**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Susunod na Aralin**: [Gabay sa Pag-debug](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang awtomatikong mga pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->