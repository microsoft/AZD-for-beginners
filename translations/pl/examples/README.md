# Przykłady - Praktyczne szablony i konfiguracje AZD

**Uczenie się na przykładach - zorganizowane według rozdziałów**  
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)  
- **📖 Mapa rozdziałów**: Przykłady uporządkowane według stopnia trudności  
- **🚀 Przykład lokalny**: [Rozwiązanie Retail Multi-Agent](retail-scenario.md)  
- **🤖 Przykłady AI zewnętrzne**: Linki do repozytoriów Azure Samples  

> **📍 WAŻNE: Przykłady lokalne vs zewnętrzne**  
> To repozytorium zawiera **4 kompletne lokalne przykłady** z pełnymi implementacjami:  
> - **Microsoft Foundry Models Chat** (wdrożenie gpt-4.1 z interfejsem czatu)  
> - **Container Apps** (Proste API Flask + mikrousługi)  
> - **Aplikacja bazodanowa** (Web + SQL Database)  
> - **Retail Multi-Agent** (Rozwiązanie AI dla przedsiębiorstw)  
>  
> Dodatkowe przykłady to **odnośniki zewnętrzne** do repozytoriów Azure-Samples, które możesz sklonować.

## Wprowadzenie

Ten katalog zawiera praktyczne przykłady i odnośniki, które pomogą Ci nauczyć się Azure Developer CLI poprzez praktyczne ćwiczenia. Scenariusz Retail Multi-Agent to kompletna, gotowa do produkcji implementacja zawarta w tym repozytorium. Dodatkowe przykłady odwołują się do oficjalnych Azure Samples demonstrujących różne wzorce AZD.

### Legenda poziomu trudności

- ⭐ **Początkujący** - Podstawowe pojęcia, pojedyncza usługa, 15-30 minut  
- ⭐⭐ **Średnio zaawansowany** - Wiele usług, integracja bazy danych, 30-60 minut  
- ⭐⭐⭐ **Zaawansowany** - Złożona architektura, integracja AI, 1-2 godziny  
- ⭐⭐⭐⭐ **Ekspert** - Gotowy do produkcji, wzorce przedsiębiorstw, ponad 2 godziny  

## 🎯 Co tak naprawdę jest w tym repozytorium

### ✅ Lokalne implementacje (gotowe do użycia)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕  
**Pełne wdrożenie gpt-4.1 z interfejsem czatu zawarte w tym repozytorium**

- **Lokalizacja:** `examples/azure-openai-chat/`  
- **Trudność:** ⭐⭐ (Średnio zaawansowany)  
- **Co zawiera:**  
  - Pełne wdrożenie Microsoft Foundry Models (gpt-4.1)  
  - Interfejs czatu z poziomu linii poleceń Python  
  - Integracja z Key Vault dla bezpiecznych kluczy API  
  - Szablony infrastruktury Bicep  
  - Śledzenie zużycia tokenów i kosztów  
  - Ograniczanie częstotliwości i obsługa błędów  

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
  
**Technologie:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Przykłady Container App](container-app/README.md) 🆕  
**Obszerne przykłady wdrożeń kontenerów zawarte w tym repozytorium**

- **Lokalizacja:** `examples/container-app/`  
- **Trudność:** ⭐-⭐⭐⭐⭐ (Od początkującego do zaawansowanego)  
- **Co zawiera:**  
  - [Przewodnik główny](container-app/README.md) - Kompletny przegląd wdrożeń kontenerów  
  - [Proste API Flask](../../../examples/container-app/simple-flask-api) - Podstawowy przykład REST API  
  - [Architektura mikrousług](../../../examples/container-app/microservices) - Gotowa do produkcji wielousługowa architektura  
  - Wzorce szybkiego startu, produkcji i zaawansowane  
  - Monitorowanie, bezpieczeństwo i optymalizacja kosztów  

**Szybki start:**  
```bash
# Zobacz przewodnik główny
cd examples/container-app

# Wdróż prosty interfejs API Flask
cd simple-flask-api
azd up

# Wdróż przykład mikrousług
cd ../microservices
azd up
```
  
**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Rozwiązanie Retail Multi-Agent](retail-scenario.md) 🆕  
**Kompletna, gotowa do produkcji implementacja zawarta w tym repozytorium**

- **Lokalizacja:** `examples/retail-multiagent-arm-template/`  
- **Trudność:** ⭐⭐⭐⭐ (Zaawansowany)  
- **Co zawiera:**  
  - Kompletny szablon wdrożenia ARM  
  - Architektura multi-agent (Klient + Inwentaryzacja)  
  - Integracja Microsoft Foundry Models  
  - AI Search z RAG  
  - Kompleksowe monitorowanie  
  - Skrypt wdrożenia jednym kliknięciem  

**Szybki start:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Technologie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Zewnętrzne Azure Samples (Klonuj, aby używać)

Poniższe przykłady są utrzymywane w oficjalnych repozytoriach Azure-Samples. Sklonuj je, aby poznać różne wzorce AZD:

### Proste aplikacje (rozdziały 1-2)

| Szablon | Repozytorium | Trudność | Usługi |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalnie: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |  
| **Mikrousługi** | [Lokalnie: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Wielousługowe, Service Bus, Cosmos DB, SQL |  
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
  
### Przykłady aplikacji AI (rozdziały 2, 5, 8)

| Szablon | Repozytorium | Trudność | Skupienie |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokalnie: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | wdrożenie gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Podstawowy czat AI |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework agentów |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | wzorzec RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI dla przedsiębiorstw |

### Baza danych i zaawansowane wzorce (rozdziały 3-8)

| Szablon | Repozytorium | Trudność | Skupienie |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracja bazy danych |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Wielousługowe |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cele nauki

Pracując z tymi przykładami, nauczysz się:  
- Praktykować przepływy pracy Azure Developer CLI na realistycznych scenariuszach aplikacji  
- Rozumieć różne architektury aplikacji i ich implementacje azd  
- Opanować wzorce Infrastructure as Code dla różnych usług Azure  
- Stosować zarządzanie konfiguracją i środowiskami wdrożeniowymi  
- Wdrażać wzorce monitorowania, bezpieczeństwa i skalowania w praktycznym kontekście  
- Zdobyć doświadczenie w rozwiązywaniu problemów i debugowaniu rzeczywistych scenariuszy wdrożeń  

## Efekty nauki

Po ukończeniu tych przykładów będziesz potrafić:  
- Pewnie wdrażać różne typy aplikacji za pomocą Azure Developer CLI  
- Dostosowywać dostarczone szablony do własnych wymagań aplikacji  
- Projektować i implementować niestandardowe wzorce infrastruktury za pomocą Bicep  
- Konfigurować złożone aplikacje wielousługowe z odpowiednimi zależnościami  
- Stosować najlepsze praktyki bezpieczeństwa, monitorowania i wydajności w rzeczywistych scenariuszach  
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
  
## Przykłady Szybkiego Startu

> **💡 Nowy w AZD?** Zacznij od przykładu #1 (Flask API) - zajmie około 20 minut i nauczy podstaw.

### Dla początkujących
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalny) ⭐  
   Wdrożenie prostego REST API z automatycznym skalowaniem do zera  
   **Czas:** 20-25 minut | **Koszt:** 0-5 USD/miesiąc  
   **Nauczysz się:** Podstawy workflow azd, konteneryzacja, sondy zdrowia  
   **Oczekiwany rezultat:** Działający endpoint API zwracający "Hello, World!" z monitorowaniem

2. **[Prosta aplikacja webowa - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Wdrożenie aplikacji webowej Node.js Express z MongoDB  
   **Czas:** 25-35 minut | **Koszt:** 10-30 USD/miesiąc  
   **Nauczysz się:** Integracja bazy danych, zmienne środowiskowe, łańcuchy połączeń  
   **Oczekiwany rezultat:** Aplikacja lista zadań z funkcjami tworzenia/odczytu/edycji/usuwania

3. **[Statyczna strona - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostowanie statycznej strony React w Azure Static Web Apps  
   **Czas:** 20-30 minut | **Koszt:** 0-10 USD/miesiąc  
   **Nauczysz się:** Hosting statyczny, funkcje serverless, wdrożenie CDN  
   **Oczekiwany rezultat:** Interfejs React z backendem API, automatyczne SSL, globalny CDN

### Dla średnio zaawansowanych użytkowników
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokalny) ⭐⭐  
   Wdrożenie gpt-4.1 z interfejsem czatu i zarządzaniem kluczami API  
   **Czas:** 35-45 minut | **Koszt:** 50-200 USD/miesiąc  
   **Nauczysz się:** Wdrożenie Microsoft Foundry Models, integracja Key Vault, śledzenie tokenów  
   **Oczekiwany rezultat:** Działająca aplikacja czatu z gpt-4.1 i monitorowaniem kosztów

5. **[Container App - Mikrousługi](../../../examples/container-app/microservices)** (Lokalny) ⭐⭐⭐⭐  
   Produkcyjna architektura wielousługowa  
   **Czas:** 45-60 minut | **Koszt:** 50-150 USD/miesiąc  
   **Nauczysz się:** Komunikacja usług, kolejkowanie wiadomości, rozproszone śledzenie  
   **Oczekiwany rezultat:** System 2 usług (API Gateway + Product Service) z monitorowaniem

6. **[Aplikacja bazodanowa - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikacja webowa z API C# i bazą danych Azure SQL  
   **Czas:** 30-45 minut | **Koszt:** 20-80 USD/miesiąc  
   **Nauczysz się:** Entity Framework, migracje bazy danych, bezpieczeństwo połączeń  
   **Oczekiwany rezultat:** API C# z backendem Azure SQL, automatyczne wdrożenie schematu

7. **[Funkcje serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions z wyzwalaczami HTTP i Cosmos DB  
   **Czas:** 30-40 minut | **Koszt:** 10-40 USD/miesiąc  
   **Nauczysz się:** Architektura zdarzeniowa, skalowanie serverless, integracja NoSQL  
   **Oczekiwany rezultat:** Aplikacja funkcji reagująca na żądania HTTP z magazynem Cosmos DB

8. **[Mikrousługi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Wielousługowa aplikacja Java z Container Apps i API gateway  
   **Czas:** 60-90 minut | **Koszt:** 80-200 USD/miesiąc  
   **Nauczysz się:** Wdrożenie Spring Boot, service mesh, balansowanie obciążenia  
   **Oczekiwany rezultat:** Wielousługowy system Java z odnajdywaniem i trasowaniem usług

### Szablony Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - przykład lokalny](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletne wdrożenie gpt-4.1 z interfejsem czatu  
   **Czas:** 35-45 minut | **Koszt:** 50-200 USD/miesiąc  
   **Oczekiwany rezultat:** Działająca aplikacja czatu ze śledzeniem tokenów i monitorowaniem kosztów

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna aplikacja czatu z architekturą RAG  
   **Czas:** 60-90 minut | **Koszt:** 100-300 USD/miesiąc  
   **Oczekiwany rezultat:** Interfejs czatu zasilany RAG z wyszukiwaniem dokumentów i cytowaniami

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumentów za pomocą usług Azure AI  
   **Czas:** 40-60 minut | **Koszt:** 20-80 USD/miesiąc  
   **Oczekiwany rezultat:** API wydobywające tekst, tabele i jednostki z przesłanych dokumentów

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps z Azure Machine Learning  
   **Czas:** 2-3 godziny | **Koszt:** 150-500 USD/miesiąc  
   **Oczekiwany rezultat:** Zautomatyzowana pipeline ML z treningiem, wdrożeniem i monitorowaniem

### Scenariusze rzeczywiste

#### **Rozwiązanie Retail Multi-Agent** 🆕  
**[Kompletny przewodnik implementacji](./retail-scenario.md)**

Kompleksowe, gotowe do produkcji rozwiązanie wsparcia klienta multi-agent, demonstrujące wdrożenie aplikacji AI klasy enterprise z użyciem AZD. Scenariusz ten zawiera:
- **Kompletna architektura**: System wieloagentowy z wyspecjalizowanymi agentami obsługi klienta i zarządzania zapasami  
- **Infrastruktura produkcyjna**: Wiele regionów wdrożeń Microsoft Foundry Models, Azure AI Search, Container Apps oraz kompleksowy monitoring  
- **Gotowy do wdrożenia szablon ARM**: Wdrożenie jednym kliknięciem z wieloma trybami konfiguracji (Minimalny/Standardowy/Premium)  
- **Zaawansowane funkcje**: Walidacja bezpieczeństwa w trybie red teaming, ramy oceny agentów, optymalizacja kosztów, przewodniki rozwiązywania problemów  
- **Rzeczywisty kontekst biznesowy**: Przypadek użycia wsparcia klienta detalisty z uploadem plików, integracją wyszukiwania i skalowaniem dynamicznym  

**Technologie**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Złożoność**: ⭐⭐⭐⭐ (Zaawansowane - gotowe do produkcji korporacyjnej)

**Idealne dla**: Programistów AI, architektów rozwiązań i zespołów tworzących produkcyjne systemy wieloagentowe

**Szybki start**: Wdrożenie kompletnego rozwiązania w mniej niż 30 minut za pomocą dołączonego szablonu ARM z `./deploy.sh -g myResourceGroup`

## 📋 Instrukcje użytkowania

### Wymagania wstępne

Przed uruchomieniem jakiegokolwiek przykładu:  
- ✅ Subskrypcja Azure z rolą Właściciel lub Współtwórca  
- ✅ Zainstalowane Azure Developer CLI ([Przewodnik instalacji](../docs/chapter-01-foundation/installation.md))  
- ✅ Uruchomiony Docker Desktop (dla przykładów z kontenerami)  
- ✅ Odpowiednie limity usług Azure (sprawdź wymagania dla konkretnego przykładu)  

> **💰 Ostrzeżenie o kosztach:** Wszystkie przykłady tworzą rzeczywiste zasoby Azure, które generują opłaty. Zobacz odpowiednie pliki README dla szacunków kosztów. Pamiętaj, aby uruchomić `azd down` po zakończeniu, aby uniknąć dalszych opłat.

### Uruchamianie przykładów lokalnie

1. **Sklonuj lub skopiuj przykład**  
   ```bash
   # Przejdź do wybranego przykładu
   cd examples/simple-web-app
   ```
  
2. **Zainicjuj środowisko AZD**  
   ```bash
   # Inicjalizacja z istniejącym szablonem
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
  
   **Oczekiwane wskaźniki powodzenia:**  
   - ✅ `azd up` zakończone bez błędów  
   - ✅ Punkt końcowy usługi zwraca HTTP 200  
   - ✅ W portal Azure widoczny status „Running”  
   - ✅ Application Insights odbiera telemetrię  

> **⚠️ Problemy?** Zobacz [Najczęstsze problemy](../docs/chapter-07-troubleshooting/common-issues.md) dotyczące rozwiązywania problemów z wdrożeniem

### Dostosowywanie przykładów

Każdy przykład zawiera:  
- **README.md** - Szczegółowe instrukcje konfiguracji i personalizacji  
- **azure.yaml** - Konfiguracja AZD z komentarzami  
- **infra/** - Szablony Bicep z wyjaśnieniami parametrów  
- **src/** - Przykładowy kod aplikacji  
- **scripts/** - Skrypty pomocnicze do typowych zadań  

## 🎯 Cele nauki

### Kategorie przykładów

#### **Podstawowe wdrożenia**  
- Aplikacje jedno-usługowe  
- Proste wzorce infrastruktury  
- Podstawowe zarządzanie konfiguracją  
- Ekonomiczne środowiska deweloperskie  

#### **Zaawansowane scenariusze**  
- Architektury wielousługowe  
- Złożone konfiguracje sieciowe  
- Wzorce integracji baz danych  
- Implementacje bezpieczeństwa i zgodności  

#### **Wzorce gotowe do produkcji**  
- Konfiguracje wysokiej dostępności  
- Monitoring i obserwowalność  
- Integracja CI/CD  
- Konfiguracje odzyskiwania po awarii  

## 📖 Opisy przykładów

### Prosta aplikacja webowa - Node.js Express  
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Złożoność**: Początkujący  
**Koncepcje**: Podstawowe wdrożenie, REST API, integracja bazy NoSQL  

### Strona statyczna - React SPA  
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Złożoność**: Początkujący  
**Koncepcje**: Hosting statyczny, backend serverless, nowoczesny rozwój webowy  

### Container App - Python Flask  
**Technologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Złożoność**: Początkujący  
**Koncepcje**: Konteneryzacja, REST API, scale-to-zero, health probes, monitoring  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/simple-flask-api)  

### Container App - architektura mikroserwisów  
**Technologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Złożoność**: Zaawansowany  
**Koncepcje**: Architektura wielousługowa, komunikacja usług, kolejkowanie wiadomości, rozproszone śledzenie  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/microservices)  

### Aplikacja bazodanowa - C# z Azure SQL  
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Entity Framework, połączenia z bazą danych, rozwój web API  

### Funkcja serverless - Python Azure Functions  
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Architektura event-driven, computing serverless, full-stack development  

### Mikroserwisy - Java Spring Boot  
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Komunikacja mikroserwisów, systemy rozproszone, wzorce korporacyjne  

### Przykłady Microsoft Foundry

#### Aplikacja czatu Microsoft Foundry Models  
**Technologie**: Microsoft Foundry Models, Cognitive Search, App Service  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Architektura RAG, wyszukiwanie wektorowe, integracja LLM  

#### Przetwarzanie dokumentów AI  
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Analiza dokumentów, OCR, ekstrakcja danych  

#### Pipeline uczenia maszynowego  
**Technologie**: Azure ML, MLOps, Container Registry  
**Złożoność**: Zaawansowany  
**Koncepcje**: Trenowanie modeli, pipeline wdrożeniowy, monitoring  

## 🛠 Przykłady konfiguracji

Katalog `configurations/` zawiera wielokrotnego użytku komponenty:

### Konfiguracje środowisk  
- Ustawienia środowiska deweloperskiego  
- Konfiguracje środowiska testowego  
- Konfiguracje gotowe do produkcji  
- Wdrożenia wieloregionalne  

### Moduły Bicep  
- Komponenty infrastruktury wielokrotnego użytku  
- Popularne wzorce zasobów  
- Szablony zabezpieczone pod kątem bezpieczeństwa  
- Konfiguracje optymalizujące koszty  

### Skrypty pomocnicze  
- Automatyzacja konfiguracji środowiska  
- Skrypty migracji baz danych  
- Narzędzia walidacji wdrożeń  
- Narzędzia monitorujące koszty  

## 🔧 Przewodnik personalizacji

### Dostosowywanie przykładów do własnych potrzeb

1. **Przejrzyj wymagania wstępne**  
   - Sprawdź wymagania dotyczące usług Azure  
   - Zweryfikuj limity subskrypcji  
   - Poznaj implikacje kosztowe  

2. **Zmień konfigurację**  
   - Zaktualizuj definicje usług w `azure.yaml`  
   - Dostosuj szablony Bicep  
   - Zmień zmienne środowiskowe  

3. **Przetestuj dokładnie**  
   - Wdróż najpierw do środowiska deweloperskiego  
   - Zweryfikuj funkcjonalność  
   - Przetestuj skalowanie i wydajność  

4. **Przegląd bezpieczeństwa**  
   - Sprawdź kontrolę dostępu  
   - Wdróż zarządzanie sekretami  
   - Włącz monitoring i alerty  

## 📊 Macierz porównań

| Przykład | Usługi | Baza danych | Uwierzytelnianie | Monitoring | Złożoność |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (lokalnie) | 2 | ❌ | Key Vault | Pełny | ⭐⭐ |
| **Python Flask API** (lokalnie) | 1 | ❌ | Podstawowe | Pełny | ⭐ |
| **Mikroserwisy** (lokalnie) | 5+ | ✅ | Korporacyjne | Zaawansowany | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Podstawowe | Podstawowe | ⭐ |
| React SPA + Functions | 3 | ✅ | Podstawowe | Pełny | ⭐ |
| Python Flask Container | 2 | ❌ | Podstawowe | Pełny | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pełne | Pełny | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pełne | Pełny | ⭐⭐ |
| Java Mikroserwisy | 5+ | ✅ | Pełne | Pełny | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Pełne | Pełny | ⭐⭐⭐ |
| Przetwarzanie dokumentów AI | 2 | ❌ | Podstawowe | Pełny | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pełne | Pełny | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (lokalnie) | **8+** | **✅** | **Korporacyjne** | **Zaawansowany** | **⭐⭐⭐⭐** |

## 🎓 Ścieżka nauki

### Zalecany porządek nauki

1. **Zacznij od prostej aplikacji webowej**  
   - Poznaj podstawy AZD  
   - Zrozum proces wdrażania  
   - Ćwicz zarządzanie środowiskiem  

2. **Spróbuj strony statycznej**  
   - Poznaj różne opcje hostingu  
   - Naucz się integracji CDN  
   - Zrozum konfigurację DNS  

3. **Przejdź do Container App**  
   - Poznaj podstawy konteneryzacji  
   - Zrozum skalowanie  
   - Ćwicz z Dockerem  

4. **Dodaj integrację bazy danych**  
   - Naucz się uruchamiania bazy danych  
   - Zrozum łańcuchy połączeń  
   - Ćwicz zarządzanie sekretami  

5. **Poznaj serverless**  
   - Zrozum architekturę event-driven  
   - Naucz się o triggerach i bindingach  
   - Pracuj z API  

6. **Buduj mikroserwisy**  
   - Naucz się komunikacji usług  
   - Poznaj systemy rozproszone  
   - Ćwicz złożone wdrożenia  

## 🔍 Znajdowanie odpowiedniego przykładu

### Według stosu technologicznego  
- **Container Apps**: [Python Flask API (lokalnie)](../../../examples/container-app/simple-flask-api), [Mikroserwisy (lokalnie)](../../../examples/container-app/microservices), Java Mikroserwisy  
- **Node.js**: Node.js Express Todo App, [Mikroserwisy API Gateway (lokalnie)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (lokalnie)](../../../examples/container-app/simple-flask-api), [Mikroserwisy Product Service (lokalnie)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroserwisy Order Service (lokalnie)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Mikroserwisy User Service (lokalnie)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroserwisy  
- **React**: React SPA + Functions  
- **Kontenery**: [Python Flask (lokalnie)](../../../examples/container-app/simple-flask-api), [Mikroserwisy (lokalnie)](../../../examples/container-app/microservices), Java Mikroserwisy  
- **Bazy danych**: [Mikroserwisy (lokalnie)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (lokalnie)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Systemy wieloagentowe**: **Retail Multi-Agent Solution**  
- **Integracja OpenAI**: **[Microsoft Foundry Models Chat (lokalnie)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produkcja korporacyjna**: [Mikroserwisy (lokalnie)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według wzorca architektury  
- **Proste REST API**: [Python Flask API (lokalnie)](../../../examples/container-app/simple-flask-api)  
- **Monolit**: Node.js Express Todo, C# Web API + SQL  
- **Statyczne + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroserwisy**: [Produkcja mikroserwisów (lokalnie)](../../../examples/container-app/microservices), Java Spring Boot Mikroserwisy  
- **Konteneryzowane**: [Python Flask (lokalnie)](../../../examples/container-app/simple-flask-api), [Mikroserwisy (lokalnie)](../../../examples/container-app/microservices)  
- **Zasilane AI**: **[Microsoft Foundry Models Chat (lokalnie)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Architektura wieloagentowa**: **Retail Multi-Agent Solution**  
- **Korporacyjny multiusługowy**: [Mikroserwisy (lokalnie)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według poziomu złożoności  
- **Początkujący**: [Python Flask API (lokalnie)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Średnio zaawansowany**: **[Microsoft Foundry Models Chat (lokalnie)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroserwisy, Microsoft Foundry Models Chat App, AI Document Processing  
- **Zaawansowany**: ML Pipeline  
- **Gotowy do produkcji korporacyjnej**: [Mikroserwisy (lokalnie)](../../../examples/container-app/microservices) (Wielo-usługowy z kolejkowaniem wiadomości), **Retail Multi-Agent Solution** (Kompletny system wieloagentowy z wdrożeniem ARM)  

## 📚 Dodatkowe zasoby

### Linki do dokumentacji  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Przykłady społecznościowe
- [Szablony Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)
- [Szablony Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplikacja Todo z C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplikacja Todo z Python i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikacja Todo z Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikacja React Web z API w C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Funkcje Azure z Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepsze Praktyki
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Wnoszenie Przykładów

Masz przydatny przykład do udostępnienia? Zachęcamy do współpracy!

### Wytyczne dotyczące zgłaszania
1. Zachowaj ustaloną strukturę katalogów
2. Dołącz wyczerpujący plik README.md
3. Dodaj komentarze do plików konfiguracyjnych
4. Dokładnie przetestuj przed zgłoszeniem
5. Dołącz szacunkowe koszty i wymagania wstępne

### Struktura Przykładowego Szablonu
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

**Profesjonalna wskazówka**: Zacznij od najprostszego przykładu odpowiadającego twojemu stosowi technologicznemu, a następnie stopniowo przechodź do bardziej złożonych scenariuszy. Każdy przykład bazuje na koncepcjach z poprzednich!

## 🚀 Gotowy, by zacząć?

### Twoja ścieżka nauki

1. **Całkowicie początkujący?** → Zacznij od [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Masz podstawową wiedzę o AZD?** → Spróbuj [Mikroserwisów](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Budujesz aplikacje AI?** → Zacznij od [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) lub zbadaj [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, ponad 2 godziny)
4. **Potrzebujesz konkretnego stosu technologicznego?** → Skorzystaj z sekcji [Znajdowanie odpowiedniego przykładu](#-finding-the-right-example) powyżej

### Kolejne kroki

- ✅ Przejrzyj [Wymagania wstępne](#wymagania-wstępne) powyżej
- ✅ Wybierz przykład dopasowany do twojego poziomu umiejętności (zobacz [Legenda złożoności](#legenda-poziomu-trudności))
- ✅ Dokładnie przeczytaj README przykładu przed wdrożeniem
- ✅ Ustaw przypomnienie, aby uruchomić `azd down` po testach
- ✅ Podziel się swoimi doświadczeniami poprzez GitHub Issues lub Dyskusje

### Potrzebujesz pomocy?

- 📖 [FAQ](../resources/faq.md) – Najczęściej zadawane pytania
- 🐛 [Przewodnik rozwiązywania problemów](../docs/chapter-07-troubleshooting/common-issues.md) – Naprawianie problemów z wdrożeniem
- 💬 [Dyskusje GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) – Zapytaj społeczność
- 📚 [Przewodnik do nauki](../resources/study-guide.md) – Utrwal swoją wiedzę

---

**Nawigacja**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Materiały do nauki**: [Przewodnik do nauki](../resources/study-guide.md) | [Cardaściąg](../resources/cheat-sheet.md) | [Słownik](../resources/glossary.md)
- **🔧 Zasoby**: [FAQ](../resources/faq.md) | [Rozwiązywanie problemów](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ostatnia aktualizacja: listopad 2025 | [Zgłoś problemy](https://github.com/microsoft/AZD-for-beginners/issues) | [Wnieś przykłady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uważany za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->