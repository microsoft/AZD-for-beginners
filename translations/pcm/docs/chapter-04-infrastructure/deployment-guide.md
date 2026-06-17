# Deployment Guide - How to sabi AZD Deployments

**How to find chapter dem:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

Dis full guide go cover everything wey you need sabi about how to deploy apps using Azure Developer CLI, from simple one-command deployments to gbege production scenarios wey get custom hooks, plenty environments, and CI/CD integration. Learn the whole deployment lifecycle with practical examples and beta practices.

## Learning Goals

If you finish dis guide, you go:
- Master all Azure Developer CLI deployment commands and workflows
- Understand the full deployment lifecycle from provisioning to monitoring
- Implement custom deployment hooks for pre and post-deployment automation
- Configure multiple environments with environment-specific parameters
- Set up advanced deployment strategies including blue-green and canary deployments
- Integrate azd deployments with CI/CD pipelines and DevOps workflows

## Learning Outcomes

After you finish, you go fit:
- Execute and troubleshoot all azd deployment workflows by yourself
- Design and implement custom deployment automation using hooks
- Configure production-ready deployments with correct security and monitoring
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
The most common workflow for new projects:
```bash
# Deploy everytin from di beginning
azd up

# Deploy wit di specific environment
azd up --environment production

# Deploy wit di custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
When you only need to update Azure resources:
```bash
# Set up/update di infrastructure
azd provision

# Set up wit dry-run make you fit see di changes before dem happen
azd provision --preview

# Set up di specific services
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# Make we deploy all service dem
azd deploy

# Wetin we expect go show:
# Dey deploy service dem (azd deploy)
# - web: Dey deploy... Don finish
# - api: Dey deploy... Don finish
# SUCCESS: Your deployment don complete for 2 minutes 15 seconds

# Deploy one particular service
azd deploy --service web
azd deploy --service api

# Deploy wit custom build arguments
azd deploy --service api --build-arg NODE_ENV=production

# Confirm say deployment correct
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, make sure e work:

```bash
# Make sure say all services dey run
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
- ✅ No error logs inside last 5 minutes
- ✅ Application dey respond to test requests

## 🏗️ Understanding the Deployment Process

### New to hooks? Start here

One **hook** na command wey azd go run automatically for one specific time for the deploy process—before or after provisioning, and before or after deploying your code. Dem dey help you automate small chores wey always dey plus deployment: seed database, run migrations, build assets, or do quick smoke-test for live app.

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Before resources are created | Validate prerequisites, log in to a registry |
| `postprovision` | After resources exist | Configure resources, set up the database |
| `predeploy` | Before code is deployed | Build front-end assets, run unit tests |
| `postdeploy` | After code is live | Run DB migrations, smoke-test the endpoint |

Hooks dey your `azure.yaml`. Na the smallest example be this—e just print message after deployment:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Na so e be—next time wey you run `azd up`, the message go print automatically. You fit still run hook by itself, without full deploy, e good for testing:

```bash
azd hooks run postdeploy
```

The phases below show real-world hooks (migrations, tests, validation) for each stage.

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

### Handling Hook Errors

By default, **if a hook command exits with a non-zero code, azd stops the whole operation.** Na wetin you normally want—if migration fail, the deploy suppose stop, no suppose push broken app. But e mean say you must write hooks careful.

**1. Make failures loud and intentional.** Hook go fail when the last command return non-zero exit code. For shell scripts, add `set -e` make the hook stop for the first command wey fail instead of to dey continue quietly:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Allow a hook to fail without stopping azd.** For non-critical steps (like optional cache warm-up, best-effort notification), set `continueOnError: true`. azd go log the failure but go continue:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Test hooks in isolation before a full run.** You no need run `azd up` to debug hook—run am alone and iterate quick:

```bash
azd hooks run predeploy          # na only di predeploy hook e dey run
azd hooks run postdeploy --service api
```

**4. Watch for OS-specific shells.** If hook dey use `shell: pwsh` then PowerShell must dey installed for the machine wey dey run am (including CI agents). Use `shell: sh` if you want maximum portability, or give both `windows` and `posix` variants:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Debugging tip:** run any azd command with `--debug` to see the exact hook command line and the full output—e dey very useful when hook dey work local but e fail for CI.

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
# Environment wey we dey use to develop
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Environment wey we dey use to test before we push am live
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Environment wey dey live for customers
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
# Use azd deploy (no azd up) for changes wey na only code
# E dey skip infrastructure provisioning and e go much faster
azd deploy

# Deploy only the service wey you dey work on so iteration go fast
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Watch di app as e dey happen
azd monitor --live

# See di app logs
azd monitor --logs

# Check how di deployment dey
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

# Check if di app dey healthy
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
# Keep di secret dem safe
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Refer to di secret dem inside azure.yaml
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
# AZD no get built-in rollback. Wetin dem recommend:

# Option 1: Redeploy from Git (wey dem recommend)
git revert HEAD  # Undo the commit wey get problem
git push
azd deploy

# Option 2: Redeploy di specific commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# Check di infrastructure changes before you apply dem
azd provision --preview

# If you wan roll back infrastructure, make you use version control:
git revert HEAD  # Undo di infrastructure changes
azd provision    # Bring di infrastructure back to di previous state
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
# See how deployment dey now
azd show

# Keep eye on di app wit Application Insights
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
# Make una dey use di same names
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Make sure say all di environment dem dey the same
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# See wetin go change for infrastructure before you deploy am
azd provision --preview

# Make you use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Make sure say Bicep syntax correct
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
# Write down di steps for deployment
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
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
# Di first deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Write down di time wey di first deployment happen
echo "Full deployment: $(date)" > deployment-log.txt

# Make change for di code
echo "// Updated $(date)" >> src/api/src/server.js

# Deploy only di code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare di times
cat deployment-log.txt

# Tidy up
azd down --force --purge
```

**Success Criteria:**
- [ ] Full deployment dey take 5-15 minutes
- [ ] Code-only deployment dey take 2-5 minutes
- [ ] Code changes dey show for deployed app
- [ ] Infrastructure no change after `azd deploy`

**Learning Outcome**: `azd deploy` dey 50-70% faster than `azd up` for code changes

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Implement pre and post-deployment automation

```bash
# Make script wey go check before we deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Make sure say tests dey pass
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Check for changes wey you never commit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Make smoke test wey go run after we deploy
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

# Test say deploy dey work with hooks
azd deploy
```

**Success Criteria:**
- [ ] Pre-deploy script run before deployment
- [ ] Deployment go abort if tests fail
- [ ] Post-deploy smoke test go validate health
- [ ] Hooks go run for correct order

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Implement staged deployment workflow (dev → staging → production)

```bash
# Make deployment script
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

# Step 3: Make person approve before e go production
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

# Make environment dem
azd env new dev
azd env new staging
azd env new production

# Run deployment wey dem don stage
./deploy-staged.sh
```

**Success Criteria:**
- [ ] Dev environment deploy successfully
- [ ] Staging environment deploy successfully
- [ ] Manual approval required for production
- [ ] All environments get working health checks
- [ ] Fit roll back if e necessary

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Implement and test deployment rollback using Git

```bash
# Put v1 for production
azd env set APP_VERSION "1.0.0"
azd up

# Keep di v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 wey get breaking change
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Notice say e fail, den rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback use git
    git revert HEAD --no-edit
    
    # Rollback di environment
    azd env set APP_VERSION "1.0.0"
    
    # Deploy v1 again
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
# Make script wey go gather deployment metrics
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

# Put log for file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Use am
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# See di deployment history
cat deployment-metrics.csv

# Calculate di average deployment time
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
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->