# Architektura Mikroserwisów - Przykład Aplikacji Kontenerowej

⏱️ **Szacowany czas**: 25-35 minut | 💰 **Szacowany koszt**: ~$50-100/miesiąc | ⭐ **Poziom trudności**: Zaawansowany

**Uproszczona, ale funkcjonalna** architektura mikroserwisów wdrożona na Azure Container Apps za pomocą AZD CLI. Ten przykład pokazuje komunikację między usługami, orkiestrację kontenerów oraz monitorowanie w praktycznym układzie dwóch usług.

> **📚 Podejście do nauki**: Ten przykład zaczyna się od minimalnej architektury dwóch usług (API Gateway + Backend Service), którą można faktycznie wdrożyć i nauczyć się na jej podstawie. Po opanowaniu podstaw, dostarczamy wskazówki dotyczące rozbudowy do pełnego ekosystemu mikroserwisów.

## Czego się nauczysz

Po ukończeniu tego przykładu nauczysz się:
- Wdrażać wiele kontenerów na Azure Container Apps
- Implementować komunikację między usługami za pomocą sieci wewnętrznej
- Konfigurować skalowanie i sprawdzanie kondycji w zależności od środowiska
- Monitorować aplikacje rozproszone za pomocą Application Insights
- Rozumieć wzorce wdrażania mikroserwisów i najlepsze praktyki
- Rozwijać architekturę od prostych do bardziej złożonych układów

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

**Dlaczego warto zacząć od prostego układu?**
- ✅ Szybkie wdrożenie i zrozumienie (25-35 minut)
- ✅ Nauka podstawowych wzorców mikroserwisów bez zbędnej złożoności
- ✅ Działający kod, który można modyfikować i testować
- ✅ Niższe koszty nauki (~$50-100/miesiąc vs $300-1400/miesiąc)
- ✅ Budowanie pewności siebie przed dodaniem baz danych i kolejek wiadomości

**Analogicznie**: To jak nauka jazdy. Zaczynasz na pustym parkingu (2 usługi), opanowujesz podstawy, a potem przechodzisz do ruchu miejskiego (5+ usług z bazami danych).

### Faza 2: Rozbudowa w przyszłości (architektura referencyjna)

Po opanowaniu architektury dwóch usług możesz ją rozbudować do:

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

Zobacz sekcję "Przewodnik rozbudowy" na końcu, aby uzyskać instrukcje krok po kroku.

## Zawarte funkcje

✅ **Odkrywanie usług**: Automatyczne odkrywanie DNS między kontenerami  
✅ **Równoważenie obciążenia**: Wbudowane równoważenie obciążenia między replikami  
✅ **Autoskalowanie**: Niezależne skalowanie każdej usługi na podstawie żądań HTTP  
✅ **Monitorowanie kondycji**: Proby liveness i readiness dla obu usług  
✅ **Rozproszone logowanie**: Centralne logowanie za pomocą Application Insights  
✅ **Sieć wewnętrzna**: Bezpieczna komunikacja między usługami  
✅ **Orkiestracja kontenerów**: Automatyczne wdrażanie i skalowanie  
✅ **Aktualizacje bez przestojów**: Aktualizacje rolling z zarządzaniem wersjami  

## Wymagania wstępne

### Wymagane narzędzia

Przed rozpoczęciem upewnij się, że masz zainstalowane następujące narzędzia:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (wersja 1.0.0 lub wyższa)  
   ```bash
   azd version
   # Oczekiwany wynik: wersja azd 1.0.0 lub wyższa
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (wersja 2.50.0 lub wyższa)  
   ```bash
   az --version
   # Oczekiwany wynik: azure-cli 2.50.0 lub wyższy
   ```

3. **[Docker](https://www.docker.com/get-started)** (do lokalnego rozwoju/testowania - opcjonalnie)  
   ```bash
   docker --version
   # Oczekiwany wynik: wersja Dockera 20.10 lub wyższa
   ```


### Wymagania dotyczące Azure

- Aktywna **subskrypcja Azure** ([utwórz darmowe konto](https://azure.microsoft.com/free/))
- Uprawnienia do tworzenia zasobów w subskrypcji
- Rola **Contributor** w subskrypcji lub grupie zasobów

### Wymagania dotyczące wiedzy

To jest przykład na **poziomie zaawansowanym**. Powinieneś:
- Ukończyć [Prosty przykład Flask API](../../../../../examples/container-app/simple-flask-api)  
- Mieć podstawową wiedzę o architekturze mikroserwisów
- Znać podstawy REST API i HTTP
- Rozumieć koncepcje kontenerów

**Nowy w Container Apps?** Zacznij od [Prostego przykładu Flask API](../../../../../examples/container-app/simple-flask-api), aby nauczyć się podstaw.

## Szybki start (krok po kroku)

### Krok 1: Klonowanie i nawigacja

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Sprawdzenie sukcesu**: Upewnij się, że widzisz `azure.yaml`:  
```bash
ls
# Oczekiwane: README.md, azure.yaml, infra/, src/
```


### Krok 2: Uwierzytelnienie w Azure

```bash
azd auth login
```

Otworzy się przeglądarka do uwierzytelnienia w Azure. Zaloguj się swoimi danymi Azure.

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:  
```
Logged in to Azure.
```


### Krok 3: Inicjalizacja środowiska

```bash
azd init
```

**Pojawią się pytania**:
- **Nazwa środowiska**: Wprowadź krótką nazwę (np. `microservices-dev`)
- **Subskrypcja Azure**: Wybierz swoją subskrypcję
- **Lokalizacja Azure**: Wybierz region (np. `eastus`, `westeurope`)

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:  
```
SUCCESS: New project initialized!
```


### Krok 4: Wdrażanie infrastruktury i usług

```bash
azd up
```

**Co się dzieje** (trwa 8-12 minut):
1. Tworzy środowisko Container Apps
2. Tworzy Application Insights do monitorowania
3. Buduje kontener API Gateway (Node.js)
4. Buduje kontener Product Service (Python)
5. Wdraża oba kontenery na Azure
6. Konfiguruje sieć i sprawdzanie kondycji
7. Ustawia monitorowanie i logowanie

**✓ Sprawdzenie sukcesu**: Powinieneś zobaczyć:  
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Czas**: 8-12 minut

### Krok 5: Testowanie wdrożenia

```bash
# Pobierz punkt końcowy bramy
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Przetestuj stan zdrowia API Gateway
curl $GATEWAY_URL/health

# Oczekiwany wynik:
# {"status":"zdrowy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testowanie usługi produktowej przez bramę**:  
```bash
# Wymień produkty
curl $GATEWAY_URL/api/products

# Oczekiwany wynik:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Myszka","price":29.99,"stock":200},
#   {"id":3,"name":"Klawiatura","price":79.99,"stock":150}
# ]
```

**✓ Sprawdzenie sukcesu**: Oba punkty końcowe zwracają dane JSON bez błędów.

---

**🎉 Gratulacje!** Wdrożyłeś architekturę mikroserwisów na Azure!

## Struktura projektu

Wszystkie pliki implementacyjne są zawarte—jest to kompletny, działający przykład:

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
- `core/monitor.bicep`: Konfiguruje Application Insights do rozproszonego logowania
- `app/*.bicep`: Definicje poszczególnych aplikacji kontenerowych ze skalowaniem i sprawdzaniem kondycji

**API Gateway (src/api-gateway/)**:
- Usługa publiczna, która przekierowuje żądania do usług backendowych
- Implementuje logowanie, obsługę błędów i przekazywanie żądań
- Pokazuje komunikację HTTP między usługami

**Product Service (src/product-service/)**:
- Usługa wewnętrzna z katalogiem produktów (w pamięci dla uproszczenia)
- REST API ze sprawdzaniem kondycji
- Przykład wzorca mikroserwisu backendowego

## Przegląd usług

### API Gateway (Node.js/Express)

**Port**: 8080  
**Dostęp**: Publiczny (zewnętrzny ingress)  
**Cel**: Przekierowuje przychodzące żądania do odpowiednich usług backendowych  

**Punkty końcowe**:
- `GET /` - Informacje o usłudze
- `GET /health` - Punkt końcowy sprawdzania kondycji
- `GET /api/products` - Przekierowanie do usługi produktowej (lista wszystkich)
- `GET /api/products/:id` - Przekierowanie do usługi produktowej (pobierz według ID)

**Kluczowe funkcje**:
- Przekierowanie żądań za pomocą axios
- Centralne logowanie
- Obsługa błędów i zarządzanie timeoutami
- Odkrywanie usług za pomocą zmiennych środowiskowych
- Integracja z Application Insights

**Fragment kodu** (`src/api-gateway/app.js`):  
```javascript
// Komunikacja wewnętrzna usług
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```


### Product Service (Python/Flask)

**Port**: 8000  
**Dostęp**: Tylko wewnętrzny (bez zewnętrznego ingressu)  
**Cel**: Zarządza katalogiem produktów z danymi w pamięci  

**Punkty końcowe**:
- `GET /` - Informacje o usłudze
- `GET /health` - Punkt końcowy sprawdzania kondycji
- `GET /products` - Lista wszystkich produktów
- `GET /products/<id>` - Pobierz produkt według ID

**Kluczowe funkcje**:
- RESTful API z Flask
- Sklep produktów w pamięci (prosty, bez bazy danych)
- Monitorowanie kondycji za pomocą probe
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


**Dlaczego tylko wewnętrzny dostęp?**
Usługa produktowa nie jest wystawiona publicznie. Wszystkie żądania muszą przechodzić przez API Gateway, co zapewnia:
- Bezpieczeństwo: Kontrolowany punkt dostępu
- Elastyczność: Możliwość zmiany backendu bez wpływu na klientów
- Monitorowanie: Centralne logowanie żądań

## Zrozumienie komunikacji między usługami

### Jak usługi komunikują się ze sobą

W tym przykładzie API Gateway komunikuje się z Product Service za pomocą **wewnętrznych wywołań HTTP**:

```javascript
// Brama API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Wykonaj wewnętrzne żądanie HTTP
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Kluczowe punkty**:

1. **Odkrywanie DNS**: Container Apps automatycznie zapewnia DNS dla usług wewnętrznych
   - FQDN usługi produktowej: `product-service.internal.<environment>.azurecontainerapps.io`
   - Uproszczone jako: `http://product-service` (Container Apps rozwiązuje to)

2. **Brak publicznego dostępu**: Usługa produktowa ma `external: false` w Bicep
   - Dostępna tylko w środowisku Container Apps
   - Nie można jej osiągnąć z internetu

3. **Zmienne środowiskowe**: URL usług są wstrzykiwane podczas wdrożenia
   - Bicep przekazuje wewnętrzny FQDN do bramy
   - Brak twardo zakodowanych URL w kodzie aplikacji

**Analogicznie**: To jak pokoje biurowe. API Gateway to recepcja (publiczna), a Product Service to pokój biurowy (tylko wewnętrzny). Odwiedzający muszą przejść przez recepcję, aby dotrzeć do jakiegokolwiek pokoju.

## Opcje wdrożenia

### Pełne wdrożenie (zalecane)

```bash
# Wdróż infrastrukturę i oba serwisy
azd up
```

To wdraża:
1. Środowisko Container Apps
2. Application Insights
3. Container Registry
4. Kontener API Gateway
5. Kontener Product Service

**Czas**: 8-12 minut

### Wdrażanie pojedynczej usługi

```bash
# Wdróż tylko jedną usługę (po początkowym azd up)
azd deploy api-gateway

# Lub wdróż usługę produktu
azd deploy product-service
```

**Zastosowanie**: Gdy zaktualizowałeś kod w jednej usłudze i chcesz wdrożyć tylko tę usługę.

### Aktualizacja konfiguracji

```bash
# Zmień parametry skalowania
azd env set GATEWAY_MAX_REPLICAS 30

# Wdróż ponownie z nową konfiguracją
azd up
```


## Konfiguracja

### Konfiguracja skalowania

Obie usługi są skonfigurowane do autoskalowania na podstawie HTTP w plikach Bicep:

**API Gateway**:
- Minimalna liczba replik: 2 (zawsze co najmniej 2 dla dostępności)
- Maksymalna liczba replik: 20
- Wyzwalacz skalowania: 50 równoczesnych żądań na replikę

**Product Service**:
- Minimalna liczba replik: 1 (może skalować się do zera, jeśli to konieczne)
- Maksymalna liczba replik: 10
- Wyzwalacz skalowania: 100 równoczesnych żądań na replikę

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

### Sprawdzanie kondycji

Obie usługi zawierają proby liveness i readiness:

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
- **Liveness**: Jeśli sprawdzanie kondycji się nie powiedzie, Container Apps restartuje kontener
- **Readiness**: Jeśli nie jest gotowy, Container Apps przestaje kierować ruch do tej repliki

## Monitorowanie i obserwowalność

### Wyświetlanie logów usług

```bash
# Strumieniuj logi z API Gateway
azd logs api-gateway --follow

# Wyświetl ostatnie logi usługi produktowej
azd logs product-service --tail 100

# Wyświetl wszystkie logi z obu usług
azd logs --follow
```

**Oczekiwany wynik**:  
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```


### Zapytania Application Insights

Uzyskaj dostęp do Application Insights w Azure Portal, a następnie uruchom te zapytania:

**Znajdź wolne żądania**:  
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Śledź wywołania między usługami**:  
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Wskaźnik błędów według usługi**:  
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
3. Zobacz żądania w czasie rzeczywistym, błędy i wydajność
4. Przetestuj, uruchamiając: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Ćwiczenia praktyczne

[Uwaga: Zobacz pełne ćwiczenia powyżej w sekcji "Ćwiczenia praktyczne" dla szczegółowych instrukcji krok po kroku, w tym weryfikacji wdrożenia, modyfikacji danych, testów autoskalowania, obsługi błędów i dodania trzeciej usługi.]

## Analiza kosztów

### Szacowane miesięczne koszty (dla tego przykładu z 2 usługami)

| Zasób | Konfiguracja | Szacowany koszt |
|-------|--------------|-----------------|
| API Gateway | 2-20 replik, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replik, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Podstawowy poziom | $5 |
| Application Insights | 1-2 GB/miesiąc | $5-10 |
| Log Analytics | 1 GB/miesiąc | $3 |
| **Razem** | | **$58-243/miesiąc** |

**Podział kosztów według użycia**:
- **Lekki ruch** (testowanie/nauka): ~$60/miesiąc
- **Umiarkowany ruch** (mała produkcja): ~$120/miesiąc
- **Duży ruch** (intensywne okresy): ~$240/miesiąc

### Wskazówki dotyczące optymalizacji kosztów

1. **Skalowanie do zera dla rozwoju**:  
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Użyj planu konsumpcyjnego dla Cosmos DB** (gdy go dodasz):
   - Płać tylko za to, co używasz
   - Brak minimalnych opłat

3. **Ustaw próbkowanie w Application Insights**:  
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Próbkuj 50% żądań
   ```

4. **Usuń zasoby, gdy nie są potrzebne**:  
   ```bash
   azd down
   ```


### Opcje darmowego poziomu
Dla nauki/testowania, rozważ:
- Wykorzystaj darmowe kredyty Azure (pierwsze 30 dni)
- Ogranicz liczbę replik do minimum
- Usuń po testach (brak opłat ciągłych)

---

## Czyszczenie zasobów

Aby uniknąć opłat ciągłych, usuń wszystkie zasoby:

```bash
azd down --force --purge
```

**Potwierdzenie**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Wpisz `y`, aby potwierdzić.

**Co zostanie usunięte**:
- Środowisko Container Apps
- Obie aplikacje kontenerowe (gateway i product service)
- Rejestr kontenerów
- Application Insights
- Log Analytics Workspace
- Grupa zasobów

**✓ Weryfikacja czyszczenia**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Powinno zwrócić pusty wynik.

---

## Przewodnik rozszerzenia: Od 2 do 5+ usług

Gdy opanujesz architekturę z 2 usługami, oto jak ją rozbudować:

### Faza 1: Dodanie bazy danych (następny krok)

**Dodaj Cosmos DB dla Product Service**:

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

2. Zaktualizuj usługę product service, aby korzystała z Cosmos DB zamiast danych w pamięci

3. Szacowany dodatkowy koszt: ~25 USD/miesiąc (serverless)

### Faza 2: Dodanie trzeciej usługi (Order Management)

**Utwórz Order Service**:

1. Nowy folder: `src/order-service/` (Python/Node.js/C#)
2. Nowy plik Bicep: `infra/app/order-service.bicep`
3. Zaktualizuj API Gateway, aby obsługiwał `/api/orders`
4. Dodaj Azure SQL Database do przechowywania zamówień

**Architektura stanie się**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faza 3: Dodanie komunikacji asynchronicznej (Service Bus)

**Wdrożenie architektury opartej na zdarzeniach**:

1. Dodaj Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service publikuje zdarzenia "ProductCreated"
3. Order Service subskrybuje zdarzenia produktów
4. Dodaj Notification Service do przetwarzania zdarzeń

**Wzorzec**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Faza 4: Dodanie uwierzytelniania użytkowników

**Wdrożenie User Service**:

1. Utwórz `src/user-service/` (Go/Node.js)
2. Dodaj Azure AD B2C lub niestandardowe uwierzytelnianie JWT
3. API Gateway weryfikuje tokeny
4. Usługi sprawdzają uprawnienia użytkowników

### Faza 5: Gotowość produkcyjna

**Dodaj te komponenty**:
- Azure Front Door (globalne równoważenie obciążenia)
- Azure Key Vault (zarządzanie sekretami)
- Azure Monitor Workbooks (niestandardowe pulpity)
- Pipeline CI/CD (GitHub Actions)
- Blue-Green Deployments
- Managed Identity dla wszystkich usług

**Koszt pełnej architektury produkcyjnej**: ~300-1,400 USD/miesiąc

---

## Dowiedz się więcej

### Powiązana dokumentacja
- [Dokumentacja Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Przewodnik po architekturze mikroserwisów](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights dla śledzenia rozproszonego](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Kolejne kroki w tym kursie
- ← Poprzedni: [Prosty Flask API](../../../../../examples/container-app/simple-flask-api) - Przykład dla początkujących z jednym kontenerem
- → Następny: [Przewodnik integracji AI](../../../../../examples/docs/ai-foundry) - Dodaj możliwości AI
- 🏠 [Strona główna kursu](../../README.md)

### Porównanie: Kiedy używać czego

**Pojedyncza aplikacja kontenerowa** (przykład Simple Flask API):
- ✅ Proste aplikacje
- ✅ Architektura monolityczna
- ✅ Szybkie wdrożenie
- ❌ Ograniczona skalowalność
- **Koszt**: ~15-50 USD/miesiąc

**Mikroserwisy** (ten przykład):
- ✅ Złożone aplikacje
- ✅ Niezależna skalowalność dla każdej usługi
- ✅ Autonomia zespołów (różne usługi, różne zespoły)
- ❌ Większa złożoność zarządzania
- **Koszt**: ~60-250 USD/miesiąc

**Kubernetes (AKS)**:
- ✅ Maksymalna kontrola i elastyczność
- ✅ Przenośność między chmurami
- ✅ Zaawansowane sieci
- ❌ Wymaga wiedzy o Kubernetes
- **Koszt**: ~150-500 USD/miesiąc minimum

**Rekomendacja**: Zacznij od Container Apps (ten przykład), przejdź do AKS tylko wtedy, gdy potrzebujesz funkcji specyficznych dla Kubernetes.

---

## Najczęściej zadawane pytania

**P: Dlaczego tylko 2 usługi zamiast 5+?**  
O: Stopniowe nauczanie. Opanuj podstawy (komunikacja między usługami, monitorowanie, skalowanie) na prostym przykładzie, zanim dodasz złożoność. Wzorce, które tu poznasz, mają zastosowanie w architekturach z 100 usługami.

**P: Czy mogę samodzielnie dodać więcej usług?**  
O: Oczywiście! Postępuj zgodnie z przewodnikiem rozszerzenia powyżej. Każda nowa usługa wymaga: utworzenia folderu src, pliku Bicep, aktualizacji azure.yaml, wdrożenia.

**P: Czy to jest gotowe do produkcji?**  
O: To solidna podstawa. Do produkcji dodaj: managed identity, Key Vault, trwałe bazy danych, pipeline CI/CD, alerty monitorowania i strategię tworzenia kopii zapasowych.

**P: Dlaczego nie użyć Dapr lub innej siatki usług?**  
O: Uprość naukę. Gdy zrozumiesz natywną sieć Container Apps, możesz dodać Dapr do zaawansowanych scenariuszy.

**P: Jak debugować lokalnie?**  
O: Uruchom usługi lokalnie za pomocą Dockera:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**P: Czy mogę używać różnych języków programowania?**  
O: Tak! Ten przykład pokazuje Node.js (gateway) + Python (product service). Możesz mieszać dowolne języki, które działają w kontenerach.

**P: Co jeśli nie mam kredytów Azure?**  
O: Skorzystaj z darmowego poziomu Azure (pierwsze 30 dni dla nowych kont) lub wdrażaj na krótkie okresy testowe i natychmiast usuwaj.

---

> **🎓 Podsumowanie ścieżki nauki**: Nauczyłeś się wdrażać architekturę wielousługową z automatycznym skalowaniem, wewnętrzną siecią, scentralizowanym monitorowaniem i wzorcami gotowymi do produkcji. Ta podstawa przygotowuje Cię do złożonych systemów rozproszonych i architektur mikroserwisowych w przedsiębiorstwach.

**📚 Nawigacja po kursie:**
- ← Poprzedni: [Prosty Flask API](../../../../../examples/container-app/simple-flask-api)
- → Następny: [Przykład integracji bazy danych](../../../../../examples/database-app)
- 🏠 [Strona główna kursu](../../README.md)
- 📖 [Najlepsze praktyki dla Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->