# Przewodnik po wdrożeniu - Opanowanie wdrożeń AZD

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 4 - Infrastruktura jako kod & Wdrożenie
- **⬅️ Poprzedni rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)
- **➡️ Następny**: [Provisioning Resources](provisioning.md)
- **🚀 Następny rozdział**: [Rozdział 5: Rozwiązania AI z wieloma agentami](../../examples/retail-scenario.md)

## Wprowadzenie

Ten kompleksowy przewodnik obejmuje wszystko, co musisz wiedzieć o wdrażaniu aplikacji za pomocą Azure Developer CLI, od podstawowych wdrożeń jednopoleceniowych po zaawansowane scenariusze produkcyjne z niestandardowymi hookami, wieloma środowiskami i integracją CI/CD. Opanuj pełny cykl życia wdrożenia dzięki praktycznym przykładom i najlepszym praktykom.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Opanowany wszystkie polecenia i przepływy pracy wdrożeń Azure Developer CLI
- Rozumiał pełny cykl życia wdrożenia od provisioning do monitoringu
- Implementował niestandardowe hooki wdrożeniowe dla automatyzacji przed i po wdrożeniu
- Konfigurował wiele środowisk z parametrami specyficznymi dla środowiska
- Ustawił zaawansowane strategie wdrożeń, w tym blue-green i canary deployments
- Integrovał wdrożenia azd z pipeline’ami CI/CD i workflow DevOps

## Rezultaty nauki

Po ukończeniu będziesz w stanie:
- Samodzielnie wykonywać i rozwiązywać problemy ze wszystkimi przepływami pracy wdrożeń azd
- Projektować i implementować niestandardową automatyzację wdrożeń z użyciem hooków
- Konfigurować produkcyjne wdrożenia z odpowiednim zabezpieczeniem i monitoringiem
- Zarządzać złożonymi scenariuszami wdrożeń w wielu środowiskach
- Optymalizować wydajność wdrożeń i wdrażać strategie rollbacku
- Włączać wdrożenia azd do praktyk DevOps w przedsiębiorstwie

## Przegląd wdrożenia

Azure Developer CLI udostępnia kilka poleceń wdrożeń:
- `azd up` - Kompletny przepływ pracy (provision + deploy)
- `azd provision` - Tworzenie/aktualizacja zasobów Azure tylko
- `azd deploy` - Wdrażanie tylko kodu aplikacji
- `azd package` - Budowanie i pakowanie aplikacji

## Podstawowe przepływy pracy wdrożenia

### Kompletny proces wdrożenia (azd up)
Najczęstszy przepływ pracy dla nowych projektów:
```bash
# Wdróż wszystko od podstaw
azd up

# Wdróż ze specyficznym środowiskiem
azd up --environment production

# Wdróż z niestandardowymi parametrami
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Wdrożenie tylko infrastruktury
Gdy potrzebujesz tylko zaktualizować zasoby Azure:
```bash
# Zapewnienie/aktualizacja infrastruktury
azd provision

# Zapewnienie z symulacją, aby podejrzeć zmiany
azd provision --preview

# Zapewnienie określonych usług
azd provision --service database
```

### Wdrożenie tylko kodu
Do szybkich aktualizacji aplikacji:
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

# Testuj punkty końcowe zdrowia
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitoruj błędy (domyślnie otwiera się w przeglądarce)
azd monitor --logs
```

**Kryteria sukcesu:**
- ✅ Wszystkie usługi pokazują status "Running"
- ✅ Punkty zdrowia zwracają HTTP 200
- ✅ Brak błędów w logach w ciągu ostatnich 5 minut
- ✅ Aplikacja odpowiada na testowe zapytania

## 🏗️ Zrozumienie procesu wdrożenia

### Faza 1: Hooki przed provisioningiem
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

### Faza 2: Provisioning infrastruktury
- Odczytuje szablony infrastruktury (Bicep/Terraform)
- Tworzy lub aktualizuje zasoby Azure
- Konfiguruje sieć i zabezpieczenia
- Ustawia monitoring i logowanie

### Faza 3: Hooki po provisioningu
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
- Pakuje dla docelowej platformy (kontenery, pliki ZIP itd.)

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
- Wdraża spakowane aplikacje do usług Azure
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

### Ustawienia wdrożenia specyficzne dla usług
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

### Konfiguracje specyficzne dla środowisk
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

## 🐳 Wdrożenia kontenerów

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

### Wdrożenia specyficzne dla usług
```bash
# Wdróż konkretną usługę dla szybszej iteracji
azd deploy --service web
azd deploy --service api

# Wdróż wszystkie usługi
azd deploy
```

### Buforowanie budowania
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
# Użyj azd deploy (nie azd up) dla zmian dotyczących tylko kodu
# To pomija provisionowanie infrastruktury i jest znacznie szybsze
azd deploy

# Wdróż konkretną usługę dla najszybszej iteracji
azd deploy --service api
```

## 🔍 Monitoring wdrożeń

### Monitoring wdrożeń w czasie rzeczywistym
```bash
# Monitoruj aplikację w czasie rzeczywistym
azd monitor --live

# Przeglądaj logi aplikacji
azd monitor --logs

# Sprawdź status wdrożenia
azd show
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

## 🔐 Aspekty bezpieczeństwa

### Zarządzanie sekretami
```bash
# Przechowuj sekrety bezpiecznie
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Odwołuj się do sekretów w azure.yaml
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

## 🚨 Strategie rollbacku

### Szybki rollback
```bash
# AZD nie ma wbudowanego mechanizmu wycofywania. Zalecane podejścia:

# Opcja 1: Ponowne wdrożenie z Gita (zalecane)
git revert HEAD  # Cofnij problematyczny commit
git push
azd deploy

# Opcja 2: Ponowne wdrożenie konkretnego commita
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback infrastruktury
```bash
# Podejrzyj zmiany infrastruktury przed zastosowaniem
azd provision --preview

# Do wycofania infrastruktury użyj kontroli wersji:
git revert HEAD  # Cofnij zmiany w infrastrukturze
azd provision    # Zastosuj poprzedni stan infrastruktury
```

### Rollback migracji bazy danych
```bash
#!/bin/bash
# skrypty/przywracanie-bazy-danych.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metryki wdrożeń

### Śledzenie wydajności wdrożeń
```bash
# Wyświetl aktualny status wdrożenia
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

### 1. Spójność środowiska
```bash
# Używaj spójnych nazw
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Zachowaj zgodność środowiskową
./scripts/sync-environments.sh
```

### 2. Walidacja infrastruktury
```bash
# Podejrzyj zmiany infrastruktury przed wdrożeniem
azd provision --preview

# Użyj lintingu ARM/Bicep
az bicep lint --file infra/main.bicep

# Sprawdź składnię Bicep
az bicep build --file infra/main.bicep
```

### 3. Integracja testów
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
# Dokumentuj procedury wdrażania
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kolejne kroki

- [Provisioning Resources](provisioning.md) - Dogłębne zarządzanie infrastrukturą
- [Planowanie przed wdrożeniem](../chapter-06-pre-deployment/capacity-planning.md) - Zaplanuj swoją strategię wdrożenia
- [Typowe problemy](../chapter-07-troubleshooting/common-issues.md) - Rozwiązywanie problemów z wdrożeniem
- [Najlepsze praktyki](../chapter-07-troubleshooting/debugging.md) - Strategie wdrożeń gotowych do produkcji

## 🎯 Ćwiczenia praktyczne z wdrożeń

### Ćwiczenie 1: Przepływ pracy wdrożenia przyrostowego (20 minut)
**Cel**: Opanuj różnicę między pełnym a przyrostowym wdrożeniem

```bash
# Pierwotne wdrożenie
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Zarejestruj czas pierwotnego wdrożenia
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
- [ ] Pełne wdrożenie zajmuje 5-15 minut
- [ ] Wdrożenie tylko kodu zajmuje 2-5 minut
- [ ] Zmiany w kodzie są widoczne w wdrożonej aplikacji
- [ ] Infrastruktura niezmieniona po `azd deploy`

**Rezultat nauki**: `azd deploy` jest 50-70% szybsze niż `azd up` przy zmianach w kodzie

### Ćwiczenie 2: Niestandardowe hooki wdrożeń (30 minut)
**Cel**: Implementuj automatyzację przed i po wdrożeniu

```bash
# Utwórz skrypt walidacji przed wdrożeniem
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Sprawdź, czy testy przechodzą pomyślnie
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Sprawdź niezatwierdzone zmiany
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Utwórz test wstępny po wdrożeniu
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
- [ ] Skrypt przed wdrożeniem działa przed wdrożeniem
- [ ] Wdrożenie przerywa się jeśli testy nie przejdą
- [ ] Test dymny po wdrożeniu weryfikuje zdrowie
- [ ] Hooki wykonują się w prawidłowej kolejności

### Ćwiczenie 3: Strategia wdrożenia dla wielu środowisk (45 minut)
**Cel**: Wdrażaj etapowo (dev → staging → produkcja)

```bash
# Utwórz skrypt wdrożeniowy
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Krok 1: Wdróż na środowisko deweloperskie
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 2: Wdróż na środowisko testowe
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Krok 3: Ręczne zatwierdzenie do produkcji
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
- [ ] Środowisko dev wdrożone pomyślnie
- [ ] Środowisko staging wdrożone pomyślnie
- [ ] Wymagana ręczna akceptacja dla produkcji
- [ ] Wszystkie środowiska mają działające kontrole zdrowia
- [ ] Możliwość wycofania zmian jeśli zajdzie potrzeba

### Ćwiczenie 4: Strategia rollbacku (25 minut)
**Cel**: Implementuj i przetestuj rollback wdrożenia przy użyciu Git

```bash
# Wdróż wersję 1
azd env set APP_VERSION "1.0.0"
azd up

# Zapisz hash commita wersji 1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Wdróż wersję 2 z wprowadzającą zmiany łamiące kompatybilność
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Wykryj błąd i wycofaj zmiany
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Wycofaj zmiany przy użyciu gita
    git revert HEAD --no-edit
    
    # Wycofaj środowisko
    azd env set APP_VERSION "1.0.0"
    
    # Ponownie wdroż wersję 1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kryteria sukcesu:**
- [ ] Potrafi wykryć niepowodzenia wdrożenia
- [ ] Skrypt rollbacku wykonuje się automatycznie
- [ ] Aplikacja wraca do działania
- [ ] Kontrole zdrowia przechodzą po rollbacku

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Loguj do pliku
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Użyj tego
./track-deployment.sh
```

**Analizuj metryki:**
```bash
# Wyświetl historię wdrożeń
cat deployment-metrics.csv

# Oblicz średni czas wdrożenia
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatkowe zasoby

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Wdrożenie Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Wdrożenie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Wdrożenie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Nawigacja**
- **Poprzednia lekcja**: [Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **Następna lekcja**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Dokument ten został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było precyzyjne, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uważany za wiarygodne źródło. W przypadku ważnych informacji zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia niniejszego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->