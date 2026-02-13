# Glossar - Azure- und AZD-Terminologie

**Referenz für alle Kapitel**
- **📚 Kursübersicht**: [AZD For Beginners](../README.md)
- **📖 Grundlagen lernen**: [Kapitel 1: AZD-Grundlagen](../docs/getting-started/azd-basics.md)
- **🤖 KI-Begriffe**: [Kapitel 2: KI-First-Entwicklung](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Einführung

Dieses umfassende Glossar bietet Definitionen für Begriffe, Konzepte und Abkürzungen, die in Azure Developer CLI und der Azure-Cloud-Entwicklung verwendet werden. Eine wichtige Referenz zum Verständnis technischer Dokumentation, zur Fehlerbehebung und zur effektiven Kommunikation über azd-Projekte und Azure-Dienste.

## Lernziele

Durch die Nutzung dieses Glossars werden Sie:
- Wesentliche Terminologie und Konzepte der Azure Developer CLI verstehen
- Den Wortschatz und technische Begriffe der Azure-Cloud-Entwicklung beherrschen
- Begriffe zu Infrastructure as Code und Bereitstellung effizient nachschlagen können
- Azure-Dienstnamen, Abkürzungen und ihre Zwecke verstehen
- Definitionen für Terminologie der Fehlerbehebung und Debugging abrufen können
- Fortgeschrittene Konzepte der Azure-Architektur und -Entwicklung erlernen

## Lernergebnisse

Bei regelmäßigem Nachschlagen dieses Glossars werden Sie in der Lage sein:
- Effektiv mit korrekter Azure Developer CLI-Terminologie zu kommunizieren
- Technische Dokumentation und Fehlermeldungen klarer zu verstehen
- Sich selbstbewusst in Azure-Diensten und -Konzepten zurechtzufinden
- Probleme mithilfe geeigneter technischer Fachbegriffe zu beheben
- Zu Teamdiskussionen mit präziser technischer Sprache beizutragen
- Ihr Wissen in der Azure-Cloud-Entwicklung systematisch zu erweitern

## A

**ARM Template**  
Azure Resource Manager-Template. JSON-basiertes Infrastructure-as-Code-Format, das verwendet wird, um Azure-Ressourcen deklarativ zu definieren und bereitzustellen.

**App Service**  
Azures Platform-as-a-Service-(PaaS)-Angebot zum Hosten von Webanwendungen, REST-APIs und mobilen Backends, ohne die Infrastruktur verwalten zu müssen.

**Application Insights**  
Azures Application Performance Monitoring-(APM)-Dienst, der tiefe Einblicke in Anwendungsleistung, Verfügbarkeit und Nutzung bietet.

**Azure CLI**  
Befehlszeilenschnittstelle zur Verwaltung von Azure-Ressourcen. Wird von azd für Authentifizierung und einige Operationen verwendet.

**Azure Developer CLI (azd)**  
Entwicklerzentriertes Kommandozeilen-Tool, das den Prozess des Erstellens und Bereitstellens von Anwendungen in Azure mithilfe von Vorlagen und Infrastructure as Code beschleunigt.

**azure.yaml**  
Die Hauptkonfigurationsdatei für ein azd-Projekt, die Dienste, Infrastruktur und Bereitstellungshooks definiert.

**Azure Resource Manager (ARM)**  
Azures Bereitstellungs- und Verwaltungsdienst, der eine Managementschicht zum Erstellen, Aktualisieren und Löschen von Ressourcen bereitstellt.

## B

**Bicep**  
Domänenspezifische Sprache (DSL) von Microsoft zur Bereitstellung von Azure-Ressourcen. Bietet eine einfachere Syntax als ARM-Templates und kompiliert in ARM.

**Build**  
Der Prozess des Kompilierens von Quellcode, der Installation von Abhängigkeiten und der Vorbereitung von Anwendungen für die Bereitstellung.

**Blue-Green Deployment**  
Bereitstellungsstrategie, die zwei identische Produktionsumgebungen (blue und green) nutzt, um Ausfallzeiten und Risiken zu minimieren.

## C

**Container Apps**  
Azures serverloser Container-Dienst, der das Ausführen containerisierter Anwendungen ermöglicht, ohne komplexe Infrastruktur zu verwalten.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatisierte Praktiken zum Integrieren von Codeänderungen und Bereitstellen von Anwendungen.

**Cosmos DB**  
Azures global verteiltes, multimodales Datenbankangebot, das umfassende SLAs für Durchsatz, Latenz, Verfügbarkeit und Konsistenz bietet.

**Konfiguration**  
Einstellungen und Parameter, die das Verhalten einer Anwendung und die Bereitstellungsoptionen steuern.

## D

**Deployment**  
Der Prozess der Installation und Konfiguration von Anwendungen und ihrer Abhängigkeiten auf der Zielinfrastruktur.

**Docker**  
Plattform zum Entwickeln, Verpacken und Ausführen von Anwendungen mithilfe von Containerisierungstechnologie.

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
Azures serverloser Compute-Dienst, der das Ausführen ereignisgesteuerter Codeabschnitte ohne Infrastrukturverwaltung ermöglicht.

## G

**GitHub Actions**  
CI/CD-Plattform, die in GitHub-Repositorien integriert ist, um Workflows zu automatisieren.

**Git**  
Verteiltes Versionskontrollsystem zur Nachverfolgung von Änderungen im Quellcode.

## H

**Hooks**  
Benutzerdefinierte Skripte oder Befehle, die an bestimmten Punkten im Bereitstellungslebenszyklus ausgeführt werden (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Der Azure-Diensttyp, auf dem eine Anwendung bereitgestellt wird (z. B. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxis, Infrastruktur durch Code statt manuell zu definieren und zu verwalten.

**Init**  
Der Prozess zur Initialisierung eines neuen azd-Projekts, typischerweise aus einer Vorlage.

## J

**JSON**  
JavaScript Object Notation. Daten-Austauschformat, das häufig für Konfigurationsdateien und API-Antworten verwendet wird.

**JWT**  
JSON Web Token. Standard zum sicheren Übermitteln von Informationen zwischen Parteien als JSON-Objekt.

## K

**Key Vault**  
Azures Dienst zum sicheren Speichern und Verwalten von Geheimnissen, Schlüsseln und Zertifikaten.

**Kusto Query Language (KQL)**  
Abfragesprache zur Analyse von Daten in Azure Monitor, Application Insights und anderen Azure-Diensten.

## L

**Load Balancer**  
Dienst, der eingehenden Netzwerkverkehr auf mehrere Server oder Instanzen verteilt.

**Log Analytics**  
Azure-Dienst zum Sammeln, Analysieren und Handeln auf Telemetriedaten aus Cloud- und lokalen Umgebungen.

## M

**Verwaltete Identität (Managed Identity)**  
Azure-Funktion, die Azure-Diensten automatisch verwaltete Identitäten zur Authentifizierung gegenüber anderen Azure-Diensten bereitstellt.

**Microservices**  
Architektureller Ansatz, bei dem Anwendungen als Sammlung kleiner, unabhängiger Dienste aufgebaut werden.

**Monitor**  
Azures einheitliche Monitoring-Lösung, die Full-Stack-Observability über Anwendungen und Infrastruktur bietet.

## N

**Node.js**  
JavaScript-Laufzeitumgebung, die auf Chromes V8-JavaScript-Engine basiert und zum Erstellen serverseitiger Anwendungen verwendet wird.

**npm**  
Paketmanager für Node.js, der Abhängigkeiten und Pakete verwaltet.

## O

**Output**  
Werte, die aus einer Infrastruktur-Bereitstellung zurückgegeben werden und von Anwendungen oder anderen Ressourcen verwendet werden können.

## P

**Package**  
Der Prozess der Vorbereitung von Anwendungscode und Abhängigkeiten für die Bereitstellung.

**Parameters**  
Eingabewerte, die an Infrastrukturvorlagen übergeben werden, um Bereitstellungen anzupassen.

**PostgreSQL**  
Open-Source-relationales Datenbanksystem, das als verwalteter Dienst in Azure unterstützt wird.

**Provisioning**  
Der Prozess des Erstellens und Konfigurierens von Azure-Ressourcen, die in Infrastrukturvorlagen definiert sind.

## Q

**Quota**  
Beschränkungen hinsichtlich der Menge von Ressourcen, die in einer Azure-Subscription oder in einer Region erstellt werden können.

## R

**Resource Group**  
Logischer Container für Azure-Ressourcen, die denselben Lebenszyklus, Berechtigungen und Richtlinien teilen.

**Resource Token**  
Eindeutige Zeichenfolge, die von azd generiert wird, um sicherzustellen, dass Ressourcennamen über Bereitstellungen hinweg eindeutig sind.

**REST API**  
Architekturstil zur Gestaltung vernetzter Anwendungen unter Verwendung von HTTP-Methoden.

**Rollback**  
Prozess des Zurücksetzens auf eine vorherige Version einer Anwendung oder Infrastrukturkonfiguration.

## S

**Service**  
Eine Komponente Ihrer Anwendung, die in azure.yaml definiert ist (z. B. Web-Frontend, API-Backend, Datenbank).

**SKU**  
Stock Keeping Unit. Repräsentiert verschiedene Dienststufen oder Leistungsstufen für Azure-Ressourcen.

**SQL Database**  
Azures verwalteter relationaler Datenbankdienst auf Basis von Microsoft SQL Server.

**Static Web Apps**  
Azure-Dienst zum Erstellen und Bereitstellen von Full-Stack-Webanwendungen aus Quellcode-Repositories.

**Storage Account**  
Azure-Dienst, der Cloud-Speicher für Datenobjekte wie Blobs, Dateien, Warteschlangen und Tabellen bereitstellt.

**Subscription**  
Container für Azure-Konten, der Resource Groups und Ressourcen enthält sowie Abrechnung und Zugriffsverwaltung regelt.

## T

**Template**  
Vorgefertigte Projektstruktur, die Anwendungs-Code, Infrastrukturdefinitionen und Konfiguration für gängige Szenarien enthält.

**Terraform**  
Open-Source-Infrastructure-as-Code-Tool, das mehrere Cloud-Anbieter, einschließlich Azure, unterstützt.

**Traffic Manager**  
Azures DNS-basierter Traffic-Load-Balancer zur Verteilung des Verkehrs über globale Azure-Regionen.

## U

**URI**  
Uniform Resource Identifier. Zeichenkette, die eine bestimmte Ressource identifiziert.

**URL**  
Uniform Resource Locator. Typ eines URI, der angibt, wo sich eine Ressource befindet und wie sie abgerufen wird.

## V

**Virtual Network (VNet)**  
Grundbaustein für private Netzwerke in Azure, der Isolation und Segmentierung bietet.

**VS Code**  
Visual Studio Code. Beliebter Code-Editor mit ausgezeichneter Azure- und azd-Integration.

## W

**Webhook**  
HTTP-Callback, der durch bestimmte Ereignisse ausgelöst wird und häufig in CI/CD-Pipelines verwendet wird.

**What-if**  
Azure-Funktion, die zeigt, welche Änderungen durch eine Bereitstellung vorgenommen würden, ohne sie tatsächlich auszuführen.

## Y

**YAML**  
YAML Ain't Markup Language. Menschenlesbarer Datenserialisierungsstandard, der für Konfigurationsdateien wie azure.yaml verwendet wird.

## Z

**Zone**  
Physisch getrennte Standorte innerhalb einer Azure-Region, die Redundanz und hohe Verfügbarkeit bieten.

---

## Häufige Abkürzungen

| Acronym | Vollform | Beschreibung |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Dienst für Identitäts- und Zugriffsverwaltung |
| ACR | Azure Container Registry | Registrierungsdienst für Containerimages |
| AKS | Azure Kubernetes Service | Verwalteter Kubernetes-Dienst |
| API | Application Programming Interface | Satz von Protokollen zum Erstellen von Software |
| ARM | Azure Resource Manager | Azure-Dienst für Bereitstellung und Verwaltung |
| CDN | Content Delivery Network | Verteiltes Servernetzwerk |
| CI/CD | Continuous Integration/Continuous Deployment | Automatisierte Entwicklungspraktiken |
| CLI | Command Line Interface | Textbasierte Benutzeroberfläche |
| DNS | Domain Name System | System zur Übersetzung von Domainnamen in IP-Adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Sichere Version von HTTP |
| IaC | Infrastructure as Code | Verwaltung von Infrastruktur durch Code |
| JSON | JavaScript Object Notation | Daten-Austauschformat |
| JWT | JSON Web Token | Token-Format für sichere Informationsübertragung |
| KQL | Kusto Query Language | Abfragesprache für Azure-Datenservices |
| RBAC | Role-Based Access Control | Zugriffskontrollmethode, die auf Benutzerrollen basiert |
| REST | Representational State Transfer | Architekturstil für Webdienste |
| SDK | Software Development Kit | Sammlung von Entwicklungstools |
| SLA | Service Level Agreement | Vereinbarung über Serviceverfügbarkeit und -leistung |
| SQL | Structured Query Language | Sprache zur Verwaltung relationaler Datenbanken |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptographische Protokolle |
| URI | Uniform Resource Identifier | Zeichenkette zur Identifizierung einer Ressource |
| URL | Uniform Resource Locator | Typ von URI, der den Speicherort einer Ressource angibt |
| VM | Virtual Machine | Emulation eines Computersystems |
| VNet | Virtual Network | Privates Netzwerk in Azure |
| YAML | YAML Ain't Markup Language | Datenserialisierungsstandard |

---

## Zuordnung von Azure-Dienstnamen

| Gängiger Name | Offizieller Azure-Dienstname | azd Hosttyp |
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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Kontext-spezifische Begriffe

### Entwicklungsterms
- **Hot Reload**: Automatisches Aktualisieren von Anwendungen während der Entwicklung ohne Neustart
- **Build Pipeline**: Automatisierter Prozess zum Erstellen und Testen von Code
- **Deployment Slot**: Staging-Umgebung innerhalb eines App Service
- **Environment Parity**: Entwicklung, Staging und Produktionsumgebungen ähnlich halten

### Sicherheitsterms
- **Managed Identity**: Azure-Funktion, die automatische Verwaltung von Anmeldeinformationen bereitstellt
- **Key Vault**: Sicherer Speicher für Geheimnisse, Schlüssel und Zertifikate
- **RBAC**: Rollenbasierte Zugriffskontrolle für Azure-Ressourcen
- **Network Security Group**: Virtuelle Firewall zur Steuerung des Netzwerkverkehrs

### Monitoring-Terme
- **Telemetry**: Automatisierte Sammlung von Messwerten und Daten
- **Application Performance Monitoring (APM)**: Überwachung der Softwareleistung
- **Log Analytics**: Dienst zum Sammeln und Analysieren von Protokolldaten
- **Alert Rules**: Automatisierte Benachrichtigungen basierend auf Metriken oder Bedingungen

### Bereitstellungsbegriffe
- **Blue-Green Deployment**: Bereitstellungsstrategie ohne Ausfallzeiten
- **Canary Deployment**: Stufenweiser Rollout an eine Teilmenge von Benutzern
- **Rolling Update**: Sequenzielle Ersetzung von Anwendungsinstanzen
- **Rollback**: Zurücksetzen auf eine vorherige Anwendungs-Version

---

**Tipp zur Nutzung**: Verwenden Sie `Ctrl+F`, um schnell nach bestimmten Begriffen in diesem Glossar zu suchen. Begriffe sind, wo zutreffend, miteinander verknüpft.

---

**Navigation**
- **Vorherige Lektion**: [Cheat Sheet](cheat-sheet.md)
- **Nächste Lektion**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das ursprüngliche Dokument in seiner Originalsprache gilt als maßgebliche Quelle. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->