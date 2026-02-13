# Änderungsprotokoll - AZD For Beginners

## Einführung

Dieses Änderungsprotokoll dokumentiert alle bemerkenswerten Änderungen, Aktualisierungen und Verbesserungen am Repository AZD For Beginners. Wir folgen den Prinzipien des Semantic Versioning und führen dieses Protokoll, um Benutzern zu helfen zu verstehen, was sich zwischen den Versionen geändert hat.

## Lernziele

Durch das Durchsehen dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und Inhaltszusätze informiert bleiben
- Verbesserungen der bestehenden Dokumentation verstehen
- Fehlerbehebungen und Korrekturen nachverfolgen, um die Genauigkeit sicherzustellen
- Die Entwicklung der Lernmaterialien im Laufe der Zeit verfolgen

## Lernergebnisse

Nach Durchsicht der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und verfügbare Ressourcen zum Lernen zu identifizieren
- Zu verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernpfad basierend auf den aktuellsten Materialien zu planen
- Feedback und Vorschläge für zukünftige Verbesserungen beizutragen

## Versionsverlauf

### [v3.17.0] - 2026-02-05

#### Kursnavigation Verbesserung
**Diese Version verbessert die Kapitel-Navigation in README.md mit einem erweiterten Tabellenformat.**

#### Geändert
- **Course Map Table**: Verbesserte direkte Lektionen-Links, Dauerabschätzungen und Komplexitätsbewertungen
- **Folder Cleanup**: Entfernte redundante alte Ordner (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Alle 21+ internen Links in der Course Map-Tabelle überprüft

### [v3.16.0] - 2026-02-05

#### Produktnamen-Aktualisierungen
**Diese Version aktualisiert Produktbezeichnungen auf das aktuelle Microsoft-Branding.**

#### Geändert
- **Azure AI Foundry → Microsoft Foundry**: Alle Verweise in nicht-übersetzten Dateien aktualisiert
- **Azure AI Agent Service → Foundry Agents**: Dienstname wurde aktualisiert, um das aktuelle Branding widerzuspiegeln

#### Dateien aktualisiert
- `README.md` - Hauptseite des Kurses
- `changelog.md` - Versionsverlauf
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-Agents-Leitfaden
- `examples/README.md` - Beispiele-Dokumentation
- `workshop/README.md` - Workshop-Startseite
- `workshop/docs/index.md` - Workshop-Index
- `workshop/docs/instructions/*.md` - Alle Workshop-Anleitungsdateien

---

### [v3.15.0] - 2026-02-05

#### Umfangreiche Repository-Umstrukturierung: Kapitelbasierte Ordnernamen
**Diese Version strukturiert die Dokumentation in dedizierte Kapitelordner für klarere Navigation um.**

#### Ordnerumbenennungen
Alte Ordner wurden durch kapitelnummerierte Ordner ersetzt:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Hinzugefügt: `docs/chapter-05-multi-agent/`

#### Dateimigrationen
| Datei | Von | Zu |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hinzugefügt
- **📚 Kapitel-README-Dateien**: README.md in jedem Kapitelordner erstellt mit:
  - Lernziele und Dauer
  - Lektionstabelle mit Beschreibungen
  - Schnellstartbefehle
  - Navigation zu anderen Kapiteln

#### Geändert
- **🔗 Alle internen Links aktualisiert**: 78+ Pfade in allen Dokumentationsdateien aktualisiert
- **🗺️ Haupt-README.md**: Course Map mit neuer Kapitelstruktur aktualisiert
- **📝 examples/README.md**: Querverweise zu Kapitelordnern aktualisiert

#### Entfernt
- Alte Ordnerstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-Umstrukturierung: Kapitel-Navigation
**Diese Version fügte Kapitel-Navigations-README-Dateien hinzu (durch v3.15.0 ersetzt).**

---

### [v3.13.0] - 2026-02-05

#### Neuer AI-Agents-Leitfaden
**Diese Version fügt einen umfassenden Leitfaden zum Bereitstellen von AI-Agents mit der Azure Developer CLI hinzu.**

#### Hinzugefügt
- **🤖 docs/microsoft-foundry/agents.md**: Vollständiger Leitfaden mit:
  - Was AI-Agents sind und wie sie sich von Chatbots unterscheiden
  - Drei Quick-Start-Agenten-Vorlagen (Foundry Agents, Prompty, RAG)
  - Agenten-Architektur-Muster (Single Agent, RAG, Multi-Agent)
  - Tool-Konfiguration und Anpassung
  - Überwachung und Metrikverfolgung
  - Kostenbetrachtungen und Optimierung
  - Häufige Fehlerbehebungsszenarien
  - Drei praktische Übungen mit Erfolgskriterien

#### Inhaltsstruktur
- **Einführung**: Agenten-Konzepte für Anfänger
- **Quick Start**: Agenten bereitstellen mit `azd init --template get-started-with-ai-agents`
- **Architektur-Muster**: Visuelle Diagramme von Agentenmustern
- **Konfiguration**: Tool-Setup und Umgebungsvariablen
- **Überwachung**: Integration von Application Insights
- **Übungen**: Progressive praktische Übungen (je 20–45 Minuten)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-Umgebung Aktualisierung
**Diese Version aktualisiert die Konfiguration des Development Containers mit modernen Tools und besseren Voreinstellungen für das AZD-Lernerlebnis.**

#### Geändert
- **🐳 Basis-Image**: Aktualisiert von `python:3.12-bullseye` zu `python:3.12-bookworm` (neueste Debian-Stable)
- **📛 Container-Name**: Umbenannt von "Python 3" zu "AZD for Beginners" zur Klarstellung

#### Hinzugefügt
- **🔧 Neue Dev Container-Funktionen**:
  - `azure-cli` mit aktiviertem Bicep-Support
  - `node:20` (LTS-Version für AZD-Vorlagen)
  - `github-cli` zur Vorlagenverwaltung
  - `docker-in-docker` für Container-App-Bereitstellungen

- **🔌 Portweiterleitung**: Vorgefertigte Ports für gängige Entwicklung:
  - 8000 (MkDocs-Vorschau)
  - 3000 (Web-Apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Neue VS Code-Erweiterungen**:
  - `ms-python.vscode-pylance` - Verbesserte Python-IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-Unterstützung
  - `ms-azuretools.vscode-docker` - Docker-Unterstützung
  - `ms-azuretools.vscode-bicep` - Bicep-Sprachunterstützung
  - `ms-azure-devtools.azure-resource-groups` - Azure-Ressourcenverwaltung
  - `yzhang.markdown-all-in-one` - Markdown-Bearbeitung
  - `DavidAnson.vscode-markdownlint` - Markdown-Linting
  - `bierner.markdown-mermaid` - Mermaid-Diagramm-Unterstützung
  - `redhat.vscode-yaml` - YAML-Unterstützung (für azure.yaml)
  - `eamodio.gitlens` - Git-Visualisierung
  - `mhutchie.git-graph` - Git-Historie

- **⚙️ VS Code-Einstellungen**: Standard-Einstellungen für Python-Interpreter, Formatierung beim Speichern und Entfernen von Leerzeichen hinzugefügt

- **📦 Aktualisierte requirements-dev.txt**:
  - MkDocs minify-Plugin hinzugefügt
  - pre-commit für Code-Qualität hinzugefügt
  - Azure SDK-Pakete hinzugefügt (azure-identity, azure-mgmt-resource)

#### Behoben
- **Post-Create-Befehl**: Überprüft jetzt die Installation von AZD und Azure CLI beim Start des Containers

---

### [v3.11.0] - 2026-02-05

#### Einsteigerfreundliche README-Überarbeitung
**Diese Version verbessert README.md deutlich, um einsteigerfreundlicher zu sein, und fügt wichtige Ressourcen für AI-Entwickler hinzu.**

#### Hinzugefügt
- **🆚 Azure CLI vs AZD Vergleich**: Klare Erklärung, wann welches Tool verwendet werden sollte, mit praktischen Beispielen
- **🌟 Awesome AZD Links**: Direkte Links zur Community-Vorlagengalerie und zu Beitragsressourcen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ einsatzbereite Vorlagen
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-Beitrag
- **🎯 Schnellstart-Anleitung**: Vereinfachte 3-Schritte-Einführung (Install → Login → Deploy)
- **📊 Erfahrungsgestützte Navigations-Tabelle**: Klare Anleitung, wo man basierend auf der Entwicklererfahrung beginnen sollte

#### Geändert
- **README-Struktur**: Umorganisiert für progressive Offenlegung - wichtige Informationen zuerst
- **Einführungsabschnitt**: Neu formuliert, um "The Magic of `azd up`" für vollständige Anfänger zu erklären
- **Doppelte Inhalte entfernt**: Doppelten Troubleshooting-Abschnitt entfernt
- **Troubleshooting-Befehle**: `azd logs`-Verweis korrigiert auf gültiges `azd monitor --logs`

#### Behoben
- **🔐 Authentifizierungsbefehle**: `azd auth login` und `azd auth logout` zur cheat-sheet.md hinzugefügt
- **Ungültige Befehlsverweise**: Verbleibende `azd logs`-Vorkommen im README-Troubleshooting-Abschnitt entfernt

#### Hinweise
- **Umfang**: Änderungen angewendet auf Haupt-README.md und resources/cheat-sheet.md
- **Zielgruppe**: Verbesserungen speziell für Entwickler mit wenig AZD-Erfahrung

---

### [v3.10.0] - 2026-02-05

#### Korrektur der Azure Developer CLI-Befehle
**Diese Version korrigiert nicht vorhandene AZD-Befehle in der gesamten Dokumentation, sodass alle Codebeispiele gültige Azure Developer CLI-Syntax verwenden.**

#### Behoben
- **🔧 Nicht vorhandene AZD-Befehle entfernt**: Umfassende Prüfung und Korrektur ungültiger Befehle:
  - `azd logs` (existiert nicht) → ersetzt durch `azd monitor --logs` oder Azure CLI-Alternativen
  - `azd service` Subbefehle (existieren nicht) → ersetzt durch `azd show` und Azure CLI
  - `azd infra import/export/validate` (existieren nicht) → entfernt oder durch gültige Alternativen ersetzt
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` Flags (existieren nicht) → entfernt
  - `azd provision --what-if/--rollback` Flags (existieren nicht) → auf `--preview` aktualisiert
  - `azd config validate` (existiert nicht) → ersetzt durch `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existieren nicht) → entfernt

- **📚 Dateien mit Befehlskorrekturen**:
  - `resources/cheat-sheet.md`: Größere Überarbeitung der Befehlsreferenz
  - `docs/deployment/deployment-guide.md`: Rollback- und Bereitstellungsstrategien korrigiert
  - `docs/troubleshooting/debugging.md`: Abschnitte zur Protokollanalyse korrigiert
  - `docs/troubleshooting/common-issues.md`: Troubleshooting-Befehle aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD-Debugging-Abschnitt korrigiert
  - `docs/getting-started/azd-basics.md`: Überwachungsbefehle korrigiert
  - `docs/getting-started/first-project.md`: Überwachungs- und Debugging-Beispiele aktualisiert
  - `docs/getting-started/installation.md`: Hilfe- und Versionsbeispiele korrigiert
  - `docs/pre-deployment/application-insights.md`: Befehle zur Protokollanzeige korrigiert
  - `docs/pre-deployment/coordination-patterns.md`: Agenten-Debugging-Befehle korrigiert

- **📝 Versionsverweis aktualisiert**:
  - `docs/getting-started/installation.md`: Feste Version `1.5.0` durch generische `1.x.x` mit Link zu Releases ersetzt

#### Geändert
- **Rollback-Strategien**: Dokumentation aktualisiert, um git-basierte Rollbacks zu verwenden (AZD hat keinen nativen Rollback)
- **Protokollanzeige**: `azd logs`-Verweise durch `azd monitor --logs`, `azd monitor --live` und Azure CLI-Befehle ersetzt
- **Leistungsabschnitt**: Nicht vorhandene parallel/incremental Bereitstellungsflags entfernt und gültige Alternativen bereitgestellt

#### Technische Details
- **Gültige AZD-Befehle**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gültige azd monitor-Flags**: `--live`, `--logs`, `--overview`
- **Entfernte Funktionen**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Hinweise
- **Überprüfung**: Befehle validiert gegen Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Abschluss des Workshops und Aktualisierung der Dokumentationsqualität
**Diese Version vervollständigt die interaktiven Workshop-Module, behebt alle defekten Dokumentationslinks und verbessert die gesamte Inhaltsqualität für KI-Entwickler, die Microsoft AZD verwenden.**

#### Hinzugefügt
- **📝 CONTRIBUTING.md**: Neues Dokument mit Beitragsrichtlinien mit:
  - Klare Anweisungen zum Melden von Problemen und Vorschlagen von Änderungen
  - Dokumentationsstandards für neue Inhalte
  - Richtlinien für Codebeispiele und Konventionen für Commit-Nachrichten
  - Informationen zur Community-Beteiligung

#### Abgeschlossen
- **🎯 Workshop-Modul 7 (Abschluss)**: Vollständig abgeschlossenes Abschlussmodul mit:
  - Umfassende Zusammenfassung der Workshop-Ergebnisse
  - Abschnitt zu den erlernten Schlüsselkonzepten, der AZD, Vorlagen und AI Foundry abdeckt
  - Empfehlungen zur Fortsetzung der Lernreise
  - Workshop-Herausforderungen mit Schwierigkeitsbewertungen
  - Links für Community-Feedback und Unterstützung

- **📚 Workshop-Modul 3 (Deconstruct)**: Lernziele aktualisiert mit:
  - Anleitung zur Aktivierung von GitHub Copilot mit MCP-Servern
  - Verständnis der AZD-Vorlagen-Ordnerstruktur
  - Organisationsmuster für Infrastructure-as-Code (Bicep)
  - Praktische Laboranleitungen

- **🔧 Workshop-Modul 6 (Teardown)**: Abgeschlossen mit:
  - Ziele zur Ressourcenbereinigung und Kostenverwaltung
  - Verwendung von `azd down` für sicheres Deprovisioning von Infrastruktur
  - Anleitung zur Wiederherstellung von soft-gelöschten Cognitive Services
  - Bonus-Erkundungsaufgaben für GitHub Copilot und das Azure-Portal

#### Behoben
- **🔗 Fehlerhafte Links behoben**: Über 15 fehlerhafte interne Dokumentationslinks behoben:
  - `docs/ai-foundry/ai-model-deployment.md`: Pfade zu microsoft-foundry-integration.md korrigiert
  - `docs/troubleshooting/ai-troubleshooting.md`: Pfade zu ai-model-deployment.md und production-ai-practices.md korrigiert
  - `docs/getting-started/first-project.md`: Nicht vorhandene cicd-integration.md durch deployment-guide.md ersetzt
  - `examples/retail-scenario.md`: Pfade zu FAQ- und Fehlerbehebungsanleitung korrigiert
  - `examples/container-app/microservices/README.md`: Pfade zur Kursübersicht und zur Deployment-Anleitung korrigiert
  - `resources/faq.md` und `resources/glossary.md`: Verweise im KI-Kapitel aktualisiert
  - `course-outline.md`: Verweise auf Dozentenleitfaden und KI-Workshop-Labs korrigiert

- **📅 Workshop-Statusbanner**: Vom "Under Construction" auf aktiven Workshop-Status mit Datum Februar 2026 aktualisiert

- **🔗 Workshop-Navigation**: Fehlerhafte Navigationslinks in Workshop README.md behoben, die auf den nicht vorhandenen Ordner lab-1-azd-basics verweisen

#### Geändert
- **Workshop-Präsentation**: "under construction"-Warnung entfernt, Workshop ist jetzt abgeschlossen und einsatzbereit
- **Navigationskonsistenz**: Sicherstellung, dass alle Workshop-Module eine ordnungsgemäße Navigation zwischen Modulen haben
- **Verweise im Lernpfad**: Kapitelquerverweise aktualisiert, um die richtigen microsoft-foundry-Pfade zu verwenden

#### Validiert
- ✅ Alle englischen Markdown-Dateien haben gültige interne Links
- ✅ Workshop-Module 0-7 sind mit Lernzielen vollständig
- ✅ Die Navigation zwischen Kapiteln und Modulen funktioniert korrekt
- ✅ Inhalte sind für KI-Entwickler geeignet, die Microsoft AZD verwenden
- ✅ Einsteigerfreundliche Sprache und Struktur wurden beibehalten
- ✅ CONTRIBUTING.md bietet klare Anleitung für Community-Mitwirkende

#### Technische Implementierung
- **Link-Validierung**: Automatisiertes PowerShell-Skript hat alle .md-internen Links überprüft
- **Inhaltsprüfung**: Manuelle Überprüfung der Vollständigkeit des Workshops und der Eignung für Einsteiger
- **Navigationssystem**: Konsistente Navigationsmuster für Kapitel und Module angewendet

#### Hinweise
- **Umfang**: Änderungen nur an der englischen Dokumentation vorgenommen
- **Übersetzungen**: Übersetzungsordner in dieser Version nicht aktualisiert (automatisierte Übersetzung wird später synchronisiert)
- **Dauer des Workshops**: Der vollständige Workshop bietet jetzt 3-4 Stunden praxisorientiertes Lernen

---

### [v3.8.0] - 2025-11-19

#### Erweitertes Dokumentationspaket: Monitoring, Sicherheit und Multi-Agenten-Muster
**Diese Version fügt umfassende A-Qualitätslektionen zur Integration von Application Insights, Authentifizierungs-Mustern und Multi-Agenten-Koordination für Produktionsbereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-orientierte Bereitstellung mit automatischer Provisionierung
  - Vollständige Bicep-Vorlagen für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (1,200+ lines)
  - AI/LLM-Monitoring-Muster (Azure OpenAI token/cost tracking)
  - 6 Mermaid-Diagramme (Architektur, verteiltes Tracing, Telemetriefluss)
  - 3 praktische Übungen (Alerts, Dashboards, AI-Monitoring)
  - Kusto-Abfragebeispiele und Strategien zur Kostenoptimierung
  - Live-Metriken-Streaming und Echtzeit-Debugging
  - 40-50 minute learning time with production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 Authentifizierungs-Muster (connection strings, Key Vault, managed identity)
  - Vollständige Bicep-Infrastruktursvorlagen für sichere Bereitstellungen
  - Node.js-Anwendungscode mit Azure SDK-Integration
  - 3 vollständige Übungen (enable managed identity, user-assigned identity, Key Vault rotation)
  - Sicherheitsbest Practices und RBAC-Konfigurationen
  - Fehlerbehebungsleitfaden und Kostenanalyse
  - Produktionsreife passwortlose Authentifizierungsmuster

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequential, parallel, hierarchical, event-driven, consensus)
  - Vollständige Orchestrator-Service-Implementierung (Python/Flask, 1,500+ lines)
  - 3 spezialisierte Agentenimplementierungen (Research, Writer, Editor)
  - Service Bus-Integration für Nachrichtenwarteschlangen
  - Cosmos DB-Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme, die Agenteninteraktionen zeigen
  - 3 fortgeschrittene Übungen (timeout handling, retry logic, circuit breaker)
  - Kostenaufstellung ($240-565/month) mit Optimierungsstrategien
  - Application Insights-Integration für Monitoring

#### Erweitert
- **Vorbereitungs-Kapitel**: Enthält jetzt umfassende Monitoring- und Koordinationsmuster
- **Getting-Started-Kapitel**: Erweitert um professionelle Authentifizierungsmuster
- **Produktionsreife**: Vollständige Abdeckung von Sicherheit bis Beobachtbarkeit
- **Kursübersicht**: Aktualisiert, um auf neue Lektionen in Kapitel 3 und 6 zu verweisen

#### Geändert
- **Lernfortschritt**: Bessere Integration von Sicherheit und Monitoring im gesamten Kurs
- **Dokumentationsqualität**: Konsistente A-Qualitätsstandards (95-97%) in den neuen Lektionen
- **Produktionsmuster**: Vollständige End-to-End-Abdeckung für Unternehmensbereitstellungen

#### Verbessert
- **Entwicklererlebnis**: Klarer Weg von der Entwicklung bis zum Produktionsmonitoring
- **Sicherheitsstandards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Beobachtbarkeit**: Vollständige Application Insights-Integration mit AZD
- **KI-Arbeitslasten**: Spezialisierte Überwachung für Azure OpenAI und Multi-Agenten-Systeme

#### Validiert
- ✅ Alle Lektionen enthalten vollständigen, funktionierenden Code (keine Ausschnitte)
- ✅ Mermaid-Diagramme für visuelles Lernen (insgesamt 19 über 3 Lektionen)
- ✅ Praktische Übungen mit Verifikationsschritten (insgesamt 9)
- ✅ Produktionsreife Bicep-Vorlagen, die mit `azd up` bereitgestellt werden können
- ✅ Kostenanalyse und Optimierungsstrategien
- ✅ Fehlerbehebungsleitfäden und Best Practices
- ✅ Wissens-Checkpoints mit Verifikationsbefehlen

#### Dokumentations-Bewertungsergebnisse
- **docs/pre-deployment/application-insights.md**: - Umfassender Monitoring-Leitfaden
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Fortgeschrittene Multi-Agenten-Architekturen
- **Overall New Content**: - Konsistente hohe Qualitätsstandards

#### Technische Implementierung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentifizierung**: Managed Identity + Key Vault + RBAC-Muster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Monitoring**: Live-Metriken + Kusto-Abfragen + Alerts + Dashboards
- **Kostenmanagement**: Sampling-Strategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 2025-11-19

#### Verbesserungen der Dokumentationsqualität und neues Azure OpenAI-Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Azure OpenAI-Bereitstellungsbeispiel mit GPT-4-Chatoberfläche hinzu.**

#### Hinzugefügt
- **🤖 Azure OpenAI Chat Example**: Complete GPT-4 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Azure OpenAI infrastructure (GPT-4 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Added hands-on practice exercises to configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Added verification section to deployment guide:
  - Health check procedures
  - Success criteria checklist
  - Expected outputs for all deployment commands
  - Troubleshooting quick reference

#### Erweitert
- **examples/README.md**: Updated to A-grade quality (93%):
  - Added azure-openai-chat to all relevant sections
  - Updated local example count from 3 to 4
  - Added to AI Application Examples table
  - Integrated into Quick Start for Intermediate Users
  - Added to Microsoft Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### Geändert
- **Learning Progression**: Better integration of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises with clear outcomes
- **Verification Process**: Explicit success criteria added to key workflows

#### Verbessert
- **Developer Experience**: Azure OpenAI deployment now takes 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Azure OpenAI example
- **Learning Path**: AI developers have clear entry point with azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Validiert
- ✅ Azure OpenAI example fully functional with `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index accurately reflects 4 local examples
- ✅ No duplicate external links in tables
- ✅ All navigation references correct

#### Technische Implementierung
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Großes Update: Container-App-Bereitstellungsbeispiele
**Diese Version führt umfassende, produktionsreife Beispiele für die Bereitstellung von Container-Anwendungen mit der Azure Developer CLI (AZD) ein, mit vollständiger Dokumentation und Integration in den Lernpfad.**

#### Hinzugefügt
- **🚀 Container-App-Beispiele**: Neue lokale Beispiele in `examples/container-app/`:
  - [Hauptanleitung](examples/container-app/README.md): Vollständiger Überblick über containerisierte Bereitstellungen, Quickstart, Produktion und fortgeschrittene Muster
  - [Einfaches Flask-API](../../examples/container-app/simple-flask-api): Einsteigerfreundliche REST-API mit scale-to-zero, Health-Probes, Monitoring und Fehlerbehebung
  - [Microservices-Architektur](../../examples/container-app/microservices): Produktionsreife Multi-Service-Bereitstellung (API Gateway, Product, Order, User, Notification), asynchrones Messaging, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary-Bereitstellung
- **Best Practices**: Sicherheit, Monitoring, Kostenoptimierung und CI/CD-Anleitungen für containerisierte Workloads
- **Code-Beispiele**: Vollständige `azure.yaml`, Bicep-Vorlagen und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- **Tests & Fehlerbehebung**: End-to-End-Test-Szenarien, Monitoring-Befehle, Anleitungen zur Fehlerbehebung

#### Geändert
- **README.md**: Aktualisiert, um neue Container-App-Beispiele unter 'Lokale Beispiele - Container-Anwendungen' hervorzuheben und zu verlinken
- **examples/README.md**: Aktualisiert, um Container-App-Beispiele hervorzuheben, Einträge in der Vergleichsmatrix hinzuzufügen und Technologie-/Architekturverweise zu aktualisieren
- **Course Outline & Study Guide**: Aktualisiert, um in den relevanten Kapiteln auf neue Container-App-Beispiele und Bereitstellungsmuster zu verweisen

#### Validated
- ✅ Alle neuen Beispiele mit `azd up` bereitstellbar und folgen Best Practices
- ✅ Dokumentations-Querverweise und Navigation aktualisiert
- ✅ Beispiele decken Szenarien von Einsteiger- bis Fortgeschrittenen-Niveau ab, einschließlich Produktions-Microservices

#### Notes
- **Scope**: Nur englische Dokumentation und Beispiele
- **Next Steps**: Erweiterung um zusätzliche fortgeschrittene Container-Muster und CI/CD-Automatisierung in zukünftigen Releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**This version implements a comprehensive product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, reflecting Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Aktualisiert alle Verweise in der englischen Dokumentation im Ordner `docs/`
  - Umbenannter Ordner: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Umbenannte Datei: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt: 23 Inhaltsverweise in 7 Dokumentationsdateien aktualisiert

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` umbenannt in `docs/microsoft-foundry/`
  - Alle Querverweise aktualisiert, um die neue Ordnerstruktur widerzuspiegeln
  - Navigationslinks in der gesamten Dokumentation validiert

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links wurden aktualisiert, um den neuen Dateinamen zu referenzieren

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Navigationslink-Updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamensverweise aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bereits verwendet Microsoft Foundry (aus vorherigen Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Verweise aktualisiert (Übersicht, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweis-Links aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zum nächsten Kapitel aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Verweise aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Course Structure Files** (2 files):
  - `README.md` - 17 Verweise aktualisiert (Kursübersicht, Kapitelüberschriften, Vorlagenabschnitt, Community-Einblicke)
  - `course-outline.md` - 14 Verweise aktualisiert (Übersicht, Lernziele, Kapitelressourcen)

#### Validated
- ✅ Keine verbleibenden "ai-foundry" Ordnerpfad-Verweise in den englischen Docs
- ✅ Keine verbleibenden "Microsoft Foundry" Produktnamen-Verweise in den englischen Docs
- ✅ Alle Navigationslinks funktionieren mit der neuen Ordnerstruktur
- ✅ Datei- und Ordnerumbenennungen erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln validiert

#### Notes
- **Scope**: Änderungen nur auf die englische Dokumentation im Ordner `docs/` angewendet
- **Translations**: Übersetzungsordner (`translations/`) in dieser Version nicht aktualisiert
- **Workshop**: Workshop-Materialien (`workshop/`) in dieser Version nicht aktualisiert
- **Examples**: Beispiel-Dateien können weiterhin Legacy-Namen referenzieren (wird in einem zukünftigen Update adressiert)
- **External Links**: Externe URLs und GitHub-Repository-Verweise bleiben unverändert

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Comprehensive coverage of the new infrastructure preview capability
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration in das Provisioning-Handbuch mit Anwendungsfällen und Vorteilen
  - Integration von Pre-Flight-Checks für sicherere Bereitstellungsvalidierung
  - Updates der Einstiegshilfe mit sicherheitsorientierten Bereitstellungspraktiken
- **🚧 Workshop Status Banner**: Professionelles HTML-Banner, das den Entwicklungsstatus des Workshops anzeigt
  - Verlaufdesign mit Baustellenindikatoren zur klaren Benutzerkommunikation
  - Zeitstempel "zuletzt aktualisiert" für Transparenz
  - Mobil-responsives Design für alle Gerätetypen

#### Enhanced
- **Infrastructure Safety**: Preview-Funktionalität in der gesamten Bereitstellungsdokumentation integriert
- **Pre-deployment Validation**: Automatisierte Skripte enthalten jetzt Infrastruktur-Preview-Tests
- **Developer Workflow**: Aktualisierte Befehlssequenzen, die Preview als Best Practice einschließen
- **Workshop Experience**: Klare Erwartungen für Benutzer hinsichtlich des Entwicklungsstatus der Inhalte gesetzt

#### Changed
- **Deployment Best Practices**: Preview-first-Workflow nun empfohlener Ansatz
- **Documentation Flow**: Infrastrukturvalidierung früher im Lernprozess platziert
- **Workshop Presentation**: Professionelle Statuskommunikation mit klarem Entwicklungszeitplan

#### Improved
- **Safety-First Approach**: Infrastrukturänderungen können jetzt vor der Bereitstellung validiert werden
- **Team Collaboration**: Preview-Ergebnisse können zur Überprüfung und Freigabe geteilt werden
- **Cost Awareness**: Besseres Verständnis der Ressourcenkosten vor der Provisionierung
- **Risk Mitigation**: Reduzierte Bereitstellungsfehler durch Vorausvalidierung

#### Technical Implementation
- **Multi-document Integration**: Preview-Funktion in 4 wichtigen Dateien dokumentiert
- **Command Patterns**: Konsistente Syntax und Beispiele in der gesamten Dokumentation
- **Best Practice Integration**: Preview in Validierungs-Workflows und Skripten integriert
- **Visual Indicators**: Klare NEW-Feature-Kennzeichnungen für bessere Auffindbarkeit

#### Workshop Infrastructure
- **Status Communication**: Professionelles HTML-Banner mit Verlaufsstil
- **User Experience**: Klarer Entwicklungsstatus verhindert Verwirrung
- **Professional Presentation**: Erhält die Glaubwürdigkeit des Repositories und setzt Erwartungen
- **Timeline Transparency**: Oktober 2025 "zuletzt aktualisiert" Zeitstempel zur Verantwortlichkeit

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser-basierte Workshop-Erfahrung mit MkDocs-Preview-Funktionalität
- **📝 Structured Workshop Instructions**: 7-stufiger geführter Lernpfad von Entdeckung bis Anpassung
  - 0-Introduction: Workshop-Übersicht und Einrichtung
  - 1-Select-AI-Template: Vorlagenerkennung und Auswahlprozess
  - 2-Validate-AI-Template: Bereitstellungs- und Validierungsverfahren
  - 3-Deconstruct-AI-Template: Verständnis der Template-Architektur
  - 4-Configure-AI-Template: Konfiguration und Anpassung
  - 5-Customize-AI-Template: Fortgeschrittene Modifikationen und Iterationen
  - 6-Teardown-Infrastructure: Aufräumen und Ressourcenmanagement
  - 7-Wrap-up: Zusammenfassung und nächste Schritte
- **🛠️ Workshop Tooling**: MkDocs-Konfiguration mit Material-Theme für ein verbessertes Lernerlebnis
- **🎯 Hands-On Learning Path**: 3-stufige Methodik (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Nahtlose Einrichtung der Entwicklungsumgebung

#### Enhanced
- **AI Workshop Lab**: Erweitert um ein umfassendes strukturiertes Lernangebot von 2–3 Stunden
- **Workshop Documentation**: Professionelle Präsentation mit Navigation und visuellen Hilfsmitteln
- **Learning Progression**: Klare Schritt-für-Schritt-Anleitung von der Vorlagenauswahl bis zur Produktionsbereitstellung
- **Developer Experience**: Integrierte Tools für optimierte Entwicklungs-Workflows

#### Improved
- **Accessibility**: Browserbasierte Oberfläche mit Suche, Kopierfunktion und Theme-Umschaltung
- **Self-Paced Learning**: Flexibler Workshop-Aufbau, der unterschiedliche Lerngeschwindigkeiten berücksichtigt
- **Practical Application**: Realistische AI-Template-Bereitstellungsszenarien
- **Community Integration**: Discord-Integration für Workshop-Unterstützung und Zusammenarbeit

#### Workshop Features
- **Built-in Search**: Schnelle Stichwort- und Lektionensuche
- **Copy Code Blocks**: Hover-to-copy-Funktionalität für alle Codebeispiele
- **Theme Toggle**: Unterstützung für Dunkel-/Hellmodus je nach Präferenz
- **Visual Assets**: Screenshots und Diagramme zur besseren Verständlichkeit
- **Help Integration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Gesamter Kurs in 8 progressive Lernkapitel umstrukturiert
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Konsistente Navigationskopf- und -fußzeilen in der gesamten Dokumentation
- **🎯 Progress Tracking**: Checkliste zum Kursabschluss und Lernverifikation
- **🗺️ Learning Path Guidance**: Klare Einstiegspunkte für verschiedene Erfahrungsstufen und Ziele
- **🔗 Cross-Reference Navigation**: Verwandte Kapitel und Voraussetzungen klar verlinkt

#### Enhanced
- **README Structure**: Umgewandelt in eine strukturierte Lernplattform mit kapitelbasierter Organisation
- **Documentation Navigation**: Jede Seite enthält jetzt Kapitelkontext und Fortschrittsleitfaden
- **Template Organization**: Beispiele und Vorlagen den passenden Lernkapiteln zugeordnet
- **Resource Integration**: Spickzettel, FAQs und Studienführer mit relevanten Kapiteln verknüpft
- **Workshop Integration**: Hands-on-Labs mehreren Kapitel-Lernzielen zugeordnet

#### Changed
- **Learning Progression**: Übergang von linearer Dokumentation zu flexiblem kapitelbasiertem Lernen
- **Configuration Placement**: Konfigurationsanleitung als Kapitel 3 für besseren Lernfluss verschoben
- **AI Content Integration**: Bessere Integration KI-spezifischer Inhalte über die gesamte Lernreise
- **Production Content**: Fortgeschrittene Muster in Kapitel 8 für Unternehmenskunden konsolidiert

#### Improved
- **User Experience**: Klare Navigations-Breadcrumbs und Kapitel-Fortschrittsindikatoren
- **Accessibility**: Konsistente Navigationsmuster für einfachere Kursdurchquerung
- **Professional Presentation**: Universitätsähnliche Kursstruktur, geeignet für akademische und unternehmensbezogene Schulungen
- **Learning Efficiency**: Weniger Zeitaufwand, um relevante Inhalte durch verbesserte Organisation zu finden

#### Technical Implementation
- **Navigation Headers**: Standardisierte Kapitel-Navigation in über 40 Dokumentationsdateien
- **Footer Navigation**: Konsistente Fortschrittsleitfäden und Kapitelabschlussindikatoren
- **Cross-Linking**: Umfassendes internes Verlinkungssystem, das verwandte Konzepte verbindet
- **Chapter Mapping**: Vorlagen und Beispiele klar mit Lernzielen verknüpft

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Studienführer umstrukturiert, um mit dem 8-Kapitel-System übereinzustimmen
- **🎯 Chapter-Based Assessment**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Progress Tracking**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Abschluss-Checklisten
- **❓ Assessment Questions**: Wissensvalidierungsfragen für jedes Kapitel mit beruflichen Ergebnissen
- **🛠️ Practical Exercises**: Praxisnahe Aktivitäten mit echten Bereitstellungsszenarien und Fehlerbehebung
- **📊 Skill Progression**: Deutlicher Fortschritt von Grundkonzepten bis zu Enterprise-Mustern mit Schwerpunkt Karriereentwicklung
- **🎓 Certification Framework**: Berufliche Entwicklungsziele und Community-Anerkennungssystem
- **⏱️ Timeline Management**: Strukturierter 10-Wochen-Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: "Cora agent" durch "Customer agent" in der gesamten Retail-Multi-Agent-Lösung ersetzt, um ein klareres Verständnis zu fördern
- **Agent Architecture**: Alle Dokumentationen, ARM-Templates und Code-Beispiele aktualisiert, um konsistente "Customer agent"-Benennung zu verwenden
- **Configuration Examples**: Modernisierte Agentenkonfigurationsmuster mit aktualisierten Namenskonventionen
- **Documentation Consistency**: Sicherstellung, dass alle Verweise professionelle, beschreibende Agentennamen verwenden

#### Enhanced
- **ARM Template Package**: Aktualisiertes retail-multiagent-arm-template mit Customer agent-Verweisen
- **Architecture Diagrams**: Aktualisierte Mermaid-Diagramme mit überarbeiteter Agentenbenennung
- **Code Examples**: Python-Klassen und Implementierungsbeispiele verwenden jetzt CustomerAgent-Namensgebung
- **Environment Variables**: Alle Bereitstellungsskripte aktualisiert, um CUSTOMER_AGENT_NAME-Konventionen zu verwenden

#### Improved
- **Developer Experience**: Klarere Agentenrollen und Verantwortlichkeiten in der Dokumentation
- **Production Readiness**: Bessere Ausrichtung an Unternehmensbenennungskonventionen
- **Learning Materials**: Intuitivere Agentennamen für Bildungszwecke
- **Template Usability**: Vereinfachtes Verständnis von Agentenfunktionen und Bereitstellungsmustern

#### Technical Details
- Aktualisierte Mermaid-Architekturdiagramme mit CustomerAgent-Verweisen
- Ersetzte CoraAgent-Klassennamen durch CustomerAgent in Python-Beispielen
- Geänderte ARM-Template-JSON-Konfigurationen zur Verwendung des Agententyps "customer"
- Aktualisierte Umgebungsvariablen von CORA_AGENT_* zu CUSTOMER_AGENT_* Mustern
- Alle Bereitstellungsbefehle und Containerkonfigurationen aktualisiert

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Diese Version verwandelt das Repository in eine umfassende, auf KI fokussierte Lernressource mit Microsoft Foundry-Integration.**

#### Added
- **🤖 AI-First Learning Path**: Vollständige Umstrukturierung mit Priorität für KI-Entwickler und -Ingenieure
- **Microsoft Foundry Integration Guide**: Umfassende Dokumentation zur Verbindung von AZD mit Microsoft Foundry-Diensten
- **AI Model Deployment Patterns**: Detaillierte Anleitung zur Modellauswahl, Konfiguration und produktiven Bereitstellungsstrategien
- **AI Workshop Lab**: 2–3-stündiger praktischer Workshop zur Umwandlung von KI-Anwendungen in AZD-bereitstellbare Lösungen
- **Production AI Best Practices**: Unternehmensreife Muster zum Skalieren, Überwachen und Sichern von KI-Workloads
- **AI-Specific Troubleshooting Guide**: Umfassende Fehlerbehebung für Azure OpenAI, Cognitive Services und KI-Bereitstellungsprobleme
- **AI Template Gallery**: Auswahl an Microsoft Foundry-Vorlagen mit Komplexitätsbewertungen
- **Workshop Materials**: Vollständige Workshop-Struktur mit praktischen Laboren und Referenzmaterialien

#### Enhanced
- **README Structure**: Auf KI-Entwickler ausgerichtet mit 45% Community-Interesse-Daten aus dem Microsoft Foundry Discord
- **Learning Paths**: Dedizierte KI-Entwickler-Reise neben traditionellen Pfaden für Studierende und DevOps-Ingenieure
- **Template Recommendations**: Vorgestellte KI-Vorlagen einschließlich azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community Integration**: Verbesserte Discord-Community-Unterstützung mit KI-spezifischen Kanälen und Diskussionen

#### Security & Production Focus
- **Managed Identity Patterns**: KI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Cost Optimization**: Token-Nutzungsverfolgung und Budgetkontrollen für KI-Workloads
- **Multi-Region Deployment**: Strategien für globale Bereitstellung von KI-Anwendungen
- **Performance Monitoring**: KI-spezifische Metriken und Integration von Application Insights

#### Documentation Quality
- **Linear Course Structure**: Logischer Fortschritt von Anfänger- zu fortgeschrittenen KI-Bereitstellungsmustern
- **Validated URLs**: Alle externen Repository-Links überprüft und zugänglich
- **Complete Reference**: Alle internen Dokumentationslinks validiert und funktional
- **Production Ready**: Unternehmensbereite Bereitstellungsmuster mit praxisnahen Beispielen

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Diese Version stellt eine bedeutende Überarbeitung der Repository-Struktur und der Inhaltsdarstellung dar.**

#### Added
- **Structured Learning Framework**: Alle Dokumentationsseiten enthalten jetzt Einleitung, Lernziele und Lernergebnisse
- **Navigation System**: Hinzugefügte Links „Vorherige/Nächste Lektion“ in der gesamten Dokumentation für geführten Lernfortschritt
- **Study Guide**: Umfassendes study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professional Presentation**: Entfernte alle Emoji-Symbole zur Verbesserung der Barrierefreiheit und professionellen Erscheinung
- **Enhanced Content Structure**: Verbesserte Organisation und Struktur der Lernmaterialien

#### Changed
- **Documentation Format**: Vereinheitlicht alle Dokumentationen mit konsistenter, lernfokussierter Struktur
- **Navigation Flow**: Logischer Ablauf durch alle Lernmaterialien implementiert
- **Content Presentation**: Dekorative Elemente zugunsten klarer, professioneller Formatierung entfernt
- **Link Structure**: Alle internen Links zur Unterstützung des neuen Navigationssystems aktualisiert

#### Improved
- **Accessibility**: Emoji-Abhängigkeiten entfernt für bessere Kompatibilität mit Screenreadern
- **Professional Appearance**: Saubere, akademische Präsentation, geeignet für unternehmensweite Schulungen
- **Learning Experience**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Content Organization**: Bessere logische Verbindung und Ablauf zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Vollständige Getting-Started-Guide-Serie
  - Umfassende Dokumentation zu Bereitstellung und Provisioning
  - Detaillierte Ressourcen zur Fehlerbehebung und Debugging-Guides
  - Vorbereitungs- und Validierungstools vor der Bereitstellung

- **Getting Started Module**
  - AZD Basics: Kernkonzepte und Terminologie
  - Installation Guide: Plattform-spezifische Einrichtungsanweisungen
  - Configuration Guide: Umgebungseinrichtung und Authentifizierung
  - First Project Tutorial: Schritt-für-Schritt Praxisanleitung

- **Deployment and Provisioning Module**
  - Deployment Guide: Vollständige Workflow-Dokumentation
  - Provisioning Guide: Infrastructure as Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Multi-Service-Architekturmuster

- **Pre-deployment Validation Module**
  - Capacity Planning: Validierung der Azure-Ressourcenverfügbarkeit
  - SKU Selection: Umfassende Anleitung zu Service-Tiers
  - Pre-flight Checks: Automatisierte Validierungsskripte (PowerShell und Bash)
  - Kostenschätzung und Budgetplanungs-Tools

- **Troubleshooting Module**
  - Common Issues: Häufig auftretende Probleme und Lösungen
  - Debugging Guide: Systematische Fehlersuchmethoden
  - Erweiterte Diagnosetechniken und -tools
  - Leistungsüberwachung und -optimierung

- **Resources and References**
  - Command Cheat Sheet: Schnellreferenz für wichtige Befehle
  - Glossary: Umfassende Begriffs- und Akronymdefinitionen
  - FAQ: Detaillierte Antworten auf häufige Fragen
  - Externe Ressourcenlinks und Community-Verbindungen

- **Examples and Templates**
  - Einfaches Webanwendungsbeispiel
  - Vorlage für die Bereitstellung statischer Websites
  - Container-Anwendungskonfiguration
  - Datenbank-Integrationsmuster
  - Microservices-Architekturbeispiele
  - Serverless-Function-Implementierungen

#### Features
- **Multi-Platform Support**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Multiple Skill Levels**: Inhalte für Studierende bis hin zu professionellen Entwicklern
- **Practical Focus**: Hands-on-Beispiele und praxisnahe Szenarien
- **Comprehensive Coverage**: Von Grundkonzepten bis zu fortgeschrittenen Unternehmensmustern
- **Security-First Approach**: Sicherheitsbest Practices integriert über alle Bereiche
- **Cost Optimization**: Leitfäden für kosteneffektive Bereitstellungen und Ressourcenmanagement

#### Documentation Quality
- **Detailed Code Examples**: Praxisnahe, getestete Codebeispiele
- **Step-by-Step Instructions**: Klare, umsetzbare Anleitungen
- **Comprehensive Error Handling**: Fehlerbehebung für häufige Probleme
- **Best Practices Integration**: Industriestandards und Empfehlungen
- **Version Compatibility**: Aktuell mit den neuesten Azure-Diensten und azd-Funktionen

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integrationsmuster für Hugging Face, Azure Machine Learning und kundenspezifische Modelle
- **AI Agent Frameworks**: Vorlagen für LangChain, Semantic Kernel und AutoGen-Bereitstellungen
- **Advanced RAG Patterns**: Vektor-Datenbankoptionen jenseits von Azure AI Search (Pinecone, Weaviate usw.)
- **AI Observability**: Verbesserte Überwachung für Modellleistung, Token-Nutzung und Antwortqualität

#### Developer Experience
- **VS Code Extension**: Integriertes AZD + AI Foundry Entwicklungserlebnis
- **GitHub Copilot Integration**: KI-unterstützte AZD-Template-Generierung
- **Interactive Tutorials**: Praxisorientierte Codierungsübungen mit automatischer Validierung für KI-Szenarien
- **Video Content**: Ergänzende Video-Tutorials für visuelle Lernende mit Fokus auf KI-Bereitstellungen

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: KI-Modell-Governance, Compliance und Audit-Trails
- **Multi-Tenant AI**: Muster zur Bedienung mehrerer Kunden mit isolierten KI-Diensten
- **Edge AI Deployment**: Integration mit Azure IoT Edge und Container-Instanzen
- **Hybrid Cloud AI**: Multi-Cloud- und Hybrid-Bereitstellungsmuster für KI-Workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps-Integration mit Azure Machine Learning-Pipelines
- **Advanced Security**: Zero-Trust-Muster, private Endpunkte und erweiterter Threat Protection
- **Performance Optimization**: Fortgeschrittene Tuning- und Skalierungsstrategien für hochdurchsatzfähige KI-Anwendungen
- **Global Distribution**: Content-Delivery- und Edge-Caching-Muster für KI-Anwendungen

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Umfassende Microsoft Foundry-Integration (Abgeschlossen)
- ✅ **Interactive Tutorials**: Praktisches AI-Workshop-Lab (Abgeschlossen)
- ✅ **Advanced Security Module**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Performance Optimization**: Tuning-Strategien für KI-Workloads (Abgeschlossen)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: KI-fokussierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Extended FAQ**: KI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool Integration**: Verbesserte IDE- und Editor-Integrationsanleitungen
- ✅ **Monitoring Expansion**: KI-spezifische Überwachungs- und Alarmierungsmuster (Abgeschlossen)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsives Design für mobiles Lernen
- **Offline Access**: Herunterladbare Dokumentationspakete
- **Enhanced IDE Integration**: VS Code-Erweiterung für AZD + AI-Workflows
- **Community Dashboard**: Echtzeit-Community-Metriken und Beitragsverfolgung

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- Neue Funktionen, Dokumentationsabschnitte oder Fähigkeiten
- Neue Beispiele, Vorlagen oder Lernressourcen
- Zusätzliche Tools, Skripte oder Dienstprogramme

#### Changed
- Änderungen an bestehender Funktionalität oder Dokumentation
- Aktualisierungen zur Verbesserung von Klarheit oder Genauigkeit
- Umstrukturierung von Inhalten oder Organisation

#### Deprecated
- Funktionen oder Ansätze, die ausgemustert werden
- Dokumentationsabschnitte, die zur Entfernung geplant sind
- Methoden, für die bessere Alternativen existieren

#### Removed
- Funktionen, Dokumentation oder Beispiele, die nicht mehr relevant sind
- Veraltete Informationen oder eingestellte Ansätze
- Redundante oder konsolidierte Inhalte

#### Fixed
- Korrekturen von Fehlern in Dokumentation oder Code
- Behebung gemeldeter Probleme
- Verbesserungen der Genauigkeit oder Funktionalität

#### Security
- Sicherheitsbezogene Verbesserungen oder Fixes
- Aktualisierungen zu Sicherheitsbest Practices
- Behebung von Sicherheitslücken

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking Changes, die Maßnahmen seitens der Benutzer erfordern
- Bedeutende Umstrukturierungen von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik ändern

#### Minor Version (X.Y.0)
- Neue Funktionen oder Inhaltszusätze
- Verbesserungen, die Abwärtskompatibilität wahren
- Zusätzliche Beispiele, Tools oder Ressourcen

#### Patch Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleine Verbesserungen an bestehendem Inhalt
- Klarstellungen und geringfügige Ergänzungen

## Community Feedback and Suggestions

Wir ermutigen aktiv Community-Feedback zur Verbesserung dieser Lernressource:

### How to Provide Feedback
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Issues willkommen)
- **Discord Discussions**: Ideen teilen und sich mit der Microsoft Foundry-Community austauschen
- **Pull Requests**: Direkte Verbesserungen am Inhalt beitragen, insbesondere KI-Vorlagen und -Anleitungen
- **Microsoft Foundry Discord**: Teilnahme im #Azure-Kanal für AZD + AI-Diskussionen
- **Community Forums**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback Categories
- **AI Content Accuracy**: Korrekturen zur Integration und Bereitstellung von KI-Diensten
- **Learning Experience**: Vorschläge zur Verbesserung des Lernflusses für KI-Entwickler
- **Missing AI Content**: Anfragen für zusätzliche KI-Vorlagen, Muster oder Beispiele
- **Accessibility**: Verbesserungen für unterschiedliche Lernbedürfnisse
- **AI Tool Integration**: Vorschläge zur besseren Integration von KI-Entwicklungsworkflows
- **Production AI Patterns**: Anfragen für Unternehmens-KI-Bereitstellungsmuster

### Response Commitment
- **Issue Response**: Innerhalb von 48 Stunden für gemeldete Probleme
- **Feature Requests**: Bewertung innerhalb einer Woche
- **Community Contributions**: Review innerhalb einer Woche
- **Security Issues**: Sofortige Priorität mit beschleunigter Reaktion

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Inhaltsgenauigkeit und Linkvalidierung
- **Quarterly Updates**: Größere Inhaltszusätze und Verbesserungen
- **Semi-Annual Reviews**: Umfassende Umstrukturierung und Erweiterungen
- **Annual Releases**: Major-Versionen mit bedeutenden Verbesserungen

### Monitoring and Quality Assurance
- **Automated Testing**: Regelmäßige Validierung von Codebeispielen und Links
- **Community Feedback Integration**: Regelmäßige Einbindung von Nutzerfeedback
- **Technology Updates**: Angleichung an die neuesten Azure-Dienste und azd-Veröffentlichungen
- **Accessibility Audits**: Regelmäßige Überprüfung auf inklusive Designprinzipien

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Volle Unterstützung mit regelmäßigen Updates
- **Previous Major Version**: Sicherheitsupdates und kritische Fixes für 12 Monate
- **Legacy Versions**: Nur Community-Support, keine offiziellen Updates

### Migration Guidance
When major versions are released, we provide:
- **Migrationsanleitungen**: Schritt-für-Schritt-Anweisungen für den Übergang
- **Kompatibilitäts-Hinweise**: Details zu inkompatiblen Änderungen
- **Tool-Unterstützung**: Skripte oder Dienstprogramme zur Unterstützung der Migration
- **Community-Unterstützung**: Dedizierte Foren für Migrationsfragen

---

**Navigation**
- **Vorherige Lektion**: [Studienleitfaden](resources/study-guide.md)
- **Nächste Lektion**: Zurück zu [Haupt-README](README.md)

**Bleiben Sie auf dem Laufenden**: Beobachten Sie dieses Repository, um Benachrichtigungen über neue Releases und wichtige Aktualisierungen des Lernmaterials zu erhalten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Originalsprache gilt als maßgebliche Quelle. Für kritische Informationen empfehlen wir eine professionelle, menschliche Übersetzung. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->