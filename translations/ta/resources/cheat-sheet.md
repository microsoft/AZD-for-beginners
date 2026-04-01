# கட்டளை சுருக்கக் குறிப்பேடு - அவசியமான AZD கட்டளைகள்

**அனைத்து அத்தியாயங்களுக்கான விரைவு குறிப்பு**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கர்களுக்கான](../README.md)
- **📖 வேகமான தொடக்கம்**: [அத்தியாயம் 1: அடித்தளம் மற்றும் வேகமான தொடக்கம்](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI கட்டளைகள்**: [அத்தியாயம் 2: AI-முதன்மை வளர்ச்சி](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 மேம்பட்டவை**: [அத்தியாயம் 4: குறியாக்கமாகும் அடிப்படை அமைப்புகள்](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## அறிமுகம்

இந்த விரிவான சுருக்கக் குறிப்புப் பட்டியல் பொதுவாகப் பயன்படுத்தப்படும் Azure Developer CLI கட்டளைகளை பிரிவுகள் மற்றும் நடைமுறை உதாரணங்களின் அடிப்படையில் ஒழுங்குபடுத்தி விரைவாக அணுகலுக்காக வழங்குகிறது. azd திட்டங்களோடு மேம்பாடு, பிழைதிருத்தம் மற்றும் தினசரி செயல்பாடுகளில் விரைவாக பார்க்க சிறந்தது.

## கற்கும் இலக்குகள்

இந்த சுருக்கக் குறிப்பைப் பயன்படுத்துவதன் மூலம் நீங்கள்:
- அவசியமான Azure Developer CLI கட்டளைகள் மற்றும் அவற்றின் வடிவமைப்புக்கு உடனடி அணுகலைக் கொண்டிருப்பீர்கள்
- கட்டளைகள் பணி அடிப்படை பிரிவுகள் மற்றும் பயன்பாட்டு வழக்குகளின் படி எப்படி ஒழுங்குபடுத்தப்பட்டுள்ளன என்பதைப் புரிந்துகொள்வீர்கள்
- பொதுவான மேம்பாடு மற்றும் பதிவேற்ற சூழல்களுக்கு நடைமுறை உதாரணங்களை மேற்கோளிடுவீர்கள்
- விரைவான பிரச்சனை தீர்விற்கு பிழைதிருத்தக் கட்டளைகளுக்கு அணுகல் பெறுவீர்கள்
- மேம்பட்ட கட்டமைப்பு மற்றும் தனிப்பயன்படுத்தல் விருப்பங்களை திறம்பட கண்டுபிடிப்பீர்கள்
- சூழல் மேலாண்மை மற்றும் பல-சூழல் பணிச்சுழற்சி கட்டளைகளை இடத்தை கண்டுபிடிப்பீர்கள்

## கற்றல் முடிவுகள்

இந்த சுருக்கத்தை அல்டித்து வைத்துக்கொண்டால், நீங்கள்:
- முழு ஆவணத்தை பார்க்காமல் தன்னம்பிக்கையுடன் azd கட்டளைகளை இயக்கு முடிப்பீர்கள்
- பொருத்தமான கண்டறிதல் கட்டளைகளை பயன்படுத்தி பொதுவான பிரச்சனைகளை விரைவாக தீர்க்க முடிப்பீர்கள்
- பல சூழல்களை மற்றும் பதிவேற்ற சூழல்களை திறம்பட நிர்வகிப்பீர்கள்
- தேவையான போது azd-ன் மேம்பட்ட அம்சங்கள் மற்றும் கட்டமைப்பு விருப்பங்களை பயன்படுத்தப்போகமுடியும்
- முறையான கட்டளை வரிசைகளைப் பயன்படுத்தி பதிவேற்ற பிரச்சனைகளை பிழைதிருத்த முடியும
- azd சுருக்கங்கள் மற்றும் விருப்பங்களின் பயனுள்ள பயன்பாட்டினால் பணிச்சுழற்சிகளை சிறப்பாக சீரமைக்கமுடியும்

## தொடக்கம் கட்டளைகள்

### அங்கீகாரம்
```bash
# AZD மூலம் Azure இல் உள்நுழைக
azd auth login

# Azure CLI-க்கு உள்நுழைக (AZD இதை பின்புலத்தில் பயன்படுத்துகிறது)
az login

# தற்போதைய கணக்கைச் சரிபார்க்கவும்
az account show

# இயல்புநிலை சந்தாவை அமைக்கவும்
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD-இலிருந்து வெளியேறவும்
azd auth logout

# Azure CLI-இலிருந்து வெளியேறவும்
az logout
```

### திட்ட தொடக்கம்
```bash
# கிடைக்கக்கூடிய டெம்ப்ளேட்டுகளை உலாவவும்
azd template list

# டெம்ப்ளேட்டில் இருந்து ஆரம்பிக்கவும்
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# தற்போதைய அடைவில் ஆரம்பிக்கவும்
azd init .

# தனிப்பட்ட பெயருடன் ஆரம்பிக்கவும்
azd init --template todo-nodejs-mongo my-awesome-app
```

## முக்கிய பதிவேற்றக் கட்டளைகள்

### முழு பதிவேற்று பணிச்சுழற்சி
```bash
# எல்லாவற்றையும் வெளியிடு (வழங்குதல் + வெளியீடு)
azd up

# உறுதிப்படுத்தல் கேட்கப்படாமலேயே வெளியிடு
azd up --confirm-with-no-prompt

# குறிப்பிட்ட சுற்றுச்சூழலுக்கு வெளியிடு
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் வெளியிடு
azd up --parameter location=westus2
```

### இன்ஃப்ராஸ்ட்ரக்சர் மட்டும்
```bash
# Azure வளங்களை ஒதுக்கி உருவாக்குதல்
azd provision

# 🧪 கட்டமைப்பு மாற்றங்களை முன்னோட்டமாகப் பார்க்க
azd provision --preview
# எந்த வளங்கள் உருவாக்கப்படுவது/மாற்றப்படுவது/நீக்கப்படுவது என்பதை ஒரு (dry-run) முன்னோட்டமாக காண்பிக்கிறது
# இது 'terraform plan' அல்லது 'bicep what-if' போன்றது — இயக்கத்துக்கு பாதுகாப்பானது; எந்த மாற்றமும் பொருத்தப்பட மாட்டாது
```

### பயன்பாடு மட்டும்
```bash
# பயன்பாட்டு குறியீட்டை வெளியிடு
azd deploy

# குறிப்பிட்ட சேவையை வெளியிடு
azd deploy --service web
azd deploy --service api

# அனைத்து சேவைகளையும் வெளியிடு
azd deploy --all
```

### உருவாக்கல் மற்றும் தொகுப்பு
```bash
# விண்ணப்பங்களை உருவாக்குதல்
azd package

# குறிப்பிட்ட சேவையை உருவாக்குதல்
azd package --service api
```

## 🌍 சூழல் மேலாண்மை

### சூழல் செயல்பாடுகள்
```bash
# அனைத்து சுற்றுச்சூழல்களையும் பட்டியலிடவும்
azd env list

# புதிய சுற்றுச்சூழலை உருவாக்கவும்
azd env new development
azd env new staging --location westus2

# சுற்றுச்சூழலைத் தேர்ந்தெடுக்கவும்
azd env select production

# கிடைக்கும் சுற்றுச்சூழல்களை காட்டவும்
azd env list

# சுற்றுச்சூழலின் நிலையை புதுப்பிக்கவும்
azd env refresh
```

### சூழல் மாறிலிகள்
```bash
# சூழல் மாறியை அமைக்கவும்
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# சூழல் மாறியை பெறவும்
azd env get API_KEY

# எல்லா சூழல் மாறிகளையும் பட்டியலிடவும்
azd env get-values

# சூழல் மாறியை அகற்றவும்
azd env unset DEBUG
```

## ⚙️ கட்டமைப்பு கட்டளைகள்

### உலகளாவிய கட்டமைப்பு
```bash
# அனைத்து அமைப்புகளையும் பட்டியலிடவும்
azd config show

# உலகளாவிய முன்னிருப்புகளை அமைக்கவும்
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# அமைப்பை நீக்கவும்
azd config unset defaults.location

# அனைத்து அமைப்புகளை மீட்டமைக்கவும்
azd config reset
```

### திட்ட கட்டமைப்பு
```bash
# azure.yaml ஐ சரிபார்க்கவும்
azd config validate

# திட்டத்தின் தகவல்களை காட்டு
azd show

# சேவை எண்ட்பாயின்டுகளை பெறவும்
azd show --output json
```

## 📊 கண்காணிப்பு மற்றும் கண்டறிதல்கள்

### கண்காணிப்பு பலகை
```bash
# Azure போர்டல் கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor

# Application Insights நேரடி அளவுகோல்களை திறக்கவும்
azd monitor --live

# Application Insights பதிவுகள் பிளேட்டை திறக்கவும்
azd monitor --logs

# Application Insights முன்னோட்டத்தை திறக்கவும்
azd monitor --overview
```

### கொன்டெய்னர் பதிவுகளை காண்பது
```bash
# Azure CLI மூலம் Container Apps க்கான பதிவுகளைப் பார்க்கவும்
az containerapp logs show --name <app-name> --resource-group <rg-name>

# பதிவுகளை நேரடியாக பின்தொடரவும்
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure போர்டலில் இருந்து பதிவுகளைப் பார்க்கவும்
azd monitor --logs
```

### பதிவு பகுப்பாய்வு வினவல்கள்
```bash
# Azure போர்டல் மூலம் Log Analytics-ஐ அணுகவும்
azd monitor --logs

# Azure CLI பயன்படுத்தி பதிவுகளை விசாரணை செய்யவும்
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ பராமரிப்பு கட்டளைகள்

### சுத்தம் செய்தல்
```bash
# அனைத்து Azure வளங்களையும் நீக்கவும்
azd down

# உறுதிப்படுத்தலின்றி கட்டாயமாக நீக்கவும்
azd down --force

# மென்மையாக நீக்கப்பட்ட வளங்களை நிரந்தரமாக அகற்று
azd down --purge

# முழுமையான சுத்திகரிப்பு
azd down --force --purge
```

### புதுப்பிப்புகள்
```bash
# azd புதுப்பிப்புகளைச் சரிபார்க்க
azd version

# தற்போதைய பதிப்பை பெற
azd version

# தற்போதைய கட்டமைப்பைக் பார்க்க
azd config show
```

## 🔧 மேம்பட்ட கட்டளைகள்

### பைப்ப்லைன் மற்றும் CI/CD
```bash
# GitHub Actions ஐ அமைக்கவும்
azd pipeline config

# Azure DevOps ஐ அமைக்கவும்
azd pipeline config --provider azdo

# பைப்பிளைன் கட்டமைப்பை காட்டு
azd pipeline show
```

### இன்ஃப்ராஸ்ட்ரக்சர் நிர்வாகம்
```bash
# அடித்தள வார்ப்புருக்களை உருவாக்கு
azd infra generate

# 🧪 அடித்தள முன்னோட்டம் மற்றும் திட்டமிடல்
azd provision --preview
# அடித்தள வழங்கலை பயன்படுத்தாமல் பிம்பமாகக் காட்டுகிறது
# Bicep/Terraform வார்ப்புருக்களை பகுப்பாய்வு செய்து காட்டுகிறது:
# - சேர்க்கப்பட வேண்டிய வளங்கள் (பச்சை +)
# - மாற்றப்பட வேண்டிய வளங்கள் (மஞ்சள் ~)
# - நீக்கப்பட வேண்டிய வளங்கள் (சிகப்பு -)
# இதை இயக்குவது பாதுகாப்பானது - Azure சுற்றுச்சூழலில் எந்தவொரு உண்மையான மாற்றமும் செய்யப்படாது

# azure.yaml-இல் இருந்து அடித்தளத்தை உருவாக்கு
azd infra synth
```

### திட்ட தகவல்
```bash
# திட்டத்தின் நிலை மற்றும் எண்ட்பாயிண்ட்களை காட்டு
azd show

# விரிவான திட்ட தகவல்களை JSON வடிவில் காட்டு
azd show --output json

# சேவை எண்ட்பாயிண்ட்களை பெறு
azd show --output json | jq '.services'
```

## 🤖 AI & நீட்டிப்புகள் கட்டளைகள்

### AZD நீட்டிப்புகள்
```bash
# அனைத்து கிடைக்கும் விரிவாக்கங்களை (AI உட்பட) பட்டியலிடவும்
azd extension list

# Foundry agents விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.agents

# fine-tuning விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.finetune

# custom models விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.models

# நிறுவப்பட்ட அனைத்து விரிவாக்கங்களையும் மேம்படுத்தவும்
azd extension upgrade --all
```

### AI முகவர் கட்டளைகள்
```bash
# மேனிபெஸ்டில் இருந்து ஒரு ஏஜெண்ட் திட்டத்தை துவக்கவும்
azd ai agent init -m <manifest-path-or-uri>

# ஒரு குறிப்பிட்ட Foundry திட்டத்தை குறிக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ஏஜெண்ட் மூல கோப்புறையை குறிப்பிடவும்
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ஹோஸ்டிங் இலக்கை தேர்ந்தெடுக்கவும்
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP சர்வர் (ஆல்பா)
```bash
# உங்கள் திட்டத்திற்காக MCP சர்வரை துவங்கவும்
azd mcp start

# MCP செயல்பாடுகளுக்கான கருவி ஒப்புதலை நிர்வகிக்கவும்
azd copilot consent list
```

### இன்ஃப்ராஸ்ட்ரக்சர் உருவாக்கம்
```bash
# உங்கள் திட்ட வரையறையிலிருந்து IaC கோப்புகளை உருவாக்கவும்
azd infra generate

# azure.yaml-இலிருந்து அடித்தளக் கட்டமைப்பை ஒருங்கிணைத்து உருவாக்கவும்
azd infra synth
```

---

## 🎯 விரைவு பணிச்சுழற்சிகள்

### வளர்ச்சி பணிச்சுழற்சி
```bash
# புதிய திட்டத்தை துவக்கவும்
azd init --template todo-nodejs-mongo
cd my-project

# வளர்ச்சி சூழலுக்கு வெளியிடவும்
azd env new dev
azd up

# மாற்றங்களைச் செய்து மீண்டும் வெளியிடவும்
azd deploy

# கண்காணிப்பு டாஷ்போர்ட்டை திறவும்
azd monitor --live
```

### பல சூழல் பணிச்சுழற்சி
```bash
# சூழல்களை அமைக்க
azd env new dev
azd env new staging  
azd env new production

# வளர்ச்சி (dev) சூழலுக்கு வெளியிடு
azd env select dev
azd up

# சோதனை செய்து ஸ்டேஜிங் சூழலுக்கு முன்னேற்று
azd env select staging
azd up

# தயாரிப்பு (production) சூழலுக்கு வெளியிடு
azd env select production
azd up
```

### பிழைதிருத்தும் பணிச்சுழற்சி
```bash
# டீபக் முறை இயக்கவும்
export AZD_DEBUG=true

# பதிவேற்ற நிலையை சரிபார்க்கவும்
azd show

# கட்டமைப்பை சரிபார்க்கவும்
azd config show

# பதிவுகளுக்கான கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor --logs

# வள நிலையை சரிபார்க்கவும்
azd show --output json
```

## 🔍 பிழைதிருத்து கட்டளைகள்

### பிழைதிருத்தத் தகவல்கள்
```bash
# டீபக் வெளியீட்டை இயக்கு
export AZD_DEBUG=true
azd <command> --debug

# சுத்தமான வெளியீட்டுக்காக டெலிமெட்ரியை முடக்கு
export AZD_DISABLE_TELEMETRY=true

# தற்போதைய கட்டமைப்பை சரிபார்
azd config show

# அங்கீகார நிலையை சரிபார்
az account show
```

### டெம்ப்ளேட் பிழைதிருத்தல்
```bash
# விவரங்களுடன் கிடைக்கும் வார்ப்புருக்களை பட்டியலிடவும்
azd template list --output json

# வார்ப்புரு தகவலைக் காண்பிக்கவும்
azd template show <template-name>

# initக்கு முன் வார்ப்புருவை சரிபார்க்கவும்
azd template validate <template-name>
```

## 📁 கோப்பு மற்றும் அடைவுக் கட்டளைகள்

### திட்ட அமைப்பு
```bash
# தற்போதைய அடைவு அமைப்பை காண்பி
tree /f  # விண்டோஸ்
find . -type f  # லினக்ஸ்/macOS

# azd திட்டத்தின் மூல அடைவிற்கு செல்ல
cd $(azd root)

# azd கட்டமைப்பு அடைவைக் காட்டு
echo $AZD_CONFIG_DIR  # பொதுவாக ~/.azd
```

## 🎨 வெளியீட்டு வடிவமைத்தல்

### JSON வெளியீடு
```bash
# ஸ்கிரிப்டிங்கிற்காக JSON வெளியீடு பெற
azd show --output json
azd env list --output json
azd config show --output json

# jq-ஐ பயன்படுத்தி பகுப்பாய்வு செய்க
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### அட்டவணை வெளியீடு
```bash
# அட்டவணையாக வடிவமைக்கவும்
azd env list --output table

# நிறுவப்பட்ட சேவைகளைப் பார்க்க
azd show --output json | jq '.services | keys'
```

## 🔧 பொதுவான கட்டளை இணைப்புகள்

### ஆரோக்கியச் சோதனை ஸ்கிரிப்ட்
```bash
#!/bin/bash
# விரைவு நலச் சோதனை
azd show
azd env get-values
azd monitor --logs
```

### பதிவேற்று சரிபார்த்தல்
```bash
#!/bin/bash
# வெளியீடுக்கு முன் சரிபார்த்தல்
azd show
azd provision --preview  # வெளியீடு செய்வதற்கு முன் மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
az account show
```

### சூழல் ஒப்பீடு
```bash
#!/bin/bash
# சூழ்நிலைகளை ஒப்பிடுக
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### வளங்கள் சுத்தம் செய்வது ஸ்கிரிப்ட்
```bash
#!/bin/bash
# பழைய சுற்றுச்சூழல்களை சுத்தம் செய்
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 சூழல் மாறிலிகள்

### பொதுக் சூழல் மாறிலிகள்
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
# அடையாளத்தை மீட்டமை
az account clear
az login

# சூழலை மجبூராக புதுப்பிக்க
azd env refresh

# அனைத்து சேவைகளையும் மீண்டும் பணியமர்த்து
azd deploy

# பணியமர்த்தல் நிலையை சரிபார்க்க
azd show --output json
```

### மீட்பு கட்டளைகள்
```bash
# தோல்வியடைந்த வழங்கலிலிருந்து மீட்கவும் - சுத்தம் செய்து மீண்டும் வழங்கவும்
azd down --force --purge
azd up

# அடித்தள அமைப்பை மட்டும் மீண்டும் வழங்கவும்
azd provision

# விண்ணப்பத்தை மட்டுமே மீண்டும் வழங்கவும்
azd deploy
```

## 💡 தொழில்முறை குறிப்புகள்

### விரைவான பணிச்சுழற்சிக்கான அலியாஸ்கள்
```bash
# உங்கள் .bashrc அல்லது .zshrc கோப்பில் சேர்க்கவும்
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### செயல்பாட்டு சுருக்கங்கள்
```bash
# சூழல்களை விரைவாக மாறுதல்
azd-env() {
    azd env select $1 && azd show
}

# கண்காணிப்புடன் கூடிய விரைவான வெளியீடு
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# சூழல் நிலை
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
# பொதுவான உதவி
azd --help
azd help

# கட்டளை-சார்ந்த உதவி
azd up --help
azd env --help
azd config --help

# பதிப்பு மற்றும் உருவாக்க தகவல்களை காட்டு
azd version
azd version --output json
```

### ஆவண இணைப்புகள்
```bash
# ஆவணங்களை உலாவியில் திற
azd docs

# வார்ப்புரு ஆவணங்களை காட்டு
azd template show <template-name> --docs
```

---

**குறிப்பு**: இந்த சுருக்கக் குறிப்புப் பட்டியலை புக் மார்க் செய்யவும், நீங்கள் தேவைப்படும் கட்டளைகளை விரைவாக கண்டுபிட `Ctrl+F` பயன்படுத்தவும்!

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [முன்-சோதனைகள்](../docs/pre-deployment/preflight-checks.md)
- **அடுத்த பாடம்**: [அகராதி](glossary.md)

---

> **💡 உங்கள் எடிட்டரில் Azure கட்டளை உதவி வேண்டும்?** `npx skills add microsoft/github-copilot-for-azure` என்ற கட்டளையுடன் [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure)-ஐ நிறுவுங்கள் — AI, Foundry, பதிவேற்று, கண்டறிதல் மற்றும் மேலும் பலவற்றிற்கான 37 திறன்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
இந்த ஆவணம் செயற்கை நுண்ணறிவு மொழிபெயர்ப்பு சேவையாகும் [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை தயவுசெய்து கவனிக்கவும். மூல ஆவணம் அதன் சொந்த மொழியிலேயே அதிகாரபூர்வமான ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, நிபுணர் மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதன் காரணமாக ஏற்படும் எந்தவொரு தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->