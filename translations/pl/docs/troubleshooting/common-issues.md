<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-20T00:25:39+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "pl"
}
-->
# Typowe Problemy i Rozwiązania

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni rozdział**: [Rozdział 6: Kontrole przed wdrożeniem](../pre-deployment/preflight-checks.md)
- **➡️ Następny**: [Przewodnik debugowania](debugging.md)
- **🚀 Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../microsoft-foundry/production-ai-practices.md)

## Wprowadzenie

Ten kompleksowy przewodnik po rozwiązywaniu problemów obejmuje najczęściej spotykane trudności podczas korzystania z Azure Developer CLI. Dowiedz się, jak diagnozować, rozwiązywać i eliminować typowe problemy związane z uwierzytelnianiem, wdrożeniem, tworzeniem infrastruktury i konfiguracją aplikacji. Każdy problem zawiera szczegółowe objawy, przyczyny oraz krok po kroku opisane procedury rozwiązania.

## Cele nauki

Po ukończeniu tego przewodnika będziesz w stanie:
- Opanować techniki diagnostyczne dla problemów z Azure Developer CLI
- Zrozumieć typowe problemy z uwierzytelnianiem i uprawnieniami oraz ich rozwiązania
- Rozwiązywać problemy z wdrożeniem, błędy w tworzeniu infrastruktury i problemy z konfiguracją
- Wdrażać proaktywne strategie monitorowania i debugowania
- Stosować systematyczne metody rozwiązywania złożonych problemów
- Konfigurować odpowiednie logowanie i monitorowanie, aby zapobiegać przyszłym problemom

## Rezultaty nauki

Po ukończeniu będziesz w stanie:
- Diagnozować problemy z Azure Developer CLI za pomocą wbudowanych narzędzi diagnostycznych
- Samodzielnie rozwiązywać problemy związane z uwierzytelnianiem, subskrypcjami i uprawnieniami
- Skutecznie rozwiązywać problemy z wdrożeniem i błędy w tworzeniu infrastruktury
- Debugować problemy z konfiguracją aplikacji i specyficzne dla środowiska
- Wdrażać monitorowanie i alerty, aby proaktywnie identyfikować potencjalne problemy
- Stosować najlepsze praktyki w zakresie logowania, debugowania i rozwiązywania problemów

## Szybka diagnostyka

Zanim przejdziesz do konkretnych problemów, uruchom te polecenia, aby zebrać informacje diagnostyczne:

```bash
# Sprawdź wersję azd i stan zdrowia
azd version
azd config list

# Zweryfikuj uwierzytelnianie Azure
az account show
az account list

# Sprawdź bieżące środowisko
azd env show
azd env get-values

# Włącz rejestrowanie debugowania
export AZD_DEBUG=true
azd <command> --debug
```

## Problemy z uwierzytelnianiem

### Problem: "Nie udało się uzyskać tokenu dostępu"
**Objawy:**
- `azd up` kończy się błędami uwierzytelniania
- Polecenia zwracają "nieautoryzowany" lub "odmowa dostępu"

**Rozwiązania:**
```bash
# 1. Ponownie uwierzytelnij się za pomocą Azure CLI
az login
az account show

# 2. Wyczyść zapisane w pamięci podręcznej dane uwierzytelniające
az account clear
az login

# 3. Użyj przepływu kodu urządzenia (dla systemów bez interfejsu graficznego)
az login --use-device-code

# 4. Ustaw konkretną subskrypcję
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Niewystarczające uprawnienia" podczas wdrożenia
**Objawy:**
- Wdrożenie kończy się błędami uprawnień
- Nie można utworzyć określonych zasobów Azure

**Rozwiązania:**
```bash
# 1. Sprawdź swoje przypisania ról w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Upewnij się, że masz wymagane role
# - Współtwórca (do tworzenia zasobów)
# - Administrator dostępu użytkownika (do przypisywania ról)

# 3. Skontaktuj się z administratorem Azure w celu uzyskania odpowiednich uprawnień
```

### Problem: Problemy z uwierzytelnianiem w środowisku wielodomenowym
**Rozwiązania:**
```bash
# 1. Zaloguj się z określonym najemcą
az login --tenant "your-tenant-id"

# 2. Ustaw najemcę w konfiguracji
azd config set auth.tenantId "your-tenant-id"

# 3. Wyczyść pamięć podręczną najemcy, jeśli zmieniasz najemców
az account clear
```

## 🏗️ Błędy w tworzeniu infrastruktury

### Problem: Konflikty nazw zasobów
**Objawy:**
- Błędy "Nazwa zasobu już istnieje"
- Wdrożenie kończy się niepowodzeniem podczas tworzenia zasobów

**Rozwiązania:**
```bash
# 1. Użyj unikalnych nazw zasobów z tokenami
# W swoim szablonie Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Zmień nazwę środowiska
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Usuń istniejące zasoby
azd down --force --purge
```

### Problem: Lokalizacja/region niedostępny
**Objawy:**
- "Lokalizacja 'xyz' nie jest dostępna dla typu zasobu"
- Niektóre SKU niedostępne w wybranym regionie

**Rozwiązania:**
```bash
# 1. Sprawdź dostępne lokalizacje dla typów zasobów
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Użyj powszechnie dostępnych regionów
azd config set defaults.location eastus2
# lub
azd env set AZURE_LOCATION eastus2

# 3. Sprawdź dostępność usługi według regionu
# Odwiedź: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Przekroczone limity
**Objawy:**
- "Przekroczono limit dla typu zasobu"
- "Osiągnięto maksymalną liczbę zasobów"

**Rozwiązania:**
```bash
# 1. Sprawdź bieżące wykorzystanie limitu
az vm list-usage --location eastus2 -o table

# 2. Poproś o zwiększenie limitu przez portal Azure
# Przejdź do: Subskrypcje > Użycie + limity

# 3. Użyj mniejszych SKU do rozwoju
# W main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Usuń nieużywane zasoby
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Błędy w szablonach Bicep
**Objawy:**
- Niepowodzenia walidacji szablonów
- Błędy składni w plikach Bicep

**Rozwiązania:**
```bash
# 1. Zweryfikuj składnię Bicep
az bicep build --file infra/main.bicep

# 2. Użyj lintera Bicep
az bicep lint --file infra/main.bicep

# 3. Sprawdź składnię pliku parametrów
cat infra/main.parameters.json | jq '.'

# 4. Podgląd zmian wdrożenia
azd provision --preview
```

## 🚀 Problemy z wdrożeniem

### Problem: Błędy kompilacji
**Objawy:**
- Aplikacja nie kompiluje się podczas wdrożenia
- Błędy instalacji pakietów

**Rozwiązania:**
```bash
# 1. Sprawdź logi kompilacji
azd logs --service web
azd deploy --service web --debug

# 2. Przetestuj kompilację lokalnie
cd src/web
npm install
npm run build

# 3. Sprawdź zgodność wersji Node.js/Python
node --version  # Powinno pasować do ustawień azure.yaml
python --version

# 4. Wyczyść pamięć podręczną kompilacji
rm -rf node_modules package-lock.json
npm install

# 5. Sprawdź plik Dockerfile, jeśli używasz kontenerów
docker build -t test-image .
docker run --rm test-image
```

### Problem: Problemy z wdrożeniem kontenerów
**Objawy:**
- Aplikacje kontenerowe nie uruchamiają się
- Błędy pobierania obrazów

**Rozwiązania:**
```bash
# 1. Przetestuj lokalnie budowanie Dockera
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Sprawdź logi kontenera
azd logs --service api --follow

# 3. Zweryfikuj dostęp do rejestru kontenerów
az acr login --name myregistry

# 4. Sprawdź konfigurację aplikacji kontenera
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Problemy z połączeniem z bazą danych
**Objawy:**
- Aplikacja nie może połączyć się z bazą danych
- Błędy przekroczenia czasu połączenia

**Rozwiązania:**
```bash
# 1. Sprawdź zasady zapory bazy danych
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Przetestuj łączność z aplikacji
# Dodaj tymczasowo do swojej aplikacji:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Zweryfikuj format ciągu połączenia
azd env get-values | grep DATABASE

# 4. Sprawdź status serwera bazy danych
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemy z konfiguracją

### Problem: Zmienne środowiskowe nie działają
**Objawy:**
- Aplikacja nie może odczytać wartości konfiguracji
- Zmienne środowiskowe wydają się puste

**Rozwiązania:**
```bash
# 1. Zweryfikuj, czy zmienne środowiskowe są ustawione
azd env get-values
azd env get DATABASE_URL

# 2. Sprawdź nazwy zmiennych w azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Uruchom ponownie aplikację
azd deploy --service web

# 4. Sprawdź konfigurację usługi aplikacji
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: Problemy z certyfikatami SSL/TLS
**Objawy:**
- HTTPS nie działa
- Błędy walidacji certyfikatu

**Rozwiązania:**
```bash
# 1. Sprawdź status certyfikatu SSL
az webapp config ssl list --resource-group myrg

# 2. Włącz tylko HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Dodaj niestandardową domenę (jeśli potrzebne)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemy z konfiguracją CORS
**Objawy:**
- Frontend nie może wywołać API
- Żądanie cross-origin zablokowane

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

### Problem: Problemy z przełączaniem środowisk
**Objawy:**
- Używane jest niewłaściwe środowisko
- Konfiguracja nie zmienia się poprawnie

**Rozwiązania:**
```bash
# 1. Wymień wszystkie środowiska
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
- Zasoby nie odpowiadają konfiguracji

**Rozwiązania:**
```bash
# 1. Odśwież stan środowiska
azd env refresh

# 2. Zresetuj konfigurację środowiska
azd env new production-reset
# Skopiuj wymagane zmienne środowiskowe
azd env set DATABASE_URL "your-value"

# 3. Zaimportuj istniejące zasoby (jeśli to możliwe)
# Ręcznie zaktualizuj .azure/production/config.json z identyfikatorami zasobów
```

## 🔍 Problemy z wydajnością

### Problem: Wolne czasy wdrożenia
**Objawy:**
- Wdrożenia trwają zbyt długo
- Przekroczenia czasu podczas wdrożenia

**Rozwiązania:**
```bash
# 1. Włącz równoległe wdrażanie
azd config set deploy.parallelism 5

# 2. Użyj wdrożeń przyrostowych
azd deploy --incremental

# 3. Optymalizuj proces budowania
# W pliku package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Sprawdź lokalizacje zasobów (używaj tego samego regionu)
azd config set defaults.location eastus2
```

### Problem: Problemy z wydajnością aplikacji
**Objawy:**
- Wolne czasy odpowiedzi
- Wysokie zużycie zasobów

**Rozwiązania:**
```bash
# 1. Zwiększ zasoby
# Zaktualizuj SKU w main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Włącz monitorowanie Application Insights
azd monitor

# 3. Sprawdź logi aplikacji pod kątem wąskich gardeł
azd logs --service api --follow

# 4. Wdróż buforowanie
# Dodaj pamięć podręczną Redis do swojej infrastruktury
```

## 🛠️ Narzędzia i polecenia do rozwiązywania problemów

### Polecenia debugowania
```bash
# Kompleksowe debugowanie
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Sprawdź informacje o systemie
azd info

# Zweryfikuj konfigurację
azd config validate

# Przetestuj łączność
curl -v https://myapp.azurewebsites.net/health
```

### Analiza logów
```bash
# Dzienniki aplikacji
azd logs --service web --follow
azd logs --service api --since 1h

# Dzienniki zasobów Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Dzienniki kontenerów (dla aplikacji kontenerowych)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Badanie zasobów
```bash
# Wymień wszystkie zasoby
az resource list --resource-group myrg -o table

# Sprawdź status zasobu
az webapp show --name myapp --resource-group myrg --query state

# Diagnostyka sieciowa
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Uzyskiwanie dodatkowej pomocy

### Kiedy eskalować
- Problemy z uwierzytelnianiem utrzymują się po wypróbowaniu wszystkich rozwiązań
- Problemy z infrastrukturą usług Azure
- Problemy związane z rozliczeniami lub subskrypcjami
- Obawy dotyczące bezpieczeństwa lub incydenty

### Kanały wsparcia
```bash
# 1. Sprawdź stan usługi Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Utwórz zgłoszenie do wsparcia Azure
# Przejdź do: https://portal.azure.com -> Pomoc + wsparcie

# 3. Zasoby społeczności
# - Stack Overflow: tag azure-developer-cli
# - Problemy GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacje do zebrania
Przed skontaktowaniem się z pomocą techniczną, zbierz:
- Wynik `azd version`
- Wynik `azd info`
- Komunikaty o błędach (pełny tekst)
- Kroki do odtworzenia problemu
- Szczegóły środowiska (`azd env show`)
- Oś czasu, kiedy problem się pojawił

### Skrypt do zbierania logów
```bash
#!/bin/bash
# zbierz-informacje-debugowania.sh

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

# 5. Użyj wdrożeń testowych (dry-run)
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
# Cotygodniowe kontrole zdrowia
./scripts/health-check.sh

# Miesięczny przegląd kosztów
az consumption usage list --billing-period-name 202401

# Kwartalny przegląd bezpieczeństwa
az security assessment list --resource-group myrg
```

## Powiązane zasoby

- [Przewodnik debugowania](debugging.md) - Zaawansowane techniki debugowania
- [Tworzenie zasobów](../deployment/provisioning.md) - Rozwiązywanie problemów z infrastrukturą
- [Planowanie pojemności](../pre-deployment/capacity-planning.md) - Wskazówki dotyczące planowania zasobów
- [Wybór SKU](../pre-deployment/sku-selection.md) - Rekomendacje dotyczące poziomów usług

---

**Wskazówka**: Zapisz ten przewodnik w zakładkach i korzystaj z niego, gdy napotkasz problemy. Większość problemów była już wcześniej spotykana i ma ustalone rozwiązania!

---

**Nawigacja**
- **Poprzednia lekcja**: [Tworzenie zasobów](../deployment/provisioning.md)
- **Następna lekcja**: [Przewodnik debugowania](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->