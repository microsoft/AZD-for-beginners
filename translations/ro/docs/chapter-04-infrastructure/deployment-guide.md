# Ghid de Implementare - Stăpânirea implementărilor AZD

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca Cod & Implementare
- **⬅️ Capitolul anterior**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)
- **➡️ Următorul**: [Provisionarea Resurselor](provisioning.md)
- **🧩 De asemenea în acest capitol**: [Crearea propriului șablon](custom-templates.md)
- **🚀 Capitolul următor**: [Capitolul 5: Soluții AI Multi-Agent](../../examples/retail-scenario.md)

## Introducere

Acest ghid cuprinzător acoperă tot ce trebuie să știi despre implementarea aplicațiilor folosind Azure Developer CLI, de la implementări de bază cu o singură comandă până la scenarii avansate de producție cu hook-uri personalizate, medii multiple și integrare CI/CD. Stăpânește ciclul complet de viață al implementării cu exemple practice și cele mai bune practici.

## Obiective de învățare

Parcurgând acest ghid, vei:
- Stăpâni toate comenzile și fluxurile de lucru de implementare Azure Developer CLI
- Înțelege ciclul complet de viață al implementării, de la provisioning la monitorizare
- Implementa hook-uri personalizate pentru automatizarea pre și post-implementare
- Configura medii multiple cu parametri specifici fiecărui mediu
- Configura strategii avansate de implementare, inclusiv implementări blue-green și canary
- Integra implementările azd cu pipeline-uri CI/CD și fluxuri de lucru DevOps

## Rezultate de învățare

La finalizare, vei putea:
- Executa și depana toate fluxurile de lucru azd pentru implementare în mod independent
- Proiecta și implementa automatizări de implementare personalizate folosind hook-uri
- Configura implementări gata pentru producție cu securitate și monitorizare adecvată
- Gestione scenarii complexe de implementare multi-mediu
- Optimiza performanța implementării și implementa strategii de rollback
- Integra implementările azd în practicile DevOps enterprise

## Prezentare generală a implementării

Azure Developer CLI oferă mai multe comenzi pentru implementare:
- `azd up` - Flux complet (provision + deploy)
- `azd provision` - Creează/actualizează doar resursele Azure
- `azd deploy` - Implementează doar codul aplicației
- `azd package` - Compilează și împachetează aplicațiile

## Fluxuri de lucru de implementare de bază

### Implementare completă (azd up)
Cel mai frecvent flux de lucru pentru proiecte noi:
```bash
# Desfășurați totul de la zero
azd up

# Desfășurați cu un mediu specific
azd up --environment production

# Desfășurați cu parametri personalizați
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Implementare doar infrastructură
Atunci când trebuie să actualizezi doar resursele Azure:
```bash
# Asigură/actualizează infrastructura
azd provision

# Asigură cu execuție simulată pentru a previzualiza modificările
azd provision --preview

# Asigură servicii specifice
azd provision --service database
```

### Implementare doar cod
Pentru actualizări rapide ale aplicației:
```bash
# Implementați toate serviciile
azd deploy

# Ieșire așteptată:
# Implementarea serviciilor (azd deploy)
# - web: Se implementează... Gata
# - api: Se implementează... Gata
# SUCCES: Implementarea s-a finalizat în 2 minute 15 secunde

# Implementați un serviciu specific
azd deploy --service web
azd deploy --service api

# Implementați cu argumente personalizate de construire
azd deploy --service api --build-arg NODE_ENV=production

# Verificați implementarea
azd show --output json | jq '.services'
```

### ✅ Verificarea implementării

După orice implementare, verifică succesul:

```bash
# Verifică dacă toate serviciile sunt active
azd show

# Testează punctele finale de sănătate
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorizează erorile (se deschide implicit în browser)
azd monitor --logs
```

**Criterii de succes:**
- ✅ Toate serviciile afișează status "Running"
- ✅ Endpointurile de sănătate returnează HTTP 200
- ✅ Fără jurnale de erori în ultimele 5 minute
- ✅ Aplicația răspunde la cererile de test

## 🏗️ Înțelegerea procesului de implementare

### Ești nou cu hook-urile? Începe aici

Un **hook** este o comandă pe care azd o rulează automat într-un moment specific al procesului de implementare—înainte sau după provisioning, și înainte sau după implementarea codului tău. Ele îți permit să automatizezi sarcinile mici care însoțesc întotdeauna o implementare: popularea unei baze de date, rularea migrărilor, construirea resurselor front-end sau testarea rapidă a aplicației live.

| Hook | Rulează… | Utilizare comună |
|------|---------|------------------|
| `preprovision` | Înainte ca resursele să fie create | Validarea precondițiilor, autentificare la un registru |
| `postprovision` | După ce resursele există | Configurarea resurselor, pregătirea bazei de date |
| `predeploy` | Înainte de implementarea codului | Construirea resurselor front-end, rularea testelor unitare |
| `postdeploy` | După ce codul este live | Rularea migrărilor bazei de date, testare rapidă endpoint |

Hook-urile se află în `azure.yaml`. Iată cel mai mic exemplu posibil—doar afișează un mesaj după implementare:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Atât—data viitoare când rulezi `azd up`, mesajul se afișează automat. Poți rula de asemenea un hook separat, fără implementare completă, ceea ce e grozav pentru testare:

```bash
azd hooks run postdeploy
```

Fazele de mai jos arată hook-uri reale (migrări, teste, validare) pentru fiecare etapă.

### Faza 1: Hook-uri pre-provision
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

### Faza 2: Provisionarea infrastructurii
- Citește șabloanele de infrastructură (Bicep/Terraform)
- Creează sau actualizează resurse Azure
- Configurează rețeaua și securitatea
- Configurează monitorizarea și jurnalizarea

### Faza 3: Hook-uri post-provision
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

### Faza 4: Împachetarea aplicației
- Construiește codul aplicației
- Creează artefactele de implementare
- Împachetează pentru platforma țintă (containere, fișiere ZIP etc.)

### Faza 5: Hook-uri pre-deploy
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
- Implementează aplicațiile împachetate în serviciile Azure
- Actualizează setările de configurare
- Pornește/repornește serviciile

### Faza 7: Hook-uri post-deploy
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

### Gestionarea erorilor hook-urilor

Implicit, **dacă o comandă hook se încheie cu un cod de ieșire diferit de zero, azd oprește întreaga operațiune.** Acesta este de obicei comportamentul dorit—o migrare eșuată ar trebui să oprească implementarea, nu să livreze o aplicație defectă. Dar asta înseamnă că hook-urile trebuie scrise cu atenție.

**1. Fă ca eșecurile să fie clare și intenționate.** Un hook eșuează când ultima sa comandă returnează un cod de ieșire diferit de zero. În scripturi shell, adaugă `set -e` pentru ca hook-ul să se oprească la prima comandă care eșuează în loc să continue silențios:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Permite unui hook să eșueze fără să oprească azd.** Pentru pași non-critici (o încălzire opțională a cache-ului, o notificare la limita capacității), setează `continueOnError: true`. azd înregistrează eșecul dar continuă operațiunea:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testează hook-urile izolat înainte de rularea completă.** Nu trebuie să rulezi `azd up` pentru a depana un hook—runează-l singur și iterează rapid:

```bash
azd hooks run predeploy          # rulează doar hook-ul predeploy
azd hooks run postdeploy --service api
```

**4. Ai grijă la shell-urile specifice sistemului de operare.** Un hook care folosește `shell: pwsh` necesită PowerShell instalat pe mașina care-l rulează (inclusiv agenții CI). Folosește `shell: sh` pentru cea mai largă portabilitate, sau oferă variante `windows` și `posix`:

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

> **Sfat pentru depanare:** rulează orice comandă azd cu `--debug` pentru a vedea linia exactă de comandă a hook-ului și ieșirea sa completă—foarte util când un hook funcționează local dar eșuează în CI.

## 🎛️ Configurarea implementării

### Setări specifice serviciului pentru implementare
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

### Configurări specifice mediului
```bash
# Mediu de dezvoltare
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Mediu de testare
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Mediu de producție
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

### Implementări blue-green
```bash
# Creează mediul albastru
azd env new production-blue
azd up --environment production-blue

# Testează mediul albastru
./scripts/test-environment.sh production-blue

# Comută traficul către albastru (actualizare manuală DNS/load balancer)
./scripts/switch-traffic.sh production-blue

# Curăță mediul verde
azd env select production-green
azd down --force
```

### Implementări canary
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

### Implementări pe etape
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

## 🐳 Implementări containerizate

### Implementări aplicații container
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

### Optimizare Dockerfile multi-etapă
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

## ⚡ Optimizarea performanței

### Implementări specifice serviciului
```bash
# Implementați un serviciu specific pentru o iterare mai rapidă
azd deploy --service web
azd deploy --service api

# Implementați toate serviciile
azd deploy
```

### Cache la build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Implementări eficiente de cod
```bash
# Folosește azd deploy (nu azd up) pentru schimbări doar în cod
# Aceasta săre peste provisioning-ul infrastructurii și este mult mai rapid
azd deploy

# Deploy pentru un serviciu specific pentru cea mai rapidă iterație
azd deploy --service api
```

## 🔍 Monitorizarea implementării

### Monitorizare în timp real a implementării
```bash
# Monitorizează aplicația în timp real
azd monitor --live

# Vizualizează jurnalele aplicației
azd monitor --logs

# Verifică starea implementării
azd show
```

### Verificări de sănătate
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

### Validare post-implementare
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verifică starea de sănătate a aplicației
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

## 🔐 Considerații de securitate

### Managementul secretelor
```bash
# Stocați secretele în siguranță
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referiți secretele în azure.yaml
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

### Securitatea rețelei
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitate și managementul accesului
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

## 🚨 Strategii de rollback

### Rollback rapid
```bash
# AZD nu are rollback integrat. Abordări recomandate:

# Opțiunea 1: Redistribuirea din Git (recomandată)
git revert HEAD  # Revenirea la commit-ul problematic
git push
azd deploy

# Opțiunea 2: Redistribuirea unui commit specific
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback infrastructură
```bash
# Previzualizează modificările infrastructurii înainte de a le aplica
azd provision --preview

# Pentru revenirea asupra infrastructurii, folosește controlul versiunilor:
git revert HEAD  # Revino asupra modificărilor infrastructurii
azd provision    # Aplică starea anterioară a infrastructurii
```

### Rollback migrare bază de date
```bash
#!/bin/bash
# scripts/revenire-baza-de-date.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Măsurarea performanței implementării

### Monitorizarea performanței implementării
```bash
# Vizualizează starea curentă a implementării
azd show

# Monitorizează aplicația cu Application Insights
azd monitor --overview

# Vizualizează metrici în timp real
azd monitor --live
```

### Colectarea metricilor personalizate
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
# Folosește denumiri consistente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Menține paritatea mediului
./scripts/sync-environments.sh
```

### 2. Validarea infrastructurii
```bash
# Previzualizați modificările infrastructurii înainte de implementare
azd provision --preview

# Utilizați linting ARM/Bicep
az bicep lint --file infra/main.bicep

# Validați sintaxa Bicep
az bicep build --file infra/main.bicep
```

### 3. Integrarea testelor
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
# Documentați procedurile de implementare
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Următorii pași

- [Provisionarea Resurselor](provisioning.md) - Explorare detaliată a managementului infrastructurii
- [Planificarea Pre-Implementare](../chapter-06-pre-deployment/capacity-planning.md) - Planifică-ți strategia de implementare
- [Probleme Comune](../chapter-07-troubleshooting/common-issues.md) - Rezolvă problemele de implementare
- [Cele mai bune practici](../chapter-07-troubleshooting/debugging.md) - Strategii pentru implementări gata de producție

## 🎯 Exerciții practice de implementare

### Exercițiul 1: Flux incremental de implementare (20 minute)
**Obiectiv**: Stăpânește diferența între implementare completă și incrementală

```bash
# Implementare inițială
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Înregistrează timpul inițial de implementare
echo "Full deployment: $(date)" > deployment-log.txt

# Efectuează o modificare în cod
echo "// Updated $(date)" >> src/api/src/server.js

# Implementare doar a codului (rapid)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compară timpii
cat deployment-log.txt

# Curățare
azd down --force --purge
```

**Criterii de succes:**
- [ ] Implementarea completă durează 5-15 minute
- [ ] Implementarea doar de cod durează 2-5 minute
- [ ] Modificările de cod reflectate în aplicația implementată
- [ ] Infrastructura rămâne neschimbată după `azd deploy`

**Rezultat de învățare**: `azd deploy` este 50-70% mai rapid decât `azd up` pentru modificări de cod

### Exercițiul 2: Hook-uri personalizate de implementare (30 minute)
**Obiectiv**: Implementează automatizări pre și post-implementare

```bash
# Creează script de validare înainte de implementare
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Verifică dacă testele trec
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Verifică pentru schimbări necomise
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Creează test rapid după implementare
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

# Adaugă hook-uri în azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testează implementarea cu hook-uri
azd deploy
```

**Criterii de succes:**
- [ ] Scriptul pre-deploy rulează înainte de implementare
- [ ] Implementarea este anulată dacă testele eșuează
- [ ] Testul rapid post-deploy validează sănătatea
- [ ] Hook-urile se execută în ordinea corectă

### Exercițiul 3: Strategie de implementare multi-mediu (45 minute)
**Obiectiv**: Implementează un flux pe etape (dev → staging → producție)

```bash
# Creează scriptul de implementare
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Pasul 1: Implementare în mediu dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Pasul 2: Implementare în mediu staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Pasul 3: Aprobare manuală pentru producție
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

# Creează mediile
azd env new dev
azd env new staging
azd env new production

# Rulează implementarea etapizată
./deploy-staged.sh
```

**Criterii de succes:**
- [ ] Mediul dev se implementează cu succes
- [ ] Mediul staging se implementează cu succes
- [ ] Aprobare manuală necesară pentru producție
- [ ] Toate mediile au verificări de sănătate funcționale
- [ ] Poate face rollback dacă este necesar

### Exercițiul 4: Strategie de rollback (25 minute)
**Obiectiv**: Implementează și testează rollback-ul implementării folosind Git

```bash
# Desfășurare v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvează hash-ul commit-ului v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Desfășurare v2 cu modificare incompatibilă
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectează eșecul și revine la versiunea anterioară
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Revine la versiunea anterioară folosind git
    git revert HEAD --no-edit
    
    # Revine mediul la versiunea anterioară
    azd env set APP_VERSION "1.0.0"
    
    # Redesfășurare v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criterii de succes:**
- [ ] Se pot detecta eșecurile implementării
- [ ] Scriptul de rollback rulează automat
- [ ] Aplicația revine la starea funcțională
- [ ] Verificările de sănătate sunt trecute după rollback

## 📊 Monitorizarea metricilor de implementare

### Monitorizează performanța implementării tale

```bash
# Creează scriptul pentru metrici de implementare
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

# Înregistrează în fișier
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Folosește-l
./track-deployment.sh
```

**Analizează metricile:**
```bash
# Vizualizează istoricul implementărilor
cat deployment-metrics.csv

# Calculează timpul mediu de implementare
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Resurse suplimentare

- [Referință Azure Developer CLI pentru implementare](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementare Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementare Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementare Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigare**
- **Lecția anterioară**: [Primul tău proiect](../chapter-01-foundation/first-project.md)
- **Lecția următoare**: [Provisionarea Resurselor](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->