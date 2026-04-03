# Telepítési Útmutató - AZD Telepítések Mesterfokon

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi Fejezet**: 4. fejezet - Infrastruktúra kódként és Telepítés
- **⬅️ Előző Fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)
- **➡️ Következő**: [Erőforrások előkészítése](provisioning.md)
- **🚀 Következő Fejezet**: [5. fejezet: Többügynökös AI Megoldások](../../examples/retail-scenario.md)

## Bevezetés

Ez az átfogó útmutató mindent lefed, amit az Azure Developer CLI használatával történő alkalmazástelepítésről tudni kell, az egyszerű egylépéses telepítésektől kezdve, a haladó, egyedi hook-okkal, több környezettel és CI/CD integrációval rendelkező éles helyzetekig. Sajátítsd el a teljes telepítési életciklust gyakorlati példák és bevált módszerek segítségével.

## Tanulási Célok

Az útmutató elvégzésével:
- Mesteri szinten kezelheted az Azure Developer CLI összes telepítési parancsát és munkafolyamatát
- Megérted a teljes telepítési életciklust az előkészítéstől a figyelésig
- Megvalósítod az egyedi telepítési hook-okat elő- és utóautomatikához
- Konfigurálod a több környezetet környezet-specifikus paraméterekkel
- Beállítasz haladó telepítési stratégiákat, beleértve a blue-green és canary telepítéseket
- Integrálod az azd telepítéseket CI/CD pipeline-okba és DevOps munkafolyamatokba

## Tanulási Eredmények

A kurzus sikeres elvégzése után képes leszel:
- Függetlenül végrehajtani és hibakeresni az összes azd telepítési munkafolyamatot
- Egyedi telepítési automatizálást tervezni és megvalósítani hook-ok használatával
- Éles környezetre kész telepítéseket konfigurálni megfelelő biztonsággal és monitorozással
- Kezelni összetett, több környezetes telepítési forgatókönyveket
- Optimalizálni a telepítési teljesítményt és megvalósítani visszagörgetési stratégiákat
- Beilleszteni az azd telepítéseket vállalati DevOps gyakorlatokba

## Telepítési Áttekintés

Az Azure Developer CLI több telepítési parancsot kínál:
- `azd up` - Teljes munkafolyamat (erőforrás előkészítés + telepítés)
- `azd provision` - Csak Azure erőforrások létrehozása/frissítése
- `azd deploy` - Csak az alkalmazáskód telepítése
- `azd package` - Alkalmazások építése és csomagolása

## Alapvető Telepítési Munkafolyamatok

### Teljes Telepítés (azd up)
A leggyakoribb munkafolyamat új projektekhez:
```bash
# Minden telepítése a nulláról
azd up

# Telepítés adott környezettel
azd up --environment production

# Telepítés egyedi paraméterekkel
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Csak Infrastruktúra Telepítés
Ha csak az Azure erőforrásokat kell frissíteni:
```bash
# Infrastruktúra biztosítása/frissítése
azd provision

# Biztosítás száraz futtatással a változások előnézetéhez
azd provision --preview

# Konkrét szolgáltatások biztosítása
azd provision --service database
```

### Csak Kód Telepítés
Gyors alkalmazásfrissítésekhez:
```bash
# Minden szolgáltatás telepítése
azd deploy

# Várt kimenet:
# Szolgáltatások telepítése (azd deploy)
# - web: Telepítés... Kész
# - api: Telepítés... Kész
# SIKERES: A telepítés 2 perc 15 másodperc alatt befejeződött

# Egy adott szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Telepítés egyéni build argumentumokkal
azd deploy --service api --build-arg NODE_ENV=production

# Telepítés ellenőrzése
azd show --output json | jq '.services'
```

### ✅ Telepítés Ellenőrzése

Bármilyen telepítés után ellenőrizd a sikerességet:

```bash
# Ellenőrizze, hogy minden szolgáltatás fut-e
azd show

# Egészségügyi végpontok tesztelése
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Hibák figyelése (alapértelmezés szerint a böngészőben nyílik meg)
azd monitor --logs
```

**Sikerességi Kritériumok:**
- ✅ Minden szolgáltatás "Fut" állapotban jelenik meg
- ✅ Az egészségügyi végpontok HTTP 200-as választ adnak
- ✅ Az elmúlt 5 percben nincs hibajelentés a naplókban
- ✅ Az alkalmazás válaszol a tesztkérésekre

## 🏗️ A Telepítési Folyamat Megértése

### 1. Fázis: Előkészítő Provision Hook-ok
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

### 2. Fázis: Infrastruktúra Előkészítése
- Beolvassa az infrastruktúra sablonokat (Bicep/Terraform)
- Létrehozza vagy frissíti az Azure erőforrásokat
- Konfigurálja a hálózatot és a biztonságot
- Beállítja a monitorozást és naplózást

### 3. Fázis: Utólagos Provision Hook-ok
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

### 4. Fázis: Alkalmazás Csomagolása
- Felépíti az alkalmazáskódot
- Létrehozza a telepítési artefaktumokat
- Csomagolja a céleszköz platformjára (konténerek, ZIP fájlok stb.)

### 5. Fázis: Előtelepítési Hook-ok
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

### 6. Fázis: Alkalmazás Telepítése
- Telepíti a csomagolt alkalmazást az Azure szolgáltatásokra
- Frissíti a konfigurációs beállításokat
- Elindítja/újraindítja a szolgáltatásokat

### 7. Fázis: Utótelepítési Hook-ok
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

## 🎛️ Telepítési Konfigurációk

### Szolgáltatás-Specifikus Telepítési Beállítások
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

### Környezet-Specifikus Konfigurációk
```bash
# Fejlesztői környezet
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Tesztkörnyezet
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Éles környezet
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Haladó Telepítési Forgatókönyvek

### Több Szolgáltatásból Álló Alkalmazások
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

### Blue-Green Telepítések
```bash
# Kék környezet létrehozása
azd env new production-blue
azd up --environment production-blue

# Kék környezet tesztelése
./scripts/test-environment.sh production-blue

# Forgalom átváltása kékre (kézi DNS/load balancer frissítés)
./scripts/switch-traffic.sh production-blue

# Zöld környezet takarítása
azd env select production-green
azd down --force
```

### Canary Telepítések
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

### Fokozatos Telepítések
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

## 🐳 Konténeres Telepítések

### Container App Telepítések
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

### Többlépéses Dockerfile Optimalizáció
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

## ⚡ Teljesítményoptimalizálás

### Szolgáltatás-Specifikus Telepítések
```bash
# Egy adott szolgáltatás telepítése a gyorsabb iteráció érdekében
azd deploy --service web
azd deploy --service api

# Minden szolgáltatás telepítése
azd deploy
```

### Build Gyorsítótárazás
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Hatékony Kód Telepítések
```bash
# Az kódváltoztatásokhoz használd az azd deploy parancsot (ne az azd up-ot)
# Ez kihagyja az infrastruktúra kiépítését, és sokkal gyorsabb
azd deploy

# Egy adott szolgáltatás telepítése a leggyorsabb iterációhoz
azd deploy --service api
```

## 🔍 Telepítés Monitorozás

### Valós Idejű Telepítés Figyelés
```bash
# Alkalmazás valós idejű megfigyelése
azd monitor --live

# Alkalmazásnaplók megtekintése
azd monitor --logs

# Telepítési állapot ellenőrzése
azd show
```

### Egészségellenőrzések
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

### Utótelepítési Érvényesítés
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Alkalmazás állapotának ellenőrzése
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

## 🔐 Biztonsági Szempontok

### Titkok Kezelése
```bash
# Titkok biztonságos tárolása
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Titkok hivatkozása az azure.yaml fájlban
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

### Hálózatbiztonság
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitás- és Hozzáférés-kezelés
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

## 🚨 Visszagörgetési Stratégiák

### Gyors Rollback
```bash
# Az AZD-nek nincs beépített visszaállítása. Ajánlott megközelítések:

# 1. lehetőség: Újratelepítés Gitből (ajánlott)
git revert HEAD  # A problémás commit visszavonása
git push
azd deploy

# 2. lehetőség: Egy adott commit újratelepítése
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktúra Rollback
```bash
# Az infrastruktúra változtatásainak előnézete alkalmazás előtt
azd provision --preview

# Az infrastruktúra visszaállításához használjon verziókezelést:
git revert HEAD  # Infrastrukturális változtatások visszavonása
azd provision    # Az előző infrastruktúra állapot alkalmazása
```

### Adatbázis Migráció Visszagörgetés
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Telepítési Mutatók

### Telepítési Teljesítmény Követése
```bash
# Aktuális telepítési állapot megtekintése
azd show

# Alkalmazás figyelése az Application Insights segítségével
azd monitor --overview

# Élő mérőszámok megtekintése
azd monitor --live
```

### Egyedi Mutatók Gyűjtése
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

## 🎯 Legjobb Gyakorlatok

### 1. Környezet Konzisztencia
```bash
# Használj következetes elnevezést
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Tarts fenn környezeti azonosságot
./scripts/sync-environments.sh
```

### 2. Infrastruktúra Ellenőrzése
```bash
# Az infrastruktúra változásainak előnézete telepítés előtt
azd provision --preview

# Használjon ARM/Bicep lintelést
az bicep lint --file infra/main.bicep

# Ellenőrizze a Bicep szintaxist
az bicep build --file infra/main.bicep
```

### 3. Teszt Integráció
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

### 4. Dokumentáció és Naplózás
```bash
# Dokumentálja a telepítési eljárásokat
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Következő Lépések

- [Erőforrások előkészítése](provisioning.md) - Mélyreható infrastruktúra kezelés
- [Telepítés előtti tervezés](../chapter-06-pre-deployment/capacity-planning.md) - Tervezd meg a telepítési stratégiát
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md) - Telepítési hibák megoldása
- [Legjobb gyakorlatok](../chapter-07-troubleshooting/debugging.md) - Éles környezetre kész telepítési stratégiák

## 🎯 Gyakorlati Telepítési Feladatok

### Feladat 1: Inkrementális Telepítési Munkafolyamat (20 perc)
**Cél**: Sajátítsd el a teljes és inkrementális telepítések közötti különbséget

```bash
# Kezdeti telepítés
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Kezdeti telepítési idő rögzítése
echo "Full deployment: $(date)" > deployment-log.txt

# Kód módosítása
echo "// Updated $(date)" >> src/api/src/server.js

# Csak kód telepítése (gyors)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Idők összehasonlítása
cat deployment-log.txt

# Takarítás
azd down --force --purge
```

**Sikerességi Kritériumok:**
- [ ] A teljes telepítés 5-15 percet vesz igénybe
- [ ] Csak kód telepítés 2-5 percet vesz igénybe
- [ ] A kódváltozások megjelennek a telepített alkalmazásban
- [ ] Az infrastruktúra nem változik az `azd deploy` után

**Tanulási Eredmény**: `azd deploy` 50-70%-kal gyorsabb a kódváltozások esetén, mint az `azd up`

### Feladat 2: Egyedi Telepítési Hook-ok (30 perc)
**Cél**: Valósítsd meg az elő- és utótelepítési automatizálást

```bash
# Hozzon létre előtelepítési validációs szkriptet
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Ellenőrizze, hogy a tesztek sikeresek-e
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Ellenőrizze a nem elkötelezett változtatásokat
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Hozzon létre utótelepítési smoke tesztet
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

# Adjon hozzá hookokat az azure.yaml-hoz
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Tesztelje az telepítést hookokkal
azd deploy
```

**Sikerességi Kritériumok:**
- [ ] Az előtelepítési szkript lefut a telepítés előtt
- [ ] A telepítés megszakad, ha a tesztek sikertelenek
- [ ] Az utótelepítési teszt érvényesíti az egészséget
- [ ] A hook-ok helyes sorrendben futnak le

### Feladat 3: Több Környezetes Telepítési Stratégia (45 perc)
**Cél**: Valósíts meg fokozatos telepítési munkafolyamatot (dev → staging → production)

```bash
# Telepítési szkript létrehozása
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 1. lépés: Telepítés fejlesztési környezetbe
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 2. lépés: Telepítés tesztkörnyezetbe
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 3. lépés: Manuális jóváhagyás éles környezethez
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

# Környezetek létrehozása
azd env new dev
azd env new staging
azd env new production

# Szakaszos telepítés futtatása
./deploy-staged.sh
```

**Sikerességi Kritériumok:**
- [ ] A fejlesztői környezet sikeresen települ
- [ ] A staging környezet sikeresen települ
- [ ] Az éles környezethez manuális jóváhagyás szükséges
- [ ] Minden környezetben működnek az egészségellenőrzések
- [ ] Szükség esetén vissza tudsz görgetni

### Feladat 4: Visszagörgetési Stratégia (25 perc)
**Cél**: Valósítsd meg és teszteld a telepítési rollback-et Git használatával

```bash
# Telepítés v1
azd env set APP_VERSION "1.0.0"
azd up

# Mentse az v1 commit hash-t
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Telepítés v2 törő változással
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Hiba észlelése és visszavonás
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Visszavonás git használatával
    git revert HEAD --no-edit
    
    # Környezet visszaállítása
    azd env set APP_VERSION "1.0.0"
    
    # v1 újratelepítése
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Sikerességi Kritériumok:**
- [ ] Felismeri a telepítési hibákat
- [ ] A rollback szkript automatikusan lefut
- [ ] Az alkalmazás működő állapotba kerül visszagörgetés után
- [ ] Az egészségellenőrzések sikeresek rollback után

## 📊 Telepítési Mutatók Követése

### Kövesd nyomon a telepítési teljesítményed

```bash
# Készíts telepítési metrikák szkriptet
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

# Naplózás fájlba
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Használd ezt
./track-deployment.sh
```

**Elemzd a mutatóidat:**
```bash
# Telepítési előzmények megtekintése
cat deployment-metrics.csv

# Átlagos telepítési idő kiszámítása
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## További Források

- [Azure Developer CLI Telepítési Referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Telepítés](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Telepítés](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Telepítés](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigáció**
- **Előző Lecke**: [Az első projekted](../chapter-01-foundation/first-project.md)
- **Következő Lecke**: [Erőforrások előkészítése](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás segítségével fordítottuk le. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén szakmai emberi fordítást javasolunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->