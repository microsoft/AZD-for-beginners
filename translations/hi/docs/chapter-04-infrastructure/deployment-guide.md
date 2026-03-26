# डिप्लॉयमेंट गाइड - AZD डिप्लॉयमेंट में महारत

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर ऐज़ कोड और डिप्लॉयमेंट
- **⬅️ पिछला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ अगला**: [संसाधनों का प्रावधान](provisioning.md)
- **🚀 अगला अध्याय**: [अध्याय 5: मल्टी-एजेंट AI समाधान](../../examples/retail-scenario.md)

## परिचय

यह व्यापक मार्गदर्शिका Azure Developer CLI का उपयोग करके एप्लिकेशन डिप्लॉय करने के बारे में आवश्यक सभी जानकारी को कवर करती है, बुनियादी एक-कमांड डिप्लॉयमेंट से लेकर कस्टम हूक्स, कई एनवायरनमेंट, और CI/CD एकीकरण वाले उन्नत प्रोडक्शन परिदृश्यों तक। व्यावहारिक उदाहरणों और सर्वोत्तम प्रथाओं के साथ संपूर्ण डिप्लॉयमेंट लाइफ़साइकल में महारत हासिल करें।

## सीखने के लक्ष्य

इस मार्गदर्शिका को पूरा करके, आप:
- Azure Developer CLI के सभी डिप्लॉयमेंट कमांड और वर्कफ़्लोज़ में महारत हासिल करेंगे
- प्रोविजनिंग से मॉनिटरिंग तक संपूर्ण डिप्लॉयमेंट लाइफ़साइकल को समझेंगे
- प्री और पोस्ट-डिप्लॉयमेंट ऑटोमेशन के लिए कस्टम डिप्लॉयमेंट हूक्स लागू करेंगे
- एनवायरनमेंट-विशिष्ट पैरामीटरों के साथ कई एनवायरनमेंट कॉन्फ़िगर करेंगे
- ब्लू-ग्रीन और कैनरी डिप्लॉयमेंट सहित उन्नत डिप्लॉयमेंट रणनीतियाँ सेटअप करेंगे
- azd डिप्लॉयमेंट्स को CI/CD पाइपलाइनों और DevOps वर्कफ़्लो के साथ एकीकृत करेंगे

## सीखने के परिणाम

पूरा करने के बाद, आप सक्षम होंगे:
- सभी azd डिप्लॉयमेंट वर्कफ़्लोज़ को स्वतंत्र रूप से निष्पादित और ट्रबलशूट करना
- हूक्स का उपयोग करके कस्टम डिप्लॉयमेंट ऑटोमेशन डिज़ाइन और लागू करना
- उचित सुरक्षा और मॉनिटरिंग के साथ प्रोडक्शन-रेडी डिप्लॉयमेंट कॉन्फ़िगर करना
- जटिल मल्टि-एनवायरनमेंट डिप्लॉयमेंट परिदृश्यों का प्रबंधन करना
- डिप्लॉयमेंट प्रदर्शन का अनुकूलन और रोलबैक रणनीतियाँ लागू करना
- azd डिप्लॉयमेंट्स को एंटरप्राइज़ DevOps प्रथाओं में एकीकृत करना

## डिप्लॉयमेंट अवलोकन

Azure Developer CLI कई डिप्लॉयमेंट कमांड प्रदान करता है:
- `azd up` - पूर्ण वर्कफ़्लो (प्रोविजन + डिप्लॉय)
- `azd provision` - केवल Azure संसाधनों को बनाएं/अपडेट करें
- `azd deploy` - केवल एप्लिकेशन कोड डिप्लॉय करें
- `azd package` - एप्लिकेशन बिल्ड और पैकेज करें

## बेसिक डिप्लॉयमेंट वर्कफ़्लोज़

### पूर्ण डिप्लॉयमेंट (azd up)
नए प्रोजेक्ट्स के लिए सबसे सामान्य वर्कफ़्लो:
```bash
# सब कुछ शुरू से तैनात करें
azd up

# विशिष्ट पर्यावरण के साथ तैनात करें
azd up --environment production

# अनुकूलित पैरामीटरों के साथ तैनात करें
azd up --parameter location=westus2 --parameter sku=P1v2
```

### केवल इन्फ्रास्ट्रक्चर डिप्लॉयमेंट
जब आपको केवल Azure संसाधन अपडेट करने हों:
```bash
# बुनियादी ढांचे का प्रावधान/अपडेट करें
azd provision

# परिवर्तनों का पूर्वावलोकन करने के लिए ड्राय-रन के साथ प्रावधान करें
azd provision --preview

# विशिष्ट सेवाओं का प्रावधान करें
azd provision --service database
```

### केवल कोड डिप्लॉयमेंट
तेज़ एप्लिकेशन अपडेट्स के लिए:
```bash
# सभी सेवाओं को तैनात करें
azd deploy

# अपेक्षित आउटपुट:
# सेवाओं को तैनात किया जा रहा है (azd deploy)
# - web: तैनात किया जा रहा है... हो गया
# - api: तैनात किया जा रहा है... हो गया
# सफलता: आपकी तैनाती 2 मिनट 15 सेकंड में पूरी हुई

# किसी विशिष्ट सेवा को तैनात करें
azd deploy --service web
azd deploy --service api

# कस्टम बिल्ड तर्कों के साथ तैनात करें
azd deploy --service api --build-arg NODE_ENV=production

# तैनाती सत्यापित करें
azd show --output json | jq '.services'
```

### ✅ डिप्लॉयमेंट सत्यापन

किसी भी डिप्लॉयमेंट के बाद, सफलता सत्यापित करें:

```bash
# सुनिश्चित करें कि सभी सेवाएँ चल रही हैं
azd show

# हेल्थ एंडपॉइंट्स की जाँच करें
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटियों के लिए निगरानी करें (डिफ़ॉल्ट रूप से ब्राउज़र में खुलता है)
azd monitor --logs
```

**सफलता मानदंड:**
- ✅ सभी सेवाएँ "Running" स्थिति दिखाती हैं
- ✅ हेल्थ एंडपॉइंट HTTP 200 लौटाते हैं
- ✅ पिछले 5 मिनट में कोई एरर लॉग नहीं
- ✅ एप्लिकेशन टेस्ट अनुरोधों का उत्तर देता है

## 🏗️ डिप्लॉयमेंट प्रक्रिया को समझना

### चरण 1: प्री-प्रोविजन हूक्स
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

### चरण 2: इन्फ्रास्ट्रक्चर प्रोविजनिंग
- इन्फ्रास्ट्रक्चर टेम्पलेट्स पढ़ता है (Bicep/Terraform)
- Azure संसाधनों का निर्माण या अपडेट करता है
- नेटवर्किंग और सुरक्षा को कॉन्फ़िगर करता है
- मॉनिटरिंग और लॉगिंग सेटअप करता है

### चरण 3: पोस्ट-प्रोविजन हूक्स
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

### चरण 4: एप्लिकेशन पैकेजिंग
- एप्लिकेशन कोड बनाता है
- डिप्लॉयमेंट आर्टिफ़ैक्ट बनाता है
- टार्गेट प्लेटफ़ॉर्म के लिए पैकेज करता है (कॉन्टेनर्स, ZIP फाइलें, आदि)

### चरण 5: प्री-डिप्लॉय हूक्स
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

### चरण 6: एप्लिकेशन डिप्लॉयमेंट
- पैकेज्ड एप्लिकेशन को Azure सेवाओं पर डिप्लॉय करता है
- कॉन्फ़िगरेशन सेटिंग्स अपडेट करता है
- सर्विसेज़ को स्टार्ट/रिस्टार्ट करता है

### चरण 7: पोस्ट-डिप्लॉय हूक्स
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

## 🎛️ डिप्लॉयमेंट कॉन्फ़िगरेशन

### सर्विस-विशिष्ट डिप्लॉयमेंट सेटिंग्स
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

### एनवायरनमेंट-विशिष्ट कॉन्फ़िगरेशन
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

## 🔧 उन्नत डिप्लॉयमेंट परिदृश्य

### मल्टी-सर्विस एप्लिकेशन
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

### ब्लू-ग्रीन डिप्लॉयमेंट
```bash
# नीले वातावरण का निर्माण करें
azd env new production-blue
azd up --environment production-blue

# नीले वातावरण का परीक्षण करें
./scripts/test-environment.sh production-blue

# ट्रैफ़िक को नीले वातावरण पर स्विच करें (मैन्युअल DNS/लोड बैलेंसर अपडेट)
./scripts/switch-traffic.sh production-blue

# हरे वातावरण की सफाई करें
azd env select production-green
azd down --force
```

### कैनरी डिप्लॉयमेंट
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

### स्टेज्ड डिप्लॉयमेंट
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

## 🐳 कंटेनर डिप्लॉयमेंट

### कंटेनर एप्लिकेशन डिप्लॉयमेंट
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

### मल्टी-स्टेज Dockerfile ऑप्टिमाइज़ेशन
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

## ⚡ प्रदर्शन अनुकूलन

### सर्विस-विशिष्ट डिप्लॉयमेंट्स
```bash
# तेज़ पुनरावृत्ति के लिए किसी विशिष्ट सेवा को तैनात करें
azd deploy --service web
azd deploy --service api

# सभी सेवाओं को तैनात करें
azd deploy
```

### बिल्ड कैशिंग
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### कुशल कोड डिप्लॉयमेंट
```bash
# कोड-केवल परिवर्तनों के लिए azd deploy (azd up नहीं) का उपयोग करें
# यह अवसंरचना प्रोविजनिंग को छोड़ देता है और बहुत तेज़ है
azd deploy

# सबसे तेज़ पुनरावृत्ति के लिए विशिष्ट सेवा तैनात करें
azd deploy --service api
```

## 🔍 डिप्लॉयमेंट मॉनिटरिंग

### रियल-टाइम डिप्लॉयमेंट मॉनिटरिंग
```bash
# एप्लिकेशन की वास्तविक समय में निगरानी करें
azd monitor --live

# एप्लिकेशन के लॉग देखें
azd monitor --logs

# तैनाती की स्थिति जांचें
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

### पोस्ट-डिप्लॉयमेंट वैलिडेशन
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# एप्लिकेशन के स्वास्थ्य की जाँच करें
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

### सीक्रेट्स प्रबंधन
```bash
# गोपनीय जानकारी को सुरक्षित रूप से संग्रहीत करें
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml में गोप्त जानकारी का संदर्भ दें
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

### पहचान और एक्सेस प्रबंधन
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

## 🚨 रोलबैक रणनीतियाँ

### त्वरित रोलबैक
```bash
# AZD में अंतर्निर्मित रोलबैक नहीं है। अनुशंसित तरीके:

# विकल्प 1: Git से पुनः तैनात करें (अनुशंसित)
git revert HEAD  # समस्या जनक कमिट को पूर्ववत करें
git push
azd deploy

# विकल्प 2: विशिष्ट कमिट को पुनः तैनात करें
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलबैक
```bash
# लागू करने से पहले इंफ्रास्ट्रक्चर परिवर्तन का पूर्वावलोकन करें
azd provision --preview

# इंफ्रास्ट्रक्चर रोलबैक के लिए संस्करण नियंत्रण का उपयोग करें:
git revert HEAD  # इंफ्रास्ट्रक्चर परिवर्तनों को पूर्ववत करें
azd provision    # पिछली इंफ्रास्ट्रक्चर स्थिति लागू करें
```

### डेटाबेस माइग्रेशन रोलबैक
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 डिप्लॉयमेंट मेट्रिक्स

### डिप्लॉयमेंट प्रदर्शन ट्रैक करें
```bash
# वर्तमान तैनाती की स्थिति देखें
azd show

# Application Insights के साथ एप्लिकेशन की निगरानी करें
azd monitor --overview

# लाइव मेट्रिक्स देखें
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

## 🎯 सर्वोत्तम प्रथाएँ

### 1. वातावरण संगति
```bash
# सुसंगत नामकरण का उपयोग करें
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरण समानता बनाए रखें
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर वैलिडेशन
```bash
# तैनाती से पहले इन्फ्रास्ट्रक्चर परिवर्तनों का पूर्वावलोकन करें
azd provision --preview

# ARM/Bicep लिंटिंग का उपयोग करें
az bicep lint --file infra/main.bicep

# Bicep सिंटैक्स सत्यापित करें
az bicep build --file infra/main.bicep
```

### 3. टेस्टिंग इंटीग्रेशन
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

### 4. दस्तावेज़ीकरण और लॉगिंग
```bash
# तैनाती प्रक्रियाओं का दस्तावेजीकरण करें
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अगले कदम

- [संसाधनों का प्रावधान](provisioning.md) - इन्फ्रास्ट्रक्चर प्रबंधन में गहराई से
- [प्री-डिप्लॉयमेंट योजना](../chapter-06-pre-deployment/capacity-planning.md) - अपनी डिप्लॉयमेंट रणनीति की योजना बनाएं
- [सामान्य समस्याएँ](../chapter-07-troubleshooting/common-issues.md) - डिप्लॉयमेंट मुद्दों का समाधान करें
- [सर्वोत्तम प्रथाएँ](../chapter-07-troubleshooting/debugging.md) - प्रोडक्शन-रेडी डिप्लॉयमेंट रणनीतियाँ

## 🎯 प्रायोगिक डिप्लॉयमेंट अभ्यास

### अभ्यास 1: इन्क्रीमेंटल डिप्लॉयमेंट वर्कफ़्लो (20 मिनट)
**लक्ष्य**: फुल और इन्क्रीमेंटल डिप्लॉयमेंट के बीच के अंतर में महारत हासिल करें

```bash
# प्रारंभिक तैनाती
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारंभिक तैनाती का समय रिकॉर्ड करें
echo "Full deployment: $(date)" > deployment-log.txt

# कोड में बदलाव करें
echo "// Updated $(date)" >> src/api/src/server.js

# केवल कोड तैनात करें (तेज़)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# समयों की तुलना करें
cat deployment-log.txt

# साफ़ करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] पूर्ण डिप्लॉयमेंट में 5-15 मिनट लगें
- [ ] केवल कोड डिप्लॉयमेंट में 2-5 मिनट लगें
- [ ] कोड परिवर्तन डिप्लॉय किए गए एप में परिलक्षित हों
- [ ] `azd deploy` के बाद इन्फ्रास्ट्रक्चर अपरिवर्तित रहे

**सीखने का परिणाम**: `azd deploy` कोड परिवर्तनों के लिए `azd up` की तुलना में 50-70% तेज़ है

### अभ्यास 2: कस्टम डिप्लॉयमेंट हूक्स (30 मिनट)
**लक्ष्य**: प्री और पोस्ट-डिप्लॉयमेंट ऑटोमेशन लागू करें

```bash
# डिप्लॉय से पहले सत्यापन स्क्रिप्ट बनाएं
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# जाँचें कि परीक्षण पास हुए हैं
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# अनकमिट किए गए परिवर्तनों की जाँच करें
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# डिप्लॉय के बाद स्मोक टेस्ट बनाएं
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

# azure.yaml में हुक्स जोड़ें
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# हुक्स के साथ डिप्लॉयमेंट का परीक्षण करें
azd deploy
```

**सफलता मानदंड:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट डिप्लॉयमेंट से पहले चले
- [ ] यदि टेस्ट फेल हों तो डिप्लॉयमेंट रद्द हो
- [ ] पोस्ट-डिप्लॉय स्मोक टेस्ट हेल्थ को मान्य करता है
- [ ] हूक्स सही क्रम में निष्पादित हों

### अभ्यास 3: मल्टी-एनवायरनमेंट डिप्लॉयमेंट रणनीति (45 मिनट)
**लक्ष्य**: स्टेज्ड डिप्लॉयमेंट वर्कफ़्लो लागू करें (dev → staging → production)

```bash
# डिप्लॉयमेंट स्क्रिप्ट बनाएं
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# चरण 1: डेवलपमेंट (dev) पर तैनात करें
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 2: स्टेजिंग पर तैनात करें
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 3: प्रोडक्शन के लिए मैनुअल अनुमोदन
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

# पर्यावरण बनाएं
azd env new dev
azd env new staging
azd env new production

# स्टेज की गई तैनाती चलाएँ
./deploy-staged.sh
```

**सफलता मानदंड:**
- [ ] Dev एनवायरनमेंट सफलतापूर्वक डिप्लॉय हो
- [ ] Staging एनवायरनमेंट सफलतापूर्वक डिप्लॉय हो
- [ ] प्रोडक्शन के लिए मैन्युअल अनुमोदन आवश्यक हो
- [ ] सभी एनवायरनमेंट में काम करने वाले हेल्थ चेक्स हों
- [ ] आवश्यकता पड़ने पर रोलबैक किया जा सके

### अभ्यास 4: रोलबैक रणनीति (25 मिनट)
**लक्ष्य**: Git का उपयोग करके डिप्लॉयमेंट रोलबैक लागू और परीक्षण करें

```bash
# v1 को तैनात करें
azd env set APP_VERSION "1.0.0"
azd up

# v1 का कमिट हैश सहेजें
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 को संगतता-भंग करने वाले परिवर्तन के साथ तैनात करें
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# विफलता का पता लगाएँ और रोलबैक करें
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git का उपयोग करके रोलबैक करें
    git revert HEAD --no-edit
    
    # पर्यावरण को रोलबैक करें
    azd env set APP_VERSION "1.0.0"
    
    # v1 को पुनः तैनात करें
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**सफलता मानदंड:**
- [ ] डिप्लॉयमेंट निष्फलता का पता लगा सकें
- [ ] रोलबैक स्क्रिप्ट स्वचालित रूप से निष्पादित हो
- [ ] एप्लिकेशन कार्यशील स्थिति में लौट आए
- [ ] रोलबैक के बाद हेल्थ चेक्स पास हों

## 📊 डिप्लॉयमेंट मेट्रिक्स ट्रैकिंग

### अपने डिप्लॉयमेंट प्रदर्शन को ट्रैक करें

```bash
# तैनाती मेट्रिक्स स्क्रिप्ट बनाएं
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

# फाइल में लॉग करें
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# इस्तेमाल करें
./track-deployment.sh
```

**अपने मेट्रिक्स का विश्लेषण करें:**
```bash
# तैनाती का इतिहास देखें
cat deployment-metrics.csv

# औसत तैनाती समय की गणना करें
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त संसाधन

- [Azure Developer CLI डिप्लॉयमेंट संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service डिप्लॉयमेंट](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps डिप्लॉयमेंट](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions डिप्लॉयमेंट](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेविगेशन**
- **पिछला पाठ**: [आपकी पहली परियोजना](../chapter-01-foundation/first-project.md)
- **अगला पाठ**: [संसाधनों का प्रावधान](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हालांकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की अनुशंसा की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->