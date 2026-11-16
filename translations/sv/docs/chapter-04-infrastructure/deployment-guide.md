# Deployeringsguide - Bemästra AZD-deployeringar

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 4 - Infrastruktur som kod & deployering
- **⬅️ Föregående kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Nästa**: [Resursprovisionering](provisioning.md)
- **🧩 Även i detta kapitel**: [Skapa din egen mall](custom-templates.md)
- **🚀 Nästa kapitel**: [Kapitel 5: Multi-Agent AI-lösningar](../../examples/retail-scenario.md)

## Introduktion

> Granskad mot `azd 1.37.2` (november 2026). Kommandon använder Bash; JSON-exempel kräver `jq`. Förutom det uttryckligen initierade todo-övningen är avancerade exempel **integrationsfragment**: leverera egen källa, infrastruktur, tester och skript. Inga Azure-deployeringar kördes vid denna granskning.

Denna omfattande guide täcker allt du behöver veta om att deployera applikationer med Azure Developer CLI, från grundläggande enkla kommandodeployeringar till avancerade produktionsscenarion med anpassade krokar, flera miljöer och CI/CD-integration. Bemästra hela deployeringslivscykeln med praktiska exempel och bästa praxis.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra alla Azure Developer CLI-kommandon och arbetsflöden för deployering
- Förstå hela deployeringslivscykeln från provisionering till övervakning
- Implementera anpassade deployeringskrokar för automatisering före och efter deployering
- Konfigurera flera miljöer med miljöspecifika parametrar
- Sätta upp avancerade deployeringsstrategier inklusive blå-grön och canary-deployeringar
- Integrera azd-deployeringar med CI/CD-pipelines och DevOps-arbetsflöden

## Läranderesultat

Efter genomförandet kommer du att kunna:
- Köra och felsöka alla azd-deployeringsarbetsflöden självständigt
- Designa och implementera anpassad deployeringsautomatisering med krokar
- Konfigurera produktionsfärdiga deployeringar med korrekt säkerhet och övervakning
- Hantera komplexa multi-miljö deployeringsscenarion
- Optimera deployeringsprestanda och implementera rollback-strategier
- Integrera azd-deployeringar i företags-DevOps-praktiker

## Översikt av deployering

Azure Developer CLI erbjuder flera deployeringskommandon:
- `azd up` - Komplett arbetsflöde (provision + deploy)
- `azd provision` - Skapa/uppdatera Azure-resurser endast
- `azd deploy` - Deployera endast applikationskod
- `azd package` - Bygg och paketera applikationer

## Grundläggande deployeringsarbetsflöden

### Komplett deployering (azd up)
Det vanligaste arbetsflödet för nya projekt:
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

### Endast infrastrukturdeployering
När du bara behöver uppdatera Azure-resurser:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Endast koddeployering
För snabba applikationsuppdateringar:
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

### ✅ Verifiering av deployering

Efter varje deployering, verifiera framgång:

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

**Framgångskriterier:**
- ✅ `azd show` löser förväntade tjänstmål/URL:er
- ✅ Förfrågningar till faktiska applikationsrutter returnerar förväntad status och body
- ✅ Inga fel-loggar de senaste 5 minuterna
- ✅ Applikationen svarar på testförfrågningar

## 🏗️ Förstå deployeringsprocessen

### Ny på krokar? Börja här

En **krok** är ett kommando som azd kör automatiskt vid en specifik tidpunkt i deployeringsprocessen – före eller efter provisionering, och före eller efter att koden deployeras. De låter dig automatisera de små sysslor som alltid omger en deployering: fylla databasen, köra migrationer, bygga resurser eller göra röktester på den live-appen.

| Krok | Körs… | Vanligt användningsområde |
|------|-------|------------|
| `preprovision` | Innan resurser skapas | Validera förutsättningar, logga in i ett register |
| `postprovision` | Efter att resurser finns | Konfigurera resurser, sätt upp databasen |
| `predeploy` | Innan kod deployeras | Bygg front-end resurser, kör enhetstester |
| `postdeploy` | Efter att koden är live | Kör DB-migrationer, röktesta endpoint |

Krokar finns i din `azure.yaml`. Här är det minsta möjliga exemplet – det skriver bara ut ett meddelande efter deployering:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Det är allt – nästa gång du kör `azd up` skrivs meddelandet ut automatiskt. Du kan också köra en krok ensam, utan full deployering, vilket är perfekt för testning:

```bash
azd hooks run postdeploy
```

Faserna nedan visar verkliga krokar (migrationer, tester, validering) för varje steg.

### Fas 1: Före-provisioneringskrokar
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

### Fas 2: Infrastrukturprovisionering
- Läser infrastruktursmallar (Bicep/Terraform)
- Skapar eller uppdaterar Azure-resurser
- Konfigurerar nätverk och säkerhet
- Sätter upp övervakning och loggning

### Fas 3: Efter-provisioneringskrokar
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

### Fas 4: Applikationspaketering
- Bygger applikationskod
- Skapar deployeringsartefakter
- Paketerar för målplattform (containers, ZIP-filer, etc.)

### Fas 5: Före-deploy-krokar
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

### Fas 6: Applikationsdeployering
- Deployar paketerade applikationer till Azure-tjänster
- Uppdaterar konfigurationsinställningar
- Startar/omstartar tjänster

### Fas 7: Efter-deploy-krokar
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

### Hantering av krokfel

Som standard, **om ett krokkommando avslutas med en icke-noll kod, stoppar azd hela operationen.** Det är vanligtvis önskat – en misslyckad migration bör stoppa deployeringen, inte skicka ut en trasig app. Men det innebär att krokar måste skrivas noggrant.

**1. Gör fel högljudda och avsiktliga.** En krok misslyckas när dess sista kommando returnerar en icke-noll exitkod. I shell-skript, lägg till `set -e` så kroken avbryts vid första misslyckade kommando istället för att tyst fortsätta:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Tillåt att en krok misslyckas utan att stoppa azd.** För icke-kritiska steg (en valfri cache-uppvärmning, ett försök till notifiering), ställ in `continueOnError: true`. azd loggar felet men fortsätter:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testa krokar isolerat innan full körning.** Du behöver inte köra `azd up` för att felsöka en krok — kör den ensam och iterera snabbt:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Var uppmärksam på OS-specifika shell.** En krok som använder `shell: pwsh` kräver PowerShell installerat på maskinen som kör den (inklusive CI-agenter). Använd `shell: sh` för bredast portabilitet, eller tillhandahåll både `windows` och `posix` varianter:

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

> **Felsökningstips:** kör vilket azd-kommando som helst med `--debug` för att se exakt krokkommando och dess fulla utdata – ovärderligt när en krok fungerar lokalt men misslyckas i CI.

## 🎛️ Deployeringskonfiguration

### Tjänstespecifika deployeringsinställningar
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

### Miljö-specifika konfigurationer

Dessa är endast lokala azd-värden. Kartlägg dem explicit till infrastruktur/runtime-konfiguration. `NODE_ENV` är normalt `production` för en distribuerad Node-app, inklusive staging-deployering; använd en separat app-specifik variabel för att skilja deployment-steg.

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

## 🔧 Avancerade deployeringsscenarion

### Multi-tjänstapplikationer
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

### Blå-gröna deployeringar

**Illustrativ operativ skiss:** du måste tillhandahålla båda miljöerna, ett delat trafikstyrningslager och nedanstående två skript. azd växlar inte trafik eller validerar rollback-beredskap automatiskt. Behåll grön tills blå har passerat testning och rollback inte längre behövs.

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

### Canary-deployeringar
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Trafikdelning hör hemma i Container Apps-konfiguration (Bicep eller Azure CLI), inte i en `azure.yaml` `trafficSplit`-egenskap. Förhandsgranskning/provisionering och senare deployeringar måste bevara vald revisionsläge och routningsregler.

### Stegade deployeringar
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

## 🐳 Containerdeployeringar

### Container App-deployeringar
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

Konfigurera runtime-hemligheter med `configuration.secrets`/`secretRef` (eller Key Vault-referenser) och skalning med `template.scale` i Container App-infrastrukturen. Uppfinna inte tjänstenivå-`secrets` eller `scale`-egenskaper i `azure.yaml`.

### Multi-stege Dockerfile-optimering
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

## ⚡ Prestandaoptimering

### Tjänstespecifika deployeringar
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Byggcache
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Det standard Node-arbetsflödet använder paket-skript; tjänste-`prepackage`-krokar kan lägga till nödvändiga steg. Docker-lager-cache är separerad från definition av tjänstebyggkommando.

### Effektiva koddeployeringar
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Deployeringövervakning

### Realtidsövervakning av deployering
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Hälsokontroller
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

Din app måste implementera `/health`; det tillhandahålls inte automatiskt av azd. Det finns ingen generisk `azure.yaml` `healthCheck`-tjänstegenskap.

### Validering efter deployering
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

## 🔐 Säkerhetsöverväganden

### Hantering av hemligheter
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` är ogiltig. Vanliga miljövärden är lokala i klartext; anta inte att läskommandon maskerar dem. Kommandona ovan sparar Key Vault-referenser, men din infrastruktur/applikation måste fortfarande konsumera hemligheterna och bevilja runtime-identitetsåtkomst.

### Nätverkssäkerhet
Deklarera och konsumera nätverksparametrar i Bicep, och kartlägg dem i `infra/main.parameters.json`. Det finns ingen generisk `infra.parameters`-overlay i `azure.yaml`. Exempeldokumentationens intervaller `203.0.113.0/24` och `198.51.100.0/24` är inte riktiga kontors-/VPN-nätverk; byt ut dem mot auktoriserade nätverksintervall.

### Identitets- och åtkomsthantering
Aktivera Container App:s `identity` i Bicep och tilldela nödvändig Key Vault data-plane-roll på vault-omfånget. Konfigurera namngivna Key Vault-backade hemligheter och runtime-referenser i den resursen; `identity` och `keyVault` är inte generiska azd-tjänsteegenskaper. Se [Autentisering & Hanterad identitet](../chapter-03-configuration/authsecurity.md).

## 🚨 Rollback-strategier

### Snabb rollback
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

### Infrastruktur rollback
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Databas-migration rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployeringsmått

### Spåra deployeringsprestanda
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Anpassad måttinsamling
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

## 🎯 Bästa praxis

### 1. Miljökonsistens
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastrukturvalidering
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Testintegrering
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

### 4. Dokumentation och loggning
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nästa steg

- [Resursprovisionering](provisioning.md) - Djupdykning i infrastrukturhantering
- [Planering före deployering](../chapter-06-pre-deployment/capacity-planning.md) - Planera din deployeringsstrategi
- [Vanliga problem](../chapter-07-troubleshooting/common-issues.md) - Lös deployeringsproblem
- [Bästa praxis](../chapter-07-troubleshooting/debugging.md) - Produktionsfärdiga deployeringsstrategier

## 🎯 Praktiska deployeringsövningar

### Övning 1: Inkrementellt deployeringsarbetsflöde (20 minuter)
**Mål**: Bemästra skillnaden mellan full och inkrementell deployering

**Utgångspunkt:** Bash, Node.js 22, Git, azd-inloggning och ett Azure-abonnemang med deployeringsbehörigheter. Kör i en ny katalog; räkna med debiterbara App Service/Cosmos DB-resurser. Tider beror på region och mall.

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

**Framgångskriterier:**
- [ ] Spela in förfluten tid för båda kommandona (ingen garanterad varaktighet)
- [ ] Båda kommandona slutförs framgångsrikt
- [ ] API förblir funktionell; kommentarredigering är ingen synlig UI-förändring
- [ ] Infrastruktur oförändrad efter `azd deploy`

**Läranderesultat**: `azd deploy` hoppar över infrastruktursprovisionering. Jämför uppmätta tider istället för att anta en fast procentuell förbättring.

### Övning 2: Anpassade deployeringskrokar (30 minuter)
**Mål**: Implementera automatisering före och efter deployering

**Utgångspunkt:** det initierade projektet `deployment-practice` ovan. Om du städade upp det, kör `azd up` igen innan du testar kodendeplyering. Valideringen nedan använder API:ets faktiska byggskript, inte ett icke-existerande root `test:unit`-skript. Mallens API-tester kräver konfigurerad databastillgång; de är inte isolerade enhetstester.

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

**Framgångskriterier:**
- [ ] Pre-deploy-skript körs före deployering
- [ ] Deployering avbryts om byggvalidering misslyckas
- [ ] Post-deploy-röktest validerar hälsa
- [ ] Krokar körs i korrekt ordning

### Övning 3: Multi-miljö deployeringsstrategi (45 minuter)
**Mål**: Implementera stegvis deployeringsarbetsflöde (dev → staging → produktion)

**Utgångspunkt:** samma initialiserade todo-projekt med `jq`. Skapa miljöerna nedan med riktiga prenumerations-/platsvärden (eller ange `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` i varje) **innan** du anropar arbetsflödet utan prompt. Det misslyckas medvetet istället för att uppfinna saknade värden. Använd endast förbrukningsbara träningsmiljöer, inte en faktisk produktionsprenumeration.

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

**Godkännandekriterier:**
- [ ] Dev-miljön distribueras framgångsrikt
- [ ] Staging-miljön distribueras framgångsrikt
- [ ] Manuellt godkännande krävs för produktion
- [ ] Alla miljöer har fungerande hälsokontroller
- [ ] Kan göra rollback vid behov

### Övning 4: Rollback-strategi (25 minuter)
**Mål**: Implementera och testa rollback av distribution med Git

**Utgångspunkt:** en isolerad träningsutcheckning av todo-mallen med all grundläggande källkod committad, en ren Git-arbetskatalog och en förbrukningsbar konfigurerad miljö. Inför aldrig avsiktliga fel i ett verkligt produktionsprojekt. `APP_VERSION` nedan är bara bokföring om du inte uttryckligen kopplar in den i appen.

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

**Godkännandekriterier:**
- [ ] Kan upptäcka distributionsfel
- [ ] Rollback-skript körs automatiskt
- [ ] Applikationen återgår till fungerande tillstånd
- [ ] Hälsokontroller går igenom efter rollback

## 📊 Spåra distributionsmått

### Spåra din distributionsprestanda

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

**Analysera dina mått:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ytterligare resurser

- [Azure Developer CLI-distribution Referens](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service-distribution](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps-distribution](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions-distribution](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigering**
- **Föregående lektion**: [Ditt första projekt](../chapter-01-foundation/first-project.md)
- **Nästa lektion**: [Resursberedning](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->