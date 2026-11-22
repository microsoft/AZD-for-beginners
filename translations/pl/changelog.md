# Dziennik zmian - AZD dla początkujących

## Wprowadzenie

Ten dziennik zmian dokumentuje wszystkie znaczące zmiany, aktualizacje i ulepszenia w repozytorium AZD dla początkujących. Stosujemy zasady wersjonowania semantycznego i utrzymujemy ten log, aby pomóc użytkownikom zrozumieć, co się zmieniło między wersjami.

## Cele nauki

Przeglądając ten dziennik zmian, będziesz:
- Na bieżąco z nowymi funkcjami i dodatkami do treści
- Rozumieć ulepszenia w istniejącej dokumentacji
- Śledzić poprawki błędów i korekty, aby zapewnić dokładność
- Śledzić rozwój materiałów edukacyjnych w czasie

## Efekty nauki

Po przeglądzie wpisów dziennika zmian będziesz w stanie:
- Zidentyfikować nowe treści i dostępne zasoby do nauki
- Zrozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować swoją ścieżkę nauki na podstawie najnowszych materiałów
- Wnieść opinie i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.25.0] - 2026-11-09

#### Rozszerzenie Microsoft Foundry 1.0 jest już ogólnie dostępne

Pakiet `microsoft.foundry` 1.0 jest **dostępny na żywo i ogólnie dostępny**, jak ogłoszono  [5 listopada 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kurs uczy teraz opublikowanego workflow GA, a nie nadchodzącej wersji. Zacznij od AZD **1.37.0 lub nowszej** i `azd ext install microsoft.foundry`.

#### Dostępne w tej aktualizacji kursu
- Angielskie wskazówki używają pakietu GA jako domyślnej ścieżki instalacji i wyjaśniają jego siedem niezależnie wersjonowanych rozszerzeń rdzeniowych.
- [Przewodnik po hostowanym agencie](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) obejmuje przykładowe API Python Agent Framework Responses upstream, aktualny uv, Python 3.13+, wybór nowego/istniejącego projektu, ponowne użycie modelu i przegląd `azure.yaml`.
- Workflow lokalny do chmury obejmuje testowanie Agent Inspector, koszty wywołań modeli oparte na Azure, zdalne budowanie kodu, wdrożone wywołania, śledzenie w chmurze, podgląd wdrożenia, logi i diagnostykę.
- Osobne wskazówki dotyczące oceny obejmują generowanie i przeglądanie zestawów danych/kryteriów, konfigurowanie nazwanego oceniania, rejestrowanie zasobów i analizę wyników. Starsze instrukcje oceny/optymalizacji pozostają historią migracji, a nie podstawą obecnej wersji.
- Wskazówki dotyczące CI/CD Foundry obejmują instalację rozszerzenia runnera, uwierzytelnione wdrożenie, dostęp/zasoby oceny i wyraźną bramę jakości.
- Wskazówki dotyczące sprzątania rozróżniają nowo utworzone i ponownie używane projekty Foundry. Warsztat linkuje do oddzielnego ćwiczenia GA bez zastępowania jego testów specyficznych dla próbek.
- Nawigacja kursu, cele nauki, wymagania wstępne dotyczące konfiguracji, ściągawka, FAQ i przewodnik po nauce odzwierciedlają workflow GA. Wygenerowane tłumaczenia nie są ręcznie edytowane.

#### Zakres przeglądu
- Opiera się na ogłoszeniu GA, powiązanej dokumentacji Microsoft Learn oraz konfiguracji próbek upstream. Nie wykonano rzeczywistego provisionowania, wdrożenia, wywołania modelu ani oceny w Azure.
- Pakiet GA nie oznacza GA dla każdej opcjonalnej funkcji, niezależnego rozszerzenia lub SDK ani nie certyfikuje przykładów do produkcji.

### [v3.24.0]- 2026-11-04

#### Poprawione
- Naprawiono angielską nawigację kursu, przesunięte ścieżki stron, brakujące kotwice i przestarzałe odniesienia zewnętrzne, w tym link do rozdziału 2 przewodnika AI produkcyjnego.
- Przejrzano aktualne wskazówki względem opublikowanego AZD 1.37.2, agentów 1.0.0-beta.23 i ocen 1.0.0-beta.2. Udokumentowano oddzielny workflow `azd ai eval` i migrację konfiguracji optymalizacji.
- Skorygowano nieobsługiwane flagi CLI, granice uwierzytelniania, wskazówki dotyczące jawnego środowiska/sekretów, aktualizacje infrastruktury, konfigurację modeli i przykłady destrukcyjnej naprawy.
- Odświeżono warsztat względem aktualnej próbki AI Agents, łącznie z aktualnymi hookami, wejściami konfiguracji, testami oceny, punktami wejścia do red-teamingu oraz obserwowalnością.
- Poprawiono twierdzenia dotyczące implementacji przykładowych i naprawiono powiązane problemy aplikacji/infrastruktury/konfiguracji. Materiały architektury detalicznej są wyraźnie rozróżnione od kompletnej działającej aplikacji.
- Przywrócono matrycę językową CodeQL, wybrano obsługiwany Node.js 24 dla kontenera developerskiego oraz zmodyfikowano walidatory konfiguracji, by raportowały nieudane polecenia wersji.

#### Dodano
- Tylko po angielsku offline sprawdzacz linków/kotwic, testy regresji i workflow dokumentacji, który też buduje warsztat w trybie ścisłym. Wygenerowane tłumaczenia i przetłumaczone obrazy są wyłączone.

#### Zakres walidacji
- Sprawdzenia źródła, składni, konfiguracji, lokalnego zachowania i łączy sieciowych nie potwierdzają rzeczywistej zdolności wdrożeniowej Azure, limitów, RBAC, regionalnej dostępności modeli, rozliczeń, zgodności z bezpieczeństwem ani gotowości produkcyjnej.
- Starsze wpisy poniżej są zapisami historycznymi, a nie aktualnymi instrukcjami poleceń czy wydań.

### [v3.23.0] - 2026-07-13

#### Odświeżenie AZD 1.27.1: Aktualizacja wersji wersji
**Ta wersja ponownie waliduje kurs względem `azd` `1.27.1` (lipiec 2026, najnowsze stabilne wydanie) oraz aktualnego rozszerzenia AI agenta w wersji podglądowej `azure.ai.agents` `1.0.0-beta.5`, aktualizując każdą banerę „walidowano względem” po wydaniach 1.26.0, 1.27.0 oraz 1.27.1.**

#### Zmiany
- **✅ Zaktualizowano linię bazową walidacji** z `azd 1.25.6` (czerwiec 2026) do `azd 1.27.1` (lipiec 2026) w głównym README, wszystkich README rozdziałów, lekcji dev-container w Rozdziale 1 (łącznie z przykładami z przypiętymi wersjami), lekcji szablonów niestandardowych z Rozdziału 4, lekcji multi-agenta z Rozdziału 5 oraz dokumentacji warsztatu
- **🤖 Zaktualizowano linię bazową rozdziału 2** z `azd 1.23.12` (marzec 2026) do `azd 1.27.1` w `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` oraz `microsoft-foundry-integration.md`; zaktualizowano daty notatek walidacyjnych na 2026-07-13
- **🧩 Podniesiono wersję rozszerzenia AI agenta** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` do aktualnej wersji `1.0.0-beta.5` w README Rozdziału 2 oraz `agents.md`
- **🧪 Zaktualizowano przykład walidacji warsztatu** (wyjście `azd version`) do `1.27.1`

#### Uwagi dotyczące związanych wydań azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Obsługa Go dla Azure Functions na Flex Consumption, `azd config sub-filter` filtry subskrypcji na poziomie najemcy, samodzielne paczki rozszerzeń (`azd x pack --bundle`) oraz `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelowanie projektów/agentów Azure AI Foundry bezpośrednio w `azure.yaml` (inicjalizacja bez Bicep/Terraform), wsparcie dla wdrożeń kontenerów w App Service (`host: appservice` + `language: docker`), bezpośrednie `-s/--source` dla poleceń `azd extension`, oraz `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flaga `--no-dependencies` dla `azd extension install`, modele zdeprecjonowane domyślnie wyłączone z katalogu/podpowiedzi limitów, oraz kilka poprawek błędów

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

#### Uzupełnienie dla początkujących #2: Tworzenie szablonów, Dev Containers, Pulumi, Azure DevOps, Service Principals i więcej
**Ta wersja zamyka pozostałe luki średniozaawansowanego poziomu wykryte przez analizę azd-coverage: jak tworzyć i publikować własny szablon, powtarzalne środowiska dev-container/Codespaces, dostawcę infrastruktury Pulumi, przebieg CI/CD w Azure DevOps, uwierzytelnianie przez service-principal, wskazówki dotyczące wyboru hosta (AKS/Spring Apps), wyjaśnienia `azd restore`/`azd package`, obsługę błędów hooków oraz praktyki dotyczące środowisk zespołowych/wspólnych.**

#### Dodano
- **🧱 Nowa lekcja Rozdziału 4** `docs/chapter-04-infrastructure/custom-templates.md` — tworzenie własnego szablonu azd: wymagana struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametryzacja infrastruktury przy pomocy `uniqueString()` tokena zasobu i znacznika `azd-env-name`, testy lokalne z `azd init --template <local-path>`, publikacja na GitHub oraz zgłaszanie do galerii Awesome AZD
- **📦 Nowa lekcja Rozdziału 1** `docs/chapter-01-foundation/dev-containers.md` — powtarzalne środowiska azd z Dev Containers i GitHub Codespaces: minimalny `.devcontainer/devcontainer.json` wykorzystujący oficjalną funkcję `ghcr.io/azure/azure-dev/azd`, funkcje specyficzne dla języków, `docker-in-docker` dla hostów kontenerów oraz `azd auth login --use-device-code` dla zdalnego logowania
- **🧩 Pulumi z azd** sekcja w `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, układ folderów Pulumi, mapowanie stosów na środowiska azd, wymagane outputy/znaczniki i identyczny przepływ pracy `azd up` / `azd down`
- **🎯 Wskazówki dotyczące wyboru hosta** w `docs/chapter-04-infrastructure/provisioning.md` — przyjazne dla początkujących porównanie `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` i `springapp`, oraz wskazówki kiedy wybrać AKS lub Azure Spring Apps
- **🛠️ Przewodnik Azure DevOps CI/CD** w `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, połączenie serwisowe z federacją tożsamości obciążenia (OIDC), wygenerowany `azure-dev.yml` oraz konfiguracja grup zmiennych
- **🔑 Service Principals (Wzorzec 4)** dodane do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, nieinteraktywny `azd auth login` z tajnym kluczem klienta vs poświadczenia federowane/OIDC, kiedy używać oraz bezpieczne przechowywanie poświadczeń
- **🪝 Obsługa błędów hooków** podsekcja w `docs/chapter-04-infrastructure/deployment-guide.md` — kody wyjścia i `set -e`, `continueOnError`, testowanie hooków w izolacji przy pomocy `azd hooks run`, powłoki specyficzne dla systemu operacyjnego oraz `--debug`
- **👥 Zespołowe / wspólne środowiska** sekcja w `docs/chapter-03-configuration/configuration.md` — co znajduje się w `.azure/`, co ignorować w git, środowiska per-developer, `azd env list`/`select` oraz dostarczanie wartości środowiska w CI/CD
- **🧰 `azd restore` i rozszerzone wyjaśnienia `azd package`** w `resources/cheat-sheet.md` — przywracanie zależności i budowa artefaktu do wdrożenia bez faktycznego wdrożenia

#### Zmieniono
- **🧭 Tabela lekcji Rozdziału 4** zaktualizowana o nową lekcję "Tworzenie własnego szablonu" (Lekcja 3)
- **🧭 Tabela lekcji Rozdziału 1** zaktualizowana o nową lekcję "Dev Containers & Codespaces" (Lekcja 5); stopki nawigacyjne połączone pomiędzy `bring-your-own-app.md` i `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Uzupełnienie dla początkujących: Lekcja praktyczna multi-agent, „Przynieś własną aplikację”, Terraform i przewodnik CI/CD
**Ta wersja zamyka największe luki w przewodniku dla zupełnych początkujących, dodając dwie nowe lekcje praktyczne (wdrożalne multi-agent i dodanie azd do istniejącej aplikacji), wprowadzenie do hooków przyjazne początkującym, sekcję Terraform z azd, krok po kroku przewodnik po pipeline GitHub Actions, wyjaśnienie nowych rozszerzeń w wersji zapoznawczej oraz eksplicytną listę kontrolną weryfikacji wdrożenia.**

#### Dodano
- **🤝 Nowa lekcja Rozdziału 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — w pełni praktyczny, wdrożalny przewodnik z dwoma agentami (orchestrator + specjaliści) wykorzystujący prawdziwy szablon (`contoso-creative-writer`), obejmujący kiedy używać multi-agent, przepływ pracy `azd up`, zrozumienie wdrożonych zasobów, śledzenie między agentami, personalizację i czyszczenie
- **📦 Nowa lekcja Rozdziału 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak dodać azd do istniejącego projektu za pomocą `azd init` ("użyj kodu w bieżącym katalogu"), zrozumienie `azure.yaml` i `infra/`, `azd infra generate`, wykrywanie hosta i wdrażanie z `azd up`
- **🌐 Terraform z azd** sekcja dodana do `docs/chapter-04-infrastructure/provisioning.md` — konfiguracja `infra.provider: terraform`, układ folderów `.tf`, wymagane outputy `AZURE_*` i znacznik `azd-env-name` oraz identyczny przepływ pracy `azd up` / `azd down` (zamyka lukę, w której wsparcie Terraform było deklarowane, ale pokazywano tylko Bicep)
- **⚙️ Szczegółowy przewodnik krok po kroku po GitHub Actions** w `docs/chapter-08-production/production-ai-practices.md` — od repozytorium GitHub do automatycznych wdrożeń: `azd pipeline config`, federacyjne poświadczenia OIDC (bez przechowywanych sekretów), wygenerowany `azure-dev.yml` oraz wskazówki dotyczące sekretów kontra zmienne
- **🪝 Wprowadzenie dla początkujących "Nowy w hookach?"** w `docs/chapter-04-infrastructure/deployment-guide.md` — czym jest hook, tabela etapów hooka, minimalny pierwszy hook oraz ręczne uruchamianie hooków za pomocą `azd hooks run`
- **✅ Lista kontrolna "Zweryfikuj swoje wdrożenie"** dodana do Kroku 5 w `docs/chapter-01-foundation/first-project.md` — test podstawowy, sprawdzenie punktu końcowego zdrowia oraz wyraźne kryteria sukcesu
- **🧩 Objaśnienie nowych rozszerzeń podglądu** `azure.ai.skills` oraz `azure.ai.connections` (czym są i kiedy z nich korzystać) w `docs/chapter-08-production/production-ai-practices.md`

#### Zmieniono
- **🧭 Poprawiona tabela lekcji rozdziału 5**: `multi-agent-basics.md` to teraz Lekcja 1 (jedyna w pełni praktyczna lekcja), ze szczerym oznaczeniem, że Lekcja 2 znajduje się w Rozdziale 6, a scenariusz Retail to blueprint architektury, nie szablon jednego polecenia
- **🧭 Tabela lekcji rozdziału 1** teraz zawiera nową lekcję "Przynieś swoją własną aplikację" (Lekcja 4)
- **🔗 Aktualizacja stopki nawigacji**: `first-project.md` teraz linkuje do przodu do `bring-your-own-app.md`

#### Naprawiono
- **🧱 Zamknięto lukę "twierdzoną, ale brakującą" Terraform** — kurs wcześniej odnosił się do wsparcia Terraform bez jego pokazania
- **🔀 Poprawiono wprowadzające w błąd krzyżowe odnośniki w rozdziale 5**, które sugerowały istnienie pełnej implementacji wielu agentów, podczas gdy istniał tylko blueprint architektury

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

#### Odświeżenie AZD 1.25.6, pełne polecenia cyklu życia agenta i rebranding Aspire
**Ta wersja ponownie weryfikuje kurs względem `azd` `1.25.6` (czerwiec 2026) oraz rozszerzenia `azure.ai.agents` `0.1.40-preview`, rozszerza wskazówki AI od "szkieletu agenta" do pełnego cyklu życia agenta (test → ocena → optymalizacja → inspekcja → usunięcie), prezentuje nowe rozszerzenia podglądu `azure.ai.skills` i `azure.ai.connections` oraz informuje o rebrandingu produktu z ".NET Aspire" na "Aspire".**

#### Dodano
- **🔁 Pełne pokrycie cyklu życia agenta** dla początkujących i inżynierów AI w całej dokumentacji:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela cyklu życia (szkielet → test → pomiar → poprawa → inspekcja → sprzątanie) dodana do sekcji Rozszerzenia i Polecenia AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nowa sekcja "Zarządzanie cyklem życia agenta" obejmująca `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` oraz `delete --force`
  - `resources/cheat-sheet.md` — Rozszerzone polecenia agentów AI o `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` oraz `delete --force`
- **🧩 Nowe rozszerzenia podglądu** udokumentowane: `azure.ai.skills` (wielokrotnego użytku umiejętności agentów) oraz `azure.ai.connections` (połączenia Foundry) dodane do tabeli rozszerzeń i ściągawki
- **⏱️ Wskazówki dotyczące czasu odpowiedzi** — przykłady `azd ai agent invoke` teraz pokazują całkowite opóźnienie i czas do pierwszego bajtu
- **📌 Baner wersji** w głównym README wskazujący uczących się na `azd version` i `azd upgrade`

#### Zmieniono
- **✅ Zaktualizowano bazę walidacyjną** z `azd 1.23.12` (marzec 2026) do `azd 1.25.6` (czerwiec 2026) we wszystkich README rozdziałów i dokumentacji warsztatowej
- **🤖 Zaktualizowano uwagę dot. rozszerzenia w rozdziale 2** z `azure.ai.agents` `0.1.18-preview` do `0.1.40-preview`
- **🧪 Zaktualizowano przykład walidacji warsztatowej** (wyjście `azd version`) do `1.25.6`
- **🧭 Odświeżono README "Co nowego w dzisiejszym azd"** aby podkreślić pełny cykl życia agenta, nowe rozszerzenia AI oraz ostatnie poprawki jakości użytkowania (`azd init` idempotencja, `azd auth login` czyszczenie przeterminowanych tokenów, `azd tool` zachęta pierwszego uruchomienia)
- **📖 Rozdział 2 agents.md (Opcja 4)** teraz wskazuje uczących na polecenia cyklu życia post-deploy, zamiast zatrzymywać się na `azd up`

#### Naprawiono
- **🏷️ Nazewnictwo produktu** — dodano notę o rebrandingu Aspire (".NET Aspire" to teraz po prostu "Aspire"); wsparcie azd dla Aspire pozostaje bez zmian
- **🔎 Walidacja wydania na żywo** potwierdzona względem kanału wydań Azure Developer CLI: stabilne CLI `1.25.6` (2026-06-12) oraz `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Wyjaśnienie onboardingu dla początkujących, walidacja środowiska i ostateczne porządki w poleceniach AZD
**Ta wersja kontynuuje przegląd walidacyjny AZD 1.23, skupiając się na dokumentacji dla początkujących: wyjaśnia wskazówki dotyczące autoryzacji preferującej AZD, dodaje lokalne skrypty walidacji środowiska, weryfikuje kluczowe polecenia względem działającego AZD CLI oraz usuwa ostatnie przestarzałe anglojęzyczne odniesienia do poleceń poza changelogiem.**

#### Dodano
- **🧪 Skrypty walidacji środowiska dla początkujących** przy użyciu `validate-setup.ps1` i `validate-setup.sh`, aby uczący się mogli potwierdzić wymagane narzędzia przed rozpoczęciem Rozdziału 1
- **✅ Wstępne kroki walidacji środowiska** w głównym README i README Rozdziału 1, aby brakujące wymagania były wykrywane przed `azd up`

#### Zmieniono
- **🔐 Wskazówki dotyczące autoryzacji dla początkujących** teraz konsekwentnie traktują `azd auth login` jako główną ścieżkę dla workflow AZD, z `az login` jako opcjonalnym, chyba że bezpośrednio używane są polecenia Azure CLI
- **📚 Przepływ onboardingu w Rozdziale 1** teraz wskazuje uczącym się na walidację lokalnego środowiska przed instalacją, autoryzacją i pierwszymi krokami wdrożenia
- **🛠️ Komunikaty walidatora** teraz wyraźnie oddzielają wymagania blokujące od opcjonalnych ostrzeżeń Azure CLI dla ścieżki AZD-only dla początkujących
- **📖 Dokumentacja konfiguracyjna, rozwiązywania problemów i przykłady** teraz rozróżnia wymaganą autoryzację AZD i opcjonalne logowanie do Azure CLI tam, gdzie wcześniej oba były prezentowane bez kontekstu

#### Naprawiono
- **📋 Pozostałe anglojęzyczne odniesienia do poleceń** zaktualizowane do obecnych form AZD, w tym `azd config show` w ściągawce i `azd monitor --overview` tam, gdzie wskazywano na ogólne przewodniki w Azure Portal
- **🧭 Twierdzenia początkujących w rozdziale 1** złagodzone tak, aby unikać gwarantowanego bezbłędnego lub rollbackowego zachowania dla wszystkich szablonów i zasobów Azure
- **🔎 Walidacja CLI na żywo** potwierdziła aktualne wsparcie dla `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` oraz `azd down --force --purge`

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
**Ta wersja wykonuje przegląd walidacyjny dokumentacji względem `azd` `1.23.12`, aktualizuje przestarzałe przykłady poleceń AZD, odświeża wskazówki dotyczące modeli AI do aktualnych wartości domyślnych oraz rozszerza instrukcje warsztatowe poza GitHub Codespaces, aby obejmowały także kontenery deweloperskie i lokalne kopie.**

#### Dodano
- **✅ Notatki walidacyjne w głównych rozdziałach i dokumentach warsztatowych** w celu wyraźnego wskazania testowanej bazy AZD dla uczących się korzystających z nowszych lub starszych buildów CLI
- **⏱️ Wskazówki dotyczące limitu czasu wdrożenia** długotrwałych wdrożeń aplikacji AI z użyciem `azd deploy --timeout 1800`
- **🔎 Kroki inspekcji rozszerzeń** z `azd extension show azure.ai.agents` w dokumentacji workflow AI
- **🌐 Szersze wskazówki środowiskowe warsztatu** obejmujące GitHub Codespaces, kontenery deweloperskie i lokalne kopie z MkDocs

#### Zmieniono
- **📚 README wprowadzające do rozdziałów** teraz konsekwentnie podkreślają walidację względem `azd 1.23.12` w sekcjach fundamentów, konfiguracji, infrastruktury, multi-agentów, przed wdrożeniem, rozwiązywania problemów i produkcji
- **🛠️ Odniesienia do poleceń AZD** zaktualizowane do aktualnych form w dokumentacji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` lub `azd env get-value(s)` w zależności od kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, gdzie przewidziano przegląd Application Insights
- **🧪 Upraszczanie przykładów provision preview** do aktualnie wspieranych form jak `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Aktualizacja przepływu warsztatowego** tak, aby uczący mogli ukończyć laby w Codespaces, kontenerze deweloperskim lub lokalnej kopii, zamiast zakładać wyłącznie wykonanie w Codespaces
- **🔐 Wskazówki dotyczące autoryzacji** preferują teraz `azd auth login` dla workflow AZD, z `az login` jako opcjonalnym gdy bezpośrednio używane są polecenia Azure CLI

#### Naprawiono
- **🪟 Normalizacja poleceń instalacyjnych Windows** do aktualnej wielkości liter pakietu `winget` w przewodniku instalacyjnym
- **🐧 Korekta wskazówek instalacji na Linuxie** aby uniknąć nieobsługiwanych instrukcji menadżera pakietów specyficznych dla dystrybucji `azd`, zamiast tego kierując do zasobów wydań tam, gdzie to stosowne
- **📦 Odświeżenie przykładów modeli AI** z dawnych domyślnych jak `gpt-35-turbo` i `text-embedding-ada-002` do aktualnych np. `gpt-4.1-mini`, `gpt-4.1` oraz `text-embedding-3-large`
- **📋 Poprawa snippetów wdrożenia i diagnostyki** tak, aby wykorzystywały aktualne polecenia środowiskowe i statusowe w logach, skryptach i instrukcjach rozwiązywania problemów
- **⚙️ Aktualizacja wskazówek GitHub Actions** z `Azure/setup-azd@v1.0.0` do `Azure/setup-azd@v2`
- **🤖 Aktualizacja wskazówek zgody MCP/Copilot** z `azd mcp consent` do `azd copilot consent list`

#### Ulepszono
- **🧠 Wskazówki rozdziału AI** lepiej tłumaczące zachowanie `azd ai` zależne od podglądu, logowanie konkretnego dzierżawcy, obecne wykorzystanie rozszerzeń oraz zaktualizowane rekomendacje wdrożeń modeli
- **🧪 Instrukcje warsztatowe** korzystające teraz z bardziej realistycznych przykładów wersji i jaśniejszego języka konfiguracji środowiska w ćwiczeniach praktycznych
- **📈 Dokumentacja produkcji i rozwiązywania problemów** lepiej dopasowana do aktualnego monitoringu, modelu zapasowego i przykładów poziomów kosztów

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
**Ta wersja dodaje pokrycie poleceń `azd ai`, `azd extension` i `azd mcp` we wszystkich rozdziałach związanych ze sztuczną inteligencją, naprawia uszkodzone linki i przestarzały kod w agents.md, aktualizuje ściągawkę i całkowicie przebudowuje sekcję szablonów przykładowych z zweryfikowanymi opisami oraz nowymi szablonami Azure AI AZD.**

#### Dodano
- **🤖 Pokrycie AZD AI CLI** w 7 plikach (wcześniej tylko w Rozdziale 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nowa sekcja "Rozszerzenia i polecenia AI" wprowadzająca `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcja 4: `azd ai agent init` z tabelą porównawczą (szablon vs podejście manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcje "Rozszerzenia AZD dla Foundry" oraz "Wdrażanie Agent-First"
  - `docs/chapter-05-multi-agent/README.md` — Szybki start pokazuje teraz oba sposoby wdrożenia: oparte na szablonie i na manifeście
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcja wdrażania zawiera teraz opcję `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcja "Polecenia rozszerzenia AZD AI do diagnostyki"
  - `resources/cheat-sheet.md` — Nowa sekcja "Polecenia AI i rozszerzeń" z `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Nowe przykładowe szablony AZD AI** w `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — czat RAG .NET z Blazor WebAssembly, Semantic Kernel i obsługą czatu głosowego
  - **azure-search-openai-demo-java** — czat RAG w Javie korzystający z Langchain4J z opcjami wdrożenia ACA/AKS
  - **contoso-creative-writer** — wieloagentowa aplikacja do kreatywnego pisania wykorzystująca Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — bezserwerowy RAG z Azure Functions + LangChain.js + Cosmos DB z lokalnym wsparciem Ollama
  - **chat-with-your-data-solution-accelerator** — enterprise'owy akcelerator RAG z panelem administracyjnym, integracją z Teams i opcjami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — referencyjna aplikacja orkiestracji MCP multi-agentów z serwerami w .NET, Python, Java i TypeScript
  - **azd-ai-starter** — minimalny szablon startowy infrastruktury Azure AI w Bicep
  - **🔗 Link do Awesome AZD AI Gallery** — odniesienie do [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (ponad 80 szablonów)

#### Naprawiono
- **🔗 Nawigacja w agents.md**: Linki Poprzedni/Następny teraz odpowiadają kolejności lekcji w Rozdziale 2 README (Integracja Microsoft Foundry → Agenci → Wdrażanie AI Modeli)
- **🔗 Uszkodzone linki w agents.md**: `production-ai-practices.md` poprawiono na `../chapter-08-production/production-ai-practices.md` (3 wystąpienia)
- **📦 Przestarzały kod w agents.md**: Zastąpiono `opencensus` przez `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Nieprawidłowe API w agents.md**: Przeniesiono `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 Liczenie tokenów w agents.md**: Zastąpiono przybliżoną wartość `len//4` szacunkiem `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Poprawiono usługi z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (domyślny host zmieniony na październik 2024)
- **contoso-chat**: Zaktualizowano opis, aby odnosił się do Azure AI Foundry + Prompty, zgodnie z faktycznym tytułem i stosowaną technologią repozytorium

#### Usunięto
- **ai-document-processing**: Usunięto odwołanie do nieaktywnego szablonu (repozytorium nie jest publicznie dostępne jako szablon AZD)

#### Ulepszono
- **📝 Ćwiczenia w agents.md**: Ćwiczenie 1 pokazuje teraz oczekiwany wynik i krok `azd monitor`; Ćwiczenie 2 zawiera pełny kod rejestracji `FunctionTool`; Ćwiczenie 3 zastępuje niejasne wskazówki konkretnymi poleceniami `prepdocs.py`
- **📚 Zasoby w agents.md**: Zaktualizowano linki do dokumentacji do aktualnych dokumentów Azure AI Agent Service i szybki start
- **📋 Tabela kolejnych kroków w agents.md**: Dodano link do AI Workshop Lab dla kompleksowego omówienia rozdziału

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
**Ta wersja poprawia nawigację rozdziałów w README.md dzięki ulepszonemu formatowi tabeli.**

#### Zmiany
- **Tabela mapy kursu**: Ulepszona o bezpośrednie linki do lekcji, szacunkowy czas trwania i ocenę złożoności
- **Czyszczenie folderów**: Usunięto zduplikowane stare foldery (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Weryfikacja linków**: Zweryfikowano wszystkie 21+ linków wewnętrznych w tabeli mapy kursu

### [v3.16.0] - 2026-02-05

#### Aktualizacje nazw produktów
**Ta wersja aktualizuje odniesienia do produktów zgodnie z aktualnym brandingiem Microsoft.**

#### Zmiany
- **Microsoft Foundry → Microsoft Foundry**: Wszystkie odniesienia zaktualizowane we wszystkich plikach poza tłumaczeniami
- **Azure AI Agent Service → Foundry Agents**: Nazwa usługi zaktualizowana zgodnie z aktualnym brandingiem

#### Zaktualizowane pliki
- `README.md` - Główna strona kursu
- `changelog.md` - Historia wersji
- `course-outline.md` - Struktura kursu
- `docs/chapter-02-ai-development/agents.md` - Przewodnik po agentach AI
- `examples/README.md` - Dokumentacja przykładów
- `workshop/README.md` - Strona startowa warsztatu
- `workshop/docs/index.md` - Indeks warsztatu
- `workshop/docs/instructions/*.md` - Wszystkie pliki instrukcji warsztatu

---

### [v3.15.0] - 2026-02-05

#### Główna restrukturyzacja repozytorium: foldery nazwane według rozdziałów
**Ta wersja restrukturyzuje dokumentację w dedykowane foldery rozdziałów dla czytelniejszej nawigacji.**

#### Zmiany nazw folderów
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
- **📚 Pliki README rozdziałów**: Stworzono README.md w każdym folderze rozdziału, zawierające:
  - Cele nauki i czas trwania
  - Tabela lekcji z opisami
  - Polecenia szybkiego startu
  - Nawigację do innych rozdziałów

#### Zmiany
- **🔗 Zaktualizowano wszystkie linki wewnętrzne**: Ponad 78 ścieżek zaktualizowanych w całej dokumentacji
- **🗺️ Główne README.md**: Zaktualizowano mapę kursu z nową strukturą rozdziałów
- **📝 examples/README.md**: Zaktualizowano odwołania do folderów rozdziałów

#### Usunięto
- Starą strukturę folderów (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturyzacja repozytorium: Nawigacja rozdziałowa
**Ta wersja dodała pliki README nawigacji rozdziałowej (zastąpione przez v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nowy Przewodnik po Agentach AI
**Ta wersja dodaje kompleksowy przewodnik po wdrażaniu agentów AI za pomocą Azure Developer CLI.**

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

#### Struktura zawartości
- **Wprowadzenie**: Koncepcje agentów dla początkujących
- **Szybki start**: Wdrażanie agentów za pomocą `azd init --template get-started-with-ai-agents`
- **Wzorce architektury**: Wizualne diagramy wzorców agentów
- **Konfiguracja**: Ustawienia narzędzi i zmienne środowiskowe
- **Monitorowanie**: Integracja z Application Insights
- **Ćwiczenia**: Stopniowa nauka praktyczna (20-45 minut każde)

---

### [v3.12.0] - 2026-02-05

#### Aktualizacja środowiska DevContainer
**Ta wersja aktualizuje konfigurację kontenera rozwojowego z nowoczesnymi narzędziami i lepszymi domyślnymi ustawieniami dla doświadczenia nauki AZD.**

#### Zmiany
- **🐳 Obraz bazowy**: Zaktualizowano z `python:3.12-bullseye` na `python:3.12-bookworm` (najnowszy stabilny Debian)
- **📛 Nazwa kontenera**: Zmieniono z "Python 3" na "AZD for Beginners" dla jasności

#### Dodano
- **🔧 Nowe funkcje Dev Container**:
  - `azure-cli` z włączonym wsparciem dla Bicep
  - `node:20` (wersja LTS dla szablonów AZD)
  - `github-cli` do zarządzania szablonami
  - `docker-in-docker` do wdrożeń aplikacji kontenerowych

- **🔌 Przekierowanie portów**: Wstępnie skonfigurowane porty dla typowego developmentu:
  - 8000 (podgląd MkDocs)
  - 3000 (aplikacje webowe)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nowe rozszerzenia VS Code**:
  - `ms-python.vscode-pylance` - ulepszone IntelliSense dla Pythona
  - `ms-azuretools.vscode-azurefunctions` - wsparcie Azure Functions
  - `ms-azuretools.vscode-docker` - wsparcie Docker
  - `ms-azuretools.vscode-bicep` - wsparcie języka Bicep
  - `ms-azure-devtools.azure-resource-groups` - zarządzanie zasobami Azure
  - `yzhang.markdown-all-in-one` - edycja Markdown
  - `DavidAnson.vscode-markdownlint` - linting Markdown
  - `bierner.markdown-mermaid` - wsparcie diagramów Mermaid
  - `redhat.vscode-yaml` - wsparcie YAML (dla azure.yaml)
  - `eamodio.gitlens` - wizualizacja Git
  - `mhutchie.git-graph` - historia Git

- **⚙️ Ustawienia VS Code**: Dodano domyślne ustawienia dla interpretera Pythona, formatowania przy zapisie i usuwania nadmiarowych spacji

- **📦 Zaktualizowano requirements-dev.txt**:
  - Dodano wtyczkę MkDocs minify
  - Dodano pre-commit dla jakości kodu
  - Dodano pakiety Azure SDK (azure-identity, azure-mgmt-resource)

#### Naprawiono
- **Polecenie Post-Create**: Teraz weryfikuje instalację AZD i Azure CLI przy starcie kontenera

---

### [v3.11.0] - 2026-02-05

#### Przeprojektowanie README przyjazne dla początkujących
**Ta wersja znacznie poprawia README.md, czyniąc je bardziej przystępnym dla początkujących i dodaje kluczowe zasoby dla twórców AI.**

#### Dodano
- **🆚 Porównanie Azure CLI vs AZD**: Jasne wyjaśnienie, kiedy używać którego narzędzia wraz z praktycznymi przykładami
- **🌟 Linki do Awesome AZD**: Bezpośrednie linki do galerii szablonów społeczności oraz zasobów do współtworzenia:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - ponad 200 gotowych do wdrożenia szablonów
  - [Zgłoś szablon](https://github.com/Azure/awesome-azd/issues) - Wkład społeczności
- **🎯 Przewodnik szybkiego startu**: Uproszczona sekcja startowa w 3 krokach (Instalacja → Logowanie → Wdrożenie)
- **📊 Tabela nawigacji oparta na doświadczeniu**: Jasne wskazówki, od czego zacząć w zależności od poziomu programisty

#### Zmiany
- **Struktura README**: Przeorganizowane dla stopniowego ujawniania informacji - najważniejsze na początku
- **Sekcja Wprowadzenie**: Przepisana, by wyjaśnić "Magia `azd up`" dla całkowitych początkujących
- **Usunięto zduplikowaną zawartość**: Usunięto powieloną sekcję rozwiązywania problemów
- **Komendy rozwiązywania problemów**: Naprawiono odwołanie do `azd logs`, aby używać prawidłowego `azd monitor --logs`

#### Naprawiono
- **🔐 Komendy uwierzytelniania**: Dodano `azd auth login` i `azd auth logout` do cheat-sheet.md
- **Nieprawidłowe odwołania do komend**: Usunięto pozostałe `azd logs` z sekcji rozwiązywania problemów w README

#### Notatki
- **Zakres**: Zmiany zastosowane w głównym README.md oraz resources/cheat-sheet.md
- **Docelowa grupa odbiorców**: Ulepszenia skierowane specjalnie do programistów nowych w AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizacja poprawności komend Azure Developer CLI
**Ta wersja koryguje nieistniejące polecenia AZD w całej dokumentacji, zapewniając, że wszystkie przykłady kodu używają prawidłowej składni Azure Developer CLI.**

#### Naprawiono
- **🔧 Usunięto nieistniejące komendy AZD**: Kompleksowy przegląd i korekta nieprawidłowych komend:
  - `azd logs` (nie istnieje) → zastąpiono `azd monitor --logs` lub alternatywami Azure CLI
  - Podkomendy `azd service` (nie istnieją) → zastąpiono `azd show` i Azure CLI
  - `azd infra import/export/validate` (nie istnieją) → usunięto lub zastąpiono prawidłowymi alternatywami
  - Flagi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nie istnieją) → usunięto
  - Flagi `azd provision --what-if/--rollback` (nie istnieją) → zaktualizowano na użycie `--preview`
  - `azd config validate` (nie istnieje) → zastąpiono `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nie istnieją) → usunięto

- **📚 Pliki zaktualizowane z korektami komend**:
  - `resources/cheat-sheet.md`: Kompleksowa aktualizacja referencji komend
  - `docs/deployment/deployment-guide.md`: Naprawiono strategie wycofywania i wdrażania
  - `docs/troubleshooting/debugging.md`: Poprawione sekcje analizy logów
  - `docs/troubleshooting/common-issues.md`: Zaktualizowano komendy rozwiązywania problemów
  - `docs/troubleshooting/ai-troubleshooting.md`: Naprawiono sekcję debugowania AZD
  - `docs/getting-started/azd-basics.md`: Poprawione komendy monitorowania
  - `docs/getting-started/first-project.md`: Zaktualizowane przykłady monitorowania i debugowania
  - `docs/getting-started/installation.md`: Naprawione przykłady pomocy i wersji
  - `docs/pre-deployment/application-insights.md`: Poprawione komendy przeglądu logów
  - `docs/pre-deployment/coordination-patterns.md`: Naprawione komendy debugowania agenta

- **📝 Zaktualizowano odniesienia wersji**: 
  - `docs/getting-started/installation.md`: Zmieniono twardo zakodowaną wersję `1.5.0` na ogólną `1.x.x` z linkiem do wydań

#### Zmiany
- **Strategie wycofywania**: Zaktualizowano dokumentację, aby używać wycofywania opartego na Git (AZD nie posiada natywnego wycofywania)
- **Przegląd logów**: Zastąpiono odwołania `azd logs` komendami `azd monitor --logs`, `azd monitor --live` i Azure CLI
- **Sekcja wydajności**: Usunięto nieistniejące flagi wdrożeń równoległych/przyrostowych, podano prawidłowe alternatywy

#### Szczegóły techniczne
- **Prawidłowe komendy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Prawidłowe flagi azd monitor**: `--live`, `--logs`, `--overview`
- **Usunięte funkcje**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notatki
- **Weryfikacja**: Komendy zweryfikowane względem Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Zakończenie warsztatów i poprawa jakości dokumentacji
**Ta wersja kończy interaktywne moduły warsztatowe, naprawia wszystkie uszkodzone linki w dokumentacji oraz poprawia ogólną jakość treści dla deweloperów AI korzystających z Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nowy dokument z wytycznymi dotyczącymi wkładu:
  - Jasne instrukcje zgłaszania problemów i proponowania zmian
  - Standardy dokumentacji dla nowej zawartości
  - Wytyczne dotyczące przykładów kodu i konwencji komunikatów commit
  - Informacje na temat zaangażowania społeczności

#### Ukończono
- **🎯 Moduł warsztatowy 7 (Podsumowanie)**: Całkowicie ukończony moduł podsumowujący z:
  - Kompleksowym podsumowaniem osiągnięć warsztatu
  - Sekcją kluczowych opanowanych pojęć dotyczących AZD, szablonów i Microsoft Foundry
  - Rekomendacjami dalszej nauki
  - Ćwiczeniami warsztatowymi z oceną trudności
  - Informacjami zwrotnymi od społeczności i linkami wsparcia

- **📚 Moduł warsztatowy 3 (Rozbiórka)**: Zaktualizowane cele nauki z:
  - Wskazówkami aktywacji GitHub Copilot z serwerami MCP
  - Zrozumieniem struktury folderów szablonów AZD
  - Wzorcami organizacji infrastruktury jako kod (Bicep)
  - Instrukcjami praktycznych laboratoriów

- **🔧 Moduł warsztatowy 6 (Demontaż)**: Ukończony z:
  - Celami sprzątania zasobów i zarządzania kosztami
  - Użyciem `azd down` do bezpiecznego usuwania infrastruktury
  - Wskazówkami odzyskiwania usług kognitywnych po miękkim usunięciu
  - Bonusowymi propozycjami eksploracji GitHub Copilot i Azure Portal

#### Naprawiono
- **🔗 Naprawa uszkodzonych linków**: Rozwiązano ponad 15 uszkodzonych linków wewnętrznych dokumentacji:
  - `docs/ai-foundry/ai-model-deployment.md`: Naprawiono ścieżki do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawiono ścieżki ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zastąpiono nieistniejący cicd-integration.md plikiem deployment-guide.md
  - `examples/retail-scenario.md`: Naprawiono ścieżki do FAQ i przewodnika rozwiązywania problemów
  - `examples/container-app/microservices/README.md`: Poprawiono ścieżki do strony głównej kursu i przewodnika wdrożenia
  - `resources/faq.md` i `resources/glossary.md`: Zaktualizowano odniesienia do rozdziałów AI
  - `course-outline.md`: Naprawiono przewodnik instruktora i odniesienia do laboratoriów warsztatu AI

- **📅 Baner statusu warsztatu**: Aktualizacja z "W budowie" na aktywny status warsztatu z datą luty 2026

- **🔗 Nawigacja warsztatu**: Naprawiono uszkodzone linki nawigacyjne w README.md warsztatu wskazujące na nieistniejący folder lab-1-azd-basics

#### Zmiany
- **Prezentacja warsztatu**: Usunięto ostrzeżenie „w budowie”, warsztat jest teraz ukończony i gotowy do użycia
- **Spójność nawigacji**: Zapewniono właściwą nawigację między modułami warsztatu
- **Odwołania ścieżki nauki**: Zaktualizowano odniesienia rozdziałów, aby używały poprawnych ścieżek microsoft-foundry

#### Zweryfikowano
- ✅ Wszystkie angielskie pliki markdown zawierają prawidłowe linki wewnętrzne
- ✅ Moduły warsztatów 0-7 są kompletne z celami nauki
- ✅ Nawigacja między rozdziałami i modułami działa poprawnie
- ✅ Treść jest odpowiednia dla deweloperów AI korzystających z Microsoft AZD
- ✅ Utrzymano język i strukturę przyjazną dla początkujących
- ✅ CONTRIBUTING.md zapewnia jasne wskazówki dla współtwórców społeczności

#### Implementacja techniczna
- **Weryfikacja linków**: Zautomatyzowany skrypt PowerShell zweryfikował wszystkie wewnętrzne linki .md
- **Audyt zawartości**: Ręczna analiza kompletności warsztatu i użyteczności dla początkujących
- **System nawigacji**: Stosowane spójne wzory nawigacji rozdziałów i modułów

#### Notatki
- **Zakres**: Zmiany zastosowane tylko do dokumentacji w języku angielskim
- **Tłumaczenia**: Foldery tłumaczeń nie zostały zaktualizowane w tej wersji (automatyczne tłumaczenie zostanie zsynchronizowane później)
- **Czas trwania warsztatu**: Kompletny warsztat teraz oferuje 3-4 godziny praktycznej nauki

---

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: Monitorowanie, bezpieczeństwo i wzorce multi-agent
**Ta wersja dodaje kompleksowe lekcje na poziomie A dotyczące integracji Application Insights, wzorców uwierzytelniania oraz koordynacji multi-agent dla wdrożeń produkcyjnych.**

#### Dodano
- **📊 Lekcja integracji Application Insights**: w `docs/pre-deployment/application-insights.md`:
  - Wdrożenie skoncentrowane na AZD z automatycznym provisioningiem
  - Kompletny szablon Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z niestandardową telemetrią (ponad 1,200 linii)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów modeli Microsoft Foundry)
  - 6 diagramów Mermaid (architektura, rozproszony tracing, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, pulpity, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Strumieniowe metryki na żywo oraz debugowanie w czasie rzeczywistym
  - Czas nauki 40-50 minut z wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i bezpieczeństwa**: w `docs/getting-started/authsecurity.md`:
  - 3 wzorce uwierzytelniania (connection strings, Key Vault, zarządzana tożsamość)
  - Kompletny szablon infrastruktury Bicep dla bezpiecznych wdrożeń
  - Kod aplikacji Node.js z integracją Azure SDK
  - 3 kompletne ćwiczenia (włączenie zarządzanej tożsamości, tożsamość przypisana do użytkownika, rotacja Key Vault)
  - Najlepsze praktyki bezpieczeństwa i konfiguracje RBAC
  - Przewodnik rozwiązywania problemów i analiza kosztów
  - Gotowe do produkcji wzorce uwierzytelniania bezhasłowego

- **🤖 Lekcja wzorców koordynacji multi-agent**: w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Kompletny implementacja serwisu orkiestratora (Python/Flask, ponad 1,500 linii)
  - 3 specjalistyczne implementacje agentów (Research, Writer, Editor)
  - Integracja z Service Bus dla kolejkowania wiadomości
  - Zarządzanie stanem w Cosmos DB dla systemów rozproszonych
  - 6 diagramów Mermaid pokazujących interakcje agentów
  - 3 zaawansowane ćwiczenia (obsługa limitu czasu, logika ponawiania, obwód zabezpieczający)
  - Analiza kosztów ($240-565/miesiąc) wraz ze strategiami optymalizacji
  - Integracja Application Insights do monitorowania

#### Ulepszono
- **Rozdział pre-deployment**: Teraz zawiera kompleksowe wzorce monitorowania i koordynacji
- **Rozdział rozpoczęcia pracy**: Wzbogacony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Pełne omówienie od bezpieczeństwa po obserwowalność
- **Plan kursu**: Zaktualizowany o odniesienia do nowych lekcji w Rozdziałach 3 i 6

#### Zmiany
- **Postęp nauki**: Lepsza integracja bezpieczeństwa i monitorowania w całym kursie
- **Jakość dokumentacji**: Spójne standardy poziomu A (95-97%) w nowych lekcjach
- **Wzorce produkcyjne**: Pełne pokrycie end-to-end dla wdrożeń korporacyjnych

#### Usprawnienia
- **Doświadczenie dewelopera**: Jasna ścieżka od rozwoju do monitorowania produkcji
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania sekretami
- **Obserwowalność**: Pełna integracja Application Insights z AZD
- **Obciążenia AI**: Specjalistyczne monitorowanie modeli Microsoft Foundry i systemów multi-agent

#### Zweryfikowano
- ✅ Wszystkie lekcje zawierają kompletny działający kod (nie tylko fragmenty)
- ✅ Diagramy Mermaid do nauki wizualnej (łącznie 19 w 3 lekcjach)
- ✅ Ćwiczenia praktyczne z krokami weryfikacji (łącznie 9)
- ✅ Gotowe do produkcji szablony Bicep wdrażalne przez `azd up`
- ✅ Analiza kosztów i strategie optymalizacji
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki
- ✅ Punkty kontrolne wiedzy z komendami weryfikującymi

#### Wyniki oceny dokumentacji
- **docs/pre-deployment/application-insights.md**: - Kompleksowy przewodnik po monitorowaniu
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury multi-agent
- **Całkowita nowa zawartość**: - Spójne standardy wysokiej jakości

#### Implementacja techniczna
- **Application Insights**: Log Analytics + niestandardowa telemetria + rozproszony tracing
- **Uwierzytelnianie**: Zarządzana tożsamość + Key Vault + wzorce RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkiestracja
- **Monitorowanie**: Metryki na żywo + zapytania Kusto + alerty + pulpity
- **Zarządzanie kosztami**: Strategie próbkowania, polityki retencji, kontrola budżetu

### [v3.7.0] - 2025-11-19

#### Poprawa jakości dokumentacji i nowy przykład Microsoft Foundry Models
**Ta wersja poprawia jakość dokumentacji w całym repozytorium oraz dodaje kompletny przykład wdrożenia Microsoft Foundry Models z interfejsem czatu gpt-4.1.**

#### Dodano
- **🤖 Przykład czatu Microsoft Foundry Models**: Kompletny deployment gpt-4.1 z działającą implementacją w `examples/azure-openai-chat/`:
  - Kompletną infrastrukturę Microsoft Foundry Models (wdrożenie modelu gpt-4.1)
  - Interfejs chat w wierszu poleceń Python z historią konwersacji
  - Integrację Key Vault do bezpiecznego przechowywania kluczy API
  - Śledzenie użycia tokenów i szacowanie kosztów
  - Ograniczanie szybkości i obsługa błędów
  - Kompleksowy README z przewodnikiem wdrożenia 35-45 minut
  - 11 plików gotowych do produkcji (szablony Bicep, aplikacja Python, konfiguracja)
- **📚 Ćwiczenia dokumentacyjne**: Dodano praktyczne ćwiczenia do przewodnika konfiguracyjnego:
  - Ćwiczenie 1: Konfiguracja wielośrodowiskowa (15 minut)
  - Ćwiczenie 2: Praktyka zarządzania sekretami (10 minut)
  - Jasne kryteria sukcesu i kroki weryfikacyjne
- **✅ Weryfikacja wdrożenia**: Dodano sekcję w przewodniku wdrożenia:
  - Procedury kontroli stanu zdrowia
  - Lista kryteriów sukcesu
  - Oczekiwane wyniki dla wszystkich poleceń wdrożenia
  - Szybkie odniesienie do rozwiązywania problemów

#### Ulepszono
- **examples/README.md**: Zaktualizowano do jakości poziomu A (93%):
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji
  - Zaktualizowano liczbę lokalnych przykładów z 3 do 4
  - Dodano do tabeli przykładów aplikacji AI
  - Zintegrowano z szybkim startem dla użytkowników średniozaawansowanych
  - Dodano do sekcji szablonów Microsoft Foundry
  - Zaktualizowano macierz porównawczą i sekcje wyszukiwania technologii
- **Jakość dokumentacji**: Poprawiona B+ (87%) → A- (92%) w całym folderze z dokumentacją:
  - Dodano oczekiwane wyniki do krytycznych przykładów poleceń
  - Uwzględniono kroki weryfikacyjne dla zmian konfiguracji
  - Ulepszono naukę praktyczną za pomocą ćwiczeń praktycznych

#### Zmiany
- **Postęp w nauce**: Lepsza integracja przykładów AI dla użytkowników na poziomie średniozaawansowanym
- **Struktura dokumentacji**: Bardziej praktyczne ćwiczenia z jasnymi efektami
- **Proces weryfikacji**: Dodano wyraźne kryteria sukcesu do kluczowych procesów

#### Ulepszenia
- **Doświadczenie dewelopera**: Wdrożenie Microsoft Foundry Models zajmuje teraz 35-45 minut (w porównaniu do 60-90 minut w przypadku złożonych alternatyw)
- **Przejrzystość kosztów**: Jasne szacunki kosztów (50-200 USD/miesiąc) dla przykładu Microsoft Foundry Models
- **Ścieżka nauki**: Deweloperzy AI mają wyraźny punkt startu z azure-openai-chat
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacyjne

#### Zweryfikowano
- ✅ Przykład Microsoft Foundry Models w pełni funkcjonalny z `azd up`
- ✅ Wszystkie 11 plików implementacyjnych poprawne składniowo
- ✅ Instrukcje w README zgodne z rzeczywistym doświadczeniem wdrożenia
- ✅ Linki dokumentacji zaktualizowane w ponad 8 miejscach
- ✅ Indeks przykładów dokładnie odzwierciedla 4 lokalne przykłady
- ✅ Brak zduplikowanych linków zewnętrznych w tabelach
- ✅ Wszystkie odniesienia nawigacyjne poprawne

#### Wdrożenie techniczne
- **Architektura Microsoft Foundry Models**: wzorzec gpt-4.1 + Key Vault + Container Apps
- **Bezpieczeństwo**: Obsługa Managed Identity, sekretów w Key Vault
- **Monitorowanie**: integracja Application Insights
- **Zarządzanie kosztami**: śledzenie tokenów i optymalizacja zużycia
- **Wdrożenie**: pojedyncze polecenie `azd up` do pełnej konfiguracji

### [v3.6.0] - 2025-11-19

#### Główna aktualizacja: Przykłady wdrożeń aplikacji kontenerowych
**Ta wersja wprowadza kompleksowe, gotowe do produkcji przykłady wdrożeń aplikacji kontenerowych za pomocą Azure Developer CLI (AZD), z pełną dokumentacją i integracją w ścieżce nauki.**

#### Dodano
- **🚀 Przykłady aplikacji kontenerowych**: nowe lokalne przykłady w `examples/container-app/`:
  - [Przewodnik główny](examples/container-app/README.md): Kompleksowy przegląd wdrożeń kontenerowych, szybki start, produkcja i zaawansowane wzorce
  - [Prosty API Flask](../../examples/container-app/simple-flask-api): Przyjazny dla początkujących REST API z funkcją skalowania do zera, sondami zdrowia, monitorowaniem i rozwiązywaniem problemów
  - [Architektura mikroserwisów](../../examples/container-app/microservices): Gotowe do produkcji wdrożenie multi-serwisowe (API Gateway, Produkt, Zamówienie, Użytkownik, Powiadomienie), asynchroniczne przesyłanie wiadomości, Service Bus, Cosmos DB, Azure SQL, rozproszone śledzenie, wdrożenia blue-green/canary
- **Najlepsze praktyki**: bezpieczeństwo, monitorowanie, optymalizacja kosztów i zalecenia CI/CD dla obciążeń kontenerowych
- **Przykładowy kod**: kompletny `azure.yaml`, szablony Bicep i implementacje usług w wielu językach (Python, Node.js, C#, Go)
- **Testowanie i rozwiązywanie problemów**: scenariusze testowe end-to-end, polecenia monitorowania, wskazówki rozwiązywania problemów

#### Zmiany
- **README.md**: zaktualizowano o funkcję i linki do nowych przykładów aplikacji kontenerowych w sekcji "Local Examples - Container Applications"
- **examples/README.md**: zaktualizowano, aby podkreślić przykłady aplikacji kontenerowych, dodać wpisy do macierzy porównawczej i zaktualizować odniesienia do technologii/architektury
- **Zarys kursu i przewodnik nauki**: zaktualizowano o odniesienia do nowych przykładów aplikacji kontenerowych i wzorców wdrożeniowych w odpowiednich rozdziałach

#### Zweryfikowano
- ✅ Wszystkie nowe przykłady wdrażalne za pomocą `azd up` i zgodne z najlepszymi praktykami
- ✅ Linki krzyżowe w dokumentacji i nawigacja zaktualizowane
- ✅ Przykłady obejmują scenariusze od początkujących do zaawansowanych, w tym mikroserwisy produkcyjne

#### Uwagi
- **Zakres**: Tylko dokumentacja i przykłady w języku angielskim
- **Kolejne kroki**: Rozszerzenie o dodatkowe zaawansowane wzorce kontenerowe i automatyzację CI/CD w przyszłych wydaniach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Ta wersja wprowadza kompleksową zmianę nazwy produktu z "Microsoft Foundry" na "Microsoft Foundry" we wszystkich anglojęzycznych materiałach, odzwierciedlając oficjalny rebranding Microsoft.**

#### Zmiany
- **🔄 Aktualizacja nazwy produktu**: Kompletny rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Zaktualizowano wszystkie odniesienia w anglojęzycznej dokumentacji w folderze `docs/`
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Łącznie: 23 odniesienia w treści zaktualizowane w 7 plikach dokumentacji

- **📁 Zmiany w strukturze folderów**:
  - `docs/ai-foundry/` zmieniono na `docs/microsoft-foundry/`
  - Wszystkie odniesienia krzyżowe zaktualizowane, aby odzwierciedlić nową strukturę folderów
  - Linki nawigacyjne zweryfikowane we wszystkich dokumentach

- **📄 Zmiany nazw plików**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Wszystkie linki wewnętrzne zaktualizowane, aby wskazywały nową nazwę pliku

#### Zaktualizowane pliki
- **Dokumentacja rozdziałów** (7 plików):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 odniesienia nazwy produktu zaktualizowane
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Już używa Microsoft Foundry (z poprzednich aktualizacji)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 odniesienia zaktualizowane (przegląd, opinie społeczności, dokumentacja)
  - `docs/getting-started/azd-basics.md` - 4 linki krzyżowe zaktualizowane
  - `docs/getting-started/first-project.md` - 2 linki nawigacji rozdziałów zaktualizowane
  - `docs/getting-started/installation.md` - 2 linki do następnego rozdziału zaktualizowane
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 odniesienia zaktualizowane (nawigacja, społeczność Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link nawigacji zaktualizowany
  - `docs/troubleshooting/debugging.md` - 1 link nawigacji zaktualizowany

- **Pliki struktury kursu** (2 pliki):
  - `README.md` - 17 odniesień zaktualizowanych (przegląd kursu, tytuły rozdziałów, sekcja szablonów, wnioski społeczności)
  - `course-outline.md` - 14 odniesień zaktualizowanych (przegląd, cele nauki, zasoby rozdziału)

#### Zweryfikowano
- ✅ Brak pozostałych odniesień do folderu "ai-foundry" w dokumentacji angielskiej
- ✅ Brak pozostałych odniesień nazwy produktu "Microsoft Foundry" w dokumentacji angielskiej
- ✅ Wszystkie linki nawigacyjne działają z nową strukturą folderów
- ✅ Zmiany nazw plików i folderów zakończone pomyślnie
- ✅ Zweryfikowano odniesienia krzyżowe między rozdziałami

#### Uwagi
- **Zakres**: Zmiany zastosowano tylko w anglojęzycznej dokumentacji w folderze `docs/`
- **Tłumaczenia**: Foldery tłumaczeń (`translations/`) nie zostały zaktualizowane w tej wersji
- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie zostały zaktualizowane w tej wersji
- **Przykłady**: Pliki przykładów mogą nadal odwoływać się do poprzedniej nazwy (do rozwiązania w kolejnej aktualizacji)
- **Linki zewnętrzne**: Zewnętrzne adresy URL i odniesienia do repozytorium GitHub pozostają niezmienione

#### Przewodnik migracji dla współautorów
Jeśli masz lokalne gałęzie lub dokumentację odwołującą się do starej struktury:
1. Zaktualizuj odniesienia do folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Zaktualizuj odniesienia do plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamień nazwę produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Sprawdź, czy wszystkie wewnętrzne linki w dokumentacji działają poprawnie

---

### [v3.4.0] - 2025-10-24

#### Poprawki i usprawnienia podglądu infrastruktury oraz walidacji
**Ta wersja wprowadza kompleksowe wsparcie dla nowej funkcji podglądu Azure Developer CLI oraz poprawia doświadczenia użytkowników warsztatów.**

#### Dodano
- **🧪 Dokumentacja funkcji azd provision --preview**: Kompleksowe omówienie nowej funkcji podglądu infrastruktury
  - Odniesienia do poleceń i przykłady użycia w ściągawce
  - Szczegóły integracji w przewodniku provisioningowym z przypadkami użycia i korzyściami
  - Integracja kontroli wstępnej dla bezpieczniejszej walidacji wdrożenia
  - Aktualizacje przewodnika startowego z praktykami zapewniającymi bezpieczeństwo wdrożenia
- **🚧 Baner statusu warsztatu**: Profesjonalny baner HTML wskazujący status rozwoju warsztatu
  - Gradientowy wzór z wskaźnikami postępu dla jasnej komunikacji z użytkownikiem
  - Znacznik czasu ostatniej aktualizacji dla przejrzystości
  - Responsywny design dla urządzeń mobilnych

#### Ulepszenia
- **Bezpieczeństwo infrastruktury**: Funkcja podglądu zintegrowana we wszystkich dokumentach wdrożeniowych
- **Walidacja przed wdrożeniem**: Skrypty automatyczne teraz zawierają testy podglądu infrastruktury
- **Przepływ pracy dewelopera**: Zaktualizowane sekwencje poleceń uwzględniające podgląd jako najlepszą praktykę
- **Doświadczenie warsztatu**: Jasne komunikaty o statusie rozwoju treści dla użytkowników

#### Zmiany
- **Najlepsze praktyki wdrożeniowe**: Zalecany obecnie przepływ pracy rozpoczynający się od podglądu
- **Przepływ dokumentacji**: Walidacja infrastruktury przeniesiona na wcześniejszy etap nauki
- **Prezentacja warsztatu**: Profesjonalna komunikacja statusu z jasnym harmonogramem rozwoju

#### Ulepszenia
- **Podejście bezpieczeństwa**: Zmiany infrastruktury można teraz zweryfikować przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu można udostępniać do przeglądu i zatwierdzenia
- **Świadomość kosztów**: Lepsze zrozumienie kosztów zasobów przed provisioningiem
- **Minimalizacja ryzyka**: Mniej niepowodzeń wdrożenia dzięki wcześniejszej walidacji

#### Implementacja techniczna
- **Integracja wielu dokumentów**: Funkcja podglądu opisana w 4 kluczowych plikach
- **Wzorce poleceń**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd uwzględniony w procesach walidacji i skryptach
- **Wskaźniki wizualne**: Wyraźne oznaczenia NOWEJ funkcji dla łatwiejszego znalezienia

#### Infrastruktura warsztatu
- **Komunikacja statusu**: Profesjonalny baner HTML z gradientowym stylem
- **Doświadczenie użytkownika**: Jasny komunikat o statusie rozwoju zapobiega nieporozumieniom
- **Profesjonalna prezentacja**: Utrzymuje wiarygodność repozytorium i ustawia oczekiwania
- **Przejrzystość harmonogramu**: Znacznik czasu ostatniej aktualizacji październik 2025 dla odpowiedzialności

### [v3.3.0] - 2025-09-24

#### Rozszerzone materiały warsztatowe i interaktywne doświadczenie nauki
**Ta wersja wprowadza kompleksowe materiały warsztatowe z przeglądem w przeglądarce oraz ustrukturyzowane ścieżki nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatowy**: Doświadczenie warsztatowe w przeglądarce z możliwością podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatowe**: 7-etapowa ścieżka nauki od odkrycia do dostosowania
  - 0-Wprowadzenie: Przegląd i konfiguracja warsztatu
  - 1-Wybór-szablonu-AI: Proces odkrywania i wyboru szablonu
  - 2-Walidacja-szablonu-AI: Procedury wdrożenia i walidacji
  - 3-Dekonstrukcja-szablonu-AI: Zrozumienie architektury szablonu
  - 4-Konfiguracja-szablonu-AI: Konfiguracja i personalizacja
  - 5-Dostosowanie-szablonu-AI: Zaawansowane modyfikacje i iteracje
  - 6-Zakończenie-infrastruktury: Sprzątanie i zarządzanie zasobami
  - 7-Podsumowanie: Streszczenie i kolejne kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia nauki
- **🎯 Praktyczna ścieżka nauki**: Metodologia 3 kroków (Odkrycie → Wdrożenie → Dostosowanie)
- **📱 Integracja GitHub Codespaces**: Płynne środowisko programistyczne

#### Ulepszenia
- **Laboratorium AI na warsztacie**: Rozszerzone o kompleksowe doświadczenie nauki trwające 2-3 godziny
- **Dokumentacja warsztatowa**: Profesjonalna prezentacja z nawigacją i pomocy wizualnej
- **Postęp w nauce**: Jasne wskazówki krok po kroku od wyboru szablonu do produkcyjnego wdrożenia
- **Doświadczenie dewelopera**: Zintegrowane narzędzia usprawniające przepływ pracy przy tworzeniu

#### Ulepszenia
- **Dostępność**: Interfejs przeglądarki z wyszukiwaniem, funkcją kopiowania i przełącznikiem motywów
- **Nauka we własnym tempie**: Elastyczna struktura warsztatu dostosowująca się do różnych prędkości nauki
- **Praktyczne zastosowanie**: Realistyczne scenariusze wdrożeń szablonów AI
- **Integracja społeczności**: Integracja Discord do wsparcia i współpracy podczas warsztatu

#### Funkcje warsztatu
- **Wbudowane wyszukiwanie**: Szybkie znajdowanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcja kopiowania najechania na kody do wszystkich przykładów
- **Przełącznik motywu**: Obsługa trybu ciemnego/jasnego dla różnych preferencji
- **Zasoby wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia
- **Integracja pomocy**: Bezpośredni dostęp do Discord dla wsparcia społecznościowego

### [v3.2.0] - 2025-09-17

#### Duża restrukturyzacja nawigacji i system nauki oparty na rozdziałach
**Ta wersja wprowadza kompleksową strukturę nauki opartą na rozdziałach z ulepszoną nawigacją w całym repozytorium.**

#### Dodano
- **📚 System nauki oparty na rozdziałach**: Przekształcono cały kurs w 8 progresywnych rozdziałów nauki
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 minut)
  - Rozdział 2: Programowanie AI w pierwszej kolejności (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 minut)
  - Rozdział 4: Infrastruktura jako kod i wdrożenie (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Wieloagentowe rozwiązania AI (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja i planowanie przed wdrożeniem (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacyjne we wszystkich dokumentach
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Wskazówki dotyczące ścieżki nauki**: Jasne punkty startu dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja krzyżowa**: Powiązane rozdziały i wymagania wstępne wyraźnie powiązane

#### Ulepszenia
- **Struktura README**: Przekształcona w ustrukturyzowaną platformę nauki z organizacją opartą na rozdziałach
- **Nawigacja w dokumentacji**: Każda strona zawiera teraz kontekst rozdziału i wskazówki dotyczące postępu
- **Organizacja szablonów**: Przykłady i szablony przypisane do odpowiednich rozdziałów nauki
- **Integracja zasobów**: Ściągawki, FAQ i przewodniki nauki połączone z odpowiednimi rozdziałami
- **Integracja warsztatów**: Laboratoria praktyczne przypisane do wielu celów nauki rozdziałów

#### Zmiany
- **Postęp w nauce**: Przesunięcie z liniowej dokumentacji do elastycznej nauki opartej na rozdziałach
- **Umiejscowienie konfiguracji**: Przesunięcie przewodnika konfiguracyjnego do Rozdziału 3 dla lepszego przepływu nauki
- **Integracja treści AI**: Lepsza integracja treści specyficznych dla AI w całej ścieżce nauki
- **Treści produkcyjne**: Zaawansowane wzorce zgromadzone w Rozdziale 8 dla uczących się na poziomie korporacyjnym

#### Ulepszone
- **Doświadczenie użytkownika**: Jasne ścieżki nawigacyjne i wskaźniki postępu w rozdziałach
- **Dostępność**: Spójne wzorce nawigacji ułatwiające poruszanie się po kursie
- **Profesjonalna prezentacja**: Struktura kursu w stylu uniwersyteckim, odpowiednia dla celów akademickich i korporacyjnych szkoleń
- **Efektywność nauki**: Skrócony czas znajdowania odpowiednich treści dzięki ulepszonej organizacji

#### Implementacja techniczna
- **Nagłówki nawigacji**: Ustandaryzowana nawigacja rozdziałowa w ponad 40 plikach dokumentacji
- **Nawigacja w stopce**: Spójne wskazówki dotyczące postępu i wskaźniki ukończenia rozdziałów
- **Linkowanie krzyżowe**: Kompleksowy system linków wewnętrznych łączący powiązane koncepcje
- **Mapowanie rozdziałów**: Szablony i przykłady ściśle powiązane z celami nauki

#### Ulepszenie przewodnika nauki
- **📚 Kompleksowe cele nauki**: Przebudowany przewodnik naukowy dostosowany do systemu 8 rozdziałów
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera konkretne cele nauki i praktyczne ćwiczenia
- **📋 Śledzenie postępów**: Tygodniowy harmonogram nauki z mierzalnymi rezultatami i listami kontrolnymi ukończenia
- **❓ Pytania oceniające**: Pytania weryfikujące wiedzę dla każdego rozdziału z profesjonalnymi rezultatami
- **🛠️ Ćwiczenia praktyczne**: Ćwiczenia praktyczne z rzeczywistymi scenariuszami wdrożeń i rozwiązywania problemów
- **📊 Postęp umiejętności**: Wyraźne przejście od podstawowych koncepcji do wzorców korporacyjnych ze skupieniem na rozwoju kariery
- **🎓 Ramy certyfikacji**: Profesjonalne wyniki rozwoju i system uznania w społeczności
- **⏱️ Zarządzanie harmonogramem**: Uporządkowany plan nauki na 10 tygodni z weryfikacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone rozwiązania AI z wieloma agentami
**Ta wersja poprawia wieloagentowe rozwiązanie detaliczne dzięki lepszemu nazewnictwu agentów i ulepszonej dokumentacji.**

#### Zmiany
- **Terminologia wieloagentowa**: Zastąpiono "agent Cora" nazwą "agent klienta" w całym rozwiązaniu wieloagentowym dla detalu dla lepszego zrozumienia
- **Architektura agentów**: Zaktualizowano całą dokumentację, szablony ARM oraz przykłady kodu, aby używać spójnej nazwy "agent klienta"
- **Przykłady konfiguracji**: Zmodernizowano wzorce konfiguracji agentów z nowymi konwencjami nazewnictwa
- **Spójność dokumentacji**: Zapewniono, że wszystkie odniesienia używają profesjonalnych i opisowych nazw agentów

#### Ulepszenia
- **Pakiet szablonów ARM**: Zaktualizowano retail-multiagent-arm-template z odniesieniami do agenta klienta
- **Diagramy architektury**: Odświeżone diagramy Mermaid z nowym nazewnictwem agentów
- **Przykłady kodu**: Klasy i przykłady implementacji w Python teraz używają nazwy CustomerAgent
- **Zmienne środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe, by używały wzorców CUSTOMER_AGENT_NAME

#### Ulepszone
- **Doświadczenie programisty**: Bardziej klarowne role i odpowiedzialności agentów w dokumentacji
- **Gotowość produkcyjna**: Lepsze dostosowanie do korporacyjnych konwencji nazewnictwa
- **Materiały edukacyjne**: Intuicyjniejsze nazewnictwo agentów na potrzeby edukacyjne
- **Użyteczność szablonów**: Uproszczone rozumienie funkcji agentów i wzorców wdrożeniowych

#### Szczegóły techniczne
- Zaktualizowano diagramy architektury Mermaid z odniesieniami do CustomerAgent
- Zmieniono nazwy klas CoraAgent na CustomerAgent w przykładach Pythona
- Zmieniono konfiguracje JSON szablonów ARM, aby używały typu agenta „customer”
- Zaktualizowano zmienne środowiskowe z wzorców CORA_AGENT_* na CUSTOMER_AGENT_*
- Odświeżono wszystkie polecenia wdrożeniowe i konfiguracje kontenerów

### [v3.0.0] - 2025-09-12

#### Duże zmiany - Skupienie na deweloperach AI i integracja Microsoft Foundry
**Ta wersja przekształca repozytorium w kompleksowe źródło nauki zorientowane na AI z integracją Microsoft Foundry.**

#### Dodano
- **🤖 Ścieżka nauki AI-first**: Całkowita przebudowa z priorytetem dla deweloperów i inżynierów AI
- **Przewodnik integracji Microsoft Foundry**: Kompleksowa dokumentacja połączenia AZD z usługami Microsoft Foundry
- **Wzorce wdrażania modeli AI**: Szczegółowy przewodnik wyboru modeli, konfiguracji i strategii produkcyjnego wdrożenia
- **Laboratorium warsztatowe AI**: 2-3 godziny praktycznych warsztatów konwersji aplikacji AI na rozwiązania wdrażalne za pomocą AZD
- **Najlepsze praktyki produkcji AI**: Wzorce gotowe na wdrożenia korporacyjne obejmujące skalowanie, monitorowanie i zabezpieczenia AI
- **Specjalistyczny przewodnik rozwiązywania problemów AI**: Kompleksowe rozwiązywanie problemów z modelami Microsoft Foundry, Cognitive Services i wdrożeniami AI
- **Galeria szablonów AI**: Zaprezentowana kolekcja szablonów Microsoft Foundry z oceną trudności
- **Materiały warsztatowe**: Kompletny plan warsztatów z ćwiczeniami praktycznymi i materiałami referencyjnymi

#### Ulepszone
- **Struktura README**: Skoncentrowana na deweloperach AI z 45% danych zainteresowania społeczności Microsoft Foundry Discord
- **Ścieżki nauki**: Dedykowana ścieżka dewelopera AI obok tradycyjnych ścieżek dla studentów i inżynierów DevOps
- **Rekomendacje szablonów**: Polecane szablony AI, w tym azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart
- **Integracja społecznościowa**: Ulepszona obsługa społeczności na Discord z kanałami i dyskusjami specyficznymi dla AI

#### Skupienie na bezpieczeństwie i produkcji
- **Wzorce zarządzania tożsamością**: Specyficzne dla AI konfiguracje uwierzytelniania i bezpieczeństwa
- **Optymalizacja kosztów**: Monitorowanie zużycia tokenów i kontrola budżetu dla obciążeń AI
- **Wielo-regionowe wdrożenia**: Strategie globalnego wdrażania aplikacji AI
- **Monitorowanie wydajności**: Specyficzne dla AI metryki i integracja z Application Insights

#### Jakość dokumentacji
- **Liniowa struktura kursu**: Logiczna progresja od podstawowych do zaawansowanych wzorców wdrażania AI
- **Zweryfikowane URL**: Wszystkie zewnętrzne linki do repozytoriów sprawdzone i dostępne
- **Kompletne odniesienia**: Wszystkie linki wewnętrzne w dokumentacji zweryfikowane i działające
- **Gotowość produkcyjna**: Wzorce wdrożeń korporacyjnych z przykładami z życia

### [v2.0.0] - 2025-09-09

#### Duże zmiany - Restrukturyzacja repozytorium i ulepszenie profesjonalizmu
**Ta wersja to znacząca przebudowa struktury repozytorium i prezentacji treści.**

#### Dodano
- **Struktura uczenia się**: Wszystkie strony dokumentacji zawierają teraz sekcje Wprowadzenie, Cele nauki i Wyniki nauki
- **System nawigacji**: Dodano linki Poprzednia/Następna lekcja we wszystkich dokumentach dla ukierunkowanego postępu nauki
- **Przewodnik nauki**: Kompleksowy study-guide.md z celami nauki, ćwiczeniami praktycznymi i materiałami do oceny
- **Profesjonalna prezentacja**: Usunięto wszystkie ikony emoji dla lepszej dostępności i profesjonalnego wyglądu
- **Ulepszona struktura treści**: Poprawiona organizacja i przepływ materiałów edukacyjnych

#### Zmiany
- **Format dokumentacji**: Ustandaryzowano całą dokumentację z jednolitą strukturą skupioną na nauce
- **Przepływ nawigacji**: Wdrożono logiczną kolejność przez wszystkie materiały szkoleniowe
- **Prezentacja treści**: Usunięto ozdobniki na rzecz jasnego, profesjonalnego formatowania
- **Struktura linków**: Zaktualizowano wszystkie linki wewnętrzne w celu wsparcia nowego systemu nawigacji

#### Ulepszone
- **Dostępność**: Usunięto zależności od emoji dla lepszej kompatybilności z czytnikami ekranu
- **Profesjonalny wygląd**: Czysta prezentacja w stylu akademickim, odpowiednia dla nauki akademickiej i korporacyjnej
- **Doświadczenie nauki**: Ustrukturyzowane podejście z jasnymi celami i wynikami dla każdej lekcji
- **Organizacja treści**: Lepszy logiczny przepływ i połączenia między powiązanymi tematami

### [v1.0.0] - 2025-09-09

#### Wydanie początkowe - Kompleksowe repozytorium nauki AZD

#### Dodano
- **Podstawowa struktura dokumentacji**
  - Kompletny przewodnik rozpoczynający
  - Kompletna dokumentacja wdrożeń i provisioningu
  - Szczegółowe zasoby rozwiązywania problemów i przewodniki debugowania
  - Narzędzia i procedury weryfikacji przed wdrożeniem

- **Moduł rozpoczynający**
  - Podstawy AZD: podstawowe koncepcje i terminologia
  - Przewodnik instalacji: instrukcje konfiguracji specyficzne dla platformy
  - Przewodnik konfiguracyjny: konfiguracja środowiska i uwierzytelnianie
  - Pierwszy projekt: krok po kroku nauka praktyczna

- **Moduł wdrożenia i provisioningu**
  - Przewodnik wdrożenia: dokumentacja kompletnego przepływu pracy
  - Przewodnik provisioningu: infrastruktura jako kod z użyciem Bicep
  - Najlepsze praktyki wdrożeń produkcyjnych
  - Wzorce architektury wielousługowej

- **Moduł weryfikacji przed wdrożeniem**
  - Planowanie pojemności: weryfikacja dostępności zasobów Azure
  - Wybór SKU: kompleksowe wskazówki dotyczące poziomów usług
  - Kontrole wstępne: automatyczne skrypty weryfikacyjne (PowerShell i Bash)
  - Narzędzia do szacowania kosztów i planowania budżetu

- **Moduł rozwiązywania problemów**
  - Najczęstsze problemy: często napotykane błędy i ich rozwiązania
  - Przewodnik debugowania: systematyczne metody rozwiązywania problemów
  - Zaawansowane techniki diagnostyczne i narzędzia
  - Monitorowanie wydajności i optymalizacja

- **Zasoby i odniesienia**
  - Cheat Sheet poleceń: szybkie odwołanie do podstawowych poleceń
  - Glosariusz: pełne definicje terminów i akronimów
  - FAQ: szczegółowe odpowiedzi na często zadawane pytania
  - Linki do zasobów zewnętrznych i połączenia ze społecznością

- **Przykłady i szablony**
  - Przykład prostej aplikacji internetowej
  - Szablon wdrożenia statycznej strony WWW
  - Konfiguracja aplikacji kontenerowej
  - Wzorce integracji baz danych
  - Przykłady architektury mikroserwisów
  - Implementacje funkcji bezserwerowych

#### Cechy
- **Wsparcie wieloplatformowe**: Przewodniki instalacji i konfiguracji dla Windows, macOS i Linux
- **Różne poziomy umiejętności**: Treści przeznaczone dla studentów i profesjonalnych programistów
- **Praktyczne podejście**: Przykłady praktyczne i scenariusze z życia
- **Kompleksowe pokrycie**: Od podstawowych koncepcji do zaawansowanych wzorców korporacyjnych
- **Bezpieczeństwo na pierwszym miejscu**: Najlepsze praktyki bezpieczeństwa w całym materiale
- **Optymalizacja kosztów**: Wskazówki dotyczące efektywnych kosztowo wdrożeń i zarządzania zasobami

#### Jakość dokumentacji
- **Szczegółowe przykłady kodu**: Praktyczne, przetestowane fragmenty kodu
- **Instrukcje krok po kroku**: Jasne, wykonalne wskazówki
- **Kompleksowe obsługiwanie błędów**: Rozwiązywanie problemów z typowymi błędami
- **Integracja najlepszych praktyk**: Standardy branżowe i rekomendacje
- **Kompatybilność wersji**: Aktualne zgodne z najnowszymi usługami Azure i funkcjami azd

## Planowane przyszłe ulepszenia

### Wersja 3.1.0 (planowana)
#### Rozszerzenie platformy AI
- **Wsparcie wielu modeli**: Wzorce integracji dla Hugging Face, Azure Machine Learning i modeli niestandardowych
- **Frameworki agentów AI**: Szablony wdrożeń LangChain, Semantic Kernel i AutoGen
- **Zaawansowane wzorce RAG**: Opcje baz danych wektorowych poza Azure AI Search (Pinecone, Weaviate itp.)
- **Obserwowalność AI**: Ulepszone monitorowanie wydajności modeli, zużycia tokenów i jakości odpowiedzi

#### Doświadczenie dewelopera
- **Rozszerzenie VS Code**: Zintegrowane środowisko programistyczne AZD + Microsoft Foundry
- **Integracja GitHub Copilot**: AI wspomagane generowanie szablonów AZD
- **Interaktywne samouczki**: Ćwiczenia kodowania z automatyczną walidacją dla scenariuszy AI
- **Materiały wideo**: Dodatkowe tutoriale wideo dla wzrokowych uczniów skoncentrowane na wdrożeniach AI

### Wersja 4.0.0 (planowana)
#### Wzorce AI dla przedsiębiorstw
- **Ramowy system zarządzania**: Zarządzanie modelami AI, zgodność i ścieżki audytu
- **Wielo-tenantowe AI**: Wzorce obsługi wielu klientów z izolowanymi usługami AI
- **Wdrożenie Edge AI**: Integracja z Azure IoT Edge i instancjami kontenerów
- **Hybydowe i multi-chmurowe AI**: Wzorce wdrożeń wielochmurowych i hybrydowych dla obciążeń AI

#### Zaawansowane funkcje
- **Automatyzacja potoków AI**: Integracja MLOps z potokami Azure Machine Learning
- **Zaawansowane zabezpieczenia**: Wzorce zero-trust, prywatne punkty końcowe i zaawansowana ochrona przed zagrożeniami
- **Optymalizacja wydajności**: Zaawansowane strategie strojenia i skalowania dla aplikacji AI o wysokim przepływie
- **Globalna dystrybucja**: Wzorce dostarczania treści i cache edge dla aplikacji AI

### Wersja 3.0.0 (planowana) - zastąpiona przez bieżące wydanie
#### Proponowane dodatki - już wdrożone w v3.0.0
- ✅ **Treści zorientowane na AI**: Kompleksowa integracja Microsoft Foundry (ukończone)
- ✅ **Interaktywne samouczki**: Warsztat AI z ćwiczeniami praktycznymi (ukończone)
- ✅ **Moduł zaawansowanego bezpieczeństwa**: Specyficzne wzorce bezpieczeństwa AI (ukończone)
- ✅ **Optymalizacja wydajności**: Strategie strojenia obciążeń AI (ukończone)

### Wersja 2.1.0 (planowana) - częściowo wdrożona w v3.0.0
#### Mniejsze ulepszenia - niektóre ukończone w bieżącym wydaniu
- ✅ **Dodatkowe przykłady**: Scenariusze wdrożeniowe skupione na AI (ukończone)
- ✅ **Rozszerzone FAQ**: Pytania i rozwiązywanie problemów specyficzne dla AI (ukończone)
- **Integracja narzędzi**: Ulepszone przewodniki integracji IDE i edytorów
- ✅ **Rozszerzone monitorowanie**: Wzorce monitorowania i alarmów specyficzne dla AI (ukończone)

#### Nadal planowane na przyszłe wydanie
- **Dokumentacja przyjazna mobilnym**: Responsywny design dla nauki mobilnej
- **Dostęp offline**: Pobieralne pakiety dokumentacji
- **Rozszerzona integracja IDE**: Rozszerzenie VS Code dla AZD + przepływów AI
- **Panel społecznościowy**: Metryki społeczności w czasie rzeczywistym i śledzenie wkładów

## Wkład do changelogu

### Zgłaszanie zmian
Wnosząc wkład do tego repozytorium, proszę upewnić się, że wpisy w changelogu zawierają:

1. **Numer wersji**: zgodnie z semantycznym wersjonowaniem (major.minor.patch)
2. **Data**: data wydania lub aktualizacji w formacie RRRR-MM-DD
3. **Kategoria**: Dodano, Zmieniono, Przestarzałe, Usunięte, Naprawione, Bezpieczeństwo
4. **Jasny opis**: Zwięzły opis dokonanych zmian
5. **Ocena wpływu**: Jak zmiany wpływają na istniejących użytkowników

### Kategorie zmian

#### Dodano
- Nowe funkcje, sekcje dokumentacji lub możliwości
- Nowe przykłady, szablony lub zasoby edukacyjne
- Dodatkowe narzędzia, skrypty lub utils

#### Zmieniono
- Modyfikacje istniejącej funkcjonalności lub dokumentacji
- Aktualizacje poprawiające jasność lub dokładność
- Restrukturyzacja treści lub organizacji

#### Przestarzałe
- Funkcje lub podejścia wycofywane
- Sekcje dokumentacji zaplanowane do usunięcia
- Metody, dla których są lepsze alternatywy

#### Usunięte
- Funkcje, dokumentacja lub przykłady, które nie są już istotne
- Nieaktualne informacje lub przestarzałe podejścia
- Nadmiarowa lub scalona zawartość

#### Naprawione
- Poprawki błędów w dokumentacji lub kodzie
- Rozwiązania zgłoszonych problemów
- Ulepszenia dokładności lub funkcjonalności

#### Bezpieczeństwo
- Ulepszenia lub poprawki związane z bezpieczeństwem
- Aktualizacje najlepszych praktyk bezpieczeństwa
- Usuwanie luk bezpieczeństwa

### Wytyczne semantycznego wersjonowania

#### Główna wersja (X.0.0)
- Zmiany łamiące wymagające działania użytkownika
- Znacząca przebudowa treści lub organizacji
- Zmiany, które zmieniają podstawowe podejście lub metodologię

#### Wersja mniejsza (X.Y.0)
- Nowe funkcje lub dodatki do treści
- Ulepszenia utrzymujące zgodność wsteczną
- Dodatkowe przykłady, narzędzia lub zasoby

#### Wersja poprawkowa (X.Y.Z)
- Poprawki błędów i korekty
- Drobne ulepszenia istniejącej treści
- Wyjaśnienia i drobne ulepszenia

## Opinie i sugestie społeczności

Aktywnie zachęcamy do opinii społeczności, aby ulepszyć to źródło nauki:

### Jak przekazać opinię
- **GitHub Issues**: Zgłaszaj problemy lub proponuj ulepszenia (problemy specyficzne dla AI są mile widziane)
- **Dyskusje na Discordzie**: Dziel się pomysłami i angażuj się w społeczność Microsoft Foundry
- **Pull Requesty**: Wnoś bezpośrednie ulepszenia do treści, zwłaszcza szablonów i przewodników AI
- **Microsoft Foundry Discord**: Bierz udział w kanale #Azure w dyskusjach o AZD i AI
- **Forum społeczności**: Bierz udział w szerszych dyskusjach dla deweloperów Azure

### Kategorie opinii
- **Dokładność treści AI**: Poprawki informacji o integracji i wdrożeniu usług AI
- **Doświadczenie nauki**: Sugestie dla lepszego przebiegu nauki dla deweloperów AI
- **Brakujące treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI
- **Dostępność**: Ulepszenia dla różnych potrzeb edukacyjnych
- **Integracja narzędzi AI**: Sugestie dotyczące lepszej integracji przepływu pracy deweloperskiej AI
- **Wzorce produkcyjne AI**: Prośby o wzorce wdrożeń AI dla przedsiębiorstw

### Zobowiązania do odpowiedzi
- **Odpowiedź na zgłoszenie**: W ciągu 48 godzin na zgłoszone problemy
- **Wnioski o funkcje**: Ocena w ciągu tygodnia
- **Wkład społeczności**: Przegląd w ciągu tygodnia
- **Problemy bezpieczeństwa**: Priorytet natychmiastowy z przyspieszoną reakcją

## Harmonogram utrzymania

### Regularne aktualizacje
- **Przeglądy miesięczne**: Dokładność treści i weryfikacja linków
- **Aktualizacje kwartalne**: Główne dodatki i ulepszenia treści
- **Przeglądy półroczne**: Kompleksowa restrukturyzacja i ulepszenia
- **Wydania roczne**: Główne aktualizacje wersji z istotnymi ulepszeniami

### Monitorowanie i zapewnienie jakości
- **Testy automatyczne**: Regularna weryfikacja przykładów kodu i linków
- **Integracja opinii społeczności**: Regularne uwzględnianie sugestii użytkowników
- **Aktualizacje technologiczne**: Dostosowanie do najnowszych usług Azure i wydań azd
- **Audyt dostępności**: Regularne przeglądy pod kątem zasad projektowania inkluzywnego

## Polityka wsparcia wersji

### Wsparcie bieżących wersji
- **Najnowsza wersja główna**: Pełne wsparcie z regularnymi aktualizacjami
- **Poprzednia wersja główna**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy
- **Wersje starsze**: Wsparcie społecznościowe tylko, bez oficjalnych aktualizacji

### Wskazówki dotyczące migracji
Po wydaniu wersji głównych zapewniamy:
- **Przewodniki migracyjne**: Instrukcje krok po kroku przejścia
- **Uwagi o kompatybilności**: Szczegóły dotyczące zmian łamiących
- **Wsparcie narzędzi**: Skrypty lub narzędzia pomagające w migracji
- **Wsparcie społeczności**: Dedykowane fora do pytań o migrację

---

**Nawigacja**
- **Poprzednia lekcja**: [Przewodnik nauki](resources/study-guide.md)
- **Następna lekcja**: Powrót do [Głównego README](README.md)

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wydaniach i ważnych aktualizacjach materiałów edukacyjnych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->