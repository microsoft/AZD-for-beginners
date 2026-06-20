# Telepítési útmutató - AZD telepítések elsajátítása

**Fejezet navigáció:**
- **📚 Kurzus kezdőoldal**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 4. fejezet - Infrastrukturaként kód és telepítés
- **⬅️ Előző fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)
- **➡️ Következő**: [Erőforrások előkészítése](provisioning.md)
- **🧩 Szintén ebben a fejezetben**: [Saját sablon készítése](custom-templates.md)
- **🚀 Következő fejezet**: [5. fejezet: Többügynökös AI megoldások](../../examples/retail-scenario.md)

## Bevezetés

Ez az átfogó útmutató mindent lefed, amit tudnia kell az alkalmazások Azure Developer CLI használatával történő telepítéséről, az egyszerű, egyparancsos telepítésektől az összetett, testreszabott hook-okkal, több környezettel és CI/CD integrációval rendelkező éles forgatókönyvekig. Sajátítsa el a teljes telepítési életciklust gyakorlati példák és bevált gyakorlatok segítségével.

## Tanulási célok

Az útmutató elvégzése után Ön:
- Elsajátítja az összes Azure Developer CLI telepítési parancsot és munkafolyamatot
- Megérti a teljes telepítési életciklust az előkészítéstől a monitorozásig
- Implementál egyedi telepítési hook-okat elő- és utótelepítési automatizáláshoz
- Konfigurál több környezetet környezetspecifikus paraméterekkel
- Beállít fejlett telepítési stratégiákat, beleértve a blue-green és canary telepítéseket
- Integrálja az azd telepítéseket CI/CD pipeline-okkal és DevOps munkafolyamatokkal

## Tanulási eredmények

Az útmutató végére képes lesz:
- Önállóan végrehajtani és hibakeresni az összes azd telepítési munkafolyamatot
- Tervezni és megvalósítani egyedi telepítési automatizálást hook-ok segítségével
- Előkészíteni éles környezetbe telepíthető megoldásokat megfelelő biztonsággal és monitorozással
- Kezelni összetett, többkörnyezetes telepítési forgatókönyveket
- Optimalizálni a telepítés teljesítményét és visszavonási stratégiákat alkalmazni
- Integrálni az azd telepítéseket vállalati DevOps gyakorlatokba

## Telepítés áttekintése

Az Azure Developer CLI több telepítési parancsot kínál:
- `azd up` - Teljes munkafolyamat (előállítás + telepítés)
- `azd provision` - Csak Azure erőforrások létrehozása/frissítése
- `azd deploy` - Csak alkalmazáskód telepítése
- `azd package` - Alkalmazás buildelése és csomagolása

## Alap telepítési munkafolyamatok

### Teljes telepítés (azd up)
A leggyakoribb munkafolyamat új projektekhez:
```bash
# Minden telepítése az elejétől
azd up

# Telepítés meghatározott környezettel
azd up --environment production

# Telepítés egyedi paraméterekkel
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Csak infrastruktúra telepítés
Ha csak az Azure erőforrásokat kell frissíteni:
```bash
# Infrastruktúra biztosítása/frissítése
azd provision

# Biztosítás próba futtatással a változások előnézetéhez
azd provision --preview

# Specifikus szolgáltatások biztosítása
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
# SIKERES: A telepítés 2 perc 15 másodperc alatt befejeződött

# Egy adott szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Telepítés egyedi build argumentumokkal
azd deploy --service api --build-arg NODE_ENV=production

# A telepítés ellenőrzése
azd show --output json | jq '.services'
```

### ✅ Telepítés ellenőrzése

Bármilyen telepítés után ellenőrizze a sikerességet:

```bash
# Ellenőrizze, hogy az összes szolgáltatás fut-e
azd show

# Tesztelje az egészségügyi végpontokat
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Figyelje a hibákat (alapértelmezés szerint a böngészőben nyílik meg)
azd monitor --logs
```

**Siker kritériumok:**
- ✅ Minden szolgáltatás "Futásban" státuszt mutat
- ✅ Egészségügyi végpontok HTTP 200-at adnak vissza
- ✅ Nincs hiba napló az utolsó 5 percben
- ✅ Az alkalmazás válaszol a tesztkérésekre

## 🏗️ A telepítési folyamat megértése

### Újonc a hook-ok terén? Itt kezdje

A **hook** egy olyan parancs, amit az azd automatikusan futtat egy adott pillanatban a telepítési folyamat során — az erőforrások előkészítése előtt vagy után, illetve a kód telepítése előtt vagy után. Lehetővé teszik, hogy automatizálja azokat a kis feladatokat, amelyek mindig kísérik a telepítést: adatbázismagvetést, migrációkat, asset buildelést vagy az éles alkalmazás ellenőrzését.

| Hook | Mikor fut | Gyakori használat |
|------|-----------|-------------------|
| `preprovision` | Az erőforrások létrehozása előtt | Előfeltételek ellenőrzése, bejelentkezés registry-be |
| `postprovision` | Az erőforrások létrejötte után | Erőforrások konfigurálása, adatbázis beállítása |
| `predeploy` | A kód telepítése előtt | Front-end assetek buildelése, egységtesztek futtatása |
| `postdeploy` | A kód élesítése után | Adatmigrációk futtatása, gyors ellenőrzés végpontokon |

A hook-ok az ön `azure.yaml` fájljában élnek. Íme a legkisebb példája — csak kiír egy üzenetet a telepítés után:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```


Ennyi az egész — legközelebb, amikor futtatja az `azd up`-ot, az üzenet automatikusan megjelenik. Hook-ot önmagában is futtathat, telepítés nélkül, ami hasznos teszteléshez:

```bash
azd hooks run postdeploy
```


Az alábbi fázisokban valós környezetből származó hook-ok láthatók (migrációk, tesztek, validációk) az egyes lépésekhez.

### 1. fázis: Pre-Provision hook-ok
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

### 2. fázis: Infrastrukturális előkészítés
- Infrastrukturális sablonok (Bicep/Terraform) betöltése
- Azure erőforrások létrehozása vagy frissítése
- Hálózat és biztonság beállítása
- Monitorozás és naplózás beállítása

### 3. fázis: Post-Provision hook-ok
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

### 4. fázis: Alkalmazás csomagolás
- Alkalmazáskód buildelése
- Telepítési artefaktumok előállítása
- Csomagolás célplatformra (konténerek, ZIP fájlok stb.)

### 5. fázis: Pre-Deploy hook-ok
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

### 6. fázis: Alkalmazástelepítés
- Csomagolt alkalmazások telepítése Azure szolgáltatásokba
- Konfiguráció frissítése
- Szolgáltatások indítása/újraindítása

### 7. fázis: Post-Deploy hook-ok
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

### Hook hibakezelés

Alapértelmezés szerint **ha egy hook parancs nem nullás visszatérési kóddal lép ki, az azd leállítja a teljes műveletet.** Ez általában kívánatos — egy sikertelen migráció megállítsa a telepítést, ne szállítson hibás alkalmazást. Ezért a hook-ok megírása körültekintést igényel.

**1. Tegye a hibákat hangossá és szándékossá.** Egy hook akkor hibás, ha az utolsó parancsa nem nulla visszatérési kóddal lép ki. Shell skriptekben használja a `set -e` parancsot, hogy a hook az első hibás parancsnál megálljon, ne folytatódjon csendben:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Engedje meg, hogy egy hook hibára fusson az azd leállítása nélkül.** Nem kritikus lépésekhez (opcionális cache melegítés, legjobb erőfeszítés értesítés) állítsa be a `continueOnError: true` értéket. Az azd naplózza a hibát, de folytatja:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Tesztelje a hook-okat külön-külön teljes futtatás előtt.** Nem kell az `azd up`-ot futtatni a hibakereséshez — indítsa el a hook-ot önállóan és iteráljon gyorsan:

```bash
azd hooks run predeploy          # csak a predeploy hookot futtatja
azd hooks run postdeploy --service api
```

**4. Ügyeljen az operációs rendszerhez kötött shell-ekre.** Ha a hook `shell: pwsh`-t használ, ahhoz telepített PowerShell kell a gépen (beleértve CI ügynököket is). A legszélesebb kompatibilitásért használja a `shell: sh`-t, vagy adjon meg `windows` és `posix` variánsokat:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Hibakeresési tipp:** futtasson bármilyen azd parancsot a `--debug` kapcsolóval, hogy lássa a pontos hook parancssort és a teljes kimenetet — felbecsülhetetlen, ha a hook lokálisan működik, de CI-ben hibázik.

## 🎛️ Telepítési konfiguráció

### Szolgáltatás-specifikus telepítési beállítások
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

### Környezet-specifikus konfigurációk
```bash
# Fejlesztői környezet
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Teszt környezet
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

### Több szolgáltatásos alkalmazások
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

# Forgalom átváltása kékre (kézi DNS/terheléselosztó frissítés)
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

## 🐳 Konténer telepítések

### Konténer alkalmazás telepítések
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

## ⚡ Teljesítményoptimalizálás

### Szolgáltatás-specifikus telepítések
```bash
# Egy adott szolgáltatás telepítése a gyorsabb iteráció érdekében
azd deploy --service web
azd deploy --service api

# Minden szolgáltatás telepítése
azd deploy
```

### Build cache használata
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Hatékony kód telepítés
```bash
# Az azd deploy használata (nem azd up) csak kódváltoztatások esetén
# Ez kihagyja az infrastruktúra kialakítást és sokkal gyorsabb
azd deploy

# Specifikus szolgáltatás telepítése a leggyorsabb iterációhoz
azd deploy --service api
```

## 🔍 Telepítés monitorozás

### Valós idejű telepítés monitorozás
```bash
# Az alkalmazás valós idejű figyelése
azd monitor --live

# Alkalmazásnaplók megtekintése
azd monitor --logs

# A telepítés állapotának ellenőrzése
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

### Telepítést követő validáció
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

## 🚨 Visszavonási stratégiák

### Gyors visszavonás
```bash
# Az AZD nem rendelkezik beépített visszavonással. Ajánlott megközelítések:

# 1. lehetőség: Újratelepítés Gitből (ajánlott)
git revert HEAD  # A problémás commit visszavonása
git push
azd deploy

# 2. lehetőség: Egy adott commit újratelepítése
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastrukturális visszavonás
```bash
# Az infrastruktúra változtatások előnézete alkalmazás előtt
azd provision --preview

# Az infrastruktúra visszaállításához verziókezelést használjon:
git revert HEAD  # Infrastruktúra változtatások visszavonása
azd provision    # Előző infrastruktúra állapot alkalmazása
```

### Adatmigráció visszavonás
```bash
#!/bin/bash
# scriptek/visszaállít-adatbázis.sh

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
# Használj következetes elnevezéseket
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Tartsd fenn a környezetek közti egyezőséget
./scripts/sync-environments.sh
```

### 2. Infrastrukturális validáció
```bash
# Előzetesen tekintse meg az infrastruktúra változtatásait telepítés előtt
azd provision --preview

# Használja az ARM/Bicep lintelést
az bicep lint --file infra/main.bicep

# Érvényesítse a Bicep szintaxist
az bicep build --file infra/main.bicep
```

### 3. Teszt integráció
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
# Dokumentálja az telepítési eljárásokat
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Következő lépések

- [Erőforrások előkészítése](provisioning.md) - Mélyebb betekintés az infrastruktúra-kezelésbe
- [Telepítés előtti tervezés](../chapter-06-pre-deployment/capacity-planning.md) - Tervezze meg telepítési stratégiáját
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md) - Telepítési problémák megoldása
- [Legjobb gyakorlatok](../chapter-07-troubleshooting/debugging.md) - Éles környezetre kész telepítési stratégiák

## 🎯 Gyakorlati telepítési feladatok

### 1. gyakorlat: Inkrementális telepítési munkafolyamat (20 perc)
**Cél:** Sajátítsa el a teljes és inkrementális telepítések közti különbséget

```bash
# Kezdeti telepítés
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Kezdeti telepítési idő rögzítése
echo "Full deployment: $(date)" > deployment-log.txt

# Kódbeli módosítás
echo "// Updated $(date)" >> src/api/src/server.js

# Csak a kód telepítése (gyors)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Időpontok összehasonlítása
cat deployment-log.txt

# Takarítás
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Teljes telepítés 5-15 percig tart
- [ ] Csak kód telepítés 2-5 percig tart
- [ ] Kódváltozások megjelennek a telepített alkalmazásban
- [ ] Infrastrukturális állapot változatlan marad `azd deploy` után

**Tanulási eredmény:** A `azd deploy` 50-70%-kal gyorsabb kódváltozások esetén, mint az `azd up`

### 2. gyakorlat: Egyedi telepítési hook-ok (30 perc)
**Cél:** Megvalósítani elő- és utótelepítési automatizálást

```bash
# Készíts előtelepítési érvényesítő szkriptet
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Ellenőrizze, hogy a tesztek sikeresek-e
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Ellenőrizze a nem elkötelezett változásokat
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Készíts post-telepítési smoke tesztet
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

# Adjon hozzá hookokat az azure.yaml-hez
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

**Siker kritériumok:**
- [ ] Előtelepítési szkript fut a telepítés előtt
- [ ] Telepítés megszakad, ha a tesztek sikertelenek
- [ ] Utótelepítési gyors ellenőrzés validálja a működést
- [ ] A hook-ok helyes sorrendben futnak le

### 3. gyakorlat: Többkörnyezetes telepítési stratégia (45 perc)
**Cél:** Megvalósítani szakaszos telepítési munkafolyamatot (dev → staging → éles)

```bash
# Telepítő szkript létrehozása
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

# 2. lépés: Telepítés staging környezetbe
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 3. lépés: Kézi jóváhagyás produkcióhoz
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

# Színpadi telepítés futtatása
./deploy-staged.sh
```

**Siker kritériumok:**
- [ ] Fejlesztői környezet sikeresen települ
- [ ] Szakaszoló környezet sikeresen települ
- [ ] Éles környezethez kézi jóváhagyás szükséges
- [ ] Minden környezet egészségellenőrzése működik
- [ ] Szükség esetén vissza lehet vonni

### 4. gyakorlat: Visszavonási stratégia (25 perc)
**Cél:** Visszavonási folyamat megvalósítása és tesztelése Git segítségével

```bash
# Telepítés v1
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash mentése
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Telepítés v2 törő változással
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Hibák felismerése és visszavonás
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

**Siker kritériumok:**
- [ ] Felismeri a telepítési hibákat
- [ ] A visszavonási szkript automatikusan lefut
- [ ] Az alkalmazás visszatér működő állapotba
- [ ] Az egészségellenőrzések sikeresek a visszavonás után

## 📊 Telepítési metrikák követése

### Kövesse nyomon telepítési teljesítményét

```bash
# Hozd létre a telepítési metrikák szkriptjét
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

**Elemezze metrikáit:**
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
- **Előző lecke**: [Az első projektje](../chapter-01-foundation/first-project.md)
- **Következő lecke**: [Erőforrások előkészítése](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->