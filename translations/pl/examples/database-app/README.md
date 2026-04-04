# Wdrażanie bazy danych Microsoft SQL i aplikacji internetowej za pomocą AZD

⏱️ **Szacowany czas**: 20-30 minut | 💰 **Szacowany koszt**: ~$15-25/miesiąc | ⭐ **Poziom trudności**: Średnio zaawansowany

Ten **kompletny, działający przykład** pokazuje, jak użyć [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) do wdrożenia aplikacji internetowej Python Flask wraz z bazą danych Microsoft SQL na platformie Azure. Cały kod jest dołączony i przetestowany — nie są potrzebne zewnętrzne zależności.

## Czego się nauczysz

Wykonując ten przykład, nauczysz się:
- Wdrażać aplikację wielowarstwową (aplikacja web + baza danych) za pomocą infrastruktury jako kodu
- Konfigurować bezpieczne połączenia z bazą danych bez twardego kodowania sekretów
- Monitorować kondycję aplikacji za pomocą Application Insights
- Zarządzać zasobami Azure efektywnie za pomocą AZD CLI
- Stosować najlepsze praktyki Azure w zakresie bezpieczeństwa, optymalizacji kosztów i obserwowalności

## Przegląd scenariusza
- **Aplikacja web**: Python Flask REST API z łącznością do bazy danych
- **Baza danych**: Azure SQL Database z przykładowymi danymi
- **Infrastruktura**: Provisionowana za pomocą Bicep (modułowe, wielokrotnego użytku szablony)
- **Wdrożenie**: W pełni zautomatyzowane za pomocą poleceń `azd`
- **Monitoring**: Application Insights do logów i telemetrii

## Wymagania wstępne

### Wymagane narzędzia

Przed rozpoczęciem upewnij się, że masz zainstalowane następujące narzędzia:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (wersja 2.50.0 lub nowsza)
   ```sh
   az --version
   # Oczekiwany wynik: azure-cli 2.50.0 lub nowszy
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (wersja 1.0.0 lub nowsza)
   ```sh
   azd version
   # Oczekiwany wynik: wersja azd 1.0.0 lub nowsza
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (do lokalnego rozwoju)
   ```sh
   python --version
   # Oczekiwany wynik: Python 3.8 lub wyższy
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcjonalnie, do lokalnego rozwoju kontenerowego)
   ```sh
   docker --version
   # Oczekiwany wynik: wersja Dockera 20.10 lub wyższa
   ```

### Wymagania Azure

- Aktywna **subskrypcja Azure** ([załóż darmowe konto](https://azure.microsoft.com/free/))
- Uprawnienia do tworzenia zasobów w subskrypcji
- Rola **Owner** lub **Contributor** na subskrypcji lub grupie zasobów

### Wymagana wiedza

To jest przykład na poziomie **średnio zaawansowanym**. Powinieneś znać:
- Podstawowe operacje wiersza polecenia
- Podstawowe pojęcia chmurowe (zasoby, grupy zasobów)
- Podstawy aplikacji internetowych i baz danych

**Nowy w AZD?** Zacznij od [przewodnika Wprowadzenie](../../docs/chapter-01-foundation/azd-basics.md).

## Architektura

Ten przykład wdraża architekturę dwuwarstwową z aplikacją web i bazą danych SQL:

```mermaid
graph TD
    Browser[Przeglądarka użytkownika] <--> WebApp[Aplikacja internetowa Azure<br/>API Flask<br/>/health<br/>/products]
    WebApp -- Bezpieczne połączenie<br/>Szyfrowane --> SQL[Baza danych Azure SQL<br/>Tabela produktów<br/>Przykładowe dane]
```
**Wdrażane zasoby:**
- **Grupa zasobów**: Kontener dla wszystkich zasobów
- **Plan App Service**: Hosting na Linux (tier B1 dla efektywności kosztowej)
- **Aplikacja web**: Python 3.11 i aplikacja Flask
- **Serwer SQL**: Zarządzany serwer baz danych z minimum TLS 1.2
- **Baza SQL**: Tier Basic (2GB, odpowiednia do dev/testów)
- **Application Insights**: Monitoring i logowanie
- **Log Analytics Workspace**: Centralne przechowywanie logów

**Analogia**: Wyobraź sobie restaurację (aplikacja web) z magazynem chłodniczym (baza danych). Klienci zamawiają z menu (punkty API), a kuchnia (aplikacja Flask) bierze składniki (dane) z magazynu. Kierownik restauracji (Application Insights) śledzi wszystko, co się dzieje.

## Struktura folderów

Wszystkie pliki znajdują się w tym przykładzie — brak zewnętrznych zależności:

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

**Funkcje plików:**
- **azure.yaml**: Informuje AZD, co i gdzie wdrożyć
- **infra/main.bicep**: Koordynuje wszystkie zasoby Azure
- **infra/resources/*.bicep**: Definicje poszczególnych zasobów (modułowe do wielokrotnego użytku)
- **src/web/app.py**: Aplikacja Flask z logiką bazy danych
- **requirements.txt**: Zależności Pythona
- **Dockerfile**: Instrukcje konteneryzacji do wdrożenia

## Szybki start (krok po kroku)

### Krok 1: Sklonuj repozytorium i przejdź do folderu

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Sprawdzenie sukcesu**: Upewnij się, że widzisz plik `azure.yaml` i folder `infra/`:
```sh
ls
# Oczekiwane: README.md, azure.yaml, infra/, src/
```

### Krok 2: Zaloguj się do Azure

```sh
azd auth login
```

Spowoduje to otwarcie przeglądarki do logowania do Azure. Zaloguj się używając swoich danych.

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
```
Logged in to Azure.
```

### Krok 3: Zainicjuj środowisko

```sh
azd init
```

**Co się dzieje**: AZD tworzy lokalną konfigurację do wdrożenia.

**Pojawią się pytania**:
- **Nazwa środowiska**: Wprowadź krótką nazwę (np. `dev`, `myapp`)
- **Subskrypcja Azure**: Wybierz subskrypcję z listy
- **Lokalizacja Azure**: Wybierz region (np. `eastus`, `westeurope`)

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
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
5. Tworzy Application Insights
6. Konfiguruje sieć i bezpieczeństwo

**Będziesz proszony o**:
- **Nazwa administratora SQL**: Wprowadź nazwę użytkownika (np. `sqladmin`)
- **Hasło administratora SQL**: Wprowadź silne hasło (zachowaj je!)

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
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
2. Buduje obraz Dockera
3. Wypycha go do Azure Web App
4. Inicjalizuje bazę danych przykładami danych
5. Uruchamia aplikację

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:
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

Spowoduje to otwarcie wdrożonej aplikacji pod adresem `https://app-<unique-id>.azurewebsites.net`

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

### Krok 7: Testuj endpointy API

**Sprawdzenie zdrowia** (weryfikacja połączenia z bazą):
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

**Lista produktów** (dane przykładowe):
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

**✓ Sprawdzenie sukcesu**: Wszystkie endpointy zwracają dane JSON bez błędów.

---

**🎉 Gratulacje!** Pomyślnie wdrożyłeś aplikację web wraz z bazą danych do Azure przy użyciu AZD.

## Szczegóły konfiguracji

### Zmienne środowiskowe

Sekrety są zarządzane bezpiecznie przez konfigurację Azure App Service — **nigdy nie zapisywane na stałe w kodzie źródłowym**.

**Konfigurowane automatycznie przez AZD**:
- `SQL_CONNECTION_STRING`: Łącze do bazy danych z zaszyfrowanymi poświadczeniami
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Punkt końcowy telemetrii monitoringu
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Włącza automatyczną instalację zależności

**Gdzie są przechowywane sekrety**:
1. Podczas `azd provision` podajesz dane SQL w bezpiecznych promptach
2. AZD zapisuje je lokalnie w pliku `.azure/<nazwa-środowiska>/.env` (ignorowany przez Git)
3. AZD wprowadza je do konfiguracji Azure App Service (szyfrowane w spoczynku)
4. Aplikacja odczytuje je przez `os.getenv()` w czasie działania

### Lokalny rozwój

Do lokalnych testów stwórz plik `.env` na podstawie wzoru:

```sh
cp .env.sample .env
# Edytuj plik .env z lokalnym połączeniem do bazy danych
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

Wszystkie zasoby Azure są zdefiniowane w **szablonach Bicep** (folder `infra/`):

- **Modułowy design**: Każdy typ zasobu w osobnym pliku dla wielokrotnego użytku
- **Parametryzowany**: Dostosowuj SKU, regiony, konwencje nazewnictwa
- **Najlepsze praktyki**: Zgodne ze standardami Azure i domyślnymi zabezpieczeniami
- **Kontrola wersji**: Zmiany infrastruktury śledzone w Git

**Przykład dostosowania**:
Aby zmienić tier bazy danych, edytuj `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Najlepsze praktyki bezpieczeństwa

Ten przykład stosuje się do najlepszych praktyk bezpieczeństwa Azure:

### 1. **Brak sekretów w kodzie źródłowym**
- ✅ Poświadczenia przechowywane w konfiguracji Azure App Service (zaszyfrowane)
- ✅ Pliki `.env` wyłączone z Git dzięki `.gitignore`
- ✅ Sekrety przekazywane jako bezpieczne parametry podczas provisioningu

### 2. **Szyfrowane połączenia**
- ✅ Minimum TLS 1.2 dla serwera SQL
- ✅ Wymuszony HTTPS dla aplikacji web
- ✅ Połączenia do bazy danych używają zaszyfrowanych kanałów

### 3. **Bezpieczeństwo sieci**
- ✅ Zapora serwera SQL dopuszcza tylko usługi Azure
- ✅ Ograniczony publiczny dostęp sieciowy (można dodatkowo blokować Private Endpoints)
- ✅ FTPS wyłączone na Web App

### 4. **Uwierzytelnianie i autoryzacja**
- ⚠️ **Aktualnie**: uwierzytelnianie SQL (użytkownik/hasło)
- ✅ **Zalecenie produkcyjne**: Użycie Azure Managed Identity bez haseł

**Aby przejść na Managed Identity** (na produkcję):
1. Włącz managed identity na Web App
2. Przyznaj tożsamości uprawnienia SQL
3. Zaktualizuj connection string, by używał managed identity
4. Usuń uwierzytelnianie na bazie hasła

### 5. **Audyt i zgodność**
- ✅ Application Insights loguje wszystkie żądania i błędy
- ✅ Audytowanie bazy SQL włączone (konfigurowalne pod compliance)
- ✅ Wszystkie zasoby oznaczone tagami do zarządzania

**Lista kontrolna bezpieczeństwa przed produkcją**:
- [ ] Włącz Azure Defender dla SQL
- [ ] Skonfiguruj Private Endpoints dla bazy SQL
- [ ] Włącz Web Application Firewall (WAF)
- [ ] Wdróż Azure Key Vault do rotacji sekretów
- [ ] Skonfiguruj uwierzytelnianie Azure AD
- [ ] Włącz logowanie diagnostyczne dla wszystkich zasobów

## Optymalizacja kosztów

**Szacowane miesięczne koszty** (stan na listopad 2025):

| Zasób | SKU/Tier | Szacowany koszt |
|----------|----------|----------------|
| Plan App Service | B1 (Basic) | ~$13/miesiąc |
| Baza SQL | Basic (2GB) | ~$5/miesiąc |
| Application Insights | Pay-as-you-go | ~$2/miesiąc (niski ruch) |
| **Razem** | | **~$20/miesiąc** |

**💡 Porady oszczędnościowe**:

1. **Używaj warstwy darmowej do nauki**:
   - App Service: tier F1 (darmowy, ograniczona liczba godzin)
   - Baza SQL: użyj Azure SQL Database serverless
   - Application Insights: darmowe 5GB miesięcznie

2. **Wyłącz zasoby, gdy nie są używane**:
   ```sh
   # Zatrzymaj aplikację internetową (baza danych nadal nalicza opłaty)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Uruchom ponownie w razie potrzeby
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Usuń wszystko po testach**:
   ```sh
   azd down
   ```
   To usuwa WSZYSTKIE zasoby i zapobiega dalszym opłatom.

4. **SKU dla developmentu i produkcji**:
   - **Development**: tier Basic (użyty w tym przykładzie)
   - **Produkcja**: tier Standard/Premium z redundancją

**Monitorowanie kosztów**:
- Sprawdzaj koszty w [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Ustaw alerty kosztowe, aby uniknąć niespodzianek
- Oznaczaj zasoby tagiem `azd-env-name` do śledzenia

**Alternatywa warstwy darmowej**:
Do nauki możesz zmodyfikować `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Uwaga**: Warstwa darmowa ma ograniczenia (60 min CPU dziennie, brak always-on).

## Monitoring i obserwowalność

### Integracja Application Insights

Ten przykład zawiera **Application Insights** dla kompleksowego monitoringu:

**Co jest monitorowane**:
- ✅ Żądania HTTP (opóźnienia, kody statusu, endpointy)
- ✅ Błędy i wyjątki aplikacji
- ✅ Własne logi z aplikacji Flask
- ✅ Stan połączenia z bazą danych
- ✅ Metryki wydajności (CPU, pamięć)

**Dostęp do Application Insights**:
1. Otwórz [Azure Portal](https://portal.azure.com)
2. Przejdź do grupy zasobów (`rg-<nazwa-środowiska>`)
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

**Sprawdź endpoint zdrowia**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Audyt bazy danych SQL

**Audyt bazy SQL jest włączony** w celu śledzenia:
- Wzorców dostępu do bazy
- Nieudanych prób logowania
- Zmian schematu
- Dostępu do danych (dla zgodności)

**Dostęp do logów audytu**:
1. Azure Portal → Baza SQL → Audytowanie
2. Przeglądaj logi w Log Analytics workspace

### Monitoring w czasie rzeczywistym

**Wyświetlanie metryk na żywo**:
1. Application Insights → Live Metrics
2. Obserwuj żądania, błędy i wydajność w czasie rzeczywistym

**Ustaw alerty**:
Twórz alerty dla zdarzeń krytycznych:
- Błędy HTTP 500 > 5 w 5 minut
- Nieudane połączenia z bazą danych
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

#### 1. `azd provision` zwraca błąd "Location not available"

**Objaw**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**Rozwiązanie**:  
Wybierz inny region Azure lub zarejestruj dostawcę zasobów:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. Błąd połączenia z SQL podczas wdrażania

**Objaw**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**Rozwiązanie**:  
- Sprawdź, czy zapora SQL Server pozwala na usługi Azure (konfigurowane automatycznie)  
- Upewnij się, że hasło administratora SQL zostało poprawnie wpisane podczas `azd provision`  
- Upewnij się, że SQL Server jest w pełni przygotowany (może to zająć 2-3 minuty)  

**Sprawdź połączenie**:  
```sh
# Z portalu Azure przejdź do Baza danych SQL → Edytor zapytań
# Spróbuj połączyć się za pomocą swoich danych uwierzytelniających
```
  
#### 3. Aplikacja webowa pokazuje "Application Error"

**Objaw**:  
Przeglądarka wyświetla ogólny komunikat o błędzie.

**Rozwiązanie**:  
Sprawdź logi aplikacji:  
```sh
# Wyświetl ostatnie logi
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**Typowe przyczyny**:  
- Brakujące zmienne środowiskowe (sprawdź w App Service → Konfiguracja)  
- Niepowodzenie instalacji pakietów Pythona (sprawdź logi wdrożenia)  
- Błąd inicjalizacji bazy danych (sprawdź łączność z SQL)  

#### 4. `azd deploy` zgłasza "Build Error"

**Objaw**:  
```
Error: Failed to build project
```
  
**Rozwiązanie**:  
- Upewnij się, że plik `requirements.txt` nie zawiera błędów składniowych  
- Sprawdź, czy w `infra/resources/web-app.bicep` jest wskazana wersja Python 3.11  
- Zweryfikuj, czy Dockerfile korzysta z poprawnego obrazu bazowego  

**Debuguj lokalnie**:  
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
# Wymagane dla procesów AZD
azd auth login

# Opcjonalne, jeśli używasz również poleceń Azure CLI bezpośrednio
az login
```
  
Sprawdź, czy masz odpowiednie uprawnienia (rola Contributor) na subskrypcji.

#### 6. Wysokie koszty bazy danych

**Objaw**:  
Nieoczekiwany rachunek z Azure.

**Rozwiązanie**:  
- Sprawdź, czy po testach nie zapomniałeś uruchomić `azd down`  
- Upewnij się, że baza SQL używa poziomu Basic (nie Premium)  
- Przejrzyj koszty w Azure Cost Management  
- Skonfiguruj alerty kosztów  

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
- [Poradnik rozwiązywania problemów AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [Rozwiązywanie problemów Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Rozwiązywanie problemów Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)  

## Ćwiczenia praktyczne

### Ćwiczenie 1: Zweryfikuj swoje wdrożenie (początkujący)

**Cel**: Potwierdź, że wszystkie zasoby zostały wdrożone i aplikacja działa.

**Kroki**:  
1. Wypisz wszystkie zasoby w grupie zasobów:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Oczekiwane**: 6-7 zasobów (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Przetestuj wszystkie końcówki API:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Oczekiwane**: Wszystkie zwracają poprawny JSON bez błędów

3. Sprawdź Application Insights:  
   - Przejdź do Application Insights w Azure Portal  
   - Przejdź do "Live Metrics"  
   - Odśwież przeglądarkę na aplikacji webowej  
   **Oczekiwane**: Widoczne pojawiające się żądania w czasie rzeczywistym

**Kryterium sukcesu**: Wszystkie 6-7 zasobów istnieje, wszystkie endpointy zwracają dane, Live Metrics pokazuje aktywność.

---

### Ćwiczenie 2: Dodaj nowy endpoint API (średniozaawansowany)

**Cel**: Rozszerz aplikację Flask o nowy endpoint.

**Kod startowy**: Obecne endpointy w `src/web/app.py`

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
   **Oczekiwane**: Zwraca produkty pasujące do "laptop"

**Kryterium sukcesu**: Nowy endpoint działa, zwraca filtrowane wyniki, pojawia się w logach Application Insights.

---

### Ćwiczenie 3: Dodaj monitorowanie i alerty (zaawansowany)

**Cel**: Skonfiguruj proaktywne monitorowanie z alertami.

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
  
2. Wywołaj alert poprzez wywołanie błędów:  
   ```sh
   # Żądanie nieistniejącego produktu
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. Sprawdź, czy alert się włączył:  
   - Azure Portal → Alerts → Alert Rules  
   - Sprawdź maila (jeśli skonfigurowano)

**Kryterium sukcesu**: Reguła alertu jest utworzona, wyzwala się przy błędach, powiadomienia są odbierane.

---

### Ćwiczenie 4: Zmiany w schemacie bazy danych (zaawansowany)

**Cel**: Dodaj nową tabelę i zmodyfikuj aplikację, by z niej korzystała.

**Kroki**:  
1. Połącz się z bazą SQL przez Azure Portal Query Editor

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
  
3. Zaktualizuj `src/web/app.py`, by uwzględniał informacje o kategoriach w odpowiedziach

4. Wdróż i przetestuj

**Kryterium sukcesu**: Nowa tabela istnieje, produkty pokazują informacje o kategoriach, aplikacja działa poprawnie.

---

### Ćwiczenie 5: Wdrożenie cache’owania (ekspert)

**Cel**: Dodaj Azure Redis Cache, aby poprawić wydajność.

**Kroki**:  
1. Dodaj Redis Cache do `infra/main.bicep`  
2. Zaktualizuj `src/web/app.py`, aby cache’ować zapytania produktów  
3. Zmierz poprawę wydajności za pomocą Application Insights  
4. Porównaj czasy odpowiedzi przed i po cache’owaniu  

**Kryterium sukcesu**: Redis jest wdrożony, cache działa, czas odpowiedzi poprawia się o >50%.

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
- Wszystkie zasoby usunięte z Azure Portal  
- Brak dalszych opłat  
- Lokalne foldery `.azure/<env-name>` mogą zostać usunięte  

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
- **[Przykład Container Apps](../../../../examples/container-app)**: Wdrażanie mikroserwisów z Azure Container Apps  
- **[Przewodnik integracji AI](../../../../docs/ai-foundry)**: Dodaj funkcje AI do swojej aplikacji  
- **[Najlepsze praktyki wdrażania](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Wzorce produkcyjnego wdrażania  

### Tematy zaawansowane
- **Managed Identity**: Usuń hasła, używaj uwierzytelniania Azure AD  
- **Prywatne końcówki (Private Endpoints)**: Zabezpiecz połączenia z bazą wewnątrz sieci wirtualnej  
- **Integracja CI/CD**: Automatyzuj wdrożenia z GitHub Actions lub Azure DevOps  
- **Środowiska wieloetapowe**: Konfiguruj środowiska deweloperskie, testowe i produkcyjne  
- **Migracje bazy danych**: Używaj Alembic lub Entity Framework do wersjonowania schematów  

### Porównanie z innymi podejściami

**AZD vs. szablony ARM**:  
- ✅ AZD: Wyższy poziom abstrakcji, prostsze polecenia  
- ⚠️ ARM: Bardziej szczegółowe, większa kontrola  

**AZD vs. Terraform**:  
- ✅ AZD: Natywne dla Azure, zintegrowane z usługami Azure  
- ⚠️ Terraform: Wielochmurowe wsparcie, większy ekosystem  

**AZD vs. Azure Portal**:  
- ✅ AZD: Powtarzalne, wersjonowane, automatyzowalne  
- ⚠️ Portal: Ręczne klikanie, trudne do powtórzenia  

**Myśl o AZD jak o**: Docker Compose dla Azure — uproszczona konfiguracja dla złożonych wdrożeń.

---

## Najczęściej zadawane pytania

**P: Czy mogę używać innego języka programowania?**  
O: Tak! Zastąp `src/web/` aplikacją Node.js, C#, Go lub dowolnym językiem. Zaktualizuj `azure.yaml` i Bicep odpowiednio.

**P: Jak dodać więcej baz danych?**  
O: Dodaj kolejny moduł SQL Database w `infra/main.bicep` lub użyj PostgreSQL/MySQL z usług Azure Database.

**P: Czy mogę używać tego w produkcji?**  
O: To punkt startowy. Do produkcji dodaj: managed identity, prywatne końcówki, redundancję, strategię backupu, WAF oraz rozszerzone monitorowanie.

**P: Co jeśli chcę użyć kontenerów zamiast wdrożenia kodu?**  
O: Sprawdź [Przykład Container Apps](../../../../examples/container-app), który używa kontenerów Docker przez cały czas.

**P: Jak połączyć się z bazą z lokalnego komputera?**  
O: Dodaj swój adres IP do zapory SQL Server:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**P: Czy mogę użyć istniejącej bazy zamiast tworzyć nową?**  
O: Tak, zmodyfikuj `infra/main.bicep`, aby odwoływała się do istniejącego SQL Server i zaktualizuj parametry connection string.

---

> **Uwaga:** Ten przykład demonstruje najlepsze praktyki wdrażania aplikacji webowej z bazą danych za pomocą AZD. Zawiera działający kod, pełną dokumentację i ćwiczenia praktyczne wspierające naukę. Dla produkcyjnych wdrożeń przejrzyj wymagania dotyczące bezpieczeństwa, skalowalności, zgodności i kosztów specyficznych dla Twojej organizacji.

**📚 Nawigacja po kursie:**  
- ← Poprzedni: [Przykład Container Apps](../../../../examples/container-app)  
- → Następny: [Przewodnik integracji AI](../../../../docs/ai-foundry)  
- 🏠 [Strona główna kursu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być traktowany jako autorytatywne źródło. Dla informacji krytycznych zalecane jest korzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->