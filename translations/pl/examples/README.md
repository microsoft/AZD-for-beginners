<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T17:34:55+00:00",
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
1. **[Prosta aplikacja webowa](../../../examples/simple-web-app)** - Wdrażanie podstawowej aplikacji webowej Node.js
2. **[Strona statyczna](../../../examples/static-website)** - Hostowanie strony statycznej na Azure Storage
3. **[Aplikacja kontenerowa](../../../examples/container-app)** - Wdrażanie aplikacji kontenerowej

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
- **README.md** - Szczegółowe instrukcje dotyczące konfiguracji i dostosowywania
- **azure.yaml** - Konfiguracja AZD z komentarzami
- **infra/** - Szablony Bicep z wyjaśnieniami parametrów
- **src/** - Przykładowy kod aplikacji
- **scripts/** - Skrypty pomocnicze do typowych zadań

## 🎯 Cele nauki

### Kategorie przykładów

#### **Podstawowe wdrożenia**
- Aplikacje jednousługowe
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
**Koncepcje**: Architektura sterowana zdarzeniami, powiązania, zarządzanie API

### Mikrousługi
**Technologie**: Wiele usług, Service Bus, API Gateway  
**Złożoność**: Zaawansowany  
**Koncepcje**: Komunikacja między usługami, kolejkowanie wiadomości, równoważenie obciążenia

## 🛠 Przykłady konfiguracji

Katalog `configurations/` zawiera komponenty wielokrotnego użytku:

### Konfiguracje środowiskowe
- Ustawienia środowiska deweloperskiego
- Konfiguracje środowiska testowego
- Konfiguracje gotowe do produkcji
- Wdrożenia wieloregionowe

### Moduły Bicep
- Komponenty infrastruktury wielokrotnego użytku
- Wzorce zasobów wspólnych
- Szablony zabezpieczone
- Konfiguracje zoptymalizowane pod kątem kosztów

### Skrypty pomocnicze
- Automatyzacja konfiguracji środowiska
- Skrypty migracji bazy danych
- Narzędzia walidacji wdrożenia
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
   - Implementuj zarządzanie sekretami
   - Włącz monitorowanie i alerty

## 📊 Macierz porównawcza

| Przykład | Usługi | Baza danych | Autoryzacja | Monitorowanie | Złożoność |
|----------|--------|-------------|-------------|---------------|-----------|
| Prosta aplikacja webowa | 1 | ❌ | Podstawowa | Podstawowa | ⭐ |
| Strona statyczna | 1 | ❌ | ❌ | Podstawowa | ⭐ |
| Aplikacja kontenerowa | 1 | ❌ | Podstawowa | Pełna | ⭐⭐ |
| Aplikacja z bazą danych | 2 | ✅ | Pełna | Pełna | ⭐⭐⭐ |
| Funkcja bezserwerowa | 3 | ✅ | Pełna | Pełna | ⭐⭐⭐ |
| Mikrousługi | 5+ | ✅ | Pełna | Pełna | ⭐⭐⭐⭐ |

## 🎓 Ścieżka nauki

### Zalecana progresja

1. **Zacznij od Prostej aplikacji webowej**
   - Poznaj podstawowe koncepcje AZD
   - Zrozum przepływ wdrożenia
   - Ćwicz zarządzanie środowiskiem

2. **Spróbuj Strony statycznej**
   - Eksploruj różne opcje hostowania
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
   - Zrozum architekturę sterowaną zdarzeniami
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
- [Specyfikacja szablonów AZD](https://aka.ms/azd/templates)
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Przykłady społecznościowe
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Galeria szablonów AZD](https://azure.github.io/awesome-azd/)

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

**Porada**: Zacznij od najprostszego przykładu, który odpowiada Twojemu stosowi technologicznemu, a następnie stopniowo przechodź do bardziej złożonych scenariuszy. Każdy przykład buduje na koncepcjach z poprzednich!

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
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby zapewnić poprawność tłumaczenia, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za autorytatywne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.