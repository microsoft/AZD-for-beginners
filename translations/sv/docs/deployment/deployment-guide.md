<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T23:15:17+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "sv"
}
-->
# Implementeringsguide - Bemästra AZD-implementeringar

**Kapitelnavigation:**
- **📚 Kursens startsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 4 - Infrastruktur som kod & implementering
- **⬅️ Föregående kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)
- **➡️ Nästa**: [Resursförsörjning](provisioning.md)
- **🚀 Nästa kapitel**: [Kapitel 5: Multi-Agent AI-lösningar](../../examples/retail-scenario.md)

## Introduktion

Denna omfattande guide täcker allt du behöver veta om att implementera applikationer med Azure Developer CLI, från grundläggande implementeringar med enstaka kommandon till avancerade produktionsscenarier med anpassade hooks, flera miljöer och CI/CD-integration. Bemästra hela implementeringslivscykeln med praktiska exempel och bästa praxis.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra alla implementeringskommandon och arbetsflöden i Azure Developer CLI
- Förstå hela implementeringslivscykeln från resursförsörjning till övervakning
- Implementera anpassade hooks för automatisering före och efter implementering
- Konfigurera flera miljöer med miljöspecifika parametrar
- Ställa in avancerade implementeringsstrategier, inklusive blå-gröna och kanarieimplementeringar
- Integrera azd-implementeringar med CI/CD-pipelines och DevOps-arbetsflöden

## Läranderesultat

Efter att ha slutfört guiden kommer du att kunna:
- Självständigt utföra och felsöka alla azd-implementeringsarbetsflöden
- Designa och implementera anpassad implementeringsautomatisering med hooks
- Konfigurera produktionsklara implementeringar med korrekt säkerhet och övervakning
- Hantera komplexa implementeringsscenarier med flera miljöer
- Optimera implementeringsprestanda och implementera återställningsstrategier
- Integrera azd-implementeringar i företags DevOps-praktiker

## Implementeringsöversikt

Azure Developer CLI erbjuder flera implementeringskommandon:
- `azd up` - Komplett arbetsflöde (försörjning + implementering)
- `azd provision` - Skapa/uppdatera endast Azure-resurser
- `azd deploy` - Implementera endast applikationskod
- `azd package` - Bygga och paketera applikationer

## Grundläggande implementeringsarbetsflöden

### Komplett implementering (azd up)
Det vanligaste arbetsflödet för nya projekt:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Endast infrastrukturimplementering
När du bara behöver uppdatera Azure-resurser:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Endast kodimplementering
För snabba applikationsuppdateringar:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Förstå implementeringsprocessen

### Fas 1: Hooks före försörjning
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

### Fas 2: Infrastrukturförsörjning
- Läser infrastruktursmallar (Bicep/Terraform)
- Skapar eller uppdaterar Azure-resurser
- Konfigurerar nätverk och säkerhet
- Ställer in övervakning och loggning

### Fas 3: Hooks efter försörjning
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

### Fas 4: Applikationspaketering
- Bygger applikationskod
- Skapar implementeringsartefakter
- Paketerar för målplattform (containers, ZIP-filer, etc.)

### Fas 5: Hooks före implementering
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

### Fas 6: Applikationsimplementering
- Implementerar paketerade applikationer till Azure-tjänster
- Uppdaterar konfigurationsinställningar
- Startar/omstartar tjänster

### Fas 7: Hooks efter implementering
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

## 🎛️ Implementeringskonfiguration

### Tjänstespecifika implementeringsinställningar
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

### Miljöspecifika konfigurationer
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

## 🔧 Avancerade implementeringsscenarier

### Applikationer med flera tjänster
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

### Blå-gröna implementeringar
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

### Kanarieimplementeringar
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

### Stegvisa implementeringar
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

## 🐳 Containerimplementeringar

### Implementeringar av containerapplikationer
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

### Optimering av Dockerfiler i flera steg
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

## ⚡ Prestandaoptimering

### Parallella implementeringar
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Byggcache
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

### Inkrementella implementeringar
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Implementeringsövervakning

### Övervakning i realtid
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Hälsokontroller
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

### Validering efter implementering
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

## 🔐 Säkerhetsöverväganden

### Hantering av hemligheter
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

### Nätverkssäkerhet
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitet och åtkomsthantering
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

## 🚨 Återställningsstrategier

### Snabb återställning
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Infrastrukturåterställning
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Återställning av databasmigration
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Implementeringsmetrik

### Spåra implementeringsprestanda
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Insamling av anpassade metrik
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

## 🎯 Bästa praxis

### 1. Miljökonsistens
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validering av infrastruktur
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Testintegration
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

### 4. Dokumentation och loggning
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nästa steg

- [Resursförsörjning](provisioning.md) - Djupdykning i infrastrukturhantering
- [Planering före implementering](../pre-deployment/capacity-planning.md) - Planera din implementeringsstrategi
- [Vanliga problem](../troubleshooting/common-issues.md) - Lös implementeringsproblem
- [Bästa praxis](../troubleshooting/debugging.md) - Produktionsklara implementeringsstrategier

## Ytterligare resurser

- [Azure Developer CLI Implementeringsreferens](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Implementering](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Implementering](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Implementering](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Föregående lektion**: [Ditt första projekt](../getting-started/first-project.md)
- **Nästa lektion**: [Resursförsörjning](provisioning.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som kan uppstå vid användning av denna översättning.