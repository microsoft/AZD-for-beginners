# வினியோகக் கையேடு - AZD வினியோகங்களை நன்கு கையாளுதல்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பக்காரர்களுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - கோடாக உள்ள கட்டமைப்பும் விநியோகமும்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)
- **➡️ அடுத்தது**: [வளங்களை வழங்குதல்](provisioning.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: பல-ஏஜெண்ட் AI தீர்வுகள்](../../examples/retail-scenario.md)

## அறிமுகம்

இந்த விரிவான கையேடு Azure Developer CLI பயன்படுத்தி பயன்பாடுகளை விநியோகிப்பதில் தேவையான அனைத்தையும் உள்ளடக்கியது, அடிப்படை ஒரே-கட்டளை விநியோகிப்புகளிலிருந்து தனிப்பயன் ஹுக்‌கள், பல சூழல்கள் மற்றும் CI/CD ஒருங்கிணைப்புடன் கூடிய முன்னேறிய உற்பத்தி சூழல்கள் வரை. நடைமுறை எடுத்துக்காட்டுகள் மற்றும் சிறந்த நடைமுறைகளுடன் முழு விநியோக ஆயுளை ஆழமாக கற்று கொள்ளுங்கள்.

## கற்றலுக்கான இலக்குகள்

இந்த கையேடைக் முடித்தவுடன், நீங்கள்:
- Azure Developer CLI விநியோக கட்டளைகள் மற்றும் வேலைப்பாடுகளை முழுமையாக பயன்படுத்தத் தெரிந்துகொள்ளுவீர்கள்
- வழங்குதல் முதல் கண்காணிப்புவரை முழு விநியோக ஆயுளை புரிந்துகொள்ளுவீர்கள்
- முன் மற்றும் பின் விநியோக தானியக்கத்திற்கான தனிப்பயன் ஹுக்‌களை செயல்படுத்துவீர்கள்
- சூழல்-சார்ந்த அளவுருக்களுடன் பல சூழல்களை அமைத்துக் கொள்ளுவீர்கள்
- blue-green மற்றும் canary விநியோகங்களை உட்பட முன்னேறிய விநியோகத் தந்திரங்களை அமைப்பீர்கள்
- azd விநியோகங்களை CI/CD குழுக்களும் DevOps வேலைப்பாடுகளுடனும் ஒருங்கிணைப்பீர்கள்

## கற்றல் முடிவுகள்

முடிந்ததும், நீங்கள்:
- எல்லா azd விநியோக வேலைப்பாடுகளையும் தனக்கேற்ப இயக்கி பிழைகளை கண்டறிந்து சரிசெய்யும் திறன் பெறுவீர்கள்
- ஹுக்‌களைப் பயன்படுத்தி தனிப்பயன் விநியோக தானியக்கத்தை வடிவமைத்து செயல்படுத்துவீர்கள்
- சரியான பாதுகாப்பு மற்றும் கண்காணிப்புடன் உற்பத்திக்குத் தயாரான விநியோகங்களை கட்டமைப்பீர்கள்
- சிக்கலான பல-சூழல் விநியோக காட்சிகளை நிர்வகிப்பீர்கள்
- விநியோக செயல்திறனை மேம்படுத்தி திருப்பு (rollback) வியூகங்களை செயல்படுத்துவீர்கள்
- azd விநியோகங்களை நிறுவன DevOps நடைமுறைகளில் ஒருங்கிணைப்பீர்கள்

## விநியோகத்தின் மேலோட்டம்

Azure Developer CLI பல விநியோக கட்டளைகளை வழங்குகிறது:
- `azd up` - முழுமையான வேலைப்பாடு (வளங்கள் உருவாக்கல் + விநியோகப்படுத்தல்)
- `azd provision` - Azure வளங்களை மட்டும் உருவாக்க/புதுப்பிக்க
- `azd deploy` - பயன்பாட்டு குறியீட்டை மட்டும் விநியோகிக்க
- `azd package` - பயன்பாடுகளை கட்டமைத்து தொகுப்பாகக் கூட்டுதல்

## அடிப்படை விநியோக வேலைப்பாடுகள்

### முழுமையான விநியோகம் (azd up)
The most common workflow for new projects:
```bash
# ஆரம்பத்திலிருந்து அனைத்தையும் அமல்படுத்தவும்
azd up

# குறிப்பிட்ட சூழ்நிலையுடன் அமல்படுத்தவும்
azd up --environment production

# தனிப்பயன் அளவுருக்களுடன் அமல்படுத்தவும்
azd up --parameter location=westus2 --parameter sku=P1v2
```

### உட்கட்டமைப்பு மட்டமான விநியோகம்
When you only need to update Azure resources:
```bash
# அடித்தள வசதிகளை வழங்குதல்/புதுப்பித்தல்
azd provision

# மாற்றங்களை முன்னோட்டமாக பார்க்க ட்ரை-ரன் மூலம் வழங்குதல்
azd provision --preview

# குறிப்பிட்ட சேவைகளை வழங்குதல்
azd provision --service database
```

### குறியீடு மட்டமான விநியோகம்
For quick application updates:
```bash
# அனைத்து சேவைகளையும் வெளியிடுக
azd deploy

# எதிர்பார்க்கப்படும் வெளியீடு:
# சேவைகளை வெளியிடுதல் (azd deploy)
# - web: வெளியிடப்படுகிறது... முடிந்தது
# - api: வெளியிடப்படுகிறது... முடிந்தது
# வெற்றி: உங்கள் வெளியீடு 2 நிமிடம் 15 வினாடிகளில் முடிந்தது

# குறிப்பிட்ட சேவையை வெளியிடுக
azd deploy --service web
azd deploy --service api

# தனிப்பயன் கட்டுமான வாதங்களுடன் வெளியிடுக
azd deploy --service api --build-arg NODE_ENV=production

# வெளியீட்டை சரிபார்க்கவும்
azd show --output json | jq '.services'
```

### ✅ விநியோக சரிபார்ப்பு

எந்தவொரு விநியோகத்திற்குப் பிறகும், வெற்றி என்பதை உறுதிசெய்யுங்கள்:

```bash
# அனைத்து சேவைகளும் இயங்குகிறதா என்பதை சரிபார்க்கவும்
azd show

# ஹெல்த் எண்ட்பாயின்டுகளை சோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# பிழைகளுக்காக கண்காணிக்கவும் (சாதாரணமாக உலாவியில் திறக்கப்படும்)
azd monitor --logs
```

**வெற்றி அளவுகோல்கள்:**
- ✅ எல்லா சேவைகளும் "இயக்கத்தில்" நிலையை காட்டுகின்றன
- ✅ சுகாதார எண்ட்பாயிண்டுகள் return HTTP 200
- ✅ கடந்த 5 நிமிடங்களில் எந்த பிழை பதிவுகளும் இல்லை
- ✅ பயன்பாடு சோதனை வேண்டுதல்களுக்கு பதிலளிக்கிறது

## 🏗️ விநியோக செயல்முறையை புரிந்துகொள்வது

### பகுதி 1: முன்-வழங்குதல் ஹுக்‌கள்
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

### பகுதி 2: உட்கட்டமைப்பு வழங்கல்
- உட்கட்டமைப்பு மாதிரிகளை வாசிக்கிறது (Bicep/Terraform)
- Azure வளங்களைக் உருவாக்கும் அல்லது புதுப்பிக்கும்
- பிணைய மற்றும் பாதுகாப்பை அமைக்கும்
- கண்காணிப்பு மற்றும் பதிவு அமைப்பை அமைத்தல்

### பகுதி 3: பிறகு-வழங்குதல் ஹுக்‌கள்
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

### பகுதி 4: பயன்பாடு தொகுப்பாக்கம்
- பயன்பாட்டு குறியீடுகளை கட்டும்
- விநியோக உட்பொருட்களை உருவாக்குகிறது
- இலக்குப் பிளாட்ஃபாரத்துக்காக தொகுப்பாக மாற்றுகிறது (கொண்டெய்னர்கள், ZIP கோப்புகள், முதலியன)

### பகுதி 5: முன்-விநியோக ஹுக்‌கள்
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

### பகுதி 6: பயன்பாட்டு விநியோகம்
- தொகுப்பாக செய்யப்பட்ட பயன்பாடுகளை Azure சேவைகளில் விநியோகிக்கிறது
- கட்டமைப்பு அமைப்புகளை புதுப்பிக்கிறது
- சேவைகளை துவக்க/மறு துவக்க செய்கிறது

### பகுதி 7: பின்-விநியோக ஹுக்‌கள்
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

## 🎛️ விநியோக கட்டமைப்பு

### சேவை-சார்ந்த விநியோக அமைப்புகள்
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

### சூழல்-சார்ந்த கட்டமைப்புகள்
```bash
# வளர்ச்சி சூழல்
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ஸ்டேஜிங் சூழல்
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

## 🔧 முன்னேறிய விநியோக சூழ்நிலைகள்

### பல-சேவை பயன்பாடுகள்
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

### Blue-Green விநியோகங்கள்
```bash
# நீல சூழலை உருவாக்கவும்
azd env new production-blue
azd up --environment production-blue

# நீல சூழலை சோதிக்கவும்
./scripts/test-environment.sh production-blue

# டிராஃபிக்கை நீல சூழலுக்குத் திருப்பவும் (கைமுறை DNS/லோடு பாலன்சர் புதுப்பிப்பு)
./scripts/switch-traffic.sh production-blue

# பச்சை சூழலை சுத்தப்படுத்தவும்
azd env select production-green
azd down --force
```

### Canary விநியோகங்கள்
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

### படிநிலை (Staged) விநியோகங்கள்
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

## 🐳 கண்டெய்னர் விநியோகங்கள்

### கண்டெய்னர் செயலிகள் (Container App) விநியோகங்கள்
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

## ⚡ செயல்திறன் மேம்படுத்தல்

### சேவை-சார்ந்த விநியோகங்கள்
```bash
# விரைவான மீள்திருத்தங்களுக்காக ஒரு குறிப்பிட்ட சேவையை இயக்கவும்
azd deploy --service web
azd deploy --service api

# அனைத்து சேவைகளையும் இயக்கவும்
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

### செயல்திறன் மிகுந்த குறியீடு விநியோகங்கள்
```bash
# குறியீடு மட்டமான மாற்றங்களுக்கு azd deploy ஐப் பயன்படுத்தவும் (azd up அல்ல)
# இது நிர்மாணக் கட்டமைப்பு வழங்கலைத் தவிர்க்கிறது மற்றும் மிகவும் வேகமாக இருக்கும்
azd deploy

# மிக விரைவு மறு சுழற்சிக்காக குறிப்பிட்ட சேவையை வெளியிடவும்
azd deploy --service api
```

## 🔍 விநியோக கண்காணிப்பு

### மெய்நிகர் நேர விநியோக கண்காணிப்பு
```bash
# பயன்பாட்டை நேரடியாக கண்காணிக்கவும்
azd monitor --live

# பயன்பாட்டின் பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# பயன்பாட்டின் நிறுவல் நிலையை சரிபார்க்கவும்
azd show
```

### உடல்நிலை (Health) சோதனைகள்
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

### பின்-விநியோக சரிபார்ப்பு
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# விண்ணப்பத்தின் நலத்தைச் சரிபார்க்க
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

### ரகசிய முகாமைத்துவம்
```bash
# ரகசியங்களை பாதுகாப்பாக சேமிக்கவும்
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml இல் உள்ள ரகசியங்களை குறிப்பிடவும்
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

### வலையமைப்பு பாதுகாப்பு
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### அடையாளம் மற்றும் அணுகல் முகாமைத்துவம்
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

## 🚨 திருப்புமுன் (Rollback) நெறிமுறை

### விரைவு திருப்பம்
```bash
# AZD-இல் உள்ளமைவாக rollback வசதி இல்லை. பரிந்துரைக்கப்படும் அணுகுமுறைகள்:

# விருப்பம் 1: Git-இருந்து மீண்டும் ஏற்றல் (பரிந்துரைக்கப்படுகிறது)
git revert HEAD  # சிக்கலான commit-ஐ பின்தள்ளவும்
git push
azd deploy

# விருப்பம் 2: குறிப்பிட்ட commit-ஐ மீண்டும் ஏற்றல்
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### உட்கட்டமைப்பு திருப்பம்
```bash
# செயல்படுத்துவதற்கு முன் அடிப்படை அமைப்பு மாற்றங்களை முன்னோட்டமாகப் பாருங்கள்
azd provision --preview

# அமைப்பை மீட்டமைக்க பதிப்பு கட்டுப்பாட்டைக் பயன்படுத்தவும்:
git revert HEAD  # அமைப்பு மாற்றங்களை மீட்டமைக்கவும்
azd provision    # முந்தைய அமைப்பு நிலையை செயல்படுத்தவும்
```

### தரவுத்தளம் பரிமாற்ற திருப்பம்
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 விநியோக அளவுகள்

### விநியோக செயல்திறன் கண்காணித்தல்
```bash
# தற்போதைய வெளியீட்டு நிலையைப் பார்க்க
azd show

# Application Insights மூலம் பயன்பாட்டைக் கண்காணிக்க
azd monitor --overview

# நேரடி அளவுருக்களைப் பார்க்க
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

### 1. சூழல் ஒத்திசைவு
```bash
# பெயரிடலில் ஒற்றுமை வைத்திருங்கள்
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# சூழல்கள் இடையே சமநிலையை பராமரிக்கவும்
./scripts/sync-environments.sh
```

### 2. உட்கட்டமைப்பு சரிபார்ப்பு
```bash
# பதிவேற்றத்திற்கு முன்பு கட்டமைப்பு மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview

# ARM/Bicep லிண்டிங்கைப் பயன்படுத்தவும்
az bicep lint --file infra/main.bicep

# Bicep உரையமைப்பை சரிபார்க்கவும்
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
# வெளியீட்டு செயல்முறைகளை ஆவணப்படுத்து
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## அடுத்த படிகள்

- [வளங்களை வழங்குதல்](provisioning.md) - உட்கட்டமைப்பு மேலாண்மையில் ஆழமான ஆய்வு
- [முன்-விநியோக திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - உங்கள் விநியோகத் தந்திரத்தை திட்டமிடுங்கள்
- [பொதுவான பிரச்சினைகள்](../chapter-07-troubleshooting/common-issues.md) - விநியோகப் பிரச்சினைகளை தீர்க்குதல்
- [சிறந்த நடைமுறைகள்](../chapter-07-troubleshooting/debugging.md) - உற்பத்திக்கு-தயாரான விநியோகத் தந்திரங்கள்

## 🎯 நடைமுறை விநியோக பயிற்சிகள்

### பயிற்சி 1: முன்னேற்றமான விநியோக வேலைப்பாடு (20 நிமிடங்கள்)
**நோக்கம்**: முழுமையான மற்றும் முன்னேற்றமான விநியோகங்களின் வேறுபாட்டை ஆட்சி பெறுதல்

```bash
# துவக்க அமல்படுத்தல்
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# துவக்க அமல்படுத்தல் நேரத்தை பதிவுசெய்
echo "Full deployment: $(date)" > deployment-log.txt

# குறியீட்டில் மாற்றம் செய்
echo "// Updated $(date)" >> src/api/src/server.js

# குறியீட்டையே மட்டும் அமல்படுத்து (வேகமாக)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# நேரங்களை ஒப்பிடு
cat deployment-log.txt

# சுத்தம் செய்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முழு விநியோகம் 5-15 நிமிடங்கள் எடுக்கும்
- [ ] குறியீடு மட்டமான விநியோகம் 2-5 நிமிடங்கள் எடுக்கும்
- [ ] குறியீடு மாற்றங்கள் விநியோகிக்கப்பட்ட செயலியில் பிரதிபலிக்கப்படுகின்றன
- [ ] `azd deploy` பிறகு உட்கட்டமைப்பு மாறாது

**கற்றலின் முடிவு**: `azd deploy` குறியீடு மாற்றங்களுக்கு `azd up`-இவிட 50-70% வேகமாக செயல்படுகிறது

### பயிற்சி 2: தனிப்பயன் விநியோக ஹுக்‌கள் (30 நிமிடங்கள்)
**நோக்கம்**: முன் மற்றும் பின் விநியோக தானியக்கத்தை செயல்படுத்துதல்

```bash
# டிப்ளோயிக்கு முன் சரிபார்ப்பு ஸ்கிரிப்டை உருவாக்கவும்
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# டெஸ்ட்கள் வெற்றி அடைகிறதா என்பதை சோதிக்கவும்
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# கமிட் செய்யப்படாத மாற்றங்கள் உள்ளதா என்பதை சோதிக்கவும்
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# டிப்ளோய்க்குப் பிறகு ஸ்மோக் சோதனையை உருவாக்கவும்
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

# azure.yaml-க்கு ஹுக்குகளைச் சேர்க்கவும்
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ஹுக்குகளுடன் டிப்ளோய்மெண்டை சோதிக்கவும்
azd deploy
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முன்-விநியோக ஸ்கிரிப்ட் விநியோகத்திற்கு முன் இயக்கப்படுகிறது
- [ ] சோதனைகள் தோல்வியளித்தால் விநியோகம் நிறுத்தப்படுகிறது
- [ ] பின்-விநியோக ஸ்மோக் சோதனை உடல்நிலையை சரிபார்க்கும்
- [ ] ஹுக்‌கள் சரியான வரிசையில் இயங்குகின்றன

### பயிற்சி 3: பல-சூழல் விநியோகத் தந்திரம் (45 நிமிடங்கள்)
**நோக்கம்**: படிநிலை விநியோக வேலைப்பாட்டை செயல்படுத்துதல் (dev → staging → production)

```bash
# வினியோக ஸ்கிரிப்டை உருவாக்கவும்
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# படி 1: dev-க்கு வினியோகிக்கவும்
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# படி 2: staging-க்கு வினியோகிக்கவும்
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

# நிலைப்படுத்தப்பட்ட வினியோகத்தை இயக்கவும்
./deploy-staged.sh
```

**வெற்றி அளவுகோல்கள்:**
- [ ] Dev சூழல் வெற்றிகரமாக விநியோகிக்கப்படுகிறது
- [ ] Staging சூழல் வெற்றிகரமாக விநியோகிக்கப்படுகிறது
- [ ] உற்பத்திக்காக கைமுறை அனுமதி தேவையாகும்
- [ ] அனைத்து சூழல்களிலும் செயல்படும் உடல்நிலை சோதனைகள் உள்ளன
- [ ] தேவையானால் திரும்பப் பெற முடியும்

### பயிற்சி 4: திருப்புமுன் (Rollback) தந்திரம் (25 நிமிடங்கள்)
**நோக்கம்**: Git-ஐ பயன்படுத்தி விநியோகத்தை திரும்பப் பெறும் செயல்முறை செயல்படுத்தி சோதனை செய்தல்

```bash
# v1 ஐ வெளியிடு
azd env set APP_VERSION "1.0.0"
azd up

# v1 கமிட் ஹாஷை சேமி
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# இணக்கத்தை உடைக்கும் மாற்றத்துடன் v2 ஐ வெளியிடு
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# தோல்வியை கண்டறிந்து முந்தைய நிலைக்கு திரும்பு
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git பயன்படுத்தி முந்தைய நிலைக்கு திரும்பு
    git revert HEAD --no-edit
    
    # சுற்றுச்சூழலை முந்தைய நிலைக்கு திரும்பச் செய்
    azd env set APP_VERSION "1.0.0"
    
    # v1 ஐ மீண்டும் வெளியிடு
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**வெற்றி அளவுகோல்கள்:**
- [ ] விநியோக தோல்விகளை கண்டறிந்துகொள்ள முடியும்
- [ ] திருப்பித் திரும்பும் ஸ்கிரிப்ட் தானாக இயங்குகிறது
- [ ] பயன்பாடு செயல்பாட்டுக்கு திரும்பிறது
- [ ] திருப்பித்தருவினை பிறகு உடல்நிலை சோதனைகள் வெற்றி பெறுகின்றன

## 📊 விநியோக அளவுக் கண்காணிப்பு

### உங்கள் விநியோக செயல்திறனை கண்காணிக்கவும்

```bash
# வினியோக அளவீடுகளுக்கான ஸ்கிரிப்டை உருவாக்கவும்
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

# கோப்பில் பதிவு செய்க
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# இதைப் பயன்படுத்தவும்
./track-deployment.sh
```

**உங்கள் அளவுகோல்களை பகுப்பாய்வு செய்க:**
```bash
# டெப்ளாய்மெண்ட் வரலாறு காண்க
cat deployment-metrics.csv

# சராசரி டெப்ளாய்மெண்ட் நேரத்தை கணக்கிடு
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
**Disclaimer**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியக்குறைவுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனமாக இருங்கள். அதன் முதன்மை மொழியில் உள்ள அசல் ஆவணத்தையே அதிகாரப்பூர்வ ஆதாரமாக கருத வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பாக இருக்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->