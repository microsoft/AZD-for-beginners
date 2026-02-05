# Dziennik zmian - AZD dla początkujących

## Wprowadzenie

Ten dziennik zmian dokumentuje wszystkie istotne zmiany, aktualizacje i ulepszenia w repozytorium AZD dla początkujących. Stosujemy zasady wersjonowania semantycznego i prowadzimy ten log, aby pomóc użytkownikom zrozumieć, co zmieniło się między wersjami.

## Cele nauki

Przeglądając ten dziennik zmian, dowiesz się:
- O nowych funkcjach i dodanych treściach
- O ulepszeniach w istniejącej dokumentacji
- O poprawkach błędów i korektach zapewniających dokładność
- O ewolucji materiałów edukacyjnych na przestrzeni czasu

## Efekty nauki

Po zapoznaniu się z wpisami w dzienniku zmian będziesz w stanie:
- Zidentyfikować nowe treści i zasoby dostępne do nauki
- Zrozumieć, które sekcje zostały zaktualizowane lub ulepszone
- Zaplanować swoją ścieżkę nauki na podstawie najnowszych materiałów
- Przekazać opinie i sugestie dotyczące przyszłych ulepszeń

## Historia wersji

### [v3.8.0] - 2025-11-19

#### Zaawansowana dokumentacja: Monitorowanie, bezpieczeństwo i wzorce wieloagentowe
**Ta wersja dodaje kompleksowe lekcje na poziomie A dotyczące integracji Application Insights, wzorców uwierzytelniania oraz koordynacji wieloagentowej dla wdrożeń produkcyjnych.**

#### Dodano
- **📊 Lekcja integracji Application Insights**: w `docs/pre-deployment/application-insights.md`:
  - Wdrożenie skoncentrowane na AZD z automatycznym provisioningiem
  - Kompletny szablon Bicep dla Application Insights + Log Analytics
  - Działające aplikacje Python z niestandardową telemetrią (ponad 1200 linii kodu)
  - Wzorce monitorowania AI/LLM (śledzenie tokenów/kosztów Azure OpenAI)
  - 6 diagramów Mermaid (architektura, śledzenie rozproszone, przepływ telemetrii)
  - 3 ćwiczenia praktyczne (alerty, dashboardy, monitorowanie AI)
  - Przykłady zapytań Kusto i strategie optymalizacji kosztów
  - Streaming metryk na żywo i debugowanie w czasie rzeczywistym
  - Czas nauki: 40-50 minut z wzorcami gotowymi do produkcji

- **🔐 Lekcja wzorców uwierzytelniania i bezpieczeństwa**: w `docs/getting-started/authsecurity.md`:
  - 3 wzorce uwierzytelniania (connection strings, Key Vault, managed identity)
  - Kompletny szablon infrastruktury Bicep dla bezpiecznych wdrożeń
  - Kod aplikacji Node.js z integracją Azure SDK
  - 3 kompletne ćwiczenia (włączenie managed identity, user-assigned identity, rotacja Key Vault)
  - Najlepsze praktyki bezpieczeństwa i konfiguracje RBAC
  - Przewodnik rozwiązywania problemów i analiza kosztów
  - Wzorce uwierzytelniania bez haseł gotowe do produkcji

- **🤖 Lekcja wzorców koordynacji wieloagentowej**: w `docs/pre-deployment/coordination-patterns.md`:
  - 5 wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
  - Kompletny serwis orkiestratora (Python/Flask, ponad 1500 linii kodu)
  - 3 specjalistyczne implementacje agentów (Badacz, Autor, Redaktor)
  - Integracja Service Bus dla kolejkowania wiadomości
  - Zarządzanie stanem w Cosmos DB dla systemów rozproszonych
  - 6 diagramów Mermaid pokazujących interakcje agentów
  - 3 zaawansowane ćwiczenia (obsługa timeoutów, logika retry, circuit breaker)
  - Rozkład kosztów (240-565 USD/miesiąc) ze strategiami optymalizacji
  - Integracja Application Insights dla monitorowania

#### Ulepszono
- **Rozdział przed wdrożeniem**: Teraz zawiera kompleksowe wzorce monitorowania i koordynacji
- **Rozdział wprowadzenia**: Ulepszony o profesjonalne wzorce uwierzytelniania
- **Gotowość produkcyjna**: Pełne pokrycie od bezpieczeństwa po obserwowalność
- **Plan kursu**: Zaktualizowany, aby odwoływać się do nowych lekcji w rozdziałach 3 i 6

#### Zmieniono
- **Postęp nauki**: Lepsza integracja bezpieczeństwa i monitorowania w całym kursie
- **Jakość dokumentacji**: Spójne standardy na poziomie A (95-97%) w nowych lekcjach
- **Wzorce produkcyjne**: Pełne pokrycie od początku do końca dla wdrożeń korporacyjnych

#### Poprawiono
- **Doświadczenie dewelopera**: Jasna ścieżka od rozwoju do monitorowania produkcji
- **Standardy bezpieczeństwa**: Profesjonalne wzorce uwierzytelniania i zarządzania tajemnicami
- **Obserwowalność**: Kompleksowa integracja Application Insights z AZD
- **Obciążenia AI**: Specjalistyczne monitorowanie dla Azure OpenAI i systemów wieloagentowych

#### Zweryfikowano
- ✅ Wszystkie lekcje zawierają kompletny działający kod (nie fragmenty)
- ✅ Diagramy Mermaid dla nauki wizualnej (łącznie 19 w 3 lekcjach)
- ✅ Ćwiczenia praktyczne z krokami weryfikacji (łącznie 9)
- ✅ Szablony Bicep gotowe do produkcji wdrażane za pomocą `azd up`
- ✅ Analiza kosztów i strategie optymalizacji
- ✅ Przewodniki rozwiązywania problemów i najlepsze praktyki
- ✅ Punkty kontrolne wiedzy z poleceniami weryfikacyjnymi

#### Wyniki oceny dokumentacji
- **docs/pre-deployment/application-insights.md**: - Kompleksowy przewodnik monitorowania
- **docs/getting-started/authsecurity.md**: - Profesjonalne wzorce bezpieczeństwa
- **docs/pre-deployment/coordination-patterns.md**: - Zaawansowane architektury wieloagentowe
- **Ogólna nowa zawartość**: - Spójne wysokie standardy jakości

#### Implementacja techniczna
- **Application Insights**: Log Analytics + niestandardowa telemetria + śledzenie rozproszone
- **Uwierzytelnianie**: Managed Identity + Key Vault + wzorce RBAC
- **Wieloagentowość**: Service Bus + Cosmos DB + Container Apps + orkiestracja
- **Monitorowanie**: Metryki na żywo + zapytania Kusto + alerty + dashboardy
- **Zarządzanie kosztami**: Strategie próbkowania, polityki retencji, kontrola budżetu

### [v3.7.0] - 2025-11-19

#### Poprawa jakości dokumentacji i nowy przykład Azure OpenAI
**Ta wersja poprawia jakość dokumentacji w całym repozytorium i dodaje kompletny przykład wdrożenia Azure OpenAI z interfejsem czatu GPT-4.**

#### Dodano
- **🤖 Przykład czatu Azure OpenAI**: Kompletny wdrożenie GPT-4 z działającą implementacją w `examples/azure-openai-chat/`:
  - Kompletną infrastrukturę Azure OpenAI (wdrożenie modelu GPT-4)
  - Interfejs czatu w Pythonie z historią rozmów
  - Integrację Key Vault dla bezpiecznego przechowywania kluczy API
  - Śledzenie użycia tokenów i szacowanie kosztów
  - Ograniczanie szybkości i obsługę błędów
  - Kompletny README z przewodnikiem wdrożenia (35-45 minut)
  - 11 plików gotowych do produkcji (szablony Bicep, aplikacja Python, konfiguracja)
- **📚 Ćwiczenia dokumentacyjne**: Dodano praktyczne ćwiczenia do przewodnika konfiguracji:
  - Ćwiczenie 1: Konfiguracja wielośrodowiskowa (15 minut)
  - Ćwiczenie 2: Praktyka zarządzania tajemnicami (10 minut)
  - Jasne kryteria sukcesu i kroki weryfikacji
- **✅ Weryfikacja wdrożenia**: Dodano sekcję weryfikacji do przewodnika wdrożenia:
  - Procedury sprawdzania stanu
  - Lista kryteriów sukcesu
  - Oczekiwane wyniki dla wszystkich poleceń wdrożeniowych
  - Szybki przewodnik rozwiązywania problemów

#### Ulepszono
- **examples/README.md**: Zaktualizowano do jakości na poziomie A (93%):
  - Dodano azure-openai-chat do wszystkich odpowiednich sekcji
  - Zaktualizowano liczbę lokalnych przykładów z 3 do 4
  - Dodano do tabeli przykładów aplikacji AI
  - Zintegrowano z szybkim startem dla użytkowników średniozaawansowanych
  - Dodano do sekcji szablonów Azure AI Foundry
  - Zaktualizowano matrycę porównawczą i sekcje dotyczące technologii
- **Jakość dokumentacji**: Poprawiono z B+ (87%) → A- (92%) w folderze docs:
  - Dodano oczekiwane wyniki do kluczowych przykładów poleceń
  - Uwzględniono kroki weryfikacji dla zmian konfiguracji
  - Ulepszono naukę praktyczną dzięki ćwiczeniom praktycznym

#### Zmieniono
- **Postęp nauki**: Lepsza integracja przykładów AI dla użytkowników średniozaawansowanych
- **Struktura dokumentacji**: Bardziej praktyczne ćwiczenia z jasnymi wynikami
- **Proces weryfikacji**: Dodano wyraźne kryteria sukcesu do kluczowych przepływów pracy

#### Poprawiono
- **Doświadczenie dewelopera**: Wdrożenie Azure OpenAI zajmuje teraz 35-45 minut (vs 60-90 dla bardziej złożonych alternatyw)
- **Przejrzystość kosztów**: Jasne szacunki kosztów (50-200 USD/miesiąc) dla przykładu Azure OpenAI
- **Ścieżka nauki**: Deweloperzy AI mają jasny punkt wejścia z azure-openai-chat
- **Standardy dokumentacji**: Spójne oczekiwane wyniki i kroki weryfikacji

#### Zweryfikowano
- ✅ Przykład Azure OpenAI w pełni funkcjonalny z `azd up`
- ✅ Wszystkie 11 plików implementacyjnych poprawnych składniowo
- ✅ Instrukcje README odpowiadają rzeczywistemu doświadczeniu wdrożeniowemu
- ✅ Linki dokumentacji zaktualizowane w ponad 8 lokalizacjach
- ✅ Indeks przykładów dokładnie odzwierciedla 4 lokalne przykłady
- ✅ Brak zduplikowanych linków zewnętrznych w tabelach
- ✅ Wszystkie odniesienia nawigacyjne poprawne

#### Implementacja techniczna
- **Architektura Azure OpenAI**: GPT-4 + Key Vault + wzorzec Container Apps
- **Bezpieczeństwo**: Gotowe Managed Identity, tajemnice w Key Vault
- **Monitorowanie**: Integracja Application Insights
- **Zarządzanie kosztami**: Śledzenie tokenów i optymalizacja użycia
- **Wdrożenie**: Pojedyncze polecenie `azd up` dla kompletnej konfiguracji

### [v3.6.0] - 2025-11-19

#### Główna aktualizacja: Przykłady wdrożeń aplikacji kontenerowych
**Ta wersja wprowadza kompleksowe, gotowe do produkcji przykłady wdrożeń aplikacji kontenerowych za pomocą Azure Developer CLI (AZD), z pełną dokumentacją i integracją w ścieżce nauki.**

#### Dodano
- **🚀 Przykłady aplikacji kontenerowych**: Nowe lokalne przykłady w `examples/container-app/`:
  - [Przewodnik główny](examples/container-app/README.md): Kompletny przegląd wdrożeń kontenerowych, szybki start, produkcja i zaawansowane wzorce
  - [Prosty Flask API](../../examples/container-app/simple-flask-api): Przyjazny dla początkujących REST API ze skalowaniem do zera, sondami zdrowia, monitorowaniem i rozwiązywaniem problemów
  - [Architektura mikroserwisów](../../examples/container-app/microservices): Gotowe do produkcji wdrożenie wieloserwisowe (API Gateway, Product, Order, User, Notification), asynchroniczne przesyłanie wiadomości, Service Bus, Cosmos DB, Azure SQL, śledzenie rozproszone, wdrożenie blue-green/canary
- **Najlepsze praktyki**: Bezpieczeństwo, monitorowanie, optymalizacja kosztów i wskazówki dotyczące CI/CD dla obciążeń kontenerowych
- **Przykłady kodu**: Kompletny `azure.yaml`, szablony Bicep i implementacje usług w wielu językach (Python, Node.js, C#, Go)
- **Testowanie i rozwiązywanie problemów**: Scenariusze testowe end-to-end, polecenia monitorowania, przewodnik rozwiązywania problemów

#### Zmieniono
- **README.md**: Zaktualizowano, aby wyróżnić i podlinkować nowe przykłady aplikacji kontenerowych w sekcji "Lokalne przykłady - aplikacje kontenerowe"
- **examples/README.md**: Zaktualizowano, aby podkreślić przykłady aplikacji kontenerowych, dodać wpisy do matrycy porównawczej i zaktualizować odniesienia do technologii/architektury
- **Plan kursu i przewodnik nauki**: Zaktualizowano, aby odwoływać się do nowych przykładów aplikacji kontenerowych i wzorców wdrożeniowych w odpowiednich rozdziałach

#### Zweryfikowano
- ✅ Wszystkie nowe przykłady wdrażalne za pomocą `azd up` i zgodne z najlepszymi praktykami
- ✅ Zaktualizowane linki dokumentacji i nawigacji
- ✅ Przykłady obejmują scenariusze od początkujących do zaawansowanych, w tym produkcyjne mikroserwisy

#### Uwagi
- **Zakres**: Dokumentacja i przykłady w języku angielskim
- **Kolejne kroki**: Rozszerzenie o dodatkowe zaawansowane wzorce kontenerowe i automatyzację CI/CD w przyszłych wersjach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Ta wersja wprowadza kompleksową zmianę nazwy produktu z "Azure AI Foundry" na "Microsoft Foundry" we wszystkich dokumentach w języku angielskim, odzwierciedlając oficjalny rebranding Microsoftu.**

#### Zmieniono
- **🔄 Aktualizacja nazwy produktu**: Kompletny rebranding z "Azure AI Foundry" na "Microsoft Foundry"
  - Zaktualizowano wszystkie odniesienia w dokumentacji w języku angielskim w folderze `docs/`
  - Zmieniono nazwę folderu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Zmieniono nazwę pliku: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Łącznie: 23 odniesienia do treści zaktualizowane w 7 plikach dokumentacji

- **📁 Zmiany w strukturze folderów**:
  - `docs/ai-foundry/` przemianowano na `docs/microsoft-foundry/`
  - Zaktualizowano wszystkie odnośniki krzyżowe, aby odzwierciedlały nową strukturę folderów
  - Zweryfikowano linki nawigacyjne w całej dokumentacji

- **📄 Zmiany nazw plików**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Zaktualizowano wszystkie linki wewnętrzne, aby odwoływały się do nowej nazwy pliku

#### Zaktualizowane pliki
- **Dokumentacja rozdziałów** (7 plików):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizacje linków nawigacyjnych
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizacje odniesień do nazwy produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Już używa Microsoft Foundry (z poprzednich aktualizacji)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizacje odniesień (przegląd, opinie społeczności, dokumentacja)
  - `docs/getting-started/azd-basics.md` - 4 aktualizacje linków krzyżowych

- **Warsztaty**: Materiały warsztatowe (`workshop/`) nie zostały zaktualizowane w tej wersji
- **Przykłady**: Pliki przykładów mogą nadal odnosić się do starszego nazewnictwa (do poprawy w przyszłej aktualizacji)
- **Linki zewnętrzne**: Zewnętrzne adresy URL i odnośniki do repozytorium GitHub pozostają bez zmian

#### Przewodnik migracji dla współtwórców
Jeśli posiadasz lokalne gałęzie lub dokumentację odnoszącą się do starej struktury:
1. Zaktualizuj odniesienia do folderów: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Zaktualizuj odniesienia do plików: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zmień nazwę produktu: "Azure AI Foundry" → "Microsoft Foundry"
4. Zweryfikuj, czy wszystkie wewnętrzne linki w dokumentacji nadal działają

---

### [v3.4.0] - 2025-10-24

#### Podgląd infrastruktury i ulepszenia walidacji
**Ta wersja wprowadza kompleksowe wsparcie dla nowej funkcji podglądu Azure Developer CLI oraz poprawia doświadczenie użytkowników warsztatów.**

#### Dodano
- **🧪 Dokumentacja funkcji `azd provision --preview`**: Szczegółowe omówienie nowej funkcji podglądu infrastruktury
  - Odniesienia do komend i przykłady użycia w arkuszu pomocy
  - Szczegółowa integracja w przewodniku wdrożeniowym z przykładami użycia i korzyściami
  - Integracja kontroli wstępnej dla bezpieczniejszej walidacji wdrożeń
  - Aktualizacje przewodnika "Pierwsze kroki" z praktykami bezpiecznego wdrażania
- **🚧 Baner statusu warsztatów**: Profesjonalny baner HTML wskazujący status rozwoju warsztatów
  - Projekt gradientowy z wskaźnikami budowy dla jasnej komunikacji z użytkownikami
  - Znacznik czasu ostatniej aktualizacji dla przejrzystości
  - Projekt responsywny dla urządzeń mobilnych

#### Ulepszono
- **Bezpieczeństwo infrastruktury**: Funkcjonalność podglądu zintegrowana w całej dokumentacji wdrożeniowej
- **Walidacja przed wdrożeniem**: Zautomatyzowane skrypty teraz obejmują testowanie podglądu infrastruktury
- **Przepływ pracy dewelopera**: Zaktualizowane sekwencje komend, aby uwzględniały podgląd jako najlepszą praktykę
- **Doświadczenie warsztatowe**: Jasne oczekiwania dla użytkowników dotyczące statusu rozwoju treści

#### Zmieniono
- **Najlepsze praktyki wdrożeniowe**: Przepływ pracy z podglądem jako zalecane podejście
- **Przepływ dokumentacji**: Walidacja infrastruktury przeniesiona wcześniej w procesie nauki
- **Prezentacja warsztatów**: Profesjonalna komunikacja statusu z jasnym harmonogramem rozwoju

#### Poprawiono
- **Podejście "Bezpieczeństwo przede wszystkim"**: Zmiany w infrastrukturze można teraz zweryfikować przed wdrożeniem
- **Współpraca zespołowa**: Wyniki podglądu można udostępniać do przeglądu i zatwierdzenia
- **Świadomość kosztów**: Lepsze zrozumienie kosztów zasobów przed ich wdrożeniem
- **Minimalizacja ryzyka**: Zmniejszenie liczby nieudanych wdrożeń dzięki wcześniejszej walidacji

#### Implementacja techniczna
- **Integracja wielodokumentowa**: Funkcja podglądu udokumentowana w 4 kluczowych plikach
- **Wzorce komend**: Spójna składnia i przykłady w całej dokumentacji
- **Integracja najlepszych praktyk**: Podgląd uwzględniony w przepływach walidacji i skryptach
- **Wskaźniki wizualne**: Wyraźne oznaczenia NOWYCH funkcji dla łatwego odnalezienia

#### Infrastruktura warsztatów
- **Komunikacja statusu**: Profesjonalny baner HTML z gradientowym stylem
- **Doświadczenie użytkownika**: Jasny status rozwoju zapobiega dezorientacji
- **Profesjonalna prezentacja**: Utrzymuje wiarygodność repozytorium przy jednoczesnym ustalaniu oczekiwań
- **Przejrzystość harmonogramu**: Znacznik czasu ostatniej aktualizacji z października 2025 dla odpowiedzialności

### [v3.3.0] - 2025-09-24

#### Ulepszone materiały warsztatowe i interaktywne doświadczenie edukacyjne
**Ta wersja wprowadza kompleksowe materiały warsztatowe z interaktywnymi przewodnikami przeglądarkowymi i ustrukturyzowanymi ścieżkami nauki.**

#### Dodano
- **🎥 Interaktywny przewodnik warsztatowy**: Doświadczenie warsztatowe w przeglądarce z funkcją podglądu MkDocs
- **📝 Ustrukturyzowane instrukcje warsztatowe**: 7-etapowa ścieżka nauki od odkrycia do personalizacji
  - 0-Wprowadzenie: Przegląd warsztatów i konfiguracja
  - 1-Wybór szablonu AI: Proces odkrywania i wyboru szablonu
  - 2-Walidacja szablonu AI: Procedury wdrożenia i walidacji
  - 3-Rozbiór szablonu AI: Zrozumienie architektury szablonu
  - 4-Konfiguracja szablonu AI: Konfiguracja i personalizacja
  - 5-Personalizacja szablonu AI: Zaawansowane modyfikacje i iteracje
  - 6-Likwidacja infrastruktury: Sprzątanie i zarządzanie zasobami
  - 7-Podsumowanie: Podsumowanie i kolejne kroki
- **🛠️ Narzędzia warsztatowe**: Konfiguracja MkDocs z motywem Material dla lepszego doświadczenia edukacyjnego
- **🎯 Ścieżka nauki praktycznej**: 3-etapowa metodologia (Odkrycie → Wdrożenie → Personalizacja)
- **📱 Integracja z GitHub Codespaces**: Bezproblemowa konfiguracja środowiska deweloperskiego

#### Ulepszono
- **Laboratorium warsztatowe AI**: Rozszerzone o kompleksowe, 2-3 godzinne ustrukturyzowane doświadczenie edukacyjne
- **Dokumentacja warsztatowa**: Profesjonalna prezentacja z nawigacją i pomocami wizualnymi
- **Postęp w nauce**: Jasne wskazówki krok po kroku od wyboru szablonu do wdrożenia produkcyjnego
- **Doświadczenie dewelopera**: Zintegrowane narzędzia dla usprawnionych przepływów pracy

#### Poprawiono
- **Dostępność**: Interfejs przeglądarkowy z wyszukiwaniem, funkcją kopiowania i przełączaniem motywów
- **Nauka we własnym tempie**: Elastyczna struktura warsztatów dostosowana do różnych prędkości nauki
- **Praktyczne zastosowanie**: Scenariusze wdrożenia szablonów AI w rzeczywistych warunkach
- **Integracja społecznościowa**: Integracja z Discordem dla wsparcia warsztatowego i współpracy

#### Funkcje warsztatowe
- **Wbudowane wyszukiwanie**: Szybkie wyszukiwanie słów kluczowych i lekcji
- **Kopiowanie bloków kodu**: Funkcja kopiowania po najechaniu na wszystkie przykłady kodu
- **Przełączanie motywów**: Obsługa trybu jasnego/ciemnego dla różnych preferencji
- **Zasoby wizualne**: Zrzuty ekranu i diagramy dla lepszego zrozumienia
- **Integracja pomocy**: Bezpośredni dostęp do Discorda dla wsparcia społecznościowego

### [v3.2.0] - 2025-09-17

#### Główna restrukturyzacja nawigacji i system nauki rozdziałowej
**Ta wersja wprowadza kompleksową strukturę nauki rozdziałowej z ulepszoną nawigacją w całym repozytorium.**

#### Dodano
- **📚 System nauki rozdziałowej**: Przekształcono cały kurs w 8 progresywnych rozdziałów nauki
  - Rozdział 1: Podstawy i szybki start (⭐ - 30-45 min)
  - Rozdział 2: Rozwój AI-First (⭐⭐ - 1-2 godziny)
  - Rozdział 3: Konfiguracja i uwierzytelnianie (⭐⭐ - 45-60 min)
  - Rozdział 4: Infrastruktura jako kod i wdrożenie (⭐⭐⭐ - 1-1,5 godziny)
  - Rozdział 5: Rozwiązania AI z wieloma agentami (⭐⭐⭐⭐ - 2-3 godziny)
  - Rozdział 6: Walidacja przed wdrożeniem i planowanie (⭐⭐ - 1 godzina)
  - Rozdział 7: Rozwiązywanie problemów i debugowanie (⭐⭐ - 1-1,5 godziny)
  - Rozdział 8: Wzorce produkcyjne i korporacyjne (⭐⭐⭐⭐ - 2-3 godziny)
- **📚 Kompleksowy system nawigacji**: Spójne nagłówki i stopki nawigacyjne w całej dokumentacji
- **🎯 Śledzenie postępów**: Lista kontrolna ukończenia kursu i system weryfikacji nauki
- **🗺️ Przewodnik ścieżki nauki**: Jasne punkty wejścia dla różnych poziomów doświadczenia i celów
- **🔗 Nawigacja krzyżowa**: Powiązane rozdziały i wymagania wstępne jasno połączone

#### Ulepszono
- **Struktura README**: Przekształcona w ustrukturyzowaną platformę nauki z organizacją rozdziałową
- **Nawigacja dokumentacji**: Każda strona zawiera teraz kontekst rozdziału i wskazówki dotyczące postępu
- **Organizacja szablonów**: Przykłady i szablony przypisane do odpowiednich rozdziałów nauki
- **Integracja zasobów**: Arkusze pomocy, FAQ i przewodniki połączone z odpowiednimi rozdziałami
- **Integracja warsztatów**: Laboratoria praktyczne przypisane do celów nauki w wielu rozdziałach

#### Zmieniono
- **Postęp w nauce**: Przejście z liniowej dokumentacji na elastyczną naukę rozdziałową
- **Umiejscowienie konfiguracji**: Przeniesiono przewodnik konfiguracji jako Rozdział 3 dla lepszego przepływu nauki
- **Integracja treści AI**: Lepsza integracja treści specyficznych dla AI w całej ścieżce nauki
- **Treści produkcyjne**: Zaawansowane wzorce skonsolidowane w Rozdziale 8 dla uczących się na poziomie korporacyjnym

#### Poprawiono
- **Doświadczenie użytkownika**: Jasne nawigacyjne ścieżki i wskaźniki postępu w rozdziałach
- **Dostępność**: Spójne wzorce nawigacyjne dla łatwiejszego poruszania się po kursie
- **Profesjonalna prezentacja**: Struktura kursu w stylu uniwersyteckim odpowiednia dla szkoleń akademickich i korporacyjnych
- **Efektywność nauki**: Skrócony czas na znalezienie odpowiednich treści dzięki lepszej organizacji

#### Implementacja techniczna
- **Nagłówki nawigacyjne**: Ustandaryzowana nawigacja rozdziałowa w ponad 40 plikach dokumentacji
- **Stopki nawigacyjne**: Spójne wskazówki dotyczące postępu i wskaźniki ukończenia rozdziałów
- **Linkowanie krzyżowe**: Kompleksowy system linków wewnętrznych łączący powiązane pojęcia
- **Mapowanie rozdziałów**: Szablony i przykłady jasno przypisane do celów nauki

#### Ulepszenie przewodnika nauki
- **📚 Kompleksowe cele nauki**: Przekształcony przewodnik nauki zgodny z systemem 8 rozdziałów
- **🎯 Ocena rozdziałowa**: Każdy rozdział zawiera konkretne cele nauki i ćwiczenia praktyczne
- **📋 Śledzenie postępów**: Tygodniowy harmonogram nauki z mierzalnymi wynikami i listami kontrolnymi ukończenia
- **❓ Pytania kontrolne**: Pytania weryfikujące wiedzę dla każdego rozdziału z profesjonalnymi wynikami
- **🛠️ Ćwiczenia praktyczne**: Działania praktyczne z rzeczywistymi scenariuszami wdrożeniowymi i rozwiązywaniem problemów
- **📊 Postęp umiejętności**: Jasny rozwój od podstawowych pojęć do wzorców korporacyjnych z naciskiem na rozwój kariery
- **🎓 Ramy certyfikacji**: Wyniki rozwoju zawodowego i system uznania społecznościowego
- **⏱️ Zarządzanie harmonogramem**: Ustrukturyzowany 10-tygodniowy plan nauki z walidacją kamieni milowych

### [v3.1.0] - 2025-09-17

#### Ulepszone rozwiązania AI z wieloma agentami
**Ta wersja poprawia rozwiązanie detaliczne z wieloma agentami dzięki lepszemu nazewnictwu agentów i ulepszonej dokumentacji.**

#### Zmieniono
- **Terminologia wieloagentowa**: Zastąpiono "agent Cora" na "agent Klient" w całym rozwiązaniu detalicznym z wieloma agentami dla większej przejrzystości
- **Architektura agentów**: Zaktualizowano całą dokumentację, szablony ARM i przykłady kodu, aby używać spójnego nazewnictwa "agent Klient"
- **Przykłady konfiguracji**: Zmodernizowano wzorce konfiguracji agentów z zaktualizowanym nazewnictwem
- **Spójność dokumentacji**: Upewniono się, że wszystkie odniesienia używają profesjonalnych, opisowych nazw agentów

#### Ulepszono
- **Pakiet szablonów ARM**: Zaktualizowano retail-multiagent-arm-template z odniesieniami do agenta Klient
- **Diagramy architektury**: Odświeżono diagramy Mermaid z zaktualizowanym nazewnictwem agentów
- **Przykłady kodu**: Klasy Pythona i przykłady implementacji teraz używają nazwy CustomerAgent
- **Zmienne środowiskowe**: Zaktualizowano wszystkie skrypty wdrożeniowe, aby używać konwencji CUSTOMER_AGENT_NAME

#### Poprawiono
- **Doświadczenie dewelopera**: Jaśniejsze role i odpowiedzialności agentów w dokumentacji
- **Gotowość produkcyjna**: Lepsze dostosowanie do korporacyjnych konwencji nazewnictwa
- **Materiały edukacyjne**: Bardziej intuicyjne nazewnictwo agentów dla celów edukacyjnych
- **Użyteczność szablonów**: Uproszczone zrozumienie funkcji agentów i wzorców wdrożeniowych

#### Szczegóły techniczne
- Zaktualizowano diagramy architektury Mermaid z odniesieniami do CustomerAgent
- Zastąpiono nazwy klas CoraAgent na CustomerAgent w przykładach Pythona
- Zmodyfikowano konfiguracje JSON szablonów ARM, aby używać typu agenta "customer"
- Zaktualizowano zmienne środowiskowe z CORA_AGENT_* na CUSTOMER_AGENT_* 
- Odświeżono wszystkie komendy wdrożeniowe i konfiguracje kontenerów

### [v3.0.0] - 2025-09-12

#### Główne zmiany - Skupienie na deweloperach AI i integracja Azure AI Foundry
**Ta wersja przekształca repozytorium w kompleksowe źródło wiedzy dla deweloperów AI z integracją Azure AI Foundry.**

#### Dodano
- **🤖 Ścieżka nauki AI-First**: Kompleksowa restrukturyzacja z priorytetem dla deweloperów i inżynierów AI
- **Przewodnik integracji Azure AI Foundry**: Kompleksowa dokumentacja dotycząca łączenia AZD z usługami Azure AI Foundry
- **Wzorce wdrażania modeli AI**: Szczegółowy przewodnik obejmujący wybór modelu, konfigurację i strategie wdrożenia produkcyjnego
- **
- **Prezentacja treści**: Usunięto elementy dekoracyjne na rzecz przejrzystego, profesjonalnego formatowania
- **Struktura linków**: Zaktualizowano wszystkie wewnętrzne linki, aby wspierać nowy system nawigacji

#### Ulepszenia
- **Dostępność**: Usunięto zależności od emoji, aby poprawić kompatybilność z czytnikami ekranu
- **Profesjonalny wygląd**: Czysta, akademicka prezentacja odpowiednia dla nauki w przedsiębiorstwach
- **Doświadczenie edukacyjne**: Strukturalne podejście z jasnymi celami i wynikami dla każdej lekcji
- **Organizacja treści**: Lepszy logiczny przepływ i powiązanie między pokrewnymi tematami

### [v1.0.0] - 2025-09-09

#### Pierwsze wydanie - Kompleksowe repozytorium nauki AZD

#### Dodano
- **Podstawowa struktura dokumentacji**
  - Kompletny przewodnik dla początkujących
  - Szczegółowa dokumentacja wdrożenia i przygotowania
  - Rozbudowane zasoby rozwiązywania problemów i przewodniki debugowania
  - Narzędzia i procedury weryfikacji przed wdrożeniem

- **Moduł dla początkujących**
  - Podstawy AZD: Kluczowe pojęcia i terminologia
  - Przewodnik instalacji: Instrukcje konfiguracji dla różnych platform
  - Przewodnik konfiguracji: Ustawienia środowiska i uwierzytelnianie
  - Pierwszy projekt: Praktyczne ćwiczenia krok po kroku

- **Moduł wdrożenia i przygotowania**
  - Przewodnik wdrożenia: Kompleksowa dokumentacja procesu
  - Przewodnik przygotowania: Infrastruktura jako kod z Bicep
  - Najlepsze praktyki dla wdrożeń produkcyjnych
  - Wzorce architektury wielousługowej

- **Moduł weryfikacji przed wdrożeniem**
  - Planowanie pojemności: Weryfikacja dostępności zasobów Azure
  - Wybór SKU: Szczegółowe wskazówki dotyczące poziomów usług
  - Kontrole przed wdrożeniem: Zautomatyzowane skrypty weryfikacyjne (PowerShell i Bash)
  - Narzędzia do szacowania kosztów i planowania budżetu

- **Moduł rozwiązywania problemów**
  - Typowe problemy: Najczęściej spotykane problemy i ich rozwiązania
  - Przewodnik debugowania: Systematyczne metody rozwiązywania problemów
  - Zaawansowane techniki diagnostyczne i narzędzia
  - Monitorowanie wydajności i optymalizacja

- **Zasoby i odniesienia**
  - Arkusz poleceń: Szybki dostęp do kluczowych poleceń
  - Słowniczek: Kompleksowe definicje terminów i skrótów
  - FAQ: Szczegółowe odpowiedzi na często zadawane pytania
  - Linki do zewnętrznych zasobów i społeczności

- **Przykłady i szablony**
  - Przykład prostej aplikacji internetowej
  - Szablon wdrożenia statycznej strony internetowej
  - Konfiguracja aplikacji kontenerowej
  - Wzorce integracji baz danych
  - Przykłady architektury mikroserwisów
  - Implementacje funkcji bezserwerowych

#### Funkcje
- **Wsparcie dla wielu platform**: Przewodniki instalacji i konfiguracji dla Windows, macOS i Linux
- **Różne poziomy umiejętności**: Treści przeznaczone dla studentów i profesjonalnych programistów
- **Praktyczne podejście**: Przykłady praktyczne i scenariusze z życia wzięte
- **Kompleksowe pokrycie**: Od podstawowych pojęć po zaawansowane wzorce dla przedsiębiorstw
- **Podejście zorientowane na bezpieczeństwo**: Najlepsze praktyki bezpieczeństwa zintegrowane w całej dokumentacji
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

#### Doświadczenie programisty
- **Rozszerzenie VS Code**: Zintegrowane środowisko AZD + AI Foundry
- **Integracja GitHub Copilot**: Generowanie szablonów AZD wspomagane przez AI
- **Interaktywne tutoriale**: Praktyczne ćwiczenia kodowania z automatyczną weryfikacją dla scenariuszy AI
- **Treści wideo**: Dodatkowe tutoriale wideo dla osób uczących się wizualnie, skupione na wdrożeniach AI

### Wersja 4.0.0 (Planowana)
#### Wzorce AI dla przedsiębiorstw
- **Ramowe zarządzanie**: Zarządzanie modelami AI, zgodność i ścieżki audytu
- **AI dla wielu najemców**: Wzorce obsługi wielu klientów z izolowanymi usługami AI
- **Wdrożenie AI na brzegu**: Integracja z Azure IoT Edge i instancjami kontenerowymi
- **AI w chmurze hybrydowej**: Wzorce wdrożeń wielochmurowych i hybrydowych dla obciążeń AI

#### Zaawansowane funkcje
- **Automatyzacja pipeline'ów AI**: Integracja MLOps z pipeline'ami Azure Machine Learning
- **Zaawansowane bezpieczeństwo**: Wzorce zero-trust, prywatne punkty końcowe i zaawansowana ochrona przed zagrożeniami
- **Optymalizacja wydajności**: Zaawansowane strategie dostrajania i skalowania dla aplikacji AI o dużej przepustowości
- **Globalna dystrybucja**: Wzorce dostarczania treści i buforowania na brzegu dla aplikacji AI

### Wersja 3.0.0 (Planowana) - Zastąpiona przez bieżące wydanie
#### Proponowane dodatki - Teraz zaimplementowane w wersji 3.0.0
- ✅ **Treści skoncentrowane na AI**: Kompleksowa integracja Azure AI Foundry (Zakończono)
- ✅ **Interaktywne tutoriale**: Praktyczne laboratorium warsztatowe AI (Zakończono)
- ✅ **Zaawansowany moduł bezpieczeństwa**: Wzorce bezpieczeństwa specyficzne dla AI (Zakończono)
- ✅ **Optymalizacja wydajności**: Strategie dostrajania obciążeń AI (Zakończono)

### Wersja 2.1.0 (Planowana) - Częściowo zaimplementowana w wersji 3.0.0
#### Drobne ulepszenia - Niektóre zakończone w bieżącym wydaniu
- ✅ **Dodatkowe przykłady**: Scenariusze wdrożeń skoncentrowane na AI (Zakończono)
- ✅ **Rozszerzone FAQ**: Pytania i rozwiązywanie problemów specyficzne dla AI (Zakończono)
- **Integracja narzędzi**: Rozszerzone przewodniki integracji IDE i edytorów
- ✅ **Rozszerzenie monitorowania**: Wzorce monitorowania i alertów specyficzne dla AI (Zakończono)

#### Nadal planowane na przyszłe wydanie
- **Dokumentacja przyjazna dla urządzeń mobilnych**: Projekt responsywny dla nauki na urządzeniach mobilnych
- **Dostęp offline**: Pakiety dokumentacji do pobrania
- **Rozszerzona integracja IDE**: Rozszerzenie VS Code dla AZD + AI
- **Dashboard społecznościowy**: Metryki społeczności w czasie rzeczywistym i śledzenie wkładu

## Wkład w changelog

### Zgłaszanie zmian
Podczas wnoszenia wkładu do tego repozytorium, upewnij się, że wpisy w changelogu zawierają:

1. **Numer wersji**: Zgodnie z wersjonowaniem semantycznym (major.minor.patch)
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
- Przebudowa treści lub organizacji

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
- Rozwiązanie zgłoszonych problemów lub usterek
- Ulepszenia dokładności lub funkcjonalności

#### Bezpieczeństwo
- Ulepszenia lub poprawki związane z bezpieczeństwem
- Aktualizacje najlepszych praktyk bezpieczeństwa
- Rozwiązanie luk w zabezpieczeniach

### Wytyczne wersjonowania semantycznego

#### Wersja główna (X.0.0)
- Zmiany powodujące problemy z kompatybilnością wymagające działania użytkownika
- Znacząca przebudowa treści lub organizacji
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
- **Problemy na GitHub**: Zgłaszaj problemy lub sugeruj ulepszenia (mile widziane kwestie związane z AI)
- **Dyskusje na Discordzie**: Dziel się pomysłami i angażuj się w społeczność Azure AI Foundry
- **Pull Requesty**: Wnoszenie bezpośrednich ulepszeń do treści, szczególnie szablonów i przewodników AI
- **Discord Azure AI Foundry**: Udział w kanale #Azure dla dyskusji AZD + AI
- **Fora społecznościowe**: Udział w szerszych dyskusjach programistów Azure

### Kategorie opinii
- **Dokładność treści AI**: Poprawki dotyczące integracji usług AI i informacji o wdrożeniach
- **Doświadczenie edukacyjne**: Sugestie dotyczące ulepszenia przepływu nauki dla programistów AI
- **Brakujące treści AI**: Prośby o dodatkowe szablony, wzorce lub przykłady AI
- **Dostępność**: Ulepszenia dla różnych potrzeb edukacyjnych
- **Integracja narzędzi AI**: Sugestie dotyczące lepszej integracji przepływu pracy programistów AI
- **Wzorce produkcyjne AI**: Prośby o wzorce wdrożeń AI dla przedsiębiorstw

### Zobowiązanie do odpowiedzi
- **Odpowiedź na problemy**: W ciągu 48 godzin od zgłoszenia problemów
- **Prośby o funkcje**: Ocena w ciągu tygodnia
- **Wkład społeczności**: Przegląd w ciągu tygodnia
- **Problemy z bezpieczeństwem**: Priorytet natychmiastowy z przyspieszoną odpowiedzią

## Harmonogram konserwacji

### Regularne aktualizacje
- **Przeglądy miesięczne**: Dokładność treści i weryfikacja linków
- **Aktualizacje kwartalne**: Główne dodatki i ulepszenia treści
- **Przeglądy półroczne**: Kompleksowa przebudowa i ulepszenia
- **Wydania roczne**: Główne aktualizacje wersji z istotnymi ulepszeniami

### Monitorowanie i zapewnienie jakości
- **Testy automatyczne**: Regularna weryfikacja przykładów kodu i linków
- **Integracja opinii społeczności**: Regularne uwzględnianie sugestii użytkowników
- **Aktualizacje technologiczne**: Dopasowanie do najnowszych usług Azure i wydań azd
- **Audyty dostępności**: Regularne przeglądy zgodności z zasadami projektowania inkluzywnego

## Polityka wsparcia wersji

### Wsparcie dla bieżącej wersji
- **Najnowsza wersja główna**: Pełne wsparcie z regularnymi aktualizacjami
- **Poprzednia wersja główna**: Aktualizacje bezpieczeństwa i krytyczne poprawki przez 12 miesięcy
- **Wersje starsze**: Wsparcie społecznościowe, brak oficjalnych aktualizacji

### Wytyczne dotyczące migracji
Gdy wydawane są główne wersje, zapewniamy:
- **Przewodniki migracji**: Instrukcje krok po kroku dotyczące przejścia
- **Uwagi dotyczące kompatybilności**: Szczegóły dotyczące zmian powodujących problemy z kompatybilnością
- **Wsparcie narzędziowe**: Skrypty lub narzędzia wspomagające migrację
- **Wsparcie społecznościowe**: Dedykowane fora dla pytań dotyczących migracji

---

**Nawigacja**
- **Poprzednia lekcja**: [Przewodnik nauki](resources/study-guide.md)
- **Następna lekcja**: Powrót do [Głównego README](README.md)

**Bądź na bieżąco**: Obserwuj to repozytorium, aby otrzymywać powiadomienia o nowych wydaniach i ważnych aktualizacjach materiałów edukacyjnych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->