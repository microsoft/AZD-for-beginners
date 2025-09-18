<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T08:29:21+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "tl"
}
-->
# Ang Iyong Unang Proyekto - Tutorial na Hands-On

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Konpigurasyon](configuration.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## Panimula

Maligayang pagdating sa iyong unang proyekto gamit ang Azure Developer CLI! Ang komprehensibong tutorial na ito ay nagbibigay ng kumpletong walkthrough sa paggawa, pag-deploy, at pamamahala ng isang full-stack na application sa Azure gamit ang azd. Magtatrabaho ka sa isang totoong todo application na may React frontend, Node.js API backend, at MongoDB database.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng tutorial na ito, ikaw ay:
- Magiging bihasa sa workflow ng pag-initialize ng azd project gamit ang mga template
- Maiintindihan ang istruktura ng proyekto ng Azure Developer CLI at mga configuration file
- Maisasagawa ang kumpletong pag-deploy ng application sa Azure kasama ang provisioning ng infrastructure
- Makakagawa ng mga update sa application at mga estratehiya sa redeployment
- Makakapamahala ng maraming environment para sa development at staging
- Makakapagpatupad ng mga kasanayan sa resource cleanup at cost management

## Mga Resulta ng Pag-aaral

Sa pagtatapos, magagawa mo:
- Mag-initialize at mag-configure ng mga azd project mula sa mga template nang mag-isa
- Mag-navigate at mag-modify ng mga istruktura ng azd project nang epektibo
- Mag-deploy ng full-stack na application sa Azure gamit ang isang command
- Mag-troubleshoot ng mga karaniwang isyu sa deployment at authentication
- Mag-manage ng maraming Azure environment para sa iba't ibang yugto ng deployment
- Magpatupad ng mga workflow para sa tuloy-tuloy na pag-deploy ng mga update sa application

## Pagsisimula

### Checklist ng Mga Kinakailangan
- ✅ Na-install ang Azure Developer CLI ([Gabay sa Pag-install](installation.md))
- ✅ Na-install at authenticated ang Azure CLI
- ✅ Na-install ang Git sa iyong sistema
- ✅ Node.js 16+ (para sa tutorial na ito)
- ✅ Visual Studio Code (inirerekomenda)

### I-verify ang Iyong Setup
```bash
# Check azd installation
azd version
```
### I-verify ang Authentication sa Azure

```bash
az account show
```

### Suriin ang Bersyon ng Node.js
```bash
node --version
```

## Hakbang 1: Pumili at Mag-initialize ng Template

Simulan natin sa isang sikat na template ng todo application na may React frontend at Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Ano ang Nangyari?
- Na-download ang code ng template sa iyong lokal na direktoryo
- Nilikha ang `azure.yaml` file na may mga service definition
- Na-setup ang infrastructure code sa direktoryong `infra/`
- Nilikha ang configuration ng environment

## Hakbang 2: Tuklasin ang Istruktura ng Proyekto

Suriin natin kung ano ang nilikha ng azd para sa atin:

```bash
# View the project structure
tree /f   # Windows
# or
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Depinisyon ng infrastructure:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Hakbang 3: I-customize ang Iyong Proyekto (Opsyonal)

Bago mag-deploy, maaari mong i-customize ang application:

### I-modify ang Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Gumawa ng simpleng pagbabago:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### I-configure ang Mga Environment Variable
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Hakbang 4: I-deploy sa Azure

Narito na ang kapanapanabik na bahagi - i-deploy ang lahat sa Azure!

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

Ang `azd up` command ay gumagawa ng mga sumusunod na hakbang:
1. **Provision** (`azd provision`) - Lumilikha ng mga resource sa Azure
2. **Package** - Binubuo ang code ng iyong application
3. **Deploy** (`azd deploy`) - Ipinapadala ang code sa mga resource ng Azure

### Inaasahang Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Hakbang 5: Subukan ang Iyong Application

### I-access ang Iyong Application
I-click ang URL na ibinigay sa deployment output, o kunin ito anumang oras:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Subukan ang Todo App
1. **Magdagdag ng todo item** - I-click ang "Add Todo" at maglagay ng task
2. **Markahan bilang tapos** - I-check ang mga natapos na item
3. **Tanggalin ang mga item** - Alisin ang mga todo na hindi mo na kailangan

### I-monitor ang Iyong Application
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Hakbang 6: Gumawa ng Mga Pagbabago at I-redeploy

Gumawa tayo ng pagbabago at tingnan kung gaano kadali ang mag-update:

### I-modify ang API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Magdagdag ng custom na response header:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### I-deploy ang Mga Pagbabago sa Code Lamang
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Hakbang 7: Pamahalaan ang Maraming Environment

Gumawa ng staging environment para subukan ang mga pagbabago bago ang production:

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

## Hakbang 8: Linisin ang Mga Resource

Kapag tapos ka nang mag-eksperimento, linisin ang mga resource para maiwasan ang patuloy na singil:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Ano ang Iyong Natutunan

Binabati kita! Matagumpay mong:
- Na-initialize ang isang azd project mula sa template
- Nasuri ang istruktura ng proyekto at mga pangunahing file
- Na-deploy ang isang full-stack na application sa Azure
- Gumawa ng mga pagbabago sa code at na-redeploy
- Napamahalaan ang maraming environment
- Nalinis ang mga resource

## Pag-troubleshoot ng Mga Karaniwang Isyu

### Mga Error sa Authentication
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Mga Pagkabigo sa Deployment
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
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

Ngayon na natapos mo ang iyong unang proyekto, tuklasin ang mga advanced na paksa:

### 1. I-customize ang Infrastructure
- [Infrastructure bilang Code](../deployment/provisioning.md)
- [Magdagdag ng mga database, storage, at iba pang serbisyo](../deployment/provisioning.md#adding-services)

### 2. Mag-setup ng CI/CD
- [Integrasyon ng GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Mga Praktika para sa Production
- [Mga configuration sa seguridad](../deployment/best-practices.md#security)
- [Pag-optimize ng performance](../deployment/best-practices.md#performance)
- [Pag-monitor at pag-log](../deployment/best-practices.md#monitoring)

### 4. Tuklasin ang Higit Pang Mga Template
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Karagdagang Mga Resource

### Mga Materyal sa Pag-aaral
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
- [Mga Pattern para sa Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Binabati kita sa pagtatapos ng iyong unang azd project!** Handa ka nang magtayo at mag-deploy ng mga kahanga-hangang application sa Azure nang may kumpiyansa.

---

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Pag-install at Setup](installation.md)
- **➡️ Susunod**: [Konpigurasyon](configuration.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)
- **Susunod na Aralin**: [Gabay sa Deployment](../deployment/deployment-guide.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na pinagmulan. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.