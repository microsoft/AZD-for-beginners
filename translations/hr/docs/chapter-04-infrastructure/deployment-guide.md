# Vodič za Raspoređivanje - Ovladavanje AZD Raspoređivanjima

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod i raspoređivanje
- **⬅️ Prethodno poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Sljedeće**: [Provisioning Resources](provisioning.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Višestruka AI rješenja](../../examples/retail-scenario.md)

## Uvod

Ovaj sveobuhvatni vodič pokriva sve što trebate znati o raspoređivanju aplikacija koristeći Azure Developer CLI, od osnovnih raspoređivanja jednim naredbom do naprednih produkcijskih scenarija s prilagođenim kukicama, višestrukim okruženjima i integracijom CI/CD. Ovladajte kompletnim životnim ciklusom raspoređivanja uz praktične primjere i najbolje prakse.

## Ciljevi učenja

Nakon dovršetka ovog vodiča, moći ćete:
- Ovladati svim Azure Developer CLI naredbama i tijekovima rada za raspoređivanje
- Razumjeti kompletan životni ciklus raspoređivanja od provisioninga do nadzora
- Implementirati prilagođene kukice za automatizaciju prije i poslije raspoređivanja
- Konfigurirati višestruka okruženja s parametrima specifičnim za okruženje
- Postaviti napredne strategije raspoređivanja uključujući blue-green i canary raspoređivanja
- Integrirati azd raspoređivanja s CI/CD cjevovodima i DevOps tijekovima rada

## Ishodi učenja

Po dovršetku, moći ćete:
- Neovisno izvršavati i otklanjati poteškoće u svim azd tijekovima rada za raspoređivanje
- Dizajnirati i implementirati prilagođenu automatizaciju raspoređivanja pomoću kukica
- Konfigurirati produkcijska raspoređivanja s odgovarajućom sigurnošću i nadzorom
- Upravljati složenim scenarijima raspoređivanja za višestruka okruženja
- Optimizirati izvedbu raspoređivanja i implementirati strategije povrata
- Integrirati azd raspoređivanja u korporativne DevOps prakse

## Pregled raspoređivanja

Azure Developer CLI pruža nekoliko naredbi za raspoređivanje:
- `azd up` - Kompletan tijek rada (provision + deploy)
- `azd provision` - Samo kreiranje/azuriranje Azure resursa
- `azd deploy` - Samo raspoređivanje aplikacijskog koda
- `azd package` - Izgradnja i pakiranje aplikacija

## Osnovni tijekovi rada raspoređivanja

### Kompletno raspoređivanje (azd up)
Najčešći tijek rada za nove projekte:
```bash
# Postavi sve od početka
azd up

# Postavi sa specifičnim okruženjem
azd up --environment production

# Postavi s prilagođenim parametrima
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Raspoređivanje samo infrastrukture
Kad trebate samo ažurirati Azure resurse:
```bash
# Nabava/azuriranje infrastrukture
azd provision

# Nabava sa suhim pokusajem za pregled promjena
azd provision --preview

# Nabava specificnih usluga
azd provision --service database
```

### Raspoređivanje samo koda
Za brze ažuriranja aplikacije:
```bash
# Postavi sve usluge
azd deploy

# Očekivani izlaz:
# Postavljanje usluga (azd deploy)
# - web: Postavljanje... Gotovo
# - api: Postavljanje... Gotovo
# USPJEH: Vaša implementacija je završila za 2 minute i 15 sekundi

# Postavi određenu uslugu
azd deploy --service web
azd deploy --service api

# Postavi s prilagođenim argumentima za izgradnju
azd deploy --service api --build-arg NODE_ENV=production

# Provjeri implementaciju
azd show --output json | jq '.services'
```

### ✅ Provjera raspoređivanja

Nakon bilo kojeg raspoređivanja, provjerite uspjeh:

```bash
# Provjerite rade li svi servisi
azd show

# Testirajte health endpointove
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Pratite greške (po defaultu se otvara u pregledniku)
azd monitor --logs
```

**Kriteriji uspjeha:**
- ✅ Sve usluge prikazuju status "Running"
- ✅ Zdravstvene točke vraćaju HTTP 200
- ✅ Nema logova o pogreškama u zadnjih 5 minuta
- ✅ Aplikacija odgovara na testne zahtjeve

## 🏗️ Razumijevanje procesa raspoređivanja

### Faza 1: Kukice prije provisioninga
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

### Faza 2: Provisioning infrastrukture
- Čita infrastrukturne predloške (Bicep/Terraform)
- Kreira ili ažurira Azure resurse
- Konfigurira mrežu i sigurnost
- Postavlja nadzor i bilježenje

### Faza 3: Kukice poslije provisioninga
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
- Izgrađuje aplikacijski kod
- Kreira artefakte za raspoređivanje
- Pakuje za ciljnu platformu (kontejneri, ZIP datoteke itd.)

### Faza 5: Kukice prije raspoređivanja
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

### Faza 6: Raspoređivanje aplikacije
- Raspoređuje pakirane aplikacije na Azure usluge
- Ažurira konfiguracijske postavke
- Pokreće/ponovno pokreće usluge

### Faza 7: Kukice poslije raspoređivanja
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

## 🎛️ Konfiguracija raspoređivanja

### Postavke raspoređivanja specifične za uslugu
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

### Postavke specifične za okruženje
```bash
# Razvojno okruženje
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Okruženje za testiranje
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

## 🔧 Napredni scenariji raspoređivanja

### Aplikacije s više usluga
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

### Blue-Green raspoređivanja
```bash
# Kreirajte plavo okruženje
azd env new production-blue
azd up --environment production-blue

# Testirajte plavo okruženje
./scripts/test-environment.sh production-blue

# Prebacite promet na plavo (ručno ažuriranje DNS/load balancera)
./scripts/switch-traffic.sh production-blue

# Očistite zeleno okruženje
azd env select production-green
azd down --force
```

### Canary raspoređivanja
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

### Etapna raspoređivanja
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

## 🐳 Raspoređivanje kontejnera

### Raspoređivanja Container aplikacija
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

### Optimizacija Dockerfile u više faza
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

## ⚡ Optimizacija izvedbe

### Raspoređivanja specifična za uslugu
```bash
# Deployajte određenu uslugu za bržu iteraciju
azd deploy --service web
azd deploy --service api

# Deployajte sve usluge
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

### Učinkovita raspoređivanja koda
```bash
# Koristite azd deploy (ne azd up) za promjene samo u kodu
# Ovo preskače provisioniranje infrastrukture i mnogo je brže
azd deploy

# Rasporedite određenu uslugu za najbržu iteraciju
azd deploy --service api
```

## 🔍 Praćenje raspoređivanja

### Praćenje u stvarnom vremenu
```bash
# Nadzirite aplikaciju u stvarnom vremenu
azd monitor --live

# Pregledajte zapise aplikacije
azd monitor --logs

# Provjerite status postavljanja
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

### Validacija nakon raspoređivanja
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Provjeri stanje aplikacije
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

## 🔐 Sigurnosne napomene

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

## 🚨 Strategije povrata

### Brzi povrat
```bash
# AZD nema ugrađenu funkciju vraćanja promjena. Preporučeni pristupi:

# Opcija 1: Ponovno postavljanje iz Gita (preporučeno)
git revert HEAD  # Vrati problematični commit
git push
azd deploy

# Opcija 2: Ponovno postavljanje određenog commita
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Povrat infrastrukture
```bash
# Pregledajte promjene infrastrukture prije primjene
azd provision --preview

# Za povrat infrastrukture koristite kontrolu verzija:
git revert HEAD  # Poništite promjene infrastrukture
azd provision    # Primijenite prethodno stanje infrastrukture
```

### Povrat migracije baze podataka
```bash
#!/bin/bash
# skripte/rollback-baza-podataka.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Mjerenje performansi raspoređivanja

### Praćenje performansi raspoređivanja
```bash
# Pogledajte trenutni status implementacije
azd show

# Pratite aplikaciju pomoću Application Insights
azd monitor --overview

# Pogledajte žive metrike
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

# Održavajte paritetu okoline
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Pregledajte promjene infrastrukture prije implementacije
azd provision --preview

# Koristite ARM/Bicep provjeru sintakse
az bicep lint --file infra/main.bicep

# Validirajte Bicep sintaksu
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

### 4. Dokumentiranje i bilježenje
```bash
# Dokumentirajte postupke implementacije
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sljedeći koraci

- [Provisioning Resources](provisioning.md) - Detaljni pregled upravljanja infrastrukturom
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Planirajte svoju strategiju raspoređivanja
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Riješite probleme s raspoređivanjem
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Strategije raspoređivanja spremne za produkciju

## 🎯 Praktične vježbe raspoređivanja

### Vježba 1: Inkrementalni tijek rada raspoređivanja (20 minuta)
**Cilj**: Savladati razliku između potpunih i inkrementalnih raspoređivanja

```bash
# Početna implementacija
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabilježite početno vrijeme implementacije
echo "Full deployment: $(date)" > deployment-log.txt

# Napravite promjenu u kodu
echo "// Updated $(date)" >> src/api/src/server.js

# Implementirajte samo kod (brzo)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Usporedite vremena
cat deployment-log.txt

# Očistite okolinu
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Potpuno raspoređivanje traje 5-15 minuta
- [ ] Raspoređivanje samo koda traje 2-5 minuta
- [ ] Promjene koda su vidljive u raspoređenoj aplikaciji
- [ ] Infrastruktura ostaje nepromijenjena nakon `azd deploy`

**Ishod učenja**: `azd deploy` je 50-70% brži od `azd up` za promjene koda

### Vježba 2: Prilagođene kukice raspoređivanja (30 minuta)
**Cilj**: Implementirati automatizaciju prije i poslije raspoređivanja

```bash
# Kreirajte skriptu za validaciju prije implementacije
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Provjerite prolaze li testovi
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Provjerite ima li nepredanih promjena
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Kreirajte post-implementacijski smoke test
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

# Dodajte hookove u azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testirajte implementaciju s hookovima
azd deploy
```

**Kriteriji uspjeha:**
- [ ] Skripta prije raspoređivanja izvršava se prije samog raspoređivanja
- [ ] Raspoređivanje se prekida ako testovi ne uspiju
- [ ] Post-raspoređivanje smoke test potvrđuje zdravlje
- [ ] Kukice se izvršavaju u ispravnom redoslijedu

### Vježba 3: Strategija raspoređivanja za višestruka okruženja (45 minuta)
**Cilj**: Implementirati etapni tijek rada raspoređivanja (dev → staging → produkcija)

```bash
# Napravi skriptu za implementaciju
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Korak 1: Implementiraj u razvojno okruženje
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 2: Implementiraj u testno okruženje
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

# Pokreni implementaciju u fazama
./deploy-staged.sh
```

**Kriteriji uspjeha:**
- [ ] Dev okruženje se uspješno raspoređuje
- [ ] Staging okruženje uspješno se raspoređuje
- [ ] Za produkciju je potrebna ručna odobrenja
- [ ] Sva okruženja imaju funkcionalne zdravstvene provjere
- [ ] Moguć je povrat ako je potrebno

### Vježba 4: Strategija povrata (25 minuta)
**Cilj**: Implementirati i testirati povrat raspoređivanja koristeći Git

```bash
# Implementirati v1
azd env set APP_VERSION "1.0.0"
azd up

# Spremi v1 hash commit-a
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Implementirati v2 s prekidajućom promjenom
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Otkriti neuspjeh i vratiti promjene
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Vratiti promjene koristeći git
    git revert HEAD --no-edit
    
    # Vratiti okruženje
    azd env set APP_VERSION "1.0.0"
    
    # Ponovno implementirati v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteriji uspjeha:**
- [ ] Moguće je detektirati neuspjehe raspoređivanja
- [ ] Skripta za povrat se automatski izvršava
- [ ] Aplikacija se vraća u ispravno stanje
- [ ] Zdravstvene provjere prođu nakon povrata

## 📊 Praćenje metrika raspoređivanja

### Pratite performanse svog raspoređivanja

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Zabilježi u datoteku
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Koristi to
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Pogledajte povijest rasporeda
cat deployment-metrics.csv

# Izračunajte prosječno vrijeme rasporeda
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni resursi

- [Azure Developer CLI Referenca za raspoređivanje](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Raspoređivanje](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Raspoređivanje](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Raspoređivanje](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna lekcija**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **Sljedeća lekcija**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o odricanju od odgovornosti**:
Ovaj dokument je preveden korištenjem AI prijevodnog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim i autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazumevanja ili pogrešne tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->