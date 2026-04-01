# Julkaisuopas - Hallitse AZD-julkaisuja

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastruktuuri koodina ja käyttöönotto
- **⬅️ Edellinen luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)
- **➡️ Seuraava**: [Resurssien provisiointi](provisioning.md)
- **🚀 Seuraava luku**: [Luku 5: Moni-agenttiset tekoälyratkaisut](../../examples/retail-scenario.md)

## Johdanto

Tämä kattava opas kattaa kaiken, mitä sinun tarvitsee tietää sovellusten julkaisemisesta Azure Developer CLI:llä, yksinkertaisista yhdellä komennolla suoritettavista julkaisuista aina tuotantoympäristöjen kehittyneisiin skenaarioihin mukautettujen hookeiden, useiden ympäristöjen ja CI/CD-integraation kanssa. Hallitse koko julkaisun elinkaari käytännön esimerkkien ja parhaiden käytäntöjen avulla.

## Oppimistavoitteet

Kun suoritat tämän oppaan loppuun, osaat:
- Hallitse kaikki Azure Developer CLI:n julkaisu­komennot ja -työvirrat
- Ymmärrä koko julkaisun elinkaari provisioinnista valvontaan
- Toteuta mukautetut julkaisu-hookit ennen ja jälkeen julkaisun tapahtuvaan automaatioon
- Konfiguroi useita ympäristöjä ympäristökohtaisilla parametreilla
- Ota käyttöön kehittyneitä julkaisustrategioita, kuten blue-green- ja canary-julkaisut
- Integroi azd-julkaisut CI/CD-putkiin ja DevOps-työvirtoihin

## Oppimistulokset

Oppimisen jälkeen osaat:
- Suorittaa ja ratkaista ongelmia kaikissa azd-julkaisutyövirroissa itsenäisesti
- Suunnitella ja toteuttaa mukautettua julkaisuautomaatiota hookeilla
- Konfiguroida tuotantovalmiit julkaisut asianmukaisella turvallisuudella ja valvonnalla
- Hallita monimutkaisia moniympäristöisiä julkaisuskenaarioita
- Optimoida julkaisun suorituskykyä ja toteuttaa palautusstrategioita
- Integroi azd-julkaisut yritystason DevOps-käytäntöihin

## Julkaisun yleiskatsaus

Azure Developer CLI tarjoaa useita julkaisu­komentoja:
- `azd up` - Koko työvirta (provisiointi + julkaisu)
- `azd provision` - Luo/päivittää vain Azure-resursseja
- `azd deploy` - Julkaise vain sovelluskoodi
- `azd package` - Kokoa ja pakkaa sovellukset

## Perusjulkaisutyövirrat

### Täydellinen julkaisu (azd up)
Yleisin työvirta uusille projekteille:
```bash
# Ota kaikki käyttöön alusta alkaen
azd up

# Ota käyttöön tietyssä ympäristössä
azd up --environment production

# Ota käyttöön mukautetuilla parametreilla
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Pelkkä infrastruktuurin julkaisu
Kun sinun tarvitsee vain päivittää Azure-resursseja:
```bash
# Ota käyttöön/päivitä infrastruktuuri
azd provision

# Ota käyttöön kuiva-ajona muutosten esikatselua varten
azd provision --preview

# Ota tietyt palvelut käyttöön
azd provision --service database
```

### Pelkkä koodin julkaisu
Nopeita sovelluspäivityksiä varten:
```bash
# Ota kaikki palvelut käyttöön
azd deploy

# Odotettu tulos:
# Palveluiden käyttöönotto (azd deploy)
# - web: Otetaan käyttöön... Valmis
# - api: Otetaan käyttöön... Valmis
# ONNISTUI: Käyttöönotto valmistui 2 minuutissa ja 15 sekunnissa

# Ota tietty palvelu käyttöön
azd deploy --service web
azd deploy --service api

# Ota käyttöön mukautetuilla rakennusparametreilla
azd deploy --service api --build-arg NODE_ENV=production

# Tarkista käyttöönotto
azd show --output json | jq '.services'
```

### ✅ Julkaisun tarkistus

Vahvista onnistuminen jokaisen julkaisun jälkeen:

```bash
# Tarkista, että kaikki palvelut ovat käynnissä
azd show

# Testaa terveystilarajapinnat
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Valvo virheitä (avautuu oletuksena selaimeen)
azd monitor --logs
```

**Onnistumiskriteerit:**
- ✅ Kaikki palvelut näyttävät tilan 'Käynnissä'
- ✅ Health-päätepisteet palauttavat HTTP 200
- ✅ Ei virhelokeja viimeisen 5 minuutin aikana
- ✅ Sovellus vastaa testipyyntöihin

## 🏗️ Julkaisuprosessin ymmärtäminen

### Vaihe 1: Esiprovisiointihookit
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
- Lukee infrastruktuurin malleja (Bicep/Terraform)
- Luo tai päivittää Azure-resursseja
- Konfiguroi verkot ja tietoturvan
- Määrittää valvonnan ja lokituksen

### Vaihe 3: Jälkiprovisiointihookit
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

### Vaihe 4: Sovelluksen pakkaus
- Kokoaa sovelluskoodin
- Luo julkaisuartifakteja
- Paketoidaan kohdealustalle (kontit, ZIP-tiedostot, jne.)

### Vaihe 5: Esijulkaisu-hookit
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

### Vaihe 6: Sovelluksen julkaisu
- Julkaisee pakatut sovellukset Azure-palveluihin
- Päivittää konfiguraatioasetukset
- Käynnistää/uudelleenkäynnistää palveluita

### Vaihe 7: Jälkijulkaisu-hookit
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

## 🎛️ Julkaisukonfiguraatio

### Palvelukohtaiset julkaisuasetukset
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

# Esikatseluympäristö
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

## 🔧 Kehittyneet julkaisuskenaariot

### Monipalveluiset sovellukset
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

### Blue-Green-julkaisut
```bash
# Luo sininen ympäristö
azd env new production-blue
azd up --environment production-blue

# Testaa sininen ympäristö
./scripts/test-environment.sh production-blue

# Ohjaa liikenne siniseen (manuaalinen DNS/kuormantasaajan päivitys)
./scripts/switch-traffic.sh production-blue

# Siivoa vihreä ympäristö
azd env select production-green
azd down --force
```

### Canary-julkaisut
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

### Vaiheistetut julkaisut
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

## 🐳 Konttijulkaisut

### Konttisovellusten julkaisut
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

### Palvelukohtaiset julkaisut
```bash
# Ota käyttöön tietty palvelu nopeampaa iterointia varten
azd deploy --service web
azd deploy --service api

# Ota kaikki palvelut käyttöön
azd deploy
```

### Rakennusvälimuisti
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Tehokkaat koodijulkaisut
```bash
# Käytä azd deploy (ei azd up) pelkkien koodimuutosten kohdalla
# Tämä ohittaa infrastruktuurin provisioinnin ja on paljon nopeampi
azd deploy

# Julkaise tietty palvelu nopeinta iterointia varten
azd deploy --service api
```

## 🔍 Julkaisun valvonta

### Reaaliaikainen julkaisun valvonta
```bash
# Seuraa sovellusta reaaliajassa
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

### Julkaisun jälkeinen validointi
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

### Identiteetin ja pääsynhallinta
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
# AZD:llä ei ole sisäänrakennettua palautustoimintoa. Suositellut lähestymistavat:

# Vaihtoehto 1: Uudelleenasenna Gitistä (suositeltavaa)
git revert HEAD  # Palauta ongelmallinen commit
git push
azd deploy

# Vaihtoehto 2: Uudelleenasenna tietty commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktuurin palautus
```bash
# Esikatsele infrastruktuurin muutokset ennen niiden käyttöönottoa
azd provision --preview

# Infrastruktuurin palautukseen käytä versionhallintaa:
git revert HEAD  # Palauta infrastruktuurin muutokset
azd provision    # Ota käyttöön aiempi infrastruktuurin tila
```

### Tietokantasiirron palautus
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Julkaisumetriikat

### Seuraa julkaisun suorituskykyä
```bash
# Näytä nykyinen käyttöönoton tila
azd show

# Valvo sovellusta Application Insightsin avulla
azd monitor --overview

# Näytä reaaliaikaiset mittarit
azd monitor --live
```

### Mukautettujen metriikoiden keruu
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
# Käytä johdonmukaista nimeämistä
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Pidä ympäristöt yhdenmukaisina
./scripts/sync-environments.sh
```

### 2. Infrastruktuurin validointi
```bash
# Esikatsele infrastruktuurin muutokset ennen käyttöönottoa
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
# Dokumentoi käyttöönotto-ohjeet
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Seuraavat askeleet

- [Resurssien provisiointi](provisioning.md) - Syväluotaus infrastruktuurin hallintaan
- [Esijulkaisu­suunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Suunnittele julkaisustrategiasi
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md) - Ratkaise julkaisun ongelmat
- [Parhaat käytännöt](../chapter-07-troubleshooting/debugging.md) - Tuotantovalmis julkaisustrategiat

## 🎯 Käytännön julkaisuharjoitukset

### Harjoitus 1: Inkrementaalinen julkaisutyövirta (20 minuuttia)
**Tavoite**: Hallitse ero täydellisen ja inkrementaalisen julkaisun välillä

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

# Vertaile aikoja
cat deployment-log.txt

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Täydellinen julkaisu kestää 5–15 minuuttia
- [ ] Pelkkä koodijulkaisu kestää 2–5 minuuttia
- [ ] Koodimuutokset näkyvät julkaistussa sovelluksessa
- [ ] Infrastruktuuri pysyy muuttumattomana `azd deploy`-komennon jälkeen

**Oppimistulos**: `azd deploy` on 50–70% nopeampi kuin `azd up` koodimuutoksissa

### Harjoitus 2: Mukautetut julkaisu-hookit (30 minuuttia)
**Tavoite**: Toteuta ennen ja jälkeen julkaisun tapahtuva automaatio

```bash
# Luo käyttöönottoa edeltävä validointiskripti
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Tarkista, että testit läpäisevät
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

# Testaa käyttöönotto hookeilla
azd deploy
```

**Onnistumiskriteerit:**
- [ ] Esijulkaisu-skripti suoritetaan ennen julkaisua
- [ ] Julkaisu peruutetaan, jos testit epäonnistuvat
- [ ] Jälkijulkaisun savutesti varmistaa sovelluksen kunnon
- [ ] Hookit suorittuvat oikeassa järjestyksessä

### Harjoitus 3: Moni-ympäristöinen julkaisustrategia (45 minuuttia)
**Tavoite**: Toteuta vaiheistettu julkaisutyövirta (dev → staging → production)

```bash
# Luo käyttöönoton skripti
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

# Suorita vaiheistettu käyttöönotto
./deploy-staged.sh
```

**Onnistumiskriteerit:**
- [ ] Dev-ympäristö julkaistaan onnistuneesti
- [ ] Staging-ympäristö julkaistaan onnistuneesti
- [ ] Tuotantoon vaaditaan manuaalinen hyväksyntä
- [ ] Kaikissa ympäristöissä toimii terveystarkastus
- [ ] Mahdollisuus palauttaa tarvittaessa

### Harjoitus 4: Palautusstrategia (25 minuuttia)
**Tavoite**: Toteuta ja testaa julkaisun palautus Gitin avulla

```bash
# Ota käyttöön v1
azd env set APP_VERSION "1.0.0"
azd up

# Tallenna v1:n commitin hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Ota käyttöön v2, joka sisältää yhteensopivuuden rikkovan muutoksen
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Havaitse virhe ja palauta edellinen versio
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Palauta gitillä
    git revert HEAD --no-edit
    
    # Palauta ympäristö
    azd env set APP_VERSION "1.0.0"
    
    # Ota v1 uudelleen käyttöön
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Onnistumiskriteerit:**
- [ ] Osaa havaita julkaisun epäonnistumiset
- [ ] Palautusskripti suoritetaan automaattisesti
- [ ] Sovellus palaa toimivaan tilaan
- [ ] Terveystarkastukset läpäisevät palautuksen jälkeen

## 📊 Julkaisumetriikoiden seuranta

### Seuraa julkaisusi suorituskykyä

```bash
# Luo käyttöönoton mittareita keräävä skripti
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

**Analysoi metriikkasi:**
```bash
# Näytä käyttöönottohistoria
cat deployment-metrics.csv

# Laske keskimääräinen käyttöönottoaika
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Lisäresurssit

- [Azure Developer CLI - Julkaisuviite](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Servicen julkaisu](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps - Julkaisu](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions - Julkaisu](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigointi**
- **Edellinen oppitunti**: [Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **Seuraava oppitunti**: [Resurssien provisiointi](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->