# Najczęściej Zadawane Pytania (FAQ)

**Uzyskaj Pomoc wg Rozdziału**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **🚆 Problemy z instalacją**: [Rozdział 1: Instalacja i konfiguracja](../docs/getting-started/installation.md)
- **🤖 Pytania o AI**: [Rozdział 2: Rozwój zorientowany na AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Rozwiązywanie problemów**: [Rozdział 7: Rozwiązywanie problemów i debugowanie](../docs/troubleshooting/common-issues.md)

## Wprowadzenie

Ten obszerny FAQ dostarcza odpowiedzi na najczęstsze pytania dotyczące Azure Developer CLI (azd) oraz wdrożeń Azure. Znajdziesz szybkie rozwiązania typowych problemów, poznasz najlepsze praktyki oraz wyjaśnienia pojęć i przepływów pracy azd.

## Cele nauki

Przeglądając ten FAQ, będziesz mógł:
- Szybko znaleźć odpowiedzi na typowe pytania i problemy związane z Azure Developer CLI
- Zrozumieć kluczowe koncepcje i terminologię w praktycznym formacie pytań i odpowiedzi
- Uzyskać dostęp do rozwiązań problemów w często występujących scenariuszach błędów
- Poznać najlepsze praktyki na podstawie często zadawanych pytań dotyczących optymalizacji
- Odkryć zaawansowane funkcje i możliwości przez pytania na poziomie eksperckim
- Efektywnie odwoływać się do wskazówek dotyczących kosztów, bezpieczeństwa i strategii wdrożeń

## Efekty nauki

Regularne korzystanie z tego FAQ pozwoli Ci:
- Samodzielnie rozwiązywać typowe problemy z Azure Developer CLI, korzystając z podanych rozwiązań
- Podejmować świadome decyzje dotyczące strategii i konfiguracji wdrożeń
- Zrozumieć relacje między azd, a innymi narzędziami i usługami Azure
- Stosować najlepsze praktyki na podstawie doświadczeń społeczności i zaleceń ekspertów
- Skutecznie diagnozować problemy z uwierzytelnianiem, wdrożeniem i konfiguracją
- Optymalizować koszty i wydajność, korzystając z porad i rekomendacji FAQ

## Spis treści

- [Pierwsze kroki](../../../resources)
- [Uwierzytelnianie i dostęp](../../../resources)
- [Szablony i projekty](../../../resources)
- [Wdrożenie i infrastruktura](../../../resources)
- [Konfiguracja i środowiska](../../../resources)
- [Rozwiązywanie problemów](../../../resources)
- [Koszty i rozliczenia](../../../resources)
- [Najlepsze praktyki](../../../resources)
- [Tematy zaawansowane](../../../resources)

---

## Pierwsze kroki

### Q: Czym jest Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) to narzędzie wiersza poleceń skoncentrowane na deweloperze, które przyspiesza czas przejścia aplikacji ze środowiska lokalnego do Azure. Dostarcza najlepsze praktyki za pomocą szablonów i wspiera cały cykl życia wdrożenia.

### Q: Czym azd różni się od Azure CLI?
**A**: 
- **Azure CLI**: Narzędzie ogólnego zastosowania do zarządzania zasobami Azure
- **azd**: Narzędzie skoncentrowane na deweloperze, skoncentrowane na przepływach wdrażania aplikacji
- azd korzysta wewnętrznie z Azure CLI, ale zapewnia wyższy poziom abstrakcji dla typowych scenariuszy deweloperskich
- azd zawiera szablony, zarządzanie środowiskami oraz automatyzację wdrożeń

### Q: Czy muszę mieć zainstalowany Azure CLI, aby używać azd?
**A**: Tak, azd wymaga Azure CLI do uwierzytelniania i niektórych operacji. Najpierw zainstaluj Azure CLI, potem azd.

### Q: Jakie języki programowania wspiera azd?
**A**: azd jest niezależny od języka. Działa z:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Stronami statycznymi
- Aplikacjami konteneryzowanymi

### Q: Czy mogę używać azd z istniejącymi projektami?
**A**: Tak! Możesz:
1. Użyć `azd init`, aby dodać konfigurację azd do istniejących projektów
2. Dostosować istniejące projekty do struktury szablonów azd
3. Tworzyć własne szablony bazując na Twojej istniejącej architekturze

---

## Uwierzytelnianie i dostęp

### Q: Jak uwierzytelnić się w Azure za pomocą azd?
**A**: Użyj `azd auth login`, które otworzy przeglądarkę do uwierzytelnienia w Azure. W scenariuszach CI/CD stosuj service principal lub tożsamości zarządzane.

### Q: Czy mogę używać azd z wieloma subskrypcjami Azure?
**A**: Tak. Użyj `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, aby określić subskrypcję dla każdego środowiska.

### Q: Jakie uprawnienia są potrzebne do wdrożeń za pomocą azd?
**A**: Zazwyczaj potrzebujesz:
- Roli **Contributor** na grupie zasobów lub subskrypcji
- Roli **User Access Administrator**, jeśli wdrażasz zasoby wymagające przypisania ról
- Konkretne uprawnienia zależą od szablonu i wdrażanych zasobów

### Q: Czy mogę używać azd w pipeline'ach CI/CD?
**A**: Oczywiście! azd jest zaprojektowany pod integrację z CI/CD. Używaj service principal do uwierzytelniania i ustawiaj zmienne środowiskowe do konfiguracji.

### Q: Jak obsłużyć uwierzytelnianie w GitHub Actions?
**A**: Użyj akcji Azure Login z poświadczeniami service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Szablony i projekty

### Q: Gdzie znajdę szablony azd?
**A**: 
- Oficjalne szablony: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Szablony społeczności: wyszukaj na GitHub hasło "azd-template"
- Użyj `azd template list`, aby przeglądać dostępne szablony

### Q: Jak utworzyć własny szablon?
**A**: 
1. Zacznij od istniejącej struktury szablonu
2. Modyfikuj `azure.yaml`, pliki infrastruktury i kod aplikacji
3. Dokładnie testuj za pomocą `azd up`
4. Publikuj w GitHub z właściwymi tagami

### Q: Czy mogę używać azd bez szablonu?
**A**: Tak, użyj `azd init` w istniejącym projekcie, aby utworzyć potrzebne pliki konfiguracyjne. Będziesz musiał ręcznie skonfigurować `azure.yaml` i pliki infrastruktury.

### Q: Jaka jest różnica między szablonami oficjalnymi a społecznościowymi?
**A**: 
- **Oficjalne szablony**: Utrzymywane przez Microsoft, regularnie aktualizowane, obszerna dokumentacja
- **Szablony społeczności**: Tworzone przez deweloperów, mogą mieć wyspecjalizowane zastosowania, różna jakość i wsparcie

### Q: Jak zaktualizować szablon w moim projekcie?
**A**: Szablony nie są aktualizowane automatycznie. Możesz:
1. Ręcznie porównać i scalić zmiany z szablonu źródłowego
2. Zacząć od nowa za pomocą `azd init` i zaktualizowanego szablonu
3. Wyłuskać konkretne poprawki z aktualizacji

---

## Wdrożenie i infrastruktura

### Q: Jakie usługi Azure może wdrażać azd?
**A**: azd może wdrażać dowolne usługi Azure przez szablony Bicep/ARM, w tym:
- App Services, Container Apps, Functions
- Bazy danych (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Zasoby sieciowe, bezpieczeństwo i monitorowanie

### Q: Czy mogę wdrażać do wielu regionów?
**A**: Tak, skonfiguruj wiele regionów w szablonach Bicep i ustaw parametr lokalizacji odpowiednio dla każdego środowiska.

### Q: Jak obsłużyć migracje schematu bazy danych?
**A**: Użyj hooków wdrożeniowych w `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Czy mogę wdrożyć tylko infrastrukturę bez aplikacji?
**A**: Tak, użyj `azd provision`, aby wdrożyć tylko komponenty infrastruktury zdefiniowane w szablonach.

### Q: Jak wdrożyć do istniejących zasobów Azure?
**A**: To skomplikowane i nie jest bezpośrednio wspierane. Możesz:
1. Zaimportować istniejące zasoby do szablonów Bicep
2. Używać referencji do istniejących zasobów w szablonach
3. Modyfikować szablony, by warunkowo tworzyć lub odwoływać się do zasobów

### Q: Czy mogę użyć Terraform zamiast Bicep?
**A**: Aktualnie azd głównie wspiera szablony Bicep/ARM. Wsparcie dla Terraforma nie jest oficjalnie dostępne, choć mogą istnieć rozwiązania społecznościowe.

---

## Konfiguracja i środowiska

### Q: Jak zarządzać różnymi środowiskami (dev, staging, prod)?
**A**: Twórz osobne środowiska za pomocą `azd env new <nazwa-środowiska>` i konfiguruj różne ustawienia dla każdego:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Gdzie przechowywane są konfiguracje środowisk?
**A**: W folderze `.azure` w katalogu Twojego projektu. Każde środowisko ma swój własny folder z plikami konfiguracji.

### Q: Jak ustawić konfigurację specyficzną dla środowiska?
**A**: Użyj `azd env set`, aby skonfigurować zmienne środowiskowe:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Czy mogę udostępniać konfiguracje środowisk innym członkom zespołu?
**A**: Folder `.azure` zawiera dane wrażliwe i nie powinien być commitowany do systemu kontroli wersji. Zamiast tego:
1. Dokumentuj wymagane zmienne środowiskowe
2. Używaj skryptów wdrożeniowych do konfigurowania środowisk
3. Stosuj Azure Key Vault dla wrażliwych konfiguracji

### Q: Jak nadpisać domyślne wartości szablonu?
**A**: Ustaw zmienne środowiskowe odpowiadające parametrom szablonu:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Rozwiązywanie problemów

### Q: Dlaczego `azd up` się nie powodzi?
**A**: Typowe przyczyny:
1. **Problemy z uwierzytelnianiem**: Uruchom `azd auth login`
2. **Niewystarczające uprawnienia**: Sprawdź przypisane role w Azure
3. **Konflikty nazw zasobów**: Zmień AZURE_ENV_NAME
4. **Problemy z limitem/pojemnością**: Sprawdź dostępność w regionie
5. **Błędy w szablonach**: Zweryfikuj szablony Bicep

### Q: Jak debugować błędy wdrożenia?
**A**: 
1. Użyj `azd deploy --debug` dla szczegółowego outputu
2. Sprawdź historię wdrożeń w portalu Azure
3. Przejrzyj Dziennik Aktywności w portalu Azure
4. Użyj `azd show`, aby wyświetlić stan bieżącego środowiska

### Q: Dlaczego zmienne środowiskowe nie działają?
**A**: Sprawdź:
1. Nazwy zmiennych dokładnie odpowiadają parametrom szablonu
2. Wartości są odpowiednio zacytowane, jeśli zawierają spacje
3. Jest wybrane właściwe środowisko: `azd env select <środowisko>`
4. Zmienne są ustawione w odpowiednim środowisku

### Q: Jak posprzątać po nieudanym wdrożeniu?
**A**: 
```bash
azd down --force --purge
```
To usuwa wszystkie zasoby oraz konfigurację środowiska.

### Q: Dlaczego moja aplikacja nie jest dostępna po wdrożeniu?
**A**: Sprawdź:
1. Wdrożenie zakończyło się sukcesem
2. Aplikacja działa (sprawdź logi w portalu Azure)
3. Grupy zabezpieczeń sieci pozwalają na ruch
4. DNS/własne domeny są poprawnie skonfigurowane

---

## Koszty i rozliczenia

### Q: Ile będzie kosztować wdrożenie azd?
**A**: Koszty zależą od:
- Usług Azure, które wdrażasz
- Wybranych warstw usług/SKU
- Różnic cen regionalnych
- Wzorców użycia

Skorzystaj z [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) do oszacowań.

### Q: Jak kontrolować koszty w wdrożeniach azd?
**A**: 
1. Używaj niższych warstw SKU w środowiskach deweloperskich
2. Ustaw budżety i alerty Azure
3. Używaj `azd down`, aby usuwać zasoby, gdy nie są potrzebne
4. Wybieraj odpowiednie regiony (koszty różnią się lokalizacją)
5. Korzystaj z narzędzi Azure Cost Management

### Q: Czy są opcje darmowych warstw dla szablonów azd?
**A**: Wiele usług Azure oferuje darmowe warstwy:
- App Service: dostępna darmowa warstwa
- Azure Functions: 1 mln darmowych wywołań/miesiąc
- Cosmos DB: darmowa warstwa z 400 RU/s
- Application Insights: pierwsze 5GB/miesiąc gratis

Konfiguruj szablony, by korzystać z darmowych warstw, gdzie to możliwe.

### Q: Jak oszacować koszty przed wdrożeniem?
**A**: 
1. Przejrzyj `main.bicep` szablonu, aby zobaczyć tworzone zasoby
2. Skorzystaj z Azure Pricing Calculator dla konkretnych SKU
3. Najpierw wdroż w środowisku deweloperskim, aby monitorować rzeczywiste koszty
4. Używaj Azure Cost Management do szczegółowej analizy kosztów

---

## Najlepsze praktyki

### Q: Jakie są najlepsze praktyki struktur projektów azd?
**A**: 
1. Trzymaj kod aplikacji oddzielnie od infrastruktury
2. Używaj znaczących nazw usług w `azure.yaml`
3. Zapewnij właściwą obsługę błędów w skryptach build
4. Korzystaj z konfiguracji specyficznej dla środowiska
5. Zawieraj obszerną dokumentację

### Q: Jak organizować wiele usług w azd?
**A**: Użyj rekomendowanej struktury:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Czy powinienem commitować folder `.azure` do kontroli wersji?
**A**: **Nie!** Folder `.azure` zawiera dane wrażliwe. Dodaj go do `.gitignore`:
```gitignore
.azure/
```

### Q: Jak obsługiwać sekrety i wrażliwą konfigurację?
**A**: 
1. Używaj Azure Key Vault do przechowywania sekretów
2. Odwołuj się do sekretów Key Vault w konfiguracji aplikacji
3. Nigdy nie commituj sekretów do kontroli wersji
4. Używaj tożsamości zarządzanych do uwierzytelniania między usługami

### Q: Jaki jest rekomendowany sposób CI/CD z azd?
**A**: 
1. Używaj osobnych środowisk dla każdego etapu (dev/staging/prod)
2. Wdróż automatyczne testowanie przed wdrożeniem
3. Korzystaj z service principal do uwierzytelniania
4. Przechowuj wrażliwą konfigurację w sekretach/zmiennych pipeline'u
5. Stosuj bramki zatwierdzające do wdrożeń produkcyjnych

---

## Tematy zaawansowane

### Q: Czy mogę rozszerzyć azd o funkcjonalności niestandardowe?
**A**: Tak, przez hooki wdrożeniowe w `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Jak zintegrować azd z istniejącymi procesami DevOps?
**A**: 
1. Używaj komend azd w istniejących skryptach pipeline'u
2. Standaryzuj szablony azd w zespołach
3. Integruj z istniejącym monitoringiem i alertami
4. Używaj wyjścia JSON azd do integracji z pipeline

### Q: Czy mogę używać azd z Azure DevOps?
**A**: Tak, azd działa z dowolnym systemem CI/CD. Twórz pipeline’y Azure DevOps używające komend azd.

### Q: Jak mogę przyczynić się do azd lub tworzyć szablony społeczności?
**A**: 
1. **narzędzie azd**: Współtwórz projekt [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Szablony**: Twórz szablony zgodnie z [wytycznymi dotyczącymi szablonów](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentacja**: Współtwórz dokumentację w [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Jaki jest plan rozwoju azd?
**O**: Sprawdź [oficjalny plan rozwoju](https://github.com/Azure/azure-dev/projects) dotyczący planowanych funkcji i usprawnień.

### P: Jak przejść z innych narzędzi wdrożeniowych na azd?
**O**: 
1. Przeanalizuj aktualną architekturę wdrożenia
2. Utwórz równoważne szablony Bicep
3. Skonfiguruj `azure.yaml`, aby odpowiadał obecnym usługom
4. Dokładnie przetestuj w środowisku deweloperskim
5. Stopniowo migruj środowiska

---

## Wciąż masz pytania?

### **Najpierw przeszukaj**
- Sprawdź [oficjalną dokumentację](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Przeszukaj [problemy na GitHubie](https://github.com/Azure/azure-dev/issues) pod kątem podobnych problemów

### **Uzyskaj pomoc**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Wsparcie społeczności
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Pytania techniczne
- [Azure Discord](https://discord.gg/azure) - Człowiecza społeczność w czasie rzeczywistym

### **Zgłaszaj problemy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Raporty o błędach i prośby o funkcje
- Dołącz odpowiednie logi, komunikaty o błędach oraz kroki pozwalające odtworzyć problem

### **Dowiedz się więcej**
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Ta FAQ jest regularnie aktualizowana. Ostatnia aktualizacja: 9 września 2025*

---

**Nawigacja**
- **Poprzednia lekcja**: [Słownik](glossary.md)
- **Następna lekcja**: [Przewodnik po nauce](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego rodzimym języku powinien być traktowany jako źródło wiążące. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->