# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

Dis## Understanding the Deployment Processcomprehensive guide dey cover everything wey you need sabi to deploy applications wit Azure Developer CLI, from basic one-command deployments reach advanced production scenarios wit custom hooks, many environments, and CI/CD integration. Master the full deployment lifecycle wit practical examples and best practices.

## Learning Goals

If you finish dis guide, you go:
- Know all di Azure Developer CLI deployment commands and how dem dey work
- Understand di full deployment lifecycle from provisioning go monitoring
- Implement custom deployment hooks for pre- and post-deployment automation
- Configure many environments wit environment-specific parameters
- Set up advanced deployment strategies like blue-green and canary deployments
- Integrate azd deployments wit CI/CD pipelines and DevOps workflows

## Learning Outcomes

When you finish, you go fit:
- Run and troubleshoot all azd deployment workflows by yourself
- Design and implement custom deployment automation using hooks
- Configure production-ready deployments wit correct security and monitoring
- Manage complex multi-environment deployment scenarios
- Optimize deployment performance and implement rollback strategies
- Integrate azd deployments into enterprise DevOps practices

## Deployment Overview

Azure Developer CLI get plenty deployment commands:
- `azd up` - Complete workflow (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Deploy application code only
- `azd package` - Build and package applications

## Basic Deployment Workflows

### Complete Deployment (azd up)
Di most common workflow for new projects:
```bash
# Deploy everything from di beginning
azd up

# Deploy wit specific environment
azd up --environment production

# Deploy wit custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
When you only need to update Azure resources:
```bash
# Set up or update di infrastructure
azd provision

# Set up wit dry-run make you fit see wetin go change
azd provision --preview

# Set up di specific services
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# Make we deploy all di services
azd deploy

# Wetin you suppose see:
# Dey deploy services (azd deploy)
# - web: Dey deploy... Don finish
# - api: Dey deploy... Don finish
# SUCCESS: Your deployment don finish for 2 minutes 15 seconds

# Deploy only the service wey you choose
azd deploy --service web
azd deploy --service api

# Deploy wit custom build arguments
azd deploy --service api --build-arg NODE_ENV=production

# Make sure say deployment correct
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, make sure e succeed:

```bash
# Check say all services dey run
azd show

# Test di health endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitor for errors (e dey open for browser by default)
azd monitor --logs
```

**Success Criteria:**
- ✅ All services dey show "Running" status
- ✅ Health endpoints dey return HTTP 200
- ✅ No error logs for the last 5 minutes
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
- Read infrastructure templates (Bicep/Terraform)
- Create or update Azure resources
- Configure networking and security
- Set up monitoring and logging

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
- Build application code
- Create deployment artifacts
- Package for target platform (containers, ZIP files, etc.)

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
- Deploy packaged applications to Azure services
- Update configuration settings
- Start/restart services

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
# Environment wey dem dey use for development
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Environment wey dem dey use for testing
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Environment wey dey live
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
# Make di blue environment
azd env new production-blue
azd up --environment production-blue

# Test di blue environment
./scripts/test-environment.sh production-blue

# Move traffic go blue (update DNS or load balancer by hand)
./scripts/switch-traffic.sh production-blue

# Clean up di green environment
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
# Deploy one specific service make you fit iterate faster
azd deploy --service web
azd deploy --service api

# Deploy all di services
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
# Make you use azd deploy (no azd up) if na only code you change
# E dey skip infrastructure provisioning and e much faster
azd deploy

# Deploy just di specific service so iteration go fastest
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Keep eye on di application as e dey happen
azd monitor --live

# See di application logs
azd monitor --logs

# Check di deployment status
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

# Make sure say di application dey healthy
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
# Keep di secrets safe
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Refer to di secrets for azure.yaml
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
# AZD no get built-in rollback. Dem recommend dis ways:

# Option 1: Redeploy from Git (na di one wey dem recommend)
git revert HEAD  # Revert di commit wey cause wahala
git push
azd deploy

# Option 2: Redeploy di specific commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# See di infrastructure changes before you apply dem
azd provision --preview

# If na to rollback infrastructure, use version control:
git revert HEAD  # Undo di infrastructure changes
azd provision    # Apply di previous infrastructure state
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
# See di current deployment status
azd show

# Watch di app wit Application Insights
azd monitor --overview

# See di live metrics
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
# Make names dey consistent
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Make environment dem dey the same
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Check di infrastructure changes before you deploy am
azd provision --preview

# Use ARM/Bicep for linting
az bicep lint --file infra/main.bicep

# Check say Bicep syntax correct
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
# Write down di steps wey dem go follow to deploy.
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - Deep dive into infrastructure management
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Plan your deployment strategy
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Solve deployment wahalas
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Production-ready deployment strategies

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Goal**: Know the difference between full and incremental deployments

```bash
# Di first deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Write down di first deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Change di code
echo "// Updated $(date)" >> src/api/src/server.js

# Deploy only di code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare di time dem
cat deployment-log.txt

# Clear up
azd down --force --purge
```

**Success Criteria:**
- [ ] Full deployment take 5-15 minutes
- [ ] Code-only deployment take 2-5 minutes
- [ ] Code changes show for deployed app
- [ ] Infrastructure no change after `azd deploy`

**Learning Outcome**: `azd deploy` dey 50-70% faster pass `azd up` for code changes

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Implement pre and post-deployment automation

```bash
# Make one script wey go check things bifo dem deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Make sure say test dem pass
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# See if get changes wey you never commit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Make one smoke test wey go run after dem deploy
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

# Put hooks inside azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Try deploy wit hooks make sure dem dey work
azd deploy
```

**Success Criteria:**
- [ ] Pre-deploy script run before deployment
- [ ] Deployment abort if tests fail
- [ ] Post-deploy smoke test validate health
- [ ] Hooks run for correct order

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Implement staged deployment workflow (dev → staging → production)

```bash
# Make di deployment script
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

# Step 3: You go need manual approval before production
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

# Make di environments
azd env new dev
azd env new staging
azd env new production

# Run di staged deployment
./deploy-staged.sh
```

**Success Criteria:**
- [ ] Dev environment deploy successfully
- [ ] Staging environment deploy successfully
- [ ] Manual approval required before production
- [ ] All environments get working health checks
- [ ] Fit roll back if e necessary

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Implement and test deployment rollback using Git

```bash
# Make v1 go live
azd env set APP_VERSION "1.0.0"
azd up

# Keep di v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Make v2 go live wey get change wey fit break things
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# See say e fail and roll back
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Roll back wit git
    git revert HEAD --no-edit
    
    # Roll back di environment
    azd env set APP_VERSION "1.0.0"
    
    # Make v1 go live again
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Success Criteria:**
- [ ] Fit detect deployment failures
- [ ] Rollback script run automatically
- [ ] Application return to working state
- [ ] Health checks pass after rollback

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

```bash
# Make script wey go collect deployment metrics
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

# Put log for file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Use am
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# See di deployment history
cat deployment-metrics.csv

# Calculate di average time wey deployment dey take
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
Disclaimer:
Dis document don translate with AI translation service [Co-op Translator]. Even tho we dey try make am correct, abeg note say automated translations fit get errors or inaccuracies. The original document for im native language suppose still be the authoritative source. For important or critical information, make you use professional human translation. We no dey liable or responsible for any misunderstandings or misinterpretations wey fit happen from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->