# Glossar - Azure- und AZD-Terminologie

**Referenz für alle Kapitel**
- **📚 Kursstart**: [AZD für Anfänger](../README.md)
- **📖 Grundlagen lernen**: [Kapitel 1: AZD Grundlagen](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI-Begriffe**: [Kapitel 2: AI-First Entwicklung](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Einführung

Dieses umfassende Glossar bietet Definitionen für Begriffe, Konzepte und Akronyme, die in Azure Developer CLI und der Azure-Cloud-Entwicklung verwendet werden. Wesentliche Referenz zum Verstehen technischer Dokumentationen, zur Fehlerbehebung und zur effektiven Kommunikation über azd-Projekte und Azure-Dienste.

## Lernziele

Durch die Verwendung dieses Glossars werden Sie:
- Wesentliche Terminologie und Konzepte der Azure Developer CLI verstehen
- Den Wortschatz und die Fachbegriffe der Azure-Cloud-Entwicklung beherrschen
- Terminologie zu Infrastructure as Code und Deployment effizient nachschlagen
- Azure-Dienstnamen, Akronyme und deren Zwecke verstehen
- Definitionen für Fehlerbehebung und Debugging-Terminologie nutzen
- Fortgeschrittene Konzepte der Azure-Architektur und Entwicklung lernen

## Lernergebnisse

Mit regelmäßiger Rückgriff auf dieses Glossar werden Sie in der Lage sein:
- Effektiv mit der korrekten Azure Developer CLI-Terminologie zu kommunizieren
- Technische Dokumentationen und Fehlermeldungen klarer zu verstehen
- Azure-Dienste und Konzepte sicher zu navigieren
- Probleme mit dem passenden technischen Vokabular zu beheben
- An Teamdiskussionen mit genauer technischer Sprache beizutragen
- Ihr Wissen in der Azure-Cloud-Entwicklung systematisch zu erweitern

## A

**ARM Template**  
Azure Resource Manager Template. JSON-basiertes Infrastructure as Code-Format zur deklarativen Definition und Bereitstellung von Azure-Ressourcen.

**App Service**  
Azure Plattform-als-ein-Service (PaaS)-Angebot zum Hosten von Webanwendungen, REST-APIs und mobilen Backends ohne Infrastrukturverwaltung.

**Application Insights**  
Azure Application Performance Monitoring (APM)-Dienst, der tiefgehende Einblicke in Anwendungsleistung, Verfügbarkeit und Nutzung bietet.

**Azure CLI**  
Kommandozeilenschnittstelle zur Verwaltung von Azure-Ressourcen. Ergänzt AZD, hat aber einen separaten Login; die Kern-Authentifizierung von AZD verwendet `azd auth login`.

**Azure Developer CLI (azd)**  
Entwicklerzentriertes Kommandozeilen-Tool, das den Prozess des Erstellens und Bereitstellens von Anwendungen in Azure mit Vorlagen und Infrastructure as Code beschleunigt.

**azure.yaml**  
Die Hauptkonfigurationsdatei eines azd-Projekts, die Dienste, Infrastruktur und Bereitstellungshooks definiert.

**Azure Resource Manager (ARM)**  
Azure-Dienst für Bereitstellung und Verwaltung, der eine Management-Ebene für Erstellen, Aktualisieren und Löschen von Ressourcen bereitstellt.

## B

**Bicep**  
Domänenspezifische Sprache (DSL), die von Microsoft zur Bereitstellung von Azure-Ressourcen entwickelt wurde. Bietet eine einfachere Syntax als ARM-Vorlagen und kompiliert in ARM.

**Build**  
Prozess des Kompilierens von Quellcode, Installierens von Abhängigkeiten und Vorbereitens von Anwendungen für den Einsatz.

**Blue-Green Deployment**  
Bereitstellungsstrategie, die zwei identische Produktionsumgebungen (blau und grün) nutzt, um Ausfallzeiten und Risiken zu minimieren.

## C

**Container Apps**  
Azure Serverless-Container-Service, der das Ausführen containerisierter Anwendungen ohne komplexe Infrastrukturverwaltung ermöglicht.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatisierte Praktiken zum Integrieren von Codeänderungen und Bereitstellen von Anwendungen.

**Cosmos DB**  
Azure global verteilter Multimodell-Datenbankdienst, der umfassende SLAs für Durchsatz, Latenz, Verfügbarkeit und Konsistenz bietet.

**Configuration**  
Einstellungen und Parameter, die das Verhalten von Anwendungen und Bereitstellungsoptionen steuern.

## D

**Deployment**  
Prozess des Installierens und Konfigurierens von Anwendungen und deren Abhängigkeiten auf Zielinfrastruktur.

**Docker**  
Plattform zum Entwickeln, Ausliefern und Ausführen von Anwendungen mithilfe von Container-Technologie.

**Dockerfile**  
Textdatei mit Anweisungen zum Erstellen eines Docker-Container-Images.

## E

**Environment**  
Bereitstellungsziel, das eine spezifische Instanz Ihrer Anwendung repräsentiert (z. B. Entwicklung, Staging, Produktion).

**Environment Variables**  
Konfigurationswerte, die als Schlüssel-Wert-Paare gespeichert sind und von Anwendungen zur Laufzeit abgerufen werden können.

**Endpoint**  
URL oder Netzwerkadresse, über die auf eine Anwendung oder einen Dienst zugegriffen werden kann.

## F

**Function App**  
Azure serverloser Compute-Dienst, der das Ausführen ereignisgesteuerten Codes ohne Infrastrukturverwaltung ermöglicht.

## G

**GitHub Actions**  
CI/CD-Plattform, die in GitHub-Repositories integriert ist, um Workflows zu automatisieren.

**Git**  
Verteiltes Versionskontrollsystem zur Nachverfolgung von Änderungen im Quellcode.

## H

**Hooks**  
Benutzerdefinierte Skripte oder Befehle, die an bestimmten Punkten während des Bereitstellungszyklus ausgeführt werden (vor der Bereitstellung, nach der Bereitstellung usw.).

**Host**  
Azure-Diensttyp, auf dem eine Anwendung bereitgestellt wird (z. B. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxis, Infrastruktur durch Code statt durch manuelle Prozesse zu definieren und zu verwalten.

**Init**  
Prozess zur Initialisierung eines neuen azd-Projekts, meist basierend auf einer Vorlage.

## J

**JSON**  
JavaScript Object Notation. Datenformat für den Austausch, häufig genutzt für Konfigurationsdateien und API-Antworten.

**JWT**  
JSON Web Token. Standard für das sichere Übertragen von Informationen zwischen Parteien als JSON-Objekt.

## K

**Key Vault**  
Azure-Dienst zur sicheren Speicherung und Verwaltung von Geheimnissen, Schlüsseln und Zertifikaten.

**Kusto Query Language (KQL)**  
Abfragesprache zur Analyse von Daten in Azure Monitor, Application Insights und anderen Azure-Diensten.

## L

**Load Balancer**  
Dienst, der eingehenden Netzwerkverkehr auf mehrere Server oder Instanzen verteilt.

**Log Analytics**  
Azure-Dienst zum Sammeln, Analysieren und Handeln von Telemetriedaten aus Cloud- und lokalen Umgebungen.

## M

**Managed Identity**  
Azure-Feature, das Azure-Diensten automatisch verwaltete Identitäten für die Authentifizierung bei anderen Azure-Diensten bereitstellt.

**Microservices**  
Architektureller Ansatz, bei dem Anwendungen als Sammlung kleiner, unabhängiger Dienste aufgebaut sind.

**Monitor**  
Einheitliche Azure-Monitoring-Lösung, die umfassende Beobachtbarkeit über Anwendungen und Infrastruktur bietet.

## N

**Node.js**  
JavaScript-Laufzeitumgebung, die auf Chrome’s V8 JavaScript-Engine basiert und serverseitige Anwendungen ermöglicht.

**npm**  
Paketmanager für Node.js zur Verwaltung von Abhängigkeiten und Paketen.

## O

**Output**  
Werte, die aus der Infrastruktur-Bereitstellung zurückgegeben werden und von Anwendungen oder anderen Ressourcen genutzt werden können.

## P

**Package**  
Prozess zur Vorbereitung von Anwendungscode und Abhängigkeiten für die Bereitstellung.

**Parameters**  
Eingabewerte, die Infrastrukturvorlagen übergeben werden, um Bereitstellungen anzupassen.

**PostgreSQL**  
Open-Source-relationales Datenbanksystem, das als verwalteter Dienst in Azure unterstützt wird.

**Provisioning**  
Prozess des Erstellens und Konfigurierens von Azure-Ressourcen, die in Infrastrukturvorlagen definiert sind.

## Q

**Quota**  
Grenzen für die Anzahl von Ressourcen, die in einem Azure-Abonnement oder einer Region erstellt werden können.

## R

**Resource Group**  
Logischer Container für Azure-Ressourcen, die denselben Lebenszyklus, Berechtigungen und Richtlinien teilen.

**Resource Token**  
Eindeutiger String, der von azd generiert wird, um sicherzustellen, dass Ressourcennamen bei Bereitstellungen eindeutig sind.

**REST API**  
Architekturstil zur Gestaltung vernetzter Anwendungen mit HTTP-Methoden.

**Rollback**  
Prozess des Zurücksetzens auf eine vorherige Version einer Anwendung oder Infrastrukturkonfiguration.

## S

**Service**  
Ein Teil Ihrer Anwendung, definiert in azure.yaml (z. B. Web-Frontend, API-Backend, Datenbank).

**SKU**  
Stock Keeping Unit. Stellt verschiedene Serviceebenen oder Leistungsstufen für Azure-Ressourcen dar.

**SQL Database**  
Verwalteter relationaler Datenbankdienst von Azure, basierend auf Microsoft SQL Server.

**Static Web Apps**  
Azure-Dienst zum Erstellen und Bereitstellen von Full-Stack-Webanwendungen aus Quellcode-Repositories.

**Storage Account**  
Azure-Dienst, der Cloudspeicher für Datenobjekte wie Blobs, Dateien, Warteschlangen und Tabellen bereitstellt.

**Subscription**  
Azure-Kontocontainer, der Ressourcengruppen und Ressourcen hält, mit zugehöriger Abrechnung und Zugriffsverwaltung.

## T

**Template**  
Vorgefertigte Projektstruktur, die Anwendungscode, Infrastrukturdefinitionen und Konfigurationen für häufige Szenarien enthält.

**Terraform**  
Open-Source Infrastructure as Code-Werkzeug, das mehrere Cloud-Anbieter, darunter Azure, unterstützt.

**Traffic Manager**  
Azure DNS-basierter Verkehrs-Lastausgleich zur Verteilung des Traffics über globale Azure-Regionen.

## U

**URI**  
Uniform Resource Identifier. String, der eine bestimmte Ressource identifiziert.

**URL**  
Uniform Resource Locator. Typ von URI, der angibt, wo sich eine Ressource befindet und wie sie abgerufen werden kann.

## V

**Virtual Network (VNet)**  
Grundbaustein für private Netzwerke in Azure, der Isolation und Segmentierung bietet.

**VS Code**  
Visual Studio Code. Beliebter Code-Editor mit hervorragender Azure- und azd-Integration.

## W

**Webhook**  
HTTP-Rückruf, der durch bestimmte Ereignisse ausgelöst wird, häufig in CI/CD-Pipelines verwendet.

**What-if**  
Azure-Funktion, die zeigt, welche Änderungen durch eine Bereitstellung vorgenommen würden, ohne diese tatsächlich auszuführen.

## Y

**YAML**  
YAML Ain't Markup Language. Menschlich lesbarer Daten-Serialisierungsstandard, der für Konfigurationsdateien wie azure.yaml verwendet wird.

## Z

**Zone**  
Physisch getrennte Standorte innerhalb einer Azure-Region, die Redundanz und hohe Verfügbarkeit bieten.

---

## Häufige Akronyme

| Akronym | Vollständige Bezeichnung | Beschreibung |
|---------|-----------------------|-------------|
| AAD | Azure Active Directory (jetzt Microsoft Entra ID) | Identitäts- und Zugriffsverwaltungsdienst |
| ACR | Azure Container Registry | Dienst zur Verwaltung von Container-Images |
| AKS | Azure Kubernetes Service | Verwalteter Kubernetes-Dienst |
| API | Application Programming Interface | Satz von Protokollen zur Softwareentwicklung |
| ARM | Azure Resource Manager | Azure-Dienst für Bereitstellung und Verwaltung |
| CDN | Content Delivery Network | Verteiltes Netzwerk von Servern |
| CI/CD | Continuous Integration/Continuous Deployment | Automatisierte Entwicklungspraktiken |
| CLI | Command Line Interface | Textbasierte Benutzerschnittstelle |
| DNS | Domain Name System | System zur Übersetzung von Domainnamen in IP-Adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Sichere Version von HTTP |
| IaC | Infrastructure as Code | Verwaltung von Infrastruktur über Code |
| JSON | JavaScript Object Notation | Datenaustauschformat |
| JWT | JSON Web Token | Tokenformat für sichere Informationsübertragung |
| KQL | Kusto Query Language | Abfragesprache für Azure-Datendienste |
| RBAC | Role-Based Access Control | Zugriffskontrolle basierend auf Benutzerrollen |
| REST | Representational State Transfer | Architekturstil für Webdienste |
| SDK | Software Development Kit | Sammlung von Entwicklerwerkzeugen |
| SLA | Service Level Agreement | Verpflichtung zu Dienstverfügbarkeit/-leistung |
| SQL | Structured Query Language | Sprache zur Verwaltung relationaler Datenbanken |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptographische Protokolle |
| URI | Uniform Resource Identifier | String zur Identifizierung einer Ressource |
| URL | Uniform Resource Locator | URI-Typ, der den Ort einer Ressource angibt |
| VM | Virtual Machine | Emulation eines Computersystems |
| VNet | Virtual Network | Privates Netzwerk in Azure |
| YAML | YAML Ain't Markup Language | Daten-Serialisierungsstandard |

---

## Azure Dienstnamen-Zuordnungen

| Gängiger Name | Offizieller Azure-Dienstname | azd Host-Typ |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Datenbank | Azure Database for PostgreSQL | Infrastruktur-Ressource, keine Anwendung `host` |
| NoSQL DB | Azure Cosmos DB | Infrastruktur-Ressource, keine Anwendung `host` |
| Storage | Azure Storage Account | Infrastruktur-Ressource, keine integrierte Anwendung `host` |
| Cache | Azure Managed Redis | Infrastruktur-Ressource, keine Anwendung `host` |
| Suche | Azure AI Search | Infrastruktur-Ressource, keine Anwendung `host` |
| Messaging | Azure Service Bus | Infrastruktur-Ressource, keine Anwendung `host` |

`services.<name>.host` wählt ein Anwendungsbereitstellungsziel; es ist keine Abkürzung für einen Azure-Ressourcentyp. Datenbanken, Caches, Suchdienste und Warteschlangen werden normalerweise über den Infrastruktur-Provider bereitgestellt und über Ausgaben/Konfiguration mit der Anwendung verbunden.

---

## Kontextbezogene Begriffe

### Entwicklungsbegriffe
- **Hot Reload**: Automatisches Aktualisieren von Anwendungen während der Entwicklung ohne Neustart
- **Build-Pipeline**: Automatisierter Prozess zur Erstellung und Prüfung von Code
- **Deployment Slot**: Staging-Umgebung innerhalb eines App Service
- **Environment Parity**: Entwicklung, Staging und Produktion ähnlich halten

### Sicherheitsbegriffe
- **Managed Identity**: Azure-Feature zur automatischen Anmeldeinformationenverwaltung
- **Key Vault**: Sicherer Speicher für Geheimnisse, Schlüssel und Zertifikate
- **RBAC**: Rollenbasierte Zugriffskontrolle für Azure-Ressourcen
- **Network Security Group**: Virtuelle Firewall zur Steuerung des Netzwerkverkehrs

### Überwachungsbegriffe
- **Telemetry**: Automatisierte Sammlung von Messungen und Daten
- **Application Performance Monitoring (APM)**: Überwachung der Softwareleistung
- **Log Analytics**: Dienst zum Sammeln und Analysieren von Protokolldaten
- **Alert Rules**: Automatisierte Benachrichtigungen basierend auf Metriken oder Bedingungen

### Bereitstellungsbegriffe
- **Blue-Green Deployment**: Strategie für Bereitstellung ohne Ausfallzeit
- **Canary Deployment**: Graduelle Einführung bei einer Teilmenge von Nutzern
- **Rolling Update**: Sequenzieller Austausch von Anwendungsinstanzen
- **Rollback**: Zurücksetzen auf frühere Anwendungsfassung

---

**Verwendungstipp**: Nutzen Sie `Ctrl+F`, um schnell nach bestimmten Begriffen in diesem Glossar zu suchen. Begriffe sind dort, wo möglich, miteinander verlinkt.

---

**Navigation**
- **Vorherige Lektion**: [Spickzettel](cheat-sheet.md)
- **Nächste Lektion**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->