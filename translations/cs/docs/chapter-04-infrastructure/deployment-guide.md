# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

Tato## Pochopení procesu nasazeníkomplexní příručka pokrývá vše, co potřebujete vědět o nasazování aplikací pomocí Azure Developer CLI, od základních jednopříkazových nasazení až po pokročilé produkční scénáře s vlastními hooky, více prostředími a integrací CI/CD. Ovládněte celý životní cyklus nasazení pomocí praktických příkladů a osvědčených postupů.

## Learning Goals

Po absolvování této příručky budete:
- Ovládat všechny příkazy a pracovní postupy nasazení Azure Developer CLI
- Rozumět kompletnímu životnímu cyklu nasazení od provisioningu po monitorování
- Implementovat vlastní hooky nasazení pro automatizaci před a po nasazení
- Konfigurovat více prostředí s parametry specifickými pro prostředí
- Nastavit pokročilé strategie nasazení včetně blue-green a canary nasazení
- Integrovat nasazení azd s CI/CD pipeliny a DevOps pracovními postupy

## Learning Outcomes

Po dokončení budete schopni:
- Samostatně spouštět a řešit problémy se všemi pracovními postupy azd nasazení
- Navrhovat a implementovat vlastní automatizaci nasazení pomocí hooků
- Konfigurovat nasazení připravené pro produkci s řádným zabezpečením a monitorováním
- Spravovat složité scénáře nasazení napříč více prostředími
- Optimalizovat výkon nasazení a implementovat rollback strategie
- Integrovat azd nasazení do podnikových DevOps praktik

## Deployment Overview

Azure Developer CLI poskytuje několik příkazů pro nasazení:
- `azd up` - Kompletní pracovní postup (provision + deploy)
- `azd provision` - Vytvoří/aktualizuje pouze Azure prostředky
- `azd deploy` - Nasadí pouze aplikační kód
- `azd package` - Sestaví a zabalí aplikace

## Basic Deployment Workflows

### Complete Deployment (azd up)
Nejběžnější pracovní postup pro nové projekty:
```bash
# Nasadit vše od začátku
azd up

# Nasadit s konkrétním prostředím
azd up --environment production

# Nasadit s vlastními parametry
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
Když potřebujete aktualizovat pouze Azure prostředky:
```bash
# Zajistit/aktualizovat infrastrukturu
azd provision

# Zajistit s suchým během (dry-run) pro náhled změn
azd provision --preview

# Zajistit konkrétní služby
azd provision --service database
```

### Code-Only Deployment
Pro rychlé aktualizace aplikace:
```bash
# Nasadit všechny služby
azd deploy

# Očekávaný výstup:
# Nasazování služeb (azd deploy)
# - web: Nasazování... Hotovo
# - api: Nasazování... Hotovo
# ÚSPĚCH: Vaše nasazení bylo dokončeno za 2 minuty 15 sekund

# Nasadit konkrétní službu
azd deploy --service web
azd deploy --service api

# Nasadit s vlastními argumenty sestavení
azd deploy --service api --build-arg NODE_ENV=production

# Ověřit nasazení
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

Po jakémkoli nasazení ověřte úspěch:

```bash
# Zkontrolujte, zda všechny služby běží
azd show

# Otestujte koncové body pro kontrolu stavu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorujte chyby (výchozí: otevře se v prohlížeči)
azd monitor --logs
```

**Kritéria úspěchu:**
- ✅ Všechny služby vykazují stav "Running"
- ✅ Health endpointy vrací HTTP 200
- ✅ Žádné chybové logy za posledních 5 minut
- ✅ Aplikace odpovídá na testovací požadavky

## 🏗️ Porozumění procesu nasazení

### Fáze 1: Před-provision hooky
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
- Vytváří nebo aktualizuje Azure prostředky
- Konfiguruje síťování a zabezpečení
- Nastavuje monitorování a logování

### Fáze 3: Post-provision hooky
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
- Sestavuje aplikační kód
- Vytváří artefakty nasazení
- Baluje pro cílovou platformu (kontejnery, ZIP soubory atd.)

### Fáze 5: Pre-deploy hooky
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
- Nasazuje zabalené aplikace do Azure služeb
- Aktualizuje konfigurační nastavení
- Spouští/ restartuje služby

### Fáze 7: Post-deploy hooky
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

## 🎛️ Konfigurace nasazení

### Nastavení nasazení specifická pro službu
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

### Konfigurace specifické pro prostředí
```bash
# Vývojové prostředí
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Předprodukční prostředí
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produkční prostředí
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Pokročilé scénáře nasazení

### Aplikace s více službami
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
```bash
# Vytvořit modré prostředí
azd env new production-blue
azd up --environment production-blue

# Otestovat modré prostředí
./scripts/test-environment.sh production-blue

# Přesměrovat provoz na modré (ruční aktualizace DNS/vyrovnávače zátěže)
./scripts/switch-traffic.sh production-blue

# Vyčistit zelené prostředí
azd env select production-green
azd down --force
```

### Canary nasazení
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

### Staged nasazení
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

## 🐳 Nasazení kontejnerů

### Nasazení Container App
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

### Optimalizace Dockerfile s více fázemi
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

## ⚡ Optimalizace výkonu

### Nasazení specifické pro službu
```bash
# Nasadit konkrétní službu pro rychlejší iteraci
azd deploy --service web
azd deploy --service api

# Nasadit všechny služby
azd deploy
```

### Caching při sestavení
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efektivní nasazení kódu
```bash
# Použijte azd deploy (nikoli azd up) pro čistě kódové změny
# Tímto se přeskočí zřizování infrastruktury a je to mnohem rychlejší
azd deploy

# Nasazujte konkrétní službu pro nejrychlejší iteraci
azd deploy --service api
```

## 🔍 Monitorování nasazení

### Monitorování nasazení v reálném čase
```bash
# Sledovat aplikaci v reálném čase
azd monitor --live

# Zobrazit protokoly aplikace
azd monitor --logs

# Zkontrolovat stav nasazení
azd show
```

### Kontroly stavu
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

### Post-deployment validace
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Zkontrolovat stav aplikace
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

## 🔐 Bezpečnostní aspekty

### Správa tajemství
```bash
# Ukládejte tajné údaje bezpečně
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Odkazujte na tajné údaje v azure.yaml
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

### Síťová bezpečnost
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Řízení identity a přístupu
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

## 🚨 Strategie rollbacku

### Rychlý rollback
```bash
# AZD nemá vestavěný rollback. Doporučené postupy:

# Možnost 1: Znovu nasadit z Gitu (doporučeno)
git revert HEAD  # Vrátit problematický commit
git push
azd deploy

# Možnost 2: Znovu nasadit konkrétní commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback infrastruktury
```bash
# Zobrazit náhled změn infrastruktury před aplikací
azd provision --preview

# Pro vrácení infrastruktury použijte systém pro správu verzí:
git revert HEAD  # Vrátit změny infrastruktury
azd provision    # Použít předchozí stav infrastruktury
```

### Rollback migrace databáze
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

### Sledovat výkon nasazení
```bash
# Zobrazit aktuální stav nasazení
azd show

# Monitorovat aplikaci pomocí Application Insights
azd monitor --overview

# Zobrazit metriky v reálném čase
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

## 🎯 Doporučené postupy

### 1. Konzistence prostředí
```bash
# Používejte konzistentní pojmenování
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Udržujte shodu mezi prostředími
./scripts/sync-environments.sh
```

### 2. Validace infrastruktury
```bash
# Prohlédněte si změny infrastruktury před nasazením
azd provision --preview

# Použijte lintování ARM/Bicep
az bicep lint --file infra/main.bicep

# Ověřte syntaxi Bicep
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

### 4. Dokumentace a protokolování
```bash
# Zdokumentujte postupy nasazení
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Další kroky

- [Provisioning Resources](provisioning.md) - Hlubší pohled na správu infrastruktury
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Naplánujte svou strategii nasazení
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Řešení problémů s nasazením
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Produkčně připravené strategie nasazení

## 🎯 Praktická cvičení nasazení

### Cvičení 1: Inkrementální pracovní postup nasazení (20 minut)
**Cíl**: Ovládnout rozdíl mezi kompletním a inkrementálním nasazením

```bash
# Počáteční nasazení
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zaznamenat čas počátečního nasazení
echo "Full deployment: $(date)" > deployment-log.txt

# Provést změnu kódu
echo "// Updated $(date)" >> src/api/src/server.js

# Nasadit pouze kód (rychle)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Porovnat časy
cat deployment-log.txt

# Vyčistit
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Kompletní nasazení trvá 5–15 minut
- [ ] Nasazení pouze kódu trvá 2–5 minut
- [ ] Změny kódu jsou viditelné v nasazené aplikaci
- [ ] Infrastruktura nezměněna po `azd deploy`

**Výsledek učení**: `azd deploy` je o 50–70 % rychlejší než `azd up` pro změny kódu

### Cvičení 2: Vlastní hooky nasazení (30 minut)
**Cíl**: Implementovat automatizaci před a po nasazení

```bash
# Vytvořit validační skript před nasazením
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Zkontrolovat, zda testy projdou
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Zkontrolovat, zda jsou necommitované změny
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Vytvořit smoke test po nasazení
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

# Přidat hooky do azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Otestovat nasazení s hooky
azd deploy
```

**Kritéria úspěchu:**
- [ ] Skript před nasazením běží před samotným nasazením
- [ ] Nasazení se přeruší, pokud testy selžou
- [ ] Post-deploy smoke test ověřuje stav
- [ ] Hooky se spouštějí ve správném pořadí

### Cvičení 3: Strategie nasazení pro více prostředí (45 minut)
**Cíl**: Implementovat staged pracovní postup nasazení (dev → staging → production)

```bash
# Vytvořit skript nasazení
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Krok 1: Nasadit do vývojového prostředí
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 2: Nasadit do stagingového prostředí
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Ruční schválení pro nasazení do produkce
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

# Vytvořit prostředí
azd env new dev
azd env new staging
azd env new production

# Spustit postupné nasazení
./deploy-staged.sh
```

**Kritéria úspěchu:**
- [ ] Prostředí Dev nasadí úspěšně
- [ ] Prostředí Staging nasadí úspěšně
- [ ] Pro produkci je vyžadováno ruční schválení
- [ ] Všechna prostředí mají funkční health checky
- [ ] Možnost rollbacku v případě potřeby

### Cvičení 4: Strategie rollbacku (25 minut)
**Cíl**: Implementovat a otestovat rollback nasazení pomocí Gitu

```bash
# Nasadit v1
azd env set APP_VERSION "1.0.0"
azd up

# Uložit hash commitu v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Nasadit v2 s nekompatibilní změnou
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Zjistit selhání a vrátit systém do předchozího stavu
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Vrátit změny pomocí gitu
    git revert HEAD --no-edit
    
    # Obnovit prostředí
    azd env set APP_VERSION "1.0.0"
    
    # Znovu nasadit v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kritéria úspěchu:**
- [ ] Dokáže detekovat selhání nasazení
- [ ] Rollback skript se spustí automaticky
- [ ] Aplikace se vrátí do funkčního stavu
- [ ] Kontroly stavu projdou po rollbacku

## 📊 Sledování metrik nasazení

### Sledujte výkon vašeho nasazení

```bash
# Vytvořte skript pro metriky nasazení
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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Zapisujte do souboru
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Použijte ho
./track-deployment.sh
```

**Analyzujte své metriky:**
```bash
# Zobrazit historii nasazení
cat deployment-metrics.csv

# Vypočítat průměrnou dobu nasazení
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Další zdroje

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nepřebíráme odpovědnost za jakákoli nedorozumění nebo nesprávné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->