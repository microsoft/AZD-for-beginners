# Deployment Guide - How to Master AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

Dis guide go show you everytin wey you need sabi about how to deploy apps wit Azure Developer CLI, from simple one-command deployment to advanced production setups wey get custom hooks, multiple environments, and CI/CD integration. You go sabi di full deployment process wit practical examples and best practices.

## Learning Goals

If you finish dis guide, you go fit:
- Sabi all di Azure Developer CLI deployment commands and workflows
- Understand di full deployment process from provisioning to monitoring
- Use custom deployment hooks for pre and post-deployment automation
- Set up multiple environments wit environment-specific parameters
- Do advanced deployment strategies like blue-green and canary deployments
- Connect azd deployments wit CI/CD pipelines and DevOps workflows

## Learning Outcomes

When you don complete dis guide, you go fit:
- Run and troubleshoot all azd deployment workflows by yourself
- Design and use custom deployment automation wit hooks
- Set up production-ready deployments wit correct security and monitoring
- Manage complex multi-environment deployment setups
- Make deployment faster and use rollback strategies
- Add azd deployments into enterprise DevOps practices

## Deployment Overview

Azure Developer CLI get plenty deployment commands:
- `azd up` - Full workflow (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Deploy application code only
- `azd package` - Build and package applications

## Basic Deployment Workflows

### Complete Deployment (azd up)
Dis na di most common workflow for new projects:
```bash
# Deploy everything from scratch
azd up

# Deploy wit specific environment
azd up --environment production

# Deploy wit custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
If na only Azure resources you wan update:
```bash
# Set up/update infrastructure
azd provision

# Set up wit dry-run to see wetin go change
azd provision --preview

# Set up specific services
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# Deploy all di services
azd deploy

# Wetin we dey expect:
# Dey deploy services (azd deploy)
# - web: Dey deploy... E don finish
# - api: Dey deploy... E don finish
# SUCCESS: Your deployment don complete for 2 minutes 15 seconds

# Deploy one service
azd deploy --service web
azd deploy --service api

# Deploy wit custom build arguments
azd deploy --service api --build-arg NODE_ENV=production

# Check di deployment
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After you deploy, make sure say e work:

```bash
# Make sure say all di services dey run
azd show

# Test di health endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Check di logs for any error
azd logs --service api --since 5m | grep -i error
```

**Success Criteria:**
- ✅ All services dey show "Running" status
- ✅ Health endpoints dey return HTTP 200
- ✅ No error logs for di last 5 minutes
- ✅ Application dey respond to test requests

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
- E go read infrastructure templates (Bicep/Terraform)
- E go create or update Azure resources
- E go configure networking and security
- E go set up monitoring and logging

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
- E go build di application code
- E go create deployment artifacts
- E go package am for di target platform (containers, ZIP files, etc.)

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
- E go deploy di packaged applications to Azure services
- E go update configuration settings
- E go start/restart services

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
# Place wey dem dey build di software
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Place wey dem dey test di software
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Place wey di software dey work for real
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
# Make blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Move traffic go blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clear green environment
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

### Parallel Deployments
```bash
# Set parallel deployment
azd config set deploy.parallelism 5

# Deploy services together
azd deploy --parallel
```

### Build Caching
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

### Incremental Deployments
```bash
# Deploy only di services wey change
azd deploy --incremental

# Deploy wit change detection
azd deploy --detect-changes
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Dey check how deployment dey go
azd deploy --follow

# See deployment logs
azd logs --follow --service api

# Confirm deployment status
azd show --service api
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

# Check say di application dey okay
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
# Keep secret dem well well
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Use secret dem for azure.yaml
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
# Go back to di deployment wey dey before
azd deploy --rollback

# Go back to one service wey you choose
azd deploy --service api --rollback

# Go back to one version wey you choose
azd deploy --service api --version v1.2.3
```

### Infrastructure Rollback
```bash
# Reverse infrastructure wey dem change
azd provision --rollback

# Show wetin dem go reverse for the change
azd provision --rollback --preview
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
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# See deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
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
# Dey use same name style
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Make sure say environment dey same
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Check am well before you deploy
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
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
# Write how dem dey do deployment
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - Learn more about infrastructure management
- [Pre-Deployment Planning](../pre-deployment/capacity-planning.md) - Plan your deployment strategy
- [Common Issues](../troubleshooting/common-issues.md) - Solve deployment problems
- [Best Practices](../troubleshooting/debugging.md) - Strategies for production-ready deployments

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Goal**: Sabi di difference between full and incremental deployments

```bash
# First deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Write down di first deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Change di code small
echo "// Updated $(date)" >> src/api/src/server.js

# Deploy only di code (quick quick)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Check di time difference
cat deployment-log.txt

# Arrange tins well
azd down --force --purge
```

**Success Criteria:**
- [ ] Full deployment dey take 5-15 minutes
- [ ] Code-only deployment dey take 2-5 minutes
- [ ] Code changes dey show for di deployed app
- [ ] Infrastructure no change after `azd deploy`

**Learning Outcome**: `azd deploy` dey 50-70% faster than `azd up` for code changes

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Add pre and post-deployment automation

```bash
# Make script wey go check before deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Check if test dem pass
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Check for change wey never commit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Make test wey go check after deploy
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

# Add hook for azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Test deploy with hook
azd deploy
```

**Success Criteria:**
- [ ] Pre-deploy script go run before deployment
- [ ] Deployment go stop if tests fail
- [ ] Post-deploy smoke test go check health
- [ ] Hooks go run for correct order

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Do staged deployment workflow (dev → staging → production)

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy go dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Step 2: Deploy go staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Step 3: Manual approval for production
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

# Create environments
azd env new dev
azd env new staging
azd env new production

# Run staged deployment
./deploy-staged.sh
```

**Success Criteria:**
- [ ] Dev environment go deploy successfully
- [ ] Staging environment go deploy successfully
- [ ] Manual approval go dey for production
- [ ] All environments go get working health checks
- [ ] You fit roll back if e necessary

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Test deployment rollback

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 configuration
cp -r .azure/production .azure/production-v1-backup

# Deploy v2 wit breaking change
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Detect failure
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback code
    git checkout src/api/src/server.js
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Success Criteria:**
- [ ] You fit detect deployment failures
- [ ] Rollback script go run automatically
- [ ] Application go return to working state
- [ ] Health checks go pass after rollback

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

```bash
# Make deployment metrics script
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

# Log am for file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Use am
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# See deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Additional Resources

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Your First Project](../getting-started/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transle-shun service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shun. Even as we dey try make am correct, abeg sabi say transle-shun wey machine do fit get mistake or no dey accurate well. Di original dokyument for im native language na di one wey you go take as di correct source. For important mata, e good make professional human transle-shun dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shun.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->