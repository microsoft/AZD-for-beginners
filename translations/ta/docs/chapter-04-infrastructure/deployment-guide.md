# நிறுவல் வழிகாட்டி - AZD நிறுவல்களில் நிபுணத்துவம்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கத்தினருக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - Infrastructure as Code மற்றும் நிறுவல்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)
- **➡️ அடுத்தது**: [வளங்கள் உருவாக்குதல்](provisioning.md)
- **🧩 இதிலும் உள்ளவை**: [உங்கள் சொந்த டெம்ப்ளேட்டை எழுதுதல்](custom-templates.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: பல-ஏஜென்ட் செயற்கை நுண்ணறிவு தீர்வுகள்](../../examples/retail-scenario.md)

## அறிமுகம்

Azure Developer CLI பயன்படுத்தி செயலிகளைக் கண்காணித்து நிறுவுவதற்கான அடிப்படை ஒரே-கமாண்ட் நிறுவலிலிருந்து கட்டமைக்கப்பட்ட உற்பத்தி சூழ்நிலைகளுக்கு (தனிப்பட்ட ஹுக்-கள், பல சூழல்கள், CI/CD ஒருங்கிணைப்பு மற்றும் மற்றவைகள்) வரை அனைத்தையும் இந்த விரிவான வழிகாட்டி கொண்டு வருகிறது. நடைமுறை எடுத்துக்காட்டுகளும் சிறந்த நடைமுறைகளும் மூலம் முழு நிறுவல் வாழ்க்கைச்சக்கரத்தை நீங்கள் தேர்ச்சி பெறலாம்.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடித்தவுடன், நீங்கள்:
- Azure Developer CLI அனைத்து நிறுவல் கட்டளைகள் மற்றும் பணிமுறைகளிலும் தேர்ச்சி பெறுவீர்கள்
- வழங்குதல் முதல் கண்காணிப்புவரை முழு நிறுவல் வாழ்க்கைச் சுழற்சியை புரிந்துகொள்ளலாம்
- முன் மற்றும் பின்-நிறுவல் ஆட்டோமேஷனுக்காக தனிப்பயன் ஹுக்-களை செயல்படுத்த முடியும்
- சூழல்-குறிப்பிட்ட பராமீட்டர்களுடன் பல சூழல்களை கட்டமைக்க முடியும்
- நீலம்-பச்சை மற்றும் கேனரி போன்ற முன்னீட்டத் திட்டங்களை அமைத்தல்
- azd நிறுவல்களை CI/CD குழாய்களுடன் மற்றும் DevOps பணிமுறைகளுடன் ஒருங்கிணைக்கலாம்

## கற்றல் முடிவுகள்

முடித்த பிறகு, நீங்கள் செய்யக்கூடியவை:
- அனைத்து azd நிறுவல் பணிமுறைகளையும் தனியாக செயல்படுத்தி பிழைகளை சரி செய்ய முடியும்
- ஹுக்-களைப் பயன்படுத்தி தனிப்பயன் நிறுவல் ஆட்டோமேஷன்களை வடிவமைத்து செயல்படுத்த முடியும்
- பாதுகாப்பு மற்றும் கண்காணிப்பு உடன் உற்பத்திக்கு தயாரான நிறுவல்களை கட்டமைக்க முடியும்
- கடினமான பல-சூழல் நிறுவல் சூழ்நிலைகளை நிர்வகிக்க முடியும்
- நிறுவல் செயல்திறனுக்கு மேம்பாடு செய்து மீள்பிரதி (rollback) உத்திகளை செயல்படுத்த முடியும்
- azd நிறுவல்களை நிறுவன DevOps நடைமுறைகளில் ஒருங்கிணைக்க முடியும்

## நிறுவல் கண்ணோட்டம்

Azure Developer CLI பல நிறுவல் கட்டளைகளை வழங்குகிறது:
- `azd up` - முழு பணிமுறை (provision + deploy)
- `azd provision` - Azure வளங்களை உருவாக்க/புதுப்பிக்க மட்டும்
- `azd deploy` - செயலி குறியீட்டை மட்டும் நிறுவுதல்
- `azd package` - செயலிகளை கட்டமைத்து பாக்கேஜ் செய்தல்

## அடிப்படை நிறுவல் பணிமுறைகள்

### முழுமையான நிறுவல் (azd up)
புது திட்டங்களுக்கான பொதுவான பணிமுறை:
```bash
# முதலில் இருந்து அனைத்தையும் நிறுவு
azd up

# குறிப்பிட்ட சுற்றுச்சூழலுடன் நிறுவு
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் நிறுவு
azd up --parameter location=westus2 --parameter sku=P1v2
```

### கட்டமைப்பு மட்டுமே நிறுவல்
நீங்கள் மட்டும் Azure வளங்களை புதுப்பிக்க வேண்டுமானால்:
```bash
# அடிப்படைக் கட்டமைப்பை வழங்குதல்/புதுப்பித்தல்
azd provision

# மாற்றங்களை முன்பார்வையிட ட்ரை-ரனுடன் வழங்குதல்
azd provision --preview

# குறிப்பிட்ட சேवைகளை வழங்குதல்
azd provision --service database
```

### குறியீடு மட்டும் நிறுவல்
அறைக்காரமான செயலி புதுப்பிப்புகளுக்கு:
```bash
# அனைத்து சேவைகளையும் வெளியிடு
azd deploy

# எதிர்பார்க்கப்படும் வெளியீடு:
# சேவைகளை வெளியிடுகிறது (azd deploy)
# - web: வெளியிடப்படுகிறது... முடிந்தது
# - api: வெளியிடப்படுகிறது... முடிந்தது
# வெற்றி: உங்கள் வெளியீடு 2 நிமிடம் 15 வினாடிகளில் முடிந்தது

# குறிப்பிட்ட சேவையை வெளியிடு
azd deploy --service web
azd deploy --service api

# தனிப்பயன் கட்டுமான அளவுருக்களுடன் வெளியிடு
azd deploy --service api --build-arg NODE_ENV=production

# வெளியீட்டை சரிபார்க்கு
azd show --output json | jq '.services'
```

### ✅ நிறுவல் சரிபார்ப்பு

ஏதாவது நிறுவல் முடிந்தவுடன் வெற்றியை உறுதி செய்யவும்:

```bash
# அனைத்து சேவைகளும் இயங்குகிறதா என்பதை சரிபார்க்கவும்
azd show

# ஹெல்த் எண்ட்பாயின்ட்களை சோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# பிழைகளுக்காக கண்காணிக்கவும் (இயல்பாக உலாவியில் திறக்கப்படும்)
azd monitor --logs
```

**வெற்றி அளவுகோல்கள்:**
- ✅ அனைத்து சேவைகளும் "Running" நிலையை காட்டு
- ✅ சுகாதார முனைகளில் HTTP 200 திருப்பி வழங்குகிறது
- ✅ கடந்த 5 நிமிடங்களில் எந்த பிழை பதிவுகளும் இல்லை
- ✅ செயலி பரிசோதனை கோரிக்கைகளுக்கு பதிலளிக்கிறது

## 🏗️ நிறுவல் செயல்முறையைப் புரிந்துகொள்வது

### ஹுக்-களுக்கு புதிதா? இங்கே தொடங்குங்கள்

**ஹுக்** என்பது azd நிறுவல் செயல்முறையில் ஒரு குறிப்பிட்ட தருணத்தில் தானாக இயக்கப்படும் கட்டளை—provisioning க்கு முன் அல்லது பிறகு, உங்கள் குறியீட்டை deploy செய்யும்முன் அல்லது பிறகு. இவை ஒரு நிறுவலின் சுற்றிலும்常செய்யப்படும் சிறு பணிகளைக் தானியங்கமாகச் செய்ய உதவுகின்றன: தரவுத்தள விதைக்கம் (seeding), மைग्रேஷன்கள் இயக்குதல், சொத்து(build) உருவாக்குதல், அல்லது முழு செயலி மீது smoke-test செய்தல்.

| Hook | இயங்கும்… | பொதுவான பயன்பாடு |
|------|-------|------------|
| `preprovision` | வளங்கள் உருவாக்கப்படுவதற்கு முன் | முன் நிபந்தனைகளை சரிபார், ஒரு பதிவறையில் உள்நுழைவு செய்யவும் |
| `postprovision` | வளங்கள் உருவாக்கப்பட்ட பிறகு | வளங்களை வடிவமைத்து, தரவுத்தளத்தை அமைக்கவும் |
| `predeploy` | குறியீடு வழங்கப்படுவதற்கு முன் | முன்னணி சொத்துகளை கட்டமைக்கவும், யூனிட் சோதனைகள் இயக்கவும் |
| `postdeploy` | குறியீடு செயல்பாட்டில் வந்த பிறகு | தரவுத்தள மைಗ್ರேஷன்களை இயக்கவும், endpoint-ஐ smoke-test செய்யவும் |

ஹுக்-கள் உங்கள் `azure.yaml`-இல் இருப்பதைக் கவனிக்கவும். சிறிய உதாரணம் கீழே—இது நிறுவலுக்குப் பிறகு ஒரு செய்தியை மட்டுமே அச்சிடுகிறது:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

அதே ஆகிறது—அடுத்த முறை நீங்கள் `azd up` இயக்கும்போது, அந்த செய்தி தானாக அச்சிடப்படும். முழு deploy இல்லாமல் தனியாக ஒரு ஹுக்-ஐ இயக்கலாம், இது சோதனைக்காக சிறந்தது:

```bash
azd hooks run postdeploy
```

குறைந்தபட்சம் கீழே உள்ள நிலைகள் ஒவ்வொரு நிலையில் நிஜ உலக ஹுக்-களை (மைగ్రேஷன்கள், சோதனைகள், சரிபார்ப்பு) காண்பிக்கின்றன.

### பாகம் 1: முன்-வள அமைப்பு ஹுக்-கள்
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### பாகம் 2: கட்டமைப்பு வழங்கல்
- கட்டமைப்பு டெம்ப்ளேட்களை (Bicep/Terraform) வாசிக்கிறது
- Azure வளங்களை உருவாக்கம் அல்லது புதுப்பிக்கிறது
- நெட்வொர்க்கிங் மற்றும் பாதுகாப்பை அமைக்கிறது
- கண்காணிப்பு மற்றும் பதிவேற்றத்தை அமைக்கிறது

### பாகம் 3: பின்னர்-வள அமைப்பு ஹுக்-கள்
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### பாகம் 4: செயலி தொகுப்பு
- செயலி குறியீட்டை கட்டமைக்கிறது
- நிறுவல் கலைப்படுத்திகளை உருவாக்குகிறது
- இலக்கு தளத்திற்கான பாக்கேஜிங் (கன்டெய்னர்கள், ZIP கோப்புகள் மற்றும் பிற) செய்கிறது

### பாகம் 5: முன்-வழங்கல் ஹுக்-கள்
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### பாகம் 6: செயலி நிறுவல்
- பாக்கேஜ் செய்யப்பட்ட செயலிகளை Azure சேவைகளிற்கு நிறுவுகிறது
- ஒழுங்கமைப்பு அமைப்புகளை புதுப்பிக்கிறது
- சேவைகளை துவக்க/மீண்டும் துவக்குகிறது

### பாகம் 7: பின்னர்-வழங்கல் ஹுக்-கள்
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### ஹுக் பிழைகளை கையாளுதல்

பொதுவாக, **ஒரு ஹுக் கட்டளை non-zero குறியீட்டுடன் வெளியேறினால், azd முழு செயல்பாட்டை நிறுத்துகிறது.** இது பொதுவாக நீங்கள் எதிர்பார்ப்பதுதான்—ஒரு தோல்வியடைந்த மைగ్రேஷன் deploy-ஐ நிறுத்த வேண்டும், ஒட்டுமொத்த செயலியை உடைத்தவிடக் கூடாது. ஆனால் இதன் பொருள் ஹுக்-கள் கவனமாக எழுதப்பட வேண்டும் என்பதுதான்.

**1. தோல்விகளை தெளிவாகவும் நோக்கமிட்டதாகவும் செய்யுங்கள்.** ஒரு ஹுக் அதன் கடைசி கட்டளை non-zero exit code-ஐ திருப்பினால் தோல்வியடைகிறது. ஷெல் ஸ்கிரிப்டுகளில், முதல் தோல்வி கட்டளையில் நிறுத்த `set -e` ஐச் சேர்க்கவும்:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. azd நிறுத்தாமல் ஹுக் தோல்வி அடைய அனுமதிக்கவும்.** அவசியமற்ற படிகளில் (اختிரச்சென்ற cache warm-up, முயற்சி செய்த அறிவிப்புகள்) `continueOnError: true` அமைக்கவும். azd தோல்வியை பதிவு செய்கிறது ஆனால் முன்னேறுகிறது:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. முழு ஓட்டத்திற்கு முன் ஹுக்-களை தனியாக சோதிக்கவும்.** `azd up` இயக்காமல் ஹுக்-ஐ தனியாக இயக்கி டீபக் செய்யலாம்—சென்றடைந்து விரைவாக மாற்றங்கள் செய்யப்படும்:

```bash
azd hooks run predeploy          # வெளியீட்டிற்கு முன் ஹுக் மட்டுமே இயங்குகிறது
azd hooks run postdeploy --service api
```

**4. OS-குறிப்பிட்ட ஷெல்களை கவனிக்கவும்.** `shell: pwsh` பயன்படுத்தும் ஹுக் இயங்க வேண்டுமானால் அதைக் இயக்கும் இயந்திரத்தில் PowerShell நிறுவப்பட்டிருப்பது அவசியம் (CI ஏஜென்ட்-களிலும்). மிகவியலான போர்டபாலிட்டிக்காக `shell: sh` ஐ பயன்படுத்தவும் அல்லது இரு `windows` மற்றும் `posix` பல்வருணங்களை வழங்கவும்:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **டீபக்கிங் குறிப்பு:** எந்த azd கட்டளையையும் `--debug` உடன் இயக்கி சரியான ஹுக் கட்டளை வரிசையை மற்றும் அதன் முழு வெளியீட்டையும் காணுங்கள்—முக்யமாக ஒரு ஹுக் உள்ளகமாகச் சரியாக இருந்தாலும் CI-இல் தோல்வியடையும் போது இது மிகவும் உதவியாக இருக்கும்.

## 🎛️ நிறுவல் அமைப்புகள்

### சேவை-குறிப்பிட்ட நிறுவல் அமைப்புகள்
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### சூழல்-குறிப்பிட்ட கொள்கைகள்
```bash
# வளர்ச்சி சூழல்
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# முன் உற்பத்தி சூழல்
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# உற்பத்தி சூழல்
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 மேம்பட்ட நிறுவல் சூழ்நிலைகள்

### பல-சேவை செயலிகள்
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### நீலம்-பச்சை (Blue-Green) நிறுவல்கள்
```bash
# நீல சூழலை உருவாக்கவும்
azd env new production-blue
azd up --environment production-blue

# நீல சூழலை சோதிக்கவும்
./scripts/test-environment.sh production-blue

# போக்குவரத்தினை நீலத்துக்கு மாற்றவும் (கைமுறை DNS/லோடு பாலன்சர் புதுப்பிப்பு)
./scripts/switch-traffic.sh production-blue

# பச்சை சூழலை சுத்தப்படுத்தவும்
azd env select production-green
azd down --force
```

### கேனரி நிறுவல்கள்
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### படி-அடிப்படையிலான வழங்கல்கள்
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 கன்டெய்னர் நிறுவல்கள்

### Container App நிறுவல்கள்
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Multi-Stage Dockerfile செயல்திறன் மேம்பாடு
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ செயல்திறன் மேம்பாடு

### சேவை-குறிப்பிட்ட நிறுவல்கள்
```bash
# விரைவான மறுசுழற்சிகளுக்காக ஒரு குறிப்பிட்ட சேவையை நிறுவு
azd deploy --service web
azd deploy --service api

# அனைத்துச் சேவைகளையும் நிறுவு
azd deploy
```

### கட்டுமான கேஷிங்
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### திறமையான குறியீடு நிறுவல்கள்
```bash
# கோடு மட்டமான மாற்றங்களுக்கு azd up அல்ல, azd deploy ஐப் பயன்படுத்தவும்
# இது உட்கட்டமைப்பு வழங்கலைத் தவிர்க்கிறது மற்றும் மிகவும் வேகமாகும்
azd deploy

# மிக வேகமான திருத்தத்திற்காக குறிப்பிட்ட சேவையை வெளியிடவும்
azd deploy --service api
```

## 🔍 நிறுவல் கண்காணித்தல்

### நேரடி நிறுவல் கண்காணித்தல்
```bash
# பயன்பாட்டை நேரடியாக கண்காணிக்க
azd monitor --live

# பயன்பாட்டின் பதிவுகளைப் பார்க்க
azd monitor --logs

# வினியோகத்தின் நிலையைச் சரிபார்க்க
azd show
```

### ஆரோக்கிய சோதனைகள்
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### பின்னர்-நிறுவல் சரிபார்ப்பு
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# விண்ணப்பத்தின் உடல்நலத்தைச் சரிபார்க்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 பாதுகாப்பு பரிசீலனைகள்

### ரகசிய மேலாண்மை
```bash
# ரகசியங்களை பாதுகாப்பாக சேமிக்கவும்
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml-இல் ரகசியங்களை குறிக்கவும்
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### நெட்வொர்க் பாதுகாப்பு
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### அடையாளம் மற்றும் அணுகல் மேலாண்மை
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 மீள்கட்டமைப்பு யுக்திகள்

### விரைவு மீள்கட்டமைப்பு
```bash
# AZD-க்கு உள்ளமைக்கப்பட்ட ரோல்பேக் செயல்பாடு இல்லை. பரிந்துரைக்கப்பட்ட அணுகுமுறைகள்:

# விருப்பம் 1: Git-இலிருந்து மீண்டும் வெளியிடுதல் (பரிந்துரைக்கப்படுகிறது)
git revert HEAD  # பிரச்சினை ஏற்படுத்திய commit-ஐ பின்வாங்கவும்
git push
azd deploy

# விருப்பம் 2: குறிப்பிட்ட commit-ஐ மீண்டும் வெளியிடுதல்
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### கட்டமைப்பு மீள்கட்டமைப்பு
```bash
# பயன்படுத்து‍தற்கு முன் இன்ஃப்ராஸ்ட்ரக்சர் மாற்றங்களை முன்னோக்காகப் பார்வையிடவும்
azd provision --preview

# இன்ஃப்ராஸ்ட்ரக்சர் பின்வாங்குவதற்கு, பதிப்பு கட்டுப்பாட்டை பயன்படுத்தவும்:
git revert HEAD  # இன்ஃப்ராஸ்ட்ரக்சர் மாற்றங்களை மீட்டமைக்கவும்
azd provision    # முந்தய இன்ஃப்ராஸ்ட்ரக்சர் நிலையை செயல்படுத்தவும்
```

### தரவுத்தள மைഗ്രேஷன் மீள்கட்டமைப்பு
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 நிறுவல் அளவுகோல்கள்

### நிறுவல் செயல்திறனைக் கண்காணிக்கவும்
```bash
# தற்போதைய வினியோக நிலையைப் பார்க்க
azd show

# Application Insights மூலம் பயன்பாட்டை கண்காணிக்க
azd monitor --overview

# நேரடி அளவீடுகளைப் பார்க்க
azd monitor --live
```

### தனிப்பயன் அளவுகோல் சேகரிப்பு
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 சிறந்த நடைமுறைகள்

### 1. சூழல் ஒரத்தன்மை
```bash
# ஒத்த பெயரிடலை பயன்படுத்தவும்
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# சுற்றுச்சூழல்களின் சமத்துவத்தை பராமரிக்கவும்
./scripts/sync-environments.sh
```

### 2. கட்டமைப்பு சோதனை
```bash
# வினியோகிப்புக்கு முன் அடிப்படை அமைப்பு மாற்றங்களை முன்னோக்கியுப் பார்க்கவும்
azd provision --preview

# ARM/Bicep லின்டிங்கை பயன்படுத்தவும்
az bicep lint --file infra/main.bicep

# Bicep சின்டாக்ஸைக் சரிபார்க்கவும்
az bicep build --file infra/main.bicep
```

### 3. சோதனை ஒருங்கிணைப்பு
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. ஆவணமிடுதல் மற்றும் பதிவேற்றம்
```bash
# விநியோகச் செயல்முறைகளை ஆவணப்படுத்தவும்
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## அடுத்த படிகள்

- [வளங்கள் உருவாக்குதல்](provisioning.md) - கட்டமைப்பு முகாம்படுத்தலின் ஆழமான ஆய்வு
- [முன்-நிறுவல் திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - உங்கள் நிறுவல் யோசனையை திட்டமிடுங்கள்
- [பொதுவான பிரச்சினைகள்](../chapter-07-troubleshooting/common-issues.md) - நிறுவல் பிரச்சினைகளை தீர்க்கவும்
- [சிறந்த நடைமுறைகள்](../chapter-07-troubleshooting/debugging.md) - உற்பத்திக்கு தயாரான நிறுவல் நடைமுறைகள்

## 🎯 கைமுறை நிறுவல் பயிற்சிகள்

### பயிற்சி 1: படிப்படியாகும் நிறுவல் பணிமுறை (20 நிமிடங்கள்)
**இலக்கு**: முழு மற்றும் படிப்படியாகும் நிறுவனங்களுக்கிடையிலான வேறுபாட்டை பயிற்றல்

```bash
# ஆரம்ப வெளியீடு
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ஆரம்ப வெளியீட்டு நேரத்தை பதிவுசெய்
echo "Full deployment: $(date)" > deployment-log.txt

# குறியீட்டில் மாற்றம் செய்
echo "// Updated $(date)" >> src/api/src/server.js

# குறியீட்டை மட்டுமே வெளியிடு (விரைவாக)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# நேரங்களை ஒப்பிடு
cat deployment-log.txt

# சுத்தப்படுத்து
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முழு நிறுவல் 5-15 நிமிடங்களில் நடைபெற வேண்டும்
- [ ] குறியீடு-மட்டுமே நிறுவல் 2-5 நிமிடங்களில் நடைபெற வேண்டும்
- [ ] குறியீட்டு மாற்றங்கள் நிறுவப்பட்ட செயலியில் பிரதிபலிக்கப்பட வேண்டும்
- [ ] `azd deploy` பின்னர் கட்டமைப்பு மாற்றம் ஏற்பட்டிருக்காது

**கற்றல் முடிவு**: குறியீடு மாற்றங்களுக்கு `azd deploy` என்பது `azd up`-ஐவிட 50-70% வேகமானது

### பயிற்சி 2: தனிப்பயன் நிறுவல் ஹுக்-கள் (30 நிமிடங்கள்)
**இலக்கு**: முன் மற்றும் பின்-நிறுவல் ஆட்டோமேஷன்களை செயல்படுத்துதல்

```bash
# பதிவேற்றத்திற்கு முன் சரிபார்ப்பு ஸ்கிரிப்டை உருவாக்கவும்
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# சோதனைகள் வெற்றியாக முடிந்ததா என்பதைச் சரிபார்க்கவும்
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# commit செய்யப்படாத மாற்றங்கள் உள்ளதா என்பதைச் சரிபார்க்கவும்
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# பதிவேற்றத்திற்கு பின் ஸ்மோக் பரிசோதனையை உருவாக்கவும்
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yaml கோப்பில் ஹூக்குகளைச் சேர்க்கவும்
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ஹூக்குகளுடன் பதிவேற்றத்தை சோதிக்கவும்
azd deploy
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முன்-வழங்கல் ஸ்கிரிப்ட் deployக்கு முன் இயங்க வேண்டும்
- [ ] சோதனைகள் தோல்வியடைந்தால் நிறுவல் நிறுத்தப்பட வேண்டும்
- [ ] பின்-வழங்கல் smoke test ஆரோக்கியத்தை சரிபார்க்கும்
- [ ] ஹுக்-கள் சரியான ஒழுங்கில் இயங்க வேண்டும்

### பயிற்சி 3: பல-சூழல் வழங்கல் யுக்தி (45 நிமிடங்கள்)
**இலக்கு**: படி-அடிப்படையிலான வழங்கல் பணிமுறை செயல்படுத்துதல் (dev → staging → production)

```bash
# டெப்ளாய்மெண்ட் ஸ்கிரிப்டை உருவாக்கு
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# படி 1: dev-க்கு டெப்ளாய் செய்
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# படி 2: staging-க்கு டெப்ளாய் செய்
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# படி 3: production-க்கான கைமுறை ஒப்புதல்
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# சூழல்களை உருவாக்கு
azd env new dev
azd env new staging
azd env new production

# ஸ்டேஜ் செய்யப்பட்ட டெப்ளாய்மெண்டை இயக்கு
./deploy-staged.sh
```

**வெற்றி அளவுகோல்கள்:**
- [ ] Dev சூழல் வெற்றிகரமாக நிறுவப்பட்டது
- [ ] Staging சூழல் வெற்றிகரமாக நிறுவப்பட்டது
- [ ] உற்பத்திக்கான மானிய அனுமதி தேவை
- [ ] அனைத்து சூழல்களுக்கும் வேலை செய்கின்ற ஆரோக்கிய சோதனைகள் இருக்க வேண்டும்
- [ ] தேவையானால் மீள்பின்னுக்கு திரும்ப முடியும்

### பயிற்சி 4: மீள்கட்டமைப்பு யுக்தி (25 நிமிடங்கள்)
**இலக்கு**: Git பயன்படுத்தி நிறுவல் மீள்கட்டமைப்பை செயல்படுத்தி சோதனை செய்தல்

```bash
# v1 ஐ வெளியிடு
azd env set APP_VERSION "1.0.0"
azd up

# v1 கமிட் ஹாஷை சேமிக்கவும்
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# பின்னிணைப்பு உடைக்கும் மாற்றத்துடன் v2 ஐ வெளியிடு
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# தோல்வியை கண்டறிந்து முந்தைய நிலைக்கு திரும்புக
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git பயன்படுத்தி முந்தைய நிலைக்கு திரும்புக
    git revert HEAD --no-edit
    
    # சூழலை முந்தைய நிலையில் திரும்புக
    azd env set APP_VERSION "1.0.0"
    
    # v1 ஐ மீண்டும் வெளியிடு
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**வெற்றி அளவுகோல்கள்:**
- [ ] நிறுவல் தோல்விகளை கண்டறிய முடியும்
- [ ] மீள்கட்டமைப்பு ஸ்கிரிப்ட் தானாக இயக்கப்படும்
- [ ] செயலி செயல்பாடான நிலைக்கு மறு திரும்பும்
- [ ] மீள்கட்டமைப்பிற்குப் பிறகு ஆரோக்கிய சோதனைகள் பாஸ் ஆகும்

## 📊 நிறுவல் அளவுகோல் கண்காணித்தல்

### உங்கள் நிறுவல் செயல்திறனை கண்காணிக்கவும்

```bash
# நிறுவுதல் அளவுகோல்கள் ஸ்கிரிப்டை உருவாக்கவும்
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# கோப்பில் பதிவு செய்யவும்
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# இதைப் பயன்படுத்தவும்
./track-deployment.sh
```

**உங்கள் அளவுகோல்களை பகுப்பாய்வு செய்யுங்கள்:**
```bash
# வினியோக வரலாற்றை பார்க்கவும்
cat deployment-metrics.csv

# சராசரி வினியோக நேரத்தை கணக்கிடவும்
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## கூடுதல் ஆதாரங்கள்

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **அடுத்த பாடம்**: [வளங்கள் உருவாக்குதல்](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->