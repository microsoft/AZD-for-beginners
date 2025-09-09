<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T18:08:56+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "pl"
}
-->
# Glosariusz - Terminologia Azure Developer CLI

## Wprowadzenie

Ten obszerny glosariusz zawiera definicje terminów, koncepcji i skrótów używanych w Azure Developer CLI oraz w rozwoju chmury Azure. Jest to niezbędne źródło odniesienia do zrozumienia dokumentacji technicznej, rozwiązywania problemów i skutecznej komunikacji na temat projektów azd oraz usług Azure.

## Cele nauki

Korzystając z tego glosariusza, będziesz:
- Rozumieć kluczowe terminy i koncepcje Azure Developer CLI
- Opanowywać słownictwo i terminy techniczne związane z rozwojem chmury Azure
- Efektywnie odnosić się do terminologii Infrastructure as Code i wdrożeń
- Rozumieć nazwy usług Azure, skróty i ich zastosowania
- Uzyskiwać definicje terminów związanych z rozwiązywaniem problemów i debugowaniem
- Poznawać zaawansowane koncepcje architektury i rozwoju Azure

## Rezultaty nauki

Regularne korzystanie z tego glosariusza pozwoli Ci:
- Skutecznie komunikować się, używając właściwej terminologii Azure Developer CLI
- Lepiej rozumieć dokumentację techniczną i komunikaty o błędach
- Pewnie poruszać się po usługach i koncepcjach Azure
- Rozwiązywać problemy, używając odpowiedniego słownictwa technicznego
- Wnosić wkład w dyskusje zespołowe, używając precyzyjnego języka technicznego
- Systematycznie poszerzać swoją wiedzę na temat rozwoju chmury Azure

## A

**ARM Template**  
Szablon Azure Resource Manager. Format Infrastructure as Code oparty na JSON, używany do deklaratywnego definiowania i wdrażania zasobów Azure.

**App Service**  
Platforma jako usługa (PaaS) Azure do hostowania aplikacji webowych, REST API i zaplecza mobilnego bez zarządzania infrastrukturą.

**Application Insights**  
Usługa monitorowania wydajności aplikacji (APM) Azure, która dostarcza szczegółowych informacji o wydajności, dostępności i użyciu aplikacji.

**Azure CLI**  
Interfejs wiersza poleceń do zarządzania zasobami Azure. Używany przez azd do uwierzytelniania i niektórych operacji.

**Azure Developer CLI (azd)**  
Narzędzie wiersza poleceń skoncentrowane na programistach, które przyspiesza proces budowania i wdrażania aplikacji w Azure za pomocą szablonów i Infrastructure as Code.

**azure.yaml**  
Główny plik konfiguracyjny projektu azd, który definiuje usługi, infrastrukturę i haki wdrożeniowe.

**Azure Resource Manager (ARM)**  
Usługa wdrażania i zarządzania Azure, która zapewnia warstwę zarządzania do tworzenia, aktualizowania i usuwania zasobów.

## B

**Bicep**  
Język specyficzny dla domeny (DSL) opracowany przez Microsoft do wdrażania zasobów Azure. Oferuje prostszą składnię niż szablony ARM, kompilując do ARM.

**Build**  
Proces kompilacji kodu źródłowego, instalacji zależności i przygotowania aplikacji do wdrożenia.

**Blue-Green Deployment**  
Strategia wdrożenia wykorzystująca dwa identyczne środowiska produkcyjne (blue i green) w celu zminimalizowania przestojów i ryzyka.

## C

**Container Apps**  
Usługa kontenerowa bez serwera Azure, umożliwiająca uruchamianie aplikacji kontenerowych bez zarządzania złożoną infrastrukturą.

**CI/CD**  
Continuous Integration/Continuous Deployment. Zautomatyzowane praktyki integracji zmian w kodzie i wdrażania aplikacji.

**Cosmos DB**  
Globalnie rozproszona, wielomodelowa usługa baz danych Azure, oferująca kompleksowe SLA dotyczące przepustowości, opóźnień, dostępności i spójności.

**Configuration**  
Ustawienia i parametry kontrolujące zachowanie aplikacji i opcje wdrożenia.

## D

**Deployment**  
Proces instalacji i konfiguracji aplikacji oraz jej zależności na docelowej infrastrukturze.

**Docker**  
Platforma do tworzenia, dostarczania i uruchamiania aplikacji za pomocą technologii konteneryzacji.

**Dockerfile**  
Plik tekstowy zawierający instrukcje do budowy obrazu kontenera Docker.

## E

**Environment**  
Docelowe środowisko wdrożenia, reprezentujące konkretną instancję aplikacji (np. development, staging, production).

**Environment Variables**  
Wartości konfiguracyjne przechowywane jako pary klucz-wartość, które aplikacje mogą odczytywać w czasie działania.

**Endpoint**  
URL lub adres sieciowy, pod którym można uzyskać dostęp do aplikacji lub usługi.

## F

**Function App**  
Usługa obliczeniowa bez serwera Azure, umożliwiająca uruchamianie kodu opartego na zdarzeniach bez zarządzania infrastrukturą.

## G

**GitHub Actions**  
Platforma CI/CD zintegrowana z repozytoriami GitHub do automatyzacji przepływów pracy.

**Git**  
Rozproszony system kontroli wersji używany do śledzenia zmian w kodzie źródłowym.

## H

**Hooks**  
Niestandardowe skrypty lub polecenia uruchamiane w określonych punktach cyklu życia wdrożenia (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ usługi Azure, na której zostanie wdrożona aplikacja (np. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktyka definiowania i zarządzania infrastrukturą za pomocą kodu zamiast procesów manualnych.

**Init**  
Proces inicjalizacji nowego projektu azd, zazwyczaj z szablonu.

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
Usługa Azure do zbierania, analizowania i działania na danych telemetrycznych z chmury i środowisk lokalnych.

## M

**Managed Identity**  
Funkcja Azure zapewniająca usługom Azure automatycznie zarządzaną tożsamość do uwierzytelniania w innych usługach Azure.

**Microservices**  
Podejście architektoniczne, w którym aplikacje są budowane jako zbiór małych, niezależnych usług.

**Monitor**  
Zintegrowane rozwiązanie monitorujące Azure, zapewniające pełną obserwowalność aplikacji i infrastruktury.

## N

**Node.js**  
Środowisko uruchomieniowe JavaScript oparte na silniku V8 Chrome, używane do budowy aplikacji po stronie serwera.

**npm**  
Menedżer pakietów dla Node.js, zarządzający zależnościami i pakietami.

## O

**Output**  
Wartości zwracane z wdrożenia infrastruktury, które mogą być używane przez aplikacje lub inne zasoby.

## P

**Package**  
Proces przygotowania kodu aplikacji i zależności do wdrożenia.

**Parameters**  
Wartości wejściowe przekazywane do szablonów infrastruktury w celu dostosowania wdrożeń.

**PostgreSQL**  
Otwarty system relacyjnych baz danych obsługiwany jako usługa zarządzana w Azure.

**Provisioning**  
Proces tworzenia i konfigurowania zasobów Azure zdefiniowanych w szablonach infrastruktury.

## Q

**Quota**  
Limity dotyczące ilości zasobów, które można utworzyć w subskrypcji lub regionie Azure.

## R

**Resource Group**  
Logiczny kontener dla zasobów Azure, które mają wspólny cykl życia, uprawnienia i zasady.

**Resource Token**  
Unikalny ciąg generowany przez azd, zapewniający unikalność nazw zasobów w różnych wdrożeniach.

**REST API**  
Styl architektoniczny projektowania aplikacji sieciowych przy użyciu metod HTTP.

**Rollback**  
Proces przywracania poprzedniej wersji aplikacji lub konfiguracji infrastruktury.

## S

**Service**  
Komponent aplikacji zdefiniowany w azure.yaml (np. frontend webowy, backend API, baza danych).

**SKU**  
Stock Keeping Unit. Reprezentuje różne poziomy usług lub wydajności zasobów Azure.

**SQL Database**  
Zarządzana usługa relacyjnych baz danych Azure oparta na Microsoft SQL Server.

**Static Web Apps**  
Usługa Azure do budowy i wdrażania aplikacji webowych z repozytoriów kodu źródłowego.

**Storage Account**  
Usługa Azure zapewniająca przechowywanie danych w chmurze, w tym blobów, plików, kolejek i tabel.

**Subscription**  
Kontener konta Azure, który przechowuje grupy zasobów i zasoby, z powiązanym rozliczaniem i zarządzaniem dostępem.

## T

**Template**  
Gotowa struktura projektu zawierająca kod aplikacji, definicje infrastruktury i konfigurację dla typowych scenariuszy.

**Terraform**  
Otwarta platforma Infrastructure as Code obsługująca wielu dostawców chmury, w tym Azure.

**Traffic Manager**  
Usługa Azure do równoważenia obciążenia DNS, rozdzielająca ruch między globalne regiony Azure.

## U

**URI**  
Uniform Resource Identifier. Ciąg identyfikujący określony zasób.

**URL**  
Uniform Resource Locator. Typ URI określający lokalizację zasobu i sposób jego pobrania.

## V

**Virtual Network (VNet)**  
Podstawowy element budowy prywatnych sieci w Azure, zapewniający izolację i segmentację.

**VS Code**  
Visual Studio Code. Popularny edytor kodu z doskonałą integracją z Azure i azd.

## W

**Webhook**  
Wywołanie HTTP uruchamiane przez określone zdarzenia, często używane w pipeline'ach CI/CD.

**What-if**  
Funkcja Azure pokazująca, jakie zmiany zostałyby wprowadzone przez wdrożenie, bez faktycznego jego wykonania.

## Y

**YAML**  
YAML Ain't Markup Language. Standard serializacji danych czytelny dla człowieka, używany w plikach konfiguracyjnych, takich jak azure.yaml.

## Z

**Zone**  
Fizycznie oddzielone lokalizacje w regionie Azure, zapewniające redundancję i wysoką dostępność.

---

## Powszechne skróty

| Skrót | Pełna nazwa | Opis |
|-------|-------------|------|
| AAD | Azure Active Directory | Usługa zarządzania tożsamością i dostępem |
| ACR | Azure Container Registry | Usługa rejestru obrazów kontenerów |
| AKS | Azure Kubernetes Service | Zarządzana usługa Kubernetes |
| API | Application Programming Interface | Zestaw protokołów do budowy oprogramowania |
| ARM | Azure Resource Manager | Usługa wdrażania i zarządzania Azure |
| CDN | Content Delivery Network | Rozproszona sieć serwerów |
| CI/CD | Continuous Integration/Continuous Deployment | Zautomatyzowane praktyki rozwoju |
| CLI | Command Line Interface | Tekstowy interfejs użytkownika |
| DNS | Domain Name System | System tłumaczenia nazw domen na adresy IP |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpieczna wersja HTTP |
| IaC | Infrastructure as Code | Zarządzanie infrastrukturą za pomocą kodu |
| JSON | JavaScript Object Notation | Format wymiany danych |
| JWT | JSON Web Token | Format tokenów do bezpiecznego przesyłania informacji |
| KQL | Kusto Query Language | Język zapytań dla usług danych Azure |
| RBAC | Role-Based Access Control | Metoda kontroli dostępu oparta na rolach użytkowników |
| REST | Representational State Transfer | Styl architektoniczny dla usług webowych |
| SDK | Software Development Kit | Zestaw narzędzi programistycznych |
| SLA | Service Level Agreement | Zobowiązanie dotyczące dostępności/wydajności usługi |
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
|----------------|------------------------------|---------------|
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

### Terminy związane z rozwojem
- **Hot Reload**: Automatyczna aktualizacja aplikacji podczas rozwoju bez restartu
- **Build Pipeline**: Zautomatyzowany proces budowy i testowania kodu
- **Deployment Slot**: Środowisko staging w ramach App Service
- **Environment Parity**: Utrzymanie podobieństwa środowisk development, staging i production

### Terminy związane z bezpieczeństwem
- **Managed Identity**: Funkcja Azure zapewniająca automatyczne zarządzanie poświadczeniami
- **Key Vault**: Bezpieczne przechowywanie sekretów, kluczy i certyfikatów
- **RBAC**: Kontrola dostępu oparta na rolach dla zasobów Azure
- **Network Security Group**: Wirtualna zapora do kontrolowania ruchu sieciowego

### Terminy związane z monitorowaniem
- **Telemetry**: Automatyczne zbieranie pomiarów i danych
- **Application Performance Monitoring (APM)**: Monitorowanie wydajności oprogramowania
- **Log Analytics**: Usługa do zbierania i analizy danych logów
- **Alert Rules**: Automatyczne powiadomienia na podstawie metryk lub warunków

### Terminy związane z wdrożeniem
- **Blue-Green Deployment**: Strategia wdrożenia bez przestojów
- **Canary Deployment**: Stopniowe wdrażanie dla podzbioru użytkowników
- **Rolling Update**: Sekwencyjna wymiana instancji aplikacji
- **Rollback**: Przywracanie poprzedniej wersji aplikacji

---

**Wskazówka dotycząca użytkowania**: Użyj `Ctrl+F`, aby szybko wyszukać konkretne terminy w tym glosariuszu. Terminy są wzajemnie powiązane tam, gdzie to możliwe.

---

**Nawigacja**
- **Poprzednia lekcja**: [Cheat Sheet](cheat-sheet.md)
- **Następna lekcja**: [FAQ](faq.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.