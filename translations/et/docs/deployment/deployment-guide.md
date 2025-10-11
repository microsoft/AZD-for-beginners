<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-10-11T15:59:22+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "et"
}
-->
# Juhtnöörid juurutamiseks - AZD juurutuste valdamine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 4 - Infrastruktuur kui kood ja juurutamine
- **⬅️ Eelmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)
- **➡️ Järgmine**: [Ressursside ettevalmistamine](provisioning.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Multi-agent AI lahendused](../../examples/retail-scenario.md)

## Sissejuhatus

See põhjalik juhend hõlmab kõike, mida peate teadma rakenduste juurutamisest Azure Developer CLI abil, alates lihtsatest ühe käsuga juurutustest kuni keerukate tootmistsenaariumiteni, mis hõlmavad kohandatud hook'e, mitut keskkonda ja CI/CD integratsiooni. Valdage kogu juurutustsüklit praktiliste näidete ja parimate tavade abil.

## Õpieesmärgid

Selle juhendi läbimisega:
- Valdate kõik Azure Developer CLI juurutuskäsud ja töövood
- Mõistate juurutustsüklit alates ettevalmistamisest kuni monitooringuni
- Rakendate kohandatud juurutushook'e automaatseks eel- ja järeljuurutamiseks
- Konfigureerite mitut keskkonda keskkonnaspetsiifiliste parameetritega
- Seadistate keerukaid juurutusstrateegiaid, sealhulgas blue-green ja canary juurutusi
- Integreerite azd juurutused CI/CD torujuhtmete ja DevOps töövoogudega

## Õpitulemused

Pärast juhendi läbimist suudate:
- Iseseisvalt täita ja tõrkeotsingut teha kõigi azd juurutustöövoogude puhul
- Kavandada ja rakendada kohandatud juurutusautomaatikat hook'ide abil
- Konfigureerida tootmisvalmis juurutusi, tagades turvalisuse ja monitooringu
- Hallata keerukaid mitme keskkonna juurutustsenaariume
- Optimeerida juurutuse jõudlust ja rakendada tagasipööramise strateegiaid
- Integreerida azd juurutused ettevõtte DevOps praktikatesse

## Juurutuse ülevaade

Azure Developer CLI pakub mitmeid juurutuskäske:
- `azd up` - Täielik töövoog (ettevalmistamine + juurutamine)
- `azd provision` - Ainult Azure'i ressursside loomine/uuendamine
- `azd deploy` - Ainult rakenduskoodi juurutamine
- `azd package` - Rakenduste ehitamine ja pakendamine

## Põhilised juurutustöövood

### Täielik juurutus (azd up)
Kõige tavalisem töövoog uute projektide jaoks:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ainult infrastruktuuri juurutamine
Kui on vaja uuendada ainult Azure'i ressursse:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Ainult koodi juurutamine
Kiirete rakenduse uuenduste jaoks:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Juurutustsükli mõistmine

### Faas 1: Eel-ettevalmistamise hook'id
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

### Faas 2: Infrastruktuuri ettevalmistamine
- Loeb infrastruktuuri malle (Bicep/Terraform)
- Loob või uuendab Azure'i ressursse
- Konfigureerib võrgu ja turvalisuse
- Seadistab monitooringu ja logimise

### Faas 3: Järel-ettevalmistamise hook'id
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

### Faas 4: Rakenduse pakendamine
- Ehitab rakenduskoodi
- Loob juurutusartefakte
- Pakendab sihtplatvormi jaoks (konteinerid, ZIP-failid jne)

### Faas 5: Eeljuurutamise hook'id
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

### Faas 6: Rakenduse juurutamine
- Juurutab pakendatud rakendused Azure'i teenustesse
- Uuendab konfiguratsiooniseadeid
- Käivitab/taaskäivitab teenused

### Faas 7: Järeljuurutamise hook'id
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

## 🎛️ Juurutuse konfiguratsioon

### Teenusepõhised juurutusseaded
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

### Keskkonnaspetsiifilised konfiguratsioonid
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

## 🔧 Täiustatud juurutustsenaariumid

### Mitme teenuse rakendused
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

### Blue-Green juurutused
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

### Canary juurutused
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

### Etapiviisilised juurutused
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

## 🐳 Konteinerite juurutused

### Konteinerirakenduste juurutused
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

### Mitmeastmeline Dockerfile optimeerimine
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

## ⚡ Jõudluse optimeerimine

### Paralleelsed juurutused
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Ehitusvahemälu
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

### Järk-järgulised juurutused
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Juurutuse monitooring

### Reaalajas juurutuse monitooring
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Tervisekontrollid
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

### Järeljuurutuse valideerimine
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

## 🔐 Turvalisuse kaalutlused

### Saladuste haldamine
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

### Võrgu turvalisus
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identiteedi ja juurdepääsu haldamine
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

## 🚨 Tagasipööramise strateegiad

### Kiire tagasipööramine
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Infrastruktuuri tagasipööramine
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Andmebaasi migratsiooni tagasipööramine
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Juurutuse mõõdikud

### Juurutuse jõudluse jälgimine
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Kohandatud mõõdikute kogumine
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

## 🎯 Parimad tavad

### 1. Keskkonna järjepidevus
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktuuri valideerimine
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Testimise integreerimine
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

### 4. Dokumentatsioon ja logimine
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Järgmised sammud

- [Ressursside ettevalmistamine](provisioning.md) - Süvitsi infrastruktuuri haldamine
- [Eeljuurutuse planeerimine](../pre-deployment/capacity-planning.md) - Planeerige oma juurutusstrateegia
- [Levinud probleemid](../troubleshooting/common-issues.md) - Lahendage juurutusprobleeme
- [Parimad tavad](../troubleshooting/debugging.md) - Tootmisvalmis juurutusstrateegiad

## Täiendavad ressursid

- [Azure Developer CLI juurutuse viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service juurutamine](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps juurutamine](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions juurutamine](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigeerimine**
- **Eelmine õppetund**: [Teie esimene projekt](../getting-started/first-project.md)
- **Järgmine õppetund**: [Ressursside ettevalmistamine](provisioning.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.