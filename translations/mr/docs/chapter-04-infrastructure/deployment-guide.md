# तैनाती मार्गदर्शिका - AZD तैनातीत पारंगत होणे

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 4 - इन्फ्रास्ट्रक्चर अ‍ॅज कोड आणि तैनाती
- **⬅️ Previous Chapter**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [संसाधने तयार करणे](provisioning.md)
- **🚀 Next Chapter**: [अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)

## परिचय

This## Understanding the Deployment Processcomprehensive guide Azure Developer CLI वापरून अनुप्रयोग तैनात करण्याबद्दल तुम्हाला आवश्यक असलेली सर्व माहिती समाविष्ट करते, सिंगल-कमांड तैनातींपासून ते सानुकूल हुक्स, अनेक वातावरणे आणि CI/CD समाकलनांसह उन्नत उत्पादन परिस्थितींपर्यंत. व्यावहारिक उदाहरणे आणि सर्वोत्तम पद्धतींसह संपूर्ण तैनाती जीवनचक्रात पारंगत व्हा.

## शिकण्याची उद्दिष्टे

या मार्गदर्शिकेचा पूर्ण केल्यानंतर, तुम्ही:
- सर्व Azure Developer CLI तैनाती आदेश आणि वर्कफ्लोवर पारंगत व्हाल
- प्रोव्हिजनिंगपासून मॉनिटरिंगपर्यंत संपूर्ण तैनाती जीवनचक्र समजून घ्याल
- प्री आणि पोस्ट-तैनाती ऑटोमेशनसाठी सानुकूल तैनाती हुक्स अमलात आणाल
- वातावरण-विशिष्ट पॅरामीटर्ससह अनेक वातावरण कॉन्फिगर कराल
- ब्लू-ग्रीन आणि कॅनरी तैनातींसह उन्नत तैनाती रणनीती सेट अप कराल
- azd तैनाती CI/CD पाईपलाइन्स आणि DevOps वर्कफ़्लोजमध्ये समाकलित कराल

## शिकण्याचे परिणाम

पूर्ण केल्यानंतर, तुम्ही सक्षम असाल:
- स्वतंत्रपणे सर्व azd तैनाती वर्कफ्लो कार्यान्वित आणि त्रुटीमुक्त करणे
- हुक्स वापरून सानुकूल तैनाती ऑटोमेशन डिझाइन आणि अंमलात आणणे
- योग्य सुरक्षा आणि मॉनिटरिंगसह उत्पादन-तयार तैनाती कॉन्फिगर करणे
- क्लिष्ट बहु-पर्यावरण तैनाती परिस्थिती हाताळणे
- तैनाती कामगिरी ऑप्टिमाइझ करणे आणि रोलबॅक धोरणे अंमलात आणणे
- एंटरप्राइझ DevOps प्रॅक्टिसमध्ये azd तैनाती समाकलित करणे

## तैनातीचे आढावा

Azure Developer CLI अनेक तैनाती आदेश प्रदान करते:
- `azd up` - पूर्ण वर्कफ्लो (प्रोव्हिजन + तैनात)
- `azd provision` - फक्त Azure संसाधने तयार/अपडेट करा
- `azd deploy` - फक्त अनुप्रयोग कोड तैनात करा
- `azd package` - अनुप्रयोग बांधा आणि पॅकेज करा

## मुलभूत तैनाती वर्कफ्लो

### पूर्ण तैनाती (azd up)
The most common workflow for new projects:
```bash
# सर्वकाही शून्यापासून तैनात करा
azd up

# विशिष्ट वातावरणासह तैनात करा
azd up --environment production

# सानुकूल पॅरामीटर्ससह तैनात करा
azd up --parameter location=westus2 --parameter sku=P1v2
```

### फक्त इन्फ्रास्ट्रक्चर तैनाती
जेव्हा तुम्हाला फक्त Azure संसाधने अद्यतनित करायची असतील:
```bash
# इन्फ्रास्ट्रक्चरची तरतूद/अद्यतन करा
azd provision

# बदलांचे पूर्वावलोकन करण्यासाठी ड्राय-रनसह तरतूद करा
azd provision --preview

# विशिष्ट सेवा तरतूद करा
azd provision --service database
```

### फक्त कोड तैनाती
जलद अॅप्लिकेशन अद्यतनांसाठी:
```bash
# सर्व सेवा तैनात करा
azd deploy

# अपेक्षित आउटपुट:
# सेवा तैनात करत आहे (azd deploy)
# - web: तैनात करत आहे... पूर्ण
# - api: तैनात करत आहे... पूर्ण
# यशस्वी: तुमची तैनाती 2 मिनिटे 15 सेकंदात पूर्ण झाली

# विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# कस्टम बिल्ड आर्ग्युमेंटसह तैनात करा
azd deploy --service api --build-arg NODE_ENV=production

# तैनाती सत्यापित करा
azd show --output json | jq '.services'
```

### ✅ तैनाती पडताळणी

कोणत्याही तैनाती नंतर, यशाची पडताळणी करा:

```bash
# सर्व सेवा चालू आहेत का ते तपासा
azd show

# हेल्थ एंडपॉइंट्सची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटींसाठी देखरेख करा (डिफॉल्टनुसार ब्राउझरमध्ये उघडते)
azd monitor --logs
```

**यश निकष:**
- ✅ सर्व सेवांमध्ये "Running" स्थिती दर्शविली पाहिजे
- ✅ हेल्थ एंडपॉइंट्स HTTP 200 परत करतात
- ✅ मागील 5 मिनिटांत कोणतेही त्रुटी लॉग नसावेत
- ✅ अनुप्रयोग चाचणी विनंत्यांना प्रतिसाद देतो

## 🏗️ तैनाती प्रक्रियेचे आकलन

### टप्पा 1: प्री-प्रोव्हिजन हुक्स
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

### टप्पा 2: इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग
- इन्फ्रास्ट्रक्चर टेम्पलेट्स वाचते (Bicep/Terraform)
- Azure संसाधने तयार किंवा अद्यतनित करते
- नेटवर्किंग आणि सुरक्षा कॉन्फिगर करते
- मॉनिटरिंग आणि लॉगिंग सेट अप करते

### टप्पा 3: पोस्ट-प्रोव्हिजन हुक्स
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

### टप्पा 4: अनुप्रयोग पॅकेजिंग
- अनुप्रयोग कोड बिल्ड करते
- तैनाती आर्टिफॅक्ट तयार करते
- लक्ष्य प्लॅटफॉर्मसाठी पॅकेज करते (कंटेनर्स, ZIP फाइल्स, इ.)

### टप्पा 5: प्री-डिप्लॉय हुक्स
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

### टप्पा 6: अनुप्रयोग तैनाती
- पॅकेज केलेले अनुप्रयोग Azure सेवांवर तैनात करते
- कॉन्फिगरेशन सेटिंग्ज अद्यतनित करते
- सेवांना सुरू/रीस्टार्ट करते

### टप्पा 7: पोस्ट-डिप्लॉय हुक्स
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

## 🎛️ तैनाती कॉन्फिगरेशन

### सेवा-विशिष्ट तैनाती सेटिंग्ज
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

### पर्यावरण-विशिष्ट कॉन्फिगरेशन
```bash
# विकास वातावरण
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# स्टेजिंग वातावरण
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# उत्पादन वातावरण
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 उन्नत तैनाती परिदृश्य

### बहु-सेवा अनुप्रयोग
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

### ब्लू-ग्रीन तैनाती
```bash
# निळे वातावरण तयार करा
azd env new production-blue
azd up --environment production-blue

# निळे वातावरण तपासा
./scripts/test-environment.sh production-blue

# ट्रॅफिक निळ्या वातावरणावर स्विच करा (मॅन्युअल DNS/लोड बॅलन्सर अद्यतन)
./scripts/switch-traffic.sh production-blue

# हिरवे वातावरण साफ करा
azd env select production-green
azd down --force
```

### कॅनरी तैनाती
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

### स्टेज्ड तैनाती
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

## 🐳 कंटेनर तैनाती

### कंटेनर अॅप तैनाती
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

### मल्टी-स्टेज Dockerfile ऑप्टिमायझेशन
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

## ⚡ कामगिरी सुधारणा

### सेवा-विशिष्ट तैनाती
```bash
# जलद पुनरावृत्तीसाठी विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सर्व सेवा तैनात करा
azd deploy
```

### बिल्ड कॅशिंग
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### कार्यक्षम कोड तैनाती
```bash
# फक्त कोड बदलांसाठी azd deploy वापरा (azd up नाही)
# हे इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग वगळते आणि खूपच वेगवान आहे
azd deploy

# सर्वात जलद पुनरावृत्ती साठी विशिष्ट सेवा तैनात करा
azd deploy --service api
```

## 🔍 तैनाती मॉनिटरिंग

### रिअल-टाइम तैनाती मॉनिटरिंग
```bash
# अॅप्लिकेशनचे रिअल-टाइममध्ये निरीक्षण करा
azd monitor --live

# अॅप्लिकेशनचे लॉग पहा
azd monitor --logs

# डिप्लॉयमेंटची स्थिती तपासा
azd show
```

### हेल्थ चेक्स
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

### पोस्ट-डिप्लॉयमेंट पडताळणी
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# अॅप्लिकेशनचे आरोग्य तपासा
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

## 🔐 सुरक्षा विचार

### गुप्त व्यवस्थापन
```bash
# गुप्त माहिती सुरक्षितपणे जतन करा
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मध्ये गुप्त माहितीचा संदर्भ घ्या
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

### नेटवर्क सुरक्षा
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ओळख आणि प्रवेश व्यवस्थापन
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

## 🚨 रोलबॅक धोरणे

### वेगवान रोलबॅक
```bash
# AZD मध्ये अंगभूत रोलबॅक नाही. शिफारस केलेल्या पद्धती:

# पर्याय 1: Git मधून पुन्हा तैनात करा (शिफारस केलेले)
git revert HEAD  # समस्याग्रस्त कमिट मागे घ्या
git push
azd deploy

# पर्याय 2: विशिष्ट कमिट पुन्हा तैनात करा
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलबॅक
```bash
# लागू करण्यापूर्वी पायाभूत सुविधांमधील बदलाचे पूर्वावलोकन करा
azd provision --preview

# पायाभूत सुविधांच्या रोलबॅकसाठी आवृत्ती नियंत्रण वापरा:
git revert HEAD  # पायाभूत सुविधांमधील बदल मागे घ्या
azd provision    # मागील पायाभूत सुविधांची स्थिती लागू करा
```

### डेटाबेस माइग्रेशन रोलबॅक
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 तैनाती मेट्रिक्स

### तैनाती कामगिरी ट्रॅक करा
```bash
# सध्याच्या परिनियोजन स्थिती पहा
azd show

# Application Insights वापरून अनुप्रयोगाचे निरीक्षण करा
azd monitor --overview

# थेट मेट्रिक्स पहा
azd monitor --live
```

### कस्टम मेट्रिक्स संग्रह
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

## 🎯 सर्वोत्तम पद्धती

### 1. पर्यावरण स्थिरता
```bash
# सुसंगत नामकरण वापरा
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरणाची समानता राखा
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर प्रमाणन
```bash
# तैनातीपूर्वी इन्फ्रास्ट्रक्चरमधील बदलांचे पूर्वावलोकन करा
azd provision --preview

# ARM/Bicep लिंटिंग वापरा
az bicep lint --file infra/main.bicep

# Bicep वाक्यरचना सत्यापित करा
az bicep build --file infra/main.bicep
```

### 3. चाचणी समाकलन
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

### 4. दस्तऐवजीकरण आणि लॉगिंग
```bash
# तैनाती प्रक्रियांचे दस्तऐवजीकरण करा
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## पुढील पावले

- [संसाधने तयार करणे](provisioning.md) - इन्फ्रास्ट्रक्चर व्यवस्थापनात सखोल डुबकी
- [पूर्व-तैनाती योजना](../chapter-06-pre-deployment/capacity-planning.md) - तुमची तैनाती रणनीती नियोजित करा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - तैनाती समस्या सोडवा
- [सर्वोत्तम पद्धती](../chapter-07-troubleshooting/debugging.md) - उत्पादन-तयार तैनाती धोरणे

## 🎯 प्रायोगिक तैनाती व्यायाम

### व्यायाम 1: क्रमिक तैनाती वर्कफ्लो (20 मिनिटे)
**लक्ष्य**: पूर्ण आणि क्रमिक तैनातीमधील फरक आत्मसात करणे

```bash
# प्रारंभिक तैनाती
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारंभिक तैनातीची वेळ नोंदवा
echo "Full deployment: $(date)" > deployment-log.txt

# कोडमध्ये बदल करा
echo "// Updated $(date)" >> src/api/src/server.js

# फक्त कोड तैनात करा (जलद)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# वेळांची तुलना करा
cat deployment-log.txt

# साफ करा
azd down --force --purge
```

**यश निकष:**
- [ ] पूर्ण तैनाती 5-15 मिनिटांमध्ये होते
- [ ] फक्त कोड तैनाती 2-5 मिनिटांमध्ये होते
- [ ] कोड बदल तैनात अॅपमध्ये परावर्तित झाले आहेत
- [ ] `azd deploy` नंतर इन्फ्रास्ट्रक्चर अपरिवर्तित आहे

**शिकण्याचा परिणाम**: `azd deploy` कोड बदलांसाठी `azd up` पेक्षा 50-70% वेगवान आहे

### व्यायाम 2: सानुकूल तैनाती हुक्स (30 मिनिटे)
**लक्ष्य**: प्री आणि पोस्ट-तैनाती ऑटोमेशन अंमलात आणणे

```bash
# पूर्व-तैनाती सत्यापन स्क्रिप्ट तयार करा
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# चाचण्या यशस्वी झाल्या आहेत का ते तपासा
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# कमिट न झालेले बदल तपासा
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# तैनाती नंतर स्मोक टेस्ट तयार करा
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

# azure.yaml मध्ये हुक्स जोडा
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# हुक्ससह तैनाती तपासा
azd deploy
```

**यश निकष:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट तैनातीपूर्वी चालते
- [ ] चाचण्या अपयशी झाल्यास तैनाती रद्द होते
- [ ] पोस्ट-डिप्लॉय स्मोक टेस्ट हेल्थ पडताळते
- [ ] हुक्स योग्य क्रमाने चालतात

### व्यायाम 3: बहु-पर्यावरण तैनाती रणनीती (45 मिनिटे)
**लक्ष्य**: स्टेज्ड तैनाती वर्कफ्लो अंमलात आणणे (dev → staging → production)

```bash
# डिप्लॉयमेंट स्क्रिप्ट तयार करा
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# पायरी 1: डेव्हमध्ये तैनात करा
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पायरी 2: स्टेजिंगमध्ये तैनात करा
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पायरी 3: प्रॉडक्शनसाठी मॅन्युअल मंजुरी
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

# एन्व्हायर्नमेंट्स तयार करा
azd env new dev
azd env new staging
azd env new production

# स्टेज केलेले डिप्लॉयमेंट चालवा
./deploy-staged.sh
```

**यश निकष:**
- [ ] Dev वातावरण यशस्वीरित्या तैनात होते
- [ ] Staging वातावरण यशस्वीरित्या तैनात होते
- [ ] उत्पादनासाठी मानवी मंजुरी आवश्यक आहे
- [ ] सर्व वातावरणांमध्ये कार्यरत हेल्थ चेक्स आहेत
- [ ] आवश्यक असल्यास रोलबॅक करू शकतो

### व्यायाम 4: रोलबॅक रणनीती (25 मिनिटे)
**लक्ष्य**: Git वापरून तैनाती रोलबॅक अंमलात आणणे आणि चाचणी करणे

```bash
# v1 तैनात करा
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट हॅश जतन करा
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# सुसंगतता भंग करणारा बदल असलेला v2 तैनात करा
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# अपयश ओळखा आणि रोलबॅक करा
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git वापरून रोलबॅक करा
    git revert HEAD --no-edit
    
    # पर्यावरण रोलबॅक करा
    azd env set APP_VERSION "1.0.0"
    
    # v1 पुन्हा तैनात करा
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**यश निकष:**
- [ ] तैनाती अपयश ओळखू शकतो
- [ ] रोलबॅक स्क्रिप्ट स्वयंचलितपणे चालते
- [ ] अनुप्रयोग कार्यरत स्थितीत परत येतो
- [ ] रोलबॅक नंतर हेल्थ चेक्स पास होतात

## 📊 तैनाती मेट्रिक्स ट्रॅकिंग

### तुमची तैनाती कामगिरी ट्रॅक करा

```bash
# डिप्लॉयमेंट मेट्रिक्स स्क्रिप्ट तयार करा
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

# फाइलमध्ये नोंद करा
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# हे वापरा
./track-deployment.sh
```

**तुमच्या मेट्रिक्सचे विश्लेषण करा:**
```bash
# डिप्लॉयमेंटचा इतिहास पहा
cat deployment-metrics.csv

# सरासरी डिप्लॉयमेंट वेळेची गणना करा
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त संसाधने

- [Azure Developer CLI तैनाती संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service तैनाती](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps तैनाती](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions तैनाती](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेव्हिगेशन**
- **Previous Lesson**: [तुमचा पहिले प्रकल्प](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [संसाधने तयार करणे](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत समजावा. महत्त्वाची माहिती असल्यास व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजांबद्दल किंवा चुकीच्या अर्थलावाबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->