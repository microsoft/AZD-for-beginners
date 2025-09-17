<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T19:44:11+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "mr"
}
-->
# डिप्लॉयमेंट मार्गदर्शक - AZD डिप्लॉयमेंट्समध्ये प्रावीण्य मिळवा

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 4 - कोड आणि डिप्लॉयमेंटसाठी इन्फ्रास्ट्रक्चर
- **⬅️ मागील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../getting-started/configuration.md)
- **➡️ पुढे**: [संसाधनांची व्यवस्था](provisioning.md)
- **🚀 पुढील अध्याय**: [अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)

## परिचय

ही व्यापक मार्गदर्शिका Azure Developer CLI वापरून अॅप्लिकेशन्स डिप्लॉय करण्याच्या प्रक्रियेबद्दल सर्वकाही कव्हर करते, साध्या सिंगल-कमांड डिप्लॉयमेंटपासून ते कस्टम हुक्स, एकाधिक वातावरण, आणि CI/CD एकत्रीकरणासह प्रगत उत्पादन परिस्थितीपर्यंत. व्यावहारिक उदाहरणे आणि सर्वोत्तम पद्धतींसह संपूर्ण डिप्लॉयमेंट जीवनचक्रात प्रावीण्य मिळवा.

## शिकण्याची उद्दिष्टे

ही मार्गदर्शिका पूर्ण करून, तुम्ही:
- Azure Developer CLI च्या सर्व डिप्लॉयमेंट कमांड्स आणि वर्कफ्लोमध्ये प्रावीण्य मिळवाल
- संसाधन व्यवस्थापनापासून ते मॉनिटरिंगपर्यंत संपूर्ण डिप्लॉयमेंट जीवनचक्र समजून घ्याल
- प्री आणि पोस्ट-डिप्लॉयमेंट ऑटोमेशनसाठी कस्टम हुक्स अंमलात आणाल
- वातावरण-विशिष्ट पॅरामीटर्ससह एकाधिक वातावरण कॉन्फिगर कराल
- ब्लू-ग्रीन आणि कॅनरी डिप्लॉयमेंटसह प्रगत डिप्लॉयमेंट रणनीती सेट कराल
- azd डिप्लॉयमेंट्सला CI/CD पाइपलाइन्स आणि DevOps वर्कफ्लोमध्ये एकत्रित कराल

## शिकण्याचे परिणाम

ही मार्गदर्शिका पूर्ण केल्यानंतर, तुम्ही:
- सर्व azd डिप्लॉयमेंट वर्कफ्लो स्वतंत्रपणे अंमलात आणू आणि त्यातील अडचणी सोडवू शकाल
- कस्टम डिप्लॉयमेंट ऑटोमेशन डिझाइन आणि अंमलात आणू शकाल
- योग्य सुरक्षा आणि मॉनिटरिंगसह उत्पादन-तयार डिप्लॉयमेंट्स कॉन्फिगर करू शकाल
- जटिल मल्टी-वातावरण डिप्लॉयमेंट परिस्थिती व्यवस्थापित करू शकाल
- डिप्लॉयमेंट कार्यक्षमता ऑप्टिमाइझ करू आणि रोलबॅक रणनीती अंमलात आणू शकाल
- azd डिप्लॉयमेंट्सला एंटरप्राइझ DevOps पद्धतींमध्ये एकत्रित करू शकाल

## डिप्लॉयमेंटचा आढावा

Azure Developer CLI अनेक डिप्लॉयमेंट कमांड्स प्रदान करते:
- `azd up` - संपूर्ण वर्कफ्लो (प्रोव्हिजन + डिप्लॉय)
- `azd provision` - फक्त Azure संसाधने तयार/अपडेट करा
- `azd deploy` - फक्त अॅप्लिकेशन कोड डिप्लॉय करा
- `azd package` - अॅप्लिकेशन्स बिल्ड आणि पॅकेज करा

## मूलभूत डिप्लॉयमेंट वर्कफ्लो

### संपूर्ण डिप्लॉयमेंट (azd up)
नवीन प्रोजेक्ट्ससाठी सर्वात सामान्य वर्कफ्लो:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### फक्त इन्फ्रास्ट्रक्चर डिप्लॉयमेंट
जेव्हा तुम्हाला फक्त Azure संसाधने अपडेट करायची असतात:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### फक्त कोड डिप्लॉयमेंट
जलद अॅप्लिकेशन अपडेट्ससाठी:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ डिप्लॉयमेंट प्रक्रिया समजून घेणे

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
- इन्फ्रास्ट्रक्चर टेम्पलेट्स (Bicep/Terraform) वाचतो
- Azure संसाधने तयार किंवा अपडेट करतो
- नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
- मॉनिटरिंग आणि लॉगिंग सेट करतो

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

### टप्पा 4: अॅप्लिकेशन पॅकेजिंग
- अॅप्लिकेशन कोड बिल्ड करतो
- डिप्लॉयमेंट आर्टिफॅक्ट्स तयार करतो
- लक्ष्य प्लॅटफॉर्मसाठी पॅकेज करतो (कंटेनर्स, ZIP फाइल्स, इ.)

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

### टप्पा 6: अॅप्लिकेशन डिप्लॉयमेंट
- पॅकेज केलेले अॅप्लिकेशन्स Azure सेवांवर डिप्लॉय करतो
- कॉन्फिगरेशन सेटिंग्ज अपडेट करतो
- सेवांना सुरू/पुन्हा सुरू करतो

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

## 🎛️ डिप्लॉयमेंट कॉन्फिगरेशन

### सेवा-विशिष्ट डिप्लॉयमेंट सेटिंग्ज
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

### वातावरण-विशिष्ट कॉन्फिगरेशन्स
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

## 🔧 प्रगत डिप्लॉयमेंट परिस्थिती

### मल्टी-सेवा अॅप्लिकेशन्स
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

### ब्लू-ग्रीन डिप्लॉयमेंट्स
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

### कॅनरी डिप्लॉयमेंट्स
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

### स्टेज्ड डिप्लॉयमेंट्स
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

## 🐳 कंटेनर डिप्लॉयमेंट्स

### कंटेनर अॅप डिप्लॉयमेंट्स
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

### समांतर डिप्लॉयमेंट्स
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### बिल्ड कॅशिंग
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

### इनक्रिमेंटल डिप्लॉयमेंट्स
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 डिप्लॉयमेंट मॉनिटरिंग

### रिअल-टाइम डिप्लॉयमेंट मॉनिटरिंग
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
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

### सीक्रेट्स व्यवस्थापन
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

## 🚨 रोलबॅक रणनीती

### जलद रोलबॅक
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### इन्फ्रास्ट्रक्चर रोलबॅक
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### डेटाबेस मायग्रेशन रोलबॅक
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

### डिप्लॉयमेंट कार्यक्षमता ट्रॅक करा
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
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

### 1. वातावरण सुसंगतता
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर व्हॅलिडेशन
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. टेस्टिंग इंटिग्रेशन
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## पुढील पायऱ्या

- [संसाधनांची व्यवस्था](provisioning.md) - इन्फ्रास्ट्रक्चर व्यवस्थापनाचा सखोल अभ्यास
- [प्री-डिप्लॉयमेंट नियोजन](../pre-deployment/capacity-planning.md) - तुमची डिप्लॉयमेंट रणनीती नियोजित करा
- [सामान्य समस्या](../troubleshooting/common-issues.md) - डिप्लॉयमेंट समस्यांचे निराकरण करा
- [सर्वोत्तम पद्धती](../troubleshooting/debugging.md) - उत्पादन-तयार डिप्लॉयमेंट रणनीती

## अतिरिक्त संसाधने

- [Azure Developer CLI डिप्लॉयमेंट संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service डिप्लॉयमेंट](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps डिप्लॉयमेंट](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions डिप्लॉयमेंट](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेव्हिगेशन**
- **मागील धडा**: [तुमचा पहिला प्रोजेक्ट](../getting-started/first-project.md)
- **पुढील धडा**: [संसाधनांची व्यवस्था](provisioning.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.