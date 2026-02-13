# Słownik - Terminologia Azure i AZD

**Odniesienie do wszystkich rozdziałów**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Podstawy**: [Rozdział 1: Podstawy AZD](../docs/getting-started/azd-basics.md)
- **🤖 Terminy AI**: [Rozdział 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Wprowadzenie

Ten kompleksowy słownik dostarcza definicji terminów, pojęć i akronimów używanych w Azure Developer CLI oraz w rozwoju chmurowym Azure. Niezbędne odniesienie do zrozumienia dokumentacji technicznej, rozwiązywania problemów oraz efektywnej komunikacji na temat projektów azd i usług Azure.

## Cele nauki

Korzystając z tego słownika, będziesz:
- Rozumieć podstawową terminologię i pojęcia Azure Developer CLI
- Opanować słownictwo i terminy techniczne rozwoju w chmurze Azure
- Efektywnie odwoływać się do terminologii Infrastructure as Code i wdrożeń
- Pojmować nazwy usług Azure, akronimy i ich zastosowania
- Mieć dostęp do definicji pomocnych przy rozwiązywaniu problemów i debugowaniu
- Poznawać zaawansowane koncepcje architektury i rozwoju Azure

## Efekty uczenia się

Regularnie korzystając z tego słownika, będziesz w stanie:
- Skutecznie komunikować się, używając właściwej terminologii Azure Developer CLI
- Lepsze rozumienie dokumentacji technicznej i komunikatów błędów
- Pewnie poruszać się w usługach i koncepcjach Azure
- Rozwiązywać problemy, stosując odpowiednie słownictwo techniczne
- Wnosić wkład w dyskusje zespołowe, posługując się dokładnym językiem technicznym
- Systematycznie poszerzać wiedzę o rozwoju chmurowym Azure

## A

**ARM Template**  
Szablon Azure Resource Manager. Format Infrastructure as Code oparty na JSON służący do deklaratywnego definiowania i wdrażania zasobów Azure.

**App Service**  
Platforma jako usługa (PaaS) Azure do hostowania aplikacji webowych, REST API i backendów mobilnych bez zarządzania infrastrukturą.

**Application Insights**  
Usługa monitorowania wydajności aplikacji Azure (APM), oferująca wgląd w wydajność, dostępność i wykorzystanie aplikacji.

**Azure CLI**  
Interfejs wiersza poleceń do zarządzania zasobami Azure. Używany przez azd do uwierzytelniania i niektórych operacji.

**Azure Developer CLI (azd)**  
Narzędzie wiersza poleceń skoncentrowane na developerach, które przyspiesza proces budowania i wdrażania aplikacji do Azure za pomocą szablonów i Infrastructure as Code.

**azure.yaml**  
Główny plik konfiguracyjny projektu azd, definiujący usługi, infrastrukturę oraz haki wdrożeniowe.

**Azure Resource Manager (ARM)**  
Usługa wdrażania i zarządzania Azure zapewniająca warstwę zarządzania do tworzenia, aktualizowania i usuwania zasobów.

## B

**Bicep**  
Specjalistyczny język dziedzinowy (DSL) opracowany przez Microsoft do wdrażania zasobów Azure. Oferuje prostszą składnię niż szablony ARM, kompilując się do ARM.

**Build**  
Proces kompilacji kodu źródłowego, instalacji zależności oraz przygotowywania aplikacji do wdrożenia.

**Blue-Green Deployment**  
Strategia wdrażania wykorzystująca dwa identyczne środowiska produkcyjne (niebieskie i zielone) w celu minimalizacji przestojów i ryzyka.

## C

**Container Apps**  
Serwerless’owa usługa kontenerowa Azure umożliwiająca uruchamianie aplikacji konteneryzowanych bez zarządzania złożoną infrastrukturą.

**CI/CD**  
Continuous Integration/Continuous Deployment. Zautomatyzowane praktyki integracji zmian kodu i wdrażania aplikacji.

**Cosmos DB**  
Globalnie rozproszona, wielomodelowa usługa bazodanowa Azure zapewniająca kompleksowe SLA dotyczące przepustowości, opóźnień, dostępności i spójności.

**Configuration**  
Ustawienia i parametry kontrolujące zachowanie aplikacji i opcje wdrożeniowe.

## D

**Deployment**  
Proces instalowania i konfiguracji aplikacji oraz ich zależności na docelowej infrastrukturze.

**Docker**  
Platforma do tworzenia, dystrybucji i uruchamiania aplikacji za pomocą technologii konteneryzacji.

**Dockerfile**  
Plik tekstowy zawierający instrukcje budowy obrazu kontenera Docker.

## E

**Environment**  
Cel wdrożenia reprezentujący konkretną instancję aplikacji (np. development, staging, production).

**Environment Variables**  
Wartości konfiguracyjne przechowywane jako pary klucz-wartość, do których aplikacje mają dostęp w czasie działania.

**Endpoint**  
URL lub adres sieciowy, pod którym można uzyskać dostęp do aplikacji lub usługi.

## F

**Function App**  
Serwerless’owa usługa obliczeniowa Azure umożliwiająca uruchamianie kodu wywoływanego zdarzeniami bez zarządzania infrastrukturą.

## G

**GitHub Actions**  
Platforma CI/CD zintegrowana z repozytoriami GitHub do automatyzacji przepływów pracy.

**Git**  
Rozproszony system kontroli wersji służący do śledzenia zmian w kodzie źródłowym.

## H

**Hooks**  
Własne skrypty lub polecenia uruchamiane w określonych punktach cyklu życia wdrożenia (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ usługi Azure, na której zostanie wdrożona aplikacja (np. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktyka definiowania i zarządzania infrastrukturą za pomocą kodu, a nie procesów manualnych.

**Init**  
Proces inicjalizacji nowego projektu azd, zwykle na podstawie szablonu.

## J

**JSON**  
JavaScript Object Notation. Format wymiany danych powszechnie używany do plików konfiguracyjnych i odpowiedzi API.

**JWT**  
JSON Web Token. Standard bezpiecznego przesyłania informacji między stronami jako obiekt JSON.

## K

**Key Vault**  
Usługa Azure do bezpiecznego przechowywania i zarządzania sekretami, kluczami i certyfikatami.

**Kusto Query Language (KQL)**  
Język zapytań używany do analizy danych w Azure Monitor, Application Insights i innych usługach Azure.

## L

**Load Balancer**  
Usługa rozdzielająca ruch sieciowy przychodzący między wieloma serwerami lub instancjami.

**Log Analytics**  
Usługa Azure do zbierania, analizowania i reagowania na dane telemetryczne z chmurowych i lokalnych środowisk.

## M

**Managed Identity**  
Funkcja Azure zapewniająca usługom Azure automatycznie zarządzaną tożsamość do uwierzytelniania z innymi usługami Azure.

**Microservices**  
Podejście architektoniczne, w którym aplikacje są budowane jako zbiór małych, niezależnych usług.

**Monitor**  
Zunifikowane rozwiązanie monitorujące Azure zapewniające pełną widoczność stosu aplikacji i infrastruktury.

## N

**Node.js**  
Środowisko uruchomieniowe JavaScript oparte na silniku V8 Chrome do budowy aplikacji po stronie serwera.

**npm**  
Menedżer pakietów dla Node.js, zarządzający zależnościami i pakietami.

## O

**Output**  
Wartości zwracane z wdrożenia infrastruktury, które mogą być wykorzystywane przez aplikacje lub inne zasoby.

## P

**Package**  
Proces przygotowywania kodu aplikacji i zależności do wdrożenia.

**Parameters**  
Wartości wejściowe przekazywane do szablonów infrastruktury w celu dostosowania wdrożeń.

**PostgreSQL**  
Open source’owy system relacyjnej bazy danych wspierany jako usługa zarządzana w Azure.

**Provisioning**  
Proces tworzenia i konfigurowania zasobów Azure określonych w szablonach infrastruktury.

## Q

**Quota**  
Limity dotyczące ilości zasobów, które można utworzyć w subskrypcji lub regionie Azure.

## R

**Resource Group**  
Logiczny kontener dla zasobów Azure, które dzielą ten sam cykl życia, uprawnienia i zasady.

**Resource Token**  
Unikalny ciąg generowany przez azd zapewniający unikalność nazw zasobów w trakcie wdrożeń.

**REST API**  
Styl architektoniczny projektowania aplikacji sieciowych wykorzystujących metody HTTP.

**Rollback**  
Proces przywracania poprzedniej wersji aplikacji lub konfiguracji infrastruktury.

## S

**Service**  
Komponent twojej aplikacji zdefiniowany w azure.yaml (np. web frontend, API backend, baza danych).

**SKU**  
Stock Keeping Unit. Reprezentuje różne poziomy usług lub wydajności zasobów Azure.

**SQL Database**  
Zarządzana usługa relacyjnej bazy danych Azure oparta na Microsoft SQL Server.

**Static Web Apps**  
Usługa Azure do tworzenia i wdrażania pełnych aplikacji webowych ze źródeł kodu w repozytoriach.

**Storage Account**  
Usługa Azure zapewniająca chmurową przestrzeń dyskową dla obiektów danych, takich jak bloby, pliki, kolejki i tabele.

**Subscription**  
Kontener konta Azure zawierający grupy zasobów i zasoby, z powiązanym rozliczaniem i zarządzaniem dostępem.

## T

**Template**  
Wstępnie zbudowana struktura projektu zawierająca kod aplikacji, definicje infrastruktury i konfigurację dla typowych scenariuszy.

**Terraform**  
Open source’owe narzędzie Infrastructure as Code wspierające wielu dostawców chmury, w tym Azure.

**Traffic Manager**  
DNS-owy load balancer Azure do rozdzielania ruchu między globalne regiony Azure.

## U

**URI**  
Uniform Resource Identifier. Ciąg identyfikujący konkretny zasób.

**URL**  
Uniform Resource Locator. Typ URI określający, gdzie zasób jest zlokalizowany i jak go pobrać.

## V

**Virtual Network (VNet)**  
Podstawowy element prywatnych sieci w Azure, zapewniający izolację i segmentację.

**VS Code**  
Visual Studio Code. Popularny edytor kodu z doskonałą integracją z Azure i azd.

## W

**Webhook**  
Wywołanie HTTP wyzwalane przez określone zdarzenia, powszechnie używane w pipeline’ach CI/CD.

**What-if**  
Funkcja Azure pokazująca, jakie zmiany zostałyby wprowadzone przez wdrożenie bez faktycznego jego wykonania.

## Y

**YAML**  
YAML Ain't Markup Language. Standard serializacji danych czytelny dla człowieka, używany do plików konfiguracyjnych jak azure.yaml.

## Z

**Zone**  
Fizycznie oddzielone lokalizacje w regionie Azure zapewniające redundancję i wysoką dostępność.

---

## Powszechne akronimy

| Akronim | Pełna nazwa | Opis |
|---------|--------------|-------|
| AAD | Azure Active Directory | Usługa zarządzania tożsamością i dostępem |
| ACR | Azure Container Registry | Rejestr obrazów kontenerów |
| AKS | Azure Kubernetes Service | Zarządzana usługa Kubernetes |
| API | Application Programming Interface | Zestaw protokołów budowy oprogramowania |
| ARM | Azure Resource Manager | Usługa wdrażania i zarządzania Azure |
| CDN | Content Delivery Network | Rozproszona sieć serwerów |
| CI/CD | Continuous Integration/Continuous Deployment | Zautomatyzowane praktyki rozwoju |
| CLI | Command Line Interface | Tekstowy interfejs użytkownika |
| DNS | Domain Name System | System tłumaczenia nazw domen na adresy IP |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpieczna wersja HTTP |
| IaC | Infrastructure as Code | Zarządzanie infrastrukturą przez kod |
| JSON | JavaScript Object Notation | Format wymiany danych |
| JWT | JSON Web Token | Format tokena do bezpiecznego przesyłania informacji |
| KQL | Kusto Query Language | Język zapytań do usług danych Azure |
| RBAC | Role-Based Access Control | Metoda kontroli dostępu oparta na rolach |
| REST | Representational State Transfer | Styl architektury usług sieciowych |
| SDK | Software Development Kit | Zestaw narzędzi programistycznych |
| SLA | Service Level Agreement | Zobowiązanie dotyczące dostępności/wydajności |
| SQL | Structured Query Language | Język zarządzania relacyjnymi bazami danych |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokoły kryptograficzne |
| URI | Uniform Resource Identifier | Ciąg identyfikujący zasób |
| URL | Uniform Resource Locator | Typ URI określający lokalizację zasobu |
| VM | Virtual Machine | Emulacja systemu komputerowego |
| VNet | Virtual Network | Prywatna sieć w Azure |
| YAML | YAML Ain't Markup Language | Standard serializacji danych |

---

## Mapowanie nazw usług Azure

| Nazwa potoczna | Oficjalna nazwa usługi Azure | Typ hosta azd |
|----------------|-------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Terminy specyficzne dla kontekstu

### Terminy rozwojowe
- **Hot Reload**: Automatyczna aktualizacja aplikacji podczas rozwoju bez restartu
- **Build Pipeline**: Zautomatyzowany proces budowania i testowania kodu
- **Deployment Slot**: Środowisko staging w ramach App Service
- **Environment Parity**: Zachowanie podobieństwa środowisk development, staging i produkcji

### Terminy bezpieczeństwa
- **Managed Identity**: Funkcja Azure zapewniająca automatyczne zarządzanie poświadczeniami
- **Key Vault**: Bezpieczne przechowywanie sekretów, kluczy i certyfikatów
- **RBAC**: Kontrola dostępu oparta na rolach do zasobów Azure
- **Network Security Group**: Wirtualna zapora sieciowa kontrolująca ruch sieciowy

### Terminy monitorowania
- **Telemetry**: Automatyczny zbiór pomiarów i danych
- **Application Performance Monitoring (APM)**: Monitorowanie wydajności oprogramowania
- **Log Analytics**: Usługa zbierająca i analizująca dane logów
- **Alert Rules**: Automatyczne powiadomienia oparte na metrykach lub warunkach

### Terminy wdrożeniowe
- **Blue-Green Deployment**: Strategia wdrożenia bez przestojów
- **Canary Deployment**: Stopniowe wprowadzanie nowej wersji do wybranej grupy użytkowników
- **Rolling Update**: Sequentcjalna wymiana instancji aplikacji
- **Rollback**: Przywracanie poprzedniej wersji aplikacji

---

**Wskazówka użytkowania**: Użyj `Ctrl+F`, aby szybko wyszukać konkretne terminy w tym słowniku. Terminy są wzajemnie powiązane, gdzie to możliwe.

---

**Nawigacja**
- **Poprzednia lekcja**: [Cheat Sheet](cheat-sheet.md)
- **Następna lekcja**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego ojczystym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->