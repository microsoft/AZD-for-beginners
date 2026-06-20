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
[Arabski](../ar/README.md) | [Bengalski](../bn/README.md) | [Bułgarski](../bg/README.md) | [Birmański (Myanmar)](../my/README.md) | [Chiński (uproszczony)](../zh-CN/README.md) | [Chiński (tradycyjny, Hongkong)](../zh-HK/README.md) | [Chiński (tradycyjny, Makau)](../zh-MO/README.md) | [Chiński (tradycyjny, Tajwan)](../zh-TW/README.md) | [Chorwacki](../hr/README.md) | [Czeski](../cs/README.md) | [Duński](../da/README.md) | [Holenderski](../nl/README.md) | [Estoński](../et/README.md) | [Fiński](../fi/README.md) | [Francuski](../fr/README.md) | [Niemiecki](../de/README.md) | [Grecki](../el/README.md) | [Hebrajski](../he/README.md) | [Hindi](../hi/README.md) | [Węgierski](../hu/README.md) | [Indonezyjski](../id/README.md) | [Włoski](../it/README.md) | [Japoński](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreański](../ko/README.md) | [Litewski](../lt/README.md) | [Malajski](../ms/README.md) | [Malajalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Nigerski Pidgin](../pcm/README.md) | [Norweski](../no/README.md) | [Perski (Farsi)](../fa/README.md) | [Polski](./README.md) | [Portugalski (Brazylia)](../pt-BR/README.md) | [Portugalski (Portugalia)](../pt-PT/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Rumuński](../ro/README.md) | [Rosyjski](../ru/README.md) | [Serbski (Cyrylica)](../sr/README.md) | [Słowacki](../sk/README.md) | [Słoweński](../sl/README.md) | [Hiszpański](../es/README.md) | [Suahili](../sw/README.md) | [Szwedzki](../sv/README.md) | [Tagalog (Filipiński)](../tl/README.md) | [Tamilski](../ta/README.md) | [Telugu](../te/README.md) | [Tajski](../th/README.md) | [Turecki](../tr/README.md) | [Ukraiński](../uk/README.md) | [Urdu](../ur/README.md) | [Wietnamski](../vi/README.md)

> **Wolisz sklonować lokalnie?**
>
> To repozytorium zawiera ponad 50 tłumaczeń, co znacznie zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
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

## 🆕 Co nowego w azd dzisiaj

> 📌 Ten kurs jest zweryfikowany pod kątem **`azd 1.25.6`** (czerwiec 2026). Uruchom `azd version`, aby sprawdzić swoją wersję i `azd upgrade`, aby pobrać najnowszą.

Azure Developer CLI rozwinął się poza tradycyjne aplikacje webowe i API. Dziś azd to jedyne narzędzie do wdrażania **dowolnej** aplikacji w Azure — w tym aplikacji zasilanych AI i inteligentnych agentów.

Co to oznacza dla Ciebie:

- **Agenci AI to teraz pierwszorzędne obciążenia azd.** Możesz inicjalizować, wdrażać i zarządzać projektami agentów AI używając tego samego przepływu `azd init` → `azd up`, który już znasz.
- **Kompletny cykl życia agenta z poziomu CLI.** Rozszerzenie `azure.ai.agents` obejmuje całą drogę — `azd ai agent init` do tworzenia szkieletu, `azd ai agent invoke` do testów (z wyświetlaniem czasu odpowiedzi), `azd ai agent eval generate` i `azd ai agent optimize` do pomiaru i poprawy jakości oraz `azd ai agent delete` do czyszczenia.
- **Więcej bloków budulcowych AI.** Nowe rozszerzenia w wersji zapoznawczej — `azure.ai.skills` i `azure.ai.connections` — pozwalają zarządzać ponownie używanymi umiejętnościami agenta i połączeniami Foundry bezpośrednio za pomocą azd.
- **Integracja z Microsoft Foundry** dostarcza wdrażania modeli, hostingu agentów i konfiguracji usług AI bezpośrednio w ekosystemu szablonów azd.
- **Płynniejsze podstawy codziennego użycia.** Ostatnie wydania uczyniły `azd init` idempotentnym (bezpiecznym do ponownego uruchamiania), wymuszały automatyczne czyszczenie przestarzałych tokenów w `azd auth login` oraz dodały przyjazny monit pierwszego uruchomienia `azd tool`.
- **Podstawowy przepływ pracy się nie zmienił.** Niezależnie czy wdrażasz aplikację todo, mikroserwis, czy wieloagentowe rozwiązanie AI, polecenia pozostają takie same.

> **Uwaga dla użytkowników Aspire:** Microsoft od teraz nazywa produkt po prostu **Aspire** (wcześniej ".NET Aspire"). Wsparcie azd dla Aspire pozostaje niezmienione — jedynie nazwa została zaktualizowana.

Jeśli korzystałeś z azd wcześniej, wsparcie AI to naturalne rozszerzenie — nie osobne narzędzie ani zaawansowany tryb. Jeśli zaczynasz od zera, nauczysz się jednego przepływu, który działa ze wszystkim.

---

## 🚀 Czym jest Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** to przyjazne dla programisty narzędzie wiersza poleceń, które upraszcza wdrażanie aplikacji w Azure. Zamiast ręcznie tworzyć i łączyć dziesiątki zasobów Azure, możesz wdrożyć całą aplikację jednym poleceniem.

### Magia `azd up`

```bash
# To pojedyncze polecenie robi wszystko:
# ✅ Tworzy wszystkie zasoby Azure
# ✅ Konfiguruje sieć i zabezpieczenia
# ✅ Buduje kod twojej aplikacji
# ✅ Wdraża do Azure
# ✅ Daje działający adres URL
azd up
```

**To wszystko!** Żadnego klikania w Azure Portal, żadnych skomplikowanych szablonów ARM do nauki, żadnej ręcznej konfiguracji — tylko działające aplikacje w Azure.

---

## ❓ Azure Developer CLI a Azure CLI: Jaka jest różnica?

To najczęstsze pytanie początkujących. Oto prosta odpowiedź:

| Funkcja | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Cel** | Zarządzanie pojedynczymi zasobami Azure | Wdrażanie kompletnej aplikacji |
| **Podejście** | Skoncentrowane na infrastrukturze | Skoncentrowane na aplikacji |
| **Przykład** | `az webapp create --name myapp...` | `azd up` |
| **Krzywa nauki** | Musisz znać usługi Azure | Wystarczy znać swoją aplikację |
| **Najlepsze dla** | DevOps, infrastruktura | Programiści, prototypowanie |

### Prosta analogia

- **Azure CLI** to jak mieć wszystkie narzędzia do budowy domu — młotki, piły, gwoździe. Możesz zbudować wszystko, ale musisz znać budownictwo.
- **Azure Developer CLI** to jak zatrudnienie generalnego wykonawcy — opisujesz, co chcesz, a oni zajmują się budową.

### Kiedy używać którego

| Scenariusz | Użyj tego |
|------------|-----------|
| „Chcę szybko wdrożyć aplikację webową” | `azd up` |
| „Potrzebuję tylko utworzyć konto magazynu” | `az storage account create` |
| „Buduję pełną aplikację AI” | `azd init --template azure-search-openai-demo` |
| „Muszę debugować konkretny zasób Azure” | `az resource show` |
| „Chcę wdrożenie produkcyjne w kilka minut” | `azd up --environment production` |

### Działają razem!

AZD korzysta z Azure CLI „pod maską”. Możesz używać obu:
```bash
# Wdróż swoją aplikację za pomocą AZD
azd up

# Następnie dostosuj konkretne zasoby za pomocą Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Znajdź szablony w Awesome AZD

Nie zaczynaj od zera! **Awesome AZD** to społecznościowa kolekcja gotowych do wdrożenia szablonów:

| Zasób | Opis |
|-------|-------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Przeglądaj 200+ szablonów z możliwością wdrożenia jednym kliknięciem |
| 🔗 [**Dodaj szablon**](https://github.com/Azure/awesome-azd/issues) | Dodaj swój własny szablon do społeczności |
| 🔗 [**Repozytorium GitHub**](https://github.com/Azure/awesome-azd) | Oznacz gwiazdką i przeglądaj kod źródłowy |

### Popularne szablony AI z Awesome AZD

```bash
# RAG czat z modelami Microsoft Foundry i wyszukiwaniem AI
azd init --template azure-search-openai-demo

# Szybka aplikacja do czatu AI
azd init --template openai-chat-app-quickstart

# Agenci AI z agentami Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Zacznij w 3 krokach

Przed rozpoczęciem upewnij się, że Twoja maszyna jest gotowa do szablonu, który chcesz wdrożyć:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jeśli którykolwiek wymóg nie zostanie spełniony, napraw go najpierw, a następnie kontynuuj szybkie rozpoczęcie.

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

Jeśli nie jesteś pewien, którego potrzebujesz, przejdź cały proces instalacji w [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Wdróż swoją pierwszą aplikację

```bash
# Zainicjalizuj z szablonu
azd init --template todo-nodejs-mongo

# Wdróż do Azure (tworzy wszystko!)
azd up
```

**🎉 To wszystko!** Twoja aplikacja jest teraz dostępna w Azure.

### Sprzątanie (nie zapomnij!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak korzystać z tego kursu

Ten kurs jest zaprojektowany do **stopniowej nauki** — zacznij tam, gdzie czujesz się komfortowo i postępuj dalej:

| Twoje doświadczenie | Zacznij tutaj |
|---------------------|---------------|
| **Nowy w Azure** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Znasz Azure, nowy w AZD** | [Rozdział 1: Podstawy](#-chapter-1-foundation--quick-start) |
| **Chcesz wdrażać aplikacje AI** | [Rozdział 2: Rozwój skoncentrowany na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcesz praktycznych ćwiczeń** | [🎓 Warsztat interaktywny](workshop/README.md) - 3-4 godziny prowadzonych ćwiczeń |
| **Potrzebujesz wzorców produkcyjnych** | [Rozdział 8: Produkcja i przedsiębiorstwo](#-chapter-8-production--enterprise-patterns) |

### Szybka konfiguracja

1. **Zrób fork tego repozytorium**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj je**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Uzyskaj pomoc**: [Społeczność Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Wolisz sklonować lokalnie?**

> To repozytorium zawiera ponad 50 tłumaczeń, co znacznie zwiększa rozmiar pobierania. Aby sklonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To zapewnia wszystko, czego potrzebujesz, aby ukończyć kurs, z dużo szybszym pobieraniem.


## Przegląd kursu

Opanuj Azure Developer CLI (azd) poprzez ustrukturyzowane rozdziały zaprojektowane do stopniowej nauki. **Szczególny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**
### Dlaczego ten kurs jest niezbędny dla współczesnych programistów

Na podstawie informacji z społeczności Microsoft Foundry Discord, **45% programistów chce używać AZD do obciążeń AI**, ale napotyka wyzwania związane z:
- Złożonymi architekturami AI opartymi na wielu usługach
- Najlepszymi praktykami wdrażania AI w produkcji  
- Integracją i konfiguracją usług Azure AI
- Optymalizacją kosztów dla obciążeń AI
- Rozwiązywaniem specyficznych problemów wdrożeniowych AI

### Cele nauki

Po ukończeniu tego usystematyzowanego kursu:
- **Opanujesz podstawy AZD**: Kluczowe koncepcje, instalacja i konfiguracja
- **Będziesz wdrażać aplikacje AI**: Używając AZD z usługami Microsoft Foundry
- **Wdrożysz Infrastrukturę jako kod**: Zarządzanie zasobami Azure za pomocą szablonów Bicep
- **Rozwiążesz problemy wdrożeniowe**: Identyfikacja i debugowanie typowych problemów
- **Optymalizujesz środowisko produkcyjne**: Bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Zbudujesz rozwiązania multi-agentowe**: Wdrażanie złożonych architektur AI

## Zanim zaczniesz: konta, dostęp i założenia

Zanim rozpoczniesz rozdział 1, upewnij się, że masz następujące elementy przygotowane. Kroki instalacyjne w dalszej części przewodnika zakładają, że te podstawy zostały już spełnione.

- **Subskrypcja Azure**: Możesz użyć istniejącej subskrypcji z pracy lub własnego konta albo utworzyć [darmową wersję próbną](https://aka.ms/azurefreetrial) do rozpoczęcia nauki.
- **Uprawnienia do tworzenia zasobów Azure**: Do większości ćwiczeń potrzebujesz co najmniej dostępu **Contributor** do wybranej subskrypcji lub grupy zasobów. Niektóre rozdziały zakładają też możliwość tworzenia grup zasobów, zarządzanych tożsamości i przydziałów RBAC.
- [**Konto GitHub**](https://github.com): Przydatne do forka repozytorium, śledzenia własnych zmian i korzystania z GitHub Codespaces podczas warsztatów.
- **Wymagania środowiskowe dla szablonów**: Niektóre szablony wymagają lokalnych narzędzi, takich jak Node.js, Python, Java lub Docker. Uruchom walidator konfiguracji przed rozpoczęciem, by wcześnie wykryć braki narzędzi.
- **Podstawowa znajomość terminala**: Nie musisz być ekspertem, ale powinieneś być wygodny z uruchamianiem komend takich jak `git clone`, `azd auth login` i `azd up`.

> **Pracujesz w subskrypcji firmowej?**  
> Jeśli Twoje środowisko Azure jest zarządzane przez administratora, wcześniej potwierdź, czy możesz wdrażać zasoby w subskrypcji lub grupie zasobów, które planujesz używać. Jeśli nie, poproś o subskrypcję sandbox lub dostęp Contributor przed rozpoczęciem.

> **Jesteś nowy w Azure?**  
> Zacznij od własnej wersji próbnej lub subskrypcji płatnej za użycie pod adresem https://aka.ms/azurefreetrial, aby móc wykonać ćwiczenia od początku do końca bez oczekiwania na zatwierdzenia na poziomie najemcy.

## 🗺️ Mapa kursu: szybka nawigacja po rozdziałach

Każdy rozdział ma dedykowany plik README z celami nauki, szybkim startem i ćwiczeniami:

| Rozdział | Temat | Lekcje | Czas trwania | Złożoność |
|---------|-------|---------|----------|------------|
| **[Rozdział 1: Podstawy](docs/chapter-01-foundation/README.md)** | Pierwsze kroki | [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacja](docs/chapter-01-foundation/installation.md) &#124; [Pierwszy projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Rozdział 2: Rozwój AI](docs/chapter-02-ai-development/README.md)** | Aplikacje AI | [Integracja Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenci AI](docs/chapter-02-ai-development/agents.md) &#124; [Wdrażanie modeli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsztat](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 godz. | ⭐⭐ |
| **[Rozdział 3: Konfiguracja](docs/chapter-03-configuration/README.md)** | Uwierzytelnianie i bezpieczeństwo | [Konfiguracja](docs/chapter-03-configuration/configuration.md) &#124; [Uwierzytelnianie i bezpieczeństwo](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Rozdział 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i wdrażanie | [Przewodnik wdrożeniowy](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 godz. | ⭐⭐⭐ |
| **[Rozdział 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Rozwiązania agentowe AI | [Scenariusz Retail](examples/retail-scenario.md) &#124; [Wzorce koordynacji](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 godz. | ⭐⭐⭐⭐ |
| **[Rozdział 6: Przed wdrożeniem](docs/chapter-06-pre-deployment/README.md)** | Planowanie i walidacja | [Kontrole wstępne](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 godz. | ⭐⭐ |
| **[Rozdział 7: Rozwiązywanie problemów](docs/chapter-07-troubleshooting/README.md)** | Debugowanie i naprawa | [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugowanie](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemy AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 godz. | ⭐⭐ |
| **[Rozdział 8: Produkcja](docs/chapter-08-production/README.md)** | Wzorce korporacyjne | [Praktyki produkcyjne](docs/chapter-08-production/production-ai-practices.md) | 2-3 godz. | ⭐⭐⭐⭐ |
| **[🎓 Warsztat](workshop/README.md)** | Ćwiczenia praktyczne | [Wprowadzenie](workshop/docs/instructions/0-Introduction.md) &#124; [Wybór](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Analiza](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaż](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 godz. | ⭐⭐ |

**Całkowity czas kursu:** ~10-14 godzin | **Postęp umiejętności:** Początkujący → Gotowy na produkcję

---

## 📚 Rozdziały do nauki

*Wybierz ścieżkę nauki zgodnie z poziomem doświadczenia i celami*

### 🚀 Rozdział 1: Podstawy i szybki start  
**Wymagania wstępne**: subskrypcja Azure, podstawowa znajomość pracy w terminalu  
**Czas trwania**: 30-45 minut  
**Złożoność**: ⭐

#### Czego się nauczysz
- Zrozumienie podstaw Azure Developer CLI
- Instalacja AZD na Twojej platformie
- Pierwsze udane wdrożenie

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Czym jest Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) - Kluczowe koncepcje i terminologia
- **⚙️ Instalacja**: [Instalacja i konfiguracja](docs/chapter-01-foundation/installation.md) - Poradniki dla konkretnej platformy
- **🛠️ Praktyka**: [Twój pierwszy projekt](docs/chapter-01-foundation/first-project.md) - Tutorial krok po kroku
- **📋 Szybka ściąga**: [Karta z komendami](resources/cheat-sheet.md)

#### Ćwiczenia praktyczne  
```bash
# Szybkie sprawdzenie instalacji
azd version

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Efekt rozdziału**: Udane wdrożenie prostej aplikacji webowej do Azure za pomocą AZD

**✅ Potwierdzenie sukcesu:**  
```bash
# Po ukończeniu Rozdziału 1 powinieneś być w stanie:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża na Azure
azd show                # Wyświetla URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Czyści zasoby
```
  
**📊 Czas inwestycji:** 30-45 minut  
**📈 Poziom umiejętności:** Potrafi samodzielnie wdrażać podstawowe aplikacje  

---

### 🤖 Rozdział 2: Rozwój AI (zalecany dla programistów AI)  
**Wymagania wstępne**: ukończenie rozdziału 1  
**Czas trwania**: 1-2 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji wspieranych AI
- Zrozumienie konfiguracji usług AI

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Integracja Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenci AI**: [Przewodnik po agentach AI](docs/chapter-02-ai-development/agents.md) - Wdrażanie inteligentnych agentów z AZD
- **📖 Wzorce**: [Wdrażanie modeli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Zarządzanie modelami AI
- **🛠️ Warsztat**: [Laboratorium AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Przygotowanie rozwiązań AI do AZD
- **🎥 Przewodnik interaktywny**: [Materiały warsztatowe](workshop/README.md) - Nauka w przeglądarce z MkDocs * Środowisko DevContainer
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
  
**💡 Efekt rozdziału**: Wdrożenie i konfiguracja aplikacji chat AI z funkcją RAG

**✅ Potwierdzenie sukcesu:**  
```bash
# Po rozdziale 2 powinieneś być w stanie:
azd init --template azure-search-openai-demo
azd up
# Testować interfejs czatu AI
# Zadawać pytania i otrzymywać odpowiedzi wspierane przez AI z źródłami
# Sprawdzić, czy integracja wyszukiwania działa
azd monitor  # Sprawdzić, czy Application Insights pokazuje telemetrię
azd down --force --purge
```
  
**📊 Czas inwestycji:** 1-2 godziny  
**📈 Poziom umiejętności:** Potrafi wdrażać i konfigurować produkcyjne aplikacje AI  
**💰 Świadomość kosztów:** Rozumie koszty deweloperskie $80-150/mies., produkcyjne $300-3500/mies.

#### 💰 Rozważania kosztowe przy wdrożeniach AI

**Środowisko deweloperskie (szacowane $80-150/mies.):**
- Modele Microsoft Foundry (Pay-as-you-go): $0-50/mies. (w zależności od tokenów)
- AI Search (poziom podstawowy): $75/mies.
- Container Apps (na żądanie): $0-20/mies.
- Storage (standardowy): $1-5/mies.

**Środowisko produkcyjne (szacowane $300-3500+/mies.):**
- Modele Microsoft Foundry (PTU dla stałej wydajności): $3000+/mies. LUB Pay-as-you-go przy dużej skali
- AI Search (standardowy poziom): $250/mies.
- Container Apps (dedykowany): $50-100/mies.
- Application Insights: $5-50/mies.
- Storage (premium): $10-50/mies.

**💡 Wskazówki optymalizacji kosztów:**
- Używaj **bezpłatnych modeli** Microsoft Foundry do nauki (Azure OpenAI 50 000 tokenów miesięcznie wliczone)
- Używaj `azd down` do deaktywacji zasobów, gdy nie pracujesz aktywnie
- Zacznij od rozliczania wg zużycia, upgradaj do PTU tylko w produkcji
- Użyj `azd provision --preview` do szacowania kosztów przed wdrożeniem
- Włącz auto-skalowanie: płacisz tylko za rzeczywiste wykorzystanie

**Monitorowanie kosztów:**  
```bash
# Sprawdź szacowane miesięczne koszty
azd provision --preview

# Monitoruj rzeczywiste koszty w Azure Portal
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie  
**Wymagania wstępne**: ukończenie rozdziału 1  
**Czas trwania**: 45-60 minut  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskami
- Najlepsze praktyki w uwierzytelnianiu i bezpieczeństwie
- Nazewnictwo i organizacja zasobów

#### Materiały do nauki
- **📖 Konfiguracja**: [Przewodnik konfiguracji](docs/chapter-03-configuration/configuration.md) - Ustawianie środowiska
- **🔐 Bezpieczeństwo**: [Wzorce uwierzytelniania i zarządzane tożsamości](docs/chapter-03-configuration/authsecurity.md)
- **📝 Przykłady**: [Przykład aplikacji bazodanowej](examples/database-app/README.md) - Przykłady zarządzania bazą danych AZD

#### Ćwiczenia praktyczne
- Konfiguracja wielu środowisk (dev, staging, prod)
- Ustawienie uwierzytelniania za pomocą zarządzanej tożsamości
- Wdrożenie konfiguracji specyficznych dla środowiska

**💡 Efekt rozdziału**: Zarządzaj wieloma środowiskami z poprawnym uwierzytelnianiem i zabezpieczeniami

---

### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrażanie  
**Wymagania wstępne**: ukończenie rozdziałów 1-3  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrażania
- Infrastruktura jako kod z Bicep
- Strategie provisioningu zasobów

#### Materiały do nauki
- **📖 Wdrażanie**: [Przewodnik wdrożeniowy](docs/chapter-04-infrastructure/deployment-guide.md) - Pełne workflowy
- **🏗️ Provisioning**: [Provisioning zasobów](docs/chapter-04-infrastructure/provisioning.md) - Zarządzanie zasobami Azure
- **📝 Przykłady**: [Przykład Container App](../../examples/container-app) - Wdrożenia w kontenerach

#### Ćwiczenia praktyczne
- Tworzenie własnych szablonów Bicep
- Wdrażanie aplikacji wielousługowych
- Implementacja strategii blue-green deployment

**💡 Efekt rozdziału**: Wdrażaj złożone aplikacje wielousługowe używając własnych szablonów infrastruktury

---
### 🎯 Rozdział 5: Rozwiązania AI wieloagentowe (zaawansowane)  
**Wymagania wstępne**: Ukończone rozdziały 1-2  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury wieloagentowej  
- Orkiestracja i koordynacja agentów  
- Produkcyjne wdrożenia AI  

#### Materiały do nauki
- **🤖 Projekt wyróżniony**: [Rozwiązanie wieloagentowe dla handlu detalicznego](examples/retail-scenario.md) - Kompletny implementacja  
- **🛠️ Szablony ARM**: [Pakiet szablonów ARM](../../examples/retail-multiagent-arm-template) - Wdrożenie za jednym kliknięciem  
- **📖 Architektura**: [Wzorce koordynacji wieloagentowej](docs/chapter-06-pre-deployment/coordination-patterns.md) - Wzorce  

#### Ćwiczenia praktyczne  
```bash
# Wdróż kompletne wieloagentowe rozwiązanie detaliczne
cd examples/retail-multiagent-arm-template
./deploy.sh

# Eksploruj konfiguracje agentów
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Efekt rozdziału**: Wdrożenie i zarządzanie produkcyjnym rozwiązaniem AI wieloagentowym z agentami Klient i Magazyn  

---

### 🔍 Rozdział 6: Walidacja i planowanie przed wdrożeniem  
**Wymagania wstępne**: Ukończony rozdział 4  
**Czas trwania**: 1 godzina  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Planowanie pojemności i walidacja zasobów  
- Strategie wyboru SKU  
- Kontrole przedwdrożeniowe i automatyzacja  

#### Materiały do nauki
- **📊 Planowanie**: [Planowanie pojemności](docs/chapter-06-pre-deployment/capacity-planning.md) - Walidacja zasobów  
- **💰 Wybór**: [Wybór SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Wydajne kosztowo decyzje  
- **✅ Walidacja**: [Kontrole przedwdrożeniowe](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatyczne skrypty  

#### Ćwiczenia praktyczne  
- Uruchom skrypty walidacji pojemności  
- Optymalizuj wybór SKU pod kątem kosztów  
- Implementuj automatyczne kontrole przed wdrożeniem  

**💡 Efekt rozdziału**: Zweryfikuj i zoptymalizuj wdrożenia przed wykonaniem  

---

### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie  
**Wymagania wstępne**: Ukończony dowolny rozdział wdrożeniowy  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Systematyczne podejścia do debugowania  
- Typowe problemy i rozwiązania  
- Rozwiązywanie problemów specyficznych dla AI  

#### Materiały do nauki
- **🔧 Typowe problemy**: [Typowe problemy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rozwiązania  
- **🕵️ Debugowanie**: [Przewodnik debugowania](docs/chapter-07-troubleshooting/debugging.md) - Strategie krok po kroku  
- **🤖 Problemy AI**: [Specyficzne rozwiązywanie problemów AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemy usług AI  

#### Ćwiczenia praktyczne  
- Diagnostyka błędów wdrożenia  
- Rozwiązywanie problemów z uwierzytelnianiem  
- Debugowanie łączności usług AI  

**💡 Efekt rozdziału**: Samodzielne diagnozowanie i rozwiązywanie typowych problemów wdrożeniowych  

---

### 🏢 Rozdział 8: Wzorce produkcyjne i korporacyjne  
**Wymagania wstępne**: Ukończone rozdziały 1-4  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych  
- Wzorce bezpieczeństwa korporacyjnego  
- Monitorowanie i optymalizacja kosztów  

#### Materiały do nauki
- **🏭 Produkcja**: [Najlepsze praktyki AI w produkcji](docs/chapter-08-production/production-ai-practices.md) - Wzorce korporacyjne  
- **📝 Przykłady**: [Przykład mikroserwisów](../../examples/microservices) - Złożone architektury  
- **📊 Monitoring**: [Integracja Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorowanie  

#### Ćwiczenia praktyczne  
- Implementacja wzorców bezpieczeństwa korporacyjnego  
- Konfiguracja kompleksowego monitoringu  
- Wdrożenie produkcyjne z właściwym zarządzaniem  

**💡 Efekt rozdziału**: Wdroż aplikacje gotowe na potrzeby produkcyjne z pełnymi możliwościami produkcyjnymi  

---

## 🎓 Przegląd warsztatów: Praktyczne doświadczenie edukacyjne

> **⚠️ STATUS WARSZTATU: Aktywny rozwój**  
> Materiały warsztatowe są obecnie opracowywane i ulepszane. Kluczowe moduły działają, ale niektóre zaawansowane sekcje są niekompletne. Intensywnie pracujemy nad ukończeniem całej zawartości. [Śledź postępy →](workshop/README.md)

### Interaktywne materiały warsztatowe  
**Kompleksowa, praktyczna nauka z narzędziami przeglądarkowymi i ćwiczeniami prowadzonymi**

Nasze materiały warsztatowe dostarczają usystematyzowane, interaktywne doświadczenie edukacyjne, które uzupełnia powyższy program rozdziałów. Warsztat został zaprojektowany zarówno do samodzielnej nauki, jak i sesji prowadzonych przez instruktora.

#### 🛠️ Cechy warsztatu  
- **Interfejs przeglądarkowy**: Kompletny warsztat wspierany przez MkDocs z wyszukiwaniem, kopiowaniem i motywami  
- **Integracja GitHub Codespaces**: Konfiguracja środowiska deweloperskiego jednym kliknięciem  
- **Usystematyzowana ścieżka nauki**: 8 modułów ćwiczeń prowadzonych (3-4 godziny łącznie)  
- **Progresywna metodologia**: Wprowadzenie → Wybór → Walidacja → Demontaż → Konfiguracja → Dostosowanie → Zakończenie → Podsumowanie  
- **Interaktywne środowisko DevContainer**: Wstępnie skonfigurowane narzędzia i zależności  

#### 📚 Struktura modułów warsztatu  
Warsztat opiera się na **8-modułowej progresywnej metodologii**, która prowadzi od odkrywania do mistrzostwa w wdrożeniach:

| Moduł | Temat | Co zrobisz | Czas trwania |
|--------|-------|------------|--------------|
| **0. Wprowadzenie** | Przegląd warsztatu | Poznasz cele nauki, wymagania wstępne i strukturę warsztatu | 15 min |
| **1. Wybór** | Odkrywanie szablonów | Poznasz szablony AZD i wybierzesz właściwy szablon AI do swojego scenariusza | 20 min |
| **2. Walidacja** | Wdroż i zweryfikuj | Wdrożysz szablon za pomocą `azd up` i zweryfikujesz działanie infrastruktury | 30 min |
| **3. Demontaż** | Poznaj strukturę | Użyjesz GitHub Copilot do eksploracji architektury szablonu, plików Bicep i organizacji kodu | 30 min |
| **4. Konfiguracja** | Głębokie zanurzenie w azure.yaml | Opanujesz konfigurację `azure.yaml`, haczyki cyklu życia i zmienne środowiskowe | 30 min |
| **5. Dostosowanie** | Uczyń go swoim | Aktywujesz AI Search, śledzenie, ocenę oraz dostosujesz do swojego scenariusza | 45 min |
| **6. Zakończenie** | Sprzątanie | Bezpiecznie usuniesz zasoby używając `azd down --purge` | 15 min |
| **7. Podsumowanie** | Następne kroki | Przejrzysz osiągnięcia, kluczowe koncepcje i kontynuujesz naukę | 15 min |

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
  
#### 🎯 Efekty nauki w warsztacie  
Po ukończeniu warsztatu uczestnicy będą potrafili:  
- **Wdrożyć produkcyjne aplikacje AI**: Używać AZD z usługami Microsoft Foundry  
- **Opanować architektury wieloagentowe**: Implementować skoordynowane rozwiązania agentów AI  
- **Wdrożyć najlepsze praktyki bezpieczeństwa**: Konfigurować uwierzytelnianie i kontrolę dostępu  
- **Optymalizować skalowalność**: Projektować wydajne i kosztowo efektywne wdrożenia  
- **Rozwiązywać problemy wdrożeniowe**: Samodzielnie naprawiać typowe problemy  

#### 📖 Materiały warsztatowe  
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) - Środowisko nauki przeglądarkowej  
- **📋 Instrukcje moduł po module**:  
  - [0. Wprowadzenie](workshop/docs/instructions/0-Introduction.md) - Przegląd i cele warsztatu  
  - [1. Wybór](workshop/docs/instructions/1-Select-AI-Template.md) - Znajdź i wybierz szablony AI  
  - [2. Walidacja](workshop/docs/instructions/2-Validate-AI-Template.md) - Wdroż i zweryfikuj szablony  
  - [3. Demontaż](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Eksploruj architekturę szablonu  
  - [4. Konfiguracja](workshop/docs/instructions/4-Configure-AI-Template.md) - Opanuj azure.yaml  
  - [5. Dostosowanie](workshop/docs/instructions/5-Customize-AI-Template.md) - Dostosuj do swojego scenariusza  
  - [6. Zakończenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Posprzątaj zasoby  
  - [7. Podsumowanie](workshop/docs/instructions/7-Wrap-up.md) - Przegląd i następne kroki  
- **🛠️ Laboratorium AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ćwiczenia skoncentrowane na AI  
- **💡 Szybki start**: [Przewodnik konfiguracji warsztatu](workshop/README.md#quick-start) - Konfiguracja środowiska  

**Idealny dla**: Szkolenia korporacyjne, kursy uniwersyteckie, nauka samodzielna i bootcampy dla programistów.  

---

## 📖 Głębokie zanurzenie: możliwości AZD

Poza podstawami, AZD oferuje potężne funkcje do wdrożeń produkcyjnych:

- **Wdrożenia oparte na szablonach** - Korzystaj z gotowych szablonów dla popularnych wzorców aplikacji  
- **Infrastruktura jako kod** - Zarządzaj zasobami Azure za pomocą Bicep lub Terraform  
- **Zintegrowane przepływy pracy** - Bezproblemowa aprowizacja, wdrożenie i monitorowanie aplikacji  
- **Przyjazne dla deweloperów** - Optymalizacja produktywności i doświadczenia dewelopera  

### **AZD + Microsoft Foundry: Idealne dla wdrożeń AI**

**Dlaczego AZD dla rozwiązań AI?** AZD adresuje najważniejsze wyzwania deweloperów AI:

- **Szablony gotowe na AI** - Wstępnie skonfigurowane szablony dla modeli Microsoft Foundry, usług Azure AI i obciążeń ML  
- **Bezpieczne wdrożenia AI** - Wbudowane wzorce bezpieczeństwa dla usług AI, kluczy API i punktów końcowych modeli  
- **Wzorce produkcyjnego AI** - Najlepsze praktyki dla skalowalnych, kosztowo efektywnych wdrożeń AI  
- **End-to-end workflow AI** - Od rozwoju modelu do wdrożenia produkcyjnego z właściwym monitorowaniem  
- **Optymalizacja kosztów** - Inteligentne zarządzanie zasobami i strategie skalowania dla obciążeń AI  
- **Integracja Microsoft Foundry** - Bezproblemowe połączenie z katalogiem modeli i punktami końcowymi Microsoft Foundry  

---

## 🎯 Biblioteka szablonów i przykładów

### Wyróżnione: Szablony Microsoft Foundry  
**Zacznij tutaj, jeśli wdrażasz aplikacje AI!**

> **Uwaga:** Te szablony demonstrują różne wzorce AI. Niektóre to zewnętrzne przykłady Azure, inne to lokalne implementacje.

| Szablon | Rozdział | Złożoność | Usługi | Typ |
|----------|----------|-----------|---------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |  
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Rozdział 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zewnętrzny |  
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zewnętrzny |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zewnętrzny |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zewnętrzny |  
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalny** |  

### Wyróżnione: Kompleksowe scenariusze nauki  
**Szablony aplikacji produkcyjnych powiązane z rozdziałami nauki**

| Szablon | Rozdział nauki | Złożoność | Kluczowa nauka |
|----------|----------------|-----------|----------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | Podstawowe wzorce wdrożeń AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | Implementacja RAG z Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Rozdział 4 | ⭐⭐ | Integracja rozpoznawania dokumentów |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | Framework agentów i wywoływanie funkcji |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐ | Orkiestracja AI w przedsiębiorstwie |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | Architektura wieloagentowa z agentami Klient i Magazyn |  

### Nauka na przykładach wg typu  

> **📌 Przykłady lokalne vs zewnętrzne:**  
> **Przykłady lokalne** (w tym repozytorium) = Gotowe do użycia od razu  
> **Przykłady zewnętrzne** (Azure Samples) = Klonuj z powiązanych repozytoriów  

#### Przykłady lokalne (gotowe do użycia)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletny, produkcyjny system z szablonami ARM  
  - Architektura wieloagentowa (agenci Klient + Magazyn)  
  - Kompleksowe monitorowanie i ocena  
  - Wdrożenie za jednym kliknięciem przez szablon ARM  

#### Przykłady lokalne - Aplikacje kontenerowe (rozdziały 2-5)  
**Kompleksowe przykłady wdrożeń kontenerowych w tym repozytorium:**  
- [**Przykłady aplikacji kontenerowych**](examples/container-app/README.md) - Kompletny przewodnik po wdrożeniach kontenerowych
  - [Proste API Flask](../../examples/container-app/simple-flask-api) - Podstawowe REST API ze skalowaniem do zera
  - [Architektura mikrousług](../../examples/container-app/microservices) - Produkcyjne wdrożenie wieloserwisowe
  - Wzorce szybkiego startu, produkcyjne i zaawansowane wdrożenia
  - Wskazówki dotyczące monitoringu, bezpieczeństwa i optymalizacji kosztów

#### Przykłady zewnętrzne - proste aplikacje (rozdziały 1-2)
**Sklonuj te repozytoria Azure Samples, aby zacząć:**
- [Prosta aplikacja webowa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Podstawowe wzorce wdrożeń
- [Statyczna strona - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Wdrożenie statycznej zawartości
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Wdrożenie REST API

#### Przykłady zewnętrzne - integracja z bazą danych (rozdziały 3-4)  
- [Aplikacja bazodanowa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Wzorce łączenia z bazą danych
- [Funkcje + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Bezserwerowy przepływ danych

#### Przykłady zewnętrzne - zaawansowane wzorce (rozdziały 4-8)
- [Mikrousługi w Javie](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury wieloserwisowe
- [Zadania Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Przetwarzanie w tle  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkcyjne wzorce ML

### Zewnętrzne kolekcje szablonów
- [**Oficjalna galeria szablonów AZD**](https://azure.github.io/awesome-azd/) - Wyselekcjonowana kolekcja oficjalnych i społecznościowych szablonów
- [**Szablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacja szablonów Microsoft Learn
- [**Katalog przykładów**](examples/README.md) - Lokalne przykłady edukacyjne z omówieniami

---

## 📚 Zasoby edukacyjne i materiały referencyjne

### Szybkie odniesienia
- [**Karta z komendami**](resources/cheat-sheet.md) - Podstawowe polecenia azd pogrupowane według rozdziałów
- [**Słownik**](resources/glossary.md) - Terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - Często zadawane pytania według rozdziałów
- [**Przewodnik nauki**](resources/study-guide.md) - Kompleksowe ćwiczenia praktyczne

### Warsztaty praktyczne
- [**Laboratorium AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Przygotuj swoje rozwiązania AI do wdrożenia AZD (2-3 godziny)
- [**Warsztat interaktywny**](workshop/README.md) - 8 modułów z przewodnikiem przy użyciu MkDocs i GitHub Codespaces
  - Kolejność: Wprowadzenie → Wybór → Weryfikacja → Dekonstrukcja → Konfiguracja → Dostrojenie → Demontaż → Podsumowanie

### Zewnętrzne źródła edukacyjne
- Dokumentacja Azure Developer CLI: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Centrum architektury Azure: https://learn.microsoft.com/en-us/azure/architecture/
- Kalkulator cen Azure: https://azure.microsoft.com/pricing/calculator/
- Status Azure: https://status.azure.com/

### Umiejętności agenta AI dla Twojego edytora
- [**Umiejętności Microsoft Azure na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otwartych umiejętności agenta dla Azure AI, Foundry, wdrożeń, diagnostyki, optymalizacji kosztów i więcej. Zainstaluj je w GitHub Copilot, Cursor, Claude Code lub dowolnym obsługiwanym agencie:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Szybki poradnik rozwiązywania problemów

**Typowe problemy początkujących i szybkie rozwiązania:**

<details>
<summary><strong>❌ "azd: command not found" (nie znaleziono polecenia azd)</strong></summary>

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
<summary><strong>❌ "No subscription found" lub "Subscription not set" (Subskrypcja nie znaleziona lub nie ustawiona)</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" lub "Quota exceeded" (Niewystarczająca kwota lub przekroczona kwota)</strong></summary>

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
<summary><strong>❌ "azd up" nie powiodło się w połowie procesu</strong></summary>

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
<summary><strong>❌ "Authentication failed" lub "Token expired" (Błąd uwierzytelniania lub token wygasł)</strong></summary>

```bash
# Ponowna autoryzacja dla AZD
azd auth logout
azd auth login

# Opcjonalnie: odśwież również Azure CLI, jeśli używasz poleceń az
az logout
az login

# Zweryfikuj uwierzytelnianie
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" lub konflikty nazw</strong></summary>

```bash
# AZD generuje unikalne nazwy, ale jeśli wystąpi konflikt:
azd down --force --purge

# Wtedy ponów próbę z nowym środowiskiem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Wdrażanie szablonu trwa zbyt długo</strong></summary>

**Typowy czas oczekiwania:**
- Prosta aplikacja webowa: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (wolne przydzielanie OpenAI)

```bash
# Sprawdź postęp
azd show

# Jeśli utkniesz na ponad 30 minut, sprawdź portal Azure:
azd monitor --overview
# Szukaj nieudanych wdrożeń
```
</details>

<details>
<summary><strong>❌ "Permission denied" lub "Forbidden" (Brak uprawnień lub zabronione)</strong></summary>

```bash
# Sprawdź swoją rolę w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrzebujesz co najmniej roli "Contributor"
# Poproś administratora Azure o nadanie:
# - Contributor (dla zasobów)
# - User Access Administrator (dla przypisań ról)
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

## 🎓 Zakończenie kursu i certyfikacja

### Śledzenie postępów
Śledź swój postęp nauki w każdym rozdziale:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój AI-first ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Wieloagentowe rozwiązania AI ✅
- [ ] **Rozdział 6**: Walidacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Produkcyjne i korporacyjne wzorce ✅

### Weryfikacja nauki
Po ukończeniu rozdziału zweryfikuj wiedzę przez:
1. **Ćwiczenie praktyczne**: Wdrożenie rozdziału
2. **Sprawdzenie wiedzy**: Przejrzenie FAQ danego rozdziału
3. **Dyskusja społecznościowa**: Podziel się doświadczeniem na Azure Discord
4. **Następny rozdział**: Przejdź do kolejnego poziomu zaawansowania

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów zyskasz:
- **Doświadczenie produkcyjne**: Wdrożenie rzeczywistych aplikacji AI w Azure
- **Umiejętności zawodowe**: Gotowość do wdrożeń korporacyjnych  
- **Uznanie społeczności**: Aktywny członek społeczności programistów Azure
- **Rozwój kariery**: Popyt na ekspertów AZD i AI w wdrożeniach

---

## 🤝 Społeczność i wsparcie

### Uzyskaj pomoc i wsparcie
- **Problemy techniczne:** [Zgłaszanie błędów i żądania funkcji](https://github.com/microsoft/azd-for-beginners/issues)
- **Pytania dot. nauki:** [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) oraz [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specyficzna dla AI:** Dołącz do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacja:** [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wnioski społeczności z Microsoft Foundry Discord

**Najnowsze wyniki ankiety z kanału #Azure:**
- **45%** programistów chce używać AZD do obciążeń AI
- **Główne wyzwania:** wdrożenia wieloserwisowe, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najczęściej wymagane:** szablony specyficzne dla AI, przewodniki rozwiązywania problemów, najlepsze praktyki

**Dołącz do naszej społeczności, aby:**
- Dzielenie się doświadczeniem z AZD + AI i uzyskanie pomocy
- Dostęp do wczesnych wersji nowych szablonów AI
- Współtworzenie najlepszych praktyk wdrożeń AI
- Wpływ na przyszły rozwój funkcji AI + AZD

### Wkład w kurs
Zapraszamy do współpracy! Proszę przeczytać nasz [Przewodnik po współudziale](CONTRIBUTING.md) w celu szczegółów:
- **Ulepszenia treści:** Rozwijaj obecne rozdziały i przykłady
- **Nowe przykłady:** Dodaj scenariusze i szablony z rzeczywistego świata  
- **Tłumaczenia:** Pomóż utrzymać wsparcie wielojęzyczne
- **Zgłaszanie błędów:** Popraw dokładność i klarowność
- **Standardy społeczności:** Przestrzegaj naszych inkluzywnych zasad społeczności

---

## 📄 Informacje o kursie

### Licencja
Projekt jest udostępniony na licencji MIT - zobacz plik [LICENSE](../../LICENSE) po szczegóły.

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
 
### Seria Generatywnej AI
[![Generatywna AI dla początkujących](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatywna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Główne Nauczanie
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Nawigacja po kursie

**🚀 Gotowy, aby zacząć naukę?**

**Początkujący**: Zacznij od [Rozdział 1: Podstawy i szybki start](#-chapter-1-foundation--quick-start)  
**Twórcy AI**: Przejdź do [Rozdział 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Doświadczeni programiści**: Rozpocznij od [Rozdział 3: Konfiguracja i uwierzytelnianie](#️-chapter-3-configuration--authentication)

**Następne kroki**: [Rozpocznij Rozdział 1 - Podstawy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->