# Słownik - Terminologia Azure i AZD

**Odwołanie dla wszystkich rozdziałów**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Nauka podstaw**: [Rozdział 1: Podstawy AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Terminy AI**: [Rozdział 2: Rozwój z AI na pierwszym miejscu](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Ten obszerny słownik zawiera definicje terminów, pojęć i skrótów używanych w Azure Developer CLI oraz rozwoju chmury Azure. Niezbędne odwołanie do zrozumienia dokumentacji technicznej, rozwiązywania problemów i efektywnej komunikacji na temat projektów azd i usług Azure.

## Cele nauki

Korzystając z tego słownika, będziesz mógł:
- Zrozumieć niezbędną terminologię i pojęcia Azure Developer CLI
- Opanować słownictwo i terminy techniczne związane z rozwojem chmury Azure
- Efektywnie odwoływać się do terminologii związanej z Infrastrukturą jako Kodem i wdrażaniem
- Pojmować nazwy usług Azure, skróty i ich przeznaczenie
- Uzyskać definicje terminologii do rozwiązywania problemów i debugowania
- Poznać zaawansowane koncepcje architektury i rozwoju Azure

## Rezultaty nauki

Regularnie korzystając z tego słownika, będziesz:
- Komunikować się efektywnie, używając właściwej terminologii Azure Developer CLI
- Lepiej rozumieć dokumentację techniczną i komunikaty o błędach
- Z pewnością poruszać się po usługach i koncepcjach Azure
- Rozwiązywać problemy, używając odpowiedniego żargonu technicznego
- Wnosić dokładny język techniczny do dyskusji zespołowych
- Systematycznie poszerzać wiedzę na temat rozwoju chmury Azure

## A

**Szablon ARM**  
Szablon Azure Resource Manager. Format Infrastructure as Code oparty na JSON, używany do deklaratywnego definiowania i wdrażania zasobów Azure.

**App Service**  
Platforma jako usługa (PaaS) Azure do hostowania aplikacji internetowych, REST API i backendów mobilnych bez zarządzania infrastrukturą.

**Application Insights**  
Usługa monitorowania wydajności aplikacji (APM) Azure, która zapewnia głębokie wglądy w wydajność, dostępność i użycie aplikacji.

**Azure CLI**  
Interfejs wiersza poleceń do zarządzania zasobami Azure. Uzupełnia AZD, ale wymaga oddzielnego logowania; główna autoryzacja AZD używa `azd auth login`.

**Azure Developer CLI (azd)**  
Narzędzie wiersza poleceń skoncentrowane na programistach, które przyspiesza proces budowy i wdrażania aplikacji do Azure przy użyciu szablonów i Infrastructure as Code.

**azure.yaml**  
Główny plik konfiguracyjny projektu azd definiujący usługi, infrastrukturę i haki wdrożeniowe.

**Azure Resource Manager (ARM)**  
Usługa wdrażania i zarządzania Azure, która zapewnia warstwę zarządzania do tworzenia, aktualizacji i usuwania zasobów.

## B

**Bicep**  
Język specyficzny dla domeny (DSL) opracowany przez Microsoft do wdrażania zasobów Azure. Zapewnia prostszą składnię niż szablony ARM, a kompiluje się do ARM.

**Budowanie**  
Proces kompilowania kodu źródłowego, instalowania zależności i przygotowywania aplikacji do wdrożenia.

**Blue-Green Deployment**  
Strategia wdrażania wykorzystująca dwa identyczne środowiska produkcyjne (niebieskie i zielone) w celu minimalizacji przestojów i ryzyka.

## C

**Container Apps**  
Bezserwerowa usługa kontenerowa Azure, która umożliwia uruchamianie aplikacji w kontenerach bez zarządzania złożoną infrastrukturą.

**CI/CD**  
Continuous Integration/Continuous Deployment. Zautomatyzowane praktyki integrowania zmian w kodzie i wdrażania aplikacji.

**Cosmos DB**  
Globalnie dystrybuowana, wielomodelowa usługa baz danych Azure, która zapewnia kompleksowe SLA dotyczące przepustowości, opóźnień, dostępności i spójności.

**Konfiguracja**  
Ustawienia i parametry kontrolujące zachowanie aplikacji i opcje wdrożenia.

## D

**Wdrożenie**  
Proces instalowania i konfigurowania aplikacji oraz ich zależności na docelowej infrastrukturze.

**Docker**  
Platforma do tworzenia, dystrybucji i uruchamiania aplikacji za pomocą technologii konteneryzacji.

**Dockerfile**  
Plik tekstowy zawierający instrukcje do budowy obrazu kontenera Docker.

## E

**Środowisko**  
Cel wdrożenia reprezentujący konkretną instancję twojej aplikacji (np. development, staging, production).

**Zmienne środowiskowe**  
Wartości konfiguracyjne przechowywane jako pary klucz-wartość, do których aplikacje mają dostęp w czasie działania.

**Endpoint**  
URL lub adres sieciowy, pod którym dostępna jest aplikacja lub usługa.

## F

**Function App**  
Bezserwerowa usługa obliczeniowa Azure, która umożliwia uruchamianie kodu wyzwalanego zdarzeniami bez zarządzania infrastrukturą.

## G

**GitHub Actions**  
Platforma CI/CD zintegrowana z repozytoriami GitHub do automatyzacji przepływów pracy.

**Git**  
Rozproszony system kontroli wersji używany do śledzenia zmian w kodzie źródłowym.

## H

**Hooks**  
Własne skrypty lub polecenia wykonywane w określonych momentach cyklu życia wdrożenia (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ usługi Azure, do którego zostanie wdrożona aplikacja (np. appservice, containerapp, function).

## I

**Infrastruktura jako kod (IaC)**  
Praktyka definiowania i zarządzania infrastrukturą za pomocą kodu zamiast ręcznych procesów.

**Init**  
Proces inicjalizacji nowego projektu azd, zazwyczaj z wykorzystaniem szablonu.

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
Usługa rozkładająca przychodzący ruch sieciowy między wieloma serwerami lub instancjami.

**Log Analytics**  
Usługa Azure do zbierania, analizowania i reagowania na dane telemetryczne z chmury i środowisk lokalnych.

## M

**Managed Identity**  
Funkcja Azure zapewniająca usłgom Azure automatycznie zarządzaną tożsamość do uwierzytelniania się w innych usługach Azure.

**Mikroserwisy**  
Podejście architektoniczne, w którym aplikacje są budowane jako zbiór małych, niezależnych usług.

**Monitor**  
Zunifikowane rozwiązanie monitorujące Azure, zapewniające pełną obserwowalność aplikacji i infrastruktury.

## N

**Node.js**  
Środowisko wykonawcze JavaScript oparte na silniku V8 Chrome, służące do tworzenia aplikacji po stronie serwera.

**npm**  
Menedżer pakietów dla Node.js, zarządzający zależnościami i pakietami.

## O

**Output**  
Wartości zwracane z wdrożenia infrastruktury, które mogą być używane przez aplikacje lub inne zasoby.

## P

**Package**  
Proces przygotowywania kodu aplikacji i zależności do wdrożenia.

**Parametry**  
Wartości wejściowe przekazywane do szablonów infrastruktury w celu dostosowania wdrożeń.

**PostgreSQL**  
Otwartoźródłowy system baz danych relacyjnych, wspierany jako usługa zarządzana w Azure.

**Provisioning**  
Proces tworzenia i konfigurowania zasobów Azure zdefiniowanych w szablonach infrastruktury.

## Q

**Quota**  
Limity dotyczące ilości zasobów, które można utworzyć w subskrypcji lub regionie Azure.

## R

**Resource Group**  
Logiczne pojemnik dla zasobów Azure, które dzielą ten sam cykl życia, uprawnienia i polityki.

**Resource Token**  
Unikalny ciąg generowany przez azd, aby zapewnić unikalność nazw zasobów w trakcie wdrożeń.

**REST API**  
Styl architektoniczny do projektowania aplikacji sieciowych z użyciem metod HTTP.

**Rollback**  
Proces powrotu do poprzedniej wersji aplikacji lub konfiguracji infrastruktury.

## S

**Service**  
Komponent twojej aplikacji zdefiniowany w azure.yaml (np. frontend webowy, backend API, baza danych).

**SKU**  
Stock Keeping Unit. Reprezentuje różne poziomy usług lub wydajności dla zasobów Azure.

**SQL Database**  
Zarządzana relacyjna usługa baz danych Azure oparta na Microsoft SQL Server.

**Static Web Apps**  
Usługa Azure do budowy i wdrażania pełnych aplikacji webowych ze źródeł w repozytoriach kodu.

**Storage Account**  
Usługa Azure oferująca przestrzeń dyskową w chmurze dla obiektów danych, takich jak bloby, pliki, kolejki i tabele.

**Subscription**  
Kontener konta Azure, który zawiera grupy zasobów i zasoby wraz z powiązanym zarządzaniem rozliczeniami i dostępem.

## T

**Template**  
Wstępnie zbudowana struktura projektu zawierająca kod aplikacji, definicje infrastruktury i konfigurację dla typowych scenariuszy.

**Terraform**  
Otwartoźródłowe narzędzie Infrastructure as Code wspierające wielu dostawców chmury, w tym Azure.

**Traffic Manager**  
DNS-owy load balancer Azure do rozkładania ruchu między globalne regiony Azure.

## U

**URI**  
Uniform Resource Identifier. Ciąg znaków identyfikujący konkretny zasób.

**URL**  
Uniform Resource Locator. Typ URI określający lokalizację zasobu i sposób jego pobrania.

## V

**Virtual Network (VNet)**  
Podstawowy element budujący prywatne sieci w Azure, zapewniający izolację i segmentację.

**VS Code**  
Visual Studio Code. Popularny edytor kodu z doskonałą integracją Azure i azd.

## W

**Webhook**  
Wywołanie zwrotne HTTP wyzwalane przez określone zdarzenia, powszechnie używane w pipeline CI/CD.

**What-if**  
Funkcja Azure pokazująca, jakie zmiany zostałyby dokonane przez wdrożenie bez faktycznego ich wykonania.

## Y

**YAML**  
YAML Ain't Markup Language. Czytelny dla człowieka standard serializacji danych używany w plikach konfiguracyjnych, takich jak azure.yaml.

## Z

**Strefa (Zone)**  
Fizycznie oddzielne lokalizacje w regionie Azure zapewniające redundancję i wysoką dostępność.

---

## Typowe skróty

| Skrót | Pełna nazwa | Opis |
|---------|-----------|-------------|
| AAD | Azure Active Directory (obecnie Microsoft Entra ID) | Usługa zarządzania tożsamością i dostępem |
| ACR | Azure Container Registry | Usługa rejestru obrazów kontenerów |
| AKS | Azure Kubernetes Service | Zarządzana usługa Kubernetes |
| API | Application Programming Interface | Zbiór protokołów do budowy oprogramowania |
| ARM | Azure Resource Manager | Usługa wdrażania i zarządzania Azure |
| CDN | Content Delivery Network | Rozproszona sieć serwerów |
| CI/CD | Continuous Integration/Continuous Deployment | Zautomatyzowane praktyki rozwoju |
| CLI | Command Line Interface | Tekstowy interfejs użytkownika |
| DNS | Domain Name System | System tłumaczenia nazw domen na adresy IP |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpieczna wersja HTTP |
| IaC | Infrastructure as Code | Zarządzanie infrastrukturą za pomocą kodu |
| JSON | JavaScript Object Notation | Format wymiany danych |
| JWT | JSON Web Token | Format tokena do bezpiecznej transmisji informacji |
| KQL | Kusto Query Language | Język zapytań dla usług danych Azure |
| RBAC | Role-Based Access Control | Metoda kontroli dostępu oparta na rolach użytkowników |
| REST | Representational State Transfer | Styl architektoniczny dla usług sieciowych |
| SDK | Software Development Kit | Zbiór narzędzi programistycznych |
| SLA | Service Level Agreement | Zobowiązanie do dostępności/wydajności usługi |
| SQL | Structured Query Language | Język zarządzania bazami danych relacyjnych |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokoły kryptograficzne |
| URI | Uniform Resource Identifier | Ciąg identyfikujący zasób |
| URL | Uniform Resource Locator | Typ URI określający lokalizację zasobu |
| VM | Virtual Machine | Emulacja systemu komputerowego |
| VNet | Virtual Network | Prywatna sieć w Azure |
| YAML | YAML Ain't Markup Language | Standard serializacji danych |

---

## Mapowanie nazw usług Azure

| Nazwa powszechna | Oficjalna nazwa usługi Azure | Typ hosta azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Zasób infrastruktury, nie aplikacja `host` |
| NoSQL DB | Azure Cosmos DB | Zasób infrastruktury, nie aplikacja `host` |
| Storage | Azure Storage Account | Zasób infrastruktury, nie wbudowana aplikacja `host` |
| Cache | Azure Managed Redis | Zasób infrastruktury, nie aplikacja `host` |
| Search | Azure AI Search | Zasób infrastruktury, nie aplikacja `host` |
| Messaging | Azure Service Bus | Zasób infrastruktury, nie aplikacja `host` |

`services.<name>.host` wybiera cel wdrożenia aplikacji; nie jest skrótem dla żadnego typu zasobu Azure. Bazy danych, cache, usługi wyszukiwania i kolejki są zwykle udostępniane przez dostawcę infrastruktury i łączone z aplikacją poprzez wyjścia/konfigurację.

---

## Terminy specyficzne dla kontekstu

### Terminy związane z rozwojem
- **Hot Reload**: Automatyczna aktualizacja aplikacji podczas rozwoju bez konieczności restartu
- **Build Pipeline**: Zautomatyzowany proces budowy i testowania kodu
- **Deployment Slot**: Środowisko testowe (staging) w ramach App Service
- **Environment Parity**: Zachowanie podobieństwa między środowiskami development, staging i produkcyjnym

### Terminy związane z bezpieczeństwem
- **Managed Identity**: Funkcja Azure zapewniająca automatyczne zarządzanie poświadczeniami
- **Key Vault**: Bezpieczne miejsce przechowywania sekretów, kluczy i certyfikatów
- **RBAC**: Kontrola dostępu oparta na rolach dla zasobów Azure
- **Network Security Group**: Wirtualna zapora ogniowa kontrolująca ruch sieciowy

### Terminy związane z monitorowaniem
- **Telemetry**: Zautomatyzowany zbiór pomiarów i danych
- **Application Performance Monitoring (APM)**: Monitorowanie wydajności oprogramowania
- **Log Analytics**: Usługa zbierania i analizy danych dzienników
- **Alert Rules**: Automatyczne powiadomienia bazujące na metrykach lub warunkach

### Terminy związane z wdrożeniami
- **Blue-Green Deployment**: Strategia wdrożeń bez przestojów
- **Canary Deployment**: Stopniowe wdrażanie dla wybranej grupy użytkowników
- **Rolling Update**: Sekwencyjna wymiana instancji aplikacji
- **Rollback**: Cofanie się do poprzedniej wersji aplikacji

---

**Wskazówka**: Użyj `Ctrl+F`, aby szybko wyszukać konkretne terminy w tym słowniku. Terminy są tam, gdzie to możliwe, powiązane wzajemnie.

---

**Nawigacja**
- **Poprzednia lekcja**: [Cheat Sheet](cheat-sheet.md)
- **Następna lekcja**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->