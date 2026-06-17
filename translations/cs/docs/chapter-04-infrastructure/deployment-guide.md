# Průvodce nasazením - Zvládnutí nasazení AZD

**Navigace kapitolou:**
- **📚 Course Home**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 4 - Infrastruktura jako kód a nasazení
- **⬅️ Předchozí kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)
- **➡️ Další**: [Zřizování prostředků](provisioning.md)
- **🧩 Také v této kapitole**: [Tvorba vlastní šablony](custom-templates.md)
- **🚀 Další kapitola**: [Kapitola 5: AI řešení s více agenty](../../examples/retail-scenario.md)

## Úvod

Tento komplexní průvodce pokrývá vše, co potřebujete vědět o nasazování aplikací pomocí Azure Developer CLI, od základních jednopříkazových nasazení až po pokročilé produkční scénáře s vlastními hooky, více prostředími a integrací CI/CD. Ovládněte celý životní cyklus nasazení pomocí praktických příkladů a osvědčených postupů.

## Cíle učení

Po dokončení tohoto průvodce:
- Osvojíte si všechny příkazy a pracovní postupy nasazení Azure Developer CLI
- Pochopíte celý životní cyklus nasazení od provisioningu po monitoring
- Implementujete vlastní hooky pro automatizaci před a po nasazení
- Nakonfigurujete více prostředí s parametry specifickými pro prostředí
- Nastavíte pokročilé strategie nasazení včetně blue-green a canary nasazení
- Integrujete azd nasazení s CI/CD pipeline a DevOps pracovními toky

## Výsledky učení

Po dokončení budete schopni:
- Samostatně spouštět a řešit problémy se všemi azd nasazovacími pracovními postupy
- Navrhovat a implementovat vlastní nasazovací automatizace pomocí hooků
- Konfigurovat nasazení připravená pro produkci s odpovídajícím zabezpečením a monitoringem
- Spravovat složité scénáře nasazení napříč více prostředími
- Optimalizovat výkon nasazení a implementovat strategie rollbacku
- Integrovat azd nasazení do podnikových DevOps postupů

## Přehled nasazení

Azure Developer CLI poskytuje několik příkazů pro nasazení:
- `azd up` - Kompletní pracovní postup (vytvoření prostředků + nasazení)
- `azd provision` - Vytvořit/aktualizovat pouze Azure zdroje
- `azd deploy` - Nasadit pouze kód aplikace
- `azd package` - Sestavit a zabalit aplikace

## Základní pracovní postupy nasazení

### Kompletní nasazení (azd up)
Nejčastější pracovní postup pro nové projekty:
```bash
# Nasadit vše od začátku
azd up

# Nasadit s konkrétním prostředím
azd up --environment production

# Nasadit s vlastními parametry
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nasazení pouze infrastruktury
Když potřebujete pouze aktualizovat Azure zdroje:
```bash
# Zajistit/aktualizovat infrastrukturu
azd provision

# Nasadit v režimu dry-run pro náhled změn
azd provision --preview

# Nasadit konkrétní služby
azd provision --service database
```

### Nasazení pouze kódu
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

### ✅ Ověření nasazení

Po jakémkoli nasazení ověřte úspěšnost:

```bash
# Zkontrolujte, zda všechny služby běží
azd show

# Otestujte koncové body kontroly stavu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorujte chyby (ve výchozím nastavení se otevře v prohlížeči)
azd monitor --logs
```

**Kritéria úspěchu:**
- ✅ Všechny služby zobrazují stav "Running"
- ✅ Kontrolní koncové body vracejí HTTP 200
- ✅ Žádné chybové záznamy za posledních 5 minut
- ✅ Aplikace odpovídá na testovací požadavky

## 🏗️ Pochopení procesu nasazení

### Neznáte hooks? Začněte zde

A **hook** je příkaz, který azd spouští automaticky v konkrétním okamžiku nasazovacího procesu — před nebo po provisioningu a před nebo po nasazení vašeho kódu. Umožňují automatizovat malé úkoly, které vždy obklopují nasazení: naplnění databáze, spuštění migrací, sestavení assetů nebo rychlé testování běžící aplikace.

| Hook | Běží… | Běžné použití |
|------|-------|------------|
| `preprovision` | Před vytvořením prostředků | Ověřit předpoklady, přihlásit se do registru |
| `postprovision` | Po vytvoření prostředků | Konfigurovat zdroje, nastavit databázi |
| `predeploy` | Před nasazením kódu | Sestavit front-end assety, spustit jednotkové testy |
| `postdeploy` | Po nasazení kódu | Spustit migrace DB, provést smoke-test endpointu |

Hooky jsou definovány ve vašem `azure.yaml`. Zde je nejmenší možný příklad — pouze vytiskne zprávu po nasazení:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To je všechno — při příštím spuštění `azd up` se zpráva vytiskne automaticky. Hook můžete také spustit samostatně bez plného nasazení, což je skvělé pro testování:

```bash
azd hooks run postdeploy
```

Fáze níže ukazují reálné hooky (migrace, testy, validace) pro každé stádium.

### Fáze 1: Pre-Provision hooky
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
- Vytváří nebo aktualizuje Azure zdroje
- Konfiguruje síťování a zabezpečení
- Nastavuje monitoring a logování

### Fáze 3: Post-Provision hooky
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
- Sestavuje kód aplikace
- Vytváří artefakty nasazení
- Baluje pro cílovou platformu (kontejnery, ZIP soubory atd.)

### Fáze 5: Pre-Deploy hooky
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

### Fáze 7: Post-Deploy hooky
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

### Zpracování chyb hooků

Ve výchozím nastavení **pokud příkaz hooku skončí s nenulovým kódem, azd zastaví celou operaci.** To je obvykle žádoucí — neúspěšná migrace by měla zastavit nasazení, nikoli dodat rozbitou aplikaci. To však znamená, že hooky musí být psány pečlivě.

**1. Dejte chybám hlasitost a záměr.** Hook selže, když jeho poslední příkaz vrátí nenulový návratový kód. V shell skriptech přidejte `set -e`, aby hook skončil při prvním selhávajícím příkazu místo tichého pokračování:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Povolit, aby hook selhal, aniž by zastavil azd.** Pro nekritické kroky (volitelné zahřátí cache, oznámení na principu nejlepší snahy) nastavte `continueOnError: true`. azd zaznamená selhání, ale pokračuje dál:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testujte hooky izolovaně před plným spuštěním.** Nemusíte spouštět `azd up`, abyste ladili hook — spusťte ho samostatně a rychle iterujte:

```bash
azd hooks run predeploy          # spustí pouze predeploy hook
azd hooks run postdeploy --service api
```

**4. Dávejte pozor na shell specifické pro OS.** Hook používající `shell: pwsh` vyžaduje na stroji, který ho spouští (včetně CI agentů), nainstalovaný PowerShell. Pro co nejširší přenositelnost použijte `shell: sh`, nebo poskytněte varianty pro `windows` a `posix`:

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

> **Tip pro ladění:** spusťte jakýkoli azd příkaz s `--debug`, abyste viděli přesný příkaz hooku a jeho kompletní výstup — neocenitelné, když hook funguje lokálně, ale selhává v CI.

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

### Víceslužbové aplikace
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

# Přesměrovat provoz na modré (ruční aktualizace DNS nebo vyrovnávače zatížení)
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

### Fázovaná nasazení
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

### Optimalizace vícefázového Dockerfile
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

### Nasazení specifická pro službu
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
# Použijte azd deploy (nikoli azd up) pro změny pouze v kódu
# Tím se přeskočí zřizování infrastruktury a je to mnohem rychlejší
azd deploy

# Nasazujte konkrétní službu pro nejrychlejší iterace
azd deploy --service api
```

## 🔍 Monitoring nasazení

### Monitorování nasazení v reálném čase
```bash
# Sledovat aplikaci v reálném čase
azd monitor --live

# Zobrazit protokoly aplikace
azd monitor --logs

# Zkontrolovat stav nasazení
azd show
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

## 🔐 Bezpečnostní úvahy

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

### Síťové zabezpečení
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
# AZD nemá vestavěné vrácení změn. Doporučené postupy:

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
# Náhled změn infrastruktury před aplikací
azd provision --preview

# Pro vrácení změn infrastruktury použijte systém správy verzí:
git revert HEAD  # Vrátit změny infrastruktury
azd provision    # Aplikovat předchozí stav infrastruktury
```

### Rollback migrací databáze
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

### Sledování výkonu nasazení
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

## 🎯 Nejlepší postupy

### 1. Konzistence prostředí
```bash
# Používejte konzistentní pojmenování
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Udržujte konzistenci prostředí
./scripts/sync-environments.sh
```

### 2. Validace infrastruktury
```bash
# Náhled změn infrastruktury před nasazením
azd provision --preview

# Použít lintování ARM/Bicep
az bicep lint --file infra/main.bicep

# Ověřit syntaxi Bicepu
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

### 4. Dokumentace a logování
```bash
# Zdokumentujte postupy nasazení
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Další kroky

- [Zřizování prostředků](provisioning.md) - Podrobně o správě infrastruktury
- [Plánování před nasazením](../chapter-06-pre-deployment/capacity-planning.md) - Naplánujte svou strategii nasazení
- [Běžné problémy](../chapter-07-troubleshooting/common-issues.md) - Řešení problémů s nasazením
- [Nejlepší postupy](../chapter-07-troubleshooting/debugging.md) - Strategie nasazení připravené pro produkci

## 🎯 Praktická cvičení nasazení

### Cvičení 1: Inkrementální pracovní postup nasazení (20 minut)
**Cíl**: Ovládnout rozdíl mezi plným a inkrementálním nasazením

```bash
# Počáteční nasazení
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zaznamenat čas počátečního nasazení
echo "Full deployment: $(date)" > deployment-log.txt

# Provést změnu v kódu
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
- [ ] Nasazení pouze kódu trvá 2-5 minut
- [ ] Změny kódu se projeví v nasazené aplikaci
- [ ] Infrastruktura nezměněna po `azd deploy`

**Výsledek učení**: `azd deploy` je 50-70% rychlejší než `azd up` pro změny kódu

### Cvičení 2: Vlastní hooky nasazení (30 minut)
**Cíl**: Implementovat před- a po-nasazovací automatizaci

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

# Zkontrolovat necommitované změny
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
- [ ] Skript před nasazením se spustí před nasazením
- [ ] Nasazení se přeruší, pokud testy selžou
- [ ] Smoke test po nasazení ověřuje zdraví
- [ ] Hooky se spouští ve správném pořadí

### Cvičení 3: Strategie nasazení pro více prostředí (45 minut)
**Cíl**: Implementovat fázovaný pracovní postup nasazení (dev → staging → production)

```bash
# Vytvořit skript pro nasazení
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

# Krok 2: Nasadit do staging prostředí
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
- [ ] Vývojové prostředí (dev) se nasadí úspěšně
- [ ] Staging prostředí se nasadí úspěšně
- [ ] Pro produkci je vyžadováno manuální schválení
- [ ] Všechna prostředí mají funkční health checky
- [ ] Možnost vrácení změn v případě potřeby

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

# Zjistit selhání a vrátit nasazení
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Vrátit změny pomocí gitu
    git revert HEAD --no-edit
    
    # Vrátit prostředí
    azd env set APP_VERSION "1.0.0"
    
    # Znovu nasadit v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kritéria úspěchu:**
- [ ] Dokáže detekovat selhání nasazení
- [ ] Skript rollbacku se spustí automaticky
- [ ] Aplikace se vrátí do funkčního stavu
- [ ] Health checky projdou po rollbacku

## 📊 Sledování metrik nasazení

### Sledujte výkon nasazení

```bash
# Vytvořit skript pro metriky nasazení
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

# Zapisovat do souboru
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Použijte to
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

**Navigace**
- **Předchozí lekce**: [Váš první projekt](../chapter-01-foundation/first-project.md)
- **Další lekce**: [Zřizování prostředků](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->