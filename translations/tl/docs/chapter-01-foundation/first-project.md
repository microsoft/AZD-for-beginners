# Ang Iyong Unang Proyekto - Praktikal na Tutorial

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Pag-install at Pag-setup](installation.md)
- **➡️ Susunod**: [Konfigurasyon](configuration.md)
- **🚀 Next Chapter**: [Kabanata 2: Pag-unlad na Nakatuon sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Maligayang pagdating sa iyong unang Azure Developer CLI na proyekto! Ang komprehensibong praktikal na tutorial na ito ay nagbibigay ng kumpletong walkthrough ng paggawa, pag-deploy, at pamamahala ng isang full-stack na aplikasyon sa Azure gamit ang azd. Magtatrabaho ka sa isang totoong todo na aplikasyon na may kasamang React frontend, Node.js API backend, at MongoDB database.

## Mga Layunin sa Pagkatuto

Sa pagkumpleto ng tutorial na ito, ikaw ay:
- Maging bihasa sa workflow ng pag-initialize ng proyekto ng azd gamit ang mga template
- Maunawaan ang istruktura ng proyekto ng Azure Developer CLI at ang mga file ng konfigurasyon
- Maisagawa ang kumpletong pag-deploy ng aplikasyon sa Azure kasama ang provisioning ng imprastruktura
- Magpatupad ng mga estratehiya para sa pag-update at muling pag-deploy ng aplikasyon
- Pamahalaan ang maramihang kapaligiran para sa development at staging
- Mag-apply ng mga gawain sa paglilinis ng resource at pamamahala ng gastos

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto, magagawa mo:
- I-initialize at i-configure ang mga proyekto ng azd mula sa mga template nang mag-isa
- Mag-navigate at mag-modify ng mga istruktura ng proyekto ng azd nang epektibo
- Mag-deploy ng mga full-stack na aplikasyon sa Azure gamit ang iisang mga utos
- Mag-troubleshoot ng mga karaniwang isyu sa deployment at mga problema sa authentication
- Pamahalaan ang maramihang Azure na kapaligiran para sa iba't ibang yugto ng deployment
- Magpatupad ng mga workflow ng tuloy-tuloy na deployment para sa mga pag-update ng aplikasyon

## Pagsisimula

### Tseklist ng Mga Kinakailangan
- ✅ Azure Developer CLI na naka-install ([Gabay sa Pag-install](installation.md))
- ✅ Azure CLI na naka-install at naka-authenticate
- ✅ Git na naka-install sa iyong sistema
- ✅ Node.js 16+ (para sa tutorial na ito)
- ✅ Visual Studio Code (inirerekomenda)

### Suriin ang Iyong Setup
```bash
# Suriin ang pag-install ng azd
azd version
```
### Suriin ang pag-authenticate sa Azure

```bash
az account show
```

### Suriin ang bersyon ng Node.js
```bash
node --version
```

## Hakbang 1: Piliin at I-initialize ang isang Template

Magsimula tayo sa isang kilalang template ng todo na aplikasyon na may kasamang React frontend at Node.js API backend.

```bash
# Mag-browse ng mga magagamit na template
azd template list

# I-initialize ang template ng todo app
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sundin ang mga prompt:
# - Ipasok ang pangalan ng environment: "dev"
# - Piliin ang subscription (kung mayroon kang higit sa isa)
# - Piliin ang rehiyon: "East US 2" (o ang rehiyon na iyong nais)
```

### Ano ang Nangyari?
- Na-download ang code ng template sa iyong lokal na direktoryo
- Nilikha ang `azure.yaml` file na may mga depinisyon ng serbisyo
- Inayos ang infrastructure code sa `infra/` na direktoryo
- Nilikha ang isang konfigurasyon ng kapaligiran

## Hakbang 2: Suriin ang Estruktura ng Proyekto

Suriin natin ang nilikha ng azd para sa atin:

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

### Mga Pangunahing File na Dapat Unawain

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
// Hanapin ang pamagat at palitan ito.
<h1>My Awesome Todo App</h1>
```

### I-configure ang mga variable ng kapaligiran
```bash
# Itakda ang mga pasadyang variable ng kapaligiran
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tingnan ang lahat ng mga variable ng kapaligiran
azd env get-values
```

## Hakbang 4: I-deploy sa Azure

Ngayon para sa nakakapanabik na bahagi - i-deploy ang lahat sa Azure!

```bash
# I-deploy ang imprastruktura at aplikasyon
azd up

# Gagawin ng utos na ito:
# 1. Maglalaan ng mga resource ng Azure (App Service, Cosmos DB, atbp.)
# 2. Buuin ang iyong aplikasyon
# 3. I-deploy sa mga inilaan na resource
# 4. Ipakita ang URL ng aplikasyon
```

### Ano ang Nangyayari Habang Nagde-deploy?

Gumagawa ang utos na `azd up` ng mga hakbang na ito:
1. **Provision** (`azd provision`) - Lumilikha ng mga resource sa Azure
2. **Package** - Binubuo ang code ng iyong aplikasyon
3. **Deploy** (`azd deploy`) - Nagde-deploy ng code sa mga resource sa Azure

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
I-click ang URL na ibinigay sa output ng deployment, o kunin ito anumang oras:
```bash
# Kunin ang mga endpoint ng aplikasyon
azd show

# Buksan ang aplikasyon sa iyong browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Subukan ang Todo App
1. **Magdagdag ng todo item** - I-click ang "Add Todo" at maglagay ng isang gawain
2. **Mark as complete** - Lagyan ng tsek ang mga natapos na item
3. **Tanggalin ang mga item** - Alisin ang mga todo na hindi mo na kailangan

### Subaybayan ang Iyong Aplikasyon
```bash
# Buksan ang Azure portal para sa iyong mga mapagkukunan
azd monitor

# Tingnan ang mga log ng aplikasyon
azd monitor --logs

# Tingnan ang mga live na sukatan
azd monitor --live
```

## Hakbang 6: Gumawa ng Mga Pagbabago at Muling I-deploy

Gumawa tayo ng pagbabago at tingnan kung gaano kadali mag-update:

### Baguhin ang API
```bash
# I-edit ang kodigo ng API
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

## Hakbang 7: Pamahalaan ang Maramihang Kapaligiran

Lumikha ng isang staging na kapaligiran upang subukan ang mga pagbabago bago sa produksyon:

```bash
# Lumikha ng bagong staging environment
azd env new staging

# I-deploy sa staging
azd up

# Lumipat pabalik sa dev environment
azd env select dev

# Ilista ang lahat ng kapaligiran
azd env list
```

### Paghahambing ng Mga Kapaligiran
```bash
# Tingnan ang kapaligiran ng pag-develop
azd env select dev
azd show

# Tingnan ang staging na kapaligiran
azd env select staging
azd show
```

## Hakbang 8: Linisin ang Mga Resource

Kapag natapos ka na sa pag-eksperimento, linisin upang maiwasan ang patuloy na singil:

```bash
# Burahin ang lahat ng mga Azure resource para sa kasalukuyang kapaligiran
azd down

# Sapilitang tanggalin nang walang kumpirmasyon at tuluyang alisin ang mga soft-deleted na resource
azd down --force --purge

# Tanggalin ang partikular na kapaligiran
azd env select staging
azd down --force --purge
```

## Classic App vs. App na Pinapagana ng AI: Parehong Workflow

Ang magandang balita: **magkakapareho ang workflow.**

| Hakbang | Klasikong Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Ang tanging pagkakaiba ay ang **template** na pinanggagalingan mo. Ang isang AI template ay naglalaman ng karagdagang imprastruktura (tulad ng isang Microsoft Foundry Models resource o isang AI Search index), ngunit hinahandle ng azd ang lahat ng iyon para sa iyo. Hindi mo kailangang matutunan ang mga bagong utos, gumamit ng ibang tool, o baguhin ang paraan ng pag-iisip mo tungkol sa deployment.

Ito ang pangunahing prinsipyo ng azd: **isang workflow, anumang workload.** Ang mga kasanayan na iyong pinraktis sa tutorial na ito—pag-initialize, pag-deploy, pagmo-monitor, muling pag-deploy, at paglilinis—ay pantay na nalalapat sa mga AI na aplikasyon at mga agent.

---

## Ano ang Iyong Natutunan

Binabati kita! Matagumpay mong:
- ✅ Na-initialize ang isang azd na proyekto mula sa isang template
- ✅ Nasuri ang estruktura ng proyekto at mga pangunahing file
- ✅ Na-deploy ang isang full-stack na aplikasyon sa Azure
- ✅ Gumawa ng mga pagbabago sa code at muling nag-deploy
- ✅ Namahalaang ang maramihang kapaligiran
- ✅ Nilinis ang mga resource

## 🎯 Mga Ehersisyo sa Pagpapatunay ng Kasanayan

### Ehersisyo 1: I-deploy ang Ibang Template (15 minuto)
**Layunin**: Ipakita ang kahusayan sa azd init at workflow ng deployment

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

**Kriterya ng Tagumpay:**
- [ ] Na-deploy ang aplikasyon nang walang error
- [ ] Maaaring i-access ang URL ng aplikasyon sa browser
- [ ] Maayos na gumagana ang aplikasyon (magdagdag/magtanggal ng mga todo)
- [ ] Matagumpay na nalinis ang lahat ng mga resource

### Ehersisyo 2: I-customize ang Konfigurasyon (20 minuto)
**Layunin**: Sanayin ang konfigurasyon ng mga environment variable

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

**Kriterya ng Tagumpay:**
- [ ] Matagumpay na nalikha ang custom na environment
- [ ] Na-set at makukuha ang mga environment variable
- [ ] Na-deploy ang aplikasyon na may custom na konfigurasyon
- [ ] Maaaring beripikahin ang custom na mga setting sa na-deploy na app

### Ehersisyo 3: Workflow ng Maramihang Kapaligiran (25 minuto)
**Layunin**: Maging bihasa sa pamamahala ng kapaligiran at mga estratehiya ng deployment

```bash
# Lumikha ng dev na kapaligiran
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Itala ang dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Lumikha ng staging na kapaligiran
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

**Kriterya ng Tagumpay:**
- [ ] Dalawang kapaligiran ang nalikha na may magkaibang konfigurasyon
- [ ] Ang parehong mga kapaligiran ay matagumpay na na-deploy
- [ ] Maaaring lumipat sa pagitan ng mga kapaligiran gamit ang `azd env select`
- [ ] Nagkakaiba ang mga environment variable sa pagitan ng mga kapaligiran
- [ ] Matagumpay na nilinis ang parehong mga kapaligiran

## 📊 Ang Iyong Progreso

**Oras na Ginugol**: ~60-90 minuto  
**Mga Kasanayang Nakuha**:
- ✅ Pag-initialize ng proyekto batay sa template
- ✅ Pagpo-provision ng mga resource sa Azure
- ✅ Mga workflow ng deployment ng aplikasyon
- ✅ Pangangasiwa ng kapaligiran
- ✅ Pangangasiwa ng konfigurasyon
- ✅ Paglilinis ng resource at pamamahala ng gastos

**Susunod na Antas**: Handa ka na para sa [Gabay sa Konfigurasyon](configuration.md) upang matutunan ang mga advanced na pattern ng konfigurasyon!

## Pag-troubleshoot ng Mga Karaniwang Isyu

### Mga Error sa Authentication
```bash
# Muling mag-authenticate sa Azure
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
# Gumamit ng natatanging pangalan para sa kapaligiran
azd env new dev-$(whoami)-$(date +%s)
```

### Mga Isyu sa Port/Network
```bash
# Suriin kung magagamit ang mga port
netstat -an | grep :3000
netstat -an | grep :3100
```

## Mga Susunod na Hakbang

Ngayon na nakumpleto mo ang iyong unang proyekto, tuklasin ang mga advanced na paksa na ito:

### 1. I-customize ang Imprastruktura
- [Imprastruktura bilang Code](../chapter-04-infrastructure/provisioning.md)
- [Magdagdag ng mga database, storage, at iba pang serbisyo](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. I-set up ang CI/CD
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) - Kompletong mga workflow ng CI/CD
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasyon ng pipeline

### 3. Pinakamahusay na Praktika sa Produksyon
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, pagganap, at pagmo-monitor

### 4. Tuklasin ang Higit pang Mga Template
```bash
# Mag-browse ng mga template ayon sa kategorya
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Subukan ang iba't ibang mga stack ng teknolohiya
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Karagdagang Mga Mapagkukunan

### Mga Materyal sa Pagkatuto
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sentro ng Arkitektura ng Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunidad at Suporta
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komunidad ng Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mga Template at Halimbawa
- [Opisyal na Gallery ng Template](https://azure.github.io/awesome-azd/)
- [Mga Template ng Komunidad](https://github.com/Azure-Samples/azd-templates)
- [Mga Pattern para sa Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Binabati kita sa pagkumpleto ng iyong unang azd na proyekto!** Handang-handa ka na ngayon na bumuo at mag-deploy ng mga kahanga-hangang aplikasyon sa Azure nang may kumpiyansa.

---

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Pag-install at Pag-setup](installation.md)
- **➡️ Susunod**: [Konfigurasyon](configuration.md)
- **🚀 Next Chapter**: [Kabanata 2: Pag-unlad na Nakatuon sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI na pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong salin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->