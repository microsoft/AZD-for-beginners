# Ang Iyong Unang Proyekto - Praktikal na Tutorial

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Chapter 1 - Foundation & Quick Start
- **⬅️ Nakaraan**: [Installation & Setup](installation.md)
- **➡️ Susunod**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Maligayang pagdating sa iyong unang Azure Developer CLI na proyekto! Ang komprehensibong praktikal na tutorial na ito ay nagbibigay ng kumpletong walkthrough ng paglikha, pag-deploy, at pamamahala ng isang full-stack na aplikasyon sa Azure gamit ang azd. Gagamit ka ng totoong todo application na may kasamang React frontend, Node.js API backend, at MongoDB database.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng tutorial na ito, ikaw ay:
- Mahuhusay sa azd project initialization workflow gamit ang mga template
- Mauunawaan ang Azure Developer CLI project structure at mga configuration file
- Makakapagpatupad ng kumpletong deployment ng aplikasyon sa Azure na may provisioning ng imprastruktura
- Makakapag-implementa ng mga estratehiya para sa pag-update at muling pag-deploy ng aplikasyon
- Makakapamahala ng maramihang kapaligiran para sa development at staging
- Makakapagpatupad ng mga kasanayan sa paglilinis ng resource at pamamahala ng gastos

## Mga Kinalabasan ng Pagkatuto

Sa pagkumpleto, magagawa mong:
- I-initialize at i-configure ang mga azd project mula sa mga template nang mag-isa
- Mag-navigate at mag-modify ng istruktura ng azd project nang epektibo
- Mag-deploy ng full-stack na mga aplikasyon sa Azure gamit ang iisang mga utos
- Mag-troubleshoot ng mga karaniwang isyu sa deployment at mga problema sa authentication
- Pamahalaan ang maramihang Azure environments para sa iba't ibang yugto ng deployment
- Mag-implementa ng continuous deployment workflows para sa mga update ng aplikasyon

## Pagsisimula

### Listahan ng Mga Kinakailangan
- ✅ Azure Developer CLI installed ([Gabay sa Pag-install](installation.md))
- ✅ Azure CLI naka-install at naka-authenticate
- ✅ Git naka-install sa iyong system
- ✅ Node.js 16+ (para sa tutorial na ito)
- ✅ Visual Studio Code (inirerekomenda)

### Suriin ang Iyong Setup
```bash
# Suriin ang pag-install ng azd
azd version
```
### Suriin ang Pagpapatunay ng Azure

```bash
az account show
```

### Suriin ang bersyon ng Node.js
```bash
node --version
```

## Hakbang 1: Piliin at I-initialize ang isang Template

Magsimula tayo sa isang kilalang template ng todo application na may kasamang React frontend at Node.js API backend.

```bash
# Mag-browse ng mga magagamit na template
azd template list

# I-initialize ang template ng todo app
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sundin ang mga prompt:
# - Ilagay ang pangalan ng environment: "dev"
# - Piliin ang subscription (kung mayroon kang higit sa isa)
# - Piliin ang rehiyon: "East US 2" (o ang iyong gustong rehiyon)
```

### Ano ang Nangyari?
- Na-download ang template code sa iyong lokal na direktoryo
- Nilikha ang `azure.yaml` na file na may mga depinisyon ng serbisyo
- Naitakda ang kodigo ng imprastruktura sa `infra/` na direktoryo
- Nilikha ang konfigurasyon ng kapaligiran

## Hakbang 2: Suriin ang Istruktura ng Proyekto

Suriin natin ang mga nilikha ng azd para sa atin:

```bash
# Tingnan ang istruktura ng proyekto
tree /f   # Windows
# o
find . -type f | head -20   # macOS/Linux
```

Makikita mo ang:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Pangunahing Mga File na Dapat Maunawaan

**azure.yaml** - Ang puso ng iyong azd na proyekto:
```bash
# Tingnan ang konfigurasyon ng proyekto
cat azure.yaml
```

**infra/main.bicep** - Depinisyon ng imprastruktura:
```bash
# Tingnan ang kodigo ng imprastruktura
head -30 infra/main.bicep
```

## Hakbang 3: I-customize ang Iyong Proyekto (Opsyonal)

Bago mag-deploy, maaari mong i-customize ang aplikasyon:

### Baguhin ang Frontend
```bash
# Buksan ang komponent ng React app
code src/web/src/App.tsx
```

Gumawa ng simpleng pagbabago:
```typescript
// Hanapin ang pamagat at palitan ito
<h1>My Awesome Todo App</h1>
```

### I-configure ang Mga Environment Variable
```bash
# Itakda ang mga pasadyang variable ng kapaligiran
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tingnan ang lahat ng variable ng kapaligiran
azd env get-values
```

## Hakbang 4: Mag-deploy sa Azure

Ngayon ang kapana-panabik na bahagi - i-deploy ang lahat sa Azure!

```bash
# I-deploy ang imprastruktura at aplikasyon
azd up

# Gagawin ng utos na ito:
# 1. Maglalaan ng mga resource sa Azure (App Service, Cosmos DB, atbp.)
# 2. I-build ang iyong aplikasyon
# 3. I-deploy sa mga inilaan na resource
# 4. Ipakita ang URL ng aplikasyon
```

### Ano ang Nangyayari Habang Nagde-deploy?

Isinasagawa ng utos na `azd up` ang mga sumusunod na hakbang:
1. **Provision** (`azd provision`) - Lumilikha ng mga resource sa Azure
2. **Package** - Binubuo ang iyong application code
3. **Deploy** (`azd deploy`) - Nagde-deploy ng code sa mga Azure resource

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

### Pag-access sa Iyong Aplikasyon
I-click ang URL na ibinigay sa deployment output, o kunin ito anumang oras:
```bash
# Kunin ang mga endpoint ng aplikasyon
azd show

# Buksan ang aplikasyon sa iyong browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Subukan ang Todo App
1. **Add a todo item** - I-click ang "Add Todo" at maglagay ng task
2. **Mark as complete** - Markahan bilang kumpleto - I-check ang mga natapos na item
3. **Delete items** - Tanggalin ang mga item - Alisin ang mga todo na hindi mo na kailangan

### Subaybayan ang Iyong Aplikasyon
```bash
# Buksan ang Azure portal para sa iyong mga resource
azd monitor

# Tingnan ang mga log ng aplikasyon
azd monitor --logs

# Tingnan ang mga sukatan sa real-time
azd monitor --live
```

## Hakbang 6: Gumawa ng Mga Pagbabago at Muling I-deploy

Gumawa tayo ng pagbabago at tingnan kung gaano kadali mag-update:

### Baguhin ang API
```bash
# I-edit ang code ng API
code src/api/src/routes/lists.js
```

Magdagdag ng custom na response header:
```javascript
// Hanapin ang tagapamahala ng ruta at idagdag:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### I-deploy Lamang ang Mga Pagbabago sa Code
```bash
# I-deploy lamang ang code ng aplikasyon (laktawan ang imprastruktura)
azd deploy

# Mas mabilis ito kaysa sa 'azd up' dahil umiiral na ang imprastruktura.
```

## Hakbang 7: Pamahalaan ang Maramihang Kapaligiran

Lumikha ng staging environment para subukan ang mga pagbabago bago ilagay sa production:

```bash
# Lumikha ng bagong staging na kapaligiran
azd env new staging

# I-deploy sa staging
azd up

# Lumipat pabalik sa dev na kapaligiran
azd env select dev

# Ilista ang lahat ng kapaligiran
azd env list
```

### Paghahambing ng Kapaligiran
```bash
# Tingnan ang kapaligiran ng pag-develop
azd env select dev
azd show

# Tingnan ang kapaligiran ng staging
azd env select staging
azd show
```

## Hakbang 8: Linisin ang Mga Resource

Kapag tapos ka na sa eksperimento, linisin ang mga ito upang maiwasan ang patuloy na singil:

```bash
# Tanggalin ang lahat ng mga resource ng Azure para sa kasalukuyang kapaligiran
azd down

# Piliting tanggalin nang walang kumpirmasyon at ganap na tanggalin ang mga soft-deleted na resource
azd down --force --purge

# Tanggalin ang partikular na kapaligiran
azd env select staging
azd down --force --purge
```

## Ang Iyong Natutunan

Binabati kita! Matagumpay mong:
- ✅ Na-initialize ang isang azd na proyekto mula sa template
- ✅ Nasuri ang istruktura ng proyekto at mga pangunahing file
- ✅ Na-deploy ang isang full-stack na aplikasyon sa Azure
- ✅ Gumawa ng pagbabago sa code at muling na-deploy
- ✅ Namahala ng maramihang kapaligiran
- ✅ Nilinis ang mga resource

## 🎯 Mga Ehersisyo sa Pagpapatunay ng Kasanayan

### Ehersisyo 1: Mag-deploy ng Ibang Template (15 minuto)
**Layunin**: Ipakita ang kasanayan sa azd init at workflow ng deployment

```bash
# Subukan ang stack na Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Suriin ang deployment
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Linisin
azd down --force --purge
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Application deploys without errors
- [ ] Can access application URL in browser
- [ ] Application functions correctly (add/remove todos)
- [ ] Successfully cleaned up all resources

### Ehersisyo 2: I-customize ang Konfigurasyon (20 minuto)
**Layunin**: Magpraktis ng pag-configure ng mga environment variable

```bash
cd my-first-azd-app

# Lumikha ng pasadyang kapaligiran
azd env new custom-config

# Itakda ang mga pasadyang variable
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Suriin ang mga variable
azd env get-values | grep APP_TITLE

# I-deploy gamit ang pasadyang konfigurasyon
azd up
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Custom environment created successfully
- [ ] Environment variables set and retrievable
- [ ] Application deploys with custom configuration
- [ ] Can verify custom settings in deployed app

### Ehersisyo 3: Workflow ng Maramihang Kapaligiran (25 minuto)
**Layunin**: Magsanay sa pamamahala ng kapaligiran at mga estratehiya ng deployment

```bash
# Gumawa ng dev na kapaligiran
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Tandaan ang dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Gumawa ng staging na kapaligiran
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Tandaan ang staging URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Ihambing ang mga kapaligiran
azd env list

# Subukan ang parehong mga kapaligiran
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Linisin ang parehong mga kapaligiran
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Two environments created with different configurations
- [ ] Both environments deployed successfully
- [ ] Can switch between environments using `azd env select`
- [ ] Environment variables differ between environments
- [ ] Successfully cleaned up both environments

## 📊 Ang Iyong Progreso

**Oras na Inilaan**: ~60-90 minuto  
**Mga Kasanayang Nakuha**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Susunod na Antas**: Handa ka na para sa [Gabay sa Konfigurasyon](configuration.md) upang matutunan ang mga advanced na pattern ng konfigurasyon!

## Pag-aayos ng Mga Karaniwang Isyu

### Mga Error sa Pagpapatunay
```bash
# Muling magpatunay ng pagkakakilanlan sa Azure
az login

# Suriin ang pag-access sa subscription
az account show
```

### Mga Pagkabigo sa Deployment
```bash
# Paganahin ang debug logging
export AZD_DEBUG=true
azd up --debug

# Tingnan ang mga log ng aplikasyon sa Azure
azd monitor --logs

# Para sa Container Apps, gamitin ang Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Mga Konflikto sa Pangalan ng Resource
```bash
# Gumamit ng natatanging pangalan para sa environment
azd env new dev-$(whoami)-$(date +%s)
```

### Mga Isyu sa Port/Network
```bash
# Suriin kung magagamit ang mga port
netstat -an | grep :3000
netstat -an | grep :3100
```

## Mga Susunod na Hakbang

Ngayon na natapos mo ang unang proyekto, tuklasin ang mga advanced na paksang ito:

### 1. I-customize ang Imprastruktura
- [Imprastruktura bilang Code](../chapter-04-infrastructure/provisioning.md)
- [Magdagdag ng mga database, storage, at iba pang serbisyo](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Mag-set up ng CI/CD
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) - Kumpletong CI/CD workflows
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Mga Pinakamainam na Gawi sa Produksyon
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, performance, at monitoring

### 4. Tuklasin ang Higit pang mga Template
```bash
# Mag-browse ng mga template ayon sa kategorya
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Subukan ang iba't ibang stack ng teknolohiya
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Karagdagang Mga Mapagkukunan

### Mga Materyales sa Pagkatuto
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunidad at Suporta
- [GitHub ng Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Komunidad ng Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mga Template at Halimbawa
- [Opisyal na Gallery ng Template](https://azure.github.io/awesome-azd/)
- [Mga Template ng Komunidad](https://github.com/Azure-Samples/azd-templates)
- [Mga Pattern para sa Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Binabati kita sa pagtatapos ng iyong unang azd na proyekto!** Handa ka na ngayong bumuo at mag-deploy ng mga kahanga-hangang aplikasyon sa Azure nang may kumpiyansa.

---

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Chapter 1 - Foundation & Quick Start
- **⬅️ Nakaraan**: [Installation & Setup](installation.md)
- **➡️ Susunod**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyo ng pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->