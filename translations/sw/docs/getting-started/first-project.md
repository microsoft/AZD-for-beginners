# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

**Ukurasa wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Kompyuta](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Kuanza Haraka
- **⬅️ Iliyopita**: [Usakinishaji & Usanidi](installation.md)
- **➡️ Inayofuata**: [Usanidi](configuration.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI Kwanza](../microsoft-foundry/microsoft-foundry-integration.md)

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Mafunzo haya ya vitendo yanakupa mwongozo kamili wa kuunda, kupeleka, na kusimamia programu kamili ya stack kwenye Azure kwa kutumia azd. Utashughulikia programu halisi ya todo inayojumuisha frontend ya React, backend ya Node.js API, na hifadhidata ya MongoDB.

## Malengo ya Kujifunza

Kwa kukamilisha mafunzo haya, utaweza:
- Kumudu mtiririko wa kuanzisha mradi wa azd kwa kutumia templates
- Kuelewa muundo wa mradi wa Azure Developer CLI na faili za usanidi
- Kutekeleza upelekwaji kamili wa programu kwenye Azure pamoja na utoaji wa miundombinu
- Kutekeleza masasisho ya programu na mikakati ya kupeleka tena
- Kusimamia mazingira mengi kwa maendeleo na majaribio
- Kutumia mbinu za kusafisha rasilimali na usimamizi wa gharama

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kuanzisha na kusanidi miradi ya azd kutoka kwa templates kwa uhuru
- Kuabiri na kurekebisha miundo ya mradi wa azd kwa ufanisi
- Kupeleka programu kamili ya stack kwenye Azure kwa kutumia amri moja
- Kutatua masuala ya kawaida ya upelekwaji na matatizo ya uthibitishaji
- Kusimamia mazingira mengi ya Azure kwa hatua tofauti za upelekwaji
- Kutekeleza mtiririko wa upelekwaji endelevu kwa masasisho ya programu

## Kuanza

### Orodha ya Vitu vya Awali
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Usakinishaji](installation.md))
- ✅ Azure CLI imewekwa na kuthibitishwa
- ✅ Git imewekwa kwenye mfumo wako
- ✅ Node.js 16+ (kwa mafunzo haya)
- ✅ Visual Studio Code (inapendekezwa)

### Thibitisha Usanidi Wako
```bash
# Angalia usakinishaji wa azd
azd version
```
### Thibitisha uthibitishaji wa Azure

```bash
az account show
```

### Angalia toleo la Node.js
```bash
node --version
```

## Hatua ya 1: Chagua na Anzisha Template

Tuanzie na template maarufu ya programu ya todo inayojumuisha frontend ya React na backend ya Node.js API.

```bash
# Vinjari templeti zinazopatikana
azd template list

# Anzisha templeti ya programu ya todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Fuata maelekezo:
# - Ingiza jina la mazingira: "dev"
# - Chagua usajili (ikiwa una nyingi)
# - Chagua eneo: "East US 2" (au eneo unalopendelea)
```

### Nini Kimefanyika?
- Umeipakua template ya msimbo kwenye saraka yako ya ndani
- Umeunda faili ya `azure.yaml` yenye maelezo ya huduma
- Umeweka msimbo wa miundombinu kwenye saraka ya `infra/`
- Umeunda usanidi wa mazingira

## Hatua ya 2: Chunguza Muundo wa Mradi

Hebu tuangalie kile azd imeunda kwetu:

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

### Faili Muhimu za Kuelewa

**azure.yaml** - Moyo wa mradi wako wa azd:
```bash
# Tazama usanidi wa mradi
cat azure.yaml
```

**infra/main.bicep** - Ufafanuzi wa miundombinu:
```bash
# Tazama msimbo wa miundombinu
head -30 infra/main.bicep
```

## Hatua ya 3: Rekebisha Mradi Wako (Hiari)

Kabla ya kupeleka, unaweza kubadilisha programu:

### Rekebisha Frontend
```bash
# Fungua sehemu ya programu ya React
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

## Hatua ya 4: Peleka kwenye Azure

Sasa kwa sehemu ya kusisimua - peleka kila kitu kwenye Azure!

```bash
# Weka miundombinu na programu
azd up

# Amri hii itafanya:
# 1. Kutoa rasilimali za Azure (Huduma ya Programu, Cosmos DB, nk.)
# 2. Kujenga programu yako
# 3. Kuweka kwenye rasilimali zilizotolewa
# 4. Kuonyesha URL ya programu
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
# Pata ncha za maombi
azd show

# Fungua programu kwenye kivinjari chako
azd show --output json | jq -r '.services.web.endpoint'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengee cha todo** - Bonyeza "Add Todo" na ingiza kazi
2. **Tandaza kama imekamilika** - Angalia vipengee vilivyokamilika
3. **Futa vipengee** - Ondoa todo usivyohitaji tena

### Fuata Programu Yako
```bash
# Fungua portal ya Azure kwa rasilimali zako
azd monitor

# Tazama kumbukumbu za programu
azd logs
```

## Hatua ya 6: Fanya Mabadiliko na Upeleke Tena

Hebu tufanye mabadiliko na tuone jinsi ilivyo rahisi kusasisha:

### Rekebisha API
```bash
# Hariri msimbo wa API
code src/api/src/routes/lists.js
```

Ongeza kichwa cha majibu maalum:
```javascript
// Tafuta mshughulikiaji wa njia na ongeza:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Peleka Mabadiliko ya Msimbo Pekee
```bash
# Peleka tu msimbo wa programu (ruka miundombinu)
azd deploy

# Hii ni haraka zaidi kuliko 'azd up' kwa kuwa miundombinu tayari ipo
```

## Hatua ya 7: Simamia Mazingira Mengi

Unda mazingira ya majaribio ili kujaribu mabadiliko kabla ya uzalishaji:

```bash
# Unda mazingira mapya ya majaribio
azd env new staging

# Peleka kwenye mazingira ya majaribio
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

# Tazama mazingira ya majaribio
azd env select staging
azd show
```

## Hatua ya 8: Safisha Rasilimali

Ukimaliza kujaribu, safisha ili kuepuka gharama zinazoendelea:

```bash
# Futa rasilimali zote za Azure kwa mazingira ya sasa
azd down

# Futa kwa nguvu bila uthibitisho na ondoa rasilimali zilizofutwa kwa upole
azd down --force --purge

# Futa mazingira maalum
azd env select staging
azd down --force --purge
```

## Ulichopata

Hongera! Umefanikiwa:
- ✅ Kuanzisha mradi wa azd kutoka kwa template
- ✅ Kuchunguza muundo wa mradi na faili muhimu
- ✅ Kupeleka programu kamili ya stack kwenye Azure
- ✅ Kufanya mabadiliko ya msimbo na kupeleka tena
- ✅ Kusimamia mazingira mengi
- ✅ Kusafisha rasilimali

## 🎯 Mazoezi ya Uthibitishaji wa Ujuzi

### Zoezi 1: Peleka Template Tofauti (Dakika 15)
**Lengo**: Onyesha umahiri wa mtiririko wa azd init na upelekwaji

```bash
# Jaribu Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Thibitisha upelekaji
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Programu inapelekwa bila makosa
- [ ] Inaweza kufikia URL ya programu kwenye kivinjari
- [ ] Programu inafanya kazi vizuri (ongeza/futa todo)
- [ ] Rasilimali zote zimesafishwa kwa mafanikio

### Zoezi 2: Rekebisha Usanidi (Dakika 20)
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

# Peleka na usanidi maalum
azd up
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira maalum yameundwa kwa mafanikio
- [ ] Vigezo vya mazingira vimewekwa na vinaweza kupatikana
- [ ] Programu inapelekwa na usanidi maalum
- [ ] Inaweza kuthibitisha mipangilio maalum kwenye programu iliyopelekwa

### Zoezi 3: Mtiririko wa Mazingira Mengi (Dakika 25)
**Lengo**: Kumudu usimamizi wa mazingira na mikakati ya upelekwaji

```bash
# Unda mazingira ya maendeleo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Kumbuka URL ya maendeleo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Unda mazingira ya majaribio
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Kumbuka URL ya majaribio
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Linganisha mazingira
azd env list

# Jaribu mazingira yote mawili
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Safisha yote mawili
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira mawili yameundwa na usanidi tofauti
- [ ] Mazingira yote mawili yamepelekwa kwa mafanikio
- [ ] Inaweza kubadilisha kati ya mazingira kwa kutumia `azd env select`
- [ ] Vigezo vya mazingira vinatofautiana kati ya mazingira
- [ ] Mazingira yote mawili yamesafishwa kwa mafanikio

## 📊 Maendeleo Yako

**Muda Uliowekezwa**: ~Dakika 60-90  
**Ujuzi Uliopatikana**:
- ✅ Kuanzisha mradi kwa msingi wa template
- ✅ Utoaji wa rasilimali za Azure
- ✅ Mtiririko wa upelekwaji wa programu
- ✅ Usimamizi wa mazingira
- ✅ Usimamizi wa usanidi
- ✅ Usafishaji wa rasilimali na usimamizi wa gharama

**Kiwango Kinachofuata**: Uko tayari kwa [Mwongozo wa Usanidi](configuration.md) kujifunza mifumo ya usanidi wa hali ya juu!

## Kutatua Masuala ya Kawaida

### Makosa ya Uthibitishaji
```bash
# Thibitisha tena na Azure
az login

# Hakikisha ufikiaji wa usajili
az account show
```

### Kushindwa kwa Upelekwaji
```bash
# Washa kumbukumbu za urekebishaji
export AZD_DEBUG=true
azd up --debug

# Tazama kumbukumbu za kina
azd logs --service api
azd logs --service web
```

### Migongano ya Majina ya Rasilimali
```bash
# Tumia jina la kipekee la mazingira
azd env new dev-$(whoami)-$(date +%s)
```

### Masuala ya Bandari/Mtandao
```bash
# Angalia kama bandari zinapatikana
netstat -an | grep :3000
netstat -an | grep :3100
```

## Hatua Zinazofuata

Sasa kwa kuwa umekamilisha mradi wako wa kwanza, chunguza mada hizi za hali ya juu:

### 1. Rekebisha Miundombinu
- [Miundombinu kama Msimbo](../deployment/provisioning.md)
- [Ongeza hifadhidata, uhifadhi, na huduma nyingine](../deployment/provisioning.md#adding-services)

### 2. Sanidi CI/CD
- [Ujumuishaji wa GitHub Actions](../deployment/cicd-integration.md)
- [Mikondo ya Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Mazoezi Bora ya Uzalishaji
- [Usanidi wa usalama](../deployment/best-practices.md#security)
- [Uboreshaji wa utendaji](../deployment/best-practices.md#performance)
- [Ufuatiliaji na kumbukumbu](../deployment/best-practices.md#monitoring)

### 4. Chunguza Templates Zaidi
```bash
# Vinjari templeti kwa kategoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Jaribu stack tofauti za teknolojia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Rasilimali za Ziada

### Vifaa vya Kujifunza
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Jamii & Msaada
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Jamii ya Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Mifano
- [Matunzio Rasmi ya Templates](https://azure.github.io/awesome-azd/)
- [Templates za Jamii](https://github.com/Azure-Samples/azd-templates)
- [Mifumo ya Biashara](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Hongera kwa kukamilisha mradi wako wa kwanza wa azd!** Sasa uko tayari kujenga na kupeleka programu za kushangaza kwenye Azure kwa kujiamini.

---

**Ukurasa wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Kompyuta](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Kuanza Haraka
- **⬅️ Iliyopita**: [Usakinishaji & Usanidi](installation.md)
- **➡️ Inayofuata**: [Usanidi](configuration.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI Kwanza](../microsoft-foundry/microsoft-foundry-integration.md)
- **Somo Linalofuata**: [Mwongozo wa Upelekwaji](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->