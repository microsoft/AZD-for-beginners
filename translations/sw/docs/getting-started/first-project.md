<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:31:46+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sw"
}
-->
# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Mafunzo haya ya kina yanakupa mwongozo wa hatua kwa hatua wa jinsi ya kuunda, kupeleka, na kusimamia programu kamili ya full-stack kwenye Azure kwa kutumia azd. Utatumia programu halisi ya todo inayojumuisha React frontend, Node.js API backend, na hifadhidata ya MongoDB.

## Malengo ya Kujifunza

Kwa kukamilisha mafunzo haya, utaweza:
- Kumudu mchakato wa kuanzisha mradi wa azd kwa kutumia templates
- Kuelewa muundo wa mradi wa Azure Developer CLI na faili za usanidi
- Kufanikisha upelekaji wa programu kamili kwenye Azure pamoja na miundombinu
- Kutekeleza mikakati ya kusasisha programu na kupeleka tena
- Kusimamia mazingira mengi kwa ajili ya maendeleo na majaribio
- Kutumia mbinu za kusafisha rasilimali na kudhibiti gharama

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kuanzisha na kusanidi miradi ya azd kutoka templates kwa uhuru
- Kupitia na kurekebisha miundo ya miradi ya azd kwa ufanisi
- Kuweka programu kamili kwenye Azure kwa kutumia amri moja
- Kutatua changamoto za kawaida za upelekaji na uthibitishaji
- Kusimamia mazingira mengi ya Azure kwa hatua tofauti za upelekaji
- Kutekeleza mchakato wa upelekaji endelevu kwa masasisho ya programu

## Kuanza

### Orodha ya Mahitaji Muhimu
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Usakinishaji](installation.md))
- ✅ Azure CLI imewekwa na kuthibitishwa
- ✅ Git imewekwa kwenye mfumo wako
- ✅ Node.js 16+ (kwa mafunzo haya)
- ✅ Visual Studio Code (inapendekezwa)

### Hakikisha Usanidi Wako
```bash
# Check azd installation
azd version
```
### Hakikisha Uthibitishaji wa Azure

```bash
az account show
```

### Angalia Toleo la Node.js
```bash
node --version
```

## Hatua ya 1: Chagua na Anzisha Template

Tuanze na template maarufu ya programu ya todo inayojumuisha React frontend na Node.js API backend.

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

### Nini Kimefanyika Hapa?
- Template ya msimbo imeshushwa kwenye folda yako ya ndani
- Faili `azure.yaml` imeundwa na maelezo ya huduma
- Msimbo wa miundombinu umewekwa kwenye folda ya `infra/`
- Usanidi wa mazingira umeundwa

## Hatua ya 2: Chunguza Muundo wa Mradi

Tuchunguze kile ambacho azd imeunda kwetu:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Unapaswa kuona:
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

### Faili Muhimu za Kuelewa

**azure.yaml** - Moyo wa mradi wako wa azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Ufafanuzi wa miundombinu:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Hatua ya 3: Badilisha Mradi Wako (Hiari)

Kabla ya kupeleka, unaweza kubadilisha programu:

### Badilisha Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Fanya mabadiliko rahisi:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Sanidi Vigezo vya Mazingira
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Hatua ya 4: Peleka kwenye Azure

Sasa kwa sehemu ya kusisimua - peleka kila kitu kwenye Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Nini Kinachotokea Wakati wa Upelekaji?

Amri ya `azd up` inafanya hatua hizi:
1. **Provision** (`azd provision`) - Huunda rasilimali za Azure
2. **Package** - Huandaa msimbo wa programu yako
3. **Deploy** (`azd deploy`) - Hupeleka msimbo kwenye rasilimali za Azure

### Matokeo Yanayotarajiwa
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Hatua ya 5: Jaribu Programu Yako

### Fikia Programu Yako
Bofya URL iliyotolewa kwenye matokeo ya upelekaji, au ipate wakati wowote:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengee cha todo** - Bofya "Add Todo" na ingiza kazi
2. **Weka alama kama imekamilika** - Angalia vipengee vilivyokamilika
3. **Futa vipengee** - Ondoa todos usivyohitaji tena

### Fuata Programu Yako
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Hatua ya 6: Fanya Mabadiliko na Upeleke Tena

Tufanye mabadiliko na tuone jinsi ilivyo rahisi kusasisha:

### Badilisha API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Ongeza kichwa cha majibu maalum:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Peleka Mabadiliko ya Msimbo Pekee
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Hatua ya 7: Simamia Mazingira Mengi

Unda mazingira ya majaribio ili kupima mabadiliko kabla ya uzalishaji:

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

### Ulinganisho wa Mazingira
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Hatua ya 8: Safisha Rasilimali

Unapomaliza kujaribu, safisha ili kuepuka gharama zinazoendelea:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Ulichojifunza

Hongera! Umefanikiwa:
- Kuanzisha mradi wa azd kutoka template
- Kuchunguza muundo wa mradi na faili muhimu
- Kuweka programu kamili kwenye Azure
- Kufanya mabadiliko ya msimbo na kupeleka tena
- Kusimamia mazingira mengi
- Kusafisha rasilimali

## Kutatua Changamoto za Kawaida

### Hitilafu za Uthibitishaji
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Kushindwa kwa Upelekaji
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Migongano ya Majina ya Rasilimali
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Changamoto za Bandari/Mtandao
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Hatua Zifuatazo

Sasa kwa kuwa umekamilisha mradi wako wa kwanza, chunguza mada hizi za juu:

### 1. Badilisha Miundombinu
- [Miundombinu kama Msimbo](../deployment/provisioning.md)
- [Ongeza hifadhidata, hifadhi, na huduma nyingine](../deployment/provisioning.md#adding-services)

### 2. Sanidi CI/CD
- [Ujumuishaji wa GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Mazoea Bora ya Uzalishaji
- [Usanidi wa usalama](../deployment/best-practices.md#security)
- [Uboreshaji wa utendaji](../deployment/best-practices.md#performance)
- [Ufuatiliaji na kumbukumbu](../deployment/best-practices.md#monitoring)

### 4. Chunguza Templates Zaidi
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

## Rasilimali za Ziada

### Vifaa vya Kujifunza
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Miundombinu ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Jamii na Usaidizi
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Jamii ya Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates na Mifano
- [Maktaba Rasmi ya Templates](https://azure.github.io/awesome-azd/)
- [Templates za Jamii](https://github.com/Azure-Samples/azd-templates)
- [Mifumo ya Biashara](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Hongera kwa kukamilisha mradi wako wa kwanza wa azd!** Sasa uko tayari kuunda na kupeleka programu za kushangaza kwenye Azure kwa kujiamini.

---

**Urambazaji**
- **Somo Lililopita**: [Usanidi](configuration.md)
- **Somo Linalofuata**: [Mwongozo wa Upelekaji](../deployment/deployment-guide.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.