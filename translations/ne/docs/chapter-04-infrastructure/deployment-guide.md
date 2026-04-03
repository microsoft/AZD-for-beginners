# डिप्लोयमेन्ट गाइड - AZD डिप्लोयमेन्टहरूमा निपुणता हासिल गर्नुहोस्

**अध्याय नेभिगेसन:**
- **📚 कोर्ष गृह**: [शुरुवातीहरूका लागि AZD](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ४ - इन्फ्रास्ट्रक्चर एज कोड र डिप्लोयमेन्ट
- **⬅️ अघिल्लो अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)
- **➡️ अर्को**: [स्रोतहरू तयार पार्ने](provisioning.md)
- **🚀 अर्को अध्याय**: [अध्याय ५: बहु-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)

## परिचय

यो व्यापक गाइडले Azure Developer CLI प्रयोग गरेर अनुप्रयोगहरू डिप्लोय गर्न आवश्यक सबै कुरा समेट्छ, आधारभूत एक-कमान्ड डिप्लोयमेन्टहरूदेखि लिएर अनुकूल हुकहरू, बहु वातावरणहरू, र CI/CD एकीकरण सहित उन्नत उत्पादन परिदृश्यहरूसम्म। व्यवहारिक उदाहरणहरू र उत्कृष्ट अभ्यासहरूसँग पूर्ण डिप्लोयमेन्ट जीवनचक्रमा निपुणता हासिल गर्नुहोस्।

## सिकाइ उद्देश्यहरू

यो गाइड पूरा गर्दा, तपाईंले:
- Azure Developer CLI का सबै डिप्लोयमेन्ट कमाण्डहरू र वर्कफ्लोहरूमा दक्षता हासिल गर्नुहुनेछ
- स्रोत तयार पार्ने देखि निगरानीसम्म सम्पूर्ण डिप्लोयमेन्ट जीवनचक्र बुझ्नुहुनेछ
- पूर्व र पश्च डिप्लोयमेन्ट स्वचालनका लागि अनुकूल हुकहरू कार्यान्वयन गर्नुहुनेछ
- वातावरण-विशिष्ट प्यारामिटरहरूसहित बहु वातावरणहरू कन्फिगर गर्नुहुनेछ
- नीलो-हरियो र क्यानरी डिप्लोयमेन्टहरू सहित उन्नत डिप्लोयमेन्ट रणनीतिहरू सेटअप गर्नुहुनेछ
- azd डिप्लोयमेन्टहरूलाई CI/CD पाइपलाइन र DevOps वर्कफ्लोमा एकीकृत गर्नुहुनेछ

## सिकाइ नतिजाहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- सबै azd डिप्लोयमेन्ट वर्कफ्लोहरू स्वतन्त्र रूपमा चलाउन र समस्या समाधान गर्न
- हुकहरू प्रयोग गरेर अनुकूल डिप्लोयमेन्ट स्वचालन डिजाइन गर्न र कार्यान्वयन गर्न
- उपयुक्त सुरक्षा र निगरानी सहित उत्पादन-तयार डिप्लोयमेन्टहरू कन्फिगर गर्न
- जटिल बहु-पर्यावरण डिप्लोयमेन्ट परिदृश्यहरू सञ्चालन गर्न
- डिप्लोयमेन्ट प्रदर्शन अनुकूलन गर्न र रोलब्याक रणनीतिहरू कार्यान्वयन गर्न
- azd डिप्लोयमेन्टहरूलाई उद्यम DevOps अभ्यासहरूमा एकीकृत गर्न

## डिप्लोयमेन्ट अवलोकन

Azure Developer CLI ले विभिन्न डिप्लोयमेन्ट कमाण्डहरू दिन्छ:
- `azd up` - सम्पूर्ण वर्कफ्लो (स्रोत तयार पार्नु + डिप्लोय गर्नु)
- `azd provision` - Azure स्रोतहरू मात्र सिर्जना/अपडेट गर्नु
- `azd deploy` - अनुप्रयोग कोड मात्र डिप्लोय गर्नु
- `azd package` - अनुप्रयोगहरू निर्माण र प्याकेज गर्नु

## आधारभूत डिप्लोयमेन्ट वर्कफ्लोहरू

### पूर्ण डिप्लोयमेन्ट (azd up)
नयाँ परियोजनाहरूका लागि सबैभन्दा सामान्य वर्कफ्लो:
```bash
# सुरुबाट सबै कुरा परिनियोजन गर्नुहोस्
azd up

# विशिष्ट वातावरणसँग परिनियोजन गर्नुहोस्
azd up --environment production

# कस्टम प्यारामिटरहरूसँग परिनियोजन गर्नुहोस्
azd up --parameter location=westus2 --parameter sku=P1v2
```

### स्रोत मात्र डिप्लोयमेन्ट
जब तपाईंलाई Azure स्रोतहरू मात्र अपडेट गर्न आवश्यक हुन्छ:
```bash
# पूर्वाधार स्थापना/अद्यावधिक गर्नुहोस्
azd provision

# परिवर्तनहरू पूर्वावलोकन गर्न सुक्खा-चलाउने (dry-run)सहित स्थापना गर्नुहोस्
azd provision --preview

# विशिष्ट सेवाहरू स्थापना गर्नुहोस्
azd provision --service database
```

### कोड मात्र डिप्लोयमेन्ट
छिटो अनुप्रयोग अपडेटहरूको लागि:
```bash
# सबै सेवा परिनियोजित गर्नुहोस्
azd deploy

# अपेक्षित परिणाम:
# सेवाहरू परिनियोजित गर्दै (azd deploy)
# - वेब: परिनियोजन हुँदैछ... सकियो
# - एपीआई: परिनियोजन हुँदैछ... सकियो
# सफलता: तपाईंको परिनियोजन २ मिनेट १५ सेकेन्डमा पूरा भयो

# विशिष्ट सेवा परिनियोजित गर्नुहोस्
azd deploy --service web
azd deploy --service api

# अनुकूलित निर्माण तर्कहरूसँग परिनियोजन गर्नुहोस्
azd deploy --service api --build-arg NODE_ENV=production

# परिनियोजन जाँच गर्नुहोस्
azd show --output json | jq '.services'
```

### ✅ डिप्लोयमेन्ट प्रमाणिकरण

कुनै पनि डिप्लोयमेन्ट पछि सफलताको पुष्टि गर्नुहोस्:

```bash
# सबै सेवाहरू चलिरहेको छ भनी जाँच गर्नुहोस्
azd show

# स्वास्थ्य अन्त बिन्दुहरू परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटिहरूको लागि अनुगमन गर्नुहोस् (पूर्वनिर्धारित रूपमा ब्राउजरमा खोलिन्छ)
azd monitor --logs
```

**सफलता मापदण्डहरू:**
- ✅ सबै सेवाहरूले "रनिंग" स्थिति देखाउँछन्
- ✅ हेल्थ एन्डपोइन्टहरूले HTTP 200 फर्काउँछन्
- ✅ पछिल्लो ५ मिनेटमा कुनै त्रुटि लग छैन
- ✅ अनुप्रयोगले परीक्षण अनुरोधहरूमा प्रतिक्रिया दिन्छ

## 🏗️ डिप्लोयमेन्ट प्रक्रिया बुझ्ने

### चरण १: पूर्व-स्रोत तयार पार्ने हुकहरू
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

### चरण २: इन्फ्रास्ट्रक्चर तयार पार्ने
- इन्फ्रास्ट्रक्चर टेम्प्लेटहरू (Bicep/Terraform) पढ्छ
- Azure स्रोतहरू सिर्जना वा अपडेट गर्छ
- नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
- निगरानी र लगिङ सेटअप गर्छ

### चरण ३: पश्च-स्रोत तयार पार्ने हुकहरू
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

### चरण ४: अनुप्रयोग प्याकेजिङ
- अनुप्रयोग कोड निर्माण गर्छ
- डिप्लोयमेन्ट आर्टिफ्याक्टहरू सिर्जना गर्छ
- लक्षित प्लेटफर्मका लागि प्याकेज गर्दछ (कन्टेनर, ZIP फाइलहरू आदि)

### चरण ५: पूर्व-डिप्लोयमेन्ट हुकहरू
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

### चरण ६: अनुप्रयोग डिप्लोयमेन्ट
- प्याकेज गरिएका अनुप्रयोगहरू Azure सेवाहरूमा डिप्लोय गर्दछ
- कन्फिगरेसन सेटिङ्स अपडेट गर्छ
- सेवा सुरु/पुनः सुरु गर्छ

### चरण ७: पश्च-डिप्लोयमेन्ट हुकहरू
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

## 🎛️ डिप्लोयमेन्ट कन्फिगरेसन

### सेवा-विशिष्ट डिप्लोयमेन्ट सेटिङहरू
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

## 🔧 उन्नत डिप्लोयमेन्ट परिदृश्यहरू

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

### नीलो-हरियो डिप्लोयमेन्टहरू
```bash
# नीलो वातावरण सिर्जना गर्नुहोस्
azd env new production-blue
azd up --environment production-blue

# नीलो वातावरण परीक्षण गर्नुहोस्
./scripts/test-environment.sh production-blue

# नीलोमा ट्राफिक स्विच गर्नुहोस् (म्यानुअल DNS/लोड बेलान्सर अपडेट)
./scripts/switch-traffic.sh production-blue

# हरियो वातावरण सफा गर्नुहोस्
azd env select production-green
azd down --force
```

### क्यानरी डिप्लोयमेन्टहरू
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

### चरणबद्ध डिप्लोयमेन्टहरू
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

## 🐳 कन्टेनर डिप्लोयमेन्टहरू

### कन्टेनर एप डिप्लोयमेन्टहरू
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

### सेवा-विशिष्ट डिप्लोयमेन्टहरू
```bash
# छिटो पुनरावृत्तिको लागि विशेष सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy
```

### निर्माण क्याचिङ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### प्रभावकारी कोड डिप्लोयमेन्टहरू
```bash
# कोड-केवल परिवर्तनहरूका लागि azd deploy (azd up होइन) प्रयोग गर्नुहोस्
# यसले पूर्वाधार प्रावधानलाई छोड्छ र धेरै छिटो हुन्छ
azd deploy

# सबैभन्दा छिटो पुनरावृत्तिका लागि विशिष्ट सेवा मात्र तैनाथ गर्नुहोस्
azd deploy --service api
```

## 🔍 डिप्लोयमेन्ट निगरानी

### वास्तविक-समय डिप्लोयमेन्ट निगरानी
```bash
# आवेदनलाई वास्तविक समयमा अनुगमन गर्नुहोस्
azd monitor --live

# आवेदनका लगहरू हेर्नुहोस्
azd monitor --logs

# परिनियोजन स्थिति जाँच गर्नुहोस्
azd show
```

### हेल्थ चेकहरू
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

### पश्च-डिप्लोयमेन्ट प्रमाणीकरण
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# अनुप्रयोग स्वास्थ्य जाँच गर्नुहोस्
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

### गोप्य व्यवस्थापन
```bash
# गोप्य कुरा सुरक्षित रूपमा भण्डारण गर्नुहोस्
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मा गोप्य कुराहरू सन्दर्भ गर्नुहोस्
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
# AZD मा बिल्ट-इन रोलब्याक छैन। सिफारिस गरिएका उपायहरू:

# विकल्प 1: Git बाट पुनः तैनाथ गर्नुहोस् (सिफारिस गरिएको)
git revert HEAD  # समस्याग्रस्त कमिट फिर्ता गर्नुहोस्
git push
azd deploy

# विकल्प 2: विशेष कमिट पुनः तैनाथ गर्नुहोस्
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलब्याक
```bash
# लागू गर्नु अघि पूर्वावलोकन पूर्वाधार परिवर्तनहरू
azd provision --preview

# पूर्वाधार रोलब्याकको लागि, संस्करण नियन्त्रण प्रयोग गर्नुहोस्:
git revert HEAD  # पूर्वाधार परिवर्तनहरू फर्काउने
azd provision    # अघिल्लो पूर्वाधार अवस्था लागू गर्नुहोस्
```

### डाटाबेस माइग्रेशन रोलब्याक
```bash
#!/bin/bash
# स्क्रिप्टहरू/रोलब्याक-डाटाबेस.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 डिप्लोयमेन्ट मेट्रिक्स

### डिप्लोयमेन्ट प्रदर्शन ट्र्याक गर्नुहोस्
```bash
# हालको डिप्लोयमेन्ट स्थिति हेर्नुहोस्
azd show

# एप्लिकेसन इन्साइट्ससँग एप्लिकेसन अनुगमन गर्नुहोस्
azd monitor --overview

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

### अनुकूल मेट्रिक्स सङ्कलन
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

## 🎯 उत्कृष्ट अभ्यासहरू

### १. वातावरण स्थिरता
```bash
# सुसंगत नामकरण प्रयोग गर्नुहोस्
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# वातावरण समानता कायम राख्नुहोस्
./scripts/sync-environments.sh
```

### २. इन्फ्रास्ट्रक्चर प्रमाणीकरण
```bash
# परिनियोजनको अघि पूर्वावलोकन पूर्वाधार परिवर्तनहरू
azd provision --preview

# ARM/Bicep लिंटिङ प्रयोग गर्नुहोस्
az bicep lint --file infra/main.bicep

# Bicep सिन्ट्याक्स मान्य गर्नुहोस्
az bicep build --file infra/main.bicep
```

### ३. परीक्षण एकीकरण
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

### ४. दस्तावेजीकरण र लगिङ
```bash
# कागजात परिनियोजन प्रक्रियाहरू
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## आगामी चरणहरू

- [स्रोतहरू तयार पार्ने](provisioning.md) - इन्फ्रास्ट्रक्चर व्यवस्थापनमा गहिरो अध्ययन
- [पूर्व-डिप्लोयमेन्ट योजना](../chapter-06-pre-deployment/capacity-planning.md) - तपाईँको डिप्लोयमेन्ट रणनीति योजना बनाउनुहोस्
- [सामान्य समस्याहरू](../chapter-07-troubleshooting/common-issues.md) - डिप्लोयमेन्ट समस्याहरू समाधान गर्नुहोस्
- [उत्कृष्ट अभ्यासहरू](../chapter-07-troubleshooting/debugging.md) - उत्पादन-तयार डिप्लोयमेन्ट रणनीतिहरू

## 🎯 हातमा लिने डिप्लोयमेन्ट अभ्यासहरू

### अभ्यास १: वृद्धिमूलक डिप्लोयमेन्ट वर्कफ्लो (२० मिनेट)
**उद्देश्य**: पूर्ण र वृद्धिमूलक डिप्लोयमेन्टहरूबीच भेद निपुण हुनुहोस्

```bash
# सुरुमा तैनाथ गर्नुहोस्
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# सुरुमा तैनाथ समय रेकर्ड गर्नुहोस्
echo "Full deployment: $(date)" > deployment-log.txt

# कोड परिवर्तन गर्नुहोस्
echo "// Updated $(date)" >> src/api/src/server.js

# केवल कोड तैनाथ गर्नुहोस् (छिटो)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# समयहरू तुलना गर्नुहोस्
cat deployment-log.txt

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्डहरू:**
- [ ] पूर्ण डिप्लोयमेन्ट ५-१५ मिनेट लिन्छ
- [ ] कोड मात्र डिप्लोयमेन्ट २-५ मिनेट लिन्छ
- [ ] कोड परिवर्तनहरू डिप्लोय गरिएको एपमा परिलक्षित छन्
- [ ] `azd deploy` पछि इन्फ्रास्ट्रक्चर अपरिवर्तित छ

**सिकाइ नतिजा**: कोड परिवर्तनहरूका लागि `azd deploy` `azd up` भन्दा ५०-७०% छिटो छ

### अभ्यास २: अनुकूल डिप्लोयमेन्ट हुकहरू (३० मिनेट)
**उद्देश्य**: पूर्व र पश्च-डिप्लोयमेन्ट स्वचालन कार्यान्वयन गर्नुहोस्

```bash
# पूर्व-डिप्लोय प्रमाणीकरण स्क्रिप्ट सिर्जना गर्नुहोस्
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# परीक्षणहरू पास भए कि छैन जाँच गर्नुहोस्
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# कमिट नभएका परिवर्तनहरू जाँच गर्नुहोस्
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# पोस्ट-डिप्लोय स्मोक परीक्षण सिर्जना गर्नुहोस्
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

**सफलता मापदण्डहरू:**
- [ ] पूर्व-डिप्लोय स्क्रिप्ट डिप्लोयमेन्ट अघि चल्छ
- [ ] परीक्षण असफल भएमा डिप्लोयमेन्ट रोकिन्छ
- [ ] पश्च-डिप्लोय स्मोक टेस्ट स्वास्थ्य प्रमाणित गर्छ
- [ ] हुकहरू सही क्रममा कार्यान्वयन हुन्छन्

### अभ्यास ३: बहु-वातावरण डिप्लोयमेन्ट रणनीति (४५ मिनेट)
**उद्देश्य**: चरणबद्ध डिप्लोयमेन्ट वर्कफ्लो कार्यान्वयन गर्नुहोस् (डेभ → स्टेजिङ → उत्पादन)

```bash
# डिप्लोयमेन्ट स्क्रिप्ट बनाउनुहोस्
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# चरण १: डेभमा डिप्लोय गर्नुहोस्
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण २: स्टेजिङमा डिप्लोय गर्नुहोस्
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण ३: प्रोडक्सनका लागि म्यानुअल अनुमोदन
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

# स्टेज गरिएको डिप्लोयमेन्ट चलाउनुहोस्
./deploy-staged.sh
```

**सफलता मापदण्डहरू:**
- [ ] डेभ वातावरण सफलतापूर्वक डिप्लोय हुन्छ
- [ ] स्टेजिङ वातावरण सफलतापूर्वक डिप्लोय हुन्छ
- [ ] उत्पादनका लागि म्यानुअल अनुमोदन आवश्यक छ
- [ ] सबै वातावरणमा कार्यरत हेल्थ चेकहरू छन्
- [ ] आवश्यक परेको खण्डमा रोलब्याक गर्न सकिन्छ

### अभ्यास ४: रोलब्याक रणनीति (२५ मिनेट)
**उद्देश्य**: Git प्रयोग गरेर डिप्लोयमेन्ट रोलब्याक कार्यान्वयन र परीक्षण गर्नुहोस्

```bash
# v1 तैनात गर्नुहोस्
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट ह्यास सुरक्षित गर्नुहोस्
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ब्रेकिंग परिवर्तन सहित v2 तैनात गर्नुहोस्
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# असफलता पत्ता लगाउनुहोस् र रोलब्याक गर्नुहोस्
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git प्रयोग गरेर रोलब्याक गर्नुहोस्
    git revert HEAD --no-edit
    
    # वातावरण रोलब्याक गर्नुहोस्
    azd env set APP_VERSION "1.0.0"
    
    # v1 पुन: तैनात गर्नुहोस्
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**सफलता मापदण्डहरू:**
- [ ] डिप्लोयमेन्ट असफलता पत्ता लगाउन सकिन्छ
- [ ] रोलब्याक स्क्रिप्ट स्वचालित रूपमा चल्छ
- [ ] अनुप्रयोग कार्यरत अवस्थामा फर्किन्छ
- [ ] रोलब्याक पछि हेल्थ चेक पास हुन्छ

## 📊 डिप्लोयमेन्ट मेट्रिक्स ट्र्याकिङ

### आफ्नो डिप्लोयमेन्ट प्रदर्शन ट्र्याक गर्नुहोस्

```bash
# डिप्लोइमेन्ट मेट्रिक्स स्क्रिप्ट बनाउनुहोस्
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

# फाइलमा लग गर्नुहोस्
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# यसलाई प्रयोग गर्नुहोस्
./track-deployment.sh
```

**आफ्नो मेट्रिक्स विश्लेषण गर्नुहोस्:**
```bash
# वितरण इतिहास हेर्नुहोस्
cat deployment-metrics.csv

# औसत वितरण समय गणना गर्नुहोस्
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## थप स्रोतहरू

- [Azure Developer CLI डिप्लोयमेन्ट सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service डिप्लोयमेन्ट](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps डिप्लोयमेन्ट](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions डिप्लोयमेन्ट](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [तपाईंको पहिलो परियोजना](../chapter-01-foundation/first-project.md)
- **अर्को पाठ**: [स्रोतहरू तयार पार्ने](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यस दस्तावेजलाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) को प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयत्न गर्छौं, तर कृपया जानकार हुनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा असत्यताहरू हुन सक्छन्। मूल दस्तावेज यसको स्वदेशी भाषामा अधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, पेशेवर मानव अनुवादको सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->