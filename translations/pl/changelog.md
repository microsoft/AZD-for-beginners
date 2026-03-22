# Changelog - AZD dla początkujących

## Wprowadzenie

Ten changelog dokumentuje wszystkie istotne zmiany, aktualizacje i ulepszenia w repozytorium AZD dla początkujących. Stosujemy zasady wersjonowania semantycznego i utrzymujemy ten rejestr, aby pomóc użytkownikom zrozumieć, co zmieniło się pomiędzy wersjami.

## Cele nauki

Przeglądając ten changelog, będziesz:
- Na bieżąco z nowymi funkcjami i dodatkami do treści
- Rozumieć ulepszenia dokonane w istniejącej dokumentacji
- Śledzić poprawki błędów i korekty, aby zapewnić dokładność
- Obserwować rozwój materiałów edukacyjnych w czasie

## Efekty nauki

Po przeglądzie wpisów changeloga będziesz w stanie:
- Zidentyfikować nowe treści i zasoby dostępne do nauki
- Zrozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować swoją ścieżkę nauki na podstawie najnowszych materiałów
- Wnosić opinie i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.18.0] - 2026-03-16

#### Polecenia AZD AI CLI, Walidacja Treści i Rozszerzenie Szablonów
**Ta wersja dodaje pokrycie poleceń `azd ai`, `azd extension` i `azd mcp` we wszystkich rozdziałach związanych ze sztuczną inteligencją, naprawia uszkodzone linki i przestarzały kod w agents.md, aktualizuje cheat sheet oraz całkowicie przebudowuje sekcję Przykładowe Szablony z zweryfikowanymi opisami i nowymi szablonami Azure AI AZD.**

#### Dodano
- **🤖 Pokrycie CLI AZD AI** w 7 plikach (wcześniej tylko w Rozdziale 8):
  - `docs/chapter-01-foundation/azd-basics.md` — nowa sekcja „Rozszerzenia i polecenia AI” wprowadzająca `azd extension`, `azd ai agent init` oraz `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcja 4: `azd ai agent init` z tabelą porównawczą (podejście szablonowe vs manifestowe)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — podsekcje „Rozszerzenia AZD dla Foundry” oraz „Wdrożenie najpierw agenta”
  - `docs/chapter-05-multi-agent/README.md` — szybki start pokazuje teraz ścieżki wdrożenia oparte na szablonach i manifestach
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — sekcja wdrożenia zawiera opcję `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — podsekcja „Polecenia rozszerzenia AZD AI do diagnostyki”
  - `resources/cheat-sheet.md` — nowa sekcja „Polecenia AI i rozszerzeń” z `azd extension`, `azd ai agent init`, `azd mcp` oraz `azd infra generate`
- **📦 Nowe szablony przykładowe AZD AI** w `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET z Blazor WebAssembly, Semantic Kernel i obsługą czatu głosowego
  - **azure-search-openai-demo-java** — chat RAG w Javie z Langchain4J i opcjami wdrożenia ACA/AKS
  - **contoso-creative-writer** — aplikacja do kreatywnego pisania multi-agent z Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — bezserwerowy RAG z Azure Functions + LangChain.js + Cosmos DB z wsparciem lokalnego dewelopmentu Ollama
  - **chat-with-your-data-solution-accelerator** — przedsiębiorczy akcelerator RAG z portalem administracyjnym, integracją Teams i opcjami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — aplikacja referencyjna MCP orkiestracji multi-agent z serwerami w .NET, Python, Java i TypeScript
  - **azd-ai-starter** — minimalny szablon startowy infrastruktury Azure AI w Bicep
  - **🔗 Link do galerii Awesome AZD AI** — odnośnik do [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (ponad 80 szablonów)

#### Naprawiono
- **🔗 Nawigacja agents.md**: linki Poprzedni/Następny teraz odpowiadają kolejności lekcji w README Rozdziału 2 (Integracja Microsoft Foundry → Agenci → Wdrożenie modelu AI)
- **🔗 Uszkodzone linki w agents.md**: `production-ai-practices.md` poprawiono na `../chapter-08-production/production-ai-practices.md` (3 wystąpienia)
- **📦 Zdezaktualizowany kod w agents.md**: zamieniono `opencensus` na `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 Nieprawidłowe API w agents.md**: `max_tokens` przeniesiono z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 Liczenie tokenów w agents.md**: zastąpiono niedokładną estymację `len//4` funkcją `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: poprawiono usługi z „Cognitive Search + App Service” na „Azure AI Search + Azure Container Apps” (domyślny host zmieniony w październiku 2024)
- **contoso-chat**: zaktualizowano opis, aby odzwierciedlał Azure AI Foundry + Prompty, zgodnie z rzeczywistym tytułem i stackiem technologicznym repozytorium

#### Usunięto
- **ai-document-processing**: usunięto odwołania do nieaktywnych szablonów (repozytorium niepubliczne jako szablon AZD)

#### Ulepszono
- **📝 Ćwiczenia w agents.md**: Ćwiczenie 1 pokazuje oczekiwany wynik i krok `azd monitor`; Ćwiczenie 2 zawiera pełen kod rejestracji `FunctionTool`; Ćwiczenie 3 zastępuje niejasne wskazówki konkretnymi poleceniami `prepdocs.py`
- **📚 Zasoby w agents.md**: zaktualizowano linki do dokumentacji na bieżące strony Azure AI Agent Service i quickstart
- **📋 Tabela kolejnych kroków w agents.md**: dodano link do laboratorium AI Workshop dla pełnego omówienia rozdziału

#### Zmodyfikowane pliki
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Ulepszenie nawigacji kursu
**Ta wersja usprawnia nawigację rozdziałową w README.md za pomocą ulepszonej tabeli.**

#### Zmieniono
- **Tabela mapy kursu**: wzbogacona o bezpośrednie linki do lekcji, szacowany czas trwania oraz oceny złożoności
- **Porządkowanie folderów**: usunięto zbędne stare foldery (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Weryfikacja linków**: sprawdzono wszystkie 21+ linków wewnętrznych w tabeli mapy kursu

### [v3.16.0] - 2026-02-05

#### Aktualizacje nazw produktów
**Ta wersja aktualizuje odniesienia produktów do bieżącego brandingu Microsoft.**

#### Zmieniono
- **Microsoft Foundry → Microsoft Foundry**: wszystkie odniesienia zaktualizowane w plikach nie będących tłumaczeniami
- **Azure AI Agent Service → Foundry Agents**: nazwa usługi zaktualizowana, aby odzwierciedlić bieżący branding

#### Zmodyfikowane pliki
- `README.md` - główna strona kursu
- `changelog.md` - historia wersji
- `course-outline.md` - struktura kursu
- `docs/chapter-02-ai-development/agents.md` - przewodnik po agentach AI
- `examples/README.md` - dokumentacja przykładów
- `workshop/README.md` - strona startowa warsztatu
- `workshop/docs/index.md` - indeks warsztatu
- `workshop/docs/instructions/*.md` - wszystkie pliki instrukcji warsztatu

---

### [v3.15.0] - 2026-02-05

#### Duża restrukturyzacja repozytorium: foldery nazwane według rozdziałów
**Ta wersja restrukturyzuje dokumentację do dedykowanych folderów rozdziałowych dla lepszej nawigacji.**

#### Zmiany nazw folderów
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
- **📚 Pliki README rozdziałów**: utworzono README.md w każdym folderze rozdziałów z:
  - celami nauki i czasem trwania
  - tabelą lekcji z opisami
  - poleceniami szybkiego startu
  - nawigacją do pozostałych rozdziałów

#### Zmieniono
- **🔗 Zaktualizowano wszystkie linki wewnętrzne**: ponad 78 ścieżek zaktualizowanych we wszystkich plikach dokumentacji
- **🗺️ Główne README.md**: zaktualizowano mapę kursu z nową strukturą rozdziałów
- **📝 examples/README.md**: zaktualizowano odwołania krzyżowe do folderów rozdziałów

#### Usunięto
- Stara struktura folderów (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturyzacja repozytorium: nawigacja rozdziałowa
**Ta wersja dodała pliki README do nawigacji rozdziałowej (zastąpione przez v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nowy przewodnik po agentach AI
**Ta wersja dodaje kompleksowy przewodnik wdrażania agentów AI za pomocą Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: kompletny przewodnik obejmujący:
  - czym są agenci AI i czym różnią się od chatbotów
  - trzy szybkie szablony startowe agentów (Foundry Agents, Prompty, RAG)
  - wzorce architektury agentów (pojedynczy agent, RAG, multi-agent)
  - konfigurację narzędzi i dostosowanie
  - monitorowanie i śledzenie metryk
  - rozważania kosztowe i optymalizację
  - typowe scenariusze rozwiązywania problemów
  - trzy praktyczne ćwiczenia z kryteriami sukcesu

#### Struktura zawartości
- **Wprowadzenie**: pojęcia agentów dla początkujących
- **Szybki start**: wdrażanie agentów z `azd init --template get-started-with-ai-agents`
- **Wzorce architektury**: wizualizacje wzorców agentów
- **Konfiguracja**: ustawienia narzędzi i zmienne środowiskowe
- **Monitorowanie**: integracja z Application Insights
- **Ćwiczenia**: progresywna nauka praktyczna (20-45 minut każde)

---

### [v3.12.0] - 2026-02-05

#### Aktualizacja środowiska DevContainer
**Ta wersja aktualizuje konfigurację kontenera deweloperskiego z nowoczesnymi narzędziami i lepszymi domyślnymi ustawieniami dla doświadczenia nauki AZD.**

#### Zmieniono
- **🐳 Obraz bazowy**: zaktualizowano z `python:3.12-bullseye` do `python:3.12-bookworm` (najnowsza stabilna wersja Debiana)
- **📛 Nazwa kontenera**: zmieniono z "Python 3" na "AZD for Beginners" dla jasności

#### Dodano
- **🔧 Nowe funkcje Dev Container**:
  - `azure-cli` z włączonym wsparciem dla Bicep
  - `node:20` (wersja LTS dla szablonów AZD)
  - `github-cli` do zarządzania szablonami
  - `docker-in-docker` do wdrożeń aplikacji kontenerowych

- **🔌 Przekierowanie portów**: Prekonfigurowane porty dla typowego środowiska deweloperskiego:
  - 8000 (podgląd MkDocs)
  - 3000 (aplikacje webowe)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nowe rozszerzenia VS Code**:
  - `ms-python.vscode-pylance` – ulepszone IntelliSense dla Pythona
  - `ms-azuretools.vscode-azurefunctions` – wsparcie dla Azure Functions
  - `ms-azuretools.vscode-docker` – wsparcie Dockera
  - `ms-azuretools.vscode-bicep` – wsparcie języka Bicep
  - `ms-azure-devtools.azure-resource-groups` – zarządzanie zasobami Azure
  - `yzhang.markdown-all-in-one` – edycja Markdown
  - `DavidAnson.vscode-markdownlint` – lintowanie Markdown
  - `bierner.markdown-mermaid` – wsparcie diagramów Mermaid
  - `redhat.vscode-yaml` – wsparcie YAML (dla azure.yaml)
  - `eamodio.gitlens` – wizualizacja Git
  - `mhutchie.git-graph` – historia Git

- **⚙️ Ustawienia VS Code**: Dodano domyślne ustawienia dla interpretera Pythona, formatowania przy zapisie i przycinania białych znaków

- **📦 Zaktualizowano requirements-dev.txt**:
  - Dodano wtyczkę do minifikacji MkDocs
  - Dodano pre-commit do kontroli jakości kodu
  - Dodano pakiety Azure SDK (azure-identity, azure-mgmt-resource)

#### Naprawiono
- **Polecenie Post-Create**: Teraz weryfikuje instalację AZD i Azure CLI przy starcie kontenera

---

### [v3.11.0] - 2026-02-05

#### Ulepszenie README przyjaznego dla początkujących
**Ta wersja znacząco poprawia plik README.md, czyniąc go bardziej dostępnym dla początkujących i dodając istotne zasoby dla programistów AI.**

#### Dodano
- **🆚 Porównanie Azure CLI i AZD**: Jasne wyjaśnienie, kiedy używać każdego narzędzia z praktycznymi przykładami
- **🌟 Świetne linki do AZD**: Bezpośrednie linki do galerii szablonów i zasobów dla społeczności:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) – ponad 200 gotowych do wdrożenia szablonów
  - [Prześlij szablon](https://github.com/Azure/awesome-azd/issues) – wkład społeczności
- **🎯 Przewodnik szybkiego startu**: Uproszczona sekcja startowa w 3 krokach (Install → Login → Deploy)
- **📊 Tabela nawigacji według doświadczenia**: Jasne wskazówki, od czego zacząć w zależności od poziomu doświadczenia dewelopera

#### Zmieniono
- **Struktura README**: Przeorganizowana pod kątem kolejności informacji – najważniejsze na początku
- **Sekcja wprowadzenia**: Przepisana, aby wyjaśnić „Magia `azd up`” dla zupełnych początkujących
- **Usunięto powieloną treść**: Eliminacja duplikatu sekcji rozwiązywania problemów
- **Poprawiono polecenia do rozwiązywania problemów**: Naprawa odniesienia do `azd logs` na poprawne `azd monitor --logs`

#### Naprawiono
- **🔐 Polecenia uwierzytelniania**: Dodano `azd auth login` i `azd auth logout` do cheat-sheet.md
- **Nieprawidłowe polecenia usunięte**: Usunięto pozostałe wystąpienia `azd logs` z sekcji rozwiązywania problemów w README

#### Uwagi
- **Zakres**: Zmiany zastosowane w głównym README.md i resources/cheat-sheet.md
- **Grupa docelowa**: Ulepszenia skierowane do deweloperów nowych w AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizacja poprawności poleceń Azure Developer CLI
**Ta wersja koryguje nieistniejące polecenia AZD w całej dokumentacji, zapewniając, że wszystkie przykłady kodu używają prawidłowej składni Azure Developer CLI.**

#### Naprawiono
- **🔧 Usunięcie nieistniejących poleceń AZD**: Kompleksowy audyt i korekta nieprawidłowych poleceń:
  - `azd logs` (nie istnieje) → zastąpione `azd monitor --logs` lub alternatywami Azure CLI
  - Podpolecenia `azd service` (nie istnieją) → zastąpione `azd show` oraz Azure CLI
  - `azd infra import/export/validate` (nie istnieją) → usunięte lub zastąpione poprawnymi alternatywami
  - Flagi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nie istnieją) → usunięte
  - Flagi `azd provision --what-if/--rollback` (nie istnieją) → zmienione na `--preview`
  - `azd config validate` (nie istnieje) → zastąpione `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nie istnieją) → usunięte

- **📚 Pliki zaktualizowane pod kątem poleceń**:
  - `resources/cheat-sheet.md`: Duża aktualizacja poleceń
  - `docs/deployment/deployment-guide.md`: Naprawa rollback i strategii wdrożeń
  - `docs/troubleshooting/debugging.md`: Poprawa sekcji analizy logów
  - `docs/troubleshooting/common-issues.md`: Aktualizacja poleceń do rozwiązywania problemów
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawa sekcji debugowania AZD
  - `docs/getting-started/azd-basics.md`: Korekta poleceń monitorowania
  - `docs/getting-started/first-project.md`: Aktualizacja przykładów monitorowania i debugowania
  - `docs/getting-started/installation.md`: Naprawa przykładów help i version
  - `docs/pre-deployment/application-insights.md`: Poprawa poleceń do przeglądania logów
  - `docs/pre-deployment/coordination-patterns.md`: Naprawa poleceń debugowania agenta

- **📝 Zaktualizowano odniesienia wersji**:
  - `docs/getting-started/installation.md`: Zmieniono hardcodowaną wersję `1.5.0` na ogólną `1.x.x` z linkiem do wydań

#### Zmieniono
- **Strategie rollback**: Zmieniono dokumentację na rollback oparty o Git (AZD nie ma natywnego rollbacku)
- **Przeglądanie logów**: Zastąpiono `azd logs` poleceniami `azd monitor --logs`, `azd monitor --live` i poleceniami Azure CLI
- **Sekcja wydajności**: Usunięto nieistniejące flagi wdrożeń równoległych i przyrostowych, podano prawidłowe alternatywy

#### Dane techniczne
- **Poprawne polecenia AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Poprawne flagi azd monitor**: `--live`, `--logs`, `--overview`
- **Usunięte funkcje**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Uwagi
- **Weryfikacja**: Polecenia sprawdzone na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Zakończenie warsztatów i poprawa jakości dokumentacji
**Ta wersja kończy interaktywne moduły warsztatowe, naprawia wszystkie zepsute linki dokumentacji oraz poprawia ogólną jakość treści dla deweloperów AI korzystających z Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nowy dokument wytycznych dotyczących wkładu, zawierający:
  - Jasne instrukcje zgłaszania problemów i propozycji zmian
  - Standardy dokumentacji dla nowych treści
  - Wytyczne dotyczące przykładów kodu i konwencji commitów
  - Informacje o zaangażowaniu społeczności

#### Ukończono
- **🎯 Moduł warsztatu 7 (Podsumowanie)**: Kompletny moduł podsumowujący z:
  - Obszerne podsumowanie osiągnięć warsztatu
  - Sekcja kluczowych pojęć obejmująca AZD, szablony i Microsoft Foundry
  - Rekomendacje dalszej nauki
  - Ćwiczenia do wyzwań warsztatowych z oceną trudności
  - Linki do opinii społeczności i wsparcia

- **📚 Moduł warsztatu 3 (Deconstruct)**: Zaktualizowane cele nauki z:
  - Instrukcjami aktywacji GitHub Copilot z serwerami MCP
  - Zrozumieniem struktury folderów szablonów AZD
  - Wzorcami infrastruktury jako kod (Bicep)
  - Instrukcjami do zajęć praktycznych

- **🔧 Moduł warsztatu 6 (Teardown)**: Ukończony z:
  - Celami czyszczenia zasobów i zarządzania kosztami
  - Użyciem `azd down` do bezpiecznego odinstalowania infrastruktury
  - Wskazówkami do odzyskiwania usług kognitywnych usuniętych miękko
  - Bonusowymi zadaniami eksploracyjnymi dla GitHub Copilot i Azure Portal

#### Naprawiono
- **🔗 Naprawa zepsutych linków**: Usunięto 15+ uszkodzonych linków wewnętrznych:
  - `docs/ai-foundry/ai-model-deployment.md`: Poprawiono ścieżki do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Skorygowano ścieżki do ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamieniono nieistniejący cicd-integration.md na deployment-guide.md
  - `examples/retail-scenario.md`: Poprawiono linki do FAQ i przewodnika po rozwiązywaniu problemów
  - `examples/container-app/microservices/README.md`: Skorygowano linki do kursu domowego i przewodnika wdrożeń
  - `resources/faq.md` i `resources/glossary.md`: Zaktualizowano odniesienia do rozdziału AI
  - `course-outline.md`: Naprawiono linki do przewodnika instruktora i laboratorium AI

- **📅 Baner statusu warsztatów**: Zmieniono z "W budowie" na aktywny status warsztatu z datą luty 2026

- **🔗 Nawigacja warsztatu**: Naprawiono uszkodzone linki nawigacyjne w pliku README.md warsztatu kierujące do nieistniejącego folderu lab-1-azd-basics

#### Zmieniono
- **Prezentacja warsztatu**: Usunięto ostrzeżenie o "w budowie", warsztat jest kompletny i gotowy do użytku
- **Spójność nawigacji**: Zapewniono poprawną nawigację między wszystkimi modułami warsztatu
- **Odwołania do ścieżki nauki**: Zaktualizowano odnośniki do rozdziałów microsoft-foundry z poprawnymi ścieżkami

#### Zweryfikowano
- ✅ Wszystkie angielskie pliki markdown mają poprawne linki wewnętrzne
- ✅ Moduły warsztatowe 0-7 są kompletne z celami nauki
- ✅ Nawigacja między rozdziałami i modułami działa poprawnie
- ✅ Treść jest odpowiednia dla deweloperów AI korzystających z Microsoft AZD
- ✅ Utrzymany jest język i struktura przyjazna dla początkujących
- ✅ CONTRIBUTING.md zawiera jasne wytyczne dla społeczności

#### Implementacja techniczna
- **Walidacja linków**: Automatyczny skrypt PowerShell zweryfikował wszystkie linki .md
- **Audyt treści**: Ręczna kontrola kompletności warsztatu i przyjazności dla początkujących
- **System nawigacyjny**: Stosowanie spójnych wzorców nawigacji rozdziałów i modułów

#### Uwagi
- **Zakres**: Zmiany zastosowane wyłącznie w dokumentacji angielskiej
- **Tłumaczenia**: Foldery tłumaczeń nie były aktualizowane w tej wersji (tłumaczenia zostaną zsynchronizowane automatycznie później)
- **Czas trwania warsztatu**: Kompletny warsztat zapewnia 3-4 godziny nauki praktycznej

---

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: monitorowanie, bezpieczeństwo i wzorce wieloagentowe
**Ta wersja dodaje kompleksowe lekcje klasy A dotyczące integracji Application Insights, wzorców uwierzytelniania i koordynacji wieloagentowej dla wdrożeń produkcyjnych.**

#### Dodano
- **📊 Lekcja integracji Application Insights** w `docs/pre-deployment/application-insights.md`:
  - Wdrożenia skoncentrowane na AZD z automatycznym provisioningiem
  - Kompletny szablon Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z własną telemetrią (ponad 1 200 linii)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów modeli Microsoft Foundry)
  - 6 diagramów Mermaid (architektura, śledzenie rozproszone, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, pulpity, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Przesyłanie metryk na żywo i debugowanie w czasie rzeczywistym
  - Czas nauki 40-50 minut z wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i bezpieczeństwa** w `docs/getting-started/authsecurity.md`:
  - 3 wzorce uwierzytelniania (connection strings, Key Vault, zarządzana tożsamość)
  - Kompletny szablon infrastruktury w Bicep dla bezpiecznych wdrożeń
  - Kod aplikacji Node.js z integracją Azure SDK
  - 3 kompletne ćwiczenia (włączanie tożsamości zarządzanej, tożsamości przypisanej przez użytkownika, rotacja Key Vault)
  - Najlepsze praktyki bezpieczeństwa i konfiguracje RBAC
  - Przewodnik rozwiązywania problemów i analiza kosztów
  - Wzorce uwierzytelniania bezhasłowego gotowe do produkcji

- **🤖 Lekcja wzorców koordynacji wieloagentowej** w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Kompletny przykład implementacji usługi orkiestratora (Python/Flask, ponad 1500 linii)
  - 3 wyspecjalizowane implementacje agentów (Research, Writer, Editor)
  - Integracja Service Bus do kolejkowania wiadomości
  - Zarządzanie stanem w Cosmos DB dla systemów rozproszonych
  - 6 diagramów Mermaid pokazujących interakcje agentów
  - 3 zaawansowane ćwiczenia (obsługa limitów czasowych, logika ponawiania, breaker)
  - Analiza kosztów ($240-565/miesiąc) z propozycjami optymalizacji
  - Integracja Application Insights do monitorowania

#### Ulepszono
- **Rozdział pre-deployment**: Teraz zawiera kompleksowe wzorce monitorowania i koordynacji
- **Rozdział getting started**: Wzbogacony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Pełne pokrycie od bezpieczeństwa po obserwowalność
- **Konspekt kursu**: Zaktualizowany o odwołania do nowych lekcji w rozdziałach 3 i 6

#### Zmieniono
- **Postęp nauki**: Lepsza integracja bezpieczeństwa i monitorowania w całym kursie
- **Jakość dokumentacji**: Spójność standardów klasy A (95-97%) we wszystkich nowych lekcjach
- **Wzorce produkcyjne**: Kompleksowe omówienie end-to-end dla wdrożeń korporacyjnych

#### Ulepszono

- **Doświadczenie programisty**: Jasna ścieżka od tworzenia do monitorowania produkcji  
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania sekretami  
- **Obserwowalność**: Kompletną integrację Application Insights z AZD  
- **Obciążenia AI**: Specjalistyczny monitoring dla modeli Microsoft Foundry i systemów wieloagentowych  

#### Zweryfikowano  
- ✅ Wszystkie lekcje zawierają kompletny, działający kod (nie fragmenty)  
- ✅ Diagramy Mermaid dla wizualnej nauki (łącznie 19 w 3 lekcjach)  
- ✅ Ćwiczenia praktyczne z krokami weryfikacji (łącznie 9)  
- ✅ Szablony Bicep gotowe do produkcji, wdrażalne za pomocą `azd up`  
- ✅ Analiza kosztów i strategie optymalizacji  
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki  
- ✅ Punkty kontrolne wiedzy z poleceniami weryfikacyjnymi  

#### Wyniki oceny dokumentacji  
- **docs/pre-deployment/application-insights.md**: - Kompleksowy przewodnik monitorowania  
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa  
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury wieloagentowe  
- **Nowa zawartość ogółem**: - Spójne wysokie standardy jakości  

#### Implementacja techniczna  
- **Application Insights**: Log Analytics + niestandardowa telemetria + rozproszone śledzenie  
- **Uwierzytelnianie**: Managed Identity + Key Vault + wzorce RBAC  
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkiestracja  
- **Monitorowanie**: Metryki na żywo + zapytania Kusto + alerty + pulpity nawigacyjne  
- **Zarządzanie kosztami**: Strategie próbnikowania, zasady retencji, kontrola budżetu  

### [v3.7.0] - 2025-11-19  

#### Poprawki jakości dokumentacji i nowy przykład Microsoft Foundry Models  
**Ta wersja poprawia jakość dokumentacji w całym repozytorium i dodaje kompletny przykład wdrożenia Microsoft Foundry Models z interfejsem czatu gpt-4.1.**  

#### Dodano  
- **🤖 Przykład czatu Microsoft Foundry Models**: Pełne wdrożenie gpt-4.1 z działającą implementacją w `examples/azure-openai-chat/`:  
  - Kompletną infrastrukturę Microsoft Foundry Models (wdrożenie modelu gpt-4.1)  
  - Interfejs czatu w Pythonie z historią konwersacji  
  - Integrację z Key Vault dla bezpiecznego przechowywania kluczy API  
  - Śledzenie użycia tokenów i szacowanie kosztów  
  - Ograniczanie przepustowości i obsługę błędów  
  - Kompleksowy README z przewodnikiem wdrożenia (35-45 minut)  
  - 11 plików gotowych do produkcji (szablony Bicep, aplikacja Python, konfiguracja)  
- **📚 Ćwiczenia w dokumentacji**: Dodano praktyczne ćwiczenia do przewodnika po konfiguracji:  
  - Ćwiczenie 1: Konfiguracja wielośrodowiskowa (15 minut)  
  - Ćwiczenie 2: Praktyka zarządzania sekretami (10 minut)  
  - Jasne kryteria sukcesu i kroki weryfikacji  
- **✅ Weryfikacja wdrożenia**: Dodano sekcję weryfikacyjną do przewodnika wdrożenia:  
  - Procedury kontroli stanu zdrowia  
  - Lista kontrolna kryteriów sukcesu  
  - Oczekiwane wyniki wszystkich poleceń wdrożeniowych  
  - Szybkie odniesienie do rozwiązywania problemów  

#### Ulepszono  
- **examples/README.md**: Aktualizacja do jakości A (93%):  
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji  
  - Zwiększono liczbę lokalnych przykładów z 3 do 4  
  - Dodano do tabeli z przykładami aplikacji AI  
  - Zintegrowano z przewodnikiem szybkiego startu dla użytkowników średniozaawansowanych  
  - Dodano do sekcji Microsoft Foundry Templates  
  - Zaktualizowano macierz porównań i sekcje dotyczące technologii  
- **Jakość dokumentacji**: Poprawa B+ (87%) → A- (92%) w folderze docs:  
  - Dodano oczekiwane wyjścia do krytycznych przykładów poleceń  
  - Uwzględniono kroki weryfikacyjne dla zmian konfiguracji  
  - Wzbogacono naukę praktyczną o ćwiczenia  

#### Zmieniono  
- **Postęp w nauce**: Lepsza integracja przykładów AI dla użytkowników średniozaawansowanych  
- **Struktura dokumentacji**: Bardziej praktyczne ćwiczenia z jasnymi wynikami  
- **Proces weryfikacji**: Dodano wyraźne kryteria sukcesu do kluczowych przepływów pracy  

#### Udoskonalono  
- **Doświadczenie programisty**: Wdrożenie Microsoft Foundry Models zajmuje teraz 35-45 minut (w porównaniu do 60-90 przy złożonych alternatywach)  
- **Przejrzystość kosztów**: Jasne szacunki kosztów ($50-200/miesiąc) dla przykładu Microsoft Foundry Models  
- **Ścieżka nauki**: Deweloperzy AI mają jasny punkt startu z azure-openai-chat  
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacji  

#### Zweryfikowano  
- ✅ Przykład Microsoft Foundry Models w pełni funkcjonalny z `azd up`  
- ✅ Wszystkie 11 plików implementacyjnych poprawne składniowo  
- ✅ Instrukcje README zgadzają się z rzeczywistym doświadczeniem wdrożenia  
- ✅ Linki w dokumentacji zaktualizowane w ponad 8 lokalizacjach  
- ✅ Indeks przykładów dokładnie odzwierciedla 4 lokalne przykłady  
- ✅ Brak duplikatów linków zewnętrznych w tabelach  
- ✅ Wszystkie odwołania nawigacyjne poprawne  

#### Implementacja techniczna  
- **Architektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + wzorzec Container Apps  
- **Bezpieczeństwo**: Managed Identity gotowy, sekrety w Key Vault  
- **Monitorowanie**: Integracja Application Insights  
- **Zarządzanie kosztami**: Śledzenie tokenów i optymalizacja wykorzystania  
- **Wdrożenie**: Pojedyncze polecenie `azd up` do kompletnej konfiguracji  

### [v3.6.0] - 2025-11-19  

#### Główna aktualizacja: Przykłady wdrożeń Container App  
**Ta wersja wprowadza kompleksowe, produkcyjne przykłady wdrożeń aplikacji kontenerowych za pomocą Azure Developer CLI (AZD), z pełną dokumentacją i integracją w ścieżkę nauki.**  

#### Dodano  
- **🚀 Przykłady aplikacji kontenerowych**: Nowe lokalne przykłady w `examples/container-app/`:  
  - [Przewodnik główny](examples/container-app/README.md): Kompletny przegląd wdrożeń konteneryzowanych, szybki start, produkcja i wzorce zaawansowane  
  - [Proste API Flask](../../examples/container-app/simple-flask-api): Przyjazne dla początkujących REST API z autoskalowaniem do zera, health probes, monitoringiem i rozwiązywaniem problemów  
  - [Architektura mikrousług](../../examples/container-app/microservices): Produkcyjne wdrożenie wielu usług (API Gateway, Produkt, Zamówienie, Użytkownik, Powiadomienia), asynchroniczne przesyłanie komunikatów, Service Bus, Cosmos DB, Azure SQL, rozproszone śledzenie, wdrożenia blue-green/canary  
- **Najlepsze praktyki**: Bezpieczeństwo, monitorowanie, optymalizacja kosztów i wskazówki CI/CD dla obciążeń kontenerowych  
- **Przykłady kodu**: Kompletny `azure.yaml`, szablony Bicep oraz wielojęzyczne implementacje usług (Python, Node.js, C#, Go)  
- **Testowanie i rozwiązywanie problemów**: Scenariusze testów end-to-end, polecenia monitorujące, przewodniki rozwiązywania problemów  

#### Zmieniono  
- **README.md**: Zaktualizowano, aby prezentować i linkować nowe przykłady aplikacji kontenerowych w sekcji „Local Examples - Container Applications”  
- **examples/README.md**: Zaktualizowano, aby wyróżnić przykłady aplikacji kontenerowych, dodać wpisy do macierzy porównań i zaktualizować odniesienia technologiczne/architektoniczne  
- **Konspekt kursu i przewodnik nauki**: Zaktualizowano, aby odnosić się do nowych przykładów aplikacji kontenerowych i wzorców wdrożenia w odpowiednich rozdziałach  

#### Zweryfikowano  
- ✅ Wszystkie nowe przykłady możliwe do wdrożenia za pomocą `azd up` i zgodne z najlepszymi praktykami  
- ✅ Zaktualizowano powiązania dokumentacji i nawigację  
- ✅ Przykłady obejmują scenariusze od początkujących do zaawansowanych, w tym mikrousługi produkcyjne  

#### Uwagi  
- **Zakres**: Tylko dokumentacja i przykłady w języku angielskim  
- **Dalsze kroki**: Rozszerzenie o dodatkowe wzorce kontenerowe i automatyzację CI/CD w przyszłych wersjach  

### [v3.5.0] - 2025-11-19  

#### Rebranding produktu: Microsoft Foundry  
**Ta wersja wprowadza kompleksową zmianę nazwy produktu z "Microsoft Foundry" na "Microsoft Foundry" we wszystkich anglojęzycznych materiałach dokumentacyjnych, odzwierciedlając oficjalny rebranding Microsoft.**  

#### Zmieniono  
- **🔄 Aktualizacja nazwy produktu**: Kompletny rebranding z "Microsoft Foundry" na "Microsoft Foundry"  
  - Zaktualizowano wszystkie odniesienia w anglojęzycznej dokumentacji w folderze `docs/`  
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Łącznie zaktualizowano 23 odniesienia w 7 plikach dokumentacji  

- **📁 Zmiany struktury folderów**:  
  - `docs/ai-foundry/` przemianowano na `docs/microsoft-foundry/`  
  - Wszystkie odniesienia krzyżowe zaktualizowane do nowej struktury folderów  
  - Linki nawigacyjne zweryfikowane we wszystkich materiałach  

- **📄 Zmiany nazw plików**:  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Wszystkie linki wewnętrzne zaktualizowano na nową nazwę pliku  

#### Zaktualizowane pliki  
- **Dokumentacja rozdziałowa** (7 plików):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizacje nazw produktu  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - już używa Microsoft Foundry (z poprzednich aktualizacji)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizacje (przegląd, opinie społeczności, dokumentacja)  
  - `docs/getting-started/azd-basics.md` - 4 aktualizacje linków krzyżowych  
  - `docs/getting-started/first-project.md` - 2 aktualizacje linków rozdziałów  
  - `docs/getting-started/installation.md` - 2 aktualizacje linków do następnego rozdziału  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizacje (nawigacja, społeczność Discord)  
  - `docs/troubleshooting/common-issues.md` - 1 aktualizacja linku nawigacyjnego  
  - `docs/troubleshooting/debugging.md` - 1 aktualizacja linku nawigacyjnego  

- **Pliki struktury kursu** (2 pliki):  
  - `README.md` - 17 aktualizacji odniesień (przegląd kursu, tytuły rozdziałów, sekcja szablonów, społeczność)  
  - `course-outline.md` - 14 aktualizacji odniesień (przegląd, cele nauki, zasoby rozdziałów)  

#### Zweryfikowano  
- ✅ Brak pozostałych odniesień do folderu "ai-foundry" w dokumentacji anglojęzycznej  
- ✅ Brak pozostałych odniesień do nazwy produktu "Microsoft Foundry" w dokumentacji anglojęzycznej  
- ✅ Wszystkie linki nawigacyjne działają poprawnie z nową strukturą folderów  
- ✅ Pomysły na zmiany nazw plików i folderów zakończone powodzeniem  
- ✅ Zweryfikowano poprawność odwołań między rozdziałami  

#### Uwagi  
- **Zakres**: Zmiany zastosowano tylko w dokumentacji anglojęzycznej w folderze `docs/`  
- **Tłumaczenia**: Foldery tłumaczeń (`translations/`) nie zostały zaktualizowane w tej wersji  
- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie zostały zaktualizowane w tej wersji  
- **Przykłady**: Pliki przykładów mogą nadal zawierać nazwę dziedziczną (do poprawy w przyszłej aktualizacji)  
- **Linki zewnętrzne**: Zewnętrzne URL i odwołania do repozytorium GitHub pozostają niezmienione  

#### Przewodnik migracji dla współtwórców  
Jeśli masz lokalne gałęzie lub dokumentację odnoszącą się do starej struktury:  
1. Zaktualizuj odniesienia folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. Zaktualizuj odniesienia plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. Zamień nazwę produktu: "Microsoft Foundry" → "Microsoft Foundry"  
4. Zweryfikuj, czy wszystkie linki w dokumentacji nadal działają poprawnie  

---  

### [v3.4.0] - 2025-10-24  

#### Podgląd infrastruktury i ulepszenia weryfikacji  
**Ta wersja wprowadza kompleksowe wsparcie nowej funkcji podglądu Azure Developer CLI oraz poprawia doświadczenia użytkowników warsztatów.**  

#### Dodano  
- **🧪 Dokumentacja funkcji azd provision --preview**: Kompleksowe omówienie nowej funkcji podglądu infrastruktury  
  - Referencje poleceń i przykłady użycia w ściągawce  
  - Szczegółowa integracja w przewodniku po provisioning z przypadkami użycia i korzyściami  
  - Integracja kontroli przed wdrożeniem dla bezpieczniejszej weryfikacji  
  - Aktualizacje przewodnika startowego z naciskiem na bezpieczne praktyki wdrożeniowe  
- **🚧 Baner statusu warsztatu**: Profesjonalny baner HTML wskazujący status rozwoju warsztatu  
  - Design gradientowy z wskaźnikami konstrukcji dla jasnej komunikacji z użytkownikiem  
  - Data ostatniej aktualizacji dla przejrzystości  
  - Responsywny design, dostosowany do wszystkich typów urządzeń  

#### Ulepszono  
- **Bezpieczeństwo infrastruktury**: Funkcjonalność podglądu zintegrowana w całej dokumentacji wdrożenia  
- **Weryfikacja przed wdrożeniem**: Automatyczne skrypty teraz uwzględniają testowanie podglądu infrastruktury  
- **Przepływ pracy programisty**: Zaktualizowane sekwencje poleceń, uwzględniające podgląd jako najlepszą praktykę  
- **Doświadczenie warsztatu**: Jasne oczekiwania wobec użytkowników dotyczące statusu rozwoju materiałów  

#### Zmieniono  
- **Najlepsze praktyki wdrażania**: Rekomendowany teraz przepływ pracy "preview-first"  
- **Przepływ dokumentacji**: Walidacja infrastruktury przeniesiona na wcześniejszy etap nauki  
- **Prezentacja warsztatu**: Profesjonalna komunikacja statusu z przejrzystym harmonogramem rozwoju  

#### Ulepszono  
- **Podejście safety-first**: Zmiany infrastruktury można teraz zweryfikować przed wdrożeniem  
- **Współpraca zespołowa**: Wyniki podglądu można udostępnić do przeglądu i akceptacji  
- **Świadomość kosztów**: Lepsze rozumienie kosztów zasobów przed provisioningiem  
- **Redukcja ryzyka**: Mniejsze prawdopodobieństwo niepowodzeń wdrożenia dzięki wcześniejszej weryfikacji  

#### Implementacja techniczna  
- **Integracja wielodokumentowa**: Funkcja podglądu udokumentowana w 4 kluczowych plikach  
- **Wzorce poleceń**: Spójna składnia i przykłady w całej dokumentacji  
- **Integracja najlepszych praktyk**: Podgląd uwzględniony w workflow weryfikacji i skryptach  
- **Wskaźniki wizualne**: Wyraźne oznaczenia NOWOŚCI dla łatwości odnalezienia  

#### Infrastruktura warsztatu  
- **Komunikacja statusu**: Profesjonalny baner HTML ze stylem gradientowym  
- **Doświadczenie użytkownika**: Jasny status rozwoju zapobiega nieporozumieniom  
- **Profesjonalna prezentacja**: Utrzymuje wiarygodność repozytorium, ustawiając oczekiwania  
- **Przejrzystość harmonogramu**: Data ostatniej aktualizacji październik 2025 dla odpowiedzialności  

### [v3.3.0] - 2025-09-24  

#### Ulepszone materiały warsztatowe i interaktywne doświadczenie nauki  
**Ta wersja wprowadza kompleksowe materiały warsztatowe z przeglądarkowymi przewodnikami interaktywnymi oraz ustrukturyzowanymi ścieżkami nauki.**  

#### Dodano  
- **🎥 Interaktywny Przewodnik Warsztatowy**: Warsztat w przeglądarce z możliwością podglądu MkDocs  
- **📝 Ustrukturyzowane Instrukcje Warsztatowe**: 7-etapowa ścieżka nauki od odkrycia do dostosowania  
  - 0-Wprowadzenie: Przegląd warsztatu i konfiguracja  
  - 1-Wybór-Szablonu-AI: Proces odkrywania i wyboru szablonu  
  - 2-Walidacja-Szablonu-AI: Procedury wdrożenia i walidacji  
  - 3-Dekonstrukcja-Szablonu-AI: Zrozumienie architektury szablonu  
  - 4-Konfiguracja-Szablonu-AI: Konfiguracja i dostosowanie  
  - 5-Dostosowanie-Szablonu-AI: Zaawansowane modyfikacje i iteracje  
  - 6-Zamknięcie-Infrastruktury: Sprzątanie i zarządzanie zasobami  
  - 7-Podsumowanie: Streszczenie i kolejne kroki  
- **🛠️ Narzędzia Warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia nauki  
- **🎯 Praktyczna Ścieżka Nauki**: 3-etapowa metodologia (Odkrywanie → Wdrożenie → Dostosowanie)  
- **📱 Integracja GitHub Codespaces**: Bezproblemowa konfiguracja środowiska deweloperskiego  

#### Ulepszone  
- **Laboratorium Warsztatu AI**: Rozszerzone o kompleksowy, 2-3 godzinny ustrukturyzowany kurs  
- **Dokumentacja Warsztatowa**: Profesjonalna prezentacja z nawigacją i materiałami wizualnymi  
- **Postęp w Nauczaniu**: Jasne, krok po kroku, od wyboru szablonu do wdrożenia produkcyjnego  
- **Doświadczenie Dewelopera**: Zintegrowane narzędzia dla usprawnionych przepływów pracy  

#### Ulepszone  
- **Dostępność**: Interfejs przeglądarkowy z wyszukiwaniem, kopiowaniem i przełączaniem motywów  
- **Samodzielna Nauka**: Elastyczna struktura warsztatu dopasowująca się do tempa użytkownika  
- **Praktyczne Zastosowanie**: Scenariusze wdrażania szablonów AI w rzeczywistych warunkach  
- **Integracja z Społecznością**: Zintegrowany Discord dla wsparcia i współpracy na warsztatach  

#### Funkcje Warsztatu  
- **Wbudowane Wyszukiwanie**: Szybkie odnajdywanie słów kluczowych i lekcji  
- **Kopiuj Bloki Kodów**: Funkcjonalność kopiowania po najechaniu na przykłady kodu  
- **Przełącznik Motywu**: Tryb ciemny/jasny dla różnych preferencji  
- **Materiały Wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia  
- **Integracja Pomocy**: Bezpośredni dostęp do Discorda dla wsparcia społeczności  

### [v3.2.0] - 2025-09-17  

#### Główna restrukturyzacja nawigacji i system nauki oparty na rozdziałach  
**Wersja ta wprowadza kompleksową strukturę opartą na rozdziałach z ulepszoną nawigacją w całym repozytorium.**  

#### Dodano  
- **📚 System nauki oparty na rozdziałach**: Przekształcono cały kurs w 8 progresywnych rozdziałów nauki  
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 min)  
  - Rozdział 2: Rozwój z myślą o AI (⭐⭐ - 1-2 godziny)  
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 min)  
  - Rozdział 4: Infrastruktura jako kod i wdrożenie (⭐⭐⭐ - 1-1,5 godziny)  
  - Rozdział 5: Wieloagentowe rozwiązania AI (⭐⭐⭐⭐ - 2-3 godziny)  
  - Rozdział 6: Walidacja i planowanie przedwdrożeniowe (⭐⭐ - 1 godzina)  
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)  
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)  
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacyjne we wszystkich dokumentach  
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki  
- **🗺️ Wskazówki ścieżki nauki**: Jasne punkty startowe dla różnych poziomów doświadczenia i celów  
- **🔗 Nawigacja krzyżowa**: Powiązane rozdziały i wymagania wstępne jasno połączone  

#### Ulepszone  
- **Struktura README**: Przekształcone w platformę naukową z organizacją na rozdziały  
- **Nawigacja dokumentacji**: Każda strona zawiera kontekst rozdziału i wskazówki dotyczące postępów  
- **Organizacja szablonów**: Przykłady i szablony powiązane z odpowiednimi rozdziałami nauki  
- **Integracja zasobów**: Ściągawki, FAQ i przewodniki powiązane z odpowiednimi rozdziałami  
- **Integracja warsztatów**: Laboratoria praktyczne powiązane z celami nauki wielu rozdziałów  

#### Zmiany  
- **Postęp nauki**: Przesunięcie z liniowej dokumentacji do elastycznej nauki opartej na rozdziałach  
- **Lokalizacja konfiguracji**: Przeniesiono przewodnik konfiguracji do rozdziału 3 dla lepszego przepływu nauki  
- **Integracja treści AI**: Lepsze włączenie treści specyficznych dla AI na całej ścieżce nauki  
- **Treść produkcyjna**: Zaawansowane wzorce zebrane w rozdziale 8 dla odbiorców korporacyjnych  

#### Ulepszone  
- **Doświadczenie użytkownika**: Jasne nawigacyjne okruszki chleba i wskaźniki postępów rozdziałów  
- **Dostępność**: Spójne wzory nawigacji ułatwiające poruszanie się po kursie  
- **Profesjonalna prezentacja**: Struktura kursu na poziomie uniwersyteckim, odpowiednia dla szkoleń akademickich i korporacyjnych  
- **Wydajność nauki**: Skrócony czas znajdowania odpowiednich treści dzięki lepszej organizacji  

#### Implementacja techniczna  
- **Nagłówki nawigacji**: Standaryzowana nawigacja rozdziałowa w ponad 40 plikach dokumentacji  
- **Stopka nawigacji**: Spójne wskazówki dotyczące postępów i wskaźniki ukończenia rozdziałów  
- **Linkowanie krzyżowe**: Kompleksowy system linków łączący powiązane pojęcia  
- **Mapowanie rozdziałów**: Jasne powiązania szablonów i przykładów z celami nauki  

#### Ulepszenie przewodnika naukowego  
- **📚 Kompleksowe cele nauki**: Przebudowany przewodnik nauczania dostosowany do systemu 8 rozdziałów  
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera specyficzne cele nauki i ćwiczenia praktyczne  
- **📋 Śledzenie postępów**: Tygodniowy harmonogram nauki z mierzalnymi rezultatami i listami kontrolnymi ukończenia  
- **❓ Pytania oceniające**: Pytania weryfikujące wiedzę dla każdego rozdziału z profesjonalnymi efektami  
- **🛠️ Ćwiczenia praktyczne**: Warsztaty z rzeczywistymi scenariuszami wdrożeń i rozwiązywania problemów  
- **📊 Progres umiejętności**: Jasny postęp od podstawowych koncepcji do wzorców korporacyjnych z nastawieniem na rozwój kariery  
- **🎓 Ramy certyfikacji**: Wyniki rozwoju zawodowego i system uznania społecznościowego  
- **⏱️ Zarządzanie harmonogramem**: Ustrukturyzowany 10-tygodniowy plan nauki z walidacją kamieni milowych  

### [v3.1.0] - 2025-09-17  

#### Ulepszone rozwiązania wieloagentowe AI  
**Ta wersja poprawia wieloagentowe rozwiązanie handlowe z lepszym nazywaniem agentów i ulepszoną dokumentacją.**  

#### Zmiany  
- **Terminologia wieloagentowa**: Zastąpiono „agent Cora” nazwą „agent Klienta” w całym rozwiązaniu wieloagentowym dla handlu detalicznego dla lepszej jasności  
- **Architektura agentów**: Zaktualizowano całą dokumentację, szablony ARM i przykłady kodu, aby konsekwentnie używać nazwy „agent Klienta”  
- **Przykłady konfiguracji**: Zmodernizowano wzorce konfiguracji agentów z aktualizacją konwencji nazewnictwa  
- **Spójność dokumentacji**: Zapewniono, że wszystkie odniesienia używają profesjonalnych, opisowych nazw agentów  

#### Ulepszone  
- **Pakiet szablonów ARM**: Zaktualizowano retail-multiagent-arm-template z odniesieniami do agenta Klienta  
- **Diagramy architektury**: Odświeżone diagramy Mermaid ze zaktualizowanymi nazwami agentów  
- **Przykłady kodu**: Klasy Pythona i przykłady implementacji teraz używają nazwy CustomerAgent  
- **Zmienne środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe do stosowania konwencji CUSTOMER_AGENT_NAME  

#### Ulepszone  
- **Doświadczenie programisty**: Bardziej przejrzyste role i odpowiedzialności agentów w dokumentacji  
- **Gotowość produkcyjna**: Lepsze dopasowanie do korporacyjnych konwencji nazewnictwa  
- **Materiały edukacyjne**: Intuicyjniejsze nazwy agentów dla celów dydaktycznych  
- **Użyteczność szablonów**: Uproszczone rozumienie funkcji i wzorców wdrożenia agentów  

#### Szczegóły techniczne  
- Zaktualizowane diagramy architektury Mermaid z odniesieniami do CustomerAgent  
- Zastąpiono nazwy klas CoraAgent nazwami CustomerAgent w przykładach Pythona  
- Zmodyfikowano konfiguracje JSON szablonów ARM na typ agenta „customer”  
- Zmieniono zmienne środowiskowe z CORA_AGENT_* na CUSTOMER_AGENT_*  
- Odświeżono wszystkie polecenia wdrożeniowe i konfiguracje kontenerów  

### [v3.0.0] - 2025-09-12  

#### Główne zmiany - Skupienie na deweloperach AI i integracja Microsoft Foundry  
**Ta wersja przekształca repozytorium w kompleksowe źródło nauki skoncentrowane na AI z integracją Microsoft Foundry.**  

#### Dodano  
- **🤖 Ścieżka nauki AI-First**: Pełna restrukturyzacja z priorytetem dla deweloperów i inżynierów AI  
- **Przewodnik integracji Microsoft Foundry**: Kompleksowa dokumentacja połączenia AZD z usługami Microsoft Foundry  
- **Wzorce wdrożeń modeli AI**: Szczegółowy przewodnik obejmujący wybór modelu, konfigurację i strategie wdrożenia produkcyjnego  
- **Laboratorium warsztatu AI**: 2-3 godzinny praktyczny warsztat zamiany aplikacji AI na rozwiązania możliwe do wdrożenia przez AZD  
- **Najlepsze praktyki dla produkcji AI**: Korporacyjne wzorce skalowania, monitorowania i zabezpieczania obciążeń AI  
- **Specjalistyczny przewodnik rozwiązywania problemów AI**: Kompleksowe rozwiązywanie problemów z Microsoft Foundry Models, Cognitive Services i problemami wdrożeniowymi AI  
- **Galeria szablonów AI**: Wyselekcjonowana kolekcja szablonów Microsoft Foundry z oceną złożoności  
- **Materiały warsztatowe**: Kompletna struktura warsztatów z laboratoriami i materiałami referencyjnymi  

#### Ulepszone  
- **Struktura README**: Skoncentrowana na deweloperach AI z 45% danych o zainteresowaniu społeczności z Discord Microsoft Foundry  
- **Ścieżki nauki**: Dedykowana ścieżka dla deweloperów AI obok tradycyjnych ścieżek dla studentów i inżynierów DevOps  
- **Rekomendacje szablonów**: Wybrane szablony AI, w tym azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart  
- **Integracja społecznościowa**: Wzmocnione wsparcie Discord z kanałami i dyskusjami specyficznymi dla AI  

#### Skupienie na bezpieczeństwie i produkcji  
- **Wzorce zarządzanych tożsamości**: Uwierzytelnianie i konfiguracje bezpieczeństwa specyficzne dla AI  
- **Optymalizacja kosztów**: Śledzenie użycia tokenów i sterowanie budżetem dla obciążeń AI  
- **Wielo-regionowe wdrożenia**: Strategie globalnego wdrażania aplikacji AI  
- **Monitorowanie wydajności**: Specyficzne metryki AI i integracja z Application Insights  

#### Jakość dokumentacji  
- **Liniowa struktura kursu**: Logiczna progresja od początkujących do zaawansowanych wzorców wdrożeń AI  
- **Zweryfikowane adresy URL**: Wszystkie zewnętrzne linki do repozytoriów zweryfikowane i dostępne  
- **Kompletne odniesienia**: Wszystkie wewnętrzne linki dokumentacji sprawdzone i działające  
- **Gotowość produkcyjna**: Wzorce wdrożeń korporacyjnych z przykładami rzeczywistymi  

### [v2.0.0] - 2025-09-09  

#### Główne zmiany - Restrukturyzacja repozytorium i profesjonalne udoskonalenia  
**Wersja ta oznacza znaczący przegląd struktury repozytorium i prezentacji treści.**  

#### Dodano  
- **Ustrukturyzowany framework nauki**: Wszystkie strony dokumentacji zawierają teraz sekcje Wprowadzenie, Cele nauki i Osiągnięcia nauki  
- **System nawigacji**: Dodano linki do Poprzedniej/Następnej lekcji w całej dokumentacji dla kierowanej progresji nauki  
- **Przewodnik nauki**: Kompleksowy study-guide.md z celami naukowymi, ćwiczeniami praktycznymi i materiałami oceniającymi  
- **Profesjonalna prezentacja**: Usunięto wszystkie emotikony dla lepszej dostępności i profesjonalnego wyglądu  
- **Udoskonalona struktura treści**: Poprawiona organizacja i przepływ materiałów naukowych  

#### Zmiany  
- **Format dokumentacji**: Standaryzacja całej dokumentacji z konsekwentną strukturą skoncentrowaną na nauce  
- **Przepływ nawigacji**: Wdrożono logiczną progresję przez wszystkie materiały edukacyjne  
- **Prezentacja treści**: Usunięto elementy dekoracyjne na rzecz jasnego, profesjonalnego formatowania  
- **Struktura linków**: Zaktualizowano wszystkie linki wewnętrzne, aby wspierać nowy system nawigacji  

#### Ulepszone  
- **Dostępność**: Usunięcie zależności od emotikon dla lepszej kompatybilności z czytnikami ekranu  
- **Profesjonalny wygląd**: Czysta, akademicka prezentacja odpowiednia dla szkoleń korporacyjnych  
- **Doświadczenie nauki**: Struktura z jasnymi celami i rezultatami dla każdej lekcji  
- **Organizacja treści**: Lepszy logiczny przepływ i powiązania tematyczne  

### [v1.0.0] - 2025-09-09  

#### Pierwsze wydanie - Kompleksowe repozytorium nauki AZD  

#### Dodano  
- **Podstawowa struktura dokumentacji**  
  - Kompletny przewodnik startowy  
  - Kompleksowa dokumentacja wdrożeń i provisioning’u  
  - Szczegółowe zasoby do rozwiązywania problemów i debugowania  
  - Narzędzia i procedury walidacji przedwdrożeniowej  

- **Moduł startowy**  
  - Podstawy AZD: Kluczowe pojęcia i terminologia  
  - Przewodnik instalacji: Instrukcje konfiguracji dla platform  
  - Przewodnik konfiguracji: Ustawienie środowiska i uwierzytelnianie  
  - Pierwsza lekcja projektowa: Krok po kroku, praktyczne nauczanie  

- **Moduł wdrożenia i provisioning’u**  
  - Przewodnik wdrożenia: Kompletny przepływ pracy  
  - Przewodnik provisioning’u: Infrastruktura jako kod z Bicep  
  - Najlepsze praktyki dla wdrożeń produkcyjnych  
  - Wzorce architektury wielousługowej  

- **Moduł walidacji przedwdrożeniowej**  
  - Planowanie pojemności: Walidacja dostępności zasobów Azure  
  - Wybór SKU: Kompleksowe wskazówki dotyczące poziomów usług  
  - Sprawdzanie przed lotem: Automatyczne skrypty walidacyjne (PowerShell i Bash)  
  - Narzędzia do szacowania kosztów i planowania budżetu  

- **Moduł rozwiązywania problemów**  
  - Powszechne problemy: Najczęstsze zagadnienia i rozwiązania  
  - Przewodnik debugowania: Systematyczne metody rozwiązywania usterek  
  - Zaawansowane techniki diagnostyczne i narzędzia  
  - Monitorowanie i optymalizacja wydajności  

- **Zasoby i odniesienia**  
  - Szybka ściągawka poleceń: Podstawowe komendy  
  - Słownik: Kompleksowe definicje terminologii i akronimów  
  - FAQ: Szczegółowe odpowiedzi na często zadawane pytania  
  - Zewnętrzne linki do zasobów i społeczności  

- **Przykłady i szablony**  
  - Przykład prostej aplikacji webowej  
  - Szablon wdrożenia statycznej strony  
  - Konfiguracja aplikacji kontenerowej  
  - Wzorce integracji baz danych  
  - Przykłady architektury mikroserwisów  
  - Implementacje funkcji serverless  

#### Funkcje  
- **Wsparcie wieloplatformowe**: Przewodniki instalacji i konfiguracji dla Windows, macOS i Linux  
- **Różne poziomy zaawansowania**: Treści przeznaczone od studentów do profesjonalnych programistów  
- **Praktyczne podejście**: Przykłady praktyczne i scenariusze z rzeczywistego świata  
- **Kompleksowe pokrycie**: Od podstawowych koncepcji do zaawansowanych wzorców korporacyjnych  
- **Podejście z naciskiem na bezpieczeństwo**: Najlepsze praktyki bezpieczeństwa w całym materiale  
- **Optymalizacja kosztów**: Wskazówki dotyczące efektywnego zarządzania kosztami i zasobami  

#### Jakość dokumentacji  
- **Szczegółowe przykłady kodu**: Praktyczne, przetestowane próbki kodu  
- **Instrukcje krok po kroku**: Jasne, wykonalne wskazówki  
- **Kompleksowa obsługa błędów**: Rozwiązywanie typowych problemów  
- **Integracja najlepszych praktyk**: Standardy branżowe i rekomendacje  
- **Zgodność wersji**: Aktualne z najnowszymi usługami Azure i funkcjami azd  

## Planowane przyszłe ulepszenia  

### Wersja 3.1.0 (Planowana)  
#### Rozszerzenie platformy AI
- **Obsługa wielu modeli**: Wzorce integracji dla Hugging Face, Azure Machine Learning oraz modeli niestandardowych
- **Frameworki agentów AI**: Szablony dla wdrożeń LangChain, Semantic Kernel oraz AutoGen
- **Zaawansowane wzorce RAG**: Opcje baz wektorowych poza Azure AI Search (Pinecone, Weaviate itd.)
- **Obserwowalność AI**: Ulepszone monitorowanie wydajności modelu, użycia tokenów i jakości odpowiedzi

#### Doświadczenie programisty
- **Rozszerzenie VS Code**: Zintegrowane środowisko programistyczne AZD + Microsoft Foundry
- **Integracja GitHub Copilot**: Generowanie szablonów AZD wspomagane przez AI
- **Interaktywne tutoriale**: Praktyczne ćwiczenia z automatyczną weryfikacją scenariuszy AI
- **Materiały wideo**: Uzupełniające samouczki wideo dla osób uczących się wizualnie, koncentrujące się na wdrożeniach AI

### Wersja 4.0.0 (Planowana)
#### Wzorce AI dla przedsiębiorstw
- **Framework zarządzania**: Zarządzanie modelami AI, zgodność i ścieżki audytu
- **AI dla wielu najemców**: Wzorce obsługi wielu klientów z izolowanymi usługami AI
- **Wdrożenia AI na krawędzi**: Integracja z Azure IoT Edge i instancjami kontenerów
- **Hybrydowa chmura AI**: Wzorce wdrożeń wielochmurowych i hybrydowych dla obciążeń AI

#### Zaawansowane funkcje
- **Automatyzacja pipeline AI**: Integracja MLOps z pipeline’ami Azure Machine Learning
- **Zaawansowane zabezpieczenia**: Wzorce zero-trust, prywatne punkty końcowe i zaawansowana ochrona przed zagrożeniami
- **Optymalizacja wydajności**: Zaawansowane strategie strojenia i skalowania dla aplikacji AI o dużej przepustowości
- **Globalna dystrybucja**: Wzorce dostarczania treści i buforowania na krawędzi dla aplikacji AI

### Wersja 3.0.0 (Planowana) - Zastąpiona przez bieżące wydanie
#### Proponowane dodatki - Aktualnie zaimplementowane w v3.0.0
- ✅ **Treści skupione na AI**: Kompleksowa integracja Microsoft Foundry (Zakończone)
- ✅ **Interaktywne tutoriale**: Warsztaty praktyczne AI (Zakończone)
- ✅ **Moduł zaawansowanego bezpieczeństwa**: Specyficzne wzorce bezpieczeństwa AI (Zakończone)
- ✅ **Optymalizacja wydajności**: Strategie strojenia obciążeń AI (Zakończone)

### Wersja 2.1.0 (Planowana) - Częściowo zaimplementowana w v3.0.0
#### Drobne ulepszenia - Część zakończona w bieżącym wydaniu
- ✅ **Dodatkowe przykłady**: Scenariusze wdrożeń skoncentrowane na AI (Zakończone)
- ✅ **Rozszerzone FAQ**: Pytania i rozwiązywanie problemów specyficznych dla AI (Zakończone)
- **Integracja narzędzi**: Ulepszone przewodniki integracji z IDE i edytorami
- ✅ **Rozszerzenie monitoringu**: Wzorce monitorowania i alertów specyficzne dla AI (Zakończone)

#### Nadal planowane na przyszłe wydania
- **Dokumentacja przyjazna dla urządzeń mobilnych**: Responsywny design do nauki mobilnej
- **Dostęp offline**: Pakiety dokumentacji do pobrania
- **Ulepszona integracja IDE**: Rozszerzenie VS Code dla AZD + workflow AI
- **Panel społeczności**: Metryki społeczności i śledzenie wkładu w czasie rzeczywistym

## Wkład w changelog

### Zgłaszanie zmian
Podczas wkładu do tego repozytorium prosimy o zapewnienie, że wpisy do changelogu zawierają:

1. **Numer wersji**: Zgodny z semantic versioning (major.minor.patch)
2. **Data**: Data wydania lub aktualizacji w formacie RRRR-MM-DD
3. **Kategoria**: Dodane, Zmienione, Przestarzałe, Usunięte, Naprawione, Bezpieczeństwo
4. **Klarowny opis**: Zwięzły opis zmiany
5. **Ocena wpływu**: Jak zmiany wpływają na obecnych użytkowników

### Kategorie zmian

#### Dodane
- Nowe funkcje, sekcje dokumentacji lub możliwości
- Nowe przykłady, szablony lub zasoby edukacyjne
- Dodatkowe narzędzia, skrypty lub narzędzia pomocnicze

#### Zmienione
- Modyfikacje istniejącej funkcjonalności lub dokumentacji
- Aktualizacje poprawiające jasność lub dokładność
- Restrukturyzacja treści lub organizacji

#### Przestarzałe
- Funkcje lub podejścia wycofywane
- Sekcje dokumentacji planowane do usunięcia
- Metody z lepszymi alternatywami

#### Usunięte
- Funkcje, dokumentacja lub przykłady, które nie są już istotne
- Nieaktualne informacje lub przestarzałe podejścia
- Zduplikowana lub scalona zawartość

#### Naprawione
- Poprawki błędów w dokumentacji lub kodzie
- Rozwiązanie zgłoszonych problemów
- Ulepszenia dokładności lub funkcjonalności

#### Bezpieczeństwo
- Ulepszenia lub poprawki związane z bezpieczeństwem
- Aktualizacje najlepszych praktyk bezpieczeństwa
- Usunięcie luk bezpieczeństwa

### Wytyczne semantic versioning

#### Wersja główna (X.0.0)
- Zmiany łamiące kompatybilność, wymagające działań użytkownika
- Znaczna restrukturyzacja treści lub organizacji
- Zmiany zmieniające fundamentalne podejście lub metodologię

#### Wersja pomocnicza (X.Y.0)
- Nowe funkcje lub dodatki do treści
- Ulepszenia zachowujące kompatybilność wsteczną
- Dodatkowe przykłady, narzędzia lub zasoby

#### Poprawka (X.Y.Z)
- Poprawki błędów i korekty
- Drobne ulepszenia istniejącej zawartości
- Wyjaśnienia i małe usprawnienia

## Opinie i sugestie społeczności

Aktywnie zachęcamy do przekazywania opinii w celu ulepszenia tego zasobu edukacyjnego:

### Jak przekazywać opinie
- **GitHub Issues**: Zgłaszanie problemów lub propozycji ulepszeń (mile widziane problemy dotyczące AI)
- **Dyskusje na Discordzie**: Dzielenie się pomysłami i angażowanie się w społeczność Microsoft Foundry
- **Pull Requests**: Wnoszenie bezpośrednich usprawnień do treści, szczególnie szablonów i przewodników AI
- **Discord Microsoft Foundry**: Udział w kanale #Azure dla dyskusji o AZD + AI
- **Forum społeczności**: Udział w szerszych dyskusjach deweloperów Azure

### Kategorie opinii
- **Dokładność treści AI**: Poprawki dotyczące integracji i wdrożeń usług AI
- **Doświadczenie nauki**: Sugestie poprawiające przebieg nauczania deweloperów AI
- **Brakujące treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI
- **Dostępność**: Ulepszenia dla zróżnicowanych potrzeb edukacyjnych
- **Integracja narzędzi AI**: Sugestie na temat lepszej integracji workflow deweloperskich AI
- **Wzorce produkcyjne AI**: Prośby o wzorce wdrożeń enterprise AI

### Zobowiązanie do odpowiedzi
- **Reakcja na zgłoszenia**: W ciągu 48 godzin na zgłoszone problemy
- **Prośby o funkcje**: Ocena w ciągu tygodnia
- **Wkłady społeczności**: Przegląd w ciągu tygodnia
- **Problemy bezpieczeństwa**: Priorytet natychmiastowy z przyspieszoną odpowiedzią

## Harmonogram utrzymania

### Regularne aktualizacje
- **Comiesięczne przeglądy**: Dokładność treści i weryfikacja linków
- **Kwartalne aktualizacje**: Główne dodatki i usprawnienia
- **Półroczne przeglądy**: Kompletna restrukturyzacja i ulepszenia
- **Coroczne wydania**: Aktualizacje wersji głównej z istotnymi ulepszeniami

### Monitoring i zapewnienie jakości
- **Automatyczne testy**: Regularna walidacja przykładów kodu i linków
- **Integracja opinii społeczności**: Regularne uwzględnianie sugestii użytkowników
- **Aktualizacje technologii**: Dostosowanie do najnowszych usług Azure i wydań azd
- **Audyt dostępności**: Regularne przeglądy pod kątem zasad projektowania inkluzywnego

## Polityka wsparcia wersji

### Wsparcie aktualnej wersji
- **Najnowsza wersja główna**: Pełne wsparcie z regularnymi aktualizacjami
- **Poprzednia wersja główna**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy
- **Starsze wersje**: Wsparcie społecznościowe, bez oficjalnych aktualizacji

### Wskazówki migracyjne
Wraz z wydaniem wersji głównych oferujemy:
- **Przewodniki migracji**: Instrukcje krok po kroku dotyczące przejścia
- **Notatki o kompatybilności**: Informacje o zmianach łamiących
- **Wsparcie narzędziowe**: Skrypty lub narzędzia ułatwiające migrację
- **Wsparcie społeczności**: Dedykowane fora do pytań o migrację

---

**Nawigacja**
- **Poprzednia lekcja**: [Przewodnik nauki](resources/study-guide.md)
- **Następna lekcja**: Powrót do [Głównego README](README.md)

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wydaniach i ważnych aktualizacjach materiałów edukacyjnych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrzeczenie się odpowiedzialności**:
Dokument ten został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być traktowany jako źródło autorytatywne. W przypadku istotnych informacji zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->