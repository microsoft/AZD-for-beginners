# Príručka na nasadenie - Ovládnutie nasadení AZD

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 3: Konfigurácia](../getting-started/configuration.md)
- **➡️ Ďalej**: [Zriaďovanie zdrojov](provisioning.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 5: Riešenia AI s viacerými agentmi](../../examples/retail-scenario.md)

## Úvod

Táto komplexná príručka pokrýva všetko, čo potrebujete vedieť o nasadzovaní aplikácií pomocou Azure Developer CLI, od základných nasadení jedným príkazom až po pokročilé produkčné scenáre s vlastnými hookmi, viacerými prostrediami a integráciou CI/CD. Ovládnite celý životný cyklus nasadenia s praktickými príkladmi a osvedčenými postupmi.

## Ciele učenia

Po dokončení tejto príručky:
- Ovládnete všetky príkazy a pracovné postupy nasadenia Azure Developer CLI
- Pochopíte celý životný cyklus nasadenia od zriaďovania po monitorovanie
- Implementujete vlastné hooky pre automatizáciu pred a po nasadení
- Nakonfigurujete viaceré prostredia s parametrami špecifickými pre prostredie
- Nastavíte pokročilé stratégie nasadenia vrátane blue-green a kanárskych nasadení
- Integrujete nasadenia azd s CI/CD pipeline a DevOps pracovnými postupmi

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne vykonávať a riešiť problémy všetkých pracovných postupov nasadenia azd
- Navrhovať a implementovať vlastnú automatizáciu nasadenia pomocou hookov
- Nakonfigurovať produkčne pripravené nasadenia s primeranou bezpečnosťou a monitorovaním
- Spravovať zložité scenáre nasadenia s viacerými prostrediami
- Optimalizovať výkon nasadenia a implementovať stratégie návratu späť
- Integrovať nasadenia azd do podnikových DevOps praktík

## Prehľad nasadenia

Azure Developer CLI poskytuje niekoľko príkazov na nasadenie:
- `azd up` - Kompletný pracovný postup (zriaďovanie + nasadenie)
- `azd provision` - Vytvorenie/aktualizácia iba Azure zdrojov
- `azd deploy` - Nasadenie iba aplikačného kódu
- `azd package` - Vytvorenie a zabalenie aplikácií

## Základné pracovné postupy nasadenia

### Kompletné nasadenie (azd up)
Najbežnejší pracovný postup pre nové projekty:
```bash
# Nasadiť všetko od začiatku
azd up

# Nasadiť so špecifickým prostredím
azd up --environment production

# Nasadiť s vlastnými parametrami
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nasadenie iba infraštruktúry
Keď potrebujete aktualizovať iba Azure zdroje:
```bash
# Poskytnúť/aktualizovať infraštruktúru
azd provision

# Poskytnúť s dry-run na náhľad zmien
azd provision --preview

# Poskytnúť konkrétne služby
azd provision --service database
```

### Nasadenie iba kódu
Pre rýchle aktualizácie aplikácie:
```bash
# Nasadiť všetky služby
azd deploy

# Očakávaný výstup:
# Nasadzovanie služieb (azd deploy)
# - web: Nasadzovanie... Hotovo
# - api: Nasadzovanie... Hotovo
# ÚSPECH: Vaše nasadenie bolo dokončené za 2 minúty 15 sekúnd

# Nasadiť konkrétnu službu
azd deploy --service web
azd deploy --service api

# Nasadiť s vlastnými argumentmi zostavenia
azd deploy --service api --build-arg NODE_ENV=production

# Overiť nasadenie
azd show --output json | jq '.services'
```

### ✅ Overenie nasadenia

Po akomkoľvek nasadení overte úspešnosť:

```bash
# Skontrolujte, či všetky služby bežia
azd show

# Otestujte zdravotné koncové body
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Skontrolujte logy na chyby
azd logs --service api --since 5m | grep -i error
```

**Kritériá úspechu:**
- ✅ Všetky služby zobrazujú stav "Beží"
- ✅ Koncové body zdravia vracajú HTTP 200
- ✅ Žiadne chybové logy za posledných 5 minút
- ✅ Aplikácia reaguje na testovacie požiadavky

## 🏗️ Pochopenie procesu nasadenia

### Fáza 1: Hooky pred zriaďovaním
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

### Fáza 2: Zriaďovanie infraštruktúry
- Číta šablóny infraštruktúry (Bicep/Terraform)
- Vytvára alebo aktualizuje Azure zdroje
- Konfiguruje sieť a bezpečnosť
- Nastavuje monitorovanie a logovanie

### Fáza 3: Hooky po zriaďovaní
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

### Fáza 4: Balenie aplikácie
- Kompiluje aplikačný kód
- Vytvára artefakty nasadenia
- Balí pre cieľovú platformu (kontajnery, ZIP súbory atď.)

### Fáza 5: Hooky pred nasadením
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
- Spúšťa/reštartuje služby

### Fáza 7: Hooky po nasadení
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

### Nastavenia nasadenia špecifické pre služby
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

# Testovacie prostredie
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
# Vytvorte modré prostredie
azd env new production-blue
azd up --environment production-blue

# Otestujte modré prostredie
./scripts/test-environment.sh production-blue

# Presmerujte prevádzku na modré (manuálna aktualizácia DNS/load balancera)
./scripts/switch-traffic.sh production-blue

# Vyčistite zelené prostredie
azd env select production-green
azd down --force
```

### Kanárske nasadenia
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

### Stupňovité nasadenia
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

### Nasadenia aplikácií v kontajneroch
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

### Optimalizácia viacstupňového Dockerfile
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

### Paralelné nasadenia
```bash
# Nakonfigurujte paralelné nasadenie
azd config set deploy.parallelism 5

# Nasadzujte služby paralelne
azd deploy --parallel
```

### Cacheovanie buildov
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

### Inkrementálne nasadenia
```bash
# Nasadiť iba zmenené služby
azd deploy --incremental

# Nasadiť s detekciou zmien
azd deploy --detect-changes
```

## 🔍 Monitorovanie nasadenia

### Monitorovanie nasadenia v reálnom čase
```bash
# Monitorujte priebeh nasadenia
azd deploy --follow

# Zobraziť logy nasadenia
azd logs --follow --service api

# Skontrolujte stav nasadenia
azd show --service api
```

### Kontroly zdravia
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

### Validácia po nasadení
```bash
#!/bin/bash
# skripty/validate-deployment.sh

echo "Validating deployment..."

# Skontrolujte stav aplikácie
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

## 🔐 Bezpečnostné úvahy

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

### Správa identity a prístupu
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

## 🚨 Stratégie návratu späť

### Rýchly návrat späť
```bash
# Vrátiť sa k predchádzajúcemu nasadeniu
azd deploy --rollback

# Vrátiť konkrétnu službu
azd deploy --service api --rollback

# Vrátiť sa ku konkrétnej verzii
azd deploy --service api --version v1.2.3
```

### Návrat späť infraštruktúry
```bash
# Vrátiť zmeny infraštruktúry
azd provision --rollback

# Náhľad zmien vrátenia
azd provision --rollback --preview
```

### Návrat späť migrácie databázy
```bash
#!/bin/bash
# skripty/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metodika nasadenia

### Sledovanie výkonu nasadenia
```bash
# Povoliť metriky nasadenia
azd config set telemetry.deployment.enabled true

# Zobraziť históriu nasadenia
azd history

# Získať štatistiky nasadenia
azd metrics --type deployment
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

## 🎯 Osvedčené postupy

### 1. Konzistentnosť prostredí
```bash
# Používajte konzistentné názvy
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Zachovajte paritu prostredia
./scripts/sync-environments.sh
```

### 2. Validácia infraštruktúry
```bash
# Overiť pred nasadením
azd provision --preview
azd provision --what-if

# Použiť lintovanie ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Testovanie integrácie
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
# Dokumentovať postupy nasadenia
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Ďalšie kroky

- [Zriaďovanie zdrojov](provisioning.md) - Hlbší pohľad na správu infraštruktúry
- [Plánovanie pred nasadením](../pre-deployment/capacity-planning.md) - Naplánujte si stratégiu nasadenia
- [Bežné problémy](../troubleshooting/common-issues.md) - Riešenie problémov s nasadením
- [Osvedčené postupy](../troubleshooting/debugging.md) - Produkčne pripravené stratégie nasadenia

## 🎯 Praktické cvičenia na nasadenie

### Cvičenie 1: Pracovný postup inkrementálneho nasadenia (20 minút)
**Cieľ**: Ovládnuť rozdiel medzi úplnými a inkrementálnymi nasadeniami

```bash
# Počiatočné nasadenie
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zaznamenať čas počiatočného nasadenia
echo "Full deployment: $(date)" > deployment-log.txt

# Urobiť zmenu v kóde
echo "// Updated $(date)" >> src/api/src/server.js

# Nasadiť iba kód (rýchlo)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Porovnať časy
cat deployment-log.txt

# Upratať
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Úplné nasadenie trvá 5-15 minút
- [ ] Nasadenie iba kódu trvá 2-5 minút
- [ ] Zmeny kódu sa prejavia v nasadenej aplikácii
- [ ] Infraštruktúra zostáva nezmenená po `azd deploy`

**Výsledok učenia**: `azd deploy` je o 50-70% rýchlejší ako `azd up` pre zmeny kódu

### Cvičenie 2: Vlastné hooky nasadenia (30 minút)
**Cieľ**: Implementovať automatizáciu pred a po nasadení

```bash
# Vytvorte skript na validáciu pred nasadením
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Skontrolujte, či testy prešli
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Skontrolujte neuložené zmeny
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Vytvorte skript na testovanie po nasadení
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

# Pridajte háčiky do azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Otestujte nasadenie s háčikmi
azd deploy
```

**Kritériá úspechu:**
- [ ] Skript pred nasadením sa spustí pred nasadením
- [ ] Nasadenie sa preruší, ak testy zlyhajú
- [ ] Test funkčnosti po nasadení overí zdravie
- [ ] Hooky sa vykonajú v správnom poradí

### Cvičenie 3: Stratégia nasadenia s viacerými prostrediami (45 minút)
**Cieľ**: Implementovať stupňovitý pracovný postup nasadenia (dev → staging → produkcia)

```bash
# Vytvorte skript nasadenia
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Krok 1: Nasadiť na vývoj
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 2: Nasadiť na testovanie
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Manuálne schválenie pre produkciu
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

# Vytvorte prostredia
azd env new dev
azd env new staging
azd env new production

# Spustite postupné nasadenie
./deploy-staged.sh
```

**Kritériá úspechu:**
- [ ] Prostredie dev sa úspešne nasadí
- [ ] Prostredie staging sa úspešne nasadí
- [ ] Manuálne schválenie je potrebné pre produkciu
- [ ] Všetky prostredia majú funkčné kontroly zdravia
- [ ] Možnosť návratu späť, ak je to potrebné

### Cvičenie 4: Stratégia návratu späť (25 minút)
**Cieľ**: Implementovať a otestovať návrat nasadenia

```bash
# Nasadiť v1
azd env set APP_VERSION "1.0.0"
azd up

# Uložiť konfiguráciu v1
cp -r .azure/production .azure/production-v1-backup

# Nasadiť v2 s nekompatibilnou zmenou
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Zistiť zlyhanie
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Vrátiť kód späť
    git checkout src/api/src/server.js
    
    # Vrátiť prostredie späť
    azd env set APP_VERSION "1.0.0"
    
    # Znovu nasadiť v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kritériá úspechu:**
- [ ] Možnosť detekcie zlyhaní nasadenia
- [ ] Skript návratu späť sa spustí automaticky
- [ ] Aplikácia sa vráti do funkčného stavu
- [ ] Kontroly zdravia prejdú po návrate späť

## 📊 Sledovanie metrík nasadenia

### Sledujte výkon svojho nasadenia

```bash
# Vytvorte skript na metriky nasadenia
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

# Zaznamenajte do súboru
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Použite to
./track-deployment.sh
```

**Analyzujte svoje metriky:**
```bash
# Zobraziť históriu nasadenia
cat deployment-metrics.csv

# Vypočítať priemerný čas nasadenia
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ďalšie zdroje

- [Referenčná príručka nasadenia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nasadenie Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nasadenie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nasadenie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigácia**
- **Predchádzajúca lekcia**: [Váš prvý projekt](../getting-started/first-project.md)
- **Nasledujúca lekcia**: [Zriaďovanie zdrojov](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->