<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T16:46:07+00:00",
  "source_file": "examples/README.md",
  "language_code": "pl"
}
-->
# Przykłady - Praktyczne szablony i konfiguracje AZD

**Nauka przez przykłady - zorganizowane według rozdziałów**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Mapa rozdziałów**: Przykłady zorganizowane według poziomu trudności
- **🚀 Zacznij od prostych**: [Przykłady z rozdziału 1](../../../examples)
- **🤖 Przykłady AI**: [Rozdział 2 i 5 - Rozwiązania AI](../../../examples)

## Wprowadzenie

Ten katalog zawiera praktyczne przykłady, szablony i scenariusze z życia wzięte, które pomogą Ci nauczyć się korzystać z Azure Developer CLI poprzez praktyczne ćwiczenia. Każdy przykład zawiera kompletny kod, szablony infrastruktury oraz szczegółowe instrukcje dla różnych architektur aplikacji i wzorców wdrożeniowych.

## Cele nauki

Pracując z tymi przykładami, nauczysz się:
- Praktykować przepływy pracy Azure Developer CLI w realistycznych scenariuszach aplikacji
- Rozumieć różne architektury aplikacji i ich implementacje w AZD
- Opanować wzorce Infrastructure as Code dla różnych usług Azure
- Stosować zarządzanie konfiguracją i strategie wdrożeniowe specyficzne dla środowiska
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

### Dla początkujących
1. **[Prosta aplikacja webowa - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Wdrażanie aplikacji webowej Node.js Express z MongoDB
2. **[Strona statyczna - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hosting statycznej strony React za pomocą Azure Static Web Apps
3. **[Aplikacja kontenerowa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Wdrażanie konteneryzowanej aplikacji Python Flask

### Dla średniozaawansowanych
4. **[Aplikacja bazodanowa - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Aplikacja webowa z API w C# i bazą danych Azure SQL
5. **[Funkcja bezserwerowa - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Funkcje Azure w Pythonie z wyzwalaczami HTTP i Cosmos DB
6. **[Mikrousługi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Wielousługowa aplikacja Java z Container Apps i bramą API

### Szablony Azure AI Foundry

1. **[Aplikacja czatu Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentna aplikacja czatu z Azure OpenAI
2. **[Przetwarzanie dokumentów AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analiza dokumentów za pomocą usług Azure AI
3. **[Pipeline uczenia maszynowego](https://github.com/Azure-Samples/mlops-v2)** - Przepływ pracy MLOps z Azure Machine Learning

### Scenariusze z życia wzięte

#### **Rozwiązanie wieloagentowe dla handlu detalicznego** 🆕
**[Kompletny przewodnik wdrożeniowy](./retail-scenario.md)**

Kompleksowe, gotowe do produkcji rozwiązanie wieloagentowe dla obsługi klienta, które demonstruje wdrożenie aplikacji AI klasy korporacyjnej za pomocą AZD. Ten scenariusz oferuje:

- **Kompletną architekturę**: System wieloagentowy z wyspecjalizowanymi agentami obsługi klienta i zarządzania zapasami
- **Infrastrukturę produkcyjną**: Wdrożenia Azure OpenAI w wielu regionach, AI Search, Container Apps i kompleksowe monitorowanie
- **Gotowy do wdrożenia szablon ARM**: Wdrożenie jednym kliknięciem z wieloma trybami konfiguracji (Minimalny/Standardowy/Premium)
- **Zaawansowane funkcje**: Walidacja bezpieczeństwa, framework oceny agentów, optymalizacja kosztów i przewodniki rozwiązywania problemów
- **Rzeczywisty kontekst biznesowy**: Przypadek użycia obsługi klienta w handlu detalicznym z przesyłaniem plików, integracją wyszukiwania i dynamicznym skalowaniem

**Technologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Poziom trudności**: ⭐⭐⭐⭐ (Zaawansowany - Gotowy do produkcji)

**Idealne dla**: Programistów AI, architektów rozwiązań i zespołów budujących systemy wieloagentowe gotowe do produkcji

**Szybki start**: Wdróż kompletne rozwiązanie w mniej niż 30 minut za pomocą dołączonego szablonu ARM z `./deploy.sh -g myResourceGroup`

## 📋 Instrukcje użytkowania

### Uruchamianie przykładów lokalnie

1. **Sklonuj lub skopiuj przykład**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Zainicjalizuj środowisko AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Skonfiguruj środowisko**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Wdróż**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Dostosowywanie przykładów

Każdy przykład zawiera:
- **README.md** - Szczegółowe instrukcje konfiguracji i dostosowania
- **azure.yaml** - Konfiguracja AZD z komentarzami
- **infra/** - Szablony Bicep z wyjaśnieniami parametrów
- **src/** - Przykładowy kod aplikacji
- **scripts/** - Pomocnicze skrypty do typowych zadań

## 🎯 Cele nauki

### Kategorie przykładów

#### **Podstawowe wdrożenia**
- Aplikacje jednouługowe
- Proste wzorce infrastruktury
- Podstawowe zarządzanie konfiguracją
- Kosztowo efektywne środowiska deweloperskie

#### **Zaawansowane scenariusze**
- Architektury wielousługowe
- Złożone konfiguracje sieciowe
- Wzorce integracji baz danych
- Implementacje bezpieczeństwa i zgodności

#### **Wzorce gotowe do produkcji**
- Konfiguracje wysokiej dostępności
- Monitorowanie i obserwowalność
- Integracja CI/CD
- Plany odzyskiwania po awarii

## 📖 Opisy przykładów

### Prosta aplikacja webowa - Node.js Express
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Poziom trudności**: Początkujący  
**Koncepcje**: Podstawowe wdrożenie, REST API, integracja bazy NoSQL

### Strona statyczna - React SPA
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Poziom trudności**: Początkujący  
**Koncepcje**: Hosting statyczny, backend bezserwerowy, nowoczesny rozwój webowy

### Aplikacja kontenerowa - Python Flask
**Technologie**: Python Flask, Docker, Container Apps, Container Registry  
**Poziom trudności**: Początkujący  
**Koncepcje**: Konteneryzacja, architektura mikrousług, rozwój API

### Aplikacja bazodanowa - C# z Azure SQL
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Poziom trudności**: Średniozaawansowany  
**Koncepcje**: Entity Framework, połączenia z bazą danych, rozwój API webowego

### Funkcja bezserwerowa - Python Azure Functions
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Poziom trudności**: Średniozaawansowany  
**Koncepcje**: Architektura zdarzeniowa, obliczenia bezserwerowe, rozwój full-stack

### Mikrousługi - Java Spring Boot
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Poziom trudności**: Średniozaawansowany  
**Koncepcje**: Komunikacja mikrousług, systemy rozproszone, wzorce korporacyjne

### Przykłady Azure AI Foundry

#### Aplikacja czatu Azure OpenAI
**Technologie**: Azure OpenAI, Cognitive Search, App Service  
**Poziom trudności**: Średniozaawansowany  
**Koncepcje**: Architektura RAG, wyszukiwanie wektorowe, integracja LLM

#### Przetwarzanie dokumentów AI
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Poziom trudności**: Średniozaawansowany  
**Koncepcje**: Analiza dokumentów, OCR, ekstrakcja danych

#### Pipeline uczenia maszynowego
**Technologie**: Azure ML, MLOps, Container Registry  
**Poziom trudności**: Zaawansowany  
**Koncepcje**: Trening modeli, pipeline wdrożeniowy, monitorowanie

## 🛠 Przykłady konfiguracji

Katalog `configurations/` zawiera komponenty wielokrotnego użytku:

### Konfiguracje środowiskowe
- Ustawienia środowiska deweloperskiego
- Konfiguracje środowiska stagingowego
- Konfiguracje gotowe do produkcji
- Wdrożenia w wielu regionach

### Moduły Bicep
- Komponenty infrastruktury wielokrotnego użytku
- Wzorce zasobów wspólnych
- Szablony zabezpieczone
- Konfiguracje zoptymalizowane kosztowo

### Pomocnicze skrypty
- Automatyzacja konfiguracji środowiska
- Skrypty migracji baz danych
- Narzędzia walidacji wdrożenia
- Narzędzia monitorowania kosztów

## 🔧 Przewodnik dostosowywania

### Dostosowywanie przykładów do własnych potrzeb

1. **Przegląd wymagań**
   - Sprawdź wymagania dotyczące usług Azure
   - Zweryfikuj limity subskrypcji
   - Zrozum implikacje kosztowe

2. **Modyfikacja konfiguracji**
   - Zaktualizuj definicje usług w `azure.yaml`
   - Dostosuj szablony Bicep
   - Zmień zmienne środowiskowe

3. **Dokładne testowanie**
   - Najpierw wdrożenie w środowisku deweloperskim
   - Walidacja funkcjonalności
   - Testowanie skalowania i wydajności

4. **Przegląd bezpieczeństwa**
   - Przegląd kontroli dostępu
   - Implementacja zarządzania sekretami
   - Włączenie monitorowania i alertów

## 📊 Macierz porównawcza

| Przykład | Usługi | Baza danych | Autoryzacja | Monitorowanie | Poziom trudności |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Podstawowa | Podstawowa | ⭐ |
| React SPA + Functions | 3 | ✅ | Podstawowa | Pełna | ⭐ |
| Python Flask Container | 2 | ❌ | Podstawowa | Pełna | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pełna | Pełna | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pełna | Pełna | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Pełna | Pełna | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Pełna | Pełna | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Podstawowa | Pełna | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pełna | Pełna | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Zaawansowane** | **⭐⭐⭐⭐** |

## 🎓 Ścieżka nauki

### Zalecana progresja

1. **Zacznij od prostej aplikacji webowej**
   - Naucz się podstaw AZD
   - Zrozum przepływ pracy wdrożeniowego
   - Praktykuj zarządzanie środowiskiem

2. **Spróbuj strony statycznej**
   - Poznaj różne opcje hostingu
   - Naucz się integracji CDN
   - Zrozum konfigurację DNS

3. **Przejdź do aplikacji kontenerowej**
   - Naucz się podstaw konteneryzacji
   - Zrozum koncepcje skalowania
   - Praktykuj z Dockerem

4. **Dodaj integrację z bazą danych**
   - Naucz się tworzenia baz danych
   - Zrozum ciągi połączeń
   - Praktykuj zarządzanie sekretami

5. **Eksploruj funkcje bezserwerowe**
   - Zrozum architekturę zdarzeniową
   - Naucz się wyzwalaczy i powiązań
   - Praktykuj z API

6. **Buduj mikrousługi**
   - Naucz się komunikacji między usługami
   - Zrozum systemy rozproszone
   - Praktykuj złożone wdrożenia

## 🔍 Znajdowanie odpowiedniego przykładu

### Według stosu technologicznego
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontenery**: Python Flask Container App, Java Microservices
- **Bazy danych**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Systemy wieloagentowe**: **Retail Multi-Agent Solution**
- **Produkcja korporacyjna**: **Retail Multi-Agent Solution**

### Według wzorca architektury
- **Monolityczne**: Node.js Express Todo, C# Web API + SQL
- **Statyczne + bezserwerowe**: React SPA + Functions, Python Functions + SPA
- **Mikrousługi**: Java Spring Boot Microservices
- **Konteneryzowane**: Python Flask Container App
- **Zasilane AI**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architektura wieloagentowa**: **Retail Multi-Agent Solution**
- **Wielousługowe korporacyjne**: **Retail Multi-Agent Solution**

### Według poziomu trudności
- **Początkujący**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Średniozaawansowany**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Zaawansowany**: ML Pipeline
- **Gotowy do produkcji korporacyjnej**: **Retail Multi-Agent Solution** (Kompletny system wieloagentowy z wdrożeniem szablonu ARM)

## 📚 Dodatkowe zasoby

### Linki do dokumentacji
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Szablony AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Przykłady społecznościowe
- [Szablony AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Szablony Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplikacja Todo z C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplikacja Todo z Pythonem i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikacja Todo z Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikacja Webowa React z API w C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Javą](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepsze Praktyki
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Przykłady do Współtworzenia

Masz przydatny przykład, którym chcesz się podzielić? Zapraszamy do współtworzenia!

### Wytyczne dotyczące przesyłania
1. Przestrzegaj ustalonej struktury katalogów
2. Dołącz szczegółowy plik README.md
3. Dodaj komentarze do plików konfiguracyjnych
4. Dokładnie przetestuj przed przesłaniem
5. Uwzględnij szacunkowe koszty i wymagania wstępne

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

**Kolejne Kroki**: 
- Wybierz przykład odpowiadający Twojemu poziomowi umiejętności
- Postępuj zgodnie z instrukcjami konfiguracji w pliku README danego przykładu
- Eksperymentuj z dostosowaniami
- Podziel się swoimi doświadczeniami ze społecznością

---

**Nawigacja**
- **Poprzednia Lekcja**: [Przewodnik do Nauki](../resources/study-guide.md)
- **Powrót do**: [Głównego README](../README.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.