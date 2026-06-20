# Vodnik za nameščanje - Obvladovanje nameščanj z AZD

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda in nameščanje
- **⬅️ Prejšnje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Naslednje**: [Provisioniranje virov](provisioning.md)
- **🧩 Tudi v tem poglavju**: [Ustvarjanje lastne predloge](custom-templates.md)
- **🚀 Naslednje poglavje**: [Poglavje 5: Večagentne AI rešitve](../../examples/retail-scenario.md)

## Uvod

Ta obsežen vodnik zajema vse, kar morate vedeti o nameščanju aplikacij z Azure Developer CLI, od osnovnih enostavnih ukazov do naprednih produkcijskih scenarijev s prilagojenimi hooki, več okolji in integracijo CI/CD. Obvladujte celoten življenjski cikel nameščanja s praktičnimi primeri in najboljšimi praksami.

## Cilji učenja

Z zaključkom tega vodnika boste:
- Obvladali vse ukaze in poteke za nameščanje z Azure Developer CLI
- Razumeli celoten življenjski cikel nameščanja od zagotavljanja virov do spremljanja
- Implementirali prilagojene hooke za avtomatizacijo pred in po nameščanju
- Konfigurirali več okolij s parametri specifičnimi za okolje
- Nastavili napredne strategije nameščanja, vključno z blue-green in canary nameščanji
- Integrirali azd nameščanja v CI/CD pipelne in DevOps delovne tokove

## Rezultati učenja

Po zaključku boste sposobni:
- Neodvisno izvajati in odpravljati težave pri vseh azd poteh nameščanja
- Načrtovati in izvajati prilagojeno avtomatizacijo nameščanja z uporabo hookov
- Konfigurirati produkcijsko pripravljena nameščanja z ustrezno varnostjo in spremljanjem
- Upravljati kompleksne scenarije nameščanja z več okolji
- Optimizirati zmogljivost nameščanja in implementirati strategije povrnitve
- Integrirati azd nameščanja v podjetniške DevOps prakse

## Pregled nameščanja

Azure Developer CLI ponuja več ukazov za nameščanje:
- `azd up` - Celoten potek (provision + deploy)
- `azd provision` - Ustvari/posodobi le Azure vire
- `azd deploy` - Namesti samo kodo aplikacije
- `azd package` - Zgradi in zapakira aplikacije

## Osnovni poteki nameščanja

### Celotno nameščanje (azd up)
Najpogostejši potek za nove projekte:
```bash
# Namestiti vse iz nič
azd up

# Namestiti v določenem okolju
azd up --environment production

# Namestiti s prilagojenimi parametri
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nameščanje samo infrastrukture
Ko morate posodobiti samo Azure vire:
```bash
# Vzpostavitev/posodobitev infrastrukture
azd provision

# Vzpostavitev s poskusnim zagonom za predogled sprememb
azd provision --preview

# Vzpostavitev določenih storitev
azd provision --service database
```

### Nameščanje samo kode
Za hitre posodobitve aplikacij:
```bash
# Razmestite vse storitve
azd deploy

# Pričakovan izhod:
# Razmeščanje storitev (azd deploy)
# - web: Razmeščanje... Končano
# - api: Razmeščanje... Končano
# USPEŠNO: Vaša razmestitev je bila zaključena v 2 minutah in 15 sekundah

# Razmestite določeno storitev
azd deploy --service web
azd deploy --service api

# Razmestite z lastnimi argumenti gradnje
azd deploy --service api --build-arg NODE_ENV=production

# Preverite razmestitev
azd show --output json | jq '.services'
```

### ✅ Preverjanje nameščanja

Po katerem koli nameščanju preverite uspešnost:

```bash
# Preverite, ali so vse storitve zagnane
azd show

# Preizkusite končne točke za preverjanje stanja
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Spremljajte napake (privzeto se odpre v brskalniku)
azd monitor --logs
```

**Kriteriji uspeha:**
- ✅ Vse storitve kažejo stanje "Running"
- ✅ Zdravstveni končni točki vrneta HTTP 200
- ✅ V zadnjih 5 minutah ni napak v dnevnikih
- ✅ Aplikacija odgovarja na testne zahteve

## 🏗️ Razumevanje procesa nameščanja

### Ne poznate hookov? Začnite tukaj

A **hook** je ukaz, ki ga azd samodejno izvede v določenem trenutku procesa nameščanja — pred ali po provisioning-u, in pred ali po nameščanju vaše kode. Omogočajo avtomatizacijo manjših opravil, ki obkrožajo nameščanje: polnjenje baze, zagon migracij, gradnja sredstev ali hitri testi delujoče aplikacije.

| Hook | Izvaja se… | Pogosta uporaba |
|------|-------|------------|
| `preprovision` | Pred ustvaritvijo virov | Preverite predpogoje, prijavite se v register |
| `postprovision` | Po tem ko viri obstajajo | Konfigurirajte vire, nastavite podatkovno bazo |
| `predeploy` | Pred nameščanjem kode | Zgradite front-end vire, zaženite enotske teste |
| `postdeploy` | Po tem ko je koda v živo | Zaženite DB migracije, opravite smoke-test končne točke |

Hooki so v datoteki `azure.yaml`. Tukaj je najmanjši možen primer — po nameščanju le izpiše sporočilo:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je vse — naslednjič, ko zaženete `azd up`, se sporočilo samodejno izpiše. Hook lahko zaženete tudi samostojno, brez popolnega nameščanja, kar je odlično za testiranje:

```bash
azd hooks run postdeploy
```

Faze spodaj prikazujejo realne hooke (migracije, testi, validacija) za vsako stopnjo.

### Faza 1: Hooki pred provisioniranjem
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

### Faza 2: Zagotavljanje infrastrukture
- Bere predloge infrastrukture (Bicep/Terraform)
- Ustvari ali posodobi Azure vire
- Konfigurira omrežje in varnost
- Nastavi spremljanje in beleženje

### Faza 3: Hooki po zagotavljanju virov
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

### Faza 4: Paketiranje aplikacije
- Gradi kodo aplikacije
- Ustvari artefakte za nameščanje
- Zapakira za ciljno platformo (kontejnerji, ZIP datoteke itd.)

### Faza 5: Hooki pred nameščanjem
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

### Faza 6: Nameščanje aplikacije
- Namesti zapakirane aplikacije v Azure storitve
- Posodobi nastavitve konfiguracije
- Zažene/ponovno zažene storitve

### Faza 7: Hooki po nameščanju
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

### Ravnanje s napakami hookov

Privzeto, **če ukaz hooka konča z izhodno kodo, različnim od nič, azd ustavi celotno operacijo.** To je običajno zaželeno — neuspešna migracija bi morala ustaviti nameščanje, ne pa dostaviti pokvarjene aplikacije. Vendar pa to pomeni, da je treba hooke pisati previdno.

**1. Naj bodo napake glasne in namerne.** Hook ne uspe, ko njegov zadnji ukaz vrne izhodno kodo različni od nič. V shell skriptah dodajte `set -e`, da se hook ustavi ob prvem neuspelem ukazu namesto da tiho nadaljuje:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Dovolite, da hook ne uspe, ne da bi ustavil azd.** Za nekritične korake (opcijsko ogrevanje predpomnilnika, obvestilo brez zagotovila), nastavite `continueOnError: true`. azd zabeleži napako, vendar nadaljuje:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testirajte hooke ločeno, preden zaženete celoten potek.** Ni vam treba zagnati `azd up`, da bi odpravljali napake v hooku — zaženite ga samostojno in hitro iterirajte:

```bash
azd hooks run predeploy          # izvede samo predeploy-hook
azd hooks run postdeploy --service api
```

**4. Pazite na lupine specifične za OS.** Hook, ki uporablja `shell: pwsh`, zahteva nameščen PowerShell na stroju, kjer se izvaja (vključno s CI agenti). Uporabite `shell: sh` za največjo prenosljivost ali pa zagotovite različice za `windows` in `posix`:

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

> **Namig za razhroščevanje:** zaženite kateri koli azd ukaz z `--debug`, da vidite točno ukazno vrstico hooka in njegov celoten izhod — neprecenljivo, kadar hook deluje lokalno, a odpove v CI.

## 🎛️ Konfiguracija nameščanja

### Nastavitve nameščanja za storitev
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

### Konfiguracije specifične za okolje
```bash
# Razvojno okolje
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Predprodukcijsko okolje
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produkcijsko okolje
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Napredni scenariji nameščanja

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

### Blue-Green nameščanja
```bash
# Ustvari modro okolje
azd env new production-blue
azd up --environment production-blue

# Preizkusi modro okolje
./scripts/test-environment.sh production-blue

# Preusmeri promet na modro (ročna posodobitev DNS/uravnoteževalnika obremenitve)
./scripts/switch-traffic.sh production-blue

# Očisti zeleno okolje
azd env select production-green
azd down --force
```

### Canary nameščanja
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

### Nameščanja po fazah
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

## 🐳 Nameščanja vsebnikov

### Nameščanja aplikacij v Container Apps
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

### Optimizacija večstopenjskega Dockerfile
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

### Nameščanja specifična za storitve
```bash
# Razporedi določeno storitev za hitrejše iteracije
azd deploy --service web
azd deploy --service api

# Razporedi vse storitve
azd deploy
```

### Predpomnjenje gradnje
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Učinkovita nameščanja kode
```bash
# Uporabite azd deploy (ne azd up) za spremembe, ki vključujejo samo kodo
# To preskoči zagotavljanje infrastrukture in je veliko hitreje
azd deploy

# Razporedite določeno storitev za najhitrejšo iteracijo
azd deploy --service api
```

## 🔍 Spremljanje nameščanja

### Sprotno spremljanje nameščanja
```bash
# Spremljaj aplikacijo v realnem času
azd monitor --live

# Poglej dnevnike aplikacije
azd monitor --logs

# Preveri stanje razmestitve
azd show
```

### Zdravstveni pregledi
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

### Validacija po nameščanju
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Preveri zdravje aplikacije
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

## 🔐 Varnostne pomisleke

### Upravljanje skrivnosti
```bash
# Skrivnosti shranjujte varno
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Sklicujte se na skrivnosti v azure.yaml
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

### Upravljanje identitet in dostopa
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

## 🚨 Strategije povrnitve

### Hitro povračilo
```bash
# AZD nima vgrajene možnosti povrnitve (rollback). Priporočeni pristopi:

# Možnost 1: Ponovna razmestitev iz Gita (priporočeno)
git revert HEAD  # Razveljavite problematični commit
git push
azd deploy

# Možnost 2: Ponovna razmestitev določenega commita
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Povrnitev infrastrukture
```bash
# Predogled sprememb infrastrukture pred uporabo
azd provision --preview

# Za povrnitev infrastrukture uporabite nadzor različic:
git revert HEAD  # Razveljavi spremembe infrastrukture
azd provision    # Uporabi prejšnje stanje infrastrukture
```

### Povrnitev migracij baze podatkov
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Meritve nameščanja

### Spremljajte uspešnost nameščanja
```bash
# Ogled trenutnega stanja razmestitve
azd show

# Spremljanje aplikacije z Application Insights
azd monitor --overview

# Ogled metrik v živo
azd monitor --live
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

### 1. Konsistentnost okolij
```bash
# Uporabljajte dosledno poimenovanje
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Ohranjajte skladnost okolij
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Predogled sprememb infrastrukture pred uvajanjem
azd provision --preview

# Uporabi ARM/Bicep lintanje
az bicep lint --file infra/main.bicep

# Preveri sintakso Bicepa
az bicep build --file infra/main.bicep
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
# Dokumentirajte postopke uvajanja
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Naslednji koraki

- [Provisioniranje virov](provisioning.md) - Poglobljen vpogled v upravljanje infrastrukture
- [Načrtovanje pred nameščanjem](../chapter-06-pre-deployment/capacity-planning.md) - Načrtujte strategijo nameščanja
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md) - Reševanje težav z nameščanjem
- [Najboljše prakse](../chapter-07-troubleshooting/debugging.md) - Strategije za produkcijsko pripravljena nameščanja

## 🎯 Praktične vaje nameščanja

### Vaja 1: Postopek inkrementalnega nameščanja (20 minut)
**Cilj**: Obvladati razliko med popolnim in inkrementalnim nameščanjem

```bash
# Začetno uvajanje
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabeleži čas začetnega uvajanja
echo "Full deployment: $(date)" > deployment-log.txt

# Naredi spremembo kode
echo "// Updated $(date)" >> src/api/src/server.js

# Uvedi samo kodo (hitro)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Primerjaj čase
cat deployment-log.txt

# Počisti
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Popolno nameščanje traja 5–15 minut
- [ ] Nameščanje samo kode traja 2–5 minut
- [ ] Spremembe kode so vidne v nameščeni aplikaciji
- [ ] Infrastruktura nespremenjena po `azd deploy`

**Rezultat učenja**: `azd deploy` je za 50–70% hitrejši od `azd up` pri spremembah kode

### Vaja 2: Prilagojeni hooki za nameščanje (30 minut)
**Cilj**: Implementirati avtomatizacijo pred in po nameščanju

```bash
# Ustvari skripto za preverjanje pred nameščanjem
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Preveri, ali testi uspejo
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Preveri, ali obstajajo neoddane spremembe
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Ustvari osnovni test po razmestitvi
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

# Dodaj hooks v azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Preizkusi razmestitev s hooki
azd deploy
```

**Kriteriji uspeha:**
- [ ] Skripta pred nameščanjem se izvede pred nameščanjem
- [ ] Nameščanje se prekine, če testi ne uspejo
- [ ] Po-nameščanja smoke test preveri zdravje
- [ ] Hooki se izvedejo v pravilnem vrstnem redu

### Vaja 3: Strategija nameščanja v več okoljih (45 minut)
**Cilj**: Implementirati postopni potek nameščanja (dev → staging → production)

```bash
# Ustvari skripto za uvajanje
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Korak 1: Namesti v razvojno okolje
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 2: Namesti v predprodukcijsko okolje
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 3: Ročna odobritev za produkcijo
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

# Ustvari okolja
azd env new dev
azd env new staging
azd env new production

# Zaženi uvajanje po fazah
./deploy-staged.sh
```

**Kriteriji uspeha:**
- [ ] Dev okolje se uspešno namesti
- [ ] Staging okolje se uspešno namesti
- [ ] Za produkcijo je zahtevano ročno odobritev
- [ ] Vsa okolja imajo delujoče zdravstvene preglede
- [ ] Možnost povrnitve, če je potrebno

### Vaja 4: Strategija povrnitve (25 minut)
**Cilj**: Implementirati in testirati povrnitev nameščanja z uporabo Gita

```bash
# Razmestitev v1
azd env set APP_VERSION "1.0.0"
azd up

# Shrani hash commita v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Razmestitev v2 z nezdružljivo spremembo
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Zaznaj napako in povrni stanje
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Povrnitev z uporabo Gita
    git revert HEAD --no-edit
    
    # Povrni okolje
    azd env set APP_VERSION "1.0.0"
    
    # Ponovna razmestitev v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteriji uspeha:**
- [ ] Lahko zaznate napake pri nameščanju
- [ ] Skripta za povrnitev se samodejno izvede
- [ ] Aplikacija se vrne v delujoče stanje
- [ ] Zdravstveni pregledi opravijo po povrnitvi

## 📊 Spremljanje metrik nameščanja

### Spremljajte uspešnost nameščanja

```bash
# Ustvari skripto za metrike uvajanja
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

# Zapiši v datoteko
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Uporabi ga
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Ogled zgodovine uvajanj
cat deployment-metrics.csv

# Izračun povprečnega časa uvajanja
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni viri

- [Referenca za nameščanje Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nameščanje v Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nameščanje v Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nameščanje Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prejšnja lekcija**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **Naslednja lekcija**: [Provisioniranje virov](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->