# Przewodnik wdrożeniowy - Opanowanie wdrożeń AZD

**Nawigacja w rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 4 - Infrastruktura jako kod i wdrożenia
- **⬅️ Poprzedni rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)
- **➡️ Następny**: [Provisioning Resources](provisioning.md)
- **🧩 Również w tym rozdziale**: [Tworzenie własnego szablonu](custom-templates.md)
- **🚀 Następny rozdział**: [Rozdział 5: Rozwiązania Multi-Agent AI](../../examples/retail-scenario.md)

## Wprowadzenie

> Sprawdzone względem `azd 1.37.2` (listopad 2026). Polecenia używają Bash; przykłady JSON wymagają `jq`. Z wyjątkiem wyraźnie zainicjowanego ćwiczenia todo, zaawansowane przykłady to **fragmenty integracyjne**: dostarcz własne źródła, infrastrukturę, testy i skrypty. W tej recenzji nie wykonano żadnych wdrożeń Azure.

Ten obszerny przewodnik obejmuje wszystko, co musisz wiedzieć o wdrażaniu aplikacji przy użyciu Azure Developer CLI, od podstawowego wdrożenia jednym poleceniem po zaawansowane scenariusze produkcyjne z niestandardowymi hookami, wieloma środowiskami i integracją CI/CD. Opanuj cały cykl wdrożenia dzięki praktycznym przykładom i najlepszym praktykom.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Opanowujesz wszystkie polecenia i przepływy pracy wdrożeń Azure Developer CLI
- Rozumiesz pełny cykl życia wdrożenia od provisioning do monitorowania
- Implementujesz niestandardowe hooki wdrożeniowe do automatyzacji przed i po wdrożeniu
- Konfigurujesz wiele środowisk z parametrami specyficznymi dla środowiska
- Ustawiasz zaawansowane strategie wdrożeniowe, w tym blue-green i canary
- Integrujesz wdrożenia azd z potokami CI/CD i przepływami pracy DevOps

## Rezultaty nauki

Po ukończeniu będziesz potrafił:
- Samodzielnie wykonywać i rozwiązywać problemy we wszystkich przepływach pracy wdrożeń azd
- Projektować i implementować niestandardową automatyzację wdrożeń za pomocą hooków
- Konfigurować wdrożenia gotowe do produkcji z odpowiednim bezpieczeństwem i monitorowaniem
- Zarządzać złożonymi scenariuszami wdrożeń wielośrodowiskowych
- Optymalizować wydajność wdrożeń i wdrażać strategie wycofywania
- Integracja wdrożeń azd z praktykami Enterprise DevOps

## Przegląd wdrożeń

Azure Developer CLI oferuje kilka komend wdrożeniowych:
- `azd up` - Kompletny przepływ pracy (provision + deploy)
- `azd provision` - Tylko tworzenie/aktualizacja zasobów Azure
- `azd deploy` - Tylko wdrożenie kodu aplikacji
- `azd package` - Budowa i pakowanie aplikacji

## Podstawowe przepływy wdrożeniowe

### Kompletny proces wdrożenia (azd up)
Najczęstszy przepływ pracy dla nowych projektów:
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

### Wdrożenie tylko infrastruktury
Gdy potrzebujesz tylko zaktualizować zasoby Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Wdrożenie tylko kodu
Dla szybkich aktualizacji aplikacji:
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

### ✅ Weryfikacja wdrożenia

Po każdym wdrożeniu zweryfikuj jego powodzenie:

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

**Kryteria sukcesu:**
- ✅ `azd show` rozwiązuje oczekiwane docelowe usługi/adresy URL
- ✅ Żądania do faktycznych tras aplikacji zwracają oczekiwany status i ciało
- ✅ Brak błędów w logach w ciągu ostatnich 5 minut
- ✅ Aplikacja odpowiada na żądania testowe

## 🏗️ Zrozumienie procesu wdrożenia

### Nowy w hookach? Zacznij tutaj

**Hook** to polecenie uruchamiane automatycznie przez azd w określonym momencie procesu wdrożenia — przed lub po provisioningu oraz przed lub po wdrożeniu kodu. Pozwalają one zautomatyzować drobne zadania towarzyszące wdrożeniu: zasiewanie bazy danych, uruchamianie migracji, budowanie zasobów lub testowanie na żywo aplikacji.

| Hook | Wykonuje się… | Typowe zastosowanie |
|------|------------|----------------------|
| `preprovision` | Przed utworzeniem zasobów | Weryfikacja wymagań, logowanie do rejestru |
| `postprovision` | Po utworzeniu zasobów | Konfiguracja zasobów, ustawianie bazy danych |
| `predeploy` | Przed wdrożeniem kodu | Budowa front-endu, uruchamianie testów jednostkowych |
| `postdeploy` | Po udanym wdrożeniu kodu | Uruchamianie migracji bazy danych, testy podstawowe punktu końcowego |

Hooki znajdują się w twoim `azure.yaml`. Oto najmniejszy możliwy przykład — wyświetla tylko wiadomość po wdrożeniu:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

To wszystko — następnym razem, gdy uruchomisz `azd up`, wiadomość zostanie automatycznie wyświetlona. Możesz też uruchomić hook samodzielnie, bez pełnego wdrożenia, co świetnie nadaje się do testów:

```bash
azd hooks run postdeploy
```

Poniższe fazy pokazują przykładowe hooki z życia wzięte (migracje, testy, walidacja) dla każdego etapu.

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
- Ustawia monitorowanie i logowanie

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

### Faza 6: Wdrożenie aplikacji
- Wdraża zapakowane aplikacje do usług Azure
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
      curl --fail "$WEB_URL/health"
```

### Obsługa błędów hooków

Domyślnie, **jeśli polecenie hooka zakończy się kodem innym niż zero, azd zatrzymuje całą operację.** To zazwyczaj pożądane — nieudana migracja powinna przerwać wdrożenie, nie wysyłać uszkodzonej aplikacji. Oznacza to jednak, że hooki muszą być pisane ostrożnie.

**1. Spraw, aby błędy były wyraźne i zamierzone.** Hook zawiedzie, gdy jego ostatnie polecenie zwróci kod wyjścia różny od zera. W skryptach powłoki dodaj `set -e`, aby hook zatrzymał się przy pierwszym nieudanym poleceniu zamiast cicho kontynuować:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Pozwól hookowi zakończyć się niepowodzeniem bez zatrzymywania azd.** Dla kroków niekrytycznych (opcjonalne rozgrzewanie cache, powiadomienie na zasadzie najlepszych starań), ustaw `continueOnError: true`. azd zaloguje błąd, ale będzie kontynuować:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testuj hooki oddzielnie przed pełnym uruchomieniem.** Nie musisz uruchamiać `azd up`, aby debugować hooki — uruchom je samodzielnie i szybko iteruj:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Uważaj na powłoki specyficzne dla systemu operacyjnego.** Hook używający `shell: pwsh` wymaga, aby PowerShell był zainstalowany na maszynie go uruchamiającej (w tym agentach CI). Dla najszerszej przenośności użyj `shell: sh` lub dostarcz obie wersje `windows` i `posix`:

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

> **Wskazówka debugowania:** uruchom dowolne polecenie azd z `--debug`, aby zobaczyć dokładną linię poleceń hooka i pełny jego output — nieocenione, gdy hook działa lokalnie, ale zawodzi w CI.

## 🎛️ Konfiguracja wdrożenia

### Ustawienia wdrożenia specyficzne dla usługi
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

### Konfiguracje specyficzne dla środowiska

To są wartości lokalne azd. Mapuj je jawnie na konfigurację infrastruktury/środowiska uruchomieniowego. `NODE_ENV` to zwykle `production` dla wdrożonej aplikacji Node, włączając wdrożenie staging; użyj oddzielnej zmiennej specyficznej dla aplikacji, aby rozróżnić etapy wdrożenia.

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

### Wdrożenia Blue-Green

**Ilustracyjny szkic operacyjny:** musisz dostarczyć oba środowiska, wspólną warstwę routingu ruchu oraz dwa poniższe skrypty. azd nie przełącza automatycznie ruchu ani nie weryfikuje gotowości do rollbacku. Pozostaw zielone do czasu, aż niebieskie przejdzie testy i rollback nie będzie już potrzebny.

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

### Wdrożenia Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Podział ruchu należy skonfigurować w Container Apps (Bicep lub Azure CLI), nie jest to wlasność `azure.yaml` `trafficSplit`. Podgląd/provisioning i późniejsze wdrożenia muszą zachować wybrany tryb rewizji i reguły routingu.

### Wdrożenia etapowe
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

## 🐳 Wdrożenia kontenerowe

### Wdrożenia Container App
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

Konfiguruj sekrety środowiskowe przez `configuration.secrets`/`secretRef` (lub odwołania do Key Vault) oraz skalowanie przez `template.scale` w infrastrukturze Container App. Nie wymyślaj właściwości `secrets` lub `scale` na poziomie usługi w `azure.yaml`.

### Optymalizacja Dockerfile wieloetapowego
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

## ⚡ Optymalizacja wydajności

### Wdrożenia specyficzne dla usług
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Cache'owanie budowy
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standardowy przepływ Node używa skryptów pakietów; hooki `prepackage` w usłudze mogą dodać wymagane kroki. Cache warstw Docker jest odrębne od definiowania polecenia budowy dla usługi.

### Wydajne wdrożenia kodu
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitorowanie wdrożeń

### Monitorowanie wdrożeń w czasie rzeczywistym
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Kontrole zdrowia
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

Twoja aplikacja musi implementować `/health`; nie jest ona dostarczana automatycznie przez azd. Nie ma ogólnej właściwości usługi `azure.yaml` `healthCheck`.

### Walidacja po wdrożeniu
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

## 🔐 Aspekty bezpieczeństwa

### Zarządzanie sekretami
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` jest nieprawidłowy. Zwykłe wartości środowiskowe to lokalny tekst jawny; nie zakładaj, że polecenia do odczytu je zaciemniają. Powyższe polecenia zapisują odwołania do Key Vault, ale twoja infrastruktura/aplikacja musi konsumować sekrety i przyznać dostęp tożsamości uruchomieniowej.

### Bezpieczeństwo sieci
Deklaruj i konsumuj parametry sieciowe w Bicep oraz mapuj je w `infra/main.parameters.json`. Nie ma ogólnej nakładki `infra.parameters` w `azure.yaml`. Przykładowa dokumentacja z zakresami `203.0.113.0/24` i `198.51.100.0/24` nie są rzeczywistymi sieciami biurowymi/VPN; zastąp je autoryzowanymi zakresami sieci.

### Zarządzanie tożsamością i dostępem
Włącz `identity` Container App w Bicep i przypisz niezbędną rolę na poziomie data plane Key Vault w zakresie sejfu. Konfiguruj nazwane sekrety oparte na Key Vault i odwołania uruchomieniowe w tym zasobie; `identity` i `keyVault` nie są ogólnymi właściwościami usługi azd. Zobacz [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategie wycofywania

### Szybkie wycofanie
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

### Wycofanie infrastruktury
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

### Śledzenie wydajności wdrożenia
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Walidacja infrastruktury
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kolejne kroki

- [Provisioning Resources](provisioning.md) - Dogłębne zarządzanie infrastrukturą
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Planowanie strategii wdrożenia
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Rozwiązywanie problemów z wdrożeniem
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Strategie gotowe do produkcji

## 🎯 Ćwiczenia praktyczne wdrożenia

### Ćwiczenie 1: Inkremetny przepływ wdrożenia (20 minut)
**Cel**: Opanowanie różnicy między pełnym a inkrementalnym wdrożeniem

**Punkt startowy:** Bash, Node.js 22, Git, zalogowany azd i subskrypcja Azure z uprawnieniami do wdrożeń. Uruchom w nowym katalogu; spodziewaj się naliczanych zasobów App Service/Cosmos DB. Czas wykonania zależy od regionu i szablonu.

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

**Kryteria sukcesu:**
- [ ] Zanotuj czas wykonania obu poleceń (czas nie jest gwarantowany)
- [ ] Oba polecenia zakończą się sukcesem
- [ ] API pozostaje funkcjonalne; edycja tylko komentarza nie powoduje widocznej zmiany UI
- [ ] Infrastruktura bez zmian po `azd deploy`

**Wynik nauki**: `azd deploy` pomija provisioning infrastruktury. Porównuj zmierzone czasy zamiast zakładać stałe przyspieszenie procentowe.

### Ćwiczenie 2: Niestandardowe hooki wdrożeniowe (30 minut)
**Cel**: Implementacja automatyzacji przed i po wdrożeniu

**Punkt startowy:** zainicjalizowany projekt `deployment-practice` powyżej. Jeśli go wyczyściłeś, ponownie uruchom `azd up` przed testem wdrożenia tylko kodu. Walidacja poniżej używa faktycznego skryptu budowy API, nie nieistniejącego skryptu `test:unit` w katalogu głównym. Testy API w szablonie wymagają skonfigurowanego dostępu do bazy danych; nie są testami jednostkowymi w izolacji.

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

**Kryteria sukcesu:**
- [ ] Skrypt przed wdrożeniem uruchamia się przed wdrożeniem
- [ ] Wdrożenie zostaje przerwane, jeśli walidacja budowy się nie powiedzie
- [ ] Test dymny po wdrożeniu weryfikuje zdrowie
- [ ] Hooki wykonują się we właściwej kolejności

### Ćwiczenie 3: Strategia wdrożeń wielośrodowiskowych (45 minut)
**Cel**: Implementacja etapowego przepływu wdrożenia (dev → staging → produkcja)

**Punkt startowy:** ten sam zainicjowany projekt todo z `jq`. Utwórz poniższe środowiska z rzeczywistymi wartościami subskrypcji/lokalizacji (lub ustaw `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` w każdym) **przed** wywołaniem workflow bez monitów. Celowo się nie powodzi zamiast wymyślać brakujące wartości. Używaj tylko jednorazowych środowisk treningowych, a nie rzeczywistej subskrypcji produkcyjnej.

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

**Kryteria sukcesu:**
- [ ] Środowisko deweloperskie wdraża się pomyślnie
- [ ] Środowisko staging wdraża się pomyślnie
- [ ] Ręczna akceptacja wymagana dla produkcji
- [ ] Wszystkie środowiska mają działające kontrole stanu
- [ ] Możliwość wycofania zmian w razie potrzeby

### Ćwiczenie 4: Strategia wycofania (25 minut)
**Cel**: Implementacja i testowanie wycofania wdrożenia przy użyciu Git

**Punkt startowy:** izolowane repozytorium szkoleniowe szablonu todo z zatwierdzonym całościowo kodem bazowym, czyste drzewo robocze Git oraz jednorazowo skonfigurowane środowisko. Nigdy nie wprowadzaj świadomych błędów w prawdziwym projekcie produkcyjnym. `APP_VERSION` poniżej służy tylko do prowadzenia ewidencji, chyba że jawnie go włączysz do aplikacji.

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

**Kryteria sukcesu:**
- [ ] Potrafi wykryć błędy wdrożenia
- [ ] Skrypt wycofania wykonuje się automatycznie
- [ ] Aplikacja wraca do działającego stanu
- [ ] Kontrole stanu przechodzą pomyślnie po wycofaniu

## 📊 Śledzenie metryk wdrożenia

### Śledź wydajność swojego wdrożenia

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

**Analizuj swoje metryki:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatkowe źródła informacji

- [Odnośnik do Deployment Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Wdrożenie Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Wdrożenie Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Wdrożenie Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Nawigacja**
- **Poprzednia lekcja**: [Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **Następna lekcja**: [Provisioning zasobów](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->