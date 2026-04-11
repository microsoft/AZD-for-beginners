# Changelog - AZD dla początkujących

## Wprowadzenie

Ten changelog dokumentuje wszystkie znaczące zmiany, aktualizacje i ulepszenia w repozytorium AZD dla początkujących. Stosujemy zasady semantycznego wersjonowania i utrzymujemy ten dziennik, aby pomóc użytkownikom zrozumieć, co zostało zmienione między wersjami.

## Cele nauki

Przeglądając ten changelog, będziesz:
- Na bieżąco z nowymi funkcjami i dodatkami do treści
- Rozumieć ulepszenia dokonane w istniejącej dokumentacji
- Śledzić poprawki błędów i korekty, aby zapewnić dokładność
- Obserwować rozwój materiałów edukacyjnych w czasie

## Efekty uczenia się

Po przeglądzie wpisów changelogu będziesz potrafił:
- Zidentyfikować nowe treści i zasoby dostępne do nauki
- Zrozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować swoją ścieżkę nauki na podstawie najnowszych materiałów
- Wnosić opinie i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.19.1] - 2026-03-27

#### Wyjaśnienie onboardingu dla początkujących, walidacja konfiguracji i ostateczne oczyszczenie poleceń AZD
**Ta wersja kontynuuje przegląd walidacyjny AZD 1.23, skupiając się na dokumentacji dla początkujących: wyjaśnia zalecenia dotyczące autoryzacji z AZD jako pierwszym krokiem, dodaje skrypty do lokalnej walidacji konfiguracji, weryfikuje kluczowe polecenia z działającym CLI AZD oraz usuwa ostatnie nieaktualne odniesienia do anglojęzycznych poleceń poza changelogiem.**

#### Dodano
- **🧪 Skrypty walidacji konfiguracji dla początkujących** w `validate-setup.ps1` i `validate-setup.sh`, aby uczący się mogli potwierdzić wymagane narzędzia przed rozpoczęciem Rozdziału 1
- **✅ Kroki walidacji konfiguracji na wstępie** w głównym README i README Rozdziału 1, aby brakujące wymagania były wykrywane przed `azd up`

#### Zmieniono
- **🔐 Wskazówki dotyczące autoryzacji dla początkujących** teraz konsekwentnie traktują `azd auth login` jako główną ścieżkę dla workflow AZD, z `az login` wyróżnionym jako opcjonalny, chyba że są używane polecenia Azure CLI bezpośrednio
- **📚 Przepływ onboardingu w Rozdziale 1** kieruje uczniów do walidacji lokalnej konfiguracji przed instalacją, autoryzacją i pierwszymi krokami wdrożenia
- **🛠️ Komunikaty walidatora** teraz wyraźnie oddzielają wymagania blokujące od opcjonalnych ostrzeżeń Azure CLI dla ścieżki tylko AZD dla początkujących
- **📖 Dokumentacja konfiguracji, rozwiązywania problemów i przykładów** teraz rozróżnia wymaganą autoryzację AZD i opcjonalne logowanie do Azure CLI tam, gdzie wcześniej obie były prezentowane bez kontekstu

#### Naprawiono
- **📋 Pozostałe odniesienia do poleceń w źródłach anglojęzycznych** zaktualizowane do bieżącej formy AZD, w tym `azd config show` w ściągawce oraz `azd monitor --overview` tam, gdzie dotyczyła wskazówka przeglądu w Azure Portal
- **🧭 Twierdzenia dla początkujących w Rozdziale 1** złagodzone, aby uniknąć nadmiernych obietnic gwarantowanego braku błędów lub rollbacku dla wszystkich szablonów i zasobów Azure
- **🔎 Walidacja na żywo CLI** potwierdziła bieżące wsparcie dla `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` oraz `azd down --force --purge`

#### Zaktualizowane pliki
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Walidacja AZD 1.23.12, rozszerzenie środowiska warsztatowego i odświeżenie modelu AI
**Ta wersja przeprowadza przegląd dokumentacji wobec `azd` `1.23.12`, aktualizuje przestarzałe przykłady poleceń AZD, odświeża wskazówki modelu AI do aktualnych domyślnych wartości oraz rozszerza instrukcje warsztatu poza GitHub Codespaces, aby wspierać również dev containers i lokalne klony.**

#### Dodano
- **✅ Notatki walidacyjne w kluczowych rozdziałach i dokumentacji warsztatu**, aby wyraźnie wskazać testowaną bazę AZD dla uczących się korzystających z nowszych lub starszych wersji CLI
- **⏱️ Wskazówki dotyczące limitu czasu wdrożenia** dla długo uruchamiających się aplikacji AI z `azd deploy --timeout 1800`
- **🔎 Kroki inspekcji rozszerzeń** z `azd extension show azure.ai.agents` w dokumentacji workflow AI
- **🌐 Szersze wskazówki dotyczące środowiska warsztatowego** obejmujące GitHub Codespaces, dev containers oraz lokalne klony z użyciem MkDocs

#### Zmieniono
- **📚 Wstępne README rozdziałów** teraz konsekwentnie wskazują walidację wobec `azd 1.23.12` w sekcjach fundamentów, konfiguracji, infrastruktury, multi-agent, pre-deployment, rozwiązywania problemów i produkcji
- **🛠️ Odniesienia do poleceń AZD** zaktualizowane do obecnych form w całej dokumentacji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` lub `azd env get-value(s)` w zależności od kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, gdzie ma być przegląd Application Insights
- **🧪 Przykłady preview provisioningu** uproszczone do bieżącego obsługiwanego użycia, np. `azd provision --preview` oraz `azd provision --preview -e production`
- **🧭 Przepływ warsztatu** zaktualizowany, aby uczniowie mogli wykonać laboratoria w Codespaces, dev containerze lub lokalnym klonie, zamiast zakładać uruchomienie wyłącznie w Codespaces
- **🔐 Wskazówki dotyczące autoryzacji** teraz preferują `azd auth login` dla workflow AZD, z `az login` pozycjonowanym jako opcjonalny, gdy używane są bezpośrednio polecenia Azure CLI

#### Naprawiono
- **🪟 Polecenia instalacyjne dla Windows** unormowano pod kątem obecnej wielkości liter pakietów `winget` w przewodniku instalacji
- **🐧 Wskazówki instalacji Linux** skorygowano, aby uniknąć nieobsługiwanych dystrybucyjnie poleceń menedżera pakietów `azd` i zamiast tego kierować do zasobów wydania, tam gdzie to stosowne
- **📦 Przykłady modeli AI** odświeżone z wcześniejszych domyślnych, jak `gpt-35-turbo` i `text-embedding-ada-002`, do obecnych przykładów, np. `gpt-4.1-mini`, `gpt-4.1` oraz `text-embedding-3-large`
- **📋 Fragmenty wdrożeń i diagnostyki** poprawione do użycia bieżących poleceń środowisk i statusu w logach, skryptach i krokach rozwiązywania problemów
- **⚙️ Wskazówki GitHub Actions** zaktualizowane z `Azure/setup-azd@v1.0.0` do `Azure/setup-azd@v2`
- **🤖 Wskazówki dotyczące zgody MCP/Copilot** zaktualizowane z `azd mcp consent` na `azd copilot consent list`

#### Ulepszono
- **🧠 Wskazówki do rozdziału AI** lepiej wyjaśniające zachowanie `azd ai` w trybie podglądu, logowanie dedykowane tenantowi, aktualne wykorzystanie rozszerzeń oraz zaktualizowane zalecenia dotyczące wdrożeń modeli
- **🧪 Instrukcje warsztatowe** z bardziej realistycznymi przykładami wersji i jaśniejszym językiem ustawienia środowiska do praktycznych laboratoriów
- **📈 Dokumentacja produkcji i rozwiązywania problemów** lepiej dostosowana do aktualnego monitoringu, modeli zapasowych i przykładów poziomów kosztów

#### Zaktualizowane pliki
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Polecenia AZD AI CLI, walidacja treści i rozszerzenie szablonów
**Ta wersja dodaje pokrycie poleceń `azd ai`, `azd extension` i `azd mcp` we wszystkich rozdziałach związanych ze sztuczną inteligencją, naprawia uszkodzone linki i przestarzały kod w agents.md, aktualizuje ściągawkę oraz przeprowadza gruntowną zmianę sekcji Szablonów Przykladowych z poprawionymi opisami i nowymi szablonami Azure AI AZD.**

#### Dodano
- **🤖 Pokrycie poleceń AZD AI CLI** w 7 plikach (wcześniej tylko w Rozdziale 8):
  - `docs/chapter-01-foundation/azd-basics.md` — nowa sekcja "Rozszerzenia i polecenia AI" wprowadzająca `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcja 4: `azd ai agent init` z tabelą porównawczą (szablon vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — podsekcje "Rozszerzenia AZD dla Foundry" i "Deployment z podejściem Agent-First"
  - `docs/chapter-05-multi-agent/README.md` — szybki start pokazuje ścieżki wdrożeń z szablonu i manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — sekcja wdrożenia uwzględnia teraz opcję `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — podsekcja "Polecenia rozszerzenia AZD AI do diagnostyki"
  - `resources/cheat-sheet.md` — nowa sekcja "Polecenia AI i Rozszerzeń" z `azd extension`, `azd ai agent init`, `azd mcp` oraz `azd infra generate`
- **📦 Nowe przykładowe szablony AZD AI** w `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — czat RAG .NET z Blazor WebAssembly, Semantic Kernel i wsparciem rozmowy głosowej
  - **azure-search-openai-demo-java** — czat RAG w Java używający Langchain4J z opcjami wdrożenia ACA/AKS
  - **contoso-creative-writer** — wielo-agentowa aplikacja do twórczego pisania z Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — serverless RAG z Azure Functions + LangChain.js + Cosmos DB oraz lokalnym wsparciem Ollama
  - **chat-with-your-data-solution-accelerator** — przyspieszacz enterprise RAG z portalem admina, integracją Teams i opcjami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — referencyjna aplikacja wielo-agentowa MCP z serwerami .NET, Python, Java i TypeScript
  - **azd-ai-starter** — minimalistyczny szablon startowy infrastruktury Azure AI w Bicep
  - **🔗 Odnośnik do świetnej galerii AZD AI** — odniesienie do [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (ponad 80 szablonów)

#### Naprawiono
- **🔗 Nawigacja w agents.md:** linki Previous/Next teraz odpowiadają kolejności lekcji w README Rozdziału 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Uszkodzone linki w agents.md:** `production-ai-practices.md` poprawione na `../chapter-08-production/production-ai-practices.md` (3 wystąpienia)
- **📦 Przestarzały kod w agents.md:** `opencensus` zastąpiono `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Niepoprawne API w agents.md:** przeniesiono `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 Liczenie tokenów w agents.md:** zastąpiono przybliżenie `len//4` funkcją `tiktoken.encoding_for_model()`
- **azure-search-openai-demo:** poprawiono opis usług z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (domyślny host zmieniony w październiku 2024)
- **contoso-chat:** zaktualizowano opis, aby odnosił się do Azure AI Foundry + Prompty, zgodnie z rzeczywistym tytułem i stackiem technologicznym repozytorium

#### Usunięto
- **ai-document-processing:** usunięto niefunkcjonalne odniesienie do szablonu (repozytorium niedostępne publicznie jako szablon AZD)

#### Ulepszono
- **📝 ćwiczenia agents.md**: Ćwiczenie 1 teraz pokazuje oczekiwany wynik i krok `azd monitor`; Ćwiczenie 2 zawiera pełny kod rejestracji `FunctionTool`; Ćwiczenie 3 zastępuje niejasne wskazówki konkretnymi poleceniami `prepdocs.py`
- **📚 zasoby agents.md**: Zaktualizowano linki do dokumentacji na aktualne dokumenty Azure AI Agent Service oraz szybki start
- **📋 tabela kolejnych kroków agents.md**: Dodano link do AI Workshop Lab dla kompletnego pokrycia rozdziału

#### Zaktualizowane pliki
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
**Ta wersja poprawia nawigację między rozdziałami w README.md, stosując ulepszony format tabeli.**

#### Zmiany
- **Tabela mapy kursu**: Rozszerzona o bezpośrednie linki do lekcji, szacowany czas trwania i oceny trudności
- **Czyszczenie folderów**: Usunięto zbędne stare foldery (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Weryfikacja linków**: Wszystkie 21+ linki wewnętrzne w tabeli mapy kursu zostały zweryfikowane

### [v3.16.0] - 2026-02-05

#### Aktualizacje nazw produktów
**Ta wersja aktualizuje odniesienia do produktów zgodnie z aktualnym brandingiem Microsoft.**

#### Zmiany
- **Microsoft Foundry → Microsoft Foundry**: Wszystkie odwołania zaktualizowano w plikach niezwiązanych z tłumaczeniem
- **Azure AI Agent Service → Foundry Agents**: Zmieniono nazwę usługi, aby odzwierciedlała aktualny branding

#### Zaktualizowane pliki
- `README.md` - Główna strona kursu
- `changelog.md` - Historia wersji
- `course-outline.md` - Struktura kursu
- `docs/chapter-02-ai-development/agents.md` - Przewodnik po agentach AI
- `examples/README.md` - Dokumentacja przykładów
- `workshop/README.md` - Start warsztatu
- `workshop/docs/index.md` - Indeks warsztatu
- `workshop/docs/instructions/*.md` - Wszystkie pliki instrukcji warsztatu

---

### [v3.15.0] - 2026-02-05

#### Duża restrukturyzacja repozytorium: Foldery według rozdziałów
**Ta wersja restrukturyzuje dokumentację do dedykowanych folderów rozdziałów dla lepszej nawigacji.**

#### Zmiany nazw folderów
Stare foldery zostały zastąpione folderami numerowanymi wg rozdziałów:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano nowy: `docs/chapter-05-multi-agent/`

#### Migracje plików
| Plik | Z | Do |
|------|-----|----|
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
- **🔗 Zaktualizowano wszystkie linki wewnętrzne**: Ponad 78 ścieżek zmienionych w całej dokumentacji
- **🗺️ Główne README.md**: Zaktualizowano mapę kursu według nowej struktury rozdziałów
- **📝 examples/README.md**: Zaktualizowano odwołania do folderów rozdziałów

#### Usunięto
- Stara struktura folderów (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturyzacja repozytorium: Nawigacja po rozdziałach
**Ta wersja dodała pliki README z nawigacją po rozdziałach (zastąpione przez v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nowy przewodnik po agentach AI
**Ta wersja dodaje kompleksowy przewodnik wdrażania agentów AI z wykorzystaniem Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Kompletny przewodnik obejmujący:
  - Czym są agenci AI i jak różnią się od chatbotów
  - Trzy szablony szybkiego startu agentów (Foundry Agents, Prompty, RAG)
  - Wzorce architektury agentów (pojedynczy agent, RAG, multi-agent)
  - Konfiguracja i dostosowanie narzędzi
  - Monitorowanie i śledzenie metryk
  - Aspekty kosztowe i optymalizacja
  - Typowe scenariusze rozwiązywania problemów
  - Trzy ćwiczenia praktyczne z kryteriami sukcesu

#### Struktura treści
- **Wprowadzenie**: Koncepcje agentów dla początkujących
- **Szybki start**: Wdrażanie agentów poleceniem `azd init --template get-started-with-ai-agents`
- **Wzorce architektury**: Diagramy wzorców agentów
- **Konfiguracja**: Ustawienia narzędzi i zmienne środowiskowe
- **Monitorowanie**: Integracja z Application Insights
- **Ćwiczenia**: Postępujące nauczanie praktyczne (20-45 minut każda)

---

### [v3.12.0] - 2026-02-05

#### Aktualizacja środowiska DevContainer
**Ta wersja aktualizuje konfigurację kontenera deweloperskiego z nowoczesnymi narzędziami i lepszymi ustawieniami domyślnymi dla doświadczenia nauki AZD.**

#### Zmiany
- **🐳 Obraz bazowy**: Zmieniono z `python:3.12-bullseye` na `python:3.12-bookworm` (najnowszy Debian stabilny)
- **📛 Nazwa kontenera**: Zmieniono z "Python 3" na "AZD dla początkujących" dla jasności

#### Dodano
- **🔧 Nowe funkcje Dev Container**:
  - `azure-cli` z włączoną obsługą Bicep
  - `node:20` (wersja LTS dla szablonów AZD)
  - `github-cli` do zarządzania szablonami
  - `docker-in-docker` do wdrożeń aplikacji kontenerowych

- **🔌 Przekierowanie portów**: Wstępnie skonfigurowane porty dla powszechnego rozwoju:
  - 8000 (podgląd MkDocs)
  - 3000 (aplikacje webowe)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nowe rozszerzenia VS Code**:
  - `ms-python.vscode-pylance` - Zaawansowany IntelliSense dla Pythona
  - `ms-azuretools.vscode-azurefunctions` - Wsparcie Azure Functions
  - `ms-azuretools.vscode-docker` - Wsparcie Dockera
  - `ms-azuretools.vscode-bicep` - Wsparcie języka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Zarządzanie zasobami Azure
  - `yzhang.markdown-all-in-one` - Edycja Markdown
  - `DavidAnson.vscode-markdownlint` - Kontrola jakości Markdown
  - `bierner.markdown-mermaid` - Wsparcie diagramów Mermaid
  - `redhat.vscode-yaml` - Obsługa YAML (dla azure.yaml)
  - `eamodio.gitlens` - Wizualizacja Gita
  - `mhutchie.git-graph` - Historia Gita

- **⚙️ Ustawienia VS Code**: Dodano domyślne ustawienia dla interpretera Python, formatowania przy zapisie i usuwania białych znaków

- **📦 Zaktualizowano requirements-dev.txt**:
  - Dodano wtyczkę do minifikacji MkDocs
  - Dodano pre-commit dla jakości kodu
  - Dodano pakiety Azure SDK (azure-identity, azure-mgmt-resource)

#### Naprawiono
- **Komenda po utworzeniu**: Teraz sprawdza instalację AZD i Azure CLI podczas uruchamiania kontenera

---

### [v3.11.0] - 2026-02-05

#### Przebudowa README dla początkujących
**Ta wersja znacznie poprawia README.md, czyniąc go bardziej przystępnym dla początkujących oraz dodaje niezbędne zasoby dla deweloperów AI.**

#### Dodano
- **🆚 Porównanie Azure CLI i AZD**: Jasne wyjaśnienie kiedy używać którego narzędzia z praktycznymi przykładami
- **🌟 Świetne linki do AZD**: Bezpośrednie odnośniki do galerii szablonów społeczności i zasobów do współtworzenia:
  - [Galeria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ gotowych do wdrożenia szablonów
  - [Dodaj szablon](https://github.com/Azure/awesome-azd/issues) - Wkład społeczności
- **🎯 Przewodnik szybkiego startu**: Uproszczona sekcja 3 kroków (Instalacja → Logowanie → Wdrożenie)
- **📊 Tabela nawigacji wg doświadczenia**: Jasne wskazówki, od czego zacząć w zależności od poziomu zaawansowania

#### Zmiany
- **Struktura README**: Przeorganizowana pod kątem stopniowego ujawniania - najważniejsze informacje na początku
- **Sekcja wprowadzenia**: Przepisana, wyjaśniająca "Magia `azd up`" dla zupełnie początkujących
- **Usunięto powieloną zawartość**: Usunięto duplikat sekcji rozwiązywania problemów
- **Polecenia rozwiązywania problemów**: Naprawiono odniesienia do `azd logs` na poprawne `azd monitor --logs`

#### Naprawiono
- **🔐 Polecenia uwierzytelniania**: Dodano `azd auth login` i `azd auth logout` do cheat-sheet.md
- **Nieprawidłowe odniesienia do poleceń**: Usunięto pozostałe wystąpienia `azd logs` w sekcji rozwiązywania problemów w README

#### Uwagi
- **Zakres**: Zmiany zastosowano w głównym README.md i resources/cheat-sheet.md
- **Grupa docelowa**: Ulepszenia skierowane specjalnie do nowych deweloperów AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizacja poprawności poleceń Azure Developer CLI
**Ta wersja poprawia nieistniejące polecenia AZD w całej dokumentacji, zapewniając, że wszystkie przykłady używają prawidłowej składni Azure Developer CLI.**

#### Naprawiono
- **🔧 Usunięto nieistniejące polecenia AZD**: Kompleksowy audyt i poprawa nieprawidłowych poleceń:
  - `azd logs` (nie istnieje) → zastąpiono `azd monitor --logs` lub alternatywami Azure CLI
  - podpolecenia `azd service` (nie istnieją) → zastąpiono `azd show` i Azure CLI
  - `azd infra import/export/validate` (nie istnieją) → usunięte lub zastąpione prawidłowymi alternatywami
  - flagi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nie istnieją) → usunięte
  - flagi `azd provision --what-if/--rollback` (nie istnieją) → zaktualizowano do użycia `--preview`
  - `azd config validate` (nie istnieje) → zastąpiono `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nie istnieją) → usunięte

- **📚 Zaktualizowane pliki z poprawkami poleceń**:
  - `resources/cheat-sheet.md`: Kompleksowa przebudowa odniesień do poleceń
  - `docs/deployment/deployment-guide.md`: Poprawione strategie wycofywania i wdrażania
  - `docs/troubleshooting/debugging.md`: Poprawione sekcje analizy logów
  - `docs/troubleshooting/common-issues.md`: Zaktualizowane polecenia rozwiązywania problemów
  - `docs/troubleshooting/ai-troubleshooting.md`: Naprawiona sekcja debugowania AZD
  - `docs/getting-started/azd-basics.md`: Poprawione polecenia monitorowania
  - `docs/getting-started/first-project.md`: Zaktualizowane przykłady monitorowania i debugowania
  - `docs/getting-started/installation.md`: Poprawione przykłady pomocy i wersji
  - `docs/pre-deployment/application-insights.md`: Naprawione polecenia przeglądania logów
  - `docs/pre-deployment/coordination-patterns.md`: Poprawione polecenia debugowania agentów

- **📝 Zaktualizowano odniesienia wersji**:
  - `docs/getting-started/installation.md`: Zmieniono wersję z zakodowanej `1.5.0` na ogólną `1.x.x` z linkiem do wydań

#### Zmiany
- **Strategie wycofywania**: Zaktualizowano dokumentację na rzecz wycofywania opartego na Git (AZD nie posiada natywnego wycofywania)
- **Przeglądanie logów**: Zastąpiono odniesienia `azd logs` poleceniami `azd monitor --logs`, `azd monitor --live` oraz Azure CLI
- **Sekcja wydajności**: Usunięto nieistniejące flagi wdrożenia równoległego/incrementalnego, podano poprawne alternatywy

#### Szczegóły techniczne
- **Poprawne polecenia AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Poprawne flagi azd monitor**: `--live`, `--logs`, `--overview`
- **Usunięte funkcje**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Uwagi
- **Weryfikacja**: Polecenia zweryfikowane względem Azure Developer CLI w wersji v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ukończenie warsztatów i aktualizacja jakości dokumentacji
**Ta wersja kończy interaktywne moduły warsztatów, naprawia wszystkie uszkodzone linki w dokumentacji oraz poprawia ogólną jakość treści dla programistów AI korzystających z Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nowy dokument wytycznych dotyczących wkładu zawierający:
  - Jasne instrukcje zgłaszania problemów i proponowania zmian
  - Standardy dokumentacji dla nowych treści
  - Wytyczne dotyczące przykładów kodu i konwencji komunikatów commitów
  - Informacje angażujące społeczność

#### Ukończono
- **🎯 Moduł warsztatowy 7 (Podsumowanie)**: W pełni ukończony moduł podsumowujący z:
  - Obszerne podsumowanie osiągnięć warsztatów
  - Sekcja kluczowych opanowanych pojęć dotyczących AZD, szablonów i Microsoft Foundry
  - Rekomendacje dalszej ścieżki nauki
  - Ćwiczenia wyzwania warsztatowego z oceną trudności
  - Linki do opinii społeczności i wsparcia

- **📚 Moduł warsztatowy 3 (Analiza)**: Zaktualizowane cele nauki z:
  - Instrukcjami aktywacji GitHub Copilot z serwerami MCP
  - Zrozumieniem struktury folderów szablonów AZD
  - Wzorcami organizacji Infrastructure-as-code (Bicep)
  - Instrukcjami labów praktycznych

- **🔧 Moduł warsztatowy 6 (Demontaż)**: Ukończone z:
  - Celami czyszczenia zasobów i zarządzania kosztami
  - Użyciem `azd down` dla bezpiecznego demontażu infrastruktury
  - Wskazówkami odzyskiwania wyłączonych usług kognitywnych
  - Bonusowymi sugestiami eksploracji GitHub Copilot i Azure Portal

#### Naprawiono
- **🔗 Naprawa uszkodzonych linków**: Rozwiązano ponad 15 uszkodzonych wewnętrznych linków w dokumentacji:
  - `docs/ai-foundry/ai-model-deployment.md`: Poprawione ścieżki do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawione ścieżki do ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamieniono nieistniejący cicd-integration.md na deployment-guide.md
  - `examples/retail-scenario.md`: Poprawione ścieżki FAQ i przewodnika rozwiązywania problemów
  - `examples/container-app/microservices/README.md`: Poprawione ścieżki przewodnika kursu i wdrożenia
  - `resources/faq.md` oraz `resources/glossary.md`: Zaktualizowano odniesienia do rozdziałów AI
  - `course-outline.md`: Naprawiono odniesienia do przewodnika instruktora oraz laboratoriów AI

- **📅 Baner statusu warsztatów**: Zmieniono z komunikatu "W budowie" na aktywny status warsztatów z datą luty 2026

- **🔗 Nawigacja warsztatów**: Naprawiono uszkodzone linki nawigacyjne w README.md warsztatu wskazujące na nieistniejący folder lab-1-azd-basics

#### Zmieniono
- **Prezentacja warsztatów**: Usunięto ostrzeżenie "w budowie", warsztaty są ukończone i gotowe do użytku
- **Spójność nawigacji**: Zapewniono prawidłową nawigację między modułami warsztatów
- **Odwołania do ścieżki nauki**: Zaktualizowano odniesienia międzyrozdziałowe na poprawne ścieżki microsoft-foundry

#### Zweryfikowano
- ✅ Wszystkie angielskie pliki markdown mają poprawne wewnętrzne linki
- ✅ Moduły warsztatowe 0-7 są kompletne z jasno określonymi celami nauki
- ✅ Nawigacja między rozdziałami i modułami działa prawidłowo
- ✅ Treści są odpowiednie dla programistów AI korzystających z Microsoft AZD
- ✅ Utrzymano przyjazny dla początkujących język i strukturę
- ✅ CONTRIBUTING.md dostarcza jasne wytyczne dla współtwórców społeczności

#### Techniczne wdrożenie
- **Weryfikacja linków**: Zautomatyzowany skrypt PowerShell zweryfikował wszystkie wewnętrzne linki .md
- **Audyt treści**: Ręczne sprawdzenie kompletności warsztatów i przyjazności dla początkujących
- **System nawigacji**: Stosowanie spójnych wzorców nawigacji między rozdziałami i modułami

#### Uwagi
- **Zakres**: Zmiany zastosowano tylko w dokumentacji angielskiej
- **Tłumaczenia**: Foldery z tłumaczeniami nie zostały zaktualizowane w tej wersji (automatyczne tłumaczenia zostaną zsynchronizowane później)
- **Czas trwania warsztatu**: Kompletny warsztat zapewnia 3-4 godziny nauki praktycznej

---

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: Monitorowanie, bezpieczeństwo i wzorce wieloagentowe
**Ta wersja dodaje kompleksowe lekcje na poziomie A dotyczące integracji Application Insights, wzorców uwierzytelniania oraz koordynacji wieloagentowej dla wdrożeń produkcyjnych.**

#### Dodano
- **📊 Lekcja integracji Application Insights**: w `docs/pre-deployment/application-insights.md`:
  - Wdrożenie skoncentrowane na AZD z automatycznym provisionowaniem
  - Pełne szablony Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z niestandardową telemetrią (ponad 1200 linii)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów Microsoft Foundry Models)
  - 6 diagramów Mermaid (architektura, distributed tracing, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, pulpity, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Strumieniowanie metryk na żywo i debugowanie w czasie rzeczywistym
  - Czas nauki 40-50 minut z wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i bezpieczeństwa**: w `docs/getting-started/authsecurity.md`:
  - 3 wzorce uwierzytelniania (connection strings, Key Vault, managed identity)
  - Pełne szablony infrastruktury Bicep dla bezpiecznych wdrożeń
  - Kod aplikacji Node.js z integracją Azure SDK
  - 3 kompletne ćwiczenia (aktywacja managed identity, user-assigned identity, rotacja Key Vault)
  - Najlepsze praktyki bezpieczeństwa i konfiguracje RBAC
  - Przewodnik rozwiązywania problemów i analiza kosztów
  - Produkcyjne wzorce uwierzytelniania bezhasłowego

- **🤖 Lekcja wzorców koordynacji wieloagentowej**: w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Kompletny implementator usługi orkiestratora (Python/Flask, ponad 1500 linii)
  - 3 wyspecjalizowane implementacje agentów (Research, Writer, Editor)
  - Integracja z Service Bus dla kolejkowania wiadomości
  - Zarządzanie stanem w Cosmos DB dla rozproszonych systemów
  - 6 diagramów Mermaid przedstawiających interakcje agentów
  - 3 zaawansowane ćwiczenia (timeout, logika ponawiania, circuit breaker)
  - Podział kosztów ($240-565/miesiąc) z strategiami optymalizacji
  - Integracja Application Insights dla monitoringu

#### Ulepszono
- **Rozdział pre-deployment**: Teraz zawiera kompleksowe wzorce monitorowania i koordynacji
- **Rozdział początkujący**: Rozszerzony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Pełne pokrycie od bezpieczeństwa po obserwowalność
- **Konspekt kursu**: Zaktualizowany o odniesienia do nowych lekcji w Rozdziałach 3 i 6

#### Zmieniono
- **Postęp nauki**: Lepsza integracja bezpieczeństwa i monitoringu w całym kursie
- **Jakość dokumentacji**: Spójne standardy A-grade (95-97%) w nowych lekcjach
- **Wzorce produkcyjne**: Kompleksowe pokrycie end-to-end dla wdrożeń korporacyjnych

#### Ulepszono
- **Doświadczenie dewelopera**: Jasna ścieżka od rozwoju do monitoringu produkcyjnego
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania sekretami
- **Obserwowalność**: Pełna integracja Application Insights z AZD
- **Obciążenia AI**: Specjalistyczny monitoring dla Microsoft Foundry Models i systemów wieloagentowych

#### Zweryfikowano
- ✅ Wszystkie lekcje zawierają pełny działający kod (nie fragmenty)
- ✅ Diagramy Mermaid do nauki wizualnej (łącznie 19 w 3 lekcjach)
- ✅ Ćwiczenia praktyczne ze krokami weryfikacji (łącznie 9)
- ✅ Szablony Bicep produkcyjne do wdrożenia przez `azd up`
- ✅ Analizy kosztów i strategie optymalizacji
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki
- ✅ Punkty kontrolne wiedzy z komendami weryfikacyjnymi

#### Wyniki oceny dokumentacji
- **docs/pre-deployment/application-insights.md**: - Kompletny przewodnik monitoringu
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury wieloagentowe
- **Nowa zawartość ogólnie**: - Spójne wysokiej jakości standardy

#### Techniczne wdrożenie
- **Application Insights**: Log Analytics + niestandardowa telemetria + distributed tracing
- **Uwierzytelnianie**: Managed Identity + Key Vault + wzorce RBAC
- **Wieloagentowość**: Service Bus + Cosmos DB + Container Apps + orkiestracja
- **Monitorowanie**: Metryki na żywo + zapytania Kusto + alerty + pulpity
- **Zarządzanie kosztami**: Strategie próbkowania, polityki retencji, kontrola budżetów

### [v3.7.0] - 2025-11-19

#### Poprawa jakości dokumentacji i nowy przykład Microsoft Foundry Models
**Ta wersja poprawia jakość dokumentacji w całym repozytorium oraz dodaje kompletny przykład wdrożenia Microsoft Foundry Models z interfejsem czatu gpt-4.1.**

#### Dodano
- **🤖 Przykład czatu Microsoft Foundry Models**: Pełne wdrożenie gpt-4.1 z działającą implementacją w `examples/azure-openai-chat/`:
  - Kompletną infrastrukturę Microsoft Foundry Models (wdrożenie modelu gpt-4.1)
  - Interfejs linii poleceń w Pythonie z historią konwersacji
  - Integrację z Key Vault dla bezpiecznego przechowywania kluczy API
  - Monitorowanie zużycia tokenów i estymację kosztów
  - Limitowanie zapytań i obsługę błędów
  - Kompleksowy README z przewodnikiem wdrożenia 35-45 minut
  - 11 plików gotowych do produkcji (szablony Bicep, aplikacja Python, konfiguracja)
- **📚 Ćwiczenia dokumentacyjne**: Dodane ćwiczenia praktyczne do przewodnika konfiguracyjnego:
  - Ćwiczenie 1: Konfiguracja multi-środowiskowa (15 minut)
  - Ćwiczenie 2: Praktyka zarządzania sekretami (10 minut)
  - Jasne kryteria sukcesu i kroki weryfikacji
- **✅ Weryfikacja wdrożenia**: Dodano sekcję weryfikacyjną do przewodnika wdrożeniowego:
  - Procedury kontroli stanu zdrowia
  - Lista kontrolna kryteriów sukcesu
  - Oczekiwane wyjścia dla wszystkich poleceń wdrożeniowych
  - Szybka referencja rozwiązywania problemów

#### Ulepszono
- **examples/README.md**: Zaktualizowany do jakości A-grade (93%):
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji
  - Zwiększono liczbę lokalnych przykładów z 3 do 4
  - Dodano do tabeli przykładów aplikacji AI
  - Zintegrowano z szybkim startem dla użytkowników średniozaawansowanych
  - Dodano do sekcji szablonów Microsoft Foundry
  - Zaktualizowano matrycę porównań i sekcje wyszukiwania technologii
- **Jakość dokumentacji**: Poprawiona z B+ (87%) do A- (92%) w folderze docs:
  - Dodano oczekiwane wyniki do kluczowych przykładów poleceń
  - Uwzględniono kroki weryfikacji zmian konfiguracyjnych
  - Wzmocniono naukę praktyczną ćwiczeniami praktycznymi

#### Zmieniono
- **Postęp nauki**: Lepsza integracja przykładów AI dla użytkowników średniozaawansowanych
- **Struktura dokumentacji**: Więcej ćwiczeń praktycznych z jasnymi rezultatami
- **Proces weryfikacji**: Dodano wyraźne kryteria sukcesu do kluczowych przebiegów pracy

#### Ulepszono
- **Doświadczenie dewelopera**: Wdrożenie Microsoft Foundry Models trwa teraz 35-45 minut (w porównaniu z 60-90 dla złożonych alternatyw)
- **Przejrzystość kosztów**: Jasne oszacowania kosztów ($50-200/miesiąc) dla przykładu Microsoft Foundry Models
- **Ścieżka nauki**: Programiści AI mają jasny punkt startowy z azure-openai-chat
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacji

#### Zweryfikowano
- ✅ Przykład Microsoft Foundry Models w pełni funkcjonalny z `azd up`
- ✅ Wszystkie 11 plików implementacyjnych bez błędów składniowych
- ✅ Instrukcje README odpowiadają rzeczywistemu doświadczeniu wdrożenia
- ✅ Linki w dokumentacji zaktualizowane w ponad 8 lokalizacjach
- ✅ Indeks przykładów dokładnie odzwierciedla 4 lokalne przykłady
- ✅ Brak zdublowanych linków zewnętrznych w tabelach
- ✅ Wszystkie odniesienia nawigacji poprawne

#### Techniczne wdrożenie
- **Architektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + wzorzec Container Apps
- **Bezpieczeństwo**: Gotowość Managed Identity, sekrety w Key Vault
- **Monitorowanie**: Integracja Application Insights
- **Zarządzanie kosztami**: Śledzenie tokenów i optymalizacja użycia
- **Wdrożenie**: Pojedyncze polecenie `azd up` dla pełnej konfiguracji

### [v3.6.0] - 2025-11-19

#### Duża aktualizacja: Przykłady wdrożeń aplikacji kontenerowych
**Ta wersja wprowadza kompleksowe, gotowe do produkcji przykłady wdrożeń aplikacji kontenerowych z użyciem Azure Developer CLI (AZD), wraz z pełną dokumentacją i integracją ze ścieżką nauki.**

#### Dodano
- **🚀 Przykłady aplikacji kontenerowych**: Nowe lokalne przykłady w `examples/container-app/`:
  - [Przewodnik główny](examples/container-app/README.md): Kompleksowy przegląd wdrożeń konteneryzowanych, szybki start, produkcja i wzorce zaawansowane
  - [Proste API Flask](../../examples/container-app/simple-flask-api): Przyjazne dla początkujących REST API z obsługą skalowania do zera, sond zdrowotnych, monitoringu i rozwiązywania problemów
  - [Architektura mikroserwisów](../../examples/container-app/microservices): Wdrożenie produkcyjne wielu usług (API Gateway, Product, Order, User, Notification), asynchroniczna komunikacja, Service Bus, Cosmos DB, Azure SQL, distributed tracing, wdrożenia blue-green/canary
- **Najlepsze praktyki**: Bezpieczeństwo, monitoring, optymalizacja kosztów i wskazówki CI/CD dla obciążeń konteneryzowanych
- **Przykłady kodu**: Kompletny `azure.yaml`, szablony Bicep, implementacje usług w wielu językach (Python, Node.js, C#, Go)
- **Testowanie i rozwiązywanie problemów**: Scenariusze testowe end-to-end, polecenia monitoringu, przewodnik troubleshootingu

#### Zmieniono
- **README.md**: Zaktualizowano o nowe przykłady aplikacji kontenerowych i linki do nich w sekcji „Local Examples - Container Applications”
- **examples/README.md**: Zaktualizowano podkreślając przykłady aplikacji kontenerowych, dodano wpisy do macierzy porównawczej oraz zaktualizowano odniesienia do technologii/architektury
- **Course Outline & Study Guide**: Zaktualizowano z odniesieniami do nowych przykładów aplikacji kontenerowych i wzorców wdrożeniowych w odpowiednich rozdziałach

#### Zweryfikowano
- ✅ Wszystkie nowe przykłady można wdrożyć za pomocą `azd up` i stosują najlepsze praktyki
- ✅ Zaktualizowano odwołania krzyżowe w dokumentacji i nawigację
- ✅ Przykłady obejmują scenariusze od podstawowych po zaawansowane, w tym mikroserwisy produkcyjne

#### Notatki
- **Zakres**: Tylko dokumentacja i przykłady w języku angielskim
- **Kolejne kroki**: Rozszerzenie o dodatkowe zaawansowane wzorce kontenerów i automatyzację CI/CD w przyszłych wydaniach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Ta wersja wprowadza kompleksową zmianę nazwy produktu z "Microsoft Foundry" na "Microsoft Foundry" we wszystkich dokumentach angielskich, odzwierciedlając oficjalny rebranding Microsoftu.**

#### Zmiany
- **🔄 Aktualizacja nazwy produktu**: Kompletny rebranding z „Microsoft Foundry” na „Microsoft Foundry”
  - Zaktualizowano wszystkie odniesienia w dokumentacji angielskiej w folderze `docs/`
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Łącznie: 23 odwołania w 7 plikach dokumentacji

- **📁 Zmiany struktury folderów**:
  - `docs/ai-foundry/` przemianowano na `docs/microsoft-foundry/`
  - Zaktualizowano wszystkie odwołania krzyżowe odzwierciedlające nową strukturę folderów
  - Zweryfikowano linki nawigacyjne w całej dokumentacji

- **📄 Zmiany nazw plików**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Wszystkie linki wewnętrzne zaktualizowano, by wskazywały nową nazwę pliku

#### Zaktualizowane pliki
- **Dokumentacja rozdziałów** (7 plików):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizacje odniesień do nazwy produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - już używa Microsoft Foundry (z wcześniejszych aktualizacji)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 zaktualizowane odniesienia (przegląd, opinie społeczności, dokumentacja)
  - `docs/getting-started/azd-basics.md` - 4 zaktualizowane linki krzyżowe
  - `docs/getting-started/first-project.md` - 2 zaktualizowane linki nawigacyjne rozdziałów
  - `docs/getting-started/installation.md` - 2 zaktualizowane linki do następnego rozdziału
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 zaktualizowane odniesienia (nawigacja, społeczność Discord)
  - `docs/troubleshooting/common-issues.md` - 1 zaktualizowany link nawigacyjny
  - `docs/troubleshooting/debugging.md` - 1 zaktualizowany link nawigacyjny

- **Pliki struktury kursu** (2 pliki):
  - `README.md` - 17 zaktualizowanych odniesień (przegląd kursu, tytuły rozdziałów, sekcja szablonów, wgląd społeczności)
  - `course-outline.md` - 14 zaktualizowanych odniesień (przegląd, cele nauki, zasoby rozdziałów)

#### Zweryfikowano
- ✅ Brak pozostałych odniesień do ścieżek folderu "ai-foundry" w dokumentach angielskich
- ✅ Brak pozostałych odniesień do nazwy produktu “Microsoft Foundry” w dokumentach angielskich
- ✅ Wszystkie linki nawigacyjne działają w nowej strukturze folderów
- ✅ Zmiany nazw plików i folderów wykonane pomyślnie
- ✅ Zweryfikowano odwołania krzyżowe między rozdziałami

#### Notatki
- **Zakres**: Zmiany zastosowano tylko w dokumentacji angielskiej w folderze `docs/`
- **Tłumaczenia**: Foldery tłumaczeń (`translations/`) nie zostały zaktualizowane w tej wersji
- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie były aktualizowane w tej wersji
- **Przykłady**: Pliki przykładów mogą nadal odnosić się do nazewnictwa legacy (do poprawy w przyszłych aktualizacjach)
- **Linki zewnętrzne**: Zewnętrzne adresy URL i odwołania do repozytoriów GitHub pozostają niezmienione

#### Przewodnik migracji dla współtwórców
Jeśli posiadasz lokalne gałęzie lub dokumentację odwołującą się do starej struktury:
1. Zaktualizuj odniesienia folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Zaktualizuj odniesienia plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamień nazwę produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Sprawdź, czy wszystkie wewnętrzne linki dokumentacji działają poprawnie

---

### [v3.4.0] - 2025-10-24

#### Ulepszenia podglądu infrastruktury i walidacji
**Ta wersja wprowadza kompleksowe wsparcie dla nowej funkcji podglądu w Azure Developer CLI oraz poprawia doświadczenie użytkownika w warsztatach.**

#### Dodano
- **🧪 Dokumentacja funkcji azd provision --preview**: Kompleksowe omówienie nowej funkcji podglądu infrastruktury
  - Odniesienia do komend i przykłady użycia w ściągawce
  - Szczegółowa integracja w przewodniku po provisioning z przypadkami użycia i korzyściami
  - Integracja kontroli wstępnej dla bezpieczniejszej walidacji wdrożeń
  - Aktualizacje przewodnika startowego z naciskiem na bezpieczne praktyki wdrożeniowe
- **🚧 Baner statusu warsztatu**: Profesjonalny baner HTML wskazujący status rozwoju warsztatu
  - Gradientowy wzór z symbolami budowy dla czytelnej komunikacji z użytkownikiem
  - Znacznik czasu ostatniej aktualizacji dla transparentności
  - Responsywny design dostosowany do wszystkich typów urządzeń mobilnych

#### Ulepszenia
- **Bezpieczeństwo infrastruktury**: Funkcja podglądu zintegrowana w całej dokumentacji wdrożeń
- **Walidacja przed wdrożeniem**: Automatyczne skrypty zawierają teraz testy podglądu infrastruktury
- **Przepływ pracy dewelopera**: Zaktualizowane sekwencje komend uwzględniające podgląd jako najlepszą praktykę
- **Doświadczenie warsztatowe**: Jasno określone oczekiwania wobec użytkowników dotyczące statusu tworzenia zawartości

#### Zmiany
- **Najlepsze praktyki wdrożeniowe**: Model pracy „preview-first” jest teraz rekomendowany
- **Przepływ dokumentacji**: Walidacja infrastruktury przeniesiona na wcześniejsze etapy nauki
- **Prezentacja warsztatowa**: Profesjonalna komunikacja statusu z wyraźnym harmonogramem rozwoju

#### Ulepszone aspekty
- **Podejście bezpieczeństwa**: Możliwość weryfikacji zmian infrastruktury przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu można udostępniać w celu przeglądu i zatwierdzenia
- **Świadomość kosztów**: Lepsze zrozumienie kosztów zasobów przed provisioningiem
- **Redukcja ryzyka**: Mniej błędów wdrożeń dzięki wczesnej walidacji

#### Implementacja techniczna
- **Integracja wielodokumentowa**: Funkcja podglądu opisana w 4 kluczowych plikach
- **Schematy poleceń**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd uwzględniony w workflow walidacyjnym i skryptach
- **Wizualne oznaczenia**: Wyraźne oznaczenia NOWYCH funkcji dla łatwego odnalezienia

#### Infrastruktura warsztatu
- **Komunikacja statusu**: Profesjonalny baner HTML z gradientowym stylem
- **Doświadczenie użytkownika**: Jasna informacja o statusie rozwoju, zapobiegająca nieporozumieniom
- **Profesjonalna prezentacja**: Utrzymanie wiarygodności repozytorium wraz z ustawieniem oczekiwań
- **Transparentność harmonogramu**: Znacznik czasu ostatniej aktualizacji z października 2025 roku

### [v3.3.0] - 2025-09-24

#### Rozszerzone materiały warsztatowe i interaktywne doświadczenie nauki
**Ta wersja wprowadza kompletne materiały warsztatowe z przeglądem w przeglądarce oraz ustrukturyzowanymi ścieżkami nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatowy**: Warsztat w przeglądarce z funkcją podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatowe**: 7-etapowa ścieżka nauki od odkrycia do dostosowania
  - 0-Wprowadzenie: Przegląd warsztatu i konfiguracja
  - 1-Wybór-szablonu-AI: Odkrywanie i wybór szablonu
  - 2-Walidacja-szablonu-AI: Procedury wdrażania i walidacji
  - 3-Analiza-szablonu-AI: Zrozumienie architektury szablonu
  - 4-Konfiguracja-szablonu-AI: Konfiguracja i dostosowanie
  - 5-Dostosowanie-szablonu-AI: Zaawansowane modyfikacje i iteracje
  - 6-Zamknięcie-infrastruktury: Sprzątanie i zarządzanie zasobami
  - 7-Podsumowanie: Streszczenie i kolejne kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia nauki
- **🎯 Praktyczna ścieżka nauki**: Metodyka 3 kroków (Odkrywanie → Wdrożenie → Dostosowanie)
- **📱 Integracja GitHub Codespaces**: Bezproblemowa konfiguracja środowiska deweloperskiego

#### Ulepszenia
- **Laboratorium AI**: Rozszerzone o kompleksowy 2-3 godzinny ustrukturyzowany kurs nauki
- **Dokumentacja warsztatowa**: Profesjonalna prezentacja z nawigacją i elementami wizualnymi
- **Postęp nauki**: Jasne, krok po kroku, od wyboru szablonu do wdrożenia produkcyjnego
- **Doświadczenie dewelopera**: Zintegrowane narzędzia upraszczające workflow programistyczne

#### Usprawnienia
- **Dostępność**: Interfejs w przeglądarce z funkcją wyszukiwania, kopiowania i przełącznikiem motywów
- **Nauka we własnym tempie**: Elastyczna struktura warsztatu dostosowana do różnych prędkości nauki
- **Praktyczne zastosowanie**: Scenariusze wdrożeń rzeczywistych szablonów AI
- **Integracja społeczności**: Wsparcie warsztatowe i współpraca przez Discord

#### Cechy warsztatu
- **Wbudowane wyszukiwanie**: Szybkie odnajdywanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcja kopiowania po najechaniu dla wszystkich przykładów kodu
- **Przełącznik motywów**: Tryb ciemny/jasny dla różnych preferencji
- **Zasoby wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia
- **Integracja pomocy**: Bezpośredni dostęp do Discorda dla wsparcia społeczności

### [v3.2.0] - 2025-09-17

#### Duża restrukturyzacja nawigacji i system nauki oparty na rozdziałach
**Ta wersja wprowadza kompleksową strukturę nauki opartą na rozdziałach wraz z ulepszoną nawigacją w całym repozytorium.**

#### Dodano
- **📚 System nauki oparty na rozdziałach**: Przebudowano cały kurs na 8 progresywnych rozdziałów nauki
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 min)
  - Rozdział 2: Rozwój AI jako pierwszy krok (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 min)
  - Rozdział 4: Infrastruktura jako kod i wdrożenia (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Wieloagentowe rozwiązania AI (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja i planowanie przed wdrożeniem (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacyjne w całej dokumentacji
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Wskazówki ścieżki nauki**: Jasne punkty wejścia dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja z odwołaniami krzyżowymi**: Wyraźne powiązane rozdziały i wymagania wstępne

#### Ulepszenia
- **Struktura README**: Zmieniona w platformę nauki z organizacją opartą na rozdziałach
- **Nawigacja dokumentacji**: Każda strona zawiera kontekst rozdziału i wskazówki dotyczące postępów
- **Organizacja szablonów**: Przykłady i szablony przypisane do odpowiednich rozdziałów nauki
- **Integracja zasobów**: Ściągawki, FAQ i przewodniki po nauce powiązane z odpowiednimi rozdziałami
- **Integracja warsztatów**: Laboratoria praktyczne powiązane z wieloma celami naukowymi rozdziałów

#### Zmiany
- **Postęp nauki**: Przejście od liniowej dokumentacji do elastycznego systemu nauki opartego na rozdziałach
- **Umiejscowienie konfiguracji**: Przewodnik po konfiguracji przeniesiony jako Rozdział 3 dla lepszego przepływu nauki
- **Integracja treści AI**: Lepsze wkomponowanie zawartości związanej z AI w kurs
- **Treści produkcyjne**: Zaawansowane wzorce zebrane w Rozdziale 8 dla uczących się na poziomie korporacyjnym

#### Ulepszenia
- **Doświadczenie użytkownika**: Wyraźne okruszki nawigacyjne i wskaźniki postępów w rozdziałach
- **Dostępność**: Spójne wzory nawigacji ułatwiające poruszanie się po kursie
- **Profesjonalna prezentacja**: Struktura kursu w stylu uniwersyteckim, odpowiednia dla szkoleń akademickich i korporacyjnych
- **Efektywność nauki**: Skrócenie czasu znajdowania właściwych treści dzięki lepszej organizacji

#### Implementacja techniczna
- **Nagłówki nawigacji**: Ustandaryzowana nawigacja rozdziałów w ponad 40 plikach dokumentacji
- **Nawigacja w stopce**: Spójne wskazówki dotyczące postępów i wskaźniki ukończenia rozdziałów
- **Odwołania krzyżowe**: Kompleksowy system linków wewnętrznych łączących powiązane zagadnienia
- **Mapowanie rozdziałów**: Szablony i przykłady jasno powiązane z celami nauki

#### Ulepszenia przewodnika nauki
- **📚 Kompleksowe cele nauki**: Przebudowany przewodnik nauki dostosowany do systemu 8 rozdziałów
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera konkretne cele nauki i ćwiczenia praktyczne
- **📋 Śledzenie postępów**: Tygodniowy harmonogram nauki z mierzalnymi wynikami i listami kontrolnymi ukończenia
- **❓ Pytania oceniające**: Pytania weryfikujące wiedzę dla każdego rozdziału z profesjonalnymi wynikami
- **🛠️ Ćwiczenia praktyczne**: Działania hands-on z rzeczywistymi scenariuszami wdrożeń i rozwiązywania problemów
- **📊 Postęp umiejętności**: Wyraźny rozwój od podstawowych koncepcji po wzorce korporacyjne z naciskiem na rozwój kariery
- **🎓 Ramy certyfikacji**: Wyniki w zakresie rozwoju zawodowego i system rozpoznania społecznościowego
- **⏱️ Zarządzanie harmonogramem**: Ustrukturyzowany 10-tygodniowy plan nauki z walidacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone wieloagentowe rozwiązania AI
**Ta wersja ulepsza wieloagentowe rozwiązanie retailowe poprzez lepsze nazewnictwo agentów i rozszerzoną dokumentację.**

#### Zmiany
- **Terminologia wieloagentowa**: „Agent Cora” zastąpiony nazwą „Agent klienta” w całym wieloagentowym rozwiązaniu retail dla lepszej jasności
- **Architektura agenta**: Zaktualizowano całą dokumentację, szablony ARM oraz przykłady kodu, aby stosować spójne nazewnictwo „Agent klienta”
- **Przykłady konfiguracji**: Zmodernizowano wzorce konfiguracji agenta z nowymi konwencjami nazewnictwa
- **Spójność dokumentacji**: Zapewniono profesjonalne i opisowe nazwy agentów we wszystkich odniesieniach

#### Ulepszone
- **Pakiet szablonów ARM**: Zaktualizowano retail-multiagent-arm-template o odniesienia do agenta Customer
- **Diagramy architektury**: Odświeżone diagramy Mermaid z zaktualizowanymi nazwami agentów
- **Przykłady kodu**: Klasy Pythona i przykłady implementacji używają teraz nazewnictwa CustomerAgent
- **Zmienne środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe, aby używały konwencji CUSTOMER_AGENT_NAME

#### Ulepszenia
- **Doświadczenie dewelopera**: Bardziej przejrzyste role i obowiązki agentów w dokumentacji
- **Gotowość produkcyjna**: Lepsze dostosowanie do korporacyjnych konwencji nazewnictwa
- **Materiały edukacyjne**: Intuicyjniejsze nazewnictwo agentów do celów edukacyjnych
- **Użyteczność szablonów**: Uproszczone rozumienie funkcji agentów i wzorców wdrożeniowych

#### Szczegóły techniczne
- Zaktualizowano diagramy architektury Mermaid z odniesieniami do CustomerAgent
- Zastąpiono nazwy klas CoraAgent na CustomerAgent w przykładach Pythona
- Zmieniono konfiguracje JSON szablonu ARM na typ agenta "customer"
- Zmieniono zmienne środowiskowe z CORA_AGENT_* na CUSTOMER_AGENT_*
- Odświeżono wszystkie polecenia wdrożeniowe i konfiguracje kontenerów

### [v3.0.0] - 2025-09-12

#### Główne zmiany - Skupienie na deweloperach AI i integracja z Microsoft Foundry
**Ta wersja przekształca repozytorium w kompleksowe zasoby edukacyjne skupione na AI z integracją Microsoft Foundry.**

#### Dodano
- **🤖 Ścieżka nauki AI-First**: Kompleksowa restrukturyzacja z priorytetem dla deweloperów i inżynierów AI
- **Przewodnik integracji Microsoft Foundry**: Kompleksowa dokumentacja łączenia AZD z usługami Microsoft Foundry
- **Wzorce wdrożeń modeli AI**: Szczegółowy przewodnik po wyborze modeli, konfiguracji i strategiach wdrożeń produkcyjnych
- **Warsztat AI**: 2-3 godzinny praktyczny warsztat konwersji aplikacji AI na rozwiązania wdrażalne przez AZD
- **Najlepsze praktyki AI w produkcji**: Wzorce korporacyjne do skalowania, monitorowania i zabezpieczania obciążeń AI
- **Przewodnik rozwiązywania problemów AI**: Kompletna pomoc techniczna dla modeli Microsoft Foundry, Cognitive Services i wdrożeń AI
- **Galeria szablonów AI**: Wybrane szablony Microsoft Foundry z ocenami złożoności
- **Materiały warsztatowe**: Pełna struktura warsztatów z praktycznymi laboratoriami i materiałami referencyjnymi

#### Ulepszone
- **Struktura README**: Skupiona na deweloperach AI z 45% udziałem społeczności z Discord Microsoft Foundry
- **Ścieżki nauki**: Dedykowana ścieżka dewelopera AI obok tradycyjnych dla studentów i inżynierów DevOps
- **Rekomendacje szablonów**: Wyróżnione szablony AI, w tym azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart
- **Integracja społecznościowa**: Wzmocnione wsparcie społeczności Discord, z kanałami i dyskusjami dedykowanymi AI

#### Bezpieczeństwo i produkcyjna gotowość
- **Wzorce zarządzania tożsamością**: AI-specyficzne konfiguracje uwierzytelniania i zabezpieczeń
- **Optymalizacja kosztów**: Monitorowanie zużycia tokenów i kontrola budżetu dla obciążeń AI
- **Wieloregionalne wdrożenia**: Strategie globalnego wdrażania aplikacji AI
- **Monitorowanie wydajności**: Metryki specyficzne dla AI i integracja z Application Insights

#### Jakość dokumentacji
- **Liniowa struktura kursu**: Logiczna kolejność od podstawowych do zaawansowanych wzorców wdrożeń AI
- **Zweryfikowane URL-e**: Wszystkie linki zewnętrzne do repozytoriów sprawdzone i dostępne
- **Kompletny zbiór odnośników**: Wszystkie linki wewnętrzne zweryfikowane i działające
- **Gotowość produkcyjna**: Korporacyjne wzorce wdrożeniowe z przykładami z życia

### [v2.0.0] - 2025-09-09

#### Główne zmiany - Restrukturyzacja repozytorium i profesjonalne ulepszenia
**Ta wersja to gruntowna przebudowa struktury repozytorium i sposobu prezentacji treści.**

#### Dodano
- **Struktura nauki**: Wszystkie strony dokumentacji zawierają teraz sekcje Wstęp, Cele nauki i Rezultaty nauki
- **System nawigacji**: Linki Poprzednia/Następna lekcja w całej dokumentacji dla łatwej progresji nauki
- **Przewodnik po nauce**: Kompletny study-guide.md z celami nauki, ćwiczeniami praktycznymi i materiałami oceniania
- **Profesjonalna prezentacja**: Usunięto wszystkie emotikony dla lepszej dostępności i profesjonalnego wyglądu
- **Ulepszona struktura treści**: Lepsza organizacja i płynność materiałów edukacyjnych

#### Zmiany
- **Format dokumentacji**: Ustandaryzowano cały materiał z jednolitą strukturą nakierowaną na naukę
- **Przepływ nawigacji**: Wprowadzono logiczną progresję przez cały materiał edukacyjny
- **Prezentacja treści**: Usunięto elementy dekoracyjne na rzecz przejrzystego, profesjonalnego formatu
- **Struktura linków**: Zaktualizowano wszystkie linki wewnętrzne do nowego systemu nawigacji

#### Ulepszenia
- **Dostępność**: Usunięto zależności od emotikon dla lepszej kompatybilności z czytnikami ekranu
- **Profesjonalny wygląd**: Czysta, akademicka prezentacja odpowiednia dla nauki korporacyjnej
- **Doświadczenie nauki**: Strukturyzowane podejście z jasnymi celami i rezultatami dla każdej lekcji
- **Organizacja treści**: Lepszy logiczny przepływ i powiązania między tematami

### [v1.0.0] - 2025-09-09

#### Pierwsze wydanie - Kompleksowe repozytorium do nauki AZD

#### Dodano
- **Podstawowa struktura dokumentacji**
  - Kompletny series poradników startowych
  - Szczegółowa dokumentacja wdrożeń i provisioning
  - Rozbudowane zasoby rozwiązywania problemów i debugowania
  - Narzędzia i procedury walidacji przed wdrożeniem

- **Moduł wprowadzenia**
  - Podstawy AZD: Kluczowe pojęcia i terminologia
  - Przewodnik instalacji: Instrukcje dla różnych platform
  - Przewodnik konfiguracji: Ustawienia środowiska i uwierzytelnianie
  - Pierwszy projekt: Praktyczny poradnik krok po kroku

- **Moduł wdrożeń i provisioning**
  - Przewodnik wdrożeniowy: Kompletny workflow
  - Przewodnik provisioning: Infrastruktura jako kod z użyciem Bicep
  - Najlepsze praktyki wdrożeniowe w produkcji
  - Wzorce architektury wielousługowej

- **Moduł walidacji przed wdrożeniem**
  - Planowanie zasobów: Walidacja dostępności zasobów Azure
  - Wybór SKU: Kompleksowe wskazówki dotyczące warstw serwisowych
  - Kontrole przed lotem: Automatyczne skrypty walidacyjne (PowerShell i Bash)
  - Narzędzia szacowania kosztów i planowania budżetu

- **Moduł rozwiązywania problemów**
  - Typowe problemy: Często występujące zagadnienia i rozwiązania
  - Przewodnik debugowania: Systematyczne metody rozwiązywania problemów
  - Zaawansowane techniki diagnostyczne i narzędzia
  - Monitorowanie i optymalizacja wydajności

- **Zasoby i odniesienia**
  - Szybka ściągawka poleceń: Kluczowe komendy w pigułce
  - Słownik pojęć: Pełna definicja terminów i akronimów
  - FAQ: Szczegółowe odpowiedzi na częste pytania
  - Linki zewnętrzne i społeczność

- **Przykłady i szablony**
  - Przykład prostej aplikacji webowej
  - Szablon wdrożenia statycznej strony
  - Konfiguracja aplikacji kontenerowej
  - Wzorce integracji baz danych
  - Przykłady architektury mikroserwisów
  - Implementacje funkcji serverless

#### Funkcje
- **Wsparcie wieloplatformowe**: Instrukcje instalacji i konfiguracji dla Windows, macOS i Linux
- **Różne poziomy umiejętności**: Materiały dla studentów i profesjonalnych deweloperów
- **Praktyczne podejście**: Przykłady praktyczne i scenariusze z życia
- **Kompleksowe pokrycie**: Od podstawowych koncepcji po zaawansowane wzorce korporacyjne
- **Podejście security-first**: Najlepsze praktyki bezpieczeństwa w całym materiale
- **Optymalizacja kosztów**: Wskazówki dotyczące efektywnych kosztowo wdrożeń i zarządzania zasobami

#### Jakość dokumentacji
- **Szczegółowe przykłady kodu**: Praktyczne, przetestowane fragmenty kodu
- **Instrukcje krok po kroku**: Jasne i wykonalne wskazówki
- **Kompleksowa obsługa błędów**: Rozwiązywanie typowych problemów
- **Integracja najlepszych praktyk**: Standardy branżowe i zalecenia
- **Kompatybilność wersji**: Aktualne z najnowszymi usługami Azure i funkcjami azd

## Planowane przyszłe ulepszenia

### Wersja 3.1.0 (Planowana)
#### Rozszerzenie platformy AI
- **Wsparcie wielomodelowe**: Wzorce integracji dla Hugging Face, Azure Machine Learning i modeli niestandardowych
- **Frameworki agentów AI**: Szablony wdrożeń LangChain, Semantic Kernel i AutoGen
- **Zaawansowane wzorce RAG**: Opcje baz wektorowych poza Azure AI Search (Pinecone, Weaviate itd.)
- **Obserwowalność AI**: Ulepszone monitorowanie wydajności modeli, zużycia tokenów i jakości odpowiedzi

#### Doświadczenie dewelopera
- **Rozszerzenie VS Code**: Zintegrowane doświadczenie rozwoju AZD + Microsoft Foundry
- **Integracja GitHub Copilot**: Wspomagane przez AI generowanie szablonów AZD
- **Interaktywne tutoriale**: Ćwiczenia kodowania z automatyczną walidacją dla scenariuszy AI
- **Materiały wideo**: Dodatkowe tutoriale wideo dla wzrokowców skupiające się na wdrożeniach AI

### Wersja 4.0.0 (Planowana)
#### Wzorce korporacyjne AI
- **Ramy zarządzania**: Zarządzanie modelem AI, zgodność i audyt
- **SaaS wielonajemcy AI**: Wzorce obsługi wielu klientów z izolowanymi usługami AI
- **Wdrożenie Edge AI**: Integracja z Azure IoT Edge i instancjami kontenerów
- **Hybrydowa chmura AI**: Wzorce wielochmurowe i hybrydowe dla obciążeń AI

#### Zaawansowane funkcje
- **Automatyzacja pipeline AI**: Integracja MLOps z pipeline’ami Azure Machine Learning
- **Zaawansowane zabezpieczenia**: Wzorce zero-trust, prywatne punkty końcowe, ochrona przed zaawansowanymi zagrożeniami
- **Optymalizacja wydajności**: Zaawansowane strojenie i skalowanie dla aplikacji AI o wysokim przepływie
- **Globalna dystrybucja**: Wzorce CDN i cache’owania na brzegu sieci dla aplikacji AI

### Wersja 3.0.0 (Planowana) - Zastąpiona przez bieżące wydanie
#### Proponowane dodatki - Obecnie zaimplementowane w v3.0.0
- ✅ **Treści skupione na AI**: Kompleksowa integracja Microsoft Foundry (Zrealizowano)
- ✅ **Interaktywne tutoriale**: Praktyczny warsztat AI (Zrealizowano)
- ✅ **Zaawansowany moduł bezpieczeństwa**: AI-specyficzne wzorce zabezpieczeń (Zrealizowano)
- ✅ **Optymalizacja wydajności**: Strategie strojenia obciążeń AI (Zrealizowano)

### Wersja 2.1.0 (Planowana) - Częściowo zrealizowana w v3.0.0
#### Mniejsze ulepszenia - Część wykonana w obecnym wydaniu
- ✅ **Dodatkowe przykłady**: Scenariusze wdrożeń AI (Zrealizowano)
- ✅ **Rozszerzone FAQ**: Pytania i rozwiązywanie problemów dotyczących AI (Zrealizowano)
- **Integracja narzędzi**: Przewodniki integracji IDE i edytorów
- ✅ **Rozbudowa monitoringu**: AI-specyficzne wzorce monitorowania i alertów (Zrealizowano)

#### Nadal planowane na przyszłość
- **Dokumentacja zoptymalizowana dla urządzeń mobilnych**: Responsywny design dla nauki mobilnej
- **Dostęp offline**: Pakiety dokumentacji do pobrania
- **Rozszerzona integracja IDE**: Rozszerzenie VS Code dla przepływów pracy AZD + AI
- **Panel społeczności**: Metryki w czasie rzeczywistym i śledzenie wkładu społeczności

## Wkład w changelog

### Zgłaszanie zmian
Przy wkładzie w to repozytorium prosimy, aby wpisy w changelogu zawierały:

1. **Numer wersji**: Zgodnie z wersjonowaniem semantycznym (major.minor.patch)
2. **Datę**: Data wydania lub aktualizacji w formacie RRRR-MM-DD
3. **Kategorię**: Dodano, Zmieniono, Przestarzałe, Usunięte, Naprawione, Bezpieczeństwo
4. **Jasny opis**: Zwięzły opis zmiany
5. **Ocena wpływu**: Jak zmiany wpływają na użytkowników

### Kategorie zmian

#### Dodano
- Nowe funkcje, sekcje dokumentacji lub możliwości
- Nowe przykłady, szablony lub zasoby edukacyjne
- Dodatkowe narzędzia, skrypty lub pomocnicze

#### Zmieniono
- Modyfikacje istniejącej funkcjonalności lub dokumentacji
- Aktualizacje poprawiające jasność lub dokładność
- Restrukturyzacja treści lub organizacji

#### Przestarzałe
- Funkcje lub podejścia wycofywane
- Sekcje dokumentacji planowane do usunięcia
- Metody zastąpione lepszymi

#### Usunięte
- Funkcje, dokumentacja lub przykłady już nieistotne
- Nieaktualne informacje lub podejścia wycofane
- Nadmiarowa lub scalona treść

#### Naprawione
- Poprawki błędów w dokumentacji lub kodzie
- Rozwiązanie zgłoszonych problemów
- Ulepszenia dokładności lub funkcjonalności

#### Bezpieczeństwo
- Ulepszenia lub poprawki związane z bezpieczeństwem
- Aktualizacje najlepszych praktyk zabezpieczeń
- Usunięcie luk bezpieczeństwa

### Zasady wersjonowania semantycznego

#### Wersja główna (X.0.0)
- Zmiany łamiące kompatybilność wymagające działania użytkownika
- Znacząca przebudowa treści lub organizacji
- Zmiany fundamentalnego podejścia lub metodologii

#### Wersja mniejsza (X.Y.0)
- Nowe funkcje lub dodatki treści
- Ulepszenia zachowujące kompatybilność wsteczną
- Dodatkowe przykłady, narzędzia lub zasoby

#### Wersja poprawkowa (X.Y.Z)
- Poprawki błędów i korekty
- Niewielkie usprawnienia istniejącej zawartości
- Wyjaśnienia i drobne ulepszenia

## Opinia i sugestie społeczności

Aktywnie zachęcamy społeczność do przekazywania opinii, aby ulepszyć zasób edukacyjny:

### Jak przekazywać opinie
- **GitHub Issues**: Zgłaszanie problemów lub sugestii (szczególnie AI)
- **Dyskusje Discord**: Dzielenie się pomysłami i kontakt ze społecznością Microsoft Foundry
- **Pull Requests**: Bezpośrednie ulepszanie treści, zwłaszcza szablonów i przewodników AI
- **Discord Microsoft Foundry**: Udział w kanale #Azure dla dyskusji AZD + AI
- **Forum społeczności**: Uczestnictwo w szerszych dyskusjach dla deweloperów Azure

### Kategorie opinii
- **Dokładność treści AI**: Poprawki dotyczące integracji i wdrożeń usług AI
- **Doświadczenie edukacyjne**: Propozycje ulepszeń ścieżki nauki deweloperów AI
- **Braki treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI
- **Dostępność**: Ulepszenia dla zróżnicowanych potrzeb edukacyjnych
- **Integracja narzędzi AI**: Sugestie na lepszy workflow rozwoju AI
- **Wzorce wdrożeń AI w produkcji**: Prośby dotyczące korporacyjnych wzorców AI

### Zobowiązanie do odpowiedzi
- **Reakcja na zgłoszenia**: W ciągu 48 godzin od zgłoszenia problemu
- **Prośby o funkcje**: Ocena w ciągu tygodnia
- **Wkład społeczności**: Przegląd w ciągu tygodnia
- **Zagrożenia bezpieczeństwa**: Priorytet natychmiastowy z przyspieszoną reakcją

## Harmonogram utrzymania

### Regularne aktualizacje
- **Miesięczne przeglądy**: Weryfikacja dokładności treści i linków
- **Kwartalne aktualizacje**: Główne dodatki i poprawki
- **Półroczne przeglądy**: Kompleksowa restrukturyzacja i ulepszenia
- **Roczne wydania**: Wersje główne z istotnymi zmianami

### Monitorowanie i kontrola jakości
- **Automatyczne testy**: Regularna walidacja przykładów kodu i linków
- **Integracja opinii społeczności**: Regularne uwzględnianie sugestii użytkowników
- **Aktualizacje technologii**: Dostosowanie do najnowszych usług Azure i wydań azd
- **Audyt dostępności**: Regularne przeglądy oraz zasady inkluzywnego projektowania

## Polityka wsparcia wersji

### Wsparcie obecnej wersji
- **Najnowsza główna wersja**: Pełne wsparcie z regularnymi aktualizacjami
- **Poprzednia główna wersja**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy
- **Wersje starsze**: Tylko wsparcie społeczności, brak oficjalnych aktualizacji

### Wskazówki dotyczące migracji
Gdy wydawane są główne wersje, oferujemy:
- **Przewodniki migracji**: Instrukcje krok po kroku przejścia
- **Notatki o zgodności**: Szczegóły dotyczące zmian łamiących kompatybilność
- **Wsparcie narzędziowe**: Skrypty lub narzędzia wspomagające migrację
- **Wsparcie społeczności**: Dedykowane fora do pytań o migrację

---

**Nawigacja**
- **Poprzednia lekcja**: [Study Guide](resources/study-guide.md)
- **Następna lekcja**: Powrót do [Main README](README.md)

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wydaniach i ważnych aktualizacjach materiałów edukacyjnych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pomimo że dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku istotnych informacji zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->