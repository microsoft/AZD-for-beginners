# Przykłady - Praktyczne szablony i konfiguracje AZD

**Uczenie się przez przykład - zorganizowane według rozdziałów**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Mapowanie rozdziałów**: Przykłady uporządkowane według stopnia trudności
- **🚀 Przykład lokalny**: [Rozwiązanie wieloagentowe dla handlu detalicznego](retail-scenario.md)
- **🤖 Przykłady AI zewnętrzne**: Linki do repozytoriów Azure Samples

> **📍 WAŻNE: Przykłady lokalne kontra zewnętrzne**  
> To repozytorium zawiera **4 kompletne lokalne przykłady** z pełnymi implementacjami:  
> - **Azure OpenAI Chat** (wdrożenie GPT-4 z interfejsem rozmowy)  
> - **Container Apps** (proste API Flask + mikrousługi)  
> - **Aplikacja z bazą danych** (web + baza SQL)  
> - **Rozwiązanie wieloagentowe dla handlu detalicznego** (rozwiązanie AI dla przedsiębiorstw)  
>  
> Dodatkowe przykłady to **odnośniki zewnętrzne** do repozytoriów Azure-Samples, które możesz sklonować.

## Wprowadzenie

Ten katalog zawiera praktyczne przykłady i odniesienia, które pomogą Ci nauczyć się Azure Developer CLI poprzez praktykę. Scenariusz wieloagentowy dla handlu detalicznego to kompletna, gotowa do produkcji implementacja zawarta w tym repozytorium. Dodatkowe przykłady odwołują się do oficjalnych Azure Samples prezentujących różne wzorce AZD.

### Legenda poziomu trudności

- ⭐ **Początkujący** - podstawowe koncepcje, jedna usługa, 15-30 minut
- ⭐⭐ **Średnio zaawansowany** - wiele usług, integracja bazy danych, 30-60 minut
- ⭐⭐⭐ **Zaawansowany** - złożona architektura, integracja AI, 1-2 godziny
- ⭐⭐⭐⭐ **Ekspert** - gotowe do produkcji, wzorce dla przedsiębiorstw, 2+ godziny

## 🎯 Co właściwie znajduje się w tym repozytorium

### ✅ Lokalna implementacja (gotowa do użycia)

#### [Aplikacja Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Kompletne wdrożenie GPT-4 z interfejsem czatu zawarte w repozytorium**

- **Lokalizacja:** `examples/azure-openai-chat/`
- **Poziom trudności:** ⭐⭐ (Średnio zaawansowany)
- **Co zawiera:**
  - Kompletny deployment Azure OpenAI (GPT-4)
  - Interfejs rozmowy wiersza poleceń w Pythonie
  - Integracja z Key Vault dla bezpiecznego zarządzania kluczami API
  - Szablony infrastruktury Bicep
  - Śledzenie użycia tokenów i kosztów
  - Ograniczenia tempa i obsługa błędów

**Szybki start:**
```bash
# Przejdź do przykładu
cd examples/azure-openai-chat

# Wdróż wszystko
azd up

# Zainstaluj zależności i rozpocznij rozmowę
pip install -r src/requirements.txt
python src/chat.py
```

**Technologie:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Przykłady aplikacji kontenerowych](container-app/README.md) 🆕
**Obszerne przykłady wdrożeń kontenerów zawarte w repozytorium**

- **Lokalizacja:** `examples/container-app/`
- **Poziom trudności:** ⭐-⭐⭐⭐⭐ (Od początkującego do zaawansowanego)
- **Co zawiera:**
  - [Przewodnik główny](container-app/README.md) - Kompletny przegląd wdrożeń kontenerów
  - [Proste API Flask](../../../examples/container-app/simple-flask-api) - Podstawowy przykład REST API
  - [Architektura mikrousług](../../../examples/container-app/microservices) - Gotowa do produkcji architektura wielousługowa
  - Wzorce szybkiego startu, produkcyjne i zaawansowane
  - Monitorowanie, bezpieczeństwo i optymalizacja kosztów

**Szybki start:**
```bash
# Zobacz przewodnik główny
cd examples/container-app

# Wdrażaj prostą API Flask
cd simple-flask-api
azd up

# Wdrażaj przykład mikroserwisów
cd ../microservices
azd up
```

**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Rozwiązanie wieloagentowe dla handlu detalicznego](retail-scenario.md) 🆕
**Kompletna implementacja gotowa do produkcji zawarta w repozytorium**

- **Lokalizacja:** `examples/retail-multiagent-arm-template/`
- **Poziom trudności:** ⭐⭐⭐⭐ (Zaawansowany)
- **Co zawiera:**
  - Kompletny szablon wdrożenia ARM
  - Architektura wieloagentowa (obsługa klienta + zarządzanie zapasami)
  - Integracja z Azure OpenAI
  - Wyszukiwanie AI z RAG
  - Kompleksowe monitorowanie
  - Skrypt wdrożenia jednym kliknięciem

**Szybki start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologie:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Zewnętrzne przykłady Azure (Sklonuj, aby używać)

Następujące przykłady są utrzymywane w oficjalnych repozytoriach Azure-Samples. Sklonuj je, aby poznać różne wzorce AZD:

### Proste aplikacje (rozdziały 1-2)

| Szablon | Repozytorium | Poziom trudności | Usługi |
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

| Szablon | Repozytorium | Poziom trudności | Skupienie |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokalnie: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Wdrożenie GPT-4 |
| **Szybki start AI Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Podstawowy czat AI |
| **Agenci AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework agentów |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Wzorzec RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI dla przedsiębiorstw |

### Bazy danych i zaawansowane wzorce (rozdziały 3-8)

| Szablon | Repozytorium | Poziom trudności | Skupienie |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracja bazy danych |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Wielousługowe |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cele nauki

Pracując nad tymi przykładami, będziesz mógł:
- Ćwiczyć przepływy pracy Azure Developer CLI na realistycznych scenariuszach aplikacji
- Zrozumieć różne architektury aplikacji i ich implementacje w azd
- Opanować wzorce Infrastructure as Code dla różnych usług Azure
- Zastosować zarządzanie konfiguracją i strategie wdrożeń specyficznych dla środowisk
- Wdrożyć wzorce monitorowania, bezpieczeństwa i skalowania w praktycznych kontekstach
- Zdobyć doświadczenie w rozwiązywaniu problemów i debugowaniu rzeczywistych scenariuszy wdrożeń

## Efekty nauki

Po ukończeniu tych przykładów będziesz potrafił:
- Pewnie wdrażać różne typy aplikacji za pomocą Azure Developer CLI
- Dostosować dostarczone szablony do własnych wymagań aplikacji
- Projektować i implementować niestandardowe wzorce infrastruktury przy użyciu Bicep
- Konfigurować złożone aplikacje wielousługowe z właściwymi zależnościami
- Zastosować najlepsze praktyki bezpieczeństwa, monitorowania i wydajności w rzeczywistych scenariuszach
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

> **💡 Nowy w AZD?** Zacznij od przykładu nr 1 (Flask API) – zajmie około 20 minut i nauczy podstaw.

### Dla początkujących
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (lokalnie) ⭐  
   Wdrożenie prostego REST API ze skalowaniem do zera  
   **Czas:** 20-25 minut | **Koszt:** 0-5 USD/miesiąc  
   **Czego się nauczysz:** Podstawowy przepływ pracy azd, konteneryzacja, sondy zdrowia  
   **Oczekiwany efekt:** Działający endpoint API zwracający "Hello, World!" z monitorowaniem

2. **[Prosta aplikacja webowa - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Wdrożenie aplikacji webowej Node.js Express z MongoDB  
   **Czas:** 25-35 minut | **Koszt:** 10-30 USD/miesiąc  
   **Czego się nauczysz:** Integracja bazy, zmienne środowiskowe, łańcuchy połączeń  
   **Oczekiwany efekt:** Aplikacja listy zadań z funkcjami create/read/update/delete

3. **[Strona statyczna - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostowanie statycznej strony React z Azure Static Web Apps  
   **Czas:** 20-30 minut | **Koszt:** 0-10 USD/miesiąc  
   **Czego się nauczysz:** Hosting statyczny, funkcje serverless, wdrożenie CDN  
   **Oczekiwany efekt:** UI React z backendem API, automatyczne SSL, globalny CDN

### Dla średnio zaawansowanych
4. **[Aplikacja Azure OpenAI Chat](../../../examples/azure-openai-chat)** (lokalnie) ⭐⭐  
   Wdrożenie GPT-4 z interfejsem czatu i bezpiecznym zarządzaniem kluczami API  
   **Czas:** 35-45 minut | **Koszt:** 50-200 USD/miesiąc  
   **Czego się nauczysz:** Wdrożenie Azure OpenAI, integracja z Key Vault, śledzenie tokenów  
   **Oczekiwany efekt:** Działająca aplikacja czatu z GPT-4 i monitorowaniem kosztów

5. **[Container App - mikrousługi](../../../examples/container-app/microservices)** (lokalnie) ⭐⭐⭐⭐  
   Architektura gotowa do produkcji z wieloma usługami  
   **Czas:** 45-60 minut | **Koszt:** 50-150 USD/miesiąc  
   **Czego się nauczysz:** Komunikacja usług, kolejki wiadomości, rozproszone śledzenie  
   **Oczekiwany efekt:** System z 2 usługami (API Gateway + Product Service) z monitorowaniem

6. **[Aplikacja z bazą danych - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikacja webowa z API C# i bazą Azure SQL  
   **Czas:** 30-45 minut | **Koszt:** 20-80 USD/miesiąc  
   **Czego się nauczysz:** Entity Framework, migracje bazy, bezpieczeństwo połączeń  
   **Oczekiwany efekt:** API C# z backendem Azure SQL, automatyczne wdrożenie schematu

7. **[Funkcja serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions z wyzwalaczami HTTP i Cosmos DB  
   **Czas:** 30-40 minut | **Koszt:** 10-40 USD/miesiąc  
   **Czego się nauczysz:** Architektura zdarzeniowa, skalowanie serverless, integracja NoSQL  
   **Oczekiwany efekt:** Aplikacja funkcji odpowiadająca na żądania HTTP z magazynem Cosmos DB

8. **[Mikrousługi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Wielousługowa aplikacja Java z Container Apps i bramą API  
   **Czas:** 60-90 minut | **Koszt:** 80-200 USD/miesiąc  
   **Czego się nauczysz:** Wdrożenie Spring Boot, siatka usług, balansowanie obciążenia  
   **Oczekiwany efekt:** System wielousługowy Java z wykrywaniem usług i trasowaniem

### Szablony Microsoft Foundry

1. **[Azure OpenAI Chat App - przykład lokalny](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletny deployment GPT-4 z interfejsem czatu  
   **Czas:** 35-45 minut | **Koszt:** 50-200 USD/miesiąc  
   **Oczekiwany efekt:** Działająca aplikacja czatu ze śledzeniem tokenów i monitorowaniem kosztów

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna aplikacja czatu z architekturą RAG  
   **Czas:** 60-90 minut | **Koszt:** 100-300 USD/miesiąc  
   **Oczekiwany efekt:** Interfejs czatu zasilany przez RAG z wyszukiwaniem dokumentów i cytatami

3. **[Przetwarzanie dokumentów AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumentów za pomocą usług Azure AI  
   **Czas:** 40-60 minut | **Koszt:** 20-80 USD/miesiąc  
   **Oczekiwany efekt:** API wyciągające tekst, tabele i podmioty z załadowanych dokumentów

4. **[Pipeline uczenia maszynowego](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Przepływ MLOps z Azure Machine Learning  
   **Czas:** 2-3 godziny | **Koszt:** 150-500 USD/miesiąc  
   **Oczekiwany efekt:** Zautomatyzowany pipeline ML z treningiem, wdrożeniem i monitorowaniem

### Przykłady scenariuszy rzeczywistych

#### **Rozwiązanie wieloagentowe dla handlu detalicznego** 🆕  
**[Kompletny przewodnik implementacji](./retail-scenario.md)**

Kompleksowe, gotowe do produkcji rozwiązanie wieloagentowe do obsługi klienta, które pokazuje wdrażanie aplikacji AI na poziomie przedsiębiorstwa z użyciem AZD. Scenariusz obejmuje:

- **Kompletną architekturę**: system wieloagentowy z wyspecjalizowanymi agentami obsługi klienta i zarządzania zapasami
- **Infrastruktura produkcyjna**: Wdrażania Azure OpenAI w wielu regionach, AI Search, Container Apps oraz kompleksowy monitoring  
- **Gotowy do wdrożenia szablon ARM**: Jednoklikowe wdrożenie z wieloma trybami konfiguracji (Minimalny/Standardowy/Premium)  
- **Zaawansowane funkcje**: Walidacja bezpieczeństwa red teaming, framework oceny agentów, optymalizacja kosztów oraz przewodniki rozwiązywania problemów  
- **Rzeczywisty kontekst biznesowy**: Przypadek obsługi klienta detalisty z przesyłaniem plików, integracją wyszukiwania i dynamicznym skalowaniem  

**Technologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Złożoność**: ⭐⭐⭐⭐ (Zaawansowany - gotowy do produkcji korporacyjnej)  

**Idealne dla**: programistów AI, architektów rozwiązań oraz zespołów budujących produkcyjne systemy wieloagentowe  

**Szybki start**: Wdrożenie kompletnego rozwiązania w mniej niż 30 minut za pomocą dołączonego szablonu ARM z `./deploy.sh -g myResourceGroup`  

## 📋 Instrukcje użytkowania

### Wymagania wstępne

Przed uruchomieniem dowolnego przykładu:  
- ✅ Subskrypcja Azure z dostępem właściciela lub współtwórcy  
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik instalacji](../docs/chapter-01-foundation/installation.md))  
- ✅ Uruchomiony Docker Desktop (dla przykładów kontenerowych)  
- ✅ Odpowiednie limity Azure (sprawdź wymagania specyficzne dla przykładu)  

> **💰 Ostrzeżenie o kosztach:** Wszystkie przykłady tworzą rzeczywiste zasoby Azure, za które naliczane są opłaty. Zobacz pliki README poszczególnych przykładów, aby poznać szacunkowe koszty. Pamiętaj, aby po zakończeniu uruchomić `azd down`, aby uniknąć dalszych kosztów.  

### Uruchamianie przykładów lokalnie

1. **Sklonuj lub skopiuj przykład**  
   ```bash
   # Przejdź do wybranego przykładu
   cd examples/simple-web-app
   ```
  
2. **Zainicjuj środowisko AZD**  
   ```bash
   # Inicjalizuj z istniejącym szablonem
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
   # Wdrażanie infrastruktury i aplikacji
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
   - ✅ `azd up` zakończone bez błędów  
   - ✅ Punkt końcowy usługi zwraca HTTP 200  
   - ✅ Portal Azure pokazuje status „Running”  
   - ✅ Application Insights odbiera telemetrię  

> **⚠️ Problemy?** Zobacz [Typowe problemy](../docs/chapter-07-troubleshooting/common-issues.md) dotyczące rozwiązywania problemów z wdrożeniem  

### Dostosowywanie przykładów

Każdy przykład zawiera:  
- **README.md** - Szczegółowe instrukcje konfiguracji i personalizacji  
- **azure.yaml** - Konfigurację AZD z komentarzami  
- **infra/** - Szablony Bicep z wyjaśnieniami parametrów  
- **src/** - Kod przykładowej aplikacji  
- **scripts/** - Skrypty pomocnicze do typowych zadań  

## 🎯 Cele edukacyjne

### Kategorie przykładów

#### **Podstawowe wdrożenia**  
- Aplikacje jednousługowe  
- Proste wzorce infrastruktury  
- Podstawowe zarządzanie konfiguracją  
- Ekonomiczne środowiska rozwojowe  

#### **Zaawansowane scenariusze**  
- Architektury wielousługowe  
- Złożone konfiguracje sieciowe  
- Wzorce integracji baz danych  
- Wdrożenia bezpieczeństwa i zgodności  

#### **Wzorce produkcyjne**  
- Konfiguracje wysokiej dostępności  
- Monitoring i obserwowalność  
- Integracja CI/CD  
- Plany odzyskiwania po awarii  

## 📖 Opisy przykładów

### Prosta aplikacja webowa - Node.js Express  
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Złożoność**: Początkujący  
**Koncepcje**: Podstawowe wdrożenie, REST API, integracja bazy NoSQL  

### Statyczna strona - React SPA  
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Złożoność**: Początkujący  
**Koncepcje**: Hosting statyczny, backend serverless, nowoczesny rozwój webowy  

### Container App - Python Flask  
**Technologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Złożoność**: Początkujący  
**Koncepcje**: Konteneryzacja, REST API, skalowanie do zera, sondy stanu, monitoring  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/simple-flask-api)  

### Container App - architektura mikroserwisów  
**Technologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Złożoność**: Zaawansowany  
**Koncepcje**: Architektura wielousługowa, komunikacja usług, kolejkowanie wiadomości, śledzenie rozproszone  
**Lokalizacja**: [Przykład lokalny](../../../examples/container-app/microservices)  

### Aplikacja bazodanowa - C# z Azure SQL  
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Entity Framework, połączenia z bazą, rozwój web API  

### Funkcja serverless - Python Azure Functions  
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Architektura zdarzeniowa, obliczenia bezserwerowe, rozwój pełnego stosu  

### Mikroserwisy - Java Spring Boot  
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Komunikacja mikroserwisów, systemy rozproszone, wzorce korporacyjne  

### Przykłady Microsoft Foundry

#### Aplikacja czatu Azure OpenAI  
**Technologie**: Azure OpenAI, Cognitive Search, App Service  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Architektura RAG, wyszukiwanie wektorowe, integracja LLM  

#### Przetwarzanie dokumentów AI  
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Analiza dokumentów, OCR, ekstrakcja danych  

#### Pipeline uczenia maszynowego  
**Technologie**: Azure ML, MLOps, Container Registry  
**Złożoność**: Zaawansowany  
**Koncepcje**: Trening modeli, pipeline'y wdrożeniowe, monitoring  

## 🛠 Przykłady konfiguracji

Katalog `configurations/` zawiera wielokrotnego użytku komponenty:  

### Konfiguracje środowisk  
- Ustawienia środowisk deweloperskich  
- Konfiguracje środowisk testowych  
- Konfiguracje gotowe do produkcji  
- Wdrażanie w wielu regionach  

### Moduły Bicep  
- Wielokrotnego użytku komponenty infrastruktury  
- Powszechne wzorce zasobów  
- Bezpieczne, wzmocnione szablony  
- Optymalne pod kątem kosztów konfiguracje  

### Skrypty pomocnicze  
- Automatyzacja konfiguracji środowiska  
- Skrypty migracji baz danych  
- Narzędzia weryfikacji wdrożeń  
- Narzędzia monitorowania kosztów  

## 🔧 Przewodnik dostosowywania

### Dostosowywanie przykładów do Twojego przypadku

1. **Sprawdź wymagania wstępne**  
   - Zweryfikuj wymogi usług Azure  
   - Sprawdź limity subskrypcji  
   - Zrozum konsekwencje kosztowe  

2. **Zmodyfikuj konfigurację**  
   - Zaktualizuj definicje usług w `azure.yaml`  
   - Dostosuj szablony Bicep  
   - Skoryguj zmienne środowiskowe  

3. **Dokładnie przetestuj**  
   - Wdróż najpierw na środowisku deweloperskim  
   - Zweryfikuj funkcjonalność  
   - Przetestuj skalowalność i wydajność  

4. **Przejrzyj bezpieczeństwo**  
   - Poddaj kontroli dostępu  
   - Wdróż zarządzanie tajemnicami  
   - Aktywuj monitoring i alerty  

## 📊 Macierz porównawcza

| Przykład                     | Usługi | Baza danych | Autoryzacja | Monitoring | Złożoność |
|-----------------------------|--------|-------------|-------------|------------|-----------|
| **Czat Azure OpenAI** (lokalny)    | 2      | ❌          | Key Vault   | Pełny      | ⭐⭐       |
| **Python Flask API** (lokalny)     | 1      | ❌          | Podstawowy  | Pełny      | ⭐        |
| **Mikroserwisy** (lokalny)         | 5+     | ✅          | Korporacyjny| Zaawansowany| ⭐⭐⭐⭐     |
| Node.js Express Todo              | 2      | ✅          | Podstawowy  | Podstawowy | ⭐        |
| React SPA + Functions             | 3      | ✅          | Podstawowy  | Pełny      | ⭐        |
| Python Flask Container            | 2      | ❌          | Podstawowy  | Pełny      | ⭐        |
| C# Web API + SQL                 | 2      | ✅          | Pełny       | Pełny      | ⭐⭐       |
| Python Functions + SPA           | 3      | ✅          | Pełny       | Pełny      | ⭐⭐       |
| Java Mikroserwisy                | 5+     | ✅          | Pełny       | Pełny      | ⭐⭐       |
| Azure OpenAI Chat                | 3      | ✅          | Pełny       | Pełny      | ⭐⭐⭐      |
| AI Dokument Processing          | 2      | ❌          | Podstawowy  | Pełny      | ⭐⭐       |
| ML Pipeline                     | 4+     | ✅          | Pełny       | Pełny      | ⭐⭐⭐⭐     |
| **Retail Multi-Agent** (lokalny)   | **8+** | **✅**      | **Korporacyjny**| **Zaawansowany** | **⭐⭐⭐⭐** |

## 🎓 Ścieżka nauki

### Zalecana kolejność

1. **Zacznij od prostej aplikacji webowej**  
   - Poznaj podstawowe koncepcje AZD  
   - Zrozum przepływ wdrożenia  
   - Ćwicz zarządzanie środowiskiem  

2. **Spróbuj strony statycznej**  
   - Poznaj różne opcje hostingu  
   - Naucz się o integracji CDN  
   - Zrozum konfigurację DNS  

3. **Przejdź do Container App**  
   - Naucz się podstaw konteneryzacji  
   - Zrozum koncepcje skalowania  
   - Ćwicz z Dockerem  

4. **Dodaj integrację bazy danych**  
   - Poznaj provisioning bazy  
   - Zrozum łańcuchy połączeń  
   - Ćwicz zarządzanie tajemnicami  

5. **Poznaj serverless**  
   - Zrozum architekturę zdarzeniową  
   - Naucz się o triggerach i bindingach  
   - Ćwicz z API  

6. **Buduj mikroserwisy**  
   - Naucz się komunikacji usług  
   - Zrozum systemy rozproszone  
   - Ćwicz złożone wdrożenia  

## 🔍 Jak znaleźć odpowiedni przykład

### Według stacku technologicznego  
- **Container Apps**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api), [Mikroserwisy (lokalny)](../../../examples/container-app/microservices), Java Mikroserwisy  
- **Node.js**: Node.js Express Todo App, [Mikroserwisy API Gateway (lokalny)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api), [Mikroserwisy Product Service (lokalny)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroserwisy Order Service (lokalny)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Mikroserwisy User Service (lokalny)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroserwisy  
- **React**: React SPA + Functions  
- **Kontenery**: [Python Flask (lokalny)](../../../examples/container-app/simple-flask-api), [Mikroserwisy (lokalny)](../../../examples/container-app/microservices), Java Mikroserwisy  
- **Bazy danych**: [Mikroserwisy (lokalny)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (lokalny)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Systemy wieloagentowe**: **Retail Multi-Agent Solution**  
- **Integracja OpenAI**: **[Azure OpenAI Chat (lokalny)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produkcja korporacyjna**: [Mikroserwisy (lokalny)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według wzorca architektury  
- **Proste REST API**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api)  
- **Monolit**: Node.js Express Todo, C# Web API + SQL  
- **Statyczne + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroserwisy**: [Produkcja Mikroserwisów (lokalny)](../../../examples/container-app/microservices), Java Spring Boot Mikroserwisy  
- **Konteneryzowane**: [Python Flask (lokalny)](../../../examples/container-app/simple-flask-api), [Mikroserwisy (lokalny)](../../../examples/container-app/microservices)  
- **Zasilane AI**: **[Azure OpenAI Chat (lokalny)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Architektura wieloagentowa**: **Retail Multi-Agent Solution**  
- **Wielousługowe korporacyjne**: [Mikroserwisy (lokalny)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Według poziomu złożoności  
- **Początkujący**: [Python Flask API (lokalny)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Średnio zaawansowany**: **[Azure OpenAI Chat (lokalny)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroserwisy, Azure OpenAI Chat App, AI Document Processing  
- **Zaawansowany**: ML Pipeline  
- **Gotowy do produkcji korporacyjnej**: [Mikroserwisy (lokalny)](../../../examples/container-app/microservices) (wielo-usługowy z kolejkowaniem), **Retail Multi-Agent Solution** (kompletny system wieloagentowy z szablonem ARM do wdrożenia)  

## 📚 Dodatkowe zasoby

### Linki do dokumentacji  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Przykłady społecznościowe  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App z C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App z Python i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikacja Todo z Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikacja internetowa React z API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Zadanie Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepsze praktyki
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Wkład w przykłady

Masz przydatny przykład do udostępnienia? Zapraszamy do współpracy!

### Wytyczne dotyczące zgłoszeń
1. Przestrzegaj ustalonej struktury katalogów
2. Dołącz wyczerpujący plik README.md
3. Dodaj komentarze do plików konfiguracyjnych
4. Dokładnie przetestuj przed zgłoszeniem
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

**Pro Tip**: Zacznij od najprostszych przykładów odpowiadających Twojemu stosowi technologicznemu, a następnie stopniowo przechodź do bardziej złożonych scenariuszy. Każdy przykład buduje na koncepcjach poprzednich!

## 🚀 Gotowy, aby zacząć?

### Twoja ścieżka nauki

1. **Całkowity początkujący?** → Zacznij od [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Masz podstawową znajomość AZD?** → Wypróbuj [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Tworzysz aplikacje AI?** → Zacznij od [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) lub poznaj [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ godziny)
4. **Potrzebujesz konkretnego stosu technologicznego?** → Skorzystaj z sekcji [Znajdowanie odpowiedniego przykładu](../../../examples) wyżej

### Kolejne kroki

- ✅ Sprawdź [Wymagania wstępne](../../../examples) powyżej
- ✅ Wybierz przykład odpowiadający swojemu poziomowi umiejętności (zobacz [Legenda złożoności](../../../examples))
- ✅ Przeczytaj uważnie plik README przykładu przed wdrożeniem
- ✅ Ustaw przypomnienie o uruchomieniu `azd down` po testach
- ✅ Podziel się doświadczeniami przez GitHub Issues lub Dyskusje

### Potrzebujesz pomocy?

- 📖 [FAQ](../resources/faq.md) - Najczęściej zadawane pytania
- 🐛 [Przewodnik rozwiązywania problemów](../docs/chapter-07-troubleshooting/common-issues.md) - Napraw problemy z wdrożeniem
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Zapytaj społeczność
- 📚 [Przewodnik nauki](../resources/study-guide.md) - Utrwal swoją wiedzę

---

**Nawigacja**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Materiały do nauki**: [Przewodnik nauki](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Słownik](../resources/glossary.md)
- **🔧 Zasoby**: [FAQ](../resources/faq.md) | [Rozwiązywanie problemów](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ostatnia aktualizacja: listopad 2025 | [Zgłoś problemy](https://github.com/microsoft/AZD-for-beginners/issues) | [Wkład w przykłady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji o istotnym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->