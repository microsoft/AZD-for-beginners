# Telepítési útmutató - Az AZD telepítések mesterfokon

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 4. fejezet - Infrastruktúra kód formájában és Telepítés
- **⬅️ Előző fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)
- **➡️ Következő**: [Erőforrások kiépítése](provisioning.md)
- **🧩 Szintén ebben a fejezetben**: [Saját sablon készítése](custom-templates.md)
- **🚀 Következő fejezet**: [5. fejezet: Több ügynökös AI megoldások](../../examples/retail-scenario.md)

## Bevezetés

> Átvizsgálva `azd 1.37.2` (2026. november). Parancsok Bash-ben; JSON példákhoz `jq` szükséges. Kivéve az egyértelműen inicializált teendő feladatot, a haladó példák **integrációs fragmentumok**: adj meg saját forrást, infrastruktúrát, teszteket és scripteket. Ebben a felülvizsgálatban nem végeztünk Azure telepítéseket.

Ez a részletes útmutató minden fontos tudnivalót lefed az Azure Developer CLI használatával végzett alkalmazástelepítésekről, az egyszerű egyparancsos telepítésektől a haladó gyártási forgatókönyvekig egyedi hook-okkal, több környezettel és CI/CD integrációval. Sajátítsd el a teljes telepítési életciklust gyakorlati példákkal és bevált módszerekkel.

## Tanulási célok

Az útmutató elvégzése után:
- Elsajátítod az Azure Developer CLI összes telepítési parancsát és munkafolyamatát
- Megérted a teljes telepítési életciklust a kiépítéstől a monitorozásig
- Megvalósítod az egyedi telepítési hook-okat a telepítés előtti és utáni automatizáláshoz
- Több környezetet konfigurálsz környezetspecifikus paraméterekkel
- Fejlett telepítési stratégiákat állítasz be, beleértve a blue-green és canary telepítéseket
- Integrálod az azd telepítéseket CI/CD csővezetékekkel és DevOps munkafolyamatokkal

## Tanulási eredmények

Az útmutató befejezése után képes leszel:
- Önállóan végrehajtani és hibakeresni az összes azd telepítési munkafolyamatot
- Egyedi telepítési automatizálást tervezni és implementálni hook-ok segítségével
- Gyártásra kész telepítéseket konfigurálni megfelelő biztonsággal és monitorozással
- Kezelni összetett, több környezetes telepítési forgatókönyveket
- Optimalizálni a telepítési teljesítményt és megvalósítani visszagörgetési stratégiákat
- Integrálni az azd telepítéseket vállalati DevOps gyakorlatokba

## Telepítés áttekintése

Az Azure Developer CLI több telepítési parancsot kínál:
- `azd up` - Teljes munkafolyamat (kiépítés + telepítés)
- `azd provision` - Csak Azure erőforrások létrehozása/frissítése
- `azd deploy` - Csak az alkalmazáskód telepítése
- `azd package` - Alkalmazások építése és csomagolása

## Alapvető telepítési munkafolyamatok

### Teljes telepítés (azd up)
Az új projektek leggyakoribb munkafolyamata:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Csak infrastruktúra telepítés
Amikor csak az Azure erőforrásokat kell frissíteni:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Csak kód telepítés
Gyors alkalmazásfrissítéshez:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Telepítés ellenőrzése

Bármely telepítés után ellenőrizd a sikerességet:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Sikerfeltételek:**
- ✅ `azd show` feloldja a várt szolgáltatás célokat/URL-eket
- ✅ Az alkalmazás tényleges útvonalaira érkező kérések a várt státuszt és tartalmat adják vissza
- ✅ Az utolsó 5 percben nincs hibanapló
- ✅ Az alkalmazás reagál a teszt kérésekre

## 🏗️ A telepítési folyamat megértése

### Új vagy a hook-okban? Kezd itt

A **hook** egy parancs, amelyet az azd automatikusan futtat egy adott pillanatban a telepítési folyamat során — a kiépítés előtt vagy után, illetve a kód telepítése előtt vagy után. Ezekkel automatizálhatod azokat a kisebb teendőket, amelyek mindig részei a telepítésnek: adatbázis feltöltése, migrációk futtatása, eszközök építése vagy az élő alkalmazás gyors tesztelése.

| Hook | Mikor fut | Gyakori használat |
|------|-------|------------|
| `preprovision` | Mielőtt az erőforrások létrejönnek | Előfeltételek ellenőrzése, bejelentkezés regiszterbe |
| `postprovision` | Miután az erőforrások léteznek | Erőforrások konfigurálása, adatbázis beállítása |
| `predeploy` | Mielőtt a kód telepítésre kerül | Front-end eszközök építése, egységtesztek futtatása |
| `postdeploy` | Miután a kód élő | Adatmigrációk futtatása, gyors teszt az végpontokon |

A hook-ok a te `azure.yaml` fájlodban élnek. Íme a legkisebb lehetséges példa — csak kiír egy üzenetet a telepítés után:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Ennyi az egész — legközelebb, amikor futtatod az `azd up` parancsot, az üzenet automatikusan megjelenik. Egyszerűen egy hook-ot is futtathatsz önállóan, teljes telepítés nélkül, ami nagyszerű teszteléshez:

```bash
azd hooks run postdeploy
```

Az alábbi fázisok bemutatják a való életből vett hook-okat (migrációk, tesztek, validáció) minden szakaszban.

### 1. fázis: Elő-kiépítési hook-ok
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

### 2. fázis: Infrastruktúra kiépítése
- Infrastruktúra sablonokat olvas be (Bicep/Terraform)
- Azure erőforrásokat hoz létre vagy frissít
- Hálózati és biztonsági beállításokat konfigurál
- Monitorozást és naplózást állít be

### 3. fázis: Utó-kiépítési hook-ok
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
- Célplatformokra csomagolás (konténerek, ZIP fájlok stb.)

### 5. fázis: Elő-telepítési hook-ok
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
- Csomagolt alkalmazások telepítése Azure szolgáltatásokba
- Konfigurációs beállítások frissítése
- Szolgáltatások indítása/újraindítása

### 7. fázis: Utó-telepítési hook-ok
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Hook hibakezelés

Alapértelmezés szerint **ha egy hook parancs nem nulla kilépési kóddal tér vissza, az azd leállítja az egész műveletet.** Ez általában kívánatos — egy sikertelen migráció meg kell, hogy állítsa a telepítést, nem szabad hibás alkalmazást szállítani. Ez azt jelenti, hogy a hook-okat gondosan kell megírni.

**1. Tegyél a hibákra hangos és szándékos reakciót.** Egy hook akkor hibás, amikor az utolsó parancsa nem nullás kóddal tér vissza. Shell scriptekben adj hozzá `set -e`, hogy a hook az első sikertelen parancsnál megálljon a szünetelés helyett:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Engedd meg, hogy egy hook hibázzon, de ne állítsa le az azd-t.** Nem kritikus lépéseknél (opcionális cache melegítés, legjobb szándékú értesítés) állítsd be `continueOnError: true`. Az azd naplózza a hibát, de továbbmegy:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Teszteld a hook-okat izoláltan, teljes futtatás előtt.** Nem kell az `azd up` parancsot futtatnod a hibakereséshez — futtasd önállóan és gyorsan iterálj:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Ügyelj az operációs rendszer-specifikus shell-ekre.** Egy hook, amely `shell: pwsh`-t használ, megköveteli, hogy a futtató gépen (beleértve a CI ügynököket is) telepítve legyen PowerShell. A legszélesebb hordozhatóság érdekében használj `shell: sh`-t, vagy adj meg `windows` és `posix` változatokat:

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

> **Hibakeresési tipp:** futtass bármilyen azd parancsot `--debug` opcióval, hogy lásd a pontos hook parancssort és teljes kimenetét — felbecsülhetetlen, ha a hook helyben működik, de CI-ben hibázik.

## 🎛️ Telepítési konfiguráció

### Szolgáltatás-specifikus telepítési beállítások
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Környezet-specifikus konfigurációk

Ezek csak helyi azd értékek. Külön meg kell feleltetni őket az infrastruktúra/futási konfigurációnak. `NODE_ENV` általában `production` egy telepített Node alkalmazáshoz, beleértve a staging telepítést; használj külön, alkalmazás-specifikus változót a telepítési szakaszok megkülönböztetésére.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

**Illusztratív működési vázlat:** mindkét környezetet biztosítanod kell, egy megosztott forgalomirányító réteggel és az alábbi két scripttel. Az azd nem kapcsolja automatikusan a forgalmat, és nem ellenőrzi a rollback készenlétet. Tartsd a zöld környezetet addig, amíg a kék át nem megy a tesztelésen és a rollback már nem szükséges.

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
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

A forgalommegosztás a Container Apps konfiguráció része (Bicep vagy Azure CLI), nem egy `azure.yaml` `trafficSplit` tulajdonság. Az előnézet/kiépítés és az azt követő telepítések meg kell, hogy őrizzék a választott revíziós módot és forgalomirányító szabályokat.

### Szakaszos telepítések
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
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
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Konfiguráld a futási titkokat `configuration.secrets`/`secretRef` (vagy Key Vault hivatkozásokkal) és a skálázást `template.scale` segítségével a Container App infrastruktúrában. Ne találj fel szolgáltatói szintű `secrets` vagy `scale` tulajdonságokat az `azure.yaml`-ban.

### Többlépcsős Dockerfile optimalizálás
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Teljesítmény optimalizáció

### Szolgáltatás-specifikus telepítések
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Építési cache
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

A standard Node munkafolyamat csomag szkripteket használ; a szolgáltatás `prepackage` hookjai hozzáadhatják a szükséges lépéseket. A Docker réteg cache különválik a szolgáltatás build parancs definiálásától.

### Hatékony kód telepítések
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Telepítési monitorozás

### Valós idejű telepítés monitorozás
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Egészség ellenőrzések
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Az alkalmazásodnak implementálnia kell `/health`-t; ezt az azd nem biztosítja automatikusan. Nincs általános `azure.yaml` `healthCheck` szolgáltatói tulajdonság.

### Telepítés utáni validáció
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` érvénytelen. A szokásos környezeti értékek helyi, egyszerű szövegként tárolódnak; ne feltételezd, hogy az olvasó parancsok elrejtenék őket. A fenti parancsok Key Vault hivatkozásokat mentenek, de az infrastruktúrának/alkalmazásnak magának kell fogyasztania a titkokat és engedélyeznie a futási identitás hozzáférést.

### Hálózati biztonság
Hálózati paraméterek deklarálása és fogyasztása Bicep-ben történjen, és leképezésük az `infra/main.parameters.json`-ben. Nincs általános `infra.parameters` réteg az `azure.yaml`-ban. A dokumentáció példálózó tartományai `203.0.113.0/24` és `198.51.100.0/24` nem valós irodai/VPN hálózatok; cseréld őket engedélyezett hálózati tartományokra.

### Azonosítás és hozzáférés kezelés
Engedélyezd a Container App `identity`-ját Bicep-ben és rendeld hozzá a szükséges Key Vault adat-plane szerepkört a vault hatókörre. Nevezett Key Vault alapú titkok és futási hivatkozások konfigurálása ebben a erőforrásban; `identity` és `keyVault` nem általános azd szolgáltatói tulajdonságok. Lásd a [Hitelesítés és kezelt identitás](../chapter-03-configuration/authsecurity.md) részt.

## 🚨 Visszagörgetési stratégiák

### Gyors visszagörgetés
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Infrastruktúra visszagörgetés
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Adatmigráció visszagörgetés
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Telepítési mutatók

### Telepítési teljesítmény nyomon követése
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
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

## 🎯 Legjobb gyakorlatok

### 1. Környezet konzisztencia
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
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Következő lépések

- [Erőforrások kiépítése](provisioning.md) - Mélyreható infrastruktúra menedzsment
- [Telepítés előtti tervezés](../chapter-06-pre-deployment/capacity-planning.md) - Tervezd meg telepítési stratégiádat
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md) - Oldd meg a telepítési problémákat
- [Legjobb gyakorlatok](../chapter-07-troubleshooting/debugging.md) - Gyártásra kész telepítési stratégiák

## 🎯 Gyakorlati telepítési feladatok

### 1. feladat: Inverz telepítési munkafolyamat (20 perc)
**Cél:** Sajátítsd el a teljes és lépcsőzetes telepítések közti különbséget

**Kiindulópont:** Bash, Node.js 22, Git, azd bejelentkezés, és egy Azure előfizetés telepítési jogosultságokkal. Új könyvtárban futtasd; várhatóan fizetős App Service/Cosmos DB erőforrásokat hoz létre. Az időzítések régiótól és sablontól függnek.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Sikerfeltételek:**
- [ ] Rögzítsd az eltelt időt mindkét parancsra (nincs garantált futási idő)
- [ ] Mindkét parancs sikeresen lefut
- [ ] Az API működőképes marad; a komment-only módosítás nem látható UI változás
- [ ] Az infrastruktúra változatlan marad `azd deploy` után

**Tanulási eredmény:** `azd deploy` kihagyja az infrastruktúra kiépítést. Hasonlítsd össze a mért időket ahelyett, hogy egy fix százalékos gyorsulást feltételeznél.

### 2. feladat: Egyedi telepítési hook-ok (30 perc)
**Cél:** Valósítsd meg a telepítés előtti és utáni automatizálást

**Kiindulópont:** a fenti inicializált `deployment-practice` projekt. Ha kitakarítottad, futtasd újra `azd up`, mielőtt a csak kód telepítést teszteled. Az alábbi validáció az API tényleges build szkriptjét használja, nem egy nem létező root `test:unit` szkriptet. A sablon API tesztjei konfigurált adatbázis-hozzáférést igényelnek; nem izolált egységtesztek.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Sikerfeltételek:**
- [ ] A telepítés előtti script a telepítés előtt fut le
- [ ] A telepítés megszakad, ha a build validáció sikertelen
- [ ] A telepítés utáni gyors teszt megerősíti az egészséget
- [ ] A hook-ok helyes sorrendben futnak

### 3. feladat: Több-környezetes telepítési stratégia (45 perc)
**Cél:** Valósítsd meg a szakaszos telepítési munkafolyamatot (dev → staging → production)

**Kezdőpont:** ugyanaz az inicializált todo projekt `jq`-vel. Hozza létre az alábbi környezeteket valós előfizetés/helyszín adatokkal (vagy állítsa be `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` mindegyikben) **mielőtt** meghívná a prompt nélküli munkafolyamatot. Ez szándékosan hibára fut, a hiányzó értékek kitalálása helyett. Csak eldobható gyakorlati környezeteket használjon, ne valódi éles előfizetést.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Siker kritériumok:**
- [ ] A fejlesztői környezet sikeresen települ
- [ ] A staging környezet sikeresen települ
- [ ] Kézi jóváhagyás szükséges az éleshez
- [ ] Minden környezetben működő egészségellenőrzések vannak
- [ ] Szükség esetén vissza tud állni

### Gyakorlat 4: Visszaállítási stratégia (25 perc)
**Cél:** Telepítés visszaállításának megvalósítása és tesztelése Git használatával

**Kezdőpont:** elkülönített gyakorlati klón a todo sablonból, minden alapforrás elkötelezve, tiszta Git munkaterület és egy eldobható konfigurált környezet. Soha ne vezessen be szándékos hibákat valódi produkciós projektbe. A `APP_VERSION` alább csak könyvelési célokat szolgál, kivéve, ha kifejezetten beépíti az alkalmazásba.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Siker kritériumok:**
- [ ] Képes felismerni a telepítési hibákat
- [ ] A visszaállítási szkript automatikusan elindul
- [ ] Az alkalmazás működő állapotba tér vissza
- [ ] Az egészségellenőrzések sikeresek a visszaállítás után

## 📊 Telepítési mutatók nyomon követése

### Kövesse nyomon a telepítési teljesítményét

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Elemezze mutatóit:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## További források

- [Azure Developer CLI telepítési referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service telepítés](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps telepítés](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions telepítés](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigáció**
- **Előző leckéhez**: [Az első projektje](../chapter-01-foundation/first-project.md)
- **Következő leckéhez**: [Erőforrások létrehozása](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->