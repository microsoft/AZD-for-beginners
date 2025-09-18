<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T10:03:17+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "sk"
}
-->
# Príručka nasadenia - Ovládnutie nasadení AZD

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD Pre Začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód & Nasadenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 3: Konfigurácia](../getting-started/configuration.md)
- **➡️ Ďalej**: [Zabezpečenie zdrojov](provisioning.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 5: Riešenia Multi-Agent AI](../../examples/retail-scenario.md)

## Úvod

Táto komplexná príručka pokrýva všetko, čo potrebujete vedieť o nasadení aplikácií pomocou Azure Developer CLI, od základných nasadení jedným príkazom až po pokročilé produkčné scenáre s vlastnými hákmi, viacerými prostrediami a integráciou CI/CD. Ovládnite celý životný cyklus nasadenia pomocou praktických príkladov a osvedčených postupov.

## Ciele učenia

Po dokončení tejto príručky budete:
- Ovládať všetky príkazy a pracovné postupy nasadenia Azure Developer CLI
- Rozumieť celému životnému cyklu nasadenia od zabezpečenia zdrojov po monitorovanie
- Implementovať vlastné háky pre automatizáciu pred a po nasadení
- Konfigurovať viaceré prostredia s parametrami špecifickými pre prostredie
- Nastaviť pokročilé stratégie nasadenia vrátane blue-green a kanárskych nasadení
- Integrovať nasadenia azd do CI/CD pipeline a DevOps pracovných postupov

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne vykonávať a riešiť problémy všetkých pracovných postupov nasadenia azd
- Navrhovať a implementovať vlastnú automatizáciu nasadenia pomocou hákov
- Konfigurovať produkčne pripravené nasadenia s primeranou bezpečnosťou a monitorovaním
- Spravovať komplexné scenáre nasadenia vo viacerých prostrediach
- Optimalizovať výkon nasadenia a implementovať stratégie návratu
- Integrovať nasadenia azd do podnikových DevOps praktík

## Prehľad nasadenia

Azure Developer CLI poskytuje niekoľko príkazov na nasadenie:
- `azd up` - Kompletný pracovný postup (zabezpečenie + nasadenie)
- `azd provision` - Vytvorenie/aktualizácia iba Azure zdrojov
- `azd deploy` - Nasadenie iba aplikačného kódu
- `azd package` - Vytvorenie a balenie aplikácií

## Základné pracovné postupy nasadenia

### Kompletné nasadenie (azd up)
Najbežnejší pracovný postup pre nové projekty:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nasadenie iba infraštruktúry
Keď potrebujete aktualizovať iba Azure zdroje:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Nasadenie iba kódu
Pre rýchle aktualizácie aplikácií:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Pochopenie procesu nasadenia

### Fáza 1: Hák pred zabezpečením
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

### Fáza 2: Zabezpečenie infraštruktúry
- Číta šablóny infraštruktúry (Bicep/Terraform)
- Vytvára alebo aktualizuje Azure zdroje
- Konfiguruje sieťovanie a bezpečnosť
- Nastavuje monitorovanie a logovanie

### Fáza 3: Hák po zabezpečení
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

### Fáza 4: Balenie aplikácie
- Vytvára aplikačný kód
- Vytvára artefakty nasadenia
- Balenie pre cieľovú platformu (kontajnery, ZIP súbory, atď.)

### Fáza 5: Hák pred nasadením
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

### Fáza 6: Nasadenie aplikácie
- Nasadzuje zabalené aplikácie do Azure služieb
- Aktualizuje konfiguračné nastavenia
- Spúšťa/reštartuje služby

### Fáza 7: Hák po nasadení
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

## 🎛️ Konfigurácia nasadenia

### Nastavenia nasadenia špecifické pre službu
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

### Konfigurácie špecifické pre prostredie
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

## 🔧 Pokročilé scenáre nasadenia

### Aplikácie s viacerými službami
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

### Blue-Green nasadenia
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

### Kanárske nasadenia
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

### Fázové nasadenia
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

## 🐳 Nasadenia kontajnerov

### Nasadenia aplikácií v kontajneroch
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

### Optimalizácia Dockerfile pre viac fáz
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

## ⚡ Optimalizácia výkonu

### Paralelné nasadenia
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Cache pre buildy
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

### Inkrementálne nasadenia
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Monitorovanie nasadenia

### Monitorovanie nasadenia v reálnom čase
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Kontroly zdravia
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

### Validácia po nasadení
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

## 🔐 Bezpečnostné aspekty

### Správa tajomstiev
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

### Sieťová bezpečnosť
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Správa identity a prístupu
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

## 🚨 Stratégie návratu

### Rýchly návrat
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Návrat infraštruktúry
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Návrat migrácie databázy
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metódy nasadenia

### Sledovanie výkonu nasadenia
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Zber vlastných metód
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

## 🎯 Osvedčené postupy

### 1. Konzistentnosť prostredia
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validácia infraštruktúry
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Testovanie integrácie
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

### 4. Dokumentácia a logovanie
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Ďalšie kroky

- [Zabezpečenie zdrojov](provisioning.md) - Detailný pohľad na správu infraštruktúry
- [Plánovanie pred nasadením](../pre-deployment/capacity-planning.md) - Naplánujte si stratégiu nasadenia
- [Bežné problémy](../troubleshooting/common-issues.md) - Riešenie problémov s nasadením
- [Osvedčené postupy](../troubleshooting/debugging.md) - Produkčne pripravené stratégie nasadenia

## Dodatočné zdroje

- [Referenčná príručka nasadenia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nasadenie Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nasadenie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nasadenie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigácia**
- **Predchádzajúca lekcia**: [Váš prvý projekt](../getting-started/first-project.md)
- **Nasledujúca lekcia**: [Zabezpečenie zdrojov](provisioning.md)

---

**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.