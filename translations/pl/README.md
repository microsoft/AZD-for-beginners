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
[Arabski](../ar/README.md) | [Bengalski](../bn/README.md) | [Bułgarski](../bg/README.md) | [Birmański (Myanmar)](../my/README.md) | [Chiński (uproszczony)](../zh-CN/README.md) | [Chiński (tradycyjny, Hong Kong)](../zh-HK/README.md) | [Chiński (tradycyjny, Makau)](../zh-MO/README.md) | [Chiński (tradycyjny, Tajwan)](../zh-TW/README.md) | [Chorwacki](../hr/README.md) | [Czeski](../cs/README.md) | [Duński](../da/README.md) | [Holenderski](../nl/README.md) | [Estoński](../et/README.md) | [Fiński](../fi/README.md) | [Francuski](../fr/README.md) | [Niemiecki](../de/README.md) | [Grecki](../el/README.md) | [Hebrajski](../he/README.md) | [Hindi](../hi/README.md) | [Węgierski](../hu/README.md) | [Indonezyjski](../id/README.md) | [Włoski](../it/README.md) | [Japoński](../ja/README.md) | [Kannada](../kn/README.md) | [Koreański](../ko/README.md) | [Litewski](../lt/README.md) | [Malajski](../ms/README.md) | [Malajalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Nigeryjski Pidgin](../pcm/README.md) | [Norweski](../no/README.md) | [Perski (Farsi)](../fa/README.md) | [Polski](./README.md) | [Portugalski (Brazylia)](../pt-BR/README.md) | [Portugalski (Portugalia)](../pt-PT/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Rumuński](../ro/README.md) | [Rosyjski](../ru/README.md) | [Serbski (cyrylica)](../sr/README.md) | [Słowacki](../sk/README.md) | [Słoweński](../sl/README.md) | [Hiszpański](../es/README.md) | [Suahili](../sw/README.md) | [Szwedzki](../sv/README.md) | [Tagalog (Filipiński)](../tl/README.md) | [Tamilski](../ta/README.md) | [Telugu](../te/README.md) | [Tajski](../th/README.md) | [Turecki](../tr/README.md) | [Ukraiński](../uk/README.md) | [Urdu](../ur/README.md) | [Wietnamski](../vi/README.md)

> **Wolisz klonować lokalnie?**
>
> To repozytorium zawiera ponad 50 tłumaczeń językowych, co znacznie zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
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
> To zapewnia wszystko, czego potrzebujesz, aby ukończyć kurs, umożliwiając znacznie szybsze pobieranie.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co nowego w azd dziś

Azure Developer CLI rozwinął się poza tradycyjne aplikacje webowe i API. Dziś azd to jedyne narzędzie do wdrażania **dowolnej** aplikacji do Azure — w tym aplikacji opartych na AI i inteligentnych agentów.

Oto, co to oznacza dla Ciebie:

- **Agenci AI są teraz pełnoprawnymi obciążeniami azd.** Możesz inicjować, wdrażać i zarządzać projektami agentów AI używając tego samego przepływu `azd init` → `azd up`, który już znasz.
- **Integracja Microsoft Foundry** wprowadza wdrożenie modeli, hosting agentów oraz konfigurację usług AI bezpośrednio do ekosystemu szablonów azd.
- **Podstawowy przepływ pracy się nie zmienił.** Niezależnie od tego, czy wdrażasz aplikację todo, mikroserwis, czy wieloagentowe rozwiązanie AI, polecenia pozostają takie same.

Jeśli korzystałeś wcześniej z azd, wsparcie AI to naturalne rozszerzenie — nie osobne narzędzie ani zaawansowany tryb. Jeśli zaczynasz od zera, nauczysz się jednego przepływu działającego dla wszystkiego.

---

## 🚀 Czym jest Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** to przyjazne dla programisty narzędzie wiersza poleceń, które ułatwia wdrażanie aplikacji do Azure. Zamiast ręcznie tworzyć i łączyć dziesiątki zasobów Azure, możesz wdrożyć całą aplikację za pomocą jednego polecenia.

### Magia `azd up`

```bash
# To pojedyncze polecenie robi wszystko:
# ✅ Tworzy wszystkie zasoby Azure
# ✅ Konfiguruje sieć i zabezpieczenia
# ✅ Buduje kod Twojej aplikacji
# ✅ Wdraża do Azure
# ✅ Zapewnia działający adres URL
azd up
```

**To wszystko!** Bez klikania w Azure Portal, bez skomplikowanych szablonów ARM do nauki, bez ręcznej konfiguracji — po prostu działające aplikacje na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Jaka jest różnica?

To najczęściej zadawane pytanie przez początkujących. Oto prosta odpowiedź:

| Cechy | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cel** | Zarządzanie pojedynczymi zasobami Azure | Wdrażanie kompletnej aplikacji |
| **Mentalność** | Skupienie na infrastrukturze | Skupienie na aplikacji |
| **Przykład** | `az webapp create --name myapp...` | `azd up` |
| **Krzywa uczenia** | Trzeba znać usługi Azure | Wystarczy znać swoją aplikację |
| **Najlepsze dla** | DevOps, infrastruktura | Programiści, prototypowanie |

### Prosta analogia

- **Azure CLI** to jak posiadanie wszystkich narzędzi do budowy domu - młotki, piły, gwoździe. Możesz zbudować wszystko, ale musisz znać budownictwo.
- **Azure Developer CLI** to jak zatrudnienie wykonawcy - opisujesz, czego chcesz, a oni wykonują budowę.

### Kiedy używać którego

| Sytuacja | Użyj tego |
|----------|----------|
| "Chcę szybko wdrożyć swoją aplikację webową" | `azd up` |
| "Potrzebuję tylko utworzyć konto magazynu" | `az storage account create` |
| "Buduję pełną aplikację AI" | `azd init --template azure-search-openai-demo` |
| "Muszę debugować konkretny zasób Azure" | `az resource show` |
| "Chcę wdrożenie produkcyjne w kilka minut" | `azd up --environment production` |

### Działają razem!

AZD używa Azure CLI pod spodem. Możesz korzystać z obu:
```bash
# Wdróż swoją aplikację za pomocą AZD
azd up

# Następnie dopracuj konkretne zasoby za pomocą Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Znajdź szablony w Awesome AZD

Nie zaczynaj od zera! **Awesome AZD** to społecznościowa kolekcja gotowych szablonów do wdrożenia:

| Zasób | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Przeglądaj ponad 200 szablonów z możliwością natychmiastowego wdrożenia |
| 🔗 [**Dodaj szablon**](https://github.com/Azure/awesome-azd/issues) | Dodaj swój własny szablon do społeczności |
| 🔗 [**Repozytorium GitHub**](https://github.com/Azure/awesome-azd) | Oceniaj i przeglądaj kod źródłowy |

### Popularne szablony AI z Awesome AZD

```bash
# Czat RAG z modelami Microsoft Foundry i wyszukiwaniem AI
azd init --template azure-search-openai-demo

# Szybka aplikacja czatu AI
azd init --template openai-chat-app-quickstart

# Agenci AI z agentami Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Rozpocznij w 3 krokach

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

### Krok 2: Zaloguj się do Azure

```bash
azd auth login
```

### Krok 3: Wdróż swoją pierwszą aplikację

```bash
# Zainicjuj z szablonu
azd init --template todo-nodejs-mongo

# Wdróż do Azure (tworzy wszystko!)
azd up
```

**🎉 To wszystko!** Twoja aplikacja jest już dostępna na Azure.

### Sprzątanie (Nie zapomnij!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak korzystać z tego kursu

Ten kurs jest zaprojektowany dla **stopniowej nauki** — zacznij tam, gdzie czujesz się komfortowo i stopniowo poszerzaj wiedzę:

| Twoje doświadczenie | Zacznij tutaj |
|---------------------|---------------|
| **Nowy w Azure** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Znający Azure, nowy w AZD** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Chcę wdrażać aplikacje AI** | [Rozdział 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcę praktykę praktyczną** | [🎓 Warsztat interaktywny](workshop/README.md) - 3-4 godziny prowadzonych ćwiczeń |
| **Potrzebuję wzorców produkcyjnych** | [Rozdział 8: Produkcja i przedsiębiorstwo](#-chapter-8-production--enterprise-patterns) |

### Szybka konfiguracja

1. **Rozgałęź to repozytorium**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj je**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Uzyskaj pomoc**: [Społeczność Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Wolisz klonować lokalnie?**

> To repozytorium zawiera ponad 50 tłumaczeń językowych, co znacznie zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To zapewnia wszystko, czego potrzebujesz, aby ukończyć kurs, umożliwiając znacznie szybsze pobieranie.


## Przegląd kursu

Opanuj Azure Developer CLI (azd) poprzez ustrukturyzowane rozdziały zaprojektowane dla stopniowej nauki. **Specjalny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla nowoczesnych programistów

Na podstawie opinii społeczności Microsoft Foundry Discord, **45% programistów chce używać AZD do obciążeń AI**, ale napotyka wyzwania z:
- Złożonymi architekturami AI z wieloma usługami
- Najlepszymi praktykami wdrażania AI w produkcji  
- Integracją i konfiguracją usług AI w Azure
- Optymalizacją kosztów obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

### Cele nauki

Po ukończeniu tego ustrukturyzowanego kursu będziesz potrafił:
- **Opanować podstawy AZD**: podstawowe koncepcje, instalacja i konfiguracja
- **Wdrażać aplikacje AI**: używać AZD z usługami Microsoft Foundry
- **Stosować infrastruktury jako kod**: zarządzać zasobami Azure za pomocą szablonów Bicep
- **Rozwiązywać problemy z wdrożeniami**: naprawiać typowe błędy i debugować problemy
- **Optymalizować pod kątem produkcji**: bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Budować rozwiązania wieloagentowe**: wdrażać złożone architektury AI

## 🗺️ Mapa kursu: Szybka nawigacja według rozdziału

Każdy rozdział posiada dedykowany README z celami nauki, szybkimi startami i ćwiczeniami:

| Rozdział | Temat | Lekcje | Czas trwania | Złożoność |
|---------|-------|---------|----------|------------|
| **[Rozdział 1: Podstawy](docs/chapter-01-foundation/README.md)** | Rozpoczęcie | [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacja](docs/chapter-01-foundation/installation.md) &#124; [Pierwszy projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Rozdział 2: Rozwój AI](docs/chapter-02-ai-development/README.md)** | Aplikacje AI-First | [Integracja Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenci AI](docs/chapter-02-ai-development/agents.md) &#124; [Wdrożenie Modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsztat](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 godziny | ⭐⭐ |
| **[Rozdział 3: Konfiguracja](docs/chapter-03-configuration/README.md)** | Uwierzytelnianie i Bezpieczeństwo | [Konfiguracja](docs/chapter-03-configuration/configuration.md) &#124; [Uwierzytelnianie i Bezpieczeństwo](docs/chapter-03-configuration/authsecurity.md) | 45-60 minut | ⭐⭐ |
| **[Rozdział 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i Wdrożenie | [Przewodnik po wdrożeniu](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 godziny | ⭐⭐⭐ |
| **[Rozdział 5: Wieloagentowe](docs/chapter-05-multi-agent/README.md)** | Rozwiązania AI Agentów | [Scenariusz Retail](examples/retail-scenario.md) &#124; [Wzorce Koordynacji](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 godziny | ⭐⭐⭐⭐ |
| **[Rozdział 6: Przed-wdrożeniem](docs/chapter-06-pre-deployment/README.md)** | Planowanie i Walidacja | [Kontrole przed startem](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 godzina | ⭐⭐ |
| **[Rozdział 7: Rozwiązywanie problemów](docs/chapter-07-troubleshooting/README.md)** | Debugowanie i Naprawa | [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugowanie](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemy AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 godziny | ⭐⭐ |
| **[Rozdział 8: Produkcja](docs/chapter-08-production/README.md)** | Wzorce przedsiębiorcze | [Praktyki produkcyjne](docs/chapter-08-production/production-ai-practices.md) | 2-3 godziny | ⭐⭐⭐⭐ |
| **[🎓 Warsztat](workshop/README.md)** | Laboratorium praktyczne | [Wprowadzenie](workshop/docs/instructions/0-Introduction.md) &#124; [Wybór](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Rozbiórka](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizacja](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaż](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 godziny | ⭐⭐ |

**Całkowity czas kursu:** ~10-14 godzin | **Postęp umiejętności:** Początkujący → Gotowy do produkcji

---

## 📚 Rozdziały do nauki

*Wybierz swoją ścieżkę nauki w oparciu o poziom doświadczenia i cele*

### 🚀 Rozdział 1: Podstawy i szybki start
**Wymagania wstępne**: subskrypcja Azure, podstawowa znajomość linii poleceń  
**Czas trwania**: 30-45 minut  
**Złożoność**: ⭐

#### Czego się nauczysz
- Podstawy Azure Developer CLI
- Instalacja AZD na Twojej platformie
- Pierwsze udane wdrożenie

#### Materiały dydaktyczne
- **🎯 Zacznij tutaj**: [Czym jest Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) - Podstawowe pojęcia i terminologia
- **⚙️ Konfiguracja**: [Instalacja i ustawienia](docs/chapter-01-foundation/installation.md) - Przewodniki specyficzne dla platformy
- **🛠️ Praktyka**: [Twój pierwszy projekt](docs/chapter-01-foundation/first-project.md) - Samouczek krok po kroku
- **📋 Szybka ściąga**: [Cheat Sheet poleceń](resources/cheat-sheet.md)

#### Ćwiczenia praktyczne
```bash
# Szybkie sprawdzenie instalacji
azd version

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up
```

**💡 Efekt rozdziału**: Pomyslnie wdrożona prosta aplikacja webowa do Azure przy użyciu AZD

**✅ Walidacja sukcesu:**
```bash
# Po ukończeniu Rozdziału 1 powinieneś być w stanie:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża do Azure
azd show                # Wyświetla adres URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Sprząta zasoby
```

**📊 Czas**: 30-45 minut  
**📈 Poziom umiejętności po**: Potrafi samodzielnie wdrażać podstawowe aplikacje

---

### 🤖 Rozdział 2: Rozwój AI-First (Polecane dla deweloperów AI)
**Wymagania wstępne**: ukończony Rozdział 1  
**Czas trwania**: 1-2 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji zasilanych AI
- Zrozumienie konfiguracji usług AI

#### Materiały dydaktyczne
- **🎯 Zacznij tutaj**: [Integracja Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenci AI**: [Przewodnik po agentach AI](docs/chapter-02-ai-development/agents.md) - Wdrażanie inteligentnych agentów z AZD
- **📖 Wzorce**: [Wdrożenie modeli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Wdrażanie i zarządzanie modelami AI
- **🛠️ Warsztat**: [Laboratorium AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Uczyń swoje rozwiązania AI gotowymi do AZD
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) - Nauka w przeglądarce z MkDocs * środowisko DevContainer
- **📋 Szablony**: [Szablony Microsoft Foundry](#zasoby-warsztatu)
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

**💡 Efekt rozdziału**: Wdrażanie i konfiguracja aplikacji czatu AI z funkcjami RAG

**✅ Walidacja sukcesu:**
```bash
# Po rozdziale 2 powinieneś być w stanie:
azd init --template azure-search-openai-demo
azd up
# Przetestować interfejs rozmowy AI
# Zadawać pytania i otrzymywać odpowiedzi wspierane przez AI wraz z źródłami
# Zweryfikować działanie integracji wyszukiwania
azd monitor  # Sprawdzić, czy Application Insights wyświetla telemetrię
azd down --force --purge
```

**📊 Czas**: 1-2 godziny  
**📈 Poziom umiejętności po**: Potrafi wdrażać i konfigurować produkcyjne aplikacje AI  
**💰 Świadomość kosztów:** Zrozumienie kosztów deweloperskich $80-150/mies., kosztów produkcyjnych $300-3500/mies.

#### 💰 Rozważania kosztowe dotyczące wdrożeń AI

**Środowisko deweloperskie (szacunkowo $80-150/mies.):**
- Modele Microsoft Foundry (płatne według zużycia): $0-50/mies. (w oparciu o zużycie tokenów)
- AI Search (podstawowy poziom): $75/mies.
- Container Apps (na żądanie): $0-20/mies.
- Storage (standardowy): $1-5/mies.

**Środowisko produkcyjne (szacunkowo $300-3 500+/mies.):**
- Modele Microsoft Foundry (PTU dla stabilnej wydajności): $3,000+/mies. LUB płatność według zużycia przy dużym wolumenie
- AI Search (standardowy poziom): $250/mies.
- Container Apps (dedykowany): $50-100/mies.
- Application Insights: $5-50/mies.
- Storage (premium): $10-50/mies.

**💡 Wskazówki optymalizacji kosztów:**
- Korzystaj z **darmowego poziomu** modeli Microsoft Foundry do nauki (Azure OpenAI 50 000 tokenów/miesiąc wliczone)
- Uruchamiaj `azd down` by zwolnić zasoby, gdy nie aktywnie rozwijasz
- Zacznij od rozliczania według zużycia, upgrade do PTU tylko na produkcji
- Użyj `azd provision --preview` do szacowania kosztów przed wdrożeniem
- Włącz auto-skalowanie: płać tylko za faktyczne wykorzystanie

**Monitorowanie kosztów:**
```bash
# Sprawdź szacowane miesięczne koszty
azd provision --preview

# Monitoruj rzeczywiste koszty w Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Rozdział 3: Konfiguracja i Uwierzytelnianie
**Wymagania wstępne**: ukończony Rozdział 1  
**Czas trwania**: 45-60 minut  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskami
- Najlepsze praktyki uwierzytelniania i bezpieczeństwa
- Zarządzanie nazwami i organizacją zasobów

#### Materiały dydaktyczne
- **📖 Konfiguracja**: [Przewodnik konfiguracji](docs/chapter-03-configuration/configuration.md) - Ustawienia środowiska
- **🔐 Bezpieczeństwo**: [Wzorce uwierzytelniania i zarządzane tożsamości](docs/chapter-03-configuration/authsecurity.md) - Wzorce uwierzytelniania
- **📝 Przykłady**: [Przykład aplikacji bazodanowej](examples/database-app/README.md) - Przykłady baz danych AZD

#### Ćwiczenia praktyczne
- Konfiguracja wielu środowisk (dev, staging, produkcja)
- Ustawienie uwierzytelniania zarządzanej tożsamości
- Implementacja konfiguracji specyficznych dla środowiska

**💡 Efekt rozdziału**: Zarządzanie wieloma środowiskami z prawidłowym uwierzytelnianiem i bezpieczeństwem

---

### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenie
**Wymagania wstępne**: ukończone rozdziały 1-3  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeń
- IaC z użyciem Bicep
- Strategie provisioningu zasobów

#### Materiały dydaktyczne
- **📖 Wdrożenie**: [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) - Kompleksowe przepływy pracy
- **🏗️ Provisioning**: [Provisioning zasobów](docs/chapter-04-infrastructure/provisioning.md) - Zarządzanie zasobami Azure
- **📝 Przykłady**: [Przykład Container App](../../examples/container-app) - Wdrożenia w kontenerach

#### Ćwiczenia praktyczne
- Tworzenie własnych szablonów Bicep
- Wdrażanie aplikacji wieloserwisowych
- Implementacja strategii blue-green deployment

**💡 Efekt rozdziału**: Wdrażanie złożonych aplikacji wieloserwisowych przy użyciu niestandardowych szablonów infrastruktury

---

### 🎯 Rozdział 5: Wieloagentowe rozwiązania AI (zaawansowany)
**Wymagania wstępne**: ukończone rozdziały 1-2  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury wieloagentowej
- Orkiestracja i koordynacja agentów
- Wdrożenia AI gotowe do produkcji

#### Materiały dydaktyczne
- **🤖 Projekt wyróżniony**: [Wieloagentowe rozwiązanie retail](examples/retail-scenario.md) - Kompletny projekt
- **🛠️ Szablony ARM**: [Pakiet szablonów ARM](../../examples/retail-multiagent-arm-template) - Wdrożenie jednym kliknięciem
- **📖 Architektura**: [Wzorce koordynacji wieloagentowej](docs/chapter-06-pre-deployment/coordination-patterns.md) - Wzorce

#### Ćwiczenia praktyczne
```bash
# Wdroż kompletne rozwiązanie wieloagentowe dla handlu detalicznego
cd examples/retail-multiagent-arm-template
./deploy.sh

# Eksploruj konfiguracje agentów
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Efekt rozdziału**: Wdrożenie i zarządzanie produkcyjnym rozwiązaniem AI z wieloma agentami: Klient i Inwentarz

---

### 🔍 Rozdział 6: Walidacja i planowanie przed wdrożeniem
**Wymagania wstępne**: ukończony Rozdział 4  
**Czas trwania**: 1 godzina  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Planowanie pojemności i walidacja zasobów
- Strategie wyboru SKU
- Kontrole przedstartowe i automatyzacja

#### Materiały dydaktyczne
- **📊 Planowanie**: [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) - Walidacja zasobów
- **💰 Wybór**: [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Wybory ekonomiczne
- **✅ Walidacja**: [Kontrole przed startem](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrypty automatyczne

#### Ćwiczenia praktyczne
- Uruchamianie skryptów walidacji pojemności
- Optymalizacja wyborów SKU pod kątem kosztów
- Implementacja zautomatyzowanych kontroli przed wdrożeniem

**💡 Efekt rozdziału**: Walidacja i optymalizacja wdrożeń przed ich realizacją

---

### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie
**Wymagania wstępne**: ukończony dowolny rozdział wdrożeniowy  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Systematyczne podejścia do debugowania
- Typowe problemy i rozwiązania
- Specyfika debugowania usług AI

#### Materiały dydaktyczne
- **🔧 Typowe problemy**: [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rozwiązania
- **🕵️ Debugowanie**: [Przewodnik debugowania](docs/chapter-07-troubleshooting/debugging.md) - Strategie krok po kroku
- **🤖 Problemy AI**: [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemy usług AI

#### Ćwiczenia praktyczne
- Diagnozowanie błędów wdrożenia
- Rozwiązywanie problemów z uwierzytelnianiem
- Debugowanie łączności usług AI

**💡 Efekt rozdziału**: Samodzielna diagnoza i rozwiązywanie typowych problemów wdrożeniowych

---

### 🏢 Rozdział 8: Produkcja i wzorce korporacyjne
**Wymagania wstępne**: ukończone rozdziały 1-4  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Wzorce bezpieczeństwa przedsiębiorstw
- Monitorowanie i optymalizacja kosztów

#### Materiały dydaktyczne
- **🏭 Produkcja**: [Najlepsze praktyki AI dla produkcji](docs/chapter-08-production/production-ai-practices.md) - Wzorce korporacyjne  
- **📝 Przykłady**: [Przykład mikroserwisów](../../examples/microservices) - Zaawansowane architektury  
- **📊 Monitorowanie**: [Integracja Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorowanie  

#### Ćwiczenia praktyczne  
- Wdrożenie wzorców bezpieczeństwa korporacyjnego  
- Konfiguracja kompleksowego monitorowania  
- Wdrożenie do produkcji z odpowiednim nadzorem  

**💡 Wynik rozdziału**: Wdróż aplikacje gotowe do produkcji o pełnych możliwościach produkcyjnych  

---

## 🎓 Przegląd warsztatu: Praktyczne doświadczenie szkoleniowe

> **⚠️ STATUS WARSZTATU: Aktywny rozwój**  
> Materiały warsztatowe są obecnie opracowywane i udoskonalane. Kluczowe moduły działają, jednak niektóre zaawansowane sekcje są nieukończone. Intensywnie pracujemy nad ukończeniem całości. [Śledź postęp →](workshop/README.md)

### Interaktywne materiały warsztatowe  
**Kompleksowe praktyczne nauczanie z narzędziami przeglądarkowymi i prowadzonymi ćwiczeniami**

Nasze materiały warsztatowe oferują uporządkowane, interaktywne doświadczenie edukacyjne uzupełniające powyższy program rozdziałów. Warsztat jest zaprojektowany zarówno do nauki we własnym tempie, jak i do sesji prowadzonych przez instruktora.  

#### 🛠️ Funkcje warsztatu  
- **Interfejs przeglądarkowy**: Kompletny warsztat oparty na MkDocs z funkcjami wyszukiwania, kopiowania i motywów  
- **Integracja GitHub Codespaces**: Ustawienie środowiska deweloperskiego jednym kliknięciem  
- **Struktura nauki**: 8 modułów ćwiczeń prowadzonych (3-4 godziny łącznie)  
- **Stopniowa metodologia**: Wprowadzenie → Wybór → Walidacja → Dekonstrukcja → Konfiguracja → Dostosowanie → Demontaż → Podsumowanie  
- **Interaktywne środowisko DevContainer**: Wygenerowane narzędzia i zależności  

#### 📚 Struktura modułów warsztatu  
Warsztat opiera się na **8-modułowej progresywnej metodologii**, która prowadzi od odkrywania do mistrzostwa wdrożeniowego:

| Moduł    | Temat                | Co zrobisz                                      | Czas trwania |
|----------|----------------------|------------------------------------------------|--------------|
| **0. Wprowadzenie**  | Przegląd warsztatu    | Zrozumieć cele nauki, wymagania i strukturę warsztatu | 15 min       |
| **1. Wybór**         | Odkrywanie szablonów | Przeglądać szablony AZD i wybrać odpowiedni szablon AI do swojego scenariusza | 20 min       |
| **2. Walidacja**     | Wdrożenie i weryfikacja | Wdrożyć szablon za pomocą `azd up` i zweryfikować działanie infrastruktury | 30 min       |
| **3. Dekonstrukcja** | Zrozumienie struktury | Używać GitHub Copilot do eksploracji architektury szablonu, plików Bicep i organizacji kodu | 30 min       |
| **4. Konfiguracja**  | Szczegółowa analiza azure.yaml | Opanować konfigurację `azure.yaml`, haki cyklu życia i zmienne środowiskowe | 30 min       |
| **5. Dostosowanie**  | Spersonalizuj        | Włączyć AI Search, śledzenie, ewaluację oraz dostosować do swojego scenariusza | 45 min       |
| **6. Demontaż**      | Sprzątanie            | Bezpiecznie usunąć zasoby za pomocą `azd down --purge` | 15 min       |
| **7. Podsumowanie**  | Kolejne kroki         | Przejrzeć osiągnięcia, kluczowe koncepcje i kontynuować naukę | 15 min       |

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
# Postępuj zgodnie z instrukcjami instalacji w workshop/README.md
```
  
#### 🎯 Efekty nauki warsztatu  
Po ukończeniu warsztatu uczestnicy:  
- **Wdrożą produkcyjne aplikacje AI**: Z użyciem AZD i usług Microsoft Foundry  
- **Opanują architekturę wieloagentową**: Implementacja skoordynowanych rozwiązań z agentami AI  
- **Wdrożą najlepsze praktyki bezpieczeństwa**: Konfiguracja uwierzytelniania i kontroli dostępu  
- **Optymalizują pod kątem skali**: Projektowanie efektywnych kosztowo i wydajnych wdrożeń  
- **Rozwiążą problemy wdrożeniowe**: Samodzielne diagnozowanie i naprawa typowych problemów  

#### 📖 Zasoby warsztatu  
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) - środowisko nauki w przeglądarce  
- **📋 Instrukcje moduł po module**:  
  - [0. Wprowadzenie](workshop/docs/instructions/0-Introduction.md) - przegląd i cele warsztatu  
  - [1. Wybór](workshop/docs/instructions/1-Select-AI-Template.md) - wyszukiwanie i wybór szablonów AI  
  - [2. Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) - wdrażanie i weryfikacja szablonów  
  - [3. Dekonstrukcja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - eksploracja architektury szablonów  
  - [4. Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) - obsługa azure.yaml  
  - [5. Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) - personalizacja do scenariusza  
  - [6. Demontaż](workshop/docs/instructions/6-Teardown-Infrastructure.md) - likwidacja zasobów  
  - [7. Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) - przegląd i dalsze kroki  
- **🛠️ Laboratorium AI Workshop**: [Laboratorium AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ćwiczenia związane z AI  
- **💡 Szybki start**: [Przewodnik konfiguracji warsztatu](workshop/README.md#quick-start) - konfiguracja środowiska  

**Idealne dla**: szkoleń korporacyjnych, kursów uniwersyteckich, nauki indywidualnej oraz bootcampów deweloperskich.  

---

## 📖 Dogłębna analiza: możliwości AZD  

Poza podstawami, AZD oferuje potężne funkcje dla wdrożeń produkcyjnych:  

- **Wdrożenia oparte na szablonach** – używaj gotowych wzorców dla powszechnych aplikacji  
- **Infrastruktura jako kod** – zarządzaj zasobami Azure za pomocą Bicep lub Terraform  
- **Zintegrowane przepływy pracy** – bezproblemowa prowizja, wdrożenie i monitorowanie aplikacji  
- **Przyjazny dla programisty** – zoptymalizowany pod kątem produktywności i doświadczenia deweloperów  

### **AZD + Microsoft Foundry: idealne do wdrożeń AI**  

**Dlaczego AZD dla rozwiązań AI?** AZD odpowiada na największe wyzwania deweloperów AI:  

- **Szablony gotowe do AI** – prekonfigurowane szablony dla modeli Microsoft Foundry, usług kognitywnych i obciążeń ML  
- **Bezpieczne wdrożenia AI** – wzorce bezpieczeństwa dla usług AI, kluczy API i punktów końcowych modeli  
- **Wzorce produkcyjne AI** – najlepsze praktyki dla skalowalnych, opłacalnych wdrożeń AI  
- **End-to-end workflow AI** – od rozwoju modeli po produkcyjne wdrożenie z odpowiednim monitoringiem  
- **Optymalizacja kosztów** – inteligentne zarządzanie zasobami i skalowanie dla obciążeń AI  
- **Integracja z Microsoft Foundry** – bezproblemowe połączenie z katalogiem i punktami końcowymi modeli Microsoft Foundry  

---

## 🎯 Biblioteka szablonów i przykładów  

### Polecane: szablony Microsoft Foundry  
**Zacznij tutaj, jeśli wdrażasz aplikacje AI!**

> **Uwaga:** Te szablony pokazują różne wzorce AI. Niektóre to zewnętrzne Azure Samples, inne lokalne implementacje.

| Szablon | Rozdział | Złożoność | Usługi | Typ |
|---------|----------|-----------|--------|-----|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Rozdział 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zewnętrzny |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zewnętrzny |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zewnętrzny |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zewnętrzny |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalny** |

### Polecane: kompletne scenariusze nauki  
**Szablony aplikacji gotowych do produkcji powiązane z rozdziałami nauki**

| Szablon | Rozdział nauki | Złożoność | Kluczowa nauka |
|---------|----------------|-----------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | Podstawowe wzorce wdrożeń AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | Implementacja RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Rozdział 4 | ⭐⭐ | Integracja inteligencji dokumentów |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | Framework agentów i wywoływanie funkcji |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐ | Orkiestracja AI na poziomie enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | Architektura wieloagentowa z agentami klienta i zapasów |

### Nauka przez typ przykładu  

> **📌 Przykłady lokalne vs. zewnętrzne:**  
> **Przykłady lokalne** (w tym repozytorium) = Gotowe do natychmiastowego użycia  
> **Przykłady zewnętrzne** (Azure Samples) = Klonowanie z powiązanych repozytoriów

#### Przykłady lokalne (gotowe do użycia)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletny, gotowy do produkcji przykład z szablonami ARM  
  - Architektura wieloagentowa (agenci klienta + agenci zapasów)  
  - Kompleksowe monitorowanie i ewaluacja  
  - Wdrożenie jednym kliknięciem poprzez szablony ARM  

#### Przykłady lokalne - aplikacje kontenerowe (rozdziały 2-5)  
**Kompleksowe przykłady wdrożeń kontenerowych w tym repozytorium:**  
- [**Przykłady aplikacji kontenerowych**](examples/container-app/README.md) - Kompletny przewodnik po wdrożeniach kontenerowych  
  - [Proste API Flask](../../examples/container-app/simple-flask-api) - Podstawowe API REST z możliwością skalowania do zera  
  - [Architektura mikroserwisów](../../examples/container-app/microservices) - Produkcyjne wdrożenie wielu usług  
  - Wzorce szybkiego startu, produkcji i zaawansowane  
  - Monitorowanie, bezpieczeństwo i wskazówki optymalizacji kosztów  

#### Przykłady zewnętrzne - proste aplikacje (rozdziały 1-2)  
**Klonuj te repozytoria Azure Samples, aby zacząć:**  
- [Prosta aplikacja webowa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Podstawowe wzorce wdrożeń  
- [Statyczna strona - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Wdrożenie treści statycznych  
- [Aplikacja kontenerowa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Wdrożenie REST API  

#### Przykłady zewnętrzne - integracja bazy danych (rozdziały 3-4)  
- [Aplikacja bazodanowa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Wzorce łączenia z bazą danych  
- [Funkcje + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Bezserwerowe przepływy danych  

#### Przykłady zewnętrzne - wzorce zaawansowane (rozdziały 4-8)  
- [Mikroserwisy Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury multi-service  
- [Zadania aplikacji kontenerowych](https://github.com/Azure-Samples/container-apps-jobs) - Przetwarzanie w tle  
- [Przemysłowa linia ML](https://github.com/Azure-Samples/mlops-v2) - Wzorce ML gotowe do produkcji  

### Kolekcje zewnętrznych szablonów  
- [**Oficjalna galeria szablonów AZD**](https://azure.github.io/awesome-azd/) - Wyselekcjonowane kolekcje szablonów oficjalnych i społecznościowych  
- [**Szablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacja szablonów Microsoft Learn  
- [**Katalog przykładów**](examples/README.md) - Lokalne przykłady edukacyjne z wyjaśnieniami  

---

## 📚 Materiały edukacyjne i odniesienia  

### Szybkie odniesienia  
- [**Cheat Sheet poleceń**](resources/cheat-sheet.md) - Kluczowe komendy azd posegregowane według rozdziału  
- [**Słownik pojęć**](resources/glossary.md) - Terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - Najczęstsze pytania według rozdziałów nauki  
- [**Przewodnik do nauki**](resources/study-guide.md) - Kompleksowe ćwiczenia praktyczne  

### Warsztaty praktyczne  
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Uczy jak wdrażać AI z wykorzystaniem AZD (2-3 godziny)  
- [**Interaktywny warsztat**](workshop/README.md) - 8 modułów ćwiczeń prowadzonych z MkDocs i GitHub Codespaces  
  - Sekwencja: Wprowadzenie → Wybór → Walidacja → Dekonstrukcja → Konfiguracja → Dostosowanie → Demontaż → Podsumowanie  

### Zewnętrzne zasoby edukacyjne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum Architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Umiejętności agenta AI dla Twojego edytora
- [**Umiejętności Microsoft Azure na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otwartych umiejętności agenta dla Azure AI, Foundry, wdrożeń, diagnostyki, optymalizacji kosztów i innych. Zainstaluj je w GitHub Copilot, Cursor, Claude Code lub dowolnym obsługiwanym agencie:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Szybki przewodnik rozwiązywania problemów

**Typowe problemy, z którymi spotykają się początkujący, i natychmiastowe rozwiązania:**

<details>
<summary><strong>❌ "azd: polecenie nie znalezione"</strong></summary>

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
<summary><strong>❌ "Nie znaleziono subskrypcji" lub "Subskrypcja nie ustawiona"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" lub "Przekroczono limit"</strong></summary>

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
<summary><strong>❌ "azd up" kończy się błędem w trakcie działania</strong></summary>

```bash
# Opcja 1: Wyczyść i spróbuj ponownie
azd down --force --purge
azd up

# Opcja 2: Tylko napraw infrastrukturę
azd provision

# Opcja 3: Sprawdź szczegółowy status
azd show

# Opcja 4: Sprawdź logi w Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Błąd uwierzytelniania" lub "Token wygasł"</strong></summary>

```bash
# Ponownie uwierzytelnij
az logout
az login

azd auth logout
azd auth login

# Zweryfikuj uwierzytelnianie
az account show
```
</details>

<details>
<summary><strong>❌ "Zasób już istnieje" lub konflikty nazw</strong></summary>

```bash
# AZD generuje unikalne nazwy, ale w przypadku konfliktu:
azd down --force --purge

# Następnie spróbuj ponownie z nowym środowiskiem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Wdrażanie szablonu trwa zbyt długo</strong></summary>

**Normalny czas oczekiwania:**
- Prosta aplikacja internetowa: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (prowizjonowanie OpenAI jest powolne)

```bash
# Sprawdź postęp
azd show

# Jeśli utknąłeś >30 minut, sprawdź portal Azure:
azd monitor
# Szukaj nieudanych wdrożeń
```
</details>

<details>
<summary><strong>❌ "Odmowa dostępu" lub "Zabronione"</strong></summary>

```bash
# Sprawdź swoją rolę w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrzebujesz co najmniej roli "Współtwórca"
# Poproś administratora Azure o przyznanie:
# - Współtwórca (dla zasobów)
# - Administrator dostępu użytkownika (dla przypisywania ról)
```
</details>

<details>
<summary><strong>❌ Nie można znaleźć adresu URL wdrożonej aplikacji</strong></summary>

```bash
# Pokaż wszystkie punkty końcowe usługi
azd show

# Lub otwórz portal Azure
azd monitor

# Sprawdź konkretną usługę
azd env get-values
# Szukaj zmiennych *_URL
```
</details>

### 📚 Pełne zasoby rozwiązywania problemów

- **Przewodnik po typowych problemach:** [Szczegółowe rozwiązania](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemy specyficzne dla AI:** [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Przewodnik debugowania:** [Debugowanie krok po kroku](docs/chapter-07-troubleshooting/debugging.md)
- **Uzyskaj pomoc:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukończenie kursu i certyfikacja

### Śledzenie postępów
Śledź swoje postępy nauki w każdym rozdziale:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój AI-przede wszystkim ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Rozwiązania AI z wieloma agentami ✅
- [ ] **Rozdział 6**: Weryfikacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Wzorce produkcyjne i przedsiębiorcze ✅

### Weryfikacja nauki
Po ukończeniu każdego rozdziału zweryfikuj swoją wiedzę przez:
1. **Ćwiczenie praktyczne**: Wykonaj praktyczne wdrożenie z rozdziału
2. **Test wiedzy**: Przejrzyj sekcję FAQ dla swojego rozdziału
3. **Dyskusja społecznościowa**: Podziel się doświadczeniem na Discordzie Azure
4. **Następny rozdział**: Przejdź do kolejnego poziomu zaawansowania

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów uzyskasz:
- **Doświadczenie produkcyjne**: Wdrożone rzeczywiste aplikacje AI w Azure
- **Umiejętności zawodowe**: Możliwość wdrożeń gotowych do zastosowań przedsiębiorczych  
- **Uznanie w społeczności**: Aktywny członek społeczności deweloperów Azure
- **Awans zawodowy**: Poszukiwana specjalizacja w AZD i wdrożeniach AI

---

## 🤝 Społeczność i wsparcie

### Uzyskaj pomoc i wsparcie
- **Problemy techniczne**: [Zgłaszaj błędy i prośby o funkcje](https://github.com/microsoft/azd-for-beginners/issues)
- **Pytania dotyczące nauki**: [Społeczność Microsoft Azure Discord](https://discord.gg/microsoft-azure) oraz [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specyficzna dla AI**: Dołącz do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacja**: [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wgląd społeczności z Microsoft Foundry Discord

**Najnowsze wyniki ankiet z kanału #Azure:**
- **45%** deweloperów chce używać AZD do obciążeń AI
- **Główne wyzwania**: Wdrożenia wielousługowe, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najczęściej proszone o**: szablony specyficzne dla AI, przewodniki rozwiązywania problemów, najlepsze praktyki

**Dołącz do naszej społeczności, aby:**
- Dzielić się doświadczeniami z AZD + AI i uzyskać pomoc
- Uzyskiwać dostęp do wczesnych wersji nowych szablonów AI
- Współtworzyć najlepsze praktyki wdrożeń AI
- Wpływać na przyszły rozwój funkcji AI + AZD

### Wkład w kurs
Zapraszamy do współpracy! Przeczytaj nasz [Przewodnik współpracy](CONTRIBUTING.md), aby dowiedzieć się więcej o:
- **Ulepszanie treści**: Udoskonalanie istniejących rozdziałów i przykładów
- **Nowe przykłady**: Dodawanie rzeczywistych scenariuszy i szablonów  
- **Tłumaczenia**: Pomoc w utrzymaniu wsparcia wielojęzycznego
- **Zgłaszanie błędów**: Poprawa dokładności i jasności
- **Standardy społeczności**: Przestrzeganie naszych integracyjnych wytycznych społecznościowych

---

## 📄 Informacje o kursie

### Licencja
Projekt ten jest licencjonowany na warunkach licencji MIT — zobacz plik [LICENSE](../../LICENSE) po więcej szczegółów.

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
 
### Seria Generatywnego AI
[![Generatywne AI dla początkujących](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatywne AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatywne AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatywne AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Nawigacja po kursie

**🚀 Gotowy na rozpoczęcie nauki?**

**Początkujący**: Zacznij od [Rozdział 1: Podstawy i szybki start](#-chapter-1-foundation--quick-start)  
**Deweloperzy AI**: Przejdź do [Rozdział 2: Rozwój zorientowany na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Doświadczeni deweloperzy**: Zacznij od [Rozdział 3: Konfiguracja i uwierzytelnianie](#️-chapter-3-configuration--authentication)

**Kolejne kroki**: [Rozpocznij Rozdział 1 - Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uważany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->