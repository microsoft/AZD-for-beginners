# Wdrażanie bazy danych Microsoft SQL i aplikacji internetowej za pomocą AZD

⏱️ **Szacowany czas**: 20-30 minut | 💰 **Szacowany koszt**: ~15-25 USD/miesiąc | ⭐ **Poziom trudności**: Średnio zaawansowany

Ten **kompletny, działający przykład** pokazuje, jak użyć [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) do wdrożenia aplikacji internetowej Python Flask z bazą danych Microsoft SQL w Azure. Wszystkie fragmenty kodu są dołączone i przetestowane — bez konieczności instalowania zewnętrznych zależności.

## Czego się nauczysz

Realizując ten przykład, nauczysz się:
- Wdrażać aplikację wielowarstwową (aplikacja web + baza danych) z użyciem infrastruktury jako kodu
- Konfigurować bezpieczne połączenia z bazą danych bez wpisywania sekretów w kodzie
- Monitorować stan aplikacji za pomocą Application Insights
- Efektywnie zarządzać zasobami Azure z pomocą AZD CLI
- Stosować najlepsze praktyki Azure dotyczące bezpieczeństwa, optymalizacji kosztów i obserwowalności

## Przegląd scenariusza
- **Aplikacja web**: Python Flask REST API z łącznością do bazy danych
- **Baza danych**: Azure SQL Database z przykładowymi danymi
- **Infrastruktura**: Provisionowana przy pomocy Bicep (modułowe, wielokrotnego użytku szablony)
- **Wdrażanie**: W pełni zautomatyzowane poleceniami `azd`
- **Monitorowanie**: Application Insights do zbierania logów i telemetrii

## Wymagania wstępne

### Niezbędne narzędzia

Przed rozpoczęciem upewnij się, że masz zainstalowane poniższe narzędzia:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (wersja 2.50.0 lub nowsza)
   ```sh
   az --version
   # Oczekiwany wynik: azure-cli 2.50.0 lub wyższa wersja
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (wersja 1.0.0 lub nowsza)
   ```sh
   azd version
   # Oczekiwany wynik: wersja azd 1.0.0 lub wyższa
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (do lokalnego rozwoju)
   ```sh
   python --version
   # Oczekiwany wynik: Python 3.8 lub wyższy
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcjonalnie, do lokalnego rozwoju w kontenerach)
   ```sh
   docker --version
   # Oczekiwany wynik: wersja Dockera 20.10 lub wyższa
   ```

### Wymagania Azure

- Aktywna **subskrypcja Azure** ([utwórz darmowe konto](https://azure.microsoft.com/free/))
- Uprawnienia do tworzenia zasobów w subskrypcji
- Rola **Właściciel** lub **Współtwórca** na subskrypcji lub grupie zasobów

### Wiedza wstępna

To jest przykład na poziomie **średnio zaawansowanym**. Powinieneś znać:
- Podstawowe operacje w wierszu poleceń
- Podstawowe pojęcia chmury (zasoby, grupy zasobów)
- Podstawy działania aplikacji web i baz danych

**Nowy w AZD?** Zacznij od przewodnika [Pierwsze kroki](../../docs/chapter-01-foundation/azd-basics.md).

## Architektura

Przykład wdraża dwuwarstwową architekturę z aplikacją web i bazą danych SQL:

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

**Wdrożone zasoby:**
- **Grupa zasobów**: Kontener dla wszystkich zasobów
- **Plan usługi App Service**: Hosting na Linuxie (poziom B1 dla efektywności kosztowej)
- **Aplikacja web**: Środowisko Python 3.11 z aplikacją Flask
- **Serwer SQL**: Zarządzany serwer bazodanowy z minimalnym TLS 1.2
- **Baza danych SQL**: Poziom Basic (2GB, odpowiedni do rozwoju/testów)
- **Application Insights**: Monitorowanie i logowanie
- **Workspace Log Analytics**: Centralne miejsce na logi

**Analogicznie**: Wyobraź sobie to jako restaurację (aplikacja web) z zamrażarką (baza danych). Klienci zamawiają dania z menu (endpointy API), a kuchnia (aplikacja Flask) pobiera składniki (dane) z zamrażarki. Kierownik restauracji (Application Insights) śledzi wszystko, co się dzieje.

## Struktura folderów

Wszystkie pliki są dołączone w przykładzie — bez zewnętrznych zależności:

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

**Znaczenie poszczególnych plików:**
- **azure.yaml**: Informuje AZD co i gdzie wdrażać
- **infra/main.bicep**: Orkiestruje wszystkie zasoby Azure
- **infra/resources/*.bicep**: Definicje pojedynczych zasobów (modułowe, do ponownego wykorzystania)
- **src/web/app.py**: Aplikacja Flask z logiką bazy danych
- **requirements.txt**: Zależności pakietów Python
- **Dockerfile**: Instrukcje konteneryzacji do wdrożenia

## Szybki start (krok po kroku)

### Krok 1: Sklonuj i przejdź do folderu

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Sprawdzenie poprawności**: Upewnij się, że widzisz plik `azure.yaml` oraz folder `infra/`:
```sh
ls
# Oczekiwane: README.md, azure.yaml, infra/, src/
```

### Krok 2: Zaloguj się do Azure

```sh
azd auth login
```

To otworzy przeglądarkę do logowania do Azure. Zaloguj się swoimi danymi.

**✓ Sprawdzenie poprawności**: Powinieneś zobaczyć:
```
Logged in to Azure.
```

### Krok 3: Zainicjuj środowisko

```sh
azd init
```

**Co się dzieje**: AZD tworzy lokalną konfigurację dla wdrożenia.

**Pojawią się pytania**:
- **Nazwa środowiska**: Wpisz krótką nazwę (np. `dev`, `myapp`)
- **Subskrypcja Azure**: Wybierz swoją subskrypcję z listy
- **Region Azure**: Wybierz region (np. `eastus`, `westeurope`)

**✓ Sprawdzenie poprawności**: Powinieneś zobaczyć:
```
SUCCESS: New project initialized!
```

### Krok 4: Provisionowanie zasobów Azure

```sh
azd provision
```

**Co się dzieje**: AZD wdraża całą infrastrukturę (5-8 minut):
1. Tworzy grupę zasobów
2. Tworzy serwer SQL i bazę danych
3. Tworzy plan App Service
4. Tworzy aplikację web
5. Konfiguruje Application Insights
6. Konfiguruje sieć i zabezpieczenia

**Będziesz proszony o**:
- **Nazwa użytkownika administratora SQL**: Wpisz nazwę użytkownika (np. `sqladmin`)
- **Hasło administratora SQL**: Wpisz silne hasło (zachowaj je!)

**✓ Sprawdzenie poprawności**: Powinieneś zobaczyć:
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

**Co się dzieje**: AZD buduje i wdraża aplikację Flask:
1. Pakuje aplikację Python
2. Buduje kontener Docker
3. Wysyła na Azure Web App
4. Inicjuje bazę danych przykładowymi danymi
5. Uruchamia aplikację

**✓ Sprawdzenie poprawności**: Powinieneś zobaczyć:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Czas**: 3-5 minut

### Krok 6: Otwórz aplikację

```sh
azd browse
```

Uruchomi to aplikację web w przeglądarce pod adresem `https://app-<unikalny-id>.azurewebsites.net`

**✓ Sprawdzenie poprawności**: Zobaczysz dane w formacie JSON:
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

### Krok 7: Przetestuj endpointy API

**Sprawdzenie stanu (health check)** (weryfikacja połączenia z bazą):
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

**Pojedynczy produkt**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Sprawdzenie poprawności**: Wszystkie endpointy zwracają dane JSON bez błędów.

---

**🎉 Gratulacje!** Pomyślnie wdrożyłeś aplikację web z bazą danych na Azure przy użyciu AZD.

## Szczegóły konfiguracji

### Zmienne środowiskowe

Sekrety są bezpiecznie zarządzane przez konfigurację Azure App Service — **nigdy nie są wpisywane na stałe w kodzie źródłowym**.

**Automatycznie konfigurowane przez AZD**:
- `SQL_CONNECTION_STRING`: Połączenie do bazy danych z zaszyfrowanymi danymi uwierzytelniającymi
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Punkt końcowy telemetrii do monitoringu
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Włącza automatyczne instalowanie zależności

**Gdzie przechowywane są sekrety**:
1. Podczas `azd provision` podajesz dane SQL przez bezpieczne pytania
2. AZD zapisuje je w lokalnym pliku `.azure/<nazwa-środowiska>/.env` (ignorowany przez git)
3. AZD przekazuje je do konfiguracji Azure App Service (zaszyfrowane w spoczynku)
4. Aplikacja odczytuje je przez `os.getenv()` w czasie działania

### Lokalny rozwój

Do testów lokalnych utwórz plik `.env` na podstawie przykładowego:

```sh
cp .env.sample .env
# Edytuj plik .env, aby dodać lokalne połączenie z bazą danych
```

**Proces lokalnego rozwoju**:
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

Wszystkie zasoby Azure definiowane są w **szablonach Bicep** (`infra/` folder):

- **Modułowy design**: Każdy rodzaj zasobu w osobnym pliku dla ponownego użycia
- **Parametryzacja**: Możliwość zmiany SKU, regionów, konwencji nazewniczych
- **Najlepsze praktyki**: Stosowanie standardów nazewnictwa i ustawień bezpieczeństwa Azure
- **Kontrola wersji**: Zmiany infrastruktury śledzone w Git

**Przykład modyfikacji**:
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
- ✅ Dane uwierzytelniające przechowywane w konfiguracji Azure App Service (zaszyfrowane)
- ✅ Pliki `.env` wykluczone z Gita przez `.gitignore`
- ✅ Sekrety przekazywane przez bezpieczne parametry w trakcie provisioning’u

### 2. **Szyfrowane połączenia**
- ✅ Minimalny TLS 1.2 dla serwera SQL
- ✅ Wymuszony HTTPS dla aplikacji web
- ✅ Połączenia do bazy używają szyfrowanych kanałów

### 3. **Bezpieczeństwo sieciowe**
- ✅ Zapora serwera SQL dopuszcza tylko usługi Azure
- ✅ Ograniczony publiczny dostęp (możliwe dalsze blokady przez Private Endpoints)
- ✅ FTPS wyłączony na aplikacji web

### 4. **Uwierzytelnianie i autoryzacja**
- ⚠️ **Obecnie**: uwierzytelnianie SQL (login/hasło)
- ✅ **Rekomendacja produkcyjna**: użycie Azure Managed Identity do bezhasłowego uwierzytelniania

**Aby przejść na Managed Identity** (do produkcji):
1. Włącz Managed Identity dla aplikacji web
2. Nadaj tożsamości uprawnienia w SQL
3. Zaktualizuj connection string do używania Managed Identity
4. Usuń uwierzytelnianie hasłem

### 5. **Audyt i zgodność**
- ✅ Application Insights rejestruje wszystkie żądania i błędy
- ✅ Audyt SQL Database włączony (konfigurowalny dla zgodności)
- ✅ Wszystkie zasoby oznaczone tagami do zarządzania

**Lista kontrolna bezpieczeństwa przed produkcją**:
- [ ] Włączyć Azure Defender dla SQL
- [ ] Skonfigurować Private Endpoints dla SQL Database
- [ ] Włączyć Web Application Firewall (WAF)
- [ ] Wdrożyć Azure Key Vault do rotacji sekretów
- [ ] Skonfigurować uwierzytelnianie Azure AD
- [ ] Włączyć logowanie diagnostyczne dla wszystkich zasobów

## Optymalizacja kosztów

**Szacowane miesięczne koszty** (stan na listopad 2025):

| Zasób | SKU/Poziom | Szacunkowy koszt |
|----------|----------|----------------|
| Plan App Service | B1 (Basic) | ~13 USD/miesiąc |
| Baza danych SQL | Basic (2GB) | ~5 USD/miesiąc |
| Application Insights | Pay-as-you-go | ~2 USD/miesiąc (mały ruch) |
| **Razem** | | **~20 USD/miesiąc** |

**💡 Wskazówki oszczędnościowe**:

1. **Używaj darmowego poziomu do nauki**:
   - App Service: poziom F1 (darmowy, ograniczona liczba godzin)
   - SQL Database: użyj serwera Azure SQL Database serverless
   - Application Insights: 5GB/mo bezpłatna ingerencja

2. **Wyłączaj zasoby, gdy nie są używane**:
   ```sh
   # Zatrzymaj aplikację internetową (baza danych nadal pobiera opłaty)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Uruchom ponownie w razie potrzeby
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Usuń wszystko po testach**:
   ```sh
   azd down
   ```
   Usuwa WSZYSTKIE zasoby i przestaje naliczać opłaty.

4. **SKU dla rozwoju vs produkcji**:
   - **Rozwój**: poziom Basic (jak w przykładzie)
   - **Produkcja**: poziomy Standard/Premium z redundancją

**Monitorowanie kosztów**:
- Sprawdź koszty w [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Skonfiguruj alerty dotyczące kosztów, aby uniknąć niespodzianek
- Oznaczaj wszystkie zasoby tagiem `azd-env-name` do śledzenia

**Alternatywa darmowego poziomu**:
Do celów nauki zmodyfikuj `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Uwaga**: Darmowy poziom ma ograniczenia (60 min/dzień CPU, brak always-on).

## Monitorowanie i obserwowalność

### Integracja Application Insights

Ten przykład zawiera **Application Insights** do pełnego monitoringu:

**Co jest monitorowane**:
- ✅ Żądania HTTP (opóźnienia, kody statusu, endpointy)
- ✅ Błędy i wyjątki aplikacji
- ✅ Niestandardowe logi z aplikacji Flask
- ✅ Stan połączenia z bazą danych
- ✅ Metryki wydajności (CPU, pamięć)

**Jak uzyskać dostęp do Application Insights**:
1. Otwórz [Azure Portal](https://portal.azure.com)
2. Przejdź do swojej grupy zasobów (`rg-<nazwa-środowiska>`)
3. Kliknij zasób Application Insights (`appi-<unikalny-id>`)

**Przydatne zapytania** (Application Insights → Logi):

**Pokaż wszystkie żądania**:
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

### Audyt bazy danych SQL

**Audyt bazy SQL jest włączony** do śledzenia:
- Dostępu do bazy
- Nieudanych prób logowania
- Zmian schematu
- Dostępu do danych (dla zgodności)

**Dostęp do logów audytu**:
1. Portal Azure → SQL Database → Audyt
2. Przegląd logów w workspace Log Analytics

### Monitorowanie w czasie rzeczywistym

**Przeglądaj metryki na żywo**:
1. Application Insights → Live Metrics
2. Obserwuj żądania, błędy i wydajność na bieżąco

**Skonfiguruj alerty**:
Twórz alerty dla krytycznych zdarzeń:
- Błędy HTTP 500 > 5 w 5 minut
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

#### 2. Połączenie do SQL nie powiodło się podczas wdrażania

**Objaw**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**Rozwiązanie**:  
- Sprawdź, czy zapora SQL Server zezwala na usługi Azure (konfigurowane automatycznie)  
- Upewnij się, że hasło administratora SQL zostało poprawnie wprowadzone podczas `azd provision`  
- Upewnij się, że SQL Server jest w pełni przygotowany (może to potrwać 2-3 minuty)

**Weryfikacja połączenia**:  
```sh
# Z portalu Azure przejdź do Baza danych SQL → Edytor zapytań
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
- Niepowodzenie instalacji pakietu Python (sprawdź logi wdrożenia)  
- Błąd inicjalizacji bazy danych (sprawdź łączność z SQL)

#### 4. `azd deploy` kończy się błędem "Build Error"

**Objaw**:  
```
Error: Failed to build project
```
  
**Rozwiązanie**:  
- Upewnij się, że plik `requirements.txt` nie zawiera błędów składniowych  
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
Zaloguj się ponownie do Azure:  
```sh
azd auth login
az login
```
  
Zweryfikuj, czy masz odpowiednie uprawnienia (rola Współtwórcy) dla subskrypcji.

#### 6. Wysokie koszty bazy danych

**Objaw**:  
Nieoczekiwany rachunek za Azure.

**Rozwiązanie**:  
- Sprawdź, czy po testach nie zapomniałeś uruchomić `azd down`  
- Zweryfikuj, czy baza SQL korzysta z warstwy Basic (nie Premium)  
- Przejrzyj koszty w Azure Cost Management  
- Skonfiguruj alerty kosztowe

### Uzyskanie pomocy

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
- [Rozwiązywanie problemów z Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Rozwiązywanie problemów z Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Ćwiczenia praktyczne

### Ćwiczenie 1: Weryfikacja wdrożenia (Początkujący)

**Cel**: Potwierdzenie, że wszystkie zasoby zostały wdrożone i aplikacja działa.

**Kroki**:  
1. Wyświetl listę wszystkich zasobów w grupie zasobów:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Oczekiwane**: 6-7 zasobów (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

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
   - Wejdź do "Live Metrics"  
   - Odśwież stronę aplikacji webowej w przeglądarce  
   **Oczekiwane**: Widoczne zapytania w czasie rzeczywistym

**Kryteria sukcesu**: Wszystkie 6-7 zasobów istnieje, wszystkie endpointy zwracają dane, Live Metrics pokazuje aktywność.

---

### Ćwiczenie 2: Dodaj nowy endpoint API (Średniozaawansowany)

**Cel**: Rozszerzyć aplikację Flask o nowy endpoint.

**Kod startowy**: Aktualne endpointy w `src/web/app.py`

**Kroki**:  
1. Edytuj `src/web/app.py` i dodaj nowy endpoint za funkcją `get_product()`:  
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
   **Oczekiwane**: Zwraca produkty pasujące do "laptop"

**Kryteria sukcesu**: Nowy endpoint działa, zwraca filtrowane wyniki, pojawia się w logach Application Insights.

---

### Ćwiczenie 3: Dodaj monitorowanie i alerty (Zaawansowany)

**Cel**: Skonfigurować proaktywne monitorowanie z alertami.

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
  
2. Wywołaj alert generując błędy:  
   ```sh
   # Żądanie nieistniejącego produktu
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. Sprawdź, czy alert został uruchomiony:  
   - Azure Portal → Alerts → Alert Rules  
   - Sprawdź swoją pocztę (jeśli skonfigurowano)

**Kryteria sukcesu**: Reguła alertu utworzona, wyzwala się na błędy, otrzymywane są powiadomienia.

---

### Ćwiczenie 4: Zmiany w schemacie bazy danych (Zaawansowany)

**Cel**: Dodaj nową tabelę i zmodyfikuj aplikację, aby ją używała.

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

**Kryteria sukcesu**: Nowa tabela istnieje, produkty zawierają informacje o kategorii, aplikacja działa poprawnie.

---

### Ćwiczenie 5: Wdrożenie pamięci podręcznej (Ekspert)

**Cel**: Dodaj Azure Redis Cache dla poprawy wydajności.

**Kroki**:  
1. Dodaj Redis Cache do `infra/main.bicep`  
2. Zaktualizuj `src/web/app.py`, aby pamięć podręczna przechowywała wyniki zapytań o produkty  
3. Zmierz poprawę wydajności za pomocą Application Insights  
4. Porównaj czasy odpowiedzi przed i po włączeniu pamięci podręcznej

**Kryteria sukcesu**: Redis jest wdrożony, pamięć podręczna działa, czasy odpowiedzi poprawiły się o >50%.

**Wskazówka**: Zacznij od [dokumentacji Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

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
- Wszystkie zasoby zostały usunięte z Azure Portal  
- Brak dalszych opłat  
- Lokalne foldery `.azure/<nazwa-środowiska>` mogą zostać usunięte

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
- **[Przykład Container Apps](../../../../examples/container-app)**: Wdrożenie mikroserwisów za pomocą Azure Container Apps  
- **[Przewodnik integracji AI](../../../../docs/ai-foundry)**: Dodaj możliwości AI do swojej aplikacji  
- **[Najlepsze praktyki wdrażania](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Wzorce wdrożeń produkcyjnych

### Zaawansowane tematy  
- **Managed Identity**: Usuń hasła, używaj uwierzytelniania Azure AD  
- **Private Endpoints**: Zabezpiecz połączenia z bazą danych w sieci wirtualnej  
- **Integracja CI/CD**: Automatyzuj wdrożenia za pomocą GitHub Actions lub Azure DevOps  
- **Wielosrodowiskowość**: Konfiguruj środowiska dev, staging i produkcyjne  
- **Migracje bazy danych**: Używaj Alembic lub Entity Framework do wersjonowania schematu

### Porównanie do innych podejść

**AZD vs. ARM Templates**:  
- ✅ AZD: Abstrakcja wyższego poziomu, prostsze polecenia  
- ⚠️ ARM: Bardziej szczegółowe, większa kontrola

**AZD vs. Terraform**:  
- ✅ AZD: Natywne dla Azure, zintegrowane z usługami Azure  
- ⚠️ Terraform: Wielochmurowy, większy ekosystem

**AZD vs. Azure Portal**:  
- ✅ AZD: Powtarzalne, kontrolowane wersjami, automatyzowalne  
- ⚠️ Portal: Ręczne kliknięcia, trudne do powtórzenia

**Myśl o AZD jak**: Docker Compose dla Azure—uproszczona konfiguracja dla złożonych wdrożeń.

---

## Najczęściej zadawane pytania

**P: Czy mogę używać innego języka programowania?**  
O: Tak! Zastąp `src/web/` Node.js, C#, Go lub innym językiem. Zaktualizuj `azure.yaml` i Bicep odpowiednio.

**P: Jak dodać więcej baz danych?**  
O: Dodaj kolejny moduł SQL Database w `infra/main.bicep` lub użyj PostgreSQL/MySQL z usług Azure Database.

**P: Czy mogę to wykorzystać w produkcji?**  
O: To punkt startowy. W produkcji dodaj: managed identity, private endpoints, redundancję, strategię kopii zapasowych, WAF i rozszerzone monitorowanie.

**P: Co jeśli chcę używać kontenerów zamiast wdrażania kodu?**  
O: Sprawdź [Przykład Container Apps](../../../../examples/container-app), który używa kontenerów Docker od początku do końca.

**P: Jak połączyć się z bazą danych z lokalnej maszyny?**  
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
O: Tak, zmodyfikuj `infra/main.bicep`, aby odwoływał się do istniejącego SQL Server i zaktualizuj parametry łańcucha połączenia.

---

> **Uwaga:** Ten przykład demonstruje najlepsze praktyki wdrażania aplikacji webowej z bazą danych przy użyciu AZD. Zawiera działający kod, kompletną dokumentację oraz ćwiczenia praktyczne w celu utrwalenia nauki. W przypadku wdrożeń produkcyjnych zwróć uwagę na wymagania dotyczące bezpieczeństwa, skalowania, zgodności oraz kosztów specyficzne dla Twojej organizacji.

**📚 Nawigacja po kursie:**  
- ← Poprzedni: [Przykład Container Apps](../../../../examples/container-app)  
- → Następny: [Przewodnik integracji AI](../../../../docs/ai-foundry)  
- 🏠 [Strona główna kursu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczeń automatycznych AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pomimo dążenia do jak największej dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Za źródło autorytatywne należy uznać oryginalny dokument w jego rodzimym języku. W przypadku informacji o znaczeniu krytycznym zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za ewentualne nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->