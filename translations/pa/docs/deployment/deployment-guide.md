<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T19:20:48+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "pa"
}
-->
# ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ - AZD ਡਿਪਲੌਇਮੈਂਟਸ ਵਿੱਚ ਮਾਹਰ ਬਣੋ

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਬਾਰੇ ਸਭ ਕੁਝ ਸਿਖਾਉਂਦੀ ਹੈ। ਇਸ ਵਿੱਚ ਬੁਨਿਆਦੀ ਸਿੰਗਲ-ਕਮਾਂਡ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਲੈ ਕੇ ਉੱਚ-ਸਤਹ ਦੇ ਪ੍ਰੋਡਕਸ਼ਨ ਸਥਿਤੀਆਂ ਤੱਕ, ਜਿਵੇਂ ਕਿ ਕਸਟਮ ਹੁਕਸ, ਕਈ ਵਾਤਾਵਰਣ, ਅਤੇ CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਸ਼ਾਮਲ ਹਨ। ਪ੍ਰਯੋਗਿਕ ਉਦਾਹਰਣਾਂ ਅਤੇ ਸਭ ਤੋਂ ਵਧੀਆ ਤਰੀਕਿਆਂ ਨਾਲ ਪੂਰੇ ਡਿਪਲੌਇਮੈਂਟ ਲਾਈਫਸਾਈਕਲ ਵਿੱਚ ਮਾਹਰ ਬਣੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੁਆਰਾ, ਤੁਸੀਂ:
- Azure Developer CLI ਡਿਪਲੌਇਮੈਂਟ ਕਮਾਂਡ ਅਤੇ ਵਰਕਫਲੋਜ਼ ਵਿੱਚ ਮਾਹਰ ਬਣ ਜਾਓਗੇ
- ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਤੋਂ ਮਾਨੀਟਰਿੰਗ ਤੱਕ ਪੂਰੇ ਡਿਪਲੌਇਮੈਂਟ ਲਾਈਫਸਾਈਕਲ ਨੂੰ ਸਮਝੋ
- ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਡਿਪਲੌਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਲਈ ਕਸਟਮ ਡਿਪਲੌਇਮੈਂਟ ਹੁਕਸ ਲਾਗੂ ਕਰੋ
- ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਕਈ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
- ਉੱਚ-ਸਤਹ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਜਿਵੇਂ ਕਿ ਬਲੂ-ਗ੍ਰੀਨ ਅਤੇ ਕੈਨਰੀ ਡਿਪਲੌਇਮੈਂਟਸ ਸਥਾਪਿਤ ਕਰੋ
- azd ਡਿਪਲੌਇਮੈਂਟਸ ਨੂੰ CI/CD ਪਾਈਪਲਾਈਨ ਅਤੇ DevOps ਵਰਕਫਲੋਜ਼ ਨਾਲ ਜੋੜੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਸਾਰੇ azd ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਖੁਦ ਚਲਾਉਣ ਅਤੇ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ
- ਕਸਟਮ ਡਿਪਲੌਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਨੂੰ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰੋ
- ਸੁਰੱਖਿਆ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਦੇ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟਸ ਸੰਰਚਿਤ ਕਰੋ
- ਜਟਿਲ ਕਈ-ਵਾਤਾਵਰਣ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ
- ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਓ ਅਤੇ ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ
- azd ਡਿਪਲੌਇਮੈਂਟਸ ਨੂੰ ਐਨਟਰਪ੍ਰਾਈਜ਼ DevOps ਅਭਿਆਸਾਂ ਵਿੱਚ ਜੋੜੋ

## ਡਿਪਲੌਇਮੈਂਟ ਝਲਕ

Azure Developer CLI ਕਈ ਡਿਪਲੌਇਮੈਂਟ ਕਮਾਂਡ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:
- `azd up` - ਪੂਰਾ ਵਰਕਫਲੋ (ਪ੍ਰੋਵਿਜ਼ਨ + ਡਿਪਲੌਇ)
- `azd provision` - ਸਿਰਫ਼ Azure ਸਰੋਤ ਬਣਾਓ/ਅਪਡੇਟ ਕਰੋ
- `azd deploy` - ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਕਰੋ
- `azd package` - ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਓ ਅਤੇ ਪੈਕੇਜ ਕਰੋ

## ਬੁਨਿਆਦੀ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼

### ਪੂਰਾ ਡਿਪਲੌਇਮੈਂਟ (azd up)
ਨਵੇਂ ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ ਸਭ ਤੋਂ ਆਮ ਵਰਕਫਲੋ:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ਸਿਰਫ਼ ਇੰਫਰਾਸਟਰਕਚਰ ਡਿਪਲੌਇਮੈਂਟ
ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ਼ Azure ਸਰੋਤਾਂ ਨੂੰ ਅਪਡੇਟ ਕਰਨ ਦੀ ਲੋੜ ਹੋਵੇ:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### ਸਿਰਫ਼ ਕੋਡ ਡਿਪਲੌਇਮੈਂਟ
ਤੇਜ਼ ਐਪਲੀਕੇਸ਼ਨ ਅਪਡੇਟ ਲਈ:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਮਝਣਾ

### ਚਰਨ 1: ਪ੍ਰੀ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੁਕਸ
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

### ਚਰਨ 2: ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟ (Bicep/Terraform) ਪੜ੍ਹਦਾ ਹੈ
- Azure ਸਰੋਤ ਬਣਾਉਂਦਾ ਜਾਂ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸਥਾਪਿਤ ਕਰਦਾ ਹੈ

### ਚਰਨ 3: ਪੋਸਟ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੁਕਸ
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

### ਚਰਨ 4: ਐਪਲੀਕੇਸ਼ਨ ਪੈਕੇਜਿੰਗ
- ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਬਣਾਉਂਦਾ ਹੈ
- ਡਿਪਲੌਇਮੈਂਟ ਆਰਟੀਫੈਕਟ ਬਣਾਉਂਦਾ ਹੈ
- ਟਾਰਗਟ ਪਲੇਟਫਾਰਮ ਲਈ ਪੈਕੇਜ ਕਰਦਾ ਹੈ (ਕੰਟੇਨਰ, ZIP ਫਾਈਲਾਂ, ਆਦਿ)

### ਚਰਨ 5: ਪ੍ਰੀ-ਡਿਪਲੌਇ ਹੁਕਸ
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

### ਚਰਨ 6: ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ
- ਪੈਕੇਜ ਕੀਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure ਸਰਵਿਸਜ਼ ਵਿੱਚ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ
- ਸੰਰਚਨਾ ਸੈਟਿੰਗਾਂ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਸਰਵਿਸਜ਼ ਸ਼ੁਰੂ/ਮੁੜ ਸ਼ੁਰੂ ਕਰਦਾ ਹੈ

### ਚਰਨ 7: ਪੋਸਟ-ਡਿਪਲੌਇ ਹੁਕਸ
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

## 🎛️ ਡਿਪਲੌਇਮੈਂਟ ਸੰਰਚਨਾ

### ਸਰਵਿਸ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੌਇਮੈਂਟ ਸੈਟਿੰਗਾਂ
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

### ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਸੰਰਚਨਾਵਾਂ
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

## 🔧 ਉੱਚ-ਸਤਹ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ

### ਕਈ-ਸਰਵਿਸ ਐਪਲੀਕੇਸ਼ਨ
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

### ਬਲੂ-ਗ੍ਰੀਨ ਡਿਪਲੌਇਮੈਂਟਸ
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

### ਕੈਨਰੀ ਡਿਪਲੌਇਮੈਂਟਸ
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

### ਸਟੇਜਡ ਡਿਪਲੌਇਮੈਂਟਸ
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

## 🐳 ਕੰਟੇਨਰ ਡਿਪਲੌਇਮੈਂਟਸ

### ਕੰਟੇਨਰ ਐਪ ਡਿਪਲੌਇਮੈਂਟਸ
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

### ਮਲਟੀ-ਸਟੇਜ Dockerfile ਅਨੁਕੂਲਤਾ
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

## ⚡ ਪ੍ਰਦਰਸ਼ਨ ਅਨੁਕੂਲਤਾ

### ਪੈਰਲਲ ਡਿਪਲੌਇਮੈਂਟਸ
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### ਬਿਲਡ ਕੈਸ਼ਿੰਗ
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

### ਇੰਕ੍ਰਿਮੈਂਟਲ ਡਿਪਲੌਇਮੈਂਟਸ
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 ਡਿਪਲੌਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ

### ਰੀਅਲ-ਟਾਈਮ ਡਿਪਲੌਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### ਹੈਲਥ ਚੈਕਸ
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

### ਪੋਸਟ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਲੀਡੇਸ਼ਨ
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

## 🔐 ਸੁਰੱਖਿਆ ਵਿਚਾਰ

### ਸਿਕ੍ਰੇਟਸ ਪ੍ਰਬੰਧਨ
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

### ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ਪਹਿਚਾਣ ਅਤੇ ਪਹੁੰਚ ਪ੍ਰਬੰਧਨ
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

## 🚨 ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ

### ਤੇਜ਼ ਰੋਲਬੈਕ
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### ਇੰਫਰਾਸਟਰਕਚਰ ਰੋਲਬੈਕ
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### ਡਾਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਰੋਲਬੈਕ
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ਡਿਪਲੌਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ

### ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਟ੍ਰੈਕ ਕਰੋ
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਇਕੱਠਾ ਕਰਨਾ
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

## 🎯 ਸਭ ਤੋਂ ਵਧੀਆ ਤਰੀਕੇ

### 1. ਵਾਤਾਵਰਣ ਸਥਿਰਤਾ
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. ਇੰਫਰਾਸਟਰਕਚਰ ਵੈਲੀਡੇਸ਼ਨ
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. ਟੈਸਟਿੰਗ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
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

### 4. ਦਸਤਾਵੇਜ਼ ਅਤੇ ਲੌਗਿੰਗ
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ਅਗਲੇ ਕਦਮ

- [ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨਾ](provisioning.md) - ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰਬੰਧਨ ਵਿੱਚ ਡੂੰਘੀ ਝਲਕ
- [ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਯੋਜਨਾ](../pre-deployment/capacity-planning.md) - ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../troubleshooting/common-issues.md) - ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ
- [ਸਭ ਤੋਂ ਵਧੀਆ ਤਰੀਕੇ](../troubleshooting/debugging.md) - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ

## ਵਾਧੂ ਸਰੋਤ

- [Azure Developer CLI ਡਿਪਲੌਇਮੈਂਟ ਰਿਫਰੈਂਸ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ਡਿਪਲੌਇਮੈਂਟ](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ਡਿਪਲੌਇਮੈਂਟ](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ਡਿਪਲੌਇਮੈਂਟ](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../getting-started/first-project.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨਾ](provisioning.md)

---

**ਅਸਵੀਕਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।