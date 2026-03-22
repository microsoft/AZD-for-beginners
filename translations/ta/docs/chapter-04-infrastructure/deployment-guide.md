# நிறுவல் வழிகாரம் - AZD நிறுவல்களில் தேர்ச்சி பெறுதல்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பிகளுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - Infrastructure as Code மற்றும் நிறுவல்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)
- **➡️ அடுத்து**: [வளங்கள் வழங்குதல்](provisioning.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: பல-ஏஜென்ட் AI தீர்வுகள்](../../examples/retail-scenario.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI ஐப் பயன்படுத்தி பயன்பாடுகளை வழங்குவதில் நீங்கள் தெரிந்து கொள்ளவேண்டிய அனைத்தையும்கூடக் காப்பாற்றுகிறது — அடிப்படை ஒரே-கட்டளை நிறுவல்களில் இருந்து சுயவிருத்த ஹுக்‌లు, பல சுற்றுச்சூழல்கள் மற்றும் CI/CD ஒருங்கிணைப்புடன் கூடிய உயர்தர உற்பத்தி சூழ்நிலைகளுக்கான முன்னேற்றங்கள் வரை. நடைமுறை உதாரணங்கள் மற்றும் சிறந்த நடைமுறைகளைப் பின்பற்றி முழுமையான நிறுவல் வாழ்கைச்சுழற்சியில் தேர்ச்சி பெறுங்கள்.

## கற்றல் இலக்குகள்

By completing this guide, you will:
- Azure Developer CLI இன் அனைத்து நிறுவல் கட்டளைகள் மற்றும் பணிமுறைகளை maîtrise செய்யுதல்
- வளங்கள் வழங்குதல் முதல் கண்காணிப்புவரை முழு நிறுவல் வாழ்கைச்சுழற்சியைப் புரிந்துகொள்ளுதல்
- முன்னை மற்றும் பின்னை நிறுவலுக்கான தனிப்பயன் (custom) ஹுக்‌களை தானியங்கி செயலாகச் செயல்படுத்துதல்
- சுற்றுச்சூழல்-சுட்டிய அளவுருக்களுடன் பல சுற்றுச்சூழல்களை கட்டமைத்தல்
- blue-green மற்றும் canary போன்ற உயர்தர நிறுவல் தந்திரங்களை அமைத்தல்
- azd நிறுவல்களை CI/CD குழாய்களுடனும் DevOps பணிமுறைகளுடனும் ஒருங்கிணைத்தல்

## கற்றல் விளைவுகள்

முடித்த பிறகு, நீங்கள் முடியும்:
- அனைத்து azd நிறுவல் பணிமுறைகளையும் சுயமாக இயக்கி பிழைதிருத்தத்தைச் செய்யுதல்
- ஹுக்‌களைப் பயன்படுத்தி தனித்துவமான நிறுவல் தானியக்கத்தை வடிவமைத்து செயல்படுத்துதல்
- சரியான பாதுகாப்பு மற்றும் கண்காணிப்புடன் உற்பத்திக்கு தயாரான நிறுவல்களை அமைத்தல்
- சிக்கலான பல-சுற்றுச்சூழல் நிறுவல் சூழ்நிலைகளை நிர்வகித்தல்
- நிறுவல் செயல்திறனை tối முன்னேற்றம் செய்து திரும்பிச் செல்லும் (rollback) தந்திரங்களை செயல்படுத்துதல்
- azd நிறுவல்களை நிறுவன DevOps நடைமுறைகளில் ஒருங்கிணைத்தல்

## நிறுவல் ஆய்வு

Azure Developer CLI பல நிறுவல் கட்டளைகளை வழங்குகிறது:
- `azd up` - முழுமையான பணிமுறை (provision + deploy)
- `azd provision` - Azure வளங்களை உருவாக்குதல்/புதுப்பித்தல் மட்டும்
- `azd deploy` - பயன்பாட்டு குறியீட்டை மட்டுமே வழங்குதல்
- `azd package` - பயன்பாடுகளை கட்டமைத்து தொகுப்பு உருவாக்குதல்

## அடிப்படை நிறுவல் பணிமுறைகள்

### முழுமையான நிறுவல் (azd up)
புதிய திட்டங்களுக்கு மிகவும் பொதுவான பணிமுறை:
```bash
# எல்லாவற்றையும் பூஜ்ஜிய நிலையிலிருந்து நிலைநிறுத்து
azd up

# குறிப்பிட்ட சூழலுடன் நிலைநிறுத்து
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் நிலைநிறுத்து
azd up --parameter location=westus2 --parameter sku=P1v2
```

### கட்டமைப்பு மட்டும் வழங்குதல்
Azure வளங்களை மட்டுமே புதுப்பிக்க வேண்டிய பொழுது:
```bash
# அடித்தள கட்டமைப்பை அமைக்க/புதுப்பிக்க
azd provision

# மாற்றங்களை முன்னோட்டமாகப் பார்க்க சோதனை இயக்கம் (dry-run) மூலம் வழங்க
azd provision --preview

# குறிப்பிட்ட சேவைகளை வழங்க
azd provision --service database
```

### குறியீடு மட்டும் வழங்குதல்
விரைவான பயன்பாட்டு புதுப்பிப்புகளுக்கு:
```bash
# அனைத்து சேவைகளையும் வெளியிடு
azd deploy

# எதிர்பார்க்கப்படும் வெளியீடு:
# சேவைகள் வெளியிடப்படுகிறது (azd deploy)
# - web: வெளியிடப்படுகிறது... முடிந்தது
# - api: வெளியிடப்படுகிறது... முடிந்தது
# வெற்றி: உங்கள் வெளியீடு 2 நிமிடங்கள் 15 விநாடிகளில் நிறைவு அடைந்தது

# குறிப்பிட்ட சேவையை வெளியிடு
azd deploy --service web
azd deploy --service api

# தனிப்பயன் கட்டமைப்பு argument-களுடன் வெளியிடு
azd deploy --service api --build-arg NODE_ENV=production

# வெளியேற்றத்தை சரிபார்க்கு
azd show --output json | jq '.services'
```

### ✅ நிறுவல் சரிபார்ப்பு

எந்த குறிப்பிடத்தக்க நிறுவலின் பின்னரும் வெற்றியை சரிபார்க்கவும்:

```bash
# அனைத்து சேவைகளும் இயங்குகிறதா என்பதை சரிபார்க்கவும்
azd show

# ஹெல்த் எண்ட்பாயின்ட்களை சோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# பிழைகளை கண்காணிக்கவும் (இயல்பாக உலாவியில் திறக்கப்படும்)
azd monitor --logs
```

**வெற்றி அளவுகோல்கள்:**
- ✅ அனைத்து சேவைகளும் "Running" நிலையை காட்ட வேண்டும்
- ✅ ஹெல்த் எண்ட்பாயின்டுகள் HTTP 200 ஐத் திரும்ப அளிக்க வேண்டும்
- ✅ கட últimas 5 நிமிடங்களில் பிழை பதிவுகள் இல்லாமல் இருக்க வேண்டும்
- ✅ பயன்பாடு சோதனை கோரிக்கைகளுக்கு பதிலளிக்க வேண்டும்

## 🏗️ நிறுவல் செயல்முறையை புரிந்துகொள்வது

### கட்டம் 1: முன்னணி-வழங்குதல் ஹுக்‌கள்
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

### கட்டம் 2: கட்டமைப்பு வழங்குதல்
- கட்டமைப்பு டெம்ப்ளேட்டுகளை (Bicep/Terraform) வாசிக்கிறது
- Azure வளங்களை உருவாக்கு அல்லது புதுப்பிக்கிறது
- நெட்வொர்க்கிங் மற்றும் பாதுகாப்பை அமைக்கிறது
- கண்காணிப்பு மற்றும் பதிவு அமைக்கிறது

### கட்டம் 3: பின்னணி-வழங்குதல் ஹுக்‌கள்
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

### கட்டம் 4: பயன்பாடு தொகுப்பு
- பயன்பாட்டு குறியீட்டை கட்டமைக்கிறது
- வழங்கல் கலைப்பொருட்களை உருவாக்குகிறது
- இலக்கு தளத்திற்காக தொகுப்புகளை உருவாக்குகிறது (containers, ZIP கோப்புகள் மற்றும் பிற)

### கட்டம் 5: முன்னணி-ஈர்ப்புகள் (Pre-Deploy Hooks)
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

### கட்டம் 6: பயன்பாட்டு நிறுவல்
- தொகுக்கப்பட்ட பயன்பாடுகளை Azure சேவைகளுக்கு வழங்குகிறது
- கட்டமைப்பு அமைவுகளை புதுப்பிக்கிறது
- சேவைகளை துவக்க/மீண்டும் துவக்குகிறது

### கட்டம் 7: பின்னணி-நிறுவல் ஹுக்‌கள்
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

## 🎛️ நிறுவல் கட்டமைப்பு

### சேவை-சார்ந்த நிறுவல் அமைப்புகள்
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

### சுற்றுச்சூழல்-சார்ந்த கட்டமைப்புகள்
```bash
# மேம்பாட்டு சூழல்
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# முன்-உற்பத்தி சூழல்
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

## 🔧 முன்னேற்றமான நிறுவல் சூழ்நிலைகள்

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

### Blue-Green நிறுவல்கள்
```bash
# நீல சூழலை உருவாக்கவும்
azd env new production-blue
azd up --environment production-blue

# நீல சூழலை சோதனை செய்யவும்
./scripts/test-environment.sh production-blue

# போக்குவரத்தை நீலத்திற்கு மாற்றவும் (கைமுறையாக DNS/லோட் பாலன்சர் புதுப்பிப்பு)
./scripts/switch-traffic.sh production-blue

# பச்சை சூழலை சுத்தம் செய்யவும்
azd env select production-green
azd down --force
```

### Canary நிறுவல்கள்
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

### கட்டம்நிலை (Staged) நிறுவல்கள்
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

### பல-அடுக்கு Dockerfile tốiமிறது
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

## ⚡ செயல்திறன் tốiமீசல்

### சேவை-சார்ந்த நிறுவல்கள்
```bash
# விரைவான மறுசுழற்சிக்காக ஒரு குறிப்பிட்ட சேவையை ஏற்படுத்தவும்
azd deploy --service web
azd deploy --service api

# அனைத்து சேவைகளையும் ஏற்படுத்தவும்
azd deploy
```

### கட்டமைப்பு கேஷிங்
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### திறமையான குறியீடு வழங்கல்கள்
```bash
# குறியீட்டுத் திருத்தங்களுக்கு azd deploy (azd up அல்ல) பயன்படுத்தவும்
# இது கட்டமைப்பு வழங்குதலைத் தவிர்க்கிறது மற்றும் மிகவும் வேகமானது
azd deploy

# மிகவேகமான மறுசுழற்சிக்காக குறிப்பிட்ட சேவையை வெளியிடுங்கள்
azd deploy --service api
```

## 🔍 நிறுவல் கண்காணிப்பு

### நேரடி நிறுவல் கண்காணிப்பு
```bash
# பயன்பாட்டை நேரடி நேரத்தில் கண்காணிக்க
azd monitor --live

# பயன்பாட்டின் பதிவுகளைப் பார்க்க
azd monitor --logs

# பதிவேற்ற நிலையைச் சரிபார்க்க
azd show
```

### உடல்நலம் சோதனைகள்
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

# விண்ணப்பத்தின் ஆரோக்கியத்தைக் சரிபார்க்கவும்
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

### ரகசியங்கள் மேலாண்மை
```bash
# ரகசியங்களை பாதுகாப்பாக சேமிக்கவும்
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml-இல் ரகசியங்களை குறிப்பிடவும்
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

## 🚨 திரும்பிச் செல்லும் (Rollback) தந்திரங்கள்

### விரைவு திரும்பிச் செல்லல்
```bash
# AZD-க்கு உள்ளமைக்கப்பட்ட மீட்டெடுப்பு (rollback) வசதி இல்லை. பரிந்துரைக்கப்பட்ட அணுகுமுறைகள்:

# விருப்பம் 1: Git-இலிருந்து மீண்டும் டிப்லோய் செய்யவும் (பரிந்துரைக்கப்படுகிறது)
git revert HEAD  # பிரச்சனையான commit-ஐ மறு நிலைக்கு மாற்றவும்
git push
azd deploy

# விருப்பம் 2: குறிப்பிட்ட commit-ஐ மீண்டும் டிப்லோய் செய்யவும்
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### கட்டமைப்பு திரும்பிச் செல்லல்
```bash
# பயன்படுத்துவதற்கு முன் அடிப்படை அமைப்பில் நடைபெறவுள்ள மாற்றங்களை முன்னோட்டமாகப் பாருங்கள்
azd provision --preview

# அடிப்படை அமைப்பைத் திரும்பப் பெற (rollback) செய்ய பதிப்பு கட்டுப்பாட்டைப் பயன்படுத்தவும்:
git revert HEAD  # அடிப்படை அமைப்பின் மாற்றங்களை மீட்டெடுக்கவும்
azd provision    # முந்தைய அடிப்படை அமைப்புத் நிலையை செயல்படுத்தவும்
```

### தரவுத்தளம் மைக்ரேஷன் திரும்பிச் செல்லல்
```bash
#!/பின்/பாஷ்
# ஸ்கிரிப்ட்ஸ்/ரோல்பேக்-டேட்டாபேஸ்.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 நிறுவல் அளவுகோல்கள்

### நிறுவல் செயல்திறனைப் பின்தொடர்க
```bash
# தற்போதைய வெளியீட்டு நிலையைப் பார்க்கவும்
azd show

# Application Insights மூலம் விண்ணப்பத்தை கண்காணிக்கவும்
azd monitor --overview

# நேரடி அளவுகோல்களைப் பார்க்கவும்
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

### 1. சுற்றுச்சூழல் ஒற்றுமை
```bash
# தொடர்ச்சியான பெயரிடலைப் பயன்படுத்தவும்
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# சூழல்கள் ஒரே மாதிரியாக இருக்குமாறு பராமரிக்கவும்
./scripts/sync-environments.sh
```

### 2. கட்டமைப்பு செல்லுபடியாக்கம்
```bash
# வினியோகிப்புக்கு முன் அடிப்படை அமைப்பு மாற்றங்களை முன்னோட்டமாக பார்க்கவும்
azd provision --preview

# ARM/Bicep லின்டிங்கைப் பயன்படுத்தவும்
az bicep lint --file infra/main.bicep

# Bicep சின்டாக்ஸை சரிபார்க்கவும்
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

### 4. ஆவணமிடல் மற்றும் பதிவு
```bash
# பதிவேற்ற செயல்முறைகளை ஆவணப்படுத்தவும்
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## அடுத்த படியாக

- [வளங்கள் வழங்குதல்](provisioning.md) - கட்டமைப்பு மேலாண்மையில் ஆழமான ஆய்வு
- [முன்-நிறுவல் திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - உங்கள் நிறுவல் திட்டத்தை திட்டமிடுங்கள்
- [சாதாரண சிக்கல்கள்](../chapter-07-troubleshooting/common-issues.md) - நிறுவல் சிக்கல்களை தீர்க்கவும்
- [சிறந்த நடைமுறைகள்](../chapter-07-troubleshooting/debugging.md) - உற்பத்தி-திறன்மான நிறுவல் தந்திரங்கள்

## 🎯 நடைமுறைப் பயிற்சி நிறுவல்கள்

### பயிற்சி 1: குறுகிய நிறுவல் பணிமுறை (20 நிமிடம்)
**இலக்கு**: முழு மற்றும் குறுக்கிடப்பட்ட (incremental) நிறுவல்களின் வேறுபாட்டை புரிந்துகொள்

```bash
# துவக்க பதிவேற்றம்
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# துவக்க பதிவேற்ற நேரத்தை பதிவு செய்
echo "Full deployment: $(date)" > deployment-log.txt

# குறியீட்டில் மாற்றம் செய்
echo "// Updated $(date)" >> src/api/src/server.js

# குறியீட்டை மட்டும் பதிவேற்று (விரைவு)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# நேரங்களை ஒப்பீடு செய்
cat deployment-log.txt

# சுத்தப்படுத்து
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முழு நிறுவல் 5-15 நிமிடங்களில் நடைபெறும்
- [ ] குறியீடு மட்டும் வழங்கல் 2-5 நிமிடங்களில் நடைபெறும்
- [ ] குறியீட்டு மாற்றங்கள் வழங்கப்பட்ட பயன்பாட்டில் பிரதிபலிக்க வேண்டும்
- [ ] `azd deploy` செயல்படுத்திய பின் கட்டமைப்பு மாறவில்லை

**கற்றல் விளைவுகள்**: `azd deploy` குறியீடு மாற்றங்களுக்கு `azd up` ஐவிட 50-70% வேகமாக இருக்கும்

### பயிற்சி 2: தனிப்பயன் நிறுவல் ஹுக்‌கள் (30 நிமிடம்)
**இலக்கு**: முன்னும் பின்னும்-நிறுவலுக்கான தானியக்கத்தை நடைமுறைப்படுத்துதல்

```bash
# பதிவேற்றத்திற்கு முன் சரிபார்ப்பு ஸ்கிரிப்டை உருவாக்கவும்
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# டெஸ்ட்கள் வெற்றியாக உள்ளதா என்பதைச் சரிபார்க்கவும்
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# கமிட் செய்யப்படாத மாற்றங்கள் உள்ளனவா என்பதைச் சரிபார்க்கவும்
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# பதிவுேற்றத்திற்குப் பிறகான ஸ்மோக் டெஸ்டை உருவாக்கவும்
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

# azure.yaml-இல் ஹூக்குகளை சேர்க்கவும்
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ஹூக்க்களுடன் பதிவேற்றத்தை சோதிக்கவும்
azd deploy
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முன்னணி-நிறுவல் ஸ்கிரிப்ட் நிறுவலுக்கு முன்பு இயங்க வேண்டும்
- [ ] சோதனைகள் தோல்வியால் நிறுவல் நிறுத்தப்பட வேண்டும்
- [ ] பின்னணி-நிறுவல் சிறு சோதனை ஹெல்த்டை உறுதிசெய்ய வேண்டும்
- [ ] ஹுக்‌கள் சரியான வரிசையில் இயங்க வேண்டும்

### பயிற்சி 3: பல-சுற்றுச்சூழல் நிறுவல் தந்திரம் (45 நிமிடம்)
**இலக்கு**: கட்டம்நிலையான நிறுவல் பணிமுறையை (dev → staging → production) நடைமுறைப்படுத்துதல்

```bash
# வெளியீட்டு ஸ்கிரிப்டை உருவாக்கவும்
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# படி 1: மேம்பாட்டு சூழலில் வெளியிடவும்
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# படி 2: ஸ்டேஜிங் சூழலில் வெளியிடவும்
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# படி 3: உற்பத்திக்கான கையால் ஒப்புதல்
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

# சூழல்களை உருவாக்கவும்
azd env new dev
azd env new staging
azd env new production

# ஸ்டேஜில் உள்ள வெளியீட்டை இயக்கவும்
./deploy-staged.sh
```

**வெற்றி அளவுகோல்கள்:**
- [ ] Dev சுற்றுச்சூழல் வெற்றிகரமாக நிறுவப்பட வேண்டும்
- [ ] Staging சுற்றுச்சூழல் வெற்றி பெற வேண்டும்
- [ ] Production க்கு கைமுறை அனுமதி தேவையாக இருக்க வேண்டும்
- [ ] அனைத்து சுற்றுச்சூழல்களிலும் வேலை செய்ங்கின்ற ஹெல்த் சோதனைகள் இருக்க வேண்டும்
- [ ] தேவையான போதிலும் திரும்பிச் செல்ல முடியும்

### பயிற்சி 4: திரும்பிச் செல்லும் தந்திரம் (25 நிமிடம்)
**இலக்கு**: Git பயன்படுத்தி நிறுவல் திரும்பிச் செல்லுதலை நடைமுறைப்படுத்தி சோதித்தல்

```bash
# v1 ஐ வெளியிடு
azd env set APP_VERSION "1.0.0"
azd up

# v1 கமிட் ஹாஷை சேமி
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ஒத்திசையாமை உண்டாக்கும் மாற்றத்துடன் v2 ஐ வெளியிடு
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# தோல்வியை கண்டுபிடித்து முந்தைய நிலைக்கு திரும்பு
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git பயன்படுத்தி முந்தைய நிலைக்கு திரும்பு
    git revert HEAD --no-edit
    
    # சூழகத்தை முந்தைய நிலைக்கு திரும்பு
    azd env set APP_VERSION "1.0.0"
    
    # v1 ஐ மீண்டும் வெளியிடு
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**வெற்றி அளவுகோல்கள்:**
- [ ] நிறுவல் தோல்விகளை கண்டறிய முடியும்
- [ ] திரும்பிச் செல்லும் ஸ்கிரிப்ட் தன்னியக்கமாக இயங்க வேண்டும்
- [ ] பயன்பாடு வேலை செய்கிற நிலைக்கு திரும்ப வேண்டும்
- [ ] திரும்பிச் சென்றபினும் ஹெல்த் சோதனைகள் நிறைவேற வேண்டும்

## 📊 நிறுவல் அளவுகோல்கள் கண்காணித்தல்

### உங்கள் நிறுவல் செயல்திறனைப் பின்தொடருங்கள்

```bash
# பதிவேற்றம் அளவீடுகள் ஸ்கிரிப்டை உருவாக்குக
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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# கோப்பில் பதிவு செய்
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# இதனைப் பயன்படுத்தவும்
./track-deployment.sh
```

**உங்கள் அளவுகோல்களை பகுப்பாய்வு செய்யவும்:**
```bash
# பயன்படுத்தல் வரலாற்றைக் பார்க்க
cat deployment-metrics.csv

# பயன்படுத்தல் நேரத்தின் சராசரியை கணக்கிட
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## கூடுதல் வளங்கள்

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **அடுத்த பாடம்**: [வளங்கள் வழங்குதல்](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்கிறோம் என்றாலும், தானியங்கி மொழிபெயர்ப்புகள் பிழைகள் அல்லது துல்லியக்குறைவுகள் கொண்டிருக்கலாம் என்பதை தயவுசெய்து கருத்தில் கொள்ளவும். அசல் ஆவணம் அதன் சொந்த மொழியில் அதிகாரபூர்வமான ஆதாரமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->