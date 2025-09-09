<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T17:00:12+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "de"
}
-->
# Bereitstellungsanleitung - AZD-Bereitstellungen meistern

## Einführung

Dieser umfassende Leitfaden deckt alles ab, was Sie über die Bereitstellung von Anwendungen mit Azure Developer CLI wissen müssen – von einfachen Ein-Befehl-Bereitstellungen bis hin zu fortgeschrittenen Produktionsszenarien mit benutzerdefinierten Hooks, mehreren Umgebungen und CI/CD-Integration. Meistern Sie den gesamten Bereitstellungslebenszyklus mit praktischen Beispielen und bewährten Verfahren.

## Lernziele

Durch die Bearbeitung dieses Leitfadens werden Sie:
- Alle Azure Developer CLI-Befehle und Workflows für Bereitstellungen meistern
- Den vollständigen Bereitstellungslebenszyklus von der Bereitstellung bis zur Überwachung verstehen
- Benutzerdefinierte Bereitstellungshooks für Automatisierung vor und nach der Bereitstellung implementieren
- Mehrere Umgebungen mit umgebungsspezifischen Parametern konfigurieren
- Fortgeschrittene Bereitstellungsstrategien wie Blue-Green- und Canary-Bereitstellungen einrichten
- AZD-Bereitstellungen in CI/CD-Pipelines und DevOps-Workflows integrieren

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Alle AZD-Bereitstellungsworkflows eigenständig auszuführen und zu beheben
- Benutzerdefinierte Automatisierung für Bereitstellungen mit Hooks zu entwerfen und umzusetzen
- Produktionsreife Bereitstellungen mit angemessener Sicherheit und Überwachung zu konfigurieren
- Komplexe Multi-Umgebungs-Bereitstellungsszenarien zu verwalten
- Die Leistung von Bereitstellungen zu optimieren und Rollback-Strategien umzusetzen
- AZD-Bereitstellungen in Unternehmens-DevOps-Praktiken zu integrieren

## Überblick über die Bereitstellung

Azure Developer CLI bietet mehrere Bereitstellungsbefehle:
- `azd up` - Vollständiger Workflow (Bereitstellung + Deployment)
- `azd provision` - Nur Azure-Ressourcen erstellen/aktualisieren
- `azd deploy` - Nur Anwendungscode bereitstellen
- `azd package` - Anwendungen erstellen und paketieren

## Grundlegende Bereitstellungsworkflows

### Vollständige Bereitstellung (azd up)
Der häufigste Workflow für neue Projekte:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nur Infrastruktur-Bereitstellung
Wenn Sie nur Azure-Ressourcen aktualisieren müssen:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Nur Code-Bereitstellung
Für schnelle Anwendungsupdates:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Verständnis des Bereitstellungsprozesses

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

### Phase 2: Infrastruktur-Bereitstellung
- Liest Infrastrukturvorlagen (Bicep/Terraform)
- Erstellt oder aktualisiert Azure-Ressourcen
- Konfiguriert Netzwerk und Sicherheit
- Richtet Überwachung und Protokollierung ein

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

### Phase 4: Anwendungspaketierung
- Erstellt Anwendungscode
- Erstellt Bereitstellungsartefakte
- Paketiert für die Zielplattform (Container, ZIP-Dateien usw.)

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

### Phase 6: Anwendungsbereitstellung
- Stellt paketierte Anwendungen in Azure-Diensten bereit
- Aktualisiert Konfigurationseinstellungen
- Startet/Neustartet Dienste

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

## 🎛️ Bereitstellungskonfiguration

### Dienstspezifische Bereitstellungseinstellungen
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

### Umgebungsspezifische Konfigurationen
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

## 🔧 Fortgeschrittene Bereitstellungsszenarien

### Anwendungen mit mehreren Diensten
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

### Blue-Green-Bereitstellungen
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

### Canary-Bereitstellungen
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

### Stufenweise Bereitstellungen
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

## 🐳 Container-Bereitstellungen

### Container-App-Bereitstellungen
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

### Optimierung von Multi-Stage-Dockerfiles
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

## ⚡ Leistungsoptimierung

### Parallele Bereitstellungen
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Build-Caching
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

### Inkrementelle Bereitstellungen
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Überwachung der Bereitstellung

### Echtzeit-Bereitstellungsüberwachung
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Gesundheitschecks
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

### Validierung nach der Bereitstellung
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

## 🔐 Sicherheitsüberlegungen

### Geheimnisverwaltung
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

### Netzwerksicherheit
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitäts- und Zugriffsmanagement
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

## 🚨 Rollback-Strategien

### Schnelles Rollback
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Infrastruktur-Rollback
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Rollback von Datenbankmigrationen
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Bereitstellungsmetriken

### Leistung der Bereitstellung verfolgen
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Sammlung benutzerdefinierter Metriken
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

### 1. Konsistenz der Umgebung
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validierung der Infrastruktur
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Integration von Tests
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

### 4. Dokumentation und Protokollierung
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nächste Schritte

- [Ressourcen bereitstellen](provisioning.md) - Detaillierte Informationen zur Infrastrukturverwaltung
- [Planung vor der Bereitstellung](../pre-deployment/capacity-planning.md) - Ihre Bereitstellungsstrategie planen
- [Häufige Probleme](../troubleshooting/common-issues.md) - Bereitstellungsprobleme lösen
- [Best Practices](../troubleshooting/debugging.md) - Produktionsreife Bereitstellungsstrategien

## Zusätzliche Ressourcen

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Vorherige Lektion**: [Ihr erstes Projekt](../getting-started/first-project.md)
- **Nächste Lektion**: [Ressourcen bereitstellen](provisioning.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.