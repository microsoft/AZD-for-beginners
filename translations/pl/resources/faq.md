<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T17:56:31+00:00",
  "source_file": "resources/faq.md",
  "language_code": "pl"
}
-->
# Najczęściej Zadawane Pytania (FAQ)

## Wprowadzenie

Ten obszerny FAQ zawiera odpowiedzi na najczęściej zadawane pytania dotyczące Azure Developer CLI (azd) i wdrożeń w Azure. Znajdź szybkie rozwiązania typowych problemów, zrozum najlepsze praktyki i uzyskaj wyjaśnienia dotyczące koncepcji oraz przepływów pracy azd.

## Cele nauki

Przeglądając ten FAQ, dowiesz się:
- Jak szybko znaleźć odpowiedzi na pytania i problemy związane z Azure Developer CLI
- Jak zrozumieć kluczowe pojęcia i terminologię dzięki praktycznemu formatowi Q&A
- Jak rozwiązywać problemy związane z typowymi błędami i scenariuszami
- Jak stosować najlepsze praktyki dzięki odpowiedziom na pytania dotyczące optymalizacji
- Jak odkrywać zaawansowane funkcje i możliwości dzięki pytaniom na poziomie eksperckim
- Jak efektywnie korzystać z porad dotyczących kosztów, bezpieczeństwa i strategii wdrożeniowych

## Efekty nauki

Regularnie korzystając z tego FAQ, będziesz w stanie:
- Samodzielnie rozwiązywać typowe problemy z Azure Developer CLI, korzystając z podanych rozwiązań
- Podejmować świadome decyzje dotyczące strategii i konfiguracji wdrożeń
- Zrozumieć relacje między azd a innymi narzędziami i usługami Azure
- Stosować najlepsze praktyki oparte na doświadczeniach społeczności i rekomendacjach ekspertów
- Skutecznie rozwiązywać problemy związane z uwierzytelnianiem, wdrożeniami i konfiguracją
- Optymalizować koszty i wydajność dzięki wskazówkom zawartym w FAQ

## Spis treści

- [Pierwsze kroki](../../../resources)
- [Uwierzytelnianie i dostęp](../../../resources)
- [Szablony i projekty](../../../resources)
- [Wdrożenia i infrastruktura](../../../resources)
- [Konfiguracja i środowiska](../../../resources)
- [Rozwiązywanie problemów](../../../resources)
- [Koszty i rozliczenia](../../../resources)
- [Najlepsze praktyki](../../../resources)
- [Zaawansowane tematy](../../../resources)

---

## Pierwsze kroki

### P: Czym jest Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) to narzędzie wiersza poleceń skoncentrowane na programistach, które przyspiesza proces przenoszenia aplikacji z lokalnego środowiska programistycznego do Azure. Zapewnia najlepsze praktyki dzięki szablonom i wspiera cały cykl życia wdrożenia.

### P: Czym różni się azd od Azure CLI?
**O**: 
- **Azure CLI**: Narzędzie ogólnego przeznaczenia do zarządzania zasobami Azure
- **azd**: Narzędzie skoncentrowane na programistach, wspierające przepływy pracy związane z wdrożeniami aplikacji
- azd korzysta z Azure CLI wewnętrznie, ale oferuje wyższy poziom abstrakcji dla typowych scenariuszy programistycznych
- azd zawiera szablony, zarządzanie środowiskami i automatyzację wdrożeń

### P: Czy muszę mieć zainstalowane Azure CLI, aby korzystać z azd?
**O**: Tak, azd wymaga Azure CLI do uwierzytelniania i niektórych operacji. Najpierw zainstaluj Azure CLI, a następnie azd.

### P: Jakie języki programowania obsługuje azd?
**O**: azd jest niezależny od języka. Obsługuje:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Strony statyczne
- Aplikacje konteneryzowane

### P: Czy mogę używać azd z istniejącymi projektami?
**O**: Tak! Możesz:
1. Użyć `azd init`, aby dodać konfigurację azd do istniejących projektów
2. Dostosować istniejące projekty do struktury szablonów azd
3. Tworzyć własne szablony na podstawie istniejącej architektury

---

## Uwierzytelnianie i dostęp

### P: Jak uwierzytelnić się w Azure za pomocą azd?
**O**: Użyj `azd auth login`, który otworzy okno przeglądarki do uwierzytelnienia w Azure. W scenariuszach CI/CD używaj zasad dostępu lub zarządzanych tożsamości.

### P: Czy mogę używać azd z wieloma subskrypcjami Azure?
**O**: Tak. Użyj `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, aby określić, której subskrypcji używać dla każdego środowiska.

### P: Jakie uprawnienia są potrzebne do wdrożenia za pomocą azd?
**O**: Zazwyczaj potrzebujesz:
- Roli **Contributor** na grupie zasobów lub subskrypcji
- Roli **User Access Administrator**, jeśli wdrażasz zasoby wymagające przypisania ról
- Specyficzne uprawnienia zależą od szablonu i wdrażanych zasobów

### P: Czy mogę używać azd w potokach CI/CD?
**O**: Oczywiście! azd jest zaprojektowany do integracji z CI/CD. Używaj zasad dostępu do uwierzytelniania i ustaw zmienne środowiskowe do konfiguracji.

### P: Jak obsłużyć uwierzytelnianie w GitHub Actions?
**O**: Użyj akcji Azure Login z poświadczeniami zasad dostępu:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Szablony i projekty

### P: Gdzie mogę znaleźć szablony azd?
**O**: 
- Oficjalne szablony: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Szablony społeczności: Wyszukaj na GitHub "azd-template"
- Użyj `azd template list`, aby przeglądać dostępne szablony

### P: Jak stworzyć własny szablon?
**O**: 
1. Rozpocznij od istniejącej struktury szablonu
2. Zmodyfikuj `azure.yaml`, pliki infrastruktury i kod aplikacji
3. Przetestuj dokładnie za pomocą `azd up`
4. Opublikuj na GitHub z odpowiednimi tagami

### P: Czy mogę używać azd bez szablonu?
**O**: Tak, użyj `azd init` w istniejącym projekcie, aby utworzyć niezbędne pliki konfiguracyjne. Musisz ręcznie skonfigurować `azure.yaml` i pliki infrastruktury.

### P: Jaka jest różnica między oficjalnymi a społecznościowymi szablonami?
**O**: 
- **Oficjalne szablony**: Utrzymywane przez Microsoft, regularnie aktualizowane, z obszerną dokumentacją
- **Szablony społeczności**: Tworzone przez programistów, mogą mieć specjalistyczne zastosowania, różną jakość i poziom utrzymania

### P: Jak zaktualizować szablon w moim projekcie?
**O**: Szablony nie są automatycznie aktualizowane. Możesz:
1. Ręcznie porównać i scalić zmiany z szablonu źródłowego
2. Rozpocząć od nowa za pomocą `azd init` z zaktualizowanym szablonem
3. Wybrać konkretne ulepszenia z zaktualizowanych szablonów

---

## Wdrożenia i infrastruktura

### P: Jakie usługi Azure może wdrażać azd?
**O**: azd może wdrażać dowolne usługi Azure za pomocą szablonów Bicep/ARM, w tym:
- App Services, Container Apps, Functions
- Bazy danych (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Zasoby sieciowe, bezpieczeństwa i monitorowania

### P: Czy mogę wdrażać do wielu regionów?
**O**: Tak, skonfiguruj wiele regionów w swoich szablonach Bicep i ustaw odpowiednio parametr lokalizacji dla każdego środowiska.

### P: Jak obsłużyć migracje schematów bazy danych?
**O**: Użyj hooków wdrożeniowych w `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Czy mogę wdrażać tylko infrastrukturę bez aplikacji?
**O**: Tak, użyj `azd provision`, aby wdrożyć tylko komponenty infrastruktury zdefiniowane w szablonach.

### P: Jak wdrożyć do istniejących zasobów Azure?
**O**: To jest skomplikowane i nie jest bezpośrednio wspierane. Możesz:
1. Importować istniejące zasoby do swoich szablonów Bicep
2. Używać odniesień do istniejących zasobów w szablonach
3. Modyfikować szablony, aby warunkowo tworzyć lub odnosić się do zasobów

### P: Czy mogę używać Terraform zamiast Bicep?
**O**: Obecnie azd głównie wspiera szablony Bicep/ARM. Oficjalne wsparcie dla Terraform nie jest dostępne, choć mogą istnieć rozwiązania społecznościowe.

---

## Konfiguracja i środowiska

### P: Jak zarządzać różnymi środowiskami (dev, staging, prod)?
**O**: Utwórz oddzielne środowiska za pomocą `azd env new <environment-name>` i skonfiguruj różne ustawienia dla każdego:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Gdzie przechowywane są konfiguracje środowisk?
**O**: W folderze `.azure` w katalogu projektu. Każde środowisko ma własny folder z plikami konfiguracyjnymi.

### P: Jak ustawić konfigurację specyficzną dla środowiska?
**O**: Użyj `azd env set`, aby skonfigurować zmienne środowiskowe:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Czy mogę udostępniać konfiguracje środowisk członkom zespołu?
**O**: Folder `.azure` zawiera poufne informacje i nie powinien być dodawany do kontroli wersji. Zamiast tego:
1. Udokumentuj wymagane zmienne środowiskowe
2. Użyj skryptów wdrożeniowych do konfiguracji środowisk
3. Użyj Azure Key Vault do przechowywania poufnych danych

### P: Jak nadpisać domyślne ustawienia szablonu?
**O**: Ustaw zmienne środowiskowe odpowiadające parametrom szablonu:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Rozwiązywanie problemów

### P: Dlaczego `azd up` nie działa?
**O**: Typowe przyczyny:
1. **Problemy z uwierzytelnianiem**: Uruchom `azd auth login`
2. **Niewystarczające uprawnienia**: Sprawdź przypisania ról w Azure
3. **Konflikty nazw zasobów**: Zmień AZURE_ENV_NAME
4. **Problemy z limitami/pojemnością**: Sprawdź dostępność regionalną
5. **Błędy w szablonie**: Zweryfikuj szablony Bicep

### P: Jak debugować błędy wdrożenia?
**O**: 
1. Użyj `azd deploy --debug` dla szczegółowego wyjścia
2. Sprawdź historię wdrożeń w portalu Azure
3. Przejrzyj Dziennik Aktywności w portalu Azure
4. Użyj `azd show`, aby wyświetlić aktualny stan środowiska

### P: Dlaczego moje zmienne środowiskowe nie działają?
**O**: Sprawdź:
1. Czy nazwy zmiennych dokładnie odpowiadają parametrom szablonu
2. Czy wartości są poprawnie cytowane, jeśli zawierają spacje
3. Czy wybrane jest odpowiednie środowisko: `azd env select <environment>`
4. Czy zmienne są ustawione w odpowiednim środowisku

### P: Jak wyczyścić nieudane wdrożenia?
**O**: 
```bash
azd down --force --purge
```
To usuwa wszystkie zasoby i konfigurację środowiska.

### P: Dlaczego moja aplikacja nie jest dostępna po wdrożeniu?
**O**: Sprawdź:
1. Czy wdrożenie zakończyło się sukcesem
2. Czy aplikacja działa (sprawdź logi w portalu Azure)
3. Czy grupy zabezpieczeń sieciowych pozwalają na ruch
4. Czy DNS/domeny niestandardowe są poprawnie skonfigurowane

---

## Koszty i rozliczenia

### P: Ile kosztują wdrożenia azd?
**O**: Koszty zależą od:
- Wdrażanych usług Azure
- Wybranych poziomów usług/SKU
- Różnic cenowych regionalnych
- Wzorców użytkowania

Użyj [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) do oszacowania kosztów.

### P: Jak kontrolować koszty w wdrożeniach azd?
**O**: 
1. Używaj niższych poziomów SKU dla środowisk deweloperskich
2. Ustaw budżety i alerty w Azure
3. Używaj `azd down`, aby usuwać zasoby, gdy nie są potrzebne
4. Wybieraj odpowiednie regiony (koszty różnią się w zależności od lokalizacji)
5. Korzystaj z narzędzi Azure Cost Management

### P: Czy są dostępne opcje darmowego poziomu dla szablonów azd?
**O**: Wiele usług Azure oferuje darmowe poziomy:
- App Service: Dostępny darmowy poziom
- Azure Functions: 1M darmowych wywołań miesięcznie
- Cosmos DB: Darmowy poziom z 400 RU/s
- Application Insights: Pierwsze 5GB/miesiąc za darmo

Skonfiguruj szablony, aby korzystać z darmowych poziomów, gdzie to możliwe.

### P: Jak oszacować koszty przed wdrożeniem?
**O**: 
1. Przejrzyj `main.bicep` szablonu, aby zobaczyć, jakie zasoby są tworzone
2. Użyj Azure Pricing Calculator z konkretnymi SKU
3. Wdróż do środowiska deweloperskiego, aby monitorować rzeczywiste koszty
4. Korzystaj z Azure Cost Management do szczegółowej analizy kosztów

---

## Najlepsze praktyki

### P: Jakie są najlepsze praktyki dotyczące struktury projektu azd?
**O**: 
1. Oddziel kod aplikacji od infrastruktury
2. Używaj znaczących nazw usług w `azure.yaml`
3. Implementuj odpowiednie obsługi błędów w skryptach budowy
4. Używaj konfiguracji specyficznej dla środowiska
5. Dołącz obszerną dokumentację

### P: Jak zorganizować wiele usług w azd?
**O**: Użyj zalecanej struktury:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### P: Czy powinienem dodawać folder `.azure` do kontroli wersji?
**O**: **Nie!** Folder `.azure` zawiera poufne informacje. Dodaj go do `.gitignore`:
```gitignore
.azure/
```

### P: Jak obsłużyć tajemnice i poufną konfigurację?
**O**: 
1. Używaj Azure Key Vault do przechowywania tajemnic
2. Odnoś się do tajemnic Key Vault w konfiguracji aplikacji
3. Nigdy nie dodawaj tajemnic do kontroli wersji
4. Używaj zarządzanych tożsamości do uwierzytelniania między usługami

### P: Jakie podejście do CI/CD z azd jest zalecane?
**O**: 
1. Używaj oddzielnych środowisk dla każdego etapu (dev/staging/prod)
2. Implementuj automatyczne testy przed wdrożeniem
3. Używaj zasad dostępu do uwierzytelniania
4. Przechowuj poufną konfigurację w tajemnicach/pipeline variables
5. Implementuj bramki zatwierdzeń dla wdrożeń produkcyjnych

---

## Zaawansowane tematy

### P: Czy mogę rozszerzyć azd o własne funkcjonalności?
**O**: Tak, za pomocą hooków wdrożeniowych w `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Jak zintegrować azd z istniejącymi procesami DevOps?
**O**: 
1. Używaj poleceń azd w istniejących skryptach potoków
2. Standaryzuj szablony azd w zespołach
3. Integruj z istniejącym monitorowaniem i alertami
4. Używaj JSON-owego wyjścia azd do integracji z potokami

### P: Czy mogę używać azd z Azure DevOps?
**O**: Tak, azd
1. Przeanalizuj obecną architekturę wdrożenia  
2. Utwórz równoważne szablony Bicep  
3. Skonfiguruj `azure.yaml`, aby dopasować się do obecnych usług  
4. Przeprowadź dokładne testy w środowisku deweloperskim  
5. Stopniowo migruj środowiska  

---

## Nadal masz pytania?

### **Najpierw poszukaj**
- Sprawdź [oficjalną dokumentację](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Przeszukaj [problemy na GitHubie](https://github.com/Azure/azure-dev/issues) w poszukiwaniu podobnych problemów  

### **Uzyskaj pomoc**
- [Dyskusje na GitHubie](https://github.com/Azure/azure-dev/discussions) - Wsparcie społeczności  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Pytania techniczne  
- [Azure Discord](https://discord.gg/azure) - Czat społeczności w czasie rzeczywistym  

### **Zgłaszanie problemów**
- [Problemy na GitHubie](https://github.com/Azure/azure-dev/issues/new) - Zgłaszanie błędów i propozycje nowych funkcji  
- Dołącz odpowiednie logi, komunikaty o błędach i kroki reprodukcji  

### **Dowiedz się więcej**
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Ten FAQ jest regularnie aktualizowany. Ostatnia aktualizacja: 9 września 2025*  

---

**Nawigacja**  
- **Poprzednia lekcja**: [Słowniczek](glossary.md)  
- **Następna lekcja**: [Przewodnik do nauki](study-guide.md)  

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.