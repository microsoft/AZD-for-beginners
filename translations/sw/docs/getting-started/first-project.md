<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "483bc6a036553e531b9af4d1d9dec31e",
  "translation_date": "2025-09-10T05:57:04+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sw"
}
-->
# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Mafunzo haya ya vitendo yanakupa mwongozo kamili wa jinsi ya kuunda, kupeleka, na kusimamia programu kamili ya stack kwenye Azure kwa kutumia azd. Utashughulikia programu halisi ya todo inayojumuisha frontend ya React, backend ya Node.js API, na hifadhidata ya MongoDB.

## Malengo ya Kujifunza

Kwa kukamilisha mafunzo haya, utaweza:
- Kuelewa mchakato wa kuanzisha mradi wa azd kwa kutumia templates
- Kuelewa muundo wa mradi wa Azure Developer CLI na faili za usanidi
- Kuendesha mchakato wa kupeleka programu kamili kwenye Azure pamoja na utoaji wa miundombinu
- Kutekeleza mikakati ya kusasisha programu na kupeleka tena
- Kusimamia mazingira mengi kwa ajili ya maendeleo na majaribio
- Kutumia mbinu za kusafisha rasilimali na kudhibiti gharama

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kuanzisha na kusanidi miradi ya azd kutoka templates kwa uhuru
- Kuendesha na kurekebisha muundo wa miradi ya azd kwa ufanisi
- Kupeleka programu kamili za stack kwenye Azure kwa kutumia amri moja
- Kutatua matatizo ya kawaida ya kupeleka na masuala ya uthibitishaji
- Kusimamia mazingira mengi ya Azure kwa hatua tofauti za kupeleka
- Kutekeleza mchakato wa kupeleka endelevu kwa sasisho za programu

## Kuanzisha

### Orodha ya Vitu vya Awali
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Usakinishaji](installation.md))
- ✅ Azure CLI imewekwa na kuthibitishwa
- ✅ Git imewekwa kwenye mfumo wako
- ✅ Node.js 16+ (kwa mafunzo haya)
- ✅ Visual Studio Code (inapendekezwa)

### Thibitisha Usanidi Wako
```bash
# Check azd installation
azd version

# Verify Azure authentication
az account show

# Check Node.js version
node --version
```

## Hatua ya 1: Chagua na Anzisha Template

Tuanzie na template maarufu ya programu ya todo inayojumuisha frontend ya React na backend ya Node.js API.

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

### Nini Kimefanyika?
- Umepakua msimbo wa template kwenye saraka yako ya ndani
- Umeunda faili ya `azure.yaml` yenye maelezo ya huduma
- Umeweka msimbo wa miundombinu kwenye saraka ya `infra/`
- Umeunda usanidi wa mazingira

## Hatua ya 2: Chunguza Muundo wa Mradi

Hebu tuangalie kile azd imeunda kwetu:

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

## Hatua ya 3: Rekebisha Mradi Wako (Hiari)

Kabla ya kupeleka, unaweza kubadilisha programu:

### Rekebisha Frontend
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
azd env set API_VERSION "v1.0.0"

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

### Nini Kinachotokea Wakati wa Upelekwaji?

Amri ya `azd up` inafanya hatua hizi:
1. **Provision** (`azd provision`) - Inaunda rasilimali za Azure
2. **Package** - Inajenga msimbo wa programu yako
3. **Deploy** (`azd deploy`) - Inapeleka msimbo kwenye rasilimali za Azure

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
Bonyeza URL iliyotolewa kwenye matokeo ya upelekwaji, au ipate wakati wowote:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengee cha todo** - Bonyeza "Add Todo" na ingiza kazi
2. **Weka alama kama imekamilika** - Angalia vipengee vilivyokamilika
3. **Futa vipengee** - Ondoa todo usivyohitaji tena

### Fuatilia Programu Yako
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Hatua ya 6: Fanya Mabadiliko na Peleka Tena

Hebu tufanye mabadiliko na tuone jinsi ilivyo rahisi kusasisha:

### Rekebisha API
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

Unda mazingira ya majaribio ili kujaribu mabadiliko kabla ya uzalishaji:

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

Ukimaliza kujaribu, safisha ili kuepuka gharama zinazoendelea:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Ulichopata

Hongera! Umefanikiwa:
- Kuanzisha mradi wa azd kutoka template
- Kuchunguza muundo wa mradi na faili muhimu
- Kupeleka programu kamili ya stack kwenye Azure
- Kufanya mabadiliko ya msimbo na kupeleka tena
- Kusimamia mazingira mengi
- Kusafisha rasilimali

## Kutatua Masuala ya Kawaida

### Makosa ya Uthibitishaji
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Kushindwa kwa Upelekwaji
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

### Masuala ya Bandari/Mtandao
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Hatua Zifuatazo

Sasa kwa kuwa umekamilisha mradi wako wa kwanza, chunguza mada hizi za juu:

### 1. Rekebisha Miundombinu
- [Miundombinu kama Msimbo](../deployment/provisioning.md)
- [Ongeza hifadhidata, uhifadhi, na huduma nyingine](../deployment/provisioning.md#adding-services)

### 2. Sanidi CI/CD
- [Ujumuishaji wa GitHub Actions](../deployment/cicd-integration.md)
- [Mitaro ya Azure DevOps](../deployment/cicd-integration.md#azure-devops)

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
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Jamii na Usaidizi
- [GitHub ya Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Jamii ya Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates na Mifano
- [Matunzio Rasmi ya Template](https://azure.github.io/awesome-azd/)
- [Templates za Jamii](https://github.com/Azure-Samples/azd-templates)
- [Mifumo ya Biashara](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Hongera kwa kukamilisha mradi wako wa kwanza wa azd!** Sasa uko tayari kujenga na kupeleka programu za kushangaza kwenye Azure kwa kujiamini.

---

**Urambazaji**
- **Somo la Awali**: [Usanidi](configuration.md)
- **Somo Linalofuata**: [Mwongozo wa Upelekwaji](../deployment/deployment-guide.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.