# Ang Iyong Unang Proyekto - Praktikal na Tutorial

**Pag-navigate ng Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Pagsisimula
- **⬅️ Nakaraang**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Konfigurasyon](configuration.md)
- **🚀 Next Chapter**: [Kabanata 2: Pag-unlad na Nakatuon sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Maligayang pagdating sa iyong unang Azure Developer CLI na proyekto! Ang komprehensibong praktikal na tutorial na ito ay nagbibigay ng kumpletong walkthrough ng paglikha, pag-deploy, at pamamahala ng isang full-stack na aplikasyon sa Azure gamit ang azd. Magtatrabaho ka sa isang totoong todo na aplikasyon na may React frontend, Node.js API backend, at MongoDB database.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng tutorial na ito, ikaw ay:
- Mamahusay sa workflow ng pag-initialize ng proyekto ng azd gamit ang mga template
- Mauunawaan ang istruktura ng proyekto ng Azure Developer CLI at ang mga configuration file
- Makakapagsagawa ng kumpletong deployment ng aplikasyon sa Azure na may provisioning ng imprastruktura
- Makakapagpatupad ng mga pag-update ng aplikasyon at mga estratehiya ng redeploy
- Makakapamahala ng maramihang mga environment para sa development at staging
- Makakapag-apply ng mga gawi sa paglilinis ng resources at pamamahala ng gastos

## Mga Kinalabasan ng Pagkatuto

Pagkaraan ng pagsasanay, magagawa mong:
- I-initialize at i-configure ang mga azd na proyekto mula sa mga template nang mag-isa
- Mag-navigate at mag-modify ng mga istruktura ng azd na proyekto nang epektibo
- Mag-deploy ng full-stack na mga aplikasyon sa Azure gamit ang iisang mga utos
- Mag-troubleshoot ng mga karaniwang isyu sa deployment at mga problema sa awtentikasyon
- Pamahalaan ang maramihang Azure environment para sa iba't ibang yugto ng deployment
- Magpatupad ng mga workflow ng continuous deployment para sa mga pag-update ng aplikasyon

## Pagsisimula

### Checklist ng Mga Kinakailangan
- ✅ Azure Developer CLI installed ([Gabay sa Pag-install](installation.md))
- ✅ Nakumpleto ang AZD awtentikasyon gamit ang `azd auth login`
- ✅ Naka-install ang Git sa iyong sistema
- ✅ Node.js 16+ (para sa tutorial na ito)
- ✅ Visual Studio Code (inirerekomenda)

Bago ka magpatuloy, patakbuhin ang setup validator mula sa ugat ng repositoryo:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### I-verify ang Iyong Setup
```bash
# Suriin ang pag-install ng azd
azd version

# Suriin ang awtentikasyon ng AZD
azd auth login --check-status
```

### I-verify ang opsyonal na Azure CLI awtentikasyon

```bash
az account show
```

### Suriin ang bersyon ng Node.js
```bash
node --version
```

## Hakbang 1: Pumili at I-initialize ang isang Template

Magsimula tayo sa isang sikat na template ng todo na aplikasyon na may kasamang React frontend at Node.js API backend.

```bash
# I-browse ang mga magagamit na template
azd template list

# I-initialize ang template ng todo app
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sundin ang mga prompt:
# - Ipasok ang pangalan ng environment: "dev"
# - Pumili ng subscription (kung mayroon kang higit sa isa)
# - Pumili ng rehiyon: "East US 2" (o ang rehiyon na iyong nais)
```

### Ano ang Nangyari?
- Na-download ang code ng template sa iyong lokal na direktoryo
- Nilikha ang isang `azure.yaml` na file na may mga depinisyon ng serbisyo
- Nai-set up ang code ng imprastruktura sa direktoryong `infra/`
- Nilikha ang isang configuration ng environment

## Hakbang 2: Suriin ang Istruktura ng Proyekto

Suriin natin ang mga nilikha ng azd para sa atin:

```bash
# Tingnan ang istruktura ng proyekto
tree /f   # Windows
# o
find . -type f | head -20   # macOS/Linux
```

Dapat mong makita:
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

### Mahahalagang File na Dapat Unawain

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

Bago i-deploy, maaari mong i-customize ang aplikasyon:

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
# Tingnan ang lahat ng mga variable ng kapaligiran
azd env get-values
```

## Hakbang 4: I-deploy sa Azure

Ngayon ang pinakakapanapanabik na bahagi - i-deploy ang lahat sa Azure!

```bash
# I-deploy ang imprastruktura at aplikasyon
azd up

# Gagawin ng utos na ito:
# 1. Maglalaan ng mga resource ng Azure (App Service, Cosmos DB, atbp.)
# 2. Ibuo ang iyong aplikasyon
# 3. I-deploy sa mga inilaang resource
# 4. Ipakita ang URL ng aplikasyon
```

### Ano ang Nangyayari Habang Nagde-deploy?

Ginagawa ng utos na `azd up` ang mga sumusunod na hakbang:
1. **Provision** (`azd provision`) - Lumilikha ng mga resource sa Azure
2. **Package** - Binubuo ang iyong application code
3. **Deploy** (`azd deploy`) - Nagde-deploy ng code sa mga resource ng Azure

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
# Kunin ang mga endpoint ng aplikasyon
azd show

# Buksan ang aplikasyon sa iyong browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Subukan ang Todo App
1. **Magdagdag ng todo item** - I-click ang "Add Todo" at ilagay ang isang gawain
2. **Mark as complete** - Lagyan ng tsek ang mga natapos na item
3. **Tanggalin ang mga item** - Alisin ang mga todo na hindi mo na kailangan

### I-monitor ang Iyong Aplikasyon
```bash
# Buksan ang Azure portal para sa iyong mga resource
azd monitor

# Tingnan ang mga log ng aplikasyon
azd monitor --logs

# Tingnan ang mga live na sukatan
azd monitor --live
```

## Hakbang 6: Gumawa ng Mga Pagbabago at Muling I-deploy

Gumawa tayo ng pagbabago at tingnan kung gaano kadaling mag-update:

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

# Mas mabilis ito kaysa sa 'azd up' dahil umiiral na ang imprastruktura
```

## Hakbang 7: Pamahalaan ang Maramihang Mga Environment

Lumikha ng staging environment para subukan ang mga pagbabago bago sa production:

```bash
# Lumikha ng bagong staging environment
azd env new staging

# I-deploy sa staging
azd up

# Lumipat pabalik sa dev environment
azd env select dev

# Ilista ang lahat ng mga environment
azd env list
```

### Paghahambing ng mga Environment
```bash
# Tingnan ang dev na kapaligiran
azd env select dev
azd show

# Tingnan ang staging na kapaligiran
azd env select staging
azd show
```

## Hakbang 8: Linisin ang Mga Resource

Kapag tapos ka na sa pag-eeksperimento, linisin ang mga resources upang maiwasan ang patuloy na singil:

```bash
# Tanggalin ang lahat ng mga Azure resource para sa kasalukuyang kapaligiran
azd down

# Pilitin ang pagtanggal nang walang kumpirmasyon at tuluyang alisin ang mga soft-deleted na resource
azd down --force --purge

# Tanggalin ang tinukoy na kapaligiran
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Parehong Workflow

Kakadeploy mo lang ng tradisyonal na web application. Ngunit paano kung gusto mong mag-deploy ng AI-powered app imbes—halimbawa, isang chat application na sinusuportahan ng Microsoft Foundry Models?

Magandang balita: **pareho ang workflow.**

| Hakbang | Klasikong Todo App | AI Chat App |
|------|-----------------|-------------|
| I-initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Mag-authenticate | `azd auth login` | `azd auth login` |
| I-deploy | `azd up` | `azd up` |
| I-monitor | `azd monitor` | `azd monitor` |
| Linisin | `azd down --force --purge` | `azd down --force --purge` |

Ang tanging pagkakaiba ay ang **template** na sisimulan mo. Ang AI template ay naglalaman ng karagdagang imprastruktura (tulad ng isang Microsoft Foundry Models resource o isang AI Search index), ngunit hinahawakan lahat ng iyon ng azd para sa iyo. Hindi mo kailangang matuto ng mga bagong utos, gumamit ng ibang tool, o baguhin ang paraan ng pag-iisip tungkol sa deployment.

Ito ang pangunahing prinsipyo ng azd: **isang workflow, anumang workload.** Ang mga kasanayang pinraktis mo sa tutorial na ito—pag-initialize, pag-deploy, pag-monitor, pag-redeploy, at paglilinis—ay pantay na naaangkop sa mga AI na aplikasyon at agent.

---

## Ano ang Iyong Natutunan

Binabati kita! Matagumpay mong:
- ✅ Naka-initialize ang isang azd na proyekto mula sa template
- ✅ Nasuri ang istruktura ng proyekto at mga mahahalagang file
- ✅ Na-deploy ang isang full-stack na aplikasyon sa Azure
- ✅ Nakagawa ng mga pagbabago sa code at na-redeploy
- ✅ Namahala ng maramihang mga environment
- ✅ Nilinis ang mga resources

## 🎯 Mga Ehersisyo para sa Pagpapatunay ng Kasanayan

### Ehersisyo 1: I-deploy ang Ibang Template (15 minuto)
**Layunin**: Ipakita ang kahusayan sa azd init at workflow ng deployment

```bash
# Subukan ang stack na Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Suriin ang pag-deploy
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Linisin
azd down --force --purge
```

**Kriteria ng Tagumpay:**
- [ ] Na-deploy ang aplikasyon nang walang error
- [ ] Maaaring ma-access ang URL ng aplikasyon sa browser
- [ ] Gumagana nang tama ang aplikasyon (magdagdag/magtanggal ng todos)
- [ ] Matagumpay na nalinis ang lahat ng resources

### Ehersisyo 2: I-customize ang Konfigurasyon (20 minuto)
**Layunin**: Sanayin ang pag-configure ng mga environment variable

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

**Kriteria ng Tagumpay:**
- [ ] Matagumpay na nalikha ang custom na environment
- [ ] Na-set at makukuha ang mga environment variable
- [ ] Na-deploy ang aplikasyon gamit ang custom na konfigurasyon
- [ ] Ma-verify ang custom na mga setting sa na-deploy na app

### Ehersisyo 3: Workflow para sa Maramihang Environment (25 minuto)
**Layunin**: Maging bihasa sa pamamahala ng environment at mga estratehiya sa deployment

```bash
# Gumawa ng dev na kapaligiran
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Itala ang dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Gumawa ng staging na kapaligiran
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Itala ang staging URL
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

**Kriteria ng Tagumpay:**
- [ ] Dalawang environment na nalikha na may iba't ibang konfigurasyon
- [ ] Na-deploy nang matagumpay ang parehong environment
- [ ] Maaaring lumipat sa pagitan ng mga environment gamit ang `azd env select`
- [ ] Magkakaiba ang mga environment variable sa pagitan ng mga environment
- [ ] Matagumpay na nalinis ang parehong environment

## 📊 Ang Iyong Progreso

**Oras na Inilaan**: ~60-90 minuto  
**Mga Kasanayang Nakuha**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Susunod na Antas**: Handa ka na para sa [Gabay sa Konfigurasyon](configuration.md) para matutunan ang mga advanced na pattern ng konfigurasyon!

## Pag-troubleshoot ng Mga Karaniwang Isyu

### Mga Error sa Awtentikasyon
```bash
# Muling patunayan ang pagkakakilanlan sa Azure
az login

# Suriin ang access sa subscription
az account show
```

### Mga Pagkabigong Deployment
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
# Gumamit ng natatanging pangalan ng kapaligiran
azd env new dev-$(whoami)-$(date +%s)
```

### Mga Isyu sa Port/Network
```bash
# Suriin kung magagamit ang mga port
netstat -an | grep :3000
netstat -an | grep :3100
```

## Mga Susunod na Hakbang

Ngayon na natapos mo na ang iyong unang proyekto, tuklasin ang mga advanced na paksa na ito:

### 1. I-customize ang Imprastruktura
- [Imprastruktura bilang Code](../chapter-04-infrastructure/provisioning.md)
- [Magdagdag ng mga database, storage, at iba pang serbisyo](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Itakda ang CI/CD
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) - Kumpletong mga workflow ng CI/CD
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasyon ng pipeline

### 3. Mga Pinakamahusay na Kasanayan sa Produksyon
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, pagganap, at pagmamanman

### 4. Tuklasin ang Marami pang Mga Template
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

**Binabati kita sa pagtatapos ng iyong unang azd na proyekto!** Handa ka na ngayong bumuo at mag-deploy ng kahanga-hangang mga aplikasyon sa Azure nang may kumpiyansa.

---

**Pag-navigate ng Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Pagsisimula
- **⬅️ Nakaraang**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Konfigurasyon](configuration.md)
- **🚀 Next Chapter**: [Kabanata 2: Pag-unlad na Nakatuon sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyo sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Habang nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga error o kamalian. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagkukunan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->