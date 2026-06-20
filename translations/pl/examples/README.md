# Przykłady - Praktyczne Szablony i Konfiguracje AZD

**Nauka przez Przykład - Zorganizowane wg Rozdziałów**  
- **📚 Strona Kursu**: [AZD dla Początkujących](../README.md)  
- **📖 Mapa Rozdziałów**: Przykłady uporządkowane wg stopnia trudności  
- **🚀 Lokalny Przykład**: [Rozwiązanie Retail Multi-Agent](retail-scenario.md)  
- **🤖 Przykłady AI Zewnętrzne**: Linki do repozytoriów Azure Samples  

> **📍 WAŻNE: Przykłady Lokalnie vs Zewnętrzne**  
> To repozytorium zawiera **4 kompletne lokalne przykłady** z pełnymi implementacjami:  
> - **Microsoft Foundry Models Chat** (wdrożenie gpt-4.1 z interfejsem czatu)  
> - **Container Apps** (Proste API Flask + Mikroserwisy)  
> - **Aplikacja Bazodanowa** (Web + SQL Database)  
> - **Retail Multi-Agent** (Rozwiązanie AI dla przedsiębiorstwa)  
>  
> Dodatkowe przykłady to **odnośniki zewnętrzne** do repozytoriów Azure-Samples, które możesz sklonować.

## Wprowadzenie

Ten katalog udostępnia praktyczne przykłady i odniesienia pomagające w nauce Azure Developer CLI poprzez praktyczne ćwiczenia. Scenariusz Retail Multi-Agent to kompletna, produkcyjna implementacja dołączona do tego repozytorium. Dodatkowe przykłady to odniesienia do oficjalnych Azure Samples prezentujących różne wzorce AZD.

### Legenda Trudności

- ⭐ **Początkujący** - Podstawowe koncepcje, jedna usługa, 15-30 minut  
- ⭐⭐ **Średniozaawansowany** - Wiele usług, integracja z bazą danych, 30-60 minut  
- ⭐⭐⭐ **Zaawansowany** - Złożona architektura, integracja AI, 1-2 godziny  
- ⭐⭐⭐⭐ **Ekspert** - Produkcyjny, wzorce korporacyjne, powyżej 2 godzin  

## 🎯 Co Właściwie Znajduje się w Tym Repozytorium

### ✅ Lokalna Implementacja (Gotowa do użycia)

#### [Aplikacja Czat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**Kompletne wdrożenie gpt-4.1 z interfejsem czatu w tym repozytorium**

- **Lokalizacja:** `examples/azure-openai-chat/`  
- **Trudność:** ⭐⭐ (Średniozaawansowany)  
- **Co Zawiera:**  
  - Kompletny deployment Microsoft Foundry Models (gpt-4.1)  
  - Interfejs czatu w Pythonie z linii poleceń  
  - Integracja z Key Vault dla bezpiecznych kluczy API  
  - Szablony infrastruktury Bicep  
  - Śledzenie zużycia tokenów i kosztów  
  - Ograniczenia szybkości i obsługa błędów  

**Szybki Start:**  
```bash
# Przejdź do przykładu
cd examples/azure-openai-chat

# Wdróż wszystko
azd up

# Zainstaluj zależności i zacznij rozmowę
pip install -r src/requirements.txt
python src/chat.py
```
  
**Technologie:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Przykłady Container App](container-app/README.md) 🆕  
**Obszerne przykłady wdrożeń kontenerów w tym repozytorium**

- **Lokalizacja:** `examples/container-app/`  
- **Trudność:** ⭐-⭐⭐⭐⭐ (Od Początkującego do Zaawansowanego)  
- **Co Zawiera:**  
  - [Przewodnik Główny](container-app/README.md) - Kompletny przegląd wdrożeń kontenerów  
  - [Proste API Flask](../../../examples/container-app/simple-flask-api) - Podstawowy przykład REST API  
  - [Architektura Mikroserwisów](../../../examples/container-app/microservices) - Produkcyjna wielousługowa architektura  
  - Wzorce Szybkiego Startu, Produkcji i Zaawansowane  
  - Monitorowanie, bezpieczeństwo i optymalizacja kosztów  

**Szybki Start:**  
```bash
# Zobacz przewodnik mistrza
cd examples/container-app

# Wdróż prostą API Flask
cd simple-flask-api
azd up

# Wdróż przykład mikrousług
cd ../microservices
azd up
```
  
**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Rozwiązanie Retail Multi-Agent](retail-scenario.md) 🆕  
**Kompletna, produkcyjna implementacja dołączona do tego repozytorium**

- **Lokalizacja:** `examples/retail-multiagent-arm-template/`  
- **Trudność:** ⭐⭐⭐⭐ (Zaawansowany)  
- **Co Zawiera:**  
  - Kompletny szablon wdrożenia ARM  
  - Architektura multi-agent (klient + magazyn)  
  - Integracja Microsoft Foundry Models  
  - Wyszukiwanie AI z RAG  
  - Kompleksowe monitorowanie  
  - Skrypt wdrożenia jednym kliknięciem  

**Szybki Start:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Technologie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Zewnętrzne Azure Samples (Klonuj aby użyć)

Poniższe przykłady są utrzymywane w oficjalnych repozytoriach Azure-Samples. Sklonuj je, aby poznać różne wzorce AZD:

### Proste Aplikacje (Rozdziały 1-2)

| Szablon | Repozytorium | Trudność | Usługi |  
|:---------|:-----------|:-----------|:---------|  
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |  
| **Mikroserwisy** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Wielousługowe, Service Bus, Cosmos DB, SQL |  
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
  
### Przykłady Aplikacji AI (Rozdziały 2, 5, 8)

| Szablon | Repozytorium | Trudność | Skupienie |  
|:---------|:-----------|:-----------|:------|  
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | wdrożenie gpt-4.1 |  
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Podstawowy czat AI |  
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework agentów |  
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | wzorzec RAG |  
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI dla przedsiębiorstw |  

### Bazy Danych i Zaawansowane Wzorce (Rozdziały 3-8)

| Szablon | Repozytorium | Trudność | Skupienie |  
|:---------|:-----------|:-----------|:------|  
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracja z bazą danych |  
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Bezserwerowy NoSQL |  
| **Java Mikroserwisy** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Wielousługowe |  
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |  

## Cele Nauki

Pracując z tymi przykładami, będziesz:  
- Ćwiczyć przepływy pracy Azure Developer CLI na realistycznych scenariuszach aplikacji  
- Rozumieć różne architektury aplikacji i ich implementacje azd  
- Opanować wzorce Infrastructure as Code dla różnych usług Azure  
- Stosować zarządzanie konfiguracją i strategie wdrożeń specyficzne dla środowiska  
- Implementować wzorce monitorowania, bezpieczeństwa i skalowania w praktycznych kontekstach  
- Budować doświadczenie w rozwiązywaniu problemów i debugowaniu rzeczywistych wdrożeń  

## Efekty Nauki

Po ukończeniu tych przykładów będziesz w stanie:  
- Pewnie wdrażać różne typy aplikacji używając Azure Developer CLI  
- Dostosowywać dostarczone szablony do własnych wymagań aplikacji  
- Projektować i implementować niestandardowe wzorce infrastruktury za pomocą Bicep  
- Konfigurować złożone aplikacje wielousługowe z właściwymi zależnościami  
- Stosować najlepsze praktyki bezpieczeństwa, monitorowania i wydajności w rzeczywistych scenariuszach  
- Rozwiązywać problemy i optymalizować wdrożenia bazując na praktycznym doświadczeniu  

## Struktura Katalogu

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

> **💡 Nowy w AZD?** Zacznij od przykładu #1 (Flask API) - zajmie około 20 minut i wprowadzi do podstaw.

### Dla Początkujących  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalny) ⭐  
   Wdróż proste REST API z możliwością skalowania do zera  
   **Czas:** 20-25 minut | **Koszt:** 0-5$/miesiąc  
   **Nauczysz się:** Podstawowy workflow azd, konteneryzacja, probe zdrowia  
   **Oczekiwany rezultat:** Działający endpoint API zwracający "Hello, World!" z monitoringiem  

2. **[Prosta aplikacja webowa - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Wdróż aplikację webową Node.js Express z MongoDB  
   **Czas:** 25-35 minut | **Koszt:** 10-30$/miesiąc  
   **Nauczysz się:** Integracja bazy danych, zmienne środowiskowe, connection strings  
   **Oczekiwany rezultat:** Aplikacja todo list z funkcjonalnościami CRUD  

3. **[Statyczna strona - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostuj statyczną stronę React korzystając z Azure Static Web Apps  
   **Czas:** 20-30 minut | **Koszt:** 0-10$/miesiąc  
   **Nauczysz się:** Hosting statyczny, funkcje serverless, wdrożenie CDN  
   **Oczekiwany rezultat:** UI React z backendem API, automatyczne SSL, globalny CDN  

### Dla Użytkowników Średniozaawansowanych  
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokalny) ⭐⭐  
   Wdróż gpt-4.1 z interfejsem czatu i bezpiecznym zarządzaniem kluczami API  
   **Czas:** 35-45 minut | **Koszt:** 50-200$/miesiąc  
   **Nauczysz się:** Deployment Microsoft Foundry Models, integracja Key Vault, śledzenie tokenów  
   **Oczekiwany rezultat:** Działająca aplikacja czatu z gpt-4.1 i monitorowaniem kosztów  

5. **[Container App - Mikroserwisy](../../../examples/container-app/microservices)** (Lokalny) ⭐⭐⭐⭐  
   Produkcyjna architektura wielousługowa  
   **Czas:** 45-60 minut | **Koszt:** 50-150$/miesiąc  
   **Nauczysz się:** Komunikacja usług, kolejkowanie wiadomości, śledzenie rozproszone  
   **Oczekiwany rezultat:** System 2 usług (API Gateway + Product Service) z monitoringiem  

6. **[Aplikacja bazodanowa - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikacja webowa z API w C# i bazą Azure SQL  
   **Czas:** 30-45 minut | **Koszt:** 20-80$/miesiąc  
   **Nauczysz się:** Entity Framework, migracje bazy, bezpieczeństwo połączeń  
   **Oczekiwany rezultat:** API w C# z backendem Azure SQL, automatyczne wdrożenie schematu  

7. **[Function Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions z triggerami HTTP i Cosmos DB  
   **Czas:** 30-40 minut | **Koszt:** 10-40$/miesiąc  
   **Nauczysz się:** Architektura event-driven, skalowanie serverless, integracja NoSQL  
   **Oczekiwany rezultat:** Aplikacja funkcji odpowiadająca na żądania HTTP z przechowywaniem w Cosmos DB  

8. **[Mikroserwisy - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Wielousługowa aplikacja Java z Container Apps i API gateway  
   **Czas:** 60-90 minut | **Koszt:** 80-200$/miesiąc  
   **Nauczysz się:** Deployment Spring Boot, siatka usług, load balancing  
   **Oczekiwany rezultat:** Wielousługowy system Java z service discovery i routingiem  

### Szablony Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Przykład Lokalny](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletny deployment gpt-4.1 z interfejsem czatu  
   **Czas:** 35-45 minut | **Koszt:** 50-200$/miesiąc  
   **Oczekiwany rezultat:** Działająca aplikacja czatu z śledzeniem tokenów i monitorowaniem kosztów  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna aplikacja czatu z architekturą RAG  
   **Czas:** 60-90 minut | **Koszt:** 100-300$/miesiąc  
   **Oczekiwany rezultat:** Interfejs czatu napędzany RAG z wyszukiwaniem dokumentów i cytowaniami  

3. **[Przetwarzanie Dokumentów AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumentów z użyciem usług Azure AI  
   **Czas:** 40-60 minut | **Koszt:** 20-80$/miesiąc  
   **Oczekiwany rezultat:** API wyciągające tekst, tabele i encje z przesłanych dokumentów  

4. **[Pipeline Uczenia Maszynowego](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps z Azure Machine Learning  
   **Czas:** 2-3 godziny | **Koszt:** 150-500$/miesiąc  
   **Oczekiwany rezultat:** Zautomatyzowany pipeline ML z treningiem, wdrożeniem i monitoringiem  

### Scenariusze Rzeczywiste

#### **Rozwiązanie Retail Multi-Agent** 🆕  
**[Kompletny Przewodnik Implementacji](./retail-scenario.md)**

Kompleksowe, produkcyjne rozwiązanie multi-agent do obsługi klienta, które demonstruje wdrożenie aplikacji AI klasy korporacyjnej z AZD. Scenariusz zawiera:  

- **Pełna Architektura**: System multi-agent z wyspecjalizowanymi agentami obsługi klienta i zarządzania zapasami
- **Infrastruktura Produkcyjna**: wdrożenia Microsoft Foundry Models w wielu regionach, AI Search, Container Apps oraz kompleksowy monitoring  
- **Gotowy do wdrożenia szablon ARM**: wdrożenie jednym kliknięciem z wieloma trybami konfiguracji (Minimalny/Standardowy/Premium)  
- **Zaawansowane funkcje**: walidacja bezpieczeństwa red teaming, framework oceny agentów, optymalizacja kosztów oraz przewodniki rozwiązywania problemów  
- **Rzeczywisty kontekst biznesowy**: przypadek użycia obsługi klienta detalisty z przesyłaniem plików, integracją wyszukiwania i skalowaniem dynamicznym  

**Technologie**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Złożoność**: ⭐⭐⭐⭐ (Zaawansowany - gotowy do produkcji w przedsiębiorstwie)  

**Idealne dla**: deweloperów AI, architektów rozwiązań oraz zespołów budujących produkcyjne systemy wieloagentowe  

**Szybki start**: wdroż kompletną rozwiązanie w mniej niż 30 minut używając dołączonego szablonu ARM z poleceniem `./deploy.sh -g myResourceGroup`  

## 📋 Instrukcje użytkowania  

### Wymagania wstępne  

Przed uruchomieniem jakiegokolwiek przykładu:  
- ✅ subskrypcja Azure z uprawnieniami Właściciel lub Współtwórca  
- ✅ zainstalowany Azure Developer CLI ([Przewodnik instalacji](../docs/chapter-01-foundation/installation.md))  
- ✅ działający Docker Desktop (dla przykładów kontenerowych)  
- ✅ odpowiednie limity zasobów Azure (sprawdź wymagania specyficzne dla przykładu)  

> **💰 Ostrzeżenie dotyczące kosztów:** Wszystkie przykłady tworzą rzeczywiste zasoby Azure, które generują opłaty. Zobacz pliki README poszczególnych przykładów, aby otrzymać szacunkowe koszty. Pamiętaj, aby wykonać `azd down` po zakończeniu, aby uniknąć dalszych opłat.  

### Uruchamianie przykładów lokalnie  

1. **Sklonuj lub skopiuj przykład**  
   ```bash
   # Przejdź do wybranego przykładu
   cd examples/simple-web-app
   ```
  
2. **Zainicjuj środowisko AZD**  
   ```bash
   # Inicjalizuj za pomocą istniejącego szablonu
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
   - ✅ Application Insights odbiera telemetrię  

> **⚠️ Problemy?** Zobacz [Typowe problemy](../docs/chapter-07-troubleshooting/common-issues.md) dotyczące rozwiązywania problemów z wdrożeniem  

### Dostosowywanie przykładów  

Każdy przykład zawiera:  
- **README.md** - szczegółowe instrukcje konfiguracji i dostosowania  
- **azure.yaml** - konfiguracja AZD z komentarzami  
- **infra/** - szablony Bicep z objaśnieniami parametrów  
- **src/** - przykładowy kod aplikacji  
- **scripts/** - skrypty pomocnicze do typowych zadań  

## 🎯 Cele nauki  

### Kategorie przykładów  

#### **Podstawowe wdrożenia**  
- aplikacje jednoserwisowe  
- proste wzorce infrastrukturalne  
- podstawowe zarządzanie konfiguracją  
- ekonomiczne środowiska deweloperskie  

#### **Zaawansowane scenariusze**  
- architektury wieloserwisowe  
- złożone konfiguracje sieciowe  
- wzorce integracji baz danych  
- implementacje bezpieczeństwa i zgodności  

#### **Wzorce gotowe do produkcji**  
- konfiguracje wysokiej dostępności  
- monitoring i obserwowalność  
- integracja CI/CD  
- scenariusze odzyskiwania po awarii  

## 📖 Opisy przykładów  

### Prosta aplikacja webowa – Node.js Express  
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Złożoność**: Początkujący  
**Koncepcje**: podstawowe wdrożenie, REST API, integracja bazy NoSQL  

### Strona statyczna – React SPA  
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Złożoność**: Początkujący  
**Koncepcje**: hosting statyczny, backend bezserwerowy, nowoczesny rozwój webowy  

### Container App – Python Flask  
**Technologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Złożoność**: Początkujący  
**Koncepcje**: konteneryzacja, REST API, skalowanie do zera, sondy zdrowia, monitoring  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/simple-flask-api)  

### Container App – architektura mikrousług  
**Technologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Złożoność**: Zaawansowany  
**Koncepcje**: architektura wieloserwisowa, komunikacja usług, kolejkowanie komunikatów, śledzenie rozproszone  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/microservices)  

### Aplikacja bazodanowa – C# z Azure SQL  
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Entity Framework, połączenia z bazą, tworzenie web API  

### Funkcja serverless – Python Azure Functions  
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: architektura zdarzeniowa, przetwarzanie bezserwerowe, full-stack development  

### Mikrousługi – Java Spring Boot  
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: komunikacja mikrousług, systemy rozproszone, wzorce korporacyjne  

### Przykłady Microsoft Foundry  

#### Aplikacja czatu Microsoft Foundry Models  
**Technologie**: Microsoft Foundry Models, Azure AI Search, App Service  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: architektura RAG, wyszukiwanie wektorowe, integracja LLM  

#### Przetwarzanie dokumentów AI  
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: analiza dokumentów, OCR, ekstrakcja danych  

#### Pipeline uczenia maszynowego  
**Technologie**: Azure ML, MLOps, Container Registry  
**Złożoność**: Zaawansowany  
**Koncepcje**: trening modeli, pipeline wdrożeń, monitoring  

## 🛠 Przykłady konfiguracji  

Katalog `configurations/` zawiera komponenty do ponownego użycia:  

### Konfiguracje środowisk  
- ustawienia środowiska deweloperskiego  
- konfiguracje środowiska staging  
- konfiguracje gotowe do produkcji  
- wdrożenia wieloregionowe  

### Moduły Bicep  
- wielokrotnego użytku komponenty infrastruktury  
- popularne wzorce zasobów  
- szablony zabezpieczone pod kątem bezpieczeństwa  
- konfiguracje optymalizujące koszty  

### Skrypty pomocnicze  
- automatyzacja konfiguracji środowiska  
- skrypty migracji baz danych  
- narzędzia walidacji wdrożeń  
- narzędzia monitorowania kosztów  

## 🔧 Przewodnik personalizacji  

### Dostosowanie przykładów do własnych potrzeb  

1. **Przejrzyj wymagania wstępne**  
   - sprawdź wymagania usług Azure  
   - zweryfikuj limity subskrypcji  
   - zrozum wpływ kosztów  

2. **Modyfikuj konfigurację**  
   - aktualizuj definicje usług w `azure.yaml`  
   - dostosuj szablony Bicep  
   - zmień zmienne środowiskowe  

3. **Dokładnie przetestuj**  
   - najpierw wdroż do środowiska deweloperskiego  
   - zweryfikuj funkcjonalność  
   - przetestuj skalowanie i wydajność  

4. **Przeprowadź przegląd bezpieczeństwa**  
   - przegląd kontroli dostępu  
   - wdrożenie zarządzania sekretami  
   - włącz monitoring i alerty  

## 📊 Macierz porównawcza  

| Przykład                          | Usługi | Baza danych | Uwierzytelnianie | Monitoring | Złożoność |
|----------------------------------|--------|-------------|------------------|------------|-----------|
| **Microsoft Foundry Models Chat** (lokalny) | 2      | ❌          | Key Vault        | Pełny      | ⭐⭐         |
| **Python Flask API** (lokalny)               | 1      | ❌          | Podstawowy       | Pełny      | ⭐          |
| **Mikrousługi** (lokalny)                     | 5+     | ✅          | Enterprise       | Zaawansowany | ⭐⭐⭐⭐       |
| Node.js Express Todo                           | 2      | ✅          | Podstawowy       | Podstawowy | ⭐          |
| React SPA + Functions                          | 3      | ✅          | Podstawowy       | Pełny      | ⭐          |
| Python Flask Container                         | 2      | ❌          | Podstawowy       | Pełny      | ⭐          |
| C# Web API + SQL                              | 2      | ✅          | Pełny            | Pełny      | ⭐⭐         |
| Python Functions + SPA                         | 3      | ✅          | Pełny            | Pełny      | ⭐⭐         |
| Java Mikrousługi                              | 5+     | ✅          | Pełny            | Pełny      | ⭐⭐         |
| Microsoft Foundry Models Chat                  | 3      | ✅          | Pełny            | Pełny      | ⭐⭐⭐        |
| AI Document Processing                         | 2      | ❌          | Podstawowy       | Pełny      | ⭐⭐         |
| ML Pipeline                                   | 4+     | ✅          | Pełny            | Pełny      | ⭐⭐⭐⭐       |
| **Retail Multi-Agent** (lokalny)             | **8+** | **✅**      | **Enterprise**   | **Zaawansowany** | **⭐⭐⭐⭐** |

## 🎓 Ścieżka nauki  

### Zalecana kolejność  

1. **Zacznij od prostej aplikacji webowej**  
   - poznaj podstawowe koncepcje AZD  
   - zrozum proces wdrażania  
   - trenuj zarządzanie środowiskiem  

2. **Spróbuj strony statycznej**  
   - poznaj różne opcje hostingu  
   - naucz się integracji z CDN  
   - poznaj konfigurację DNS  

3. **Przejdź do Container App**  
   - nauka podstaw konteneryzacji  
   - zrozum skalowanie  
   - praktyka z Docker  

4. **Dodaj integrację z bazą danych**  
   - nauka provisioning bazy danych  
   - zrozum łańcuchy połączeniowe  
   - praktyka zarządzania sekretami  

5. **Poznaj rozwiązania serverless**  
   - zrozum architekturę zdarzeniową  
   - nauka o triggerach i powiązaniach  
   - praktyka z API  

6. **Buduj mikrousługi**  
   - nauka komunikacji usług  
   - zrozum systemy rozproszone  
   - praktyka złożonych wdrożeń  

## 🔍 Znajdowanie odpowiedniego przykładu  

### Według stosu technologicznego  
- **Container Apps**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api), [Mikrousługi (lokalny)](../../../examples/container-app/microservices), Java Mikrousługi  
- **Node.js**: Node.js Express Todo App, [Mikrousługi API Gateway (lokalny)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api), [Mikrousługi Produkt (lokalny)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikrousługi Order (lokalny)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Mikrousługi User (lokalny)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikrousługi  
- **React**: React SPA + Functions  
- **Kontenery**: [Python Flask (lokalny)](../../../examples/container-app/simple-flask-api), [Mikrousługi (lokalny)](../../../examples/container-app/microservices), Java Mikrousługi  
- **Bazy danych**: [Mikrousługi (lokalny)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (lokalny)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Systemy wieloagentowe**: **Retail Multi-Agent Solution**  
- **Integracja OpenAI**: **[Microsoft Foundry Models Chat (lokalny)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produkcja korporacyjna**: [Mikrousługi (lokalny)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według wzorca architektury  
- **Proste REST API**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api)  
- **Monolityczna**: Node.js Express Todo, C# Web API + SQL  
- **Statyczna + serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikrousługi**: [Mikrousługi produkcyjne (lokalny)](../../../examples/container-app/microservices), Java Spring Boot Mikrousługi  
- **Konteneryzowana**: [Python Flask (lokalny)](../../../examples/container-app/simple-flask-api), [Mikrousługi (lokalny)](../../../examples/container-app/microservices)  
- **Zasilana AI**: **[Microsoft Foundry Models Chat (lokalny)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Architektura wieloagentowa**: **Retail Multi-Agent Solution**  
- **Wielo-usługowa korporacyjna**: [Mikrousługi (lokalny)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według poziomu złożoności  
- **Początkujący**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Średniozaawansowany**: **[Microsoft Foundry Models Chat (lokalny)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikrousługi, Microsoft Foundry Models Chat App, AI Document Processing  
- **Zaawansowany**: ML Pipeline  
- **Gotowy do produkcji korporacyjnej**: [Mikrousługi (lokalny)](../../../examples/container-app/microservices) (wielo-usługowy z kolejkowaniem komunikatów), **Retail Multi-Agent Solution** (kompletny system wieloagentowy z wdrożeniem szablonu ARM)  

## 📚 Dodatkowe zasoby  

### Linki do dokumentacji  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Przykłady z społeczności  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App z C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App z Python i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App z Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikacja internetowa React z API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepsze praktyki
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Wkład w przykłady

Masz przydatny przykład do udostępnienia? Zachęcamy do wkładu!

### Zasady zgłaszania
1. Przestrzegaj ustalonej struktury katalogów
2. Dołącz wyczerpujący plik README.md
3. Dodaj komentarze do plików konfiguracyjnych
4. Przetestuj dokładnie przed wysłaniem
5. Dołącz szacunkowe koszty i wymagania wstępne

### Struktura szablonu przykładu
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

**Pro Tip**: Zacznij od najprostszego przykładu odpowiadającego Twojemu stosowi technologicznemu, a następnie stopniowo przechodź do bardziej złożonych scenariuszy. Każdy przykład opiera się na koncepcjach z poprzednich!

## 🚀 Gotowy, by zacząć?

### Twoja ścieżka nauki

1. **Całkowity początkujący?** → Zacznij od [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Masz podstawową wiedzę o AZD?** → Wypróbuj [Mikroserwisy](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Budujesz aplikacje AI?** → Zacznij od [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) lub poznaj [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, ponad 2 godz.)
4. **Potrzebujesz konkretnego stosu technologicznego?** → Skorzystaj z sekcji [Znajdowanie odpowiedniego przykładu](#-finding-the-right-example) powyżej

### Kolejne kroki

- ✅ Przejrzyj powyższe [Wymagania wstępne](#wymagania-wstępne)
- ✅ Wybierz przykład odpowiadający Twojemu poziomowi umiejętności (patrz [Legenda ocen złożoności](#legenda-trudności))
- ✅ Dokładnie przeczytaj README przykładu przed wdrożeniem
- ✅ Ustaw przypomnienie, aby uruchomić `azd down` po testach
- ✅ Podziel się swoimi doświadczeniami za pomocą GitHub Issues lub Dyskusji

### Potrzebujesz pomocy?

- 📖 [FAQ](../resources/faq.md) - Najczęściej zadawane pytania
- 🐛 [Przewodnik rozwiązywania problemów](../docs/chapter-07-troubleshooting/common-issues.md) - Napraw problemy z wdrożeniem
- 💬 [Dyskusje GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Zapytaj społeczność
- 📚 [Przewodnik do nauki](../resources/study-guide.md) - Utrwalaj swoją wiedzę

---

**Nawigacja**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Materiały do nauki**: [Przewodnik do nauki](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Słownik](../resources/glossary.md)
- **🔧 Zasoby**: [FAQ](../resources/faq.md) | [Rozwiązywanie problemów](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ostatnia aktualizacja: listopad 2025 | [Zgłoś problemy](https://github.com/microsoft/AZD-for-beginners/issues) | [Dodaj przykłady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->