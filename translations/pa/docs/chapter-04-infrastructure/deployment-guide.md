# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 ਕੋਰਸ ਮੁੱਖ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ ਅੱਗੇ**: [Provisioning Resources](provisioning.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

This## Understanding the Deployment Processcomprehensive guide covers everything you need to know about deploying applications using Azure Developer CLI, from basic single-command deployments to advanced production scenarios with custom hooks, multiple environments, and CI/CD integration. Master the complete deployment lifecycle with practical examples and best practices.

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
- `azd up` - Complete workflow (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Deploy application code only
- `azd package` - Build and package applications

## Basic Deployment Workflows

### Complete Deployment (azd up)
The most common workflow for new projects:
```bash
# ਸਭ ਕੁਝ ਸ਼ੁਰੂ ਤੋਂ ਤੈਨਾਤ ਕਰੋ
azd up

# ਖਾਸ ਵਾਤਾਵਰਣ ਦੇ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਦੇ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
When you only need to update Azure resources:
```bash
# ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨ/ਅਪਡੇਟ ਕਰੋ
azd provision

# ਬਦਲਾਅ ਦਾ ਪੂਰਵ-ਦਰਸ਼ਨ ਕਰਨ ਲਈ ਡ੍ਰਾਈ-ਰਨ ਨਾਲ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision --preview

# ਨਿਰਧਾਰਿਤ ਸੇਵਾਵਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਉਮੀਦਤ ਆਉਟਪੁੱਟ:
# ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕੀਤੀਆਂ ਜਾ ਰਹੀਆਂ ਹਨ (azd deploy)
# - web: ਤੈਨਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ... ਹੋ ਗਿਆ
# - api: ਤੈਨਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ... ਹੋ ਗਿਆ
# ਸਫਲਤਾ: ਤੁਹਾਡੀ ਤੈਨਾਤ 2 ਮਿੰਟ 15 ਸਕਿੰਟਾਂ ਵਿੱਚ ਪੂਰੀ ਹੋ ਗਈ

# ਕਿਸੇ ਵਿਸ਼ੇਸ਼ ਸੇਵਾ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਕਸਟਮ ਬਿਲਡ ਆਰਗੁਮੈਂਟਸ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd deploy --service api --build-arg NODE_ENV=production

# ਤੈਨਾਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, verify success:

```bash
# ਸਭ ਸੇਵਾਵਾਂ ਚੱਲ ਰਹੀਆਂ ਹਨ ਜਾਂ ਨਹੀਂ ਜਾਂਚੋ
azd show

# ਹੈਲਥ ਐਂਡਪੌਇੰਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ਗਲਤੀਆਂ ਲਈ ਨਿਗਰਾਨੀ ਕਰੋ (ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁਲਦਾ ਹੈ)
azd monitor --logs
```

**Success Criteria:**
- ✅ All services show "Running" status
- ✅ Health endpoints return HTTP 200
- ✅ No error logs in the last 5 minutes
- ✅ Application responds to test requests

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
- Reads infrastructure templates (Bicep/Terraform)
- Creates or updates Azure resources
- Configures networking and security
- Sets up monitoring and logging

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
- Builds application code
- Creates deployment artifacts
- Packages for target platform (containers, ZIP files, etc.)

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
- Deploys packaged applications to Azure services
- Updates configuration settings
- Starts/restarts services

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
# ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ
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
# ਨੀਲਾ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new production-blue
azd up --environment production-blue

# ਨੀਲੇ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
./scripts/test-environment.sh production-blue

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਨੀਲੇ ਵੱਲ ਮੋੜੋ (ਮੈਨੁਅਲ DNS/ਲੋਡ ਬੈਲੈਂਸਰ ਅਪਡੇਟ)
./scripts/switch-traffic.sh production-blue

# ਹਰੇ ਵਾਤਾਵਰਣ ਨੂੰ ਸਾਫ਼ ਕਰੋ
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
# ਕਿਸੇ ਵਿਸ਼ੇਸ਼ ਸੇਵਾ ਨੂੰ ਤੇਜ਼ ਤਬਦੀਲੀ-ਚੱਕਰ ਲਈ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
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
# ਕੋਡ-ਮਾਤਰ ਬਦਲਾਵਾਂ ਲਈ azd deploy (azd up ਨਹੀਂ) ਵਰਤੋਂ
# ਇਹ ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨੂੰ ਛੱਡ ਦਿੰਦਾ ਹੈ ਅਤੇ ਬਹੁਤ ਤੇਜ਼ ਹੈ
azd deploy

# ਸਭ ਤੋਂ ਤੇਜ਼ ਇਟਰੇਸ਼ਨ ਲਈ ਖਾਸ ਸੇਵਾ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --live

# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
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

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
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
# ਰਹੱਸਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਸਟੋਰ ਕਰੋ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ਵਿੱਚ ਰਹੱਸਾਂ ਦਾ ਹਵਾਲਾ ਦਿਓ
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
# AZD ਵਿੱਚ ਬਿਲਟ-ਇਨ ਰੋਲਬੈਕ ਨਹੀਂ ਹੈ। ਸਿਫਾਰਸ਼ ਕੀਤੇ ਤਰੀਕੇ:

# ਵਿਕਲਪ 1: Git ਤੋਂ ਮੁੜ ਤਾਇਨਾਤ ਕਰੋ (ਸਿਫਾਰਸ਼ ਕੀਤੀ)
git revert HEAD  # ਸਮੱਸਿਆ ਵਾਲੇ ਕਮੇਟ ਨੂੰ ਰਿਵਰਟ ਕਰੋ
git push
azd deploy

# ਵਿਕਲਪ 2: ਖਾਸ ਕਮੇਟ ਨੂੰ ਮੁੜ ਤਾਇਨਾਤ ਕਰੋ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# ਲਾਗੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਬਦਲਾਅ ਦੀ ਪੂਰਵ-ਦਿੱਖ ਕਰੋ
azd provision --preview

# ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਰੋਲਬੈਕ ਲਈ, ਵਰਜ਼ਨ ਕੰਟਰੋਲ ਵਰਤੋਂ:
git revert HEAD  # ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਬਦਲਾਅ ਨੂੰ ਵਾਪਸ ਕਰੋ
azd provision    # ਪਿਛਲੀ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਸਥਿਤੀ ਲਾਗੂ ਕਰੋ
```

### Database Migration Rollback
```bash
#!/bin/bash
# ਸਕ੍ਰਿਪਟਸ/ਰੋਲਬੈਕ-ਡੇਟਾਬੇਸ.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Track Deployment Performance
```bash
# ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show

# Application Insights ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
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
# ਇਕਸਾਰ ਨਾਮਕਰਨ ਦੀ ਵਰਤੋਂ ਕਰੋ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ਵਾਤਾਵਰਨਾਂ ਦੀ ਸਮਾਨਤਾ ਬਰਕਰਾਰ ਰੱਖੋ
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# ਤੈਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਵਿੱਚ ਹੋਣ ਵਾਲੇ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰੀਵਿਊ ਕਰੋ
azd provision --preview

# ARM/Bicep ਲਿੰਟਿੰਗ ਦੀ ਵਰਤੋਂ ਕਰੋ
az bicep lint --file infra/main.bicep

# Bicep ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
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
# ਤਾਇਨਾਤ ਕਰਨ ਦੀਆਂ ਪ੍ਰਕਿਰਿਆਵਾਂ ਨੂੰ ਦਸਤਾਵੇਜ਼ ਕਰੋ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - Deep dive into infrastructure management
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Plan your deployment strategy
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Resolve deployment issues
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Production-ready deployment strategies

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Goal**: Master the difference between full and incremental deployments

```bash
# ਸ਼ੁਰੂਆਤੀ ਤੈਨਾਤੀ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ਸ਼ੁਰੂਆਤੀ ਤੈਨਾਤੀ ਦਾ ਸਮਾਂ ਦਰਜ ਕਰੋ
echo "Full deployment: $(date)" > deployment-log.txt

# ਕੋਡ ਵਿੱਚ ਬਦਲਾਅ ਕਰੋ
echo "// Updated $(date)" >> src/api/src/server.js

# ਸਿਰਫ਼ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਤੇਜ਼)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ਸਮਿਆਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
cat deployment-log.txt

# ਸਾਫ਼-ਸਫਾਈ ਕਰੋ
azd down --force --purge
```

**Success Criteria:**
- [ ] Full deployment takes 5-15 minutes
- [ ] Code-only deployment takes 2-5 minutes
- [ ] Code changes reflected in deployed app
- [ ] Infrastructure unchanged after `azd deploy`

**Learning Outcome**: `azd deploy` is 50-70% faster than `azd up` for code changes

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Implement pre and post-deployment automation

```bash
# ਪ੍ਰੀ-ਡਿਪਲੋਇ ਵੈਰੀਫਿਕੇਸ਼ਨ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ਟੈਸਟ ਪਾਸ ਹਨ ਜਾਂ ਨਹੀਂ ਜਾਂਚੋ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ਅਣ-ਕਮਿੱਟ ਕੀਤੀਆਂ ਤਬਦੀਲੀਆਂ ਲਈ ਜਾਂਚੋ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ਪੋਸਟ-ਡਿਪਲੋਇ ਸਮੋਕ ਟੈਸਟ ਬਣਾਓ
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

# azure.yaml ਵਿੱਚ ਹੁਕਸ ਜੋੜੋ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ਹੁਕਸ ਨਾਲ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd deploy
```

**Success Criteria:**
- [ ] Pre-deploy script runs before deployment
- [ ] Deployment aborts if tests fail
- [ ] Post-deploy smoke test validates health
- [ ] Hooks execute in correct order

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Implement staged deployment workflow (dev → staging → production)

```bash
# ਡਿਪਲੋਇਮੈਂਟ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ਕਦਮ 1: ਡੈਵ ਤੇ ਡਿਪਲੋਇ ਕਰੋ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 2: ਸਟੇਜਿੰਗ ਤੇ ਡਿਪਲੋਇ ਕਰੋ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 3: ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਮੈਨੂਅਲ ਮਨਜ਼ੂਰੀ
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

# ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new dev
azd env new staging
azd env new production

# ਸਟੇਜ ਕੀਤੀ ਡਿਪਲੋਇਮੈਂਟ ਚਲਾਓ
./deploy-staged.sh
```

**Success Criteria:**
- [ ] Dev environment deploys successfully
- [ ] Staging environment deploys successfully
- [ ] Manual approval required for production
- [ ] All environments have working health checks
- [ ] Can roll back if needed

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Implement and test deployment rollback using Git

```bash
# v1 ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ
azd env set APP_VERSION "1.0.0"
azd up

# v1 ਦੀ ਕਮਿਟ ਹੈਸ਼ ਨੂੰ ਸੇਵ ਕਰੋ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 ਨੂੰ ਟੁੱਟਣ-ਵਾਲੇ ਬਦਲਾਅ ਦੇ ਨਾਲ ਡਿਪਲੋਇ ਕਰੋ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ਅਸਫਲਤਾ ਦਾ ਪਤਾ ਲਗਾਓ ਅਤੇ ਰੋਲਬੈਕ ਕਰੋ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਰੋਲਬੈਕ ਕਰੋ
    git revert HEAD --no-edit
    
    # ਇਨਵਾਇਰਨਮੈਂਟ ਨੂੰ ਰੋਲਬੈਕ ਕਰੋ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ਨੂੰ ਦੁਬਾਰਾ ਡਿਪਲੋਇ ਕਰੋ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Success Criteria:**
- [ ] Can detect deployment failures
- [ ] Rollback script executes automatically
- [ ] Application returns to working state
- [ ] Health checks pass after rollback

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

```bash
# ਡਿਪਲੋਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
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

# ਫਾਈਲ ਵਿੱਚ ਲੌਗ ਕਰੋ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ਇਸ ਨੂੰ ਵਰਤੋ
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# ਤੈਨਾਤੀ ਇਤਿਹਾਸ ਵੇਖੋ
cat deployment-metrics.csv

# ਔਸਤ ਤੈਨਾਤੀ ਸਮਾਂ ਗਣਨਾ ਕਰੋ
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
ਅਸਵੀਕਾਰ:

ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤ੍ਰੁਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਹੀ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->