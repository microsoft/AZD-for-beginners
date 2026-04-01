# பொதுவான சிக்கல்கள் மற்றும் தீர்வுகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிழைத்திருத்தம் மற்றும் பிழைதிருத்தம்
- **⬅️ முந்தைய அத்தியாயம்**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ அடுத்தது**: [Debugging Guide](debugging.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## அறிமுகம்

இந்த விரிவான பிழைத்திருத்த வழிகாட்டி Azure Developer CLI பயன்படுத்தும்போது அடிக்கடி சந்திக்கப்படும் சிக்கல்களை உள்ளடக்கியது. அங்கீகாரம், வெளியீட்டு செயல்முறை, கட்டமைப்பு வழங்கல் மற்றும் பயன்பாட்டு கட்டமைப்பில் பொதுவான பிரச்சினைகளை கண்டறிந்து, தீர்த்தெடுக்க மற்றும் சரிசெய்வது எப்படி என்று கற்றுக் கொள்ளுங்கள். ஒவ்வொரு சிக்கலுக்கும் விரிவான அறிகுறிகள், மூல காரணங்கள் மற்றும் கட்டம்-கட்ட தீர்வு நடைமுறைகள் இடம்பெறுகின்றன.

## கற்றல் குறிக்கோள்கள்

இந்தக் கையேடினை முடித்தவுடன் நீங்கள்:
- Azure Developer CLI சிக்கல்களின் நோயறிதல் தொழில்நுட்பங்களை.master செய்யவேண்டும்
- பொதுவான அங்கீகாரம் மற்றும் அனுமதி பிரச்சினைகளையும் அவற்றின் தீர்வுகளையும் புரிந்து கொள்ளலாம்
- வெளியீட்டு தோல்விகள், கட்டமைப்பு வழங்கல் பிழைகள் மற்றும் கட்டமைப்பு பிரச்சினைகளை சரிசெய்யலாம்
- முன்னறிவிப்பு கண்காணிப்பு மற்றும் பிழைத்திருத்த செயல்முறைகளை அமல்படுத்தலாம்
- சிக்கலான பிரச்சினைகளுக்கு ஒழுங்கமைக்கப்பட்ட பிழைத்திருத்த முறைகளை பயன்படுத்தலாம்
- எதிர்கால சிக்கல்களை தடுக்கும் வகையில் சரியான பதிவு மற்றும் கண்காணிப்பை அமைத்துக் கொள்ளலாம்

## கற்றல் முடிவுகள்

முடிவில், நீங்கள் முடியும்:
- கட்டமைக்கப்பட்ட நோயறிதல் கருவிகளைப் பயன்படுத்தி Azure Developer CLI சிக்கல்களை கண்டறிதல் செய்ய
- அங்கீகாரம், சந்தா மற்றும் அனுமதி தொடர்பான பிரச்சினைகளை தனியாகத் தீர்க்க
- வெளியீட்டு தோல்விகள் மற்றும் கட்டமைப்பு வழங்கல் பிழைகளை பயனுள்ள முறையில் பிழைத்திருத்த
- பயன்பாட்டு கட்டமைப்பு சிக்கல்கள் மற்றும் சுற்றுச்சூழல்-சார்ந்த பிரச்சினைகளை டீபக் செய்ய
- சாத்தியமான சிக்கல்களை முன்கூட்டியே கண்டறிய கண்காணிப்பு மற்றும் அச்சுறுத்தல்கள் (alerting) அமைக்க
- பதிவு, டீபக்கிங் மற்றும் பிரச்சினை தீர்வு பணிவழிகளைப் பற்றிய சிறந்த நடைமுறைகளைப் பயன்படுத்த

## விரைவு கண்டறிதல்கள்

குறிப்பிட்ட சிக்கல்களில் இறங்குவதற்கு முன்னால், நோயறிதல் தகவலை சேகரிக்க இந்த கட்டளைகளை இயக்கு:

```bash
# azd பதிப்பு மற்றும் நிலையை சரிபார்க்கவும்
azd version
azd config show

# Azure அங்கீகாரத்தை உறுதிப்படுத்தவும்
az account show
az account list

# தற்போதைய சூழலை சரிபார்க்கவும்
azd env list
azd env get-values

# டீபக் பதிவு செயல்பாட்டை இயக்கவும்
export AZD_DEBUG=true
azd <command> --debug
```

## அங்கீகாரம் தொடர்பான சிக்கல்கள்

### பிரச்சினை: "அணுகல் டோக்கன் பெற முடியவில்லை"
**அறிகுறிகள்:**
- `azd up` அங்கீகார பிழைகளுடன் தோல்வி அடைகிறது
- கட்டளைகள் "unauthorized" அல்லது "access denied" என பதிலளிக்கின்றன

**தீர்வுகள்:**
```bash
# 1. Azure CLI மூலம் மீண்டும் அங்கீகாரம் செய்யவும்
az login
az account show

# 2. கேஷில் சேமிக்கப்பட்ட அங்கீகாரச் சான்றுகளை நீக்கவும்
az account clear
az login

# 3. சாதனக் குறியீடு ஓட்டத்தை பயன்படுத்தவும் (தலைவில்லா அமைப்புகளுக்காக)
az login --use-device-code

# 4. தெளிவாக சப்ஸ்கிரிப்ஷனை அமைக்கவும்
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### பிரச்சினை: வெளியீட்டின் போது "தகுதி போதவில்லை"
**அறிகுறிகள்:**
- அனுமதி பிழைகளால் வெளியீடு தோல்வியடைகிறது
- சில Azure வளங்களை உருவாக்க முடியவில்லை

**தீர்வுகள்:**
```bash
# 1. உங்கள் Azure பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. உங்களுக்கு தேவையான பங்குகள் உள்ளன என்பதை உறுதிசெய்யவும்
# - Contributor (வளங்களை உருவாக்குவதற்காக)
# - User Access Administrator (பங்கு ஒதுக்கீடுகளுக்காக)

# 3. சரியான அனுமதிகளுக்காக உங்கள் Azure நிர்வாகியை தொடர்பு கொள்ளவும்
```

### பிரச்சினை: பன்முக வாடிக்கையாளர் (Multi-tenant) அங்கீகார பிரச்சினைகள்
**தீர்வுகள்:**
```bash
# 1. குறிப்பிட்ட டெனன்டுடன் உள்நுழையவும்
az login --tenant "your-tenant-id"

# 2. அமைப்பில் டெனன்டை அமைக்கவும்
azd config set auth.tenantId "your-tenant-id"

# 3. டெனன்டுகளை மாற்றினால் டெனன்ட் கேஷை அழிக்கவும்
az account clear
```

## 🏗️ கட்டமைப்பு வழங்கல் பிழைகள்

### பிரச்சினை: வளப் பெயர் மோதல்கள்
**அறிகுறிகள்:**
- "வளப் பெயர் ஏற்கனவே உள்ளது" போன்ற பிழைகள்
- வளம் உருவாக்கும் போது வெளியீடு தோல்வி

**தீர்வுகள்:**
```bash
# 1. டோக்கன்களுடன் தனித்துவமான வளப் பெயர்களைப் பயன்படுத்தவும்
# உங்கள் Bicep டெம்ப்ளேட்டில்:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. சுற்றுச்சூழல் பெயரை மாற்றவும்
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ஏற்கனவே உள்ள வளங்களை சுத்தப்படுத்தவும்
azd down --force --purge
```

### பிரச்சினை: இடம்/மண்டலம் கிடைக்கவில்லை
**அறிகுறிகள்:**
- "வள வகைக்கு 'xyz' இடம் கிடைக்கவில்லை" போன்ற செய்தி
- தேர்ந்தெடுக்கப்பட்ட மண்டலத்தில் சில SKU-கள் கிடைக்காது

**தீர்வுகள்:**
```bash
# 1. வள வகைகளுக்கான கிடைக்கும் இடங்களை சரிபார்க்கவும்
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. பொதுவாக கிடைக்கும் பிராந்தியங்களை பயன்படுத்தவும்
azd config set defaults.location eastus2
# அல்லது
azd env set AZURE_LOCATION eastus2

# 3. பிராந்தியத்தின்படி சேவை கிடைக்கும் நிலையை சரிபார்க்கவும்
# பார்வையிடவும்: https://azure.microsoft.com/global-infrastructure/services/
```

### பிரச்சினை: குவோட்டா மீறல் பிழைகள்
**அறிகுறிகள்:**
- "வள வகைக்கான குவோட்டா மீறப்பட்டது"
- "அதிகபட்ச வளங்களின் எண்ணிக்கை அடைந்துவிட்டது"

**தீர்வுகள்:**
```bash
# 1. தற்போதைய குவோட்டா பயன்பாட்டை சரிபார்க்கவும்
az vm list-usage --location eastus2 -o table

# 2. Azure போர்டலின் மூலம் குவோட்டா அதிகரிப்பை கோரவும்
# போகவும்: சப்ஸ்கிரிப்ஷன்கள் > பயன்பாடு + குவோட்டாக்கள்

# 3. அபிவிருத்திக்காக சிறிய SKUs பயன்படுத்தவும்
# main.parameters.json இல்:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. பயன்படுத்தப்படாத வளங்களை அகற்றவும்
az resource list --query "[?contains(name, 'unused')]" -o table
```

### பிரச்சினை: Bicep வார்ப்புரு பிழைகள்
**அறிகுறிகள்:**
- வார்ப்புரு சரிபார்ப்பு தோல்விகள்
- Bicep கோப்புகளில் வாக்கிய அமைப்பு பிழைகள்

**தீர்வுகள்:**
```bash
# 1. Bicep இன் இலக்கணத்தை சரிபார்க்கவும்
az bicep build --file infra/main.bicep

# 2. Bicep லின்டரைப் பயன்படுத்தவும்
az bicep lint --file infra/main.bicep

# 3. பாராமீட்டர் கோப்பின் இலக்கணத்தை சரிபார்க்கவும்
cat infra/main.parameters.json | jq '.'

# 4. நிாுவுதலின் மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview
```

## 🚀 வெளியீட்டு தோல்விகள்

### பிரச்சினை: கட்டுமான தோல்விகள்
**அறிகுறிகள்:**
- வெளியீட்டு போது பயன்பாடு கட்டப்படுவதில் தோல்வி
- பைல்களை/பாக்கேஜ்களை நிறுவும் போது பிழைகள்

**தீர்வுகள்:**
```bash
# 1. debug கொடியுடன் கட்டுமான வெளியீட்டை சரிபார்க்கவும்
azd deploy --service web --debug

# 2. நிறுவப்பட்ட சேவையின் நிலையை பார்க்கவும்
azd show

# 3. கட்டுமானத்தை உள்ளூரில் சோதிக்கவும்
cd src/web
npm install
npm run build

# 3. Node.js/Python பதிப்புகளின் பொருந்துதன்மையை சரிபார்க்கவும்
node --version  # azure.yaml அமைப்புகளுடன் பொருத்தமாக இருக்க வேண்டும்
python --version

# 4. கட்டுமான கேஷை சுத்தம் செய்யவும்
rm -rf node_modules package-lock.json
npm install

# 5. கன்டெய்னர்கள் பயன்படுத்தப்பட்டால் Dockerfile ஐ சரிபார்க்கவும்
docker build -t test-image .
docker run --rm test-image
```

### பிரச்சினை: கான்டெய்னர் வெளியீடு தோல்விகள்
**அறிகுறிகள்:**
- கான்டெய்னர் செயலிகள் துவங்க முடிய அவதானிக்கின்றன
- இமேஜ் பிடிப்பு பிழைகள்

**தீர்வுகள்:**
```bash
# 1. Docker உருவாக்கத்தை உள்ளூரில் சோதிக்கவும்
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI-ஐப் பயன்படுத்தி கன்டெய்னர் பதிவுகளைச் சரிபார்க்கவும்
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd மூலம் பயன்பாட்டைக் கண்காணிக்கவும்
azd monitor --logs

# 3. கன்டெய்னர் ரெஜிஸ்ட்ரி அணுகலை சரிபார்க்கவும்
az acr login --name myregistry

# 4. கன்டெய்னர் செயலியின் கட்டமைப்பைச் சரிபார்க்கவும்
az containerapp show --name my-app --resource-group my-rg
```

### பிரச்சினை: தரவுத்தளம் இணைப்பு தோல்விகள்
**அறிகுறிகள்:**
- பயன்பாடு தரவுத்தளத்துடன் இணைக்க முடியவில்லை
- இணைப்பு காலாவதி பிழைகள்

**தீர்வுகள்:**
```bash
# 1. தரவுத்தளத்தின் ஃபயர்வால் விதிகளை சரிபார்க்கவும்
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. பயன்பாட்டிலிருந்து இணைப்பை சோதிக்கவும்
# உங்கள் பயன்பாட்டில் தற்காலிகமாக சேர்க்கவும்:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. இணைப்பு ஸ்ட்ரிங் வடிவத்தை சரிபார்க்கவும்
azd env get-values | grep DATABASE

# 4. தரவுத்தள சேவையக நிலையைச் சரிபார்க்கவும்
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 கான்பிகரேஷன் பிரச்சினைகள்

### பிரச்சினை: சூழல் மாறிகள் செயல்படவில்லை
**அறிகுறிகள்:**
- பயன்பாடு கட்டமைப்பு மதிப்புகளை வாசிக்க முடியாது
- சூழல் மாறிகள் காலியாக தோன்றுகின்றன

**தீர்வுகள்:**
```bash
# 1. சூழல் மாறிலிகள் அமைக்கப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml இல் மாறிலி பெயர்களைக் சரிபார்க்கவும்
cat azure.yaml | grep -A 5 env:

# 3. பயன்பாட்டை மறுதொடக்கம் செய்யவும்
azd deploy --service web

# 4. அப் சேவை உள்ளமைவுகளை சரிபார்க்கவும்
az webapp config appsettings list --name myapp --resource-group myrg
```

### பிரச்சினை: SSL/TLS சான்றிதழ் பிரச்சினைகள்
**அறிகுறிகள்:**
- HTTPS செயல்படவில்லை
- சான்றிதழ் சரிபார்ப்பு பிழைகள்

**தீர்வுகள்:**
```bash
# 1. SSL சான்றிதழின் நிலையை சரிபார்க்கவும்
az webapp config ssl list --resource-group myrg

# 2. HTTPS-ஐ மட்டும் செயல்படுத்தவும்
az webapp update --name myapp --resource-group myrg --https-only true

# 3. தனிப்பயன் டொமைன் சேர்க்கவும் (தேவையானால்)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### பிரச்சினை: CORS கட்டமைப்பு பிரச்சினைகள்
**அறிகுறிகள்:**
- முன்நிலை (frontend) API-ஐ அழைக்க முடியவில்லை
- cross-origin கோரிக்கை தடைபட்டது

**தீர்வுகள்:**
```bash
# 1. App Service க்கு CORS அமைக்கவும்
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS கையாளுவதற்காக API ஐ புதுப்பிக்கவும்
# Express.js இல்:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. சரியான URL-களில் இயங்குகிறதா என்பதை சரிபார்க்கவும்
azd show
```

## 🌍 சூழல் மேலாண்மை பிரச்சினைகள்

### பிரச்சினை: சூழல் மாறுதல் சிக்கல்கள்
**அறிகுறிகள்:**
- தவறான சூழல் பயன்படுத்தப்படுகிறது
- கட்டமைப்பு சரியாக மாறவில்லை

**தீர்வுகள்:**
```bash
# 1. எல்லா சூழல்களையும் பட்டியலிடவும்
azd env list

# 2. சூழலை தெளிவாகத் தேர்ந்தெடுக்கவும்
azd env select production

# 3. தற்போதைய சூழலை சரிபார்க்கவும்
azd env list

# 4. சிதைந்திருந்தால் புதிய சூழலை உருவாக்கவும்
azd env new production-new
azd env select production-new
```

### பிரச்சினை: சூழல் மாசுபாடு
**அறிகுறிகள்:**
- சூழல் தவறான நிலையை காட்டுகிறது
- வளங்கள் கட்டமைப்புடன் பொருந்தவில்லை

**தீர்வுகள்:**
```bash
# 1. சூழலின் நிலையை புதுப்பிக்க
azd env refresh

# 2. சூழல் கட்டமைப்பை மீட்டமைக்க
azd env new production-reset
# தேவையான சூழல் மாறிகளை நகலெடுக்க
azd env set DATABASE_URL "your-value"

# 3. ஏற்கனவே உள்ள வளங்களை (சாத்தியமானால்) இறக்குமதி செய்ய
# .azure/production/config.json ஐ வள அடையாளங்களுடன் கைமுறையாக புதுப்பிக்க
```

## 🔍 செயல்திறன் பிரச்சினைகள்

### பிரச்சினை: தாமதமான வெளியீட்டு நேரங்கள்
**அறிகுறிகள்:**
- வெளியீடுகள் மிகவும் நீண்ட நேரம் எடுக்கின்றன
- வெளியீட்டின் போது கால அவகாசம் (timeouts)

**தீர்வுகள்:**
```bash
# 1. வேகமான மறு சுழற்சிகளுக்காக குறிப்பிட்ட சேவைகளை நிறுவவும்
azd deploy --service web
azd deploy --service api

# 2. அடித்தள அமைப்பு மாறாத போது கோடு மட்டும் வெளியீட்டை பயன்படுத்தவும்
azd deploy  # azd up-ஐ விட வேகமாக

# 3. கட்டுமான செயல்முறையை மேம்படுத்தவும்
# package.json-இல்:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. வள இருப்பிடங்களை சரிபார்க்கவும் (அதே பிராந்தியத்தைப் பயன்படுத்தவும்)
azd config set defaults.location eastus2
```

### பிரச்சினை: பயன்பாட்டு செயல்திறன் பிரச்சினைகள்
**அறிகுறிகள்:**
- மந்தமான பதிலளிப்பு நேரங்கள்
- அதிக வள பயன்பாடு

**தீர்வுகள்:**
```bash
# 1. வளங்களின் அளவை அதிகரிக்கவும்
# main.parameters.json இல் SKU ஐ புதுப்பிக்கவும்:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights கண்காணிப்பை இயக்கவும்
azd monitor --overview

# 3. Azure இல் செயலியின் பதிவுகளை சரிபார்க்கவும்
az webapp log tail --name myapp --resource-group myrg
# அல்லது Container Apps க்கு:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. கேஷிங் செயல்படுத்தவும்
# உங்கள் கட்டமைப்பில் Redis கேஷ் சேர்க்கவும்
```

## 🛠️ பிழைத்திருத்தக் கருவிகள் மற்றும் கட்டளைகள்

### டீபக் கட்டளைகள்
```bash
# முழுமையான பிழைத்திருத்தம்
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd பதிப்பை சரிபார்க்கவும்
azd version

# தற்போதைய கட்டமைப்பைப் பார்க்கவும்
azd config show

# இணைப்பை சோதிக்கவும்
curl -v https://myapp.azurewebsites.net/health
```

### பதிவு பகுப்பாய்வு
```bash
# Azure CLI மூலம் பயன்பாட்டு பதிவுகள்
az webapp log tail --name myapp --resource-group myrg

# azd மூலம் பயன்பாட்டை கண்காணிக்கவும்
azd monitor --logs
azd monitor --live

# Azure வள பதிவுகள்
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container Apps க்கான கன்டெய்னர் பதிவுகள்
az containerapp logs show --name myapp --resource-group myrg --follow
```

### வள விசாரணை
```bash
# எல்லா வளங்களையும் பட்டியலிடு
az resource list --resource-group myrg -o table

# வள நிலையை சரிபார்
az webapp show --name myapp --resource-group myrg --query state

# பிணைய பரிசோதனை
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 மேலதிக உதவி பெறுதல்

### எப்பொழுது மேல்முறையாக்க வேண்டும்
- அனைத்து தீர்வுகளையும் முயற்சி செய்தபின் அங்கீகாரம் பிரச்சினைகள் தொடர்ந்து இருந்தால்
- Azure சேவைகளுடன் சம்பந்தப்பட்ட கட்டமைப்பு பிரச்சினைகள்
- பில்லிங் அல்லது சந்தா தொடர்பான பிரச்சினைகள்
- பாதுகாப்பு தொடர்பான கவலைகள் அல்லது சம்பவங்கள்

### ஆதரவு சேனல்கள்
```bash
# 1. Azure சேவை நிலையை சரிபார்க்கவும்
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure ஆதரவு டிக்கெட்டை உருவாக்கவும்
# செல்லவும்: https://portal.azure.com -> உதவி + ஆதரவு

# 3. சமூக வளங்கள்
# - Stack Overflow: azure-developer-cli குறிச்சொல்
# - GitHub பிரச்சினைகள்: https://github.com/Azure/azure-dev/issues
# - Microsoft கேள்விகள் மற்றும் பதில்கள்: https://learn.microsoft.com/en-us/answers/
```

### தேடிக்கொள்ள வேண்டிய தகவல்
ஆதரவை தொடர்பு கொள்வதற்கு முன், இதனை சேகரிக்கவும்:
- `azd version` வெளியீடு
- `azd config show` வெளியீடு
- `azd show` வெளியீடு (தற்போதைய வெளியீடு நிலை)
- பிழைச் செய்திகள் (முழு உரை)
- சிக்கலை மீண்டும் ஏற்படுத்தும் படிகள்
- சூழல் விவரங்கள் (`azd env get-values`)
- சிக்கல் தொடங்கிய காலவரிசை

### லாக் சேகரிப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 சிக்கல் தடுப்பு

### முன்-வெளியீட்டு சரிபார்ப்பு பட்டியல்
```bash
# 1. அங்கீகாரத்தை உறுதிப்படுத்தவும்
az account show

# 2. குவோட்டாக்கள் மற்றும் வரம்புகளைச் சரிபார்க்கவும்
az vm list-usage --location eastus2

# 3. டெம்ப்ளேட்டுகளை உறுதிப்படுத்தவும்
az bicep build --file infra/main.bicep

# 4. முதலில் உள்ளூரில் சோதிக்கவும்
npm run build
npm run test

# 5. டிரை-ரன் டெப்ளாய்மென்ட்களை பயன்படுத்தவும்
azd provision --preview
```

### கண்காணிப்பு அமைப்பு
```bash
# Application Insights ஐ செயல்படுத்தவும்
# main.bicep இல் சேர்க்கவும்:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# அலர்டுகளை அமைக்கவும்
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### முந்திய பராமரிப்பு
```bash
# வாராந்திர ஆரோக்கிய பரிசோதனைகள்
./scripts/health-check.sh

# மாதாந்திர செலவு மதிப்பாய்வு
az consumption usage list --billing-period-name 202401

# காலாண்டு பாதுகாப்பு மதிப்பாய்வு
az security assessment list --resource-group myrg
```

## தொடர்புடைய வளங்கள்

- [Debugging Guide](debugging.md) - மேம்பட்ட டீபக்கிங் தொழில்நுட்பங்கள்
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - கட்டமைப்பு பிழைத்திருத்தம்
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - வள திட்டமிடல் வழிகாட்டி
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - சேவை நிலை பரிந்துரைகள்

---

**உதவு குறிப்பு**: இந்த வழிகாட்டியை பிடிவாதமாக சேமித்து வைத்துக் கொண்டு, சிக்கல்கள் ஏற்பட்டபோது குறிப்பிடப்பட்டுள்ள வழிகாட்டியைக் குறிக்கவும். பெரும்பாலான பிரச்சினைகள் முன்னர் காணப்பட்டவை மற்றும் அவற்றுக்கான தீர்வுகள் நிர்ணயிக்கப்பட்டுள்ளன!

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **அடுத்த பாடம்**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் ஏ.ஐ. மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயலினாலும், தானாக இயங்கும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமற்ற விபரங்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அந்த ஆவணத்தின் மூல மொழியில் உள்ள அசல் ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->