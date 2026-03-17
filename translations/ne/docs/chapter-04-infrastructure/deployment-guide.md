# परिनियोजन मार्गदर्शिका - AZD परिनियोजनमा प्रवीणता

**Chapter Navigation:**
- **📚 पाठ्यक्रम गृह**: [आरम्भकर्ताका लागि AZD](../../README.md)
- **📖 Current Chapter**: अध्याय 4 - कोडको रूपमा पूर्वाधार र परिनियोजन
- **⬅️ Previous Chapter**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [स्रोतहरू प्राविजन गर्नुहोस्](provisioning.md)
- **🚀 Next Chapter**: [अध्याय 5: बहु-एजेन्ट एआई समाधानहरू](../../examples/retail-scenario.md)

## परिचय

यो व्यापक मार्गदर्शिकाले Azure Developer CLI प्रयोग गरेर आवेदनहरू कसरी परिनियोजन गर्ने भन्ने बारेमा सबै कुरा समेट्छ, साधारण एक-कमान्ड परिनियोजनहरूदेखि लिएर कस्टम हुकहरू, बहु वातावरणहरू, र CI/CD एकीकरण भएका उन्नत उत्पादन परिदृश्यहरू सम्म। व्यावहारिक उदाहरणहरू र उत्तम अभ्यासहरूसँग पूर्ण परिनियोजन जीवनचक्रमा प्रवीणता हासिल गर्नुहोस्।

## सिकाइ लक्ष्यहरू

यस मार्गदर्शिका पूर्ण गरेपछि, तपाईंले:
- Azure Developer CLI का सबै परिनियोजन कमान्डहरू र कार्यप्रवाहहरूमा प्रवीणता हासिल गर्नुहुनेछ
- प्राविजनिङदेखि अनुगमनसम्मको पूर्ण परिनियोजन जीवनचक्र बुझ्नुहुनेछ
- पूर्व र पोस्ट-परिनियोजन स्वचालनका लागि कस्टम हुकहरू कार्यान्वयन गर्नुहुनेछ
- वातावरण-विशिष्ट प्यारामिटरहरू सहित बहु वातावरणहरू कन्फिगर गर्नुहुनेछ
- ब्लू-ग्रीन र कनारी लगायत उन्नत परिनियोजन रणनीतिहरू सेटअप गर्नुहुनेछ
- azd परिनियोजनहरूलाई CI/CD पाइपलाइनहरू र DevOps कार्यप्रवाहहरूसँग एकीकृत गर्नुहुनेछ

## सिकाइ परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- सबै azd परिनियोजन कार्यप्रवाहहरू स्वतंत्र रूपमा कार्यान्वयन र समस्या निवारण गर्नु
- हुकहरू प्रयोग गरी कस्टम परिनियोजन स्वचालन डिजाइन र कार्यान्वयन गर्नु
- उपयुक्त सुरक्षा र अनुगमनसहित उत्पादन-तयार परिनियोजनहरू कन्फिगर गर्नु
- जटिल बहु-वातावरण परिनियोजन परिदृश्यहरू व्यवस्थापन गर्नु
- परिनियोजन प्रदर्शन अनुकूलन र रोलब्याक रणनीतिहरू लागू गर्नु
- उद्यम DevOps अभ्यासमा azd परिनियोजनहरू समायोजन गर्नु

## परिनियोजन अवलोकन

Azure Developer CLI ले विभिन्न परिनियोजन कमान्डहरू प्रदान गर्दछ:
- `azd up` - पूर्ण कार्यप्रवाह (प्राविजन + परिनियोजन)
- `azd provision` - केवल Azure स्रोतहरू सिर्जना/अपडेट
- `azd deploy` - केवल एप्लिकेशन कोड परिनियोजन
- `azd package` - अनुप्रयोगहरू निर्माण र प्याकेज

## आधारभूत परिनियोजन कार्यप्रवाहहरू

### पूर्ण परिनियोजन (azd up)
नयाँ परियोजनाहरूका लागि सबैभन्दा सामान्य कार्यप्रवाह:
```bash
# सुरुबाटै सबै कुरा परिनियोजन गर्नुहोस्
azd up

# विशिष्ट वातावरणमा परिनियोजन गर्नुहोस्
azd up --environment production

# कस्टम प्यारामिटरहरू सहित परिनियोजन गर्नुहोस्
azd up --parameter location=westus2 --parameter sku=P1v2
```

### केवल इन्फ्रास्ट्रक्चर परिनियोजन
जब तपाईंले केवल Azure स्रोतहरू अपडेट गर्नुपर्ने हुन्छ:
```bash
# पूर्वाधार प्रावधान/अद्यावधिक गर्नुहोस्
azd provision

# ड्राइ-रनसहित परिवर्तनहरू पूर्वावलोकन गर्न प्रावधान गर्नुहोस्
azd provision --preview

# विशिष्ट सेवाहरू प्रावधान गर्नुहोस्
azd provision --service database
```

### केवल कोड परिनियोजन
छिटो अनुप्रयोग अपडेटहरूको लागि:
```bash
# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy

# अपेक्षित आउटपुट:
# सेवाहरू तैनाथ गरिँदैछन् (azd deploy)
# - web: तैनाथ गर्दै... सम्पन्न
# - api: तैनाथ गर्दै... सम्पन्न
# सफलता: तपाईंको तैनाथी 2 मिनेट 15 सेकेन्डमा पूरा भयो

# विशिष्ट सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# कस्टम बिल्ड आर्गुमेन्टहरूसँग तैनाथ गर्नुहोस्
azd deploy --service api --build-arg NODE_ENV=production

# तैनाथी जाँच गर्नुहोस्
azd show --output json | jq '.services'
```

### ✅ परिनियोजन प्रमाणिकरण

कुनै पनि परिनियोजन पछि, सफलता प्रमाणित गर्नुहोस्:

```bash
# सबै सेवाहरू चलिरहेका छन् कि छैनन् जाँच गर्नुहोस्
azd show

# स्वास्थ्य एन्डपोइन्टहरू परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटिहरूको लागि निगरानी गर्नुहोस् (पूर्वनिर्धारित रूपमा ब्राउजरमा खोलिन्छ)
azd monitor --logs
```

**सफलताका मापदण्ड:**
- ✅ सबै सेवाहरूले "Running" स्थिति देखाउँछन्
- ✅ स्वास्थ्य एन्डपोइन्टहरूले HTTP 200 फर्काउँछन्
- ✅ पछिल्लो 5 मिनेटमा कुनै त्रुटि लगहरू छैनन्
- ✅ अनुप्रयोगले परीक्षण अनुरोधहरूमा प्रतिक्रिया दिन्छ

## 🏗️ परिनियोजन प्रक्रिया बुझ्नुहोस्

### चरण 1: पूर्व-प्राविजन हुकहरू
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

### चरण 2: इन्फ्रास्ट्रक्चर प्राविजन
- इन्फ्रास्ट्रक्चर टेम्प्लेटहरू पढ्छ (Bicep/Terraform)
- Azure स्रोतहरू सिर्जना वा अपडेट गर्छ
- नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
- अनुगमन र लगिङ सेटअप गर्छ

### चरण 3: पोस्ट-प्राविजन हुकहरू
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

### चरण 4: अनुप्रयोग प्याकेजिङ
- अनुप्रयोग कोड निर्माण गर्छ
- परिनियोजन आर्टिफ्याक्टहरू सिर्जना गर्छ
- लक्ष्य प्लेटफर्मका लागि प्याकेज गर्छ (कन्टेनरहरू, ZIP फाइलहरू, आदि)

### चरण 5: पूर्व-डिप्लॉय हुकहरू
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

### चरण 6: अनुप्रयोग परिनियोजन
- प्याकेज गरिएका अनुप्रयोगहरू Azure सेवाहरूमा परिनियोजन गर्छ
- कन्फिगरेसन सेटिङहरू अपडेट गर्छ
- सेवाहरू सुरु/पुनःसुरु गर्छ

### चरण 7: पोस्ट-डिप्लॉय हुकहरू
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

## 🎛️ परिनियोजन कन्फिगरेसन

### सेवा-विशिष्ट परिनियोजन सेटिङहरू
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

### वातावरण-विशिष्ट कन्फिगरेसनहरू
```bash
# विकास वातावरण
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# स्टेजिङ वातावरण
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

## 🔧 उन्नत परिनियोजन परिदृश्यहरू

### बहु–सेवा अनुप्रयोगहरू
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

### ब्लू-ग्रीन परिनियोजनहरू
```bash
# नीलो वातावरण सिर्जना गर्नुहोस्
azd env new production-blue
azd up --environment production-blue

# नीलो वातावरण परीक्षण गर्नुहोस्
./scripts/test-environment.sh production-blue

# ट्राफिक नीलोमा सार्नुहोस् (हातैले DNS/लोड बेलान्सर अपडेट गर्नुहोस्)
./scripts/switch-traffic.sh production-blue

# हरियो वातावरण सफा गर्नुहोस्
azd env select production-green
azd down --force
```

### कनारी परिनियोजनहरू
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

### चरणबद्ध परिनियोजनहरू
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

## 🐳 कन्टेनर परिनियोजनहरू

### कन्टेनर एप परिनियोजनहरू
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

### बहु-चरण Dockerfile अनुकूलन
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

### सेवा-विशिष्ट परिनियोजनहरू
```bash
# छिटो पुनरावृत्ति गर्नको लागि एउटा विशिष्ट सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy
```

### बिल्ड क्याचिङ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### कुशल कोड परिनियोजनहरू
```bash
# कोड मात्र परिवर्तनको लागि azd deploy प्रयोग गर्नुहोस् (azd up होइन)
# यसले पूर्वाधार तयार गर्ने प्रक्रियालाई छोड्छ र धेरै छिटो हुन्छ
azd deploy

# सबैभन्दा छिटो पुनरावृत्तिका लागि विशिष्ट सेवा मात्र तैनात गर्नुहोस्
azd deploy --service api
```

## 🔍 परिनियोजन अनुगमन

### रियल-टाइम परिनियोजन अनुगमन
```bash
# एप्लिकेशनलाई वास्तविक समयमा अनुगमन गर्नुहोस्
azd monitor --live

# एप्लिकेशनका लगहरू हेर्नुहोस्
azd monitor --logs

# डिप्लोयमेन्टको स्थिति जाँच गर्नुहोस्
azd show
```

### स्वास्थ्य जाँचहरू
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

### पोस्ट-परिनियोजन मान्यकरण
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# अनुप्रयोगको स्वास्थ्य जाँच गर्नुहोस्
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

## 🔐 सुरक्षा विचारहरू

### गोप्य व्यवस्थापन
```bash
# रहस्यहरू सुरक्षित रूपमा भण्डारण गर्नुहोस्
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मा रहस्यहरूको सन्दर्भ दिनुहोस्
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

### पहिचान र पहुँच व्यवस्थापन
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

## 🚨 रोलब्याक रणनीतिहरू

### छिटो रोलब्याक
```bash
# AZD मा पूर्वनिर्मित रोलब्याक छैन। सिफारिस गरिएका तरिकाहरू:

# विकल्प 1: Git बाट पुनःडिप्लोय गर्नुहोस् (सिफारिस गरिएको)
git revert HEAD  # समस्याग्रस्त कमिट उल्टाउनुहोस्
git push
azd deploy

# विकल्प 2: विशिष्ट कमिटबाट पुनःडिप्लोय गर्नुहोस्
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलब्याक
```bash
# पूर्वाधार परिवर्तनहरू लागू गर्नु अघि पूर्वावलोकन गर्नुहोस्
azd provision --preview

# पूर्वाधार रोलब्याकका लागि संस्करण नियन्त्रण प्रयोग गर्नुहोस्:
git revert HEAD  # पूर्वाधार परिवर्तनहरू फिर्ता गर्नुहोस्
azd provision    # अघिल्लो पूर्वाधार अवस्था लागू गर्नुहोस्
```

### डाटाबेस माइग्रेशन रोलब्याक
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 परिनियोजन मेट्रिक्स

### परिनियोजन प्रदर्शन ट्र्याक गर्नुहोस्
```bash
# हालको परिनियोजन स्थिति हेर्नुहोस्
azd show

# Application Insights प्रयोग गरी अनुप्रयोग अनुगमन गर्नुहोस्
azd monitor --overview

# सजीव मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

### अनुकूलित मेट्रिक्स सङ्कलन
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

## 🎯 उत्तम अभ्यासहरू

### 1. वातावरण सुसंगतता
```bash
# सुसंगत नामकरण प्रयोग गर्नुहोस्
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरण समानता कायम राख्नुहोस्
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर मान्यकरण
```bash
# परिनियोजन गर्नु अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
azd provision --preview

# ARM/Bicep को लिन्टिङ प्रयोग गर्नुहोस्
az bicep lint --file infra/main.bicep

# Bicep को सिन्ट्याक्स मान्य गर्नुहोस्
az bicep build --file infra/main.bicep
```

### 3. परीक्षण एकीकरण
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

### 4. कागजात र लगिङ
```bash
# तैनाती प्रक्रियाहरू दस्तावेज गर्नुहोस्
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अर्को कदमहरू

- [स्रोतहरू प्राविजन गर्नुहोस्](provisioning.md) - पूर्वाधार व्यवस्थापनमा गहिरो अध्ययन
- [पूर्व-परिनियोजन योजना](../chapter-06-pre-deployment/capacity-planning.md) - आफ्नो परिनियोजन रणनीति योजना गर्नुहोस्
- [सामान्य समस्याहरू](../chapter-07-troubleshooting/common-issues.md) - परिनियोजन समस्याहरू समाधान गर्नुहोस्
- [सर्वोत्तम अभ्यासहरू](../chapter-07-troubleshooting/debugging.md) - उत्पादन-तयार परिनियोजन रणनीतिहरू

## 🎯 व्यावहारिक परिनियोजन अभ्यासहरू

### अभ्यास 1: वृद्धिशील परिनियोजन कार्यप्रवाह (20 मिनेट)
**लक्ष्य**: पूर्ण र वृद्धिशील परिनियोजनहरू बीचको फरकमा प्रवीणता हासिल गर्नु

```bash
# प्रारम्भिक तैनाती
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारम्भिक तैनातीको समय रेकर्ड गर्नुहोस्
echo "Full deployment: $(date)" > deployment-log.txt

# कोड परिवर्तन गर्नुहोस्
echo "// Updated $(date)" >> src/api/src/server.js

# मात्र कोड तैनात गर्नुहोस् (छिटो)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# समयहरू तुलना गर्नुहोस्
cat deployment-log.txt

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलताका मापदण्ड:**
- [ ] पूर्ण परिनियोजन 5-15 मिनेट लाग्छ
- [ ] केवल कोड परिनियोजन 2-5 मिनेट लाग्छ
- [ ] कोड परिवर्तनहरू परिनियोजित एपमा प्रतिबिम्बित भएका छन्
- [ ] `azd deploy` पछि इन्फ्रास्ट्रक्चर अपरिवर्तित छ

**सिकाइ नतिजा**: `azd deploy` कोड परिवर्तनहरूको लागि `azd up` भन्दा 50-70% छिटो हुन्छ

### अभ्यास 2: अनुकूलन परिनियोजन हुकहरू (30 मिनेट)
**लक्ष्य**: पूर्व र पोस्ट-परिनियोजन स्वचालन कार्यान्वयन गर्नु

```bash
# पूर्व-डिप्लॉय मान्यता स्क्रिप्ट सिर्जना गर्नुहोस्
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# टेस्टहरू पास भए कि भएनन् जाँच गर्नुहोस्
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# कमिट नभएका परिवर्तनहरूको जाँच गर्नुहोस्
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# पोस्ट-डिप्लॉय स्मोक टेस्ट सिर्जना गर्नुहोस्
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

# azure.yaml मा हुकहरू थप्नुहोस्
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# हुकहरूसँग डिप्लोयमेन्ट परीक्षण गर्नुहोस्
azd deploy
```

**सफलताका मापदण्ड:**
- [ ] पूर्व-डिप्लॉय स्क्रिप्ट परिनियोजन अघि चल्छ
- [ ] परीक्षणहरू असफल भएमा परिनियोजन रद्द हुन्छ
- [ ] पोस्ट-डिप्लॉय स्मोक टेस्टले स्वास्थ्य पुष्टि गर्छ
- [ ] हुकहरू सही क्रममा कार्यान्वयन हुन्छन्

### अभ्यास 3: बहु-वातावरण परिनियोजन रणनीति (45 मिनेट)
**लक्ष्य**: चरणबद्ध परिनियोजन कार्यप्रवाह कार्यान्वयन गर्नु (dev → staging → production)

```bash
# परिनियोजन स्क्रिप्ट सिर्जना गर्नुहोस्
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# चरण 1: विकास वातावरणमा परिनियोजन गर्नुहोस्
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 2: स्टेजिङ वातावरणमा परिनियोजन गर्नुहोस्
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 3: उत्पादनका लागि म्यानुअल अनुमोदन
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

# वातावरणहरू सिर्जना गर्नुहोस्
azd env new dev
azd env new staging
azd env new production

# स्टेज गरिएको परिनियोजन चलाउनुहोस्
./deploy-staged.sh
```

**सफलताका मापदण्ड:**
- [ ] Dev वातावरण सफलतापूर्वक परिनियोजन हुन्छ
- [ ] Staging वातावरण सफलतापूर्वक परिनियोजन हुन्छ
- [ ] उत्पादनको लागि म्यानुअल स्वीकृति आवश्यक छ
- [ ] सबै वातावरणहरूमा कार्यरत स्वास्थ्य जाँचहरू छन्
- [ ] आवश्यक परे रोलब्याक गर्न सकिन्छ

### अभ्यास 4: रोलब्याक रणनीति (25 मिनेट)
**लक्ष्य**: Git प्रयोग गरी परिनियोजन रोलब्याक कार्यान्वयन र परीक्षण गर्नु

```bash
# v1 तैनाथ गर्नुहोस्
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट ह्यास सुरक्षित गर्नुहोस्
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# असंगत परिवर्तन सहित v2 तैनाथ गर्नुहोस्
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# असफलता पत्ता लगाउनुहोस् र रोलब्याक गर्नुहोस्
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git प्रयोग गरेर रोलब्याक गर्नुहोस्
    git revert HEAD --no-edit
    
    # पर्यावरण रोलब्याक गर्नुहोस्
    azd env set APP_VERSION "1.0.0"
    
    # v1 पुनः तैनाथ गर्नुहोस्
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**सफलताका मापदण्ड:**
- [ ] परिनियोजन असफलताहरू पत्ता लगाउन सकिन्छ
- [ ] रोलब्याक स्क्रिप्ट स्वतः कार्यान्वयन हुन्छ
- [ ] अनुप्रयोग कार्यरत अवस्थामा फर्किन्छ
- [ ] रोलब्याकपछि स्वास्थ्य जाँचहरू पास हुन्छन्

## 📊 परिनियोजन मेट्रिक्स ट्र्याकिङ

### आफ्नो परिनियोजन प्रदर्शन ट्र्याक गर्नुहोस्

```bash
# तैनाती मेट्रिक्स स्क्रिप्ट सिर्जना गर्नुहोस्
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

# फाइलमा लग लेख्नुहोस्
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# यसलाई प्रयोग गर्नुहोस्
./track-deployment.sh
```

**आफ्ना मेट्रिक्स विश्लेषण गर्नुहोस्:**
```bash
# परिनियोजन इतिहास हेर्नुहोस्
cat deployment-metrics.csv

# औसत परिनियोजन समय गणना गर्नुहोस्
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त स्रोतहरू

- [Azure Developer CLI परिनियोजन सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service परिनियोजन](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps परिनियोजन](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions परिनियोजन](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेभिगेसन**
- **Previous Lesson**: [तिम्रो पहिलो परियोजना](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [स्रोतहरू प्राविजन गर्नुहोस्](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा असंगतता हुन सक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा अधिकारिक स्रोत मान्नुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी उत्तरदायी छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->