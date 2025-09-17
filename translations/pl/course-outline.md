<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-17T16:37:27+00:00",
  "source_file": "course-outline.md",
  "language_code": "pl"
}
-->
## Struktura Nauki w 8 Rozdziałach

### Rozdział 1: Podstawy i Szybki Start (30-45 minut) 🌱
**Wymagania wstępne**: Subskrypcja Azure, podstawowa znajomość wiersza poleceń  
**Poziom trudności**: ⭐

#### Czego się nauczysz
- Podstawy Azure Developer CLI
- Instalacja AZD na Twojej platformie  
- Pierwsze udane wdrożenie
- Kluczowe pojęcia i terminologia

#### Materiały edukacyjne
- [Podstawy AZD](docs/getting-started/azd-basics.md) - Kluczowe pojęcia
- [Instalacja i konfiguracja](docs/getting-started/installation.md) - Przewodniki dla różnych platform
- [Twój pierwszy projekt](docs/getting-started/first-project.md) - Praktyczny samouczek
- [Skrócona lista poleceń](resources/cheat-sheet.md) - Szybki dostęp

#### Efekt praktyczny
Udane wdrożenie prostej aplikacji webowej na Azure za pomocą AZD

---

### Rozdział 2: Rozwój oparty na AI (1-2 godziny) 🤖
**Wymagania wstępne**: Ukończony Rozdział 1  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Integracja Azure AI Foundry z AZD
- Wdrażanie aplikacji opartych na AI
- Konfiguracja usług AI
- Wzorce RAG (Retrieval-Augmented Generation)

#### Materiały edukacyjne
- [Integracja Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Wdrażanie modeli AI](docs/ai-foundry/ai-model-deployment.md)
- [Laboratorium warsztatowe AI](docs/ai-foundry/ai-workshop-lab.md) - Praktyczne ćwiczenia
- [Szablony Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)

#### Efekt praktyczny
Wdrożenie i konfiguracja aplikacji chatowej opartej na AI z funkcjami RAG

---

### Rozdział 3: Konfiguracja i Uwierzytelnianie (45-60 minut) ⚙️
**Wymagania wstępne**: Ukończony Rozdział 1  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Konfiguracja i zarządzanie środowiskiem
- Najlepsze praktyki w zakresie uwierzytelniania i bezpieczeństwa
- Nazewnictwo zasobów i organizacja
- Wdrożenia w wielu środowiskach

#### Materiały edukacyjne
- [Przewodnik konfiguracji](docs/getting-started/configuration.md) - Konfiguracja środowiska
- Wzorce bezpieczeństwa i zarządzane tożsamości
- Przykłady wdrożeń w wielu środowiskach

#### Efekt praktyczny
Zarządzanie wieloma środowiskami z odpowiednim uwierzytelnianiem i bezpieczeństwem

---

### Rozdział 4: Infrastruktura jako Kod i Wdrożenie (1-1,5 godziny) 🏗️
**Wymagania wstępne**: Ukończone Rozdziały 1-3  
**Poziom trudności**: ⭐⭐⭐

#### Czego się nauczysz
- Zaawansowane wzorce wdrożeniowe
- Infrastruktura jako Kod z Bicep
- Strategie tworzenia zasobów
- Tworzenie niestandardowych szablonów

#### Materiały edukacyjne
- [Przewodnik wdrożeniowy](docs/deployment/deployment-guide.md) - Kompleksowe przepływy pracy
- [Tworzenie zasobów](docs/deployment/provisioning.md) - Zarządzanie zasobami
- Przykłady kontenerów i mikrousług

#### Efekt praktyczny
Wdrożenie złożonych aplikacji wielousługowych za pomocą niestandardowych szablonów infrastruktury

---

### Rozdział 5: Rozwiązania AI z Wieloma Agentami (2-3 godziny) 🤖🤖
**Wymagania wstępne**: Ukończone Rozdziały 1-2  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Wzorce architektury z wieloma agentami
- Orkiestracja i koordynacja agentów
- Wdrożenia AI gotowe do produkcji
- Implementacje agentów Klienta i Magazynu

#### Materiały edukacyjne
- [Rozwiązanie dla handlu detalicznego z wieloma agentami](examples/retail-scenario.md) - Kompleksowa implementacja
- [Pakiet szablonów ARM](../../examples/retail-multiagent-arm-template) - Wdrożenie jednym kliknięciem
- Wzorce koordynacji agentów

#### Efekt praktyczny
Wdrożenie i zarządzanie rozwiązaniem AI z wieloma agentami gotowym do produkcji

---

### Rozdział 6: Walidacja i Planowanie Przed Wdrożeniem (1 godzina) 🔍
**Wymagania wstępne**: Ukończony Rozdział 4  
**Poziom trudności**: ⭐⭐

#### Czego się nauczysz
- Planowanie pojemności i walidacja zasobów
- Strategie wyboru SKU
- Automatyzacja kontroli przed wdrożeniem
- Planowanie optymalizacji kosztów

#### Materiały edukacyjne
- [Planowanie pojemności](docs/pre-deployment/capacity-planning.md) - Walidacja zasobów
- [Wybór SKU](docs/pre-deployment/sku-selection.md) - Ekonomiczne wybory
- [Kontrole przed wdrożeniem](docs/pre-deployment/preflight-checks.md) - Zautomatyzowane skrypty

#### Efekt praktyczny
Walidacja i optymalizacja wdrożeń przed ich realizacją

---

### Rozdział 7: Rozwiązywanie Problemów i Debugowanie (1-1,5 godziny) 🔧
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
Samodzielne diagnozowanie i rozwiązywanie typowych problemów z wdrożeniami

---

### Rozdział 8: Wzorce Produkcyjne i Korporacyjne (2-3 godziny) 🏢
**Wymagania wstępne**: Ukończone Rozdziały 1-4  
**Poziom trudności**: ⭐⭐⭐⭐

#### Czego się nauczysz
- Strategie wdrożeń produkcyjnych
- Wzorce bezpieczeństwa korporacyjnego
- Monitorowanie i optymalizacja kosztów
- Skalowalność i zarządzanie

#### Materiały edukacyjne
- [Najlepsze praktyki AI w produkcji](docs/ai-foundry/production-ai-practices.md) - Wzorce korporacyjne
- Przykłady mikrousług i korporacyjne
- Ramy monitorowania i zarządzania

#### Efekt praktyczny
Wdrożenie aplikacji gotowych do produkcji z pełnymi możliwościami korporacyjnymi

---

## Postęp Nauki i Poziom Trudności

### Stopniowe Budowanie Umiejętności

- **🌱 Początkujący**: Rozpocznij od Rozdziału 1 (Podstawy) → Rozdział 2 (Rozwój AI)
- **🔧 Średniozaawansowani**: Rozdziały 3-4 (Konfiguracja i Infrastruktura) → Rozdział 6 (Walidacja)
- **🚀 Zaawansowani**: Rozdział 5 (Rozwiązania z wieloma agentami) → Rozdział 7 (Rozwiązywanie problemów)
- **🏢 Korporacyjni**: Ukończ wszystkie rozdziały, skup się na Rozdziale 8 (Wzorce produkcyjne)

### Wskaźniki Trudności

- **⭐ Podstawowy**: Pojedyncze pojęcia, prowadzone samouczki, 30-60 minut
- **⭐⭐ Średni**: Wiele pojęć, praktyczne ćwiczenia, 1-2 godziny  
- **⭐⭐⭐ Zaawansowany**: Złożone architektury, niestandardowe rozwiązania, 1-3 godziny
- **⭐⭐⭐⭐ Ekspert**: Systemy produkcyjne, wzorce korporacyjne, 2-4 godziny

### Elastyczne Ścieżki Nauki

#### 🎯 Szybka Ścieżka dla Developerów AI (4-6 godzin)
1. **Rozdział 1**: Podstawy i Szybki Start (45 minut)
2. **Rozdział 2**: Rozwój oparty na AI (2 godziny)  
3. **Rozdział 5**: Rozwiązania AI z wieloma agentami (3 godziny)
4. **Rozdział 8**: Najlepsze praktyki AI w produkcji (1 godzina)

#### 🛠️ Ścieżka Specjalisty ds. Infrastruktury (5-7 godzin)
1. **Rozdział 1**: Podstawy i Szybki Start (45 minut)
2. **Rozdział 3**: Konfiguracja i Uwierzytelnianie (1 godzina)
3. **Rozdział 4**: Infrastruktura jako Kod i Wdrożenie (1,5 godziny)
4. **Rozdział 6**: Walidacja i Planowanie Przed Wdrożeniem (1 godzina)
5. **Rozdział 7**: Rozwiązywanie Problemów i Debugowanie (1,5 godziny)
6. **Rozdział 8**: Wzorce Produkcyjne i Korporacyjne (2 godziny)

#### 🎓 Kompleksowa Ścieżka Nauki (8-12 godzin)
Kolejne ukończenie wszystkich 8 rozdziałów z praktycznymi ćwiczeniami i walidacją

## Ramy Ukończenia Kursu

### Walidacja Wiedzy
- **Punkty Kontrolne Rozdziałów**: Praktyczne ćwiczenia z mierzalnymi wynikami
- **Weryfikacja Praktyczna**: Wdrożenie działających rozwiązań dla każdego rozdziału
- **Śledzenie Postępów**: Wizualne wskaźniki i odznaki ukończenia
- **Walidacja Społecznościowa**: Dzielenie się doświadczeniami na kanałach Discord Azure

### Ocena Wyników Nauki

#### Ukończenie Rozdziałów 1-2 (Podstawy + AI)
- ✅ Wdrożenie podstawowej aplikacji webowej za pomocą AZD
- ✅ Wdrożenie aplikacji chatowej opartej na AI z RAG
- ✅ Zrozumienie podstaw AZD i integracji AI

#### Ukończenie Rozdziałów 3-4 (Konfiguracja + Infrastruktura)  
- ✅ Zarządzanie wdrożeniami w wielu środowiskach
- ✅ Tworzenie niestandardowych szablonów infrastruktury Bicep
- ✅ Implementacja bezpiecznych wzorców uwierzytelniania

#### Ukończenie Rozdziałów 5-6 (Wielu Agentów + Walidacja)
- ✅ Wdrożenie złożonego rozwiązania AI z wieloma agentami
- ✅ Planowanie pojemności i optymalizacja kosztów
- ✅ Implementacja zautomatyzowanej walidacji przed wdrożeniem

#### Ukończenie Rozdziałów 7-8 (Rozwiązywanie Problemów + Produkcja)
- ✅ Samodzielne rozwiązywanie problemów z wdrożeniami  
- ✅ Implementacja monitorowania i bezpieczeństwa na poziomie korporacyjnym
- ✅ Wdrożenie aplikacji gotowych do produkcji z zarządzaniem

### Certyfikacja i Uznanie
- **Odznaka Ukończenia Kursu**: Ukończenie wszystkich 8 rozdziałów z walidacją praktyczną
- **Uznanie Społecznościowe**: Aktywny udział w Discord Azure AI Foundry
- **Rozwój Zawodowy**: Umiejętności związane z wdrożeniami AZD i AI
- **Awans Kariery**: Zdolności do wdrożeń chmurowych gotowych do produkcji

## Odpowiedniość Treści dla Współczesnych Developerów

### Głębokość Techniczna i Zakres
- **Integracja Azure OpenAI**: Pełne pokrycie GPT-4o, osadzeń i wdrożeń wielomodelowych
- **Wzorce Architektury AI**: Implementacje RAG, orkiestracja wieloagentowa i przepływy produkcyjne AI
- **Infrastruktura jako Kod**: Szablony Bicep, wdrożenia ARM i zautomatyzowane tworzenie zasobów
- **Gotowość Produkcyjna**: Bezpieczeństwo, skalowanie, monitorowanie, optymalizacja kosztów i zarządzanie
- **Wzorce Korporacyjne**: Wdrożenia w wielu środowiskach, integracja CI/CD i ramy zgodności

### Skupienie na Praktycznym Nauczaniu
- **Automatyzacja Wdrożeń**: Nacisk na praktyczne przepływy pracy AZD, a nie teoretyczne pojęcia
- **Scenariusze Rzeczywiste**: Kompleksowe rozwiązanie dla handlu detalicznego z agentami Klienta i Magazynu
- **Przykłady Produkcyjne**: Pakiety szablonów ARM, wdrożenia jednym kliknięciem i wzorce korporacyjne
- **Umiejętności Rozwiązywania Problemów**: Debugowanie specyficzne dla AI, diagnostyka wielousługowa i optymalizacja wydajności
- **Znaczenie Branżowe**: Oparte na opiniach społeczności Azure AI Foundry i wymaganiach korporacyjnych

### Integracja Społeczności i Wsparcia
- **Integracja Discord**: Aktywny udział w społecznościach Azure AI Foundry i Microsoft Azure
- **Dyskusje na GitHub**: Wspólna nauka i rozwiązywanie problemów z rówieśnikami i ekspertami
- **Dostęp do Ekspertów**: Bezpośredni kontakt z inżynierami Microsoft i specjalistami ds. wdrożeń AI
- **Ciągłe Aktualizacje**: Treści kursu ewoluują wraz z aktualizacjami platformy Azure i opiniami społeczności
- **Rozwój Kariery**: Umiejętności bezpośrednio aplikowalne w nowoczesnych rolach związanych z chmurą i AI

### Walidacja Wyników Nauki
- **Mierzalne Umiejętności**: Każdy rozdział zawiera praktyczne ćwiczenia wdrożeniowe z weryfikowalnymi wynikami
- **Rozwój Portfolio**: Kompleksowe projekty odpowiednie do portfolio zawodowego i rozmów kwalifikacyjnych
- **Uznanie Branżowe**: Umiejętności zgodne z aktualnymi wymaganiami rynku pracy dla AZD i wdrożeń AI
- **Profesjonalna Sieć**: Dostęp do społeczności developerów Azure dla rozwoju kariery i współpracy

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.