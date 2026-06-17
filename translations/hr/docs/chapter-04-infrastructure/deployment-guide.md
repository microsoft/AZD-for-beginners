# Vodič za implementaciju - Usavršavanje AZD implementacija

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod i implementacija
- **⬅️ Prethodno poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Sljedeće**: [Provisioning Resources](provisioning.md)
- **🧩 Također u ovom poglavlju**: [Izrada vlastitog predloška](custom-templates.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Multi-agentna AI rješenja](../../examples/retail-scenario.md)

## Uvod

Ovaj opsežni vodič obuhvaća sve što trebate znati o implementaciji aplikacija koristeći Azure Developer CLI, od osnovnih implementacija jednim naredbom do naprednih produkcijskih scenarija s prilagođenim hookovima, višestrukim okruženjima i integracijom CI/CD-a. Ovladat ćete kompletnim životnim ciklusom implementacije uz praktične primjere i najbolje prakse.

## Ciljevi učenja

Dovršetkom ovog vodiča ćete:
- Ovladati svim naredbama i tijekovima rada za implementaciju u Azure Developer CLI
- Razumjeti kompletan životni ciklus implementacije od provisioning do nadzora
- Implementirati prilagođene hookove za automatizaciju prije i poslije implementacije
- Konfigurirati višestruka okruženja sa specifičnim parametrima za okruženje
- Postaviti napredne strategije implementacije uključujući blue-green i canary implementacije
- Integrirati azd implementacije s CI/CD cjevovodima i DevOps tijekovima rada

## Ishodi učenja

Po završetku, moći ćete:
- Neovisno izvršavati i rješavati probleme svih azd tijekova implementacije
- Dizajnirati i implementirati prilagođenu automatizaciju implementacije pomoću hookova
- Konfigurirati produkcijske implementacije s odgovarajućom sigurnošću i nadzorom
- Upravljati složenim scenarijima implementacije više okruženja
- Optimizirati performanse implementacije i provesti strategije povratka (rollback)
- Integrirati azd implementacije u korporativne DevOps prakse

## Pregled implementacije

Azure Developer CLI pruža nekoliko naredbi za implementaciju:
- `azd up` - Potpuni tijek rada (provision + implementacija)
- `azd provision` - Samo kreiranje/azuriranje Azure resursa
- `azd deploy` - Samo implementacija aplikacijskog koda
- `azd package` - Izrada i pakiranje aplikacija

## Osnovni tijekovi implementacije

### Potpuna implementacija (azd up)
Najčešći tijek rada za nove projekte:
```bash
# Rasporedi sve od početka
azd up

# Rasporedi s određenim okruženjem
azd up --environment production

# Rasporedi s prilagođenim parametrima
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Samo implementacija infrastrukture
Kad trebate samo ažurirati Azure resurse:
```bash
# Postavljanje/azuriranje infrastrukture
azd provision

# Postavljanje s probnim radom za pregled promjena
azd provision --preview

# Postavljanje specificnih usluga
azd provision --service database
```

### Samo implementacija koda
Za brza ažuriranja aplikacije:
```bash
# Postavite sve usluge
azd deploy

# Očekivani rezultat:
# Postavljanje usluga (azd deploy)
# - web: Postavljanje... Gotovo
# - api: Postavljanje... Gotovo
# USPJEH: Vaša implementacija završila je za 2 minute i 15 sekundi

# Postavi određenu uslugu
azd deploy --service web
azd deploy --service api

# Postavi s prilagođenim argumentima gradnje
azd deploy --service api --build-arg NODE_ENV=production

# Provjerite implementaciju
azd show --output json | jq '.services'
```

### ✅ Verifikacija implementacije

Nakon svake implementacije, provjerite uspješnost:

```bash
# Provjerite rade li svi servisi
azd show

# Testirajte krajnje točke zdravlja
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Pratite pogreške (otvara se u pregledniku prema zadanim postavkama)
azd monitor --logs
```

**Kriteriji uspjeha:**
- ✅ Svi servisi prikazuju status "Radi"
- ✅ Health endpointi vraćaju HTTP 200
- ✅ Nema zapisa grešaka u posljednjih 5 minuta
- ✅ Aplikacija reagira na testne zahtjeve

## 🏗️ Razumijevanje procesa implementacije

### Novi u hookovima? Započnite ovdje

**Hook** je naredba koju azd automatski izvršava u određenom trenutku procesa implementacije — prije ili poslije provisioninga, i prije ili poslije implementacije koda. Omogućuju automatizaciju malih zadataka koji uvijek prate implementaciju: unošenje podataka u bazu, pokretanje migracija, izrada resursa, ili smoke testiranje aplikacije uživo.

| Hook | Izvodi se... | Uobičajena namjena |
|------|--------------|--------------------|
| `preprovision` | Prije kreiranja resursa | Provjerava preduvjete, prijava u registar |
| `postprovision` | Nakon što resursi postoje | Konfigurira resurse, postavlja bazu podataka |
| `predeploy` | Prije implementacije koda | Izgradi front-end resurse, pokreni unit testove |
| `postdeploy` | Nakon što je kod uživo | Pokreće migracije baze, smoke testira endpoint |

Hookovi se nalaze u vašem `azure.yaml` fileu. Evo najmanjeg mogućeg primjera — samo ispisuje poruku nakon implementacije:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je to — sljedeći put kad pokrenete `azd up`, poruka će se automatski ispisati. Hook možete i pokrenuti zasebno, bez kompletne implementacije, što je korisno za testiranje:

```bash
azd hooks run postdeploy
```

Faze ispod prikazuju stvarne hookove (migracije, testove, validaciju) za svaku fazu.

### Faza 1: Pre-Provision hookovi
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
- Postavlja nadzor i logiranje

### Faza 3: Post-Provision hookovi
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
- Kreira artefakte za implementaciju
- Pakira za ciljnu platformu (kontejnere, ZIP datoteke, itd.)

### Faza 5: Pre-Deploy hookovi
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
- Implementira pakirane aplikacije na Azure servise
- Ažurira konfiguracijske postavke
- Pokreće/ponovno pokreće servise

### Faza 7: Post-Deploy hookovi
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

### Rukovanje greškama u hookovima

Po defaultu, **ako hook naredba završi s kodom različitim od nula, azd prekida cijelu operaciju.** Ovo je obično željeno — neuspjela migracija treba zaustaviti implementaciju, a ne poslati neispravnu aplikaciju. No, to znači da hookovi moraju biti napisani pažljivo.

**1. Neka pogreške budu glasne i namjerne.** Hook ne uspijeva kada njegova zadnja naredba vrati kod različit od nule. U shell skriptama dodajte `set -e` tako da hook odmah prestane na prvoj neuspješnoj naredbi umjesto da nastavi tiho:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Dozvolite hooku da neuspije bez zaustavljanja azd-a.** Za nekritične korake (opcionalno zagrijavanje cachea, best-effort notifikacija), postavite `continueOnError: true`. azd zabilježi neuspjeh ali nastavi:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testirajte hookove izolirano prije pune izvedbe.** Ne morate pokretati `azd up` za debug hooks — pokrenite ih pojedinačno i brzo iterirajte:

```bash
azd hooks run predeploy          # pokreće samo predeploy hook
azd hooks run postdeploy --service api
```

**4. Pazite na OS-specifične shellove.** Hook koji koristi `shell: pwsh` treba da je PowerShell instaliran na stroju koji ga pokreće (uključujući CI agente). Koristite `shell: sh` za najširu prenosivost ili pružite obje varijante `windows` i `posix`:

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

> **Savjet za debugiranje:** pokrenite bilo koju azd naredbu s `--debug` da vidite točan naredbeni redak hooka i njegov kompletan izlaz — neprocjenjivo kada hook radi lokalno, ali ne uspijeva u CI.

## 🎛️ Konfiguracija implementacije

### Postavke implementacije po servisu
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

### Više-servisne aplikacije
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

# Preusmjeri promet na plavo (ručna promjena DNS/load balancera)
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

### Faze implementacije
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

### Implementacije Container App
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

### Optimizacija multi-faznog Dockerfilea
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

### Implementacije po servisu
```bash
# Implementirajte određenu uslugu za bržu iteraciju
azd deploy --service web
azd deploy --service api

# Implementirajte sve usluge
azd deploy
```

### Keširanje izrade
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

# Deployajte specifičnu uslugu za najbržu iteraciju
azd deploy --service api
```

## 🔍 Nadzor implementacije

### Nadzor implementacije u stvarnom vremenu
```bash
# Pratite aplikaciju u stvarnom vremenu
azd monitor --live

# Pregledajte dnevnike aplikacije
azd monitor --logs

# Provjerite status implementacije
azd show
```

### Provjere zdravlja (Health Checks)
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

## 🔐 Sigurnosni aspekti

### Upravljanje tajnama (Secrets)
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

## 🚨 Strategije povratka (Rollback)

### Brzi rollback
```bash
# AZD nema ugrađeni rollback. Preporučeni pristupi:

# Opcija 1: Ponovna implementacija iz Gita (preporučeno)
git revert HEAD  # Vratite problematični commit
git push
azd deploy

# Opcija 2: Ponovna implementacija specifičnog commita
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Povratak infrastrukture
```bash
# Pregledajte promjene infrastrukture prije primjene
azd provision --preview

# Za povrat infrastrukture, koristite kontrolu verzija:
git revert HEAD  # Poništite promjene infrastrukture
azd provision    # Primijenite prethodno stanje infrastrukture
```

### Povratak migracija baze podataka
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Mjerenje implementacije

### Praćenje performansi implementacije
```bash
# Pregledajte trenutni status implementacije
azd show

# Pratite aplikaciju pomoću Application Insights
azd monitor --overview

# Pregledajte žive metrike
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

# Održavajte usklađenost okoline
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Pregledajte promjene infrastrukture prije implementacije
azd provision --preview

# Koristite ARM/Bicep provjeru koda
az bicep lint --file infra/main.bicep

# Provjerite ispravnost Bicep sintakse
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

### 4. Dokumentacija i logiranje
```bash
# Dokumentirajte postupke implementacije
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sljedeći koraci

- [Provisioning Resources](provisioning.md) - Detaljan pregled upravljanja infrastrukturom
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Planirajte svoju strategiju implementacije
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Rješavanje problema s implementacijom
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Produkcijski spremne strategije implementacije

## 🎯 Vježbe praktične implementacije

### Vježba 1: Inkrementalni tijek implementacije (20 minuta)
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

# Očisti
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Puna implementacija traje 5-15 minuta
- [ ] Samo implementacija koda traje 2-5 minuta
- [ ] Promjene koda su vidljive u implementiranoj aplikaciji
- [ ] Infrastruktura ostaje nepromijenjena nakon `azd deploy`

**Ishod učenja**: `azd deploy` je 50-70% brži od `azd up` za promjene koda

### Vježba 2: Prilagođeni hookovi implementacije (30 minuta)
**Cilj**: Implementirati automatizaciju prije i poslije implementacije

```bash
# Kreiraj skriptu za validaciju prije implementacije
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Provjeri prolaze li testovi
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Provjeri postoji li nekomitirane promjene
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Kreiraj post-implementacijski "smoke" test
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
- [ ] Skripta prije implementacije se izvršava prije implementacije
- [ ] Implementacija se prekida ako testi ne uspiju
- [ ] Post-implementacijski smoke test potvrđuje zdravlje
- [ ] Hookovi se izvršavaju u ispravnom redoslijedu

### Vježba 3: Strategija implementacije za više okruženja (45 minuta)
**Cilj**: Implementirati višestepeni tijek implementacije (dev → staging → produkcija)

```bash
# Napravite skriptu za implementaciju
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Korak 1: Implementirajte na razvojno okruženje
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Korak 2: Implementirajte na pripremno okruženje
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

# Napravite okruženja
azd env new dev
azd env new staging
azd env new production

# Pokrenite implementaciju u fazama
./deploy-staged.sh
```

**Kriteriji uspjeha:**
- [ ] Dev okruženje se uspješno implementira
- [ ] Staging okruženje se uspješno implementira
- [ ] Potrebno je ručno odobrenje za produkciju
- [ ] Sva okruženja imaju funkcionalne health checkove
- [ ] Moguće je vratiti promjene ako je potrebno

### Vježba 4: Strategija povratka (25 minuta)
**Cilj**: Implementirati i testirati rollback implementacije koristeći Git

```bash
# Postavi v1
azd env set APP_VERSION "1.0.0"
azd up

# Spremi v1 hash commita
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Postavi v2 s promjenom koja prekida kompatibilnost
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detektiraj grešku i izvrši povratak
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Povratak koristeći git
    git revert HEAD --no-edit
    
    # Povrati okruženje
    azd env set APP_VERSION "1.0.0"
    
    # Ponovno postavi v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteriji uspjeha:**
- [ ] Moguće je detektirati neuspjehe implementacije
- [ ] Rollback skripta se automatski izvršava
- [ ] Aplikacija se vraća u funkcionalno stanje
- [ ] Health checkovi prođu nakon rollbacka

## 📊 Praćenje metrika implementacije

### Pratite performanse svoje implementacije

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Zabilježi u datoteku
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Koristite ga
./track-deployment.sh
```

**Analizirajte svoje metrike:**
```bash
# Prikaz povijesti implementacije
cat deployment-metrics.csv

# Izračunavanje prosječnog vremena implementacije
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni resursi

- [Azure Developer CLI dokumentacija za implementaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementacija Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementacija Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementacija Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna lekcija**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **Sljedeća lekcija**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->