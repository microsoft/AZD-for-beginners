# AZD dla początkujących: Plan kursu i ramy nauczania

## Przegląd kursu

Opanuj Azure Developer CLI (azd) poprzez uporządkowane rozdziały zaprojektowane do stopniowej nauki. **Szczególny nacisk na wdrażanie aplikacji AI z integracją Microsoft Foundry.**

### Dlaczego ten kurs jest niezbędny dla współczesnych programistów

Na podstawie wniosków społeczności Microsoft Foundry na Discordzie, **45% programistów chce używać AZD do obciążeń AI**, ale napotyka na wyzwania związane z:
- Złożonymi architekturami AI składającymi się z wielu usług
- Najlepszymi praktykami wdrażania AI do środowiska produkcyjnego  
- Integracją i konfiguracją usług Azure AI
- Optymalizacją kosztów obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

### Główne cele nauczania

Po ukończeniu tego uporządkowanego kursu osiągniesz:
- **Opanuj podstawy AZD**: Podstawowe pojęcia, instalacja i konfiguracja
- **Wdrażaj aplikacje AI**: Używaj AZD z usługami Microsoft Foundry
- **Wdrażaj Infrastructure as Code**: Zarządzaj zasobami Azure za pomocą szablonów Bicep
- **Rozwiązuj problemy z wdrożeniami**: Rozwiązuj typowe problemy i debuguj błędy
- **Optymalizuj do produkcji**: Bezpieczeństwo, skalowanie, monitorowanie i zarządzanie kosztami
- **Buduj rozwiązania z wieloma agentami**: Wdrażaj złożone architektury AI

## 🎓 Doświadczenie warsztatowe

### Elastyczne opcje realizacji szkolenia
Ten kurs jest zaprojektowany tak, aby wspierać zarówno **samodzielną naukę indywidualną**, jak i **prowadzone sesje warsztatowe**, umożliwiając uczestnikom zdobycie praktycznych umiejętności z AZD poprzez interaktywne ćwiczenia.

#### 🚀 Tryb nauki samodzielnej
**Idealne dla indywidualnych programistów i ciągłego rozwoju**

**Funkcje:**
- **Interfejs przeglądarkowy**: Warsztat oparty na MkDocs dostępny przez dowolną przeglądarkę
- **Integracja z GitHub Codespaces**: Środowisko programistyczne jednym kliknięciem z wstępnie skonfigurowanymi narzędziami
- **Interaktywne środowisko DevContainer**: Brak konieczności lokalnej konfiguracji - zacznij kodować od razu
- **Śledzenie postępów**: Wbudowane punkty kontrolne i ćwiczenia walidacyjne
- **Wsparcie społeczności**: Dostęp do kanałów Azure Discord w celu zadawania pytań i współpracy

**Struktura nauki:**
- **Elastyczne terminy**: Ukończ rozdziały we własnym tempie w ciągu dni lub tygodni
- **System punktów kontrolnych**: Waliduj naukę przed przejściem do bardziej zaawansowanych tematów
- **Biblioteka zasobów**: Obszerna dokumentacja, przykłady i przewodniki rozwiązywania problemów
- **Rozwój portfolio**: Buduj wdrażalne projekty do profesjonalnego portfolio

**Rozpoczęcie (samodzielnie):**
```bash
# Opcja 1: GitHub Codespaces (zalecane)
# Przejdź do repozytorium i kliknij „Code” → „Utwórz codespace na branchu main”

# Opcja 2: Rozwój lokalny
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postępuj zgodnie z instrukcjami konfiguracji w workshop/README.md
```

#### 🏛️ Prowadzone sesje warsztatowe
**Idealne dla szkoleń korporacyjnych, bootcampów i instytucji edukacyjnych**

**Opcje formatu warsztatów:**

**📚 Integracja z programami akademickimi (8-12 tygodni)**
- **Programy uniwersyteckie**: Kurs semestralny z cotygodniowymi 2-godzinnymi sesjami
- **Format bootcampu**: Intensywny program 3-5 dni z codziennymi sesjami po 6-8 godzin
- **Szkolenie korporacyjne**: Miesięczne sesje zespołowe z praktyczną realizacją projektów
- **Ramowy system oceny**: Oceniane zadania, recenzje rówieśnicze i projekty końcowe

**🚀 Intensywny warsztat (1-3 dni)**
- **Dzień 1**: Podstawy + Rozwój AI (Rozdziały 1-2) - 6 godzin
- **Dzień 2**: Konfiguracja + Infrastruktura (Rozdziały 3-4) - 6 godzin  
- **Dzień 3**: Wzorce zaawansowane + Produkcja (Rozdziały 5-8) - 8 godzin
- **Kontynuacja**: Opcjonalny 2-tygodniowy mentoring dla ukończenia projektu

**⚡ Briefing dla kadry zarządzającej (4-6 godzin)**
- **Przegląd strategiczny**: Wartość AZD i wpływ na biznes (1 godzina)
- **Demo praktyczne**: Wdrożenie aplikacji AI end-to-end (2 godziny)
- **Przegląd architektury**: Wzorce korporacyjne i zarządzanie (1 godzina)
- **Planowanie wdrożenia**: Strategia adopcji w organizacji (1-2 godziny)

#### 🛠️ Metodologia nauczania warsztatowego
Podejście Odkrywanie → Wdrażanie → Dostosowywanie dla rozwoju umiejętności praktycznych

**Faza 1: Odkrywanie (45 minut)**
- **Eksploracja szablonów**: Oceń szablony i usługi Microsoft Foundry
- **Analiza architektury**: Zrozum wzorce multi-agent i strategie wdrażania
- **Ocena wymagań**: Zidentyfikuj potrzeby i ograniczenia organizacji
- **Konfiguracja środowiska**: Skonfiguruj środowisko deweloperskie i zasoby Azure

**Faza 2: Wdrażanie (2 godziny)**
- **Wdrożenie prowadzone**: Krok po kroku wdrożenie aplikacji AI z AZD
- **Konfiguracja usług**: Skonfiguruj usługi Azure AI, punkty końcowe i uwierzytelnianie
- **Wdrożenie zabezpieczeń**: Zastosuj wzorce bezpieczeństwa korporacyjnego i kontrolę dostępu
- **Testy walidacyjne**: Zweryfikuj wdrożenia i rozwiąż typowe problemy

**Faza 3: Dostosowywanie (45 minut)**
- **Modyfikacja aplikacji**: Dostosuj szablony do konkretnych przypadków użycia i wymagań
- **Optymalizacja produkcyjna**: Wdróż monitorowanie, zarządzanie kosztami i strategie skalowania
- **Wzorce zaawansowane**: Poznaj koordynację wielu agentów i złożone architektury
- **Planowanie kolejnych kroków**: Zdefiniuj ścieżkę nauki dla dalszego rozwoju umiejętności

#### 🎯 Rezultaty warsztatów
Mierzalne umiejętności rozwijane poprzez praktykę

**Kompetencje techniczne:**
- **Wdrażanie produkcyjnych aplikacji AI**: Pomyślnie wdrażaj i konfiguruj rozwiązania zasilane AI
- **Opanowanie Infrastructure as Code**: Twórz i zarządzaj niestandardowymi szablonami Bicep
- **Architektura wielu agentów**: Implementuj skoordynowane rozwiązania z agentami AI
- **Gotowość produkcyjna**: Stosuj wzorce bezpieczeństwa, monitorowania i zarządzania
- **Umiejętność rozwiązywania problemów**: Samodzielnie rozwiązuj problemy związane z wdrożeniem i konfiguracją

**Umiejętności zawodowe:**
- **Przywództwo projektowe**: Prowadź zespoły techniczne w inicjatywach wdrożeniowych w chmurze
- **Projektowanie architektury**: Projektuj skalowalne, opłacalne rozwiązania w Azure
- **Przekazywanie wiedzy**: Szkol i mentoruj współpracowników w najlepszych praktykach AZD
- **Planowanie strategiczne**: Wpływaj na strategie adopcji chmury w organizacji

#### 📋 Zasoby i materiały warsztatowe
Kompleksowy zestaw narzędzi dla prowadzących i uczestników

**Dla prowadzących:**
- **Przewodnik instruktora**: [Przegląd warsztatów](workshop/README.md) - Planowanie sesji i wskazówki dotyczące prowadzenia
- **Materiały prezentacyjne**: Slajdy, diagramy architektury i skrypty demo
- **Narzędzia oceny**: Ćwiczenia praktyczne, kontrole wiedzy i rubryki oceny
- **Konfiguracja techniczna**: Konfiguracja środowiska, przewodniki rozwiązywania problemów i plany awaryjne

**Dla uczestników:**
- **Interaktywne środowisko warsztatowe**: [Materiały warsztatowe](workshop/README.md) - Platforma do nauki w przeglądarce
- **Instrukcje krok po kroku**: [Ćwiczenia prowadzone](../../workshop/docs/instructions) - Szczegółowe instrukcje implementacji  
- **Dokumentacja referencyjna**: [Laboratorium warsztatu AI](docs/microsoft-foundry/ai-workshop-lab.md) - Głębokie omówienia skoncentrowane na AI
- **Zasoby społecznościowe**: Kanały Azure Discord, dyskusje na GitHub i wsparcie ekspertów

#### 🏢 Wdrożenie warsztatów w przedsiębiorstwie
Strategie wdrażania i szkoleń w organizacji

**Programy szkoleniowe dla firm:**
- **Onboarding deweloperów**: Orientacja dla nowych pracowników z podstawami AZD (2-4 tygodnie)
- **Podnoszenie kwalifikacji zespołu**: Kwartalne warsztaty dla istniejących zespołów deweloperskich (1-2 dni)
- **Przegląd architektury**: Miesięczne sesje dla starszych inżynierów i architektów (4 godziny)
- **Briefingi dla liderów**: Warsztaty dla decydentów technicznych (pół dnia)

**Wsparcie wdrożeniowe:**
- **Projektowanie warsztatów na zamówienie**: Treści dostosowane do konkretnych potrzeb organizacji
- **Zarządzanie programem pilotażowym**: Strukturalne wdrożenie z metrykami sukcesu i pętlami informacji zwrotnej  
- **Ciągły mentoring**: Wsparcie po warsztatach dla realizacji projektów
- **Budowanie społeczności**: Wewnętrzne społeczności deweloperów Azure AI i wymiana wiedzy

**Metryki sukcesu:**
- **Nabywanie umiejętności**: Oceny przed/po mierzące wzrost kompetencji technicznych
- **Sukces wdrożeń**: Odsetek uczestników, którzy pomyślnie wdrożyli aplikacje produkcyjne
- **Czas do produktywności**: Skrócony czas wdrożenia nowych projektów Azure AI
- **Utrzymanie wiedzy**: Testy kontrolne 3-6 miesięcy po warsztatach

## Struktura nauki w 8 rozdziałach

### Rozdział 1: Podstawy i szybki start (30-45 minut) 🌱
**Wymagania wstępne**: subskrypcja Azure, podstawowa znajomość wiersza poleceń  
**Złożoność**: ⭐

#### Czego się nauczysz
- Zrozumienie podstaw Azure Developer CLI
- Instalacja AZD na Twojej platformie  
- Twoje pierwsze pomyślne wdrożenie
- Podstawowe koncepcje i terminologia

#### Zasoby do nauki
- [Podstawy AZD](docs/getting-started/azd-basics.md) - Podstawowe koncepcje
- [Instalacja i konfiguracja](docs/getting-started/installation.md) - Przewodniki specyficzne dla platformy
- [Twój pierwszy projekt](docs/getting-started/first-project.md) - Samouczek praktyczny
- [Szybka ściągawka poleceń](resources/cheat-sheet.md) - Szybkie odniesienie

#### Praktyczny rezultat
Pomyślnie wdrożysz prostą aplikację webową do Azure przy użyciu AZD

---

### Rozdział 2: Rozwój z myślą o AI (1-2 godziny) 🤖
**Wymagania wstępne**: Rozdział 1 ukończony  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Integracja Microsoft Foundry z AZD
- Wdrażanie aplikacji zasilanych AI
- Zrozumienie konfiguracji usług AI
- Wzorce RAG (Retrieval-Augmented Generation)

#### Zasoby do nauki
- [Integracja Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Wdrażanie modeli AI](docs/microsoft-foundry/ai-model-deployment.md)
- [Laboratorium warsztatu AI](docs/microsoft-foundry/ai-workshop-lab.md) - **NOWE**: Kompleksowe 2-3 godzinne laboratorium praktyczne
- [Interaktywny przewodnik warsztatowy](workshop/README.md) - **NOWE**: Warsztat w przeglądarce z podglądem MkDocs
- [Szablony Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Instrukcje warsztatowe](../../workshop/docs/instructions) - **NOWE**: Ćwiczenia prowadzone krok po kroku

#### Praktyczny rezultat
Wdrożysz i skonfigurujesz aplikację czatu zasilaną AI z funkcjami RAG

#### Ścieżka nauki warsztatowej (opcjonalne rozszerzenie)
**NOWE Interaktywne doświadczenie**: [Kompletny przewodnik warsztatowy](workshop/README.md)
1. **Odkrywanie** (30 min): Wybór i ocena szablonów
2. **Wdrażanie** (45 min): Wdróż i zweryfikuj funkcjonalność szablonu AI  
3. **Dezintegracja** (30 min): Zrozum architekturę i komponenty szablonu
4. **Konfiguracja** (30 min): Dostosuj ustawienia i parametry
5. **Personalizacja** (45 min): Modyfikuj i iteruj, aby dostosować do siebie
6. **Usuwanie zasobów** (15 min): Oczyść zasoby i zrozum cykl życia
7. **Podsumowanie** (15 min): Kolejne kroki i zaawansowane ścieżki nauki

---

### Rozdział 3: Konfiguracja i uwierzytelnianie (45-60 minut) ⚙️
**Wymagania wstępne**: Rozdział 1 ukończony  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskiem
- Najlepsze praktyki w zakresie uwierzytelniania i bezpieczeństwa
- Nazewnictwo zasobów i organizacja
- Wdrażania wielośrodowiskowe

#### Zasoby do nauki
- [Przewodnik konfiguracji](docs/getting-started/configuration.md) - Konfiguracja środowiska
- [Wzorce uwierzytelniania i bezpieczeństwa](docs/getting-started/authsecurity.md) - Integracja zarządzanej tożsamości i Key Vault
- Przykłady wielośrodowiskowe

#### Praktyczny rezultat
Zarządzaj wieloma środowiskami z odpowiednim uwierzytelnianiem i zabezpieczeniami

---

### Rozdział 4: Infrastruktura jako kod i wdrażanie (1-1.5 godziny) 🏗️
**Wymagania wstępne**: Rozdziały 1-3 ukończone  
**Złożoność**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeń
- Infrastruktura jako kod z Bicep
- Strategie provisioningu zasobów
- Tworzenie niestandardowych szablonów

- Wdrażanie aplikacji konteneryzowanych z Azure Container Apps i AZD

#### Zasoby do nauki
- [Przewodnik wdrożeń](docs/deployment/deployment-guide.md) - Kompletny przepływ pracy
- [Provisioning zasobów](docs/deployment/provisioning.md) - Zarządzanie zasobami
- Przykłady kontenerów i mikroserwisów
- [Przykłady Container App](examples/container-app/README.md) - Szybki start, produkcja i zaawansowane wzorce wdrożeń

#### Praktyczny rezultat
Wdrażaj złożone aplikacje wielousługowe używając niestandardowych szablonów infrastruktury

---

### Rozdział 5: Rozwiązania AI z wieloma agentami (2-3 godziny) 🤖🤖
**Wymagania wstępne**: Rozdziały 1-2 ukończone  
**Złożoność**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury multi-agent
- Orkiestracja i koordynacja agentów
- Wdrożenia AI gotowe do produkcji
- Implementacje agentów obsługi klienta i inwentaryzacji

- Integracja konteneryzowanych mikroserwisów jako części rozwiązań opartych na agentach

#### Zasoby do nauki
- [Rozwiązanie multi-agent dla handlu detalicznego](examples/retail-scenario.md) - Kompletny przykład implementacji
- [Pakiet szablonów ARM](../../examples/retail-multiagent-arm-template) - Wdrożenie jednym kliknięciem
- Wzorce koordynacji wielu agentów
- [Przykład architektury mikroserwisów](../../examples/container-app/microservices) - Komunikacja serwis-serwis, asynchroniczne przesyłanie wiadomości i wdrożenie produkcyjne

#### Praktyczny rezultat
Wdrażaj i zarządzaj produkcyjnym rozwiązaniem AI z wieloma agentami

---

### Rozdział 6: Walidacja i planowanie przed wdrożeniem (1 godzina) 🔍
**Wymagania wstępne**: Rozdział 4 ukończony  
**Złożoność**: ⭐⭐

#### Czego się nauczysz
- Planowanie pojemności i walidacja zasobów
- Strategie wyboru SKU
- Kontrole przedlotowe i automatyzacja
- Planowanie optymalizacji kosztów

#### Zasoby do nauki
- [Planowanie pojemności](docs/pre-deployment/capacity-planning.md) - Walidacja zasobów
- [Wybór SKU](docs/pre-deployment/sku-selection.md) - Ekonomiczne wybory
- [Kontrole przedlotowe](docs/pre-deployment/preflight-checks.md) - Skrypty automatyzujące
- [Integracja Application Insights](docs/pre-deployment/application-insights.md) - Monitorowanie i obserwowalność
- [Wzorce koordynacji wielu agentów](docs/pre-deployment/coordination-patterns.md) - Strategie orkiestracji agentów

#### Praktyczny rezultat
Zwaliduj i zoptymalizuj wdrożenia przed ich wykonaniem
---

### Rozdział 7: Rozwiązywanie problemów i debugowanie (1-1,5 godziny) 🔧
**Wymagania wstępne**: Ukończony dowolny rozdział dotyczący wdrożeń  
**Stopień trudności**: ⭐⭐

#### Czego się nauczysz
- Systematyczne podejścia do debugowania
- Typowe problemy i rozwiązania
- Rozwiązywanie problemów specyficznych dla AI
- Optymalizacja wydajności

#### Materiały szkoleniowe
- [Typowe problemy](docs/troubleshooting/common-issues.md) - FAQ i rozwiązania
- [Przewodnik po debugowaniu](docs/troubleshooting/debugging.md) - Strategie krok po kroku
- [Rozwiązywanie problemów specyficznych dla AI](docs/troubleshooting/ai-troubleshooting.md) - Problemy z usługami AI

#### Efekt praktyczny
Samodzielne diagnozowanie i rozwiązywanie typowych problemów z wdrożeniami

---

### Rozdział 8: Wzorce produkcyjne i korporacyjne (2-3 godziny) 🏢
**Wymagania wstępne**: Ukończone rozdziały 1–4  
**Stopień trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Korporacyjne wzorce bezpieczeństwa
- Monitoring i optymalizacja kosztów
- Skalowalność i zarządzanie

- Najlepsze praktyki dla wdrożeń aplikacji kontenerowych w produkcji (bezpieczeństwo, monitoring, koszty, CI/CD)

#### Materiały szkoleniowe
- [Najlepsze praktyki AI dla produkcji](docs/microsoft-foundry/production-ai-practices.md) - Wzorce korporacyjne
- Przykłady mikrousług i wdrożeń korporacyjnych
- Ramy monitoringu i zarządzania
- [Przykład architektury mikrousług](../../examples/container-app/microservices) - Wdrażanie blue-green/canary, śledzenie rozproszone i optymalizacja kosztów

#### Efekt praktyczny
Wdrażanie aplikacji gotowych do użytku korporacyjnego z pełnymi możliwościami produkcyjnymi

---

## Postęp nauki i poziom trudności

### Stopniowe budowanie umiejętności

- **🌱 Początkujący**: Zacznij od rozdziału 1 (Podstawy) → rozdział 2 (Tworzenie AI)
- **🔧 Średniozaawansowani**: rozdziały 3–4 (Konfiguracja i infrastruktura) → rozdział 6 (Weryfikacja)
- **🚀 Zaawansowani**: rozdział 5 (Rozwiązania wieloagentowe) → rozdział 7 (Rozwiązywanie problemów)
- **🏢 Korporacyjni**: Ukończ wszystkie rozdziały, skoncentruj się na rozdziale 8 (Wzorce produkcyjne)

- **Ścieżka aplikacji kontenerowych**: rozdziały 4 (Wdrożenie w kontenerze), 5 (Integracja mikrousług), 8 (Najlepsze praktyki produkcyjne)

### Wskaźniki trudności

- **⭐ Podstawowy**: Pojedyncze koncepcje, instruktażowe samouczki, 30–60 minut
- **⭐⭐ Średniozaawansowany**: Wiele koncepcji, praktyka, 1–2 godziny  
- **⭐⭐⭐ Zaawansowany**: Złożone architektury, niestandardowe rozwiązania, 1–3 godziny
- **⭐⭐⭐⭐ Ekspert**: Systemy produkcyjne, wzorce korporacyjne, 2–4 godziny

### Elastyczne ścieżki nauki

#### 🎯 Szybka ścieżka dla dewelopera AI (4-6 godzin)
1. **Rozdział 1**: Podstawy i szybki start (45 min)
2. **Rozdział 2**: Tworzenie z priorytetem AI (2 godziny)  
3. **Rozdział 5**: Rozwiązania AI z wieloma agentami (3 godziny)
4. **Rozdział 8**: Najlepsze praktyki AI dla produkcji (1 godzina)

#### 🛠️ Ścieżka specjalisty ds. infrastruktury (5-7 godzin)
1. **Rozdział 1**: Podstawy i szybki start (45 min)
2. **Rozdział 3**: Konfiguracja i uwierzytelnianie (1 godzina)
3. **Rozdział 4**: Infrastruktura jako kod i wdrożenie (1,5 godziny)
4. **Rozdział 6**: Weryfikacja i planowanie przed wdrożeniem (1 godzina)
5. **Rozdział 7**: Rozwiązywanie problemów i debugowanie (1,5 godziny)
6. **Rozdział 8**: Wzorce produkcyjne i korporacyjne (2 godziny)

#### 🎓 Pełna ścieżka nauki (8-12 godzin)
Sekwencyjne ukończenie wszystkich 8 rozdziałów z praktycznymi ćwiczeniami i weryfikacją

## Ramy ukończenia kursu

### Weryfikacja wiedzy
- **Punkty kontrolne rozdziałów**: Ćwiczenia praktyczne z mierzalnymi rezultatami
- **Weryfikacja praktyczna**: Wdrażaj działające rozwiązania dla każdego rozdziału
- **Śledzenie postępów**: Wskaźniki wizualne i odznaki ukończenia
- **Weryfikacja społecznościowa**: Dziel się doświadczeniami na kanałach Discorda Azure

### Ocena efektów nauki

#### Ukończenie rozdziałów 1–2 (Podstawy + AI)
- ✅ Wdrażanie podstawowej aplikacji webowej przy użyciu AZD
- ✅ Wdrażanie aplikacji czatu zasilanej AI z RAG
- ✅ Zrozumieć podstawowe koncepcje AZD i integrację AI

#### Ukończenie rozdziałów 3–4 (Konfiguracja + Infrastruktura)  
- ✅ Zarządzać wdrożeniami w wielu środowiskach
- ✅ Tworzyć niestandardowe szablony infrastruktury Bicep
- ✅ Wdrażać bezpieczne wzorce uwierzytelniania

#### Ukończenie rozdziałów 5–6 (Wieloagentowe + Weryfikacja)
- ✅ Wdrażać złożone rozwiązanie AI oparte na wielu agentach
- ✅ Przeprowadzać planowanie pojemności i optymalizację kosztów
- ✅ Wdrażać zautomatyzowaną weryfikację przed wdrożeniem

#### Ukończenie rozdziałów 7–8 (Rozwiązywanie problemów + Produkcja)
- ✅ Debugować i samodzielnie rozwiązywać problemy z wdrożeniami  
- ✅ Wdrażać monitoring i zabezpieczenia klasy korporacyjnej
- ✅ Wdrażać aplikacje gotowe do produkcji z ramami zarządzania

### Certyfikacja i uznanie
- **Odznaka ukończenia kursu**: Ukończ wszystkie 8 rozdziałów z praktyczną weryfikacją
- **Uznanie społeczności**: Aktywne uczestnictwo w Discordzie Microsoft Foundry
- **Rozwój zawodowy**: Umiejętności wdrażania AZD i AI istotne w branży
- **Rozwój kariery**: Kompetencje we wdrażaniu chmurowym gotowe na poziom korporacyjny

## 🎓 Kompleksowe efekty nauczania

### Poziom podstawowy (Rozdziały 1–2)
Po ukończeniu rozdziałów podstawowych uczestnicy będą potrafili:

**Zdolności techniczne:**
- Wdrażać proste aplikacje webowe do Azure przy użyciu poleceń AZD
- Konfigurować i wdrażać aplikacje czatu zasilane AI z funkcjami RAG
- Zrozumieć podstawowe koncepcje AZD: szablony, środowiska, procesy provisioningowe
- Integrować usługi Microsoft Foundry z wdrożeniami AZD
- Poruszać się po konfiguracjach usług Azure AI i punktach końcowych API

**Umiejętności zawodowe:**
- Stosować ustrukturyzowane procesy wdrożeniowe dla powtarzalnych rezultatów
- Rozwiązywać podstawowe problemy z wdrożeniami, korzystając z logów i dokumentacji
- Komunikować się skutecznie w kwestii procesów wdrożeniowych w chmurze
- Zastosować najlepsze praktyki integracji usług AI z zachowaniem bezpieczeństwa

**Weryfikacja nauki:**
- ✅ Pomyślnie wdrożyć szablon `todo-nodejs-mongo`
- ✅ Wdrożyć i skonfigurować `azure-search-openai-demo` z RAG
- ✅ Ukończyć interaktywne ćwiczenia warsztatowe (faza odkrywania)
- ✅ Uczestniczyć w dyskusjach społeczności Azure na Discordzie

### Poziom średniozaawansowany (Rozdziały 3–4)
Po ukończeniu rozdziałów średniozaawansowanych uczestnicy będą potrafili:

**Zdolności techniczne:**
- Zarządzać wdrożeniami w wielu środowiskach (dev, staging, production)
- Tworzyć niestandardowe szablony Bicep dla infrastruktury jako kodu
- Wdrażać bezpieczne wzorce uwierzytelniania z użyciem managed identity
- Wdrażać złożone aplikacje wielousługowe z niestandardowymi konfiguracjami
- Optymalizować strategie provisioningowe zasobów pod kątem kosztów i wydajności

**Umiejętności zawodowe:**
- Projektować skalowalne architektury infrastruktury
- Wdrażać najlepsze praktyki bezpieczeństwa dla wdrożeń w chmurze
- Dokumentować wzorce infrastruktury dla współpracy zespołowej
- Ocenić i wybrać odpowiednie usługi Azure zgodnie z wymaganiami

**Weryfikacja nauki:**
- ✅ Skonfigurować oddzielne środowiska z ustawieniami specyficznymi dla środowiska
- ✅ Utworzyć i wdrożyć niestandardowy szablon Bicep dla aplikacji wielousługowej
- ✅ Wdrożyć uwierzytelnianie przy użyciu managed identity dla bezpiecznego dostępu
- ✅ Ukończyć ćwiczenia z zarządzania konfiguracją na prawdziwych scenariuszach

### Poziom zaawansowany (Rozdziały 5–6)
Po ukończeniu rozdziałów zaawansowanych uczestnicy będą potrafili:

**Zdolności techniczne:**
- Wdrażać i orkiestrwać rozwiązania AI z wieloma agentami z koordynowanymi przepływami pracy
- Wdrażać architektury agentów obsługi klienta i inwentaryzacji dla scenariuszy detalicznych
- Przeprowadzać kompleksowe planowanie pojemności i weryfikację zasobów
- Wykonywać zautomatyzowaną weryfikację przed wdrożeniem i optymalizację
- Projektować ekonomiczne wybory SKU w oparciu o wymagania obciążenia

**Umiejętności zawodowe:**
- Projektować złożone rozwiązania AI dla środowisk produkcyjnych
- Prowadzić dyskusje techniczne na temat strategii wdrażania AI
- Mentorować młodszych programistów w zakresie AZD i najlepszych praktyk wdrażania AI
- Ocenić i rekomendować wzorce architektury AI dla wymagań biznesowych

**Weryfikacja nauki:**
- ✅ Wdrożyć kompletne rozwiązanie detaliczne z wieloma agentami przy użyciu szablonów ARM
- ✅ Zaprezentować koordynację agentów i orkiestrację przepływów pracy
- ✅ Ukończyć ćwiczenia z planowania pojemności z rzeczywistymi ograniczeniami zasobów
- ✅ Zwalidować gotowość do wdrożenia poprzez zautomatyzowane kontrole przedstartowe

### Poziom ekspercki (Rozdziały 7–8)
Po ukończeniu rozdziałów eksperckich uczestnicy będą potrafili:

**Zdolności techniczne:**
- Diagnozować i rozwiązywać złożone problemy z wdrożeniami samodzielnie
- Wdrażać zabezpieczenia klasy korporacyjnej i ramy zarządzania
- Projektować kompleksowe strategie monitoringu i alertowania
- Optymalizować wdrożenia produkcyjne pod kątem skalowalności, kosztów i wydajności
- Tworzyć potoki CI/CD z odpowiednim testowaniem i weryfikacją

**Umiejętności zawodowe:**
- Prowadzić inicjatywy transformacji chmury w przedsiębiorstwie
- Projektować i wdrażać organizacyjne standardy wdrożeń
- Szkolić i mentorować zespoły deweloperskie w zaawansowanych praktykach AZD
- Wpływać na decyzje techniczne dotyczące wdrożeń AI w przedsiębiorstwie

**Weryfikacja nauki:**
- ✅ Rozwiązać złożone awarie wdrożeń wielousługowych
- ✅ Wdrożyć korporacyjne wzorce bezpieczeństwa z wymaganiami zgodności
- ✅ Zaprojektować i wdrożyć monitoring produkcyjny z Application Insights
- ✅ Ukończyć wdrożenie korporacyjnego modelu zarządzania

## 🎯 Certyfikat ukończenia kursu

### Ramy śledzenia postępów
Śledź postęp nauki poprzez ustrukturyzowane punkty kontrolne:

- [ ] **Rozdział 1**: Podstawy i szybki start ✅
- [ ] **Rozdział 2**: Tworzenie z priorytetem AI ✅  
- [ ] **Rozdział 3**: Konfiguracja i uwierzytelnianie ✅
- [ ] **Rozdział 4**: Infrastruktura jako kod i wdrożenie ✅
- [ ] **Rozdział 5**: Rozwiązania AI z wieloma agentami ✅
- [ ] **Rozdział 6**: Weryfikacja i planowanie przed wdrożeniem ✅
- [ ] **Rozdział 7**: Rozwiązywanie problemów i debugowanie ✅
- [ ] **Rozdział 8**: Wzorce produkcyjne i korporacyjne ✅

### Proces weryfikacji
Po ukończeniu każdego rozdziału zweryfikuj swoją wiedzę poprzez:

1. **Ukończenie ćwiczeń praktycznych**: Wdrażaj działające rozwiązania dla każdego rozdziału
2. **Ocena wiedzy**: Przejrzyj sekcje FAQ i wykonaj samooceny
3. **Zaangażowanie społeczności**: Dziel się doświadczeniami i otrzymuj opinie na Discordzie Azure
4. **Tworzenie portfolio**: Dokumentuj swoje wdrożenia i wnioski
5. **Weryfikacja przez rówieśników**: Współpracuj z innymi uczestnikami nad złożonymi scenariuszami

### Korzyści z ukończenia kursu
Po ukończeniu wszystkich rozdziałów wraz z weryfikacją absolwenci będą mieli:

**Ekspertyza techniczna:**
- **Doświadczenie produkcyjne**: Wdrożone rzeczywiste aplikacje AI do środowisk Azure
- **Umiejętności zawodowe**: Umiejętności wdrożeniowe i rozwiązywania problemów gotowe na potrzeby przedsiębiorstwa  
- **Wiedza architektoniczna**: Rozwiązania AI oparte na wielu agentach i złożone wzorce infrastruktury
- **Mistrzostwo w rozwiązywaniu problemów**: Samodzielne rozwiązywanie problemów z wdrożeniami i konfiguracją

**Rozwój zawodowy:**
- **Uznanie branżowe**: Weryfikowalne umiejętności w obszarach wdrażania AZD i AI o wysokim zapotrzebowaniu
- **Rozwój kariery**: Kwalifikacje do ról architekta chmury i specjalisty ds. wdrożeń AI
- **Przywództwo w społeczności**: Aktywny udział w społecznościach deweloperów Azure i AI
- **Ciągłe uczenie się**: Podstawa do zaawansowanej specjalizacji Microsoft Foundry

**Zasoby do portfolio:**
- **Wdrożone rozwiązania**: Działające przykłady aplikacji AI i wzorców infrastruktury
- **Dokumentacja**: Kompleksowe przewodniki wdrożeniowe i procedury rozwiązywania problemów  
- **Wkład do społeczności**: Dyskusje, przykłady i ulepszenia udostępnione społeczności Azure
- **Sieć zawodowa**: Połączenia z ekspertami Azure i praktykami wdrożeń AI

### Ścieżka nauki po kursie
Absolwenci są przygotowani do zaawansowanej specjalizacji w:
- **Microsoft Foundry Expert**: Głęboka specjalizacja we wdrażaniu i orkiestracji modeli AI
- **Przywództwo w architekturze chmury**: Projektowanie wdrożeń na skalę przedsiębiorstwa i zarządzanie
- **Przywództwo w społeczności deweloperów**: Wnoszenie wkładu do przykładów Azure i zasobów społeczności
- **Szkolenia korporacyjne**: Nauczanie umiejętności wdrażania AZD i AI w ramach organizacji

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako dokument wiążący. W przypadku informacji istotnych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->