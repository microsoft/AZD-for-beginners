<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-22T10:28:16+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "tl"
}
-->
# Ang Iyong Unang Proyekto - Hands-On Tutorial

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Konpigurasyon](configuration.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## Panimula

Maligayang pagdating sa iyong unang proyekto gamit ang Azure Developer CLI! Ang komprehensibong hands-on tutorial na ito ay nagbibigay ng kumpletong walkthrough sa paggawa, pag-deploy, at pamamahala ng isang full-stack na aplikasyon sa Azure gamit ang azd. Magtatrabaho ka sa isang totoong todo application na may React frontend, Node.js API backend, at MongoDB database.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng tutorial na ito, ikaw ay:
- Magiging bihasa sa workflow ng azd project initialization gamit ang mga template
- Maiintindihan ang istruktura ng proyekto ng Azure Developer CLI at mga configuration file
- Makakapag-deploy ng kumpletong aplikasyon sa Azure kasama ang infrastructure provisioning
- Makakapagpatupad ng mga update sa aplikasyon at mga estratehiya sa redeployment
- Makakapamahala ng maraming environment para sa development at staging
- Makakapagpatupad ng mga kasanayan sa resource cleanup at cost management

## Mga Resulta ng Pag-aaral

Kapag natapos, magagawa mo:
- Mag-initialize at mag-configure ng mga azd project mula sa mga template nang mag-isa
- Mag-navigate at mag-modify ng istruktura ng azd project nang epektibo
- Mag-deploy ng full-stack na aplikasyon sa Azure gamit ang isang command
- Mag-troubleshoot ng mga karaniwang isyu sa deployment at authentication
- Mag-manage ng maraming Azure environment para sa iba't ibang deployment stages
- Magpatupad ng mga workflow para sa tuloy-tuloy na deployment ng mga update sa aplikasyon

## Pagsisimula

### Checklist ng Mga Kinakailangan
- ✅ Na-install ang Azure Developer CLI ([Gabay sa Pag-install](installation.md))
- ✅ Na-install at authenticated ang Azure CLI
- ✅ Na-install ang Git sa iyong sistema
- ✅ Node.js 16+ (para sa tutorial na ito)
- ✅ Visual Studio Code (inirerekomenda)

### I-verify ang Iyong Setup
```bash
# Suriin ang pag-install ng azd
azd version
```
### I-verify ang Azure authentication

```bash
az account show
```

### Suriin ang bersyon ng Node.js
```bash
node --version
```

## Hakbang 1: Pumili at Mag-initialize ng Template

Simulan natin sa isang sikat na todo application template na may React frontend at Node.js API backend.

```bash
# Mag-browse ng mga available na template
azd template list

# I-initialize ang template ng todo app
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sundin ang mga prompt:
# - Maglagay ng pangalan ng environment: "dev"
# - Pumili ng subscription (kung mayroon kang marami)
# - Pumili ng rehiyon: "East US 2" (o ang iyong nais na rehiyon)
```

### Ano ang Nangyari?
- Na-download ang template code sa iyong lokal na direktoryo
- Nilikha ang `azure.yaml` file na may mga service definition
- Na-setup ang infrastructure code sa direktoryong `infra/`
- Nilikha ang configuration ng environment

## Hakbang 2: Tuklasin ang Istruktura ng Proyekto

Suriin natin kung ano ang ginawa ng azd para sa atin:

```bash
# Tingnan ang istruktura ng proyekto
tree /f   # Windows
# o
find . -type f | head -20   # macOS/Linux
```

Makikita mo:
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

### Mga Pangunahing File na Dapat Maunawaan

**azure.yaml** - Ang puso ng iyong azd project:
```bash
# Tingnan ang konfigurasyon ng proyekto
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# Tingnan ang code ng imprastraktura
head -30 infra/main.bicep
```

## Hakbang 3: I-customize ang Iyong Proyekto (Opsyonal)

Bago mag-deploy, maaari mong i-customize ang aplikasyon:

### I-modify ang Frontend
```bash
# Buksan ang React app na component
code src/web/src/App.tsx
```

Gumawa ng simpleng pagbabago:
```typescript
// Hanapin ang pamagat at palitan ito
<h1>My Awesome Todo App</h1>
```

### I-configure ang Environment Variables
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
# I-deploy ang imprastraktura at aplikasyon
azd up

# Ang utos na ito ay:
# 1. Maglaan ng mga mapagkukunan ng Azure (App Service, Cosmos DB, atbp.)
# 2. I-build ang iyong aplikasyon
# 3. I-deploy sa mga inilaan na mapagkukunan
# 4. Ipakita ang URL ng aplikasyon
```

### Ano ang Nangyayari Habang Nagde-deploy?

Ang `azd up` command ay gumagawa ng mga sumusunod na hakbang:
1. **Provision** (`azd provision`) - Gumagawa ng mga Azure resource
2. **Package** - Binubuo ang application code
3. **Deploy** (`azd deploy`) - I-deploy ang code sa mga Azure resource

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
1. **Magdagdag ng todo item** - I-click ang "Add Todo" at maglagay ng task
2. **Markahan bilang tapos** - I-check ang mga natapos na item
3. **Tanggalin ang mga item** - Alisin ang mga todo na hindi mo na kailangan

### I-monitor ang Iyong Aplikasyon
```bash
# Buksan ang Azure portal para sa iyong mga resources
azd monitor

# Tingnan ang mga log ng aplikasyon
azd logs
```

## Hakbang 6: Gumawa ng Mga Pagbabago at I-redeploy

Gumawa tayo ng pagbabago at tingnan kung gaano kadali ang pag-update:

### I-modify ang API
```bash
# I-edit ang code ng API
code src/api/src/routes/lists.js
```

Magdagdag ng custom na response header:
```javascript
// Maghanap ng isang tagapamahala ng ruta at idagdag:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### I-deploy ang Mga Pagbabago sa Code Lamang
```bash
# I-deploy lamang ang application code (laktawan ang imprastraktura)
azd deploy

# Mas mabilis ito kaysa sa 'azd up' dahil umiiral na ang imprastraktura
```

## Hakbang 7: Pamahalaan ang Maraming Environment

Gumawa ng staging environment para subukan ang mga pagbabago bago ang production:

```bash
# Gumawa ng bagong staging na kapaligiran
azd env new staging

# I-deploy sa staging
azd up

# Bumalik sa dev na kapaligiran
azd env select dev

# Ilista ang lahat ng mga kapaligiran
azd env list
```

### Paghahambing ng Environment
```bash
# Tingnan ang dev environment
azd env select dev
azd show

# Tingnan ang staging environment
azd env select staging
azd show
```

## Hakbang 8: Linisin ang Mga Resource

Kapag tapos ka na sa pag-eeksperimento, linisin ang mga resource upang maiwasan ang patuloy na singil:

```bash
# Tanggalin ang lahat ng Azure resources para sa kasalukuyang kapaligiran
azd down

# Pilitin ang pagtanggal nang walang kumpirmasyon at linisin ang mga soft-deleted na resources
azd down --force --purge

# Tanggalin ang partikular na kapaligiran
azd env select staging
azd down --force --purge
```

## Ano ang Iyong Natutunan

Binabati kita! Matagumpay mong:
- ✅ Na-initialize ang isang azd project mula sa template
- ✅ Nasuri ang istruktura ng proyekto at mga pangunahing file
- ✅ Na-deploy ang isang full-stack na aplikasyon sa Azure
- ✅ Gumawa ng mga pagbabago sa code at na-redeploy
- ✅ Napamahalaan ang maraming environment
- ✅ Nalinis ang mga resource

## 🎯 Mga Ehersisyo sa Pagpapatunay ng Kasanayan

### Ehersisyo 1: Mag-deploy ng Ibang Template (15 minuto)
**Layunin**: Ipakita ang mastery sa workflow ng azd init at deployment

```bash
# Subukan ang Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# I-verify ang deployment
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Linisin
azd down --force --purge
```

**Kriteria ng Tagumpay:**
- [ ] Na-deploy ang aplikasyon nang walang error
- [ ] Ma-access ang URL ng aplikasyon sa browser
- [ ] Gumagana nang tama ang aplikasyon (magdagdag/magtanggal ng todo)
- [ ] Matagumpay na nalinis ang lahat ng resource

### Ehersisyo 2: I-customize ang Konpigurasyon (20 minuto)
**Layunin**: Magpraktis sa configuration ng environment variable

```bash
cd my-first-azd-app

# Gumawa ng pasadyang kapaligiran
azd env new custom-config

# Itakda ang mga pasadyang variable
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# I-verify ang mga variable
azd env get-values | grep APP_TITLE

# I-deploy gamit ang pasadyang config
azd up
```

**Kriteria ng Tagumpay:**
- [ ] Matagumpay na nalikha ang custom na environment
- [ ] Na-set at naretrieve ang mga environment variable
- [ ] Na-deploy ang aplikasyon gamit ang custom na configuration
- [ ] Ma-verify ang custom na settings sa na-deploy na app

### Ehersisyo 3: Workflow ng Multi-Environment (25 minuto)
**Layunin**: Master ang pamamahala ng environment at mga estratehiya sa deployment

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

# Linisin ang pareho
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria ng Tagumpay:**
- [ ] Dalawang environment ang nalikha na may iba't ibang configuration
- [ ] Parehong environment ang matagumpay na na-deploy
- [ ] Maaaring magpalit sa pagitan ng environment gamit ang `azd env select`
- [ ] Magkaiba ang mga environment variable sa bawat environment
- [ ] Matagumpay na nalinis ang parehong environment

## 📊 Ang Iyong Pag-unlad

**Oras na Ginugol**: ~60-90 minuto  
**Mga Kasanayang Nakuha**:
- ✅ Template-based na project initialization
- ✅ Azure resource provisioning
- ✅ Mga workflow sa application deployment
- ✅ Pamamahala ng environment
- ✅ Pamamahala ng configuration
- ✅ Resource cleanup at cost management

**Susunod na Antas**: Handa ka na para sa [Configuration Guide](configuration.md) upang matutunan ang mga advanced na pattern sa configuration!

## Pag-troubleshoot ng Karaniwang Mga Isyu

### Mga Error sa Authentication
```bash
# Muling mag-authenticate sa Azure
az login

# Tiyakin ang access sa subscription
az account show
```

### Mga Pagkabigo sa Deployment
```bash
# Paganahin ang debug logging
export AZD_DEBUG=true
azd up --debug

# Tingnan ang detalyadong mga log
azd logs --service api
azd logs --service web
```

### Mga Konflikto sa Pangalan ng Resource
```bash
# Gumamit ng natatanging pangalan ng kapaligiran
azd env new dev-$(whoami)-$(date +%s)
```

### Mga Isyu sa Port/Network
```bash
# Suriin kung may magagamit na mga port
netstat -an | grep :3000
netstat -an | grep :3100
```

## Mga Susunod na Hakbang

Ngayon na natapos mo ang iyong unang proyekto, tuklasin ang mga advanced na paksa:

### 1. I-customize ang Infrastructure
- [Infrastructure bilang Code](../deployment/provisioning.md)
- [Magdagdag ng mga database, storage, at iba pang serbisyo](../deployment/provisioning.md#adding-services)

### 2. Mag-set Up ng CI/CD
- [Integrasyon ng GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Mga Best Practice sa Production
- [Mga configuration sa seguridad](../deployment/best-practices.md#security)
- [Pag-optimize ng performance](../deployment/best-practices.md#performance)
- [Pag-monitor at pag-log](../deployment/best-practices.md#monitoring)

### 4. Tuklasin ang Higit Pang Mga Template
```bash
# Mag-browse ng mga template ayon sa kategorya
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Subukan ang iba't ibang teknolohiya stack
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Karagdagang Mga Resource

### Mga Materyales sa Pag-aaral
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunidad at Suporta
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komunidad ng Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mga Template at Halimbawa
- [Opisyal na Template Gallery](https://azure.github.io/awesome-azd/)
- [Mga Template ng Komunidad](https://github.com/Azure-Samples/azd-templates)
- [Mga Pattern ng Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Binabati kita sa pagtatapos ng iyong unang azd project!** Handa ka nang magtayo at mag-deploy ng mga kamangha-manghang aplikasyon sa Azure nang may kumpiyansa.

---

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Konpigurasyon](configuration.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- **Susunod na Aralin**: [Deployment Guide](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->