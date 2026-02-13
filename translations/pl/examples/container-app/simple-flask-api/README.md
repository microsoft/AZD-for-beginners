# Prosty API Flask - Przykład Aplikacji Kontenerowej

**Ścieżka nauki:** Początkujący ⭐ | **Czas:** 25-35 minut | **Koszt:** 0-15 USD/miesiąc

Kompletny, działający Python Flask REST API wdrożony do Azure Container Apps przy użyciu Azure Developer CLI (azd). Ten przykład pokazuje podstawy wdrażania kontenerów, automatycznego skalowania i monitorowania.

## 🎯 Czego się nauczysz

- Wdrażać aplikację Python konteneryzowaną do Azure
- Konfigurować automatyczne skalowanie ze skalowaniem do zera
- Implementować sondy zdrowia i gotowości
- Monitorować logi i metryki aplikacji
- Korzystać z Azure Developer CLI do szybkiego wdrażania

## 📦 Co jest w zestawie

✅ **Aplikacja Flask** - Kompletny REST API z operacjami CRUD (`src/app.py`)  
✅ **Dockerfile** - Konfiguracja kontenera gotowa do produkcji  
✅ **Infrastruktura Bicep** - Środowisko Container Apps i wdrożenie API  
✅ **Konfiguracja AZD** - Konfiguracja wdrożenia jednym poleceniem  
✅ **Sondy zdrowotne** - Skonfigurowane kontrole żywotności i gotowości  
✅ **Automatyczne skalowanie** - 0-10 replik w oparciu o obciążenie HTTP  

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
- **Subskrypcja Azure** - [Konto darmowe](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Zainstaluj Dockera](https://www.docker.com/products/docker-desktop/) (do testów lokalnych)

### Sprawdzenie wymagań wstępnych

```bash
# Sprawdź wersję azd (wymagana 1.5.0 lub nowsza)
azd version

# Zweryfikuj logowanie do Azure
azd auth login

# Sprawdź Dockera (opcjonalnie, dla testów lokalnych)
docker --version
```

## ⏱️ Harmonogram wdrażania

| Faza | Czas trwania | Co się dzieje |
|-------|----------|--------------||
| Konfiguracja środowiska | 30 sekund | Tworzenie środowiska azd |
| Budowa kontenera | 2-3 minuty | Docker buduje aplikację Flask |
| Provisioning infrastruktury | 3-5 minut | Tworzenie Container Apps, rejestru, monitoringu |
| Wdrażanie aplikacji | 2-3 minuty | Wpychanie obrazu i wdrażanie do Container Apps |
| **Razem** | **8-12 minut** | Gotowe pełne wdrożenie |

## Szybki start

```bash
# Przejdź do przykładu
cd examples/container-app/simple-flask-api

# Zainicjuj środowisko (wybierz unikalną nazwę)
azd env new myflaskapi

# Wdróż wszystko (infrastrukturę + aplikację)
azd up
# Zostaniesz poproszony o:
# 1. Wybierz subskrypcję Azure
# 2. Wybierz lokalizację (np. eastus2)
# 3. Poczekaj 8-12 minut na wdrożenie

# Pobierz punkt końcowy API
azd env get-values

# Przetestuj API
curl $(azd env get-value API_ENDPOINT)/health
```

**Oczekiwany rezultat:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Sprawdzenie wdrożenia

### Krok 1: Sprawdź status wdrożenia

```bash
# Wyświetl wdrożone usługi
azd show

# Oczekiwany wynik pokazuje:
# - Usługa: api
# - Punkt końcowy: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Działa
```

### Krok 2: Testuj punkty końcowe API

```bash
# Pobierz punkt końcowy API
API_URL=$(azd env get-value API_ENDPOINT)

# Sprawdź stan zdrowia
curl $API_URL/health

# Testuj główny punkt końcowy
curl $API_URL/

# Utwórz element
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Pobierz wszystkie elementy
curl $API_URL/api/items
```

**Kryteria sukcesu:**
- ✅ Punkt zdrowia zwraca HTTP 200
- ✅ Punkt główny pokazuje informacje o API
- ✅ POST tworzy element i zwraca HTTP 201
- ✅ GET zwraca utworzone elementy

### Krok 3: Przejrzyj logi

```bash
# Przesyłaj na żywo logi za pomocą azd monitor
azd monitor --logs

# Lub użyj Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

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
|----------|--------|-------------|
| `/health` | GET | Sprawdzenie stanu zdrowia |
| `/api/items` | GET | Lista wszystkich elementów |
| `/api/items` | POST | Utwórz nowy element |
| `/api/items/{id}` | GET | Pobierz konkretny element |
| `/api/items/{id}` | PUT | Aktualizuj element |
| `/api/items/{id}` | DELETE | Usuń element |

## Konfiguracja

### Zmienne środowiskowe

```bash
# Ustaw niestandardową konfigurację
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfiguracja skalowania

API automatycznie się skaluje w oparciu o ruch HTTP:  
- **Minimalne repliki**: 0 (skalowanie do zera, gdy bezczynne)  
- **Maksymalne repliki**: 10  
- **Równoczesne żądania na replikę**: 50  

## Development

### Uruchom lokalnie

```bash
# Zainstaluj zależności
cd src
pip install -r requirements.txt

# Uruchom aplikację
python app.py

# Testuj lokalnie
curl http://localhost:8000/health
```

### Buduj i testuj kontener

```bash
# Zbuduj obraz Dockera
docker build -t flask-api:local ./src

# Uruchom kontener lokalnie
docker run -p 8000:8000 flask-api:local

# Przetestuj kontener
curl http://localhost:8000/health
```

## Wdrażanie

### Pełne wdrożenie

```bash
# Wdróż infrastrukturę i aplikację
azd up
```

### Wdrożenie samego kodu

```bash
# Wdróż tylko kod aplikacji (infrastruktura bez zmian)
azd deploy api
```

### Aktualizacja konfiguracji

```bash
# Aktualizuj zmienne środowiskowe
azd env set API_KEY "new-api-key"

# Ponownie wdroż z nową konfiguracją
azd deploy api
```

## Monitorowanie

### Przeglądaj logi

```bash
# Przesyłaj na żywo dzienniki za pomocą azd monitor
azd monitor --logs

# Lub użyj Azure CLI dla Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Wyświetl ostatnie 100 linii
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitoruj metryki

```bash
# Otwórz pulpit nawigacyjny Azure Monitor
azd monitor --overview

# Zobacz konkretne metryki
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testowanie

### Test zdrowia

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

To wdrożenie używa skalowania do zera, więc płacisz tylko wtedy, gdy API przetwarza żądania:

- **Koszt w stanie bezczynnym**: ~0 USD/miesiąc (skalowanie do zera)  
- **Koszt aktywny**: ~0,000024 USD/sekunda na replikę  
- **Oczekiwany miesięczny koszt** (lekka eksploatacja): 5-15 USD  

### Dalsza redukcja kosztów

```bash
# Zmniejsz maksymalną liczbę replik dla dev
azd env set MAX_REPLICAS 3

# Użyj krótszego czasu bezczynności
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minut
```

## Rozwiązywanie problemów

### Kontener nie chce się uruchomić

```bash
# Sprawdź logi kontenera za pomocą Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Zweryfikuj lokalne budowanie obrazów Dockera
docker build -t test ./src
```

### API jest niedostępne

```bash
# Sprawdź, czy ingress jest zewnętrzny
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Wysokie czasy odpowiedzi

```bash
# Sprawdź użycie procesora/pamięci
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zwiększ zasoby w razie potrzeby
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Sprzątanie

```bash
# Usuń wszystkie zasoby
azd down --force --purge
```

## Kolejne kroki

### Rozszerz ten przykład

1. **Dodaj bazę danych** - Integracja z Azure Cosmos DB lub SQL Database  
   ```bash
   # Dodaj moduł Cosmos DB do infra/main.bicep
   # Zaktualizuj app.py o połączenie z bazą danych
   ```

2. **Dodaj uwierzytelnianie** - Implementacja Azure AD lub kluczy API  
   ```python
   # Dodaj pośrednika uwierzytelniania do pliku app.py
   from functools import wraps
   ```

3. **Skonfiguruj CI/CD** - Workflow GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Dodaj zarządzaną tożsamość** - Bezpieczny dostęp do usług Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Powiązane przykłady

- **[Aplikacja bazodanowa](../../../../../examples/database-app)** - Pełny przykład z SQL Database  
- **[Mikrousługi](../../../../../examples/container-app/microservices)** - Architektura wielousługowa  
- **[Podręcznik Container Apps](../README.md)** - Wszystkie wzorce kontenerowe  

### Materiały do nauki

- 📚 [Kurs AZD dla początkujących](../../../README.md) - Główne centrum kursu  
- 📚 [Wzorce Container Apps](../README.md) - Więcej wzorców wdrożeń  
- 📚 [Galeria szablonów AZD](https://azure.github.io/awesome-azd/) - Szablony społeczności  

## Dodatkowe zasoby

### Dokumentacja
- **[Dokumentacja Flask](https://flask.palletsprojects.com/)** - Przewodnik po frameworku Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficjalna dokumentacja Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencja poleceń azd  

### Samouczki
- **[Szybki start Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Wdróż pierwszą aplikację  
- **[Python na Azure](https://learn.microsoft.com/azure/developer/python/)** - Przewodnik po Pythonie dla Azure  
- **[Język Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura jako kod  

### Narzędzia
- **[Portal Azure](https://portal.azure.com)** - Zarządzaj zasobami wizualnie  
- **[Rozszerzenie Azure do VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integracja z IDE  

---

**🎉 Gratulacje!** Wdrożyłeś produkcyjne API Flask do Azure Container Apps z automatycznym skalowaniem i monitoringiem.

**Masz pytania?** [Zgłoś problem](https://github.com/microsoft/AZD-for-beginners/issues) lub sprawdź [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pomimo naszych starań o dokładność, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być traktowany jako źródło ostateczne. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->