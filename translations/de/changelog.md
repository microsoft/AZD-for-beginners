# Changelog - AZD Für Anfänger

## Einführung

Dieses Änderungsprotokoll dokumentiert alle bemerkenswerten Änderungen, Updates und Verbesserungen am AZD Für Anfänger Repository. Wir folgen den Prinzipien der semantischen Versionierung und führen dieses Protokoll, um Nutzern zu helfen, die Änderungen zwischen den Versionen nachzuvollziehen.

## Lernziele

Durch die Durchsicht dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und Inhaltsergänzungen informiert bleiben
- Verbesserungen an bestehender Dokumentation verstehen
- Fehlerbehebungen und Korrekturen zur Sicherstellung der Genauigkeit verfolgen
- Die Entwicklung der Lernmaterialien im Zeitverlauf verfolgen

## Lernergebnisse

Nach der Durchsicht der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und verfügbare Lernressourcen zu identifizieren
- Zu verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernpfad basierend auf den aktuellsten Materialien zu planen
- Feedback und Vorschläge für zukünftige Verbesserungen einzubringen

## Versionsverlauf

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Aktualisierung: Versionsaktualisierung
**Diese Version bestätigt den Kurs erneut gegen `azd` `1.27.1` (Juli 2026, neueste stabile Version) und die aktuelle Vorschau der KI-Agent-Erweiterung `azure.ai.agents` `1.0.0-beta.5` und bringt nach den Versionen 1.26.0, 1.27.0 und 1.27.1 alle "validiert gegen" Banner auf den neuesten Stand.**

#### Geändert
- **✅ Validierungsbasis aktualisiert** von `azd 1.25.6` (Juni 2026) auf `azd 1.27.1` (Juli 2026) in der Haupt-README, allen Kapitel-READMEs, der Lektion Dev-Container in Kapitel 1 (einschließlich festgelegter Beispielversionen), der Lektion Eigene Vorlagen in Kapitel 4, der Lektion Multi-Agent in Kapitel 5 sowie den Workshop-Dokumentationen
- **🤖 Kapitel 2 Basis aktualisiert** von `azd 1.23.12` (März 2026) auf `azd 1.27.1` in `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` und `microsoft-foundry-integration.md`; Validierungshinweis-Daten aktualisiert auf 2026-07-13
- **🧩 KI-Agent-Erweiterung aktualisiert** von `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` auf die aktuelle `1.0.0-beta.5` Version im Kapitel 2 README und `agents.md`
- **🧪 Workshop Validierungsbeispiel** (`azd version` Ausgabe) auf `1.27.1` aktualisiert

#### Hinweise zu relevanten azd-Versionen (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-Unterstützung für Azure Functions auf Flex Consumption, `azd config sub-filter` mandantenbezogene Abonnementfilter, selbständige Erweiterungspakete (`azd x pack --bundle`), und `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellierung von Azure AI Foundry Projekten/Agenten direkt in `azure.yaml` (Bicep- und Terraform-loses Init), Container-Bereitstellungsunterstützung für App Service (`host: appservice` + `language: docker`), direkte `-s/--source` Unterstützung für `azd extension` Befehle, und `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` Flag für `azd extension install`, standardmäßiger Ausschluss veralteter Modelle aus Katalog-/Kontingentabfragen, und mehrere Fehlerbehebungen

#### Aktualisierte Dateien
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Anfänger-Lückenfüllung #2: Vorlagen-Authoring, Dev-Container, Pulumi, Azure DevOps, Dienstprinzipale und Mehr
**Diese Version schließt die verbleibenden mittleren Lücken, die durch die azd-Abdeckungsanalyse aufgezeigt wurden: wie man eigene Vorlagen erstellt und veröffentlicht, reproduzierbare Dev-Container-/Codespaces-Umgebungen, den Pulumi Infrastruktur-Provider, einen Azure DevOps CI/CD Walkthrough, die Authentifizierung mit Dienstprinzipalen, Host-Auswahl-Hinweise (AKS/Spring Apps), Erklärungen zu `azd restore`/`azd package`, Hook-Fehlerbehandlung und Team-/Geteilte-Umgebungspraktiken.**

#### Hinzugefügt
- **🧱 Neue Lektion Kapitel 4** `docs/chapter-04-infrastructure/custom-templates.md` — Eigenes azd-Template erstellen: erforderliche Struktur (`azure.yaml`, `infra/`, `src/`), das Feld `metadata.template`, Infrastruktur-Parametrisierung mit dem Ressourcen-Token `uniqueString()` und dem Tag `azd-env-name`, lokale Tests mit `azd init --template <local-path>`, Veröffentlichung auf GitHub und Einreichung in die Awesome AZD Galerie
- **📦 Neue Lektion Kapitel 1** `docs/chapter-01-foundation/dev-containers.md` — reproduzierbare azd-Umgebungen mit Dev Containers und GitHub Codespaces: eine minimalistische `.devcontainer/devcontainer.json` mit dem offiziellen `ghcr.io/azure/azure-dev/azd` Feature, sprachspezifische Features, `docker-in-docker` für Container-Hosts und `azd auth login --use-device-code` für die Remote-Anmeldung
- **🧩 Pulumi mit azd** Abschnitt in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-Ordnerstruktur, Stacks auf azd-Umgebungen abgebildet, notwendige Outputs/Tagging, und identischer `azd up` / `azd down` Workflow
- **🎯 Host-Auswahl-Hinweise** in `docs/chapter-04-infrastructure/provisioning.md` — eine Anfängerfreundliche Gegenüberstellung von `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` und `springapp` mit Hinweisen, wann AKS oder Azure Spring Apps gewählt werden sollten
- **🛠️ Azure DevOps CI/CD Walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, Serviceverbindung mit Workload Identity Federation (OIDC), die generierte `azure-dev.yml` und Variable-Gruppen Einrichtung
- **🔑 Dienstprinzipale (Muster 4)** hinzugefügt in `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, nicht-interaktives `azd auth login` mit Client-Geheimnis vs. föderierte/OIDC-Anmeldeinformationen, wann zu verwenden, und sichere Speicherung der Anmeldeinformationen
- **🪝 Hook-Fehlerbehandlung** Unterabschnitt in `docs/chapter-04-infrastructure/deployment-guide.md` — Exit-Codes und `set -e`, `continueOnError`, isoliertes Testen von Hooks mit `azd hooks run`, betriebssystemspezifische Shells und `--debug`
- **👥 Team- / Geteilte Umgebungen** Abschnitt in `docs/chapter-03-configuration/configuration.md` — was in `.azure/` liegt, was gitignoriert wird, Entwickler-spezifische Umgebungen, `azd env list`/`select`, und Bereitstellung von Umweltwerten in CI/CD
- **🧰 `azd restore` und erweiterte `azd package`** Erklärungen in `resources/cheat-sheet.md` — Wiederherstellung von Abhängigkeiten und Erzeugung eines deploybaren Artefakts ohne Deployment

#### Geändert
- **🧭 Kapitel 4 Lektionentabelle** aktualisiert, um die neue Lektion "Eigenes Template erstellen" (Lektion 3) einzuschließen
- **🧭 Kapitel 1 Lektionentabelle** aktualisiert, um die neue Lektion "Dev Containers & Codespaces" (Lektion 5) einzuschließen; Navigationsfooter zwischen `bring-your-own-app.md` und `dev-containers.md` verdrahtet

### [v3.21.0] - 2026-06-16

#### Anfänger-Lückenfüllung: Hands-On Multi-Agenten-Lektion, "Bring Your Own App," Terraform und CI/CD Walkthrough
**Diese Version schließt die größten Lücken für einen Komplett-Anfänger-Guide, indem zwei neue praktische Lektionen hinzugefügt werden (ein deploybarer Multi-Agenten-Walkthrough und das Hinzufügen von azd zu einer bestehenden App), eine anfängerfreundliche Einführung zu Hooks, ein Terraform-mit-azd Abschnitt, ein Schritt-für-Schritt GitHub Actions Pipeline Walkthrough, eine Erklärung zu den neuen Vorschau-Erweiterungen sowie eine explizite Checkliste zur Bereitstellungsverifizierung.**

#### Hinzugefügt
- **🤝 Neue Lektion Kapitel 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — eine vollständig praktische, deploybare Zwei-Agenten-Anleitung (Orchestrator + Spezialisten) mit einer echten Vorlage (`contoso-creative-writer`), mit Erklärungen, wann Multi-Agenten zu nutzen sind, dem `azd up` Workflow, Verständnis der bereitgestellten Ressourcen, cross-agent Tracing, Anpassungen und Aufräumen
- **📦 Neue Lektion Kapitel 1** `docs/chapter-01-foundation/bring-your-own-app.md` — wie azd zu einem bestehenden Projekt mit `azd init` hinzugefügt wird ("Code im aktuellen Verzeichnis verwenden"), Verständnis von `azure.yaml` und `infra/`, `azd infra generate`, Host-Erkennung und Bereitstellung mit `azd up`
- **🌐 Terraform mit azd** Abschnitt hinzugefügt in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` Konfiguration, `.tf` Ordnerstruktur, erforderliche `AZURE_*` Outputs und `azd-env-name` Tagging, und identischer `azd up` / `azd down` Workflow (schließt die Lücke, wo Terraform-Unterstützung behauptet, aber nur Bicep gezeigt wurde)
- **⚙️ Schritt-für-Schritt GitHub Actions Walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — vom GitHub-Repo zu automatisierten Deployments: `azd pipeline config`, OIDC-föderierte Anmeldedaten (keine gespeicherten Geheimnisse), die generierte `azure-dev.yml` und Geheimnis-vs.-Variable Hinweise
- **🪝 Anfänger "Neu bei Hooks?" Einführung** in `docs/chapter-04-infrastructure/deployment-guide.md` — was ein Hook ist, eine Hook-Phasen-Tabelle, ein minimaler erster Hook, und manuelles Ausführen von Hooks mit `azd hooks run`
- **✅ "Verifizieren Sie Ihre Bereitstellung" Checkliste** hinzugefügt zu Schritt 5 von `docs/chapter-01-foundation/first-project.md` — Smoke-Test, Gesundheits-Endpoint-Prüfung und explizite Erfolgskriterien
- **🧩 Erklärung zu neuen Vorschau-Erweiterungen** `azure.ai.skills` und `azure.ai.connections` (was sie sind und wann sie genutzt werden) in `docs/chapter-08-production/production-ai-practices.md`

#### Geändert
- **🧭 Kapitel 5 Lektionentabelle** korrigiert: `multi-agent-basics.md` ist jetzt Lektion 1 (die einzige vollständig praktische Lektion), mit ehrlicher Kennzeichnung, dass Lektion 2 in Kapitel 6 liegt und das Einzelhandels-Szenario ein Architekturplan ist, keine Ein-Befehl-Vorlage
- **🧭 Kapitel 1 Lektionentabelle** umfasst nun die neue Lektion "Bring Your Own App" (Lektion 4)
- **🔗 Navigationsfooter** aktualisiert: `first-project.md` verlinkt jetzt vorwärts zu `bring-your-own-app.md`

#### Behoben
- **🧱 Geschlossene "behauptete aber fehlende" Terraform-Lücke**— der Kurs bezog sich zuvor auf Terraform-Unterstützung, ohne dies zu zeigen
- **🔀 Korrigierte irreführende Kapitel 5 Querverweise** die implizierten, dass eine vollständige Multi-Agent-Implementierung existierte, wenn nur ein Architekturplan vorlag

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

#### AZD 1.25.6 Aktualisierung, Vollständige Agenten-Lifecycle-Befehle & Aspire Rebrand

**Diese Version validiert den Kurs erneut mit `azd` `1.25.6` (Juni 2026) und der Erweiterung `azure.ai.agents` `0.1.40-preview`, erweitert die KI-Anleitung vom "Scaffolding eines Agenten" auf den kompletten Agentenlebenszyklus (testen → bewerten → optimieren → prüfen → löschen), stellt die neuen Vorschau-Erweiterungen `azure.ai.skills` und `azure.ai.connections` vor und weist auf das Produkt-Rebranding von ".NET Aspire" zu "Aspire" hin.**

#### Hinzugefügt
- **🔁 Vollständige Abdeckung des Agentenlebenszyklus** für Anfänger und KI-Ingenieure in der gesamten Dokumentation:
  - `docs/chapter-01-foundation/azd-basics.md` — Lebenszyklustabelle (scaffold → test → measure → improve → inspect → clean up) im Abschnitt Erweiterungen und KI-Befehle hinzugefügt
  - `docs/chapter-08-production/production-ai-practices.md` — Neuer Abschnitt "Verwaltung des Agentenlebenszyklus" mit `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force`
  - `resources/cheat-sheet.md` — Erweiterte KI-Agenten-Befehle um `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force`
- **🧩 Neue Vorschau-Erweiterungen** dokumentiert: `azure.ai.skills` (wiederverwendbare Agenten-Fähigkeiten) und `azure.ai.connections` (Foundry-Verbindungen) zur Tabelle der Erweiterungen und zum Spickzettel hinzugefügt
- **⏱️ Anleitung zur Antwortzeit** — `azd ai agent invoke` Beispiele weisen jetzt darauf hin, dass die Gesamtlatenz und die Zeit bis zum ersten Byte ausgegeben werden
- **📌 Versionsbanner** im Stamm-README, das Lernende auf `azd version` und `azd upgrade` hinweist

#### Geändert
- **✅ Validierungs-Baseline aktualisiert** von `azd 1.23.12` (März 2026) zu `azd 1.25.6` (Juni 2026) in allen Kapitel-READMEs und Workshop-Dokumentationen
- **🤖 Kapitel 2 Hinweis zur Erweiterung** aktualisiert von `azure.ai.agents` `0.1.18-preview` zu `0.1.40-preview`
- **🧪 Workshop Validierungsbeispiel** (Ausgabe von `azd version`) auf `1.25.6` aktualisiert
- **🧭 README "Was ist neu in azd heute"** überarbeitet, um den kompletten Agentenlebenszyklus, neue KI-Erweiterungen und jüngste Verbesserungen im Benutzererlebnis hervorzuheben (`azd init` Idempotenz, `azd auth login` Stale-Token-Löschung, `azd tool` Erstanlauf-Aufforderung)
- **📖 Kapitel 2 agents.md (Option 4)** verweist jetzt auf die Lifecycle-Befehle nach der Bereitstellung statt beim `azd up` zu stoppen

#### Behoben
- **🏷️ Produktbenennung** — Aspire-Rebranding-Hinweis hinzugefügt (".NET Aspire" heißt jetzt einfach "Aspire"); azd's Aspire-Unterstützung bleibt unverändert
- **🔎 Live-Freigabevalidierung** mit dem Azure Developer CLI Release-Feed bestätigt: stabile CLI `1.25.6` (2026-06-12) und `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Anfänger-Onboarding-Klärung, Setup-Validierung und finale AZD-Befehlsbereinigung
**Diese Version baut auf der Validierung von AZD 1.23 auf und umfasst eine auf Anfänger ausgerichtete Dokumentationsüberarbeitung: Sie klärt die AZD-erste Authentifizierungsanleitung, fügt lokale Setup-Validierungsskripte hinzu, überprüft zentrale Befehle gegen die Live-AZD-CLI und entfernt die letzten veralteten englischsprachigen Befehlsreferenzen außerhalb des Änderungsprotokolls.**

#### Hinzugefügt
- **🧪 Validierungsskripte für Anfänger-Setup** mit `validate-setup.ps1` und `validate-setup.sh`, damit Lernende vor Kapitel 1 die benötigten Tools bestätigen können
- **✅ Vorab-Setup-Validierungsschritte** im Stamm-README und Kapitel 1 README, damit fehlende Voraussetzungen vor `azd up` erkannt werden

#### Geändert
- **🔐 Anfängerauthentifizierungsanleitung** behandelt jetzt `azd auth login` durchgängig als primären Pfad für AZD-Workflows, während `az login` als optional hervorgehoben wird, sofern Azure CLI Befehle nicht direkt verwendet werden
- **📚 Kapitel 1 Onboarding-Fluss** leitet Lernende nun an, zuerst ihr lokales Setup vor Installation, Authentifizierung und ersten Bereitstellungsschritten zu validieren
- **🛠️ Validator-Meldungen** trennen jetzt klar blockierende Anforderungen von optionalen Azure CLI Warnungen für den nur mit AZD arbeitenden Anfängerpfad
- **📖 Konfigurations-, Troubleshooting- und Beispiel-Dokumente** unterscheiden jetzt zwischen erforderlicher AZD-Authentifizierung und optionaler Azure CLI Anmeldungen, wo vorher beides ohne Kontext dargestellt wurde

#### Behoben
- **📋 Verbleibende englischsprachige Befehlsreferenzen** auf aktuelle AZD-Formen aktualisiert, inklusive `azd config show` im Spickzettel und `azd monitor --overview`, wo die Azure-Portalübersicht gemeint war
- **🧭 Anfängerbehauptungen in Kapitel 1** abgeschwächt, um eine garantierte Fehlerfreiheit oder Rückrollverhalten über alle Vorlagen und Azure-Ressourcen hinweg nicht zu versprechen
- **🔎 Live-CLI-Validierung** bestätigt aktuelle Unterstützung für `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` und `azd down --force --purge`

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

#### AZD 1.23.12 Validierung, Erweiterung der Workshop-Umgebung & Aktualisierung des KI-Modells
**Diese Version führt einen Dokumentations-Validierungs-Durchgang für `azd` `1.23.12` durch, aktualisiert veraltete AZD-Befehlsbeispiele, erneuert die KI-Modellanleitung auf aktuelle Standards und erweitert die Workshop-Anleitungen über GitHub Codespaces hinaus auch auf Dev-Container und lokale Klone.**

#### Hinzugefügt
- **✅ Validierungshinweise in den Kernkapiteln und Workshop-Dokumentationen** machen die getestete AZD-Baseline für Lernende mit neueren oder älteren CLI-Versionen explizit
- **⏱️ Bereitstellungs-Timeout-Anleitung** für lang laufende KI-Anwendungsbereitstellungen mit `azd deploy --timeout 1800`
- **🔎 Erweiterungsinspektion** mit `azd extension show azure.ai.agents` in KI-Workflow-Dokumentationen
- **🌐 Erweiterte Workshop-Umgebungshinweise** zu GitHub Codespaces, Dev-Containern und lokalen Klonen mit MkDocs

#### Geändert
- **📚 Kapitel-Intro-READMEs** weisen jetzt durchgängig auf Validierung mit `azd 1.23.12` in den Kapiteln Foundation, Configuration, Infrastructure, Multi-Agent, Pre-Deployment, Troubleshooting und Production hin
- **🛠️ AZD-Befehlsreferenzen** auf aktuelle Formen in der Dokumentation aktualisiert:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` oder `azd env get-value(s)`, je nach Kontext
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`, wenn eine Application Insights Übersicht gemeint ist
- **🧪 Provision-Vorschau-Beispiele** auf aktuell unterstützte Nutzung vereinfacht wie `azd provision --preview` und `azd provision --preview -e production`
- **🧭 Workshop-Fluss** aktualisiert, damit Lernende die Labs in Codespaces, Dev-Containern oder lokalen Klonen durchführen können, anstatt ausschließlich Codespaces vorauszusetzen
- **🔐 Authentifizierungsanleitung** bevorzugt jetzt `azd auth login` für AZD-Workflows, während `az login` als optional gilt, wenn Azure CLI Befehle direkt genutzt werden

#### Behoben
- **🪟 Windows-Installationsbefehle** im Installationsleitfaden an die aktuelle Groß-/Kleinschreibung von `winget` angepasst
- **🐧 Linux-Installationsanleitung** korrigiert, um nicht unterstützte distributionsspezifische `azd` Paketmanager-Anweisungen zu vermeiden und stattdessen auf Release-Assets zu verweisen, wo passend
- **📦 KI-Modell-Beispiele** von älteren Defaults wie `gpt-35-turbo` und `text-embedding-ada-002` auf aktuelle Beispiele wie `gpt-4.1-mini`, `gpt-4.1` und `text-embedding-3-large` aktualisiert
- **📋 Bereitstellungs- und Diagnosesnippets** korrigiert, um aktuelle Umwelt- und Statusbefehle in Logs, Skripten und Troubleshooting-Schritten zu verwenden
- **⚙️ GitHub Actions Anleitung** von `Azure/setup-azd@v1.0.0` auf `Azure/setup-azd@v2` aktualisiert
- **🤖 MCP/Copilot-Zustimmungshinweise** von `azd mcp consent` auf `azd copilot consent list` geändert

#### Verbessert
- **🧠 KI-Kapitelerklärung** erklärt jetzt besser das vorschauempfindliche Verhalten von `azd ai`, mandantenspezifische Anmeldung, aktuelle Erweiterungsnutzung und aktualisierte Empfehlungen zur Modellauswahl
- **🧪 Workshop-Anweisungen** nutzen jetzt realistischere Versionsbeispiele und klarere Umgebungs-Setup-Sprache für praktische Labs
- **📈 Produktions- und Troubleshooting-Dokumente** sind besser auf aktuelle Monitoring-, Fallback-Modell- und Kostenstufebeispiele abgestimmt

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

#### AZD KI CLI-Befehle, Inhaltsvalidierung & Vorlagenerweiterung
**Diese Version fügt die Befehle `azd ai`, `azd extension` und `azd mcp` in alle KI-bezogenen Kapitel ein, behebt defekte Links und veralteten Code in agents.md, aktualisiert den Spickzettel und erneuert den Abschnitt der Beispielvorlagen mit validierten Beschreibungen und neuen Azure AI AZD-Vorlagen.**

#### Hinzugefügt
- **🤖 AZD KI CLI-Abdeckung** über 7 Dateien (vorher nur in Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Neuer Abschnitt "Erweiterungen und KI-Befehle" mit Einführung zu `azd extension`, `azd ai agent init` und `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` mit Vergleichstabelle (Vorlagen- vs. Manifest-Ansatz)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Unterabschnitte "AZD-Erweiterungen für Foundry" und "Agent-First-Bereitstellung"

  - `docs/chapter-05-multi-agent/README.md` — Quick Start zeigt jetzt sowohl Vorlagen- als auch Manifest-basierte Bereitstellungspfade an
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Abschnitt Bereitstellung enthält jetzt die Option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Unterabschnitt "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Neuer Abschnitt "AI & Extensions Commands" mit `azd extension`, `azd ai agent init`, `azd mcp` und `azd infra generate`
- **📦 Neue AZD AI Beispielvorlagen** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-Chat mit Blazor WebAssembly, Semantic Kernel und Sprachchat-Unterstützung
  - **azure-search-openai-demo-java** — Java RAG-Chat mit Langchain4J und ACA/AKS-Bereitstellungsoptionen
  - **contoso-creative-writer** — Multi-Agenten Kreativ-Schreib-App mit Azure AI Agent Service, Bing Grounding und Prompty
  - **serverless-chat-langchainjs** — Serverless RAG mit Azure Functions + LangChain.js + Cosmos DB mit Ollama lokalem Entwicklungs-Support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-Beschleuniger mit Admin-Portal, Teams-Integration und PostgreSQL/Cosmos DB Optionen
  - **azure-ai-travel-agents** — Multi-Agent MCP Orchestrierungs-Referenzapp mit Servern in .NET, Python, Java und TypeScript
  - **azd-ai-starter** — Minimalistische Azure AI Infrastruktur Bicep Startervorlage
  - **🔗 Tolle AZD AI Galerie Link** — Verweis auf die [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (über 80 Vorlagen)

#### Behoben
- **🔗 agents.md Navigation**: Vorherige/Nächste Links stimmen jetzt mit der Kapitel 2 README Lektionenreihenfolge überein (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md defekte Links**: `production-ai-practices.md` korrigiert zu `../chapter-08-production/production-ai-practices.md` (3 Vorkommen)
- **📦 agents.md veralteter Code**: `opencensus` durch `azure-monitor-opentelemetry` + OpenTelemetry SDK ersetzt
- **🐛 agents.md ungültige API**: `max_tokens` von `create_agent()` zu `create_run()` als `max_completion_tokens` verschoben
- **🔢 agents.md Tokenzählung**: Ungefähre `len//4` Schätzung durch `tiktoken.encoding_for_model()` ersetzt
- **azure-search-openai-demo**: Dienste von "Cognitive Search + App Service" auf "Azure AI Search + Azure Container Apps" korrigiert (Standard-Host geändert Oktober 2024)
- **contoso-chat**: Beschreibung aktualisiert mit Verweis auf Azure AI Foundry + Prompty, entsprechend dem tatsächlichen Repo-Titel und Tech-Stack

#### Entfernt
- **ai-document-processing**: Nicht funktionale Vorlagenreferenz entfernt (Repo nicht öffentlich als AZD Vorlage zugänglich)

#### Verbessert
- **📝 agents.md Übungen**: Übung 1 zeigt jetzt erwartete Ausgabe und `azd monitor` Schritt; Übung 2 beinhaltet kompletten `FunctionTool` Registrierungs-Code; Übung 3 ersetzt vage Anleitungen durch konkrete `prepdocs.py` Befehle
- **📚 agents.md Ressourcen**: Dokumentationslinks zu aktuellen Azure AI Agent Service Dokumenten und Schnellstart aktualisiert
- **📋 agents.md Next Steps Tabelle**: Link zum AI Workshop Labor für vollständige Kapitelabdeckung hinzugefügt

#### Datei-Aktualisierungen
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
**Diese Version verbessert die README.md Kapitelnavigation mit einem erweiterten Tabellenformat.**

#### Geändert
- **Kursübersicht Tabelle**: Mit direkten Link zu Lektionen, Dauerangaben und Komplexitätsbewertungen erweitert
- **Ordnerbereinigung**: Überflüssige alte Ordner entfernt (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linküberprüfung**: Alle 21+ internen Links in der Kursübersicht-Tabelle verifiziert

### [v3.16.0] - 2026-02-05

#### Produktnamensaktualisierungen
**Diese Version aktualisiert Produktverweise auf die aktuelle Microsoft Markenbezeichnung.**

#### Geändert
- **Microsoft Foundry → Microsoft Foundry**: Alle Verweise in Nicht-Übersetzungsdateien aktualisiert
- **Azure AI Agent Service → Foundry Agents**: Servicenamen für aktuelle Markenbezeichnung angepasst

#### Datei-Aktualisierungen
- `README.md` - Hauptseite des Kurses
- `changelog.md` - Versionsverlauf
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Leitfaden zu AI-Agenten
- `examples/README.md` - Beispiele Dokumentation
- `workshop/README.md` - Workshop Startseite
- `workshop/docs/index.md` - Workshop Index
- `workshop/docs/instructions/*.md` - Alle Workshop-Anleitungsdateien

---

### [v3.15.0] - 2026-02-05

#### Umfangreiche Umstrukturierung des Repositorys: Kapitel-basierte Ordnernamen
**Diese Version strukturiert die Dokumentation in dedizierte Kapitelordner für eine klarere Navigation um.**

#### Ordnerumbenennungen
Alte Ordner wurden durch Kapitelnummern-Ordner ersetzt:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Hinzugefügt: `docs/chapter-05-multi-agent/`

#### Datei-Migrationen
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
| Alle Pre-Deployment Dateien | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle Troubleshooting Dateien | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hinzugefügt
- **📚 Kapitel-README Dateien**: README.md in jedem Kapitelordner erstellt mit:
  - Lernziele und Dauerangaben
  - Lektionstabelle mit Beschreibungen
  - Quick Start Befehle
  - Navigation zu anderen Kapiteln

#### Geändert
- **🔗 Alle internen Links aktualisiert**: Über 78 Pfade in allen Dokumentationsdateien angepasst
- **🗺️ Haupt README.md**: Kursübersicht mit neuer Kapitelstruktur aktualisiert
- **📝 examples/README.md**: Querverweise auf Kapitelordner aktualisiert

#### Entfernt
- Alte Ordnerstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Umstrukturierung: Kapitel-Navigation
**Diese Version fügte Kapitel-Navigations-README-Dateien hinzu (durch v3.15.0 ersetzt).**

---

### [v3.13.0] - 2026-02-05

#### Neuer AI-Agenten Leitfaden
**Diese Version fügt einen umfassenden Leitfaden für die Bereitstellung von AI-Agenten mit dem Azure Developer CLI hinzu.**

#### Hinzugefügt
- **🤖 docs/microsoft-foundry/agents.md**: Vollständiger Leitfaden mit:
  - Was AI-Agenten sind und wie sie sich von Chatbots unterscheiden
  - Drei Quick-Start Agenten-Vorlagen (Foundry Agents, Prompty, RAG)
  - Architekturmuster für Agenten (Einzelagent, RAG, Multi-Agent)
  - Werkzeugkonfiguration und Anpassung
  - Überwachung und Metrikverfolgung
  - Kostenaspekte und Optimierung
  - Häufige Fehlerbehebungszenarien
  - Drei praktische Übungen mit Erfolgskriterien

#### Inhaltsstruktur
- **Einführung**: Agenten-Konzepte für Anfänger
- **Quick Start**: Bereitstellung von Agenten mit `azd init --template get-started-with-ai-agents`
- **Architekturmuster**: Visuelle Diagramme der Agentenmuster
- **Konfiguration**: Werkzeugeinrichtung und Umgebungsvariablen
- **Überwachung**: Application Insights Integration
- **Übungen**: Fortschreitendes praktisches Lernen (20-45 Minuten je Übung)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Umgebungs-Update
**Diese Version aktualisiert die Entwicklungscontainer-Konfiguration mit modernen Tools und besseren Voreinstellungen für die AZD Lernerfahrung.**

#### Geändert
- **🐳 Basisimage**: Von `python:3.12-bullseye` auf `python:3.12-bookworm` (neueste Debian-Stable) aktualisiert
- **📛 Container-Name**: Von "Python 3" auf "AZD for Beginners" zur besseren Verständlichkeit umbenannt

#### Hinzugefügt
- **🔧 Neue Dev Container Features**:
  - `azure-cli` mit Bicep-Unterstützung aktiviert
  - `node:20` (LTS-Version für AZD Vorlagen)
  - `github-cli` für Vorlagenverwaltung
  - `docker-in-docker` für Container App Bereitstellungen

- **🔌 Portweiterleitung**: Vorgefertigte Ports für gängige Entwicklungszwecke:
  - 8000 (MkDocs Vorschau)
  - 3000 (Web-Apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Neue VS Code Erweiterungen**:
  - `ms-python.vscode-pylance` - Erweiterte Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions Unterstützung
  - `ms-azuretools.vscode-docker` - Docker Unterstützung
  - `ms-azuretools.vscode-bicep` - Bicep Sprachunterstützung
  - `ms-azure-devtools.azure-resource-groups` - Azure Ressourcenmanagement
  - `yzhang.markdown-all-in-one` - Markdown Bearbeitung
  - `DavidAnson.vscode-markdownlint` - Markdown Linting
  - `bierner.markdown-mermaid` - Mermaid Diagrammunterstützung
  - `redhat.vscode-yaml` - YAML Unterstützung (für azure.yaml)
  - `eamodio.gitlens` - Git Visualisierung
  - `mhutchie.git-graph` - Git-Verlauf

- **⚙️ VS Code Einstellungen**: Standard-Einstellungen für Python-Interpreter, Formatierung beim Speichern und Whitespace-Trimmung hinzugefügt

- **📦 Aktualisierte requirements-dev.txt**:
  - MkDocs Minify Plugin hinzugefügt
  - Pre-Commit für Codequalität hinzugefügt
  - Azure SDK Pakete (azure-identity, azure-mgmt-resource) hinzugefügt

#### Behoben
- **Post-Create Befehl**: Prüft jetzt AZD und Azure CLI Installation beim Containerstart

---

### [v3.11.0] - 2026-02-05

#### README für Anfänger überarbeitet
**Diese Version verbessert die README.md erheblich, um sie für Anfänger zugänglicher zu machen und wichtige Ressourcen für AI-Entwickler hinzuzufügen.**

#### Hinzugefügt
- **🆚 Azure CLI vs AZD Vergleich**: Klare Erklärung, wann welches Tool genutzt werden sollte, mit praktischen Beispielen
- **🌟 Tolle AZD Links**: Direkte Links zur Community-Vorlagengalerie und zu Beitragsressourcen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Über 200 sofort einsatzbereite Vorlagen
  - [Vorlage einreichen](https://github.com/Azure/awesome-azd/issues) - Community Beitrag
- **🎯 Schnellstart Anleitung**: Vereinfachter 3-Schritte Einstieg (Installieren → Anmelden → Bereitstellen)
- **📊 Erfahrungsbasierte Navigationstabelle**: Klare Anleitung, wo basierend auf Entwicklererfahrung zu starten ist

#### Geändert
- **README Aufbau**: Für progressive Offenlegung neu organisiert – wichtige Informationen zuerst
- **Einführungsabschnitt**: Neu formuliert, um "Die Magie von `azd up`" für komplette Anfänger zu erklären
- **Doppelte Inhalte entfernt**: Doppelte Fehlerbehebungssektion entfernt
- **Fehlerbehebungsbefehle**: `azd logs` Verweis korrigiert zu gültigem `azd monitor --logs`

#### Behoben

- **🔐 Authentifizierungsbefehle**: `azd auth login` und `azd auth logout` zum cheat-sheet.md hinzugefügt
- **Ungültige Befehlsreferenzen**: Verbleibende `azd logs` aus dem README-Bereich zur Fehlerbehebung entfernt

#### Hinweise
- **Umfang**: Änderungen angewendet auf das Haupt-README.md und resources/cheat-sheet.md
- **Zielgruppe**: Verbesserungen speziell für Entwickler, die neu bei AZD sind

---

### [v3.10.0] - 2026-02-05

#### Aktualisierung der Azure Developer CLI Befehlsgenauigkeit
**Diese Version korrigiert nicht existierende AZD-Befehle in der gesamten Dokumentation, sodass alle Codebeispiele gültige Azure Developer CLI-Syntax verwenden.**

#### Behoben
- **🔧 Nicht existierende AZD-Befehle entfernt**: Umfassende Prüfung und Korrektur ungültiger Befehle:
  - `azd logs` (existiert nicht) → ersetzt durch `azd monitor --logs` oder Azure CLI Alternativen
  - `azd service` Unterbefehle (existieren nicht) → ersetzt durch `azd show` und Azure CLI
  - `azd infra import/export/validate` (existieren nicht) → entfernt oder durch gültige Alternativen ersetzt
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` Flags (existieren nicht) → entfernt
  - `azd provision --what-if/--rollback` Flags (existieren nicht) → auf `--preview` aktualisiert
  - `azd config validate` (existiert nicht) → ersetzt durch `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existieren nicht) → entfernt

- **📚 Dateien mit Befehlskorrekturen aktualisiert**:
  - `resources/cheat-sheet.md`: Umfassende Überarbeitung der Befehlsreferenz
  - `docs/deployment/deployment-guide.md`: Korrigierte Rücksetz- und Bereitstellungsstrategien
  - `docs/troubleshooting/debugging.md`: Korrigierte Protokollanalyseabschnitte
  - `docs/troubleshooting/common-issues.md`: Aktualisierte Fehlerbehebungsbefehle
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigierter AZD-Debuggingabschnitt
  - `docs/getting-started/azd-basics.md`: Korrigierte Überwachungsbefehle
  - `docs/getting-started/first-project.md`: Aktualisierte Überwachungs- und Debugging-Beispiele
  - `docs/getting-started/installation.md`: Korrigierte Hilfe- und Versionsbeispiele
  - `docs/pre-deployment/application-insights.md`: Korrigierte Protokollansichtsbefehle
  - `docs/pre-deployment/coordination-patterns.md`: Korrigierte Agent-Debugging-Befehle

- **📝 Versionsreferenz aktualisiert**:
  - `docs/getting-started/installation.md`: Fest kodierte Version `1.5.0` zu generischer `1.x.x` mit Link zu Releases geändert

#### Geändert
- **Rollback-Strategien**: Dokumentation aktualisiert, um git-basierte Rollbacks zu verwenden (AZD hat keinen nativen Rollback)
- **Protokollanzeige**: `azd logs` Verweise ersetzt durch `azd monitor --logs`, `azd monitor --live` und Azure CLI Befehle
- **Leistungsabschnitt**: Nicht existierende parallel/incremental Deployment-Flags entfernt und gültige Alternativen bereitgestellt

#### Technische Details
- **Gültige AZD-Befehle**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gültige azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Entfernte Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Hinweise
- **Validierung**: Befehle validiert gegen Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop-Abschluss und Aktualisierung der Dokumentationsqualität
**Diese Version schließt die interaktiven Workshop-Module ab, behebt alle defekten Dokumentationslinks und verbessert die Gesamtqualität der Inhalte für KI-Entwickler, die Microsoft AZD verwenden.**

#### Hinzugefügt
- **📝 CONTRIBUTING.md**: Neues Dokument mit Beitragsrichtlinien mit:
  - Klare Anweisungen für Fehlerberichte und Änderungsvorschläge
  - Dokumentationsstandards für neue Inhalte
  - Richtlinien für Codebeispiele und Commit-Nachrichten
  - Informationen zur Community-Beteiligung

#### Abgeschlossen
- **🎯 Workshop-Modul 7 (Abschluss)**: Vollständig abgeschlossenes Abschlussmodul mit:
  - Umfassende Zusammenfassung der Workshop-Ergebnisse
  - Abschnitt zu erlernten Schlüsselkonzepten zu AZD, Vorlagen und Microsoft Foundry
  - Empfehlungen zur Fortsetzung der Lernreise
  - Workshop-Herausforderungsübungen mit Schwierigkeitsgradbewertung
  - Community-Feedback- und Support-Links

- **📚 Workshop-Modul 3 (Analyse)**: Lernziele aktualisiert mit:
  - Aktivierungsanleitung für GitHub Copilot mit MCP-Servern
  - Verständnis der AZD-Vorlagenordnerstruktur
  - Infrastructure-as-Code (Bicep) Organisationsmuster
  - Praktische Laboranweisungen

- **🔧 Workshop-Modul 6 (Abbau)**: Abgeschlossen mit:
  - Ressourcenbereinigung und Kostenmanagement-Ziele
  - Verwendung von `azd down` für sichere Infrastruktur-Deprovisionierung
  - Anleitungen zur Wiederherstellung von Soft-Gelöschten Cognitive Services
  - Bonus-Erkundungsanregungen für GitHub Copilot und Azure-Portal

#### Behoben
- **🔗 Defekte Linkkorrekturen**: Über 15 defekte interne Dokumentationslinks behoben:
  - `docs/ai-foundry/ai-model-deployment.md`: Pfade zu microsoft-foundry-integration.md korrigiert
  - `docs/troubleshooting/ai-troubleshooting.md`: Pfade zu ai-model-deployment.md und production-ai-practices.md korrigiert
  - `docs/getting-started/first-project.md`: Nicht existierendes cicd-integration.md durch deployment-guide.md ersetzt
  - `examples/retail-scenario.md`: FAQ- und Fehlerbehebungsleitfaden-Pfade korrigiert
  - `examples/container-app/microservices/README.md`: Kursstart- und Bereitstellungsleitfaden-Pfade korrigiert
  - `resources/faq.md` und `resources/glossary.md`: KI-Kapitelreferenzen aktualisiert
  - `course-outline.md`: Instruktorleitfaden- und KI-Workshoptabellen-Labore aktualisiert

- **📅 Workshop-Status-Banner**: Von „In Arbeit“ zu aktivem Workshop-Status mit Datum Februar 2026 geändert

- **🔗 Workshop-Navigation**: Defekte Navigationslinks in workshop README.md behoben, die auf nicht existierenden Ordner lab-1-azd-basics zeigten

#### Geändert
- **Workshop-Präsentation**: Warnung „in Arbeit“ entfernt, Workshop ist nun fertiggestellt und einsatzbereit
- **Navigationskonsistenz**: Sicherstellung der ordnungsgemäßen intermodularen Navigation aller Workshop-Module
- **Lernpfad-Referenzen**: Kapitelquerverweise zur korrekten microsoft-foundry-Pfade aktualisiert

#### Validiert
- ✅ Alle englischen Markdown-Dateien haben gültige interne Links
- ✅ Workshop-Module 0-7 sind vollständig mit Lernzielen
- ✅ Navigation zwischen Kapiteln und Modulen funktioniert korrekt
- ✅ Inhalte sind geeignet für KI-Entwickler, die Microsoft AZD verwenden
- ✅ Einsteigerfreundliche Sprache und Struktur wird durchgehend beibehalten
- ✅ CONTRIBUTING.md bietet klare Anleitung für Community-Beiträger

#### Technische Umsetzung
- **Linkvalidierung**: Automatisiertes PowerShell-Skript prüfte alle .md internen Links
- **Inhaltsüberprüfung**: Manuelle Prüfung der Vollständigkeit und Einsteigerfreundlichkeit des Workshops
- **Navigationssystem**: Einheitliche Kapitel- und Modulnavigationsmuster angewandt

#### Hinweise
- **Umfang**: Änderungen nur auf englische Dokumentation angewendet
- **Übersetzungen**: Übersetzungsordner wurden in dieser Version nicht aktualisiert (automatisierte Übersetzung wird später synchronisiert)
- **Workshop-Dauer**: Vollständiger Workshop bietet nun 3-4 Stunden praktische Lernzeit

---

### [v3.8.0] - 2025-11-19

#### Erweiterte Dokumentation: Überwachung, Sicherheit und Multi-Agent Muster
**Diese Version fügt umfassende Lerneinheiten der Spitzenklasse zu Application Insights Integration, Authentifizierungsmustern und Multi-Agent Koordination für produktive Bereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Application Insights Integrationslehre**: in `docs/pre-deployment/application-insights.md`:
  - AZD-fokussierte Bereitstellung mit automatischer Provisionierung
  - Vollständige Bicep-Vorlagen für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (1.200+ Zeilen)
  - KI/LLM Überwachungsmuster (Microsoft Foundry Models Token-/Kostenverfolgung)
  - 6 Mermaid-Diagramme (Architektur, verteiltes Tracing, Telemetriefluss)
  - 3 praktische Übungen (Alarme, Dashboards, KI-Überwachung)
  - Kusto-Abfragebeispiele und Kostenoptimierungsstrategien
  - Live-Metrik-Streaming und Echtzeit-Debugging
  - 40-50 Minuten Lernzeit mit produktionsreifen Mustern

- **🔐 Authentifizierungs- & Sicherheitsmuster-Lehre**: in `docs/getting-started/authsecurity.md`:
  - 3 Authentifizierungsmuster (Verbindungszeichenfolgen, Key Vault, verwaltete Identität)
  - Vollständige Bicep-Infrastrukturvorlagen für sichere Bereitstellungen
  - Node.js Anwendungscode mit Azure SDK Integration
  - 3 vollständige Übungen (aktivieren verwaltete Identität, benutzerdefinierte Identität, Key Vault-Rotation)
  - Sicherheitsbest Practices und RBAC-Konfigurationen
  - Fehlerbehebungsleitfaden und Kostenanalyse
  - Produktionsreife passwortlose Authentifizierungsmuster

- **🤖 Multi-Agent Koordinationsmuster-Lehre**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequentiell, parallel, hierarchisch, ereignisgesteuert, Konsens)
  - Vollständige Orchestratorservice-Implementierung (Python/Flask, 1.500+ Zeilen)
  - 3 spezialisierte Agentenimplementierungen (Forschung, Autor, Editor)
  - Service Bus Integration zur Nachrichtenwarteschlange
  - Cosmos DB Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme zur Darstellung von Agenteninteraktionen
  - 3 fortgeschrittene Übungen (Timeout-Verwaltung, Wiederhol-Logik, Circuit Breaker)
  - Kostenaufstellung (240-565 $/Monat) mit Optimierungsstrategien
  - Application Insights Integration zur Überwachung

#### Verbesserungen
- **Pre-Deployment Kapitel**: Enthält jetzt umfassende Überwachungs- und Koordinationsmuster
- **Getting Started Kapitel**: Verbesserte professionelle Authentifizierungsmuster
- **Produktionsreife**: Vollständige Abdeckung von Sicherheit bis Observability
- **Kursübersicht**: Aktualisiert zur Referenzierung neuer Lektionen in Kapitel 3 und 6

#### Geändert
- **Lernfortschritt**: Bessere Integration von Sicherheit und Überwachung im Kursverlauf
- **Dokumentationsqualität**: Konsistente Spitzenklasse-Standards (95-97%) in neuen Lektionen
- **Produktionsmuster**: Vollständige End-to-End Abdeckung für Unternehmenseinsätze

#### Verbessert
- **Entwicklererfahrung**: Klarer Pfad von Entwicklung zu Produktionsüberwachung
- **Sicherheitsstandards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Observability**: Vollständige Application Insights Integration mit AZD
- **KI-Arbeitslasten**: Spezialisierte Überwachung für Microsoft Foundry Modelle und Multi-Agent Systeme

#### Validiert
- ✅ Alle Lektionen enthalten vollständigen, funktionierenden Code (keine Ausschnitte)
- ✅ Mermaid-Diagramme für visuelles Lernen (insgesamt 19 in 3 Lektionen)
- ✅ Praktische Übungen mit Verifikationsschritten (insgesamt 9)
- ✅ Produktionsreife Bicep-Vorlagen, bereitgestellt via `azd up`
- ✅ Kostenanalyse und Optimierungsstrategien
- ✅ Fehlerbehebungsleitfäden und Best Practices
- ✅ Wissenstestpunkte mit Verifikationsbefehlen

#### Dokumentationsbewertungsergebnisse
- **docs/pre-deployment/application-insights.md**: - Umfassender Überwachungsleitfaden
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Fortgeschrittene Multi-Agent Architekturen
- **Gesamter neuer Inhalt**: - Konsistent hohe Qualitätsstandards

#### Technische Umsetzung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentifizierung**: Verwaltete Identität + Key Vault + RBAC Muster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Überwachung**: Live-Metriken + Kusto-Abfragen + Alarme + Dashboards
- **Kostenmanagement**: Sampling-Strategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 2025-11-19

#### Verbesserungen der Dokumentationsqualität und neues Microsoft Foundry Models Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Microsoft Foundry Models Bereitstellungsbeispiel mit gpt-4.1 Chat-Schnittstelle hinzu.**

#### Hinzugefügt
- **🤖 Microsoft Foundry Models Chat-Beispiel**: Vollständige gpt-4.1-Bereitstellung mit funktionsfähiger Implementierung in `examples/azure-openai-chat/`:
  - Vollständige Microsoft Foundry Models Infrastruktur (gpt-4.1 Modellbereitstellung)
  - Python-Kommandozeilen-Chat-Schnittstelle mit Gesprächshistorie
  - Key Vault Integration für sichere API-Schlüssel-Speicherung
  - Token-Nutzungsverfolgung und Kostenschätzung
  - Ratenbegrenzung und Fehlerbehandlung
  - Umfassende README mit 35-45 Minuten Bereitstellungsanleitung
  - 11 produktionsreife Dateien (Bicep-Vorlagen, Python-App, Konfiguration)
- **📚 Dokumentationsübungen**: Praktische Übungsaufgaben zum Konfigurationshandbuch hinzugefügt:
  - Übung 1: Multi-Umgebungs-Konfiguration (15 Minuten)
  - Übung 2: Geheimnisverwaltungspraxis (10 Minuten)
  - Klare Erfolgskriterien und Verifikationsschritte
- **✅ Bereitstellungsprüfung**: Verifikationsabschnitt zum Bereitstellungsleitfaden hinzugefügt:
  - Gesundheitsprüfverfahren
  - Erfolgscheckliste
  - Erwartete Ausgaben für alle Bereitstellungsbefehle
  - Schnellreferenz für Fehlerbehebung

#### Verbessert
- **examples/README.md**: Auf A-Qualität (93%) aktualisiert:
  - azure-openai-chat zu allen relevanten Abschnitten hinzugefügt
  - Lokale Beispielsanzahl von 3 auf 4 erhöht
  - In Tabelle der KI-Anwendungsbeispiele aufgenommen
  - In Quick Start für fortgeschrittene Nutzer integriert
  - Zum Microsoft Foundry Templates Abschnitt hinzugefügt
  - Vergleichsmatrix und Technologiefindungsabschnitte aktualisiert
- **Dokumentationsqualität**: Von B+ (87%) → A- (92%) im docs-Ordner verbessert

  - Erwartete Ausgaben zu kritischen Befehlsbeispielen hinzugefügt
  - Verifizierungsschritte für Konfigurationsänderungen aufgenommen
  - Praktisches Lernen mit Übungen erweitert

#### Geändert
- **Lernfortschritt**: Bessere Integration von KI-Beispielen für fortgeschrittene Lernende
- **Dokumentationsstruktur**: Mehr praxisorientierte Übungen mit klaren Ergebnissen
- **Verifizierungsprozess**: Explizite Erfolgskriterien zu wichtigen Workflows hinzugefügt

#### Verbessert
- **Entwicklererfahrung**: Microsoft Foundry Models Bereitstellung dauert jetzt 35-45 Minuten (statt 60-90 bei komplexen Alternativen)
- **Kostenübersicht**: Klare Kostenschätzungen (50-200 $/Monat) für Microsoft Foundry Models Beispiel
- **Lernweg**: KI-Entwickler erhalten klaren Einstiegspunkt mit azure-openai-chat
- **Dokumentationsstandards**: Einheitliche erwartete Ausgaben und Verifizierungsschritte

#### Validiert
- ✅ Microsoft Foundry Models Beispiel voll funktionsfähig mit `azd up`
- ✅ Alle 11 Implementierungsdateien syntaktisch korrekt
- ✅ README-Anleitungen entsprechen der tatsächlichen Bereitstellungserfahrung
- ✅ Dokumentationslinks an über 8 Stellen aktualisiert
- ✅ Index der Beispiele spiegelt 4 lokale Beispiele genau wider
- ✅ Keine doppelten externen Links in Tabellen
- ✅ Alle Navigationsverweise korrekt

#### Technische Umsetzung
- **Microsoft Foundry Models Architektur**: gpt-4.1 + Key Vault + Container Apps Muster
- **Sicherheit**: Managed Identity bereit, Geheimnisse im Key Vault
- **Überwachung**: Integration von Application Insights
- **Kostenmanagement**: Token-Tracking und Nutzungoptimierung
- **Bereitstellung**: Ein einziger `azd up` Befehl für vollständige Einrichtung

### [v3.6.0] - 2025-11-19

#### Größeres Update: Container App Bereitstellungsbeispiele
**Diese Version führt umfassende, produktionsreife Beispielbereitstellungen von Container-Anwendungen unter Verwendung der Azure Developer CLI (AZD) ein, mit vollständiger Dokumentation und Integration in den Lernpfad.**

#### Hinzugefügt
- **🚀 Container-App Beispiele**: Neue lokale Beispiele in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Vollständiger Überblick über containerisierte Bereitstellungen, Schnellstart, Produktion und fortgeschrittene Muster
  - [Einfache Flask-API](../../examples/container-app/simple-flask-api): Einsteigerfreundliche REST-API mit Scale-to-Zero, Health Probes, Monitoring und Fehlerbehebung
  - [Microservices-Architektur](../../examples/container-app/microservices): Produktionsreife Multi-Service-Bereitstellung (API Gateway, Produkt, Bestellung, Benutzer, Benachrichtigung), asynchrone Nachrichten, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary Deployment
- **Best Practices**: Sicherheit, Überwachung, Kostenoptimierung und CI/CD-Anleitungen für containerisierte Workloads
- **Code-Beispiele**: Vollständige `azure.yaml`, Bicep Vorlagen und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- **Tests & Fehlerbehebung**: End-to-End Testszenarien, Überwachungsbefehle, Problemlösungshilfen

#### Geändert
- **README.md**: Aktualisiert, um neue Container-App-Beispiele unter „Lokale Beispiele – Container-Anwendungen“ zu präsentieren und zu verlinken
- **examples/README.md**: Überarbeitet, um Container-App-Beispiele hervorzuheben, Vergleichsmatrix-Einträge hinzuzufügen und Technologie- sowie Architekturverweise zu aktualisieren
- **Kursübersicht & Studienleitfaden**: Aktualisiert, um neue Container-App-Beispiele und Bereitstellungsmuster in relevanten Kapiteln zu referenzieren

#### Validiert
- ✅ Alle neuen Beispiele mit `azd up` bereitstellbar und folgen Best Practices
- ✅ Dokumentationsquerverweise und Navigation aktualisiert
- ✅ Beispiele decken Szenarien von Einsteiger bis Fortgeschrittene ab, einschließlich produktionsreife Microservices

#### Hinweise
- **Umfang**: Nur englische Dokumentation und Beispiele
- **Nächste Schritte**: Erweiterung mit zusätzlichen fortgeschrittenen Container-Mustern und CI/CD-Automatisierung in zukünftigen Versionen

### [v3.5.0] - 2025-11-19

#### Produktumbenennung: Microsoft Foundry
**Diese Version führt eine umfassende Produktnamensänderung von "Microsoft Foundry" zu "Microsoft Foundry" in der gesamten englischen Dokumentation durch und spiegelt somit die offizielle Umbenennung von Microsoft wider.**

#### Geändert
- **🔄 Produktnamen-Update**: Vollständige Umbenennung von „Microsoft Foundry“ zu „Microsoft Foundry“
  - Alle Verweise in der englischen Dokumentation im Ordner `docs/` aktualisiert
  - Ordner umbenannt: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Datei umbenannt: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt 23 Inhaltsverweise über 7 Dokumentationsdateien aktualisiert

- **📁 Änderungen an der Ordnerstruktur**:
  - `docs/ai-foundry/` in `docs/microsoft-foundry/` umbenannt
  - Alle Querverweise aktualisiert, um neue Ordnerstruktur abzubilden
  - Navigationslinks in der gesamten Dokumentation überprüft

- **📄 Datei Umbenennungen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links auf neuen Dateinamen aktualisiert

#### Aktualisierte Dateien
- **Kapiteldokumentation** (7 Dateien):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Navigationslink-Updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamenverweise aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bereits Microsoft Foundry (aus vorherigen Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Verweise aktualisiert (Überblick, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweislinks aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zu nachfolgenden Kapiteln aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Verweise aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Kursstrukturdateien** (2 Dateien):
  - `README.md` - 17 Verweise aktualisiert (Kursübersicht, Kapiteltitel, Vorlagenabschnitt, Community-Insights)
  - `course-outline.md` - 14 Verweise aktualisiert (Überblick, Lernziele, Kapitelressourcen)

#### Validiert
- ✅ Keine restlichen "ai-foundry" Ordnerpfad-Verweise in englischer Dokumentation
- ✅ Keine restlichen „Microsoft Foundry“ Produktnamenverweise in englischer Dokumentation
- ✅ Alle Navigationslinks mit neuer Ordnerstruktur funktionsfähig
- ✅ Datei- und Ordnerumbenennungen erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln validiert

#### Hinweise
- **Umfang**: Änderungen nur auf englische Dokumentation im `docs/` Ordner angewendet
- **Übersetzungen**: Übersetzungsordner (`translations/`) in dieser Version nicht aktualisiert
- **Workshop**: Workshopmaterialien (`workshop/`) in dieser Version nicht aktualisiert
- **Beispiele**: Beispieldateien können weiterhin alte Benennungen enthalten (wird in zukünftigem Update adressiert)
- **Externe Links**: Externe URLs und GitHub-Repository-Verweise bleiben unverändert

#### Migrationsanleitung für Mitwirkende
Wenn Sie lokale Branches oder Dokumentationen mit alter Struktur haben:
1. Ordnerverweise aktualisieren: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dateiverweise aktualisieren: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Produktnamen ersetzen: „Microsoft Foundry“ → „Microsoft Foundry“
4. Alle internen Dokumentationslinks auf Funktion prüfen

---

### [v3.4.0] - 2025-10-24

#### Verbesserungen bei Infrastruktur-Vorschau und Validierung
**Diese Version führt umfassende Unterstützung für die neue Azure Developer CLI Vorschau-Funktion ein und verbessert die Workshop-Benutzererfahrung.**

#### Hinzugefügt
- **🧪 azd provision --preview Feature Dokumentation**: Umfassende Abdeckung der neuen Infrastruktur-Vorschaufunktion
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration im Bereitstellungsleitfaden mit Anwendungsfällen und Vorteilen
  - Integration von Pre-Flight-Checks für sicherere Bereitstellungsvalidierung
  - Aktualisierungen im Einstiegshandbuch mit Sicherheits-first Bereitstellungspraktiken
- **🚧 Workshop Statusbanner**: Professionelles HTML-Banner zur Anzeige des Entwicklungsstandes des Workshops
  - Verlaufsdesign mit Baustellenhinweisen zur klaren Benutzerkommunikation
  - Zeitstempel der letzten Aktualisierung für Transparenz
  - Mobilgerätgerechtes Design für alle Gerätetypen

#### Verbessert
- **Infrastruktursicherheit**: Vorschaufunktion in der gesamten Bereitstellungsdokumentation integriert
- **Vorbereitende Validierung**: Automatisierte Skripte enthalten nun Infrastruktur-Vorschau-Tests
- **Entwickler-Workflow**: Aktualisierte Befehlssequenzen mit Vorschau als empfohlene Praxis
- **Workshop-Erlebnis**: Klare Erwartungen an Benutzer bezüglich Entwicklungsstand des Inhalts gesetzt

#### Geändert
- **Bereitstellungs-Best Practices**: Vorschau-first Workflow jetzt empfehlensert Ansatz
- **Dokumentationsablauf**: Infrastrukturvalidierung wurde früher im Lernprozess platziert
- **Workshop Präsentation**: Professionelle Statuskommunikation mit klarem Entwicklungszeitplan

#### Verbessert
- **Sicherheitsfokus**: Infrastrukturänderungen können vor der Bereitstellung validiert werden
- **Teamzusammenarbeit**: Vorschauergebnisse können zur Überprüfung und Genehmigung geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcenkosten vor der Bereitstellung
- **Risikominderung**: Verminderte Bereitstellungsfehler durch vorausgehende Validierung

#### Technische Umsetzung
- **Multidokumenten-Integration**: Vorschaufunktion in 4 zentralen Dateien dokumentiert
- **Befehlsmuster**: Einheitliche Syntax und Beispiele in der gesamten Dokumentation
- **Best-Practice-Integration**: Vorschau in Validierungsworkflows und Skripten enthalten
- **Visuelle Hinweise**: Klare NEU-Feature-Kennzeichnungen zur besseren Auffindbarkeit

#### Workshop Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Verlaufsgestaltung
- **Benutzererlebnis**: Klarer Entwicklungsstatus verhindert Verwirrung
- **Professionelle Präsentation**: Bewahrt Glaubwürdigkeit des Repositories und setzt Erwartungen
- **Zeitplan-Transparenz**: Zeitstempel der letzten Aktualisierung Oktober 2025 für Verantwortlichkeit

### [v3.3.0] - 2025-09-24

#### Erweiterte Workshop-Materialien und interaktives Lernerlebnis
**Diese Version führt umfassende Workshop-Materialien mit browserbasierten interaktiven Anleitungen und strukturierten Lernpfaden ein.**

#### Hinzugefügt
- **🎥 Interaktiver Workshop-Leitfaden**: Browserbasiertes Workshop-Erlebnis mit MkDocs Vorschaufunktion
- **📝 Strukturierte Workshop-Anleitungen**: 7-stufiger geführter Lernpfad von Entdeckung bis Anpassung
  - 0-Einführung: Workshop-Überblick und Einrichtung
  - 1-Auswahl-KI-Vorlage: Vorlage entdecken und auswählen
  - 2-Validierung-KI-Vorlage: Bereitstellungs- und Validierungsverfahren
  - 3-Dekonstruktion-KI-Vorlage: Architektur der Vorlage verstehen
  - 4-Konfiguration-KI-Vorlage: Konfiguration und Anpassung
  - 5-Anpassung-KI-Vorlage: Fortgeschrittene Modifikationen und Iterationen
  - 6-Aufräumen-Infrastruktur: Bereinigung und Ressourcenmanagement
  - 7-Abschluss: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Werkzeuge**: MkDocs-Konfiguration mit Material-Theme für verbessertes Lernerlebnis
- **🎯 Praxis-Lernpfad**: 3-stufige Methodik (Entdeckung → Bereitstellung → Anpassung)
- **📱 GitHub Codespaces-Integration**: Nahtlose Entwicklungsumgebungseinrichtung

#### Erweitert
- **KI-Workshop-Lab**: Erweiterung um umfassendes 2-3 Stunden strukturiertes Lernerlebnis
- **Workshop-Dokumentation**: Professionelle Präsentation mit Navigation und visuellen Hilfsmitteln
- **Lernfortschritt**: Klare Schritt-für-Schritt Anleitung von Vorlagenauswahl bis Produktionsbereitstellung
- **Entwicklererfahrung**: Integrierte Werkzeuge für optimierte Entwicklungsabläufe

#### Verbessert
- **Barrierefreiheit**: Browserbasierte Oberfläche mit Suche, Kopierfunktion und Theme-Umschaltung
- **Selbstbestimmtes Lernen**: Flexible Workshop-Struktur für verschiedene Lerngeschwindigkeiten
- **Praktische Anwendung**: Realistische KI-Vorlagen Bereitstellungsszenarien
- **Community-Integration**: Discord-Integration für Workshop-Unterstützung und Zusammenarbeit

#### Workshop-Funktionen
- **Eingebaute Suche**: Schnelle Stichwort- und Lektionserkennung
- **Code-Blöcke kopieren**: Hover-to-copy Funktion für alle Code-Beispiele
- **Theme-Umschaltung**: Dunkel-/Hellmodus für unterschiedliche Vorlieben
- **Visuelle Assets**: Screenshots und Diagramme für verbessertes Verständnis
- **Hilfsintegration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Große Navigationsrestrukturierung und kapitelbasiertes Lernsystem
**Diese Version führt eine umfassende kapitelbasierte Lernstruktur mit verbesserter Navigation im gesamten Repository ein.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Gesamten Kurs in 8 progressive Lernkapitel umstrukturiert
  - Kapitel 1: Grundlagen & Schnellstart (⭐ - 30-45 Minuten)
  - Kapitel 2: KI-First Entwicklung (⭐⭐ - 1-2 Stunden)
  - Kapitel 3: Konfiguration & Authentifizierung (⭐⭐ - 45-60 Minuten)
  - Kapitel 4: Infrastruktur als Code & Bereitstellung (⭐⭐⭐ - 1-1,5 Stunden)
  - Kapitel 5: Multi-Agent KI-Lösungen (⭐⭐⭐⭐ - 2-3 Stunden)
  - Kapitel 6: Vorbereitende Validierung & Planung (⭐⭐ - 1 Stunde)
  - Kapitel 7: Fehlerbehebung & Debugging (⭐⭐ - 1-1,5 Stunden)
  - Kapitel 8: Produktions- & Unternehmensmuster (⭐⭐⭐⭐ - 2-3 Stunden)
- **📚 Umfassendes Navigationssystem**: Einheitliche Navigationsheader und -footer in der gesamten Dokumentation
- **🎯 Fortschrittsverfolgung**: Kursabschluss-Checkliste und Lernvalidierungssystem
- **🗺️ Lernpfadführung**: Klare Einstiegspunkte für unterschiedliche Erfahrungsstufen und Ziele
- **🔗 Querverweisnavigation**: Verwandte Kapitel und Voraussetzungen klar verlinkt

#### Erweitert
- **README-Struktur**: Umgewandelt zu einer strukturierten Lernplattform mit kapitelbasierter Organisation
- **Dokumentationsnavigation**: Jede Seite enthält jetzt Kapitelkontext und Fortschrittsanleitung
- **Vorlagenorganisation**: Beispiele und Vorlagen zu passenden Lernkapiteln zugeordnet

- **Ressourcenintegration**: Spickzettel, FAQs und Studienführer verbunden mit relevanten Kapiteln
- **Workshop-Integration**: Praxislabore, die auf mehrere Lernziele der Kapitel abgestimmt sind

#### Geändert
- **Lernfortschritt**: Von linearer Dokumentation zu flexiblem, kapitelbasiertem Lernen gewechselt
- **Konfigurationsplatzierung**: Konfigurationsanleitung als Kapitel 3 neu positioniert für besseren Lernfluss
- **KI-Inhaltsintegration**: Bessere Einbindung KI-spezifischer Inhalte über die gesamte Lernreise hinweg
- **Produktionsinhalte**: Erweitere Muster in Kapitel 8 für Unternehmenskunden konsolidiert

#### Verbessert
- **Benutzererfahrung**: Klare Navigationspfade und Kapitel-Fortschrittsanzeiger
- **Barrierefreiheit**: Konsistente Navigationsmuster für einfacheres Durchlaufen des Kurses
- **Professionelle Präsentation**: Hochschulähnliche Kursstruktur geeignet für akademische und betriebliche Schulungen
- **Lerneffizienz**: Verringerte Zeit zum Finden relevanter Inhalte durch verbesserte Organisation

#### Technische Umsetzung
- **Navigationsüberschriften**: Standardisierte Kapitelnavigation über mehr als 40 Dokumentationsdateien
- **Footer-Navigation**: Konsistente Fortschrittsführung und Kapitelabschlussanzeiger
- **Querverlinkung**: Umfassendes internes Verlinkungssystem für verwandte Konzepte
- **Kapitelzuordnung**: Vorlagen und Beispiele klar mit Lernzielen verknüpft

#### Verbesserung des Studienführers
- **📚 Umfassende Lernziele**: Studienführer umstrukturiert entsprechend des 8-Kapitel-Systems
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Checklisten zur Fertigstellung
- **❓ Bewertungsfragen**: Wissenstestfragen für jedes Kapitel mit professionellem Output
- **🛠️ Praktische Übungen**: Hands-on Aktivitäten mit realen Bereitstellungsszenarien und Fehlerbehebung
- **📊 Fähigkeitsfortschritt**: Klare Steigerung von Grundkonzepten zu Musterlösungen für Unternehmen mit Fokus auf Karriereentwicklung
- **🎓 Zertifizierungsrahmen**: Ergebnisse zur beruflichen Entwicklung und System zur Anerkennung in der Community
- **⏱️ Zeitmanagement**: Strukturierten 10-Wochen-Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 2025-09-17

#### Verbesserte Multi-Agent-KI-Lösungen
**Diese Version verbessert die Multi-Agenten-Einzelhandelslösung mit besserer Agentenbenennung und erweiterter Dokumentation.**

#### Geändert
- **Multi-Agenten-Terminologie**: „Cora agent“ im gesamten Einzelhandel Multi-Agenten-System durch „Customer agent“ ersetzt für klareres Verständnis
- **Agentenarchitektur**: Alle Dokumentationen, ARM-Vorlagen und Codebeispiele auf einheitliche Bezeichnung „Customer agent“ aktualisiert
- **Konfigurationsbeispiele**: Modernisierte Agenten-Konfigurationsmuster mit aktualisierten Namenskonventionen
- **Dokumentationskonsistenz**: Sicherstellung, dass alle Verweise professionelle und beschreibende Agentennamen verwenden

#### Verbessert
- **ARM-Vorlagenpaket**: Retail-multiagent-arm-template mit Customer agent Verweisen aktualisiert
- **Architekturdarstellungen**: Mermaid-Diagramme mit aktualisierter Agentenbenennung erneuert
- **Codebeispiele**: Python-Klassen und Implementierungsbeispiele verwenden jetzt CustomerAgent-Benennung
- **Umgebungsvariablen**: Alle Deployment-Skripte auf CUSTOMER_AGENT_NAME-Konventionen aktualisiert

#### Verbessert
- **Entwicklererlebnis**: Klarere Rollen und Verantwortlichkeiten der Agenten in der Dokumentation
- **Produktionsreife**: Bessere Abstimmung auf Unternehmensbenennungskonventionen
- **Lernmaterialien**: Intuitivere Agentenbenennung für Bildungszwecke
- **Vorlagenbenutzbarkeit**: Vereinfachtes Verständnis von Agentenfunktionen und Bereitstellungsmustern

#### Technische Details
- Aktualisierte Mermaid-Architekturdarstellungen mit CustomerAgent-Verweisen
- CoraAgent-Klassennamen in Python-Beispielen durch CustomerAgent ersetzt
- ARM-Vorlagen-JSON-Konfigurationen auf den Agententyp „customer“ geändert
- Umgebungsvariablen von CORA_AGENT_* auf CUSTOMER_AGENT_* Muster aktualisiert
- Alle Deploy-Befehle und Containerkonfigurationen erneuert

### [v3.0.0] - 2025-09-12

#### Wesentliche Änderungen – Fokus auf KI-Entwickler und Microsoft Foundry-Integration
**Diese Version verwandelt das Repository in eine umfassende, KI-fokussierte Lernressource mit Microsoft Foundry-Integration.**

#### Hinzugefügt
- **🤖 KI-zentrierter Lernpfad**: Vollständige Umstrukturierung mit Priorisierung von KI-Entwicklern und Ingenieuren
- **Leitfaden Microsoft Foundry Integration**: Umfassende Dokumentation zur Verbindung von AZD mit Microsoft Foundry-Diensten
- **KI-Modell-Bereitstellungsmuster**: Ausführliche Anleitung zur Modellauswahl, Konfiguration und Produktionsbereitstellungsstrategien
- **KI-Workshop-Labor**: 2-3-stündiger praxisorientierter Workshop zur Umwandlung von KI-Anwendungen in AZD-deploybare Lösungen
- **Produktions-KI-Best Practices**: Unternehmensgerechte Muster für Skalierung, Überwachung und Sicherung von KI-Workloads
- **KI-spezifischer Troubleshooting-Leitfaden**: Umfassende Fehlerbehebung für Microsoft Foundry-Modelle, Cognitive Services und KI-Bereitstellungsprobleme
- **KI-Vorlagengalerie**: Ausgewählte Sammlung von Microsoft Foundry-Vorlagen mit Komplexitätsbewertungen
- **Workshop-Materialien**: Vollständige Workshop-Struktur mit Praxislaboren und Referenzmaterialien

#### Verbessert
- **README-Struktur**: KI-entwicklerfokussiert mit 45 % Community-Interessen-Daten aus dem Microsoft Foundry Discord
- **Lernpfade**: Spezialisierter KI-Entwicklerpfad neben traditionellen Trassen für Studierende und DevOps-Ingenieure
- **Vorlagenempfehlungen**: Ausgewählte KI-Vorlagen inklusive azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community-Integration**: Erweiterte Discord Community-Unterstützung mit KI-spezifischen Kanälen und Diskussionen

#### Sicherheit & Produktionsfokus
- **Managed Identity-Muster**: KI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Kostenoptimierung**: Tracking der Token-Nutzung und Budgetkontrollen für KI-Workloads
- **Multi-Region-Bereitstellung**: Strategien für globale KI-Anwendungsbereitstellung
- **Leistungsüberwachung**: KI-spezifische Metriken und Application Insights-Integration

#### Dokumentationsqualität
- **Linearer Kursaufbau**: Logischer Fortschritt von Anfänger- zu fortgeschrittenen KI-Bereitstellungsmustern
- **Validierte URLs**: Alle externen Repository-Verweise überprüft und zugänglich
- **Vollständige Referenz**: Alle internen Dokumentationsverlinkungen validiert und funktionsfähig
- **Produktionsbereit**: Unternehmensgerechte Bereitstellungsmuster mit realen Beispielen

### [v2.0.0] - 2025-09-09

#### Wesentliche Änderungen – Repository-Umstrukturierung und professionelle Verbesserung
**Diese Version stellt eine bedeutende Überarbeitung der Repository-Struktur und Präsentation der Inhalte dar.**

#### Hinzugefügt
- **Strukturiertes Lernframework**: Alle Dokumentationsseiten enthalten jetzt Einleitung, Lernziele und Lernergebnisse
- **Navigationssystem**: Hinzufügen von Links zu Vorheriger/Nächster Lektion über alle Dokumentationen für geführten Lernfortschritt
- **Studienführer**: Umfassende study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professionelle Darstellung**: Alle Emoji-Symbole entfernt für verbesserte Zugänglichkeit und professionelles Erscheinungsbild
- **Verbesserte Inhaltsstruktur**: Bessere Organisation und Fluss der Lernmaterialien

#### Geändert
- **Dokumentationsformat**: Einheitliche Struktur mit konsequentem lernfokussiertem Aufbau
- **Navigationsfluss**: Logische Progression durch alle Lernmaterialien implementiert
- **Inhaltspräsentation**: Dekorative Elemente zugunsten klarer, professioneller Formatierung entfernt
- **Linkstruktur**: Alle internen Links zur Unterstützung des neuen Navigationssystems aktualisiert

#### Verbessert
- **Barrierefreiheit**: Emoji-Abhängigkeiten entfernt für bessere Screenreader-Kompatibilität
- **Professioneller Eindruck**: Saubere, akademische Präsentation geeignet für Unternehmenslernen
- **Lernerlebnis**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Inhaltsorganisation**: Besserer logischer Fluss und Verbindung zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Erste Veröffentlichung – Umfassendes AZD-Lernrepository

#### Hinzugefügt
- **Grundstruktur der Dokumentation**
  - Komplettserie von Einstiegshandbüchern
  - Umfassende Bereitstellungs- und Provisionierungsdokumentation
  - Ausführliche Fehlerbehebungsressourcen und Debugging-Anleitungen
  - Validierungstools und -verfahren vor der Bereitstellung

- **Einstiegsmodul**
  - AZD-Grundlagen: Kernkonzepte und Terminologie
  - Installationsanleitung: Plattform-spezifische Einrichtungsschritte
  - Konfigurationsanleitung: Umgebungseinrichtung und Authentifizierung
  - Erste Projektanleitung: Schritt-für-Schritt praxisorientiertes Lernen

- **Modul Bereitstellung und Provisionierung**
  - Bereitstellungsanleitung: Vollständige Workflow-Dokumentation
  - Provisionierungsanleitung: Infrastruktur als Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Architekturmuster für Multiservice-Umgebungen

- **Modul Vorbereitungsvalidierung**
  - Kapazitätsplanung: Validierung der Azure-Ressourcenverfügbarkeit
  - SKU-Auswahl: Umfassende Anleitung zu Service-Tiers
  - Pre-Flight Checks: Automatisierte Validierungsskripte (PowerShell und Bash)
  - Kostenschätzung und Budgetplanungs-Tools

- **Modul Fehlerbehebung**
  - Häufige Probleme: Oft auftretende Fehler und Lösungen
  - Debugging-Anleitung: Systematische Fehlersuchmethodik
  - Fortgeschrittene Diagnoseverfahren und Tools
  - Leistungsüberwachung und Optimierung

- **Ressourcen und Referenzen**
  - Befehlsübersicht: Schnellreferenz für essenzielle Befehle
  - Glossar: Umfassende Terminologie- und Akronymdefinitionen
  - FAQ: Ausführliche Antworten auf häufig gestellte Fragen
  - Externe Ressourcenlinks und Community-Verbindungen

- **Beispiele und Vorlagen**
  - Einfaches Webanwendungsbeispiel
  - Vorlage für statische Website-Bereitstellung
  - Containeranwendungskonfiguration
  - Datenbank-Integrationsmuster
  - Microservices-Architektur-Beispiele
  - Serverless-Funktionsimplementierungen

#### Funktionen
- **Multi-Plattform-Unterstützung**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Mehrere Fähigkeitsstufen**: Inhalte für Studierende bis zu professionellen Entwicklern ausgelegt
- **Praktischer Fokus**: Praxisnahe Beispiele und reale Szenarien
- **Umfassende Abdeckung**: Von Grundkonzepten bis zu fortgeschrittenen Unternehmensmustern
- **Security-First-Ansatz**: Sicherheitsbest Practices integriert durchgehend
- **Kostenoptimierung**: Anleitung zu kosteneffizienten Bereitstellungen und Ressourcenmanagement

#### Dokumentationsqualität
- **Detaillierte Codebeispiele**: Praktische, getestete Codeschnipsel
- **Schritt-für-Schritt-Anleitungen**: Klare, umsetzbare Anweisungen
- **Umfassende Fehlerbehandlung**: Fehlerbehebung für gängige Probleme
- **Integration von Best Practices**: Industriestandards und Empfehlungen
- **Versionskompatibilität**: Aktuell mit neuesten Azure-Diensten und azd-Funktionen

## Geplante zukünftige Verbesserungen

### Version 3.1.0 (Geplant)
#### Erweiterung der KI-Plattform
- **Multi-Modell-Unterstützung**: Integrationsmuster für Hugging Face, Azure Machine Learning und eigene Modelle
- **KI-Agenten-Frameworks**: Vorlagen für LangChain, Semantic Kernel und AutoGen-Bereitstellungen
- **Erweiterte RAG-Muster**: Vektor-Datenbankoptionen jenseits von Azure AI Search (Pinecone, Weaviate etc.)
- **KI-Beobachtbarkeit**: Verbesserte Überwachung der Modellleistung, Token-Nutzung und Antwortqualität

#### Entwicklererlebnis
- **VS Code Erweiterung**: Integrierte AZD + Microsoft Foundry Entwicklungsumgebung
- **GitHub Copilot Integration**: KI-unterstützte AZD-Vorlagenerstellung
- **Interaktive Tutorials**: Praxisorientierte Programmierübungen mit automatischer Validierung für KI-Szenarien
- **Video-Inhalte**: Ergänzende Video-Tutorials für visuelle Lernende mit Fokus auf KI-Bereitstellungen

### Version 4.0.0 (Geplant)
#### Unternehmens-KI-Muster
- **Governance-Rahmenwerk**: KI-Modell-Governance, Compliance und Prüfpfade
- **Multi-Mandanten-KI**: Muster zur Bereitstellung für mehrere Kunden mit isolierten KI-Diensten
- **Edge-KI-Bereitstellung**: Integration mit Azure IoT Edge und Container-Instanzen
- **Hybrid Cloud KI**: Multi-Cloud- und Hybrid-Bereitstellungsmuster für KI-Workloads

#### Erweiterte Funktionen
- **KI-Pipeline-Automatisierung**: MLOps-Integration mit Azure Machine Learning Pipelines
- **Erweiterte Sicherheit**: Zero-Trust-Muster, private Endpunkte und erweiterter Bedrohungsschutz
- **Leistungsoptimierung**: Erweiterte Tuning- und Skalierungsstrategien für hochdurchsatzfähige KI-Anwendungen
- **Globale Verteilung**: Inhaltsbereitstellungs- und Edge-Caching-Muster für KI-Anwendungen

### Version 3.0.0 (Geplant) – Durch aktuellen Release ersetzt
#### Vorgeschlagene Ergänzungen – Jetzt in v3.0.0 implementiert
- ✅ **KI-fokussierte Inhalte**: Umfassende Microsoft Foundry Integration (Abgeschlossen)
- ✅ **Interaktive Tutorials**: Praktisches KI-Workshop-Labor (Abgeschlossen)
- ✅ **Fortgeschrittenes Sicherheitsmodul**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Leistungsoptimierung**: Tuningsstrategien für KI-Workloads (Abgeschlossen)

### Version 2.1.0 (Geplant) – Teilweise in v3.0.0 umgesetzt
#### Kleinere Verbesserungen – Einige im aktuellen Release fertiggestellt
- ✅ **Zusätzliche Beispiele**: KI-fokussierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Erweiterte FAQ**: KI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool-Integration**: Verbesserte Anleitungen für IDE- und Editor-Integrationen
- ✅ **Monitoring-Erweiterung**: KI-spezifische Überwachungs- und Alarmpatterns (Abgeschlossen)

#### Noch geplant für zukünftige Veröffentlichung
- **Mobile-freundliche Dokumentation**: Responsives Design für mobiles Lernen
- **Offline-Zugriff**: Herunterladbare Dokumentationspakete
- **Erweiterte IDE-Integration**: VS Code Erweiterung für AZD + KI-Workflows
- **Community-Dashboard**: Echtzeit-Community-Metriken und Beitragsverfolgung

## Beitrag zum Changelog

### Änderung melden
Wenn Sie zu diesem Repository beitragen, stellen Sie bitte sicher, dass Changelog-Einträge beinhalten:

1. **Versionsnummer**: Nach Semantic Versioning (major.minor.patch)
2. **Datum**: Veröffentlichungs- oder Aktualisierungsdatum im Format JJJJ-MM-TT
3. **Kategorie**: Hinzugefügt, Geändert, Veraltet, Entfernt, Behoben, Sicherheit
4. **Klare Beschreibung**: Prägnante Beschreibung der Änderung
5. **Auswirkungsbewertung**: Wie sich die Änderungen auf bestehende Nutzer auswirken

### Änderungskategorien

#### Hinzugefügt
- Neue Funktionen, Dokumentationsabschnitte oder Fähigkeiten
- Neue Beispiele, Vorlagen oder Lernressourcen
- Zusätzliche Werkzeuge, Skripte oder Dienstprogramme

#### Geändert
- Modifikationen an vorhandener Funktionalität oder Dokumentation
- Aktualisierungen zur Verbesserung von Klarheit oder Genauigkeit
- Umstrukturierung von Inhalten oder Organisation

#### Veraltet
- Funktionen oder Ansätze, die auslaufen
- Dokumentationsabschnitte, die zur Entfernung vorgesehen sind
- Methoden, für die bessere Alternativen bestehen

#### Entfernt
- Funktionen, Dokumentationen oder Beispiele, die nicht mehr relevant sind
- Veraltete Informationen oder ausgeschiedene Ansätze
- Redundante oder konsolidierte Inhalte

#### Behoben
- Korrekturen von Fehlern in Dokumentation oder Code
- Behebung gemeldeter Probleme oder Bugs
- Verbesserungen der Genauigkeit oder Funktionalität


#### Sicherheit
- Sicherheitsbezogene Verbesserungen oder Fehlerbehebungen
- Aktualisierungen der besten Sicherheitspraktiken
- Behebung von Sicherheitslücken

### Richtlinien zur Semantischen Versionierung

#### Hauptversion (X.0.0)
- Breaking Changes, die Benutzeraktionen erfordern
- Wesentliche Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik verändern

#### Nebenversion (X.Y.0)
- Neue Features oder Inhaltserweiterungen
- Verbesserungen, die Abwärtskompatibilität erhalten
- Zusätzliche Beispiele, Werkzeuge oder Ressourcen

#### Patch-Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleinere Verbesserungen am vorhandenen Inhalt
- Klarstellungen und kleine Erweiterungen

## Community-Feedback und Vorschläge

Wir ermutigen aktiv zu Community-Feedback, um diese Lernressource zu verbessern:

### Wie man Feedback gibt
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Issues willkommen)
- **Discord-Diskussionen**: Ideen teilen und mit der Microsoft Foundry Community austauschen
- **Pull Requests**: Direkte Verbesserungen an Inhalten beitragen, insbesondere KI-Vorlagen und Anleitungen
- **Microsoft Foundry Discord**: Teilnahme am #Azure-Kanal für AZD + KI-Diskussionen
- **Community-Foren**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback-Kategorien
- **Genauigkeit der KI-Inhalte**: Korrekturen zu KI-Dienstintegration und Deployment-Informationen
- **Lernerfahrung**: Vorschläge zur Verbesserung des Lernflusses für KI-Entwickler
- **Fehlende KI-Inhalte**: Anfragen für weitere KI-Vorlagen, Muster oder Beispiele
- **Barrierefreiheit**: Verbesserungen für verschiedene Lernbedürfnisse
- **Integration von KI-Werkzeugen**: Vorschläge zur besseren Integration in den KI-Entwicklungsworkflow
- **Produktions-KI-Muster**: Anfragen zu Enterprise-KI-Deployment-Mustern

### Verpflichtung zur Antwort
- **Issue-Antworten**: Innerhalb von 48 Stunden bei gemeldeten Problemen
- **Feature-Anfragen**: Bewertung innerhalb einer Woche
- **Community-Beiträge**: Überprüfung innerhalb einer Woche
- **Sicherheitsfragen**: Sofortige Priorität mit beschleunigter Reaktion

## Wartungsplan

### Regelmäßige Updates
- **Monatliche Überprüfungen**: Inhaltliche Genauigkeit und Linkvalidierung
- **Vierteljährliche Updates**: Wesentliche Inhaltserweiterungen und Verbesserungen
- **Halbjährliche Reviews**: Umfassende Umstrukturierung und Verbesserungen
- **Jährliche Releases**: Hauptversionsupdates mit bedeutenden Verbesserungen

### Überwachung und Qualitätssicherung
- **Automatisierte Tests**: Regelmäßige Validierung von Codebeispielen und Links
- **Integration von Community-Feedback**: Regelmäßige Einbindung von Benutzer-Vorschlägen
- **Technologie-Updates**: Anpassung an die neuesten Azure-Dienste und azd-Releases
- **Barrierefreiheits-Audits**: Regelmäßige Überprüfung auf inklusive Design-Prinzipien

## Versionssupport-Richtlinie

### Unterstützung der aktuellen Version
- **Neueste Hauptversion**: Volle Unterstützung mit regelmäßigen Updates
- **Vorherige Hauptversion**: Sicherheitsupdates und kritische Fehlerbehebungen für 12 Monate
- **Legacy-Versionen**: Nur Community-Support, keine offiziellen Updates

### Migrationsanleitungen
Wenn Hauptversionen veröffentlicht werden, stellen wir bereit:
- **Migrationsguides**: Schritt-für-Schritt-Anleitungen für den Übergang
- **Kompatibilitätsnotizen**: Details zu Breaking Changes
- **Werkzeugunterstützung**: Skripte oder Hilfsmittel zur Unterstützung der Migration
- **Community-Support**: Spezielle Foren für Migrationsfragen

---

**Navigation**
- **Vorherige Lektion**: [Studienführer](resources/study-guide.md)
- **Nächste Lektion**: Zurück zum [Haupt-README](README.md)

**Auf dem Laufenden bleiben**: Beobachten Sie dieses Repository für Benachrichtigungen über neue Versionen und wichtige Updates der Lernmaterialien.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->