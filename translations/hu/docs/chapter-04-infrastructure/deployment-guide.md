# Telepítési útmutató - AZD telepítések mesterfokon

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 4. fejezet – Infrastruktúra mint kód & telepítés
- **⬅️ Előző fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)
- **➡️ Következő**: [Erőforrások előkészítése](provisioning.md)
- **🚀 Következő fejezet**: [5. fejezet: Többügyfél AI megoldások](../../examples/retail-scenario.md)

## Bevezetés

Ez az átfogó útmutató mindent lefed, amit az Azure Developer CLI használatával történő alkalmazástelepítésről tudni kell, az alapvető egylépéses telepítésektől kezdve a fejlett, termelési környezetekig egyedi hookokkal, több környezettel és CI/CD integrációval. Sajátítsd el a teljes telepítési életciklust gyakorlati példák és bevált módszerek alapján.

## Tanulási célok

Az útmutató elvégzése után képes leszel:
- Mesteri szinten kezelni az Azure Developer CLI összes telepítési parancsát és munkafolyamatát
- Megérteni a teljes telepítési életciklust az erőforrások előkészítésétől a monitorozásig
- Egyedi telepítési hookokat alkalmazni elő- és utótelepítési automatizálásra
- Több környezetet konfigurálni, környezetspecifikus paraméterekkel
- Fejlett telepítési stratégiákat bevezetni, beleértve a blue-green és canary telepítéseket
- Az azd telepítések CI/CD folyamatokkal és DevOps munkafolyamatokkal való integrálását megvalósítani

## Tanulási eredmények

A kurzus végén képes leszel:
- Önállóan végrehajtani és hibakeresni az összes azd telepítési munkafolyamatot
- Egyedi telepítési automatizálást tervezni és megvalósítani hookok segítségével
- Termelésre kész telepítéseket konfigurálni megfelelő biztonsággal és monitorozással
- Komplex, több környezetes telepítési forgatókönyveket kezelni
- Optimalizálni a telepítési teljesítményt és visszagörgetési stratégiákat alkalmazni
- Az azd telepítéseket vállalati DevOps gyakorlatokba integrálni

## A telepítés áttekintése

Az Azure Developer CLI több telepítési parancsot kínál:
- `azd up` - Teljes munkafolyamat (erőforrás előkészítés + telepítés)
- `azd provision` - Csak Azure erőforrások létrehozása/frissítése
- `azd deploy` - Csak az alkalmazáskód telepítése
- `azd package` - Alkalmazások építése és csomagolása

## Alap telepítési munkafolyamatok

### Teljes telepítés (azd up)  
Új projektek leggyakoribb munkafolyamata:  
```bash
# Telepíts mindent a nulláról
azd up

# Telepítés adott környezettel
azd up --environment production

# Telepítés egyedi paraméterekkel
azd up --parameter location=westus2 --parameter sku=P1v2
```
  
### Csak infrastruktúra telepítése  
Ha csak Azure erőforrásokat kell frissíteni:  
```bash
# Infrastruktúra telepítése/frissítése
azd provision

# Telepítés szárazfutással a változások előnézetéhez
azd provision --preview

# Specifikus szolgáltatások telepítése
azd provision --service database
```
  
### Csak kód telepítése  
Gyors alkalmazásfrissítésekhez:  
```bash
# Minden szolgáltatás telepítése
azd deploy

# Várt kimenet:
# Szolgáltatások telepítése (azd deploy)
# - web: Telepítés... Kész
# - api: Telepítés... Kész
# SIKER: A telepítés 2 perc 15 másodperc alatt befejeződött

# Egy adott szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Telepítés egyedi build argumentumokkal
azd deploy --service api --build-arg NODE_ENV=production

# Telepítés ellenőrzése
azd show --output json | jq '.services'
```
  
### ✅ Telepítés ellenőrzése

Bármilyen telepítés után ellenőrizd a sikerességet:  

```bash
# Ellenőrizze, hogy minden szolgáltatás fut-e
azd show

# Tesztelje az egészségi végpontokat
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Figyelje a hibákat (alapértelmezés szerint böngészőben nyílik meg)
azd monitor --logs
```
  
**Siker kritériumok:**  
- ✅ Minden szolgáltatás "Fut" státuszt mutat  
- ✅ Az egészségügyi végpontok HTTP 200-as választ adnak  
- ✅ Az utolsó 5 percben nincs hibanapló  
- ✅ Az alkalmazás válaszol a tesztkérelmekre  

## 🏗️ A telepítési folyamat megértése

### 1. szakasz: Elő-erőforrás előkészítési hookok  
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
  
### 2. szakasz: Infrastruktúra előkészítése  
- Infrastruktúra sablonokat olvas (Bicep/Terraform)  
- Azure erőforrásokat hoz létre vagy frissít  
- Hálózatot és biztonságot konfigurál  
- Monitorozást és naplózást állít be  

### 3. szakasz: Utó-erőforrás előkészítési hookok  
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
  
### 4. szakasz: Alkalmazás csomagolása  
- Alkalmazáskódot épít  
- Telepítési csomagokat készít  
- Csomagol célplatformra (konténerek, ZIP fájlok stb.)  

### 5. szakasz: Elő-telepítési hookok  
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
  
### 6. szakasz: Alkalmazás telepítése  
- Csomagolt alkalmazásokat telepít Azure szolgáltatásokra  
- Konfigurációs beállításokat frissít  
- Szolgáltatásokat indít/újraindít  

### 7. szakasz: Utó-telepítési hookok  
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
  
## 🔧 Fejlett telepítési forgatókönyvek

### Több-szolgáltatásos alkalmazások  
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

# Forgalom átváltása kékre (kézi DNS/load balancer frissítés)
./scripts/switch-traffic.sh production-blue

# Zöld környezet takarítása
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
  
## 🐳 Konténeres telepítések

### Konténer alkalmazás telepítése  
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
  
### Többfázisú Dockerfile optimalizáció  
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
  
## ⚡ Teljesítmény-optimalizálás

### Szolgáltatásspecifikus telepítések  
```bash
# Egy adott szolgáltatás telepítése a gyorsabb iteráció érdekében
azd deploy --service web
azd deploy --service api

# Minden szolgáltatás telepítése
azd deploy
```
  
### Építési cache használata  
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```
  
### Hatékony kódtelepítések  
```bash
# Használd az azd deploy parancsot (ne azd up) csak kódváltozásokhoz
# Ez kihagyja az infrastruktúra kiépítését és sokkal gyorsabb
azd deploy

# Specifikus szolgáltatás telepítése a leggyorsabb iterációért
azd deploy --service api
```
  
## 🔍 Telepítés monitorozása

### Valós idejű telepítés monitorozása  
```bash
# Alkalmazás valós idejű figyelése
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
  
### Utótelepítési érvényesítés  
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
  
## 🔐 Biztonsági megfontolások

### Titkok kezelése  
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
  
### Azonosítás és jogosultságkezelés  
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
# Az AZD nem rendelkezik beépített visszaállítással. Ajánlott megközelítések:

# 1. lehetőség: Újratelepítés Gitből (ajánlott)
git revert HEAD  # Az érintett commit visszavonása
git push
azd deploy

# 2. lehetőség: Egy adott commit újratelepítése
git checkout <previous-commit-hash>
azd deploy
git checkout main
```
  
### Infrastrukturális visszagörgetés  
```bash
# Előnézet az infrastruktúraváltozásokról alkalmazás előtt
azd provision --preview

# Infrastruktúra visszaállításhoz használjon verziókezelést:
git revert HEAD  # Infrastruktúra változások visszavonása
azd provision    # Előző infrastruktúra állapot alkalmazása
```
  
### Adatbázis migráció visszagörgetés  
```bash
#!/bin/bash
# script/rollback-adatbazis.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```
  
## 📊 Telepítési metrikák

### Telepítési teljesítmény követése  
```bash
# Jelenlegi telepítési állapot megtekintése
azd show

# Alkalmazás figyelése az Application Insights segítségével
azd monitor --overview

# Élő metrikák megtekintése
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

### 1. Környezetek konzisztenciája  
```bash
# Használj következetes elnevezést
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Tartsd fenn a környezeti egyenértékűséget
./scripts/sync-environments.sh
```
  
### 2. Infrastruktúra érvényesítése  
```bash
# Infrastruktúra változások előnézete telepítés előtt
azd provision --preview

# ARM/Bicep lintelés használata
az bicep lint --file infra/main.bicep

# A Bicep szintaxis érvényesítése
az bicep build --file infra/main.bicep
```
  
### 3. Tesztelési integráció  
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
# Dokumentálja a telepítési eljárásokat
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```
  
## Következő lépések

- [Erőforrások előkészítése](provisioning.md) – Részletes bemutató az infrastruktúra kezeléséről  
- [Telepítés előtti tervezés](../chapter-06-pre-deployment/capacity-planning.md) – Tervezd meg telepítési stratégiádat  
- [Gyakori hibák](../chapter-07-troubleshooting/common-issues.md) – Telepítési problémák megoldása  
- [Legjobb gyakorlatok](../chapter-07-troubleshooting/debugging.md) – Termelésre kész telepítési stratégiák  

## 🎯 Gyakorlati telepítési feladatok

### 1. feladat: Inkrementális telepítési munkafolyamat (20 perc)  
**Cél**: A teljes és inkrementális telepítés közti különbség elsajátítása  

```bash
# Kezdeti telepítés
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Kezdeti telepítési idő rögzítése
echo "Full deployment: $(date)" > deployment-log.txt

# Kódbeli módosítás végrehajtása
echo "// Updated $(date)" >> src/api/src/server.js

# Csak a kód telepítése (gyors)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Idők összehasonlítása
cat deployment-log.txt

# Takarítás
azd down --force --purge
```
  
**Siker kritériumok:**  
- [ ] A teljes telepítés 5-15 percet vesz igénybe  
- [ ] A kód-only telepítés 2-5 percet vesz igénybe  
- [ ] A kódbeli változások megjelennek a telepített alkalmazásban  
- [ ] Az infrastruktúra változatlan marad az `azd deploy` után  

**Tanulási eredmény**: A `azd deploy` 50-70%-kal gyorsabb, mint a `azd up` kódváltozások esetén  

### 2. feladat: Egyedi telepítési hookok (30 perc)  
**Cél**: Elő- és utótelepítési automatizálás megvalósítása  

```bash
# Előtelepítési érvényesítő script létrehozása
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Ellenőrizze, hogy a tesztek sikeresen lefutnak-e
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

# Poszttelepítési gyorsellenőrzés létrehozása
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

# Hookok hozzáadása az azure.yaml fájlhoz
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Telepítés tesztelése hookokkal
azd deploy
```
  
**Siker kritériumok:**  
- [ ] Elő-telepítési szkript fut telepítés előtt  
- [ ] Telepítés megszakad, ha a tesztek nem sikerülnek  
- [ ] Utó-telepítési smoke test ellenőrzi az egészséget  
- [ ] A hookok megfelelő sorrendben futnak  

### 3. feladat: Több-környezetes telepítési stratégia (45 perc)  
**Cél**: Szakaszos telepítési munkafolyamat megvalósítása (fejlesztés → teszt → éles)  

```bash
# Telepítési szkript létrehozása
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 1. lépés: Telepítés fejlesztői környezetbe
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 2. lépés: Telepítés tesztelési környezetbe
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

# Szakaszos telepítés futtatása
./deploy-staged.sh
```
  
**Siker kritériumok:**  
- [ ] A fejlesztői környezet sikeresen települ  
- [ ] A tesztkörnyezet sikeresen települ  
- [ ] Az éles környezetre manuális jóváhagyás szükséges  
- [ ] Minden környezet működő egészségellenőrzéssel rendelkezik  
- [ ] Szükség esetén visszaállítható  

### 4. feladat: Visszagörgetési stratégia (25 perc)  
**Cél**: Telepítés visszagörgetésének megvalósítása és tesztelése Git segítségével  

```bash
# Telepítés v1
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash mentése
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 telepítése törő változással
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Hibák észlelése és visszagörgetés
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Visszagörgetés git használatával
    git revert HEAD --no-edit
    
    # Környezet visszagörgetése
    azd env set APP_VERSION "1.0.0"
    
    # v1 újratelepítése
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```
  
**Siker kritériumok:**  
- [ ] Felismeri a telepítési hibákat  
- [ ] Visszagörgetési szkript automatikusan fut  
- [ ] Az alkalmazás működő állapotba kerül visszagörgetés után  
- [ ] Egészségellenőrzések sikeresek visszagörgetés után  

## 📊 Telepítési metrikák követése

### Kövesd nyomon telepítéseid teljesítményét

```bash
# Létrehozás telepítési metrika szkript
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

# Használd ezt
./track-deployment.sh
```
  
**Elemezd metrikáidat:**  
```bash
# Telepítési előzmények megtekintése
cat deployment-metrics.csv

# Átlagos telepítési idő kiszámítása
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```
  
## További források

- [Azure Developer CLI telepítési referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service telepítés](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps telepítés](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions telepítés](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigáció**  
- **Előző lecke**: [Az első projekted](../chapter-01-foundation/first-project.md)  
- **Következő lecke**: [Erőforrások előkészítése](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvű változatát tekintse illetékes forrásnak. Kritikus információk esetén szakmai, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->