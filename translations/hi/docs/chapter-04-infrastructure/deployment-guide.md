# तैनाती मार्गदर्शिका - AZD तैनाती में महारत

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

यह## तैनाती प्रक्रिया की समझसम्पूर्ण मार्गदर्शिका वह सब कुछ कवर करती है जो आपको Azure Developer CLI का उपयोग करके एप्लिकेशन तैनात करने के बारे में जानना आवश्यक है, सरल एक-कमांड तैनाती से लेकर कस्टम हुक, कई वातावरण, और CI/CD एकीकरण के साथ उन्नत प्रोडक्शन परिदृश्यों तक। व्यावहारिक उदाहरणों और सर्वोत्तम प्रथाओं के साथ पूरे तैनाती जीवनचक्र में महारत हासिल करें।

## Learning Goals

By completing this guide, you will:
- Master all Azure Developer CLI deployment commands and workflows
- Understand the complete deployment lifecycle from provisioning to monitoring
- Implement custom deployment hooks for pre and post-deployment automation
- Configure multiple environments with environment-specific parameters
- Set up advanced deployment strategies including blue-green and canary deployments
- Integrate azd deployments with CI/CD pipelines and DevOps workflows

## Learning Outcomes

Upon completion, you will be able to:
- Execute and troubleshoot all azd deployment workflows independently
- Design and implement custom deployment automation using hooks
- Configure production-ready deployments with proper security and monitoring
- Manage complex multi-environment deployment scenarios
- Optimize deployment performance and implement rollback strategies
- Integrate azd deployments into enterprise DevOps practices

## Deployment Overview

Azure Developer CLI provides several deployment commands:
- `azd up` - संपूर्ण कार्यप्रवाह (प्राविजन + तैनाती)
- `azd provision` - केवल Azure संसाधन बनाना/अपडेट करना
- `azd deploy` - केवल एप्लिकेशन कोड तैनात करना
- `azd package` - एप्लिकेशन बनाना और पैकेज करना

## Basic Deployment Workflows

### Complete Deployment (azd up)
The most common workflow for new projects:
```bash
# शुरुआत से सब कुछ तैनात करें
azd up

# विशिष्ट वातावरण के साथ तैनात करें
azd up --environment production

# कस्टम पैरामीटरों के साथ तैनात करें
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
When you only need to update Azure resources:
```bash
# इन्फ्रास्ट्रक्चर का प्रावधान/अपडेट
azd provision

# परिवर्तनों का पूर्वावलोकन करने के लिए ड्राई-रन के साथ प्रावधान
azd provision --preview

# विशिष्ट सेवाओं का प्रावधान
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# सभी सेवाओं को तैनात करें
azd deploy

# अपेक्षित आउटपुट:
# सेवाएँ तैनात की जा रही हैं (azd deploy)
# - web: तैनात किया जा रहा है... हो गया
# - api: तैनात किया जा रहा है... हो गया
# सफलता: आपकी तैनाती 2 मिनट 15 सेकंड में पूरी हुई

# विशिष्ट सेवा तैनात करें
azd deploy --service web
azd deploy --service api

# कस्टम बिल्ड तर्कों के साथ तैनात करें
azd deploy --service api --build-arg NODE_ENV=production

# तैनाती सत्यापित करें
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, verify success:

```bash
# सुनिश्चित करें कि सभी सेवाएँ चल रही हैं
azd show

# हेल्थ एंडपॉइंट्स का परीक्षण करें
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटियों के लिए निगरानी करें (डिफ़ॉल्ट रूप से ब्राउज़र में खुलता है)
azd monitor --logs
```

**Success Criteria:**
- ✅ सभी सेवाओं की स्थिति "Running" दिखनी चाहिए
- ✅ Health endpoints HTTP 200 लौटाएँ
- ✅ पिछले 5 मिनट में कोई एरर लॉग नहीं
- ✅ एप्लिकेशन टेस्ट अनुरोधों का जवाब दे रहा है

## 🏗️ Understanding the Deployment Process

### Phase 1: Pre-Provision Hooks
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

### Phase 2: Infrastructure Provisioning
- इंफ्रास्ट्रक्चर टेम्पलेट्स पढ़ता है (Bicep/Terraform)
- Azure संसाधन बनाता या अपडेट करता है
- नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- मॉनिटरिंग और लॉगिंग सेटअप करता है

### Phase 3: Post-Provision Hooks
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

### Phase 4: Application Packaging
- एप्लिकेशन कोड का बिल्ड करता है
- तैनाती आर्टिफैक्ट बनाता है
- लक्ष्य प्लेटफ़ॉर्म के लिए पैकेज करता है (कंटेनर, ZIP फाइलें, आदि)

### Phase 5: Pre-Deploy Hooks
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

### Phase 6: Application Deployment
- पैकेज किए गए एप्लिकेशन को Azure सेवाओं पर तैनात करता है
- कॉन्फ़िगरेशन सेटिंग्स अपडेट करता है
- सेवाओं को शुरू/रीस्टार्ट करता है

### Phase 7: Post-Deploy Hooks
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

## 🎛️ Deployment Configuration

### Service-Specific Deployment Settings
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

### Environment-Specific Configurations
```bash
# विकास पर्यावरण
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# स्टेजिंग पर्यावरण
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# उत्पादन पर्यावरण
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Advanced Deployment Scenarios

### Multi-Service Applications
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

### Blue-Green Deployments
```bash
# नीला पर्यावरण बनाएं
azd env new production-blue
azd up --environment production-blue

# नीले पर्यावरण का परीक्षण करें
./scripts/test-environment.sh production-blue

# ट्रैफ़िक को नीले पर्यावरण पर स्विच करें (मैन्युअल DNS/लोड बैलेंसर अपडेट)
./scripts/switch-traffic.sh production-blue

# हरे पर्यावरण को साफ़ करें
azd env select production-green
azd down --force
```

### Canary Deployments
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

### Staged Deployments
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

## 🐳 Container Deployments

### Container App Deployments
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

### Multi-Stage Dockerfile Optimization
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

## ⚡ Performance Optimization

### Service-Specific Deployments
```bash
# तेज़ पुनरावृत्ति के लिए किसी विशिष्ट सेवा को तैनात करें
azd deploy --service web
azd deploy --service api

# सभी सेवाओं को तैनात करें
azd deploy
```

### Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efficient Code Deployments
```bash
# केवल कोड-परिवर्तनों के लिए azd deploy (azd up नहीं) का उपयोग करें
# यह इन्फ्रास्ट्रक्चर प्राविजनिंग को छोड़ देता है और बहुत तेज़ है
azd deploy

# सबसे तेज़ पुनरावृत्ति के लिए किसी विशिष्ट सेवा को डिप्लॉय करें
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# एप्लिकेशन की वास्तविक-समय निगरानी करें
azd monitor --live

# एप्लिकेशन के लॉग देखें
azd monitor --logs

# तैनाती की स्थिति जाँचें
azd show
```

### Health Checks
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

### Post-Deployment Validation
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

## 🔐 Security Considerations

### Secrets Management
```bash
# गुप्त जानकारी सुरक्षित रूप से संग्रहीत करें
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml में गुप्त जानकारी का संदर्भ दें
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

### Network Security
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity and Access Management
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

## 🚨 Rollback Strategies

### Quick Rollback
```bash
# AZD में बिल्ट-इन रोलबैक नहीं है। सुझाए गए तरीके:

# विकल्प 1: Git से पुनः तैनात करें (अनुशंसित)
git revert HEAD  # समस्या वाले कमिट को पूर्ववत करें
git push
azd deploy

# विकल्प 2: विशिष्ट कमिट को पुनः तैनात करें
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# लागू करने से पहले बुनियादी ढांचे में किए गए परिवर्तनों का पूर्वावलोकन करें
azd provision --preview

# बुनियादी ढांचे को रोलबैक करने के लिए, संस्करण नियंत्रण का उपयोग करें:
git revert HEAD  # बुनियादी ढांचे में किए गए परिवर्तनों को पूर्ववत करें
azd provision    # बुनियादी ढांचे की पिछली स्थिति लागू करें
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Track Deployment Performance
```bash
# वर्तमान तैनाती की स्थिति देखें
azd show

# Application Insights के साथ एप्लिकेशन की निगरानी करें
azd monitor --overview

# लाइव मेट्रिक्स देखें
azd monitor --live
```

### Custom Metrics Collection
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

## 🎯 Best Practices

### 1. Environment Consistency
```bash
# सुसंगत नामकरण का उपयोग करें
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरणों के बीच समानता बनाए रखें
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# परिनियोजन से पहले अवसंरचना परिवर्तनों का पूर्वावलोकन करें
azd provision --preview

# ARM/Bicep लिंटिंग का उपयोग करें
az bicep lint --file infra/main.bicep

# Bicep वाक्यरचना सत्यापित करें
az bicep build --file infra/main.bicep
```

### 3. Testing Integration
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

### 4. Documentation and Logging
```bash
# तैनाती प्रक्रियाओं को दस्तावेज़ित करें
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - गहन विवरण इंफ्रास्ट्रक्चर प्रबंधन में
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - अपनी तैनाती रणनीति की योजना बनाएँ
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - तैनाती समस्याओं का समाधान करें
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - प्रोडक्शन-तैयार तैनाती रणनीतियाँ

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Goal**: Master the difference between full and incremental deployments

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

# समय की तुलना करें
cat deployment-log.txt

# साफ़ करें
azd down --force --purge
```

**Success Criteria:**
- [ ] फुल तैनाती 5-15 मिनट लेती है
- [ ] केवल कोड तैनाती 2-5 मिनट लेती है
- [ ] कोड परिवर्तन तैनात किए गए एप में प्रतिबिंबित हों
- [ ] `azd deploy` के बाद इंफ्रास्ट्रक्चर अपरिवर्तित रहे

**Learning Outcome**: `azd deploy` कोड परिवर्तनों के लिए `azd up` की तुलना में 50-70% तेज़ है

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Implement pre and post-deployment automation

```bash
# पूर्व-तैनाती सत्यापन स्क्रिप्ट बनाएं
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# जांचें कि परीक्षण पास हुए हैं
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

# तैनाती के बाद स्मोक टेस्ट बनाएं
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

# हुक्स के साथ तैनाती का परीक्षण करें
azd deploy
```

**Success Criteria:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट तैनाती से पहले चले
- [ ] यदि टेस्ट फेल हों तो तैनाती रद्द हो जाये
- [ ] पोस्ट-डिप्लॉय स्मोक टेस्ट स्वास्थ्य का सत्यापन करे
- [ ] हुक सही क्रम में निष्पादित हों

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Implement staged deployment workflow (dev → staging → production)

```bash
# परिनियोजन स्क्रिप्ट बनाएं
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# चरण 1: विकास (dev) पर तैनात करें
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

# स्टेज्ड तैनाती चलाएं
./deploy-staged.sh
```

**Success Criteria:**
- [ ] Dev वातावरण सफलतापूर्वक तैनात हो
- [ ] Staging वातावरण सफलतापूर्वक तैनात हो
- [ ] उत्पादन के लिए मैनुअल अनुमोदन आवश्यक हो
- [ ] सभी वातावरणों में कार्यशील हेल्थ चेक हो
- [ ] आवश्यकता होने पर रोलबैक किया जा सके

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Implement and test deployment rollback using Git

```bash
# v1 को तैनात करें
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट हैश सहेजें
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 को ब्रेकिंग परिवर्तन के साथ तैनात करें
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# विफलता का पता लगाएं और रोलबैक करें
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

**Success Criteria:**
- [ ] तैनाती विफलताओं का पता लग सके
- [ ] रोलबैक स्क्रिप्ट स्वचालित रूप से निष्पादित हो
- [ ] एप्लिकेशन कार्यशील स्थिति में लौट आये
- [ ] रोलबैक के बाद हेल्थ चेक पास हों

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

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

# लॉग को फ़ाइल में लिखें
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# इसे इस्तेमाल करें
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# परिनियोजन का इतिहास देखें
cat deployment-metrics.csv

# औसत परिनियोजन समय की गणना करें
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Additional Resources

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
इस दस्तावेज़ का अनुवाद एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में ही प्राधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की अनुशंसा की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->