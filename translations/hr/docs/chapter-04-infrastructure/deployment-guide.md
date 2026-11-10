# Vodič za implementaciju - Savladavanje AZD implementacija

**Nawigacija poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod & implementacija
- **⬅️ Prethodno poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Sljedeće**: [Provisioning resursa](provisioning.md)
- **🧩 Također u ovom poglavlju**: [Izrada vlastitog predloška](custom-templates.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Višestruka AI rješenja s agentima](../../examples/retail-scenario.md)

## Uvod

> Pregledano na temelju `azd 1.37.2` (studeni 2026). Komande koriste Bash; JSON primjeri zahtijevaju `jq`. Osim eksplicitno inicijaliziranog todo primjera, napredni primjeri su **fragmenti integracije**: dostavite vlastiti izvor, infrastrukturu, testove i skripte. Tijekom ovog pregleda nisu izvršene Azure implementacije.

Ovaj iscrpan vodič pokriva sve što trebate znati o implementaciji aplikacija koristeći Azure Developer CLI, od osnovnih implementacija u jednoj komandi do naprednih produkcijskih scenarija sa prilagođenim hookovima, višestrukim okruženjima i integracijom CI/CD. Savladajte kompletan životni ciklus implementacije s praktičnim primjerima i najboljim praksama.

## Ciljevi učenja

Završetkom ovog vodiča ćete:
- Savladati sve Azure Developer CLI naredbe i tijekove implementacije
- Razumjeti kompletan životni ciklus implementacije od provisioning do nadzora
- Implementirati prilagođene hookove za automatizaciju prije i poslije implementacije
- Konfigurirati višestruka okruženja s parametrima specifičnim za okruženje
- Postaviti napredne strategije implementacije uključujući blue-green i canary implementacije
- Integrirati azd implementacije s CI/CD pipelineovima i DevOps tijekovima rada

## Ishodi učenja

Nakon završetka, moći ćete:
- Samostalno izvršavati i rješavati probleme svih azd tijekova implementacije
- Dizajnirati i implementirati prilagođenu automatizaciju implementacije koristeći hookove
- Konfigurirati produkcijske implementacije s odgovarajućom sigurnošću i nadzorom
- Upravljati složenim scenarijima implementacije s više okruženja
- Optimizirati performanse implementacije i provoditi strategije vraćanja (rollback)
- Integrirati azd implementacije u korporativne DevOps prakse

## Pregled implementacije

Azure Developer CLI pruža nekoliko naredbi za implementaciju:
- `azd up` - Kompletan tijek rada (provision + deploy)
- `azd provision` - Kreiraj/azuriraj samo Azure resurse
- `azd deploy` - Implementiraj samo aplikacijski kod
- `azd package` - Izgradi i zapakiraj aplikacije

## Osnovni tijekovi implementacije

### Kompletna implementacija (azd up)
Najčešći tijek rada za nove projekte:
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

### Implementacija samo infrastrukture
Kada je potrebno samo ažurirati Azure resurse:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Implementacija samo koda
Za brza ažuriranja aplikacije:
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

### ✅ Verifikacija implementacije

Nakon bilo koje implementacije, provjerite uspješnost:

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

**Kriteriji uspjeha:**
- ✅ `azd show` rješava očekivane ciljeve/usluge/URL-ove
- ✅ Zahtjevi na stvarnim rutama aplikacije vraćaju očekivani status i sadržaj
- ✅ Nema dnevnika pogrešaka u zadnjih 5 minuta
- ✅ Aplikacija odgovara na testne zahtjeve

## 🏗️ Razumijevanje procesa implementacije

### Novi u hookovima? Počnite ovdje

**hook** je naredba koju azd automatski izvršava u određenom trenutku procesa implementacije – prije ili poslije provisioninga, i prije ili poslije implementacije vašeg koda. Oni vam omogućuju automatizaciju malih zadataka koji uvijek prate implementaciju: dodavanje podataka u bazu, pokretanje migracija, izrada resursa ili brzi testovi žive aplikacije.

| Hook | Izvršava se… | Uobičajena uporaba |
|------|-----------|-----------------|
| `preprovision` | Prije stvaranja resursa | Validacija preduvjeta, prijava u registar |
| `postprovision` | Nakon stvaranja resursa | Konfiguracija resursa, postavljanje baze podataka |
| `predeploy` | Prije implementacije koda | Izrada front-end resursa, pokretanje jedinčnih testova |
| `postdeploy` | Nakon što je kod aktivan | Pokretanje migracija baze, brzi test endpointa |

Hookovi žive u vašem `azure.yaml`. Evo najsitnijeg mogućeg primjera – samo ispisuje poruku nakon implementacije:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je to – sljedeći put kada pokrenete `azd up`, poruka se automatski ispisuje. Također možete ručno pokrenuti hook bez pune implementacije, što je sjajno za testiranje:

```bash
azd hooks run postdeploy
```

Ispod su faze koje prikazuju stvarne hookove (migracije, testove, validaciju) za svaki korak.

### Faza 1: Hookovi prije provisioninga
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
- Postavlja nadzor i bilježenje događaja

### Faza 3: Hookovi poslije provisioninga
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
- Izrađuje kod aplikacije
- Stvara artefakte za implementaciju
- Pakuje za ciljnu platformu (kontejnere, ZIP datoteke itd.)

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
- Implementira zapakirane aplikacije na Azure usluge
- Ažurira konfiguracijske postavke
- Pokreće/ponovno pokreće usluge

### Faza 7: Hookovi poslije implementacije
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

### Rukovanje pogreškama hookova

Po zadanim postavkama, **ako hook naredba završi s ne-nula kodom izlaza, azd zaustavlja cijelu operaciju.** To je obično poželjno – neuspješna migracija treba zaustaviti implementaciju, a ne poslati pokvarenu aplikaciju. Ali to znači da hookovi moraju biti pažljivo napisani.

**1. Učinite pogreške glasnima i namjernima.** Hook ne uspijeva kada zadnja naredba vrati ne-nula kod izlaza. U skriptama dodajte `set -e` tako da se hook zaustavi na prvoj pogrešnoj naredbi umjesto da tiho nastavi:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Dopustite da hook zakaže bez zaustavljanja azd-a.** Za nekritične korake (neobavezno zagrijavanje cachea, obavijest najboljih napora), postavite `continueOnError: true`. azd bilježi pogrešku ali nastavlja:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testirajte hookove izolirano prije punog pokretanja.** Ne morate pokretati `azd up` da biste ispravljali hook - pokrenite ga samostalno i brzo iterirajte:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Pazite na OS-specifične shellove.** Hook koji koristi `shell: pwsh` treba imati PowerShell instaliran na stroju gdje se izvodi (uključujući CI agente). Koristite `shell: sh` za najširu prenosivost ili ponudite oba `windows` i `posix` varijante:

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

> **Savjet za ispravljanje pogreške:** pokrenite bilo koju azd komandu s `--debug` da vidite točnu liniju hook naredbe i puni izlaz – neprocjenjivo kad hook radi lokalno, a ne uspije u CI.

## 🎛️ Konfiguracija implementacije

### Postavke implementacije specifične za uslugu
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

### Konfiguracije specifične za okruženje

Ovo su lokalne azd vrijednosti samo. Izričito ih mapirajte na infrastrukturu/konfiguraciju izvođenja. `NODE_ENV` je obično `production` za implementiranu Node aplikaciju, uključujući staging implementaciju; koristite zasebnu varijablu specifičnu za aplikaciju da razlikujete faze implementacije.

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

## 🔧 Napredni scenariji implementacije

### Višestruke aplikacije (Multi-Service)
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

**Ilustrativni operativni prikaz:** morate osigurati oba okruženja, sloj za zajedničko usmjeravanje prometa i dvije skripte ispod. azd ne prebacuje promet niti automatski validira spremnost za rollback. Zadržite zeleno dok plavo ne prođe testiranje i rollback više nije potreban.

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

### Canary implementacije
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Podjela prometa pripada konfiguraciji Container Apps (Bicep ili Azure CLI), a ne `azure.yaml` `trafficSplit` svojstvu. Pregled/provision i kasnije implementacije moraju očuvati odabrani način revizije i pravila usmjeravanja.

### Implementacije u fazama
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

## 🐳 Implementacije kontejnera

### Implementacije aplikacija u kontejnerima
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

Konfigurirajte tajne za izvođenje s `configuration.secrets`/`secretRef` (ili Key Vault referencama) i skaliranje s `template.scale` u infrastrukturi Container App-a. Nemojte izmišljati `secrets` ili `scale` svojstva na razini usluge u `azure.yaml`.

### Optimizacija Dockerfile-a u više faza
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

## ⚡ Optimizacija performansi

### Implementacije specifične za uslugu
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Keširanje izgradnje
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standardni tijek rada za Node koristi skripte paketa; uslužni `prepackage` hookovi mogu dodati potrebne korake. Keširanje slojeva Docker-a je odvojeno od definiranja naredbe za izgradnju usluge.

### Efikasne implementacije koda
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Nadzor implementacije

### Nadzor implementacije u stvarnom vremenu
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Provjere zdravlja
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

Vaša aplikacija mora implementirati `/health`; nije automatski osigurano od strane azd. Nema generičkog `azure.yaml` `healthCheck` svojstva usluge.

### Validacija nakon implementacije
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

## 🔐 Sigurnosne napomene

### Upravljanje tajnama
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` nije valjan. Uobičajene vrijednosti okoline su lokalni običan tekst; ne pretpostavljajte da naredbe za čitanje to brišu. Naredbe gore spremaju Key Vault reference, ali vaša infrastruktura/aplikacija mora i dalje konzumirati tajne i dati pristup identitetu izvođenja.

### Sigurnost mreže
Deklarirajte i konzumirajte mrežne parametre u Bicep-u i mapirajte ih u `infra/main.parameters.json`. Nema generičkog `infra.parameters` overlaya u `azure.yaml`. Primjeri dokumentacije raspona `203.0.113.0/24` i `198.51.100.0/24` nisu stvarne uredske/VPN mreže; zamijenite ih ovlaštenim mrežnim rasponima.

### Upravljanje identitetom i pristupom
Omogućite `identity` Container App-a u Bicep-u i dodijelite potrebnu ulogu na Key Vault data-plane u rasponu ključa. Konfigurirajte imenovane tajne podržane od Key Vaulta i reference za izvođenje u tom resursu; `identity` i `keyVault` nisu generička Azd svojstva usluge. Pogledajte [Autentikaciju & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategije vraćanja (Rollback)

### Brzi rollback
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

### Rollback infrastrukture
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

## 📊 Metrike implementacije

### Praćenje performansi implementacije
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validacija infrastrukture
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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

### 4. Dokumentacija i bilježenje
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sljedeći koraci

- [Provisioning resursa](provisioning.md) - Dubinska analiza upravljanja infrastrukturom
- [Planiranje prije implementacije](../chapter-06-pre-deployment/capacity-planning.md) - Planirajte strategiju implementacije
- [Česti problemi](../chapter-07-troubleshooting/common-issues.md) - Riješite probleme implementacije
- [Najbolje prakse](../chapter-07-troubleshooting/debugging.md) - Strategije implementacije spremne za produkciju

## 🎯 Praktične vježbe implementacije

### Vježba 1: Inkrementalni tijek implementacije (20 minuta)
**Cilj**: Savladati razliku između pune i inkrementalne implementacije

**Početna točka:** Bash, Node.js 22, Git, azd prijava i pretplata na Azure s ovlastima za implementaciju. Pokretati u novom direktoriju; očekujte naplative App Service/Cosmos DB resurse. Vrijeme ovisi o regiji i predlošku.

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

**Kriteriji uspjeha:**
- [ ] Zabilježite proteklo vrijeme za obje naredbe (nema zajamčenog trajanja)
- [ ] Obje naredbe završe uspješno
- [ ] API ostaje funkcionalan; izmjena samo komentara nije vidljiva promjena u korisničkom sučelju
- [ ] Infrastruktura nepromijenjena nakon `azd deploy`

**Ishod učenja**: `azd deploy` preskače provisioning infrastrukture. Usporedite izmjerena vremena umjesto da pretpostavljate fiksni postotak ubrzanja.

### Vježba 2: Prilagođeni hookovi implementacije (30 minuta)
**Cilj**: Implementirati automatizaciju prije i poslije implementacije

**Početna točka:** gore inicijalizirani `deployment-practice` projekt. Ako ste ga očistili, ponovno pokrenite `azd up` prije testiranja implementacije samo koda. Validacija ispod koristi stvarni build skript API-ja, ne nepostojeću root `test:unit` skriptu. Predložene API testove trebaju konfigurirani pristup bazi podataka; nisu izolirani jedinčni testovi.

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

**Kriteriji uspjeha:**
- [ ] Skripta prije implementacije se izvršava prije deploya
- [ ] Implementacija se prekida ako build validacija ne uspije
- [ ] Brzi test poslije deploya validira zdravlje
- [ ] Hookovi se izvršavaju u ispravnom redoslijedu

### Vježba 3: Strategija implementacije u više okruženja (45 minuta)
**Cilj**: Implementirati tijek rada implementacije po fazama (dev → staging → produkcija)

**Početna točka:** isti inicijalizirani todo projekt s `jq`. Kreirajte dolje navedena okruženja s pravi vrijednostima pretplate/ljudske lokacije (ili postavite `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` u svakom) **prije** pokretanja workflowa bez prompta. Namjerno ne uspijeva umjesto da izmišlja nedostajuće vrijednosti. Koristite samo jednokratna okruženja za obuku, ne stvarnu produkcijsku pretplatu.

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

**Kriteriji uspjeha:**
- [ ] Dev okruženje se uspješno postavlja
- [ ] Staging okruženje se uspješno postavlja
- [ ] Za produkciju je potrebna ručna potvrda
- [ ] Sva okruženja imaju funkcionalne health checkove
- [ ] Moguće je vratiti na prethodnu verziju ako je potrebno

### Vježba 4: Strategija vraćanja (25 minuta)
**Cilj**: Implementirati i testirati rollback deploya koristeći Git

**Početna točka:** izolirana obuka uz checkout todo predloška sa svim osnovnim izvorima pod kontrolom, čistim Git working tree i konfiguriranim jednokratnim okruženjem. Nikad nemojte namjerno unositi greške u pravi produkcijski projekt. `APP_VERSION` ispod je samo evidencija osim ako je eksplicitno ne povežete u aplikaciju.

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

**Kriteriji uspjeha:**
- [ ] Moguće je detektirati neuspjele deploye
- [ ] Rollback skripta se automatski izvršava
- [ ] Aplikacija se vraća u funkcionalno stanje
- [ ] Health checkovi prolaze nakon rollbacka

## 📊 Praćenje Metričkih Podataka Deploya

### Pratite izvedbu vašeg deploya

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

**Analizirajte svoje metrike:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni Resursi

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna Lekcija**: [Vaš Prvi Projekt](../chapter-01-foundation/first-project.md)
- **Sljedeća Lekcija**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->