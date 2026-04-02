# Änderungsprotokoll - AZD For Beginners

## Einführung

Dieses Änderungsprotokoll dokumentiert alle nennenswerten Änderungen, Aktualisierungen und Verbesserungen am Repository AZD For Beginners. Wir folgen den Prinzipien der semantischen Versionierung und pflegen dieses Protokoll, um Nutzern zu helfen zu verstehen, was sich zwischen den Versionen geändert hat.

## Lernziele

Durch das Durchsehen dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und hinzugefügte Inhalte informiert bleiben
- Verbesserungen an der bestehenden Dokumentation verstehen
- Fehlerbehebungen und Korrekturen nachverfolgen, um Genauigkeit zu gewährleisten
- Die Entwicklung der Lernmaterialien im Laufe der Zeit verfolgen

## Lernergebnisse

Nach Durchsicht der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und verfügbare Ressourcen zum Lernen zu identifizieren
- Zu verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernpfad auf Grundlage der aktuellsten Materialien zu planen
- Feedback und Vorschläge für zukünftige Verbesserungen beizutragen

## Versionshistorie

### [v3.19.1] - 2026-03-27

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**Diese Version setzt den Validierungssweep für AZD 1.23 mit einem dokumentationsorientierten Durchgang für Anfänger fort: Sie klärt die AZD-first Authentifizierungsanleitung, fügt lokale Setup-Validierungsskripte hinzu, überprüft wichtige Befehle gegen die Live-AZD-CLI und entfernt die letzten veralteten englischsprachigen Befehlsreferenzen außerhalb des Änderungsprotokolls.**

#### Hinzugefügt
- **🧪 Validierungsskripte für Anfänger-Setup** mit `validate-setup.ps1` und `validate-setup.sh`, damit Lernende die erforderlichen Tools bestätigen können, bevor sie mit Kapitel 1 beginnen
- **✅ Vorab-Setup-Validierungsschritte** im Root-README und im Chapter 1 README, damit fehlende Voraussetzungen abgefangen werden, bevor `azd up` ausgeführt wird

#### Geändert
- **🔐 Anleitung zur Authentifizierung für Anfänger** behandelt `azd auth login` nun konsequent als primären Weg für AZD-Workflows, wobei `az login` als optional hervorgehoben wird, sofern Azure-CLI-Befehle nicht direkt verwendet werden
- **📚 Onboarding-Flow in Kapitel 1** verweist Lernende jetzt darauf, ihr lokales Setup vor Installation, Authentifizierung und ersten Deployment-Schritten zu validieren
- **🛠️ Validator-Meldungen** trennen nun deutlich blockierende Anforderungen von optionalen Azure-CLI-Warnungen für den AZD-only Anfängerpfad
- **📖 Konfigurations-, Fehlerbehebungs- und Beispieldokumente** unterscheiden jetzt zwischen erforderlicher AZD-Authentifizierung und optionaler Azure-CLI-Anmeldung, wo zuvor beides ohne Kontext dargestellt wurde

#### Behoben
- **📋 Verbleibende englischsprachige Befehlsreferenzen** auf aktuelle AZD-Formen aktualisiert, einschließlich `azd config show` im Spickzettel und `azd monitor --overview` an Stellen, wo Azure-Portal-Overview-Anleitungen gemeint waren
- **🧭 Aussagen für Anfänger in Kapitel 1** abgeschwächt, um Überversprechen bez. garantiert fehlerfreier oder automatischer Rollback-Verhalten über alle Templates und Azure-Ressourcen hinweg zu vermeiden
- **🔎 Live-CLI-Validierung** bestätigte aktuellen Support für `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` und `azd down --force --purge`

#### Aktualisierte Dateien
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**Diese Version führt eine Dokumentationsvalidierung gegen `azd` `1.23.12` durch, aktualisiert veraltete AZD-Befehlsbeispiele, aktualisiert die KI-Modellhinweise auf aktuelle Standardwerte und erweitert die Workshop-Anleitungen über GitHub Codespaces hinaus, um auch Dev-Container und lokale Klone zu unterstützen.**

#### Hinzugefügt
- **✅ Validierungshinweise in den Kernkapiteln und Workshop-Dokumenten** um die getestete AZD-Basisversion für Lernende, die neuere oder ältere CLI-Builds verwenden, explizit zu machen
- **⏱️ Hinweise zu Deployment-Timeouts** für lang laufende KI-App-Deployments mit `azd deploy --timeout 1800`
- **🔎 Schritte zur Erweiterungsinspektion** mit `azd extension show azure.ai.agents` in den AI-Workflow-Dokumenten
- **🌐 Erweiterte Workshop-Umgebungsanleitung** mit Abdeckung für GitHub Codespaces, Dev-Container und lokale Klone mit MkDocs

#### Geändert
- **📚 Kapitel-Intro-READMEs** vermerken nun durchgängig die Validierung gegen `azd 1.23.12` in Foundation-, Configuration-, Infrastructure-, Multi-Agent-, Pre-Deployment-, Troubleshooting- und Production-Abschnitten
- **🛠️ AZD-Befehlsreferenzen** in den Dokumenten auf aktuelle Formen aktualisiert:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` oder `azd env get-value(s)` je nach Kontext
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` dort, wo eine Application Insights-Übersicht gemeint ist
- **🧪 Provision-Preview-Beispiele** vereinfacht auf aktuell unterstützte Nutzung wie `azd provision --preview` und `azd provision --preview -e production`
- **🧭 Workshop-Ablauf** aktualisiert, sodass Lernende die Labs in Codespaces, einem Dev-Container oder einem lokalen Klon abschließen können, statt Codespaces-only vorauszusetzen
- **🔐 Authentifizierungsanleitung** bevorzugt jetzt `azd auth login` für AZD-Workflows, wobei `az login` als optional gilt, wenn Azure-CLI-Befehle direkt verwendet werden

#### Behoben
- **🪟 Windows-Installationsbefehle** in der Installationsanleitung auf die aktuelle Groß-/Kleinschreibung des `winget`-Pakets normalisiert
- **🐧 Linux-Installationsanleitung** korrigiert, um nicht unterstützte distro-spezifische `azd` Paketmanager-Anweisungen zu vermeiden und stattdessen auf Release-Assets zu verweisen, wo passend
- **📦 KI-Modellbeispiele** von älteren Standardwerten wie `gpt-35-turbo` und `text-embedding-ada-002` auf aktuelle Beispiele wie `gpt-4.1-mini`, `gpt-4.1` und `text-embedding-3-large` aktualisiert
- **📋 Deployment- und Diagnose-Snippets** korrigiert, um aktuelle Environment- und Statusbefehle in Logs, Skripten und Troubleshooting-Schritten zu verwenden
- **⚙️ GitHub Actions Hinweise** aktualisiert von `Azure/setup-azd@v1.0.0` auf `Azure/setup-azd@v2`
- **🤖 MCP/Copilot Consent Anleitung** aktualisiert von `azd mcp consent` zu `azd copilot consent list`

#### Verbessert
- **🧠 KI-Kapitel-Anleitungen** erklären jetzt besser preview-sensitive `azd ai`-Verhalten, mandantenspezifische Logins, aktuellen Erweiterungsgebrauch und aktualisierte Empfehlungen für Modell-Deployments
- **🧪 Workshop-Anleitungen** verwenden realistischere Versionsbeispiele und klarere Formulierungen zur Einrichtung der Umgebung für Hands-on-Labs
- **📈 Produktions- und Troubleshooting-Dokumente** stimmen besser mit aktuellen Monitoring-, Fallback-Modell- und Kostenstufenbeispielen überein

#### Aktualisierte Dateien
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Diese Version fügt Abdeckung für `azd ai`, `azd extension` und `azd mcp` Befehle in allen AI-bezogenen Kapiteln hinzu, behebt defekte Links und veralteten Code in agents.md, aktualisiert den Spickzettel und überarbeitet den Abschnitt Beispiel-Templates mit validierten Beschreibungen und neuen Azure AI AZD-Templates.**

#### Hinzugefügt
- **🤖 AZD AI CLI-Abdeckung** über 7 Dateien (zuvor nur in Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Neuer Abschnitt "Extensions and AI Commands", der `azd extension`, `azd ai agent init` und `azd mcp` vorstellt
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` mit Vergleichstabelle (Template- vs. Manifest-Ansatz)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Unterabschnitte "AZD Extensions for Foundry" und "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start zeigt jetzt sowohl Template- als auch Manifest-basierte Deployment-Pfade
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Der Deploy-Abschnitt enthält jetzt die Option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Unterabschnitt "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Neuer Abschnitt "AI & Extensions Commands" mit `azd extension`, `azd ai agent init`, `azd mcp` und `azd infra generate`
- **📦 Neue AZD AI Beispiel-Templates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-Chat mit Blazor WebAssembly, Semantic Kernel und Sprach-Chat-Unterstützung
  - **azure-search-openai-demo-java** — Java RAG-Chat mit Langchain4J und Bereitstellungsoptionen für ACA/AKS
  - **contoso-creative-writer** — Multi-Agent Creative-Writing-App mit Azure AI Agent Service, Bing Grounding und Prompty
  - **serverless-chat-langchainjs** — Serverless RAG mit Azure Functions + LangChain.js + Cosmos DB und Ollama für lokale Entwicklung
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-Accelerator mit Admin-Portal, Teams-Integration und PostgreSQL/Cosmos DB-Optionen
  - **azure-ai-travel-agents** — Multi-Agent MCP-Orchestrierungs-Referenzapp mit Servern in .NET, Python, Java und TypeScript
  - **azd-ai-starter** — Minimaler Azure AI Infrastruktur-Bicep-Starter-Template
  - **🔗 Awesome AZD AI Gallery link** — Verweis auf die [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ Templates)

#### Behoben
- **🔗 Navigation in agents.md**: Previous/Next-Links stimmen jetzt mit der Lektionenreihenfolge im Chapter 2 README überein (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Defekte Links in agents.md**: `production-ai-practices.md` auf `../chapter-08-production/production-ai-practices.md` korrigiert (3 Vorkommen)
- **📦 Veralteter Code in agents.md**: `opencensus` ersetzt durch `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Ungültige API in agents.md**: `max_tokens` von `create_agent()` zu `create_run()` als `max_completion_tokens` verschoben
- **🔢 Token-Zählung in agents.md**: Grobe `len//4`-Schätzung ersetzt durch `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Dienste von "Cognitive Search + App Service" auf "Azure AI Search + Azure Container Apps" korrigiert (Standard-Host geändert Okt 2024)
- **contoso-chat**: Beschreibung aktualisiert, um Azure AI Foundry + Prompty zu referenzieren, entsprechend dem tatsächlichen Titel und Tech-Stack des Repos

#### Entfernt
- **ai-document-processing**: Nicht-funktionale Template-Referenz entfernt (Repo nicht öffentlich zugänglich als AZD-Template)

#### Verbessert
- **📝 agents.md Übungen**: Übung 1 zeigt jetzt die erwartete Ausgabe und den `azd monitor`-Schritt; Übung 2 enthält den vollständigen `FunctionTool`-Registrierungscode; Übung 3 ersetzt vage Hinweise durch konkrete `prepdocs.py`-Befehle
- **📚 agents.md Ressourcen**: Dokumentationslinks zur aktuellen Azure AI Agent Service-Dokumentation und zum Quickstart aktualisiert
- **📋 agents.md Next Steps table**: Link zum AI Workshop Lab für vollständige Kapitelabdeckung hinzugefügt

#### Dateien aktualisiert
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Verbesserte Kursnavigation
Diese Version verbessert die Kapitel-Navigation in README.md mit einem erweiterten Tabellenformat.

#### Geändert
- **Kursübersichtstabelle**: Erweitert um direkte Links zu Lektionen, Dauerabschätzungen und Komplexitätsbewertungen
- **Aufräumen der Ordner**: Überflüssige alte Ordner entfernt (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidierung**: Alle 21+ internen Links in der Kursübersichtstabelle verifiziert

### [v3.16.0] - 2026-02-05

#### Produktnamen-Aktualisierungen
Diese Version aktualisiert Produktreferenzen auf das aktuelle Microsoft-Branding.

#### Geändert
- **Microsoft Foundry → Microsoft Foundry**: Alle Referenzen in Nicht-Übersetzungsdateien aktualisiert
- **Azure AI Agent Service → Foundry Agents**: Service-Name aktualisiert, um das aktuelle Branding widerzuspiegeln

#### Dateien aktualisiert
- `README.md` - Hauptseite des Kurses
- `changelog.md` - Versionsverlauf
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - KI-Agenten-Leitfaden
- `examples/README.md` - Beispieledokumentation
- `workshop/README.md` - Workshop-Startseite
- `workshop/docs/index.md` - Workshop-Index
- `workshop/docs/instructions/*.md` - Alle Workshop-Anleitungsdateien

---

### [v3.15.0] - 2026-02-05

#### Wichtige Repository-Umstrukturierung: Kapitelbasierte Ordnernamen
Diese Version strukturiert die Dokumentation in dedizierte Kapitelordner um, um die Navigation zu verbessern.

#### Ordnerumbenennungen
Alte Ordner wurden durch kapitelnummerierte Ordner ersetzt:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
  - Lernziele und Dauer
  - Lektionstabelle mit Beschreibungen
  - Schnellstartbefehle
  - Navigation zu anderen Kapiteln

#### Geändert
- **🔗 Alle internen Links aktualisiert**: 78+ Pfade in der gesamten Dokumentation aktualisiert
- **🗺️ Haupt-README.md**: Kursübersicht mit neuer Kapitelstruktur aktualisiert
- **📝 examples/README.md**: Querverweise auf Kapitelordner aktualisiert

#### Entfernt
- Alte Ordnerstruktur entfernt (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-Umstrukturierung: Kapitel-Navigation
Diese Version fügte Kapitel-Navigations-README-Dateien hinzu (durch v3.15.0 superseded).

---

### [v3.13.0] - 2026-02-05

#### Neuer Leitfaden für KI-Agenten
Diese Version fügt einen umfassenden Leitfaden zur Bereitstellung von KI-Agenten mit der Azure Developer CLI hinzu.

#### Hinzugefügt
- **🤖 docs/microsoft-foundry/agents.md**: Umfassender Leitfaden, der abdeckt:
  - Was KI-Agenten sind und wie sie sich von Chatbots unterscheiden
  - Drei Quick-Start-Agentenvorlagen (Foundry Agents, Prompty, RAG)
  - Agenten-Architektur-Muster (Einzelagent, RAG, Multi-Agent)
  - Tool-Konfiguration und Anpassung
  - Überwachung und Metrikverfolgung
  - Kostenüberlegungen und Optimierung
  - Häufige Fehlerbehebungsszenarien
  - Drei praxisorientierte Übungen mit Erfolgskriterien

#### Inhaltsstruktur
- **Einführung**: Agentenkonzepte für Einsteiger
- **Schnellstart**: Agenten mit `azd init --template get-started-with-ai-agents` bereitstellen
- **Architektur-Muster**: Visuelle Diagramme der Agentenmuster
- **Konfiguration**: Tool-Setup und Umgebungsvariablen
- **Überwachung**: Integration mit Application Insights
- **Übungen**: Progressives praktisches Lernen (20–45 Minuten pro Übung)

---

### [v3.12.0] - 2026-02-05

#### Aktualisierung der DevContainer-Umgebung
Diese Version aktualisiert die DevContainer-Konfiguration mit modernen Tools und besseren Standardeinstellungen für die AZD-Lernumgebung.

#### Geändert
- **🐳 Basis-Image**: Aktualisiert von `python:3.12-bullseye` auf `python:3.12-bookworm` (aktuelle Debian-Stable-Version)
- **📛 Container-Name**: Umbenannt von "Python 3" in "AZD for Beginners" für mehr Klarheit

#### Hinzugefügt
- **🔧 Neue Dev Container-Funktionen**:
  - `azure-cli` mit aktiviertem Bicep-Support
  - `node:20` (LTS-Version für AZD-Vorlagen)
  - `github-cli` für Vorlagenverwaltung
  - `docker-in-docker` für Container-App-Bereitstellungen

- **🔌 Port-Weiterleitung**: Vorkonfigurierte Ports für gängige Entwicklungen:
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
  - `bierner.markdown-mermaid` - Mermaid-Diagrammunterstützung
  - `redhat.vscode-yaml` - YAML-Unterstützung (für azure.yaml)
  - `eamodio.gitlens` - Git-Visualisierung
  - `mhutchie.git-graph` - Git-Historie

- **⚙️ VS Code-Einstellungen**: Standard-Einstellungen für Python-Interpreter, Formatierung bei Speicherung und Entfernen von Leerzeichen hinzugefügt

- **📦 Aktualisierte requirements-dev.txt**:
  - MkDocs-Minify-Plugin hinzugefügt
  - pre-commit für Codequalität hinzugefügt
  - Azure SDK-Pakete hinzugefügt (azure-identity, azure-mgmt-resource)

#### Behoben
- **Post-Create-Befehl**: Überprüft jetzt AZD- und Azure CLI-Installation beim Start des Containers

---

### [v3.11.0] - 2026-02-05

#### README-Überarbeitung für Einsteiger
Diese Version verbessert README.md erheblich, um einsteigerfreundlicher zu sein, und fügt wichtige Ressourcen für KI-Entwickler hinzu.

#### Hinzugefügt
- **🆚 Azure CLI vs AZD Vergleich**: Klare Erklärung, wann welches Tool verwendet werden sollte, mit praktischen Beispielen
- **🌟 Tolle AZD-Galerie-Links**: Direkte Links zur Community-Vorlagengalerie und zu Beitragsressourcen:
  - [Awesome AZD-Galerie](https://azure.github.io/awesome-azd/) - 200+ bereit zur Bereitstellung stehende Vorlagen
  - [Eine Vorlage einreichen](https://github.com/Azure/awesome-azd/issues) - Community-Beiträge
- **🎯 Schnellstart-Anleitung**: Vereinfachter 3-Schritte-Einstieg (Installieren → Anmelden → Bereitstellen)
- **📊 Navigationstabelle basierend auf Erfahrung**: Klare Anleitung, wo man je nach Entwicklererfahrung beginnen sollte

#### Geändert
- **README-Struktur**: Für progressive Offenlegung umorganisiert – wichtigste Informationen zuerst
- **Einführungsabschnitt**: Umgeschrieben, um "Die Magie von `azd up`" für absolute Einsteiger zu erklären
- **Duplizierte Inhalte entfernt**: Doppelte Troubleshooting-Abschnitte eliminiert
- **Troubleshooting-Befehle**: `azd logs`-Verweise durch gültige `azd monitor --logs`-Verweise ersetzt

#### Behoben
- **🔐 Authentifizierungsbefehle**: `azd auth login` und `azd auth logout` zu cheat-sheet.md hinzugefügt
- **Ungültige Befehlsreferenzen**: Verbleibende `azd logs`-Verweise aus dem README-Troubleshooting-Bereich entfernt

#### Hinweise
- **Geltungsbereich**: Änderungen auf Haupt-README.md und resources/cheat-sheet.md angewendet
- **Zielgruppe**: Verbesserungen speziell auf Entwickler ausgerichtet, die neu bei AZD sind

---

### [v3.10.0] - 2026-02-05

#### Aktualisierung der Azure Developer CLI-Befehlsgenauigkeit
Diese Version korrigiert nicht existierende AZD-Befehle in der gesamten Dokumentation und stellt sicher, dass alle Codebeispiele gültige Azure Developer CLI-Syntax verwenden.

#### Behoben
- **🔧 Nicht vorhandene AZD-Befehle entfernt**: Umfassendes Audit und Korrektur ungültiger Befehle:
  - `azd logs` (existiert nicht) → ersetzt durch `azd monitor --logs` oder Azure CLI-Alternativen
  - `azd service` Unterbefehle (existieren nicht) → ersetzt durch `azd show` und Azure CLI
  - `azd infra import/export/validate` (existiert nicht) → entfernt oder durch gültige Alternativen ersetzt
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` Flags (existieren nicht) → entfernt
  - `azd provision --what-if/--rollback` Flags (existieren nicht) → auf `--preview` aktualisiert
  - `azd config validate` (existiert nicht) → ersetzt durch `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existieren nicht) → entfernt

- **📚 Dateien mit Befehlskorrekturen**:
  - `resources/cheat-sheet.md`: Umfassende Überarbeitung der Befehlsreferenz
  - `docs/deployment/deployment-guide.md`: Rollback- und Bereitstellungsstrategien korrigiert
  - `docs/troubleshooting/debugging.md`: Abschnitte zur Protokollanalyse korrigiert
  - `docs/troubleshooting/common-issues.md`: Fehlerbehebungsbefehle aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD-Debugging-Abschnitt korrigiert
  - `docs/getting-started/azd-basics.md`: Monitoring-Befehle korrigiert
  - `docs/getting-started/first-project.md`: Monitoring- und Debugging-Beispiele aktualisiert
  - `docs/getting-started/installation.md`: Hilfe- und Versionsbeispiele korrigiert
  - `docs/pre-deployment/application-insights.md`: Befehlsansichten für Protokolle korrigiert
  - `docs/pre-deployment/coordination-patterns.md`: Agenten-Debugging-Befehle korrigiert

- **📝 Versionsreferenz aktualisiert**:
  - `docs/getting-started/installation.md`: Harte Kodierung der Version `1.5.0` in generische `1.x.x` geändert mit Link zu Releases

#### Geändert
- **Rollback-Strategien**: Dokumentation auf Git-basiertes Rollback umgestellt (AZD hat kein natives Rollback)
- **Protokollanzeige**: `azd logs`-Verweise durch `azd monitor --logs`, `azd monitor --live` und Azure CLI-Befehle ersetzt
- **Leistungsabschnitt**: Nicht vorhandene Flags für parallele/incrementelle Bereitstellung entfernt und gültige Alternativen bereitgestellt

#### Technische Details
- **Gültige AZD-Befehle**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gültige azd monitor-Flags**: `--live`, `--logs`, `--overview`
- **Entfernte Funktionen**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Hinweise
- **Verifizierung**: Befehle gegen Azure Developer CLI v1.23.x validiert

---

### [v3.9.0] - 2026-02-05

#### Abschluss des Workshops und Aktualisierung der Dokumentationsqualität
**Diese Version vervollständigt die interaktiven Workshop-Module, behebt alle defekten Dokumentationslinks und verbessert die allgemeine Inhaltsqualität für KI-Entwickler, die Microsoft AZD verwenden.**

#### Hinzugefügt
- **📝 CONTRIBUTING.md**: Neues Dokument mit Beitragsrichtlinien, das Folgendes enthält:
  - Klare Anweisungen zum Melden von Problemen und Vorschlagen von Änderungen
  - Dokumentationsstandards für neue Inhalte
  - Richtlinien für Codebeispiele und Commit-Messages
  - Informationen zur Community-Beteiligung

#### Abgeschlossen
- **🎯 Workshop Modul 7 (Abschluss)**: Vollständig abgeschlossenes Abschlussmodul mit:
  - Umfassender Zusammenfassung der Workshop-Ergebnisse
  - Abschnitt zu erlernten Schlüsselkonzepten, der AZD, Vorlagen und Microsoft Foundry abdeckt
  - Empfehlungen zur Fortsetzung der Lernreise
  - Workshop-Herausforderungsübungen mit Schwierigkeitsbewertungen
  - Links für Community-Feedback und Support

- **📚 Workshop Modul 3 (Deconstruct)**: Lernziele aktualisiert mit:
  - Anleitung zur Aktivierung von GitHub Copilot mit MCP-Servern
  - Verständnis der Ordnerstruktur von AZD-Vorlagen
  - Organisationsmuster für Infrastructure-as-Code (Bicep)
  - Praktische Laboranleitungen

- **🔧 Workshop Modul 6 (Teardown)**: Abgeschlossen mit:
  - Ziele für Ressourcenbereinigung und Kostenmanagement
  - `azd down` Nutzung für sicheres Deprovisioning von Infrastruktur
  - Anleitung zur Wiederherstellung von soft-gelöschten Cognitive Services
  - Bonus-Explorationsaufgaben für GitHub Copilot und das Azure-Portal

#### Behoben
- **🔗 Behebung defekter Links**: 15+ interne Dokumentationslinks korrigiert:
  - `docs/ai-foundry/ai-model-deployment.md`: Pfade zu microsoft-foundry-integration.md korrigiert
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md und production-ai-practices.md Pfade korrigiert
  - `docs/getting-started/first-project.md`: Nicht vorhandenes cicd-integration.md durch deployment-guide.md ersetzt
  - `examples/retail-scenario.md`: FAQ- und Troubleshooting-Guide-Pfade korrigiert
  - `examples/container-app/microservices/README.md`: Kurs-Start- und Deployment-Guide-Pfade korrigiert
  - `resources/faq.md` und `resources/glossary.md`: AI-Kapitelverweise aktualisiert
  - `course-outline.md`: Instructor-Guide- und AI-Workshop-Lab-Verweise korrigiert

- **📅 Workshop-Status-Banner**: Von "Under Construction" auf aktiven Workshop-Status mit Datum Februar 2026 aktualisiert

- **🔗 Workshop-Navigation**: Defekte Navigationslinks in workshop README.md behoben, die auf den nicht vorhandenen Ordner lab-1-azd-basics verwiesen

#### Geändert
- **Workshop-Präsentation**: "under construction"-Warnung entfernt, Workshop ist jetzt vollständig und einsatzbereit
- **Navigationskonsistenz**: Gewährleistet, dass alle Workshop-Module eine ordnungsgemäße Navigation zwischen den Modulen haben
- **Verweise im Lernpfad**: Kapitelquerverweise aktualisiert, um die korrekten microsoft-foundry-Pfade zu verwenden

#### Validiert
- ✅ Alle englischen Markdown-Dateien haben gültige interne Links
- ✅ Workshop-Module 0–7 sind mit Lernzielen vollständig
- ✅ Navigation zwischen Kapiteln und Modulen funktioniert korrekt
- ✅ Inhalte sind geeignet für KI-Entwickler, die Microsoft AZD verwenden
- ✅ Anfängerfreundliche Sprache und Struktur wurde beibehalten
- ✅ CONTRIBUTING.md bietet klare Anleitung für Community-Beitragende

#### Technische Implementierung
- **Link-Validierung**: Automatisches PowerShell-Skript hat alle internen .md-Links verifiziert
- **Inhaltsprüfung**: Manuelle Überprüfung der Workshop-Vollständigkeit und Eignung für Einsteiger
- **Navigationssystem**: Konsistente Kapitel- und Modulnavigationsmuster angewendet

#### Hinweise
- **Umfang**: Änderungen nur auf die englische Dokumentation angewendet
- **Übersetzungen**: Übersetzungsordner in dieser Version nicht aktualisiert (automatische Übersetzung wird später synchronisiert)
- **Workshop-Dauer**: Vollständiger Workshop bietet jetzt 3-4 Stunden praxisorientiertes Lernen

---

### [v3.8.0] - 2025-11-19

#### Erweiterte Dokumentation: Monitoring, Sicherheit und Multi-Agent-Muster
**Diese Version fügt umfassende Lektionen der A-Klasse zur Application Insights-Integration, Authentifizierungs-Patterns und Multi-Agent-Koordination für Produktionsbereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-fokussierte Bereitstellung mit automatischer Provisionierung
  - Vollständige Bicep-Templates für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (1,200+ Zeilen)
  - AI/LLM-Monitoring-Muster (Microsoft Foundry Models Token-/Kostenverfolgung)
  - 6 Mermaid-Diagramme (Architektur, verteiltes Tracing, Telemetriefluss)
  - 3 praktische Übungen (Alerts, Dashboards, AI-Monitoring)
  - Kusto-Abfragebeispiele und Strategien zur Kostenoptimierung
  - Live-Metrik-Streaming und Echtzeit-Debugging
  - 40-50 Minuten Lernzeit mit produktionsreifen Mustern

- **🔐 Authentifizierungs- & Sicherheitsmuster-Lektion**: in `docs/getting-started/authsecurity.md`:
  - 3 Authentifizierungsmuster (Connection Strings, Key Vault, Managed Identity)
  - Vollständige Bicep-Infrastruktur-Templates für sichere Bereitstellungen
  - Node.js-Anwendungscode mit Azure SDK-Integration
  - 3 vollständige Übungen (Managed Identity aktivieren, User-Assigned Identity, Key Vault-Rotation)
  - Sicherheitsbest Practices und RBAC-Konfigurationen
  - Troubleshooting-Guide und Kostenanalyse
  - Produktionsreife passwortlose Authentifizierungsmuster

- **🤖 Multi-Agent Koordinationsmuster-Lektion**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequentiell, parallel, hierarchisch, ereignisgesteuert, Konsens)
  - Vollständige Orchestrator-Service-Implementierung (Python/Flask, 1,500+ Zeilen)
  - 3 spezialisierte Agentenimplementierungen (Research, Writer, Editor)
  - Service Bus-Integration für Message Queuing
  - Cosmos DB Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme, die Agenteninteraktionen zeigen
  - 3 fortgeschrittene Übungen (Timeout-Handling, Retry-Logik, Circuit Breaker)
  - Kostenaufstellung ($240-565/month) mit Optimierungsstrategien
  - Application Insights-Integration für Monitoring

#### Erweitert
- **Pre-deployment Kapitel**: Enthält jetzt umfassende Monitoring- und Koordinationsmuster
- **Getting-Started Kapitel**: Erweiterung um professionelle Authentifizierungs-Patterns
- **Produktionsreife**: Vollständige Abdeckung von Sicherheit bis Beobachtbarkeit
- **Kursübersicht**: Aktualisiert mit Verweisen auf neue Lektionen in Kapitel 3 und 6

#### Geändert
- **Lernfortschritt**: Bessere Integration von Sicherheit und Monitoring durch den Kurs
- **Dokumentationsqualität**: Konsistente A-Standards (95-97%) über neue Lektionen
- **Produktionsmuster**: Vollständige End-to-End-Abdeckung für Unternehmensbereitstellungen

#### Verbessert
- **Entwicklererfahrung**: Klarer Pfad von Entwicklung zu Produktionsmonitoring
- **Sicherheitsstandards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Beobachtbarkeit**: Vollständige Application Insights-Integration mit AZD
- **KI-Workloads**: Spezialisierte Überwachung für Microsoft Foundry Models und Multi-Agent-Systeme

#### Validiert
- ✅ Alle Lektionen enthalten vollständigen, funktionierenden Code (keine Ausschnitte)
- ✅ Mermaid-Diagramme für visuelles Lernen (insgesamt 19 über 3 Lektionen)
- ✅ Praxisübungen mit Verifikationsschritten (insgesamt 9)
- ✅ Produktionsreife Bicep-Templates, die via `azd up` bereitgestellt werden können
- ✅ Kostenanalyse und Optimierungsstrategien
- ✅ Troubleshooting-Guides und Best Practices
- ✅ Wissenscheckpoint mit Verifikationsbefehlen

#### Bewertungsergebnisse der Dokumentation
- **docs/pre-deployment/application-insights.md**: - Umfassende Monitoring-Anleitung
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Fortgeschrittene Multi-Agent-Architekturen
- **Gesamter neuer Inhalt**: - Konsistent hohe Qualitätsstandards

#### Technische Implementierung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentifizierung**: Managed Identity + Key Vault + RBAC-Muster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Monitoring**: Live-Metriken + Kusto-Abfragen + Alerts + Dashboards
- **Kostenmanagement**: Sampling-Strategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 2025-11-19

#### Verbesserungen der Dokumentationsqualität und neues Microsoft Foundry Models-Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Beispiel für die Bereitstellung von Microsoft Foundry Models mit gpt-4.1 Chat-Interface hinzu.**

#### Hinzugefügt
- **🤖 Microsoft Foundry Models Chat-Beispiel**: Vollständige gpt-4.1-Bereitstellung mit funktionierender Implementierung in `examples/azure-openai-chat/`:
  - Vollständige Microsoft Foundry Models-Infrastruktur (gpt-4.1 Modellbereitstellung)
  - Python-Kommandozeilen-Chat-Interface mit Gesprächsverlauf
  - Key Vault-Integration zur sicheren Speicherung von API-Schlüsseln
  - Token-Nutzungsverfolgung und Kostenschätzung
  - Ratenbegrenzung und Fehlerbehandlung
  - Umfassendes README mit 35-45 Minuten Bereitstellungsanleitung
  - 11 produktionsreife Dateien (Bicep-Templates, Python-App, Konfiguration)
- **📚 Dokumentationsübungen**: Praktische Übungen zum Konfigurationsleitfaden hinzugefügt:
  - Übung 1: Multi-Umgebungs-Konfiguration (15 Minuten)
  - Übung 2: Praxis zur Geheimnisverwaltung (10 Minuten)
  - Klare Erfolgskriterien und Verifikationsschritte
- **✅ Bereitstellungsverifizierung**: Verifizierungsabschnitt im Bereitstellungsleitfaden hinzugefügt:
  - Health-Check-Prozeduren
  - Checkliste für Erfolgskriterien
  - Erwartete Ausgaben für alle Bereitstellungsbefehle
  - Kurzer Troubleshooting-Überblick

#### Erweitert
- **examples/README.md**: Auf A-Qualitätsniveau (93%) aktualisiert:
  - `azure-openai-chat` zu allen relevanten Abschnitten hinzugefügt
  - Anzahl der lokalen Beispiele von 3 auf 4 aktualisiert
  - Zur Tabelle der AI-Anwendungsbeispiele hinzugefügt
  - In Quick Start für fortgeschrittene Benutzer integriert
  - In Microsoft Foundry Templates-Sektion aufgenommen
  - Vergleichsmatrix und Technologie-Findungsabschnitte aktualisiert
- **Dokumentationsqualität**: Von B+ (87%) auf A- (92%) im docs-Ordner erhöht:
  - Erwartete Ausgaben zu kritischen Befehlsbeispielen hinzugefügt
  - Verifikationsschritte für Konfigurationsänderungen enthalten
  - Praxisorientiertes Lernen durch praktische Übungen verbessert

#### Geändert
- **Lernfortschritt**: Bessere Integration von KI-Beispielen für fortgeschrittene Lernende
- **Dokumentationsstruktur**: Handlungsorientiertere Übungen mit klaren Ergebnissen
- **Verifizierungsprozess**: Explizite Erfolgskriterien zu wichtigen Workflows hinzugefügt

#### Verbessert
- **Entwicklererfahrung**: Microsoft Foundry Models-Bereitstellung dauert jetzt 35-45 Minuten (vs. 60-90 bei komplexeren Alternativen)
- **Kosten-Transparenz**: Klare Kostenschätzungen ($50-200/month) für das Microsoft Foundry Models-Beispiel
- **Lernpfad**: KI-Entwickler erhalten klaren Einstiegspunkt mit azure-openai-chat
- **Dokumentationsstandards**: Konsistente erwartete Ausgaben und Verifikationsschritte

#### Validiert
- ✅ Microsoft Foundry Models-Beispiel vollständig funktionsfähig mit `azd up`
- ✅ Alle 11 Implementierungsdateien syntaktisch korrekt
- ✅ README-Anweisungen entsprechen der tatsächlichen Bereitstellungserfahrung
- ✅ Dokumentationslinks an 8+ Stellen aktualisiert
- ✅ Beispieleindex reflektiert korrekt 4 lokale Beispiele
- ✅ Keine doppelten externen Links in Tabellen
- ✅ Alle Navigationsverweise korrekt

#### Technische Implementierung
- **Microsoft Foundry Models Architektur**: gpt-4.1 + Key Vault + Container Apps Muster
- **Sicherheit**: Managed Identity bereit, Geheimnisse in Key Vault
- **Monitoring**: Application Insights-Integration
- **Kostenmanagement**: Token-Tracking und Nutzungsoptimierung
- **Bereitstellung**: Einzelner `azd up` Befehl für die komplette Einrichtung

### [v3.6.0] - 2025-11-19

#### Großes Update: Container App-Bereitstellungsbeispiele
**Diese Version führt umfassende, produktionsreife Beispiele für die Bereitstellung containerisierter Anwendungen mit dem Azure Developer CLI (AZD) ein, mit vollständiger Dokumentation und Integration in den Lernpfad.**

#### Hinzugefügt
- **🚀 Container App Beispiele**: Neue lokale Beispiele in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Vollständiger Überblick über containerisierte Bereitstellungen, Quick Start, Produktion und fortgeschrittene Muster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Einsteigerfreundliche REST-API mit Scale-to-Zero, Health-Probes, Monitoring und Troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsreife Mehrdienst-Bereitstellung (API Gateway, Product, Order, User, Notification), asynchrones Messaging, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary-Bereitstellung
- **Best Practices**: Sicherheit, Monitoring, Kostenoptimierung und CI/CD-Anleitungen für containerisierte Workloads
- **Codebeispiele**: Vollständige `azure.yaml`, Bicep-Templates und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- **Testen & Troubleshooting**: End-to-End-Test-Szenarien, Monitoring-Befehle, Troubleshooting-Anleitungen

#### Geändert
- **README.md**: Aktualisiert, um neue Container-App-Beispiele unter "Local Examples - Container Applications" hervorzuheben und zu verlinken
- **examples/README.md**: Aktualisiert, um Container-App-Beispiele hervorzuheben, Einträge in der Vergleichsmatrix hinzuzufügen und Technologie-/Architekturverweise zu aktualisieren
- **Course Outline & Study Guide**: Aktualisiert, um in den relevanten Kapiteln auf neue Container-App-Beispiele und Bereitstellungsmuster zu verweisen

#### Validiert
- ✅ Alle neuen Beispiele mit `azd up` bereitstellbar und folgen Best Practices
- ✅ Dokumentations-Querverweise und Navigation aktualisiert
- ✅ Beispiele decken Szenarien von Anfänger bis Fortgeschrittene ab, einschließlich Produktions-Mikroservices

#### Hinweise
- **Scope**: Nur englische Dokumentation und Beispiele
- **Next Steps**: Mit zusätzlichen fortgeschrittenen Container-Patterns und CI/CD-Automatisierung in zukünftigen Releases erweitern

### [v3.5.0] - 2025-11-19

#### Produkt-Umbenennung: Microsoft Foundry
**Diese Version führt eine umfassende Produktumbenennung von "Microsoft Foundry" zu "Microsoft Foundry" in der gesamten englischen Dokumentation durch und spiegelt Microsofts offizielle Rebranding wider.**

#### Geändert
- **🔄 Produktnamen-Aktualisierung**: Vollständiges Rebranding von "Microsoft Foundry" zu "Microsoft Foundry"
  - Alle Verweise in der englischen Dokumentation im Ordner `docs/` aktualisiert
  - Umbenannter Ordner: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Umbenannte Datei: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt: 23 Inhaltsverweise in 7 Dokumentationsdateien aktualisiert

- **📁 Änderungen an der Ordnerstruktur**:
  - `docs/ai-foundry/` in `docs/microsoft-foundry/` umbenannt
  - Alle Querverweise aktualisiert, um die neue Ordnerstruktur widerzuspiegeln
  - Navigationslinks in der gesamten Dokumentation validiert

- **📄 Dateiumbenennungen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links aktualisiert, um auf den neuen Dateinamen zu verweisen

#### Aktualisierte Dateien
- **Kapitel-Dokumentation** (7 Dateien):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Navigationslink-Aktualisierungen
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamenverweise aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Verwendet bereits Microsoft Foundry (aus früheren Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Verweise aktualisiert (Überblick, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweislinks aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zum nächsten Kapitel aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Verweise aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Kursstruktur-Dateien** (2 Dateien):
  - `README.md` - 17 Verweise aktualisiert (Kursübersicht, Kapitelüberschriften, Vorlagenabschnitt, Community-Einblicke)
  - `course-outline.md` - 14 Verweise aktualisiert (Überblick, Lernziele, Kapitelressourcen)

#### Validiert
- ✅ Keine verbleibenden Verweise auf den Ordnerpfad "ai-foundry" in englischen Dokumenten
- ✅ Keine verbleibenden Verweise auf den Produktnamen "Microsoft Foundry" in englischen Dokumenten
- ✅ Alle Navigationslinks funktionieren mit der neuen Ordnerstruktur
- ✅ Datei- und Ordnerumbenennungen erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln validiert

#### Hinweise
- **Scope**: Änderungen nur auf die englische Dokumentation im Ordner `docs/` angewendet
- **Translations**: Übersetzungsordner (`translations/`) in dieser Version nicht aktualisiert
- **Workshop**: Workshop-Materialien (`workshop/`) in dieser Version nicht aktualisiert
- **Examples**: Beispiel-Dateien könnten weiterhin auf Legacy-Namen verweisen (wird in einem zukünftigen Update behoben)
- **External Links**: Externe URLs und GitHub-Repository-Verweise bleiben unverändert

#### Migrationsanleitung für Mitwirkende
If you have local branches or documentation referencing the old structure:
1. Ordnerverweise aktualisieren: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dateiverweise aktualisieren: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Produktnamen ersetzen: "Microsoft Foundry" → "Microsoft Foundry"
4. Validieren Sie, dass alle internen Dokumentationslinks noch funktionieren

---

### [v3.4.0] - 2025-10-24

#### Verbesserungen bei Infrastruktur-Vorschau und Validierung
**Diese Version führt umfassende Unterstützung für die neue Preview-Funktion der Azure Developer CLI ein und verbessert das Workshop-Benutzererlebnis.**

#### Hinzugefügt
- **🧪 azd provision --preview Funktionsdokumentation**: Umfassende Darstellung der neuen Infrastruktur-Vorschau-Funktionalität
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration im Bereitstellungsleitfaden mit Anwendungsfällen und Vorteilen
  - Integration von Pre-Flight-Checks für sicherere Bereitstellungsvalidierung
  - Updates im Einstiegshandbuch mit sicherheitsorientierten Bereitstellungspraktiken
- **🚧 Workshop-Status-Banner**: Professionelles HTML-Banner, das den Entwicklungsstatus des Workshops anzeigt
  - Farbverlauf-Design mit Baustellenindikatoren zur klaren Benutzerkommunikation
  - Zeitstempel der letzten Aktualisierung für Transparenz
  - Mobilreaktives Design für alle Gerätetypen

#### Verbessert
- **Infrastruktursicherheit**: Vorschaufunktionalität in der gesamten Bereitstellungsdokumentation integriert
- **Pre-Deployment-Validierung**: Automatisierte Skripte enthalten jetzt Infrastruktur-Vorschau-Tests
- **Entwickler-Workflow**: Aktualisierte Befehlssequenzen beinhalten die Vorschau als Best Practice
- **Workshop-Erlebnis**: Klare Erwartungen für Benutzer bezüglich des Entwicklungsstands der Inhalte gesetzt

#### Geändert
- **Bereitstellungs-Best-Practices**: Workflow mit Vorschau-First wird nun als empfohlener Ansatz empfohlen
- **Dokumentationsfluss**: Infrastrukturvalidierung wurde früher im Lernprozess platziert
- **Workshop-Präsentation**: Professionelle Statuskommunikation mit klarem Entwicklungszeitplan

#### Verbesserungen
- **Sicherheitsorientierter Ansatz**: Infrastrukturänderungen können jetzt vor der Bereitstellung validiert werden
- **Teamzusammenarbeit**: Vorschauergebnisse können zur Überprüfung und Genehmigung geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcenkosten vor der Bereitstellung
- **Risikominderung**: Reduzierte Bereitstellungsfehler durch Vorabvalidierung

#### Technische Implementierung
- **Multi-Dokument-Integration**: Vorschaufunktion in 4 zentralen Dateien dokumentiert
- **Befehlsmuster**: Konsistente Syntax und Beispiele in der gesamten Dokumentation
- **Best-Practice-Integration**: Vorschau in Validierungs-Workflows und Skripten aufgenommen
- **Visuelle Indikatoren**: Deutliche NEW-Feature-Markierungen zur besseren Auffindbarkeit

#### Workshop-Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Farbverlauf-Styling
- **Benutzererlebnis**: Klarer Entwicklungsstatus verhindert Verwirrung
- **Professionelle Präsentation**: Erhält die Glaubwürdigkeit des Repositories und setzt Erwartungen
- **Zeitlinientransparenz**: Oktober 2025 Zeitstempel der letzten Aktualisierung für Verantwortlichkeit

### [v3.3.0] - 2025-09-24

#### Erweiterte Workshop-Materialien und interaktives Lernerlebnis
**Diese Version führt umfassende Workshop-Materialien mit browserbasierten interaktiven Leitfäden und strukturierten Lernpfaden ein.**

#### Hinzugefügt
- **🎥 Interaktiver Workshop-Leitfaden**: Browserbasierte Workshop-Erfahrung mit MkDocs-Preview-Fähigkeit
- **📝 Strukturierte Workshop-Anleitungen**: 7-stufiger geführter Lernpfad von Entdeckung bis Anpassung
  - 0-Introduction: Workshop-Übersicht und Einrichtung
  - 1-Select-AI-Template: Vorlagenentdeckung und Auswahlprozess
  - 2-Validate-AI-Template: Bereitstellungs- und Validierungsverfahren
  - 3-Deconstruct-AI-Template: Verständnis der Vorlagenarchitektur
  - 4-Configure-AI-Template: Konfiguration und Anpassung
  - 5-Customize-AI-Template: Erweiterte Änderungen und Iterationen
  - 6-Teardown-Infrastructure: Bereinigung und Ressourcenmanagement
  - 7-Wrap-up: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Tooling**: MkDocs-Konfiguration mit Material-Theme für ein verbessertes Lernerlebnis
- **🎯 Praxisorientierter Lernpfad**: 3-Schritte-Methodik (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces-Integration**: Nahtlose Einrichtung der Entwicklungsumgebung

#### Verbessert
- **AI Workshop Lab**: Erweiterung um ein umfassendes, 2–3-stündiges strukturiertes Lernangebot
- **Workshop-Dokumentation**: Professionelle Präsentation mit Navigation und visuellen Hilfsmitteln
- **Lernprogression**: Klare Schritt-für-Schritt-Anleitungen von der Vorlagenauswahl bis zur Produktionsbereitstellung
- **Entwicklererlebnis**: Integrierte Tools für optimierte Entwicklungs-Workflows

#### Verbesserungen
- **Barrierefreiheit**: Browserbasierte Oberfläche mit Suche, Kopierfunktion und Theme-Umschaltung
- **Selbstgesteuertes Lernen**: Flexible Workshop-Struktur für unterschiedliche Lerngeschwindigkeiten
- **Praktische Anwendung**: Realitätsnahe KI-Vorlagen-Bereitstellungsszenarien
- **Community-Integration**: Discord-Integration für Workshop-Support und Zusammenarbeit

#### Workshop-Funktionen
- **Eingebaute Suche**: Schnelle Stichwort- und Lektionensuche
- **Codeblöcke kopieren**: Hover-to-Copy-Funktionalität für alle Codebeispiele
- **Theme-Umschaltung**: Unterstützung für Dark/Light-Mode je nach Präferenz
- **Visuelle Assets**: Screenshots und Diagramme zur besseren Verständlichkeit
- **Hilfe-Integration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Umfassende Neustrukturierung der Navigation und kapitelbasiertes Lernsystem
**Diese Version führt ein umfassendes, kapitelbasiertes Lernsystem ein und verbessert die Navigation im gesamten Repository.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Gesamter Kurs in 8 aufeinander aufbauende Kapitel umstrukturiert
  - Kapitel 1: Grundlagen & Schnellstart (⭐ - 30-45 Min.)
  - Kapitel 2: KI-zentrierte Entwicklung (⭐⭐ - 1-2 Stunden)
  - Kapitel 3: Konfiguration & Authentifizierung (⭐⭐ - 45-60 Min.)
  - Kapitel 4: Infrastruktur als Code & Bereitstellung (⭐⭐⭐ - 1-1,5 Stunden)
  - Kapitel 5: Multi-Agenten-KI-Lösungen (⭐⭐⭐⭐ - 2-3 Stunden)
  - Kapitel 6: Vorbereitende Validierung & Planung (⭐⭐ - 1 Stunde)
  - Kapitel 7: Fehlerbehebung & Debugging (⭐⭐ - 1-1,5 Stunden)
  - Kapitel 8: Produktions- & Unternehmensmuster (⭐⭐⭐⭐ - 2-3 Stunden)
- **📚 Umfassendes Navigationssystem**: Konsistente Navigationsheader und -footer in der gesamten Dokumentation
- **🎯 Fortschrittsverfolgung**: Kursabschluss-Checkliste und Lernverifizierungsmechanismus
- **🗺️ Lernpfadführung**: Klare Einstiegspunkte für unterschiedliche Erfahrungsstufen und Ziele
- **🔗 Querverweis-Navigation**: Verwandte Kapitel und Voraussetzungen klar verlinkt

#### Verbessert
- **README-Struktur**: In eine strukturierte Lernplattform mit kapitelbasierter Organisation verwandelt
- **Dokumentationsnavigation**: Jede Seite enthält nun Kapitelkontext und Fortschrittsanweisungen
- **Vorlagenorganisation**: Beispiele und Vorlagen den entsprechenden Lernkapiteln zugeordnet
- **Ressourcenintegration**: Spickzettel, FAQs und Studienleitfäden mit relevanten Kapiteln verknüpft
- **Workshop-Integration**: Hands-on-Labs mehreren Kapitel-Lernzielen zugeordnet

#### Geändert
- **Lernprogression**: Vom linearen Dokumentationsfluss zu flexiblem, kapitelbasiertem Lernen gewechselt
- **Konfigurationsplatzierung**: Konfigurationsleitfaden als Kapitel 3 für besseren Lernfluss neu positioniert
- **KI-Inhaltsintegration**: Bessere Integration KI-spezifischer Inhalte entlang der Lernreise
- **Produktionsinhalte**: Fortgeschrittene Muster in Kapitel 8 für Enterprise-Lernende konsolidiert

#### Verbesserungen
- **Benutzererlebnis**: Klare Breadcrumbs und Kapitel-Fortschrittsindikatoren
- **Barrierefreiheit**: Konsistente Navigationsmuster für einfachere Kursdurchquerung
- **Professionelle Präsentation**: Universitätsähnliche Kursstruktur geeignet für akademische und unternehmensbezogene Schulungen
- **Lerneffizienz**: Verringerte Zeit zum Auffinden relevanter Inhalte durch verbesserte Organisation

#### Technische Implementierung
- **Navigations-Header**: Standardisierte Kapitelnavigation in 40+ Dokumentationsdateien
- **Footer-Navigation**: Konsistente Fortschrittsanweisungen und Kapitelabschlussindikatoren
- **Querverlinkung**: Umfassendes internes Verlinkungssystem zur Verbindung verwandter Konzepte
- **Kapitelzuordnung**: Vorlagen und Beispiele klar an Lernziele gebunden

#### Verbesserung des Studienleitfadens
- **📚 Umfassende Lernziele**: Studienleitfaden an das 8-Kapitel-System angepasst
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Abschlusschecklisten
- **❓ Bewertungsfragen**: Wissenstestfragen für jedes Kapitel mit professionellen Ergebnissen
- **🛠️ Praktische Übungen**: Hands-on-Aktivitäten mit echten Bereitstellungsszenarien und Fehlerbehebung
- **📊 Kompetenzfortschritt**: Klare Entwicklung von Grundkonzepten zu Enterprise-Patterns mit Karriereschwerpunkt
- **🎓 Zertifizierungsrahmen**: Professionelle Weiterentwicklungsergebnisse und Community-Anerkennungssystem
- **⏱️ Zeitmanagement**: Strukturierter 10-Wochen-Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 2025-09-17

#### Verbesserte Multi-Agenten-KI-Lösungen
**Diese Version verbessert die Multi-Agenten-Retail-Lösung durch bessere Agentenbenennung und erweiterte Dokumentation.**

#### Geändert
- **Multi-Agenten-Terminologie**: "Cora agent" wurde durch "Customer agent" in der gesamten Retail-Multi-Agenten-Lösung ersetzt, um ein klareres Verständnis zu ermöglichen
- **Agentenarchitektur**: Alle Dokumentationen, ARM-Vorlagen und Codebeispiele auf konsistente Benennung "Customer agent" aktualisiert
- **Konfigurationsbeispiele**: Modernisierte Agentenkonfigurationsmuster mit aktualisierten Namenskonventionen
- **Dokumentationskonsistenz**: Sicherstellung, dass alle Verweise professionelle, beschreibende Agentennamen verwenden

#### Verbessert
- **ARM Template Package**: Aktualisiertes retail-multiagent-arm-template mit Referenzen auf Customer-Agenten
- **Architecture Diagrams**: Aktualisierte Mermaid-Diagramme mit überarbeiteter Agentenbenennung
- **Code Examples**: Python-Klassen und Implementierungsbeispiele verwenden jetzt die Benennung CustomerAgent
- **Environment Variables**: Alle Deployment-Skripte wurden aktualisiert, um die Konventionen CUSTOMER_AGENT_NAME zu verwenden

#### Verbesserungen
- **Developer Experience**: Klarere Agentenrollen und Verantwortlichkeiten in der Dokumentation
- **Production Readiness**: Bessere Anpassung an unternehmensweite Namenskonventionen
- **Learning Materials**: Intuitivere Agentenbenennung für Bildungszwecke
- **Template Usability**: Vereinfachtes Verständnis der Agentenfunktionen und Deployment-Muster

#### Technische Details
- Aktualisierte Mermaid-Architekturdiagramme mit CustomerAgent-Referenzen
- CoraAgent-Klassennamen in Python-Beispielen durch CustomerAgent ersetzt
- ARM-Template-JSON-Konfigurationen geändert, um den Agententyp "customer" zu verwenden
- Umgebungsvariablen von CORA_AGENT_* zu CUSTOMER_AGENT_* Muster aktualisiert
- Alle Deployment-Befehle und Container-Konfigurationen aktualisiert

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Diese Version verwandelt das Repository in eine umfassende, auf AI ausgerichtete Lernressource mit Microsoft Foundry-Integration.**

#### Hinzugefügt
- **🤖 AI-First Learning Path**: Vollständige Umstrukturierung mit Priorität für AI-Entwickler und -Ingenieure
- **Microsoft Foundry Integration Guide**: Umfassende Dokumentation zur Verbindung von AZD mit Microsoft Foundry-Diensten
- **AI Model Deployment Patterns**: Detaillierter Leitfaden zur Modellauswahl, Konfiguration und Produktionsbereitstellungsstrategien
- **AI Workshop Lab**: 2-3-stündiger praktischer Workshop zur Umwandlung von AI-Anwendungen in AZD-deploybare Lösungen
- **Production AI Best Practices**: Unternehmensgerechte Muster für Skalierung, Überwachung und Sicherung von AI-Workloads
- **AI-Specific Troubleshooting Guide**: Umfassende Fehlerbehebung für Microsoft Foundry-Modelle, Cognitive Services und AI-Deployment-Probleme
- **AI Template Gallery**: Ausgewählte Sammlung von Microsoft Foundry-Vorlagen mit Komplexitätsbewertungen
- **Workshop Materials**: Vollständige Workshop-Struktur mit praktischen Labs und Referenzmaterialien

#### Verbesserungen
- **README Structure**: AI-Entwicklerfokussiert mit 45% Community-Interesse-Daten aus dem Microsoft Foundry Discord
- **Learning Paths**: Dedizierte KI-Entwicklerreise neben traditionellen Pfaden für Studierende und DevOps-Ingenieure
- **Template Recommendations**: Vorgestellte AI-Templates einschließlich azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community Integration**: Verbesserte Discord-Community-Unterstützung mit AI-spezifischen Kanälen und Diskussionen

#### Sicherheit & Produktion
- **Managed Identity Patterns**: AI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Cost Optimization**: Token-Nutzungsverfolgung und Budgetkontrollen für AI-Workloads
- **Multi-Region Deployment**: Strategien für globale Bereitstellung von AI-Anwendungen
- **Performance Monitoring**: AI-spezifische Metriken und Application Insights-Integration

#### Dokumentationsqualität
- **Linear Course Structure**: Logische Progression von Anfänger- bis Fortgeschrittenenmustern für AI-Bereitstellungen
- **Validated URLs**: Alle externen Repository-Links überprüft und zugänglich
- **Complete Reference**: Alle internen Dokumentationslinks validiert und funktionsfähig
- **Production Ready**: Unternehmensgerechte Bereitstellungsmuster mit praxisnahen Beispielen

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Diese Version stellt eine bedeutende Überarbeitung der Repository-Struktur und der Inhaltsdarstellung dar.**

#### Hinzugefügt
- **Structured Learning Framework**: Alle Dokumentationsseiten enthalten jetzt Einleitung, Lernziele und Lernergebnisse
- **Navigation System**: Hinzugefügte Previous/Next-Lektionen-Links in der gesamten Dokumentation für geführte Lernfortschritte
- **Study Guide**: Umfassende study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterial
- **Professional Presentation**: Alle Emoji-Symbole entfernt für verbesserte Zugänglichkeit und professionelles Erscheinungsbild
- **Enhanced Content Structure**: Verbesserte Organisation und Fluss der Lernmaterialien

#### Geändert
- **Documentation Format**: Standardisierung aller Dokumentationen mit konsistenter, lernfokussierter Struktur
- **Navigation Flow**: Implementierte logische Progression durch alle Lernmaterialien
- **Content Presentation**: Dekorative Elemente entfernt zugunsten klarer, professioneller Formatierung
- **Link Structure**: Interne Links zur Unterstützung des neuen Navigationssystems aktualisiert

#### Verbesserungen
- **Accessibility**: Emojis entfernt für bessere Kompatibilität mit Screenreadern
- **Professional Appearance**: Sauberes, akademisches Erscheinungsbild geeignet für Unternehmensschulungen
- **Learning Experience**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Content Organization**: Bessere logische Verknüpfung und Fluss zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Hinzugefügt
- **Core Documentation Structure**
  - Vollständige Getting-Started-Anleitungsserie
  - Umfassende Bereitstellungs- und Provisionierungsdokumentation
  - Detaillierte Fehlerbehebungsressourcen und Debugging-Leitfäden
  - Pre-Deployment-Validierungstools und -verfahren

- **Getting Started Module**
  - AZD Basics: Kernkonzepte und Terminologie
  - Installation Guide: Plattform-spezifische Einrichtungsanweisungen
  - Configuration Guide: Umgebungseinrichtung und Authentifizierung
  - First Project Tutorial: Schritt-für-Schritt praktische Einführung

- **Deployment and Provisioning Module**
  - Deployment Guide: Vollständige Workflow-Dokumentation
  - Provisioning Guide: Infrastructure as Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Multi-Service-Architektur-Muster

- **Pre-deployment Validation Module**
  - Capacity Planning: Validierung der Azure-Ressourcenverfügbarkeit
  - SKU Selection: Umfassende Anleitung zur Service-Tier-Auswahl
  - Pre-flight Checks: Automatisierte Validierungsskripte (PowerShell und Bash)
  - Kostenschätzung und Budgetplanungswerkzeuge

- **Troubleshooting Module**
  - Common Issues: Häufig auftretende Probleme und Lösungen
  - Debugging Guide: Systematische Fehlerbehebungsmethoden
  - Erweiterte Diagnosetechniken und -werkzeuge
  - Performance-Überwachung und Optimierung

- **Resources and References**
  - Command Cheat Sheet: Schnellreferenz für wichtige Befehle
  - Glossary: Umfassende Terminologie- und Akronym-Definitionen
  - FAQ: Detaillierte Antworten auf häufige Fragen
  - Externe Ressourcenlinks und Community-Verbindungen

- **Examples and Templates**
  - Einfaches Webanwendungsbeispiel
  - Static Website-Bereitstellungsvorlage
  - Container-Anwendungs-Konfiguration
  - Datenbank-Integrationsmuster
  - Microservices-Architekturbeispiele
  - Serverless-Funktionsimplementierungen

#### Features
- **Multi-Platform Support**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Multiple Skill Levels**: Inhalte für Lernende bis hin zu professionellen Entwicklern
- **Practical Focus**: Praxisnahe Beispiele und realitätsnahe Szenarien
- **Comprehensive Coverage**: Von Grundkonzepten bis zu fortgeschrittenen Unternehmensmustern
- **Security-First Approach**: Sicherheitsbest Practices integriert durchgängig
- **Cost Optimization**: Leitfäden für kosteneffiziente Bereitstellungen und Ressourcenverwaltung

#### Dokumentationsqualität
- **Detailed Code Examples**: Praktische, getestete Codebeispiele
- **Step-by-Step Instructions**: Klare, umsetzbare Anleitungen
- **Comprehensive Error Handling**: Fehlerbehebung für häufige Probleme
- **Best Practices Integration**: Branchenstandards und Empfehlungen
- **Version Compatibility**: Aktuell mit den neuesten Azure-Diensten und azd-Funktionen

## Geplante zukünftige Verbesserungen

### Version 3.1.0 (Geplant)
#### AI-Plattform-Erweiterung
- **Multi-Model Support**: Integrationsmuster für Hugging Face, Azure Machine Learning und benutzerdefinierte Modelle
- **AI Agent Frameworks**: Vorlagen für LangChain, Semantic Kernel und AutoGen-Bereitstellungen
- **Advanced RAG Patterns**: Vektor-Datenbankoptionen über Azure AI Search hinaus (Pinecone, Weaviate usw.)
- **AI Observability**: Verbesserte Überwachung für Modellleistung, Token-Nutzung und Antwortqualität

#### Developer Experience
- **VS Code Extension**: Integrierte AZD + Microsoft Foundry Entwicklungsumgebung
- **GitHub Copilot Integration**: KI-unterstützte AZD-Template-Generierung
- **Interactive Tutorials**: Praxisnahe Coding-Übungen mit automatisierter Validierung für AI-Szenarien
- **Video Content**: Ergänzende Video-Tutorials für visuelle Lernende mit Schwerpunkt auf AI-Bereitstellungen

### Version 4.0.0 (Geplant)
#### Enterprise-AI-Muster
- **Governance Framework**: AI-Modell-Governance, Compliance und Prüfpfade
- **Multi-Tenant AI**: Muster zur Bedienung mehrerer Kunden mit isolierten AI-Diensten
- **Edge AI Deployment**: Integration mit Azure IoT Edge und Containerinstanzen
- **Hybrid Cloud AI**: Multi-Cloud- und Hybrid-Bereitstellungsmuster für AI-Workloads

#### Erweiterte Funktionen
- **AI Pipeline Automation**: MLOps-Integration mit Azure Machine Learning-Pipelines
- **Advanced Security**: Zero-Trust-Muster, Private Endpoints und erweiterter Bedrohungsschutz
- **Performance Optimization**: Fortgeschrittene Tuning- und Skalierungsstrategien für hochdurchsatzfähige AI-Anwendungen
- **Global Distribution**: Content-Delivery- und Edge-Caching-Muster für AI-Anwendungen

### Version 3.0.0 (Geplant) - Durch aktuelle Veröffentlichung ersetzt
#### Vorgeschlagene Ergänzungen - Jetzt in v3.0.0 implementiert
- ✅ **AI-Focused Content**: Umfassende Microsoft Foundry-Integration (Abgeschlossen)
- ✅ **Interactive Tutorials**: Praxislabore für AI-Workshops (Abgeschlossen)
- ✅ **Advanced Security Module**: AI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Performance Optimization**: Tuning-Strategien für AI-Workloads (Abgeschlossen)

### Version 2.1.0 (Geplant) - Teilweise in v3.0.0 implementiert
#### Kleinere Verbesserungen - Teilweise in der aktuellen Veröffentlichung abgeschlossen
- ✅ **Additional Examples**: AI-fokussierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Extended FAQ**: AI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool Integration**: Erweiterte IDE- und Editor-Integrationsanleitungen
- ✅ **Monitoring Expansion**: AI-spezifische Überwachungs- und Alarmierungsmuster (Abgeschlossen)

#### Weiterhin geplant für zukünftige Veröffentlichungen
- **Mobile-Friendly Documentation**: Responsives Design für mobiles Lernen
- **Offline Access**: Herunterladbare Dokumentationspakete
- **Enhanced IDE Integration**: VS Code-Erweiterung für AZD + AI-Workflows
- **Community Dashboard**: Echtzeit-Community-Metriken und Beitragsverfolgung

## Beiträge zum Changelog

### Änderungen melden
Beim Beitrag zu diesem Repository stellen Sie bitte sicher, dass Changelog-Einträge Folgendes enthalten:

1. **Version Number**: Nach Semantic Versioning (major.minor.patch)
2. **Date**: Veröffentlichungs- oder Aktualisierungsdatum im Format YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Prägnante Beschreibung der Änderung
5. **Impact Assessment**: Wie sich Änderungen auf bestehende Nutzer auswirken

### Änderungskategorien

#### Hinzugefügt
- Neue Funktionen, Dokumentationsabschnitte oder Fähigkeiten
- Neue Beispiele, Vorlagen oder Lernressourcen
- Zusätzliche Tools, Skripte oder Dienstprogramme

#### Geändert
- Änderungen an bestehender Funktionalität oder Dokumentation
- Aktualisierungen zur Verbesserung von Klarheit oder Genauigkeit
- Umstrukturierung von Inhalten oder Organisation

#### Veraltet
- Funktionen oder Ansätze, die ausgephast werden
- Dokumentationsabschnitte, deren Entfernung geplant ist
- Methoden, für die es bessere Alternativen gibt

#### Entfernt
- Funktionen, Dokumentation oder Beispiele, die nicht mehr relevant sind
- Veraltete Informationen oder eingestellte Ansätze
- Redundante oder konsolidierte Inhalte

#### Behoben
- Korrekturen von Fehlern in Dokumentation oder Code
- Lösung gemeldeter Probleme oder Fehler
- Verbesserungen in Genauigkeit oder Funktionalität

#### Sicherheit
- Sicherheitsrelevante Verbesserungen oder Fehlerbehebungen
- Aktualisierungen zu Sicherheitsbest Practices
- Behebung von Sicherheitslücken

### Richtlinien zur Semantischen Versionierung

#### Major Version (X.0.0)
- Breaking Changes, die Benutzerinteraktion erfordern
- Signifikante Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik verändern

#### Minor Version (X.Y.0)
- Neue Funktionen oder Inhaltszusätze
- Erweiterungen, die Abwärtskompatibilität wahren
- Zusätzliche Beispiele, Tools oder Ressourcen

#### Patch Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleinere Verbesserungen an bestehenden Inhalten
- Klarstellungen und geringfügige Ergänzungen

## Community-Feedback und Vorschläge

Wir fördern aktiv Community-Feedback zur Verbesserung dieser Lernressource:

### Wie Feedback gegeben werden kann
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (AI-spezifische Issues sind willkommen)
- **Discord Discussions**: Ideen teilen und sich mit der Microsoft Foundry-Community austauschen
- **Pull Requests**: Direkte Verbesserungen an Inhalten beitragen, insbesondere AI-Templates und -Anleitungen
- **Microsoft Foundry Discord**: Teilnahme am #Azure-Kanal für AZD + AI-Diskussionen
- **Community Forums**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback-Kategorien
- **AI Content Accuracy**: Korrekturen zu AI-Dienste-Integration und Bereitstellungsinformationen
- **Learning Experience**: Vorschläge zur Verbesserung des Lernflusses für AI-Entwickler
- **Missing AI Content**: Anfragen für zusätzliche AI-Templates, Muster oder Beispiele
- **Accessibility**: Verbesserungen für unterschiedliche Lernbedürfnisse
- **AI Tool Integration**: Vorschläge zur besseren Integration von AI-Entwicklungs-Workflows
- **Production AI Patterns**: Anfragen zu Unternehmensmustern für AI-Bereitstellungen

### Reaktionsverpflichtung
- **Issue Response**: Innerhalb von 48 Stunden für gemeldete Probleme
- **Feature Requests**: Prüfung innerhalb einer Woche
- **Community Contributions**: Überprüfung innerhalb einer Woche
- **Security Issues**: Sofortige Priorität mit beschleunigter Reaktion

## Wartungsplan

### Regelmäßige Aktualisierungen
- **Monthly Reviews**: Inhaltsgenauigkeit und Linkvalidierung
- **Quarterly Updates**: Größere Inhaltszusätze und Verbesserungen
- **Semi-Annual Reviews**: Umfangreiche Umstrukturierungen und Erweiterungen
- **Annual Releases**: Major-Versionen mit bedeutenden Verbesserungen

### Überwachung und Qualitätssicherung
- **Automated Testing**: Regelmäßige Validierung von Codebeispielen und Links
- **Community Feedback Integration**: Regelmäßige Einbindung von Nutzeranregungen
- **Technology Updates**: Anpassung an die neuesten Azure-Dienste und azd-Release
- **Accessibility Audits**: Regelmäßige Überprüfung auf inklusive Designprinzipien

## Versionsunterstützungspolitik

### Unterstützung der aktuellen Version
- **Neueste Hauptversion**: Volle Unterstützung mit regelmäßigen Updates
- **Vorherige Hauptversion**: Sicherheitsupdates und kritische Fehlerbehebungen für 12 Monate
- **Veraltete Versionen**: Nur Community-Support, keine offiziellen Updates

### Migrationsanleitung
Wenn Hauptversionen veröffentlicht werden, stellen wir Folgendes bereit:
- **Migrationsleitfäden**: Schritt-für-Schritt-Anleitungen für die Migration
- **Kompatibilitätsnotizen**: Details zu inkompatiblen Änderungen
- **Tool-Unterstützung**: Skripte oder Dienstprogramme zur Unterstützung der Migration
- **Community-Unterstützung**: Spezielle Foren für Migrationsfragen

---

**Navigation**
- **Vorherige Lektion**: [Studienleitfaden](resources/study-guide.md)
- **Nächste Lektion**: Zurück zu [Haupt-README](README.md)

**Bleiben Sie auf dem Laufenden**: Beobachten Sie dieses Repository für Benachrichtigungen über neue Veröffentlichungen und wichtige Aktualisierungen der Lernmaterialien.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache gilt als maßgebliche Quelle. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->