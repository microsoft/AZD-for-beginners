<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-10T06:19:16+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "sl"
}
-->
# Vodnik za uvajanje - Obvladovanje uvajanj z AZD

## Uvod

Ta obsežen vodnik zajema vse, kar morate vedeti o uvajanju aplikacij z Azure Developer CLI, od osnovnih uvajanj z enim ukazom do naprednih produkcijskih scenarijev s prilagojenimi kljukami, več okolji in integracijo CI/CD. Obvladujte celoten življenjski cikel uvajanja s praktičnimi primeri in najboljšimi praksami.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Obvladali vse ukaze in delovne tokove za uvajanje z Azure Developer CLI
- Razumeli celoten življenjski cikel uvajanja, od priprave do spremljanja
- Implementirali prilagojene kljuke za avtomatizacijo pred in po uvajanju
- Konfigurirali več okolij s parametri, specifičnimi za okolje
- Nastavili napredne strategije uvajanja, vključno z blue-green in kanarskimi uvajanji
- Integrirali uvajanja z azd v CI/CD pipeline in DevOps delovne tokove

## Rezultati učenja

Po zaključku boste sposobni:
- Samostojno izvajati in odpravljati težave pri vseh delovnih tokovih uvajanja z azd
- Oblikovati in implementirati prilagojeno avtomatizacijo uvajanja s kljukami
- Konfigurirati produkcijsko pripravljena uvajanja z ustrezno varnostjo in spremljanjem
- Upravljati kompleksne scenarije uvajanja v več okoljih
- Optimizirati zmogljivost uvajanja in implementirati strategije povratka
- Integrirati uvajanja z azd v prakse podjetniškega DevOps-a

## Pregled uvajanja

Azure Developer CLI ponuja več ukazov za uvajanje:
- `azd up` - Celoten delovni tok (priprava + uvajanje)
- `azd provision` - Ustvarjanje/posodabljanje Azure virov
- `azd deploy` - Uvajanje aplikacijske kode
- `azd package` - Gradnja in pakiranje aplikacij

## Osnovni delovni tokovi uvajanja

### Celotno uvajanje (azd up)
Najpogostejši delovni tok za nove projekte:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Uvajanje samo infrastrukture
Ko morate posodobiti le Azure vire:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Uvajanje samo kode
Za hitre posodobitve aplikacij:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Razumevanje procesa uvajanja

### Faza 1: Ključi pred pripravo
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

### Faza 2: Priprava infrastrukture
- Bere predloge infrastrukture (Bicep/Terraform)
- Ustvari ali posodobi Azure vire
- Konfigurira omrežje in varnost
- Nastavi spremljanje in beleženje

### Faza 3: Ključi po pripravi
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
- Gradi aplikacijsko kodo
- Ustvari artefakte uvajanja
- Pakira za ciljno platformo (kontejnerji, ZIP datoteke itd.)

### Faza 5: Ključi pred uvajanjem
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

### Faza 6: Uvajanje aplikacije
- Uvede pakirane aplikacije v Azure storitve
- Posodobi nastavitve konfiguracije
- Zažene/ponovno zažene storitve

### Faza 7: Ključi po uvajanju
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

## 🎛️ Konfiguracija uvajanja

### Nastavitve uvajanja, specifične za storitve
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

### Konfiguracije, specifične za okolje
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

## 🔧 Napredni scenariji uvajanja

### Aplikacije z več storitvami
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

### Blue-Green uvajanja
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

### Kanarska uvajanja
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

### Fazična uvajanja
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

## 🐳 Uvajanja kontejnerjev

### Uvajanja aplikacij v kontejnerjih
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

### Optimizacija večstopenjskega Dockerfile-a
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

## ⚡ Optimizacija zmogljivosti

### Vzporedna uvajanja
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Predpomnjenje gradnje
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

### Inkrementalna uvajanja
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Spremljanje uvajanja

### Spremljanje uvajanja v realnem času
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Preverjanje zdravja
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

### Validacija po uvajanju
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

## 🔐 Varnostni vidiki

### Upravljanje skrivnosti
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

### Omrežna varnost
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Upravljanje identitete in dostopa
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

## 🚨 Strategije povratka

### Hiter povratek
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Povratek infrastrukture
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Povratek migracije podatkovnih baz
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrični podatki uvajanja

### Spremljanje zmogljivosti uvajanja
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Zbiranje prilagojenih metrik
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

## 🎯 Najboljše prakse

### 1. Doslednost okolja
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

### 4. Dokumentacija in beleženje
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Naslednji koraki

- [Priprava virov](provisioning.md) - Podrobnejši pregled upravljanja infrastrukture
- [Načrtovanje pred uvajanjem](../pre-deployment/capacity-planning.md) - Načrtujte svojo strategijo uvajanja
- [Pogoste težave](../troubleshooting/common-issues.md) - Reševanje težav pri uvajanju
- [Najboljše prakse](../troubleshooting/debugging.md) - Strategije za produkcijsko pripravljena uvajanja

## Dodatni viri

- [Referenca za uvajanje z Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Uvajanje Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Uvajanje Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Uvajanje Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prejšnja lekcija**: [Vaš prvi projekt](../getting-started/first-project.md)
- **Naslednja lekcija**: [Priprava virov](provisioning.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.