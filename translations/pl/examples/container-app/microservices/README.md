# Architektura mikroserwisów - przykład aplikacji kontenerowej

⏱️ **Szacowany czas**: 25-35 minut | 💰 **Szacowany koszt**: ~50-100 USD/miesiąc | ⭐ **Złożoność**: Zaawansowany

**Uproszczona, ale funkcjonalna** architektura mikroserwisów wdrożona do Azure Container Apps za pomocą AZD CLI. Ten przykład demonstruje komunikację między usługami, orkiestrację kontenerów oraz monitorowanie na praktycznym przykładzie z dwoma usługami.

> **📚 Podejście do nauki**: Ten przykład zaczyna się od minimalnej architektury z 2 usługami (API Gateway + Backend Service), którą faktycznie możesz wdrożyć i z niej się uczyć. Po opanowaniu tej podstawy, udostępniamy wskazówki do rozszerzania na pełny ekosystem mikroserwisów.

## Czego się nauczysz

Po ukończeniu tego przykładu:
- Wdrożysz wiele kontenerów do Azure Container Apps
- Zaimplementujesz komunikację service-to-service z użyciem wewnętrznej sieci
- Skonfigurujesz skalowanie zależne od środowiska oraz kontrole stanu zdrowia
- Będziesz monitorować rozproszone aplikacje za pomocą Application Insights
- Zrozumiesz wzorce wdrożeń mikroserwisów oraz dobre praktyki
- Nauczysz się stopniowego rozwoju od prostych do złożonych architektur

## Architektura

### Faza 1: Co budujemy (zawarte w tym przykładzie)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Dlaczego zacząć prosto?**
- ✅ Szybkie wdrożenie i zrozumienie (25-35 minut)
- ✅ Nauka podstawowych wzorców mikroserwisów bez złożoności
- ✅ Działający kod, który możesz modyfikować i eksperymentować
- ✅ Niższy koszt nauki (~50-100 USD/miesiąc vs 300-1400 USD/miesiąc)
- ✅ Zdobycie pewności zanim dodasz bazy danych i kolejki komunikatów

**Analogia**: Pomyśl o tym jak o nauce jazdy. Zaczynasz na pustym parkingu (2 usługi), opanowujesz podstawy, potem przechodzisz do ruchu miejskiego (5+ usług z bazami danych).

### Faza 2: Przyszłe rozszerzenie (architektura referencyjna)

Po opanowaniu architektury 2 usług możesz rozszerzyć do:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Zobacz sekcję "Expansion Guide" na końcu dla instrukcji krok po kroku.

## Zawarte funkcje

✅ **Odkrywanie usług**: Automatyczne odkrywanie DNS między kontenerami  
✅ **Balansowanie obciążenia**: Wbudowane równoważenie między replikami  
✅ **Automatyczne skalowanie**: Niezależne skalowanie na usługę na podstawie żądań HTTP  
✅ **Monitorowanie stanu zdrowia**: Proby liveness i readiness dla obu usług  
✅ **Centralne logowanie**: Centralizacja logów z Application Insights  
✅ **Sieć wewnętrzna**: Bezpieczna komunikacja service-to-service  
✅ **Orkiestracja kontenerów**: Automatyczne wdrażanie i skalowanie  
✅ **Aktualizacje bez przestojów**: Rolling updates z zarządzaniem rewizjami  

## Wymagania wstępne

### Wymagane narzędzia

Przed rozpoczęciem upewnij się, że masz zainstalowane te narzędzia:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (wersja 1.0.0 lub wyższa)
   ```bash
   azd version
   # Oczekiwane wyjście: wersja azd 1.0.0 lub wyższa
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (wersja 2.50.0 lub wyższa)
   ```bash
   az --version
   # Oczekiwany wynik: azure-cli 2.50.0 lub wyższa wersja
   ```

3. **[Docker](https://www.docker.com/get-started)** (do lokalnego developmentu/testów - opcjonalnie)
   ```bash
   docker --version
   # Oczekiwany wynik: wersja Dockera 20.10 lub wyższa
   ```

### Wymagania Azure

- Aktywna **subskrypcja Azure** ([utwórz darmowe konto](https://azure.microsoft.com/free/))
- Uprawnienia do tworzenia zasobów w subskrypcji
- Rola **Contributor** na subskrypcji lub grupie zasobów

### Wiedza wstępna

To przykład na **poziomie zaawansowanym**. Powinieneś mieć:
- Ukończony [prosty przykład Flask API](../../../../../examples/container-app/simple-flask-api)
- Podstawową wiedzę o architekturze mikroserwisów
- Znajomość REST API i HTTP
- Zrozumienie koncepcji kontenerów

**Nowy w Container Apps?** Zacznij od [prostego przykładu Flask API](../../../../../examples/container-app/simple-flask-api), aby poznać podstawy.

## Szybki start (krok po kroku)

### Krok 1: Klonuj i przejdź do katalogu

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Sprawdzenie poprawności**: Upewnij się, że widzisz plik `azure.yaml`:
```bash
ls
# Oczekiwane: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autoryzacja w Azure

```bash
azd auth login
```

Otworzy się przeglądarka do logowania w Azure. Zaloguj się używając swoich danych do Azure.

**✓ Sprawdzenie poprawności**: Powinieneś zobaczyć:
```
Logged in to Azure.
```

### Krok 3: Inicjalizacja środowiska

```bash
azd init
```

**Wyświetlane pytania**:
- **Nazwa środowiska**: Wpisz krótką nazwę (np. `microservices-dev`)
- **Subskrypcja Azure**: Wybierz swoją subskrypcję
- **Lokalizacja Azure**: Wybierz region (np. `eastus`, `westeurope`)

**✓ Sprawdzenie poprawności**: Powinieneś zobaczyć:
```
SUCCESS: New project initialized!
```

### Krok 4: Wdrożenie infrastruktury i usług

```bash
azd up
```

**Co się stanie** (zajmuje 8-12 minut):
1. Tworzy środowisko Container Apps
2. Tworzy Application Insights do monitoringu
3. Buduje kontener API Gateway (Node.js)
4. Buduje kontener Product Service (Python)
5. Wdraża oba kontenery do Azure
6. Konfiguruje sieć i kontrole stanu zdrowia
7. Ustawia monitoring i logowanie

**✓ Sprawdzenie poprawności**: Powinieneś zobaczyć:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Czas**: 8-12 minut

### Krok 5: Test wdrożenia

```bash
# Pobierz punkt końcowy bramy
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testuj stan zdrowia API Gateway
curl $GATEWAY_URL/health

# Oczekiwany wynik:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test usługi produktów przez bramę**:
```bash
# Lista produktów
curl $GATEWAY_URL/api/products

# Oczekiwany wynik:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mysz","price":29.99,"stock":200},
#   {"id":3,"name":"Klawiatura","price":79.99,"stock":150}
# ]
```

**✓ Sprawdzenie poprawności**: Oba endpointy zwracają dane JSON bez błędów.

---

**🎉 Gratulacje!** Wdrożyłeś architekturę mikroserwisów do Azure!

## Struktura projektu

Wszystkie pliki implementacji są dołączone — to kompletny, działający przykład:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Co robi każdy komponent:**

**Infrastruktura (infra/)**:
- `main.bicep`: Orkiestruje wszystkie zasoby Azure i ich zależności
- `core/container-apps-environment.bicep`: Tworzy środowisko Container Apps i Azure Container Registry
- `core/monitor.bicep`: Konfiguruje Application Insights do dystrybuowanego logowania
- `app/*.bicep`: Definicje poszczególnych aplikacji kontenerowych ze skalowaniem i kontrolami stanu zdrowia

**API Gateway (src/api-gateway/)**:
- Usługa publiczna przekierowująca żądania do backendu
- Implementuje logowanie, obsługę błędów i forwardowanie żądań
- Demonstruje HTTP komunikację między usługami

**Product Service (src/product-service/)**:
- Usługa wewnętrzna z katalogiem produktów (w pamięci dla prostoty)
- REST API z kontrolami stanu zdrowia
- Przykład wzorca mikroserwisu backendowego

## Przegląd usług

### API Gateway (Node.js/Express)

**Port**: 8080  
**Dostęp**: Publiczny (zewnętrzny ingress)  
**Cel**: Przekierowuje przychodzące żądania do odpowiednich backendów  

**Endpointy**:
- `GET /` - Informacje o usłudze
- `GET /health` - Punkt kontroli zdrowia
- `GET /api/products` - Przekierowanie do usługi produktów (lista wszystkich)
- `GET /api/products/:id` - Przekierowanie do usługi produktów (szczegóły po ID)

**Najważniejsze cechy**:
- Routing żądań z axios
- Centralne logowanie
- Obsługa błędów i timeoutów
- Odkrywanie usług przez zmienne środowiskowe
- Integracja z Application Insights

**Fragment kodu** (`src/api-gateway/app.js`):
```javascript
// Wewnętrzna komunikacja usług
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Dostęp**: Wewnętrzny tylko (brak zewnętrznego ingress)  
**Cel**: Zarządza katalogiem produktów w pamięci  

**Endpointy**:
- `GET /` - Informacje o usłudze
- `GET /health` - Punkt kontroli zdrowia
- `GET /products` - Lista wszystkich produktów
- `GET /products/<id>` - Pobierz produkt po ID

**Najważniejsze cechy**:
- RESTful API z Flaskiem
- Sklep produktów w pamięci (prosty, bez bazy danych)
- Monitorowanie zdrowia przez proby
- Strukturalne logowanie
- Integracja z Application Insights

**Model danych**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Dlaczego tylko wewnętrzny?**
Usługa produktów nie jest dostępna publicznie. Wszystkie żądania muszą przechodzić przez API Gateway, które zapewnia:
- Bezpieczeństwo: kontrolowany punkt dostępu
- Elastyczność: można zmieniać backend bez wpływu na klientów
- Monitorowanie: centralne logowanie żądań

## Zrozumienie komunikacji między usługami

### Jak usługi się komunikują

W tym przykładzie API Gateway komunikuje się z Product Service za pomocą **wewnętrznych wywołań HTTP**:

```javascript
// Brama API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Wykonaj wewnętrzne żądanie HTTP
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Najważniejsze punkty**:

1. **Odkrywanie DNS**: Container Apps automatycznie zapewnia DNS dla usług wewnętrznych
   - FQDN Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Uproszczone jako: `http://product-service` (Container Apps rozwiązuje to)

2. **Brak publicznego dostępu**: Product Service ma `external: false` w Bicep
   - Dostępna tylko w środowisku Container Apps
   - Niedostępna z internetu

3. **Zmienne środowiskowe**: URL-e usług są wstrzykiwane podczas wdrożenia
   - Bicep przekazuje wewnętrzny FQDN do bramy
   - Brak twardo zakodowanych URL-i w aplikacji

**Analogia**: Pomyśl o tym jak o pokojach biurowych. API Gateway to recepcja (widoczna na zewnątrz), a Product Service to pokój (tylko wewnętrzny). Goście muszą przejść przez recepcję, aby dotrzeć do pokoju.

## Opcje wdrożenia

### Pełne wdrożenie (zalecane)

```bash
# Wdróż infrastrukturę i obie usługi
azd up
```

To wdrożenie zawiera:
1. Środowisko Container Apps
2. Application Insights
3. Registry kontenerów
4. Kontener API Gateway
5. Kontener Product Service

**Czas**: 8-12 minut

### Wdrożenie pojedynczej usługi

```bash
# Wdróż tylko jedną usługę (po wstępnym azd up)
azd deploy api-gateway

# Lub wdroż usługę produktu
azd deploy product-service
```

**Zastosowanie**: Gdy zaktualizujesz kod jednej usługi i chcesz wdrożyć tylko ją.

### Aktualizacja konfiguracji

```bash
# Zmień parametry skalowania
azd env set GATEWAY_MAX_REPLICAS 30

# Ponownie wdroż z nową konfiguracją
azd up
```

## Konfiguracja

### Konfiguracja skalowania

Obie usługi mają skonfigurowane autoskalowanie oparte na HTTP w plikach Bicep:

**API Gateway**:
- Min replik: 2 (zawsze co najmniej 2 dla dostępności)
- Max replik: 20
- Wyzwalacz skalowania: 50 jednoczesnych żądań na replikę

**Product Service**:
- Min replik: 1 (może skalować do zera, jeśli potrzeba)
- Max replik: 10
- Wyzwalacz skalowania: 100 jednoczesnych żądań na replikę

**Dostosowanie skalowania** (w `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Przydział zasobów

**API Gateway**:
- CPU: 1.0 vCPU
- Pamięć: 2 GiB
- Powód: Obsługuje cały ruch zewnętrzny

**Product Service**:
- CPU: 0.5 vCPU
- Pamięć: 1 GiB
- Powód: Lekka operacja w pamięci

### Kontrole zdrowia

Obie usługi mają proby liveness i readiness:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Co to oznacza**:
- **Liveness**: Jeśli próba zakończy się niepowodzeniem, Container Apps restartuje kontener
- **Readiness**: Jeśli usługa nie jest gotowa, Container Apps przestaje kierować do niej ruch



## Monitorowanie i obserwowalność

### Podgląd logów usług

```bash
# Przeglądaj logi za pomocą azd monitor
azd monitor --logs

# Lub użyj Azure CLI dla konkretnych aplikacji kontenerowych:
# Przesyłaj na żywo logi z bramki API
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Przeglądaj ostatnie logi usługi produktu
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Oczekiwany wynik**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Zapytania Application Insights

Wejdź do Application Insights w Azure Portal, potem uruchom te zapytania:

**Znajdź wolne żądania**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Śledź wywołania service-to-service**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Wskaźnik błędów wg usługi**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Wolumen żądań w czasie**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Dostęp do dashboardu monitorowania

```bash
# Pobierz szczegóły Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otwórz monitorowanie w Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metryki na żywo

1. Przejdź do Application Insights w Azure Portal
2. Kliknij "Live Metrics"
3. Zobacz żądania, błędy i wydajność w czasie rzeczywistym
4. Przetestuj, uruchamiając: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Ćwiczenia praktyczne

[Uwaga: Zobacz pełne ćwiczenia powyżej w sekcji "Practical Exercises" dla szczegółowych kroków weryfikacji wdrożenia, modyfikacji danych, testów autoskalowania, obsługi błędów oraz dodawania trzeciej usługi.]

## Analiza kosztów

### Szacowane miesięczne koszty (dla tego przykładu z 2 usługami)

| Zasób | Konfiguracja | Szacowany koszt |
|----------|--------------|----------------|
| API Gateway | 2-20 replik, 1 vCPU, 2GB RAM | 30-150 USD |
| Product Service | 1-10 replik, 0.5 vCPU, 1GB RAM | 15-75 USD |
| Container Registry | Podstawowy plan | 5 USD |
| Application Insights | 1-2 GB/miesiąc | 5-10 USD |
| Log Analytics | 1 GB/miesiąc | 3 USD |
| **Razem** | | **58-243 USD/miesiąc** |

**Rozbicie kosztów według użycia**:
- **Lekki ruch** (testy/nauka): ~60 USD/miesiąc
- **Średni ruch** (mała produkcja): ~120 USD/miesiąc
- **Duży ruch** (okresy szczytowe): ~240 USD/miesiąc

### Wskazówki optymalizacji kosztów

1. **Skaluj do zera w środowisku deweloperskim**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Używaj planu konsumcyjnego dla Cosmos DB** (gdy dodasz):
   - Płać tylko za wykorzystane zasoby
   - Brak minimalnych opłat

3. **Ustaw próbkowanie w Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Próbkuj 50% żądań
   ```

4. **Sprzątaj, gdy nie potrzebujesz zasobów**:
   ```bash
   azd down
   ```

### Opcje darmowego planu
Do nauki/testów rozważ:
- Skorzystaj z bezpłatnych kredytów Azure (pierwsze 30 dni)
- Utrzymuj minimalną liczbę replik
- Usuń po testach (brak ciągłych opłat)

---

## Sprzątanie

Aby uniknąć stałych opłat, usuń wszystkie zasoby:

```bash
azd down --force --purge
```

**Potwierdzenie**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Wpisz `y`, aby potwierdzić.

**Co zostaje usunięte**:
- Środowisko Container Apps
- Oba Container Apps (gateway i usługa produktu)
- Rejestr kontenerów
- Application Insights
- Log Analytics Workspace
- Grupa zasobów

**✓ Sprawdź sprzątanie**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Powinno zwrócić pusty wynik.

---

## Przewodnik Rozszerzania: Od 2 do 5+ usług

Gdy opanujesz architekturę z 2 usługami, możesz rozszerzyć ją w następujący sposób:

### Faza 1: Dodaj trwałość bazy danych (następny krok)

**Dodaj Cosmos DB dla usługi produktu**:

1. Utwórz `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Zaktualizuj usługę produktu, aby korzystała z Cosmos DB zamiast danych w pamięci

3. Szacowany dodatkowy koszt: ~25 USD/miesiąc (serverless)

### Faza 2: Dodaj trzecią usługę (Zarządzanie Zamówieniami)

**Utwórz usługę zamówień**:

1. Nowy folder: `src/order-service/` (Python/Node.js/C#)
2. Nowy Bicep: `infra/app/order-service.bicep`
3. Zaktualizuj API Gateway, by kierował do `/api/orders`
4. Dodaj Azure SQL Database do przechowywania zamówień

**Architektura wygląda teraz tak**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faza 3: Dodaj asynchroniczną komunikację (Service Bus)

**Wdrożenie architektury zdarzeniowej**:

1. Dodaj Azure Service Bus: `infra/core/servicebus.bicep`
2. Usługa produktu publikuje zdarzenia "ProductCreated"
3. Usługa zamówień subskrybuje zdarzenia produktu
4. Dodaj usługę powiadomień do przetwarzania zdarzeń

**Wzór**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Faza 4: Dodaj uwierzytelnianie użytkowników

**Wdrożenie usługi użytkownika**:

1. Utwórz `src/user-service/` (Go/Node.js)
2. Dodaj Azure AD B2C lub niestandardowe uwierzytelnianie JWT
3. API Gateway waliduje tokeny
4. Usługi sprawdzają uprawnienia użytkowników

### Faza 5: Gotowość produkcyjna

**Dodaj te komponenty**:
- Azure Front Door (globalne równoważenie obciążenia)
- Azure Key Vault (zarządzanie sekretami)
- Azure Monitor Workbooks (własne pulpity)
- CI/CD Pipeline (GitHub Actions)
- Wdrażanie Blue-Green
- Managed Identity dla wszystkich usług

**Pełna kosztorys architektury produkcyjnej**: ~300-1400 USD/miesiąc

---

## Dowiedz się więcej

### Powiązana dokumentacja
- [Dokumentacja Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Przewodnik architektury mikroserwisów](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights do śledzenia rozproszonego](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Kolejne kroki w tym kursie
- ← Poprzedni: [Proste API Flask](../../../../../examples/container-app/simple-flask-api) - Przykład dla początkujących z jednym kontenerem
- → Następny: [Przewodnik integracji AI](../../../../../examples/docs/ai-foundry) - Dodaj funkcje AI
- 🏠 [Strona główna kursu](../../README.md)

### Porównanie: Kiedy co używać

**Pojedyncza aplikacja kontenerowa** (przykład prostego API Flask):
- ✅ Proste aplikacje
- ✅ Architektura monolityczna
- ✅ Szybkie wdrożenie
- ❌ Ograniczona skalowalność
- **Koszt**: ~15-50 USD/miesiąc

**Mikroserwisy** (ten przykład):
- ✅ Złożone aplikacje
- ✅ Niezależne skalowanie poszczególnych usług
- ✅ Autonomia zespołów (różne usługi, różne zespoły)
- ❌ Bardziej skomplikowane zarządzanie
- **Koszt**: ~60-250 USD/miesiąc

**Kubernetes (AKS)**:
- ✅ Maksymalna kontrola i elastyczność
- ✅ Wielochmurowość
- ✅ Zaawansowane sieciowanie
- ❌ Wymaga wiedzy o Kubernetes
- **Koszt**: ~150-500 USD/miesiąc minimalnie

**Rekomendacja**: Zacznij od Container Apps (ten przykład), przejdź na AKS tylko jeśli potrzebujesz funkcji specyficznych dla Kubernetes.

---

## Najczęściej zadawane pytania

**P: Dlaczego tylko 2 usługi zamiast 5+?**  
O: To jest stopniowa nauka. Opanuj podstawy (komunikacja usług, monitoring, skalowanie) na prostym przykładzie, zanim dodasz złożoność. Wzorce, które tu poznasz, mają zastosowanie do architektur z 100 usługami.

**P: Czy mogę samodzielnie dodać więcej usług?**  
O: Oczywiście! Postępuj zgodnie z powyższym przewodnikiem rozszerzania. Każda nowa usługa to ten sam wzór: utwórz folder src, utwórz plik Bicep, zaktualizuj azure.yaml, wdroż.

**P: Czy to nadaje się do produkcji?**  
O: To solidna podstawa. Do produkcji należy dodać: managed identity, Key Vault, trwałe bazy danych, pipeline CI/CD, alerty monitorujące i strategię kopii zapasowych.

**P: Dlaczego nie użyć Dapr lub innej siatki usług?**  
O: Trzymaj się prostoty na początku nauki. Gdy poznasz natywne sieciowanie Container Apps, możesz dołożyć Dapr dla zaawansowanych scenariuszy.

**P: Jak debugować lokalnie?**  
O: Uruchom usługi lokalnie za pomocą Dockera:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**P: Czy mogę używać różnych języków programowania?**  
O: Tak! Ten przykład pokazuje Node.js (gateway) + Python (usługa produktu). Możesz mieszać dowolne języki działające w kontenerach.

**P: Co jeśli nie mam kredytów Azure?**  
O: Skorzystaj z darmowego poziomu Azure (pierwsze 30 dni dla nowych kont) lub wdrażaj na krótkie testy i od razu usuwaj.

---

> **🎓 Podsumowanie ścieżki nauki**: Nauczyłeś się wdrażać architekturę wielousługową z automatycznym skalowaniem, siecią wewnętrzną, scentralizowanym monitoringiem oraz wzorcami gotowymi do produkcji. Ta podstawa przygotowuje do zaawansowanych systemów rozproszonych i architektur mikroserwisów w przedsiębiorstwach.

**📚 Nawigacja kursu:**
- ← Poprzedni: [Proste API Flask](../../../../../examples/container-app/simple-flask-api)
- → Następny: [Przykład integracji bazy danych](../../../../../examples/database-app)
- 🏠 [Strona główna kursu](../../../README.md)
- 📖 [Najlepsze praktyki Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najbardziej precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->