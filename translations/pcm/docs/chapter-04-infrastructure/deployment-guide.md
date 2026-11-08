# Deployment Guide - How to sabi AZD Deployments

**Chapta Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Dis Chapta**: Chapta 4 - Infrastructure as Code & Deployment
- **⬅️ Former Chapta**: [Chapta 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also for dis chapta**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapta**: [Chapta 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

> Reviewed against `azd 1.37.2` (November 2026). Commands use Bash; JSON examples require `jq`. Except for di one we explicitly start todo exercise, advanced examples na **integration fragments**: make you bring your own source, infrastructure, tests, and scripts. No Azure deployments run for dis review.

Dis comprehensive guide go explain everything weh you need sabi about how to deploy apps wit Azure Developer CLI, from simple single-command deployments reach advanced production wahala with custom hooks, many environment, and CI/CD integration. Master full deployment lifecycle wit practical examples and beta ways to do am.

## Wetin you go learn

If you complete dis guide, you go:
- Master all Azure Developer CLI deployment commands and workflows
- Understand the complete deployment lifecycle from provisioning to monitoring
- Implement custom deployment hooks for pre and post-deployment automation
- Configure multiple environments with environment-specific parameters
- Set up advanced deployment strategies including blue-green and canary deployments
- Integrate azd deployments with CI/CD pipelines and DevOps workflows

## Wetin you fit do after

After you finish, you fit:
- Execute and troubleshoot all azd deployment workflows by yourself
- Design and implement custom deployment automation using hooks
- Configure production-ready deployments wit correct security and monitoring
- Manage complex multi-environment deployment scenarios
- Optimize deployment performance and implement rollback strategies
- Integrate azd deployments into enterprise DevOps wahala

## Deployment Overview

Azure Developer CLI get plenti deployment commands:
- `azd up` - Complete workflow (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Deploy application code only
- `azd package` - Build and package applications

## Basic Deployment Workflows

### Complete Deployment (azd up)
The workflow wey most people dey use for new projects:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Infrastructure-Only Deployment
When you only need update Azure resources:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Code-Only Deployment
For quick application updates:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, make sure say e succeed:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Success Criteria:**
- ✅ `azd show` resolves expected service targets/URLs
- ✅ Requests wey go actual application routes return correct status and answer body
- ✅ No error logs for past 5 minutes
- ✅ Application respond to test requests

## 🏗️ How Deployment Process Dey Work

### You never sabi hooks? Start here

A **hook** na command azd run automatic at particular time for the deploy process—before or after provisioning, and before or after deploying your code. Dem dey help you automate small small work wey always dey follow deployment like: seed database, run migrations, build assets, or smoke-test your live app.

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Before resources dey create | Validate prerequisites, log in to registry |
| `postprovision` | After resources don land | Configure resources, set up database |
| `predeploy` | Before code dey deploy | Build front-end assets, run unit tests |
| `postdeploy` | After code dey live | Run DB migrations, smoke-test endpoint |

Hooks dey your `azure.yaml`. This na the smallest example—e go display message after deployment:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Na so e be—next time you run `azd up`, e go show message automatic. You fit run hook alone without full deploy, e good for testing:

```bash
azd hooks run postdeploy
```

Di phases below show real hooks (migrations, tests, validation) for each step.

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
      curl --fail "$WEB_URL/health"
```

### How to Handle Hook Errors

Normally, **if hook command exit wit one non-zero code, azd go stop the whole operation.** Dis na wetin you want—if migration fail, deployment suppose stop, no be make e deliver broken app. But dat mean say you must write hooks well well.

**1. Make failures loud and obvious.** Hook go fail if e last command return non-zero exit code. For shell scripts, put `set -e` make hook stop for di first failing command no be to just dey do am silently:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Allow hook to fail without stopping azd.** For steps wey no too important (like optional cache warm-up or best-effort notification), use `continueOnError: true`. azd go log failure but e go still continue:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Test hooks separately before full run.** No need make you run `azd up` to debug hook—run am alone and dey improve fast fast:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Watch for OS-specific shells.** Hook wey use `shell: pwsh` need PowerShell for di machine wey run am (including CI agents). Use `shell: sh` for wide portability, or provide both `windows` and `posix` versions:

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

> **Debug tip:** run any azd command wit `--debug` to see exact hook command line and full output—this one go help if hook dey work fine locally but e dey fail for CI.

## 🎛️ Deployment Configuration

### Service-Specific Deployment Settings
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Environment-Specific Configurations

Dis na local azd values only. Explicitly link them to infrastructure/runtime configuration. `NODE_ENV` normally na `production` for deployed Node app, including for staging deployment; use separate app-specific variable to show different deployment stages.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

**Basic operational sketch:** You suppose supply both environments, one shared traffic-routing layer, and two scripts below. azd no dey switch traffic or automatically check rollback readiness. Make green remain until blue pass test and rollback no longer needed.

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

### Canary Deployments
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Traffic splitting dey belong to Container Apps configuration (Bicep or Azure CLI), no be `azure.yaml` `trafficSplit` property. Preview/provisioning and later deploys must keep your chosen revision mode and routing rules.

### Staged Deployments
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
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
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Set up runtime secrets wit `configuration.secrets`/`secretRef` (or Key Vault references) and scale wit `template.scale` inside Container App infrastructure. No dey create service-level `secrets` or `scale` properties inside `azure.yaml`.

### Multi-Stage Dockerfile Optimization
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
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
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Build Caching
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standard Node workflow dey use package scripts; service `prepackage` hooks fit add steps wey you need. Docker layer caching no be di same as service build command.

### Efficient Code Deployments
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Health Checks
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Your app suppose implement `/health`; azd no dey provide am automatically. No generic `azure.yaml` `healthCheck` service property dey.

### Post-Deployment Validation
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` no good. Normal environment values na local plaintext; no believe say read commands go hide them. Commands wey dey here dey save Key Vault references, but your infrastructure/app still need use the secrets and give runtime identity access.

### Network Security
Declare and use network parameters in Bicep, and map am in `infra/main.parameters.json`. No generic `infra.parameters` overlay for `azure.yaml`. Example documentation ranges `203.0.113.0/24` and `198.51.100.0/24` no be real office/VPN networks; replace dem wit authorized network ranges.

### Identity and Access Management
Enable the Container App's `identity` in Bicep and give the correct Key Vault data-plane role at the vault level. Configure named Key Vault-backed secrets and runtime references in that resource; `identity` and `keyVault` no be generic azd service properties. See [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Rollback Strategies

### Quick Rollback
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
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
**Goal**: Master di difference between full and incremental deployments

**Starting point:** Bash, Node.js 22, Git, azd sign-in, and Azure subscription wey get deployment rights. Run for new directory; expect billable App Service/Cosmos DB resources. Time need go based on region and template.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Success Criteria:**
- [ ] Record time for both commands (no guarantee for duration)
- [ ] Both commands go complete well
- [ ] API still dey work; dis comment-only edit no dey show for UI
- [ ] Infrastructure no change after `azd deploy`

**Learning Outcome**: `azd deploy` no go do infrastructure provisioning. Compare timings sharply no be to just assume fixed percent speed.

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Implement pre and post deployment automation

**Starting point:** di initialized `deployment-practice` project wey dey up there. If you don clean am, run `azd up` again before you test code-only deployment. Validation below dey use API real build script, no be nonexistent root `test:unit` script. Template API tests need configured database access; no be standalone unit tests.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Success Criteria:**
- [ ] Pre-deploy script run before deployment
- [ ] Deployment stop if build validation fail
- [ ] Post-deploy smoke test confirm say app dey healthy
- [ ] Hooks run for di right order

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Implement staged deployment workflow (dev → staging → production)

**Starting point:** di same initialized todo project wit `jq`. Create di environments wey dey below using real subscription/location values (or set `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` for each) **before** you start di no-prompt workflow. E dey fail on purpose instead of making up missing values dem. Make you use only disposable training environments, no be real production subscription.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

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
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Success Criteria:**
- [ ] Dev environment deploys successfully
- [ ] Staging environment deploys successfully
- [ ] Manual approval required for production
- [ ] All environments get working health checks
- [ ] Fit roll back if e necessary

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Make, and test deployment rollback use Git

**Starting point:** na isolated training checkout of di todo template wey get all baseline source committed, clean Git working tree, and disposable configured environment. No ever put deliberate failure for real production project. `APP_VERSION` na only bookkeeping unless you wire am into di app explicitly.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Success Criteria:**
- [ ] Fit detect deployment failures
- [ ] Rollback script dey run automatically
- [ ] Application come back to working state
- [ ] Health checks pass after rollback

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# View deployment history
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
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->