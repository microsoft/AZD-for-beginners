# AZD dla Początkujących: Plan Kursu i Ramy Nauki

## Przegląd Kursu

Opanuj Azure Developer CLI (azd) dzięki uporządkowanym rozdziałom zaprojektowanym do stopniowego uczenia się. **Szczególny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla nowoczesnych programistów

Na podstawie spostrzeżeń społeczności Microsoft Foundry Discord, **45% programistów chce używać AZD do obciążeń AI**, ale napotyka trudności z:
- Złożonymi architekturami AI obejmującymi wiele usług
- Najlepszymi praktykami wdrażania AI w środowisku produkcyjnym  
- Integracją i konfiguracją usług Azure AI
- Optymalizacją kosztów dla obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

### Główne Cele Nauki

Po ukończeniu tego kursu:
- **Opanujesz podstawy AZD**: Kluczowe koncepcje, instalacja i konfiguracja
- **Wdrożysz aplikacje AI**: Użycie AZD z usługami Microsoft Foundry
- **Zaimplementujesz Infrastrukturę jako Kod**: Zarządzanie zasobami Azure za pomocą szablonów Bicep
- **Rozwiążesz problemy z wdrożeniami**: Rozwiązywanie typowych problemów i debugowanie
- **Zoptymalizujesz środowisko produkcyjne**: Bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Zbudujesz rozwiązania wieloagentowe**: Wdrożenie złożonych architektur AI

## 🎓 Doświadczenie Warsztatowe

### Elastyczne Opcje Nauki
Kurs został zaprojektowany tak, aby wspierać zarówno **samodzielną naukę**, jak i **warsztaty prowadzone przez instruktorów**, umożliwiając uczestnikom zdobycie praktycznych umiejętności dzięki interaktywnym ćwiczeniom.

#### 🚀 Tryb Samodzielnej Nauki
**Idealny dla indywidualnych programistów i ciągłego rozwoju**

**Funkcje:**
- **Interfejs przeglądarkowy**: Warsztat oparty na MkDocs dostępny przez dowolną przeglądarkę
- **Integracja z GitHub Codespaces**: Jedno kliknięcie do środowiska deweloperskiego z prekonfigurowanymi narzędziami
- **Interaktywne środowisko DevContainer**: Brak potrzeby lokalnej konfiguracji - zacznij kodować od razu
- **Śledzenie postępów**: Wbudowane punkty kontrolne i ćwiczenia walidacyjne
- **Wsparcie społeczności**: Dostęp do kanałów Azure Discord w celu zadawania pytań i współpracy

**Struktura Nauki:**
- **Elastyczny czas**: Ukończ rozdziały we własnym tempie w ciągu dni lub tygodni
- **System punktów kontrolnych**: Weryfikuj postępy przed przejściem do bardziej złożonych tematów
- **Biblioteka zasobów**: Obszerna dokumentacja, przykłady i przewodniki rozwiązywania problemów
- **Rozwój portfolio**: Twórz projekty do wdrożenia w swoim portfolio zawodowym

**Rozpoczęcie (Samodzielna Nauka):**
```bash
# Opcja 1: GitHub Codespaces (Zalecane)
# Przejdź do repozytorium i kliknij "Code" → "Create codespace on main"

# Opcja 2: Lokalny rozwój
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postępuj zgodnie z instrukcjami konfiguracji w workshop/README.md
```

#### 🏛️ Warsztaty Prowadzone przez Instruktorów
**Idealne dla szkoleń korporacyjnych, bootcampów i instytucji edukacyjnych**

**Opcje Formatu Warsztatów:**

**📚 Integracja z Kursem Akademickim (8-12 tygodni)**
- **Programy uniwersyteckie**: Kurs semestralny z cotygodniowymi 2-godzinnymi sesjami
- **Format Bootcampu**: Intensywny program 3-5 dniowy z codziennymi sesjami 6-8 godzin
- **Szkolenia korporacyjne**: Miesięczne sesje zespołowe z praktyczną realizacją projektów
- **Ramy oceny**: Zadania oceniane, recenzje koleżeńskie i projekty końcowe

**🚀 Intensywny Warsztat (1-3 dni)**
- **Dzień 1**: Podstawy + Rozwój AI (Rozdziały 1-2) - 6 godzin
- **Dzień 2**: Konfiguracja + Infrastruktura (Rozdziały 3-4) - 6 godzin  
- **Dzień 3**: Zaawansowane Wzorce + Produkcja (Rozdziały 5-8) - 8 godzin
- **Follow-up**: Opcjonalne 2-tygodniowe mentorskie wsparcie dla ukończenia projektu

**⚡ Briefing dla Kadry Zarządzającej (4-6 godzin)**
- **Przegląd Strategiczny**: Wartość AZD i wpływ na biznes (1 godzina)
- **Praktyczny Demo**: Wdrożenie aplikacji AI od początku do końca (2 godziny)
- **Przegląd Architektury**: Wzorce korporacyjne i zarządzanie (1 godzina)
- **Planowanie Wdrożenia**: Strategia adopcji w organizacji (1-2 godziny)

#### 🛠️ Metodologia Nauki w Warsztatach
**Odkrywanie → Wdrożenie → Dostosowanie jako podejście do praktycznego rozwoju umiejętności**

**Faza 1: Odkrywanie (45 minut)**
- **Eksploracja Szablonów**: Ocena szablonów i usług Azure AI Foundry
- **Analiza Architektury**: Zrozumienie wzorców wieloagentowych i strategii wdrożenia
- **Ocena Wymagań**: Identyfikacja potrzeb i ograniczeń organizacyjnych
- **Konfiguracja Środowiska**: Ustawienie środowiska deweloperskiego i zasobów Azure

**Faza 2: Wdrożenie (2 godziny)**
- **Wdrożenie z Przewodnikiem**: Krok po kroku wdrożenie aplikacji AI z AZD
- **Konfiguracja Usług**: Konfiguracja usług Azure AI, punktów końcowych i uwierzytelniania
- **Implementacja Bezpieczeństwa**: Zastosowanie wzorców bezpieczeństwa korporacyjnego i kontroli dostępu
- **Testowanie Walidacyjne**: Weryfikacja wdrożeń i rozwiązywanie typowych problemów

**Faza 3: Dostosowanie (45 minut)**
- **Modyfikacja Aplikacji**: Dostosowanie szablonów do specyficznych przypadków użycia i wymagań
- **Optymalizacja Produkcji**: Wdrożenie monitorowania, zarządzania kosztami i strategii skalowania
- **Zaawansowane Wzorce**: Eksploracja koordynacji wieloagentowej i złożonych architektur
- **Planowanie Następnych Kroków**: Definiowanie ścieżki nauki dla dalszego rozwoju umiejętności

#### 🎯 Wyniki Nauki w Warsztatach
**Mierzalne umiejętności rozwijane poprzez praktykę**

**Kompetencje Techniczne:**
- **Wdrożenie Aplikacji AI w Produkcji**: Skuteczne wdrożenie i konfiguracja rozwiązań opartych na AI
- **Mistrzostwo w Infrastrukturze jako Kod**: Tworzenie i zarządzanie niestandardowymi szablonami Bicep
- **Architektura Wieloagentowa**: Implementacja skoordynowanych rozwiązań AI
- **Gotowość Produkcyjna**: Zastosowanie wzorców bezpieczeństwa, monitorowania i zarządzania
- **Ekspertyza w Rozwiązywaniu Problemów**: Samodzielne rozwiązywanie problemów z wdrożeniem i konfiguracją

**Umiejętności Zawodowe:**
- **Przywództwo Projektowe**: Prowadzenie zespołów technicznych w inicjatywach wdrożeniowych w chmurze
- **Projektowanie Architektury**: Projektowanie skalowalnych, opłacalnych rozwiązań Azure
- **Transfer Wiedzy**: Szkolenie i mentoring współpracowników w najlepszych praktykach AZD
- **Planowanie Strategiczne**: Wpływanie na strategie adopcji chmury w organizacji

#### 📋 Zasoby i Materiały Warsztatowe
**Kompleksowy zestaw narzędzi dla instruktorów i uczestników**

**Dla Instruktorów:**
- **Przewodnik dla Instruktora**: [Przewodnik Prowadzenia Warsztatów](workshop/docs/instructor-guide.md) - Planowanie sesji i wskazówki dotyczące prowadzenia
- **Materiały Prezentacyjne**: Slajdy, diagramy architektury i skrypty demonstracyjne
- **Narzędzia Oceny**: Ćwiczenia praktyczne, testy wiedzy i rubryki oceny
- **Konfiguracja Techniczna**: Ustawienia środowiska, przewodniki rozwiązywania problemów i plany awaryjne

**Dla Uczestników:**
- **Interaktywne Środowisko Warsztatowe**: [Materiały Warsztatowe](workshop/README.md) - Platforma nauki w przeglądarce
- **Instrukcje Krok po Kroku**: [Ćwiczenia z Przewodnikiem](../../workshop/docs/instructions) - Szczegółowe instrukcje wdrożeniowe  
- **Dokumentacja Referencyjna**: [Laboratorium Warsztatowe AI](docs/ai-foundry/ai-workshop-lab.md) - Dogłębne analizy skoncentrowane na AI
- **Zasoby Społecznościowe**: Kanały Azure Discord, dyskusje na GitHub i wsparcie ekspertów

#### 🏢 Wdrożenie Warsztatów w Przedsiębiorstwach
**Strategie wdrażania i szkolenia w organizacjach**

**Programy Szkoleniowe dla Firm:**
- **Onboarding Programistów**: Wprowadzenie nowych pracowników w podstawy AZD (2-4 tygodnie)
- **Podnoszenie Kwalifikacji Zespołów**: Kwartalne warsztaty dla istniejących zespołów deweloperskich (1-2 dni)
- **Przegląd Architektury**: Miesięczne sesje dla starszych inżynierów i architektów (4 godziny)
- **Briefingi dla Kadry Zarządzającej**: Warsztaty dla decydentów technicznych (pół dnia)

**Wsparcie Wdrożeniowe:**
- **Projektowanie Warsztatów na Zamówienie**: Treści dostosowane do specyficznych potrzeb organizacji
- **Zarządzanie Programem Pilotażowym**: Strukturalne wdrożenie z metrykami sukcesu i pętlami informacji zwrotnej  
- **Ciągły Mentoring**: Wsparcie po warsztatach dla realizacji projektów
- **Budowanie Społeczności**: Wewnętrzne społeczności deweloperów Azure AI i dzielenie się wiedzą

**Metryki Sukcesu:**
- **Zdobycie Umiejętności**: Oceny przed/po mierzące wzrost kompetencji technicznych
- **Sukces Wdrożenia**: Procent uczestników skutecznie wdrażających aplikacje produkcyjne
- **Czas do Produktywności**: Skrócony czas wdrożenia nowych projektów Azure AI
- **Retencja Wiedzy**: Oceny kontrolne 3-6 miesięcy po warsztatach

## Struktura Nauki w 8 Rozdziałach

### Rozdział 1: Podstawy i Szybki Start (30-45 minut) 🌱
**Wymagania wstępne**: Subskrypcja Azure, podstawowa znajomość wiersza poleceń  
**Złożoność**: ⭐

#### Czego się Nauczysz
- Zrozumienie podstaw Azure Developer CLI
- Instalacja AZD na Twojej platformie  
- Twoje pierwsze udane wdrożenie
- Kluczowe koncepcje i terminologia

#### Zasoby Nauki
- [Podstawy AZD](docs/getting-started/azd-basics.md) - Kluczowe koncepcje
- [Instalacja i Konfiguracja](docs/getting-started/installation.md) - Przewodniki specyficzne dla platformy
- [Twój Pierwszy Projekt](docs/getting-started/first-project.md) - Samouczek praktyczny
- [Arkusz Skrótów Poleceń](resources/cheat-sheet.md) - Szybkie odniesienie

#### Wynik Praktyczny
Pomyślne wdrożenie prostej aplikacji internetowej na Azure za pomocą AZD

---

### Rozdział 2: Rozwój AI-First (1-2 godziny) 🤖
**Wymagania wstępne**: Ukończony Rozdział 1  
**Złożoność**: ⭐⭐

#### Czego się Nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji opartych na AI
- Zrozumienie konfiguracji usług AI
- Wzorce RAG (Retrieval-Augmented Generation)

#### Zasoby Nauki
- [Integracja Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Wdrożenie Modelu AI](docs/microsoft-foundry/ai-model-deployment.md)
- [Laboratorium Warsztatowe AI](docs/microsoft-foundry/ai-workshop-lab.md) - **NOWE**: Kompleksowe laboratorium praktyczne na 2-3 godziny
- [Przewodnik Warsztatowy](workshop/README.md) - **NOWE**: Warsztat w przeglądarce z podglądem MkDocs
- [Szablony Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Instrukcje Warsztatowe](../../workshop/docs/instructions) - **NOWE**: Ćwiczenia z przewodnikiem krok po kroku

#### Wynik Praktyczny
Wdrożenie i konfiguracja aplikacji czatu opartej na AI z funkcjami RAG

#### Ścieżka Nauki Warsztatowej (Opcjonalne Rozszerzenie)
**NOWE Interaktywne Doświadczenie**: [Kompletny Przewodnik Warsztatowy](workshop/README.md)
1. **Odkrywanie** (30 min): Wybór i ocena szablonów
2. **Wdrożenie** (45 min): Wdrożenie i walidacja funkcjonalności szablonu AI  
3. **Dekonstrukcja** (30 min): Zrozumienie architektury i komponentów szablonu
4. **Konfiguracja** (30 min): Dostosowanie ustawień i parametrów
5. **Dostosowanie** (45 min): Modyfikacja i iteracja, aby dostosować do własnych potrzeb
6. **Usuwanie** (15 min): Czyszczenie zasobów i zrozumienie cyklu życia
7. **Podsumowanie** (15 min): Następne kroki i zaawansowane ścieżki nauki

--- 

### Rozdział 3: Konfiguracja i Uwierzytelnianie (45-60 minut) ⚙️
**Wymagania wstępne**: Ukończony Rozdział 1  
**Złożoność**: ⭐⭐

#### Czego się Nauczysz
- Konfiguracja i zarządzanie środowiskiem
- Najlepsze praktyki w zakresie uwierzytelniania i bezpieczeństwa
- Nazewnictwo i organizacja zasobów
- Wdrożenia w wielu środowiskach

#### Zasoby Nauki
- [Przewodnik Konfiguracji](docs/getting-started/configuration.md) - Ustawienia środowiska
- [Wzorce Uwierzytelniania i Bezpieczeństwa](docs/getting-started/authsecurity.md) - Integracja z Managed Identity i Key Vault
- Przykłady dla wielu środowisk

#### Wynik Praktyczny
Zarządzanie wieloma środowiskami z odpowiednim uwierzytelnianiem i bezpieczeństwem

---

### Rozdział 4: Infrastruktura jako Kod i Wdrożenie (1-1,5 godziny) 🏗️
**Wymagania wstępne**: Ukończone Rozdziały 1-3  
**Złożoność**: ⭐⭐⭐

#### Czego się Nauczysz
- Zaawansowane wzorce wdrożeniowe
- Infrastruktura jako Kod z Bicep
- Strategie udostępniania zasobów
- Tworzenie niestandardowych szablonów

- Wdrożenie aplikacji konteneryzowanych z Azure Container Apps i AZD

#### Zasoby Nauki
- [Przewodnik Wdrożeniowy](docs/deployment/deployment-guide.md) - Kompleksowe przepływy pracy
- [Udostępnianie Zasobów](docs/deployment/provisioning.md) - Zarządzanie zasobami
- Przykłady kontenerów i mikrousług
- [Przykłady Aplikacji Kontenerowych](examples/container-app/README.md) - Szybki start, produkcja i zaawansowane wzorce wdrożeniowe

#### Wyn
Walidacja i optymalizacja wdrożeń przed wykonaniem

---

### Rozdział 7: Rozwiązywanie problemów i debugowanie (1-1,5 godziny) 🔧  
**Wymagania wstępne**: Ukończony dowolny rozdział dotyczący wdrożeń  
**Poziom trudności**: ⭐⭐  

#### Czego się nauczysz  
- Systematyczne podejście do debugowania  
- Typowe problemy i ich rozwiązania  
- Rozwiązywanie problemów specyficznych dla AI  
- Optymalizacja wydajności  

#### Materiały edukacyjne  
- [Typowe problemy](docs/troubleshooting/common-issues.md) - FAQ i rozwiązania  
- [Przewodnik debugowania](docs/troubleshooting/debugging.md) - Strategie krok po kroku  
- [Rozwiązywanie problemów specyficznych dla AI](docs/troubleshooting/ai-troubleshooting.md) - Problemy z usługami AI  

#### Efekt praktyczny  
Samodzielne diagnozowanie i rozwiązywanie typowych problemów związanych z wdrożeniami  

---

### Rozdział 8: Wzorce produkcyjne i korporacyjne (2-3 godziny) 🏢  
**Wymagania wstępne**: Ukończone rozdziały 1-4  
**Poziom trudności**: ⭐⭐⭐⭐  

#### Czego się nauczysz  
- Strategie wdrożeń produkcyjnych  
- Wzorce bezpieczeństwa korporacyjnego  
- Monitorowanie i optymalizacja kosztów  
- Skalowalność i zarządzanie  

- Najlepsze praktyki dla wdrożeń aplikacji kontenerowych w środowisku produkcyjnym (bezpieczeństwo, monitorowanie, koszty, CI/CD)  

#### Materiały edukacyjne  
- [Najlepsze praktyki AI w produkcji](docs/microsoft-foundry/production-ai-practices.md) - Wzorce korporacyjne  
- Przykłady mikroserwisów i korporacyjne  
- Ramy monitorowania i zarządzania  
- [Przykład architektury mikroserwisów](../../examples/container-app/microservices) - Wdrożenie blue-green/canary, śledzenie rozproszone i optymalizacja kosztów  

#### Efekt praktyczny  
Wdrożenie aplikacji gotowych do produkcji z pełnymi możliwościami korporacyjnymi  

---

## Postęp nauki i poziom trudności  

### Stopniowe budowanie umiejętności  

- **🌱 Początkujący**: Rozpocznij od Rozdziału 1 (Podstawy) → Rozdział 2 (Rozwój AI)  
- **🔧 Średniozaawansowany**: Rozdziały 3-4 (Konfiguracja i infrastruktura) → Rozdział 6 (Walidacja)  
- **🚀 Zaawansowany**: Rozdział 5 (Rozwiązania wieloagentowe) → Rozdział 7 (Rozwiązywanie problemów)  
- **🏢 Korporacyjny**: Ukończ wszystkie rozdziały, skup się na Rozdziale 8 (Wzorce produkcyjne)  

- **Ścieżka aplikacji kontenerowych**: Rozdziały 4 (Wdrożenie konteneryzowane), 5 (Integracja mikroserwisów), 8 (Najlepsze praktyki produkcyjne)  

### Wskaźniki poziomu trudności  

- **⭐ Podstawowy**: Pojedyncze koncepcje, samouczki z przewodnikiem, 30-60 minut  
- **⭐⭐ Średniozaawansowany**: Wiele koncepcji, praktyka, 1-2 godziny  
- **⭐⭐⭐ Zaawansowany**: Złożone architektury, niestandardowe rozwiązania, 1-3 godziny  
- **⭐⭐⭐⭐ Ekspert**: Systemy produkcyjne, wzorce korporacyjne, 2-4 godziny  

### Elastyczne ścieżki nauki  

#### 🎯 Szybka ścieżka dla deweloperów AI (4-6 godzin)  
1. **Rozdział 1**: Podstawy i szybki start (45 minut)  
2. **Rozdział 2**: Rozwój AI (2 godziny)  
3. **Rozdział 5**: Rozwiązania wieloagentowe AI (3 godziny)  
4. **Rozdział 8**: Najlepsze praktyki AI w produkcji (1 godzina)  

#### 🛠️ Ścieżka specjalisty ds. infrastruktury (5-7 godzin)  
1. **Rozdział 1**: Podstawy i szybki start (45 minut)  
2. **Rozdział 3**: Konfiguracja i uwierzytelnianie (1 godzina)  
3. **Rozdział 4**: Infrastruktura jako kod i wdrożenie (1,5 godziny)  
4. **Rozdział 6**: Walidacja i planowanie przed wdrożeniem (1 godzina)  
5. **Rozdział 7**: Rozwiązywanie problemów i debugowanie (1,5 godziny)  
6. **Rozdział 8**: Wzorce produkcyjne i korporacyjne (2 godziny)  

#### 🎓 Pełna ścieżka nauki (8-12 godzin)  
Sekwencyjne ukończenie wszystkich 8 rozdziałów z praktyką i walidacją  

## Ramy ukończenia kursu  

### Walidacja wiedzy  
- **Punkty kontrolne rozdziałów**: Ćwiczenia praktyczne z mierzalnymi wynikami  
- **Weryfikacja praktyczna**: Wdrożenie działających rozwiązań dla każdego rozdziału  
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
- ✅ Samodzielne debugowanie i rozwiązywanie problemów z wdrożeniami  
- ✅ Implementacja monitorowania i bezpieczeństwa na poziomie korporacyjnym  
- ✅ Wdrożenie aplikacji gotowych do produkcji z zarządzaniem  

### Certyfikacja i uznanie  
- **Odznaka ukończenia kursu**: Ukończenie wszystkich 8 rozdziałów z walidacją praktyczną  
- **Uznanie społecznościowe**: Aktywny udział w Discord Microsoft Foundry  
- **Rozwój zawodowy**: Umiejętności wdrożeń AZD i AI na poziomie korporacyjnym  
- **Awans zawodowy**: Zdolności do wdrożeń chmurowych gotowych do produkcji  

## 🎓 Kompleksowe wyniki nauki  

### Poziom podstawowy (Rozdziały 1-2)  
Po ukończeniu rozdziałów podstawowych, uczestnicy będą wykazywać:  

**Umiejętności techniczne:**  
- Wdrożenie prostych aplikacji webowych na Azure za pomocą poleceń AZD  
- Konfiguracja i wdrożenie aplikacji chatowych z AI i funkcjami RAG  
- Zrozumienie podstawowych koncepcji AZD: szablony, środowiska, przepływy provisioningowe  
- Integracja usług Microsoft Foundry z wdrożeniami AZD  
- Nawigacja po konfiguracjach usług Azure AI i punktach API  

**Umiejętności zawodowe:**  
- Stosowanie ustrukturyzowanych przepływów wdrożeniowych dla spójnych wyników  
- Rozwiązywanie podstawowych problemów z wdrożeniami za pomocą logów i dokumentacji  
- Skuteczna komunikacja na temat procesów wdrożeniowych w chmurze  
- Stosowanie najlepszych praktyk w zakresie integracji bezpiecznych usług AI  

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
- Implementacja bezpiecznych wzorców uwierzytelniania z zarządzaną tożsamością  
- Wdrożenie złożonych aplikacji wielousługowych z niestandardowymi konfiguracjami  
- Optymalizacja strategii provisioningowych dla kosztów i wydajności  

**Umiejętności zawodowe:**  
- Projektowanie skalowalnych architektur infrastruktury  
- Implementacja najlepszych praktyk bezpieczeństwa dla wdrożeń w chmurze  
- Dokumentowanie wzorców infrastruktury dla współpracy zespołowej  
- Ocena i wybór odpowiednich usług Azure dla wymagań  

**Walidacja nauki:**  
- ✅ Konfiguracja oddzielnych środowisk z ustawieniami specyficznymi dla środowiska  
- ✅ Tworzenie i wdrożenie niestandardowego szablonu Bicep dla aplikacji wielousługowej  
- ✅ Implementacja uwierzytelniania zarządzaną tożsamością dla bezpiecznego dostępu  
- ✅ Ukończenie ćwiczeń zarządzania konfiguracją w rzeczywistych scenariuszach  

### Poziom zaawansowany (Rozdziały 5-6)  
Po ukończeniu rozdziałów zaawansowanych, uczestnicy będą wykazywać:  

**Umiejętności techniczne:**  
- Wdrożenie i orkiestracja rozwiązań AI wieloagentowych z skoordynowanymi przepływami pracy  
- Implementacja architektur agentów Klienta i Magazynu dla scenariuszy detalicznych  
- Przeprowadzenie kompleksowego planowania pojemności i walidacji zasobów  
- Wykonanie automatycznej walidacji przed wdrożeniem i optymalizacji  
- Projektowanie opłacalnych wyborów SKU na podstawie wymagań obciążenia  

**Umiejętności zawodowe:**  
- Projektowanie złożonych rozwiązań AI dla środowisk produkcyjnych  
- Prowadzenie dyskusji technicznych na temat strategii wdrożeń AI  
- Mentoring młodszych deweloperów w najlepszych praktykach AZD i wdrożeń AI  
- Ocena i rekomendacja wzorców architektury AI dla wymagań biznesowych  

**Walidacja nauki:**  
- ✅ Wdrożenie kompletnego rozwiązania detalicznego wieloagentowego za pomocą szablonów ARM  
- ✅ Demonstracja koordynacji agentów i orkiestracji przepływów pracy  
- ✅ Ukończenie ćwiczeń planowania pojemności z rzeczywistymi ograniczeniami zasobów  
- ✅ Walidacja gotowości do wdrożenia za pomocą automatycznych kontroli przed wdrożeniem  

### Poziom ekspercki (Rozdziały 7-8)  
Po ukończeniu rozdziałów eksperckich, uczestnicy będą wykazywać:  

**Umiejętności techniczne:**  
- Diagnozowanie i rozwiązywanie złożonych problemów z wdrożeniami samodzielnie  
- Implementacja wzorców bezpieczeństwa na poziomie korporacyjnym i ram zarządzania  
- Projektowanie kompleksowych strategii monitorowania i alertowania  
- Optymalizacja wdrożeń produkcyjnych pod kątem skalowalności, kosztów i wydajności  
- Tworzenie pipeline'ów CI/CD z odpowiednimi testami i walidacją  

**Umiejętności zawodowe:**  
- Prowadzenie inicjatyw transformacji chmurowej na poziomie korporacyjnym  
- Projektowanie i implementacja standardów wdrożeniowych organizacji  
- Szkolenie i mentoring zespołów deweloperskich w zaawansowanych praktykach AZD  
- Wpływanie na decyzje techniczne dotyczące wdrożeń AI na poziomie korporacyjnym  

**Walidacja nauki:**  
- ✅ Rozwiązywanie złożonych problemów z wdrożeniami wielousługowymi  
- ✅ Implementacja wzorców bezpieczeństwa korporacyjnego zgodnych z wymaganiami  
- ✅ Projektowanie i wdrożenie monitorowania produkcji za pomocą Application Insights  
- ✅ Ukończenie implementacji ram zarządzania na poziomie korporacyjnym  

## 🎯 Certyfikacja ukończenia kursu  

### Ramy śledzenia postępów  
Śledź swoje postępy w nauce poprzez ustrukturyzowane punkty kontrolne:  

- [ ] **Rozdział 1**: Podstawy i szybki start ✅  
- [ ] **Rozdział 2**: Rozwój AI ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅  
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅  
- [ ] **Rozdział 5**: Rozwiązania wieloagentowe AI ✅  
- [ ] **Rozdział 6**: Walidacja i planowanie przed wdrożeniem ✅  
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅  
- [ ] **Rozdział 8**: Wzorce produkcyjne i korporacyjne ✅  

### Proces weryfikacji  
Po ukończeniu każdego rozdziału, zweryfikuj swoją wiedzę poprzez:  

1. **Ukończenie ćwiczeń praktycznych**: Wdrożenie działających rozwiązań dla każdego rozdziału  
2. **Ocena wiedzy**: Przegląd sekcji FAQ i ukończenie samooceny  
3. **Zaangażowanie społecznościowe**: Dzielenie się doświadczeniami i uzyskiwanie opinii na Discord Azure  
4. **Rozwój portfolio**: Dokumentowanie swoich wdrożeń i zdobytych lekcji  
5. **Recenzja rówieśnicza**: Współpraca z innymi uczestnikami nad złożonymi scenariuszami  

### Korzyści z ukończenia kursu  
Po ukończeniu wszystkich rozdziałów z weryfikacją, absolwenci będą posiadać:  

**Ekspertyza techniczna:**  
- **Doświadczenie produkcyjne**: Wdrożenie rzeczywistych aplikacji AI w środowiskach Azure  
- **Umiejętności zawodowe**: Zdolności do wdrożeń i rozwiązywania problemów na poziomie korporacyjnym  
- **Wiedza architektoniczna**: Rozwiązania AI wieloagentowe i złożone wzorce infrastruktury  
- **Mistrzostwo w rozwiązywaniu problemów**: Samodzielne rozwiązywanie problemów z wdrożeniami i konfiguracją  

**Rozwój zawodowy:**  
- **Uznanie w branży**: Zweryfikowane umiejętności w obszarach AZD i wdrożeń AI o dużym zapotrzebowaniu  
- **Awans zawodowy**: Kwalifikacje do ról architekta chmurowego i specjalisty ds. wdrożeń AI  
- **Przywództwo społecznościowe**: Aktywne członkostwo w społecznościach deweloperów Azure i AI  
- **Ciągłe uczenie się**: Podstawa do zaawansowanej specjalizacji w Microsoft Foundry  

**Zasoby portfolio:**  
- **Wdrożone rozwiązania**: Działające przykłady aplikacji AI i wzorców infrastruktury  
- **Dokumentacja**: Kompleksowe przewodniki wdrożeniowe i procedury rozwiązywania problemów  
- **Wkład społecznościowy**: Dyskusje, przykłady i ulepszenia udostępnione społeczności Azure  
- **Sieć zawodowa**: Połączenia z ekspertami Azure i praktykami wdrożeń AI  

### Ścieżka nauki po kursie  
Absolwenci są przygotowani do zaawansowanej specjalizacji w:  
- **Ekspert Microsoft Foundry**: Głęboka specjalizacja w wdrożeniach modeli AI i orkiestracji  
- **Przywództwo w architekturze chmurowej**: Projektowanie wdrożeń na skalę korporacyjną i zarządzanie  
-

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->