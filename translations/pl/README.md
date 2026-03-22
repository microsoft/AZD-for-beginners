# AZD dla Początkujących: Ustrukturyzowana Podróż Nauki

![AZD-for-beginners](../../translated_images/pl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatyczne Tłumaczenia (Zawsze Aktualne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](./README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Wolisz Sklonować Lokalnie?**
>
> To repozytorium zawiera ponad 50 tłumaczeń językowych, co znacząco zwiększa rozmiar pobieranego pliku. Aby sklonować bez tłumaczeń, użyj sparse checkout:
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
> Dzięki temu pobierzesz wszystko, czego potrzebujesz, aby ukończyć kurs, znacznie szybciej.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co nowego dziś w azd

Azure Developer CLI rozwinął się poza tradycyjne aplikacje webowe i API. Obecnie azd to jedyne narzędzie do wdrażania **dowolnej** aplikacji na Azure — w tym aplikacji opartych na AI i inteligentnych agentów.

Co to oznacza dla Ciebie:

- **Agenci AI są teraz pełnoprawnymi obciążeniami azd.** Możesz inicjalizować, wdrażać i zarządzać projektami agentów AI za pomocą tego samego workflow `azd init` → `azd up`, które już znasz.
- **Integracja Microsoft Foundry** umożliwia wdrażanie modeli, hostowanie agentów oraz konfigurację usług AI bezpośrednio w ekosystemie szablonów azd.
- **Podstawowy workflow nie uległ zmianie.** Niezależnie od tego, czy wdrażasz aplikację todo, mikroserwis, czy rozwiązanie AI z wieloma agentami, polecenia pozostają takie same.

Jeśli już używałeś azd, wsparcie dla AI to naturalne rozszerzenie — nie osobne narzędzie ani zaawansowany tryb. Jeśli zaczynasz od zera, nauczysz się jednego workflow, które działa dla wszystkiego.

---

## 🚀 Czym jest Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** to przyjazne dla programistów narzędzie wiersza poleceń, które upraszcza wdrażanie aplikacji na Azure. Zamiast ręcznego tworzenia i łączenia dziesiątek zasobów Azure, możesz wdrożyć całą aplikację jednym poleceniem.

### Magia `azd up`

```bash
# To pojedyncze polecenie robi wszystko:
# ✅ Tworzy wszystkie zasoby Azure
# ✅ Konfiguruje sieć i zabezpieczenia
# ✅ Buduje kod twojej aplikacji
# ✅ Wdraża do Azure
# ✅ Daje ci działający adres URL
azd up
```

**I to wszystko!** Bez klikania w Azure Portal, bez nauki skomplikowanych szablonów ARM, bez ręcznej konfiguracji — po prostu działające aplikacje na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Jaka jest różnica?

To najczęściej zadawane pytanie przez początkujących. Oto prosta odpowiedź:

| Cecha | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cel** | Zarządzanie pojedynczymi zasobami Azure | Wdrażanie kompletnych aplikacji |
| **Podejście** | Skoncentrowane na infrastrukturze | Skoncentrowane na aplikacji |
| **Przykład** | `az webapp create --name myapp...` | `azd up` |
| **Krzywa nauki** | Musisz znać usługi Azure | Wystarczy znać swoją aplikację |
| **Najlepsze dla** | DevOps, infrastruktura | Programiści, prototypowanie |

### Prosta analogia

- **Azure CLI** jest jak posiadanie wszystkich narzędzi do budowy domu — młotki, piły, gwoździe. Możesz zbudować cokolwiek, ale musisz znać się na budownictwie.
- **Azure Developer CLI** jest jak zatrudnienie wykonawcy — opisujesz, czego chcesz, a on zajmuje się budową.

### Kiedy używać którego?

| Sytuacja | Użyj tego |
|----------|-----------|
| "Chcę szybko wdrożyć moją aplikację webową" | `azd up` |
| "Potrzebuję tylko utworzyć konto storage" | `az storage account create` |
| "Buduję pełną aplikację AI" | `azd init --template azure-search-openai-demo` |
| "Muszę debugować konkretny zasób Azure" | `az resource show` |
| "Chcę wdrożenie produkcyjne w kilka minut" | `azd up --environment production` |

### Działają razem!

AZD używa Azure CLI pod maską. Możesz korzystać z obu jednocześnie:
```bash
# Wdróż swoją aplikację za pomocą AZD
azd up

# Następnie dopracuj konkretne zasoby za pomocą Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Znajdź szablony w Awesome AZD

Nie zaczynaj od zera! **Awesome AZD** to społecznościowa kolekcja gotowych do wdrożenia szablonów:

| Zasób | Opis |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Przeglądaj ponad 200 szablonów z wdrożeniem jednym kliknięciem |
| 🔗 [**Prześlij szablon**](https://github.com/Azure/awesome-azd/issues) | Dodaj własny szablon do społeczności |
| 🔗 [**Repozytorium GitHub**](https://github.com/Azure/awesome-azd) | Oceniaj i eksploruj źródła |

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
# Zainicjalizuj z szablonu
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

Ten kurs jest zaprojektowany jako **nauka stopniowa** — zacznij tam, gdzie czujesz się komfortowo, i idź dalej:

| Twoje doświadczenie | Zacznij tutaj |
|-----------------|------------|
| **Całkowicie nowy w Azure** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Znasz Azure, nowy w AZD** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Chcesz wdrażać aplikacje AI** | [Rozdział 2: Rozwój AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcesz praktyki praktycznej** | [🎓 Interaktywny warsztat](workshop/README.md) - 3-4 godziny prowadzonego laboratorium |
| **Potrzebujesz wzorców produkcyjnych** | [Rozdział 8: Produkcja i przedsiębiorstwo](#-chapter-8-production--enterprise-patterns) |

### Szybka konfiguracja

1. **Zrób fork tego repozytorium**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj je**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Uzyskaj pomoc**: [Społeczność Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Wolisz Sklonować Lokalnie?**

> To repozytorium zawiera ponad 50 tłumaczeń językowych, co znacząco zwiększa rozmiar pobieranego pliku. Aby sklonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dzięki temu pobierzesz wszystko, czego potrzebujesz, aby ukończyć kurs, znacznie szybciej.


## Przegląd kursu

Opanuj Azure Developer CLI (azd) dzięki ustrukturyzowanym rozdziałom zaprojektowanym do stopniowej nauki. **Szczególny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla współczesnych programistów

Na podstawie analiza społeczności Microsoft Foundry Discord, **45% programistów chce używać AZD do obciążeń AI**, ale napotyka trudności związane z:
- Złożonymi architekturami AI opartymi na wielu usługach
- Najlepszymi praktykami wdrażania AI produkcyjnego  
- Integracją i konfiguracją usług Azure AI
- Optymalizacją kosztów dla obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

### Cele nauki

Po ukończeniu tego ustrukturyzowanego kursu będziesz potrafił:
- **Opanować podstawy AZD**: Kluczowe pojęcia, instalacja i konfiguracja
- **Wdrażać aplikacje AI**: Używać AZD z usługami Microsoft Foundry
- **Implementować infrastrukturę jako kod**: Zarządzać zasobami Azure za pomocą szablonów Bicep
- **Rozwiązywać problemy z wdrożeniami**: Naprawiać powszechne błędy i debugować problemy
- **Optymalizować do produkcji**: Bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Budować rozwiązania z wieloma agentami**: Wdrażać złożone architektury AI

## 🗺️ Mapa kursu: Szybka nawigacja wg rozdziałów

Każdy rozdział ma własny plik README z celami nauki, szybkimi startami i ćwiczeniami:

| Rozdział | Temat | Lekcje | Czas | Złożoność |
|---------|-------|---------|----------|------------|
| **[Rozdział 1: Podstawy](docs/chapter-01-foundation/README.md)** | Rozpoczęcie | [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacja](docs/chapter-01-foundation/installation.md) &#124; [Pierwszy projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Rozdział 2: Rozwój AI](docs/chapter-02-ai-development/README.md)** | Aplikacje AI-First | [Integracja Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agent AI](docs/chapter-02-ai-development/agents.md) &#124; [Wdrożenie modeli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsztat](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 godziny | ⭐⭐ |
| **[Rozdział 3: Konfiguracja](docs/chapter-03-configuration/README.md)** | Uwierzytelnianie i Bezpieczeństwo | [Konfiguracja](docs/chapter-03-configuration/configuration.md) &#124; [Uwierzytelnianie i bezpieczeństwo](docs/chapter-03-configuration/authsecurity.md) | 45-60 minut | ⭐⭐ |
| **[Rozdział 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i Wdrożenie | [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 godziny | ⭐⭐⭐ |
| **[Rozdział 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Rozwiązania AI Agentów | [Scenariusz detaliczny](examples/retail-scenario.md) &#124; [Wzorce koordynacji](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 godziny | ⭐⭐⭐⭐ |
| **[Rozdział 6: Przed-wdrożeniem](docs/chapter-06-pre-deployment/README.md)** | Planowanie i walidacja | [Kontrole przed lotem](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 godzina | ⭐⭐ |
| **[Rozdział 7: Rozwiązywanie problemów](docs/chapter-07-troubleshooting/README.md)** | Debugowanie i naprawa | [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugowanie](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemy AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 godziny | ⭐⭐ |
| **[Rozdział 8: Produkcja](docs/chapter-08-production/README.md)** | Wzorce przedsiębiorcze | [Praktyki produkcyjne](docs/chapter-08-production/production-ai-practices.md) | 2-3 godziny | ⭐⭐⭐⭐ |
| **[🎓 Warsztat](workshop/README.md)** | Laboratorium praktyczne | [Wprowadzenie](workshop/docs/instructions/0-Introduction.md) &#124; [Wybór](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Weryfikacja](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukcja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaż](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 godziny | ⭐⭐ |

**Całkowity czas kursu:** ~10-14 godzin | **Postęp umiejętności:** Początkujący → Gotowy do produkcji

---

## 📚 Rozdziały do nauki

*Wybierz ścieżkę nauki na podstawie poziomu doświadczenia i celów*

### 🚀 Rozdział 1: Podstawy i szybki start
**Wymagania wstępne**: Subskrypcja Azure, podstawowa znajomość linii poleceń  
**Czas trwania**: 30-45 minut  
**Poziom trudności**: ⭐

#### Czego się nauczysz
- Podstawy Azure Developer CLI
- Instalacja AZD na Twojej platformie
- Pierwsze udane wdrożenie

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Co to jest Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) - Podstawowe pojęcia i terminologia
- **⚙️ Konfiguracja**: [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md) - Przewodniki dla platform
- **🛠️ Praktyka**: [Twój pierwszy projekt](docs/chapter-01-foundation/first-project.md) - Krok po kroku
- **📋 Szybkie odniesienie**: [Skrócony przewodnik po poleceniach](resources/cheat-sheet.md)

#### Ćwiczenia praktyczne
```bash
# Szybka kontrola instalacji
azd version

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up
```

**💡 Efekt rozdziału**: Pomyślnie wdrożenie prostej aplikacji webowej w Azure za pomocą AZD

**✅ Kryterium sukcesu:**
```bash
# Po ukończeniu Rozdziału 1 powinieneś umieć:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża do Azure
azd show                # Wyświetla URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Usuwa zasoby
```

**📊 Czas inwestycji:** 30-45 minut  
**📈 Poziom umiejętności po:** Potrafi samodzielnie wdrażać podstawowe aplikacje

---

### 🤖 Rozdział 2: Rozwój AI-First (zalecany dla deweloperów AI)
**Wymagania wstępne**: Ukończony rozdział 1  
**Czas trwania**: 1-2 godziny  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji zasilanych AI
- Konfiguracja usług AI

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Integracja Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenci AI**: [Przewodnik agentów AI](docs/chapter-02-ai-development/agents.md) - Wdrażaj inteligentnych agentów za pomocą AZD
- **📖 Wzorce**: [Wdrożenie modeli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Wdrażaj i zarządzaj modelami AI
- **🛠️ Warsztat**: [Laboratorium warsztatowe AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Przygotuj rozwiązania AI do AZD
- **🎥 Przewodnik interaktywny**: [Materiały warsztatowe](workshop/README.md) - Nauka przeglądarkowa z MkDocs * Środowisko DevContainer
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

**💡 Efekt rozdziału**: Wdrożenie i konfiguracja aplikacji do chatowania opartej na AI z funkcjami RAG

**✅ Kryterium sukcesu:**
```bash
# Po rozdziale 2 powinieneś umieć:
azd init --template azure-search-openai-demo
azd up
# Przetestować interfejs czatu AI
# Zadawać pytania i otrzymywać odpowiedzi oparte na AI wraz ze źródłami
# Zweryfikować, czy integracja wyszukiwania działa
azd monitor  # Sprawdzić, czy Application Insights pokazuje telemetrię
azd down --force --purge
```

**📊 Czas inwestycji:** 1-2 godziny  
**📈 Poziom umiejętności po:** Potrafi wdrażać i konfigurować aplikacje AI gotowe do produkcji  
**💰 Świadomość kosztów:** Zrozumienie kosztów rozwoju $80-150/miesiąc, oraz produkcji $300-3500/miesiąc

#### 💰 Rozważania kosztowe dla wdrożeń AI

**Środowisko developerskie (szacunkowo $80-150/miesiąc):**
- Modele Microsoft Foundry (płacisz za użycie): $0-50/miesiąc (w zależności od zużycia tokenów)
- AI Search (podstawowy poziom): $75/miesiąc
- Container Apps (konsumpcyjne): $0-20/miesiąc
- Przechowywanie (standard): $1-5/miesiąc

**Środowisko produkcyjne (szacunkowo $300-3500+/miesiąc):**
- Modele Microsoft Foundry (PTU dla stałej wydajności): $3000+/miesiąc LUB model płatności za użycie przy dużej ilości zapytań
- AI Search (standardowy poziom): $250/miesiąc
- Container Apps (dedykowane): $50-100/miesiąc
- Application Insights: $5-50/miesiąc
- Przechowywanie (premium): $10-50/miesiąc

**💡 Wskazówki optymalizacji kosztów:**
- Korzystaj z modeli Microsoft Foundry z **bezpłatnego poziomu** do nauki (Azure OpenAI 50 000 tokenów/miesiąc wliczone)
- Uruchamiaj `azd down` aby zwolnić zasoby gdy nie rozwijasz aktywnie
- Zacznij od rozliczeń według zużycia, PTU włącz tylko na produkcję
- Użyj `azd provision --preview` by oszacować koszty przed wdrożeniem
- Włącz automatyczne skalowanie: płać tylko za faktyczne użycie

**Monitorowanie kosztów:**
```bash
# Sprawdź szacunkowe miesięczne koszty
azd provision --preview

# Monitoruj rzeczywiste koszty w Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie
**Wymagania wstępne**: Ukończony rozdział 1  
**Czas trwania**: 45-60 minut  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskami
- Najlepsze praktyki uwierzytelniania i bezpieczeństwa
- Nazewnictwo i organizacja zasobów

#### Materiały do nauki
- **📖 Konfiguracja**: [Przewodnik konfiguracji](docs/chapter-03-configuration/configuration.md) - Konfiguracja środowiska
- **🔐 Bezpieczeństwo**: [Wzorce uwierzytelniania i tożsamość zarządzana](docs/chapter-03-configuration/authsecurity.md) - Wzorce uwierzytelniania
- **📝 Przykłady**: [Przykład aplikacji bazodanowej](examples/database-app/README.md) - Przykłady baz danych AZD

#### Ćwiczenia praktyczne
- Konfiguracja wielu środowisk (dev, staging, prod)
- Ustawienie uwierzytelniania tożsamości zarządzanej
- Implementacja konfiguracji specyficznych dla środowisk

**💡 Efekt rozdziału**: Zarządzanie wieloma środowiskami z odpowiednim uwierzytelnianiem i bezpieczeństwem

---

### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenie
**Wymagania wstępne**: Ukończone rozdziały 1-3  
**Czas trwania**: 1-1.5 godziny  
**Poziom trudności**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeń
- Infrastruktura jako kod przy użyciu Bicep
- Strategie provisioning zasobów

#### Materiały do nauki
- **📖 Wdrożenie**: [Przewodnik wdrożenia](docs/chapter-04-infrastructure/deployment-guide.md) - Kompleksowe workflow
- **🏗️ Provisioning**: [Provisioning zasobów](docs/chapter-04-infrastructure/provisioning.md) - Zarządzanie zasobami Azure
- **📝 Przykłady**: [Przykład Container App](../../examples/container-app) - Wdrożenia konteneryzowane

#### Ćwiczenia praktyczne
- Twórz własne szablony Bicep
- Wdrażaj aplikacje z wieloma usługami
- Implementuj strategie wdrożeń blue-green

**💡 Efekt rozdziału**: Wdrożenie złożonych aplikacji wielousługowych z użyciem własnych szablonów infrastruktury

---

### 🎯 Rozdział 5: Rozwiązania multi-agent AI (zaawansowany)
**Wymagania wstępne**: Ukończone rozdziały 1-2  
**Czas trwania**: 2-3 godziny  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury multi-agent
- Orkiestracja i koordynacja agentów
- Wdrożenia AI gotowe do produkcji

#### Materiały do nauki
- **🤖 Projekt wyróżniony**: [Rozwiązanie multi-agent detaliczne](examples/retail-scenario.md) - Kompletny projekt
- **🛠️ Szablony ARM**: [Pakiet szablonów ARM multi-agent](../../examples/retail-multiagent-arm-template) - Wdrożenie jednym kliknięciem
- **📖 Architektura**: [Wzorce koordynacji multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Wzorce

#### Ćwiczenia praktyczne
```bash
# Wdróż kompletne rozwiązanie wieloagentowe dla handlu detalicznego
cd examples/retail-multiagent-arm-template
./deploy.sh

# Zbadaj konfiguracje agentów
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Efekt rozdziału**: Wdroż i zarządzaj produkcyjnym rozwiązaniem multi-agent AI z agentami Obsługi Klienta i Zarządzania Zapasami

---

### 🔍 Rozdział 6: Walidacja i planowanie przed wdrożeniem
**Wymagania wstępne**: Ukończony rozdział 4  
**Czas trwania**: 1 godzina  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Planowanie pojemności i walidacja zasobów
- Strategie wyboru SKU
- Kontrole przed wdrożeniem i automatyzacja

#### Materiały do nauki
- **📊 Planowanie**: [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) - Walidacja zasobów
- **💰 Wybór**: [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Kosztowo efektywne opcje
- **✅ Walidacja**: [Kontrole przed wdrożeniem](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrypty automatyczne

#### Ćwiczenia praktyczne
- Uruchamiaj skrypty walidacji pojemności
- Optymalizuj wybory SKU pod kątem kosztów
- Wdrażaj automatyczne kontrole przed wdrożeniem

**💡 Efekt rozdziału**: Waliduj i optymalizuj wdrożenia przed realizacją

---

### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie
**Wymagania wstępne**: Ukończony dowolny rozdział wdrożeniowy  
**Czas trwania**: 1-1.5 godziny  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Systematyczne podejścia do debugowania
- Typowe problemy i ich rozwiązania
- Rozwiązywanie problemów specyficznych dla AI

#### Materiały do nauki
- **🔧 Typowe problemy**: [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rozwiązania
- **🕵️ Debugowanie**: [Przewodnik debugowania](docs/chapter-07-troubleshooting/debugging.md) - Strategie krok po kroku
- **🤖 Problemy AI**: [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemy związane z usługami AI

#### Ćwiczenia praktyczne
- Diagnozuj błędy wdrożenia
- Rozwiązuj problemy z uwierzytelnianiem
- Debuguj połączenia usług AI

**💡 Efekt rozdziału**: Samodzielne diagnozowanie i rozwiązywanie typowych problemów wdrożeniowych

---

### 🏢 Rozdział 8: Produkcja i wzorce przedsiębiorcze
**Wymagania wstępne**: Ukończone rozdziały 1-4  
**Czas trwania**: 2-3 godziny  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Wzorce bezpieczeństwa dla przedsiębiorstw
- Monitorowanie i optymalizacja kosztów

#### Materiały do nauki
- **🏭 Produkcja**: [Najlepsze praktyki AI w produkcji](docs/chapter-08-production/production-ai-practices.md) - Wzorce korporacyjne  
- **📝 Przykłady**: [Przykład mikroserwisów](../../examples/microservices) - Złożone architektury  
- **📊 Monitorowanie**: [Integracja z Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorowanie  

#### Ćwiczenia praktyczne
- Wdrażanie wzorców bezpieczeństwa korporacyjnego  
- Konfiguracja kompleksowego monitorowania  
- Wdrażanie do produkcji z odpowiednim zarządzaniem  

**💡 Rezultat rozdziału**: Wdrażanie aplikacji gotowych do produkcji z pełną funkcjonalnością produkcyjną  

---

## 🎓 Przegląd warsztatu: doświadczenie praktyczne

> **⚠️ STATUS WARSZTATU: Aktywny rozwój**  
> Materiały warsztatowe są aktualnie opracowywane i udoskonalane. Podstawowe moduły działają, ale niektóre zaawansowane sekcje są niekompletne. Intensywnie pracujemy nad ukończeniem całej zawartości. [Śledź postępy →](workshop/README.md)  

### Interaktywne materiały warsztatowe  
**Kompleksowe, praktyczne nauczanie z narzędziami przeglądarkowymi i ćwiczeniami prowadzonymi**

Nasze materiały warsztatowe oferują uporządkowaną, interaktywną naukę uzupełniającą powyższy plan rozdziałów. Warsztat jest zaprojektowany zarówno do nauki we własnym tempie, jak i sesji prowadzonych przez instruktora.

#### 🛠️ Funkcje warsztatu  
- **Interfejs przeglądarkowy**: kompletny warsztat oparty na MkDocs z wyszukiwaniem, kopiowaniem i motywami  
- **Integracja z GitHub Codespaces**: konfiguracja środowiska programistycznego jednym kliknięciem  
- **Struktura nauki**: 8 modułów ćwiczeń prowadzonych (3-4 godziny łącznie)  
- **Metodologia postępująca**: Wprowadzenie → Wybór → Walidacja → Rozbiórka → Konfiguracja → Personalizacja → Zakończenie → Podsumowanie  
- **Interaktywne środowisko DevContainer**: narzędzia i zależności prekonfigurowane  

#### 📚 Struktura modułów warsztatu  
Warsztat opiera się na **8-modułowej metodologii postępującej**, która prowadzi od odkrycia do mistrzostwa w wdrażaniu:

| Moduł | Temat | Co zrobisz | Czas trwania |
|-------|--------|------------|--------------|
| **0. Wprowadzenie** | Przegląd warsztatu | Poznanie celów nauki, wymagań i struktury warsztatu | 15 min |
| **1. Wybór** | Odkrywanie szablonów | Eksploracja szablonów AZD i wybór odpowiedniego szablonu AI dla scenariusza | 20 min |
| **2. Walidacja** | Wdrażanie i weryfikacja | Wdrożenie szablonu za pomocą `azd up` i sprawdzenie działania infrastruktury | 30 min |
| **3. Rozbiórka** | Zrozumienie struktury | Użycie GitHub Copilot do badania architektury szablonu, plików Bicep i organizacji kodu | 30 min |
| **4. Konfiguracja** | Szczegóły azure.yaml | Opanowanie konfiguracji `azure.yaml`, haków cyklu życia i zmiennych środowiskowych | 30 min |
| **5. Personalizacja** | Dostosuj do siebie | Włączenie AI Search, śledzenia, ewaluacji i personalizacja do scenariusza | 45 min |
| **6. Zakończenie** | Sprzątanie | Bezpieczne usuwanie zasobów za pomocą `azd down --purge` | 15 min |
| **7. Podsumowanie** | Kolejne kroki | Przegląd osiągnięć, kluczowych koncepcji i dalsza nauka | 15 min |

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

# Opcja 2: Rozwój lokalny
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postępuj zgodnie z instrukcjami instalacji w workshop/README.md
```
  
#### 🎯 Rezultaty nauki warsztatu  
Po ukończeniu warsztatu uczestnicy będą:  
- **Wdrażać aplikacje AI do produkcji**: Korzystać z AZD oraz usług Microsoft Foundry  
- **Opanować architektury wieloagentowe**: Implementować skoordynowane rozwiązania agentów AI  
- **Stosować najlepsze praktyki bezpieczeństwa**: Konfigurować uwierzytelnianie i kontrolę dostępu  
- **Optymalizować skalowanie**: Projektować wdrożenia efektywne kosztowo i wydajne  
- **Rozwiązywać problemy z wdrożeniami**: Samodzielnie diagnozować i naprawiać typowe problemy  

#### 📖 Materiały warsztatowe  
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) - środowisko nauki w przeglądarce  
- **📋 Instrukcje moduł po module**:  
  - [0. Wprowadzenie](workshop/docs/instructions/0-Introduction.md) - przegląd i cele warsztatu  
  - [1. Wybór](workshop/docs/instructions/1-Select-AI-Template.md) - znajdowanie i wybór szablonów AI  
  - [2. Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) - wdrażanie i sprawdzanie szablonów  
  - [3. Rozbiórka](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - analiza architektury szablonu  
  - [4. Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) - opanowanie azure.yaml  
  - [5. Personalizacja](workshop/docs/instructions/5-Customize-AI-Template.md) - dostosowanie do scenariusza  
  - [6. Zakończenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - sprzątanie zasobów  
  - [7. Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) - przegląd i kolejne kroki  
- **🛠️ Laboratorium AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - ćwiczenia skoncentrowane na AI  
- **💡 Szybki start**: [Przewodnik konfiguracji warsztatu](workshop/README.md#quick-start) - konfiguracja środowiska  

**Idealne dla**: szkoleń korporacyjnych, kursów uniwersyteckich, nauki we własnym tempie i bootcampów programistycznych.  

---

## 📖 Głębokie zanurzenie: możliwości AZD

Poza podstawami, AZD oferuje potężne funkcje do wdrożeń produkcyjnych:

- **Wdrożenia oparte na szablonach** - używanie gotowych szablonów dla typowych wzorców aplikacji  
- **Infrastruktura jako kod** - zarządzanie zasobami Azure za pomocą Bicep lub Terraform  
- **Zintegrowane przepływy pracy** - płynne tworzenie, wdrażanie i monitorowanie aplikacji  
- **Przyjazne dla programisty** - zoptymalizowane pod kątem produktywności i komfortu programisty  

### **AZD + Microsoft Foundry: idealne do wdrożeń AI**

**Dlaczego AZD dla rozwiązań AI?** AZD odpowiada na główne wyzwania twórców AI:

- **Szablony AI Ready** - prekonfigurowane szablony dla modeli Microsoft Foundry, Cognitive Services i obciążeń ML  
- **Bezpieczne wdrożenia AI** - wbudowane wzorce bezpieczeństwa dla usług AI, kluczy API i punktów końcowych modeli  
- **Wzorce produkcyjne AI** - najlepsze praktyki skalowalnych, opłacalnych wdrożeń aplikacji AI  
- **Pełen przepływ AI** - od tworzenia modelu do wdrożenia produkcyjnego z monitorowaniem  
- **Optymalizacja kosztów** - inteligentne alokowanie zasobów i strategie skalowania dla obciążeń AI  
- **Integracja Microsoft Foundry** - płynne połączenie z katalogiem i punktami końcowymi modeli Foundry  

---

## 🎯 Biblioteka szablonów i przykładów

### Polecane: szablony Microsoft Foundry  
**Zacznij tutaj, gdy wdrażasz aplikacje AI!**

> **Uwaga:** Te szablony pokazują różne wzorce AI. Niektóre pochodzą z Azure Samples, inne są implementacjami lokalnymi.  

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
**Szablony aplikacji gotowe do produkcji powiązane z rozdziałami nauki**

| Szablon | Rozdział nauki | Złożoność | Kluczowa nauka |
|---------|----------------|-----------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | Podstawowe wzorce wdrożeń AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | Implementacja RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Rozdział 4 | ⭐⭐ | Integracja inteligencji dokumentów |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | Framework agentów i wywoływanie funkcji |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐ | Orkiestracja AI dla przedsiębiorstwa |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | Architektura wieloagentowa z agentami Klienta i Magazynu |

### Nauka poprzez typ przykładów  

> **📌 Przykłady lokalne vs. zewnętrzne:**  
> **Przykłady lokalne** (w tym repozytorium) = gotowe do natychmiastowego użycia  
> **Przykłady zewnętrzne** (Azure Samples) = klonowanie z powiązanych repozytoriów  

#### Przykłady lokalne (gotowe do użycia)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - kompletna produkcyjna implementacja z szablonami ARM  
  - architektura wieloagentowa (agenci Klienta + Magazynu)  
  - pełne monitorowanie i ewaluacja  
  - wdrożenie jednym kliknięciem przez szablon ARM  

#### Przykłady lokalne - aplikacje kontenerowe (rozdziały 2-5)  
**Kompleksowe przykłady wdrożeń kontenerowych w repozytorium:**  
- [**Przykłady Container App**](examples/container-app/README.md) - pełny przewodnik wdrożeń konteneryzowanych  
  - [Prosty API Flask](../../examples/container-app/simple-flask-api) - podstawowe REST API z automatycznym skalowaniem do zera  
  - [Architektura mikroserwisów](../../examples/container-app/microservices) - produkcyjne wdrożenie wielousługowe  
  - Wzorce szybkiego startu, produkcji i zaawansowane  
  - Wskazówki dotyczące monitorowania, bezpieczeństwa i optymalizacji kosztów  

#### Przykłady zewnętrzne - proste aplikacje (rozdziały 1-2)  
**Klonuj te repozytoria Azure Samples, aby rozpocząć:**  
- [Prosta aplikacja webowa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - podstawowe wzorce wdrożenia  
- [Statyczna strona - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - wdrożenie statycznej zawartości  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - wdrożenie API REST  

#### Przykłady zewnętrzne - integracja z bazą danych (rozdziały 3-4)  
- [Aplikacja bazodanowa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - wzorce łączności z bazą danych  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - bezserwerowe przepływy danych  

#### Przykłady zewnętrzne - zaawansowane wzorce (rozdziały 4-8)  
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - architektury wielousługowe  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - przetwarzanie w tle  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - produkcyjne wzorce ML  

### Zewnętrzne kolekcje szablonów  
- [**Oficjalna galeria szablonów AZD**](https://azure.github.io/awesome-azd/) - wyselekcjonowana kolekcja szablonów oficjalnych i społecznościowych  
- [**Szablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - dokumentacja Microsoft Learn szablonów  
- [**Katalog przykładów**](examples/README.md) - lokalne przykłady nauki z szczegółowymi wyjaśnieniami  

---

## 📚 Zasoby edukacyjne i odniesienia

### Szybkie odniesienia  
- [**Skrócony przewodnik komend**](resources/cheat-sheet.md) - najważniejsze polecenia azd zorganizowane według rozdziałów  
- [**Słownik pojęć**](resources/glossary.md) - terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - najczęściej zadawane pytania według rozdziałów nauki  
- [**Przewodnik po ćwiczeniach**](resources/study-guide.md) - kompleksowe ćwiczenia praktyczne  

### Warsztaty praktyczne  
- [**Laboratorium AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - uczynienie rozwiązań AI wdrożalnymi za pomocą AZD (2-3 godziny)  
- [**Interaktywny warsztat**](workshop/README.md) - 8 modułów prowadzonych ćwiczeń z użyciem MkDocs i GitHub Codespaces  
  - schemat: Wprowadzenie → Wybór → Walidacja → Rozbiórka → Konfiguracja → Personalizacja → Zakończenie → Podsumowanie  

### Zewnętrzne zasoby edukacyjne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Umiejętności agenta AI dla Twojego edytora
- [**Umiejętności Microsoft Azure na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otwartych umiejętności agenta dla Azure AI, Foundry, wdrożeń, diagnostyki, optymalizacji kosztów i więcej. Zainstaluj je w GitHub Copilot, Cursor, Claude Code lub dowolnym obsługiwanym agencie:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Szybki przewodnik rozwiązywania problemów

**Typowe problemy początkujących i natychmiastowe rozwiązania:**

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
# Wypróbuj inny region Azure
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
<summary><strong>❌ "azd up" nie powodzi się w połowie procesu</strong></summary>

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
<summary><strong>❌ "Resource already exists" lub konflikty nazw</strong></summary>

```bash
# AZD generuje unikalne nazwy, ale jeśli wystąpi konflikt:
azd down --force --purge

# Następnie ponów próbę z nowym środowiskiem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Wdrażanie szablonu zajmuje za dużo czasu</strong></summary>

**Normalny czas oczekiwania:**
- Prosta aplikacja webowa: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (prowizjonowanie OpenAI jest wolne)

```bash
# Sprawdź postęp
azd show

# Jeśli utkniesz na ponad 30 minut, sprawdź portal Azure:
azd monitor
# Szukaj nieudanych wdrożeń
```
</details>

<details>
<summary><strong>❌ "Permission denied" lub "Forbidden"</strong></summary>

```bash
# Sprawdź swoją rolę Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrzebujesz co najmniej roli "Współtwórcy"
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

- **Przewodnik po typowych problemach:** [Szczegółowe rozwiązania](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemy specyficzne dla AI:** [Rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Przewodnik debugowania:** [Debugowanie krok po kroku](docs/chapter-07-troubleshooting/debugging.md)
- **Uzyskaj pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukończenie kursu i certyfikacja

### Śledzenie postępów
Śledź swoje postępy w nauce przez kolejne rozdziały:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój z nastawieniem na AI ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Rozwiązania AI wieloagentowe ✅
- [ ] **Rozdział 6**: Weryfikacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Wzorce produkcyjne i korporacyjne ✅

### Weryfikacja nauki
Po ukończeniu każdego rozdziału sprawdź swoją wiedzę poprzez:
1. **Ćwiczenie praktyczne**: Ukończenie wdrożenia z rozdziału
2. **Sprawdzenie wiedzy**: Przejrzenie sekcji FAQ dla rozdziału
3. **Dyskusje w społeczności**: Podziel się doświadczeniem na Azure Discord
4. **Następny rozdział**: Przejdź do następnego poziomu zaawansowania

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów będziesz mieć:
- **Doświadczenie produkcyjne**: Wdrożone rzeczywiste aplikacje AI w Azure
- **Umiejętności zawodowe**: Gotowość do wdrożeń korporacyjnych  
- **Uznanie w społeczności**: Aktywny członek społeczności deweloperów Azure
- **Awans zawodowy**: Poszukiwane kompetencje AZD i wdrażania AI

---

## 🤝 Społeczność i wsparcie

### Uzyskaj pomoc i wsparcie
- **Problemy techniczne**: [Zgłaszaj błędy i prośby o funkcje](https://github.com/microsoft/azd-for-beginners/issues)
- **Pytania dotyczące nauki**: [Społeczność Microsoft Azure Discord](https://discord.gg/microsoft-azure) oraz [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specyficzna dla AI**: Dołącz do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacja**: [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wgląd społeczności z Microsoft Foundry Discord

**Najnowsze wyniki ankiety z kanału #Azure:**
- **45%** deweloperów chce używać AZD do zadań AI
- **Główne wyzwania**: wdrożenia wieloserwisowe, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najczęściej proszone o**: szablony specyficzne dla AI, przewodniki rozwiązywania problemów, najlepsze praktyki

**Dołącz do naszej społeczności, aby:**
- Podzielić się doświadczeniami z AZD + AI i uzyskać pomoc
- Uzyskać wczesny dostęp do nowych szablonów AI
- Współtworzyć najlepsze praktyki wdrożeniowe AI
- Wpływać na przyszły rozwój funkcji AI + AZD

### Wkład w kurs
Zapraszamy do współpracy! Przeczytaj nasz [Przewodnik dla współtwórców](CONTRIBUTING.md) aby dowiedzieć się więcej o:
- **Ulepszaniu treści**: Rozwijanie istniejących rozdziałów i przykładów
- **Nowych przykładach**: Dodawanie scenariuszy i szablonów z życia wziętych  
- **Tłumaczeniach**: Pomoc w utrzymaniu wsparcia wielojęzycznego
- **Zgłoszeniach błędów**: Poprawianie dokładności i jasności
- **Standardach społeczności**: Przestrzeganie naszych inkluzywnych wytycznych społeczności

---

## 📄 Informacje o kursie

### Licencja
Projekt jest licencjonowany na podstawie licencji MIT - zobacz plik [LICENSE](../../LICENSE) po szczegóły.

### Powiązane zasoby edukacyjne Microsoft

Nasz zespół tworzy także inne kompleksowe kursy:

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
 
### Seria Generatywnej AI
[![Generatywna AI dla początkujących](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Podstawowe nauczanie
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

**🚀 Gotowy, by zacząć naukę?**

**Początkujący**: Zacznij od [Rozdział 1: Podstawy & Szybki start](#-chapter-1-foundation--quick-start)  
**Deweloperzy AI**: Przejdź do [Rozdział 2: Rozwój z myślą o AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Doświadczeni deweloperzy**: Rozpocznij od [Rozdział 3: Konfiguracja & Uwierzytelnianie](#️-chapter-3-configuration--authentication)

**Kolejne kroki**: [Rozpocznij Rozdział 1 - Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uważany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->