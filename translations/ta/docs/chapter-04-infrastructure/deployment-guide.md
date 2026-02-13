# வெளியீட்டு வழிகாட்டி - AZD வெளியீடுகளில் நிபுணத்துவம்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கர்களுக்கு](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - கட்டமைப்பை கோடாக நிர்வகித்தல் மற்றும் வெளியீடு
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)
- **➡️ அடுத்தது**: [வளங்களை வழங்குதல்](provisioning.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: பல-ஏஜென்ட் AI தீர்வுகள்](../../examples/retail-scenario.md)

## அறிமுகம்

இந்த## அமல்படுத்தல் செயல்முறையைப் புரிந்துகொள்வதைவிரிவான கையேடு Azure Developer CLI பயன்படுத்தி விண்ணப்பங்களை வெளியிடுவது பற்றிய அடிப்படை ஒரே-கட்டளை வெளியீடுகளிலிருந்து தனிப்பயன் ஹூக்கள், பல சூழல்கள் மற்றும் CI/CD ஒருங்கிணைப்புடன் கூடிய மேம்பட்ட உற்பத்தி சூழல்களுக்கு தேவையான அனைத்தையும் உள்ளடக்கியது. நடைமுறை எடுத்துக்காட்டுகள் மற்றும் சிறந்த நடைமுறைகளுடன் முழு வெளியீட்டு வாழ்நாள் சுழறலை திறம்பட கையாள்வது எவ்வாறு என்று கற்றுக்கொள்ளுங்கள்.

## கற்றல் இலக்குகள்

இந்தக் கையேட்டை முடித்தவுடன் நீங்கள்:
- Azure Developer CLI வெளியீட்டு கட்டளைகள் மற்றும் வேலைவழிகளை முழுமையாக ஆசார்யமாக掌握 (master) செய்யலாம்
- வழங்குதல் முதல் கண்காணிப்புவரை முழு வெளியீட்டு வாழ்நாள் சுழறலை புரிந்துகொள்வீர்கள்
- முன் மற்றும் பின் வெளியீட்டு தானியக்கத்திற்கு தனிப்பயன் ஹூக்கள் செயல்படுத்துவீர்கள்
- சூழல்-சுட்டி குறிப்புகளை கொண்ட பல சூழல்களை கட்டமைப்பீர்கள்
- புளூ-கிரீன் மற்றும் கனாரி போன்ற மேம்பட்ட வெளியீட்டு ռազմவகைகளை அமைக்கவும்
- azd வெளியீடுகளை CI/CD குழப்பிலில் மற்றும் DevOps வேலைநிறைவேற்றோட இணைக்கவும்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள் முடியும்:
- அனைத்து azd வெளியீட்டு வேலைவழிகளையும் தனக்கானால் இயக்கு மற்றும் பிரச்சினைநிரூபிக்க
- ஹூக்குகளைப் பயன்படுத்தி தனிப்பயன் வெளியீட்டு தானியக்கத்தை வடிவமைத்து செயல்படுத்த
- பாதுகாப்பு மற்றும் கண்காணிப்புடன் தயாரிப்பு-த தயாரிப்பு வெளியீடுகளை கட்டமைக்க
- பல-சூழல் கூடிய நுட்ப வெளியீட்டு சூழல்களை நிர்வகிக்க
- வெளியீட்டு செயல்திறனை மேம்படுத்தவும் திரும்பப்பெறுதல் (rollback) தந்திரங்கள் செயல்படுத்தவும்
- azd வெளியீடுகளை நிறுவன DevOps நடைமுறைகளில் ஒருங்கிணைக்க

## வெளியீட்டு கண்ணோட்டம்

Azure Developer CLI பல வெளியீட்டு கட்டளைகளை வழங்குகிறது:
- `azd up` - முழு வேலைவழி (provision + deploy)
- `azd provision` - Azure வளங்களை மட்டும் உருவாக்க/புதுப்பி
- `azd deploy` - செயலியின் குறியீடு மட்டும் வெளியிட
- `azd package` - செயலிகளை கட்டி தொகுப்பு செய்ய

## அடிப்படை வெளியீட்டு வேலைநிரல்கள்

### முழுமையான வெளியீடு (azd up)
புதிய திட்டங்களுக்கு மிகவும் பொதுவான வேலைவழி:
```bash
# அனைத்தையும் மூலத்திலிருந்து நிறுவு
azd up

# குறிப்பிட்ட சூழலுடன் நிறுவு
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் நிறுவு
azd up --parameter location=westus2 --parameter sku=P1v2
```

### கட்டமைப்பு மட்டும் வெளியீடு
Azure வளங்களை மட்டும் புதுப்பிக்கவேண்டிய போது:
```bash
# அடித்தள கட்டமைப்புகளை ஏற்பாடு/புதுப்பித்தல்
azd provision

# மாற்றங்களை முன்னோக்கியே காண சோதனை ஓட்டத்துடன் வழங்குதல்
azd provision --preview

# குறிப்பிட்ட சேவைகளை வழங்குதல்
azd provision --service database
```

### கோட் மட்டும் வெளியீடு
விளைவான செயலி புதுப்பிப்புகளுக்கு:
```bash
# அனைத்து சேவைகளையும் வினியோகிக்கவும்
azd deploy

# எதிர்பார்க்கப்படும் வெளியீடு:
# சேவைகள் வினியோகிக்கப்படுகின்றன (azd deploy)
# - web: வினியோகிக்கப்படுகிறது... முடிந்தது
# - api: வினியோகிக்கப்படுகிறது... முடிந்தது
# வெற்றி: உங்கள் வினியோகிப்பு 2 நிமிடம் 15 விநாடிகளில் முடிந்தது

# குறிப்பிட்ட சேவையை வினியோகிக்கவும்
azd deploy --service web
azd deploy --service api

# தனிப்பயன் கட்டுமான வாதங்களுடன் வினியோகிக்கவும்
azd deploy --service api --build-arg NODE_ENV=production

# வினியோகிப்பை சரிபார்க்கவும்
azd show --output json | jq '.services'
```

### ✅ வெளியீட்டு சரிபார்ப்பு

எந்தவொரு வெளியீட்டிற்குப் பின்னரும், வெற்றியை சரிபார்க்கவும்:

```bash
# எல்லா சேவைகளும் இயங்குகிறதா என்பதை சரிபார்க்கவும்
azd show

# ஹெல்த் எண்ட்பாயிண்டுகளை சோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# பிழைகளுக்காக கண்காணிக்கவும் (இயல்பாக உலாவியில் திறக்கப்படும்)
azd monitor --logs
```

**வெற்றி தரமான கேடர்கள்:**
- ✅ அனைத்து சேவைகளும் "Running" நிலையை காட்ட வேண்டும்
- ✅ ஹெல்த் என்ட்பாயிண்டுகள் HTTP 200 ஐத் திருப்ப வேண்டும்
- ✅ கடந்த 5 நிமிடங்களில் பிழை பதிவுகள் இருக்கக்கூடாது
- ✅ செயலி சோதனை கோரிக்கைகளுக்கு பதிலளிக்க வேண்டும்

## 🏗️ வெளியீட்டு செயல்முறையைப் புரிந்துகொள்வது

### கட்டம் 1: முன்-வளவழங்கல் ஹூக்கள்
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

### கட்டம் 2: கட்டமைப்பு வழங்கல்
- கட்டமைப்பு டெம்ப்ளேட்களை வாசிக்கிறது (Bicep/Terraform)
- Azure வளங்களை உருவாக்குகிறது அல்லது புதுப்பிக்கிறது
- நெட்வொர்க்கிங் மற்றும் பாதுகாப்பை கட்டமைக்கிறது
- கண்காணிப்பு மற்றும் பதிவு அமைப்புகளை அமைக்கிறது

### கட்டம் 3: பின்-வளவழங்கல் ஹூக்கள்
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

### கட்டம் 4: செயலி தொகுப்பு
- செயலி குறியீட்டை கட்டுகிறது
- வெளியீட்டு கலைத்தகுதிகளை உருவாக்குகிறது
- இலக்குமுறை (containers, ZIP கோப்புகள் போன்ற) க்காக தொகுப்புகளை உருவாக்குகிறது

### கட்டம் 5: முன்-வெளியேற்ற ஹூக்கள்
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

### கட்டம் 6: செயலி வெளியீடு
- தொகுக்கப்பட்ட செயலிகளை Azure சேவைகளுக்கு வெளியிடுகிறது
- கட்டமைப்பு அமைப்புகளை புதுப்பிக்கிறது
- சேவைகள் துவக்க/மறுதுவக்கம் செய்யப்படுகின்றன

### கட்டம் 7: பின்-வெளியேற்ற ஹூக்கள்
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

## 🎛️ வெளியீட்டு கட்டமைப்பு

### சேவை-குறிப்பிட்ட வெளியீட்டு அமைப்புகள்
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

### சூழல்-குறிப்பிட்ட கட்டமைப்புகள்
```bash
# வளர்ச்சி சூழல்
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# முன் தயாரிப்பு சூழல்
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

## 🔧 மேம்பட்ட வெளியீட்டு சூழல்கள்

### பல-சேவை விண்ணப்பங்கள்
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

### ப்ளூ-கிரீன் வெளியீடுகள்
```bash
# நீல சூழலை உருவாக்கு
azd env new production-blue
azd up --environment production-blue

# நீல சூழலை சோதனை செய்
./scripts/test-environment.sh production-blue

# போக்குவரத்தை நீலத்திற்கு மாற்று (கைமுறை DNS/லோடு பாலன்சரை புதுப்பிக்கவும்)
./scripts/switch-traffic.sh production-blue

# பச்சை சூழலை சுத்தம் செய்
azd env select production-green
azd down --force
```

### கனாரி வெளியீடுகள்
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

### படிக்கட்டுள்ள வெளியீடுகள்
```bash
#!/பின்/பாஷ்
# டிப்ளோய்-ஸ்டேஜ்ட்.sh

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

## 🐳 கண்டெய்னர் வெளியீடுகள்

### கண்டெய்னர் செயலி வெளியீடுகள்
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

### பல-நிலை Dockerfile மேம்படுத்தல்
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

### சேவை-குறிப்பிட்ட வெளியீடுகள்
```bash
# மீண்டும் விரைவாக சோதனை செய்வதற்காக குறிப்பிட்ட சேவையை வெளியிடு
azd deploy --service web
azd deploy --service api

# அனைத்து சேவைகளையும் வெளியிடு
azd deploy
```

### கட்டுமான கேசிங்
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### திறமையான கோட் வெளியீடுகள்
```bash
# குறியீட்டிற்கான மாற்றங்களுக்காக azd deploy-ஐ (azd up அல்ல) பயன்படுத்தவும்
# இது இன்ப்ராஸ்ட்ரக்சர் வழங்கலைத் தவிர்க்கிறது மற்றும் மிகவும் வேகமாக உள்ளது
azd deploy

# மிக வேகமான மறு சுழற்சிக்காக குறிப்பிட்ட சேவையை வெளியிடவும்
azd deploy --service api
```

## 🔍 வெளியீட்டு கண்காணிப்பு

### நேரடி வெளியீட்டு கண்காணிப்பு
```bash
# பயன்பாட்டை நேரடியாக கண்காணிக்கவும்
azd monitor --live

# பயன்பாட்டின் பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# பயன்படுத்தல் நிலையை சரிபார்க்கவும்
azd show
```

### ஹெல்த் சோதனைகள்
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

### பின்-வெளியேற்ற சரிபார்ப்பு
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# பயன்பாட்டின் செயல்நலத்தைச் சரிபார்க்க
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

## 🔐 பாதுகாப்பு கருத்துக்கள்

### ரகசியங்கள் மேலாண்மை
```bash
# ரகசியங்களை பாதுகாப்பாக சேமிக்கவும்
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml இல் ரகசியங்களை குறிப்பிடவும்
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

### அடையாளம் மற்றும் அணுகல் நிர்வாகம்
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

## 🚨 திரும்பப்பெறுதல் தந்திரங்கள்

### துரித திரும்பப்பெறுதல்
```bash
# AZD-க்கு உட்பட்ட ரோல்பேக் வசதி இல்லை. பரிந்துரைக்கப்பட்ட அணுகுமுறைகள்:

# விருப்பம் 1: Git-இலிருந்து மீண்டும் வழங்குதல் (பரிந்துரைக்கப்படுகிறது)
git revert HEAD  # பிரச்சனை ஏற்படுத்திய commit-ஐ மீட்டெடுக்கவும்
git push
azd deploy

# விருப்பம் 2: குறிப்பிட்ட commit-ஐ மீண்டும் வழங்குதல்
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### கட்டமைப்பு திரும்பப்பெறுதல்
```bash
# பயன்படுத்துவதற்கு முன் இன்ஃப்ராஸ்ட்ரக்சர் மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview

# இன்ஃப்ராஸ்ட்ரக்சர் மீட்பிற்கு, பதிப்பு கட்டுப்பாட்டைப் பயன்படுத்தவும்:
git revert HEAD  # இன்ஃப்ராஸ்ட்ரக்சர் மாற்றங்களை மீட்டமைக்கவும்
azd provision    # முந்தைய இன்ஃப்ராஸ்ட்ரக்சர் நிலையை செயல்படுத்தவும்
```

### தரவுத்தள மெருகுபடுத்தல் திரும்பப்பெறுதல்
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 வெளியீட்டு பரிமாணங்கள்

### வெளியீட்டு செயல்திறனை தடயப்படுத்து
```bash
# தற்போதைய டிப்ளாய்மெண்ட் நிலையைப் பார்க்கவும்
azd show

# Application Insights மூலம் பயன்பாட்டை கண்காணிக்கவும்
azd monitor --overview

# நேரடி அளவுகோல்களைப் பார்க்கவும்
azd monitor --live
```

### தனிப்பயன் மீட்டிர்க்குகள் சேகரிப்பு
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

### 1. சூழல் ஒத்திசைவு
```bash
# ஒத்த பெயரிடலைப் பயன்படுத்தவும்
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# சுற்றுச்சூழல் சமத்துவத்தை பராமரிக்கவும்
./scripts/sync-environments.sh
```

### 2. கட்டமைப்பு சரிபார்ப்பு
```bash
# பணியமர்த்துவதற்கு முன் கட்டமைப்பு மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview

# ARM/Bicep லின்டிங்கை பயன்படுத்தவும்
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

### 4. ஆவணப்படுத்தல் மற்றும் பதிவு வைத்தல்
```bash
# நிறுவுதல் செயல்முறைகளை ஆவணப்படுத்தவும்.
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## அடுத்த படிகள்

- [வளங்களை வழங்குதல்](provisioning.md) - கட்டமைப்பு மேலாண்மையில் ஆழ்ந்த ஆய்வு
- [முன்-வெளியேற்று திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - உங்கள் வெளியீட்டு रणनीதியை திட்டமிடுங்கள்
- [பொதுவான பிரச்சினைகள்](../chapter-07-troubleshooting/common-issues.md) - வெளியீட்டு பிரச்சினைகளை தீர்க்க
- [சிறந்த நடைமுறைகள்](../chapter-07-troubleshooting/debugging.md) - உற்பத்திக்கு தயாரான வெளியீட்டு நெறிமுறைகள்

## 🎯 நேரடி பயிற்சி வெளியீட்டு பயிற்சிகள்

### பயிற்சி 1: அதிகரிக்கும் வெளியீட்டு வேலைநிலை (20 நிமிடம்)
**தலைப்பு**: முழு மற்றும் அதிகரிக்கும் வெளியீடுகளுக்கு இடையிலான வேறுபாட்டைப் புரிந்துகொள்ளுதல்

```bash
# துவக்க வெளியீடு
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# துவக்க வெளியீடு நேரத்தை பதிவு செய்தல்
echo "Full deployment: $(date)" > deployment-log.txt

# குறியீட்டில் மாற்றம் செய்தல்
echo "// Updated $(date)" >> src/api/src/server.js

# குறியீட்டையே மட்டும் வெளியீடு (வேகமாக)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# நேரங்களை ஒப்பிடுதல்
cat deployment-log.txt

# சுத்தப்படுத்துதல்
azd down --force --purge
```

**வெற்றி தரமான கேடர்கள்:**
- [ ] முழு வெளியீடு 5-15 நிமிடங்களில் நடைபெறுகிறது
- [ ] கோட்-மட்ட வெளியீடு 2-5 நிமிடங்களில் நடைபெறுகிறது
- [ ] கோட் மாற்றங்கள் வெளியிடப்பட்ட செயலியில் பிரதிபலிக்கின்றன
- [ ] `azd deploy` 실행 후 கட்டமைப்பில் மாற்றம் இல்லை

**கற்றல் முடிவு**: `azd deploy` கோட் மாற்றங்களுக்கு `azd up`-ஐவிட 50-70% வேகமானது

### பயிற்சி 2: தனிப்பயன் வெளியீட்டு ஹூக்கள் (30 நிமிடம்)
**தலைப்பு**: முன் மற்றும் பின்-வெளியேற்றி தானியக்கத்தை செயல்படுத்தல்

```bash
# விடுவிப்புக்கு முன் சரிபார்ப்பு ஸ்கிரிப்டை உருவாக்கவும்
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# டெஸ்ட்கள் வெற்றியா என்பதைச் சரிபார்க்கவும்
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# commit செய்யப்படாத மாற்றங்கள் உள்ளனவா என்பதைச் சரிபார்க்கவும்
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# விடுவித்தபின் ஸ்மோக் சோதனையை உருவாக்கவும்
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

# azure.yaml கோப்பில் ஹுக்குகளை சேர்க்கவும்
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ஹுக்குகளுடன் பதிவேற்றத்தை சோதிக்கவும்
azd deploy
```

**வெற்றி தரமான கேடர்கள்:**
- [ ] வெளியீட்டிற்கு முன் ஸ்கிரிப்ட் வெளியீட்டிற்கு முன் இயங்குகிறது
- [ ] சோதனைகள் தோல்வியடைந்தால் வெளியீடு நிறுத்தப்படுகிறது
- [ ] பின்-வெளியேற்ற ஸ்மோக் சோதனை ஆரோக்கியத்தை உறுதி செய்கிறது
- [ ] ஹூக்கள் சரியான வரிசையில் செயல்படுகின்றன

### பயிற்சி 3: பல-சூழல் வெளியீட்டு στραடஜி (45 நிமிடம்)
**தலைப்பு**: படிகள் அடுக்கப்பட்ட வெளியீட்டு வேலைவழியை செயல்படுத்தல் (dev → staging → production)

```bash
# வெளியீட்டு ஸ்கிரிப்ட் உருவாக்கவும்
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# படி 1: dev-க்கு வெளியிடவும்
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# படி 2: staging-க்கு வெளியிடவும்
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# படி 3: உற்பத்திக்கான கைமுறை ஒப்புதல்
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

# படிக்கட்டியாக வெளியீட்டை இயக்கவும்
./deploy-staged.sh
```

**வெற்றி தரமான கேடர்கள்:**
- [ ] Dev சூழல் வெற்றிகரமாக வெளியிடப்பட்டது
- [ ] Staging சூழல் வெற்றிகரமாக வெளியிடப்பட்டது
- [ ] தயாரிப்புக்கு கைமுறை அங்கீகாரம் தேவையாகும்
- [ ] அனைத்து சூழல்களிலும் செயல்படக்கூடிய ஹெல்த் சோதனைகள் இருக்கின்றன
- [ ] தேவையெனில் திரும்பப்பெற முடியும்

### பயிற்சி 4: திரும்பப்பெறுதல் στραடஜி (25 நிமிடம்)
**தலைப்பு**: Git-ஐப் பயன்படுத்தி வெளியீட்டு திரும்பப்பெறலை செயல்படுத்தி சோதனை செய்தல்

```bash
# v1 ஐ வெளியிடு
azd env set APP_VERSION "1.0.0"
azd up

# v1 கமிட் ஹாஷ் சேமிக்கவும்
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# உடைக்கும் மாற்றத்துடன் v2 ஐ வெளியிடு
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# தோல்வியை கண்டறிந்து மீட்டமை செய்
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git பயன்படுத்தி மீட்டமை செய்
    git revert HEAD --no-edit
    
    # சூழலை மீட்டமை
    azd env set APP_VERSION "1.0.0"
    
    # v1 ஐ மறுபடி வெளியிடு
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**வெற்றி தரமான கேடர்கள்:**
- [ ] வெளியீட்டு தோல்விகளை கண்டறிய முடிகிறது
- [ ] திரும்பப்பெறல் ஸ்கிரிப்ட் தானாக இயங்குகிறது
- [ ] செயலி செயல்பாட்டுக்கு திரும்புகிறது
- [ ] திரும்பப்பெறும் பின் ஹெல்த் சோதனைகள் வெற்றியை காட்டுகின்றன

## 📊 வெளியீட்டு பரிமாணங்கள் கண்காணித்தல்

### உங்கள் வெளியீட்டு செயல்திறனை தொடர்ந்து கண்காணிக்கவும்

```bash
# டிப்ளாய்மென்ட் மெட்ரிக்ஸ் ஸ்கிரிப்டை உருவாக்கவும்
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

# கோப்பில் பதிவு செய்யவும்
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# இதைப் பயன்படுத்தவும்
./track-deployment.sh
```

**உங்கள் மீட்டிர்க்குகளை பகுப்பாய்வு செய்க:**
```bash
# வினியோக வரலாற்றை காண்க
cat deployment-metrics.csv

# சராசரி வினியோக நேரத்தை கணக்கிடவும்
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
- **அடுத்த பாடம்**: [வளங்களை வழங்குதல்](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். மூல ஆவணம் அதன் சொந்த மொழியில் அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதனால் ஏற்படும் எந்தவொரு தவறான புரிதல்களுக்கும் அல்லது தவறுமொழிபெயர்ப்புகளுக்கும் நாங்கள் பொறுப்பாக இருக்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->