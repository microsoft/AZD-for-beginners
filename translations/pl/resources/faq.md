# Najczęściej Zadawane Pytania (FAQ)

**Uzyskaj pomoc według rozdziału**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **🚆 Problemy z instalacją**: [Rozdział 1: Instalacja i konfiguracja](../docs/chapter-01-foundation/installation.md)
- **🤖 Pytania dotyczące AI**: [Rozdział 2: Rozwój z AI w centrum uwagi](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Rozwiązywanie problemów**: [Rozdział 7: Rozwiązywanie problemów i debugowanie](../docs/chapter-07-troubleshooting/common-issues.md)

## Wprowadzenie

Ten kompleksowy FAQ zawiera odpowiedzi na najczęściej zadawane pytania dotyczące Azure Developer CLI (azd) i wdrożeń Azure. Znajdź szybkie rozwiązania typowych problemów, zrozum najlepsze praktyki i uzyskaj wyjaśnienia dotyczące koncepcji i procesów azd.

## Cele nauki

Przeglądając ten FAQ, będziesz:
- Znajdować szybkie odpowiedzi na typowe pytania i problemy dotyczące Azure Developer CLI
- Rozumieć kluczowe koncepcje i terminologię poprzez praktyczny format pytań i odpowiedzi
- Mieć dostęp do rozwiązań problemów związanych z często występującymi błędami
- Poznać najlepsze praktyki przez najczęściej zadawane pytania dotyczące optymalizacji
- Odkryć zaawansowane funkcje i możliwości poprzez pytania eksperckie
- Skutecznie korzystać z wytycznych dotyczących kosztów, bezpieczeństwa i strategii wdrożeń

## Wyniki nauki

Regularnie korzystając z tego FAQ, będziesz w stanie:
- Samodzielnie rozwiązywać typowe problemy z Azure Developer CLI korzystając z dostarczonych rozwiązań
- Podejmować świadome decyzje dotyczące strategii wdrożenia i konfiguracji
- Rozumieć związek między azd a innymi narzędziami i usługami Azure
- Stosować najlepsze praktyki oparte na doświadczeniach społeczności i rekomendacjach ekspertów
- Skutecznie rozwiązywać problemy z uwierzytelnianiem, wdrożeniami i konfiguracją
- Optymalizować koszty i wydajność korzystając z wniosków i rekomendacji FAQ

## Spis treści

- [Pierwsze kroki](#getting-started)
- [Uwierzytelnianie i dostęp](#authentication--access)
- [Szablony i projekty](#templates--projects)
- [Wdrożenia i infrastruktura](#deployment--infrastructure)
- [Konfiguracja i środowiska](#configuration--environments)
- [Rozwiązywanie problemów](#troubleshooting)
- [Koszty i rozliczenia](#cost--billing)
- [Najlepsze praktyki](#best-practices)
- [Tematy zaawansowane](#advanced-topics)

---

## Pierwsze kroki

### P: Czym jest Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) to narzędzie wiersza poleceń skoncentrowane na deweloperze, które przyspiesza czas potrzebny na przeniesienie aplikacji z lokalnego środowiska programistycznego do Azure. Zapewnia najlepsze praktyki dzięki szablonom i wspiera cały cykl życia wdrożeń.

### P: Czym azd różni się od Azure CLI?
**O**: 
- **Azure CLI**: Narzędzie ogólnego przeznaczenia do zarządzania zasobami Azure
- **azd**: Narzędzie skoncentrowane na deweloperze, obsługujące procesy wdrażania aplikacji
- azd korzysta z własnego procesu uwierzytelniania i wdrażania; Azure CLI jest oddzielnym, uzupełniającym narzędziem
- azd zawiera szablony, zarządzanie środowiskami i automatyzację wdrożeń

### P: Czy muszę mieć zainstalowany Azure CLI, aby korzystać z azd?
**O**: Nie dla podstawowego procesu AZD. Uwierzytelniaj się za pomocą `azd auth login`. Zainstaluj Azure CLI osobno, gdy szablon lub ćwiczenie wyraźnie wywołuje polecenia `az`.

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
2. Dostosować istniejące projekty do struktury szablonu azd
3. Tworzyć własne szablony oparte na istniejącej architekturze

### P: Co się zmieniło z ogólną dostępnością rozszerzenia Foundry?
**O**: Pakiet `microsoft.foundry` osiągnął wersję 1.0 i GA 5 listopada 2026. W AZD 1.37.0+ użyj `azd ext install microsoft.foundry`, aby zainstalować siedem podstawowych rozszerzeń dla agentów, połączeń, inspektora, projektów, rutyn, umiejętności i narzędzi. Nie jest to nowa przestrzeń nazw poleceń, a jego komponenty są wersjonowane niezależnie. Oceny, zestawy danych, dostrajanie i modele niestandardowe instalowane są osobno; opcjonalne funkcje podglądu nie stają się GA tylko dlatego, że pakiet jest GA.

Przewodnik [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) używa Python 3.13+ i aktualnego uv. `azd ai agent run` otwiera lokalnie Inspektora Agenta, ale wywołania modelu nadal korzystają z Azure i generują koszty. Tryb kodu `azd deploy` przesyła źródła do zdalnego builda bez konieczności lokalnego builda w kontenerze.

### P: Czy `azd down` usuwa agenta hostowanego z istniejącego projektu Foundry?
**O**: Nie w opisywanej ścieżce reused-project szybkiego startu hostowanego agenta: pozostawia projekt, agenta hostowanego i inne zasoby bez zmian. Usuwaj niechciane zasoby oddzielnie, nie usuwając zasobów współdzielonych. Jeśli środowisko utworzyło nowy projekt Foundry, `azd down` usuwa jego grupę zasobów i wszystko w niej. Przejrzyj [wytyczne dotyczące sprzątania](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) i monity usuwania przed potwierdzeniem.

---

## Uwierzytelnianie i dostęp

### P: Jak uwierzytelnić się w Azure za pomocą azd?
**O**: Użyj `azd auth login`, które otworzy okno przeglądarki do uwierzytelnienia Azure. W scenariuszach CI/CD używaj usługowych zasad dostępu lub zarządzanych tożsamości.

### P: Czy mogę używać azd z wieloma subskrypcjami Azure?
**O**: Tak. Użyj `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, aby określić, którą subskrypcję wykorzystać dla każdego środowiska.

### P: Jakie uprawnienia są potrzebne do wdrożenia za pomocą azd?
**O**: Zazwyczaj potrzebujesz:
- roli **Współtwórca** na grupie zasobów lub subskrypcji
- roli **Administrator dostępu użytkownika** jeśli wdrażasz zasoby wymagające przypisań ról
- Specyficzne uprawnienia zależą od szablonu i wdrażanych zasobów

### P: Czy można używać azd w pipeline’ach CI/CD?
**O**: Oczywiście! azd jest zaprojektowane do integracji CI/CD. Używaj usługowych zasad dostępu do uwierzytelniania i ustaw zmienne środowiskowe do konfiguracji.

### P: Jak obsłużyć uwierzytelnianie w GitHub Actions?
**O**: Preferuj federation tożsamości obciążenia pracy (OIDC), skonfigurowane za pomocą `azd pipeline config`. Wygenerowany workflow instaluje AZD i uwierzytelnia AZD bezpośrednio z federowaną tożsamością. Samo `azure/login` nie ustanawia logowania AZD. Krok logowania w istniejącym jobie to:
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

Zaakceptuj lub wdrażaj po logowaniu, mając skonfigurowane docelowe środowisko, subskrypcję i lokalizację AZD. Poświadczenie tożsamości federacyjnej musi ufać repozytorium/referencji lub środowisku GitHub workflow, a role Azure muszą pozwalać na wymagane operacje.

---

## Szablony i projekty

### P: Gdzie mogę znaleźć szablony azd?
**O**: 
- Oficjalne i społecznościowe szablony: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Szablony społeczności: wyszukaj w GitHub "azd-template"
- Używaj `azd template list`, aby przeglądać dostępne szablony

### P: Jak stworzyć własny szablon?
**O**: 
1. Zacznij od istniejącej struktury szablonu
2. Modyfikuj `azure.yaml`, pliki infrastruktury i kod aplikacji
3. Dokładnie testuj przy pomocy `azd up`
4. Opublikuj na GitHub z odpowiednimi tagami

### P: Czy mogę używać azd bez szablonu?
**O**: Tak, użyj `azd init` w istniejącym projekcie do utworzenia niezbędnych plików konfiguracyjnych. Będziesz musiał ręcznie skonfigurować `azure.yaml` i pliki infrastruktury.

### P: Jaka jest różnica między oficjalnymi a społecznościowymi szablonami?
**O**: 
- **Oficjalne szablony**: Utrzymywane przez Microsoft, regularnie aktualizowane, posiadają kompletne dokumentacje
- **Szablony społeczności**: Tworzone przez deweloperów, mogą mieć specjalistyczne zastosowania, różna jakość i wsparcie

### P: Jak zaktualizować szablon w moim projekcie?
**O**: Szablony nie są automatycznie aktualizowane. Możesz:
1. Ręcznie porównać i scalić zmiany z oryginalnego szablonu
2. Rozpocząć na nowo przy pomocy `azd init` używając zaktualizowanego szablonu
3. Wybrać konkretne ulepszenia ze zaktualizowanych szablonów

---

## Wdrożenia i infrastruktura

### P: Jakie usługi Azure może wdrożyć azd?
**O**: azd może wdrożyć dowolną usługę Azure za pomocą szablonów Bicep/ARM, w tym:
- App Services, Container Apps, Functions
- Bazy danych (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Zasoby sieciowe, bezpieczeństwa i monitoringu

### P: Czy mogę wdrożyć w wielu regionach?
**O**: Tak, skonfiguruj wiele regionów w swoich szablonach Bicep i ustaw parametr lokalizacji odpowiednio dla każdego środowiska.

### P: Jak obsłużyć migracje schematu bazy danych?
**O**: Użyj haków wdrożeniowych w `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Czy mogę wdrożyć tylko infrastrukturę bez aplikacji?
**O**: Tak, użyj `azd provision`, aby wdrożyć tylko komponenty infrastruktury zdefiniowane w twoich szablonach.

### P: Jak wdrożyć do istniejących zasobów Azure?
**O**: Tak, jeśli szablon to wspiera. Odwołuj się do istniejących zasobów za pomocą deklaracji `existing` w Bicep lub dokumentowanych parametrów zasobów istniejących szablonu i mapuj usługi aplikacji do ich docelowych miejsc. To nie importuje własności ani nie tworzy automatycznie brakujących uprawnień. Przejrzyj szablon przed wdrożeniem.

### P: Czy mogę użyć Terraform zamiast Bicep?
**O**: Tak. AZD obsługuje Terraform oraz Bicep. Wybierz szablon oparty na Terraform lub skonfiguruj `infra.provider: terraform` w `azure.yaml`, wraz z odpowiednimi plikami Terraform i konfiguracją stanu/backendu. Zobacz [proces Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguracja i środowiska

### P: Jak zarządzać różnymi środowiskami (dev, staging, prod)?
**O**: Twórz oddzielne środowiska za pomocą `azd env new <environment-name>` i konfiguruj różne ustawienia dla każdego z nich:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Gdzie są przechowywane konfiguracje środowisk?
**O**: W folderze `.azure` w katalogu twojego projektu. Każde środowisko ma własny folder z plikami konfiguracyjnymi.

### P: Jak ustawić konfigurację specyficzną dla środowiska?
**O**: Użyj `azd env set` do konfiguracji zmiennych środowiskowych:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Czy mogę udostępniać konfiguracje środowiska wśród członków zespołu?
**O**: Folder `.azure` zawiera wrażliwe informacje i nie powinien być commitowany do kontroli wersji. Zamiast tego:
1. Dokumentuj wymagane zmienne środowiskowe
2. Używaj skryptów wdrożeniowych do konfiguracji środowisk
3. Używaj Azure Key Vault dla wrażliwych konfiguracji

### P: Jak zastąpić wartości domyślne szablonu?
**O**: Ustaw zmienne środowiskowe odpowiadające parametrom szablonu:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Tylko zmienne konsumowane przez szablon wpływają na wdrożenie. `SKU_NAME` powyżej to przykład niestandardowego wejścia, nie uniwersalne ustawienie AZD.

---

## Rozwiązywanie problemów

### P: Dlaczego `azd up` nie działa?
**O**: Najczęstsze przyczyny:
1. **Problemy z uwierzytelnianiem**: Uruchom `azd auth login`
2. **Niewystarczające uprawnienia**: Sprawdź swoje przypisania ról Azure
3. **Konflikty nazw zasobów**: Przejrzyj konfliktujący zasób i parametry nazewnictwa szablonu; utwórz osobne środowisko z `azd env new`, gdy potrzebna izolacja
4. **Problemy z limitami/zasobami**: Sprawdź dostępność regionalną
5. **Błędy szablonów**: Zweryfikuj szablony Bicep

### P: Jak debugować nieudane wdrożenia?
**O**: 
1. Użyj `azd deploy --debug` dla szczegółowego wyjścia
2. Sprawdź historię wdrożeń w portalu Azure
3. Przejrzyj Dziennik zdarzeń w portalu Azure
4. Użyj `azd show` do wyświetlenia stanu bieżącego środowiska

### P: Dlaczego moje zmienne środowiskowe nie działają?
**O**: Sprawdź:
1. Nazwy zmiennych dokładnie odpowiadają parametrom szablonu
2. Wartości są poprawnie cytowane, jeśli zawierają spacje
3. Wybrane jest środowisko: `azd env select <environment>`
4. Zmienne są ustawione w odpowiednim środowisku

### P: Jak posprzątać po nieudanych wdrożeniach?
**O**: 
```bash
azd down
```
Przed rozpoczęciem sprawdź wybrane środowisko i potwierdzenie usunięcia. Usuwa to wdrożone zasoby Azure, nie lokalną konfigurację środowiska `.azure`. `--purge` dodatkowo wymaga trwałego usunięcia obsługiwanych zasobów z miękkim usunięciem, może być zablokowane przez ochronę przed retencją/usuwaniem; nie jest to rutynowy krok odzyskiwania.

### P: Dlaczego moja aplikacja nie jest dostępna po wdrożeniu?
**O**: Sprawdź:
1. Wdrożenie zakończyło się powodzeniem
2. Aplikacja działa (sprawdź logi w portalu Azure)
3. Grupy zabezpieczeń sieci zezwalają na ruch
4. DNS/domeny niestandardowe są prawidłowo skonfigurowane

---

## Koszty i rozliczenia

### P: Ile będą kosztować wdrożenia azd?
**O**: Koszty zależą od:
- Wdrożonych usług Azure
- Wybranych poziomów usług/SKU
- Różnic cen regionalnych
- Wzorów użytkowania

Skorzystaj z [Kalkulatora cen Azure](https://azure.microsoft.com/pricing/calculator/), aby oszacować koszty.

### P: Jak kontrolować koszty wdrożeń azd?
**O**: 
1. Używaj niższych SKU dla środowisk deweloperskich
2. Ustawiaj budżety i alerty Azure
3. Używaj `azd down` do usuwania zasobów, gdy nie są potrzebne
4. Wybieraj odpowiednie regiony (koszty różnią się w zależności od lokalizacji)
5. Korzystaj z narzędzi Azure do zarządzania kosztami

### P: Czy istnieją opcje darmowego poziomu dla szablonów azd?
**O**: Niektóre usługi mają darmowe SKU lub miesięczne dotacje, zależnie od kwalifikacji, planu hostingowego, regionu i limitów subskrypcji. Nie powoduje to, że cały szablon jest darmowy: bazy danych, wyszukiwanie, sieci, rejestry, telemetryka i wnioskowanie modeli mogą generować odrębne opłaty. Sprawdź [listę darmowych usług Azure](https://azure.microsoft.com/free/) oraz aktualne ceny dla każdego zasobu przed wdrożeniem.

### P: Jak oszacować koszty przed wdrożeniem?
**O**: 
1. Przejrzyj `main.bicep` szablonu, aby zobaczyć tworzone zasoby
2. Skorzystaj z kalkulatora cen Azure z określonymi SKU
3. Najpierw wdroż w środowisku deweloperskim, aby monitorować rzeczywiste koszty
4. Użyj Azure Cost Management do szczegółowej analizy kosztów

---

## Najlepsze Praktyki

### P: Jakie są najlepsze praktyki dotyczące struktury projektu azd?
**O**: 
1. Trzymaj kod aplikacji oddzielnie od infrastruktury
2. Używaj znaczących nazw usług w `azure.yaml`
3. Implementuj odpowiednie obsługi błędów w skryptach budowania
4. Korzystaj z konfiguracji specyficznej dla środowiska
5. Dołącz pełną dokumentację

### P: Jak powinienem organizować wiele usług w azd?
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

### P: Czy powinienem zatwierdzać folder `.azure` do kontroli wersji?
**O**: **Nie!** Folder `.azure` zawiera poufne informacje. Dodaj go do `.gitignore`:
```gitignore
.azure/
```

### P: Jak obsługiwać sekrety i wrażliwą konfigurację?
**O**: 
1. Używaj Azure Key Vault do sekretów
2. Odwołuj się do sekretów Key Vault w konfiguracji aplikacji
3. Nigdy nie zatwierdzaj sekretów do kontroli wersji
4. Używaj zarządzanych tożsamości do uwierzytelniania między usługami

### P: Jaka jest zalecana metoda CI/CD z azd?
**O**: 
1. Używaj osobnych środowisk dla każdego etapu (dev/staging/prod)
2. Wprowadź automatyczne testy przed wdrożeniem
3. Używaj service principal do uwierzytelniania
4. Przechowuj wrażliwą konfigurację w sekretach/zmiennych pipeline’u
5. Wdroż kontrolę zatwierdzenia na wdrożenia produkcyjne

---

## Zaawansowane Tematy

### P: Czy mogę rozszerzyć azd o funkcje niestandardowe?
**O**: Tak, poprzez haczyki wdrożeniowe w `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Jak integrować azd z istniejącymi procesami DevOps?
**O**: 
1. Używaj poleceń azd w istniejących skryptach pipeline
2. Standaryzuj szablony azd w zespołach
3. Integruj z istniejącym monitoringiem i alertami
4. Używaj JSON-a wyjściowego azd do integracji z pipeline

### P: Czy mogę używać azd z Azure DevOps?
**O**: Tak, azd działa z każdym systemem CI/CD. Twórz potoki Azure DevOps używające poleceń azd.

### P: Jak mogę przyczynić się do azd lub tworzyć szablony społecznościowe?
**O**: 
1. **narzędzie azd**: Wspieraj [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Szablony**: Postępuj zgodnie z [instrukcjami wkładu do galerii Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentacja**: Wspieraj dokumentację w [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Jaka jest mapa drogowa azd?
**O**: Sprawdź [oficjalną mapę drogową](https://github.com/Azure/azure-dev/projects) z planowanymi funkcjami i ulepszeniami.

### P: Jak migrować z innych narzędzi wdrożeniowych do azd?
**O**: 
1. Analizuj obecną architekturę wdrożenia
2. Twórz równoważne szablony Bicep
3. Skonfiguruj `azure.yaml`, aby odpowiadał obecnym usługom
4. Starannie przetestuj w środowisku deweloperskim
5. Stopniowo migruj środowiska

---

## Wciąż masz pytania?

### **Najpierw szukaj**
- Sprawdź [oficjalną dokumentację](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Przeszukaj [zgłoszenia GitHub](https://github.com/Azure/azure-dev/issues) pod kątem podobnych problemów

### **Uzyskaj pomoc**
- [Dyskusje GitHub](https://github.com/Azure/azure-dev/discussions) - wsparcie społeczności
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - pytania techniczne
- [Azure Discord](https://discord.gg/azure) - czat społeczności w czasie rzeczywistym

### **Zgłaszaj problemy**
- [Zgłoszenia GitHub](https://github.com/Azure/azure-dev/issues/new) - raporty błędów i prośby o funkcje
- Dodaj odpowiednie logi, komunikaty o błędach i kroki do powtórzenia

### **Dowiedz się więcej**
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Poradnik techniczny zaktualizowany: 4 listopada 2026. Należy sprawdzić dostępność i ceny w chmurze dla subskrypcji i regionu.*

---

**Nawigacja**
- **Poprzednia lekcja**: [Słownik](glossary.md)
- **Następna lekcja**: [Przewodnik do nauki](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->