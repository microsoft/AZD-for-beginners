# கட்டளை சுருக்கம் - அவசியமான AZD கட்டளைகள்

**எல்லா அத்தியாயங்களுக்கும் விரைவு குறிப்பு**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பிகளுக்கான AZD](../README.md)
- **📖 விரைவு தொடக்கம்**: [அத்தியாயம் 1: அடித்தளம் மற்றும் விரைவு தொடக்கம்](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI கட்டளைகள்**: [அத்தியாயம் 2: AI-முதலான மேம்பாடு](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 மேம்பட்டவை**: [அத்தியாயம் 4: கட்டமைப்பு-ஐ குறியீட்டாக்குதல் (Infrastructure as Code)](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## அறிமுகம்

இந்த விரிவான சுருக்கம், பிரிவு வகைப்படுத்தப்பட்ட விளக்க உதாரணங்களோடு, மிகவும் பொதுவாகப் பயன்படுத்தப்படும் Azure Developer CLI கட்டளைகளுக்கான விரைவு குறிப்பு வழங்குகிறது. azd திட்டங்களுடன் மேம்பாடு, பிழைதிருத்தம் மற்றும் தினசரி செயல்பாடுகளுக்கான வேலையில் இது சிறந்த உதவியாகும்.

## கற்றல் இலக்குகள்

இந்த சுருக்கத்தைப் பயன்படுத்துவதன் மூலம், நீங்கள்:
- அவசியமான Azure Developer CLI கட்டளைகள் மற்றும் நிரலாக்கச் சொற்றொடர்களுக்கு உடனடி அணுகல் பெறுவீர்கள்
- செயல்பாட்டு வகைகளாலும் பயன்பாட்டு выпадுகளாலும் கட்டளைகள் எப்படி ஒழுங்குபடுத்தப்பட்டுள்ளன என்பதை புரிந்துகொள்வீர்கள்
- பொதுவான மேம்பாடு மற்றும் அமர்த்தும் சூழ்நிலைகளுக்கான நடைமுறை உதாரணங்களுக்கு குறிப்பு காண்பீர்கள்
- விரைவான சிக்கல் தீர்க்கும் கட்டளைகள் மூலம் பிழை தீர்க்கும் வழிகளை அணுகுவீர்கள்
- மேலதிக கட்டமைப்பு மற்றும் தகுந்த தனிப்பயனாக்குதல் விருப்பங்களை எளிதாகக் கண்டுபிடிப்பீர்கள்
- சூழல் மேலாண்மை மற்றும் பல-சூழல் பணித்திட்ட வேலைநடைகளுக்கான கட்டளைகளை கண்டுபிடிப்பீர்கள்

## கற்றல் முடிவுகள்

இந்த சுருக்கத்தினை அடிக்கடி அணுகுவதன் மூலம், நீங்கள் இதைச் செய்யக்கூடியார்:
- முழு ஆவணங்களை அணுகாமல் azd கட்டளைகளை நம்பிக்கையுடன் இயக்க முடியும்
- பொருத்தமான تشخيص கட்டளைகளைப் பயன்படுத்தி பொதுவான சிக்கல்களை விரைவில் தீர்க்க முடியும்
- பல சூழல்களை மற்றும் அர்ப்பணிப்பு காட்சிகளை திறமையாக நிர்வகிக்க முடியும்
- தேவையானபோது azd இன் மேம்பட்ட அம்சங்கள் மற்றும் அமைப்பு விருப்பங்களை பயன்படுத்த முடியும்
- முறையான கட்டளைக் குறிச் தொடர்களைப் பயன்படுத்தி அமர்த்தும் சிக்கல்களை பிழைதிருத்த முடியும்
- azd சுருக்கங்கள் மற்றும் விருப்பங்களை பயன் படுத்தி பணிநடை முறைமைகளை சிறப்பிக்க முடியும்

## தொடக்க கட்டளைகள்

### அங்கீகாரம்
```bash
# AZD மூலம் Azure-க்கு உள்நுழைவு
azd auth login

# Azure CLI-க்கு உள்நுழைவு (AZD இதை பின்னணியில் பயன்படுத்துகிறது)
az login

# தற்போதைய கணக்கை சரிபார்க்கவும்
az account show

# இயல்புநிலை சப்ஸ்கிரிப்ஷனை அமைக்கவும்
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD-இருந்து வெளியேறவும்
azd auth logout

# Azure CLI-இருந்து வெளியேறவும்
az logout
```

### திட்டத்தை தொடக்குதல்
```bash
# கிடைக்கக்கூடிய வார்ப்புகளை உலாவவும்
azd template list

# வார்ப்பிலிருந்து துவக்கவும்
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# தற்போதைய அடைவில் துவக்கவும்
azd init .

# தனிப்பட்ட பெயருடன் துவக்கவும்
azd init --template todo-nodejs-mongo my-awesome-app
```

## முக்கிய வழங்கல் கட்டளைகள்

### முழுமையான வழங்கல் வேலைநடை
```bash
# அனைவரையும் வெளியிடவும் (வள ஒதுக்கீடு + வெளியீடு)
azd up

# உறுதிப்படுத்தல் கேள்விகள் நிறுத்தப்பட்ட நிலையில் வெளியிடவும்
azd up --confirm-with-no-prompt

# குறிப்பிட்ட சூழலுக்கு வெளியிடவும்
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் வெளியிடவும்
azd up --parameter location=westus2
```

### கட்டமைப்பு மட்டும்
```bash
# Azure வளங்களை வழங்குதல்
azd provision

# 🧪 கட்டமைப்பு மாற்றங்களை முன்னோட்டமாக பார்க்க
azd provision --preview
# உருவாக்கப்படவிருக்கும்/மாற்றப்படவிருக்கும்/அழிக்கப்படவிருக்கும் வளங்கள் எவ்வாறு இருக்கும் என்பதன் dry-run பார்வையை காண்பிக்கிறது
# 'terraform plan' அல்லது 'bicep what-if' போன்றது - இயக்குவதற்கு பாதுகாப்பானது, எந்த மாற்றங்களும் பொருந்தப்பட மாட்டாது
```

### விண்ணப்பம் மட்டும்
```bash
# அப்ளிகேஷன் குறியீட்டை வெளியிடவும்
azd deploy

# குறிப்பிட்ட சேவையை வெளியிடவும்
azd deploy --service web
azd deploy --service api

# அனைத்து சேவைகளையும் வெளியிடவும்
azd deploy --all
```

### அமைத்தல் மற்றும் தொகுப்பு
```bash
# விண்ணப்பத்தின் சார்புகளை மீட்டெடு (பதிவிறக்கம்)
azd restore

# ஒரு குறிப்பிட்ட சேவையை மீட்டெடு
azd restore --service api

# நிறுவாமல் ஒரு நிறுவக்கூடிய அர்டிஃபாக்டை உருவாக்கவும்
azd package

# குறிப்பிட்ட சேவையை கட்டமைக்கவும்
azd package --service api
```

> **`azd restore`** உங்கள் செயலியின் சார்பு தொகுப்புகளை (npm, pip, NuGet, Maven, etc.) பதிவிறக்குகிறது. இது `azd package` மற்றும் `azd deploy` இல் தானாக இயக்கப்படும், ஆகவே நீங்கள் அதனை நேரடியாக அழைக்கும் அவசியம் அரிது—CI கேசை முன்கூட்டியே வெப்பப்படுத்துவதற்கு அல்லது பிறகு ஆஃப்லைனில் பணியாற்றுவதற்காக சார்புகளை முன்-பெறதற்காக இதை கையேடாக இயக்கலாம்.

> **`azd package`** Azureக்குத் டப்லாய்ஹிடாமல் தளமாறக்கூடிய ஆர்டிஃபாக்டை (ஒரு கன்டெய்னர் படIMAGE அல்லது zip) கட்டமைக்கிறது. கட்டமைப்பு வெற்றி பெறுகிறது என்பதை சரிபார்க்க, வெளியீட்டை பரிசீலிக்க அல்லது பிற செயல்முறை மூலம் பின்னர் அமர்த்தப்பட வேண்டிய ஒரு ஆர்டிஃபாக்டை உருவாக்க இதை தனியாகப் பயன்படுத்துங்கள். `azd deploy` தானாகவே package செய்கிறது, ஆகையால் நீங்கள் டெப்ளோ செய்யாமல் ஆர்டிஃபாக்டை வேண்டுமென்றால் மட்டுமே `azd package` தேவைப்படும்.


## 🌍 சூழல் மேலாண்மை

### சூழல் செயல்பாடுகள்
```bash
# அனைத்து சூழல்களையும் பட்டியலிடவும்
azd env list

# புதிய சூழலை உருவாக்கவும்
azd env new development
azd env new staging --location westus2

# சூழலை தேர்ந்தெடுக்கவும்
azd env select production

# கிடைக்கும் சூழல்களை காட்டவும்
azd env list

# சூழலின் நிலையை புதுப்பிக்கவும்
azd env refresh
```

### சூழல் மாறிலிகள்
```bash
# சுற்றுச்சூழல் மாறியை அமைக்கவும்
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# சுற்றுச்சூழல் மாறியைப் பெறவும்
azd env get API_KEY

# எல்லா சுற்றுச்சூழல் மாறிகளையும் பட்டியலிடவும்
azd env get-values

# சுற்றுச்சூழல் மாறியை நீக்கவும்
azd env unset DEBUG
```

## ⚙️ அமைப்பு கட்டளைகள்

### உலகளாவிய அமைப்பு
```bash
# அனைத்து அமைப்புகளையும் பட்டியலிடு
azd config show

# உலகளாவிய இயல்புகளை அமைக்க
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# அமைப்பை நீக்கு
azd config unset defaults.location

# அனைத்து அமைப்புகளையும் மீட்டமை
azd config reset
```

### திட்ட அமைப்புகள்
```bash
# azure.yaml-ஐ சரிபார்க்கவும்
azd config validate

# திட்ட தகவல்களை காட்டவும்
azd show

# சேவை எண்ட்பாயின்டுகளைப் பெறவும்
azd show --output json
```

## 📊 மேற்பார்வை மற்றும் பகுப்பாய்வு (Diagnostics)

### மேற்பார்வை டாஷ்போர்டு
```bash
# Azure போர்டல் கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor

# Application Insights நேரடி அளவீடுகளை திறக்கவும்
azd monitor --live

# Application Insights பதிவுகள் பிளேட்டை திறக்கவும்
azd monitor --logs

# Application Insights மேலோட்டத்தை திறக்கவும்
azd monitor --overview
```

### கண்டெய்னர் பதிவுகள் பார்க்க
```bash
# Container Apps க்கான Azure CLI வழியாக லோக்களைப் பார்க்க
az containerapp logs show --name <app-name> --resource-group <rg-name>

# நேரடி முறையில் லோக்களை தொடர்ந்து பார்க்க
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure போர்டல் மூலம் லோக்களைப் பார்க்க
azd monitor --logs
```

### பதிவு பகுப்பாய்வு வினவல்கள்
```bash
# Azure போர்டல் மூலம் பதிவு பகுப்பாய்வை அணுகவும்
azd monitor --logs

# Azure CLI பயன்படுத்தி பதிவுகளை விசாரிக்கவும்
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ பராமரிப்பு கட்டளைகள்

### சுத்தப்படுத்துதல்
```bash
# எல்லா Azure வளங்களையும் நீக்கவும்
azd down

# உறுதிப்படுத்தலை கேட்காமல் கட்டாயமாக நீக்கவும்
azd down --force

# மென்மையாக நீக்கப்பட்ட வளங்களை நிரந்தரமாக அழிக்கவும்
azd down --purge

# முழுமையான சுத்திகரிப்பு
azd down --force --purge
```

### புதுப்பிப்புகள்
```bash
# azd இற்கான புதுப்பிப்புகளை சரிபார்
azd version

# தற்போதைய பதிப்பைப் பெறு
azd version

# தற்போதைய கட்டமைப்பை காண்
azd config show
```

## 🔧 மேம்பட்ட கட்டளைகள்

### பைப்லைன் மற்றும் CI/CD
```bash
# GitHub Actions ஐ அமைக்கவும்
azd pipeline config

# Azure DevOps ஐ அமைக்கவும்
azd pipeline config --provider azdo

# பைப்பிளைன் கட்டமைப்பை காட்டு
azd pipeline show
```

### கட்டமைப்பு மேலாண்மை
```bash
# இன்ஃப்ராஸ்ட்ரக்சர் வார்ப்புருக்களை உருவாக்கவும்
azd infra generate

# 🧪 இன்ஃப்ராஸ்ட்ரக்சர் முன்னோட்டம் மற்றும் திட்டமிடல்
azd provision --preview
# பயன்படுத்தாமல் இன்ஃப்ராஸ்ட்ரக்சர் ஒதுக்கீட்டை சிமுலேட் செய்கிறது
# Bicep/Terraform வார்ப்புருக்களை பகுப்பாய்வு செய்து காட்டுகிறது:
# - சேர்க்கப்பட வேண்டிய வளங்கள் (பச்சை +)
# - மாற்றப்பட வேண்டிய வளங்கள் (மஞ்சள் ~)
# - நீக்கப்பட வேண்டிய வளங்கள் (சிவப்பு -)
# இயக்குவதற்கு பாதுகாப்பானது - Azure சூழலுக்கு எந்தவொரு உண்மையான மாற்றமும் செய்யப்படாது

# azure.yaml-இல் இருந்து இன்ஃப்ராஸ்ட்ரக்சரை உருவாக்கவும்
azd infra synth
```

### திட்ட தகவல்
```bash
# திட்ட நிலை மற்றும் இடைமுகங்களை காட்டு
azd show

# விரிவான திட்ட தகவலை JSON வடிவில் காட்டு
azd show --output json

# சேவை இடைமுகங்களைப் பெறுக
azd show --output json | jq '.services'
```

## 🤖 AI மற்றும் விரிவாக்கக் கட்டளைகள்

### AZD விரிவாக்கங்கள்
```bash
# அனைத்து கிடைக்கக்கூடிய நீட்டிப்புகளை (AI உட்பட) பட்டியலிடவும்
azd extension list

# Foundry agents நீட்டிப்பை நிறுவவும்
azd extension install azure.ai.agents

# agent skills நீட்டிப்பை (முன்னோட்டம்) நிறுவவும்
azd extension install azure.ai.skills

# Foundry connections நீட்டிப்பை (முன்னோட்டம்) நிறுவவும்
azd extension install azure.ai.connections

# fine-tuning நீட்டிப்பை நிறுவவும்
azd extension install azure.ai.finetune

# custom models நீட்டிப்பை நிறுவவும்
azd extension install azure.ai.models

# நிறுவப்பட்ட அனைத்து நீட்டிப்புகளையும் மேம்படுத்தவும்
azd extension upgrade --all
```

### AI முகவர் கட்டளைகள்
```bash
# மாநிபெஸ்டில் இருந்து ஒரு முகவர் திட்டத்தை ஆரம்பிக்கவும்
azd ai agent init -m <manifest-path-or-uri>

# ஒரு குறிப்பிட்ட Foundry திட்டத்தை குறிக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# முகவர் மூல அடைவை குறிப்பிடவும்
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ஒரு ஹோஸ்டிங் இலக்கை தேர்ந்தெடுக்கவும்
azd ai agent init -m agent-manifest.yaml --host containerapp

# பதிவேற்றப்பட்ட முகவரை சோதிக்கவும் (இடைவெளி + முதல் பிட் வரையிலான நேரம் அச்சிடப்படும்)
azd ai agent invoke

# நேரடி எண்ட்பாயிண்ட் அமைப்பை காண்பிக்கவும்
azd ai agent endpoint show

# ஒரு மதிப்பீட்டு தரவுத்தொகுப்பை உருவாக்கி, பின்னர் முகவரை மேம்படுத்தவும்
azd ai agent eval generate
azd ai agent optimize

# கோடு அடிப்படையிலான ஹோஸ்ட் செய்யப்பட்ட முகவரின் பதிவேற்றப்பட்ட மூலத்தை பதிவிறக்கவும்
azd ai agent code download

# ஒரு ஹோஸ்ட் செய்யப்பட்ட முகவரையும் அதன் அனைத்து பதிப்புகளையும் நீக்கவும் (--force செயலில் உள்ள அமர்வுகளை முடிக்கிறது)
azd ai agent delete --force
```

### MCP சர்வர் (ஆல்ஃபா)
```bash
# உங்கள் திட்டத்திற்காக MCP சர்வரை தொடங்கவும்
azd mcp start

# MCP செயல்பாடுகளுக்கான கருவி ஒப்புதல்களை நிர்வகிக்கவும்
azd copilot consent list
```

### கட்டமைப்பு உருவாக்கம்
```bash
# உங்கள் திட்ட வரையறையிலிருந்து IaC கோப்புகளை உருவாக்கவும்
azd infra generate

# azure.yaml இலிருந்து கட்டமைப்பை உருவாக்கவும்
azd infra synth
```

---

## 🎯 விரைவு வேலைநடைகள்

### மேம்பாட்டு வேலைநடை
```bash
# புதிய திட்டத்தைத் தொடங்கு
azd init --template todo-nodejs-mongo
cd my-project

# வளர்ச்சி சூழலுக்கு வெளியிடு
azd env new dev
azd up

# மாற்றங்களைச் செய்து மீண்டும் வெளியிடு
azd deploy

# கண்காணிப்பு டாஷ்போர்டை திற
azd monitor --live
```

### பல-சூழல் வேலைநடை
```bash
# சூழல்களை அமைக்க
azd env new dev
azd env new staging  
azd env new production

# dev-க்கு வெளியிடு
azd env select dev
azd up

# சோதனை செய்து staging-க்கு முன்னேற்று
azd env select staging
azd up

# உற்பத்திக்கு வெளியிடு
azd env select production
azd up
```

### பிழைத் தீர்வு வேலைநடை
```bash
# டீபக் முறையை செயல்படுத்தவும்
export AZD_DEBUG=true

# வினியோகம் நிலையை சரிபார்க்கவும்
azd show

# கட்டமைப்பை சரிபார்க்கவும்
azd config show

# பதிவுகளுக்கான கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor --logs

# வள நிலையை சரிபார்க்கவும்
azd show --output json
```

## 🔍 பிழைதிருத்து கட்டளைகள்

### பிழைதிருத்து தகவல்கள்
```bash
# டீபக் வெளியீட்டை செயல்படுத்தவும்
export AZD_DEBUG=true
azd <command> --debug

# வெளியீடு சுத்தமாக இருக்கும் வகையில் டெலிமெட்ரியை முடக்கு
export AZD_DISABLE_TELEMETRY=true

# தற்போதைய கட்டமைப்பை சரிபார்க்கவும்
azd config show

# அங்கீகார நிலையை சரிபார்க்கவும்
az account show
```

### வார்ப்புரு பிழைதிருத்தல்
```bash
# விரிவான விவரங்களுடன் கிடைக்கும் வார்ப்புருக்களை பட்டியலிடு
azd template list --output json

# வார்ப்புரு தகவலை காட்டு
azd template show <template-name>

# துவக்கத்திற்கு முன் வார்ப்புருவைச் சரிபார்க்கு
azd template validate <template-name>
```

## 📁 கோப்பு மற்றும் அடைவு கட்டளைகள்

### திட்ட அமைப்பு
```bash
# தற்போதைய கோப்பக அமைப்பை காட்டு
tree /f  # விண்டோஸ்
find . -type f  # லினக்ஸ்/macOS

# azd திட்டத்தின் மூல கோப்பகத்திற்கு செல்ல
cd $(azd root)

# azd கட்டமைப்பு கோப்பகத்தை காட்டு
echo $AZD_CONFIG_DIR  # பொதுவாக ~/.azd
```

## 🎨 வெளியீட்டு வடிவமைப்பு

### JSON வெளியீடு
```bash
# ஸ்கிரிப்டிங்கிற்காக JSON வெளியீடு பெறவும்
azd show --output json
azd env list --output json
azd config show --output json

# jq பயன்படுத்தி பகுப்பாய்வு செய்யவும்
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### அட்டவணை வெளியீடு
```bash
# அட்டவணையாக வடிவமைக்கவும்
azd env list --output table

# பதிவேற்றப்பட்ட சேவைகளைப் பார்க்கவும்
azd show --output json | jq '.services | keys'
```

## 🔧 பொதுவான கட்டளை இணைப்புகள்

### ஆரோக்கியச் சோதனை ஸ்க்ரிப்ட்
```bash
#!/bin/bash
# விரைவு நலச் சரிபார்ப்பு
azd show
azd env get-values
azd monitor --logs
```

### வழங்கல் செல்லுபடுத்தல்
```bash
#!/bin/bash
# வெளியீட்டுக்கு முன் சரிபார்த்தல்
azd show
azd provision --preview  # வெளியிடுவதற்கு முன் மாற்றங்களை முன்னோட்டமாக பார்க்கவும்
az account show
```

### சூழல் ஒப்பீடு
```bash
#!/bin/bash
# சுற்றுச்சூழல்களை ஒப்பிடு
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### வள சுத்தப்படுத்தல் ஸ்க்ரிப்ட்
```bash
#!/bin/bash
# பழைய சூழல்களை சுத்தம் செய்யவும்
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 சூழல் மாறிலிகள்

### பொதுவான சூழல் மாறிலிகள்
```bash
# Azure கட்டமைப்பு
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD கட்டமைப்பு
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# விண்ணப்ப கட்டமைப்பு
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 அவசர கட்டளைகள்

### விரைவு சரிசெய்தல்கள்
```bash
# அங்கீகாரத்தை மீட்டமைக்கவும்
az account clear
az login

# சுற்றுச்சூழலை கட்டாயமாக புதுப்பிக்கவும்
azd env refresh

# அனைத்து சேவைகளையும் மீண்டும் நிறுவவும்
azd deploy

# பதிவேற்ற நிலையை சரிபார்க்கவும்
azd show --output json
```

### மீட்பு கட்டளைகள்
```bash
# தோல்வியுற்ற நிறுவலிலிருந்து மீட்பு - சுத்தம் செய்து மீண்டும் நிறுவவும்
azd down --force --purge
azd up

# அடிப்படை அமைப்பினை மட்டுமே மீண்டும் வழங்கவும்
azd provision

# பயன்பாட்டை மட்டும் மீண்டும் நிறுவவும்
azd deploy
```

## 💡 திறமையான குறிப்புகள்

### வேகமான வேலைநடைக்கான அலியாஸுகள்
```bash
# உங்கள் .bashrc அல்லது .zshrc கோப்பில் சேர்க்கவும்.
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### பணியின் குறுக்குவழிகள்
```bash
# சூழலை விரைவாக மாற்றுதல்
azd-env() {
    azd env select $1 && azd show
}

# கண்காணிப்புடன் கூடிய விரைவான அமர்த்தல்
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# சூழலின் நிலை
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 உதவி மற்றும் ஆவணங்கள்

### உதவி பெறுதல்
```bash
# பொது உதவி
azd --help
azd help

# கட்டளை-சார்ந்த உதவி
azd up --help
azd env --help
azd config --help

# பதிப்பு மற்றும் உருவாக்க தகவலை காட்டு
azd version
azd version --output json
```

### ஆவண இணைப்புகள்
```bash
# உலாவியில் ஆவணங்களைத் திறக்க
azd docs

# டெம்பிளேட் ஆவணங்களை காட்டு
azd template show <template-name> --docs
```

---

**குறிப்பு**: இந்த சுருக்கத்தினை புக் மார்க்க் செய்து தேவையான கட்டளைகளை விரைவாகக் கண்டுபிடிக்க `Ctrl+F` ஐ பயன்படுத்துங்கள்!

---

**வழிசல்**
- **முந்தைய பாடம்**: [முன்-அமர்த்தல் சரிபார்ப்புகள்](../docs/pre-deployment/preflight-checks.md)
- **அடுத்த பாடம்**: [அகராதி](glossary.md)

---

> **💡 உங்கள் எடிட்டரில் Azure கட்டளை உதவி வேண்டும் வேண்டுமா?** `[Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure)` ஐ `npx skills add microsoft/github-copilot-for-azure` மூலம் நிறுவுங்கள் — AI, Foundry, deployment, diagnostics மற்றும் மேலும் பலவகை 37 திறன்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->