# तैनाती मार्गदर्शक - AZD तैनातींचे प्रभुत्व मिळवा

**अध्याय नेव्हिगेशन:**
- **📚 अभ्यासक्रम गृहपृष्ठ**: [सुरुवातीसाठी AZD](../../README.md)
- **📖 चालू अध्याय**: अध्याय ४ - कोड म्हणून पायाभूत सुविधा आणि तैनात करणे
- **⬅️ मागील अध्याय**: [अध्याय ३: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ पुढील**: [संसाधने provisioning](provisioning.md)
- **🚀 पुढील अध्याय**: [अध्याय ५: मल्टि-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI वापरून अनुप्रयोग तैनातीबाबत आपणास सर्व माहिती पुरवतो, बेसिक सिंगल-कमांड तैनातींपासून ते कस्टम हुक्स, अनेक वातावरणे, आणि CI/CD एकात्मिकरणासह प्रगत उत्पादन परिस्थितींपर्यंत. व्यावहारिक उदाहरणे आणि सर्वोत्तम पद्धतींसह संपूर्ण तैनात जीवनचक्रावर प्रभुत्व मिळवा.

## शिक्षण उद्दिष्टे

हा मार्गदर्शक पूर्ण केल्यावर, आपण:
- Azure Developer CLI च्या सर्व तैनात कमांड्स आणि वर्कफ्लोवर प्रभुत्व
- पूर्ती आणि मॉनिटरिंग पर्यंत संपूर्ण तैनात जीवनचक्र समजून घेणे
- तैनात करण्याच्या आधी आणि नंतर स्वयंचलिततेसाठी कस्टम हुक्स अमलात आणणे
- वातावरण-विशिष्ट पॅरामीटर्ससह अनेक वातावरण कॉन्फिगर करणे
- ब्लू-ग्रीन आणि कॅनरी तैनातीसहित प्रगत तैनात धोरणे सेट करणे
- azd तैनातीला CI/CD पाईपलाइन्स आणि DevOps वर्कफ्लोमध्ये समाकलित करणे

## शिक्षण परिणाम

पूर्ण केल्यावर, आपण करू शकाल:
- सर्व azd तैनात वर्कफ्लो स्वतंत्रपणे चालन आणि समस्या सोडवणे
- हुक्स वापरून कस्टम तैनात स्वयंचलितता डिझाइन आणि अंमलात आणणे
- योग्य सुरक्षा आणि मॉनिटरिंगसह उत्पादन-तयार तैनाती कॉन्फिगर करणे
- गुंतागुंतीच्या मल्टि-एंवायरनमेंट तैनाती परिस्थितीचे नियमन
- तैनाती कार्यक्षमतेत सुधारणा करणे आणि रोलबॅक धोरणे अंमलात आणणे
- azd तैनातीचे एंटरप्राईज DevOps पद्धतींमध्ये समाकलन

## तैनात सारांश

Azure Developer CLI खालील काही तैनात कमांड्स देते:
- `azd up` - संपूर्ण वर्कफ्लो (प्रोव्हिजन + तैनात)
- `azd provision` - Azure संसाधने तयार / अद्ययावत करणे
- `azd deploy` - फक्त अनुप्रयोग कोड तैनात करणे
- `azd package` - अनुप्रयोग बिल्ड व पॅकेज करणे

## मूलभूत तैनात वर्कफ्लोज

### संपूर्ण तैनात (azd up)
नवीन प्रकल्पांसाठी सर्वसामान्य वर्कफ्लो:
```bash
# पूर्णपणे नवीन पासून तैनात करा
azd up

# विशिष्ट वातावरणासह तैनात करा
azd up --environment production

# सानुकूल पॅरामीटर्ससह तैनात करा
azd up --parameter location=westus2 --parameter sku=P1v2
```

### फक्त पायाभूत सुविधा तैनात करणे
जेव्हा तुम्हाला फक्त Azure संसाधने अद्ययावत करायची असतील तेव्हा:
```bash
# इन्फ्रास्ट्रक्चरची तरतूद/अद्यतन करा
azd provision

# बदलांचे पूर्वदृश्य घेण्यासाठी ड्राय-रनसह तरतूद करा
azd provision --preview

# विशिष्ट सेवा पुरवा
azd provision --service database
```

### फक्त कोड तैनात करणे
त्वरित अनुप्रयोग अपडेटसाठी:
```bash
# सर्व सेवा तैनात करा
azd deploy

# अपेक्षित आउटपुट:
# सेवा तैनात करत आहे (azd deploy)
# - वेब: तैनात करत आहे... पूर्ण
# - API: तैनात करत आहे... पूर्ण
# यशस्वी: तुमचे तैनाती २ मिनिटे १५ सेकंदांत पूर्ण झाली

# विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सानुकूल बिल्ड आर्ग्युमेंटसह तैनात करा
azd deploy --service api --build-arg NODE_ENV=production

# तैनातीची पडताळणी करा
azd show --output json | jq '.services'
```

### ✅ तैनात तपासणी

कोणत्याही तैनातीनंतर, यशस्वीपणा तपासा:

```bash
# सर्व सेवा चालू आहेत की नाही ते तपासा
azd show

# हेल्थ एंडपॉइंट्सची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटींसाठी निरीक्षण करा (मूलतः ब्राउझरमध्ये उघडते)
azd monitor --logs
```

**यशस्वी निकष:**
- ✅ सर्व सेवा "रनिंग" स्थितीत असाव्यात
- ✅ हेल्थ एंडपॉइंट्स HTTP 200 परत देतात
- ✅ मागील ५ मिनिटांत चूक लॉग नाहीत
- ✅ अनुप्रयोग चाचणी विनंत्यांना प्रतिसाद देतो

## 🏗️ तैनात प्रक्रियेचे आकलन

### टप्पा १: प्री-प्रोव्हिजन हुक्स
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

### टप्पा २: पायाभूत सुविधा प्रोव्हिजनिंग
- पायाभूत सुविधा टेम्प्लेट्स (Bicep/Terraform) वाचतो
- Azure संसाधने तयार / अद्ययावत करतो
- नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
- मॉनिटरिंग आणि लॉगिंग सेटअप करतो

### टप्पा ३: पोस्ट-प्रोव्हिजन हुक्स
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

### टप्पा ४: अनुप्रयोग पॅकेजिंग
- अनुप्रयोग कोड बिल्ड करतो
- तैनाती वस्तू तयार करतो
- लक्ष्य प्लॅटफॉर्मसाठी पॅकेज करतो (कंटेनर, ZIP फाइल्स वगैरे)

### टप्पा ५: प्री-डिप्लॉय हुक्स
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

### टप्पा ६: अनुप्रयोग तैनात करणे
- Azure सेवांवर पॅकेज केलेले अनुप्रयोग तैनात करतो
- कॉन्फिगरेशन सेटिंग्ज अपडेट करतो
- सेवा सुरू/पुन्हा सुरू करतो

### टप्पा ७: पोस्ट-डिप्लॉय हुक्स
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

## 🎛️ तैनात कॉन्फिगरेशन

### सेवा-विशिष्ट तैनात सेटिंग्ज
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

### वातावरण-विशिष्ट कॉन्फिगरेशन
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

## 🔧 प्रगत तैनात परिस्थिती

### मल्टि-सेवा अनुप्रयोग
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

# निळ्या वातावरणाची चाचणी करा
./scripts/test-environment.sh production-blue

# ट्रॅफिक निळ्याकडे बदला (मॅन्युअल DNS/लोड बॅलन्सर अद्यतन)
./scripts/switch-traffic.sh production-blue

# हिरव्या वातावरणाची स्वच्छता करा
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

### टप्प्याटप्प्याने तैनात करणे
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

### कंटेनर अ‍ॅप तैनाती
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

### मल्टि-स्टेज Dockerfile ऑप्टिमायझेशन
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

## ⚡ कार्यक्षमता ऑप्टिमायझेशन

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
# केवळ कोडसाठी बदलांसाठी azd deploy वापरा (azd up नाही)
# हे इन्फ्रास्ट्रक्चरसाठी provisioning वगळते आणि खूप जलद आहे
azd deploy

# सर्वात जलद पुनरावृत्तींसाठी विशिष्ट सेवा डिप्लॉय करा
azd deploy --service api
```

## 🔍 तैनात मॉनिटरिंग

### रिअल-टाइम तैनात मॉनिटरिंग
```bash
# अनुप्रयोगाचे वास्तविक वेळेत निरीक्षण करा
azd monitor --live

# अनुप्रयोग लॉग पाहा
azd monitor --logs

# वितरण स्थिती तपासा
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

### पोस्ट-तैनात सत्यापन
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# अनुप्रयोगाची आरोग्य तपासा
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

## 🔐 सुरक्षा बाबतीत विचार

### सिक्रेट्स व्यवस्थापन
```bash
# रहस्य सुरक्षितपणे साठवा
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मध्ये रहस्यांचा संदर्भ द्या
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

### ओळख व प्रवेश व्यवस्थापन
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

### जलद रोलबॅक
```bash
# AZD मध्ये अंगभूत रोलबॅक नाही. शिफारस केलेले दृष्टिकोन:

# पर्याय 1: Git पासून पुनर्स्थापित करा (शिफारस केलेले)
git revert HEAD  # समस्या असलेला कमिट परत करा
git push
azd deploy

# पर्याय 2: विशिष्ट कमिट पुनर्स्थापित करा
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### पायाभूत सुविधा रोलबॅक
```bash
# लागू करण्यापूर्वी इन्फ्रास्ट्रक्चरसाठी बदलाचा पूर्वावलोकन करा
azd provision --preview

# इन्फ्रास्ट्रक्चर परतफेडीसाठी, आवृत्ती नियंत्रण वापरा:
git revert HEAD  # इन्फ्रास्ट्रक्चरचे बदल रद्द करा
azd provision    # मागील इन्फ्रास्ट्रक्चर स्थिती लागू करा
```

### डेटाबेस माईग्रेशन रोलबॅक
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 तैनात मेट्रिक्स

### तैनात कार्यक्षमता ट्रॅक करा
```bash
# सध्याची वितरण स्थिती पहा
azd show

# Application Insights सह अनुप्रयोगाचे निरीक्षण करा
azd monitor --overview

# थेट मेट्रिक्स पहा
azd monitor --live
```

### कस्टम मेट्रिक्स संग्रहण
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

### १. वातावरण सातत्य
```bash
# सुसंगत नावकरण वापरा
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरण समानता राखा
./scripts/sync-environments.sh
```

### २. पायाभूत सुविधा सत्यापन
```bash
# वितरणापूर्वी पायाभूत सुविधांतील बदलांचे पूर्वावलोकन करा
azd provision --preview

# ARM/Bicep लिंटिंग वापरा
az bicep lint --file infra/main.bicep

# Bicep सिंटॅक्सची पडताळणी करा
az bicep build --file infra/main.bicep
```

### ३. चाचणी एकात्मिकरण
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

### ४. दस्तऐवजीकरण आणि लॉगिंग
```bash
# दस्तऐवज तैनाती प्रक्रियेची
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## पुढचे पावले

- [संसाधने provisioning](provisioning.md) - पायाभूत सुविधा व्यवस्थापनातील सखोल माहिती
- [प्री-तैनाती नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - तुमची तैनात धोरणे तयार करा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - तैनात समस्या निराकरण करा
- [सर्वोत्तम पद्धती](../chapter-07-troubleshooting/debugging.md) - उत्पादन-तयार तैनात धोरणे

## 🎯 व्यावहारिक तैनाती सराव

### व्यायाम १: वृद्धीशील तैनात वर्कफ्लो (२० मिनिटे)
**उद्दिष्ट:** पूर्ण व वृद्धीशील तैनाती यात फरक समजून घेणे

```bash
# प्रारंभिक स्थापन
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारंभिक स्थापन वेळ नोंदवा
echo "Full deployment: $(date)" > deployment-log.txt

# कोडमध्ये बदल करा
echo "// Updated $(date)" >> src/api/src/server.js

# केवळ कोड तैनात करा (वेगवान)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# वेळांची तुलना करा
cat deployment-log.txt

# साफसफाई करा
azd down --force --purge
```

**यशस्वी निकष:**
- [ ] पूर्ण तैनात ५-१५ मिनिटांत होते
- [ ] फक्त कोड तैनात २-५ मिनिटांत होते
- [ ] कोड बदल चक्रबद्ध अनुप्रयोगात दिसून येतो
- [ ] `azd deploy` नंतर पायाभूत सुविधा अपरिवर्तित राहते

**शिकण्याचा परिणाम:** कोड बदलांसाठी `azd deploy` हा `azd up` पेक्षा ५०-७०% वेगवान आहे

### व्यायाम २: कस्टम तैनात हुक्स (३० मिनिटे)
**उद्दिष्ट:** प्री आणि पोस्ट-तैनात स्वयंचलितता अंमलात आणणे

```bash
# पूर्व-डिप्लॉय व्हॅलिडेशन स्क्रिप्ट तयार करा
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# तपासा की चाचण्या यशस्वी झाल्या आहेत का
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# कमिट न झालेल्या बदलांची तपासणी करा
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# पोस्ट-डिप्लॉय स्मोक टेस्ट तयार करा
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

# Azure.yaml मध्ये हुक्ज जोडा
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# हुक्जसह डिप्लॉयमेंटची चाचणी करा
azd deploy
```

**यशस्वी निकष:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट तैनातीनपूर्वी चालते
- [ ] चाचण्या अयशस्वी झाल्यास तैनात थांबवते
- [ ] पोस्ट-डिप्लॉय स्मोक चाचणी आरोग्याची खात्री करते
- [ ] हुक्स योग्य क्रमाने चालतात

### व्यायाम ३: मल्टि-एंवायरनमेंट तैनात धोरण (४५ मिनिटे)
**उद्दिष्ट:** टप्प्याटप्प्याने तैनात वर्कफ्लो (डेव्ह → स्टेजिंग → उत्पादन) अमलात आणणे

```bash
# नियोजन स्क्रिप्ट तयार करा
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# पाऊल १: डेव्ह पर्यंत तैनात करा
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पाऊल २: स्टेजिंग पर्यंत तैनात करा
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पाऊल ३: उत्पादनासाठी मॅन्युअल अनुमती
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

# पर्यावरण तयार करा
azd env new dev
azd env new staging
azd env new production

# स्टेज केलेले नियोजन चालवा
./deploy-staged.sh
```

**यशस्वी निकष:**
- [ ] डेव्ह वातावरण यशस्वीपणे तैनात
- [ ] स्टेजिंग वातावरण यशस्वीपणे तैनात
- [ ] उत्पादनासाठी मॅन्युअल स्वीकृती आवश्यक
- [ ] सर्व वातावरणांमध्ये हेल्थ चेक्स कार्यरत आहेत
- [ ] आवश्यक असल्यास रोलबॅक करता येतो

### व्यायाम ४: रोलबॅक धोरण (२५ मिनिटे)
**उद्दिष्ट:** Git वापरून तैनात रोलबॅक अंमलात आणणे व चाचणी करणे

```bash
# v1 तैनात करा
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट हॅश जतन करा
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ब्रेकिंग बदलासह v2 तैनात करा
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

**यशस्वी निकष:**
- [ ] तैनात अयशस्वीपणा शोधता येतो
- [ ] रोलबॅक स्क्रिप्ट आपोआप चालते
- [ ] अनुप्रयोग कार्यरत स्थितीत परत येतो
- [ ] रोलबॅक नंतर आरोग्य तपासण्या पास होतात

## 📊 तैनातीचा कार्यक्षमता ट्रॅकिंग

### तुमची तैनात कार्यक्षमता ट्रॅक करा

```bash
# वितरण मेट्रिक्स स्क्रिप्ट तयार करा
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

# फाईलमध्ये लॉग करा
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# याचा वापर करा
./track-deployment.sh
```

**तुमचे मेट्रिक्स विश्लेषित करा:**
```bash
# डिप्लॉयमेंट इतिहास पहा
cat deployment-metrics.csv

# सरासरी डिप्लॉयमेंट वेळ मोजा
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त संसाधने

- [Azure Developer CLI तैनात संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service तैनात करणे](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps तैनात](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions तैनात](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेव्हिगेशन**
- **मागील धडा**: [तुमचा पहिला प्रकल्प](../chapter-01-foundation/first-project.md)
- **पुढील धडा**: [संसाधने provisioning](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा गैरसमज होऊ शकतात याची कृपया नोंद घ्यावी. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतर करण्याची शिफारस केली जाते. या भाषांतराचा वापरामुळे उद्भवणाऱ्या कुठल्याही गैरसमजुती किंवा चुकीच्या अर्थामुळे आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->