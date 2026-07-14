# Dziennik zmian - AZD dla początkujących

## Wprowadzenie

Ten dziennik zmian dokumentuje wszystkie znaczące zmiany, aktualizacje i usprawnienia w repozytorium AZD dla początkujących. Stosujemy zasady wersjonowania semantycznego i utrzymujemy ten zapis, aby pomóc użytkownikom zrozumieć, co zmieniło się między wersjami.

## Cele nauki

Przeglądając ten dziennik zmian, będziesz:
- Na bieżąco z nowymi funkcjami i dodatkami do treści
- Rozumieć ulepszenia w istniejącej dokumentacji
- Śledzić poprawki błędów i korekty zapewniające dokładność
- Obserwować ewolucję materiałów edukacyjnych w czasie

## Rezultaty nauki

Po przejrzeniu wpisów w dzienniku zmian, będziesz potrafił:
- Zidentyfikować nową zawartość i dostępne zasoby do nauki
- Rozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować ścieżkę nauki na podstawie najbardziej aktualnych materiałów
- Wnosić uwagi i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.23.0] - 2026-07-13

#### Odświeżenie AZD 1.27.1: Aktualizacja wersji
**Ta wersja ponownie weryfikuje kurs względem `azd` `1.27.1` (lipiec 2026, najnowsze stabilne wydanie) oraz obecnego podglądowego rozszerzenia agenta AI `azure.ai.agents` `1.0.0-beta.5`, aktualizując każdy baner "zweryfikowany względem" po wydaniach 1.26.0, 1.27.0 i 1.27.1.**

#### Zmiany
- **✅ Zaktualizowano punkt odniesienia walidacji** z `azd 1.25.6` (czerwiec 2026) do `azd 1.27.1` (lipiec 2026) w głównym README, wszystkich README rozdziałów, lekcji o dev-container w Rozdziale 1 (włącznie z przykładami z przypiętymi wersjami), lekcji o szablonach niestandardowych w Rozdziale 4, lekcji o wielu agentach w Rozdziale 5 oraz w dokumentacji warsztatowej
- **🤖 Odświeżono punkt odniesienia Rozdziału 2** z `azd 1.23.12` (marzec 2026) do `azd 1.27.1` w `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` oraz `microsoft-foundry-integration.md`; daty uwag walidacyjnych zaktualizowano na 2026-07-13
- **🧩 Podniesiono wersję rozszerzenia agenta AI** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` do aktualnego wydania `1.0.0-beta.5` w README i `agents.md` Rozdziału 2
- **🧪 Zaktualizowano przykład walidacji warsztatu** (`wyjście azd version`) do `1.27.1`

#### Uwagi dotyczące istotnych wydań azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Wsparcie Go dla Azure Functions w Flex Consumption, filtry subskrypcji na najemcę `azd config sub-filter`, samodzielne pakiety rozszerzeń (`azd x pack --bundle`), oraz `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelowanie projektów/agentów Azure AI Foundry bez Bicep/Terraform (`azure.yaml`), wsparcie wdrożeń kontenerów dla App Service (`host: appservice` + `language: docker`), bezpośrednie `-s/--source` do poleceń `azd extension`, oraz `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flaga `--no-dependencies` dla `azd extension install`, domyślne wykluczenie przestarzałych modeli z katalogu/promptów limitów, oraz kilka poprawek błędów

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

#### Wypełnienie luk dla początkujących #2: Tworzenie szablonów, dev-containery, Pulumi, Azure DevOps, konta usługi i więcej
**Ta wersja zamyka pozostałe luki średniozaawansowane wykryte przez analizę pokrycia azd: jak tworzyć i publikować własny szablon, odtwarzalne środowiska dev-container/Codespaces, dostawcę infrastruktury Pulumi, przegląd CI/CD w Azure DevOps, uwierzytelnianie przez konta usługi, wskazówki dotyczące wyboru hosta (AKS/Spring Apps), wyjaśnienia `azd restore`/`azd package`, obsługę błędów hooków, oraz praktyki zespołowe/udostępnionych środowisk.**

#### Dodano
- **🧱 Nowa lekcja Rozdziału 4** `docs/chapter-04-infrastructure/custom-templates.md` — tworzenie własnego szablonu azd: wymagana struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametryzacja infrastruktury za pomocą tokena zasobu `uniqueString()` oraz tagu `azd-env-name`, lokalne testy z `azd init --template <local-path>`, publikowanie na GitHub oraz zgłaszanie do galerii Awesome AZD
- **📦 Nowa lekcja Rozdziału 1** `docs/chapter-01-foundation/dev-containers.md` — odtwarzalne środowiska azd z Dev Containers i GitHub Codespaces: minimalistyczny `.devcontainer/devcontainer.json` używający oficjalnej funkcji `ghcr.io/azure/azure-dev/azd`, funkcje specyficzne dla języków, `docker-in-docker` dla hostów kontenerów, oraz `azd auth login --use-device-code` do zdalnego logowania
- **🧩 Pulumi z azd** sekcja w `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, układ folderów Pulumi, stacki mapowane na środowiska azd, wymagane outputs/tagowanie, oraz identyczny workflow `azd up` / `azd down`
- **🎯 Wskazówki dotyczące wyboru hosta** w `docs/chapter-04-infrastructure/provisioning.md` — przyjazne dla początkujących porównanie `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` i `springapp`, wraz z rekomendacjami kiedy wybrać AKS lub Azure Spring Apps
- **🛠️ Przewodnik CI/CD Azure DevOps** w `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, połączenie usług z federacją identyfikacji obciążenia (OIDC), wygenerowany `azure-dev.yml`, oraz konfiguracja grupy zmiennych
- **🔑 Konta usługi (wzorzec 4)** dodane do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, nieinteraktywne `azd auth login` z sekretem klienta vs. dane uwierzytelniające federowane/OIDC, kiedy korzystać oraz bezpieczne przechowywanie poświadczeń
- **🪝 Obsługa błędów hooków** podsekcja w `docs/chapter-04-infrastructure/deployment-guide.md` — kody wyjścia i `set -e`, `continueOnError`, testowanie hooków w izolacji za pomocą `azd hooks run`, powłoki zależne od OS, oraz `--debug`
- **👥 Zespołowe / udostępnione środowiska** sekcja w `docs/chapter-03-configuration/configuration.md` — co znajduje się w `.azure/`, co ignorować w git, środowiska per deweloper, `azd env list`/`select`, oraz dostarczanie wartości środowiskowych w CI/CD
- **🧰 Wyjaśnienia `azd restore` i rozszerzonego `azd package`** w `resources/cheat-sheet.md` — przywracanie zależności i budowanie artefaktu do wdrożenia bez wdrażania

#### Zmiany
- **🧭 Zaktualizowano tabelę lekcji Rozdziału 4** o nową lekcję „Tworzenie własnego szablonu” (Lekcja 3)
- **🧭 Zaktualizowano tabelę lekcji Rozdziału 1** o nową lekcję „Dev Containers & Codespaces” (Lekcja 5); stopki nawigacyjne połączone między `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Wypełnienie luk dla początkujących: praktyczna lekcja o wielu agentach, „Przynieś własną aplikację”, Terraform i przewodnik CI/CD
**Ta wersja zamyka największe luki w kompletnym przewodniku dla początkujących, dodając dwie nowe praktyczne lekcje (przejście wdrożeniowe wielu agentów i dodanie azd do istniejącej aplikacji), przyjazne wprowadzenie do hooków, sekcję Terraform z azd, krok po kroku przewodnik potoków GitHub Actions, wyjaśnienie nowych rozszerzeń podglądowych oraz wyraźną listę kontrolną weryfikacji wdrożenia.**

#### Dodano
- **🤝 Nowa lekcja Rozdziału 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — całkowicie praktyczne, możliwe do wdrożenia przejście dwoma agentami (koordynator + specjaliści) z użyciem realnego szablonu (`contoso-creative-writer`), obejmujące kiedy używać wielu agentów, workflow `azd up`, zrozumienie wdrożonych zasobów, śledzenie między agentami, dostosowywanie i sprzątanie
- **📦 Nowa lekcja Rozdziału 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak dodać azd do istniejącego projektu za pomocą `azd init` („użyj kodu w bieżącym katalogu”), zrozumienie `azure.yaml` i `infra/`, `azd infra generate`, wykrywanie hosta, i wdrażanie z `azd up`
- **🌐 Sekcja Terraform z azd** dodana do `docs/chapter-04-infrastructure/provisioning.md` — konfiguracja `infra.provider: terraform`, układ folderów `.tf`, wymagane outputs `AZURE_*` i tagowanie `azd-env-name`, oraz identyczny workflow `azd up` / `azd down` (zamyka lukę, gdzie deklarowano wsparcie Terraform, a pokazywano tylko Bicep)
- **⚙️ Przewodnik krok po kroku GitHub Actions** w `docs/chapter-08-production/production-ai-practices.md` — od repozytorium GitHub do zautomatyzowanych wdrożeń: `azd pipeline config`, federowane poświadczenia OIDC (bez przechowywanych sekretów), wygenerowany `azure-dev.yml`, oraz wskazówki dotyczące sekretów vs zmiennych
- **🪝 Przyjazne dla początkujących wprowadzenie do hooków** w `docs/chapter-04-infrastructure/deployment-guide.md` — czym jest hook, tabela etapów hooków, minimalny pierwszy hook, oraz ręczne uruchamianie hooków za pomocą `azd hooks run`
- **✅ Dodano listę kontrolną „Zweryfikuj swoje wdrożenie”** do Kroku 5 `docs/chapter-01-foundation/first-project.md` — test dymny, sprawdzenie punktu końcowego stanu zdrowia, oraz wyraźne kryteria sukcesu
- **🧩 Wyjaśnienie nowych rozszerzeń podglądowych** `azure.ai.skills` i `azure.ai.connections` (czym są i kiedy ich używać) w `docs/chapter-08-production/production-ai-practices.md`

#### Zmiany
- **🧭 Skorygowano tabelę lekcji Rozdziału 5**: `multi-agent-basics.md` jest teraz Lekcją 1 (jedyną w pełni praktyczną), z uczciwym oznaczeniem, że Lekcja 2 znajduje się w Rozdziale 6, a scenariusz Retail to szablon architektury, a nie szablon jednopoleceniowy
- **🧭 Tabela lekcji Rozdziału 1** teraz zawiera nową lekcję „Przynieś własną aplikację” (Lekcja 4)
- **🔗 Zaktualizowano stopki nawigacyjne**: `first-project.md` teraz ma link do przodu do `bring-your-own-app.md`

#### Poprawiono
- **🧱 Zamknięta luka Terraform „zadeklarowana, ale niedostępna”** — kurs wcześniej odnosił się do wsparcia Terraform, nie pokazując go
- **🔀 Skorygowano mylące krzyżowe odniesienia w Rozdziale 5** sugerujące istnienie kompletnej implementacji wielu agentów, gdy był tylko szablon architektury

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

**Ta wersja ponownie weryfikuje kurs względem `azd` `1.25.6` (czerwiec 2026) i rozszerzenia `azure.ai.agents` `0.1.40-preview`, rozszerza wskazówki dotyczące SI z „szkieletu agenta” na cały cykl życia agenta (test → ocena → optymalizacja → inspekcja → usuwanie), prezentuje nowe wersje zapoznawcze rozszerzeń `azure.ai.skills` i `azure.ai.connections` oraz odnotowuje rebranding produktu z ".NET Aspire" na "Aspire".**

#### Dodano
- **🔁 Pełne pokrycie cyklu życia agenta** dla początkujących i inżynierów AI w całej dokumentacji:
  - `docs/chapter-01-foundation/azd-basics.md` — Dodano tabelę cyklu życia (szkielet → test → pomiar → ulepszenie → inspekcja → sprzątanie) do sekcji Rozszerzenia i Polecenia AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nowa sekcja "Zarządzanie cyklem życia agenta" obejmująca `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` oraz `delete --force`
  - `resources/cheat-sheet.md` — Rozszerzone polecenia agenta AI o `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` oraz `delete --force`
- **🧩 Nowe rozszerzenia wersji zapoznawczej** udokumentowane: `azure.ai.skills` (ponownie używalne umiejętności agenta) i `azure.ai.connections` (połączenia Foundry) dodane do tabeli rozszerzeń i ściągawki
- **⏱️ Wskazówki dotyczące czasu odpowiedzi** — przykłady `azd ai agent invoke` teraz pokazują całkowite opóźnienie oraz czas do pierwszego bajtu
- **📌 Banner wersji** w głównym README kierujący uczących się do `azd version` i `azd upgrade`

#### Zmieniono
- **✅ Zaktualizowano bazę walidacji** z `azd 1.23.12` (marzec 2026) do `azd 1.25.6` (czerwiec 2026) we wszystkich README rozdziałów i dokumentacji warsztatowej
- **🤖 Zaktualizowano notatkę w rozdziale 2 dotyczącą rozszerzenia** z `azure.ai.agents` `0.1.18-preview` do `0.1.40-preview`
- **🧪 Zaktualizowano przykład walidacji warsztatu** (wynik `azd version`) do `1.25.6`
- **🧭 Odświeżono README „Co nowego w azd dziś”** podkreślając pełen cykl życia agenta, nowe rozszerzenia AI i ostatnie poprawki jakości życia (`azd init` idempotencja, czyszczenie przeterminowanego tokena w `azd auth login`, prompt przy pierwszym uruchomieniu `azd tool`)
- **📖 Rozdział 2 agents.md (Opcja 4)** teraz kieruje uczących się do poleceń cyklu życia po wdrożeniu zamiast zatrzymywać się na `azd up`

#### Naprawiono
- **🏷️ Nazewnictwo produktu** — dodano notatkę o rebrandingu Aspire (".NET Aspire" to teraz po prostu "Aspire"); wsparcie azd dla Aspire pozostaje bez zmian
- **🔎 Walidacja na żywo wydania** potwierdzona względem strumienia wydań Azure Developer CLI: stabilne CLI `1.25.6` (2026-06-12) oraz `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Wyjaśnienia dla początkujących, weryfikacja konfiguracji i finalne porządki poleceń AZD
**Ta wersja kontynuuje przegląd walidacji AZD 1.23, koncentrując się na dokumentacji dla początkujących: wyjaśnia wskazówki dotyczące uwierzytelniania w AZD, dodaje lokalne skrypty weryfikujące konfigurację, weryfikuje kluczowe polecenia względem działającego AZD CLI oraz usuwa ostatnie przestarzałe odniesienia do poleceń w języku angielskim poza changelogiem.**

#### Dodano
- **🧪 Skrypty walidacji konfiguracji dla początkujących** z `validate-setup.ps1` i `validate-setup.sh`, dzięki którym uczący się mogą potwierdzić wymagane narzędzia przed rozpoczęciem Rozdziału 1
- **✅ Wstępne kroki weryfikacji konfiguracji** w głównym README i README Rozdziału 1, aby brakujące wymagania zostały wykryte przed `azd up`

#### Zmieniono
- **🔐 Wskazówki dotyczące uwierzytelniania dla początkujących** — teraz konsekwentnie traktują `azd auth login` jako główną ścieżkę dla przepływów AZD, a `az login` jest opcjonalne, chyba że używa się bezpośrednio poleceń Azure CLI
- **📚 Przepływ onboardingu w Rozdziale 1** teraz kieruje uczących się do weryfikacji lokalnej konfiguracji przed instalacją, uwierzytelnianiem i pierwszym wdrożeniem
- **🛠️ Wiadomości walidatora** teraz wyraźnie oddzielają wymagania blokujące od opcjonalnych ostrzeżeń Azure CLI dla ścieżki początkujących korzystających tylko z AZD
- **📖 Dokumentacja konfiguracji, rozwiązywania problemów i przykładów** teraz rozróżnia wymaganą autoryzację AZD i opcjonalne logowanie Azure CLI tam, gdzie wcześniej oba były prezentowane bez kontekstu

#### Naprawiono
- **📋 Pozostałe odniesienia do poleceń w języku angielskim** zaktualizowane do aktualnych form AZD, w tym `azd config show` w ściągawce i `azd monitor --overview` tam, gdzie wskazania dotyczące Azure Portal miały być przeglądem
- **🧭 Stwierdzenia dotyczące początkujących w Rozdziale 1** złagodzone, aby unikać obietnic gwarantowanego braku błędów lub zachowania rollbacku we wszystkich szablonach i zasobach Azure
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

#### Walidacja AZD 1.23.12, rozszerzenie środowiska warsztatu i odświeżenie modelu AI
**Ta wersja wykonuje przegląd walidacyjny dokumentacji względem `azd` `1.23.12`, aktualizuje przestarzałe przykłady poleceń AZD, odnawia wskazówki dotyczące modeli AI do domyślnych ustawień oraz rozszerza instrukcje warsztatowe poza GitHub Codespaces, by objąć także dev containers i lokalne klony.**

#### Dodano
- **✅ Notatki walidacyjne w kluczowych rozdziałach i dokumentach warsztatowych** aby zrobić jawne odniesienie do testowanej wersji AZD dla osób używających nowszych lub starszych buildów CLI
- **⏱️ Wskazówki dotyczące limitu czasu wdrożenia** dla długotrwałych wdrożeń aplikacji AI, używając `azd deploy --timeout 1800`
- **🔎 Kroki inspekcji rozszerzeń** z `azd extension show azure.ai.agents` w dokumentacji workflow AI
- **🌐 Szersze wskazówki dotyczące środowiska warsztatowego** obejmujące GitHub Codespaces, dev containers oraz lokalne klony z MkDocs

#### Zmieniono
- **📚 Wstępne README rozdziałów** teraz konsekwentnie notują walidację względem `azd 1.23.12` w sekcjach fundamentów, konfiguracji, infrastruktury, multi-agenta, przedwdrożeniowych, rozwiązywania problemów oraz produkcyjnych
- **🛠️ Odniesienia do poleceń AZD** zaktualizowane do aktualnych form w dokumentacji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` lub `azd env get-value(s)` w zależności od kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, gdzie ma być przegląd Application Insights
- **🧪 Przykłady provision preview** uproszczone do obecnie wspieranych, takich jak `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Przepływ warsztatowy** zaktualizowany tak, by uczący się mogli wykonywać ćwiczenia w Codespaces, dev containerze lub lokalnym klonie zamiast zakładać wyłącznie Codespaces
- **🔐 Wskazówki dotyczące uwierzytelniania** preferują teraz `azd auth login` dla przepływów AZD, a `az login` jest opcjonalny przy bezpośrednim użyciu poleceń Azure CLI

#### Naprawiono
- **🪟 Polecenia instalacyjne dla Windows** dostosowano do aktualnej wielkości liter pakietu `winget` w przewodniku instalacji
- **🐧 Wskazówki instalacji dla Linux** poprawiono, aby unikać nieobsługiwanych dystrybucyjnie instrukcji menedżera pakietów `azd` i skierować do assetów wydań tam, gdzie to właściwe
- **📦 Przykłady modeli AI** odświeżone z wcześniejszych domyślnych jak `gpt-35-turbo` i `text-embedding-ada-002` do obecnych przykładów takich jak `gpt-4.1-mini`, `gpt-4.1` oraz `text-embedding-3-large`
- **📋 Fragmenty wdrożeniowe i diagnostyczne** poprawione pod kątem aktualnych poleceń środowiskowych i statusu w logach, skryptach i krokach rozwiązywania problemów
- **⚙️ Wskazówki dotyczące GitHub Actions** zaktualizowane z `Azure/setup-azd@v1.0.0` do `Azure/setup-azd@v2`
- **🤖 Wskazówki MCP/Copilot dotyczące zgód** zaktualizowane z `azd mcp consent` do `azd copilot consent list`

#### Ulepszone
- **🧠 Wskazówki w rozdziale AI** lepiej tłumaczące zachowanie `azd ai` w wersji preview, logowanie specyficzne dla dzierżawcy, aktualne użycie rozszerzeń oraz zaktualizowane rekomendacje wdrożeń modeli
- **🧪 Instrukcje warsztatowe** używające teraz bardziej realistycznych przykładów wersji i jaśniejszego języka opisu konfiguracji środowiska do praktycznych laboratoriów
- **📈 Dokumentacja produkcji i rozwiązywania problemów** lepiej dopasowana do aktualnych przykładów monitoringu, modelu zapasowego i poziomów kosztów

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
**Ta wersja dodaje pokrycie poleceń `azd ai`, `azd extension` i `azd mcp` we wszystkich rozdziałach związanych z AI, naprawia złamane linki i przestarzały kod w agents.md, aktualizuje ściągawkę oraz gruntownie przerabia sekcję Szablony Przykładowe z walidowanymi opisami i nowymi szablonami Azure AI w AZD.**

#### Dodano
- **🤖 Pokrycie poleceń AZD AI CLI** w 7 plikach (wcześniej tylko w Rozdziale 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nowa sekcja "Rozszerzenia i polecenia AI" wprowadzająca `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcja 4: `azd ai agent init` z tabelą porównawczą (podejście szablonowe vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcje "Rozszerzenia AZD dla Foundry" oraz "Wdrożenie z podejściem Agent-First"

  - `docs/chapter-05-multi-agent/README.md` — Szybki start teraz pokazuje ścieżki wdrożenia oparte na szablonie i manifeście
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcja wdrożenia teraz zawiera opcję `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcja "Polecenia rozszerzenia AZD AI do diagnostyki"
  - `resources/cheat-sheet.md` — Nowa sekcja "Polecenia AI i rozszerzeń" z `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Nowe przykładowe szablony AZD AI** w `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat z Blazor WebAssembly, Semantic Kernel i obsługą czatu głosowego
  - **azure-search-openai-demo-java** — Java RAG chat wykorzystujący Langchain4J z opcjami wdrożenia ACA/AKS
  - **contoso-creative-writer** — Wieloagentowa aplikacja do kreatywnego pisania z użyciem Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — Serverless RAG z Azure Functions + LangChain.js + Cosmos DB z lokalnym wsparciem deweloperskim Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator z panelem administracyjnym, integracją z Teams oraz opcjami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Wieloagentowa aplikacja referencyjna MCP orchestration z serwerami w .NET, Python, Java i TypeScript
  - **azd-ai-starter** — Minimalny szablon startowy infrastruktury Azure AI Bicep
  - **🔗 Świetny link do galerii AZD AI** — Odniesienie do [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ szablonów)

#### Poprawione
- **🔗 nawigacja w agents.md**: Linki Poprzedni/Następny teraz odpowiadają kolejności lekcji w README rozdziału 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 uszkodzone linki w agents.md**: `production-ai-practices.md` poprawione na `../chapter-08-production/production-ai-practices.md` (3 wystąpienia)
- **📦 przestarzały kod w agents.md**: Zastąpiono `opencensus` przez `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 niepoprawne API w agents.md**: Przeniesiono `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 liczenie tokenów w agents.md**: Zastąpiono przybliżone `len//4` funkcją `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Skorygowano usługi z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (domyślny host zmieniony w październiku 2024)
- **contoso-chat**: Zaktualizowano opis, aby odnosił się do Azure AI Foundry + Prompty, zgodnie z rzeczywistym tytułem i stosowaną technologią repozytorium

#### Usunięte
- **ai-document-processing**: Usunięto niefunkcjonalne odniesienie do szablonu (repozytorium niepubliczne jako szablon AZD)

#### Ulepszone
- **📝 ćwiczenia w agents.md**: Ćwiczenie 1 teraz pokazuje oczekiwany wynik oraz krok `azd monitor`; Ćwiczenie 2 zawiera pełny kod rejestracji `FunctionTool`; Ćwiczenie 3 zastępuje niejasne wskazówki konkretnymi poleceniami `prepdocs.py`
- **📚 zasoby w agents.md**: Zaktualizowano linki do dokumentacji na bieżące dokumenty Azure AI Agent Service oraz szybki start
- **📋 tabela następnych kroków w agents.md**: Dodano link do Laboratorium Warsztatów AI dla pełnego omówienia rozdziału

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
**Ta wersja poprawia nawigację w README.md rozdziału za pomocą ulepszonego formatu tabeli.**

#### Zmiany
- **Tabela mapy kursu**: Wzbogacona o bezpośrednie linki do lekcji, szacunki czasu trwania oraz oceny złożoności
- **Porządki w folderach**: Usunięto zbędne stare foldery (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Weryfikacja linków**: Wszystkie 21+ linków wewnętrznych w tabeli mapy kursu zweryfikowane

### [v3.16.0] - 2026-02-05

#### Aktualizacje nazw produktów
**Ta wersja aktualizuje odniesienia do produktów zgodnie z aktualnym brandingiem Microsoft.**

#### Zmiany
- **Microsoft Foundry → Microsoft Foundry**: Wszystkie odniesienia zaktualizowane w plikach niebędących tłumaczeniami
- **Azure AI Agent Service → Foundry Agents**: Zmieniono nazwę usługi, aby odzwierciedlała aktualny branding

#### Zaktualizowane pliki
- `README.md` - Główna strona kursu
- `changelog.md` - Historia wersji
- `course-outline.md` - Struktura kursu
- `docs/chapter-02-ai-development/agents.md` - Przewodnik po agentach AI
- `examples/README.md` - Dokumentacja przykładów
- `workshop/README.md` - Strona warsztatów
- `workshop/docs/index.md` - Indeks warsztatów
- `workshop/docs/instructions/*.md` - Wszystkie pliki instrukcji warsztatów

---

### [v3.15.0] - 2026-02-05

#### Główna reorganizacja repozytorium: foldery oparte na rozdziałach
**Ta wersja restrukturyzuje dokumentację do dedykowanych folderów rozdziałów dla lepszej nawigacji.**

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 Pliki README rozdziałów**: Utworzono README.md w każdym folderze rozdziału z:
  - Celami nauki i czasem trwania
  - Tabelą lekcji z opisami
  - Polecanymi poleceniami szybkiego startu
  - Nawigacją do innych rozdziałów

#### Zmieniono
- **🔗 Zaktualizowano wszystkie linki wewnętrzne**: 78+ ścieżek zaktualizowanych we wszystkich plikach dokumentacji
- **🗺️ Główny README.md**: Zaktualizowano mapę kursu z nową strukturą rozdziałów
- **📝 examples/README.md**: Zaktualizowano odnośniki do folderów rozdziałów

#### Usunięto
- Starą strukturę folderów (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturyzacja repozytorium: Nawigacja po rozdziałach
**Ta wersja dodaje pliki README nawigacji rozdziałów (zastąpione przez v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nowy przewodnik po agentach AI
**Ta wersja dodaje kompleksowy przewodnik wdrażania agentów AI za pomocą Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Kompletny przewodnik obejmujący:
  - Czym są agenci AI i jak różnią się od chatbotów
  - Trzy szablony szybkiego startu agentów (Foundry Agents, Prompty, RAG)
  - Wzorce architektury agentów (pojedynczy agent, RAG, multi-agent)
  - Konfiguracja i dostosowanie narzędzi
  - Monitorowanie i śledzenie metryk
  - Rozważania i optymalizacja kosztów
  - Typowe scenariusze rozwiązywania problemów
  - Trzy praktyczne ćwiczenia z kryteriami sukcesu

#### Struktura treści
- **Wprowadzenie**: Koncepcje agentów dla początkujących
- **Szybki start**: Wdrażanie agentów za pomocą `azd init --template get-started-with-ai-agents`
- **Wzorce architektury**: Wizualne diagramy wzorców agentów
- **Konfiguracja**: Ustawienia narzędzi i zmienne środowiskowe
- **Monitorowanie**: Integracja z Application Insights
- **Ćwiczenia**: Stopniowa nauka praktyczna (20-45 minut każde)

---

### [v3.12.0] - 2026-02-05

#### Aktualizacja środowiska DevContainer
**Ta wersja aktualizuje konfigurację kontenera deweloperskiego z nowoczesnymi narzędziami i lepszymi domyślnymi ustawieniami dla doświadczenia nauki AZD.**

#### Zmieniono
- **🐳 Obraz bazowy**: Zaktualizowano z `python:3.12-bullseye` do `python:3.12-bookworm` (najnowsza stabilna wersja Debiana)
- **📛 Nazwa kontenera**: Zmieniono z "Python 3" na "AZD for Beginners" dla przejrzystości

#### Dodano
- **🔧 Nowe funkcje Dev Container**:
  - `azure-cli` z włączonym wsparciem dla Bicep
  - `node:20` (wersja LTS dla szablonów AZD)
  - `github-cli` do zarządzania szablonami
  - `docker-in-docker` do wdrażania aplikacji kontenerowych

- **🔌 Przekierowanie portów**: Wstępnie skonfigurowane porty dla typowego rozwoju:
  - 8000 (podgląd MkDocs)
  - 3000 (aplikacje webowe)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nowe rozszerzenia VS Code**:
  - `ms-python.vscode-pylance` - Rozszerzona inteligencja dla Pythona
  - `ms-azuretools.vscode-azurefunctions` - Wsparcie dla Azure Functions
  - `ms-azuretools.vscode-docker` - Wsparcie dla Dockera
  - `ms-azuretools.vscode-bicep` - Wsparcie języka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Zarządzanie zasobami Azure
  - `yzhang.markdown-all-in-one` - Edycja Markdown
  - `DavidAnson.vscode-markdownlint` - Lintowanie Markdown
  - `bierner.markdown-mermaid` - Wsparcie diagramów Mermaid
  - `redhat.vscode-yaml` - Wsparcie YAML (dla azure.yaml)
  - `eamodio.gitlens` - Wizualizacja Git
  - `mhutchie.git-graph` - Historia Git

- **⚙️ Ustawienia VS Code**: Dodano domyślne ustawienia dla interpretera Pythona, formatowania przy zapisie i usuwania białych znaków

- **📦 Zaktualizowano requirements-dev.txt**:
  - Dodano wtyczkę do minifikacji MkDocs
  - Dodano pre-commit do kontroli jakości kodu
  - Dodano pakiety Azure SDK (azure-identity, azure-mgmt-resource)

#### Naprawiono
- **Polecenie po utworzeniu**: Obecnie weryfikuje instalację AZD i Azure CLI przy starcie kontenera

---

### [v3.11.0] - 2026-02-05

#### Przebudowa README dla początkujących
**Ta wersja znacznie poprawia README.md, czyniąc go bardziej przystępnym dla początkujących i dodaje niezbędne zasoby dla deweloperów AI.**

#### Dodano
- **🆚 Porównanie Azure CLI i AZD**: Jasne wyjaśnienie kiedy używać którego narzędzia wraz z praktycznymi przykładami
- **🌟 Linki do Awesome AZD**: Bezpośrednie linki do galerii szablonów społeczności i zasobów dla współtwórców:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Ponad 200 gotowych do wdrożenia szablonów
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Wspólnotowy wkład
- **🎯 Przewodnik szybkiego startu**: Uproszczona sekcja rozpoczęcia w 3 krokach (Instaluj → Zaloguj się → Wdróż)
- **📊 Tabela nawigacji oparta na doświadczeniu**: Jasne wskazówki gdzie zacząć w zależności od doświadczenia dewelopera

#### Zmieniono
- **Struktura README**: Przeorganizowano dla progresywnego odkrywania - najpierw kluczowe informacje
- **Sekcja wprowadzenia**: Przepisano, aby wyjaśnić „Magia `azd up`” dla całkowitych początkujących
- **Usunięto duplikaty treści**: Usunięto zduplikowaną sekcję rozwiązywania problemów

- **Polecenia rozwiązywania problemów**: Naprawiono odwołanie do `azd logs`, aby używało poprawnego `azd monitor --logs`

#### Naprawiono

- **🔐 Polecenia uwierzytelniania**: Dodano `azd auth login` i `azd auth logout` do cheat-sheet.md
- **Nieprawidłowe odwołania do poleceń**: Usunięto pozostałe `azd logs` z sekcji rozwiązywania problemów w README

#### Notatki
- **Zakres**: Zmiany wprowadzone do głównego README.md oraz resources/cheat-sheet.md
- **Grupa docelowa**: Ulepszenia skierowane głównie do deweloperów początkujących z AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizacja poprawności poleceń Azure Developer CLI
**Ta wersja koryguje nieistniejące polecenia AZD w całej dokumentacji, zapewniając, że wszystkie przykłady kodu używają poprawnej składni Azure Developer CLI.**

#### Naprawiono
- **🔧 Usunięto nieistniejące polecenia AZD**: Kompleksowy audyt i korekta niepoprawnych poleceń:
  - `azd logs` (nie istnieje) → zastąpione `azd monitor --logs` lub alternatywami Azure CLI
  - podpolecenia `azd service` (nie istnieją) → zastąpione `azd show` i Azure CLI
  - `azd infra import/export/validate` (nie istnieje) → usunięte lub zastąpione poprawnymi alternatywami
  - flagi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nie istnieją) → usunięte
  - flagi `azd provision --what-if/--rollback` (nie istnieją) → zaktualizowane do `--preview`
  - `azd config validate` (nie istnieje) → zastąpione `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nie istnieją) → usunięte

- **📚 Pliki zaktualizowane pod kątem poprawnych poleceń**:
  - `resources/cheat-sheet.md`: Kompleksowa aktualizacja odniesień do poleceń
  - `docs/deployment/deployment-guide.md`: Poprawiono strategie rollback i wdrożenia
  - `docs/troubleshooting/debugging.md`: Skorygowano sekcje analizy logów
  - `docs/troubleshooting/common-issues.md`: Zaktualizowano polecenia rozwiązywania problemów
  - `docs/troubleshooting/ai-troubleshooting.md`: Poprawiono sekcję debugowania AZD
  - `docs/getting-started/azd-basics.md`: Skorygowano polecenia monitorowania
  - `docs/getting-started/first-project.md`: Zaktualizowano przykłady monitorowania i debugowania
  - `docs/getting-started/installation.md`: Poprawiono przykłady pomocy i wersji
  - `docs/pre-deployment/application-insights.md`: Skorygowano polecenia przeglądania logów
  - `docs/pre-deployment/coordination-patterns.md`: Poprawiono polecenia debugowania agenta

- **📝 Zaktualizowano odniesienia do wersji**: 
  - `docs/getting-started/installation.md`: Zmieniono sztywno zakodowaną wersję `1.5.0` na ogólną `1.x.x` z linkiem do wydań

#### Zmiany
- **Strategie rollback**: Zaktualizowano dokumentację, aby korzystać z rollbacku opartego na Git (AZD nie ma natywnego rollbacku)
- **Przeglądanie logów**: Zamieniono odwołania do `azd logs` na `azd monitor --logs`, `azd monitor --live` i polecenia Azure CLI
- **Sekcja wydajności**: Usunięto nieistniejące flagi wdrożeń równoległych/przyrostowych, zapewniono poprawne alternatywy

#### Szczegóły techniczne
- **Poprawne polecenia AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Poprawne flagi azd monitor**: `--live`, `--logs`, `--overview`
- **Usunięte funkcje**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notatki
- **Weryfikacja**: Polecenia zweryfikowane na podstawie Azure Developer CLI w wersji v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ukończenie warsztatów i aktualizacja jakości dokumentacji
**Ta wersja kończy interaktywne moduły warsztatowe, naprawia wszystkie uszkodzone linki w dokumentacji i poprawia ogólną jakość treści dla programistów AI korzystających z Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nowy dokument wytycznych dotyczących wkładu ze:
  - Jasne instrukcje zgłaszania problemów i proponowania zmian
  - Standardy dokumentacji dla nowych treści
  - Wytyczne dotyczące przykładów kodu i konwencji wiadomości commit
  - Informacje o zaangażowaniu społeczności

#### Ukończono
- **🎯 Moduł warsztatowy 7 (Podsumowanie)**: W pełni ukończony moduł podsumowujący z:
  - Kompleksowe podsumowanie osiągnięć warsztatu
  - Sekcja opanowanych kluczowych koncepcji obejmująca AZD, szablony i Microsoft Foundry
  - Rekomendacje dotyczące kontynuacji ścieżki nauki
  - Ćwiczenia wyzwań warsztatowych z oceną trudności
  - Opinie społeczności i linki do wsparcia

- **📚 Moduł warsztatowy 3 (Demontaż)**: Zaktualizowano cele edukacyjne z:
  - Aktywacja GitHub Copilot z serwerami MCP
  - Zrozumienie struktury folderów szablonów AZD
  - Wzorce organizacji infrastruktury jako kodu (Bicep)
  - Instrukcje do ćwiczeń praktycznych

- **🔧 Moduł warsztatowy 6 (Demontaż)**: Ukończony z:
  - Cele dotyczące oczyszczenia zasobów i zarządzania kosztami
  - Użycie `azd down` do bezpiecznego usuwania infrastruktury
  - Wskazówki dotyczące odzyskiwania miękko usuniętych usług poznawczych
  - Bonusowe wskazówki eksploracji GitHub Copilot i Azure Portal

#### Naprawiono
- **🔗 Naprawione uszkodzone linki**: Rozwiązano ponad 15 uszkodzonych wewnętrznych linków w dokumentacji:
  - `docs/ai-foundry/ai-model-deployment.md`: Poprawiono ścieżki do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Skorygowano ścieżki ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamieniono nieistniejący cicd-integration.md na deployment-guide.md
  - `examples/retail-scenario.md`: Naprawiono ścieżki FAQ i przewodnika rozwiązywania problemów
  - `examples/container-app/microservices/README.md`: Skorygowano ścieżki kursu i przewodnika wdrożenia
  - `resources/faq.md` i `resources/glossary.md`: Zaktualizowano odniesienia do rozdziałów AI
  - `course-outline.md`: Naprawiono odniesienia do przewodnika instruktora i laboratoriów AI

- **📅 Baner statusu warsztatów**: Zmieniono z "W budowie" na aktywny status warsztatów z datą luty 2026

- **🔗 Nawigacja warsztatów**: Naprawiono uszkodzone linki nawigacyjne w README warsztatu wskazujące na nieistniejący folder lab-1-azd-basics

#### Zmiany
- **Prezentacja warsztatów**: Usunięto ostrzeżenia "w budowie", warsztat jest ukończony i gotowy do użycia
- **Spójność nawigacji**: Zapewniono poprawną nawigację pomiędzy modułami warsztatowymi
- **Odniesienia ścieżki nauki**: Zaktualizowano odwołania międzyrozdziałowe z poprawnymi ścieżkami microsoft-foundry

#### Zweryfikowano
- ✅ Wszystkie angielskie pliki markdown mają prawidłowe wewnętrzne linki
- ✅ Moduły warsztatów 0-7 są kompletne z celami edukacyjnymi
- ✅ Nawigacja między rozdziałami i modułami działa poprawnie
- ✅ Treść jest odpowiednia dla deweloperów AI korzystających z Microsoft AZD
- ✅ Zachowano przyjazny dla początkujących język i strukturę
- ✅ CONTRIBUTING.md dostarcza jasne wskazówki dla społeczności

#### Implementacja techniczna
- **Weryfikacja linków**: Zautomatyzowany skrypt PowerShell zweryfikował wszystkie wewnętrzne linki .md
- **Audyt treści**: Ręczna kontrola kompletności warsztatów i odpowiedniości dla początkujących
- **System nawigacji**: Zastosowano konsekwentne wzorce nawigacji rozdziałów i modułów

#### Notatki
- **Zakres**: Zmiany zastosowane tylko w dokumentacji angielskiej
- **Tłumaczenia**: Foldery tłumaczeń nie zostały zaktualizowane w tej wersji (automatyczne tłumaczenie zsynchronizuje się później)
- **Czas trwania warsztatów**: Kompletny warsztat zapewnia teraz 3-4 godziny nauki praktycznej

---

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: monitorowanie, bezpieczeństwo i wzorce wieloagentowe
**Ta wersja dodaje kompleksowe lekcje klasy A o integracji Application Insights, wzorcach uwierzytelniania oraz koordynacji wieloagentowej dla wdrożeń produkcyjnych.**

#### Dodano
- **📊 Lekcja Integracji Application Insights**: w `docs/pre-deployment/application-insights.md`:
  - Wdrożenie zorientowane na AZD z automatycznym provisioningiem
  - Kompletny szablon Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z niestandardową telemetrią (1,200+ linii)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów modeli Microsoft Foundry)
  - 6 diagramów Mermaid (architektura, śledzenie rozproszone, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, pulpity, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Transmisja metryk na żywo i debugowanie w czasie rzeczywistym
  - 40-50 minut czasu nauki z wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i bezpieczeństwa**: w `docs/getting-started/authsecurity.md`:
  - 3 wzorce uwierzytelniania (connection strings, Key Vault, zarządzana tożsamość)
  - Kompletny szablon infrastruktury Bicep dla bezpiecznych wdrożeń
  - Kod aplikacji Node.js z integracją Azure SDK
  - 3 kompletne ćwiczenia (włączanie zarządzanej tożsamości, tożsamości przypisanej przez użytkownika, rotacja Key Vault)
  - Najlepsze praktyki zabezpieczeń i konfiguracje RBAC
  - Przewodnik rozwiązywania problemów i analiza kosztów
  - Wzorce uwierzytelniania produkcyjnego bez hasła

- **🤖 Lekcja wzorców koordynacji wieloagentowej**: w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Kompletny implementator usług orkiestratora (Python/Flask, 1,500+ linii)
  - 3 wyspecjalizowane implementacje agentów (Badacz, Piszący, Redaktor)
  - Integracja Service Bus do kolejkowania wiadomości
  - Zarządzanie stanem w Cosmos DB dla systemów rozproszonych
  - 6 diagramów Mermaid pokazujących interakcje agentów
  - 3 zaawansowane ćwiczenia (obsługa timeoutów, logika retry, wyłącznik obwodu)
  - Analiza kosztów ($240-565/miesiąc) z strategiami optymalizacji
  - Integracja Application Insights do monitoringu

#### Ulepszono
- **Rozdział Pre-deployment**: Teraz zawiera kompleksowe wzorce monitorowania i koordynacji
- **Rozdział Getting Started**: Ulepszony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Kompleksowe omówienie od bezpieczeństwa po obserwowalność
- **Konspekt kursu**: Zaktualizowany o odniesienia do nowych lekcji w rozdziałach 3 i 6

#### Zmiany
- **Postęp w nauce**: Lepsza integracja bezpieczeństwa i monitorowania w całym kursie
- **Jakość dokumentacji**: Spójne standardy klasy A (95-97%) dla nowych lekcji
- **Wzorce produkcyjne**: Kompleksowe pokrycie wdrożeń korporacyjnych

#### Udoskonalono
- **Doświadczenie dewelopera**: Jasna ścieżka od rozwoju do monitoringu produkcji
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania tajemnicami
- **Obserwowalność**: Kompletny monitoring Application Insights z AZD
- **Obciążenia AI**: Specjalistyczne monitorowanie modeli Microsoft Foundry i systemów wieloagentowych

#### Zweryfikowano
- ✅ Wszystkie lekcje zawierają kompletny działający kod (nie fragmenty)
- ✅ Diagramy Mermaid do uczenia wizualnego (łącznie 19 dla 3 lekcji)
- ✅ Ćwiczenia praktyczne z krokami weryfikacji (łącznie 9)
- ✅ Szablony Bicep gotowe do wdrożenia poprzez `azd up`
- ✅ Analiza kosztów i strategie optymalizacji
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki
- ✅ Punkty kontrolne wiedzy z poleceniami weryfikacyjnymi

#### Wyniki oceny dokumentacji
- **docs/pre-deployment/application-insights.md**: - Kompleksowy przewodnik monitoringu
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury wieloagentowe
- **Ogólna nowa zawartość**: - Spójne wysokie standardy jakości

#### Implementacja techniczna
- **Application Insights**: Log Analytics + niestandardowa telemetria + śledzenie rozproszone
- **Uwierzytelnianie**: Zarządzana tożsamość + Key Vault + wzorce RBAC
- **Wieloagentowość**: Service Bus + Cosmos DB + Container Apps + orkiestracja
- **Monitorowanie**: Metryki na żywo + zapytania Kusto + alerty + pulpity
- **Zarządzanie kosztami**: Strategie próbkowania, zasady retencji, kontrola budżetu

### [v3.7.0] - 2025-11-19

#### Poprawa jakości dokumentacji i nowy przykład Microsoft Foundry Models
**Ta wersja podnosi jakość dokumentacji w całym repozytorium i dodaje kompletny przykład wdrożenia Microsoft Foundry Models z interfejsem czatu gpt-4.1.**

#### Dodano
- **🤖 Przykład czatu Microsoft Foundry Models**: Kompletny deployment gpt-4.1 z działającą implementacją w `examples/azure-openai-chat/`:
  - Kompletny stack infrastruktury Microsoft Foundry Models (wdrożenie modelu gpt-4.1)
  - Interfejs czatu w Pythonie działający w wierszu poleceń z historią rozmów
  - Integracja z Key Vault dla bezpiecznego przechowywania kluczy API
  - Śledzenie użycia tokenów i szacowanie kosztów
  - Ograniczenia szybkości i obsługa błędów
  - Kompleksowe README z przewodnikiem wdrożenia na 35-45 minut
  - 11 plików gotowych do produkcji (szablony Bicep, aplikacja Python, konfiguracja)
- **📚 Ćwiczenia dokumentacyjne**: Dodano praktyczne ćwiczenia do przewodnika konfiguracji:
  - Ćwiczenie 1: Konfiguracja wielu środowisk (15 minut)
  - Ćwiczenie 2: Praktyka zarządzania sekretami (10 minut)
  - Jasne kryteria sukcesu i kroki weryfikacyjne
- **✅ Weryfikacja wdrożenia**: Dodano sekcję w przewodniku wdrożenia:
  - Procedury kontroli stanu zdrowia
  - Lista kontrolna kryteriów sukcesu
  - Spodziewane wyniki dla wszystkich poleceń wdrożenia
  - Szybka referencja do rozwiązywania problemów

#### Ulepszono
- **examples/README.md**: Zaktualizowano do jakości klasy A (93%):
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji
  - Zaktualizowano liczbę lokalnych przykładów z 3 do 4
  - Dodano do tabeli przykładów aplikacji AI
  - Zintegrowano z szybkim startem dla użytkowników średniozaawansowanych
  - Dodano do sekcji szablonów Microsoft Foundry
  - Zaktualizowano macierz porównawczą i sekcje wyszukiwania technologii
- **Jakość dokumentacji**: Poprawiono B+ (87%) → A- (92%) w folderze docs:

  - Dodano oczekiwane wyniki do przykładowych krytycznych poleceń
  - Uwzględniono kroki weryfikacji zmian konfiguracji
  - Rozszerzono naukę praktyczną o ćwiczenia praktyczne

#### Zmiany
- **Progres nauki**: Lepsza integracja przykładów AI dla użytkowników na poziomie średniozaawansowanym
- **Struktura dokumentacji**: Bardziej praktyczne ćwiczenia z jasnymi rezultatami
- **Proces weryfikacji**: Dodano wyraźne kryteria sukcesu do kluczowych ścieżek

#### Ulepszenia
- **Doświadczenie dewelopera**: Wdrożenie Microsoft Foundry Models trwa teraz 35-45 minut (w porównaniu do 60-90 minut dla złożonych alternatyw)
- **Przejrzystość kosztów**: Jasne szacunki kosztów ($50-200/miesiąc) dla przykładu Microsoft Foundry Models
- **Ścieżka nauki**: Deweloperzy AI mają wyraźny punkt startowy z azure-openai-chat
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacji

#### Zweryfikowano
- ✅ Przykład Microsoft Foundry Models w pełni funkcjonalny z `azd up`
- ✅ Wszystkie 11 plików implementacyjnych poprawne składniowo
- ✅ Instrukcje w README odpowiadają rzeczywistemu doświadczeniu wdrożenia
- ✅ Linki dokumentacji zaktualizowane w ponad 8 lokalizacjach
- ✅ Indeks przykładów dokładnie odzwierciedla 4 przykłady lokalne
- ✅ Brak zduplikowanych linków zewnętrznych w tabelach
- ✅ Wszystkie odniesienia nawigacyjne poprawne

#### Implementacja techniczna
- **Architektura Microsoft Foundry Models**: wzorzec gpt-4.1 + Key Vault + Container Apps
- **Bezpieczeństwo**: Zarządzana tożsamość, sekrety w Key Vault
- **Monitorowanie**: integracja z Application Insights
- **Zarządzanie kosztami**: Śledzenie tokenów i optymalizacja użycia
- **Wdrożenie**: Pojedyncze polecenie `azd up` do pełnej konfiguracji

### [v3.6.0] - 2025-11-19

#### Główna aktualizacja: Przykłady wdrożeń Container App
**Ta wersja wprowadza kompleksowe, gotowe do produkcji przykłady wdrożeń aplikacji kontenerowych za pomocą Azure Developer CLI (AZD), z pełną dokumentacją i integracją ze ścieżką nauki.**

#### Dodano
- **🚀 Przykłady Container App**: Nowe lokalne przykłady w `examples/container-app/`:
  - [Przewodnik główny](examples/container-app/README.md): Kompletny przegląd wdrożeń konteneryzowanych, szybki start, produkcja i zaawansowane wzorce
  - [Proste API Flask](../../examples/container-app/simple-flask-api): Przyjazne dla początkujących REST API z możliwością skalowania do zera, sondy zdrowia, monitorowaniem i rozwiązywaniem problemów
  - [Architektura mikroserwisów](../../examples/container-app/microservices): Gotowe do produkcji wieloserwisowe wdrożenie (API Gateway, Product, Order, User, Notification), asynchroniczne wiadomości, Service Bus, Cosmos DB, Azure SQL, śledzenie rozproszone, wdrożenia blue-green/canary
- **Najlepsze praktyki**: Bezpieczeństwo, monitorowanie, optymalizacja kosztów i wskazówki CI/CD dla konteneryzowanych obciążeń
- **Przykłady kodu**: Kompletny `azure.yaml`, szablony Bicep i implementacje usług w wielu językach (Python, Node.js, C#, Go)
- **Testowanie i rozwiązywanie problemów**: Scenariusze testów end-to-end, polecenia monitorowania, wskazówki rozwiązywania problemów

#### Zmiany
- **README.md**: Zaktualizowany o nowe przykłady aplikacji kontenerowych pod „Local Examples - Container Applications”
- **examples/README.md**: Zaktualizowany, aby podkreślić przykłady aplikacji kontenerowych, dodano wpisy do matrycy porównawczej, oraz zaktualizowano odniesienia technologii/architektury
- **Konspekt kursu i przewodnik nauki**: Zaktualizowane o odniesienia do nowych przykładów aplikacji kontenerowych i wzorców wdrożeń w odpowiednich rozdziałach

#### Zweryfikowano
- ✅ Wszystkie nowe przykłady możliwe do wdrożenia za pomocą `azd up` i zgodne z najlepszymi praktykami
- ✅ Zaktualizowano cross-linki dokumentacji i nawigację
- ✅ Przykłady obejmują scenariusze od początkujących do zaawansowanych, w tym produkcyjne mikroserwisy

#### Uwagi
- **Zakres**: Dokumentacja i przykłady wyłącznie w języku angielskim
- **Kolejne kroki**: Rozszerzenie o dodatkowe zaawansowane wzorce kontenerowe i automatyzację CI/CD w przyszłych wersjach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Ta wersja wprowadza kompleksową zmianę nazwy produktu z "Microsoft Foundry" na "Microsoft Foundry" we wszystkich anglojęzycznych dokumentacjach, odzwierciedlając oficjalny rebranding Microsoftu.**

#### Zmiany
- **🔄 Aktualizacja nazwy produktu**: Pełny rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Zaktualizowano wszystkie odniesienia w anglojęzycznej dokumentacji w folderze `docs/`
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Razem: 23 aktualizacje odniesień w 7 plikach dokumentacji

- **📁 Zmiany w strukturze folderów**:
  - `docs/ai-foundry/` zmieniono na `docs/microsoft-foundry/`
  - Wszystkie odniesienia krzyżowe zaktualizowane do nowej struktury folderów
  - Nawigacja zweryfikowana we wszystkich dokumentacjach

- **📄 Zmiany nazw plików**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Wszystkie linki wewnętrzne zaktualizowane do nowej nazwy pliku

#### Zaktualizowane pliki
- **Dokumentacja rozdziałów** (7 plików):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizacje odniesień do nazwy produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Już używa nazwy Microsoft Foundry (z poprzednich aktualizacji)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizacje odniesień (przegląd, opinie społeczności, dokumentacja)
  - `docs/getting-started/azd-basics.md` - 4 zaktualizowane linki krzyżowe
  - `docs/getting-started/first-project.md` - 2 zaktualizowane linki nawigacyjne rozdziałów
  - `docs/getting-started/installation.md` - 2 zaktualizowane linki do następnych rozdziałów
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizacje odniesień (nawigacja, społeczność Discord)
  - `docs/troubleshooting/common-issues.md` - 1 zaktualizowany link nawigacyjny
  - `docs/troubleshooting/debugging.md` - 1 zaktualizowany link nawigacyjny

- **Pliki struktury kursu** (2 pliki):
  - `README.md` - 17 zaktualizowanych odniesień (przegląd kursu, tytuły rozdziałów, sekcja szablonów, opinie społeczności)
  - `course-outline.md` - 14 zaktualizowanych odniesień (przegląd, cele nauki, zasoby rozdziałów)

#### Zweryfikowano
- ✅ Brak pozostałych odniesień do ścieżek folderów "ai-foundry" w angielskich plikach
- ✅ Brak pozostałych odniesień do nazwy produktu "Microsoft Foundry" w angielskich dokumentacjach
- ✅ Wszystkie linki nawigacyjne działające z nową strukturą folderów
- ✅ Zmiany nazw plików i folderów wykonane pomyślnie
- ✅ Zweryfikowane odniesienia krzyżowe między rozdziałami

#### Uwagi
- **Zakres**: Zmiany zastosowane tylko do anglojęzycznej dokumentacji w folderze `docs/`
- **Tłumaczenia**: Foldery tłumaczeń (`translations/`) nie zostały zaktualizowane w tej wersji
- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie były aktualizowane w tej wersji
- **Przykłady**: Pliki przykładów mogą nadal zawierać odwołania do starych nazw (do poprawy w przyszłej aktualizacji)
- **Linki zewnętrzne**: Zewnętrzne adresy URL i odniesienia do repozytoriów GitHub pozostają bez zmian

#### Przewodnik migracji dla kontrybutorów
Jeśli masz lokalne gałęzie lub dokumentację odwołującą się do starej struktury:
1. Zaktualizuj odniesienia folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Zaktualizuj odniesienia plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamień nazwę produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Zweryfikuj, czy wszystkie linki wewnętrzne w dokumentacji wciąż działają

---

### [v3.4.0] - 2025-10-24

#### Ulepszenia podglądu infrastruktury i walidacji
**Ta wersja wprowadza kompleksowe wsparcie dla nowej funkcji podglądu w Azure Developer CLI oraz poprawia doświadczenia użytkowników warsztatu.**

#### Dodano
- **🧪 Dokumentacja funkcji azd provision --preview**: Kompleksowe omówienie nowej funkcjonalności podglądu infrastruktury
  - Odniesienia do poleceń i przykłady użycia w ściągawce
  - Szczegółowa integracja w przewodniku do provisioning z przykładami zastosowań i korzyściami
  - Integracja kontroli pre-flight dla bezpieczniejszej walidacji wdrożeń
  - Aktualizacje przewodnika startowego z praktykami bezpieczeństwa wdrożeń
- **🚧 Baner statusu warsztatu**: Profesjonalny baner HTML pokazujący status rozwoju warsztatu
  - Projekt gradientu z wskaźnikami pracy w toku dla jasnej komunikacji użytkownika
  - Znacznik czasu ostatniej aktualizacji dla przejrzystości
  - Responsywny design na urządzenia mobilne

#### Ulepszone
- **Bezpieczeństwo infrastruktury**: Funkcjonalność podglądu zintegrowana z dokumentacją wdrożeń
- **Walidacja przed wdrożeniem**: Skrypty automatyczne zawierają teraz testy podglądu infrastruktury
- **Workflow dewelopera**: Zaktualizowane sekwencje komend uwzględniają podgląd jako najlepszą praktykę
- **Doświadczenie warsztatu**: Jasne oczekiwania od użytkowników co do statusu rozwoju treści

#### Zmiany
- **Najlepsze praktyki wdrożeniowe**: Workflow nastawiony na podgląd jako zalecane podejście
- **Przepływ dokumentacji**: Walidacja infrastruktury przesunięta na wcześniejszy etap nauki
- **Prezentacja warsztatu**: Profesjonalna komunikacja statusu z jasnym harmonogramem rozwoju

#### Poprawione
- **Podejście bezpieczeństwa**: Zmiany infrastruktury mogą być teraz weryfikowane przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu mogą być udostępniane do przeglądu i zatwierdzenia
- **Świadomość kosztów**: Lepsze rozumienie kosztów zasobów przed provisioningiem
- **Redukcja ryzyka**: Mniejsze ryzyko niepowodzeń wdrożeń dzięki wcześniejszej walidacji

#### Implementacja techniczna
- **Integracja wielodokumentowa**: Funkcja podglądu udokumentowana w 4 kluczowych plikach
- **Wzorce poleceń**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd uwzględniony w workflow walidacji i skryptach
- **Wskaźniki wizualne**: Wyraźne oznaczenia NOWEJ funkcji dla lepszej wykrywalności

#### Infrastruktura warsztatu
- **Komunikacja statusu**: Profesjonalny baner HTML z gradientowym stylem
- **Doświadczenie użytkownika**: Jasny status rozwoju zapobiega nieporozumieniom
- **Profesjonalna prezentacja**: Utrzymuje wiarygodność repozytorium i ustawia oczekiwania
- **Przejrzystość harmonogramu**: Znacznik czasu ostatniej aktualizacji październik 2025 dla przejrzystości

### [v3.3.0] - 2025-09-24

#### Rozszerzone materiały warsztatowe i interaktywne doświadczenie nauki
**Ta wersja wprowadza kompleksowe materiały warsztatowe z przewodnikami interaktywnymi w przeglądarce i ustrukturyzowanymi ścieżkami nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatu**: Doświadczenie warsztatowe w przeglądarce z możliwością podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatu**: 7-krokowa ścieżka nauki od odkrycia do personalizacji
  - 0-Introduction: Przegląd warsztatu i konfiguracja
  - 1-Select-AI-Template: Proces odkrywania i wyboru szablonu
  - 2-Validate-AI-Template: Procedury wdrożenia i walidacji
  - 3-Deconstruct-AI-Template: Zrozumienie architektury szablonu
  - 4-Configure-AI-Template: Konfiguracja i personalizacja
  - 5-Customize-AI-Template: Zaawansowane modyfikacje i iteracje
  - 6-Teardown-Infrastructure: Sprzątanie i zarządzanie zasobami
  - 7-Wrap-up: Podsumowanie i kolejne kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia nauki
- **🎯 Ścieżka nauki praktycznej**: 3-etapowa metodologia (Odkrycie → Wdrożenie → Personalizacja)
- **📱 Integracja GitHub Codespaces**: Bezproblemowa konfiguracja środowiska deweloperskiego

#### Ulepszone
- **Laboratorium AI Workshop**: Rozszerzone o kompleksowe, 2-3 godziny ustrukturyzowanego doświadczenia nauki
- **Dokumentacja warsztatu**: Profesjonalna prezentacja z nawigacją i elementami wizualnymi
- **Progres nauki**: Jasne, krok po kroku wskazówki od wyboru szablonu do wdrożenia produkcyjnego
- **Doświadczenie dewelopera**: Zintegrowane narzędzia dla usprawnionych workflow developmentu

#### Poprawione
- **Dostępność**: Interfejs w przeglądarce z wyszukiwarką, kopiowaniem i przełącznikiem motywu
- **Nauka we własnym tempie**: Elastyczna struktura warsztatu dostosowana do różnych szybkości nauki
- **Zastosowanie praktyczne**: Scenariusze wdrożeń realnych AI template'ów
- **Integracja społeczności**: Integracja Discord dla wsparcia i współpracy warsztatowej

#### Funkcje warsztatu
- **Wbudowana wyszukiwarka**: Szybkie znajdowanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcjonalność kopiowania po najechaniu kursorem na przykład kodu
- **Przełącznik motywu**: Obsługa trybu ciemnego/jasnego dla różnych preferencji
- **Zasoby wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia
- **Integracja pomocy**: Bezpośredni dostęp do Discorda dla wsparcia społeczności

### [v3.2.0] - 2025-09-17

#### Główna przebudowa nawigacji i system nauki oparty na rozdziałach
**Ta wersja wprowadza kompleksową strukturę nauki opartą na rozdziałach z usprawnioną nawigacją w całym repozytorium.**

#### Dodano
- **📚 System nauki oparty na rozdziałach**: Przekształcono cały kurs w 8 postępujących rozdziałów nauki
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 minut)
  - Rozdział 2: Rozwój AI w podejściu AI-First (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 minut)
  - Rozdział 4: Infrastructure as Code i wdrożenia (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Wieloagentowe rozwiązania AI (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja i planowanie przed wdrożeniem (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacyjne we wszystkich dokumentach
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Wskazówki ścieżki nauki**: Jasne punkty wejścia dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja odniesień krzyżowych**: Powiązane rozdziały i wymagania wstępne powiązane wyraźnie

#### Ulepszone
- **Struktura README**: Przekształcone w platformę nauki z organizacją opartą na rozdziałach
- **Nawigacja dokumentacji**: Każda strona zawiera teraz kontekst rozdziału i wskazówki progresji
- **Organizacja szablonów**: Przykłady i szablony powiązane z odpowiednimi rozdziałami nauki

- **Integracja zasobów**: Karty podpowiedzi, FAQ i przewodniki powiązane z odpowiednimi rozdziałami
- **Integracja warsztatów**: Ćwiczenia praktyczne powiązane z wieloma celami nauki rozdziałów

#### Zmiany
- **Postęp nauki**: Przesunięcie z liniowej dokumentacji do elastycznej nauki opartej na rozdziałach
- **Umiejscowienie konfiguracji**: Przesunięcie przewodnika konfiguracji do Rozdziału 3 dla lepszego przepływu nauki
- **Integracja treści AI**: Lepsza integracja treści specyficznych dla AI na całej ścieżce nauki
- **Treści produkcyjne**: Zaawansowane wzorce skonsolidowane w Rozdziale 8 dla uczniów korporacyjnych

#### Ulepszenia
- **Doświadczenie użytkownika**: Jasna nawigacja okruszkowa i wskaźniki postępu rozdziałów
- **Dostępność**: Spójne wzorce nawigacji ułatwiające poruszanie się po kursie
- **Profesjonalna prezentacja**: Struktura kursu w stylu uniwersyteckim odpowiednia dla szkoleń akademickich i korporacyjnych
- **Efektywność nauki**: Skrócenie czasu znajdowania odpowiednich treści dzięki ulepszonej organizacji

#### Implementacja techniczna
- **Nagłówki nawigacji**: Ustandaryzowana nawigacja rozdziałów w ponad 40 plikach dokumentacji
- **Nawigacja stopki**: Spójne wskazówki dotyczące postępu i wskaźniki ukończenia rozdziałów
- **Linkowanie wewnętrzne**: Kompleksowy system łączy wewnętrznych łączący powiązane koncepcje
- **Mapowanie rozdziałów**: Szablony i przykłady wyraźnie powiązane z celami nauki

#### Ulepszenia przewodnika nauki
- **📚 Kompleksowe cele nauki**: Przebudowany przewodnik nauki dostosowany do systemu 8 rozdziałów
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera konkretne cele nauki i ćwiczenia praktyczne
- **📋 Śledzenie postępów**: Cotygodniowy harmonogram nauki z mierzalnymi rezultatami i listami kontrolnymi ukończenia
- **❓ Pytania oceniajace**: Pytania weryfikujące wiedzę dla każdego rozdziału z profesjonalnymi wynikami
- **🛠️ Ćwiczenia praktyczne**: Ćwiczenia praktyczne z rzeczywistymi scenariuszami wdrożenia i rozwiązywania problemów
- **📊 Postęp umiejętności**: Wyraźny postęp od podstawowych koncepcji po wzorce korporacyjne z naciskiem na rozwój kariery
- **🎓 Ramy certyfikacji**: Wyniki rozwoju zawodowego i system uznawania społeczności
- **⏱️ Zarządzanie czasem**: Strukturalny 10-tygodniowy plan nauki z walidacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone rozwiązania AI multi-agentów
**Ta wersja udoskonala rozwiązanie AI wieloagentowe dla handlu detalicznego z lepszym nazewnictwem agentów i rozszerzoną dokumentacją.**

#### Zmiany
- **Terminologia multi-agentów**: Zamiana "Cora agent" na "Customer agent" w całym rozwiązaniu multi-agent dla handlu detalicznego dla lepszego zrozumienia
- **Architektura agenta**: Aktualizacja całej dokumentacji, szablonów ARM i przykładów kodu do spójnego nazewnictwa "Customer agent"
- **Przykłady konfiguracji**: Unowocześnione wzorce konfiguracji agentów z aktualnymi konwencjami nazewnictwa
- **Spójność dokumentacji**: Zapewniono, że wszystkie odniesienia używają profesjonalnych i opisowych nazw agentów

#### Ulepszenia
- **Pakiet szablonów ARM**: Aktualizacja retail-multiagent-arm-template z odwołaniami do Customer agent
- **Diagramy architektury**: Odświeżone diagramy Mermaid z nowym nazewnictwem agentów
- **Przykłady kodu**: Klasy Pythona i przykłady implementacji teraz używają nazwy CustomerAgent
- **Zmienne środowiskowe**: Aktualizacja wszystkich skryptów wdrożeniowych do konwencji CUSTOMER_AGENT_NAME

#### Ulepszenia
- **Doświadczenie programisty**: Wyraźniejsze role i obowiązki agentów w dokumentacji
- **Gotowość produkcyjna**: Lepsze dostosowanie do korporacyjnych konwencji nazewnictwa
- **Materiały edukacyjne**: Bardziej intuicyjne nazewnictwo agentów do celów edukacyjnych
- **Użyteczność szablonów**: Uproszczone rozumienie funkcji agentów i wzorców wdrożenia

#### Szczegóły techniczne
- Zaktualizowano diagramy architektury Mermaid z odwołaniami do CustomerAgent
- Zamieniono nazwy klas CoraAgent na CustomerAgent w przykładach Pythona
- Zmodyfikowano konfiguracje JSON szablonów ARM do korzystania z typu agenta "customer"
- Zaktualizowano zmienne środowiskowe z wzorów CORA_AGENT_* na CUSTOMER_AGENT_*
- Odświeżono wszystkie polecenia wdrożeniowe i konfiguracje kontenerów

### [v3.0.0] - 2025-09-12

#### Główne zmiany - Fokus na programistów AI i integracja Microsoft Foundry
**Ta wersja przekształca repozytorium w kompleksowe źródło nauki skoncentrowane na AI z integracją Microsoft Foundry.**

#### Dodano
- **🤖 Ścieżka nauki AI-przede wszystkim**: Pełna restrukturyzacja priorytetowa dla programistów i inżynierów AI
- **Przewodnik integracji Microsoft Foundry**: Kompleksowa dokumentacja łączenia AZD z usługami Microsoft Foundry
- **Wzorce wdrażania modeli AI**: Szczegółowy przewodnik obejmujący wybór modelu, konfigurację i strategie wdrożenia produkcyjnego
- **Laboratorium warsztatowe AI**: 2-3 godzinne praktyczne warsztaty konwertujące aplikacje AI do rozwiązań wdrażalnych w AZD
- **Najlepsze praktyki produkcyjne AI**: Wzorce gotowe do przedsiębiorstw do skalowania, monitorowania i zabezpieczania obciążeń AI
- **Przewodnik rozwiązywania problemów specyficznych dla AI**: Kompleksowe rozwiązywanie problemów z modelami Microsoft Foundry, Cognitive Services i wdrożeniami AI
- **Galeria szablonów AI**: Wyróżniona kolekcja szablonów Microsoft Foundry z oceną złożoności
- **Materiały warsztatowe**: Kompletny plan warsztatów z ćwiczeniami praktycznymi i materiałami referencyjnymi

#### Ulepszenia
- **Struktura README**: Skoncentrowana na programistach AI z 45% danych o zainteresowaniu społeczności z Discord Microsoft Foundry
- **Ścieżki nauki**: Dedykowana ścieżka programisty AI obok tradycyjnych ścieżek dla studentów i inżynierów DevOps
- **Rekomendacje szablonów**: Wyróżnione szablony AI w tym azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart
- **Integracja społeczności**: Rozszerzone wsparcie Discord społeczności z kanałami i dyskusjami specyficznymi dla AI

#### Bezpieczeństwo i fokus na produkcję
- **Wzorce Managed Identity**: Specyficzne dla AI konfiguracje uwierzytelniania i bezpieczeństwa
- **Optymalizacja kosztów**: Monitorowanie użycia tokenów i kontrola budżetu dla obciążeń AI
- **Wieloregionalne wdrożenia**: Strategie globalnego wdrażania aplikacji AI
- **Monitorowanie wydajności**: Metryki specyficzne dla AI i integracja Application Insights

#### Jakość dokumentacji
- **Liniowa struktura kursu**: Logiczny postęp od początkującego do zaawansowanych wzorców wdrożenia AI
- **Zweryfikowane URL-e**: Wszystkie linki zewnętrzne do repozytoriów potwierdzone i dostępne
- **Kompletne odniesienia**: Wszystkie linki wewnętrzne działające i zweryfikowane
- **Gotowość produkcyjna**: Wzorce wdrożeń korporacyjnych z przykładami z życia

### [v2.0.0] - 2025-09-09

#### Główne zmiany - Restrukturyzacja repozytorium i profesjonalne ulepszenia
**Ta wersja oznacza znaczącą przebudowę struktury repozytorium i prezentacji treści.**

#### Dodano
- **Struktura nauki**: Wszystkie strony dokumentacji zawierają sekcje Wprowadzenie, Cele nauki i Rezultaty nauki
- **System nawigacji**: Dodano linki Poprzednia/Następna lekcja w całej dokumentacji dla prowadzonego postępu nauki
- **Przewodnik nauki**: Kompleksowy study-guide.md z celami nauki, ćwiczeniami praktycznymi i materiałami oceniającymi
- **Profesjonalna prezentacja**: Usunięto wszystkie ikony emoji dla lepszej dostępności i profesjonalnego wyglądu
- **Ulepszona struktura treści**: Poprawiona organizacja i przepływ materiałów edukacyjnych

#### Zmiany
- **Format dokumentacji**: Ustandaryzowano całą dokumentację ze spójną strukturą skupioną na nauce
- **Przepływ nawigacji**: Wdrożono logiczny postęp przez wszystkie materiały naukowe
- **Prezentacja treści**: Usunięto elementy dekoracyjne na rzecz jasnego, profesjonalnego formatowania
- **Struktura linków**: Zaktualizowano wszystkie linki wewnętrzne by wspierać nowy system nawigacji

#### Ulepszenia
- **Dostępność**: Usunięto zależności od emoji dla lepszej kompatybilności z czytnikami ekranu
- **Profesjonalny wygląd**: Czysta, akademicka prezentacja odpowiednia dla nauki korporacyjnej
- **Doświadczenie nauki**: Strukturalne podejście z jasnymi celami i rezultatami dla każdej lekcji
- **Organizacja treści**: Lepszy logiczny przepływ i powiązania między pokrewnymi tematami

### [v1.0.0] - 2025-09-09

#### Wersja początkowa - Kompleksowe repozytorium nauki AZD

#### Dodano
- **Podstawowa struktura dokumentacji**
  - Kompletny cykl przewodników dla początkujących
  - Kompleksowa dokumentacja wdrożenia i provisioning
  - Szczegółowe zasoby rozwiązywania problemów i przewodniki debugowania
  - Narzędzia i procedury walidacji przed wdrożeniem

- **Moduł rozpoczynający**
  - Podstawy AZD: kluczowe koncepcje i terminologia
  - Przewodnik instalacji: instrukcje instalacji według platform
  - Przewodnik konfiguracji: konfiguracja środowiska i uwierzytelnianie
  - Pierwszy projekt: praktyczne, krok-po-kroku nauczanie

- **Moduł wdrożenia i provisioningu**
  - Przewodnik wdrożeń: kompletna dokumentacja przepływu pracy
  - Przewodnik provisioningu: infrastruktura jako kod z Bicep
  - Najlepsze praktyki wdrożeń produkcyjnych
  - Wzorce architektury wieloserviceowej

- **Moduł walidacji przedwdrożeniowej**
  - Planowanie pojemności: weryfikacja dostępności zasobów Azure
  - Wybór SKU: kompleksowe wytyczne dotyczące poziomów usług
  - Kontrole przedstartowe: automatyczne skrypty walidacyjne (PowerShell i Bash)
  - Narzędzia do estymacji kosztów i planowania budżetu

- **Moduł rozwiązywania problemów**
  - Najczęstsze problemy: często występujące problemy i rozwiązania
  - Przewodnik debugowania: systematyczne metody rozwiązywania problemów
  - Zaawansowane techniki i narzędzia diagnostyczne
  - Monitorowanie wydajności i optymalizacja

- **Zasoby i odniesienia**
  - Karta komend: szybkie odniesienie do kluczowych poleceń
  - Słownik: obszerne definicje terminów i akronimów
  - FAQ: szczegółowe odpowiedzi na często zadawane pytania
  - Linki do zewnętrznych zasobów i społeczności

- **Przykłady i szablony**
  - Przykład prostej aplikacji webowej
  - Szablon wdrożenia statycznej strony internetowej
  - Konfiguracja aplikacji kontenerowej
  - Wzorce integracji baz danych
  - Przykłady architektury mikrousługowej
  - Implementacje funkcji serverless

#### Funkcje
- **Wsparcie wieloplatformowe**: przewodniki instalacji i konfiguracji dla Windows, macOS i Linux
- **Różne poziomy umiejętności**: treści zaprojektowane dla studentów i profesjonalnych programistów
- **Fokus praktyczny**: przykłady praktyczne i scenariusze rzeczywiste
- **Kompleksowe pokrycie**: od podstawowych koncepcji po zaawansowane wzorce korporacyjne
- **Podejście bezpieczeństwa**: najlepsze praktyki bezpieczeństwa zintegrowane na każdym etapie
- **Optymalizacja kosztów**: wskazówki dotyczące efektywnego kosztowo wdrażania i zarządzania zasobami

#### Jakość dokumentacji
- **Szczegółowe przykłady kodu**: praktyczne, przetestowane przykłady kodu
- **Instrukcje krok po kroku**: jasne, konkretne wskazówki
- **Kompleksowe obsługiwanie błędów**: rozwiązywanie typowych problemów
- **Integracja najlepszych praktyk**: standardy branżowe i zalecenia
- **Zgodność wersji**: aktualne z najnowszymi usługami Azure i funkcjami azd

## Planowane przyszłe ulepszenia

### Wersja 3.1.0 (Planowana)
#### Rozszerzenie platformy AI
- **Wsparcie multi-modeli**: wzorce integracji dla Hugging Face, Azure Machine Learning i modeli własnych
- **Frameworki agentów AI**: szablony dla wdrożeń LangChain, Semantic Kernel i AutoGen
- **Zaawansowane wzorce RAG**: opcje baz danych wektorowych poza Azure AI Search (Pinecone, Weaviate itp.)
- **Obserwowalność AI**: rozszerzone monitorowanie wydajności modeli, użycia tokenów i jakości odpowiedzi

#### Doświadczenie programistów
- **Rozszerzenie VS Code**: zintegrowane środowisko programistyczne AZD + Microsoft Foundry
- **Integracja GitHub Copilot**: generowanie szablonów AZD wspomagane AI
- **Interaktywne tutoriale**: praktyczne ćwiczenia kodowania z automatyczną walidacją scenariuszy AI
- **Zawartość wideo**: dodatkowe tutoriale wideo dla wzrokowców koncentrujące się na wdrożeniach AI

### Wersja 4.0.0 (Planowana)
#### Wzorce AI dla przedsiębiorstw
- **Ramowy model zarządzania**: zarządzanie modelami AI, zgodność i audyty
- **AI wielonajemcy**: wzorce obsługi wielu klientów z izolowanymi usługami AI
- **Wdrożenia Edge AI**: integracja z Azure IoT Edge i instancjami kontenerów
- **Chmura hybrydowa AI**: wzorce wdrożeń multi-cloud i hybrydowych dla obciążeń AI

#### Zaawansowane funkcje
- **Automatyzacja pipeline AI**: integracja MLOps z pipeline Azure Machine Learning
- **Zaawansowane zabezpieczenia**: wzorce zero-trust, prywatne punkty końcowe i rozszerzona ochrona przed zagrożeniami
- **Optymalizacja wydajności**: zaawansowane strojenie i skalowanie dla aplikacji AI o wysokim przepływie
- **Globalna dystrybucja**: wzorce dostarczania treści i buforowania edge dla aplikacji AI

### Wersja 3.0.0 (Planowana) - zastąpiona przez bieżące wydanie
#### Proponowane dodatki - teraz zaimplementowane w v3.0.0
- ✅ **Treści skoncentrowane na AI**: kompleksowa integracja Microsoft Foundry (Zakończone)
- ✅ **Interaktywne tutoriale**: praktyczne laboratoria warsztatowe AI (Zakończone)
- ✅ **Moduł zaawansowanego bezpieczeństwa**: wzorce bezpieczeństwa specyficzne dla AI (Zakończone)
- ✅ **Optymalizacja wydajności**: strategie strojenia obciążeń AI (Zakończone)

### Wersja 2.1.0 (Planowana) - częściowo zaimplementowana w v3.0.0
#### Drobne ulepszenia - część zrealizowana w bieżącym wydaniu
- ✅ **Dodatkowe przykłady**: scenariusze wdrożeń skoncentrowane na AI (Zakończone)
- ✅ **Rozszerzone FAQ**: pytania specyficzne dla AI i rozwiązywanie problemów (Zakończone)
- **Integracja narzędzi**: rozszerzone przewodniki integracji IDE i edytorów
- ✅ **Rozbudowa monitoringu**: wzorce monitoringu i alertów specyficzne dla AI (Zakończone)

#### Nadal planowane na przyszłe wydania
- **Dokumentacja przyjazna mobilnym urządzeniom**: responsywny design do nauki mobilnej
- **Dostęp offline**: pakiety dokumentacji do pobrania
- **Rozszerzona integracja IDE**: rozszerzenie VS Code dla przepływów pracy AZD + AI
- **Panel społecznościowy**: metryki społeczności w czasie rzeczywistym i śledzenie wkładu

## Współtworzenie changelogu

### Zgłaszanie zmian
Przy współtworzeniu tego repozytorium prosimy o zapewnienie, że wpisy do changelogu zawierają:

1. **Numer wersji**: zgodnie z wersjonowaniem semantycznym (major.minor.patch)
2. **Data**: data wydania lub aktualizacji w formacie RRRR-MM-DD
3. **Kategoria**: Dodano, Zmieniono, Przestarzałe, Usunięte, Naprawione, Bezpieczeństwo
4. **Jasny opis**: zwięzły opis zmiany
5. **Ocena wpływu**: jak zmiany wpływają na obecnych użytkowników

### Kategorie zmian

#### Dodano
- Nowe funkcje, sekcje dokumentacji lub możliwości
- Nowe przykłady, szablony lub zasoby edukacyjne
- Dodatkowe narzędzia, skrypty lub narzędzia użytkowe

#### Zmieniono
- Modyfikacje istniejącej funkcjonalności lub dokumentacji
- Aktualizacje poprawiające jasność lub dokładność
- Restrukturyzacja treści lub organizacji

#### Przestarzałe
- Funkcje lub podejścia wycofywane etapami
- Sekcje dokumentacji zaplanowane do usunięcia
- Metody, które mają lepsze alternatywy

#### Usunięte
- Funkcje, dokumentacja lub przykłady już nieaktualne
- Przestarzałe informacje lub podejścia
- Zduplikowana lub scalona zawartość

#### Naprawione
- Korekty błędów w dokumentacji lub kodzie
- Rozwiązanie zgłoszonych problemów
- Poprawki dokładności lub funkcjonalności


#### Bezpieczeństwo
- Ulepszenia lub poprawki związane z bezpieczeństwem
- Aktualizacje najlepszych praktyk bezpieczeństwa
- Rozwiązanie luk w zabezpieczeniach

### Zasady wersjonowania semantycznego

#### Wersja główna (X.0.0)
- Zmiany łamiące kompatybilność wymagające działania użytkownika
- Znacząca restrukturyzacja treści lub organizacji
- Zmiany zmieniające fundamentalne podejście lub metodologię

#### Wersja mniejsza (X.Y.0)
- Nowe funkcje lub dodatki do treści
- Ulepszenia zachowujące zgodność wsteczną
- Dodatkowe przykłady, narzędzia lub zasoby

#### Wersja poprawkowa (X.Y.Z)
- Poprawki błędów i korekty
- Drobne ulepszenia istniejącej treści
- Wyjaśnienia i niewielkie ulepszenia

## Opinie i sugestie społeczności

Aktywnie zachęcamy społeczność do dzielenia się opiniami w celu ulepszenia tego zasobu edukacyjnego:

### Jak przekazywać opinie
- **GitHub Issues**: Zgłaszanie problemów lub sugestii ulepszeń (mile widziane problemy specyficzne dla AI)
- **Dyskusje na Discordzie**: Dzielenie się pomysłami i interakcja ze społecznością Microsoft Foundry
- **Pull Requesty**: Bezpośredni wkład w ulepszenia treści, szczególnie szablonów i przewodników AI
- **Microsoft Foundry Discord**: Udział w kanale #Azure dotyczący dyskusji o AZD + AI
- **Fora społeczności**: Udział w szerszych dyskusjach deweloperów Azure

### Kategorie opinii
- **Dokładność treści AI**: Poprawki integracji i informacji dotyczących wdrażania usług AI
- **Doświadczenie nauki**: Sugestie dotyczące udoskonalenia przepływu nauki dla deweloperów AI
- **Brakujące treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI
- **Dostępność**: Ulepszenia dla różnych potrzeb edukacyjnych
- **Integracja narzędzi AI**: Sugestie dotyczące lepszej integracji przepływu pracy w rozwoju AI
- **Wzorce produkcyjne AI**: Prośby o wzorce wdrażania AI w przedsiębiorstwach

### Zobowiązania do odpowiedzi
- **Odpowiedź na zgłoszenia**: W ciągu 48 godzin od zgłoszenia problemów
- **Prośby o funkcje**: Ocena w ciągu tygodnia
- **Wkład społeczności**: Przegląd w ciągu tygodnia
- **Problemy bezpieczeństwa**: Priorytet natychmiastowy z przyspieszoną odpowiedzią

## Harmonogram konserwacji

### Regularne aktualizacje
- **Comiesięczne przeglądy**: Sprawdzanie dokładności treści i poprawności linków
- **Kwartalne aktualizacje**: Główne dodatki do treści i ulepszenia
- **Półroczne przeglądy**: Kompleksowa restrukturyzacja i ulepszenia
- **Coroczne wydania**: Aktualizacje głównych wersji z istotnymi usprawnieniami

### Monitorowanie i zapewnienie jakości
- **Testy automatyczne**: Regularna weryfikacja przykładów kodu i linków
- **Integracja opinii społeczności**: Regularne uwzględnianie sugestii użytkowników
- **Aktualizacje technologii**: Dostosowanie do najnowszych usług Azure i wydań azd
- **Audyt dostępności**: Regularne przeglądy zasad projektowania inkluzywnego

## Polityka wsparcia wersji

### Wsparcie dla bieżącej wersji
- **Najnowsza wersja główna**: Pełne wsparcie z regularnymi aktualizacjami
- **Poprzednia wersja główna**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy
- **Wersje dziedziczne**: Tylko wsparcie społecznościowe, brak oficjalnych aktualizacji

### Wskazówki dotyczące migracji
Po wydaniu wersji głównych zapewniamy:
- **Przewodniki migracyjne**: Instrukcje przejścia krok po kroku
- **Uwagi dotyczące kompatybilności**: Szczegóły o zmianach łamiących kompatybilność
- **Wsparcie narzędzi**: Skrypty lub narzędzia pomocnicze przy migracji
- **Wsparcie społeczności**: Dedykowane fora do pytań związanych z migracją

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