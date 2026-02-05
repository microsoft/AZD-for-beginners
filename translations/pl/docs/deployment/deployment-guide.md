# Przewodnik wdrożeniowy - Opanowanie wdrożeń AZD

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 4 - Infrastruktura jako kod i wdrożenie
- **⬅️ Poprzedni rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)
- **➡️ Następny**: [Tworzenie zasobów](provisioning.md)
- **🚀 Następny rozdział**: [Rozdział 5: Rozwiązania AI z wieloma agentami](../../examples/retail-scenario.md)

## Wprowadzenie

Ten kompleksowy przewodnik obejmuje wszystko, co musisz wiedzieć o wdrażaniu aplikacji za pomocą Azure Developer CLI, od podstawowych wdrożeń za pomocą jednego polecenia po zaawansowane scenariusze produkcyjne z niestandardowymi hookami, wieloma środowiskami i integracją CI/CD. Opanuj pełny cykl życia wdrożeń dzięki praktycznym przykładom i najlepszym praktykom.

## Cele nauki

Po ukończeniu tego przewodnika:
- Opanujesz wszystkie polecenia i przepływy pracy wdrożeniowe Azure Developer CLI
- Zrozumiesz pełny cykl życia wdrożenia od tworzenia zasobów po monitorowanie
- Zaimplementujesz niestandardowe hooki wdrożeniowe dla automatyzacji przed i po wdrożeniu
- Skonfigurujesz wiele środowisk z parametrami specyficznymi dla środowiska
- Ustawisz zaawansowane strategie wdrożeniowe, w tym wdrożenia blue-green i canary
- Zintegrujesz wdrożenia azd z pipeline'ami CI/CD i przepływami pracy DevOps

## Efekty nauki

Po ukończeniu będziesz w stanie:
- Samodzielnie wykonywać i rozwiązywać problemy z wszystkimi przepływami pracy wdrożeniowymi azd
- Projektować i wdrażać niestandardową automatyzację wdrożeniową za pomocą hooków
- Konfigurować wdrożenia gotowe do produkcji z odpowiednim zabezpieczeniem i monitorowaniem
- Zarządzać złożonymi scenariuszami wdrożeniowymi w wielu środowiskach
- Optymalizować wydajność wdrożeń i wdrażać strategie wycofywania
- Zintegrować wdrożenia azd z praktykami DevOps w przedsiębiorstwie

## Przegląd wdrożeń

Azure Developer CLI oferuje kilka poleceń wdrożeniowych:
- `azd up` - Kompletny przepływ pracy (tworzenie zasobów + wdrożenie)
- `azd provision` - Tworzenie/aktualizacja tylko zasobów Azure
- `azd deploy` - Wdrożenie tylko kodu aplikacji
- `azd package` - Budowanie i pakowanie aplikacji

## Podstawowe przepływy pracy wdrożeniowej

### Kompleksowe wdrożenie (azd up)
Najczęstszy przepływ pracy dla nowych projektów:
```bash
# Wdróż wszystko od zera
azd up

# Wdróż z określonym środowiskiem
azd up --environment production

# Wdróż z niestandardowymi parametrami
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Wdrożenie tylko infrastruktury
Gdy potrzebujesz zaktualizować tylko zasoby Azure:
```bash
# Przygotowanie/aktualizacja infrastruktury
azd provision

# Przygotowanie z dry-run, aby podglądnąć zmiany
azd provision --preview

# Przygotowanie określonych usług
azd provision --service database
```

### Wdrożenie tylko kodu
Dla szybkich aktualizacji aplikacji:
```bash
# Wdróż wszystkie usługi
azd deploy

# Oczekiwany wynik:
# Wdrażanie usług (azd deploy)
# - web: Wdrażanie... Zakończono
# - api: Wdrażanie... Zakończono
# SUKCES: Twoje wdrożenie zakończyło się w 2 minuty 15 sekund

# Wdróż konkretną usługę
azd deploy --service web
azd deploy --service api

# Wdróż z niestandardowymi argumentami budowania
azd deploy --service api --build-arg NODE_ENV=production

# Zweryfikuj wdrożenie
azd show --output json | jq '.services'
```

### ✅ Weryfikacja wdrożenia

Po każdym wdrożeniu zweryfikuj sukces:

```bash
# Sprawdź, czy wszystkie usługi działają
azd show

# Przetestuj punkty końcowe zdrowia
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Sprawdź logi pod kątem błędów
azd logs --service api --since 5m | grep -i error
```

**Kryteria sukcesu:**
- ✅ Wszystkie usługi mają status "Running"
- ✅ Punkty końcowe zdrowia zwracają HTTP 200
- ✅ Brak błędów w logach z ostatnich 5 minut
- ✅ Aplikacja odpowiada na żądania testowe

## 🏗️ Zrozumienie procesu wdrożenia

### Faza 1: Hooki przed tworzeniem zasobów
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

### Faza 2: Tworzenie infrastruktury
- Odczytuje szablony infrastruktury (Bicep/Terraform)
- Tworzy lub aktualizuje zasoby Azure
- Konfiguruje sieci i zabezpieczenia
- Ustawia monitorowanie i logowanie

### Faza 3: Hooki po tworzeniu zasobów
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

### Faza 4: Pakowanie aplikacji
- Buduje kod aplikacji
- Tworzy artefakty wdrożeniowe
- Pakuje na docelową platformę (kontenery, pliki ZIP itp.)

### Faza 5: Hooki przed wdrożeniem
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

### Faza 6: Wdrożenie aplikacji
- Wdraża zapakowane aplikacje do usług Azure
- Aktualizuje ustawienia konfiguracji
- Uruchamia/ponownie uruchamia usługi

### Faza 7: Hooki po wdrożeniu
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

## 🎛️ Konfiguracja wdrożenia

### Ustawienia wdrożeniowe specyficzne dla usług
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

### Konfiguracje specyficzne dla środowiska
```bash
# Środowisko deweloperskie
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Środowisko testowe
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Środowisko produkcyjne
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Zaawansowane scenariusze wdrożeniowe

### Aplikacje wielousługowe
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

### Wdrożenia blue-green
```bash
# Utwórz niebieskie środowisko
azd env new production-blue
azd up --environment production-blue

# Przetestuj niebieskie środowisko
./scripts/test-environment.sh production-blue

# Przełącz ruch na niebieskie (ręczna aktualizacja DNS/load balancera)
./scripts/switch-traffic.sh production-blue

# Wyczyść zielone środowisko
azd env select production-green
azd down --force
```

### Wdrożenia canary
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

### Wdrożenia etapowe
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

## 🐳 Wdrożenia kontenerowe

### Wdrożenia aplikacji kontenerowych
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

### Optymalizacja wieloetapowego Dockerfile
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

## ⚡ Optymalizacja wydajności

### Wdrożenia równoległe
```bash
# Skonfiguruj równoległe wdrażanie
azd config set deploy.parallelism 5

# Wdrażaj usługi równolegle
azd deploy --parallel
```

### Cache budowania
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

### Wdrożenia przyrostowe
```bash
# Wdrażaj tylko zmienione usługi
azd deploy --incremental

# Wdrażaj z wykrywaniem zmian
azd deploy --detect-changes
```

## 🔍 Monitorowanie wdrożeń

### Monitorowanie wdrożeń w czasie rzeczywistym
```bash
# Monitoruj postęp wdrażania
azd deploy --follow

# Wyświetl dzienniki wdrażania
azd logs --follow --service api

# Sprawdź status wdrażania
azd show --service api
```

### Kontrole zdrowia
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

### Walidacja po wdrożeniu
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Sprawdź stan zdrowia aplikacji
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

## 🔐 Rozważania dotyczące bezpieczeństwa

### Zarządzanie sekretami
```bash
# Przechowuj tajemnice bezpiecznie
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Odwołuj się do tajemnic w azure.yaml
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

### Bezpieczeństwo sieci
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Zarządzanie tożsamością i dostępem
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

## 🚨 Strategie wycofywania

### Szybkie wycofywanie
```bash
# Wycofanie do poprzedniego wdrożenia
azd deploy --rollback

# Wycofanie konkretnej usługi
azd deploy --service api --rollback

# Wycofanie do konkretnej wersji
azd deploy --service api --version v1.2.3
```

### Wycofywanie infrastruktury
```bash
# Wycofaj zmiany w infrastrukturze
azd provision --rollback

# Podgląd zmian wycofania
azd provision --rollback --preview
```

### Wycofywanie migracji bazy danych
```bash
#!/bin/bash
# skrypty/wycofaj-bazę-danych.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metryki wdrożeniowe

### Śledzenie wydajności wdrożenia
```bash
# Włącz metryki wdrożenia
azd config set telemetry.deployment.enabled true

# Wyświetl historię wdrożeń
azd history

# Pobierz statystyki wdrożenia
azd metrics --type deployment
```

### Zbieranie niestandardowych metryk
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

## 🎯 Najlepsze praktyki

### 1. Spójność środowiska
```bash
# Używaj spójnych nazw
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Utrzymuj zgodność środowiska
./scripts/sync-environments.sh
```

### 2. Walidacja infrastruktury
```bash
# Zweryfikuj przed wdrożeniem
azd provision --preview
azd provision --what-if

# Użyj lintingu ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Testowanie integracji
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

### 4. Dokumentacja i logowanie
```bash
# Udokumentuj procedury wdrażania
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kolejne kroki

- [Tworzenie zasobów](provisioning.md) - Szczegółowe zarządzanie infrastrukturą
- [Planowanie przed wdrożeniem](../pre-deployment/capacity-planning.md) - Zaplanuj swoją strategię wdrożeniową
- [Typowe problemy](../troubleshooting/common-issues.md) - Rozwiązywanie problemów z wdrożeniem
- [Najlepsze praktyki](../troubleshooting/debugging.md) - Strategie wdrożeniowe gotowe do produkcji

## 🎯 Ćwiczenia praktyczne dotyczące wdrożeń

### Ćwiczenie 1: Przepływ pracy wdrożenia przyrostowego (20 minut)
**Cel**: Opanuj różnicę między pełnymi a przyrostowymi wdrożeniami

```bash
# Początkowe wdrożenie
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zarejestruj czas początkowego wdrożenia
echo "Full deployment: $(date)" > deployment-log.txt

# Wprowadź zmianę w kodzie
echo "// Updated $(date)" >> src/api/src/server.js

# Wdróż tylko kod (szybko)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Porównaj czasy
cat deployment-log.txt

# Posprzątaj
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Pełne wdrożenie trwa 5-15 minut
- [ ] Wdrożenie tylko kodu trwa 2-5 minut
- [ ] Zmiany w kodzie widoczne w wdrożonej aplikacji
- [ ] Infrastruktura niezmieniona po `azd deploy`

**Efekt nauki**: `azd deploy` jest 50-70% szybsze niż `azd up` dla zmian w kodzie

### Ćwiczenie 2: Niestandardowe hooki wdrożeniowe (30 minut)
**Cel**: Zaimplementuj automatyzację przed i po wdrożeniu

```bash
# Utwórz skrypt walidacji przed wdrożeniem
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Sprawdź, czy testy przechodzą
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Sprawdź, czy nie ma niezatwierdzonych zmian
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Utwórz test dymny po wdrożeniu
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

# Dodaj hooki do azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Przetestuj wdrożenie z hookami
azd deploy
```

**Kryteria sukcesu:**
- [ ] Skrypt przed wdrożeniem uruchamia się przed wdrożeniem
- [ ] Wdrożenie zostaje przerwane, jeśli testy się nie powiodą
- [ ] Testy dymne po wdrożeniu weryfikują zdrowie
- [ ] Hooki wykonują się w odpowiedniej kolejności

### Ćwiczenie 3: Strategia wdrożenia w wielu środowiskach (45 minut)
**Cel**: Zaimplementuj etapowy przepływ pracy wdrożeniowego (dev → staging → produkcja)

```bash
# Utwórz skrypt wdrożeniowy
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Krok 1: Wdrożenie na dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 2: Wdrożenie na staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Ręczna akceptacja dla produkcji
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

# Utwórz środowiska
azd env new dev
azd env new staging
azd env new production

# Uruchom wdrożenie etapowe
./deploy-staged.sh
```

**Kryteria sukcesu:**
- [ ] Środowisko dev wdraża się pomyślnie
- [ ] Środowisko staging wdraża się pomyślnie
- [ ] Wymagana ręczna akceptacja dla produkcji
- [ ] Wszystkie środowiska mają działające kontrole zdrowia
- [ ] Możliwość wycofania w razie potrzeby

### Ćwiczenie 4: Strategia wycofywania (25 minut)
**Cel**: Zaimplementuj i przetestuj wycofywanie wdrożenia

```bash
# Wdrażanie v1
azd env set APP_VERSION "1.0.0"
azd up

# Zapisz konfigurację v1
cp -r .azure/production .azure/production-v1-backup

# Wdrażanie v2 z przełomową zmianą
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Wykryj awarię
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Wycofaj kod
    git checkout src/api/src/server.js
    
    # Wycofaj środowisko
    azd env set APP_VERSION "1.0.0"
    
    # Ponowne wdrażanie v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kryteria sukcesu:**
- [ ] Możliwość wykrycia niepowodzeń wdrożenia
- [ ] Skrypt wycofywania uruchamia się automatycznie
- [ ] Aplikacja wraca do działającego stanu
- [ ] Kontrole zdrowia przechodzą po wycofaniu

## 📊 Śledzenie metryk wdrożeniowych

### Śledź wydajność swojego wdrożenia

```bash
# Utwórz skrypt metryk wdrożenia
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

# Zaloguj do pliku
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Użyj tego
./track-deployment.sh
```

**Analizuj swoje metryki:**
```bash
# Wyświetl historię wdrożeń
cat deployment-metrics.csv

# Oblicz średni czas wdrożenia
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatkowe zasoby

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Nawigacja**
- **Poprzednia lekcja**: [Twój pierwszy projekt](../getting-started/first-project.md)
- **Następna lekcja**: [Tworzenie zasobów](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->