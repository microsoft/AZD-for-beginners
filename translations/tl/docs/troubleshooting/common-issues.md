# Karaniwang Isyu at Solusyon

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-troubleshoot at Pag-debug
- **⬅️ Nakaraang Kabanata**: [Kabanata 6: Mga Pre-flight Check](../pre-deployment/preflight-checks.md)
- **➡️ Susunod**: [Gabay sa Pag-debug](debugging.md)
- **🚀 Susunod na Kabanata**: [Kabanata 8: Mga Pattern para sa Produksyon at Enterprise](../microsoft-foundry/production-ai-practices.md)

## Panimula

Ang komprehensibong gabay na ito sa pag-troubleshoot ay sumasaklaw sa mga madalas na nararanasang isyu kapag ginagamit ang Azure Developer CLI. Matutunan kung paano mag-diagnose, mag-troubleshoot, at magresolba ng mga karaniwang problema sa authentication, deployment, provisioning ng imprastraktura, at configuration ng aplikasyon. Ang bawat isyu ay may detalyadong sintomas, ugat ng problema, at hakbang-hakbang na solusyon.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magiging bihasa sa mga teknik sa pag-diagnose ng mga isyu sa Azure Developer CLI
- Maiintindihan ang mga karaniwang problema sa authentication at permiso at ang kanilang mga solusyon
- Malulutas ang mga pagkabigo sa deployment, mga error sa provisioning ng imprastraktura, at mga isyu sa configuration
- Makakapagpatupad ng mga proaktibong estratehiya sa pag-monitor at pag-debug
- Makakapag-apply ng sistematikong pamamaraan sa pag-troubleshoot ng mga komplikadong problema
- Makakapag-configure ng tamang logging at monitoring upang maiwasan ang mga isyu sa hinaharap

## Mga Resulta ng Pagkatuto

Pagkatapos makumpleto, magagawa mong:
- Mag-diagnose ng mga isyu sa Azure Developer CLI gamit ang mga built-in na diagnostic tool
- Malutas ang mga problema sa authentication, subscription, at permiso nang mag-isa
- Mag-troubleshoot ng mga pagkabigo sa deployment at mga error sa provisioning ng imprastraktura nang epektibo
- Mag-debug ng mga isyu sa configuration ng aplikasyon at mga problemang partikular sa kapaligiran
- Magpatupad ng monitoring at alerting upang proaktibong matukoy ang mga potensyal na isyu
- Mag-apply ng mga pinakamahusay na kasanayan sa logging, pag-debug, at mga workflow sa pagresolba ng problema

## Mabilisang Diagnostic

Bago sumabak sa mga partikular na isyu, patakbuhin ang mga command na ito upang makakuha ng diagnostic na impormasyon:

```bash
# Suriin ang bersyon at kalusugan ng azd
azd version
azd config list

# Tiyakin ang pagpapatunay sa Azure
az account show
az account list

# Suriin ang kasalukuyang kapaligiran
azd env show
azd env get-values

# Paganahin ang pag-log ng debug
export AZD_DEBUG=true
azd <command> --debug
```

## Mga Isyu sa Authentication

### Isyu: "Hindi makakuha ng access token"
**Mga Sintomas:**
- Nabibigo ang `azd up` na may mga error sa authentication
- Ang mga command ay nagbabalik ng "unauthorized" o "access denied"

**Mga Solusyon:**
```bash
# 1. Muling mag-authenticate gamit ang Azure CLI
az login
az account show

# 2. I-clear ang naka-cache na mga kredensyal
az account clear
az login

# 3. Gumamit ng device code flow (para sa mga sistemang walang GUI)
az login --use-device-code

# 4. Itakda ang tiyak na subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Isyu: "Kulang sa pribilehiyo" sa panahon ng deployment
**Mga Sintomas:**
- Nabibigo ang deployment na may mga error sa permiso
- Hindi makalikha ng ilang Azure resources

**Mga Solusyon:**
```bash
# 1. Suriin ang iyong mga Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Tiyakin na mayroon kang kinakailangang mga role
# - Contributor (para sa paglikha ng mga resource)
# - User Access Administrator (para sa mga role assignments)

# 3. Makipag-ugnayan sa iyong Azure administrator para sa tamang mga pahintulot
```

### Isyu: Mga problema sa multi-tenant authentication
**Mga Solusyon:**
```bash
# 1. Mag-login gamit ang partikular na tenant
az login --tenant "your-tenant-id"

# 2. Itakda ang tenant sa configuration
azd config set auth.tenantId "your-tenant-id"

# 3. I-clear ang cache ng tenant kung magpapalit ng tenant
az account clear
```

## 🏗️ Mga Error sa Provisioning ng Imprastraktura

### Isyu: Mga salungatan sa pangalan ng resource
**Mga Sintomas:**
- Mga error na "The resource name already exists"
- Nabibigo ang deployment sa panahon ng paglikha ng resource

**Mga Solusyon:**
```bash
# 1. Gumamit ng natatanging mga pangalan ng mapagkukunan gamit ang mga token
# Sa iyong Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Palitan ang pangalan ng kapaligiran
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Linisin ang mga umiiral na mapagkukunan
azd down --force --purge
```

### Isyu: Hindi available ang lokasyon/rehiyon
**Mga Sintomas:**
- "The location 'xyz' is not available for resource type"
- Hindi available ang ilang SKUs sa napiling rehiyon

**Mga Solusyon:**
```bash
# 1. Suriin ang mga magagamit na lokasyon para sa mga uri ng mapagkukunan
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gamitin ang mga karaniwang magagamit na rehiyon
azd config set defaults.location eastus2
# o
azd env set AZURE_LOCATION eastus2

# 3. Suriin ang pagkakaroon ng serbisyo ayon sa rehiyon
# Bisitahin: https://azure.microsoft.com/global-infrastructure/services/
```

### Isyu: Mga error sa quota exceeded
**Mga Sintomas:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Mga Solusyon:**
```bash
# 1. Suriin ang kasalukuyang paggamit ng quota
az vm list-usage --location eastus2 -o table

# 2. Humiling ng pagtaas ng quota sa pamamagitan ng Azure portal
# Pumunta sa: Subscriptions > Usage + quotas

# 3. Gumamit ng mas maliliit na SKUs para sa development
# Sa main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Linisin ang mga hindi nagagamit na resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Isyu: Mga error sa Bicep template
**Mga Sintomas:**
- Mga pagkabigo sa template validation
- Mga syntax error sa mga Bicep file

**Mga Solusyon:**
```bash
# 1. I-validate ang syntax ng Bicep
az bicep build --file infra/main.bicep

# 2. Gamitin ang Bicep linter
az bicep lint --file infra/main.bicep

# 3. Suriin ang syntax ng parameter file
cat infra/main.parameters.json | jq '.'

# 4. I-preview ang mga pagbabago sa deployment
azd provision --preview
```

## 🚀 Mga Pagkabigo sa Deployment

### Isyu: Mga pagkabigo sa build
**Mga Sintomas:**
- Nabibigo ang aplikasyon na mag-build sa panahon ng deployment
- Mga error sa pag-install ng package

**Mga Solusyon:**
```bash
# 1. Suriin ang mga log ng build
azd logs --service web
azd deploy --service web --debug

# 2. Subukan ang build nang lokal
cd src/web
npm install
npm run build

# 3. Suriin ang pagiging tugma ng bersyon ng Node.js/Python
node --version  # Dapat tumugma sa mga setting ng azure.yaml
python --version

# 4. Linisin ang build cache
rm -rf node_modules package-lock.json
npm install

# 5. Suriin ang Dockerfile kung gumagamit ng mga container
docker build -t test-image .
docker run --rm test-image
```

### Isyu: Mga pagkabigo sa container deployment
**Mga Sintomas:**
- Nabibigo ang mga container app na magsimula
- Mga error sa image pull

**Mga Solusyon:**
```bash
# 1. Subukan ang Docker build nang lokal
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Suriin ang mga log ng container
azd logs --service api --follow

# 3. Tiyakin ang access sa container registry
az acr login --name myregistry

# 4. Suriin ang configuration ng container app
az containerapp show --name my-app --resource-group my-rg
```

### Isyu: Mga pagkabigo sa koneksyon sa database
**Mga Sintomas:**
- Hindi makakonekta ang aplikasyon sa database
- Mga error sa connection timeout

**Mga Solusyon:**
```bash
# 1. Suriin ang mga patakaran ng firewall ng database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Subukan ang koneksyon mula sa aplikasyon
# Idagdag pansamantala sa iyong app:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Tiyakin ang tamang format ng connection string
azd env get-values | grep DATABASE

# 4. Suriin ang status ng server ng database
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Mga Isyu sa Configuration

### Isyu: Hindi gumagana ang mga environment variable
**Mga Sintomas:**
- Hindi mabasa ng app ang mga configuration value
- Mukhang walang laman ang mga environment variable

**Mga Solusyon:**
```bash
# 1. Tiyakin na ang mga environment variable ay nakatakda
azd env get-values
azd env get DATABASE_URL

# 2. Suriin ang mga pangalan ng variable sa azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. I-restart ang application
azd deploy --service web

# 4. Suriin ang configuration ng app service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Isyu: Mga problema sa SSL/TLS certificate
**Mga Sintomas:**
- Hindi gumagana ang HTTPS
- Mga error sa certificate validation

**Mga Solusyon:**
```bash
# 1. Suriin ang status ng SSL certificate
az webapp config ssl list --resource-group myrg

# 2. Paganahin ang HTTPS lamang
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Magdagdag ng custom na domain (kung kinakailangan)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isyu: Mga problema sa CORS configuration
**Mga Sintomas:**
- Hindi makatawag ang frontend sa API
- Na-block ang cross-origin request

**Mga Solusyon:**
```bash
# 1. I-configure ang CORS para sa App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. I-update ang API upang hawakan ang CORS
# Sa Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Suriin kung tumatakbo sa tamang mga URL
azd show
```

## 🌍 Mga Isyu sa Pamamahala ng Kapaligiran

### Isyu: Mga problema sa paglipat ng kapaligiran
**Mga Sintomas:**
- Mali ang ginagamit na kapaligiran
- Hindi maayos na nagbabago ang configuration

**Mga Solusyon:**
```bash
# 1. Ilista ang lahat ng mga kapaligiran
azd env list

# 2. Piliin nang tahasan ang kapaligiran
azd env select production

# 3. Tiyakin ang kasalukuyang kapaligiran
azd env show

# 4. Lumikha ng bagong kapaligiran kung nasira
azd env new production-new
azd env select production-new
```

### Isyu: Korapsyon ng kapaligiran
**Mga Sintomas:**
- Ipinapakita ng kapaligiran ang invalid na estado
- Hindi tumutugma ang mga resource sa configuration

**Mga Solusyon:**
```bash
# 1. I-refresh ang estado ng kapaligiran
azd env refresh

# 2. I-reset ang configuration ng kapaligiran
azd env new production-reset
# Kopyahin ang kinakailangang mga variable ng kapaligiran
azd env set DATABASE_URL "your-value"

# 3. I-import ang umiiral na mga resources (kung posible)
# Manu-manong i-update ang .azure/production/config.json gamit ang mga resource ID
```

## 🔍 Mga Isyu sa Performance

### Isyu: Mabagal na deployment times
**Mga Sintomas:**
- Matagal ang mga deployment
- Mga timeout sa panahon ng deployment

**Mga Solusyon:**
```bash
# 1. Paganahin ang parallel deployment
azd config set deploy.parallelism 5

# 2. Gumamit ng incremental deployments
azd deploy --incremental

# 3. I-optimize ang proseso ng build
# Sa package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Suriin ang mga lokasyon ng resource (gamitin ang parehong rehiyon)
azd config set defaults.location eastus2
```

### Isyu: Mga problema sa performance ng aplikasyon
**Mga Sintomas:**
- Mabagal na response times
- Mataas na paggamit ng resource

**Mga Solusyon:**
```bash
# 1. Palakihin ang mga mapagkukunan
# I-update ang SKU sa main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Paganahin ang Application Insights monitoring
azd monitor

# 3. Suriin ang mga log ng aplikasyon para sa mga bottleneck
azd logs --service api --follow

# 4. Ipatupad ang caching
# Magdagdag ng Redis cache sa iyong imprastraktura
```

## 🛠️ Mga Tool at Command sa Pag-troubleshoot

### Mga Debug Command
```bash
# Komprehensibong pag-debug
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Suriin ang impormasyon ng sistema
azd info

# I-validate ang konfigurasyon
azd config validate

# Subukan ang koneksyon
curl -v https://myapp.azurewebsites.net/health
```

### Pagsusuri ng Log
```bash
# Mga log ng aplikasyon
azd logs --service web --follow
azd logs --service api --since 1h

# Mga log ng mapagkukunan ng Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Mga log ng lalagyan (para sa Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Pagsisiyasat ng Resource
```bash
# Ilista ang lahat ng mga mapagkukunan
az resource list --resource-group myrg -o table

# Suriin ang status ng mapagkukunan
az webapp show --name myapp --resource-group myrg --query state

# Mga diagnostic ng network
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Pagkuha ng Karagdagang Tulong

### Kailan Mag-eskalate
- Patuloy ang mga isyu sa authentication kahit sinubukan na ang lahat ng solusyon
- Mga problema sa imprastraktura na may kaugnayan sa mga serbisyo ng Azure
- Mga isyu sa billing o subscription
- Mga alalahanin o insidente sa seguridad

### Mga Channel ng Suporta
```bash
# 1. Suriin ang Kalusugan ng Serbisyo ng Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Gumawa ng tiket ng suporta sa Azure
# Pumunta sa: https://portal.azure.com -> Tulong + suporta

# 3. Mga mapagkukunan ng komunidad
# - Stack Overflow: azure-developer-cli tag
# - Mga Isyu sa GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Impormasyon na Dapat Kolektahin
Bago makipag-ugnayan sa suporta, kolektahin ang:
- Output ng `azd version`
- Output ng `azd info`
- Mga mensahe ng error (buong teksto)
- Mga hakbang upang maulit ang isyu
- Mga detalye ng kapaligiran (`azd env show`)
- Timeline kung kailan nagsimula ang isyu

### Script sa Pagkolekta ng Log
```bash
#!/bin/bash
# mangolekta-ng-debug-info.sh

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
# 1. I-validate ang pagpapatotoo
az account show

# 2. Suriin ang mga quota at limitasyon
az vm list-usage --location eastus2

# 3. I-validate ang mga template
az bicep build --file infra/main.bicep

# 4. Subukan muna nang lokal
npm run build
npm run test

# 5. Gumamit ng dry-run na mga deployment
azd provision --preview
```

### Setup ng Monitoring
```bash
# Paganahin ang Application Insights
# Idagdag sa main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# I-set up ang mga alerto
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regular na Maintenance
```bash
# Lingguhang pagsusuri ng kalusugan
./scripts/health-check.sh

# Buwanang pagsusuri ng gastos
az consumption usage list --billing-period-name 202401

# Quarterly pagsusuri ng seguridad
az security assessment list --resource-group myrg
```

## Kaugnay na Mga Mapagkukunan

- [Gabay sa Pag-debug](debugging.md) - Mga advanced na teknik sa pag-debug
- [Provisioning Resources](../deployment/provisioning.md) - Pag-troubleshoot ng imprastraktura
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Gabay sa pagpaplano ng resource
- [SKU Selection](../pre-deployment/sku-selection.md) - Mga rekomendasyon sa service tier

---

**Tip**: I-bookmark ang gabay na ito at balikan ito tuwing makakaranas ng mga isyu. Karamihan sa mga problema ay nakita na dati at may mga nakahandang solusyon!

---

**Pag-navigate**
- **Nakaraang Aralin**: [Provisioning Resources](../deployment/provisioning.md)
- **Susunod na Aralin**: [Gabay sa Pag-debug](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->