# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Luku 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

Tämä kattava opas käsittelee kaiken, mitä tarvitset sovellusten käyttöönottoon Azure Developer CLI:llä — yksinkertaisista yhden komennon käyttöönotosta edistyneisiin tuotantotilanteisiin, joissa käytetään mukautettuja hookeja, useita ympäristöjä ja CI/CD-integraatiota. Hallitse koko käyttöönoton elinkaari käytännön esimerkkien ja parhaiden käytäntöjen avulla.

## Learning Goals

Kun käyt tämän oppaan läpi, osaat:
- Hallita kaikki Azure Developer CLI:n käyttöönotto-komennot ja -työnkulut
- Ymmärtää koko käyttöönoton elinkaaren provisioinnista monitorointiin
- Toteuttaa mukautettuja käyttöönotto-hookeja esija jälkitoimintojen automatisointiin
- Konfiguroida useita ympäristöjä ympäristökohtaisilla parametreilla
- Ottaa käyttöön edistyneitä käyttöönotto-strategioita, kuten blue-green ja canary
- Integroida azd-käyttöönotot CI/CD-putkiin ja DevOps-työnkulkuihin

## Learning Outcomes

Oppaan suorittamisen jälkeen osaat:
- Suorittaa ja vianetsiyttää kaikki azd-käyttöönottojen työnkulut itsenäisesti
- Suunnitella ja toteuttaa mukautettua käyttöönotto-automaatioita hookien avulla
- Konfiguroida tuotantovalmiit käyttöönotot oikealla turvallisuudella ja monitoroinnilla
- Hallita monimutkaisia usean ympäristön käyttöönotto-skenaarioita
- Optimoida käyttöönottojen suorituskykyä ja toteuttaa rollback-strategioita
- Integrioida azd-käyttöönotot yrityksen DevOps-käytäntöihin

## Deployment Overview

Azure Developer CLI tarjoaa useita käyttöönotto-komentoja:
- `azd up` - Täydellinen työnkulku (provision + deploy)
- `azd provision` - Luo/päivittää vain Azure-resursseja
- `azd deploy` - Ottaa käyttöön vain sovelluskoodin
- `azd package` - Kokoa ja pakkaa sovellukset

## Basic Deployment Workflows

### Complete Deployment (azd up)
Yleisimmät työnkulut uusille projekteille:
```bash
# Ota kaikki käyttöön alusta alkaen
azd up

# Ota käyttöön tietyssä ympäristössä
azd up --environment production

# Ota käyttöön mukautetuilla parametreilla
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
Kun tarvitset vain Azure-resurssien päivityksen:
```bash
# Ota infrastruktuuri käyttöön tai päivitä se
azd provision

# Ota käyttöön kuiva-ajolla esikatsellaksesi muutoksia
azd provision --preview

# Ota tietyt palvelut käyttöön
azd provision --service database
```

### Code-Only Deployment
Nopeisiin sovelluspäivityksiin:
```bash
# Ota kaikki palvelut käyttöön
azd deploy

# Odotettu tuloste:
# Palveluiden käyttöönotto (azd deploy)
# - web: Käyttöönotetaan... Valmis
# - api: Käyttöönotetaan... Valmis
# ONNISTUI: Käyttöönotto valmistui 2 minuutissa 15 sekunnissa

# Ota tietty palvelu käyttöön
azd deploy --service web
azd deploy --service api

# Ota käyttöön mukautetuilla rakennusargumenteilla
azd deploy --service api --build-arg NODE_ENV=production

# Varmista käyttöönotto
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

Minkä tahansa käyttöönoton jälkeen varmista onnistuminen:

```bash
# Tarkista, että kaikki palvelut ovat käynnissä
azd show

# Testaa terveystarkastus-päätepisteet
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Valvo virheiden varalta (avautuu oletuksena selaimessa)
azd monitor --logs
```

**Success Criteria:**
- ✅ All services show "Running" status
- ✅ Health endpoints return HTTP 200
- ✅ No error logs in the last 5 minutes
- ✅ Application responds to test requests

## 🏗️ Understanding the Deployment Process

### New to hooks? Start here

A **hook** on komento, jonka azd suorittaa automaattisesti tiettynä hetkenä käyttöönoton aikana — ennen tai jälkeen provisioinnin, ja ennen tai jälkeen koodin käyttöönoton. Ne mahdollistavat pienten rutiinitehtävien automatisoinnin, jotka liittyvät aina käyttöönottoon: tietokannan alustaminen, migraatioiden suoritus, assettien rakentaminen tai live-sovelluksen smoke-testit.

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Ennen resurssien luomista | Tarkista esivaatimukset, kirjaudu rekisteriin |
| `postprovision` | Kun resurssit ovat olemassa | Määritä resurssit, asenna tietokanta |
| `predeploy` | Ennen koodin käyttöönottoa | Rakenna front-end-resurssit, suorita yksikkötestit |
| `postdeploy` | Kun koodi on käytössä | Suorita tietokantamigraatiot, tee smoke-test päätepisteelle |

Hookit sijaitsevat `azure.yaml`-tiedostossasi. Tässä pienin mahdollinen esimerkki — se tulostaa viestin käytön jälkeen:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Siinä se — seuraavalla kerralla kun ajat `azd up`, viesti tulostuu automaattisesti. Voit myös ajaa hookin erikseen ilman kokonaista käyttöönottoa, mikä on loistavaa testaukseen:

```bash
azd hooks run postdeploy
```

Alla olevat vaiheet näyttävät tosielämän hook-esimerkkejä (migraatiot, testit, validointi) jokaiselle vaiheelle.

### Phase 1: Pre-Provision Hooks
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

### Phase 2: Infrastructure Provisioning
- Lukee infrastruktuurimallit (Bicep/Terraform)
- Luo tai päivittää Azure-resursseja
- Konfiguroi verkot ja turvallisuuden
- Ota käyttöön monitorointi ja lokitus

### Phase 3: Post-Provision Hooks
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

### Phase 4: Application Packaging
- Kokoa sovelluskoodi
- Luo käyttöönotto-artifaktit
- Paketoi kohdealustalle (kontit, ZIP-tiedostot jne.)

### Phase 5: Pre-Deploy Hooks
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

### Phase 6: Application Deployment
- Ota pakatut sovellukset käyttöön Azure-palveluissa
- Päivittää konfiguraatioasetuksia
- Käynnistää/uudelleenkäynnistää palvelut

### Phase 7: Post-Deploy Hooks
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

### Handling Hook Errors

Oletuksena **jos hook-komento päättyy ei-nollaan paluuarvolla, azd pysäyttää koko operaation.** Tämä on yleensä toivottavaa — epäonnistunut migraatio pitäisi pysäyttää käyttöönotto, ei toimittaa rikkinäistä sovellusta. Mutta tämä tarkoittaa, että hookit on kirjoitettava huolellisesti.

**1. Tee virheistä äänekkäitä ja tarkoituksellisia.** Hook epäonnistuu, kun sen viimeinen komento palauttaa ei-nollan poistumiskoodin. Shell-skripteissä lisää `set -e`, jotta hook pysähtyy ensimmäiseen epäonnistuvaan komentoon sen sijaan, että jatkaisi hiljaa:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Salli hookin epäonnistua ilman azd:n pysäyttämistä.** Ei-kriittisille vaiheille (valinnainen välimuistin lämmitys, best-effort-ilmoitus) aseta `continueOnError: true`. azd kirjaa epäonnistumisen mutta jatkaa:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testaa hookeja erillisinä ennen kokonaissuoritusta.** Sinun ei tarvitse ajaa `azd up` debugataksesi hookia — aja se erikseen ja iteroi nopeasti:

```bash
azd hooks run predeploy          # suorittaa vain predeploy-hookin
azd hooks run postdeploy --service api
```

**4. Varo käyttöjärjestelmäkohtaisia shellejä.** Hook, joka käyttää `shell: pwsh`, vaatii PowerShellin koneelta, joka suorittaa sen (mukaan lukien CI-agentit). Käytä `shell: sh` laajinta yhteensopivuutta varten, tai tarjoa sekä `windows` että `posix` -variantit:

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

> **Debugging tip:** aja mikä tahansa azd-komento `--debug`-lipun kanssa nähdäksesi tarkan hook-komentorivin ja sen täydet tulosteet — korvaamatonta, kun hook toimii paikallisesti mutta epäonnistuu CI:ssä.

## 🎛️ Deployment Configuration

### Service-Specific Deployment Settings
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

### Environment-Specific Configurations
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

## 🔧 Advanced Deployment Scenarios

### Multi-Service Applications
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

### Blue-Green Deployments
```bash
# Luo sininen ympäristö
azd env new production-blue
azd up --environment production-blue

# Testaa sinistä ympäristöä
./scripts/test-environment.sh production-blue

# Ohjaa liikenne siniseen (päivitä DNS/kuormantasaaja manuaalisesti)
./scripts/switch-traffic.sh production-blue

# Siivoa vihreä ympäristö
azd env select production-green
azd down --force
```

### Canary Deployments
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

### Staged Deployments
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

## 🐳 Container Deployments

### Container App Deployments
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

### Multi-Stage Dockerfile Optimization
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

## ⚡ Performance Optimization

### Service-Specific Deployments
```bash
# Ota käyttöön tietty palvelu nopeampaa iterointia varten
azd deploy --service web
azd deploy --service api

# Ota käyttöön kaikki palvelut
azd deploy
```

### Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efficient Code Deployments
```bash
# Käytä azd deploy -komentoa (ei azd up) pelkkiin koodimuutoksiin
# Tämä ohittaa infrastruktuurin provisioinnin ja on paljon nopeampi
azd deploy

# Ota käyttöön tietty palvelu nopeinta iterointia varten
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Valvo sovellusta reaaliajassa
azd monitor --live

# Näytä sovelluksen lokit
azd monitor --logs

# Tarkista käyttöönoton tila
azd show
```

### Health Checks
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

### Post-Deployment Validation
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

## 🔐 Security Considerations

### Secrets Management
```bash
# Tallenna salaisuudet turvallisesti
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Viittaa salaisuuksiin tiedostossa azure.yaml
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

### Network Security
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity and Access Management
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

## 🚨 Rollback Strategies

### Quick Rollback
```bash
# AZD:llä ei ole sisäänrakennettua palautusta. Suositellut lähestymistavat:

# Vaihtoehto 1: Uudelleenasenna Gitistä (suositeltu)
git revert HEAD  # Peruuta ongelmallinen commit
git push
azd deploy

# Vaihtoehto 2: Uudelleenasenna tietty commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# Esikatsele infrastruktuurin muutokset ennen niiden käyttöönottoa
azd provision --preview

# Infrastruktuurin palautukseen käytä versionhallintaa:
git revert HEAD  # Kumoa infrastruktuurin muutokset
azd provision    # Ota käyttöön aiempi infrastruktuurin tila
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Track Deployment Performance
```bash
# Näytä nykyinen käyttöönoton tila
azd show

# Valvo sovellusta Application Insightsin avulla
azd monitor --overview

# Näytä reaaliaikaiset mittarit
azd monitor --live
```

### Custom Metrics Collection
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

## 🎯 Best Practices

### 1. Environment Consistency
```bash
# Käytä yhdenmukaista nimeämistä
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Pidä ympäristöt yhdenmukaisina
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Esikatsele infrastruktuurin muutoksia ennen käyttöönottoa
azd provision --preview

# Käytä ARM/Bicep-linttausta
az bicep lint --file infra/main.bicep

# Tarkista Bicep-syntaksin oikeellisuus
az bicep build --file infra/main.bicep
```

### 3. Testing Integration
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

### 4. Documentation and Logging
```bash
# Dokumentoi käyttöönoton menettelyt
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - Syväsukellus infrastruktuurin hallintaan
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Suunnittele käyttöönotto-strategiasi
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Ratkaise käyttöönotto-ongelmia
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Tuotantovalmiit käyttöönotto-strategiat

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Goal**: Hallitse ero täyden ja inkrementaalisen käyttöönoton välillä

```bash
# Alkuperäinen käyttöönotto
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Tallenna alkuperäisen käyttöönoton aika
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

**Success Criteria:**
- [ ] Täysi käyttöönotto kestää 5–15 minuuttia
- [ ] Pelkkä koodin käyttöönotto kestää 2–5 minuuttia
- [ ] Koodimuutokset näkyvät käytössä olevassa sovelluksessa
- [ ] Infrastruktuuri pysyy muuttumattomana `azd deploy`-suorituksen jälkeen

**Learning Outcome**: `azd deploy` on 50–70 % nopeampi kuin `azd up` koodimuutoksissa

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Toteuta esija jälkikäyttöönoton automaatio

```bash
# Luo ennen käyttöönottoa suoritettava validointiskripti
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Tarkista, että testit läpäisevät
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Tarkista, onko muutoksia, joita ei ole commitoitu
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Luo käyttöönoton jälkeinen savutesti
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

**Success Criteria:**
- [ ] Pre-deploy-skripti suoritetaan ennen käyttöönottoa
- [ ] Käyttöönotto peruutetaan, jos testit epäonnistuvat
- [ ] Post-deploy smoke-test varmistaa terveydentilan
- [ ] Hookit suoritetaan oikeassa järjestyksessä

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Toteuta vaiheistettu käyttöönotto-työnkulku (dev → staging → production)

```bash
# Luo käyttöönotto-skripti
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Vaihe 1: Julkaise kehitysympäristöön
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Vaihe 2: Julkaise staging-ympäristöön
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

**Success Criteria:**
- [ ] Dev-ympäristöön käyttöönotto onnistuu
- [ ] Staging-ympäristöön käyttöönotto onnistuu
- [ ] Manuaalinen hyväksyntä vaaditaan tuotantoon
- [ ] Kaikilla ympäristöillä on toimivat health checkit
- [ ] Voidaan palauttaa takaisin tarvittaessa

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Toteuta ja testaa käyttöönoton rollback Gitin avulla

```bash
# Ota käyttöön v1
azd env set APP_VERSION "1.0.0"
azd up

# Tallenna v1:n commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Ota käyttöön v2, joka sisältää taaksepäin yhteensopimattoman muutoksen
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Havaitse virhe ja palauta edellinen versio
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

**Success Criteria:**
- [ ] Pystyy havaitsemaan käyttöönoton virheet
- [ ] Rollback-skripti suoritetaan automaattisesti
- [ ] Sovellus palautuu toimivaan tilaan
- [ ] Health checkit läpäistään rollbackin jälkeen

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

```bash
# Luo käyttöönoton mittareiden skripti
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

# Kirjaa tiedostoon
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Käytä sitä
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# Näytä käyttöönottohistoria
cat deployment-metrics.csv

# Laske keskimääräinen käyttöönottoaika
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Additional Resources

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
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->