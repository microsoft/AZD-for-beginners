# Vodnik za uvedbo - obvladovanje uvajanj z AZD

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda in uvedba
- **⬅️ Prejšnje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)
- **➡️ Naslednje**: [Provisioning Resources](provisioning.md)
- **🧩 Prav tako v tem poglavju**: [Avtorske lastne predloge](custom-templates.md)
- **🚀 Naslednje poglavje**: [Poglavje 5: Večagentne AI rešitve](../../examples/retail-scenario.md)

## Uvod

> Pregledano v skladu z `azd 1.37.2` (november 2026). Ukazi uporabljajo Bash; primeri v JSON zahtevajo `jq`. Razen izrecno inicializirane vaje "todo" so napredni primeri **integracijski fragmenti**: zagotovite lastni vir, infrastrukturo, teste in skripte. Nobena uvedba Azure ni bila izvedena v tem pregledu.

Ta obsežen vodič zajema vse, kar morate vedeti o uvajanju aplikacij z uporabo Azure Developer CLI, od osnovnih enostavnih ukazov do naprednih proizvodnih scenarijev s prilagojenimi kljukami, več okolji in integracijo CI/CD. Obvladajte celoten cikel uvajanja z uporabo praktičnih primerov in najboljših praks.

## Cilji učenja

Z zaključkom tega vodiča boste:
- Obvladali vse ukaze in delovne tokove uvajanja Azure Developer CLI
- Razumeli celoten cikel uvajanja od upravljanja do nadzora
- Implementirali prilagojene kljuke za avtomatizacijo pred in po uvedbi
- Konfigurirali več okolij s parametri specifičnimi za okolje
- Nastavili napredne strategije uvajanja, vključno z blue-green in kanarskimi uvajanji
- Integrirali uvajanja azd z CI/CD cevovodi in DevOps delovnimi procesi

## Rezultati učenja

Po zaključku boste sposobni:
- Neodvisno izvrševati in odpravljati napake vseh delovnih tokov uvajanja azd
- Načrtovati in implementirati avtomatizacijo uvajanja s kljukami
- Konfigurirati proizvodna uvajanja z ustrezno varnostjo in spremljanjem
- Upravljati kompleksne scenarije uvajanja z več okolji
- Optimirati zmogljivost uvajanja in izvajati strategije povrnitve
- Integrirati uvajanja azd v korporativne DevOps prakse

## Pregled uvajanja

Azure Developer CLI zagotavlja več ukazov za uvajanje:
- `azd up` - Celoten delovni tok (provision + deploy)
- `azd provision` - Ustvarjanje/posodobitev samo Azure virov
- `azd deploy` - Uvajanje samo kode aplikacije
- `azd package` - Gradnja in pakiranje aplikacij

## Osnovni delovni tok uvajanja

### Celovito uvajanje (azd up)
Najpogostejši delovni tok za nove projekte:
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

### Uvajanje le infrastrukture
Ko potrebujete posodobiti samo Azure vire:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Uvajanje samo kode
Za hitre posodobitve aplikacije:
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

### ✅ Preverjanje uvajanja

Po vsakem uvajanju preverite uspešnost:

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

**Kriteriji uspeha:**
- ✅ `azd show` rešuje pričakovane cilje/storitve URL
- ✅ Zahteve na dejanske poti aplikacije vračajo pričakovani status in telo
- ✅ V zadnjih 5 minutah brez napak v dnevnikih
- ✅ Aplikacija odgovarja na testne zahteve

## 🏗️ Razumevanje procesa uvajanja

### Nov v kljukah? Začni tukaj

**Kljuka** je ukaz, ki ga azd samodejno izvaja ob določenem trenutku procesa uvedbe—pred ali po upravljanju virov ter pred ali po uvajanju vaše kode. Omogočajo avtomatizacijo majhnih opravil, ki so vedno ob uvajanju: polnjenje baze, izvajanje migracij, gradnja sredstev ali hitri testi žive aplikacije.

| Kljuka | Izvaja se… | Pogosta uporaba |
|------|------------|----------------|
| `preprovision` | Pred kreiranjem virov | Preveri predpogoje, prijava v register |
| `postprovision` | Po obstoju virov | Konfiguracija virov, nastavitev baze |
| `predeploy` | Pred uvedbo kode | Gradnja front-end sredstev, izvajanje enotnih testov |
| `postdeploy` | Po objavi kode | Izvajanje migracij baze, hitri testi končne točke |

Kljuke živijo v vaši `azure.yaml`. Tukaj je najmanjši možen primer—le izpiše sporočilo po uvajanju:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je vse—ob naslednjem zagonu ukaza `azd up` se sporočilo izpiše samodejno. Kljuko lahko tudi zaženete samostojno, brez popolnega uvajanja, kar je odlično za testiranje:

```bash
azd hooks run postdeploy
```

Spodnje faze prikazujejo dejanske kljuke (migracije, testi, preverjanje) za vsak korak.

### Faza 1: Kljuke pred upravljanjem virov
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

### Faza 2: Upravljanje infrastrukture
- Bere predloge infrastrukture (Bicep/Terraform)
- Ustvarja ali posodablja Azure vire
- Konfigurira omrežje in varnost
- Nastavi spremljanje in beleženje

### Faza 3: Kljuke po upravljanju virov
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
- Ustvari uvajalne artefakte
- Pakira za ciljno platformo (kontejnerji, ZIP datoteke itd.)

### Faza 5: Kljuke pred uvedbo
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
- Uvaja pakirane aplikacije v Azure storitve
- Posodablja nastavitve konfiguracije
- Zažene/ponovno zažene storitve

### Faza 7: Kljuke po uvedbi
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

### Ravnanje z napakami kljuk

Privzeto **če ukaz kljuke konča z nenicelno kodo, azd prekine celotno operacijo.** To ponavadi želite—neuspešna migracija naj prekine uvajanje, ne da bi poslali polomljeno aplikacijo. Vendar to pomeni, da je treba kljuke skrbno napisati.

**1. Neuspehe naredite glasne in namerne.** Kljuka ne uspe, ko njen zadnji ukaz vrne nenicelno kodo izhoda. V lupinskih skriptah dodajte `set -e`, da se kljuka ustavi ob prvem neuspelem ukazu, namesto da tiho nadaljuje:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Dovolite, da kljuka ne uspe brez ustavitve azd.** Za nekritične korake (neobvezno ogrevanje predpomnilnika, obvestilo po najboljših močeh) nastavite `continueOnError: true`. azd zabeleži neuspeh in nadaljuje:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testirajte kljuke izolirano pred polnim zagonom.** Ni vam treba zagnati `azd up` za razhroščevanje kljuke—zaženite jo samostojno in hitro iterirajte:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Pazite na lupine specifične za OS.** Kljuka, ki uporablja `shell: pwsh`, potrebuje nameščen PowerShell na napravi, ki jo izvaja (vključno z CI agenti). Za najširšo prenosljivost uporabite `shell: sh` ali zagotovite obe različici `windows` in `posix`:

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

> **Namig za razhroščevanje:** zaženite kateri koli ukaz azd z `--debug`, da vidite točno vrstico ukaza kljuke in njen polni izhod—neprecenljivo, ko kljuka deluje lokalno, vendar spodleti v CI.

## 🎛️ Konfiguracija uvajanja

### Nastavitve uvajanja specifične za storitev
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

### Konfiguracije specifične za okolje

To so lokalne vrednosti azd. Izrecno jih preslikajte v konfiguracijo infrastrukture/izvajalnega okolja. `NODE_ENV` je običajno `production` za nameščeno Node aplikacijo, vključno z uvajanjem za preskusno okolje; uporabite ločeno spremenljivko specifično za aplikacijo za razlikovanje faz uvajanja.

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

## 🔧 Napredni scenariji uvajanja

### Večstoritvene aplikacije
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

**Narisana operativna shema:** morate zagotoviti obe okolji, skupni sloj usmerjanja prometa in spodnji dve skripti. azd samodejno ne preklaplja prometa niti ne preverja pripravljenosti za povrnitev. Ohranite zeleno, dokler modro ne prestane testiranja in povrnitev ni več potrebna.

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

### Kanarska uvajanja
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Razdeljevanje prometa spada v konfiguracijo Container Apps (Bicep ali Azure CLI), ne pa v lastnost `azure.yaml` `trafficSplit`. Predogled/uprovision in kasnejša uvajanja morajo ohraniti izbrani način revizije in pravila usmerjanja.

### Uvajanja po fazah
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

## 🐳 Uvajanja kontejnerjev

### Uvajanja Container App
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

Konfigurirajte skrivnosti za izvajalno okolje z `configuration.secrets`/`secretRef` (ali s sklici na Key Vault) in skaliranje z `template.scale` v infrastrukturi Container App. Ne izmišljajte lastnosti `secrets` ali `scale` na nivoju storitve v `azure.yaml`.

### Optimizacija Dockerfile z več fazami
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

## ⚡ Optimizacija zmogljivosti

### Uvajanja specifična za storitev
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Predpomnjenje gradnje
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standardni delovni tok Node uporablja skripte paketov; storitvene `prepackage` kljuke lahko dodajo potrebne korake. Predpomnjenje slojev Docker je ločeno od definiranja gradbenega ukaza storitve.

### Učinkovita uvajanja kode
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Spremljanje uvajanja

### Spremljanje uvajanja v realnem času
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Zdravstveni pregledi
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

Vaša aplikacija mora implementirati `/health`; azd ga ne zagotavlja samodejno. Ni generične lastnosti storitve `azure.yaml` `healthCheck`.

### Preverjanje po uvedbi
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

## 🔐 Varnostni vidiki

### Upravljanje skrivnosti
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` ni veljaven. Obične vrednosti okolja so lokalni navadni tekst; ne domnevajte, da jih ukazi za branje cenzurirajo. Ukazi zgoraj shranijo sklice na Key Vault, vendar mora vaša infrastruktura/aplikacija še vedno porabiti skrivnosti in dodeliti dostop identiteti za izvajanje.

### Varnost omrežja
Določite in porabite omrežne parametre v Bicep in preslikajte jih v `infra/main.parameters.json`. Ni generičnega omrežnega sloja `infra.parameters` v `azure.yaml`. Primeri dokumentacije za območja `203.0.113.0/24` in `198.51.100.0/24` niso resnična pisarniška/VPN omrežja; zamenjajte jih z avtoriziranimi območji omrežja.

### Upravljanje identitete in dostopa
Omogočite `identity` Container App v Bicep in dodelite potrebno vlogo podatkovne ravni Key Vault na obsegu trezorja. Konfigurirajte poimenovane skrivnosti podprte z Key Vault in sklice za izvajanje v tem viru; `identity` in `keyVault` niso generične lastnosti storitev azd. Glejte [Avtentikacija in upravljanje identitete](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategije povrnitve

### Hitro povrnitev
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

### Povrnitev infrastrukture
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

## 📊 Merjenje uvajanja

### Spremljaj zmogljivost uvajanja
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

### 1. Konsistentnost okolja
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

### 4. Dokumentacija in beleženje
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Naslednji koraki

- [Provisioning Resources](provisioning.md) - Poglobljen vpogled v upravljanje infrastrukture
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Načrtujte svojo strategijo uvedbe
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Rešite težave pri uvajanju
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Strategije uvajanja pripravljene za produkcijo

## 🎯 Praktične vaje uvajanja

### vaja 1: delovni tok inkrementalnega uvajanja (20 minut)
**Cilj**: Obvladati razliko med popolnimi in inkrementalnimi uvajanji

**Začetna točka:** Bash, Node.js 22, Git, prijava v azd in naročnina Azure z dovoljenji za uvajanje. Zaženite v novi mapi; pričakujte zaračunljive vire App Service/Cosmos DB. Časovni okvirji so odvisni od regije in predloge.

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

**Kriteriji uspeha:**
- [ ] Zabeleži potekli čas za oba ukaza (ni zagotovljenega trajanja)
- [ ] Oba ukaza se uspešno zaključita
- [ ] API ostane funkcionalen; sprememba le v komentarju ni vidna sprememba v UI
- [ ] Infrastruktura se ne spremeni po `azd deploy`

**Rezultat učenja**: `azd deploy` izpusti upravljanje infrastrukture. Primerjajte izmerjene čase, namesto da predpostavljate določen odstotek pospeška.

### vaja 2: Prilagojene kljuke uvajanja (30 minut)
**Cilj**: Implementirati avtomatizacijo pred in po uvedbi

**Začetna točka:** prej inicializirani projekt `deployment-practice`. Če ste ga počistili, zaženite `azd up` ponovno pred testiranjem uvajanja samo kode. Preverjanje spodaj uporablja dejansko gradbeno skripto API, ne neobstoječo root skripto `test:unit`. Testi predloge API potrebujejo konfiguriran dostop do baze; niso izolirani enotni testi.

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

**Kriteriji uspeha:**
- [ ] Skripta pred uvedbo teče pred uvajanjem
- [ ] Uvajanje se prekine, če preverjanje gradnje ne uspe
- [ ] Test po uvedbi potrdi zdravje
- [ ] Kljuke se izvajajo v pravilnem vrstnem redu

### vaja 3: Strategija uvajanja z več okolji (45 minut)
**Cilj**: Implementirati delovni tok uvajanja po fazah (dev → staging → produkcija)

**Začetna točka:** isti inicializirani projekt todo z `jq`. Ustvarite spodnje okolja z resničnimi vrednostmi naročnine/lokacije (ali nastavite `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` v vsakem) **pred** zagonom poteka brez poziva. Namerno ne uspe, namesto da bi izmišljal manjkajoče vrednosti. Uporabljajte le enkratna učna okolja, ne dejanske produkcijske naročnine.

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

**Merila uspeha:**
- [ ] Okolje za razvoj se uspešno implementira
- [ ] Okolje za preizkušanje se uspešno implementira
- [ ] Za produkcijo je zahtevano ročno odobritev
- [ ] Vsa okolja imajo delujoče zdravstvene preglede
- [ ] Možno je povrniti stanje, če je potrebno

### Vaja 4: Strategija povračila (25 minut)
**Cilj**: Implementirati in testirati povračilo implementacije z uporabo Gita

**Začetna točka:** izoliran učni checkout predloge todo z vso osnovno izvorno kodo vcommmitano, čist Git delovni drevo in enkratno konfigurirano okolje. Nikoli ne vnašajte namernih napak v resničnem produkcijskem projektu. `APP_VERSION` spodaj služi samo za vodenje evidenc, razen če ga izrecno povežete v aplikacijo.

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

**Merila uspeha:**
- [ ] Zaznava napake implementacije
- [ ] Skripta za povračilo se samodejno izvede
- [ ] Aplikacija se vrne v delujoče stanje
- [ ] Zdravstveni pregledi so uspešni po povračilu

## 📊 Sledenje meril uspešnosti implementacije

### Sledite uspešnosti svoje implementacije

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

**Analizirajte svoje meritve:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni viri

- [Referenca za implementacijo Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementacija Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementacija Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementacija Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prejšnja lekcija**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **Naslednja lekcija**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->