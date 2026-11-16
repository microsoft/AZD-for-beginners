# Bereitstellungsanleitung - Meisterung von AZD-Bereitstellungen

**Kapitel-Navigation:**
- **📚 Kurs Startseite**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 - Infrastruktur als Code & Bereitstellung
- **⬅️ Vorheriges Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Nächstes**: [Ressourcen bereitstellen](provisioning.md)
- **🧩 Ebenfalls in diesem Kapitel**: [Eigenes Template erstellen](custom-templates.md)
- **🚀 Nächstes Kapitel**: [Kapitel 5: Multi-Agent KI-Lösungen](../../examples/retail-scenario.md)

## Einführung

> Überprüft gegen `azd 1.37.2` (November 2026). Befehle verwenden Bash; JSON-Beispiele benötigen `jq`. Abgesehen von der explizit initialisierten Todo-Übung sind fortgeschrittene Beispiele **Integrationsfragmente**: liefern Sie Ihre eigenen Quellen, Infrastruktur, Tests und Skripte. Es wurden keine Azure-Bereitstellungen während dieser Überprüfung ausgeführt.

Dieser umfassende Leitfaden behandelt alles, was Sie über die Bereitstellung von Anwendungen mit Azure Developer CLI wissen müssen – von einfachen Ein-Befehl-Bereitstellungen bis hin zu fortgeschrittenen Produktionsszenarien mit benutzerdefinierten Hooks, mehreren Umgebungen und CI/CD-Integration. Meistern Sie den kompletten Bereitstellungszyklus mit praktischen Beispielen und Best Practices.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Alle Azure Developer CLI Bereitstellungsbefehle und Workflows beherrschen
- Den gesamten Bereitstellungszyklus von der Bereitstellung bis zum Monitoring verstehen
- Benutzerdefinierte Bereitstellungs-Hooks für Vor- und Nachbereitungsautomatisierung umsetzen
- Mehrere Umgebungen mit umgebungsspezifischen Parametern konfigurieren
- Fortgeschrittene Bereitstellungsstrategien wie Blue-Green- und Canary-Bereitstellungen einrichten
- Azd-Bereitstellungen mit CI/CD-Pipelines und DevOps-Workflows integrieren

## Lernergebnisse

Nach Abschluss können Sie:
- Alle azd-Bereitstellungs-Workflows eigenständig ausführen und Fehler beheben
- Benutzerdefinierte Bereitstellungsautomatisierung mittels Hooks entwerfen und implementieren
- Produktionsreife Bereitstellungen mit angemessener Sicherheit und Überwachung konfigurieren
- Komplexe Multi-Umgebungs-Bereitstellungsszenarien verwalten
- Bereitstellungsleistung optimieren und Rollback-Strategien umsetzen
- Azd-Bereitstellungen in unternehmensweite DevOps-Praktiken integrieren

## Überblick über die Bereitstellung

Azure Developer CLI stellt mehrere Bereitstellungsbefehle bereit:
- `azd up` - Kompletten Workflow (Bereitstellen + Deployment)
- `azd provision` - Azure-Ressourcen nur erstellen/aktualisieren
- `azd deploy` - Nur Anwendungscode bereitstellen
- `azd package` - Anwendungen bauen und paketieren

## Grundlegende Bereitstellungs-Workflows

### Komplett-Bereitstellung (azd up)
Der gebräuchlichste Workflow für neue Projekte:
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

### Nur Infrastruktur-Bereitstellung
Wenn Sie nur Azure-Ressourcen aktualisieren müssen:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Nur Code-Bereitstellung
Für schnelle Anwendungsaktualisierungen:
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

### ✅ Bereitstellungsüberprüfung

Überprüfen Sie nach jeder Bereitstellung den Erfolg:

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

**Erfolgskriterien:**
- ✅ `azd show` löst erwartete Serviceziele/URLs auf
- ✅ Anfragen an tatsächliche Anwendungsrouten geben den erwarteten Status und Inhalt zurück
- ✅ Keine Fehlerprotokolle der letzten 5 Minuten
- ✅ Anwendung reagiert auf Testanfragen

## 🏗️ Verständnis des Bereitstellungsprozesses

### Neu bei Hooks? Hier starten

Ein **Hook** ist ein Befehl, den azd automatisch zu einem bestimmten Zeitpunkt im Bereitstellungsprozess ausführt – vor oder nach der Bereitstellung der Infrastruktur und vor oder nach dem Deployment Ihres Codes. Damit automatisieren Sie die kleinen Aufgaben, die eine Bereitstellung begleiten: Datenbank befüllen, Migrationen ausführen, Assets bauen oder die live App testen.

| Hook | Wird ausgeführt… | Häufige Verwendung |
|------|--------------------|-------------------|
| `preprovision` | Bevor Ressourcen erstellt werden | Voraussetzungen prüfen, Login in Registry |
| `postprovision` | Nachdem Ressourcen vorhanden sind | Ressourcen konfigurieren, Datenbank einrichten |
| `predeploy` | Bevor Code bereitgestellt wird | Frontend-Assets bauen, Unit-Tests ausführen |
| `postdeploy` | Nachdem Code live ist | DB-Migrationen ausführen, Endpoint testen |

Hooks leben in Ihrer `azure.yaml`. Hier das kleinstmögliche Beispiel – es gibt nur eine Nachricht nach der Bereitstellung aus:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Das war’s – beim nächsten Lauf von `azd up` wird die Nachricht automatisch ausgegeben. Sie können einen Hook auch alleine laufen lassen, ohne volle Bereitstellung, ideal zum Testen:

```bash
azd hooks run postdeploy
```

Die Phasen unten zeigen realistische Hooks (Migrationen, Tests, Validierung) für jede Stufe.

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

### Phase 2: Infrastrukturbereitstellung
- Liest Infrastruktur-Templates (Bicep/Terraform)
- Erstellt oder aktualisiert Azure-Ressourcen
- Konfiguriert Netzwerk und Sicherheit
- Richtet Monitoring und Logging ein

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
- Baut Anwendungscode
- Erstellt Bereitstellungs-Artefakte
- Paketiert für Zielplattform (Container, ZIP-Dateien etc.)

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
- Stellt verpackte Anwendungen auf Azure-Services bereit
- Aktualisiert Konfigurationseinstellungen
- Startet/stoppt Dienste

### Phase 7: Post-Deploy Hooks
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

### Umgang mit Hook-Fehlern

Standardmäßig **beendet azd die gesamte Operation, wenn ein Hook-Befehl mit einem Fehlercode endet.** Das ist normalerweise gewollt – eine fehlgeschlagene Migration sollte das Deployment abbrechen, keine fehlerhafte App ausliefern. Es bedeutet aber, dass Hooks sorgsam geschrieben sein müssen.

**1. Machen Sie Fehler hörbar und beabsichtigt.** Ein Hook schlägt fehl, wenn der letzte Befehl einen Fehlercode liefert. In Shell-Skripten fügen Sie `set -e` hinzu, damit der Hook bei erstem Fehler stoppt, anstatt still weiterzulaufen:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Erlauben Sie, dass ein Hook ohne Abbruch scheitert.** Bei nicht-kritischen Schritten (optionalem Cache-Warmup, Benachrichtigung auf gut Glück) setzen Sie `continueOnError: true`. Azd loggt den Fehler, macht aber weiter:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testen Sie Hooks isoliert vor dem ganzen Lauf.** Sie müssen nicht `azd up` ausführen, um einen Hook zu debuggen – führen Sie ihn allein aus und iterieren Sie schnell:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Achten Sie auf OS-spezifische Shells.** Ein Hook, der `shell: pwsh` verwendet, benötigt PowerShell auf der Maschine (auch CI-Agenten). Nutzen Sie `shell: sh` für maximale Portabilität, oder stellen Sie Varianten für `windows` und `posix` bereit:

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

> **Debugging-Tipp:** Führen Sie jeden azd-Befehl mit `--debug` aus, um die exakte Hook-Kommandozeile und die vollständige Ausgabe zu sehen – unschätzbar, wenn ein Hook lokal funktioniert, aber in CI fehlschlägt.

## 🎛️ Bereitstellungskonfiguration

### Dienstspezifische Bereitstellungseinstellungen
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

### Umgebungsbezogene Konfigurationen

Diese sind nur lokale azd-Werte. Ordnen Sie sie explizit der Infrastruktur-/Laufzeitkonfiguration zu. `NODE_ENV` ist normalerweise `production` für eine bereitgestellte Node-Anwendung, inklusive Staging-Bereitstellung; verwenden Sie eine separate app-spezifische Variable, um Bereitstellungsphasen zu unterscheiden.

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

## 🔧 Fortgeschrittene Bereitstellungsszenarien

### Multi-Service-Anwendungen
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

**Beispielhafter Betriebsentwurf:** Sie müssen beide Umgebungen, eine gemeinsame Traffic-Routing-Schicht und die beiden folgenden Skripte bereitstellen. Azd schaltet Traffic oder validiert Rollback-Bereitschaft nicht automatisch. Halten Sie grün, bis blau getestet wurde und kein Rollback mehr nötig ist.

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
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Traffic-Aufteilung gehört zur Container Apps-Konfiguration (Bicep oder Azure CLI), nicht zu einer `azure.yaml` `trafficSplit`-Eigenschaft. Vorschau/Bereitstellung und spätere Deployments müssen Ihren gewählten Revisionsmodus und Routingregeln erhalten.

### Gestaffelte Bereitstellungen
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

## 🐳 Container-Bereitstellungen

### Container App-Bereitstellungen
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

Konfigurieren Sie Laufzeitgeheimnisse mit `configuration.secrets`/`secretRef` (oder Key Vault-Verweisen) und Skalierung mit `template.scale` in der Container App-Infrastruktur. Erfinden Sie keine service-spezifischen `secrets` oder `scale`-Eigenschaften in `azure.yaml`.

### Multi-Stage Dockerfile-Optimierung
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

## ⚡ Leistungsoptimierung

### Dienstspezifische Bereitstellungen
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Build-Caching
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Der Standard-Node-Workflow nutzt Paketskripte; dienstspezifische `prepackage` Hooks können erforderliche Schritte ergänzen. Docker Layer Caching ist getrennt von der Definition eines Service-Build-Befehls.

### Effiziente Code-Bereitstellungen
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Bereitstellungsüberwachung

### Echtzeit-Bereitstellungsüberwachung
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Health Checks
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

Ihre Anwendung muss `/health` implementieren; dies wird von azd nicht automatisch bereitgestellt. Es gibt keine generische `azure.yaml` `healthCheck`-Dienst-Eigenschaft.

### Validierung nach der Bereitstellung
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

## 🔐 Sicherheitsüberlegungen

### Geheimnisverwaltung
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` ist ungültig. Übliche Umgebungswerte sind lokale Klartextwerte; gehen Sie nicht davon aus, dass Lese-Befehle diese kürzen. Die obigen Befehle speichern Key Vault-Verweise, aber Ihre Infrastruktur/Anwendung muss die Geheimnisse trotzdem konsumieren und der Laufzeit-Identität Zugriff gewähren.

### Netzwerksicherheit
Deklarieren und konsumieren Sie Netzwerkparameter in Bicep und ordnen Sie diese in `infra/main.parameters.json` zu. Es gibt keine generische `infra.parameters`-Überlagerung in `azure.yaml`. Beispieldokumentationen mit `203.0.113.0/24` und `198.51.100.0/24` sind keine echten Büro-/VPN-Netzwerke; ersetzen Sie diese durch autorisierte Netzbereiche.

### Identitäts- und Zugriffsverwaltung
Aktivieren Sie das `identity` des Container Apps in Bicep und weisen Sie die nötige Key Vault Data-Plane Rolle auf der Vault-Ebene zu. Konfigurieren Sie benannte Key Vault-gestützte Geheimnisse und Laufzeitverweise in dieser Ressource; `identity` und `keyVault` sind keine generischen azd-Diensteigenschaften. Siehe [Authentifizierung & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Rollback-Strategien

### Schnelles Rollback
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

### Infrastruktur-Rollback
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

### Verfolgen der Bereitstellungsleistung
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
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

### 2. Infrastrukturvalidierung
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
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

### 4. Dokumentation und Logging
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nächste Schritte

- [Ressourcen bereitstellen](provisioning.md) - Tiefer Einblick in Infrastrukturmanagement
- [Planung vor der Bereitstellung](../chapter-06-pre-deployment/capacity-planning.md) - Planen Sie Ihre Bereitstellungsstrategie
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md) - Beheben von Bereitstellungsproblemen
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Produktionsreife Bereitstellungsstrategien

## 🎯 Praxisorientierte Bereitstellungsübungen

### Übung 1: Inkremeteller Bereitstellungs-Workflow (20 Minuten)
**Ziel**: Den Unterschied zwischen vollständiger und inkrementeller Bereitstellung meistern

**Ausgangspunkt:** Bash, Node.js 22, Git, azd-Anmeldung und ein Azure-Abonnement mit Berechtigungen für Bereitstellung. Führen Sie es in einem neuen Verzeichnis aus; rechnen Sie mit berechenbaren App Service/Cosmos DB-Ressourcen. Zeiten hängen von Region und Template ab.

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

**Erfolgskriterien:**
- [ ] Notieren Sie die verstrichene Zeit für beide Befehle (eine garantierte Dauer gibt es nicht)
- [ ] Beide Befehle schließen erfolgreich ab
- [ ] API bleibt funktional; der Kommentar-Only-Edit ist keine sichtbare UI-Änderung
- [ ] Infrastruktur ist nach `azd deploy` unverändert

**Lernergebnis**: `azd deploy` überspringt die Infrastrukturbereitstellung. Vergleichen Sie gemessene Zeiten, statt eine fixe prozentuale Beschleunigung anzunehmen.

### Übung 2: Benutzerdefinierte Bereitstellungshooks (30 Minuten)
**Ziel**: Automatisierung vor und nach der Bereitstellung umsetzen

**Ausgangspunkt:** das oben initialisierte `deployment-practice`-Projekt. Falls Sie es bereinigt haben, führen Sie `azd up` erneut aus, bevor Sie die nur-Code-Bereitstellung testen. Die Validierung unten nutzt das reale Build-Skript der API, nicht ein nicht existentes root `test:unit`-Skript. Die API-Tests des Templates benötigen konfigurierten Datenbankzugriff; es sind keine isolierten Unit-Tests.

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

**Erfolgskriterien:**
- [ ] Pre-Deploy-Skript läuft vor der Bereitstellung
- [ ] Bereitstellung bricht ab, wenn die Build-Validierung fehlschlägt
- [ ] Post-Deploy Smoke-Test überprüft Gesundheit
- [ ] Hooks werden in der richtigen Reihenfolge ausgeführt

### Übung 3: Multi-Environment-Bereitstellungsstrategie (45 Minuten)
**Ziel**: Umgesetzter gestaffelter Bereitstellungsworkflow (dev → staging → produktion)

**Ausgangspunkt:** dasselbe initialisierte Todo-Projekt mit `jq`. Erstellen Sie die untenstehenden Umgebungen mit echten Abonnement-/Standortwerten (oder setzen Sie `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` in jeder) **vor** dem Aufruf des Workflows ohne Eingabeaufforderung. Es schlägt absichtlich fehl, anstatt fehlende Werte zu erfinden. Verwenden Sie nur disposable Trainingsumgebungen, nicht ein tatsächliches Produktionsabonnement.

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

**Erfolgskriterien:**
- [ ] Dev-Umgebung wird erfolgreich bereitgestellt
- [ ] Staging-Umgebung wird erfolgreich bereitgestellt
- [ ] Manuelle Genehmigung für Produktion erforderlich
- [ ] Alle Umgebungen haben funktionierende Health Checks
- [ ] Rückrollen ist bei Bedarf möglich

### Übung 4: Rollback-Strategie (25 Minuten)
**Ziel**: Implementieren und Testen des Deploy-Rollbacks mit Git

**Ausgangspunkt:** ein isolierter Trainings-Checkout der Todo-Vorlage mit allen Basisquellen committed, einem sauberen Git-Arbeitsbaum und einer disposable konfigurierten Umgebung. Führen Sie in einem echten Produktionsprojekt niemals absichtliche Fehler ein. `APP_VERSION` unten dient nur zur Buchführung, es sei denn, Sie binden es ausdrücklich in die App ein.

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

**Erfolgskriterien:**
- [ ] Kann Fehler bei Deployments erkennen
- [ ] Rollback-Skript wird automatisch ausgeführt
- [ ] Anwendung kehrt in funktionierenden Zustand zurück
- [ ] Health Checks bestehen nach Rollback

## 📊 Verfolgung von Deployment-Kennzahlen

### Verfolgen Sie Ihre Deployment-Leistung

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

**Analysieren Sie Ihre Kennzahlen:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Zusätzliche Ressourcen

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Vorherige Lektion**: [Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **Nächste Lektion**: [Ressourcenbereitstellung](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->