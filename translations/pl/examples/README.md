<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:10:47+00:00",
  "source_file": "examples/README.md",
  "language_code": "pl"
}
-->
# Przykłady - Praktyczne szablony i konfiguracje AZD

## Wprowadzenie

Ten katalog zawiera praktyczne przykłady, szablony i scenariusze z życia wzięte, które pomogą Ci nauczyć się Azure Developer CLI poprzez praktyczne ćwiczenia. Każdy przykład zawiera kompletny kod, szablony infrastruktury oraz szczegółowe instrukcje dla różnych architektur aplikacji i wzorców wdrożeniowych.

## Cele nauki

Pracując z tymi przykładami, nauczysz się:
- Praktykować przepływy pracy Azure Developer CLI w realistycznych scenariuszach aplikacji
- Rozumieć różne architektury aplikacji i ich implementacje w azd
- Opanować wzorce Infrastructure as Code dla różnych usług Azure
- Stosować zarządzanie konfiguracją i strategie wdrożeń specyficzne dla środowiska
- Implementować wzorce monitorowania, bezpieczeństwa i skalowania w praktycznych kontekstach
- Zdobywać doświadczenie w rozwiązywaniu problemów i debugowaniu rzeczywistych scenariuszy wdrożeniowych

## Efekty nauki

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
- **README.md** - Szczegółowe instrukcje dotyczące konfiguracji i dostosowywania
- **azure.yaml** - Konfiguracja AZD z komentarzami
- **infra/** - Szablony Bicep z wyjaśnieniami parametrów
- **src/** - Przykładowy kod aplikacji
- **scripts/** - Skrypty pomocnicze do typowych zadań

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
**Złożoność**: Początkujący  
**Koncepcje**: Podstawowe wdrożenie, REST API, integracja z bazą NoSQL

### Strona statyczna - React SPA
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Złożoność**: Początkujący  
**Koncepcje**: Hosting statyczny, backend bezserwerowy, nowoczesny rozwój webowy

### Aplikacja kontenerowa - Python Flask
**Technologie**: Python Flask, Docker, Container Apps, Container Registry  
**Złożoność**: Początkujący  
**Koncepcje**: Konteneryzacja, architektura mikrousług, rozwój API

### Aplikacja bazodanowa - C# z Azure SQL
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Entity Framework, połączenia z bazą danych, rozwój API webowego

### Funkcja bezserwerowa - Python Azure Functions
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Architektura zdarzeniowa, obliczenia bezserwerowe, rozwój full-stack

### Mikrousługi - Java Spring Boot
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Złożoność**: Średniozaawansowany  
**Koncepcje**: Komunikacja mikrousług, systemy rozproszone, wzorce korporacyjne

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
- Konfiguracje środowiska stagingowego
- Konfiguracje gotowe do produkcji
- Wdrożenia wieloregionowe

### Moduły Bicep
- Komponenty infrastruktury wielokrotnego użytku
- Wzorce zasobów wspólnych
- Szablony zabezpieczone
- Konfiguracje zoptymalizowane kosztowo

### Skrypty pomocnicze
- Automatyzacja konfiguracji środowiska
- Skrypty migracji baz danych
- Narzędzia walidacji wdrożeń
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
   - Zmień zmienne środowiskowe

3. **Testuj dokładnie**
   - Najpierw wdrażaj w środowisku deweloperskim
   - Waliduj funkcjonalność
   - Testuj skalowanie i wydajność

4. **Przegląd bezpieczeństwa**
   - Przejrzyj kontrolę dostępu
   - Zaimplementuj zarządzanie sekretami
   - Włącz monitorowanie i alerty

## 📊 Macierz porównawcza

| Przykład | Usługi | Baza danych | Autoryzacja | Monitorowanie | Złożoność |
|----------|--------|-------------|-------------|---------------|-----------|
| Node.js Express Todo | 2 | ✅ | Podstawowa | Podstawowa | ⭐ |
| React SPA + Functions | 3 | ✅ | Podstawowa | Pełna | ⭐ |
| Python Flask Container | 2 | ❌ | Podstawowa | Pełna | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pełna | Pełna | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pełna | Pełna | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Pełna | Pełna | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Pełna | Pełna | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Podstawowa | Pełna | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pełna | Pełna | ⭐⭐⭐⭐ |

## 🎓 Ścieżka nauki

### Zalecana progresja

1. **Rozpocznij od prostej aplikacji webowej**
   - Poznaj podstawowe koncepcje AZD
   - Zrozum przepływ pracy wdrożeniowego
   - Ćwicz zarządzanie środowiskiem

2. **Spróbuj strony statycznej**
   - Eksploruj różne opcje hostingu
   - Poznaj integrację CDN
   - Zrozum konfigurację DNS

3. **Przejdź do aplikacji kontenerowej**
   - Poznaj podstawy konteneryzacji
   - Zrozum koncepcje skalowania
   - Ćwicz z Dockerem

4. **Dodaj integrację z bazą danych**
   - Naucz się tworzenia baz danych
   - Zrozum ciągi połączeń
   - Ćwicz zarządzanie sekretami

5. **Eksploruj funkcje bezserwerowe**
   - Zrozum architekturę zdarzeniową
   - Poznaj wyzwalacze i powiązania
   - Ćwicz z API

6. **Buduj mikrousługi**
   - Naucz się komunikacji usług
   - Zrozum systemy rozproszone
   - Ćwicz złożone wdrożenia

## 🔍 Wybór odpowiedniego przykładu

### Według stosu technologicznego
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontenery**: Python Flask Container App, Java Microservices
- **Bazy danych**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Według wzorca architektury
- **Monolityczne**: Node.js Express Todo, C# Web API + SQL
- **Statyczne + bezserwerowe**: React SPA + Functions, Python Functions + SPA
- **Mikrousługi**: Java Spring Boot Microservices
- **Konteneryzowane**: Python Flask Container App
- **Zasilane AI**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Według poziomu złożoności
- **Początkujący**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Średniozaawansowany**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Zaawansowany**: ML Pipeline

## 📚 Dodatkowe zasoby

### Linki do dokumentacji
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Przykłady społeczności
- [Szablony AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Szablony Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo App z C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App z Pythonem i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App z Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App z API w C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepsze praktyki
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Wkład w przykłady

Masz przydatny przykład do udostępnienia? Zapraszamy do współtworzenia!

### Wytyczne dotyczące zgłoszeń
1. Przestrzegaj ustalonej struktury katalogu
2. Dołącz kompleksowy README.md
3. Dodaj komentarze do plików konfiguracyjnych
4. Przetestuj dokładnie przed zgłoszeniem
5. Dołącz szacunki kosztów i wymagania wstępne

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

**Wskazówka**: Zacznij od najprostszego przykładu, który odpowiada Twojemu stosowi technologicznemu, a następnie stopniowo przechodź do bardziej złożonych scenariuszy. Każdy przykład buduje na koncepcjach z poprzednich!

**Kolejne kroki**: 
- Wybierz przykład odpowiadający Twojemu poziomowi umiejętności
- Postępuj zgodnie z instrukcjami konfiguracji w README danego przykładu
- Eksperymentuj z dostosowaniami
- Podziel się swoimi doświadczeniami ze społecznością

---

**Nawigacja**
- **Poprzednia lekcja**: [Przewodnik nauki](../resources/study-guide.md)
- **Powrót do**: [Głównego README](../README.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.