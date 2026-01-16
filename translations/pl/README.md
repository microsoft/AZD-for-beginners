<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T11:20:48+00:00",
  "source_file": "README.md",
  "language_code": "pl"
}
-->
# AZD dla początkujących: Ustrukturyzowana podróż edukacyjna

![AZD-for-beginners](../../../../translated_images/pl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Rozpoczęcie kursu

Wykonaj następujące kroki, aby rozpocząć swoją naukę AZD:

1. **Rozgałęź repozytorium (Fork)**: Kliknij [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj repozytorium**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Dołącz do społeczności**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) dla wsparcia ekspertów
4. **Wybierz ścieżkę nauki**: Wybierz rozdział poniżej odpowiadający Twojemu poziomowi doświadczenia

### Wsparcie wielu języków

#### Automatyczne tłumaczenia (zawsze aktualne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabski](../ar/README.md) | [Bengalski](../bn/README.md) | [Bułgarski](../bg/README.md) | [Birmański (Myanmar)](../my/README.md) | [Chiński (upr.)](../zh/README.md) | [Chiński (trad., Hongkong)](../hk/README.md) | [Chiński (trad., Makau)](../mo/README.md) | [Chiński (trad., Tajwan)](../tw/README.md) | [Chorwacki](../hr/README.md) | [Czeski](../cs/README.md) | [Duński](../da/README.md) | [Niderlandzki](../nl/README.md) | [Estoński](../et/README.md) | [Fiński](../fi/README.md) | [Francuski](../fr/README.md) | [Niemiecki](../de/README.md) | [Grecki](../el/README.md) | [Hebrajski](../he/README.md) | [Hindi](../hi/README.md) | [Węgierski](../hu/README.md) | [Indonezyjski](../id/README.md) | [Włoski](../it/README.md) | [Japoński](../ja/README.md) | [Kannada](../kn/README.md) | [Koreański](../ko/README.md) | [Litewski](../lt/README.md) | [Malajski](../ms/README.md) | [Malajalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Nigeryjski Pidgin](../pcm/README.md) | [Norweski](../no/README.md) | [Perski (Farsi)](../fa/README.md) | [Polski](./README.md) | [Portugalski (Brazylia)](../br/README.md) | [Portugalski (Portugalia)](../pt/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Rumuński](../ro/README.md) | [Rosyjski](../ru/README.md) | [Serbski (cyrylica)](../sr/README.md) | [Słowacki](../sk/README.md) | [Słoweński](../sl/README.md) | [Hiszpański](../es/README.md) | [Suahili](../sw/README.md) | [Szwedzki](../sv/README.md) | [Tagalog (Filipiński)](../tl/README.md) | [Tamilski](../ta/README.md) | [Telugu](../te/README.md) | [Tajski](../th/README.md) | [Turecki](../tr/README.md) | [Ukraiński](../uk/README.md) | [Urdu](../ur/README.md) | [Wietnamski](../vi/README.md)

> **Wolisz klonować lokalnie?**

> To repozytorium zawiera ponad 50 tłumaczeń językowych, co znacząco zwiększa rozmiar pobierania. Aby klonować bez tłumaczeń, użyj sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To dostarczy Ci wszystkiego, czego potrzebujesz do ukończenia kursu przy znacznie szybszym pobieraniu.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Przegląd kursu

Opanuj Azure Developer CLI (azd) poprzez ustrukturyzowane rozdziały zaprojektowane do progresywnej nauki. **Specjalny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla nowoczesnych programistów

Na podstawie informacji ze społeczności Microsoft Foundry Discord, **45% programistów chce używać AZD do obciążeń AI**, ale napotyka wyzwania z:
- Złożonymi, wielousługowymi architekturami AI
- Najlepszymi praktykami wdrażania AI w produkcji  
- Integracją i konfiguracją usług AI w Azure
- Optymalizacją kosztów obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

### Cele nauki

Po ukończeniu tego ustrukturyzowanego kursu będziesz potrafił:
- **Opanować podstawy AZD**: Główne koncepcje, instalacja i konfiguracja
- **Wdrażać aplikacje AI**: Używać AZD z usługami Microsoft Foundry
- **Wdrażać Infrastrukturę jako Kod**: Zarządzać zasobami Azure za pomocą szablonów Bicep
- **Rozwiązywać problemy z wdrożeniami**: Diagnozować i debugować typowe problemy
- **Optymalizować produkcję**: Bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Budować rozwiązania wieloagentowe**: Wdrażać złożone architektury AI

## 📚 Rozdziały nauki

*Wybierz swoją ścieżkę nauki według poziomu doświadczenia i celów*

### 🚀 Rozdział 1: Podstawy i szybki start
**Wymagania wstępne**: Subskrypcja Azure, podstawowa znajomość linii poleceń  
**Czas trwania**: 30-45 minut  
**Stopień trudności**: ⭐

#### Czego się nauczysz
- Zrozumienie podstaw Azure Developer CLI
- Instalacja AZD na Twojej platformie
- Pierwsze udane wdrożenie

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Co to jest Azure Developer CLI?](../..)
- **📖 Teoria**: [Podstawy AZD](docs/getting-started/azd-basics.md) - Główne pojęcia i terminologia
- **⚙️ Konfiguracja**: [Instalacja i konfiguracja](docs/getting-started/installation.md) - Poradniki dla platform
- **🛠️ Praktyka**: [Twój pierwszy projekt](docs/getting-started/first-project.md) - Instrukcja krok po kroku
- **📋 Szybka ściąga**: [Cheat Sheet poleceń](resources/cheat-sheet.md)

#### Ćwiczenia praktyczne
```bash
# Szybkie sprawdzenie instalacji
azd version

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up
```

**💡 Efekt rozdziału**: Udane wdrożenie prostej aplikacji internetowej na Azure za pomocą AZD

**✅ Potwierdzenie sukcesu:**
```bash
# Po ukończeniu Rozdziału 1 powinieneś być w stanie:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża do Azure
azd show                # Wyświetla URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Czyści zasoby
```

**📊 Czas pracy:** 30-45 minut  
**📈 Poziom umiejętności po:** Samodzielne wdrażanie podstawowych aplikacji

**✅ Potwierdzenie sukcesu:**
```bash
# Po ukończeniu Rozdziału 1 będziesz w stanie:
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                  # Wdraża na Azure
azd show                # Wyświetla URL działającej aplikacji
# Aplikacja otwiera się w przeglądarce i działa
azd down --force --purge  # Czyści zasoby
```

**📊 Czas pracy:** 30-45 minut  
**📈 Poziom umiejętności po:** Samodzielne wdrażanie podstawowych aplikacji

---

### 🤖 Rozdział 2: Rozwój Nakierowany na AI (Polecany dla programistów AI)
**Wymagania wstępne**: Ukończony Rozdział 1  
**Czas trwania**: 1-2 godziny  
**Stopień trudności**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji wykorzystujących AI
- Zrozumienie konfiguracji usług AI

#### Materiały do nauki
- **🎯 Zacznij tutaj**: [Integracja Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Wzorce**: [Wdrażanie modeli AI](docs/microsoft-foundry/ai-model-deployment.md) - Wdrażanie i zarządzanie modelami AI
- **🛠️ Warsztat**: [Laboratorium warsztatowe AI](docs/microsoft-foundry/ai-workshop-lab.md) - Przygotuj swoje rozwiązania AI do AZD
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) - Nauka w przeglądarce z MkDocs * DevContainer Environment
- **📋 Szablony**: [Szablony Microsoft Foundry](../..)
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

**💡 Efekt rozdziału**: Wdrożenie i konfiguracja aplikacji czatowej AI z funkcjami RAG

**✅ Potwierdzenie sukcesu:**
```bash
# Po rozdziale 2 powinieneś być w stanie:
azd init --template azure-search-openai-demo
azd up
# Przetestować interfejs czatu AI
# Zadawać pytania i otrzymywać odpowiedzi wspierane przez AI wraz z źródłami
# Zweryfikować działanie integracji wyszukiwania
azd monitor  # Sprawdzić, czy Application Insights pokazuje telemetrię
azd down --force --purge
```

**📊 Czas pracy:** 1-2 godziny  
**📈 Poziom umiejętności po:** Możliwość wdrażania i konfigurowania aplikacji AI gotowych do produkcji  
**💰 Świadomość kosztów:** Zrozumienie kosztów deweloperskich $80-150/miesiąc, kosztów produkcyjnych $300-3500/miesiąc

#### 💰 Rozważania kosztowe dotyczące wdrożeń AI

**Środowisko deweloperskie (szacunkowo $80-150/miesiąc):**
- Azure OpenAI (płatność za użycie): $0-50/miesiąc (według użycia tokenów)
- AI Search (poziom podstawowy): $75/miesiąc
- Container Apps (model consumption): $0-20/miesiąc
- Storage (standardowy): $1-5/miesiąc

**Środowisko produkcyjne (szacunkowo $300-3,500+/miesiąc):**
- Azure OpenAI (PTU dla stałej wydajności): $3,000+/miesiąc LUB płatność za użycie przy dużej skali
- AI Search (poziom standardowy): $250/miesiąc
- Container Apps (dedykowany): $50-100/miesiąc
- Application Insights: $5-50/miesiąc
- Storage (premium): $10-50/miesiąc

**💡 Wskazówki optymalizacji kosztów:**
- Korzystaj z **Darmowego poziomu** Azure OpenAI do nauki (w tym 50 000 tokenów/miesiąc)
- Uruchamiaj `azd down`, aby zwolnić zasoby, gdy nie rozwijasz aktywnie
- Zacznij od rozliczeń pay-as-you-go, uaktualnij do PTU tylko w produkcji
- Użyj `azd provision --preview`, aby oszacować koszty przed wdrożeniem
- Włącz autoskalowanie: płać tylko za rzeczywiste użycie

**Monitorowanie kosztów:**
```bash
# Sprawdź szacunkowe miesięczne koszty
azd provision --preview

# Monitoruj rzeczywiste koszty w portalu Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie
**Wymagania wstępne**: Ukończony Rozdział 1  
**Czas trwania**: 45-60 minut  
**Stopień trudności**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskami
- Najlepsze praktyki uwierzytelniania i zabezpieczeń
- Nazewnictwo i organizacja zasobów

#### Materiały do nauki
- **📖 Konfiguracja**: [Przewodnik konfiguracji](docs/getting-started/configuration.md) - Ustawienia środowiska
- **🔐 Bezpieczeństwo**: [Wzorce uwierzytelniania i tożsamości zarządzanej](docs/getting-started/authsecurity.md) - Wzorce uwierzytelniania
- **📝 Przykłady**: [Przykład aplikacji bazodanowej](examples/database-app/README.md) - Przykłady AZD z bazami danych

#### Ćwiczenia praktyczne
- Konfiguracja wielu środowisk (dev, staging, prod)
- Ustawienie uwierzytelniania za pomocą tożsamości zarządzanej
- Wdrożenie konfiguracji specyficznych dla środowisk

**💡 Efekt rozdziału**: Zarządzanie wieloma środowiskami z prawidłowym uwierzytelnianiem i zabezpieczeniami

---

### 🏗️ Rozdział 4: Infrastruktura jako Kod i Wdrożenia
**Wymagania wstępne**: Ukończone Rozdziały 1-3  
**Czas trwania**: 1-1.5 godziny  
**Stopień trudności**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeń
- Infrastruktura jako kod z Bicep
- Strategie provisioningu zasobów

#### Materiały do nauki
- **📖 Wdrożenia**: [Przewodnik wdrożeń](docs/deployment/deployment-guide.md) - Kompleksowe workflow
- **🏗️ Provisioning**: [Provisioning zasobów](docs/deployment/provisioning.md) - Zarządzanie zasobami Azure
- **📝 Przykłady**: [Przykład Container App](../../examples/container-app) - Wdrożenia konteneryzowane

#### Ćwiczenia praktyczne
- Tworzenie własnych szablonów Bicep
- Wdrażanie aplikacji wielousługowych
- Wdrożenie strategii blue-green deployment

**💡 Efekt rozdziału**: Wdrażanie złożonych aplikacji wielousługowych przy użyciu własnych szablonów infrastruktury

---

### 🎯 Rozdział 5: Rozwiązania wieloagentowe AI (Zaawansowany)
**Wymagania wstępne**: Ukończone Rozdziały 1-2  
**Czas trwania**: 2-3 godziny  
**Stopień trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury wieloagentowej
- Orkiestracja i koordynacja agentów  
- Wdrożenia AI gotowe do produkcji

#### Materiały do nauki  
- **🤖 Polecany projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) – kompletny wdrożenie  
- **🛠️ Szablony ARM**: [Pakiet szablonów ARM](../../examples/retail-multiagent-arm-template) – wdrożenie jednym kliknięciem  
- **📖 Architektura**: [Wzorce koordynacji wieloagentowej](/docs/pre-deployment/coordination-patterns.md) – wzorce

#### Ćwiczenia praktyczne  
```bash
# Wdróż kompletną detaliczną wieloagentową aplikację
cd examples/retail-multiagent-arm-template
./deploy.sh

# Eksploruj konfiguracje agentów
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Rezultat rozdziału**: Wdrożenie i zarządzanie gotowym do produkcji rozwiązaniem AI wieloagentowym z agentami Klienta i Inwentaryzacji

---

### 🔍 Rozdział 6: Weryfikacja i planowanie przed wdrożeniem  
**Wymagania wstępne**: ukończony rozdział 4  
**Czas trwania**: 1 godzina  
**Złożoność**: ⭐⭐

#### Czego się nauczysz  
- Planowanie zasobów i weryfikacja ich dostępności  
- Strategie wyboru SKU  
- Kontrole pre-flight i automatyzacja

#### Materiały do nauki  
- **📊 Planowanie**: [Planowanie zasobów](docs/pre-deployment/capacity-planning.md) – weryfikacja zasobów  
- **💰 Wybór**: [Wybór SKU](docs/pre-deployment/sku-selection.md) – opłacalne decyzje  
- **✅ Walidacja**: [Kontrole pre-flight](docs/pre-deployment/preflight-checks.md) – skrypty automatyczne

#### Ćwiczenia praktyczne  
- Uruchom skrypty weryfikacji dostępności zasobów  
- Optymalizuj wybory SKU pod kątem kosztów  
- Wdróż automatyczne kontrole przed wdrożeniem

**💡 Rezultat rozdziału**: Zweryfikuj i zoptymalizuj wdrożenia przed realizacją

---

### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie  
**Wymagania wstępne**: ukończony dowolny rozdział o wdrożeniu  
**Czas trwania**: 1-1,5 godziny  
**Złożoność**: ⭐⭐

#### Czego się nauczysz  
- Systematyczne metody debugowania  
- Typowe problemy i sposoby ich rozwiązania  
- Rozwiązywanie problemów specyficznych dla AI

#### Materiały do nauki  
- **🔧 Typowe problemy**: [Typowe problemy](docs/troubleshooting/common-issues.md) – FAQ i rozwiązania  
- **🕵️ Debugowanie**: [Przewodnik po debugowaniu](docs/troubleshooting/debugging.md) – krok po kroku  
- **🤖 Problemy AI**: [Rozwiązywanie problemów AI](docs/troubleshooting/ai-troubleshooting.md) – problemy usług AI

#### Ćwiczenia praktyczne  
- Diagnostyka błędów wdrożenia  
- Rozwiązywanie problemów z uwierzytelnianiem  
- Debugowanie połączeń usług AI

**💡 Rezultat rozdziału**: Samodzielnie diagnozuj i rozwiązuj typowe problemy wdrożeń

---

### 🏢 Rozdział 8: Wzorce produkcyjne i korporacyjne  
**Wymagania wstępne**: ukończone rozdziały 1-4  
**Czas trwania**: 2-3 godziny  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz  
- Strategie wdrożeń produkcyjnych  
- Wzorce bezpieczeństwa dla przedsiębiorstw  
- Monitorowanie i optymalizacja kosztów

#### Materiały do nauki  
- **🏭 Produkcja**: [Najlepsze praktyki AI na produkcji](docs/microsoft-foundry/production-ai-practices.md) – wzorce korporacyjne  
- **📝 Przykłady**: [Przykład mikroserwisów](../../examples/microservices) – skomplikowane architektury  
- **📊 Monitorowanie**: [Integracja z Application Insights](docs/pre-deployment/application-insights.md) – monitorowanie

#### Ćwiczenia praktyczne  
- Wdróż wzorce bezpieczeństwa korporacyjnego  
- Skonfiguruj kompleksowe monitorowanie  
- Wdróż rozwiązanie produkcyjne z odpowiednim zarządzaniem

**💡 Rezultat rozdziału**: Wdróż aplikacje gotowe do produkcji w środowisku korporacyjnym z pełnymi możliwościami

---

## 🎓 Przegląd warsztatów: Praktyczne doświadczenie z nauką

> **⚠️ STATUS WARSZTATU: Aktywny rozwój**  
> Materiały warsztatowe są obecnie opracowywane i dopracowywane. Podstawowe moduły działają, ale niektóre zaawansowane sekcje są niekompletne. Intensywnie pracujemy nad pełnym uzupełnieniem zawartości. [Śledź postępy →](workshop/README.md)

### Interaktywne materiały warsztatowe  
**Kompleksowa, praktyczna nauka z narzędziami przeglądarkowymi i ćwiczeniami prowadzonymi**

Materiały warsztatowe oferują uporządkowaną, interaktywną ścieżkę nauki, która uzupełnia powyższy program rozdziałów. Warsztat przeznaczony jest do nauki samodzielnej oraz sesji prowadzonych przez instruktora.

#### 🛠️ Funkcje warsztatu  
- **Interfejs w przeglądarce**: Kompletny warsztat wspierany przez MkDocs z funkcjami wyszukiwania, kopiowania i motywów  
- **Integracja z GitHub Codespaces**: Konfiguracja środowiska programistycznego jednym kliknięciem  
- **Struktura nauki w 7 krokach** (łącznie 3,5 godziny)  
- **Metodologia Odkrywanie → Wdrożenie → Dostosowanie**  
- **Interaktywne środowisko DevContainer**: Wstępnie skonfigurowane narzędzia i zależności

#### 📚 Struktura warsztatu  
Warsztat realizowany jest według metodologii **Odkrywanie → Wdrożenie → Dostosowanie**:

1. **Faza odkrywania** (45 minut)  
   - Poznanie szablonów i usług Microsoft Foundry  
   - Zrozumienie wzorców architektury wieloagentowej  
   - Przegląd wymagań i warunków wstępnych wdrożenia

2. **Faza wdrożenia** (2 godziny)  
   - Praktyczne wdrażanie aplikacji AI z AZD  
   - Konfiguracja usług Azure AI i punktów końcowych  
   - Implementacja wzorców bezpieczeństwa i uwierzytelniania

3. **Faza dostosowania** (45 minut)  
   - Modyfikacja aplikacji pod konkretne zastosowania  
   - Optymalizacja do wdrożeń produkcyjnych  
   - Implementacja monitoringu i zarządzania kosztami

#### 🚀 Rozpocznij warsztat  
```bash
# Opcja 1: GitHub Codespaces (zalecane)
# Kliknij "Code" → "Create codespace on main" w repozytorium

# Opcja 2: Lokalny rozwój
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postępuj zgodnie z instrukcjami instalacji w workshop/README.md
```
  
#### 🎯 Rezultaty nauki w warsztacie  
Po ukończeniu warsztatu uczestnicy:  
- **Wdrażają aplikacje AI gotowe do produkcji**: korzystając z AZD i usług Microsoft Foundry  
- **Opanują architekturę wieloagentową**: implementacja skoordynowanych rozwiązań agentowych AI  
- **Stosują najlepsze praktyki bezpieczeństwa**: konfiguracja uwierzytelniania i kontroli dostępu  
- **Optymalizują pod kątem skalowalności**: projektowanie efektywnych kosztowo i wydajnych wdrożeń  
- **Samodzielnie rozwiązują problemy wdrożeń**: identyfikacja i naprawa popularnych błędów

#### 📖 Materiały warsztatowe  
- **🎥 Interaktywny przewodnik**: [Materiały warsztatowe](workshop/README.md) – środowisko nauki w przeglądarce  
- **📋 Instrukcje krok po kroku**: [Ćwiczenia prowadzone](../../workshop/docs/instructions) – dokładne instrukcje  
- **🛠️ Laboratorium AI**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) – ćwiczenia skoncentrowane na AI  
- **💡 Szybki start**: [Przewodnik po konfiguracji warsztatu](workshop/README.md#quick-start)

**Idealne dla**: szkoleń firmowych, kursów uniwersyteckich, nauki we własnym tempie i warsztatów dla programistów.

---

## 📖 Co to jest Azure Developer CLI?

Azure Developer CLI (azd) to narzędzie wiersza poleceń dedykowane deweloperom, które przyspiesza proces tworzenia i wdrażania aplikacji na Azure. Oferuje:

- **Wdrożenia oparte na szablonach** – użycie gotowych szablonów dla popularnych wzorców aplikacji  
- **Infrastruktura jako kod** – zarządzanie zasobami Azure za pomocą Bicep lub Terraform  
- **Zintegrowane przepływy pracy** – bezproblemowe przygotowanie, wdrożenie i monitorowanie aplikacji  
- **Przyjazne dla deweloperów** – zoptymalizowane pod kątem produktywności i doświadczenia programisty

### **AZD + Microsoft Foundry: idealne do wdrożeń AI**

**Dlaczego AZD dla rozwiązań AI?** AZD odpowiada na główne wyzwania programistów AI:

- **Szablony gotowe do AI** – prekonfigurowane szablony Azure OpenAI, Cognitive Services i obciążeń ML  
- **Bezpieczne wdrożenia AI** – wbudowane wzorce bezpieczeństwa dla usług AI, kluczy API i punktów końcowych modeli  
- **Wzorce produkcyjne AI** – najlepsze praktyki skalowalnych i oszczędnych wdrożeń aplikacji AI  
- **Kompleksowe przepływy pracy AI** – od rozwoju modeli po wdrożenie i monitorowanie produkcyjne  
- **Optymalizacja kosztów** – inteligentne zarządzanie zasobami i skalowaniem obciążeń AI  
- **Integracja z Microsoft Foundry** – płynne połączenie z katalogiem modeli i punktami końcowymi Microsoft Foundry

---

## 🎯 Biblioteka szablonów i przykładów

### Wyróżnione: Szablony Microsoft Foundry  
**Zacznij tutaj, jeśli wdrażasz aplikacje AI!**

> **Uwaga:** Te szablony pokazują różne wzorce AI. Niektóre to zewnętrzne przykłady Azure, inne to lokalne implementacje.

| Szablon | Rozdział | Złożoność | Usługi | Typ |
|---------|----------|-----------|--------|-----|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Rozdział 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Zewnętrzny |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zewnętrzny |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zewnętrzny |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zewnętrzny |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zewnętrzny |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalny** |

### Wyróżnione: Kompleksowe scenariusze nauki  
**Szablony aplikacji gotowe do produkcji powiązane z rozdziałami nauki**

| Szablon | Rozdział nauki | Złożoność | Kluczowa nauka |
|---------|----------------|-----------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Rozdział 2 | ⭐ | Podstawowe wzorce wdrożenia AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Rozdział 2 | ⭐⭐ | Implementacja RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Rozdział 4 | ⭐⭐ | Integracja z Inteligencją Dokumentową |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Rozdział 5 | ⭐⭐⭐ | Framework agentów i wywołania funkcji |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Rozdział 8 | ⭐⭐⭐ | Orkiestracja AI korporacyjnego |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Rozdział 5 | ⭐⭐⭐⭐ | Architektura wieloagentowa z agentami Klienta i Inwentaryzacji |

### Nauka przez przykład według typu

> **📌 Lokalnie vs. przykłady zewnętrzne:**  
> **Przykłady lokalne** (w tym repozytorium) = gotowe do natychmiastowego użycia  
> **Przykłady zewnętrzne** (Azure Samples) = trzeba sklonować z repozytoriów

#### Przykłady lokalne (Gotowe do użycia)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) – kompletne gotowe do produkcji wdrożenie z szablonami ARM  
  - Architektura wieloagentowa (agenci Klienta + Inwentaryzacji)  
  - Pełny monitoring i ewaluacja  
  - Wdrożenie jednym kliknięciem przez szablon ARM

#### Przykłady lokalne – aplikacje kontenerowe (rozdziały 2-5)  
**Kompleksowe przykłady wdrożeń kontenerowych w tym repozytorium:**  
- [**Przykłady aplikacji kontenerowych**](examples/container-app/README.md) – kompletny przewodnik po wdrożeniach kontenerowych  
  - [Proste API Flask](../../examples/container-app/simple-flask-api) – podstawowe REST API z możliwością skalowania do zera  
  - [Architektura mikroserwisów](../../examples/container-app/microservices) – produkcyjne wdrożenie wielu usług  
  - Szybki start, produkcja i zaawansowane wzorce wdrożeń  
  - Monitorowanie, bezpieczeństwo i wskazówki optymalizacji kosztów

#### Przykłady zewnętrzne – proste aplikacje (rozdziały 1-2)  
**Sklonuj repozytoria Azure Samples, aby zacząć:**  
- [Prosta aplikacja web - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) – podstawowe wzorce wdrożeń  
- [Strona statyczna - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) – wdrożenie treści statycznej  
- [Aplikacja kontenerowa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) – wdrożenie REST API

#### Przykłady zewnętrzne – integracja z bazą danych (rozdziały 3-4)  
- [Aplikacja z bazą danych - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) – wzorce połączenia z bazą danych  
- [Funkcje + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) – bezserwerowe przetwarzanie danych

#### Przykłady zewnętrzne – wzorce zaawansowane (rozdziały 4-8)  
- [Mikroserwisy Java](https://github.com/Azure-Samples/java-microservices-aca-lab) – architektury wielousługowe  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) – przetwarzanie tła  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) – produkcyjne wzorce ML

### Zewnętrzne kolekcje szablonów  
- [**Oficjalna galeria szablonów AZD**](https://azure.github.io/awesome-azd/) – wyselekcjonowane kolekcje oficjalnych i społecznościowych szablonów  
- [**Dokumentacja szablonów Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) – dokumentacja Microsoft Learn dla szablonów
- [**Katalog przykładów**](examples/README.md) - Lokalne przykłady do nauki z szczegółowymi wyjaśnieniami

---

## 📚 Zasoby do nauki i odniesienia

### Szybkie odniesienia
- [**Ściąga z poleceń**](resources/cheat-sheet.md) - Podstawowe polecenia azd pogrupowane według rozdziałów
- [**Słownik pojęć**](resources/glossary.md) - Terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - Najczęstsze pytania pogrupowane według rozdziałów do nauki
- [**Przewodnik do nauki**](resources/study-guide.md) - Kompleksowe ćwiczenia praktyczne

### Warsztaty praktyczne
- [**Laboratorium warsztatowe AI**](docs/microsoft-foundry/ai-workshop-lab.md) - Uczyń swoje rozwiązania AI możliwymi do wdrożenia za pomocą AZD (2-3 godziny)
- [**Interaktywny przewodnik warsztatowy**](workshop/README.md) - Warsztat w przeglądarce z MkDocs i środowiskiem DevContainer
- [**Strukturalna ścieżka nauki**](../../workshop/docs/instructions) - 7-stopniowe ćwiczenia krok po kroku (Odkrywanie → Wdrożenie → Dostosowanie)
- [**Warsztat AZD dla początkujących**](workshop/README.md) - Kompletny materiał warsztatowy z integracją GitHub Codespaces

### Zewnętrzne zasoby do nauki
- Dokumentacja Azure Developer CLI: [https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Centrum architektury Azure: [https://learn.microsoft.com/en-us/azure/architecture/](https://learn.microsoft.com/en-us/azure/architecture/)
- Kalkulator cen Azure: [https://azure.microsoft.com/pricing/calculator/](https://azure.microsoft.com/pricing/calculator/)
- Stan Azure: [https://status.azure.com/](https://status.azure.com/)

---

## 🔧 Szybki przewodnik rozwiązywania problemów

**Typowe problemy początkujących i natychmiastowe rozwiązania:**

### ❌ "azd: command not found"

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

### ❌ "Nie znaleziono subskrypcji" lub "Subskrypcja nieustawiona"

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

### ❌ "InsufficientQuota" lub "Przekroczono limit"

```bash
# Wypróbuj inny region Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Lub użyj mniejszych SKUs w środowisku deweloperskim
# Edytuj infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" nie powiodło się w połowie procesu

```bash
# Opcja 1: Wyczyść i spróbuj ponownie
azd down --force --purge
azd up

# Opcja 2: Napraw tylko infrastrukturę
azd provision

# Opcja 3: Sprawdź szczegółowe logi
azd show
azd logs
```

### ❌ "Błąd uwierzytelniania" lub "Token wygasł"

```bash
# Ponownie uwierzytelnij
az logout
az login

azd auth logout
azd auth login

# Zweryfikuj uwierzytelnianie
az account show
```

### ❌ "Zasób już istnieje" lub konflikty nazw

```bash
# AZD generuje unikalne nazwy, ale w przypadku konfliktu:
azd down --force --purge

# Następnie spróbuj ponownie z nowym środowiskiem
azd env new dev-v2
azd up
```

### ❌ Wdrożenie szablonu trwa zbyt długo

**Normalny czas oczekiwania:**
- Prosta aplikacja internetowa: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (prowizjonowanie OpenAI jest wolne)

```bash
# Sprawdź postęp
azd show

# Jeśli utknąłeś na ponad 30 minut, sprawdź portal Azure:
azd monitor
# Szukaj nieudanych wdrożeń
```

### ❌ "Odmowa dostępu" lub "Zabronione"

```bash
# Sprawdź swoją rolę w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrzebujesz co najmniej roli "Współtwórca"
# Poproś administratora Azure o przyznanie:
# - Współtwórca (dla zasobów)
# - Administrator dostępu użytkowników (dla przypisywania ról)
```

### ❌ Nie można znaleźć URL wdrożonej aplikacji

```bash
# Pokaż wszystkie punkty końcowe usługi
azd show

# Lub otwórz Azure Portal
azd monitor

# Sprawdź konkretną usługę
azd env get-values
# Poszukaj zmiennych *_URL
```

### 📚 Pełne zasoby dotyczące rozwiązywania problemów

- **Przewodnik po często występujących problemach:** [Szczegółowe rozwiązania](docs/troubleshooting/common-issues.md)
- **Problemy specyficzne dla AI:** [Rozwiązywanie problemów z AI](docs/troubleshooting/ai-troubleshooting.md)
- **Przewodnik po debugowaniu:** [Debugowanie krok po kroku](docs/troubleshooting/debugging.md)
- **Uzyskaj pomoc:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

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
<summary><strong>❌ "Nie znaleziono subskrypcji" lub "Subskrypcja nieustawiona"</strong></summary>

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

# Opcja 2: Napraw tylko infrastrukturę
azd provision

# Opcja 3: Sprawdź szczegółowe logi
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Błąd uwierzytelniania" lub "Token wygasł"</strong></summary>

```bash
# Ponowna autoryzacja
az logout
az login

azd auth logout
azd auth login

# Weryfikuj uwierzytelnienie
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
<summary><strong>❌ Wdrożenie szablonu trwa zbyt długo</strong></summary>

**Normalny czas oczekiwania:**
- Prosta aplikacja internetowa: 5-10 minut
- Aplikacja z bazą danych: 10-15 minut
- Aplikacje AI: 15-25 minut (prowizjonowanie OpenAI jest wolne)

```bash
# Sprawdź postęp
azd show

# Jeśli utkniesz na >30 minut, sprawdź Azure Portal:
azd monitor
# Szukaj nieudanych wdrożeń
```
</details>

<details>
<summary><strong>❌ "Odmowa dostępu" lub "Zabronione"</strong></summary>

```bash
# Sprawdź swoją rolę w Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrzebujesz co najmniej roli „Współtwórca”
# Poproś administratora Azure o przyznanie:
# - Współtwórca (dla zasobów)
# - Administrator dostępu użytkowników (dla przypisywania ról)
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

### 📚 Pełne zasoby dotyczące rozwiązywania problemów

- **Przewodnik po często występujących problemach:** [Szczegółowe rozwiązania](docs/troubleshooting/common-issues.md)
- **Problemy specyficzne dla AI:** [Rozwiązywanie problemów z AI](docs/troubleshooting/ai-troubleshooting.md)
- **Przewodnik po debugowaniu:** [Debugowanie krok po kroku](docs/troubleshooting/debugging.md)
- **Uzyskaj pomoc:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukończenie kursu i certyfikacja

### Śledzenie postępów
Śledź swoje postępy w nauce w każdym rozdziale:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój z AI jako priorytetem ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Rozwiązania AI z wieloma agentami ✅
- [ ] **Rozdział 6**: Walidacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Wzorce produkcyjne i korporacyjne ✅

### Weryfikacja nauki
Po ukończeniu każdego rozdziału zweryfikuj swoją wiedzę poprzez:
1. **Ćwiczenie praktyczne**: Ukończenie wdrożenia praktycznego z rozdziału
2. **Sprawdzenie wiedzy**: Przejrzenie sekcji FAQ odpowiedniej dla rozdziału
3. **Dyskusja społecznościowa**: Podzielenie się doświadczeniem na Discord Azure
4. **Następny rozdział**: Przejście do kolejnego poziomu zaawansowania

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów będziesz mieć:
- **Doświadczenie produkcyjne**: Wdrożone rzeczywiste aplikacje AI do Azure
- **Umiejętności zawodowe**: Gotowość do wdrożeń na poziomie korporacyjnym  
- **Uznanie społeczności**: Aktywny członek społeczności deweloperów Azure
- **Rozwój kariery**: Poszukiwane kompetencje w zakresie AZD i wdrożeń AI

---

## 🤝 Społeczność i wsparcie

### Uzyskaj pomoc i wsparcie
- **Problemy techniczne:** [Zgłaszaj błędy i prośby o funkcje](https://github.com/microsoft/azd-for-beginners/issues)
- **Pytania dotyczące nauki:** [Społeczność Microsoft Azure na Discord](https://discord.gg/microsoft-azure) oraz [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specyficzna dla AI:** Dołącz do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacja:** [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wgląd społeczności z Discord Microsoft Foundry

**Najnowsze wyniki ankiet z kanału #Azure:**
- **45%** deweloperów chce używać AZD do obciążeń AI
- **Główne wyzwania:** wdrożenia wielousługowe, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najczęściej proszone o:** szablony specyficzne dla AI, przewodniki rozwiązywania problemów, najlepsze praktyki

**Dołącz do naszej społeczności, aby:**
- Dzielić się doświadczeniem z AZD + AI i uzyskać wsparcie
- Uzyskać wczesny dostęp do nowych szablonów AI
- Współtworzyć najlepsze praktyki wdrażeń AI
- Wpływać na przyszły rozwój funkcji AI + AZD

### Współtworzenie kursu
Zapraszamy do współpracy! Prosimy o zapoznanie się z naszym [Przewodnikiem dla współtwórców](CONTRIBUTING.md) dotyczącym:
- **Ulepszania treści:** Rozwijanie istniejących rozdziałów i przykładów
- **Nowych przykładów:** Dodawanie scenariuszy i szablonów z prawdziwego świata  
- **Tłumaczeń:** Wsparcie utrzymania obsługi wielu języków
- **Zgłaszania błędów:** Poprawa dokładności i jasności
- **Standardów społeczności:** Przestrzeganie naszych wytycznych dotyczących inkluzywności

---

## 📄 Informacje o kursie

### Licencja
Ten projekt jest licencjonowany na podstawie licencji MIT — zobacz plik [LICENSE](../../LICENSE) po szczegóły.

### Powiązane zasoby do nauki Microsoft

Nasz zespół tworzy inne kompleksowe kursy naukowe:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j dla początkujących](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js dla początkujących](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agenci
[![AZD dla początkujących](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI dla początkujących](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP dla początkujących](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agenci dla początkujących](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria generatywnego AI
[![Generative AI dla początkujących](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Podstawowa nauka
[![ML dla początkujących](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science dla początkujących](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
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

**Początkujący**: Zacznij od [Rozdział 1: Podstawy i szybki start](../..)  
**Deweloperzy AI**: Przejdź do [Rozdział 2: Rozwój z podejściem AI-First](../..)  
**Doświadczeni programiści**: Zacznij od [Rozdział 3: Konfiguracja i uwierzytelnianie](../..)

**Następne kroki**: [Rozpocznij rozdział 1 - Podstawy AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, należy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być traktowany jako źródło autorytatywne. W przypadku istotnych informacji zaleca się skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->