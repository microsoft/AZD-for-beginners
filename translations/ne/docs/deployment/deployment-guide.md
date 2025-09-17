<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T20:02:49+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ne"
}
-->
# डिप्लोयमेन्ट गाइड - AZD डिप्लोयमेन्टमा महारथ हासिल गर्नुहोस्

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय ४ - कोड र डिप्लोयमेन्टको रूपमा पूर्वाधार
- **⬅️ अघिल्लो अध्याय**: [अध्याय ३: कन्फिगरेसन](../getting-started/configuration.md)
- **➡️ अगाडि**: [स्रोतहरू प्रोभिजन गर्नु](provisioning.md)
- **🚀 अर्को अध्याय**: [अध्याय ५: मल्टी-एजेन्ट एआई समाधानहरू](../../examples/retail-scenario.md)

## परिचय

यो विस्तृत गाइडले Azure Developer CLI प्रयोग गरेर एप्लिकेसनहरू डिप्लोय गर्ने प्रक्रियाको बारेमा सबै जानकारी समेट्छ। यसमा आधारभूत एक-कमाण्ड डिप्लोयमेन्टदेखि लिएर उत्पादन स्तरका परिदृश्यहरू, कस्टम हुकहरू, बहु-पर्यावरणहरू, र CI/CD एकीकरणसम्मका विषयहरू समेटिएका छन्। व्यावहारिक उदाहरणहरू र उत्कृष्ट अभ्यासहरूको साथमा डिप्लोयमेन्ट जीवनचक्रलाई पूर्ण रूपमा बुझ्नुहोस्।

## सिक्ने लक्ष्यहरू

यो गाइड पूरा गरेपछि, तपाईं:
- Azure Developer CLI का सबै डिप्लोयमेन्ट कमाण्डहरू र वर्कफ्लोहरूमा महारथ हासिल गर्नुहुनेछ
- प्रोभिजनिङदेखि निगरानीसम्मको सम्पूर्ण डिप्लोयमेन्ट जीवनचक्र बुझ्नुहुनेछ
- पूर्व र पोस्ट-डिप्लोयमेन्ट स्वचालनका लागि कस्टम हुकहरू कार्यान्वयन गर्नुहुनेछ
- पर्यावरण-विशिष्ट प्यारामिटरहरूसहित बहु-पर्यावरणहरू कन्फिगर गर्नुहुनेछ
- ब्लू-ग्रीन र क्यानरी डिप्लोयमेन्ट जस्ता उन्नत रणनीतिहरू सेटअप गर्नुहुनेछ
- azd डिप्लोयमेन्टलाई CI/CD पाइपलाइन र DevOps वर्कफ्लोहरूसँग एकीकृत गर्नुहुनेछ

## सिक्ने परिणामहरू

गाइड पूरा गरेपछि, तपाईं:
- स्वतन्त्र रूपमा सबै azd डिप्लोयमेन्ट वर्कफ्लोहरू कार्यान्वयन र समस्या समाधान गर्न सक्षम हुनुहुनेछ
- कस्टम डिप्लोयमेन्ट स्वचालन डिजाइन र कार्यान्वयन गर्न सक्षम हुनुहुनेछ
- उचित सुरक्षा र निगरानीसहित उत्पादन-तयार डिप्लोयमेन्ट कन्फिगर गर्न सक्षम हुनुहुनेछ
- जटिल बहु-पर्यावरण डिप्लोयमेन्ट परिदृश्यहरू व्यवस्थापन गर्न सक्षम हुनुहुनेछ
- डिप्लोयमेन्ट प्रदर्शनलाई अनुकूलित गर्न र रोलब्याक रणनीतिहरू कार्यान्वयन गर्न सक्षम हुनुहुनेछ
- azd डिप्लोयमेन्टलाई उद्यम DevOps अभ्यासहरूमा एकीकृत गर्न सक्षम हुनुहुनेछ

## डिप्लोयमेन्ट अवलोकन

Azure Developer CLI ले विभिन्न डिप्लोयमेन्ट कमाण्डहरू प्रदान गर्दछ:
- `azd up` - पूर्ण वर्कफ्लो (प्रोभिजन + डिप्लोय)
- `azd provision` - Azure स्रोतहरू सिर्जना/अपडेट मात्र
- `azd deploy` - एप्लिकेसन कोड मात्र डिप्लोय गर्नुहोस्
- `azd package` - एप्लिकेसनहरू निर्माण र प्याकेज गर्नुहोस्

## आधारभूत डिप्लोयमेन्ट वर्कफ्लोहरू

### पूर्ण डिप्लोयमेन्ट (azd up)
नयाँ प्रोजेक्टहरूको लागि सबैभन्दा सामान्य वर्कफ्लो:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### पूर्वाधार मात्र डिप्लोयमेन्ट
जब तपाईंलाई केवल Azure स्रोतहरू अपडेट गर्न आवश्यक छ:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### कोड मात्र डिप्लोयमेन्ट
द्रुत एप्लिकेसन अपडेटहरूको लागि:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ डिप्लोयमेन्ट प्रक्रियाको समझ

### चरण १: पूर्व-प्रोभिजन हुकहरू
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

### चरण २: पूर्वाधार प्रोभिजनिङ
- पूर्वाधार टेम्प्लेटहरू (Bicep/Terraform) पढ्छ
- Azure स्रोतहरू सिर्जना वा अपडेट गर्दछ
- नेटवर्किङ र सुरक्षा कन्फिगर गर्दछ
- निगरानी र लगिङ सेटअप गर्दछ

### चरण ३: पोस्ट-प्रोभिजन हुकहरू
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

### चरण ४: एप्लिकेसन प्याकेजिङ
- एप्लिकेसन कोड निर्माण गर्दछ
- डिप्लोयमेन्ट आर्टिफ्याक्टहरू सिर्जना गर्दछ
- लक्षित प्लेटफर्मका लागि प्याकेज गर्दछ (कन्टेनरहरू, ZIP फाइलहरू, आदि)

### चरण ५: पूर्व-डिप्लोय हुकहरू
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

### चरण ६: एप्लिकेसन डिप्लोयमेन्ट
- प्याकेज गरिएका एप्लिकेसनहरू Azure सेवाहरूमा डिप्लोय गर्दछ
- कन्फिगरेसन सेटिङहरू अपडेट गर्दछ
- सेवाहरू सुरु/पुनः सुरु गर्दछ

### चरण ७: पोस्ट-डिप्लोय हुकहरू
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

### पर्यावरण-विशिष्ट कन्फिगरेसनहरू
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

## 🔧 उन्नत डिप्लोयमेन्ट परिदृश्यहरू

### बहु-सेवा एप्लिकेसनहरू
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

### ब्लू-ग्रीन डिप्लोयमेन्टहरू
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

### मल्टी-स्टेज Dockerfile अनुकूलन
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

### समानान्तर डिप्लोयमेन्टहरू
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### निर्माण क्यासिङ
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

### वृद्धिशील डिप्लोयमेन्टहरू
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 डिप्लोयमेन्ट निगरानी

### वास्तविक-समय डिप्लोयमेन्ट निगरानी
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
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

### पोस्ट-डिप्लोयमेन्ट मान्यता
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

## 🔐 सुरक्षा विचारहरू

### गोप्य व्यवस्थापन
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

### द्रुत रोलब्याक
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### पूर्वाधार रोलब्याक
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
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

## 📊 डिप्लोयमेन्ट मेट्रिक्स

### डिप्लोयमेन्ट प्रदर्शन ट्र्याक गर्नुहोस्
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
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

## 🎯 उत्कृष्ट अभ्यासहरू

### १. पर्यावरण स्थिरता
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### २. पूर्वाधार मान्यता
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अगाडि के गर्ने

- [स्रोतहरू प्रोभिजन गर्नु](provisioning.md) - पूर्वाधार व्यवस्थापनमा गहिरो अध्ययन
- [पूर्व-डिप्लोयमेन्ट योजना](../pre-deployment/capacity-planning.md) - आफ्नो डिप्लोयमेन्ट रणनीति योजना बनाउनुहोस्
- [सामान्य समस्याहरू](../troubleshooting/common-issues.md) - डिप्लोयमेन्ट समस्याहरू समाधान गर्नुहोस्
- [उत्कृष्ट अभ्यासहरू](../troubleshooting/debugging.md) - उत्पादन-तयार डिप्लोयमेन्ट रणनीतिहरू

## अतिरिक्त स्रोतहरू

- [Azure Developer CLI डिप्लोयमेन्ट सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service डिप्लोयमेन्ट](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps डिप्लोयमेन्ट](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions डिप्लोयमेन्ट](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [तपाईंको पहिलो प्रोजेक्ट](../getting-started/first-project.md)
- **अर्को पाठ**: [स्रोतहरू प्रोभिजन गर्नु](provisioning.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।