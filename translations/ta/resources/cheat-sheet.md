# கட்டளை குறிப்பு தாள் - அவசியமான AZD கட்டளைகள்

**அனைத்து அத்தியாயங்களுக்கான விரைவு குறிப்புகள்**
- **📚 பாடநெறி வீடு**: [ஆரம்பக்காரர்களுக்கான AZD](../README.md)
- **📖 விரைவு தொடக்கம்**: [அத்தியாயம் 1: அடிப்படை மற்றும் விரைவு தொடக்கம்](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI கட்டளைகள்**: [அத்தியாயம் 2: செயற்கை நுண்ணறிவு முதன்மை வளர்ச்சி](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 மேம்பட்டவை**: [அத்தியாயம் 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## அறிமுகம்

இந்த விரிவான குறிப்பு தாள் பொதுவாகப் பயன்படுத்தப்படும் Azure Developer CLI கட்டளைகள் பற்றிய விரைவு குறிப்பு வழங்குகிறது, பிரிவுகளின் அடிப்படையில் நடைமுறை உதாரணங்களுடன் ஒழுங்குபடுத்தப்பட்டுள்ளது. azd திட்டங்களில் வளர்ச்சி, பிழைதிருத்தம் மற்றும் தினசரி செயல்பாடுகளுக்கு விரைவு தேடல்களுக்கு இது சிறந்தது.

## கற்றல்நோக்கங்கள்

இந்த குறிப்பு தாளைப் பயன்படுத்துவதன் மூலம், நீங்கள்:
- முக்கிய Azure Developer CLI கட்டளைகள் மற்றும்yntax உடனான உடனடி அணுகலைக் கொண்டிருப்பீர்கள்
- செயல்பாட்டு வகைகள் மற்றும் பயன்பாட்டு சூழல்களின் அடிப்படையில் கட்டளையின் அமைப்பை புரிந்துகொள்ளலாம்
- பொதுவாக உள்ள வளர்ச்சி மற்றும் பொருத்தும் காட்சிகளுக்கான நடைமுறை உதாரணங்களை அணுகலாம்
- விரைவு பிரச்சனை தீர்க்கலுக்கான பிழைதீரும் கட்டளைகளைக் காணலாம்
- மேம்பட்ட கட்டமைப்பு மற்றும் தனிப்பயனாக்க விருப்பங்களை எளிதில் கண்டுபிடிக்கலாம்
- சூழல் மேலாண்மை மற்றும் பல-சூழல் வேலைநடைகளுக்கான கட்டளைகளை அடையலாம்

## கற்றல் முடிவுகள்

இந்த குறிப்பு தாளை முறைபூர்வமாக பயன்படுத்துவதன் மூலம், நீங்கள்:
- முழு ஆவணங்களைப் பார்க்காமல் azd கட்டளைகளை தைரியமாக செயல்படுத்த முடியும்
- பொருத்தமான மருத்து-கட்டளைகள் மூலம் பொதுவான பிரச்சனைகளை விரைவில் தீர்க்கலாம்
- பல சூழல்களை மற்றும் பரவலாக்க காட்சிகளை திறமையாக நிர்வகிக்க முடியும்
- தேவையான போது azd இன் மேம்பட்ட அம்சங்கள் மற்றும் கட்டமைப்பு விருப்பங்களை பயன்படுத்தலாம்
- அமைப்புகளை ஒழுங்குபடுத்திய கட்டளைக் வரிசைகளால் டெப்ளாய்மெண்ட் பிரச்சனைகளை பிழைத்திருத்தலாம்
- azd குறுக்கு வழிகளைக் திறமையாக பயன்படுத்தி வேலைநடைகளை நன்றாக ஒழுங்குபடுத்தலாம்

## துவக்க கட்டளைகள்

### அங்கீகாரம்
```bash
# AZD மூலம் Azure-க்கு உள்நுழையவும்
azd auth login

# Azure CLI-க்கு உள்நுழையவும் (AZD இதை பின்னணியில் பயன்படுத்துகிறது)
az login

# தற்போதைய கணக்கை சரிபார்க்கவும்
az account show

# இயல்புநிலை சப்ஸ்கிரிப்ஷனை அமைக்கவும்
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD-இலிருந்து வெளியேறவும்
azd auth logout

# Azure CLI-இலிருந்து வெளியேறவும்
az logout
```

### திட்ட ஆரம்பம்
```bash
# கிடைக்கும் வார்ப்புருக்களை உலாவவும்
azd template list

# வார்ப்புருவிலிருந்து துவங்கவும்
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# தற்போதைய அடைவில் துவங்கவும்
azd init .

# தனிப்பயன் பெயருடன் துவங்கவும்
azd init --template todo-nodejs-mongo my-awesome-app
```

## கோர் டெப்ளாய்மெண்ட் கட்டளைகள்

### முழுமையான டெப்ளாய்மெண்ட் வேலைநடை
```bash
# எல்லாவற்றையும் அமைக்கவும் (வளமளித்தல் + நிறுவல்)
azd up

# உறுதிசெய்தலைக் கேட்காமல் வெளியிடுக
azd up --confirm-with-no-prompt

# குறிப்பிட்ட சூழலுக்கு வெளியிடுக
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் வெளியிடுக
azd up --parameter location=westus2
```

### இன்ஃப்ராஸ்ட்ரக்சர் மட்டும்
```bash
# Azure வளங்களை ஒதுக்குதல்
azd provision

# 🧪 கட்டமைப்பு மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview
# எந்த வளங்கள் உருவாக்கப்படக்கூடும்/மாற்றப்படக்கூடும்/அழிக்கப்படக்கூடும் என்பதன் ஒரு முன்கூட்டிய (dry-run) பார்வையை காண்பிக்கிறது
# ‘terraform plan’ அல்லது ‘bicep what-if’ போன்றது — இயக்குவதற்கு பாதுகாப்பானது; எந்த மாற்றமும் அமல்படுத்தப்பட மாட்டாது
```

### பயன்பாடு மட்டும்
```bash
# விண்ணப்பக் குறியீட்டை வெளியிடு
azd deploy

# குறிப்பிட்ட சேவையை வெளியிடு
azd deploy --service web
azd deploy --service api

# அனைத்து சேவைகளையும் வெளியிடு
azd deploy --all
```

### கட்டமைப்பு மற்றும் தொகுப்பு
```bash
# பயன்பாடுகளை உருவாக்கு
azd package

# குறிப்பிட்ட சேவையை உருவாக்கு
azd package --service api
```

## 🌍 சூழல் மேலாண்மை

### சூழல் செயல்பாடுகள்
```bash
# அனைத்து சூழல்களை பட்டியலிடவும்
azd env list

# புதிய சூழலை உருவாக்கவும்
azd env new development
azd env new staging --location westus2

# சூழலைத் தேர்ந்தெடுக்கவும்
azd env select production

# தற்போதைய சூழலைக் காட்டு
azd env show

# சூழலின் நிலையைக் புதுப்பிக்கவும்
azd env refresh
```

### சூழல் மாறிகள்
```bash
# சுற்றுச்சூழல் மாறியை அமைக்க
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# சுற்றுச்சூழல் மாறியை பெற
azd env get API_KEY

# அனைத்து சுற்றுச்சூழல் மாறிகளைக் பட்டியலிட
azd env get-values

# சுற்றுச்சூழல் மாறியை நீக்க
azd env unset DEBUG
```

## ⚙️ கட்டமைப்பு கட்டளைகள்

### உலகளாவிய கட்டமைப்பு
```bash
# அனைத்து கட்டமைப்புகளை பட்டியலிடு
azd config list

# உலகளாவிய இயல்புகளை அமைக்க
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# கட்டமைப்பை நீக்கு
azd config unset defaults.location

# அனைத்து கட்டமைப்புகளை மீட்டமை
azd config reset
```

### திட்ட கட்டமைப்பு
```bash
# azure.yaml ஐ சரிபார்க்கவும்
azd config validate

# திட்ட தகவல்களை காட்டவும்
azd show

# சேவை முடிவுப் புள்ளிகளை பெறவும்
azd show --output json
```

## 📊 கண்காணிப்பு மற்றும் பகுப்பாய்வு

### கண்காணிப்புப் பலகை
```bash
# Azure போர்ட்டல் கண்காணிப்பு டாஷ்போர்டைத் திறக்கவும்
azd monitor

# Application Insights நேரடி அளவீடுகளைத் திறக்கவும்
azd monitor --live

# Application Insights பதிவுகள் பிளேடைக் திறக்கவும்
azd monitor --logs

# Application Insights கண்ணோட்டத்தைத் திறக்கவும்
azd monitor --overview
```

### கன்டெய்னர் பதிவுகள் பார்க்க
```bash
# Azure CLI மூலம் பதிவுகளைப் பார்க்கவும் (Container Apps க்கான)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# உண்மை நேரத்தில் பதிவுகளைப் பின்தொடரவும்
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal இலிருந்து பதிவுகளைப் பார்க்கவும்
azd monitor --logs
```

### பதிவு அலசல் வினவல்கள்
```bash
# Azure போர்டல் வழியாக Log Analytics-க்கு அணுகவும்
azd monitor --logs

# Azure CLI-ஐப் பயன்படுத்தி பதிவுகளை வினவுங்கள்
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ பராமரிப்பு கட்டளைகள்

### சுத்திகரிப்பு
```bash
# அனைத்து Azure வளங்களையும் அகற்று
azd down

# உறுதிப்படுத்தாமல் வலியுறுத்தி நீக்கு
azd down --force

# மென்மையாக நீக்கப்பட்ட வளங்களை முற்றிலும் அகற்று
azd down --purge

# முழுமையான சுத்திகரிப்பு
azd down --force --purge
```

### புதுப்பிப்புகள்
```bash
# azd புதுப்பிப்புகளைச் சரிபார்க்க
azd version

# தற்போதைய பதிப்பைப் பெற
azd version

# தற்போதைய கட்டமைப்பை பார்வையிட
azd config list
```

## 🔧 மேம்பட்ட கட்டளைகள்

### பைப்ப்லைன் மற்றும் CI/CD
```bash
# GitHub Actions ஐ அமைக்கவும்
azd pipeline config

# Azure DevOps ஐ அமைக்கவும்
azd pipeline config --provider azdo

# பைப்ப்லைன் கட்டமைப்பை காண்பிக்கவும்
azd pipeline show
```

### இன்ஃப்ராஸ்ட்ரக்சர் மேலாண்மை
```bash
# இன்ஃப்ராஸ்ட்ரக்சர் மாதிரிகளை உருவாக்கவும்
azd infra generate

# 🧪 இன்ஃப்ராஸ்ட்ரக்சர் முன்னோட்டம் மற்றும் திட்டமிடுதல்
azd provision --preview
# நிறுவாமல் இன்ஃப்ராஸ்ட்ரக்சர் வழங்கலை மாதிரியாகச் செய்கிறது
# Bicep/Terraform மாதிரிகளை பகுப்பாய்வு செய்து காட்டுகிறது:
# - சேர்க்கப்பட வேண்டிய வளங்கள் (பச்சை +)
# - மாற்றப்பட வேண்டிய வளங்கள் (மஞ்சள் ~)
# - நீக்கப்பட வேண்டிய வளங்கள் (சிகப்பு -)
# இயக்குவதற்கு பாதுகாப்பானது - Azure சூழலில் எந்தவொரு உண்மையான மாற்றமும் செய்யப்படாது

# azure.yaml இலிருந்து இன்ஃப்ராஸ்ட்ரக்சரை உருவாக்கவும்
azd infra synth
```

### திட்டத் தகவல்
```bash
# திட்டத்தின் நிலை மற்றும் என்ட்பாயின்ட்களை காட்டு
azd show

# திட்டத்தின் விரிவான தகவல்களை JSON வடிவில் காட்டு
azd show --output json

# சேவை என்ட்பாயின்ட்களைப் பெற
azd show --output json | jq '.services'
```

## 🎯 விரைவு வேலைநடைகள்

### வளர்ச்சி வேலைநடை
```bash
# புதிய திட்டத்தை தொடங்கவும்
azd init --template todo-nodejs-mongo
cd my-project

# அபிவிருத்தி சூழலுக்கு வெளியிடவும்
azd env new dev
azd up

# மாற்றங்கள் செய்து மீண்டும் வெளியிடவும்
azd deploy

# கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor --live
```

### பல-சூழல் வேலைநடை
```bash
# சூழல்களை அமைக்கவும்
azd env new dev
azd env new staging  
azd env new production

# டெவ்-க்கு வெளியிடவும்
azd env select dev
azd up

# சோதனை செய்து ஸ்டேஜிங்-க்கு முன்னேற்றவும்
azd env select staging
azd up

# உற்பத்திக்கு வெளியிடவும்
azd env select production
azd up
```

### சிக்கல் தீர்க்கும் வேலைநடை
```bash
# டீபக் முறையை செயல்படுத்தவும்
export AZD_DEBUG=true

# டிப்ளாய்மெண்ட் நிலையை சரிபார்க்கவும்
azd show

# கட்டமைப்பை சரிபார்க்கவும்
azd config list

# பதிவுகளுக்கான கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor --logs

# வள நிலையை சரிபார்க்கவும்
azd show --output json
```

## 🔍 பிழைத்திருத்தக் கட்டளைகள்

### பிழைத் தகவல்கள்
```bash
# பிழைதிருத்த வெளியீட்டை செயல்படுத்தவும்
export AZD_DEBUG=true
azd <command> --debug

# சுத்தமான வெளியீட்டிற்காக டெலிமெட்ரியை முடக்கவும்
export AZD_DISABLE_TELEMETRY=true

# தற்போதைய கட்டமைப்பை சரிபார்க்கவும்
azd config list

# அங்கீகார நிலையை சரிபார்க்கவும்
az account show
```

### வார்ப்புரு பிழைத் திருத்தம்
```bash
# கிடைக்கும் வார்ப்புருக்களை விவரங்களுடன் பட்டியலிடு
azd template list --output json

# வார்ப்புரு தகவலை காட்டு
azd template show <template-name>

# துவக்கத்திற்கு முன் வார்ப்புருவை சரிபார்க்க
azd template validate <template-name>
```

## 📁 கோப்பு மற்றும் அடைவு கட்டளைகள்

### திட்ட அமைப்பு
```bash
# தற்போதைய கோப்புறை அமைப்பை காட்டு
tree /f  # விண்டோஸ்
find . -type f  # லினக்ஸ்/macOS

# azd திட்டத்தின் மூல அடைவுக்கு செல்லவும்
cd $(azd root)

# azd கட்டமைப்பு கோப்புறையை காட்டு
echo $AZD_CONFIG_DIR  # பொதுவாக ~/.azd
```

## 🎨 வெளியீட்டு வடிவமைப்பு

### JSON வெளியீடு
```bash
# ஸ்கிரிப்டிங்குக்காக JSON வெளியீட்டை பெறவும்
azd show --output json
azd env list --output json
azd config list --output json

# jq-ஐ பயன்படுத்தி பகுப்பாய்வு செய்யவும்
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### அட்டவணை வெளியீடு
```bash
# அட்டவணையாக வடிவமைக்கவும்
azd env list --output table

# நிறுவப்பட்ட சேவைகளை பார்க்கவும்
azd show --output json | jq '.services | keys'
```

## 🔧 பொதுவான கட்டளை இணைப்புகள்

### ஆரோக்கிய சரிபார்ப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# விரைவு நலச் சோதனை
azd show
azd env show
azd monitor --logs
```

### டெப்ளாய்மெண்ட் சரிபார்ப்பு
```bash
#!/bin/bash
# பயன்படுத்துவதற்கு முன் சரிபார்ப்பு
azd show
azd provision --preview  # பயன்படுத்துவதற்கு முன் மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
az account show
```

### சூழல் ஒப்பிடுதல்
```bash
#!/bin/bash
# சுற்றுச்சூழல்களை ஒப்பிடு
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### வள சுத்திகரிப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# பழைய சூழல்களை சுத்தப்படுத்து
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 சூழல் மாறிகள்

### பொதுவான சூழல் மாறிகள்
```bash
# Azure கட்டமைப்பு
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD கட்டமைப்பு
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# விண்ணப்பக் கட்டமைப்பு
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 அவசரக் கட்டளைகள்

### விரைவு சரிசெய்தல்கள்
```bash
# அங்கீகாரத்தை மீட்டமை
az account clear
az login

# சூழலை கட்டாயமாக புதுப்பிக்க
azd env refresh

# அனைத்து சேவைகளையும் மீண்டும் நிறுவு
azd deploy

# நிறுவல் நிலையை சரிபார்
azd show --output json
```

### மீட்பு கட்டளைகள்
```bash
# தோல்வியுற்ற deployment-இலிருந்து மீட்கவும் - சுத்தம் செய்து மீண்டும் நிறுவவும்
azd down --force --purge
azd up

# அடித்தளங்களை மட்டும் மீண்டும் வழங்கவும்
azd provision

# விண்ணப்பத்தை மட்டும் மீண்டும் நிறுவவும்
azd deploy
```

## 💡 தொழில்முறை குறிப்புகள்

### வேகமான வேலைநடைக்கு மாற்றுப் பெயர்கள்
```bash
# உங்கள் .bashrc அல்லது .zshrc கோப்பில் சேர்க்கவும்
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### செயல்முறை குறுக்குவழிகள்
```bash
# சூழலை விரைவாக மாற்றுதல்
azd-env() {
    azd env select $1 && azd show
}

# கண்காணிப்புடன் விரைவான வெளியீடு
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# சூழல் நிலை
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

# கட்டளைக்கான உதவி
azd up --help
azd env --help
azd config --help

# பதிப்பு மற்றும் உருவாக்க தகவலை காட்டு
azd version
azd version --output json
```

### ஆவண இணைப்புகள்
```bash
# உலாவியில் ஆவணத்தை திறக்கவும்
azd docs

# டெம்ப்ளேட் ஆவணத்தை காட்டு
azd template show <template-name> --docs
```

---

**குறிப்பு**: இந்த குறிப்பு தாளை புக் மார்க் செய்து, தேவையான கட்டளைகளை விரைவாக காண `Ctrl+F` ஐ பயன்படுத்துங்கள்!

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **அடுத்த பாடம்**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையாகும் Co‑op Translator (https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டதாகும். நாங்கள் துல்லியமாக மொழிபெயர்க்க முயலினாலும், தானியங்கி மொழிபெயர்ப்புகள் பிழைகள் அல்லது தவறான பொருள் வெளிப்பாடுகள் கொண்டிருக்கலாம் என்பதை தயவுசெய்து கவனிக்கவும். மூல ஆவணம் அதன் சொந்த மொழியில் அதிகாரப்பூர்வமாகப் பார்க்கப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்பட்ட herhangi தீர்வுகளோ அல்லது தவறான புரிதல்களுக்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->