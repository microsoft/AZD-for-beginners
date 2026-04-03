# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

**Navigation ya Sura:**
- **📚 Nyumba ya Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi & Anza Haraka
- **⬅️ Iliyotangulia**: [Installation & Setup](installation.md)
- **➡️ Inayofuata**: [Configuration](configuration.md)
- **🚀 Sura Inayofuata**: [Sura 2: Maendeleo yanayomwekea AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Mafunzo haya ya vitendo yanakupa mwongozo kamili wa kuunda, kupeleka, na kusimamia programu ya full-stack kwenye Azure kwa kutumia azd. Utahakikisha kazi na programu halisi ya todo inayojumuisha frontend ya React, backend ya API ya Node.js, na hifadhidata ya MongoDB.

## Malengo ya Kujifunza

Kwa kumaliza mafunzo haya, utaweza:
- Kumaster mchakato wa kuanzisha mradi wa azd kwa kutumia violezo
- Kuelewa muundo wa mradi wa Azure Developer CLI na faili za usanidi
- Kutekeleza utekelezaji kamili wa programu kwenye Azure pamoja na upangaji wa miundombinu
- Kutekeleza masasisho ya programu na mikakati ya kupeleka tena
- Kusimamia mazingira mengi kwa ajili ya maendeleo na staging
- Kutumia mbinu za usafishaji wa rasilimali na usimamizi wa gharama

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kuanzisha na kusanidi miradi ya azd kutoka kwa violezo bila msaada
- Kufungua na kubadilisha miundo ya miradi ya azd kwa ufanisi
- Kupeleka programu za full-stack kwenye Azure kwa amri moja
- Kutatua matatizo ya kawaida ya upelekaaji na matatizo ya uthibitisho
- Kusimamia mazingira mengi ya Azure kwa hatua tofauti za upelekaaji
- Kutekeleza mtiririko wa kuendelea wa upelekaaji kwa masasisho ya programu

## Kuanzia

### Orodha ya Mahitaji ya Awali
- ✅ Azure Developer CLI imewekwa ([Installation Guide](installation.md))
- ✅ Uthibitisho wa AZD umekamilika kwa `azd auth login`
- ✅ Git imewekwa kwenye mfumo wako
- ✅ Node.js 16+ (kwa mafunzo haya)
- ✅ Visual Studio Code (inapendekezwa)

Kabla hujaendelea, endesha validator ya usanidi kutoka mizizi ya hazina:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Thibitisha Usanidi Wako
```bash
# Angalia usakinishaji wa azd
azd version

# Angalia uthibitisho wa AZD
azd auth login --check-status
```

### Thibitisha uthibitishaji wa hiari wa Azure CLI

```bash
az account show
```

### Angalia toleo la Node.js
```bash
node --version
```

## Hatua 1: Chagua na Anzisha Kiolezo

Tuanze na kiolezo maarufu cha programu ya todo kinachojumuisha frontend ya React na backend ya API ya Node.js.

```bash
# Tazama templeti zinazopatikana
azd template list

# Anzisha templeti ya programu ya todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Fuata maagizo:
# - Ingiza jina la mazingira: "dev"
# - Chagua usajili (ikiwa una kadhaa)
# - Chagua eneo: "East US 2" (au eneo unalolipendelea)
```

### Nini Kilitokea?
- Ilipakuliwa msimbo wa kiolezo kwenye saraka yako ya eneo
- Iliundwa faili ya `azure.yaml` yenye ufafanuzi wa huduma
- Iliyowekwa msimbo wa miundombinu katika saraka ya `infra/`
- Iliundwa usanidi wa mazingira

## Hatua 2: Chunguza Muundo wa Mradi

Tuchunguze kile azd kilitengeneza kwetu:

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
# Angalia msimbo wa miundombinu
head -30 infra/main.bicep
```

## Hatua 3: Boresha Mradi Wako (Hiari)

Kabla ya kupeleka, unaweza kuboresha programu:

### Badilisha Frontend
```bash
# Fungua komponenti ya app ya React
code src/web/src/App.tsx
```

Fanya mabadiliko rahisi:
```typescript
// Pata kichwa kisha ubadilishe
<h1>My Awesome Todo App</h1>
```

### Sanidi Vigezo vya Mazingira
```bash
# Weka vigezo vya mazingira maalum
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tazama vigezo vyote vya mazingira
azd env get-values
```

## Hatua 4: Telekeza kwenye Azure

Sasa sehemu ya kusisimua - telekeza kila kitu kwenye Azure!

```bash
# Weka miundombinu na programu
azd up

# Amri hii itafanya:
# 1. Kuanzisha rasilimali za Azure (App Service, Cosmos DB, na kadhalika)
# 2. Kujenga programu yako
# 3. Kuweka kwenye rasilimali zilizotayarishwa
# 4. Onyesha URL ya programu
```

### Kinachotokea Wakati wa Utekelezaji?

Amri ya `azd up` hufanya hatua hizi:
1. **Kuweka rasilimali** (`azd provision`) - Inaunda rasilimali za Azure
2. **Kujaza kifurushi** - Inajenga msimbo wa programu yako
3. **Kutegeleza** (`azd deploy`) - Inapeleka msimbo kwenye rasilimali za Azure

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

### Pata Ufikiaji wa Programu Yako
Bonyeza kwenye URL iliyotolewa katika matokeo ya utekelezaji, au ipate wakati wowote:
```bash
# Pata vituo vya programu
azd show

# Fungua programu kwenye kivinjari chako
azd show --output json | jq -r '.services.web.endpoint'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengee cha todo** - Bonyeza "Ongeza Todo" na ingiza kazi
2. **Alama kama imekamilika** - Weka tiki kwenye vitu vilivyokamilika
3. **Futa vitu** - Ondoa todos usizohitaji tena

### Fuata Programu Yako
```bash
# Fungua portal ya Azure kwa rasilimali zako
azd monitor

# Tazama kumbukumbu za programu
azd monitor --logs

# Tazama vipimo vya wakati halisi
azd monitor --live
```

## Hatua 6: Fanya Mabadiliko na Telekeza Tena

Tufanye mabadiliko na kuona jinsi ilivyo rahisi kusasisha:

### Badilisha API
```bash
# Hariri msimbo wa API
code src/api/src/routes/lists.js
```

Ongeza header ya jibu iliyobinafsishwa:
```javascript
// Tafuta mshughulikiaji wa ruta na uongeze:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Telekeza tu Mabadiliko ya Msimbo
```bash
# Sambaza tu msimbo wa programu (usijumuishe miundombinu)
azd deploy

# Hii ni haraka zaidi kuliko 'azd up' kwa sababu miundombinu tayari ipo
```

## Hatua 7: Dhibiti Mazingira Nyingi

Tengeneza mazingira ya staging ili kujaribu mabadiliko kabla ya uzalishaji:

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

### Mlinganisho wa Mazingira
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

# Lazimisha kufuta bila uthibitisho na ondoa kabisa rasilimali zilizofutwa kwa muda
azd down --force --purge

# Futa mazingira maalum
azd env select staging
azd down --force --purge
```

## Programu ya Kawaida vs. Programu Iliyoinuliwa na AI: Mchakato Ule Ule

Umepeleka tu programu ya wavuti ya jadi. Lakini je, ungependa kupeleka programu inayotumia AI badala yake — sema, programu ya chat inayosaidiwa na Microsoft Foundry Models?

Habari njema: **mchakato ni sawa kabisa.**

| Hatua | Programu ya Todo ya Kawaida | Programu ya Chat ya AI |
|------|-----------------------------|------------------------|
| Anzisha | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Thibitisha | `azd auth login` | `azd auth login` |
| Telekeza | `azd up` | `azd up` |
| Fuata | `azd monitor` | `azd monitor` |
| Safisha | `azd down --force --purge` | `azd down --force --purge` |

Tofauti pekee ni kiolezo unachoanza nacho. Kiolezo cha AI kinajumuisha miundombinu ya ziada (kama rasilimali za Microsoft Foundry Models au faharasa ya AI Search), lakini azd inashughulikia yote hayo kwa niaba yako. Haufai kujifunza amri mpya, kutumia zana tofauti, au kubadilisha jinsi unavyofikiri kuhusu upelekaaji.

Huu ndio kanuni kuu ya azd: **mchakato mmoja, kazi yoyote.** Ujuzi ulioufanya kwenye mafunzo haya—kuanzisha, kupeleka, kufuatilia, kupeleka tena, na kusafisha—unatumika kwa usawa kwa programu za AI na mawakala.

---

## Umejifunza Nini

Hongera! Umefanikiwa:
- ✅ Kuanzisha mradi wa azd kutoka kwa kiolezo
- ✅ Kuchunguza muundo wa mradi na faili muhimu
- ✅ Kupeleka programu ya full-stack kwenye Azure
- ✅ Kufanya mabadiliko ya msimbo na kupeleka tena
- ✅ Kusimamia mazingira mengi
- ✅ Kusafisha rasilimali

## 🎯 Mazoezi ya Kuhakiki Ujuzi

### Mazoezi 1: Telekeza Kiolezo Tofauti (dakika 15)
**Lengo**: Onyesha ustadi wa azd init na mchakato wa utekelezaji

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
- [ ] Programu imepelekwa bila makosa
- [ ] Inaweza kufikiwa kwa URL kwenye kivinjari
- [ ] Programu inafanya kazi vizuri (ongeza/ondoa todos)
- [ ] Rasilimali zote zilisafishwa kwa mafanikio

### Mazoezi 2: Binafsisha Usanidi (dakika 20)
**Lengo**: Mazoezi ya usanidi wa vigezo vya mazingira

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
- [ ] Mazingira ya kawaida yaliundwa kwa mafanikio
- [ ] Vigezo vya mazingira vimewekwa na vinaweza kupatikana
- [ ] Programu imepelekwa kwa usanidi uliobinafsishwa
- [ ] Inaweza kuthibitishwa mipangilio iliyobinafsishwa kwenye programu iliyopelekwa

### Mazoezi 3: Mtiririko wa Mazingira Mengi (dakika 25)
**Lengo**: Mstari wa mbele wa usimamizi wa mazingira na mikakati ya upelekaaji

```bash
# Unda mazingira ya maendeleo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Andika URL ya maendeleo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Unda mazingira ya awamu ya kujaribu
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Andika URL ya awamu ya kujaribu
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Linganisha mazingira
azd env list

# Jaribu mazingira yote mawili
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Safisha zote mbili
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira mawili yaliundwa yenye usanidi tofauti
- [ ] Mazingira yote yalipelekwa kwa mafanikio
- [ ] Inaweza kubadili kati ya mazingira kwa kutumia `azd env select`
- [ ] Vigezo vya mazingira vinatofautiana kati ya mazingira
- [ ] Mazingira yote yalisafishwa kwa mafanikio

## 📊 Maendeleo Yako

**Muda Uliotumika**: ~60-90 dakika  
**Ujuzi Uliopatikana**:
- ✅ Uanzishaji wa mradi kulingana na kiolezo
- ✅ Upangaji wa rasilimali za Azure
- ✅ Mtiririko wa upelekaaji wa programu
- ✅ Usimamizi wa mazingira
- ✅ Usimamizi wa usanidi
- ✅ Usafishaji wa rasilimali na usimamizi wa gharama

**Ngazi Ifuatayo**: Uko tayari kwa [Mwongozo wa Mipangilio](configuration.md) kujifunza mifumo ya juu ya usanidi!

## Kutatua Matatizo Yanayojirudia

### Makosa ya Uthibitishaji
```bash
# Thibitisha tena utambulisho na Azure
az login

# Thibitisha ufikiaji wa usajili
az account show
```

### Kushindwa kwa Utekelezaji
```bash
# Washa kurekodi kumbukumbu za debug
export AZD_DEBUG=true
azd up --debug

# Tazama kumbukumbu za programu kwenye Azure
azd monitor --logs

# Kwa Container Apps, tumia Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Migongano ya Majina ya Rasilimali
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

Sasa umekamilisha mradi wako wa kwanza, chunguza mada hizi za juu:

### 1. Boresha Miundombinu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Ongeza hifadhidata, uhifadhi, na huduma nyingine](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sanidi CI/CD
- [Mwongozo wa Upelekaji](../chapter-04-infrastructure/deployment-guide.md) - Mtiririko kamili wa CI/CD
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Usanidi wa pipeline

### 3. Mbinu Bora za Uzalishaji
- [Mwongozo wa Upelekaji](../chapter-04-infrastructure/deployment-guide.md) - Usalama, utendaji, na ufuatiliaji

### 4. Chunguza Violezo Zaidi
```bash
# Vinjari templeti kwa aina
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Jaribu seti tofauti za teknolojia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Rasilimali Zaidi

### Vifaa vya Kujifunza
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Miundo ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Jumuiya & Msaada
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Jumuiya ya Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Violezo & Mifano
- [Ghala Rasmi la Violezo](https://azure.github.io/awesome-azd/)
- [Violezo vya Jumuiya](https://github.com/Azure-Samples/azd-templates)
- [Mifumo ya Shirika](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Hongera kwa kumaliza mradi wako wa kwanza wa azd!** Sasa uko tayari kujenga na kupeleka programu za kushangaza kwenye Azure kwa ujasiri.

---

**Navigation ya Sura:**
- **📚 Nyumba ya Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi & Anza Haraka
- **⬅️ Iliyotangulia**: [Installation & Setup](installation.md)
- **➡️ Inayofuata**: [Configuration](configuration.md)
- **🚀 Sura Inayofuata**: [Sura 2: Maendeleo yanayomwekea AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Somo Linalofuata**: [Mwongozo wa Upelekaji](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia utafsiri wa mtaalamu binadamu. Hatujawajibika kwa kutoelewana au tafsiri potofu zitakazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->