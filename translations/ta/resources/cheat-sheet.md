# கட்டளை சுருக்கப் தாள் - அவசியமான AZD கட்டளைகள்

**எல்லா தலைப்புகளுக்கும் விரைவு குறிப்புரை**
- **📚 பாடநெறி முகப்பு**: [புதியவர்களுக்கு AZD](../README.md)
- **📖 விரைவு தொடக்கம்**: [அத்தியாயம் 1: அடித்தளம் மற்றும் விரைவு தொடக்கம்](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI கட்டளைகள்**: [அத்தியாயம் 2: AI-முதல் அபிவிருத்தி](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 மேம்பட்டவை**: [அத்தியாயம் 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## அறிமுகம்

இந்த விரிவான சுருக்கப் தாள் பயன்பாட்டுக் கேட்புகளுக்கு ஏற்ப பிரிவுகள் வாரியாக, நடைமுறை உதாரணங்களோடு ஒழுங்குபடுத்தப்பட்டு, அடிக்கடி பயன்படுத்தப்படும் Azure Developer CLI கட்டளைகளுக்கான விரைவு குறிப்புரையை வழங்குகிறது. azd திட்டங்களுடன் பணியாற்றும்போது அபிவிருத்தி, பிழைத்திருத்தம் மற்றும் தினசரி செயல்பாடுகளைத் தொடர்ந்து மேற்கொள்வதற்கு இது சிறந்தது.

## கற்றல் இலக்குகள்

By using this cheat sheet, you will:
- உடனடி அணுகல் பெறுவீர்கள் அவசியமான Azure Developer CLI கட்டளைகள் மற்றும் இலக்கணத்திற்கு
- கட்டளைகள் செயல்பாட்டு வகைகள் மற்றும் பயன்பாட்டு நிலைகளின் அடிப்படையில் எப்படி ஒழுங்குபடுத்தப்படுகின்றன என்பதை புரிந்து கொள்ள முடியும்
- பொதுவான அபிவிருத்தி மற்றும் பரப்பல் சூழ்நிலைகளுக்கான நடைமுறை உதாரணங்களை மேற்கோள் கொள்ள முடியும்
- பிரச்சனை தீர்க்கும் கட்டளைகளைப் பயன்படுத்தி உடனடி பிரச்சனை தீர்வுகளை பெற முடியும்
- மேம்பட்ட கட்டமைப்பு மற்றும் தனிப்பயன்திறன் விருப்பங்களை திறம்பட காணலாம்
- சூழல் மேலாண்மை மற்றும் பல-சூழல் பணிவழி கட்டளைகளை எளிதாக கண்டுபிடிக்கலாம்

## கற்றல் முடிவுகள்

With regular reference to this cheat sheet, you will be able to:
- முழு ஆவணங்களை பார்க்காமல் நம்பிக்கையுடன் azd கட்டளைகளை இயக்க முடியும்
- சரியான கண்டறிதல் கட்டளைகளைப் பயன்படுத்தி பொதுவான கோளாறுகளை விரைவாக தீர்க்கலாம்
- பல சூழல்களையும் பரப்பல் சூழ்நிலைகளையும் திறமையாக நிர்வகிக்க முடியும்
- தேவையானபோது மேம்பட்ட azd அம்சங்கள் மற்றும் கட்டமைப்பு விருப்பங்களைப் பயன்படுத்த முடியும்
- கட்டமைக்கப்பட்ட கட்டளை வரிசைகளைப் பயன்படுத்தி பரப்பல் பிரச்சனைகளை டிரபிள்ஷூட் செய்யலாம்
- azd குறுக்குவழிகள் மற்றும் விருப்பங்களை திறம்படப் பயன்படுத்தி பணிவழிகளை மேம்படுத்தலாம்

## தொடக்கம் கட்டளைகள்

### அங்கீகாரம்
```bash
# AZD மூலம் Azure இல் உள்நுழையவும்
azd auth login

# Azure CLI இல் உள்நுழையவும் (AZD இதை பின்னணியில் பயன்படுத்துகிறது)
az login

# தற்போதைய கணக்கை சரிபார்க்கவும்
az account show

# இயல்புநிலை சந்தாவை அமைக்கவும்
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD இல் இருந்து வெளியேறவும்
azd auth logout

# Azure CLI இல் இருந்து வெளியேறவும்
az logout
```

### திட்டத் தொடக்கம்
```bash
# கிடைக்கும் டெம்ப்ளேட்டுகளை உலாவு
azd template list

# டெம்ப்ளேட்டிலிருந்து ஆரம்பிக்க
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# நடப்பு அடைவில் ஆரம்பிக்க
azd init .

# தனிப்பயன் பெயருடன் ஆரம்பிக்க
azd init --template todo-nodejs-mongo my-awesome-app
```

## முக்கிய பரப்பல் கட்டளைகள்

### முழுமையான பரப்பும் பணிவழி
```bash
# எல்லாவற்றையும் வெளியிடு (வளங்களை ஏற்படுத்துதல் + நிறுவுதல்)
azd up

# உறுதிப்படுத்தும் கேள்விகள் முடக்கப்பட்டபடி வெளியிடு
azd up --confirm-with-no-prompt

# குறிப்பிட்ட சூழலுக்கு வெளியிடு
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் வெளியிடு
azd up --parameter location=westus2
```

### கட்டமைப்பு மட்டும்
```bash
# Azure வளங்களை வழங்கவும்
azd provision

# 🧪 கட்டமைப்பு மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview
# எந்த வளங்கள் உருவாக்கப்படவுள்ளன/மாற்றப்படவுள்ளன/நீக்கப்படவுள்ளன என்பதற்கு மாற்றமில்லான (dry-run) பார்வையை காட்டுகிறது
# 'terraform plan' அல்லது 'bicep what-if' போன்றது - இயக்குவதற்கு பாதுகாப்பானது, எந்த மாற்றங்களும் அமல்படுத்தப்படமாட்டாது
```

### செயலி மட்டும்
```bash
# அப்ளிகேஷன் குறியீட்டை வெளியிடு
azd deploy

# குறிப்பிட்ட சேவையை வெளியிடு
azd deploy --service web
azd deploy --service api

# அனைத்து சேவைகளையும் வெளியிடு
azd deploy --all
```

### கட்டமைத்தல் மற்றும் தொகுப்பாக்கம்
```bash
# பயன்பாடுகளை உருவாக்கு
azd package

# குறிப்பிட்ட சேவையை உருவாக்கு
azd package --service api
```

## 🌍 சூழல் மேலாண்மை

### சூழல் செயல்பாடுகள்
```bash
# அனைத்து சுற்றுச்சூழல்களையும் பட்டியலிடு
azd env list

# புதிய சுற்றுச்சூழலை உருவாக்கு
azd env new development
azd env new staging --location westus2

# சுற்றுச்சூழலை தேர்ந்தெடு
azd env select production

# தற்போதைய சுற்றுச்சூழலை காட்டு
azd env show

# சுற்றுச்சூழலின் நிலையை புதுப்பி
azd env refresh
```

### சூழல் மாறிகள்
```bash
# சூழல் மாறியை அமைக்க
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# சூழல் மாறியை பெற
azd env get API_KEY

# அனைத்து சூழல் மாறிகளையும் பட்டியலிடு
azd env get-values

# சூழல் மாறியை நீக்கு
azd env unset DEBUG
```

## ⚙️ கட்டமைப்பு கட்டளைகள்

### உலகளாவிய கட்டமைப்பு
```bash
# அனைத்து கட்டமைப்புகளையும் பட்டியலிடவும்
azd config list

# உலகளாவிய இயல்புகளை அமைக்கவும்
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# கட்டமைப்பை அகற்றவும்
azd config unset defaults.location

# அனைத்து கட்டமைப்புகளையும் மீட்டமைக்கவும்
azd config reset
```

### திட்ட கட்டமைப்பு
```bash
# azure.yaml ஐ சரிபாரிக்கவும்
azd config validate

# திட்டத்தின் தகவல்களை காண்பிக்கவும்
azd show

# சேவை எண்ட்பாயிண்டுகளைப் பெறவும்
azd show --output json
```

## 📊 கண்காணிப்பு மற்றும் கண்டறிதல்

### கண்காணிப்பு டாஷ்போர்டு
```bash
# Azure போர்டல் கண்காணிப்பு டாஷ்போர்டைப் திறக்கவும்
azd monitor

# Application Insights நேரடி அளவுருக்களை திறக்கவும்
azd monitor --live

# Application Insights பதிவுகள் பிளேட்டை திறக்கவும்
azd monitor --logs

# Application Insights கண்ணோட்டத்தை திறக்கவும்
azd monitor --overview
```

### கன்டெய்னர் பதிவுகளை பார்க்குதல்
```bash
# Azure CLI மூலம் பதிவுகளை காண்க (Container Apps க்காக)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# பதிவுகளை நேரடியாக பின்தொடரவும்
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure போர்டலிலிருந்து பதிவுகளை காண்க
azd monitor --logs
```

### பதிவு பகுப்பாய்வு கேள்விகள்
```bash
# Azure போர்டல் மூலம் Log Analytics-க்கு அணுகவும்
azd monitor --logs

# Azure CLI-ஐப் பயன்படுத்தி பதிவுகளை தேடவும்
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ பராமரிப்பு கட்டளைகள்

### சுத்திகரிப்பு
```bash
# அனைத்து Azure வளங்களை அகற்று
azd down

# உறுதிப்படுத்தல் இல்லாமல் கட்டாயமாக நீக்கு
azd down --force

# மென்மையாக நீக்கப்பட்ட வளங்களை நிரந்தரமாக அழிக்க
azd down --purge

# முழுமையான சுத்திகரிப்பு
azd down --force --purge
```

### புதுப்பிப்புகள்
```bash
# azd புதுப்பிப்புகளை சோதிக்கவும்
azd version

# தற்போதைய பதிப்பை பெறவும்
azd version

# தற்போதைய கட்டமைப்பைப் பார்க்கவும்
azd config list
```

## 🔧 மேம்பட்ட கட்டளைகள்

### பைப்லைன் மற்றும் CI/CD
```bash
# GitHub Actions ஐ அமைக்க
azd pipeline config

# Azure DevOps ஐ அமைக்க
azd pipeline config --provider azdo

# பைப்லைன் கட்டமைப்பைக் காட்டு
azd pipeline show
```

### கட்டமைப்பு மேலாண்மை
```bash
# மூலமைப்பு வார்ப்புருக்களை உருவாக்குக
azd infra generate

# 🧪 மூலமைப்பு முன்னோட்டம் மற்றும் திட்டமிடல்
azd provision --preview
# deploy செய்யாமல் (நிறுவாமல்) மூலமைப்பு வழங்கலை மாதிரியாக்குகிறது
# Bicep/Terraform வார்ப்புருக்களை பகுப்பாய்வு செய்து காட்டுகிறது:
# - சேர்க்கப்பட வேண்டிய வளங்கள் (பச்சை +)
# - மாற்றப்பட வேண்டிய வளங்கள் (மஞ்சள் ~)
# - நீக்கப்பட வேண்டிய வளங்கள் (சிவப்பு -)
# ஓடுவதற்கு பாதுகாப்பானது - Azure சூழலில் எந்தவொரு உண்மையான மாற்றமும் செய்யப்படாது

# azure.yaml-இலிருந்து மூலமைப்பை உருவாக்கவும்
azd infra synth
```

### திட்ட தகவல்கள்
```bash
# திட்ட நிலை மற்றும் எண்ட்​பாயிண்டுகளை காண்பி
azd show

# திட்டத்தின் விரிவான தகவலை JSON வடிவில் காண்பி
azd show --output json

# சேவை எண்ட்​பாயிண்டுகளைப் பெற
azd show --output json | jq '.services'
```

## 🤖 AI மற்றும் நீட்டிப்புக் கட்டளைகள்

### AZD நீட்டிப்புகள்
```bash
# அனைத்து கிடைக்கும் நீட்டிப்புகளை (AI உட்பட) பட்டியலிடு
azd extension list

# Foundry agents நீட்டிப்பை நிறுவு
azd extension install azure.ai.agents

# நுணுக்க சீரமைப்பு நீட்டிப்பை நிறுவு
azd extension install azure.ai.finetune

# தனிப்பயன் மாதிரிகள் நீட்டிப்பை நிறுவு
azd extension install azure.ai.models

# நிறுவப்பட்ட அனைத்து நீட்டிப்புகளையும் மேம்படுத்து
azd extension upgrade --all
```

### AI முகவர் கட்டளைகள்
```bash
# மெனிபெஸ்ட் கோப்பை பயன்படுத்தி ஒரு ஏஜென்ட் திட்டத்தை ஆரம்பிக்கவும்
azd ai agent init -m <manifest-path-or-uri>

# ஒரு குறிப்பிட்ட Foundry திட்டத்தை இலக்காக அமைக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ஏஜென்ட் மூலக் கோப்புறையைக் குறிப்பிடவும்
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ஹோஸ்டிங் இலக்கை தேர்ந்தெடுக்கவும்
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# உங்கள் திட்டத்திற்காக MCP சேவையகத்தை தொடங்கவும்
azd mcp start

# MCP செயல்பாடுகளுக்கான கருவி ஒப்புதலை நிர்வகிக்கவும்
azd mcp consent
```

### கட்டமைப்பு உருவாக்குதல்
```bash
# உங்கள் திட்ட வரையறையிலிருந்து IaC கோப்புகளை உருவாக்கவும்
azd infra generate

# azure.yaml இலிருந்து அடித்தள கட்டமைப்பை உருவாக்கவும்
azd infra synth
```

---

## 🎯 விரைவு பணிவழிகள்

### அபிவிருத்தி பணிவழி
```bash
# புதிய திட்டத்தை தொடங்கு
azd init --template todo-nodejs-mongo
cd my-project

# வளர்ச்சி சூழலுக்கு வெளியிடு
azd env new dev
azd up

# மாற்றங்களைச் செய்து மீண்டும் வெளியிடு
azd deploy

# கண்காணிப்பு பலகையைத் திற
azd monitor --live
```

### பல-சூழல் பணிவழி
```bash
# சூழல்களை அமைக்கவும்
azd env new dev
azd env new staging  
azd env new production

# வளர்ச்சி (dev) சூழலுக்கு வெளியிடவும்
azd env select dev
azd up

# சோதனை செய்து ஸ்டேஜிங் சூழலுக்கு மேம்படுத்தவும்
azd env select staging
azd up

# உற்பத்தி (production) சூழலுக்கு வெளியிடவும்
azd env select production
azd up
```

### பிரச்சனை தீர்க்கும் பணிவழி
```bash
# பிழைத் திருத்தும் முறையை செயல்படுத்தவும்
export AZD_DEBUG=true

# வெளியீட்டு நிலையை சரிபார்க்கவும்
azd show

# கட்டமைப்பை சரிபார்க்கவும்
azd config list

# பதிவுகளுக்கான கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor --logs

# வள நிலையை சரிபார்க்கவும்
azd show --output json
```

## 🔍 டீபக்கிங் கட்டளைகள்

### டீபக்கிங் தகவல்கள்
```bash
# டீபக் வெளியீட்டை இயக்கு
export AZD_DEBUG=true
azd <command> --debug

# தெளிவான வெளியீடிற்காக டெலிமெட்ரியை முடக்கு
export AZD_DISABLE_TELEMETRY=true

# தற்போதைய கட்டமைப்பை சரிபார்
azd config list

# அங்கீகார நிலையை சரிபார்
az account show
```

### வார்ப்புரு டீபக்கிங்
```bash
# கிடைக்கக்கூடிய டெம்ப்ளேடுகளை விவரங்களுடன் பட்டியலிடவும்
azd template list --output json

# டெம்ப்ளேட் தகவலைக் காட்டவும்
azd template show <template-name>

# init ஐ தொடங்குவதற்கு முன் டெம்ப்ளேட்டை சரிபார்க்கவும்
azd template validate <template-name>
```

## 📁 கோப்பு மற்றும் அடைவு கட்டளைகள்

### திட்ட அமைப்பு
```bash
# தற்போதைய கோப்புறை அமைப்பைக் காட்டு
tree /f  # விண்டோஸ்
find . -type f  # லினக்ஸ்/macOS

# azd திட்டத்தின் மூல கோப்புறைக்கு செல்லவும்
cd $(azd root)

# azd கட்டமைப்பு கோப்புறையை காட்டு
echo $AZD_CONFIG_DIR  # சாதாரணமாக ~/.azd
```

## 🎨 வெளியீட்டு வடிவமைப்பு

### JSON வெளியீடு
```bash
# ஸ்கிரிப்டிங்கிற்கு JSON வெளியீட்டை பெறுக
azd show --output json
azd env list --output json
azd config list --output json

# jq-ஐப் பயன்படுத்தி பகுப்பாய்வு செய்க
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### அட்டவணை வெளியீடு
```bash
# அட்டவணையாக வடிவமைக்க
azd env list --output table

# பதிவேற்றப்பட்ட சேவைகளை பார்வையிட
azd show --output json | jq '.services | keys'
```

## 🔧 பொதுவான கட்டளைப் இணைப்புகள்

### நிலை சரிபார்ப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# விரைவு நலச் சரிபார்ப்பு
azd show
azd env show
azd monitor --logs
```

### பரப்பல் சரிபார்ப்பு
```bash
#!/bin/bash
# வெளியீட்டிற்கு முன் சரிபார்ப்பு
azd show
azd provision --preview  # வெளியீடு செய்யும் முன் மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
az account show
```

### சூழல் ஒப்பீடு
```bash
#!/bin/bash
# சூழல்களை ஒப்பிடு
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### வளம் சுத்திகரிப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# பழைய சூழல்களை நீக்கவும்
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 சூழல் மாறிகள்

### பொதுமையான சூழல் மாறிகள்
```bash
# Azure கட்டமைப்பு
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD கட்டமைப்பு
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# பயன்பாட்டு கட்டமைப்பு
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 அவசர கட்டளைகள்

### விரைவு சரிசெய்திகள்
```bash
# அங்கீகாரத்தை மீட்டமைக்கவும்
az account clear
az login

# சூழலை கட்டாயமாக புதுப்பிக்கவும்
azd env refresh

# அனைத்து சேவைகளையும் மீண்டும் நிலைநிறுத்தவும்
azd deploy

# நிலைநிறுத்தல் நிலையை சரிபார்க்கவும்
azd show --output json
```

### மீட்பு கட்டளைகள்
```bash
# தோல்வியுற்ற வழங்கலிலிருந்து மீட்க — சுத்தம் செய்து மீண்டும் வழங்கவும்
azd down --force --purge
azd up

# அடித்தளத்தை மட்டுமே மீண்டும் வழங்கவும்
azd provision

# பயன்பாட்டை மட்டுமே மீண்டும் வழங்கவும்
azd deploy
```

## 💡 வல்லுநர் குறிப்புகள்

### வேகமான பணிவழிக்கான அலியாஸ்கள்
```bash
# உங்கள் .bashrc அல்லது .zshrc இல் சேர்க்கவும்
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### செயல்பாடு குறுக்குவழிகள்
```bash
# துரித சூழல் மாற்றம்
azd-env() {
    azd env select $1 && azd show
}

# கண்காணிப்புடன் கூடிய விரைவு வெளியீடு
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# சூழலின் நிலை
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 உதவி மற்றும் ஆவணங்கள்

### உதவி பெறுதல்
```bash
# பொதுவான உதவி
azd --help
azd help

# கட்டளை-சார்ந்த உதவி
azd up --help
azd env --help
azd config --help

# பதிப்பு மற்றும் கட்டமைப்பு தகவலைக் காட்டு
azd version
azd version --output json
```

### ஆவண இணைப்புகள்
```bash
# உலாவியில் ஆவணத்தை திற
azd docs

# வார்ப்புரு ஆவணத்தை காட்டு
azd template show <template-name> --docs
```

---

**குறிப்பு**: இந்த சுருக்கப் தாளை புத்தகக் குறியிடவும் மற்றும் தேவைப்படும் கட்டளைகளை விரைவாக கண்டுபிடிக்க `Ctrl+F` ஐப் பயன்படுத்தவும்!

---

**நெவிகேஷன்**
- **முந்தைய பாடம்**: [முன்-சோதனைச் சரிபார்ப்புகள்](../docs/pre-deployment/preflight-checks.md)
- **அடுத்த பாடம்**: [அகராதி](glossary.md)

---

> **💡 உங்கள் எடிட்டரில் Azure கட்டளை உதவி வேண்டுமா?** நிறுவவும் [Microsoft Azure Agent திறன்கள்](https://skills.sh/microsoft/github-copilot-for-azure) ஐ `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, deployment, கண்டறிதல் மற்றும் இன்னும் பலவற்றிற்காக 37 திறன்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவியம் AI மொழிபெயர்ப்பு சேவை Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்தைக் காக்க முயலினாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான விவரங்கள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். மூல ஆவியம் அதன் சொந்த மொழியிலேயே அதிகாரபூர்வமான மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பயன்படுத்துமாறு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதிலிருந்து ஏற்பட்ட quaisquer தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்காக நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->