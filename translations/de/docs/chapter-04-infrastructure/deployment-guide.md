# Bereitstellungsleitfaden - AZD-Bereitstellungen meistern

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 - Infrastruktur als Code & Bereitstellung
- **⬅️ Vorheriges Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Nächstes**: [Ressourcen bereitstellen](provisioning.md)
- **🧩 Außerdem in diesem Kapitel**: [Eigene Vorlage erstellen](custom-templates.md)
- **🚀 Nächstes Kapitel**: [Kapitel 5: Multi-Agenten-KI-Lösungen](../../examples/retail-scenario.md)

## Einleitung

Dieser umfassende Leitfaden behandelt alles, was Sie zum Bereitstellen von Anwendungen mit der Azure Developer CLI wissen müssen — von einfachen Ein-Kommando-Bereitstellungen bis hin zu fortgeschrittenen Produktionsszenarien mit benutzerdefinierten Hooks, mehreren Umgebungen und CI/CD-Integration. Beherrschen Sie den kompletten Bereitstellungslebenszyklus mit praxisnahen Beispielen und Best Practices.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Alle Azure Developer CLI-Bereitstellungsbefehle und Workflows beherrschen
- Den kompletten Bereitstellungslebenszyklus von Provisionierung bis Monitoring verstehen
- Benutzerdefinierte Bereitstellungs-Hooks für Pre- und Post-Deployment-Automatisierung implementieren
- Mehrere Umgebungen mit umgebungsspezifischen Parametern konfigurieren
- Erweiterte Bereitstellungsstrategien wie Blue-Green und Canary-Deployments einrichten
- azd-Bereitstellungen in CI/CD-Pipelines und DevOps-Workflows integrieren

## Lernergebnisse

Nach Abschluss sind Sie in der Lage:
- Alle azd-Bereitstellungs-Workflows eigenständig auszuführen und zu beheben
- Benutzerdefinierte Bereitstellungsautomatisierung mithilfe von Hooks zu entwerfen und umzusetzen
- Produktionsreife Bereitstellungen mit angemessener Sicherheit und Monitoring zu konfigurieren
- Komplexe Multi-Environment-Bereitstellungsszenarien zu verwalten
- Die Bereitstellungsleistung zu optimieren und Rollback-Strategien umzusetzen
- azd-Bereitstellungen in unternehmensweite DevOps-Praktiken zu integrieren

## Überblick über die Bereitstellung

Azure Developer CLI bietet mehrere Bereitstellungsbefehle:
- `azd up` - Vollständiger Workflow (Ressourcen-Provisionierung + Bereitstellung)
- `azd provision` - Nur Azure-Ressourcen erstellen/aktualisieren
- `azd deploy` - Nur Anwendungs-Code bereitstellen
- `azd package` - Anwendungen bauen und paketieren

## Grundlegende Bereitstellungs-Workflows

### Vollständige Bereitstellung (azd up)
Der gebräuchlichste Workflow für neue Projekte:
```bash
# Alles von Grund auf bereitstellen
azd up

# In einer bestimmten Umgebung bereitstellen
azd up --environment production

# Mit benutzerdefinierten Parametern bereitstellen
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Nur Infrastruktur-Bereitstellung
Wenn Sie nur Azure-Ressourcen aktualisieren müssen:
```bash
# Infrastruktur bereitstellen/aktualisieren
azd provision

# Mit einem Dry-Run bereitstellen, um Änderungen vorab anzuzeigen
azd provision --preview

# Bestimmte Dienste bereitstellen
azd provision --service database
```

### Nur Code-Bereitstellung
Für schnelle Anwendungs-Updates:
```bash
# Alle Dienste bereitstellen
azd deploy

# Erwartete Ausgabe:
# Dienste werden bereitgestellt (azd deploy)
# - web: Wird bereitgestellt... Fertig
# - api: Wird bereitgestellt... Fertig
# ERFOLG: Ihre Bereitstellung wurde in 2 Minuten 15 Sekunden abgeschlossen

# Einen bestimmten Dienst bereitstellen
azd deploy --service web
azd deploy --service api

# Mit benutzerdefinierten Build-Argumenten bereitstellen
azd deploy --service api --build-arg NODE_ENV=production

# Bereitstellung überprüfen
azd show --output json | jq '.services'
```

### ✅ Bereitstellungsüberprüfung

Überprüfen Sie nach jeder Bereitstellung den Erfolg:

```bash
# Überprüfen, ob alle Dienste laufen
azd show

# Gesundheitsendpunkte testen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Auf Fehler überwachen (öffnet sich standardmäßig im Browser)
azd monitor --logs
```

**Erfolgskriterien:**
- ✅ Alle Dienste zeigen den Status "Running"
- ✅ Health-Endpunkte geben HTTP 200 zurück
- ✅ Keine Fehlerprotokolle in den letzten 5 Minuten
- ✅ Die Anwendung reagiert auf Testanfragen

## 🏗️ Verständnis des Bereitstellungsprozesses

### Neu bei Hooks? Hier anfangen

Ein **Hook** ist ein Befehl, den azd automatisch zu einem bestimmten Zeitpunkt im Bereitstellungsprozess ausführt — vor oder nach der Provisionierung und vor oder nach der Bereitstellung Ihres Codes. Hooks ermöglichen die Automatisierung kleiner Aufgaben, die immer mit einer Bereitstellung verbunden sind: Eine Datenbank befüllen, Migrationen ausführen, Assets bauen oder Smoke-Tests der Live-App durchführen.

| Hook | Wird ausgeführt… | Häufige Verwendung |
|------|------------------|--------------------|
| `preprovision` | Bevor Ressourcen erstellt werden | Voraussetzungen prüfen, bei einer Registry anmelden |
| `postprovision` | Nachdem Ressourcen vorhanden sind | Ressourcen konfigurieren, Datenbank einrichten |
| `predeploy` | Bevor Code bereitgestellt wird | Front-End-Assets bauen, Unit-Tests ausführen |
| `postdeploy` | Nachdem Code live ist | DB-Migrationen ausführen, Smoke-Test des Endpunkts |

Hooks befinden sich in Ihrer `azure.yaml`. Hier ist das kleinstmögliche Beispiel — es gibt nach der Bereitstellung einfach eine Nachricht aus:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Das ist alles — beim nächsten Ausführen von `azd up` wird die Nachricht automatisch ausgegeben. Sie können einen Hook auch allein ausführen, ohne eine vollständige Bereitstellung, was sich gut zum Testen eignet:

```bash
azd hooks run postdeploy
```

Die folgenden Phasen zeigen reale Hooks (Migrationen, Tests, Validierung) für jede Stufe.

### Phase 1: Hooks vor der Provisionierung
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

### Phase 2: Infrastruktur-Provisionierung
- Liest Infrastrukturvorlagen (Bicep/Terraform)
- Erstellt oder aktualisiert Azure-Ressourcen
- Konfiguriert Netzwerk und Sicherheit
- Richtet Monitoring und Logging ein

### Phase 3: Post-Provision-Hooks
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

### Phase 4: Anwendungs-Paketierung
- Baut Anwendungscode
- Erstellt Bereitstellungsartefakte
- Paketiert für die Zielplattform (Container, ZIP-Dateien, etc.)

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

### Phase 6: Anwendungs-Bereitstellung
- Stellt paketierte Anwendungen auf Azure-Services bereit
- Aktualisiert Konfigurationseinstellungen
- Startet/neustartet Dienste

### Phase 7: Post-Deploy-Hooks
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

### Umgang mit Hook-Fehlern

Standardmäßig gilt: **wenn ein Hook-Befehl mit einem Nicht-Null-Exit-Code beendet, stoppt azd die gesamte Operation.** Das ist normalerweise erwünscht — eine fehlgeschlagene Migration sollte die Bereitstellung stoppen und nicht eine defekte App ausliefern. Deshalb müssen Hooks sorgfältig geschrieben sein.

**1. Machen Sie Fehler laut und beabsichtigt.** Ein Hook gilt als fehlgeschlagen, wenn sein letzter Befehl einen Nicht-Null-Exit-Code zurückgibt. Fügen Sie in Shell-Skripten `set -e` hinzu, damit der Hook beim ersten fehlschlagenden Befehl stoppt, statt stillschweigend weiterzulaufen:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Einen Hook erlauben zu scheitern, ohne azd zu stoppen.** Für nicht-kritische Schritte (ein optionales Cache-Warmup, eine Benachrichtigung auf Best-Effort-Basis) setzen Sie `continueOnError: true`. azd protokolliert den Fehler, fährt aber fort:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Hooks isoliert testen, bevor Sie einen kompletten Lauf durchführen.** Sie müssen nicht `azd up` ausführen, um einen Hook zu debuggen — führen Sie ihn allein aus und iterieren Sie schnell:

```bash
azd hooks run predeploy          # führt nur den predeploy-Hook aus
azd hooks run postdeploy --service api
```

**4. Achten Sie auf betriebssystemspezifische Shells.** Ein Hook, der `shell: pwsh` verwendet, benötigt PowerShell auf der ausführenden Maschine (einschließlich CI-Agents). Verwenden Sie `shell: sh` für die größte Portabilität oder bieten Sie sowohl `windows`- als auch `posix`-Varianten an:

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

> **Debugging-Tipp:** Führen Sie jeden azd-Befehl mit `--debug` aus, um die exakte Hook-Kommandozeile und deren vollständige Ausgabe zu sehen — unschätzbar, wenn ein Hook lokal funktioniert, aber in CI scheitert.

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

## 🔧 Erweiterte Bereitstellungsszenarien

### Mehrere Dienste in einer Anwendung
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
# Erstelle die blaue Umgebung
azd env new production-blue
azd up --environment production-blue

# Teste die blaue Umgebung
./scripts/test-environment.sh production-blue

# Leite den Traffic auf die blaue Umgebung um (manuelles DNS/Load-Balancer-Update)
./scripts/switch-traffic.sh production-blue

# Bereinige die grüne Umgebung
azd env select production-green
azd down --force
```

### Canary-Deployments
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

### Gestaffelte Bereitstellungen
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

### Container App-Bereitstellungen
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

### Multi-Stage Dockerfile-Optimierung
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

### Dienstspezifische Bereitstellungen
```bash
# Einen bestimmten Dienst bereitstellen, um schneller zu iterieren
azd deploy --service web
azd deploy --service api

# Alle Dienste bereitstellen
azd deploy
```

### Build-Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Effiziente Code-Bereitstellungen
```bash
# Verwenden Sie azd deploy (nicht azd up) für reine Codeänderungen
# Dadurch wird die Bereitstellung der Infrastruktur übersprungen und es geht deutlich schneller
azd deploy

# Stellen Sie einen bestimmten Dienst bereit für die schnellste Iteration
azd deploy --service api
```

## 🔍 Bereitstellungsüberwachung

### Echtzeit-Bereitstellungsüberwachung
```bash
# Anwendung in Echtzeit überwachen
azd monitor --live

# Anwendungsprotokolle anzeigen
azd monitor --logs

# Bereitstellungsstatus prüfen
azd show
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

### Post-Deployment-Validierung
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Anwendungszustand prüfen
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

# Auf Geheimnisse in azure.yaml verweisen
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

### Identitäts- und Zugriffsverwaltung
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

## 🚨 Rückrollstrategien

### Schnelles Rollback
```bash
# AZD hat kein integriertes Rollback. Empfohlene Vorgehensweisen:

# Option 1: Erneute Bereitstellung aus Git (empfohlen)
git revert HEAD  # Problematischen Commit rückgängig machen
git push
azd deploy

# Option 2: Bestimmten Commit erneut bereitstellen
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktur-Rollback
```bash
# Infrastrukturänderungen vor dem Anwenden anzeigen
azd provision --preview

# Für das Zurücksetzen der Infrastruktur verwenden Sie die Versionskontrolle:
git revert HEAD  # Infrastrukturänderungen rückgängig machen
azd provision    # Vorherigen Infrastrukturzustand anwenden
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

### Verfolgen Sie die Bereitstellungsperformance
```bash
# Aktuellen Bereitstellungsstatus anzeigen
azd show

# Anwendung mit Application Insights überwachen
azd monitor --overview

# Live-Metriken anzeigen
azd monitor --live
```

### Erfassung benutzerdefinierter Metriken
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

### 1. Konsistenz der Umgebungen
```bash
# Verwende konsistente Namensgebung
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Umgebungsparität beibehalten
./scripts/sync-environments.sh
```

### 2. Infrastruktur-Validierung
```bash
# Änderungen an der Infrastruktur vor der Bereitstellung prüfen
azd provision --preview

# ARM/Bicep-Linting verwenden
az bicep lint --file infra/main.bicep

# Bicep-Syntax validieren
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
# Bereitstellungsverfahren dokumentieren
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nächste Schritte

- [Ressourcen bereitstellen](provisioning.md) - Vertiefung in Infrastrukturmanagement
- [Pre-Deployment-Planung](../chapter-06-pre-deployment/capacity-planning.md) - Planen Sie Ihre Bereitstellungsstrategie
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md) - Beheben Sie Bereitstellungsprobleme
- [Beste Praktiken](../chapter-07-troubleshooting/debugging.md) - Produktionsreife Bereitstellungsstrategien

## 🎯 Praktische Deployment-Übungen

### Übung 1: Inkrementeller Bereitstellungs-Workflow (20 Minuten)
**Ziel**: Den Unterschied zwischen vollständigen und inkrementellen Bereitstellungen beherrschen

```bash
# Erstbereitstellung
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zeit der Erstbereitstellung aufzeichnen
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
- [ ] Vollständige Bereitstellung dauert 5–15 Minuten
- [ ] Nur-Code-Bereitstellung dauert 2–5 Minuten
- [ ] Code-Änderungen sind in der bereitgestellten Anwendung sichtbar
- [ ] Infrastruktur bleibt nach `azd deploy` unverändert

**Lernergebnis**: `azd deploy` ist bei Code-Änderungen 50–70% schneller als `azd up`

### Übung 2: Benutzerdefinierte Bereitstellungs-Hooks (30 Minuten)
**Ziel**: Pre- und Post-Deployment-Automatisierung implementieren

```bash
# Erstelle Validierungsskript vor dem Deployment
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Prüfe, ob die Tests erfolgreich sind
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Prüfe auf nicht-kommittierte Änderungen
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Erstelle Smoke-Test nach dem Deployment
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

# Füge Hooks zu azure.yaml hinzu
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Teste die Bereitstellung mit Hooks
azd deploy
```

**Erfolgskriterien:**
- [ ] Pre-Deploy-Skript läuft vor der Bereitstellung
- [ ] Bereitstellung bricht ab, wenn Tests fehlschlagen
- [ ] Post-Deploy-Smoke-Test validiert die Gesundheit
- [ ] Hooks werden in der richtigen Reihenfolge ausgeführt

### Übung 3: Multi-Environment-Bereitstellungsstrategie (45 Minuten)
**Ziel**: Gestaffelten Bereitstellungs-Workflow implementieren (dev → staging → production)

```bash
# Bereitstellungsskript erstellen
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Schritt 1: In die Entwicklungsumgebung bereitstellen
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Schritt 2: In die Staging-Umgebung bereitstellen
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Schritt 3: Manuelle Genehmigung für die Produktion
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

# Umgebungen erstellen
azd env new dev
azd env new staging
azd env new production

# Gestufte Bereitstellung ausführen
./deploy-staged.sh
```

**Erfolgskriterien:**
- [ ] Dev-Umgebung wird erfolgreich bereitgestellt
- [ ] Staging-Umgebung wird erfolgreich bereitgestellt
- [ ] Manuelle Genehmigung für Produktion erforderlich
- [ ] Alle Umgebungen haben funktionierende Health-Checks
- [ ] Rollback ist möglich, falls erforderlich

### Übung 4: Rollback-Strategie (25 Minuten)
**Ziel**: Deployment-Rollback mit Git implementieren und testen

```bash
# v1 bereitstellen
azd env set APP_VERSION "1.0.0"
azd up

# v1-Commit-Hash speichern
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 mit nicht abwärtskompatibler Änderung bereitstellen
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Fehler erkennen und Rollback durchführen
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback mit Git
    git revert HEAD --no-edit
    
    # Umgebung zurückrollen
    azd env set APP_VERSION "1.0.0"
    
    # v1 erneut bereitstellen
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Erfolgskriterien:**
- [ ] Kann Bereitstellungsfehler erkennen
- [ ] Rollback-Skript läuft automatisch
- [ ] Anwendung kehrt in einen funktionsfähigen Zustand zurück
- [ ] Health-Checks bestehen nach dem Rollback

## 📊 Verfolgung von Bereitstellungsmetriken

### Verfolgen Sie die Performance Ihrer Bereitstellungen

```bash
# Skript für Bereitstellungsmetriken erstellen
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

# In Datei protokollieren
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Verwende es
./track-deployment.sh
```

**Analysieren Sie Ihre Metriken:**
```bash
# Bereitstellungsverlauf anzeigen
cat deployment-metrics.csv

# Durchschnittliche Bereitstellungszeit berechnen
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Zusätzliche Ressourcen

- [Azure Developer CLI Bereitstellungsreferenz](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Vorherige Lektion**: [Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **Nächste Lektion**: [Ressourcen bereitstellen](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->