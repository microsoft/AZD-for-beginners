# Dziennik zmian - AZD dla początkujących

## Wprowadzenie

Ten dziennik zmian dokumentuje wszystkie istotne zmiany, aktualizacje i ulepszenia w repozytorium AZD dla początkujących. Stosujemy zasady wersjonowania semantycznego i utrzymujemy ten log, aby pomóc użytkownikom zrozumieć, co zmieniło się między wersjami.

## Cele nauki

Przeglądając ten dziennik zmian, będziesz:
- Na bieżąco z nowymi funkcjami i dodatkami do treści
- Rozumieć ulepszenia w istniejącej dokumentacji
- Śledzić poprawki błędów i korekty zapewniające dokładność
- Obserwować rozwój materiałów edukacyjnych w czasie

## Efekty nauki

Po przejrzeniu wpisów w dzienniku zmian będziesz w stanie:
- Zidentyfikować nowe treści i zasoby dostępne do nauki
- Zrozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować swoją ścieżkę nauki na podstawie najnowszych materiałów
- Wnosić opinie i sugestie na temat przyszłych ulepszeń

## Historia wersji

### [v3.24.0]- 2026-11-04

#### Naprawiono
- Naprawiono nawigację kursu angielskiego, ścieżki przeniesionych stron, brakujące kotwice oraz przestarzałe odnośniki zewnętrzne, w tym link do rozdziału 2 przewodnika produkcyjnego AI.
- Przejrzano aktualne wytyczne względem opublikowanego AZD 1.37.2, agentów 1.0.0-beta.23 oraz ocen 1.0.0-beta.2. Udokumentowano osobny `azd ai eval` przepływ pracy i migrację konfiguracji optymalizacji.
- Poprawiono nieobsługiwane flagi CLI, granice uwierzytelniania, wskazówki dotyczące środowiska/sekretów w postaci zwykłego tekstu, aktualizacje infrastruktury, konfigurację modelu oraz przykłady destruktywnej naprawy.
- Odświeżono warsztat względem aktualnego przykładu AI Agents, obejmującego rzeczywiste haki, dane konfiguracyjne, testy ewaluacji, punkty wejścia red-teamingu i obserwowalności.
- Poprawiono przykładowe implementacje i naprawiono powiązane problemy z aplikacją/infrastrukturą/konfiguracją. Materiał dotyczący architektury handlu detalicznego jest wyraźnie oddzielony od kompletnej działającej aplikacji.
- Przywrócono macierz językową CodeQL, wybrano obsługę Node.js 24 dla kontenera developerskiego oraz skonfigurowano walidatory instalacji do raportowania nieudanych poleceń wersji.

#### Dodano
- Angielskojęzyczny offline checker linków/kotwic, testy regresyjne oraz przepływ pracy dokumentacji budujący warsztat w trybie ścisłym. Generowane tłumaczenia i tłumaczone obrazy są wyłączone.

#### Zakres walidacji
- Sprawdzenia źródła, składni, konfiguracji, lokalnego zachowania oraz linków sieciowych nie ustanawiają możliwości wdrożenia na żywo do Azure, limitów, RBAC, dostępności modelu regionalnego, rozliczeń, zgodności bezpieczeństwa ani gotowości produkcyjnej.
- Starsze wpisy poniżej są zapisami historycznymi, a nie aktualnymi poleceniami czy instrukcjami wydania.

### [v3.23.0] - 2026-07-13

#### Odświeżenie AZD 1.27.1: Aktualizacja wersji
**Ta wersja ponownie weryfikuje kurs względem `azd` `1.27.1` (lipiec 2026, najnowsze stabilne wydanie) oraz aktualnego podglądu rozszerzenia agenta AI `azure.ai.agents` `1.0.0-beta.5`, aktualizując wszystkie banery „validated against” po wydaniach 1.26.0, 1.27.0 i 1.27.1.**

#### Zmiany
- **✅ Zaktualizowano bazę walidacyjną** z `azd 1.25.6` (czerwiec 2026) do `azd 1.27.1` (lipiec 2026) w głównym README, wszystkich README rozdziałów, lekcji dotyczącej kontenera developerskiego w rozdziale 1 (w tym przykładów z przypiętymi wersjami), lekcji szablonów niestandardowych w rozdziale 4, lekcji multi-agent w rozdziale 5 oraz dokumentacji warsztatu
- **🤖 Odświeżono bazę rozdziału 2** z `azd 1.23.12` (marzec 2026) do `azd 1.27.1` w `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` oraz `microsoft-foundry-integration.md`; zaktualizowano daty notatek walidacyjnych do 2026-07-13
- **🧩 Podniesiono wersję rozszerzenia agenta AI** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` do aktualnego wydania `1.0.0-beta.5` w README rozdziału 2 oraz w `agents.md`
- **🧪 Zaktualizowano przykład walidacji warsztatu** (wynik `azd version`) do `1.27.1`

#### Notatki dotyczące odpowiednich wydań azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Wsparcie Go dla Azure Functions na Flex Consumption, filtry subskrypcji per-tenant `azd config sub-filter`, samodzielne pakiety rozszerzeń (`azd x pack --bundle`) oraz `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelowanie projektów/agentów Azure AI Foundry bezpośrednio w `azure.yaml` (inicjalizacja bez Bicep/Terraform), wsparcie dla wdrożeń kontenerów w App Service (`host: appservice` + `language: docker`), bezpośrednie `-s/--source` dla poleceń `azd extension` oraz `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flaga `--no-dependencies` dla `azd extension install`, domyślne wykluczenie przestarzałych modeli z katalogu/podpowiedzi limitów oraz kilka poprawek błędów

#### Zaktualizowane pliki
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Uzupełnienie luk dla początkujących #2: Tworzenie szablonów, Dev Containers, Pulumi, Azure DevOps, Service Principals i więcej
**Ta wersja zamyka pozostałe średniozaawansowane luki ujawnione przez analizę pokrycia azd: jak tworzyć i publikować własne szablony, odtwarzalne środowiska Dev Containers/Codespaces, dostawcę infrastruktury Pulumi, przewodnik po CI/CD Azure DevOps, uwierzytelnianie za pomocą service-principal, wskazówki wyboru hosta (AKS/Spring Apps), wyjaśnienia `azd restore`/`azd package`, obsługę błędów haków oraz praktyki zespołowe/współdzielone środowiska.**

#### Dodano
- **🧱 Nowa lekcja w rozdziale 4** `docs/chapter-04-infrastructure/custom-templates.md` — tworzenie własnego szablonu azd: wymagana struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametryzacja infrastruktury za pomocą tokenu zasobu `uniqueString()` oraz taga `azd-env-name`, testowanie lokalne z `azd init --template <local-path>`, publikowanie na GitHub oraz zgłaszanie do galerii Awesome AZD
- **📦 Nowa lekcja w rozdziale 1** `docs/chapter-01-foundation/dev-containers.md` — odtwarzalne środowiska azd z Dev Containers i GitHub Codespaces: minimalny `.devcontainer/devcontainer.json` używający oficjalnej funkcji `ghcr.io/azure/azure-dev/azd`, funkcje specyficzne dla języka, `docker-in-docker` dla hostów kontenerów oraz `azd auth login --use-device-code` dla logowania zdalnego
- **🧩 Sekcja Pulumi z azd** w `docs/chapter-04-infrastructure/provisioning.md` — konfiguracja `infra.provider: pulumi`, układ folderów Pulumi, stosy mapowane do środowisk azd, wymagane wyjścia/tagowanie oraz identyczny przepływ `azd up` / `azd down`
- **🎯 Wskazówki wyboru hosta** w `docs/chapter-04-infrastructure/provisioning.md` — przyjazne dla początkujących porównanie `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` i `springapp` oraz wskazówki, kiedy wybrać AKS lub Azure Spring Apps
- **🛠️ Przewodnik CI/CD Azure DevOps** w `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, połączenie serwisowe z federacją tożsamości (OIDC), wygenerowane `azure-dev.yml` i konfiguracja grupy zmiennych
- **🔑 Service Principals (wzorzec 4)** dodany do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, uwierzytelnianie bez interakcji `azd auth login` z tajnym kluczem klienta versus poświadczenia federowane/OIDC, kiedy używać i bezpieczne przechowywanie poświadczeń
- **🪝 Sekcja obsługi błędów haków** w `docs/chapter-04-infrastructure/deployment-guide.md` — kody wyjścia, `set -e`, `continueOnError`, testowanie haków osobno za pomocą `azd hooks run`, powłoki specyficzne dla systemu operacyjnego oraz `--debug`
- **👥 Sekcja zespołowego/współdzielonego środowiska** w `docs/chapter-03-configuration/configuration.md` — co jest w `.azure/`, co ignorować w git, środowiska dla poszczególnych programistów, `azd env list`/`select` oraz dostarczanie wartości środowiskowych w CI/CD
- **🧰 Wyjaśnienia `azd restore` oraz rozszerzone `azd package`** w `resources/cheat-sheet.md` — przywracanie zależności i budowanie artefaktu do wdrożenia bez faktycznego wdrażania

#### Zmiany
- **🧭 Tabela lekcji w rozdziale 4** zaktualizowana o nową lekcję „Tworzenie własnego szablonu” (Lekcja 3)
- **🧭 Tabela lekcji w rozdziale 1** zaktualizowana o nową lekcję „Dev Containers & Codespaces” (Lekcja 5); stopki nawigacyjne połączone między `bring-your-own-app.md` i `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Uzupełnienie luk dla początkujących: Lekcja praktyczna multi-agenta, „Bring Your Own App”, Terraform i przewodnik CI/CD
**Ta wersja zamyka największe luki dla kompletnych początkujących, dodając dwie nowe praktyczne lekcje (przewodnik deployowalnego multi-agenta oraz dodanie azd do istniejącej aplikacji), przyjazne wprowadzenie do haków, sekcję Terraform z azd, krok po kroku przewodnik po pipeline GitHub Actions, wyjaśnienie nowych rozszerzeń podglądowych oraz explicit checklistę weryfikacji wdrożenia.**

#### Dodano
- **🤝 Nowa lekcja w rozdziale 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — w pełni praktyczny, deployowalny przewodnik po dwóch agentach (orchestrator + specjaliści) wykorzystujący rzeczywisty szablon (`contoso-creative-writer`), obejmujący kiedy używać multi-agenta, przepływ pracy `azd up`, zrozumienie wdrożonych zasobów, śledzenie między-agentowe, dostosowania i sprzątanie
- **📦 Nowa lekcja w rozdziale 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak dodać azd do istniejącego projektu z `azd init` („użyj kodu w bieżącym katalogu”), zrozumienie `azure.yaml` i `infra/`, `azd infra generate`, wykrywanie hosta oraz wdrażanie z `azd up`
- **🌐 Sekcja Terraform z azd** dodana do `docs/chapter-04-infrastructure/provisioning.md` — konfiguracja `infra.provider: terraform`, układ folderów `.tf`, wymagane wyjścia `AZURE_*` i tagowanie `azd-env-name` oraz identyczny przepływ `azd up` / `azd down` (zamyka lukę, gdzie wsparcie Terraform było deklarowane, ale pokazano tylko Bicep)
- **⚙️ Krok po kroku przewodnik GitHub Actions** w `docs/chapter-08-production/production-ai-practices.md` — od repozytorium GitHub do automatycznych wdrożeń: `azd pipeline config`, federowane poświadczenia OIDC (bez przechowywanych sekretów), wygenerowane `azure-dev.yml` oraz wskazówki dotyczące sekretów kontra zmienne
- **🪝 Wprowadzenie dla początkujących „Nowe haki?”** w `docs/chapter-04-infrastructure/deployment-guide.md` — czym jest hak, tabela etapów haków, minimalny pierwszy hak oraz ręczne uruchamianie haków z `azd hooks run`
- **✅ Dodano checklistę „Zweryfikuj swoje wdrożenie”** do kroku 5 w `docs/chapter-01-foundation/first-project.md` — test dymny, sprawdzenie endpointa zdrowia oraz explicite kryteria sukcesu
- **🧩 Wyjaśnienie nowych rozszerzeń podglądowych** `azure.ai.skills` oraz `azure.ai.connections` (czym są i kiedy z nich korzystać) w `docs/chapter-08-production/production-ai-practices.md`

#### Zmiany
- **🧭 Tabela lekcji w rozdziale 5** poprawiona: `multi-agent-basics.md` jest teraz Lekcją 1 (jedyną w pełni praktyczną lekcją), z uczciwym oznaczeniem, że Lekcja 2 jest w rozdziale 6, a scenariusz Retail to blueprint architektury, a nie szablon na jedno polecenie
- **🧭 Tabela lekcji w rozdziale 1** teraz zawiera nową lekcję „Bring Your Own App” (Lekcja 4)
- **🔗 Zaktualizowano stopki nawigacyjne**: `first-project.md` teraz odsyła do `bring-your-own-app.md`

#### Naprawiono
- **🧱 Zamknięto lukę „deklarowane, ale brakujące” Terraform** — kurs wcześniej odnosił się do wsparcia Terraform bez jego pokazania
- **🔀 Poprawiono mylące cross-odnośniki w rozdziale 5**, które sugerowały istnienie pełnej implementacji multi-agenta, podczas gdy była tylko architektura blueprint

#### Zaktualizowane pliki
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nowy)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nowy)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Odświeżenie AZD 1.25.6, Pełne Polecenia Cyklu Życia Agenta i Rebranding Aspire
**Ta wersja ponownie weryfikuje kurs względem `azd` `1.25.6` (czerwiec 2026) oraz rozszerzenia `azure.ai.agents` `0.1.40-preview`, rozszerza wskazówki AI od "szkielecinowania agenta" do pełnego cyklu życia agenta (test → ewaluacja → optymalizacja → inspekcja → usunięcie), prezentuje nowe rozszerzenia podglądowe `azure.ai.skills` i `azure.ai.connections` oraz zaznacza rebranding produktu z ".NET Aspire" na "Aspire".**

#### Dodano
- **🔁 Pełne pokrycie cyklu życia agenta** dla początkujących i inżynierów AI w całej dokumentacji:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela cyklu życia (szkic → test → pomiar → ulepszenie → inspekcja → sprzątanie) dodana do sekcji Rozszerzenia i Polecenia AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nowa sekcja "Zarządzanie cyklem życia agenta" obejmująca `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` oraz `delete --force`
  - `resources/cheat-sheet.md` — Rozszerzone polecenia agenta AI z `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` i `delete --force`
- **🧩 Nowe rozszerzenia podglądowe** udokumentowane: `azure.ai.skills` (ponowne wykorzystanie umiejętności agenta) oraz `azure.ai.connections` (połączenia Foundry) dodane do tabeli rozszerzeń i ściągawki
- **⏱️ Wskazówki dotyczące czasu odpowiedzi** — przykłady `azd ai agent invoke` teraz pokazują sumaryczne opóźnienie i czas do pierwszego bajtu
- **📌 Baner wersji** w głównym README kierujący uczących się do `azd version` i `azd upgrade`

#### Zmieniono
- **✅ Zaktualizowano punkt odniesienia walidacji** z `azd 1.23.12` (marzec 2026) na `azd 1.25.6` (czerwiec 2026) we wszystkich plikach README rozdziałów i dokumentach warsztatowych
- **🤖 Zaktualizowano notatkę rozszerzenia do rozdziału 2** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Zaktualizowano przykład walidacji warsztatu** (wynik `azd version`) do `1.25.6`
- **🧭 Odświeżono README "Co nowego w azd dziś"** aby podkreślić pełny cykl życia agenta, nowe rozszerzenia AI oraz ostatnie poprawki jakości życia (`azd init` idempotencja, `azd auth login` czyszczenie przeterminowanych tokenów, `azd tool` prompt pierwszego uruchomienia)
- **📖 Plik agents.md w rozdziale 2 (Opcja 4)** teraz kieruje uczących się do poleceń cyklu życia po wdrożeniu zamiast zatrzymywać się na `azd up`

#### Naprawiono
- **🏷️ Nazewnictwo produktu** — dodano notatkę o rebrandingu Aspire (".NET Aspire" to teraz po prostu "Aspire"); wsparcie Aspire w azd pozostaje bez zmian
- **🔎 Walidacja na żywo wydania** potwierdzona na podstawie kanału wydań Azure Developer CLI: stabilne CLI `1.25.6` (2026-06-12) oraz `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Zaktualizowane pliki
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Wyjaśnienie początkującej konfiguracji, walidacja ustawień i końcowe porządki w poleceniach AZD
**Ta wersja jest kontynuacją obszernej walidacji AZD 1.23, skoncentrowaną na dokumentacji dla początkujących: wyjaśnia zasady uwierzytelniania z preferencją AZD, dodaje skrypty walidacji lokalnej konfiguracji, weryfikuje kluczowe polecenia na żywym AZD CLI oraz usuwa ostatnie przestarzałe odwołania do poleceń źródłowych w języku angielskim poza changelogiem.**

#### Dodano
- **🧪 Skrypty walidacji konfiguracji dla początkujących** z `validate-setup.ps1` i `validate-setup.sh`, aby uczący się mogli sprawdzić wymagane narzędzia przed rozpoczęciem rozdziału 1
- **✅ Wstępne kroki walidacji konfiguracji** w głównym README i README rozdziału 1, aby brakujące wymagania były wychwytywane przed `azd up`

#### Zmieniono
- **🔐 Wskazówki uwierzytelniania dla początkujących** teraz konsekwentnie traktują `azd auth login` jako podstawową ścieżkę dla przepływów AZD, zaś `az login` jest wskazane jako opcjonalne, chyba że używane są bezpośrednio polecenia Azure CLI
- **📚 Przebieg onboardingu w rozdziale 1** teraz wskazuje uczącym się walidację lokalnej konfiguracji przed instalacją, uwierzytelnianiem i pierwszym wdrożeniem
- **🛠️ Komunikaty walidatora** teraz jasno oddzielają wymagania blokujące od opcjonalnych ostrzeżeń Azure CLI dla ścieżki początkującego wyłącznie z AZD
- **📖 Dokumentacja konfiguracji, rozwiązywania problemów i przykładów** teraz rozróżnia wymaganą autoryzację AZD oraz opcjonalne logowanie do Azure CLI tam, gdzie wcześniej brakowało kontekstu

#### Naprawiono
- **📋 Pozostałe anglojęzyczne odwołania do poleceń** zaktualizowane do aktualnej formy AZD, w tym `azd config show` na ściągawce i `azd monitor --overview` tam, gdzie była wskazana ogólna wskazówka portalu Azure
- **🧭 Łagodniejsze stwierdzenia w rozdziale 1 dla początkujących** by uniknąć zbyt śmiałych obietnic gwarancji zero-błędów lub automatycznego wycofywania dla wszystkich szablonów i zasobów Azure
- **🔎 Walidacja CLI na żywo** potwierdziła wsparcie dla `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` i `azd down --force --purge`

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

#### Walidacja AZD 1.23.12, Rozszerzenie Środowiska Warsztatu i Odświeżenie Modelu AI
**Ta wersja wykonuje przegląd walidacyjny dokumentacji względem `azd` `1.23.12`, aktualizuje przestarzałe przykłady poleceń AZD, odświeża wskazówki dotyczące modeli AI do bieżących domyślnych, oraz rozszerza instrukcje warsztatowe poza GitHub Codespaces na kontenery deweloperskie i lokalne klony.**

#### Dodano
- **✅ Notatki walidacyjne w kluczowych rozdziałach i dokumentach warsztatowych** dla jasnego wskazania testowanej bazy AZD dla uczących się korzystających z nowszych lub starszych wersji CLI
- **⏱️ Wskazówki dotyczące limitu czasu wdrożenia** dla długotrwałych wdrożeń aplikacji AI z użyciem `azd deploy --timeout 1800`
- **🔎 Kroki inspekcji rozszerzeń** z `azd extension show azure.ai.agents` w dokumentach przepływu AI
- **🌐 Szersze wskazówki dotyczące środowiska warsztatowego** obejmujące GitHub Codespaces, kontenery deweloperskie oraz lokalne klony przy użyciu MkDocs

#### Zmieniono
- **📚 README wstępne do rozdziałów** konsekwentnie zawierają informację o walidacji względem `azd 1.23.12` w sekcjach fundamentów, konfiguracji, infrastruktury, wielu agentów, przed wdrożeniem, rozwiązywaniu problemów i produkcji
- **🛠️ Odwołania do poleceń AZD** zaktualizowane do aktualnych form w całej dokumentacji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` lub `azd env get-value(s)` w zależności od kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, gdzie wymagana jest ogólna prezentacja Application Insights
- **🧪 Upraszczanie przykładów podglądowych provisioningu** do obecnie wspieranych, takich jak `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Przebieg warsztatu** zaktualizowany, aby pozwolić uczącym się ukończyć ćwiczenia w Codespaces, kontenerze dev lub lokalnym klonie zamiast zakładać uruchomienie wyłącznie w Codespaces
- **🔐 Wskazówki dotyczące uwierzytelniania** preferują teraz `azd auth login` dla przepływów AZD, z `az login` jako opcjonalnym przy bezpośrednim użyciu poleceń Azure CLI

#### Naprawiono
- **🪟 Polecenia instalacji na Windows** znormalizowane według bieżącej konwencji nazewnictwa pakietów `winget` w przewodniku instalacji
- **🐧 Poprawki instrukcji instalacji na Linuxie** w celu uniknięcia nieobsługiwanych dystrybucyjnie instrukcji menedżera pakietów `azd` i wskazania odpowiednich zasobów wydań
- **📦 Przykłady modeli AI** odświeżone z wcześniejszych domyślnych, takich jak `gpt-35-turbo` i `text-embedding-ada-002` do aktualnych przykładów `gpt-4.1-mini`, `gpt-4.1` i `text-embedding-3-large`
- **📋 Snippety wdrażania i diagnostyki** poprawione do użycia bieżących poleceń środowiskowych i statusu w logach, skryptach i krokach rozwiązywania problemów
- **⚙️ Wskazówki GitHub Actions** zaktualizowane z `Azure/setup-azd@v1.0.0` do `Azure/setup-azd@v2`
- **🤖 Wskazówki dotyczące zgód MCP/Copilot** zaktualizowane z `azd mcp consent` do `azd copilot consent list`

#### Ulepszono
- **🧠 Wskazówki do rozdziału AI** teraz lepiej wyjaśniają zachowanie wrażliwe na podgląd `azd ai`, logowanie specyficzne dla dzierżawy, bieżące użycie rozszerzeń oraz zaktualizowane rekomendacje dotyczące wdrażania modeli
- **🧪 Instrukcje warsztatowe** teraz używają bardziej realistycznych przykładów wersji i klarowniejszego języka setupu środowiska na ćwiczenia praktyczne
- **📈 Dokumentacja produkcji i rozwiązywania problemów** lepiej dostosowana do obecnego monitoringu, modeli zapasowych oraz przykładów poziomów kosztów

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

#### Polecenia AZD AI CLI, Walidacja Treści i Rozszerzenie Szablonów
**Ta wersja dodaje pokrycie poleceń `azd ai`, `azd extension` i `azd mcp` we wszystkich rozdziałach związanych z AI, naprawia niedziałające linki i przestarzały kod w agents.md, aktualizuje ściągawkę i całkowicie przebudowuje sekcję Szablony Przykładowe z zatwierdzonymi opisami i nowymi szablonami Azure AI AZD.**

#### Dodano
- **🤖 Pokrycie AZD AI CLI** w 7 plikach (wcześniej tylko w rozdziale 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nowa sekcja "Rozszerzenia i Polecenia AI" wprowadzająca `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcja 4: `azd ai agent init` z tabelą porównawczą (podejście szablonu kontra manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcje "Rozszerzenia AZD dla Foundry" i "Wdrożenie Priorytetowo na Agenta"
  - `docs/chapter-05-multi-agent/README.md` — Szybki start pokazuje teraz ścieżki wdrożenia oparte zarówno na szablonie, jak i na manifestach
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcja wdrożenia zawiera teraz opcję `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcja "Polecenia rozszerzeń diagnostycznych AZD AI"
  - `resources/cheat-sheet.md` — Nowa sekcja "Polecenia AI i Rozszerzeń" z `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Nowe przykładowe szablony AZD AI** w `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — czat RAG .NET z Blazor WebAssembly, Semantic Kernel i wsparciem rozmowy głosowej
  - **azure-search-openai-demo-java** — czat RAG w Javie z użyciem Langchain4J z opcjami wdrożenia ACA/AKS
  - **contoso-creative-writer** — wieloagentowa aplikacja do kreatywnego pisania z Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — bezserwerowy RAG wykorzystujący Azure Functions + LangChain.js + Cosmos DB z lokalnym wsparciem deweloperskim Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator z panelem administracyjnym, integracją z Teams oraz opcjami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referencyjna aplikacja orkiestracji Multi-agent MCP z serwerami w .NET, Python, Java i TypeScript
  - **azd-ai-starter** — Minimalny szablon startowy infrastruktury Azure AI w Bicep
  - **🔗 Link do świetnej galerii AZD AI** — Odniesienie do [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (ponad 80 szablonów)

#### Naprawione
- **🔗 Nawigacja w agents.md**: Linki Poprzedni/Następny teraz odpowiadają kolejności lekcji w Rozdziale 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Uszkodzone linki w agents.md**: `production-ai-practices.md` poprawiono na `../chapter-08-production/production-ai-practices.md` (3 wystąpienia)
- **📦 Przestarzały kod w agents.md**: Wymieniono `opencensus` na `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 Nieprawidłowe API w agents.md**: Przeniesiono `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 Liczenie tokenów w agents.md**: Zastąpiono przybliżone `len//4` oszacowanie przez `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Usługi poprawione z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (domyślny host zmieniony na październik 2024)
- **contoso-chat**: Zaktualizowano opis, aby odnosił się do Azure AI Foundry + Prompty, zgodnie z faktycznym tytułem i stosowaną technologią repozytorium

#### Usunięte
- **ai-document-processing**: Usunięto niedziałające odniesienie do szablonu (repozytorium nie jest publicznie dostępne jako szablon AZD)

#### Ulepszone
- **📝 Ćwiczenia w agents.md**: Ćwiczenie 1 teraz pokazuje oczekiwany wynik i krok `azd monitor`; Ćwiczenie 2 zawiera pełny kod rejestracji `FunctionTool`; Ćwiczenie 3 zastępuje niejasne wskazówki konkretnymi poleceniami `prepdocs.py`
- **📚 Zasoby w agents.md**: Zaktualizowano linki do dokumentacji usługi Azure AI Agent i szybkiego startu
- **📋 Tabela Następnych kroków w agents.md**: Dodano link do laboratorium AI Workshop dla pełnego pokrycia rozdziału

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

#### Ulepszenie Nawigacji Kursu
**Ta wersja ulepsza nawigację po rozdziałach README.md za pomocą rozszerzonego formatu tabeli.**

#### Zmiany
- **Tabela Mapy Kursu**: Ulepszona o bezpośrednie linki do lekcji, szacunki czasu trwania i oceny złożoności
- **Czyszczenie folderów**: Usunięto zbędne stare foldery (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Weryfikacja linków**: Zweryfikowano ponad 21 wewnętrznych linków w tabeli Mapy Kursu

### [v3.16.0] - 2026-02-05

#### Aktualizacje Nazw Produktów
**Ta wersja aktualizuje odniesienia produktów do aktualnego brandingu Microsoft.**

#### Zmiany
- **Microsoft Foundry → Microsoft Foundry**: Wszystkie odniesienia zaktualizowano w plikach niebędących tłumaczeniami
- **Azure AI Agent Service → Foundry Agents**: Nazwa usługi zmieniona, aby odzwierciedlić aktualny branding

#### Zaktualizowane pliki
- `README.md` - Główna strona kursu
- `changelog.md` - Historia wersji
- `course-outline.md` - Struktura kursu
- `docs/chapter-02-ai-development/agents.md` - Przewodnik po agentach AI
- `examples/README.md` - Dokumentacja przykładów
- `workshop/README.md` - Strona startowa warsztatów
- `workshop/docs/index.md` - Indeks warsztatów
- `workshop/docs/instructions/*.md` - Wszystkie pliki instrukcji warsztatów

---

### [v3.15.0] - 2026-02-05

#### Duża restrukturyzacja repozytorium: Foldery według rozdziałów
**Ta wersja restrukturyzuje dokumentację na dedykowane foldery rozdziałów dla lepszej nawigacji.**

#### Zmiana nazw folderów
Stare foldery zostały zastąpione folderami ponumerowanymi według rozdziałów:
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
- **📚 Pliki README rozdziałów**: Utworzono README.md w każdym folderze rozdziału z:
  - Celami nauki i czasem trwania
  - Tabelą lekcji z opisami
  - Komendami szybkiego startu
  - Nawigacją do innych rozdziałów

#### Zmiany
- **🔗 Zaktualizowano wszystkie linki wewnętrzne**: Ponad 78 ścieżek zaktualizowanych we wszystkich plikach dokumentacji
- **🗺️ Główne README.md**: Zaktualizowano Mapę Kursu z nową strukturą rozdziałów
- **📝 examples/README.md**: Zaktualizowano odnośniki do folderów rozdziałów

#### Usunięto
- Starą strukturę folderów (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturyzacja repozytorium: Nawigacja po rozdziałach
**Ta wersja dodała pliki README nawigacji rozdziałów (zastąpione przez v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nowy przewodnik po agentach AI
**Ta wersja dodaje kompleksowy przewodnik wdrażania agentów AI za pomocą Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Kompletny przewodnik obejmujący:
  - Czym są agenty AI i jak różnią się od chatbotów
  - Trzy szybkie szablony agentów startowych (Foundry Agents, Prompty, RAG)
  - Wzorce architektury agentów (pojedynczy agent, RAG, multi-agent)
  - Konfiguracja i dostosowanie narzędzi
  - Monitorowanie i śledzenie metryk
  - Rozważania dotyczące kosztów i optymalizacji
  - Typowe scenariusze rozwiązywania problemów
  - Trzy ćwiczenia praktyczne z kryteriami sukcesu

#### Struktura treści
- **Wprowadzenie**: Koncepcje agentów dla początkujących
- **Szybki Start**: Wdrażanie agentów za pomocą `azd init --template get-started-with-ai-agents`
- **Wzorce Architektury**: Wizualne diagramy wzorców agentów
- **Konfiguracja**: Ustawienia narzędzi i zmienne środowiskowe
- **Monitorowanie**: Integracja z Application Insights
- **Ćwiczenia**: Stopniowe nauczanie praktyczne (20-45 minut każde)

---

### [v3.12.0] - 2026-02-05

#### Aktualizacja środowiska DevContainer
**Ta wersja aktualizuje konfigurację kontenera deweloperskiego z nowoczesnymi narzędziami i lepszymi domyślnymi ustawieniami dla doświadczenia nauki AZD.**

#### Zmiany
- **🐳 Obraz bazowy**: Zaktualizowano z `python:3.12-bullseye` do `python:3.12-bookworm` (najnowszy Debian stable)
- **📛 Nazwa kontenera**: Zmieniono z "Python 3" na "AZD for Beginners" dla jasności

#### Dodano
- **🔧 Nowe funkcje kontenera deweloperskiego**:
  - `azure-cli` z włączonym wsparciem Bicep
  - `node:20` (wersja LTS dla szablonów AZD)
  - `github-cli` do zarządzania szablonami
  - `docker-in-docker` do wdrożeń kontenerów aplikacji

- **🔌 Przekierowanie portów**: Wstępnie skonfigurowane porty dla popularnego rozwoju:
  - 8000 (podgląd MkDocs)
  - 3000 (aplikacje webowe)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nowe rozszerzenia VS Code**:
  - `ms-python.vscode-pylance` - Rozszerzone IntelliSense dla Pythona
  - `ms-azuretools.vscode-azurefunctions` - Wsparcie Azure Functions
  - `ms-azuretools.vscode-docker` - Wsparcie Dockera
  - `ms-azuretools.vscode-bicep` - Wsparcie języka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Zarządzanie zasobami Azure
  - `yzhang.markdown-all-in-one` - Edycja Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Wsparcie diagramów Mermaid
  - `redhat.vscode-yaml` - Wsparcie YAML (dla azure.yaml)
  - `eamodio.gitlens` - Wizualizacja Git
  - `mhutchie.git-graph` - Historia Git

- **⚙️ Ustawienia VS Code**: Dodano ustawienia domyślne dla interpretera Pythona, formatowania zapisu i przycinania białych znaków

- **📦 Zaktualizowano requirements-dev.txt**:
  - Dodano wtyczkę minify do MkDocs
  - Dodano pre-commit dla jakości kodu
  - Dodano pakiety Azure SDK (azure-identity, azure-mgmt-resource)

#### Naprawione
- **Polecenie Post-Create**: Teraz weryfikuje instalację AZD i Azure CLI przy uruchomieniu kontenera

---

### [v3.11.0] - 2026-02-05

#### Przejrzenie README dla początkujących
**Ta wersja znacząco ulepsza plik README.md, czyniąc go bardziej dostępnym dla początkujących i dodaje niezbędne zasoby dla programistów AI.**

#### Dodano
- **🆚 Porównanie Azure CLI i AZD**: Jasne wyjaśnienie, kiedy używać którego narzędzia wraz z praktycznymi przykładami
- **🌟 Świetne linki AZD**: Bezpośrednie linki do galerii szablonów społeczności i zasobów do współpracy:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - ponad 200 gotowych do wdrożenia szablonów
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Wkład społeczności
- **🎯 Przewodnik szybkiego startu**: Uproszczony 3-stopniowy rozdział rozpoczęcia (Instalacja → Logowanie → Wdrożenie)
- **📊 Tabela nawigacji na podstawie doświadczenia**: Jasne wskazówki, gdzie zacząć w zależności od doświadczenia programisty

#### Zmiany
- **Struktura README**: Przearanżowano dla progresywnego ujawniania - najważniejsze informacje na początku
- **Sekcja Wprowadzenie**: Przepisana, aby wyjaśnić „Magia `azd up`” dla całkowicie początkujących
- **Usunięto duplikaty**: Usunięto zduplikowaną sekcję troubleshooting
- **Polecenia troubleshooting**: Naprawiono odniesienie `azd logs`, aby używało poprawnego `azd monitor --logs`

#### Naprawione
- **🔐 Polecenia uwierzytelniania**: Dodano `azd auth login` i `azd auth logout` do cheat-sheet.md
- **Nieprawidłowe odniesienia poleceń**: Usunięto pozostałe `azd logs` w sekcji troubleshooting README

#### Uwagi
- **Zakres**: Zmiany zastosowano w głównym README.md i resources/cheat-sheet.md
- **Docelowa grupa**: Ulepszenia skierowane głównie do programistów nowych w AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizacja dokładności poleceń Azure Developer CLI
**Ta wersja poprawia nieistniejące polecenia AZD w całej dokumentacji, zapewniając, że wszystkie przykłady kodu wykorzystują poprawną składnię Azure Developer CLI.**

#### Naprawione
- **🔧 Usunięto nieistniejące polecenia AZD**: Kompleksowy audyt i korekta nieprawidłowych poleceń:
  - `azd logs` (nie istnieje) → zastąpiono `azd monitor --logs` lub alternatywami Azure CLI
  - Podpolecenia `azd service` (nie istnieją) → zastąpiono `azd show` i Azure CLI
  - `azd infra import/export/validate` (nie istnieje) → usunięto lub zastąpiono ważnymi alternatywami
  - Flagi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nie istnieją) → usunięto
  - Flagi `azd provision --what-if/--rollback` (nie istnieją) → zaktualizowano do użycia `--preview`
  - `azd config validate` (nie istnieje) → zastąpiono `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nie istnieją) → usunięto

- **📚 Zaktualizowane pliki z poprawkami poleceń**:
  - `resources/cheat-sheet.md`: Duża przebudowa referencji poleceń
  - `docs/deployment/deployment-guide.md`: Poprawki strategii rollback i wdrożeń
  - `docs/troubleshooting/debugging.md`: Korekta sekcji analizy logów
  - `docs/troubleshooting/common-issues.md`: Aktualizacja poleceń troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawa sekcji debugowania AZD
  - `docs/getting-started/azd-basics.md`: Poprawione polecenia monitorowania
  - `docs/getting-started/first-project.md`: Zaktualizowano przykłady monitorowania i debugowania
  - `docs/getting-started/installation.md`: Naprawiono przykłady pomocy i wersji
  - `docs/pre-deployment/application-insights.md`: Poprawione polecenia przeglądania logów
  - `docs/pre-deployment/coordination-patterns.md`: Naprawione polecenia debugowania agenta

- **📝 Zaktualizowano odniesienia do wersji**: 
  - `docs/getting-started/installation.md`: Zmieniono sztywną wersję `1.5.0` na ogólną `1.x.x` z linkiem do wydań

#### Zmiany
- **Strategie wycofania**: Zaktualizowano dokumentację, aby używała wycofania opartego na Git (AZD nie posiada natywnego wycofania)
- **Przeglądanie logów**: Zamieniono odwołania do `azd logs` na `azd monitor --logs`, `azd monitor --live` i polecenia Azure CLI
- **Sekcja wydajności**: Usunięto nieistniejące flagi wdrożenia równoległego/przyrostowego, podano prawidłowe alternatywy

#### Szczegóły techniczne
- **Poprawne polecenia AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Poprawne flagi azd monitor**: `--live`, `--logs`, `--overview`
- **Usunięte funkcje**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Uwagi
- **Weryfikacja**: Polecenia zweryfikowano w Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ukończenie warsztatów i aktualizacja jakości dokumentacji
**Ta wersja kończy interaktywne moduły warsztatowe, naprawia wszystkie uszkodzone linki w dokumentacji i poprawia ogólną jakość treści dla deweloperów AI korzystających z Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nowy dokument wytycznych dotyczących wkładu z:
  - Jasnymi instrukcjami zgłaszania problemów i proponowania zmian
  - Standardami dokumentacji dla nowych treści
  - Wytycznymi dla przykładów kodu i konwencjami komunikatów commit
  - Informacjami o zaangażowaniu społeczności

#### Ukończono
- **🎯 Moduł warsztatowy 7 (Podsumowanie)**: W pełni ukończony moduł podsumowujący z:
  - Kompleksowym podsumowaniem osiągnięć warsztatów
  - Sekcją kluczowych opanowanych koncepcji dotyczących AZD, szablonów i Microsoft Foundry
  - Rekomendacjami kontynuacji ścieżki nauki
  - Ćwiczeniami wyzwań warsztatowych z oceną trudności
  - Opinie społeczności i linki do wsparcia

- **📚 Moduł warsztatowy 3 (Deconstruuj)**: Zaktualizowano cele nauki z:
  - Instrukcjami aktywacji GitHub Copilot z serwerami MCP
  - Zrozumieniem struktury folderów szablonów AZD
  - Wzorami organizacji Infrastructure-as-Code (Bicep)
  - Instrukcjami do ćwiczeń praktycznych (hands-on)

- **🔧 Moduł warsztatowy 6 (Zamknięcie)**: Ukończony z:
  - Celami sprzątania zasobów i zarządzania kosztami
  - Użyciem `azd down` do bezpiecznego deprowizjonowania infrastruktury
  - Wskazówkami odzyskiwania usług poznawczych usuniętych miękko
  - Bonusowymi promptami do eksploracji GitHub Copilot i Azure Portal

#### Naprawiono
- **🔗 Poprawki uszkodzonych linków**: Naprawiono ponad 15 uszkodzonych wewnętrznych linków dokumentacji:
  - `docs/ai-foundry/ai-model-deployment.md`: Poprawiono ścieżki do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawiono ścieżki do ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamieniono nieistniejący cicd-integration.md na deployment-guide.md
  - `examples/retail-scenario.md`: Naprawiono ścieżki FAQ i przewodnika rozwiązywania problemów
  - `examples/container-app/microservices/README.md`: Poprawiono ścieżki do strony głównej kursu i przewodnika wdrożeń
  - `resources/faq.md` i `resources/glossary.md`: Zaktualizowano odniesienia do rozdziałów AI
  - `course-outline.md`: Naprawiono przewodnik instruktora i odniesienia do laboratorium AI

- **📅 Baner statusu warsztatów**: Zmieniono z "W budowie" na aktywny status warsztatów z datą luty 2026

- **🔗 Nawigacja warsztatów**: Naprawiono uszkodzone linki nawigacyjne w README.md warsztatów wskazujące na nieistniejący folder lab-1-azd-basics

#### Zmiany
- **Prezentacja warsztatów**: Usunięto ostrzeżenie "w budowie", warsztaty są teraz ukończone i gotowe do użycia
- **Spójność nawigacji**: Zapewniono właściwą nawigację między modułami warsztatowymi
- **Odniesienia do ścieżki nauki**: Zaktualizowano cross-odniesienia rozdziałów do poprawnych ścieżek microsoft-foundry

#### Zweryfikowano
- ✅ Wszystkie pliki markdown w języku angielskim mają prawidłowe linki wewnętrzne
- ✅ Moduły warsztatowe 0-7 są ukończone z celami nauki
- ✅ Nawigacja między rozdziałami i modułami działa poprawnie
- ✅ Zawartość jest odpowiednia dla deweloperów AI korzystających z Microsoft AZD
- ✅ Język i struktura przyjazne dla początkujących utrzymane na całej długości
- ✅ CONTRIBUTING.md zapewnia jasne wskazówki dla współtwórców społeczności

#### Implementacja techniczna
- **Weryfikacja linków**: Zautomatyzowany skrypt PowerShell zweryfikował wszystkie wewnętrzne linki .md
- **Audyt zawartości**: Ręczna kontrola kompletności warsztatów i przyjazności dla początkujących
- **System nawigacji**: Stosowanie spójnych wzorców nawigacji rozdziałów i modułów

#### Uwagi
- **Zakres**: Zmiany dotyczą tylko dokumentacji w języku angielskim
- **Tłumaczenia**: Foldery tłumaczeń nie były aktualizowane w tej wersji (automatyczne tłumaczenie zostanie zsynchronizowane później)
- **Czas warsztatów**: Kompletny warsztat zapewnia teraz 3-4 godziny praktycznej nauki

---

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: Monitorowanie, bezpieczeństwo i wzorce multi-agenta
**Ta wersja dodaje kompleksowe lekcje klasy A dotyczące integracji Application Insights, wzorców uwierzytelniania oraz koordynacji wieloagentowej dla wdrożeń produkcyjnych.**

#### Dodano
- **📊 Lekcja integracji Application Insights**: w `docs/pre-deployment/application-insights.md`:
  - Wdrożenie skoncentrowane na AZD z automatycznym provisionowaniem
  - Kompletny zestaw szablonów Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z własną telemetrią (ponad 1200 linii)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów Microsoft Foundry Models)
  - 6 diagramów Mermaid (architektura, rozproszone śledzenie, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, dashboardy, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Transmisja metryk live i debugowanie w czasie rzeczywistym
  - Czas nauki 40-50 minut ze wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i zabezpieczeń**: w `docs/getting-started/authsecurity.md`:
  - 3 wzorce uwierzytelniania (connection strings, Key Vault, zarządzana tożsamość)
  - Kompletny zestaw szablonów Bicep dla bezpiecznych wdrożeń
  - Kod aplikacji Node.js z integracją Azure SDK
  - 3 kompletne ćwiczenia (włączenie zarządzanej tożsamości, identity przypisanej do użytkownika, rotacja Key Vault)
  - Najlepsze praktyki bezpieczeństwa i konfiguracje RBAC
  - Przewodnik rozwiązywania problemów i analiza kosztów
  - Wzorce uwierzytelniania bezhasłowego gotowe do produkcji

- **🤖 Lekcja wzorców koordynacji wieloagentowej**: w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Kompletny implementator usługi orkiestratora (Python/Flask, ponad 1500 linii)
  - 3 wyspecjalizowane implementacje agentów (Badacz, Pisarz, Redaktor)
  - Integracja Service Bus dla kolejek wiadomości
  - Zarządzanie stanem w Cosmos DB dla systemów rozproszonych
  - 6 diagramów Mermaid obrazujących interakcje agentów
  - 3 zaawansowane ćwiczenia (obsługa timeout, logika ponawiania, obwód przerwowy)
  - Rozbicie kosztów (240-565 $/mies.) ze strategiami optymalizacji
  - Integracja Application Insights dla monitorowania

#### Ulepszono
- **Rozdział pre-deployment**: Teraz zawiera kompleksowe wzorce monitorowania i koordynacji
- **Rozdział wstępny**: Wzbogacony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Całościowe pokrycie od bezpieczeństwa po obserwowalność
- **Plan kursu**: Zaktualizowano odwołania do nowych lekcji w rozdziałach 3 i 6

#### Zmiany
- **Postęp nauki**: Lepsza integracja bezpieczeństwa i monitorowania w całym kursie
- **Jakość dokumentacji**: Spójne standardy klasy A (95-97%) we wszystkich nowych lekcjach
- **Wzorce produkcyjne**: Pełne pokrycie end-to-end dla wdrożeń korporacyjnych

#### Ulepszenia
- **Doświadczenie dewelopera**: Jasna ścieżka od tworzenia po monitorowanie produkcyjne
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania sekretami
- **Obserwowalność**: Kompleksowa integracja Application Insights z AZD
- **Obciążenia AI**: Specjalistyczne monitorowanie Microsoft Foundry Models i systemów wieloagentowych

#### Zweryfikowano
- ✅ Wszystkie lekcje zawierają kompletny działający kod (nie fragmenty)
- ✅ Diagramy Mermaid do nauki wizualnej (łącznie 19 w 3 lekcjach)
- ✅ Ćwiczenia praktyczne z krokami weryfikacji (łącznie 9)
- ✅ Szablony Bicep gotowe do produkcji z możliwością wdrożenia przez `azd up`
- ✅ Analiza kosztów i strategie optymalizacji
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki
- ✅ Punkty kontrolne wiedzy z poleceniami weryfikującymi

#### Wyniki ocen dokumentacji
- **docs/pre-deployment/application-insights.md**: - Kompleksowy przewodnik monitorowania
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury wieloagentowe
- **Ogólna nowa treść**: - Spójne wysokie standardy jakości

#### Implementacja techniczna
- **Application Insights**: Log Analytics + własna telemetria + rozproszone śledzenie
- **Uwierzytelnianie**: Managed Identity + Key Vault + wzorce RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkiestracja
- **Monitorowanie**: Metryki na żywo + zapytania Kusto + alerty + dashboardy
- **Zarządzanie kosztami**: Strategie próbkowania, polityki przechowywania, kontrole budżetu

### [v3.7.0] - 2025-11-19

#### Poprawa jakości dokumentacji i nowy przykład Microsoft Foundry Models
**Ta wersja poprawia jakość dokumentacji w całym repozytorium i dodaje kompletny przykład wdrożenia Microsoft Foundry Models z interfejsem czatu gpt-4.1.**

#### Dodano
- **🤖 Przykład czatu Microsoft Foundry Models**: Kompletny deployment gpt-4.1 z działającą implementacją w `examples/azure-openai-chat/`:
  - Kompletny back-end Microsoft Foundry Models (wdrożenie modelu gpt-4.1)
  - Interfejs czatu w linii poleceń Python z historią rozmów
  - Integracja z Key Vault dla bezpiecznego przechowywania kluczy API
  - Śledzenie użycia tokenów i szacowanie kosztów
  - Ograniczenia prędkości i obsługa błędów
  - Kompleksowy README z 35-45 minutowym przewodnikiem wdrożenia
  - 11 plików gotowych do produkcji (szablony Bicep, aplikacja Python, konfiguracja)
- **📚 Ćwiczenia dokumentacyjne**: Dodano praktyczne ćwiczenia w przewodniku konfiguracji:
  - Ćwiczenie 1: Konfiguracja wielośrodowiskowa (15 minut)
  - Ćwiczenie 2: Praktyka zarządzania sekretami (10 minut)
  - Jasne kryteria sukcesu i kroki weryfikacji
- **✅ Weryfikacja wdrożenia**: Dodano sekcję w przewodniku wdrożeń:
  - Procedury sprawdzania stanu zdrowia
  - Lista kontrolna kryteriów sukcesu
  - Oczekiwane wyniki dla wszystkich poleceń wdrożeniowych
  - Szybkie referencje do rozwiązywania problemów

#### Ulepszono
- **examples/README.md**: Zaktualizowano do jakości klasy A (93%):
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji
  - Zwiększono liczbę przykładów lokalnych z 3 do 4
  - Dodano do tabeli przykładów aplikacji AI
  - Zintegrowano z szybkim startem dla użytkowników średniozaawansowanych
  - Dodano do sekcji szablonów Microsoft Foundry
  - Zaktualizowano macierz porównawczą i sekcje technologii
- **Jakość dokumentacji**: Poprawiono z B+ (87%) na A- (92%) w folderze docs:
  - Dodano oczekiwane wyniki do krytycznych przykładów poleceń
  - Uwzględniono kroki weryfikacji dla zmian konfiguracyjnych
  - Wzbogacono naukę praktyczną o ćwiczenia praktyczne

#### Zmiany
- **Postęp nauki**: Lepsza integracja przykładów AI dla użytkowników średniozaawansowanych
- **Struktura dokumentacji**: Bardziej praktyczne ćwiczenia z jasnymi rezultatami
- **Proces weryfikacji**: Dodano wyraźne kryteria sukcesu do kluczowych przepływów pracy

#### Ulepszenia
- **Doświadczenie dewelopera**: Wdrożenie Microsoft Foundry Models teraz trwa 35-45 minut (w porównaniu do 60-90 dla złożonych alternatyw)
- **Przejrzystość kosztów**: Jasne szacunki kosztów (50-200 $/mies.) dla przykładu Microsoft Foundry Models
- **Ścieżka nauki**: Deweloperzy AI mają wyraźny punkt wejścia z azure-openai-chat
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacji

#### Zweryfikowano
- ✅ Przykład Microsoft Foundry Models w pełni funkcjonalny z `azd up`
- ✅ Wszystkie 11 plików implementacyjnych syntaktycznie poprawne
- ✅ Instrukcje README zgodne z rzeczywistym doświadczeniem wdrożenia
- ✅ Zaktualizowano linki dokumentacji w ponad 8 lokalizacjach
- ✅ Indeks przykładów dokładnie odzwierciedla 4 lokalne przykłady
- ✅ Brak zduplikowanych linków zewnętrznych w tabelach
- ✅ Wszystkie odniesienia nawigacji są poprawne

#### Implementacja techniczna
- **Architektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + wzorzec Container Apps
- **Bezpieczeństwo**: Ready Managed Identity, sekrety w Key Vault
- **Monitorowanie**: Integracja z Application Insights
- **Zarządzanie kosztami**: Śledzenie tokenów i optymalizacja zużycia
- **Wdrożenie**: Jedno polecenie `azd up` do kompletnego ustawienia

### [v3.6.0] - 2025-11-19

#### Duża aktualizacja: Przykłady wdrożeń aplikacji kontenerowych
**Ta wersja wprowadza kompleksowe przykłady wdrożeń produkcyjnych aplikacji kontenerowych przy użyciu Azure Developer CLI (AZD), z pełną dokumentacją i integracją w ścieżkę nauki.**

#### Dodano
- **🚀 Przykłady aplikacji kontenerowych**: Nowe lokalne przykłady w `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletny przegląd wdrożeń konteneryzowanych, szybki start, produkcja i zaawansowane wzorce
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Przyjazne dla początkujących REST API z funkcją skalowania do zera, sondami zdrowia, monitorowaniem i rozwiązywaniem problemów
  - [Microservices Architecture](../../examples/container-app/microservices): Gotowe do produkcji wdrożenie wielousługowe (API Gateway, Product, Order, User, Notification), asynchroniczne przesyłanie wiadomości, Service Bus, Cosmos DB, Azure SQL, rozproszone śledzenie, wdrożenie blue-green/canary
- **Best Practices**: Bezpieczeństwo, monitorowanie, optymalizacja kosztów oraz wytyczne CI/CD dla obciążeń konteneryzowanych
- **Code Samples**: Pełne `azure.yaml`, szablony Bicep oraz implementacje usług w wielu językach (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: Scenariusze testów end-to-end, polecenia monitorowania, wskazówki dotyczące rozwiązywania problemów

#### Changed
- **README.md**: Zaktualizowany, by prezentować i linkować nowe przykłady aplikacji kontenerowych w sekcji "Local Examples - Container Applications"
- **examples/README.md**: Zmiany podkreślające przykłady aplikacji kontenerowych, dodane wpisy do macierzy porównawczej oraz aktualizacja odniesień technologicznych/architektonicznych
- **Course Outline & Study Guide**: Zaktualizowane o odwołania do nowych przykładów aplikacji kontenerowych i wzorców wdrożeniowych w odpowiednich rozdziałach

#### Validated
- ✅ Wszystkie nowe przykłady możliwe do wdrożenia za pomocą `azd up` i zgodne z najlepszymi praktykami
- ✅ Zaktualizowane linki krzyżowe i nawigacja w dokumentacji
- ✅ Przykłady obejmują scenariusze od podstawowych do zaawansowanych, w tym mikroserwisy produkcyjne

#### Notes
- **Zakres**: Tylko angielska dokumentacja i przykłady
- **Następne kroki**: Rozszerzenie o dodatkowe zaawansowane wzorce kontenerowe i automatyzację CI/CD w przyszłych wydaniach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Ta wersja dokonuje kompleksowej zmiany nazwy produktu z "Microsoft Foundry" na "Microsoft Foundry" we wszystkich anglojęzycznych materiałach dokumentacyjnych, odzwierciedlając oficjalny rebranding Microsoft.**

#### Changed
- **🔄 Aktualizacja nazwy produktu**: Kompletny rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Zaktualizowano wszystkie odniesienia w angielskiej dokumentacji w folderze `docs/`
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Łącznie: zaktualizowano 23 odniesienia w 7 plikach dokumentacji

- **📁 Zmiany struktury folderów**:
  - `docs/ai-foundry/` przemianowany na `docs/microsoft-foundry/`
  - Wszystkie odniesienia krzyżowe zaktualizowane, aby odzwierciedlić nową strukturę folderów
  - Zweryfikowano linki nawigacyjne we wszystkich materiałach dokumentacyjnych

- **📄 Zmiany nazw plików**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Wszystkie wewnętrzne linki zaktualizowane do nowych nazw plików

#### Zaktualizowane pliki
- **Dokumentacja rozdziałów** (7 plików):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 zaktualizowane odniesienia do nazwy produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Już korzysta z Microsoft Foundry (z poprzednich aktualizacji)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 zaktualizowane odniesienia (przegląd, opinie społeczności, dokumentacja)
  - `docs/getting-started/azd-basics.md` - 4 zaktualizowane linki krzyżowe
  - `docs/getting-started/first-project.md` - 2 zaktualizowane linki nawigacyjne rozdziału
  - `docs/getting-started/installation.md` - 2 zaktualizowane linki do następnego rozdziału
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 zaktualizowane odniesienia (nawigacja, społeczność Discord)
  - `docs/troubleshooting/common-issues.md` - 1 zaktualizowany link nawigacyjny
  - `docs/troubleshooting/debugging.md` - 1 zaktualizowany link nawigacyjny

- **Pliki struktury kursu** (2 pliki):
  - `README.md` - 17 zaktualizowanych odniesień (przegląd kursu, tytuły rozdziałów, sekcja szablonów, wnioski społeczności)
  - `course-outline.md` - 14 zaktualizowanych odniesień (przegląd, cele nauki, zasoby rozdziałów)

#### Zweryfikowano
- ✅ Brak pozostałych odniesień do ścieżek folderów "ai-foundry" w angielskich dokumentach
- ✅ Brak pozostałych odniesień do nazwy produktu "Microsoft Foundry" w angielskich dokumentach
- ✅ Wszystkie linki nawigacyjne działają w nowej strukturze folderów
- ✅ Pomyślnie wykonano zmiany nazw plików i folderów
- ✅ Zweryfikowano poprawność odniesień krzyżowych między rozdziałami

#### Notatki
- **Zakres**: Zmiany zastosowano tylko w angielskiej dokumentacji w folderze `docs/`
- **Tłumaczenia**: Foldery tłumaczeń (`translations/`) nie zostały zaktualizowane w tej wersji
- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie zostały zaktualizowane w tej wersji
- **Przykłady**: Pliki przykładów mogą nadal zawierać nazwy dziedzictwa (do rozwiązania w przyszłej aktualizacji)
- **Linki zewnętrzne**: Zewnętrzne adresy URL i odwołania do repozytoriów GitHub pozostają bez zmian

#### Przewodnik migracji dla współtwórców
Jeśli masz lokalne gałęzie lub dokumentację odwołującą się do starej struktury:
1. Zaktualizuj odniesienia do folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Zaktualizuj odniesienia do plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zastąp nazwę produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Zweryfikuj, czy wszystkie wewnętrzne linki dokumentacji działają

---

### [v3.4.0] - 2025-10-24

#### Ulepszenia podglądu i walidacji infrastruktury
**Ta wersja wprowadza kompleksowe wsparcie dla nowej funkcji podglądu Azure Developer CLI oraz ulepsza doświadczenie użytkownika warsztatów.**

#### Dodano
- **🧪 Dokumentacja funkcji azd provision --preview**: Szczegółowe omówienie nowej funkcji podglądu infrastruktury
  - Referencje do poleceń i przykłady użycia w cheat sheecie
  - Szczegółowa integracja w przewodniku provisioningowym z przypadkami użycia i korzyściami
  - Integracja wstępnej kontroli dla bezpieczniejszej walidacji wdrożenia
  - Aktualizacje przewodnika rozpoczęcia pracy z praktykami bezpiecznego wdrażania
- **🚧 Baner statusu warsztatów**: Profesjonalny baner HTML wskazujący status rozwoju warsztatów
  - Gradientowy design z wskaźnikami budowy dla jasnej komunikacji użytkownikowi
  - Znacznik czasu ostatniej aktualizacji dla przejrzystości
  - Responsywny design na urządzenia mobilne

#### Ulepszone
- **Bezpieczeństwo infrastruktury**: Funkcja podglądu zintegrowana w całej dokumentacji wdrożeniowej
- **Wstępna walidacja wdrożenia**: Skrypty automatyczne obejmujące testy podglądu infrastruktury
- **Przebieg pracy dewelopera**: Zaktualizowane sekwencje poleceń z uwzględnieniem podglądu jako najlepszej praktyki
- **Doświadczenie warsztatowe**: Jasne określenie oczekiwań użytkowników co do statusu rozwoju treści

#### Zmiany
- **Najlepsze praktyki wdrożeniowe**: Rekomendowany teraz workflow z podejściem preview-first
- **Przepływ dokumentacji**: Walidacja infrastruktury przesunięta na wcześniejszy etap nauki
- **Prezentacja warsztatów**: Profesjonalna komunikacja statusu z jasnym harmonogramem rozwoju

#### Ulepszenia
- **Podejście bezpieczeństwa**: Zmiany infrastruktury mogą być teraz zweryfikowane przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu mogą być dzielone do przeglądu i akceptacji
- **Świadomość kosztów**: Lepsze zrozumienie kosztów zasobów przed provisioningiem
- **Minimalizacja ryzyka**: Ograniczenie niepowodzeń wdrożenia dzięki wcześniejszej walidacji

#### Implementacja techniczna
- **Integracja wielodokumentowa**: Funkcja podglądu opisana w 4 kluczowych plikach
- **Wzorce poleceń**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd uwzględniony w workflow walidacji i skryptach
- **Wskaźniki wizualne**: Wyraźne oznaczenia NOWEJ funkcji dla łatwości odnalezienia

#### Infrastruktura warsztatowa
- **Komunikacja statusu**: Profesjonalny baner HTML z gradientem
- **Doświadczenie użytkownika**: Jasny status rozwoju zapobiega nieporozumieniom
- **Profesjonalna prezentacja**: Zachowanie wiarygodności repozytorium przy ustalaniu oczekiwań
- **Przejrzystość harmonogramu**: Znacznik czasu ostatniej aktualizacji z października 2025 dla odpowiedzialności

### [v3.3.0] - 2025-09-24

#### Udoskonalone materiały warsztatowe i interaktywne doświadczenie edukacyjne
**Ta wersja wprowadza kompleksowe materiały warsztatowe z przeglądem dla przeglądarek oraz ustrukturyzowane ścieżki nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatowy**: Doświadczenie warsztatowe w przeglądarce z możliwością podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatowe**: 7-etapowa ścieżka nauki od odkrywania do dostosowania
  - 0-Wprowadzenie: Przegląd warsztatów i konfiguracja
  - 1-Wybór-szablonu-AI: Odkrywanie szablonów i proces wyboru
  - 2-Walidacja-szablonu-AI: Procedury wdrożenia i walidacji
  - 3-Dezbudowa-szablonu-AI: Zrozumienie architektury szablonu
  - 4-Konfiguracja-szablonu-AI: Konfiguracja i personalizacja
  - 5-Dostosowanie-szablonu-AI: Zaawansowane modyfikacje i iteracje
  - 6-Rozbiórka-infrastruktury: Sprzątanie i zarządzanie zasobami
  - 7-Podsumowanie: Streszczenie i kolejne kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla ulepszonego doświadczenia nauki
- **🎯 Ścieżka nauki praktycznej**: Metodologia 3 kroków (Odkrywanie → Wdrożenie → Dostosowanie)
- **📱 Integracja z GitHub Codespaces**: Płynna konfiguracja środowiska deweloperskiego

#### Ulepszone
- **Laboratorium AI Workshop**: Rozszerzone o kompleksowe 2-3 godzinne ustrukturyzowane doświadczenie nauki
- **Dokumentacja warsztatów**: Profesjonalna prezentacja z nawigacją i materiałami wizualnymi
- **Postęp nauki**: Jasne wskazówki krok po kroku od wyboru szablonu do wdrożenia produkcyjnego
- **Doświadczenie dewelopera**: Zintegrowane narzędzia usprawniające workflow deweloperski

#### Ulepszone
- **Dostępność**: Interfejs przeglądarkowy z funkcją wyszukiwania, kopiowania oraz przełączania motywów
- **Nauka we własnym tempie**: Elastyczna struktura warsztatów dostosowana do różnych szybkości uczenia się
- **Praktyczne zastosowanie**: Scenariusze wdrożenia AI w realnym świecie
- **Integracja społeczności**: Połączenie z Discordem dla wsparcia i współpracy podczas warsztatów

#### Funkcje warsztatów
- **Wbudowane wyszukiwanie**: Szybkie wyszukiwanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcja kopiowania po najechaniu kursorem na wszystkie przykłady kodu
- **Przełącznik motywów**: Obsługa trybów ciemnego/jasnego dla różnych preferencji
- **Materiały wizualne**: Zrzuty ekranu i diagramy ułatwiające zrozumienie
- **Integracja pomocy**: Bezpośredni dostęp do Discorda dla wsparcia społecznościowego

### [v3.2.0] - 2025-09-17

#### Główna restrukturyzacja nawigacji i system nauki rozdziałami
**Ta wersja wprowadza kompleksową strukturę nauki opartą na rozdziałach z ulepszoną nawigacją w całym repozytorium.**

#### Dodano
- **📚 System nauki opartej na rozdziałach**: Przekształcono cały kurs w 8 progresywnych rozdziałów
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 minut)
  - Rozdział 2: Rozwój z AI w centrum (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 minut)
  - Rozdział 4: Infrastruktura jako kod i wdrożenie (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Wieloagentowe rozwiązania AI (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja i planowanie przed wdrożeniem (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacji we wszystkich materiałach dokumentacyjnych
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Wskazówki dotyczące ścieżki nauki**: Jasne punkty wejścia dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja z odniesieniami krzyżowymi**: Powiązane rozdziały i wymagania wstępne jasno powiązane

#### Ulepszone
- **Struktura README**: Przekształcona w ustrukturyzowaną platformę nauki z organizacją opartą na rozdziałach
- **Nawigacja w dokumentacji**: Każda strona zawiera teraz kontekst rozdziału i wskazówki dotyczące postępu
- **Organizacja szablonów**: Przykłady i szablony przypisane do odpowiednich rozdziałów nauki
- **Integracja zasobów**: Cheat sheety, FAQ i przewodniki studiów połączone z odpowiednimi rozdziałami
- **Integracja warsztatów**: Laboratoria praktyczne powiązane z celami nauki w wielu rozdziałach

#### Zmiany
- **Postęp nauki**: Przejście z liniowej dokumentacji na elastyczną naukę według rozdziałów
- **Lokalizacja konfiguracji**: Przewodnik konfiguracji przesunięty jako rozdział 3 dla lepszego przebiegu nauki
- **Integracja treści AI**: Lepsza integracja treści związanych z AI w trakcie całej nauki
- **Treści produkcyjne**: Zaawansowane wzorce skonsolidowane w rozdziale 8 dla uczących się na poziomie korporacyjnym

#### Ulepszenia
- **Doświadczenie użytkownika**: Jasne ścieżki nawigacji i wskaźniki postępu rozdziałów
- **Dostępność**: Spójne wzorce nawigacyjne ułatwiające poruszanie się po kursie
- **Profesjonalna prezentacja**: Struktura kursu na poziomie uniwersyteckim, odpowiednia dla szkoleń akademickich i korporacyjnych
- **Efektywność nauki**: Skrócony czas znajdowania odpowiednich materiałów dzięki ulepszonej organizacji

#### Implementacja techniczna
- **Nagłówki nawigacji**: Ustandaryzowana nawigacja rozdziałowa w ponad 40 plikach dokumentacji
- **Stopka nawigacji**: Spójne wskazówki postępu i wskaźniki ukończenia rozdziałów
- **Linki krzyżowe**: Kompleksowy system wewnętrznego łączenia powiązanych konceptów
- **Mapowanie rozdziałów**: Szablony i przykłady jasno powiązane z celami nauki

#### Ulepszenie przewodnika studiów
- **📚 Kompleksowe cele nauki**: Przebudowany przewodnik studiów zgodnie z systemem 8 rozdziałów
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera konkretne cele nauki i ćwiczenia praktyczne
- **📋 Śledzenie postępów**: Cotygodniowy plan nauki z mierzalnymi wynikami i listami kontrolnymi ukończenia
- **❓ Pytania oceniające**: Pytania weryfikujące wiedzę dla każdego rozdziału z profesjonalnymi wynikami
- **🛠️ Ćwiczenia praktyczne**: Działania praktyczne ze scenariuszami wdrożenia i rozwiązywania problemów
- **📊 Postęp umiejętności**: Wyraźny postęp od podstawowych pojęć do wzorców korporacyjnych z naciskiem na rozwój kariery
- **🎓 System certyfikacji**: Profesjonalne wyniki rozwoju i system uznania społecznościowego
- **⏱️ Zarządzanie czasem**: Ustrukturyzowany 10-tygodniowy plan nauki z walidacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone wieloagentowe rozwiązania AI
**Ta wersja ulepsza wieloagentowe rozwiązania dla handlu detalicznego z lepszym nazywaniem agentów i ulepszoną dokumentacją.**

#### Changed
- **Terminologia Wieloagentowa**: Zmieniono "agent Cora" na "agent klienta" w całym rozwiązaniu wieloagentowym dla handlu detalicznego dla lepszego zrozumienia
- **Architektura Agenta**: Zaktualizowano całą dokumentację, szablony ARM oraz przykłady kodu, aby stosować spójne nazewnictwo "agent klienta"
- **Przykłady Konfiguracji**: Unowocześniono wzorce konfiguracji agentów z zaktualizowanymi konwencjami nazewnictwa
- **Spójność Dokumentacji**: Zapewniono, że wszystkie odniesienia używają profesjonalnych, opisowych nazw agentów

#### Ulepszone
- **Pakiet Szablonu ARM**: Zaktualizowano retail-multiagent-arm-template z odniesieniami do agenta klienta
- **Diagramy Architektury**: Odświeżono diagramy Mermaid z zaktualizowanym nazewnictwem agentów
- **Przykłady Kodów**: Klasy Python i przykłady implementacji teraz używają nazewnictwa CustomerAgent
- **Zmienne Środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe do stosowania konwencji CUSTOMER_AGENT_NAME

#### Ulepszone
- **Doświadczenie Deweloperskie**: Bardziej klarowne role i odpowiedzialności agentów w dokumentacji
- **Gotowość Produkcyjna**: Lepsze dopasowanie do korporacyjnych konwencji nazewnictwa
- **Materiały Edukacyjne**: Intuicyjniejsze nazewnictwo agentów do celów edukacyjnych
- **Użyteczność Szablonów**: Uproszczone rozumienie funkcji agentów i wzorców wdrożeniowych

#### Szczegóły Techniczne
- Zaktualizowano diagramy architektury Mermaid z odniesieniami do CustomerAgent
- Zmieniono nazwy klas CoraAgent na CustomerAgent w przykładach Pythona
- Zmodyfikowano konfiguracje JSON szablonów ARM do używania typu agenta "customer"
- Zaktualizowano zmienne środowiskowe z wzorców CORA_AGENT_* na CUSTOMER_AGENT_*
- Odświeżono wszystkie polecenia wdrożeniowe i konfiguracje kontenerów

### [v3.0.0] - 2025-09-12

#### Główne Zmiany - Skoncentrowanie na Deweloperach AI i Integracja Microsoft Foundry
**Ta wersja przekształca repozytorium w kompleksowe źródło wiedzy skoncentrowane na AI z integracją Microsoft Foundry.**

#### Dodano
- **🤖 Ścieżka Nauki Skoncentrowana na AI**: Całkowita restrukturyzacja z priorytetem dla deweloperów i inżynierów AI
- **Przewodnik Integracji Microsoft Foundry**: Kompleksowa dokumentacja dla połączenia AZD z usługami Microsoft Foundry
- **Wzorce Wdrożeń Modeli AI**: Szczegółowy przewodnik dotyczący wyboru modeli, konfiguracji i strategii wdrożenia produkcyjnego
- **Laboratorium Warsztatowe AI**: 2-3 godzinne praktyczne warsztaty konwersji aplikacji AI na rozwiązania wdrażalne przez AZD
- **Najlepsze Praktyki Produkcyjnego AI**: Wzorce korporacyjne do skalowania, monitorowania i zabezpieczania obciążeń AI
- **Przewodnik Rozwiązywania Problemów AI**: Kompleksowe wskazówki dla modeli Microsoft Foundry, usług kognitywnych i kwestii wdrożeniowych AI
- **Galeria Szablonów AI**: Wyselekcjonowana kolekcja szablonów Microsoft Foundry z ocenami skomplikowania
- **Materiały Warsztatowe**: Kompletna struktura warsztatów z laboratoriami praktycznymi i materiałami referencyjnymi

#### Ulepszone
- **Struktura README**: Skoncentrowana na deweloperach AI z 45% danych o zainteresowaniu społeczności z Discord Microsoft Foundry
- **Ścieżki Nauki**: Dedykowana ścieżka dewelopera AI obok tradycyjnych ścieżek dla studentów i inżynierów DevOps
- **Rekomendacje Szablonów**: Wyróżnione szablony AI, w tym azure-search-openai-demo, contoso-chat oraz openai-chat-app-quickstart
- **Integracja Społecznościowa**: Ulepszone wsparcie społeczności Discord z kanałami i dyskusjami specyficznymi dla AI

#### Bezpieczeństwo i Gotowość Produkcyjna
- **Wzorce Zarządzanej Tożsamości**: Specyficzne dla AI konfiguracje uwierzytelniania i zabezpieczeń
- **Optymalizacja Kosztów**: Śledzenie wykorzystania tokenów i kontrola budżetu dla obciążeń AI
- **Wdrożenia Wieloregionalne**: Strategie globalnego wdrażania aplikacji AI
- **Monitorowanie Wydajności**: Metryki specyficzne dla AI i integracja z Application Insights

#### Jakość Dokumentacji
- **Liniowa Struktura Kursu**: Logiczna progresja od początkującego do zaawansowanych wzorców wdrożeń AI
- **Zweryfikowane URL-e**: Wszystkie zewnętrzne linki do repozytoriów potwierdzone i dostępne
- **Kompletne Referencje**: Wszystkie wewnętrzne linki dokumentacyjne zweryfikowane i działające
- **Gotowość Produkcyjna**: Korporacyjne wzorce wdrożeń z praktycznymi przykładami realnymi

### [v2.0.0] - 2025-09-09

#### Główne Zmiany - Restrukturyzacja Repozytorium i Profesjonalne Ulepszenia
**Ta wersja stanowi znaczące przeprojektowanie struktury repozytorium i prezentacji treści.**

#### Dodano
- **Struktura Nauki Strukturalnej**: Wszystkie strony dokumentacji zawierają teraz sekcje Wprowadzenie, Cele Nauki i Wyniki Nauki
- **System Nawigacji**: Dodano linki Lekcja Poprzednia/Następna w całej dokumentacji dla prowadzonej progresji nauki
- **Poradnik Studiowania**: Kompleksowy study-guide.md z celami nauki, ćwiczeniami i materiałami oceniającymi
- **Profesjonalna Prezentacja**: Usunięto wszystkie emotikony w celu poprawy dostępności i profesjonalnego wyglądu
- **Ulepszona Struktura Treści**: Lepsza organizacja i przepływ materiałów edukacyjnych

#### Zmiany
- **Format Dokumentacji**: Ujednolicono całą dokumentację ze spójną, skoncentrowaną na nauce strukturą
- **Przepływ Nawigacji**: Wdrożono logiczną progresję we wszystkich materiałach do nauki
- **Prezentacja Treści**: Usunięto elementy dekoracyjne na rzecz jasnego, profesjonalnego formatowania
- **Struktura Linków**: Zaktualizowano wszystkie linki wewnętrzne dla wsparcia nowego systemu nawigacji

#### Ulepszenia
- **Dostępność**: Usunięto zależności od emotikon dla lepszej zgodności z czytnikami ekranu
- **Profesjonalny Wygląd**: Czysta, akademicka prezentacja odpowiednia do nauki korporacyjnej
- **Doświadczenie Nauki**: Strukturalne podejście z jasnymi celami i wynikami dla każdej lekcji
- **Organizacja Treści**: Lepszy logiczny przepływ i powiązania między pokrewnymi tematami

### [v1.0.0] - 2025-09-09

#### Pierwsze Wydanie - Kompleksowe Repozytorium Nauki AZD

#### Dodano
- **Podstawowa Struktura Dokumentacji**
  - Kompletny przewodnik „zacznijmy” w serii
  - Kompleksowa dokumentacja wdrożenia i zapewniania zasobów
  - Szczegółowe zasoby rozwiązywania problemów i poradniki debugowania
  - Narzędzia i procedury walidacji przedwdrożeniowej

- **Moduł Zacznijmy**
  - Podstawy AZD: Kluczowe koncepcje i terminologia
  - Przewodnik Instalacji: Instrukcje konfiguracji dla platform
  - Przewodnik Konfiguracji: Ustawienia środowiska i uwierzytelnianie
  - Samouczek Pierwszego Projektu: Praktyczne nauczanie krok po kroku

- **Moduł Wdrożenia i Zapewnienia**
  - Przewodnik Wdrożenia: Kompletny workflow wdrożenia
  - Przewodnik Zapewnienia: Infrastruktura jako kod z Bicep
  - Najlepsze praktyki dla wdrożeń produkcyjnych
  - Wzorce architektury wielousługowej

- **Moduł Walidacji Przedwdrożeniowej**
  - Planowanie Pojemności: Walidacja dostępności zasobów Azure
  - Wybór SKU: Kompleksowe wskazówki dotyczące poziomów usług
  - Kontrole Przedstartowe: Zautomatyzowane skrypty walidacji (PowerShell i Bash)
  - Narzędzia do szacowania kosztów i planowania budżetu

- **Moduł Rozwiązywania Problemów**
  - Typowe Problemy: Często napotykane problemy i rozwiązania
  - Przewodnik Debugowania: Systematyczne metody rozwiązywania problemów
  - Zaawansowane techniki i narzędzia diagnostyczne
  - Monitorowanie wydajności i optymalizacja

- **Zasoby i Odniesienia**
  - Szybka ściągawka poleceń: Szybkie odniesienia do istotnych poleceń
  - Słownik: Kompleksowa terminologia i definicje akronimów
  - FAQ: Szczegółowe odpowiedzi na często zadawane pytania
  - Linki do zasobów zewnętrznych i społeczności

- **Przykłady i Szablony**
  - Przykład prostej aplikacji internetowej
  - Szablon wdrożenia statycznej witryny
  - Konfiguracja aplikacji kontenerowej
  - Wzorce integracji baz danych
  - Przykłady architektury mikroserwisowej
  - Implementacje funkcji bezserwerowych

#### Funkcje
- **Wsparcie Wieloplatformowe**: Przewodniki instalacji i konfiguracji dla Windows, macOS i Linux
- **Wiele Poziomów Umiejętności**: Treści zaprojektowane dla studentów aż po profesjonalnych deweloperów
- **Praktyczne Podejście**: Przykłady praktyczne i scenariusze z rzeczywistego świata
- **Kompleksowe Pokrycie**: Od podstawowych koncepcji po zaawansowane wzorce korporacyjne
- **Podejście Bezpieczeństwa Najpierw**: Najlepsze praktyki bezpieczeństwa zintegrowane w całym materiale
- **Optymalizacja Kosztów**: Wskazówki dotyczące efektywnych kosztowo wdrożeń i zarządzania zasobami

#### Jakość Dokumentacji
- **Szczegółowe Przykłady Kodów**: Praktyczne, przetestowane próbki kodu
- **Instrukcje Krok po Kroku**: Jasne, wykonalne wskazówki
- **Kompleksowa Obsługa Błędów**: Rozwiązywanie problemów z najczęstszymi przypadkami
- **Integracja Najlepszych Praktyk**: Standardy branżowe i rekomendacje
- **Zgodność Wersji**: Aktualne z najnowszymi usługami Azure i funkcjami azd

## Planowane Przyszłe Ulepszenia

### Wersja 3.1.0 (Planowana)
#### Rozszerzenie Platformy AI
- **Wsparcie Wielomodelowe**: Wzorce integracji dla Hugging Face, Azure Machine Learning i modeli niestandardowych
- **Frameworki Agentów AI**: Szablony dla wdrożeń LangChain, Semantic Kernel i AutoGen
- **Zaawansowane Wzorce RAG**: Opcje baz danych wektorowych poza Azure AI Search (Pinecone, Weaviate itd.)
- **Obserwowalność AI**: Ulepszone monitorowanie wydajności modeli, wykorzystania tokenów i jakości odpowiedzi

#### Doświadczenie Dewelopera
- **Rozszerzenie VS Code**: Zintegrowane doświadczenie rozwoju AZD + Microsoft Foundry
- **Integracja GitHub Copilot**: Generowanie szablonów AZD wspomagane AI
- **Interaktywne Samouczki**: Praktyczne ćwiczenia programistyczne z automatyczną walidacją dla scenariuszy AI
- **Treści Wideo**: Dodatkowe samouczki wideo dla wzrokowych uczniów skupiające się na wdrożeniach AI

### Wersja 4.0.0 (Planowana)
#### Wzorce AI Korporacyjne
- **Framework Zarządzania**: Zarządzanie modelami AI, zgodność i audyty
- **Wielo-klientowe AI**: Wzorce serwowania wielu klientów z odizolowanymi usługami AI
- **Wdrożenia Edge AI**: Integracja z Azure IoT Edge i instancjami kontenerów
- **Hybrydowa Chmura AI**: Wzorce wielochmurowe i hybrydowe dla obciążeń AI

#### Zaawansowane Funkcje
- **Automatyzacja Potoków AI**: Integracja MLOps z potokami Azure Machine Learning
- **Zaawansowane Bezpieczeństwo**: Wzorce zero-trust, prywatne punkty końcowe i zaawansowana ochrona przed zagrożeniami
- **Optymalizacja Wydajności**: Zaawansowane strategie strojenia i skalowania dla aplikacji AI o dużej przepustowości
- **Globalna Dystrybucja**: Wzorce dostarczania treści i buforowania edge dla aplikacji AI

### Wersja 3.0.0 (Planowana) - Zastąpiona przez Obecną Wersję
#### Proponowane Dodatki - Teraz Zrealizowane w v3.0.0
- ✅ **Treści Skoncentrowane na AI**: Kompleksowa integracja Microsoft Foundry (Zakończona)
- ✅ **Interaktywne Samouczki**: Praktyczne warsztaty AI (Zakończone)
- ✅ **Zaawansowany Moduł Bezpieczeństwa**: Specyficzne dla AI wzorce bezpieczeństwa (Zakończone)
- ✅ **Optymalizacja Wydajności**: Strategie strojenia obciążeń AI (Zakończone)

### Wersja 2.1.0 (Planowana) - Częściowo Zrealizowana w v3.0.0
#### Drobne Ulepszenia - Niektóre Zakończone w Obecnej Wersji
- ✅ **Dodatkowe Przykłady**: Scenariusze wdrożeń skoncentrowane na AI (Zakończone)
- ✅ **Rozszerzone FAQ**: Pytania i rozwiązywanie problemów specyficzne dla AI (Zakończone)
- **Integracja Narzędzi**: Ulepszone przewodniki integracji IDE i edytorów
- ✅ **Rozszerzenie Monitoringu**: Specyficzne dla AI wzorce monitorowania i alertowania (Zakończone)

#### Nadal Planowane na Przyszłą Wersję
- **Dokumentacja Przyjazna Mobilnym Urządzeniom**: Responsywny design do nauki mobilnej
- **Dostęp Offline**: Pakiety dokumentacji do pobrania
- **Ulepszona Integracja IDE**: Rozszerzenie VS Code dla przepływów pracy AZD + AI
- **Panel Społeczności**: Metryki społeczności w czasie rzeczywistym oraz śledzenie wkładów

## Wkład do Changelog

### Zgłaszanie Zmian
Przy wnoszeniu zmian do tego repozytorium, prosimy o zapewnienie, że wpisy w changelogu zawierają:

1. **Numer Wersji**: Zgodny z wersjonowaniem semantycznym (major.minor.patch)
2. **Data**: Data wydania lub aktualizacji w formacie RRRR-MM-DD
3. **Kategoria**: Dodano, Zmieniono, Przestarzałe, Usunięte, Naprawione, Bezpieczeństwo
4. **Jasny Opis**: Zwięzły opis wprowadzonych zmian
5. **Ocena Wpływu**: Jak zmiany wpływają na istniejących użytkowników

### Kategorie Zmian

#### Dodano
- Nowe funkcje, sekcje dokumentacji lub możliwości
- Nowe przykłady, szablony lub materiały edukacyjne
- Dodatkowe narzędzia, skrypty lub programy użytkowe

#### Zmieniono
- Modyfikacje istniejącej funkcjonalności lub dokumentacji
- Aktualizacje poprawiające przejrzystość lub dokładność
- Restrukturyzacja treści lub organizacji

#### Przestarzałe
- Funkcje lub podejścia wycofywane
- Sekcje dokumentacji zaplanowane do usunięcia
- Metody posiadające lepsze alternatywy

#### Usunięte
- Funkcje, dokumentacja lub przykłady, które nie są już istotne
- Informacje nieaktualne lub przestarzałe podejścia
- Treść zbędna lub skonsolidowana

#### Naprawione
- Korekty błędów w dokumentacji lub kodzie
- Rozwiązanie zgłoszonych problemów lub błędów
- Ulepszenia dokładności lub funkcjonalności

#### Bezpieczeństwo
- Ulepszenia lub poprawki związane z bezpieczeństwem
- Aktualizacje najlepszych praktyk bezpieczeństwa
- Rozwiązania luk bezpieczeństwa

### Wytyczne Wersjonowania Semantycznego

#### Wersja Główna (X.0.0)
- Zmiany łamiące kompatybilność wymagające działania użytkownika
- Znaczące restrukturyzacje treści lub organizacji
- Zmiany zmieniające fundamentalne podejście lub metodologię

#### Wersja Pomniejsza (X.Y.0)
- Nowe funkcje lub dodatki do treści
- Ulepszenia zachowujące kompatybilność wsteczną
- Dodatkowe przykłady, narzędzia lub zasoby

#### Wersja Poprawkowa (X.Y.Z)
- Naprawy błędów i korekty
- Drobne ulepszenia istniejącej treści
- Wyjaśnienia i niewielkie usprawnienia

## Opinie i Sugestie Społeczności

Aktywnie zachęcamy do opinii społeczności w celu ulepszenia tego zasobu edukacyjnego:

### Jak Przekazać Opinię
- **GitHub Issues**: Zgłaszaj problemy lub sugestie ulepszeń (kwestie specyficzne dla AI mile widziane)
- **Dyskusje na Discordzie**: Dziel się pomysłami i angażuj się w społeczność Microsoft Foundry
- **Pull Requesty**: Wnoś bezpośrednie ulepszenia do treści, zwłaszcza szablonów i przewodników AI
- **Microsoft Foundry Discord**: Uczestnicz w kanale #Azure dla dyskusji AZD + AI
- **Fora Społeczności**: Angażuj się w szersze dyskusje społeczności deweloperów Azure

### Kategorie Opinii
- **Dokładność Treści AI**: Korekty integracji usług AI i informacji o wdrożeniach
- **Doświadczenie Nauki**: Sugestie na temat lepszego przepływu nauki dla deweloperów AI
- **Brakujące Treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI
- **Dostępność**: Ulepszenia dla zróżnicowanych potrzeb edukacyjnych
- **Integracja Narzędzi AI**: Sugestie dla lepszej integracji przepływów pracy deweloperskich AI
- **Wzorce Produkcyjnego AI**: Prośby o wzorce wdrożeń AI dla przedsiębiorstw

### Zobowiązanie do Odpowiedzi
- **Odpowiedzi na Problemy**: W ciągu 48 godzin od zgłoszenia problemów
- **Prośby o Funkcje**: Ocena w ciągu tygodnia
- **Wkłady Społeczności**: Przegląd w ciągu tygodnia
- **Problemy Bezpieczeństwa**: Priorytet natychmiastowy z przyspieszoną odpowiedzią

## Harmonogram Utrzymania

### Regularne Aktualizacje
- **Comiesięczne Przeglądy**: Dokładność treści i walidacja linków
- **Kwartalne Aktualizacje**: Duże dodatki do treści i ulepszenia
- **Półroczne Przeglądy**: Kompleksowe restrukturyzacje i ulepszenia
- **Coroczne Wydania**: Główne aktualizacje wersji z istotnymi ulepszeniami

### Monitorowanie i Zapewnienie Jakości
- **Testy Automatyczne**: Regularna walidacja przykładów kodu i linków
- **Integracja Opinii Społeczności**: Regularne uwzględnianie sugestii użytkowników
- **Aktualizacje Technologii**: Zgodność z najnowszymi usługami Azure i wydaniami azd
- **Audyt Dostępności**: Regularny przegląd pod kątem zasad projektowania inkluzywnego

## Polityka Wsparcia Wersji

### Aktualne Wsparcie Wersji
- **Najnowsza Główna Wersja**: Pełne wsparcie z regularnymi aktualizacjami
- **Poprzednia Główna Wersja**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy
- **Starsze Wersje**: Wsparcie społecznościowe, brak oficjalnych aktualizacji

### Wskazówki dotyczące Migracji
Po wydaniu głównych wersji zapewniamy:
- **Przewodniki Migracyjne**: Instrukcje przejścia krok po kroku
- **Uwagi o Zgodności**: Szczegóły dotyczące zmian łamiących kompatybilność
- **Wsparcie narzędzi**: Skrypty lub narzędzia wspomagające migrację
- **Wsparcie Społeczności**: Dedykowane fora do pytań dotyczących migracji

---

**Nawigacja**
- **Poprzednia Lekcja**: [Przewodnik Studiowania](resources/study-guide.md)
- **Następna Lekcja**: Powrót do [Głównego README](README.md)

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wydaniach i ważnych aktualizacjach materiałów edukacyjnych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->