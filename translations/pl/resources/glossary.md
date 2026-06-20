# Słownik - Terminologia Azure i AZD

**Odniesienie do wszystkich rozdziałów**  
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)  
- **📖 Nauka podstaw**: [Rozdział 1: Podstawy AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Terminy AI**: [Rozdział 2: Rozwój AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## Wprowadzenie

Ten obszerny słownik zawiera definicje terminów, pojęć i skrótów używanych w Azure Developer CLI oraz w rozwoju chmurowym Azure. Niezbędne odniesienie do zrozumienia dokumentacji technicznej, rozwiązywania problemów oraz skutecznej komunikacji na temat projektów azd i usług Azure.

## Cele nauki

Korzystając z tego słownika, będziesz:  
- Rozumieć podstawową terminologię i pojęcia Azure Developer CLI  
- Opanować słownictwo rozwoju chmurowego Azure i terminy techniczne  
- Efektywnie odnajdywać terminologię Infrastructure as Code i wdrażania  
- Pojmować nazwy usług Azure, skróty i ich zastosowania  
- Mieć dostęp do definicji terminów używanych w rozwiązywaniu problemów i debugowaniu  
- Poznać zaawansowane koncepcje architektury i rozwoju Azure  

## Wyniki nauki

Regularne korzystanie z tego słownika umożliwi Ci:  
- Skuteczną komunikację z użyciem poprawnej terminologii Azure Developer CLI  
- Lepsze zrozumienie dokumentacji technicznej i komunikatów o błędach  
- Pewną nawigację po usługach i pojęciach Azure  
- Rozwiązywanie problemów z wykorzystaniem odpowiedniego słownictwa technicznego  
- Wnoszenie do dyskusji zespołowych precyzyjnego języka technicznego  
- Systematyczne poszerzanie wiedzy o rozwoju chmurowym Azure  

## A

**ARM Template**  
Szablon Azure Resource Manager. Format Infrastructure as Code oparty na JSON, używany do deklaratywnego definiowania i wdrażania zasobów Azure.

**App Service**  
Usługa platformy jako usługi (PaaS) Azure do hostowania aplikacji internetowych, REST API i backendów mobilnych bez zarządzania infrastrukturą.

**Application Insights**  
Usługa monitorowania wydajności aplikacji (APM) Azure, dostarczająca głębokie informacje o wydajności aplikacji, dostępności i użytkowaniu.

**Azure CLI**  
Interfejs wiersza poleceń do zarządzania zasobami Azure. Używany przez azd do uwierzytelniania i niektórych operacji.

**Azure Developer CLI (azd)**  
Narzędzie koncentrujące się na programistach, które przyspiesza proces tworzenia i wdrażania aplikacji na Azure za pomocą szablonów i Infrastructure as Code.

**azure.yaml**  
Główny plik konfiguracyjny projektu azd definiujący usługi, infrastrukturę i haczyki wdrożeniowe.

**Azure Resource Manager (ARM)**  
Usługa wdrażania i zarządzania Azure zapewniająca warstwę zarządzania do tworzenia, aktualizowania i usuwania zasobów.

## B

**Bicep**  
Swoisty język domenowy (DSL) opracowany przez Microsoft do wdrażania zasobów Azure. Oferuje prostszą składnię niż szablony ARM, jednocześnie kompilując się do ARM.

**Build**  
Proces kompilacji kodu źródłowego, instalowania zależności i przygotowywania aplikacji do wdrożenia.

**Blue-Green Deployment**  
Strategia wdrożenia wykorzystująca dwa identyczne środowiska produkcyjne (niebieskie i zielone) w celu minimalizacji przestojów i ryzyka.

## C

**Container Apps**  
Bezserwerowa usługa kontenerowa Azure umożliwiająca uruchamianie aplikacji konteneryzowanych bez zarządzania złożoną infrastrukturą.

**CI/CD**  
Ciągła integracja/Ciągłe dostarczanie. Zautomatyzowane praktyki integracji zmian w kodzie i wdrażania aplikacji.

**Cosmos DB**  
Globalnie dystrybuowana, wielomodelowa usługa bazodanowa Azure zapewniająca kompleksowe SLA dotyczące przepustowości, opóźnień, dostępności i spójności.

**Configuration**  
Ustawienia i parametry kontrolujące zachowanie aplikacji i opcje wdrożeniowe.

## D

**Deployment**  
Proces instalacji i konfigurowania aplikacji oraz ich zależności na docelowej infrastrukturze.

**Docker**  
Platforma do tworzenia, dystrybuowania i uruchamiania aplikacji za pomocą technologii konteneryzacji.

**Dockerfile**  
Plik tekstowy zawierający instrukcje do budowania obrazu kontenera Docker.

## E

**Environment**  
Cel wdrożenia reprezentujący konkretną instancję Twojej aplikacji (np. development, staging, produkcja).

**Environment Variables**  
Wartości konfiguracyjne przechowywane jako pary klucz-wartość, do których aplikacje mogą mieć dostęp w czasie działania.

**Endpoint**  
URL lub adres sieciowy, pod którym można uzyskać dostęp do aplikacji lub usługi.

## F

**Function App**  
Bezserwerowa usługa obliczeniowa Azure umożliwiająca uruchamianie kodu zdarzeniowego bez zarządzania infrastrukturą.

## G

**GitHub Actions**  
Platforma CI/CD zintegrowana z repozytoriami GitHub do automatyzacji przepływów pracy.

**Git**  
Rozproszony system kontroli wersji używany do śledzenia zmian w kodzie źródłowym.

## H

**Hooks**  
Własne skrypty lub polecenia uruchamiane w określonych punktach cyklu życia wdrożenia (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ usługi Azure, na którym aplikacja zostanie wdrożona (np. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktyka definiowania i zarządzania infrastrukturą za pomocą kodu zamiast ręcznych procesów.

**Init**  
Proces inicjalizacji nowego projektu azd, zazwyczaj na podstawie szablonu.

## J

**JSON**  
JavaScript Object Notation. Format wymiany danych często używany w plikach konfiguracyjnych i odpowiedziach API.

**JWT**  
JSON Web Token. Standard bezpiecznego przesyłania informacji między stronami jako obiekt JSON.

## K

**Key Vault**  
Usługa Azure do bezpiecznego przechowywania i zarządzania sekretami, kluczami i certyfikatami.

**Kusto Query Language (KQL)**  
Język zapytań używany do analizy danych w Azure Monitor, Application Insights i innych usługach Azure.

## L

**Load Balancer**  
Usługa rozdzielająca przychodzący ruch sieciowy między wiele serwerów lub instancji.

**Log Analytics**  
Usługa Azure do zbierania, analizowania i reagowania na dane telemetryczne ze środowisk chmurowych i lokalnych.

## M

**Managed Identity**  
Funkcja Azure zapewniająca usługom Azure automatycznie zarządzaną tożsamość do uwierzytelniania w innych usługach Azure.

**Microservices**  
Podejście architektoniczne, w którym aplikacje są budowane jako zbiór małych, niezależnych usług.

**Monitor**  
Zunifikowane rozwiązanie monitorujące Azure zapewniające pełną widoczność aplikacji i infrastruktury.

## N

**Node.js**  
Środowisko wykonawcze JavaScript oparte na silniku V8 Chrome do tworzenia aplikacji po stronie serwera.

**npm**  
Menedżer pakietów dla Node.js zarządzający zależnościami i pakietami.

## O

**Output**  
Wartości zwracane z wdrożenia infrastruktury, które mogą być używane przez aplikacje lub inne zasoby.

## P

**Package**  
Proces przygotowywania kodu aplikacji i zależności do wdrożenia.

**Parameters**  
Wartości wejściowe przekazywane do szablonów infrastruktury w celu dostosowania wdrożeń.

**PostgreSQL**  
Otwarta relacyjna baza danych wspierana jako zarządzana usługa w Azure.

**Provisioning**  
Proces tworzenia i konfigurowania zasobów Azure zdefiniowanych w szablonach infrastruktury.

## Q

**Quota**  
Ograniczenia ilości zasobów, które można utworzyć w subskrypcji lub regionie Azure.

## R

**Resource Group**  
Logiczny kontener dla zasobów Azure, które dzielą ten sam cykl życia, uprawnienia i polityki.

**Resource Token**  
Unikalny ciąg generowany przez azd, który zapewnia unikalność nazw zasobów w wdrożeniach.

**REST API**  
Styl architektoniczny projektowania aplikacji sieciowych wykorzystujących metody HTTP.

**Rollback**  
Proces przywracania poprzedniej wersji aplikacji lub konfiguracji infrastruktury.

## S

**Service**  
Komponent Twojej aplikacji zdefiniowany w azure.yaml (np. front-end web, backend API, baza danych).

**SKU**  
Jednostka magazynowania. Reprezentuje różne poziomy usług lub wydajności zasobów Azure.

**SQL Database**  
Zarządzana relacyjna usługa bazodanowa Azure oparta na Microsoft SQL Server.

**Static Web Apps**  
Usługa Azure do tworzenia i wdrażania pełnych aplikacji internetowych ze źródeł w repozytoriach kodu.

**Storage Account**  
Usługa Azure zapewniająca pamięć masową w chmurze dla obiektów takich jak bloby, pliki, kolejki i tabele.

**Subscription**  
Konto Azure zawierające grupy zasobów i zasoby, z powiązanym rozliczaniem i zarządzaniem dostępem.

## T

**Template**  
Wstępnie zbudowana struktura projektu zawierająca kod aplikacji, definicje infrastruktury i konfigurację do typowych scenariuszy.

**Terraform**  
Oprogramowanie open-source do Infrastructure as Code obsługujące wielu dostawców chmury, w tym Azure.

**Traffic Manager**  
DNS-owy load balancer Azure do dystrybucji ruchu pomiędzy globalne regiony Azure.

## U

**URI**  
Uniform Resource Identifier. Łańcuch znaków identyfikujący konkretny zasób.

**URL**  
Uniform Resource Locator. Typ URI określający, gdzie zasób jest zlokalizowany i jak go pobrać.

## V

**Virtual Network (VNet)**  
Podstawowy element budulcowy prywatnych sieci w Azure, zapewniający izolację i segmentację.

**VS Code**  
Visual Studio Code. Popularny edytor kodu z doskonałą integracją z Azure i azd.

## W

**Webhook**  
Wywołanie HTTP wyzwalane przez określone zdarzenia, często używane w pipeline CI/CD.

**What-if**  
Funkcja Azure pokazująca, jakie zmiany zostałyby wprowadzone przez wdrożenie bez jego faktycznego wykonania.

## Y

**YAML**  
YAML Ain't Markup Language. Standard serializacji danych czytelny dla ludzi, używany w plikach konfiguracyjnych jak azure.yaml.

## Z

**Zone**  
Fizycznie odrębne lokalizacje w regionie Azure zapewniające redundancję i wysoką dostępność.

---

## Popularne skróty

| Skrót | Pełna nazwa | Opis |
|---------|-----------|-------------|
| AAD | Azure Active Directory (obecnie Microsoft Entra ID) | Usługa zarządzania tożsamością i dostępem |
| ACR | Azure Container Registry | Usługa rejestru obrazów kontenerów |
| AKS | Azure Kubernetes Service | Zarządzana usługa Kubernetes |
| API | Application Programming Interface | Zestaw protokołów do budowy oprogramowania |
| ARM | Azure Resource Manager | Usługa wdrażania i zarządzania Azure |
| CDN | Content Delivery Network | Rozproszona sieć serwerów |
| CI/CD | Continuous Integration/Continuous Deployment | Zautomatyzowane praktyki rozwoju |
| CLI | Command Line Interface | Interfejs tekstowy |
| DNS | Domain Name System | System tłumaczenia nazw domen na adresy IP |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpieczna wersja protokołu HTTP |
| IaC | Infrastructure as Code | Zarządzanie infrastrukturą przez kod |
| JSON | JavaScript Object Notation | Format wymiany danych |
| JWT | JSON Web Token | Format tokenu do bezpiecznej transmisji informacji |
| KQL | Kusto Query Language | Język zapytań do usług danych Azure |
| RBAC | Role-Based Access Control | Kontrola dostępu oparta na rolach użytkowników |
| REST | Representational State Transfer | Styl architektoniczny usług sieciowych |
| SDK | Software Development Kit | Zbiór narzędzi programistycznych |
| SLA | Service Level Agreement | Umowa dotycząca dostępności/wydajności usługi |
| SQL | Structured Query Language | Język zarządzania relacyjnymi bazami danych |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokoły kryptograficzne |
| URI | Uniform Resource Identifier | Łańcuch identyfikujący zasób |
| URL | Uniform Resource Locator | Typ URI określający lokalizację zasobu |
| VM | Virtual Machine | Emulacja systemu komputerowego |
| VNet | Virtual Network | Prywatna sieć w Azure |
| YAML | YAML Ain't Markup Language | Standard serializacji danych |

---

## Mapowania nazw usług Azure

| Popularna nazwa | Oficjalna nazwa usługi Azure | Typ hosta azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Terminy specyficzne dla kontekstu

### Terminy rozwojowe  
- **Hot Reload**: Automatyczna aktualizacja aplikacji podczas rozwoju bez restartu  
- **Build Pipeline**: Zautomatyzowany proces budowania i testowania kodu  
- **Deployment Slot**: Środowisko etapowe w ramach App Service  
- **Environment Parity**: Utrzymywanie podobieństwa środowisk development, staging i produkcyjnego  

### Terminy bezpieczeństwa  
- **Managed Identity**: Funkcja Azure zapewniająca automatyczne zarządzanie poświadczeniami  
- **Key Vault**: Bezpieczne przechowywanie sekretów, kluczy i certyfikatów  
- **RBAC**: Kontrola dostępu oparta na rolach dla zasobów Azure  
- **Network Security Group**: Wirtualna zapora kontrolująca ruch sieciowy  

### Terminy monitoringu  
- **Telemetry**: Automatyczne zbieranie pomiarów i danych  
- **Application Performance Monitoring (APM)**: Monitorowanie wydajności oprogramowania  
- **Log Analytics**: Usługa zbierania i analizowania danych z logów  
- **Alert Rules**: Zautomatyzowane powiadomienia oparte na metrykach lub warunkach  

### Terminy wdrożeniowe  
- **Blue-Green Deployment**: Strategia wdrożenia bez przestojów  
- **Canary Deployment**: Stopniowe udostępnianie użytkownikom wybranej grupy  
- **Rolling Update**: Sekwencyjna wymiana instancji aplikacji  
- **Rollback**: Cofanie do poprzedniej wersji aplikacji  

---

**Wskazówka**: Użyj `Ctrl+F`, aby szybko wyszukać konkretne terminy w tym słowniku. Terminy są ze sobą powiązane, gdzie to możliwe.

---

**Nawigacja**  
- **Poprzednia lekcja**: [Cheat Sheet](cheat-sheet.md)  
- **Następna lekcja**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->