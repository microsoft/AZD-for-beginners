# AZD dla początkujących: Uporządkowana ścieżka nauki

![AZD-for-beginners](../../translated_images/pl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatyczne tłumaczenia (zawsze aktualne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](./README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Wolisz sklonować lokalnie?**
>
> To repozytorium zawiera tłumaczenia na ponad 50 języków, co znacząco zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> To da Ci wszystko, czego potrzebujesz, aby ukończyć kurs z dużo szybszym pobieraniem.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co nowego w azd dzisiaj

Azure Developer CLI rozwinął się poza tradycyjne aplikacje webowe i API. Dziś azd to jedno narzędzie do wdrażania **dowolnych** aplikacji w Azure — w tym aplikacji zasilanych SI i inteligentnych agentów.

Co to dla Ciebie oznacza:

- **Agenci SI są teraz pełnoprawnymi obciążeniami azd.** Możesz inicjalizować, wdrażać i zarządzać projektami agentów SI za pomocą tego samego workflow `azd init` → `azd up`, które już znasz.
- **Integracja z Microsoft Foundry** umożliwia wdrażanie modeli, hostowanie agentów i konfigurację usług SI bezpośrednio w ekosystemie szablonów azd.
- **Podstawowy workflow nie uległ zmianie.** Niezależnie, czy wdrażasz aplikację todo, mikroserwis czy kompleksowe rozwiązanie z wieloma agentami SI, polecenia są takie same.

Jeśli już korzystałeś z azd, wsparcie dla SI jest naturalnym rozszerzeniem — nie osobnym narzędziem czy zaawansowanym torem. Jeśli zaczynasz od zera, nauczysz się jednego workflow, które działa we wszystkim.

---

## 🚀 Czym jest Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** to przyjazne dla deweloperów narzędzie wiersza polecenia, które upraszcza wdrażanie aplikacji do Azure. Zamiast ręcznie tworzyć i łączyć dziesiątki zasobów Azure, możesz wdrożyć całe aplikacje jednym poleceniem.

### Magia `azd up`

```bash
# To jedno polecenie robi wszystko:
# ✅ Tworzy wszystkie zasoby Azure
# ✅ Konfiguruje sieć i zabezpieczenia
# ✅ Buduje kod Twojej aplikacji
# ✅ Wdraża do Azure
# ✅ Daje działający adres URL
azd up
```

**To wszystko!** Bez klikania w Azure Portal, bez uczenia się skomplikowanych szablonów ARM, bez ręcznej konfiguracji — po prostu działające aplikacje w Azure.

---

## ❓ Azure Developer CLI czy Azure CLI: Jaka jest różnica?

To najczęstsze pytanie początkujących. Oto prosta odpowiedź:

| Cecha | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cel** | Zarządzanie pojedynczymi zasobami Azure | Wdrażanie kompletnych aplikacji |
| **Podejście** | Skupione na infrastrukturze | Skupione na aplikacjach |
| **Przykład** | `az webapp create --name myapp...` | `azd up` |
| **Krzywa nauki** | Musisz znać usługi Azure | Wystarczy znać swoją aplikację |
| **Najlepsze dla** | DevOps, infrastruktura | Deweloperzy, prototypowanie |

### Prosta analogia

- **Azure CLI** to jak mieć wszystkie narzędzia do budowy domu — młotki, piły, gwoździe. Możesz zbudować wszystko, ale musisz znać się na budowie.
- **Azure Developer CLI** to jak zatrudnić wykonawcę — opisujesz, co chcesz, a oni zajmują się budową.

### Kiedy używać którego

| Scenariusz | Użyj tego |
|----------|----------|
| „Chcę szybko wdrożyć moją aplikację webową” | `azd up` |
| „Muszę tylko utworzyć konto magazynu” | `az storage account create` |
| „Buduję pełną aplikację SI” | `azd init --template azure-search-openai-demo` |
| „Muszę debugować konkretny zasób Azure” | `az resource show` |
| „Chcę wdrożyć produkcyjne rozwiązanie w minutach” | `azd up --environment production` |

### Działają razem!

AZD korzysta z Azure CLI pod spodem. Możesz używać obu:
```bash
# Wdróż swoją aplikację za pomocą AZD
azd up

# Następnie dopracuj konkretne zasoby za pomocą Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Znajdź szablony w Awesome AZD

Nie zaczynaj od zera! **Awesome AZD** to zbiór gotowych do wdrożenia szablonów stworzonych przez społeczność:

| Zasób | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Przeglądaj 200+ szablonów z jednorazowym wdrożeniem |
| 🔗 [**Prześlij szablon**](https://github.com/Azure/awesome-azd/issues) | Wnieś swój własny szablon do społeczności |
| 🔗 [**Repozytorium GitHub**](https://github.com/Azure/awesome-azd) | Dodaj gwiazdkę i badaj źródło |

### Popularne szablony AI z Awesome AZD

```bash
# Czat RAG z modelami Microsoft Foundry + wyszukiwaniem AI
azd init --template azure-search-openai-demo

# Szybka aplikacja czatu AI
azd init --template openai-chat-app-quickstart

# Agenci AI z agentami Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Zacznij w 3 krokach

Zanim zaczniesz, upewnij się, że Twoja maszyna jest gotowa do szablonu, który chcesz wdrożyć:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jeśli którykolwiek z wymaganych testów nie przejdzie, najpierw to napraw, a potem kontynuuj szybki start.

### Krok 1: Zainstaluj AZD (2 minuty)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Krok 2: Uwierzytelnij się dla AZD

```bash
# Opcjonalne, jeśli planujesz używać poleceń Azure CLI bezpośrednio w tym kursie
az login

# Wymagane dla przepływów pracy AZD
azd auth login
```

Jeśli nie jesteś pewien czego potrzebujesz, przejdź pełny proces konfiguracji opisany w [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Wdróż swoją pierwszą aplikację

```bash
# Zainicjalizuj z szablonu
azd init --template todo-nodejs-mongo

# Wdróż do Azure (utworzy wszystko!)
azd up
```

**🎉 To wszystko!** Twoja aplikacja jest teraz dostępna w Azure.

### Posprzątaj (Nie zapomnij!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak korzystać z tego kursu

Ten kurs jest zaprojektowany jako **program nauki progresywnej** — zacznij tam, gdzie czujesz się pewnie i idź dalej:

| Twoje doświadczenie | Zacznij tutaj |
|-----------------|------------|
| **Nowy w Azure** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Znajomość Azure, nowy w AZD** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Chcę wdrażać aplikacje SI** | [Rozdział 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcę praktyki warsztatowej** | [🎓 Interaktywny warsztat](workshop/README.md) - 3-4 godziny prowadzonych ćwiczeń |
| **Potrzebuję wzorców produkcyjnych** | [Rozdział 8: Produkcja i przedsiębiorstwo](#-chapter-8-production--enterprise-patterns) |

### Szybka konfiguracja

1. **Forkuj to repozytorium**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj je**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Zdobądź pomoc**: [Społeczność Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Wolisz sklonować lokalnie?**

> To repozytorium zawiera tłumaczenia na ponad 50 języków, co znacząco zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To da Ci wszystko, czego potrzebujesz, aby ukończyć kurs z dużo szybszym pobieraniem.


## Przegląd kursu

Opanuj Azure Developer CLI (azd) poprzez uporządkowane rozdziały zaprojektowane do nauki krok po kroku. **Szczególny nacisk na wdrażanie aplikacji SI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla nowoczesnych deweloperów

Na podstawie informacji ze społeczności Microsoft Foundry Discord, **45% deweloperów chce używać AZD do obciążeń SI**, ale napotyka wyzwania związane z:
- Złożonymi architekturami SI wykorzystującymi wiele usług
- Najlepszymi praktykami produkcyjnego wdrażania SI  
- Integracją i konfiguracją usług Azure SI
- Optymalizacją kosztów obciążeń SI
- Rozwiązywaniem problemów specyficznych dla wdrożeń SI

### Cele nauki

Po ukończeniu tego uporządkowanego kursu będziesz potrafił:
- **Opanować podstawy AZD**: kluczowe koncepcje, instalację i konfigurację
- **Wdrażać aplikacje SI**: używać AZD z usługami Microsoft Foundry
- **Wdrażać infrastrukturę jako kod**: zarządzać zasobami Azure za pomocą szablonów Bicep
- **Rozwiązywać problemy we wdrożeniach**: usuwać popularne błędy i debugować
- **Optymalizować na produkcji**: zagadnienia bezpieczeństwa, skalowalności, monitoringu i zarządzania kosztami
- **Budować rozwiązania wieloagentowe**: wdrażać złożone architektury SI

## Zanim zaczniesz: konta, dostęp i założenia

Przed rozpoczęciem rozdziału 1 upewnij się, że masz następujące elementy. Kroki instalacji w kolejnych sekcjach zakładają, że te kwestie są już załatwione.
- **Subskrypcja Azure**: Możesz użyć istniejącej subskrypcji z pracy lub własnego konta albo utworzyć [bezpłatną wersję próbną](https://aka.ms/azurefreetrial), aby rozpocząć.
- **Uprawnienia do tworzenia zasobów Azure**: Do większości ćwiczeń powinieneś mieć co najmniej dostęp **Współtwórcy** do docelowej subskrypcji lub grupy zasobów. Niektóre rozdziały mogą również zakładać, że potrafisz tworzyć grupy zasobów, tożsamości zarządzane oraz przypisania RBAC.
- [**Konto GitHub**](https://github.com): Przydatne do forka repozytorium, śledzenia własnych zmian oraz korzystania z GitHub Codespaces podczas warsztatów.
- **Wymagania narzędzi uruchomieniowych szablonów**: Niektóre szablony wymagają lokalnych narzędzi takich jak Node.js, Python, Java lub Docker. Uruchom walidator instalacji przed rozpoczęciem, aby wcześnie wykryć brakujące narzędzia.
- **Podstawowa znajomość terminala**: Nie musisz być ekspertem, ale powinieneś czuć się komfortowo uruchamiając polecenia takie jak `git clone`, `azd auth login` oraz `azd up`.

> **Pracujesz w subskrypcji korporacyjnej?**  
> Jeśli Twoje środowisko Azure jest zarządzane przez administratora, upewnij się wcześniej, że możesz wdrażać zasoby w subskrypcji lub grupie zasobów, którą planujesz używać. Jeśli nie, poproś o subskrypcję sandbox lub dostęp Współtwórcy przed rozpoczęciem.

> **Nowy w Azure?**  
> Zacznij od własnej wersji próbnej Azure lub subskrypcji pay-as-you-go na https://aka.ms/azurefreetrial, aby móc wykonać ćwiczenia kompleksowo bez konieczności oczekiwania na zatwierdzenia na poziomie dzierżawy.

## 🗺️ Mapa kursu: Szybka nawigacja według rozdziału

Każdy rozdział ma dedykowany plik README z celami nauki, szybkim startem i ćwiczeniami:

| Rozdział | Temat | Lekcje | Czas trwania | Złożoność |
|---------|-------|---------|----------|------------|
| **[Rozdział 1: Podstawy](docs/chapter-01-foundation/README.md)** | Rozpoczęcie pracy | [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacja](docs/chapter-01-foundation/installation.md) &#124; [Pierwszy projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Rozdział 2: Rozwój AI](docs/chapter-02-ai-development/README.md)** | Aplikacje AI-First | [Integracja Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenci AI](docs/chapter-02-ai-development/agents.md) &#124; [Wdrożenie modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsztat](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 godz. | ⭐⭐ |
| **[Rozdział 3: Konfiguracja](docs/chapter-03-configuration/README.md)** | Uwierzytelnianie i bezpieczeństwo | [Konfiguracja](docs/chapter-03-configuration/configuration.md) &#124; [Uwierzytelnianie i bezpieczeństwo](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Rozdział 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i wdrożenie | [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 godz. | ⭐⭐⭐ |
| **[Rozdział 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Rozwiązania AI Multi-Agent | [Scenariusz retail](examples/retail-scenario.md) &#124; [Wzorce koordynacji](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 godz. | ⭐⭐⭐⭐ |
| **[Rozdział 6: Przed wdrożeniem](docs/chapter-06-pre-deployment/README.md)** | Planowanie i walidacja | [Sprawdzanie przedstartowe](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 godz. | ⭐⭐ |
| **[Rozdział 7: Rozwiązywanie problemów](docs/chapter-07-troubleshooting/README.md)** | Debugowanie i naprawa | [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugowanie](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemy AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 godz. | ⭐⭐ |
| **[Rozdział 8: Produkcja](docs/chapter-08-production/README.md)** | Wzorce korporacyjne | [Praktyki produkcyjne](docs/chapter-08-production/production-ai-practices.md) | 2-3 godz. | ⭐⭐⭐⭐ |
| **[🎓 Warsztaty](workshop/README.md)** | Laboratorium praktyczne | [Wprowadzenie](workshop/docs/instructions/0-Introduction.md) &#124; [Wybór](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Analiza](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Sprzątanie](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 godz. | ⭐⭐ |

**Całkowity czas kursu:** ~10-14 godzin | **Postęp umiejętności:** Początkujący → Gotowy do produkcji

---

## 📚 Rozdziały do nauki

*Wybierz ścieżkę nauki zgodnie z poziomem doświadczenia i celami*

### 🚀 Rozdział 1: Podstawy i szybki start  
**Wymagania wstępne**: subskrypcja Azure, podstawowa znajomość wiersza poleceń  
**Czas trwania**: 30-45 minut  
**Złożoność**: ⭐

#### Czego się nauczysz
- Podstawy Azure Developer CLI
- Instalacja AZD na Twojej platformie
- Twoje pierwsze udane wdrożenie

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Co to jest Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Teoria**: [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) – podstawowe pojęcia i terminologia  
- **⚙️ Instalacja**: [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md) – przewodniki specyficzne dla platformy  
- **🛠️ Praktyka**: [Twój pierwszy projekt](docs/chapter-01-foundation/first-project.md) – tutorial krok po kroku  
- **📋 Szybka ściąga**: [Cheat Sheet poleceń](resources/cheat-sheet.md)

#### Ćwiczenia praktyczne  
```bash
# Szybkie sprawdzenie instalacji
azd version

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Efekt rozdziału**: Pomyślnie wdrożona prosta aplikacja webowa na Azure z użyciem AZD

**✅ Kryteria sukcesu:**  
```bash
# Po ukończeniu rozdziału 1 powinieneś być w stanie:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża do Azure
azd show                # Wyświetla URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Czyści zasoby
```
  
**📊 Czas potrzebny:** 30-45 minut  
**📈 Poziom umiejętności:** Potrafi samodzielnie wdrażać podstawowe aplikacje  

---

### 🤖 Rozdział 2: AI-First Development (Polecany dla developerów AI)  
**Wymagania wstępne**: ukończony rozdział 1  
**Czas trwania**: 1-2 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji zasilanych AI
- Zrozumienie konfiguracji usług AI

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Integracja Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Agenci AI**: [Przewodnik po agentach AI](docs/chapter-02-ai-development/agents.md) – wdrażanie inteligentnych agentów z AZD  
- **📖 Wzorce**: [Wdrożenie modelu AI](docs/chapter-02-ai-development/ai-model-deployment.md) – wdrażanie i zarządzanie modelami AI  
- **🛠️ Warsztat**: [Laboratorium AI](docs/chapter-02-ai-development/ai-workshop-lab.md) – przygotuj swoje rozwiązania AI pod AZD  
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) – nauka w przeglądarce z MkDocs * środowisko DevContainer  
- **📋 Szablony**: [Szablony Microsoft Foundry](#materiały-warsztatowe)  
- **📝 Przykłady**: [Przykłady wdrożeń AZD](examples/README.md)

#### Ćwiczenia praktyczne  
```bash
# Wdróż swoją pierwszą aplikację AI
azd init --template azure-search-openai-demo
azd up

# Wypróbuj dodatkowe szablony AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Efekt rozdziału**: Wdrożona i skonfigurowana aplikacja czatu zasilana AI z funkcjami RAG

**✅ Kryteria sukcesu:**  
```bash
# Po rozdziale 2 powinieneś być w stanie:
azd init --template azure-search-openai-demo
azd up
# Przetestować interfejs czatu AI
# Zadawać pytania i otrzymywać odpowiedzi zasilane przez AI wraz ze źródłami
# Zweryfikować, czy integracja wyszukiwania działa
azd monitor  # Sprawdzić, czy Application Insights wyświetla telemetrię
azd down --force --purge
```
  
**📊 Czas potrzebny:** 1-2 godziny  
**📈 Poziom umiejętności:** Potrafi wdrażać i konfigurować aplikacje AI gotowe do produkcji  
**💰 Świadomość kosztów:** Zrozumienie kosztów rozwojowych $80-150/mies., kosztów produkcyjnych $300-3500/mies.

#### 💰 Rozważania kosztowe dla wdrożeń AI

**Środowisko developerskie (szacunkowo $80-150/mies.):**  
- Modele Microsoft Foundry (Pay-as-you-go): $0-50/mies. (zależnie od zużycia tokenów)  
- AI Search (poziom podstawowy): $75/mies.  
- Container Apps (konsumpcja): $0-20/mies.  
- Storage (standard): $1-5/mies.

**Środowisko produkcyjne (szacunkowo $300-3,500+/mies.):**  
- Modele Microsoft Foundry (PTU dla stabilnej wydajności): $3000+/mies. LUB Pay-as-you-go przy dużej skali  
- AI Search (poziom standardowy): $250/mies.  
- Container Apps (dedykowane): $50-100/mies.  
- Application Insights: $5-50/mies.  
- Storage (premium): $10-50/mies.

**💡 Wskazówki optymalizacyjne kosztów:**  
- Korzystaj z **Bezpłatnego poziomu** modeli Microsoft Foundry do nauki (w Azure OpenAI 50,000 tokenów/mies. wliczone)  
- Używaj `azd down` do deaktywacji zasobów, gdy nie rozwijasz aktywnie  
- Zacznij od rozliczania na zasadzie konsumpcji, na PTU przejdź dopiero w produkcji  
- Użyj `azd provision --preview` do szacowania kosztów przed wdrożeniem  
- Włącz autoskalowanie: płacisz tylko za rzeczywiste użycie

**Monitorowanie kosztów:**  
```bash
# Sprawdź szacowane miesięczne koszty
azd provision --preview

# Monitoruj rzeczywiste koszty w Azure Portal
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie  
**Wymagania wstępne**: ukończony rozdział 1  
**Czas trwania**: 45-60 minut  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskiem
- Najlepsze praktyki uwierzytelniania i bezpieczeństwa
- Nazewnictwo i organizacja zasobów

#### Materiały do nauki
- **📖 Konfiguracja**: [Przewodnik konfiguracji](docs/chapter-03-configuration/configuration.md) – ustawianie środowiska  
- **🔐 Bezpieczeństwo**: [Wzorce uwierzytelniania i tożsamości zarządzanej](docs/chapter-03-configuration/authsecurity.md)  
- **📝 Przykłady**: [Przykład aplikacji bazodanowej](examples/database-app/README.md) – przykłady AZD dla baz danych

#### Ćwiczenia praktyczne  
- Konfiguracja wielu środowisk (dev, staging, prod)  
- Konfiguracja uwierzytelniania z tożsamością zarządzaną  
- Implementacja konfiguracji specyficznych dla środowiska

**💡 Efekt rozdziału**: Zarządzaj wieloma środowiskami z właściwym uwierzytelnianiem i bezpieczeństwem

---

### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenie  
**Wymagania wstępne**: ukończone rozdziały 1-3  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeniowe
- Infrastruktura jako kod za pomocą Bicep
- Strategie provisioningu zasobów

#### Materiały do nauki
- **📖 Wdrożenie**: [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) – kompletne workflow  
- **🏗️ Provisioning**: [Provisioning zasobów](docs/chapter-04-infrastructure/provisioning.md) – zarządzanie zasobami Azure  
- **📝 Przykłady**: [Przykład aplikacji kontenerowej](../../examples/container-app) – wdrożenia konteneryzowane

#### Ćwiczenia praktyczne  
- Tworzenie własnych szablonów Bicep  
- Wdrażanie aplikacji wieloserwisowych  
- Implementacja strategii wdrożenia blue-green

**💡 Efekt rozdziału**: Wdrażaj złożone aplikacje wieloserwisowe z użyciem niestandardowych szablonów infrastruktury

---

### 🎯 Rozdział 5: Rozwiązania AI Multi-Agent (Zaawansowany)  
**Wymagania wstępne**: ukończone rozdziały 1-2  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury multi-agentowej  
- Orkiestracja i koordynacja agentów  
- Produkcyjne wdrożenia AI

#### Materiały do nauki
- **🤖 Projekt specjalny**: [Rozwiązanie retail multi-agent](examples/retail-scenario.md) – kompletna implementacja  
- **🛠️ Szablony ARM**: [Pakiet szablonów ARM multi-agent](../../examples/retail-multiagent-arm-template) – wdrożenie jednym kliknięciem  
- **📖 Architektura**: [Wzorce koordynacji multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md)

#### Ćwiczenia praktyczne  
```bash
# Wdróż kompletne rozwiązanie wieloagentowe dla handlu detalicznego
cd examples/retail-multiagent-arm-template
./deploy.sh

# Zbadaj konfiguracje agentów
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Efekt rozdziału**: Wdrażanie i zarządzanie produkcyjnym rozwiązaniem AI multi-agent z agentami obsługi klienta i magazynowymi

---

### 🔍 Rozdział 6: Walidacja i planowanie przed wdrożeniem  
**Wymagania wstępne**: ukończony rozdział 4  
**Czas trwania**: 1 godzina  
**Złożoność**: ⭐⭐
#### Czego się nauczysz
- Planowanie pojemności i walidacja zasobów
- Strategie wyboru SKU
- Kontrole wstępne i automatyzacja

#### Materiały do nauki
- **📊 Planowanie**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Walidacja zasobów
- **💰 Wybór**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Wybory opłacalne kosztowo
- **✅ Walidacja**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Zautomatyzowane skrypty

#### Ćwiczenia praktyczne
- Uruchom skrypty walidacji pojemności
- Optymalizuj wybór SKU pod kątem kosztów
- Wdroż zautomatyzowane kontrole przed wdrożeniem

**💡 Rezultat rozdziału**: Zweryfikuj i optymalizuj wdrożenia przed ich realizacją

---

### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie
**Wymagania wstępne**: ukończony dowolny rozdział wdrożeniowy  
**Czas trwania**: 1-1,5 godziny  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Systematyczne podejścia do debugowania
- Typowe problemy i ich rozwiązania
- Specyficzne techniki rozwiązywania problemów AI

#### Materiały do nauki
- **🔧 Typowe problemy**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rozwiązania
- **🕵️ Debugowanie**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Strategie krok po kroku
- **🤖 Problemy AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemy z usługami AI

#### Ćwiczenia praktyczne
- Diagnozuj awarie wdrożeń
- Rozwiąż problemy z uwierzytelnianiem
- Debuguj łączność usług AI

**💡 Rezultat rozdziału**: Samodzielnie diagnozuj i rozwiązuj powszechne problemy wdrożeniowe

---

### 🏢 Rozdział 8: Wzorce produkcyjne i korporacyjne
**Wymagania wstępne**: ukończone rozdziały 1-4  
**Czas trwania**: 2-3 godziny  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Wzorce bezpieczeństwa korporacyjnego
- Monitorowanie i optymalizacja kosztów

#### Materiały do nauki
- **🏭 Produkcja**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Wzorce korporacyjne
- **📝 Przykłady**: [Microservices Example](../../examples/microservices) - Złożone architektury
- **📊 Monitorowanie**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorowanie

#### Ćwiczenia praktyczne
- Wdroż wzorce bezpieczeństwa korporacyjnego
- Skonfiguruj kompleksowe monitorowanie
- Wdróż do produkcji z właściwym nadzorem

**💡 Rezultat rozdziału**: Wdróż aplikacje gotowe do produkcji z pełną funkcjonalnością produkcyjną

---

## 🎓 Przegląd warsztatów: Praktyczne doświadczenie w nauce

> **⚠️ STATUS WARSZTATU: Aktywny rozwój**  
> Materiały warsztatowe są w trakcie opracowywania i dopracowywania. Podstawowe moduły działają, ale niektóre zaawansowane sekcje są niekompletne. Pracujemy nad ukończeniem całej zawartości. [Śledź postęp →](workshop/README.md)

### Interaktywne materiały warsztatowe
**Kompleksowa nauka praktyczna z narzędziami w przeglądarce i ćwiczeniami z przewodnikiem**

Nasze materiały warsztatowe oferują uporządkowane, interaktywne doświadczenie edukacyjne, które uzupełnia powyższy program rozdziałowy. Warsztat jest zaprojektowany zarówno do nauki samodzielnej, jak i sesji prowadzonych przez instruktora.

#### 🛠️ Funkcje warsztatu
- **Interfejs w przeglądarce**: Kompletny warsztat oparty na MkDocs z wyszukiwaniem, kopiowaniem i motywami
- **Integracja z GitHub Codespaces**: Jeden klik na konfigurację środowiska deweloperskiego
- **Struktura nauki**: 8 modułów ćwiczeń z przewodnikiem (3-4 godziny łącznie)
- **Stopniowana metodologia**: Wprowadzenie → Wybór → Walidacja → Dekonstrukcja → Konfiguracja → Dostosowanie → Demontaż → Podsumowanie
- **Interaktywne środowisko DevContainer**: Wstępnie skonfigurowane narzędzia i zależności

#### 📚 Struktura modułów warsztatowych
Warsztat wykorzystuje **8-modułową metodologię progresywną**, która prowadzi od odkrycia do mistrzostwa wdrożeniowego:

| Moduł | Temat | Co zrobisz | Czas trwania |
|--------|-------|------------|--------------|
| **0. Wprowadzenie** | Przegląd warsztatu | Poznasz cele nauki, wymagania wstępne i strukturę warsztatu | 15 min |
| **1. Wybór** | Odkrywanie szablonów | Przegląd szablonów AZD i wybór odpowiedniego AI do scenariusza | 20 min |
| **2. Walidacja** | Wdrożenie i weryfikacja | Wdróż szablon za pomocą `azd up` i sprawdź działanie infrastruktury | 30 min |
| **3. Dekonstrukcja** | Poznaj strukturę | Użyj GitHub Copilot do eksploracji architektury szablonu, plików Bicep i organizacji kodu | 30 min |
| **4. Konfiguracja** | Szczegóły azure.yaml | Opanuj konfigurację `azure.yaml`, haczyki cyklu życia i zmienne środowiskowe | 30 min |
| **5. Dostosowanie** | Spersonalizuj | Włącz AI Search, śledzenie, ewaluację i dostosuj do swojego scenariusza | 45 min |
| **6. Demontaż** | Posprzątaj | Bezpiecznie usuń zasoby poleceniem `azd down --purge` | 15 min |
| **7. Podsumowanie** | Co dalej | Przegląd osiągnięć, kluczowych pojęć i dalsza nauka | 15 min |

**Przebieg warsztatu:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Rozpoczęcie warsztatu  
```bash
# Opcja 1: GitHub Codespaces (zalecane)
# Kliknij "Code" → "Create codespace on main" w repozytorium

# Opcja 2: Lokalny rozwój
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postępuj zgodnie z instrukcjami konfiguracji w workshop/README.md
```
  
#### 🎯 Cele nauki warsztatu  
Uczestnicy po ukończeniu warsztatu:  
- **Wdróż aplikacje AI produkcyjne**: Używaj AZD z usługami Microsoft Foundry  
- **Opanuj wieloagentowe architektury**: Wdróż skoordynowane rozwiązania z agentami AI  
- **Stosuj najlepsze praktyki bezpieczeństwa**: Konfiguruj uwierzytelnianie i kontrolę dostępu  
- **Optymalizuj skalę**: Projektuj opłacalne i wydajne wdrożenia  
- **Rozwiązuj problemy wdrożeniowe**: Samodzielnie usuwaj typowe błędy

#### 📖 Materiały warsztatowe  
- **🎥 Przewodnik interaktywny**: [Workshop Materials](workshop/README.md) - Środowisko nauki w przeglądarce  
- **📋 Instrukcje etap po etapie**:  
  - [0. Wprowadzenie](workshop/docs/instructions/0-Introduction.md) - Przegląd i cele warsztatu  
  - [1. Wybór](workshop/docs/instructions/1-Select-AI-Template.md) - Znajdź i wybierz szablony AI  
  - [2. Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) - Wdróż i zweryfikuj szablony  
  - [3. Dekonstrukcja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Eksploracja architektury szablonu  
  - [4. Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) - Opanuj azure.yaml  
  - [5. Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) - Spersonalizuj do scenariusza  
  - [6. Demontaż](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Posprzątaj zasoby  
  - [7. Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) - Podsumowanie i dalsze kroki  
- **🛠️ Laboratorium AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ćwiczenia skoncentrowane na AI  
- **💡 Szybki start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfiguracja środowiska

**Idealne dla**: Szkoleń korporacyjnych, studiów uniwersyteckich, nauki indywidualnej i bootcampów dla programistów.

---

## 📖 Głębokie nurkowanie: możliwości AZD

Poza podstawami, AZD oferuje potężne funkcje dla wdrożeń produkcyjnych:

- **Wdrożenia oparte na szablonach** - Użyj gotowych szablonów dla typowych wzorców aplikacji  
- **Infrastruktura jako kod** - Zarządzaj zasobami Azure przy pomocy Bicep lub Terraform  
- **Zintegrowane przepływy pracy** - Bezproblemowe provisionowanie, wdrażanie i monitorowanie aplikacji  
- **Przyjazne dla dewelopera** - Optymalizacja produktywności i doświadczenia programisty

### **AZD + Microsoft Foundry: idealne do wdrożeń AI**

**Dlaczego AZD dla rozwiązań AI?** AZD odpowiada na główne wyzwania deweloperów AI:

- **Szablony gotowe na AI** - Prekonfigurowane szablony dla modeli Microsoft Foundry, Cognitive Services i obciążeń ML  
- **Bezpieczne wdrożenia AI** - Wbudowane wzorce bezpieczeństwa dla usług AI, kluczy API i endpointów modeli  
- **Produkcyjne wzorce AI** - Najlepsze praktyki dla skalowalnych, opłacalnych wdrożeń AI  
- **End-to-End przepływy pracy AI** - Od rozwoju modelu po wdrożenie produkcyjne z odpowiednim monitorowaniem  
- **Optymalizacja kosztów** - Inteligentne strategie alokacji zasobów i skalowania dla obciążeń AI  
- **Integracja Microsoft Foundry** - Płynne połączenie z katalogiem modeli i endpointami Microsoft Foundry

---

## 🎯 Biblioteka szablonów i przykładów

### Polecane: szablony Microsoft Foundry
**Zacznij tutaj, jeśli wdrażasz aplikacje AI!**

> **Uwaga:** Te szablony demonstrują różne wzorce AI. Niektóre to zewnętrzne przykłady Azure, inne implementacje lokalne.

| Szablon | Rozdział | Poziom trudności | Usługi | Typ |
|----------|----------|------------------|---------|-----|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Rozdział 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zewnętrzny |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zewnętrzny |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zewnętrzny |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zewnętrzny |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalny** |

### Polecane: kompletne scenariusze nauki  
**Szablony aplikacji gotowych do produkcji powiązane z rozdziałami nauki**

| Szablon | Rozdział do nauki | Poziom trudności | Kluczowa nauka |
|----------|-------------------|------------------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | Podstawowe wzorce wdrożeń AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | Implementacja RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Rozdział 4 | ⭐⭐ | Integracja z Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | Framework agentów i wywoływanie funkcji |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐ | Orkiestracja AI dla przedsiębiorstw |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | Architektura multi-agent z agentami Klienta i Stanów magazynowych |

### Nauka poprzez przykłady

> **📌 Przykłady lokalne vs. zewnętrzne:**  
> **Przykłady lokalne** (w tym repozytorium) = gotowe do użycia od razu  
> **Przykłady zewnętrzne** (Azure Samples) = klonuj z powiązanych repozytoriów

#### Przykłady lokalne (gotowe do użycia)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompleksowa implementacja produkcyjna z szablonami ARM  
  - Architektura multi-agent (Klient + agenci magazynu)  
  - Kompleksowe monitorowanie i ewaluacja  
  - Jednoklikowe wdrożenie za pomocą szablonu ARM

#### Przykłady lokalne - Aplikacje kontenerowe (rozdziały 2-5)
**Kompleksowe przykłady wdrożeń kontenerowych w tym repozytorium:**  
- [**Container App Examples**](examples/container-app/README.md) - Kompletny przewodnik po wdrożeniach kontenerów  
  - [Proste API Flask](../../examples/container-app/simple-flask-api) - Podstawowe REST API ze skalowaniem do zera  
  - [Architektura mikroserwisów](../../examples/container-app/microservices) - Produkcyjne wdrożenie multi-serwisowe  
  - Szybki start, produkcja i zaawansowane wzorce wdrożeń  
  - Monitorowanie, bezpieczeństwo i wskazówki dotyczące optymalizacji kosztów

#### Przykłady zewnętrzne - proste aplikacje (rozdziały 1-2)
**Sklonuj te repozytoria Azure Samples, by zacząć:**  
- [Prosta aplikacja WWW - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Podstawowe wzorce wdrożeń  
- [Statyczna strona - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Wdrożenie zawartości statycznej  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Wdrożenie REST API

#### Przykłady zewnętrzne - integracja baz danych (rozdziały 3-4)  
- [Aplikacja Baza Danych - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Wzorce łączności z bazą danych
- [Funkcje + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Bezserwerowy przepływ danych

#### Zewnętrzne przykłady - Zaawansowane wzorce (rozdziały 4-8)
- [Mikrousługi Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury wieloserwisowe
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Przetwarzanie w tle  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Gotowe do produkcji wzorce ML

### Zewnętrzne kolekcje szablonów
- [**Oficjalna galeria szablonów AZD**](https://azure.github.io/awesome-azd/) - Wyselekcjonowana kolekcja oficjalnych i społecznościowych szablonów
- [**Szablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacja szablonów Microsoft Learn
- [**Katalog przykładów**](examples/README.md) - Lokalne przykłady naukowe z detalicznymi wyjaśnieniami

---

## 📚 Zasoby edukacyjne i odnośniki

### Szybkie odnośniki
- [**Skrót poleceń**](resources/cheat-sheet.md) - Podstawowe polecenia azd uporządkowane wg rozdziałów
- [**Słownik terminów**](resources/glossary.md) - Terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - Najczęściej zadawane pytania uporządkowane wg rozdziałów
- [**Przewodnik nauki**](resources/study-guide.md) - Kompleksowe ćwiczenia praktyczne

### Warsztaty praktyczne
- [**Laboratorium AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Przygotuj swoje rozwiązania AI do wdrożenia za pomocą AZD (2-3 godziny)
- [**Warsztat interaktywny**](workshop/README.md) - 8 modułów prowadzonych ćwiczeń z MkDocs i GitHub Codespaces
  - Kolejność: Wprowadzenie → Wybór → Walidacja → Rozbiórka → Konfiguracja → Personalizacja → Demontaż → Podsumowanie

### Zewnętrzne źródła nauki
- Dokumentacja Azure Developer CLI: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Centrum architektury Azure: https://learn.microsoft.com/en-us/azure/architecture/
- Kalkulator cen Azure: https://azure.microsoft.com/pricing/calculator/
- Status usług Azure: https://status.azure.com/

### Umiejętności agenta AI dla twojego edytora
- [**Umiejętności Microsoft Azure na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otwartych umiejętności agenta dla AI Azure, Foundry, wdrożeń, diagnostyki, optymalizacji kosztów i innych. Zainstaluj je w GitHub Copilot, Cursor, Claude Code lub dowolnym wspieranym agencie:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Szybki poradnik rozwiązywania problemów

**Typowe problemy początkujących i szybkie rozwiązania:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Najpierw zainstaluj AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Zweryfikuj instalację
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" lub "Subscription not set"</strong></summary>

```bash
# Wyświetl dostępne subskrypcje
az account list --output table

# Ustaw domyślną subskrypcję
az account set --subscription "<subscription-id-or-name>"

# Ustaw dla środowiska AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Zweryfikuj
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" lub "Quota exceeded"</strong></summary>

```bash
# Wypróbuj różne regiony Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Lub użyj mniejszych SKU w środowisku deweloperskim
# Edytuj infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" przerywa w połowie</strong></summary>

```bash
# Opcja 1: Wyczyść i spróbuj ponownie
azd down --force --purge
azd up

# Opcja 2: Napraw tylko infrastrukturę
azd provision

# Opcja 3: Sprawdź szczegółowy status
azd show

# Opcja 4: Sprawdź logi w Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" lub "Token expired"</strong></summary>

```bash
# Ponowna uwierzytelnienie dla AZD
azd auth logout
azd auth login

# Opcjonalnie: odśwież także Azure CLI, jeśli korzystasz z poleceń az
az logout
az login

# Zweryfikuj uwierzytelnienie
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" lub konflikty nazw</strong></summary>

```bash
# AZD generuje unikalne nazwy, ale jeśli wystąpi konflikt:
azd down --force --purge

# Następnie spróbuj ponownie z nowym środowiskiem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Wdrażanie szablonu trwa zbyt długo</strong></summary>

**Typowe czasy oczekiwania:**
- Prosta aplikacja web: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (wolne przydzielanie OpenAI)

```bash
# Sprawdź postęp
azd show

# Jeśli utknięcie trwa >30 minut, sprawdź portal Azure:
azd monitor --overview
# Szukaj nieudanych wdrożeń
```
</details>

<details>
<summary><strong>❌ "Permission denied" lub "Forbidden"</strong></summary>

```bash
# Sprawdź swoją rolę w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrzebujesz co najmniej roli "Współtwórca"
# Poproś administratora Azure o przyznanie:
# - Współtwórca (dla zasobów)
# - Administrator dostępu użytkowników (dla przypisań ról)
```
</details>

<details>
<summary><strong>❌ Nie można znaleźć URL wdrożonej aplikacji</strong></summary>

```bash
# Pokaż wszystkie punkty końcowe usług
azd show

# Lub otwórz portal Azure
azd monitor

# Sprawdź konkretną usługę
azd env get-values
# Szukaj zmiennych *_URL
```
</details>

### 📚 Pełne zasoby rozwiązywania problemów

- **Podręcznik problemów typowych:** [Szczegółowe rozwiązania](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemy specyficzne dla AI:** [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Poradnik debugowania:** [Instrukcje krok po kroku](docs/chapter-07-troubleshooting/debugging.md)
- **Uzyskaj pomoc:** [Discord Azure](https://discord.gg/microsoft-azure) kanał #azure-developer-cli

---

## 🎓 Ukończenie kursu i certyfikacja

### Monitorowanie postępów
Śledź swoje postępy nauki w każdym rozdziale:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój skupiony na AI ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenia ✅
- [ ] **Rozdział 5**: Rozwiązania AI wieloagentowe ✅
- [ ] **Rozdział 6**: Walidacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Wzorce produkcyjne i korporacyjne ✅

### Weryfikacja nauki
Po ukończeniu każdego rozdziału zweryfikuj wiedzę przez:
1. **Ćwiczenie praktyczne**: Zrealizuj wdrożenie praktyczne rozdziału
2. **Sprawdzenie wiedzy**: Przejrzyj sekcję FAQ dla swojego rozdziału
3. **Dyskusje społecznościowe**: Podziel się doświadczeniami na Discordzie Azure
4. **Następny rozdział**: Przejdź do kolejnego poziomu złożoności

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów zyskasz:
- **Doświadczenie produkcyjne**: Wdrożone rzeczywiste aplikacje AI w Azure
- **Umiejętności zawodowe**: Gotowość do wdrożeń korporacyjnych  
- **Uznanie społeczności**: Aktywny członek społeczności programistów Azure
- **Awans kariery**: Poszukiwane umiejętności AZD i wdrożeń AI

---

## 🤝 Społeczność i wsparcie

### Uzyskaj pomoc i wsparcie
- **Problemy techniczne:** [Zgłaszaj błędy i proponuj funkcje](https://github.com/microsoft/azd-for-beginners/issues)
- **Pytania edukacyjne:** [Społeczność Microsoft Azure Discord](https://discord.gg/microsoft-azure) oraz [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specyficzna dla AI:** Dołącz do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacja:** [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wgląd społeczności z Discord Microsoft Foundry

**Ostatnie wyniki ankiety z kanału #Azure:**
- **45%** deweloperów chce używać AZD do zadań AI
- **Główne wyzwania**: Wdrożenia wieloserwisowe, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najczęściej proszone:** szablony AI, poradniki rozwiązywania problemów, najlepsze praktyki

**Dołącz do społeczności, aby:**
- Dzielić się doświadczeniami AZD + AI i uzyskać pomoc
- Uzyskać wczesny dostęp do nowych szablonów AI
- Współtworzyć najlepsze praktyki wdrażania AI
- Wpływać na przyszły rozwój funkcji AI + AZD

### Współtworzenie kursu
Zapraszamy do współpracy! Przeczytaj nasz [Przewodnik dla współtwórców](CONTRIBUTING.md) dotyczący:
- **Ulepszeń treści:** Rozwijaj istniejące rozdziały i przykłady
- **Nowych przykładów:** Dodawaj scenariusze rzeczywiste i szablony  
- **Tłumaczeń:** Pomóż w utrzymaniu wersji wielojęzycznych
- **Zgłaszania błędów:** Poprawiaj dokładność i jasność
- **Standardów społeczności:** Przestrzegaj naszych inkluzywnych wytycznych społecznościowych

---

## 📄 Informacje o kursie

### Licencja
Projekt jest licencjonowany na podstawie licencji MIT - zobacz plik [LICENSE](../../LICENSE) dla szczegółów.

### Powiązane zasoby edukacyjne Microsoft

Nasz zespół tworzy inne kompleksowe kursy edukacyjne:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j dla początkujących](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js dla początkujących](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain dla początkujących](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenci
[![AZD dla początkujących](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI dla początkujących](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP dla początkujących](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agenci dla początkujących](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Generative AI
[![Generative AI dla początkujących](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Podstawy nauki
[![ML dla początkujących](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science dla Początkujących](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI dla Początkujących](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cyberbezpieczeństwo dla Początkujących](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tworzenie Stron WWW dla Początkujących](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT dla Początkujących](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development dla Początkujących](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot dla AI w Programowaniu Parametrycznym](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot dla C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Przygody z Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Nawigacja po Kursie

**🚀 Gotowy, by zacząć naukę?**

**Początkujący**: Zacznij od [Rozdział 1: Podstawy i Szybki Start](#-chapter-1-foundation--quick-start)  
**Deweloperzy AI**: Przejdź do [Rozdział 2: Rozwój AI-Pierwszy](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Doświadczeni Deweloperzy**: Zacznij od [Rozdział 3: Konfiguracja i Uwierzytelnianie](#️-chapter-3-configuration--authentication)

**Kolejne kroki**: [Rozpocznij Rozdział 1 - Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uważany za źródło wiążące. W przypadku informacji o krytycznym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->