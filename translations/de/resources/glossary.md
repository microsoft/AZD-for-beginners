<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T18:07:40+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "de"
}
-->
# Glossar - Azure Developer CLI Terminologie

## Einführung

Dieses umfassende Glossar bietet Definitionen für Begriffe, Konzepte und Akronyme, die in der Azure Developer CLI und der Azure-Cloud-Entwicklung verwendet werden. Es dient als wichtige Referenz, um technische Dokumentation zu verstehen, Probleme zu beheben und effektiv über azd-Projekte und Azure-Dienste zu kommunizieren.

## Lernziele

Durch die Nutzung dieses Glossars werden Sie:
- Wesentliche Begriffe und Konzepte der Azure Developer CLI verstehen
- Das Vokabular und die technischen Begriffe der Azure-Cloud-Entwicklung meistern
- Terminologie zu Infrastructure as Code und Bereitstellung effizient nachschlagen
- Namen, Akronyme und Zwecke von Azure-Diensten verstehen
- Definitionen für Begriffe zur Fehlerbehebung und Debugging abrufen
- Fortgeschrittene Konzepte der Azure-Architektur und -Entwicklung lernen

## Lernergebnisse

Mit regelmäßiger Nutzung dieses Glossars werden Sie in der Lage sein:
- Effektiv mit korrekter Azure Developer CLI-Terminologie zu kommunizieren
- Technische Dokumentation und Fehlermeldungen klarer zu verstehen
- Azure-Dienste und -Konzepte sicher zu navigieren
- Probleme mit der richtigen technischen Terminologie zu beheben
- Zu Teamdiskussionen mit präziser technischer Sprache beizutragen
- Ihr Wissen über die Azure-Cloud-Entwicklung systematisch zu erweitern

## A

**ARM Template**  
Azure Resource Manager-Vorlage. JSON-basiertes Format für Infrastructure as Code, das verwendet wird, um Azure-Ressourcen deklarativ zu definieren und bereitzustellen.

**App Service**  
Azure's Platform-as-a-Service (PaaS)-Angebot zum Hosten von Webanwendungen, REST-APIs und mobilen Backends ohne Infrastrukturverwaltung.

**Application Insights**  
Azure's Application Performance Monitoring (APM)-Dienst, der tiefgehende Einblicke in die Leistung, Verfügbarkeit und Nutzung von Anwendungen bietet.

**Azure CLI**  
Befehlszeilenschnittstelle zur Verwaltung von Azure-Ressourcen. Wird von azd für Authentifizierung und einige Operationen verwendet.

**Azure Developer CLI (azd)**  
Entwicklerzentriertes Befehlszeilentool, das den Prozess des Erstellens und Bereitstellens von Anwendungen in Azure mithilfe von Vorlagen und Infrastructure as Code beschleunigt.

**azure.yaml**  
Die Hauptkonfigurationsdatei eines azd-Projekts, die Dienste, Infrastruktur und Bereitstellungshooks definiert.

**Azure Resource Manager (ARM)**  
Azure's Bereitstellungs- und Verwaltungsdienst, der eine Verwaltungsebene für das Erstellen, Aktualisieren und Löschen von Ressourcen bietet.

## B

**Bicep**  
Domänenspezifische Sprache (DSL), die von Microsoft für die Bereitstellung von Azure-Ressourcen entwickelt wurde. Bietet eine einfachere Syntax als ARM-Vorlagen und kompiliert zu ARM.

**Build**  
Der Prozess des Kompilierens von Quellcode, der Installation von Abhängigkeiten und der Vorbereitung von Anwendungen für die Bereitstellung.

**Blue-Green Deployment**  
Bereitstellungsstrategie, die zwei identische Produktionsumgebungen (blau und grün) verwendet, um Ausfallzeiten und Risiken zu minimieren.

## C

**Container Apps**  
Azure's serverloser Container-Dienst, der das Ausführen containerisierter Anwendungen ohne komplexe Infrastrukturverwaltung ermöglicht.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatisierte Praktiken zur Integration von Codeänderungen und Bereitstellung von Anwendungen.

**Cosmos DB**  
Azure's global verteilter, multimodeller Datenbankdienst, der umfassende SLAs für Durchsatz, Latenz, Verfügbarkeit und Konsistenz bietet.

**Configuration**  
Einstellungen und Parameter, die das Verhalten von Anwendungen und Bereitstellungsoptionen steuern.

## D

**Deployment**  
Der Prozess der Installation und Konfiguration von Anwendungen und deren Abhängigkeiten auf Zielinfrastruktur.

**Docker**  
Plattform zum Entwickeln, Versenden und Ausführen von Anwendungen mithilfe von Containerisierungstechnologie.

**Dockerfile**  
Textdatei mit Anweisungen zum Erstellen eines Docker-Container-Images.

## E

**Environment**  
Ein Bereitstellungsziel, das eine spezifische Instanz Ihrer Anwendung darstellt (z. B. Entwicklung, Staging, Produktion).

**Environment Variables**  
Konfigurationswerte, die als Schlüssel-Wert-Paare gespeichert werden und von Anwendungen zur Laufzeit abgerufen werden können.

**Endpoint**  
URL oder Netzwerkadresse, unter der eine Anwendung oder ein Dienst erreichbar ist.

## F

**Function App**  
Azure's serverloser Compute-Dienst, der das Ausführen ereignisgesteuerter Code ohne Infrastrukturverwaltung ermöglicht.

## G

**GitHub Actions**  
CI/CD-Plattform, die in GitHub-Repositories integriert ist und Workflows automatisiert.

**Git**  
Verteiltes Versionskontrollsystem zur Nachverfolgung von Änderungen im Quellcode.

## H

**Hooks**  
Benutzerdefinierte Skripte oder Befehle, die zu bestimmten Zeitpunkten während des Bereitstellungslebenszyklus ausgeführt werden (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Der Azure-Diensttyp, auf dem eine Anwendung bereitgestellt wird (z. B. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxis, Infrastruktur durch Code statt durch manuelle Prozesse zu definieren und zu verwalten.

**Init**  
Der Prozess der Initialisierung eines neuen azd-Projekts, typischerweise aus einer Vorlage.

## J

**JSON**  
JavaScript Object Notation. Datenformat, das häufig für Konfigurationsdateien und API-Antworten verwendet wird.

**JWT**  
JSON Web Token. Standard für die sichere Übertragung von Informationen zwischen Parteien als JSON-Objekt.

## K

**Key Vault**  
Azure's Dienst zum sicheren Speichern und Verwalten von Geheimnissen, Schlüsseln und Zertifikaten.

**Kusto Query Language (KQL)**  
Abfragesprache, die für die Analyse von Daten in Azure Monitor, Application Insights und anderen Azure-Diensten verwendet wird.

## L

**Load Balancer**  
Dienst, der eingehenden Netzwerkverkehr auf mehrere Server oder Instanzen verteilt.

**Log Analytics**  
Azure-Dienst zum Sammeln, Analysieren und Handeln auf Telemetriedaten aus Cloud- und On-Premises-Umgebungen.

## M

**Managed Identity**  
Azure-Funktion, die Azure-Diensten eine automatisch verwaltete Identität zur Authentifizierung bei anderen Azure-Diensten bereitstellt.

**Microservices**  
Architektonischer Ansatz, bei dem Anwendungen als Sammlung kleiner, unabhängiger Dienste aufgebaut werden.

**Monitor**  
Azure's einheitliche Überwachungslösung, die vollständige Transparenz über Anwendungen und Infrastruktur bietet.

## N

**Node.js**  
JavaScript-Laufzeitumgebung, die auf der V8-JavaScript-Engine von Chrome basiert und für die Entwicklung serverseitiger Anwendungen verwendet wird.

**npm**  
Paketmanager für Node.js, der Abhängigkeiten und Pakete verwaltet.

## O

**Output**  
Werte, die aus der Bereitstellung von Infrastruktur zurückgegeben werden und von Anwendungen oder anderen Ressourcen verwendet werden können.

## P

**Package**  
Der Prozess der Vorbereitung von Anwendungscode und Abhängigkeiten für die Bereitstellung.

**Parameters**  
Eingabewerte, die an Infrastrukturvorlagen übergeben werden, um Bereitstellungen anzupassen.

**PostgreSQL**  
Open-Source-Relationaldatenbanksystem, das als verwalteter Dienst in Azure unterstützt wird.

**Provisioning**  
Der Prozess des Erstellens und Konfigurierens von Azure-Ressourcen, die in Infrastrukturvorlagen definiert sind.

## Q

**Quota**  
Grenzen für die Menge an Ressourcen, die in einem Azure-Abonnement oder einer Region erstellt werden können.

## R

**Resource Group**  
Logischer Container für Azure-Ressourcen, die denselben Lebenszyklus, Berechtigungen und Richtlinien teilen.

**Resource Token**  
Einzigartige Zeichenfolge, die von azd generiert wird, um sicherzustellen, dass Ressourcennamen über Bereitstellungen hinweg eindeutig sind.

**REST API**  
Architekturstil für die Gestaltung vernetzter Anwendungen unter Verwendung von HTTP-Methoden.

**Rollback**  
Prozess des Zurücksetzens auf eine frühere Version einer Anwendung oder Infrastrukturkonfiguration.

## S

**Service**  
Eine Komponente Ihrer Anwendung, die in azure.yaml definiert ist (z. B. Web-Frontend, API-Backend, Datenbank).

**SKU**  
Stock Keeping Unit. Repräsentiert verschiedene Dienststufen oder Leistungsniveaus für Azure-Ressourcen.

**SQL Database**  
Azure's verwalteter relationaler Datenbankdienst basierend auf Microsoft SQL Server.

**Static Web Apps**  
Azure-Dienst zum Erstellen und Bereitstellen von Full-Stack-Webanwendungen aus Quellcode-Repositories.

**Storage Account**  
Azure-Dienst, der Cloud-Speicher für Datenobjekte wie Blobs, Dateien, Warteschlangen und Tabellen bereitstellt.

**Subscription**  
Azure-Konto-Container, der Ressourcengruppen und Ressourcen enthält, mit zugehöriger Abrechnung und Zugriffsverwaltung.

## T

**Template**  
Vorgefertigte Projektstruktur, die Anwendungscode, Infrastrukturdefinitionen und Konfigurationen für häufige Szenarien enthält.

**Terraform**  
Open-Source-Tool für Infrastructure as Code, das mehrere Cloud-Anbieter einschließlich Azure unterstützt.

**Traffic Manager**  
Azure's DNS-basierter Traffic-Load-Balancer zur Verteilung von Traffic über globale Azure-Regionen.

## U

**URI**  
Uniform Resource Identifier. Zeichenfolge, die eine bestimmte Ressource identifiziert.

**URL**  
Uniform Resource Locator. Typ von URI, der angibt, wo sich eine Ressource befindet und wie sie abgerufen werden kann.

## V

**Virtual Network (VNet)**  
Grundlegender Baustein für private Netzwerke in Azure, der Isolation und Segmentierung bietet.

**VS Code**  
Visual Studio Code. Beliebter Code-Editor mit hervorragender Azure- und azd-Integration.

## W

**Webhook**  
HTTP-Callback, der durch bestimmte Ereignisse ausgelöst wird und häufig in CI/CD-Pipelines verwendet wird.

**What-if**  
Azure-Funktion, die zeigt, welche Änderungen durch eine Bereitstellung vorgenommen würden, ohne sie tatsächlich auszuführen.

## Y

**YAML**  
YAML Ain't Markup Language. Menschlich lesbarer Standard zur Datenserialisierung, der für Konfigurationsdateien wie azure.yaml verwendet wird.

## Z

**Zone**  
Physisch getrennte Standorte innerhalb einer Azure-Region, die Redundanz und hohe Verfügbarkeit bieten.

---

## Häufige Akronyme

| Akronym | Vollständige Form | Beschreibung |
|---------|-------------------|--------------|
| AAD | Azure Active Directory | Identitäts- und Zugriffsverwaltungsdienst |
| ACR | Azure Container Registry | Container-Image-Registry-Dienst |
| AKS | Azure Kubernetes Service | Verwalteter Kubernetes-Dienst |
| API | Application Programming Interface | Protokolle für die Softwareentwicklung |
| ARM | Azure Resource Manager | Azure's Bereitstellungs- und Verwaltungsdienst |
| CDN | Content Delivery Network | Verteiltes Netzwerk von Servern |
| CI/CD | Continuous Integration/Continuous Deployment | Automatisierte Entwicklungspraktiken |
| CLI | Command Line Interface | Textbasierte Benutzeroberfläche |
| DNS | Domain Name System | System zur Übersetzung von Domainnamen in IP-Adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Sichere Version von HTTP |
| IaC | Infrastructure as Code | Verwaltung von Infrastruktur durch Code |
| JSON | JavaScript Object Notation | Datenformat für den Austausch |
| JWT | JSON Web Token | Token-Format für sichere Informationsübertragung |
| KQL | Kusto Query Language | Abfragesprache für Azure-Datenservices |
| RBAC | Role-Based Access Control | Zugriffssteuerungsmethode basierend auf Benutzerrollen |
| REST | Representational State Transfer | Architekturstil für Webdienste |
| SDK | Software Development Kit | Sammlung von Entwicklungstools |
| SLA | Service Level Agreement | Verpflichtung zur Dienstverfügbarkeit/-leistung |
| SQL | Structured Query Language | Sprache zur Verwaltung relationaler Datenbanken |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografische Protokolle |
| URI | Uniform Resource Identifier | Zeichenfolge zur Identifizierung einer Ressource |
| URL | Uniform Resource Locator | Typ von URI, der den Standort einer Ressource angibt |
| VM | Virtual Machine | Emulation eines Computersystems |
| VNet | Virtual Network | Privates Netzwerk in Azure |
| YAML | YAML Ain't Markup Language | Standard zur Datenserialisierung |

---

## Azure-Dienstnamen-Zuordnungen

| Allgemeiner Name | Offizieller Azure-Dienstname | azd Host-Typ |
|------------------|-----------------------------|--------------|
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

## Kontextbezogene Begriffe

### Entwicklungsbegriffe
- **Hot Reload**: Automatische Aktualisierung von Anwendungen während der Entwicklung ohne Neustart
- **Build Pipeline**: Automatisierter Prozess zum Erstellen und Testen von Code
- **Deployment Slot**: Staging-Umgebung innerhalb eines App Service
- **Environment Parity**: Ähnlichkeit zwischen Entwicklungs-, Staging- und Produktionsumgebungen

### Sicherheitsbegriffe
- **Managed Identity**: Azure-Funktion zur automatischen Verwaltung von Anmeldeinformationen
- **Key Vault**: Sicherer Speicher für Geheimnisse, Schlüssel und Zertifikate
- **RBAC**: Rollenbasierte Zugriffssteuerung für Azure-Ressourcen
- **Network Security Group**: Virtuelle Firewall zur Steuerung des Netzwerkverkehrs

### Überwachungsbegriffe
- **Telemetry**: Automatische Sammlung von Messungen und Daten
- **Application Performance Monitoring (APM)**: Überwachung der Softwareleistung
- **Log Analytics**: Dienst zum Sammeln und Analysieren von Protokolldaten
- **Alert Rules**: Automatische Benachrichtigungen basierend auf Metriken oder Bedingungen

### Bereitstellungsbegriffe
- **Blue-Green Deployment**: Bereitstellungsstrategie ohne Ausfallzeiten
- **Canary Deployment**: Stufenweise Einführung für eine Teilmenge von Benutzern
- **Rolling Update**: Sequentieller Austausch von Anwendungsinstanzen
- **Rollback**: Zurücksetzen auf eine frühere Version der Anwendung

---

**Tipp zur Nutzung**: Verwenden Sie `Strg+F`, um schnell nach spezifischen Begriffen in diesem Glossar zu suchen. Begriffe sind, wo zutreffend, miteinander verknüpft.

---

**Navigation**
- **Vorherige Lektion**: [Cheat Sheet](cheat-sheet.md)
- **Nächste Lektion**: [FAQ](faq.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.