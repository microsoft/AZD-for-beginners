<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:14:55+00:00",
  "source_file": "changelog.md",
  "language_code": "pl"
}
-->
# Dziennik zmian - AZD dla początkujących

## Wprowadzenie

Ten dziennik zmian dokumentuje wszystkie istotne zmiany, aktualizacje i ulepszenia w repozytorium AZD dla początkujących. Stosujemy zasady wersjonowania semantycznego i prowadzimy ten dziennik, aby pomóc użytkownikom zrozumieć, co zmieniło się między wersjami.

## Cele nauki

Przeglądając ten dziennik zmian, dowiesz się:
- O nowych funkcjach i dodanych treściach
- O ulepszeniach w istniejącej dokumentacji
- O poprawkach błędów i korektach zapewniających dokładność
- O ewolucji materiałów edukacyjnych na przestrzeni czasu

## Rezultaty nauki

Po zapoznaniu się z wpisami w dzienniku zmian będziesz w stanie:
- Zidentyfikować nowe treści i zasoby dostępne do nauki
- Zrozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować swoją ścieżkę nauki na podstawie najnowszych materiałów
- Przekazać opinie i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.4.0] - 2025-10-24

#### Ulepszenia podglądu infrastruktury i walidacji
**Ta wersja wprowadza kompleksowe wsparcie dla nowej funkcji podglądu w Azure Developer CLI oraz poprawia doświadczenie użytkowników warsztatów.**

#### Dodano
- **🧪 Dokumentacja funkcji azd provision --preview**: Szczegółowe omówienie nowej funkcji podglądu infrastruktury
  - Odniesienia do poleceń i przykłady użycia w arkuszu skrótów
  - Szczegółowa integracja w przewodniku dotyczącym wdrażania z przypadkami użycia i korzyściami
  - Integracja kontroli przed wdrożeniem dla bezpieczniejszej walidacji
  - Aktualizacje przewodnika dla początkujących z praktykami bezpiecznego wdrażania
- **🚧 Baner statusu warsztatu**: Profesjonalny baner HTML wskazujący status rozwoju warsztatu
  - Projekt gradientowy z wskaźnikami budowy dla jasnej komunikacji z użytkownikami
  - Ostatnia aktualizacja z datą dla przejrzystości
  - Projekt responsywny dla wszystkich typów urządzeń

#### Ulepszono
- **Bezpieczeństwo infrastruktury**: Funkcjonalność podglądu zintegrowana w całej dokumentacji wdrożeniowej
- **Walidacja przed wdrożeniem**: Zautomatyzowane skrypty teraz obejmują testowanie podglądu infrastruktury
- **Przepływ pracy dewelopera**: Zaktualizowane sekwencje poleceń, aby uwzględnić podgląd jako najlepszą praktykę
- **Doświadczenie warsztatowe**: Jasne oczekiwania dla użytkowników dotyczące statusu rozwoju treści

#### Zmieniono
- **Najlepsze praktyki wdrożeniowe**: Zalecane podejście z podglądem jako pierwszym krokiem
- **Przepływ dokumentacji**: Walidacja infrastruktury przeniesiona na wcześniejszy etap procesu nauki
- **Prezentacja warsztatu**: Profesjonalna komunikacja statusu z jasnym harmonogramem rozwoju

#### Poprawiono
- **Podejście bezpieczeństwa**: Zmiany infrastruktury mogą być teraz walidowane przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu mogą być udostępniane do przeglądu i zatwierdzenia
- **Świadomość kosztów**: Lepsze zrozumienie kosztów zasobów przed ich wdrożeniem
- **Minimalizacja ryzyka**: Zmniejszenie liczby niepowodzeń wdrożeniowych dzięki wcześniejszej walidacji

#### Implementacja techniczna
- **Integracja wielodokumentowa**: Funkcja podglądu udokumentowana w 4 kluczowych plikach
- **Wzorce poleceń**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd uwzględniony w przepływach walidacyjnych i skryptach
- **Wskaźniki wizualne**: Wyraźne oznaczenia NOWEJ funkcji dla łatwego odkrywania

#### Infrastruktura warsztatu
- **Komunikacja statusu**: Profesjonalny baner HTML ze stylizacją gradientową
- **Doświadczenie użytkownika**: Jasny status rozwoju zapobiega dezorientacji
- **Profesjonalna prezentacja**: Utrzymuje wiarygodność repozytorium przy jednoczesnym ustalaniu oczekiwań
- **Przejrzystość harmonogramu**: Ostatnia aktualizacja z datą październik 2025 dla odpowiedzialności

### [v3.3.0] - 2025-09-24

#### Ulepszone materiały warsztatowe i interaktywne doświadczenie edukacyjne
**Ta wersja wprowadza kompleksowe materiały warsztatowe z interaktywnymi przewodnikami przeglądarkowymi i ustrukturyzowanymi ścieżkami nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatowy**: Doświadczenie warsztatowe w przeglądarce z funkcją podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatowe**: 7-etapowa ścieżka nauki od odkrycia do personalizacji
  - 0-Wprowadzenie: Przegląd warsztatu i konfiguracja
  - 1-Wybór szablonu AI: Proces odkrywania i wyboru szablonu
  - 2-Walidacja szablonu AI: Procedury wdrożenia i walidacji
  - 3-Analiza szablonu AI: Zrozumienie architektury szablonu
  - 4-Konfiguracja szablonu AI: Konfiguracja i personalizacja
  - 5-Personalizacja szablonu AI: Zaawansowane modyfikacje i iteracje
  - 6-Rozbiórka infrastruktury: Czyszczenie i zarządzanie zasobami
  - 7-Podsumowanie: Podsumowanie i kolejne kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia edukacyjnego
- **🎯 Ścieżka nauki praktycznej**: Metodologia 3-etapowa (Odkrycie → Wdrożenie → Personalizacja)
- **📱 Integracja GitHub Codespaces**: Bezproblemowa konfiguracja środowiska deweloperskiego

#### Ulepszono
- **Laboratorium warsztatowe AI**: Rozszerzone o kompleksowe doświadczenie edukacyjne trwające 2-3 godziny
- **Dokumentacja warsztatowa**: Profesjonalna prezentacja z nawigacją i pomocami wizualnymi
- **Postęp w nauce**: Jasne wskazówki krok po kroku od wyboru szablonu do wdrożenia produkcyjnego
- **Doświadczenie dewelopera**: Zintegrowane narzędzia dla usprawnionych przepływów pracy deweloperskiej

#### Poprawiono
- **Dostępność**: Interfejs przeglądarkowy z funkcją wyszukiwania, kopiowania i przełączania motywów
- **Nauka we własnym tempie**: Elastyczna struktura warsztatu dostosowana do różnych prędkości nauki
- **Praktyczne zastosowanie**: Scenariusze wdrożenia szablonów AI w rzeczywistych warunkach
- **Integracja społecznościowa**: Integracja Discord dla wsparcia warsztatowego i współpracy

#### Funkcje warsztatu
- **Wbudowane wyszukiwanie**: Szybkie wyszukiwanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcja hover-to-copy dla wszystkich przykładów kodu
- **Przełączanie motywów**: Obsługa trybu ciemnego/jasnego dla różnych preferencji
- **Zasoby wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia
- **Integracja pomocy**: Bezpośredni dostęp do Discord dla wsparcia społecznościowego

### [v3.2.0] - 2025-09-17

#### Główna restrukturyzacja nawigacji i system nauki oparty na rozdziałach
**Ta wersja wprowadza kompleksową strukturę nauki opartą na rozdziałach z ulepszoną nawigacją w całym repozytorium.**

#### Dodano
- **📚 System nauki oparty na rozdziałach**: Przekształcenie całego kursu w 8 progresywnych rozdziałów nauki
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 min)
  - Rozdział 2: Rozwój z AI na pierwszym miejscu (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 min)
  - Rozdział 4: Infrastruktura jako kod i wdrożenie (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Rozwiązania AI z wieloma agentami (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja przed wdrożeniem i planowanie (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompletny system nawigacji**: Spójne nagłówki i stopki nawigacyjne w całej dokumentacji
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Wskazówki dotyczące ścieżki nauki**: Jasne punkty wejścia dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja między rozdziałami**: Powiązane rozdziały i wymagania wstępne jasno oznaczone

#### Ulepszono
- **Struktura README**: Przekształcona w ustrukturyzowaną platformę nauki z organizacją opartą na rozdziałach
- **Nawigacja dokumentacji**: Każda strona teraz zawiera kontekst rozdziału i wskazówki dotyczące postępu
- **Organizacja szablonów**: Przykłady i szablony przypisane do odpowiednich rozdziałów nauki
- **Integracja zasobów**: Arkusze skrótów, FAQ i przewodniki nauki połączone z odpowiednimi rozdziałami
- **Integracja warsztatów**: Laboratoria praktyczne przypisane do celów nauki w wielu rozdziałach

#### Zmieniono
- **Postęp w nauce**: Przejście od liniowej dokumentacji do elastycznej nauki opartej na rozdziałach
- **Umiejscowienie konfiguracji**: Przeniesienie przewodnika konfiguracji jako Rozdział 3 dla lepszego przepływu nauki
- **Integracja treści AI**: Lepsza integracja treści specyficznych dla AI w całej ścieżce nauki
- **Treści produkcyjne**: Zaawansowane wzorce skonsolidowane w Rozdziale 8 dla uczących się na poziomie korporacyjnym

#### Poprawiono
- **Doświadczenie użytkownika**: Jasne ścieżki nawigacyjne i wskaźniki postępu w rozdziałach
- **Dostępność**: Spójne wzorce nawigacyjne dla łatwiejszego poruszania się po kursie
- **Profesjonalna prezentacja**: Struktura kursu w stylu uniwersyteckim odpowiednia dla szkoleń akademickich i korporacyjnych
- **Efektywność nauki**: Skrócony czas na znalezienie odpowiednich treści dzięki ulepszonej organizacji

#### Implementacja techniczna
- **Nagłówki nawigacyjne**: Standaryzowana nawigacja rozdziałów w ponad 40 plikach dokumentacji
- **Stopki nawigacyjne**: Spójne wskazówki dotyczące postępu i wskaźniki ukończenia rozdziałów
- **Linkowanie wewnętrzne**: Kompleksowy system linków wewnętrznych łączący powiązane koncepcje
- **Mapowanie rozdziałów**: Szablony i przykłady wyraźnie powiązane z celami nauki

#### Ulepszenie przewodnika nauki
- **📚 Kompleksowe cele nauki**: Przekształcony przewodnik nauki dostosowany do systemu 8 rozdziałów
- **🎯 Ocena oparta na rozdziałach**: Każdy rozdział zawiera konkretne cele nauki i praktyczne ćwiczenia
- **📋 Śledzenie postępów**: Tygodniowy harmonogram nauki z mierzalnymi wynikami i listami kontrolnymi ukończenia
- **❓ Pytania oceniające**: Pytania weryfikujące wiedzę dla każdego rozdziału z profesjonalnymi wynikami
- **🛠️ Ćwiczenia praktyczne**: Działania praktyczne z rzeczywistymi scenariuszami wdrożeniowymi i rozwiązywaniem problemów
- **📊 Postęp umiejętności**: Jasny rozwój od podstawowych koncepcji do wzorców korporacyjnych z naciskiem na rozwój kariery
- **🎓 Ramy certyfikacji**: Wyniki rozwoju zawodowego i system uznania społecznościowego
- **⏱️ Zarządzanie harmonogramem**: Ustrukturyzowany 10-tygodniowy plan nauki z walidacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone rozwiązania AI z wieloma agentami
**Ta wersja poprawia rozwiązanie wieloagentowe dla handlu detalicznego, wprowadzając lepsze nazewnictwo agentów i ulepszoną dokumentację.**

#### Zmieniono
- **Terminologia wieloagentowa**: Zastąpiono "agent Cora" nazwą "agent klienta" w całym rozwiązaniu wieloagentowym dla handlu detalicznego dla lepszego zrozumienia
- **Architektura agentów**: Zaktualizowano całą dokumentację, szablony ARM i przykłady kodu, aby używać spójnego nazewnictwa "agent klienta"
- **Przykłady konfiguracji**: Zmodernizowano wzorce konfiguracji agentów z zaktualizowanymi konwencjami nazewnictwa
- **Spójność dokumentacji**: Upewniono się, że wszystkie odniesienia używają profesjonalnych, opisowych nazw agentów

#### Ulepszono
- **Pakiet szablonów ARM**: Zaktualizowano retail-multiagent-arm-template z odniesieniami do agenta klienta
- **Diagramy architektury**: Odświeżono diagramy Mermaid z zaktualizowanym nazewnictwem agentów
- **Przykłady kodu**: Klasy Python i przykłady implementacji teraz używają nazwy CustomerAgent
- **Zmienne środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe, aby używać konwencji CUSTOMER_AGENT_NAME

#### Poprawiono
- **Doświadczenie dewelopera**: Jasniejsze role i obowiązki agentów w dokumentacji
- **Gotowość produkcyjna**: Lepsze dostosowanie do korporacyjnych konwencji nazewnictwa
- **Materiały edukacyjne**: Bardziej intuicyjne nazewnictwo agentów dla celów edukacyjnych
- **Użyteczność szablonów**: Uproszczone zrozumienie funkcji agentów i wzorców wdrożeniowych

#### Szczegóły techniczne
- Zaktualizowano diagramy architektury Mermaid z odniesieniami do CustomerAgent
- Zastąpiono nazwy klas CoraAgent nazwą CustomerAgent w przykładach Python
- Zmodyfikowano konfiguracje JSON szablonów ARM, aby używać typu agenta "customer"
- Zaktualizowano zmienne środowiskowe z CORA_AGENT_* na CUSTOMER_AGENT_* 
- Odświeżono wszystkie polecenia wdrożeniowe i konfiguracje kontenerów

### [v3.0.0] - 2025-09-12

#### Główne zmiany - Skupienie na deweloperach AI i integracja Azure AI Foundry
**Ta wersja przekształca repozytorium w kompleksowe źródło nauki skoncentrowane na AI z integracją Azure AI Foundry.**

#### Dodano
- **🤖 Ścieżka nauki z AI na pierwszym miejscu**: Kompleksowa restrukturyzacja z priorytetem dla deweloperów i
- **Format dokumentacji**: Ujednolicono całą dokumentację, nadając jej spójny, edukacyjny charakter
- **Przepływ nawigacji**: Wprowadzono logiczną progresję w materiałach edukacyjnych
- **Prezentacja treści**: Usunięto elementy dekoracyjne na rzecz przejrzystego, profesjonalnego formatowania
- **Struktura linków**: Zaktualizowano wszystkie linki wewnętrzne, aby wspierały nowy system nawigacji

#### Ulepszenia
- **Dostępność**: Usunięto zależności od emoji, aby poprawić kompatybilność z czytnikami ekranu
- **Profesjonalny wygląd**: Czysta, akademicka prezentacja odpowiednia dla nauki w środowisku korporacyjnym
- **Doświadczenie edukacyjne**: Strukturalne podejście z jasnymi celami i wynikami dla każdej lekcji
- **Organizacja treści**: Lepszy logiczny przepływ i powiązania między pokrewnymi tematami

### [v1.0.0] - 2025-09-09

#### Pierwsze wydanie - Kompleksowe repozytorium nauki AZD

#### Dodano
- **Podstawowa struktura dokumentacji**
  - Kompletny przewodnik wprowadzający
  - Szczegółowa dokumentacja wdrożeniowa i provisioningowa
  - Zasoby dotyczące rozwiązywania problemów i przewodniki debugowania
  - Narzędzia i procedury walidacji przed wdrożeniem

- **Moduł wprowadzający**
  - Podstawy AZD: Kluczowe pojęcia i terminologia
  - Przewodnik instalacji: Instrukcje konfiguracji dla różnych platform
  - Przewodnik konfiguracji: Ustawienia środowiska i uwierzytelnianie
  - Pierwszy projekt: Praktyczne ćwiczenia krok po kroku

- **Moduł wdrożeniowy i provisioningowy**
  - Przewodnik wdrożeniowy: Kompleksowa dokumentacja procesu
  - Przewodnik provisioningowy: Infrastructure as Code z Bicep
  - Najlepsze praktyki dla wdrożeń produkcyjnych
  - Wzorce architektury wielousługowej

- **Moduł walidacji przed wdrożeniem**
  - Planowanie pojemności: Walidacja dostępności zasobów Azure
  - Wybór SKU: Szczegółowe wskazówki dotyczące poziomów usług
  - Kontrole przed wdrożeniem: Zautomatyzowane skrypty walidacyjne (PowerShell i Bash)
  - Narzędzia do szacowania kosztów i planowania budżetu

- **Moduł rozwiązywania problemów**
  - Typowe problemy: Najczęściej spotykane problemy i ich rozwiązania
  - Przewodnik debugowania: Systematyczne metody rozwiązywania problemów
  - Zaawansowane techniki diagnostyczne i narzędzia
  - Monitorowanie wydajności i optymalizacja

- **Zasoby i odniesienia**
  - Skrócona lista poleceń: Szybki dostęp do kluczowych komend
  - Słownik: Kompleksowe definicje terminów i skrótów
  - FAQ: Szczegółowe odpowiedzi na często zadawane pytania
  - Linki do zewnętrznych zasobów i społeczności

- **Przykłady i szablony**
  - Przykład prostej aplikacji internetowej
  - Szablon wdrożenia statycznej strony internetowej
  - Konfiguracja aplikacji kontenerowej
  - Wzorce integracji baz danych
  - Przykłady architektury mikroserwisów
  - Implementacje funkcji serverless

#### Funkcje
- **Wsparcie dla wielu platform**: Przewodniki instalacji i konfiguracji dla Windows, macOS i Linux
- **Różne poziomy umiejętności**: Treści dla studentów i profesjonalnych programistów
- **Praktyczne podejście**: Przykłady praktyczne i scenariusze z życia wzięte
- **Kompleksowe pokrycie**: Od podstawowych pojęć po zaawansowane wzorce korporacyjne
- **Bezpieczeństwo na pierwszym miejscu**: Najlepsze praktyki bezpieczeństwa zintegrowane w całej dokumentacji
- **Optymalizacja kosztów**: Wskazówki dotyczące efektywnych kosztowo wdrożeń i zarządzania zasobami

#### Jakość dokumentacji
- **Szczegółowe przykłady kodu**: Praktyczne, przetestowane fragmenty kodu
- **Instrukcje krok po kroku**: Jasne, konkretne wskazówki
- **Kompleksowe zarządzanie błędami**: Rozwiązywanie typowych problemów
- **Integracja najlepszych praktyk**: Standardy branżowe i rekomendacje
- **Kompatybilność wersji**: Aktualne informacje o najnowszych usługach Azure i funkcjach azd

## Planowane przyszłe ulepszenia

### Wersja 3.1.0 (Planowana)
#### Rozszerzenie platformy AI
- **Wsparcie dla wielu modeli**: Wzorce integracji dla Hugging Face, Azure Machine Learning i modeli niestandardowych
- **Frameworki agentów AI**: Szablony dla LangChain, Semantic Kernel i AutoGen
- **Zaawansowane wzorce RAG**: Opcje baz danych wektorowych poza Azure AI Search (Pinecone, Weaviate itp.)
- **Obserwowalność AI**: Ulepszone monitorowanie wydajności modeli, użycia tokenów i jakości odpowiedzi

#### Doświadczenie programistyczne
- **Rozszerzenie VS Code**: Zintegrowane środowisko programistyczne AZD + AI Foundry
- **Integracja GitHub Copilot**: Generowanie szablonów AZD wspomagane przez AI
- **Interaktywne samouczki**: Praktyczne ćwiczenia kodowania z automatyczną walidacją dla scenariuszy AI
- **Treści wideo**: Dodatkowe samouczki wideo dla osób uczących się wizualnie, skupione na wdrożeniach AI

### Wersja 4.0.0 (Planowana)
#### Wzorce AI dla przedsiębiorstw
- **Ramowe zasady zarządzania**: Zarządzanie modelami AI, zgodność i ścieżki audytu
- **AI dla wielu najemców**: Wzorce obsługi wielu klientów z izolowanymi usługami AI
- **Wdrożenie AI na brzegu**: Integracja z Azure IoT Edge i instancjami kontenerowymi
- **AI w chmurze hybrydowej**: Wzorce wdrożenia wielochmurowego i hybrydowego dla obciążeń AI

#### Zaawansowane funkcje
- **Automatyzacja pipeline'ów AI**: Integracja MLOps z pipeline'ami Azure Machine Learning
- **Zaawansowane bezpieczeństwo**: Wzorce zero-trust, prywatne punkty końcowe i zaawansowana ochrona przed zagrożeniami
- **Optymalizacja wydajności**: Zaawansowane strategie dostrajania i skalowania dla aplikacji AI o dużej przepustowości
- **Globalna dystrybucja**: Wzorce dostarczania treści i buforowania na brzegu dla aplikacji AI

### Wersja 3.0.0 (Planowana) - Zastąpiona przez bieżące wydanie
#### Proponowane dodatki - Teraz zaimplementowane w wersji 3.0.0
- ✅ **Treści skoncentrowane na AI**: Kompleksowa integracja Azure AI Foundry (Zakończono)
- ✅ **Interaktywne samouczki**: Praktyczne laboratorium warsztatowe AI (Zakończono)
- ✅ **Zaawansowany moduł bezpieczeństwa**: Wzorce bezpieczeństwa specyficzne dla AI (Zakończono)
- ✅ **Optymalizacja wydajności**: Strategie dostrajania obciążeń AI (Zakończono)

### Wersja 2.1.0 (Planowana) - Częściowo zaimplementowana w wersji 3.0.0
#### Drobne ulepszenia - Częściowo zakończone w bieżącym wydaniu
- ✅ **Dodatkowe przykłady**: Scenariusze wdrożenia skoncentrowane na AI (Zakończono)
- ✅ **Rozszerzone FAQ**: Pytania i rozwiązywanie problemów związanych z AI (Zakończono)
- **Integracja narzędzi**: Ulepszone przewodniki integracji z IDE i edytorami
- ✅ **Rozszerzone monitorowanie**: Wzorce monitorowania i alertów specyficzne dla AI (Zakończono)

#### Nadal planowane na przyszłe wydanie
- **Dokumentacja przyjazna dla urządzeń mobilnych**: Projekt responsywny dla nauki mobilnej
- **Dostęp offline**: Pakiety dokumentacji do pobrania
- **Ulepszona integracja z IDE**: Rozszerzenie VS Code dla AZD + AI
- **Dashboard społecznościowy**: Statystyki społeczności w czasie rzeczywistym i śledzenie wkładu

## Wkład w changelog

### Zgłaszanie zmian
Podczas wnoszenia wkładu do tego repozytorium, upewnij się, że wpisy w changelogu zawierają:

1. **Numer wersji**: Zgodnie z semantycznym wersjonowaniem (major.minor.patch)
2. **Data**: Data wydania lub aktualizacji w formacie YYYY-MM-DD
3. **Kategoria**: Dodano, Zmieniono, Wycofano, Usunięto, Naprawiono, Bezpieczeństwo
4. **Jasny opis**: Zwięzły opis zmiany
5. **Ocena wpływu**: Jak zmiany wpływają na istniejących użytkowników

### Kategorie zmian

#### Dodano
- Nowe funkcje, sekcje dokumentacji lub możliwości
- Nowe przykłady, szablony lub zasoby edukacyjne
- Dodatkowe narzędzia, skrypty lub programy użytkowe

#### Zmieniono
- Modyfikacje istniejącej funkcjonalności lub dokumentacji
- Aktualizacje poprawiające przejrzystość lub dokładność
- Przekształcenie treści lub organizacji

#### Wycofano
- Funkcje lub podejścia, które są wycofywane
- Sekcje dokumentacji zaplanowane do usunięcia
- Metody, które mają lepsze alternatywy

#### Usunięto
- Funkcje, dokumentację lub przykłady, które nie są już istotne
- Przestarzałe informacje lub wycofane podejścia
- Zbędne lub skonsolidowane treści

#### Naprawiono
- Poprawki błędów w dokumentacji lub kodzie
- Rozwiązanie zgłoszonych problemów lub trudności
- Ulepszenia dokładności lub funkcjonalności

#### Bezpieczeństwo
- Ulepszenia lub poprawki związane z bezpieczeństwem
- Aktualizacje najlepszych praktyk bezpieczeństwa
- Rozwiązanie luk w zabezpieczeniach

### Wytyczne dotyczące semantycznego wersjonowania

#### Wersja główna (X.0.0)
- Zmiany powodujące konieczność działania ze strony użytkownika
- Znaczące przekształcenie treści lub organizacji
- Zmiany, które zmieniają fundamentalne podejście lub metodologię

#### Wersja mniejsza (X.Y.0)
- Nowe funkcje lub dodatki do treści
- Ulepszenia zachowujące kompatybilność wsteczną
- Dodatkowe przykłady, narzędzia lub zasoby

#### Wersja poprawkowa (X.Y.Z)
- Poprawki błędów i korekty
- Drobne ulepszenia istniejących treści
- Wyjaśnienia i niewielkie usprawnienia

## Opinie społeczności i sugestie

Aktywnie zachęcamy społeczność do dzielenia się opiniami, aby ulepszyć te materiały edukacyjne:

### Jak przekazać opinię
- **Problemy na GitHubie**: Zgłaszaj problemy lub sugeruj ulepszenia (mile widziane kwestie związane z AI)
- **Dyskusje na Discordzie**: Dziel się pomysłami i angażuj się w społeczność Azure AI Foundry
- **Pull Requesty**: Wnoszenie bezpośrednich ulepszeń do treści, szczególnie szablonów i przewodników AI
- **Discord Azure AI Foundry**: Udział w kanale #Azure dla dyskusji o AZD + AI
- **Fora społecznościowe**: Udział w szerszych dyskusjach na temat programowania w Azure

### Kategorie opinii
- **Dokładność treści AI**: Poprawki dotyczące integracji usług AI i informacji o wdrożeniu
- **Doświadczenie edukacyjne**: Sugestie dotyczące poprawy przepływu nauki dla programistów AI
- **Brakujące treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI
- **Dostępność**: Ulepszenia dla różnych potrzeb edukacyjnych
- **Integracja narzędzi AI**: Sugestie dotyczące lepszej integracji przepływu pracy programistycznej AI
- **Wzorce produkcyjne AI**: Prośby o wzorce wdrożeniowe AI dla przedsiębiorstw

### Zobowiązanie do odpowiedzi
- **Odpowiedź na problemy**: W ciągu 48 godzin od zgłoszenia problemów
- **Prośby o funkcje**: Ocena w ciągu tygodnia
- **Wkład społeczności**: Przegląd w ciągu tygodnia
- **Problemy bezpieczeństwa**: Priorytet natychmiastowy z przyspieszoną odpowiedzią

## Harmonogram konserwacji

### Regularne aktualizacje
- **Przeglądy miesięczne**: Sprawdzanie dokładności treści i walidacja linków
- **Aktualizacje kwartalne**: Główne dodatki i ulepszenia treści
- **Przeglądy półroczne**: Kompleksowe przekształcenie i ulepszenie
- **Wydania roczne**: Główne aktualizacje wersji z istotnymi ulepszeniami

### Monitorowanie i zapewnienie jakości
- **Testy automatyczne**: Regularna walidacja przykładów kodu i linków
- **Integracja opinii społeczności**: Regularne uwzględnianie sugestii użytkowników
- **Aktualizacje technologiczne**: Dopasowanie do najnowszych usług Azure i funkcji azd
- **Audyt dostępności**: Regularne przeglądy zgodności z zasadami projektowania inkluzywnego

## Polityka wsparcia wersji

### Wsparcie dla bieżącej wersji
- **Najnowsza wersja główna**: Pełne wsparcie z regularnymi aktualizacjami
- **Poprzednia wersja główna**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy
- **Wersje starsze**: Wsparcie społecznościowe, brak oficjalnych aktualizacji

### Wskazówki dotyczące migracji
Gdy wydawane są główne wersje, zapewniamy:
- **Przewodniki migracyjne**: Instrukcje krok po kroku dotyczące przejścia
- **Uwagi dotyczące kompatybilności**: Szczegóły dotyczące zmian powodujących problemy
- **Wsparcie narzędziowe**: Skrypty lub narzędzia wspomagające migrację
- **Wsparcie społecznościowe**: Dedykowane fora do pytań dotyczących migracji

---

**Nawigacja**
- **Poprzednia lekcja**: [Przewodnik nauki](resources/study-guide.md)
- **Następna lekcja**: Powrót do [Głównego README](README.md)

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wydaniach i ważnych aktualizacjach materiałów edukacyjnych.

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.