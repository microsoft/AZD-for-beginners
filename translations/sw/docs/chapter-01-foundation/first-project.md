# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

**UshNavigation wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi & Mwanzo wa Haraka
- **⬅️ Iliyopita**: [Usanidi & Ufungaji](installation.md)
- **➡️ Ifuatayo**: [Leta Programu Yako](bring-your-own-app.md)
- **🚀 Sura Ifuatayo**: [Sura 2: Uendelezaji wa AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Utaweka programu ya todo yenye sehemu ya mbele ya React, API ya Node.js, na Azure Cosmos DB. Kiolezo kinaendelea kutumia jina la kihistoria `todo-nodejs-mongo`; miundombinu yake ya sasa inatumia Cosmos DB kwa NoSQL, hivyo angalia README iliyopakuliwa na `infra/` badala ya kufasiri API ya database kutoka kwa jina.

> Imepitiwa dhidi ya `azd 1.37.2` na kiolezo cha umma mnamo Novemba 2026. Mifano hapa chini inatumia Bash; uondoaji wa JSON pia unahitaji `jq`. Usambazaji wa Azure hulipisha na haukufanyika wakati wa mapitio haya.

## Malengo ya Kujifunza

Kwa kukamilisha mafunzo haya, utakuwa na uwezo wa:
- Kustarehesha mtiririko wa kuanzisha mradi wa azd kwa kutumia violezo
- Kuelewa muundo wa mradi wa Azure Developer CLI na faili za usanidi
- Kutekeleza usambazaji kamili wa programu kwenye Azure pamoja na utoaji wa miundombinu
- Kutekeleza mabadiliko ya programu na mikakati ya kusambazika tena
- Kusimamia mazingira mengi kwa maendeleo na majaribio
- Kutumia mbinu za kusafisha rasilimali na usimamizi wa gharama

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kuanza na kusanidi miradi ya azd kutoka violezo kwa uhuru
- Kutambua na kurekebisha miundo ya miradi ya azd kwa ufanisi
- Kusambaza programu zote za full-stack kwenye Azure kwa amri moja
- Kutatua matatizo ya kawaida ya usambazaji na matatizo ya uthibitishaji
- Kusimamia mazingira mengi ya Azure kwa hatua tofauti za usambazaji
- Kutekeleza mtiririko endelevu wa usambazaji kwa masasisho ya programu

## Kuanzisha

### Orodha ya Vitu vya Kuandaa
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Ufungaji](installation.md))
- ✅ AZD imethibitishwa kwa kutumia `azd auth login`
- ✅ Git imewekwa kwenye mfumo wako
- ✅ Node.js 22 LTS (au toleo linaloungwa mkono linalohitajika na kiolezo kilichopakuliwa)
- ✅ Visual Studio Code (inapendekezwa)

Kabla ya kuendelea, endesha mtathmini wa usanidi kutoka kwenye mzizi wa hifadhidata:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Thibitisha Usanidi Wako
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Thibitisha uthibitishaji wa Azure CLI hiari

```bash
az account show
```

### Angalia toleo la Node.js
```bash
node --version
```

## Hatua ya 1: Chagua na Anzisha Kiolezo

Tuanze na kiolezo cha programu ya todo maarufu kinachojumuisha sehemu ya mbele ya React na sehemu ya nyuma ya API ya Node.js.

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

### Nini Kilitokea?
- Kiolezo cha msimbo kimepakuliwa kwenye saraka yako ya eneo
- Imetengenezwa faili la `azure.yaml` lenye maelezo ya huduma
- Kuweka msimbo wa miundombinu kwenye saraka ya `infra/`
- Kuingiza usanidi wa mazingira

## Hatua ya 2: Chunguza Muundo wa Mradi

Tuchunguze kile ambacho azd imetengeneza kwetu:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Unapaswa kuona:
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

Kabla ya kusambaza, unaweza kubadilisha programu:

### Badilisha Sehemu ya Mbele
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Fanya mabadiliko rahisi:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Sanidi Vigezo vya Mazingira
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Thamani hizi mbili maalum zinaonyesha kuhifadhiwa kwa eneo tu. Kiolezo cha hisa hakitumii `WEBSITE_TITLE` au `API_VERSION`, hivyo hazibadilishi programu. Marekebisho ya chanzo yaliyotakazwa hapo juu hubadilisha kichwa kinachoonyeshwa.

## Hatua ya 4: Sambaza kwa Azure

Sasa sehemu ya kusisimua - sambaza kila kitu kwenye Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Nini Kinatokea Wakati wa Usambazaji?

Mtiririko hutoa miundombinu na kufunga/kusambaza msimbo. Mfuatano halisi unaweza kubadilishwa kupitia `workflows.up` katika `azure.yaml`; kiolezo hiki kinaonyesha kutoa miundombinu ikifuatiwa na usambazaji. Usitegemee awamu moja kwa kila kiolezo.

### Vile Vinavyotarajiwa Kutokea
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Hatua ya 5: Jaribu Programu Yako

### Pata Programu Yako
Bonyeza URL iliyotolewa katika matokeo ya usambazaji, au upate wakati wowote:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengele cha todo** - Bonyeza "Add Todo" na ingiza kazi
2. **Tia alama kama imekamilika** - Angalia vitu vilivyokamilika
3. **Futa vitu** - Ondoa todos usizohitaji tena

### Simamia Programu Yako
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Thibitisha Usambazaji Wako

Kabla ya kuendelea, pitia orodha hii haraka kuthibitisha kila kitu kinafanya kazi kweli—usidhani "usambazaji umefanikiwa" inamaanisha "programu inafanya kazi":

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

**Usambazaji unathibitishwa pale:**
- ✅ `azd show` inaorodhesha URL inayoweza kufikiwa
- ✅ URL inafunguka kwenye kivinjari chako bila makosa
- ✅ Vipengele vikuu vinafanya kazi (ongeza/kamilisha/futa todo)
- ✅ `azd monitor --logs` inaonyesha maombi yanayofika bila makosa yasiyotegemewa

Ikiwa ukaguzi wowote unashindwa, ruka kwenda [Sura 7: Kutatua Matatizo](../chapter-07-troubleshooting/README.md).

## Hatua ya 6: Fanya Mabadiliko na Sambaza Tena

Tufanye mabadiliko na tuone jinsi ilivyo rahisi kusasisha:

### Badilisha API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Ongeza kichwa cha jibu kilichobinafsishwa:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sambaza Mabadiliko ya Msimbo Pekee
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Hatua ya 7: Simamia Mazingira Mengi

Unda mazingira ya kujaribu mabadiliko kabla ya kuzalisha:

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

Ukimaliza majaribio, safisha ili kuepuka malipo endelevu:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Programu Kawaida vs. Programu Iliyotiwa Nguvu na AI: Mtiririko Mmoja

Umenawasambaza programu ya wavuti ya kawaida. Lakini je, ungependa kusambaza programu inayotumia AI kama programu ya mazungumzo yenye msingi wa Microsoft Foundry Models?

Habari njema: **mtiririko ni sawa kabisa.**

| Hatua | Programu ya Todo ya Kawaida | Programu ya Mazungumzo ya AI |
|------|-----------------|-------------|
| Anzisha (saraka tupu) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Thibitisha | `azd auth login` | `azd auth login` |
| Sambaza | `azd up` | `azd up` |
| Simamia | `azd monitor` | `azd monitor` |
| Safisha | `azd down --force --purge` | `azd down --force --purge` |

Amri za mzunguko ni sawa, lakini mahitaji ya awali yanatofautiana. Kiolezo cha AI kinaweza kuhitaji upatikanaji wa modeli, kiwango cha kikanda, uingizaji data, na usanidi wa ziada. Soma README yake kabla ya usambazaji; `azd up` haiwezi kutoa ruhusa au kiwango kinachokosekana.

Huu ndiyo msingi mkuu wa azd: **mtiririko mmoja, mzigo wowote.** Ujuzi uliyojifunza katika mafunzo haya—kuanzisha, kusambaza, kusimamia, kusambaza tena, na kusafisha—unatumika sawa kwa programu za AI na mawakala.

---

## Uliyojifunza

Hongera! Umefanikiwa:
- ✅ Kuanzisha mradi wa azd kutoka kwenye kiolezo
- ✅ Kuchunguza muundo wa mradi na faili muhimu
- ✅ Kusambaza programu ya full-stack kwenye Azure
- ✅ Kufanya mabadiliko ya msimbo na kusambaza tena
- ✅ Kusimamia mazingira mengi
- ✅ Kusafisha rasilimali

## 🎯 Mazoezi ya Kuhakikisha Ujuzi

### Zozi la 1: Sambaza Kiolezo Tofauti (dakika 15)
**Lengo**: Onyesha ustadi wa azd init na mtiririko wa usambazaji

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

**Vigezo vya Mafanikio:**
- [ ] Programu inasambazwa bila makosa
- [ ] Inaweza kufikiwa URL ya programu kwenye kivinjari
- [ ] Programu inafanya kazi ipasavyo (ongeza/ondoa todos)
- [ ] Rasilimali zote zimesafishwa kwa mafanikio

### Zozi la 2: Badilisha Usanidi (dakika 20)
**Lengo**: Fanya mazoezi ya kuhifadhi thamani za mazingira kwa ndani bila kuzichanganya na usanidi wa wakati wa utekelezaji

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

**Vigezo vya Mafanikio:**
- [ ] Mazingira maalum yameundwa kwa mafanikio
- [ ] Vigezo vya mazingira vimewekwa na vinaweza kupatikana
- [ ] `azd env get-value APP_TITLE` inaandika `My Custom Todo App`
- [ ] Inaweza kueleza kwanini thamani hizi hazibadilishi programu ya hisa isipokuwa msimbo/miundombinu vitavitumia

### Zozi la 3: Mtiririko wa Mazingira Mengi (dakika 25)
**Lengo**: Jifunze kusimamia mazingira na mikakati ya usambazaji

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

**Vigezo vya Mafanikio:**
- [ ] Mazingira mawili yameundwa na usanidi tofauti
- [ ] Mazingira yote yameteseka kusambaza kwa mafanikio
- [ ] Inaweza kubadilisha kati ya mazingira kwa kutumia `azd env select`
- [ ] Vigezo vya mazingira vinatofautiana kati ya mazingira
- [ ] Mazingira yote yamesafishwa kwa mafanikio

## 📊 Maendeleo Yako

**Muda Uliotumika**: ~dakika 60-90  
**Ujuzi Uliopata**:
- ✅ Kuanzisha miradi kwa kutumia violezo
- ✅ Utoaji wa rasilimali Azure
- ✅ Mtiririko wa usambazaji wa programu
- ✅ Usimamizi wa mazingira
- ✅ Usanidi wa vipengele
- ✅ Usafishaji wa rasilimali na usimamizi wa gharama

**Kipindi Kifuatacho**: Uko tayari kwa [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md) kujifunza mifumo ya usanidi ya hali ya juu!

## Kutatua Matatizo ya Kawaida

### Makosa ya Uthibitishaji
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Kushindwa Kusambaza
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Migogoro ya Majina ya Rasilimali
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Matatizo ya Bandari/Mtandao
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Hatua Zinazofuata

Sasa baada ya kumaliza mradi wako wa kwanza, chunguza mada hizi za juu:

### 1. Badilisha Miundombinu
- [Miundombinu kama Msimbo](../chapter-04-infrastructure/provisioning.md)
- [Ongeza miundombinu ya database](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Sanidi CI/CD
- [Mwongozo wa Usambazaji](../chapter-04-infrastructure/deployment-guide.md) - Mtiririko kamili wa CI/CD
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Usanidi wa pipeline

### 3. Mbinu Bora za Uzalishaji
- [Mwongozo wa Usambazaji](../chapter-04-infrastructure/deployment-guide.md) - Usalama, utendaji, na usimamizi

### 4. Chunguza Violezo Zaidi
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

## Rasilimali Zaidi

### Vifaa vya Kujifunza
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Mimarishaji wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo Bora wa Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Jamii & Msaada
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Jumuiya ya Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Violezo & Mifano
- [Matunzio Rasmi ya Violezo](https://azure.github.io/awesome-azd/)
- [Machango ya Violezo vya Jamii](https://github.com/Azure/awesome-azd)
- [Chanzo cha Kiolezo cha Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Hongera kwa kumaliza mradi wako wa kwanza wa azd!** Sasa uko tayari kujenga na kusambaza programu za kushangaza kwenye Azure kwa kujiamini.

---

**UshNavigation wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi & Mwanzo wa Haraka
- **⬅️ Iliyopita**: [Usanidi & Ufungaji](installation.md)
- **➡️ Ifuatayo**: [Leta Programu Yako](bring-your-own-app.md)
- **🚀 Sura Ifuatayo**: [Sura 2: Uendelezaji wa AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->