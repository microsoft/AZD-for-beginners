# Powszechne Problemy i Rozwiązania

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 7 - Rozwiązywanie problemów i Debugowanie
- **⬅️ Poprzedni rozdział**: [Rozdział 6: Kontrole przed startem](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Następny**: [Przewodnik po debugowaniu](debugging.md)
- **🚀 Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i przedsiębiorcze](../chapter-08-production/production-ai-practices.md)

## Wprowadzenie

Ten kompleksowy przewodnik po rozwiązywaniu problemów obejmuje najczęściej napotykane problemy podczas korzystania z Azure Developer CLI. Naucz się diagnozować, rozwiązywać i likwidować typowe problemy z uwierzytelnianiem, wdrożeniem, provisionowaniem infrastruktury oraz konfiguracją aplikacji. Każdy problem zawiera szczegółowe objawy, przyczyny źródłowe oraz krok po kroku procedury rozwiązania.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Mistrzem technik diagnostycznych problemów Azure Developer CLI
- Rozumieć typowe problemy z uwierzytelnianiem i uprawnieniami oraz ich rozwiązania
- Rozwiązywać błędy wdrożeniowe, problemy z provisionowaniem infrastruktury i błędy konfiguracji
- Wdrażać proaktywne strategie monitorowania i debugowania
- Stosować systematyczne metody rozwiązywania złożonych problemów
- Konfigurować właściwe logowanie i monitorowanie, by zapobiegać przyszłym problemom

## Oczekiwane rezultaty nauki

Po ukończeniu będziesz potrafił:
- Diagnozować problemy Azure Developer CLI za pomocą wbudowanych narzędzi diagnostycznych
- Samodzielnie rozwiązywać problemy z uwierzytelnianiem, subskrypcją i uprawnieniami
- Skutecznie rozwiązywać błędy wdrożeń i błędy provisionowania infrastruktury
- Debugować problemy z konfiguracją aplikacji i specyficzne dla środowiska
- Wdrażać monitoring i alerty, aby proaktywnie wykrywać potencjalne problemy
- Stosować najlepsze praktyki w logowaniu, debugowaniu i przepływach rozwiązywania problemów

## Szybka diagnostyka

> Zastąp przykładowe nazwy/ID wartościami z twojego środowiska. Fragmenty Bash, Bicep, JavaScript oraz plików parametrów oznaczono osobno poniżej; nie są one jednym skryptem wykonywalnym. Sprawdź operacje destrukcyjne i zredaguj sekrety przed udostępnieniem diagnostyki. `azd monitor --logs` otwiera przeglądarkę; nie przesyła logów terminala.

Zanim przejdziesz do konkretnych problemów, uruchom te polecenia, aby zebrać informacje diagnostyczne:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Problemy z uwierzytelnianiem

### Problem: "Nie udało się pobrać tokena dostępu"
**Objawy:**
- `azd up` kończy się błędami uwierzytelniania
- Polecenia zwracają "nieautoryzowany" lub "dostęp zabroniony"

**Rozwiązania:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Problem: "Niewystarczające uprawnienia" podczas wdrożenia
**Objawy:**
- Wdrożenie kończy się błędami uprawnień
- Nie można utworzyć wybranych zasobów Azure

**Rozwiązania:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Problemy z uwierzytelnianiem wielooddzielnicowym
**Rozwiązania:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Błędy provisionowania infrastruktury

### Problem: Konflikty nazw zasobów
**Objawy:**
- Błędy typu "Nazwa zasobu już istnieje"
- Wdrożenie kończy się niepowodzeniem podczas tworzenia zasobów

**Rozwiązania:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Problem: Lokalizacja/region niedostępny
**Objawy:**
- "Lokalizacja 'xyz' niedostępna dla typu zasobu"
- Niektóre SKU niedostępne w wybranym regionie

**Rozwiązania:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Zmiana zmiennej lokalizacji nie przenosi istniejących zasobów. Istniejąca grupa zasobów lub zasób może odrzucić zmianę lokalizacji; użyj oddzielnego środowiska do regionalnego ponownego wdrożenia.

### Problem: Błędy przekroczenia limitów (quota)
**Objawy:**
- "Przekroczono limit dla typu zasobu"
- "Osiągnięto maksymalną liczbę zasobów"

**Rozwiązania:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Dla developmentu wybierz mniejsze, obsługiwane SKU w `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Błędy szablonów Bicep
**Objawy:**
- Niepowodzenia walidacji szablonów
- Błędy składni w plikach Bicep

**Rozwiązania:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Niepowodzenia wdrożenia

### Problem: Błędy kompilacji
**Objawy:**
- Aplikacja nie buduje się podczas wdrożenia
- Błędy instalacji pakietów

**Rozwiązania:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problem: Niepowodzenia wdrożeń kontenerów
**Objawy:**
- Aplikacje kontenerowe nie uruchamiają się
- Błędy pobierania obrazów

**Rozwiązania:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Błędy połączenia z bazą danych
**Objawy:**
- Aplikacja nie może połączyć się z bazą
- Błędy timeout połączenia

**Rozwiązania:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemy konfiguracji

### Problem: Zmienne środowiskowe nie działają
**Objawy:**
- Aplikacja nie odczytuje wartości konfiguracyjnych
- Zmienne środowiskowe wydają się puste

**Rozwiązania:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: Problemy z certyfikatami SSL/TLS
**Objawy:**
- HTTPS nie działa
- Błędy walidacji certyfikatów

**Rozwiązania:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemy z konfiguracją CORS
**Objawy:**
- Frontend nie może wywołać API
- Blokada zapytań cross-origin

**Rozwiązania:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Zaktualizuj istniejącą aplikację Express (z zaimportowanym `cors`):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Problemy z zarządzaniem środowiskiem

### Problem: Problemy z przełączaniem środowisk
**Objawy:**
- Używane jest niewłaściwe środowisko
- Konfiguracja nie przełącza się poprawnie

**Rozwiązania:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problem: Uszkodzenie środowiska
**Objawy:**
- Środowisko pokazuje nieprawidłowy stan
- Zasoby niezgodne z konfiguracją

**Rozwiązania:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Problemy z wydajnością

### Problem: Wolne czasy wdrożeń
**Objawy:**
- Wdrożenia trwają zbyt długo
- Timeouty podczas wdrożenia

**Rozwiązania:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Problem: Problemy z wydajnością aplikacji
**Objawy:**
- Wolne czasy odpowiedzi
- Wysokie zużycie zasobów

**Rozwiązania:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Narzędzia i polecenia do rozwiązywania problemów

### Polecenia debugowania
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Analiza logów
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Badanie zasobów
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Uzyskiwanie dodatkowej pomocy

### Kiedy eskalować
- Problemy z uwierzytelnianiem utrzymują się po wypróbowaniu wszystkich rozwiązań
- Problemy z infrastrukturą usług Azure
- Problemy związane z rozliczeniami lub subskrypcją
- Problemy bezpieczeństwa lub incydenty

### Kanały wsparcia
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacje do zebrania
Przed kontaktem ze wsparciem zbierz:
- wynik `azd version`
- wynik `azd config show`
- wynik `azd show` (bieżący status wdrożenia)
- Komunikaty błędów (pełny tekst)
- Kroki do odtworzenia problemu
- Zredagowane szczegóły środowiska (nigdy nie udostępniaj surowych `azd env get-values`, które mogą zawierać sekrety)
- Oś czasu rozpoczęcia problemu

### Skrypt do zbierania logów
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Zapobieganie problemom

### Lista kontrolna przed wdrożeniem
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Konfiguracja monitoringu
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Regularna konserwacja
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Powiązane zasoby

- [Przewodnik po debugowaniu](debugging.md) - Zaawansowane techniki debugowania
- [Provisionowanie zasobów](../chapter-04-infrastructure/provisioning.md) - Rozwiązywanie problemów infrastruktury
- [Planowanie pojemności](../chapter-06-pre-deployment/capacity-planning.md) - Wskazówki do planowania zasobów
- [Wybór SKU](../chapter-06-pre-deployment/sku-selection.md) - Zalecenia dotyczące poziomów usług

---

**Wskazówka**: Zachowaj ten przewodnik w zakładkach i korzystaj z niego zawsze, gdy napotkasz problemy. Większość problemów była już wcześniej obserwowana i ma ustalone rozwiązania!

---

**Nawigacja**
- **Poprzednia lekcja**: [Provisionowanie zasobów](../chapter-04-infrastructure/provisioning.md)
- **Następna lekcja**: [Przewodnik po debugowaniu](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->