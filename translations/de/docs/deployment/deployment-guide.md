<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-19T22:52:01+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "de"
}
-->
# Bereitstellungsleitfaden - AZD-Bereitstellungen meistern

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 - Infrastruktur als Code & Bereitstellung
- **⬅️ Vorheriges Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)
- **➡️ Weiter**: [Ressourcen bereitstellen](provisioning.md)
- **🚀 Nächstes Kapitel**: [Kapitel 5: Multi-Agent-AI-Lösungen](../../examples/retail-scenario.md)

## Einführung

Dieser umfassende Leitfaden behandelt alles, was Sie über die Bereitstellung von Anwendungen mit Azure Developer CLI wissen müssen – von einfachen Ein-Kommando-Bereitstellungen bis hin zu fortgeschrittenen Produktionsszenarien mit benutzerdefinierten Hooks, mehreren Umgebungen und CI/CD-Integration. Meistern Sie den gesamten Bereitstellungszyklus mit praktischen Beispielen und bewährten Verfahren.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Alle Azure Developer CLI-Befehle und Workflows für die Bereitstellung beherrschen
- Den vollständigen Bereitstellungszyklus von der Bereitstellung bis zur Überwachung verstehen
- Benutzerdefinierte Bereitstellungshooks für Automatisierung vor und nach der Bereitstellung implementieren
- Mehrere Umgebungen mit umgebungsspezifischen Parametern konfigurieren
- Fortgeschrittene Bereitstellungsstrategien wie Blue-Green- und Canary-Bereitstellungen einrichten
- AZD-Bereitstellungen in CI/CD-Pipelines und DevOps-Workflows integrieren

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Alle AZD-Bereitstellungsworkflows eigenständig auszuführen und zu beheben
- Benutzerdefinierte Automatisierung für die Bereitstellung mit Hooks zu entwerfen und umzusetzen
- Produktionsreife Bereitstellungen mit angemessener Sicherheit und Überwachung zu konfigurieren
- Komplexe Bereitstellungsszenarien mit mehreren Umgebungen zu verwalten
- Die Bereitstellungsleistung zu optimieren und Rollback-Strategien umzusetzen
- AZD-Bereitstellungen in Unternehmens-DevOps-Praktiken zu integrieren

## Überblick über die Bereitstellung

Azure Developer CLI bietet mehrere Bereitstellungsbefehle:
- `azd up` - Vollständiger Workflow (Bereitstellung + Deployment)
- `azd provision` - Nur Azure-Ressourcen erstellen/aktualisieren
- `azd deploy` - Nur Anwendungs-Code bereitstellen
- `azd package` - Anwendungen erstellen und paketieren

## Grundlegende Bereitstellungsworkflows

### Vollständige Bereitstellung (azd up)
Der häufigste Workflow für neue Projekte:
```bash
# Alles von Grund auf neu bereitstellen
azd up

# Mit spezifischer Umgebung bereitstellen
azd up --environment production

# Mit benutzerdefinierten Parametern bereitstellen
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nur Infrastruktur-Bereitstellung
Wenn Sie nur Azure-Ressourcen aktualisieren müssen:
```bash
# Bereitstellen/aktualisieren der Infrastruktur
azd provision

# Bereitstellung mit Dry-Run, um Änderungen vorzuschauen
azd provision --preview

# Bestimmte Dienste bereitstellen
azd provision --service database
```

### Nur Code-Bereitstellung
Für schnelle Anwendungsupdates:
```bash
# Alle Dienste bereitstellen
azd deploy

# Erwartete Ausgabe:
# Dienste werden bereitgestellt (azd deploy)
# - web: Bereitstellung... Fertig
# - api: Bereitstellung... Fertig
# ERFOLG: Ihre Bereitstellung wurde in 2 Minuten und 15 Sekunden abgeschlossen

# Spezifischen Dienst bereitstellen
azd deploy --service web
azd deploy --service api

# Mit benutzerdefinierten Build-Argumenten bereitstellen
azd deploy --service api --build-arg NODE_ENV=production

# Bereitstellung überprüfen
azd show --output json | jq '.services'
```

### ✅ Bereitstellungsüberprüfung

Nach jeder Bereitstellung den Erfolg überprüfen:

```bash
# Überprüfen Sie, ob alle Dienste laufen
azd show

# Testen Sie die Health-Endpunkte
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Überprüfen Sie die Protokolle auf Fehler
azd logs --service api --since 5m | grep -i error
```

**Erfolgskriterien:**
- ✅ Alle Dienste zeigen den Status "Running"
- ✅ Health-Endpunkte geben HTTP 200 zurück
- ✅ Keine Fehlerprotokolle in den letzten 5 Minuten
- ✅ Anwendung reagiert auf Testanfragen

## 🏗️ Verständnis des Bereitstellungsprozesses

### Phase 1: Hooks vor der Bereitstellung
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

### Phase 3: Hooks nach der Bereitstellung
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
- Erstellt Anwendungs-Code
- Erstellt Bereitstellungsartefakte
- Paketiert für Zielplattformen (Container, ZIP-Dateien usw.)

### Phase 5: Hooks vor der Bereitstellung
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

### Phase 7: Hooks nach der Bereitstellung
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
# Entwicklungsumgebung
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging-Umgebung
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produktionsumgebung
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
# Erstelle blaue Umgebung
azd env new production-blue
azd up --environment production-blue

# Teste blaue Umgebung
./scripts/test-environment.sh production-blue

# Leite den Traffic auf Blau um (manuelles DNS/Load-Balancer-Update)
./scripts/switch-traffic.sh production-blue

# Bereinige grüne Umgebung
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

### Multi-Stage-Dockerfile-Optimierung
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
# Konfigurieren Sie die parallele Bereitstellung
azd config set deploy.parallelism 5

# Dienste parallel bereitstellen
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
# Nur geänderte Dienste bereitstellen
azd deploy --incremental

# Mit Änderungsdetektion bereitstellen
azd deploy --detect-changes
```

## 🔍 Überwachung der Bereitstellung

### Echtzeit-Bereitstellungsüberwachung
```bash
# Überwachen Sie den Bereitstellungsfortschritt
azd deploy --follow

# Bereitstellungsprotokolle anzeigen
azd logs --follow --service api

# Bereitstellungsstatus überprüfen
azd show --service api
```

### Health-Checks
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

# Überprüfen Sie die Anwendungsintegrität
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
# Geheimnisse sicher speichern
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Geheimnisse in azure.yaml referenzieren
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
# Zurücksetzen auf vorherige Bereitstellung
azd deploy --rollback

# Spezifischen Dienst zurücksetzen
azd deploy --service api --rollback

# Auf spezifische Version zurücksetzen
azd deploy --service api --version v1.2.3
```

### Infrastruktur-Rollback
```bash
# Infrastrukturänderungen zurücksetzen
azd provision --rollback

# Änderungen des Rollbacks anzeigen
azd provision --rollback --preview
```

### Datenbank-Migrations-Rollback
```bash
#!/bin/bash
# skripte/rollback-datenbank.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Bereitstellungsmetriken

### Bereitstellungsleistung verfolgen
```bash
# Bereitstellungsmetriken aktivieren
azd config set telemetry.deployment.enabled true

# Bereitstellungshistorie anzeigen
azd history

# Bereitstellungsstatistiken abrufen
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
# Verwenden Sie konsistente Benennungen
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Erhalten Sie die Übereinstimmung der Umgebungen
./scripts/sync-environments.sh
```

### 2. Validierung der Infrastruktur
```bash
# Vor der Bereitstellung validieren
azd provision --preview
azd provision --what-if

# ARM/Bicep-Linting verwenden
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
# Dokumentieren Sie die Bereitstellungsverfahren
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nächste Schritte

- [Ressourcen bereitstellen](provisioning.md) - Tiefgehende Infrastrukturverwaltung
- [Planung vor der Bereitstellung](../pre-deployment/capacity-planning.md) - Ihre Bereitstellungsstrategie planen
- [Häufige Probleme](../troubleshooting/common-issues.md) - Bereitstellungsprobleme lösen
- [Best Practices](../troubleshooting/debugging.md) - Produktionsreife Bereitstellungsstrategien

## 🎯 Praktische Übungen zur Bereitstellung

### Übung 1: Inkrementeller Bereitstellungsworkflow (20 Minuten)
**Ziel**: Unterschied zwischen vollständigen und inkrementellen Bereitstellungen meistern

```bash
# Erste Bereitstellung
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zeit der ersten Bereitstellung aufzeichnen
echo "Full deployment: $(date)" > deployment-log.txt

# Eine Codeänderung vornehmen
echo "// Updated $(date)" >> src/api/src/server.js

# Nur Code bereitstellen (schnell)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Zeiten vergleichen
cat deployment-log.txt

# Aufräumen
azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Vollständige Bereitstellung dauert 5-15 Minuten
- [ ] Nur Code-Bereitstellung dauert 2-5 Minuten
- [ ] Codeänderungen werden in der bereitgestellten App reflektiert
- [ ] Infrastruktur bleibt nach `azd deploy` unverändert

**Lernergebnis**: `azd deploy` ist 50-70% schneller als `azd up` bei Codeänderungen

### Übung 2: Benutzerdefinierte Bereitstellungshooks (30 Minuten)
**Ziel**: Automatisierung vor und nach der Bereitstellung implementieren

```bash
# Erstelle ein Validierungsskript vor der Bereitstellung
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Überprüfen, ob Tests bestanden werden
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Überprüfen auf nicht übermittelte Änderungen
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Erstelle einen Smoke-Test nach der Bereitstellung
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

# Haken zu azure.yaml hinzufügen
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Bereitstellung mit Haken testen
azd deploy
```

**Erfolgskriterien:**
- [ ] Pre-Deploy-Skript wird vor der Bereitstellung ausgeführt
- [ ] Bereitstellung wird abgebrochen, wenn Tests fehlschlagen
- [ ] Post-Deploy-Smoke-Test validiert die Gesundheit
- [ ] Hooks werden in der richtigen Reihenfolge ausgeführt

### Übung 3: Multi-Umgebungs-Bereitstellungsstrategie (45 Minuten)
**Ziel**: Stufenweise Bereitstellungsworkflow implementieren (Dev → Staging → Produktion)

```bash
# Erstelle Bereitstellungsskript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Schritt 1: Bereitstellung in Entwicklung
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Schritt 2: Bereitstellung in Staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Schritt 3: Manuelle Genehmigung für Produktion
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

# Erstelle Umgebungen
azd env new dev
azd env new staging
azd env new production

# Führe gestufte Bereitstellung aus
./deploy-staged.sh
```

**Erfolgskriterien:**
- [ ] Dev-Umgebung wird erfolgreich bereitgestellt
- [ ] Staging-Umgebung wird erfolgreich bereitgestellt
- [ ] Manuelle Genehmigung für Produktion erforderlich
- [ ] Alle Umgebungen haben funktionierende Health-Checks
- [ ] Rollback ist bei Bedarf möglich

### Übung 4: Rollback-Strategie (25 Minuten)
**Ziel**: Bereitstellungs-Rollback implementieren und testen

```bash
# Bereitstellen v1
azd env set APP_VERSION "1.0.0"
azd up

# Speichere v1-Konfiguration
cp -r .azure/production .azure/production-v1-backup

# Bereitstellen v2 mit inkompatibler Änderung
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Fehler erkennen
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Code zurücksetzen
    git checkout src/api/src/server.js
    
    # Umgebung zurücksetzen
    azd env set APP_VERSION "1.0.0"
    
    # Erneut bereitstellen v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Erfolgskriterien:**
- [ ] Bereitstellungsfehler können erkannt werden
- [ ] Rollback-Skript wird automatisch ausgeführt
- [ ] Anwendung kehrt in funktionierenden Zustand zurück
- [ ] Health-Checks bestehen nach Rollback

## 📊 Verfolgung von Bereitstellungsmetriken

### Verfolgen Sie Ihre Bereitstellungsleistung

```bash
# Erstelle ein Bereitstellungsmetriken-Skript
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

# In Datei protokollieren
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Verwende es
./track-deployment.sh
```

**Analysieren Sie Ihre Metriken:**
```bash
# Bereitstellungshistorie anzeigen
cat deployment-metrics.csv

# Durchschnittliche Bereitstellungszeit berechnen
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

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

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->