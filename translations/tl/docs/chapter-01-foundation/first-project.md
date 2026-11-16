# Ang Iyong Unang Proyekto - Hands-On Tutorial

**Navigation ng Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilis na Pagsisimula
- **⬅️ Nakaraan**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Dalhin ang Iyong Sariling App](bring-your-own-app.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-Unang Pag-unlad](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Maligayang pagdating sa iyong unang Azure Developer CLI na proyekto! Magde-deploy ka ng isang todo application na may React frontend, Node.js API, at Azure Cosmos DB. Pinananatili ng template ang makasaysayang pangalan na `todo-nodejs-mongo`; ang kasalukuyang imprastruktura nito ay gumagamit ng Cosmos DB para sa NoSQL, kaya inspeksiyunin ang na-download na README at `infra/` sa halip na hulaan ang database API mula sa pangalan.

> Sinuri laban sa `azd 1.37.2` at ang pampublikong template noong Nobyembre 2026. Ang mga halimbawa sa ibaba ay gumagamit ng Bash; ang pagkuha ng JSON ay nangangailangan din ng `jq`. May mga singil ang mga deployment sa Azure at hindi isinagawa sa panahon ng pagsusuring ito.

## Mga Layunin sa Pag-aaral

Sa pagtapos ng tutorial na ito, magagawa mo:
- Maging bihasa sa azd project initialization workflow gamit ang mga template
- Maunawaan ang estruktura ng Azure Developer CLI project at mga configuration file
- Isagawa ang kumpletong deployment ng aplikasyon sa Azure kasama ang pagpro-provision ng imprastruktura
- Magpatupad ng mga update sa aplikasyon at mga estratehiya sa muling pag-deploy
- Pamahalaan ang maramihang environment para sa development at staging
- Mag-apply ng resource cleanup at mga kasanayan sa pamamahala ng gastos

## Mga Kinalabasan ng Pagkatuto

Sa pagtatapos, magagawa mo:
- Mag-initialize at mag-configure ng azd projects mula sa mga template nang mag-isa
- Mag-navigate at mag-modify ng mga estruktura ng azd project nang epektibo
- Mag-deploy ng full-stack applications sa Azure gamit ang isang command lang
- Mag-troubleshoot ng mga karaniwang isyu sa deployment at problema sa authentication
- Pamahalaan ang maramihang Azure environment para sa iba't ibang yugto ng deployment
- Magpatupad ng continuous deployment workflows para sa mga update ng aplikasyon

## Pagsisimula

### Checklist ng Mga Kinakailangan
- ✅ Nakainstall ang Azure Developer CLI ([Installation Guide](installation.md))
- ✅ Nakumpleto ang AZD authentication gamit ang `azd auth login`
- ✅ Nakainstall ang Git sa iyong sistema
- ✅ Node.js 22 LTS (o suportadong bersyon na kinakailangan ng na-download na template)
- ✅ Visual Studio Code (inirerekomenda)

Bago magpatuloy, patakbuhin ang setup validator mula sa root ng repository:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Beripikahin ang Iyong Setup
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Beripikahin ang opsyonal na Azure CLI authentication

```bash
az account show
```

### Tingnan ang bersyon ng Node.js
```bash
node --version
```

## Hakbang 1: Pumili at Mag-initialize ng Template

Magsimula tayo sa isang popular na todo application template na may React frontend at Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Ano ang Nangyari?
- Na-download ang code ng template sa iyong lokal na direktoryo
- Nilikha ang isang `azure.yaml` file na may mga serbisyo na naka-declare
- Nai-set up ang infrastructure code sa `infra/` na direktoryo
- Nilikha ang environment configuration

## Hakbang 2: Siyasatin ang Estruktura ng Proyekto

Tingnan natin kung ano ang nilikha ng azd para sa atin:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Makikita mo ang:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Mga Key File na Dapat Maunawaan

**azure.yaml** - Puso ng iyong azd project:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Pagpapakahulugan ng imprastruktura:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Hakbang 3: I-customize ang Iyong Proyekto (Opsyonal)

Bago mag-deploy, maaari mong i-customize ang aplikasyon:

### Baguhin ang Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Gawa ng simpleng pagbabago:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### I-configure ang Environment Variables
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Ang dalawang custom na halagang ito ay nagpapakita lamang ng lokal na imbakan. Hindi kinokonsumo ng stock template ang `WEBSITE_TITLE` o `API_VERSION`, kaya hindi nito binabago ang app. Ang tahasang pag-edit sa pinagmulan sa itaas ay nagbabago ng ipinapakitang pamagat.

## Hakbang 4: Mag-deploy sa Azure

Ngayon ang kapana-panabik na bahagi - i-deploy ang lahat sa Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Ano ang Nangyayari Habang Nagde-deploy?

Ang workflow ay nagpo-provision ng imprastruktura at nagpa-package/nagde-deploy ng code. Ang eksaktong pagkakasunod-sunod ay maaaring i-customize sa pamamagitan ng `workflows.up` sa `azure.yaml`; tinutukoy ng template na ito ang provision bago ang deploy. Huwag umasa sa iisang pangkalahatang ayos ng mga yugto para sa bawat template.

### Inaasahang Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Hakbang 5: Subukan ang Iyong Aplikasyon

### I-access ang Iyong Aplikasyon
I-click ang URL na ibinigay sa deployment output, o kunin ito anumang oras:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Subukan ang Todo App
1. **Magdagdag ng todo item** - I-click ang "Add Todo" at maglagay ng gawain
2. **Markahan bilang kumpleto** - Tiyakin ang mga tapos na item
3. **Tanggalin ang mga item** - Alisin ang mga todo na hindi na kailangan

### Subaybayan ang Iyong Aplikasyon
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Beripikahin ang Iyong Deployment

Bago magpatuloy, dumaan sa mabilis na checklist na ito upang tiyakin na gumagana talaga ang lahat—huwag basta assume na ang "deploy succeeded" ay ibig sabihin "gumagana ang app":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Napatunayan ang Deployment kapag:**
- ✅ Naglista ang `azd show` ng maabot na endpoint URL
- ✅ Nagbukas ang URL sa iyong browser nang walang error
- ✅ Gumagana ang mga pangunahing tampok (magdagdag/magtapos/magtanggal ng todo)
- ✅ Ipinapakita ng `azd monitor --logs` ang mga dumating na request nang walang hindi inaasahang error

Kung may nabigong tseke, pumunta sa [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/README.md).

## Hakbang 6: Gumawa ng Mga Pagbabago at Mag-redeploy

Gagawa tayo ng pagbabago at tingnan kung gaano kadali ang mag-update:

### Baguhin ang API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Magdagdag ng custom na response header:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Mag-deploy Lang ng Mga Pagbabago sa Code
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Hakbang 7: Pamahalaan ang Maramihang Environment

Gumawa ng staging environment para subukan ang mga pagbabago bago ang produksyon:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Paghahambing ng Environment
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Hakbang 8: Linisin ang Mga Resources

Kapag tapos ka nang mag-eksperimento, linisin upang maiwasan ang patuloy na singil:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassikong App vs. AI-Powered App: Parehong Workflow

Kakatapos mo lang i-deploy ang isang tradisyonal na web application. Pero paano kung gusto mong mag-deploy ng AI-powered app—halimbawa, isang chat application na sinusuportahan ng Microsoft Foundry Models?

Magandang balita: **pareho ang workflow.**

| Hakbang | Klassikong Todo App | AI Chat App |
|------|-----------------|-------------|
| Mag-initialize (walang laman na direktoryo) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Mag-authenticate | `azd auth login` | `azd auth login` |
| Mag-deploy | `azd up` | `azd up` |
| Mag-monitor | `azd monitor` | `azd monitor` |
| Maglinis | `azd down --force --purge` | `azd down --force --purge` |

Pareho ang mga lifecycle command, ngunit iba ang mga prerequisito. Ang AI template ay maaaring mangailangan ng access sa modelo, regional quota, pagsipsip ng datos, at karagdagang configuration. Basahin ang README bago mag-deploy; hindi maaaring magbigay ng nawawalang pahintulot o quota ang `azd up`.

Ito ang pangunahing prinsipyo ng azd: **isang workflow, anumang workload.** Ang mga kasanayan na na-practice mo sa tutorial na ito—pag-initialize, deployment, monitoring, muling deployment, at paglilinis—ay pantay ang bisa para sa mga AI application at agent.

---

## Ano ang Iyong Natutunan

Binabati kita! Matagumpay mong:
- ✅ Na-initialize ang azd project mula sa isang template
- ✅ Nasiyasat ang estruktura ng proyekto at mga pangunahing file
- ✅ Na-deploy ang full-stack application sa Azure
- ✅ Nagsagawa ng mga pagbabago sa code at muling na-deploy
- ✅ Namahala ng maramihang environment
- ✅ Nilinis ang mga resource

## 🎯 Mga Ehersisyo para sa Pagpapatunay ng Kasanayan

### Ehersisyo 1: Mag-deploy ng Ibang Template (15 minuto)
**Layunin**: Ipakita ang kasanayan sa azd init at deployment workflow

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Nag-deploy ang aplikasyon nang walang error
- [ ] Maaaring i-access ang URL ng aplikasyon sa browser
- [ ] Gumagana nang tama ang aplikasyon (magdagdag/magtanggal ng todo)
- [ ] Matagumpay na nalinis ang lahat ng resource

### Ehersisyo 2: I-customize ang Configuration (20 minuto)
**Layunin**: Magpraktis ng lokal na pag-iimbak ng halaga ng environment nang hindi nagkakamali sa runtime configuration

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Matagumpay na nalikha ang custom na environment
- [ ] Nakasaayos at nakakakuha ng mga environment variable
- [ ] `azd env get-value APP_TITLE` ay nagpapalabas ng `My Custom Todo App`
- [ ] Naiipaliwanag kung bakit hindi binabago ng mga halagang ito ang stock app maliban kung ginagamit sa code/imprastruktura

### Ehersisyo 3: Multi-Environment Workflow (25 minuto)
**Layunin**: Maging bihasa sa pamamahala ng environment at estratehiya ng deployment

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Dalawang environment ang nalikha na may magkaibang configuration
- [ ] Parehong matagumpay na na-deploy ang mga environment
- [ ] Maaaring magpalipat-lipat sa pagitan ng mga environment gamit ang `azd env select`
- [ ] Nagkakaiba ang mga environment variable sa bawat environment
- [ ] Matagumpay na nalinis ang parehong environment

## 📊 Ang Iyong Progreso

**Oras na Ginugol**: ~60-90 minuto  
**Mga Nakuhang Kasanayan**:
- ✅ Pagsisimula ng proyekto gamit ang template
- ✅ Pagpro-provision ng Azure resource
- ✅ Mga workflow ng deployment ng aplikasyon
- ✅ Pamamahala ng environment
- ✅ Pamamahala ng configuration
- ✅ Paglilinis ng resource at pamamahala ng gastos

**Susunod na Antas**: Handa ka na para sa [Configuration Guide](../chapter-03-configuration/configuration.md) upang matutunan ang mga advanced na pattern ng configuration!

## Pag-troubleshoot ng Mga Karaniwang Isyu

### Mga Error sa Authentication
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Mga Pagkabigo sa Deployment
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Mga Konflikto sa Pangalan ng Resource
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Mga Isyu sa Port/Network
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Mga Susunod na Hakbang

Ngayong natapos mo na ang iyong unang proyekto, siyasatin ang mga advanced na paksa na ito:

### 1. I-customize ang Imprastruktura
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Magdagdag ng database infrastructure](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. I-set Up ang CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Kumpletong CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasyon ng pipeline

### 3. Pinakamahusay na Praktis sa Produksyon
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, performance, at monitoring

### 4. Siyasatin ang Higit pang Mga Template
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Karagdagang Mga Mapagkukunan

### Mga Materyales sa Pag-aaral
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunidad at Suporta
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mga Template at Halimbawa
- [Opisyal na Template Gallery](https://azure.github.io/awesome-azd/)
- [Kontribusyon mula sa Komunidad ng Template](https://github.com/Azure/awesome-azd)
- [Pinagmulan ng Todo Template](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Binabati kita sa pagtapos ng iyong unang azd project!** Handa ka nang gumawa at mag-deploy ng mga kahanga-hangang aplikasyon sa Azure nang may kumpiyansa.

---

**Navigation ng Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilis na Pagsisimula
- **⬅️ Nakaraan**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Dalhin ang Iyong Sariling App](bring-your-own-app.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-Unang Pag-unlad](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->