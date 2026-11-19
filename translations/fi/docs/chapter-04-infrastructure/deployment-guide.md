# Käyttöönotto-opas - Azd-käyttöönottojen hallinta

**Lukuvalikko:**
- **📚 Kurssin alku**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastruktuuri koodina & käyttöönotto
- **⬅️ Edellinen luku**: [Luku 3: Konfiguraatio](../chapter-03-configuration/configuration.md)
- **➡️ Seuraava**: [Resurssien provisiointi](provisioning.md)
- **🧩 Myös tässä luvussa**: [Kirjoita oma malli](custom-templates.md)
- **🚀 Seuraava luku**: [Luku 5: Moniagenttiset tekoälyratkaisut](../../examples/retail-scenario.md)

## Johdanto

> Tarkistettu `azd 1.37.2` mukaan (marraskuu 2026). Komennot käyttävät Bashia; JSON-esimerkit vaativat `jq`. Lukuun ottamatta nimenomaisesti aloitettua todo- harjoitusta, edistyneet esimerkit ovat **integraatiopaloja**: tuo oma lähteesi, infrastruktuuri, testit ja skriptit. Tässä katselmuksessa ei suoritettu yhtään Azure-käyttöönottamista.

Tämä kattava opas kattaa kaiken, mitä tarvitset sovellusten käyttöönottoon Azure Developer CLI:n avulla, yksinkertaisista yhdellä komennolla suoritettavista käyttöönotoista monimutkaisiin tuotantotilanteisiin, joissa on mukautetut koukut, useat ympäristöt ja CI/CD-integraatio. Hallitse koko käyttöönoton elinkaari käytännön esimerkkien ja parhaiden käytäntöjen avulla.

## Oppimistavoitteet

Tämän oppaan suorittamisen jälkeen osaat:
- Hallita kaikki Azure Developer CLI:n käyttöönottokomennot ja työnkulut
- Ymmärtää käyttöönoton koko elinkaaren provisioinnista valvontaan
- Toteuttaa mukautettuja käyttöönoton koukkuja ennen ja jälkeen automaatiota varten
- Konfiguroida useita ympäristöjä ympäristökohtaisilla parametreilla
- Ottaa käyttöön edistyneitä käyttöönotto-strategioita, kuten sinivihreät ja kanarialähetykset
- Integroida azd-käyttöönnotot CI/CD-putkiin ja DevOps-työnkulkuihin

## Oppimistulokset

Oppaan suorittamisen jälkeen pystyt:
- Suorittamaan ja vianmääritykseen kaikissa azd-käyttöönottotyönkuluissa itsenäisesti
- Suunnittelemaan ja toteuttamaan mukautettua käyttöönoton automaatiota koukuilla
- Konfiguroimaan tuotantovalmiit käyttöönotot asianmukaisella turvallisuudella ja valvonnalla
- Hallitsemaan monimutkaisia moniympäristöisiä käyttöönotto-tilanteita
- Optimoimaan käyttöönottotehokkuutta ja toteuttamaan palautusstrategioita
- Integroimaan azd-käyttöönnotot yrityksen DevOps-käytäntöihin

## Käyttöönoton yleiskuva

Azure Developer CLI tarjoaa useita käyttöönotto-komentoja:
- `azd up` - Kokonaisvaltainen työnkulku (provisioi + ota käyttöön)
- `azd provision` - Luo/päivitä vain Azure-resursseja
- `azd deploy` - Käytä sovelluskoodia vain
- `azd package` - Rakenna ja pakkaa sovellukset

## Peruskäyttöönottotyönkulut

### Kokonaisvaltainen käyttöönotto (azd up)
Yleisin työnkulku uusille projekteille:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Vain infrastruktuurin käyttöönotto
Kun haluat päivittää vain Azure-resursseja:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Vain koodin käyttöönotto
Nopeaa sovelluspäivitystä varten:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Käyttöönoton tarkistus

Käyttöönoton jälkeen varmista onnistuminen:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Onnistumisen kriteerit:**
- ✅ `azd show` vastaa odotettuja palvelukohteita/URL-osoitteita
- ✅ Sovelluksen pyynnöt palauttavat odotetun tilan ja sisällön
- ✅ Viimeisen 5 minuutin aikana ei virhelokeja
- ✅ Sovellus vastaa testipyyntöihin

## 🏗️ Käyttöönoton prosessin ymmärtäminen

### Uusi koukkujen kanssa? Aloita tästä

**Koukku** on komento, jonka azd suorittaa automaattisesti tietyllä hetkellä käyttöönoton aikana — ennen tai jälkeen provisioinnin, sekä ennen tai jälkeen koodin käyttöönoton. Ne mahdollistavat pienten rutiinitehtävien automatisoinnin, jotka liittyvät aina käyttöönottoon: tietokannan esitäyttö, migraatioiden suoritus, resurssien rakentaminen tai live-sovelluksen savutestaus.

| Koukku | Suoritusajankohta… | Yleinen käyttötarkoitus |
|------|--------------------|--------------------|
| `preprovision` | Ennen resurssien luontia | Tarkista ennakkoedellytykset, kirjaudu rekisteriin |
| `postprovision` | Resurssien olemassaolon jälkeen | Konfiguroi resurssit, perustaa tietokanta |
| `predeploy` | Ennen koodin käyttöönottoa | Rakenna front-end-resurssit, suorita yksikkötestit |
| `postdeploy` | Kun koodi on käytössä | Suorita tietokantamigraatiot, savutestaus |

Koukut sijaitsevat tiedostossasi `azure.yaml`. Tässä on pienin mahdollinen esimerkki — se vain tulostaa viestin käyttöönoton jälkeen:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Siinä kaikki — seuraavalla `azd up` ajokerralla viesti tulostuu automaattisesti. Voit myös ajaa koukun yksinään ilman täyttä käyttöönottoa, mikä sopii hyvin testaamiseen:

```bash
azd hooks run postdeploy
```

Alla esitetyt vaiheet näyttävät todellisia koukkuja (migraatiot, testit, validointi) kullekin vaiheelle.

### Vaihe 1: Ennen provisiointia suoritettavat koukut
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
- Lukee infrastruktuurimalleja (Bicep/Terraform)
- Luo tai päivittää Azure-resursseja
- Konfiguroi verkottumisen ja turvallisuuden
- Ottaa käyttöön valvonnan ja lokituksen

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

### Vaihe 4: Sovelluksen pakkaus
- Kokoa sovelluskoodi
- Luo käyttöönotto-artifakteja
- Pakkaa kohdealustalle (kontit, ZIP-tiedostot jne.)

### Vaihe 5: Ennen käyttöönottoa suoritettavat koukut
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
- Ottaa käyttöön pakatut sovellukset Azure-palveluihin
- Päivittää konfiguraatioasetukset
- Käynnistää/uutta käynnistää palvelut

### Vaihe 7: Käyttöönoton jälkeiset koukut
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Koukkuvirheiden käsittely

Oletuksena **jos koukkukomento poistuu ei-nollakoodilla, azd keskeyttää koko toiminnon.** Tämä on yleensä toivottu käytös — epäonnistunut migraatio pysäyttää käyttöönoton, ei julkaise rikki menevää sovellusta. Tämä tarkoittaa, että koukut täytyy kirjoittaa huolellisesti.

**1. Tee virheistä selvät ja tarkoitukselliset.** Koukku epäonnistuu, jos sen viimeinen komento palauttaa ei-nollakoodin. Shell-skripteissä lisää `set -e`, jotta koukku pysähtyy heti ensimmäiseen virheeseen sen sijaan, että jatkaisi hiljaa:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Salli koukun epäonnistuminen keskeyttämättä azd:tä.** Ei-kriittisissä vaiheissa (valinnainen välimuistin lämmitys, paras-yritys-notifikaatio), aseta `continueOnError: true`. Azd kirjauttaa epäonnistumisen mutta jatkaa:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testaa koukut erikseen ennen täyttä ajoa.** Sinun ei tarvitse ajaa `azd up` virheenmääritystä varten — aja se erikseen ja kehitä nopeasti:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Huomioi käyttöjärjestelmäkohtaiset shellit.** `shell: pwsh`-pohjainen koukku tarvitsee PowerShellin koneessa, joka ajaa sitä (mukaan lukien CI-agentit). Käytä `shell: sh` varmimman yhteensopivuuden vuoksi tai tarjoa sekä `windows` että `posix` versiot:

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

> **Virheenmääritysvinkki:** aja mikä tahansa azd-komento `--debug` kanssa nähdäksesi tarkan koukkukomennon ja koko sen tulosteen — korvaamaton, kun koukku toimii paikallisesti mutta epäonnistuu CI:ssä.

## 🎛️ Käyttöönoton konfigurointi

### Palvelukohtaiset käyttöönottoasetukset
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Ympäristökohtaiset konfiguraatiot

Nämä ovat vain paikallisia azd-arvoja. Karttaa ne nimenomaisesti infrastruktuurin/suoritusympäristön asetuksiin. `NODE_ENV` on tavallisesti `production` tuotantoon siirretylle Node-sovellukselle, mukaan lukien staging-käyttöönotto; käytä erillistä sovelluskohtaista muuttujaa erottamaan vaiheita.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Edistyneet käyttöönotto-tilanteet

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

### Sinivihreät käyttöönotot

**Havainnollistava toimintakaavio:** sinun on toimitettava molemmat ympäristöt, jaettu liikenteen ohjauskerros sekä kaksi alla olevaa skriptiä. Azd ei automaattisesti vaihda liikennettä tai validoi palautusvalmiutta. Pidä vihreä aktiivisena, kunnes sininen on läpäissyt testauksen eikä paluuta enää tarvita.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Kanarialähetykset
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Liikenteen jakaminen kuuluu Container Apps -konfiguraatioon (Bicep tai Azure CLI), ei `azure.yaml` `trafficSplit` ominaisuuteen. Esikatselu/provisiointi ja myöhemmät käyttöönotot on säilytettävä valitulla revisiomoodilla ja reitityssäännöillä.

### Vaiheistetut käyttöönotot
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Konttien käyttöönotot

### Container App -käyttöönotot
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Konfiguroi suoritusaikaiset salaisuudet `configuration.secrets`/`secretRef` avulla (tai Key Vault -viitteiden kautta) ja skaalaus `template.scale` Container App -infrastruktuurissa. Älä keksi palvelutason `secrets` tai `scale` ominaisuuksia `azure.yaml`.

### Monivaiheinen Dockerfile-optimointi
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
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
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Rakennuksen välimuisti
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Tavallinen Node-työnkulku käyttää pakettiskriptejä; palvelun `prepackage` koukut voivat lisätä tarvittavia vaiheita. Docker-kerrosvälimuisti eroaa palvelun rakennuskomennon määrittämisestä.

### Tehokkaat koodin käyttöönotot
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Käyttöönoton valvonta

### Reaaliaikainen käyttöönoton valvonta
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Terveystarkastukset
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Sovelluksesi on toteutettava `/health`; azd ei toimita sitä automaattisesti. Ei ole yleistä `azure.yaml` `healthCheck` palvelun ominaisuutta.

### Käyttöönoton jälkeinen validointi
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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

### Salausten hallinta
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` on kelvoton. Tavalliset ympäristömuuttujat ovat paikallisia selväkielisiä; älä oleta että luku-komennot häivyttävät niitä. Yllä olevat komennot tallentavat Key Vault -viitteet, mutta infrastruktuurisi/sovelluksesi täytyy vielä hyödyntää salaisuuksia ja myöntää suoritusaikainen identiteetti käyttöoikeuksiin.

### Verkkoturvallisuus
Määrittele ja käytä verkkoasetuksia Bicepissä, ja kartoita ne `infra/main.parameters.json`:ssa. Ei ole yleistä `infra.parameters` peitekerrosta `azure.yaml`:ssa. Esimerkkidokumentaation `203.0.113.0/24` ja `198.51.100.0/24` verkkoalueet eivät ole aitoja toimisto/VPN-verkkoja; korvaa ne valtuutetuilla verkkoalueilla.

### Identiteetin ja pääsynhallinta
Ota Container App -palvelun `identity` käyttöön Bicepissä ja myönnä tarvittava Key Vault -data-alustarooli säiliön laajuudessa. Konfiguroi nimetyt Key Vault -taustaiset salaisuudet ja suoritusaikaiset viitteet kyseiseen resurssiin; `identity` ja `keyVault` eivät ole yleisiä azd-palvelun ominaisuuksia. Katso [Autentikointi & Hallittu identiteetti](../chapter-03-configuration/authsecurity.md).

## 🚨 Palautusstrategiat

### Nopeasti palautus
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Infrastruktuurin palautus
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

### Seuraa käyttöönoton suorituskykyä
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Mukautetut mittarien keruut
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

### 1. Ympäristön yhdenmukaisuus
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktuurin validointi
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Testausintegraatio
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

### 4. Dokumentaatio ja lokitus
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Seuraavat askeleet

- [Resurssien provisiointi](provisioning.md) - Syväsukellus infrastruktuurin hallintaan
- [Ennen käyttöönottoa suunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Suunnittele käyttöönotto-strategiasi
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md) - Ratkaise käyttöönottovirheet
- [Parhaat käytännöt](../chapter-07-troubleshooting/debugging.md) - Tuotantovalmiit käyttöönotto-strategiat

## 🎯 Käytännön käyttöönottotehtävät

### Harjoitus 1: Inkrementaalinen käyttöönoton työnkulku (20 min)
**Tavoite**: Hallitse ero täydellisen ja inkrementaalisen käyttöönoton välillä

**Lähtötilanne:** Bash, Node.js 22, Git, azd sisäänkirjautuminen ja Azure-tilaus käyttöönottoluvilla. Suorita uudessa hakemistossa; odota laskutettavia App Service-/Cosmos DB-resursseja. Aikavaatimukset riippuvat alueesta ja mallista.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Onnistumisen kriteerit:**
- [ ] Tallenna kulunut aika molemmille komennoille (ei taattua kestoa)
- [ ] Molemmat komennot suoriutuvat onnistuneesti
- [ ] API pysyy toiminnassa; kommenttimuutoksella ei ole näkyvää käyttöliittymän muutosta
- [ ] Infrastruktuuri säilyy muuttumattomana `azd deploy` jälkeen

**Oppimistulos**: `azd deploy` ohittaa infrastruktuurin provisioinnin. Vertaa mitattuja aikoja äläkä oleta kiinteää nopeutusta.

### Harjoitus 2: Mukautetut käyttöönoton koukut (30 min)
**Tavoite**: Toteuta ennen ja jälkeen käyttöönoton automaatio

**Lähtötilanne:** yllä alustettu `deployment-practice` projekti. Jos olet siivonnut sen pois, aja `azd up` uudelleen ennen koodin käyttöönottotestausta. Alla oleva validointi käyttää API:n todellista rakennusskriptiä, ei olematonta juuritasolla olevia `test:unit` skriptiä. Mallin API-testit tarvitsevat konfiguroidun tietokantayhteyden; ne eivät ole eristettyjä yksikkötestejä.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Onnistumisen kriteerit:**
- [ ] Pre-deploy-skripti suoritetaan ennen käyttöönottoa
- [ ] Käyttöönottoprosessi keskeytyy, jos rakennuksen validointi epäonnistuu
- [ ] Post-deploy savutesti varmistaa terveyden
- [ ] Koukut suoritetaan oikeassa järjestyksessä

### Harjoitus 3: Moniympäristöinen käyttöönotto-strategia (45 min)
**Tavoite**: Toteuta vaiheistettu käyttöönoton työnkulku (dev → staging → tuotanto)

**Alkutilanne:** sama alustettu todo-projekti kuin `jq`. Luo alla olevat ympäristöt käyttäen oikeita tilausten/sijaintien arvoja (tai aseta `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` kuhunkin) **ennen** no-prompt-työnkulun käynnistämistä. Se epäonnistuu tarkoituksella, sen sijaan että keksisi puuttuvia arvoja. Käytä vain väliaikaisia harjoituskäyttöön tarkoitettuja ympäristöjä, ei todellista tuotantotilausta.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Onnistumiskriteerit:**
- [ ] Dev-ympäristö asentuu onnistuneesti
- [ ] Staging-ympäristö asentuu onnistuneesti
- [ ] Tuotantoon tarvitaan manuaalinen hyväksyntä
- [ ] Kaikissa ympäristöissä toimii terveystarkastus
- [ ] Palautus onnistuu tarvittaessa

### Harjoitus 4: Palautusstrategia (25 minuuttia)
**Tavoite**: Toteuta ja testaa käyttöönoton palautus Gitin avulla

**Alkutilanne:** eristetty harjoituscheckout todo-pohjamallista, jossa kaikki peruslähtötiedot on sitoutettu, puhdas Git-työpöytä ja väliaikainen konfiguroitu ympäristö. Älä koskaan aiheuta tarkoituksellisia vikoja oikeassa tuotantoprojektissa. Alla oleva `APP_VERSION` on vain kirjanpitoa, ellei sitä nimenomaisesti yhdistetä sovellukseen.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Onnistumiskriteerit:**
- [ ] Osaa havaita käyttöönoton epäonnistumiset
- [ ] Palautusskripti suoritetaan automaattisesti
- [ ] Sovellus palautuu toimivaan tilaan
- [ ] Terveystarkastukset läpäistään palautuksen jälkeen

## 📊 Käyttöönoton mittareiden seuranta

### Seuraa käyttöönoton suorituskykyäsi

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analysoi mittareitasi:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Lisäresurssit

- [Azure Developer CLI:n käyttöönotto-opas](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service -käyttöönotto](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps -käyttöönotto](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions -käyttöönotto](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigointi**
- **Edellinen oppitunti**: [Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **Seuraava oppitunti**: [Resurssien provisiointi](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->