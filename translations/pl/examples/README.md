<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:14:17+00:00",
  "source_file": "examples/README.md",
  "language_code": "pl"
}
-->
# Przykłady - Praktyczne szablony i konfiguracje AZD

## Wprowadzenie

Ten katalog zawiera praktyczne przykłady, szablony i scenariusze z życia wzięte, które pomogą Ci nauczyć się korzystać z Azure Developer CLI poprzez praktyczne ćwiczenia. Każdy przykład zawiera kompletny kod, szablony infrastruktury oraz szczegółowe instrukcje dla różnych architektur aplikacji i wzorców wdrożeniowych.

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
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Przykłady szybkiego startu

### Dla początkujących
1. **[Prosta aplikacja webowa](../../../examples/simple-web-app)** - Wdrażanie podstawowej aplikacji Node.js
2. **[Strona statyczna](../../../examples/static-website)** - Hostowanie statycznej strony na Azure Storage
3. **[Aplikacja kontenerowa](../../../examples/container-app)** - Wdrażanie aplikacji w kontenerze

### Dla średnio zaawansowanych
4. **[Aplikacja z bazą danych](../../../examples/database-app)** - Aplikacja webowa z bazą danych PostgreSQL
5. **[Funkcja bezserwerowa](../../../examples/serverless-function)** - Azure Functions z wyzwalaczami HTTP
6. **[Mikrousługi](../../../examples/microservices)** - Aplikacja wielousługowa z bramą API

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
- **README.md** - Szczegółowe instrukcje dotyczące konfiguracji i dostosowania
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
- Ekonomiczne środowiska deweloperskie

#### **Zaawansowane scenariusze**
- Architektury wielousługowe
- Złożone konfiguracje sieciowe
- Wzorce integracji z bazami danych
- Implementacje bezpieczeństwa i zgodności

#### **Wzorce gotowe do produkcji**
- Konfiguracje wysokiej dostępności
- Monitorowanie i obserwowalność
- Integracja CI/CD
- Plany odzyskiwania po awarii

## 📖 Opisy przykładów

### Prosta aplikacja webowa
**Technologie**: Node.js, App Service, Application Insights  
**Złożoność**: Początkujący  
**Koncepcje**: Podstawowe wdrożenie, zmienne środowiskowe, kontrole stanu

### Strona statyczna
**Technologie**: HTML/CSS/JS, Storage Account, CDN  
**Złożoność**: Początkujący  
**Koncepcje**: Hostowanie statyczne, integracja CDN, niestandardowe domeny

### Aplikacja kontenerowa
**Technologie**: Docker, Container Apps, Container Registry  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Konteneryzacja, skalowanie, konfiguracja dostępu

### Aplikacja z bazą danych
**Technologie**: Python Flask, PostgreSQL, App Service  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Połączenia z bazą danych, zarządzanie sekretami, migracje

### Funkcja bezserwerowa
**Technologie**: Azure Functions, Cosmos DB, API Management  
**Złożoność**: Średnio zaawansowany  
**Koncepcje**: Architektura oparta na zdarzeniach, powiązania, zarządzanie API

### Mikrousługi
**Technologie**: Wielousługowe, Service Bus, API Gateway  
**Złożoność**: Zaawansowany  
**Koncepcje**: Komunikacja między usługami, kolejkowanie wiadomości, równoważenie obciążenia

## 🛠 Przykłady konfiguracji

Katalog `configurations/` zawiera komponenty wielokrotnego użytku:

### Konfiguracje środowiskowe
- Ustawienia środowiska deweloperskiego
- Konfiguracje środowiska testowego
- Konfiguracje gotowe do produkcji
- Wdrożenia w wielu regionach

### Moduły Bicep
- Komponenty infrastruktury wielokrotnego użytku
- Wzorce zasobów wspólnych
- Szablony zabezpieczone
- Konfiguracje zoptymalizowane pod kątem kosztów

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
| Prosta aplikacja webowa | 1 | ❌ | Podstawowa | Podstawowe | ⭐ |
| Strona statyczna | 1 | ❌ | ❌ | Podstawowe | ⭐ |
| Aplikacja kontenerowa | 1 | ❌ | Podstawowa | Pełne | ⭐⭐ |
| Aplikacja z bazą danych | 2 | ✅ | Pełne | Pełne | ⭐⭐⭐ |
| Funkcja bezserwerowa | 3 | ✅ | Pełne | Pełne | ⭐⭐⭐ |
| Mikrousługi | 5+ | ✅ | Pełne | Pełne | ⭐⭐⭐⭐ |

## 🎓 Ścieżka nauki

### Zalecana progresja

1. **Rozpocznij od Prostej aplikacji webowej**
   - Poznaj podstawowe koncepcje AZD
   - Zrozum przepływ pracy wdrożeniowego
   - Ćwicz zarządzanie środowiskiem

2. **Wypróbuj Stronę statyczną**
   - Eksploruj różne opcje hostingu
   - Naucz się integracji CDN
   - Zrozum konfigurację DNS

3. **Przejdź do Aplikacji kontenerowej**
   - Poznaj podstawy konteneryzacji
   - Zrozum koncepcje skalowania
   - Ćwicz z Dockerem

4. **Dodaj integrację z bazą danych**
   - Naucz się tworzenia baz danych
   - Zrozum ciągi połączeń
   - Ćwicz zarządzanie sekretami

5. **Eksploruj Funkcje bezserwerowe**
   - Zrozum architekturę opartą na zdarzeniach
   - Naucz się wyzwalaczy i powiązań
   - Ćwicz z API

6. **Buduj Mikrousługi**
   - Naucz się komunikacji między usługami
   - Zrozum systemy rozproszone
   - Ćwicz złożone wdrożenia

## 🔍 Wybór odpowiedniego przykładu

### Według stosu technologicznego
- **Node.js**: Prosta aplikacja webowa, Mikrousługi
- **Python**: Aplikacja z bazą danych, Funkcja bezserwerowa
- **Strony statyczne**: Strona statyczna
- **Kontenery**: Aplikacja kontenerowa, Mikrousługi
- **Bazy danych**: Aplikacja z bazą danych, Funkcja bezserwerowa

### Według wzorca architektury
- **Monolityczne**: Prosta aplikacja webowa, Aplikacja z bazą danych
- **Statyczne**: Strona statyczna
- **Mikrousługi**: Przykład Mikrousług
- **Bezserwerowe**: Funkcja bezserwerowa
- **Hybrydowe**: Aplikacja kontenerowa

### Według poziomu złożoności
- **Początkujący**: Prosta aplikacja webowa, Strona statyczna
- **Średnio zaawansowany**: Aplikacja kontenerowa, Aplikacja z bazą danych, Funkcja bezserwerowa  
- **Zaawansowany**: Mikrousługi

## 📚 Dodatkowe zasoby

### Linki do dokumentacji
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Przykłady społecznościowe
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### Najlepsze praktyki
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Wkład w przykłady

Masz przydatny przykład do udostępnienia? Zapraszamy do współpracy!

### Wytyczne dotyczące zgłoszeń
1. Przestrzegaj ustalonej struktury katalogu
2. Dołącz kompleksowy README.md
3. Dodaj komentarze do plików konfiguracyjnych
4. Przetestuj dokładnie przed zgłoszeniem
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

**Wskazówka**: Zacznij od najprostszego przykładu, który odpowiada Twojemu stosowi technologicznemu, a następnie stopniowo przechodź do bardziej złożonych scenariuszy. Każdy przykład buduje na koncepcjach z poprzednich!

**Następne kroki**: 
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
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.