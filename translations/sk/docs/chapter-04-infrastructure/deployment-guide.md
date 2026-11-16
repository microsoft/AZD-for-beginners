# Príručka nasadenia - Ovládnutie AZD nasadení

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)
- **➡️ Ďalšia**: [Provisioning Resources](provisioning.md)
- **🧩 Tiež v tejto kapitole**: [Písanie vlastnej šablóny](custom-templates.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 5: Viacagentové AI riešenia](../../examples/retail-scenario.md)

## Úvod

> Preskúmané voči `azd 1.37.2` (november 2026). Príkazy používajú Bash; príklady JSON vyžadujú `jq`. Okrem výslovne inicializovaného cvičenia todo, pokročilé príklady sú **fragmenty integrácie**: dodajte vlastný zdroj, infraštruktúru, testy a skripty. V tejto revízii nebolo vykonané žiadne nasadenie v Azure.

Tento komplexný návod pokrýva všetko, čo potrebujete vedieť o nasadzovaní aplikácií pomocou Azure Developer CLI, od základných nasadení jedným príkazom po pokročilé produkčné scenáre s vlastnými hookmi, viacerými prostrediami a integráciou CI/CD. Ovládnite celý životný cyklus nasadenia s praktickými príkladmi a osvedčenými postupmi.

## Ciele učenia

Po dokončení tejto príručky budete:
- Ovládať všetky príkazy a pracovné postupy nasadenia Azure Developer CLI
- Pochopiť kompletný životný cyklus nasadenia od provisioning po monitorovanie
- Implementovať vlastné hooky na automatizáciu pred a po nasadení
- Konfigurovať viaceré prostredia s parametrami špecifickými pre dané prostredie
- Nastaviť pokročilé stratégie nasadenia vrátane blue-green a canary nasadení
- Integrovať azd nasadenia s CI/CD pipeline-ami a DevOps pracovnými postupmi

## Výstupy učenia

Po dokončení budete schopní:
- Samostatne vykonávať a riešiť problémy so všetkými azd pracovnými tokmi nasadenia
- Navrhovať a implementovať vlastnú automatizáciu nasadenia pomocou hookov
- Konfigurovať produkčné nasadenia s náležitou bezpečnosťou a monitorovaním
- Spravovať komplexné viacprostriedové scenáre nasadenia
- Optimalizovať výkon nasadenia a implementovať stratégie rollbacku
- Integrovať azd nasadenia do podnikových DevOps praktík

## Prehľad nasadenia

Azure Developer CLI poskytuje niekoľko príkazov na nasadenie:
- `azd up` - Kompletný pracovný tok (provision + nasadenie)
- `azd provision` - Vytvárať/aktualizovať len Azure zdroje
- `azd deploy` - Nasadzovať len kód aplikácie
- `azd package` - Build a balenie aplikácií

## Základné pracovné toky nasadenia

### Kompletné nasadenie (azd up)
Najbežnejší pracovný tok pre nové projekty:
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

### Nasadenie len infraštruktúry
Keď potrebujete len aktualizovať Azure zdroje:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Nasadenie len kódu
Pre rýchle aktualizácie aplikácie:
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

### ✅ Overenie nasadenia

Po každom nasadení overte úspech:

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

**Kritériá úspechu:**
- ✅ `azd show` vyrieši očakávané cieľové služby/URL
- ✅ Požiadavky na skutočné aplikácie vracajú očakávaný stav a telo odpovede
- ✅ Žiadne chybové logy za posledných 5 minút
- ✅ Aplikácia reaguje na testovacie požiadavky

## 🏗️ Pochopenie procesu nasadenia

### Nový na hookoch? Začnite tu

**Hook** je príkaz, ktorý azd automaticky spustí v konkrétnom momente procesu nasadenia – pred alebo po provisioningu, a pred alebo po nasadení vášho kódu. Umožňujú automatizovať malé úlohy, ktoré vždy sprevádzajú nasadenie: naplnenie databázy, spustenie migrácií, kompiláciu assetov alebo smoke-testovanie živej aplikácie.

| Hook | Beží… | Bežné použitie |
|------|-------|------------|
| `preprovision` | Pred vytvorením zdrojov | Overenie predpokladov, prihlásenie do registra |
| `postprovision` | Po vytvorení zdrojov | Konfigurácia zdrojov, nastavenie databázy |
| `predeploy` | Pred nasadením kódu | Kompilácia front-end assetov, spúšťanie unit testov |
| `postdeploy` | Po nasadení kódu | Spúšťanie migrácií DB, smoke-test endpointu |

Hooky žijú vo vašom `azure.yaml`. Tu je najmenší možný príklad – po nasadení jednoducho vytlačí správu:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je všetko – nabudúce, keď spustíte `azd up`, správa sa vytlačí automaticky. Hook môžete tiež spustiť samostatne, bez plného nasadenia, čo je skvelé na testovanie:

```bash
azd hooks run postdeploy
```

Nasledujúce fázy ukazujú reálne hooky (migrácie, testy, validácie) pre každú etapu.

### Fáza 1: Pre-provision hooky
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

### Fáza 2: Provisioning infraštruktúry
- Číta infraštruktúrne šablóny (Bicep/Terraform)
- Vytvára alebo aktualizuje Azure zdroje
- Konfiguruje sieť a bezpečnosť
- Nastavuje monitorovanie a protokolovanie

### Fáza 3: Post-provision hooky
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

### Fáza 4: Balík aplikácie
- Kompiluje kód aplikácie
- Vytvára artefakty nasadenia
- Balí pre cieľovú platformu (kontajnery, ZIP súbory, atď.)

### Fáza 5: Pre-deploy hooky
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

### Fáza 6: Nasadenie aplikácie
- Nasadzuje zabalené aplikácie do Azure služieb
- Aktualizuje konfiguračné nastavenia
- Štartuje/reštartuje služby

### Fáza 7: Post-deploy hooky
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

### Riešenie chýb hookov

Štandardne **ak hook príkaz skončí s nenulovým kódom, azd zastaví celú operáciu.** Toto je zvyčajne to, čo chcete – neúspešná migrácia by mala zastaviť nasadenie, nie dodať chybnú aplikáciu. To znamená, že hooky musia byť napísané starostlivo.

**1. Nechajte zlyhania byť hlasné a zámerné.** Hook zlyhá, keď jeho posledný príkaz vráti nenulový exit kód. V shell skriptoch pridajte `set -e`, aby sa hook zastavil pri prvom zlyhaní namiesto tichého pokračovania:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Umožnite hooku zlyhať bez zastavenia azd.** Pre nekritické kroky (voliteľné vyhrievanie cache, upozornenia na báze najlepšieho úsilia) nastavte `continueOnError: true`. azd zaznamená zlyhanie, ale pokračuje ďalej:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testujte hooky izolovane pred plným spustením.** Nemusíte spustiť `azd up` na ladenie hooku – spustite ho samostatne a rýchlo iterujte:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Dávajte pozor na OS-špecifické shelly.** Hook používajúci `shell: pwsh` potrebuje PowerShell na stroji, ktorý ho spúšťa (vrátane CI agentov). Použite `shell: sh` pre najširšiu prenosnosť, alebo poskytnite obidve varianty `windows` a `posix`:

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

> **Tip na ladenie:** spustite akýkoľvek azd príkaz s `--debug`, aby ste videli presný príkaz hooku a jeho úplný výstup – neoceniteľné, ak hook funguje lokálne, ale zlyháva v CI.

## 🎛️ Konfigurácia nasadenia

### Nastavenia nasadenia špecifické pre službu
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

### Konfigurácie špecifické pre prostredie

Tieto hodnoty sú len lokálne pre azd. Explicitne ich mapujte na infraštruktúru/runtime konfiguráciu. `NODE_ENV` je obvykle `production` pre nasadenú Node aplikáciu, vrátane stagingu; na odlíšenie fáz nasadenia používajte samostatnú premennú špecifickú pre aplikáciu.

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

## 🔧 Pokročilé scenáre nasadenia

### Viacslužbové aplikácie
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

### Blue-Green nasadenia

**Ilustratívny operačný náčrt:** musíte dodať obe prostredia, spoločnú vrstvu riadenia prevádzky a dva nasledujúce skripty. azd automaticky neprepína prevádzku ani nevaliduje pripravenosť rollbacku. Držte green prostredie aktívne, kým blue neprejde testami a rollback už nie je potrebný.

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

### Canary nasadenia
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Rozdeľovanie prevádzky patrí do konfigurácie Container Apps (Bicep alebo Azure CLI), nie do `azure.yaml` `trafficSplit` vlastnosti. Preview/provisioning a neskoršie nasadenia musia zachovať zvolený režim revízie a smerovacie pravidlá.

### Etapové nasadenia
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

## 🐳 Nasadenia kontajnerov

### Nasadenia Container App
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

Konfigurujte runtime tajomstvá s `configuration.secrets`/`secretRef` (alebo odkazmi na Key Vault) a škálovanie s `template.scale` v infraštruktúre Container App. Nevymýšľajte služby na úrovni vlastností `secrets` alebo `scale` v `azure.yaml`.

### Optimalizácia Dockerfile s viacerými fázami
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

## ⚡ Optimalizácia výkonu

### Nasadenia špecifické pre službu
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Caching buildov
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Štandardný Node pracovný tok používa package skripty; hooky služby `prepackage` môžu pridať potrebné kroky. Docker layer caching je oddelený od definovania build príkazu služby.

### Efektívne nasadenia kódu
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitorovanie nasadenia

### Monitorovanie nasadenia v reálnom čase
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Kontroly zdravotného stavu
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

Vaša aplikácia musí implementovať `/health`; azd ju neposkytuje automaticky. Neexistuje žiadna generická vlastnosť služby `azure.yaml` `healthCheck`.

### Validácia po nasadení
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

## 🔐 Bezpečnostné úvahy

### Správa tajomstiev
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` je neplatný. Obyčajné hodnoty prostredia sú lokálne v plaintext-e; nepripúšťajte, že čítacie príkazy ich zčiernia. Príkazy vyššie ukladajú odkazy na Key Vault, avšak vaša infraštruktúra/aplikácia musí tajomstvá spotrebovať a udeliť runtime identite prístup.

### Sieťová bezpečnosť
Deklarujte a použite sieťové parametre v Bicep a mapujte ich v `infra/main.parameters.json`. Neexistuje žiadna generická `infra.parameters` vrstva v `azure.yaml`. Ukážkové dokumentačné rozsahy `203.0.113.0/24` a `198.51.100.0/24` nie sú skutočné kancelárske/VPN siete; nahraďte ich oprávnenými sieťovými rozsahmi.

### Správa identity a prístupu
Povolenie `identity` Container App v Bicep a priradenie potrebnej roly data-plane Key Vault v rozsahu vaultu. Konfigurujte pomenované tajomstvá podložené Key Vault a runtime odkazy v tomto zdroji; `identity` a `keyVault` nie sú generické azd vlastnosti služby. Pozrite [Overovanie a spravovaná identita](../chapter-03-configuration/authsecurity.md).

## 🚨 Stratégie rollbacku

### Rýchly rollback
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

### Rollback infraštruktúry
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Rollback migrácie databázy
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metriky nasadenia

### Sledovanie výkonu nasadenia
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Zber vlastných metrík
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

## 🎯 Najlepšie postupy

### 1. Konzistentnosť prostredí
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validácia infraštruktúry
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Integrácia testovania
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

### 4. Dokumentácia a protokolovanie
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Ďalšie kroky

- [Provisioning Resources](provisioning.md) - Hlbší ponor do správy infraštruktúry
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Naplánujte si svoju stratégiu nasadenia
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Riešenie problémov s nasadením
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Produkčné stratégie nasadenia

## 🎯 Praktické cvičenia nasadenia

### Cvičenie 1: Pracovný tok inkrementálneho nasadenia (20 minút)
**Cieľ**: Ovládnuť rozdiel medzi kompletým a inkrementálnym nasadením

**Začiatočný bod:** Bash, Node.js 22, Git, azd prihlásenie, a Azure predplatné s právami na nasadenie. Spustite v novom adresári; očakávajte fakturovateľné zdroje App Service/Cosmos DB. Časy závisia od regiónu a šablóny.

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

**Kritériá úspechu:**
- [ ] Zaznamenať uplynutý čas pre oba príkazy (doba nie je garantovaná)
- [ ] Oba príkazy úspešne dokončiť
- [ ] API zostáva funkčné; úprava len komentárov nie je viditeľnou zmenou UI
- [ ] Infrastruktúra bez zmien po `azd deploy`

**Výstup učenia**: `azd deploy` preskočí provisioning infraštruktúry. Porovnajte namerané časy namiesto predpokladania fixného percentuálneho zrýchlenia.

### Cvičenie 2: Vlastné hooky nasadenia (30 minút)
**Cieľ**: Implementovať automatizáciu pred a po nasadení

**Začiatočný bod:** inicializovaný projekt `deployment-practice` vyššie. Ak ste ho vyčistili, spustite `azd up` znova pred testovaním nasadenia len kódu. Nižšie validácia používa skutočný build skript API, nie neexistujúci root `test:unit` skript. API testy šablóny potrebujú nakonfigurovaný prístup k databáze; nie sú izolované unit testy.

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

**Kritériá úspechu:**
- [ ] Pre-deploy skript beží pred nasadením
- [ ] Nasadenie sa preruší pri neúspešnej validácii buildu
- [ ] Post-deploy smoke test overí zdravie
- [ ] Hooky sa spúšťajú v správnom poradí

### Cvičenie 3: Stratégiu nasadenia viacerých prostredí (45 minút)
**Cieľ**: Implementovať etapový pracovný tok nasadenia (dev → staging → produkcia)

**Východiskový bod:** ten istý inicializovaný projekt todo s `jq`. Vytvorte nižšie uvedené prostredia s reálnymi hodnotami predplatného/lokality (alebo nastavte `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` v každom) **pred** spustením workflow bez výzvy. Úmyselne zlyhá, namiesto toho, aby vymýšľal chýbajúce hodnoty. Používajte iba jednorazové školenia, nie skutočné produkčné predplatné.

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

**Kritériá úspechu:**
- [ ] Vývojové prostredie sa úspešne nasadí
- [ ] Stagingové prostredie sa úspešne nasadí
- [ ] Pre produkciu je vyžadované manuálne schválenie
- [ ] Všetky prostredia majú funkčné zdravotné kontroly
- [ ] Je možné vykonať spätný rollback v prípade potreby

### Cvičenie 4: Stratégia rollbacku (25 minút)
**Cieľ**: Implementovať a otestovať rollback nasadenia pomocou Gitu

**Východiskový bod:** izolovaná trénová kópia šablóny todo so všetkými základnými zdrojmi commitnutými, čistý Git pracovný strom a jednorazovo nakonfigurované prostredie. Nikdy nezavádzajte zámerné chyby v reálnom produkčnom projekte. `APP_VERSION` nižšie je len účtovný záznam, pokiaľ ho výslovne nezapojíte do aplikácie.

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

**Kritériá úspechu:**
- [ ] Dokáže detegovať zlyhania nasadenia
- [ ] Rollback skript sa spustí automaticky
- [ ] Aplikácia sa vráti do funkčného stavu
- [ ] Zdravotné kontroly prejdú po rollbacku

## 📊 Sledovanie metrík nasadenia

### Sledujte výkonnosť vášho nasadenia

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

**Analyzujte svoje metriky:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ďalšie zdroje

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nasadenie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nasadenie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigácia**
- **Predchádzajúca lekcia**: [Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **Nasledujúca lekcia**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->