# Änderungsprotokoll - AZD For Beginners

## Einführung

Dieses Änderungsprotokoll dokumentiert alle nennenswerten Änderungen, Aktualisierungen und Verbesserungen am Repository AZD For Beginners. Wir folgen den Prinzipien des Semantic Versioning und pflegen dieses Protokoll, um den Nutzern zu helfen zu verstehen, was sich zwischen den Versionen geändert hat.

## Lernziele

Beim Durchsehen dieses Änderungsprotokolls:
- Über neue Funktionen und Inhaltsergänzungen informiert bleiben
- Verbesserungen an der bestehenden Dokumentation verstehen
- Fehlerbehebungen und Korrekturen nachverfolgen, um die Genauigkeit sicherzustellen
- Die Entwicklung der Lernmaterialien im Laufe der Zeit verfolgen

## Lernergebnisse

Nach Durchsicht der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und verfügbare Lernressourcen identifizieren
- Verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernpfad auf Basis der aktuellsten Materialien planen
- Feedback und Vorschläge für zukünftige Verbesserungen beitragen

## Versionsverlauf

### [v3.18.0] - 2026-03-16

#### AZD AI CLI-Befehle, Inhaltsvalidierung & Vorlagen-Erweiterung
**Diese Version fügt die Abdeckung der Befehle `azd ai`, `azd extension` und `azd mcp` in allen KI-bezogenen Kapiteln hinzu, behebt defekte Links und veralteten Code in agents.md, aktualisiert das Cheat Sheet und überarbeitet den Abschnitt Example Templates mit validierten Beschreibungen und neuen Azure AI AZD-Vorlagen.**

#### Hinzugefügt
- **🤖 AZD AI CLI-Abdeckung** in 7 Dateien (zuvor nur in Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Neuer Abschnitt "Extensions and AI Commands", der `azd extension`, `azd ai agent init` und `azd mcp` vorstellt
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` mit Vergleichstabelle (Vorlagen- vs. Manifest-Ansatz)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Unterabschnitte "AZD Extensions for Foundry" und "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start zeigt jetzt sowohl Vorlagen- als auch manifestbasierte Bereitstellungspfade
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-Abschnitt enthält jetzt die Option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Unterabschnitt "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Neuer Abschnitt "AI & Extensions Commands" mit `azd extension`, `azd ai agent init`, `azd mcp` und `azd infra generate`
- **📦 Neue AZD AI-Beispielvorlagen** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-Chat mit Blazor WebAssembly, Semantic Kernel und Sprachchat-Unterstützung
  - **azure-search-openai-demo-java** — Java RAG-Chat unter Verwendung von Langchain4J mit ACA/AKS-Bereitstellungsoptionen
  - **contoso-creative-writer** — Multi-Agent Creative-Writing-App unter Verwendung von Azure AI Agent Service, Bing Grounding und Prompty
  - **serverless-chat-langchainjs** — Serverless RAG mit Azure Functions + LangChain.js + Cosmos DB und Ollama-Unterstützung für lokale Entwicklung
  - **chat-with-your-data-solution-accelerator** — Enterprise-RAG-Accelerator mit Admin-Portal, Teams-Integration und PostgreSQL/Cosmos DB-Optionen
  - **azure-ai-travel-agents** — Multi-Agent MCP-Orchestrierungs-Referenz-App mit Servern in .NET, Python, Java und TypeScript
  - **azd-ai-starter** — Minimalvorlage für Azure AI-Infrastruktur mit Bicep
  - **🔗 Awesome-AZD AI-Galerie** — Referenz zur [Awesome-AZD AI-Galerie](https://azure.github.io/awesome-azd/?tags=ai) (80+ Vorlagen)

#### Behoben
- **🔗 agents.md Navigation**: Vorherige/Nächste-Links stimmen jetzt mit der Lektionenreihenfolge im Chapter 2 README überein (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md defekte Links**: `production-ai-practices.md` korrigiert zu `../chapter-08-production/production-ai-practices.md` (3 Vorkommen)
- **📦 agents.md veralteter Code**: `opencensus` ersetzt durch `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ungültige API**: `max_tokens` von `create_agent()` nach `create_run()` als `max_completion_tokens` verschoben
- **🔢 agents.md Token-Zählung**: Grobe Schätzung `len//4` ersetzt durch `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Dienste von "Cognitive Search + App Service" zu "Azure AI Search + Azure Container Apps" korrigiert (Standardhost geändert Okt 2024)
- **contoso-chat**: Beschreibung aktualisiert, um Azure AI Foundry + Prompty zu referenzieren und zum tatsächlichen Repo-Titel und Tech-Stack zu passen

#### Entfernt
- **ai-document-processing**: Nicht-funktionalen Vorlagenverweis entfernt (Repo nicht öffentlich als AZD-Vorlage zugänglich)

#### Verbessert
- **📝 agents.md Übungen**: Übung 1 zeigt jetzt die erwartete Ausgabe und den `azd monitor`-Schritt; Übung 2 enthält vollständigen `FunctionTool`-Registrierungscode; Übung 3 ersetzt vage Hinweise durch konkrete `prepdocs.py`-Befehle
- **📚 agents.md Ressourcen**: Dokumentationslinks auf aktuelle Azure AI Agent Service-Dokumente und Quickstart aktualisiert
- **📋 agents.md Next Steps Tabelle**: AI Workshop Lab-Link für vollständige Kapitelabdeckung hinzugefügt

#### Aktualisierte Dateien
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Verbesserung der Kursnavigation
**Diese Version verbessert die Kapitelnavigation in README.md mit einem erweiterten Tabellenformat.**

#### Geändert
- **Kurskarten-Tabelle**: Erweiterung mit direkten Lektionenlinks, Dauerangaben und Komplexitätsbewertungen
- **Ordnerbereinigung**: Redundante alte Ordner entfernt (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link-Validierung**: Alle 21+ internen Links in der Kurskarten-Tabelle überprüft

### [v3.16.0] - 2026-02-05

#### Produktnamen-Aktualisierungen
**Diese Version aktualisiert Produktverweise auf das aktuelle Microsoft-Branding.**

#### Geändert
- **Microsoft Foundry → Microsoft Foundry**: Alle Referenzen in Nicht-Übersetzungsdateien aktualisiert
- **Azure AI Agent Service → Foundry Agents**: Dienstname zur Anpassung an das aktuelle Branding aktualisiert

#### Aktualisierte Dateien
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

#### Wesentliche Repository-Umstrukturierung: Kapitelbasierte Ordnernamen
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
| Datei | Von | Nach |
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
  - Lernzielen und Dauer
  - Lektionstabelle mit Beschreibungen
  - Schnellstartbefehlen
  - Navigation zu anderen Kapiteln

#### Geändert
- **🔗 Alle internen Links aktualisiert**: 78+ Pfade in allen Dokumentationsdateien aktualisiert
- **🗺️ Haupt-README.md**: Kursübersicht mit neuer Kapitelstruktur aktualisiert
- **📝 examples/README.md**: Querverweise auf Kapitelordner aktualisiert

#### Entfernt
- Alte Ordnerstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-Umstrukturierung: Kapitel-Navigation
**Diese Version fügte Kapitel-Navigations-README-Dateien hinzu (von v3.15.0 abgelöst).**

---

### [v3.13.0] - 2026-02-05

#### Neuer Leitfaden für KI-Agenten
**Diese Version fügt einen umfassenden Leitfaden für die Bereitstellung von KI-Agenten mit dem Azure Developer CLI hinzu.**

#### Hinzugefügt
- **🤖 docs/microsoft-foundry/agents.md**: Vollständiger Leitfaden, der Folgendes abdeckt:
  - Was KI-Agenten sind und wie sie sich von Chatbots unterscheiden
  - Drei Quick-Start-Agentenvorlagen (Foundry Agents, Prompty, RAG)
  - Architekturpatterns für Agenten (Einzelagent, RAG, Multi-Agent)
  - Tool-Konfiguration und Anpassung
  - Monitoring und Metrikverfolgung
  - Kostenüberlegungen und Optimierung
  - Häufige Troubleshooting-Szenarien
  - Drei praktische Übungen mit Erfolgskriterien

#### Inhaltsstruktur
- **Einführung**: Agentenkonzepte für Einsteiger
- **Quick Start**: Agenten mit `azd init --template get-started-with-ai-agents` bereitstellen
- **Architekturpatterns**: Visuelle Diagramme der Agenten-Patterns
- **Konfiguration**: Tool-Setup und Umgebungsvariablen
- **Monitoring**: Application Insights-Integration
- **Übungen**: Progressives praktisches Lernen (20–45 Minuten pro Übung)

---

### [v3.12.0] - 2026-02-05

#### Aktualisierung der DevContainer-Umgebung
**Diese Version aktualisiert die Konfiguration des Entwicklungscontainers mit modernen Tools und besseren Standardeinstellungen für die AZD-Lernerfahrung.**

#### Geändert
- **🐳 Basis-Image**: Aktualisiert von `python:3.12-bullseye` zu `python:3.12-bookworm` (aktuellste Debian-Stable)
- **📛 Container-Name**: Umbenannt von "Python 3" zu "AZD for Beginners" zur besseren Klarheit

#### Hinzugefügt
- **🔧 Neue Dev-Container-Funktionen**:
  - `azure-cli` mit aktiviertem Bicep-Support
  - `node:20` (LTS-Version für AZD-Vorlagen)
  - `github-cli` zur Vorlagenverwaltung
  - `docker-in-docker` für Bereitstellungen von Container-Apps

- **🔌 Portweiterleitung**: Vorgefertigte Ports für die gängige Entwicklung:
  - 8000 (MkDocs-Vorschau)
  - 3000 (Web-Apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Neue VS Code-Erweiterungen**:
  - `ms-python.vscode-pylance` - Verbessertes Python-IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Unterstützung für Azure Functions
  - `ms-azuretools.vscode-docker` - Docker-Unterstützung
  - `ms-azuretools.vscode-bicep` - Bicep-Sprachunterstützung
  - `ms-azure-devtools.azure-resource-groups` - Azure-Ressourcenverwaltung
  - `yzhang.markdown-all-in-one` - Markdown-Bearbeitung
  - `DavidAnson.vscode-markdownlint` - Markdown-Linting
  - `bierner.markdown-mermaid` - Mermaid-Diagrammunterstützung
  - `redhat.vscode-yaml` - YAML-Unterstützung (für azure.yaml)
  - `eamodio.gitlens` - Git-Visualisierung
  - `mhutchie.git-graph` - Git-Verlauf

- **⚙️ VS Code-Einstellungen**: Standardwerte für Python-Interpreter, Formatierung beim Speichern und Entfernen von Leerzeichen hinzugefügt

- **📦 Aktualisierte requirements-dev.txt**:
  - MkDocs-Minify-Plugin hinzugefügt
  - pre-commit für Codequalität hinzugefügt
  - Azure SDK-Pakete hinzugefügt (azure-identity, azure-mgmt-resource)

#### Behoben
- **Post-Create-Befehl**: Überprüft jetzt die Installation von AZD und der Azure CLI beim Start des Containers

---

### [v3.11.0] - 2026-02-05

#### Einsteigerfreundliche README-Überarbeitung
**Diese Version verbessert die README.md deutlich, macht sie für Einsteiger zugänglicher und fügt wichtige Ressourcen für KI-Entwickler hinzu.**

#### Hinzugefügt
- **🆚 Azure CLI vs AZD Vergleich**: Klare Erklärung, wann welches Tool zu verwenden ist, mit praktischen Beispielen
- **🌟 Awesome AZD Links**: Direkte Links zur Community-Vorlagengalerie und zu Ressourcen für Beiträge:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ sofort einsatzbereite Vorlagen
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-Beitrag
- **🎯 Schnellstartanleitung**: Vereinfachter 3-Schritte-Einstiegsbereich (Installieren → Anmelden → Bereitstellen)
- **📊 Erfahrungsbasierte Navigations-Tabelle**: Klare Anleitung, wo man je nach Entwicklererfahrung beginnen sollte

#### Geändert
- **README-Struktur**: Neu organisiert für stufenweise Offenlegung - wichtige Informationen zuerst
- **Einführungsabschnitt**: Umschrieben, um "The Magic of `azd up`" für absolute Anfänger zu erklären
- **Doppelte Inhalte entfernt**: Doppelte Fehlerbehebungssektion entfernt
- **Fehlerbehebungskommandos**: `azd logs`-Verweis korrigiert, um das gültige `azd monitor --logs` zu verwenden

#### Behoben
- **🔐 Authentifizierungsbefehle**: `azd auth login` und `azd auth logout` zu cheat-sheet.md hinzugefügt
- **Ungültige Befehlsreferenzen**: Verbleibende `azd logs` aus dem Fehlerbehebungsabschnitt der README entfernt

#### Hinweise
- **Umfang**: Änderungen auf die Haupt-README.md und resources/cheat-sheet.md angewendet
- **Zielgruppe**: Verbesserungen speziell für Entwickler, die neu bei AZD sind

---

### [v3.10.0] - 2026-02-05

#### Aktualisierung der Befehlsgenauigkeit der Azure Developer CLI
**Diese Version korrigiert nicht existente AZD-Befehle in der gesamten Dokumentation und stellt sicher, dass alle Codebeispiele die gültige Azure Developer CLI-Syntax verwenden.**

#### Behoben
- **🔧 Nicht existierende AZD-Befehle entfernt**: Umfassendes Audit und Korrektur ungültiger Befehle:
  - `azd logs` (existiert nicht) → ersetzt durch `azd monitor --logs` oder Azure CLI-Alternativen
  - `azd service`-Unterbefehle (existieren nicht) → ersetzt durch `azd show` und Azure CLI
  - `azd infra import/export/validate` (existieren nicht) → entfernt oder durch gültige Alternativen ersetzt
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` Flags (existieren nicht) → entfernt
  - `azd provision --what-if/--rollback` Flags (existieren nicht) → aktualisiert, um `--preview` zu verwenden
  - `azd config validate` (existiert nicht) → ersetzt durch `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existieren nicht) → entfernt

- **📚 Dateien mit Befehlskorrekturen aktualisiert**:
  - `resources/cheat-sheet.md`: Umfangreiche Überarbeitung der Befehlsreferenz
  - `docs/deployment/deployment-guide.md`: Rollback- und Bereitstellungsstrategien korrigiert
  - `docs/troubleshooting/debugging.md`: Log-Analyseabschnitte korrigiert
  - `docs/troubleshooting/common-issues.md`: Fehlerbehebungskommandos aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD-Debugging-Abschnitt korrigiert
  - `docs/getting-started/azd-basics.md`: Monitoring-Befehle korrigiert
  - `docs/getting-started/first-project.md`: Monitoring- und Debugging-Beispiele aktualisiert
  - `docs/getting-started/installation.md`: Hilfe- und Versionsbeispiele korrigiert
  - `docs/pre-deployment/application-insights.md`: Befehle zum Anzeigen von Logs korrigiert
  - `docs/pre-deployment/coordination-patterns.md`: Agent-Debugging-Befehle korrigiert

#### Geändert
- **Rollback-Strategien**: Dokumentation aktualisiert, um Git-basiertes Rollback zu verwenden (AZD hat kein natives Rollback)
- **Log-Anzeige**: `azd logs`-Verweise durch `azd monitor --logs`, `azd monitor --live` und Azure-CLI-Befehle ersetzt
- **Performance-Abschnitt**: Nicht existierende Parallel-/inkrementelle Bereitstellungs-Flags entfernt, gültige Alternativen bereitgestellt

#### Technische Details
- **Gültige AZD-Befehle**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gültige azd monitor-Flags**: `--live`, `--logs`, `--overview`
- **Entfernte Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Hinweise
- **Verifizierung**: Befehle gegen Azure Developer CLI v1.23.x validiert

---

### [v3.9.0] - 2026-02-05

#### Abschluss des Workshops und Aktualisierung der Dokumentationsqualität
**Diese Version vervollständigt die interaktiven Workshop-Module, behebt alle defekten Dokumentationslinks und verbessert die Gesamtqualität der Inhalte für KI-Entwickler, die Microsoft AZD verwenden.**

#### Hinzugefügt
- **📝 CONTRIBUTING.md**: Neues Dokument mit Beitragsrichtlinien, einschließlich:
  - Klare Anweisungen zum Melden von Problemen und Vorschlagen von Änderungen
  - Dokumentationsstandards für neue Inhalte
  - Richtlinien für Codebeispiele und Konventionen für Commit-Nachrichten
  - Informationen zur Community-Beteiligung

#### Abgeschlossen
- **🎯 Workshop Modul 7 (Abschluss)**: Vollständig abgeschlossenes Abschlussmodul mit:
  - Umfassende Zusammenfassung der Workshop-Ergebnisse
  - Abschnitt zu den wichtigsten erlernten Konzepten, der AZD, Vorlagen und Microsoft Foundry abdeckt
  - Empfehlungen zur Fortsetzung der Lernreise
  - Workshop-Herausforderungsübungen mit Schwierigkeitsbewertungen
  - Community-Feedback- und Support-Links

- **📚 Workshop Modul 3 (Deconstruct)**: Lernziele aktualisiert mit:
  - Anleitung zur Aktivierung von GitHub Copilot mit MCP-Servern
  - Verständnis der Ordnerstruktur von AZD-Vorlagen
  - Organisation von Infrastructure-as-Code (Bicep)-Mustern
  - Anleitungen für praktische Labs

- **🔧 Workshop Modul 6 (Teardown)**: Abgeschlossen mit:
  - Ziele für Ressourcenbereinigung und Kostenmanagement
  - `azd down`-Verwendung für sichere Infrastruktur-Deprovisionierung
  - Anleitung zur Wiederherstellung von soft-gelöschten Cognitive Services
  - Bonus-Erkundungsaufgaben für GitHub Copilot und das Azure-Portal

#### Behoben
- **🔗 Korrigierte defekte Links**: 15+ defekte interne Dokumentationslinks behoben:
  - `docs/ai-foundry/ai-model-deployment.md`: Pfade zu microsoft-foundry-integration.md korrigiert
  - `docs/troubleshooting/ai-troubleshooting.md`: Pfade zu ai-model-deployment.md und production-ai-practices.md korrigiert
  - `docs/getting-started/first-project.md`: Nicht vorhandene cicd-integration.md durch deployment-guide.md ersetzt
  - `examples/retail-scenario.md`: Pfade zu FAQ- und Fehlerbehebungsleitfäden korrigiert
  - `examples/container-app/microservices/README.md`: Pfade zum Kursstart und Bereitstellungsleitfaden korrigiert
  - `resources/faq.md` und `resources/glossary.md`: KI-Kapitelverweise aktualisiert
  - `course-outline.md`: Verweise auf Instructor-Guide und AI-Workshop-Labs korrigiert

- **📅 Workshop-Statusbanner**: Von "Under Construction" auf aktiven Workshop-Status mit Datum Februar 2026 aktualisiert

- **🔗 Workshop-Navigation**: Defekte Navigationslinks in workshop README.md korrigiert, die auf den nicht vorhandenen Ordner lab-1-azd-basics verwiesen

#### Geändert
- **Workshop-Präsentation**: "under construction"-Warnung entfernt, Workshop ist nun komplett und einsatzbereit
- **Navigationskonsistenz**: Sichergestellt, dass alle Workshop-Module eine korrekte Navigation zwischen den Modulen haben
- **Verweise im Lernpfad**: Kapitelquerverweise aktualisiert, um die korrekten microsoft-foundry-Pfade zu verwenden

#### Validiert
- ✅ Alle englischen Markdown-Dateien haben gültige interne Links
- ✅ Workshop-Module 0–7 sind mit Lernzielen vollständig
- ✅ Die Navigation zwischen Kapiteln und Modulen funktioniert korrekt
- ✅ Inhalte sind für KI-Entwickler, die Microsoft AZD verwenden, geeignet
- ✅ Einsteigerfreundliche Sprache und Struktur wurden durchgehend beibehalten
- ✅ CONTRIBUTING.md bietet klare Anleitung für Mitwirkende

#### Technische Umsetzung
- **Link-Validierung**: Automatisches PowerShell-Skript hat alle internen .md-Links überprüft
- **Inhaltsprüfung**: Manuelle Überprüfung der Vollständigkeit des Workshops und der Eignung für Einsteiger
- **Navigationssystem**: Konsistente Navigationsmuster für Kapitel und Module angewendet

#### Hinweise
- **Umfang**: Änderungen wurden nur auf die englische Dokumentation angewendet
- **Übersetzungen**: Übersetzungsordner wurden in dieser Version nicht aktualisiert (automatische Übersetzung wird später synchronisiert)
- **Workshop-Dauer**: Der komplette Workshop bietet jetzt 3–4 Stunden praxisorientiertes Lernen

---

### [v3.8.0] - 2025-11-19

#### Erweiterte Dokumentation: Monitoring, Sicherheit und Multi-Agenten-Muster
**Diese Version fügt umfassende Lektionen in A-Qualität zur Integration von Application Insights, zu Authentifizierungsmustern und zur Multi-Agenten-Koordination für Produktionsbereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Lektion zur Integration von Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - AZD-fokussierte Bereitstellung mit automatischer Provisionierung
  - Vollständige Bicep-Vorlagen für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (1.200+ Zeilen)
  - KI/LLM-Monitoring-Muster (Microsoft Foundry Models Token-/Kostenverfolgung)
  - 6 Mermaid-Diagramme (Architektur, verteiltes Tracing, Telemetriefluss)
  - 3 praxisorientierte Übungen (Alerts, Dashboards, KI-Monitoring)
  - Kusto-Abfragebeispiele und Strategien zur Kostenoptimierung
  - Live-Metrik-Streaming und Echtzeit-Debugging
  - 40–50 Minuten Lernzeit mit produktionsreifen Mustern

- **🔐 Lektion zu Authentifizierungs- & Sicherheitsmustern**: in `docs/getting-started/authsecurity.md`:
  - 3 Authentifizierungsmuster (Connection Strings, Key Vault, Managed Identity)
  - Vollständige Bicep-Infrastrukturvorlagen für sichere Bereitstellungen
  - Node.js-Anwendungs-Code mit Azure SDK-Integration
  - 3 vollständige Übungen (Managed Identity aktivieren, User-Assigned Identity, Key-Vault-Rotation)
  - Sicherheits-Best-Practices und RBAC-Konfigurationen
  - Fehlerbehebungsleitfaden und Kostenanalyse
  - Produktionsreife passwortlose Authentifizierungsmuster

- **🤖 Lektion zu Multi-Agenten-Koordinationsmustern**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequentiell, parallel, hierarchisch, ereignisgesteuert, Konsens)
  - Vollständige Orchestrator-Service-Implementierung (Python/Flask, 1.500+ Zeilen)
  - 3 spezialisierte Agentenimplementierungen (Research, Writer, Editor)
  - Service-Bus-Integration für Message-Queueing
  - Cosmos DB-Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme, die Agenteninteraktionen zeigen
  - 3 fortgeschrittene Übungen (Timeout-Handling, Retry-Logik, Circuit Breaker)
  - Kostenaufstellung ($240–565/Monat) mit Optimierungsstrategien
  - Application Insights-Integration für das Monitoring

#### Verbessert
- Pre-deployment-Kapitel: Enthält jetzt umfassende Monitoring- und Koordinationsmuster
- Kapitel 'Getting Started': Mit professionellen Authentifizierungsmustern erweitert
- Produktionsreife: Vollständige Abdeckung von Sicherheit bis Beobachtbarkeit
- Kursübersicht: Aktualisiert, um auf neue Lektionen in Kapitel 3 und 6 zu verweisen

#### Geändert
- Lernfortschritt: Bessere Integration von Sicherheit und Monitoring im gesamten Kurs
- Dokumentationsqualität: Konsistente A-Qualitätsstandards (95–97%) über die neuen Lektionen
- Produktionsmuster: Vollständige End-to-End-Abdeckung für Unternehmensbereitstellungen

#### Verbessert
- **Developer Experience**: Klarer Weg von der Entwicklung zur Produktionsüberwachung
- **Security Standards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Observability**: Vollständige Application Insights-Integration mit AZD
- **AI Workloads**: Spezialisierte Überwachung für Microsoft Foundry Models und Multi-Agenten-Systeme

#### Validiert
- ✅ Alle Lektionen enthalten vollständigen funktionierenden Code (keine Ausschnitte)
- ✅ Mermaid-Diagramme für visuelles Lernen (insgesamt 19 über 3 Lektionen)
- ✅ Praxisübungen mit Verifikationsschritten (insgesamt 9)
- ✅ Produktionsreife Bicep-Vorlagen, bereitstellbar mit `azd up`
- ✅ Kostenanalyse und Optimierungsstrategien
- ✅ Fehlerbehebungsanleitungen und bewährte Verfahren
- ✅ Wissens-Checkpoints mit Verifikationsbefehlen

#### Dokumentationsbewertungsergebnisse
- **docs/pre-deployment/application-insights.md**: - Umfassender Überwachungsleitfaden
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Erweiterte Multi-Agenten-Architekturen
- **Overall New Content**: - Konsistent hohe Qualitätsstandards

#### Technische Umsetzung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentication**: Managed Identity + Key Vault + RBAC-Muster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Monitoring**: Live-Metriken + Kusto-Abfragen + Warnungen + Dashboards
- **Cost Management**: Stichprobenstrategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 2025-11-19

#### Verbesserungen der Dokumentationsqualität und neues Microsoft Foundry Models-Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Bereitstellungsbeispiel für Microsoft Foundry Models mit einer gpt-4.1 Chat-Schnittstelle hinzu.**

#### Hinzugefügt
- **🤖 Microsoft Foundry Models Chat Example**: Vollständige gpt-4.1-Bereitstellung mit einer funktionierenden Implementierung in `examples/azure-openai-chat/`:
  - Vollständige Microsoft Foundry Models-Infrastruktur (gpt-4.1 Modellbereitstellung)
  - Python-Kommandozeilen-Chat-Schnittstelle mit Gesprächsverlauf
  - Key Vault-Integration für sichere Speicherung von API-Schlüsseln
  - Token-Nutzungsverfolgung und Kostenschätzung
  - Ratenbegrenzung und Fehlerbehandlung
  - Umfassendes README mit 35-45-minütiger Bereitstellungsanleitung
  - 11 produktionsreife Dateien (Bicep-Vorlagen, Python-App, Konfiguration)
- **📚 Dokumentationsübungen**: Praxisübungen zur Konfigurationsanleitung hinzugefügt:
  - Übung 1: Multi-Umgebungs-Konfiguration (15 Minuten)
  - Übung 2: Praxis zur Geheimnisverwaltung (10 Minuten)
  - Klare Erfolgskriterien und Verifikationsschritte
- **✅ Bereitstellungsverifikation**: Verifikationsabschnitt zur Bereitstellungsanleitung hinzugefügt:
  - Health-Check-Verfahren
  - Checkliste mit Erfolgskriterien
  - Erwartete Ausgaben für alle Bereitstellungsbefehle
  - Schnelle Referenz zur Fehlerbehebung

#### Verbessert
- **examples/README.md**: Aktualisiert auf A-Qualität (93%):
  - azure-openai-chat zu allen relevanten Abschnitten hinzugefügt
  - Anzahl lokaler Beispiele von 3 auf 4 aktualisiert
  - Zur Tabelle der KI-Anwendungsbeispiele hinzugefügt
  - In den Schnellstart für fortgeschrittene Benutzer integriert
  - Zum Abschnitt Microsoft Foundry-Vorlagen hinzugefügt
  - Vergleichsmatrix und Abschnitte zur Technologiebewertung aktualisiert
- **Dokumentationsqualität**: Verbesserung von B+ (87%) → A- (92%) im gesamten docs-Ordner:
  - Erwartete Ausgaben zu kritischen Befehlsbeispielen hinzugefügt
  - Verifikationsschritte für Konfigurationsänderungen aufgenommen
  - Praktisches Lernen mit Übungsaufgaben verbessert

#### Geändert
- **Lernfortschritt**: Bessere Integration von KI-Beispielen für fortgeschrittene Lernende
- **Dokumentationsstruktur**: Handlungsorientiertere Übungen mit klaren Ergebnissen
- **Verifikationsprozess**: Explizite Erfolgskriterien zu wichtigen Workflows hinzugefügt

#### Verbessert
- **Entwicklererlebnis**: Die Bereitstellung von Microsoft Foundry Models dauert jetzt 35–45 Minuten (vs. 60–90 für komplexe Alternativen)
- **Kostentransparenz**: Klare Kostenschätzungen ($50-200/month) für das Microsoft Foundry Models-Beispiel
- **Lernpfad**: KI-Entwickler haben einen klaren Einstiegspunkt mit azure-openai-chat
- **Dokumentationsstandards**: Konsistente erwartete Ausgaben und Verifikationsschritte

#### Validiert
- ✅ Microsoft Foundry Models-Beispiel voll funktionsfähig mit `azd up`
- ✅ Alle 11 Implementierungsdateien syntaktisch korrekt
- ✅ README-Anweisungen stimmen mit der tatsächlichen Bereitstellungserfahrung überein
- ✅ Dokumentationslinks an über 8 Stellen aktualisiert
- ✅ Das Beispielverzeichnis spiegelt genau 4 lokale Beispiele wider
- ✅ Keine doppelten externen Links in Tabellen
- ✅ Alle Navigationsverweise korrekt

#### Technische Umsetzung
- **Microsoft Foundry Models-Architektur**: gpt-4.1 + Key Vault + Container Apps-Muster
- **Sicherheit**: Managed Identity bereit, Geheimnisse im Key Vault
- **Überwachung**: Application Insights-Integration
- **Kostenmanagement**: Token-Tracking und Nutzungsoptimierung
- **Bereitstellung**: Ein einzelner `azd up`-Befehl für die komplette Einrichtung

### [v3.6.0] - 2025-11-19

#### Wichtige Aktualisierung: Beispiele zur Bereitstellung von Container-Apps
**Diese Version führt umfassende, produktionsreife Beispiele für die Bereitstellung containerisierter Anwendungen mithilfe der Azure Developer CLI (AZD) ein, mit vollständiger Dokumentation und Integration in den Lernpfad.**

#### Hinzugefügt
- 🚀 Container-App-Beispiele: Neue lokale Beispiele in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Vollständiger Überblick über containerisierte Bereitstellungen, Schnellstart, Produktion und erweiterte Muster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Einsteigerfreundliche REST-API mit Scale-to-Zero, Health-Probes, Überwachung und Fehlerbehebung
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsreife Multi-Service-Bereitstellung (API-Gateway, Product, Order, User, Notification), asynchrones Messaging, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary-Bereitstellung
- Best Practices: Sicherheit, Überwachung, Kostenoptimierung und CI/CD-Anleitungen für containerisierte Workloads
- Codebeispiele: Vollständige `azure.yaml`, Bicep-Vorlagen und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- Tests & Fehlerbehebung: End-to-End-Test-Szenarien, Überwachungsbefehle, Anleitungen zur Fehlerbehebung

#### Geändert
- **README.md**: Aktualisiert, um neue Container-App-Beispiele unter „Local Examples - Container Applications“ hervorzuheben und zu verlinken
- **examples/README.md**: Aktualisiert, um Container-App-Beispiele hervorzuheben, Einträge in der Vergleichsmatrix hinzuzufügen und Technologie-/Architekturverweise zu aktualisieren
- **Course Outline & Study Guide**: Aktualisiert, um in den relevanten Kapiteln auf neue Container-App-Beispiele und Bereitstellungsmuster zu verweisen

#### Validiert
- ✅ Alle neuen Beispiele mit `azd up` bereitstellbar und folgen bewährten Verfahren
- ✅ Dokumentations-Querverweise und Navigation aktualisiert
- ✅ Beispiele decken Szenarien von Anfänger bis Fortgeschrittene ab, einschließlich produktionsreifer Microservices

#### Hinweise
- **Umfang**: Nur englische Dokumentation und Beispiele
- **Nächste Schritte**: Erweiterung um zusätzliche fortgeschrittene Container-Muster und CI/CD-Automatisierung in zukünftigen Versionen

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Diese Version führt eine umfassende Änderung des Produktnamens von "Microsoft Foundry" zu "Microsoft Foundry" in der gesamten englischen Dokumentation ein, um Microsofts offizielle Umbenennung widerzuspiegeln.**

#### Geändert
- **🔄 Produktnamensaktualisierung**: Vollständiges Rebranding von "Microsoft Foundry" zu "Microsoft Foundry"
  - Alle Verweise in der englischen Dokumentation im Ordner `docs/` aktualisiert
  - Ordner umbenannt: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Datei umbenannt: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt: 23 Inhaltsverweise in 7 Dokumentationsdateien aktualisiert

- **📁 Änderungen der Ordnerstruktur**:
  - `docs/ai-foundry/` umbenannt in `docs/microsoft-foundry/`
  - Alle Querverweise aktualisiert, um die neue Ordnerstruktur widerzuspiegeln
  - Navigationslinks in der gesamten Dokumentation validiert

- **📄 Dateiumbenennungen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links aktualisiert, um auf den neuen Dateinamen zu verweisen

#### Aktualisierte Dateien
- **Kapitel-Dokumentation** (7 Dateien):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Navigationslinks aktualisiert
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamenreferenzen aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Verwendet bereits Microsoft Foundry (aus vorherigen Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Verweise aktualisiert (Überblick, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweise aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zum nächsten Kapitel aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Verweise aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Kursstruktur-Dateien** (2 Dateien):
  - `README.md` - 17 Verweise aktualisiert (Kursübersicht, Kapiteltitel, Vorlagenabschnitt, Community-Einblicke)
  - `course-outline.md` - 14 Verweise aktualisiert (Überblick, Lernziele, Kapitelressourcen)

#### Validiert
- ✅ Keine verbleibenden Ordnerpfadverweise "ai-foundry" in den englischen Dokumenten
- ✅ Keine verbleibenden Produktnamenverweise "Microsoft Foundry" in den englischen Dokumenten
- ✅ Alle Navigationslinks funktionieren mit der neuen Ordnerstruktur
- ✅ Datei- und Ordnerumbenennungen erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln validiert

#### Hinweise
- **Umfang**: Änderungen nur in der englischen Dokumentation im Ordner `docs/` angewendet
- **Übersetzungen**: Übersetzungsordner (`translations/`) in dieser Version nicht aktualisiert
- **Workshop**: Workshop-Materialien (`workshop/`) in dieser Version nicht aktualisiert
- **Beispiele**: Beispieldateien können weiterhin die alte Benennung referenzieren (wird in einem zukünftigen Update angegangen)
- **Externe Links**: Externe URLs und GitHub-Repository-Verweise bleiben unverändert

#### Migrationsanleitung für Mitwirkende
If you have local branches or documentation referencing the old structure:
1. Aktualisiere Ordnerreferenzen: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualisiere Dateireferenzen: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Produktnamen ersetzen: "Microsoft Foundry" → "Microsoft Foundry"
4. Überprüfe, dass alle internen Dokumentationslinks weiterhin funktionieren

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur-Preview- und Validierungsverbesserungen
**Diese Version führt umfassende Unterstützung für die neue Preview-Funktion der Azure Developer CLI ein und verbessert die Workshop-Benutzererfahrung.**

#### Hinzugefügt
- **🧪 azd provision --preview Feature Documentation**: Umfassende Abdeckung der neuen Infrastruktur-Preview-Funktion
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration in die Bereitstellungsanleitung mit Anwendungsfällen und Vorteilen
  - Integration von Pre-Flight-Checks für sicherere Bereitstellungsvalidierung
  - Updates der Einstiegshilfe mit sicherheitsorientierten Bereitstellungspraktiken
- **🚧 Workshop Status Banner**: Professionelles HTML-Banner, das den Entwicklungsstatus des Workshops anzeigt
  - Farbverlauf-Design mit Baustellenindikatoren für klare Nutzerkommunikation
  - Zuletzt aktualisiert-Zeitstempel zur Transparenz
  - Mobil-responsives Design für alle Gerätetypen

#### Verbessert
- **Infrastruktursicherheit**: Preview-Funktionalität in der gesamten Bereitstellungsdokumentation integriert
- **Vorbereitungsvalidierung**: Automatisierte Skripte enthalten jetzt Infrastruktur-Preview-Tests
- **Entwickler-Workflow**: Befehlssequenzen aktualisiert, um Preview als Best Practice einzubeziehen
- **Workshop-Erfahrung**: Klare Erwartungen für Benutzer bezüglich des Entwicklungsstatus der Inhalte gesetzt

#### Geändert
- **Bereitstellungs-Best-Practices**: Preview-first-Workflow jetzt empfohlener Ansatz
- **Dokumentationsablauf**: Infrastrukturvalidierung früher im Lernprozess platziert
- **Workshop-Präsentation**: Professionelle Statuskommunikation mit klarem Entwicklungszeitplan

#### Verbessert
- **Safety-First-Ansatz**: Infrastrukturänderungen können jetzt vor der Bereitstellung validiert werden
- **Teamzusammenarbeit**: Preview-Ergebnisse können zur Prüfung und Genehmigung geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcenkosten vor der Bereitstellung
- **Risikominderung**: Verringerte Bereitstellungsfehler durch vorherige Validierung

#### Technische Umsetzung
- **Multidokument-Integration**: Preview-Funktion in 4 wichtigen Dateien dokumentiert
- **Befehlsmuster**: Konsistente Syntax und Beispiele in der gesamten Dokumentation
- **Integration bewährter Verfahren**: Preview in Validierungsworkflows und Skripten enthalten
- **Visuelle Indikatoren**: Klare NEUE Funktionskennzeichnungen zur Auffindbarkeit

#### Workshop-Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Farbverlauf-Styling
- **Benutzererlebnis**: Klarer Entwicklungsstatus verhindert Verwirrung
- **Professionelle Darstellung**: Bewahrt die Glaubwürdigkeit des Repositories und setzt Erwartungen
- **Zeitplan-Transparenz**: Oktober 2025 „zuletzt aktualisiert“-Zeitstempel zur Rechenschaftspflicht

### [v3.3.0] - 2025-09-24

#### Erweiterte Workshop-Materialien und interaktives Lernerlebnis
**Diese Version führt umfassende Workshop-Materialien mit browserbasierten interaktiven Anleitungen und strukturierten Lernpfaden ein.**

#### Hinzugefügt
- **🎥 Interaktiver Workshop-Leitfaden**: Browserbasierte Workshop-Erfahrung mit MkDocs-Vorschaufunktion
- **📝 Strukturierte Workshop-Anleitungen**: 7-stufiger geführter Lernpfad von Entdeckung bis Anpassung
  - 0-Introduction: Workshop-Übersicht und Einrichtung
  - 1-Select-AI-Template: Vorlagenerkennung und Auswahlprozess
  - 2-Validate-AI-Template: Bereitstellungs- und Validierungsverfahren
  - 3-Deconstruct-AI-Template: Verständnis der Vorlagenarchitektur
  - 4-Configure-AI-Template: Konfiguration und Anpassung
  - 5-Customize-AI-Template: Erweiterte Modifikationen und Iterationen
  - 6-Teardown-Infrastructure: Bereinigung und Ressourcenmanagement
  - 7-Wrap-up: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Tooling**: MkDocs-Konfiguration mit Material-Theme für ein verbessertes Lernerlebnis
- **🎯 Praktischer Lernpfad**: 3-stufige Methodik (Entdeckung → Bereitstellung → Anpassung)
- **📱 GitHub Codespaces-Integration**: Nahtlose Einrichtung der Entwicklungsumgebung

#### Erweitert
- **AI Workshop Lab**: Erweitert um ein umfassendes, 2–3-stündiges strukturiertes Lernerlebnis
- **Workshop-Dokumentation**: Professionelle Präsentation mit Navigation und visuellen Hilfsmitteln
- **Lernfortschritt**: Klare Schritt-für-Schritt-Anleitung von der Vorlagenauswahl bis zur Produktionsbereitstellung
- **Entwicklererlebnis**: Integrierte Tools für optimierte Entwicklungsabläufe

#### Verbesserungen
- **Barrierefreiheit**: Browserbasierte Oberfläche mit Suche, Kopierfunktionalität und Themenumschalter
- **Selbstbestimmtes Lernen**: Flexible Workshop-Struktur zur Anpassung an verschiedene Lerngeschwindigkeiten
- **Praktische Anwendung**: Praxisnahe Bereitstellungsszenarien für AI-Vorlagen
- **Community-Integration**: Discord-Integration für Workshop-Support und Zusammenarbeit

#### Workshop-Funktionen
- **Integrierte Suche**: Schnelle Suche nach Stichwörtern und Lektionen
- **Codeblöcke kopieren**: Hover-to-copy-Funktionalität für alle Codebeispiele
- **Themenumschalter**: Unterstützung für Dunkel-/Hellmodus je nach Vorlieben
- **Visuelle Assets**: Screenshots und Diagramme für verbessertes Verständnis
- **Hilfefunktion**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Umfangreiche Neustrukturierung der Navigation und kapitelbasiertes Lernsystem
**Diese Version führt eine umfassende, kapitelbasierte Lernstruktur mit verbesserter Navigation im gesamten Repository ein.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Gesamter Kurs in 8 fortschreitende Lernkapitel umstrukturiert
  - Chapter 1: Grundlagen & Schnellstart (⭐ - 30–45 Min.)
  - Chapter 2: AI-zentrierte Entwicklung (⭐⭐ - 1–2 Stunden)
  - Chapter 3: Konfiguration & Authentifizierung (⭐⭐ - 45–60 Min.)
  - Chapter 4: Infrastruktur als Code & Bereitstellung (⭐⭐⭐ - 1–1,5 Stunden)
  - Chapter 5: Multi-Agent-AI-Lösungen (⭐⭐⭐⭐ - 2–3 Stunden)
  - Chapter 6: Vorbereitende Validierung & Planung vor der Bereitstellung (⭐⭐ - 1 Stunde)
  - Chapter 7: Fehlerbehebung & Debugging (⭐⭐ - 1–1,5 Stunden)
  - Chapter 8: Produktions- und Enterprise-Muster (⭐⭐⭐⭐ - 2–3 Stunden)
- **📚 Umfassendes Navigationssystem**: Konsistente Kopf- und Fußzeilen für die Navigation in der gesamten Dokumentation
- **🎯 Fortschrittsverfolgung**: Checkliste zum Kursabschluss und System zur Lernüberprüfung
- **🗺️ Lernpfadführung**: Klare Einstiegspunkte für unterschiedliche Erfahrungsstufen und Ziele
- **🔗 Querverweisnavigation**: Verwandte Kapitel und Voraussetzungen klar verlinkt

#### Verbesserte
- **README-Struktur**: In eine strukturierte Lernplattform mit kapitelbasierter Organisation umgewandelt
- **Dokumentationsnavigation**: Jede Seite enthält jetzt Kapitelkontext und Fortschrittsführung
- **Vorlagenorganisation**: Beispiele und Vorlagen passenden Lernkapiteln zugeordnet
- **Ressourcenintegration**: Spickzettel, FAQs und Lernführer mit relevanten Kapiteln verknüpft
- **Workshop-Integration**: Praktische Labore mehreren Lernzielen der Kapitel zugeordnet

#### Geändert
- **Lernverlauf**: Vom linearen Dokumentationsformat zu flexibel kapitelbasiertem Lernen verschoben
- **Platzierung der Konfiguration**: Leitfaden zur Konfiguration als Kapitel 3 neu positioniert für besseren Lernfluss
- **AI-Inhaltsintegration**: Bessere Einbindung AI-spezifischer Inhalte im gesamten Lernverlauf
- **Produktionsinhalte**: Erweiterte Muster in Kapitel 8 für Unternehmenslerner konsolidiert

#### Verbessert
- **Benutzererlebnis**: Klare Navigationspfade (Breadcrumbs) und Kapitel-Fortschrittsindikatoren
- **Barrierefreiheit**: Konsistente Navigationsmuster für einfacheres Durcharbeiten des Kurses
- **Professionelle Präsentation**: Universitätsähnliche Kursstruktur, geeignet für akademische und betriebliche Schulungen
- **Lern-Effizienz**: Reduzierte Zeit zum Finden relevanter Inhalte durch verbesserte Organisation

#### Technische Implementierung
- **Navigationsheader**: Standardisierte Kapitelnavigation über 40+ Dokumentationsdateien
- **Footer-Navigation**: Konsistente Fortschrittsführung und Kapitelabschlussanzeigen
- **Verlinkung**: Umfassendes internes Verlinkungssystem, das verwandte Konzepte verbindet
- **Kapitelzuordnung**: Vorlagen und Beispiele klar Lernzielen zugeordnet

#### Verbesserung des Studienleitfadens
- **📚 Umfassende Lernziele**: Studienleitfaden umstrukturiert, um mit dem 8-Kapitel-System übereinzustimmen
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Abschlusschecklisten
- **❓ Bewertungsfragen**: Wissensvalidierungsfragen für jedes Kapitel mit beruflichen Ergebnissen
- **🛠️ Praktische Übungen**: Praktische Aktivitäten mit realen Bereitstellungsszenarien und Fehlerbehebung
- **📊 Fähigkeitsentwicklung**: Klarer Aufstieg von grundlegenden Konzepten zu Enterprise-Mustern mit Fokus auf Karriereentwicklung
- **🎓 Zertifizierungsrahmen**: Berufliche Entwicklungsergebnisse und Community-Anerkennungssystem
- **⏱️ Zeitplanverwaltung**: Strukturierter 10-Wochen-Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 2025-09-17

#### Verbesserte Multi-Agent-AI-Lösungen
**Diese Version verbessert die Multi-Agent-Retail-Lösung durch bessere Agentenbenennung und erweiterte Dokumentation.**

#### Geändert
- **Multi-Agent Terminologie**: "Cora agent" durch "Customer agent" in der gesamten Retail-Multi-Agent-Lösung ersetzt, um ein klareres Verständnis zu ermöglichen
- **Agentenarchitektur**: Alle Dokumentationen, ARM-Vorlagen und Codebeispiele aktualisiert, um durchgehend die Bezeichnung "Customer agent" zu verwenden
- **Konfigurationsbeispiele**: Agentenkonfigurationsmuster modernisiert mit aktualisierten Namenskonventionen
- **Konsistenz der Dokumentation**: Sicherstellung, dass alle Verweise professionelle, beschreibende Agentennamen verwenden

#### Verbessert
- **ARM Template-Paket**: Aktualisiertes retail-multiagent-arm-template mit Verweisen auf Customer agent
- **Architekturdiagramme**: Überarbeitete Mermaid-Diagramme mit aktualisierter Agentenbenennung
- **Codebeispiele**: Python-Klassen und Implementierungsbeispiele verwenden nun die Bezeichnung CustomerAgent
- **Umgebungsvariablen**: Alle Bereitstellungsskripte aktualisiert, um die Konventionen CUSTOMER_AGENT_NAME zu verwenden

#### Verbesserte
- **Entwicklererlebnis**: Klarere Agentenrollen und Verantwortlichkeiten in der Dokumentation
- **Produktionsreife**: Bessere Abstimmung mit Unternehmens-Namenskonventionen
- **Lernmaterialien**: Intuitivere Agentenbenennung für Ausbildungszwecke
- **Vorlagen-Benutzbarkeit**: Vereinfachtes Verständnis von Agentenfunktionen und Bereitstellungsmustern

#### Technische Details
- Aktualisierte Mermaid-Architekturdiagramme mit Verweisen auf CustomerAgent
- CoraAgent Klassennamen in Python-Beispielen durch CustomerAgent ersetzt
- ARM-Template-JSON-Konfigurationen geändert, um den Agententyp "customer" zu verwenden
- Umgebungsvariablen von CORA_AGENT_* auf CUSTOMER_AGENT_* Muster aktualisiert
- Alle Bereitstellungsbefehle und Containerkonfigurationen überarbeitet

### [v3.0.0] - 2025-09-12

#### Wesentliche Änderungen - Fokus auf AI-Entwickler und Microsoft Foundry-Integration
**Diese Version verwandelt das Repository in eine umfassende, AI-fokussierte Lernressource mit Microsoft Foundry-Integration.**

#### Hinzugefügt
- **🤖 AI-First-Lernpfad**: Komplette Umstrukturierung mit Priorisierung von AI-Entwicklern und -Ingenieuren
- **Microsoft Foundry Integrationsleitfaden**: Umfassende Dokumentation zur Verbindung von AZD mit Microsoft Foundry-Diensten
- **AI-Modell-Bereitstellungsmuster**: Detaillierter Leitfaden zu Modellauswahl, Konfiguration und Strategien zur Produktionsbereitstellung
- **AI Workshop Lab**: 2–3-stündiger Hands-on-Workshop zur Umwandlung von AI-Anwendungen in AZD-deploybare Lösungen
- **Produktions-AI Best Practices**: Enterprise-taugliche Muster zur Skalierung, Überwachung und Absicherung von AI-Workloads
- **AI-spezifischer Troubleshooting-Leitfaden**: Umfassende Fehlerbehebung für Microsoft Foundry Models, Cognitive Services und AI-Bereitstellungsprobleme
- **AI-Vorlagengalerie**: Vorgestellte Sammlung von Microsoft Foundry-Vorlagen mit Komplexitätsbewertungen
- **Workshop-Materialien**: Vollständige Workshop-Struktur mit praktischen Laboren und Referenzmaterialien

#### Verbessert
- **README-Struktur**: Auf AI-Entwickler fokussiert mit 45% Community-Interesse laut Microsoft Foundry Discord
- **Lernpfade**: Spezieller Weg für AI-Entwickler neben traditionellen Pfaden für Studierende und DevOps-Ingenieure
- **Vorlagenempfehlungen**: Vorgestellte AI-Vorlagen einschließlich azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community-Integration**: Verbesserte Discord-Community-Unterstützung mit AI-spezifischen Kanälen und Diskussionen

#### Sicherheit & Produktionsfokus
- **Managed Identity-Muster**: AI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Kostenoptimierung**: Token-Nutzungsverfolgung und Budgetkontrollen für AI-Workloads
- **Multi-Region-Bereitstellung**: Strategien für globale Bereitstellung von AI-Anwendungen
- **Performance-Überwachung**: AI-spezifische Metriken und Integration mit Application Insights

#### Dokumentationsqualität
- **Linearer Kursaufbau**: Logische Progression von Anfänger- zu fortgeschrittenen AI-Bereitstellungsmustern
- **Validierte URLs**: Alle externen Repository-Links überprüft und zugänglich
- **Vollständige Referenz**: Alle internen Dokumentationslinks validiert und funktionsfähig
- **Produktionsbereit**: Enterprise-Bereitstellungsmuster mit realen Beispielen

### [v2.0.0] - 2025-09-09

#### Wesentliche Änderungen - Repository-Umstrukturierung und professionelle Aufwertung
**Diese Version stellt eine umfassende Überarbeitung der Repositoriumstruktur und Inhaltspräsentation dar.**

#### Hinzugefügt
- **Strukturiertes Lernframework**: Alle Dokumentationsseiten enthalten jetzt Abschnitte für Einführung, Lernziele und Lernergebnisse
- **Navigationssystem**: Vorherige/Nächste-Lektionslinks in der gesamten Dokumentation hinzugefügt für geführte Lernfortschritte
- **Studienleitfaden**: Umfassende study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professionelle Präsentation**: Alle Emoji-Icons entfernt für verbesserte Barrierefreiheit und professionelles Erscheinungsbild
- **Verbesserte Inhaltsstruktur**: Verbesserte Organisation und Fluss der Lernmaterialien

#### Geändert
- **Dokumentationsformat**: Alle Dokumentationen mit konsistenter, lernorientierter Struktur standardisiert
- **Navigationsfluss**: Logische Progression durch alle Lernmaterialien implementiert
- **Inhaltspräsentation**: Dekorative Elemente zugunsten klarer, professioneller Formatierung entfernt
- **Linkstruktur**: Alle internen Links aktualisiert, um das neue Navigationssystem zu unterstützen

#### Verbessert
- **Barrierefreiheit**: Emoji-Abhängigkeiten entfernt für bessere Kompatibilität mit Screenreadern
- **Professionelles Erscheinungsbild**: Saubere, akademische Präsentation geeignet für Unternehmensschulungen
- **Lernerlebnis**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Inhaltsorganisation**: Besserer logischer Fluss und Verbindung zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Erstveröffentlichung - Umfassendes AZD-Lernrepository

#### Hinzugefügt
- **Kern-Dokumentationsstruktur**
  - Vollständige Getting-Started-Anleitung-Serie
  - Umfassende Dokumentation zu Bereitstellung und Provisionierung
  - Detaillierte Ressourcen zur Fehlerbehebung und Debugging-Leitfäden
  - Werkzeuge und Verfahren zur Validierung vor der Bereitstellung

- **Getting-Started-Modul**
  - AZD Basics: Kernkonzepte und Terminologie
  - Installationsanleitung: Plattform-spezifische Setup-Anweisungen
  - Konfigurationsanleitung: Umgebungseinrichtung und Authentifizierung
  - Erstes-Projekt-Tutorial: Schritt-für-Schritt Hands-on-Lernen

- **Bereitstellungs- und Provisionierungsmodul**
  - Bereitstellungsleitfaden: Vollständige Workflow-Dokumentation
  - Provisioning-Leitfaden: Infrastruktur als Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Multi-Service-Architektur-Muster

- **Modul zur Validierung vor der Bereitstellung**
  - Kapazitätsplanung: Validierung der Verfügbarkeit von Azure-Ressourcen
  - SKU-Auswahl: Umfassende Anleitung zur Service-Tier-Auswahl
  - Pre-Flight-Checks: Automatisierte Validierungsskripte (PowerShell und Bash)
  - Kostenabschätzungs- und Budgetplanungswerkzeuge

- **Fehlerbehebungsmodul**
  - Häufige Probleme: Häufig auftretende Probleme und Lösungen
  - Debugging-Leitfaden: Systematische Fehlerbehebungsmethoden
  - Erweiterte Diagnosetechniken und -werkzeuge
  - Performance-Monitoring und -Optimierung

- **Ressourcen und Referenzen**
  - Kommando-Spickzettel: Schnelle Referenz für wesentliche Befehle
  - Glossar: Umfassende Begriffserklärungen und Akronyme
  - FAQ: Detaillierte Antworten auf häufige Fragen
  - Externe Ressourcenlinks und Community-Verbindungen

- **Beispiele und Vorlagen**
  - Beispiel einer einfachen Webanwendung
  - Vorlage für die Bereitstellung einer statischen Website
  - Konfiguration von Container-Anwendungen
  - Muster zur Datenbankintegration
  - Beispiele für Microservices-Architekturen
  - Implementierungen von serverlosen Funktionen

#### Funktionen
- **Plattformübergreifende Unterstützung**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Mehrere Fähigkeitsstufen**: Inhalte für Lernende bis hin zu professionellen Entwicklern konzipiert
- **Praktischer Fokus**: Hands-on-Beispiele und reale Szenarien
- **Umfassende Abdeckung**: Von grundlegenden Konzepten bis zu fortgeschrittenen Enterprise-Mustern
- **Sicherheitsorientierter Ansatz**: Sicherheits-Best-Practices durchgehend integriert
- **Kostenoptimierung**: Richtlinien für kosteneffiziente Bereitstellungen und Ressourcenverwaltung

#### Dokumentationsqualität
- **Detaillierte Codebeispiele**: Praktische, getestete Codebeispiele
- **Schritt-für-Schritt-Anleitungen**: Klare, umsetzbare Anweisungen
- **Umfassende Fehlerbehandlung**: Fehlerbehebung für häufige Probleme
- **Integration von Best Practices**: Industriestandards und Empfehlungen
- **Versionskompatibilität**: Auf dem neuesten Stand mit den aktuellsten Azure-Diensten und azd-Funktionen

## Geplante zukünftige Verbesserungen

### Version 3.1.0 (Geplant)
#### AI-Plattform-Erweiterung
- **Multi-Model Support**: Integrationsmuster für Hugging Face, Azure Machine Learning und benutzerdefinierte Modelle
- **AI Agent Frameworks**: Vorlagen für LangChain, Semantic Kernel und AutoGen-Bereitstellungen
- **Advanced RAG Patterns**: Vektor-Datenbankoptionen jenseits von Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Verbesserte Überwachung für Modellleistung, Token-Nutzung und Antwortqualität

#### Developer Experience
- **VS Code Extension**: Integriertes AZD + Microsoft Foundry Entwicklungserlebnis
- **GitHub Copilot Integration**: KI-unterstützte AZD-Template-Generierung
- **Interactive Tutorials**: Interaktive Coding-Übungen mit automatisierter Validierung für KI-Szenarien
- **Video Content**: Ergänzende Videotutorials für visuelle Lernende mit Fokus auf KI-Bereitstellungen

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Governance-Rahmenwerk für KI-Modelle, Compliance und Prüfpfade
- **Multi-Tenant AI**: Muster zur Bereitstellung für mehrere Kunden mit isolierten KI-Diensten
- **Edge AI Deployment**: Integration mit Azure IoT Edge und Container Instances
- **Hybrid Cloud AI**: Multi-Cloud- und Hybrid-Bereitstellungsmuster für KI-Workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps-Integration mit Azure Machine Learning-Pipelines
- **Advanced Security**: Zero-Trust-Muster, private Endpunkte und erweiterter Bedrohungsschutz
- **Performance Optimization**: Erweiterte Tuning- und Skalierungsstrategien für KI-Anwendungen mit hohem Durchsatz
- **Global Distribution**: Content-Delivery- und Edge-Caching-Muster für KI-Anwendungen

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Umfassende Microsoft Foundry-Integration (Abgeschlossen)
- ✅ **Interactive Tutorials**: Praktisches KI-Workshop-Lab (Abgeschlossen)
- ✅ **Advanced Security Module**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Performance Optimization**: Tuning-Strategien für KI-Workloads (Abgeschlossen)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: KI-orientierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Extended FAQ**: KI-spezifische Fragen und Fehlersuche (Abgeschlossen)
- **Tool Integration**: Verbesserte IDE- und Editor-Integrationsanleitungen
- ✅ **Monitoring Expansion**: KI-spezifische Überwachungs- und Alarmierungsmuster (Abgeschlossen)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsives Design für mobiles Lernen
- **Offline Access**: Herunterladbare Dokumentationspakete
- **Enhanced IDE Integration**: VS Code-Erweiterung für AZD + KI-Workflows
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
- Zusätzliche Tools, Skripte oder Hilfsprogramme

#### Changed
- Änderungen an vorhandener Funktionalität oder Dokumentation
- Aktualisierungen zur Verbesserung von Klarheit oder Genauigkeit
- Umstrukturierung von Inhalten oder Organisation

#### Deprecated
- Funktionen oder Ansätze, die ausgephast werden
- Dokumentationsabschnitte, die zur Entfernung vorgesehen sind
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
- Sicherheitsrelevante Verbesserungen oder Fixes
- Aktualisierungen zu Sicherheitsbest Practices
- Behebung von Sicherheitslücken

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking Changes, die Benutzeraktionen erfordern
- Wesentliche Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundsätzlichen Ansatz oder die Methodik verändern

#### Minor Version (X.Y.0)
- Neue Funktionen oder Inhaltserweiterungen
- Verbesserungen, die abwärtskompatibel bleiben
- Zusätzliche Beispiele, Tools oder Ressourcen

#### Patch Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleinere Verbesserungen an bestehendem Inhalt
- Klarstellungen und kleine Erweiterungen

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Issues willkommen)
- **Discord Discussions**: Ideen teilen und sich mit der Microsoft Foundry Community austauschen
- **Pull Requests**: Direkte Verbesserungen am Inhalt beitragen, insbesondere KI-Vorlagen und -Anleitungen
- **Microsoft Foundry Discord**: Teilnahme am #Azure-Kanal für AZD + KI-Diskussionen
- **Community Forums**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback Categories
- **AI Content Accuracy**: Korrekturen zu KI-Service-Integration und Bereitstellungsinformationen
- **Learning Experience**: Vorschläge zur Verbesserung des KI-Entwickler-Lernflusses
- **Missing AI Content**: Anfragen für zusätzliche KI-Vorlagen, -Muster oder -Beispiele
- **Accessibility**: Verbesserungen für vielfältige Lernbedürfnisse
- **AI Tool Integration**: Vorschläge zur besseren Integration von KI-Entwicklungs-Workflows
- **Production AI Patterns**: Anfragen für Unternehmens-KI-Bereitstellungsmuster

### Response Commitment
- **Issue Response**: Innerhalb von 48 Stunden für gemeldete Probleme
- **Feature Requests**: Bewertung innerhalb einer Woche
- **Community Contributions**: Prüfung innerhalb einer Woche
- **Security Issues**: Sofortige Priorität mit beschleunigter Reaktion

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Überprüfung der Inhaltsgenauigkeit und Validierung von Links
- **Quarterly Updates**: Wichtige Inhaltsergänzungen und Verbesserungen
- **Semi-Annual Reviews**: Umfassende Umstrukturierung und Erweiterungen
- **Annual Releases**: Große Versionsupdates mit signifikanten Verbesserungen

### Monitoring and Quality Assurance
- **Automated Testing**: Regelmäßige Validierung von Codebeispielen und Links
- **Community Feedback Integration**: Regelmäßige Einbindung von Nutzeranregungen
- **Technology Updates**: Anpassung an die neuesten Azure-Services und azd-Releases
- **Accessibility Audits**: Regelmäßige Überprüfung der Prinzipien inklusiven Designs

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Volle Unterstützung mit regelmäßigen Updates
- **Previous Major Version**: Sicherheitsupdates und kritische Fixes für 12 Monate
- **Legacy Versions**: Nur Community-Unterstützung, keine offiziellen Updates

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Schritt-für-Schritt-Anleitungen für die Migration
- **Compatibility Notes**: Details zu Breaking Changes
- **Tool Support**: Skripte oder Hilfsprogramme zur Unterstützung der Migration
- **Community Support**: Dedizierte Foren für Migrationsfragen

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Beobachten Sie dieses Repository für Benachrichtigungen über neue Releases und wichtige Updates der Lernmaterialien.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI‑Übersetzungsdienst Co‑op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->