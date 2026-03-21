# Príručka nasadzovania - Ovládnutie nasadení AZD

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)
- **➡️ Ďalej**: [Provisioning prostriedkov](provisioning.md)
- **🚀 Ďalšia kapitola**: [Kapitola 5: Viacagentové AI riešenia](../../examples/retail-scenario.md)

## Úvod

Táto komplexná príručka pokrýva všetko, čo potrebujete vedieť o nasadzovaní aplikácií pomocou Azure Developer CLI, od základných jednorazových príkazov až po pokročilé produkčné scenáre s vlastnými hookmi, viacerými prostrediami a integráciou CI/CD. Ovládnite celý životný cyklus nasadenia s praktickými príkladmi a osvedčenými postupmi.

## Ciele učenia

Po absolvovaní tejto príručky budete:
- Ovládať všetky príkazy a pracovné toky nasadenia Azure Developer CLI
- Pochopiť kompletný životný cyklus nasadenia od provisioningu až po monitoring
- Implementovať vlastné hooky pre automatizáciu pred a po nasadení
- Konfigurovať viaceré prostredia s parametrami špecifickými pre prostredie
- Nastaviť pokročilé stratégie nasadenia vrátane blue-green a canary nasadení
- Integrovať azd nasadenia s CI/CD pipeline a DevOps pracovnými postupmi

## Výstupy učenia

Po dokončení budete schopní:
- Samostatne vykonávať a riešiť problémy so všetkými azd pracovnými tokmi nasadenia
- Navrhovať a implementovať vlastnú automatizáciu nasadenia pomocou hookov
- Konfigurovať nasadenia pripravené na produkciu s primeraným zabezpečením a monitoringom
- Spravovať zložité scenáre nasadenia vo viacerých prostrediach
- Optimalizovať výkon nasadenia a implementovať stratégie návratu
- Integrovať azd nasadenia do podnikového DevOps

## Prehľad nasadenia

Azure Developer CLI poskytuje niekoľko príkazov na nasadzovanie:
- `azd up` - Kompletný pracovný tok (provision + deploy)
- `azd provision` - Vytvorenie/aktualizácia len Azure prostriedkov
- `azd deploy` - Nasadenie len aplikačného kódu
- `azd package` - Build a balenie aplikácií

## Základné pracovné toky nasadenia

### Kompletné nasadenie (azd up)
Najbežnejší pracovný tok pre nové projekty:
```bash
# Nasadiť všetko od začiatku
azd up

# Nasadiť s konkrétnym prostredím
azd up --environment production

# Nasadiť s vlastnými parametrami
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nasadenie len infraštruktúry
Keď potrebujete aktualizovať iba Azure prostriedky:
```bash
# Zabezpečiť/aktualizovať infraštruktúru
azd provision

# Zabezpečiť s testovacím režimom (dry-run) pre náhľad zmien
azd provision --preview

# Zabezpečiť konkrétne služby
azd provision --service database
```

### Nasadenie len kódu
Pre rýchle aktualizácie aplikácie:
```bash
# Nasadiť všetky služby
azd deploy

# Očakávaný výstup:
# Nasadzovanie služieb (azd deploy)
# - web: Nasadzovanie... Hotovo
# - api: Nasadzovanie... Hotovo
# ÚSPECH: Vaše nasadenie bolo dokončené za 2 minúty a 15 sekúnd

# Nasadiť konkrétnu službu
azd deploy --service web
azd deploy --service api

# Nasadiť s vlastnými argumentmi zostavenia
azd deploy --service api --build-arg NODE_ENV=production

# Overiť nasadenie
azd show --output json | jq '.services'
```

### ✅ Overenie nasadenia

Po každom nasadení overte úspech:

```bash
# Skontrolujte, či všetky služby bežia
azd show

# Otestujte health endpointy
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Sledujte chyby (štandardne sa otvorí v prehliadači)
azd monitor --logs
```

**Kritériá úspechu:**
- ✅ Všetky služby ukazujú stav "Running"
- ✅ Health endpointy vracajú HTTP 200
- ✅ Žiadne chybové záznamy za posledných 5 minút
- ✅ Aplikácia odpovedá na testovacie požiadavky

## 🏗️ Pochopenie procesu nasadenia

### Fáza 1: Pred-provision spúšťače
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

### Fáza 2: Provisionovanie infraštruktúry
- Číta šablóny infraštruktúry (Bicep/Terraform)
- Vytvára alebo aktualizuje Azure prostriedky
- Konfiguruje sieťovanie a zabezpečenie
- Nastavuje monitorovanie a logovanie

### Fáza 3: Post-provision spúšťače
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

### Fáza 4: Balíkovanie aplikácie
- Stavia aplikačný kód
- Vytvára artefakty nasadenia
- Baluje pre cieľovú platformu (kontajnery, ZIP súbory, atď.)

### Fáza 5: Pred-deploy spúšťače
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
- Nasadzuje zabalené aplikácie do služieb Azure
- Aktualizuje konfiguračné nastavenia
- Štartuje/reštartuje služby

### Fáza 7: Post-deploy spúšťače
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

## 🎛️ Konfigurácia nasadenia

### Nastavenia nasadenia špecifické pre službu
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

### Konfigurácie špecifické pre prostredie
```bash
# Vývojové prostredie
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Predprodukčné prostredie
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produkčné prostredie
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Pokročilé scenáre nasadenia

### Aplikácie s viacerými službami
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
```bash
# Vytvoriť modré prostredie
azd env new production-blue
azd up --environment production-blue

# Otestovať modré prostredie
./scripts/test-environment.sh production-blue

# Presmerovať prevádzku na modré (manuálna aktualizácia DNS/vyrovnávača záťaže)
./scripts/switch-traffic.sh production-blue

# Vyčistiť zelené prostredie
azd env select production-green
azd down --force
```

### Canary nasadenia
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

### Fázové nasadenia
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

## 🐳 Nasadenia kontajnerov

### Nasadenie Container App
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

### Optimalizácia Dockerfile s viacerými krokmi
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

## ⚡ Optimalizácia výkonu

### Nasadenia špecifické pre službu
```bash
# Nasadiť konkrétnu službu pre rýchlejšie iterácie
azd deploy --service web
azd deploy --service api

# Nasadiť všetky služby
azd deploy
```

### Kešovanie buildov
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efektívne nasadzovanie kódu
```bash
# Použite azd deploy (nie azd up) pri zmenách iba v kóde
# Tým sa vynechá nasadzovanie infraštruktúry a je to oveľa rýchlejšie
azd deploy

# Nasadzujte konkrétnu službu pre najrýchlejšiu iteráciu
azd deploy --service api
```

## 🔍 Monitorovanie nasadení

### Monitorovanie nasadení v reálnom čase
```bash
# Monitorovať aplikáciu v reálnom čase
azd monitor --live

# Zobraziť denníky aplikácie
azd monitor --logs

# Skontrolovať stav nasadenia
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

### Overenie po nasadení
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Skontrolujte zdravie aplikácie
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

## 🔐 Bezpečnostné aspekty

### Správa tajomstiev
```bash
# Ukladajte tajomstvá bezpečne
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Odkazujte na tajomstvá v azure.yaml
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

### Sieťová bezpečnosť
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Správa identít a prístupu
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

## 🚨 Stratégie rollbacku

### Rýchly rollback
```bash
# AZD nemá vstavanú možnosť vrátenia zmien (rollback). Odporúčané postupy:

# Možnosť 1: Znovu nasadiť z Gitu (odporúčané)
git revert HEAD  # Vrátiť problematický commit
git push
azd deploy

# Možnosť 2: Znovu nasadiť konkrétny commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback infraštruktúry
```bash
# Náhľad zmien infraštruktúry pred ich aplikovaním
azd provision --preview

# Pre vrátenie infraštruktúry použite riadenie verzií:
git revert HEAD  # Vrátiť zmeny infraštruktúry
azd provision    # Aplikovať predchádzajúci stav infraštruktúry
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

## 📊 Metriky nasadení

### Sledovať výkon nasadenia
```bash
# Zobraziť aktuálny stav nasadenia
azd show

# Monitorovať aplikáciu pomocou Application Insights
azd monitor --overview

# Zobraziť metriky v reálnom čase
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

### 1. Konzistencia prostredia
```bash
# Používajte konzistentné pomenovanie
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Zachovajte zhodnosť prostredí
./scripts/sync-environments.sh
```

### 2. Overenie infraštruktúry
```bash
# Prezrieť zmeny infraštruktúry pred nasadením
azd provision --preview

# Použiť lintovanie pre ARM/Bicep
az bicep lint --file infra/main.bicep

# Overiť syntax Bicep
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

### 4. Dokumentácia a logovanie
```bash
# Zdokumentujte postupy nasadzovania
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Ďalšie kroky

- [Provisioning prostriedkov](provisioning.md) - Hlboký ponor do správy infraštruktúry
- [Plánovanie pred nasadením](../chapter-06-pre-deployment/capacity-planning.md) - Naplánujte si svoju stratégiu nasadenia
- [Bežné problémy](../chapter-07-troubleshooting/common-issues.md) - Riešte problémy s nasadením
- [Najlepšie postupy](../chapter-07-troubleshooting/debugging.md) - Stratégie nasadenia pripravené pre produkciu

## 🎯 Praktické cvičenia nasadenia

### Cvičenie 1: Inkrementálny pracovný tok nasadenia (20 minút)
**Cieľ**: Ovládnuť rozdiel medzi kompletnými a inkrementálnymi nasadeniami

```bash
# Počiatočné nasadenie
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zaznamenať čas počiatočného nasadenia
echo "Full deployment: $(date)" > deployment-log.txt

# Urobiť zmenu v kóde
echo "// Updated $(date)" >> src/api/src/server.js

# Nasadiť len kód (rýchlo)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Porovnať časy
cat deployment-log.txt

# Vyčistiť
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Plné nasadenie trvá 5-15 minút
- [ ] Nasadenie len kódu trvá 2-5 minút
- [ ] Zmeny v kóde sa prejavia v nasadenej aplikácii
- [ ] Infraštruktúra zostáva nezmenená po `azd deploy`

**Výsledok učenia**: `azd deploy` je o 50-70% rýchlejší než `azd up` pri zmenách v kóde

### Cvičenie 2: Vlastné hooky nasadenia (30 minút)
**Cieľ**: Implementovať automatizáciu pred a po nasadení

```bash
# Vytvoriť validačný skript pred nasadením
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Skontrolovať, či testy prejdú
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Skontrolovať necommitované zmeny
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Vytvoriť smoke test po nasadení
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

# Pridať hooky do azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Otestovať nasadenie s hookmi
azd deploy
```

**Kritériá úspechu:**
- [ ] Skript pre pred-deploy sa spustí pred nasadením
- [ ] Nasadenie sa ukončí, ak testy zlyhajú
- [ ] Post-deploy smoke test overí zdravie
- [ ] Hooky sa vykonávajú v správnom poradí

### Cvičenie 3: Stratégia nasadenia vo viacerých prostrediach (45 minút)
**Cieľ**: Implementovať fázový pracovný tok nasadenia (dev → staging → production)

```bash
# Vytvoriť nasadzovací skript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Krok 1: Nasadiť do vývojového prostredia
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 2: Nasadiť do stagingového prostredia
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Manuálne schválenie pred nasadením do produkcie
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

# Vytvoriť prostredia
azd env new dev
azd env new staging
azd env new production

# Spustiť nasadenie v etapách
./deploy-staged.sh
```

**Kritériá úspechu:**
- [ ] Dev prostredie sa úspešne nasadí
- [ ] Staging prostredie sa úspešne nasadí
- [ ] Pre produkciu je vyžadované manuálne schválenie
- [ ] Všetky prostredia majú funkčné health checky
- [ ] Je možné vykonať rollback v prípade potreby

### Cvičenie 4: Stratégia rollbacku (25 minút)
**Cieľ**: Implementovať a otestovať rollback nasadenia pomocou Git

```bash
# Nasadiť v1
azd env set APP_VERSION "1.0.0"
azd up

# Uložiť hash commitu v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Nasadiť v2 s nekompatibilnou zmenou
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Zistiť zlyhanie a vrátiť systém do predchádzajúceho stavu
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Vrátenie do predchádzajúcej verzie pomocou gitu
    git revert HEAD --no-edit
    
    # Obnovenie prostredia
    azd env set APP_VERSION "1.0.0"
    
    # Znovu nasadiť v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kritériá úspechu:**
- [ ] Je možné detekovať zlyhania nasadenia
- [ ] Rollback skript sa spustí automaticky
- [ ] Aplikácia sa vráti do funkčného stavu
- [ ] Po rollbacku prejdú health checky

## 📊 Sledovanie metrík nasadenia

### Sledujte výkon vášho nasadenia

```bash
# Vytvoriť skript metrík nasadenia
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

# Zapisovať do súboru
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Použite to
./track-deployment.sh
```

**Analyzujte svoje metriky:**
```bash
# Zobraziť históriu nasadení
cat deployment-metrics.csv

# Vypočítať priemerný čas nasadenia
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatočné zdroje

- [Referenčná príručka nasadenia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nasadenie Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nasadenie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nasadenie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigácia**
- **Predchádzajúca lekcia**: [Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **Ďalšia lekcia**: [Provisioning prostriedkov](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, majte na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->