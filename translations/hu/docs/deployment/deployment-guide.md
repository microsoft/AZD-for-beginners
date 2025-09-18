<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T09:20:00+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "hu"
}
-->
# Telepítési útmutató - AZD telepítések mesterfokon

**Fejezetek navigációja:**
- **📚 Kurzus kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 4. fejezet - Infrastruktúra kódként és telepítés
- **⬅️ Előző fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)
- **➡️ Következő**: [Erőforrások előkészítése](provisioning.md)
- **🚀 Következő fejezet**: [5. fejezet: Többügynökös AI megoldások](../../examples/retail-scenario.md)

## Bevezetés

Ez az átfogó útmutató mindent lefed, amit az Azure Developer CLI használatával történő alkalmazástelepítésről tudni kell, az egyszerű egyparancsos telepítésektől kezdve a fejlett, egyedi horgokkal, több környezettel és CI/CD integrációval rendelkező produkciós forgatókönyvekig. Gyakorlati példák és bevált módszerek segítségével sajátíthatod el a teljes telepítési életciklust.

## Tanulási célok

Az útmutató elvégzésével:
- Mesteri szinten elsajátítod az Azure Developer CLI telepítési parancsait és munkafolyamatait
- Megérted a teljes telepítési életciklust az előkészítéstől a monitorozásig
- Egyedi telepítési horgokat valósítasz meg az automatikus elő- és utótelepítéshez
- Több környezetet konfigurálsz környezetspecifikus paraméterekkel
- Fejlett telepítési stratégiákat állítasz be, mint például blue-green és canary telepítések
- Integrálod az azd telepítéseket CI/CD csatornákba és DevOps munkafolyamatokba

## Tanulási eredmények

Az útmutató elvégzése után képes leszel:
- Az azd telepítési munkafolyamatokat önállóan végrehajtani és hibakeresni
- Egyedi telepítési automatizációt tervezni és megvalósítani horgok segítségével
- Produkcióra kész telepítéseket konfigurálni megfelelő biztonsággal és monitorozással
- Összetett, több környezetet érintő telepítési forgatókönyveket kezelni
- Optimalizálni a telepítési teljesítményt és visszaállítási stratégiákat alkalmazni
- Az azd telepítéseket vállalati DevOps gyakorlatokba integrálni

## Telepítési áttekintés

Az Azure Developer CLI több telepítési parancsot kínál:
- `azd up` - Teljes munkafolyamat (előkészítés + telepítés)
- `azd provision` - Csak Azure erőforrások létrehozása/frissítése
- `azd deploy` - Csak alkalmazáskód telepítése
- `azd package` - Alkalmazások építése és csomagolása

## Alapvető telepítési munkafolyamatok

### Teljes telepítés (azd up)
A leggyakoribb munkafolyamat új projektekhez:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Csak infrastruktúra telepítése
Amikor csak Azure erőforrásokat kell frissíteni:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Csak kód telepítése
Gyors alkalmazásfrissítésekhez:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ A telepítési folyamat megértése

### 1. fázis: Elő-telepítési horgok
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

### 2. fázis: Infrastruktúra előkészítése
- Infrastruktúra sablonok (Bicep/Terraform) olvasása
- Azure erőforrások létrehozása vagy frissítése
- Hálózat és biztonság konfigurálása
- Monitorozás és naplózás beállítása

### 3. fázis: Utó-telepítési horgok
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

### 4. fázis: Alkalmazás csomagolása
- Alkalmazáskód építése
- Telepítési artefaktumok létrehozása
- Csomagolás célplatformra (konténerek, ZIP fájlok stb.)

### 5. fázis: Elő-telepítési horgok
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

### 6. fázis: Alkalmazás telepítése
- Csomagolt alkalmazások telepítése Azure szolgáltatásokra
- Konfigurációs beállítások frissítése
- Szolgáltatások indítása/újraindítása

### 7. fázis: Utó-telepítési horgok
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

## 🎛️ Telepítési konfiguráció

### Szolgáltatásspecifikus telepítési beállítások
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

### Környezetspecifikus konfigurációk
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

## 🔧 Fejlett telepítési forgatókönyvek

### Több szolgáltatást érintő alkalmazások
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

### Blue-Green telepítések
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

### Canary telepítések
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

### Szakaszos telepítések
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

## 🐳 Konténer telepítések

### Konténeres alkalmazások telepítése
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

### Többlépcsős Dockerfile optimalizáció
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

## ⚡ Teljesítmény optimalizálás

### Párhuzamos telepítések
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Építési gyorsítótár
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

### Inkrementális telepítések
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Telepítési monitorozás

### Valós idejű telepítési monitorozás
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Egészségügyi ellenőrzések
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

### Utó-telepítési validáció
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

## 🔐 Biztonsági szempontok

### Titkok kezelése
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

### Hálózati biztonság
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitás- és hozzáférés-kezelés
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

## 🚨 Visszaállítási stratégiák

### Gyors visszaállítás
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Infrastruktúra visszaállítása
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Adatbázis migráció visszaállítása
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Telepítési metrikák

### Telepítési teljesítmény nyomon követése
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Egyedi metrikák gyűjtése
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

## 🎯 Bevált gyakorlatok

### 1. Környezetek konzisztenciája
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktúra validáció
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Integrációs tesztelés
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

### 4. Dokumentáció és naplózás
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Következő lépések

- [Erőforrások előkészítése](provisioning.md) - Mélyebb betekintés az infrastruktúra kezelésébe
- [Elő-telepítési tervezés](../pre-deployment/capacity-planning.md) - Telepítési stratégia megtervezése
- [Gyakori problémák](../troubleshooting/common-issues.md) - Telepítési problémák megoldása
- [Bevált gyakorlatok](../troubleshooting/debugging.md) - Produkcióra kész telepítési stratégiák

## További források

- [Azure Developer CLI telepítési referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service telepítés](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps telepítés](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions telepítés](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigáció**
- **Előző lecke**: [Az első projekted](../getting-started/first-project.md)
- **Következő lecke**: [Erőforrások előkészítése](provisioning.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.