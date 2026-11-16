# Najczęściej zadawane pytania (FAQ)

**Uzyskaj pomoc według rozdziału**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **🚆 Problemy z instalacją**: [Rozdział 1: Instalacja i konfiguracja](../docs/chapter-01-foundation/installation.md)
- **🤖 Pytania o AI**: [Rozdział 2: Rozwój z naciskiem na AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Rozwiązywanie problemów**: [Rozdział 7: Rozwiązywanie problemów i debugowanie](../docs/chapter-07-troubleshooting/common-issues.md)

## Wprowadzenie

Ten obszerny FAQ zawiera odpowiedzi na najczęściej zadawane pytania dotyczące Azure Developer CLI (azd) i wdrożeń w Azure. Znajdź szybkie rozwiązania typowych problemów, zrozum najlepsze praktyki i uzyskaj wyjaśnienia dotyczące koncepcji i procesów azd.

## Cele nauki

Przeglądając ten FAQ, będziesz mógł:
- Znaleźć szybkie odpowiedzi na typowe pytania i problemy związane z Azure Developer CLI
- Zrozumieć kluczowe pojęcia i terminologię dzięki praktycznemu formatowi pytań i odpowiedzi
- Skorzystać z rozwiązań problemów z często występującymi problemami i błędami
- Poznać najlepsze praktyki dzięki często zadawanym pytaniom dotyczącym optymalizacji
- Odkryć zaawansowane funkcje i możliwości dzięki pytaniom na poziomie eksperckim
- Sprawnie odnaleźć wskazówki dotyczące kosztów, bezpieczeństwa i strategii wdrażania

## Rezultaty nauki

Regularnie korzystając z tego FAQ, będziesz w stanie:
- Samodzielnie rozwiązywać typowe problemy z Azure Developer CLI korzystając z podanych rozwiązań
- Podejmować świadome decyzje dotyczące strategii i konfiguracji wdrożeń
- Rozumieć powiązania między azd a innymi narzędziami i usługami Azure
- Stosować najlepsze praktyki bazujące na doświadczeniach społeczności i rekomendacjach ekspertów
- Skutecznie diagnozować problemy z uwierzytelnianiem, wdrażaniem i konfiguracją
- Optymalizować koszty i wydajność, korzystając z wglądu i rekomendacji FAQ

## Spis treści

- [Pierwsze kroki](#getting-started)
- [Uwierzytelnianie i dostęp](#authentication--access)
- [Szablony i projekty](#templates--projects)
- [Wdrażanie i infrastruktura](#deployment--infrastructure)
- [Konfiguracja i środowiska](#configuration--environments)
- [Rozwiązywanie problemów](#troubleshooting)
- [Koszty i rozliczenia](#cost--billing)
- [Najlepsze praktyki](#best-practices)
- [Tematy zaawansowane](#advanced-topics)

---

## Pierwsze kroki

### P: Czym jest Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) to narzędzie wiersza poleceń ukierunkowane na programistów, które przyspiesza przeniesienie Twojej aplikacji ze środowiska lokalnego do Azure. Zapewnia najlepsze praktyki za pomocą szablonów i wspomaga cały cykl życia wdrożenia.

### P: Czym azd różni się od Azure CLI?
**O**: 
- **Azure CLI**: Narzędzie ogólnego przeznaczenia do zarządzania zasobami Azure
- **azd**: Narzędzie skupiające się na programistach i przepływach wdrażania aplikacji
- azd posiada własny proces uwierzytelniania i wdrażania; Azure CLI to osobne, uzupełniające narzędzie
- azd zawiera szablony, zarządzanie środowiskami oraz automatyzację wdrożeń

### P: Czy muszę mieć zainstalowany Azure CLI, aby korzystać z azd?
**O**: Nie dla podstawowego przepływu AZD. Uwierzytelniaj się za pomocą `azd auth login`. Azure CLI instaluj osobno, gdy szablon lub ćwiczenie wyraźnie uruchamia komendy `az`.

### P: Jakie języki programowania obsługuje azd?
**O**: azd jest niezależny od języka. Działa z:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statyczne strony internetowe
- Aplikacje konteneryzowane

### P: Czy mogę używać azd z istniejącymi projektami?
**O**: Tak! Możesz:
1. Użyć `azd init`, aby dodać konfigurację azd do istniejących projektów
2. Dostosować istniejące projekty do struktury szablonu azd
3. Tworzyć własne szablony na bazie istniejącej architektury

---

## Uwierzytelnianie i dostęp

### P: Jak się uwierzytelnić w Azure za pomocą azd?
**O**: Użyj `azd auth login`, które otworzy okno przeglądarki do uwierzytelniania w Azure. Dla scenariuszy CI/CD używaj zasad usług lub zarządzanych tożsamości.

### P: Czy mogę używać azd z wieloma subskrypcjami Azure?
**O**: Tak. Użyj `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, aby określić, której subskrypcji używać dla każdego środowiska.

### P: Jakie uprawnienia są potrzebne do wdrażania za pomocą azd?
**O**: Zazwyczaj potrzebujesz:
- roli **Współautora (Contributor)** na grupie zasobów lub subskrypcji
- roli **Administrator dostępu użytkownika**, jeśli wdrażasz zasoby wymagające przypisań ról
- Szczegółowe uprawnienia zależą od szablonu i wdrażanych zasobów

### P: Czy mogę używać azd w pipeline'ach CI/CD?
**O**: Oczywiście! azd jest zaprojektowany do integracji z CI/CD. Używaj zasad usług do uwierzytelniania i ustawiaj zmienne środowiskowe do konfiguracji.

### P: Jak obsługuję uwierzytelnianie w GitHub Actions?
**O**: Preferuj federację tożsamości workload (OIDC), konfigurowaną za pomocą `azd pipeline config`. Generowany workflow instaluje AZD i uwierzytelnia AZD bezpośrednio z federowaną tożsamością. Sam krok `azure/login` nie ustanawia zalogowania AZD. Krok logowania w istniejącym zadaniu wygląda tak:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Zapewnij lub wdrażaj po zalogowaniu, z odpowiednio skonfigurowanym środowiskiem AZD, subskrypcją i lokalizacją. Poświadczenie federowane musi ufać repozytorium/ref workflow lub środowisku GitHub, a role Azure muszą zezwalać na żądane operacje.

---

## Szablony i projekty

### P: Gdzie znajdę szablony azd?
**O**: 
- Oficjalne i społecznościowe szablony: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Szablony społeczności: wyszukaj GitHub pod frazą "azd-template"
- Użyj `azd template list`, aby przeglądać dostępne szablony

### P: Jak stworzyć własny szablon?
**O**: 
1. Zacznij od istniejącej struktury szablonu
2. Modyfikuj `azure.yaml`, pliki infrastruktury oraz kod aplikacji
3. Dokładnie przetestuj za pomocą `azd up`
4. Opublikuj na GitHub z odpowiednimi tagami

### P: Czy mogę używać azd bez szablonu?
**O**: Tak, użyj `azd init` w istniejącym projekcie, aby utworzyć niezbędne pliki konfiguracyjne. Konfigurację `azure.yaml` i pliki infrastruktury trzeba będzie ustawić ręcznie.

### P: Jaka jest różnica między szablonami oficjalnymi a społecznościowymi?
**O**: 
- **Szablony oficjalne**: Utrzymywane przez Microsoft, regularnie aktualizowane, ze szczegółową dokumentacją
- **Szablony społecznościowe**: Tworzone przez programistów, mogą mieć wyspecjalizowane zastosowania, różna jakość i stopień utrzymania

### P: Jak zaktualizować szablon w moim projekcie?
**O**: Szablony nie są aktualizowane automatycznie. Możesz:
1. Ręcznie porównać i scalić zmiany z szablonu źródłowego
2. Zacząć od nowa używając `azd init` z zaktualizowanym szablonem
3. Wybrać konkretne ulepszenia z aktualizowanych szablonów

---

## Wdrażanie i infrastruktura

### P: Jakie usługi Azure można wdrażać za pomocą azd?
**O**: azd może wdrażać dowolną usługę Azure za pomocą szablonów Bicep/ARM, w tym:
- App Services, Container Apps, Functions
- Bazy danych (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Zasoby sieciowe, bezpieczeństwa i monitoringu

### P: Czy mogę wdrażać w wielu regionach?
**O**: Tak, skonfiguruj wiele regionów w swoich szablonach Bicep i ustaw parametr lokalizacji odpowiednio dla każdego środowiska.

### P: Jak obsługiwać migracje schematu bazy danych?
**O**: Użyj hooków wdrożeniowych w `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Czy mogę wdrożyć tylko infrastrukturę bez aplikacji?
**O**: Tak, użyj `azd provision`, aby wdrożyć wyłącznie składniki infrastruktury zdefiniowane w szablonach.

### P: Jak wdrożyć do istniejących zasobów Azure?
**O**: Tak, jeśli szablon to obsługuje. Odwołuj się do istniejących zasobów za pomocą deklaracji `existing` w Bicep lub dokumentowanych parametrów zasobów istniejących w szablonie, i mapuj usługi aplikacji na ich docelowe zasoby. Nie importuje to własności ani nie tworzy automatycznie brakujących uprawnień. Przejrzyj szablon przed wdrożeniem.

### P: Czy mogę używać Terraform zamiast Bicep?
**O**: Tak. AZD obsługuje Terraform i Bicep. Wybierz szablon oparty na Terraform lub skonfiguruj `infra.provider: terraform` w `azure.yaml` wraz z odpowiednimi plikami Terraform i konfiguracją stanu/backendu. Zobacz [workflow Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguracja i środowiska

### P: Jak zarządzać różnymi środowiskami (dev, staging, prod)?
**O**: Twórz oddzielne środowiska za pomocą `azd env new <environment-name>` i konfiguruj różne ustawienia dla każdego:
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

### P: Czy mogę dzielić konfiguracje środowisk między członkami zespołu?
**O**: Folder `.azure` zawiera wrażliwe informacje i nie powinien być dodawany do kontroli wersji. Zamiast tego:
1. Dokumentuj wymagane zmienne środowiskowe
2. Używaj skryptów wdrożeniowych do konfigurowania środowisk
3. Korzystaj z Azure Key Vault dla wrażliwej konfiguracji

### P: Jak nadpisać domyślne wartości szablonu?
**O**: Ustaw zmienne środowiskowe odpowiadające parametrom szablonu:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Tylko zmienne wykorzystywane przez szablon wpływają na wdrożenie. `SKU_NAME` powyżej to przykład niestandardowego wejścia, nie uniwersalna opcja AZD.

---

## Rozwiązywanie problemów

### P: Dlaczego `azd up` zawodzi?
**O**: Typowe przyczyny:
1. **Problemy z uwierzytelnianiem**: Uruchom `azd auth login`
2. **Niewystarczające uprawnienia**: Sprawdź przypisania ról Azure
3. **Konflikty nazw zasobów**: Przejrzyj konfliktujący zasób i dane wejściowe nazewnicze szablonu; gdy potrzebna jest izolacja, utwórz osobne środowisko za pomocą `azd env new`
4. **Problemy z limitem/pojemnością**: Sprawdź dostępność regionalną
5. **Błędy w szablonie**: Zweryfikuj szablony Bicep

### P: Jak debugować błędy wdrożenia?
**O**: 
1. Użyj `azd deploy --debug` dla szczegółowego logowania
2. Sprawdź historię wdrożeń w portalu Azure
3. Przejrzyj Dziennik aktywności w portalu Azure
4. Użyj `azd show`, aby wyświetlić aktualny stan środowiska

### P: Dlaczego moje zmienne środowiskowe nie działają?
**O**: Sprawdź:
1. Nazwy zmiennych dokładnie odpowiadają parametrom szablonu
2. Wartości są właściwie cytowane, jeśli zawierają spacje
3. Środowisko jest wybrane: `azd env select <environment>`
4. Zmienne są ustawione w poprawnym środowisku

### P: Jak sprzątać po nieudanych wdrożeniach?
**O**: 
```bash
azd down
```
Przedtem sprawdź wybrane środowisko i potwierdzenie usunięcia. Usuwa to provisionowane zasoby Azure, a nie lokalną konfigurację środowiska `.azure`. `--purge` dodatkowo wymaga trwałego usunięcia obsługiwanych zasobów miękko usuniętych i może być zablokowane przez ochronę retencji/oczyszczania; nie jest to rutynowy krok odzyskiwania.

### P: Dlaczego moja aplikacja jest niedostępna po wdrożeniu?
**O**: Sprawdź:
1. Wdrożenie zakończyło się powodzeniem
2. Aplikacja działa (sprawdź logi w portalu Azure)
3. Grupy zabezpieczeń sieciowych dopuszczają ruch
4. DNS/domeny niestandardowe są poprawnie skonfigurowane

---

## Koszty i rozliczenia

### P: Ile będą kosztować wdrożenia azd?
**O**: Koszty zależą od:
- wdrożonych usług Azure
- wybranych poziomów usług/SKU
- różnic cen regionalnych
- wzorców użycia

Użyj [Kalkulatora cen Azure](https://azure.microsoft.com/pricing/calculator/) do oszacowań.

### P: Jak kontrolować koszty wdrożeń azd?
**O**: 
1. Używaj niższych poziomów SKU dla środowisk deweloperskich
2. Ustawiaj budżety i alerty w Azure
3. Używaj `azd down` do usuwania zasobów, gdy nie są potrzebne
4. Wybieraj odpowiednie regiony (koszty różnią się lokalizacją)
5. Korzystaj z narzędzi Azure Cost Management

### P: Czy są opcje darmowego poziomu dla szablonów azd?
**O**: Niektóre usługi mają darmowe SKU lub miesięczne przyznania, zależnie od kwalifikacji, planu hostingu, regionu i limitów subskrypcji. Nie oznacza to, że cały szablon jest darmowy: bazy danych, wyszukiwanie, sieci, rejestry, telemetria i inferencja modelu mogą generować opłaty niezależnie. Sprawdź [listę darmowych usług Azure](https://azure.microsoft.com/free/) i aktualne cenniki każego zasobu przed wdrożeniem.

### P: Jak oszacować koszty przed wdrożeniem?
**O**: 
1. Przejrzyj `main.bicep` szablonu, aby zobaczyć, jakie zasoby są tworzone
2. Użyj Kalkulatora cen Azure z konkretnymi SKU
3. Wdróż najpierw do środowiska deweloperskiego, aby monitorować rzeczywiste koszty
4. Używaj Azure Cost Management do szczegółowej analizy kosztów

---

## Najlepsze praktyki

### P: Jakie są najlepsze praktyki dla struktury projektu azd?
**O**: 
1. Trzymaj kod aplikacji oddzielnie od infrastruktury
2. Stosuj sensowne nazwy usług w `azure.yaml`
3. Zaimplementuj odpowiednią obsługę błędów w skryptach build
4. Wykorzystuj konfigurację specyficzną dla środowiska
5. Dołącz obszerną dokumentację

### P: Jak organizować wiele usług w azd?
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

### P: Czy folder `.azure` powinien być dołączony do kontroli wersji?
**O**: **Nie!** Folder `.azure` zawiera wrażliwe informacje. Dodaj go do `.gitignore`:
```gitignore
.azure/
```

### P: Jak zarządzać sekretami i wrażliwą konfiguracją?
**O**: 
1. Używaj Azure Key Vault do przechowywania sekretów
2. Odwołuj się do sekretów Key Vault w konfiguracji aplikacji
3. Nigdy nie commituj sekretów do kontroli wersji
4. Używaj zarządzanych tożsamości dla uwierzytelniania usługa-usługa

### P: Jaka jest zalecana metoda CI/CD z azd?
**O**: 
1. Używaj oddzielnych środowisk dla każdego etapu (dev/staging/prod)
2. Wdrażaj automatyczne testy przed wdrożeniem
3. Używaj service principals do uwierzytelniania
4. Przechowuj wrażliwą konfigurację w sekretach/zmiennych potoków
5. Wdrażaj bramki zatwierdzające dla wdrożeń produkcyjnych

---

## Tematy Zaawansowane

### P: Czy mogę rozszerzyć azd o niestandardową funkcjonalność?
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
3. Integruj z istniejącym monitoringiem i alertami
4. Używaj wyjścia JSON azd do integracji z potokiem

### P: Czy mogę używać azd z Azure DevOps?
**O**: Tak, azd działa z każdym systemem CI/CD. Twórz potoki Azure DevOps korzystające z poleceń azd.

### P: Jak mogę przyczynić się do azd lub tworzyć szablony społeczności?
**O**: 
1. **narzędzie azd**: Wkład do [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Szablony**: Postępuj zgodnie z [instrukcjami wkładu do galerii Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentacja**: Wkład do dokumentacji w [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Jaka jest mapa drogowa azd?
**O**: Sprawdź [oficjalną mapę drogową](https://github.com/Azure/azure-dev/projects) pod kątem planowanych funkcji i usprawnień.

### P: Jak migrować z innych narzędzi wdrożeniowych do azd?
**O**: 
1. Analizuj obecną architekturę wdrożenia
2. Twórz równoważne szablony Bicep
3. Skonfiguruj `azure.yaml`, aby odpowiadał obecnym usługom
4. Dokładnie testuj w środowisku deweloperskim
5. Stopniowo migruj środowiska

---

## Nadal masz pytania?

### **Najpierw wyszukaj**
- Sprawdź [oficjalną dokumentację](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Przeszukaj [zgłoszenia GitHub](https://github.com/Azure/azure-dev/issues) pod kątem podobnych problemów

### **Uzyskaj pomoc**
- [Dyskusje GitHub](https://github.com/Azure/azure-dev/discussions) - wsparcie społeczności
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - pytania techniczne
- [Azure Discord](https://discord.gg/azure) - czat społeczności w czasie rzeczywistym

### **Zgłaszaj problemy**
- [Zgłoszenia GitHub](https://github.com/Azure/azure-dev/issues/new) - raporty błędów i prośby o funkcje
- Dołącz odpowiednie logi, komunikaty o błędach i kroki do odtworzenia

### **Dowiedz się więcej**
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Porady techniczne zweryfikowano: 4 listopada 2026. Dostępność usług w chmurze i ceny należy sprawdzić dla swojego subskrypcji i regionu.*

---

**Nawigacja**
- **Poprzednia lekcja**: [Słownik pojęć](glossary.md)
- **Następna lekcja**: [Przewodnik po nauce](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->