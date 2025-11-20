<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-20T00:18:58+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "pl"
}
-->
# Przewodnik nauki - Kompleksowe cele edukacyjne

**Nawigacja po ścieżce nauki**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Rozpocznij naukę**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Śledzenie postępów**: [Ukończenie kursu](../README.md#-course-completion--certification)

## Wprowadzenie

Ten kompleksowy przewodnik nauki dostarcza uporządkowane cele edukacyjne, kluczowe koncepcje, ćwiczenia praktyczne oraz materiały oceniające, które pomogą Ci opanować Azure Developer CLI (azd). Użyj tego przewodnika, aby śledzić swoje postępy i upewnić się, że pokryłeś wszystkie istotne tematy.

## Cele nauki

Po ukończeniu tego przewodnika nauki będziesz:
- Opanować wszystkie podstawowe i zaawansowane koncepcje Azure Developer CLI
- Rozwinąć praktyczne umiejętności w zakresie wdrażania i zarządzania aplikacjami Azure
- Zyskać pewność w rozwiązywaniu problemów i optymalizacji wdrożeń
- Zrozumieć praktyki wdrożeń gotowych do produkcji oraz kwestie bezpieczeństwa

## Rezultaty nauki

Po ukończeniu wszystkich sekcji tego przewodnika nauki będziesz w stanie:
- Projektować, wdrażać i zarządzać kompletnymi architekturami aplikacji za pomocą azd
- Wdrażać kompleksowe strategie monitorowania, bezpieczeństwa i optymalizacji kosztów
- Samodzielnie rozwiązywać złożone problemy związane z wdrożeniami
- Tworzyć własne szablony i wnosić wkład w społeczność azd

## Struktura nauki w 8 rozdziałach

### Rozdział 1: Podstawy i szybki start (Tydzień 1)
**Czas trwania**: 30-45 minut | **Złożoność**: ⭐

#### Cele nauki
- Zrozumieć podstawowe koncepcje i terminologię Azure Developer CLI
- Pomyślnie zainstalować i skonfigurować AZD na swojej platformie deweloperskiej
- Wdrożyć swoją pierwszą aplikację za pomocą istniejącego szablonu
- Skutecznie poruszać się po interfejsie wiersza poleceń AZD

#### Kluczowe koncepcje do opanowania
- Struktura projektu AZD i jego komponenty (azure.yaml, infra/, src/)
- Przepływy pracy oparte na szablonach wdrożeń
- Podstawy konfiguracji środowiska
- Zarządzanie grupami zasobów i subskrypcjami

#### Ćwiczenia praktyczne
1. **Weryfikacja instalacji**: Zainstaluj AZD i zweryfikuj za pomocą `azd version`
2. **Pierwsze wdrożenie**: Pomyślnie wdroż szablon todo-nodejs-mongo
3. **Konfiguracja środowiska**: Skonfiguruj swoje pierwsze zmienne środowiskowe
4. **Eksploracja zasobów**: Przeglądaj wdrożone zasoby w Azure Portal

#### Pytania oceniające
- Jakie są podstawowe komponenty projektu AZD?
- Jak zainicjować nowy projekt z szablonu?
- Jaka jest różnica między `azd up` a `azd deploy`?
- Jak zarządzać wieloma środowiskami za pomocą AZD?

---

### Rozdział 2: Rozwój oparty na AI (Tydzień 2)
**Czas trwania**: 1-2 godziny | **Złożoność**: ⭐⭐

#### Cele nauki
- Zintegrować usługi Microsoft Foundry z przepływami pracy AZD
- Wdrażać i konfigurować aplikacje oparte na AI
- Zrozumieć wzorce implementacji RAG (Retrieval-Augmented Generation)
- Zarządzać wdrożeniami modeli AI i ich skalowaniem

#### Kluczowe koncepcje do opanowania
- Integracja usługi Azure OpenAI i zarządzanie API
- Konfiguracja wyszukiwania AI i indeksowania wektorowego
- Strategie wdrożeń modeli i planowanie pojemności
- Monitorowanie aplikacji AI i optymalizacja wydajności

#### Ćwiczenia praktyczne
1. **Wdrożenie czatu AI**: Wdroż szablon azure-search-openai-demo
2. **Implementacja RAG**: Skonfiguruj indeksowanie dokumentów i ich wyszukiwanie
3. **Konfiguracja modeli**: Skonfiguruj wiele modeli AI do różnych celów
4. **Monitorowanie AI**: Wdroż Application Insights dla obciążeń AI

#### Pytania oceniające
- Jak skonfigurować usługi Azure OpenAI w szablonie AZD?
- Jakie są kluczowe komponenty architektury RAG?
- Jak zarządzać pojemnością i skalowaniem modeli AI?
- Jakie metryki monitorowania są ważne dla aplikacji AI?

---

### Rozdział 3: Konfiguracja i uwierzytelnianie (Tydzień 3)
**Czas trwania**: 45-60 minut | **Złożoność**: ⭐⭐

#### Cele nauki
- Opanować strategie konfiguracji i zarządzania środowiskami
- Wdrażać bezpieczne wzorce uwierzytelniania i zarządzane tożsamości
- Organizować zasoby zgodnie z odpowiednimi konwencjami nazewnictwa
- Konfigurować wdrożenia wielośrodowiskowe (dev, staging, prod)

#### Kluczowe koncepcje do opanowania
- Hierarchia środowisk i priorytety konfiguracji
- Uwierzytelnianie za pomocą zarządzanej tożsamości i zasad serwisowych
- Integracja Key Vault do zarządzania tajemnicami
- Zarządzanie parametrami specyficznymi dla środowiska

#### Ćwiczenia praktyczne
1. **Konfiguracja wielośrodowiskowa**: Skonfiguruj środowiska dev, staging i prod
2. **Konfiguracja bezpieczeństwa**: Wdroż uwierzytelnianie za pomocą zarządzanej tożsamości
3. **Zarządzanie tajemnicami**: Zintegruj Azure Key Vault dla danych wrażliwych
4. **Zarządzanie parametrami**: Utwórz konfiguracje specyficzne dla środowiska

#### Pytania oceniające
- Jak skonfigurować różne środowiska za pomocą AZD?
- Jakie są korzyści z używania zarządzanej tożsamości zamiast zasad serwisowych?
- Jak bezpiecznie zarządzać tajemnicami aplikacji?
- Jaka jest hierarchia konfiguracji w AZD?

---

### Rozdział 4: Infrastruktura jako kod i wdrożenie (Tydzień 4-5)
**Czas trwania**: 1-1,5 godziny | **Złożoność**: ⭐⭐⭐

#### Cele nauki
- Tworzyć i dostosowywać szablony infrastruktury Bicep
- Wdrażać zaawansowane wzorce i przepływy pracy wdrożeń
- Zrozumieć strategie udostępniania zasobów
- Projektować skalowalne architektury wielousługowe

- Wdrażać aplikacje konteneryzowane za pomocą Azure Container Apps i AZD

#### Kluczowe koncepcje do opanowania
- Struktura szablonów Bicep i najlepsze praktyki
- Zależności zasobów i kolejność wdrożeń
- Pliki parametrów i modułowość szablonów
- Niestandardowe haki i automatyzacja wdrożeń
- Wzorce wdrożeń aplikacji kontenerowych (szybki start, produkcja, mikroserwisy)

#### Ćwiczenia praktyczne
1. **Tworzenie niestandardowego szablonu**: Zbuduj szablon aplikacji wielousługowej
2. **Opanowanie Bicep**: Utwórz modułowe, wielokrotnego użytku komponenty infrastruktury
3. **Automatyzacja wdrożeń**: Wdroż haki przed/po wdrożeniu
4. **Projektowanie architektury**: Wdroż złożoną architekturę mikroserwisów
5. **Wdrożenie aplikacji kontenerowej**: Wdroż [Simple Flask API](../../../examples/container-app/simple-flask-api) oraz [Microservices Architecture](../../../examples/container-app/microservices) za pomocą AZD

#### Pytania oceniające
- Jak tworzyć niestandardowe szablony Bicep dla AZD?
- Jakie są najlepsze praktyki organizacji kodu infrastruktury?
- Jak radzić sobie z zależnościami zasobów w szablonach?
- Jakie wzorce wdrożeń wspierają aktualizacje bez przestojów?

---

### Rozdział 5: Rozwiązania AI z wieloma agentami (Tydzień 6-7)
**Czas trwania**: 2-3 godziny | **Złożoność**: ⭐⭐⭐⭐

#### Cele nauki
- Projektować i wdrażać architektury AI z wieloma agentami
- Koordynować komunikację i współpracę agentów
- Wdrażać rozwiązania AI gotowe do produkcji z monitorowaniem
- Zrozumieć specjalizację agentów i wzorce przepływów pracy
- Zintegrować konteneryzowane mikroserwisy jako część rozwiązań z wieloma agentami

#### Kluczowe koncepcje do opanowania
- Wzorce architektury z wieloma agentami i zasady projektowania
- Protokoły komunikacji agentów i przepływ danych
- Strategie równoważenia obciążenia i skalowania dla agentów AI
- Monitorowanie produkcji dla systemów z wieloma agentami
- Komunikacja między usługami w środowiskach konteneryzowanych

#### Ćwiczenia praktyczne
1. **Wdrożenie rozwiązania dla handlu detalicznego**: Wdroż kompletny scenariusz handlu detalicznego z wieloma agentami
2. **Dostosowanie agentów**: Zmodyfikuj zachowania agentów Klienta i Magazynu
3. **Skalowanie architektury**: Wdroż równoważenie obciążenia i automatyczne skalowanie
4. **Monitorowanie produkcji**: Skonfiguruj kompleksowe monitorowanie i alerty
5. **Integracja mikroserwisów**: Rozszerz przykład [Microservices Architecture](../../../examples/container-app/microservices) o przepływy pracy oparte na agentach

#### Pytania oceniające
- Jak projektować efektywne wzorce komunikacji między agentami?
- Jakie są kluczowe aspekty skalowania obciążeń agentów AI?
- Jak monitorować i debugować systemy AI z wieloma agentami?
- Jakie wzorce produkcyjne zapewniają niezawodność agentów AI?

---

### Rozdział 6: Walidacja przed wdrożeniem i planowanie (Tydzień 8)
**Czas trwania**: 1 godzina | **Złożoność**: ⭐⭐

#### Cele nauki
- Przeprowadzać kompleksowe planowanie pojemności i walidację zasobów
- Wybierać optymalne SKU Azure dla efektywności kosztowej
- Wdrażać zautomatyzowane kontrole przed wdrożeniem i walidację
- Planować wdrożenia z uwzględnieniem strategii optymalizacji kosztów

#### Kluczowe koncepcje do opanowania
- Limity kwot zasobów Azure i ograniczenia pojemności
- Kryteria wyboru SKU i optymalizacja kosztów
- Zautomatyzowane skrypty walidacji i testowania
- Planowanie wdrożeń i ocena ryzyka

#### Ćwiczenia praktyczne
1. **Analiza pojemności**: Przeanalizuj wymagania zasobów dla swoich aplikacji
2. **Optymalizacja SKU**: Porównaj i wybierz efektywne kosztowo poziomy usług
3. **Automatyzacja walidacji**: Wdroż skrypty kontroli przed wdrożeniem
4. **Planowanie kosztów**: Utwórz szacunkowe koszty wdrożenia i budżety

#### Pytania oceniające
- Jak walidować pojemność Azure przed wdrożeniem?
- Jakie czynniki wpływają na decyzje dotyczące wyboru SKU?
- Jak zautomatyzować walidację przed wdrożeniem?
- Jakie strategie pomagają optymalizować koszty wdrożenia?

---

### Rozdział 7: Rozwiązywanie problemów i debugowanie (Tydzień 9)
**Czas trwania**: 1-1,5 godziny | **Złożoność**: ⭐⭐

#### Cele nauki
- Rozwijać systematyczne podejście do debugowania wdrożeń AZD
- Rozwiązywać typowe problemy związane z wdrożeniami i konfiguracją
- Debugować specyficzne dla AI problemy i kwestie wydajności
- Wdrażać monitorowanie i alerty dla proaktywnego wykrywania problemów

#### Kluczowe koncepcje do opanowania
- Techniki diagnostyczne i strategie logowania
- Typowe wzorce awarii i ich rozwiązania
- Monitorowanie wydajności i optymalizacja
- Procedury reagowania na incydenty i odzyskiwania

#### Ćwiczenia praktyczne
1. **Umiejętności diagnostyczne**: Ćwicz na celowo uszkodzonych wdrożeniach
2. **Analiza logów**: Skutecznie używaj Azure Monitor i Application Insights
3. **Optymalizacja wydajności**: Popraw wydajność wolno działających aplikacji
4. **Procedury odzyskiwania**: Wdroż kopie zapasowe i odzyskiwanie po awarii

#### Pytania oceniające
- Jakie są najczęstsze awarie wdrożeń AZD?
- Jak debugować problemy z uwierzytelnianiem i uprawnieniami?
- Jakie strategie monitorowania pomagają zapobiegać problemom w produkcji?
- Jak optymalizować wydajność aplikacji w Azure?

---

### Rozdział 8: Wzorce produkcyjne i korporacyjne (Tydzień 10-11)
**Czas trwania**: 2-3 godziny | **Złożoność**: ⭐⭐⭐⭐

#### Cele nauki
- Wdrażać strategie wdrożeń na poziomie korporacyjnym
- Projektować wzorce bezpieczeństwa i ramy zgodności
- Ustanawiać monitorowanie, zarządzanie i kontrolę kosztów
- Tworzyć skalowalne potoki CI/CD z integracją AZD
- Stosować najlepsze praktyki dla wdrożeń aplikacji kontenerowych w produkcji (bezpieczeństwo, monitorowanie, koszty, CI/CD)

#### Kluczowe koncepcje do opanowania
- Wymagania dotyczące bezpieczeństwa i zgodności na poziomie korporacyjnym
- Ramy zarządzania i wdrażanie polityk
- Zaawansowane monitorowanie i zarządzanie kosztami
- Integracja CI/CD i zautomatyzowane potoki wdrożeniowe
- Strategie wdrożeń blue-green i canary dla obciążeń kontenerowych

#### Ćwiczenia praktyczne
1. **Bezpieczeństwo korporacyjne**: Wdroż kompleksowe wzorce bezpieczeństwa
2. **Ramy zarządzania**: Skonfiguruj Azure Policy i zarządzanie zasobami
3. **Zaawansowane monitorowanie**: Utwórz pulpity i zautomatyzowane alerty
4. **Integracja CI/CD**: Zbuduj zautomatyzowane potoki wdrożeniowe
5. **Aplikacje kontenerowe w produkcji**: Zastosuj bezpieczeństwo, monitorowanie i optymalizację kosztów do przykładu [Microservices Architecture](../../../examples/container-app/microservices)

#### Pytania oceniające
- Jak wdrażać bezpieczeństwo korporacyjne w wdrożeniach AZD?
- Jakie wzorce zarządzania zapewniają zgodność i kontrolę kosztów?
- Jak projektować skalowalne monitorowanie dla systemów produkcyjnych?
- Jakie wzorce CI/CD najlepiej współpracują z przepływami pracy AZD?

#### Cele nauki
- Zrozumieć podstawy i kluczowe koncepcje Azure Developer CLI
- Pomyślnie zainstalować i skonfigurować azd w swoim środowisku deweloperskim
- Ukończyć pierwsze wdrożenie za pomocą istniejącego szablonu
- Zrozumieć strukturę projektu azd i kluczowe komponenty

#### Kluczowe koncepcje do opanowania
- Szablony, środowiska i usługi
- Struktura konfiguracji azure.yaml
- Podstawowe polecenia azd (init, up, down, deploy)
- Zasady Infrastructure as Code
- Uwierzytelnianie i autoryzacja w Azure

#### Ćwiczenia praktyczne

**Ćwiczenie 1.1: Instalacja i konfiguracja**
```bash
# Wykonaj te zadania:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Ćwiczenie 1.2: Pierwsze
5. Jakie są kwestie do rozważenia przy wdrożeniach w wielu regionach?

### Moduł 4: Walidacja przed wdrożeniem (Tydzień 5)

#### Cele nauki
- Wdrażanie kompleksowych kontroli przed wdrożeniem
- Opanowanie planowania pojemności i walidacji zasobów
- Zrozumienie wyboru SKU i optymalizacji kosztów
- Tworzenie zautomatyzowanych potoków walidacyjnych

#### Kluczowe pojęcia do opanowania
- Limity i kwoty zasobów Azure
- Kryteria wyboru SKU i ich wpływ na koszty
- Zautomatyzowane skrypty i narzędzia walidacyjne
- Metodologie planowania pojemności
- Testowanie wydajności i optymalizacja

#### Ćwiczenia praktyczne

**Ćwiczenie 4.1: Planowanie pojemności**  
```bash
# Wdrożenie walidacji pojemności:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Ćwiczenie 4.2: Walidacja przed wdrożeniem**  
```powershell
# Zbuduj kompleksowy system walidacji:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Ćwiczenie 4.3: Optymalizacja SKU**  
```bash
# Optymalizuj konfiguracje usług:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Pytania do samooceny
1. Jakie czynniki powinny wpływać na decyzje dotyczące wyboru SKU?
2. Jak weryfikujesz dostępność zasobów Azure przed wdrożeniem?
3. Jakie są kluczowe elementy systemu kontroli przed wdrożeniem?
4. Jak oszacować i kontrolować koszty wdrożenia?
5. Jakie monitorowanie jest kluczowe w planowaniu pojemności?

### Moduł 5: Rozwiązywanie problemów i debugowanie (Tydzień 6)

#### Cele nauki
- Opanowanie systematycznych metod rozwiązywania problemów
- Rozwijanie umiejętności debugowania złożonych problemów wdrożeniowych
- Wdrażanie kompleksowego monitorowania i alertowania
- Tworzenie procedur reagowania na incydenty i odzyskiwania

#### Kluczowe pojęcia do opanowania
- Typowe wzorce awarii wdrożeń
- Analiza logów i techniki korelacji
- Monitorowanie wydajności i optymalizacja
- Wykrywanie incydentów bezpieczeństwa i reagowanie
- Odzyskiwanie po awarii i ciągłość działania

#### Ćwiczenia praktyczne

**Ćwiczenie 5.1: Scenariusze rozwiązywania problemów**  
```bash
# Ćwicz rozwiązywanie typowych problemów:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Ćwiczenie 5.2: Wdrażanie monitorowania**  
```bash
# Skonfiguruj kompleksowe monitorowanie:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Ćwiczenie 5.3: Reagowanie na incydenty**  
```bash
# Opracuj procedury reagowania na incydenty:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Pytania do samooceny
1. Jaka jest systematyczna metoda rozwiązywania problemów z wdrożeniami azd?
2. Jak korelować logi z różnych usług i zasobów?
3. Jakie metryki monitorowania są najważniejsze dla wczesnego wykrywania problemów?
4. Jak wdrożyć skuteczne procedury odzyskiwania po awarii?
5. Jakie są kluczowe elementy planu reagowania na incydenty?

### Moduł 6: Zaawansowane tematy i najlepsze praktyki (Tydzień 7-8)

#### Cele nauki
- Wdrażanie wzorców wdrożeń na poziomie przedsiębiorstwa
- Opanowanie integracji i automatyzacji CI/CD
- Tworzenie niestandardowych szablonów i wkład w społeczność
- Zrozumienie zaawansowanych wymagań dotyczących bezpieczeństwa i zgodności

#### Kluczowe pojęcia do opanowania
- Wzorce integracji potoków CI/CD
- Tworzenie i dystrybucja niestandardowych szablonów
- Zarządzanie i zgodność na poziomie przedsiębiorstwa
- Zaawansowane konfiguracje sieciowe i bezpieczeństwa
- Optymalizacja wydajności i zarządzanie kosztami

#### Ćwiczenia praktyczne

**Ćwiczenie 6.1: Integracja CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Ćwiczenie 6.2: Tworzenie niestandardowych szablonów**  
```bash
# Twórz i publikuj niestandardowe szablony:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Ćwiczenie 6.3: Wdrożenie na poziomie przedsiębiorstwa**  
```bash
# Wdrożenie funkcji klasy korporacyjnej:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Pytania do samooceny
1. Jak zintegrować azd z istniejącymi potokami CI/CD?
2. Jakie są kluczowe kwestie przy tworzeniu niestandardowych szablonów?
3. Jak wdrożyć zarządzanie i zgodność w wdrożeniach azd?
4. Jakie są najlepsze praktyki dla wdrożeń na skalę przedsiębiorstwa?
5. Jak skutecznie przyczynić się do rozwoju społeczności azd?

## Projekty praktyczne

### Projekt 1: Strona portfolio osobistego  
**Złożoność**: Początkujący  
**Czas trwania**: 1-2 tygodnie  

Zbuduj i wdroż stronę portfolio osobistego, korzystając z:  
- Hostingu statycznych stron na Azure Storage  
- Konfiguracji niestandardowej domeny  
- Integracji CDN dla globalnej wydajności  
- Zautomatyzowanego potoku wdrożeniowego  

**Rezultaty**:  
- Działająca strona wdrożona na Azure  
- Niestandardowy szablon azd dla wdrożeń portfolio  
- Dokumentacja procesu wdrożenia  
- Rekomendacje dotyczące analizy kosztów i optymalizacji  

### Projekt 2: Aplikacja do zarządzania zadaniami  
**Złożoność**: Średniozaawansowany  
**Czas trwania**: 2-3 tygodnie  

Stwórz pełnoprawną aplikację do zarządzania zadaniami z:  
- Frontendem React wdrożonym na App Service  
- Backendem API Node.js z uwierzytelnianiem  
- Bazą danych PostgreSQL z migracjami  
- Monitorowaniem za pomocą Application Insights  

**Rezultaty**:  
- Kompletny system z uwierzytelnianiem użytkowników  
- Schemat bazy danych i skrypty migracyjne  
- Pulpity monitorowania i reguły alertów  
- Konfiguracja wdrożenia dla wielu środowisk  

### Projekt 3: Platforma e-commerce oparta na mikroserwisach  
**Złożoność**: Zaawansowany  
**Czas trwania**: 4-6 tygodni  

Zaprojektuj i wdroż platformę e-commerce opartą na mikroserwisach:  
- Wiele usług API (katalog, zamówienia, płatności, użytkownicy)  
- Integracja kolejki komunikatów z Service Bus  
- Redis jako pamięć podręczna dla optymalizacji wydajności  
- Kompleksowe logowanie i monitorowanie  

**Przykład referencyjny**: Zobacz [Architektura mikroserwisów](../../../examples/container-app/microservices) dla gotowego szablonu i przewodnika wdrożeniowego  

**Rezultaty**:  
- Kompleksowa architektura mikroserwisów  
- Wzorce komunikacji między usługami  
- Testowanie wydajności i optymalizacja  
- Gotowe do produkcji wdrożenie zabezpieczeń  

## Ocena i certyfikacja

### Sprawdzanie wiedzy

Ukończ te oceny po każdym module:

**Ocena Modułu 1**: Podstawowe pojęcia i instalacja  
- Pytania wielokrotnego wyboru dotyczące podstawowych pojęć  
- Praktyczne zadania instalacyjne i konfiguracyjne  
- Proste ćwiczenie wdrożeniowe  

**Ocena Modułu 2**: Konfiguracja i środowiska  
- Scenariusze zarządzania środowiskami  
- Ćwiczenia rozwiązywania problemów z konfiguracją  
- Wdrażanie konfiguracji bezpieczeństwa  

**Ocena Modułu 3**: Wdrożenie i udostępnianie  
- Wyzwania projektowe infrastruktury  
- Scenariusze wdrożeń wielousługowych  
- Ćwiczenia optymalizacji wydajności  

**Ocena Modułu 4**: Walidacja przed wdrożeniem  
- Studium przypadku planowania pojemności  
- Scenariusze optymalizacji kosztów  
- Wdrażanie potoków walidacyjnych  

**Ocena Modułu 5**: Rozwiązywanie problemów i debugowanie  
- Ćwiczenia diagnozowania problemów  
- Zadania wdrażania monitorowania  
- Symulacje reagowania na incydenty  

**Ocena Modułu 6**: Zaawansowane tematy  
- Projektowanie potoków CI/CD  
- Tworzenie niestandardowych szablonów  
- Scenariusze architektury na poziomie przedsiębiorstwa  

### Projekt końcowy

Zaprojektuj i wdroż kompletne rozwiązanie, które pokaże opanowanie wszystkich pojęć:

**Wymagania**:  
- Architektura aplikacji wielowarstwowej  
- Wiele środowisk wdrożeniowych  
- Kompleksowe monitorowanie i alertowanie  
- Wdrożenie zabezpieczeń i zgodności  
- Optymalizacja kosztów i wydajności  
- Kompleksowa dokumentacja i instrukcje  

**Kryteria oceny**:  
- Jakość techniczna wdrożenia  
- Kompleksowość dokumentacji  
- Zgodność z najlepszymi praktykami bezpieczeństwa  
- Optymalizacja wydajności i kosztów  
- Skuteczność monitorowania i rozwiązywania problemów  

## Zasoby do nauki i odniesienia

### Oficjalna dokumentacja
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centrum Architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Zasoby społecznościowe
- [Galeria szablonów AZD](https://azure.github.io/awesome-azd/)  
- [Organizacja GitHub Azure-Samples](https://github.com/Azure-Samples)  
- [Repozytorium GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Środowiska praktyczne
- [Darmowe konto Azure](https://azure.microsoft.com/free/)  
- [Darmowy poziom Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Dodatkowe narzędzia
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Pakiet rozszerzeń Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Rekomendacje harmonogramu nauki

### Nauka w pełnym wymiarze godzin (8 tygodni)
- **Tygodnie 1-2**: Moduły 1-2 (Wprowadzenie, Konfiguracja)  
- **Tygodnie 3-4**: Moduły 3-4 (Wdrożenie, Walidacja przed wdrożeniem)  
- **Tygodnie 5-6**: Moduły 5-6 (Rozwiązywanie problemów, Zaawansowane tematy)  
- **Tygodnie 7-8**: Projekty praktyczne i ocena końcowa  

### Nauka w niepełnym wymiarze godzin (16 tygodni)
- **Tygodnie 1-4**: Moduł 1 (Wprowadzenie)  
- **Tygodnie 5-7**: Moduł 2 (Konfiguracja i środowiska)  
- **Tygodnie 8-10**: Moduł 3 (Wdrożenie i udostępnianie)  
- **Tygodnie 11-12**: Moduł 4 (Walidacja przed wdrożeniem)  
- **Tygodnie 13-14**: Moduł 5 (Rozwiązywanie problemów i debugowanie)  
- **Tygodnie 15-16**: Moduł 6 (Zaawansowane tematy i ocena)  

---

## Śledzenie postępów i ramy oceny

### Lista kontrolna ukończenia rozdziałów

Śledź swoje postępy w każdym rozdziale za pomocą tych mierzalnych wyników:

#### 📚 Rozdział 1: Podstawy i szybki start  
- [ ] **Instalacja zakończona**: AZD zainstalowany i zweryfikowany na Twojej platformie  
- [ ] **Pierwsze wdrożenie**: Pomyślnie wdrożono szablon todo-nodejs-mongo  
- [ ] **Konfiguracja środowiska**: Skonfigurowano pierwsze zmienne środowiskowe  
- [ ] **Nawigacja po zasobach**: Eksploracja wdrożonych zasobów w Azure Portal  
- [ ] **Opanowanie poleceń**: Swobodne korzystanie z podstawowych poleceń AZD  

#### 🤖 Rozdział 2: Rozwój AI-First  
- [ ] **Wdrożenie szablonu AI**: Pomyślnie wdrożono azure-search-openai-demo  
- [ ] **Implementacja RAG**: Skonfigurowano indeksowanie i wyszukiwanie dokumentów  
- [ ] **Konfiguracja modelu**: Ustawiono wiele modeli AI o różnych celach  
- [ ] **Monitorowanie AI**: Wdrożono Application Insights dla obciążeń AI  
- [ ] **Optymalizacja wydajności**: Dostosowano wydajność aplikacji AI  

#### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie  
- [ ] **Konfiguracja wielu środowisk**: Skonfigurowano środowiska dev, staging i prod  
- [ ] **Wdrożenie zabezpieczeń**: Skonfigurowano uwierzytelnianie za pomocą tożsamości zarządzanej  
- [ ] **Zarządzanie sekretami**: Zintegrowano Azure Key Vault dla danych wrażliwych  
- [ ] **Zarządzanie parametrami**: Utworzono konfiguracje specyficzne dla środowisk  
- [ ] **Opanowanie uwierzytelniania**: Wdrożono bezpieczne wzorce dostępu  

#### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenie  
- [ ] **Tworzenie niestandardowych szablonów**: Zbudowano szablon aplikacji wielousługowej  
- [ ] **Opanowanie Bicep**: Stworzono modułowe, wielokrotnego użytku komponenty infrastruktury  
- [ ] **Automatyzacja wdrożeń**: Wdrożono haki przed/po wdrożeniu  
- [ ] **Projektowanie architektury**: Wdrożono złożoną architekturę mikroserwisów  
- [ ] **Optymalizacja szablonów**: Zoptymalizowano szablony pod kątem wydajności i kosztów  

#### 🎯 Rozdział 5: Rozwiązania AI z wieloma agentami  
- [ ] **Wdrożenie rozwiązania detalicznego**: Wdrożono kompletny scenariusz detaliczny z wieloma agentami  
- [ ] **Dostosowanie agentów**: Zmodyfikowano zachowania agentów Klienta i Magazynu  
- [ ] **Skalowanie architektury**: Wdrożono równoważenie obciążenia i autoskalowanie  
- [ ] **Monitorowanie produkcji**: Skonfigurowano kompleksowe monitorowanie i alertowanie  
- [ ] **Optymalizacja wydajności**: Zoptymalizowano wydajność systemu wieloagentowego  

#### 🔍 Rozdział 6: Walidacja przed wdrożeniem i planowanie  
- [ ] **Analiza pojemności**: Przeanalizowano wymagania dotyczące zasobów dla aplikacji  
- [ ] **Optymalizacja SKU**: Wybrano opłacalne poziomy usług  
- [ ] **Automatyzacja walidacji**: Wdrożono skrypty kontroli przed wdrożeniem  
- [ ] **Planowanie kosztów**: Stworzono szacunki kosztów wdrożenia i budżety  
- [ ] **Ocena ryzyka**: Zidentyfikowano i zminimalizowano ryzyka wdrożeniowe  

#### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie  
- [ ] **Umiejętności diagnostyczne**: Pomyślnie zdebugowano celowo uszkodzone wdrożenia  
- [ ] **Analiza logów**: Skutecznie wykorzystano Azure Monitor i Application Insights  
- [ ] **Optymalizacja wydajności**: Zoptymalizowano aplikacje o niskiej wydajności  
- [ ] **Procedury odzyskiwania**: Wdrożono kopie zapasowe i odzyskiwanie po awarii  
- [ ] **Konfiguracja monitorowania**: Stworzono proaktywne monitorowanie i alertowanie  

#### 🏢 Rozdział 8: Produkcja i wzorce przedsiębiorstwa  
- [ ] **Zabezpieczenia przedsiębiorstwa**: Wdrożono kompleksowe wzorce bezpieczeństwa  
- [ ] **Ramowe zarządzanie**: Skonfigurowano Azure
5. **Wkład społeczności**: Udostępniaj szablony lub ulepszenia

#### Wyniki rozwoju zawodowego
- **Projekty portfolio**: 8 wdrożeń gotowych do produkcji
- **Umiejętności techniczne**: Ekspertyza w zakresie standardów branżowych AZD i wdrożeń AI
- **Zdolności rozwiązywania problemów**: Samodzielne rozwiązywanie problemów i optymalizacja
- **Uznanie w społeczności**: Aktywny udział w społeczności deweloperów Azure
- **Rozwój kariery**: Umiejętności bezpośrednio związane z rolami w chmurze i AI

#### Metryki sukcesu
- **Wskaźnik sukcesu wdrożeń**: >95% udanych wdrożeń
- **Czas rozwiązywania problemów**: <30 minut na typowe problemy
- **Optymalizacja wydajności**: Udokumentowane ulepszenia w kosztach i wydajności
- **Zgodność z bezpieczeństwem**: Wszystkie wdrożenia spełniają standardy bezpieczeństwa przedsiębiorstwa
- **Transfer wiedzy**: Zdolność do mentorowania innych deweloperów

### Ciągłe uczenie się i zaangażowanie w społeczność

#### Bądź na bieżąco
- **Aktualizacje Azure**: Śledź notatki o wydaniach Azure Developer CLI
- **Wydarzenia społecznościowe**: Uczestnicz w wydarzeniach dla deweloperów Azure i AI
- **Dokumentacja**: Współtwórz dokumentację społecznościową i przykłady
- **Pętla zwrotna**: Przekazuj opinie na temat treści kursu i usług Azure

#### Rozwój kariery
- **Sieć zawodowa**: Nawiązuj kontakty z ekspertami Azure i AI
- **Możliwości wystąpień**: Prezentuj swoje doświadczenia na konferencjach lub spotkaniach
- **Wkład w open source**: Współtwórz szablony i narzędzia AZD
- **Mentorstwo**: Wspieraj innych deweloperów w ich nauce AZD

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Rozpocznij naukę**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Śledzenie postępów**: Śledź swoje osiągnięcia w ramach kompleksowego systemu nauki składającego się z 8 rozdziałów
- **🤝 Społeczność**: [Azure Discord](https://discord.gg/microsoft-azure) dla wsparcia i dyskusji

**Śledzenie postępów w nauce**: Korzystaj z tej strukturalnej instrukcji, aby opanować Azure Developer CLI poprzez progresywną, praktyczną naukę z mierzalnymi wynikami i korzyściami dla rozwoju zawodowego.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->