# Vodič za distribuciju - Ovladavanje AZD implementacijama

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod i implementacija
- **⬅️ Prethodno poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Sljedeće**: [Provisioniranje resursa](provisioning.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Rješenja AI s više agenata](../../examples/retail-scenario.md)

## Uvod

Ovaj## Understanding the Deployment Processsveobuhvatni vodič obuhvaća sve što trebate znati o implementaciji aplikacija pomoću Azure Developer CLI, od osnovnih implementacija s jednom naredbom do naprednih produkcijskih scenarija s prilagođenim hookovima, više okruženja i integracijom CI/CD. Ovladat ćete cjelokupnim životnim ciklusom implementacije uz praktične primjere i najbolje prakse.

## Ciljevi učenja

Završetkom ovog vodiča ćete:
- Ovladati svim naredbama i tokovima rada za implementaciju u Azure Developer CLI
- Razumjeti cjelokupni životni ciklus implementacije, od provisioniranja do nadzora
- Implementirati prilagođene hookove za automatizaciju prije i nakon implementacije
- Konfigurirati više okruženja s parametrima specifičnim za svako okruženje
- Postaviti napredne strategije implementacije uključujući blue-green i canary implementacije
- Integrirati azd implementacije s CI/CD pipeline-ovima i DevOps tokovima rada

## Ishodi učenja

Po završetku, moći ćete:
- Izvoditi i otklanjati poteškoće u svim azd tokovima implementacije samostalno
- Dizajnirati i implementirati prilagođenu automatizaciju implementacije koristeći hookove
- Konfigurirati produkcijske implementacije spremne za uporabu s odgovarajućom sigurnošću i nadzorom
- Upravljati složenim scenarijima implementacije s više okruženja
- Optimizirati performanse implementacije i implementirati strategije povratka (rollback)
- Integrirati azd implementacije u enterprise DevOps prakse

## Pregled implementacije

Azure Developer CLI pruža nekoliko naredbi za implementaciju:
- `azd up` - Kompletan tijek rada (provision + deploy)
- `azd provision` - Samo kreira/azurira Azure resurse
- `azd deploy` - Samo implementira kod aplikacije
- `azd package` - Gradi i paketira aplikacije

## Osnovni tokovi rada za implementaciju

### Kompletna implementacija (azd up)
Najčešći tijek rada za nove projekte:
```bash
# Postavite sve ispočetka
azd up

# Postavite s određenim okruženjem
azd up --environment production

# Postavite s prilagođenim parametrima
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Implementacija samo infrastrukture
Kad trebate samo ažurirati Azure resurse:
```bash
# Postavi/ažuriraj infrastrukturu
azd provision

# Postavi s probnim izvođenjem (dry-run) za pregled promjena
azd provision --preview

# Postavi određene usluge
azd provision --service database
```

### Implementacija samo koda
Za brza ažuriranja aplikacije:
```bash
# Rasporedite sve usluge
azd deploy

# Očekivani izlaz:
# Raspoređivanje usluga (azd deploy)
# - web: Raspoređivanje... Gotovo
# - api: Raspoređivanje... Gotovo
# USPJEH: Vaše raspoređivanje dovršeno je za 2 minute i 15 sekundi

# Rasporedite određenu uslugu
azd deploy --service web
azd deploy --service api

# Rasporedite s prilagođenim argumentima za izgradnju
azd deploy --service api --build-arg NODE_ENV=production

# Provjerite raspoređivanje
azd show --output json | jq '.services'
```

### ✅ Verifikacija implementacije

Nakon svake implementacije, provjerite uspjeh:

```bash
# Provjerite rade li svi servisi
azd show

# Testirajte endpointe za provjeru stanja
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Pratite pogreške (otvara se u pregledniku prema zadanim postavkama)
azd monitor --logs
```

**Kriteriji uspjeha:**
- ✅ Sve usluge prikazuju status "Pokrenuto"
- ✅ Krajnje točke za zdravlje vraćaju HTTP 200
- ✅ Nema zapisnika pogrešaka u posljednjih 5 minuta
- ✅ Aplikacija odgovara na testne zahtjeve

## 🏗️ Razumijevanje procesa implementacije

### Faza 1: Hookovi prije provisioniranja
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

### Faza 2: Provisioniranje infrastrukture
- Čita predloške infrastrukture (Bicep/Terraform)
- Kreira ili ažurira Azure resurse
- Konfigurira mrežu i sigurnost
- Postavlja nadzor i zapisivanje dnevnika

### Faza 3: Hookovi nakon provisioniranja
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
- Gradi kod aplikacije
- Stvara artefakte za implementaciju
- Pakira za ciljnu platformu (kontejneri, ZIP datoteke, itd.)

### Faza 5: Hookovi prije implementacije
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
- Implementira pakirane aplikacije u Azure servise
- Ažurira konfiguracijske postavke
- Pokreće/ponovno pokreće usluge

### Faza 7: Hookovi nakon implementacije
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

### Postavke implementacije specifične za usluge
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

# Pripremno okruženje
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
# Stvori plavo okruženje
azd env new production-blue
azd up --environment production-blue

# Testiraj plavo okruženje
./scripts/test-environment.sh production-blue

# Preusmjeri promet na plavo (ručno ažuriranje DNS-a/uravnoteživača opterećenja)
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

### Implementacije u fazama
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

### Implementacije specifične za usluge
```bash
# Rasporedi određenu uslugu za brže iteriranje
azd deploy --service web
azd deploy --service api

# Rasporedi sve usluge
azd deploy
```

### Keširanje izgradnje
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Učinkovite implementacije koda
```bash
# Za promjene samo u kodu koristite azd deploy (ne azd up)
# Ovo preskače postavljanje infrastrukture i znatno je brže
azd deploy

# Rasporedite određenu uslugu za najbržu iteraciju
azd deploy --service api
```

## 🔍 Nadzor implementacija

### Nadzor implementacije u stvarnom vremenu
```bash
# Prati aplikaciju u stvarnom vremenu
azd monitor --live

# Prikaži zapise aplikacije
azd monitor --logs

# Provjeri status implementacije
azd show
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
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Provjeri zdravlje aplikacije
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

## 🔐 Sigurnosna razmatranja

### Upravljanje tajnama
```bash
# Sigurno pohranite tajne
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

### Mrežna sigurnost
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

## 🚨 Strategije povratka (Rollback)

### Brzi povratak (Rollback)
```bash
# AZD nema ugrađenu mogućnost vraćanja (rollback). Preporučeni pristupi:

# Opcija 1: Ponovno implementirajte iz Git repozitorija (preporučeno)
git revert HEAD  # Poništite problematični commit
git push
azd deploy

# Opcija 2: Ponovno implementirajte određeni commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback infrastrukture
```bash
# Pregledajte promjene infrastrukture prije primjene
azd provision --preview

# Za vraćanje infrastrukture, koristite sustav za upravljanje verzijama:
git revert HEAD  # Poništite promjene infrastrukture
azd provision    # Primijenite prethodno stanje infrastrukture
```

### Rollback migracije baze podataka
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrike implementacija

### Praćenje performansi implementacije
```bash
# Prikaži trenutni status implementacije
azd show

# Nadzirajte aplikaciju pomoću Application Insights
azd monitor --overview

# Prikaži metrike u stvarnom vremenu
azd monitor --live
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

### 1. Konzistentnost okruženja
```bash
# Koristite dosljedno imenovanje
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Održavajte usklađenost okruženja
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Pregled promjena infrastrukture prije raspoređivanja
azd provision --preview

# Koristite linting za ARM/Bicep
az bicep lint --file infra/main.bicep

# Provjerite sintaksu Bicep
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

### 4. Dokumentacija i zapisivanje dnevnika
```bash
# Dokumentirajte postupke implementacije
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sljedeći koraci

- [Provisioniranje resursa](provisioning.md) - Detaljan uvid u upravljanje infrastrukturom
- [Planiranje prije implementacije](../chapter-06-pre-deployment/capacity-planning.md) - Isplanirajte svoju strategiju implementacije
- [Uobičajeni problemi](../chapter-07-troubleshooting/common-issues.md) - Riješite probleme s implementacijom
- [Najbolje prakse](../chapter-07-troubleshooting/debugging.md) - Strategije implementacije spremne za produkciju

## 🎯 Praktične vježbe implementacije

### Vježba 1: Inkrementalni tijek rada implementacije (20 minuta)
**Cilj**: Ovladati razlikom između potpune i inkrementalne implementacije

```bash
# Početno postavljanje
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabilježi vrijeme početnog postavljanja
echo "Full deployment: $(date)" > deployment-log.txt

# Napravi promjenu koda
echo "// Updated $(date)" >> src/api/src/server.js

# Postavi samo kod (brzo)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Usporedi vremena
cat deployment-log.txt

# Očisti
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Potpuna implementacija traje 5-15 minuta
- [ ] Implementacija samo koda traje 2-5 minuta
- [ ] Promjene u kodu se reflektiraju u implementiranoj aplikaciji
- [ ] Infrastruktura ostaje nepromijenjena nakon `azd deploy`

**Ishod učenja**: `azd deploy` je 50-70% brži od `azd up` za promjene u kodu

### Vježba 2: Prilagođeni hookovi za implementaciju (30 minuta)
**Cilj**: Implementirati automatizaciju prije i nakon implementacije

```bash
# Stvori validacijsku skriptu prije postavljanja
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Provjeri prolaze li testovi
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Provjeri ima li nekomitiranih promjena
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Stvori smoke test nakon postavljanja
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

# Testiraj postavljanje s hookovima
azd deploy
```

**Kriteriji uspjeha:**
- [ ] Skripta prije implementacije se izvršava prije implementacije
- [ ] Implementacija se prekida ako testovi ne uspiju
- [ ] Post-deploy smoke test (površinski test) provjerava zdravlje
- [ ] Hookovi se izvršavaju u ispravnom redoslijedu

### Vježba 3: Strategija implementacije za više okruženja (45 minuta)
**Cilj**: Implementirati tijek rada implementacije u fazama (dev → staging → production)

```bash
# Kreiraj skriptu za implementaciju
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Korak 1: Rasporedi u razvojno okruženje
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 2: Rasporedi u pripremno okruženje
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

# Pokreni raspoređivanje u fazama
./deploy-staged.sh
```

**Kriteriji uspjeha:**
- [ ] Dev okruženje se uspješno implementira
- [ ] Staging okruženje se uspješno implementira
- [ ] Potrebno ručno odobrenje za produkciju
- [ ] Sva okruženja imaju radne provjere zdravlja
- [ ] Moguć povratak (rollback) ako je potrebno

### Vježba 4: Strategija povratka (25 minuta)
**Cilj**: Implementirati i testirati povratak implementacije koristeći Git

```bash
# Rasporedi v1
azd env set APP_VERSION "1.0.0"
azd up

# Spremi hash commita v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Rasporedi v2 s nekompatibilnom promjenom
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Otkrivanje neuspjeha i vraćanje
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Vraćanje koristeći git
    git revert HEAD --no-edit
    
    # Vraćanje okruženja
    azd env set APP_VERSION "1.0.0"
    
    # Ponovno rasporedi v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteriji uspjeha:**
- [ ] Moguće je detektirati neuspjehe implementacije
- [ ] Skripta za rollback se izvršava automatski
- [ ] Aplikacija se vraća u radno stanje
- [ ] Provjere zdravlja prolaze nakon rollbacka

## 📊 Praćenje metrika implementacije

### Pratite performanse svoje implementacije

```bash
# Kreirajte skriptu za metrike implementacije
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

# Zapišite u datoteku
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Upotrijebite je
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Prikaži povijest implementacija
cat deployment-metrics.csv

# Izračunaj prosječno vrijeme implementacije
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni resursi

- [Referenca za Azure Developer CLI za implementaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementacija u Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementacija u Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementacija Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna lekcija**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **Sljedeća lekcija**: [Provisioniranje resursa](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj dokument je preveden pomoću AI prevoditeljskog servisa Co-op Translator (https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Originalni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz upotrebe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->