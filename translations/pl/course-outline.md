<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-09-24T10:41:16+00:00",
  "source_file": "course-outline.md",
  "language_code": "pl"
}
-->
# AZD dla Początkujących: Plan Kursu i Ramy Nauki

## Przegląd Kursu

Opanuj Azure Developer CLI (azd) dzięki uporządkowanym rozdziałom zaprojektowanym do stopniowego przyswajania wiedzy. **Szczególny nacisk na wdrażanie aplikacji AI z integracją Azure AI Foundry.**

### Dlaczego ten kurs jest niezbędny dla współczesnych programistów

Na podstawie spostrzeżeń społeczności Discord Azure AI Foundry, **45% programistów chce używać AZD do obciążeń AI**, ale napotyka trudności związane z:
- Złożonymi architekturami AI obejmującymi wiele usług
- Najlepszymi praktykami wdrażania AI w środowisku produkcyjnym  
- Integracją i konfiguracją usług Azure AI
- Optymalizacją kosztów dla obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

### Główne cele nauki

Po ukończeniu tego kursu:
- **Opanujesz podstawy AZD**: Kluczowe koncepcje, instalacja i konfiguracja
- **Wdrożysz aplikacje AI**: Korzystanie z AZD w połączeniu z usługami Azure AI Foundry
- **Zastosujesz Infrastructure as Code**: Zarządzanie zasobami Azure za pomocą szablonów Bicep
- **Rozwiążesz problemy z wdrożeniami**: Rozwiązywanie typowych problemów i debugowanie
- **Optymalizujesz środowisko produkcyjne**: Bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Zbudujesz rozwiązania wieloagentowe**: Wdrażanie złożonych architektur AI

## 🎓 Warsztatowe doświadczenie nauki

### Elastyczne opcje nauki
Kurs został zaprojektowany tak, aby wspierać zarówno **samodzielne uczenie się**, jak i **warsztaty prowadzone przez instruktorów**, umożliwiając uczestnikom zdobycie praktycznych umiejętności dzięki interaktywnym ćwiczeniom.

#### 🚀 Tryb samodzielnej nauki
**Idealny dla indywidualnych programistów i ciągłego rozwoju**

**Funkcje:**
- **Interfejs przeglądarkowy**: Warsztat oparty na MkDocs dostępny przez dowolną przeglądarkę
- **Integracja z GitHub Codespaces**: Jedno kliknięcie do uruchomienia środowiska z prekonfigurowanymi narzędziami
- **Interaktywne środowisko DevContainer**: Brak potrzeby lokalnej konfiguracji - zacznij kodować od razu
- **Śledzenie postępów**: Wbudowane punkty kontrolne i ćwiczenia weryfikacyjne
- **Wsparcie społeczności**: Dostęp do kanałów Discord Azure w celu zadawania pytań i współpracy

**Struktura nauki:**
- **Elastyczny czas**: Ukończ rozdziały we własnym tempie w ciągu dni lub tygodni
- **System punktów kontrolnych**: Zweryfikuj naukę przed przejściem do bardziej zaawansowanych tematów
- **Biblioteka zasobów**: Obszerna dokumentacja, przykłady i przewodniki rozwiązywania problemów
- **Rozwój portfolio**: Twórz projekty gotowe do wdrożenia w portfolio zawodowym

**Rozpoczęcie (samodzielna nauka):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Warsztaty prowadzone przez instruktorów
**Idealne dla szkoleń korporacyjnych, bootcampów i instytucji edukacyjnych**

**Formaty warsztatów:**

**📚 Integracja z programem akademickim (8-12 tygodni)**
- **Programy uniwersyteckie**: Kurs semestralny z cotygodniowymi sesjami 2-godzinnymi
- **Format bootcampu**: Intensywny program 3-5 dniowy z codziennymi sesjami 6-8 godzin
- **Szkolenia korporacyjne**: Miesięczne sesje zespołowe z praktyczną realizacją projektów
- **Ramy oceny**: Zadania oceniane, recenzje koleżeńskie i projekty końcowe

**🚀 Intensywny warsztat (1-3 dni)**
- **Dzień 1**: Podstawy + Rozwój AI (Rozdziały 1-2) - 6 godzin
- **Dzień 2**: Konfiguracja + Infrastruktura (Rozdziały 3-4) - 6 godzin  
- **Dzień 3**: Zaawansowane wzorce + Produkcja (Rozdziały 5-8) - 8 godzin
- **Follow-up**: Opcjonalne 2-tygodniowe wsparcie mentorskie dla ukończenia projektu

**⚡ Briefing dla kadry zarządzającej (4-6 godzin)**
- **Przegląd strategiczny**: Wartość AZD i wpływ na biznes (1 godzina)
- **Demo praktyczne**: Wdrożenie aplikacji AI od początku do końca (2 godziny)
- **Przegląd architektury**: Wzorce korporacyjne i zarządzanie (1 godzina)
- **Planowanie wdrożenia**: Strategia adopcji w organizacji (1-2 godziny)

#### 🛠️ Metodologia nauki warsztatowej
**Podejście Discovery → Deployment → Customization dla praktycznego rozwoju umiejętności**

**Faza 1: Discovery (45 minut)**
- **Eksploracja szablonów**: Ocena szablonów i usług Azure AI Foundry
- **Analiza architektury**: Zrozumienie wzorców wieloagentowych i strategii wdrożeniowych
- **Ocena wymagań**: Identyfikacja potrzeb i ograniczeń organizacyjnych
- **Konfiguracja środowiska**: Przygotowanie środowiska deweloperskiego i zasobów Azure

**Faza 2: Deployment (2 godziny)**
- **Wdrożenie z przewodnikiem**: Krok po kroku wdrożenie aplikacji AI za pomocą AZD
- **Konfiguracja usług**: Konfiguracja usług Azure AI, punktów końcowych i uwierzytelniania
- **Implementacja bezpieczeństwa**: Zastosowanie wzorców bezpieczeństwa korporacyjnego i kontroli dostępu
- **Testowanie walidacyjne**: Weryfikacja wdrożeń i rozwiązywanie typowych problemów

**Faza 3: Customization (45 minut)**
- **Modyfikacja aplikacji**: Dostosowanie szablonów do konkretnych przypadków użycia i wymagań
- **Optymalizacja produkcji**: Wdrożenie monitorowania, zarządzania kosztami i strategii skalowania
- **Zaawansowane wzorce**: Eksploracja koordynacji wieloagentowej i złożonych architektur
- **Planowanie dalszych kroków**: Określenie ścieżki nauki dla dalszego rozwoju umiejętności

#### 🎯 Wyniki nauki warsztatowej
**Mierzalne umiejętności rozwijane poprzez praktykę**

**Kompetencje techniczne:**
- **Wdrożenie aplikacji AI w produkcji**: Skuteczne wdrożenie i konfiguracja rozwiązań opartych na AI
- **Opanowanie Infrastructure as Code**: Tworzenie i zarządzanie niestandardowymi szablonami Bicep
- **Architektura wieloagentowa**: Implementacja skoordynowanych rozwiązań AI
- **Gotowość produkcyjna**: Zastosowanie wzorców bezpieczeństwa, monitorowania i zarządzania
- **Ekspertyza w rozwiązywaniu problemów**: Samodzielne rozwiązywanie problemów z wdrożeniem i konfiguracją

**Umiejętności zawodowe:**
- **Przywództwo projektowe**: Kierowanie zespołami technicznymi w inicjatywach wdrożeniowych w chmurze
- **Projektowanie architektury**: Tworzenie skalowalnych, opłacalnych rozwiązań Azure
- **Transfer wiedzy**: Szkolenie i mentoring współpracowników w najlepszych praktykach AZD
- **Planowanie strategiczne**: Wpływanie na strategie adopcji chmury w organizacji

#### 📋 Zasoby i materiały warsztatowe
**Kompleksowy zestaw narzędzi dla instruktorów i uczestników**

**Dla instruktorów:**
- **Przewodnik dla instruktorów**: [Workshop Facilitation Guide](workshop/docs/instructor-guide.md) - Planowanie sesji i wskazówki dotyczące prowadzenia
- **Materiały prezentacyjne**: Prezentacje, diagramy architektury i skrypty demonstracyjne
- **Narzędzia oceny**: Ćwiczenia praktyczne, testy wiedzy i rubryki oceny
- **Konfiguracja techniczna**: Przewodniki konfiguracji środowiska, rozwiązywanie problemów i plany awaryjne

**Dla uczestników:**
- **Interaktywne środowisko warsztatowe**: [Workshop Materials](workshop/README.md) - Platforma nauki dostępna przez przeglądarkę
- **Instrukcje krok po kroku**: [Guided Exercises](../../workshop/docs/instructions) - Szczegółowe przewodniki wdrożeniowe  
- **Dokumentacja referencyjna**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Dogłębne analizy skoncentrowane na AI
- **Zasoby społecznościowe**: Kanały Discord Azure, dyskusje na GitHub i wsparcie ekspertów

#### 🏢 Wdrożenie warsztatów w przedsiębiorstwie
**Strategie wdrożeniowe i szkoleniowe dla organizacji**

**Programy szkoleniowe dla firm:**
- **Onboarding programistów**: Orientacja dla nowych pracowników z podstawami AZD (2-4 tygodnie)
- **Podnoszenie kwalifikacji zespołów**: Warsztaty kwartalne dla istniejących zespołów deweloperskich (1-2 dni)
- **Przegląd architektury**: Miesięczne sesje dla starszych inżynierów i architektów (4 godziny)
- **Briefingi dla liderów**: Warsztaty dla kadry zarządzającej technicznej (pół dnia)

**Wsparcie wdrożeniowe:**
- **Projektowanie niestandardowych warsztatów**: Treści dostosowane do specyficznych potrzeb organizacji
- **Zarządzanie programem pilotażowym**: Strukturalne wdrożenie z metrykami sukcesu i pętlami informacji zwrotnej  
- **Ciągły mentoring**: Wsparcie po warsztatach dla realizacji projektów
- **Budowanie społeczności**: Wewnętrzne społeczności deweloperów Azure AI i dzielenie się wiedzą

**Metryki sukcesu:**
- **Zdobycie umiejętności**: Oceny przed/po mierzące wzrost kompetencji technicznych
- **Sukces wdrożeniowy**: Procent uczestników skutecznie wdrażających aplikacje produkcyjne
- **Czas do produktywności**: Skrócony czas wdrożenia dla nowych projektów Azure AI
- **Retencja wiedzy**: Oceny kontrolne 3-6 miesięcy po warsztacie

## Struktura nauki w 8 rozdziałach

### Rozdział 1: Podstawy i szybki start (30-45 minut) 🌱
**Wymagania wstępne**: Subskrypcja Azure, podstawowa znajomość linii poleceń  
**Poziom trudności**: ⭐

#### Czego się nauczysz
- Podstawy Azure Developer CLI
- Instalacja AZD na Twojej platformie  
- Twoje pierwsze udane wdrożenie
- Kluczowe koncepcje i terminologia

#### Zasoby nauki
- [AZD Basics](docs/getting-started/azd-basics.md) - Podstawowe koncepcje
- [Installation & Setup](docs/getting-started/installation.md) - Przewodniki dla różnych platform
- [Your First Project](docs/getting-started/first-project.md) - Praktyczny tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Szybki dostęp do poleceń

#### Wynik praktyczny
Udane wdrożenie prostej aplikacji webowej na Azure za pomocą AZD

---

### Rozdział 2: Rozwój zorientowany na AI (1-2 godziny) 🤖
**Wymagania wstępne**: Ukończony Rozdział 1  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Integracja Azure AI Foundry z AZD
- Wdrażanie aplikacji opartych na AI
- Konfiguracja usług AI
- Wzorce RAG (Retrieval-Augmented Generation)

#### Zasoby nauki
- [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - **NOWE**: Kompleksowe laboratorium praktyczne (2-3 godziny)
- [Interactive Workshop Guide](workshop/README.md) - **NOWE**: Warsztat przeglądarkowy z podglądem MkDocs
- [Azure AI Foundry Templates](README.md#featured-azure-ai-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **NOWE**: Szczegółowe ćwiczenia z przewodnikiem

#### Wynik praktyczny
Wdrożenie i konfiguracja aplikacji AI z funkcjami RAG

#### Ścieżka nauki warsztatowej (opcjonalne rozszerzenie)
**NOWE Interaktywne Doświadczenie**: [Complete Workshop Guide](workshop/README.md)
1. **Discovery** (30 minut): Wybór i ocena szablonów
2. **Deployment** (45 minut): Wdrożenie i walidacja funkcjonalności szablonu AI  
3. **Deconstruction** (30 minut): Zrozumienie architektury i komponentów szablonu
4. **Configuration** (30 minut): Dostosowanie ustawień i parametrów
5. **Customization** (45 minut): Modyfikacja i iteracja, aby dostosować do własnych potrzeb
6. **Teardown** (15 minut): Czyszczenie zasobów i zrozumienie cyklu życia
7. **Wrap-up** (15 minut): Kolejne kroki i zaawansowane ścieżki nauki

---

### Rozdział 3: Konfiguracja i uwierzytelnianie (45-60 minut) ⚙️
**Wymagania wstępne**: Ukończony Rozdział 1  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskiem
- Najlepsze praktyki w zakresie uwierzytelniania i bezpieczeństwa
- Nazewnictwo zasobów i organizacja
- Wdrożenia w wielu środowiskach

#### Zasoby nauki
- [Configuration Guide](docs/getting-started/configuration.md) - Konfiguracja środowiska
- Wzorce bezpieczeństwa i zarządzane tożsamości
- Przykłady wdrożeń w wielu środowiskach

#### Wynik praktyczny
Zarządzanie wieloma środowiskami z odpowiednim uwierzytelnianiem i bezpieczeństwem

---

### Rozdział 4: Infrastructure as Code i wdrożenie (1-1.5 godziny) 🏗️
**Wymagania wstępne**: Ukończone Rozdziały 1-3  
**Poziom trudności**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeniowe
- Infrastructure as Code z Bicep
- Strategie tworzenia zasobów
- Tworzenie niestandardowych szablonów

#### Zasoby nauki
- [Deployment Guide](docs/deployment/deployment-guide.md) - Kompleksowe przepływy pracy
- [Provisioning Resources](docs/deployment/provisioning.md) - Zarządzanie zasobami
- Przykłady kontenerów i mikrousług

#### Wynik praktyczny
Wdrożenie złożonych aplikacji obejmujących wiele usług za pomocą niestandardowych szablonów infrastruktury

---

### Rozdział 5: Rozwiązania wieloagentowe AI (2-3 godziny) 🤖🤖
**Wymagania wstępne**: Ukończone Rozdziały 1-2  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury wieloagentowej
- Orkiestracja i koordynacja agentów
- Wdrożenia AI gotowe do produkcji
- Implementacje agentów klienta i magazynu

#### Zasoby nauki
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompleksowa implementacja
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Wdrożenie jednym kliknięciem
- Wzorce koordynacji wieloagentowej

#### Wynik praktyczny
Wdrożenie i zarządzanie rozwiązaniem wiel
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problemy z usługami AI

#### Praktyczny rezultat
Samodzielne diagnozowanie i rozwiązywanie typowych problemów z wdrożeniem

---

### Rozdział 8: Wzorce produkcyjne i korporacyjne (2-3 godziny) 🏢
**Wymagania wstępne**: Ukończone rozdziały 1-4  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Wzorce bezpieczeństwa korporacyjnego
- Monitorowanie i optymalizacja kosztów
- Skalowalność i zarządzanie

#### Materiały edukacyjne
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Wzorce korporacyjne
- Przykłady mikroserwisów i korporacyjnych rozwiązań
- Ramy monitorowania i zarządzania

#### Praktyczny rezultat
Wdrażanie aplikacji gotowych do pracy w środowisku korporacyjnym z pełnymi możliwościami produkcyjnymi

---

## Postęp nauki i poziom trudności

### Stopniowe budowanie umiejętności

- **🌱 Początkujący**: Rozpocznij od Rozdziału 1 (Podstawy) → Rozdział 2 (Rozwój AI)
- **🔧 Średniozaawansowany**: Rozdziały 3-4 (Konfiguracja i infrastruktura) → Rozdział 6 (Walidacja)
- **🚀 Zaawansowany**: Rozdział 5 (Rozwiązania wieloagentowe) → Rozdział 7 (Rozwiązywanie problemów)
- **🏢 Korporacyjny**: Ukończ wszystkie rozdziały, skup się na Rozdziale 8 (Wzorce produkcyjne)

### Wskaźniki poziomu trudności

- **⭐ Podstawowy**: Pojedyncze koncepcje, prowadzone samouczki, 30-60 minut
- **⭐⭐ Średniozaawansowany**: Wiele koncepcji, praktyka, 1-2 godziny  
- **⭐⭐⭐ Zaawansowany**: Złożone architektury, niestandardowe rozwiązania, 1-3 godziny
- **⭐⭐⭐⭐ Ekspert**: Systemy produkcyjne, wzorce korporacyjne, 2-4 godziny

### Elastyczne ścieżki nauki

#### 🎯 Szybka ścieżka dla deweloperów AI (4-6 godzin)
1. **Rozdział 1**: Podstawy i szybki start (45 minut)
2. **Rozdział 2**: Rozwój AI-First (2 godziny)  
3. **Rozdział 5**: Rozwiązania wieloagentowe AI (3 godziny)
4. **Rozdział 8**: Najlepsze praktyki produkcyjne AI (1 godzina)

#### 🛠️ Ścieżka specjalisty ds. infrastruktury (5-7 godzin)
1. **Rozdział 1**: Podstawy i szybki start (45 minut)
2. **Rozdział 3**: Konfiguracja i uwierzytelnianie (1 godzina)
3. **Rozdział 4**: Infrastruktura jako kod i wdrożenie (1,5 godziny)
4. **Rozdział 6**: Walidacja przed wdrożeniem i planowanie (1 godzina)
5. **Rozdział 7**: Rozwiązywanie problemów i debugowanie (1,5 godziny)
6. **Rozdział 8**: Wzorce produkcyjne i korporacyjne (2 godziny)

#### 🎓 Pełna ścieżka nauki (8-12 godzin)
Sekwencyjne ukończenie wszystkich 8 rozdziałów z praktyką i walidacją

## Ramy ukończenia kursu

### Walidacja wiedzy
- **Punkty kontrolne rozdziałów**: Ćwiczenia praktyczne z mierzalnymi rezultatami
- **Weryfikacja praktyczna**: Wdrażanie działających rozwiązań dla każdego rozdziału
- **Śledzenie postępów**: Wizualne wskaźniki i odznaki ukończenia
- **Walidacja społecznościowa**: Dzielenie się doświadczeniami na kanałach Discord Azure

### Ocena wyników nauki

#### Ukończenie Rozdziałów 1-2 (Podstawy + AI)
- ✅ Wdrożenie podstawowej aplikacji webowej za pomocą AZD
- ✅ Wdrożenie aplikacji chatowej z AI z RAG
- ✅ Zrozumienie podstawowych koncepcji AZD i integracji AI

#### Ukończenie Rozdziałów 3-4 (Konfiguracja + Infrastruktura)  
- ✅ Zarządzanie wdrożeniami w wielu środowiskach
- ✅ Tworzenie niestandardowych szablonów infrastruktury Bicep
- ✅ Implementacja bezpiecznych wzorców uwierzytelniania

#### Ukończenie Rozdziałów 5-6 (Wieloagentowe + Walidacja)
- ✅ Wdrożenie złożonego rozwiązania AI wieloagentowego
- ✅ Planowanie pojemności i optymalizacja kosztów
- ✅ Implementacja automatycznej walidacji przed wdrożeniem

#### Ukończenie Rozdziałów 7-8 (Rozwiązywanie problemów + Produkcja)
- ✅ Samodzielne rozwiązywanie problemów z wdrożeniem  
- ✅ Implementacja monitorowania i bezpieczeństwa na poziomie korporacyjnym
- ✅ Wdrożenie aplikacji gotowych do produkcji z zarządzaniem

### Certyfikacja i uznanie
- **Odznaka ukończenia kursu**: Ukończenie wszystkich 8 rozdziałów z walidacją praktyczną
- **Uznanie społecznościowe**: Aktywny udział w Discord Azure AI Foundry
- **Rozwój zawodowy**: Umiejętności wdrożeniowe AZD i AI na poziomie korporacyjnym
- **Awans zawodowy**: Zdolności do wdrożeń chmurowych na poziomie korporacyjnym

## 🎓 Kompleksowe wyniki nauki

### Poziom podstawowy (Rozdziały 1-2)
Po ukończeniu rozdziałów podstawowych, uczestnicy będą wykazywać:

**Umiejętności techniczne:**
- Wdrożenie prostych aplikacji webowych na Azure za pomocą poleceń AZD
- Konfiguracja i wdrożenie aplikacji chatowej z AI i funkcjami RAG
- Zrozumienie podstawowych koncepcji AZD: szablony, środowiska, przepływy provisioningowe
- Integracja usług Azure AI Foundry z wdrożeniami AZD
- Nawigacja po konfiguracjach usług Azure AI i punktach API

**Umiejętności zawodowe:**
- Stosowanie ustrukturyzowanych przepływów wdrożeniowych dla spójnych wyników
- Rozwiązywanie podstawowych problemów z wdrożeniem za pomocą logów i dokumentacji
- Skuteczna komunikacja na temat procesów wdrożeniowych w chmurze
- Stosowanie najlepszych praktyk w zakresie integracji usług AI

**Walidacja nauki:**
- ✅ Pomyślne wdrożenie szablonu `todo-nodejs-mongo`
- ✅ Wdrożenie i konfiguracja `azure-search-openai-demo` z RAG
- ✅ Ukończenie interaktywnych ćwiczeń warsztatowych (Faza odkrywania)
- ✅ Udział w dyskusjach społecznościowych na Discord Azure

### Poziom średniozaawansowany (Rozdziały 3-4)
Po ukończeniu rozdziałów średniozaawansowanych, uczestnicy będą wykazywać:

**Umiejętności techniczne:**
- Zarządzanie wdrożeniami w wielu środowiskach (dev, staging, produkcja)
- Tworzenie niestandardowych szablonów Bicep dla infrastruktury jako kodu
- Implementacja bezpiecznych wzorców uwierzytelniania z użyciem zarządzanej tożsamości
- Wdrożenie złożonych aplikacji wielousługowych z niestandardowymi konfiguracjami
- Optymalizacja strategii provisioningowych pod kątem kosztów i wydajności

**Umiejętności zawodowe:**
- Projektowanie skalowalnych architektur infrastruktury
- Implementacja najlepszych praktyk bezpieczeństwa dla wdrożeń w chmurze
- Dokumentowanie wzorców infrastruktury dla współpracy zespołowej
- Ocena i wybór odpowiednich usług Azure dla wymagań

**Walidacja nauki:**
- ✅ Konfiguracja oddzielnych środowisk z ustawieniami specyficznymi dla środowiska
- ✅ Tworzenie i wdrożenie niestandardowego szablonu Bicep dla aplikacji wielousługowej
- ✅ Implementacja uwierzytelniania zarządzanej tożsamości dla bezpiecznego dostępu
- ✅ Ukończenie ćwiczeń zarządzania konfiguracją w rzeczywistych scenariuszach

### Poziom zaawansowany (Rozdziały 5-6)
Po ukończeniu rozdziałów zaawansowanych, uczestnicy będą wykazywać:

**Umiejętności techniczne:**
- Wdrożenie i orkiestracja rozwiązań AI wieloagentowych z skoordynowanymi przepływami pracy
- Implementacja architektur agentów klienta i magazynu dla scenariuszy detalicznych
- Przeprowadzenie kompleksowego planowania pojemności i walidacji zasobów
- Wykonanie automatycznej walidacji przed wdrożeniem i optymalizacji
- Projektowanie opłacalnych wyborów SKU na podstawie wymagań obciążenia

**Umiejętności zawodowe:**
- Projektowanie złożonych rozwiązań AI dla środowisk produkcyjnych
- Prowadzenie dyskusji technicznych na temat strategii wdrożeniowych AI
- Mentoring młodszych deweloperów w najlepszych praktykach AZD i wdrożeń AI
- Ocena i rekomendowanie wzorców architektury AI dla wymagań biznesowych

**Walidacja nauki:**
- ✅ Wdrożenie kompletnego rozwiązania detalicznego wieloagentowego z szablonami ARM
- ✅ Demonstracja koordynacji agentów i orkiestracji przepływów pracy
- ✅ Ukończenie ćwiczeń planowania pojemności z rzeczywistymi ograniczeniami zasobów
- ✅ Walidacja gotowości do wdrożenia poprzez automatyczne kontrole przed wdrożeniem

### Poziom ekspercki (Rozdziały 7-8)
Po ukończeniu rozdziałów eksperckich, uczestnicy będą wykazywać:

**Umiejętności techniczne:**
- Diagnozowanie i rozwiązywanie złożonych problemów z wdrożeniem samodzielnie
- Implementacja wzorców bezpieczeństwa na poziomie korporacyjnym i ram zarządzania
- Projektowanie kompleksowych strategii monitorowania i alertowania
- Optymalizacja wdrożeń produkcyjnych pod kątem skali, kosztów i wydajności
- Ustanowienie pipeline'ów CI/CD z odpowiednimi testami i walidacją

**Umiejętności zawodowe:**
- Prowadzenie inicjatyw transformacji chmurowej na poziomie korporacyjnym
- Projektowanie i implementacja standardów wdrożeniowych organizacji
- Szkolenie i mentoring zespołów deweloperskich w zaawansowanych praktykach AZD
- Wpływanie na decyzje techniczne dotyczące wdrożeń AI na poziomie korporacyjnym

**Walidacja nauki:**
- ✅ Rozwiązywanie złożonych problemów z wdrożeniem wielousługowym
- ✅ Implementacja wzorców bezpieczeństwa korporacyjnego zgodnych z wymaganiami
- ✅ Projektowanie i wdrożenie monitorowania produkcji z Application Insights
- ✅ Ukończenie implementacji ram zarządzania korporacyjnego

## 🎯 Certyfikacja ukończenia kursu

### Ramy śledzenia postępów
Śledź swoje postępy w nauce poprzez ustrukturyzowane punkty kontrolne:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Rozwój AI-First ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Rozwiązania wieloagentowe AI ✅
- [ ] **Rozdział 6**: Walidacja przed wdrożeniem i planowanie ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Wzorce produkcyjne i korporacyjne ✅

### Proces weryfikacji
Po ukończeniu każdego rozdziału, zweryfikuj swoją wiedzę poprzez:

1. **Ukończenie ćwiczeń praktycznych**: Wdrożenie działających rozwiązań dla każdego rozdziału
2. **Ocena wiedzy**: Przegląd sekcji FAQ i ukończenie samooceny
3. **Zaangażowanie społecznościowe**: Dzielenie się doświadczeniami i uzyskiwanie opinii na Discord Azure
4. **Rozwój portfolio**: Dokumentowanie wdrożeń i zdobytych lekcji
5. **Recenzja rówieśnicza**: Współpraca z innymi uczestnikami w złożonych scenariuszach

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów z weryfikacją, absolwenci będą posiadać:

**Ekspertyza techniczna:**
- **Doświadczenie produkcyjne**: Wdrożenie rzeczywistych aplikacji AI w środowiskach Azure
- **Umiejętności zawodowe**: Zdolności do wdrożeń i rozwiązywania problemów na poziomie korporacyjnym  
- **Wiedza architektoniczna**: Rozwiązania AI wieloagentowe i złożone wzorce infrastruktury
- **Mistrzostwo w rozwiązywaniu problemów**: Samodzielne rozwiązywanie problemów z wdrożeniem i konfiguracją

**Rozwój zawodowy:**
- **Uznanie w branży**: Zweryfikowane umiejętności w obszarach AZD i wdrożeń AI o wysokim zapotrzebowaniu
- **Awans zawodowy**: Kwalifikacje do ról architekta chmurowego i specjalisty ds. wdrożeń AI
- **Przywództwo społecznościowe**: Aktywne członkostwo w społecznościach deweloperów Azure i AI
- **Ciągłe uczenie się**: Podstawa do zaawansowanej specjalizacji w Azure AI Foundry

**Zasoby portfolio:**
- **Wdrożone rozwiązania**: Działające przykłady aplikacji AI i wzorców infrastruktury
- **Dokumentacja**: Kompleksowe przewodniki wdrożeniowe i procedury rozwiązywania problemów  
- **Wkład społecznościowy**: Dyskusje, przykłady i ulepszenia udostępnione społeczności Azure
- **Sieć zawodowa**: Połączenia z ekspertami Azure i praktykami wdrożeń AI

### Ścieżka nauki po kursie
Absolwenci są przygotowani do zaawansowanej specjalizacji w:
- **Azure AI Foundry Expert**: Głębokiej specjalizacji w zakresie wdrożeń modeli AI i orkiestracji
- **Przywództwo architektury chmurowej**: Projektowanie wdrożeń na skalę korporacyjną i zarządzanie
- **Przywództwo społeczności deweloperów**: Wkład w próbki Azure i zasoby społecznościowe
- **Szkolenia korporacyjne**: Nauczanie umiejętności AZD i wdrożeń AI w organizacjach

---

