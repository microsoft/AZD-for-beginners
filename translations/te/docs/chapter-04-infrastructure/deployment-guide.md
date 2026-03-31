# డిప్లాయ్‌మెంట్ గైడ్ - AZD డిప్లాయ్‌మెంట్స్‌లో నైపుణ్యం

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 4 - ఇన్ఫ్రాస్ట్రక్చర్ అజ్ కోడ్ & డిప్లాయ్‌మెంట్
- **⬅️ ముందు చాప్టర్**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ తదుపరి**: [Provisioning Resources](provisioning.md)
- **🚀 తదుపరి చాప్టర్**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure Developer CLI ఉపయోగించి అప్లికేషన్లను డిప్లాయ్ చేయడం గురించి మీరు తెలుసుకోవలసిన ప్రతిదీ కవర్ చేస్తుంది — సాధారణ ఒక ఆజ్ఞ డిప్లాయ్‌ల నుండి ప్రారంభించి, కస్టమ్ హుక్స్, బహుళ పర్యావరణాలు మరియు CI/CD ఇంటిగ్రేషన్ వంటి ప్రొడక్షన్ పరిస్థితుల వరకు. ఉపయోగికర ఉదాహరణలు మరియు ఉత్తమ ఆచారాలతో పూర్తి డిప్లాయ్‌మెంట్ లైఫ్‌సైకిల్‌లో నైపుణ్యం సాధించండి.

## నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ గైడ్ పూర్తి చేశాక, మీరు:
- Azure Developer CLI డిప్లాయ్‌మెంట్ ఆజ్ఞలు మరియు వర్వ్‌ఫ్లోలను పూర్తిగా నేర్చుకుంటారు
- ప్రొవిజనింగ్ నుండి మానిటరింగ్ వరకు పూర్తి డిప్లాయ్‌మెంట్ లైఫ్‌సైకిల్‌ను అర్థం చేసుకుంటారు
- ప్రీ మరియు పోస్ట్-డిప్లాయ్‌మెంట్ ఆటోమెషన్ కోసం కస్టమ్ డిప్లాయ్‌మెంట్ హుక్స్ అమలు చేస్తారు
- పర్యావరణ-స్పెసిఫిక్ పారామీటర్లతో బహుళ పర్యావరణాలను కాన్ఫిగర్ చేస్తారు
- బ్లూ-గ్రీన్ మరియు కానరీ వంటి ఆధునిక డిప్లాయ్‌మెంట్ వ్యూహాలను సెటప్ చేస్తారు
- azd డిప్లాయ్‌మెంట్‌లను CI/CD పైప్లైన్ల మరియు DevOps వర్క్‌ఫ్లోలలో ఇంటిగ్రేట్ చేస్తారు

## నేర్చిన ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- అన్ని azd డిప్లాయ్‌మెంట్ వర్వ్‌ఫ్లోలను స్వతంత్రంగా అమలు చేసి సమస్యలను పరిష్కరించగలరా
- హుక్స్ ఉపయోగించి కస్టమ్ డిప్లాయ్‌మెంట్ ఆటోమెషన్‌ను డిజైన్ చేసి అమలు చేయగలరా
- సరైన భద్రత మరియు మానిటరింగ్‌తో ప్రొడక్షన్-రెడీ డిప్లాయ్‌మెంట్‌లను కాన్ఫిగర్ చేయగలరా
- సంక్లిష్ట బహుళ పర్యావరణ డిప్లాయ్‌మెంట్ సన్నివేశాలను నిర్వహించగలరా
- డిప్లాయ్‌మెంట్ పనితీరును ఆప్టిమైజ్ చేసి రోల్‌ఒయిడ్ వ్యూహాలను అమలు చేయగలరా
- కంపెనీ స్థాయిలో DevOps తత్త్వాలలో azd డిప్లాయ్‌మెంట్‌లను ఇంటిగ్రేట్ చేయగలరా

## డిప్లాయ్‌మెంట్ అవలోకనం

Azure Developer CLI కొన్ని డిప్లాయ్‌మెంట్ ఆజ్ఞలను అందిస్తుంది:
- `azd up` - పూర్తి వర్క్‌ఫ్లో (వనరుల ఏర్పాటు + డిప్లాయ్)
- `azd provision` - కేవలం Azure వనరులను సృష్టించడం/అప్డేట్ చేయడం
- `azd deploy` - కేవలం అప్లికేషన్ కోడ్ ను డిప్లాయ్ చేయడం
- `azd package` - అప్లికేషన్లను బిల్డ్ చేసి ప్యాకేజ్ చేయడం

## బేసిక్ డిప్లాయ్‌మెంట్ వర్క్ఫ్లోలు

### పూర్తి డిప్లాయ్‌మెంట్ (azd up)
కొత్త ప్రాజెక్టుల కోసం అత్యంత సామాన్య వర్క్‌ఫ్లో:
```bash
# అన్నింటిని మొదట నుంచి డిప్లాయ్ చేయండి
azd up

# నిర్దిష్ట పర్యావరణంతో డిప్లాయ్ చేయండి
azd up --environment production

# అనుకూల పరామితులతో డిప్లాయ్ చేయండి
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ఇన్ఫ్రాస్ట్రక్చర్-ఒన్లీ డిప్లాయ్‌మెంట్
మీకు కేవలం Azure వనరులను నవీకరించాల్సిన అవసరం ఉన్నప్పుడు:
```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్‌ను ఏర్పాటు/నవీకరించండి
azd provision

# డ్రై-రన్‌తో ప్రొవిజన్ చేసి మార్పులను ముందుగా చూడండి
azd provision --preview

# నిర్దిష్ట సేవలను ఏర్పాటు చేయండి
azd provision --service database
```

### కోడ్-ఒన్లీ డిప్లాయ్‌మెంట్
త్వరిత అప్లికేషన్ నవీకరణల కోసం:
```bash
# అన్ని సేవలను అమలు చేయండి
azd deploy

# అంచనా ఫలితం:
# సేవలను డిప్లాయ్ చేస్తున్నారు (azd deploy)
# - web: డిప్లాయ్ అవుతోంది... పూర్తయింది
# - api: డిప్లాయ్ అవుతోంది... పూర్తయింది
# విజయం: మీ డిప్లాయ్‌మెంట్ 2 నిమిషాలు 15 సెకన్లలో పూర్తయింది

# నిర్దిష్ట సేవను డిప్లాయ్ చేయండి
azd deploy --service web
azd deploy --service api

# కస్టమ్ బిల్డ్ ఆర్గ్యుమెంట్లతో డిప్లాయ్ చేయండి
azd deploy --service api --build-arg NODE_ENV=production

# డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి
azd show --output json | jq '.services'
```

### ✅ డిప్లాయ్‌మెంట్ ధృవీకరణ

ఏ డిప్లాయ్‌మెంట్ తరువాతనైనా, విజయాన్ని నిర్ధారించండి:

```bash
# అన్ని సేవలు నడుస్తున్నాయా తనిఖీ చేయండి
azd show

# హెల్త్ ఎండ్‌పాయింట్లను పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# లోపాల కోసం పర్యవేక్షించండి (డిఫాల్ట్‌గా బ్రౌజర్‌లో తెరవబడుతుంది)
azd monitor --logs
```

**విజయ ప్రమాణాలు:**
- ✅ అన్ని సర్వీసులు "Running" స్థితిని చూపాలి
- ✅ హెల్త్ ఎండ్పాయింట్లు HTTP 200 రిటర్న్ చేయాలి
- ✅ చివరి 5 నిమిషాల్లో ఎలాంటి లోప లాగ్‌లు ఉండకూడదు
- ✅ అప్లికేషన్ టెస్ట్ అభ్యర్థనలకు స్పందించాలి

## 🏗️ డిప్లాయ్‌మెంట్ ప్రాసెస్‌ను అర్థం చేసుకోవడం

### దశ 1: ప్రీ-ప్రొవిజన్ హుక్స్
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

### దశ 2: ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్
- ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు చదివేరు (Bicep/Terraform)
- Azure వనరులను సృష్టిస్తుంది లేదా అప్డేట్ చేస్తుంది
- నెట్వర్కింగ్ మరియు భద్రతను కాన్ఫిగర్ చేస్తుంది
- మానిటరింగ్ మరియు లాగింగ్ సెటప్ చేస్తుంది

### దశ 3: పోస్ట్-ప్రొవిజన్ హుక్స్
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

### దశ 4: అప్లికేషన్ ప్యాకేజింగ్
- అప్లికేషన్ కోడ్‌ను బిల్డ్ చేస్తుంది
- డిప్లాయ్‌మెంట్ ఆర్టిఫాక్ట్స్‌ను సృష్టిస్తుంది
- లక్ష్య ప్లాట్‌ఫార్మ్ కోసం ప్యాకేజింగ్ చేస్తుంది (కంటైనర్లు, ZIP ఫైళ్ళు మొదలయినవి)

### దశ 5: ప్రీ-డిప్లాయ్ హుక్స్
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

### దశ 6: అప్లికేషన్ డిప్లాయ్‌మెంట్
- ప్యాకేజ్ చేయబడిన అప్లికేషన్లను Azure సర్వీసులకు డిప్లాయ్ చేస్తుంది
- కాన్ఫిగరేషన్ సెట్టింగ్స్‌ను అప్డేట్ చేస్తుంది
- సర్వీసులను స్టార్ట్/రీస్టార్ట్ చేస్తుంది

### దశ 7: పోస్ట్-డిప్లాయ్ హుక్స్
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

## 🎛️ డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్

### సర్వీస్-స్పెసిఫిక్ డిప్లాయ్‌మెంట్ సెట్టింగ్స్
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

### పర్యావరణ-స్పెసిఫిక్ కాన్ఫిగరేషన్లు
```bash
# అభివృద్ధి వాతావరణం
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# స్టేజింగ్ వాతావరణం
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ఉత్పత్తి వాతావరణం
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 అధునాతన డిప్లాయ్‌మెంట్ సన్నివేశాలు

### బహుళ-సర్వీస్ అప్లికేషన్లు
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

### బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్‌లు
```bash
# నీలి వాతావరణాన్ని సృష్టించండి
azd env new production-blue
azd up --environment production-blue

# నీలి వాతావరణాన్ని పరీక్షించండి
./scripts/test-environment.sh production-blue

# ట్రాఫిక్‌ను నీలికి మార్చండి (మాన్యువల్ DNS/లోడ్ బాలెన్సర్ నవీకరణ)
./scripts/switch-traffic.sh production-blue

# ఆకుపచ్చ వాతావరణాన్ని శుభ్రపరచండి
azd env select production-green
azd down --force
```

### కానరీ డిప్లాయ్‌మెంట్‌లు
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

### స్టేజ్డ్ డిప్లాయ్‌మెంట్‌లు
```bash
#!/బిన్/బాష్
# డిప్లాయ్-స్టేజ్డ్.sh

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

## 🐳 కంటైనర్ డిప్లాయ్‌మెంట్‌లు

### కంటైనర్ యాప్ డిప్లాయ్‌మెంట్‌లు
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

### బహుళ-దశ Dockerfile ఆప్టిమైజేషన్
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

## ⚡ పనితీరు ఆప్టిమైజేషన్

### సర్వీస్-స్పెసిఫిక్ డిప్లాయ్‌మెంట్‌లు
```bash
# వేగవంతమైన పునరావృతం కోసం ఒక నిర్దిష్ట సేవను అమలు చేయండి
azd deploy --service web
azd deploy --service api

# అన్ని సేవలను అమలు చేయండి
azd deploy
```

### బిల్డ్ కాచింగ్
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### సమర్థవంతమైన కోడ్ డిప్లాయ్‌మెంట్‌లు
```bash
# కేవలం కోడ్ మార్పుల కోసం azd deploy (azd up కాదు) ఉపయోగించండి
# ఇది ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌ను దాటివెళ్తుంది మరియు చాలా వేగంగా ఉంటుంది
azd deploy

# అత్యంత వేగవంతమైన పునరావృతానికి నిర్దిష్ట సేవను డిప్లాయ్ చేయండి
azd deploy --service api
```

## 🔍 డిప్లాయ్‌మెంట్ మానిటరింగ్

### రియల్-టైమ్ డిప్లాయ్‌మెంట్ మానిటరింగ్
```bash
# అప్లికేషన్‌ను రియల్‌టైమ్‌లో పర్యవేక్షించండి
azd monitor --live

# అప్లికేషన్ లాగ్‌లను వీక్షించండి
azd monitor --logs

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show
```

### హెల్త్ చెక్‌లు
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

### పోస్ట్-డిప్లాయ్‌మెంట్ వెరిఫికేషన్
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# అప్లికేషన్ ఆరోగ్యాన్ని తనిఖీ చేయండి
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

## 🔐 సెక్యూరిటీ పరిగణనాలు

### సీక్రెట్లు నిర్వహణ
```bash
# రహస్యాలను సురక్షితంగా నిల్వ చేయండి
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml లో రహస్యాలను సూచించండి
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

### నెట్‌వర్క్ సెక్యూరిటీ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ఐడెంటిటీ మరియు యాక్సెస్ మేనేజ్‌మెంట్
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

## 🚨 రోల్బ్యాక్ వ్యూహాలు

### త్వరిత రోల్బ్యాక్
```bash
# AZDకి అంతర్గత రోల్‌బ్యాక్ ఫీచర్ లేదు. సిఫార్సు చేసిన విధానాలు:

# ఎంపిక 1: Git నుండి మళ్లీ డిప్లాయ్ చేయండి (సిఫార్సు)
git revert HEAD  # సమస్యాత్మక కమిట్‌ను రివర్ట్ చేయండి
git push
azd deploy

# ఎంపిక 2: నిర్దిష్ట కమిట్‌ను మళ్లీ డిప్లాయ్ చేయండి
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ఇన్ఫ్రాస్ట్రక్చర్ రోల్బ్యాక్
```bash
# అప్లై చేయడానికి ముందు ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ముందుగా చూడండి
azd provision --preview

# ఇన్ఫ్రాస్ట్రక్చర్ రోల్‌బ్యాక్ కోసం, వెర్షన్ కంట్రోల్‌ను ఉపయోగించండి:
git revert HEAD  # ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను తిరిగి రద్దు చేయండి
azd provision    # మునుపటి ఇన్ఫ్రాస్ట్రక్చర్ స్థితిని వర్తింపజేయండి
```

### డేటాబేస్ మైగ్రేషన్ రోల్బ్యాక్
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 డిప్లాయ్‌మెంట్ మెట్రిక్స్

### డిప్లాయ్‌మెంట్ పనితీరును ట్రాక్ చేయండి
```bash
# ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితిని చూడండి
azd show

# Application Insightsతో అప్లికేషన్‌ను పర్యవేక్షించండి
azd monitor --overview

# లైవ్ మెట్రిక్స్‌ను చూడండి
azd monitor --live
```

### కస్టమ్ మెట్రిక్స్ కలెక్షన్
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

## 🎯 ఉత్తమ ఆచారాలు

### 1. పర్యావరణ నిరంతరత్వం
```bash
# సమానమైన నామకరణాన్ని ఉపయోగించండి
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# పరిసరాల సమానత్వాన్ని నిలుపుకోండి
./scripts/sync-environments.sh
```

### 2. ఇన్ఫ్రాస్ట్రక్చర్ ధృవీకరణ
```bash
# అమలు చేయక ముందే మౌలిక సదుపాయాల్లో మార్పులను ముందుగా సమీక్షించండి
azd provision --preview

# ARM/Bicep లింటింగ్‌ను ఉపయోగించండి
az bicep lint --file infra/main.bicep

# Bicep వ్యాకరణాన్ని ధృవీకరించండి
az bicep build --file infra/main.bicep
```

### 3. టెస్టింగ్ ఇంటిగ్రేషన్
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

### 4. డాక్యుమెంటేషన్ మరియు లాగింగ్
```bash
# డిప్లాయ్‌మెంట్ ప్రక్రియలను డాక్యుమెంట్ చేయండి
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## తదుపరి స్థాయిలూ

- [Provisioning Resources](provisioning.md) - ఇన్ఫ్రాస్ట్రక్చర్ నిర్వహణలో లోతైన అవలోకనం
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - మీ డిప్లాయ్‌మెంట్ వ్యూహాన్ని ప్రణాళిక చేయండి
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించండి
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - ప్రొడక్షన్-రెడీ డిప్లాయ్‌మెంట్ వ్యూహాలు

## 🎯 ప్రాక్టికల్ డిప్లాయ్‌మెంట్ వ్యాయామాలు

### వ్యాయామం 1: ఇన్క్రిమెంటల్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో (20 నిమిషాలు)
**లక్ష్యం**: పూర్తి మరియు ఇన్క్రిమెంటల్ డిప్లాయ్‌‌మెంట్‌ల మధ్య తేడాను నేర్చుకోవడం

```bash
# ప్రారంభ విడుదల
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ప్రారంభ విడుదల సమయాన్ని నమోదు చేయండి
echo "Full deployment: $(date)" > deployment-log.txt

# కోడ్‌లో మార్పు చేయండి
echo "// Updated $(date)" >> src/api/src/server.js

# కేవలం కోడ్‌ను విడుదల చేయండి (వేగంగా)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# సమయాలను పోల్చండి
cat deployment-log.txt

# శుభ్రపరచండి
azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] పూర్తి డిప్లాయ్‌మెంట్ 5-15 నిమిషాల్లో జరుగుతుంది
- [ ] కోడ్-ఒన్లీ డిప్లాయ్‌మెంట్ 2-5 నిమిషాల్లో జరుగుతుంది
- [ ] కోడ్ మార్పులు డిప్లాయ్ చేసిన అప్లికేషన్‌లో ప్రతిబింబిస్తాయి
- [ ] `azd deploy` తర్వాత ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులు జరగవు

**లోగత ఫలితం**: కోడ్ మార్పుల కోసం `azd deploy` `azd up` కంటే 50-70% వేగంగా ఉంటుంది

### వ్యాయామం 2: కస్టమ్ డిప్లాయ్‌మెంట్ హుక్స్ (30 నిమిషాలు)
**లక్ష్యం**: ప్రీ మరియు పోస్ట్-డిప్లాయ్‌మెంట్ ఆటోమెషన్‌ను అమలు చేయడం

```bash
# డిప్లాయ్ చేయడానికి ముందు వాలిడేషన్ స్క్రిప్ట్ సృష్టించండి
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# టెస్టులు పాస్ అయ్యాయా అని తనిఖీ చేయండి
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# కమిట్ చేయని మార్పులు ఉన్నాయా అని తనిఖీ చేయండి
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# డిప్లాయ్ తర్వాత స్మోక్ టెస్ట్ సృష్టించండి
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

# azure.yamlకి హుక్‌లు జోడించండి
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# హుక్స్‌తో డిప్లాయ్‌ను పరీక్షించండి
azd deploy
```

**విజయ ప్రమాణాలు:**
- [ ] ప్రీ-డిప్లాయ్ స్క్రిప్ట్ డిప్లాయ్‌మెంట్ ముందు నడుస్తుంది
- [ ] టెస్టులు విఫలమైతే డిప్లాయ్‌మెంట్ నిలిపివేయబడుతుంది
- [ ] పోస్ట్-డిప్లాయ్ స్మోక్ టెస్ట్ హెల్త్ను భద్రపరచుతుంది
- [ ] హుక్స్ సరైన క్రమంలో అమలు అవుతాయి

### వ్యాయామం 3: బహుళ-పర్యావరణ డిప్లాయ్‌మెంట్ వ్యూహం (45 నిమిషాలు)
**లక్ష్యం**: దశలవారిగా డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో అమలు చేయడం (dev → staging → production)

```bash
# డిప్లాయ్‌మెంట్ స్క్రిప్ట్ సృష్టించండి
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# దశ 1: డెవ్‌కు డిప్లాయ్ చేయండి
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# దశ 2: స్టేజింగ్‌కు డిప్లాయ్ చేయండి
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# దశ 3: ఉత్పత్తి కోసం మాన్యువల్ ఆమోదం
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

# ఎన్విరాన్‌మెంట్లు సృష్టించండి
azd env new dev
azd env new staging
azd env new production

# స్టేజ్ చేసిన డిప్లాయ్‌మెంట్ నడపండి
./deploy-staged.sh
```

**విజయ ప్రమాణాలు:**
- [ ] Dev పర్యావరణం విజయవంతంగా డిప్లాయ్ అవుతుంది
- [ ] Staging పర్యావరణం విజయవంతంగా డిప్లాయ్ అవుతుంది
- [ ] ప్రొడక్షన్ కోసం మాన్యుయల్ అప్రూవల్ అవసరం
- [ ] అన్ని పర్యావరణాలలో హెల్త్ చెక్‌లు పనిచేస్తున్నాయి
- [ ] అవసరమైతే రోల్‌బ్యాక్ చేయవచ్చు

### వ్యాయామం 4: రోల్బ్యాక్ వ్యూహం (25 నిమిషాలు)
**లక్ష్యం**: Git ఉపయోగించి డిప్లాయ్‌మెంట్ రోల్బ్యాక్‌ను అమలు చేసి పరీక్షించడం

```bash
# v1ని పంపిణీ చేయండి
azd env set APP_VERSION "1.0.0"
azd up

# v1 కమిట్ హాష్‌ను సేవ్ చేయండి
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# బ్రేకింగ్ మార్పుతో v2ని పంపిణీ చేయండి
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# వైఫల్యాన్ని గుర్తించి పూర్వ స్థితికి తిరిగి మార్చండి
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ఉపయోగించి పూర్వ స్థితికి తిరిగి మార్చండి
    git revert HEAD --no-edit
    
    # పర్యావరణాన్ని పూర్వ స్థితికి మార్చండి
    azd env set APP_VERSION "1.0.0"
    
    # v1ని మళ్లీ పంపిణీ చేయండి
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**విజయ ప్రమాణాలు:**
- [ ] డిప్లాయ్‌మెంట్ విఫలతలను గుర్తించగలగాలి
- [ ] రోల్బ్యాక్ స్క్రిప్ట్ ఆటోమేటిగ్గా అమలు అవుతుంది
- [ ] అప్లికేషన్ పనిస్థితికి తిరిగి వస్తుంది
- [ ] రోల్బ్యాక్కు తరువాత హెల్త్ చెక్‌లు ఠీకుగా ఉంటాయి

## 📊 డిప్లాయ్‌మెంట్ మెట్రిక్స్ ట్రాకింగ్

### మీ డిప్లాయ్‌మెంట్ పనితీరును ట్రాక్ చేయండి

```bash
# డిప్లాయ్‌మెంట్ మెట్రిక్స్ స్క్రిప్ట్ సృష్టించండి
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

# ఫైల్‌లో లాగ్ చేయండి
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# దాన్ని ఉపయోగించండి
./track-deployment.sh
```

**మీ మెట్రిక్స్‌ను విశ్లేషించండి:**
```bash
# డిప్లాయ్‌మెంట్ చరిత్ర చూడండి
cat deployment-metrics.csv

# సగటు డిప్లాయ్‌మెంట్ సమయాన్ని గణించండి
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## అదనపు వనరులు

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [Your First Project](../chapter-01-foundation/first-project.md)
- **తదుపరి పాఠం**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక అనువాదాలలో పొరపాట్లు లేదా అసంపూర్ణతలు ఉండే అవకాశం ఉందని దయచేసి గమనించండి. మూల భాషలో ఉన్న అసలు డాక్యుమెంట్‌ను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి, వృత్తిపరమైన మానవ అనువాదాన్ని సిఫార్సు చేస్తాము. ఈ అనువాదాన్ని ఉపయోగించడం వలన ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్ధం చేసుకోవడాల కోసం మేము బాధ్యతేపరులం కాదని తెలియజేస్తున్నాము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->