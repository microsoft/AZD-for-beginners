<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:44:50+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "pl"
}
-->
# Przewodnik nauki - AZD dla początkujących

## Wprowadzenie

Ten kompleksowy przewodnik nauki oferuje uporządkowane cele edukacyjne, kluczowe pojęcia, ćwiczenia praktyczne oraz materiały oceniające, które pomogą Ci opanować Azure Developer CLI (azd). Użyj tego przewodnika, aby śledzić swoje postępy i upewnić się, że pokryłeś wszystkie istotne tematy.

## Cele nauki

Po ukończeniu tego przewodnika nauki będziesz:
- Opanowywać wszystkie podstawowe i zaawansowane koncepcje Azure Developer CLI
- Rozwijać praktyczne umiejętności w zakresie wdrażania i zarządzania aplikacjami Azure
- Budować pewność w rozwiązywaniu problemów i optymalizacji wdrożeń
- Rozumieć praktyki wdrożeń gotowych do produkcji oraz kwestie bezpieczeństwa

## Rezultaty nauki

Po ukończeniu wszystkich sekcji tego przewodnika będziesz w stanie:
- Projektować, wdrażać i zarządzać pełnymi architekturami aplikacji za pomocą azd
- Wdrażać kompleksowe strategie monitorowania, bezpieczeństwa i optymalizacji kosztów
- Samodzielnie rozwiązywać złożone problemy z wdrożeniami
- Tworzyć własne szablony i wnosić wkład do społeczności azd

## Struktura kursu

### Moduł 1: Pierwsze kroki (Tygodnie 1-2)

#### Cele nauki
- Zrozumieć podstawy i kluczowe koncepcje Azure Developer CLI
- Pomyślnie zainstalować i skonfigurować azd w swoim środowisku deweloperskim
- Wykonać pierwsze wdrożenie za pomocą istniejącego szablonu
- Poruszać się po strukturze projektu azd i rozumieć kluczowe komponenty

#### Kluczowe koncepcje do opanowania
- Szablony, środowiska i usługi
- Struktura konfiguracji azure.yaml
- Podstawowe polecenia azd (init, up, down, deploy)
- Zasady Infrastructure as Code
- Uwierzytelnianie i autoryzacja w Azure

#### Ćwiczenia praktyczne

**Ćwiczenie 1.1: Instalacja i konfiguracja**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Ćwiczenie 1.2: Pierwsze wdrożenie**  
```bash
# Deploy a simple web application:
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

#### Pytania do samooceny
1. Jakie są trzy kluczowe koncepcje architektury azd?
2. Jaki jest cel pliku azure.yaml?
3. Jak środowiska pomagają zarządzać różnymi celami wdrożeniowymi?
4. Jakie metody uwierzytelniania można używać z azd?
5. Co się dzieje, gdy po raz pierwszy uruchomisz `azd up`?

### Moduł 2: Konfiguracja i środowiska (Tydzień 3)

#### Cele nauki
- Opanować zarządzanie środowiskami i konfiguracją
- Zrozumieć zaawansowane konfiguracje azure.yaml
- Wdrażać ustawienia i zmienne specyficzne dla środowiska
- Konfigurować uwierzytelnianie dla różnych scenariuszy

#### Kluczowe koncepcje do opanowania
- Hierarchia środowisk i priorytet zmiennych
- Konfiguracja usług i parametry
- Hooki i zdarzenia cyklu życia
- Metody uwierzytelniania (użytkownik, principal usługi, zarządzana tożsamość)
- Zarządzanie plikami konfiguracyjnymi

#### Ćwiczenia praktyczne

**Ćwiczenie 2.1: Konfiguracja wielu środowisk**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pytania do samooceny
1. Jak azd obsługuje priorytet zmiennych środowiskowych?
2. Czym są hooki wdrożeniowe i kiedy należy ich używać?
3. Jak skonfigurować różne SKU dla różnych środowisk?
4. Jakie są implikacje bezpieczeństwa różnych metod uwierzytelniania?
5. Jak zarządzać tajnymi danymi i wrażliwą konfiguracją?

### Moduł 3: Wdrożenie i provisioning (Tydzień 4)

#### Cele nauki
- Opanować przepływy pracy wdrożeniowe i najlepsze praktyki
- Zrozumieć Infrastructure as Code za pomocą szablonów Bicep
- Wdrażać złożone architektury wielousługowe
- Optymalizować wydajność i niezawodność wdrożeń

#### Kluczowe koncepcje do opanowania
- Struktura szablonów Bicep i moduły
- Zależności zasobów i kolejność
- Strategie wdrożeniowe (blue-green, rolling updates)
- Wdrożenia wieloregionowe
- Migracje baz danych i zarządzanie danymi

#### Ćwiczenia praktyczne

**Ćwiczenie 3.1: Własna infrastruktura**  
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Ćwiczenie 3.3: Integracja bazy danych**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pytania do samooceny
1. Jakie są zalety używania Bicep zamiast szablonów ARM?
2. Jak obsługiwać migracje baz danych w wdrożeniach azd?
3. Jakie strategie istnieją dla wdrożeń bez przestojów?
4. Jak zarządzać zależnościami między usługami?
5. Jakie są kluczowe kwestie dotyczące wdrożeń wieloregionowych?

### Moduł 4: Walidacja przed wdrożeniem (Tydzień 5)

#### Cele nauki
- Wdrażać kompleksowe kontrole przed wdrożeniem
- Opanować planowanie pojemności i walidację zasobów
- Zrozumieć wybór SKU i optymalizację kosztów
- Budować zautomatyzowane pipeline'y walidacyjne

#### Kluczowe koncepcje do opanowania
- Limity i kwoty zasobów Azure
- Kryteria wyboru SKU i implikacje kosztowe
- Zautomatyzowane skrypty i narzędzia walidacyjne
- Metodologie planowania pojemności
- Testowanie wydajności i optymalizacja

#### Ćwiczenia praktyczne

**Ćwiczenie 4.1: Planowanie pojemności**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Ćwiczenie 4.2: Walidacja przed wdrożeniem**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Ćwiczenie 4.3: Optymalizacja SKU**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Pytania do samooceny
1. Jakie czynniki powinny wpływać na decyzje dotyczące wyboru SKU?
2. Jak walidować dostępność zasobów Azure przed wdrożeniem?
3. Jakie są kluczowe komponenty systemu kontroli przed wdrożeniem?
4. Jak oszacować i kontrolować koszty wdrożenia?
5. Jakie monitorowanie jest niezbędne dla planowania pojemności?

### Moduł 5: Rozwiązywanie problemów i debugowanie (Tydzień 6)

#### Cele nauki
- Opanować systematyczne metody rozwiązywania problemów
- Rozwinąć umiejętności debugowania złożonych problemów wdrożeniowych
- Wdrażać kompleksowe monitorowanie i alertowanie
- Budować procedury reagowania na incydenty i odzyskiwania

#### Kluczowe koncepcje do opanowania
- Wzorce typowych awarii wdrożeniowych
- Analiza logów i techniki korelacji
- Monitorowanie wydajności i optymalizacja
- Wykrywanie incydentów bezpieczeństwa i reakcja
- Odzyskiwanie po awarii i ciągłość działania

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

**Ćwiczenie 5.2: Implementacja monitorowania**  
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
2. Jak korelować logi między wieloma usługami i zasobami?
3. Jakie metryki monitorowania są najważniejsze dla wczesnego wykrywania problemów?
4. Jak wdrażać skuteczne procedury odzyskiwania po awarii?
5. Jakie są kluczowe komponenty planu reagowania na incydenty?

### Moduł 6: Zaawansowane tematy i najlepsze praktyki (Tygodnie 7-8)

#### Cele nauki
- Wdrażać wzorce wdrożeń na poziomie przedsiębiorstwa
- Opanować integrację i automatyzację CI/CD
- Tworzyć własne szablony i wnosić wkład do społeczności
- Zrozumieć zaawansowane wymagania dotyczące bezpieczeństwa i zgodności

#### Kluczowe koncepcje do opanowania
- Wzorce integracji pipeline'ów CI/CD
- Tworzenie i dystrybucja własnych szablonów
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

**Ćwiczenie 6.2: Tworzenie własnych szablonów**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Ćwiczenie 6.3: Implementacja na poziomie przedsiębiorstwa**  
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
2. Jakie są kluczowe kwestie dotyczące tworzenia własnych szablonów?
3. Jak wdrażać zarządzanie i zgodność w wdrożeniach azd?
4. Jakie są najlepsze praktyki dla wdrożeń na dużą skalę?
5. Jak skutecznie wnosić wkład do społeczności azd?

## Projekty praktyczne

### Projekt 1: Strona portfolio osobistego  
**Poziom trudności**: Początkujący  
**Czas trwania**: 1-2 tygodnie  

Zbuduj i wdroż stronę portfolio osobistego, używając:
- Hosting statycznej strony na Azure Storage
- Konfiguracja własnej domeny
- Integracja CDN dla globalnej wydajności
- Zautomatyzowany pipeline wdrożeniowy

**Rezultaty**:
- Działająca strona wdrożona na Azure
- Własny szablon azd dla wdrożeń portfolio
- Dokumentacja procesu wdrożeniowego
- Analiza kosztów i rekomendacje optymalizacyjne

### Projekt 2: Aplikacja do zarządzania zadaniami  
**Poziom trudności**: Średniozaawansowany  
**Czas trwania**: 2-3 tygodnie  

Stwórz aplikację full-stack do zarządzania zadaniami z:
- Frontend React wdrożony na App Service
- Backend API Node.js z uwierzytelnianiem
- Baza danych PostgreSQL z migracjami
- Monitorowanie za pomocą Application Insights

**Rezultaty**:
- Kompletną aplikację z uwierzytelnianiem użytkowników
- Schemat bazy danych i skrypty migracji
- Dashboardy monitorowania i reguły alertów
- Konfiguracja wdrożenia dla wielu środowisk

### Projekt 3: Platforma e-commerce oparta na mikroserwisach  
**Poziom trudności**: Zaawansowany  
**Czas trwania**: 4-6 tygodni  

Zaprojektuj i wdroż platformę e-commerce opartą na mikroserwisach:
- Wiele usług API (katalog, zamówienia, płatności, użytkownicy)
- Integracja kolejki wiadomości z Service Bus
- Redis cache dla optymalizacji wydajności
- Kompleksowe logowanie i monitorowanie

**Rezultaty**:
- Kompletną architekturę mikroserwisową
- Wzorce komunikacji między usługami
- Testowanie wydajności i optymalizacja
- Implementacja bezpieczeństwa gotowa do produkcji

## Ocena i certyfikacja

### Sprawdzanie wiedzy

Ukończ te oceny po każdym module:

**Ocena modułu 1**: Podstawowe koncepcje i instalacja  
- Pytania wielokrotnego wyboru dotyczące kluczowych koncepcji  
- Zadania praktyczne dotyczące instalacji i konfiguracji  
- Proste ćwiczenie wdrożeniowe  

**Ocena modułu 2**: Konfiguracja i środowiska  
- Scenariusze zarządzania środowiskami  
- Ćwiczenia rozwiązywania problemów z konfiguracją  
- Implementacja konfiguracji bezpieczeństwa  

**Ocena modułu 3**: Wdrożenie i provisioning  
- Wyzwania projektowe infrastruktury  
- Scenariusze wdrożenia wielousługowego  
- Ćwiczenia optymalizacji wydajności  

**Ocena modułu 4**: Walidacja przed wdrożeniem  
- Studia przypadków planowania pojemności  
- Scenariusze optymalizacji kosztów  
- Implementacja pipeline'u walidacyjnego  

**Ocena modułu 5**: Rozwiązywanie problemów i debugowanie  
- Ćwiczenia diagnozowania problemów  
- Zadania implementacji monitorowania  
- Symulacje reagowania na incydenty  

**Ocena modułu 6**: Zaawansowane tematy  
- Projektowanie pipeline'ów CI/CD  
- Tworzenie własnych szablonów  
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
- Kompletny zakres dokumentacji  
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
- **Tygodnie 1-2**: Moduły 1-2 (Pierwsze kroki, Konfiguracja)  
- **Tygodnie 3-4**: Moduły 3-4 (Wdrożenie, Walidacja przed wdrożeniem)  
- **Tygodnie 5-6**: Moduły 5-6 (Rozwiązywanie problemów, Zaawansowane tematy)  
- **Tygodnie 7-8**: Projekty praktyczne i ocena końcowa  

### Nauka w niepełnym wymiarze godzin (16 tygodni)
- **Tygodnie 1-4**: Moduł 1 (Pierwsze kroki)  
- **Tygodnie 5-7**: Moduł 2 (Konfiguracja i środowiska)  
- **Tygodnie 8-10**: Moduł 3 (Wdrożenie i provisioning)  
- **Tygodnie 11-12**: Moduł 4 (Walidacja przed wdrożeniem)  
- **Tygodnie 13-14
3. **Wspieraj Open Source**: Udostępniaj swoje szablony i rozwiązania społeczności
4. **Ucz innych**: Tłumaczenie pojęć innym wzmacnia Twoje własne zrozumienie
5. **Pozostań ciekawy**: Nieustannie odkrywaj nowe usługi Azure i wzorce integracji

---

**Nawigacja**
- **Poprzednia lekcja**: [FAQ](faq.md)
- **Następna lekcja**: [Changelog](../changelog.md)

**Śledzenie postępów nauki**: Skorzystaj z tego przewodnika, aby monitorować swoją ścieżkę nauki i zapewnić kompleksowe opanowanie wszystkich koncepcji i praktyk Azure Developer CLI.

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.