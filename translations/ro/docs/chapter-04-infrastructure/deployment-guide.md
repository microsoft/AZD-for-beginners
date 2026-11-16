# Ghid de implementare - Stăpânirea implementărilor AZD

**Navigare capitol:**
- **📚 Acasă curs**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca Cod & Implementare
- **⬅️ Capitolul anterior**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)
- **➡️ Următorul**: [Procurarea resurselor](provisioning.md)
- **🧩 De asemenea în acest capitol**: [Scrierea propriului șablon](custom-templates.md)
- **🚀 Capitolul următor**: [Capitolul 5: Soluții AI multi-agent](../../examples/retail-scenario.md)

## Introducere

> Revizuit împotriva `azd 1.37.2` (noiembrie 2026). Comenzile folosesc Bash; exemplele JSON necesită `jq`. Cu excepția exercițiului todo explicit inițializat, exemplele avansate sunt **fragmente de integrare**: furnizați sursa, infrastructura, testele și scripturile proprii. Nicio implementare Azure nu a fost executată în această revizuire.

Acest ghid cuprinzător acoperă tot ce trebuie să știți despre implementarea aplicațiilor folosind Azure Developer CLI, de la implementări de bază cu o singură comandă până la scenarii avansate de producție cu cârlige personalizate, mai multe medii și integrare CI/CD. Stăpânește ciclul complet de viață al implementării cu exemple practice și cele mai bune practici.

## Obiective de învățare

Prin parcurgerea acestui ghid, vei:
- Stăpâni toate comenzile și fluxurile de lucru pentru implementarea Azure Developer CLI
- Înțelege ciclul complet de viață al implementării de la procurare până la monitorizare
- Implementa cârlige personalizate pentru automatizarea înainte și după implementare
- Configura mai multe medii cu parametri specifici fiecărui mediu
- Configura strategii avansate de implementare, inclusiv blue-green și canary
- Integra implementările azd cu fluxurile de lucru CI/CD și DevOps

## Rezultate de învățare

La final, vei fi capabil să:
- Execuți și să remediezi toate fluxurile de lucru azd pentru implementare independent
- Proiectezi și implementezi automatizare personalizată a implementării folosind cârlige
- Configurezi implementări gata pentru producție cu securitate și monitorizare corespunzătoare
- Gestionezi scenarii complexe de implementare multi-mediu
- Optimizezi performanța implementării și implementezi strategii de revenire (rollback)
- Integrezi implementările azd în practici DevOps corporative

## Prezentare generală a implementării

Azure Developer CLI oferă mai multe comenzi pentru implementare:
- `azd up` - Flux complet (provisionare + implementare)
- `azd provision` - Creare/actualizare doar resurse Azure
- `azd deploy` - Implementare doar cod aplicație
- `azd package` - Construire și pachetare aplicații

## Fluxuri de lucru de implementare de bază

### Implementare completă (azd up)
Cel mai comun flux pentru proiecte noi:
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

### Implementare doar infrastructură
Când trebuie să actualizezi doar resursele Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Implementare doar cod
Pentru actualizări rapide ale aplicației:
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

### ✅ Verificarea implementării

După orice implementare, verifică succesul:

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

**Criterii de succes:**
- ✅ `azd show` rezolvă țintele/URL-urile serviciului așteptate
- ✅ Cererile către rutele reale ale aplicației returnează statusul și corpul așteptat
- ✅ Fără erori în jurnal în ultimele 5 minute
- ✅ Aplicația răspunde la cererile de test

## 🏗️ Înțelegerea procesului de implementare

### Ești nou în cârlige? Începe aici

Un **cârlig** este o comandă pe care azd o execută automat într-un moment specific al procesului de implementare — înainte sau după procurare, și înainte sau după implementarea codului tău. Ele îți permit să automatizezi micile sarcini care înconjoară întotdeauna o implementare: popularea unei baze de date, rularea migrărilor, construirea resurselor, sau testarea rapidă a aplicației live.

| Cârlig | Rulează… | Utilizare comună |
|------|-------|------------|
| `preprovision` | Înainte ca resursele să fie create | Validarea precondițiilor, autentificare în registru |
| `postprovision` | După ce resursele există | Configurarea resurselor, configurarea bazei de date |
| `predeploy` | Înainte să se implementeze codul | Construirea resurselor front-end, rularea testelor unitare |
| `postdeploy` | După ce codul este live | Rularea migrărilor bazei de date, testare rapidă a endpoint-ului |

Cârligele sunt în `azure.yaml`. Iată cel mai mic exemplu posibil — doar afișează un mesaj după implementare:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Asta este — data viitoare când rulezi `azd up`, mesajul se afișează automat. Poți rula și un cârlig singur, fără o implementare completă, ceea ce este grozav pentru testare:

```bash
azd hooks run postdeploy
```

Faza de mai jos arată cârlige reale (migrări, teste, validare) pentru fiecare etapă.

### Faza 1: Cârlige pre-provisionare
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

### Faza 2: Procurarea infrastructurii
- Citește șabloane de infrastructură (Bicep/Terraform)
- Creează sau actualizează resurse Azure
- Configurează rețeaua și securitatea
- Configurează monitorizarea și jurnalizarea

### Faza 3: Cârlige post-provisionare
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

### Faza 4: Pachetare aplicație
- Construiește codul aplicației
- Creează artefacte de implementare
- Ambalează pentru platforma țintă (containere, fișiere ZIP, etc.)

### Faza 5: Cârlige pre-implementare
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

### Faza 6: Implementarea aplicației
- Implementarea aplicațiilor ambalate în serviciile Azure
- Actualizarea setărilor de configurare
- Pornirea/reporirea serviciilor

### Faza 7: Cârlige post-implementare
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

### Gestionarea erorilor în cârlige

Implicit, **dacă o comandă cârlig se încheie cu un cod diferit de zero, azd oprește întreaga operațiune.** Aceasta este de obicei ceea ce dorești — o migrare eșuată trebuie să oprească implementarea, nu să lanseze o aplicație deteriorată. Dar asta înseamnă că cârligele trebuie scrise cu atenție.

**1. Fă ca eșecurile să fie zgomotoase și intenționate.** Un cârlig eșuează când ultima sa comandă returnează un cod de ieșire diferit de zero. În scripturile shell, adaugă `set -e` ca să oprești cârligul la prima comandă care eșuează în loc să continue silențios:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Permite unui cârlig să eșueze fără să oprească azd.** Pentru pașii non-critici (un încălzitor de cache opțional, o notificare cu cea mai bună intenție), setează `continueOnError: true`. azd înregistrează eșecul, dar continuă:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testează cârligele în izolare înainte de o execuție completă.** Nu trebuie să rulezi `azd up` pentru a depana un cârlig – rulează-l singur și iterează rapid:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Fii atent la shell-urile specifice sistemului de operare.** Un cârlig care folosește `shell: pwsh` necesită PowerShell instalat pe mașina care îl rulează (inclusiv agenți CI). Folosește `shell: sh` pentru cea mai largă portabilitate sau oferă ambele variante `windows` și `posix`:

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

> **Sfat de depanare:** rulează orice comandă azd cu `--debug` pentru a vedea linia exactă de comandă a cârligului și întreaga sa ieșire — neprețuit atunci când un cârlig funcționează local, dar eșuează în CI.

## 🎛️ Configurarea implementării

### Setări specifice serviciului pentru implementare
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

### Configurări specifice mediului

Acestea sunt valori locale azd numai. Maparea explicită către configurația infrastructurii/rulează este necesară. `NODE_ENV` este în mod normal `production` pentru o aplicație Node implementată, inclusiv o implementare de staging; folosește o variabilă separată specifică aplicației pentru a distinge etapele de implementare.

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

## 🔧 Scenarii avansate de implementare

### Aplicații multi-serviciu
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

### Implementări Blue-Green

**Schita operațională ilustrativă:** trebuie să furnizezi ambele medii, un strat comun de rutare a traficului și cele două scripturi de mai jos. azd nu schimbă automat traficul sau nu validează pregătirea pentru rollback. Păstrează verde până când albastru a trecut testarea și rollback-ul nu mai este necesar.

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

### Implementări Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Împărțirea traficului ține de configurația Container Apps (Bicep sau Azure CLI), nu de o proprietate `azure.yaml` `trafficSplit`. Previziunea/provisionarea și implementările ulterioare trebuie să păstreze modul de revizie ales și regulile de rutare.

### Implementări etapizate
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

## 🐳 Implementări cu containere

### Implementări Container App
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

Configurează secretele de runtime cu `configuration.secrets`/`secretRef` (sau referințe Key Vault) și scalarea cu `template.scale` în infrastructura Container App. Nu inventa proprietăți la nivel de serviciu `secrets` sau `scale` în `azure.yaml`.

### Optimizare Multi-Stage Dockerfile
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

## ⚡ Optimizarea performanței

### Implementări specifice serviciului
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Cache la construire
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Fluxul standard Node folosește scripturi de pachet; cârligele `prepackage` ale serviciului pot adăuga pași necesari. Cache-ul straturilor Docker este separat de definirea unei comenzi de construire a serviciului.

### Implementări eficiente ale codului
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitorizarea implementării

### Monitorizarea implementării în timp real
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Verificări de sănătate
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

Aplicația ta trebuie să implementeze `/health`; nu este furnizat automat de azd. Nu există o proprietate generică de serviciu `azure.yaml` `healthCheck`.

### Validarea post-implementare
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

## 🔐 Considerații de securitate

### Gestionarea secretelor
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` este invalid. Valorile de mediu obișnuite sunt în text clar local; nu presupune că comenzile de citire le redactează. Comenzile de mai sus salvează referințe Key Vault, dar infrastructura/aplicația ta trebuie totuși să consume secretele și să acorde acces identității de runtime.

### Securitatea rețelei
Declară și consumă parametrii de rețea în Bicep, și mapează-i în `infra/main.parameters.json`. Nu există o suprapunere generică `infra.parameters` în `azure.yaml`. Exemplele de documentație folosesc intervale `203.0.113.0/24` și `198.51.100.0/24` care nu sunt rețele reale de birou/VPN; înlocuiește-le cu intervale de rețea autorizate.

### Managementul identității și accesului
Activează `identity` al Container App în Bicep și alocă rolul necesar de plan de date Key Vault la nivelul vault-ului. Configurează secretele numite susținute de Key Vault și referințele runtime în acea resursă; `identity` și `keyVault` nu sunt proprietăți generice ale serviciilor azd. Vezi [Autentificare și identitate gestionată](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategii de rollback

### Rollback rapid
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

### Rollback infrastructură
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Rollback migrare bază de date
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrice de implementare

### Urmărește performanța implementării
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Colectare metrice personalizate
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

## 🎯 Cele mai bune practici

### 1. Consistența mediului
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validarea infrastructurii
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Integrarea testării
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

### 4. Documentație și jurnalizare
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Pașii următori

- [Procurarea resurselor](provisioning.md) - Explorare aprofundată a gestionării infrastructurii
- [Planificarea pre-implementare](../chapter-06-pre-deployment/capacity-planning.md) - Planifică strategia de implementare
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md) - Rezolvarea problemelor de implementare
- [Cele mai bune practici](../chapter-07-troubleshooting/debugging.md) - Strategii de implementare gata pentru producție

## 🎯 Exerciții practice de implementare

### Exercițiul 1: Flux incremental de implementare (20 minute)
**Obiectiv**: Stăpânește diferența dintre implementări complete și incrementale

**Punct de pornire:** Bash, Node.js 22, Git, autentificare azd și un abonament Azure cu permisiuni de implementare. Rulează într-un director nou; așteaptă resurse App Service/Cosmos DB facturabile. Timpii depind de regiune și șablon.

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

**Criterii de succes:**
- [ ] Înregistrează timpul scurs pentru ambele comenzi (nu există o durată garantată)
- [ ] Ambele comenzi se finalizează cu succes
- [ ] API-ul rămâne funcțional; editarea doar a comentariului nu este o schimbare vizibilă UI
- [ ] Infrastructura neschimbată după `azd deploy`

**Rezultat de învățare**: `azd deploy` sare peste provisioningul infrastructurii. Compară timpii măsurați în loc să presupui un plus fix de viteză.

### Exercițiul 2: Cârlige personalizate pentru implementare (30 minute)
**Obiectiv**: Implementează automatizarea înainte și după implementare

**Punct de pornire:** proiectul `deployment-practice` inițializat mai sus. Dacă l-ai curățat, rulează din nou `azd up` înainte de a testa implementarea doar a codului. Validarea de mai jos folosește scriptul real de construire al API-ului, nu un script `test:unit` rădăcină inexistent. Testele API ale șablonului necesită acces configurat la bază de date; nu sunt teste unitare izolate.

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

**Criterii de succes:**
- [ ] Scriptul pre-deploy rulează înainte de implementare
- [ ] Implementarea se oprește dacă validarea construirii eșuează
- [ ] Testul rapid post-implementare validează sănătatea
- [ ] Cârligele se execută în ordinea corectă

### Exercițiul 3: Strategie de implementare multi-mediu (45 minute)
**Obiectiv**: Implementează fluxul etapizat de implementare (dev → staging → producție)

**Punctul de plecare:** același proiect todo inițializat cu `jq`. Creează mediile de mai jos cu valori reale de abonament/locație (sau setează `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` în fiecare) **înainte** de a invoca fluxul de lucru fără solicitare. Acesta eșuează intenționat în loc să inventeze valori lipsă. Folosește doar medii de antrenament de unică folosință, nu un abonament de producție real.

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

**Criterii de succes:**
- [ ] Mediul Dev se implementează cu succes
- [ ] Mediul Staging se implementează cu succes
- [ ] Este necesară aprobarea manuală pentru producție
- [ ] Toate mediile au verificări de sănătate funcționale
- [ ] Se poate reveni la o versiune anterioară dacă este necesar

### Exercițiul 4: Strategie de rollback (25 minute)
**Scop**: Implementarea și testarea rollback-ului de implementare folosind Git

**Punctul de plecare:** un checkout izolat de antrenament al template-ului todo cu tot codul de bază comis, un arbore curat de lucru Git și un mediu configurat de unică folosință. Nu introduce niciodată erori intenționate într-un proiect real de producție. `APP_VERSION` de mai jos este doar pentru evidență decât dacă îl legi explicit în aplicație.

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

**Criterii de succes:**
- [ ] Se pot detecta eșecurile de implementare
- [ ] Scriptul de rollback se execută automat
- [ ] Aplicația revine la o stare funcțională
- [ ] Verificările de sănătate trec după rollback

## 📊 Monitorizarea metricilor de implementare

### Urmărește performanța implementării tale

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

**Analizează metricele tale:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Resurse suplimentare

- [Referință Azure Developer CLI Deployment](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementarea Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementarea Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementarea Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigare**
- **Lecția anterioară**: [Primul tău proiect](../chapter-01-foundation/first-project.md)
- **Lecția următoare**: [Provisionarea resurselor](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->