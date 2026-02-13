# Typowe problemy i rozwiązania

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni rozdział**: [Rozdział 6: Kontrole przed wdrożeniem](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Następny**: [Przewodnik po debugowaniu](debugging.md)
- **🚀 Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../chapter-08-production/production-ai-practices.md)

## Wprowadzenie

Ten obszerny przewodnik po rozwiązywaniu problemów obejmuje najczęściej napotykane problemy podczas korzystania z Azure Developer CLI. Nauczysz się diagnozować, rozwiązywać i usuwać typowe problemy związane z uwierzytelnianiem, wdrożeniami, provisionowaniem infrastruktury i konfiguracją aplikacji. Każdy problem zawiera szczegółowe objawy, przyczyny źródłowe oraz krok po kroku procedury naprawcze.

## Cele nauki

Po ukończeniu tego przewodnika:
- Opanujesz techniki diagnostyczne dla problemów z Azure Developer CLI
- Zrozumiesz typowe problemy z uwierzytelnianiem i uprawnieniami oraz ich rozwiązania
- Rozwiążesz awarie wdrożeń, błędy provisionowania infrastruktury i problemy konfiguracyjne
- Wdrożysz proaktywne strategie monitorowania i debugowania
- Zastosujesz systematyczne metody rozwiązywania złożonych problemów
- Skonfigurujesz odpowiednie logowanie i monitorowanie, aby zapobiegać przyszłym problemom

## Rezultaty nauki

Po ukończeniu będziesz potrafił:
- Diagnozować problemy z Azure Developer CLI za pomocą wbudowanych narzędzi diagnostycznych
- Samodzielnie rozwiązywać problemy związane z uwierzytelnianiem, subskrypcją i uprawnieniami
- Skutecznie rozwiązywać awarie wdrożeń i błędy provisionowania infrastruktury
- Debugować problemy z konfiguracją aplikacji i problemy specyficzne dla środowiska
- Wdrożyć monitorowanie i alertowanie, aby proaktywnie identyfikować potencjalne problemy
- Stosować najlepsze praktyki dotyczące logowania, debugowania i procesów rozwiązywania problemów

## Szybka diagnostyka

Zanim przejdziesz do konkretnych problemów, uruchom te polecenia, aby zebrać informacje diagnostyczne:

```bash
# Sprawdź wersję i stan azd
azd version
azd config list

# Zweryfikuj uwierzytelnianie w Azure
az account show
az account list

# Sprawdź bieżące środowisko
azd env show
azd env get-values

# Włącz logowanie debugowe
export AZD_DEBUG=true
azd <command> --debug
```

## Problemy z uwierzytelnianiem

### Problem: "Failed to get access token"
**Objawy:**
- `azd up` zakończony niepowodzeniem z błędami uwierzytelniania
- Polecenia zwracają "nieautoryzowany" lub "odmowa dostępu"

**Rozwiązania:**
```bash
# 1. Ponownie uwierzytelnij się za pomocą Azure CLI
az login
az account show

# 2. Wyczyść pamięć podręczną poświadczeń
az account clear
az login

# 3. Użyj przepływu kodu urządzenia (dla systemów bez interfejsu graficznego)
az login --use-device-code

# 4. Ustaw określoną subskrypcję
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Insufficient privileges" podczas wdrożenia
**Objawy:**
- Wdrożenie kończy się błędami uprawnień
- Nie można utworzyć niektórych zasobów Azure

**Rozwiązania:**
```bash
# 1. Sprawdź przypisania ról w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Upewnij się, że masz wymagane role
# - Contributor (do tworzenia zasobów)
# - User Access Administrator (do przypisywania ról)

# 3. Skontaktuj się z administratorem Azure, aby uzyskać odpowiednie uprawnienia
```

### Problem: Problemy z uwierzytelnianiem wielotenantowym
**Rozwiązania:**
```bash
# 1. Zaloguj się z określonym dzierżawcą
az login --tenant "your-tenant-id"

# 2. Ustaw dzierżawcę w konfiguracji
azd config set auth.tenantId "your-tenant-id"

# 3. Wyczyść pamięć podręczną dzierżawcy, jeśli przełączasz dzierżawców
az account clear
```

## 🏗️ Błędy podczas tworzenia infrastruktury

### Problem: Konflikty nazw zasobów
**Objawy:**
- Błędy "The resource name already exists"
- Wdrożenie kończy się niepowodzeniem podczas tworzenia zasobu

**Rozwiązania:**
```bash
# 1. Używaj unikalnych nazw zasobów z tokenami
# W szablonie Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Zmień nazwę środowiska
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Oczyść istniejące zasoby
azd down --force --purge
```

### Problem: Lokalizacja/Region niedostępny
**Objawy:**
- "The location 'xyz' is not available for resource type"
- Niektóre SKU niedostępne w wybranym regionie

**Rozwiązania:**
```bash
# 1. Sprawdź dostępne lokalizacje dla typów zasobów
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Używaj powszechnie dostępnych regionów
azd config set defaults.location eastus2
# lub
azd env set AZURE_LOCATION eastus2

# 3. Sprawdź dostępność usług w poszczególnych regionach
# Odwiedź: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Przekroczono limity (quota)
**Objawy:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Rozwiązania:**
```bash
# 1. Sprawdź aktualne wykorzystanie limitów
az vm list-usage --location eastus2 -o table

# 2. Poproś o zwiększenie limitu przez portal Azure
# Przejdź do: Subskrypcje > Wykorzystanie i limity

# 3. Używaj mniejszych SKU w środowisku deweloperskim
# W pliku main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Usuń nieużywane zasoby
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Błędy szablonów Bicep
**Objawy:**
- Niepowodzenie walidacji szablonu
- Błędy składni w plikach Bicep

**Rozwiązania:**
```bash
# 1. Zwaliduj składnię Bicep
az bicep build --file infra/main.bicep

# 2. Użyj lintera Bicep
az bicep lint --file infra/main.bicep

# 3. Sprawdź składnię pliku parametrów
cat infra/main.parameters.json | jq '.'

# 4. Podejrzyj zmiany wdrożenia
azd provision --preview
```

## 🚀 Błędy wdrożeń

### Problem: Błędy kompilacji
**Objawy:**
- Aplikacja nie buduje się podczas wdrożenia
- Błędy instalacji pakietów

**Rozwiązania:**
```bash
# 1. Sprawdź wynik budowania za pomocą flagi debugowania
azd deploy --service web --debug

# 2. Wyświetl stan wdrożonej usługi
azd show

# 3. Przetestuj kompilację lokalnie
cd src/web
npm install
npm run build

# 3. Sprawdź kompatybilność wersji Node.js i Pythona
node --version  # Powinno być zgodne z ustawieniami w azure.yaml
python --version

# 4. Wyczyść pamięć podręczną kompilacji
rm -rf node_modules package-lock.json
npm install

# 5. Sprawdź Dockerfile, jeśli używasz kontenerów
docker build -t test-image .
docker run --rm test-image
```

### Problem: Błędy wdrożenia kontenera
**Objawy:**
- Aplikacje kontenerowe nie uruchamiają się
- Błędy pobierania obrazu

**Rozwiązania:**
```bash
# 1. Przetestuj lokalne budowanie obrazu Dockera
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Sprawdź logi kontenera za pomocą Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitoruj aplikację za pomocą azd
azd monitor --logs

# 3. Zweryfikuj dostęp do rejestru kontenerów
az acr login --name myregistry

# 4. Sprawdź konfigurację aplikacji kontenerowej
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Problemy z połączeniem z bazą danych
**Objawy:**
- Aplikacja nie może połączyć się z bazą danych
- Błędy przekroczenia czasu połączenia

**Rozwiązania:**
```bash
# 1. Sprawdź reguły zapory bazy danych
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Przetestuj połączenie z aplikacji
# Dodaj tymczasowo do swojej aplikacji:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Zweryfikuj format ciągu połączenia
azd env get-values | grep DATABASE

# 4. Sprawdź stan serwera bazy danych
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemy z konfiguracją

### Problem: Zmienne środowiskowe nie działają
**Objawy:**
- Aplikacja nie odczytuje wartości konfiguracyjnych
- Zmienne środowiskowe wydają się puste

**Rozwiązania:**
```bash
# 1. Sprawdź, czy zmienne środowiskowe są ustawione
azd env get-values
azd env get DATABASE_URL

# 2. Sprawdź nazwy zmiennych w pliku azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Uruchom ponownie aplikację
azd deploy --service web

# 4. Sprawdź konfigurację usługi App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: Problemy z certyfikatami SSL/TLS
**Objawy:**
- HTTPS nie działa
- Błędy walidacji certyfikatu

**Rozwiązania:**
```bash
# 1. Sprawdź stan certyfikatu SSL
az webapp config ssl list --resource-group myrg

# 2. Włącz tylko HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Dodaj niestandardową domenę (jeśli to konieczne)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemy z konfiguracją CORS
**Objawy:**
- Frontend nie może wywołać API
- Zapytanie cross-origin zablokowane

**Rozwiązania:**
```bash
# 1. Skonfiguruj CORS dla App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Zaktualizuj API, aby obsługiwało CORS
# W Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Sprawdź, czy działa na poprawnych adresach URL
azd show
```

## 🌍 Problemy z zarządzaniem środowiskiem

### Problem: Problemy ze zmianą środowiska
**Objawy:**
- Używane jest niewłaściwe środowisko
- Konfiguracja nie przełącza się poprawnie

**Rozwiązania:**
```bash
# 1. Wypisz wszystkie środowiska
azd env list

# 2. Wyraźnie wybierz środowisko
azd env select production

# 3. Zweryfikuj bieżące środowisko
azd env show

# 4. Utwórz nowe środowisko, jeśli jest uszkodzone
azd env new production-new
azd env select production-new
```

### Problem: Uszkodzenie środowiska
**Objawy:**
- Środowisko pokazuje nieprawidłowy stan
- Zasoby nie zgadzają się z konfiguracją

**Rozwiązania:**
```bash
# 1. Odśwież stan środowiska
azd env refresh

# 2. Zresetuj konfigurację środowiska
azd env new production-reset
# Skopiuj wymagane zmienne środowiskowe
azd env set DATABASE_URL "your-value"

# 3. Zaimportuj istniejące zasoby (jeśli to możliwe)
# Ręcznie zaktualizuj .azure/production/config.json o identyfikatory zasobów
```

## 🔍 Problemy z wydajnością

### Problem: Wolne czasy wdrożeń
**Objawy:**
- Wdrożenia trwają zbyt długo
- Przekroczenia czasu podczas wdrożenia

**Rozwiązania:**
```bash
# 1. Wdrażaj konkretne usługi dla szybszej iteracji
azd deploy --service web
azd deploy --service api

# 2. Używaj tylko wdrożenia kodu, gdy infrastruktura pozostaje niezmieniona
azd deploy  # Szybsze niż azd up

# 3. Optymalizuj proces budowania
# W pliku package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Sprawdź lokalizacje zasobów (użyj tego samego regionu)
azd config set defaults.location eastus2
```

### Problem: Problemy z wydajnością aplikacji
**Objawy:**
- Wolne czasy odpowiedzi
- Wysokie zużycie zasobów

**Rozwiązania:**
```bash
# 1. Zwiększ skalę zasobów
# Zaktualizuj SKU w main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Włącz monitorowanie Application Insights
azd monitor --overview

# 3. Sprawdź logi aplikacji w Azure
az webapp log tail --name myapp --resource-group myrg
# lub dla Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Wdróż buforowanie
# Dodaj pamięć podręczną Redis do swojej infrastruktury
```

## 🛠️ Narzędzia i polecenia do rozwiązywania problemów

### Polecenia debugujące
```bash
# Kompleksowe debugowanie
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Sprawdź wersję azd
azd version

# Wyświetl bieżącą konfigurację
azd config list

# Przetestuj łączność
curl -v https://myapp.azurewebsites.net/health
```

### Analiza logów
```bash
# Logi aplikacji za pomocą Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitoruj aplikację za pomocą azd
azd monitor --logs
azd monitor --live

# Logi zasobów Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Logi kontenerów (dla Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Badanie zasobów
```bash
# Wyświetl wszystkie zasoby
az resource list --resource-group myrg -o table

# Sprawdź status zasobu
az webapp show --name myapp --resource-group myrg --query state

# Diagnostyka sieci
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Uzyskiwanie dodatkowej pomocy

### Kiedy eskalować
- Problemy z uwierzytelnianiem utrzymują się po wypróbowaniu wszystkich rozwiązań
- Problemy z infrastrukturą dotyczące usług Azure
- Problemy związane z rozliczeniami lub subskrypcją
- Zagadnienia związane z bezpieczeństwem lub incydenty

### Kanały wsparcia
```bash
# 1. Sprawdź stan usługi Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Utwórz zgłoszenie do wsparcia Azure
# Przejdź do: https://portal.azure.com -> Pomoc i obsługa

# 3. Zasoby społeczności
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacje do zebrania
Przed skontaktowaniem się ze wsparciem, zbierz:
- `azd version` (wyjście)
- `azd config list` (wyjście)
- `azd show` (wyjście; bieżący status wdrożenia)
- Komunikaty o błędach (pełny tekst)
- Kroki do odtworzenia problemu
- Szczegóły środowiska (`azd env show`)
- Oś czasu, kiedy problem się rozpoczął

### Skrypt zbierania logów
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Zapobieganie problemom

### Lista kontrolna przed wdrożeniem
```bash
# 1. Zweryfikuj uwierzytelnianie
az account show

# 2. Sprawdź limity i kwoty
az vm list-usage --location eastus2

# 3. Zweryfikuj szablony
az bicep build --file infra/main.bicep

# 4. Najpierw przetestuj lokalnie
npm run build
npm run test

# 5. Używaj wdrożeń w trybie symulacji
azd provision --preview
```

### Konfiguracja monitorowania
```bash
# Włącz Application Insights
# Dodaj do main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Skonfiguruj alerty
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regularna konserwacja
```bash
# Cotygodniowe kontrole stanu
./scripts/health-check.sh

# Miesięczny przegląd kosztów
az consumption usage list --billing-period-name 202401

# Kwartalny przegląd bezpieczeństwa
az security assessment list --resource-group myrg
```

## Powiązane zasoby

- [Przewodnik po debugowaniu](debugging.md) - Zaawansowane techniki debugowania
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Rozwiązywanie problemów z infrastrukturą
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Wskazówki dotyczące planowania zasobów
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Rekomendacje dotyczące poziomów usług

---

**Wskazówka**: Dodaj ten przewodnik do zakładek i odwołuj się do niego, gdy napotkasz problemy. Większość problemów była już wcześniej spotykana i ma ustalone rozwiązania!

---

**Nawigacja**
- **Poprzednia lekcja**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Następna lekcja**: [Przewodnik po debugowaniu](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI Co-op Translator (https://github.com/Azure/co-op-translator). Dokładamy starań, aby tłumaczenie było wierne, jednak prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako wersję autorytatywną. W przypadku informacji istotnych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->