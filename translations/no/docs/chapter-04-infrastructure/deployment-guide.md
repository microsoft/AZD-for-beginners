# Distribusjonsveiledning - Mestre AZD-distribusjoner

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD for nybegynnere](../../README.md)
- **📖 Gjeldende kapittel**: Kapittel 4 - Infrastruktur som kode og distribusjon
- **⬅️ Forrige kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)
- **➡️ Neste**: [Tilrettelegging av ressurser](provisioning.md)
- **🧩 Også i dette kapittelet**: [Lage din egen mal](custom-templates.md)
- **🚀 Neste kapittel**: [Kapittel 5: Multi-agent AI-løsninger](../../examples/retail-scenario.md)

## Introduksjon

> Gjennomgått med `azd 1.37.2` (november 2026). Kommandoer bruker Bash; JSON-eksempler krever `jq`. Bortsett fra den eksplisitte initierte todo-oppgaven, er avanserte eksempler **integrasjonsfragmenter**: lever din egen kilde, infrastruktur, tester og skript. Ingen Azure-distribusjoner ble utført under denne gjennomgangen.

Denne omfattende veiledningen dekker alt du trenger å vite om å distribuere applikasjoner med Azure Developer CLI, fra grunnleggende enkeltkommando-distribusjoner til avanserte produksjonsscenarier med egendefinerte kroker, flere miljøer og CI/CD-integrasjon. Mestre hele distribusjonslivssyklusen med praktiske eksempler og beste praksis.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre alle Azure Developer CLI distribusjonskommandoer og arbeidsflyter
- Forstå hele distribusjonslivssyklusen fra tilrettelegging til overvåking
- Implementere egendefinerte distribusjonskroker for automatisering før og etter distribusjon
- Konfigurere flere miljøer med miljøspesifikke parametere
- Sette opp avanserte distribusjonsstrategier inkludert blå-grønn og canary-distribusjoner
- Integrere azd distribusjoner med CI/CD-pipelines og DevOps-arbeidsflyter

## Læringsutbytte

Når du er ferdig, vil du kunne:
- Utføre og feilsøke alle azd distribusjonsarbeidsflyter selvstendig
- Designe og implementere egendefinert distribusjonsautomatisering med kroker
- Konfigurere produksjonsklare distribusjoner med korrekt sikkerhet og overvåking
- Håndtere komplekse distribusjonsscenarier med flere miljøer
- Optimalisere distribusjonsytelse og implementere tilbakefallsstrategier
- Integrere azd distribusjoner i bedrifts-DevOps-praksis

## Oversikt over distribusjon

Azure Developer CLI gir flere distribusjonskommandoer:
- `azd up` - Fullstendig arbeidsflyt (tilrettelegge + distribuere)
- `azd provision` - Opprett/oppdater kun Azure-ressurser
- `azd deploy` - Distribuer kun applikasjonskode
- `azd package` - Bygg og pakk applikasjoner

## Grunnleggende distribusjonsarbeidsflyter

### Fullstendig distribusjon (azd up)
Den mest brukte arbeidsflyten for nye prosjekter:
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

### Kun infrastruktur-distribusjon
Når du bare trenger å oppdatere Azure-ressurser:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Kun kode-distribusjon
For raske applikasjonsoppdateringer:
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

### ✅ Verifisering av distribusjon

Etter en hvilken som helst distribusjon, verifiser suksess:

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

**Kriterier for suksess:**
- ✅ `azd show` løser forventede tjenestemål/URLer
- ✅ Forespørsler til faktiske applikasjonsruter returnerer forventet status og innhold
- ✅ Ingen feil logger de siste 5 minuttene
- ✅ Applikasjonen responderer på testforespørsler

## 🏗️ Forstå distribusjonsprosessen

### Ny til kroker? Start her

En **krok** er en kommando azd kjører automatisk på et bestemt tidspunkt i distribusjonsprosessen—før eller etter tilrettelegging, og før eller etter at koden distribueres. De lar deg automatisere små oppgaver som alltid følger med en distribusjon: fylle en database, kjøre migrasjoner, bygge ressurser eller røykteste den live appen.

| Krok | Kjører… | Vanlig bruk |
|------|-------|------------|
| `preprovision` | Før ressurser opprettes | Validere forhåndskrav, logge inn på et register |
| `postprovision` | Etter ressurser eksisterer | Konfigurere ressurser, sette opp databasen |
| `predeploy` | Før kode distribueres | Bygge front-end ressurser, kjøre enhetstester |
| `postdeploy` | Etter kode er live | Kjøre DB-migrasjoner, røykteste endepunktet |

Kroker ligger i din `azure.yaml`. Her er det minste mulige eksempelet—det skriver bare ut en melding etter distribusjon:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Det er det—neste gang du kjører `azd up`, skrives meldingen ut automatisk. Du kan også kjøre en krok alene, uten full distribusjon, noe som er nyttig for testing:

```bash
azd hooks run postdeploy
```

Faser nedenfor viser virkelige kroker (migrasjoner, tester, validering) for hver fase.

### Fase 1: Pre-tilretteleggingskroker
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

### Fase 2: Infrastrukturtilrettelegging
- Leser infrastrukturmaler (Bicep/Terraform)
- Oppretter eller oppdaterer Azure-ressurser
- Konfigurerer nettverk og sikkerhet
- Setter opp overvåking og logging

### Fase 3: Post-tilretteleggingskroker
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

### Fase 4: Applikasjonspakking
- Bygger applikasjonskode
- Lager distribusjonsartefakter
- Pakker for målplattform (containere, ZIP-filer, osv.)

### Fase 5: Pre-distribusjonskroker
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

### Fase 6: Applikasjonsdistribusjon
- Distribuerer pakkede applikasjoner til Azure-tjenester
- Oppdaterer konfigurasjonsinnstillinger
- Starter/omstarter tjenester

### Fase 7: Post-distribusjonskroker
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

### Håndtering av krokfeil

Som standard, **hvis en krok-kommando avsluttes med en ikke-null kode, stopper azd hele operasjonen.** Dette er vanligvis ønsket—en mislykket migrasjon skal stoppe distribusjonen, ikke sende ut en ødelagt app. Men det betyr at kroker må skrives med omhu.

**1. Gjør feil tydelige og bevisste.** En krok feiler når siste kommando gir en ikke-null avslutningskode. I shell-skript, legg til `set -e` slik at kroken stopper ved første feilkommando i stedet for å fortsette stille:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Tillat at en krok feiler uten å stoppe azd.** For ikke-kritiske steg (valgfri cache-oppvarming, en best-effort varsling), sett `continueOnError: true`. azd logger feilen men fortsetter:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Test kroker isolert før full kjøring.** Du trenger ikke kjøre `azd up` for å feilsøke en krok—kjør den alene og iterer raskt:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Vær oppmerksom på operativsystem-spesifikke shell.** En krok som bruker `shell: pwsh` trenger at PowerShell er installert på maskinen som kjører den (inkludert CI- agenter). Bruk `shell: sh` for størst portabilitet, eller tilby både `windows` og `posix` varianter:

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

> **Feilsøkningstips:** kjør hvilken som helst azd-kommando med `--debug` for å se den eksakte krok-kommandoen og dens fulle utdata—uvurderlig når en krok fungerer lokalt men feiler i CI.

## 🎛️ Distribusjonskonfigurasjon

### Tjenestespesifikke distribusjonsinnstillinger
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

### Miljøspesifikke konfigurasjoner

Dette er lokale azd-verdier kun. Kartlegg dem eksplisitt til infrastruktur-/kjøreconfiguration. `NODE_ENV` er normalt `production` for en distribuert Node-app, inkludert en staging-distribusjon; bruk en separat app-spesifikk variabel for å skille distribusjonstrinn.

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

## 🔧 Avanserte distribusjonsscenarier

### Multi-tjeneste applikasjoner
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

### Blå-grønn distribusjon

**Illustrerende operasjonsskisse:** du må levere begge miljøene, et delt trafikkdirigeringslag og de to skriptene nedenfor. azd bytter ikke trafikk eller validerer rollback-klarhet automatisk. Behold grønn til blå har bestått testing og rollback ikke lenger trengs.

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

### Canary distribusjoner
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Trafikkdeling hører hjemme i Container App-konfigurasjonen (Bicep eller Azure CLI), ikke som et `azure.yaml` `trafficSplit`-egenskap i azd. Forhåndsvisning/tilrettelegging og senere distribusjoner må bevare valgt revisjonsmodus og dirigeringregler.

### Fasedistribusjoner
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

## 🐳 Kontainer-distribusjoner

### Container App-distribusjoner
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

Konfigurer kjørehemmeligheter med `configuration.secrets`/`secretRef` (eller Key Vault-referanser) og skalering med `template.scale` i Container App-infrastrukturen. Ikke finurl på tjenestenivå `secrets` eller `scale`-egenskaper i `azure.yaml`.

### Multi-trinns Dockerfile-optimalisering
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

## ⚡ Ytelsesoptimalisering

### Tjenestespesifikke distribusjoner
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Bygge-cachelagring
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standard Node-arbeidsflyt bruker pakkeskript; tjenestens `prepackage`-kroker kan legge til nødvendige steg. Docker-layers caching er separat fra definisjon av tjenestebyggkommando.

### Effektiv kode-distribusjon
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Distribusjonsovervåking

### Sanntidsovervåking av distribusjon
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Helsesjekker
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

Appen må implementere `/health`; den leveres ikke automatisk av azd. Det finnes ingen generell `azure.yaml` `healthCheck` tjenesteeieigenskap.

### Validering etter distribusjon
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

## 🔐 Sikkerhetshensyn

### Hemmelighetshåndtering
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` er ugyldig. Vanlige miljøvariabler er lokal klartekst; anta ikke at lesekommandoer redigerer dem. Kommandoene ovenfor lagrer Key Vault-referanser, men infrastrukturen/applikasjonen må fortsatt konsumere hemmelighetene og gi kjøreidentitet tilgang.

### Nettverkssikkerhet
Definer og bruk nettverksparametere i Bicep, og kartlegg dem i `infra/main.parameters.json`. Det finnes ingen generell `infra.parameters` overlay i `azure.yaml`. Eksempeldokumentasjonens rekkevidder `203.0.113.0/24` og `198.51.100.0/24` er ikke ekte kontor- eller VPN-nettverk; erstatt dem med autoriserte nettverksområder.

### Identitets- og tilgangsstyring
Aktiver Container Apps `identity` i Bicep og tildel nødvendig Key Vault datatilgangsrolle på vault-nivå. Konfigurer navngitte Key Vault-støttede hemmeligheter og kjørereferanser i den ressursen; `identity` og `keyVault` er ikke generelle azd-tjenesteeiendommer. Se [Autentisering og administrert identitet](../chapter-03-configuration/authsecurity.md).

## 🚨 Tilbakefallsstrategier

### Rask tilbakefall
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

### Infrastruktur-tilbakefall
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Tilbakefall av databasemigrasjon
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Distribusjonsmålinger

### Følg distribusjonsytelse
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Tilpasset målingsinnsamling
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

## 🎯 Beste praksis

### 1. Miljøkonsistens
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

### 3. Testingintegrasjon
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

### 4. Dokumentasjon og logging
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Neste steg

- [Tilrettelegging av ressurser](provisioning.md) - Dypdykk i infrastrukturhåndtering
- [Forhåndsplanlegging av distribusjon](../chapter-06-pre-deployment/capacity-planning.md) - Planlegg distribusjonsstrategien din
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md) - Løs distribusjonsproblemer
- [Beste praksis](../chapter-07-troubleshooting/debugging.md) - Produksjonsklare distribusjonsstrategier

## 🎯 Praktiske distribusjonsøvelser

### Øvelse 1: Trinnvis distribusjonsarbeidsflyt (20 minutter)
**Mål**: Mestre forskjellen mellom full og trinnvis distribusjon

**Startpunkt:** Bash, Node.js 22, Git, azd pålogging, og et Azure-abonnement med distribusjonstillatelser. Kjør i en ny katalog; forvent fakturerbare App Service/Cosmos DB ressurser. Tider avhenger av region og mal.

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

**Kriterier for suksess:**
- [ ] Registrer brukt tid for begge kommandoene (ingen garantert varighet)
- [ ] Begge kommandoene fullføres vellykket
- [ ] API forblir funksjonell; redigering kun av kommentar er ikke en synlig UI-endring
- [ ] Infrastruktur uendret etter `azd deploy`

**Læringsutbytte**: `azd deploy` hopper over infrastrukturtilrettelegging. Sammenlign målte tider i stedet for å anta fast prosentvis forenkling.

### Øvelse 2: Egendefinerte distribusjonskroker (30 minutter)
**Mål**: Implementer automatisering før og etter distribusjon

**Startpunkt:** det initierte `deployment-practice` prosjektet ovenfor. Hvis du ryddet det bort, kjør `azd up` på nytt før du tester kode-distribusjon. Valideringen nedenfor bruker APIens faktiske byggeskript, ikke et ikke-eksisterende rot `test:unit`-skript. Malens API-tester trenger konfigurert database-tilgang; de er ikke isolerte enhetstester.

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

**Kriterier for suksess:**
- [ ] Pre-deploy skript kjører før distribusjon
- [ ] Distribusjon avbrytes hvis bygge-validering mislykkes
- [ ] Post-deploy røyktest validerer helse
- [ ] Kroker kjører i riktig rekkefølge

### Øvelse 3: Distribusjonsstrategi for flere miljøer (45 minutter)
**Mål**: Implementer fasedistribusjonsarbeidsflyt (dev → staging → produksjon)

**Startpunkt:** det samme initialiserte todo-prosjektet med `jq`. Opprett miljøene nedenfor med ekte abonnement-/lokasjonsverdier (eller sett `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` i hvert) **før** du kjører arbeidsflyten uten prompt. Den feiler med hensikt i stedet for å finne på manglende verdier. Bruk bare flyktige treningsmiljøer, ikke et faktisk produksjonsabonnement.

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

**Suksesskriterier:**
- [ ] Dev-miljøet distribueres vellykket
- [ ] Staging-miljøet distribueres vellykket
- [ ] Manuell godkjenning kreves for produksjon
- [ ] Alle miljøer har fungerende helsesjekker
- [ ] Kan rulle tilbake ved behov

### Øvelse 4: Tilbakerulingsstrategi (25 minutter)
**Mål**: Implementere og teste tilbakerulling av distribusjon ved bruk av Git

**Startpunkt:** en isolert treningscheckout av todo-malen med all baseline-kode innsendt, et rent Git-arbeidstre, og et flyktig konfigurert miljø. Innfør aldri bevisste feil i et ekte produksjonsprosjekt. `APP_VERSION` nedenfor er kun regnskapsføring med mindre du eksplisitt kobler det inn i appen.

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

**Suksesskriterier:**
- [ ] Kan oppdage distribusjonsfeil
- [ ] Tilbakerullingsskript kjører automatisk
- [ ] Applikasjonen går tilbake til fungerende tilstand
- [ ] Helsesjekker passerer etter tilbakerulling

## 📊 Sporing av distribusjonsmålinger

### Spor distribusjonsytelsen din

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

**Analyser målingene dine:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Tilleggsressurser

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasjon**
- **Forrige leksjon**: [Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **Neste leksjon**: [Provisionering av ressurser](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->