# Vodnik za nameščanje - Obvladovanje AZD nameščanj

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 4 - Infrastruktura kot koda in nameščanje
- **⬅️ Previous Chapter**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Zagotavljanje virov](provisioning.md)
- **🚀 Next Chapter**: [Poglavje 5: Rešitve z več agenti AI](../../examples/retail-scenario.md)

## Uvod

Ta## Razumevanje postopka nameščanjacelovit vodnik pokriva vse, kar morate vedeti o nameščanju aplikacij z uporabo Azure Developer CLI, od osnovnih enokliknih nameščanj do naprednih scenarijev v produkciji s prilagojenimi hooki, več okolji in integracijo CI/CD. Obvladajte celoten življenjski cikel nameščanja s praktičnimi primeri in najboljšimi praksami.

## Cilji učenja

Z opravljanjem tega vodiča boste:
- Obvladali vse ukaze in delovne tokove Azure Developer CLI za nameščanje
- Razumeli celoten življenjski cikel nameščanja od zagotavljanja do nadzora
- Implementirali prilagojene hooke za avtomatizacijo pred in po nameščanju
- Konfigurirali več okolij z nastavitvami specifičnimi za okolje
- Nastavili napredne strategije nameščanja, vključno z blue-green in canary nameščanji
- Integrirali azd nameščanja s CI/CD cevmi in DevOps delovnimi tokovi

## Učni izidi

Po končanem vodiču boste sposobni:
- Samostojno izvesti in odpraviti težave pri vseh azd delovnih tokih nameščanja
- Oblikovati in implementirati prilagojeno avtomatizacijo nameščanja z uporabo hookov
- Konfigurirati produkcijsko pripravljena nameščanja z ustrezno varnostjo in nadzorom
- Upravljati kompleksne scenarije nameščanja z več okolji
- Optimizirati zmogljivost nameščanja in implementirati strategije povrnitve
- Integrirati azd nameščanja v korporativne DevOps prakse

## Pregled nameščanja

Azure Developer CLI nudi več ukazov za nameščanje:
- `azd up` - Celoten delovni tok (zagotovi + namesti)
- `azd provision` - Ustvari/posodobi samo Azure vire
- `azd deploy` - Namesti le kodo aplikacije
- `azd package` - Zgradi in zapakira aplikacije

## Osnovni delovni tokovi nameščanja

### Celovito nameščanje (azd up)
Najpogostejši delovni tok za nove projekte:
```bash
# Namesti vse iz nič
azd up

# Namesti v določenem okolju
azd up --environment production

# Namesti s prilagojenimi parametri
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Samo infrastruktura — nameščanje
Ko potrebujete samo posodobitev Azure virov:
```bash
# Zagotovitev/posodobitev infrastrukture
azd provision

# Zagotovitev s preizkusnim zagonom za predogled sprememb
azd provision --preview

# Zagotovitev določenih storitev
azd provision --service database
```

### Samo koda — nameščanje
Za hitre posodobitve aplikacije:
```bash
# Razporedi vse storitve
azd deploy

# Pričakovani izhod:
# Razporejanje storitev (azd deploy)
# - web: Razporejanje... Končano
# - api: Razporejanje... Končano
# USPEŠNO: Vaša razmestitev je bila dokončana v 2 minutah in 15 sekundah

# Razporedi določeno storitev
azd deploy --service web
azd deploy --service api

# Razporedi z lastnimi argumenti za gradnjo
azd deploy --service api --build-arg NODE_ENV=production

# Preveri razmestitev
azd show --output json | jq '.services'
```

### ✅ Preverjanje nameščanja

Po vsakem nameščanju preverite uspeh:

```bash
# Preverite, ali so vse storitve zagnane
azd show

# Preizkusite končne točke stanja
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Spremljajte napake (privzeto se odpre v brskalniku)
azd monitor --logs
```

**Merila uspeha:**
- ✅ Vse storitve kažejo status "Running"
- ✅ Zdravstveni končni točki vračata HTTP 200
- ✅ Brez napak v dnevnikih v zadnjih 5 minutah
- ✅ Aplikacija odgovarja na testne zahteve

## 🏗️ Razumevanje postopka nameščanja

### Faza 1: Hooki pred zagotavljanjem
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
- Nastavi nadzor in beleženje

### Faza 3: Hooki po zagotovitvi
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

## 🎛️ Konfiguracija nameščanja

### Nastavitve nameščanja specifične za storitev
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

# Preusmeri promet na modro (ročna posodobitev DNS-a/uravnoteževalnika obremenitve)
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

### Postopna nameščanja
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

## 🐳 Nameščanja kontejnerjev

### Nameščanje aplikacij v kontejnerjih
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

### Nameščanja specifična za storitev
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
# To preskoči pripravo infrastrukture in je veliko hitrejše
azd deploy

# Razmestite določeno storitev za najhitrejšo iteracijo
azd deploy --service api
```

## 🔍 Nadzor nameščanja

### Nadzor nameščanja v realnem času
```bash
# Spremljaj aplikacijo v realnem času
azd monitor --live

# Poglej dnevnike aplikacije
azd monitor --logs

# Preveri stanje nameščanja
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

### Preverjanje po nameščanju
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

## 🔐 Varnostni vidiki

### Upravljanje skrivnosti
```bash
# Skrivnosti varno shranite
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

### Varnost omrežja
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

## 🚨 Strategije povrnitve

### Hitra povrnitev
```bash
# AZD nima vgrajene možnosti povrnitve. Priporočeni pristopi:

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

# Za povrnitev infrastrukture uporabite sistem za nadzor različic:
git revert HEAD  # Razveljavi spremembe infrastrukture
azd provision    # Uporabi prejšnje stanje infrastrukture
```

### Povrnitev migracije baze podatkov
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrični podatki nameščanja

### Spremljajte uspešnost nameščanja
```bash
# Prikaži trenutno stanje uvajanja
azd show

# Spremljajte aplikacijo s storitvijo Application Insights
azd monitor --overview

# Ogled meritev v živo
azd monitor --live
```

### Zbiranje lastnih metrik
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

### 1. Doslednost okolij
```bash
# Uporabljajte dosledna poimenovanja
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Vzdržujte skladnost okolij
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Predogled sprememb infrastrukture pred uvajanjem
azd provision --preview

# Uporabi lintanje za ARM/Bicep
az bicep lint --file infra/main.bicep

# Preveri sintakso Bicep
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
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Naslednji koraki

- [Zagotavljanje virov](provisioning.md) - Poglobljen pogled v upravljanje infrastrukture
- [Načrtovanje pred nameščanjem](../chapter-06-pre-deployment/capacity-planning.md) - Načrtujte svojo strategijo nameščanja
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md) - Rešite težave pri nameščanju
- [Najboljše prakse](../chapter-07-troubleshooting/debugging.md) - Strategije nameščanja pripravljene za produkcijo

## 🎯 Praktične vaje za nameščanje

### Vaja 1: Inkrementalni delovni tok nameščanja (20 minut)
**Cilj**: Obvladati razliko med polnim in inkrementalnim nameščanjem

```bash
# Začetna namestitev
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabeleži čas začetne namestitve
echo "Full deployment: $(date)" > deployment-log.txt

# Naredi spremembo kode
echo "// Updated $(date)" >> src/api/src/server.js

# Namesti samo kodo (hitro)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Primerjaj čase
cat deployment-log.txt

# Počisti
azd down --force --purge
```

**Merila uspeha:**
- [ ] Celotno nameščanje traja 5-15 minut
- [ ] Samo-kodno nameščanje traja 2-5 minut
- [ ] Spremembe kode so vidne v nameščeni aplikaciji
- [ ] Infrastruktura ostane nespremenjena po `azd deploy`

**Učni izid**: `azd deploy` je za 50-70% hitrejši od `azd up` za spremembe kode

### Vaja 2: Prilagojeni hooki za nameščanje (30 minut)
**Cilj**: Implementirati avtomatizacijo pred in po nameščanju

```bash
# Ustvari skripto za preverjanje pred uvajanjem
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Preveri, ali testi uspešno tečejo
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

# Ustvari osnovni preizkus po uvajanju
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

# Dodaj sprožilce v azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Preizkusi uvajanje s sprožilci
azd deploy
```

**Merila uspeha:**
- [ ] Skripta pred nameščanjem se zažene pred nameščanjem
- [ ] Nameščanje se prekine, če testi ne uspejo
- [ ] Po-nameščavni "smoke test" preveri zdravje
- [ ] Hooki se izvajajo v pravilnem zaporedju

### Vaja 3: Strategija nameščanja za več okolij (45 minut)
**Cilj**: Implementirati postopen delovni tok nameščanja (dev → staging → production)

```bash
# Ustvari skripto za uvajanje
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Korak 1: Uvedi v razvojno okolje
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 2: Uvedi v pripravljalno okolje
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 3: Ročna odobritev za produkcijsko okolje
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

# Zaženi uvajanje v fazah
./deploy-staged.sh
```

**Merila uspeha:**
- [ ] Okolje dev se uspešno namesti
- [ ] Okolje staging se uspešno namesti
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
    
    # Povrnitev z uporabo gita
    git revert HEAD --no-edit
    
    # Povrni okolje
    azd env set APP_VERSION "1.0.0"
    
    # Ponovna razmestitev v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Merila uspeha:**
- [ ] Zazna napake nameščanja
- [ ] Skripta za povrnitev se izvede samodejno
- [ ] Aplikacija se vrne v delujoče stanje
- [ ] Zdravstveni pregledi uspešno prestanejo po povrnitvi

## 📊 Spremljanje metričnih podatkov nameščanja

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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Zapiši v datoteko
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Uporabite ga
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Prikaži zgodovino nameščanj
cat deployment-metrics.csv

# Izračunaj povprečen čas nameščanja
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni viri

- [Referenca za nameščanje Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nameščanje v Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nameščanje Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nameščanje Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Zagotavljanje virov](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti:**
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas opozarjamo, da lahko samodejni prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za ključne oziroma pomembne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->