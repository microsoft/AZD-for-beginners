<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-20T01:51:00+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "pl"
}
-->
# Prosta API Flask - Przykład aplikacji kontenerowej

**Ścieżka nauki:** Początkujący ⭐ | **Czas:** 25-35 minut | **Koszt:** $0-15/miesiąc

Kompletna, działająca Python Flask REST API wdrożona na Azure Container Apps za pomocą Azure Developer CLI (azd). Ten przykład pokazuje wdrożenie kontenerów, automatyczne skalowanie i podstawy monitorowania.

## 🎯 Czego się nauczysz

- Wdrożenie konteneryzowanej aplikacji Python na Azure
- Konfiguracja automatycznego skalowania z funkcją scale-to-zero
- Implementacja sond zdrowotnych i kontroli gotowości
- Monitorowanie logów aplikacji i metryk
- Użycie Azure Developer CLI do szybkiego wdrożenia

## 📦 Co jest zawarte

✅ **Aplikacja Flask** - Kompletna REST API z operacjami CRUD (`src/app.py`)  
✅ **Dockerfile** - Konfiguracja kontenera gotowa do produkcji  
✅ **Infrastruktura Bicep** - Środowisko Container Apps i wdrożenie API  
✅ **Konfiguracja AZD** - Wdrożenie za pomocą jednego polecenia  
✅ **Sondy zdrowotne** - Konfiguracja sond liveness i readiness  
✅ **Automatyczne skalowanie** - 0-10 replik w zależności od obciążenia HTTP  

## Architektura

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Wymagania wstępne

### Wymagane
- **Azure Developer CLI (azd)** - [Przewodnik instalacji](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Subskrypcja Azure** - [Bezpłatne konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Zainstaluj Docker](https://www.docker.com/products/docker-desktop/) (do testów lokalnych)

### Weryfikacja wymagań wstępnych

```bash
# Sprawdź wersję azd (wymagana 1.5.0 lub nowsza)
azd version

# Zweryfikuj logowanie do Azure
azd auth login

# Sprawdź Docker (opcjonalne, do testowania lokalnego)
docker --version
```

## ⏱️ Harmonogram wdrożenia

| Faza | Czas trwania | Co się dzieje |
|------|--------------|---------------|
| Konfiguracja środowiska | 30 sekund | Tworzenie środowiska azd |
| Budowa kontenera | 2-3 minuty | Budowa aplikacji Flask w Dockerze |
| Tworzenie infrastruktury | 3-5 minut | Tworzenie Container Apps, rejestru, monitorowania |
| Wdrożenie aplikacji | 2-3 minuty | Wysyłanie obrazu i wdrożenie na Container Apps |
| **Łącznie** | **8-12 minut** | Gotowe wdrożenie |

## Szybki start

```bash
# Przejdź do przykładu
cd examples/container-app/simple-flask-api

# Zainicjalizuj środowisko (wybierz unikalną nazwę)
azd env new myflaskapi

# Wdróż wszystko (infrastrukturę + aplikację)
azd up
# Zostaniesz poproszony o:
# 1. Wybór subskrypcji Azure
# 2. Wybór lokalizacji (np. eastus2)
# 3. Poczekaj 8-12 minut na wdrożenie

# Pobierz swój punkt końcowy API
azd env get-values

# Przetestuj API
curl $(azd env get-value API_ENDPOINT)/health
```

**Oczekiwany wynik:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Weryfikacja wdrożenia

### Krok 1: Sprawdź status wdrożenia

```bash
# Wyświetl wdrożone usługi
azd show

# Oczekiwany wynik pokazuje:
# - Usługa: api
# - Punkt końcowy: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Uruchomiony
```

### Krok 2: Testuj punkty końcowe API

```bash
# Pobierz punkt końcowy API
API_URL=$(azd env get-value API_ENDPOINT)

# Przetestuj zdrowie
curl $API_URL/health

# Przetestuj główny punkt końcowy
curl $API_URL/

# Utwórz element
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Pobierz wszystkie elementy
curl $API_URL/api/items
```

**Kryteria sukcesu:**
- ✅ Punkt końcowy zdrowia zwraca HTTP 200
- ✅ Punkt końcowy root pokazuje informacje o API
- ✅ POST tworzy element i zwraca HTTP 201
- ✅ GET zwraca utworzone elementy

### Krok 3: Przeglądaj logi

```bash
# Strumień logów na żywo
azd logs api --follow

# Powinieneś zobaczyć:
# - Komunikaty startowe Gunicorn
# - Logi żądań HTTP
# - Logi informacyjne aplikacji
```

## Struktura projektu

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Punkty końcowe API

| Punkt końcowy | Metoda | Opis |
|---------------|--------|------|
| `/health` | GET | Sprawdzenie zdrowia |
| `/api/items` | GET | Lista wszystkich elementów |
| `/api/items` | POST | Tworzenie nowego elementu |
| `/api/items/{id}` | GET | Pobranie konkretnego elementu |
| `/api/items/{id}` | PUT | Aktualizacja elementu |
| `/api/items/{id}` | DELETE | Usunięcie elementu |

## Konfiguracja

### Zmienne środowiskowe

```bash
# Ustaw niestandardową konfigurację
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfiguracja skalowania

API automatycznie skaluje się w zależności od ruchu HTTP:
- **Minimalna liczba replik**: 0 (skaluje się do zera, gdy jest nieaktywne)
- **Maksymalna liczba replik**: 10
- **Równoczesne żądania na replikę**: 50

## Rozwój

### Uruchom lokalnie

```bash
# Zainstaluj zależności
cd src
pip install -r requirements.txt

# Uruchom aplikację
python app.py

# Przetestuj lokalnie
curl http://localhost:8000/health
```

### Budowa i testowanie kontenera

```bash
# Zbuduj obraz Dockera
docker build -t flask-api:local ./src

# Uruchom kontener lokalnie
docker run -p 8000:8000 flask-api:local

# Przetestuj kontener
curl http://localhost:8000/health
```

## Wdrożenie

### Pełne wdrożenie

```bash
# Wdrażanie infrastruktury i aplikacji
azd up
```

### Wdrożenie tylko kodu

```bash
# Wdrażaj tylko kod aplikacji (infrastruktura niezmieniona)
azd deploy api
```

### Aktualizacja konfiguracji

```bash
# Zaktualizuj zmienne środowiskowe
azd env set API_KEY "new-api-key"

# Ponownie wdroż z nową konfiguracją
azd deploy api
```

## Monitorowanie

### Przeglądaj logi

```bash
# Strumień logów na żywo
azd logs api --follow

# Wyświetl ostatnie 100 linii
azd logs api --tail 100
```

### Monitoruj metryki

```bash
# Otwórz pulpit nawigacyjny Azure Monitor
azd monitor --overview

# Wyświetl określone metryki
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testowanie

### Sprawdzenie zdrowia

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Oczekiwana odpowiedź:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Tworzenie elementu

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Pobierz wszystkie elementy

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optymalizacja kosztów

To wdrożenie korzysta z funkcji scale-to-zero, więc płacisz tylko wtedy, gdy API przetwarza żądania:

- **Koszt w stanie bezczynności**: ~$0/miesiąc (skaluje się do zera)
- **Koszt aktywny**: ~$0.000024/sekundę na replikę
- **Oczekiwany miesięczny koszt** (lekkie użycie): $5-15

### Dalsze obniżenie kosztów

```bash
# Zmniejsz maksymalną liczbę replik dla dev
azd env set MAX_REPLICAS 3

# Użyj krótszego czasu bezczynności
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minut
```

## Rozwiązywanie problemów

### Kontener nie uruchamia się

```bash
# Sprawdź logi kontenera
azd logs api --tail 100

# Zweryfikuj, czy obrazy Dockera budują się lokalnie
docker build -t test ./src
```

### API niedostępne

```bash
# Zweryfikuj, czy wejście jest zewnętrzne
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Wysokie czasy odpowiedzi

```bash
# Sprawdź użycie CPU/pamięci
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zwiększ zasoby, jeśli to konieczne
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Czyszczenie

```bash
# Usuń wszystkie zasoby
azd down --force --purge
```

## Kolejne kroki

### Rozszerz ten przykład

1. **Dodaj bazę danych** - Zintegruj Azure Cosmos DB lub SQL Database  
   ```bash
   # Dodaj moduł Cosmos DB do infra/main.bicep
   # Zaktualizuj app.py o połączenie z bazą danych
   ```

2. **Dodaj uwierzytelnianie** - Implementuj Azure AD lub klucze API  
   ```python
   # Dodaj pośrednika uwierzytelniania do app.py
   from functools import wraps
   ```

3. **Skonfiguruj CI/CD** - Workflow GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Dodaj Managed Identity** - Zabezpiecz dostęp do usług Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Powiązane przykłady

- **[Aplikacja bazodanowa](../../../../../examples/database-app)** - Kompletny przykład z SQL Database  
- **[Mikrousługi](../../../../../examples/container-app/microservices)** - Architektura wielousługowa  
- **[Przewodnik po Container Apps](../README.md)** - Wszystkie wzorce kontenerowe  

### Zasoby edukacyjne

- 📚 [Kurs AZD dla początkujących](../../../README.md) - Strona główna kursu  
- 📚 [Wzorce Container Apps](../README.md) - Więcej wzorców wdrożeniowych  
- 📚 [Galeria szablonów AZD](https://azure.github.io/awesome-azd/) - Szablony społeczności  

## Dodatkowe zasoby

### Dokumentacja
- **[Dokumentacja Flask](https://flask.palletsprojects.com/)** - Przewodnik po frameworku Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficjalna dokumentacja Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencja poleceń azd  

### Samouczki
- **[Szybki start Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Wdrożenie pierwszej aplikacji  
- **[Python na Azure](https://learn.microsoft.com/azure/developer/python/)** - Przewodnik po rozwoju w Pythonie  
- **[Język Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura jako kod  

### Narzędzia
- **[Portal Azure](https://portal.azure.com)** - Zarządzanie zasobami wizualnie  
- **[Rozszerzenie Azure dla VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integracja z IDE  

---

**🎉 Gratulacje!** Wdrożyłeś gotową do produkcji Flask API na Azure Container Apps z automatycznym skalowaniem i monitorowaniem.

**Pytania?** [Otwórz zgłoszenie](https://github.com/microsoft/AZD-for-beginners/issues) lub sprawdź [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->