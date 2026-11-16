# Udrulningsvejledning - Mestring af AZD Udrulninger

**Kapitelnavigation:**
- **📚 Kursus Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 4 - Infrastruktur som kode & udrulning
- **⬅️ Forrige Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Næste**: [Provisionering af Ressourcer](provisioning.md)
- **🧩 Også i dette kapitel**: [Forfat din egen Skabelon](custom-templates.md)
- **🚀 Næste Kapitel**: [Kapitel 5: Multi-Agent AI Løsninger](../../examples/retail-scenario.md)

## Introduktion

> Gennemgået mod `azd 1.37.2` (november 2026). Kommandoer bruger Bash; JSON-eksempler kræver `jq`. Bortset fra den eksplicit initialiserede todo-øvelse er avancerede eksempler **integrationsfragmenter**: lever din egen kilde, infrastruktur, tests og scripts. Ingen Azure-udrulninger blev udført i denne gennemgang.

Denne omfattende vejledning dækker alt, du behøver at vide om at udrulle applikationer ved hjælp af Azure Developer CLI, fra grundlæggende udrulninger med en enkelt kommando til avancerede produktionsscenarier med brugerdefinerede hooks, flere miljøer og CI/CD-integration. Mestre hele udrulningslivscyklussen med praktiske eksempler og bedste praksis.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Mestre alle Azure Developer CLI udrulningskommandoer og workflows
- Forstå hele udrulningslivscyklussen fra provisionering til overvågning
- Implementere brugerdefinerede udrulningshooks til pre- og post-udrulningsautomatisering
- Konfigurere flere miljøer med miljøspecifikke parametre
- Opsætte avancerede udrulningsstrategier, herunder blue-green og canary udrulninger
- Integrere azd-udrulninger med CI/CD pipelines og DevOps workflows

## Læringsresultater

Når du er færdig, vil du kunne:
- Udføre og fejlfinde alle azd udrulningsworkflows selvstændigt
- Designe og implementere brugerdefineret udrulningsautomatisering ved hjælp af hooks
- Konfigurere produktionsklare udrulninger med korrekt sikkerhed og overvågning
- Administrere komplekse multi-miljø udrulningsscenarier
- Optimere udrulningsydelse og implementere rollback-strategier
- Integrere azd udrulninger i virksomheds-DevOps-praksis

## Oversigt over Udrulning

Azure Developer CLI tilbyder flere udrulningskommandoer:
- `azd up` - Komplett workflow (provision + deploy)
- `azd provision` - Opret/opdater kun Azure-ressourcer
- `azd deploy` - Udrul kun applikationskode
- `azd package` - Byg og pak applikationer

## Grundlæggende Udrulningsworkflows

### Komplett Udrulning (azd up)
Det mest almindelige workflow for nye projekter:
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

### Infrastruktur-Only Udrulning
Når du kun skal opdatere Azure-ressourcer:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Kode-Only Udrulning
Til hurtige applikationsopdateringer:
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

### ✅ Verifikation af Udrulning

Efter enhver udrulning skal succes verificeres:

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

**Succes kriterier:**
- ✅ `azd show` løser forventede servicemål/URL’er
- ✅ Forespørgsler til faktiske applikationsruter returnerer forventet status og krop
- ✅ Ingen fejllogs i de sidste 5 minutter
- ✅ Applikationen svarer på test-forespørgsler

## 🏗️ Forstå Udrulningsprocessen

### Ny til hooks? Start her

En **hook** er en kommando, som azd automatisk kører på et bestemt tidspunkt i udrulningsprocessen—før eller efter provisionering, og før eller efter at din kode er udrullet. De lader dig automatisere de små opgaver, der altid omgiver en udrulning: at indlæse data i en database, køre migrationer, bygge assets eller smoke-teste den live app.

| Hook | Kører… | Almindelig anvendelse |
|------|---------|-----------------------|
| `preprovision` | Før ressourcer oprettes | Validér forudsætninger, log ind på et register |
| `postprovision` | Efter ressourcer eksisterer | Konfigurer ressourcer, opsæt databasen |
| `predeploy` | Før kode udrulles | Byg front-end assets, kør unit tests |
| `postdeploy` | Efter kode er live | Kør DB migrationer, smoke-test endpointet |

Hooks lever i din `azure.yaml`. Her er det mindste mulige eksempel—det printer bare en besked efter udrulning:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Det var det—næste gang du kører `azd up`, printer beskeden automatisk. Du kan også køre en hook alene uden en fuld udrulning, hvilket er fantastisk til test:

```bash
azd hooks run postdeploy
```

Faserne nedenfor viser virkelighedstro hooks (migrationer, tests, validering) for hver fase.

### Fase 1: Pre-Provision Hooks
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

### Fase 2: Infrastruktur Provisionering
- Læser ind infrastructure templates (Bicep/Terraform)
- Opretter eller opdaterer Azure-ressourcer
- Konfigurerer netværk og sikkerhed
- Opsætter overvågning og logning

### Fase 3: Post-Provision Hooks
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

### Fase 4: Applikationspakning
- Bygger applikationskode
- Opretter udrulningsartefakter
- Pakker til målplatform (containere, ZIP-filer osv.)

### Fase 5: Pre-Deploy Hooks
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

### Fase 6: Applikationsudrulning
- Udruller pakkede applikationer til Azure-tjenester
- Opdaterer konfigurationsindstillinger
- Starter/genstarter tjenester

### Fase 7: Post-Deploy Hooks
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

### Håndtering af Hook-Fejl

Som standard **stopper azd hele operationen, hvis en hook-kommando afsluttes med en ikke-nul kode.** Det er normalt det ønskede—en mislykket migration skal stoppe udrulningen, ikke sende en ødelagt app af sted. Men det betyder, at hooks skal skrives med omhu.

**1. Gør fejl hørlige og tilsigtede.** En hook fejler, når dens sidste kommando returnerer en ikke-nul exit-kode. I shell-scripts, tilføj `set -e` så hooken stopper ved den første fejlende kommando i stedet for at fortsætte stille:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Tillad, at en hook fejler uden at stoppe azd.** For ikke-kritiske trin (et valgfrit cache-opvarmning, en bestræbelses-notifikation), sæt `continueOnError: true`. azd logger fejlen men fortsætter:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Test hooks isoleret før fuld kørsel.** Du behøver ikke køre `azd up` for at fejlfinde en hook—kør den alene og iterér hurtigt:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Pas på OS-specifikke shells.** En hook, der bruger `shell: pwsh`, kræver PowerShell installeret på maskinen, der kører den (inklusive CI-agenter). Brug `shell: sh` for bredest mulig portabilitet, eller stil både `windows` og `posix` varianter til rådighed:

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

> **Fejlsøgnings-tip:** kør enhver azd-kommando med `--debug` for at se den eksakte hook-kommando og dens fulde output—uvurderligt når en hook virker lokalt men fejler i CI.

## 🎛️ Udrulningskonfiguration

### Service-Specifikke Udrulningsindstillinger
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

### Miljøspecifikke Konfigurationer

Disse er kun lokale azd-værdier. Map dem eksplicit til infrastruktur/runtime-konfiguration. `NODE_ENV` er normalt `production` for en udrullet Node-app, inklusive staging-udrulning; brug en separat app-specifik variabel til at skelne udrulningsstadier.

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

## 🔧 Avancerede Udrulningsscenarier

### Multi-Service Applikationer
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

### Blue-Green Udrulninger

**Illustrativ operationel skitse:** du skal levere begge miljøer, et delt trafikstyrelseslag og de to scripts nedenfor. azd skifter ikke trafik eller validerer rollback parathed automatisk. Behold grøn indtil blå har bestået test og rollback ikke længere er nødvendig.

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

### Canary Udrulninger
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Trafikdeling hører til Container Apps-konfig, (Bicep eller Azure CLI), ikke en `azure.yaml` `trafficSplit` egenskab. Preview/provisionering og senere udrulninger skal bevare dit valgte revisionsmode og routing-regler.

### Trinvise Udrulninger
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

## 🐳 Container Udrulninger

### Container App Udrulninger
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

Konfigurer runtime-hemmeligheder med `configuration.secrets`/`secretRef` (eller Key Vault-referencer) og skalering med `template.scale` i Container App-infrastruktur. Find ikke på service-niveau `secrets` eller `scale` egenskaber i `azure.yaml`.

### Multi-Stage Dockerfile Optimering
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

## ⚡ Ydelsesoptimering

### Service-Specifikke Udrulninger
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Build Caching
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standard Node-workflow bruger pakkescripts; service `prepackage` hooks kan tilføje nødvendige trin. Docker lag-caching er adskilt fra definition af en service build-kommando.

### Effektive Kodeudrulninger
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Udrulningsovervågning

### Realtids Udrulningsovervågning
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Helbredstjek
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

Din app skal implementere `/health`; den leveres ikke automatisk af azd. Der findes ikke en generisk `azure.yaml` `healthCheck` service-egenskab.

### Post-Udrulnings Validering
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

## 🔐 Sikkerhedshensyn

### Håndtering af Hemmeligheder
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` er ugyldig. Almindelige miljøværdier er lokale almindelig tekst; antag ikke at læse-kommandoer redigerer dem ud. Kommandoerne ovenfor gemmer Key Vault-referencer, men din infrastruktur/applikation skal stadig bruge hemmelighederne og give runtime identities adgang.

### Netværkssikkerhed
Deklarér og brug netværksparametre i Bicep, og map dem i `infra/main.parameters.json`. Der findes ikke generisk `infra.parameters` overlay i `azure.yaml`. Eksempel dokumentationsområderne `203.0.113.0/24` og `198.51.100.0/24` er ikke ægte kontor-/VPN-netværk; udskift dem med autoriserede netværksområder.

### Identitets- og adgangsstyring
Aktiver Container App's `identity` i Bicep og tildel den nødvendige Key Vault dataplanelrolle i vault-omfanget. Konfigurer navngivne Key Vault-støttede hemmeligheder og runtime-referencer i denne ressource; `identity` og `keyVault` er ikke generiske azd service-egenskaber. Se [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Rollback Strategier

### Hurtig Rollback
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

### Infrastruktur Rollback
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Udrulningsmetrics

### Følg Udrulningsydelse
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Brugerdefineret Metrics Indsamling
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

## 🎯 Bedste Praksis

### 1. Miljøkonsistens
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktur Validering
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Testintegration
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

### 4. Dokumentation og Logning
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Næste Skridt

- [Provisionering af Ressourcer](provisioning.md) - Dyk ned i infrastrukturstyring
- [Pre-Udrulnings Planlægning](../chapter-06-pre-deployment/capacity-planning.md) - Planlæg din udrulningsstrategi
- [Almindelige Problemer](../chapter-07-troubleshooting/common-issues.md) - Løs udrulningsproblemer
- [Bedste Praksis](../chapter-07-troubleshooting/debugging.md) - Produktionsklare udrulningsstrategier

## 🎯 Praktiske Udrulningsøvelser

### Øvelse 1: Inkrementelt Udrulningsworkflow (20 minutter)
**Mål**: Mestre forskellen mellem fuld og inkrementel udrulning

**Startpunkt:** Bash, Node.js 22, Git, azd sign-in og et Azure-abonnement med udrulningstilladelser. Kør i en ny mappe; forbered på fakturerbare App Service/Cosmos DB ressourcer. Tidspunkter afhænger af region og skabelon.

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

**Succes kriterier:**
- [ ] Registrer forløbet tid for begge kommandoer (der er ingen garanteret varighed)
- [ ] Begge kommandoer fuldfører med succes
- [ ] API’en forbliver funktionel; kommentaret redigeringen er ikke en synlig UI-ændring
- [ ] Infrastruktur uændret efter `azd deploy`

**Læringsresultat**: `azd deploy` springer infrastrukturprovisionering over. Sammenlign målte tider fremfor at antage en fast procentvis hastighedsforøgelse.

### Øvelse 2: Brugerdefinerede Udrulningshooks (30 minutter)
**Mål**: Implementer pre- og post-udrulningsautomatisering

**Startpunkt:** det initialiserede `deployment-practice` projekt ovenfor. Hvis du har ryddet op i det, kør `azd up` igen før test af kode-only udrulning. Valideringen nedenfor bruger API’ens faktiske build script, ikke et ikke-eksisterende root `test:unit` script. Skabelonens API-tests kræver konfigureret databaseadgang; de er ikke isolerede enhedstests.

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

**Succes kriterier:**
- [ ] Pre-udrulningsscript kører før udrulning
- [ ] Udrulning afbrydes, hvis build-validering fejler
- [ ] Post-udrulnings smoke-test validerer sundhedstilstand
- [ ] Hooks kører i korrekt rækkefølge

### Øvelse 3: Multi-Miljø Udrulningsstrategi (45 minutter)
**Mål**: Implementer trinvist udrulningsworkflow (dev → staging → produktion)

**Udgangspunkt:** det samme initialiserede todo-projekt med `jq`. Opret nedenstående miljøer med rigtige abonnement-/lokationsværdier (eller sæt `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` i hver) **før** du kalder workflowet uden prompt. Det fejler med vilje i stedet for at opfinde manglende værdier. Brug kun engangsmiljøer til træning, ikke et faktisk produktionsabonnement.

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

**Succes kriterier:**
- [ ] Dev-miljøet deployer succesfuldt
- [ ] Staging-miljøet deployer succesfuldt
- [ ] Manuel godkendelse kræves til produktion
- [ ] Alle miljøer har fungerende helbredstjek
- [ ] Kan rulle tilbage hvis nødvendigt

### Øvelse 4: Tilbageførselsstrategi (25 minutter)
**Mål**: Implementer og test backout af deployment ved hjælp af Git

**Udgangspunkt:** en isoleret trænings-udtjekning af todo-skabelonen med al baseline-kode committet, et rent Git-arbejdsområde og et engangskonfigureret miljø. Indfør aldrig bevidste fejl i et reelt produktionsprojekt. `APP_VERSION` nedenfor er kun bogføring medmindre du eksplicit kobler det ind i appen.

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

**Succes kriterier:**
- [ ] Kan opdage deploymentsfejl
- [ ] Tilbageførsels-script kører automatisk
- [ ] Applikationen vender tilbage til fungerende tilstand
- [ ] Helbredstjek bestås efter tilbageførsel

## 📊 Overvågning af deploymentsmålinger

### Overvåg din deployments ydeevne

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

**Analyser dine målinger:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Yderligere ressourcer

- [Azure Developer CLI Deployments Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Forrige lektion**: [Dit første projekt](../chapter-01-foundation/first-project.md)
- **Næste lektion**: [Provisionering af ressourcer](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->