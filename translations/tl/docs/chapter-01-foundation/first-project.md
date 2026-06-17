# Ang Iyong Unang Proyekto - Praktikal na Tutorial

**Pag-navigate ng Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 1 - Pundasyon & Mabilisang Pagsisimula
- **⬅️ Previous**: [Pag-install at Pag-setup](installation.md)
- **➡️ Next**: [Kumpigurasyon](configuration.md)
- **🚀 Next Chapter**: [Kabanata 2: Pag-unlad na Nakasentro sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksyon

Maligayang pagdating sa iyong unang Azure Developer CLI na proyekto! Ang komprehensibong praktikal na tutorial na ito ay nagbibigay ng kumpletong walkthrough ng paglikha, pag-deploy, at pamamahala ng isang full-stack na aplikasiyon sa Azure gamit ang azd. Magtatrabaho ka sa isang totoong todo application na may React frontend, Node.js API backend, at MongoDB database.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng tutorial na ito, ikaw ay:
- Magiging bihasa sa azd project initialization workflow gamit ang mga template
- Mauunawaan ang istruktura ng Azure Developer CLI na proyekto at mga file ng kumpigurasyon
- Makakapagpatupad ng kompletong pag-deploy ng aplikasyon sa Azure kasama ang provisioning ng imprastruktura
- Makakapag-implement ng mga estratehiya para sa pag-update ng aplikasyon at muling pag-deploy
- Makakapamahala ng maraming kapaligiran para sa development at staging
- Makakapagpatupad ng mga gawain para sa paglilinis ng resource at pamamahala ng gastos

## Mga Kinalabasan ng Pagkatuto

Sa pagtatapos, magagawa mong:
- I-initialize at i-configure ang mga azd na proyekto mula sa mga template nang mag-isa
- Mag-navigate at mag-modify ng mga istruktura ng azd na proyekto nang epektibo
- Mag-deploy ng mga full-stack na aplikasyon sa Azure gamit ang iisang mga utos
- Mag-troubleshoot ng mga karaniwang isyu sa pag-deploy at mga problema sa authentication
- Pamahalaan ang maramihang Azure na kapaligiran para sa iba't ibang yugto ng pag-deploy
- Mag-implement ng mga continuous deployment workflows para sa pag-update ng aplikasyon

## Pagsisimula

### Checklist ng mga Kinakailangan
- ✅ Azure Developer CLI installed ([Gabay sa Pag-install](installation.md))
- ✅ Nakumpletong pag-authenticate sa AZD gamit ang `azd auth login`
- ✅ Git na naka-install sa iyong sistema
- ✅ Node.js 16+ (para sa tutorial na ito)
- ✅ Visual Studio Code (inirerekomenda)

Bago magpatuloy, patakbuhin ang setup validator mula sa ugat ng repositoryo:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Beripikahin ang Iyong Setup
```bash
# Suriin ang pag-install ng azd
azd version

# Suriin ang pagpapatunay ng AZD
azd auth login --check-status
```

### Beripikahin ang opsyonal na pag-authenticate ng Azure CLI

```bash
az account show
```

### Suriin ang bersyon ng Node.js
```bash
node --version
```

## Hakbang 1: Pumili at I-initialize ang isang Template

Magsimula tayo sa isang kilalang todo application template na may kasamang React frontend at Node.js API backend.

```bash
# Mag-browse ng mga available na template
azd template list

# I-initialize ang template ng todo app
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sundin ang mga prompt:
# - Ilagay ang pangalan ng environment: "dev"
# - Piliin ang subscription (kung marami ka nito)
# - Piliin ang rehiyon: "East US 2" (o ang iyong gustong rehiyon)
```

### Ano ang Nangyari?
- Na-download ang code ng template sa iyong lokal na direktoryo
- Nilikha ang `azure.yaml` na file na may mga depinisyon ng serbisyo
- Naka-set up ang infrastructure code sa direktoryong `infra/`
- Nilikha ang isang configuration ng kapaligiran

## Hakbang 2: Suriin ang Estruktura ng Proyekto

Suriin natin ang ginawa ng azd para sa atin:

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

**azure.yaml** - Ang puso ng iyong azd proyekto:
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
# Buksan ang component ng React app
code src/web/src/App.tsx
```

Gumawa ng simpleng pagbabago:
```typescript
// Hanapin ang pamagat at palitan ito
<h1>My Awesome Todo App</h1>
```

### I-configure ang Mga Variable ng Kapaligiran
```bash
# Itakda ang mga pasadyang variable ng kapaligiran
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tingnan ang lahat ng mga variable ng kapaligiran
azd env get-values
```

## Hakbang 4: I-deploy sa Azure

Ngayon ang kapanapanabik na bahagi - i-deploy ang lahat sa Azure!

```bash
# I-deploy ang imprastruktura at aplikasyon
azd up

# Gagawin ng utos na ito:
# 1. Maglaan ng mga resource ng Azure (App Service, Cosmos DB, atbp.)
# 2. Buuin ang iyong aplikasyon
# 3. I-deploy sa mga na-provision na resource
# 4. Ipakita ang URL ng aplikasyon
```

### Ano ang Nangyayari Habang Nag-de-deploy?

Gumagawa ang utos na `azd up` ng mga sumusunod na hakbang:
1. **Provision** (`azd provision`) - Lumilikha ng mga resource sa Azure
2. **Package** - Binubuo ang code ng iyong aplikasyon
3. **Deploy** (`azd deploy`) - Inideploy ang code sa mga resource ng Azure

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
1. **Magdagdag ng isang todo item** - I-click ang "Add Todo" at ilagay ang isang gawain
2. **Mark as complete** - Lagyan ng tsek ang mga natapos na item
3. **Delete items** - Alisin ang mga todo na hindi mo na kailangan

### I-monitor ang Iyong Aplikasyon
```bash
# Buksan ang Azure portal para sa iyong mga resource
azd monitor

# Tingnan ang mga log ng aplikasyon
azd monitor --logs

# Tingnan ang mga real-time na sukatan
azd monitor --live
```

### ✅ Beripikahin ang Iyong Deployment

Bago magpatuloy, sundin ang mabilis na checklist na ito upang kumpirmahin na talagang gumagana ang lahat—huwag ipalagay na ang "nagtagumpay ang pag-deploy" ay nangangahulugang "gumagana ang app":

```bash
# 1. Kumpirmahin na umiiral ang endpoint at maaabot ito
azd show

# 2. Gumawa ng smoke-test sa endpoint (inaasahan ang HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Suriin ang health endpoint kung nag-e-expose ang iyong app ng isa
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Beripikado ang Deployment kapag:**
- ✅ `azd show` naglilista ng isang maabot na endpoint URL
- ✅ Nagbubukas ang URL sa iyong browser nang walang mga error
- ✅ Gumagana ang mga pangunahing feature (magdagdag/markahan bilang tapos/tanggalin ang isang todo)
- ✅ `azd monitor --logs` nagpapakita ng mga request na dumarating nang walang hindi inaasahang mga error

Kung may nabigong tsek, pumunta sa [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/README.md).

## Hakbang 6: Gumawa ng Mga Pagbabago at Muling I-deploy

Gumawa tayo ng pagbabago at tingnan kung gaano kadaling i-update:

### Baguhin ang API
```bash
# I-edit ang code ng API
code src/api/src/routes/lists.js
```

Magdagdag ng custom na response header:
```javascript
// Hanapin ang isang tagapamahala ng ruta at idagdag:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### I-deploy Lamang ang Mga Pagbabago sa Code
```bash
# I-deploy lamang ang code ng aplikasyon (laktawan ang imprastruktura)
azd deploy

# Mas mabilis ito kaysa sa 'azd up' dahil umiiral na ang imprastruktura
```

## Hakbang 7: Pamahalaan ang Maramihang Mga Kapaligiran

Gumawa ng staging environment upang subukan ang mga pagbabago bago ang production:

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

### Paghahambing ng Mga Kapaligiran
```bash
# Tingnan ang kapaligiran ng dev
azd env select dev
azd show

# Tingnan ang kapaligiran ng staging
azd env select staging
azd show
```

## Hakbang 8: Linisin ang Mga Resource

Kapag tapos ka na sa pag-eeksperimento, linisin ang mga resource upang maiwasan ang patuloy na singil:

```bash
# Tanggalin ang lahat ng mga resource ng Azure para sa kasalukuyang kapaligiran
azd down

# Piliting tanggalin nang walang kumpirmasyon at ganap na alisin ang mga pansamantalang natanggal na resource
azd down --force --purge

# Tanggalin ang tinukoy na kapaligiran
azd env select staging
azd down --force --purge
```

## Klasikong App vs. App na Pinapagana ng AI: Parehong Workflow

Katatapos mo lang mag-deploy ng tradisyunal na web application. Ngunit paano kung gusto mong mag-deploy ng isang app na pinapagana ng AI — halimbawa, isang chat application na naka-backend sa Microsoft Foundry Models?

Ang magandang balita: **magkakapareho ang workflow.**

| Hakbang | Klasikong Todo App | AI Chat App |
|------|-----------------|-------------|
| I-initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Mag-authenticate | `azd auth login` | `azd auth login` |
| I-deploy | `azd up` | `azd up` |
| I-monitor | `azd monitor` | `azd monitor` |
| I-clean up | `azd down --force --purge` | `azd down --force --purge` |

Ang tanging pagkakaiba ay ang **template** na iyong pagsisimulan. Ang isang AI template ay naglalaman ng karagdagang imprastruktura (tulad ng isang Microsoft Foundry Models resource o isang AI Search index), ngunit inaasikaso lahat ng iyon ng azd para sa iyo. Hindi mo kailangang matutunan ang bagong mga utos, gumamit ng ibang tool, o baguhin ang paraan ng pag-iisip tungkol sa pag-deploy.

Ito ang pangunahing prinsipyo ng azd: **isang workflow, anumang workload.** Ang mga kasanayang pinraktis mo sa tutorial na ito—pag-initialize, pag-deploy, pag-monitor, muling pag-deploy, at paglilinis—naangkop din sa mga AI application at mga agent.

---

## Ano ang Iyong Natutunan

Binabati kita! Matagumpay mong:
- ✅ I-initialize ang isang azd na proyekto mula sa isang template
- ✅ Sinuri ang istruktura ng proyekto at mga mahahalagang file
- ✅ Na-deploy ang isang full-stack na aplikasiyon sa Azure
- ✅ Gumawa ng mga pagbabago sa code at muling na-deploy
- ✅ Namahala ng maramihang kapaligiran
- ✅ Nilinis ang mga resource

## 🎯 Mga Ehersisyo para sa Pag-beripika ng Kasanayan

### Ehersisyo 1: I-deploy ang Ibang Template (15 minuto)
**Layunin**: Ipakita ang kahusayan sa azd init at daloy ng pag-deploy

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
- [ ] Na-deploy ang aplikasyon nang walang error
- [ ] Kayang i-access ang URL ng aplikasyon sa browser
- [ ] Gumagana nang maayos ang aplikasyon (magdagdag/magtanggal ng mga todos)
- [ ] Matagumpay na nalinis ang lahat ng mga resource

### Ehersisyo 2: I-customize ang Kumpigurasyon (20 minuto)
**Layunin**: Magsanay sa pagkumpigura ng mga variable ng kapaligiran

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
- [ ] Matagumpay na nalikha ang custom na kapaligiran
- [ ] Nai-set at nakakuhang muli ang mga environment variable
- [ ] Na-deploy ang aplikasyon gamit ang custom na kumpigurasyon
- [ ] Kayang beripikahin ang mga custom na setting sa na-deploy na app

### Ehersisyo 3: Daloy ng Trabaho para sa Maramihang Kapaligiran (25 minuto)
**Layunin**: Maging dalubhasa sa pamamahala ng kapaligiran at mga estratehiya sa pag-deploy

```bash
# Lumikha ng dev na kapaligiran
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Tandaan ang dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Lumikha ng staging na kapaligiran
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
- [ ] Dalawang kapaligiran ang nalikha na may magkakaibang kumpigurasyon
- [ ] Parehong na-deploy nang matagumpay ang mga kapaligiran
- [ ] Kayang mag-switch sa pagitan ng mga kapaligiran gamit ang `azd env select`
- [ ] Nagkakaiba ang environment variables sa pagitan ng mga kapaligiran
- [ ] Matagumpay na nalinis ang parehong mga kapaligiran

## 📊 Ang Iyong Progreso

**Oras na Ginugol**: ~60-90 minuto  
**Mga Kasanayang Nakuha**:
- ✅ Template-based na pag-initialize ng proyekto
- ✅ Provisioning ng Azure resource
- ✅ Workflow sa pag-deploy ng aplikasyon
- ✅ Pamamahala ng kapaligiran
- ✅ Pamamahala ng kumpigurasyon
- ✅ Paglilinis ng resource at pamamahala ng gastos

**Susunod na Antas**: Handa ka na para sa [Gabay sa Kumpigurasyon](configuration.md) para matuto ng mga advanced na pattern ng kumpigurasyon!

## Pag-troubleshoot ng Mga Karaniwang Isyu

### Mga Error sa Pag-authenticate
```bash
# Muling mag-log in sa Azure
az login

# Tiyakin ang access sa subscription
az account show
```

### Mga Pagkabigong Pag-deploy
```bash
# Paganahin ang pag-log ng debug
export AZD_DEBUG=true
azd up --debug

# Tingnan ang mga log ng aplikasyon sa Azure
azd monitor --logs

# Para sa Container Apps, gamitin ang Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Mga Pagkakaproblema sa Pangalan ng Resource
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

Ngayon na natapos mo ang iyong unang proyekto, tuklasin ang mga advanced na paksa na ito:

### 1. I-customize ang Imprastruktura
- [Imprastruktura bilang Code](../chapter-04-infrastructure/provisioning.md)
- [Magdagdag ng mga database, storage, at iba pang serbisyo](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. I-set Up ang CI/CD
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md) - Kumpletong CI/CD workflows
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pagkumpigura ng pipeline

### 3. Mga Pinakamahusay na Kasanayan para sa Produksyon
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, performance, at monitoring

### 4. Tuklasin ang Iba pang Mga Template
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

### Mga Materyales sa Pagkatuto
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunidad at Suporta
- [GitHub ng Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Komunidad ng Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mga Template at Mga Halimbawa
- [Opisyal na Gallery ng Template](https://azure.github.io/awesome-azd/)
- [Mga Template ng Komunidad](https://github.com/Azure-Samples/azd-templates)
- [Mga Pattern para sa Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Binabati kita sa pagtatapos ng iyong unang azd proyekto!** Handa ka na ngayong bumuo at mag-deploy ng kamangha-manghang mga aplikasyon sa Azure nang may kumpiyansa.

---

**Pag-navigate ng Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 1 - Pundasyon & Mabilisang Pagsisimula
- **⬅️ Previous**: [Pag-install at Pag-setup](installation.md)
- **➡️ Next**: [Dalhin ang Iyong Sariling App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Kabanata 2: Pag-unlad na Nakasentro sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->