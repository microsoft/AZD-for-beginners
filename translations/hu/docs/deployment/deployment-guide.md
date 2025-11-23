<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-23T10:28:27+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "hu"
}
-->
# Telepítési Útmutató - AZD Telepítések Mesterfokon

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 4. fejezet - Infrastruktúra mint kód & Telepítés
- **⬅️ Előző Fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)
- **➡️ Következő**: [Erőforrások Létrehozása](provisioning.md)
- **🚀 Következő Fejezet**: [5. fejezet: Többügynökös MI Megoldások](../../examples/retail-scenario.md)

## Bevezetés

Ez az átfogó útmutató mindent lefed, amit az alkalmazások Azure Developer CLI segítségével történő telepítéséről tudni kell, az egyszerű, egyparancsos telepítésektől kezdve a fejlett, egyedi horgokkal, több környezettel és CI/CD integrációval rendelkező éles forgatókönyvekig. Gyakorlati példák és bevált gyakorlatok segítségével sajátíthatja el a teljes telepítési életciklust.

## Tanulási Célok

Az útmutató elvégzésével:
- Mesteri szinten elsajátítja az Azure Developer CLI telepítési parancsait és munkafolyamatait
- Megérti a teljes telepítési életciklust az erőforrások létrehozásától a monitorozásig
- Egyedi telepítési horgokat valósít meg az automatikus elő- és utótelepítéshez
- Több környezetet konfigurál környezetspecifikus paraméterekkel
- Fejlett telepítési stratégiákat állít be, beleértve a kék-zöld és kanári telepítéseket
- Integrálja az azd telepítéseket CI/CD csővezetékekbe és DevOps munkafolyamatokba

## Tanulási Eredmények

A tanfolyam elvégzése után képes lesz:
- Önállóan végrehajtani és hibaelhárítani az összes azd telepítési munkafolyamatot
- Egyedi telepítési automatizálást tervezni és megvalósítani horgok segítségével
- Éles telepítéseket konfigurálni megfelelő biztonsággal és monitorozással
- Összetett, több környezetet érintő telepítési forgatókönyveket kezelni
- Optimalizálni a telepítési teljesítményt és visszagörgetési stratégiákat alkalmazni
- Az azd telepítéseket vállalati DevOps gyakorlatokba integrálni

## Telepítési Áttekintés

Az Azure Developer CLI több telepítési parancsot kínál:
- `azd up` - Teljes munkafolyamat (létrehozás + telepítés)
- `azd provision` - Csak Azure erőforrások létrehozása/frissítése
- `azd deploy` - Csak alkalmazáskód telepítése
- `azd package` - Alkalmazások építése és csomagolása

## Alapvető Telepítési Munkafolyamatok

### Teljes Telepítés (azd up)
A leggyakoribb munkafolyamat új projektekhez:
```bash
# Telepítsen mindent a semmiből
azd up

# Telepítés meghatározott környezettel
azd up --environment production

# Telepítés egyedi paraméterekkel
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Csak Infrastruktúra Telepítése
Amikor csak az Azure erőforrásokat kell frissíteni:
```bash
# Infrastruktúra biztosítása/frissítése
azd provision

# Száraz futtatással történő biztosítás a változások előnézetéhez
azd provision --preview

# Konkrét szolgáltatások biztosítása
azd provision --service database
```

### Csak Kód Telepítése
Gyors alkalmazásfrissítésekhez:
```bash
# Telepítse az összes szolgáltatást
azd deploy

# Várható kimenet:
# Szolgáltatások telepítése (azd deploy)
# - web: Telepítés... Kész
# - api: Telepítés... Kész
# SIKER: A telepítés 2 perc 15 másodperc alatt befejeződött

# Adott szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Telepítés egyedi build argumentumokkal
azd deploy --service api --build-arg NODE_ENV=production

# Telepítés ellenőrzése
azd show --output json | jq '.services'
```

### ✅ Telepítés Ellenőrzése

Bármely telepítés után ellenőrizze a sikerességet:

```bash
# Ellenőrizze, hogy minden szolgáltatás fut-e
azd show

# Tesztelje az egészségügyi végpontokat
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Ellenőrizze a naplókat hibákért
azd logs --service api --since 5m | grep -i error
```

**Sikerességi Kritériumok:**
- ✅ Minden szolgáltatás "Fut" állapotot mutat
- ✅ Az egészségügyi végpontok HTTP 200-at adnak vissza
- ✅ Az utolsó 5 percben nincs hibanapló
- ✅ Az alkalmazás válaszol a tesztkérésekre

## 🏗️ A Telepítési Folyamat Megértése

### 1. Fázis: Előzetes Létrehozási Horgok
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

### 2. Fázis: Infrastruktúra Létrehozása
- Infrastruktúra sablonok (Bicep/Terraform) beolvasása
- Azure erőforrások létrehozása vagy frissítése
- Hálózat és biztonság konfigurálása
- Monitorozás és naplózás beállítása

### 3. Fázis: Utólagos Létrehozási Horgok
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
- Alkalmazáskód építése
- Telepítési artefaktumok létrehozása
- Csomagolás célplatformra (konténerek, ZIP fájlok stb.)

### 5. Fázis: Előzetes Telepítési Horgok
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
- Csomagolt alkalmazások telepítése Azure szolgáltatásokra
- Konfigurációs beállítások frissítése
- Szolgáltatások indítása/újraindítása

### 7. Fázis: Utólagos Telepítési Horgok
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

## 🎛️ Telepítési Konfiguráció

### Szolgáltatásspecifikus Telepítési Beállítások
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

### Környezetspecifikus Konfigurációk
```bash
# Fejlesztési környezet
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Tesztelési környezet
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

## 🔧 Fejlett Telepítési Forgatókönyvek

### Többszolgáltatásos Alkalmazások
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

### Kék-Zöld Telepítések
```bash
# Hozzon létre kék környezetet
azd env new production-blue
azd up --environment production-blue

# Tesztelje a kék környezetet
./scripts/test-environment.sh production-blue

# Váltson forgalmat a kékre (kézi DNS/terheléselosztó frissítés)
./scripts/switch-traffic.sh production-blue

# Tisztítsa meg a zöld környezetet
azd env select production-green
azd down --force
```

### Kanári Telepítések
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

### Szakaszos Telepítések
```bash
#!/bin/bash
# telepítés-előkészített.sh

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

## 🐳 Konténer Telepítések

### Konténer Alkalmazás Telepítések
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

### Többlépcsős Dockerfile Optimalizálás
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

## ⚡ Teljesítmény Optimalizálás

### Párhuzamos Telepítések
```bash
# Konfigurálja a párhuzamos telepítést
azd config set deploy.parallelism 5

# Szolgáltatások telepítése párhuzamosan
azd deploy --parallel
```

### Építési Gyorsítótár
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

### Inkrementális Telepítések
```bash
# Csak a megváltozott szolgáltatásokat telepítse
azd deploy --incremental

# Telepítés változásérzékeléssel
azd deploy --detect-changes
```

## 🔍 Telepítési Monitorozás

### Valós Idejű Telepítési Monitorozás
```bash
# Figyelje a telepítés előrehaladását
azd deploy --follow

# Tekintse meg a telepítési naplókat
azd logs --follow --service api

# Ellenőrizze a telepítés állapotát
azd show --service api
```

### Egészségügyi Ellenőrzések
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

### Utólagos Telepítési Érvényesítés
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

## 🔐 Biztonsági Szempontok

### Titkok Kezelése
```bash
# Tárolja a titkokat biztonságosan
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Hivatkozzon a titkokra az azure.yaml fájlban
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

### Hálózati Biztonság
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitás és Hozzáférés Kezelés
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

### Gyors Visszagörgetés
```bash
# Visszaállítás az előző telepítésre
azd deploy --rollback

# Egy adott szolgáltatás visszaállítása
azd deploy --service api --rollback

# Visszaállítás egy adott verzióra
azd deploy --service api --version v1.2.3
```

### Infrastruktúra Visszagörgetés
```bash
# Infrastruktúra változások visszaállítása
azd provision --rollback

# Visszaállítási változások előnézete
azd provision --rollback --preview
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

## 📊 Telepítési Metrikák

### Telepítési Teljesítmény Nyomon Követése
```bash
# Engedélyezze a telepítési metrikákat
azd config set telemetry.deployment.enabled true

# Tekintse meg a telepítési előzményeket
azd history

# Szerezze meg a telepítési statisztikákat
azd metrics --type deployment
```

### Egyedi Metrikák Gyűjtése
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

## 🎯 Bevált Gyakorlatok

### 1. Környezeti Konzisztencia
```bash
# Használjon következetes elnevezést
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Tartsa fenn a környezetek egyezését
./scripts/sync-environments.sh
```

### 2. Infrastruktúra Érvényesítés
```bash
# Érvényesítés telepítés előtt
azd provision --preview
azd provision --what-if

# Használja az ARM/Bicep lintelést
az bicep lint --file infra/main.bicep
```

### 3. Tesztelési Integráció
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
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Következő Lépések

- [Erőforrások Létrehozása](provisioning.md) - Mélyebb betekintés az infrastruktúra kezelésébe
- [Előzetes Telepítési Tervezés](../pre-deployment/capacity-planning.md) - Tervezze meg telepítési stratégiáját
- [Gyakori Problémák](../troubleshooting/common-issues.md) - Telepítési problémák megoldása
- [Bevált Gyakorlatok](../troubleshooting/debugging.md) - Éles telepítési stratégiák

## 🎯 Gyakorlati Telepítési Feladatok

### Feladat 1: Inkrementális Telepítési Munkafolyamat (20 perc)
**Cél**: Ismerje meg a teljes és az inkrementális telepítések közötti különbséget

```bash
# Kezdeti telepítés
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rögzítse a kezdeti telepítés idejét
echo "Full deployment: $(date)" > deployment-log.txt

# Végezzen kódváltoztatást
echo "// Updated $(date)" >> src/api/src/server.js

# Csak kódot telepítsen (gyors)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Idők összehasonlítása
cat deployment-log.txt

# Takarítás
azd down --force --purge
```

**Sikerességi Kritériumok:**
- [ ] Teljes telepítés 5-15 percet vesz igénybe
- [ ] Csak kód telepítése 2-5 percet vesz igénybe
- [ ] A kódváltozások megjelennek a telepített alkalmazásban
- [ ] Az infrastruktúra változatlan marad az `azd deploy` után

**Tanulási Eredmény**: Az `azd deploy` 50-70%-kal gyorsabb, mint az `azd up` kódváltozások esetén

### Feladat 2: Egyedi Telepítési Horgok (30 perc)
**Cél**: Elő- és utótelepítési automatizálás megvalósítása

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

# Hozzon létre telepítés utáni gyors tesztet
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

# Adjon hozzá horgokat az azure.yaml-hoz
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Tesztelje a telepítést horgokkal
azd deploy
```

**Sikerességi Kritériumok:**
- [ ] Az előtelepítési szkript a telepítés előtt fut
- [ ] A telepítés megszakad, ha a tesztek megbuknak
- [ ] Az utótelepítési gyors teszt érvényesíti az egészséget
- [ ] A horgok helyes sorrendben futnak

### Feladat 3: Többkörnyezetes Telepítési Stratégia (45 perc)
**Cél**: Szakaszos telepítési munkafolyamat megvalósítása (fejlesztés → tesztelés → éles)

```bash
# Hozzon létre telepítési szkriptet
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

# 3. lépés: Kézi jóváhagyás a termelési környezethez
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

# Fokozatos telepítés futtatása
./deploy-staged.sh
```

**Sikerességi Kritériumok:**
- [ ] A fejlesztési környezet sikeresen települ
- [ ] A tesztelési környezet sikeresen települ
- [ ] Manuális jóváhagyás szükséges az éles környezethez
- [ ] Minden környezet működő egészségügyi ellenőrzésekkel rendelkezik
- [ ] Szükség esetén visszagörgethető

### Feladat 4: Visszagörgetési Stratégia (25 perc)
**Cél**: Telepítési visszagörgetés megvalósítása és tesztelése

```bash
# Telepítse v1-et
azd env set APP_VERSION "1.0.0"
azd up

# Mentse el a v1 konfigurációt
cp -r .azure/production .azure/production-v1-backup

# Telepítse v2-t törő változással
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Hibát észlel
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Kód visszaállítása
    git checkout src/api/src/server.js
    
    # Környezet visszaállítása
    azd env set APP_VERSION "1.0.0"
    
    # Telepítse újra v1-et
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Sikerességi Kritériumok:**
- [ ] A telepítési hibák észlelhetők
- [ ] A visszagörgetési szkript automatikusan fut
- [ ] Az alkalmazás visszatér működő állapotba
- [ ] Az egészségügyi ellenőrzések sikeresek a visszagörgetés után

## 📊 Telepítési Metrikák Nyomon Követése

### Kövesse Nyomon Telepítési Teljesítményét

```bash
# Hozzon létre telepítési metrikák szkriptet
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

# Naplózás fájlba
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Használja ezt
./track-deployment.sh
```

**Elemezze metrikáit:**
```bash
# Tekintse meg a telepítési előzményeket
cat deployment-metrics.csv

# Számítsa ki az átlagos telepítési időt
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## További Források

- [Azure Developer CLI Telepítési Referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Telepítés](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Telepítés](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Telepítés](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigáció**
- **Előző Lecke**: [Első Projektje](../getting-started/first-project.md)
- **Következő Lecke**: [Erőforrások Létrehozása](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->