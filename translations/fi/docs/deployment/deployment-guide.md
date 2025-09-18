<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T06:35:27+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "fi"
}
-->
# Käyttöönotto-opas - AZD-käyttöönottojen hallinta

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastruktuuri koodina & käyttöönotto
- **⬅️ Edellinen luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)
- **➡️ Seuraava**: [Resurssien provisiointi](provisioning.md)
- **🚀 Seuraava luku**: [Luku 5: Moniagenttiset tekoälyratkaisut](../../examples/retail-scenario.md)

## Johdanto

Tämä kattava opas käsittelee kaiken, mitä sinun tarvitsee tietää sovellusten käyttöönotosta Azure Developer CLI:n avulla, yksinkertaisista yhden komennon käyttöönotosta edistyneisiin tuotantotilanteisiin, joissa on mukautettuja koukkuja, useita ympäristöjä ja CI/CD-integraatio. Hallitse koko käyttöönoton elinkaari käytännön esimerkkien ja parhaiden käytäntöjen avulla.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan kaikki Azure Developer CLI:n käyttöönotto-komennot ja työnkulut
- Ymmärtämään käyttöönoton koko elinkaaren provisioinnista seurantaan
- Toteuttamaan mukautettuja käyttöönotto-koukkuja automaatiota varten ennen ja jälkeen käyttöönoton
- Konfiguroimaan useita ympäristöjä ympäristökohtaisilla parametreilla
- Ottamaan käyttöön edistyneitä käyttöönotto-strategioita, kuten blue-green- ja canary-käyttöönotot
- Integroimaan azd-käyttöönotot CI/CD-putkistoihin ja DevOps-työnkulkuihin

## Oppimistulokset

Oppaan suorittamisen jälkeen pystyt:
- Suorittamaan ja vianetsimään itsenäisesti kaikki azd-käyttöönotto-työnkulut
- Suunnittelemaan ja toteuttamaan mukautettua käyttöönotto-automaatioita koukkujen avulla
- Konfiguroimaan tuotantovalmiit käyttöönotot asianmukaisella turvallisuudella ja seurannalla
- Hallitsemaan monimutkaisia monen ympäristön käyttöönotto-skenaarioita
- Optimoimaan käyttöönoton suorituskykyä ja toteuttamaan palautusstrategioita
- Integroimaan azd-käyttöönotot yrityksen DevOps-käytäntöihin

## Käyttöönoton yleiskatsaus

Azure Developer CLI tarjoaa useita käyttöönotto-komentoja:
- `azd up` - Koko työnkulku (provisiointi + käyttöönotto)
- `azd provision` - Luo/päivittää vain Azure-resurssit
- `azd deploy` - Ottaa käyttöön vain sovelluskoodin
- `azd package` - Rakentaa ja pakkaa sovellukset

## Peruskäyttöönotto-työnkulut

### Täydellinen käyttöönotto (azd up)
Yleisin työnkulku uusille projekteille:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Vain infrastruktuurin provisiointi
Kun tarvitset vain Azure-resurssien päivitystä:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Vain koodin käyttöönotto
Nopeita sovelluspäivityksiä varten:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

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
- Luo tai päivittää Azure-resurssit
- Konfiguroi verkot ja turvallisuuden
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
- Luo käyttöönotto-artifaktit
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

### Palvelukohtaiset käyttöönotto-asetukset
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
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

## 🐳 Konttikäyttöönotot

### Konttisovellusten käyttöönotto
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Käyttöönoton seuranta

### Reaaliaikainen käyttöönoton seuranta
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

# Check application health
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

## 🔐 Turvallisuushuomiot

### Salaisuuksien hallinta
```bash
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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

### Identiteetti ja käyttöoikeuksien hallinta
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Infrastruktuurin palautus
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
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

### Käyttöönoton suorituskyvyn seuranta
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktuurin validointi
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Seuraavat askeleet

- [Resurssien provisiointi](provisioning.md) - Syväsukellus infrastruktuurin hallintaan
- [Ennen käyttöönottoa -suunnittelu](../pre-deployment/capacity-planning.md) - Suunnittele käyttöönotto-strategiasi
- [Yleiset ongelmat](../troubleshooting/common-issues.md) - Ratkaise käyttöönotto-ongelmat
- [Parhaat käytännöt](../troubleshooting/debugging.md) - Tuotantovalmiit käyttöönotto-strategiat

## Lisäresurssit

- [Azure Developer CLI -käyttöönotto-viite](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service -käyttöönotto](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps -käyttöönotto](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions -käyttöönotto](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigointi**
- **Edellinen oppitunti**: [Ensimmäinen projektisi](../getting-started/first-project.md)
- **Seuraava oppitunti**: [Resurssien provisiointi](provisioning.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.