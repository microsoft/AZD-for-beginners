# Dziennik zmian - AZD dla początkujących

## Wprowadzenie

Ten dziennik zmian dokumentuje wszystkie istotne zmiany, aktualizacje i ulepszenia w repozytorium AZD dla początkujących. Stosujemy zasady wersjonowania semantycznego i utrzymujemy ten rejestr, aby pomóc użytkownikom zrozumieć, co zmieniło się między wersjami.

## Cele nauki

Przeglądając ten dziennik zmian, będziesz:
- Na bieżąco z nowymi funkcjami i dodatkami do zawartości
- Rozumieć ulepszenia w istniejącej dokumentacji
- Śledzić poprawki błędów i poprawki w celu zapewnienia dokładności
- Obserwować ewolucję materiałów edukacyjnych w czasie

## Efekty nauki

Po zapoznaniu się z wpisami w dzienniku zmian będziesz mógł:
- Identyfikować nowe treści i zasoby dostępne do nauki
- Rozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Planować swoją ścieżkę nauki na podstawie najaktualniejszych materiałów
- Kontrybuować opinie i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.17.0] - 2026-02-05

#### Ulepszenie nawigacji kursu
**Ta wersja poprawia nawigację po rozdziałach README.md dzięki ulepszonemu formatowi tabeli.**

#### Zmiany
- **Tabela mapy kursu**: Ulepszona o bezpośrednie linki do lekcji, szacowany czas trwania i oceny złożoności
- **Czyszczenie folderów**: Usunięto zbędne stare foldery (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Weryfikacja linków**: Zweryfikowano wszystkie 21+ linków wewnętrznych w tabeli mapy kursu

### [v3.16.0] - 2026-02-05

#### Aktualizacje nazw produktów
**Ta wersja aktualizuje odniesienia do produktów na obecne oznaczenia Microsoft.**

#### Zmiany
- **Azure AI Foundry → Microsoft Foundry**: Wszystkie odniesienia zaktualizowane w plikach niebędących tłumaczeniami
- **Azure AI Agent Service → Foundry Agents**: Nazwa usługi zaktualizowana, aby odzwierciedlać aktualne oznaczenie

#### Aktualizowane pliki
- `README.md` - Strona główna kursu
- `changelog.md` - Historia wersji
- `course-outline.md` - Struktura kursu
- `docs/chapter-02-ai-development/agents.md` - Przewodnik po agentach AI
- `examples/README.md` - Dokumentacja przykładów
- `workshop/README.md` - Strona główna warsztatu
- `workshop/docs/index.md` - Indeks warsztatu
- `workshop/docs/instructions/*.md` - Wszystkie pliki instrukcji warsztatu

---

### [v3.15.0] - 2026-02-05

#### Duża restrukturyzacja repozytorium: foldery nazwane według rozdziałów
**Ta wersja restrukturyzuje dokumentację do dedykowanych folderów rozdziałów dla lepszej nawigacji.**

#### Zmiana nazw folderów
Stare foldery zostały zastąpione folderami numerowanymi według rozdziałów:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano nowy: `docs/chapter-05-multi-agent/`

#### Migracje plików
| Plik | Z | Do |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Wszystkie pliki pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Wszystkie pliki troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 Pliki README rozdziałów**: Utworzono README.md w każdym folderze rozdziału zawierające:
  - Cele nauki i czas trwania
  - Tabela lekcji z opisami
  - Polecenia szybkiego startu
  - Nawigację do innych rozdziałów

#### Zmiany
- **🔗 Zaktualizowano wszystkie linki wewnętrzne**: 78+ ścieżek zaktualizowanych w całej dokumentacji
- **🗺️ Główne README.md**: Zaktualizowano mapę kursu zgodnie z nową strukturą rozdziałów
- **📝 examples/README.md**: Zaktualizowano odwołania do folderów rozdziałów

#### Usunięto
- Starą strukturę folderów (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturyzacja repozytorium: Nawigacja po rozdziałach
**Ta wersja dodała pliki README do nawigacji rozdziałowej (zastąpione przez v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nowy przewodnik po agentach AI
**Ta wersja dodaje kompleksowy przewodnik po wdrażaniu agentów AI z użyciem Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Kompletny przewodnik obejmujący:
  - Czym są agenci AI i czym różnią się od chatbotów
  - Trzy szablony szybkiego startu agentów (Foundry Agents, Prompty, RAG)
  - Wzorce architektoniczne agentów (pojedynczy agent, RAG, multi-agent)
  - Konfiguracja narzędzi i dostosowania
  - Monitorowanie i śledzenie metryk
  - Rozważania dotyczące kosztów i optymalizacja
  - Typowe scenariusze rozwiązywania problemów
  - Trzy ćwiczenia praktyczne z kryteriami sukcesu

#### Struktura treści
- **Wprowadzenie**: Koncepcje agentów dla początkujących
- **Szybki start**: Deploy agentów z `azd init --template get-started-with-ai-agents`
- **Wzorce architektury**: Diagramy wizualne wzorców agentów
- **Konfiguracja**: Ustawienia narzędzi i zmienne środowiskowe
- **Monitorowanie**: Integracja z Application Insights
- **Ćwiczenia**: Stopniowe ćwiczenia praktyczne (każde 20-45 minut)

---

### [v3.12.0] - 2026-02-05

#### Aktualizacja środowiska DevContainer
**Ta wersja aktualizuje konfigurację kontenera deweloperskiego o nowoczesne narzędzia i lepsze ustawienia domyślne dla doświadczenia nauki AZD.**

#### Zmiany
- **🐳 Obraz bazowy**: Zaktualizowano z `python:3.12-bullseye` do `python:3.12-bookworm` (najnowszy stabilny Debian)
- **📛 Nazwa kontenera**: Zmieniono z "Python 3" na "AZD for Beginners" dla przejrzystości

#### Dodano
- **🔧 Nowe funkcje Dev Container**:
  - `azure-cli` z włączonym wsparciem Bicep
  - `node:20` (wersja LTS dla szablonów AZD)
  - `github-cli` do zarządzania szablonami
  - `docker-in-docker` do wdrożeń container app

- **🔌 Przekierowanie portów**: Wstępnie skonfigurowane porty do typowego rozwoju:
  - 8000 (podgląd MkDocs)
  - 3000 (aplikacje webowe)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nowe rozszerzenia VS Code**:
  - `ms-python.vscode-pylance` - ulepszona inteligencja Python
  - `ms-azuretools.vscode-azurefunctions` - wsparcie Azure Functions
  - `ms-azuretools.vscode-docker` - wsparcie Docker
  - `ms-azuretools.vscode-bicep` - wsparcie języka Bicep
  - `ms-azure-devtools.azure-resource-groups` - zarządzanie zasobami Azure
  - `yzhang.markdown-all-in-one` - edycja Markdown
  - `DavidAnson.vscode-markdownlint` - lintowanie Markdown
  - `bierner.markdown-mermaid` - wsparcie diagramów Mermaid
  - `redhat.vscode-yaml` - wsparcie YAML (dla azure.yaml)
  - `eamodio.gitlens` - wizualizacja Git
  - `mhutchie.git-graph` - historia Git

- **⚙️ Ustawienia VS Code**: Dodano domyślne ustawienia dla interpretera Python, formatowania przy zapisie i usuwania białych znaków

- **📦 Zaktualizowano requirements-dev.txt**:
  - Dodano wtyczkę do minifikacji MkDocs
  - Dodano pre-commit dla jakości kodu
  - Dodano pakiety Azure SDK (azure-identity, azure-mgmt-resource)

#### Naprawiono
- **Polecenie po utworzeniu**: Teraz weryfikuje instalację AZD i Azure CLI podczas startu kontenera

---

### [v3.11.0] - 2026-02-05

#### Przeprojektowanie README przyjazne dla początkujących
**Ta wersja znacząco poprawia README.md, aby było bardziej dostępne dla początkujących i dodaje niezbędne zasoby dla deweloperów AI.**

#### Dodano
- **🆚 Porównanie Azure CLI i AZD**: Jasne wyjaśnienie, kiedy używać każdego narzędzia z praktycznymi przykładami
- **🌟 Świetne linki do AZD**: Bezpośrednie linki do galerii szablonów społeczności i zasobów do współtworzenia:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ gotowych do wdrożenia szablonów
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - współtworzenie społeczności
- **🎯 Przewodnik szybkiego startu**: Uproszczona 3-krokowa sekcja startowa (Zainstaluj → Zaloguj się → Wdróż)
- **📊 Tabela nawigacyjna oparta na doświadczeniu**: Jasne wskazówki, od czego zacząć w zależności od doświadczenia dewelopera

#### Zmiany
- **Struktura README**: Przeorganizowana dla stopniowego odkrywania - kluczowe informacje na początku
- **Sekcja wprowadzenia**: Przepisana, aby wyjaśnić „magiczne działanie `azd up`” dla całkowitych początkujących
- **Usunięto zduplikowaną treść**: Usunięto powieloną sekcję rozwiązywania problemów
- **Polecenia rozwiązywania problemów**: Poprawiono odniesienie `azd logs` na użycie poprawnego `azd monitor --logs`

#### Naprawiono
- **🔐 Polecenia uwierzytelniania**: Dodano `azd auth login` i `azd auth logout` do cheat-sheet.md
- **Nieprawidłowe odniesienia do poleceń**: Usunięto pozostałe `azd logs` z sekcji rozwiązywania problemów README

#### Notatki
- **Zakres**: Zmiany zastosowano w głównym README.md i resources/cheat-sheet.md
- **Grupa docelowa**: Ulepszenia skierowane głównie do deweloperów nowych w AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizacja poprawności poleceń Azure Developer CLI
**Ta wersja koryguje nieistniejące polecenia AZD w całej dokumentacji, zapewniając, że wszystkie przykłady kodu używają prawidłowej składni Azure Developer CLI.**

#### Naprawiono
- **🔧 Usunięto nieistniejące polecenia AZD**: Kompleksowy audyt i korekta nieprawidłowych poleceń:
  - `azd logs` (nie istnieje) → zastąpione `azd monitor --logs` lub alternatywami Azure CLI
  - Podpolecenia `azd service` (nie istnieją) → zastąpione `azd show` i Azure CLI
  - `azd infra import/export/validate` (nie istnieją) → usunięte lub zastąpione prawidłowymi alternatywami
  - Flagi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nie istnieją) → usunięte
  - Flagi `azd provision --what-if/--rollback` (nie istnieją) → zaktualizowane do `--preview`
  - `azd config validate` (nie istnieje) → zastąpione `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nie istnieją) → usunięte

- **📚 Zaktualizowane pliki z poprawkami poleceń**:
  - `resources/cheat-sheet.md`: Istotna przebudowa odniesień poleceń
  - `docs/deployment/deployment-guide.md`: Poprawki strategii rollback i wdrożeń
  - `docs/troubleshooting/debugging.md`: Korekta sekcji analizy logów
  - `docs/troubleshooting/common-issues.md`: Aktualizacja poleceń rozwiązywania problemów
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawa sekcji debugowania AZD
  - `docs/getting-started/azd-basics.md`: Korekta poleceń monitorowania
  - `docs/getting-started/first-project.md`: Aktualizacja przykładów monitorowania i debugowania
  - `docs/getting-started/installation.md`: Poprawki przykładów pomocy i wersji
  - `docs/pre-deployment/application-insights.md`: Poprawa poleceń przeglądania logów
  - `docs/pre-deployment/coordination-patterns.md`: Poprawa poleceń debugowania agentów

- **📝 Zaktualizowane odniesienie do wersji**:
  - `docs/getting-started/installation.md`: Zmiana hardkodowanej wersji `1.5.0` na ogólną `1.x.x` z linkiem do wydań

#### Zmiany
- **Strategie rollback**: Zaktualizowano dokumentację, aby używała rollbacku opartego na Gicie (AZD nie posiada natywnego rollbacku)
- **Przeglądanie logów**: Zamiana odniesień `azd logs` na `azd monitor --logs`, `azd monitor --live` oraz polecenia Azure CLI
- **Sekcja wydajności**: Usunięto nieistniejące flagi wdrożeń równoległych/incrementalnych, dodano prawidłowe alternatywy

#### Szczegóły techniczne
- **Poprawne polecenia AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Poprawne flagi azd monitor**: `--live`, `--logs`, `--overview`
- **Usunięte funkcje**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notatki
- **Weryfikacja**: Polecenia zweryfikowane względem Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ukończenie warsztatów i aktualizacja jakości dokumentacji
**Ta wersja kończy interaktywne moduły warsztatowe, naprawia wszystkie nieaktywne linki w dokumentacji i poprawia ogólną jakość treści dla deweloperów AI korzystających z Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nowy dokument wytycznych dotyczących współtworzenia z:
  - Jasne instrukcje dotyczące zgłaszania problemów i proponowania zmian
  - Standardy dokumentacji dla nowej zawartości
  - Wytyczne dotyczące przykładów kodu i konwencje komunikatów commitów
  - Informacje o zaangażowaniu społeczności

#### Ukończono
- **🎯 Moduł warsztatowy 7 (Podsumowanie)**: W pełni ukończony moduł podsumowujący z:
  - Kompleksowym podsumowaniem osiągnięć warsztatu
  - Sekcją kluczowych opanowanych koncepcji dotyczących AZD, szablonów i AI Foundry
  - Rekomendacjami dalszej ścieżki nauki
  - Ćwiczeniami wyzwań warsztatowych z oceną trudności
  - Linkami do opinii społeczności i wsparcia

- **📚 Moduł warsztatowy 3 (Analiza)**: Zaktualizowane cele nauki z:
  - Wskazówkami dotyczącymi aktywacji GitHub Copilot z serwerami MCP
  - Zrozumieniem struktury folderów szablonów AZD
  - Wzorcami organizacji infrastruktury-as-code (Bicep)
  - Instrukcjami do laboratorium praktycznego

- **🔧 Moduł warsztatowy 6 (Rozbiórka)**: Ukończono z:
  - Celami oczyszczenia zasobów i zarządzania kosztami
  - Użyciem `azd down` do bezpiecznego wycofania infrastruktury
  - Wskazówkami dotyczącymi odzyskiwania miękko usuniętych usług kognitywnych
  - Bonusowymi wskazówkami eksploracyjnymi dla GitHub Copilot i Azure Portal

#### Naprawiono
- **🔗 Naprawa uszkodzonych linków**: Naprawiono 15+ uszkodzonych wewnętrznych linków dokumentacji:
  - `docs/ai-foundry/ai-model-deployment.md`: Poprawiono ścieżki do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Skorygowano ścieżki ai-model-deployment.md oraz production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamieniono nieistniejący cicd-integration.md na deployment-guide.md
  - `examples/retail-scenario.md`: Naprawiono ścieżki FAQ i przewodnika rozwiązywania problemów
  - `examples/container-app/microservices/README.md`: Skorygowano ścieżki do kursu i przewodnika wdrożeniowego
  - `resources/faq.md` i `resources/glossary.md`: Zaktualizowano odniesienia do rozdziałów AI
  - `course-outline.md`: Naprawiono linki do przewodnika instruktorów i laboratoriów AI

- **📅 Banner statusu warsztatu**: Zaktualizowano z "W budowie" na aktywny status warsztatu z datą luty 2026

- **🔗 Nawigacja warsztatowa**: Naprawiono uszkodzone linki nawigacyjne w README.md warsztatu prowadzące do nieistniejącego folderu lab-1-azd-basics

#### Zmieniono
- **Prezentacja warsztatu**: Usunięto ostrzeżenie „w budowie”, warsztat jest teraz kompletny i gotowy do użytku
- **Spójność nawigacji**: Zapewniono właściwą nawigację pomiędzy modułami warsztatów
- **Odniesienia do ścieżki nauki**: Zaktualizowano odwołania do rozdziałów na poprawne microsoft-foundry

#### Zweryfikowano
- ✅ Wszystkie angielskie pliki markdown mają prawidłowe linki wewnętrzne
- ✅ Moduły warsztatowe 0-7 są kompletne z celami nauki
- ✅ Nawigacja między rozdziałami i modułami działa poprawnie
- ✅ Zawartość jest odpowiednia dla deweloperów AI korzystających z Microsoft AZD
- ✅ Zachowano język i strukturę przyjazną dla początkujących
- ✅ CONTRIBUTING.md zawiera jasne wskazówki dla współtwórców społecznościowych

#### Implementacja techniczna
- **Weryfikacja linków**: Zautomatyzowany skrypt PowerShell zweryfikował wszystkie linki wewnętrzne .md
- **Audyt zawartości**: Ręczna kontrola kompletności i przyjazności dla początkujących
- **System nawigacji**: Zastosowano spójne wzorce nawigacji rozdziałów i modułów

#### Notatki
- **Zakres**: Zmiany zastosowano wyłącznie w dokumentacji angielskiej
- **Tłumaczenia**: Foldery tłumaczeń nie zostały zaktualizowane w tej wersji (automatyczne tłumaczenie zostanie zsynchronizowane później)
- **Czas trwania warsztatów**: Kompletny warsztat oferuje teraz 3-4 godziny praktycznej nauki

---

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: monitorowanie, bezpieczeństwo i wzorce wieloagentowe
**Ta wersja dodaje pełne lekcje na poziomie A dotyczące integracji Application Insights, wzorców uwierzytelniania oraz koordynacji wieloagentowej dla produkcyjnych wdrożeń.**

#### Dodano
- **📊 Lekcja integracji Application Insights**: w `docs/pre-deployment/application-insights.md`:
  - Wdrożenie z fokussem na AZD z automatycznym provisionowaniem
  - Kompletny zestaw szablonów Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z własną telemetrią (1200+ linii)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów Azure OpenAI)
  - 6 diagramów Mermaid (architektura, śledzenie rozproszone, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, dashboardy, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Transmisja metryk na żywo i debugowanie w czasie rzeczywistym
  - 40-50 minut nauki z wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i bezpieczeństwa**: w `docs/getting-started/authsecurity.md`:
  - 3 wzorce uwierzytelniania (connection strings, Key Vault, managed identity)
  - Kompletny zestaw szablonów Bicep do bezpiecznych wdrożeń
  - Kod aplikacji Node.js integrującej Azure SDK
  - 3 pełne ćwiczenia (włączenie managed identity, tożsamości przypisanej użytkownikowi, rotacja Key Vault)
  - Najlepsze praktyki bezpieczeństwa i konfiguracje RBAC
  - Przewodnik rozwiązywania problemów oraz analiza kosztów
  - Wzorce bezhasłowego uwierzytelniania gotowe do produkcji

- **🤖 Lekcja wzorców koordynacji wieloagentowej**: w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Pełna implementacja usługi orkiestratora (Python/Flask, 1500+ linii)
  - 3 specjalistyczne implementacje agentów (Research, Writer, Editor)
  - Integracja z Service Bus do kolejkowania wiadomości
  - Zarządzanie stanem w Cosmos DB dla systemów rozproszonych
  - 6 diagramów Mermaid pokazujących interakcje agentów
  - 3 zaawansowane ćwiczenia (obsługa timeoutów, logika ponowień, wyłącznik obwodu)
  - Rozbicie kosztów ($240-565/mies.) z strategiami optymalizacji
  - Integracja Application Insights do monitoringu

#### Ulepszono
- **Rozdział Pre-deployment**: Obecnie zawiera pełne wzorce monitorowania i koordynacji
- **Rozdział Getting Started**: Ulepszony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Kompleksowe omówienie od bezpieczeństwa po obserwowalność
- **Konspekt kursu**: Zaktualizowany o odniesienia do nowych lekcji w rozdziałach 3 i 6

#### Zmieniono
- **Postęp nauki**: Lepsza integracja bezpieczeństwa i monitorowania w całym kursie
- **Jakość dokumentacji**: Spójne standardy klasy A (95-97%) w nowych lekcjach
- **Wzorce produkcyjne**: Kompleksowe pokrycie wdrożeń klasy enterprise

#### Ulepszono
- **Doświadczenie dewelopera**: Jasna ścieżka od rozwoju do monitorowania produkcji
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania sekretami
- **Obserwowalność**: Pełna integracja Application Insights z AZD
- **Obciążenia AI**: Specjalistyczny monitoring dla Azure OpenAI i systemów wieloagentowych

#### Zweryfikowano
- ✅ Wszystkie lekcje zawierają kompletny działający kod (nie fragmenty)
- ✅ Diagramy Mermaid dla wizualnej nauki (łącznie 19 w 3 lekcjach)
- ✅ Ćwiczenia praktyczne z krokami weryfikacyjnymi (łącznie 9)
- ✅ Szablony Bicep gotowe do wdrożenia przez `azd up`
- ✅ Analiza kosztów i strategie optymalizacji
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki
- ✅ Punkty kontrolne z poleceniami weryfikacyjnymi

#### Ocena dokumentacji
- **docs/pre-deployment/application-insights.md**: - Kompleksowy przewodnik monitorowania
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury wieloagentowe
- **Nowa zawartość ogólnie**: - Spójne wysokiej jakości standardy

#### Implementacja techniczna
- **Application Insights**: Log Analytics + własna telemetria + śledzenie rozproszone
- **Uwierzytelnianie**: Managed Identity + Key Vault + wzorce RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkiestracja
- **Monitoring**: Metryki na żywo + zapytania Kusto + alerty + dashboardy
- **Zarządzanie kosztami**: Strategie próbkowania, polityki retencji, kontrola budżetu

### [v3.7.0] - 2025-11-19

#### Poprawa jakości dokumentacji i nowy przykład Azure OpenAI
**Ta wersja poprawia jakość dokumentacji w całym repozytorium oraz dodaje kompletny przykład wdrożenia Azure OpenAI z interfejsem chat GPT-4.**

#### Dodano
- **🤖 Przykład czatu Azure OpenAI**: Kompletny deployment GPT-4 z działającą implementacją w `examples/azure-openai-chat/`:
  - Kompletny stack infrastruktury Azure OpenAI (wdrożenie modelu GPT-4)
  - Interfejs czatu wiersza poleceń Python z historią rozmów
  - Integracja z Key Vault do bezpiecznego przechowywania kluczy API
  - Śledzenie wykorzystania tokenów i szacowanie kosztów
  - Ograniczanie tempa i obsługa błędów
  - Obszerna instrukcja README na 35-45 minut wdrożenia
  - 11 plików gotowych do produkcji (szablony Bicep, aplikacja Python, konfiguracja)
- **📚 Ćwiczenia dokumentacyjne**: Dodano praktyczne ćwiczenia w przewodniku konfiguracyjnym:
  - Ćwiczenie 1: Konfiguracja wielośrodowiskowa (15 minut)
  - Ćwiczenie 2: Praktyka zarządzania sekretami (10 minut)
  - Jasne kryteria sukcesu i kroki weryfikacyjne
- **✅ Weryfikacja wdrożenia**: Dodano sekcję weryfikacji do przewodnika wdrożenia:
  - Procedury kontroli stanu zdrowia
  - Lista kryteriów sukcesu
  - Oczekiwane wyniki wszystkich poleceń wdrożeniowych
  - Szybka pomoc w rozwiązywaniu problemów

#### Ulepszono
- **examples/README.md**: Zaktualizowano do jakości klasy A (93%):
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji
  - Zaktualizowano liczbę przykładów lokalnych z 3 do 4
  - Dodano do tabeli przykładów aplikacji AI
  - Zintegrowano z szybkim startem dla użytkowników średniozaawansowanych
  - Dodano do sekcji Microsoft Foundry Templates
  - Zaktualizowano matrycę porównań i odnalezienie technologii
- **Jakość dokumentacji**: Ulepszona z B+ (87%) do A- (92%) w folderze docs:
  - Dodano oczekiwane wyniki do krytycznych przykładów poleceń
  - Dodano kroki weryfikacyjne dla zmian konfiguracyjnych
  - Ulepszono naukę praktyczną przez ćwiczenia

#### Zmieniono
- **Postęp nauki**: Lepsza integracja przykładów AI dla użytkowników średniozaawansowanych
- **Struktura dokumentacji**: Więcej praktycznych ćwiczeń z jasnymi rezultatami
- **Proces weryfikacji**: Dodano wyraźne kryteria sukcesu do kluczowych przepływów pracy

#### Ulepszono
- **Doświadczenie dewelopera**: Wdrożenie Azure OpenAI teraz trwa 35-45 minut (w porównaniu do 60-90 minut innych rozwiązań)
- **Przejrzystość kosztów**: Jasne oszacowania kosztów ($50-200/mies.) dla przykładu Azure OpenAI
- **Ścieżka nauki**: Deweloperzy AI mają jasny punkt startu z azure-openai-chat
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacyjne

#### Zweryfikowano
- ✅ Przykład Azure OpenAI w pełni funkcjonalny z `azd up`
- ✅ Wszystkie 11 plików implementacji składniowo poprawne
- ✅ Instrukcje README odpowiadają rzeczywistemu doświadczeniu wdrożenia
- ✅ Linki dokumentacji zaktualizowane w ponad 8 lokalizacjach
- ✅ Indeks przykładów zawiera dokładnie 4 lokalne przykłady
- ✅ Brak zduplikowanych linków zewnętrznych w tabelach
- ✅ Wszystkie odniesienia nawigacyjne są poprawne

#### Implementacja techniczna
- **Architektura Azure OpenAI**: GPT-4 + Key Vault + wzorzec Container Apps
- **Bezpieczeństwo**: Gotowość na Managed Identity, sekrety w Key Vault
- **Monitoring**: Integracja Application Insights
- **Zarządzanie kosztami**: Śledzenie tokenów i optymalizacja zużycia
- **Wdrożenie**: Pojedyncze polecenie `azd up` do kompletnej konfiguracji

### [v3.6.0] - 2025-11-19

#### Duża aktualizacja: przykłady wdrożeń aplikacji kontenerowych
**Ta wersja wprowadza kompleksowe, gotowe do produkcji przykłady wdrożeń aplikacji kontenerowych wykorzystujących Azure Developer CLI (AZD), wraz z pełną dokumentacją i integracją ścieżki nauki.**

#### Dodano
- **🚀 Przykłady aplikacji kontenerowych**: Nowe lokalne przykłady w `examples/container-app/`:
  - [Przewodnik główny](examples/container-app/README.md): Kompletny przegląd wdrożeń konteneryzowanych, szybki start, produkcja i wzorce zaawansowane
  - [Proste API Flask](../../examples/container-app/simple-flask-api): Przyjazne dla początkujących REST API ze skalowaniem do zera, sondami zdrowia, monitoringiem i rozwiązywaniem problemów
  - [Architektura mikrousług](../../examples/container-app/microservices): Gotowe do produkcji wdrożenie multi-serwisowe (API Gateway, Product, Order, User, Notification), asynchroniczne komunikaty, Service Bus, Cosmos DB, Azure SQL, śledzenie rozproszone, wdrożenie blue-green/canary
- **Najlepsze praktyki**: Bezpieczeństwo, monitorowanie, optymalizacja kosztów i wskazówki CI/CD dla obciążeń konteneryzowanych
- **Przykłady kodu**: Kompletny `azure.yaml`, szablony Bicep oraz wielojęzyczne implementacje serwisów (Python, Node.js, C#, Go)
- **Testowanie i rozwiązywanie problemów**: Scenariusze testowe end-to-end, polecenia monitorujące, wskazówki do debugowania

#### Zmieniono
- **README.md**: Zaktualizowany, aby wyróżnić i powiązać nowe przykłady aplikacji kontenerowych pod „Local Examples - Container Applications”
- **examples/README.md**: Zaktualizowany w celu podkreślenia przykładów aplikacji kontenerowych, dodania wpisów do matrycy porównań i aktualizacji odniesień do technologii/architektury
- **Plan kursu i przewodnik po nauce**: Zaktualizowano o odwołania do nowych przykładów aplikacji kontenerowych i wzorców wdrażania w odpowiednich rozdziałach

#### Zweryfikowano
- ✅ Wszystkie nowe przykłady można wdrożyć za pomocą `azd up` i stosują najlepsze praktyki
- ✅ Zaktualizowano powiązania dokumentacji i nawigację
- ✅ Przykłady obejmują scenariusze od początkujących do zaawansowanych, w tym produkcyjne mikrousługi

#### Uwagi
- **Zakres**: Tylko dokumentacja i przykłady w języku angielskim
- **Kolejne kroki**: Rozszerzenie o dodatkowe zaawansowane wzorce kontenerowe i automatyzację CI/CD w przyszłych wydaniach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Ta wersja wprowadza kompleksową zmianę nazwy produktu z "Microsoft Foundry" na "Microsoft Foundry" we wszystkich anglojęzycznych materiałach dokumentacyjnych, odzwierciedlając oficjalny rebranding Microsoftu.**

#### Zmiany
- **🔄 Aktualizacja nazwy produktu**: Kompleksowy rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Zaktualizowano wszystkie odwołania w angielskiej dokumentacji w folderze `docs/`
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Razem: zaktualizowano 23 odwołania w 7 plikach dokumentacji

- **📁 Zmiany w strukturze folderów**:
  - `docs/ai-foundry/` przemianowano na `docs/microsoft-foundry/`
  - Wszystkie odwołania krzyżowe zaktualizowano, aby odzwierciedlić nową strukturę folderów
  - Zweryfikowano linki nawigacyjne we wszystkich materiałach

- **📄 Zmiany nazw plików**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Wszystkie wewnętrzne linki zaktualizowano do nowej nazwy pliku

#### Zaktualizowane pliki
- **Dokumentacja rozdziałów** (7 plików):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizacje odniesień do nazwy produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Już zawiera Microsoft Foundry (z poprzednich aktualizacji)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 zaktualizowane odniesienia (przegląd, opinie społeczności, dokumentacja)
  - `docs/getting-started/azd-basics.md` - 4 zaktualizowane linki krzyżowe
  - `docs/getting-started/first-project.md` - 2 zaktualizowane linki nawigacyjne rozdziałów
  - `docs/getting-started/installation.md` - 2 zaktualizowane linki do kolejnych rozdziałów
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 zaktualizowane odniesienia (nawigacja, społeczność Discord)
  - `docs/troubleshooting/common-issues.md` - 1 zaktualizowany link nawigacyjny
  - `docs/troubleshooting/debugging.md` - 1 zaktualizowany link nawigacyjny

- **Pliki struktury kursu** (2 pliki):
  - `README.md` - 17 zaktualizowanych odniesień (przegląd kursu, tytuły rozdziałów, sekcja szablonów, spostrzeżenia społeczności)
  - `course-outline.md` - 14 zaktualizowanych odniesień (przegląd, cele nauki, zasoby rozdziałów)

#### Zweryfikowano
- ✅ Brak odwołań do folderu "ai-foundry" w angielskiej dokumentacji
- ✅ Brak pozostałych odniesień do nazwy produktu "Microsoft Foundry" w angielskiej dokumentacji
- ✅ Wszystkie linki nawigacyjne działają poprawnie z nową strukturą folderów
- ✅ Zmiany nazw plików i folderów zakończone pomyślnie
- ✅ Zweryfikowano powiązania krzyżowe między rozdziałami

#### Uwagi
- **Zakres**: Zmiany dotyczą tylko anglojęzycznej dokumentacji w folderze `docs/`
- **Tłumaczenia**: Foldery tłumaczeń (`translations/`) nie były aktualizowane w tej wersji
- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie były zmieniane w tej wersji
- **Przykłady**: Pliki z przykładami mogą jeszcze odnosić się do starych nazw (do rozwiązania w przyszłej aktualizacji)
- **Linki zewnętrzne**: Zewnętrzne adresy URL i odwołania do repozytorium GitHub pozostają bez zmian

#### Przewodnik migracji dla współtwórców
Jeśli posiadasz lokalne gałęzie lub dokumentację odwołującą się do starej struktury:
1. Zaktualizuj odwołania do folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Zaktualizuj odwołania do plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zastąp nazwę produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Zweryfikuj, czy wszystkie wewnętrzne odnośniki w dokumentacji działają poprawnie

---

### [v3.4.0] - 2025-10-24

#### Ulepszenia podglądu i walidacji infrastruktury
**Ta wersja wprowadza kompleksowe wsparcie dla nowej funkcji podglądu Azure Developer CLI oraz poprawia doświadczenie użytkownika warsztatów.**

#### Dodano
- **🧪 Dokumentacja funkcji azd provision --preview**: Szczegółowe omówienie nowej funkcji podglądu infrastruktury
  - Referencje komend i przykłady użycia w ściągawce
  - Szczegółowa integracja w przewodniku wdrażania z przypadkami użycia i korzyściami
  - Integracja kontroli pre-flight dla bezpieczniejszej walidacji wdrożenia
  - Aktualizacje przewodnika rozpoczynającego z praktykami pierwszeństwa bezpieczeństwa wdrożeń
- **🚧 Baner statusu warsztatu**: Profesjonalny baner HTML informujący o statusie rozwoju warsztatu
  - Projekt gradientowy z wskaźnikami budowy dla jasnej informacji użytkownika
  - Znacznik ostatniej aktualizacji dla transparentności
  - Responsywny design dostosowany do urządzeń mobilnych

#### Ulepszono
- **Bezpieczeństwo infrastruktury**: Funkcja podglądu zintegrowana w całej dokumentacji wdrożeń
- **Walidacja przed wdrożeniem**: Skrypty automatyzujące uwzględniają teraz testowanie podglądu infrastruktury
- **Przepływ pracy dewelopera**: Zaktualizowane sekwencje poleceń z podglądem jako najlepszą praktyką
- **Doświadczenie warsztatu**: Ustawiono jasne oczekiwania co do statusu rozwoju treści

#### Zmiany
- **Najlepsze praktyki wdrażania**: Rekomendowana jest teraz kolejność pracy z podglądem jako pierwszy krok
- **Przepływ dokumentacji**: Walidacja infrastruktury przeniesiona wcześniej w procesie nauki
- **Prezentacja warsztatu**: Profesjonalna komunikacja statusu z wyraźnym harmonogramem rozwoju

#### Ulepszenia
- **Podejście bezpieczeństwa**: Zmiany infrastruktury można teraz sprawdzać przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu można udostępniać do przeglądu i akceptacji
- **Świadomość kosztów**: Lepsze zrozumienie kosztów zasobów przed provisioningiem
- **Minimalizacja ryzyka**: Zmniejszenie liczby nieudanych wdrożeń dzięki wcześniejszej walidacji

#### Realizacja techniczna
- **Integracja wieloplatformowa**: Funkcja podglądu opisana w czterech kluczowych plikach
- **Wzorce poleceń**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd zawarty w workflow walidacyjnym i skryptach
- **Wskaźniki wizualne**: Jasne oznaczenia NOWEJ funkcji dla łatwego znalezienia

#### Infrastruktura warsztatu
- **Komunikacja statusu**: Profesjonalny baner HTML ze stylizacją gradientową
- **Doświadczenie użytkownika**: Klarowny status rozwoju zapobiega dezorientacji
- **Profesjonalna prezentacja**: Utrzymanie wiarygodności repozytorium z wyraźnym przekazem
- **Przejrzystość harmonogramu**: Znacznik ostatniej aktualizacji październik 2025 dla odpowiedzialności

### [v3.3.0] - 2025-09-24

#### Rozszerzone materiały warsztatowe i interaktywne doświadczenie nauki
**Ta wersja wprowadza rozbudowane materiały warsztatowe z przeglądarkowym interaktywnym przewodnikiem oraz ustrukturyzowanymi ścieżkami nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatowy**: Doświadczenie warsztatowe oparte na przeglądarce z możliwością podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatowe**: 7-etapowa ścieżka nauki od odkrywania do personalizacji
  - 0-Wprowadzenie: Przegląd warsztatu i konfiguracja
  - 1-Wybór-szablonu-AI: Odkrywanie i wybór szablonu
  - 2-Walidacja-szablonu-AI: Procedury wdrożenia i walidacji
  - 3-Analiza-szablonu-AI: Zrozumienie architektury szablonu
  - 4-Konfiguracja-szablonu-AI: Konfiguracja i personalizacja
  - 5-Personalizacja-szablonu-AI: Zaawansowane modyfikacje i iteracje
  - 6-Zamknięcie-infrastruktury: Czyszczenie i zarządzanie zasobami
  - 7-Podsumowanie: Podsumowanie i dalsze kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia nauki
- **🎯 Ścieżka nauki praktycznej**: 3-etapowa metodologia (Odkrywanie → Wdrożenie → Personalizacja)
- **📱 Integracja z GitHub Codespaces**: Płynna konfiguracja środowiska deweloperskiego

#### Ulepszono
- **Laboratorium AI**: Rozszerzone o całkowity 2-3-godzinny ustrukturyzowany proces nauki
- **Dokumentacja warsztatu**: Profesjonalna prezentacja z nawigacją i pomocniczymi wizualizacjami
- **Postęp nauki**: Jasne wskazówki krok po kroku od wyboru szablonu do wdrożenia produkcyjnego
- **Doświadczenie dewelopera**: Zintegrowane narzędzia dla usprawnionych przepływów programistycznych

#### Ulepszenia
- **Dostępność**: Interfejs przeglądarkowy z wyszukiwarką, funkcją kopiowania i przełącznikiem motywów
- **Nauka we własnym tempie**: Elastyczna struktura warsztatu dostosowująca się do różnych prędkości nauki
- **Praktyczne zastosowanie**: Realistyczne scenariusze wdrożenia szablonów AI
- **Integracja społecznościowa**: Integracja Discord dla wsparcia i współpracy użytkowników

#### Funkcje warsztatowe
- **Wbudowana wyszukiwarka**: Szybkie wyszukiwanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcja kopiowania po najechaniu dla wszystkich przykładów kodu
- **Przełącznik motywów**: Obsługa trybu ciemnego/jasnego dostosowana do preferencji
- **Zasoby wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia
- **Integracja pomocy**: Bezpośredni dostęp do Discorda dla wsparcia społecznościowego

### [v3.2.0] - 2025-09-17

#### Kompleksowa restrukturyzacja nawigacji i system nauki oparty na rozdziałach
**Ta wersja wprowadza kompleksową strukturę nauki opartą na rozdziałach z ulepszoną nawigacją w całym repozytorium.**

#### Dodano
- **📚 System nauki oparty na rozdziałach**: Przebudowano cały kurs na 8 kolejnych rozdziałów nauki
  - Rozdział 1: Podstawy & szybki start (⭐ - 30-45 min)
  - Rozdział 2: Rozwój AI-first (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 min)
  - Rozdział 4: Infrastruktura jako kod i wdrożenie (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Multiagentowe rozwiązania AI (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja i planowanie przed wdrożeniem (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugging (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Produkcyjne i korporacyjne wzorce (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacyjne we wszystkich materiałach
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Wskazówki ścieżki nauki**: Jasne punkty wejścia dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja powiązana**: Wyraźne połączenia między powiązanymi rozdziałami i zależnościami

#### Ulepszenia
- **Struktura README**: Przekształcona w ustrukturyzowaną platformę nauki z organizacją opartą na rozdziałach
- **Nawigacja w dokumentacji**: Każda strona zawiera kontekst rozdziału i wskazówki postępu
- **Organizacja szablonów**: Przykłady i szablony przypisane do właściwych rozdziałów nauki
- **Integracja zasobów**: Ściągawki, FAQ i przewodniki nauki powiązane z odpowiednimi rozdziałami
- **Integracja warsztatów**: Laboratoria praktyczne przypisane do celów naukowych wielu rozdziałów

#### Zmiany
- **Postęp nauki**: Przejście z liniowej dokumentacji do elastycznej nauki opartej na rozdziałach
- **Umieszczenie konfiguracji**: Przeniesienie przewodnika konfiguracji do Rozdziału 3 dla lepszego przepływu nauki
- **Integracja treści AI**: Lepsza integracja treści specyficznych dla AI na całej ścieżce nauki
- **Treści produkcyjne**: Zaawansowane wzorce skonsolidowane w Rozdziale 8 dla zaawansowanych odbiorców

#### Ulepszenia
- **Doświadczenie użytkownika**: Jasne okruszki nawigacyjne i wskaźniki postępu rozdziałów
- **Dostępność**: Spójne wzory nawigacyjne ułatwiające poruszanie się po kursie
- **Profesjonalna prezentacja**: Struktura kursu w stylu uniwersyteckim odpowiednia do szkoleń akademickich i korporacyjnych
- **Efektywność nauki**: Skrócenie czasu na znalezienie odpowiednich treści dzięki lepszej organizacji

#### Realizacja techniczna
- **Nagłówki nawigacji**: Ustandaryzowana nawigacja rozdziałowa w ponad 40 plikach dokumentacji
- **Stopka nawigacji**: Spójne wskazówki postępu i wskaźniki ukończenia rozdziałów
- **Linkowanie krzyżowe**: Kompleksowy system linków wewnętrznych łączących powiązane pojęcia
- **Mapowanie rozdziałów**: Szablony i przykłady wyraźnie powiązane z celami naukowymi

#### Ulepszenia przewodnika po nauce
- **📚 Kompleksowe cele nauki**: Przebudowany przewodnik po nauce dopasowany do systemu 8 rozdziałów
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera konkretne cele i zadania praktyczne
- **📋 Śledzenie postępów**: Tygodniowy harmonogram nauki z mierzalnymi efektami i listą kontrolną
- **❓ Pytania oceniające**: Pytania sprawdzające wiedzę do każdego rozdziału z profesjonalnymi wynikami
- **🛠️ Ćwiczenia praktyczne**: Ćwiczenia z rzeczywistymi scenariuszami wdrożeniowymi i rozwiązywaniem problemów
- **📊 Postęp umiejętności**: Jasny rozwój od podstaw do korporacyjnych wzorców z ukierunkowaniem na rozwój kariery
- **🎓 System certyfikacji**: Wyniki rozwoju zawodowego i system uznania społeczności
- **⏱️ Zarządzanie czasem**: Ustrukturyzowany 10-tygodniowy plan nauki z walidacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone wieloagentowe rozwiązania AI
**Ta wersja poprawia wieloagentowe rozwiązanie detaliczne poprzez lepsze nazewnictwo agentów i ulepszoną dokumentację.**

#### Zmiany
- **Terminologia wieloagentowa**: Zastąpiono "agent Cora" terminem "agent klienta" w całym detalicznym rozwiązaniu wieloagentowym dla lepszej jasności
- **Architektura agenta**: Zaktualizowano całą dokumentację, szablony ARM oraz przykłady kodu do spójnego użycia nazwy "agent klienta"
- **Przykłady konfiguracji**: Zmodernizowano wzorce konfiguracji agentów z nowymi konwencjami nazewnictwa
- **Spójność dokumentacji**: Zapewniono, że wszystkie odniesienia używają profesjonalnych, opisowych nazw agentów

#### Ulepszone
- **Pakiet szablonu ARM**: Zaktualizowano retail-multiagent-arm-template z odniesieniami do agenta klienta
- **Diagramy architektury**: Odświeżono diagramy Mermaid z nowym nazewnictwem agentów
- **Przykłady kodu**: Klasy i przykłady implementacji w Python teraz używają nazwy CustomerAgent
- **Zmienne środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe, aby używały konwencji CUSTOMER_AGENT_NAME

#### Ulepszenia
- **Doświadczenie programisty**: Bardziej klarowne role i odpowiedzialności agentów w dokumentacji  
- **Gotowość produkcyjna**: Lepsze dostosowanie do konwencji nazewnictwa korporacyjnego  
- **Materiały szkoleniowe**: Bardziej intuicyjne nazewnictwo agentów do celów edukacyjnych  
- **Użyteczność szablonów**: Uproszczone rozumienie funkcji agentów i wzorców wdrożeniowych  

#### Szczegóły techniczne  
- Zaktualizowano diagramy architektury Mermaid o odniesienia do CustomerAgent  
- Zmieniono nazwy klas CoraAgent na CustomerAgent w przykładach Python  
- Zmodyfikowano konfiguracje JSON szablonów ARM, używając typu agenta "customer"  
- Zaktualizowano zmienne środowiskowe z wzorców CORA_AGENT_* na CUSTOMER_AGENT_*  
- Odświeżono wszystkie polecenia wdrożeniowe oraz konfiguracje kontenerów  

### [v3.0.0] - 2025-09-12  

#### Główne zmiany - Fokus na deweloperów AI i integracja z Microsoft Foundry  
**Ta wersja przekształca repozytorium w kompleksowe źródło wiedzy AI z integracją Microsoft Foundry.**  

#### Dodano  
- **🤖 Ścieżka nauki AI-First**: Całkowita restrukturyzacja z priorytetem na deweloperów i inżynierów AI  
- **Przewodnik integracji Microsoft Foundry**: Kompleksowa dokumentacja łączenia AZD z usługami Microsoft Foundry  
- **Wzorce wdrożeń modeli AI**: Szczegółowy przewodnik obejmujący wybór modeli, konfigurację i strategie wdrażania produkcyjnego  
- **Laboratorium warsztatowe AI**: 2-3 godziny praktycznego warsztatu dotyczącego konwersji aplikacji AI na rozwiązania wdrażalne przez AZD  
- **Najlepsze praktyki produkcyjne AI**: Wzorce korporacyjne do skalowania, monitorowania i zabezpieczania obciążeń AI  
- **Specyficzny przewodnik rozwiązywania problemów AI**: Kompletna pomoc w problemach dotyczących Azure OpenAI, Cognitive Services i wdrożeń AI  
- **Galeria szablonów AI**: Wybrane szablony Microsoft Foundry z oceną złożoności  
- **Materiały warsztatowe**: Kompletny plan warsztatów wraz z ćwiczeniami praktycznymi i materiałami referencyjnymi  

#### Ulepszono  
- **Struktura README**: Ukierunkowana na deweloperów AI z 45% zainteresowaniem społeczności według danych Microsoft Foundry Discord  
- **Ścieżki nauki**: Dedykowana ścieżka dla deweloperów AI obok tradycyjnych ścieżek dla studentów i inżynierów DevOps  
- **Rekomendacje szablonów**: Wyróżnione szablony AI, w tym azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart  
- **Integracja społecznościowa**: Rozbudowane wsparcie społeczności Discord z kanałami i dyskusjami dedykowanymi AI  

#### Bezpieczeństwo i fokus produkcyjny  
- **Wzorce zarządzanej tożsamości**: Autentykacja i konfiguracje bezpieczeństwa specyficzne dla AI  
- **Optymalizacja kosztów**: Śledzenie zużycia tokenów i kontrola budżetu obciążeń AI  
- **Wdrożenia wieloregionalne**: Strategie globalnego wdrażania aplikacji AI  
- **Monitorowanie wydajności**: Metryki specyficzne dla AI oraz integracja z Application Insights  

#### Jakość dokumentacji  
- **Linearna struktura kursu**: Logiczne przejście od wzorców wdrożeniowych dla początkujących do zaawansowanych AI  
- **Zwalidowane adresy URL**: Wszystkie zewnętrzne linki do repozytoriów zweryfikowane i dostępne  
- **Kompletny indeks**: Wszystkie wewnętrzne linki dokumentacyjne zweryfikowane i funkcjonalne  
- **Gotowość produkcyjna**: Wzorce korporacyjne z przykładami z życia wziętymi  

### [v2.0.0] - 2025-09-09  

#### Główne zmiany - Restrukturyzacja repozytorium i ulepszenie profesjonalne  
**Ta wersja to znacząca przebudowa struktury repozytorium oraz formy prezentacji treści.**  

#### Dodano  
- **Struktura nauki**: Wszystkie strony dokumentacji teraz zawierają wstęp, cele nauki oraz efekty uczenia się  
- **System nawigacji**: Dodano linki Poprzednia/Następna lekcja w całej dokumentacji dla prowadzonego przebiegu nauczania  
- **Przewodnik do nauki**: Kompletny dokument study-guide.md z celami, ćwiczeniami praktycznymi i materiałami oceniania  
- **Profesjonalna prezentacja**: Usunięto wszystkie ikony emoji na rzecz lepszej dostępności i profesjonalnego wyglądu  
- **Ulepszona struktura treści**: Lepsza organizacja i płynność materiałów szkoleniowych  

#### Zmieniono  
- **Format dokumentacji**: Ustandaryzowano całą dokumentację z jednolitą strukturą nastawioną na naukę  
- **Przepływ nawigacji**: Wdrożono logiczne przechodzenie przez materiały edukacyjne  
- **Prezentacja zawartości**: Usunięto elementy dekoracyjne na rzecz klarownej, profesjonalnej formy  
- **Struktura linków**: Zaktualizowano wszystkie linki wewnętrzne, aby wspierać nowy system nawigacji  

#### Ulepszono  
- **Dostępność**: Usunięto zależności od emoji dla lepszej kompatybilności z czytnikami ekranu  
- **Profesjonalny wygląd**: Czysta, akademicka prezentacja odpowiednia dla środowiska korporacyjnego  
- **Doświadczanie nauki**: Struktura z jasnymi celami i rezultatami dla każdej lekcji  
- **Organizacja treści**: Lepszy logiczny przepływ i powiązania między tematami  

### [v1.0.0] - 2025-09-09  

#### Pierwsze wydanie - Kompleksowe repozytorium nauki AZD  

#### Dodano  
- **Podstawowa struktura dokumentacji**  
  - Kompletny cykl przewodników dla początkujących  
  - Obszerną dokumentację wdrożeń i provisioning  
  - Szczegółowe materiały ze wskazówkami rozwiązywania problemów i debugowania  
  - Narzędzia i procedury do walidacji przed wdrożeniem  

- **Moduł startowy**  
  - AZD Basics: podstawowe pojęcia i terminologia  
  - Przewodnik instalacji: instrukcje konfiguracji platformowej  
  - Przewodnik konfiguracji: ustawienia środowiska i uwierzytelnianie  
  - Pierwszy projekt: przewodnik krok po kroku z ćwiczeniami praktycznymi  

- **Moduł wdrożeń i provisioning**  
  - Przewodnik wdrożeń: pełna dokumentacja procesu  
  - Przewodnik provisioningowy: infrastruktura jako kod w Bicep  
  - Najlepsze praktyki dla wdrożeń produkcyjnych  
  - Wzorce architektoniczne wielousługowe  

- **Moduł walidacji przed wdrożeniem**  
  - Planowanie pojemności: weryfikacja dostępności zasobów Azure  
  - Wybór SKU: kompleksowe wskazówki dotyczące warstw usług  
  - Kontrole wstępne: automatyczne skrypty walidacyjne (PowerShell i Bash)  
  - Narzędzia do szacowania kosztów i planowania budżetu  

- **Moduł rozwiązywania problemów**  
  - Typowe problemy: często napotykane kwestie i rozwiązania  
  - Przewodnik debugowania: systematyczne metody rozwiązywania usterek  
  - Zaawansowane techniki i narzędzia diagnostyczne  
  - Monitorowanie wydajności i optymalizacja  

- **Zasoby i odniesienia**  
  - Szybka ściągawka poleceń: referencje do kluczowych komend  
  - Słownik: pełna terminologia i definicje skrótów  
  - FAQ: szczegółowe odpowiedzi na najczęściej zadawane pytania  
  - Linki do zasobów zewnętrznych i społeczności  

- **Przykłady i szablony**  
  - Prosty przykład aplikacji internetowej  
  - Szablon wdrożeniowy strony statycznej  
  - Konfiguracja aplikacji kontenerowej  
  - Wzorce integracji baz danych  
  - Przykłady architektury mikroserwisów  
  - Implementacje funkcji serverless  

#### Funkcje  
- **Wsparcie wielu platform**: przewodniki instalacji i konfiguracji dla Windows, macOS i Linux  
- **Różne poziomy zaawansowania**: materiały dla studentów i profesjonalnych deweloperów  
- **Praktyczne podejście**: ćwiczenia i scenariusze z życia wzięte  
- **Kompleksowe pokrycie**: od podstaw po zaawansowane wzorce korporacyjne  
- **Podejście security-first**: najlepsze praktyki bezpieczeństwa w całej zawartości  
- **Optymalizacja kosztów**: wskazówki dla efektywnych kosztowo wdrożeń i zarządzania zasobami  

#### Jakość dokumentacji  
- **Szczegółowe przykłady kodu**: praktyczne, przetestowane fragmenty  
- **Instrukcje krok po kroku**: jasne i wykonalne wskazówki  
- **Kompleksowa obsługa błędów**: pomoc w typowych problemach  
- **Wdrożenie najlepszych praktyk**: standardy branżowe i zalecenia  
- **Kompatybilność wersji**: aktualność względem najnowszych usług Azure i funkcji azd  

## Planowane przyszłe usprawnienia  

### Wersja 3.1.0 (Planowana)  
#### Rozszerzenie platformy AI  
- **Wsparcie wielu modeli**: wzorce integracji dla Hugging Face, Azure Machine Learning i modeli niestandardowych  
- **Frameworki agentów AI**: szablony dla LangChain, Semantic Kernel i AutoGen  
- **Zaawansowane wzorce RAG**: opcje baz wektorowych poza Azure AI Search (Pinecone, Weaviate itp.)  
- **Obserwowalność AI**: rozszerzone monitorowanie wydajności modeli, zużycia tokenów i jakości odpowiedzi  

#### Doświadczenie programisty  
- **Rozszerzenie VS Code**: zintegrowane doświadczenie rozwoju AZD + AI Foundry  
- **Integracja GitHub Copilot**: AI-asystowane generowanie szablonów AZD  
- **Interaktywne tutoriale**: praktyczne ćwiczenia kodowania z automatyczną walidacją scenariuszy AI  
- **Materiały wideo**: uzupełniające tutoriale wideo dla wizualnych uczniów koncentrujące się na wdrożeniach AI  

### Wersja 4.0.0 (Planowana)  
#### Wzorce AI dla przedsiębiorstw  
- **Ramowy system zarządzania**: zarządzanie modelami AI, zgodność i audyty  
- **AI wielodostępne**: wzorce dla obsługi wielu klientów z izolowanymi usługami AI  
- **Wdrożenia AI na brzegu sieci**: integracja z Azure IoT Edge i instancjami kontenerów  
- **Chmura hybrydowa AI**: wzorce wdrożeń wielochmurowych i hybrydowych dla obciążeń AI  

#### Zaawansowane funkcje  
- **Automatyzacja pipeline AI**: integracja MLOps z pipeline’ami Azure Machine Learning  
- **Zaawansowane bezpieczeństwo**: wzorce zero-trust, prywatne punkty końcowe i zaawansowana ochrona przed zagrożeniami  
- **Optymalizacja wydajności**: zaawansowane dostrajanie i strategie skalowania dla aplikacji AI o wysokiej przepustowości  
- **Globalna dystrybucja**: wzorce CDN i caching na brzegu dla aplikacji AI  

### Wersja 3.0.0 (Planowana) - zastąpiona przez obecne wydanie  
#### Proponowane dodatki - obecnie zaimplementowane w v3.0.0  
- ✅ **Treści skoncentrowane na AI**: kompleksowa integracja Microsoft Foundry (Zrealizowane)  
- ✅ **Interaktywne tutoriale**: warsztat AI z praktycznymi ćwiczeniami (Zrealizowane)  
- ✅ **Zaawansowany moduł bezpieczeństwa**: wzorce bezpieczeństwa specyficzne dla AI (Zrealizowane)  
- ✅ **Optymalizacja wydajności**: strategie dostrajania dla obciążeń AI (Zrealizowane)  

### Wersja 2.1.0 (Planowana) - częściowo zaimplementowana w v3.0.0  
#### Mniejsze usprawnienia - niektóre ukończone w obecnym wydaniu  
- ✅ **Dodatkowe przykłady**: scenariusze wdrożeń AI (Zrealizowane)  
- ✅ **Rozszerzone FAQ**: pytania i rozwiązywanie problemów specyficzne dla AI (Zrealizowane)  
- **Integracja narzędzi**: przewodniki integracji IDE i edytorów  
- ✅ **Rozszerzenie monitoringu**: wzorce monitoringu i alertów specyficzne dla AI (Zrealizowane)  

#### Nadal planowane na przyszłe wydanie  
- **Dokumentacja przyjazna dla urządzeń mobilnych**: responsywny design do nauki na telefonach  
- **Dostęp offline**: pakiety dokumentacji do pobrania  
- **Zaawansowana integracja IDE**: rozszerzenie VS Code dla AZD + workflow AI  
- **Panel społecznościowy**: realtime metryki społeczności i śledzenie wkładu  

## Współtworzenie changelogu  

### Zgłaszanie zmian  
Podczas współtworzenia tego repozytorium prosimy o uwzględnianie w changelogu:  

1. **Numer wersji**: zgodny z semantic versioning (major.minor.patch)  
2. **Data**: data wydania lub aktualizacji w formacie RRRR-MM-DD  
3. **Kategoria**: Dodano, Zmieniono, Przestarzałe, Usunięto, Naprawiono, Bezpieczeństwo  
4. **Wyraźny opis**: zwięzły opis dokonanej zmiany  
5. **Ocena wpływu**: jak zmiana wpływa na użytkowników  

### Kategorie zmian  

#### Dodano  
- Nowe funkcje, sekcje dokumentacji lub możliwości  
- Nowe przykłady, szablony lub zasoby edukacyjne  
- Dodatkowe narzędzia, skrypty lub narzędzia pomocnicze  

#### Zmieniono  
- Modyfikacje istniejącej funkcjonalności lub dokumentacji  
- Aktualizacje poprawiające jasność lub dokładność  
- Restrukturyzacja treści lub organizacji  

#### Przestarzałe  
- Funkcje lub podejścia wycofywane etapami  
- Sekcje dokumentacji planowane do usunięcia  
- Metody mające lepsze alternatywy  

#### Usunięto  
- Funkcje, dokumentację lub przykłady już nieistotne  
- Przestarzałe informacje lub przestarzałe podejścia  
- Zbędne lub scalone materiały  

#### Naprawiono  
- Poprawki błędów w dokumentacji lub kodzie  
- Rozwiązanie zgłoszonych problemów lub defektów  
- Ulepszenia dokładności lub funkcjonalności  

#### Bezpieczeństwo  
- Poprawki lub ulepszenia bezpieczeństwa  
- Aktualizacje najlepszych praktyk w zakresie bezpieczeństwa  
- Rozwiązanie luk bezpieczeństwa  

### Wytyczne dotyczące wersjonowania semantycznego  

#### Wersja główna (X.0.0)  
- Zmiany łamiące kompatybilność wymagające działań użytkownika  
- Znaczne przebudowy treści lub organizacji  
- Zmiany wpływające na podstawowe podejście lub metodologię  

#### Wersja mniejsza (X.Y.0)  
- Nowe funkcje lub dodanie treści  
- Ulepszenia zachowujące wsteczną kompatybilność  
- Dodatkowe przykłady, narzędzia lub zasoby  

#### Wersja poprawkowa (X.Y.Z)  
- Poprawki błędów i korekty  
- Drobne ulepszenia istniejących materiałów  
- Doprecyzowania i drobne usprawnienia  

## Opinie i sugestie społeczności  

Aktywnie zachęcamy społeczność do przekazywania opinii, aby ulepszać to źródło wiedzy:  

### Jak przekazywać opinie  
- **GitHub Issues**: raportowanie problemów lub sugestie ulepszeń (w tym specyficzne dla AI)  
- **Dyskusje Discord**: dzielenie się pomysłami i uczestnictwo w społeczności Microsoft Foundry  
- **Pull requests**: bezpośrednie ulepszenia treści, zwłaszcza szablonów i przewodników AI  
- **Microsoft Foundry Discord**: udział w kanale #Azure dotyczącego AZD + AI  
- **Forum społeczności**: uczestnictwo w szerszych dyskusjach programistów Azure  

### Kategorie opinii  
- **Dokładność treści AI**: poprawki dotyczące integracji usług AI i informacji o wdrożeniach  
- **Doświadczenie edukacyjne**: sugestie usprawniające przebieg nauki deweloperów AI  
- **Brakujące treści AI**: prośby o dodatkowe szablony, wzorce lub przykłady AI  
- **Dostępność**: ulepszenia dla różnych potrzeb uczących się  
- **Integracja narzędzi AI**: sugestie dotyczące lepszych workflow rozwoju AI  
- **Wzorce produkcyjne AI**: prośby o wzorce wdrożeń korporacyjnych AI  

### Zaangażowanie w odpowiedzi  
- **Reakcja na zgłoszenia**: w ciągu 48 godzin od zgłoszenia problemu  
- **Prośby o funkcje**: ocena w ciągu tygodnia  
- **Wkład społeczności**: przegląd w ciągu tygodnia  
- **Problemy bezpieczeństwa**: priorytet natychmiastowy, szybka reakcja  

## Harmonogram utrzymania  

### Regularne aktualizacje  
- **Miesięczne przeglądy**: weryfikacja dokładności treści i linków  
- **Kwartalne aktualizacje**: główne dodatki i usprawnienia treści  
- **Półroczne przeglądy**: kompleksowa restrukturyzacja i ulepszenia  
- **Roczne wydania**: aktualizacje głównych wersji z ważnymi usprawnieniami  

### Monitorowanie i kontrola jakości  
- **Testy automatyczne**: regularna walidacja przykładów kodu i linków  
- **Integracja opinii społeczności**: regularne uwzględnianie sugestii użytkowników  
- **Aktualizacje technologiczne**: dostosowanie do najnowszych usług Azure i wydań azd  
- **Audyt dostępności**: regularna kontrola zasad inkluzywnego designu  

## Polityka wsparcia wersji  

### Wsparcie obecnej wersji  
- **Najnowsza wersja główna**: pełne wsparcie z regularnymi aktualizacjami  
- **Poprzednia wersja główna**: aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy  
- **Wersje starsze**: wsparcie społecznościowe tylko, brak oficjalnych aktualizacji  

### Wskazówki migracyjne  
Przy wydawaniu głównych wersji zapewniamy:
- **Przewodniki migracji**: Instrukcje krok po kroku dotyczące przejścia
- **Uwagi dotyczące zgodności**: Szczegóły dotyczące zmian łamiących zgodność
- **Wsparcie narzędzi**: Skrypty lub narzędzia pomagające przy migracji
- **Wsparcie społeczności**: Dedykowane fora do pytań dotyczących migracji

---

**Nawigacja**
- **Poprzednia lekcja**: [Study Guide](resources/study-guide.md)
- **Następna lekcja**: Powrót do [Main README](README.md)

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wersjach i ważnych aktualizacjach materiałów edukacyjnych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że staramy się zapewnić dokładność, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego oryginalnym języku powinien być uważany za źródło wiążące. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->