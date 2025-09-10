<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-10T06:18:55+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "hr"
}
-->
# Vodič za implementaciju - Ovladavanje AZD implementacijama

## Uvod

Ovaj sveobuhvatni vodič pokriva sve što trebate znati o implementaciji aplikacija pomoću Azure Developer CLI, od osnovnih implementacija jednim naredbom do naprednih produkcijskih scenarija s prilagođenim hookovima, višestrukim okruženjima i integracijom CI/CD-a. Ovladajte kompletnim životnim ciklusom implementacije uz praktične primjere i najbolje prakse.

## Ciljevi učenja

Završetkom ovog vodiča, naučit ćete:
- Ovladati svim naredbama i radnim procesima implementacije Azure Developer CLI-a
- Razumjeti kompletan životni ciklus implementacije, od pripreme do praćenja
- Implementirati prilagođene hookove za automatizaciju prije i poslije implementacije
- Konfigurirati višestruka okruženja s parametrima specifičnim za okruženje
- Postaviti napredne strategije implementacije, uključujući blue-green i canary implementacije
- Integrirati azd implementacije s CI/CD pipelineovima i DevOps radnim procesima

## Ishodi učenja

Po završetku, moći ćete:
- Samostalno izvršavati i rješavati probleme svih azd radnih procesa implementacije
- Dizajnirati i implementirati prilagođenu automatizaciju implementacije pomoću hookova
- Konfigurirati produkcijske implementacije s odgovarajućom sigurnošću i praćenjem
- Upravljati složenim scenarijima implementacije u više okruženja
- Optimizirati performanse implementacije i implementirati strategije povratka na prethodno stanje
- Integrirati azd implementacije u DevOps prakse na razini poduzeća

## Pregled implementacije

Azure Developer CLI pruža nekoliko naredbi za implementaciju:
- `azd up` - Kompletan radni proces (priprema + implementacija)
- `azd provision` - Samo kreiranje/ažuriranje Azure resursa
- `azd deploy` - Samo implementacija aplikacijskog koda
- `azd package` - Izrada i pakiranje aplikacija

## Osnovni radni procesi implementacije

### Kompletna implementacija (azd up)
Najčešći radni proces za nove projekte:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Samo implementacija infrastrukture
Kada trebate samo ažurirati Azure resurse:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Samo implementacija koda
Za brza ažuriranja aplikacija:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Razumijevanje procesa implementacije

### Faza 1: Hookovi prije pripreme
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

### Faza 2: Priprema infrastrukture
- Čita predloške infrastrukture (Bicep/Terraform)
- Kreira ili ažurira Azure resurse
- Konfigurira mrežu i sigurnost
- Postavlja praćenje i zapisivanje

### Faza 3: Hookovi nakon pripreme
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

### Faza 4: Pakiranje aplikacije
- Izrađuje aplikacijski kod
- Kreira artefakte implementacije
- Pakira za ciljne platforme (kontejneri, ZIP datoteke itd.)

### Faza 5: Hookovi prije implementacije
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

### Faza 6: Implementacija aplikacije
- Implementira pakirane aplikacije na Azure usluge
- Ažurira postavke konfiguracije
- Pokreće/ponovno pokreće usluge

### Faza 7: Hookovi nakon implementacije
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

## 🎛️ Konfiguracija implementacije

### Postavke implementacije specifične za uslugu
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

### Konfiguracije specifične za okruženje
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

## 🔧 Napredni scenariji implementacije

### Aplikacije s više usluga
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

### Blue-Green implementacije
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

### Canary implementacije
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

### Faze implementacije
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

## 🐳 Implementacije kontejnera

### Implementacije aplikacija u kontejnerima
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

### Optimizacija Dockerfile-a u više faza
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

## ⚡ Optimizacija performansi

### Paralelne implementacije
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Predmemoriranje izrade
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

### Inkrementalne implementacije
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Praćenje implementacije

### Praćenje implementacije u stvarnom vremenu
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Provjere zdravlja
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

### Validacija nakon implementacije
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

## 🔐 Sigurnosni aspekti

### Upravljanje tajnama
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

### Sigurnost mreže
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Upravljanje identitetom i pristupom
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

## 🚨 Strategije povratka na prethodno stanje

### Brzi povratak
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Povratak infrastrukture
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Povratak migracije baze podataka
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrike implementacije

### Praćenje performansi implementacije
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Prikupljanje prilagođenih metrika
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

## 🎯 Najbolje prakse

### 1. Dosljednost okruženja
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Integracija testiranja
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

### 4. Dokumentacija i zapisivanje
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sljedeći koraci

- [Priprema resursa](provisioning.md) - Detaljan pregled upravljanja infrastrukturom
- [Planiranje prije implementacije](../pre-deployment/capacity-planning.md) - Planirajte svoju strategiju implementacije
- [Uobičajeni problemi](../troubleshooting/common-issues.md) - Rješavanje problema s implementacijom
- [Najbolje prakse](../troubleshooting/debugging.md) - Strategije implementacije spremne za produkciju

## Dodatni resursi

- [Referenca za implementaciju Azure Developer CLI-a](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementacija Azure App Service-a](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementacija Azure Container Apps-a](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementacija Azure Functions-a](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna lekcija**: [Vaš prvi projekt](../getting-started/first-project.md)
- **Sljedeća lekcija**: [Priprema resursa](provisioning.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane stručnjaka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.