# Typowe problemy i rozwiązania

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni rozdział**: [Rozdział 6: Kontrole przed wdrożeniem](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Następny**: [Przewodnik po debugowaniu](debugging.md)
- **🚀 Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i przedsiębiorcze](../chapter-08-production/production-ai-practices.md)

## Wprowadzenie

Ten kompleksowy przewodnik po rozwiązywaniu problemów obejmuje najczęściej występujące problemy podczas używania Azure Developer CLI. Naucz się diagnozować, rozwiązywać problemy i usuwać typowe błędy związane z uwierzytelnianiem, wdrażaniem, provisionowaniem infrastruktury i konfiguracją aplikacji. Każdy problem zawiera szczegółowe objawy, przyczyny źródłowe oraz instrukcje krok po kroku, jak go rozwiązać.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Mistrzem technik diagnostycznych dla problemów Azure Developer CLI
- Rozumiał najczęstsze problemy z uwierzytelnianiem i uprawnieniami oraz ich rozwiązania
- Potrafił rozwiązać awarie wdrożenia, błędy provisionowania infrastruktury i problemy konfiguracyjne
- Wdrażał proaktywne monitorowanie i strategie debugowania
- Stosował systematyczne metody rozwiązywania złożonych problemów
- Konfigurował odpowiednie logowanie i monitorowanie, aby zapobiegać przyszłym problemom

## Efekty nauki

Po ukończeniu będziesz potrafił:
- Diagnozować problemy z Azure Developer CLI używając wbudowanych narzędzi diagnostycznych
- Samodzielnie rozwiązywać problemy związane z uwierzytelnianiem, subskrypcją i uprawnieniami
- Skutecznie rozwiązywać awarie wdrożenia i błędy provisionowania infrastruktury
- Debugować problemy z konfiguracją aplikacji i środowiskiem
- Wdrażać monitorowanie i alerty, aby proaktywnie identyfikować potencjalne problemy
- Stosować najlepsze praktyki w zakresie logowania, debugowania i procesów rozwiązywania problemów

## Szybka diagnostyka

Przed przejściem do konkretnych problemów, uruchom te polecenia, aby zgromadzić informacje diagnostyczne:

```bash
# Sprawdź wersję i stan azd
azd version
azd config show

# Zweryfikuj uwierzytelnianie Azure
az account show
az account list

# Sprawdź bieżące środowisko
azd env list
azd env get-values

# Włącz debugowanie logów
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
# 1. Ponownie uwierzytelnij się przy użyciu Azure CLI
az login
az account show

# 2. Wyczyść pamięć podręczną poświadczeń
az account clear
az login

# 3. Użyj przepływu kodu urządzenia (dla systemów bez interfejsu)
az login --use-device-code

# 4. Ustaw wyraźnie subskrypcję
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Niewystarczające uprawnienia" podczas wdrożenia
**Objawy:**
- Wdrożenie nie powiodło się z powodu błędów uprawnień
- Nie można utworzyć niektórych zasobów Azure

**Rozwiązania:**
```bash
# 1. Sprawdź swoje przypisania ról w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Upewnij się, że masz wymagane role
# - Współtwórca (do tworzenia zasobów)
# - Administrator dostępu użytkownika (do przypisywania ról)

# 3. Skontaktuj się z administratorem Azure w celu uzyskania odpowiednich uprawnień
```

### Problem: Problemy z uwierzytelnianiem wielodostępnym
**Rozwiązania:**
```bash
# 1. Zaloguj się za pomocą konkretnego najemcy
az login --tenant "your-tenant-id"

# 2. Ustaw najemcę w konfiguracji
azd config set auth.tenantId "your-tenant-id"

# 3. Wyczyść pamięć podręczną najemcy, jeśli następuje zmiana najemcy
az account clear
```

## 🏗️ Błędy provisionowania infrastruktury

### Problem: Konflikty nazw zasobów
**Objawy:**
- Błędy "Nazwa zasobu już istnieje"
- Wdrożenie kończy się niepowodzeniem podczas tworzenia zasobu

**Rozwiązania:**
```bash
# 1. Używaj unikalnych nazw zasobów z tokenami
# W twoim szablonie Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Zmień nazwę środowiska
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Posprzątaj istniejące zasoby
azd down --force --purge
```

### Problem: Lokalizacja/region niedostępny
**Objawy:**
- "Lokalizacja 'xyz' niedostępna dla typu zasobu"
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

### Problem: Przekroczony limit kwot
**Objawy:**
- "Przekroczono limit dla typu zasobu"
- "Osiągnięto maksymalną liczbę zasobów"

**Rozwiązania:**
```bash
# 1. Sprawdź bieżące wykorzystanie limitu
az vm list-usage --location eastus2 -o table

# 2. Zgłoś wniosek o zwiększenie limitu przez portal Azure
# Przejdź do: Subscriptions > Usage + quotas

# 3. Używaj mniejszych SKU do celów rozwojowych
# W main.parameters.json:
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
- Niepowodzenia walidacji szablonów
- Błędy składni w plikach Bicep

**Rozwiązania:**
```bash
# 1. Sprawdź składnię Bicep
az bicep build --file infra/main.bicep

# 2. Użyj lintera Bicep
az bicep lint --file infra/main.bicep

# 3. Sprawdź składnię pliku parametrów
cat infra/main.parameters.json | jq '.'

# 4. Podejrzyj zmiany wdrożenia
azd provision --preview
```

## 🚀 Niepowodzenia wdrożenia

### Problem: Niepowodzenia budowy
**Objawy:**
- Aplikacja nie buduje się podczas wdrożenia
- Błędy podczas instalacji pakietów

**Rozwiązania:**
```bash
# 1. Sprawdź wynik kompilacji z flagą debugowania
azd deploy --service web --debug

# 2. Sprawdź status uruchomionej usługi
azd show

# 3. Testuj kompilację lokalnie
cd src/web
npm install
npm run build

# 3. Sprawdź kompatybilność wersji Node.js/Pythona
node --version  # Powinno odpowiadać ustawieniom azure.yaml
python --version

# 4. Wyczyść pamięć podręczną kompilacji
rm -rf node_modules package-lock.json
npm install

# 5. Sprawdź Dockerfile, jeśli używasz kontenerów
docker build -t test-image .
docker run --rm test-image
```

### Problem: Niepowodzenia wdrożenia kontenerów
**Objawy:**
- Aplikacje kontenerowe nie uruchamiają się
- Błędy pobierania obrazów

**Rozwiązania:**
```bash
# 1. Przetestuj lokalnie build Dockera
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Sprawdź logi kontenera za pomocą Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitoruj aplikację przez azd
azd monitor --logs

# 3. Zweryfikuj dostęp do rejestru kontenerów
az acr login --name myregistry

# 4. Sprawdź konfigurację aplikacji kontenera
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Niepowodzenia połączenia z bazą danych
**Objawy:**
- Aplikacja nie może połączyć się z bazą danych
- Błędy przekroczenia czasu połączenia

**Rozwiązania:**
```bash
# 1. Sprawdź reguły zapory bazy danych
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Przetestuj łączność z aplikacji
# Dodaj tymczasowo do swojej aplikacji:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Zweryfikuj format ciągu połączenia
azd env get-values | grep DATABASE

# 4. Sprawdź status serwera bazy danych
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemy konfiguracyjne

### Problem: Zmienne środowiskowe nie działają
**Objawy:**
- Aplikacja nie odczytuje wartości konfiguracyjnych
- Zmienne środowiskowe są puste

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
- Błędy walidacji certyfikatów

**Rozwiązania:**
```bash
# 1. Sprawdź status certyfikatu SSL
az webapp config ssl list --resource-group myrg

# 2. Włącz tylko HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Dodaj niestandardową domenę (jeśli potrzebna)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemy z konfiguracją CORS
**Objawy:**
- Frontend nie może wywołać API
- Blokada żądania międzydomenowego

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
- Konfiguracja nie zmienia się prawidłowo

**Rozwiązania:**
```bash
# 1. Wyświetl wszystkie środowiska
azd env list

# 2. Wyraźnie wybierz środowisko
azd env select production

# 3. Sprawdź bieżące środowisko
azd env list

# 4. Utwórz nowe środowisko, jeśli obecne jest uszkodzone
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
# Ręcznie zaktualizuj plik .azure/production/config.json o identyfikatory zasobów
```

## 🔍 Problemy z wydajnością

### Problem: Powolne wdrożenia
**Objawy:**
- Wdrożenia trwają zbyt długo
- Przekroczenia czasów podczas wdrożenia

**Rozwiązania:**
```bash
# 1. Wdrażaj konkretne usługi dla szybszej iteracji
azd deploy --service web
azd deploy --service api

# 2. Używaj wdrożenia tylko kodu, gdy infrastruktura nie uległa zmianie
azd deploy  # Szybsze niż azd up

# 3. Optymalizuj proces budowy
# W package.json:
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
azd config show

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
# Wypisz wszystkie zasoby
az resource list --resource-group myrg -o table

# Sprawdź status zasobu
az webapp show --name myapp --resource-group myrg --query state

# Diagnostyka sieci
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Uzyskiwanie dodatkowej pomocy

### Kiedy eskalować
- Problemy z uwierzytelnianiem utrzymują się po wypróbowaniu wszystkich rozwiązań
- Problemy z infrastrukturą usług Azure
- Problemy z rozliczeniami lub subskrypcją
- Obawy lub incydenty związane z bezpieczeństwem

### Kanały wsparcia
```bash
# 1. Sprawdź stan usługi Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Utwórz zgłoszenie do pomocy technicznej Azure
# Przejdź do: https://portal.azure.com -> Pomoc + wsparcie

# 3. Źródła społeczności
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacje do zebrania
Przed kontaktem z pomocą techniczną zbierz:
- wynik `azd version`
- wynik `azd config show`
- wynik `azd show` (aktualny status wdrożenia)
- komunikaty o błędach (pełny tekst)
- kroki do reprodukcji problemu
- szczegóły środowiska (`azd env get-values`)
- oś czasu wystąpienia problemu

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
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

# 5. Użyj wdrożeń próbnych (dry-run)
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

# kwartalny przegląd bezpieczeństwa
az security assessment list --resource-group myrg
```

## Powiązane zasoby

- [Przewodnik po debugowaniu](debugging.md) - Zaawansowane techniki debugowania
- [Provisionowanie zasobów](../chapter-04-infrastructure/provisioning.md) - Rozwiązywanie problemów z infrastrukturą
- [Planowanie pojemności](../chapter-06-pre-deployment/capacity-planning.md) - Wskazówki dotyczące planowania zasobów
- [Wybór SKU](../chapter-06-pre-deployment/sku-selection.md) - Rekomendacje dotyczące poziomów usług

---

**Wskazówka**: Zachowaj ten przewodnik w zakładkach i odwołuj się do niego za każdym razem, gdy napotkasz problemy. Większość problemów była już wcześniej zgłaszana i posiada ustalone rozwiązania!

---

**Nawigacja**
- **Poprzednia lekcja**: [Provisionowanie zasobów](../chapter-04-infrastructure/provisioning.md)
- **Następna lekcja**: [Przewodnik po debugowaniu](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było wierne, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego rodzimym języku należy uważać za źródło autorytatywne. W przypadku istotnych informacji zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->