# Mradi Wako wa Kwanza - Mafunzo ya Vitendo

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi & Anza Haraka
- **⬅️ Awali**: [Installation & Setup](installation.md)
- **➡️ Ifuatayo**: [Configuration](configuration.md)
- **🚀 Sura Ifuatayo**: [Sura 2: Maendeleo ya Kwanza ya AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Karibu kwenye mradi wako wa kwanza wa Azure Developer CLI! Mafunzo haya ya vitendo ya kina yanatoa mwongozo kamili wa kuunda, kuweka, na kusimamia programu kamili kwenye Azure kwa kutumia azd. Utafanya kazi na programu halisi ya todo inayojumuisha frontend ya React, backend ya API ya Node.js, na hifadhidata ya MongoDB.

## Malengo ya Kujifunza

Kwa kumaliza mafunzo haya, utakuwa umeweza:
- Kumaster mtiririko wa kuanzisha mradi wa azd kwa kutumia templeti
- Kuelewa muundo wa mradi wa Azure Developer CLI na faili za usanidi
- Kutekeleza uwekeaji kamili wa programu kuelekea Azure pamoja na upangaji wa miundombinu
- Kutekeleza mikakati ya masasisho ya programu na kuweka tena
- Kusimamia mazingira mengi kwa ajili ya maendeleo na staging
- Kutumia taratibu za usafi wa rasilimali na usimamizi wa gharama

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kuanzisha na kusanidi miradi ya azd kutoka kwa templeti kwa kujitegemea
- Kupitia na kubadilisha miundo ya mradi wa azd kwa ufanisi
- Kuweka programu kamili kwenye Azure kwa kutumia amri moja
- Kutatua matatizo ya kawaida ya uwekeaji na matatizo ya uthibitishaji
- Kusimamia mazingira mbalimbali ya Azure kwa hatua tofauti za uwekeaji
- Kutekeleza mtiririko wa utekelezaji wa kuendelea kwa masasisho ya programu

## Kuanzia

### Orodha ya Mahitaji Kabla ya Kuanzia
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Ufungaji](installation.md))
- ✅ Azure CLI imewekwa na umeingia (authenticated)
- ✅ Git imewekwa kwenye mfumo wako
- ✅ Node.js 16+ (kwa mafunzo haya)
- ✅ Visual Studio Code (inapendekezwa)

### Thibitisha Mipangilio Yako
```bash
# Angalia usakinishaji wa azd
azd version
```
### Thibitisha uthibitisho wa Azure

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
# Vinjari templeti zilizopo
azd template list

# Anzisha templeti ya programu ya orodha ya kazi
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Fuata maelekezo:
# - Ingiza jina la mazingira: "dev"
# - Chagua usajili (ikiwa una zaidi ya moja)
# - Chagua eneo: "East US 2" (au eneo unalopendelea)
```

### Nini Kilitokea?
- Ilipakua msimbo wa templeti kwenye saraka yako ya ndani
- Iliunda faili `azure.yaml` yenye ufafanuzi wa huduma
- Iliandaa msimbo wa miundombinu katika saraka `infra/`
- Iliunda usanidi wa mazingira

## Hatua 2: Chunguza Muundo wa Mradi

Tuchunguze kile azd kilichotutengenezea:

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

## Hatua 3: Binafsisha Mradi Wako (Hiari)

Kabla ya kupeleka, unaweza kubinafsisha programu:

### Badilisha Frontend
```bash
# Fungua komponenti ya programu ya React
code src/web/src/App.tsx
```

Fanya mabadiliko rahisi:
```typescript
// Tafuta kichwa kisha ubadilishe.
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

## Hatua 4: Weka kwenye Azure

Sasa sehemu ya kusisimua - weka kila kitu kwenye Azure!

```bash
# Sambaza miundombinu na programu
azd up

# Amri hii itafanya:
# 1. Kutayarisha rasilimali za Azure (App Service, Cosmos DB, na kadhalika)
# 2. Kujenga programu yako
# 3. Kusambaza kwenye rasilimali zilizotayarishwa
# 4. Onyesha URL ya programu
```

### Nini Kinafanyika Wakati wa Uwekaji?

Amri ya `azd up` inafanya hatua hizi:
1. **Provision** (`azd provision`) - Inaunda rasilimali za Azure
2. **Package** - Inajenga msimbo wa programu yako
3. **Deploy** (`azd deploy`) - Inaweka msimbo kwenye rasilimali za Azure

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
Bofya URL iliyotolewa kwenye matokeo ya uwekaji, au ipate wakati wowote:
```bash
# Pata vituo vya programu
azd show

# Fungua programu katika kivinjari chako
azd show --output json | jq -r '.services.web.endpoint'
```

### Jaribu Programu ya Todo
1. **Ongeza kipengee cha todo** - Bofya "Add Todo" na ingiza kazi
2. **Taja kama imekamilika** - Weka tiki kwa vitu vilivyokamilika
3. **Futa vitu** - Ondoa vipengee vya todo usizohitaji tena

### Fuatilia Programu Yako
```bash
# Fungua portal ya Azure kwa rasilimali zako
azd monitor

# Tazama kumbukumbu za programu
azd monitor --logs

# Tazama vipimo vya wakati halisi
azd monitor --live
```

## Hatua 6: Fanya Mabadiliko na Uweke Tena

Tufanye mabadiliko na kuona jinsi ilivyo rahisi kusasisha:

### Badilisha API
```bash
# Hariri msimbo wa API
code src/api/src/routes/lists.js
```

Ongeza kichwa maalum cha majibu:
```javascript
// Tafuta mshughulikiaji wa njia na uongeze:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Weka Tu Mabadiliko ya Msimbo
```bash
# Sambaza tu msimbo wa programu (ruka miundombinu)
azd deploy

# Hii ni haraka zaidi kuliko 'azd up' kwa kuwa miundombinu tayari ipo
```

## Hatua 7: Dhibiti Mazingira Mengi

Unda mazingira ya staging ili kujaribu mabadiliko kabla ya uzalishaji:

```bash
# Unda mazingira mapya ya maandalizi
azd env new staging

# Sambaza kwenye mazingira ya maandalizi
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

Ukimaliza kujaribu, safisha ili kuepuka malipo yanayoendelea:

```bash
# Futa rasilimali zote za Azure za mazingira ya sasa
azd down

# Lazimisha kufuta bila uthibitisho na ondoa kabisa rasilimali zilizofutwa kwa muda
azd down --force --purge

# Futa mazingira maalum
azd env select staging
azd down --force --purge
```

## Programu ya Klasiki dhidi ya Programu Iliyotumia AI: Njia Ile Ile ya Kazi

Umeweka tu programu ya wavuti ya jadi. Lakini vipi kama ungependa kupeleka programu inayotumia AI badala yake — sema, programu ya mazungumzo inayosaidiwa na Microsoft Foundry Models?

Habari njema: **mtiririko wa kazi ni sawa.**

| Hatua | Programu ya Todo ya Klasiki | Programu ya Chat ya AI |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Tofauti pekee ni **templeti** unayoanza nayo. Templeti ya AI inajumuisha miundombinu ya ziada (kama rasilimali ya Microsoft Foundry Models au faharasa ya AI Search), lakini azd inashughulikia yote hayo kwa niaba yako. Huhitaji kujifunza amri mpya, kutumia zana tofauti, au kubadilisha jinsi unavyofikiria kuhusu uwekaji.

Hili ndilo kanuni kuu ya azd: **mtiririko mmoja, kazi yoyote.** Ujuzi uliofanya mazoezi katika mafunzo haya—kuzindua, kuwekeza, kufuatilia, kuweka tena, na kusafisha—unatumika sawia kwa programu za AI na mawakala.

---

## Ulichojifunza

Hongera! Umefanikiwa:
- ✅ Kuanzisha mradi wa azd kutoka kwa templeti
- ✅ Kupitia muundo wa mradi na faili muhimu
- ✅ Kuweka programu kamili kwenye Azure
- ✅ Kufanya mabadiliko ya msimbo na kuweka tena
- ✅ Kusimamia mazingira mengi
- ✅ Kusafisha rasilimali

## 🎯 Mazoezi ya Kupima Ujuzi

### Zoezi 1: Weka Templeti Tofauti (dakika 15)
**Lengo**: Onyesha ustadi wa azd init na mtiririko wa uwekaji

```bash
# Jaribu stack ya Python + MongoDB
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
- [ ] Programu imewekwa bila makosa
- [ ] Inaweza kufikiwa kwa URL katika kivinjari
- [ ] Programu inafanya kazi ipasavyo (ongeza/ondoa todos)
- [ ] Imefanikiwa kusafisha rasilimali zote

### Zoezi 2: Binafsisha Usanidi (dakika 20)
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
- [ ] Vigezo vya mazingira vimewekwa na vinaweza kupatikana
- [ ] Programu imewekwa kwa usanidi maalum
- [ ] Inaweza kuthibitisha mipangilio maalum katika programu iliyowekwa

### Zoezi 3: Mtiririko wa Mazingira Nyingi (dakika 25)
**Lengo**: Kamilisha usimamizi wa mazingira na mbinu za uwekaji

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

# Safisha zote mbili
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira mawili yaliundwa yenye usanidi tofauti
- [ ] Mazingira yote yaliwekwa kwa mafanikio
- [ ] Inaweza kubadilisha kati ya mazingira kwa kutumia `azd env select`
- [ ] Vigezo vya mazingira vinatofautiana kati ya mazingira
- [ ] Imefanikiwa kusafisha mazingira yote mawili

## 📊 Maendeleo Yako

**Muda Uliotumika**: ~60-90 dakika  
**Ujuzi Uliopatikana**:
- ✅ Kuanzisha mradi kwa kutumia templeti
- ✅ Utoaji wa rasilimali za Azure
- ✅ Mtiririko wa uwekeaji wa programu
- ✅ Usimamizi wa mazingira
- ✅ Usimamizi wa usanidi
- ✅ Usafishaji wa rasilimali na usimamizi wa gharama

**Ngazi Ifuatayo**: Uko tayari kwa [Mwongozo wa Usanidi](configuration.md) kujifunza mifumo ya usanidi ya juu!

## Kutatua Masuala ya Kawaida

### Makosa ya Uthibitishaji
```bash
# Thibitisha tena na Azure
az login

# Thibitisha ufikiaji wa usajili
az account show
```

### Kushindwa kwa Uwekaji
```bash
# Washa kurekodi kumbukumbu za utatuzi
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
# Angalia kama bandari zinapatikana
netstat -an | grep :3000
netstat -an | grep :3100
```

## Hatua Zifuatazo

Sasa umeimaliza mradi wako wa kwanza, chunguza mada hizi za juu zaidi:

### 1. Binafsisha Miundombinu
- [Miundombinu kama Msimbo](../chapter-04-infrastructure/provisioning.md)
- [Ongeza hifadhidata, uhifadhi, na huduma nyingine](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sanidi CI/CD
- [Mwongozo wa Uwekaji](../chapter-04-infrastructure/deployment-guide.md) - Mtiririko kamili wa CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Usanidi wa pipeline

### 3. Mazoezi Bora kwa Uzalishaji
- [Mwongozo wa Uwekaji](../chapter-04-infrastructure/deployment-guide.md) - Usalama, utendaji, na ufuatiliaji

### 4. Chunguza Templeti Zaidi
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

## Rasilimali Zingine

### Vifaa vya Kujifunzia
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

**Hongera kwa kumaliza mradi wako wa kwanza wa azd!** Sasa uko tayari kujenga na kupeleka programu za kusisimua kwenye Azure kwa ujasiri.

---

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi & Anza Haraka
- **⬅️ Awali**: [Installation & Setup](installation.md)
- **➡️ Ifuatayo**: [Configuration](configuration.md)
- **🚀 Sura Ifuatayo**: [Sura 2: Maendeleo ya Kwanza ya AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Somo Ifuatayo**: [Mwongozo wa Uwekaji](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutokuwa na dhamana**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatubebei wajibu kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->