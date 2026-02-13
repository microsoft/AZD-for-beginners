# డిప్లాయ్‌మెంట్ గైడ్ - AZD డిప్లాయ్‌మెంట్స్‌లో నైపుణ్యం

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్‌సు హోమ్**: [AZD మొదటి పాఠాలు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 4 - ఇన్ఫ్రాస్ట్రక్చర్ మార్చే కోడ్ & డిప్లాయ్‌మెంట్
- **⬅️ గత అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)
- **➡️ తదుపరి**: [ресోర్సుల ప్రొవిజనింగ్](provisioning.md)
- **🚀 తదుపటి అధ్యాయం**: [అధ్యాయం 5: మల్టీ-ఏజెంట్ AI పరిష్కారాలు](../../examples/retail-scenario.md)

## పరిచయం

This## డిప్లాయ్‌మెంట్ ప్రక్రియను అర్థం చేసుకోవడం సమగ్ర గైడ్ Azure Developer CLI ను ఉపయోగించి అప్లికేషన్లను ఎలా డిప్లాయ్ చేయాలో మీకు కావాల్సిన అన్ని విషయాలను కవర్ చేస్తుంది, బేసిక్ ఒకే-కమాండ్ డిప్లాయ్‌మెంట్ల నుండి కస్టమ్ హూక్స్, బహుళ ఎన్విరాన్‌మెంట్స్ మరియు CI/CD సమ్మేళనంతో ఉన్న అధునాతన ప్రొడక్షన్ పరిస్థితుల వరకు. ప్రాక్టికల్ ఉదాహరణలు మరియు ఉత్తమ పద్ధతులతో పూర్తి డిప్లాయ్‌మెంట్ లైఫ్‌సైకిల్‌ను నైపుణ్యం సాధించండి.

## నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ గైడ్‌ను పూర్తి చేసిన తర్వాత మీరు:
- Azure Developer CLI అన్ని డిప్లాయ్‌మెంట్ కమాండ్లు మరియు వర్క్‌ఫ్లోలను నైపుణ్యంగా掌握 చేసుకుంటారు
- ప్రొవిజనింగ్ నుండి మానిటరింగ్ వరకు పూర్తి డిప్లాయ్‌మెంట్ జీవన చక్రాన్ని అర్థం చేసుకుంటారు
- ప్రీ మరియు పోస్ట్-డిప్లాయ్‌మెంట్ ఆటోమేషన్ కోసం కస్టమ్ డిప్లాయ్‌మెంట్ హూక్స్ అమలు చేస్తారు
- ఎన్విరాన్‌మెంట్-కేంద్రిత పారామీటర్లతో బహుళ ఎన్విరాన్‌మెంట్స్ కాన్ఫిగర్ చేస్తారు
- బ్లూ-గ్రీన్ మరియు కెనరీ వంటి అధునాతన డిప్లాయ్‌మెంట్ వ్యూహాలను అమలు చేయండి
- azd డిప్లాయ్‌మెంట్స్‌ను CI/CD పైప్లైన్స్ మరియు DevOps వర్క్‌ఫ్లోలతో సమగ్రపరిచండి

## నేర్పే ఫలితాలు

సంపూర్ణత తర్వాత, మీరు చేయగలరు:
- అన్ని azd డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలను స్వతంత్రంగా అమలు చేసి సమస్యలను పరిష్కరించగలరు
- హూక్స్ ఉపయోగించి కస్టమ్ డిప్లాయ్‌మెంట్ ఆటోమేషన్ డిజైన్ చేయగలరు
- సరైన భద్రత మరియు మానిటరింగ్‌తో ప్రొడక్షన్-రెడి డిప్లాయ్‌మెంట్‌లను కాన్ఫిగర్ చేయగలరు
- సంక్లిష్ట బహుళ-ఎన్విరాన్‌మెంట్ డిప్లాయ్‌మెంట్ ప్రమాదాలను నిర్వహించగలరు
- డిప్లాయ్‌మెంట్ పనితీరును ఆప్టిమైజ్ చేసి రోల్‌బ్యాక్ వ్యూహాలను అమలు చేయగలరు
- azd డిప్లాయ్‌మెంట్స్‌ను ఎంటర్ప్రైజ్ DevOps పద్ధతుల్లోనికి ఇంటిగ్రేట్ చేయగలరు

## డిప్లాయ్‌మెంట్ అవలోకనం

Azure Developer CLI కొన్ని డిప్లాయ్‌మెంట్ కమాండ్లను అందిస్తుంది:
- `azd up` - పూర్తి వర్క్‌ఫ్లో (provision + deploy)
- `azd provision` - కేవలం Azure రిసోర్సుల సృష్టి/పేరు నవీకరణ
- `azd deploy` - కేవలం అప్లికేషన్ కోడ్ డిప్లాయ్
- `azd package` - అప్లికేషన్లు నిర్మించి ప్యాకేజ్ చేయండి

## బేసిక్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలు

### పూర్తి డిప్లాయ్‌మెంట్ (azd up)
కొత్త ప్రాజెక్టులలో అత్యంత సాధారణ వర్క్‌ఫ్లో:
```bash
# అన్నింటినీ మొదటినుంచి అమలు చేయండి
azd up

# నిర్దిష్ట పర్యావరణంతో అమలు చేయండి
azd up --environment production

# అనుకూల పరామితులతో అమలు చేయండి
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ఇన్ఫ్రాస్ట్రక్చర్-ఓన్లీ డిప్లాయ్‌మెంట్
మీకు కేవలం Azure రిసోర్సులు అప్డేట్ చేయాలని ఉన్నపుడు:
```bash
# మౌలిక సదుపాయాలను ఏర్పాటు/నవీకరించండి
azd provision

# మార్పులను ముందుగా చూడటానికి డ్రై-రన్‌తో నిర్వహణ/ఎంపిక చేయండి
azd provision --preview

# నిర్దిష్ట సేవలను ఏర్పాటు చేయండి
azd provision --service database
```

### కోడ్-ఓన్లీ డిప్లాయ్‌మెంట్
త్వరిత అప్లికేషన్ అప్డేట్‌లకు:
```bash
# అన్ని సేవలను డిప్లాయ్ చేయండి
azd deploy

# ఆశించిన అవుట్పుట్:
# సేవలను డిప్లాయ్ చేస్తున్నది (azd deploy)
# - web: డిప్లాయ్ అవుతోంది... పూర్తయింది
# - api: డిప్లాయ్ అవుతోంది... పూర్తయింది
# విజయం: మీ డిప్లాయ్‌మెంట్ 2 నిమిషాలు 15 సెకన్లలో పూర్తయింది

# నిర్దిష్ట సేవను డిప్లాయ్ చేయండి
azd deploy --service web
azd deploy --service api

# అనుకూల బిల్డ్ పరామితులతో డిప్లాయ్ చేయండి
azd deploy --service api --build-arg NODE_ENV=production

# డిప్లాయ్‌మెంట్‌ను తనిఖీ చేయండి
azd show --output json | jq '.services'
```

### ✅ డిప్లాయ్‌మెంట్ ధృవీకరణ

ఏ డిప్లాయ్‌మెంట్ తరువాత, విజయం నిర్ధారించండి:

```bash
# అన్ని సేవలు నడుస్తున్నాయా తనిఖీ చేయండి
azd show

# హెల్త్ ఎండ్‌పాయింట్లను పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# దోషాల కోసం పర్యవేక్షించండి (డిఫాల్ట్‌గా బ్రౌజర్‌లో తెరవబడుతుంది)
azd monitor --logs
```

**విజయ ప్రమాణాలు:**
- ✅ అన్ని సేవలు "Running" స్థితిని చూపాలి
- ✅ హెల్త్ ఎండ్పాయింట్లు HTTP 200 రిటర్న్ చేయాలి
- ✅ గత 5 నిమిషాల్లో ఎలాంటి error logs ఉండకూడదు
- ✅ అప్లికేషన్ టెస్ట్ అభ్యర్థనలకు ప్రతిస్పందించాలి

## 🏗️ డిప్లాయ్‌మెంట్ ప్రక్రియను అర్థం చేసుకోవడం

### దశ 1: ప్రీ-ప్రొవిజన్ హూక్స్
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
- ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లను చదివిస్తుంది (Bicep/Terraform)
- Azure రిసోర్సులను సృష్టిస్తుంది లేదా నవీకరిస్తుంది
- నెట్వర్కింగ్ మరియు భద్రతను కాన్ఫిగర్ చేస్తుంది
- మానిటరింగ్ మరియు లాగింగ్ సెటప్ చేస్తుంది

### దశ 3: పోస్ట్-ప్రొవిజన్ హూక్స్
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
- అప్లికేషన్ కోడ్‌ను బిల్‌డింగ్ చేస్తుంది
- డిప్లాయ్‌మెంట్ ఆర్టిఫాక్ట్లను సృష్టిస్తుంది
- టార్గెట్ ప్లాట్‌ఫార్మ్ కోసం ప్యాకేజ్ చేస్తుంది (కంటైనర్లు, ZIP ఫైళ్ళు, మొదలైనవి)

### దశ 5: ప్రీ-డిప్లాయ్ హూక్స్
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
- ప్యాకేజ్ చేసిన అప్లికేషన్లను Azure సేవలకు డిప్లాయ్ చేస్తుంది
- కాన్ఫిగరేషన్ సెట్టింగులను నవీకరిస్తుంది
- సేవలను ప్రారంభిస్తుంది/పునఃప్రారంభిస్తుంది

### దశ 7: పోస్ట్-డిప్లాయ్ హూక్స్
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

### ఎన్విరాన్‌మెంట్-స్పెసిఫిక్ కాన్ఫిగరేషన్లు
```bash
# అభివృద్ధి పరిసరాలు
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# స్టేజింగ్ పరిసరాలు
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ఉత్పత్తి పరిసరాలు
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 అధునాతన డిప్లాయ్‌మెంట్ సన్నివేశాలు

### బహు-సర్వీస్ అప్లికేషన్లు
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
# నీలి పరిసరాన్ని సృష్టించండి
azd env new production-blue
azd up --environment production-blue

# నీలి పరిసరాన్ని పరీక్షించండి
./scripts/test-environment.sh production-blue

# ట్రాఫిక్‌ను నీలికి మార్చండి (చేతితో DNS/లోడ్ బ్యాలెన్సర్ నవీకరణ)
./scripts/switch-traffic.sh production-blue

# ఆకుపచ్చ పరిసరాన్ని శుభ్రం చేయండి
azd env select production-green
azd down --force
```

### కెనరీ డిప్లాయ్‌మెంట్‌లు
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

## 🐳 కంటైనర్ డిప్లాయ్‌మెంట్స్

### కంటైనర్ అప్లికేషన్ డిప్లాయ్‌మెంట్స్
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

### బహు-దశ Dockerfile ఆప్టిమైజేషన్
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

### సర్వీస్-స్పెసిఫిక్ డిప్లాయ్‌మెంట్స్
```bash
# త్వరిత పునరావృతాల కోసం ఒక నిర్దిష్ట సేవను అమలు చేయండి
azd deploy --service web
azd deploy --service api

# όλες సేవలను అమలు చేయండి
azd deploy
```

### బిల్డ్ క్యాచింగ్
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### సమర్థవంతమైన కోడ్ డిప్లాయ్‌మెంట్స్
```bash
# కోడ్ మాత్రమే మార్పుల కోసం azd deploy (azd up కాదు) ఉపయోగించండి
# ఇది ఇన్ఫ్రాస్ట్రక్చర్ ప్రోవిజనింగ్‌ను దాటివేస్తుంది మరియు చాలా వేగంగా ఉంటుంది
azd deploy

# అత్యంత వేగవంతమైన ఇటరేషన్ కోసం నిర్దిష్ట సర్వీస్‌ను డిప్లాయ్ చేయండి
azd deploy --service api
```

## 🔍 డిప్లాయ్‌మెంట్ మానిటరింగ్

### రియల్-టైమ్ డిప్లాయ్‌మెంట్ మానిటరింగ్
```bash
# అనువర్తనాన్ని రియల్-టైమ్‌లో పర్యవేక్షించండి
azd monitor --live

# అనువర్తన లాగ్‌లను చూడండి
azd monitor --logs

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show
```

### హెల్త్ చెక్స్
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

## 🔐 భద్రత విషయాలు

### ಸీక್ರೆಟ్స్ నిర్వహణ
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

### నెట్‌వర్క్ భద్రత
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

## 🚨 రోల్‌బ్యాక్ వ్యూహాలు

### క్విక్ రోల్‌బ్యాక్
```bash
# AZDలో ఆంతర్గిక రోల్బ్యాక్ లేదు. సిఫార్సు చేయబడిన విధానాలు:

# ఎంపిక 1: Git నుండి మళ్లీ డిప్లాయ్ చేయండి (సిఫార్సు చేయబడింది)
git revert HEAD  # సమస్యాత్మక కమిట్‌ను రద్దు చేయండి
git push
azd deploy

# ఎంపిక 2: నిర్దిష్ట కమిట్‌ను మళ్లీ డిప్లాయ్ చేయండి
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ఇన్ఫ్రాస్ట్రక్చర్ రోల్‌బ్యాక్
```bash
# అమలు చేయకముందు మౌలిక సదుపాయాల మార్పులను సమీక్షించండి
azd provision --preview

# మౌలిక సదుపాయాలను వెనక్కి తీసుకురావడానికి వెర్షన్ నియంత్రణను ఉపయోగించండి:
git revert HEAD  # మౌలిక సదుపాయాల మార్పులను రద్దు చేయండి
azd provision    # మునుపటి మౌలిక సదుపాయాల స్థితిని అమలు చేయండి
```

### డేటాబేస్ మైగ్రేషన్ రోల్‌బ్యాక్
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

### డిప్లాయ్‌మెంట్ పనితీరు ట్రాక్ చేయండి
```bash
# ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితిని చూడండి
azd show

# Application Insights తో అనువర్తనాన్ని పర్యవేక్షించండి
azd monitor --overview

# ప్రత్యక్ష మెట్రిక్స్‌ను చూడండి
azd monitor --live
```

### కస్టమ్ మెట్రిక్స్ సేకరణ
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

## 🎯 ఉత్తమ పద్ధతులు

### 1. ఎన్విరాన్‌మెంట్ సారూప్యత
```bash
# పేరులను సక్రమంగా, స్థిరంగా ఉపయోగించండి
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# పరిసరాల సమత్వాన్ని నిలుపుకోండి
./scripts/sync-environments.sh
```

### 2. ఇన్ఫ్రాస్ట్రక్చర్ ధృవీకరణ
```bash
# డిప్లాయ్‌మెంట్ చేయకముందు ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులను ముందుగా చూడండి
azd provision --preview

# ARM/Bicep లింటింగ్‌ను ఉపయోగించండి
az bicep lint --file infra/main.bicep

# Bicep సింటాక్స్‌ను ధృవీకరించండి
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

## తదుపరి దశలు

- [Provisioning Resources](provisioning.md) - ఇన్ఫ్రాస్ట్రక్చర్ నిర్వహణలో డీప్ డైవ్
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - మీ డిప్లాయ్‌మెంట్ వ్యూహాన్ని ప్లాన్ చేయండి
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించండి
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - ప్రొడక్షన్-రెడి డిప్లాయ్‌మెంట్ వ్యూహాలు

## 🎯 ప్రాక్టికల్ డిప్లాయ్‌మెంట్ వ్యాయామాలు

### వ్యాయామం 1: ఇన్క్రిమెంటల్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో (20 నిమిషాలు)
**లక్ష్యం**: పూర్తి మరియు ఇన్క్రిమెంటల్ డిప్లాయ్‌మెంట్స్ మధ్య తేడాను నైపుణ్యం పొందండి

```bash
# ప్రారంభ అమలు
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ప్రారంభ అమలైన సమయాన్ని నమోదు చేయండి
echo "Full deployment: $(date)" > deployment-log.txt

# కోడ్‌లో మార్పు చేయండి
echo "// Updated $(date)" >> src/api/src/server.js

# కేవలం కోడ్‌ను అమలుచేయండి (వేగంగా)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# సమయాలను సరిపోల్చండి
cat deployment-log.txt

# శుభ్రపరచండి
azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] పూర్తి డిప్లాయ్‌మెంట్ 5-15 నిమిషాలు పడుతుంది
- [ ] కోడ్-ఓన్లీ డిప్లాయ్‌మెంట్ 2-5 నిమిషాలు పడుతుంది
- [ ] కోడ్ మార్పులు డిప్లాయ్డ్ అప్లో ప్రతిబింబించాలి
- [ ] `azd deploy` తర్వాత ఇన్ఫ్రాస్ట్రక్చర్ మారకుండాుండాలి

**అధ్యయన ఫలితం**: కోడ్ మార్పుల కోసం `azd deploy` అంటే `azd up` కన్నా 50-70% వేగవంతంగా ఉంటుంది

### వ్యాయామం 2: కస్టమ్ డిప్లాయ్‌మెంట్ హూక్స్ (30 నిమిషాలు)
**లక్ష్యం**: ప్రీ మరియు పోస్ట్-డిప్లాయ్‌మెంట్ ఆటోమేషన్ అమలు చేయండి

```bash
# ప్రీ-డిప్లాయ్ ధృవీకరణ స్క్రిప్ట్ సృష్టించండి
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# టెస్టులు పాస్ అయ్యాయో లేదో తనిఖీ చేయండి
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# కమిట్ చేయని మార్పుల కోసం తనిఖీ చేయండి
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# పోస్ట్-డిప్లాయ్ స్మోక్ టెస్ట్ సృష్టించండి
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

# azure.yamlకు హుక్స్ జోడించండి
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
- [ ] ప్రీ-డిప్లాయ్ స్క్రిప్ట్ డిప్లాయ్‌మెంట్‌కు ముందు నడవాలి
- [ ] టెస్టులు ఫేల్ అయితే డిప్లాయ్‌మెంట్ నిలిపివేయబడాలి
- [ ] పోస్ట్-డిప్లాయ్ స్మోక్ టెస్ట్ ఆరోగ్యాన్ని ధృవీకరించాలి
- [ ] హూక్స్ సరైన క్రమంలో అమలవుతాయి

### వ్యాయామం 3: బహుళ-ఎన్విరాన్‌మెంట్ డిప్లాయ్‌మెంట్ వ్యూహం (45 నిమిషాలు)
**లక్ష్యం**: స్టేజ్డ్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో అమలు చేయండి (dev → staging → production)

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

# దశ 3: ప్రొడక్షన్ కోసం మాన్యువల్ ఆమోదం
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

# పర్యావరణాలు సృష్టించండి
azd env new dev
azd env new staging
azd env new production

# స్టేజ్ చేసిన డిప్లాయ్‌మెంట్ నడపండి
./deploy-staged.sh
```

**విజయ ప్రమాణాలు:**
- [ ] Dev ఎన్విరాన్‌మెంట్ సక్సెస్‌గా డిప్లాయ్ అయింది
- [ ] Staging ఎన్విరాన్‌మెంట్ సక్సెస్‌గా డిప్లాయ్ అయింది
- [ ] ప్రొడక్షన్ కోసం మానువల్ అనుమతి అవసరం
- [ ] అన్ని ఎన్విరాన్‌మెంట్‌లకు పని చేసే హెల్త్ చెక్స్ ఉన్నాయి
- [ ] అవసరమైతే రోల్‌బ్యాక్ చేయగలం

### వ్యాయామం 4: రోల్‌బ్యాక్ వ్యూహం (25 నిమిషాలు)
**లక్ష్యం**: Git ఉపయోగించి డిప్లాయ్‌మెంట్ రోల్‌బ్యాక్‌ను అమలు చేసి పరీక్షించండి

```bash
# v1ను డిప్లాయ్ చేయండి
azd env set APP_VERSION "1.0.0"
azd up

# v1 కమిట్ హాష్‌ను సేవ్ చేయండి
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# బ్రేకింగ్ మార్పుతో v2ని డిప్లాయ్ చేయండి
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# విఫలతను గుర్తించి రోల్బ్యాక్ చేయండి
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ఉపయోగించి రోల్బ్యాక్ చేయండి
    git revert HEAD --no-edit
    
    # పరిసరాన్ని రోల్బ్యాక్ చేయండి
    azd env set APP_VERSION "1.0.0"
    
    # v1ను మళ్లీ డిప్లాయ్ చేయండి
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**విజయ ప్రమాణాలు:**
- [ ] డిప్లాయ్‌మెంట్ విఫలతలను గుర్తించగలగాలి
- [ ] రోల్‌బ్యాక్ స్క్రిప్ట్ ఆటోమాటిక్‌గా అమలవుతుంది
- [ ] అప్లికేషన్ పనిచేసే స్థితికి తిరిగి వస్తుంది
- [ ] రోల్‌బ్యాక్ తరువాత హెల్త్ చెक्स పాస్ అవుతాయి

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

# ఫైల్‌కు లాగ్ చేయండి
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# దీనిని ఉపయోగించండి
./track-deployment.sh
```

**మీ మెట్రిక్స్‌ను విశ్లేషించండి:**
```bash
# డిప్లాయ్‌మెంట్ చరిత్రను వీక్షించండి
cat deployment-metrics.csv

# సగటు డిప్లాయ్‌మెంట్ సమయాన్ని లెక్కించండి
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## అదనపు వనరులు

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **తదుపరి పాఠం**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
డిస్క్లైమర్:
ఈ పత్రాన్ని AI అనువాద సేవ Co-op Translator (https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమించినప్పటికీ, స్వయంచాలక అనువాదాల్లో తప్పులు లేదా అసంపూర్ణతలు ఉండవచ్చని దయచేసి గమనించండి. మూల భాషలోని ఒరిజినల్ పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలక సమాచారానికి ప్రొఫెషనల్ మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదం ఉపయోగం ద్వారా ఏర్పడే ఏవైనా అపవగాహనలు లేదా తప్పుగా అర్థం చేసుకోవడాలకై మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->