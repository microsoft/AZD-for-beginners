# Vodnik za uvajanje - Obvladovanje uvajanj AZD

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda & uvajanje
- **⬅️ Prejšnje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Naslednje**: [Zagotavljanje virov](provisioning.md)
- **🚀 Naslednje poglavje**: [Poglavje 5: Rešitve večagentne AI](../../examples/retail-scenario.md)

## Uvod

Ta obsežen vodnik pokriva vse, kar morate vedeti o uvajanju aplikacij z uporabo Azure Developer CLI, od osnovnih uvajanj z enim ukazom do naprednih produkcijskih scenarijev s prilagojenimi hooki, več okolji in integracijo CI/CD. Obvladujte celoten življenjski cikel uvajanja z uporabnimi primeri in najboljšimi praksami.

## Cilji učenja

S tem vodnikom boste:
- Obvladali vse ukaze in poteke za uvajanje Azure Developer CLI
- Razumeli celoten življenjski cikel uvajanja od zagotavljanja do spremljanja
- Uvedli prilagojene hooke za avtomatizacijo pred in po uvajanju
- Konfigurirali več okolij z parametri specifičnimi za okolje
- Nastavili napredne strategije uvajanja, vključno z blue-green in canary uvajanji
- Integrirali azd uvajanja v CI/CD pipeline in DevOps poteke

## Rezultati učenja

Po zaključku boste lahko:
- Neodvisno izvajali in odpravljali težave pri vseh potekih uvajanja z azd
- Oblikovali in uresničili prilagojeno avtomatizacijo uvajanja z uporabo hookov
- Konfigurirali produkcijsko pripravljena uvajanja z ustrezno varnostjo in spremljanjem
- Upravljali kompleksne scenarije uvajanja z več okolji
- Optimizirali uspešnost uvajanja in uvedli strategije za povrnitev
- Integrirali azd uvajanja v podjetniške DevOps prakse

## Pregled uvajanja

Azure Developer CLI zagotavlja več ukazov za uvajanje:
- `azd up` - Celovit potek (provision + deploy)
- `azd provision` - Ustvari/posodobi le Azure vire
- `azd deploy` - Uvaja samo kodo aplikacije
- `azd package` - Gradi in pakira aplikacije

## Osnovni poteki uvajanja

### Celovito uvajanje (azd up)
Najpogostejši potek za nove projekte:
```bash
# Vzpostavi vse od začetka
azd up

# Vzpostavi v določenem okolju
azd up --environment production

# Vzpostavi z parametri po meri
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Samo uvajanje infrastrukture
Ko morate posodobiti le Azure vire:
```bash
# Vzpostavitev/posodobitev infrastrukture
azd provision

# Vzpostavitev v načinu simulacije za predogled sprememb
azd provision --preview

# Vzpostavitev določenih storitev
azd provision --service database
```

### Samo uvajanje kode
Za hitro posodobitev aplikacije:
```bash
# Razmestitev vseh storitev
azd deploy

# Pričakovan izhod:
# Razmestitev storitev (azd deploy)
# - web: Razmestitev... Končano
# - api: Razmestitev... Končano
# USPEH: Vaša razmestitev je bila zaključena v 2 minutah in 15 sekundah

# Razmestite določeno storitev
azd deploy --service web
azd deploy --service api

# Razmestite z lastnimi argumenti gradnje
azd deploy --service api --build-arg NODE_ENV=production

# Preverite razmestitev
azd show --output json | jq '.services'
```

### ✅ Preverjanje uspešnosti uvajanja

Po vsakem uvajanju preverite uspeh:

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
- ✅ Vse storitve kažejo status "Running"
- ✅ Končne točke za stanje vračajo HTTP 200
- ✅ V zadnjih 5 minutah ni napak v dnevnikih
- ✅ Aplikacija odgovarja na testne zahteve

## 🏗️ Razumevanje procesa uvajanja

### Faza 1: Pred-provizijski hooki
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

### Faza 3: Post-provizijski hooki
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
- Gradi izvorno kodo aplikacije
- Ustvari artefakte za uvajanje
- Pakira za ciljno platformo (vsebniki, ZIP datoteke itd.)

### Faza 5: Pred-uvozni hooki
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

### Faza 6: Uvajanje aplikacije
- Uvaža zapakirane aplikacije v Azure storitve
- Posodablja nastavitve konfiguracije
- Zažene/predela storitve

### Faza 7: Post-uvozni hooki
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

## 🎛️ Konfiguracija uvajanja

### Nastavitve uvajanja za posamezno storitev
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

## 🔧 Napredni scenariji uvajanja

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

### Blue-Green uvajanja
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

### Canary uvajanja
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

### Staged uvajanja
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

## 🐳 Uvajanje vsebnikov

### Uvajanje Container App aplikacij
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

## ⚡ Optimizacija uspešnosti

### Uvajanja specifična za storitev
```bash
# Namestite določeno storitev za hitrejše iteracije
azd deploy --service web
azd deploy --service api

# Namestite vse storitve
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

### Učinkovita uvajanja kode
```bash
# Za spremembe samo v kodi uporabite azd deploy (ne azd up)
# To preskoči zagotavljanje infrastrukture in je veliko hitrejše
azd deploy

# Razmestite določeno storitev za najhitrejšo iteracijo
azd deploy --service api
```

## 🔍 Spremljanje uvajanja

### Spremljanje uvajanja v realnem času
```bash
# Spremljaj aplikacijo v realnem času
azd monitor --live

# Oglej si dnevnike aplikacije
azd monitor --logs

# Preveri stanje razmestitve
azd show
```

### Preverjanja zdravja
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

### Validacija po uvajanju
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

## 🔐 Varnostne zadeve

### Upravljanje skrivnosti
```bash
# Shranjujte skrivnosti varno
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

### Hiter povratek
```bash
# AZD nima vgrajenega mehanizma za povrnitev (rollback). Priporočeni pristopi:

# Možnost 1: Ponovna razmestitev iz Git (priporočeno)
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
git revert HEAD  # Razveljavite spremembe infrastrukture
azd provision    # Uporabite prejšnje stanje infrastrukture
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

## 📊 Metrični podatki uvajanja

### Spremljajte uspešnost uvajanja
```bash
# Prikaži trenutno stanje uvajanja
azd show

# Spremljaj aplikacijo z Application Insights
azd monitor --overview

# Prikaži meritve v živo
azd monitor --live
```

### Zbiranje po meri metrik
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
# Uporabljajte dosledno poimenovanje
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Ohranjajte skladnost okolij
./scripts/sync-environments.sh
```

### 2. Preverjanje infrastrukture
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

- [Zagotavljanje virov](provisioning.md) - Poglobljen vpogled v upravljanje infrastrukture
- [Načrtovanje pred uvajanjem](../chapter-06-pre-deployment/capacity-planning.md) - Načrtujte svojo strategijo uvajanja
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md) - Rešite težave pri uvajanju
- [Najboljše prakse](../chapter-07-troubleshooting/debugging.md) - Strategije za produkcijsko pripravljena uvajanja

## 🎯 Praktične vaje uvajanja

### Vaja 1: Inkremenčni potek uvajanja (20 minut)
**Cilj**: Obvladati razliko med celovitim in inkrementalnim uvajanjem

```bash
# Začetna namestitev
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabeleži čas začetne namestitve
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
- [ ] Celovito uvajanje traja 5-15 minut
- [ ] Uvajanje samo kode traja 2-5 minut
- [ ] Spremembe kode se odražajo v uvoženi aplikaciji
- [ ] Infrastruktura ostane nespremenjena po `azd deploy`

**Rezultat učenja**: `azd deploy` je 50-70% hitrejši od `azd up` za spremembe kode

### Vaja 2: Prilagojeni hooki uvajanja (30 minut)
**Cilj**: Uvesti avtomatizacijo pred in po uvajanju

```bash
# Ustvari skripto za preverjanje pred uvajanjem
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Preveri, ali testi uspejo
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Preveri, ali obstajajo spremembe brez commita
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

# Dodaj hooke v azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Preizkusi uvajanje s hooki
azd deploy
```

**Kriteriji uspeha:**
- [ ] Skripta pred uvajanjem teče pred samim uvajanjem
- [ ] Uvajanje se prekine, če testi ne uspejo
- [ ] Post-uvozni smoke test preveri zdravje
- [ ] Hooki se izvedejo v pravilnem vrstnem redu

### Vaja 3: Strategija uvajanja za več okolij (45 minut)
**Cilj**: Uvesti večstopenjski potek uvajanja (dev → staging → production)

```bash
# Ustvari skripto za uvajanje
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Korak 1: Uvajanje v razvojno okolje
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 2: Uvajanje v prehodno (staging) okolje
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 3: Ročno odobritev za produkcijsko okolje
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

**Kriteriji uspeha:**
- [ ] Okolje Dev se uspešno uvaja
- [ ] Okolje Staging se uspešno uvaja
- [ ] Za produkcijo je zahtevano ročno odobritev
- [ ] Vsa okolja imajo delujoča preverjanja zdravja
- [ ] Možna je povrnitev, če je potrebno

### Vaja 4: Strategija povrnitve (25 minut)
**Cilj**: Uvesti in testirati povrnitev uvajanja z uporabo Gita

```bash
# Razmestitev v1
azd env set APP_VERSION "1.0.0"
azd up

# Shrani hash commita za v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Razmestitev v2 z nezdružljivo spremembo
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Zaznaj napako in povrni spremembe
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Povrnitev z uporabo Gita
    git revert HEAD --no-edit
    
    # Povrnitev okolja
    azd env set APP_VERSION "1.0.0"
    
    # Ponovna razmestitev v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteriji uspeha:**
- [ ] Zaznajo lahko napake pri uvajanju
- [ ] Skripta za povrnitev se izvede samodejno
- [ ] Aplikacija se vrne v delujoče stanje
- [ ] Preverjanja zdravja uspejo po povrnitvi

## 📊 Spremljanje metrik uvajanja

### Spremljajte uspešnost uvajanja

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

# Uporabi jo
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Ogled zgodovine nameščanj
cat deployment-metrics.csv

# Izračunaj povprečen čas nameščanja
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni viri

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prejšnja lekcija**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Naslednja lekcija**: [Zagotavljanje virov](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko samodejni prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku naj velja za avtoritativni vir. Za ključne informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za kakršne koli nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->