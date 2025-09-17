<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-17T16:48:31+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "pl"
}
-->
# Przewodnik nauki - Kompleksowe cele edukacyjne

**Nawigacja po ścieżce nauki**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Rozpocznij naukę**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Śledzenie postępów**: [Zakończenie kursu](../README.md#-course-completion--certification)

## Wprowadzenie

Ten kompleksowy przewodnik nauki oferuje uporządkowane cele edukacyjne, kluczowe pojęcia, ćwiczenia praktyczne oraz materiały oceniające, które pomogą Ci opanować Azure Developer CLI (azd). Użyj tego przewodnika, aby śledzić swoje postępy i upewnić się, że pokryłeś wszystkie istotne tematy.

## Cele nauki

Po ukończeniu tego przewodnika nauki będziesz:
- Opanować wszystkie podstawowe i zaawansowane koncepcje Azure Developer CLI
- Rozwinąć praktyczne umiejętności w zakresie wdrażania i zarządzania aplikacjami Azure
- Zyskać pewność w rozwiązywaniu problemów i optymalizacji wdrożeń
- Zrozumieć praktyki wdrożeń gotowych do produkcji oraz kwestie związane z bezpieczeństwem

## Rezultaty nauki

Po ukończeniu wszystkich sekcji tego przewodnika nauki będziesz w stanie:
- Projektować, wdrażać i zarządzać kompletnymi architekturami aplikacji za pomocą azd
- Wdrażać kompleksowe strategie monitorowania, bezpieczeństwa i optymalizacji kosztów
- Samodzielnie rozwiązywać złożone problemy związane z wdrożeniami
- Tworzyć własne szablony i wnosić wkład w społeczność azd

## Struktura nauki w 8 rozdziałach

### Rozdział 1: Podstawy i szybki start (Tydzień 1)
**Czas trwania**: 30-45 minut | **Poziom trudności**: ⭐

#### Cele nauki
- Zrozumieć podstawowe pojęcia i terminologię Azure Developer CLI
- Pomyślnie zainstalować i skonfigurować AZD na swojej platformie deweloperskiej
- Wdrożyć swoją pierwszą aplikację za pomocą istniejącego szablonu
- Skutecznie poruszać się po interfejsie wiersza poleceń AZD

#### Kluczowe pojęcia do opanowania
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
- Jak zainicjować nowy projekt na podstawie szablonu?
- Jaka jest różnica między `azd up` a `azd deploy`?
- Jak zarządzać wieloma środowiskami za pomocą AZD?

---

### Rozdział 2: Rozwój oparty na AI (Tydzień 2)
**Czas trwania**: 1-2 godziny | **Poziom trudności**: ⭐⭐

#### Cele nauki
- Zintegrować usługi Azure AI Foundry z przepływami pracy AZD
- Wdrażać i konfigurować aplikacje oparte na AI
- Zrozumieć wzorce implementacji RAG (Retrieval-Augmented Generation)
- Zarządzać wdrożeniami modeli AI i ich skalowaniem

#### Kluczowe pojęcia do opanowania
- Integracja usług Azure OpenAI i zarządzanie API
- Konfiguracja wyszukiwania AI i indeksowanie wektorowe
- Strategie wdrażania modeli i planowanie pojemności
- Monitorowanie aplikacji AI i optymalizacja wydajności

#### Ćwiczenia praktyczne
1. **Wdrożenie czatu AI**: Wdroż szablon azure-search-openai-demo
2. **Implementacja RAG**: Skonfiguruj indeksowanie dokumentów i ich wyszukiwanie
3. **Konfiguracja modeli**: Skonfiguruj wiele modeli AI o różnych zastosowaniach
4. **Monitorowanie AI**: Wdroż Application Insights dla obciążeń AI

#### Pytania oceniające
- Jak skonfigurować usługi Azure OpenAI w szablonie AZD?
- Jakie są kluczowe komponenty architektury RAG?
- Jak zarządzać pojemnością i skalowaniem modeli AI?
- Jakie metryki monitorowania są ważne dla aplikacji AI?

---

### Rozdział 3: Konfiguracja i uwierzytelnianie (Tydzień 3)
**Czas trwania**: 45-60 minut | **Poziom trudności**: ⭐⭐

#### Cele nauki
- Opanować strategie konfiguracji i zarządzania środowiskami
- Wdrażać bezpieczne wzorce uwierzytelniania i zarządzane tożsamości
- Organizować zasoby zgodnie z odpowiednimi konwencjami nazewnictwa
- Konfigurować wdrożenia w wielu środowiskach (dev, staging, prod)

#### Kluczowe pojęcia do opanowania
- Hierarchia środowisk i priorytety konfiguracji
- Uwierzytelnianie za pomocą zarządzanej tożsamości i zasad serwisowych
- Integracja Key Vault dla zarządzania tajemnicami
- Zarządzanie parametrami specyficznymi dla środowiska

#### Ćwiczenia praktyczne
1. **Konfiguracja wielu środowisk**: Skonfiguruj środowiska dev, staging i prod
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
**Czas trwania**: 1-1,5 godziny | **Poziom trudności**: ⭐⭐⭐

#### Cele nauki
- Tworzyć i dostosowywać szablony infrastruktury Bicep
- Wdrażać zaawansowane wzorce i przepływy pracy wdrożeniowe
- Zrozumieć strategie tworzenia zasobów
- Projektować skalowalne architektury wielousługowe

#### Kluczowe pojęcia do opanowania
- Struktura szablonów Bicep i najlepsze praktyki
- Zależności zasobów i kolejność wdrożeń
- Pliki parametrów i modularność szablonów
- Niestandardowe haki i automatyzacja wdrożeń

#### Ćwiczenia praktyczne
1. **Tworzenie niestandardowego szablonu**: Zbuduj szablon aplikacji wielousługowej
2. **Opanowanie Bicep**: Utwórz modularne, wielokrotnego użytku komponenty infrastruktury
3. **Automatyzacja wdrożeń**: Wdroż haki przed/po wdrożeniu
4. **Projektowanie architektury**: Wdroż złożoną architekturę mikrousługową

#### Pytania oceniające
- Jak stworzyć niestandardowe szablony Bicep dla AZD?
- Jakie są najlepsze praktyki organizacji kodu infrastruktury?
- Jak obsługiwać zależności zasobów w szablonach?
- Jakie wzorce wdrożeniowe wspierają aktualizacje bez przestojów?

---

### Rozdział 5: Rozwiązania AI z wieloma agentami (Tydzień 6-7)
**Czas trwania**: 2-3 godziny | **Poziom trudności**: ⭐⭐⭐⭐

#### Cele nauki
- Projektować i wdrażać architektury AI z wieloma agentami
- Koordynować komunikację i współpracę agentów
- Wdrażać rozwiązania AI gotowe do produkcji z monitorowaniem
- Zrozumieć specjalizację agentów i wzorce przepływu pracy

#### Kluczowe pojęcia do opanowania
- Wzorce architektury wieloagentowej i zasady projektowania
- Protokoły komunikacji agentów i przepływ danych
- Strategie równoważenia obciążenia i skalowania dla agentów AI
- Monitorowanie produkcji dla systemów wieloagentowych

#### Ćwiczenia praktyczne
1. **Wdrożenie rozwiązania dla handlu detalicznego**: Wdroż kompletny scenariusz wieloagentowy dla handlu detalicznego
2. **Dostosowanie agentów**: Zmodyfikuj zachowania agentów Klienta i Magazynu
3. **Skalowanie architektury**: Wdroż równoważenie obciążenia i autoskalowanie
4. **Monitorowanie produkcji**: Skonfiguruj kompleksowe monitorowanie i alerty

#### Pytania oceniające
- Jak projektować efektywne wzorce komunikacji agentów?
- Jakie są kluczowe aspekty skalowania obciążeń agentów AI?
- Jak monitorować i debugować systemy AI z wieloma agentami?
- Jakie wzorce produkcyjne zapewniają niezawodność agentów AI?

---

### Rozdział 6: Walidacja przed wdrożeniem i planowanie (Tydzień 8)
**Czas trwania**: 1 godzina | **Poziom trudności**: ⭐⭐

#### Cele nauki
- Przeprowadzać kompleksowe planowanie pojemności i walidację zasobów
- Wybierać optymalne SKU Azure dla efektywności kosztowej
- Wdrażać zautomatyzowane kontrole przed wdrożeniem i walidację
- Planować wdrożenia z uwzględnieniem strategii optymalizacji kosztów

#### Kluczowe pojęcia do opanowania
- Limity zasobów Azure i ograniczenia pojemności
- Kryteria wyboru SKU i optymalizacja kosztów
- Zautomatyzowane skrypty walidacyjne i testowanie
- Metodologie planowania pojemności
- Testowanie wydajności i optymalizacja

#### Ćwiczenia praktyczne
1. **Analiza pojemności**: Przeanalizuj wymagania zasobów dla swoich aplikacji
2. **Optymalizacja SKU**: Porównaj i wybierz efektywne kosztowo poziomy usług
3. **Automatyzacja walidacji**: Wdroż skrypty kontroli przed wdrożeniem
4. **Planowanie kosztów**: Stwórz szacunkowe koszty wdrożenia i budżety

#### Pytania oceniające
- Jak walidować pojemność Azure przed wdrożeniem?
- Jakie czynniki wpływają na decyzje dotyczące wyboru SKU?
- Jak zautomatyzować walidację przed wdrożeniem?
- Jakie strategie pomagają optymalizować koszty wdrożenia?
2. Jak sprawdzić dostępność zasobów Azure przed wdrożeniem?  
3. Jakie są kluczowe elementy systemu kontroli przed wdrożeniem?  
4. Jak oszacować i kontrolować koszty wdrożenia?  
5. Jakie monitorowanie jest niezbędne do planowania pojemności?

### Moduł 5: Rozwiązywanie problemów i debugowanie (Tydzień 6)

#### Cele nauki
- Opanowanie systematycznych metod rozwiązywania problemów  
- Rozwój umiejętności debugowania złożonych problemów wdrożeniowych  
- Wdrożenie kompleksowego monitorowania i alertowania  
- Budowa procedur reagowania na incydenty i odzyskiwania danych  

#### Kluczowe koncepcje do opanowania
- Typowe wzorce niepowodzeń wdrożeniowych  
- Analiza logów i techniki korelacji  
- Monitorowanie wydajności i optymalizacja  
- Wykrywanie incydentów związanych z bezpieczeństwem i reakcja na nie  
- Odzyskiwanie danych po awarii i ciągłość biznesowa  

#### Ćwiczenia praktyczne

**Ćwiczenie 5.1: Scenariusze rozwiązywania problemów**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Ćwiczenie 5.2: Wdrożenie monitorowania**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Ćwiczenie 5.3: Reakcja na incydenty**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Pytania do samooceny
1. Jaki jest systematyczny sposób rozwiązywania problemów z wdrożeniami azd?  
2. Jak korelować logi z różnych usług i zasobów?  
3. Jakie metryki monitorowania są najważniejsze dla wczesnego wykrywania problemów?  
4. Jak wdrożyć skuteczne procedury odzyskiwania danych po awarii?  
5. Jakie są kluczowe elementy planu reagowania na incydenty?  

### Moduł 6: Zaawansowane tematy i najlepsze praktyki (Tydzień 7-8)

#### Cele nauki
- Wdrożenie wzorców wdrożeniowych na poziomie przedsiębiorstwa  
- Opanowanie integracji i automatyzacji CI/CD  
- Tworzenie niestandardowych szablonów i wkład w społeczność  
- Zrozumienie zaawansowanych wymagań dotyczących bezpieczeństwa i zgodności  

#### Kluczowe koncepcje do opanowania
- Wzorce integracji pipeline'ów CI/CD  
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Ćwiczenie 6.3: Wdrożenie na poziomie przedsiębiorstwa**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Pytania do samooceny
1. Jak zintegrować azd z istniejącymi workflowami CI/CD?  
2. Jakie są kluczowe aspekty tworzenia niestandardowych szablonów?  
3. Jak wdrożyć zarządzanie i zgodność w wdrożeniach azd?  
4. Jakie są najlepsze praktyki dla wdrożeń na dużą skalę?  
5. Jak skutecznie przyczynić się do rozwoju społeczności azd?  

## Projekty praktyczne

### Projekt 1: Strona portfolio osobistego  
**Poziom trudności**: Początkujący  
**Czas trwania**: 1-2 tygodnie  

Zbuduj i wdroż stronę portfolio osobistego, korzystając z:  
- Hostingu statycznej strony na Azure Storage  
- Konfiguracji niestandardowej domeny  
- Integracji CDN dla globalnej wydajności  
- Zautomatyzowanego pipeline'u wdrożeniowego  

**Rezultaty**:  
- Działająca strona wdrożona na Azure  
- Niestandardowy szablon azd dla wdrożeń portfolio  
- Dokumentacja procesu wdrożenia  
- Rekomendacje dotyczące analizy kosztów i optymalizacji  

### Projekt 2: Aplikacja do zarządzania zadaniami  
**Poziom trudności**: Średniozaawansowany  
**Czas trwania**: 2-3 tygodnie  

Stwórz aplikację full-stack do zarządzania zadaniami z:  
- Frontendem React wdrożonym na App Service  
- Backendem API Node.js z uwierzytelnianiem  
- Bazą danych PostgreSQL z migracjami  
- Monitorowaniem za pomocą Application Insights  

**Rezultaty**:  
- Kompletną aplikację z uwierzytelnianiem użytkowników  
- Schemat bazy danych i skrypty migracji  
- Dashboardy monitorowania i reguły alertów  
- Konfigurację wdrożenia dla wielu środowisk  

### Projekt 3: Platforma e-commerce oparta na mikroserwisach  
**Poziom trudności**: Zaawansowany  
**Czas trwania**: 4-6 tygodni  

Zaprojektuj i wdroż platformę e-commerce opartą na mikroserwisach:  
- Wiele usług API (katalog, zamówienia, płatności, użytkownicy)  
- Integracja kolejki wiadomości z Service Bus  
- Redis cache dla optymalizacji wydajności  
- Kompleksowe logowanie i monitorowanie  

**Rezultaty**:  
- Kompletną architekturę mikroserwisów  
- Wzorce komunikacji między usługami  
- Testy wydajności i optymalizacja  
- Wdrożenie zabezpieczeń gotowe do produkcji  

## Ocena i certyfikacja

### Sprawdzanie wiedzy

Ukończ te oceny po każdym module:

**Ocena Modułu 1**: Podstawowe koncepcje i instalacja  
- Pytania wielokrotnego wyboru dotyczące podstawowych koncepcji  
- Zadania praktyczne dotyczące instalacji i konfiguracji  
- Proste ćwiczenie wdrożeniowe  

**Ocena Modułu 2**: Konfiguracja i środowiska  
- Scenariusze zarządzania środowiskami  
- Ćwiczenia rozwiązywania problemów z konfiguracją  
- Implementacja konfiguracji bezpieczeństwa  

**Ocena Modułu 3**: Wdrożenie i provisioning  
- Wyzwania projektowe infrastruktury  
- Scenariusze wdrożenia wielu usług  
- Ćwiczenia optymalizacji wydajności  

**Ocena Modułu 4**: Walidacja przed wdrożeniem  
- Studium przypadku planowania pojemności  
- Scenariusze optymalizacji kosztów  
- Implementacja pipeline'u walidacyjnego  

**Ocena Modułu 5**: Rozwiązywanie problemów i debugowanie  
- Ćwiczenia diagnozowania problemów  
- Zadania implementacji monitorowania  
- Symulacje reakcji na incydenty  

**Ocena Modułu 6**: Zaawansowane tematy  
- Projektowanie pipeline'ów CI/CD  
- Tworzenie niestandardowych szablonów  
- Scenariusze architektury na poziomie przedsiębiorstwa  

### Projekt końcowy

Zaprojektuj i wdroż kompletną aplikację, która demonstruje opanowanie wszystkich koncepcji:

**Wymagania**:  
- Architektura aplikacji wielowarstwowej  
- Wiele środowisk wdrożeniowych  
- Kompleksowe monitorowanie i alertowanie  
- Implementacja bezpieczeństwa i zgodności  
- Optymalizacja kosztów i wydajności  
- Pełna dokumentacja i runbooki  

**Kryteria oceny**:  
- Jakość techniczna implementacji  
- Kompletny zestaw dokumentacji  
- Zgodność z najlepszymi praktykami bezpieczeństwa  
- Optymalizacja wydajności i kosztów  
- Skuteczność monitorowania i rozwiązywania problemów  

## Zasoby do nauki i odniesienia

### Oficjalna dokumentacja
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Zasoby społecznościowe
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Środowiska praktyczne
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Dodatkowe narzędzia
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Rekomendacje harmonogramu nauki

### Nauka pełnoetatowa (8 tygodni)
- **Tydzień 1-2**: Moduły 1-2 (Wprowadzenie, Konfiguracja)  
- **Tydzień 3-4**: Moduły 3-4 (Wdrożenie, Walidacja przed wdrożeniem)  
- **Tydzień 5-6**: Moduły 5-6 (Rozwiązywanie problemów, Zaawansowane tematy)  
- **Tydzień 7-8**: Projekty praktyczne i ocena końcowa  

### Nauka w niepełnym wymiarze godzin (16 tygodni)
- **Tydzień 1-4**: Moduł 1 (Wprowadzenie)  
- **Tydzień 5-7**: Moduł 2 (Konfiguracja i środowiska)  
- **Tydzień 8-10**: Moduł 3 (Wdrożenie i provisioning)  
- **Tydzień 11-12**: Moduł 4 (Walidacja przed wdrożeniem)  
- **Tydzień 13-14**: Moduł 5 (Rozwiązywanie problemów i debugowanie)  
- **Tydzień 15-16**: Moduł 6 (Zaawansowane tematy i ocena)  

---

## Śledzenie postępów i ramy oceny

### Lista kontrolna ukończenia rozdziałów

Śledź swoje postępy w każdym rozdziale za pomocą tych mierzalnych wyników:

#### 📚 Rozdział 1: Podstawy i szybki start  
- [ ] **Instalacja zakończona**: AZD zainstalowany i zweryfikowany na Twojej platformie  
- [ ] **Pierwsze wdrożenie**: Pomyślnie wdrożony szablon todo-nodejs-mongo  
- [ ] **Konfiguracja środowiska**: Skonfigurowane pierwsze zmienne środowiskowe  
- [ ] **Nawigacja po zasobach**: Eksploracja wdrożonych zasobów w Azure Portal  
- [ ] **Opanowanie poleceń**: Komfortowe korzystanie z podstawowych poleceń AZD  

#### 🤖 Rozdział 2: Rozwój oparty na AI  
- [ ] **Wdrożenie szablonu AI**: Pomyślnie wdrożony azure-search-openai-demo  
- [ ] **Implementacja RAG**: Skonfigurowane indeksowanie i wyszukiwanie dokumentów  
- [ ] **Konfiguracja modelu**: Ustawione różne modele AI do różnych celów  
- [ ] **Monitorowanie AI**: Wdrożone Application Insights dla obciążeń AI  
- [ ] **Optymalizacja wydajności**: Zoptymalizowana wydajność aplikacji AI  

#### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie  
- [ ] **Konfiguracja wielu środowisk**: Skonfigurowane środowiska dev, staging i prod  
- [ ] **Implementacja bezpieczeństwa**: Ustawione uwierzytelnianie za pomocą zarządzanej tożsamości  
- [ ] **Zarządzanie sekretami**: Zintegrowany Azure Key Vault dla wrażliwych danych  
- [ ] **Zarządzanie parametrami**: Utworzone konfiguracje specyficzne dla środowiska  
- [ ] **Opanowanie uwierzytelniania**: Wdrożone bezpieczne wzorce dostępu  

#### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenie  
- [ ] **Tworzenie niestandardowego szablonu**: Zbudowany szablon aplikacji wielousługowej  
- [ ] **Opanowanie Bicep**: Utworzone modułowe, wielokrotnego użytku komponenty infrastruktury  
- [ ] **Automatyzacja wdrożenia**: Wdrożone pre/post hooki wdrożeniowe  
- [ ] **Projektowanie architektury**: Wdrożona złożona architektura mikroserwisów  
- [ ] **Optymalizacja szablonu**: Zoptymalizowane szablony pod kątem wydajności i kosztów  

#### 🎯 Rozdział 5: Rozwiązania AI z wieloma agentami  
- [ ] **Wdrożenie rozwiązania dla handlu detalicznego**: Wdrożony kompletny scenariusz handlu detalicznego z wieloma agentami  
- [ ] **Dostosowanie agenta**: Zmodyfikowane zachowania agenta Klienta i Inwentarza  
- [ ] **Skalowanie architektury**: Wdrożone równoważenie obciążenia i autoskalowanie  
- [ ] **Monitorowanie produkcji**: Skonfigurowane kompleksowe monitorowanie i alertowanie  
- [ ] **Optymalizacja wydajności**: Zoptymalizowana wydajność systemu wieloagentowego  

#### 🔍 Rozdział 6: Walidacja przed wdrożeniem i planowanie  
- [ ] **Analiza pojemności**: Przeanalizowane wymagania dotyczące zasobów dla aplikacji  
- [ ] **Optymalizacja SKU**: Wybrane opłacalne poziomy usług  
- [ ] **Automatyzacja walidacji**: Wdrożone skrypty kontroli przed wdrożeniem  
- [ ] **Planowanie kosztów**: Utworzone szacunki kosztów wdrożenia i budżety  
- [ ] **Ocena ryzyka**: Zidentyfikowane i zminimalizowane ryzyka wdrożeniowe  

#### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie  
- [ ] **Umiejętności diagnostyczne**: Pomyślnie zdebugowane celowo uszkodzone wdrożenia  
- [ ] **Analiza logów**: Skutecznie użyte Azure Monitor i Application Insights  
- [ ] **Optymalizacja wydajności**: Zoptymalizowane aplikacje o niskiej wydajności  
- [ ] **Procedury odzyskiwania**: Wdrożone kopie zapasowe i odzyskiwanie danych po awarii  
- [ ] **Konfiguracja monitorowania**: Utworzone proaktywne monitorowanie i alertowanie  

#### 🏢 Rozdział 8: Wzorce produkcyjne i przedsiębiorstwa  
- [ ] **Bezpieczeństwo przedsiębiorstwa**: Wdrożone kompleksowe wzorce bezpieczeństwa  
- [ ] **Ramka zarządzania**: Skonfigurowane Azure Policy i zarządzanie zasobami  
- [ ] **Zaawansowane monitorowanie**: Utworzone dashboardy i zautomatyzowane alerty  
- [ ] **Integracja CI/CD**: Zbudowane zautomatyzowane pipeline'y wdrożeniowe  
- [ ] **Implementacja zgodności**: Spełnione wymagania zgodności na poziomie przedsiębiorstwa  

### Harmonogram nauki i kamienie milowe

#### Tydzień 1-2: Budowanie podstaw  
- **Kamień milowy**: Wdrożenie pierwszej aplikacji AI za pomocą AZD  
- **Walidacja**: Działająca aplikacja dostępna pod publicznym URL  
- **Umiejętności**: Podstawowe workflowy AZD i integracja usług AI  

#### Tydzień 3-4: Opanowanie konfiguracji  
- **Kamień milowy**: Wdrożenie w wielu środowiskach z bezpiecznym uwierzytelnianiem  
- **Walidacja**: Ta sama aplikacja wdrożona w dev/staging/prod  
- **Umiejętności**: Zarządzanie środowiskami i implementacja bezpieczeństwa  

#### Tydzień 5-6: Ekspertyza infrastruktury  
- **Kamień milowy**: Niestandardowy szablon dla złożonej aplikacji wielousługowej  
- **Walidacja**: Szablon wielokrotnego użytku wdrożony przez innego członka zespołu  
- **Umiejętności**: Opanowanie Bicep i automatyzacja infrastruktury  

#### Tydzień 7-8: Zaawansowana implementacja AI  
- **Kamień
- **Dokumentacja**: Współtwórz dokumentację społecznościową i przykłady
- **Pętla opinii**: Przekazuj opinie na temat treści kursu i usług Azure

#### Rozwój kariery
- **Sieć zawodowa**: Nawiąż kontakt z ekspertami Azure i AI
- **Możliwości wystąpień**: Prezentuj swoje doświadczenia na konferencjach lub spotkaniach
- **Wkład w open source**: Współtwórz szablony i narzędzia AZD
- **Mentoring**: Wspieraj innych programistów w ich nauce AZD

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Rozpocznij naukę**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Śledzenie postępów**: Śledź swoje osiągnięcia w ramach kompleksowego systemu nauki składającego się z 8 rozdziałów
- **🤝 Społeczność**: [Azure Discord](https://discord.gg/microsoft-azure) dla wsparcia i dyskusji

**Śledzenie postępów w nauce**: Korzystaj z tej uporządkowanej instrukcji, aby opanować Azure Developer CLI poprzez stopniową, praktyczną naukę z mierzalnymi rezultatami i korzyściami dla rozwoju zawodowego.

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.