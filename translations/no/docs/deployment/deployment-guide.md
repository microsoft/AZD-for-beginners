<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T06:17:05+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "no"
}
-->
# Veiledningsguide - Mestre AZD-deployeringer

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 4 - Infrastruktur som kode & deployering
- **⬅️ Forrige Kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)
- **➡️ Neste**: [Ressursprovisjonering](provisioning.md)
- **🚀 Neste Kapittel**: [Kapittel 5: Multi-Agent AI-løsninger](../../examples/retail-scenario.md)

## Introduksjon

Denne omfattende guiden dekker alt du trenger å vite om å deployere applikasjoner med Azure Developer CLI, fra grunnleggende deployering med én kommando til avanserte produksjonsscenarier med tilpassede hooks, flere miljøer og CI/CD-integrasjon. Mestre hele deployeringssyklusen med praktiske eksempler og beste praksis.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre alle Azure Developer CLI-deployeringskommandoer og arbeidsflyter
- Forstå hele deployeringssyklusen fra provisjonering til overvåking
- Implementere tilpassede deployeringshooks for automatisering før og etter deployering
- Konfigurere flere miljøer med miljøspesifikke parametere
- Sette opp avanserte deployeringsstrategier som blue-green og canary deployeringer
- Integrere azd-deployeringer med CI/CD-pipelines og DevOps-arbeidsflyter

## Læringsutbytte

Etter fullføring vil du kunne:
- Utføre og feilsøke alle azd-deployeringsarbeidsflyter selvstendig
- Designe og implementere tilpasset deployeringsautomatisering ved hjelp av hooks
- Konfigurere produksjonsklare deployeringer med riktig sikkerhet og overvåking
- Administrere komplekse deployeringsscenarier med flere miljøer
- Optimalisere deployeringsytelse og implementere rollback-strategier
- Integrere azd-deployeringer i virksomhetspraksis for DevOps

## Oversikt over deployering

Azure Developer CLI tilbyr flere deployeringskommandoer:
- `azd up` - Komplett arbeidsflyt (provisjon + deployering)
- `azd provision` - Opprett/oppdater kun Azure-ressurser
- `azd deploy` - Deployere kun applikasjonskode
- `azd package` - Bygg og pakk applikasjoner

## Grunnleggende deployeringsarbeidsflyter

### Komplett deployering (azd up)
Den vanligste arbeidsflyten for nye prosjekter:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun infrastruktur-deployering
Når du kun trenger å oppdatere Azure-ressurser:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Kun kode-deployering
For raske applikasjonsoppdateringer:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Forstå deployeringsprosessen

### Fase 1: Hooks før provisjonering
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

### Fase 2: Infrastrukturprovisjonering
- Leser infrastrukturmaler (Bicep/Terraform)
- Oppretter eller oppdaterer Azure-ressurser
- Konfigurerer nettverk og sikkerhet
- Setter opp overvåking og logging

### Fase 3: Hooks etter provisjonering
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
- Oppretter deployeringsartefakter
- Pakker for målplattform (containere, ZIP-filer, etc.)

### Fase 5: Hooks før deployering
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

### Fase 6: Applikasjonsdeployering
- Deployerer pakkede applikasjoner til Azure-tjenester
- Oppdaterer konfigurasjonsinnstillinger
- Starter/restarter tjenester

### Fase 7: Hooks etter deployering
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

## 🎛️ Deployeringskonfigurasjon

### Tjenestespesifikke deployeringsinnstillinger
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

## 🔧 Avanserte deployeringsscenarier

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

### Blue-Green deployeringer
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

### Canary deployeringer
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

### Trinnvise deployeringer
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

## 🐳 Container-deployeringer

### Deployering av containerapplikasjoner
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

### Parallelle deployeringer
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

### Inkrementelle deployeringer
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Overvåking av deployering

### Sanntids overvåking av deployering
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

### Validering etter deployering
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

## 🚨 Rollback-strategier

### Rask rollback
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Rollback av infrastruktur
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Rollback av database-migrering
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployeringsmetrikker

### Spor deployeringsytelse
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

### 1. Konsistens i miljøer
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

- [Ressursprovisjonering](provisioning.md) - Dypdykk i infrastrukturadministrasjon
- [Planlegging før deployering](../pre-deployment/capacity-planning.md) - Planlegg din deployeringsstrategi
- [Vanlige problemer](../troubleshooting/common-issues.md) - Løs deployeringsproblemer
- [Beste praksis](../troubleshooting/debugging.md) - Produksjonsklare deployeringsstrategier

## Tilleggsressurser

- [Azure Developer CLI Deployeringsreferanse](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployering](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployering](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployering](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasjon**
- **Forrige Leksjon**: [Ditt Første Prosjekt](../getting-started/first-project.md)
- **Neste Leksjon**: [Ressursprovisjonering](provisioning.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.