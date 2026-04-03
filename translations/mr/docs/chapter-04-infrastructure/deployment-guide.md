# तैनाती मार्गदर्शक - AZD तैनातींमध्ये प्रभुत्व मिळवा

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 चालू अध्याय**: अध्याय 4 - Infrastructure as Code आणि तैनाती
- **⬅️ मागील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ पुढे**: [संसाधने प्रोविजन करणे](provisioning.md)
- **🚀 पुढील अध्याय**: [अध्याय 5: बहु-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI वापरून अनुप्रयोग तैनात करण्याबाबत सर्वकाही समजावून सांगतो, सोप्या एक-कमान आदेशांपासून ते कस्टम हुक्स, अनेक वातावरण आणि CI/CD एकत्रीकरणासह प्रगत उत्पादन परिस्थितींपर्यंत. व्यावहारिक उदाहरणे आणि सर्वोत्तम पद्धतींसह संपूर्ण तैनाती lifecycle मध्ये पारंगत व्हा.

## शिकण्याचे उद्दिष्टे

या मार्गदर्शिकेचे पूर्णकरण करून तुम्ही:
- Azure Developer CLI ची सर्व तैनाती कमांड्स आणि वर्कफ्लोज mastery कराल
- प्रोव्हिजनिंग पासून मॉनिटरिंगपर्यंत संपूर्ण तैनाती lifecycle समजून घ्याल
- प्री आणि पोस्ट-डिप्लॉयमेंट ऑटोमेशनसाठी कस्टम डिप्लॉयमेंट हुक्स लागू कराल
- वातावरण-विशिष्ट पॅरामीटर्ससह अनेक वातावरण कॉन्फिगर कराल
- ब्लू-ग्रीन आणि कॅनरी सारख्या प्रगत तैनाती धोरणांची रचना कराल
- azd तैनाती CI/CD पाइपलाइन्स आणि DevOps वर्कफ्लोसह एकत्र कराल

## शिकण्याचे परिणाम

पूर्ण केल्यावर, तुम्ही सक्षम असाल:
- सर्व azd तैनाती वर्कफ्लो स्वतंत्रपणे चालवणे आणि ट्रबलशूट करणे
- हुक्स वापरून कस्टम डिप्लॉयमेंट ऑटोमेशन डिझाइन आणि अंमलात आणणे
- योग्य सुरक्षा आणि मॉनिटरिंगसह प्रॉडक्शन-रेडी तैनाती कॉन्फिगर करणे
- जटिल मल्टी-एन्व्हायर्नमेंट तैनाती परिस्थिती व्यवस्थापित करणे
- तैनाती कार्यक्षमता ऑप्टिमाइझ करणे आणि रोलबॅक धोरणे अंमलात आणणे
- एंटरप्राइझ DevOps पद्धतींमध्ये azd तैनाती एकत्र करणे

## तैनाती अवलोकन

Azure Developer CLI काही तैनाती आदेश प्रदान करते:
- `azd up` - संपूर्ण वर्कफ्लो (प्रोव्हिजन + तैनाती)
- `azd provision` - फक्त Azure संसाधने तयार/अपडेट करा
- `azd deploy` - फक्त अनुप्रयोग कोड तैनात करा
- `azd package` - अनुप्रयोग बांधा आणि पॅकेज करा

## मूलभूत तैनाती वर्कफ्लोज

### पूर्ण तैनाती (azd up)
नवीन प्रोजेक्टसाठी सर्वात सामान्य वर्कफ्लो:
```bash
# शून्यापासून सर्वकाही तैनात करा
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

# विशिष्ट सेवा प्रदान करा
azd provision --service database
```

### फक्त कोड तैनाती
त्वरित अनुप्रयोग अद्यतनांसाठी:
```bash
# सर्व सेवा तैनात करा
azd deploy

# अपेक्षित आउटपुट:
# सेवा तैनात करत आहे (azd deploy)
# - web: तैनात करत आहे... पूर्ण
# - api: तैनात करत आहे... पूर्ण
# यश: आपली तैनाती 2 मिनिटे 15 सेकंदात पूर्ण झाली

# विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सानुकूल बिल्ड आर्ग्युमेंट्ससह तैनात करा
azd deploy --service api --build-arg NODE_ENV=production

# तैनाती सत्यापित करा
azd show --output json | jq '.services'
```

### ✅ तैनाती पडताळणी

कोणत्याही तैनाती नंतर, यशाची पडताळणी करा:

```bash
# सर्व सेवा चालू आहेत का तपासा
azd show

# हेल्थ एंडपॉइंट्सची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटींसाठी निरीक्षण करा (डिफॉल्टनुसार ब्राउझरमध्ये उघडते)
azd monitor --logs
```

**यश निकष:**
- ✅ सर्व सेवांमध्ये "Running" स्थिती दर्शविली पाहिजे
- ✅ हेल्थ एंडपॉइंट्स HTTP 200 परत करतात
- ✅ मागील 5 मिनिटांत त्रुटी लॉग्स नाहीत
- ✅ अनुप्रयोग चाचणी विनंत्यांना प्रतिसाद देतो

## 🏗️ तैनाती प्रक्रियेचे समज

### फेज 1: पूर्व-प्रोव्हिजन हुक्स
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

### फेज 2: इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग
- इन्फ्रास्ट्रक्चर टेम्पलेट्स वाचतो (Bicep/Terraform)
- Azure संसाधने तयार किंवा अद्यतन करतो
- नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
- मॉनिटरिंग आणि लॉगिंग सेट करतो

### फेज 3: पोस्ट-प्रोव्हिजन हुक्स
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

### फेज 4: अनुप्रयोग पॅकेजिंग
- अनुप्रयोग कोड बिल्ड करतो
- तैनाती आर्टिफॅक्ट तयार करतो
- लक्ष्य प्लॅटफॉर्मसाठी पॅकेज करतो (कंटेनर्स, ZIP फाइल्स इ.)

### फेज 5: प्री-डिप्लॉय हुक्स
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

### फेज 6: अनुप्रयोग तैनाती
- पॅकेज केलेले अनुप्रयोग Azure सेवांमध्ये तैनात करतो
- कॉन्फिगरेशन सेटिंग्ज अपडेट करतो
- सेवांना सुरू/रीस्टार्ट करतो

### फेज 7: पोस्ट-डिप्लॉय हुक्स
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

## 🔧 प्रगत तैनाती परिस्थिती

### मल्टी-सेवा अनुप्रयोग
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
# ब्लू पर्यावरण तयार करा
azd env new production-blue
azd up --environment production-blue

# ब्लू पर्यावरणाची चाचणी करा
./scripts/test-environment.sh production-blue

# ट्रॅफिक ब्लूकडे वळवा (मॅन्युअल DNS/लोड बॅलन्सर अद्यतन)
./scripts/switch-traffic.sh production-blue

# ग्रीन पर्यावरण साफ करा
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

### स्टेजड तैनाती
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

## 🐳 कंटेनर तैनात्या

### कंटेनर App तैनाती
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

## ⚡ कार्यक्षमता ऑप्टिमायझेशन

### सेवा-विशिष्ट तैनाती
```bash
# वेगवान पुनरावृत्तीसाठी विशिष्ट सेवा तैनात करा
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
# केवळ कोड बदलांसाठी azd deploy वापरा (azd up नाही)
# हे इन्फ्रास्ट्रक्चरची प्रोव्हिजनिंग वगळते आणि खूप जलद आहे
azd deploy

# सर्वात जलद पुनरावृत्तीसाठी विशिष्ट सेवा तैनात करा
azd deploy --service api
```

## 🔍 तैनाती मॉनिटरिंग

### वास्तविक-वेळ तैनाती मॉनिटरिंग
```bash
# अनुप्रयोगाची वास्तविक वेळेत देखरेख करा
azd monitor --live

# अनुप्रयोगाच्या नोंदी पहा
azd monitor --logs

# तैनातीची स्थिती तपासा
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

### पोस्ट-डिप्लॉयमेंट व्हॅलिडेशन
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# अनुप्रयोगाचे आरोग्य तपासा
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

## 🔐 सुरक्षा बाबी

### सीक्रेट्स व्यवस्थापन
```bash
# गुप्त माहिती सुरक्षितपणे साठवा
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मध्ये गुप्तांचा संदर्भ द्या
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

### त्वरित रोलबॅक
```bash
# AZD मध्ये अंगभूत रोलबॅक नाही. शिफारस केलेल्या पद्धती:

# Option 1: Git मधून पुन्हा तैनात करा (शिफारस केलेले)
git revert HEAD  # समस्याग्रस्त कमिट रिव्हर्ट करा
git push
azd deploy

# Option 2: विशिष्ट कमिट पुन्हा तैनात करा
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलबॅक
```bash
# लागू करण्यापूर्वी पायाभूत सुविधांमधील बदल पूर्वावलोकन करा
azd provision --preview

# पायाभूत सुविधांचा रोलबॅक करण्यासाठी आवृत्ती नियंत्रण वापरा:
git revert HEAD  # पायाभूत सुविधांमधील बदल पूर्ववत करा
azd provision    # पायाभूत सुविधांची मागील स्थिती लागू करा
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

## 📊 तैनाती मेट्रिक्स

### तैनाती कार्यक्षमता ट्रॅक करा
```bash
# सध्याच्या तैनातीची स्थिती पहा
azd show

# Application Insights वापरून अनुप्रयोगाचे निरीक्षण करा
azd monitor --overview

# थेट मेट्रिक्स पहा
azd monitor --live
```

### कस्टम मेट्रिक्स संकलन
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

### 1. वातावरण एकसारखेपणा
```bash
# सुसंगत नावकरण वापरा
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरणांमधील समता राखा
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर व्हॅलिडेशन
```bash
# परिनियोजनापूर्वी पायाभूत संरचनेतील बदलांचे पूर्वावलोकन करा
azd provision --preview

# ARM/Bicep लिंटिंग वापरा
az bicep lint --file infra/main.bicep

# Bicep सिंटॅक्सची वैधता तपासा
az bicep build --file infra/main.bicep
```

### 3. चाचणी एकत्रीकरण
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
# परिनियोजन प्रक्रियांचे दस्तऐवजीकरण करा
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## पुढील पावले

- [संसाधने प्रोविजन करणे](provisioning.md) - इन्फ्रास्ट्रक्चर व्यवस्थापनात खोलवर
- [प्री-डिप्लॉयमेंट नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - तुमची तैनाती धोरण आखा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - तैनाती समस्या निराकरण करा
- [सर्वोत्तम पद्धती](../chapter-07-troubleshooting/debugging.md) - प्रॉडक्शन-रेडी तैनाती धोरणे

## 🎯 प्रॅक्टिकल तैनाती व्यायाम

### व्यायाम 1: क्रमिक तैनाती वर्कफ्लो (20 मिनिटे)
**उद्दिष्ट**: पूर्ण आणि क्रमिक तैनाती यातील फरकात पारंगत व्हा

```bash
# प्रारंभिक तैनाती
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारंभिक तैनातीचा वेळ नोंदवा
echo "Full deployment: $(date)" > deployment-log.txt

# कोडमध्ये बदल करा
echo "// Updated $(date)" >> src/api/src/server.js

# फक्त कोड तैनात करा (जलद)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# वेळांची तुलना करा
cat deployment-log.txt

# साफसफाई करा
azd down --force --purge
```

**यश निकष:**
- [ ] पूर्ण तैनाती 5-15 मिनिटांत होते
- [ ] फक्त कोड तैनाती 2-5 मिनिटांत होते
- [ ] कोड बदल तैनात अनुप्रयोगात प्रतिबिंबित झाले आहेत
- [ ] `azd deploy` नंतर इन्फ्रास्ट्रक्चर अपरिवर्तीत राहतो

**शिकण्याचा परिणाम**: `azd deploy` कोड बदलांसाठी `azd up` पेक्षा 50-70% वेगवान आहे

### व्यायाम 2: कस्टम डिप्लॉयमेंट हुक्स (30 मिनिटे)
**उद्दिष्ट**: पूर्व आणि पोस्ट-डिप्लॉयमेंट ऑटोमेशन लागू करा

```bash
# पूर्व-तैनातीची पडताळणी स्क्रिप्ट तयार करा
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# चाचण्या यशस्वी झाल्या का ते तपासा
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# कमिट न केलेले बदल तपासा
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# तैनाती नंतरची स्मोक टेस्ट तयार करा
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

# हुक्ससह तैनातीची चाचणी करा
azd deploy
```

**यश निकष:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट तैनातीपूर्वी चालते
- [ ] चाचण्या अयशस्वी झाल्यास तैनाती रद्द होते
- [ ] पोस्ट-डिप्लॉय स्मोक टेस्ट हेल्थ व्हॅलिडेट करते
- [ ] हुक्स योग्य क्रमाने कार्यान्वित होतात

### व्यायाम 3: मल्टी-एन्व्हायर्नमेंट तैनाती धोरण (45 मिनिटे)
**उद्दिष्ट**: स्टेज्ड तैनाती वर्कफ्लो (dev → staging → production) अंमलात आणा

```bash
# डिप्लॉयमेंट स्क्रिप्ट तयार करा
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# पाऊल 1: dev (विकास) मध्ये तैनात करा
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पाऊल 2: staging (स्टेजिंग) मध्ये तैनात करा
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पाऊल 3: उत्पादनासाठी मॅन्युअल मंजुरी
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

# एन्व्हायर्नमेंट तयार करा
azd env new dev
azd env new staging
azd env new production

# स्टेज केलेले डिप्लॉयमेंट चालवा
./deploy-staged.sh
```

**यश निकष:**
- [ ] Dev वातावरणात तैनाती यशस्वी झाली
- [ ] Staging वातावरणात तैनाती यशस्वी झाली
- [ ] प्रॉडक्शनसाठी मॅन्युअल मंजुरी आवश्यक आहे
- [ ] सर्व वातावरणांमध्ये कार्यरत हेल्थ चेक्स आहेत
- [ ] आवश्यक असल्यास रोलबॅक करता येतो

### व्यायाम 4: रोलबॅक धोरण (25 मिनिटे)
**उद्दिष्ट**: Git वापरून तैनाती रोलबॅक लागू करा आणि चाचणी करा

```bash
# v1 परिनियोजित करा
azd env set APP_VERSION "1.0.0"
azd up

# v1 चा कमिट हॅश जतन करा
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ब्रेकिंग बदलासह v2 परिनियोजित करा
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
    
    # v1 पुन्हा परिनियोजित करा
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**यश निकष:**
- [ ] तैनाती अपयश शोधू शकतो
- [ ] रोलबॅक स्क्रिप्ट आपोआप चालते
- [ ] अनुप्रयोग पुन्हा कामकाजी स्थितीत परततो
- [ ] रोलबॅक नंतर हेल्थ चेक्स पास होतात

## 📊 तैनाती मेट्रिक्स ट्रॅकिंग

### तुमच्या तैनातीचे कार्यप्रदर्शन ट्रॅक करा

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# फाईलमध्ये लॉग करा
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# हे वापरा
./track-deployment.sh
```

**तुमची मेट्रिक्स विश्लेषित करा:**
```bash
# डिप्लॉयमेंटचा इतिहास पहा
cat deployment-metrics.csv

# सरासरी डिप्लॉयमेंट वेळ गणना करा
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त साधने

- [Azure Developer CLI तैनाती संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service तैनाती](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps तैनाती](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions तैनाती](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेव्हिगेशन**
- **मागील धडा**: [तुमचा पहिला प्रकल्प](../chapter-01-foundation/first-project.md)
- **पुढील धडा**: [संसाधने प्रोविजन करणे](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हे दस्तऐवज एआय अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) च्या साहाय्याने अनुवादित केलेले आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा चुकीची माहिती असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजा किंवा चुकीच्या अर्थलागांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->