<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-21T15:46:54+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "fi"
}
-->
# Käyttöönotto-opas - AZD-käyttöönottojen hallinta

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastruktuuri koodina & käyttöönotto
- **⬅️ Edellinen luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)
- **➡️ Seuraava**: [Resurssien provisiointi](provisioning.md)
- **🚀 Seuraava luku**: [Luku 5: Moniagenttiset tekoälyratkaisut](../../examples/retail-scenario.md)

## Johdanto

Tämä kattava opas kattaa kaiken, mitä sinun tarvitsee tietää sovellusten käyttöönotosta Azure Developer CLI:n avulla, yksinkertaisista yhden komennon käyttöönotosta edistyneisiin tuotantotilanteisiin, joissa on mukautettuja koukkuja, useita ympäristöjä ja CI/CD-integraatio. Hallitse koko käyttöönoton elinkaari käytännön esimerkkien ja parhaiden käytäntöjen avulla.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan kaikki Azure Developer CLI:n käyttöönoton komennot ja työnkulut
- Ymmärtämään käyttöönoton koko elinkaaren provisioinnista seurantaan
- Toteuttamaan mukautettuja käyttöönoton koukkuja automaatiota varten ennen ja jälkeen käyttöönoton
- Konfiguroimaan useita ympäristöjä ympäristökohtaisilla parametreilla
- Ottamaan käyttöön edistyneitä käyttöönoton strategioita, kuten blue-green- ja canary-käyttöönotot
- Integroimaan azd-käyttöönotot CI/CD-putkistoihin ja DevOps-työnkulkuihin

## Oppimistulokset

Oppaan suorittamisen jälkeen osaat:
- Suorittaa ja ratkaista itsenäisesti kaikki azd-käyttöönoton työnkulut
- Suunnitella ja toteuttaa mukautettua käyttöönoton automaatiota koukkujen avulla
- Konfiguroida tuotantovalmiit käyttöönotot asianmukaisella tietoturvalla ja seurannalla
- Hallita monimutkaisia monen ympäristön käyttöönoton skenaarioita
- Optimoida käyttöönoton suorituskykyä ja toteuttaa palautusstrategioita
- Integroimaan azd-käyttöönotot yrityksen DevOps-käytäntöihin

## Käyttöönoton yleiskatsaus

Azure Developer CLI tarjoaa useita käyttöönoton komentoja:
- `azd up` - Koko työnkulku (provisiointi + käyttöönotto)
- `azd provision` - Luo/päivittää vain Azure-resursseja
- `azd deploy` - Ottaa käyttöön vain sovelluskoodin
- `azd package` - Rakentaa ja pakkaa sovellukset

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

### Vain infrastruktuurin provisiointi
Kun tarvitset vain Azure-resurssien päivityksen:
```bash
# Tarjoa/päivitä infrastruktuuri
azd provision

# Tarjoa kuivakäynnillä esikatsellaksesi muutokset
azd provision --preview

# Tarjoa tietyt palvelut
azd provision --service database
```

### Vain koodin käyttöönotto
Nopeita sovelluspäivityksiä varten:
```bash
# Ota kaikki palvelut käyttöön
azd deploy

# Odotettu tulos:
# Palveluiden käyttöönotto (azd deploy)
# - web: Käyttöönotto... Valmis
# - api: Käyttöönotto... Valmis
# ONNISTUI: Käyttöönotto valmistui 2 minuutissa 15 sekunnissa

# Ota tietty palvelu käyttöön
azd deploy --service web
azd deploy --service api

# Ota käyttöön mukautetuilla rakennusparametreilla
azd deploy --service api --build-arg NODE_ENV=production

# Vahvista käyttöönotto
azd show --output json | jq '.services'
```

### ✅ Käyttöönoton tarkistus

Tarkista onnistuminen jokaisen käyttöönoton jälkeen:

```bash
# Tarkista, että kaikki palvelut ovat käynnissä
azd show

# Testaa terveyspäätepisteet
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Tarkista lokit virheiden varalta
azd logs --service api --since 5m | grep -i error
```

**Onnistumiskriteerit:**
- ✅ Kaikki palvelut näyttävät tilan "Running"
- ✅ Terveysrajapinnat palauttavat HTTP 200
- ✅ Ei virhelokeja viimeisen 5 minuutin aikana
- ✅ Sovellus vastaa testipyyntöihin

## 🏗️ Käyttöönoton prosessin ymmärtäminen

### Vaihe 1: Ennen provisiointia -koukut
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
- Lukee infrastruktuurimallit (Bicep/Terraform)
- Luo tai päivittää Azure-resursseja
- Konfiguroi verkot ja tietoturvan
- Asettaa seurannan ja lokituksen

### Vaihe 3: Provisioinnin jälkeiset koukut
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

### Vaihe 4: Sovelluksen pakkaaminen
- Rakentaa sovelluskoodin
- Luo käyttöönottoartefaktit
- Pakkaa kohdealustalle (kontit, ZIP-tiedostot jne.)

### Vaihe 5: Ennen käyttöönottoa -koukut
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
- Ottaa pakatut sovellukset käyttöön Azure-palveluissa
- Päivittää konfigurointiasetukset
- Käynnistää/pysäyttää palvelut

### Vaihe 7: Käyttöönoton jälkeiset koukut
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

# Välivaiheen ympäristö
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

## 🔧 Edistyneet käyttöönoton skenaariot

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

# Testaa sininen ympäristö
./scripts/test-environment.sh production-blue

# Vaihda liikenne siniseen (manuaalinen DNS/kuormantasaimen päivitys)
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

### Vaiheittaiset käyttöönotot
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

## 🐳 Konttien käyttöönotot

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

### Rinnakkaiset käyttöönotot
```bash
# Määritä rinnakkaisjakelu
azd config set deploy.parallelism 5

# Ota palvelut käyttöön rinnakkain
azd deploy --parallel
```

### Rakennusvälimuisti
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

### Inkrementaaliset käyttöönotot
```bash
# Ota käyttöön vain muuttuneet palvelut
azd deploy --incremental

# Ota käyttöön muutoshavaintojen avulla
azd deploy --detect-changes
```

## 🔍 Käyttöönoton seuranta

### Reaaliaikainen käyttöönoton seuranta
```bash
# Seuraa käyttöönoton etenemistä
azd deploy --follow

# Näytä käyttöönoton lokit
azd logs --follow --service api

# Tarkista käyttöönoton tila
azd show --service api
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

### Käyttöönoton jälkeinen validointi
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Tarkista sovelluksen tila
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

## 🔐 Tietoturvanäkökohdat

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

### Verkkoturvallisuus
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identiteetti- ja käyttöoikeuksien hallinta
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
# Palauta edelliseen käyttöönottoon
azd deploy --rollback

# Palauta tietty palvelu
azd deploy --service api --rollback

# Palauta tiettyyn versioon
azd deploy --service api --version v1.2.3
```

### Infrastruktuurin palautus
```bash
# Palauta infrastruktuurimuutokset
azd provision --rollback

# Esikatsele palautusmuutokset
azd provision --rollback --preview
```

### Tietokannan migraation palautus
```bash
#!/bin/bash
# skriptit/palauta-tietokanta.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Käyttöönoton mittarit

### Seuraa käyttöönoton suorituskykyä
```bash
# Ota käyttöön käyttöönoton mittarit
azd config set telemetry.deployment.enabled true

# Näytä käyttöönoton historia
azd history

# Hanki käyttöönoton tilastot
azd metrics --type deployment
```

### Mukautettu mittarien keräys
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

### 1. Ympäristön johdonmukaisuus
```bash
# Käytä johdonmukaista nimeämistä
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Säilytä ympäristön yhtenäisyys
./scripts/sync-environments.sh
```

### 2. Infrastruktuurin validointi
```bash
# Vahvista ennen käyttöönottoa
azd provision --preview
azd provision --what-if

# Käytä ARM/Bicep-linttausta
az bicep lint --file infra/main.bicep
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
# Dokumentoi käyttöönoton menettelytavat
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Seuraavat vaiheet

- [Resurssien provisiointi](provisioning.md) - Syväsukellus infrastruktuurin hallintaan
- [Ennakkosuunnittelu](../pre-deployment/capacity-planning.md) - Suunnittele käyttöönoton strategia
- [Yleiset ongelmat](../troubleshooting/common-issues.md) - Ratkaise käyttöönoton ongelmat
- [Parhaat käytännöt](../troubleshooting/debugging.md) - Tuotantovalmiit käyttöönoton strategiat

## 🎯 Käytännön käyttöönottoharjoitukset

### Harjoitus 1: Inkrementaalinen käyttöönoton työnkulku (20 minuuttia)
**Tavoite**: Hallitse täyden ja inkrementaalisen käyttöönoton erot

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

**Onnistumiskriteerit:**
- [ ] Täysi käyttöönotto kestää 5-15 minuuttia
- [ ] Vain koodin käyttöönotto kestää 2-5 minuuttia
- [ ] Koodimuutokset näkyvät käyttöönotetussa sovelluksessa
- [ ] Infrastruktuuri ei muutu `azd deploy` -komennon jälkeen

**Oppimistulos**: `azd deploy` on 50-70 % nopeampi kuin `azd up` koodimuutoksille

### Harjoitus 2: Mukautetut käyttöönoton koukut (30 minuuttia)
**Tavoite**: Toteuta automaatio ennen ja jälkeen käyttöönoton

```bash
# Luo ennakkotarkistusskripti
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Tarkista, että testit läpäisevät
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Tarkista sitomattomat muutokset
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Luo jälkiasennuksen savutesti
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

# Lisää koukut azure.yaml-tiedostoon
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testaa käyttöönotto koukkujen kanssa
azd deploy
```

**Onnistumiskriteerit:**
- [ ] Ennen käyttöönottoa -skripti suoritetaan ennen käyttöönottoa
- [ ] Käyttöönotto keskeytyy, jos testit epäonnistuvat
- [ ] Käyttöönoton jälkeinen savutesti varmistaa terveyden
- [ ] Koukut suoritetaan oikeassa järjestyksessä

### Harjoitus 3: Moniympäristön käyttöönoton strategia (45 minuuttia)
**Tavoite**: Toteuta vaiheittainen käyttöönoton työnkulku (dev → staging → production)

```bash
# Luo käyttöönotto skripti
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Vaihe 1: Käyttöönotto kehitysympäristöön
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Vaihe 2: Käyttöönotto testausympäristöön
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
- [ ] Kehitysympäristö otetaan onnistuneesti käyttöön
- [ ] Testausympäristö otetaan onnistuneesti käyttöön
- [ ] Manuaalinen hyväksyntä vaaditaan tuotantoon
- [ ] Kaikilla ympäristöillä on toimivat terveystarkastukset
- [ ] Palautus on mahdollista tarvittaessa

### Harjoitus 4: Palautusstrategia (25 minuuttia)
**Tavoite**: Toteuta ja testaa käyttöönoton palautus

```bash
# Ota v1 käyttöön
azd env set APP_VERSION "1.0.0"
azd up

# Tallenna v1-konfiguraatio
cp -r .azure/production .azure/production-v1-backup

# Ota v2 käyttöön, jossa on yhteensopimaton muutos
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Havaitse virhe
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Palauta koodi
    git checkout src/api/src/server.js
    
    # Palauta ympäristö
    azd env set APP_VERSION "1.0.0"
    
    # Ota v1 uudelleen käyttöön
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Onnistumiskriteerit:**
- [ ] Käyttöönoton virheet havaitaan
- [ ] Palautusskripti suoritetaan automaattisesti
- [ ] Sovellus palautuu toimivaan tilaan
- [ ] Terveystarkastukset onnistuvat palautuksen jälkeen

## 📊 Käyttöönoton mittareiden seuranta

### Seuraa käyttöönoton suorituskykyä

```bash
# Luo käyttöönoton metristen skripti
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

**Analysoi mittarisi:**
```bash
# Näytä käyttöönoton historia
cat deployment-metrics.csv

# Laske keskimääräinen käyttöönottoaika
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Lisäresurssit

- [Azure Developer CLI -käyttöönoton viite](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service -käyttöönotto](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps -käyttöönotto](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions -käyttöönotto](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigointi**
- **Edellinen oppitunti**: [Ensimmäinen projektisi](../getting-started/first-project.md)
- **Seuraava oppitunti**: [Resurssien provisiointi](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->