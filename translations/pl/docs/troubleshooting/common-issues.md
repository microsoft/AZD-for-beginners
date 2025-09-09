<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T17:09:05+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "pl"
}
-->
# Typowe Problemy i Rozwiązania

## Wprowadzenie

Ten kompleksowy przewodnik rozwiązywania problemów obejmuje najczęściej spotykane trudności podczas korzystania z Azure Developer CLI. Dowiedz się, jak diagnozować, rozwiązywać i naprawiać typowe problemy związane z uwierzytelnianiem, wdrożeniem, tworzeniem infrastruktury oraz konfiguracją aplikacji. Każdy problem zawiera szczegółowe objawy, przyczyny oraz procedury krok po kroku.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Mistrzowsko diagnozować problemy z Azure Developer CLI
- Rozumieć typowe problemy z uwierzytelnianiem i uprawnieniami oraz ich rozwiązania
- Rozwiązywać błędy wdrożeniowe, problemy z tworzeniem infrastruktury i konfiguracją
- Wdrażać proaktywne strategie monitorowania i debugowania
- Stosować systematyczne metody rozwiązywania złożonych problemów
- Konfigurować odpowiednie logowanie i monitorowanie, aby zapobiegać przyszłym problemom

## Efekty nauki

Po ukończeniu będziesz w stanie:
- Diagnozować problemy z Azure Developer CLI za pomocą wbudowanych narzędzi diagnostycznych
- Samodzielnie rozwiązywać problemy związane z uwierzytelnianiem, subskrypcją i uprawnieniami
- Skutecznie rozwiązywać błędy wdrożeniowe i problemy z tworzeniem infrastruktury
- Debugować problemy z konfiguracją aplikacji i specyficzne dla środowiska trudności
- Wdrażać monitorowanie i alerty, aby proaktywnie identyfikować potencjalne problemy
- Stosować najlepsze praktyki w zakresie logowania, debugowania i rozwiązywania problemów

## Szybka Diagnostyka

Zanim przejdziesz do konkretnych problemów, uruchom te polecenia, aby zebrać informacje diagnostyczne:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Problemy z Uwierzytelnianiem

### Problem: "Nie udało się uzyskać tokenu dostępu"
**Objawy:**
- `azd up` kończy się błędami uwierzytelniania
- Polecenia zwracają "nieautoryzowane" lub "odmowa dostępu"

**Rozwiązania:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Niewystarczające uprawnienia" podczas wdrożenia
**Objawy:**
- Wdrożenie kończy się błędami uprawnień
- Nie można utworzyć określonych zasobów Azure

**Rozwiązania:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Problemy z uwierzytelnianiem w środowisku wielodostępowym
**Rozwiązania:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Błędy Tworzenia Infrastruktury

### Problem: Konflikty nazw zasobów
**Objawy:**
- Błędy "Nazwa zasobu już istnieje"
- Wdrożenie kończy się niepowodzeniem podczas tworzenia zasobów

**Rozwiązania:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Problem: Lokalizacja/region niedostępny
**Objawy:**
- "Lokalizacja 'xyz' jest niedostępna dla typu zasobu"
- Niektóre SKU niedostępne w wybranym regionie

**Rozwiązania:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Przekroczone limity
**Objawy:**
- "Przekroczono limit dla typu zasobu"
- "Osiągnięto maksymalną liczbę zasobów"

**Rozwiązania:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Błędy w szablonach Bicep
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

## 🚀 Problemy z Wdrożeniem

### Problem: Niepowodzenia kompilacji
**Objawy:**
- Aplikacja nie udaje się skompilować podczas wdrożenia
- Błędy instalacji pakietów

**Rozwiązania:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problem: Niepowodzenia wdrożenia kontenerów
**Objawy:**
- Aplikacje kontenerowe nie uruchamiają się
- Błędy pobierania obrazów

**Rozwiązania:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Problemy z połączeniem z bazą danych
**Objawy:**
- Aplikacja nie może połączyć się z bazą danych
- Błędy przekroczenia czasu połączenia

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

## 🔧 Problemy z Konfiguracją

### Problem: Zmienne środowiskowe nie działają
**Objawy:**
- Aplikacja nie może odczytać wartości konfiguracji
- Zmienne środowiskowe wydają się puste

**Rozwiązania:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

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
- Żądanie cross-origin zablokowane

**Rozwiązania:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Problemy z Zarządzaniem Środowiskiem

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
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problem: Uszkodzenie środowiska
**Objawy:**
- Środowisko pokazuje nieprawidłowy stan
- Zasoby nie pasują do konfiguracji

**Rozwiązania:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Problemy z Wydajnością

### Problem: Wolne czasy wdrożenia
**Objawy:**
- Wdrożenia trwają zbyt długo
- Przekroczenia czasu podczas wdrożenia

**Rozwiązania:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Problem: Problemy z wydajnością aplikacji
**Objawy:**
- Wolne czasy odpowiedzi
- Wysokie zużycie zasobów

**Rozwiązania:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Narzędzia i Polecenia do Rozwiązywania Problemów

### Polecenia debugowania
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Analiza logów
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

## 🆘 Uzyskiwanie Dodatkowej Pomocy

### Kiedy eskalować
- Problemy z uwierzytelnianiem utrzymują się po wypróbowaniu wszystkich rozwiązań
- Problemy z infrastrukturą usług Azure
- Problemy związane z rozliczeniami lub subskrypcją
- Obawy dotyczące bezpieczeństwa lub incydenty

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
Przed skontaktowaniem się z pomocą techniczną, zbierz:
- Wynik `azd version`
- Wynik `azd info`
- Komunikaty o błędach (pełny tekst)
- Kroki do odtworzenia problemu
- Szczegóły środowiska (`azd env show`)
- Oś czasu, kiedy problem się rozpoczął

### Skrypt do zbierania logów
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Zapobieganie Problemom

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

### Konfiguracja monitorowania
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regularna konserwacja
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Powiązane Zasoby

- [Przewodnik Debugowania](debugging.md) - Zaawansowane techniki debugowania
- [Tworzenie Zasobów](../deployment/provisioning.md) - Rozwiązywanie problemów z infrastrukturą
- [Planowanie Pojemności](../pre-deployment/capacity-planning.md) - Wskazówki dotyczące planowania zasobów
- [Wybór SKU](../pre-deployment/sku-selection.md) - Rekomendacje dotyczące poziomów usług

---

**Wskazówka**: Zapisz ten przewodnik w zakładkach i korzystaj z niego, gdy napotkasz problemy. Większość problemów była już wcześniej spotykana i ma ustalone rozwiązania!

---

**Nawigacja**
- **Poprzednia Lekcja**: [Tworzenie Zasobów](../deployment/provisioning.md)
- **Następna Lekcja**: [Przewodnik Debugowania](debugging.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.