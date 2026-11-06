# AZD dla początkujących: Ustrukturyzowana ścieżka nauki

![AZD-for-beginners](../../translated_images/pl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatyczne tłumaczenia (zawsze aktualne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabski](../ar/README.md) | [Bengalski](../bn/README.md) | [Bułgarski](../bg/README.md) | [Birmański (Myanmar)](../my/README.md) | [Chiński (upro.)](../zh-CN/README.md) | [Chiński (tradycyjny, Hongkong)](../zh-HK/README.md) | [Chiński (tradycyjny, Makau)](../zh-MO/README.md) | [Chiński (tradycyjny, Tajwan)](../zh-TW/README.md) | [Chorwacki](../hr/README.md) | [Czeski](../cs/README.md) | [Duński](../da/README.md) | [Niderlandzki](../nl/README.md) | [Estoński](../et/README.md) | [Fiński](../fi/README.md) | [Francuski](../fr/README.md) | [Niemiecki](../de/README.md) | [Grecki](../el/README.md) | [Hebrajski](../he/README.md) | [Hindi](../hi/README.md) | [Węgierski](../hu/README.md) | [Indonezyjski](../id/README.md) | [Włoski](../it/README.md) | [Japoński](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreański](../ko/README.md) | [Litewski](../lt/README.md) | [Malajski](../ms/README.md) | [Malajalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Nigeryjski pidżyn](../pcm/README.md) | [Norweski](../no/README.md) | [Perski (Farsi)](../fa/README.md) | [Polski](./README.md) | [Portugalski (Brazylia)](../pt-BR/README.md) | [Portugalski (Portugalia)](../pt-PT/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Rumuński](../ro/README.md) | [Rosyjski](../ru/README.md) | [Serbski (cyrylica)](../sr/README.md) | [Słowacki](../sk/README.md) | [Słoweński](../sl/README.md) | [Hiszpański](../es/README.md) | [Suahili](../sw/README.md) | [Szwedzki](../sv/README.md) | [Tagalog (Filipiński)](../tl/README.md) | [Tamilski](../ta/README.md) | [Telugu](../te/README.md) | [Tajski](../th/README.md) | [Turecki](../tr/README.md) | [Ukraiński](../uk/README.md) | [Urdu](../ur/README.md) | [Wietnamski](../vi/README.md)

> **Wolisz sklonować lokalnie?**
>
> To repozytorium zawiera tłumaczenia na ponad 50 języków, co znacznie zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
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
> To zapewnia wszystko, czego potrzebujesz, aby ukończyć kurs, z dużo szybszym pobieraniem.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co nowego w azd dziś

> 📌 Ten kurs jest zweryfikowany dla **`azd 1.27.1`** (lipiec 2026). Uruchom `azd version`, aby sprawdzić swoją wersję, oraz `azd upgrade`, aby pobrać najnowszą.

Azure Developer CLI rozwinął się poza tradycyjne aplikacje webowe i API. Obecnie azd to jedyne narzędzie do wdrażania **dowolnej** aplikacji na Azure — w tym aplikacji opartych na AI i inteligentnych agentów.

Oto, co to oznacza dla Ciebie:

- **Agenci AI są teraz pełnoprawnymi obciążeniami azd.** Możesz inicjować, wdrażać i zarządzać projektami agentów AI używając tego samego przepływu pracy `azd init` → `azd up`, który już znasz.
- **Pełny cykl życia agenta z poziomu CLI.** Rozszerzenie `azure.ai.agents` teraz obejmuje całą podróż — `azd ai agent init` do tworzenia szkieletu, `azd ai agent invoke` do testowania (z wyjściem czasu reakcji), `azd ai agent eval generate` i `azd ai agent optimize` do pomiaru i poprawy jakości oraz `azd ai agent delete` do sprzątania.
- **Więcej bloków budulcowych AI.** Nowe rozszerzenia w wersji preview — `azure.ai.skills` i `azure.ai.connections` — pozwalają zarządzać wielokrotnego użytku umiejętnościami agentów i połączeniami Foundry bezpośrednio w azd.
- **Integracja z Microsoft Foundry** wprowadza wdrażanie modeli, hosting agentów i konfigurację usług AI bezpośrednio do ekosystemu szablonów azd.
- **Płynniejsze podstawy na co dzień.** Ostatnie wydania uczyniły `azd init` idempotentnym (bezpiecznym do ponownego uruchomienia), automatycznie oczyszczają przeterminowane tokeny w `azd auth login` oraz dodały przyjazny monit pierwszego uruchomienia w `azd tool`.
- **Podstawowy przepływ pracy nie uległ zmianie.** Niezależnie czy wdrażasz aplikację todo, mikrousługę czy wieloagentowe rozwiązanie AI, polecenia są takie same.

> **Notatka dla użytkowników Aspire:** Microsoft teraz nazywa produkt po prostu **Aspire** (dawniej „.NET Aspire”). Wsparcie azd dla Aspire nie zmieniło się — zmieniono tylko nazwę.

Jeśli korzystałeś wcześniej z azd, wsparcie AI to naturalne rozszerzenie, nie osobne narzędzie ani zaawansowany tor. Jeśli zaczynasz od zera, nauczysz się jednego przepływu pracy działającego we wszystkim.

---

## 🚀 Czym jest Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** to przyjazne dla deweloperów narzędzie wiersza poleceń, które upraszcza wdrażanie aplikacji do Azure. Zamiast ręcznie tworzyć i łączyć dziesiątki zasobów Azure, możesz wdrożyć całą aplikację jednym poleceniem.

### Magia `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**To wszystko!** Żadnego klikania w Azure Portal, bez nauki skomplikowanych szablonów ARM, bez ręcznej konfiguracji — tylko działające aplikacje na Azure.

---

## ❓ Azure Developer CLI a Azure CLI: jaka jest różnica?

To najczęściej zadawane pytanie przez początkujących. Oto prosta odpowiedź:

| Cechy | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Przeznaczenie** | Zarządzanie pojedynczymi zasobami Azure | Wdrażanie kompletnych aplikacji |
| **Podejście** | Skoncentrowane na infrastrukturze | Skoncentrowane na aplikacji |
| **Przykład** | `az webapp create --name myapp...` | `azd up` |
| **Krzywa uczenia się** | Musisz znać usługi Azure | Wystarczy znać swoją aplikację |
| **Dla kogo najlepsze** | DevOps, infrastruktura | Deweloperzy, prototypowanie |

### Prosta analogia

- **Azure CLI** jest jak posiadanie wszystkich narzędzi do budowy domu — młotki, piły, gwoździe. Możesz zbudować wszystko, ale musisz znać budownictwo.
- **Azure Developer CLI** jest jak zatrudnienie wykonawcy — opisujesz, co chcesz, a on zajmuje się budową.

### Kiedy używać którego narzędzia

| Scenariusz | Użyj tego |
|----------|----------|
| „Chcę szybko wdrożyć moją aplikację webową” | `azd up` |
| „Potrzebuję tylko utworzyć konto storage” | `az storage account create` |
| „Buduję pełną aplikację AI” | `azd init --template azure-search-openai-demo` |
| „Muszę debugować konkretny zasób Azure” | `az resource show` |
| „Chcę produkcyjne wdrożenie w kilka minut” | `azd up --environment production` |

### Działają razem!

AZD wykorzystuje Azure CLI pod spodem. Możesz korzystać z obu:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Znajdź szablony w Awesome AZD

Nie zaczynaj od zera! **Awesome AZD** to społecznościowa kolekcja gotowych do wdrożenia szablonów:

| Zasób | Opis |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Przeglądaj 200+ szablonów z wdrożeniem jednym kliknięciem |
| 🔗 [**Prześlij szablon**](https://github.com/Azure/awesome-azd/issues) | Dodaj własny szablon dla społeczności |
| 🔗 [**Repozytorium GitHub**](https://github.com/Azure/awesome-azd) | Oceniaj i eksploruj źródło |

### Popularne szablony AI z Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Zacznij w 3 krokach

Przed rozpoczęciem upewnij się, że Twój komputer jest gotowy do szablonu, który chcesz wdrożyć:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jeśli jakiś wymóg nie zostanie spełniony, napraw go najpierw, a potem kontynuuj szybki start.

### Krok 1: Instalacja AZD (2 minuty)

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

### Krok 2: Uwierzytelnienie w AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Jeśli nie jesteś pewien, którego potrzebujesz, postępuj zgodnie z pełną konfiguracją w [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Wdróż swoją pierwszą aplikację

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 To wszystko!** Twoja aplikacja jest już na żywo w Azure.

### Sprzątanie (nie zapomnij!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak korzystać z tego kursu

Kurs zaprojektowano na **nauce progresywnej** — zacznij tam, gdzie czujesz się swobodnie, i rozwijaj się dalej:

| Twoje doświadczenie | Zacznij tutaj |
|-----------------|------------|
| **Całkowicie nowy w Azure** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Znajomość Azure, nowy w AZD** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Chcesz wdrażać aplikacje AI** | [Rozdział 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcesz praktyczne ćwiczenia** | [🎓 Interaktywny warsztat](workshop/README.md) – 3-4 godzinny prowadzony lab |
| **Potrzebujesz wzorców produkcyjnych** | [Rozdział 8: Produkcja i enterprise](#-chapter-8-production--enterprise-patterns) |

### Szybka konfiguracja

1. **Sforkuj to repozytorium**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj je**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Uzyskaj pomoc**: [Społeczność Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Wolisz sklonować lokalnie?**

> To repozytorium zawiera tłumaczenia na ponad 50 języków, co znacznie zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To zapewnia wszystko, czego potrzebujesz, aby ukończyć kurs, z dużo szybszym pobieraniem.


## Przegląd kursu

Opanuj Azure Developer CLI (azd) dzięki ustrukturyzowanym rozdziałom zaprojektowanym do nauki progresywnej. **Szczególny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla nowoczesnych deweloperów

Na podstawie opinii społeczności Microsoft Foundry Discord, **45% deweloperów chce używać AZD do obciążeń AI**, ale napotyka wyzwania w:
- Złożonych wielousługowych architekturach AI
- Najlepszych praktykach produkcyjnego wdrażania AI  
- Integracji i konfiguracji usług AI w Azure
- Optymalizacji kosztów obciążeń AI
- Rozwiązywaniu problemów specyficznych dla wdrożeń AI

### Cele nauki

Po ukończeniu tego strukturalnego kursu będziesz:
- **Opanowany w podstawach AZD**: Kluczowe koncepcje, instalacja i konfiguracja
- **Wdrażać aplikacje AI**: Używać AZD z usługami Microsoft Foundry
- **Implementuj Infrastruktura jako Kod**: Zarządzaj zasobami Azure za pomocą szablonów Bicep
- **Rozwiązywanie problemów z wdrożeniami**: Rozwiązywanie typowych problemów i debugowanie
- **Optymalizacja pod produkcję**: Bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Budowa rozwiązań wieloagentowych**: Wdrażanie złożonych architektur AI

## Przed rozpoczęciem: Konta, Dostęp i Założenia

Przed rozpoczęciem Rozdziału 1 upewnij się, że masz następujące elementy. Kroki instalacji w dalszej części tego przewodnika zakładają, że te podstawy są już załatwione.

- **Subskrypcja Azure**: Możesz użyć istniejącej subskrypcji z pracy lub własnego konta albo utworzyć [bezpłatną wersję próbną](https://aka.ms/azurefreetrial), aby zacząć.
- **Uprawnienia do tworzenia zasobów Azure**: Do większości ćwiczeń powinieneś mieć co najmniej dostęp **Współtwórcy** do docelowej subskrypcji lub grupy zasobów. Niektóre rozdziały mogą też wymagać możliwości tworzenia grup zasobów, zarządzanych tożsamości i przypisań RBAC.
- [**Konto GitHub**](https://github.com): Przydatne do forku repozytorium, śledzenia własnych zmian i używania GitHub Codespaces do warsztatów.
- **Wymagania wstępne dla środowiska szablonów**: Niektóre szablony potrzebują lokalnych narzędzi, takich jak Node.js, Python, Java lub Docker. Przed rozpoczęciem uruchom weryfikator instalacji, aby wcześnie wykryć brakujące narzędzia.
- **Podstawowa znajomość terminala**: Nie musisz być ekspertem, ale powinieneś swobodnie uruchamiać polecenia takie jak `git clone`, `azd auth login` i `azd up`.

> **Pracujesz w subskrypcji korporacyjnej?**
> Jeśli twoje środowisko Azure jest zarządzane przez administratora, upewnij się wcześniej, że możesz wdrażać zasoby w subskrypcji lub grupie zasobów, której chcesz użyć. Jeśli nie, poproś o subskrypcję sandbox lub dostęp Współtwórcy przed rozpoczęciem.

> **Nowy w Azure?**
> Zacznij od własnej wersji próbnej Azure lub subskrypcji z rozliczeniem pay-as-you-go na https://aka.ms/azurefreetrial, abyś mógł wykonać ćwiczenia od początku do końca bez oczekiwania na zatwierdzenia na poziomie dzierżawy.

## 🗺️ Mapa kursu: Szybka nawigacja według rozdziałów

Każdy rozdział posiada dedykowany plik README z celami nauki, szybkimi startami i ćwiczeniami:

| Rozdział | Temat | Lekcje | Czas trwania | Złożoność |
|---------|-------|---------|----------|------------|
| **[Rozdział 1: Fundamenty](docs/chapter-01-foundation/README.md)** | Pierwsze kroki | [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacja](docs/chapter-01-foundation/installation.md) &#124; [Pierwszy projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Rozdział 2: Rozwój AI](docs/chapter-02-ai-development/README.md)** | Aplikacje AI-first | [Integracja Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenci AI](docs/chapter-02-ai-development/agents.md) &#124; [Wdrożenie modeli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsztat](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 godz. | ⭐⭐ |
| **[Rozdział 3: Konfiguracja](docs/chapter-03-configuration/README.md)** | Uwierzytelnianie i bezpieczeństwo | [Konfiguracja](docs/chapter-03-configuration/configuration.md) &#124; [Uwierzytelnianie i bezpieczeństwo](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Rozdział 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i wdrożenia | [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 godz. | ⭐⭐⭐ |
| **[Rozdział 5: Multiagentowy AI](docs/chapter-05-multi-agent/README.md)** | Rozwiązania z agentami AI | [Scenariusz detaliczny](examples/retail-scenario.md) &#124; [Wzorce koordynacji](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 godz. | ⭐⭐⭐⭐ |
| **[Rozdział 6: Przed wdrożeniem](docs/chapter-06-pre-deployment/README.md)** | Planowanie i walidacja | [Kontrole wstępne](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 godz. | ⭐⭐ |
| **[Rozdział 7: Rozwiązywanie problemów](docs/chapter-07-troubleshooting/README.md)** | Debugowanie i naprawa | [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugowanie](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemy AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 godz. | ⭐⭐ |
| **[Rozdział 8: Produkcja](docs/chapter-08-production/README.md)** | Wzorce korporacyjne | [Praktyki produkcyjne](docs/chapter-08-production/production-ai-practices.md) | 2-3 godz. | ⭐⭐⭐⭐ |
| **[🎓 Warsztaty](workshop/README.md)** | Laboratorium praktyczne | [Wprowadzenie](workshop/docs/instructions/0-Introduction.md) &#124; [Wybór](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Demontaż](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Zakończenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 godz. | ⭐⭐ |

**Łączny czas kursu:** ~10-14 godzin | **Postęp umiejętności:** Początkujący → Gotowy do produkcji

---

## 📚 Rozdziały szkoleniowe

*Wybierz ścieżkę nauki w oparciu o poziom doświadczenia i cele*

### 🚀 Rozdział 1: Fundamenty i szybki start
**Wymagania wstępne**: Subskrypcja Azure, podstawowa znajomość wiersza poleceń  
**Czas trwania**: 30-45 minut  
**Złożoność**: ⭐

#### Czego się nauczysz
- Zrozumienie podstaw Azure Developer CLI
- Instalacja AZD na twojej platformie
- Twoje pierwsze udane wdrożenie

#### Materiały szkoleniowe
- **🎯 Zacznij tutaj**: [Czym jest Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) - Kluczowe pojęcia i terminologia
- **⚙️ Instalacja**: [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md) - Przewodniki specyficzne dla platform
- **🛠️ Praktyka**: [Twój pierwszy projekt](docs/chapter-01-foundation/first-project.md) - Instrukcja krok po kroku
- **📋 Szybkie odniesienie**: [Skróty poleceń](resources/cheat-sheet.md)

#### Ćwiczenia praktyczne
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Efekt rozdziału**: Udane wdrożenie prostej aplikacji internetowej do Azure za pomocą AZD

**✅ Walidacja sukcesu:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Inwestycja czasowa:** 30-45 minut  
**📈 Poziom umiejętności po ukończeniu:** Potrafi samodzielnie wdrażać podstawowe aplikacje
**📈 Poziom umiejętności po ukończeniu:** Potrafi samodzielnie wdrażać podstawowe aplikacje

---

### 🤖 Rozdział 2: Rozwój AI-First (zalecane dla programistów AI)
**Wymagania wstępne**: Ukończony Rozdział 1  
**Czas trwania**: 1-2 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji zasilanych AI
- Zrozumienie konfiguracji usług AI

#### Materiały szkoleniowe
- **🎯 Zacznij tutaj**: [Integracja Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenci AI**: [Przewodnik po agentach AI](docs/chapter-02-ai-development/agents.md) - Wdrażanie inteligentnych agentów z AZD
- **📖 Wzorce**: [Wdrożenie modelu AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Wdrażaj i zarządzaj modelami AI
- **🛠️ Warsztaty**: [Laboratorium AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Przygotuj swoje rozwiązania AI do AZD
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) - Nauka w przeglądarce z MkDocs * Środowisko DevContainer
- **📋 Szablony**: [Szablony Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Przykłady**: [Przykłady wdrożeń AZD](examples/README.md)

#### Ćwiczenia praktyczne
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Efekt rozdziału**: Wdrożenie i konfiguracja aplikacji chat AI z możliwością RAG

**✅ Walidacja sukcesu:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Inwestycja czasowa:** 1-2 godziny  
**📈 Poziom umiejętności po ukończeniu:** Potrafi wdrażać i konfigurować aplikacje AI gotowe do produkcji  
**💰 Świadomość kosztów:** Zrozum koszty deweloperskie rzędu 80-150 USD/mies., koszty produkcyjne 300-3500 USD/mies.

#### 💰 Rozważania kosztowe dla wdrożeń AI

**Środowisko deweloperskie (szacunkowo 80-150 USD/mies.):**
- Modele Microsoft Foundry (pay-as-you-go): 0-50 USD/mies. (na podstawie zużycia tokenów)
- AI Search (Podstawowy poziom): 75 USD/mies.
- Container Apps (konsumpcja): 0-20 USD/mies.
- Storage (Standard): 1-5 USD/mies.

**Środowisko produkcyjne (szacunkowo 300-3500+ USD/mies.):**
- Modele Microsoft Foundry (PTU dla spójnej wydajności): 3000+ USD/mies. LUB pay-as-you-go przy dużym wolumenie
- AI Search (Poziom standardowy): 250 USD/mies.
- Container Apps (dedykowane): 50-100 USD/mies.
- Application Insights: 5-50 USD/mies.
- Storage (Premium): 10-50 USD/mies.

**💡 Wskazówki optymalizacji kosztów:**
- Używaj **Darmowej warstwy** modeli Microsoft Foundry do nauki (Azure OpenAI zawiera 50,000 tokenów/mies.)
- Uruchom `azd down`, aby zwolnić zasoby, gdy nie prowadzisz aktywnie rozwoju
- Zacznij od rozliczenia opartego na konsumpcji, przejdź na PTU tylko dla produkcji
- Użyj `azd provision --preview` do oszacowania kosztów przed wdrożeniem
- Włącz autoskalowanie: płać tylko za faktyczne użycie

**Monitorowanie kosztów:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie
**Wymagania wstępne**: Ukończony Rozdział 1  
**Czas trwania**: 45-60 minut  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskiem
- Najlepsze praktyki uwierzytelniania i bezpieczeństwa
- Nazewnictwo i organizacja zasobów

#### Materiały szkoleniowe
- **📖 Konfiguracja**: [Przewodnik konfiguracji](docs/chapter-03-configuration/configuration.md) - Konfiguracja środowiska
- **🔐 Bezpieczeństwo**: [Wzorce uwierzytelniania i zarządzane tożsamości](docs/chapter-03-configuration/authsecurity.md) - Wzorce uwierzytelniania
- **📝 Przykłady**: [Przykład aplikacji bazodanowej](examples/database-app/README.md) - Przykłady baz danych dla AZD

#### Ćwiczenia praktyczne
- Konfiguracja wielu środowisk (dev, staging, prod)
- Ustawienie uwierzytelniania zarządzanej tożsamości
- Implementacja konfiguracji specyficznych dla środowiska

**💡 Efekt rozdziału**: Zarządzaj wieloma środowiskami z odpowiednim uwierzytelnianiem i bezpieczeństwem

---

### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenia
**Wymagania wstępne**: Ukończone rozdziały 1-3  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeń
- Infrastruktura jako kod z użyciem Bicep
- Strategie provisioningu zasobów

#### Materiały szkoleniowe
- **📖 Wdrożenie**: [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) - Kompleksowe workflowy
- **🏗️ Provisioning**: [Zarządzanie zasobami](docs/chapter-04-infrastructure/provisioning.md) - Zarządzanie zasobami Azure
- **📝 Przykłady**: [Przykład aplikacji kontenerowej](../../examples/container-app) - Wdrożenia kontenerowe

#### Ćwiczenia praktyczne
- Tworzenie własnych szablonów Bicep
- Wdrażanie aplikacji wielousługowych
- Implementacja strategii blue-green deployment

**💡 Efekt rozdziału**: Wdrażanie złożonych aplikacji wielousługowych przy użyciu własnych szablonów infrastruktury

---

### 🎯 Rozdział 5: Rozwiązania multi-agentowe AI (zaawansowane)
**Wymagania wstępne**: Ukończone rozdziały 1-2  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury multi-agentowej
- Orkiestracja i koordynacja agentów
- Produkcyjne wdrożenia AI

#### Materiały szkoleniowe
- **🤖 Projekt wyróżniony**: [Multi-agentowe rozwiązanie detaliczne](examples/retail-scenario.md) - Kompleksowa implementacja
- **🛠️ Szablony ARM**: [Pakiet szablonów ARM](../../examples/retail-multiagent-arm-template) - Wdrożenie jednym kliknięciem
- **📖 Architektura**: [Wzorce koordynacji multi-agentowej](docs/chapter-06-pre-deployment/coordination-patterns.md) - Wzorce

#### Ćwiczenia praktyczne
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Efekt rozdziału**: Wdrażanie i zarządzanie produkcyjnym rozwiązaniem multi-agent AI z agentami obsługi klienta i inwentaryzacji

---

### 🔍 Rozdział 6: Walidacja i planowanie przed wdrożeniem
**Wymagania wstępne**: Ukończony rozdział 4  
**Czas trwania**: 1 godzina  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Planowanie pojemności i walidacja zasobów
- Strategie wyboru SKU
- Kontrole pre-flight i automatyzacja

#### Materiały szkoleniowe
- **📊 Planowanie**: [Planowanie przepustowości](docs/chapter-06-pre-deployment/capacity-planning.md) - Walidacja zasobów
- **💰 Wybór**: [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Kosztowo efektywne decyzje
- **✅ Walidacja**: [Kontrole przed wdrożeniem](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatyczne skrypty

#### Ćwiczenia praktyczne
- Uruchom skrypty walidujące przepustowość
- Optymalizuj wybory SKU pod kątem kosztów
- Wdróż automatyczne kontrole przed wdrożeniem

**💡 Efekt rozdziału**: Zweryfikuj i zoptymalizuj wdrożenia przed wykonaniem

---

### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie
**Wymagania wstępne**: Ukończony dowolny rozdział dotyczący wdrożeń  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Systematyczne podejścia do debugowania
- Typowe problemy i rozwiązania
- Specyficzne rozwiązywanie problemów AI

#### Materiały do nauki
- **🔧 Typowe problemy**: [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rozwiązania
- **🕵️ Debugowanie**: [Przewodnik debugowania](docs/chapter-07-troubleshooting/debugging.md) - Strategie krok po kroku
- **🤖 Problemy AI**: [Specyficzne rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemy z usługami AI

#### Ćwiczenia praktyczne
- Diagnozuj awarie wdrożeń
- Rozwiązuj problemy z uwierzytelnianiem
- Debuguj łączność z usługami AI

**💡 Efekt rozdziału**: Samodzielnie diagnozuj i rozwiązuj typowe problemy wdrożeń

---

### 🏢 Rozdział 8: Wzorce produkcyjne i korporacyjne
**Wymagania wstępne**: Ukończone rozdziały 1-4  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Korporacyjne wzorce bezpieczeństwa
- Monitorowanie i optymalizacja kosztów

#### Materiały do nauki
- **🏭 Produkcja**: [Najlepsze praktyki AI produkcji](docs/chapter-08-production/production-ai-practices.md) - Wzorce korporacyjne
- **📝 Przykłady**: [Przykład mikroserwisów](../../examples/microservices) - Złożone architektury
- **📊 Monitorowanie**: [Integracja z Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorowanie

#### Ćwiczenia praktyczne
- Wdrażaj korporacyjne wzorce bezpieczeństwa
- Konfiguruj kompleksowe monitorowanie
- Wdrażaj do produkcji z odpowiednim zarządzaniem

**💡 Efekt rozdziału**: Wdrażaj aplikacje gotowe do produkcji z pełną funkcjonalnością produkcyjną

---

## 🎓 Przegląd warsztatów: Praktyczne doświadczenie w nauce

> **⚠️ STATUS WARSZTATU: Aktywny rozwój**  
> Materiały warsztatowe są obecnie opracowywane i ulepszane. Główne moduły działają, ale niektóre sekcje zaawansowane są nieukończone. Aktywnie pracujemy nad ukończeniem całej zawartości. [Śledź postępy →](workshop/README.md)

### Interaktywne materiały warsztatowe
**Kompleksowa praktyczna nauka z użyciem narzędzi przeglądarkowych i ćwiczeń prowadzonych**

Nasze materiały warsztatowe oferują ustrukturyzowane, interaktywne doświadczenie edukacyjne uzupełniające powyższy program rozdziałów. Warsztat jest zaprojektowany zarówno do nauki we własnym tempie, jak i sesji prowadzonych przez instruktora.

#### 🛠️ Cechy warsztatu
- **Interfejs przeglądarkowy**: Kompletny warsztat oparty na MkDocs z funkcjami wyszukiwania, kopiowania i motywu
- **Integracja z GitHub Codespaces**: Jednokliknowa konfiguracja środowiska deweloperskiego
- **Ustrukturyzowana ścieżka nauki**: 8-modułowe ćwiczenia przewodnikowe (łącznie 3-4 godziny)
- **Metodologia progresywna**: Wprowadzenie → Wybór → Walidacja → Demontaż → Konfiguracja → Dostosowanie → Usuwanie → Podsumowanie
- **Interaktywne środowisko DevContainer**: Wstępnie skonfigurowane narzędzia i zależności

#### 📚 Struktura modułów warsztatu
Warsztat opiera się na **8-modułowej progresywnej metodologii**, która prowadzi od odkrywania do mistrzostwa wdrożeń:

| Moduł | Temat | Co zrobisz | Czas trwania |
|--------|-------|----------------|----------|
| **0. Wprowadzenie** | Przegląd warsztatu | Zrozum cele nauki, wymagania wstępne i strukturę warsztatu | 15 min |
| **1. Wybór** | Odkrywanie szablonów | Poznaj szablony AZD i wybierz odpowiedni szablon AI dla swojego scenariusza | 20 min |
| **2. Walidacja** | Wdrażanie i weryfikacja | Wdróż szablon za pomocą `azd up` i zweryfikuj działanie infrastruktury | 30 min |
| **3. Demontaż** | Zrozumienie struktury | Użyj GitHub Copilot do eksploracji architektury szablonu, plików Bicep i organizacji kodu | 30 min |
| **4. Konfiguracja** | Głębokie zanurzenie w azure.yaml | Opanuj konfigurację `azure.yaml`, haki cyklu życia i zmienne środowiskowe | 30 min |
| **5. Dostosowanie** | Spersonalizuj | Włącz AI Search, śledzenie, ewaluację i dostosuj do swojego scenariusza | 45 min |
| **6. Usuwanie** | Sprzątanie | Bezpieczne usuwanie zasobów za pomocą `azd down --purge` | 15 min |
| **7. Podsumowanie** | Kolejne kroki | Przejrzyj osiągnięcia, kluczowe koncepcje i kontynuuj naukę | 15 min |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Rezultaty nauki w warsztacie
Po ukończeniu warsztatu uczestnicy:
- **Wdrożą produkcyjne aplikacje AI**: Użyją AZD z usługami Microsoft Foundry
- **Opanują architektury wielu agentów**: Wdrożą skoordynowane rozwiązania z AI agentami
- **Wdrożą najlepsze praktyki bezpieczeństwa**: Skonfigurują uwierzytelnianie i kontrolę dostępu
- **Zoptymalizują pod kątem skali**: Zaprojektują kosztowo efektywne, wydajne wdrożenia
- **Rozwiążą problemy wdrożeń**: Samodzielnie usuną typowe problemy

#### 📖 Materiały warsztatowe
- **🎥 Przewodnik interaktywny**: [Materiały warsztatowe](workshop/README.md) - Środowisko nauki w przeglądarce
- **📋 Instrukcje moduł po module**:
  - [0. Wprowadzenie](workshop/docs/instructions/0-Introduction.md) - Przegląd i cele warsztatu
  - [1. Wybór](workshop/docs/instructions/1-Select-AI-Template.md) - Znajdź i wybierz szablony AI
  - [2. Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) - Wdróż i zweryfikuj szablony
  - [3. Demontaż](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Eksploracja architektury szablonów
  - [4. Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) - Opanuj azure.yaml
  - [5. Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) - Dostosuj do swojego scenariusza
  - [6. Usuwanie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Sprzątanie zasobów
  - [7. Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) - Przegląd i kolejne kroki
- **🛠️ Laboratorium AI w ramach warsztatów**: [Laboratorium AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ćwiczenia skupione na AI
- **💡 Szybki start**: [Przewodnik konfiguracji warsztatu](workshop/README.md#quick-start) - Konfiguracja środowiska

**Idealne dla**: szkoleń korporacyjnych, kursów uniwersyteckich, nauki indywidualnej i obozów programistycznych.

---

## 📖 Głębokie zanurzenie: możliwości AZD

Poza podstawami, AZD oferuje potężne funkcje dla wdrożeń produkcyjnych:

- **Wdrożenia oparte na szablonach** - Używaj gotowych szablonów dla powszechnych wzorców aplikacji
- **Infrastruktura jako kod** - Zarządzaj zasobami Azure za pomocą Bicep lub Terraform  
- **Zintegrowane przepływy pracy** - Bezproblemowe provisionowanie, wdrażanie i monitorowanie aplikacji
- **Przyjazny dla deweloperów** - Optymalizacja pod wydajność pracy i doświadczenia programisty

### **AZD + Microsoft Foundry: Idealne do wdrożeń AI**

**Dlaczego AZD dla rozwiązań AI?** AZD rozwiązuje najważniejsze wyzwania programistów AI:

- **Szablony gotowe na AI** - Wstępnie skonfigurowane szablony dla modeli Microsoft Foundry, usług AI Azure i obciążeń ML
- **Bezpieczne wdrożenia AI** - Wbudowane wzorce bezpieczeństwa dla usług AI, kluczy API i punktów końcowych modeli  
- **Produkcjne wzorce AI** - Najlepsze praktyki dla skalowalnych i kosztowo efektywnych wdrożeń aplikacji AI
- **Pełny przepływ pracy AI** - Od rozwoju modelu do wdrożenia produkcyjnego z właściwym monitorowaniem
- **Optymalizacja kosztów** - Inteligentne alokacje zasobów i skalowanie dla obciążeń AI
- **Integracja Microsoft Foundry** - Bezproblemowe powiązanie z katalogiem modeli i punktami końcowymi Microsoft Foundry

---

## 🎯 Biblioteka szablonów i przykładów

### Polecane: Szablony Microsoft Foundry
**Zacznij tutaj, jeśli wdrażasz aplikacje AI!**

> **Uwaga:** Te szablony demonstrują różne wzorce AI. Niektóre to zewnętrzne próbki Azure, inne lokalne implementacje.

| Szablon | Rozdział | Złożoność | Usługi | Typ |
|----------|---------|------------|----------|------|
| [**Rozpocznij z czatem AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |
| [**Rozpocznij z agentami AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Rozdział 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Zewnętrzny |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zewnętrzny |
| [**Szybki start aplikacji chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zewnętrzny |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zewnętrzny |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zewnętrzny |
| [**Rozwiązanie detaliczne Multi-Agent**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalny** |

### Polecane: Kompleksowe scenariusze nauki
**Szablony aplikacji gotowych do produkcji powiązane z rozdziałami nauki**

| Szablon | Rozdział nauki | Złożoność | Kluczowa nauka |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | Podstawowe wzorce wdrożeń AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | Implementacja RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Rozdział 4 | ⭐⭐ | Integracja inteligencji dokumentów |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | Framework agentów i wywołania funkcji |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐ | Orkiestracja AI korporacyjna |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | Architektura wieloagentowa z agentami Klienta i Magazynu |

### Nauka przez typ przykładu

> **📌 Przykłady lokalne vs zewnętrzne:**  
> **Przykłady lokalne** (w tym repozytorium) = Gotowe do natychmiastowego użycia  
> **Przykłady zewnętrzne** (Próbki Azure) = Klonowanie z powiązanych repozytoriów

#### Przykłady lokalne (gotowe do użycia)
- [**Rozwiązanie detaliczne Multi-Agent**](examples/retail-scenario.md) - Kompletny, gotowy do produkcji implementacja z szablonami ARM
  - Architektura wieloagentowa (agenci Klienta + Magazynu)
  - Kompleksowe monitorowanie i ewaluacja
  - Jednoklikowe wdrożenie poprzez szablon ARM

#### Przykłady lokalne - aplikacje kontenerowe (rozdziały 2-5)
**Kompleksowe przykłady wdrożeń kontenerowych w tym repozytorium:**
- [**Przykłady aplikacji kontenerowych**](examples/container-app/README.md) - Kompletny przewodnik wdrożeń kontenerowych
  - [Proste API Flask](../../examples/container-app/simple-flask-api) - Podstawowe REST API ze skalowaniem do zera
  - [Architektura mikroserwisów](../../examples/container-app/microservices) - Produkcyjne wdrożenie wieloserwisowe
  - Wzorce szybkiego startu, produkcji i zaawansowane
  - Wskazówki dotyczące monitorowania, bezpieczeństwa i optymalizacji kosztów

#### Przykłady zewnętrzne - proste aplikacje (rozdziały 1-2)
**Sklonuj te repozytoria prób Azure, aby zacząć:**
- [Prosta aplikacja webowa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Podstawowe wzorce wdrożeń
- [Strona statyczna - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Wdrożenie statycznej zawartości
- [Aplikacja kontenerowa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Wdrożenie REST API

#### Przykłady zewnętrzne - integracja bazy danych (rozdziały 3-4)  
- [Aplikacja bazodanowa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Wzorce łączności z bazą danych
- [Funkcje + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Bezserwerowe przepływy danych

#### Przykłady zewnętrzne - zaawansowane wzorce (rozdziały 4-8)
- [Mikroserwisy Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury wieloserwisowe
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Przetwarzanie w tle  
- [Korporacyjny pipeline ML](https://github.com/Azure-Samples/mlops-v2) - Produkcyjne wzorce ML

### Kolekcje szablonów zewnętrznych
- [**Oficjalna galeria szablonów AZD**](https://azure.github.io/awesome-azd/) - Wyselekcjonowana kolekcja oficjalnych i społecznościowych szablonów
- [**Szablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacja szablonów Microsoft Learn
- [**Katalog przykładów**](examples/README.md) - Lokalny zbiór przykładów do nauki z objaśnieniami

---

## 📚 Materiały do nauki i odniesienia

### Szybkie odnośniki
- [**Skrócony przewodnik po poleceniach**](resources/cheat-sheet.md) - Podstawowe polecenia azd uporządkowane wg rozdziałów
- [**Glosariusz**](resources/glossary.md) - Terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - Najczęściej zadawane pytania uporządkowane wg rozdziałów nauki
- [**Przewodnik do nauki**](resources/study-guide.md) - Kompleksowe ćwiczenia praktyczne

### Warsztaty praktyczne
- [**Laboratorium warsztatów AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Twórz swoje rozwiązania AI gotowe do wdrożenia w AZD (2-3 godziny)
- [**Interaktywny warsztat**](workshop/README.md) - 8-modułowe ćwiczenia prowadzone z MkDocs i GitHub Codespaces
  - Kolejność: Wprowadzenie → Wybór → Walidacja → Dekonstrukcja → Konfiguracja → Personalizacja → Demontaż → Podsumowanie

### Zewnętrzne zasoby do nauki
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Umiejętności agenta AI dla Twojego edytora
- [**Microsoft Azure Skills na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otwartych umiejętności agenta dla Azure AI, Foundry, wdrożeń, diagnostyki, optymalizacji kosztów i więcej. Zainstaluj je w GitHub Copilot, Cursor, Claude Code lub dowolnym wspieranym agencie:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Szybki przewodnik rozwiązywania problemów

**Typowe problemy początkujących i natychmiastowe rozwiązania:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Nie znaleziono subskrypcji" lub "Subskrypcja nie ustawiona"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" lub "Przekroczono limit"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" nie powiodło się w połowie procesu</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Błąd uwierzytelniania" lub "Token wygasł"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Zasób już istnieje" lub konflikty nazw</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Wdrażanie szablonu trwa zbyt długo</strong></summary>

**Normalne czasy oczekiwania:**
- Prosta aplikacja webowa: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (prowizjonowanie OpenAI jest wolne)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Odmowa dostępu" lub "Zabronione"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Nie można znaleźć URL wdrożonej aplikacji</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Pełne materiały do rozwiązywania problemów

- **Przewodnik po częstych problemach:** [Szczegółowe rozwiązania](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemy specyficzne dla AI:** [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Przewodnik debugowania:** [Debugowanie krok po kroku](docs/chapter-07-troubleshooting/debugging.md)
- **Uzyskaj pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukończenie kursu i certyfikacja

### Śledzenie postępów
Śledź swoje postępy w nauce przez każdy rozdział:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój AI-przede wszystkim ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Wieloagentowe rozwiązania AI ✅
- [ ] **Rozdział 6**: Walidacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Wzorce produkcyjne i korporacyjne ✅

### Weryfikacja nauki
Po ukończeniu każdego rozdziału zweryfikuj swoją wiedzę poprzez:
1. **Ćwiczenie praktyczne**: Ukończenie praktycznego wdrożenia rozdziału
2. **Sprawdzenie wiedzy**: Przejrzenie sekcji FAQ dla danego rozdziału
3. **Dyskusja w społeczności**: Podzielenie się doświadczeniem na Azure Discord
4. **Następny rozdział**: Przejście do kolejnego poziomu złożoności

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów zdobędziesz:
- **Doświadczenie produkcyjne**: Wdrożone prawdziwe aplikacje AI na Azure
- **Umiejętności zawodowe**: Możliwość wdrożeń gotowych do przedsiębiorstw  
- **Uznanie w społeczności**: Aktywny członek społeczności programistów Azure
- **Rozwój kariery**: Poszukiwane kompetencje w zakresie AZD i wdrażania AI

---

## 🤝 Społeczność i wsparcie

### Uzyskaj pomoc i wsparcie
- **Problemy techniczne**: [Zgłaszaj błędy i sugestie](https://github.com/microsoft/azd-for-beginners/issues)
- **Pytania dotyczące nauki**: [Społeczność Microsoft Azure Discord](https://discord.gg/microsoft-azure) oraz [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specyficzna dla AI**: Dołącz do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacja**: [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wgląd społeczności z Microsoft Foundry Discord

**Najnowsze wyniki ankiety z kanału #Azure:**
- **45%** deweloperów chce używać AZD do obciążeń AI
- **Główne wyzwania**: wdrożenia wieloservicesowe, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najczęściej proszone o**: szablony specyficzne dla AI, przewodniki rozwiązywania problemów, najlepsze praktyki

**Dołącz do naszej społeczności, aby:**
- Dzielenie się doświadczeniami z AZD + AI i uzyskać pomoc
- Uzyskać dostęp do wczesnych wersji nowych szablonów AI
- Współtworzyć najlepsze praktyki wdrożeń AI
- Wpływać na przyszły rozwój funkcji AI + AZD

### Współtworzenie kursu
Zachęcamy do współpracy! Prosimy przeczytać nasz [Przewodnik współpracy](CONTRIBUTING.md) po szczegóły dotyczące:
- **Ulepszenia treści**: Rozwijanie istniejących rozdziałów i przykładów
- **Nowe przykłady**: Dodawanie realnych scenariuszy i szablonów  
- **Tłumaczenia**: Pomoc w utrzymaniu wsparcia wielojęzycznego
- **Zgłaszanie błędów**: Poprawa dokładności i czytelności
- **Standardy społeczności**: Przestrzeganie naszych włączających zasad społeczności

---

## 📄 Informacje o kursie

### Licencja
Ten projekt jest licencjonowany na licencji MIT - zobacz plik [LICENSE](../../LICENSE) po szczegóły.

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
[![Agenci AI dla początkujących](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria generatywnej AI
[![Generatywna AI dla początkujących](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Podstawowa nauka
[![ML dla początkujących](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science dla początkujących](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI dla początkujących](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cyberbezpieczeństwo dla początkujących](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev dla początkujących](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT dla początkujących](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development dla początkujących](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot dla programowania w parach AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot dla C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Przygoda z Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Nawigacja kursu

**🚀 Gotowy, by zacząć naukę?**

**Początkujący**: Zacznij od [Rozdział 1: Podstawy i szybki start](#-chapter-1-foundation--quick-start)  
**Programiści AI**: Przejdź do [Rozdział 2: Rozwój AI-przede wszystkim](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Doświadczeni programiści**: Zacznij od [Rozdział 3: Konfiguracja i uwierzytelnianie](#️-chapter-3-configuration--authentication)

**Następne kroki**: [Rozpocznij Rozdział 1 - Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->