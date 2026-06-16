# Änderungsprotokoll - AZD For Beginners

## Einleitung

Dieses Änderungsprotokoll dokumentiert alle bemerkenswerten Änderungen, Aktualisierungen und Verbesserungen des AZD For Beginners Repository. Wir folgen den Prinzipien des Semantic Versioning und pflegen dieses Protokoll, um Anwendern zu helfen zu verstehen, was sich zwischen den Versionen geändert hat.

## Lernziele

Beim Durchsehen dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und Inhalts­ergänzungen informiert bleiben
- Verbesserungen an der bestehenden Dokumentation nachvollziehen
- Fehlerbehebungen und Korrekturen verfolgen, um Genauigkeit sicherzustellen
- Die Entwicklung der Lernmaterialien im Zeitverlauf verfolgen

## Lernergebnisse

Nach dem Durchsehen der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und verfügbare Lernressourcen zu identifizieren
- Zu verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernpfad basierend auf den aktuellsten Materialien zu planen
- Feedback und Vorschläge für zukünftige Verbesserungen beizusteuern

## Versionsverlauf

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Diese Version schließt die verbleibenden mittleren Lücken, die durch die azd-coverage-Analyse aufgezeigt wurden: wie man eine eigene Vorlage erstellt und veröffentlicht, reproduzierbare Dev-Container/Codespaces-Umgebungen, der Pulumi-Infrastruktur-Provider, ein Azure DevOps CI/CD Walkthrough, Service-Principal-Authentifizierung, Hinweise zur Host-Auswahl (AKS/Spring Apps), Erklärungen zu `azd restore`/`azd package`, Fehlerbehandlung bei Hooks und Praktiken für Team-/gemeinsame Umgebungen.**

#### Hinzugefügt
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — Erstellung Ihrer eigenen azd-Vorlage: erforderliche Struktur (`azure.yaml`, `infra/`, `src/`), das Feld `metadata.template`, Parametrisierung der Infrastruktur mit dem `uniqueString()` Resource-Token und dem Tag `azd-env-name`, lokal testen mit `azd init --template <local-path>`, Veröffentlichung auf GitHub und Einsendung an die Awesome AZD gallery
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — reproduzierbare azd-Umgebungen mit Dev Containers und GitHub Codespaces: eine minimale `.devcontainer/devcontainer.json`, die das offizielle `ghcr.io/azure/azure-dev/azd` Feature verwendet, sprachspezifische Features, `docker-in-docker` für Container-Hosts und `azd auth login --use-device-code` für die Remote-Anmeldung
- **🧩 Pulumi with azd** Abschnitt in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-Ordnerstruktur, Stacks, die auf azd-Umgebungen abgebildet sind, erforderliche Outputs/Tagging und der identische `azd up` / `azd down` Workflow
- **🎯 Host-selection guidance** in `docs/chapter-04-infrastructure/provisioning.md` — ein einsteigerfreundlicher Vergleich von `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` und `springapp` mit Hinweisen, wann AKS oder Azure Spring Apps zu wählen sind
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, Service Connection mit Workload Identity Federation (OIDC), die generierte `azure-dev.yml` und Einrichtung einer Variable Group
- **🔑 Service Principals (Pattern 4)** hinzugefügt zu `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, nicht-interaktives `azd auth login` mit Client Secret vs. föderierten/OIDC-Anmeldeinformationen, wann welches Verfahren zu verwenden ist und sichere Aufbewahrung von Anmeldeinformationen
- **🪝 Hook error-handling** Unterabschnitt in `docs/chapter-04-infrastructure/deployment-guide.md` — Exit-Codes und `set -e`, `continueOnError`, Hooks isoliert mit `azd hooks run` testen, betriebssystemspezifische Shells und `--debug`
- **👥 Team / shared environments** Abschnitt in `docs/chapter-03-configuration/configuration.md` — was in `.azure/` lebt, was in `.gitignore` sollte, pro-Entwickler-Umgebungen, `azd env list`/`select` und Bereitstellung von Umgebungswerten in CI/CD
- **🧰 `azd restore` und erweiterte `azd package`** Erklärungen in `resources/cheat-sheet.md` — Wiederherstellen von Abhängigkeiten und Erzeugen eines deploybaren Artefakts ohne Deployment

#### Geändert
- **🧭 Kapitel-4-Lektionentabelle** aktualisiert, um die neue Lektion "Authoring Your Own Template" (Lektion 3) aufzunehmen
- **🧭 Kapitel-1-Lektionentabelle** aktualisiert, um die neue Lektion "Dev Containers & Codespaces" (Lektion 5) aufzunehmen; Navigationsfußzeilen zwischen `bring-your-own-app.md` und `dev-containers.md` verbunden

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Diese Version schließt die größten Lücken für einen vollständigen Einsteigerleitfaden, indem zwei neue praxisorientierte Lektionen hinzugefügt werden (ein deploybares Multi-Agent Walkthrough und die Integration von azd in ein bestehendes Projekt), eine einsteigerfreundliche Hooks-Einführung, ein Abschnitt zu Terraform mit azd, ein schrittweiser GitHub Actions Pipeline Walkthrough, eine Erläuterung der neuen Preview-Extensions und eine explizite Checkliste zur Deployment-Verifikation.**

#### Hinzugefügt
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — ein vollständig praxisorientierter, deploybarer Zwei-Agenten-Walkthrough (Orchestrator + Spezialisten) unter Verwendung einer realen Vorlage (`contoso-creative-writer`), behandelt wann Multi-Agenten sinnvoll sind, den `azd up` Workflow, Verständnis der bereitgestellten Ressourcen, Cross-Agent Tracing, Anpassung und Aufräumen
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — wie man azd zu einem bestehenden Projekt hinzufügt mit `azd init` ("use code in the current directory"), Verständnis von `azure.yaml` und `infra/`, `azd infra generate`, Host-Erkennung und Deployment mit `azd up`
- **🌐 Terraform with azd** Abschnitt hinzugefügt zu `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` Konfiguration, `.tf` Ordnerstruktur, erforderliche `AZURE_*` Outputs und `azd-env-name` Tagging und der identische `azd up` / `azd down` Workflow (schließt die Lücke, in der Terraform-Unterstützung behauptet, aber nur Bicep gezeigt wurde)
- **⚙️ Schrittweiser GitHub Actions Walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — vom GitHub-Repo zu automatisierten Deploys: `azd pipeline config`, OIDC-föderierte Anmeldeinformationen (keine gespeicherten Geheimnisse), die generierte `azure-dev.yml` und Hinweise zu Secrets vs. Variablen
- **🪝 Einsteiger- "Neu bei Hooks?"-Einführung** in `docs/chapter-04-infrastructure/deployment-guide.md` — was ein Hook ist, eine Tabelle mit Hook-Phasen, ein minimales erstes Hook-Beispiel und manuelles Ausführen von Hooks mit `azd hooks run`
- **✅ "Verify Your Deployment" Checkliste** hinzugefügt zu Schritt 5 von `docs/chapter-01-foundation/first-project.md` — Smoke-Test, Health-Endpoint-Check und explizite Erfolgskriterien
- **🧩 Erläuterung für neue Preview-Extensions** `azure.ai.skills` und `azure.ai.connections` (was sie sind und wann man sie einsetzen sollte) in `docs/chapter-08-production/production-ai-practices.md`

#### Geändert
- **🧭 Kapitel-5-Lektionentabelle** korrigiert: `multi-agent-basics.md` ist jetzt Lektion 1 (die einzige vollständig praxisorientierte Lektion), mit ehrlicher Kennzeichnung, dass Lektion 2 in Kapitel 6 liegt und das Retail-Szenario ein Architektur-Blueprint ist, kein One-Command-Template
- **🧭 Kapitel-1-Lektionentabelle** enthält jetzt die neue Lektion "Bring Your Own App" (Lektion 4)
- **🔗 Navigationsfußzeilen** aktualisiert: `first-project.md` verlinkt nun weiter zu `bring-your-own-app.md`

#### Behoben
- **🧱 Schließen der "behaupteten aber fehlenden" Terraform-Lücke** — Der Kurs verwies zuvor auf Terraform-Unterstützung, ohne sie zu zeigen
- **🔀 Korrigierte irreführende Kapitel-5 Querverweise** die implizierten, dass eine vollständige Multi-Agent-Implementierung existierte, obwohl nur ein Architektur-Blueprint vorhanden war

#### Aktualisierte Dateien
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(neu)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(neu)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Diese Version validiert den Kurs erneut gegen `azd` `1.25.6` (Juni 2026) und die `azure.ai.agents` `0.1.40-preview` Extension, erweitert die AI-Anleitung vom "Scaffolding eines Agents" zur vollständigen Agent-Lifecycle-Behandlung (testen → evaluieren → optimieren → inspizieren → löschen), macht die neuen Preview-Extensions `azure.ai.skills` und `azure.ai.connections` sichtbar und vermerkt das ".NET Aspire" → "Aspire" Produkt-Rebranding.**

#### Hinzugefügt
- **🔁 Vollständige Abdeckung des Agent-Lifecycles** für Einsteiger und AI-Ingenieure über die Dokumentation:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle-Tabelle (scaffold → test → measure → improve → inspect → clean up) hinzugefügt zum Abschnitt Extensions und AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Neuer Abschnitt "Managing the Agent Lifecycle" mit `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force`
  - `resources/cheat-sheet.md` — Erweiterte AI Agent Commands mit `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force`
- **🧩 Neue Preview-Extensions** dokumentiert: `azure.ai.skills` (wiederverwendbare Agent-Skills) und `azure.ai.connections` (Foundry-Verbindungen) hinzugefügt zur Extensions-Tabelle und zum Cheat Sheet
- **⏱️ Hinweise zur Antwortzeitmessung** — `azd ai agent invoke` Beispiele vermerken jetzt, dass es Gesamtlatenz und Time-To-First-Byte ausgibt
- **📌 Versions-Banner** im Root-README, das Lernende auf `azd version` und `azd upgrade` hinweist

#### Geändert
- **✅ Validierungs-Basislinie aktualisiert** von `azd 1.23.12` (März 2026) auf `azd 1.25.6` (Juni 2026) in allen Kapitel-READMEs und den Workshop-Dokumenten
- **🤖 Kapitel-2 Extension-Hinweis** aktualisiert von `azure.ai.agents` `0.1.18-preview` auf `0.1.40-preview`
- **🧪 Workshop-Validierungsbeispiel** (`azd version` Ausgabe) auf `1.25.6` aktualisiert
- **🧭 README "What's New in azd Today"** aktualisiert, um den End-to-End Agent-Lifecycle, neue AI-Extensions und jüngste QoL-Fixes (`azd init` Idempotenz, `azd auth login` stale-token clearing, `azd tool` First-Run Prompt) hervorzuheben
- **📖 Kapitel-2 agents.md (Option 4)** verweist Lernende jetzt auf die Post-Deploy Lifecycle-Kommandos, statt beim `azd up` zu stoppen

#### Behoben
- **🏷️ Produktnamen** — Aspire-Rebranding-Hinweis hinzugefügt (" .NET Aspire" ist jetzt einfach "Aspire"); azd's Aspire-Unterstützung ist unverändert
- **🔎 Live Release-Validierung** bestätigt gegen den Azure Developer CLI Release-Feed: stabile CLI `1.25.6` (2026-06-12) und `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Aktualisierte Dateien
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Einsteiger-Onboarding-Klärung, Setup-Validierung & abschließende AZD-Befehlsbereinigung
**Diese Version baut auf der AZD-1.23-Validierungsprüfung auf und liefert einen einsteigerorientierten Dokumentationsdurchgang: Sie klärt die AZD-first-Authentifizierungsanleitung, fügt lokale Setup-Validierungsskripte hinzu, überprüft wichtige Befehle gegen die live AZD-CLI und entfernt die letzten veralteten englischsprachigen Befehlsreferenzen außerhalb des Änderungsprotokolls.**

#### Hinzugefügt
- **🧪 Einsteiger-Setup-Validierungsskripte** mit `validate-setup.ps1` und `validate-setup.sh`, damit Lernende die erforderlichen Tools prüfen können, bevor sie Kapitel 1 beginnen
- **✅ Vorab-Setup-Validierungsschritte** im Root-README und im Kapitel-1-README, damit fehlende Voraussetzungen erkannt werden, bevor `azd up` ausgeführt wird

#### Geändert
- **🔐 Einsteiger-Authentifizierungsanleitung** behandelt jetzt durchgängig `azd auth login` als primären Pfad für AZD-Workflows, wobei `az login` als optional hervorgehoben wird, es sei denn, Azure CLI-Befehle werden direkt verwendet
- **📚 Kapitel-1-Onboarding-Ablauf** verweist Lernende nun darauf, ihr lokales Setup vor Installation, Authentifizierung und den ersten Bereitstellungsschritten zu validieren
- **🛠️ Validator-Meldungen** trennen jetzt klar blockierende Anforderungen von optionalen Azure CLI-Warnungen für den reinen AZD-Einsteigerpfad
- **📖 Konfigurations-, Fehlerbehebungs- und Beispieldokumente** unterscheiden jetzt zwischen erforderlicher AZD-Authentifizierung und optionaler Azure CLI-Anmeldung, wo beide zuvor ohne Kontext präsentiert wurden

#### Behoben
- **📋 Verbleibende englischsprachige Befehlsreferenzen** auf aktuelle AZD-Formen aktualisiert, einschließlich `azd config show` im Spickzettel und `azd monitor --overview`, wo eine Azure-Portal-Übersicht beabsichtigt war
- **🧭 Einsteigerbehauptungen in Kapitel 1** abgeschwächt, um Überversprechen hinsichtlich garantierter fehlerfreier oder Rollback-Verhalten über alle Templates und Azure-Ressourcen hinweg zu vermeiden
- **🔎 Live-CLI-Validierung** hat die aktuelle Unterstützung für `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` und `azd down --force --purge` bestätigt

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

#### AZD 1.23.12-Validierung, Erweiterung der Workshop-Umgebung & KI-Modell-Aktualisierung
**Diese Version führt eine Dokumentationsvalidierung gegen `azd` `1.23.12` durch, aktualisiert veraltete AZD-Befehlsbeispiele, erneuert die KI-Modellhinweise auf aktuelle Defaults und erweitert die Workshop-Anweisungen über GitHub Codespaces hinaus, um auch Dev-Container und lokale Klone zu unterstützen.**

#### Hinzugefügt
- **✅ Validierungsnotizen in den Kernkapiteln und Workshop-Dokumenten**, um die getestete AZD-Baseline für Lernende mit neueren oder älteren CLI-Builds explizit zu machen
- **⏱️ Hinweise zum Bereitstellungs-Timeout** für langlaufende KI-Anwendungs-Bereitstellungen mit `azd deploy --timeout 1800`
- **🔎 Schritte zur Erweiterungsinspektion** mit `azd extension show azure.ai.agents` in den KI-Workflow-Dokumenten
- **🌐 Erweiterte Workshop-Umgebungsanleitung**, die GitHub Codespaces, Dev-Container und lokale Klone mit MkDocs abdeckt

#### Geändert
- **📚 Kapitel-Intro-READMEs** vermerken jetzt konsistent die Validierung gegen `azd 1.23.12` in den Bereichen Grundlagen, Konfiguration, Infrastruktur, Multi-Agent, Pre-Deployment, Fehlerbehebung und Produktion
- **🛠️ AZD-Befehlsreferenzen** in den Dokumenten auf aktuelle Formen aktualisiert:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` oder `azd env get-value(s)` je nach Kontext
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` wo eine Application Insights-Übersicht beabsichtigt ist
- **🧪 Provision-Preview-Beispiele** auf die derzeit unterstützte Nutzung wie `azd provision --preview` und `azd provision --preview -e production` vereinfacht
- **🧭 Workshop-Ablauf** aktualisiert, sodass Lernende die Labs in Codespaces, einem Dev-Container oder einem lokalen Klon abschließen können, statt ausschließlich Codespaces vorauszusetzen
- **🔐 Authentifizierungsanleitung** bevorzugt jetzt `azd auth login` für AZD-Workflows, wobei `az login` als optional gilt, wenn Azure CLI-Befehle direkt verwendet werden

#### Behoben
- **🪟 Windows-Installationsbefehle** in der Installationsanleitung auf die aktuelle Groß-/Kleinschreibung des `winget`-Pakets normalisiert
- **🐧 Linux-Installationshinweise** korrigiert, um nicht unterstützte distributionsspezifische `azd`-Paketmanager-Anweisungen zu vermeiden und stattdessen gegebenenfalls auf Release-Assets zu verweisen
- **📦 KI-Modellbeispiele** von älteren Defaults wie `gpt-35-turbo` und `text-embedding-ada-002` auf aktuelle Beispiele wie `gpt-4.1-mini`, `gpt-4.1` und `text-embedding-3-large` aktualisiert
- **📋 Deployment- und Diagnosesnippets** korrigiert, um aktuelle Umgebungs- und Statusbefehle in Logs, Skripten und Troubleshooting-Schritten zu verwenden
- **⚙️ GitHub Actions-Anleitung** von `Azure/setup-azd@v1.0.0` auf `Azure/setup-azd@v2` aktualisiert
- **🤖 MCP/Copilot-Zustimmungsanleitung** von `azd mcp consent` auf `azd copilot consent list` aktualisiert

#### Verbessert
- **🧠 KI-Kapitel-Anleitungen** erklären jetzt besser das preview-empfindliche Verhalten von `azd ai`, mandantenspezifische Anmeldung, aktuelle Nutzung von Extensions und aktualisierte Empfehlungen für Modellbereitstellungen
- **🧪 Workshop-Anweisungen** verwenden jetzt realistischere Versionsbeispiele und klarere Formulierungen zur Umgebungseinrichtung für praktische Labs
- **📈 Produktions- und Troubleshooting-Dokumente** stimmen jetzt besser mit aktuellen Monitoring-, Fallback-Modell- und Kostenstufen-Beispielen überein

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

#### AZD KI-CLI-Befehle, Inhaltsvalidierung & Template-Erweiterung
**Diese Version ergänzt die Abdeckung von `azd ai`, `azd extension` und `azd mcp` Befehlen in allen KI-bezogenen Kapiteln, behebt defekte Links und veralteten Code in agents.md, aktualisiert den Spickzettel und überarbeitet den Abschnitt Beispiel-Templates mit validierten Beschreibungen und neuen Azure AI AZD-Templates.**

#### Hinzugefügt
- **🤖 AZD KI-CLI-Abdeckung** über 7 Dateien (zuvor nur in Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Neue "Extensions and AI Commands"-Sektion, die `azd extension`, `azd ai agent init` und `azd mcp` einführt
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` mit Vergleichstabelle (Template- vs. Manifest-Ansatz)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" und "Agent-First Deployment"-Unterrubriken
  - `docs/chapter-05-multi-agent/README.md` — Quick Start zeigt jetzt sowohl Template- als auch manifestbasierte Bereitstellungspfade
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Der Deploy-Abschnitt enthält jetzt die Option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Unterabschnitt "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Neue Sektion "AI & Extensions Commands" mit `azd extension`, `azd ai agent init`, `azd mcp` und `azd infra generate`
- **📦 Neue AZD KI-Beispiel-Templates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-Chat mit Blazor WebAssembly, Semantic Kernel und Sprachchat-Unterstützung
  - **azure-search-openai-demo-java** — Java RAG-Chat mit Langchain4J und ACA/AKS-Bereitstellungsoptionen
  - **contoso-creative-writer** — Multi-Agenten-Creative-Writing-App unter Verwendung des Azure AI Agent Service, Bing Grounding und Prompty
  - **serverless-chat-langchainjs** — Serverless RAG mit Azure Functions + LangChain.js + Cosmos DB und Ollama-Unterstützung für lokale Entwicklung
  - **chat-with-your-data-solution-accelerator** — Enterprise-RAG-Accelerator mit Admin-Portal, Teams-Integration und PostgreSQL/Cosmos DB-Optionen
  - **azure-ai-travel-agents** — Multi-Agent MCP-Orchestrierungs-Referenz-App mit Servern in .NET, Python, Java und TypeScript
  - **azd-ai-starter** — Minimalvorlage für Azure AI-Infrastruktur mit Bicep
  - **🔗 Awesome AZD AI Gallery link** — Verweis auf die [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ Templates)

#### Behoben
- **🔗 agents.md Navigation**: Previous/Next-Links stimmen jetzt mit der Lesson-Reihenfolge im Kapitel-2-README überein (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md defekte Links**: `production-ai-practices.md` auf `../chapter-08-production/production-ai-practices.md` korrigiert (3 Vorkommen)
- **📦 agents.md veralteter Code**: `opencensus` durch `azure-monitor-opentelemetry` + OpenTelemetry SDK ersetzt
- **🐛 agents.md ungültige API**: `max_tokens` von `create_agent()` nach `create_run()` als `max_completion_tokens` verschoben
- **🔢 agents.md Token-Zählung**: Grobe `len//4`-Schätzung durch `tiktoken.encoding_for_model()` ersetzt
- **azure-search-openai-demo**: Dienste von "Cognitive Search + App Service" zu "Azure AI Search + Azure Container Apps" korrigiert (Standard-Hoständerung Okt 2024)
- **contoso-chat**: Beschreibung aktualisiert, um Azure AI Foundry + Prompty zu referenzieren und mit dem tatsächlichen Repository-Titel und Tech-Stack übereinzustimmen

#### Entfernt
- **ai-document-processing**: Nicht-funktionale Template-Referenz entfernt (Repo nicht öffentlich als AZD-Template zugänglich)

#### Verbessert
- **📝 agents.md Übungen**: Übung 1 zeigt jetzt die erwartete Ausgabe und den `azd monitor`-Schritt; Übung 2 enthält den vollständigen `FunctionTool`-Registrierungscode; Übung 3 ersetzt vage Anweisungen durch konkrete `prepdocs.py`-Befehle
- **📚 agents.md Ressourcen**: Dokumentationslinks zu aktuellen Azure AI Agent Service-Dokumenten und Quickstart aktualisiert
- **📋 agents.md Next Steps-Tabelle**: KI-Workshop-Lab als Link für vollständige Kapitelabdeckung hinzugefügt

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
#### Kurs-Navigationsverbesserung
**Diese Version verbessert die Kapitelnavigation in README.md mit einem erweiterten Tabellenformat.**

#### Geändert
- **Kurs-Karte Tabelle**: Verbessert mit direkten Lektionen-Links, Dauerabschätzungen und Komplexitätsbewertungen
- **Ordnerbereinigung**: Überflüssige alte Ordner entfernt (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link-Validierung**: Alle 21+ internen Links in der Kurs-Karte Tabelle verifiziert

### [v3.16.0] - 2026-02-05

#### Produktnamens-Aktualisierungen
**Diese Version aktualisiert Produktreferenzen auf aktuelles Microsoft-Branding.**

#### Geändert
- **Microsoft Foundry → Microsoft Foundry**: Alle Verweise in Nicht-Übersetzungsdateien aktualisiert
- **Azure AI Agent Service → Foundry Agents**: Dienstname aktualisiert, um aktuelles Branding widerzuspiegeln

#### Dateien aktualisiert
- `README.md` - Hauptseite des Kurses
- `changelog.md` - Versionsverlauf
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Leitfaden zu KI-Agenten
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
- Neu hinzugefügt: `docs/chapter-05-multi-agent/`

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
  - Schnellstart-Befehle
  - Navigation zu anderen Kapiteln

#### Geändert
- **🔗 Alle internen Links aktualisiert**: 78+ Pfade in allen Dokumentationsdateien aktualisiert
- **🗺️ Haupt-README.md**: Kurs-Karte mit neuer Kapitelstruktur aktualisiert
- **📝 examples/README.md**: Querverweise auf Kapitelordner aktualisiert

#### Entfernt
- Alte Ordnerstruktur entfernt (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-Umstrukturierung: Kapitel-Navigation
**Diese Version fügte Kapitel-Navigations-README-Dateien hinzu (von v3.15.0 obsolet gemacht).**

---

### [v3.13.0] - 2026-02-05

#### Neuer KI-Agenten-Leitfaden
**Diese Version fügt einen umfassenden Leitfaden zum Bereitstellen von KI-Agenten mit der Azure Developer CLI hinzu.**

#### Hinzugefügt
- **🤖 docs/microsoft-foundry/agents.md**: Vollständiger Leitfaden, der behandelt:
  - Was KI-Agenten sind und wie sie sich von Chatbots unterscheiden
  - Drei Schnellstart-Agenten-Templates (Foundry Agents, Prompty, RAG)
  - Agenten-Architekturpatterns (Single Agent, RAG, Multi-Agent)
  - Tool-Konfiguration und Anpassung
  - Überwachung und Metrikverfolgung
  - Kostenüberlegungen und Optimierung
  - Häufige Troubleshooting-Szenarien
  - Drei praxisorientierte Übungen mit Erfolgskriterien

#### Inhaltsstruktur
- **Einführung**: Agenten-Konzepte für Einsteiger
- **Schnellstart**: Agenten bereitstellen mit `azd init --template get-started-with-ai-agents`
- **Architekturpatterns**: Visuelle Diagramme der Agenten-Patterns
- **Konfiguration**: Tool-Setup und Umgebungsvariablen
- **Überwachung**: Integration mit Application Insights
- **Übungen**: Progressives praxisnahes Lernen (jeweils 20–45 Minuten)

---

### [v3.12.0] - 2026-02-05

#### Aktualisierung der DevContainer-Umgebung
**Diese Version aktualisiert die Konfiguration des Development-Containers mit modernen Tools und besseren Standardeinstellungen für das AZD-Lernerlebnis.**

#### Geändert
- **🐳 Basis-Image**: Aktualisiert von `python:3.12-bullseye` auf `python:3.12-bookworm` (aktuelles Debian stable)
- **📛 Container-Name**: Umbenannt von "Python 3" zu "AZD for Beginners" zur besseren Verständlichkeit

#### Hinzugefügt
- **🔧 Neue Dev Container-Funktionen**:
  - `azure-cli` mit aktiviertem Bicep-Support
  - `node:20` (LTS-Version für AZD-Templates)
  - `github-cli` für Template-Management
  - `docker-in-docker` für Container-App-Bereitstellungen

- **🔌 Port-Weiterleitung**: Vorkonfigurierte Ports für gängige Entwicklung:
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

- **⚙️ VS Code-Einstellungen**: Standard-Einstellungen für Python-Interpreter, Formatierung beim Speichern und Entfernen von überflüssigen Leerzeichen hinzugefügt

- **📦 Aktualisierte requirements-dev.txt**:
  - MkDocs minify Plugin hinzugefügt
  - pre-commit für Codequalität hinzugefügt
  - Azure SDK-Pakete hinzugefügt (azure-identity, azure-mgmt-resource)

#### Behoben
- **Post-Create-Befehl**: Überprüft jetzt AZD- und Azure CLI-Installation beim Start des Containers

---

### [v3.11.0] - 2026-02-05

#### README-Überarbeitung für Einsteiger
**Diese Version verbessert README.md erheblich, um einsteigerfreundlicher zu sein, und fügt wichtige Ressourcen für KI-Entwickler hinzu.**

#### Hinzugefügt
- **🆚 Azure CLI vs AZD Vergleich**: Klare Erklärung, wann welches Tool verwendet werden sollte, mit praktischen Beispielen
- **🌟 Awesome AZD Links**: Direkte Links zur Community-Template-Galerie und zu Beitragsressourcen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ einsatzbereite Templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-Beitrag
- **🎯 Schnellstart-Anleitung**: Vereinfachter 3-Schritte-Einstieg (Installieren → Anmelden → Bereitstellen)
- **📊 Erfahrungsbasierte Navigations-Tabelle**: Klare Anleitung, wo je nach Entwicklererfahrung begonnen werden sollte

#### Geändert
- **README-Struktur**: Für progressive Offenlegung neu organisiert - wichtigste Informationen zuerst
- **Einführungsabschnitt**: Neu formuliert, um "The Magic of `azd up`" für komplette Einsteiger zu erklären
- **Doppelte Inhalte entfernt**: Doppelten Troubleshooting-Abschnitt entfernt
- **Troubleshooting-Befehle**: `azd logs` Verweis korrigiert zu gültigem `azd monitor --logs`

#### Behoben
- **🔐 Authentifizierungsbefehle**: `azd auth login` und `azd auth logout` zur cheat-sheet.md hinzugefügt
- **Ungültige Befehlsreferenzen**: Verbleibende `azd logs` aus dem README-Troubleshooting-Abschnitt entfernt

#### Hinweise
- **Umfang**: Änderungen angewendet auf Haupt-README.md und resources/cheat-sheet.md
- **Zielgruppe**: Verbesserungen speziell für Entwickler, die neu bei AZD sind

---

### [v3.10.0] - 2026-02-05

#### Korrektur der Azure Developer CLI-Befehle
**Diese Version behebt nicht vorhandene AZD-Befehle in der gesamten Dokumentation und stellt sicher, dass alle Codebeispiele gültige Azure Developer CLI-Syntax verwenden.**

#### Behoben
- **🔧 Nicht vorhandene AZD-Befehle entfernt**: Umfassende Prüfung und Korrektur ungültiger Befehle:
  - `azd logs` (existiert nicht) → ersetzt durch `azd monitor --logs` oder Azure CLI-Alternativen
  - `azd service` Subbefehle (existieren nicht) → ersetzt durch `azd show` und Azure CLI
  - `azd infra import/export/validate` (existieren nicht) → entfernt oder durch gültige Alternativen ersetzt
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` Flags (existieren nicht) → entfernt
  - `azd provision --what-if/--rollback` Flags (existieren nicht) → aktualisiert auf Verwendung von `--preview`
  - `azd config validate` (existiert nicht) → ersetzt durch `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existieren nicht) → entfernt

- **📚 Dateien mit Befehlskorrekturen**:
  - `resources/cheat-sheet.md`: Umfangreiche Überarbeitung der Befehlsreferenz
  - `docs/deployment/deployment-guide.md`: Rollback- und Bereitstellungsstrategien korrigiert
  - `docs/troubleshooting/debugging.md`: Log-Analyseabschnitte korrigiert
  - `docs/troubleshooting/common-issues.md`: Troubleshooting-Befehle aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD-Debugging-Abschnitt korrigiert
  - `docs/getting-started/azd-basics.md`: Überwachungsbefehle korrigiert
  - `docs/getting-started/first-project.md`: Überwachungs- und Debugging-Beispiele aktualisiert
  - `docs/getting-started/installation.md`: Hilfe- und Versionsbeispiele korrigiert
  - `docs/pre-deployment/application-insights.md`: Log-Anzeige-Befehle korrigiert
  - `docs/pre-deployment/coordination-patterns.md`: Agenten-Debugging-Befehle korrigiert

- **📝 Versionsreferenz aktualisiert**:
  - `docs/getting-started/installation.md`: Harte Kodierung `1.5.0` auf generisch `1.x.x` geändert mit Link zu Releases

#### Geändert
- **Rollback-Strategien**: Dokumentation auf Git-basierte Rollbacks umgestellt (AZD hat kein natives Rollback)
- **Log-Anzeige**: `azd logs` Verweise ersetzt durch `azd monitor --logs`, `azd monitor --live` und Azure CLI-Befehle
- **Performance-Abschnitt**: Nicht vorhandene parallele/incrementelle Bereitstellungsflags entfernt, gültige Alternativen bereitgestellt

#### Technische Details
- **Gültige AZD-Befehle**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gültige azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Entfernte Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Hinweise
- **Verifizierung**: Befehle gegen Azure Developer CLI v1.23.x validiert

---

### [v3.9.0] - 2026-02-05

#### Abschluss des Workshops und Qualitätsverbesserung der Dokumentation
**Diese Version vervollständigt die interaktiven Workshop-Module, behebt alle defekten Dokumentationslinks und verbessert die Gesamtqualität der Inhalte für KI-Entwickler, die Microsoft AZD verwenden.**

#### Hinzugefügt
- **📝 CONTRIBUTING.md**: Neue Richtlinien für Beiträge mit:
  - Klare Anweisungen zum Melden von Problemen und Vorschlagen von Änderungen
  - Dokumentationsstandards für neue Inhalte
  - Richtlinien für Codebeispiele und Konventionen für Commit-Nachrichten
  - Informationen zur Community-Beteiligung

#### Abgeschlossen
- **🎯 Workshop-Modul 7 (Abschluss)**: Abschlussmodul vollständig fertiggestellt mit:
  - Umfassender Zusammenfassung der Workshop-Ergebnisse
  - Abschnitt zu den erlernten Schlüsselkonzepten, der AZD, Templates und Microsoft Foundry abdeckt
  - Empfehlungen zur Fortsetzung der Lernreise
  - Workshop-Herausforderungsübungen mit Schwierigkeitsbewertungen
  - Links für Community-Feedback und Support

- **📚 Workshop-Modul 3 (Zerlegung)**: Lernziele aktualisiert mit:
  - Anleitung zur Aktivierung von GitHub Copilot mit MCP-Servern
  - Verständnis der AZD-Template-Ordnerstruktur
  - Organisationsmuster für Infrastructure-as-Code (Bicep)
  - Schritt-für-Schritt-Laboranleitungen

- **🔧 Workshop-Modul 6 (Abbau)**: Abgeschlossen mit:
  - Ziele für Ressourcenbereinigung und Kostenmanagement
  - Verwendung von `azd down` für sicheres Abbau von Infrastruktur
  - Anleitung zur Wiederherstellung soft-gelöschter Cognitive Services
  - Bonus-Erkundungsaufforderungen für GitHub Copilot und Azure-Portal

#### Behoben
- **🔗 Broken Link Fixes**: 15+ fehlerhafte interne Dokumentationslinks behoben:
  - `docs/ai-foundry/ai-model-deployment.md`: Pfade zu microsoft-foundry-integration.md korrigiert
  - `docs/troubleshooting/ai-troubleshooting.md`: Pfade zu ai-model-deployment.md und production-ai-practices.md korrigiert
  - `docs/getting-started/first-project.md`: Nicht vorhandenes cicd-integration.md durch deployment-guide.md ersetzt
  - `examples/retail-scenario.md`: FAQ- und Troubleshooting-Guide-Pfade korrigiert
  - `examples/container-app/microservices/README.md`: Pfade zum Kurs-Hauptverzeichnis und Deployment-Guide korrigiert
  - `resources/faq.md` und `resources/glossary.md`: AI-Kapitelverweise aktualisiert
  - `course-outline.md`: Instructor-Guide- und AI-Workshop-Lab-Verweise korrigiert

- **📅 Workshop-Status-Banner**: Von "Under Construction" auf aktiven Workshop-Status mit Datum Februar 2026 aktualisiert

- **🔗 Workshop-Navigation**: Fehlerhafte Navigationslinks in workshop README.md behoben, die auf den nicht vorhandenen Ordner lab-1-azd-basics zeigten

#### Geändert
- **Workshop-Präsentation**: Warnhinweis "under construction" entfernt, Workshop ist jetzt vollständig und einsatzbereit
- **Konsistente Navigation**: Sicherstellung, dass alle Workshop-Module eine korrekte inter-modulare Navigation haben
- **Referenzen im Lernpfad**: Kapitelquerverweise aktualisiert, um korrekte microsoft-foundry-Pfade zu verwenden

#### Validiert
- ✅ Alle englischen Markdown-Dateien haben gültige interne Links
- ✅ Workshop-Module 0-7 sind mit Lernzielen vollständig
- ✅ Navigation zwischen Kapiteln und Modulen funktioniert korrekt
- ✅ Inhalte sind geeignet für AI-Entwickler, die Microsoft AZD verwenden
- ✅ Einsteigerfreundliche Sprache und Struktur durchgehend beibehalten
- ✅ CONTRIBUTING.md bietet klare Anleitung für Community-Beiträge

#### Technische Implementierung
- **Link-Validierung**: Automatisiertes PowerShell-Skript hat alle .md internen Links überprüft
- **Inhaltsprüfung**: Manuelle Überprüfung der Vollständigkeit des Workshops und der Eignung für Einsteiger
- **Navigationssystem**: Einheitliche Kapitel- und Modul-Navigationsmuster angewendet

#### Hinweise
- **Umfang**: Änderungen wurden nur an der englischen Dokumentation vorgenommen
- **Übersetzungen**: Übersetzungsordner wurden in dieser Version nicht aktualisiert (automatisierte Übersetzung wird später synchronisiert)
- **Dauer des Workshops**: Vollständiger Workshop bietet jetzt 3-4 Stunden praktisches Lernen

---

### [v3.8.0] - 2025-11-19

#### Erweiterte Dokumentation: Monitoring, Sicherheit und Multi-Agenten-Muster
**Diese Version fügt umfassende A-Grade-Lektionen zur Integration von Application Insights, Authentifizierungsmustern und Multi-Agenten-Koordination für Produktionsbereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Application Insights-Integrationslektion**: in `docs/pre-deployment/application-insights.md`:
  - AZD-fokussierte Bereitstellung mit automatischer Provisionierung
  - Vollständige Bicep-Templates für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (1,200+ lines)
  - AI/LLM-Monitoring-Muster (Microsoft Foundry Models Token-/Kostenüberwachung)
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
  - Sicherheits-Best-Practices und RBAC-Konfigurationen
  - Troubleshooting-Anleitung und Kostenanalyse
  - Produktionsreife passwortlose Authentifizierungsmuster

- **🤖 Multi-Agenten-Koordinationsmuster-Lektion**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequentiell, parallel, hierarchisch, ereignisgesteuert, Konsens)
  - Vollständige Orchestrator-Service-Implementierung (Python/Flask, 1,500+ lines)
  - 3 spezialisierte Agentenimplementierungen (Research, Writer, Editor)
  - Service Bus-Integration für Message Queuing
  - Cosmos DB-Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme, die Agenteninteraktionen zeigen
  - 3 fortgeschrittene Übungen (Timeout-Handling, Retry-Logik, Circuit Breaker)
  - Kostenaufschlüsselung ($240-565/month) mit Optimierungsstrategien
  - Application Insights-Integration für Monitoring

#### Verbessert
- **Pre-deployment-Kapitel**: Enthält jetzt umfassende Monitoring- und Koordinationsmuster
- **Getting Started-Kapitel**: Mit professionellen Authentifizierungsmustern erweitert
- **Produktionsbereitschaft**: Vollständige Abdeckung von Sicherheit bis Observability
- **Kursübersicht**: Aktualisiert, um neue Lektionen in Kapitel 3 und 6 zu referenzieren

#### Geändert
- **Lernprogression**: Bessere Integration von Sicherheit und Monitoring im gesamten Kurs
- **Dokumentationsqualität**: Einheitliche A-Grade-Standards (95-97%) über neue Lektionen hinweg
- **Produktionsmuster**: Vollständige End-to-End-Abdeckung für Unternehmensbereitstellungen

#### Verbesserungen
- **Entwicklererlebnis**: Klarer Pfad von Entwicklung bis zu Produktions-Monitoring
- **Sicherheitsstandards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Observability**: Vollständige Application Insights-Integration mit AZD
- **AI-Workloads**: Spezialisierte Überwachung für Microsoft Foundry Models und Multi-Agenten-Systeme

#### Validiert
- ✅ Alle Lektionen enthalten vollständigen, funktionierenden Code (keine Snippets)
- ✅ Mermaid-Diagramme für visuelles Lernen (insgesamt 19 über 3 Lektionen)
- ✅ Praktische Übungen mit Verifikationsschritten (insgesamt 9)
- ✅ Produktionsreife Bicep-Templates, deploybar via `azd up`
- ✅ Kostenanalysen und Optimierungsstrategien
- ✅ Troubleshooting-Anleitungen und Best Practices
- ✅ Wissensprüfungen mit Verifikationsbefehlen

#### Dokumentationsbewertungsergebnisse
- **docs/pre-deployment/application-insights.md**: - Umfassender Monitoring-Leitfaden
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Fortgeschrittene Multi-Agenten-Architekturen
- **Gesamt neuer Inhalt**: - Konsistente hochwertige Standards

#### Technische Implementierung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentifizierung**: Managed Identity + Key Vault + RBAC-Muster
- **Multi-Agenten**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Monitoring**: Live-Metriken + Kusto-Abfragen + Alerts + Dashboards
- **Kostenmanagement**: Sampling-Strategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 2025-11-19

#### Verbesserungen der Dokumentationsqualität und neues Microsoft Foundry Models-Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Microsoft Foundry Models-Bereitstellungsbeispiel mit gpt-4.1-Chatoberfläche hinzu.**

#### Hinzugefügt
- **🤖 Microsoft Foundry Models Chat-Beispiel**: Vollständige gpt-4.1-Bereitstellung mit funktionierender Implementierung in `examples/azure-openai-chat/`:
  - Vollständige Microsoft Foundry Models-Infrastruktur (gpt-4.1 Modellbereitstellung)
  - Python-Kommandozeilen-Chatoberfläche mit Gesprächsverlauf
  - Key Vault-Integration zur sicheren Speicherung von API-Schlüsseln
  - Token-Nutzungsüberwachung und Kostenabschätzung
  - Rate Limiting und Fehlerbehandlung
  - Umfassendes README mit 35-45 Minuten Bereitstellungsanleitung
  - 11 produktionsreife Dateien (Bicep-Templates, Python-App, Konfiguration)
- **📚 Dokumentationsübungen**: Praktische Übungen zur Konfigurationsanleitung hinzugefügt:
  - Übung 1: Multi-Environment-Konfiguration (15 Minuten)
  - Übung 2: Praxis zur Geheimnisverwaltung (10 Minuten)
  - Klare Erfolgskriterien und Verifikationsschritte
- **✅ Bereitstellungsverifikation**: Verifikationsabschnitt zur Deployment-Anleitung hinzugefügt:
  - Health-Check-Verfahren
  - Checkliste mit Erfolgskriterien
  - Erwartete Ausgaben für alle Bereitstellungsbefehle
  - Schnellreferenz für Troubleshooting

#### Verbessert
- **examples/README.md**: Auf A-Grade-Qualität (93%) aktualisiert:
  - azure-openai-chat zu allen relevanten Abschnitten hinzugefügt
  - Anzahl lokaler Beispiele von 3 auf 4 erhöht
  - In die Tabelle der AI-Anwendungsbeispiele aufgenommen
  - In Quick Start für fortgeschrittene Anwender integriert
  - In Microsoft Foundry Templates-Sektion aufgenommen
  - Vergleichsmatrix und Technologie-Findungsabschnitte aktualisiert
- **Dokumentationsqualität**: Verbesserte Bewertung von B+ (87%) → A- (92%) im docs-Ordner:
  - Erwartete Ausgaben zu kritischen Befehlsbeispielen hinzugefügt
  - Verifikationsschritte für Konfigurationsänderungen aufgenommen
  - Praktisches Lernen mit praxisnahen Übungen erweitert

#### Geändert
- **Lernprogression**: Bessere Integration von AI-Beispielen für fortgeschrittene Lernende
- **Dokumentationsstruktur**: Handlungsorientiertere Übungen mit klaren Ergebnissen
- **Verifikationsprozess**: Explizite Erfolgskriterien zu wichtigen Workflows hinzugefügt

#### Verbesserungen
- **Entwicklererlebnis**: Microsoft Foundry Models-Bereitstellung benötigt jetzt 35-45 Minuten (vs. 60-90 für komplexe Alternativen)
- **Kosten-Transparenz**: Klare Kostenschätzungen ($50-200/month) für das Microsoft Foundry Models-Beispiel
- **Lernpfad**: AI-Entwickler haben klaren Einstiegspunkt mit azure-openai-chat
- **Dokumentationsstandards**: Einheitliche erwartete Ausgaben und Verifikationsschritte

#### Validiert
- ✅ Microsoft Foundry Models-Beispiel vollständig funktionsfähig mit `azd up`
- ✅ Alle 11 Implementierungsdateien syntaktisch korrekt
- ✅ README-Anweisungen entsprechen der tatsächlichen Bereitstellungserfahrung
- ✅ Dokumentationslinks an 8+ Stellen aktualisiert
- ✅ Beispieleindex spiegelt genau 4 lokale Beispiele wider
- ✅ Keine doppelten externen Links in Tabellen
- ✅ Alle Navigationsreferenzen korrekt

#### Technische Implementierung
- **Microsoft Foundry Models-Architektur**: gpt-4.1 + Key Vault + Container Apps-Muster
- **Sicherheit**: Managed Identity bereit, Geheimnisse im Key Vault
- **Monitoring**: Application Insights-Integration
- **Kostenmanagement**: Token-Tracking und Nutzungsoptimierung
- **Bereitstellung**: Einzelner `azd up`-Befehl für vollständiges Setup

### [v3.6.0] - 2025-11-19

#### Großes Update: Container App-Bereitstellungsbeispiele
**Diese Version führt umfassende, produktionsreife Bereitstellungsbeispiele für Containeranwendungen mit Azure Developer CLI (AZD) ein, inklusive vollständiger Dokumentation und Integration in den Lernpfad.**

#### Hinzugefügt
- **🚀 Container App-Beispiele**: Neue lokale Beispiele in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Vollständige Übersicht über containerisierte Bereitstellungen, Quick Start, Produktions- und fortgeschrittene Muster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Einsteigerfreundliche REST-API mit Scale-to-Zero, Health-Probes, Monitoring und Troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsreife Multi-Service-Bereitstellung (API Gateway, Product, Order, User, Notification), asynchrone Messaging, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary-Deployments
- **Best Practices**: Sicherheit, Monitoring, Kostenoptimierung und CI/CD-Anleitungen für containerisierte Workloads
- **Codebeispiele**: Vollständige `azure.yaml`, Bicep-Templates und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-End-Test-Szenarien, Monitoring-Befehle, Troubleshooting-Anleitungen

#### Geändert
- **README.md**: Aktualisiert, um neue Container App-Beispiele unter "Local Examples - Container Applications" hervorzuheben und zu verlinken
- **examples/README.md**: Aktualisiert, um Container App-Beispiele hervorzuheben, Vergleichsmatrix-Einträge hinzuzufügen und Technologie-/Architekturverweise zu aktualisieren
- **Kursübersicht & Study Guide**: Aktualisiert, um auf neue Container App-Beispiele und Bereitstellungsmuster in relevanten Kapiteln zu verweisen

#### Validiert
- ✅ Alle neuen Beispiele sind mit `azd up` bereitstellbar und folgen Best Practices
- ✅ Dokumentations-Querverweise und Navigation aktualisiert
- ✅ Beispiele decken Szenarien von Einsteiger- bis Fortgeschrittenenniveau ab, einschließlich Produktions-Microservices

#### Hinweise
- **Umfang**: Nur englische Dokumentation und Beispiele
- **Nächste Schritte**: Erweiterung mit zusätzlichen fortgeschrittenen Container-Mustern und CI/CD-Automatisierung in zukünftigen Releases

### [v3.5.0] - 2025-11-19

#### Produkt-Rebranding: Microsoft Foundry
**Diese Version implementiert eine umfassende Produktnamensänderung von "Microsoft Foundry" zu "Microsoft Foundry" in der gesamten englischen Dokumentation, entsprechend der offiziellen Umbenennung durch Microsoft.**

#### Geändert
- **🔄 Produktname-Update**: Vollständiges Rebranding von "Microsoft Foundry" zu "Microsoft Foundry"
  - Alle Verweise in der englischen Dokumentation im Ordner `docs/` aktualisiert
  - Ordner umbenannt: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Umbenannte Datei: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt: 23 Inhaltsreferenzen in 7 Dokumentationsdateien aktualisiert

- **📁 Änderungen der Ordnerstruktur**:
  - `docs/ai-foundry/` umbenannt in `docs/microsoft-foundry/`
  - Alle Querverweise wurden aktualisiert, um die neue Ordnerstruktur widerzuspiegeln
  - Navigationslinks in der gesamten Dokumentation überprüft

- **📄 Dateiumbenennungen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links wurden aktualisiert, um den neuen Dateinamen zu referenzieren

#### Aktualisierte Dateien
- **Kapitel-Dokumentation** (7 Dateien):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Navigationslink-Updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamenreferenzen aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bereits Microsoft Foundry verwendet (aus früheren Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Referenzen aktualisiert (Übersicht, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweislinks aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zum nächsten Kapitel aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Referenzen aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Kursstruktur-Dateien** (2 Dateien):
  - `README.md` - 17 Referenzen aktualisiert (Kursübersicht, Kapiteltitel, Vorlagenabschnitt, Community-Insights)
  - `course-outline.md` - 14 Referenzen aktualisiert (Übersicht, Lernziele, Kapitelressourcen)

#### Validiert
- ✅ Keine verbleibenden "ai-foundry" Ordnerpfad-Referenzen in den englischen Docs
- ✅ Keine verbleibenden "Microsoft Foundry" Produktnamenreferenzen in den englischen Docs
- ✅ Alle Navigationslinks funktionieren mit der neuen Ordnerstruktur
- ✅ Datei- und Ordnerumbenennungen erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln validiert

#### Hinweise
- **Geltungsbereich**: Änderungen wurden nur an der englischen Dokumentation im `docs/`-Ordner vorgenommen
- **Übersetzungen**: Übersetzungsordner (`translations/`) wurden in dieser Version nicht aktualisiert
- **Workshop**: Workshop-Materialien (`workshop/`) wurden in dieser Version nicht aktualisiert
- **Beispiele**: Beispiel-Dateien können weiterhin Legacy-Bezeichnungen enthalten (wird in einem zukünftigen Update adressiert)
- **Externe Links**: Externe URLs und GitHub-Repository-Referenzen bleiben unverändert

#### Migrationsanleitung für Mitwirkende
Wenn Sie lokale Branches oder Dokumentation haben, die auf die alte Struktur verweisen:
1. Aktualisieren Sie Ordnerreferenzen: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualisieren Sie Dateireferenzen: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ersetzen Sie den Produktnamen: "Microsoft Foundry" → "Microsoft Foundry"
4. Überprüfen Sie, ob alle internen Dokumentationslinks weiterhin funktionieren

---

### [v3.4.0] - 2025-10-24

#### Verbesserungen bei Infrastrukturvorschau und Validierung
**Diese Version führt umfassende Unterstützung für die neue Azure Developer CLI-Vorschaufunktion ein und verbessert die Workshop-Benutzererfahrung.**

#### Hinzugefügt
- **🧪 azd provision --preview Feature Documentation**: Umfassende Dokumentation der neuen Infrastruktur-Vorschaufunktion
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration in die Provisioning-Anleitung mit Anwendungsfällen und Vorteilen
  - Integration von Pre-Flight-Checks für sicherere Deployments
  - Aktualisierungen der Einstiegshilfe mit sicherheitsorientierten Bereitstellungspraktiken
- **🚧 Workshop-Status-Banner**: Professionelles HTML-Banner zur Anzeige des Entwicklungsstatus des Workshops
  - Verlauf-Design mit Baustellen-Indikatoren für klare Benutzerkommunikation
  - Zeitstempel der letzten Aktualisierung für Transparenz
  - Mobil-responsive Gestaltung für alle Gerätetypen

#### Verbesserte Funktionen
- **Infrastruktursicherheit**: Vorschaufunktionalität in der gesamten Deployment-Dokumentation integriert
- **Validierung vor der Bereitstellung**: Automatisierte Skripte enthalten jetzt Tests für Infrastrukturvorschau
- **Entwickler-Workflow**: Aktualisierte Befehlssequenzen, die Preview als Best Practice einbeziehen
- **Workshop-Erlebnis**: Klare Erwartungen an Nutzer zur Content-Entwicklungsphase

#### Geändert
- **Deployment-Best-Practices**: Vorschau-zentrierter Workflow wird nun empfohlen
- **Dokumentationsfluss**: Infrastrukturvalidierung wurde früher im Lernprozess platziert
- **Workshop-Präsentation**: Professionelle Statuskommunikation mit klarem Entwicklungszeitplan

#### Verbessert
- **Safety-First-Ansatz**: Infrastrukturänderungen können jetzt vor der Bereitstellung validiert werden
- **Teamzusammenarbeit**: Vorschauergebnisse können zur Überprüfung und Genehmigung geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcenkosten vor der Provisionierung
- **Risikominderung**: Weniger Bereitstellungsfehler durch vorherige Validierung

#### Technische Umsetzung
- **Mehrdokumenten-Integration**: Vorschaufunktion in 4 zentralen Dateien dokumentiert
- **Kommandomuster**: Konsistente Syntax und Beispiele in der gesamten Dokumentation
- **Best-Practice-Integration**: Preview in Validierungs-Workflows und Skripten aufgenommen
- **Visuelle Indikatoren**: Deutliche NEW-Feature-Markierungen zur besseren Entdeckbarkeit

#### Workshop-Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Verlauf-Styling
- **Benutzererlebnis**: Klarer Entwicklungsstatus verhindert Verwirrung
- **Professionelle Präsentation**: Erhält die Glaubwürdigkeit des Repositories und setzt Erwartungen
- **Zeitplan-Transparenz**: Oktober 2025 Zeitstempel der letzten Aktualisierung für Verantwortlichkeit

### [v3.3.0] - 2025-09-24

#### Erweiterte Workshop-Materialien und interaktives Lernerlebnis
**Diese Version führt umfassende Workshop-Materialien mit browserbasierten interaktiven Anleitungen und strukturierten Lernpfaden ein.**

#### Hinzugefügt
- **🎥 Interaktiver Workshop-Leitfaden**: Browserbasiertes Workshop-Erlebnis mit MkDocs-Preview-Fähigkeit
- **📝 Strukturierte Workshop-Anweisungen**: 7-stufiger geführter Lernpfad von Entdeckung bis Anpassung
  - 0-Introduction: Workshop-Übersicht und Setup
  - 1-Select-AI-Template: Vorlagenerkennung und Auswahlprozess
  - 2-Validate-AI-Template: Deployment- und Validierungsverfahren
  - 3-Deconstruct-AI-Template: Verständnis der Template-Architektur
  - 4-Configure-AI-Template: Konfiguration und Anpassung
  - 5-Customize-AI-Template: Erweiterte Änderungen und Iterationen
  - 6-Teardown-Infrastructure: Aufräumen und Ressourcenverwaltung
  - 7-Wrap-up: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Tooling**: MkDocs-Konfiguration mit Material-Theme für ein verbessertes Lernerlebnis
- **🎯 Hands-On-Lernpfad**: 3-stufige Methodik (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces-Integration**: Nahtlose Einrichtung der Entwicklungsumgebung

#### Verbesserte Funktionen
- **AI Workshop Lab**: Erweiterung zu einem umfassenden 2–3-stündigen, strukturierten Lernerlebnis
- **Workshop-Dokumentation**: Professionelle Darstellung mit Navigation und visuellen Hilfen
- **Lernprogression**: Klare Schritt-für-Schritt-Anleitung von der Template-Auswahl bis zur Produktionsbereitstellung
- **Entwicklererlebnis**: Integrierte Tools für optimierte Entwicklungs-Workflows

#### Verbessert
- **Barrierefreiheit**: Browserbasiertes Interface mit Suche, Kopierfunktion und Theme-Umschalter
- **Selbstbestimmtes Lernen**: Flexibler Workshop-Aufbau, der unterschiedliche Lerngeschwindigkeiten berücksichtigt
- **Praktische Anwendung**: Realistische AI-Template-Deployment-Szenarien
- **Community-Integration**: Discord-Integration für Workshop-Unterstützung und Zusammenarbeit

#### Workshop-Funktionen
- **Integrierte Suche**: Schnelle Schlüsselwort- und Lektionserkennung
- **Kopieren von Codeblöcken**: Hover-to-copy-Funktionalität für alle Codebeispiele
- **Theme-Umschalter**: Unterstützung für Dunkel-/Hellmodus
- **Visuelle Ressourcen**: Screenshots und Diagramme zur besseren Verständlichkeit
- **Hilfsintegration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Große Navigationserneuerung und kapitelbasiertes Lernsystem
**Diese Version führt ein umfassendes, kapitelbasiertes Lernstruktur mit verbesserter Navigation im gesamten Repository ein.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Umstrukturierung des gesamten Kurses in 8 progressive Lernkapitel
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 Min.)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 Std.)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 Min.)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1,5 Std.)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 Std.)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 Std.)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1,5 Std.)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 Std.)
- **📚 Umfassendes Navigationssystem**: Konsistente Navigations-Header und -Footer in der gesamten Dokumentation
- **🎯 Fortschrittsverfolgung**: Abschluss-Checkliste und Lernverifikationssystem
- **🗺️ Lernpfad-Leitfaden**: Klare Einstiegspunkte für verschiedene Erfahrungsstufen und Ziele
- **🔗 Cross-Reference-Navigation**: Verwandte Kapitel und Voraussetzungen klar verlinkt

#### Verbesserte Funktionen
- **README-Struktur**: Umgewandelt in eine strukturierte Lernplattform mit kapitelbasierter Organisation
- **Dokumentationsnavigation**: Jede Seite enthält jetzt Kapitelkontext und Hinweise zur Lernprogression
- **Vorlagenorganisation**: Beispiele und Templates den passenden Lernkapiteln zugeordnet
- **Ressourcenintegration**: Spickzettel, FAQs und Studienleitfäden mit relevanten Kapiteln verknüpft
- **Workshop-Integration**: Hands-on-Labs mehreren Kapitel-Lernzielen zugeordnet

#### Geändert
- **Lernprogression**: Wechsel von linearer Dokumentation zu flexiblem kapitelbasiertem Lernen
- **Konfigurationsplatzierung**: Konfigurationsanleitung als Kapitel 3 neu positioniert für besseren Lernfluss
- **AI-Content-Integration**: Bessere Einbindung AI-spezifischer Inhalte im gesamten Lernprozess
- **Produktionsinhalte**: Fortgeschrittene Muster in Kapitel 8 für Unternehmenslerner konsolidiert

#### Verbessert
- **Benutzererlebnis**: Klare Navigationspfade und Kapitel-Fortschrittsanzeigen
- **Barrierefreiheit**: Konsistente Navigationsmuster für einfachere Kursnavigation
- **Professionelle Darstellung**: Universitätsähnliche Kursstruktur, geeignet für akademische und betriebliche Schulungen
- **Lerneffizienz**: Weniger Zeit, um relevante Inhalte durch verbesserte Organisation zu finden

#### Technische Umsetzung
- **Navigations-Header**: Standardisierte Kapitelnavigation in über 40 Dokumentationsdateien
- **Footer-Navigation**: Konsistente Fortschrittsführung und Kapitelabschlussindikatoren
- **Cross-Linking**: Umfassendes internes Verlinkungssystem, das verwandte Konzepte verbindet
- **Kapitelzuordnung**: Templates und Beispiele klar mit Lernzielen verknüpft

#### Erweiterung des Studienleitfadens
- **📚 Umfassende Lernziele**: Studienleitfaden an das 8-Kapitel-System angepasst
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Abschlusschecklisten
- **❓ Bewertungsfragen**: Wissensprüfungsfragen für jedes Kapitel mit beruflichen Ergebnissen
- **🛠️ Praktische Übungen**: Hands-on-Aktivitäten mit realen Deployment-Szenarien und Troubleshooting
- **📊 Skill-Progression**: Klare Weiterentwicklung von Grundkonzepten zu Unternehmensmustern mit Karriereziel
- **🎓 Zertifizierungsrahmen**: Berufliche Weiterentwicklung und Community-Anerkennung
- **⏱️ Zeitplanmanagement**: Strukturierter 10-Wochen-Lernplan mit Meilenstein-Validierung

### [v3.1.0] - 2025-09-17

#### Verbesserte Multi-Agent AI-Lösungen
**Diese Version verbessert die Multi-Agent-Retail-Lösung mit besserer Agentenbenennung und erweiterter Dokumentation.**

#### Geändert
- **Multi-Agent-Terminologie**: "Cora agent" wurde im gesamten Retail-Multi-Agent-Szenario durch "Customer agent" ersetzt für klareres Verständnis
- **Agentenarchitektur**: Alle Dokumentationen, ARM-Templates und Codebeispiele wurden auf die konsistente Benennung "Customer agent" aktualisiert
- **Konfigurationsbeispiele**: Modernisierte Agentenkonfigurationsmuster mit aktualisierten Namenskonventionen
- **Dokumentationskonsistenz**: Sicherstellung, dass alle Referenzen professionelle, beschreibende Agentennamen verwenden

#### Verbesserte Funktionen
- **ARM Template Package**: Aktualisiertes retail-multiagent-arm-template mit Customer agent-Referenzen
- **Architekturdiagramme**: Aktualisierte Mermaid-Diagramme mit neuer Agentenbenennung
- **Codebeispiele**: Python-Klassen und Implementierungsbeispiele verwenden jetzt CustomerAgent-Namensgebung
- **Umgebungsvariablen**: Alle Deployment-Skripte wurden auf CUSTOMER_AGENT_NAME-Konventionen aktualisiert

#### Verbessert
- **Entwicklererlebnis**: Klarere Agentenrollen und -verantwortlichkeiten in der Dokumentation
- **Produktionsreife**: Bessere Ausrichtung an Unternehmens-Namenskonventionen
- **Lernmaterialien**: Intuitivere Agentenbenennung für Bildungszwecke
- **Vorlagenbenutzbarkeit**: Vereinfachtes Verständnis von Agentenfunktionen und Bereitstellungsmustern

#### Technische Details
- Aktualisierte Mermaid-Architekturdiagramme mit CustomerAgent-Referenzen
- Ersetzung von CoraAgent-Klassennamen durch CustomerAgent in Python-Beispielen
- Anpassung von ARM-Template-JSON-Konfigurationen zur Verwendung des Agententyps "customer"
- Aktualisierung der Umgebungsvariablen von CORA_AGENT_* zu CUSTOMER_AGENT_* Mustern
- Aktualisierte Bereitstellungskommandos und Containerkonfigurationen

### [v3.0.0] - 2025-09-12

#### Große Änderungen - Fokus auf AI-Entwickler und Microsoft Foundry-Integration
**Diese Version verwandelt das Repository in eine umfassende, AI-fokussierte Lernressource mit Microsoft Foundry-Integration.**

#### Hinzugefügt
- **🤖 AI-First Learning Path**: Komplette Umstrukturierung mit Priorität auf AI-Entwickler und -Ingenieure
- **Microsoft Foundry Integration Guide**: Umfassende Dokumentation zur Verbindung von AZD mit Microsoft Foundry-Diensten
- **AI Model Deployment Patterns**: Detaillierte Anleitung zur Modellauswahl, Konfiguration und Produktionsbereitstellungsstrategien
- **AI Workshop Lab**: 2-3-stündiger praxisorientierter Workshop zur Umwandlung von KI-Anwendungen in mit AZD bereitstellbare Lösungen
- **Production AI Best Practices**: Für den Unternehmenseinsatz geeignete Muster zum Skalieren, Überwachen und Absichern von KI-Workloads
- **AI-Specific Troubleshooting Guide**: Umfassende Fehlerbehebung für Microsoft Foundry Models, Cognitive Services und KI-Bereitstellungsprobleme
- **AI Template Gallery**: Vorgestellte Sammlung von Microsoft Foundry-Vorlagen mit Komplexitätsbewertungen
- **Workshop Materials**: Vollständige Workshop-Struktur mit praktischen Laboren und Referenzmaterialien

#### Erweitert
- **README Structure**: Auf KI-Entwickler fokussiert mit 45% Community-Interesse-Daten aus Microsoft Foundry Discord
- **Learning Paths**: Dedizierte KI-Entwicklerreise neben traditionellen Pfaden für Studierende und DevOps-Ingenieure
- **Template Recommendations**: Vorgestellte KI-Vorlagen einschließlich azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community Integration**: Verbesserte Discord-Community-Unterstützung mit KI-spezifischen Kanälen und Diskussionen

#### Sicherheit & Produktionsfokus
- **Managed Identity Patterns**: KI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Cost Optimization**: Token-Nutzungsüberwachung und Budgetkontrollen für KI-Workloads
- **Multi-Region Deployment**: Strategien für die globale Bereitstellung von KI-Anwendungen
- **Performance Monitoring**: KI-spezifische Metriken und Integration mit Application Insights

#### Dokumentationsqualität
- **Linear Course Structure**: Logische Fortschreitung von Anfänger- bis hin zu fortgeschrittenen KI-Bereitstellungsmustern
- **Validated URLs**: Alle externen Repository-Links überprüft und zugänglich
- **Complete Reference**: Alle internen Dokumentationslinks validiert und funktionsfähig
- **Production Ready**: Unternehmensbereite Bereitstellungsmuster mit praxisnahen Beispielen

### [v2.0.0] - 2025-09-09

#### Wesentliche Änderungen - Repository-Umstrukturierung und professionelle Verbesserung
**Diese Version stellt eine bedeutende Überarbeitung der Repository-Struktur und der Inhaltsdarstellung dar.**

#### Hinzugefügt
- **Strukturiertes Lernframework**: Alle Dokumentationsseiten enthalten jetzt Abschnitte Einführung, Lernziele und Lernergebnisse
- **Navigationssystem**: Vorherige/Nächste-Lektionslinks in der gesamten Dokumentation für geführten Lernfortschritt hinzugefügt
- **Studienleitfaden**: Umfassende study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professionelle Darstellung**: Alle Emoji-Symbole für verbesserte Barrierefreiheit und professionelles Erscheinungsbild entfernt
- **Verbesserte Inhaltsstruktur**: Verbesserte Organisation und Ablauf der Lernmaterialien

#### Geändert
- **Dokumentationsformat**: Alle Dokumentationen mit konsistenter, lernfokussierter Struktur standardisiert
- **Navigationsfluss**: Logische Fortschreitung durch alle Lernmaterialien implementiert
- **Inhaltsdarstellung**: Dekorative Elemente zugunsten klarer, professioneller Formatierung entfernt
- **Linkstruktur**: Alle internen Links zur Unterstützung des neuen Navigationssystems aktualisiert

#### Verbessert
- **Barrierefreiheit**: Emoji-Abhängigkeiten für bessere Kompatibilität mit Screenreadern entfernt
- **Professionelles Erscheinungsbild**: Saubere, akademische Präsentation, geeignet für Unternehmungslernen
- **Lernerfahrung**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Inhaltsorganisation**: Besserer logischer Fluss und Verknüpfung zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Erstveröffentlichung - Umfassendes AZD-Lernrepository

#### Hinzugefügt
- **Kern-Dokumentationsstruktur**
  - Vollständige Getting-Started-Anleitungsreihe
  - Umfangreiche Bereitstellungs- und Provisionierungsdokumentation
  - Detaillierte Fehlerbehebungsressourcen und Debugging-Anleitungen
  - Vorbereitende Validierungstools und -verfahren

- **Getting Started Modul**
  - AZD Basics: Kernkonzepte und Terminologie
  - Installationsanleitung: Plattform-spezifische Einrichtungsanweisungen
  - Konfigurationsleitfaden: Umgebungseinrichtung und Authentifizierung
  - Erstes Projekt-Tutorial: Schritt-für-Schritt praktisches Lernen

- **Bereitstellungs- und Provisionierungsmodul**
  - Bereitstellungsleitfaden: Vollständige Workflow-Dokumentation
  - Provisionierungsleitfaden: Infrastructure as Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Multi-Service-Architektur-Muster

- **Vorbereitende Validierungsmodul**
  - Kapazitätsplanung: Validierung der Verfügbarkeit von Azure-Ressourcen
  - SKU-Auswahl: Umfassende Anleitung zu Service-Stufen
  - Vorflugprüfungen: Automatisierte Validierungsskripte (PowerShell und Bash)
  - Kostenabschätzung und Budgetplanungstools

- **Fehlerbehebungsmodul**
  - Häufige Probleme: Häufig auftretende Probleme und Lösungen
  - Debugging-Leitfaden: Systematische Fehlersuchmethoden
  - Erweiterte diagnostische Techniken und Tools
  - Performance-Überwachung und -Optimierung

- **Ressourcen und Referenzen**
  - Befehls-Spickzettel: Schnellreferenz für wesentliche Befehle
  - Glossar: Umfassende Definitionen von Begriffen und Abkürzungen
  - FAQ: Ausführliche Antworten auf häufig gestellte Fragen
  - Externe Ressourcenlinks und Community-Verbindungen

- **Beispiele und Vorlagen**
  - Beispiel einer einfachen Webanwendung
  - Vorlage zur Bereitstellung einer statischen Website
  - Konfiguration von Container-Anwendungen
  - Muster zur Datenbankintegration
  - Beispiele für Microservices-Architekturen
  - Implementierungen serverloser Funktionen

#### Funktionen
- **Multi-Platform Support**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Multiple Skill Levels**: Inhalte für Studierende bis hin zu professionellen Entwicklern
- **Praktischer Fokus**: Praxisbeispiele und realitätsnahe Szenarien
- **Umfassende Abdeckung**: Von Grundkonzepten bis hin zu fortgeschrittenen Unternehmensmustern
- **Security-First Approach**: Sicherheitsbest Practices integriert
- **Cost Optimization**: Leitlinien für kosteneffiziente Bereitstellungen und Ressourcenmanagement

#### Dokumentationsqualität
- **Detaillierte Codebeispiele**: Praktische, getestete Codebeispiele
- **Schritt-für-Schritt-Anleitungen**: Klare, umsetzbare Anweisungen
- **Umfassende Fehlerbehandlung**: Fehlerbehebung für häufige Probleme
- **Best Practices Integration**: Branchenstandards und Empfehlungen
- **Versionskompatibilität**: Aktuell mit den neuesten Azure-Diensten und azd-Funktionen

## Geplante zukünftige Verbesserungen

### Version 3.1.0 (Geplant)
#### Erweiterung der AI-Plattform
- **Multi-Model Support**: Integrationsmuster für Hugging Face, Azure Machine Learning und benutzerdefinierte Modelle
- **AI Agent Frameworks**: Vorlagen für LangChain, Semantic Kernel und AutoGen-Bereitstellungen
- **Erweiterte RAG-Muster**: Vektor-Datenbankoptionen über Azure AI Search hinaus (Pinecone, Weaviate usw.)
- **AI Observability**: Verbesserte Überwachung für Modellleistung, Token-Nutzung und Antwortqualität

#### Entwicklererlebnis
- **VS Code Extension**: Integrierte AZD + Microsoft Foundry Entwicklungserfahrung
- **GitHub Copilot Integration**: KI-unterstützte AZD-Vorlagenerstellung
- **Interaktive Tutorials**: Praxisnahe Codierungsübungen mit automatisierter Validierung für KI-Szenarien
- **Videoinhalte**: Ergänzende Video-Tutorials für visuelle Lernende mit Fokus auf KI-Bereitstellungen

### Version 4.0.0 (Geplant)
#### Unternehmens-KI-Muster
- **Governance Framework**: Modellgovernance, Compliance und Prüfpfade für KI
- **Multi-Tenant AI**: Muster zur Bedienung mehrerer Kunden mit isolierten KI-Diensten
- **Edge AI Deployment**: Integration mit Azure IoT Edge und Container-Instanzen
- **Hybrid Cloud AI**: Multi-Cloud- und hybride Bereitstellungsmuster für KI-Workloads

#### Erweiterte Funktionen
- **AI Pipeline Automation**: MLOps-Integration mit Azure Machine Learning-Pipelines
- **Erweiterte Sicherheit**: Zero-Trust-Muster, Private Endpoints und erweiteter Bedrohungsschutz
- **Performance-Optimierung**: Erweiterte Tuning- und Skalierungsstrategien für hochdurchsatzfähige KI-Anwendungen
- **Globale Verteilung**: Content-Delivery- und Edge-Caching-Muster für KI-Anwendungen

### Version 3.0.0 (Geplant) - Durch aktuelle Veröffentlichung ersetzt
#### Vorgeschlagene Ergänzungen - Jetzt in v3.0.0 implementiert
- ✅ **KI-Fokussierte Inhalte**: Umfassende Microsoft Foundry-Integration (Abgeschlossen)
- ✅ **Interaktive Tutorials**: Praxisorientiertes KI-Workshop-Labor (Abgeschlossen)
- ✅ **Erweitertes Sicherheitsmodul**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Performance-Optimierung**: Tuning-Strategien für KI-Workloads (Abgeschlossen)

### Version 2.1.0 (Geplant) - Teilweise in v3.0.0 implementiert
#### Kleinere Verbesserungen - Teilweise in der aktuellen Version abgeschlossen
- ✅ **Zusätzliche Beispiele**: KI-fokussierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Erweiterte FAQ**: KI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool-Integration**: Verbesserte IDE- und Editor-Integrationsanleitungen
- ✅ **Erweiterung der Überwachung**: KI-spezifische Überwachungs- und Alarmierungsmuster (Abgeschlossen)

#### Noch geplant für eine zukünftige Version
- **Mobilfreundliche Dokumentation**: Responsives Design für mobiles Lernen
- **Offline-Zugriff**: Herunterladbare Dokumentationspakete
- **Erweiterte IDE-Integration**: VS Code-Erweiterung für AZD + AI-Workflows
- **Community-Dashboard**: Echtzeit-Community-Metriken und Beitragsverfolgung

## Beiträge zum Changelog

### Änderungen melden
Wenn Sie zu diesem Repository beitragen, stellen Sie bitte sicher, dass Changelog-Einträge Folgendes enthalten:

1. **Versionsnummer**: Nach Semantic Versioning (major.minor.patch)
2. **Datum**: Veröffentlichungs- oder Aktualisierungsdatum im Format YYYY-MM-DD
3. **Kategorie**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Klare Beschreibung**: Prägnante Beschreibung der Änderung
5. **Auswirkungsbewertung**: Wie sich Änderungen auf bestehende Nutzer auswirken

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
- Funktionen oder Ansätze, die auslaufen
- Dokumentationsabschnitte, die zur Entfernung vorgesehen sind
- Methoden, für die es bessere Alternativen gibt

#### Entfernt
- Funktionen, Dokumentation oder Beispiele, die nicht mehr relevant sind
- Veraltete Informationen oder veraltete Ansätze
- Redundante oder zusammengeführte Inhalte

#### Behoben
- Korrekturen von Fehlern in Dokumentation oder Code
- Behebung gemeldeter Probleme oder Fehler
- Verbesserungen der Genauigkeit oder Funktionalität

#### Sicherheit
- Sicherheitsbezogene Verbesserungen oder Korrekturen
- Aktualisierungen von Sicherheitsbest Practices
- Behebung von Sicherheitslücken

### Semantic Versioning-Richtlinien

#### Major Version (X.0.0)
- Breaking Changes, die Benutzeraktionen erfordern
- Bedeutende Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik verändern

#### Minor Version (X.Y.0)
- Neue Funktionen oder Inhaltsergänzungen
- Erweiterungen, die Abwärtskompatibilität wahren
- Zusätzliche Beispiele, Tools oder Ressourcen

#### Patch-Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleinere Verbesserungen an bestehenden Inhalten
- Klarstellungen und kleine Ergänzungen

## Community-Feedback und Vorschläge

Wir ermutigen aktiv zur Community-Rückmeldung, um diese Lernressource zu verbessern:

### Wie Feedback gegeben werden kann
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Issues willkommen)
- **Discord Discussions**: Ideen teilen und sich mit der Microsoft Foundry-Community austauschen
- **Pull Requests**: Direkte Verbesserungen an Inhalten beitragen, insbesondere KI-Vorlagen und -Anleitungen
- **Microsoft Foundry Discord**: Teilnahme am #Azure-Kanal für AZD + KI-Diskussionen
- **Community-Foren**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback-Kategorien
- **KI-Inhaltsgenauigkeit**: Korrekturen zur Integration und Bereitstellung von KI-Diensten
- **Lernerfahrung**: Vorschläge zur Verbesserung des Lernflusses für KI-Entwickler
- **Fehlende KI-Inhalte**: Anfragen für zusätzliche KI-Vorlagen, Muster oder Beispiele
- **Barrierefreiheit**: Verbesserungen für unterschiedliche Lernbedürfnisse
- **KI-Tool-Integration**: Vorschläge zur besseren Integration von KI-Entwicklungs-Workflows
- **Produktions-KI-Muster**: Anfragen zu Unternehmens-KI-Bereitstellungsmustern

### Reaktionsverpflichtung
- **Issue-Antwort**: Innerhalb von 48 Stunden auf gemeldete Probleme
- **Feature-Anfragen**: Bewertung innerhalb einer Woche
- **Community-Beiträge**: Überprüfung innerhalb einer Woche
- **Sicherheitsprobleme**: Sofortige Priorität mit beschleunigter Reaktion

## Wartungsplan

### Regelmäßige Aktualisierungen
- **Monatliche Reviews**: Überprüfung der Inhaltsgenauigkeit und Linkvalidierung
- **Vierteljährliche Updates**: Größere Inhaltsergänzungen und Verbesserungen
- **Halbjährliche Reviews**: Umfassende Umstrukturierung und Erweiterung
- **Jährliche Veröffentlichungen**: Major-Version-Updates mit signifikanten Verbesserungen

### Überwachung und Qualitätssicherung
- **Automatisierte Tests**: Regelmäßige Validierung von Codebeispielen und Links
- **Integration von Community-Feedback**: Regelmäßige Einbindung von Nutzer-Vorschlägen
- **Technologie-Updates**: Ausrichtung an den neuesten Azure-Diensten und azd-Releases
- **Barrierefreiheitsaudits**: Regelmäßige Überprüfungen für inklusive Designprinzipien

## Versionssupport-Richtlinie

### Support für aktuelle Versionen
- **Neueste Major-Version**: Voller Support mit regelmäßigen Updates
- **Vorherige Major-Version**: Sicherheitsupdates und kritische Fehlerbehebungen für 12 Monate
- **Legacy-Versionen**: Nur Community-Support, keine offiziellen Updates

### Migrationsanleitungen
Bei Veröffentlichung von Major-Versionen bieten wir:
- **Migrationsleitfäden**: Schritt-für-Schritt-Übergangsanleitungen
- **Kompatibilitäts-Hinweise**: Details zu Breaking Changes
- **Tool-Unterstützung**: Skripte oder Dienstprogramme zur Unterstützung der Migration
- **Community-Support**: Dedizierte Foren für Migrationsfragen

---

**Navigation**
- **Vorherige Lektion**: [Studienleitfaden](resources/study-guide.md)
- **Nächste Lektion**: Zurück zu [Haupt-README](README.md)

**Bleiben Sie auf dem Laufenden**: Beobachten Sie dieses Repository für Benachrichtigungen über neue Releases und wichtige Updates der Lernmaterialien.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->