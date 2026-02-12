# பொதுவான பிரச்சனைகள் மற்றும் தீர்வுகள்

**Chapter Navigation:**
- **📚 Course Home**: [ஆரம்பிகளுக்கான AZD](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 7 - பிழைத் திருத்தம் & பிழை கண்டறிதல்
- **⬅️ Previous Chapter**: [அத்தியாயம் 6: முன்-நிறுவல் சோதனைகள்](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [பிழை கண்டறிதல் வழிகாட்டு](debugging.md)
- **🚀 Next Chapter**: [அத்தியாயம் 8: தயாரிப்பு & நிறுவன மாதிரிகள்](../chapter-08-production/production-ai-practices.md)

## அறிமுகம்

இந்த விரிவான பிழைத் திருத்தக் கையேடு Azure Developer CLI பயன்படுத்தும்போது அடிக்கடி சந்திக்கப்படும் பிரச்சனைகளின் சூழ்நிலையை உட்கொள்ளுகிறது. அங்கீகாரம், நடுவடைமை, அடித்தள வள வழங்கல், மற்றும் பயன்பாட்டு அமைப்புகளுடன் தொடர்புடைய பொதுவான பிழைகளை எவ்வாறு கண்டறிந்து, தீர்க்க மற்றும் சரிசெய்வது என்பதை கற்றுக்கொள்க. ஒவ்வொரு பிரச்சனைக்கும் விரிவான அறிகுறிகள், மூல காரணங்கள் மற்றும் படி படியாக தீர்வு நடைமுறைகள் கொடுக்கப்பட்டுள்ளன.

## கற்றல் நோக்கங்கள்

இந்த கையேட்டை முடித்தவுடன் நீங்கள்:
- Azure Developer CLI பிரச்சனைகளுக்கான ஆய்வுத்துணை நுட்பங்களை திறம்பட கையாள இயல்பு
- பொதுவான அங்கீகாரம் மற்றும் அனுமதி பிரச்சனைகள் மற்றும் அவற்றின் தீர்வுகளை புரிந்து கொள்வது
- நிறைவேற்றல் தோல்விகள், அடித்தள வள வழங்கல் பிழைகள், மற்றும் கட்டமைப்பு சிக்கல்களை தீர்க்கும் திறன்
- கோடிடல் கண்காணிப்பு மற்றும் பிழைத் திருத்த வழிமுறைகளை செயல்படுத்தல்
- சிக்கலான பிரச்சனைகளுக்கான முறையான பிழைத் தீர்வு முறைமைகளைப் பயன்படுத்தல்
- எதிர்காலப் பிரச்சனைகளைத் தவிர்க்க சரியான பதிவு மற்றும் கண்காணிப்பை அமைத்தல்

## கற்றல் முடிவுகள்

முடிந்தவுடன், நீங்கள் இணையானவை செய்ய முடியும்:
- உட்படப்பட்ட கண்டறிதல் கருவிகளை பயன்படுத்தி Azure Developer CLI பிரச்சனைகளை கண்டறிதல்
- அங்கீகாரம், சந்தா மற்றும் அனுமதியுடன் தொடர்புடைய பிரச்சனைகளை தனக்குத்தானே தீர்க்கும் திறன்
- விருப்பமான முறையில் நிர்ணயத்திற்கு ஏற்ப நிறைவேற்றல் தோல்விகள் மற்றும் அடித்தள வள வழங்கல் பிழைகளை தீர்க்குதல்
- பயன்பாட்டின் கட்டமைப்பு பிரச்சனைகள் மற்றும் சூழல்-கேணி பிரச்சனைகள் அனைத்தையும் பிழைத் திருத்துதல்
- சாத்திய பிரச்சனைகளை முன்கூட்டியே கண்டறிய கண்காணிப்பு மற்றும் எச்சரிக்கை அமைப்புகளை செயல்படுத்துதல்
- பதிவு, பிழைத் திருத்தம் மற்றும் பிரச்சனை தீர்க்கும் வேலைப்பாடுகளுக்கான சிறந்த நடைமுறைகளைப் பயன்படுத்துதல்

## விரைவு கண்டறிதல்கள்

குறிப்பிட்ட பிரச்சனைகளில் இறங்குவதற்கு முன்பு, ஆய்வுத் தகவலை சேகரிக்க இந்த கட்டளைகளை இயக்குங்கள்:

```bash
# azd பதிப்பு மற்றும் நிலைமையைச் சரிபார்க்கவும்
azd version
azd config list

# Azure அங்கீகாரத்தைச் சரிபார்க்கவும்
az account show
az account list

# தற்போதைய சூழலைச் சரிபார்க்கவும்
azd env show
azd env get-values

# பிழைதிருத்த பதிவு செயல்படுத்தவும்
export AZD_DEBUG=true
azd <command> --debug
```

## அங்கீகாரம் தொடர்பான பிரச்சனைகள்

### பிரச்சனை: "Failed to get access token"
**அறிகுறிகள்:**
- `azd up` அங்கீகாரம் தொடர்பான பிழைகளுடன் தோல்வியடைகிறது
- கட்டளைகள் "unauthorized" அல்லது "access denied" என்ற பதில்களை திருப்புகின்றன

**தீர்வுகள்:**
```bash
# 1. Azure CLI மூலம் மீண்டும் உள்நுழையவும்
az login
az account show

# 2. கேஷில் சேமிக்கப்பட்ட சான்றுகளை நீக்கவும்
az account clear
az login

# 3. சாதனக் குறியீட்டு ஓட்டத்தை (UI இல்லாத அமைப்புகளுக்காக) பயன்படுத்தவும்
az login --use-device-code

# 4. தெளிவான சப்ஸ்கிரிப்ஷனை அமைக்கவும்
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### பிரச்சனை: நிறுவலின் போது "Insufficient privileges"
**அறிகுறிகள்:**
- நிறுவல் அனுமதி பிழைகளால் தோற்கிறது
- சில Azure வளங்களை உருவாக்க முடியவில்லை

**தீர்வுகள்:**
```bash
# 1. உங்கள் Azure பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. உங்களிடம் தேவையான பங்குகள் உள்ளதென்பதை உறுதிசெய்க
# - Contributor (வளங்களை உருவாக்குவதற்காக)
# - User Access Administrator (பங்கு ஒதுக்கீடுகளுக்காக)

# 3. சரியான அனுமதிகளுக்காக உங்கள் Azure நிர்வாகியிடம் தொடர்பு கொள்ளவும்
```

### பிரச்சனை: பன்முக அறிவிப்பு (Multi-tenant) அங்கீகாரம் தொடர்பான சிக்கல்கள்
**தீர்வுகள்:**
```bash
# 1. குறிப்பிட்ட டெனன்டுடன் உள்நுழையவும்
az login --tenant "your-tenant-id"

# 2. கட்டமைப்பில் டெனன்டை அமைக்கவும்
azd config set auth.tenantId "your-tenant-id"

# 3. டெனன்ட்களை மாற்றினால் டெனன்ட் கேஷை அழிக்கவும்
az account clear
```

## 🏗️ அடித்தள வள வழங்கல் பிழைகள்

### பிரச்சனை: வளத்தின் பெயர் மோதல்
**அறிகுறிகள்:**
- "The resource name already exists" போன்ற பிழைகள்
- வளத்தை உருவாக்கும் போது நிறுவல் தோல்வி

**தீர்வுகள்:**
```bash
# 1. டோக்கன்களுடன் தனித்துவமான வள பெயர்களைப் பயன்படுத்துங்கள்
# உங்கள் Bicep வடிவத்தில்:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. சூழல் பெயரை மாற்றவும்
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. உள்ளிருக்கும் வளங்களை சுத்தம் செய்யவும்
azd down --force --purge
```

### பிரச்சனை: இடம்/மண்டலம் (Location/Region) கிடைக்கவில்லை
**அறிகுறிகள்:**
- "The location 'xyz' is not available for resource type"
- தேர்ந்தெடுத்த மண்டலத்தில் சில SKUs கிடைக்காது

**தீர்வுகள்:**
```bash
# 1. வள வகைகளுக்கான கிடைக்கும் இடங்களை சரிபார்க்கவும்
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. பொதுவாக கிடைக்கும் பிராந்தியங்களை பயன்படுத்தவும்
azd config set defaults.location eastus2
# அல்லது
azd env set AZURE_LOCATION eastus2

# 3. பிராந்தியத்தின் அடிப்படையில் சேவையின் கிடைப்பை சரிபார்க்கவும்
# பார்வையிடவும்: https://azure.microsoft.com/global-infrastructure/services/
```

### பிரச்சனை: கோட்டா (Quota) மீறல் பிழைகள்
**அறிகுறிகள்:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**தீர்வுகள்:**
```bash
# 1. தற்போதைய குவோட்டா பயன்பாட்டை சரிபார்க்கவும்
az vm list-usage --location eastus2 -o table

# 2. Azure போர்டல் மூலம் குவோட்டா அதிகரிப்பை கோரவும்
# செல்லவும்: Subscriptions > Usage + quotas

# 3. வளர்ச்சிக்காக சிறிய SKU-களை பயன்படுத்தவும்
# main.parameters.json-இல்:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. பயன்படுத்தப்படாத வளங்களை அகற்றவும்
az resource list --query "[?contains(name, 'unused')]" -o table
```

### பிரச்சனை: Bicep டெம்ப்ளேட் பிழைகள்
**அறிகுறிகள்:**
- டெம்ப்ளேட் படிப்பறிதல் தோல்விகள்
- Bicep கோப்புகளில் வாக்கியப் பிழைகள்

**தீர்வுகள்:**
```bash
# 1. Bicep சின்டாக்ஸை சரிபார்க்கவும்
az bicep build --file infra/main.bicep

# 2. Bicep லிண்டரை பயன்படுத்தவும்
az bicep lint --file infra/main.bicep

# 3. அளவுரு கோப்பின் சின்டாக்ஸை சரிபார்க்கவும்
cat infra/main.parameters.json | jq '.'

# 4. நிறுவல் மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview
```

## 🚀 நிறுவல் தோல்விகள்

### பிரச்சனை: கட்டுமான தோல்விகள்
**அறிகுறிகள்:**
- நிறுவலின் போது பயன்பாடு கட்டமைக்க 실패 யாகிறது
- பேக்கேஜ் நிறுவல் பிழைகள்

**தீர்வுகள்:**
```bash
# 1. டீபக் கொடியுடன் கட்டுமான வெளியீட்டை சரிபார்க்கவும்
azd deploy --service web --debug

# 2. ஏற்றப்பட்ட சேவையின் நிலையை பார்க்கவும்
azd show

# 3. கட்டுமானத்தை உள்ளூரில் சோதிக்கவும்
cd src/web
npm install
npm run build

# 3. Node.js/Python பதிப்புகளின் இணக்கத்தன்மையை சரிபார்க்கவும்
node --version  # azure.yaml அமைப்புகளுடன் பொருந்த வேண்டும்
python --version

# 4. கட்டுமானக் கேஷை அழிக்கவும்
rm -rf node_modules package-lock.json
npm install

# 5. கன்டெய்னர்கள் பயன்படுத்தினால் Dockerfileஐ சரிபார்க்கவும்
docker build -t test-image .
docker run --rm test-image
```

### பிரச்சனை: கன்டெய்னர் நிறுவல் தோல்விகள்
**அறிகுறிகள்:**
- கன்டெய்னர் செயலிகள் தொடங்குவதில்லை
- படத்தை இழுக்கும் போது பிழைகள்

**தீர்வுகள்:**
```bash
# 1. Docker பில்டை உள்ளூரில் சோதிக்கவும்
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI-ஐ பயன்படுத்தி கொண்டெய்னர் பதிவுகளை சரிபார்க்கவும்
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd மூலம் பயன்பாட்டை கண்காணிக்கவும்
azd monitor --logs

# 3. கொண்டெய்னர் ரெஜிஸ்ட்ரி அணுகலை சரிபார்க்கவும்
az acr login --name myregistry

# 4. கொண்டெய்னர் செயலியின் கட்டமைப்பை சரிபார்க்கவும்
az containerapp show --name my-app --resource-group my-rg
```

### பிரச்சனை: தரவுத்தளம் இணைப்பு தோல்விகள்
**அறிகுறிகள்:**
- பயன்பாடு தரவுத்தளத்துடன் இணைக்க முடியவில்லை
- இணைப்பு நேரம் முடிந்தது போன்ற பிழைகள்

**தீர்வுகள்:**
```bash
# 1. தரவுத்தளத்தின் ஃபயர்வால் விதிமுறைகளை சரிபார்க்கவும்
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. பயன்பாட்டிலிருந்து இணைப்பை சோதிக்கவும்
# உங்கள் செயலியில் தற்காலிகமாக சேர்க்க:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. இணைப்பு ஸ்ட்ரிங்கின் வடிவத்தை சரிபார்க்கவும்
azd env get-values | grep DATABASE

# 4. தரவுத்தள சேவையக நிலையை சரிபார்க்கவும்
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 கட்டமைப்பு தொடர்பான பிரச்சனைகள்

### பிரச்சனை: சூழல் மாறிலிகள் செயல்படவில்லை
**அறிகுறிகள்:**
- செயலி கட்டமைப்பு மதிப்புகளை படிக்க முடியவில்லை
- சூழல் மாறிலிகள் காலியாக தோன்றுகின்றன

**தீர்வுகள்:**
```bash
# 1. சூழல் மாறிலிகள் அமைக்கப்பட்டுள்ளன என்பதை சரிபார்க்கவும்
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml இல் மாறிலி பெயர்களை சரிபார்க்கவும்
cat azure.yaml | grep -A 5 env:

# 3. செயலியை மறுதொடக்கவும்
azd deploy --service web

# 4. பயன்பாட்டு சேவை கட்டமைப்பை சரிபார்க்கவும்
az webapp config appsettings list --name myapp --resource-group myrg
```

### பிரச்சனை: SSL/TLS சான்றிதழ் பிரச்சினைகள்
**அறிகுறிகள்:**
- HTTPS செயல்படவில்லை
- சான்றிதழ் சரிபார்ப்பில் பிழைகள்

**தீர்வுகள்:**
```bash
# 1. SSL சான்றிதழின் நிலையை சரிபார்க்கவும்
az webapp config ssl list --resource-group myrg

# 2. HTTPS-ஐ மட்டுமே செயல்படுத்தவும்
az webapp update --name myapp --resource-group myrg --https-only true

# 3. தனிப்பயன் டொமைனை (தேவையானால்) சேர்க்கவும்
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### பிரச்சனை: CORS கட்டமைப்பு பிரச்சினைகள்
**அறிகுறிகள்:**
- முன்னணி (frontend) API-ஐக் கூப்பிட முடியவில்லை
- குறுக்கு-மூலம் கோரிக்கை தடுக்கப்பட்டது

**தீர்வுகள்:**
```bash
# 1. App Service க்காக CORS ஐ கட்டமைக்கவும்
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS கையாள API ஐ புதுப்பிக்கவும்
# Express.js இல்:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. சரியான URLகளில் இயங்குகிறதா என்பதை சரிபார்க்கவும்
azd show
```

## 🌍 சூழல் நிர்வாகம் தொடர்பான பிரச்சனைகள்

### பிரச்சனை: சூழல் மாறுதல் பிரச்சனைகள்
**அறிகுறிகள்:**
- தவறான சூழல் பயன்படுத்தப்படுகிறது
- கட்டமைப்பு சரியாக மாறவில்லை

**தீர்வுகள்:**
```bash
# 1. அனைத்துச் சூழல்களையும் பட்டியலிடவும்
azd env list

# 2. சூழலை தெளிவாக தேர்ந்தெடுக்கவும்
azd env select production

# 3. தற்போதைய சூழலை சரிபார்க்கவும்
azd env show

# 4. கெட்டுப்போனால் புதிய சூழலை உருவாக்கவும்
azd env new production-new
azd env select production-new
```

### பிரச்சனை: சூழல் மின்னஞ்சல் (corruption)
**அறிகுறிகள்:**
- சூழல் தவறான நிலையை காட்டுகிறது
- வளங்கள் கட்டமைப்புடன் பொருந்தவில்லை

**தீர்வுகள்:**
```bash
# 1. சூழல் நிலையை புதுப்பிக்கவும்
azd env refresh

# 2. சூழல் கட்டமைப்பை மீட்டமைக்கவும்
azd env new production-reset
# தேவையான சூழல் மாறிலிகளை நகலெடுக்கவும்
azd env set DATABASE_URL "your-value"

# 3. ஏற்கனவே உள்ள வளங்களை இறக்குமதி செய்க (சாத்தியமுடிந்தால்)
# கையேனாக .azure/production/config.json ஐ வள அடையாளங்களுடன் புதுப்பிக்கவும்
```

## 🔍 செயல்திறன் தொடர்பான பிரச்சனைகள்

### பிரச்சனை: நிறுவல் நேரங்கள் மெதுவாக இருப்பது
**அறிகுறிகள்:**
- நிறுவல்கள் மிகவும் நீண்ட நேரம் எடுக்கின்றன
- நிறுவலின் போது நேர முட்ந்துவிடுதல்கள்

**தீர்வுகள்:**
```bash
# 1. வேகமான மறுமுறைக்காக குறிப்பிட்ட சேவைகளை பணியிடவும்
azd deploy --service web
azd deploy --service api

# 2. கட்டமைப்பு மாற்றமில்லாதபோது கோடு மட்டும் பணியிடவும்
azd deploy  # azd up விட வேகமாக உள்ளது

# 3. கட்டுமான செயல்முறையை மேம்படுத்தவும்
# package.json-இல்:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. வள இருப்பிடங்களை சரிபார்க்கவும் (அதே மண்டலத்தை பயன்படுத்தவும்)
azd config set defaults.location eastus2
```

### பிரச்சனை: பயன்பாட்டு செயல்திறன் குறைவு
**அறிகுறிகள்:**
- பதில் நேரங்கள் மந்தம்
- உயர் வள გამოყენா (resource) பயன்பாடு

**தீர்வுகள்:**
```bash
# 1. வளங்களை அதிகப்படுத்தவும்
# main.parameters.json இல் SKU ஐ புதுப்பிக்கவும்:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights கண்காணிப்பை இயக்கு
azd monitor --overview

# 3. Azure இல் பயன்பாட்டின் பதிவுகளை சரிபார்க்கவும்
az webapp log tail --name myapp --resource-group myrg
# அல்லது Container Apps க்கான:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. கேஷிங்கை அமல்படுத்தவும்
# உங்கள் அமைப்பில் Redis கேஷை சேர்க்கவும்
```

## 🛠️ பிழைத் திருத்தப்படizzi கருவிகள் மற்றும் கட்டளைகள்

### பிழையொளி (Debug) கட்டளைகள்
```bash
# விரிவான பிழைதிருத்தம்
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd பதிப்பை சரிபார்க்கவும்
azd version

# தற்போதைய கட்டமைப்பை பார்க்கவும்
azd config list

# இணைப்பை சோதிக்கவும்
curl -v https://myapp.azurewebsites.net/health
```

### பதிவு பகுப்பாய்வு (Log Analysis)
```bash
# Azure CLI மூலம் செயலி பதிவுகள்
az webapp log tail --name myapp --resource-group myrg

# azd மூலம் செயலி கண்காணிப்பு
azd monitor --logs
azd monitor --live

# Azure வளங்களின் பதிவுகள்
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# கண்டெயனர் பதிவுகள் (Container Apps க்கானவை)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### வள ஆராய்ச்சி (Resource Investigation)
```bash
# அனைத்து வளங்களை பட்டியலிடு
az resource list --resource-group myrg -o table

# வளத்தின் நிலையைச் சரிபார்க்கவும்
az webapp show --name myapp --resource-group myrg --query state

# பிணையக் கண்டறிதல்கள்
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 கூடுதல் உதவி பெறுதல்

### எப்போது உயர்நிலைக்கு எடுத்துக் செல்ல வேண்டும்
- அனைத்து தீர்வுகளையும் முயற்சித்தபோதும் அங்கீகாரம் பிரச்சனைகள் தொடர்ந்தால்
- Azure சேவைகளுடன் தொடர்புடைய அடித்தள பிரச்சனைகள்
- பில் மற்றும் சந்தா தொடர்பான பிரச்சனைகள்
- பாதுகாப்பு தொடர்பான கவலைகள் அல்லது சம்பவங்கள்

### ஆதரவு சேனல்கள்
```bash
# 1. Azure சேவை நிலையை சரிபாரிக்கவும்
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure ஆதரவு டிக்கெட்டை உருவாக்கவும்
# போகவும்: https://portal.azure.com -> உதவி + ஆதரவு

# 3. சமூக வளங்கள்
# - Stack Overflow: azure-developer-cli குறிச்சொல்
# - GitHub பிரச்சினைகள்: https://github.com/Azure/azure-dev/issues
# - Microsoft கேள்வி மற்றும் பதில்: https://learn.microsoft.com/en-us/answers/
```

### சேமிக்க வேண்டிய தகவல்
ஆதரவை இணைப்பதற்கு முன்னால், கீழ் தகவல்களை சேகரிக்கவும்:
- `azd version` வெளியீடு
- `azd config list` வெளியீடு
- `azd show` வெளியீடு (தற்போதைய நிறுவல் நிலை)
- பிழை செய்திகள் (முழு உரை)
- பிரச்சனையை மீண்டும் உருவாக்கும் படிகள்
- சூழல் விவரங்கள் (`azd env show`)
- பிரச்சனை தொடங்கிய காலக்கூட்டம்

### பதிவு சேகரிப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 பிரச்சனைத் தடை

### முன்-நிறுவல் பணிபட்டி (Pre-deployment Checklist)
```bash
# 1. அங்கீகாரத்தை சரிபார்க்கவும்
az account show

# 2. குவோட்டாக்களையும் வரம்புகளையும் சரிபார்க்கவும்
az vm list-usage --location eastus2

# 3. வார்ப்புருக்களை சரிபார்க்கவும்
az bicep build --file infra/main.bicep

# 4. முதலில் உள்ளூரில் சோதனை செய்யவும்
npm run build
npm run test

# 5. ட்ரை-ரன் வெளியீடுகளைப் பயன்படுத்தவும்
azd provision --preview
```

### கண்காணிப்பு அமைப்பு
```bash
# Application Insights ஐ இயக்கவும்
# main.bicep இல் சேர்க்கவும்:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# எச்சரிக்கைகளை அமைக்கவும்
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### வழக்கமான பராமரிப்பு
```bash
# வாராந்திர நலச் சோதனைகள்
./scripts/health-check.sh

# மாதாந்திர செலவு மீளாய்வு
az consumption usage list --billing-period-name 202401

# காலாண்டு பாதுகாப்பு மீளாய்வு
az security assessment list --resource-group myrg
```

## தொடர்புடைய வளங்கள்

- [பிழை கண்டறிதல் வழிகாட்டு](debugging.md) - மேம்பட்ட பிழைத் திருத்த நுணுக்கங்கள்
- [வளங்கள் வழங்குதல்](../chapter-04-infrastructure/provisioning.md) - அடித்தளத் தடையினைத் தீர்ப்பதற்கான வழிகாட்டி
- [திறன் திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - வள திட்டமிடல் வழிகாட்டி
- [SKU தேர்வு](../chapter-06-pre-deployment/sku-selection.md) - சேவை தர நிர்ணய பரிந்துரைகள்

---

**Tip**: இந்த கையேட்டை புத்தகத்தில் சேர்த்து வைத்திருங்கள் மற்றும் பிரச்சனை வந்தபோதெல்லாம் அதைப் பார்க்கவும். பெரும்பாலான பிரச்சனைகள் ஏற்கனவே காணப்பட்டு நிரூபிக்கப்பட்ட தீர்வுகள் இணைக்கப்பட்டுள்ளன!

---

**Navigation**
- **Previous Lesson**: [வளங்கள் வழங்குதல்](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [பிழை கண்டறிதல் வழிகாட்டு](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை Co‑op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயல்கிறோம் என்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான விளக்கங்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். மூல ஆவணம் அதன் இயல்பான மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவலுகளுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பை பயன்படுத்துவதை薦薦薦薦薦薦薦薦薦薦薦薦薦薦薦薦薦
<!-- CO-OP TRANSLATOR DISCLAIMER END -->