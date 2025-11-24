<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-23T21:24:36+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "sl"
}
-->
# Vodnik za uvajanje - Obvladovanje uvajanj z AZD

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda in uvajanje
- **⬅️ Prejšnje poglavje**: [Poglavje 3: Konfiguracija](../getting-started/configuration.md)
- **➡️ Naslednje**: [Zagotavljanje virov](provisioning.md)
- **🚀 Naslednje poglavje**: [Poglavje 5: Rešitve z več agenti AI](../../examples/retail-scenario.md)

## Uvod

Ta celovit vodnik zajema vse, kar morate vedeti o uvajanju aplikacij z uporabo Azure Developer CLI, od osnovnih uvajanj z enim ukazom do naprednih produkcijskih scenarijev s prilagojenimi skripti, več okolji in integracijo CI/CD. Obvladujte celoten življenjski cikel uvajanja s praktičnimi primeri in najboljšimi praksami.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Obvladali vse ukaze in delovne tokove za uvajanje z Azure Developer CLI
- Razumeli celoten življenjski cikel uvajanja od zagotavljanja do spremljanja
- Implementirali prilagojene skripte za avtomatizacijo pred in po uvajanju
- Konfigurirali več okolij s parametri, specifičnimi za okolje
- Nastavili napredne strategije uvajanja, vključno z modro-zelenimi in kanarskimi uvajanji
- Integrirali uvajanja z azd v CI/CD pipeline in delovne tokove DevOps

## Rezultati učenja

Po zaključku boste sposobni:
- Samostojno izvajati in odpravljati težave pri vseh delovnih tokovih uvajanja z azd
- Načrtovati in implementirati prilagojeno avtomatizacijo uvajanja s skripti
- Konfigurirati produkcijsko pripravljena uvajanja z ustrezno varnostjo in spremljanjem
- Upravljati kompleksne scenarije uvajanja z več okolji
- Optimizirati zmogljivost uvajanja in implementirati strategije povratka
- Integrirati uvajanja z azd v prakse DevOps za podjetja

## Pregled uvajanja

Azure Developer CLI ponuja več ukazov za uvajanje:
- `azd up` - Celoten delovni tok (zagotavljanje + uvajanje)
- `azd provision` - Ustvarjanje/posodabljanje samo Azure virov
- `azd deploy` - Uvajanje samo aplikacijske kode
- `azd package` - Gradnja in pakiranje aplikacij

## Osnovni delovni tokovi uvajanja

### Celotno uvajanje (azd up)
Najpogostejši delovni tok za nove projekte:
```bash
# Namesti vse od začetka
azd up

# Namesti s specifičnim okoljem
azd up --environment production

# Namesti z lastnimi parametri
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Uvajanje samo infrastrukture
Ko morate posodobiti samo Azure vire:
```bash
# Zagotovitev/posodobitev infrastrukture
azd provision

# Zagotovitev s suhim zagonom za predogled sprememb
azd provision --preview

# Zagotovitev specifičnih storitev
azd provision --service database
```

### Uvajanje samo kode
Za hitre posodobitve aplikacij:
```bash
# Namesti vse storitve
azd deploy

# Pričakovani rezultat:
# Nameščanje storitev (azd deploy)
# - splet: Nameščanje... Končano
# - api: Nameščanje... Končano
# USPEH: Vaša namestitev je bila zaključena v 2 minutah in 15 sekundah

# Namesti določeno storitev
azd deploy --service web
azd deploy --service api

# Namesti z argumenti za prilagojeno gradnjo
azd deploy --service api --build-arg NODE_ENV=production

# Preveri namestitev
azd show --output json | jq '.services'
```

### ✅ Preverjanje uvajanja

Po vsakem uvajanju preverite uspešnost:

```bash
# Preverite, ali vse storitve delujejo
azd show

# Preizkusite zdravstvene končne točke
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Preverite dnevnike za napake
azd logs --service api --since 5m | grep -i error
```

**Merila uspešnosti:**
- ✅ Vse storitve prikazujejo status "Running"
- ✅ Končne točke zdravja vračajo HTTP 200
- ✅ V zadnjih 5 minutah ni dnevnikov napak
- ✅ Aplikacija se odziva na testne zahteve

## 🏗️ Razumevanje procesa uvajanja

### Faza 1: Skripti pred zagotavljanjem
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

### Faza 3: Skripti po zagotavljanju
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
- Gradi aplikacijsko kodo
- Ustvari artefakte uvajanja
- Pakira za ciljno platformo (kontejnerji, ZIP datoteke itd.)

### Faza 5: Skripti pred uvajanjem
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
- Uvede pakirane aplikacije v Azure storitve
- Posodobi nastavitve konfiguracije
- Zažene/ponovno zažene storitve

### Faza 7: Skripti po uvajanju
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

### Nastavitve uvajanja, specifične za storitve
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

### Konfiguracije, specifične za okolje
```bash
# Razvojno okolje
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testno okolje
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Proizvodno okolje
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

### Modro-zelena uvajanja
```bash
# Ustvari modro okolje
azd env new production-blue
azd up --environment production-blue

# Preizkusi modro okolje
./scripts/test-environment.sh production-blue

# Preklopi promet na modro (ročna posodobitev DNS/uravnoteževalnika obremenitve)
./scripts/switch-traffic.sh production-blue

# Počisti zeleno okolje
azd env select production-green
azd down --force
```

### Kanarska uvajanja
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

### Fazična uvajanja
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

## 🐳 Uvajanja kontejnerjev

### Uvajanja aplikacij v kontejnerjih
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

### Vzporedna uvajanja
```bash
# Konfiguriraj vzporedno uvajanje
azd config set deploy.parallelism 5

# Uvajaj storitve vzporedno
azd deploy --parallel
```

### Predpomnjenje gradnje
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

### Incrementalna uvajanja
```bash
# Namesti samo spremenjene storitve
azd deploy --incremental

# Namesti z zaznavanjem sprememb
azd deploy --detect-changes
```

## 🔍 Spremljanje uvajanja

### Spremljanje uvajanja v realnem času
```bash
# Spremljajte napredek uvajanja
azd deploy --follow

# Oglejte si dnevnike uvajanja
azd logs --follow --service api

# Preverite stanje uvajanja
azd show --service api
```

### Preverjanje zdravja
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

# Preveri stanje aplikacije
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
# Shranite skrivnosti varno
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

## 🚨 Strategije povratka

### Hitri povratek
```bash
# Povrnitev na prejšnjo namestitev
azd deploy --rollback

# Povrnitev določenega servisa
azd deploy --service api --rollback

# Povrnitev na določeno različico
azd deploy --service api --version v1.2.3
```

### Povratek infrastrukture
```bash
# Razveljavi spremembe infrastrukture
azd provision --rollback

# Predogled sprememb razveljavitve
azd provision --rollback --preview
```

### Povratek migracije podatkovne baze
```bash
#!/bin/bash
# skripte/razveljavi-bazo-podatkov.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrične uvajanja

### Spremljanje zmogljivosti uvajanja
```bash
# Omogoči metrike uvajanja
azd config set telemetry.deployment.enabled true

# Prikaži zgodovino uvajanja
azd history

# Pridobi statistiko uvajanja
azd metrics --type deployment
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

### 1. Doslednost okolja
```bash
# Uporabljajte dosledna imena
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Ohranite enakost okolja
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Preverite pred uvajanjem
azd provision --preview
azd provision --what-if

# Uporabite ARM/Bicep lintanje
az bicep lint --file infra/main.bicep
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

- [Zagotavljanje virov](provisioning.md) - Poglobljen pogled na upravljanje infrastrukture
- [Načrtovanje pred uvajanjem](../pre-deployment/capacity-planning.md) - Načrtujte svojo strategijo uvajanja
- [Pogoste težave](../troubleshooting/common-issues.md) - Reševanje težav pri uvajanju
- [Najboljše prakse](../troubleshooting/debugging.md) - Strategije uvajanja, pripravljene za produkcijo

## 🎯 Praktične vaje za uvajanje

### Vaja 1: Incrementalni delovni tok uvajanja (20 minut)
**Cilj**: Obvladovanje razlike med polnim in incrementalnim uvajanjem

```bash
# Prvotna uvedba
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabeleži čas prvotne uvedbe
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

**Merila uspešnosti:**
- [ ] Polno uvajanje traja 5-15 minut
- [ ] Uvajanje samo kode traja 2-5 minut
- [ ] Spremembe kode so vidne v uvedeni aplikaciji
- [ ] Infrastruktura ostane nespremenjena po `azd deploy`

**Rezultat učenja**: `azd deploy` je 50-70% hitrejši od `azd up` za spremembe kode

### Vaja 2: Prilagojeni skripti za uvajanje (30 minut)
**Cilj**: Implementacija avtomatizacije pred in po uvajanju

```bash
# Ustvari skript za preverjanje pred namestitvijo
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Preveri, ali testi uspejo
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Preveri neoddane spremembe
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Ustvari test delovanja po namestitvi
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

# Dodaj kljuke v azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Preizkusi namestitev s kljukami
azd deploy
```

**Merila uspešnosti:**
- [ ] Skript pred uvajanjem se zažene pred uvajanjem
- [ ] Uvajanje se prekine, če testi ne uspejo
- [ ] Skript po uvajanju preveri zdravje aplikacije
- [ ] Skripti se izvajajo v pravilnem vrstnem redu

### Vaja 3: Strategija uvajanja z več okolji (45 minut)
**Cilj**: Implementacija faznega delovnega toka uvajanja (razvoj → testiranje → produkcija)

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

# Korak 2: Uvajanje v testno okolje
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

# Zaženi postopno uvajanje
./deploy-staged.sh
```

**Merila uspešnosti:**
- [ ] Okolje za razvoj se uspešno uvede
- [ ] Okolje za testiranje se uspešno uvede
- [ ] Ročna odobritev je potrebna za produkcijo
- [ ] Vsa okolja imajo delujoče preverjanje zdravja
- [ ] Možnost povratka, če je potrebno

### Vaja 4: Strategija povratka (25 minut)
**Cilj**: Implementacija in testiranje povratka uvajanja

```bash
# Namesti v1
azd env set APP_VERSION "1.0.0"
azd up

# Shrani konfiguracijo v1
cp -r .azure/production .azure/production-v1-backup

# Namesti v2 z nezdružljivo spremembo
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Zaznaj napako
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Povrni kodo
    git checkout src/api/src/server.js
    
    # Povrni okolje
    azd env set APP_VERSION "1.0.0"
    
    # Ponovno namesti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Merila uspešnosti:**
- [ ] Možnost zaznavanja napak pri uvajanju
- [ ] Skript za povratek se samodejno zažene
- [ ] Aplikacija se vrne v delujoče stanje
- [ ] Preverjanje zdravja uspe po povratku

## 📊 Spremljanje metrik uvajanja

### Spremljanje zmogljivosti uvajanja

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
# Ogled zgodovine uvajanja
cat deployment-metrics.csv

# Izračun povprečnega časa uvajanja
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni viri

- [Referenca za uvajanje z Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Uvajanje Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Uvajanje Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Uvajanje Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prejšnja lekcija**: [Vaš prvi projekt](../getting-started/first-project.md)
- **Naslednja lekcija**: [Zagotavljanje virov](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije je priporočljivo profesionalno človeško prevajanje. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->