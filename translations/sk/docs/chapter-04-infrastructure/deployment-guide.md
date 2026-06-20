# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Úvod

Tento komplexný sprievodca pokrýva všetko, čo potrebujete vedieť o nasadzovaní aplikácií pomocou Azure Developer CLI, od základných nasadení jedným príkazom až po pokročilé produkčné scenáre s vlastnými hookmi, viacerými prostrediami a integráciou CI/CD. Ovládnite kompletný životný cyklus nasadenia pomocou praktických príkladov a osvedčených postupov.

## Ciele učenia

Po absolvovaní tohto sprievodcu budete:
- Ovládať všetky príkazy a pracovné postupy nasadenia Azure Developer CLI
- Rozumieť celému životnému cyklu nasadenia od provisioning až po monitoring
- Implementovať vlastné hooky pre automatizáciu pred a po nasadení
- Konfigurovať viacero prostredí s parametrami špecifickými pre prostredie
- Nastaviť pokročilé stratégie nasadenia vrátane blue-green a canary nasadení
- Integrovať azd nasadenia s CI/CD pipeline a DevOps pracovnými tokmi

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne vykonávať a riešiť problémy so všetkými azd pracovnými tokmi nasadenia
- Navrhnúť a implementovať vlastnú automatizáciu nasadenia pomocou hookov
- Konfigurovať produkčné nasadenia s primeranou bezpečnosťou a monitorovaním
- Spravovať zložité scenáre nasadenia s viacerými prostrediami
- Optimalizovať výkon nasadenia a implementovať stratégie vrátenia zmien
- Integrovať azd nasadenia do podnikových DevOps praktík

## Prehľad nasadenia

Azure Developer CLI poskytuje niekoľko príkazov na nasadenie:
- `azd up` - Kompletný pracovný tok (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Nasadiť iba kód aplikácie
- `azd package` - Zostaviť a zabaliť aplikácie

## Základné pracovné postupy nasadenia

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
# Zabezpečiť/aktualizovať infraštruktúru
azd provision

# Nasadiť so simuláciou (dry-run) pre náhľad zmien
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

Po každom nasadení overte úspech:

```bash
# Skontrolujte, či všetky služby bežia
azd show

# Otestujte koncové body stavu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorujte chyby (štandardne sa otvára v prehliadači)
azd monitor --logs
```

**Kritériá úspechu:**
- ✅ Všetky služby majú stav "Running"
- ✅ Health endpointy vracajú HTTP 200
- ✅ Žiadne chybové logy za posledných 5 minút
- ✅ Aplikácia reaguje na testovacie požiadavky

## 🏗️ Pochopenie procesu nasadenia

### Nový na hookoch? Začnite tu

A **hook** je príkaz, ktorý azd spustí automaticky v konkrétnom momente procesu nasadenia — pred alebo po provisioningu a pred alebo po nasadení vášho kódu. Umožňujú automatizovať malé úlohy, ktoré vždy sprevádzajú nasadenie: naplnenie databázy, spustenie migrácií, zostavenie assetov alebo smoke test live aplikácie.

| Hook | Spúšťa sa… | Bežné použitie |
|------|------------|----------------|
| `preprovision` | Before resources are created | Validate prerequisites, log in to a registry |
| `postprovision` | After resources exist | Configure resources, set up the database |
| `predeploy` | Before code is deployed | Build front-end assets, run unit tests |
| `postdeploy` | After code is live | Run DB migrations, smoke-test the endpoint |

Hooky sú definované vo vašom `azure.yaml`. Tu je najmenší možný príklad — po nasadení len vytlačí správu:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je všetko — nabudúce, keď spustíte `azd up`, správa sa automaticky vypíše. Hook môžete tiež spustiť samostatne, bez celého nasadenia, čo je skvelé na testovanie:

```bash
azd hooks run postdeploy
```

Nižšie fázy ukazujú reálne hooky (migrácie, testy, validácia) pre každú fázu.

### Fáza 1: Pred-provision hooky
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

### Fáza 2: Provision infraštruktúry
- Číta infraštruktúrne šablóny (Bicep/Terraform)
- Vytvára alebo aktualizuje Azure zdroje
- Konfiguruje sieťovanie a bezpečnosť
- Nastavuje monitoring a logovanie

### Fáza 3: Post-provision hooky
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
- Zostavuje kód aplikácie
- Vytvára artefakty nasadenia
- Balí pre cieľovú platformu (kontajnery, ZIP súbory atď.)

### Fáza 5: Pred-deploy hooky
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

### Fáza 7: Post-deploy hooky
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

### Riešenie chýb hookov

Štandardne **ak príkaz hooku skončí s návratovým kódom rôznym od nuly, azd zastaví celú operáciu.** To je väčšinou žiaduce — zlyhaná migrácia by mala zastaviť nasadenie, nie dodať pokazenú aplikáciu. Znamená to však, že hooky treba písať starostlivo.

**1. Urobte chyby hlasnými a zámerným rozhodnutím.** Hook zlyhá, keď jeho posledný príkaz vráti nenulový exit kód. V shell skriptoch pridajte `set -e`, aby sa hook zastavil pri prvom zlyhanom príkaze namiesto tichého pokračovania:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Povoliť, aby hook zlyhal bez zastavenia azd.** Pre ne-kritické kroky (voliteľné warming cache, notifikácia na najlepšie úsilie) nastavte `continueOnError: true`. azd zaznamená zlyhanie, ale pokračuje ďalej:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testujte hooky izolovane pred úplným behom.** Nemusíte spúšťať `azd up` na ladenie hooku — spustite ho samostatne a rýchlo iterujte:

```bash
azd hooks run predeploy          # spustí len hák pred nasadením
azd hooks run postdeploy --service api
```

**4. Dávajte pozor na špecifické shelly pre OS.** Hook používajúci `shell: pwsh` potrebuje PowerShell nainštalovaný na stroji, ktorý ho spúšťa (vrátane CI agentov). Použite `shell: sh` pre najširšiu prenositeľnosť, alebo poskytnite varianty pre `windows` a `posix`:

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

> **Tip na ladenie:** spustite akýkoľvek azd príkaz s `--debug`, aby ste videli presný príkaz hooku a jeho celý výstup — neoceniteľné, keď hook funguje lokálne, ale zlyhá v CI.

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

# Presmerovať prevádzku na modré prostredie (ručná aktualizácia DNS/vyrovnávača záťaže)
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

### Staged nasadenia
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

### Nasadenia Container App
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

### Nasadenia špecifické pre službu
```bash
# Nasadiť konkrétnu službu pre rýchlejšie iterácie
azd deploy --service web
azd deploy --service api

# Nasadiť všetky služby
azd deploy
```

### Caching pri zostavovaní
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efektívne nasadenie kódu
```bash
# Použite azd deploy (nie azd up) pre zmeny iba v kóde
# Týmto sa preskočí zriaďovanie infraštruktúry a je to omnoho rýchlejšie
azd deploy

# Nasadiť konkrétnu službu pre najrýchlejšiu iteráciu
azd deploy --service api
```

## 🔍 Monitorovanie nasadenia

### Monitorovanie nasadenia v reálnom čase
```bash
# Sledovať aplikáciu v reálnom čase
azd monitor --live

# Zobraziť logy aplikácie
azd monitor --logs

# Skontrolovať stav nasadenia
azd show
```

### Health checky
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

# Skontrolovať stav aplikácie
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

### Identity a správa prístupu
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

## 🚨 Stratégie vrátenia

### Rýchle vrátenie
```bash
# AZD nemá vstavanú funkciu rollback. Odporúčané postupy:

# Možnosť 1: Znovu nasadiť z Git (odporúčané)
git revert HEAD  # Vráťte problematický commit
git push
azd deploy

# Možnosť 2: Znovu nasadiť konkrétny commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Vrátenie infraštruktúry
```bash
# Prezrite si zmeny infraštruktúry pred ich aplikovaním
azd provision --preview

# Na vrátenie infraštruktúry použite systém správy verzií:
git revert HEAD  # Vrátiť zmeny infraštruktúry
azd provision    # Aplikovať predchádzajúci stav infraštruktúry
```

### Vrátenie migrácií databázy
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metriky nasadenia

### Sledovanie výkonu nasadenia
```bash
# Zobraziť aktuálny stav nasadenia
azd show

# Monitorovať aplikáciu pomocou Application Insights
azd monitor --overview

# Zobraziť metriky v reálnom čase
azd monitor --live
```

### Zbieranie vlastných metrík
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

# Udržiavajte súlad medzi prostrediami
./scripts/sync-environments.sh
```

### 2. Validácia infraštruktúry
```bash
# Náhľad zmien infraštruktúry pred nasadením
azd provision --preview

# Použiť lintovanie ARM/Bicep
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
# Zdokumentujte postupy nasadenia
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Ďalšie kroky

- [Provisioning Resources](provisioning.md) - Hlbší ponor do správy infraštruktúry
- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Naplánujte si stratégiu nasadenia
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Riešenie problémov s nasadením
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Produkčné stratégie nasadenia

## 🎯 Praktické cvičenia nasadenia

### Cvičenie 1: Inkrementálny pracovný tok nasadenia (20 minút)
**Cieľ**: Ovládnuť rozdiel medzi kompletným a inkrementálnym nasadením

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
- [ ] Kompletné nasadenie trvá 5–15 minút
- [ ] Nasadenie len kódu trvá 2–5 minút
- [ ] Zmeny v kóde sa prejavia v nasadenej aplikácii
- [ ] Infraštruktúra zostáva nezmenená po `azd deploy`

**Výsledok učenia**: `azd deploy` je o 50–70 % rýchlejší než `azd up` pri zmenách v kóde

### Cvičenie 2: Vlastné deploy hooky (30 minút)
**Cieľ**: Implementovať pred a po nasadení automatizáciu

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

# Skontrolovať, či existujú necommitované zmeny
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
- [ ] Pred-deploy skript beží pred nasadením
- [ ] Nasadenie sa zruší, ak testy zlyhajú
- [ ] Post-deploy smoke test overí zdravie
- [ ] Hooky sa vykonávajú v správnom poradí

### Cvičenie 3: Stratégia nasadenia pre viac prostredí (45 minút)
**Cieľ**: Implementovať staged pracovný tok nasadenia (dev → staging → production)

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

# Krok 2: Nasadiť do staging prostredia
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Manuálne schválenie pre nasadenie do produkcie
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

# Spustiť etapové nasadenie
./deploy-staged.sh
```

**Kritériá úspechu:**
- [ ] Dev prostredie sa úspešne nasadí
- [ ] Staging prostredie sa úspešne nasadí
- [ ] Pre produkciu je vyžadované manuálne schválenie
- [ ] Všetky prostredia majú funkčné health checky
- [ ] Možnosť vrátenia zmien, ak je to potrebné

### Cvičenie 4: Stratégia vrátenia (25 minút)
**Cieľ**: Implementovať a otestovať rollback nasadenia pomocou Gitu

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
    
    # Obnovenie pomocou Gitu
    git revert HEAD --no-edit
    
    # Obnovenie prostredia
    azd env set APP_VERSION "1.0.0"
    
    # Znovu nasadiť v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kritériá úspechu:**
- [ ] Dokáže detekovať zlyhania nasadenia
- [ ] Rollback skript sa automaticky spustí
- [ ] Aplikácia sa vráti do fungujúceho stavu
- [ ] Health checky prejdú po rollbacks

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Zapisovať do súboru
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Použiť to
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

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigácia**
- **Predchádzajúca lekcia**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Ďalšia lekcia**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->