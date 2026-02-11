# Telepítési útmutató - AZD telepítések mesterfokon

**Fejezet navigáció:**
- **📚 Tanfolyam főoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 4. fejezet - Infrastruktúra mint kód és telepítés
- **⬅️ Előző fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)
- **➡️ Következő**: [Erőforrások előkészítése](provisioning.md)
- **🚀 Következő fejezet**: [5. fejezet: Többügynökös MI megoldások](../../examples/retail-scenario.md)

## Bevezetés

Ez az átfogó útmutató minden szükséges tudnivalót lefed az Azure Developer CLI használatával történő alkalmazástelepítésekről, az egyszerű egylépéses telepítésektől a fejlett éles környezeti forgatókönyvekig, egyedi hookokkal, több környezettel és CI/CD integrációval. Sajátítsa el a teljes telepítési életciklust gyakorlati példákon és bevált eljárásokon keresztül.

## Tanulási célok

A útmutató elvégzésével képes lesz:
- Az Azure Developer CLI összes telepítési parancsának és munkafolyamatának elsajátítása
- A teljes telepítési életciklus megértése az erőforrások előkészítésétől a megfigyelésig
- Egyedi telepítési hookok megvalósítása elő- és utótelepítési automatizáláshoz
- Több környezet konfigurálása környezet-specifikus paraméterekkel
- Fejlett telepítési stratégiák beállítása, beleértve a blue-green és canary telepítéseket
- azd telepítések integrálása CI/CD csővezetékekkel és DevOps munkafolyamatokkal

## Tanulási eredmények

A tananyag elvégzése után képes lesz:
- Önállóan végrehajtani és hibakeresni az összes azd telepítési munkafolyamatot
- Egyedi telepítési automatizálás tervezése és végrehajtása hookok segítségével
- Éles környezetre kész telepítések konfigurálása megfelelő biztonsággal és megfigyeléssel
- Összetett, többkörnyezetes telepítési forgatókönyvek kezelése
- A telepítési teljesítmény optimalizálása és visszagörgetési stratégiák megvalósítása
- azd telepítések vállalati DevOps gyakorlatokba történő integrálása

## Telepítés áttekintése

Az Azure Developer CLI több telepítési parancsot biztosít:
- `azd up` - Teljes munkafolyamat (erőforrások előkészítése + telepítés)
- `azd provision` - Csak Azure erőforrások létrehozása/frissítése
- `azd deploy` - Csak az alkalmazáskód telepítése
- `azd package` - Alkalmazások buildelése és csomagolása

## Alap telepítési munkafolyamatok

### Teljes telepítés (azd up)
A leggyakoribb munkafolyamat új projektekhez:
```bash
# Telepítsen mindent az alapoktól
azd up

# Telepítsen megadott környezettel
azd up --environment production

# Telepítsen egyedi paraméterekkel
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Csak infrastruktúra telepítése
Ha csak az Azure erőforrásokat kell frissíteni:
```bash
# Infrastruktúra biztosítása/frissítése
azd provision

# Próbafuttatással (dry-run) történő biztosítás a változások előnézetéhez
azd provision --preview

# Konkrét szolgáltatások biztosítása
azd provision --service database
```

### Csak kód telepítés
Gyors alkalmazásfrissítésekhez:
```bash
# Az összes szolgáltatás telepítése
azd deploy

# Várt kimenet:
# Szolgáltatások telepítése (azd deploy)
# - web: Telepítés... Kész
# - api: Telepítés... Kész
# SIKER: A telepítésed 2 perc 15 másodperc alatt befejeződött

# Egy adott szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Telepítés egyéni build-argumentumokkal
azd deploy --service api --build-arg NODE_ENV=production

# Telepítés ellenőrzése
azd show --output json | jq '.services'
```

### ✅ Telepítés ellenőrzése

Bármilyen telepítés után ellenőrizze a sikerességet:

```bash
# Ellenőrizze, hogy az összes szolgáltatás fut
azd show

# Tesztelje az állapotellenőrző végpontokat
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Figyelje a hibákat (alapértelmezés szerint a böngészőben nyílik meg)
azd monitor --logs
```

**Sikerkritériumok:**
- ✅ Minden szolgáltatás "Fut" állapotban van
- ✅ Az egészségügyi végpontok HTTP 200 választ adnak
- ✅ Nincs hibanapló az elmúlt 5 percben
- ✅ Az alkalmazás válaszol a tesztkérésekre

## 🏗️ A telepítési folyamat megértése

### 1. fázis: Előkészítés előtti hookok
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
- Beolvassa az infrastruktúra sablonokat (Bicep/Terraform)
- Létrehozza vagy frissíti az Azure erőforrásokat
- Konfigurálja a hálózatot és a biztonságot
- Beállítja a megfigyelést és a naplózást

### 3. fázis: Előkészítés utáni hookok
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
- Buildeli az alkalmazáskódot
- Létrehozza a telepítési artefaktumokat
- Csomagolja a célnak megfelelő formátumba (konténerek, ZIP fájlok stb.)

### 5. fázis: Telepítés előtti hookok
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
- Telepíti a csomagolt alkalmazásokat Azure szolgáltatásokra
- Frissíti a konfigurációs beállításokat
- Elindítja/újraindítja a szolgáltatásokat

### 7. fázis: Telepítés utáni hookok
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

### Szolgáltatásra szabott telepítési beállítások
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

### Környezetre szabott konfigurációk
```bash
# Fejlesztési környezet
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Előzetes tesztkörnyezet
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

## 🔧 Fejlett telepítési forgatókönyvek

### Több szolgáltatásból álló alkalmazások
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
# Kék környezet létrehozása
azd env new production-blue
azd up --environment production-blue

# Kék környezet tesztelése
./scripts/test-environment.sh production-blue

# Forgalom átkapcsolása a kékre (kézi DNS/terheléselosztó frissítés)
./scripts/switch-traffic.sh production-blue

# Zöld környezet eltávolítása
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

### Szakaszos (staged) telepítések
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

### Container App telepítések
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

### Szolgáltatás specifikus telepítések
```bash
# Telepítsen egy adott szolgáltatást a gyorsabb iteráció érdekében
azd deploy --service web
azd deploy --service api

# Telepítsen minden szolgáltatást
azd deploy
```

### Build gyorsítótárazás
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Hatékony kód telepítések
```bash
# Használja az azd deploy parancsot (ne az azd up-ot) csak kódot érintő változtatásokhoz
# Ez kihagyja az infrastruktúra kiépítését, és sokkal gyorsabb
azd deploy

# Telepítsen egy adott szolgáltatást a lehető leggyorsabb iterációhoz
azd deploy --service api
```

## 🔍 Telepítés megfigyelése

### Valós idejű telepítés megfigyelés
```bash
# Alkalmazás valós idejű monitorozása
azd monitor --live

# Alkalmazás naplóinak megtekintése
azd monitor --logs

# Telepítés állapotának ellenőrzése
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

### Telepítés utáni érvényesítés
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Ellenőrizze az alkalmazás állapotát
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
# Titkok biztonságos tárolása
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Hivatkozás a titkokra az azure.yaml fájlban
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

## 🚨 Visszagörgetési stratégiák

### Gyors visszagörgetés
```bash
# Az AZD-nek nincs beépített visszaállítási funkciója. Ajánlott megközelítések:

# Opció 1: Újratelepítés Gitből (ajánlott)
git revert HEAD  # Vond vissza a problémás commitot
git push
azd deploy

# Opció 2: Egy adott commit újratelepítése
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktúra visszagörgetése
```bash
# Tekintse át az infrastruktúra-változásokat mielőtt alkalmazná
azd provision --preview

# Az infrastruktúra visszaállításához használjon verziókezelést:
git revert HEAD  # Vonja vissza az infrastruktúra-változásokat
azd provision    # Alkalmazza az előző infrastruktúra-állapotot
```

### Adatbázis migráció visszagörgetése
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Telepítési mérőszámok

### Kövesse a telepítési teljesítményt
```bash
# Aktuális telepítés állapotának megtekintése
azd show

# Az alkalmazás monitorozása az Application Insights segítségével
azd monitor --overview

# Élő mérőszámok megtekintése
azd monitor --live
```

### Egyedi metrikagyűjtés
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

## 🎯 Legjobb gyakorlatok

### 1. Környezeti konzisztencia
```bash
# Használj következetes elnevezést
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Tartsd fenn a környezetek közötti konzisztenciát
./scripts/sync-environments.sh
```

### 2. Infrastruktúra érvényesítése
```bash
# Tekintse át az infrastruktúra-változásokat telepítés előtt
azd provision --preview

# Használjon ARM/Bicep lintelést
az bicep lint --file infra/main.bicep

# Ellenőrizze a Bicep szintaxisát
az bicep build --file infra/main.bicep
```

### 3. Tesztelés integrációja
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
# Dokumentáld a telepítési eljárásokat
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Következő lépések

- [Erőforrások előkészítése](provisioning.md) - Mélyebb áttekintés az infrastruktúra kezeléséről
- [Telepítés előtti tervezés](../chapter-06-pre-deployment/capacity-planning.md) - Tervezze meg a telepítési stratégiáját
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md) - Telepítési problémák megoldása
- [Legjobb gyakorlatok](../chapter-07-troubleshooting/debugging.md) - Éles környezetre kész telepítési stratégiák

## 🎯 Gyakorlati telepítési feladatok

### Gyakorlat 1: Inkrementális telepítési munkafolyamat (20 perc)
**Cél**: Sajátítsa el a teljes és az inkrementális telepítések közti különbséget

```bash
# Kezdeti telepítés
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rögzítse a kezdeti telepítés idejét
echo "Full deployment: $(date)" > deployment-log.txt

# Módosítsa a kódot
echo "// Updated $(date)" >> src/api/src/server.js

# Csak a kód telepítése (gyors)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Hasonlítsa össze az időket
cat deployment-log.txt

# Takarítás
azd down --force --purge
```

**Sikerkritériumok:**
- [ ] A teljes telepítés 5–15 percet vesz igénybe
- [ ] A csak kód telepítés 2–5 percet vesz igénybe
- [ ] A kódváltoztatások tükröződnek a telepített alkalmazásban
- [ ] Az infrastruktúra változatlan marad az `azd deploy` után

**Tanulási eredmény**: A `azd deploy` 50–70%-kal gyorsabb, mint a `azd up` kódváltoztatások esetén

### Gyakorlat 2: Egyedi telepítési hookok (30 perc)
**Cél**: Valósítson meg telepítés előtti és utáni automatizálást

```bash
# Telepítés előtti érvényesítési szkript létrehozása
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Ellenőrizze, hogy a tesztek sikeresen lefutnak-e
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Ellenőrizze, vannak-e commitálatlan változtatások
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Telepítés utáni smoke teszt létrehozása
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

# Hookok hozzáadása az azure.yaml-hoz
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Tesztelje a telepítést hookokkal
azd deploy
```

**Sikerkritériumok:**
- [ ] A telepítés előtti script lefut a telepítés előtt
- [ ] A telepítés megszakad, ha a tesztek megbuknak
- [ ] A telepítés utáni gyors ellenőrzés érvényesíti az egészséget
- [ ] A hookok helyes sorrendben hajtódnak végre

### Gyakorlat 3: Többkörnyezetes telepítési stratégia (45 perc)
**Cél**: Valósítson meg szakaszos telepítési munkafolyamatot (dev → staging → production)

```bash
# Telepítési szkript létrehozása
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 1. lépés: Telepítés a fejlesztési környezetbe
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 2. lépés: Telepítés a staging környezetbe
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 3. lépés: Kézi jóváhagyás az éles környezethez
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

**Sikerkritériumok:**
- [ ] A fejlesztői környezet sikeresen települ
- [ ] A staging környezet sikeresen települ
- [ ] Az éles környezethez kézi jóváhagyás szükséges
- [ ] Minden környezetnek működő egészségellenőrzései vannak
- [ ] Szükség esetén vissza tud térni egy korábbi verzióra

### Gyakorlat 4: Visszagörgetési stratégia (25 perc)
**Cél**: Valósítson meg és teszteljen telepítési visszagörgetést Git használatával

```bash
# v1 telepítése
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash mentése
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 telepítése visszafelé nem kompatibilis változtatással
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# hiba észlelése és visszaállítás
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # visszaállítás git használatával
    git revert HEAD --no-edit
    
    # környezet visszaállítása
    azd env set APP_VERSION "1.0.0"
    
    # v1 újratelepítése
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Sikerkritériumok:**
- [ ] Fel tudja ismerni a telepítési hibákat
- [ ] A visszagörgetési script automatikusan lefut
- [ ] Az alkalmazás visszatér működő állapotba
- [ ] Az egészségellenőrzések sikeresek a visszagörgetés után

## 📊 Telepítési metrikák követése

### Kövesse a telepítési teljesítményét

```bash
# Készíts telepítési metrikagyűjtő szkriptet
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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Naplózz fájlba
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Használd
./track-deployment.sh
```

**Elemezze a metrikáit:**
```bash
# Telepítési előzmények megtekintése
cat deployment-metrics.csv

# Átlagos telepítési idő kiszámítása
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## További források

- [Azure Developer CLI telepítési referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service telepítése](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps telepítése](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions telepítése](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigáció**
- **Előző lecke**: [Az első projekt](../chapter-01-foundation/first-project.md)
- **Következő lecke**: [Erőforrások előkészítése](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ez a dokumentum a Co-op Translator (https://github.com/Azure/co-op-translator) nevű mesterséges intelligencia alapú fordítószolgáltatással készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatizált fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén szakmai, emberi fordítást javasolunk. Nem vállalunk felelősséget a jelen fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->