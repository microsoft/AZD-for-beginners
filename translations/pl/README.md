# AZD dla początkujących: Ustrukturyzowana ścieżka nauki

![AZD-for-beginners](../../translated_images/pl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatyczne tłumaczenia (zawsze aktualne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabski](../ar/README.md) | [Bengalski](../bn/README.md) | [Bułgarski](../bg/README.md) | [Birmański (Myanmar)](../my/README.md) | [Chiński (uproszczony)](../zh-CN/README.md) | [Chiński (tradycyjny, Hongkong)](../zh-HK/README.md) | [Chiński (tradycyjny, Makau)](../zh-MO/README.md) | [Chiński (tradycyjny, Tajwan)](../zh-TW/README.md) | [Chorwacki](../hr/README.md) | [Czeski](../cs/README.md) | [Duński](../da/README.md) | [Niderlandzki](../nl/README.md) | [Estoński](../et/README.md) | [Fiński](../fi/README.md) | [Francuski](../fr/README.md) | [Niemiecki](../de/README.md) | [Grecki](../el/README.md) | [Hebrajski](../he/README.md) | [Hindi](../hi/README.md) | [Węgierski](../hu/README.md) | [Indonezyjski](../id/README.md) | [Włoski](../it/README.md) | [Japoński](../ja/README.md) | [Kannada](../kn/README.md) | [Koreański](../ko/README.md) | [Litewski](../lt/README.md) | [Malajski](../ms/README.md) | [Malajalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Pidgin nigeryjski](../pcm/README.md) | [Norweski](../no/README.md) | [Perski (Farsi)](../fa/README.md) | [Polski](./README.md) | [Portugalski (Brazylia)](../pt-BR/README.md) | [Portugalski (Portugalia)](../pt-PT/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Rumuński](../ro/README.md) | [Rosyjski](../ru/README.md) | [Serbski (cyrylica)](../sr/README.md) | [Słowacki](../sk/README.md) | [Słoweński](../sl/README.md) | [Hiszpański](../es/README.md) | [Suahili](../sw/README.md) | [Szwedzki](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamilski](../ta/README.md) | [Telugu](../te/README.md) | [Tajski](../th/README.md) | [Turecki](../tr/README.md) | [Ukraiński](../uk/README.md) | [Urdu](../ur/README.md) | [Wietnamski](../vi/README.md)

> **Wolisz sklonować lokalnie?**

> To repozytorium zawiera ponad 50 tłumaczeń językowych, co znacząco zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To da Ci wszystko, czego potrzebujesz, aby ukończyć kurs, a pobieranie będzie dużo szybsze.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Czym jest Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** to przyjazne dla dewelopera narzędzie w wierszu poleceń, które ułatwia wdrażanie aplikacji na Azure. Zamiast ręcznie tworzyć i łączyć dziesiątki zasobów Azure, możesz wdrożyć całe aplikacje za pomocą jednego polecenia.

### Magia `azd up`

```bash
# To jedno polecenie robi wszystko:
# ✅ Tworzy wszystkie zasoby Azure
# ✅ Konfiguruje sieć i zabezpieczenia
# ✅ Buduje kod Twojej aplikacji
# ✅ Wdraża do Azure
# ✅ Zapewnia działający adres URL
azd up
```

**To wszystko!** Żadnego klikania w Azure Portal, żadnych skomplikowanych szablonów ARM do nauki, żadnej ręcznej konfiguracji – po prostu działające aplikacje na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: jaka jest różnica?

To najczęściej zadawane pytanie przez początkujących. Oto prosta odpowiedź:

| Funkcja | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cel** | Zarządzanie pojedynczymi zasobami Azure | Wdrażanie kompletnych aplikacji |
| **Perspektywa** | Skoncentrowana na infrastrukturze | Skoncentrowana na aplikacji |
| **Przykład** | `az webapp create --name myapp...` | `azd up` |
| **Krzywa nauki** | Trzeba znać usługi Azure | Wystarczy znać swoją aplikację |
| **Najlepsze dla** | DevOps, infrastruktura | Deweloperzy, prototypowanie |

### Prosta analogia

- **Azure CLI** to jak posiadanie wszystkich narzędzi do budowy domu – młotki, piły, gwoździe. Możesz zbudować wszystko, ale musisz znać budownictwo.
- **Azure Developer CLI** to jak zatrudnienie wykonawcy – opisujesz, co chcesz, a on zajmuje się budową.

### Kiedy używać którego

| Scenariusz | Użyj tego |
|------------|-----------|
| "Chcę szybko wdrożyć moją aplikację webową" | `azd up` |
| "Potrzebuję stworzyć tylko konto magazynu" | `az storage account create` |
| "Buduję pełną aplikację AI" | `azd init --template azure-search-openai-demo` |
| "Muszę debugować konkretny zasób Azure" | `az resource show` |
| "Chcę wdrożenie gotowe do produkcji w kilka minut" | `azd up --environment production` |

### Działają razem!

AZD korzysta w tle z Azure CLI. Możesz używać obu:
```bash
# Wdróż swoją aplikację przy użyciu AZD
azd up

# Następnie dopracuj konkretne zasoby za pomocą Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Znajdź szablony w Awesome AZD

Nie zaczynaj od zera! **Awesome AZD** to kolekcja społecznościowa gotowych szablonów do wdrożenia:

| Zasób | Opis |
|-------|------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Przeglądaj 200+ szablonów z jednym kliknięciem wdrożenia |
| 🔗 [**Prześlij szablon**](https://github.com/Azure/awesome-azd/issues) | Dodaj swój własny szablon dla społeczności |
| 🔗 [**Repozytorium GitHub**](https://github.com/Azure/awesome-azd) | Oceniaj i eksploruj kod źródłowy |

### Popularne szablony AI z Awesome AZD

```bash
# Czat RAG z Azure OpenAI + Wyszukiwanie AI
azd init --template azure-search-openai-demo

# Szybka aplikacja czatu AI
azd init --template openai-chat-app-quickstart

# Agenci AI z Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Zacznij w 3 krokach

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

### Krok 3: Wdroż swoją pierwszą aplikację

```bash
# Zainicjalizuj z szablonu
azd init --template todo-nodejs-mongo

# Wdróż do Azure (tworzy wszystko!)
azd up
```

**🎉 Gotowe!** Twoja aplikacja jest teraz dostępna na Azure.

### Posprzątaj (nie zapomnij!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak korzystać z tego kursu

Ten kurs jest zaprojektowany do **stopniowej nauki** – zacznij tam, gdzie czujesz się komfortowo i rozwijaj się dalej:

| Twoje doświadczenie | Zacznij tutaj |
|---------------------|--------------|
| **Nowy w Azure** | [Rozdział 1: Podstawy](../..) |
| **Znajomość Azure, nowy w AZD** | [Rozdział 1: Podstawy](../..) |
| **Chcesz wdrażać aplikacje AI** | [Rozdział 2: Rozwój AI](../..) |
| **Potrzebujesz praktycznych ćwiczeń** | [🎓 Warsztat interaktywny](workshop/README.md) – 3-4 godziny prowadzonych laboratoriów |
| **Potrzebujesz wzorców produkcyjnych** | [Rozdział 8: Produkcja i przedsiębiorstwa](../..) |

### Szybkie uruchomienie

1. **Utwórz fork repozytorium**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj je**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Uzyskaj pomoc**: [Społeczność Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Wolisz sklonować lokalnie?**

> To repozytorium zawiera ponad 50 tłumaczeń językowych, co znacząco zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To da Ci wszystko, czego potrzebujesz, aby ukończyć kurs, a pobieranie będzie dużo szybsze.


## Przegląd kursu

Opanuj Azure Developer CLI (azd) przez ustrukturyzowane rozdziały zaprojektowane do stopniowej nauki. **Szczególny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla nowoczesnych deweloperów

Na podstawie wniosków ze społeczności Microsoft Foundry Discord, **45% deweloperów chce korzystać z AZD do obciążeń AI** ale napotyka wyzwania z:
- Złożonymi, wielousługowymi architekturami AI
- Najlepszymi praktykami wdrażania AI do produkcji  
- Integracją i konfiguracją usług Azure AI
- Optymalizacją kosztów obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

### Cele nauki

Po ukończeniu tego uporządkowanego kursu będziesz:
- **Opanowanie podstaw AZD**: kluczowe koncepcje, instalacja i konfiguracja
- **Wdrażanie aplikacji AI**: używanie AZD z usługami Microsoft Foundry
- **Implementacja Infrastructure as Code**: zarządzanie zasobami Azure za pomocą szablonów Bicep
- **Rozwiązywanie problemów podczas wdrażania**: rozwiązywanie typowych problemów i debugowanie
- **Optymalizacja dla produkcji**: bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Budowa rozwiązań Multi-Agent**: wdrażanie złożonych architektur AI

## 🗺️ Mapa kursu: szybka nawigacja po rozdziałach

Każdy rozdział ma dedykowany README z celami nauki, szybkim startem i ćwiczeniami:

| Rozdział | Temat | Lekcje | Czas trwania | Złożoność |
|----------|-------|--------|--------------|-----------|
| **[Rozdział 1: Podstawy](docs/chapter-01-foundation/README.md)** | Pierwsze kroki | [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacja](docs/chapter-01-foundation/installation.md) &#124; [Pierwszy projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Rozdział 2: Rozwój AI](docs/chapter-02-ai-development/README.md)** | Aplikacje AI-First | [Integracja Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenci AI](docs/chapter-02-ai-development/agents.md) &#124; [Wdrażanie modeli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsztat](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 godz. | ⭐⭐ |
| **[Rozdział 3: Konfiguracja](docs/chapter-03-configuration/README.md)** | Uwierzytelnianie i bezpieczeństwo | [Konfiguracja](docs/chapter-03-configuration/configuration.md) &#124; [Uwierzytelnianie i bezpieczeństwo](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Rozdział 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i wdrażanie | [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 godz. | ⭐⭐⭐ |
| **[Rozdział 5: Wieloagentowy](docs/chapter-05-multi-agent/README.md)** | Rozwiązania agentów AI | [Scenariusz detaliczny](examples/retail-scenario.md) &#124; [Wzorce koordynacji](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 godziny | ⭐⭐⭐⭐ |
| **[Rozdział 6: Przed wdrożeniem](docs/chapter-06-pre-deployment/README.md)** | Planowanie i weryfikacja | [Kontrole przed startem](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 godzina | ⭐⭐ |
| **[Rozdział 7: Rozwiązywanie problemów](docs/chapter-07-troubleshooting/README.md)** | Debugowanie i naprawa | [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugowanie](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemy z AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 godziny | ⭐⭐ |
| **[Rozdział 8: Produkcja](docs/chapter-08-production/README.md)** | Wzorce przedsiębiorcze | [Praktyki produkcyjne](docs/chapter-08-production/production-ai-practices.md) | 2-3 godziny | ⭐⭐⭐⭐ |
| **[🎓 Warsztat](workshop/README.md)** | Laboratorium praktyczne | [Wprowadzenie](workshop/docs/instructions/0-Introduction.md) &#124; [Wybór](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Demontaż](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaż infrastruktury](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 godziny | ⭐⭐ |

**Całkowity czas kursu:** ~10-14 godzin | **Poziom umiejętności:** Początkujący → Gotowy do produkcji

---

## 📚 Rozdziały do nauki

*Wybierz ścieżkę nauki w zależności od poziomu doświadczenia i celów*

### 🚀 Rozdział 1: Podstawy i szybki start
**Wymagania wstępne**: subskrypcja Azure, podstawowa znajomość wiersza poleceń  
**Czas trwania**: 30-45 minut  
**Poziom trudności**: ⭐

#### Czego się nauczysz
- Podstawy Azure Developer CLI
- Instalacja AZD na Twojej platformie
- Pierwsze udane wdrożenie

#### Materiały edukacyjne
- **🎯 Zacznij tutaj**: [Co to jest Azure Developer CLI?](../..)
- **📖 Teoria**: [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) - Kluczowe pojęcia i terminologia
- **⚙️ Instalacja**: [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md) - Przewodniki platformowe
- **🛠️ Praktyka**: [Twój pierwszy projekt](docs/chapter-01-foundation/first-project.md) - Samouczek krok po kroku
- **📋 Szybki odnośnik**: [Lista poleceń](resources/cheat-sheet.md)

#### Ćwiczenia praktyczne
```bash
# Szybkie sprawdzenie instalacji
azd version

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up
```

**💡 Efekt rozdziału**: Udane wdrożenie prostej aplikacji internetowej na Azure przy użyciu AZD

**✅ Weryfikacja sukcesu:**
```bash
# Po ukończeniu Rozdziału 1 powinieneś być w stanie:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża do Azure
azd show                # Wyświetla URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Sprząta zasoby
```

**📊 Nakład czasu:** 30-45 minut  
**📈 Poziom umiejętności po:** Potrafi samodzielnie wdrażać podstawowe aplikacje

**✅ Weryfikacja sukcesu:**
```bash
# Po ukończeniu Rozdziału 1 powinieneś być w stanie:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża do Azure
azd show                # Wyświetla URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Czyści zasoby
```

**📊 Nakład czasu:** 30-45 minut  
**📈 Poziom umiejętności po:** Potrafi samodzielnie wdrażać podstawowe aplikacje

---

### 🤖 Rozdział 2: Rozwój AI w pierwszej kolejności (zalecane dla programistów AI)
**Wymagania wstępne**: Rozdział 1 ukończony  
**Czas trwania**: 1-2 godziny  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji zasilanych AI
- Konfiguracja usług AI

#### Materiały edukacyjne
- **🎯 Zacznij tutaj**: [Integracja Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenci AI**: [Przewodnik po agentach](docs/chapter-02-ai-development/agents.md) - Wdrażanie inteligentnych agentów z AZD
- **📖 Wzorce**: [Wdrażanie modeli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Zarządzanie modelami AI
- **🛠️ Warsztat**: [Laboratorium AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Przygotuj rozwiązania AI na AZD
- **🎥 Przewodnik interaktywny**: [Materiały warsztatowe](workshop/README.md) - Nauka w przeglądarce z MkDocs * Środowisko DevContainer
- **📋 Szablony**: [Szablony Microsoft Foundry](../..)
- **📝 Przykłady**: [Przykłady wdrożenia AZD](examples/README.md)

#### Ćwiczenia praktyczne
```bash
# Wdróż swoją pierwszą aplikację AI
azd init --template azure-search-openai-demo
azd up

# Wypróbuj dodatkowe szablony AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Efekt rozdziału**: Wdrożenie i konfiguracja aplikacji czatu AI z funkcjami RAG

**✅ Weryfikacja sukcesu:**
```bash
# Po rozdziale 2 powinieneś być w stanie:
azd init --template azure-search-openai-demo
azd up
# Przetestować interfejs czatu AI
# Zadawać pytania i otrzymywać odpowiedzi generowane przez AI wraz ze źródłami
# Zweryfikować, że integracja wyszukiwania działa
azd monitor  # Sprawdzić, czy Application Insights pokazuje telemetrię
azd down --force --purge
```

**📊 Nakład czasu:** 1-2 godziny  
**📈 Poziom umiejętności po:** Potrafi wdrażać i konfigurować aplikacje AI gotowe do produkcji  
**💰 Świadomość kosztów:** Znajomość kosztów deweloperskich $80-150/mies., kosztów produkcyjnych $300-3500/mies.

#### 💰 Uwagi dotyczące kosztów wdrożeń AI

**Środowisko deweloperskie (szacunkowo $80-150/mies.):**
- Azure OpenAI (płatność według użycia): $0-50/mies. (w zależności od tokenów)
- AI Search (poziom podstawowy): $75/mies.
- Container Apps (na żądanie): $0-20/mies.
- Storage (standardowy): $1-5/mies.

**Środowisko produkcyjne (szacunkowo $300-3500+/mies.):**
- Azure OpenAI (PTU dla stałej wydajności): $3,000+/mies. LUB płatność według użycia przy dużym wolumenie
- AI Search (poziom standardowy): $250/mies.
- Container Apps (dedykowany): $50-100/mies.
- Application Insights: $5-50/mies.
- Storage (premium): $10-50/mies.

**💡 Wskazówki optymalizacji kosztów:**
- Używaj **Bezpłatnego poziomu** Azure OpenAI do nauki (50 000 tokenów/mies. wliczone)
- Uruchamiaj `azd down`, aby zwolnić zasoby, gdy nie rozwijasz aktywnie
- Zacznij od rozliczenia według zużycia, PTU włącz tylko dla produkcji
- Używaj `azd provision --preview` do szacowania kosztów przed wdrożeniem
- Aktywuj autoskalowanie: płać tylko za rzeczywiste użycie

**Monitorowanie kosztów:**
```bash
# Sprawdź szacunkowe koszty miesięczne
azd provision --preview

# Monitoruj rzeczywiste koszty w portalu Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie
**Wymagania wstępne**: Rozdział 1 ukończony  
**Czas trwania**: 45-60 minut  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskiem
- Najlepsze praktyki uwierzytelniania i bezpieczeństwa
- Nazewnictwo i organizacja zasobów

#### Materiały edukacyjne
- **📖 Konfiguracja**: [Przewodnik konfiguracyjny](docs/chapter-03-configuration/configuration.md) - Ustawienia środowiska
- **🔐 Bezpieczeństwo**: [Wzorce uwierzytelniania i tożsamości zarządzanej](docs/chapter-03-configuration/authsecurity.md)
- **📝 Przykłady**: [Przykład aplikacji bazodanowej](examples/database-app/README.md) - Przykłady AZD z bazą danych

#### Ćwiczenia praktyczne
- Konfiguracja wielu środowisk (dev, staging, prod)
- Ustawienie uwierzytelniania przez tożsamość zarządzaną
- Implementacja konfiguracji specyficznych dla środowiska

**💡 Efekt rozdziału**: Zarządzanie wieloma środowiskami z poprawnym uwierzytelnianiem i bezpieczeństwem

---

### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenie
**Wymagania wstępne**: Rozdziały 1-3 ukończone  
**Czas trwania**: 1-1.5 godziny  
**Poziom trudności**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeniowe
- Infrastruktura jako kod z użyciem Bicep
- Strategie provisionowania zasobów

#### Materiały edukacyjne
- **📖 Wdrożenie**: [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) - Kompleksowe workflow
- **🏗️ Provisioning**: [Provisionowanie zasobów](docs/chapter-04-infrastructure/provisioning.md) - Zarządzanie zasobami Azure
- **📝 Przykłady**: [Przykład aplikacji kontenerowej](../../examples/container-app) - Wdrożenia kontenerowe

#### Ćwiczenia praktyczne
- Tworzenie własnych szablonów Bicep
- Wdrażanie aplikacji wieloserwisowych
- Implementacja strategii wdrożenia blue-green

**💡 Efekt rozdziału**: Wdrażanie złożonych aplikacji wieloserwisowych za pomocą niestandardowych szablonów infrastruktury

---

### 🎯 Rozdział 5: Wieloagentowe rozwiązania AI (Zaawansowane)
**Wymagania wstępne**: Rozdziały 1-2 ukończone  
**Czas trwania**: 2-3 godziny  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury wieloagentowej
- Orkiestracja i koordynacja agentów
- Wdrażanie AI gotowego do produkcji

#### Materiały edukacyjne
- **🤖 Projekt flagowy**: [Wieloagentowe rozwiązanie detaliczne](examples/retail-scenario.md) - Kompletny projekt
- **🛠️ Szablony ARM**: [Pakiet szablonów ARM](../../examples/retail-multiagent-arm-template) - Wdrożenie jednym kliknięciem
- **📖 Architektura**: [Wzorce koordynacji wieloagentowej](docs/chapter-06-pre-deployment/coordination-patterns.md) - Wzorce

#### Ćwiczenia praktyczne
```bash
# Wdrożenie kompletnego wieloagentowego rozwiązania detalicznego
cd examples/retail-multiagent-arm-template
./deploy.sh

# Eksploruj konfiguracje agentów
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Efekt rozdziału**: Wdrożenie i zarządzanie wieloagentowym rozwiązaniem AI gotowym do produkcji z agentami Klienta i Magazynu

---

### 🔍 Rozdział 6: Weryfikacja i planowanie przed wdrożeniem
**Wymagania wstępne**: Rozdział 4 ukończony  
**Czas trwania**: 1 godzina  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Planowanie pojemności i weryfikacja zasobów
- Strategie wyboru SKU
- Kontrole przed startem i automatyzacja

#### Materiały edukacyjne
- **📊 Planowanie**: [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) - Weryfikacja zasobów
- **💰 Wybór**: [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Opcje oszczędne
- **✅ Walidacja**: [Kontrole przed startem](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrypty automatyczne

#### Ćwiczenia praktyczne
- Uruchamianie skryptów weryfikacji pojemności
- Optymalizacja wyborów SKU pod kątem kosztów
- Automatyzacja kontroli przed wdrożeniem

**💡 Efekt rozdziału**: Weryfikacja i optymalizacja wdrożeń przed ich realizacją

---

### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie
**Wymagania wstępne**: Dowolny rozdział wdrożeniowy ukończony  
**Czas trwania**: 1-1.5 godziny  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Systematyczne podejście do debugowania
- Typowe problemy i rozwiązania
- Specyficzne rozwiązywanie problemów AI

#### Materiały edukacyjne
- **🔧 Typowe problemy**: [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rozwiązania
- **🕵️ Debugowanie**: [Przewodnik debugowania](docs/chapter-07-troubleshooting/debugging.md) - Strategie krok po kroku
- **🤖 Problemy AI**: [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemy z usługami AI

#### Ćwiczenia praktyczne
- Diagnozowanie błędów wdrożeń
- Rozwiązywanie problemów uwierzytelniania
- Debugowanie łączności usług AI

**💡 Efekt rozdziału**: Samodzielne diagnozowanie i rozwiązywanie typowych problemów wdrożeniowych

---

### 🏢 Rozdział 8: Produkcja i wzorce przedsiębiorcze
**Wymagania wstępne**: Rozdziały 1-4 ukończone  
**Czas trwania**: 2-3 godziny  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Wzorce bezpieczeństwa przedsiębiorstw
- Monitorowanie i optymalizacja kosztów

#### Materiały edukacyjne
- **🏭 Produkcja**: [Najlepsze praktyki AI produkcyjnego](docs/chapter-08-production/production-ai-practices.md) - Wzorce przedsiębiorcze
- **📝 Przykłady**: [Przykład mikroserwisów](../../examples/microservices) - Złożone architektury
- **📊 Monitorowanie**: [Integracja Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorowanie

#### Ćwiczenia praktyczne
- Implementacja wzorców bezpieczeństwa przedsiębiorstwa
- Ustawienie kompleksowego monitoringu
- Wdrożenie do produkcji z odpowiednim zarządzaniem

**💡 Efekt rozdziału**: Wdrażanie aplikacji gotowych do produkcji z pełną funkcjonalnością

---

## 🎓 Przegląd warsztatu: Praktyczne doświadczenie edukacyjne

> **⚠️ STATUS WARSZTATU: Aktywny rozwój**  
> Materiały warsztatowe są obecnie tworzone i dopracowywane. Podstawowe moduły działają, ale niektóre zaawansowane sekcje są jeszcze nieukończone. Aktywnie pracujemy nad ukończeniem całej zawartości. [Śledź postęp →](workshop/README.md)

### Interaktywne materiały warsztatowe
**Kompleksowa nauka praktyczna z narzędziami przeglądarkowymi i ćwiczeniami prowadzonymi**
Nasze materiały warsztatowe oferują ustrukturyzowane, interaktywne doświadczenie edukacyjne, które uzupełnia powyższy program oparty na rozdziałach. Warsztat został zaprojektowany zarówno do nauki we własnym tempie, jak i na sesjach prowadzonych przez instruktora.

#### 🛠️ Funkcje warsztatu
- **Interfejs przeglądarkowy**: Kompletny warsztat oparty na MkDocs z funkcjami wyszukiwania, kopiowania i motywów
- **Integracja z GitHub Codespaces**: Konfiguracja środowiska programistycznego jednym kliknięciem
- **Ustrukturyzowana ścieżka nauki**: 8 modułów z ćwiczeniami prowadzonymi (łącznie 3-4 godziny)
- **Metodyka progresywna**: Wprowadzenie → Wybór → Walidacja → Dekonstrukcja → Konfiguracja → Personalizacja → Zakończenie → Podsumowanie
- **Interaktywne środowisko DevContainer**: Wstępnie skonfigurowane narzędzia i zależności

#### 📚 Struktura modułów warsztatu
Warsztat opiera się na **8-modułowej metodyce progresywnej**, która prowadzi od odkrycia do mistrzostwa w wdrażaniu:

| Moduł | Temat | Co zrobisz | Czas trwania |
|-------|-------|------------|--------------|
| **0. Wprowadzenie** | Przegląd warsztatu | Poznasz cele nauki, wymagania wstępne i strukturę warsztatu | 15 min |
| **1. Wybór** | Odkrywanie szablonów | Poznasz szablony AZD i wybierzesz odpowiedni szablon AI do swojego scenariusza | 20 min |
| **2. Walidacja** | Wdrażanie i weryfikacja | Uruchomisz szablon poleceniem `azd up` i zweryfikujesz działanie infrastruktury | 30 min |
| **3. Dekonstrukcja** | Poznanie struktury | Skorzystasz z GitHub Copilot, aby zbadać architekturę szablonu, pliki Bicep i organizację kodu | 30 min |
| **4. Konfiguracja** | Głębokie zanurzenie w azure.yaml | Opanujesz konfigurację pliku `azure.yaml`, haki cyklu życia i zmienne środowiskowe | 30 min |
| **5. Personalizacja** | Spersonalizuj projekt | Włączysz wyszukiwanie AI, śledzenie, ocenę i dostosujesz do swojego scenariusza | 45 min |
| **6. Zakończenie** | Sprzątanie | Bezpiecznie usuniesz zasoby poleceniem `azd down --purge` | 15 min |
| **7. Podsumowanie** | Kolejne kroki | Podsumujesz osiągnięcia, kluczowe koncepcje i kontynuujesz naukę | 15 min |

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
Uczestnicy po ukończeniu warsztatu będą potrafili:  
- **Wdrażać produkcyjne aplikacje AI**: Korzystać z AZD z usługami Microsoft Foundry  
- **Opanować architektury wieloagentowe**: Wdrożyć skoordynowane rozwiązania agentów AI  
- **Stosować najlepsze praktyki w zakresie bezpieczeństwa**: Konfigurować uwierzytelnianie i kontrolę dostępu  
- **Optymalizować skalowanie**: Projektować wydajne i kosztowo efektywne wdrożenia  
- **Rozwiązywać problemy z wdrażaniem**: Samodzielnie diagnozować i usuwać typowe błędy  

#### 📖 Zasoby warsztatowe  
- **🎥 Interaktywny przewodnik**: [Workshop Materials](workshop/README.md) - środowisko nauki w przeglądarce  
- **📋 Instrukcje moduł po module**:  
  - [0. Wprowadzenie](workshop/docs/instructions/0-Introduction.md) - Przegląd warsztatu i cele  
  - [1. Wybór](workshop/docs/instructions/1-Select-AI-Template.md) - Znajdowanie i wybór szablonów AI  
  - [2. Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) - Wdrażanie i weryfikacja szablonów  
  - [3. Dekonstrukcja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Badanie architektury szablonu  
  - [4. Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) - Opanowanie pliku azure.yaml  
  - [5. Personalizacja](workshop/docs/instructions/5-Customize-AI-Template.md) - Dostosowanie do scenariusza  
  - [6. Zakończenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Czyszczenie zasobów  
  - [7. Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) - Podsumowanie i kolejne kroki  
- **🛠️ Laboratorium warsztatowe AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - ćwiczenia skoncentrowane na AI  
- **💡 Szybki start**: [Workshop Setup Guide](workshop/README.md#quick-start) - konfiguracja środowiska  

**Idealne dla**: szkoleń korporacyjnych, kursów uniwersyteckich, samodzielnej nauki oraz bootcampów dla programistów.  

---

## 📖 Głębokie zanurzenie: możliwości AZD  

Poza podstawami, AZD oferuje potężne funkcje dla produkcyjnych wdrożeń:  

- **Wdrożenia oparte na szablonach** - korzystaj z gotowych szablonów dla popularnych wzorców aplikacji  
- **Infrastruktura jako kod** - zarządzaj zasobami Azure przy użyciu Bicep lub Terraform  
- **Zintegrowane przepływy pracy** - bezproblemowe provisionowanie, wdrażanie i monitoring aplikacji  
- **Przyjazne dla programistów** - zoptymalizowane pod kątem produktywności i wygody developera  

### **AZD + Microsoft Foundry: idealne do wdrożeń AI**  

**Dlaczego AZD dla rozwiązań AI?** AZD odpowiada na największe wyzwania programistów AI:  

- **Szablony gotowe na AI** - wstępnie skonfigurowane szablony do Azure OpenAI, Cognitive Services i obciążeń ML  
- **Bezpieczne wdrożenia AI** - wbudowane wzorce bezpieczeństwa dla usług AI, kluczy API i endpointów modeli  
- **Wzorce produkcyjne AI** - najlepsze praktyki skalowalnych i opłacalnych wdrożeń AI  
- **Kompleksowe przepływy AI** - od rozwoju modelu po produkcyjne wdrożenie z odpowiednim monitoringiem  
- **Optymalizacja kosztów** - inteligentne przydzielanie zasobów i skalowanie dla obciążeń AI  
- **Integracja Microsoft Foundry** - płynne połączenie z katalogiem modeli i punktami końcowymi Microsoft Foundry  

---

## 🎯 Biblioteka szablonów i przykładów  

### Polecane: szablony Microsoft Foundry  
**Zacznij tutaj, jeśli wdrażasz aplikacje AI!**  

> **Uwaga:** Te szablony demonstrują różne wzorce AI. Niektóre to zewnętrzne próbki Azure, inne lokalne implementacje.  

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
**Szablony aplikacji gotowe do produkcji, przypisane do rozdziałów nauki**  

| Szablon | Rozdział nauki | Złożoność | Kluczowa nauka |
|---------|----------------|-----------|---------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | Podstawowe wzorce wdrożeń AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | Implementacja RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Rozdział 4 | ⭐⭐ | Integracja Inteligencji Dokumentów |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | Framework agentów i wywoływanie funkcji |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐ | Orkiestracja AI przedsiębiorstwa |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | Architektura wieloagentowa z agentami Customer i Inventory |

### Nauka poprzez typ przykładu  

> **📌 Lokalne a zewnętrzne przykłady:**  
> **Lokalne przykłady** (w tym repozytorium) = gotowe do natychmiastowego użycia  
> **Zewnętrzne przykłady** (Azure Samples) = klonuj z powiązanych repozytoriów  

#### Lokalne przykłady (gotowe do użycia)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) – Kompletny, produkcyjny projekt z szablonami ARM  
  - Architektura wieloagentowa (agenci Customer + Inventory)  
  - Kompleksowy monitoring i ewaluacja  
  - Wdrażanie jednym kliknięciem przez szablon ARM  

#### Lokalne przykłady – aplikacje kontenerowe (rozdziały 2-5)  
**Kompleksowe przykłady wdrożeń kontenerowych w tym repozytorium:**  
- [**Przykłady aplikacji kontenerowych**](examples/container-app/README.md) – Kompletny przewodnik po wdrożeniach kontenerowych  
  - [Proste API Flask](../../examples/container-app/simple-flask-api) – Podstawowe REST API ze skalowaniem do zera  
  - [Architektura mikrousług](../../examples/container-app/microservices) – Produkcyjne wdrożenie wieloserwisowe  
  - Wzorce szybkiego startu, produkcji i zaawansowane  
  - Porady dotyczące monitoringu, bezpieczeństwa i optymalizacji kosztów  

#### Zewnętrzne przykłady – proste aplikacje (rozdziały 1-2)  
**Sklonuj te repozytoria Azure Samples, aby zacząć:**  
- [Prosta aplikacja webowa – Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) – podstawowe wzorce wdrożeń  
- [Strona statyczna – React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) – wdrażanie statycznej zawartości  
- [Aplikacja kontenerowa – Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) – wdrożenie REST API  

#### Zewnętrzne przykłady – integracja baz danych (rozdziały 3-4)  
- [Aplikacja bazodanowa – C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) – wzorce łączenia z bazą danych  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) – bezserwerowy przepływ danych  

#### Zewnętrzne przykłady – zaawansowane wzorce (rozdziały 4-8)  
- [Mikrousługi w Javie](https://github.com/Azure-Samples/java-microservices-aca-lab) – architektury multi-serwisowe  
- [Zadania aplikacji kontenerowych](https://github.com/Azure-Samples/container-apps-jobs) – przetwarzanie w tle  
- [Produkcja ML w przedsiębiorstwie](https://github.com/Azure-Samples/mlops-v2) – produkcyjne wzorce ML  

### Kolekcje szablonów zewnętrznych  
- [**Oficjalna galeria szablonów AZD**](https://azure.github.io/awesome-azd/) – wyselekcjonowana kolekcja szablonów oficjalnych i społecznościowych  
- [**Szablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) – dokumentacja szablonów Microsoft Learn  
- [**Katalog przykładów**](examples/README.md) – lokalne przykłady naukowe z wyjaśnieniami  

---

## 📚 Zasoby edukacyjne i odniesienia  

### Szybkie odniesienia  
- [**Cheat Sheet poleceń**](resources/cheat-sheet.md) – ważne polecenia azd zorganizowane wg rozdziałów  
- [**Słownik**](resources/glossary.md) – terminologia Azure i azd  
- [**FAQ**](resources/faq.md) – najczęściej zadawane pytania wg rozdziałów  
- [**Przewodnik nauki**](resources/study-guide.md) – obszerny zestaw ćwiczeń  

### Warsztaty praktyczne  
- [**Laboratorium warsztatowe AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) – jak uczynić rozwiązania AI wdrażalnymi przez AZD (2-3 godziny)  
- [**Interaktywny warsztat**](workshop/README.md) – 8-modułowe ćwiczenia prowadzone z MkDocs i GitHub Codespaces  
  - Kolejność: Wprowadzenie → Wybór → Walidacja → Dekonstrukcja → Konfiguracja → Personalizacja → Zakończenie → Podsumowanie  

### Zewnętrzne zasoby edukacyjne  
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Status Azure](https://status.azure.com/)  

---

## 🔧 Szybki przewodnik rozwiązywania problemów  

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Wyświetl dostępne subskrypcje
az account list --output table

# Ustaw subskrypcję domyślną
az account set --subscription "<subscription-id-or-name>"

# Ustaw dla środowiska AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Zweryfikuj
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Wypróbuj inny region Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Lub użyj mniejszych SKU podczas rozwoju
# Edytuj infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# Opcja 1: Wyczyść i spróbuj ponownie
azd down --force --purge
azd up

# Opcja 2: Po prostu napraw infrastrukturę
azd provision

# Opcja 3: Sprawdź szczegółowy status
azd show

# Opcja 4: Sprawdź logi w Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Uwierzytelnianie nie powiodło się" lub "Token wygasł"</strong></summary>

```bash
# Ponowna autoryzacja
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
# AZD generuje unikalne nazwy, ale jeśli wystąpi konflikt:
azd down --force --purge

# Następnie spróbuj ponownie z nowym środowiskiem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Rozmieszczanie szablonu trwa zbyt długo</strong></summary>

**Normlany czas oczekiwania:**
- Prosta aplikacja webowa: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (prowizjonowanie OpenAI jest wolne)

```bash
# Sprawdź postęp
azd show

# Jeśli utkniesz >30 minut, sprawdź portal Azure:
azd monitor
# Szukaj nieudanych wdrożeń
```
</details>

<details>
<summary><strong>❌ "Brak uprawnień" lub "Odmowa dostępu"</strong></summary>

```bash
# Sprawdź swoją rolę w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrzebujesz co najmniej roli "Współtwórca"
# Poproś administratora Azure o przyznanie:
# - Współtwórca (dla zasobów)
# - Administrator dostępu użytkowników (dla przypisywania ról)
```
</details>

<details>
<summary><strong>❌ Nie można znaleźć adresu URL wdrożonej aplikacji</strong></summary>

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

- **Przewodnik po typowych problemach:** [Szczegółowe rozwiązania](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemy specyficzne dla AI:** [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Przewodnik debugowania:** [Debugowanie krok po kroku](docs/chapter-07-troubleshooting/debugging.md)
- **Uzyskaj pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukończenie kursu i certyfikacja

### Śledzenie postępów
Śledź swoje postępy nauki w poszczególnych rozdziałach:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój z myślą o AI ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Wieloagentowe rozwiązania AI ✅
- [ ] **Rozdział 6**: Walidacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Produkcyjne wzorce i wzorce korporacyjne ✅

### Weryfikacja nauki
Po ukończeniu każdego rozdziału zweryfikuj swoją wiedzę poprzez:
1. **Ćwiczenie praktyczne**: Zrealizuj praktyczne wdrożenie z rozdziału
2. **Sprawdzenie wiedzy**: Przejrzyj sekcję FAQ dla danego rozdziału
3. **Dyskusja w społeczności**: Podziel się swoimi doświadczeniami na Azure Discord
4. **Następny rozdział**: Przejdź do następnego poziomu trudności

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów będziesz mieć:
- **Doświadczenie produkcyjne**: Wdrożone prawdziwe aplikacje AI w Azure
- **Umiejętności zawodowe**: Zdolność do wdrożeń na poziomie korporacyjnym  
- **Uznanie w społeczności**: Aktywny członek społeczności programistów Azure
- **Rozwój kariery**: Poszukiwane kompetencje w AZD i wdrażaniu AI

---

## 🤝 Społeczność i wsparcie

### Uzyskaj pomoc i wsparcie
- **Problemy techniczne**: [Zgłaszaj błędy i proś o funkcje](https://github.com/microsoft/azd-for-beginners/issues)
- **Pytania dotyczące nauki**: [Społeczność Microsoft Azure Discord](https://discord.gg/microsoft-azure) oraz [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specyficzna dla AI**: Dołącz do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacja**: [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wgląd społecznościowy z Microsoft Foundry Discord

**Najnowsze wyniki ankiety z kanału #Azure:**
- **45%** deweloperów chce używać AZD dla zadań AI
- **Główne wyzwania:** Wdrażanie wielu usług, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najczęściej proszone:** Szablony specyficzne dla AI, przewodniki rozwiązywania problemów, najlepsze praktyki

**Dołącz do naszej społeczności, aby:**
- Dzielić się doświadczeniami z AZD + AI i otrzymywać pomoc
- Uzyskać wczesny dostęp do nowych szablonów AI
- Współtworzyć najlepsze praktyki wdrażania AI
- Wpływać na przyszłe funkcje AI + AZD

### Wkład w kurs
Zapraszamy do współpracy! Prosimy o zapoznanie się z naszym [Przewodnikiem dla współtwórców](CONTRIBUTING.md), który zawiera szczegóły dotyczące:
- **Usprawnienia treści**: Ulepszanie istniejących rozdziałów i przykładów
- **Nowe przykłady**: Dodawanie realistycznych scenariuszy i szablonów  
- **Tłumaczenia**: Pomoc w utrzymaniu wsparcia wielojęzycznego
- **Zgłaszanie błędów**: Poprawianie dokładności i jasności
- **Standardy społeczności**: Przestrzeganie naszych inkluzywnych zasad społeczności

---

## 📄 Informacje o kursie

### Licencja
Ten projekt jest objęty licencją MIT — zobacz plik [LICENSE](../../LICENSE) po więcej informacji.

### Powiązane zasoby edukacyjne Microsoft

Nasz zespół tworzy także inne kompleksowe kursy edukacyjne:

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
[![AI Agents dla początkujących](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

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
[![Copilot dla AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot dla C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Nawigacja kursu

**🚀 Gotowy, by zacząć naukę?**

**Początkujący**: Zacznij od [Rozdział 1: Podstawy i szybki start](../..)  

**Deweloperzy AI**: Przejdź do [Rozdziału 2: Rozwój skoncentrowany na AI](../..)  
**Doświadczeni deweloperzy**: Zacznij od [Rozdziału 3: Konfiguracja i uwierzytelnianie](../..)

**Następne kroki**: [Rozpocznij Rozdział 1 - Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->