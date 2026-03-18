# Vodič za implementaciju - Ovladavanje AZD implementacijama

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod & implementacija
- **⬅️ Prethodno poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Sljedeće**: [Zadavanje resursa](provisioning.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: AI rješenja s više agenata](../../examples/retail-scenario.md)

## Uvod

Ovaj sveobuhvatni vodič pokriva sve što trebate znati o implementaciji aplikacija koristeći Azure Developer CLI, od osnovnih implementacija jednim naredbom do naprednih produkcijskih scenarija s prilagođenim hooksima, višestrukim okruženjima i integracijom CI/CD-a. Ovladajte kompletnim životnim ciklusom implementacije uz praktične primjere i najbolje prakse.

## Ciljevi učenja

Nakon dovršetka ovog vodiča, moći ćete:
- Ovladati svim azd naredbama i radnim tokovima vezanim uz implementaciju
- Razumjeti cjelokupni životni ciklus implementacije od zadavanja resursa do nadzora
- Implementirati prilagođene hooks za automatizaciju prije i poslije deploya
- Konfigurirati višestruka okruženja s parametrima specifičnim za okoliš
- Postaviti napredne strategije implementacije uključujući blue-green i canary implementacije
- Integrirati azd implementacije s CI/CD cijevima i DevOps radnim tokovima

## Ishodi učenja

Po dovršetku, moći ćete:
- Samostalno izvoditi i rješavati probleme svih azd radnih tokova implementacije
- Dizajnirati i implementirati prilagođenu automatizaciju implementacije koristeći hooks
- Konfigurirati produkcijske implementacije s prikladnom sigurnošću i nadzorom
- Upravljati složenim scenarijima implementacije u više okruženja
- Optimizirati izvedbu implementacije i implementirati strategije povratka (rollback)
- Integrirati azd implementacije u korporativne DevOps prakse

## Pregled implementacije

Azure Developer CLI pruža nekoliko naredbi za implementaciju:
- `azd up` - Kompletan radni tok (zadavanje + implementacija)
- `azd provision` - Stvaranje/azuriranje Azure resursa samo
- `azd deploy` - Implementacija samo aplikacijskog koda
- `azd package` - Izgradnja i pakiranje aplikacija

## Osnovni radni tokovi implementacije

### Kompletna implementacija (azd up)
Najčešći radni tok za nove projekte:
```bash
# Postavi sve iz početka
azd up

# Postavi sa specifičnim okruženjem
azd up --environment production

# Postavi sa prilagođenim parametrima
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Implementacija samo infrastrukture
Kad trebate samo ažurirati Azure resurse:
```bash
# Nabava/azuriranje infrastrukture
azd provision

# Nabava sa suhim pokusajem za pregled promjena
azd provision --preview

# Nabava specificnih usluga
azd provision --service database
```

### Implementacija samo koda
Za brza ažuriranja aplikacije:
```bash
# Postavite sve usluge
azd deploy

# Očekivani izlaz:
# Postavljanje usluga (azd deploy)
# - web: Postavljanje... Završeno
# - api: Postavljanje... Završeno
# USPJEH: Vaša implementacija završila je za 2 minute i 15 sekundi

# Postavite određenu uslugu
azd deploy --service web
azd deploy --service api

# Postavljanje s prilagođenim argumentima izgradnje
azd deploy --service api --build-arg NODE_ENV=production

# Provjerite implementaciju
azd show --output json | jq '.services'
```

### ✅ Provjera implementacije

Nakon svake implementacije, provjerite uspjeh:

```bash
# Provjerite rade li sve usluge
azd show

# Testirajte zdravstvene krajnje točke
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Pratite pogreške (po defaultu se otvara u pregledniku)
azd monitor --logs
```

**Kriteriji uspjeha:**
- ✅ Sve usluge prikazuju status "Running"
- ✅ Health endpointi vraćaju HTTP 200
- ✅ Nema zapisnika pogrešaka u zadnjih 5 minuta
- ✅ Aplikacija odgovara na testne zahtjeve

## 🏗️ Razumijevanje procesa implementacije

### Faza 1: Pre-Provision hooksi
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

### Faza 2: Zadavanje infrastrukture
- Čita predloške infrastrukture (Bicep/Terraform)
- Stvara ili ažurira Azure resurse
- Konfigurira mrežu i sigurnost
- Postavlja nadzor i zapisivanje

### Faza 3: Post-Provision hooksi
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
- Stvara artefakte za implementaciju
- Pakira za ciljnu platformu (kontejnere, ZIP datoteke itd.)

### Faza 5: Pre-Deploy hooksi
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
- Implementira pakirane aplikacije u Azure usluge
- Ažurira konfiguracijske postavke
- Pokreće/ponovno pokreće usluge

### Faza 7: Post-Deploy hooksi
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

### Postavke implementacije specifične za uslugu
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
# Okruženje za razvoj
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Okruženje za testiranje
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Okruženje za proizvodnju
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Napredni scenariji implementacije

### Višestruke usluge u aplikacijama
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

### Blue-green implementacije
```bash
# Kreiraj plavo okruženje
azd env new production-blue
azd up --environment production-blue

# Testiraj plavo okruženje
./scripts/test-environment.sh production-blue

# Preusmjeri promet na plavo (ručna DNS/podešavanja balansiranje opterećenja)
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

### Implementacije kontejnerskih aplikacija
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

### Optimizacija višefaznog Dockerfile-a
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

### Implementacije specifične za uslugu
```bash
# Postavite specifičnu uslugu za bržu iteraciju
azd deploy --service web
azd deploy --service api

# Postavite sve usluge
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

### Efikasne implementacije koda
```bash
# Koristite azd deploy (ne azd up) za promjene samo u kodu
# Ovo preskače postavljanje infrastrukture i mnogo je brže
azd deploy

# Implementirajte određenu uslugu za najbržu iteraciju
azd deploy --service api
```

## 🔍 Nadzor implementacije

### Nadzor implementacije u stvarnom vremenu
```bash
# Nadzirite aplikaciju u stvarnom vremenu
azd monitor --live

# Pregledajte zapise aplikacije
azd monitor --logs

# Provjerite status implementacije
azd show
```

### Health checkovi
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

## 🔐 Sigurnosni aspekti

### Upravljanje tajnama (secrets)
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

### Upravljanje identitetima i pristupom
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

## 🚨 Strategije povratka (rollback)

### Brzi povratak
```bash
# AZD nema ugrađenu funkciju poništavanja. Preporučeni pristupi:

# Opcija 1: Ponovno postavljanje iz Gita (preporučeno)
git revert HEAD  # Vratite problematični commit
git push
azd deploy

# Opcija 2: Ponovno postavljanje određenog commita
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Povratak infrastrukture
```bash
# Pregledajte promjene infrastrukture prije primjene
azd provision --preview

# Za vraćanje infrastrukture upotrijebite kontrolu verzija:
git revert HEAD  # Poništi promjene infrastrukture
azd provision    # Primijeni prethodno stanje infrastrukture
```

### Povratak migracije baze podataka
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrike implementacije

### Praćenje izvedbe implementacije
```bash
# Pogledajte trenutni status implementacije
azd show

# Pratite aplikaciju pomoću Application Insights
azd monitor --overview

# Pogledajte uživo metrike
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

### 1. Dosljednost okruženja
```bash
# Koristite dosljedno imenovanje
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Održavajte podudarnost okoline
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Pregledajte promjene infrastrukture prije implementacije
azd provision --preview

# Koristite ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Provjerite valjanost Bicep sintakse
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

### 4. Dokumentacija i zapisivanje
```bash
# Dokumentirajte postupke implementacije
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sljedeći koraci

- [Zadavanje resursa](provisioning.md) - Detaljni prikaz upravljanja infrastrukturom
- [Planiranje prije implementacije](../chapter-06-pre-deployment/capacity-planning.md) - Planirajte svoju strategiju implementacije
- [Uobičajeni problemi](../chapter-07-troubleshooting/common-issues.md) - Rješavanje problema s implementacijom
- [Najbolje prakse](../chapter-07-troubleshooting/debugging.md) - Strategije implementacije spremne za produkciju

## 🎯 Praktične vježbe implementacije

### Vježba 1: Inkrementalni radni tok implementacije (20 minuta)
**Cilj**: Ovladati razlikom između pune i inkrementalne implementacije

```bash
# Početno postavljanje
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zabilježi vrijeme početnog postavljanja
echo "Full deployment: $(date)" > deployment-log.txt

# Napravi promjenu u kodu
echo "// Updated $(date)" >> src/api/src/server.js

# Postavi samo kod (brzo)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Usporedi vremena
cat deployment-log.txt

# Očisti nakon sebe
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Puna implementacija traje 5-15 minuta
- [ ] Implementacija samo koda traje 2-5 minuta
- [ ] Promjene koda su vidljive u implementiranoj aplikaciji
- [ ] Infrastruktura je nepromijenjena nakon `azd deploy`

**Ishod učenja**: `azd deploy` je 50-70% brži od `azd up` za promjene koda

### Vježba 2: Prilagođeni hooks za implementaciju (30 minuta)
**Cilj**: Implementirati automatizaciju prije i poslije deploya

```bash
# Kreiraj skriptu za validaciju prije implementacije
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Provjeri prolazak testova
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Provjeri ima li nepohranjenih promjena
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Kreiraj test funkcionalnosti nakon implementacije
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
- [ ] Skripta prije implementacije pokreće se prije deploya
- [ ] Implementacija se prekida ako testovi ne prođu
- [ ] Post-deploy smoke test potvrđuje zdravlje sustava
- [ ] Hooks se izvršavaju u ispravnom redoslijedu

### Vježba 3: Strategija implementacije u više okruženja (45 minuta)
**Cilj**: Implementirati radni tok fazne implementacije (dev → staging → produkcija)

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

# Korak 3: Ručna odobrenja za produkciju
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
- [ ] Implementacija u dev okruženju uspješna
- [ ] Implementacija u staging okruženju uspješna
- [ ] Za produkciju je potrebna ručna potvrda
- [ ] Sva okruženja imaju funkcionalne health checkove
- [ ] Mogućnost povratka ako je potrebno

### Vježba 4: Strategija povratka (rollback) (25 minuta)
**Cilj**: Implementirati i testirati povratak implementacije koristeći Git

```bash
# Implementiraj v1
azd env set APP_VERSION "1.0.0"
azd up

# Spremi hash v1 commita
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Implementiraj v2 s breaking promjenom
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Otkrivanje pogreške i povratak na prethodnu verziju
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Povratak na prethodnu verziju koristeći git
    git revert HEAD --no-edit
    
    # Povratak okruženja
    azd env set APP_VERSION "1.0.0"
    
    # Ponovno implementiraj v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteriji uspjeha:**
- [ ] Moguće je detektirati neuspjehe implementacije
- [ ] Skripta za rollback se automatski izvršava
- [ ] Aplikacija se vraća u radno stanje
- [ ] Health checkovi prolaze nakon rollbacka

## 📊 Praćenje metrika implementacije

### Pratite izvedbu svoje implementacije

```bash
# Napravite skriptu za metrike implementacije
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

# Zapis u datoteku
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Koristite je
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Pogledajte povijest implementacije
cat deployment-metrics.csv

# Izračunajte prosječno vrijeme implementacije
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni resursi

- [Reference za Azure Developer CLI implementaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementacija Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementacija Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementacija Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna lekcija**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **Sljedeća lekcija**: [Zadavanje resursa](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj je dokument preveden koristeći AI servis za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije proizašle iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->