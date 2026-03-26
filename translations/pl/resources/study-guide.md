# Przewodnik nauki - kompleksowe cele edukacyjne

**Nawigacja ścieżki nauki**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Rozpocznij naukę**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Śledzenie postępów**: [Ukończenie kursu](../README.md#-course-completion--certification)

## Wprowadzenie

Ten kompleksowy przewodnik nauki zapewnia uporządkowane cele edukacyjne, kluczowe koncepcje, ćwiczenia praktyczne oraz materiały do oceny, które pomogą Ci opanować Azure Developer CLI (azd). Używaj tego przewodnika, aby śledzić postępy i upewnić się, że opanowałeś wszystkie kluczowe tematy.

## Cele nauki

Po ukończeniu tego przewodnika nauczysz się:
- Opanować wszystkie podstawowe i zaawansowane koncepcje Azure Developer CLI
- Rozwinąć praktyczne umiejętności wdrażania i zarządzania aplikacjami w Azure
- Zyskać pewność siebie w rozwiązywaniu problemów i optymalizacji wdrożeń
- Zrozumieć praktyki wdrożeń gotowych do produkcji oraz kwestie bezpieczeństwa

## Efekty nauki

Po ukończeniu wszystkich sekcji tego przewodnika będziesz potrafił:
- Projektować, wdrażać i zarządzać kompletną architekturą aplikacji za pomocą azd
- Wdrażać kompleksowy monitoring, bezpieczeństwo i strategie optymalizacji kosztów
- Samodzielnie rozwiązywać złożone problemy z wdrożeniem
- Tworzyć niestandardowe szablony i wnosić wkład do społeczności azd

## Struktura nauki w 8 rozdziałach

### Rozdział 1: Podstawy i szybki start (Tydzień 1)
**Czas trwania**: 30-45 minut | **Złożoność**: ⭐

#### Cele nauki
- Zrozumieć podstawowe koncepcje i terminologię Azure Developer CLI
- Pomyślnie zainstalować i skonfigurować AZD na swojej platformie deweloperskiej
- Wdrożyć pierwszą aplikację przy użyciu istniejącego szablonu
- Efektywnie poruszać się po interfejsie linii poleceń AZD

#### Kluczowe koncepcje do opanowania
- Struktura i komponenty projektu AZD (azure.yaml, infra/, src/)
- Workflow wdrożenia oparte na szablonach
- Podstawy konfiguracji środowiska
- Zarządzanie grupami zasobów i subskrypcjami

#### Ćwiczenia praktyczne
1. **Weryfikacja instalacji**: Zainstaluj AZD i sprawdź wersję za pomocą `azd version`
2. **Pierwsze wdrożenie**: Pomyślnie wdroż szablon todo-nodejs-mongo
3. **Konfiguracja środowiska**: Skonfiguruj swoje pierwsze zmienne środowiskowe
4. **Eksploracja zasobów**: Przeglądaj wdrożone zasoby w Azure Portal

#### Pytania do oceny
- Jakie są podstawowe komponenty projektu AZD?
- Jak zainicjować nowy projekt z szablonu?
- Jaka jest różnica między `azd up` a `azd deploy`?
- Jak zarządzać wieloma środowiskami za pomocą AZD?

---

### Rozdział 2: Rozwój z naciskiem na AI (Tydzień 2)
**Czas trwania**: 1-2 godziny | **Złożoność**: ⭐⭐

#### Cele nauki
- Zintegrować usługi Microsoft Foundry z workflow AZD
- Wdrażać i konfigurować aplikacje wykorzystujące AI
- Zrozumieć wzorce implementacji RAG (Retrieval-Augmented Generation)
- Zarządzać wdrożeniami i skalowaniem modeli AI

#### Kluczowe koncepcje do opanowania
- Integracja usług Microsoft Foundry Models i zarządzanie API
- Konfiguracja AI Search i indeksowanie wektorowe
- Strategie wdrażania modeli i planowanie pojemności
- Monitorowanie aplikacji AI i optymalizacja wydajności

#### Ćwiczenia praktyczne
1. **Wdrożenie czatu AI**: Wdroż szablon azure-search-openai-demo
2. **Implementacja RAG**: Skonfiguruj indeksowanie i wyszukiwanie dokumentów
3. **Konfiguracja modelu**: Skonfiguruj kilka modeli AI o różnych zastosowaniach
4. **Monitoring AI**: Zaimplementuj Application Insights dla obciążeń AI

#### Pytania do oceny
- Jak skonfigurować usługi Microsoft Foundry Models w szablonie AZD?
- Jakie są kluczowe komponenty architektury RAG?
- Jak zarządzać pojemnością i skalowaniem modeli AI?
- Jakie metryki monitorowania są ważne dla aplikacji AI?

---

### Rozdział 3: Konfiguracja i uwierzytelnianie (Tydzień 3)
**Czas trwania**: 45-60 minut | **Złożoność**: ⭐⭐

#### Cele nauki
- Opanować strategie konfiguracji i zarządzania środowiskami
- Wdrożyć bezpieczne wzorce uwierzytelniania i zarządzanie tożsamością
- Organizować zasoby za pomocą odpowiednich konwencji nazewnictwa
- Konfigurować wdrożenia wielośrodowiskowe (dev, staging, prod)

#### Kluczowe koncepcje do opanowania
- Hierarchia środowisk i kolejność reguł konfiguracji
- Uwierzytelnianie za pomocą zarządzanej tożsamości i service principal
- Integracja z Key Vault dla zarządzania sekretami
- Zarządzanie parametrami specyficznymi dla środowiska

#### Ćwiczenia praktyczne
1. **Ustawienie wielu środowisk**: Skonfiguruj środowiska dev, staging i prod
2. **Konfiguracja bezpieczeństwa**: Wdroż uwierzytelnianie zarządzanej tożsamości
3. **Zarządzanie sekretami**: Integracja z Azure Key Vault dla danych wrażliwych
4. **Zarządzanie parametrami**: Utwórz konfiguracje specyficzne dla środowiska

#### Pytania do oceny
- Jak skonfigurować różne środowiska za pomocą AZD?
- Jakie są korzyści z używania zarządzanej tożsamości zamiast service principal?
- Jak bezpiecznie zarządzać sekretami aplikacji?
- Jaka jest hierarchia konfiguracji w AZD?

---

### Rozdział 4: Infrastruktura jako kod i wdrożenia (Tydzień 4-5)
**Czas trwania**: 1-1,5 godziny | **Złożoność**: ⭐⭐⭐

#### Cele nauki
- Tworzyć i dostosowywać szablony infrastruktury Bicep
- Wdrażać zaawansowane wzorce i workflow wdrożeniowe
- Zrozumieć strategie provisioning zasobów
- Projektować skalowalne architektury wielousługowe

- Wdrażać aplikacje konteneryzowane z użyciem Azure Container Apps i AZD

#### Kluczowe koncepcje do opanowania
- Struktura szablonów Bicep i najlepsze praktyki
- Zależności zasobów i kolejność wdrożeń
- Pliki parametrów i modularność szablonów
- Niestandardowe hooki i automatyzacja wdrożeń
- Wzorce wdrożenia aplikacji kontenerowych (quick start, produkcja, mikroserwisy)

#### Ćwiczenia praktyczne
1. **Tworzenie niestandardowych szablonów**: Zbuduj szablon aplikacji wielousługowej
2. **Opanowanie Bicep**: Stwórz modułowe, wielokrotnego użytku komponenty infrastruktury
3. **Automatyzacja wdrożeń**: Wdroż hooki przed/po wdrożeniu
4. **Projektowanie architektury**: Wdroż złożoną architekturę mikroserwisów
5. **Wdrożenie aplikacji kontenerowej**: Wdroż przykłady [Simple Flask API](../../../examples/container-app/simple-flask-api) i [Microservices Architecture](../../../examples/container-app/microservices) używając AZD

#### Pytania do oceny
- Jak tworzyć niestandardowe szablony Bicep dla AZD?
- Jakie są najlepsze praktyki organizacji kodu infrastruktury?
- Jak obsługiwać zależności zasobów w szablonach?
- Jakie wzorce wdrożeniowe wspierają aktualizacje bez przestojów?

---

### Rozdział 5: Wieloagentowe rozwiązania AI (Tydzień 6-7)
**Czas trwania**: 2-3 godziny | **Złożoność**: ⭐⭐⭐⭐

#### Cele nauki
- Projektować i implementować architektury AI z wieloma agentami
- Orkiestracja koordynacji i komunikacji agentów
- Wdrażać rozwiązania AI gotowe do produkcji z monitoringiem
- Zrozumieć specjalizację agentów i wzorce workflow
- Integrować konteneryzowane mikroserwisy jako część rozwiązań wieloagentowych

#### Kluczowe koncepcje do opanowania
- Wzorce architektury wieloagentowej i zasady projektowania
- Protokoły komunikacji agentów i przepływ danych
- Strategie load balancing i skalowania dla agentów AI
- Monitoring produkcyjny systemów wieloagentowych
- Komunikacja usług w środowiskach konteneryzowanych

#### Ćwiczenia praktyczne
1. **Wdrożenie rozwiązania retail**: Wdroż kompletny scenariusz wieloagentowy dla handlu detalicznego
2. **Dostosowanie agentów**: Zmodyfikuj zachowania agentów Customer i Inventory
3. **Skalowanie architektury**: Wdroż load balancing i auto-skalowanie
4. **Monitoring produkcyjny**: Skonfiguruj kompleksowy monitoring i alerty
5. **Integracja mikroserwisów**: Rozszerz przykład [Microservices Architecture](../../../examples/container-app/microservices) o wsparcie workflow opartych na agentach

#### Pytania do oceny
- Jak zaprojektować efektywne wzorce komunikacji wieloagentowej?
- Jakie są kluczowe aspekty skalowania obciążeń agentów AI?
- Jak monitorować i debugować systemy wieloagentowe AI?
- Jakie wzorce produkcyjne zapewniają niezawodność agentów AI?

---

### Rozdział 6: Walidacja i planowanie przed wdrożeniem (Tydzień 8)
**Czas trwania**: 1 godzina | **Złożoność**: ⭐⭐

#### Cele nauki
- Przeprowadzać kompleksowe planowanie pojemności i walidację zasobów
- Wybierać optymalne SKU Azure dla efektywności kosztowej
- Wdrażać zautomatyzowane kontrole i walidacje pre-flight
- Planować wdrożenia ze strategią optymalizacji kosztów

#### Kluczowe koncepcje do opanowania
- Limity kwot i pojemności zasobów Azure
- Kryteria doboru SKU i optymalizacja kosztów
- Zautomatyzowane skrypty walidacyjne i testujące
- Planowanie wdrożeń i ocena ryzyka

#### Ćwiczenia praktyczne
1. **Analiza pojemności**: Analizuj wymagania zasobów dla swoich aplikacji
2. **Optymalizacja SKU**: Porównuj i wybieraj kosztowo efektywne poziomy usług
3. **Automatyzacja walidacji**: Wdraż skrypty kontroli przed wdrożeniem
4. **Planowanie kosztów**: Twórz szacunki i budżety wdrożeniowe

#### Pytania do oceny
- Jak walidować pojemność Azure przed wdrożeniem?
- Jakie czynniki wpływają na decyzje wyboru SKU?
- Jak automatyzować walidację przed wdrożeniem?
- Jakie strategie pomagają optymalizować koszty wdrożeń?

---

### Rozdział 7: Rozwiązywanie problemów i debugowanie (Tydzień 9)
**Czas trwania**: 1-1,5 godziny | **Złożoność**: ⭐⭐

#### Cele nauki
- Rozwijać systematyczne podejścia do debugowania wdrożeń AZD
- Rozwiązywać typowe błędy konfiguracji i wdrożeń
- Debugować problemy specyficzne dla AI i kwestie wydajności
- Wdrażać monitoring i alerty dla proaktywnego wykrywania problemów

#### Kluczowe koncepcje do opanowania
- Techniki diagnostyczne i strategie logowania
- Typowe wzorce awarii i ich rozwiązania
- Monitoring wydajności i optymalizacja
- Procedury reakcji na incydenty i odzyskiwania

#### Ćwiczenia praktyczne
1. **Umiejętności diagnostyczne**: Praktyka na celowo błędnych wdrożeniach
2. **Analiza logów**: Efektywne użycie Azure Monitor i Application Insights
3. **Optymalizacja wydajności**: Usprawnianie wolno działających aplikacji
4. **Procedury odzyskiwania**: Wdrażanie kopii zapasowych i planów awaryjnych

#### Pytania do oceny
- Jakie są najczęstsze błędy wdrożeń AZD?
- Jak debugować problemy z uwierzytelnianiem i uprawnieniami?
- Jakie strategie monitorowania pomagają zapobiegać problemom produkcyjnym?
- Jak optymalizować wydajność aplikacji w Azure?

---

### Rozdział 8: Wzorce produkcyjne i korporacyjne (Tydzień 10-11)
**Czas trwania**: 2-3 godziny | **Złożoność**: ⭐⭐⭐⭐

#### Cele nauki
- Wdrażać strategie wdrożeń klasy enterprise
- Projektować wzorce bezpieczeństwa i ramy zgodności
- Ustanawiać monitoring, governance i zarządzanie kosztami
- Tworzyć skalowalne pipeline’y CI/CD z integracją AZD
- Stosować najlepsze praktyki produkcyjnych wdrożeń aplikacji kontenerowych (bezpieczeństwo, monitoring, koszty, CI/CD)

#### Kluczowe koncepcje do opanowania
- Wymagania bezpieczeństwa i zgodności korporacyjnej
- Ramy governance i implementacja polityk
- Zaawansowany monitoring i zarządzanie kosztami
- Integracja CI/CD i automatyzacja pipeline’ów
- Strategie wdrożeń blue-green i canary dla obciążeń konteneryzowanych

#### Ćwiczenia praktyczne
1. **Bezpieczeństwo korporacyjne**: Wdroż kompleksowe wzorce bezpieczeństwa
2. **Ramy governance**: Skonfiguruj Azure Policy i zarządzanie zasobami
3. **Zaawansowany monitoring**: Twórz dashboardy i automatyczne alerty
4. **Integracja CI/CD**: Buduj automatyczne pipeline’y wdrożeniowe
5. **Produkcja kontenerów**: Zastosuj zabezpieczenia, monitoring i optymalizację kosztów do przykładu [Microservices Architecture](../../../examples/container-app/microservices)

#### Pytania do oceny
- Jak wdrożyć bezpieczeństwo klasy enterprise w wdrożeniach AZD?
- Jakie wzorce governance zapewniają zgodność i kontrolę kosztów?
- Jak projektować skalowalny monitoring dla systemów produkcyjnych?
- Jakie wzorce CI/CD najlepiej sprawdzają się z workflow AZD?

#### Cele nauki
- Zrozumieć podstawy i kluczowe koncepcje Azure Developer CLI
- Pomyślnie zainstalować i skonfigurować azd w środowisku deweloperskim
- Ukończyć pierwsze wdrożenie używając istniejącego szablonu
- Poruszać się po strukturze projektu azd i rozumieć kluczowe komponenty

#### Kluczowe koncepcje do opanowania
- Szablony, środowiska i usługi
- Struktura konfiguracji azure.yaml
- Podstawowe polecenia azd (init, up, down, deploy)
- Zasady Infrastructure as Code
- Uwierzytelnianie i autoryzacja Azure

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

**Ćwiczenie 1.2: Pierwsze wdrożenie**
```bash
# Wdróż prostą aplikację internetową:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Ćwiczenie 1.3: Analiza struktury projektu**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Pytania do samodzielnej oceny
1. Jakie są trzy podstawowe koncepcje architektury azd?
2. Jaki jest cel pliku azure.yaml?
3. Jak środowiska pomagają zarządzać różnymi celami wdrożeń?
4. Jakie metody uwierzytelniania można wykorzystać z azd?
5. Co się dzieje po uruchomieniu `azd up` po raz pierwszy?

---

## Śledzenie postępów i framework oceny
```bash
# Utwórz i skonfiguruj wiele środowisk:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Ćwiczenie 2.2: Zaawansowana konfiguracja**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Ćwiczenie 2.3: Konfiguracja bezpieczeństwa**
```bash
# Wdrażaj najlepsze praktyki bezpieczeństwa:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pytania do samodzielnej oceny
1. Jak azd obsługuje kolejność nadpisywania zmiennych środowiskowych?
2. Czym są hooki wdrożeniowe i kiedy ich używać?
3. Jak konfigurować różne SKU dla różnych środowisk?
4. Jakie są implikacje bezpieczeństwa różnych metod uwierzytelniania?
5. Jak zarządzać sekretami i wrażliwymi danymi konfiguracyjnymi?

### Moduł 3: Wdrożenia i provisioning (Tydzień 4)

#### Cele nauki
- Opanować workflow wdrożeń i najlepsze praktyki
- Zrozumieć Infrastructure as Code za pomocą szablonów Bicep
- Wdrożyć złożone architektury wielousługowe
- Optymalizować wydajność i niezawodność wdrożeń

#### Kluczowe koncepcje do opanowania
- Struktura i moduły szablonów Bicep
- Zależności zasobów i ich kolejność
- Strategie wdrożeń (blue-green, rolling updates)
- Wdrożenia wieloregionowe
- Migracje baz danych i zarządzanie danymi

#### Ćwiczenia praktyczne

**Ćwiczenie 3.1: Niestandardowa infrastruktura**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Ćwiczenie 3.2: Aplikacja wielousługowa**
```bash
# Wdróż architekturę mikroserwisów:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Ćwiczenie 3.3: Integracja bazy danych**
```bash
# Zaimplementuj wzorce wdrażania bazy danych:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pytania do samodzielnej oceny
1. Jakie są zalety używania Bicep nad szablonami ARM?
2. Jak obsługiwać migracje baz danych podczas wdrożeń azd?
3. Jakie istnieją strategie wdrożeń bez przestojów?
4. Jak zarządzać zależnościami między usługami?
5. Jakie są rozważania dotyczące wdrożeń wieloregionowych?

### Moduł 4: Walidacja przed wdrożeniem (Tydzień 5)

#### Cele nauki
- Wdrażaj kompleksowe kontrole przed wdrożeniem  
- Opanuj planowanie pojemności i weryfikację zasobów  
- Zrozum wybór SKU i optymalizację kosztów  
- Buduj zautomatyzowane potoki walidacyjne  

#### Kluczowe pojęcia do opanowania  
- Limity i kwoty zasobów Azure  
- Kryteria wyboru SKU oraz konsekwencje kosztowe  
- Automatyczne skrypty i narzędzia walidacyjne  
- Metody planowania pojemności  
- Testowanie wydajności i optymalizacja  

#### Ćwiczenia praktyczne  

**Ćwiczenie 4.1: Planowanie pojemności**  
```bash
# Zaimplementuj walidację pojemności:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Ćwiczenie 4.2: Walidacja przedwdrożeniowa**  
```powershell
# Zbuduj kompleksowy proces walidacji:
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
3. Jakie są kluczowe elementy systemu kontroli przedwdrożeniowej?  
4. Jak szacujesz i kontrolujesz koszty wdrożenia?  
5. Jakie monitorowanie jest niezbędne dla planowania pojemności?  

### Moduł 5: Rozwiązywanie problemów i debugowanie (tydzień 6)  

#### Cele nauki  
- Opanuj systematyczne metody rozwiązywania problemów  
- Rozwiń umiejętności debugowania złożonych problemów wdrożeniowych  
- Wdrażaj kompleksowe monitorowanie i alertowanie  
- Buduj procedury reagowania na incydenty i odzyskiwania  

#### Kluczowe pojęcia do opanowania  
- Typowe wzorce awarii wdrożeń  
- Techniki analizy i korelacji logów  
- Monitorowanie wydajności i optymalizacja  
- Wykrywanie incydentów bezpieczeństwa i reakcja  
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
  
**Ćwiczenie 5.2: Implementacja monitorowania**  
```bash
# Skonfiguruj kompleksowy monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Ćwiczenie 5.3: Reakcja na incydenty**  
```bash
# Opracuj procedury reagowania na incydenty:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  
#### Pytania do samooceny  
1. Jaki jest systematyczny sposób rozwiązywania problemów w wdrożeniach azd?  
2. Jak korelujesz logi z wielu usług i zasobów?  
3. Które metryki monitorowania są najważniejsze dla wczesnego wykrywania problemów?  
4. Jak wdrażasz skuteczne procedury odzyskiwania po awarii?  
5. Jakie są kluczowe komponenty planu reagowania na incydenty?  

### Moduł 6: Zaawansowane tematy i najlepsze praktyki (tydzień 7-8)  

#### Cele nauki  
- Wdrażaj wzorce wdrożeń klasy korporacyjnej  
- Opanuj integrację i automatyzację CI/CD  
- Twórz własne szablony i angażuj się w społeczność  
- Poznaj zaawansowane wymagania bezpieczeństwa i zgodności  

#### Kluczowe pojęcia do opanowania  
- Wzorce integracji potoków CI/CD  
- Tworzenie i dystrybucja własnych szablonów  
- Zarządzanie i zgodność korporacyjna  
- Zaawansowane konfiguracje sieci i bezpieczeństwa  
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
  
**Ćwiczenie 6.2: Tworzenie własnego szablonu**  
```bash
# Twórz i publikuj niestandardowe szablony:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Ćwiczenie 6.3: Wdrożenie korporacyjne**  
```bash
# Wdroż funkcje klasy korporacyjnej:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  
#### Pytania do samooceny  
1. Jak integrujesz azd z istniejącymi przepływami CI/CD?  
2. Jakie są kluczowe aspekty tworzenia własnych szablonów?  
3. Jak wdrażasz zarządzanie i zgodność w wdrożeniach azd?  
4. Jakie są najlepsze praktyki wdrożeń na skalę korporacyjną?  
5. Jak efektywnie wspierasz społeczność azd?  

## Projekty praktyczne  

### Projekt 1: Osobista strona portfolio  
**Poziom trudności**: Początkujący  
**Czas trwania**: 1-2 tygodnie  

Zbuduj i wdroż osobistą stronę portfolio wykorzystując:  
- Statyczny hosting witryny na Azure Storage  
- Konfigurację własnej domeny  
- Integrację CDN dla globalnej wydajności  
- Zautomatyzowany potok wdrożeniowy  

**Efekty końcowe**:  
- Działająca strona wdrożona na Azure  
- Własny szablon azd dla wdrożeń portfolio  
- Dokumentacja procesu wdrożenia  
- Analiza kosztów i rekomendacje optymalizacyjne  

### Projekt 2: Aplikacja do zarządzania zadaniami  
**Poziom trudności**: Średniozaawansowany  
**Czas trwania**: 2-3 tygodnie  

Stwórz aplikację full-stack do zarządzania zadaniami z:  
- Frontendem React wdrożonym w App Service  
- Backendem Node.js z autentykacją  
- Bazą danych PostgreSQL z migracjami  
- Monitoringiem w Application Insights  

**Efekty końcowe**:  
- Kompletną aplikację z uwierzytelnianiem użytkowników  
- Schemat bazy danych i skrypty migracji  
- Pulpity monitoringu i reguły alertowania  
- Konfigurację wdrożeń dla wielu środowisk  

### Projekt 3: Platforma e-commerce oparta na mikroserwisach  
**Poziom trudności**: Zaawansowany  
**Czas trwania**: 4-6 tygodni  

Zaprojektuj i wdroż platformę e-commerce bazującą na mikroserwisach:  
- Wiele usług API (katalog, zamówienia, płatności, użytkownicy)  
- Integracja kolejek wiadomości z Service Bus  
- Cache Redis dla optymalizacji wydajności  
- Kompleksowy logging i monitoring  

**Przykład referencyjny**: Zobacz [Architektura mikroserwisów](../../../examples/container-app/microservices) — szablon i przewodnik wdrożenia produkcyjnego  

**Efekty końcowe**:  
- Kompletną architekturę mikroserwisów  
- Wzorce komunikacji między usługami  
- Testy wydajności i optymalizacja  
- Gotową do produkcji implementację zabezpieczeń  

## Ocena i certyfikacja  

### Sprawdziany wiedzy  

Wykonaj te oceny po każdym module:  

**Ocena Modułu 1**: Podstawowe pojęcia i instalacja  
- Pytania wielokrotnego wyboru dotyczące podstaw  
- Praktyczne zadania instalacji i konfiguracji  
- Proste ćwiczenie wdrożeniowe  

**Ocena Modułu 2**: Konfiguracja i środowiska  
- Scenariusze zarządzania środowiskami  
- Ćwiczenia rozwiązywania problemów konfiguracyjnych  
- Implementacja zabezpieczeń  

**Ocena Modułu 3**: Wdrożenie i provisionowanie  
- Wyzwania projektowania infrastruktury  
- Scenariusze wdrażania wielu usług  
- Ćwiczenia optymalizacji wydajności  

**Ocena Modułu 4**: Walidacja przed wdrożeniem  
- Studium przypadków planowania pojemności  
- Scenariusze optymalizacji kosztów  
- Implementacja potoków walidacyjnych  

**Ocena Modułu 5**: Rozwiązywanie problemów i debugowanie  
- Ćwiczenia diagnozy problemów  
- Zadania implementacji monitoringu  
- Symulacje reagowania na incydenty  

**Ocena Modułu 6**: Tematy zaawansowane  
- Projektowanie potoków CI/CD  
- Tworzenie własnych szablonów  
- Scenariusze architektury korporacyjnej  

### Finałowy projekt kompleksowy  

Zaprojektuj i wdroż kompletne rozwiązanie pokazujące opanowanie wszystkich pojęć:  

**Wymagania**:  
- Architektura aplikacji wielowarstwowej  
- Wiele środowisk wdrożeniowych  
- Kompleksowe monitorowanie i alertowanie  
- Implementacja zabezpieczeń i zgodności  
- Optymalizacja kosztów i wydajności  
- Pełna dokumentacja i instrukcje obsługi  

**Kryteria oceny**:  
- Jakość technicznej realizacji  
- Kompletność dokumentacji  
- Przestrzeganie bezpieczeństwa i najlepszych praktyk  
- Optymalizacja wydajności i kosztów  
- Skuteczność rozwiązywania problemów i monitoringu  

## Materiały do nauki i odnośniki  

### Oficjalna dokumentacja  
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Dokumentacja Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Zasoby społecznościowe  
- [Galeria szablonów AZD](https://azure.github.io/awesome-azd/)  
- [Organizacja Azure-Samples na GitHub](https://github.com/Azure-Samples)  
- [Repozytorium Azure Developer CLI na GitHub](https://github.com/Azure/azure-dev)  

### Środowiska do ćwiczeń  
- [Darmowe konto Azure](https://azure.microsoft.com/free/)  
- [Bezpłatny plan Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Dodatkowe narzędzia  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Pakiet rozszerzeń Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Rekomendowany harmonogram nauki  

### Nauka w trybie pełnoetatowym (8 tygodni)  
- **Tygodnie 1-2**: Moduły 1-2 (Wprowadzenie, Konfiguracja)  
- **Tygodnie 3-4**: Moduły 3-4 (Wdrożenie, Walidacja przedwdrożeniowa)  
- **Tygodnie 5-6**: Moduły 5-6 (Rozwiązywanie problemów, Tematy zaawansowane)  
- **Tygodnie 7-8**: Projekty praktyczne i ocena końcowa  

### Nauka w trybie niestacjonarnym (16 tygodni)  
- **Tygodnie 1-4**: Moduł 1 (Wprowadzenie)  
- **Tygodnie 5-7**: Moduł 2 (Konfiguracja i środowiska)  
- **Tygodnie 8-10**: Moduł 3 (Wdrożenie i provisionowanie)  
- **Tygodnie 11-12**: Moduł 4 (Walidacja przed wdrożeniem)  
- **Tygodnie 13-14**: Moduł 5 (Rozwiązywanie problemów i debugowanie)  
- **Tygodnie 15-16**: Moduł 6 (Tematy zaawansowane i ocena)  

---

## Ramy śledzenia postępów i oceny  

### Lista kontrolna ukończenia rozdziałów  

Śledź swoje postępy w każdym rozdziale poprzez mierzalne cele:  

#### 📚 Rozdział 1: Podstawy i szybki start  
- [ ] **Instalacja zakończona**: AZD zainstalowane i zweryfikowane na platformie  
- [ ] **Pierwsze wdrożenie**: Sukces wdrożenia szablonu todo-nodejs-mongo  
- [ ] **Konfiguracja środowiska**: Skonfigurowane pierwsze zmienne środowiskowe  
- [ ] **Nawigacja po zasobach**: Przegląd zasobów w portalu Azure  
- [ ] **Opanowanie poleceń**: Komfortowe korzystanie z podstawowych poleceń AZD  

#### 🤖 Rozdział 2: Rozwój AI-first  
- [ ] **Wdrożenie szablonu AI**: Pomyslnie wdrożony azure-search-openai-demo  
- [ ] **Implementacja RAG**: Skonfigurowany indeks dokumentów i wyszukiwanie  
- [ ] **Konfiguracja modeli**: Ustawienie wielu modeli AI o różnych przeznaczeniach  
- [ ] **Monitorowanie AI**: Wdrożenie Application Insights do monitorowania AI  
- [ ] **Optymalizacja wydajności**: Dostosowanie wydajności aplikacji AI  

#### ⚙️ Rozdział 3: Konfiguracja i uwierzytelnianie  
- [ ] **Multi-środowiskowa konfiguracja**: Konfiguracja środowisk dev, staging i prod  
- [ ] **Implementacja bezpieczeństwa**: Uwierzytelnianie przy użyciu managed identity  
- [ ] **Zarządzanie sekretami**: Integracja Azure Key Vault dla danych wrażliwych  
- [ ] **Zarządzanie parametrami**: Tworzenie konfiguracji specyficznych dla środowiska  
- [ ] **Opanowanie uwierzytelniania**: Implementacja bezpiecznych wzorców dostępu  

#### 🏗️ Rozdział 4: Infrastruktura jako kod i wdrożenia  
- [ ] **Tworzenie własnych szablonów**: Budowa szablonu wielousługowej aplikacji  
- [ ] **Opanowanie Bicep**: Tworzenie modułowych, wielokrotnego użytku komponentów infra  
- [ ] **Automatyzacja wdrażania**: Implementacja hooków przed i po wdrożeniu  
- [ ] **Projektowanie architektury**: Wdrożenie złożonej architektury mikroserwisowej  
- [ ] **Optymalizacja szablonów**: Optymalizacja pod kątem wydajności i kosztów  

#### 🎯 Rozdział 5: Rozwiązania AI z wieloma agentami  
- [ ] **Wdrożenie rozwiązania retail**: Kompleksowy scenariusz wieloagentowy retail  
- [ ] **Dostosowanie agentów**: Modyfikacja zachowań agentów Customer i Inventory  
- [ ] **Skalowanie architektury**: Implementacja load balancing i autoskalowania  
- [ ] **Monitorowanie produkcyjne**: Kompleksowe monitorowanie i alertowanie  
- [ ] **Optymalizacja wydajności**: Zoptymalizowany system wieloagentowy  

#### 🔍 Rozdział 6: Walidacja i planowanie przed wdrożeniem  
- [ ] **Analiza pojemności**: Analiza wymagań zasobów aplikacji  
- [ ] **Optymalizacja SKU**: Wybór ekonomicznych poziomów usług  
- [ ] **Automatyzacja walidacji**: Wdrożenie skryptów kontroli przed wdrożeniem  
- [ ] **Planowanie kosztów**: Tworzenie szacunków i budżetów wdrożeniowych  
- [ ] **Ocena ryzyka**: Identyfikacja i łagodzenie ryzyk wdrożeniowych  

#### 🚨 Rozdział 7: Rozwiązywanie problemów i debugowanie  
- [ ] **Umiejętności diagnostyczne**: Skuteczne debugowanie celowo uszkodzonych wdrożeń  
- [ ] **Analiza logów**: Efektywne wykorzystanie Azure Monitor i Application Insights  
- [ ] **Optymalizacja wydajności**: Poprawa wolno działających aplikacji  
- [ ] **Procedury odzyskiwania**: Implementacja backupów i odzyskiwania po awarii  
- [ ] **Konfiguracja monitoringu**: Tworzenie proaktywnego monitoringu i alertów  

#### 🏢 Rozdział 8: Wzorce produkcyjne i korporacyjne  
- [ ] **Bezpieczeństwo korporacyjne**: Wdrażanie kompleksowych wzorców bezpieczeństwa  
- [ ] **Ramowy system zarządzania**: Konfiguracja Azure Policy i zarządzania zasobami  
- [ ] **Zaawansowane monitorowanie**: Tworzenie paneli i automatyzacja alertów  
- [ ] **Integracja CI/CD**: Budowa zautomatyzowanych potoków wdrożeniowych  
- [ ] **Wdrożenie zgodności**: Spełnienie wymagań zgodności korporacyjnej  

### Harmonogram nauki i kamienie milowe  

#### Tydzień 1-2: Budowa fundamentów  
- **Kamień milowy**: Wdrożenie pierwszej aplikacji AI przy użyciu AZD  
- **Walidacja**: Działająca aplikacja dostępna pod publicznym URL  
- **Umiejętności**: Podstawowe przepływy pracy AZD i integracja usług AI  

#### Tydzień 3-4: Opanowanie konfiguracji  
- **Kamień milowy**: Wdrożenie wielośrodowiskowe z bezpiecznym uwierzytelnianiem  
- **Walidacja**: Ta sama aplikacja wdrożona na dev/staging/prod  
- **Umiejętności**: Zarządzanie środowiskami i implementacja zabezpieczeń  

#### Tydzień 5-6: Ekspertyza w infrastrukturze  
- **Kamień milowy**: Własny szablon dla złożonej aplikacji wielousługowej  
- **Walidacja**: Szablon wielokrotnego użycia wdrożony przez innego członka zespołu  
- **Umiejętności**: Opanowanie Bicep i automatyzacja infrastruktury  

#### Tydzień 7-8: Zaawansowana implementacja AI  
- **Kamień milowy**: Produkcyjnie gotowe rozwiązanie AI wieloagentowego  
- **Walidacja**: System radzący sobie z obciążeniem rzeczywistym z monitoringiem  
- **Umiejętności**: Orkiestracja agentów i optymalizacja wydajności  

#### Tydzień 9-10: Gotowość produkcyjna  
- **Kamień milowy**: Wdrożenie klasy korporacyjnej z pełną zgodnością  
- **Walidacja**: Pozytywna weryfikacja bezpieczeństwa i audyt optymalizacji kosztów  
- **Umiejętności**: Zarządzanie, monitoring i integracja CI/CD  

### Ocena i certyfikacja  

#### Metody weryfikacji wiedzy  
1. **Praktyczne wdrożenia**: Działające aplikacje w każdym rozdziale  
2. **Przeglądy kodu**: Ocena jakości szablonów i konfiguracji  
3. **Rozwiązywanie problemów**: Scenariusze i rozwiązania problematyczne  
4. **Nauczanie rówieśników**: Wyjaśnianie koncepcji innym uczącym się  
5. **Wkład w społeczność**: Dzielenie się szablonami lub ulepszeniami  

#### Efekty rozwoju zawodowego
- **Projekty w portfolio**: 8 wdrożeń gotowych do produkcji  
- **Umiejętności techniczne**: Ekspertyza w standardzie branżowym AZD i wdrożeniach AI  
- **Zdolności rozwiązywania problemów**: Samodzielne rozwiązywanie problemów i optymalizacja  
- **Uznanie społeczności**: Aktywny udział w społeczności deweloperów Azure  
- **Rozwój kariery**: Umiejętności bezpośrednio przydatne w rolach chmurowych i AI  

#### Metryki sukcesu  
- **Wskaźnik sukcesu wdrożeń**: >95% udanych wdrożeń  
- **Czas rozwiązywania problemów**: <30 minut dla typowych problemów  
- **Optymalizacja wydajności**: Wymierne poprawy kosztów i wydajności  
- **Zgodność z bezpieczeństwem**: Wszystkie wdrożenia spełniają standardy bezpieczeństwa przedsiębiorstwa  
- **Transfer wiedzy**: Umiejętność mentorskiego wsparcia innych deweloperów  

### Ciągłe uczenie się i zaangażowanie społeczności  

#### Bądź na bieżąco  
- **Aktualizacje Azure**: Śledź notatki do wydań Azure Developer CLI  
- **Wydarzenia społeczności**: Uczestnicz w wydarzeniach dla deweloperów Azure i AI  
- **Dokumentacja**: Współtwórz dokumentację i przykłady dla społeczności  
- **Pętla informacji zwrotnej**: Przekazuj opinie na temat treści kursu i usług Azure  

#### Rozwój kariery  
- **Sieć zawodowa**: Nawiąż kontakty z ekspertami Azure i AI  
- **Możliwości wystąpień**: Prezentuj zdobytą wiedzę na konferencjach lub spotkaniach  
- **Wkład w open source**: Wspieraj szablony i narzędzia AZD  
- **Mentoring**: Wspieraj innych deweloperów w ich nauce AZD  

---

**Nawigacja po rozdziale:**  
- **📚 Strona kursu**: [AZD For Beginners](../README.md)  
- **📖 Rozpocznij naukę**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Śledzenie postępów**: Monitoruj swój rozwój w ramach kompleksowego, 8-rozdziałowego systemu nauki  
- **🤝 Społeczność**: [Azure Discord](https://discord.gg/microsoft-azure) dla wsparcia i dyskusji  

**Śledzenie postępów nauki:** Skorzystaj z tego uporządkowanego przewodnika, aby opanować Azure Developer CLI poprzez stopniową, praktyczną naukę z mierzalnymi rezultatami i korzyściami rozwoju zawodowego.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Dokument ten został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, należy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uważany za źródło wiarygodne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->