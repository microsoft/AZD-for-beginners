# Sprievodca nasadzovaním - Ovládnutie nasadení AZD

**Chapter Navigation:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)
- **➡️ Ďalšia**: [Zriaďovanie zdrojov](provisioning.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 5: Riešenia s viacerými AI agentmi](../../examples/retail-scenario.md)

## Úvod

Tento## Pochopenie procesu nasadzovaniakomplexný sprievodca pokrýva všetko, čo potrebujete vedieť o nasadzovaní aplikácií pomocou Azure Developer CLI, od základných jednovoľbových nasadení až po pokročilé produkčné scenáre s vlastnými hookmi, viacerými prostrediami a integráciou CI/CD. Ovládnite celý životný cyklus nasadzovania s praktickými príkladmi a osvedčenými postupmi.

## Ciele učenia

Po dokončení tohto sprievodcu budete:
- Ovládnite všetky príkazy a pracovné toky nasadenia Azure Developer CLI
- Pochopte celý životný cyklus nasadzovania od zriaďovania po monitorovanie
- Implementujte vlastné hooky pre automatizáciu pred a po nasadení
- Nakonfigurujte viacero prostredí s parametrami špecifickými pre prostredie
- Nastavte pokročilé stratégie nasadzovania vrátane blue-green a canary nasadení
- Integrujte nasadenia azd s CI/CD pipeline a DevOps pracovnými tokmi

## Očakávané výsledky

Po dokončení budete vedieť:
- Vykonávať a riešiť problémy so všetkými pracovnými tokmi nasadenia azd samostatne
- Navrhnúť a implementovať vlastnú automatizáciu nasadenia pomocou hookov
- Nakonfigurovať produkčné nasadenia s riadnym zabezpečením a monitorovaním
- Spravovať zložité scenáre nasadzovania s viacerými prostrediami
- Optimalizovať výkon nasadenia a implementovať stratégie vrátenia zmien (rollback)
- Integrovať nasadenia azd do podnikových DevOps postupov

## Prehľad nasadzovania

Azure Developer CLI poskytuje niekoľko príkazov na nasadenie:
- `azd up` - Kompletný pracovný tok (zriaďovanie + nasadenie)
- `azd provision` - Vytvorenie/aktualizácia iba Azure zdrojov
- `azd deploy` - Nasadenie iba kódu aplikácie
- `azd package` - Zostavenie a zabalenie aplikácií

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
Keď potrebujete len aktualizovať Azure zdroje:
```bash
# Nasadiť/aktualizovať infraštruktúru
azd provision

# Nasadiť v skúšobnom režime na náhľad zmien
azd provision --preview

# Nasadiť konkrétne služby
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
# ÚSPECH: Vaše nasadenie sa dokončilo za 2 minúty 15 sekúnd

# Nasadiť konkrétnu službu
azd deploy --service web
azd deploy --service api

# Nasadiť s vlastnými argumentmi zostavenia
azd deploy --service api --build-arg NODE_ENV=production

# Overiť nasadenie
azd show --output json | jq '.services'
```

### ✅ Overenie nasadenia

Po každom nasadení skontrolujte úspech:

```bash
# Skontrolujte, či všetky služby bežia
azd show

# Otestujte koncové body zdravotného stavu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorujte chyby (predvolene sa otvára v prehliadači)
azd monitor --logs
```

**Kritériá úspechu:**
- ✅ Všetky služby zobrazujú stav „Running“
- ✅ Koncové body zdravia vracajú HTTP 200
- ✅ Žiadne chybové logy za posledných 5 minút
- ✅ Aplikácia odpovedá na testovacie požiadavky

## 🏗️ Pochopenie procesu nasadzovania

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
- Konfiguruje sieťovanie a zabezpečenie
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

### Fáza 4: Balíčkovanie aplikácie
- Zostavuje kód aplikácie
- Vytvára artefakty nasadenia
- Baluje pre cieľovú platformu (kontajnery, ZIP súbory atď.)

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
- Štartuje/reštartuje služby

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

# Preprodukčné prostredie
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

# Presunúť prevádzku na modré (manuálna aktualizácia DNS/vyrovnávača záťaže)
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

### Postupné nasadenia
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

### Optimalizácia multi-stage Dockerfile
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
# Nasadiť konkrétnu službu pre rýchlejšiu iteráciu
azd deploy --service web
azd deploy --service api

# Nasadiť všetky služby
azd deploy
```

### Cacheovanie buildu
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efektívne nasadenia kódu
```bash
# Použite azd deploy (nie azd up) pre zmeny iba v kóde
# Týmto sa vynechá zriaďovanie infraštruktúry a je to oveľa rýchlejšie
azd deploy

# Nasadzujte konkrétnu službu pre najrýchlejšiu iteráciu
azd deploy --service api
```

## 🔍 Monitorovanie nasadení

### Monitorovanie nasadení v reálnom čase
```bash
# Monitorovať aplikáciu v reálnom čase
azd monitor --live

# Zobraziť protokoly aplikácie
azd monitor --logs

# Skontrolovať stav nasadenia
azd show
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

### Overenie po nasadení
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Skontrolovať zdravie aplikácie
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

## 🔐 Bezpečnostné hľadiská

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

### Riadenie identity a prístupu
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

## 🚨 Stratégie vrátenia zmien (rollback)

### Rýchle vrátenie zmien
```bash
# AZD nemá vstavané vrátenie zmien (rollback). Odporúčané postupy:

# Možnosť 1: Znovu nasadiť z Gitu (odporúčané)
git revert HEAD  # Vrátiť problematický commit
git push
azd deploy

# Možnosť 2: Znovu nasadiť konkrétny commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Vrátenie infraštruktúry
```bash
# Prezrite si zmeny infraštruktúry pred ich nasadením
azd provision --preview

# Pre obnovenie infraštruktúry použite systém správy verzií:
git revert HEAD  # Vrátiť zmeny infraštruktúry
azd provision    # Použiť predchádzajúci stav infraštruktúry
```

### Vrátenie migrácie databázy
```bash
#!/bin/bash
# skripty/vrátenie-databázy.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metričky nasadenia

### Sledovanie výkonu nasadenia
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
# Používajte konzistentné názvy
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Udržiavajte zhodu prostredí
./scripts/sync-environments.sh
```

### 2. Overenie infraštruktúry
```bash
# Prezrite si zmeny infraštruktúry pred nasadením
azd provision --preview

# Použite lintovanie ARM/Bicep
az bicep lint --file infra/main.bicep

# Overte syntax Bicep
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
# Zdokumentujte postupy nasadenia
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Ďalšie kroky

- [Zriaďovanie zdrojov](provisioning.md) - Hlboký ponor do správy infraštruktúry
- [Plánovanie pred nasadením](../chapter-06-pre-deployment/capacity-planning.md) - Naplánujte svoju stratégiu nasadenia
- [Bežné problémy](../chapter-07-troubleshooting/common-issues.md) - Riešte problémy s nasadením
- [Najlepšie postupy](../chapter-07-troubleshooting/debugging.md) - Stratégie nasadenia pripravené pre produkciu

## 🎯 Praktické cvičenia nasadzovania

### Cvičenie 1: Pracovný tok inkrementálneho nasadenia (20 minút)
**Cieľ**: Ovládnuť rozdiel medzi úplným a inkrementálnym nasadením

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

# Vyčistiť
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Úplné nasadenie trvá 5–15 minút
- [ ] Nasadenie iba kódu trvá 2–5 minút
- [ ] Zmeny v kóde sa prejavia v nasadenej aplikácii
- [ ] Infraštruktúra zostáva nezmenená po `azd deploy`

**Výsledok učenia**: `azd deploy` je o 50–70 % rýchlejší ako `azd up` pri zmenách v kóde

### Cvičenie 2: Vlastné hooky nasadenia (30 minút)
**Cieľ**: Implementovať automatizáciu pred a po nasadení

```bash
# Vytvoriť skript na overenie pred nasadením
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Skontrolovať, či testy prejdú
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Skontrolovať, či existujú neuložené (necommitované) zmeny
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Vytvoriť základný test po nasadení
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
- [ ] Skript pred nasadením sa spustí pred nasadením
- [ ] Nasadenie sa preruší, ak testy zlyhajú
- [ ] Smoke test po nasadení overí stav zdravia
- [ ] Hooky sa vykonajú v správnom poradí

### Cvičenie 3: Stratégia nasadenia pre viaceré prostredia (45 minút)
**Cieľ**: Implementovať postupný pracovný tok nasadenia (dev → staging → production)

```bash
# Vytvorte skript nasadenia
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

# Krok 3: Ručné schválenie pre produkciu
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

# Spustiť postupné nasadenie
./deploy-staged.sh
```

**Kritériá úspechu:**
- [ ] Dev prostredie sa nasadí úspešne
- [ ] Staging prostredie sa nasadí úspešne
- [ ] Pre produkciu je vyžadované manuálne schválenie
- [ ] Všetky prostredia majú fungujúce kontroly zdravia
- [ ] Možnosť vrátenia zmien, ak je potrebné

### Cvičenie 4: Stratégia vrátenia zmien (25 minút)
**Cieľ**: Implementovať a otestovať vrátenie nasadenia pomocou Git

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

# Zistiť zlyhanie a vrátiť späť
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Obnovenie cez git
    git revert HEAD --no-edit
    
    # Obnovenie prostredia
    azd env set APP_VERSION "1.0.0"
    
    # Znovu nasadiť v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kritériá úspechu:**
- [ ] Dokáže detegovať zlyhania nasadenia
- [ ] Skript na vrátenie zmien sa vykoná automaticky
- [ ] Aplikácia sa vráti do funkčného stavu
- [ ] Kontroly zdravia prejdú po vrátení zmien

## 📊 Sledovanie metrík nasadenia

### Sledujte výkon svojho nasadenia

```bash
# Vytvoriť skript pre metriky nasadenia
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

## Ďalšie zdroje

- [Referenčné informácie k nasadeniu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Nasadenie Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Nasadenie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Nasadenie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigácia**
- **Predchádzajúca lekcia**: [Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **Nasledujúca lekcia**: [Zriaďovanie zdrojov](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zrieknutie sa zodpovednosti:
Tento dokument bol preložený s využitím služby AI na preklad Co-op Translator (https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady, ktoré vzniknú v dôsledku použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->