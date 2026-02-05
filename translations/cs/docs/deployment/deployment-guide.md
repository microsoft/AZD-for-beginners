# Průvodce nasazením - Ovládnutí nasazení pomocí AZD

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 4 - Infrastruktura jako kód a nasazení
- **⬅️ Předchozí kapitola**: [Kapitola 3: Konfigurace](../getting-started/configuration.md)
- **➡️ Další**: [Zajištění zdrojů](provisioning.md)
- **🚀 Další kapitola**: [Kapitola 5: Víceagentní AI řešení](../../examples/retail-scenario.md)

## Úvod

Tento komplexní průvodce pokrývá vše, co potřebujete vědět o nasazování aplikací pomocí Azure Developer CLI, od základních nasazení jedním příkazem až po pokročilé produkční scénáře s vlastními hooky, více prostředími a integrací CI/CD. Ovládněte celý životní cyklus nasazení s praktickými příklady a osvědčenými postupy.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Ovládat všechny příkazy a pracovní postupy nasazení Azure Developer CLI
- Rozumět celému životnímu cyklu nasazení od zajištění zdrojů po monitorování
- Implementovat vlastní hooky pro automatizaci před a po nasazení
- Konfigurovat více prostředí s parametry specifickými pro prostředí
- Nastavovat pokročilé strategie nasazení, včetně blue-green a kanárkových nasazení
- Integrovat nasazení azd do CI/CD pipeline a DevOps pracovních postupů

## Výstupy učení

Po dokončení budete schopni:
- Samostatně provádět a řešit problémy všech pracovních postupů nasazení azd
- Navrhovat a implementovat vlastní automatizaci nasazení pomocí hooků
- Konfigurovat nasazení připravená pro produkci s odpovídajícím zabezpečením a monitorováním
- Spravovat složité scénáře nasazení s více prostředími
- Optimalizovat výkon nasazení a implementovat strategie návratu zpět
- Integrovat nasazení azd do podnikových DevOps praktik

## Přehled nasazení

Azure Developer CLI poskytuje několik příkazů pro nasazení:
- `azd up` - Kompletní pracovní postup (zajištění + nasazení)
- `azd provision` - Pouze vytvoření/aktualizace Azure zdrojů
- `azd deploy` - Pouze nasazení aplikačního kódu
- `azd package` - Sestavení a balení aplikací

## Základní pracovní postupy nasazení

### Kompletní nasazení (azd up)
Nejběžnější pracovní postup pro nové projekty:
```bash
# Nasadit vše od začátku
azd up

# Nasadit s konkrétním prostředím
azd up --environment production

# Nasadit s vlastními parametry
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Pouze nasazení infrastruktury
Když potřebujete aktualizovat pouze Azure zdroje:
```bash
# Poskytnout/aktualizovat infrastrukturu
azd provision

# Poskytnout s dry-run pro náhled změn
azd provision --preview

# Poskytnout konkrétní služby
azd provision --service database
```

### Pouze nasazení kódu
Pro rychlé aktualizace aplikací:
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

### ✅ Ověření nasazení

Po každém nasazení ověřte úspěšnost:

```bash
# Zkontrolujte, zda všechny služby běží
azd show

# Otestujte zdravotní koncové body
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Zkontrolujte protokoly na chyby
azd logs --service api --since 5m | grep -i error
```

**Kritéria úspěchu:**
- ✅ Všechny služby ukazují stav "Running"
- ✅ Zdravotní endpointy vrací HTTP 200
- ✅ Žádné chybové logy za posledních 5 minut
- ✅ Aplikace reaguje na testovací požadavky

## 🏗️ Pochopení procesu nasazení

### Fáze 1: Hooky před zajištěním
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

### Fáze 2: Zajištění infrastruktury
- Čte šablony infrastruktury (Bicep/Terraform)
- Vytváří nebo aktualizuje Azure zdroje
- Konfiguruje sítě a zabezpečení
- Nastavuje monitorování a logování

### Fáze 3: Hooky po zajištění
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
- Balí pro cílovou platformu (kontejnery, ZIP soubory atd.)

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
- Nasazuje zabalené aplikace do Azure služeb
- Aktualizuje konfigurační nastavení
- Spouští/restartuje služby

### Fáze 7: Hooky po nasazení
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

# Testovací prostředí
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
# Vytvořte modré prostředí
azd env new production-blue
azd up --environment production-blue

# Otestujte modré prostředí
./scripts/test-environment.sh production-blue

# Přepněte provoz na modré (ruční aktualizace DNS/load balanceru)
./scripts/switch-traffic.sh production-blue

# Vyčistěte zelené prostředí
azd env select production-green
azd down --force
```

### Kanárková nasazení
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
# nasazení-staged.sh

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

### Nasazení aplikací v kontejnerech
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

### Optimalizace vícefázových Dockerfile
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

### Paralelní nasazení
```bash
# Nakonfigurujte paralelní nasazení
azd config set deploy.parallelism 5

# Nasazujte služby paralelně
azd deploy --parallel
```

### Caching sestavení
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Inkrementální nasazení
```bash
# Nasadit pouze změněné služby
azd deploy --incremental

# Nasadit s detekcí změn
azd deploy --detect-changes
```

## 🔍 Monitorování nasazení

### Monitorování nasazení v reálném čase
```bash
# Sledovat průběh nasazení
azd deploy --follow

# Zobrazit logy nasazení
azd logs --follow --service api

# Zkontrolovat stav nasazení
azd show --service api
```

### Kontroly zdraví
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

### Validace po nasazení
```bash
#!/bin/bash
# skripty/validate-deployment.sh

echo "Validating deployment..."

# Zkontrolujte stav aplikace
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

## 🔐 Zabezpečení

### Správa tajemství
```bash
# Ukládejte tajemství bezpečně
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Odkazujte na tajemství v azure.yaml
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

### Správa identity a přístupu
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

## 🚨 Strategie návratu zpět

### Rychlý návrat zpět
```bash
# Vrátit se k předchozímu nasazení
azd deploy --rollback

# Vrátit konkrétní službu
azd deploy --service api --rollback

# Vrátit se ke konkrétní verzi
azd deploy --service api --version v1.2.3
```

### Návrat infrastruktury zpět
```bash
# Vrátit změny infrastruktury zpět
azd provision --rollback

# Náhled změn vrácení zpět
azd provision --rollback --preview
```

### Návrat migrace databáze zpět
```bash
#!/bin/bash
# skripty/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metriky nasazení

### Sledování výkonu nasazení
```bash
# Povolit metriky nasazení
azd config set telemetry.deployment.enabled true

# Zobrazit historii nasazení
azd history

# Získat statistiky nasazení
azd metrics --type deployment
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

## 🎯 Osvědčené postupy

### 1. Konzistence prostředí
```bash
# Používejte konzistentní pojmenování
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Udržujte paritu prostředí
./scripts/sync-environments.sh
```

### 2. Validace infrastruktury
```bash
# Ověřte před nasazením
azd provision --preview
azd provision --what-if

# Použijte lintování ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Testování integrace
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
# Dokumentujte postupy nasazení
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Další kroky

- [Zajištění zdrojů](provisioning.md) - Podrobný pohled na správu infrastruktury
- [Plánování před nasazením](../pre-deployment/capacity-planning.md) - Naplánujte si strategii nasazení
- [Běžné problémy](../troubleshooting/common-issues.md) - Řešení problémů s nasazením
- [Osvědčené postupy](../troubleshooting/debugging.md) - Strategie nasazení připravené pro produkci

## 🎯 Praktická cvičení pro nasazení

### Cvičení 1: Pracovní postup inkrementálního nasazení (20 minut)
**Cíl**: Ovládnout rozdíl mezi plným a inkrementálním nasazením

```bash
# Počáteční nasazení
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zaznamenat čas počátečního nasazení
echo "Full deployment: $(date)" > deployment-log.txt

# Proveďte změnu kódu
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
- [ ] Plné nasazení trvá 5-15 minut
- [ ] Pouze nasazení kódu trvá 2-5 minut
- [ ] Změny kódu se projeví v nasazené aplikaci
- [ ] Infrastruktura zůstane nezměněna po `azd deploy`

**Výstup učení**: `azd deploy` je o 50-70 % rychlejší než `azd up` pro změny kódu

### Cvičení 2: Vlastní hooky pro nasazení (30 minut)
**Cíl**: Implementovat automatizaci před a po nasazení

```bash
# Vytvořte skript pro validaci před nasazením
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Zkontrolujte, zda testy procházejí
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Zkontrolujte neuložené změny
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Vytvořte test funkčnosti po nasazení
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

# Přidejte hooky do azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Otestujte nasazení s hooky
azd deploy
```

**Kritéria úspěchu:**
- [ ] Skript před nasazením se spustí před nasazením
- [ ] Nasazení se přeruší, pokud testy selžou
- [ ] Post-deploy smoke test ověří zdraví
- [ ] Hooky se spustí ve správném pořadí

### Cvičení 3: Strategie nasazení s více prostředími (45 minut)
**Cíl**: Implementovat pracovní postup staged nasazení (dev → staging → produkce)

```bash
# Vytvořit skript nasazení
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Krok 1: Nasadit na vývoj
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 2: Nasadit na testovací prostředí
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Ruční schválení pro produkci
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
- [ ] Prostředí dev se úspěšně nasadí
- [ ] Prostředí staging se úspěšně nasadí
- [ ] Pro produkci je vyžadováno manuální schválení
- [ ] Všechna prostředí mají funkční kontroly zdraví
- [ ] Možnost návratu zpět, pokud je potřeba

### Cvičení 4: Strategie návratu zpět (25 minut)
**Cíl**: Implementovat a otestovat návrat nasazení zpět

```bash
# Nasadit v1
azd env set APP_VERSION "1.0.0"
azd up

# Uložit konfiguraci v1
cp -r .azure/production .azure/production-v1-backup

# Nasadit v2 s nekompatibilní změnou
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Zjistit selhání
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Vrátit kód zpět
    git checkout src/api/src/server.js
    
    # Vrátit prostředí zpět
    azd env set APP_VERSION "1.0.0"
    
    # Znovu nasadit v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kritéria úspěchu:**
- [ ] Možnost detekce selhání nasazení
- [ ] Skript návratu zpět se spustí automaticky
- [ ] Aplikace se vrátí do funkčního stavu
- [ ] Kontroly zdraví projdou po návratu zpět

## 📊 Sledování metrik nasazení

### Sledujte výkon svého nasazení

```bash
# Vytvořte skript metrik nasazení
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

# Zaznamenávat do souboru
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Použijte to
./track-deployment.sh
```

**Analyzujte své metriky:**
```bash
# Zobrazit historii nasazení
cat deployment-metrics.csv

# Vypočítat průměrný čas nasazení
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Další zdroje

- [Referenční příručka nasazení Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nasazení Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nasazení Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nasazení Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigace**
- **Předchozí lekce**: [Váš první projekt](../getting-started/first-project.md)
- **Další lekce**: [Zajištění zdrojů](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->