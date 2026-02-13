# Käyttöönotto-opas - AZD-käyttöönottojen hallinta

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastruktuuri koodina ja käyttöönotto
- **⬅️ Edellinen luku**: [Luku 3: Määritys](../chapter-03-configuration/configuration.md)
- **➡️ Seuraava**: [Resurssien provisiointi](provisioning.md)
- **🚀 Seuraava luku**: [Luku 5: Moni-agenttiset tekoälyratkaisut](../../examples/retail-scenario.md)

## Johdanto

Tämä## Ymmärrys käyttöönoton prosessistakattava opas kattaa kaiken, mitä sinun tarvitsee tietää sovellusten käyttöönotosta Azure Developer CLI:llä, yksinkertaisista yhden komennon käyttöönoista edistyneisiin tuotantotilanteisiin mukautetuilla hookeilla, useilla ympäristöillä ja CI/CD-integraatiolla. Hallitse koko käyttöönoton elinkaari käytännön esimerkkien ja parhaiden käytäntöjen avulla.

## Oppimistavoitteet

By completing this guide, you will:
- Hallitse kaikki Azure Developer CLI:n käyttöönotto-komennot ja työnkulut
- Ymmärrä koko käyttöönoton elinkaari provisioinnista monitorointiin
- Ota käyttöön mukautetut hookit ennen ja jälkeen käyttöönoton tapahtuvaan automatisointiin
- Määritä useita ympäristöjä ympäristökohtaisilla parametreilla
- Ota käyttöön edistyneet käyttöönotto-strategiat, kuten blue-green- ja canary-käyttöönotot
- Integroi azd-käyttöönotot CI/CD-putkiin ja DevOps-työnkulkuihin

## Oppimistulokset

Upon completion, you will be able to:
- Suorita ja vianmäärää kaikki azd-käyttöönoton työnkulut itsenäisesti
- Suunnittele ja toteuta mukautettu käyttöönoton automatisointi hookeilla
- Määritä tuotantovalmiit käyttöönotot asianmukaisella tietoturvalla ja monitoroinnilla
- Hallitse monimutkaisia moniympäristöisiä käyttöönotto-skenaarioita
- Optimoi käyttöönottojen suorituskyky ja toteuta palautusstrategioita
- Integroi azd-käyttöönotot yrityksen DevOps-käytäntöihin

## Käyttöönoton yleiskatsaus

Azure Developer CLI tarjoaa useita käyttöönotto-komentoja:
- `azd up` - Täydellinen työnkulku (provisiointi + käyttöönotto)
- `azd provision` - Luo/päivitä vain Azure-resursseja
- `azd deploy` - Ota käyttöön vain sovelluskoodi
- `azd package` - Kokoa ja pakkaa sovellukset

## Peruskäyttöönoton työnkulut

### Täydellinen käyttöönotto (azd up)
Yleisin työnkulku uusille projekteille:
```bash
# Ota kaikki käyttöön alusta alkaen
azd up

# Ota käyttöön tietyssä ympäristössä
azd up --environment production

# Ota käyttöön mukautetuilla parametreilla
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Pelkkä infrastruktuurin käyttöönotto
Kun tarvitset vain Azure-resurssien päivittämistä:
```bash
# Ota käyttöön tai päivitä infrastruktuuri
azd provision

# Ota käyttöön dry-run-tilassa muutosten esikatselua varten
azd provision --preview

# Ota käyttöön tietyt palvelut
azd provision --service database
```

### Pelkkä koodin käyttöönotto
Nopeita sovelluspäivityksiä varten:
```bash
# Ota kaikki palvelut käyttöön
azd deploy

# Odotettu tuloste:
# Palveluiden käyttöönotto (azd deploy)
# - web: Käyttöönotetaan... Valmis
# - api: Käyttöönotetaan... Valmis
# ONNISTUI: Käyttöönotto valmistui 2 minuutissa ja 15 sekunnissa

# Ota tietty palvelu käyttöön
azd deploy --service web
azd deploy --service api

# Käytä mukautettuja rakennusargumentteja
azd deploy --service api --build-arg NODE_ENV=production

# Varmista käyttöönotto
azd show --output json | jq '.services'
```

### ✅ Käyttöönoton varmennus

Vahvista onnistuminen jokaisen käyttöönoton jälkeen:

```bash
# Tarkista, että kaikki palvelut ovat käynnissä
azd show

# Testaa terveystarkastuspäätepisteet
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Valvo virheiden varalta (avautuu oletuksena selaimessa)
azd monitor --logs
```

**Onnistumiskriteerit:**
- ✅ Kaikki palvelut näyttävät 'Käynnissä' tilan
- ✅ Terveystarkastuspäätepisteet palauttavat HTTP 200
- ✅ Viimeisen 5 minuutin aikana ei virhelokeja
- ✅ Sovellus vastaa testipyyntöihin

## 🏗️ Ymmärrys käyttöönoton prosessista

### Vaihe 1: Esiproviointi-hookit
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

### Vaihe 2: Infrastruktuurin provisiointi
- Lukee infrastruktuuri-malleja (Bicep/Terraform)
- Luo tai päivittää Azure-resursseja
- Määrittää verkot ja tietoturvan
- Ottaa käyttöön monitoroinnin ja lokituksen

### Vaihe 3: Jälkiprovisiointi-hookit
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

### Vaihe 4: Sovelluksen paketointi
- Kokoaa sovelluskoodin
- Luo käyttöönotto-artifakteja
- Pakkaa kohdealustalle (kontit, ZIP-tiedostot, jne.)

### Vaihe 5: Esikäyttöönotto-hookit
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

### Vaihe 6: Sovelluksen käyttöönotto
- Ota käyttöön pakatut sovellukset Azure-palveluihin
- Päivittää konfiguraatioasetuksia
- Käynnistää/uudelleenkäynnistää palvelut

### Vaihe 7: Jälkikäyttöönotto-hookit
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

## 🎛️ Käyttöönoton konfigurointi

### Palvelukohtaiset käyttöönottoasetukset
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

### Ympäristökohtaiset konfiguraatiot
```bash
# Kehitysympäristö
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Esituotantoympäristö
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Tuotantoympäristö
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Edistyneet käyttöönotto-skenaariot

### Monipalvelusovellukset
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

### Blue-Green-käyttöönotot
```bash
# Luo sininen ympäristö
azd env new production-blue
azd up --environment production-blue

# Testaa sinistä ympäristöä
./scripts/test-environment.sh production-blue

# Ohjaa liikenne siniseen (päivitä DNS tai kuormantasaaja manuaalisesti)
./scripts/switch-traffic.sh production-blue

# Siivoa vihreä ympäristö
azd env select production-green
azd down --force
```

### Canary-käyttöönotot
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

### Vaiheistetut käyttöönotot
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

## 🐳 Konttipohjaiset käyttöönotot

### Konttisovellusten käyttöönotot
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

### Monivaiheinen Dockerfile-optimointi
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

## ⚡ Suorituskyvyn optimointi

### Palvelukohtaiset käyttöönotot
```bash
# Ota käyttöön tietty palvelu nopeampaa iterointia varten
azd deploy --service web
azd deploy --service api

# Ota kaikki palvelut käyttöön
azd deploy
```

### Rakennuksen välimuisti
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Tehokkaat koodin käyttöönotot
```bash
# Käytä azd deployia (ei azd upia) koodimuutoksiin
# Tämä ohittaa infrastruktuurin provisioinnin ja on paljon nopeampi
azd deploy

# Ota käyttöön tietty palvelu nopeinta iterointia varten
azd deploy --service api
```

## 🔍 Käyttöönoton valvonta

### Reaaliaikainen käyttöönoton valvonta
```bash
# Seuraa sovellusta reaaliaikaisesti
azd monitor --live

# Näytä sovelluksen lokit
azd monitor --logs

# Tarkista käyttöönoton tila
azd show
```

### Terveystarkastukset
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

### Jälkikäyttöönoton validointi
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Tarkista sovelluksen kunto
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

## 🔐 Turvallisuusnäkökohdat

### Salaisuuksien hallinta
```bash
# Tallenna salaisuudet turvallisesti
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Viittaa salaisuuksiin azure.yaml-tiedostossa
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

### Verkon turvallisuus
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identiteetti- ja käyttöoikeushallinta
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

## 🚨 Palautusstrategiat

### Nopea palautus
```bash
# AZD:ssä ei ole sisäänrakennettua palautusta. Suositellut lähestymistavat:

# Vaihtoehto 1: Ota uudelleen käyttöön Gitistä (suositeltu)
git revert HEAD  # Kumoa ongelmallinen commit
git push
azd deploy

# Vaihtoehto 2: Ota uudelleen käyttöön tietty commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktuurin palautus
```bash
# Esikatsele infrastruktuurimuutoksia ennen käyttöönottoa
azd provision --preview

# Infrastruktuurin palautusta varten käytä versionhallintaa:
git revert HEAD  # Palauta infrastruktuurimuutokset
azd provision    # Ota aiempi infrastruktuuritila käyttöön
```

### Tietokantamigraation palautus
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Käyttöönoton mittarit

### Seuraa käyttöönottojen suorituskykyä
```bash
# Näytä nykyinen käyttöönoton tila
azd show

# Valvo sovellusta Application Insightsin avulla
azd monitor --overview

# Näytä reaaliaikaiset mittarit
azd monitor --live
```

### Mukautettujen mittareiden keruu
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

## 🎯 Parhaat käytännöt

### 1. Ympäristöjen yhdenmukaisuus
```bash
# Käytä yhdenmukaista nimeämistä
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Pidä ympäristöt yhdenmukaisina
./scripts/sync-environments.sh
```

### 2. Infrastruktuurin validointi
```bash
# Esikatsele infrastruktuurin muutoksia ennen käyttöönottoa
azd provision --preview

# Käytä ARM/Bicep-linttausta
az bicep lint --file infra/main.bicep

# Tarkista Bicep-syntaksi
az bicep build --file infra/main.bicep
```

### 3. Testauksen integrointi
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

### 4. Dokumentointi ja lokitus
```bash
# Dokumentoi käyttöönoton menettelyt
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Seuraavat askeleet

- [Resurssien provisiointi](provisioning.md) - Syväsukellus infrastruktuurin hallintaan
- [Esikäyttöönoton suunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Suunnittele käyttöönotto-strategiasi
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md) - Ratkaise käyttöönotto-ongelmia
- [Parhaat käytännöt](../chapter-07-troubleshooting/debugging.md) - Tuotantovalmiit käyttöönotto-strategiat

## 🎯 Käytännön käyttöönottoharjoitukset

### Harjoitus 1: Inkrementaalinen käyttöönoton työnkulku (20 minuuttia)
**Tavoite**: Hallitse ero täyden ja inkrementaalisen käyttöönoton välillä

```bash
# Ensimmäinen käyttöönotto
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Tallenna ensimmäisen käyttöönoton aika
echo "Full deployment: $(date)" > deployment-log.txt

# Tee koodimuutos
echo "// Updated $(date)" >> src/api/src/server.js

# Ota käyttöön vain koodi (nopea)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Vertaa aikoja
cat deployment-log.txt

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Täydellinen käyttöönotto kestää 5-15 minuuttia
- [ ] Pelkkä koodin käyttöönotto kestää 2-5 minuuttia
- [ ] Koodimuutokset näkyvät otetussa sovelluksessa
- [ ] Infrastruktuuri ei muutu `azd deploy` -komennon jälkeen

**Oppimistulos**: `azd deploy` on 50-70% nopeampi kuin `azd up` koodimuutoksissa

### Harjoitus 2: Mukautetut käyttöönotto-hookit (30 minuuttia)
**Tavoite**: Toteuta ennen ja jälkeen käyttöönoton tapahtuva automatisointi

```bash
# Luo käyttöönottoa edeltävä validointiskripti
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Tarkista, läpäisevätkö testit
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Tarkista, onko commitoimattomia muutoksia
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Luo käyttöönoton jälkeinen smoke-testi
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

# Lisää hookit azure.yaml-tiedostoon
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testaa käyttöönotto hookkien kanssa
azd deploy
```

**Onnistumiskriteerit:**
- [ ] Esikäyttöönotto-skripti suoritetaan ennen käyttöönottoa
- [ ] Käyttöönotto keskeytetään, jos testit epäonnistuvat
- [ ] Jälkikäyttöönoton smoke-testi varmistaa sovelluksen terveydentilan
- [ ] Hookit suoritetaan oikeassa järjestyksessä

### Harjoitus 3: Moniympäristöinen käyttöönotto-strategia (45 minuuttia)
**Tavoite**: Toteuta vaiheistettu käyttöönoton työnkulku (dev → staging → production)

```bash
# Luo käyttöönoton skripti
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Vaihe 1: Ota käyttöön kehitysympäristöön
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Vaihe 2: Ota käyttöön esituotantoympäristöön
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Vaihe 3: Manuaalinen hyväksyntä tuotantoon
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

# Luo ympäristöt
azd env new dev
azd env new staging
azd env new production

# Suorita vaiheittainen käyttöönotto
./deploy-staged.sh
```

**Onnistumiskriteerit:**
- [ ] Dev-ympäristö on otettu käyttöön onnistuneesti
- [ ] Staging-ympäristö otetaan käyttöön onnistuneesti
- [ ] Tuotantoon vaaditaan manuaalinen hyväksyntä
- [ ] Kaikilla ympäristöillä on toimivat terveystarkastukset
- [ ] Mahdollisuus palauttaa tarvittaessa

### Harjoitus 4: Palautusstrategia (25 minuuttia)
**Tavoite**: Toteuta ja testaa käyttöönoton palautus Gitin avulla

```bash
# Ota v1 käyttöön
azd env set APP_VERSION "1.0.0"
azd up

# Tallenna v1:n commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Ota v2 käyttöön, jossa on yhteensopimaton muutos
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Havaitse virhe ja palauta
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Palauta gitin avulla
    git revert HEAD --no-edit
    
    # Palauta ympäristö
    azd env set APP_VERSION "1.0.0"
    
    # Ota v1 uudelleen käyttöön
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Onnistumiskriteerit:**
- [ ] Pystyy havaitsemaan käyttöönoton epäonnistumiset
- [ ] Palautusskripti suoritetaan automaattisesti
- [ ] Sovellus palaa toimivaan tilaan
- [ ] Terveystarkastukset läpäistään palautuksen jälkeen

## 📊 Käyttöönoton mittareiden seuranta

### Seuraa käyttöönottojesi suorituskykyä

```bash
# Luo käyttöönoton mittausskripti
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

# Kirjaa tiedostoon
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Käytä sitä
./track-deployment.sh
```

**Analysoi mittareitasi:**
```bash
# Näytä käyttöönottohistoria
cat deployment-metrics.csv

# Laske keskimääräinen käyttöönottoaika
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Lisäresurssit

- [Azure Developer CLI - Käyttöönoton viite](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service - Käyttöönotto](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps - Käyttöönotto](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions - Käyttöönotto](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigointi**
- **Edellinen oppitunti**: [Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **Seuraava oppitunti**: [Resurssien provisiointi](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää ensisijaisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->