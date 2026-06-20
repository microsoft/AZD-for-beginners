# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Mafunzo haya ya vitendo yanatoa mwongozo kamili wa kuunda, kupeleka, na kusimamia programu ya stack kamili kwenye Azure ukitumia azd. Utafanya kazi na programu halisi ya todo ambayo inajumuisha frontend ya React, backend ya API ya Node.js, na hifadhidata ya MongoDB.

## Malengo ya Kujifunza

Kwa kumaliza mafunzo haya, utakuwa umeweza:
- Kutumia mchakato wa kuanzisha mradi wa azd kwa kutumia templeti
- Kuelewa muundo wa mradi wa Azure Developer CLI na mafaili ya usanidi
- Kutekeleza utoaji kamili wa programu kwenye Azure pamoja na utekelezaji wa miundombinu
- Kutekeleza mabadiliko ya programu na mikakati ya kupeleka tena
- Kusimamia mazingira mengi kwa maendeleo na staging
- Kutumia mbinu za kusafisha rasilimali na usimamizi wa gharama

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kuanzisha na kusanidi miradi ya azd kutoka kwenye templeti kwa uhuru
- Kupitia na kubadili miundo ya mradi wa azd kwa ufanisi
- Kupeleka programu za stack kamili kwenye Azure kwa amri moja
- Kutatua matatizo ya kawaida ya utoaji na matatizo ya uthibitishaji
- Kusimamia mazingira mengi ya Azure kwa hatua mbalimbali za utoaji
- Kutekeleza mtiririko wa kuendelea wa utoaji kwa mabadiliko ya programu

## Kuanzia

### Orodha ya Mahitaji
- ✅ Azure Developer CLI imesakinishwa ([Mwongozo wa Ufungaji](installation.md))
- ✅ Uthibitishaji wa AZD umekamilika kwa `azd auth login`
- ✅ Git imesakinishwa kwenye mfumo wako
- ✅ Node.js 16+ (kwa mafunzo haya)
- ✅ Visual Studio Code (inayopendekezwa)

Kabla ya kuendelea, endesha validator ya usanidi kutoka kwenye mzizi wa repositori:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Thibitisha Usanidi Wako
```bash
# Kagua ufungaji wa azd
azd version

# Kagua uthibitishaji wa AZD
azd auth login --check-status
```

### Thibitisha uthibitishaji wa hiari wa Azure CLI

```bash
az account show
```

### Kagua toleo la Node.js
```bash
node --version
```

## Hatua 1: Chagua na Anzisha Templeti

Tuanze na templeti maarufu ya programu ya todo ambayo inajumuisha frontend ya React na backend ya API ya Node.js.

```bash
# Vinjari templeti zinazopatikana
azd template list

# Anzisha templeti ya programu ya todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Fuata maagizo:
# - Ingiza jina la mazingira: "dev"
# - Chagua usajili (ikiwa una zaidi ya moja)
# - Chagua eneo: "East US 2" (au eneo unalopendelea)
```

### Nini Kilitokea?
- Ilipakuliwa msimbo wa templeti kwenye saraka yako ya ndani
- Iliundwa faili ya `azure.yaml` yenye maelezo ya huduma
- Iliwekwa msimbo wa miundombinu katika saraka ya `infra/`
- Iliundwa usanidi wa mazingira

## Hatua 2: Chunguza Muundo wa Mradi

Tuchunguze kile azd kilitukusanyia:

```bash
# Tazama muundo wa mradi
tree /f   # Windows
# au
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

### Mafaili Muhimu ya Kuelewa

**azure.yaml** - Moyo wa mradi wako wa azd:
```bash
# Tazama usanidi wa mradi
cat azure.yaml
```

**infra/main.bicep** - Ufafanuzi wa miundombinu:
```bash
# Angalia msimbo wa miundombinu
head -30 infra/main.bicep
```

## Hatua 3: Boresha Mradi Wako (Hiari)

Kabla ya kupeleka, unaweza kuboresha programu:

### Badilisha Frontend
```bash
# Fungua komponenti ya programu ya React
code src/web/src/App.tsx
```

Fanya mabadiliko rahisi:
```typescript
// Tafuta kichwa na ubadilishe.
<h1>My Awesome Todo App</h1>
```

### Sanidi Vigezo vya Mazingira
```bash
# Weka vigezo vya mazingira vilivyobinafsishwa
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tazama vigezo vyote vya mazingira
azd env get-values
```

## Hatua 4: Peleka kwenye Azure

Sasa sehemu ya kusisimua - peleka kila kitu kwenye Azure!

```bash
# Sambaza miundombinu na programu
azd up

# Amri hii itafanya:
# 1. Tengeneza rasilimali za Azure (App Service, Cosmos DB, na kadhalika)
# 2. Jenga programu yako
# 3. Sambaza kwenye rasilimali zilizoanzishwa
# 4. Onyesha URL ya programu
```

### Nini Kinafanyika Wakati wa Utoaji?

Amri `azd up` inafanya hatua hizi:
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

## Hatua 5: Jaribu Programu Yako

### Fikia Programu Yako
Bonyeza kwenye URL iliyoonyeshwa katika matokeo ya utekelezaji, au upate wakati wowote:
```bash
# Pata miisho ya programu
azd show

# Fungua programu kwenye kivinjari chako
azd show --output json | jq -r '.services.web.endpoint'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengee cha todo** - Bonyeza "Add Todo" na ingiza kazi
2. **Alama kama imekamilika** - Angaza vitu vilivyokamilika
3. **Futa vipengee** - Ondoa todos ambazo hauhitaji tena

### Fuata Programu Yako
```bash
# Fungua portal ya Azure kwa rasilimali zako
azd monitor

# Tazama kumbukumbu za programu
azd monitor --logs

# Tazama vipimo vya wakati halisi
azd monitor --live
```

### ✅ Thibitisha Utoaji Wako

Kabla ya kuendelea, pitia orodha hii ya haraka ili kuthibitisha kila kitu kinafanya kazi kweli—usiweke kwa mtazamo kwamba "utoaji ulifanikiwa" inamaanisha "programu inafanya kazi":

```bash
# 1. Thibitisha kuwa endpoint ipo na inafikika
azd show

# 2. Fanya mtihani wa haraka wa endpoint (inatarajia HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Angalia endpoint ya afya ikiwa programu yako ina moja
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Utoaji unathibitishwa wakati:**
- ✅ `azd show` inaorodhesha URL ya mwisho inayoweza kufikiwa
- ✅ URL inafunguka kwenye kivinjari chako bila makosa
- ✅ Vipengele vya msingi vinafanya kazi (ongeza/amaliza/futa todo)
- ✅ `azd monitor --logs` inaonyesha maombi yanayofika bila makosa yasiyotegemewa

Kama cheki yoyote inashindwa, ruka kwenda [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/README.md).

## Hatua 6: Fanya Mabadiliko na Upeleke Tena

Tufanye mabadiliko na tuone jinsi ilivyo rahisi kusasisha:

### Badilisha API
```bash
# Hariri msimbo wa API
code src/api/src/routes/lists.js
```

Ongeza kichwa cha jibu maalum:
```javascript
// Tafuta mshughulikiaji wa njia na ongeza:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Peleka Mabadiliko ya Msimbo Pekee
```bash
# Weka tu msimbo wa programu (ruka miundombinu)
azd deploy

# Hii ni haraka zaidi kuliko 'azd up' kwa sababu miundombinu tayari ipo
```

## Hatua 7: Simamia Mazingira Mengi

Unda mazingira ya staging ili kujaribu mabadiliko kabla ya uzalishaji:

```bash
# Unda mazingira mapya ya majaribio
azd env new staging

# Sambaza kwenye mazingira ya majaribio
azd up

# Rudi kwenye mazingira ya maendeleo
azd env select dev

# Orodhesha mazingira yote
azd env list
```

### Ulinganisho wa Mazingira
```bash
# Tazama mazingira ya maendeleo
azd env select dev
azd show

# Tazama mazingira ya maandalizi
azd env select staging
azd show
```

## Hatua 8: Safisha Rasilimali

Wakati umemaliza kujaribu, safisha ili kuepuka gharama zinazoendelea:

```bash
# Futa rasilimali zote za Azure za mazingira ya sasa
azd down

# Lazimisha ufutaji bila uthibitisho na ondoa kabisa rasilimali zilizofutwa kwa muda
azd down --force --purge

# Futa mazingira maalum
azd env select staging
azd down --force --purge
```

## Programu ya Klasiki vs. Programu Inayoendeshwa na AI: Mchakato Mmoja wa Kazi

Umepeleka tu programu ya wavuti ya jadi. Lakini vipi kama ungetaka kupeleka programu inayoendeshwa na AI—kwa mfano, programu ya chat inayotegemea Microsoft Foundry Models?

Habari njema: **mchakato ni ule ule.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Tofauti pekee ni **kiolezo (template)** unachoanza nalo. Templeti ya AI inajumuisha miundombinu ya ziada (kama rasilimali ya Microsoft Foundry Models au index ya AI Search), lakini azd inashughulikia yote hayo kwa niaba yako. Huhitaji kujifunza amri mpya, kutumia zana tofauti, au kubadili jinsi unavyofikiria kuhusu utoaji.

Hii ni kanuni kuu ya azd: **mchakato mmoja wa kazi, aina yoyote ya kazi.** Ujuzi uliofanya mazoezi nayo katika mafunzo haya—kuanzisha, kupeleka, kufuatilia, kupeleka tena, na kusafisha—zinatekelezwa sawa kwa programu za AI na mawakala.

---

## Uliyojifunza

Hongera! Umefanikiwa:
- ✅ Kuanzisha mradi wa azd kutoka kwenye templeti
- ✅ Kupitia muundo wa mradi na mafaili muhimu
- ✅ Kupeleka programu ya stack kamili kwenye Azure
- ✅ Kufanya mabadiliko ya msimbo na kupeleka tena
- ✅ Kusimamia mazingira mengi
- ✅ Kusafisha rasilimali

## 🎯 Mazoezi ya Kuhakikisha Ujuzi

### Zoefunzi 1: Peleka Templeti Tofauti (dakika 15)
**Lengo**: Onyesha ustadi wa `azd init` na mchakato wa utoaji

```bash
# Jaribu stack ya Python na MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Thibitisha uanzishaji
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Programu inaelekezwa bila makosa
- [ ] Inaweza kufikiwa URL ya programu kwenye kivinjari
- [ ] Programu inafanya kazi vizuri (ongeza/ondoa todos)
- [ ] Rasilimali zote zilisafishwa kwa mafanikio

### Zoefunzi 2: Binafsisha Usanidi (dakika 20)
**Lengo**: Fanya mazoezi ya usanidi wa vigezo vya mazingira

```bash
cd my-first-azd-app

# Unda mazingira maalum
azd env new custom-config

# Weka vigezo maalum
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Thibitisha vigezo
azd env get-values | grep APP_TITLE

# Sambaza kwa usanidi maalum
azd up
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira maalum yaliundwa kwa mafanikio
- [ ] Vigezo vya mazingira vimesetishwa na vinapatikana
- [ ] Programu inapelekwa na usanidi maalum
- [ ] Inaweza kuthibitisha mipangilio maalum kwenye programu iliyopelekwa

### Zoefunzi 3: Mtiririko wa Kazi wa Mazingira Nyingi (dakika 25)
**Lengo**: Kuwa mtaalamu wa usimamizi wa mazingira na mikakati ya utoaji

```bash
# Unda mazingira ya maendeleo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Kumbuka URL ya mazingira ya maendeleo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Unda mazingira ya maandalizi
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Kumbuka URL ya mazingira ya maandalizi
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Linganisha mazingira
azd env list

# Jaribu mazingira yote mawili
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Safisha mazingira yote mawili
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira mawili yaliundwa na usanidi tofauti
- [ ] Mazingira yote yalipelekwa kwa mafanikio
- [ ] Inaweza kubadilisha kati ya mazingira kwa kutumia `azd env select`
- [ ] Vigezo vya mazingira vinatofautiana kati ya mazingira
- [ ] Mazingira yote yalifutwa kwa mafanikio

## 📊 Maendeleo Yako

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: Uko tayari kwa [Configuration Guide](configuration.md) kujifunza mifumo ya usanidi ya juu!

## Utatuzi wa Matatizo ya Kawaida

### Makosa ya Uthibitishaji
```bash
# Thibitisha tena na Azure
az login

# Thibitisha ufikiaji wa usajili
az account show
```

### Mtafutio wa Utoaji
```bash
# Washa uandishi wa kumbukumbu za utatuzi
export AZD_DEBUG=true
azd up --debug

# Tazama kumbukumbu za programu katika Azure
azd monitor --logs

# Kwa Container Apps, tumia Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Migogoro ya Majina ya Rasilimali
```bash
# Tumia jina la mazingira la kipekee
azd env new dev-$(whoami)-$(date +%s)
```

### Masuala ya Bandari/ Mtandao
```bash
# Angalia ikiwa bandari zinapatikana
netstat -an | grep :3000
netstat -an | grep :3100
```

## Hatua Zifuatazo

Sasa umeimaliza mradi wako wa kwanza, chunguza mada hizi za juu:

### 1. Binafsisha Miundombinu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sanidi CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Mifumo Bora ya Uzalishaji
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Security, performance, and monitoring

### 4. Chunguza Templeti Zaidi
```bash
# Vinjari templeti kwa kategoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Jaribu mseto tofauti wa teknolojia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Rasilimali Zaidi

### Vifaa vya Kujifunza
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Jamii & Msaada
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templeti & Mifano
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Hongera kwa kumaliza mradi wako wa kwanza wa azd!** Sasa uko tayari kujenga na kupeleka programu za kushangaza kwenye Azure kwa kujiamini.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->