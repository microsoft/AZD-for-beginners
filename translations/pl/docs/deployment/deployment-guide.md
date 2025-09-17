<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T16:42:07+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "pl"
}
-->
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

Po ukończeniu tego przewodnika będziesz:
- Znać wszystkie polecenia i przepływy pracy wdrożeniowe Azure Developer CLI
- Rozumieć pełny cykl życia wdrożenia, od tworzenia zasobów po monitorowanie
- Implementować niestandardowe hooki wdrożeniowe dla automatyzacji przed i po wdrożeniu
- Konfigurować wiele środowisk z parametrami specyficznymi dla środowiska
- Ustawiać zaawansowane strategie wdrożeniowe, takie jak blue-green i canary deployments
- Integracja wdrożeń azd z pipeline'ami CI/CD i procesami DevOps

## Efekty nauki

Po ukończeniu będziesz w stanie:
- Samodzielnie wykonywać i rozwiązywać problemy związane z wszystkimi przepływami pracy wdrożeniowej azd
- Projektować i implementować niestandardową automatyzację wdrożeń za pomocą hooków
- Konfigurować wdrożenia gotowe do produkcji z odpowiednim zabezpieczeniem i monitorowaniem
- Zarządzać złożonymi scenariuszami wdrożeniowymi w wielu środowiskach
- Optymalizować wydajność wdrożeń i implementować strategie wycofywania
- Włączać wdrożenia azd do praktyk DevOps w przedsiębiorstwie

## Przegląd wdrożeń

Azure Developer CLI oferuje kilka poleceń wdrożeniowych:
- `azd up` - Kompletny przepływ pracy (tworzenie zasobów + wdrożenie)
- `azd provision` - Tworzenie/aktualizacja tylko zasobów Azure
- `azd deploy` - Wdrożenie tylko kodu aplikacji
- `azd package` - Budowanie i pakowanie aplikacji

## Podstawowe przepływy pracy wdrożeniowej

### Kompleksowe wdrożenie (azd up)
Najczęściej stosowany przepływ pracy dla nowych projektów:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Wdrożenie tylko infrastruktury
Gdy potrzebujesz zaktualizować tylko zasoby Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Wdrożenie tylko kodu
Dla szybkich aktualizacji aplikacji:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

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
- Wdraża zapakowane aplikacje na usługi Azure
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Monitorowanie wdrożeń

### Monitorowanie wdrożeń w czasie rzeczywistym
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

## 🔐 Rozważania dotyczące bezpieczeństwa

### Zarządzanie sekretami
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

### Szybkie wycofanie
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Wycofanie infrastruktury
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
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

## 📊 Metryki wdrożeniowe

### Śledzenie wydajności wdrożenia
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Walidacja infrastruktury
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kolejne kroki

- [Tworzenie zasobów](provisioning.md) - Szczegółowe zarządzanie infrastrukturą
- [Planowanie przed wdrożeniem](../pre-deployment/capacity-planning.md) - Zaplanuj swoją strategię wdrożeniową
- [Typowe problemy](../troubleshooting/common-issues.md) - Rozwiązywanie problemów z wdrożeniem
- [Najlepsze praktyki](../troubleshooting/debugging.md) - Strategie wdrożeniowe gotowe do produkcji

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

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.