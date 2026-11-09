# Průvodce nasazením - Mistrovství v nasazeních AZD

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 4 - Infrastruktura jako kód & nasazení
- **⬅️ Předchozí kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)
- **➡️ Další**: [Provisioning Resources](provisioning.md)
- **🧩 Také v této kapitole**: [Vytváření vlastních šablon](custom-templates.md)
- **🚀 Další kapitola**: [Kapitola 5: Víceagentové AI řešení](../../examples/retail-scenario.md)

## Úvod

> Zkontrolováno k datu `azd 1.37.2` (listopad 2026). Příkazy využívají Bash; ukázky JSON vyžadují `jq`. S výjimkou explicitně inicializovaného cvičení todo jsou pokročilé příklady **fragmenty integrace**: doplňte vlastní zdroje, infrastrukturu, testy a skripty. V této revizi nebyla provedena žádná reálná nasazení Azure.

Tento komplexní průvodce pokrývá vše, co potřebujete vědět o nasazování aplikací pomocí Azure Developer CLI, od základních nasazení jedním příkazem až po pokročilé produkční scénáře s vlastními hooky, více prostředími a integrací CI/CD. Ovládněte celý životní cyklus nasazení s praktickými příklady a osvědčenými postupy.

## Výukové cíle

Po dokončení tohoto průvodce budete:
- Ovládat všechny příkazy a workflow nasazení Azure Developer CLI
- Rozumět kompletnímu životnímu cyklu nasazení od provisioning až po monitoring
- Implementovat vlastní nasazovací hooky pro automatizaci před a po nasazení
- Konfigurovat více prostředí s parametry specifickými pro prostředí
- Nastavit pokročilé nasazovací strategie včetně blue-green a canary nasazení
- Integrovat nasazení azd s CI/CD pipelines a DevOps procesy

## Výsledky učení

Po dokončení budete schopni:
- Samostatně provádět a řešit problémy ve všech azd nasazovacích workflow
- Navrhnout a implementovat vlastní automatizaci nasazení pomocí hooků
- Konfigurovat nasazení připravená pro produkci se správnou bezpečností a monitoringem
- Spravovat složité scénáře nasazení s více prostředími
- Optimalizovat výkon nasazení a implementovat strategie rollbacku
- Integrovat nasazení azd do podnikových DevOps procesů

## Přehled nasazení

Azure Developer CLI poskytuje několik nasazovacích příkazů:
- `azd up` - Kompletní workflow (provision + deploy)
- `azd provision` - Vytvoření/aktualizace pouze Azure zdrojů
- `azd deploy` - Nasazení pouze aplikačního kódu
- `azd package` - Sestavení a zabalení aplikací

## Základní nasazovací workflow

### Kompletní nasazení (azd up)
Nejčastější workflow pro nové projekty:
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

### Nasazení pouze infrastruktury
Když potřebujete aktualizovat pouze Azure zdroje:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Nasazení pouze kódu
Pro rychlé aktualizace aplikace:
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

### ✅ Ověření nasazení

Po každém nasazení ověřte úspěch:

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

**Kritéria úspěchu:**
- ✅ `azd show` vyřeší očekávané cíle služeb/URL
- ✅ Požadavky na skutečné aplikační routy vracejí očekávaný stav a obsah
- ✅ Žádné chybové logy za posledních 5 minut
- ✅ Aplikace reaguje na testovací požadavky

## 🏗️ Pochopení procesu nasazení

### Nováček v hookech? Začněte zde

**Hook** je příkaz, který azd spustí automaticky v konkrétní fázi procesu nasazení—před nebo po provisioningu a před nebo po nasazení kódu. Umožňují automatizovat drobné úkoly, které vždy doprovázejí nasazení: naplnění databáze, spuštění migrací, sestavení assetů nebo rychlý test běžící aplikace.

| Hook | Spouští se… | Běžné použití |
|------|------------|--------------|
| `preprovision` | Před vytvořením zdrojů | Ověření předpokladů, přihlášení do registru |
| `postprovision` | Po existenci zdrojů | Konfigurace zdrojů, nastavení databáze |
| `predeploy` | Před nasazením kódu | Sestavení front-end assetů, spuštění jednotkových testů |
| `postdeploy` | Po nasazení kódu | Spuštění DB migrací, rychlý test endpointu |

Hooky jsou definovány ve vašem `azure.yaml`. Zde je nejmenší možný příklad—jen vypíše zprávu po nasazení:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je vše—při příštím spuštění `azd up` se zpráva automaticky vypíše. Hook můžete také spustit samostatně, bez kompletního nasazení, což je skvělé pro testování:

```bash
azd hooks run postdeploy
```

Níže jsou fáze ukazující reálné hooky (migrace, testy, ověření) pro každou etapu.

### Fáze 1: Hooky před provisioningem
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

### Fáze 2: Provisioning infrastruktury
- Čte šablony infrastruktury (Bicep/Terraform)
- Vytváří nebo aktualizuje Azure zdroje
- Konfiguruje síťování a zabezpečení
- Nastavuje monitoring a logování

### Fáze 3: Hooky po provisioningu
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

### Fáze 4: Balení aplikace
- Sestavení aplikačního kódu
- Vytvoření nasazovacích artefaktů
- Zabalení pro cílovou platformu (containers, ZIP soubory atd.)

### Fáze 5: Hooky před nasazením
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

### Fáze 6: Nasazení aplikace
- Nasadí zabalené aplikace do Azure služeb
- Aktualizuje konfiguraci nastavení
- Spustí/restartuje služby

### Fáze 7: Hooky po nasazení
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

### Zacházení s chybami v hookech

Ve výchozím nastavení **pokud hook příkaz skončí s nenulovým kódem, azd zastaví celou operaci.** Obvykle to chcete—neúspěšná migrace by měla zastavit nasazení, ne dodat poškozenou aplikaci. Znamená to však, že hooky musí být napsány pečlivě.

**1. Neúspěchy musí být hlasité a záměrné.** Hook selže, když jeho poslední příkaz vrátí nenulový exit code. V shell skriptech přidejte `set -e`, aby hook ihned skončil při první chybě, místo tichého pokračování:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Umožněte, aby hook mohl selhat, aniž by zastavil azd.** Pro kriticky nevýznamné kroky (volné ohřátí cache, upozornění na nejlepší úsilí) nastavte `continueOnError: true`. azd chybu zaznamená, ale pokračuje dál:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testujte hooky izolovaně před kompletním během.** Nemusíte spouštět `azd up` k debugování hooku—spusťte ho samostatně a rychle iterujte:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Dávejte pozor na OS-specifické shelly.** Hook využívající `shell: pwsh` musí mít na stroji, kde běží (včetně CI agentů), nainstalovaný PowerShell. Pro nejširší přenositelnost používejte `shell: sh` nebo současně obě varianty `windows` a `posix`:

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

> **Tip na ladění:** Spusťte jakýkoliv příkaz azd s `--debug`, abyste viděli přesnou příkazovou řádku hooku a jeho kompletní výstup—neocenitelné, když hook funguje lokálně, ale selhává v CI.

## 🎛️ Konfigurace nasazení

### Nasazovací nastavení specifická pro službu
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

### Konfigurace specifické pro prostředí

Tato jsou pouze lokální azd hodnoty. Explicitně je namapujte do infrastruktury/runtime konfigurace. `NODE_ENV` je obvykle `production` u nasazené Node aplikace, včetně staging nasazení; pro odlišení fází nasazení používejte samostatnou proměnnou specifickou pro aplikaci.

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

## 🔧 Pokročilé scénáře nasazení

### Více-službové aplikace
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

### Blue-Green nasazení

**Ilustrační provozní náčrt:** musíte dodat obě prostředí, společnou vrstvu řízení provozu a dva níže uvedené skripty. azd automaticky nepřepíná provoz ani neověřuje připravenost rollbacku. Nechte zelené prostředí aktivní, dokud testování v modrém neproběhne a rollback již není potřeba.

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

### Canary nasazení
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Rozdělení provozu patří konfiguraci Container Apps (Bicep nebo Azure CLI), ne vlastnosti `azure.yaml` `trafficSplit`. Náhled/provisioning i pozdější nasazení musí zachovat vámi zvolený režim revize a pravidla směrování.

### Postupné nasazení
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

## 🐳 Nasazení kontejnerů

### Nasazení Container App
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

Konfigurujte runtime secret hodnoty pomocí `configuration.secrets`/`secretRef` (nebo referencí na Key Vault) a škálování pomocí `template.scale` v infrastruktuře Container App. Nevymýšlejte service-level `secrets` nebo `scale` vlastnosti v `azure.yaml`.

### Optimalizace Dockerfile ve více fázích
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

## ⚡ Optimalizace výkonu

### Nasazení specifické pro službu
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Caching buildů
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standardní Node workflow používá package skripty; service `prepackage` hooky mohou přidat požadované kroky. Docker caching vrstev je oddělený od definice build příkazu služby.

### Efektivní nasazení kódu
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitoring nasazení

### Monitoring nasazení v reálném čase
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Kontroly zdravotního stavu
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

Vaše aplikace musí implementovat `/health`; není automaticky poskytováno azd. Neexistuje obecná služební vlastnost `azure.yaml` `healthCheck`.

### Ověření po nasazení
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

## 🔐 Bezpečnostní aspekty

### Správa tajemství
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` je neplatné. Obvyklé hodnoty prostředí jsou lokální plaintext; nepředpokládejte, že čtecí příkazy je skryjí. Výše uvedené příkazy ukládají reference na Key Vault, ale infrastruktura/aplikace musí tajemství také spotřebovat a povolit runtime identitě přístup.

### Síťová bezpečnost
Deklarujte a používejte síťové parametry v Bicep a mapujte je v `infra/main.parameters.json`. Neexistuje obecná síťová vrstva `infra.parameters` v `azure.yaml`. Ukázková dokumentace s rozsahy `203.0.113.0/24` a `198.51.100.0/24` nejsou opravdové kancelářské/VPN sítě; nahraďte je autorizovanými síťovými rozsahy.

### Řízení identity a přístupu
Povolte `identity` Container App v Bicep a přidělte potřebnou datovou roli Key Vaultu v rozsahu vaultu. Konfigurujte pojmenovaná tajemství založená na Key Vault a runtime reference v tomto zdroji; `identity` a `keyVault` nejsou obecné azd service vlastnosti. Viz [Autentizace & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategie rollbacku

### Rychlý rollback
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

### Rollback infrastruktury
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Rollback migrací databáze
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metriky nasazení

### Sledování výkonu nasazení
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Sběr vlastních metrik
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

## 🎯 Nejlepší praxe

### 1. Konzistence prostředí
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validace infrastruktury
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Integrace testování
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

### 4. Dokumentace a logování
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Další kroky

- [Provisioning Resources](provisioning.md) - Hloubkový rozbor správy infrastruktury
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Plánování strategie nasazení
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Řešení problémů s nasazením
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Strategie nasazení připravené pro produkci

## 🎯 Praktická nasazovací cvičení

### Cvičení 1: Inkremetální nasazovací workflow (20 minut)
**Cíl**: Ovládnout rozdíl mezi kompletním a inkrementálním nasazením

**Výchozí bod:** Bash, Node.js 22, Git, azd přihlášení a předplatné Azure s oprávněními pro nasazení. Spusťte v novém adresáři; očekávejte zpoplatněné App Service/Cosmos DB zdroje. Časy závisí na regionu a šabloně.

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

**Kritéria úspěchu:**
- [ ] Zaznamenejte uplynulý čas pro oba příkazy (doba není garantována)
- [ ] Oba příkazy úspěšně dokončeny
- [ ] API zůstává funkční; editace pouze komentářů není viditelná změna UI
- [ ] Infrastruktura beze změn po `azd deploy`

**Výsledek učení**: `azd deploy` přeskočí provisioning infrastruktury. Porovnejte změřené časy, než předpokládáte fixní procentuální zrychlení.

### Cvičení 2: Vlastní nasazovací hooky (30 minut)
**Cíl**: Implementovat automatizaci před i po nasazení

**Výchozí bod:** Inicializovaný projekt `deployment-practice` výše. Pokud jste ho vyčistili, spusťte znova `azd up` před testováním nasazení pouze kódu. Níže uvedená validace používá skutečný build skript API, ne neexistující root `test:unit` skript. Testy API šablony vyžadují nakonfigurovaný přístup do databáze; nejsou izolované jednotkové testy.

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

**Kritéria úspěchu:**
- [ ] Skript před nasazením běží před nasazením
- [ ] Nasazení se přeruší při neúspěšné validaci buildu
- [ ] Rychlý test po nasazení ověřuje zdraví
- [ ] Hooky se spouštějí ve správném pořadí

### Cvičení 3: Strategie nasazení více prostředí (45 minut)
**Cíl**: Implementovat workflow postupného nasazení (dev → staging → produkce)

**Výchozí bod:** stejný inicializovaný projekt todo s `jq`. Vytvořte níže uvedená prostředí s reálnými hodnotami předplatného/lokace (nebo nastavte `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` v každém) **před** spuštěním workflow bez výzev. Úmyslně selže, místo aby vymýšlel chybějící hodnoty. Používejte pouze dočasná výuková prostředí, nikoli skutečné produkční předplatné.

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

**Kriteria úspěchu:**
- [ ] Vývojové prostředí se nasadí úspěšně
- [ ] Staging prostředí se nasadí úspěšně
- [ ] Pro produkci je vyžadováno ruční schválení
- [ ] Všechna prostředí mají funkční kontrolu stavu
- [ ] Je možné provést návrat zpět, pokud je to potřeba

### Cvičení 4: Strategie návratu zpět (25 minut)
**Cíl**: Implementovat a otestovat nasazení návratu zpět pomocí Gitu

**Výchozí bod:** izolovaná výuková kopie šablony todo s veškerým základním zdrojem zcommitovaným, čistým pracovním stromem Gitu a dočasně nakonfigurovaným prostředím. Nikdy nezavádějte úmyslné chyby v reálném produkčním projektu. `APP_VERSION` níže jsou pouze účetní záležitostí, pokud je výslovně nezapojíte do aplikace.

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

**Kriteria úspěchu:**
- [ ] Dokáže detekovat selhání nasazení
- [ ] Skript pro návrat zpět se spustí automaticky
- [ ] Aplikace se vrátí do funkčního stavu
- [ ] Kontroly stavu projdou po návratu zpět

## 📊 Sledování metrik nasazení

### Sledujte výkon svého nasazení

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

**Analyzujte své metriky:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Další zdroje

- [Reference nasazení Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nasazení Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nasazení Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nasazení Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigace**
- **Předchozí lekce**: [Váš první projekt](../chapter-01-foundation/first-project.md)
- **Následující lekce**: [Provisioning zdrojů](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->