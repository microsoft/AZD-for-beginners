<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T21:39:16+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "no"
}
-->
# Veiledningsguide - Mestre AZD-utrullinger

## Introduksjon

Denne omfattende guiden dekker alt du trenger å vite om å rulle ut applikasjoner ved hjelp av Azure Developer CLI, fra grunnleggende utrullinger med én kommando til avanserte produksjonsscenarier med tilpassede hooks, flere miljøer og CI/CD-integrasjon. Mestre hele utrullingslivssyklusen med praktiske eksempler og beste praksis.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre alle Azure Developer CLI-kommandoer og arbeidsflyter for utrulling
- Forstå hele utrullingslivssyklusen fra klargjøring til overvåking
- Implementere tilpassede hooks for automatisering før og etter utrulling
- Konfigurere flere miljøer med miljøspesifikke parametere
- Sette opp avanserte utrullingsstrategier som blå-grønn og kanarifuglutrulling
- Integrere AZD-utrullinger med CI/CD-pipelines og DevOps-arbeidsflyter

## Læringsutbytte

Etter fullføring vil du kunne:
- Utføre og feilsøke alle AZD-utrullingsarbeidsflyter selvstendig
- Designe og implementere tilpasset utrullingsautomatisering ved hjelp av hooks
- Konfigurere produksjonsklare utrullinger med riktig sikkerhet og overvåking
- Administrere komplekse utrullingsscenarier med flere miljøer
- Optimalisere utrullingsytelse og implementere strategier for tilbakestilling
- Integrere AZD-utrullinger i virksomhetens DevOps-praksis

## Oversikt over utrulling

Azure Developer CLI tilbyr flere kommandoer for utrulling:
- `azd up` - Komplett arbeidsflyt (klargjøring + utrulling)
- `azd provision` - Opprett/oppdater kun Azure-ressurser
- `azd deploy` - Rull ut kun applikasjonskode
- `azd package` - Bygg og pakk applikasjoner

## Grunnleggende arbeidsflyter for utrulling

### Komplett utrulling (azd up)
Den vanligste arbeidsflyten for nye prosjekter:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun infrastrukturutrulling
Når du kun trenger å oppdatere Azure-ressurser:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Kun kodeutrulling
For raske oppdateringer av applikasjonen:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Forstå utrullingsprosessen

### Fase 1: Hooks før klargjøring
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

### Fase 2: Klargjøring av infrastruktur
- Leser infrastrukturmaler (Bicep/Terraform)
- Oppretter eller oppdaterer Azure-ressurser
- Konfigurerer nettverk og sikkerhet
- Setter opp overvåking og logging

### Fase 3: Hooks etter klargjøring
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

### Fase 4: Applikasjonspakking
- Bygger applikasjonskode
- Oppretter utrullingsartefakter
- Pakker for målplattform (containere, ZIP-filer, etc.)

### Fase 5: Hooks før utrulling
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

### Fase 6: Applikasjonsutrulling
- Ruller ut pakkede applikasjoner til Azure-tjenester
- Oppdaterer konfigurasjonsinnstillinger
- Starter/omstarter tjenester

### Fase 7: Hooks etter utrulling
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

## 🎛️ Konfigurasjon av utrulling

### Tjenestespesifikke innstillinger for utrulling
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

### Miljøspesifikke konfigurasjoner
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

## 🔧 Avanserte utrullingsscenarier

### Applikasjoner med flere tjenester
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

### Blå-grønn utrulling
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

### Kanarifuglutrulling
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

### Trinnvis utrulling
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

## 🐳 Utrulling av containere

### Utrulling av containerapplikasjoner
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

### Optimalisering av Dockerfile med flere stadier
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

## ⚡ Ytelsesoptimalisering

### Parallelle utrullinger
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Byggekaching
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

### Inkrementelle utrullinger
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Overvåking av utrulling

### Sanntidsovervåking av utrulling
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Helsesjekker
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

### Validering etter utrulling
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

## 🔐 Sikkerhetsvurderinger

### Håndtering av hemmeligheter
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

### Nettverkssikkerhet
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitet og tilgangsstyring
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

## 🚨 Strategier for tilbakestilling

### Rask tilbakestilling
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Tilbakestilling av infrastruktur
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Tilbakestilling av databaseendringer
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Utrullingsmetrikker

### Spor utrullingsytelse
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Tilpasset innsamling av metrikker
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

## 🎯 Beste praksis

### 1. Konsistens mellom miljøer
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

### 3. Testing av integrasjon
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

### 4. Dokumentasjon og logging
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Neste steg

- [Klargjøring av ressurser](provisioning.md) - Dypdykk i infrastrukturadministrasjon
- [Planlegging før utrulling](../pre-deployment/capacity-planning.md) - Planlegg din utrullingsstrategi
- [Vanlige problemer](../troubleshooting/common-issues.md) - Løs utrullingsproblemer
- [Beste praksis](../troubleshooting/debugging.md) - Produksjonsklare utrullingsstrategier

## Tilleggsressurser

- [Azure Developer CLI Utrullingsreferanse](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Utrulling](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Utrulling](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Utrulling](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasjon**
- **Forrige leksjon**: [Ditt første prosjekt](../getting-started/first-project.md)
- **Neste leksjon**: [Klargjøring av ressurser](provisioning.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.