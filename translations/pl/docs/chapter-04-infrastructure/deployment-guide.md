# Przewodnik wdrażania - Opanowanie wdrożeń AZD

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD For Beginners](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 4 - Infrastructure as Code & Deployment
- **⬅️ Poprzedni rozdział**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Następny**: [Provisioning Resources](provisioning.md)
- **🚀 Następny rozdział**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Wprowadzenie

Ten## Zrozumienie procesu wdrażaniakompletny przewodnik obejmuje wszystko, co musisz wiedzieć o wdrażaniu aplikacji przy użyciu Azure Developer CLI, od podstawowych wdrożeń jednopoleceniowych po zaawansowane scenariusze produkcyjne z niestandardowymi hookami, wieloma środowiskami i integracją CI/CD. Opanuj pełny cykl życia wdrożenia za pomocą praktycznych przykładów i najlepszych praktyk.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Opanujesz wszystkie polecenia i procesy wdrażania Azure Developer CLI
- Zrozumiesz pełny cykl życia wdrożenia od prowizjonowania po monitorowanie
- Wdrożysz niestandardowe hooki wdrożeniowe do automatyzacji przed- i po-wdrożeniowej
- Skonfigurujesz wiele środowisk z parametrami specyficznymi dla środowiska
- Skonfigurujesz zaawansowane strategie wdrożeń, w tym blue-green i canary
- Zintegrowasz wdrożenia azd z pipeline’ami CI/CD i praktykami DevOps

## Efekty nauczania

Po ukończeniu będziesz w stanie:
- Wykonywać i rozwiązywać problemy ze wszystkimi przebiegami wdrożeń azd niezależnie
- Projektować i wdrażać niestandardową automatyzację wdrożeń za pomocą hooków
- Konfigurować wdrożenia gotowe do produkcji z odpowiednim zabezpieczeniem i monitorowaniem
- Zarządzać złożonymi scenariuszami wdrożeń wielośrodowiskowych
- Optymalizować wydajność wdrożeń i wdrażać strategie wycofania
- Integrować wdrożenia azd z praktykami DevOps w przedsiębiorstwie

## Przegląd wdrożeń

Azure Developer CLI udostępnia kilka poleceń związanych z wdrożeniem:
- `azd up` - Pełny przebieg (prowizjonowanie + wdrożenie)
- `azd provision` - Tworzy/aktualizuje tylko zasoby Azure
- `azd deploy` - Wdraża tylko kod aplikacji
- `azd package` - Buduje i pakuje aplikacje

## Podstawowe procesy wdrażania

### Pełne wdrożenie (azd up)
The most common workflow for new projects:
```bash
# Wdróż wszystko od podstaw
azd up

# Wdróż dla konkretnego środowiska
azd up --environment production

# Wdróż z niestandardowymi parametrami
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Wdrażanie tylko infrastruktury
When you only need to update Azure resources:
```bash
# Prowizjonowanie/aktualizacja infrastruktury
azd provision

# Prowizjonowanie z symulacją (dry-run) w celu podglądu zmian
azd provision --preview

# Prowizjonowanie konkretnych usług
azd provision --service database
```

### Wdrażanie tylko kodu
For quick application updates:
```bash
# Wdróż wszystkie usługi
azd deploy

# Oczekiwany wynik:
# Wdrażanie usług (azd deploy)
# - web: Wdrażanie... Gotowe
# - api: Wdrażanie... Gotowe
# SUKCES: Twoje wdrożenie zakończyło się po 2 minutach i 15 sekundach

# Wdróż konkretną usługę
azd deploy --service web
azd deploy --service api

# Wdróż z niestandardowymi argumentami kompilacji
azd deploy --service api --build-arg NODE_ENV=production

# Zweryfikuj wdrożenie
azd show --output json | jq '.services'
```

### ✅ Weryfikacja wdrożenia

After any deployment, verify success:

```bash
# Sprawdź, czy wszystkie usługi działają
azd show

# Przetestuj endpointy health
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitoruj błędy (domyślnie otwiera się w przeglądarce)
azd monitor --logs
```

**Kryteria sukcesu:**
- ✅ Wszystkie usługi mają status "Running"
- ✅ Punkty zdrowia (health endpoints) zwracają HTTP 200
- ✅ Brak logów z błędami w ciągu ostatnich 5 minut
- ✅ Aplikacja odpowiada na testowe żądania

## 🏗️ Zrozumienie procesu wdrażania

### Faza 1: Hooki przed prowizjonowaniem
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

### Faza 2: Prowizjonowanie infrastruktury
- Odczytuje szablony infrastruktury (Bicep/Terraform)
- Tworzy lub aktualizuje zasoby Azure
- Konfiguruje sieć i zabezpieczenia
- Ustawia monitorowanie i logowanie

### Faza 3: Hooki po prowizjonowaniu
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
- Pakuje dla docelowej platformy (kontenery, pliki ZIP itp.)

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

### Faza 6: Wdrażanie aplikacji
- Wdraża spakowane aplikacje do usług Azure
- Aktualizuje ustawienia konfiguracyjne
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

## 🎛️ Konfiguracja wdrożeń

### Ustawienia wdrożenia specyficzne dla usługi
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

## 🔧 Zaawansowane scenariusze wdrożeń

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

# Przekieruj ruch na niebieskie (ręczna aktualizacja DNS/load balancera)
./scripts/switch-traffic.sh production-blue

# Usuń zielone środowisko
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

### Wdrażania etapowe
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

## 🐳 Wdrażania kontenerów

### Wdrażanie aplikacji kontenerowych
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

### Wdrażania specyficzne dla usług
```bash
# Wdróż określoną usługę, aby przyspieszyć iterację
azd deploy --service web
azd deploy --service api

# Wdróż wszystkie usługi
azd deploy
```

### Buforowanie buildów
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efektywne wdrożenia kodu
```bash
# Użyj azd deploy (nie azd up) dla zmian dotyczących wyłącznie kodu
# To pomija tworzenie zasobów infrastruktury i jest znacznie szybsze
azd deploy

# Wdróż konkretną usługę dla najszybszej iteracji
azd deploy --service api
```

## 🔍 Monitorowanie wdrożeń

### Monitorowanie wdrożeń w czasie rzeczywistym
```bash
# Monitoruj aplikację w czasie rzeczywistym
azd monitor --live

# Wyświetl logi aplikacji
azd monitor --logs

# Sprawdź status wdrożenia
azd show
```

### Kontrole stanu
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

# Sprawdź stan aplikacji
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

## 🔐 Zagadnienia bezpieczeństwa

### Zarządzanie sekretami
```bash
# Przechowuj sekrety bezpiecznie
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Odwołuj się do sekretów w pliku azure.yaml
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

## 🚨 Strategie wycofania (rollback)

### Szybkie wycofanie
```bash
# AZD nie ma wbudowanego mechanizmu wycofywania. Zalecane podejścia:

# Opcja 1: Ponowne wdrożenie z Git (zalecane)
git revert HEAD  # Cofnij problematyczne zatwierdzenie
git push
azd deploy

# Opcja 2: Ponowne wdrożenie konkretnego zatwierdzenia
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Wycofanie infrastruktury
```bash
# Podejrzyj zmiany w infrastrukturze przed zastosowaniem
azd provision --preview

# Aby cofnąć zmiany infrastruktury, użyj kontroli wersji:
git revert HEAD  # Cofnij zmiany w infrastrukturze
azd provision    # Zastosuj poprzedni stan infrastruktury
```

### Wycofanie migracji bazy danych
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metryki wdrożeń

### Śledź wydajność wdrożeń
```bash
# Wyświetl bieżący status wdrożenia
azd show

# Monitoruj aplikację za pomocą Application Insights
azd monitor --overview

# Wyświetl metryki na żywo
azd monitor --live
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

### 1. Spójność środowisk
```bash
# Używaj spójnych nazw
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Utrzymuj zgodność środowisk
./scripts/sync-environments.sh
```

### 2. Walidacja infrastruktury
```bash
# Podejrzyj zmiany w infrastrukturze przed wdrożeniem
azd provision --preview

# Użyj lintingu ARM/Bicep
az bicep lint --file infra/main.bicep

# Zweryfikuj składnię Bicep
az bicep build --file infra/main.bicep
```

### 3. Integracja testowania
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

- [Prowizjonowanie zasobów](provisioning.md) - Dogłębne omówienie zarządzania infrastrukturą
- [Planowanie przed wdrożeniem](../chapter-06-pre-deployment/capacity-planning.md) - Zaplanuj strategię wdrożenia
- [Częste problemy](../chapter-07-troubleshooting/common-issues.md) - Rozwiązywanie problemów z wdrożeniami
- [Najlepsze praktyki](../chapter-07-troubleshooting/debugging.md) - Strategie wdrożeń gotowych do produkcji

## 🎯 Praktyczne ćwiczenia wdrożeniowe

### Ćwiczenie 1: Przebieg wdrożenia przyrostowego (20 minut)
**Cel**: Opanować różnicę między pełnymi a przyrostowymi wdrożeniami

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
- [ ] Pełne wdrożenie zajmuje 5–15 minut
- [ ] Wdrażanie tylko kodu zajmuje 2–5 minut
- [ ] Zmiany w kodzie są widoczne w wdrożonej aplikacji
- [ ] Infrastruktura nie zmienia się po `azd deploy`

**Wynik nauki**: `azd deploy` jest o 50–70% szybszy niż `azd up` dla zmian w kodzie

### Ćwiczenie 2: Własne hooki wdrożeniowe (30 minut)
**Cel**: Wdrożyć automatyzację przed- i po-wdrożeniową

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

# Sprawdź, czy są niezatwierdzone zmiany
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
- [ ] Skrypt przed-wdrożeniowy uruchamia się przed wdrożeniem
- [ ] Wdrożenie przerywa się, jeśli testy nie przejdą
- [ ] Post-deploy smoke test weryfikuje stan zdrowia
- [ ] Hooki wykonują się w poprawnej kolejności

### Ćwiczenie 3: Strategia wdrożeń wielośrodowiskowych (45 minut)
**Cel**: Wdrożyć etapowy przepływ wdrożeń (dev → staging → production)

```bash
# Utwórz skrypt wdrożeniowy
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Krok 1: Wdróż do środowiska deweloperskiego
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 2: Wdróż do środowiska staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Ręczne zatwierdzenie przed wdrożeniem na produkcję
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

# Uruchom etapowe wdrożenie
./deploy-staged.sh
```

**Kryteria sukcesu:**
- [ ] Środowisko dev wdraża się pomyślnie
- [ ] Środowisko staging wdraża się pomyślnie
- [ ] Wymagana jest ręczna akceptacja dla produkcji
- [ ] Wszystkie środowiska mają działające kontrole stanu
- [ ] Możliwość wycofania w razie potrzeby

### Ćwiczenie 4: Strategia wycofania (25 minut)
**Cel**: Wdrożyć i przetestować wycofanie wdrożenia przy użyciu Git

```bash
# Wdróż v1
azd env set APP_VERSION "1.0.0"
azd up

# Zapisz hash commita v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Wdróż v2 ze zmianą łamiącą zgodność wsteczną
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Wykryj awarię i cofnij zmiany
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Cofnięcie przy użyciu Git
    git revert HEAD --no-edit
    
    # Przywrócenie środowiska
    azd env set APP_VERSION "1.0.0"
    
    # Wdróż ponownie v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kryteria sukcesu:**
- [ ] Potrafi wykryć awarie wdrożeń
- [ ] Skrypt wycofania uruchamia się automatycznie
- [ ] Aplikacja powraca do działającego stanu
- [ ] Kontrole stanu przechodzą po wycofaniu

## 📊 Śledzenie metryk wdrożeń

### Śledź wydajność swoich wdrożeń

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

# Zapisz do pliku
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

- [Referencja wdrożeń Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Wdrażanie Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Wdrażanie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Wdrażanie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Nawigacja**
- **Poprzednia lekcja**: [Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **Następna lekcja**: [Prowizjonowanie zasobów](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczenia AI Co-op Translator (https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby zapewnić poprawność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym należy uznać za wersję wiążącą. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->