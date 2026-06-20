# Glossar - Azure- und AZD-Terminologie

**Referenz für alle Kapitel**
- **📚 Kursstart**: [AZD für Einsteiger](../README.md)
- **📖 Grundlagen lernen**: [Kapitel 1: AZD-Grundlagen](../docs/getting-started/azd-basics.md)
- **🤖 KI‑Begriffe**: [Kapitel 2: KI-First-Entwicklung](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Einführung

Dieses umfassende Glossar bietet Definitionen für Begriffe, Konzepte und Abkürzungen, die in der Azure Developer CLI und der Azure-Cloud-Entwicklung verwendet werden. Unerlässliche Referenz zum Verständnis technischer Dokumentation, zur Fehlerbehebung und zur effektiven Kommunikation über azd-Projekte und Azure-Dienste.

## Lernziele

Durch die Nutzung dieses Glossars werden Sie:
- Wesentliche Terminologie und Konzepte der Azure Developer CLI verstehen
- Den Wortschatz und die technischen Begriffe der Azure-Cloud-Entwicklung beherrschen
- Begriffe zu Infrastructure as Code und Deployment effizient nachschlagen können
- Azure-Dienstnamen, Abkürzungen und deren Zwecke verstehen
- Definitionen für Fehlersuche und Debugging-Terminologie abrufen können
- Fortgeschrittene Azure-Architektur- und Entwicklungskonzepte kennenlernen

## Lernergebnisse

Bei regelmäßiger Nutzung dieses Glossars werden Sie in der Lage sein:
- Effektiv mit korrekter Azure Developer CLI-Terminologie zu kommunizieren
- Technische Dokumentation und Fehlermeldungen klarer zu verstehen
- Sich mit Vertrauen in Azure-Diensten und -Konzepten zu bewegen
- Probleme mit angemessenem technischen Vokabular zu beheben
- Sich mit präziser technischer Sprache an Teamdiskussionen zu beteiligen
- Ihr Wissen zur Azure-Cloud-Entwicklung systematisch zu erweitern

## A

**ARM Template**  
Azure Resource Manager-Vorlage. JSON-basiertes Infrastructure-as-Code-Format, das verwendet wird, um Azure-Ressourcen deklarativ zu definieren und bereitzustellen.

**App Service**  
Azures Plattform-as-a-Service (PaaS)-Angebot zum Hosten von Webanwendungen, REST-APIs und mobilen Backends ohne Verwaltung der Infrastruktur.

**Application Insights**  
Der APM-Dienst (Application Performance Monitoring) von Azure, der tiefe Einblicke in Anwendungsleistung, Verfügbarkeit und Nutzung bietet.

**Azure CLI**  
Befehlszeilenschnittstelle zum Verwalten von Azure-Ressourcen. Wird von azd für Authentifizierung und einige Vorgänge genutzt.

**Azure Developer CLI (azd)**  
Ein entwicklerzentriertes Befehlszeilentool, das den Prozess des Erstellens und Bereitstellens von Anwendungen in Azure mithilfe von Vorlagen und Infrastructure as Code beschleunigt.

**azure.yaml**  
Die Hauptkonfigurationsdatei für ein azd-Projekt, die Dienste, Infrastruktur und Deployment-Hooks definiert.

**Azure Resource Manager (ARM)**  
Azures Bereitstellungs- und Verwaltungsdienst, der eine Verwaltungsschicht für das Erstellen, Aktualisieren und Löschen von Ressourcen bereitstellt.

## B

**Bicep**  
Domänenspezifische Sprache (DSL), die von Microsoft für die Bereitstellung von Azure-Ressourcen entwickelt wurde. Bietet eine einfachere Syntax als ARM-Vorlagen und kompiliert zu ARM.

**Build**  
Der Prozess des Kompilierens von Quellcode, Installierens von Abhängigkeiten und Vorbereitens von Anwendungen zur Bereitstellung.

**Blue-Green Deployment**  
Bereitstellungsstrategie, die zwei identische Produktionsumgebungen (blau und grün) nutzt, um Ausfallzeiten und Risiken zu minimieren.

## C

**Container Apps**  
Azures serverloser Container-Dienst, der das Ausführen containerisierter Anwendungen ermöglicht, ohne komplexe Infrastruktur verwalten zu müssen.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatisierte Praktiken zum Integrieren von Codeänderungen und Bereitstellen von Anwendungen.

**Cosmos DB**  
Azures global verteilte Multi-Model-Datenbank, die umfassende SLAs für Durchsatz, Latenz, Verfügbarkeit und Konsistenz bietet.

**Configuration**  
Einstellungen und Parameter, die das Verhalten einer Anwendung und Bereitstellungsoptionen steuern.

## D

**Deployment**  
Der Prozess des Installierens und Konfigurierens von Anwendungen und deren Abhängigkeiten auf der Zielinfrastruktur.

**Docker**  
Plattform zum Entwickeln, Bereitstellen und Ausführen von Anwendungen mithilfe von Container-Technologie.

**Dockerfile**  
Textdatei mit Anweisungen zum Erstellen eines Docker-Container-Images.

## E

**Environment**  
Ein Bereitstellungsziel, das eine spezifische Instanz Ihrer Anwendung darstellt (z. B. Entwicklung, Staging, Produktion).

**Environment Variables**  
Konfigurationswerte, die als Schlüssel-Wert-Paare gespeichert sind und von Anwendungen zur Laufzeit abgerufen werden können.

**Endpoint**  
URL oder Netzwerkadresse, unter der eine Anwendung oder ein Dienst erreichbar ist.

## F

**Function App**  
Azures serverloser Compute-Dienst, der das Ausführen ereignisgesteuerter Funktionen ohne Infrastrukturverwaltung ermöglicht.

## G

**GitHub Actions**  
CI/CD-Plattform, die in GitHub-Repositories integriert ist und Workflows automatisiert.

**Git**  
Verteiltes Versionskontrollsystem zum Nachverfolgen von Änderungen im Quellcode.

## H

**Hooks**  
Benutzerdefinierte Skripte oder Befehle, die zu bestimmten Zeitpunkten im Bereitstellungslebenszyklus ausgeführt werden (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Der Azure-Diensttyp, auf dem eine Anwendung bereitgestellt wird (z. B. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxis, Infrastruktur durch Code zu definieren und zu verwalten, anstatt manuelle Prozesse zu nutzen.

**Init**  
Der Prozess zum Initialisieren eines neuen azd-Projekts, typischerweise aus einer Vorlage.

## J

**JSON**  
JavaScript Object Notation. Ein Datenaustauschformat, das häufig für Konfigurationsdateien und API-Antworten verwendet wird.

**JWT**  
JSON Web Token. Standard zum sicheren Übertragen von Informationen zwischen Parteien als JSON-Objekt.

## K

**Key Vault**  
Azures Dienst zum sicheren Speichern und Verwalten von Geheimnissen, Schlüsseln und Zertifikaten.

**Kusto Query Language (KQL)**  
Abfragesprache zur Analyse von Daten in Azure Monitor, Application Insights und anderen Azure-Diensten.

## L

**Load Balancer**  
Dienst, der eingehenden Netzwerkverkehr auf mehrere Server oder Instanzen verteilt.

**Log Analytics**  
Azure-Dienst zum Sammeln, Analysieren und Reagieren auf Telemetriedaten aus Cloud- und On-Premises-Umgebungen.

## M

**Managed Identity**  
Azure-Funktion, die Azure-Diensten eine automatisch verwaltete Identität zur Authentifizierung bei anderen Azure-Diensten bereitstellt.

**Microservices**  
Architektureller Ansatz, bei dem Anwendungen als Sammlung kleiner, unabhängiger Dienste aufgebaut werden.

**Monitor**  
Azures einheitliche Monitoring-Lösung, die Full-Stack-Observability über Anwendungen und Infrastruktur hinweg bietet.

## N

**Node.js**  
JavaScript-Laufzeitumgebung auf Basis der V8-Engine von Chrome zum Erstellen serverseitiger Anwendungen.

**npm**  
Paketmanager für Node.js, der Abhängigkeiten und Pakete verwaltet.

## O

**Output**  
Werte, die aus der Infrastruktur-Bereitstellung zurückgegeben werden und von Anwendungen oder anderen Ressourcen verwendet werden können.

## P

**Package**  
Der Prozess, Anwendungs-Code und Abhängigkeiten für die Bereitstellung vorzubereiten.

**Parameters**  
Eingabewerte, die an Infrastrukturvorlagen übergeben werden, um Bereitstellungen anzupassen.

**PostgreSQL**  
Open-Source-relationales Datenbanksystem, das in Azure als verwalteter Dienst unterstützt wird.

**Provisioning**  
Der Prozess des Erstellens und Konfigurierens von Azure-Ressourcen, wie sie in Infrastrukturvorlagen definiert sind.

## Q

**Quota**  
Grenzwerte für die Menge an Ressourcen, die in einem Azure-Abonnement oder einer Region erstellt werden können.

## R

**Resource Group**  
Logischer Container für Azure-Ressourcen, die denselben Lebenszyklus, dieselben Berechtigungen und Richtlinien teilen.

**Resource Token**  
Eindeutige Zeichenkette, die von azd generiert wird, um sicherzustellen, dass Ressourcennamen über Bereitstellungen hinweg eindeutig sind.

**REST API**  
Architekturstil zum Entwurf vernetzter Anwendungen unter Verwendung von HTTP-Methoden.

**Rollback**  
Prozess des Zurücksetzens auf eine vorherige Version einer Anwendung oder Infrastrukturkonfiguration.

## S

**Service**  
Eine Komponente Ihrer Anwendung, die in azure.yaml definiert ist (z. B. Web-Frontend, API-Backend, Datenbank).

**SKU**  
Stock Keeping Unit. Repräsentiert verschiedene Service-Tarife oder Leistungsstufen für Azure-Ressourcen.

**SQL Database**  
Der verwaltete relationale Datenbankdienst von Azure, basierend auf Microsoft SQL Server.

**Static Web Apps**  
Azure-Dienst zum Erstellen und Bereitstellen von Full-Stack-Webanwendungen aus Quellcode-Repositories.

**Storage Account**  
Azure-Dienst, der Cloud-Speicher für Datenobjekte wie Blobs, Dateien, Warteschlangen und Tabellen bereitstellt.

**Subscription**  
Azure-Kontocontainer, der Ressourcengruppen und Ressourcen sowie zugehörige Abrechnung und Zugriffsverwaltung enthält.

## T

**Template**  
Vorgefertigte Projektstruktur, die Anwendungs-Code, Infrastrukturdefinitionen und Konfiguration für gängige Szenarien enthält.

**Terraform**  
Open-Source Infrastructure-as-Code-Tool, das mehrere Cloud-Anbieter einschließlich Azure unterstützt.

**Traffic Manager**  
Azures DNS-basierter Traffic-Load-Balancer zur Verteilung von Datenverkehr über globale Azure-Regionen.

## U

**URI**  
Uniform Resource Identifier. Zeichenkette, die eine bestimmte Ressource identifiziert.

**URL**  
Uniform Resource Locator. Typ eines URI, der angibt, wo sich eine Ressource befindet und wie sie abgerufen werden kann.

## V

**Virtual Network (VNet)**  
Grundbaustein für private Netzwerke in Azure, der Isolation und Segmentierung bietet.

**VS Code**  
Visual Studio Code. Beliebter Code-Editor mit ausgezeichneter Azure- und azd-Integration.

## W

**Webhook**  
HTTP-Callback, das durch bestimmte Ereignisse ausgelöst wird und häufig in CI/CD-Pipelines verwendet wird.

**What-if**  
Azure-Feature, das zeigt, welche Änderungen durch eine Bereitstellung vorgenommen würden, ohne sie tatsächlich auszuführen.

## Y

**YAML**  
YAML Ain't Markup Language. Menschlich lesbarer Datenserialisierungsstandard, der für Konfigurationsdateien wie azure.yaml verwendet wird.

## Z

**Zone**  
Physisch separate Standorte innerhalb einer Azure-Region, die Redundanz und hohe Verfügbarkeit bieten.

---

## Häufige Abkürzungen

| Akronym | Vollständige Bezeichnung | Beschreibung |
|---------|--------------------------|--------------|
| AAD | Azure Active Directory (jetzt Microsoft Entra ID) | Identitäts- und Zugriffsverwaltungsdienst |
| ACR | Azure Container Registry | Container-Image-Registry-Dienst |
| AKS | Azure Kubernetes Service | Verwalteter Kubernetes-Dienst |
| API | Application Programming Interface | Satz von Protokollen zum Erstellen von Software |
| ARM | Azure Resource Manager | Azures Bereitstellungs- und Verwaltungsdienst |
| CDN | Content Delivery Network | Verteiltes Netzwerk von Servern |
| CI/CD | Continuous Integration/Continuous Deployment | Automatisierte Entwicklungspraktiken |
| CLI | Command Line Interface | Textbasierte Benutzerschnittstelle |
| DNS | Domain Name System | System zur Übersetzung von Domänennamen in IP-Adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Sichere Version von HTTP |
| IaC | Infrastructure as Code | Verwaltung von Infrastruktur durch Code |
| JSON | JavaScript Object Notation | Datenaustauschformat |
| JWT | JSON Web Token | Token-Format für sichere Informationsübertragung |
| KQL | Kusto Query Language | Abfragesprache für Azure-Datenservices |
| RBAC | Role-Based Access Control | Zugriffssteuerungsmethode basierend auf Benutzerrollen |
| REST | Representational State Transfer | Architekturstil für Webdienste |
| SDK | Software Development Kit | Sammlung von Entwicklungstools |
| SLA | Service Level Agreement | Zusicherung zur Verfügbarkeit/Leistung eines Dienstes |
| SQL | Structured Query Language | Sprache zur Verwaltung relationaler Datenbanken |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografische Protokolle |
| URI | Uniform Resource Identifier | Zeichenkette zur Identifizierung einer Ressource |
| URL | Uniform Resource Locator | Typ eines URI, der den Standort der Ressource angibt |
| VM | Virtual Machine | Emulation eines Computersystems |
| VNet | Virtual Network | Privates Netzwerk in Azure |
| YAML | YAML Ain't Markup Language | Datenserialisierungsstandard |

---

## Azure-Dienstnamen-Zuordnungen

| Gängiger Name | Offizieller Azure-Dienstname | azd Host-Typ |
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

## Kontextspezifische Begriffe

### Entwicklungsbegriffe
- **Hot Reload**: Automatisches Aktualisieren von Anwendungen während der Entwicklung ohne Neustart
- **Build Pipeline**: Automatisierter Prozess zum Erstellen und Testen von Code
- **Deployment Slot**: Staging-Umgebung innerhalb eines App Service
- **Environment Parity**: Sicherstellen, dass Entwicklungs-, Staging- und Produktionsumgebungen einander ähnlich sind

### Sicherheitsbegriffe
- **Managed Identity**: Azure-Funktion zur automatischen Verwaltung von Anmeldeinformationen
- **Key Vault**: Sicheres Speichern von Geheimnissen, Schlüsseln und Zertifikaten
- **RBAC**: Rollenbasierte Zugriffskontrolle für Azure-Ressourcen
- **Network Security Group**: Virtuelle Firewall zur Steuerung des Netzwerkverkehrs

### Monitoring-Begriffe
- **Telemetry**: Automatisierte Erfassung von Messwerten und Daten
- **Application Performance Monitoring (APM)**: Überwachung der Softwareleistung
- **Log Analytics**: Dienst zum Sammeln und Analysieren von Logdaten
- **Alert Rules**: Automatisierte Benachrichtigungen basierend auf Metriken oder Bedingungen

### Bereitstellungsbegriffe
- **Blue-Green Deployment**: Zero-Downtime-Bereitstellungsstrategie
- **Canary Deployment**: Allmähliche Einführung für eine Teilmenge von Benutzern
- **Rolling Update**: Sequenzieller Austausch von Anwendungsinstanzen
- **Rollback**: Zurücksetzen auf eine vorherige Anwendungsversion

---

**Verwendungshinweis**: Verwenden Sie `Ctrl+F`, um schnell nach bestimmten Begriffen in diesem Glossar zu suchen. Begriffe sind, wo zutreffend, miteinander verknüpft.

---

**Navigation**
- **Vorherige Lektion**: [Cheat Sheet](cheat-sheet.md)
- **Nächste Lektion**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->