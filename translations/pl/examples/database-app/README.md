# Wdrażanie bazy danych Microsoft SQL i aplikacji webowej za pomocą AZD

⏱️ **Szacowany czas**: 20-30 minut | 💰 **Szacowany koszt**: ~15-25 USD/miesiąc | ⭐ **Poziom trudności**: Średniozaawansowany

Ten **kompletny, działający przykład** pokazuje, jak użyć [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) do wdrożenia aplikacji webowej Python Flask z bazą danych Microsoft SQL na platformie Azure. Wszystkie kody są zawarte i przetestowane — brak zewnętrznych zależności.

## Czego się nauczysz

Realizując ten przykład, dowiesz się:
- Jak wdrożyć aplikację wielowarstwową (aplikacja webowa + baza danych) za pomocą infrastruktury jako kodu
- Jak skonfigurować bezpieczne połączenia z bazą danych bez twardego kodowania sekretów
- Jak monitorować stan aplikacji za pomocą Application Insights
- Jak efektywnie zarządzać zasobami Azure za pomocą AZD CLI
- Jak stosować najlepsze praktyki Azure w zakresie bezpieczeństwa, optymalizacji kosztów i obserwowalności

## Przegląd scenariusza
- **Aplikacja webowa**: REST API Python Flask z połączeniem z bazą danych
- **Baza danych**: Azure SQL Database z przykładowymi danymi
- **Infrastruktura**: Tworzona za pomocą Bicep (modularne, wielokrotnego użytku szablony)
- **Wdrożenie**: W pełni zautomatyzowane za pomocą poleceń `azd`
- **Monitorowanie**: Application Insights do logów i telemetrii

## Wymagania wstępne

### Wymagane narzędzia

Przed rozpoczęciem upewnij się, że masz zainstalowane następujące narzędzia:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (wersja 2.50.0 lub wyższa)
   ```sh
   az --version
   # Oczekiwany wynik: azure-cli 2.50.0 lub wyższy
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (wersja 1.0.0 lub wyższa)
   ```sh
   azd version
   # Oczekiwany wynik: wersja azd 1.0.0 lub wyższa
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (do lokalnego rozwoju)
   ```sh
   python --version
   # Oczekiwany wynik: Python 3.8 lub nowszy
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcjonalnie, do lokalnego rozwoju w kontenerach)
   ```sh
   docker --version
   # Oczekiwany wynik: wersja Dockera 20.10 lub wyższa
   ```

### Wymagania Azure

- Aktywna **subskrypcja Azure** ([utwórz darmowe konto](https://azure.microsoft.com/free/))
- Uprawnienia do tworzenia zasobów w subskrypcji
- Rola **Właściciel** lub **Współtwórca** w subskrypcji lub grupie zasobów

### Wymagania dotyczące wiedzy

To jest przykład na **średniozaawansowanym poziomie**. Powinieneś znać:
- Podstawowe operacje w wierszu poleceń
- Podstawowe koncepcje chmury (zasoby, grupy zasobów)
- Podstawy aplikacji webowych i baz danych

**Nowy w AZD?** Zacznij od [przewodnika wprowadzającego](../../docs/getting-started/azd-basics.md).

## Architektura

Ten przykład wdraża architekturę dwuwarstwową z aplikacją webową i bazą danych SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Wdrożenie zasobów:**
- **Grupa zasobów**: Kontener dla wszystkich zasobów
- **Plan App Service**: Hosting oparty na Linuxie (warstwa B1 dla oszczędności kosztów)
- **Aplikacja webowa**: Python 3.11 z aplikacją Flask
- **Serwer SQL**: Zarządzany serwer baz danych z minimalnym TLS 1.2
- **Baza danych SQL**: Podstawowa warstwa (2GB, odpowiednia do rozwoju/testów)
- **Application Insights**: Monitorowanie i logowanie
- **Log Analytics Workspace**: Centralne przechowywanie logów

**Analogicznie**: Wyobraź sobie to jak restaurację (aplikacja webowa) z zamrażarką (baza danych). Klienci zamawiają z menu (punkty końcowe API), a kuchnia (aplikacja Flask) pobiera składniki (dane) z zamrażarki. Kierownik restauracji (Application Insights) śledzi wszystko, co się dzieje.

## Struktura folderów

Wszystkie pliki są zawarte w tym przykładzie — brak zewnętrznych zależności:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Co robi każdy plik:**
- **azure.yaml**: Informuje AZD, co wdrożyć i gdzie
- **infra/main.bicep**: Orkiestruje wszystkie zasoby Azure
- **infra/resources/*.bicep**: Definicje poszczególnych zasobów (modularne, do ponownego użycia)
- **src/web/app.py**: Aplikacja Flask z logiką bazy danych
- **requirements.txt**: Zależności pakietów Python
- **Dockerfile**: Instrukcje konteneryzacji do wdrożenia

## Szybki start (krok po kroku)

### Krok 1: Klonowanie i nawigacja

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Sprawdzenie sukcesu**: Upewnij się, że widzisz `azure.yaml` i folder `infra/`:
```sh
ls
# Oczekiwane: README.md, azure.yaml, infra/, src/
```

### Krok 2: Uwierzytelnianie w Azure

```sh
azd auth login
```

Otwiera przeglądarkę do uwierzytelnienia w Azure. Zaloguj się swoimi poświadczeniami Azure.

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
```
Logged in to Azure.
```

### Krok 3: Inicjalizacja środowiska

```sh
azd init
```

**Co się dzieje**: AZD tworzy lokalną konfigurację dla Twojego wdrożenia.

**Pojawiające się pytania**:
- **Nazwa środowiska**: Wprowadź krótką nazwę (np. `dev`, `myapp`)
- **Subskrypcja Azure**: Wybierz swoją subskrypcję z listy
- **Lokalizacja Azure**: Wybierz region (np. `eastus`, `westeurope`)

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
```
SUCCESS: New project initialized!
```

### Krok 4: Tworzenie zasobów Azure

```sh
azd provision
```

**Co się dzieje**: AZD wdraża całą infrastrukturę (zajmuje 5-8 minut):
1. Tworzy grupę zasobów
2. Tworzy serwer SQL i bazę danych
3. Tworzy plan App Service
4. Tworzy aplikację webową
5. Tworzy Application Insights
6. Konfiguruje sieć i bezpieczeństwo

**Zostaniesz poproszony o**:
- **Nazwa administratora SQL**: Wprowadź nazwę użytkownika (np. `sqladmin`)
- **Hasło administratora SQL**: Wprowadź silne hasło (zapisz je!)

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Czas**: 5-8 minut

### Krok 5: Wdrożenie aplikacji

```sh
azd deploy
```

**Co się dzieje**: AZD buduje i wdraża Twoją aplikację Flask:
1. Pakietuje aplikację Python
2. Buduje kontener Docker
3. Wysyła do Azure Web App
4. Inicjalizuje bazę danych z przykładowymi danymi
5. Uruchamia aplikację

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Czas**: 3-5 minut

### Krok 6: Przeglądanie aplikacji

```sh
azd browse
```

Otwiera wdrożoną aplikację webową w przeglądarce pod adresem `https://app-<unique-id>.azurewebsites.net`

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć dane JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Krok 7: Testowanie punktów końcowych API

**Sprawdzenie zdrowia** (weryfikacja połączenia z bazą danych):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Oczekiwana odpowiedź**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Lista produktów** (przykładowe dane):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Oczekiwana odpowiedź**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Pobierz pojedynczy produkt**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Sprawdzenie sukcesu**: Wszystkie punkty końcowe zwracają dane JSON bez błędów.

---

**🎉 Gratulacje!** Pomyślnie wdrożyłeś aplikację webową z bazą danych na platformie Azure za pomocą AZD.

## Szczegóły konfiguracji

### Zmienne środowiskowe

Sekrety są zarządzane bezpiecznie za pomocą konfiguracji Azure App Service—**nigdy nie są twardo kodowane w kodzie źródłowym**.

**Automatycznie skonfigurowane przez AZD**:
- `SQL_CONNECTION_STRING`: Połączenie z bazą danych z zaszyfrowanymi poświadczeniami
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Punkt końcowy telemetrii monitorowania
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Włącza automatyczną instalację zależności

**Gdzie przechowywane są sekrety**:
1. Podczas `azd provision` podajesz poświadczenia SQL za pomocą bezpiecznych monitów
2. AZD przechowuje je w lokalnym pliku `.azure/<env-name>/.env` (ignorowany przez Git)
3. AZD wstrzykuje je do konfiguracji Azure App Service (zaszyfrowane w spoczynku)
4. Aplikacja odczytuje je za pomocą `os.getenv()` podczas działania

### Lokalny rozwój

Do lokalnych testów utwórz plik `.env` na podstawie przykładu:

```sh
cp .env.sample .env
# Edytuj .env z lokalnym połączeniem z bazą danych
```

**Przebieg lokalnego rozwoju**:
```sh
# Zainstaluj zależności
cd src/web
pip install -r requirements.txt

# Ustaw zmienne środowiskowe
export SQL_CONNECTION_STRING="your-local-connection-string"

# Uruchom aplikację
python app.py
```

**Testowanie lokalne**:
```sh
curl http://localhost:8000/health
# Oczekiwane: {"status": "zdrowy", "database": "połączony"}
```

### Infrastruktura jako kod

Wszystkie zasoby Azure są zdefiniowane w **szablonach Bicep** (folder `infra/`):

- **Modularny projekt**: Każdy typ zasobu ma własny plik do ponownego użycia
- **Parametryzowany**: Dostosowanie SKU, regionów, konwencji nazewnictwa
- **Najlepsze praktyki**: Zgodność z standardami nazewnictwa Azure i domyślnymi ustawieniami bezpieczeństwa
- **Kontrola wersji**: Zmiany infrastruktury są śledzone w Git

**Przykład dostosowania**:
Aby zmienić warstwę bazy danych, edytuj `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Najlepsze praktyki bezpieczeństwa

Ten przykład stosuje najlepsze praktyki bezpieczeństwa Azure:

### 1. **Brak sekretów w kodzie źródłowym**
- ✅ Poświadczenia przechowywane w konfiguracji Azure App Service (zaszyfrowane)
- ✅ Pliki `.env` wykluczone z Git za pomocą `.gitignore`
- ✅ Sekrety przekazywane za pomocą bezpiecznych parametrów podczas tworzenia

### 2. **Szyfrowane połączenia**
- ✅ Minimalny TLS 1.2 dla serwera SQL
- ✅ Wymuszone HTTPS dla aplikacji webowej
- ✅ Połączenia z bazą danych używają zaszyfrowanych kanałów

### 3. **Bezpieczeństwo sieci**
- ✅ Zapora serwera SQL skonfigurowana do zezwalania tylko usługom Azure
- ✅ Dostęp do sieci publicznej ograniczony (można dodatkowo zablokować za pomocą Private Endpoints)
- ✅ FTPS wyłączony w aplikacji webowej

### 4. **Uwierzytelnianie i autoryzacja**
- ⚠️ **Obecnie**: Uwierzytelnianie SQL (nazwa użytkownika/hasło)
- ✅ **Rekomendacja produkcyjna**: Użyj Azure Managed Identity do uwierzytelniania bez hasła

**Aby przejść na Managed Identity** (do produkcji):
1. Włącz Managed Identity w aplikacji webowej
2. Przyznaj tożsamości uprawnienia SQL
3. Zaktualizuj ciąg połączenia, aby używać Managed Identity
4. Usuń uwierzytelnianie oparte na hasłach

### 5. **Audyt i zgodność**
- ✅ Application Insights rejestruje wszystkie żądania i błędy
- ✅ Audyt bazy danych SQL włączony (można skonfigurować dla zgodności)
- ✅ Wszystkie zasoby oznaczone dla zarządzania

**Lista kontrolna bezpieczeństwa przed produkcją**:
- [ ] Włącz Azure Defender dla SQL
- [ ] Skonfiguruj Private Endpoints dla bazy danych SQL
- [ ] Włącz Web Application Firewall (WAF)
- [ ] Zaimplementuj Azure Key Vault do rotacji sekretów
- [ ] Skonfiguruj uwierzytelnianie Azure AD
- [ ] Włącz logowanie diagnostyczne dla wszystkich zasobów

## Optymalizacja kosztów

**Szacowane miesięczne koszty** (stan na listopad 2025):

| Zasób | SKU/Warstwa | Szacowany koszt |
|-------|-------------|-----------------|
| Plan App Service | B1 (Podstawowy) | ~13 USD/miesiąc |
| Baza danych SQL | Podstawowa (2GB) | ~5 USD/miesiąc |
| Application Insights | Pay-as-you-go | ~2 USD/miesiąc (niski ruch) |
| **Razem** | | **~20 USD/miesiąc** |

**💡 Wskazówki dotyczące oszczędności**:

1. **Używaj darmowej warstwy do nauki**:
   - App Service: Warstwa F1 (darmowa, ograniczone godziny)
   - Baza danych SQL: Użyj Azure SQL Database serverless
   - Application Insights: 5GB/miesiąc darmowego przesyłania danych

2. **Wyłącz zasoby, gdy nie są używane**:
   ```sh
   # Zatrzymaj aplikację internetową (baza danych nadal nalicza opłaty)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Uruchom ponownie, gdy będzie to potrzebne
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Usuń wszystko po testach**:
   ```sh
   azd down
   ```
   Usuwa WSZYSTKIE zasoby i zatrzymuje opłaty.

4. **Warstwy rozwoju vs. produkcji**:
   - **Rozwój**: Warstwa podstawowa (używana w tym przykładzie)
   - **Produkcja**: Warstwa standardowa/premium z redundancją

**Monitorowanie kosztów**:
- Przeglądaj koszty w [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Ustaw alerty kosztowe, aby uniknąć niespodzianek
- Oznacz wszystkie zasoby tagiem `azd-env-name` do śledzenia

**Alternatywa darmowej warstwy**:
Do celów nauki możesz zmodyfikować `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Uwaga**: Darmowa warstwa ma ograniczenia (60 min/dzień CPU, brak trybu always-on).

## Monitorowanie i obserwowalność

### Integracja Application Insights

Ten przykład zawiera **Application Insights** do kompleksowego monitorowania:

**Co jest monitorowane**:
- ✅ Żądania HTTP (opóźnienia, kody statusu, punkty końcowe)
- ✅ Błędy aplikacji i wyjątki
- ✅ Niestandardowe logowanie z aplikacji Flask
- ✅ Stan połączenia z bazą danych
- ✅ Metryki wydajności (CPU, pamięć)

**Dostęp do Application Insights**:
1. Otwórz [Azure Portal](https://portal.azure.com)
2. Przejdź do swojej grupy zasobów (`rg-<env-name>`)
3. Kliknij zasób Application Insights (`appi-<unique-id>`)

**Przydatne zapytania** (Application Insights → Logi):

**Wyświetl wszystkie żądania**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Znajdź błędy**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Sprawdź punkt końcowy zdrowia**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Audyt bazy danych SQL

**Audyt bazy danych SQL jest włączony**, aby śledzić:
- Wzorce dostępu do bazy danych
- Nieudane próby logowania
- Zmiany schematu
- Dostęp do danych (dla zgodności)

**Dostęp do logów audytu**:
1. Azure Portal → Baza danych SQL → Audyt
2. Przeglądaj logi w Log Analytics Workspace

### Monitorowanie w czasie rzeczywistym

**Wyświetl metryki na żywo**:
1. Application Insights → Live Metrics
2. Zobacz żądania, błędy i wydajność w czasie rzeczywistym

**Konfiguracja alertów**:
Utwórz alerty dla krytycznych zdarzeń:
- Błędy HTTP 500 > 5 w cią
- Długie czasy odpowiedzi (>2 sekundy)

**Przykład tworzenia alertu**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Rozwiązywanie problemów

### Typowe problemy i rozwiązania

#### 1. `azd provision` kończy się błędem "Location not available"

**Objaw**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Rozwiązanie**:
Wybierz inny region Azure lub zarejestruj dostawcę zasobów:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Problemy z połączeniem SQL podczas wdrażania

**Objaw**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Rozwiązanie**:
- Sprawdź, czy zapora SQL Server pozwala na usługi Azure (konfigurowane automatycznie)
- Upewnij się, że hasło administratora SQL zostało poprawnie wprowadzone podczas `azd provision`
- Upewnij się, że SQL Server jest w pełni wdrożony (może to zająć 2-3 minuty)

**Weryfikacja połączenia**:
```sh
# Z Azure Portal przejdź do SQL Database → Edytor zapytań
# Spróbuj połączyć się za pomocą swoich danych uwierzytelniających
```

#### 3. Aplikacja webowa pokazuje "Application Error"

**Objaw**:
Przeglądarka wyświetla ogólną stronę błędu.

**Rozwiązanie**:
Sprawdź logi aplikacji:
```sh
# Wyświetl ostatnie logi
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Typowe przyczyny**:
- Brakujące zmienne środowiskowe (sprawdź App Service → Konfiguracja)
- Nieudana instalacja pakietów Python (sprawdź logi wdrożenia)
- Błąd inicjalizacji bazy danych (sprawdź połączenie SQL)

#### 4. `azd deploy` kończy się błędem "Build Error"

**Objaw**:
```
Error: Failed to build project
```

**Rozwiązanie**:
- Upewnij się, że `requirements.txt` nie zawiera błędów składniowych
- Sprawdź, czy Python 3.11 jest określony w `infra/resources/web-app.bicep`
- Zweryfikuj, czy Dockerfile ma poprawny obraz bazowy

**Debugowanie lokalne**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" podczas uruchamiania poleceń AZD

**Objaw**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Rozwiązanie**:
Ponownie uwierzytelnij się w Azure:
```sh
azd auth login
az login
```

Sprawdź, czy masz odpowiednie uprawnienia (rola Contributor) w subskrypcji.

#### 6. Wysokie koszty bazy danych

**Objaw**:
Nieoczekiwany rachunek Azure.

**Rozwiązanie**:
- Sprawdź, czy zapomniałeś uruchomić `azd down` po testach
- Upewnij się, że baza danych SQL korzysta z poziomu Basic (nie Premium)
- Przejrzyj koszty w Azure Cost Management
- Skonfiguruj alerty kosztowe

### Uzyskiwanie pomocy

**Wyświetl wszystkie zmienne środowiskowe AZD**:
```sh
azd env get-values
```

**Sprawdź status wdrożenia**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Uzyskaj dostęp do logów aplikacji**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potrzebujesz więcej pomocy?**
- [AZD Troubleshooting Guide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Ćwiczenia praktyczne

### Ćwiczenie 1: Weryfikacja wdrożenia (Początkujący)

**Cel**: Potwierdź, że wszystkie zasoby zostały wdrożone i aplikacja działa.

**Kroki**:
1. Wylistuj wszystkie zasoby w swojej grupie zasobów:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Oczekiwane**: 6-7 zasobów (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Przetestuj wszystkie punkty końcowe API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Oczekiwane**: Wszystkie zwracają poprawny JSON bez błędów

3. Sprawdź Application Insights:
   - Przejdź do Application Insights w Azure Portal
   - Wejdź w "Live Metrics"
   - Odśwież przeglądarkę na aplikacji webowej
   **Oczekiwane**: Zobaczysz żądania pojawiające się w czasie rzeczywistym

**Kryteria sukcesu**: Wszystkie 6-7 zasobów istnieją, wszystkie punkty końcowe zwracają dane, Live Metrics pokazuje aktywność.

---

### Ćwiczenie 2: Dodanie nowego punktu końcowego API (Średniozaawansowany)

**Cel**: Rozszerz aplikację Flask o nowy punkt końcowy.

**Kod początkowy**: Obecne punkty końcowe w `src/web/app.py`

**Kroki**:
1. Edytuj `src/web/app.py` i dodaj nowy punkt końcowy po funkcji `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Wdróż zaktualizowaną aplikację:
   ```sh
   azd deploy
   ```

3. Przetestuj nowy punkt końcowy:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Oczekiwane**: Zwraca produkty pasujące do "laptop"

**Kryteria sukcesu**: Nowy punkt końcowy działa, zwraca przefiltrowane wyniki, pojawia się w logach Application Insights.

---

### Ćwiczenie 3: Dodanie monitoringu i alertów (Zaawansowany)

**Cel**: Skonfiguruj proaktywny monitoring z alertami.

**Kroki**:
1. Utwórz alert dla błędów HTTP 500:
   ```sh
   # Pobierz identyfikator zasobu Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Utwórz alert
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Wywołaj alert, powodując błędy:
   ```sh
   # Poproś o nieistniejący produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Sprawdź, czy alert został wywołany:
   - Azure Portal → Alerts → Alert Rules
   - Sprawdź swoją skrzynkę e-mail (jeśli skonfigurowano)

**Kryteria sukcesu**: Reguła alertu została utworzona, wywołuje się przy błędach, powiadomienia są otrzymywane.

---

### Ćwiczenie 4: Zmiany w schemacie bazy danych (Zaawansowany)

**Cel**: Dodaj nową tabelę i zmodyfikuj aplikację, aby z niej korzystała.

**Kroki**:
1. Połącz się z bazą danych SQL za pomocą Azure Portal Query Editor

2. Utwórz nową tabelę `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Zaktualizuj `src/web/app.py`, aby uwzględnić informacje o kategoriach w odpowiedziach

4. Wdróż i przetestuj

**Kryteria sukcesu**: Nowa tabela istnieje, produkty pokazują informacje o kategoriach, aplikacja nadal działa.

---

### Ćwiczenie 5: Implementacja cache'owania (Ekspert)

**Cel**: Dodaj Azure Redis Cache, aby poprawić wydajność.

**Kroki**:
1. Dodaj Redis Cache do `infra/main.bicep`
2. Zaktualizuj `src/web/app.py`, aby cache'ować zapytania o produkty
3. Zmierz poprawę wydajności za pomocą Application Insights
4. Porównaj czasy odpowiedzi przed/po cache'owaniu

**Kryteria sukcesu**: Redis jest wdrożony, cache'owanie działa, czasy odpowiedzi poprawiają się o >50%.

**Podpowiedź**: Zacznij od [dokumentacji Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Czyszczenie zasobów

Aby uniknąć dalszych opłat, usuń wszystkie zasoby po zakończeniu:

```sh
azd down
```

**Potwierdzenie**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Wpisz `y`, aby potwierdzić.

**✓ Sprawdzenie sukcesu**: 
- Wszystkie zasoby są usunięte z Azure Portal
- Brak dalszych opłat
- Lokalny folder `.azure/<env-name>` może zostać usunięty

**Alternatywa** (zachowaj infrastrukturę, usuń dane):
```sh
# Usuń tylko grupę zasobów (zachowaj konfigurację AZD)
az group delete --name rg-<env-name> --yes
```
## Dowiedz się więcej

### Powiązana dokumentacja
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacja Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentacja Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentacja Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referencja języka Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Kolejne kroki w tym kursie
- **[Przykład aplikacji kontenerowych](../../../../examples/container-app)**: Wdrażanie mikrousług z Azure Container Apps
- **[Przewodnik integracji AI](../../../../docs/ai-foundry)**: Dodaj funkcje AI do swojej aplikacji
- **[Najlepsze praktyki wdrożeniowe](../../docs/deployment/deployment-guide.md)**: Wzorce wdrożeniowe dla produkcji

### Tematy zaawansowane
- **Managed Identity**: Usuń hasła i używaj uwierzytelniania Azure AD
- **Private Endpoints**: Zabezpiecz połączenia z bazą danych w ramach sieci wirtualnej
- **Integracja CI/CD**: Automatyzuj wdrożenia za pomocą GitHub Actions lub Azure DevOps
- **Multi-Environment**: Skonfiguruj środowiska dev, staging i produkcyjne
- **Migracje bazy danych**: Użyj Alembic lub Entity Framework do wersjonowania schematów

### Porównanie z innymi podejściami

**AZD vs. ARM Templates**:
- ✅ AZD: Wyższy poziom abstrakcji, prostsze polecenia
- ⚠️ ARM: Bardziej szczegółowe, większa kontrola

**AZD vs. Terraform**:
- ✅ AZD: Natywne dla Azure, zintegrowane z usługami Azure
- ⚠️ Terraform: Obsługa wielu chmur, większy ekosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Powtarzalne, kontrolowane wersje, automatyzowalne
- ⚠️ Portal: Ręczne kliknięcia, trudne do odtworzenia

**Pomyśl o AZD jako**: Docker Compose dla Azure—uprości konfigurację dla złożonych wdrożeń.

---

## Najczęściej zadawane pytania

**P: Czy mogę użyć innego języka programowania?**  
O: Tak! Zamień `src/web/` na Node.js, C#, Go lub dowolny język. Zaktualizuj `azure.yaml` i Bicep odpowiednio.

**P: Jak dodać więcej baz danych?**  
O: Dodaj kolejny moduł SQL Database w `infra/main.bicep` lub użyj PostgreSQL/MySQL z usług baz danych Azure.

**P: Czy mogę używać tego w produkcji?**  
O: To jest punkt wyjścia. Dla produkcji dodaj: managed identity, private endpoints, redundancję, strategię backupu, WAF i zaawansowany monitoring.

**P: Co jeśli chcę używać kontenerów zamiast wdrożenia kodu?**  
O: Sprawdź [Przykład aplikacji kontenerowych](../../../../examples/container-app), który używa kontenerów Docker w całym procesie.

**P: Jak połączyć się z bazą danych z mojego lokalnego komputera?**  
O: Dodaj swój adres IP do zapory SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**P: Czy mogę użyć istniejącej bazy danych zamiast tworzyć nową?**  
O: Tak, zmodyfikuj `infra/main.bicep`, aby odwoływać się do istniejącego SQL Server i zaktualizuj parametry connection string.

---

> **Uwaga:** Ten przykład pokazuje najlepsze praktyki wdrażania aplikacji webowej z bazą danych za pomocą AZD. Zawiera działający kod, kompleksową dokumentację i ćwiczenia praktyczne, aby wzmocnić naukę. Dla wdrożeń produkcyjnych przeanalizuj wymagania dotyczące bezpieczeństwa, skalowania, zgodności i kosztów specyficzne dla Twojej organizacji.

**📚 Nawigacja po kursie:**
- ← Poprzedni: [Przykład aplikacji kontenerowych](../../../../examples/container-app)
- → Następny: [Przewodnik integracji AI](../../../../docs/ai-foundry)
- 🏠 [Strona główna kursu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->