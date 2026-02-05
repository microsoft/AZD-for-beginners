# Przykłady - Praktyczne szablony i konfiguracje AZD

**Nauka przez przykłady - uporządkowane według rozdziałów**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Mapa rozdziałów**: Przykłady uporządkowane według poziomu trudności
- **🚀 Lokalny przykład**: [Rozwiązanie dla handlu detalicznego z wieloma agentami](retail-scenario.md)
- **🤖 Zewnętrzne przykłady AI**: Linki do repozytoriów Azure Samples

> **📍 WAŻNE: Przykłady lokalne vs zewnętrzne**  
> To repozytorium zawiera **4 kompletne lokalne przykłady** z pełnymi implementacjami:  
> - **Azure OpenAI Chat** (wdrożenie GPT-4 z interfejsem czatu)  
> - **Container Apps** (Prosta API Flask + mikroserwisy)  
> - **Aplikacja bazodanowa** (Web + baza danych SQL)  
> - **Rozwiązanie dla handlu detalicznego z wieloma agentami** (Enterprise AI Solution)  
>  
> Dodatkowe przykłady to **zewnętrzne odniesienia** do repozytoriów Azure-Samples, które można sklonować.

## Wprowadzenie

Ten katalog zawiera praktyczne przykłady i odniesienia, które pomogą Ci nauczyć się korzystania z Azure Developer CLI poprzez praktykę. Scenariusz dla handlu detalicznego z wieloma agentami to kompletna, gotowa do produkcji implementacja zawarta w tym repozytorium. Dodatkowe przykłady odwołują się do oficjalnych Azure Samples, które demonstrują różne wzorce AZD.

### Legenda poziomu trudności

- ⭐ **Początkujący** - Podstawowe koncepcje, pojedyncza usługa, 15-30 minut
- ⭐⭐ **Średniozaawansowany** - Wiele usług, integracja z bazą danych, 30-60 minut
- ⭐⭐⭐ **Zaawansowany** - Złożona architektura, integracja AI, 1-2 godziny
- ⭐⭐⭐⭐ **Ekspert** - Gotowe do produkcji, wzorce korporacyjne, 2+ godziny

## 🎯 Co właściwie znajduje się w tym repozytorium

### ✅ Lokalna implementacja (gotowa do użycia)

#### [Aplikacja Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Kompletne wdrożenie GPT-4 z interfejsem czatu zawarte w tym repozytorium**

- **Lokalizacja:** `examples/azure-openai-chat/`
- **Poziom trudności:** ⭐⭐ (Średniozaawansowany)
- **Co zawiera:**
  - Kompletne wdrożenie Azure OpenAI (GPT-4)
  - Interfejs czatu w Pythonie w wierszu poleceń
  - Integracja z Key Vault dla bezpiecznych kluczy API
  - Szablony infrastruktury Bicep
  - Śledzenie użycia tokenów i kosztów
  - Ograniczanie liczby żądań i obsługa błędów

**Szybki start:**
```bash
# Przejdź do przykładu
cd examples/azure-openai-chat

# Wdróż wszystko
azd up

# Zainstaluj zależności i rozpocznij czatowanie
pip install -r src/requirements.txt
python src/chat.py
```

**Technologie:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Przykłady aplikacji kontenerowych](container-app/README.md) 🆕
**Kompleksowe przykłady wdrożeń kontenerowych zawarte w tym repozytorium**

- **Lokalizacja:** `examples/container-app/`
- **Poziom trudności:** ⭐-⭐⭐⭐⭐ (Od początkującego do eksperta)
- **Co zawiera:**
  - [Przewodnik główny](container-app/README.md) - Kompletny przegląd wdrożeń kontenerowych
  - [Prosta API Flask](../../../examples/container-app/simple-flask-api) - Podstawowy przykład REST API
  - [Architektura mikroserwisów](../../../examples/container-app/microservices) - Gotowe do produkcji wdrożenie wielousługowe
  - Wzorce szybkiego startu, produkcji i zaawansowane
  - Monitorowanie, bezpieczeństwo i optymalizacja kosztów

**Szybki start:**
```bash
# Wyświetl główny przewodnik
cd examples/container-app

# Wdróż prosty interfejs API Flask
cd simple-flask-api
azd up

# Wdróż przykład mikrousług
cd ../microservices
azd up
```

**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Rozwiązanie dla handlu detalicznego z wieloma agentami](retail-scenario.md) 🆕
**Kompletna gotowa do produkcji implementacja zawarta w tym repozytorium**

- **Lokalizacja:** `examples/retail-multiagent-arm-template/`
- **Poziom trudności:** ⭐⭐⭐⭐ (Zaawansowany)
- **Co zawiera:**
  - Kompletny szablon wdrożenia ARM
  - Architektura wieloagentowa (Klient + Magazyn)
  - Integracja Azure OpenAI
  - AI Search z RAG
  - Kompleksowe monitorowanie
  - Skrypt wdrożenia jednym kliknięciem

**Szybki start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologie:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Zewnętrzne przykłady Azure Samples (do sklonowania)

Poniższe przykłady są utrzymywane w oficjalnych repozytoriach Azure-Samples. Sklonuj je, aby eksplorować różne wzorce AZD:

### Proste aplikacje (Rozdziały 1-2)

| Szablon | Repozytorium | Poziom trudności | Usługi |
|:--------|:-------------|:-----------------|:-------|
| **Python Flask API** | [Lokalnie: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroserwisy** | [Lokalnie: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Wielousługowe, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jak używać:**
```bash
# Sklonuj dowolny przykład
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Wdróż
azd up
```

### Przykłady aplikacji AI (Rozdziały 2, 5, 8)

| Szablon | Repozytorium | Poziom trudności | Skupienie |
|:--------|:-------------|:-----------------|:----------|
| **Azure OpenAI Chat** | [Lokalnie: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Wdrożenie GPT-4 |
| **Szybki start AI Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Podstawowy czat AI |
| **Agenci AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework agentów |
| **Demo Search + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Wzorzec RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI dla przedsiębiorstw |

### Bazy danych i zaawansowane wzorce (Rozdziały 3-8)

| Szablon | Repozytorium | Poziom trudności | Skupienie |
|:--------|:-------------|:-----------------|:----------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracja z bazą danych |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serwerless NoSQL |
| **Java Mikroserwisy** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Wielousługowe |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cele nauki

Pracując z tymi przykładami, nauczysz się:
- Praktykować przepływy pracy Azure Developer CLI w realistycznych scenariuszach aplikacji
- Rozumieć różne architektury aplikacji i ich implementacje w AZD
- Opanować wzorce Infrastructure as Code dla różnych usług Azure
- Stosować zarządzanie konfiguracją i strategie wdrożeń specyficzne dla środowiska
- Implementować wzorce monitorowania, bezpieczeństwa i skalowania w praktycznych kontekstach
- Zdobywać doświadczenie w rozwiązywaniu problemów i debugowaniu rzeczywistych scenariuszy wdrożeniowych

## Rezultaty nauki

Po ukończeniu tych przykładów będziesz w stanie:
- Pewnie wdrażać różne typy aplikacji za pomocą Azure Developer CLI
- Dostosowywać dostarczone szablony do własnych wymagań aplikacji
- Projektować i implementować niestandardowe wzorce infrastruktury za pomocą Bicep
- Konfigurować złożone aplikacje wielousługowe z odpowiednimi zależnościami
- Stosować najlepsze praktyki w zakresie bezpieczeństwa, monitorowania i wydajności w rzeczywistych scenariuszach
- Rozwiązywać problemy i optymalizować wdrożenia na podstawie praktycznego doświadczenia

## Struktura katalogu

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Przykłady szybkiego startu

> **💡 Nowy w AZD?** Zacznij od przykładu nr 1 (API Flask) - zajmuje ~20 minut i uczy podstawowych koncepcji.

### Dla początkujących
1. **[Aplikacja kontenerowa - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalnie) ⭐  
   Wdróż prostą REST API z funkcją scale-to-zero  
   **Czas:** 20-25 minut | **Koszt:** $0-5/miesiąc  
   **Czego się nauczysz:** Podstawowy przepływ pracy AZD, konteneryzacja, sondy zdrowotne  
   **Oczekiwany rezultat:** Działający punkt końcowy API zwracający "Hello, World!" z monitorowaniem

2. **[Prosta aplikacja webowa - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Wdróż aplikację webową Node.js Express z MongoDB  
   **Czas:** 25-35 minut | **Koszt:** $10-30/miesiąc  
   **Czego się nauczysz:** Integracja z bazą danych, zmienne środowiskowe, ciągi połączeń  
   **Oczekiwany rezultat:** Aplikacja listy zadań z funkcjonalnością tworzenia/odczytu/aktualizacji/usuwania

3. **[Strona statyczna - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostuj statyczną stronę React za pomocą Azure Static Web Apps  
   **Czas:** 20-30 minut | **Koszt:** $0-10/miesiąc  
   **Czego się nauczysz:** Hosting statyczny, funkcje serwerless, wdrożenie CDN  
   **Oczekiwany rezultat:** Interfejs React z backendem API, automatyczny SSL, globalny CDN

### Dla średniozaawansowanych
4. **[Aplikacja Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Lokalnie) ⭐⭐  
   Wdróż GPT-4 z interfejsem czatu i zarządzaniem kluczami API  
   **Czas:** 35-45 minut | **Koszt:** $50-200/miesiąc  
   **Czego się nauczysz:** Wdrożenie Azure OpenAI, integracja Key Vault, śledzenie tokenów  
   **Oczekiwany rezultat:** Działająca aplikacja czatu z GPT-4 i monitorowaniem kosztów

5. **[Aplikacja kontenerowa - Mikroserwisy](../../../examples/container-app/microservices)** (Lokalnie) ⭐⭐⭐⭐  
   Gotowa do produkcji architektura wielousługowa  
   **Czas:** 45-60 minut | **Koszt:** $50-150/miesiąc  
   **Czego się nauczysz:** Komunikacja między usługami, kolejki wiadomości, śledzenie rozproszone  
   **Oczekiwany rezultat:** System 2-usługowy (API Gateway + Product Service) z monitorowaniem

6. **[Aplikacja bazodanowa - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikacja webowa z API C# i bazą danych Azure SQL  
   **Czas:** 30-45 minut | **Koszt:** $20-80/miesiąc  
   **Czego się nauczysz:** Entity Framework, migracje bazy danych, bezpieczeństwo połączeń  
   **Oczekiwany rezultat:** API C# z backendem Azure SQL, automatyczne wdrożenie schematu

7. **[Funkcja serwerless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Funkcje Azure w Pythonie z wyzwalaczami HTTP i Cosmos DB  
   **Czas:** 30-40 minut | **Koszt:** $10-40/miesiąc  
   **Czego się nauczysz:** Architektura zdarzeniowa, skalowanie serwerless, integracja NoSQL  
   **Oczekiwany rezultat:** Aplikacja funkcji odpowiadająca na żądania HTTP z przechowywaniem w Cosmos DB

8. **[Mikroserwisy - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Wielousługowa aplikacja Java z Container Apps i API Gateway  
   **Czas:** 60-90 minut | **Koszt:** $80-200/miesiąc  
   **Czego się nauczysz:** Wdrożenie Spring Boot, siatka usług, równoważenie obciążenia  
   **Oczekiwany rezultat:** Wielousługowy system Java z odkrywaniem usług i routingiem

### Szablony Azure AI Foundry

1. **[Aplikacja Azure OpenAI Chat - Lokalny przykład](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletne wdrożenie GPT-4 z interfejsem czatu  
   **Czas:** 35-45 minut | **Koszt:** $50-200/miesiąc  
   **Oczekiwany rezultat:** Działająca aplikacja czatu ze śledzeniem tokenów i monitorowaniem kosztów

2. **[Demo Azure Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna aplikacja czatu z architekturą RAG  
   **Czas:** 60-90 minut | **Koszt:** $100-300/miesiąc  
   **Oczekiwany rezultat:** Interfejs czatu zasilany RAG z wyszukiwaniem dokumentów i cytatami

3. **[Przetwarzanie dokumentów AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumentów za pomocą usług Azure AI  
   **Czas:** 40-60 minut | **Koszt:** $20-80/miesiąc  
   **Oczekiwany rezultat:** API wyodrębniające tekst, tabele i jednostki z przesłanych dokumentów

4. **[Pipeline uczenia maszynowego](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Przepływ pracy MLOps z Azure Machine Learning  
   **Czas:** 2-3 godziny | **Koszt:** $150-500/miesiąc  
   **Oczekiwany rezultat:** Zautomatyzowany pipeline ML z treningiem, wdrożeniem i monitorowaniem

### Scenariusze rzeczywiste

#### **Rozwiązanie dla handlu detalicznego z wieloma agentami** 🆕
**[Kompletny przewodnik implementacji](./retail-scenario.md)**

Kompleksowe, gotowe do produkcji rozwiązanie wieloagentowe dla obsługi klienta, które demonstruje wdrożenie aplikacji AI klasy korporacyjnej z AZD. Ten scenariusz zapewnia:

- **Kompletną architekturę**: System wieloagentowy ze specjalistyczną obsługą klienta i zarządzaniem magazynem
- **Infrastruktura produkcyjna**: Wdrożenia Azure OpenAI w wielu regionach, AI Search, Container Apps i kompleksowe monitorowanie  
- **Gotowy do wdrożenia szablon ARM**: Jedno kliknięcie do wdrożenia z wieloma trybami konfiguracji (Minimalny/Standardowy/Premium)  
- **Zaawansowane funkcje**: Walidacja bezpieczeństwa (red teaming), framework oceny agentów, optymalizacja kosztów i przewodniki rozwiązywania problemów  
- **Realny kontekst biznesowy**: Przypadek użycia wsparcia klienta w branży detalicznej z możliwością przesyłania plików, integracją wyszukiwania i dynamicznym skalowaniem  

**Technologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Złożoność**: ⭐⭐⭐⭐ (Zaawansowany - Gotowy do produkcji w przedsiębiorstwie)  

**Idealne dla**: Deweloperów AI, architektów rozwiązań i zespołów budujących produkcyjne systemy wieloagentowe  

**Szybki start**: Wdróż kompletne rozwiązanie w mniej niż 30 minut, korzystając z dołączonego szablonu ARM za pomocą `./deploy.sh -g myResourceGroup`  

## 📋 Instrukcje użytkowania  

### Wymagania wstępne  

Przed uruchomieniem dowolnego przykładu:  
- ✅ Subskrypcja Azure z dostępem właściciela lub współpracownika  
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik instalacji](../docs/getting-started/installation.md))  
- ✅ Uruchomiony Docker Desktop (dla przykładów z kontenerami)  
- ✅ Odpowiednie limity Azure (sprawdź wymagania specyficzne dla przykładów)  

> **💰 Ostrzeżenie o kosztach:** Wszystkie przykłady tworzą rzeczywiste zasoby Azure, które generują koszty. Zobacz indywidualne pliki README, aby uzyskać szacunkowe koszty. Pamiętaj, aby uruchomić `azd down` po zakończeniu, aby uniknąć dalszych kosztów.  

### Uruchamianie przykładów lokalnie  

1. **Sklonuj lub skopiuj przykład**  
   ```bash
   # Przejdź do wybranego przykładu
   cd examples/simple-web-app
   ```
  
2. **Zainicjuj środowisko AZD**  
   ```bash
   # Zainicjalizuj za pomocą istniejącego szablonu
   azd init
   
   # Lub utwórz nowe środowisko
   azd env new my-environment
   ```
  
3. **Skonfiguruj środowisko**  
   ```bash
   # Ustaw wymagane zmienne
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Wdróż**  
   ```bash
   # Wdróż infrastrukturę i aplikację
   azd up
   ```
  
5. **Zweryfikuj wdrożenie**  
   ```bash
   # Pobierz punkty końcowe usługi
   azd env get-values
   
   # Przetestuj punkt końcowy (przykład)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Oczekiwane wskaźniki sukcesu:**  
   - ✅ `azd up` kończy się bez błędów  
   - ✅ Punkt końcowy usługi zwraca HTTP 200  
   - ✅ Portal Azure pokazuje status "Running"  
   - ✅ Application Insights odbiera dane telemetryczne  

> **⚠️ Problemy?** Zobacz [Częste problemy](../docs/troubleshooting/common-issues.md) w celu rozwiązania problemów z wdrożeniem  

### Dostosowywanie przykładów  

Każdy przykład zawiera:  
- **README.md** - Szczegółowe instrukcje konfiguracji i dostosowania  
- **azure.yaml** - Konfiguracja AZD z komentarzami  
- **infra/** - Szablony Bicep z wyjaśnieniami parametrów  
- **src/** - Przykładowy kod aplikacji  
- **scripts/** - Skrypty pomocnicze do typowych zadań  

## 🎯 Cele edukacyjne  

### Kategorie przykładów  

#### **Podstawowe wdrożenia**  
- Aplikacje jednoserwisowe  
- Proste wzorce infrastruktury  
- Podstawowe zarządzanie konfiguracją  
- Ekonomiczne środowiska deweloperskie  

#### **Zaawansowane scenariusze**  
- Architektury wieloserwisowe  
- Złożone konfiguracje sieciowe  
- Wzorce integracji baz danych  
- Implementacje bezpieczeństwa i zgodności  

#### **Wzorce gotowe do produkcji**  
- Konfiguracje wysokiej dostępności  
- Monitorowanie i obserwowalność  
- Integracja CI/CD  
- Przygotowanie do odzyskiwania po awarii  

## 📖 Opisy przykładów  

### Prosta aplikacja webowa - Node.js Express  
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Złożoność**: Początkujący  
**Koncepcje**: Podstawowe wdrożenie, REST API, integracja z bazą danych NoSQL  

### Strona statyczna - React SPA  
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Złożoność**: Początkujący  
**Koncepcje**: Hosting statyczny, serwerless backend, nowoczesne tworzenie stron internetowych  

### Aplikacja kontenerowa - Python Flask  
**Technologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Złożoność**: Początkujący  
**Koncepcje**: Konteneryzacja, REST API, skalowanie do zera, sondy zdrowotne, monitorowanie  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/simple-flask-api)  

### Aplikacja kontenerowa - Architektura mikroserwisów  
**Technologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Złożoność**: Zaawansowany  
**Koncepcje**: Architektura wieloserwisowa, komunikacja między usługami, kolejkowanie wiadomości, śledzenie rozproszone  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/microservices)  

### Aplikacja bazodanowa - C# z Azure SQL  
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Entity Framework, połączenia z bazą danych, rozwój API webowego  

### Funkcja serwerless - Python Azure Functions  
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Architektura zdarzeniowa, obliczenia serwerless, rozwój full-stack  

### Mikroserwisy - Java Spring Boot  
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Komunikacja mikroserwisów, systemy rozproszone, wzorce korporacyjne  

### Przykłady Azure AI Foundry  

#### Aplikacja czatu Azure OpenAI  
**Technologie**: Azure OpenAI, Cognitive Search, App Service  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Architektura RAG, wyszukiwanie wektorowe, integracja LLM  

#### Przetwarzanie dokumentów AI  
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Analiza dokumentów, OCR, ekstrakcja danych  

#### Pipeline uczenia maszynowego  
**Technologie**: Azure ML, MLOps, Container Registry  
**Złożoność**: Zaawansowany  
**Koncepcje**: Trenowanie modeli, pipeline wdrożeniowy, monitorowanie  

## 🛠 Przykłady konfiguracji  

Katalog `configurations/` zawiera komponenty wielokrotnego użytku:  

### Konfiguracje środowisk  
- Ustawienia środowiska deweloperskiego  
- Konfiguracje środowiska testowego  
- Konfiguracje gotowe do produkcji  
- Wdrożenia w wielu regionach  

### Moduły Bicep  
- Komponenty infrastruktury wielokrotnego użytku  
- Wzorce zasobów wspólnych  
- Szablony zabezpieczone przed zagrożeniami  
- Konfiguracje zoptymalizowane pod kątem kosztów  

### Skrypty pomocnicze  
- Automatyzacja konfiguracji środowiska  
- Skrypty migracji bazy danych  
- Narzędzia do weryfikacji wdrożenia  
- Narzędzia monitorowania kosztów  

## 🔧 Przewodnik dostosowywania  

### Dostosowywanie przykładów do własnych potrzeb  

1. **Przejrzyj wymagania wstępne**  
   - Sprawdź wymagania dotyczące usług Azure  
   - Zweryfikuj limity subskrypcji  
   - Zrozum implikacje kosztowe  

2. **Zmodyfikuj konfigurację**  
   - Zaktualizuj definicje usług w `azure.yaml`  
   - Dostosuj szablony Bicep  
   - Dostosuj zmienne środowiskowe  

3. **Dokładnie przetestuj**  
   - Najpierw wdroż środowisko deweloperskie  
   - Zweryfikuj funkcjonalność  
   - Przetestuj skalowanie i wydajność  

4. **Przegląd bezpieczeństwa**  
   - Przejrzyj kontrolę dostępu  
   - Wdroż zarządzanie tajemnicami  
   - Włącz monitorowanie i alerty  

## 📊 Macierz porównawcza  

| Przykład | Usługi | Baza danych | Autoryzacja | Monitorowanie | Złożoność |  
|----------|--------|-------------|-------------|---------------|-----------|  
| **Azure OpenAI Chat** (Lokalny) | 2 | ❌ | Key Vault | Pełne | ⭐⭐ |  
| **Python Flask API** (Lokalny) | 1 | ❌ | Podstawowe | Pełne | ⭐ |  
| **Mikroserwisy** (Lokalny) | 5+ | ✅ | Enterprise | Zaawansowane | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Podstawowe | Podstawowe | ⭐ |  
| React SPA + Functions | 3 | ✅ | Podstawowe | Pełne | ⭐ |  
| Python Flask Container | 2 | ❌ | Podstawowe | Pełne | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Pełne | Pełne | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Pełne | Pełne | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Pełne | Pełne | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Pełne | Pełne | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Podstawowe | Pełne | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Pełne | Pełne | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Lokalny) | **8+** | **✅** | **Enterprise** | **Zaawansowane** | **⭐⭐⭐⭐** |  

## 🎓 Ścieżka nauki  

### Zalecana kolejność  

1. **Zacznij od prostej aplikacji webowej**  
   - Poznaj podstawowe koncepcje AZD  
   - Zrozum przepływ pracy wdrożenia  
   - Ćwicz zarządzanie środowiskiem  

2. **Spróbuj strony statycznej**  
   - Odkryj różne opcje hostingu  
   - Dowiedz się więcej o integracji CDN  
   - Zrozum konfigurację DNS  

3. **Przejdź do aplikacji kontenerowej**  
   - Poznaj podstawy konteneryzacji  
   - Zrozum koncepcje skalowania  
   - Ćwicz z Dockerem  

4. **Dodaj integrację z bazą danych**  
   - Naucz się tworzenia baz danych  
   - Zrozum łańcuchy połączeń  
   - Ćwicz zarządzanie tajemnicami  

5. **Eksploruj serwerless**  
   - Zrozum architekturę zdarzeniową  
   - Dowiedz się o wyzwalaczach i powiązaniach  
   - Ćwicz z API  

6. **Buduj mikroserwisy**  
   - Naucz się komunikacji między usługami  
   - Zrozum systemy rozproszone  
   - Ćwicz złożone wdrożenia  

## 🔍 Znajdowanie odpowiedniego przykładu  

### Według stosu technologicznego  
- **Container Apps**: [Python Flask API (Lokalny)](../../../examples/container-app/simple-flask-api), [Mikroserwisy (Lokalny)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalny)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokalny)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalny)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Lokalny)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices User Service (Lokalny)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Kontenery**: [Python Flask (Lokalny)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalny)](../../../examples/container-app/microservices), Java Microservices  
- **Bazy danych**: [Microservices (Lokalny)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokalny)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Systemy wieloagentowe**: **Retail Multi-Agent Solution**  
- **Integracja OpenAI**: **[Azure OpenAI Chat (Lokalny)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produkcja w przedsiębiorstwie**: [Microservices (Lokalny)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według wzorca architektury  
- **Prosty REST API**: [Python Flask API (Lokalny)](../../../examples/container-app/simple-flask-api)  
- **Monolityczny**: Node.js Express Todo, C# Web API + SQL  
- **Statyczny + Serwerless**: React SPA + Functions, Python Functions + SPA  
- **Mikroserwisy**: [Production Microservices (Lokalny)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Konteneryzowany**: [Python Flask (Lokalny)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalny)](../../../examples/container-app/microservices)  
- **Zasilany AI**: **[Azure OpenAI Chat (Lokalny)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Architektura wieloagentowa**: **Retail Multi-Agent Solution**  
- **Wielousługowy w przedsiębiorstwie**: [Microservices (Lokalny)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według poziomu złożoności  
- **Początkujący**: [Python Flask API (Lokalny)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Średniozaawansowany**: **[Azure OpenAI Chat (Lokalny)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **Zaawansowany**: ML Pipeline  
- **Gotowy do produkcji w przedsiębiorstwie**: [Microservices (Lokalny)](../../../examples/container-app/microservices) (Wielousługowy z kolejkowaniem wiadomości), **Retail Multi-Agent Solution** (Kompletny system wieloagentowy z wdrożeniem szablonu ARM)  

## 📚 Dodatkowe zasoby  

### Linki do dokumentacji  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Przykłady społeczności  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Todo App z C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App z Pythonem i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplikacja Todo z Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikacja webowa React z API w C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Javą](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepsze Praktyki
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Przykłady do Współtworzenia

Masz przydatny przykład, którym chcesz się podzielić? Zapraszamy do współpracy!

### Wytyczne dotyczące zgłoszeń
1. Postępuj zgodnie z ustaloną strukturą katalogów
2. Dołącz szczegółowy plik README.md
3. Dodaj komentarze do plików konfiguracyjnych
4. Dokładnie przetestuj przed zgłoszeniem
5. Dołącz szacunkowe koszty i wymagania wstępne

### Przykładowa Struktura Szablonu
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Wskazówka**: Zacznij od najprostszego przykładu, który pasuje do Twojego stosu technologicznego, a następnie stopniowo przechodź do bardziej złożonych scenariuszy. Każdy przykład opiera się na koncepcjach z poprzednich!

## 🚀 Gotowy, by zacząć?

### Twoja Ścieżka Nauki

1. **Całkowity Początkujący?** → Zacznij od [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minut)
2. **Masz Podstawową Wiedzę o AZD?** → Wypróbuj [Mikroserwisy](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minut)
3. **Budujesz Aplikacje AI?** → Zacznij od [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minut) lub eksploruj [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ godziny)
4. **Potrzebujesz Konkretnego Stosu Technologicznego?** → Skorzystaj z sekcji [Znajdź Odpowiedni Przykład](../../../examples) powyżej

### Kolejne Kroki

- ✅ Przejrzyj [Wymagania Wstępne](../../../examples) powyżej
- ✅ Wybierz przykład odpowiadający Twojemu poziomowi umiejętności (zobacz [Legenda Złożoności](../../../examples))
- ✅ Dokładnie przeczytaj README wybranego przykładu przed wdrożeniem
- ✅ Ustaw przypomnienie, aby uruchomić `azd down` po zakończeniu testowania
- ✅ Podziel się swoimi doświadczeniami przez GitHub Issues lub Discussions

### Potrzebujesz Pomocy?

- 📖 [FAQ](../resources/faq.md) - Odpowiedzi na najczęściej zadawane pytania
- 🐛 [Przewodnik Rozwiązywania Problemów](../docs/troubleshooting/common-issues.md) - Napraw problemy z wdrożeniem
- 💬 [Dyskusje na GitHubie](https://github.com/microsoft/AZD-for-beginners/discussions) - Zapytaj społeczność
- 📚 [Przewodnik do Nauki](../resources/study-guide.md) - Utrwal swoją wiedzę

---

**Nawigacja**
- **📚 Strona Główna Kursu**: [AZD For Beginners](../README.md)
- **📖 Materiały do Nauki**: [Przewodnik do Nauki](../resources/study-guide.md) | [Ściągawka](../resources/cheat-sheet.md) | [Słowniczek](../resources/glossary.md)
- **🔧 Zasoby**: [FAQ](../resources/faq.md) | [Rozwiązywanie Problemów](../docs/troubleshooting/common-issues.md)

---

*Ostatnia aktualizacja: listopad 2025 | [Zgłoś Problemy](https://github.com/microsoft/AZD-for-beginners/issues) | [Współtwórz Przykłady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->