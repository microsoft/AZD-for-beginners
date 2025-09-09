<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T17:01:26+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "hi"
}
-->
# परिनियोजन गाइड - AZD परिनियोजन में महारत हासिल करें

## परिचय

यह व्यापक गाइड आपको Azure Developer CLI का उपयोग करके एप्लिकेशन परिनियोजन के बारे में सब कुछ सिखाएगा, जिसमें एकल-कमांड परिनियोजन से लेकर कस्टम हुक, कई वातावरण, और CI/CD एकीकरण के साथ उन्नत उत्पादन परिदृश्य शामिल हैं। व्यावहारिक उदाहरणों और सर्वोत्तम प्रथाओं के साथ परिनियोजन जीवनचक्र को पूरी तरह से समझें।

## सीखने के लक्ष्य

इस गाइड को पूरा करने के बाद, आप:
- Azure Developer CLI परिनियोजन कमांड और वर्कफ़्लो में महारत हासिल करेंगे
- परिनियोजन जीवनचक्र को संसाधन प्रावधान से लेकर निगरानी तक समझेंगे
- पूर्व और पोस्ट-परिनियोजन स्वचालन के लिए कस्टम हुक लागू करेंगे
- वातावरण-विशिष्ट पैरामीटर के साथ कई वातावरण कॉन्फ़िगर करेंगे
- उन्नत परिनियोजन रणनीतियाँ जैसे ब्लू-ग्रीन और कैनरी परिनियोजन सेट करेंगे
- azd परिनियोजन को CI/CD पाइपलाइनों और DevOps वर्कफ़्लो के साथ एकीकृत करेंगे

## सीखने के परिणाम

गाइड पूरा करने के बाद, आप सक्षम होंगे:
- azd परिनियोजन वर्कफ़्लो को स्वतंत्र रूप से निष्पादित और समस्या निवारण करेंगे
- कस्टम परिनियोजन स्वचालन डिज़ाइन और लागू करेंगे
- उचित सुरक्षा और निगरानी के साथ उत्पादन-तैयार परिनियोजन कॉन्फ़िगर करेंगे
- जटिल बहु-वातावरण परिनियोजन परिदृश्यों का प्रबंधन करेंगे
- परिनियोजन प्रदर्शन को अनुकूलित करेंगे और रोलबैक रणनीतियाँ लागू करेंगे
- azd परिनियोजन को एंटरप्राइज़ DevOps प्रथाओं में एकीकृत करेंगे

## परिनियोजन का अवलोकन

Azure Developer CLI कई परिनियोजन कमांड प्रदान करता है:
- `azd up` - पूर्ण वर्कफ़्लो (प्रावधान + परिनियोजन)
- `azd provision` - केवल Azure संसाधन बनाना/अपडेट करना
- `azd deploy` - केवल एप्लिकेशन कोड परिनियोजित करना
- `azd package` - एप्लिकेशन बनाना और पैकेज करना

## बुनियादी परिनियोजन वर्कफ़्लो

### पूर्ण परिनियोजन (azd up)
नए प्रोजेक्ट्स के लिए सबसे सामान्य वर्कफ़्लो:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### केवल इंफ्रास्ट्रक्चर परिनियोजन
जब आपको केवल Azure संसाधनों को अपडेट करने की आवश्यकता हो:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### केवल कोड परिनियोजन
त्वरित एप्लिकेशन अपडेट के लिए:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ परिनियोजन प्रक्रिया को समझना

### चरण 1: पूर्व-प्रावधान हुक
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

### चरण 2: इंफ्रास्ट्रक्चर प्रावधान
- इंफ्रास्ट्रक्चर टेम्पलेट्स (Bicep/Terraform) पढ़ता है
- Azure संसाधन बनाता या अपडेट करता है
- नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- निगरानी और लॉगिंग सेट करता है

### चरण 3: पोस्ट-प्रावधान हुक
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
- परिनियोजन आर्टिफैक्ट बनाता है
- लक्षित प्लेटफ़ॉर्म (कंटेनर, ZIP फ़ाइलें, आदि) के लिए पैकेज करता है

### चरण 5: पूर्व-परिनियोजन हुक
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

### चरण 6: एप्लिकेशन परिनियोजन
- पैकेज किए गए एप्लिकेशन को Azure सेवाओं में परिनियोजित करता है
- कॉन्फ़िगरेशन सेटिंग्स अपडेट करता है
- सेवाओं को शुरू/पुनः शुरू करता है

### चरण 7: पोस्ट-परिनियोजन हुक
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

## 🎛️ परिनियोजन कॉन्फ़िगरेशन

### सेवा-विशिष्ट परिनियोजन सेटिंग्स
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

### वातावरण-विशिष्ट कॉन्फ़िगरेशन
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 उन्नत परिनियोजन परिदृश्य

### बहु-सेवा एप्लिकेशन
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

### ब्लू-ग्रीन परिनियोजन
```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### कैनरी परिनियोजन
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

## 🐳 कंटेनर परिनियोजन

### कंटेनर ऐप परिनियोजन
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

### समानांतर परिनियोजन
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### बिल्ड कैशिंग
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### वृद्धिशील परिनियोजन
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 परिनियोजन निगरानी

### वास्तविक समय परिनियोजन निगरानी
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### स्वास्थ्य जांच
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

### पोस्ट-परिनियोजन सत्यापन
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Check application health
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

### गुप्त प्रबंधन
```bash
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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

### पहचान और पहुंच प्रबंधन
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### इंफ्रास्ट्रक्चर रोलबैक
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
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

## 📊 परिनियोजन मीट्रिक्स

### परिनियोजन प्रदर्शन ट्रैक करें
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### कस्टम मीट्रिक्स संग्रह
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

### 1. वातावरण स्थिरता
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. इंफ्रास्ट्रक्चर सत्यापन
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
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

### 4. दस्तावेज़ीकरण और लॉगिंग
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अगले चरण

- [संसाधन प्रावधान](provisioning.md) - इंफ्रास्ट्रक्चर प्रबंधन पर गहराई से जानकारी
- [पूर्व-परिनियोजन योजना](../pre-deployment/capacity-planning.md) - अपनी परिनियोजन रणनीति की योजना बनाएं
- [सामान्य समस्याएँ](../troubleshooting/common-issues.md) - परिनियोजन समस्याओं का समाधान करें
- [सर्वोत्तम प्रथाएँ](../troubleshooting/debugging.md) - उत्पादन-तैयार परिनियोजन रणनीतियाँ

## अतिरिक्त संसाधन

- [Azure Developer CLI परिनियोजन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service परिनियोजन](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps परिनियोजन](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions परिनियोजन](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेविगेशन**
- **पिछला पाठ**: [आपका पहला प्रोजेक्ट](../getting-started/first-project.md)
- **अगला पाठ**: [संसाधन प्रावधान](provisioning.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।