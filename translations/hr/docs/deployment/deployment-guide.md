<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-23T18:55:13+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "hr"
}
-->
# Vodič za implementaciju - Ovladavanje AZD implementacijama

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod i implementacija
- **⬅️ Prethodno poglavlje**: [Poglavlje 3: Konfiguracija](../getting-started/configuration.md)
- **➡️ Sljedeće**: [Provisioning Resources](provisioning.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Višeagencijska AI rješenja](../../examples/retail-scenario.md)

## Uvod

Ovaj sveobuhvatni vodič pokriva sve što trebate znati o implementaciji aplikacija pomoću Azure Developer CLI-ja, od osnovnih implementacija s jednom naredbom do naprednih produkcijskih scenarija s prilagođenim skriptama, višestrukim okruženjima i integracijom CI/CD-a. Ovladat ćete cijelim životnim ciklusom implementacije uz praktične primjere i najbolje prakse.

## Ciljevi učenja

Završetkom ovog vodiča, naučit ćete:
- Ovladati svim naredbama i radnim procesima za implementaciju Azure Developer CLI-ja
- Razumjeti cijeli životni ciklus implementacije, od pripreme resursa do praćenja
- Implementirati prilagođene skripte za automatizaciju prije i nakon implementacije
- Konfigurirati višestruka okruženja s parametrima specifičnim za okruženje
- Postaviti napredne strategije implementacije, uključujući blue-green i canary implementacije
- Integrirati azd implementacije s CI/CD pipelineovima i DevOps radnim procesima

## Ishodi učenja

Po završetku, bit ćete sposobni:
- Samostalno izvršavati i rješavati probleme svih azd implementacijskih radnih procesa
- Dizajnirati i implementirati prilagođenu automatizaciju implementacije koristeći skripte
- Konfigurirati implementacije spremne za produkciju s odgovarajućom sigurnošću i praćenjem
- Upravljati složenim scenarijima implementacije u više okruženja
- Optimizirati performanse implementacije i implementirati strategije povratka na prethodnu verziju
- Integrirati azd implementacije u DevOps prakse na razini poduzeća

## Pregled implementacije

Azure Developer CLI nudi nekoliko naredbi za implementaciju:
- `azd up` - Kompletan radni proces (priprema + implementacija)
- `azd provision` - Samo kreiranje/ažuriranje Azure resursa
- `azd deploy` - Samo implementacija koda aplikacije
- `azd package` - Izgradnja i pakiranje aplikacija

## Osnovni radni procesi implementacije

### Kompletna implementacija (azd up)
Najčešći radni proces za nove projekte:
```bash
# Postavi sve od početka
azd up

# Postavi s određenim okruženjem
azd up --environment production

# Postavi s prilagođenim parametrima
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Samo priprema infrastrukture
Kada trebate samo ažurirati Azure resurse:
```bash
# Osiguraj/ažuriraj infrastrukturu
azd provision

# Osiguraj s probnim pokretanjem za pregled promjena
azd provision --preview

# Osiguraj specifične usluge
azd provision --service database
```

### Samo implementacija koda
Za brza ažuriranja aplikacije:
```bash
# Implementiraj sve usluge
azd deploy

# Očekivani izlaz:
# Implementacija usluga (azd deploy)
# - web: Implementacija... Gotovo
# - api: Implementacija... Gotovo
# USPJEH: Vaša implementacija završena za 2 minute i 15 sekundi

# Implementiraj specifičnu uslugu
azd deploy --service web
azd deploy --service api

# Implementiraj s prilagođenim argumentima za izgradnju
azd deploy --service api --build-arg NODE_ENV=production

# Provjeri implementaciju
azd show --output json | jq '.services'
```

### ✅ Verifikacija implementacije

Nakon svake implementacije, provjerite uspjeh:

```bash
# Provjerite rade li sve usluge
azd show

# Testirajte krajnje točke zdravlja
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Provjerite zapise za pogreške
azd logs --service api --since 5m | grep -i error
```

**Kriteriji uspjeha:**
- ✅ Svi servisi prikazuju status "Running"
- ✅ Health endpointi vraćaju HTTP 200
- ✅ Nema grešaka u logovima u posljednjih 5 minuta
- ✅ Aplikacija odgovara na testne zahtjeve

## 🏗️ Razumijevanje procesa implementacije

### Faza 1: Skripte prije pripreme
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

### Faza 2: Priprema infrastrukture
- Čita predloške infrastrukture (Bicep/Terraform)
- Kreira ili ažurira Azure resurse
- Konfigurira mrežu i sigurnost
- Postavlja praćenje i logiranje

### Faza 3: Skripte nakon pripreme
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
- Izgrađuje kod aplikacije
- Kreira artefakte za implementaciju
- Pakira za ciljanu platformu (kontejneri, ZIP datoteke itd.)

### Faza 5: Skripte prije implementacije
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

### Faza 6: Implementacija aplikacije
- Implementira zapakirane aplikacije na Azure servise
- Ažurira postavke konfiguracije
- Pokreće/ponovno pokreće servise

### Faza 7: Skripte nakon implementacije
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

## 🎛️ Konfiguracija implementacije

### Postavke implementacije specifične za servis
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

### Konfiguracije specifične za okruženje
```bash
# Razvojno okruženje
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testno okruženje
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produkcijsko okruženje
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Napredni scenariji implementacije

### Aplikacije s više servisa
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

### Blue-Green implementacije
```bash
# Kreiraj plavo okruženje
azd env new production-blue
azd up --environment production-blue

# Testiraj plavo okruženje
./scripts/test-environment.sh production-blue

# Prebaci promet na plavo (ručna DNS/ažuriranje load balancera)
./scripts/switch-traffic.sh production-blue

# Očisti zeleno okruženje
azd env select production-green
azd down --force
```

### Canary implementacije
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

### Faza implementacije
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

## 🐳 Implementacije kontejnera

### Implementacije aplikacija u kontejnerima
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

### Optimizacija višestupanjskog Dockerfile-a
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

## ⚡ Optimizacija performansi

### Paralelne implementacije
```bash
# Konfiguriraj paralelno implementiranje
azd config set deploy.parallelism 5

# Implementiraj usluge paralelno
azd deploy --parallel
```

### Keširanje izgradnje
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

### Inkrementalne implementacije
```bash
# Implementiraj samo promijenjene usluge
azd deploy --incremental

# Implementiraj s detekcijom promjena
azd deploy --detect-changes
```

## 🔍 Praćenje implementacije

### Praćenje implementacije u stvarnom vremenu
```bash
# Pratite napredak implementacije
azd deploy --follow

# Pregledajte zapisnike implementacije
azd logs --follow --service api

# Provjerite status implementacije
azd show --service api
```

### Provjere zdravlja
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

### Validacija nakon implementacije
```bash
#!/bin/bash
# skripte/validate-deployment.sh

echo "Validating deployment..."

# Provjerite stanje aplikacije
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

## 🔐 Sigurnosni aspekti

### Upravljanje tajnama
```bash
# Pohranite tajne sigurno
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referencirajte tajne u azure.yaml
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

### Sigurnost mreže
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Upravljanje identitetom i pristupom
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

## 🚨 Strategije povratka na prethodnu verziju

### Brzi povratak
```bash
# Povratak na prethodno postavljanje
azd deploy --rollback

# Povratak specifične usluge
azd deploy --service api --rollback

# Povratak na specifičnu verziju
azd deploy --service api --version v1.2.3
```

### Povratak infrastrukture
```bash
# Poništi promjene infrastrukture
azd provision --rollback

# Pregledaj promjene poništavanja
azd provision --rollback --preview
```

### Povratak migracije baze podataka
```bash
#!/bin/bash
# skripte/vrati-bazu-podataka.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrike implementacije

### Praćenje performansi implementacije
```bash
# Omogući metrike implementacije
azd config set telemetry.deployment.enabled true

# Pregledaj povijest implementacije
azd history

# Dohvati statistiku implementacije
azd metrics --type deployment
```

### Prikupljanje prilagođenih metrika
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

## 🎯 Najbolje prakse

### 1. Dosljednost okruženja
```bash
# Koristite dosljedna imena
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Održavajte paritet okruženja
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Provjerite prije implementacije
azd provision --preview
azd provision --what-if

# Koristite ARM/Bicep lintanje
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

### 4. Dokumentacija i logiranje
```bash
# Dokumentirajte postupke implementacije
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sljedeći koraci

- [Provisioning Resources](provisioning.md) - Detaljno o upravljanju infrastrukturom
- [Pre-Deployment Planning](../pre-deployment/capacity-planning.md) - Planirajte svoju strategiju implementacije
- [Common Issues](../troubleshooting/common-issues.md) - Rješavanje problema s implementacijom
- [Best Practices](../troubleshooting/debugging.md) - Strategije implementacije spremne za produkciju

## 🎯 Praktične vježbe implementacije

### Vježba 1: Inkrementalni radni proces implementacije (20 minuta)
**Cilj**: Ovladati razlikom između potpune i inkrementalne implementacije

```bash
# Početno postavljanje
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabilježite vrijeme početnog postavljanja
echo "Full deployment: $(date)" > deployment-log.txt

# Napravite promjenu koda
echo "// Updated $(date)" >> src/api/src/server.js

# Postavite samo kod (brzo)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Usporedite vremena
cat deployment-log.txt

# Očistite
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Potpuna implementacija traje 5-15 minuta
- [ ] Samo implementacija koda traje 2-5 minuta
- [ ] Promjene u kodu vidljive u implementiranoj aplikaciji
- [ ] Infrastruktura ostaje nepromijenjena nakon `azd deploy`

**Ishod učenja**: `azd deploy` je 50-70% brži od `azd up` za promjene u kodu

### Vježba 2: Prilagođene skripte za implementaciju (30 minuta)
**Cilj**: Implementirati automatizaciju prije i nakon implementacije

```bash
# Kreiraj skriptu za validaciju prije implementacije
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Provjeri jesu li testovi uspješni
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Provjeri ima li nepredanih promjena
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Kreiraj test provjere nakon implementacije
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

# Dodaj hookove u azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testiraj implementaciju s hookovima
azd deploy
```

**Kriteriji uspjeha:**
- [ ] Skripta prije implementacije pokreće se prije implementacije
- [ ] Implementacija se prekida ako testovi ne uspiju
- [ ] Post-implementacijski test provjerava zdravlje
- [ ] Skripte se izvršavaju ispravnim redoslijedom

### Vježba 3: Strategija implementacije u više okruženja (45 minuta)
**Cilj**: Implementirati fazni radni proces implementacije (dev → staging → production)

```bash
# Kreiraj skriptu za implementaciju
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Korak 1: Implementiraj na razvojno okruženje
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 2: Implementiraj na testno okruženje
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 3: Ručno odobrenje za produkciju
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

# Kreiraj okruženja
azd env new dev
azd env new staging
azd env new production

# Pokreni postupnu implementaciju
./deploy-staged.sh
```

**Kriteriji uspjeha:**
- [ ] Dev okruženje uspješno implementirano
- [ ] Staging okruženje uspješno implementirano
- [ ] Ručno odobrenje potrebno za produkciju
- [ ] Sva okruženja imaju funkcionalne provjere zdravlja
- [ ] Mogućnost povratka na prethodnu verziju ako je potrebno

### Vježba 4: Strategija povratka na prethodnu verziju (25 minuta)
**Cilj**: Implementirati i testirati povratak na prethodnu verziju

```bash
# Implementiraj v1
azd env set APP_VERSION "1.0.0"
azd up

# Spremi konfiguraciju v1
cp -r .azure/production .azure/production-v1-backup

# Implementiraj v2 s promjenom koja prekida
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Otkrivanje neuspjeha
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Povratak koda
    git checkout src/api/src/server.js
    
    # Povratak okruženja
    azd env set APP_VERSION "1.0.0"
    
    # Ponovno implementiraj v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteriji uspjeha:**
- [ ] Mogućnost detekcije neuspjeha implementacije
- [ ] Skripta za povratak automatski se izvršava
- [ ] Aplikacija se vraća u funkcionalno stanje
- [ ] Provjere zdravlja prolaze nakon povratka

## 📊 Praćenje metrika implementacije

### Praćenje performansi implementacije

```bash
# Kreiraj skriptu za metrike implementacije
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

# Zapisuj u datoteku
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Koristi to
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Pregledaj povijest implementacije
cat deployment-metrics.csv

# Izračunaj prosječno vrijeme implementacije
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni resursi

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna lekcija**: [Vaš prvi projekt](../getting-started/first-project.md)
- **Sljedeća lekcija**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne odgovaramo za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->