# Changelog - AZD dla Początkujących

## Wprowadzenie

Ten changelog dokumentuje wszystkie istotne zmiany, aktualizacje i ulepszenia w repozytorium AZD dla Początkujących. Stosujemy zasady wersjonowania semantycznego i utrzymujemy ten dziennik, aby pomóc użytkownikom zrozumieć, co zmieniło się między wersjami.

## Cele nauki

Przeglądając ten changelog, będziesz:
- Na bieżąco z nowymi funkcjami i dodatkami do treści
- Rozumieć ulepszenia w istniejącej dokumentacji
- Śledzić poprawki błędów i korekty w celu zapewnienia dokładności
- Obserwować ewolucję materiałów edukacyjnych w czasie

## Rezultaty nauki

Po zapoznaniu się z wpisami changelogu będziesz w stanie:
- Zidentyfikować nowe treści i dostępne zasoby do nauki
- Zrozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować swoją ścieżkę nauki na podstawie najnowszych materiałów
- Wnieść opinie i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.22.0] - 16-06-2026

#### Wypełnienie luk dla początkujących #2: Tworzenie szablonów, Dev Containers, Pulumi, Azure DevOps, Service Principals i inne
**Ta wersja zamyka pozostałe luki średniozaawansowane wskazane przez analizę azd-coverage: jak tworzyć i publikować własny szablon, odtwarzalne środowiska dev-container/Codespaces, dostawcę infrastruktury Pulumi, przegląd CI/CD Azure DevOps, uwierzytelnianie service-principal, wskazówki dotyczące wyboru hosta (AKS/Spring Apps), wyjaśnienia `azd restore`/`azd package`, obsługę błędów hooków oraz praktyki zespołowe/środowiska współdzielone.**

#### Dodano
- **🧱 Nowa lekcja Rozdziału 4** `docs/chapter-04-infrastructure/custom-templates.md` — tworzenie własnego szablonu azd: wymagana struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametryzacja infrastruktury z tokenem zasobów `uniqueString()` i tagiem `azd-env-name`, testowanie lokalne przez `azd init --template <local-path>`, publikowanie na GitHub oraz zgłaszanie do galerii Awesome AZD
- **📦 Nowa lekcja Rozdziału 1** `docs/chapter-01-foundation/dev-containers.md` — odtwarzalne środowiska azd z Dev Containers i GitHub Codespaces: minimalny `.devcontainer/devcontainer.json` używający oficjalnej funkcji `ghcr.io/azure/azure-dev/azd`, funkcje specyficzne dla języków, `docker-in-docker` dla hostów kontenerów oraz `azd auth login --use-device-code` do zdalnego logowania
- **🧩 Pulumi z azd** sekcja w `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, układ folderów Pulumi, stosy przypisane do środowisk azd, wymagane outputy/tagowanie oraz identyczny workflow `azd up` / `azd down`
- **🎯 Wskazówki dotyczące wyboru hosta** w `docs/chapter-04-infrastructure/provisioning.md` — przyjazne dla początkujących porównanie `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` oraz `springapp` z poradami, kiedy wybrać AKS lub Azure Spring Apps
- **🛠️ Przegląd CI/CD Azure DevOps** w `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, połączenie serwisowe z federacją tożsamości obciążenia (OIDC), wygenerowany `azure-dev.yml` oraz konfiguracja grupy zmiennych
- **🔑 Service Principals (Wzorzec 4)** dodane do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, nieinteraktywne `azd auth login` z użyciem sekretnych kluczy klienta vs. uwierzytelniania federowanego/OIDC, kiedy stosować oraz bezpieczne przechowywanie poświadczeń
- **🪝 Obsługa błędów hooków** podsekcja w `docs/chapter-04-infrastructure/deployment-guide.md` — kody wyjścia i `set -e`, `continueOnError`, testowanie hooków w izolacji za pomocą `azd hooks run`, powłoki specyficzne dla systemu operacyjnego oraz `--debug`
- **👥 Zespołowe / współdzielone środowiska** sekcja w `docs/chapter-03-configuration/configuration.md` — co znajduje się w `.azure/`, co ignorować w git, środowiska per programista, `azd env list`/`select` oraz dostarczanie wartości środowiska w CI/CD
- **🧰 Wyjaśnienia `azd restore` i rozszerzone `azd package`** w `resources/cheat-sheet.md` — przywracanie zależności i budowanie artefaktu do wdrożenia bez wdrażania

#### Zmieniono
- **🧭 Tabela lekcji Rozdziału 4** zaktualizowana o nową lekcję „Tworzenie własnego szablonu” (Lekcja 3)
- **🧭 Tabela lekcji Rozdziału 1** zaktualizowana o nową lekcję „Dev Containers & Codespaces” (Lekcja 5); stopki nawigacyjne powiązane między `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 16-06-2026

#### Wypełnienie luk dla początkujących: lekcja praktyczna multi-agent, „Bring Your Own App”, Terraform i przegląd CI/CD
**Ta wersja zamyka największe luki w kompletnym przewodniku dla początkujących, dodając dwie nowe lekcje praktyczne (wdrażalny przegląd multi-agenta oraz dodanie azd do istniejącej aplikacji), przyjazne dla początkujących wprowadzenie do hooków, sekcję Terraform z azd, krok po kroku przegląd pipeline GitHub Actions, wyjaśnienie nowych rozszerzeń preview oraz jednoznaczną listę kontrolną weryfikacji wdrożenia.**

#### Dodano
- **🤝 Nowa lekcja Rozdziału 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — w pełni praktyczny, wdrażalny dwugentowy przegląd (koordynator + specjaliści) wykorzystujący prawdziwy szablon (`contoso-creative-writer`), omawiający kiedy stosować multi-agent, workflow `azd up`, rozumienie wdrożonych zasobów, śledzenie między agentami, dostosowanie i sprzątanie
- **📦 Nowa lekcja Rozdziału 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak dodać azd do istniejącego projektu za pomocą `azd init` („użyj kodu w bieżącym katalogu”), zrozumienie `azure.yaml` i `infra/`, `azd infra generate`, wykrywanie hosta oraz wdrażanie przez `azd up`
- **🌐 Sekcja Terraform z azd** dodana do `docs/chapter-04-infrastructure/provisioning.md` — konfiguracja `infra.provider: terraform`, układ folderów `.tf`, wymagane outputy `AZURE_*` i tagowanie `azd-env-name`, oraz identyczny workflow `azd up` / `azd down` (zamyka lukę, gdzie deklarowano wsparcie Terraform, ale pokazano tylko Bicep)
- **⚙️ Krok po kroku przegląd GitHub Actions** w `docs/chapter-08-production/production-ai-practices.md` — od repozytorium GitHub do automatycznych wdrożeń: `azd pipeline config`, federowane poświadczenia OIDC (bez przechowywanych sekretów), wygenerowany `azure-dev.yml` oraz wskazówki o sekretach vs zmiennych
- **🪝 Wprowadzenie „Nowy w hookach?” dla początkujących** w `docs/chapter-04-infrastructure/deployment-guide.md` — co to jest hook, tabela etapów hooków, minimalny pierwszy hook oraz ręczne uruchamianie hooków za pomocą `azd hooks run`
- **✅ Lista kontrolna „Zweryfikuj swoje wdrożenie”** dodana do kroku 5 w `docs/chapter-01-foundation/first-project.md` — test dymny, sprawdzenie punktu końcowego stanu zdrowia i jednoznaczne kryteria sukcesu
- **🧩 Wyjaśnienie nowych rozszerzeń preview** `azure.ai.skills` i `azure.ai.connections` (co to jest i kiedy z nich korzystać) w `docs/chapter-08-production/production-ai-practices.md`

#### Zmieniono
- **🧭 Tabela lekcji Rozdziału 5** poprawiona: `multi-agent-basics.md` to teraz Lekcja 1 (jedyna w pełni praktyczna lekcja), z uczciwym oznaczeniem, że Lekcja 2 znajduje się w Rozdziale 6, a scenariusz Retail to blueprint architektury, nie szablon na jedno polecenie
- **🧭 Tabela lekcji Rozdziału 1** zawiera teraz nową lekcję „Bring Your Own App” (Lekcja 4)
- **🔗 Stopki nawigacyjne** zaktualizowane: `first-project.md` teraz prowadzi dalej do `bring-your-own-app.md`

#### Naprawiono
- **🧱 Zamknięto lukę Terraform deklarowaną, ale brakującą** — kurs wcześniej odnosił się do wsparcia Terraform bez jego pokazania
- **🔀 Poprawiono mylące przepięcia w Rozdziale 5** które sugerowały istnienie pełnej implementacji multi-agenta, podczas gdy był tylko blueprint architektury

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

### [v3.20.0] - 16-06-2026

#### Odświeżenie AZD 1.25.6, pełne polecenia cyklu życia agenta i rebranding Aspire
**Ta wersja ponownie weryfikuje kurs względem `azd` `1.25.6` (czerwiec 2026) oraz rozszerzenia `azure.ai.agents` `0.1.40-preview`, rozszerza wytyczne dotyczące AI od „szkicowania agenta” do pełnego cyklu życia agenta (test → ocena → optymalizacja → inspekcja → usunięcie), udostępnia nowe rozszerzenia preview `azure.ai.skills` i `azure.ai.connections` oraz notuje rebranding produktu z ".NET Aspire" na „Aspire”.**

#### Dodano
- **🔁 Pełne pokrycie cyklu życia agenta** dla początkujących i inżynierów AI w dokumentacji:
  - `docs/chapter-01-foundation/azd-basics.md` — tabela cyklu życia (szkicuj → testuj → mierz → poprawiaj → inspekcja → sprzątanie) dodana do sekcji rozszerzeń i poleceń AI
  - `docs/chapter-08-production/production-ai-practices.md` — nowa sekcja „Zarządzanie cyklem życia agenta” obejmująca `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` oraz `delete --force`
  - `resources/cheat-sheet.md` — rozszerzone polecenia agenta AI o `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` i `delete --force`
- **🧩 Nowe rozszerzenia preview** udokumentowane: `azure.ai.skills` (wielokrotnego użytku umiejętności agenta) i `azure.ai.connections` (połączenia Foundry) dodane do tabeli rozszerzeń i cheat sheeta
- **⏱️ Wskazówki dotyczące czasu reakcji** — przykłady `azd ai agent invoke` teraz uwzględniają wydruk całkowitego opóźnienia i czasu do pierwszego bajtu
- **📌 Baner wersji** w głównym README kierujący uczących się do `azd version` i `azd upgrade`

#### Zmieniono
- **✅ Aktualizacja bazowej walidacji** z `azd 1.23.12` (marzec 2026) do `azd 1.25.6` (czerwiec 2026) w README wszystkich rozdziałów i dokumentacji warsztatów
- **🤖 Aktualizacja notatki o rozszerzeniach w Rozdziale 2** z `azure.ai.agents` `0.1.18-preview` do `0.1.40-preview`
- **🧪 Przykład walidacji warsztatowej** (`azd version`) zaktualizowany do `1.25.6`
- **🧭 Odświeżone README „Co nowego w azd dzisiaj”** podkreśla pełny cykl życia agenta, nowe rozszerzenia AI i ostatnie poprawki jakości życia (`azd init` idempotentność, czyszczenie tokenów `azd auth login`, podpowiedź pierwszego uruchomienia `azd tool`)
- **📖 Rozdział 2 agents.md (Opcja 4)** teraz kieruje uczących do poleceń cyklu życia po wdrożeniu, zamiast zatrzymywać się na `azd up`

#### Naprawiono
- **🏷️ Nazewnictwo produktu** — dodano notatkę o rebrandingu Aspire (".NET Aspire" to teraz po prostu „Aspire”); wsparcie azd dla Aspire pozostaje bez zmian
- **🔎 Potwierdzenie walidacji podczas premiery** na podstawie kanału wydań Azure Developer CLI: stabilny CLI `1.25.6` (2026-06-12) oraz `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

### [v3.19.1] - 27-03-2026
#### Wyjaśnienie dla początkujących, walidacja konfiguracji i oczyszczanie końcowej komendy AZD
**Ta wersja kontynuuje walidację AZD 1.23 i skupia się na dokumentacji dla początkujących: wyjaśnia zalecenia dotyczące pierwszego uwierzytelniania w AZD, dodaje skrypty walidacji lokalnej konfiguracji, weryfikuje kluczowe komendy względem działającego CLI AZD oraz usuwa ostatnie przestarzałe anglojęzyczne odniesienia do komend poza changelogiem.**

#### Dodano
- **🧪 Skrypty walidacji konfiguracji dla początkujących** w `validate-setup.ps1` i `validate-setup.sh`, dzięki którym uczniowie mogą potwierdzić wymagane narzędzia przed rozpoczęciem Rozdziału 1
- **✅ Wstępne kroki walidacji konfiguracji** w głównym README oraz README Rozdziału 1, aby brakujące wymagania były wykrywane przed `azd up`

#### Zmieniono
- **🔐 Wytyczne uwierzytelniania dla początkujących** teraz konsekwentnie traktują `azd auth login` jako główną ścieżkę w procesach AZD, z `az login` podkreślonym jako opcjonalne, chyba że używa się bezpośrednio poleceń Azure CLI
- **📚 Przepływ onboardingu w Rozdziale 1** teraz kieruje uczniów do walidacji lokalnej konfiguracji przed instalacją, uwierzytelnieniem i pierwszymi krokami deploymentu
- **🛠️ Komunikaty walidatora** teraz wyraźnie rozdzielają wymagania blokujące od opcjonalnych ostrzeżeń Azure CLI dla ścieżki początkującego korzystającego wyłącznie z AZD
- **📖 Dokumentacja konfiguracji, rozwiązywania problemów i przykłady** teraz rozróżnia wymagane uwierzytelnianie AZD i opcjonalne logowanie Azure CLI tam, gdzie wcześniej oba były przedstawiane bez kontekstu

#### Naprawiono
- **📋 Pozostałe anglojęzyczne odniesienia do komend** zaktualizowano do aktualnych form AZD, w tym `azd config show` w cheat sheet i `azd monitor --overview` tam, gdzie miały być wskazówki dotyczące widoku w Azure Portal
- **🧭 Twierdzenia dla początkujących w Rozdziale 1** złagodzono, aby nie obiecywać gwarantowanej braku błędów lub automatycznego rollbacku dla wszystkich szablonów i zasobów Azure
- **🔎 Walidacja widoczna na żywo** potwierdziła bieżące wsparcie dla `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` oraz `azd down --force --purge`

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
**Ta wersja przeprowadza walidację dokumentacji względem `azd` `1.23.12`, aktualizuje przestarzałe przykłady komend AZD, odświeża zalecenia dla modelu AI do aktualnych domyślnych wartości oraz rozszerza instrukcje warsztatowe poza GitHub Codespaces, by wspierać również kontenery deweloperskie i lokalne klony.**

#### Dodano
- **✅ Notatki walidacyjne w podstawowych rozdziałach i dokumentacji warsztatowej**, aby wyraźnie wskazać testowaną bazę AZD dla uczniów używających nowszych lub starszych wersji CLI
- **⏱️ Wskazówki dotyczące limitu czasu deploymentu** dla długotrwałych wdrożeń aplikacji AI z użyciem `azd deploy --timeout 1800`
- **🔎 Kroki inspekcji rozszerzeń** z `azd extension show azure.ai.agents` w dokumentacji workflow AI
- **🌐 Poszerzone wytyczne dotyczące środowiska warsztatowego** obejmujące GitHub Codespaces, kontenery dev i lokalne klony przy wykorzystaniu MkDocs

#### Zmieniono
- **📚 Wstępne README rozdziałów** teraz konsekwentnie podają walidację względem `azd 1.23.12` w sekcjach foundation, konfiguracji, infrastruktury, multi-agent, pre-deployment, troubleshooting i produkcji
- **🛠️ Odniesienia do komend AZD** zaktualizowano do obecnych form w dokumentacji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` lub `azd env get-value(s)` w zależności od kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, gdzie wskazany jest widok Application Insights
- **🧪 Przykłady podglądu provisioning** uproszczone do obecnie wspieranych, np. `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Przepływ warsztatowy** zaktualizowany, by uczniowie mogli ukończyć laboratoria w Codespaces, kontenerze deweloperskim lub lokalnym klonie zamiast domyślnie tylko w Codespaces
- **🔐 Wytyczne uwierzytelniania** preferują teraz `azd auth login` dla workflow AZD, a `az login` traktują jako opcjonalne przy bezpośrednim użyciu Azure CLI

#### Naprawiono
- **🪟 Komendy instalacji Windows** znormalizowane do obecnej wielkości liter pakietu `winget` w przewodniku instalacyjnym
- **🐧 Wskazówki instalacji Linux** poprawione, aby unikać nieobsługiwanych dystrybucyjnie instrukcji pakietów `azd` i zamiast tego wskazywać odpowiednie release assets
- **📦 Przykłady modeli AI** odświeżone ze starszych domyślnych takich jak `gpt-35-turbo` i `text-embedding-ada-002` na obecne przykłady typu `gpt-4.1-mini`, `gpt-4.1` i `text-embedding-3-large`
- **📋 Fragmenty deploymentu i diagnostyki** poprawione do używania bieżących komend środowiska i statusu w logach, skryptach i krokach rozwiązywania problemów
- **⚙️ Wytyczne GitHub Actions** zaktualizowane z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Wytyczne zgód MCP/Copilot** zaktualizowane z `azd mcp consent` na `azd copilot consent list`

#### Ulepszone
- **🧠 Wytyczne rozdziału AI** lepiej wyjaśniają zachowanie `azd ai` w wersjach preview, logowanie zależne od dzierżawy, aktualne użycie rozszerzeń i zaktualizowane rekomendacje wdrożeniowe modeli
- **🧪 Instrukcje warsztatowe** korzystają teraz z bardziej realistycznych przykładów wersji oraz klarowniejszego języka dotyczącego konfiguracji środowiska dla laboratoriów praktycznych
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

#### Komendy AZD AI CLI, walidacja treści i rozszerzenie szablonów
**Ta wersja dodaje pokrycie komend `azd ai`, `azd extension` i `azd mcp` w rozdziałach powiązanych z AI, naprawia uszkodzone linki i zdeprecjonowany kod w agents.md, aktualizuje cheat sheet oraz przebudowuje sekcję Przykładów Szablonów z zweryfikowanymi opisami i nowymi szablonami Azure AI AZD.**

#### Dodano
- **🤖 Pokrycie AZD AI CLI** w 7 plikach (wcześniej tylko w Rozdziale 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nowa sekcja "Rozszerzenia i komendy AI" wprowadzająca `azd extension`, `azd ai agent init` oraz `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcja 4: `azd ai agent init` z tabelą porównawczą (szablon vs podejście manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcje "Rozszerzenia AZD dla Foundry" i "Deployment agent-first"
  - `docs/chapter-05-multi-agent/README.md` — Szybki start pokazujący ścieżki wdrożenia oparte na szablonie i manifeście
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcja wdrożenia rozszerzona o opcję `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcja "Polecenia rozszerzenia AZD AI do diagnostyki"
  - `resources/cheat-sheet.md` — Nowa sekcja "Komendy AI i rozszerzeń" z `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Nowe przykładowe szablony AZD AI** w `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — czat RAG .NET z Blazor WebAssembly, Semantic Kernel i obsługą rozmów głosowych
  - **azure-search-openai-demo-java** — czat RAG Java z Langchain4J i opcjami wdrożenia ACA/AKS
  - **contoso-creative-writer** — wieloagentowa aplikacja kreatywnego pisania z Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — serverless RAG wykorzystujący Azure Functions + LangChain.js + Cosmos DB z lokalnym wsparciem Ollama
  - **chat-with-your-data-solution-accelerator** — enterprise RAG accelerator z panelem administracyjnym, integracją Teams i opcjami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — referencyjna aplikacja MCP dla wieloagentowej orkiestracji z serwerami w .NET, Python, Java i TypeScript
  - **azd-ai-starter** — minimalistyczny starter infrastruktury Azure AI w Bicep
  - **🔗 Super galeria AZD AI** — odniesienie do [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ szablonów)

#### Naprawiono
- **🔗 Nawigacja w agents.md**: linki Poprzedni/Następny teraz odpowiadają kolejności lekcji w README Rozdziału 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Uszkodzone linki w agents.md**: `production-ai-practices.md` poprawiony na `../chapter-08-production/production-ai-practices.md` (3 wystąpienia)
- **📦 Zdeprecjonowany kod w agents.md**: zamieniono `opencensus` na `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Nieprawidłowe API w agents.md**: przeniesiono `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 Liczenie tokenów w agents.md**: zastąpiono przybliżenie `len//4` funkcją `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: poprawiono usługi z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (domyślny host zmieniony w październiku 2024)
- **contoso-chat**: zaktualizowano opis, by odzwierciedlał Azure AI Foundry + Prompty, zgodnie z faktycznym tytułem i stackiem repozytorium

#### Usunięto
- **ai-document-processing**: usunięto niedziałające odwołanie do szablonu (repozytorium niepubliczne jako szablon AZD)

#### Ulepszone
- **📝 Ćwiczenia w agents.md**: Ćwiczenie 1 pokazuje teraz oczekiwane wyjście i krok `azd monitor`; Ćwiczenie 2 zawiera pełny kod rejestracji `FunctionTool`; Ćwiczenie 3 zastępuje niejasne wskazówki konkretnymi komendami `prepdocs.py`
- **📚 Zasoby w agents.md**: zaktualizowano linki dokumentacji do aktualnych stron Azure AI Agent Service i quickstartu
- **📋 Tabela kolejnych kroków w agents.md**: dodano odnośnik do laboratorium AI Workshop dla pełnego pokrycia rozdziału

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
**Ta wersja usprawnia nawigację w rozdziałach README.md dzięki ulepszonemu formatowi tabeli.**

#### Zmiany
- **Tabela Mapy Kursu**: Ulepszona o bezpośrednie linki do lekcji, szacowany czas trwania oraz oceny trudności
- **Porządki w Folderach**: Usunięto zbędne stare foldery (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Weryfikacja Linków**: Zweryfikowano wszystkie 21+ linków wewnętrznych w tabeli Mapy Kursu

### [v3.16.0] - 2026-02-05

#### Aktualizacje Nazw Produktów
**Ta wersja aktualizuje odniesienia do produktów według aktualnego brandingu Microsoft.**

#### Zmiany
- **Microsoft Foundry → Microsoft Foundry**: Wszystkie odniesienia zaktualizowane w plikach bez tłumaczenia
- **Azure AI Agent Service → Foundry Agents**: Nazwa usługi zaktualizowana, aby odzwierciedlać aktualny branding

#### Zaktualizowane Pliki
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

#### Główna Rekonstrukcja Repozytorium: Foldery według Rozdziałów
**Ta wersja restrukturyzuje dokumentację w dedykowane foldery rozdziałów dla czytelniejszej nawigacji.**

#### Zmiany Nazw Folderów
Stare foldery zostały zastąpione folderami ponumerowanymi według rozdziałów:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano nowy: `docs/chapter-05-multi-agent/`

#### Migracje Plików
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
- **🔗 Zaktualizowano wszystkie linki wewnętrzne**: Ponad 78 ścieżek zaktualizowanych w całej dokumentacji
- **🗺️ Główne README.md**: Zaktualizowano Mapę Kursu z nową strukturą rozdziałów
- **📝 examples/README.md**: Zaktualizowano odniesienia do folderów rozdziałów

#### Usunięto
- Starą strukturę folderów (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturyzacja Repozytorium: Nawigacja Rozdziałowa
**Ta wersja dodała pliki README do nawigacji rozdziałowej (zastąpiona przez v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nowy Przewodnik po Agentach AI
**Ta wersja dodaje kompleksowy przewodnik wdrażania agentów AI przy użyciu Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Kompletny przewodnik obejmujący:
  - Czym są agenci AI i czym różnią się od chatbotów
  - Trzy szablony szybkiego startu agentów (Foundry Agents, Prompty, RAG)
  - Wzorce architektury agentów (pojedynczy agent, RAG, multi-agent)
  - Konfiguracja i dostosowanie narzędzi
  - Monitorowanie i śledzenie metryk
  - Aspekty kosztowe i optymalizacja
  - Typowe scenariusze rozwiązywania problemów
  - Trzy ćwiczenia praktyczne z kryteriami sukcesu

#### Struktura Treści
- **Wprowadzenie**: Koncepcje agentów dla początkujących
- **Szybki Start**: Wdrażanie agentów z `azd init --template get-started-with-ai-agents`
- **Wzorce Architektury**: Diagramy wizualne wzorców agentów
- **Konfiguracja**: Ustawienia narzędzi i zmienne środowiskowe
- **Monitorowanie**: Integracja z Application Insights
- **Ćwiczenia**: Stopniowane zadania praktyczne (20-45 minut każde)

---

### [v3.12.0] - 2026-02-05

#### Aktualizacja Środowiska DevContainer
**Ta wersja aktualizuje konfigurację kontenera deweloperskiego o nowoczesne narzędzia i lepsze domyślne ustawienia dla doświadczenia AZD.**

#### Zmiany
- **🐳 Obraz Bazowy**: Zaktualizowano z `python:3.12-bullseye` na `python:3.12-bookworm` (najnowszy stabilny Debian)
- **📛 Nazwa Kontenera**: Zmieniono z "Python 3" na "AZD dla Początkujących" dla przejrzystości

#### Dodano
- **🔧 Nowe Funkcje Dev Container**:
  - `azure-cli` z włączonym wsparciem dla Bicep
  - `node:20` (wersja LTS dla szablonów AZD)
  - `github-cli` do zarządzania szablonami
  - `docker-in-docker` do wdrożeń aplikacji kontenerowych

- **🔌 Przekierowanie Portów**: Prekonfigurowane porty do powszechnego rozwoju:
  - 8000 (podgląd MkDocs)
  - 3000 (aplikacje webowe)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nowe Rozszerzenia VS Code**:
  - `ms-python.vscode-pylance` - ulepszone IntelliSense dla Pythona
  - `ms-azuretools.vscode-azurefunctions` - wsparcie Azure Functions
  - `ms-azuretools.vscode-docker` - wsparcie Dockera
  - `ms-azuretools.vscode-bicep` - wsparcie języka Bicep
  - `ms-azure-devtools.azure-resource-groups` - zarządzanie zasobami Azure
  - `yzhang.markdown-all-in-one` - edycja Markdown
  - `DavidAnson.vscode-markdownlint` - linting Markdown
  - `bierner.markdown-mermaid` - obsługa diagramów Mermaid
  - `redhat.vscode-yaml` - wsparcie YAML (dla azure.yaml)
  - `eamodio.gitlens` - wizualizacja Git
  - `mhutchie.git-graph` - historia Git

- **⚙️ Ustawienia VS Code**: Dodano domyślne ustawienia dla interpretera Pythona, formatowania przy zapisie i usuwania białych znaków

- **📦 Zaktualizowano requirements-dev.txt**:
  - Dodano wtyczkę do minifikacji MkDocs
  - Dodano pre-commit do kontroli jakości kodu
  - Dodano pakiety Azure SDK (azure-identity, azure-mgmt-resource)

#### Naprawiono
- **Komenda Po Utworzeniu**: Teraz weryfikuje instalację AZD i Azure CLI przy starcie kontenera

---

### [v3.11.0] - 2026-02-05

#### Ulepszenie README dla Początkujących
**Ta wersja znacząco ulepsza README.md, czyniąc je bardziej dostępnym dla początkujących, oraz dodaje kluczowe zasoby dla programistów AI.**

#### Dodano
- **🆚 Porównanie Azure CLI i AZD**: Jasne wyjaśnienie, kiedy używać którego narzędzia, z praktycznymi przykładami
- **🌟 Wspaniałe Linki AZD**: Bezpośrednie odnośniki do galerii szablonów społeczności i zasobów do współtworzenia:
  - [Galeria Awesome AZD](https://azure.github.io/awesome-azd/) - ponad 200 gotowych szablonów do wdrożenia
  - [Dodaj Szablon](https://github.com/Azure/awesome-azd/issues) - wkład społeczności
- **🎯 Przewodnik Szybkiego Startu**: Uproszczony, trzyetapowy rozdział startowy (Instalacja → Logowanie → Wdrożenie)
- **📊 Tabela Nawigacji według Doświadczenia**: Jasne wskazówki, od czego zacząć w zależności od doświadczenia developera

#### Zmiany
- **Struktura README**: Przeorganizowana dla stopniowego ujawniania - najważniejsze informacje na początku
- **Sekcja Wstępna**: Przepisana, by wyjaśnić „Magia `azd up`” dla całkowicie początkujących
- **Usunięto Duplikaty**: Wyeliminowano powtarzającą się sekcję rozwiązywania problemów
- **Polecenia Rozwiązywania Problemów**: Naprawiono odniesienia `azd logs`, zastępując je prawidłowym `azd monitor --logs`

#### Naprawiono
- **🔐 Polecenia Uwierzytelniania**: Dodano `azd auth login` i `azd auth logout` do `cheat-sheet.md`
- **Błędne Odniesienia do Poleceń**: Usunięto pozostałości `azd logs` z sekcji rozwiązywania problemów w README

#### Uwagi
- **Zakres**: Zmiany w głównym README.md i resources/cheat-sheet.md
- **Adresaci**: Ulepszenia skierowane specjalnie do deweloperów nowych w AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizacja Poprawności Poleceń Azure Developer CLI
**Ta wersja poprawia nieistniejące polecenia AZD w całej dokumentacji, zapewniając, że wszystkie przykłady używają prawidłowej składni Azure Developer CLI.**

#### Naprawiono
- **🔧 Usunięto Nieistniejące Polecenia AZD**: Kompleksowy audyt i korekta błędnych poleceń:
  - `azd logs` (nie istnieje) → zastąpiono `azd monitor --logs` lub alternatywami Azure CLI
  - podpolecenia `azd service` (nie istnieją) → zastąpiono `azd show` i Azure CLI
  - `azd infra import/export/validate` (nie istnieją) → usunięte lub zastąpione prawidłowymi opcjami
  - flagi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nie istnieją) → usunięte
  - flagi `azd provision --what-if/--rollback` (nie istnieją) → zaktualizowane do `--preview`
  - `azd config validate` (nie istnieje) → zastąpione `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nie istnieją) → usunięte

- **📚 Pliki z Aktualizacjami Poleceń**:
  - `resources/cheat-sheet.md`: Duża korekta referencji poleceń
  - `docs/deployment/deployment-guide.md`: Naprawiono strategie rollback i wdrożeń
  - `docs/troubleshooting/debugging.md`: Poprawiono sekcje analizy logów
  - `docs/troubleshooting/common-issues.md`: Zaktualizowano polecenia rozwiązywania problemów
  - `docs/troubleshooting/ai-troubleshooting.md`: Naprawiono sekcję debugowania AZD
  - `docs/getting-started/azd-basics.md`: Skorygowano polecenia monitorowania
  - `docs/getting-started/first-project.md`: Zaktualizowano przykłady monitorowania i debugowania
  - `docs/getting-started/installation.md`: Naprawiono przykłady pomocy i wersji
  - `docs/pre-deployment/application-insights.md`: Poprawiono polecenia wyświetlania logów
  - `docs/pre-deployment/coordination-patterns.md`: Naprawiono polecenia debugowania agentów

- **📝 Zaktualizowano Odniesienia do Wersji**:
  - `docs/getting-started/installation.md`: Zmieniono sztywno wpisaną wersję `1.5.0` na ogólną `1.x.x` z linkiem do wydań

#### Zmiany
- **Strategie Rollback**: Zaktualizowano dokumentację do użycia rollbacku opartego na Git (AZD nie posiada natywnego rollbacku)
- **Wyświetlanie Logów**: Zastąpiono odniesienia `azd logs` poleceniami `azd monitor --logs`, `azd monitor --live` oraz poleceniami Azure CLI
- **Sekcja Wydajności**: Usunięto nieistniejące flagi wdrożeń równoległych/incrementalnych, wprowadzono prawidłowe alternatywy

#### Szczegóły Techniczne
- **Prawidłowe Polecenia AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Prawidłowe Flagii azd monitor**: `--live`, `--logs`, `--overview`
- **Usunięte Funkcje**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Uwagi
- **Weryfikacja**: Polecenia zweryfikowane względem Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ukończenie Warsztatów i Poprawa Jakości Dokumentacji
**Ta wersja kończy interaktywne moduły warsztatowe, naprawia wszystkie niedziałające linki w dokumentacji oraz poprawia ogólną jakość treści dla deweloperów AI korzystających z Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nowy dokument wytycznych dotyczących współtworzenia zawierający:
  - Jasne instrukcje zgłaszania problemów i proponowania zmian
  - Standardy dokumentacji dla nowej zawartości
  - Wytyczne dotyczące przykładów kodu i konwencji komunikatów commitów
  - Informacje o zaangażowaniu społeczności

#### Zakończono
- **🎯 Moduł warsztatowy 7 (Podsumowanie)**: W pełni ukończony moduł podsumowujący z:
  - Kompleksowym podsumowaniem osiągnięć warsztatu
  - Sekcją kluczowych opanowanych koncepcji obejmującą AZD, szablony i Microsoft Foundry
  - Rekomendacjami kontynuacji ścieżki nauki
  - Ćwiczeniami wyzwań warsztatowych z oceną trudności
  - Linkami do opinii społeczności i wsparcia

- **📚 Moduł warsztatowy 3 (Deconstruct)**: Zaktualizowane cele nauki z:
  - Wskazówkami aktywacji GitHub Copilot na serwerach MCP
  - Zrozumieniem struktury folderów szablonów AZD
  - Wzorcami organizacji Infrastructure-as-code (Bicep)
  - Instrukcjami do laboratorium praktycznego

- **🔧 Moduł warsztatowy 6 (Teardown)**: Ukończony wraz z:
  - Celami dotyczącymi czyszczenia zasobów i zarządzania kosztami
  - Użyciem `azd down` do bezpiecznego dezaprovisioningu infrastruktury
  - Wskazówkami dotyczącymi odzyskiwania miękko usuniętych usług kognitywnych
  - Bonusowymi promptami do eksploracji GitHub Copilot i Azure Portal

#### Naprawiono
- **🔗 Naprawa uszkodzonych linków**: Rozwiązano ponad 15 uszkodzonych linków wewnętrznej dokumentacji:
  - `docs/ai-foundry/ai-model-deployment.md`: Naprawiono ścieżki do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawiono ścieżki do ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamieniono nieistniejący cicd-integration.md na deployment-guide.md
  - `examples/retail-scenario.md`: Naprawiono ścieżki FAQ i przewodnika po rozwiązywaniu problemów
  - `examples/container-app/microservices/README.md`: Poprawiono ścieżki do przewodnika kursu i przewodnika wdrożenia
  - `resources/faq.md` i `resources/glossary.md`: Zaktualizowano odniesienia do rozdziału AI
  - `course-outline.md`: Naprawiono odniesienia do przewodnika instruktora i laboratoriów warsztatu AI

- **📅 Baner statusu warsztatów**: Zaktualizowano ze statusu „W budowie” na aktywny status warsztatu z datą luty 2026

- **🔗 Nawigacja warsztatowa**: Naprawiono uszkodzone linki nawigacyjne w README.md warsztatu wskazujące na nieistniejący folder lab-1-azd-basics

#### Zmieniono
- **Prezentacja warsztatowa**: Usunięto ostrzeżenie „w budowie”, warsztat jest teraz kompletny i gotowy do użycia
- **Spójność nawigacji**: Zapewniono prawidłową nawigację pomiędzy wszystkimi modułami warsztatów
- **Odniesienia do ścieżek nauki**: Zaktualizowano krzyżowe odwołania w rozdziałach na prawidłowe ścieżki microsoft-foundry

#### Zweryfikowano
- ✅ Wszystkie angielskie pliki markdown mają prawidłowe linki wewnętrzne
- ✅ Moduły warsztatowe 0-7 są kompletne z celami nauki
- ✅ Nawigacja między rozdziałami i modułami działa poprawnie
- ✅ Zawartość jest odpowiednia dla deweloperów AI używających Microsoft AZD
- ✅ Język i struktura przyjazne dla początkujących
- ✅ CONTRIBUTING.md dostarcza jasne wytyczne dla współtwórców społecznościowych

#### Implementacja techniczna
- **Walidacja linków**: Zautomatyzowany skrypt PowerShell zweryfikował wszystkie .md linki wewnętrzne
- **Audyt zawartości**: Ręczny przegląd kompletności warsztatów i przyjazności dla początkujących
- **System nawigacji**: Stosowanie spójnych wzorców nawigacji w rozdziałach i modułach

#### Notatki
- **Zakres**: Zmiany dotyczą wyłącznie dokumentacji w języku angielskim
- **Tłumaczenia**: Foldery tłumaczeń nie zostały zaktualizowane w tej wersji (automatyczne tłumaczenie zsynchronizuje się później)
- **Czas trwania warsztatu**: Kompletny warsztat zapewnia teraz 3-4 godziny praktycznej nauki

---

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: Monitorowanie, bezpieczeństwo i wzorce wieloagentowe
**Ta wersja dodaje kompleksowe lekcje na poziomie A o integracji Application Insights, wzorcach uwierzytelniania oraz koordynacji wieloagentowej dla wdrożeń produkcyjnych.**

#### Dodano
- **📊 Lekcja integracji Application Insights**: w `docs/pre-deployment/application-insights.md`:
  - Wdrożenie skoncentrowane na AZD z automatycznym provisioningiem
  - Kompleksowe szablony Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z niestandardową telemetrią (ponad 1200 linii)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów modeli Microsoft Foundry)
  - 6 diagramów Mermaid (architektura, rozproszone śledzenie, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, pulpity, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Streaming metryk na żywo i debugowanie w czasie rzeczywistym
  - 40-50 minut czasu nauki z wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i bezpieczeństwa**: w `docs/getting-started/authsecurity.md`:
  - 3 wzorce autoryzacji (connection strings, Key Vault, zarządzana tożsamość)
  - Kompleksowe szablony infrastruktury Bicep dla bezpiecznych wdrożeń
  - Kod aplikacji Node.js z integracją Azure SDK
  - 3 kompletne ćwiczenia (włączenie tożsamości zarządzanej, tożsamość przypisana użytkownikowi, rotacja Key Vault)
  - Najlepsze praktyki bezpieczeństwa i konfiguracje RBAC
  - Przewodnik po rozwiązywaniu problemów i analiza kosztów
  - Produkcyjne wzorce uwierzytelniania bezhasłowego

- **🤖 Lekcja wzorców koordynacji wieloagentowej**: w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Kompletny implementacja serwisu orkiestratora (Python/Flask, ponad 1500 linii)
  - 3 specjalistyczne implementacje agentów (Badacz, Pisarz, Redaktor)
  - Integracja Service Bus dla kolejkowania wiadomości
  - Zarządzanie stanem Cosmos DB dla systemów rozproszonych
  - 6 diagramów Mermaid pokazujących interakcje agentów
  - 3 zaawansowane ćwiczenia (obsługa timeoutów, logika retry, obwód zabezpieczający)
  - Analiza kosztów (240-565 USD/miesiąc) z strategiami optymalizacji
  - Integracja Application Insights do monitorowania

#### Ulepszono
- **Rozdział pre-deployment**: Zawiera teraz kompleksowe wzorce monitorowania i koordynacji
- **Rozdział wprowadzający**: Rozszerzony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Kompleksowa pokrywa od bezpieczeństwa po obserwowalność
- **Konspekt kursu**: Zaktualizowano odwołania do nowych lekcji w rozdziałach 3 i 6

#### Zmieniono
- **Postęp nauki**: Lepsza integracja bezpieczeństwa i monitorowania w całym kursie
- **Jakość dokumentacji**: Spójne standardy poziomu A (95-97%) w nowych lekcjach
- **Wzorce produkcyjne**: Kompleksowe pokrycie end-to-end dla wdrożeń korporacyjnych

#### Ulepszono
- **Doświadczenie programisty**: Jasna ścieżka od rozwoju do monitorowania produkcji
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania sekretami
- **Obserwowalność**: Kompleksowa integracja Application Insights z AZD
- **Obciążenia AI**: Specjalistyczne monitorowanie modeli Microsoft Foundry i systemów wieloagentowych

#### Zweryfikowano
- ✅ Wszystkie lekcje zawierają kompletny działający kod (nie fragmenty)
- ✅ Diagramy Mermaid dla wizualnej nauki (łącznie 19 diagramów w 3 lekcjach)
- ✅ Ćwiczenia praktyczne z krokami weryfikacji (9 łącznie)
- ✅ Produkcyjne szablony Bicep możliwe do wdrożenia przez `azd up`
- ✅ Analiza kosztów i strategie optymalizacji
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki
- ✅ Punkty kontrolne wiedzy z komendami weryfikacyjnymi

#### Wyniki oceny dokumentacji
- **docs/pre-deployment/application-insights.md**: - Kompleksowy przewodnik monitorowania
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury wieloagentowe
- **Ogólne nowe treści**: - Spójne wysokie standardy jakości

#### Implementacja techniczna
- **Application Insights**: Log Analytics + niestandardowa telemetria + śledzenie rozproszone
- **Uwierzytelnianie**: Zarządzana tożsamość + Key Vault + wzorce RBAC
- **Wieloagentowość**: Service Bus + Cosmos DB + Container Apps + orkiestracja
- **Monitorowanie**: Metryki na żywo + zapytania Kusto + alerty + pulpity
- **Zarządzanie kosztami**: Strategie próbkowania, polityki retencji, kontrola budżetu

### [v3.7.0] - 2025-11-19

#### Ulepszenia jakości dokumentacji i nowy przykład Microsoft Foundry Models
**Ta wersja poprawia jakość dokumentacji w całym repozytorium oraz dodaje kompletny przykład wdrożenia Microsoft Foundry Models z interfejsem czatu gpt-4.1.**

#### Dodano
- **🤖 Przykład czatu Microsoft Foundry Models**: Kompletny deployment gpt-4.1 z działającą implementacją w `examples/azure-openai-chat/`:
  - Kompletny infrastruktura Microsoft Foundry Models (wdrożenie modelu gpt-4.1)
  - Interfejs czatu wiersza poleceń Python z historią rozmów
  - Integracja Key Vault do bezpiecznego przechowywania kluczy API
  - Śledzenie użycia tokenów i szacowanie kosztów
  - Ograniczanie szybkości i obsługa błędów
  - Kompleksowy README z przewodnikiem wdrożenia 35-45 minut
  - 11 plików produkcyjnych (szablony Bicep, aplikacja Python, konfiguracja)
- **📚 Ćwiczenia dokumentacyjne**: Dodano ćwiczenia praktyczne do przewodnika konfiguracyjnego:
  - Ćwiczenie 1: Konfiguracja wielośrodowiskowa (15 minut)
  - Ćwiczenie 2: Praktyka zarządzania sekretami (10 minut)
  - Jasne kryteria sukcesu i kroki weryfikacyjne
- **✅ Weryfikacja wdrożenia**: Dodano sekcję weryfikacji do przewodnika wdrożenia:
  - Procedury kontroli stanu zdrowia
  - Lista kontrolna kryteriów sukcesu
  - Oczekiwane wyniki dla wszystkich komend wdrożeniowych
  - Szybkie odniesienie do rozwiązywania problemów

#### Ulepszono
- **examples/README.md**: Zaktualizowano do jakości poziomu A (93%):
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji
  - Zaktualizowano liczbę lokalnych przykładów z 3 do 4
  - Dodano do tabeli przykładów aplikacji AI
  - Zintegrowano z szybkimi startami dla użytkowników średniozaawansowanych
  - Dodano do sekcji szablonów Microsoft Foundry
  - Zaktualizowano macierz porównawczą i sekcje wyszukiwania technologii
- **Jakość dokumentacji**: Poprawiono z B+ (87%) do A- (92%) w folderze docs:
  - Dodano oczekiwane wyniki do krytycznych przykładów komend
  - Uwzględniono kroki weryfikacyjne dla zmian konfiguracji
  - Ulepszono naukę praktyczną z ćwiczeniami

#### Zmieniono
- **Postęp nauki**: Lepsza integracja przykładów AI dla użytkowników średniozaawansowanych
- **Struktura dokumentacji**: Bardziej praktyczne ćwiczenia z klarownymi efektami
- **Proces weryfikacji**: Wyraźne kryteria sukcesu dodane do kluczowych workflow

#### Ulepszono
- **Doświadczenie programisty**: Wdrożenie Microsoft Foundry Models trwa teraz 35-45 minut (vs 60-90 dla złożonych alternatyw)
- **Przejrzystość kosztów**: Jasne szacunki kosztów (50-200 USD/miesiąc) dla przykładu Microsoft Foundry Models
- **Ścieżka nauki**: Deweloperzy AI mają wyraźny punkt startu z azure-openai-chat
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacyjne

#### Zweryfikowano
- ✅ Przykład Microsoft Foundry Models w pełni funkcjonalny z `azd up`
- ✅ Wszystkie 11 plików implementacyjnych składniowo poprawne
- ✅ Instrukcje w README zgodne z rzeczywistym doświadczeniem wdrożenia
- ✅ Linki w dokumentacji zaktualizowane w ponad 8 lokalizacjach
- ✅ Indeks przykładów dokładnie odzwierciedla 4 lokalne przykłady
- ✅ Brak duplikatów zewnętrznych linków w tabelach
- ✅ Wszystkie odniesienia nawigacyjne prawidłowe

#### Implementacja techniczna
- **Architektura Microsoft Foundry Models**: wzorzec gpt-4.1 + Key Vault + Container Apps
- **Bezpieczeństwo**: Gotowość na zarządzaną tożsamość, sekrety w Key Vault
- **Monitorowanie**: Integracja Application Insights
- **Zarządzanie kosztami**: Śledzenie tokenów i optymalizacja użycia
- **Wdrożenie**: Pojedyncza komenda `azd up` dla kompletnej konfiguracji

### [v3.6.0] - 2025-11-19

#### Duża aktualizacja: Przykłady wdrożeń Container App
**Ta wersja wprowadza kompleksowe, gotowe do produkcji przykłady wdrożeń aplikacji kontenerowych przy użyciu Azure Developer CLI (AZD), z pełną dokumentacją i integracją w ścieżkę nauki.**

#### Dodano
- **🚀 Przykłady aplikacji kontenerowych**: Nowe lokalne przykłady w `examples/container-app/`:
  - [Przewodnik główny](examples/container-app/README.md): Kompletny przegląd wdrożeń konteneryzowanych, szybki start, produkcja i zaawansowane wzorce
  - [Proste API Flask](../../examples/container-app/simple-flask-api): Przyjazne dla początkujących REST API ze skalowaniem do zera, sondami stanu, monitorowaniem i rozwiązywaniem problemów
  - [Architektura mikrousług](../../examples/container-app/microservices): Gotowe produkcyjnie wdrożenie wieloservice’owe (API Gateway, Product, Order, User, Notification), asynchroniczna komunikacja, Service Bus, Cosmos DB, Azure SQL, rozproszone śledzenie, wdrożenia blue-green/canary
- **Najlepsze praktyki**: Bezpieczeństwo, monitorowanie, optymalizacja kosztów i wskazówki CI/CD dla środowisk konteneryzowanych
- **Przykłady kodu**: Kompletny `azure.yaml`, szablony Bicep i implementacje usług w wielu językach (Python, Node.js, C#, Go)
- **Testowanie i rozwiązywanie problemów**: Scenariusze testów end-to-end, komendy monitorujące, wskazówki rozwiązywania problemów

#### Zmieniono
- **README.md**: Zaktualizowano, by prezentować i linkować nowe przykłady aplikacji kontenerowych pod „Local Examples – Container Applications”
- **examples/README.md**: Zaktualizowano, aby podkreślić przykłady aplikacji kontenerowych, dodać wpisy do macierzy porównawczej i zaktualizować odniesienia technologii/architektury
- **Konspekt kursu i przewodnik**: Zaktualizowano, by odwoływać się do nowych przykładów aplikacji kontenerowych i wzorców wdrożeniowych w odpowiednich rozdziałach

#### Zweryfikowano
- ✅ Wszystkie nowe przykłady można wdrożyć przez `azd up` i stosują najlepsze praktyki
- ✅ Zaktualizowano linki w dokumentacji i nawigację
- ✅ Przykłady obejmują scenariusze od początkującego do zaawansowanego, w tym produkcyjne mikrousługi

#### Notatki
- **Zakres**: Wyłącznie dokumentacja i przykłady w języku angielskim
- **Kolejne kroki**: Rozszerzenie o dodatkowe zaawansowane wzorce kontenerowe i automatyzacja CI/CD w przyszłych wydaniach

### [v3.5.0] - 2025-11-19

#### Zmiana marki produktu: Microsoft Foundry
**Ta wersja wprowadza kompleksową zmianę nazwy produktu z "Microsoft Foundry" na "Microsoft Foundry" we wszystkich anglojęzycznych dokumentacjach, odzwierciedlając oficjalne przebrandingowanie Microsoftu.**

#### Zmieniono
- **🔄 Aktualizacja nazwy produktu**: Kompleksowy rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Zaktualizowano wszystkie odniesienia w całej angielskiej dokumentacji w folderze `docs/`
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Łącznie: 23 odwołania do treści zaktualizowane w 7 plikach dokumentacji

- **📁 Zmiany w strukturze folderów**:
  - `docs/ai-foundry/` zmieniono na `docs/microsoft-foundry/`
  - Wszystkie odwołania krzyżowe zaktualizowane, aby odzwierciedlały nową strukturę folderów
  - Linki nawigacyjne zweryfikowane we wszystkich dokumentach

- **📄 Zmiany nazw plików**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Wszystkie wewnętrzne linki zaktualizowane, aby wskazywały na nową nazwę pliku

#### Zaktualizowane pliki
- **Dokumentacja rozdziałów** (7 plików):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 odwołania do nazwy produktu zaktualizowane
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Już używa Microsoft Foundry (z poprzednich aktualizacji)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 zaktualizowane odwołania (przegląd, opinie społeczności, dokumentacja)
  - `docs/getting-started/azd-basics.md` - 4 zaktualizowane linki krzyżowe
  - `docs/getting-started/first-project.md` - 2 zaktualizowane linki nawigacyjne rozdziałów
  - `docs/getting-started/installation.md` - 2 zaktualizowane linki do kolejnych rozdziałów
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 zaktualizowane odwołania (nawigacja, społeczność Discord)
  - `docs/troubleshooting/common-issues.md` - 1 zaktualizowany link nawigacyjny
  - `docs/troubleshooting/debugging.md` - 1 zaktualizowany link nawigacyjny

- **Pliki struktury kursu** (2 pliki):
  - `README.md` - 17 zaktualizowanych odwołań (przegląd kursu, tytuły rozdziałów, sekcja szablonów, opinie społeczności)
  - `course-outline.md` - 14 zaktualizowanych odwołań (przegląd, cele nauki, zasoby rozdziałów)

#### Zweryfikowano
- ✅ Brak pozostałych odwołań do ścieżki folderu "ai-foundry" w dokumentacji angielskiej
- ✅ Brak pozostałych odwołań do nazwy produktu "Microsoft Foundry" w dokumentacji angielskiej
- ✅ Wszystkie linki nawigacyjne działają poprawnie z nową strukturą folderów
- ✅ Zmiany nazw plików i folderów zakończone pomyślnie
- ✅ Odwołania krzyżowe między rozdziałami zweryfikowane

#### Notatki
- **Zakres**: Zmiany zostały zastosowane tylko do dokumentacji w języku angielskim w folderze `docs/`
- **Tłumaczenia**: Foldery tłumaczeń (`translations/`) nie zostały zaktualizowane w tej wersji
- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie zostały zaktualizowane w tej wersji
- **Przykłady**: Pliki z przykładami mogą nadal odnosić się do starych nazw (do poprawy w przyszłej aktualizacji)
- **Linki zewnętrzne**: Zewnętrzne adresy URL i linki do repozytoriów GitHub pozostają bez zmian

#### Przewodnik migracji dla współautorów
Jeśli posiadasz lokalne gałęzie lub dokumentację odnoszącą się do starej struktury:
1. Zaktualizuj odwołania do folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Zaktualizuj odwołania do plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamień nazwę produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Zweryfikuj, czy wszystkie wewnętrzne linki w dokumentacji nadal działają poprawnie

---

### [v3.4.0] - 2025-10-24

#### Ulepszenia podglądu infrastruktury i walidacji
**Ta wersja wprowadza pełne wsparcie dla nowej funkcji podglądu Azure Developer CLI oraz usprawnia doświadczenia użytkowników warsztatów.**

#### Dodano
- **🧪 Dokumentacja funkcji azd provision --preview**: Kompleksowe omówienie nowej funkcji podglądu infrastruktury
  - Referencje poleceń i przykłady użycia w ściągawce
  - Szczegółowa integracja w przewodniku wdrożeniowym z przykładami zastosowań i korzyści
  - Integracja z kontrolą wstępną przed wdrożeniem dla bezpieczniejszej walidacji
  - Aktualizacje przewodnika "Pierwsze kroki" z uwzględnieniem bezpiecznych praktyk wdrożeniowych
- **🚧 Baner statusu warsztatów**: Profesjonalny baner HTML wskazujący stan rozwoju warsztatów
  - Projekt gradientowy z wskaźnikami w trakcie budowy dla jasnej komunikacji użytkownika
  - Znacznik ostatniej aktualizacji dla transparentności
  - Responsywny design dostosowany do wszystkich typów urządzeń

#### Ulepszono
- **Bezpieczeństwo infrastruktury**: Funkcjonalność podglądu zintegrowana w dokumentacji wdrożeń
- **Walidacja przed wdrożeniem**: Skrypty automatyczne uwzględniają teraz testy podglądu infrastruktury
- **Przepływ pracy dewelopera**: Zaktualizowane sekwencje poleceń obejmujące wykorzystanie podglądu jako najlepszej praktyki
- **Doświadczenie warsztatowe**: Jasne określenie oczekiwań dla użytkowników co do statusu rozwoju treści

#### Zmiany
- **Najlepsze praktyki wdrożeniowe**: Przepływ pracy z wykorzystaniem podglądu jako zalecane podejście
- **Przepływ dokumentacji**: Walidacja infrastruktury przeniesiona na wcześniejszy etap nauki
- **Prezentacja warsztatów**: Profesjonalna komunikacja statusu z wyraźnym harmonogramem rozwoju

#### Ulepszenia
- **Podejście Safety-First**: Teraz można zweryfikować zmiany infrastrukturalne przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu można udostępnić do przeglądu i zatwierdzenia
- **Świadomość kosztów**: Lepsze zrozumienie kosztów zasobów przed uruchomieniem provisioning
- **Minimalizacja ryzyka**: Zmniejszone ryzyko błędów wdrożeniowych dzięki wcześniejszej walidacji

#### Realizacja techniczna
- **Integracja wieloplikowa**: Dokumentacja funkcji podglądu w 4 kluczowych plikach
- **Wzorce poleceń**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd włączony w procesy walidacji i skrypty
- **Wskaźniki wizualne**: Wyraźne oznaczenia NOWEJ funkcji dla łatwej identyfikacji

#### Infrastruktura warsztatowa
- **Komunikacja statusu**: Profesjonalny baner HTML z gradientowym stylem
- **Doświadczenie użytkownika**: Jasny status rozwoju zapobiega nieporozumieniom
- **Prezentacja profesjonalna**: Utrzymuje wiarygodność repozytorium i zarazem ustawia oczekiwania
- **Transparentność harmonogramu**: Znacznik daty ostatniej aktualizacji październik 2025 dla odpowiedzialności

### [v3.3.0] - 2025-09-24

#### Ulepszone materiały warsztatowe i interaktywne doświadczenie nauki
**Ta wersja wprowadza kompleksowe materiały warsztatowe z przewodnikami interaktywnymi w przeglądarce oraz ustrukturyzowane ścieżki nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatowy**: Warsztaty przeglądarkowe z możliwością podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatowe**: 7-etapowa ścieżka nauki od odkrycia do dostosowania
  - 0-Introduction: Przegląd warsztatów i konfiguracja
  - 1-Select-AI-Template: Odkrywanie i wybór szablonów
  - 2-Validate-AI-Template: Procedury wdrożenia i walidacji
  - 3-Deconstruct-AI-Template: Zrozumienie architektury szablonu
  - 4-Configure-AI-Template: Konfiguracja i dostosowanie
  - 5-Customize-AI-Template: Zaawansowane modyfikacje i iteracje
  - 6-Teardown-Infrastructure: Sprzątanie i zarządzanie zasobami
  - 7-Wrap-up: Podsumowanie i kolejne kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia nauki
- **🎯 Praktyczna ścieżka nauki**: Metodologia 3-etapowa (Odkrycie → Wdrożenie → Dostosowanie)
- **📱 Integracja GitHub Codespaces**: Bezproblemowa konfiguracja środowiska deweloperskiego

#### Ulepszono
- **Laboratorium AI Workshop**: Rozszerzone o kompleksowe 2-3 godzinne ustrukturyzowane doświadczenie nauki
- **Dokumentacja warsztatów**: Profesjonalna prezentacja z nawigacją i elementami wizualnymi
- **Postępy nauki**: Jasne wskazówki krok po kroku od wyboru szablonu do wdrożenia produkcyjnego
- **Doświadczenie dewelopera**: Zintegrowane narzędzia dla usprawnionych przepływów pracy deweloperskiej

#### Ulepszono
- **Dostępność**: Interfejs przeglądarkowy z wyszukiwarką, funkcją kopiowania oraz przełącznikiem motywów
- **Nauka we własnym tempie**: Elastyczna struktura warsztatów dostosowana do różnych szybkości nauki
- **Zastosowania praktyczne**: Scenariusze wdrożenia AI w rzeczywistych warunkach
- **Integracja społeczności**: Włączono Discord do wsparcia i współpracy warsztatowej

#### Funkcje warsztatowe
- **Wbudowane wyszukiwanie**: Szybkie przeszukiwanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcja kopiowania przy najechaniu na wszystkie przykłady kodu
- **Przełącznik motywów**: Obsługa trybu ciemnego/jasnego dla preferencji użytkownika
- **Zasoby wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia
- **Integracja pomocy**: Bezpośredni dostęp do Discorda dla wsparcia społecznościowego

### [v3.2.0] - 2025-09-17

#### Szeroka restrukturyzacja nawigacji i system nauki oparty na rozdziałach
**Ta wersja wprowadza kompleksową strukturę nauki opartą na rozdziałach oraz ulepszoną nawigację w całym repozytorium.**

#### Dodano
- **📚 System nauki oparty na rozdziałach**: Przekształcenie całego kursu w 8 progresywnych rozdziałów
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 min)
  - Rozdział 2: Rozwój AI-First (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 min)
  - Rozdział 4: Infrastruktura jako kod oraz wdrożenie (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Wieloagentowe rozwiązania AI (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja i planowanie przed wdrożeniem (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacyjne we wszystkich dokumentach
- **🎯 Monitorowanie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Wskazówki ścieżki nauki**: Jasne punkty startowe dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja za pomocą odwołań krzyżowych**: Powiązane rozdziały i wymagania wyraźnie połączone

#### Ulepszono
- **Struktura README**: Przekształcona w platformę nauki z organizacją opartą na rozdziałach
- **Nawigacja dokumentacji**: Każda strona zawiera teraz kontekst rozdziału i wskazówki dotyczące postępów
- **Organizacja szablonów**: Przykłady i szablony przypisane do właściwych rozdziałów nauki
- **Integracja zasobów**: Ściągawki, FAQ i przewodniki powiązane z odpowiednimi rozdziałami
- **Integracja warsztatów**: Laboratoria praktyczne powiązane z wieloma celami naukowymi rozdziałów

#### Zmiany
- **Postęp nauki**: Zmiana z liniowej dokumentacji na elastyczną naukę opartą na rozdziałach
- **Pozycjonowanie konfiguracji**: Przewodnik po konfiguracji przesunięty jako Rozdział 3 dla lepszego przepływu nauki
- **Integracja treści AI**: Lepsze włączenie treści specyficznych dla AI w trakcie kursu
- **Treści produkcyjne**: Zaawansowane wzorce zebrane w Rozdziale 8 dla użytkowników korporacyjnych

#### Ulepszenia
- **Doświadczenie użytkownika**: Jasne okruszki nawigacyjne i wskaźniki postępu rozdziałów
- **Dostępność**: Spójne wzorce nawigacji dla łatwiejszej nawigacji po kursie
- **Prezentacja profesjonalna**: Struktura kursu w stylu uniwersyteckim odpowiednia do szkoleń akademickich i korporacyjnych
- **Efektywność nauki**: Skrócony czas znajdowania istotnych treści dzięki lepszej organizacji

#### Realizacja techniczna
- **Nagłówki nawigacji**: Ustandaryzowana nawigacja rozdziałowa w ponad 40 plikach dokumentacji
- **Stopka nawigacji**: Spójne wskazówki dotyczące postępu i ukończenia rozdziałów
- **Linkowanie wewnętrzne**: Kompleksowy system linków łączący powiązane pojęcia
- **Mapowanie rozdziałów**: Szablony i przykłady wyraźnie powiązane z celami nauki

#### Ulepszenie przewodnika nauki
- **📚 Kompleksowe cele nauki**: Przebudowany przewodnik nauki zgodny z systemem 8 rozdziałów
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera określone cele nauki i ćwiczenia praktyczne
- **📋 Monitorowanie postępów**: Cotygodniowy plan nauki z mierzalnymi wynikami i listami kontrolnymi ukończenia
- **❓ Pytania kontrolne**: Pytania walidujące wiedzę dla każdego rozdziału z profesjonalną oceną
- **🛠️ Ćwiczenia praktyczne**: Zajęcia praktyczne ze scenariuszami wdrożeniowymi i rozwiązywaniem problemów
- **📊 Postęp umiejętności**: Jasna ścieżka rozwoju od podstawowych koncepcji po wzorce korporacyjne z naciskiem na rozwój kariery
- **🎓 Ramy certyfikacji**: Cele rozwoju zawodowego i system uznania społecznościowego
- **⏱️ Zarządzanie harmonogramem**: Ustrukturyzowany 10-tygodniowy plan nauki z weryfikacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone wieloagentowe rozwiązania AI
**Ta wersja ulepsza wieloagentowe rozwiązanie dla handlu detalicznego poprzez lepsze nazewnictwo agentów oraz ulepszoną dokumentację.**

#### Zmiany
- **Terminologia wieloagentowa**: Zmieniono nazwę "agent Cora" na "agent klienta" w całym rozwiązaniu wieloagentowym dla handlu detalicznego, dla lepszego zrozumienia
- **Architektura agentów**: Zaktualizowano całą dokumentację, szablony ARM i przykłady kodu, aby stosować spójne nazewnictwo "agent klienta"
- **Przykłady konfiguracji**: Zmodernizowano wzorce konfiguracji agentów z uaktualnionymi konwencjami nazewnictwa
- **Spójność dokumentacji**: Zapewniono, że wszystkie odwołania używają profesjonalnych, opisowych nazw agentów

#### Ulepszono
- **Pakiet szablonów ARM**: Zaktualizowano retail-multiagent-arm-template z odniesieniami do agenta klienta
- **Diagramy architektury**: Odświeżono diagramy Mermaid z nowym nazewnictwem agentów
- **Przykłady kodu**: Klasy Python i przykłady implementacji używają teraz nazwy CustomerAgent
- **Zmienne środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe do stosowania konwencji CUSTOMER_AGENT_NAME

#### Ulepszono
- **Doświadczenie dewelopera**: Wyraźniejsze role i odpowiedzialności agentów w dokumentacji
- **Gotowość produkcyjna**: Lepsze dopasowanie do korporacyjnych konwencji nazewnictwa
- **Materiały edukacyjne**: Bardziej intuicyjne nazewnictwo agentów do celów szkoleniowych
- **Użyteczność szablonów**: Uproszczone zrozumienie funkcji agentów i wzorców wdrożenia

#### Detale techniczne
- Zaktualizowane diagramy architektury Mermaid z odniesieniami do CustomerAgent
- Zamieniono nazwy klas CoraAgent na CustomerAgent w przykładach Python
- Zmodyfikowano konfiguracje JSON szablonów ARM do typu agenta "customer"
- Zaktualizowano zmienne środowiskowe z CORA_AGENT_* na CUSTOMER_AGENT_*
- Odświeżono wszystkie polecenia wdrożeniowe i konfiguracje kontenerowe

### [v3.0.0] - 2025-09-12

#### Duże zmiany – Skupienie na deweloperach AI i integracja Microsoft Foundry
**Ta wersja przekształca repozytorium w kompleksowe źródło nauki skoncentrowane na AI z integracją Microsoft Foundry.**

#### Dodano
- **🤖 Ścieżka nauki AI-First**: Kompleksowa restrukturyzacja z priorytetem dla deweloperów i inżynierów AI
- **Przewodnik integracji Microsoft Foundry**: Szczegółowa dokumentacja łączenia AZD z usługami Microsoft Foundry
- **Wzorce wdrażania modeli AI**: Szczegółowy przewodnik obejmujący wybór modeli, konfigurację i strategie wdrożenia produkcyjnego
- **Laboratorium warsztatów AI**: 2-3 godziny praktycznych warsztatów dotyczących konwersji aplikacji AI na rozwiązania gotowe do wdrożenia przez AZD  
- **Najlepsze praktyki produkcyjnego AI**: Wzorce gotowe dla przedsiębiorstw do skalowania, monitorowania i zabezpieczania zadań AI  
- **Przewodnik rozwiązywania problemów specyficznych dla AI**: Kompleksowe rozwiązywanie problemów z Microsoft Foundry Models, Cognitive Services i problemami wdrożeniowymi AI  
- **Galeria szablonów AI**: Wyselekcjonowana kolekcja szablonów Microsoft Foundry z ocenami złożoności  
- **Materiały warsztatowe**: Pełna struktura warsztatów z ćwiczeniami praktycznymi i materiałami referencyjnymi  

#### Ulepszone  
- **Struktura README**: Skoncentrowana na deweloperach AI z 45% danych dotyczących zainteresowania społeczności z Discord Microsoft Foundry  
- **Ścieżki nauki**: Dedykowana ścieżka dewelopera AI obok tradycyjnych ścieżek dla studentów i inżynierów DevOps  
- **Rekomendacje szablonów**: Wybrane szablony AI, w tym azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart  
- **Integracja społeczności**: Rozszerzone wsparcie społeczności Discord z kanałami i dyskusjami specyficznymi dla AI  

#### Fokus na bezpieczeństwo i produkcję  
- **Wzorce zarządzania tożsamością**: Uwierzytelnianie i konfiguracje zabezpieczeń specyficzne dla AI  
- **Optymalizacja kosztów**: Śledzenie wykorzystania tokenów i kontrola budżetu dla zadań AI  
- **Wielo-regionowe wdrożenie**: Strategie globalnego wdrażania aplikacji AI  
- **Monitorowanie wydajności**: Metryki specyficzne dla AI i integracja z Application Insights  

#### Jakość dokumentacji  
- **Liniowa struktura kursu**: Logiczne przejście od wzorców wdrożeń AI dla początkujących do zaawansowanych  
- **Zweryfikowane adresy URL**: Wszystkie zewnętrzne linki do repozytoriów zweryfikowane i dostępne  
- **Kompletny odnośnik**: Wszystkie wewnętrzne linki dokumentacyjne zweryfikowane i działające  
- **Gotowe do produkcji**: Wzorce wdrożeń korporacyjnych z przykładami z życia  

### [v2.0.0] - 2025-09-09  

#### Duże zmiany – restrukturyzacja repozytorium i profesjonalne ulepszenia  
**Ta wersja stanowi znaczną przebudowę struktury repozytorium i sposobu prezentacji treści.**  

#### Dodano  
- **Struktura nauki w dokumentacji**: Wszystkie strony dokumentacji zawierają teraz sekcje Wprowadzenie, Cele nauki oraz Oczekiwane wyniki nauki  
- **System nawigacji**: Dodano odnośniki Poprzednia/Następna lekcja w całej dokumentacji, aby ułatwić nawigację i postęp w nauce  
- **Przewodnik nauki**: Kompleksowy plik study-guide.md z celami nauki, ćwiczeniami praktycznymi i materiałami do oceny  
- **Profesjonalna prezentacja**: Usunięto wszystkie emotikony dla lepszej dostępności i profesjonalnego wyglądu  
- **Ulepszona struktura treści**: Lepsza organizacja i płynność materiałów edukacyjnych  

#### Zmieniono  
- **Format dokumentacji**: Ustandaryzowano wszystkie dokumenty z jednolitą, nastawioną na naukę strukturą  
- **Przepływ nawigacji**: Wprowadzono logiczny porządek przechodzenia przez materiały edukacyjne  
- **Prezentacja treści**: Usunięto elementy ozdobne na rzecz klarownego, profesjonalnego formatowania  
- **Struktura linków**: Zaktualizowano wszystkie linki wewnętrzne, aby wspierać nowy system nawigacji  

#### Ulepszono  
- **Dostępność**: Usunięto zależności od emotikon dla lepszej kompatybilności z czytnikami ekranowymi  
- **Profesjonalny wygląd**: Czysta, akademicka prezentacja, odpowiednia dla nauki korporacyjnej  
- **Doświadczenie w nauce**: Strukturalne podejście z jasnymi celami i efektami dla każdej lekcji  
- **Organizacja treści**: Lepszy logiczny przepływ i powiązania między tematami  

### [v1.0.0] - 2025-09-09  

#### Wydanie początkowe – Kompleksowe repozytorium nauki AZD  

#### Dodano  
- **Podstawowa struktura dokumentacji**  
  - Pełny cykl przewodników dla początkujących  
  - Kompleksowa dokumentacja wdrożeń i provisioningów  
  - Szczegółowe zasoby i przewodniki rozwiązywania problemów  
  - Narzędzia i procedury walidacji przed wdrożeniem  

- **Moduł rozpoczęcia pracy**  
  - Podstawy AZD: Kluczowe pojęcia i terminologia  
  - Przewodnik instalacji: Instrukcje instalacji na różnych platformach  
  - Przewodnik konfiguracji: Ustawienia środowiska i uwierzytelnianie  
  - Pierwszy projekt: Praktyczne tutoriale krok po kroku  

- **Moduł wdrożeń i provisioningu**  
  - Przewodnik wdrożenia: Kompletny opis procesu  
  - Przewodnik provisioningowy: Infrastrukturę jako kod z Bicep  
  - Najlepsze praktyki dla środowisk produkcyjnych  
  - Wzorce architektury wieloservice’owej  

- **Moduł walidacji przed wdrożeniem**  
  - Planowanie pojemności: Walidacja dostępności zasobów Azure  
  - Wybór SKU: Kompleksowe wskazówki dotyczące poziomów usług  
  - Kontrole przedstartowe: Automatyczne skrypty walidacyjne (PowerShell i Bash)  
  - Szacunki kosztów i narzędzia planowania budżetu  

- **Moduł rozwiązywania problemów**  
  - Najczęściej spotykane problemy: Typowe błędy i rozwiązania  
  - Przewodnik debugowania: Systematyczne metody rozwiązywania problemów  
  - Zaawansowane techniki diagnostyczne i narzędzia  
  - Monitorowanie i optymalizacja wydajności  

- **Zasoby i odniesienia**  
  - Szybka ściągawka poleceń  
  - Słownik terminów i akronimów  
  - FAQ: Szczegółowe odpowiedzi na często zadawane pytania  
  - Linki zewnętrzne i społecznościowe powiązania  

- **Przykłady i szablony**  
  - Przykład prostej aplikacji webowej  
  - Szablon wdrożenia statycznej strony internetowej  
  - Konfiguracja aplikacji kontenerowej  
  - Wzorce integracji baz danych  
  - Przykłady architektury mikroserwisów  
  - Implementacje funkcji serverless  

#### Funkcje  
- **Wsparcie multiplatformowe**: Przewodniki instalacji i konfiguracji dla Windows, macOS i Linux  
- **Poziomy zaawansowania**: Treści zaprojektowane dla studentów oraz profesjonalnych deweloperów  
- **Fokus praktyczny**: Praktyczne przykłady i scenariusze z życia  
- **Kompleksowe pokrycie**: Od podstawowych pojęć po zaawansowane wzorce korporacyjne  
- **Podejście oparte na bezpieczeństwie**: Najlepsze praktyki bezpieczeństwa w całej dokumentacji  
- **Optymalizacja kosztów**: Wskazówki dotyczące efektywnych kosztowo wdrożeń i zarządzania zasobami  

#### Jakość dokumentacji  
- **Szczegółowe przykłady kodu**: Praktyczne, przetestowane fragmenty kodu  
- **Instrukcje krok po kroku**: Jasne i wykonalne wskazówki  
- **Kompleksowa obsługa błędów**: Rozwiązywanie typowych problemów  
- **Integracja najlepszych praktyk**: Standardy branżowe i rekomendacje  
- **Kompatybilność wersji**: Aktualne z najnowszymi usługami Azure i funkcjami azd  

## Planowane przyszłe ulepszenia  

### Wersja 3.1.0 (Planowana)  
#### Rozszerzenie platformy AI  
- **Wsparcie wielomodelowe**: Wzorce integracji dla Hugging Face, Azure Machine Learning i modeli własnych  
- **Frameworki agentów AI**: Szablony dla LangChain, Semantic Kernel i wdrożeń AutoGen  
- **Zaawansowane wzorce RAG**: Opcje baz danych wektorowych poza Azure AI Search (Pinecone, Weaviate itd.)  
- **Obserwowalność AI**: Ulepszone monitorowanie wydajności modeli, wykorzystania tokenów i jakości odpowiedzi  

#### Doświadczenie deweloperskie  
- **Rozszerzenie VS Code**: Zintegrowane środowisko rozwoju AZD + Microsoft Foundry  
- **Integracja GitHub Copilot**: Wspomagane przez AI generowanie szablonów AZD  
- **Interaktywne tutoriale**: Ćwiczenia kodowania z automatyczną walidacją scenariuszy AI  
- **Zawartość wideo**: Uzupełniające tutoriale wideo dla wzrokowców skoncentrowane na wdrożeniach AI  

### Wersja 4.0.0 (Planowana)  
#### Wzorce AI dla przedsiębiorstw  
- **Ramowy model zarządzania**: Zarządzanie modelami AI, zgodność i rejestry audytu  
- **AI wielonajemcze**: Wzorce obsługi wielu klientów z izolowanymi usługami AI  
- **Wdrożenie Edge AI**: Integracja z Azure IoT Edge i instancjami kontenerów  
- **AI w chmurze hybrydowej**: Wzorce wielochmurowe i hybrydowe dla zadań AI  

#### Funkcje zaawansowane  
- **Automatyzacja pipeline’ów AI**: Integracja MLOps z pipeline’ami Azure Machine Learning  
- **Zaawansowane bezpieczeństwo**: Wzorce zero trust, prywatne punkty końcowe i zaawansowana ochrona przed zagrożeniami  
- **Optymalizacja wydajności**: Zaawansowane strojenie i skalowanie dla aplikacji AI o dużej przepustowości  
- **Globalna dystrybucja**: Wzorce dostarczania zawartości i cache’owania na krawędzi dla aplikacji AI  

### Wersja 3.0.0 (Planowana) – Zastąpiona przez obecne wydanie  
#### Proponowane dodatki – teraz zaimplementowane w v3.0.0  
- ✅ **Treści skoncentrowane na AI**: Kompleksowa integracja Microsoft Foundry (Zakończone)  
- ✅ **Interaktywne tutoriale**: Praktyczne laboratorium warsztatowe AI (Zakończone)  
- ✅ **Zaawansowany moduł bezpieczeństwa**: Wzorce zabezpieczeń specyficznych dla AI (Zakończone)  
- ✅ **Optymalizacja wydajności**: Strategie strojenia zadań AI (Zakończone)  

### Wersja 2.1.0 (Planowana) – Częściowo wdrożona w v3.0.0  
#### Drobne ulepszenia – niektóre zrealizowane w obecnym wydaniu  
- ✅ **Dodatkowe przykłady**: Scenariusze wdrożeń AI (Zakończone)  
- ✅ **Rozszerzone FAQ**: Pytania specyficzne dla AI i rozwiązywanie problemów (Zakończone)  
- **Integracja narzędzi**: Ulepszone przewodniki integracji IDE i edytorów  
- ✅ **Rozszerzenie monitoringu**: Wzorce monitoringu i alertów specyficzne dla AI (Zakończone)  

#### Nadal planowane na przyszłe wydania  
- **Dokumentacja mobilna**: Responsywny design dla nauki mobilnej  
- **Dostęp w trybie offline**: Pakiety dokumentacji do pobrania  
- **Zaawansowana integracja IDE**: Rozszerzenie VS Code dla AZD + AI workflow  
- **Panel społecznościowy**: Metryki w czasie rzeczywistym i śledzenie wkładu społeczności  

## Wkład w changelog  

### Raportowanie zmian  
Przy kontrybucji w tym repozytorium upewnij się, że wpisy w changelogu zawierają:  

1. **Numer wersji**: Zgodny z semantycznym wersjonowaniem (major.minor.patch)  
2. **Datę**: Data wydania lub aktualizacji w formacie RRRR-MM-DD  
3. **Kategorię**: Dodano, Zmieniono, Przestarzałe, Usunięte, Naprawione, Bezpieczeństwo  
4. **Jasny opis**: Krótki opis zmiany  
5. **Ocena wpływu**: Jak zmiany wpływają na obecnych użytkowników  

### Kategorie zmian  

#### Dodano  
- Nowe funkcje, sekcje dokumentacji lub możliwości  
- Nowe przykłady, szablony lub zasoby edukacyjne  
- Dodatkowe narzędzia, skrypty lub narzędzia użytkowe  

#### Zmieniono  
- Modyfikacje funkcjonalności lub dokumentacji  
- Aktualizacje w celu poprawy jasności i dokładności  
- Restrukturyzacja treści lub organizacji  

#### Przestarzałe  
- Funkcje lub metody wycofywane z użycia  
- Sekcje dokumentacji przewidziane do usunięcia  
- Metody z lepszymi alternatywami  

#### Usunięte  
- Funkcje, dokumentacja lub przykłady już nieaktualne  
- Przestarzałe informacje lub zniesione podejścia  
- Zduplikowana lub skonsolidowana treść  

#### Naprawione  
- Poprawki błędów w dokumentacji lub kodzie  
- Rozwiązania zgłoszonych problemów  
- Ulepszenia dokładności i funkcjonalności  

#### Bezpieczeństwo  
- Ulepszenia lub poprawki bezpieczeństwa  
- Aktualizacje dotyczące najlepszych praktyk bezpieczeństwa  
- Rozwiązanie luk bezpieczeństwa  

### Wytyczne semantycznego wersjonowania  

#### Wersja główna (X.0.0)  
- Zmiany łamiące kompatybilność wymagające działania użytkownika  
- Znaczna restrukturyzacja treści lub organizacji  
- Zmiany fundamentalnego podejścia lub metodyki  

#### Wersja mniejsza (X.Y.0)  
- Nowe funkcjonalności lub zawartość  
- Ulepszenia kompatybilne wstecz  
- Dodatkowe przykłady, narzędzia lub zasoby  

#### Wersja poprawkowa (X.Y.Z)  
- Poprawki błędów i korekty  
- Drobne ulepszenia istniejących treści  
- Doprecyzowania i niewielkie usprawnienia  

## Opinie i sugestie społeczności  

Aktywnie zachęcamy do opinii społeczności, by udoskonalić to źródło nauki:  

### Jak przekazać opinie  
- **GitHub Issues**: Zgłaszaj problemy lub proponuj usprawnienia (zapraszamy zgłoszenia specyficzne dla AI)  
- **Dyskusje na Discord**: Dziel się pomysłami i uczestnicz w społeczności Microsoft Foundry  
- **Pull Requests**: Wnoś bezpośrednie ulepszenia treści, szczególnie szablonów i przewodników AI  
- **Discord Microsoft Foundry**: Udzielaj się na kanale #Azure dla dyskusji o AZD + AI  
- **Forum społecznościowe**: Bierz udział w szerszych dyskusjach deweloperów Azure  

### Kategorie opinii  
- **Dokładność treści AI**: Korekty integracji usług AI i informacji o wdrożeniach  
- **Doświadczenie edukacyjne**: Sugestie dla lepszego przepływu nauki deweloperów AI  
- **Brakujące treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI  
- **Dostępność**: Usprawnienia dla różnych potrzeb edukacyjnych  
- **Integracja narzędzi AI**: Sugestie usprawnień przebiegu pracy z narzędziami AI  
- **Wzorce produkcyjnego AI**: Prośby o wzorce wdrożeń AI dla przedsiębiorstw  

### Zobowiązanie do odpowiedzi  
- **Odpowiedzi na zgłoszenia**: W ciągu 48 godzin od zgłoszenia problemu  
- **Prośby o funkcje**: Ocena w ciągu tygodnia  
- **Wkłady społeczności**: Przegląd w ciągu tygodnia  
- **Problemy bezpieczeństwa**: Priorytet i szybka reakcja  

## Harmonogram utrzymania  

### Regularne aktualizacje  
- **Miesięczne przeglądy**: Dokładność treści i weryfikacja linków  
- **Kwartalne aktualizacje**: Główne uzupełnienia i usprawnienia  
- **Półroczne przeglądy**: Kompleksowe restrukturyzacje i ulepszenia  
- **Roczne wydania**: Główne wersje z istotnymi usprawnieniami  

### Monitorowanie i zapewnienie jakości  
- **Automatyczne testy**: Regularna walidacja przykładów kodu i linków  
- **Integracja opinii społeczności**: Regularne wdrażanie sugestii użytkowników  
- **Aktualizacje technologiczne**: Dopasowanie do najnowszych usług Azure i wersji azd  
- **Audyt dostępności**: Regularne przeglądy pod kątem zasad inkluzywnego projektowania  

## Polityka wsparcia wersji  

### Wsparcie bieżącej wersji  
- **Najnowsza wersja główna**: Pełne wsparcie z regularnymi aktualizacjami  
- **Poprzednia wersja główna**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy  
- **Wersje archiwalne**: Tylko wsparcie społeczności, brak oficjalnych aktualizacji  

### Wskazówki migracyjne  
Po wydaniu wersji głównych zapewniamy:  
- **Przewodniki migracji**: Instrukcje krok po kroku przejścia między wersjami  
- **Notatki kompatybilności**: Szczegóły zmian łamiących kompatybilność  
- **Wsparcie narzędziowe**: Skrypty i narzędzia pomagające w migracji  
- **Wsparcie społeczności**: Dedykowane fora do pytań migracyjnych  

---

**Nawigacja**  
- **Poprzednia lekcja**: [Study Guide](resources/study-guide.md)  
- **Następna lekcja**: Powrót do [Main README](README.md)  

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wydaniach i ważnych aktualizacjach materiałów edukacyjnych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->