# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

**Chapter Navigation:**
- **📚 Course Home**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Current Chapter**: Sura 1 - Msingi & Mwanzo wa Haraka
- **⬅️ Previous**: [Ufungaji & Usanidi](installation.md)
- **➡️ Next**: [Usanidi](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Mafunzo haya ya vitendo yanaonyesha hatua kwa hatua jinsi ya kuunda, kusakinisha, na kusimamia programu kamili kwenye Azure kwa kutumia azd. Utafanya kazi na programu halisi ya todo ambayo inajumuisha frontend ya React, backend ya API ya Node.js, na hifadhidata ya MongoDB.

## Malengo ya Kujifunza

Kwa kumaliza mafunzo haya, utakuwa:
- Kupata ujuzi wa mtiririko wa kuanzisha mradi wa azd kwa kutumia violezo
- Kuelewa muundo wa mradi wa Azure Developer CLI na mafaili ya usanidi
- Kutekeleza usakinishaji kamili wa programu kwenye Azure pamoja na utoaji wa miundombinu
- Kutekeleza masasisho ya programu na mikakati ya usakinishaji upya
- Kusimamia mazingira mengi kwa ajili ya maendeleo na staging
- Kutumia mbinu za kusafisha rasilimali na usimamizi wa gharama

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kuanzisha na kusanidi miradi ya azd kutoka kwa violezo kwa uhuru
- Kupitia na kubadilisha miundo ya miradi ya azd kwa ufanisi
- Kusakinisha programu za full-stack kwenye Azure kwa amri moja
- Kutatua matatizo ya kawaida ya usakinishaji na matatizo ya uthibitishaji
- Kusimamia mazingira mbalimbali ya Azure kwa hatua tofauti za usakinishaji
- Kutumia mtiririko wa utumiaji endelevu wa kusakinisha masasisho ya programu

## Kuanzia

### Orodha ya Mahitaji ya Awali
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Ufungaji](installation.md))
- ✅ Azure CLI imewekwa na imeidhinishwa
- ✅ Git imewekwa kwenye mfumo wako
- ✅ Node.js 16+ (kwa mafunzo haya)
- ✅ Visual Studio Code (inayopendekezwa)

### Thibitisha Mipangilio Yako
```bash
# Angalia usakinishaji wa azd
azd version
```
### Thibitisha uthibitishaji wa Azure

```bash
az account show
```

### Kagua toleo la Node.js
```bash
node --version
```

## Hatua 1: Chagua na Anzisha Kiolezo

Tuanze na kiolezo maarufu cha programu ya todo kinachojumuisha frontend ya React na backend ya API ya Node.js.

```bash
# Vinjari templeti zinazopatikana
azd template list

# Anzisha templeti ya programu ya orodha ya kazi
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Fuata maelekezo:
# - Ingiza jina la mazingira: "dev"
# - Chagua usajili (ikiwa una zaidi ya moja)
# - Chagua mkoa: "East US 2" (au mkoa unaoupendelea)
```

### Nini Kilitokea?
- Imepakuliwa msimbo wa kiolezo kwenye saraka yako ya ndani
- Iliundwa faili `azure.yaml` yenye ufafanuzi wa huduma
- Iliandaa msimbo wa miundombinu katika saraka `infra/`
- Iliundwa usanidi wa mazingira

## Hatua 2: Chunguza Muundo wa Mradi

Tuchunguze kile ambacho azd kilitutengenezea:

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

**azure.yaml** - Msingi wa mradi wako wa azd:
```bash
# Tazama usanidi wa mradi
cat azure.yaml
```

**infra/main.bicep** - Ufafanuzi wa miundombinu:
```bash
# Tazama msimbo wa miundombinu
head -30 infra/main.bicep
```

## Hatua 3: Binafsisha Mradi Wako (Hiari)

Kabla ya kusakinisha, unaweza kubinafsisha programu:

### Badilisha Frontend
```bash
# Fungua komponenti ya programu ya React
code src/web/src/App.tsx
```

Fanya mabadiliko rahisi:
```typescript
// Tafuta kichwa na ubadilishe
<h1>My Awesome Todo App</h1>
```

### Sanidi Vigezo vya Mazingira
```bash
# Weka vigezo maalum vya mazingira
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tazama vigezo vyote vya mazingira
azd env get-values
```

## Hatua 4: Sakinisha kwenye Azure

Sasa sehemu ya kusisimua - sakinisha kila kitu kwenye Azure!

```bash
# Sambaza miundombinu na programu
azd up

# Amri hii itafanya:
# 1. Kutayarisha rasilimali za Azure (App Service, Cosmos DB, n.k.)
# 2. Kujenga programu yako
# 3. Kusambaza kwenye rasilimali zilizotayarishwa
# 4. Onyesha URL ya programu
```

### Nini Kinatokea Wakati wa Kusakinisha?

Amri `azd up` inatekeleza hatua hizi:
1. **Provision** (`azd provision`) - Inaunda rasilimali za Azure
2. **Package** - Inajenga msimbo wa programu yako
3. **Deploy** (`azd deploy`) - Inasakinisha msimbo kwenye rasilimali za Azure

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
Bonyeza kwenye URL iliyotolewa kwenye matokeo ya kusakinisha, au ipate wakati wowote:
```bash
# Pata endpoints za programu
azd show

# Fungua programu kwenye kivinjari chako
azd show --output json | jq -r '.services.web.endpoint'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengee cha todo** - Bonyeza "Add Todo" na ingiza kazi
2. **Mark as complete** - Weka tiki kwenye vitu vilivyokamilika
3. **Delete items** - Ondoa todos ambazo huna tena

### Fuatilia Programu Yako
```bash
# Fungua portal ya Azure kwa rasilimali zako
azd monitor

# Tazama kumbukumbu za programu
azd monitor --logs

# Tazama vipimo vya wakati halisi
azd monitor --live
```

## Hatua 6: Fanya Mabadiliko na Usakinishe Tena

Tufanye mabadiliko tuone jinsi ilivyo rahisi kusasisha:

### Badilisha API
```bash
# Hariri msimbo wa API
code src/api/src/routes/lists.js
```

Ongeza kichwa cha mwitikio maalum:
```javascript
// Tafuta mshughulikiaji wa njia na ongeza:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sakinisha Tu Mabadiliko ya Msimbo
```bash
# Sambaza tu msimbo wa programu (ruka miundombinu)
azd deploy

# Hii ni haraka zaidi kuliko 'azd up' kwa sababu miundombinu tayari ipo
```

## Hatua 7: Simamia Mazingira Nyingi

Unda mazingira ya staging kujaribu mabadiliko kabla ya uzalishaji:

```bash
# Unda mazingira mapya ya kujaribu
azd env new staging

# Sambaza kwenye mazingira ya kujaribu
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

Unapomaliza kujaribu, safisha ili kuepuka malipo yanayoendelea:

```bash
# Futa rasilimali zote za Azure kwa mazingira ya sasa
azd down

# Futa kwa nguvu bila uthibitisho na ondoa kabisa rasilimali zilizofutwa kwa muda
azd down --force --purge

# Futa mazingira maalum
azd env select staging
azd down --force --purge
```

## Mambo Uliyoyajifunza

Hongera! Umefanikiwa:
- ✅ Kuanzisha mradi wa azd kutoka kwa kiolezo
- ✅ Kuchunguza muundo wa mradi na mafaili muhimu
- ✅ Kusakinisha programu ya full-stack kwenye Azure
- ✅ Kufanya mabadiliko ya msimbo na kusakinisha tena
- ✅ Kusimamia mazingira mengi
- ✅ Kusafisha rasilimali

## 🎯 Mazoezi ya Uthibitisho wa Ujuzi

### Zoezi 1: Sakinisha Kiolezo Tofauti (dakika 15)
**Lengo**: Onyesha umiliki wa azd init na mtiririko wa kusakinisha

```bash
# Jaribu stack ya Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Thibitisha utoaji
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Programu inasakinishwa bila makosa
- [ ] Inaweza kufikiwa kupitia URL ya programu katika kivinjari
- [ ] Programu inafanya kazi vizuri (ongeza/ondoa todos)
- [ ] Imefanikiwa kusafisha rasilimali zote

### Zoezi 2: Binafsisha Usanidi (dakika 20)
**Lengo**: Fanya mazoezi ya kusanidi vigezo vya mazingira

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
- [ ] Mazingira maalum yameundwa kwa mafanikio
- [ ] Vigezo vya mazingira vimewekwa na vinaweza kupatikana
- [ ] Programu inasakinishwa kwa usanidi maalum
- [ ] Inaweza kuthibitisha mipangilio maalum katika programu iliyosakinishwa

### Zoezi 3: Mtiririko wa Mazingira Nyingi (dakika 25)
**Lengo**: Kuwa mtaalamu wa usimamizi wa mazingira na mikakati ya uenezaji

```bash
# Unda mazingira ya maendeleo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Kumbuka URL ya maendeleo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Unda mazingira ya maandalizi
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Kumbuka URL ya maandalizi
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
- [ ] Mazingira mawili yalioundwa yenye usanidi tofauti
- [ ] Mazingira yote yamesakinishwa kwa mafanikio
- [ ] Inaweza kubadilisha kati ya mazingira kwa kutumia `azd env select`
- [ ] Vigezo vya mazingira vinatofautiana kati ya mazingira
- [ ] Mazingira yote mawili yamesafishwa kwa mafanikio

## 📊 Maendeleo Yako

**Muda Uliowekezwa**: ~60-90 dakika  
**Ujuzi Uliopatikana**:
- ✅ Kuanzisha mradi kwa kutumia kiolezo
- ✅ Utoaji wa rasilimali za Azure
- ✅ Mtiririko wa usakinishaji wa programu
- ✅ Usimamizi wa mazingira
- ✅ Usanidi wa utekelezaji
- ✅ Kusafisha rasilimali na usimamizi wa gharama

**Ngazi Ifuatayo**: Uko tayari kwa [Mwongozo wa Usanidi](configuration.md) kujifunza mifumo ya juu ya usanidi!

## Kutatua Masuala Yanayojirudia

### Makosa ya Uthibitishaji
```bash
# Thibitisha tena kwa Azure
az login

# Thibitisha ufikiaji wa usajili
az account show
```

### Kushindwa kwa Kusakinisha
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

### Masuala ya Bandari/Mtandao
```bash
# Angalia ikiwa bandari zinapatikana
netstat -an | grep :3000
netstat -an | grep :3100
```

## Hatua Zifuatazo

Sasa baada ya kumaliza mradi wako wa kwanza, chunguza mada hizi za juu:

### 1. Binafsisha Miundombinu
- [Miundombinu Kama Msimbo](../chapter-04-infrastructure/provisioning.md)
- [Ongeza hifadhidata, uhifadhi, na huduma nyingine](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sanidi CI/CD
- [Mwongozo wa Uenezaji](../chapter-04-infrastructure/deployment-guide.md) - Mtiririko kamili wa CI/CD
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Usanidi wa pipeline

### 3. Mifumo Bora kwa Uzalishaji
- [Mwongozo wa Uenezaji](../chapter-04-infrastructure/deployment-guide.md) - Usalama, utendakazi, na ufuatiliaji

### 4. Chunguza Violezo Zaidi
```bash
# Pitia violezo kwa aina
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Jaribu seti tofauti za teknolojia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Rasilimali Zaidi

### Vifaa vya Kujifunzia
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Miundo ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Jamii & Msaada
- [GitHub ya Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Jamii ya Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Violezo & Mifano
- [Gallery Rasmi ya Violezo](https://azure.github.io/awesome-azd/)
- [Violezo vya Jamii](https://github.com/Azure-Samples/azd-templates)
- [Miundo ya Shirika](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Hongera kwa kumaliza mradi wako wa kwanza wa azd!** Sasa uko tayari kujenga na kusakinisha programu za kushangaza kwenye Azure kwa ujasiri.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Current Chapter**: Sura 1 - Msingi & Mwanzo wa Haraka
- **⬅️ Previous**: [Ufungaji & Usanidi](installation.md)
- **➡️ Next**: [Usanidi](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Mwongozo wa Uenezaji](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri wa AI, Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu iliyofanywa na mtafsiri wa binadamu. Hatuwajibiki kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->