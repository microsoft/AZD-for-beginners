# Wdrażanie bazy danych Microsoft SQL i aplikacji internetowej za pomocą AZD

⏱️ **Szacowany czas**: 20-30 minut | 💰 **Szacowany koszt**: ~15-25 USD/miesiąc | ⭐ **Poziom trudności**: Średniozaawansowany

Ten **kompletny, działający przykład** pokazuje, jak użyć [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) do wdrożenia aplikacji internetowej Python Flask z bazą danych Microsoft SQL na Azure. Cały kod jest dołączony i przetestowany — nie są wymagane żadne zewnętrzne zależności.

## Czego się nauczysz

Po wykonaniu tego przykładu:
- Wdrożysz aplikację wielowarstwową (aplikacja web + baza danych) przy użyciu infrastruktury jako kodu
- Skonfigurujesz bezpieczne połączenia z bazą danych bez twardego kodowania sekretów
- Będziesz monitorować zdrowie aplikacji za pomocą Application Insights
- Skutecznie zarządzisz zasobami Azure za pomocą CLI AZD
- Będziesz stosować najlepsze praktyki Azure dotyczące bezpieczeństwa, optymalizacji kosztów i obserwowalności

## Przegląd scenariusza
- **Aplikacja internetowa**: Python Flask REST API z połączeniem z bazą danych
- **Baza danych**: Azure SQL Database z przykładowymi danymi
- **Infrastruktura**: Provisionowana przy użyciu Bicep (modułowe, wielokrotnego użytku szablony)
- **Wdrożenie**: W pełni zautomatyzowane z użyciem poleceń `azd`
- **Monitorowanie**: Application Insights do logów i telemetrii

## Wymagania wstępne

### Wymagane narzędzia

Przed rozpoczęciem upewnij się, że masz zainstalowane następujące narzędzia:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (wersja 2.50.0 lub wyższa)
   ```sh
   az --version
   # Oczekiwany wynik: azure-cli 2.50.0 lub wyższa wersja
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (wersja 1.0.0 lub wyższa)
   ```sh
   azd version
   # Oczekiwany wynik: wersja azd 1.0.0 lub nowsza
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (do lokalnego rozwoju)
   ```sh
   python --version
   # Oczekiwany wynik: Python 3.8 lub wyższy
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcjonalnie, do lokalnego rozwoju w kontenerze)
   ```sh
   docker --version
   # Oczekiwany rezultat: wersja Dockera 20.10 lub wyższa
   ```

### Wymagania Azure

- Aktywna **subskrypcja Azure** ([załóż darmowe konto](https://azure.microsoft.com/free/))
- Uprawnienia do tworzenia zasobów w subskrypcji
- Rola **Właściciel** lub **Współautor** dla subskrypcji lub grupy zasobów

### Wiedza wstępna

Jest to przykład na poziomie **średniozaawansowanym**. Powinieneś znać:
- Podstawowe operacje wiersza poleceń
- Podstawowe pojęcia chmury (zasoby, grupy zasobów)
- Podstawową wiedzę o aplikacjach web i bazach danych

**Nowy w AZD?** Zacznij od [Przewodnika dla początkujących](../../docs/chapter-01-foundation/azd-basics.md).

## Architektura

Ten przykład wdraża architekturę dwuwarstwową z aplikacją web i bazą danych SQL:

```mermaid
graph TD
    Browser[Przeglądarka użytkownika] <--> WebApp[Azure Web App<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Bezpieczne połączenie<br/>Szyfrowane --> SQL[Azure SQL Database<br/>Tabela produktów<br/>Przykładowe dane]
```

**Wdrożenie zasobów:**
- **Grupa zasobów**: Kontener dla wszystkich zasobów
- **Plan usługi App Service**: Hosting Linux (poziom B1 dla efektywności kosztowej)
- **Aplikacja web**: Runtime Python 3.11 z aplikacją Flask
- **Serwer SQL**: Zarządzany serwer baz danych z minimalnym TLS 1.2
- **Baza SQL**: Poziom podstawowy (2GB, odpowiedni do rozwoju/testów)
- **Application Insights**: Monitorowanie i logowanie
- **Log Analytics Workspace**: Centralne miejsce na logi

**Analogia**: Pomyśl o tym jak o restauracji (aplikacja web) z zamrażarką (baza danych). Klienci zamawiają z menu (końcówki API), a kuchnia (aplikacja Flask) pobiera składniki (dane) z zamrażarki. Kierownik restauracji (Application Insights) śledzi wszystko, co się dzieje.

## Struktura folderów

Wszystkie pliki są dołączone w tym przykładzie — nie są wymagane żadne zewnętrzne zależności:

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
- **azure.yaml**: Mówi AZD, co i gdzie wdrożyć
- **infra/main.bicep**: Orkiestruje wszystkie zasoby Azure
- **infra/resources/*.bicep**: Definicje pojedynczych zasobów (modułowe, do ponownego użycia)
- **src/web/app.py**: Aplikacja Flask z logiką bazy danych
- **requirements.txt**: Zależności pakietów Python
- **Dockerfile**: Instrukcje konteneryzacji do wdrożenia

## Szybki start (krok po kroku)

### Krok 1: Sklonuj i przejdź do folderu

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Sprawdzenie powodzenia**: Upewnij się, że widzisz plik `azure.yaml` i folder `infra/`:
```sh
ls
# Oczekiwane: README.md, azure.yaml, infra/, src/
```

### Krok 2: Zaloguj się do Azure

```sh
azd auth login
```

Otworzy się przeglądarka do uwierzytelniania w Azure. Zaloguj się za pomocą swoich danych Azure.

**✓ Sprawdzenie powodzenia**: Powinieneś zobaczyć:
```
Logged in to Azure.
```

### Krok 3: Zainicjuj środowisko

```sh
azd init
```

**Co się dzieje**: AZD tworzy lokalną konfigurację dla wdrożenia.

**Pytania, które pojawią się**:
- **Nazwa środowiska**: Wprowadź krótką nazwę (np. `dev`, `myapp`)
- **Subskrypcja Azure**: Wybierz subskrypcję z listy
- **Lokalizacja Azure**: Wybierz region (np. `eastus`, `westeurope`)

**✓ Sprawdzenie powodzenia**: Powinieneś zobaczyć:
```
SUCCESS: New project initialized!
```

### Krok 4: Provisionowanie zasobów Azure

```sh
azd provision
```

**Co się dzieje**: AZD wdraża całą infrastrukturę (zajmuje 5-8 minut):
1. Tworzy grupę zasobów
2. Tworzy serwer i bazę SQL
3. Tworzy plan usługi App Service
4. Tworzy aplikację web
5. Tworzy Application Insights
6. Konfiguruje sieć i bezpieczeństwo

**Poprosi Cię o podanie**:
- **Nazwa użytkownika admina SQL**: Wprowadź nazwę użytkownika (np. `sqladmin`)
- **Hasło admina SQL**: Wprowadź silne hasło (zachowaj je!)

**✓ Sprawdzenie powodzenia**: Powinieneś zobaczyć:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Czas**: 5-8 minut

### Krok 5: Wdróż aplikację

```sh
azd deploy
```

**Co się dzieje**: AZD buduje i wdraża Twoją aplikację Flask:
1. Pakuje aplikację Python
2. Buduje kontener Docker
3. Wysyła do Azure Web App
4. Inicjuje bazę danych przykładowymi danymi
5. Uruchamia aplikację

**✓ Sprawdzenie powodzenia**: Powinieneś zobaczyć:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Czas**: 3-5 minut

### Krok 6: Otwórz aplikację w przeglądarce

```sh
azd browse
```

Otwiera wdrożoną aplikację web w przeglądarce pod adresem `https://app-<unique-id>.azurewebsites.net`

**✓ Sprawdzenie powodzenia**: Powinieneś zobaczyć wyjście w formacie JSON:
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

### Krok 7: Testuj końcówki API

**Sprawdzenie stanu połączenia** (weryfikacja połączenia z bazą):
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

**Lista produktów** (próbka danych):
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

**✓ Sprawdzenie powodzenia**: Wszystkie końcówki zwracają dane JSON bez błędów.

---

**🎉 Gratulacje!** Pomyślnie wdrożyłeś aplikację web z bazą danych na Azure używając AZD.

## Szczegóły konfiguracji

### Zmienne środowiskowe

Sekrety są bezpiecznie zarządzane poprzez konfigurację Azure App Service — **nigdy nie są twardo zakodowane w kodzie źródłowym**.

**Konfigurowane automatycznie przez AZD:**
- `SQL_CONNECTION_STRING`: Połączenie z bazą danych z zaszyfrowanymi poświadczeniami
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Punkt końcowy telemetrii monitoringu
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Włącza automatyczną instalację zależności

**Gdzie przechowywane są sekrety:**
1. Podczas `azd provision` podajesz poświadczenia SQL przez bezpieczne monity
2. AZD zapisuje je w lokalnym pliku `.azure/<nazwa_środowiska>/.env` (ignorowany przez git)
3. AZD wstrzykuje je do konfiguracji Azure App Service (szyfrowane na dysku)
4. Aplikacja odczytuje je za pomocą `os.getenv()` podczas działania

### Rozwój lokalny

Do testów lokalnych utwórz plik `.env` z przykładu:

```sh
cp .env.sample .env
# Edytuj .env z lokalnym połączeniem do bazy danych
```

**Przepływ pracy lokalny**:
```sh
# Zainstaluj zależności
cd src/web
pip install -r requirements.txt

# Ustaw zmienne środowiskowe
export SQL_CONNECTION_STRING="your-local-connection-string"

# Uruchom aplikację
python app.py
```

**Testuj lokalnie**:
```sh
curl http://localhost:8000/health
# Oczekiwano: {"status": "healthy", "database": "connected"}
```

### Infrastruktura jako kod

Wszystkie zasoby Azure zdefiniowane są w **szablonach Bicep** (folder `infra/`):

- **Modułowy projekt**: Każdy zasób w osobnym pliku dla łatwego ponownego użycia
- **Parametryzacja**: Możliwość dostosowania SKU, regionów, nazw
- **Najlepsze praktyki**: Zgodne ze standardami nazewnictwa i domyślnymi zabezpieczeniami Azure
- **Kontrola wersji**: Zmiany infrastruktury śledzone w Git

**Przykład dostosowania**:
Aby zmienić poziom bazy danych, edytuj `infra/resources/sql-database.bicep`:
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
- ✅ Poświadczenia przechowywane w konfiguracji Azure App Service (szyfrowane)
- ✅ Pliki `.env` wyłączone z Gita przez `.gitignore`
- ✅ Sekrety przekazywane przez bezpieczne parametry podczas provisionowania

### 2. **Szyfrowane połączenia**
- ✅ Minimalnie TLS 1.2 dla serwera SQL
- ✅ Wymuszony HTTPS dla aplikacji web
- ✅ Połączenia z bazą używają zaszyfrowanych kanałów

### 3. **Bezpieczeństwo sieci**
- ✅ Zapora SQL Server skonfigurowana, by pozwalać na usługi Azure tylko
- ✅ Ograniczony dostęp sieci publicznej (można dalej zabezpieczyć prywatnymi punktami końcowymi)
- ✅ FTPS wyłączony w Web App

### 4. **Uwierzytelnianie i autoryzacja**
- ⚠️ **Obecnie**: Uwierzytelnianie SQL (użytkownik/hasło)
- ✅ **Zalecenie produkcyjne**: Używaj Managed Identity Azure dla uwierzytelniania bezhasłowego

**Aby przejść na Managed Identity** (dla produkcji):
1. Włącz Managed Identity w Web App
2. Nadaj tożsamości uprawnienia do SQL
3. Zaktualizuj connection string na używający Managed Identity
4. Usuń uwierzytelnianie oparte na haśle

### 5. **Audyt i zgodność**
- ✅ Application Insights loguje wszystkie żądania i błędy
- ✅ Włączony audyt SQL Database (można konfigurować dla zgodności)
- ✅ Wszystkie zasoby mają tagi do zarządzania

**Lista kontrolna bezpieczeństwa przed produkcją**:
- [ ] Włącz Azure Defender dla SQL
- [ ] Skonfiguruj Prywatne Punkty Końcowe dla bazy SQL
- [ ] Włącz Web Application Firewall (WAF)
- [ ] Zaimplementuj Azure Key Vault do rotacji sekretów
- [ ] Skonfiguruj uwierzytelnianie Microsoft Entra ID
- [ ] Włącz logowanie diagnostyczne dla wszystkich zasobów

## Optymalizacja kosztów

**Szacunkowe miesięczne koszty** (stan na listopad 2025):

| Zasób | SKU/Poziom | Szacowany koszt |
|----------|----------|----------------|
| Plan App Service | B1 (podstawowy) | ~13 USD/miesiąc |
| Baza SQL | Podstawowa (2GB) | ~5 USD/miesiąc |
| Application Insights | Płać za rzeczywiste użycie | ~2 USD/miesiąc (niskie obciążenie) |
| **Razem** | | **~20 USD/miesiąc** |

**💡 Wskazówki oszczędnościowe**:

1. **Używaj darmowego poziomu do nauki**:
   - App Service: Poziom F1 (darmowy, ograniczone godziny)
   - Baza SQL: Używaj Azure SQL Database w trybie serverless
   - Application Insights: 5GB darmowego wgrywania danych miesięcznie

2. **Wyłącz zasoby, gdy nie są używane**:
   ```sh
   # Zatrzymaj aplikację webową (baza danych nadal nalicza opłaty)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Uruchom ponownie w razie potrzeby
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Usuń wszystko po testach**:
   ```sh
   azd down
   ```
   To usuwa WSZYSTKIE zasoby i przerywa naliczanie opłat.

4. **SKU dla rozwoju vs produkcji**:
   - **Rozwój**: Poziom podstawowy (używany w tym przykładzie)
   - **Produkcja**: Poziomy Standard/Premium z redundancją

**Monitorowanie kosztów**:
- Podgląd kosztów w [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Konfiguracja alertów kosztowych by unikać niespodzianek
- Oznaczaj wszystkie zasoby tagiem `azd-env-name` dla śledzenia

**Alternatywa darmowego poziomu**:
Do nauki możesz zmodyfikować `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Uwaga**: Darmowy poziom ma ograniczenia (60 minut CPU dziennie, brak always-on).

## Monitorowanie i obserwowalność

### Integracja z Application Insights

Ten przykład zawiera **Application Insights** do kompleksowego monitoringu:

**Co jest monitorowane**:
- ✅ Żądania HTTP (opóźnienia, kody statusu, końcówki)
- ✅ Błędy i wyjątki aplikacji
- ✅ Niestandardowe logi z aplikacji Flask
- ✅ Stan połączenia z bazą danych
- ✅ Metryki wydajności (CPU, pamięć)

**Dostęp do Application Insights**:
1. Otwórz [Azure Portal](https://portal.azure.com)
2. Przejdź do grupy zasobów (`rg-<env-name>`)
3. Kliknij zasób Application Insights (`appi-<unique-id>`)

**Przydatne zapytania** (Application Insights → Logs):

**Przegląd wszystkich żądań**:
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

**Sprawdź endpoint zdrowia**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Audyt SQL Database

**Audyt bazy SQL jest włączony** i śledzi:
- Wzorce dostępu do bazy
- Nieudane próby logowania
- Zmiany schematu
- Dostęp do danych (dla zgodności)

**Dostęp do logów audytu**:
1. Azure Portal → SQL Database → Auditing
2. Przeglądaj logi w Log Analytics workspace

### Monitorowanie w czasie rzeczywistym

**Podgląd metryk na żywo**:
1. Application Insights → Live Metrics
2. Zobacz żądania, awarie i wydajność na żywo

**Konfiguracja alertów**:
Utwórz alerty dla krytycznych zdarzeń:
- Błędy HTTP 500 > 5 w ciągu 5 minut
- Niepowodzenia połączenia z bazą danych
- Wysokie czasy odpowiedzi (>2 sekundy)

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
  
#### 2. Połączenie z SQL nie udaje się podczas wdrażania

**Objaw**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**Rozwiązanie**:  
- Sprawdź, czy zapora SQL Server pozwala na usługi Azure (konfigurowane automatycznie)  
- Zweryfikuj, czy hasło administratora SQL zostało poprawnie wprowadzone podczas `azd provision`  
- Upewnij się, że SQL Server jest całkowicie przygotowany (może to trwać 2-3 minuty)  

**Weryfikacja połączenia**:  
```sh
# Z portalu Azure przejdź do SQL Database → Edytor zapytań
# Spróbuj połączyć się za pomocą swoich danych uwierzytelniających
```
  
#### 3. Aplikacja Web pokazuje "Application Error"

**Objaw**:  
Przeglądarka wyświetla ogólną stronę błędu.

**Rozwiązanie**:  
Sprawdź logi aplikacji:  
```sh
# Wyświetl ostatnie logi
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**Częste przyczyny**:  
- Brakujące zmienne środowiskowe (sprawdź App Service → Konfiguracja)  
- Niepowodzenie instalacji pakietów Pythona (sprawdź logi wdrożenia)  
- Błąd inicjalizacji bazy danych (sprawdź łączność z SQL)  

#### 4. `azd deploy` kończy się błędem "Build Error"

**Objaw**:  
```
Error: Failed to build project
```
  
**Rozwiązanie**:  
- Upewnij się, że `requirements.txt` nie zawiera błędów składni  
- Sprawdź, czy Python 3.11 jest określony w `infra/resources/web-app.bicep`  
- Zweryfikuj, czy plik Dockerfile ma poprawny obraz bazowy  

**Debugowanie lokalne**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. „Unauthorized” podczas uruchamiania komend AZD

**Objaw**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**Rozwiązanie**:  
Zaloguj się ponownie do Azure:  
```sh
# Wymagane dla przepływów pracy AZD
azd auth login

# Opcjonalne, jeśli używasz również poleceń Azure CLI bezpośrednio
az login
```
  
Zweryfikuj, że masz odpowiednie uprawnienia (rola Contributor) na subskrypcji.

#### 6. Wysokie koszty bazy danych

**Objaw**:  
Nieoczekiwany rachunek Azure.

**Rozwiązanie**:  
- Sprawdź, czy nie zapomniałeś uruchomić `azd down` po testach  
- Zweryfikuj, czy baza SQL korzysta z poziomu Basic (nie Premium)  
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
  
**Dostęp do logów aplikacji**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**Potrzebujesz więcej pomocy?**  
- [Przewodnik rozwiązywania problemów AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [Rozwiązywanie problemów Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Rozwiązywanie problemów Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)  

## Ćwiczenia praktyczne

### Ćwiczenie 1: Zweryfikuj swoje wdrożenie (Początkujący)

**Cel**: Potwierdź, że wszystkie zasoby są wdrożone, a aplikacja działa.

**Kroki**:  
1. Wypisz wszystkie zasoby w grupie zasobów:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Oczekiwane**: 6-7 zasobów (Web App, SQL Server, SQL Database, Plan App Service, Application Insights, Log Analytics)  

2. Przetestuj wszystkie endpointy API:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Oczekiwane**: Wszystkie zwracają poprawny JSON bez błędów  

3. Sprawdź Application Insights:  
   - Przejdź do Application Insights w Azure Portal  
   - Otwórz "Live Metrics"  
   - Odśwież stronę web app w przeglądarce  
   **Oczekiwane**: Żądania pojawiają się w czasie rzeczywistym  

**Kryteria sukcesu**: Wszystkie 6-7 zasobów istnieje, wszystkie endpointy zwracają dane, Live Metrics pokazuje aktywność.

---

### Ćwiczenie 2: Dodaj nowy endpoint API (Średniozaawansowany)

**Cel**: Rozszerz aplikację Flask o nowy endpoint.

**Kod startowy**: Aktualne endpointy w `src/web/app.py`

**Kroki**:  
1. Edytuj `src/web/app.py` i dodaj nowy endpoint po funkcji `get_product()`:  
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
  
3. Przetestuj nowy endpoint:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Oczekiwane**: Zwraca produkty pasujące do „laptop”  

**Kryteria sukcesu**: Nowy endpoint działa, zwraca filtrowane wyniki, pojawia się w logach Application Insights.

---

### Ćwiczenie 3: Dodaj monitorowanie i alerty (Zaawansowany)

**Cel**: Skonfiguruj monitorowanie proaktywne z alertami.

**Kroki**:  
1. Utwórz alert na błędy HTTP 500:  
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
   # Żądanie nieistniejącego produktu
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. Sprawdź, czy alert się uruchomił:  
   - Azure Portal → Alerts → Alert Rules  
   - Sprawdź pocztę (jeśli skonfigurowano)  

**Kryteria sukcesu**: Reguła alertu jest stworzona, wyzwala się przy błędach, otrzymywane są powiadomienia.

---

### Ćwiczenie 4: Zmiany w schemacie bazy danych (Zaawansowany)

**Cel**: Dodaj nową tabelę i zmodyfikuj aplikację, aby ją wykorzystywała.

**Kroki**:  
1. Połącz się z bazą SQL przez Query Editor w Azure Portal  

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
  
3. Zaktualizuj `src/web/app.py`, aby uwzględniała informacje o kategoriach w odpowiedziach  

4. Wdróż i przetestuj  

**Kryteria sukcesu**: Nowa tabela istnieje, produkty pokazują informacje o kategorii, aplikacja działa poprawnie.

---

### Ćwiczenie 5: Zaimplementuj pamięć podręczną (Ekspert)

**Cel**: Dodaj Azure Redis Cache w celu poprawy wydajności.

**Kroki**:  
1. Dodaj Redis Cache do `infra/main.bicep`  
2. Zaktualizuj `src/web/app.py`, aby buforować zapytania o produkty  
3. Zmierz poprawę wydajności za pomocą Application Insights  
4. Porównaj czasy odpowiedzi przed i po buforowaniu  

**Kryteria sukcesu**: Redis jest wdrożony, buforowanie działa, czas odpowiedzi poprawia się o >50%.

**Podpowiedź**: Zacznij od [dokumentacji Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Sprzątanie

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
- Wszystkie zasoby są usunięte w Azure Portal  
- Brak bieżących opłat  
- Lokalny folder `.azure/<env-name>` można usunąć  

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

### Kolejne kroki w kursie
- **[Przykład Container Apps](../../../../examples/container-app)**: Wdrażanie mikrousług z Azure Container Apps  
- **[Przewodnik integracji AI](../../../../docs/ai-foundry)**: Dodaj funkcje AI do swojej aplikacji  
- **[Praktyki wdrażania](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Wzorce wdrażania produkcyjnego  

### Tematy zaawansowane
- **Managed Identity**: Usuń hasła i użyj uwierzytelniania Microsoft Entra ID  
- **Private Endpoints**: Zabezpiecz połączenia bazy w wirtualnej sieci  
- **Integracja CI/CD**: Automatyzuj wdrożenia z GitHub Actions lub Azure DevOps  
- **Wielośrodowiskowość**: Skonfiguruj środowiska dev, staging i produkcyjne  
- **Migracje bazy danych**: Użyj Alembic lub Entity Framework do wersjonowania schematu  

### Porównanie z innymi podejściami

**AZD vs. szablony ARM**:  
- ✅ AZD: Abstrakcja wyższego poziomu, prostsze komendy  
- ⚠️ ARM: Bardziej szczegółowe, większa kontrola  

**AZD vs. Terraform**:  
- ✅ AZD: Natywne dla Azure, zintegrowane z usługami Azure  
- ⚠️ Terraform: Wielochmurowy, większy ekosystem  

**AZD vs. Azure Portal**:  
- ✅ AZD: Powtarzalne, kontrola wersji, automatyzacja  
- ⚠️ Portal: Ręczne klikanie, trudne do odtworzenia  

**Myśl o AZD jak o**: Docker Compose dla Azure — uproszczona konfiguracja złożonych wdrożeń.

---

## Najczęściej zadawane pytania

**P: Czy mogę użyć innego języka programowania?**  
O: Tak! Zamień `src/web/` na Node.js, C#, Go lub dowolny język. Zaktualizuj `azure.yaml` i Bicep odpowiednio.

**P: Jak dodać więcej baz danych?**  
O: Dodaj kolejny moduł SQL Database w `infra/main.bicep` lub użyj PostgreSQL/MySQL z usług Azure Database.

**P: Czy mogę użyć tego w produkcji?**  
O: To punkt startowy. Do produkcji dołącz: managed identity, private endpoints, redundancję, strategię kopii zapasowych, WAF i rozszerzone monitorowanie.

**P: A co jeśli chcę używać kontenerów zamiast wdrażania kodu?**  
O: Sprawdź [Przykład Container Apps](../../../../examples/container-app), który wykorzystuje kontenery Docker przez cały proces.

**P: Jak połączyć się z bazą danych z lokalnej maszyny?**  
O: Dodaj swój adres IP do zapory SQL Servera:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**P: Czy mogę użyć istniejącej bazy danych zamiast tworzyć nową?**  
O: Tak, zmodyfikuj `infra/main.bicep`, by odwoływał się do istniejącego SQL Servera i zaktualizuj parametry connection string.

---

> **Uwaga:** Ten przykład demonstruje najlepsze praktyki wdrażania aplikacji webowej z bazą danych przy użyciu AZD. Zawiera działający kod, pełną dokumentację i ćwiczenia praktyczne wzmacniające naukę. Przy wdrożeniach produkcyjnych uwzględnij wymagania dotyczące bezpieczeństwa, skalowania, zgodności i kosztów specyficzne dla Twojej organizacji.

**📚 Nawigacja po kursie:**  
- ← Poprzedni: [Przykład Container Apps](../../../../examples/container-app)  
- → Następny: [Przewodnik integracji AI](../../../../docs/ai-foundry)  
- 🏠 [Strona główna kursu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->