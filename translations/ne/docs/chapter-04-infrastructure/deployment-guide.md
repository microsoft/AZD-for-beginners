# परिनियोजन मार्गदर्शिका - AZD परिनियोजनमा निपुणता

**अध्याय नेभिगेसन:**
- **📚 Course Home**: [सुरु गर्नेहरूका लागि AZD](../../README.md)
- **📖 Current Chapter**: अध्याय 4 - Infrastructure as Code र परिनियोजन
- **⬅️ Previous Chapter**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [स्रोतहरू प्रावधान](provisioning.md)
- **🚀 Next Chapter**: [अध्याय 5: बहु-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)

## परिचय

यो## परिनियोजन प्रक्रियाको बुझाइव्यापक मार्गदर्शिकाले Azure Developer CLI प्रयोग गरेर अनुप्रयोगहरू परिनियोजन (डिप्लॉय) गर्दा तपाईंले जान्नुपर्ने सबै कुरा समेट्छ, सिंगल-कमान्ड बेसिक परिनियोजनदेखि कस्टम हुकहरू, बहु वातावरणहरू, र CI/CD एकीकरण सहितको उन्नत उत्पादन परिदृश्यहरू सम्म। व्यावहारिक उदाहरणहरू र उत्तम अभ्यासहरूसँग सम्पूर्ण परिनियोजन जीवनचक्रमा निपुण हुनुस्।

## सिकाइ लक्ष्यहरू

By completing this guide, you will:
- Azure Developer CLI का सबै डिप्लोयमेन्ट कमाण्डहरू र वर्कफ्लोजमा निपुण हुनुहोस्
- प्रावधानदेखि अनुगमनसम्म सम्पूर्ण परिनियोजन जीवनचक्र बुझ्नुहोस्
- पूर्व र पोस्ट-डिप्लोयीमेन्ट अटोमेसनका लागि कस्टम डिप्लोयमेन्ट हुकहरू लागू गर्नुहोस्
- वातावरण-विशिष्ट प्यारामिटरहरूसँग बहु वातावरणहरू कन्फिगर गर्नुहोस्
- ब्लु-ग्रीन र क्यानेरी परिनियोजनसमेत समावेश गरी उन्नत परिनियोजन रणनीतिहरू सेटअप गर्नुहोस्
- azd परिनियोजनहरूलाई CI/CD पाइपलाइन र DevOps वर्कफ्लोजसँग एकीकृत गर्नुहोस्

## सिकाइ परिणामहरू

Upon completion, you will be able to:
- सबै azd डिप्लोयमेन्ट वर्कफ्लोज स्वतन्त्र रूपमा चलाउन र समस्या समाधान गर्न सक्षम हुनुहोस्
- हुकहरू प्रयोग गरी कस्टम डिप्लोयमेन्ट अटोमेसन डिजाइन र लागू गर्नुहोस्
- उचित सुरक्षा र अनुगमनसहित उत्पादन-तयार परिनियोजन कन्फिगर गर्नुहोस्
- जटिल बहु-वातावरण परिनियोजन परिदृश्यहरू व्यवस्थापन गर्नुहोस्
- परिनियोजन प्रदर्शन अनुकूलन र रोलब्याक रणनीतिहरू लागू गर्नुहोस्
- एन्त्रप्राइज DevOps अभ्यासहरूमा azd परिनियोजनहरू एकीकृत गर्नुहोस्

## परिनियोजन अवलोकन

Azure Developer CLI ले विभिन्न परिनियोजन कमाण्डहरू प्रदान गर्दछ:
- `azd up` - पूर्ण वर्कफ्लो (प्रावधान + परिनियोजन)
- `azd provision` - केवल Azure स्रोतहरू सिर्जना/अपडेट
- `azd deploy` - केवल अनुप्रयोग कोड परिनियोजन
- `azd package` - अनुप्रयोगहरू बिल्ड र प्याकेज

## आधारभूत परिनियोजन वर्कफ्लोज

### पूर्ण परिनियोजन (azd up)
The most common workflow for new projects:
```bash
# सुरुबाट सबै कुरा परिनियोजन गर्नुहोस्
azd up

# विशिष्ट वातावरणमा परिनियोजन गर्नुहोस्
azd up --environment production

# अनुकूलित प्यारामिटरहरूसँग परिनियोजन गर्नुहोस्
azd up --parameter location=westus2 --parameter sku=P1v2
```

### केवल पूर्वाधार परिनियोजन
When you only need to update Azure resources:
```bash
# पूर्वाधार प्रावधान/अद्यावधिक गर्नुहोस्
azd provision

# परिवर्तनहरू पूर्वावलोकन गर्न ड्राइ-रनसँग प्रावधान गर्नुहोस्
azd provision --preview

# विशिष्ट सेवाहरू प्रावधान गर्नुहोस्
azd provision --service database
```

### कोड-केवल परिनियोजन
For quick application updates:
```bash
# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy

# अपेक्षित नतिजा:
# सेवाहरू तैनाथ गर्दै (azd deploy)
# - web: तैनाथ गर्दै... सम्पन्न
# - api: तैनाथ गर्दै... सम्पन्न
# सफलता: तपाईंको परिनियोजन 2 मिनेट 15 सेकेन्डमा पूरा भयो

# विशिष्ट सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# कस्टम निर्माण तर्कहरूसँग तैनाथ गर्नुहोस्
azd deploy --service api --build-arg NODE_ENV=production

# परिनियोजन जाँच गर्नुहोस्
azd show --output json | jq '.services'
```

### ✅ परिनियोजन सत्यापन

After any deployment, verify success:

```bash
# सबै सेवाहरू चलिरहेका छन् कि छैनन् जाँच गर्नुहोस्
azd show

# हेल्थ एन्डप्वाइन्टहरू परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटिहरूको लागि अनुगमन गर्नुहोस् (पूर्वनिर्धारित रूपमा ब्राउजरमा खोलिन्छ)
azd monitor --logs
```

**सफलताको मापदण्ड:**
- ✅ सबै सेवाहरू "Running" स्थितिमा देखिनु पर्छ
- ✅ हेल्थ इन्डपोइन्टहरूले HTTP 200 फर्काउनु पर्छ
- ✅ पछिल्ला 5 मिनेटमा कुनै त्रुटि लगहरू हुन हुँदैन
- ✅ एप्लिकेशनले परीक्षण अनुरोधहरूमा जवाफ दिन्छ

## 🏗️ परिनियोजन प्रक्रियाको बुझाइ

### चरण 1: पूर्व-प्रावधान हुकहरू
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

### चरण 2: पूर्वाधार प्रावधान
- पूर्वाधार टेम्प्लेटहरू पढ्छ (Bicep/Terraform)
- Azure स्रोतहरू सिर्जना वा अपडेट गर्छ
- नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
- अनुगमन र लगिङ सेटअप गर्छ

### चरण 3: पोस्ट-प्रावधान हुकहरू
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
- अनुप्रयोग कोड बिल्ड गर्छ
- परिनियोजन आर्टिफ्याक्टहरू सिर्जना गर्छ
- लक्षित प्लेटफर्मका लागि प्याकेज बनाउँछ (कन्टेनरहरू, ZIP फाइलहरू, आदि)

### चरण 5: प्रि-डिप्लोय हुकहरू
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
- कन्फिगरेसन सेटिङ्हरू अपडेट गर्छ
- सेवाहरू सुरु/पुनः सुरु गर्छ

### चरण 7: पोस्ट-डिप्लोय हुकहरू
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

### बहु-सेवा अनुप्रयोगहरू
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

### ब्लु-ग्रीन परिनियोजन
```bash
# नीलो वातावरण सिर्जना गर्नुहोस्
azd env new production-blue
azd up --environment production-blue

# नीलो वातावरण परीक्षण गर्नुहोस्
./scripts/test-environment.sh production-blue

# ट्राफिक नीलोमा सार्नुहोस् (म्यानुअल DNS/लोड बेलान्सर अपडेट)
./scripts/switch-traffic.sh production-blue

# हरियो वातावरण सफा गर्नुहोस्
azd env select production-green
azd down --force
```

### क्यानरी परिनियोजन
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

### चरणबद्ध परिनियोजन
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

## 🐳 कन्टेनर परिनियोजन

### कन्टेनर एप्लिकेशन परिनियोजन
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

### बहु-स्टेज Dockerfile अनुकूलन
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
# छिटो पुनरावृत्तिका लागि कुनै विशेष सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy
```

### बिल्ड क्यासिङ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### कुशल कोड परिनियोजन
```bash
# कोड मात्र परिवर्तनहरूको लागि azd deploy (azd up होइन) प्रयोग गर्नुहोस्
# यसले पूर्वाधार प्रावधानलाई छोड्छ र यो धेरै छिटो हुन्छ
azd deploy

# सबैभन्दा छिटो पुनरावृत्तिको लागि विशिष्ट सेवा तैनाथ गर्नुहोस्
azd deploy --service api
```

## 🔍 परिनियोजन अनुगमन

### रियल-टाइम परिनियोजन अनुगमन
```bash
# एप्लिकेशनलाई वास्तविक-समयमा अनुगमन गर्नुहोस्
azd monitor --live

# एप्लिकेशनका लगहरू हेर्नुहोस्
azd monitor --logs

# तैनातीको स्थिति जाँच गर्नुहोस्
azd show
```

### हेल्थ जाँचहरू
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

### परिनियोजन पछिको मान्यकरण
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

### सिक्रेट व्यवस्थापन
```bash
# गोप्य जानकारीहरू सुरक्षित रूपमा भण्डारण गर्नुहोस्
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मा गोप्य जानकारीहरूको सन्दर्भ गर्नुहोस्
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
# AZD मा निहित रोलब्याक छैन। सिफारिश गरिएका दृष्टिकोणहरू:

# विकल्प 1: Git बाट पुनः तैनाथ गर्नुहोस् (सिफारिश गरिन्छ)
git revert HEAD  # समस्या भएको कमिटलाई रिभर्ट गर्नुहोस्
git push
azd deploy

# विकल्प 2: विशिष्ट कमिटबाट पुनः तैनाथ गर्नुहोस्
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### पूर्वाधार रोलब्याक
```bash
# लागू गर्नु अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
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
# हालको तैनाती स्थिति हेर्नुहोस्
azd show

# Application Insights प्रयोग गरेर अनुप्रयोग निगरानी गर्नुहोस्
azd monitor --overview

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

### कस्टम मेट्रिक्स सङ्कलन
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

### 1. वातावरण स्थिरता
```bash
# सुसंगत नामकरण प्रयोग गर्नुहोस्
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# वातावरण समानता कायम राख्नुहोस्
./scripts/sync-environments.sh
```

### 2. पूर्वाधार मान्यकरण
```bash
# परिनियोजन अघि इन्फ्रास्ट्रक्चरमा हुने परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
azd provision --preview

# ARM/Bicep को लिन्टिङ प्रयोग गर्नुहोस्
az bicep lint --file infra/main.bicep

# Bicep वाक्यरचना मान्य गर्नुहोस्
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

### 4. डकुमेन्टेशन र लगिङ
```bash
# परिनियोजन प्रक्रियाहरू दस्तावेज गर्नुहोस्
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अर्को कदमहरू

- [स्रोतहरू प्रावधान](provisioning.md) - पूर्वाधार व्यवस्थापनमा गहिराइमा प्रवेश गर्नुहोस्
- [पूर्व-परिनियोजन योजना](../chapter-06-pre-deployment/capacity-planning.md) - आफ्नो परिनियोजन रणनीति योजना गर्नुहोस्
- [सामान्य समस्याहरू](../chapter-07-troubleshooting/common-issues.md) - परिनियोजन समस्याहरू समाधान गर्नुहोस्
- [उत्तम अभ्यासहरू](../chapter-07-troubleshooting/debugging.md) - उत्पादन-तयार परिनियोजन रणनीतिहरू

## 🎯 व्यावहारिक परिनियोजन अभ्यासहरू

### अभ्यास 1: क्रमिक परिनियोजन वर्कफ्लो (20 मिनेट)
**उद्देश्य**: पूर्ण र क्रमिक परिनियोजनबीचको भिन्नता निपुण हुन

```bash
# प्रारम्भिक परिनियोजन
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारम्भिक परिनियोजनको समय रेकर्ड गर्नुहोस्
echo "Full deployment: $(date)" > deployment-log.txt

# कोडमा परिवर्तन गर्नुहोस्
echo "// Updated $(date)" >> src/api/src/server.js

# केवल कोड परिनियोजन गर्नुहोस् (छिटो)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# समयहरू तुलना गर्नुहोस्
cat deployment-log.txt

# सफाइ गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] पूर्ण परिनियोजन 5-15 मिनेट लाग्छ
- [ ] कोड-केवल परिनियोजन 2-5 मिनेट लाग्छ
- [ ] कोड परिवर्तनहरू परिनियोजित एपमा प्रतिबिम्बित छन्
- [ ] `azd deploy` पछि पूर्वाधार अपरिवर्तित छ

**सिकाइ नतिजा**: `azd deploy` कोड परिवर्तनहरूको लागि `azd up` भन्दा 50-70% छिटो हुन्छ

### अभ्यास 2: कस्टम डिप्लोयमेन्ट हुकहरू (30 मिनेट)
**उद्देश्य**: प्रि र पोस्ट-डिप्लोयमेन्ट अटोमेसन लागू गर्नु

```bash
# पूर्व-डिप्लॉय मान्यकरण स्क्रिप्ट सिर्जना गर्नुहोस्
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# टेस्टहरू पास भए कि भएन जाँच गर्नुहोस्
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# कमिट नगरिएका परिवर्तनहरू छन् कि छैनन् जाँच गर्नुहोस्
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# डिप्लॉयपछि चलाउने स्मोक टेस्ट सिर्जना गर्नुहोस्
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

# हुकहरूसँग डिप्लॉयमेन्ट परीक्षण गर्नुहोस्
azd deploy
```

**सफलता मापदण्ड:**
- [ ] प्रि-डिप्लोय स्क्रिप्ट परिनियोजन अघि चल्छ
- [ ] परीक्षणहरू असफल भएमा परिनियोजन रोकिन्छ
- [ ] पोस्ट-डिप्लोय स्मोक टेस्टले हेल्थ मान्य गर्दछ
- [ ] हुकहरू सही क्रममा कार्यान्वयन हुन्छन्

### अभ्यास 3: बहु-पर्यावरण परिनियोजन रणनीति (45 मिनेट)
**उद्देश्य**: चरणबद्ध परिनियोजन वर्कफ्लो लागू गर्नु (dev → staging → production)

```bash
# डिप्लोयमेन्ट स्क्रिप्ट बनाउनुहोस्
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# चरण 1: dev मा डिप्लोय गर्नुहोस्
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 2: स्टेजिङमा डिप्लोय गर्नुहोस्
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 3: प्रोडक्शनको लागि म्यानुअल अनुमोदन
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

# पर्यावरणहरू सिर्जना गर्नुहोस्
azd env new dev
azd env new staging
azd env new production

# स्टेज गरिएको डिप्लोयमेन्ट चलाउनुहोस्
./deploy-staged.sh
```

**सफलता मापदण्ड:**
- [ ] Dev वातावरण सफलतापूर्वक परिनियोजन हुन्छ
- [ ] Staging वातावरण सफलतापूर्वक परिनियोजन हुन्छ
- [ ] उत्पादनका लागि म्यानुअल अनुमोदन आवश्यक छ
- [ ] सबै वातावरणहरूसँग काम गर्ने हेल्थ चेकहरू छन्
- [ ] आवश्यक परे रोलब्याक गर्न सकिन्छ

### अभ्यास 4: रोलब्याक रणनीति (25 मिनेट)
**उद्देश्य**: Git प्रयोग गरी परिनियोजन रोलब्याक लागू र परीक्षण गर्नु

```bash
# v1 डिप्लोय गर्नुहोस्
azd env set APP_VERSION "1.0.0"
azd up

# v1 को कमिट ह्यास सुरक्षित गर्नुहोस्
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ब्रेकिंग परिवर्तन सहित v2 डिप्लोय गर्नुहोस्
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
    
    # v1 पुन: डिप्लोय गर्नुहोस्
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**सफलता मापदण्ड:**
- [ ] परिनियोजन असफलताहरू पत्ता लगाउन सक्षम रहन्छ
- [ ] रोलब्याक स्क्रिप्ट स्वचालित रूपमा चल्दछ
- [ ] एप्लिकेशन कार्यरत अवस्थामा फर्किन्छ
- [ ] रोलब्याक पछि हेल्थ चेकहरू पास हुन्छन्

## 📊 परिनियोजन मेट्रिक्स ट्र्याकिङ

### आफ्नो परिनियोजन प्रदर्शन ट्र्याक गर्नुहोस्

```bash
# परिनियोजन मेट्रिक्स स्क्रिप्ट सिर्जना गर्नुहोस्
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

# फाइलमा लग गर्नुहोस्
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# यसलाई प्रयोग गर्नुहोस्
./track-deployment.sh
```

**आफ्ना मेट्रिक्स विश्लेषण गर्नुहोस्:**
```bash
# परिनियोजनको इतिहास हेर्नुहोस्
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
- **Previous Lesson**: [तपाईंको पहिलो परियोजना](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [स्रोतहरू प्रावधान](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौँ, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा असङ्गतिहरू हुन सक्छन्। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी, गलत व्याख्या वा नोक्सानका लागि हामी जिम्मेवार हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->