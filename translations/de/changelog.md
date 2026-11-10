# Änderungsprotokoll - AZD Für Anfänger

## Einführung

Dieses Änderungsprotokoll dokumentiert alle bemerkenswerten Änderungen, Aktualisierungen und Verbesserungen im AZD Für Anfänger Repository. Wir folgen den Prinzipien des semantischen Versionierens und pflegen dieses Protokoll, um den Nutzern zu helfen, zu verstehen, was sich zwischen den Versionen geändert hat.

## Lernziele

Durch die Durchsicht dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und Inhaltserweiterungen informiert bleiben
- Verbesserungen an bestehender Dokumentation verstehen
- Fehlerkorrekturen nachverfolgen, um Genauigkeit sicherzustellen
- Die Entwicklung der Lernmaterialien im Zeitverlauf verfolgen

## Lernergebnisse

Nach Durchsicht der Änderungsprotokolleinträge werden Sie in der Lage sein:
- Neue Inhalte und verfügbare Ressourcen zum Lernen zu erkennen
- Zu verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernpfad basierend auf den aktuellsten Materialien zu planen
- Feedback und Vorschläge für zukünftige Verbesserungen beizutragen

## Versionsgeschichte

### [v3.24.0]- 2026-11-04

#### Behoben
- Reparatur der englischen Kursnavigation, verschobene Seitenpfade, fehlende Anker und veraltete externe Verweise, einschließlich des Links zu Kapitel 2 im Produktions-KI-Leitfaden.
- Überprüfung der aktuellen Anleitung anhand der veröffentlichten AZD 1.37.2, Agents 1.0.0-beta.23 und Evaluierungen 1.0.0-beta.2. Dokumentation des separaten `azd ai eval` Workflows und der Migration der Optimierungskonfiguration.
- Korrektur nicht unterstützter CLI-Flags, Authentifizierungsgrenzen, Klartext-Umgebungs-/Geheimnisanleitungen, Infrastrukturupdates, Modellkonfiguration und destruktive Wiederherstellungsbeispiele.
- Aktualisierung des Workshops basierend auf dem aktuellen AI Agents Beispiel, einschließlich aktueller Hooks, Konfigurationsinputs, Evaluierungstests, Red-Teaming Einstiegspunkte und Beobachtbarkeit.
- Korrektur von Beispielsimplementierungsansprüchen und Reparatur damit verbundener Anwendungs-/Infrastruktur-/Konfigurationsprobleme. Material zur Einzelhandelsarchitektur wird explizit von einer vollständigen funktionalen Anwendung unterschieden.
- Wiederherstellung der CodeQL Sprachmatrix, Auswahl von Node.js 24 für den Entwicklungscontainer und Anpassung der Setup-Validatoren, damit fehlgeschlagene Versionsbefehle gemeldet werden.

#### Hinzugefügt
- Ein nur auf Englisch verfügbarer Offline-Link-/Ankerprüfer, Regressionstests und ein Dokumentationsworkflow, der den Workshop im strengen Modus baut. Generierte Übersetzungen und übersetzte Bilder sind ausgeschlossen.

#### Validierungsumfang
- Quell-, Syntax-, Konfigurations-, lokales Verhalten- und Netzwerk-Link-Prüfungen stellen keine aktive Azure-Bereitstellbarkeit, Kontingente, RBAC, regionale Modellverfügbarkeit, Abrechnung, Sicherheitskonformität oder Produktionsreife fest.
- Ältere Einträge unten sind historische Aufzeichnungen, keine aktuellen Befehls- oder Releaseanweisungen.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Auffrischung: Versionsaktualität
**Diese Version validiert den Kurs erneut anhand von `azd` `1.27.1` (Juli 2026, neueste stabile Version) und der aktuellen Vorschau-Erweiterung für KI-Agenten `azure.ai.agents` `1.0.0-beta.5` und bringt alle "validiert gegen" Banner auf den neuesten Stand nach den Releases 1.26.0, 1.27.0 und 1.27.1.**

#### Geändert
- **✅ Validierungsgrundlage aktualisiert** von `azd 1.25.6` (Juni 2026) auf `azd 1.27.1` (Juli 2026) im Haupt-README, in allen Kapitel-READMEs, der Lesson für den Dev-Container in Kapitel 1 (inklusive Beispiele mit festgelegten Versionen), der Lesson für benutzerdefinierte Templates in Kapitel 4, der Lesson für Multi-Agenten in Kapitel 5 und in den Workshop-Dokumentationen
- **🤖 Kapitel 2 Basis aktualisiert** von `azd 1.23.12` (März 2026) auf `azd 1.27.1` in `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` und `microsoft-foundry-integration.md`; Validierungs-Hinweis Daten auf 2026-07-13 aktualisiert
- **🧩 KI-Agenten-Erweiterung angehoben** von `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` auf das aktuelle `1.0.0-beta.5`-Release im Kapitel-2-README und `agents.md`
- **🧪 Workshop-Validierungsbeispiel** (`azd version` Ausgabe) auf `1.27.1` aktualisiert

#### Hinweise zu relevanten azd-Releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-Unterstützung für Azure Functions auf Flex Consumption, `azd config sub-filter` Mandanten-Abonnement-Filtern, eigenständige Erweiterungspakete (`azd x pack --bundle`) und `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellierung von Azure AI Foundry Projekten/Agenten direkt in `azure.yaml` (Bicep-freie/Terraform-freie Initialisierung), Container-Bereitstellungsunterstützung für App Service (`host: appservice` + `language: docker`), direkte `-s/--source` für `azd extension` Befehle, und `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies`-Flag für `azd extension install`, veraltete Modelle standardmäßig aus Katalog/Kontingent-Hinweisen ausgeschlossen, und diverse Bugfixes

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

#### Anfänger-Lückenfüllung #2: Template-Erstellung, Dev-Container, Pulumi, Azure DevOps, Service Principals und mehr
**Diese Version schließt die verbleibenden mittleren Lücken, die durch die azd-Abdeckungsanalyse aufgedeckt wurden: wie man sein eigenes Template erstellt und veröffentlicht, reproduzierbare Dev-Container/Codespaces-Umgebungen, den Pulumi-Infrastrukturprovider, einen Azure DevOps CI/CD Durchgang, Service-Principal Authentifizierung, Host-Auswahlhinweise (AKS/Spring Apps), `azd restore`/`azd package` Erklärungen, Hook-Fehlerbehandlung und Team-/Shared-Environment-Praktiken.**

#### Hinzugefügt
- **🧱 Neue Lesson in Kapitel 4** `docs/chapter-04-infrastructure/custom-templates.md` — Erstellung deines eigenen azd-Templates: erforderliche Struktur (`azure.yaml`, `infra/`, `src/`), das `metadata.template` Feld, Parametrisierung der Infrastruktur mit dem `uniqueString()` Ressourcen-Token und `azd-env-name` Tag, lokale Tests mit `azd init --template <local-path>`, Veröffentlichung auf GitHub und Einreichung für die Awesome AZD Galerie
- **📦 Neue Lesson in Kapitel 1** `docs/chapter-01-foundation/dev-containers.md` — reproduzierbare azd-Umgebungen mit Dev Containern und GitHub Codespaces: ein minimales `.devcontainer/devcontainer.json` unter Verwendung der offiziellen `ghcr.io/azure/azure-dev/azd` Funktion, sprachspezifische Features, `docker-in-docker` für Container-Hosts und `azd auth login --use-device-code` für Remote-Anmeldung
- **🧩 Pulumi mit azd** Abschnitt in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi Ordnerstruktur, Stacks, die azd-Umgebungen zugeordnet sind, erforderliche Ausgaben/Tagging und der identische `azd up` / `azd down` Workflow
- **🎯 Host-Auswahlhinweise** in `docs/chapter-04-infrastructure/provisioning.md` — ein anfängerfreundlicher Vergleich von `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` und `springapp` mit Hinweisen, wann man AKS oder Azure Spring Apps wählen sollte
- **🛠️ Azure DevOps CI/CD-Durchgang** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, Service-Verbindung mit Workload Identity Federation (OIDC), das generierte `azure-dev.yml` und Setup der Variablengruppen
- **🔑 Service Principals (Muster 4)** hinzugefügt zu `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, nicht-interaktive `azd auth login` mit Client-Geheimnis vs. föderierten/OIDC-Anmeldeinformationen, wann zu verwenden und sichere Speicherung der Anmeldeinformationen
- **🪝 Hook-Fehlerbehandlung** Unterabschnitt in `docs/chapter-04-infrastructure/deployment-guide.md` — Exit-Codes und `set -e`, `continueOnError`, isoliertes Testen von Hooks mit `azd hooks run`, Betriebssystem-spezifische Shells und `--debug`
- **👥 Team- / Shared-Umgebungen** Abschnitt in `docs/chapter-03-configuration/configuration.md` — was in `.azure/` lebt, was gitignore sein sollte, Entwickler-spezifische Umgebungen, `azd env list`/`select`, und Bereitstellung von Umgebungswerten in CI/CD
- **🧰 `azd restore` und erweiterte `azd package`** Erklärungen in `resources/cheat-sheet.md` — Wiederherstellung von Abhängigkeiten und Erstellung eines deploybaren Artefakts ohne Deployment

#### Geändert
- **🧭 Kapitel 4 Lektionstabelle** aktualisiert, um die neue "Erstellen Deines Eigenen Templates" Lektion (Lektion 3) einzuschließen
- **🧭 Kapitel 1 Lektionstabelle** aktualisiert, um die neue "Dev Container & Codespaces" Lektion (Lektion 5) einzuschließen; Navigationsfooter zwischen `bring-your-own-app.md` und `dev-containers.md` verdrahtet

### [v3.21.0] - 2026-06-16

#### Anfänger-Lückenfüllung: Praktische Multi-Agent-Lektion, "Bring Your Own App", Terraform und CI/CD-Durchgang
**Diese Version schließt die größten Lücken für einen komplett einsteigerfreundlichen Leitfaden durch die Hinzufügung von zwei neuen praktischen Lektionen (ein deploybarer Multi-Agent-Durchgang und das Hinzufügen von azd zu einer bestehenden App), eine anfängerfreundliche Einführung in Hooks, einen Terraform-mit-azd Abschnitt, einen Schritt-für-Schritt GitHub Actions Pipeline-Durchgang, eine Erklärung der neuen Vorschau-Erweiterungen und eine explizite Deployment-Überprüfungs-Checkliste.**

#### Hinzugefügt
- **🤝 Neue Lesson in Kapitel 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — ein vollständig praktischer, deploybarer Zwei-Agenten-Durchgang (Orchestrator + Spezialisten) mit einem echten Template (`contoso-creative-writer`), inklusive wann Multi-Agent zu verwenden ist, den `azd up` Workflow, Verständnis der bereitgestellten Ressourcen, agentenübergreifendes Tracing, Anpassungen und Aufräumen
- **📦 Neue Lesson in Kapitel 1** `docs/chapter-01-foundation/bring-your-own-app.md` — wie man azd zu einem bestehenden Projekt mit `azd init` ("Code im aktuellen Verzeichnis verwenden") hinzufügt, Verständnis von `azure.yaml` und `infra/`, `azd infra generate`, Host-Erkennung und Bereitstellung mit `azd up`
- **🌐 Terraform mit azd** Abschnitt hinzugefügt zu `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` Konfiguration, `.tf` Ordnerstruktur, erforderliche `AZURE_*` Ausgaben und `azd-env-name` Tagging, und der gleiche `azd up` / `azd down` Workflow (schließt die Lücke, in der Terraform-Unterstützung angekündigt wurde, aber nur Bicep gezeigt wurde)
- **⚙️ Schritt-für-Schritt GitHub Actions Durchgang** in `docs/chapter-08-production/production-ai-practices.md` — vom GitHub Repo zu automatischen Deployments: `azd pipeline config`, OIDC föderierte Anmeldeinformationen (keine gespeicherten Geheimnisse), das generierte `azure-dev.yml` und Hinweise zu Geheimnissen vs. Variablen
- **🪝 Anfänger-"Neu bei Hooks?" Einführung** in `docs/chapter-04-infrastructure/deployment-guide.md` — was ein Hook ist, eine Hook-Phasen Tabelle, ein minimaler erster Hook und manuelles Ausführen von Hooks mit `azd hooks run`
- **✅ "Überprüfe Deine Bereitstellung" Checkliste** hinzugefügt zu Schritt 5 von `docs/chapter-01-foundation/first-project.md` — Smoke-Test, Endpunkt-Überprüfung der Gesundheit und explizite Erfolgskriterien
- **🧩 Erklärung der neuen Vorschau-Erweiterungen** `azure.ai.skills` und `azure.ai.connections` (was sie sind und wann man sie nutzt) in `docs/chapter-08-production/production-ai-practices.md`

#### Geändert
- **🧭 Kapitel 5 Lektionstabelle** korrigiert: `multi-agent-basics.md` ist jetzt Lektion 1 (die einzige vollständig praktische Lektion), mit ehrlicher Kennzeichnung, dass Lektion 2 in Kapitel 6 liegt und das Retail-Szenario ein Architektur-Blaupause ist, kein Ein-Befehl-Template
- **🧭 Kapitel 1 Lektionstabelle** jetzt inklusive der neuen "Bring Your Own App" Lektion (Lektion 4)
- **🔗 Navigationsfooter** aktualisiert: `first-project.md` verlinkt nun vorwärts zu `bring-your-own-app.md`

#### Behoben
- **🧱 Geschlossene Terraform-Lücke "angekündigt, aber fehlend"** — der Kurs hatte zuvor Terraform-Unterstützung erwähnt, ohne sie zu zeigen
- **🔀 Korrigierte irreführende Querverweise in Kapitel 5** die suggerierten, dass eine vollständige Multi-Agent-Implementierung existierte, obwohl nur der Architektur-Blueprint vorhanden war

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

#### AZD 1.25.6 Aktualisierung, Vollständige Agenten-Lebenszyklusbefehle & Aspire Rebrand
**Diese Version validiert den Kurs erneut gegen `azd` `1.25.6` (Juni 2026) und die `azure.ai.agents` `0.1.40-preview` Erweiterung, erweitert die KI-Anleitung vom "Agenten erstellen" zum vollständigen Agenten-Lebenszyklus (testen → bewerten → optimieren → inspizieren → löschen), zeigt die neuen Vorschau-Erweiterungen `azure.ai.skills` und `azure.ai.connections` und weist auf das Produkt-Rebranding von ".NET Aspire" zu "Aspire" hin.**

#### Hinzugefügt
- **🔁 Vollständige Abdeckung des Agenten-Lebenszyklus** für Anfänger und KI-Ingenieure in der Dokumentation:
  - `docs/chapter-01-foundation/azd-basics.md` — Lebenszyklustabelle (erstellen → testen → messen → verbessern → inspizieren → aufräumen) hinzugefügt im Abschnitt Erweiterungen und KI-Befehle
  - `docs/chapter-08-production/production-ai-practices.md` — Neuer Abschnitt „Verwaltung des Agenten-Lebenszyklus“ mit `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force`
  - `resources/cheat-sheet.md` — Erweiterte KI-Agenten-Befehle mit `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force`
- **🧩 Neue Vorschau-Erweiterungen** dokumentiert: `azure.ai.skills` (wiederverwendbare Agentenfähigkeiten) und `azure.ai.connections` (Foundry-Verbindungen) der Tabelle der Erweiterungen und Spickzettel hinzugefügt
- **⏱️ Hinweise zur Antwortzeit** — `azd ai agent invoke` Beispiele vermerken jetzt die Ausgabe der Gesamtverzögerung und Zeit bis zum ersten Byte
- **📌 Versionsbanner** im Root-README verweist Lernende auf `azd version` und `azd upgrade`

#### Geändert
- **✅ Validierungsbasis aktualisiert** von `azd 1.23.12` (März 2026) zu `azd 1.25.6` (Juni 2026) in allen Kapitel-READMEs und Workshop-Dokumenten
- **🤖 Erweiterungshinweis Kapitel 2** aktualisiert von `azure.ai.agents` `0.1.18-preview` zu `0.1.40-preview`
- **🧪 Workshop-Validierungsbeispiel** (`azd version` Ausgabe) aktualisiert zu `1.25.6`
- **🧭 README „Was ist neu in azd Heute“** überarbeitet zur Hervorhebung des End-to-End-Agenten-Lebenszyklus, neuer KI-Erweiterungen und aktueller Verbesserungen der Benutzerfreundlichkeit (`azd init` Idempotenz, `azd auth login` Bereinigung abgelaufener Tokens, `azd tool` Erststart-Prompt)
- **📖 Kapitel 2 agents.md (Option 4)** verweist Lernende jetzt auf die Befehle nach der Bereitstellung statt beim `azd up` zu stoppen

#### Behoben
- **🏷️ Produktbenennung** — Hinweis zum Aspire-Rebranding hinzugefügt (".NET Aspire" heißt jetzt einfach „Aspire“); AZDs Aspire-Unterstützung bleibt unverändert
- **🔎 Live-Release-Validierung** bestätigt anhand des Azure Developer CLI Release-Feeds: stabile CLI `1.25.6` (2026-06-12) und `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Klärung für Anfänger-Onboarding, Setup-Validierung & endgültige AZD-Befehlsbereinigung
**Diese Version folgt auf die AZD 1.23 Validierungsrunde mit einem dokumentationsfokussierten Durchgang für Anfänger: Sie klärt die AZD-erst Authentifizierung, fügt lokale Setup-Validierungsskripte hinzu, überprüft wichtige Befehle gegen die Live AZD CLI und entfernt die letzten veralteten englischsprachigen Befehlsreferenzen außerhalb des Changelogs.**

#### Hinzugefügt
- **🧪 Setup-Validierungsskripte für Anfänger** mit `validate-setup.ps1` und `validate-setup.sh` damit Lernende die erforderlichen Tools vor Kapitel 1 bestätigen können
- **✅ Validierungsschritte zur Einrichtung im Voraus** im Root-README und Kapitel 1-README, damit fehlende Voraussetzungen vor `azd up` erkannt werden

#### Geändert
- **🔐 Authentifizierungsanleitung für Anfänger** behandelt nun `azd auth login` konsequent als primären Pfad für AZD-Arbeitsabläufe, mit `az login` als optionalem Hinweis, außer wenn Azure CLI Befehle direkt genutzt werden
- **📚 Kapitel 1 Onboarding-Workflow** verweist Lernende jetzt darauf, ihr lokales Setup vor Installation, Authentifizierung und ersten Bereitstellungsschritten zu validieren
- **🛠️ Validator-Meldungen** trennen jetzt klar blockierende Anforderungen von optionalen Azure CLI-Warnungen für den nur AZD-Anfängerpfad
- **📖 Konfigurations-, Fehlerbehebungs- und Beispiel-Dokumente** unterscheiden jetzt zwischen erforderlicher AZD-Authentifizierung und optionaler Azure CLI-Anmeldung, wo zuvor beides ohne Kontext dargestellt wurde

#### Behoben
- **📋 Verbleibende englischsprachige Befehlsreferenzen** aktualisiert auf aktuelle AZD-Formen, einschließlich `azd config show` im Spickzettel und `azd monitor --overview` dort, wo eine Azure Portal Überblicksanleitung gemeint war
- **🧭 Ansprüche für Anfänger in Kapitel 1** entschärft, um Überversprechen von garantiert fehlerfreiem Verhalten oder Rollback für alle Vorlagen und Azure-Ressourcen zu vermeiden
- **🔎 Live-CLI-Validierung** bestätigt gegen die aktuelle Unterstützung von `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` und `azd down --force --purge`

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

#### AZD 1.23.12 Validierung, Erweiterte Workshop-Umgebung & Aktualisierung des KI-Modells
**Diese Version führt eine Dokumentationsvalidierung gegen `azd` `1.23.12` durch, aktualisiert veraltete AZD-Befehlsbeispiele, aktualisiert KI-Modellhinweise auf aktuelle Standardmodelle und erweitert die Workshop-Anweisungen über GitHub Codespaces hinaus auf Dev Containers und lokale Klone.**

#### Hinzugefügt
- **✅ Validierungshinweise in den Kernkapiteln und Workshop-Dokumenten** um die geprüfte AZD-Basislinie für Lernende mit neueren oder älteren CLI-Versionen explizit zu machen
- **⏱️ Anleitung zur Bereitstellungszeitüberschreitung** bei langlaufenden KI-App-Bereitstellungen mit `azd deploy --timeout 1800`
- **🔎 Schritte zur Erweiterungsprüfung** mit `azd extension show azure.ai.agents` in den KI-Workflow-Dokumenten
- **🌐 Ausgedehntere Workshop-Umgebungsanleitung** für GitHub Codespaces, Dev-Container und lokale Klone mit MkDocs

#### Geändert
- **📚 Kapitel-Intro READMEs** weisen nun konsistent auf die Validierung gegen `azd 1.23.12` in Fundament-, Konfigurations-, Infrastruktur-, Multi-Agent-, Pre-Deployment-, Fehlerbehebungs- und Produktionsabschnitten hin
- **🛠️ AZD-Befehlsreferenzen** in der gesamten Dokumentation auf aktuelle Formen aktualisiert:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` oder `azd env get-value(s)` je nach Kontext
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` wenn eine Übersicht zu Application Insights gemeint ist
- **🧪 Bereitstellungs-Vorschau-Beispiele** vereinfacht auf aktuelle unterstützte Verwendung wie `azd provision --preview` und `azd provision --preview -e production`
- **🧭 Workshop-Ablauf** aktualisiert, sodass Lernende die Labs in Codespaces, einem Dev-Container oder lokalem Klon abschließen können statt nur in Codespaces
- **🔐 Authentifizierungsanleitung** bevorzugt jetzt `azd auth login` für AZD-Arbeitsabläufe, mit `az login` als optional bei direkter Verwendung von Azure CLI Befehlen

#### Behoben
- **🪟 Windows-Installationsbefehle** auf aktuelles `winget` Paket-Casing in der Installationsanleitung normiert
- **🐧 Linux-Installationsanleitung** korrigiert zur Vermeidung von nicht unterstützten distributionsspezifischen `azd` Paketmanageranweisungen, stattdessen wird auf Release-Assets verwiesen, wo passend
- **📦 KI-Modellbeispiele** von älteren Standardwerten wie `gpt-35-turbo` und `text-embedding-ada-002` auf aktuelle Beispiele wie `gpt-4.1-mini`, `gpt-4.1` und `text-embedding-3-large` aktualisiert
- **📋 Bereitstellungs- und Diagnostik-Snippets** korrigiert zur Nutzung aktueller Umwelt- und Statusbefehle in Logs, Skripten und Fehlerbehebunghinweisen
- **⚙️ GitHub Actions-Anleitung** von `Azure/setup-azd@v1.0.0` auf `Azure/setup-azd@v2` aktualisiert
- **🤖 MCP/Copilot-Zustimmungshinweis** von `azd mcp consent` auf `azd copilot consent list` aktualisiert

#### Verbessert
- **🧠 KI-Kapitelleitung** erklärt jetzt besser vorschau-sensitive `azd ai` Verhaltensweisen, mandantenspezifische Anmeldung, aktuelle Erweiterungsnutzung und aktualisierte Empfehlungen zur Modellauslieferung
- **🧪 Workshop-Anleitungen** verwenden realistischere Versionsbeispiele und klarere Umgebungssetup-Sprache für praktische Labs
- **📈 Produktions- und Fehlerbehebungsdokumente** stimmen jetzt besser mit aktuellen Überwachungsbeispielen, Fallback-Modellen und Kostentierstufen überein

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

#### AZD KI CLI-Befehle, Inhaltsvalidierung & Vorlageerweiterung
**Diese Version fügt `azd ai`, `azd extension` und `azd mcp` Befehlsabdeckung in allen KI-bezogenen Kapiteln hinzu, behebt defekte Links und veralteten Code in agents.md, aktualisiert den Spickzettel und überarbeitet den Abschnitt Beispielvorlagen mit validierten Beschreibungen und neuen Azure AI AZD Vorlagen.**

#### Hinzugefügt
- **🤖 AZD KI CLI-Abdeckung** über 7 Dateien (zuvor nur in Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Neuer Abschnitt „Erweiterungen und KI-Befehle“ mit Einführung zu `azd extension`, `azd ai agent init` und `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` mit Vergleichstabelle (Vorlage vs Manifest-Ansatz)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Unterabschnitte „AZD Erweiterungen für Foundry“ und „Agenten-zuerst-Bereitstellung“
  - `docs/chapter-05-multi-agent/README.md` — Schnellstart zeigt jetzt sowohl Vorlage- als auch manifestbasierte Bereitstellungspfade
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bereitstellungsabschnitt beinhaltet jetzt `azd ai agent init` Option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Unterabschnitt „AZD KI-Erweiterungsbefehle für Diagnosen“
  - `resources/cheat-sheet.md` — Neuer Abschnitt „KI- & Erweiterungsbefehle“ mit `azd extension`, `azd ai agent init`, `azd mcp` und `azd infra generate`
- **📦 Neue AZD KI-Beispielvorlagen** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG Chat mit Blazor WebAssembly, Semantic Kernel und Sprachchatunterstützung
  - **azure-search-openai-demo-java** — Java RAG Chat mit Langchain4J und ACA/AKS Bereitstellungsoptionen
  - **contoso-creative-writer** — Multi-Agent Creative Writing App mit Azure AI Agent Service, Bing Grounding und Prompty
  - **serverless-chat-langchainjs** — Serverless RAG mit Azure Functions + LangChain.js + Cosmos DB mit Ollama lokaler Entwicklungssupport
  - **chat-with-your-data-solution-accelerator** — Enterprise-RAG-Beschleuniger mit Admin-Portal, Teams-Integration und PostgreSQL/Cosmos DB-Optionen
  - **azure-ai-travel-agents** — Multi-Agent MCP-Orchestrierungsreferenz-App mit Servern in .NET, Python, Java und TypeScript
  - **azd-ai-starter** — Minimale Azure AI Infrastruktur Bicep Startervorlage
  - **🔗 Awesome AZD AI Gallery link** — Verweis auf die [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (über 80 Vorlagen)

#### Behoben
- **🔗 agents.md Navigation**: Links Vorherige/Nächste stimmen jetzt mit der Reihenfolge der Lektionen im Kapitel-2-README überein (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md fehlerhafte Links**: `production-ai-practices.md` korrigiert zu `../chapter-08-production/production-ai-practices.md` (3 Vorkommen)
- **📦 agents.md veralteter Code**: `opencensus` durch `azure-monitor-opentelemetry` + OpenTelemetry SDK ersetzt
- **🐛 agents.md ungültige API**: `max_tokens` von `create_agent()` zu `create_run()` als `max_completion_tokens` verschoben
- **🔢 agents.md Token-Zählung**: Grobe `len//4` Schätzung durch `tiktoken.encoding_for_model()` ersetzt
- **azure-search-openai-demo**: Dienste von „Cognitive Search + App Service“ auf „Azure AI Search + Azure Container Apps“ korrigiert (Standardhost geändert im Okt 2024)
- **contoso-chat**: Beschreibung aktualisiert mit Bezug auf Azure AI Foundry + Prompty, entsprechend dem tatsächlichen Repo-Titel und Tech-Stack

#### Entfernt
- **ai-document-processing**: Nicht-funktionalen Vorlagenverweis entfernt (Repo nicht öffentlich als AZD Vorlage zugänglich)

#### Verbessert
- **📝 agents.md Übungen**: Übung 1 zeigt jetzt erwartete Ausgabe und `azd monitor` Schritt; Übung 2 enthält vollständigen `FunctionTool` Registrierungscode; Übung 3 ersetzt vage Anweisungen durch konkrete `prepdocs.py` Befehle
- **📚 agents.md Ressourcen**: Dokumentationslinks auf aktuelle Azure AI Agent Service-Dokumente und Schnellstart aktualisiert
- **📋 agents.md Nächste Schritte Tabelle**: AI Workshop Lab Link für vollständige Kapitelabdeckung hinzugefügt

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

#### Kursnavigation Verbesserung
**Diese Version verbessert die README.md Kapitel-Navigation mit einem erweiterten Tabellenformat.**

#### Geändert
- **Kursübersichtstabelle**: Verbessert mit direkten Lektionenlinks, Dauerabschätzungen und Schwierigkeitsbewertung
- **Ordnerbereinigung**: Redundante alte Ordner entfernt (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link-Validierung**: Alle über 21 internen Links in der Kursübersichtstabelle überprüft

### [v3.16.0] - 2026-02-05

#### Produktnamenaktualisierungen
**Diese Version aktualisiert Produktverweise auf aktuelles Microsoft Branding.**

#### Geändert
- **Microsoft Foundry → Microsoft Foundry**: Alle Verweise in Nicht-Übersetzungsdateien aktualisiert
- **Azure AI Agent Service → Foundry Agents**: Dienstname entsprechend aktuellem Branding aktualisiert

#### Aktualisierte Dateien
- `README.md` - Hauptkurs-Startseite
- `changelog.md` - Versionshistorie
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-Agenten-Anleitung
- `examples/README.md` - Beispiele-Dokumentation
- `workshop/README.md` - Workshop-Startseite
- `workshop/docs/index.md` - Workshop-Index
- `workshop/docs/instructions/*.md` - Alle Workshop-Anleitungsdateien

---

### [v3.15.0] - 2026-02-05

#### Wesentliche Repository-Umstrukturierung: Kapitelbasierte Ordnernamen
**Diese Version strukturiert die Dokumentation in dedizierte Kapitelordner für eine klarere Navigation um.**

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
| Alle Pre-Deployment-Dateien | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle Troubleshooting-Dateien | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hinzugefügt
- **📚 Kapitel-README-Dateien**: README.md in jedem Kapitelordner erstellt mit:
  - Lernziele und Dauer
  - Lektionstabelle mit Beschreibungen
  - Schnellstartbefehle
  - Navigation zu anderen Kapiteln

#### Geändert
- **🔗 Alle internen Links aktualisiert**: Über 78 Pfade in allen Dokumentationsdateien angepasst
- **🗺️ Haupt-README.md**: Kursübersicht aktualisiert mit neuer Kapitelstruktur
- **📝 examples/README.md**: Querverweise zu Kapitelordnern aktualisiert

#### Entfernt
- Alte Ordnerstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-Umstrukturierung: Kapitel-Navigation
**Diese Version fügte Kapitel-Navigations-README-Dateien hinzu (durch v3.15.0 ersetzt).**

---

### [v3.13.0] - 2026-02-05

#### Neue AI Agents Anleitung
**Diese Version fügt eine umfassende Anleitung zum Bereitstellen von AI-Agenten mit Azure Developer CLI hinzu.**

#### Hinzugefügt
- **🤖 docs/microsoft-foundry/agents.md**: Vollständige Anleitung mit:
  - Was AI-Agenten sind und wie sie sich von Chatbots unterscheiden
  - Drei Quick-Start Agentenvorlagen (Foundry Agents, Prompty, RAG)
  - Agent Architektur-Muster (einzelner Agent, RAG, Multi-Agent)
  - Werkzeugkonfiguration und Anpassung
  - Überwachung und Metrik-Tracking
  - Kostenüberlegungen und Optimierung
  - Häufige Fehlerbehandlungsszenarien
  - Drei praktische Übungen mit Erfolgskriterien

#### Inhaltsstruktur
- **Einführung**: Agentenkonzepte für Anfänger
- **Schnellstart**: Agenten bereitstellen mit `azd init --template get-started-with-ai-agents`
- **Architekturmuster**: Visuelle Diagramme der Agentenmuster
- **Konfiguration**: Werkzeugeinrichtung und Umgebungsvariablen
- **Überwachung**: Application Insights Integration
- **Übungen**: Progressive praktischen Lerninhalte (je 20-45 Min.)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-Umgebungs-Update
**Diese Version aktualisiert die Konfiguration des Entwicklungscontainers mit modernen Werkzeugen und besseren Voreinstellungen für das AZD Lernerlebnis.**

#### Geändert
- **🐳 Basisimage**: Aktualisiert von `python:3.12-bullseye` zu `python:3.12-bookworm` (neueste Debian stable)
- **📛 Containername**: Umbenannt von „Python 3“ zu „AZD for Beginners“ zur besseren Verständlichkeit

#### Hinzugefügt
- **🔧 Neue Dev Container Funktionen**:
  - `azure-cli` mit aktiviertem Bicep-Support
  - `node:20` (LTS-Version für AZD-Vorlagen)
  - `github-cli` für Vorlagenverwaltung
  - `docker-in-docker` für Container-App-Bereitstellungen

- **🔌 Portweiterleitungen**: Vorgekonfigurierte Ports für gängige Entwicklungszwecke:
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
  - `yzhang.markdown-all-in-one` - Markdown-Bearbeitung
  - `DavidAnson.vscode-markdownlint` - Markdown-Linting
  - `bierner.markdown-mermaid` - Mermaid Diagrammunterstützung
  - `redhat.vscode-yaml` - YAML-Unterstützung (für azure.yaml)
  - `eamodio.gitlens` - Git Visualisierung
  - `mhutchie.git-graph` - Git Historie

- **⚙️ VS Code Einstellungen**: Standard-Einstellungen für Python-Interpreter, Formatieren beim Speichern und Entfernen von Leerzeichen hinzugefügt

- **📦 Aktualisierte requirements-dev.txt**:
  - MkDocs Minify Plugin hinzugefügt
  - Pre-Commit für Codequalität hinzugefügt
  - Azure SDK-Pakete (azure-identity, azure-mgmt-resource) hinzugefügt

#### Behoben
- **Post-Create-Befehl**: Überprüft jetzt bei Containerstart die Installation von AZD und Azure CLI

---

### [v3.11.0] - 2026-02-05

#### Einsteigerfreundliche README-Überarbeitung
**Diese Version verbessert die README.md erheblich, um sie für Anfänger zugänglicher zu machen, und fügt wesentliche Ressourcen für AI-Entwickler hinzu.**

#### Hinzugefügt
- **🆚 Azure CLI vs AZD Vergleich**: Klare Erklärung, wann welches Tool genutzt werden sollte mit praktischen Beispielen
- **🌟 Awesome AZD Links**: Direkte Links zur Community Template Gallery und Beitragsressourcen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Über 200 einsatzbereite Vorlagen
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-Beiträge
- **🎯 Schnellstart-Anleitung**: Vereinfachter dreistufiger Einstieg (Installieren → Anmelden → Bereitstellen)
- **📊 Erfahrungsgestützte Navigationstabelle**: Klare Anleitung, wo Entwickler je nach Erfahrung beginnen sollten

#### Geändert
- **README Struktur**: Für progressive Offenlegung neu organisiert – wichtige Informationen zuerst
- **Einführungsabschnitt**: Neu formuliert, um „Die Magie von `azd up`“ für absolute Anfänger zu erklären
- **Duplizierte Inhalte entfernt**: Doppelte Fehlerbehebungssabschnitte entfernt
- **Fehlerbehebungs-Befehle**: `azd logs` Referenz auf gültigen `azd monitor --logs` korrigiert

#### Behoben
- **🔐 Authentifizierungsbefehle**: `azd auth login` und `azd auth logout` zur cheat-sheet.md hinzugefügt
- **Ungültige Befehlsverweise**: Verbleibende `azd logs` aus README Fehlerbehebungsabteilung entfernt

#### Hinweise
- **Geltungsbereich**: Änderungen auf Haupt-README.md und resources/cheat-sheet.md angewendet
- **Zielgruppe**: Verbesserungen speziell für Entwickler, die neu in AZD sind

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Befehlskorrektur-Update
**Diese Version korrigiert nicht existierende AZD-Befehle in der gesamten Dokumentation, um sicherzustellen, dass alle Codebeispiele gültige Azure Developer CLI Syntax verwenden.**

#### Behoben
- **🔧 Nicht vorhandene AZD-Befehle entfernt**: Umfassende Prüfung und Korrektur ungültiger Befehle:
  - `azd logs` (existiert nicht) → ersetzt durch `azd monitor --logs` oder Azure CLI Alternativen
  - `azd service` Unterbefehle (existieren nicht) → ersetzt durch `azd show` und Azure CLI
  - `azd infra import/export/validate` (existieren nicht) → entfernt oder durch gültige Alternativen ersetzt
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` Flags (existieren nicht) → entfernt
  - `azd provision --what-if/--rollback` Flags (existieren nicht) → aktualisiert zur Nutzung von `--preview`
  - `azd config validate` (existiert nicht) → ersetzt durch `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existieren nicht) → entfernt

- **📚 Mit Befehlsanpassungen aktualisierte Dateien**:
  - `resources/cheat-sheet.md`: Umfassende Überarbeitung der Befehlsreferenz
  - `docs/deployment/deployment-guide.md`: Rollback- und Bereitstellungsstrategien korrigiert
  - `docs/troubleshooting/debugging.md`: Protokollanalyseabschnitte korrigiert
  - `docs/troubleshooting/common-issues.md`: Fehlerbehebungsbefehle aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD Debugging-Sektion korrigiert
  - `docs/getting-started/azd-basics.md`: Korrigierte Überwachungsbefehle
  - `docs/getting-started/first-project.md`: Aktualisierte Überwachungs- und Debugging-Beispiele
  - `docs/getting-started/installation.md`: Fehler bei Hilfe- und Versionsbeispielen behoben
  - `docs/pre-deployment/application-insights.md`: Korrigierte Befehle zur Protokollanzeige
  - `docs/pre-deployment/coordination-patterns.md`: Fehler bei Agent-Debugging-Befehlen behoben

- **📝 Aktualisierte Versionsreferenz**: 
  - `docs/getting-started/installation.md`: Harte Kodierung der `1.5.0`-Version geändert zu generischer `1.x.x` mit Link zu Releases

#### Geändert
- **Rollback-Strategien**: Dokumentation auf Git-basiertes Rollback aktualisiert (AZD hat kein natives Rollback)
- **Protokollanzeige**: `azd logs`-Verweise durch `azd monitor --logs`, `azd monitor --live` und Azure CLI-Befehle ersetzt
- **Performance-Abschnitt**: Nicht existente parallel-/inkrementelle Bereitstellungsflags entfernt, gültige Alternativen bereitgestellt

#### Technische Details
- **Gültige AZD-Befehle**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gültige azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Entfernte Funktionen**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Hinweise
- **Verifikation**: Befehle gegen Azure Developer CLI v1.23.x validiert

---

### [v3.9.0] - 2026-02-05

#### Abschluss des Workshops und Qualitätsverbesserung der Dokumentation
**Diese Version schließt die interaktiven Workshop-Module ab, behebt alle fehlerhaften Dokumentationslinks und verbessert die Gesamtqualität des Inhalts für KI-Entwickler, die Microsoft AZD verwenden.**

#### Hinzugefügt
- **📝 CONTRIBUTING.md**: Neues Dokument mit Beitragsrichtlinien:
  - Klare Anweisungen zum Melden von Problemen und Vorschlagen von Änderungen
  - Dokumentationsstandards für neue Inhalte
  - Richtlinien für Codebeispiele und Commitmeldungen
  - Informationen zur Community-Beteiligung

#### Abgeschlossen
- **🎯 Workshop Modul 7 (Abschluss)**: Vollständig abgeschlossenes Abschlussmodul mit:
  - Umfassender Zusammenfassung der Workshop-Ergebnisse
  - Bereich zu beherrschten Kernkonzepten: AZD, Templates und Microsoft Foundry
  - Empfehlungen zur Fortsetzung der Lernreise
  - Workshop-Herausforderungsübungen mit Schwierigkeitsbewertungen
  - Feedback- und Supportlinks der Community

- **📚 Workshop Modul 3 (Analyse)**: Lernziele aktualisiert mit:
  - Anleitung zur Aktivierung von GitHub Copilot mit MCP-Servern
  - Verständnis der AZD Template-Ordnerstruktur
  - Organisation von Infrastructure-as-Code (Bicep) Mustern
  - Anleitungen für praktische Laborübungen

- **🔧 Workshop Modul 6 (Abbau)**: Abgeschlossen mit:
  - Ziele für Ressourcenbereinigung und Kostenmanagement
  - Verwendung von `azd down` für sichere Infrastruktur-Hebung
  - Anleitung zur Wiederherstellung von softgelöschten Cognitive Services
  - Bonus-Explorationsanregungen für GitHub Copilot und Azure Portal

#### Behoben
- **🔗 Fehlerhafte Linkkorrekturen**: Über 15 fehlerhafte interne Dokumentationslinks behoben:
  - `docs/ai-foundry/ai-model-deployment.md`: Pfade zu microsoft-foundry-integration.md korrigiert
  - `docs/troubleshooting/ai-troubleshooting.md`: Pfade in ai-model-deployment.md und production-ai-practices.md korrigiert
  - `docs/getting-started/first-project.md`: Nicht existierendes cicd-integration.md durch deployment-guide.md ersetzt
  - `examples/retail-scenario.md`: Pfade zu FAQ und Fehlerbehebung korrigiert
  - `examples/container-app/microservices/README.md`: Startseite des Kurses und Deployment-Guide-Pfade korrigiert
  - `resources/faq.md` und `resources/glossary.md`: KI-Kapitelverweise aktualisiert
  - `course-outline.md`: Pfade zur Instructor Guide und AI-Workshop-Laboren korrigiert

- **📅 Workshop Status Banner**: Von "Im Aufbau" auf aktiven Workshop-Status mit Februar 2026 Datum geändert

- **🔗 Workshop Navigation**: Fehlerhafte Navigationslinks in README.md zum nicht existierenden Ordner lab-1-azd-basics behoben

#### Geändert
- **Workshop-Präsentation**: Warnung "im Aufbau" entfernt, Workshop ist nun vollständig und einsatzbereit
- **Navigationskonsistenz**: Sicherstellung, dass alle Workshop-Module ordnungsgemäße Intermodulnavigation besitzen
- **Lernpfadverweise**: Kapitel-Querverweise auf korrekte microsoft-foundry-Pfade aktualisiert

#### Validiert
- ✅ Alle englischen Markdown-Dateien haben gültige interne Links
- ✅ Workshop-Module 0-7 sind mit Lernzielen vollständig
- ✅ Navigation zwischen Kapiteln und Modulen funktioniert korrekt
- ✅ Inhalt ist geeignet für KI-Entwickler, die Microsoft AZD verwenden
- ✅ Anfängerfreundliche Sprache und Struktur durchgehend beibehalten
- ✅ CONTRIBUTING.md bietet klare Anleitungen für Community-Beiträge

#### Technische Umsetzung
- **Link-Validierung**: Automatisches PowerShell-Skript überprüfte alle .md-internen Links
- **Inhaltsprüfung**: Manuelle Überprüfung der Workshop-Vollständigkeit und Anfängerfreundlichkeit
- **Navigationssystem**: Konsistente Navigationsmuster für Kapitel und Module angewandt

#### Hinweise
- **Umfang**: Änderungen nur in englischer Dokumentation angewendet
- **Übersetzungen**: Übersetzungsordner wurden in dieser Version nicht aktualisiert (automatisierte Übersetzung folgt später)
- **Workshopleistung**: Vollständiger Workshop bietet jetzt 3-4 Stunden praxisnahes Lernen

---

### [v3.8.0] - 2025-11-19

#### Fortgeschrittene Dokumentation: Überwachung, Sicherheit und Multi-Agent-Muster
**Diese Version fügt umfassende A-Qualitätslektionen zur Application Insights-Integration, Authentifizierungsmustern und Multi-Agent-Koordination für Produktionsbereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Application Insights Integrationslektion**: in `docs/pre-deployment/application-insights.md`:
  - AZD-orientierte Bereitstellung mit automatischer Bereitstellung
  - Vollständige Bicep-Templates für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (1.200+ Zeilen)
  - AI/LLM-Überwachungsmuster (Microsoft Foundry Models Token-/Kostenverfolgung)
  - 6 Mermaid-Diagramme (Architektur, verteiltes Tracing, Telemetriefluss)
  - 3 praktische Übungen (Alarme, Dashboards, AI-Überwachung)
  - Kusto-Abfragebeispiele und Kostenoptimierungsstrategien
  - Live-Metriken-Streaming und Echtzeit-Debugging
  - 40-50 Minuten Lernzeit mit produktionsreifen Mustern

- **🔐 Authentifizierungs- und Sicherheitsmuster Lektion**: in `docs/getting-started/authsecurity.md`:
  - 3 Authentifizierungsmuster (Verbindungszeichenfolgen, Key Vault, verwaltete Identität)
  - Vollständige Bicep-Infrastruktur-Templates für sichere Bereitstellungen
  - Node.js-Anwendungscode mit Azure SDK-Integration
  - 3 komplette Übungen (aktivieren von verwalteter Identität, benutzerdefinierter Identität, Key Vault Rotation)
  - Sicherheitsbest Practices und RBAC-Konfigurationen
  - Fehlerbehebungsanleitungen und Kostenanalyse
  - Produktionsreife passwortlose Authentifizierungsmuster

- **🤖 Multi-Agent-Koordinationsmuster Lektion**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequentiell, parallel, hierarchisch, ereignisgesteuert, Konsens)
  - Vollständige Orchestrator-Service-Implementierung (Python/Flask, 1.500+ Zeilen)
  - 3 spezialisierte Agentenimplementierungen (Forscher, Schreiber, Redakteur)
  - Service Bus-Integration für Nachrichtenwarteschlangen
  - Cosmos DB Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme zeigen Agenteninteraktionen
  - 3 fortgeschrittene Übungen (Timeout-Verarbeitung, Wiederhollogik, Circuit Breaker)
  - Kostenaufschlüsselung (240-565 USD/Monat) mit Optimierungsstrategien
  - Application Insights Integration für Monitoring

#### Verbessert
- **Kapitel Vorbereitungen**: Enthält jetzt umfassende Überwachungs- und Koordinationsmuster
- **Kapitel Einstieg**: Verbessert mit professionellen Authentifizierungsmustern
- **Produktionsreife**: Umfassende Abdeckung von Sicherheit bis Beobachtbarkeit
- **Kursübersicht**: Aktualisiert mit Verweisen auf neue Lektionen in Kapiteln 3 und 6

#### Geändert
- **Lernfortschritt**: Bessere Integration von Sicherheits- und Überwachungsmustern im gesamten Kurs
- **Dokumentationsqualität**: Konsistente A-Qualität (95-97 %) über neue Lektionen hinweg
- **Produktion Muster**: Vollständige End-to-End-Abdeckung für Enterprise-Bereitstellungen

#### Verbessert
- **Entwicklererfahrung**: Klarer Pfad von Entwicklung bis Produktionsüberwachung
- **Sicherheitsstandards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Beobachtbarkeit**: Vollständige Application Insights-Integration mit AZD
- **AI-Workloads**: Spezialisierte Überwachung für Microsoft Foundry Models und Multi-Agenten-Systeme

#### Validiert
- ✅ Alle Lektionen enthalten vollständigen funktionsfähigen Code (keine Ausschnitte)
- ✅ Mermaid-Diagramme für visuelles Lernen (19 insgesamt in 3 Lektionen)
- ✅ Praktische Übungen mit Verifikationsschritten (9 insgesamt)
- ✅ Produktionsreife Bicep-Templates, bereitgestellt via `azd up`
- ✅ Kostenanalyse und Optimierungsstrategien
- ✅ Fehlerbehebungsanleitungen und beste Praktiken
- ✅ Wissenskontrollpunkte mit Verifikationsbefehlen

#### Dokumentationsbewertungsergebnisse
- **docs/pre-deployment/application-insights.md**: - Umfassender Überwachungsleitfaden
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Fortgeschrittene Multi-Agent-Architekturen
- **Gesamtinhalt Neu**: - Konsequent hohe Qualitätsstandards

#### Technische Umsetzung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentifizierung**: Managed Identity + Key Vault + RBAC-Muster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Überwachung**: Live-Metriken + Kusto-Abfragen + Alarme + Dashboards
- **Kostenmanagement**: Sampling-Strategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 2025-11-19

#### Verbesserte Dokumentationsqualität und neues Microsoft Foundry Models Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Microsoft Foundry Models Bereitstellungsbeispiel mit gpt-4.1 Chat-Oberfläche hinzu.**

#### Hinzugefügt
- **🤖 Microsoft Foundry Models Chat Beispiel**: Vollständige gpt-4.1 Bereitstellung mit funktionierender Implementierung in `examples/azure-openai-chat/`:
  - Komplette Microsoft Foundry Models Infrastruktur (gpt-4.1 Modellbereitstellung)
  - Python-Kommandozeilen-Chatinterface mit Gesprächsverlauf
  - Key Vault Integration zur sicheren API-Schlüssel-Speicherung
  - Tokenverfolgung und Kostenschätzung
  - Ratenbegrenzung und Fehlerbehandlung
  - Umfassende README mit 35-45-minütiger Bereitstellungsanleitung
  - 11 produktionsreife Dateien (Bicep-Templates, Python-App, Konfiguration)
- **📚 Dokumentationsübungen**: Hands-On-Übungen zum Konfigurationsleitfaden hinzugefügt:
  - Übung 1: Multi-Umgebungs-Konfiguration (15 Minuten)
  - Übung 2: Geheimnisverwaltungspraxis (10 Minuten)
  - Klare Erfolgskriterien und Verifikationsschritte
- **✅ Verifikation der Bereitstellungen**: Verifikationsabschnitt im Bereitstellungsleitfaden hinzugefügt:
  - Gesundheitsprüfverfahren
  - Erfolgskriterien-Checkliste
  - Erwartete Ausgaben aller Bereitstellungsbefehle
  - Schnelle Referenz zur Fehlerbehebung

#### Verbesserte
- **examples/README.md**: Auf A-Qualität (93 %) aktualisiert:
  - azure-openai-chat zu allen relevanten Abschnitten hinzugefügt
  - Anzahl lokaler Beispiele von 3 auf 4 erhöht
  - In AI Application Examples Tabelle aufgenommen
  - In Quick Start für fortgeschrittene Benutzer integriert
  - Zum Abschnitt Microsoft Foundry Templates hinzugefügt
  - Vergleichsmatrix und Abschnitte zur Technologieerkennung aktualisiert
- **Dokumentationsqualität**: Verbessert von B+ (87 %) auf A- (92 %) im docs-Ordner:
  - Erwartete Ausgaben zu kritischen Befehlsbeispielen hinzugefügt
  - Verifikationsschritte für Konfigurationsänderungen eingeschlossen
  - Verbesserte praktische Übungen für Hands-On-Lernen

#### Geändert
- **Lernfortschritt**: Bessere Integration von KI-Beispielen für fortgeschrittene Lernende
- **Dokumentationsstruktur**: Mehr umsetzbare Übungen mit klaren Ergebnissen
- **Verifikationsprozess**: Explizite Erfolgskriterien zu wichtigen Abläufen hinzugefügt

#### Verbessert
- **Entwicklererfahrung**: Microsoft Foundry Models Bereitstellung dauert jetzt 35-45 Minuten (statt 60-90 bei komplexen Alternativen)
- **Kosten-Transparenz**: Klare Kostenschätzungen (50-200 USD/Monat) für Microsoft Foundry Models Beispiel
- **Lernpfad**: KI-Entwickler haben klaren Einstiegspunkt mit azure-openai-chat
- **Dokumentationsstandards**: Konsistente erwartete Ausgaben und Verifikationsschritte

#### Validiert
- ✅ Microsoft Foundry Models Beispiel voll funktionsfähig mit `azd up`
- ✅ Alle 11 Implementierungsdateien syntaktisch korrekt
- ✅ README-Anweisungen entsprechen tatsächlicher Bereitstellungserfahrung
- ✅ Dokumentationslinks an 8+ Stellen aktualisiert
- ✅ Beispieleindex spiegelt 4 lokale Beispiele genau wider
- ✅ Keine doppelten externen Links in Tabellen
- ✅ Alle Navigationsverweise korrekt

#### Technische Umsetzung
- **Microsoft Foundry Models Architektur**: gpt-4.1 + Key Vault + Container Apps Muster
- **Sicherheit**: Bereit für Managed Identity, Geheimnisse im Key Vault
- **Überwachung**: Application Insights Integration
- **Kostenmanagement**: Tokenverfolgung und Nutzungsoptimierung
- **Bereitstellung**: Ein einziger `azd up`-Befehl für komplette Einrichtung

### [v3.6.0] - 2025-11-19

#### Großes Update: Container App Bereitstellungsbeispiele
**Diese Version führt umfassende, produktionsreife Beispiele zur Bereitstellung von Container-Anwendungen mit Azure Developer CLI (AZD) ein, inklusive vollständiger Dokumentation und Integration in den Lernpfad.**

#### Hinzugefügt
- **🚀 Container App Beispiele**: Neue lokale Beispiele in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplette Übersicht über containerisierte Deployments, Schnellstart, Produktion und erweiterte Muster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Anfängerfreundliche REST-API mit Scale-to-Zero, Gesundheitsprüfungen, Monitoring und Fehlerbehebung
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsbereites Multi-Service-Deployment (API-Gateway, Produkt, Bestellung, Benutzer, Benachrichtigung), asynchrones Messaging, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary Deployment
- **Best Practices**: Sicherheit, Monitoring, Kostenoptimierung und CI/CD-Richtlinien für containerisierte Workloads
- **Code Samples**: Vollständige `azure.yaml`, Bicep-Vorlagen und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-End-Test-Szenarien, Monitoring-Befehle, Anleitung zur Fehlerbehebung

#### Geändert
- **README.md**: Aktualisiert, um neue Container-App-Beispiele unter „Lokale Beispiele – Container-Anwendungen“ hervorzuheben und zu verlinken
- **examples/README.md**: Aktualisiert, um Container-App-Beispiele hervorzuheben, Vergleichsmatrixeinträge hinzuzufügen und Technologie-/Architekturreferenzen zu aktualisieren
- **Kursübersicht & Studienführer**: Aktualisiert, um neue Container-App-Beispiele und Deployment-Muster in relevanten Kapiteln zu referenzieren

#### Validiert
- ✅ Alle neuen Beispiele mit `azd up` bereitstellbar und folgen den Best Practices
- ✅ Querverweise in der Dokumentation und Navigation aktualisiert
- ✅ Beispiele decken Anfänger- bis Fortgeschrittenenszenarien ab, einschließlich Produktions-Microservices

#### Hinweise
- **Umfang**: Nur englische Dokumentation und Beispiele
- **Nächste Schritte**: Erweiterung um zusätzliche erweiterte Container-Muster und CI/CD-Automatisierung in zukünftigen Versionen

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Diese Version implementiert eine umfassende Umbenennung des Produkts von „Microsoft Foundry“ zu „Microsoft Foundry“ in der gesamten englischen Dokumentation und spiegelt Microsofts offizielles Rebranding wider.**

#### Geändert
- **🔄 Produktnamensänderung**: Vollständiges Rebranding von „Microsoft Foundry“ zu „Microsoft Foundry“
  - Alle Verweise in der englischen Dokumentation im Ordner `docs/` aktualisiert
  - Umbenennung des Ordners: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Umbenennung der Datei: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt: 23 Inhaltsverweise in 7 Dokumentationsdateien aktualisiert

- **📁 Änderungen der Ordnerstruktur**:
  - `docs/ai-foundry/` umbenannt in `docs/microsoft-foundry/`
  - Alle Querverweise an die neue Ordnerstruktur angepasst
  - Navigationslinks in der gesamten Dokumentation validiert

- **📄 Dateiumbenennungen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links an den neuen Dateinamen angepasst

#### Aktualisierte Dateien
- **Kapitel-Dokumentationen** (7 Dateien):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Navigationslink-Updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamensverweise aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bereits Microsoft Foundry verwendend (aus vorherigen Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Verweise aktualisiert (Übersicht, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweise aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zum nächsten Kapitel aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Verweise aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Kursstruktur-Dateien** (2 Dateien):
  - `README.md` - 17 Verweise aktualisiert (Kursübersicht, Kapiteltitel, Vorlagenabschnitt, Community-Insights)
  - `course-outline.md` - 14 Verweise aktualisiert (Übersicht, Lernziele, Kapitelressourcen)

#### Validiert
- ✅ Keine verbleibenden „ai-foundry“-Ordnerpfadverweise in den englischen Dokumenten
- ✅ Keine verbleibenden „Microsoft Foundry“-Produktnamensverweise in den englischen Docs
- ✅ Alle Navigationslinks funktionieren mit der neuen Ordnerstruktur
- ✅ Datei- und Ordnerumbenennung erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln validiert

#### Hinweise
- **Umfang**: Änderungen nur im englischen Dokumentationsordner `docs/`
- **Übersetzungen**: Übersetzungsordner (`translations/`) in dieser Version nicht aktualisiert
- **Workshop**: Workshop-Materialien (`workshop/`) in dieser Version nicht aktualisiert
- **Beispiele**: Beispiel-Dateien könnten noch alte Benennungen enthalten (wird in Zukunft behoben)
- **Externe Links**: Externe URLs und GitHub-Repository-Verweise bleiben unverändert

#### Migrationsanleitung für Mitwirkende
Wenn Sie lokale Branches oder Dokumentation mit der alten Struktur haben:
1. Ordnerverweise aktualisieren: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Datei-Verweise aktualisieren: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Produktnamen ersetzen: „Microsoft Foundry“ → „Microsoft Foundry“
4. Alle internen Dokumentationslinks auf ihre Funktion überprüfen

---

### [v3.4.0] - 2025-10-24

#### Verbesserungen bei Infrastruktur-Preview und Validierung
**Diese Version führt umfassende Unterstützung für das neue Azure Developer CLI-Preview-Feature ein und verbessert das Benutzererlebnis im Workshop.**

#### Hinzugefügt
- **🧪 azd provision --preview Feature-Dokumentation**: Umfassende Abdeckung der neuen Infrastruktur-Preview-Funktionalität
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration in das Bereitstellungs-Handbuch mit Anwendungsfällen und Vorteilen
  - Pre-Flight-Check-Integration für sicherere Bereitstellungsvalidierung
  - Updates für Einstiegshilfen mit sicherheitsorientierten Deployment-Praktiken
- **🚧 Workshop-Statusbanner**: Professionelles HTML-Banner zur Anzeige des Workshop-Entwicklungsstatus
  - Verlauf-Design mit Bauanzeige für klare Nutzerkommunikation
  - Zeitstempel des letzten Updates für Transparenz
  - Mobile Responsive Design für alle Gerätetypen

#### Verbesserungen
- **Infrastruktur-Sicherheit**: Preview-Funktionalität durchgehend in Bereitstellungsdokumentation integriert
- **Pre-Deployment-Validierung**: Automatisierte Skripte umfassen nun Infrastruktur-Preview-Tests
- **Entwickler-Workflow**: Aktualisierte Befehlssequenzen inkludieren Preview als Best Practice
- **Workshop-Erlebnis**: Klare Statuskommunikation für Nutzer bezüglich Inhaltsentwicklungsstand

#### Geändert
- **Best Practices bei Deployments**: Preview-First-Workflow jetzt empfohlene Methode
- **Dokumentationsfluss**: Infrastrukturvalidierung wurde an einen früheren Punkt im Lernprozess verschoben
- **Workshop-Präsentation**: Professionelle Statuskommunikation mit klarer Entwicklungszeitachse

#### Verbessert
- **Safety-First-Ansatz**: Infrastrukturänderungen können jetzt vor dem Deployment validiert werden
- **Teamzusammenarbeit**: Preview-Ergebnisse können zur Überprüfung und Genehmigung geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcen-Kosten vor der Bereitstellung
- **Risiko-Minimierung**: Verminderte Deployment-Fehler durch Vorabvalidierung

#### Technische Umsetzung
- **Multi-Dokumenten-Integration**: Preview-Funktion in 4 wichtigen Dateien dokumentiert
- **Befehlsmuster**: Einheitliche Syntax und Beispiele in der gesamten Dokumentation
- **Beste Praxis Integration**: Preview in Validierungs-Workflows und Skripten enthalten
- **Visuelle Indikatoren**: Deutliche NEUE Feature-Markierungen zur besseren Auffindbarkeit

#### Workshop-Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Farbverlauf
- **Benutzererlebnis**: Klarer Entwicklungsstand vermeidet Verwirrung
- **Professionelle Präsentation**: Erhält die Glaubwürdigkeit des Repositorys und setzt klare Erwartungen
- **Zeitleisten-Transparenz**: Letzter Aktualisierungszeitstempel Oktober 2025 für Rechenschaft

### [v3.3.0] - 2025-09-24

#### Verbesserte Workshop-Materialien und interaktive Lernerfahrung
**Diese Version bringt umfassende Workshop-Materialien mit browserbasierten interaktiven Anleitungen und strukturierten Lernpfaden.**

#### Hinzugefügt
- **🎥 Interaktiver Workshop-Guide**: Browserbasierte Workshop-Erfahrung mit MkDocs-Preview-Funktion
- **📝 Strukturierte Workshop-Anleitungen**: 7-stufiger geführter Lernpfad von Entdeckung bis Anpassung
  - 0-Einführung: Workshop-Übersicht und Einrichtung
  - 1-AI-Template-Auswahl: Template-Entdeckungs- und Auswahlprozess
  - 2-AI-Template-Validierung: Deployment- und Validierungsverfahren
  - 3-AI-Template-Analyse: Verständnis der Template-Architektur
  - 4-AI-Template-Konfiguration: Konfiguration und Anpassung
  - 5-AI-Template-Anpassung: Erweiterte Modifikationen und Iterationen
  - 6-Infrastruktur-Abbau: Bereinigung und Ressourcenmanagement
  - 7-Abschluss: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Tooling**: MkDocs-Konfiguration mit Material-Theme für verbessertes Lernerlebnis
- **🎯 Praxisorientierter Lernpfad**: 3-stufige Methodik (Entdeckung → Deployment → Anpassung)
- **📱 GitHub Codespaces Integration**: Nahtlose Entwicklungsumgebung-Einrichtung

#### Verbesserungen
- **AI Workshop Lab**: Erweiterung mit umfassenden 2-3 Stunden strukturiertem Lernerlebnis
- **Workshop-Dokumentation**: Professionelle Präsentation mit Navigation und visueller Unterstützung
- **Lernfortschritt**: Klare Schritt-für-Schritt-Anleitung von Template-Auswahl bis Produktions-Deployment
- **Entwicklererlebnis**: Integriertes Tooling für optimierte Entwicklungs-Workflows

#### Verbesserungen
- **Barrierefreiheit**: Browserbasierte Oberfläche mit Suche, Kopierfunktion und Theme-Umschalter
- **Selbstbestimmtes Lernen**: Flexibler Workshopaufbau für unterschiedliche Lerntempi
- **Praktischer Einsatz**: Realistische AI-Template-Deploymentszenarien
- **Community-Integration**: Discord-Integration für Workshop-Support und Zusammenarbeit

#### Workshop-Funktionen
- **Integrierte Suche**: Schnelle Stichwort- und Lektionserkennung
- **Kopierbare Codeblöcke**: Hover-to-copy-Funktion für alle Codebeispiele
- **Theme-Umschalter**: Unterstützt Dunkel- und Hell-Modus für unterschiedliche Vorlieben
- **Visuelle Mittel**: Screenshots und Diagramme zur besseren Verständlichkeit
- **Hilfsintegration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Umfangreiche Umstrukturierung der Navigation und kapitelbasiertes Lernsystem
**Diese Version führt eine umfassende kapitelbasierte Lernstruktur mit verbesserter Navigation über das gesamte Repository ein.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Kompletter Kurs in 8 aufeinanderfolgende Lernkapitel umstrukturiert
  - Kapitel 1: Grundlagen & Schnellstart (⭐ - 30-45 Minuten)
  - Kapitel 2: AI-First Entwicklung (⭐⭐ - 1-2 Stunden)
  - Kapitel 3: Konfiguration & Authentifizierung (⭐⭐ - 45-60 Minuten)
  - Kapitel 4: Infrastruktur als Code & Deployment (⭐⭐⭐ - 1-1,5 Stunden)
  - Kapitel 5: Multi-Agent AI Lösungen (⭐⭐⭐⭐ - 2-3 Stunden)
  - Kapitel 6: Pre-Deployment Validierung & Planung (⭐⭐ - 1 Stunde)
  - Kapitel 7: Fehlerbehebung & Debugging (⭐⭐ - 1-1,5 Stunden)
  - Kapitel 8: Produktions- & Enterprise-Muster (⭐⭐⭐⭐ - 2-3 Stunden)
- **📚 Umfassendes Navigationssystem**: Einheitliche Navigationsköpfe und -füße über alle Dokumentationen
- **🎯 Fortschrittsverfolgung**: Checkliste für Kursabschluss und Lernüberprüfung
- **🗺️ Lernpfadführung**: Klare Einstiegspunkte für unterschiedliche Erfahrungsniveaus und Ziele
- **🔗 Querverweis-Navigation**: Verknüpfungen zu verwandten Kapiteln und Voraussetzungen

#### Verbesserungen
- **README-Struktur**: Umgewandelt zu einer strukturierten Lernplattform mit kapitelbasierter Organisation
- **Dokumentationsnavigation**: Jede Seite enthält nun Kapitelkontext und Fortschrittsanleitung
- **Template-Organisation**: Beispiele und Templates sind den passenden Lernkapiteln zugeordnet
- **Ressourcenintegration**: Spickzettel, FAQs und Studienführer sind mit relevanten Kapiteln verknüpft
- **Workshop-Integration**: Hands-on-Labs sind mit mehreren Lernzielen der Kapitel verbunden

#### Geändert
- **Lernprogression**: Von linearer Dokumentation zu flexiblem kapitelbasiertem Lernen übergegangen
- **Konfigurationspositionierung**: Konfigurationsanleitung als Kapitel 3 für besseren Lernfluss verschoben
- **AI-Inhaltsintegration**: Bessere Einbindung von AI-spezifischen Inhalten im gesamten Lernverlauf
- **Produktionsinhalte**: Fortgeschrittene Muster in Kapitel 8 für Enterprise-Lernende zusammengeführt

#### Verbessert
- **Benutzererlebnis**: Klare Navigations-Breadcrumbs und Fortschrittsindikatoren für Kapitel
- **Barrierefreiheit**: Einheitliche Navigationsmuster für einfacheres Durchlaufen des Kurses
- **Professionelle Präsentation**: Universitätsähnliche Kursstruktur geeignet für akademische und betriebliche Schulungen
- **Lernerfolg**: Verringerte Suchzeiten dank besserer Organisation

#### Technische Umsetzung
- **Navigationsköpfe**: Standardisierte Kapitel-Navigation über mehr als 40 Dokumentationsdateien
- **Footer-Navigation**: Einheitliche Fortschrittsführung und Kapitelabschlussanzeigen
- **Verlinkung**: Umfassendes internes Verknüpfungssystem für verwandte Konzepte
- **Kapitelzuordnung**: Templates und Beispiele klar an Lernziele gebunden

#### Erweiterung des Studienführers
- **📚 Umfassende Lernziele**: Studienführer an das 8-Kapitel-System angepasst
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Checklisten
- **❓ Bewertungsfragen**: Wissensüberprüfung für jedes Kapitel mit professionellen Ergebnissen
- **🛠️ Praktische Übungen**: Hands-on-Aktivitäten mit realen Deployment-Szenarien und Fehlerbehebung
- **📊 Fähigkeitsfortschritt**: Klare Steigerung von Grundkonzepten zu Enterprise-Mustern mit Karrierefokus
- **🎓 Zertifizierungsrahmen**: Professionelle Entwicklungsergebnisse und Community-Anerkennung
- **⏱️ Zeitmanagement**: Strukturierter 10-Wochen-Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 2025-09-17

#### Verbesserte Multi-Agent AI Lösungen
**Diese Version verbessert die Multi-Agent Retail-Lösung mit besserer Agentenbenennung und erweiterter Dokumentation.**

#### Geändert
- **Multi-Agent Terminologie**: „Cora agent“ durch „Customer agent“ in der gesamten Multi-Agent-Lösung für den Einzelhandel zur besseren Verständlichkeit ersetzt
- **Agent Architektur**: Alle Dokumentationen, ARM-Vorlagen und Codebeispiele auf einheitliche „Customer agent“-Benennung aktualisiert
- **Konfigurationsbeispiele**: Agent-Konfigurationsmuster mit aktualisierten Benennungskonventionen modernisiert
- **Dokumentationskonsistenz**: Sichergestellt, dass alle Verweise professionelle, beschreibende Agentnamen verwenden

#### Verbessert
- **ARM-Vorlagenpaket**: retail-multiagent-arm-template mit Customer agent Verweisen aktualisiert
- **Architekturdiagramme**: Mermaid-Diagramme mit aktualisierter Agent-Namensgebung aktualisiert
- **Code-Beispiele**: Python-Klassen und Implementierungsbeispiele nutzen jetzt CustomerAgent-Namensgebung
- **Umgebungsvariablen**: Alle Bereitstellungsskripte auf CUSTOMER_AGENT_NAME-Konventionen aktualisiert

#### Verbessert
- **Entwicklererlebnis**: Klarere Agentenrollen und Verantwortlichkeiten in der Dokumentation
- **Produktionsreife**: Bessere Ausrichtung an Unternehmensbenennungskonventionen
- **Lernmaterialien**: Intuitivere Agentenbenennung für didaktische Zwecke
- **Vorlagenbenutzbarkeit**: Vereinfachtes Verständnis von Agentenfunktionen und Bereitstellungsmustern

#### Technische Details
- Aktualisierte Mermaid-Architekturdiagramme mit CustomerAgent-Verweisen
- CoraAgent-Klassennamen in Python-Beispielen durch CustomerAgent ersetzt
- ARM-Vorlagen-JSON-Konfigurationen zur Verwendung des Agententyps „customer“ geändert
- Umgebungsvariablen von CORA_AGENT_* zu CUSTOMER_AGENT_* Mustern aktualisiert
- Alle Bereitstellungsbefehle und Containerkonfigurationen aktualisiert

### [v3.0.0] - 2025-09-12

#### Bedeutende Änderungen - Fokus auf AI-Entwickler und Microsoft Foundry Integration
**Diese Version verwandelt das Repository in eine umfassende, auf KI fokussierte Lernressource mit Microsoft Foundry Integration.**

#### Hinzugefügt
- **🤖 KI-zentrierter Lernpfad**: Komplette Umstrukturierung mit Priorität für KI-Entwickler und Ingenieure
- **Microsoft Foundry Integrationsleitfaden**: Umfassende Dokumentation zur Verbindung von AZD mit Microsoft Foundry-Diensten
- **KI-Modell-Bereitstellungsmuster**: Detaillierter Leitfaden zu Modellwahl, Konfiguration und Produktionsbereitstellung
- **KI-Workshop-Lab**: 2-3-stündiger praktischer Workshop zur Umwandlung von KI-Anwendungen in AZD-deploybare Lösungen
- **Best Practices für Produktions-KI**: Unternehmensbereite Muster für Skalierung, Überwachung und Absicherung von KI-Workloads
- **KI-spezifischer Troubleshooting-Leitfaden**: Umfassende Fehlerbehebung für Microsoft Foundry Modelle, Cognitive Services und KI-Bereitstellungsprobleme
- **KI-Vorlagengalerie**: Ausgewählte Sammlung Microsoft Foundry Vorlagen mit Komplexitätsbewertungen
- **Workshop-Materialien**: Komplettes Workshop-Konzept mit Hands-on-Labs und Referenzmaterialien

#### Verbessert
- **README-Struktur**: Fokus auf KI-Entwickler mit 45 % Community-Interesse aus dem Microsoft Foundry Discord
- **Lernpfade**: Spezieller KI-Entwicklerpfad neben traditionellen Pfaden für Studierende und DevOps-Ingenieure
- **Vorlagenempfehlungen**: Vorgestellte KI-Vorlagen einschließlich azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community-Integration**: Erweiterte Discord-Community-Unterstützung mit KI-spezifischen Kanälen und Diskussionen

#### Sicherheit & Produktionsfokus
- **Managed Identity-Muster**: KI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Kostenoptimierung**: Token-Nutzungsüberwachung und Budgetkontrolle für KI-Workloads
- **Multi-Region Bereitstellung**: Strategien für globale KI-Anwendungsbereitstellung
- **Leistungsüberwachung**: KI-spezifische Metriken und Application Insights Integration

#### Dokumentationsqualität
- **Linearer Kursaufbau**: Logischer Fortschritt von Anfänger- zu fortgeschrittenen KI-Bereitstellungsmustern
- **Validierte URLs**: Alle externen Repository-Links verifiziert und zugänglich
- **Vollständige Referenz**: Alle internen Dokumentationslinks validiert und funktional
- **Produktionsreif**: Unternehmensbereite Bereitstellungsmuster mit Praxisbeispielen

### [v2.0.0] - 2025-09-09

#### Bedeutende Änderungen - Repository-Umstrukturierung und professionelle Aufwertung
**Diese Version stellt eine bedeutende Überarbeitung der Repository-Struktur und der Inhaltspräsentation dar.**

#### Hinzugefügt
- **Strukturiertes Lernframework**: Alle Dokumentationsseiten beinhalten nun Einleitung, Lernziele und Lernergebnisse
- **Navigationssystem**: Hinzufügen von Vorher-/Nächste-Lektionslinks für einen geführten Lernfortschritt in allen Dokumentationen
- **Studienleitfaden**: Umfassende study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professionelle Präsentation**: Entfernung aller Emoji-Symbole für verbesserte Barrierefreiheit und professionelles Erscheinungsbild
- **Verbesserte Inhaltsstruktur**: Optimierte Organisation und Ablauf der Lernmaterialien

#### Geändert
- **Dokumentationsformat**: Standardisierung aller Dokumentationen mit konsistenter lernfokussierter Struktur
- **Navigationsfluss**: Implementierung eines logischen Ablaufs durch alle Lerninhalte
- **Inhaltspräsentation**: Entfernen dekorativer Elemente zugunsten klarer, professioneller Formatierung
- **Linkstruktur**: Aktualisierung aller internen Links zur Unterstützung des neuen Navigationssystems

#### Verbessert
- **Barrierefreiheit**: Entfernung von Emoji-Abhängigkeiten für bessere Screenreader-Kompatibilität
- **Professionelles Erscheinungsbild**: Saubere, akademische Darstellung geeignet für Unternehmenslernumgebungen
- **Lernerlebnis**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Inhaltsorganisation**: Bessere logische Verknüpfung und Fluss zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Erste Veröffentlichung - Umfassendes AZD-Lernrepository

#### Hinzugefügt
- **Kern-Dokumentationsstruktur**
  - Vollständige Einstiegshandbuch-Reihe
  - Umfassende Bereitstellungs- und Provisionierungsdokumentation
  - Ausführliche Fehlerbehebungsressourcen und Debugging-Anleitungen
  - Validierungswerkzeuge und -verfahren vor der Bereitstellung

- **Getting Started Modul**
  - AZD-Grundlagen: Kernkonzepte und Terminologie
  - Installationsanleitung: Plattform-spezifische Einrichtungshinweise
  - Konfigurationsleitfaden: Umgebungseinrichtung und Authentifizierung
  - Erstes Projekt Tutorial: Schritt-für-Schritt Praxisanleitung

- **Bereitstellungs- und Provisionierungsmodul**
  - Bereitstellungsleitfaden: Komplette Workflow-Dokumentation
  - Provisionierungsleitfaden: Infrastructure as Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Architektur-Muster für Multi-Service-Systeme

- **Pre-Deployment Validierungsmodul**
  - Kapazitätsplanung: Validierung der Azure-Ressourcenverfügbarkeit
  - SKU-Auswahl: Umfassende Leitlinien für Service-Stufen
  - Pre-Flight-Checks: Automatisierte Prüfscripts (PowerShell und Bash)
  - Kostenabschätzung und Budgetplanungstools

- **Fehlerbehebungsmodul**
  - Häufige Probleme: Gängige Probleme und Lösungen
  - Debugging-Leitfaden: Systematische Troubleshooting-Methoden
  - Fortgeschrittene Diagnosetechniken und -werkzeuge
  - Leistungsüberwachung und -optimierung

- **Ressourcen und Referenzen**
  - Befehlsübersicht: Schneller Überblick über essentielle Kommandos
  - Glossar: Umfassende Terminologie- und Akronymerklärungen
  - FAQ: Detaillierte Antworten auf häufig gestellte Fragen
  - Externe Ressourcenlinks und Community-Verbindungen

- **Beispiele und Vorlagen**
  - Einfaches Webanwendungsbeispiel
  - Vorlage für statische Webseitenbereitstellung
  - Containeranwendungskonfiguration
  - Datenbankintegrationsmuster
  - Microservices-Architekturbeispiele
  - Serverless-Funktionsimplementierungen

#### Merkmale
- **Multi-Plattform-Unterstützung**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Mehrere Fähigkeitsstufen**: Inhalte für Studierende bis professionelle Entwickler
- **Praxisorientierung**: Hands-on-Beispiele und praxisnahe Szenarien
- **Umfassende Abdeckung**: Von Grundkonzepten bis zu fortgeschrittenen Unternehmensmustern
- **Sicherheitsorientierter Ansatz**: Sicherheitsbest Practices durchgängig integriert
- **Kostenoptimierung**: Leitlinien für kosteneffektive Bereitstellungen und Ressourcenmanagement

#### Dokumentationsqualität
- **Detaillierte Codebeispiele**: Praktische, getestete Codebeispiele
- **Schritt-für-Schritt-Anleitungen**: Klare, umsetzbare Anweisungen
- **Umfassende Fehlerbehandlung**: Troubleshooting für häufige Probleme
- **Integration von Best Practices**: Branchenstandards und Empfehlungen
- **Versionskompatibilität**: Aktuell mit neuesten Azure-Diensten und azd-Funktionen

## Geplante zukünftige Verbesserungen

### Version 3.1.0 (Geplant)
#### Erweiterung der KI-Plattform
- **Multi-Modell-Unterstützung**: Integrationsmuster für Hugging Face, Azure Machine Learning und benutzerdefinierte Modelle
- **KI-Agenten-Frameworks**: Vorlagen für LangChain, Semantic Kernel und AutoGen Bereitstellungen
- **Erweiterte RAG-Muster**: Vektordatenbankoptionen jenseits von Azure AI Search (Pinecone, Weaviate etc.)
- **KI-Observability**: Verbesserte Überwachung von Modellleistung, Token-Nutzung und Antwortqualität

#### Entwicklererlebnis
- **VS Code Erweiterung**: Integrierte AZD + Microsoft Foundry Entwicklungsumgebung
- **GitHub Copilot Integration**: KI-unterstützte AZD-Vorlagengenerierung
- **Interaktive Tutorials**: Praktische Codierungsübungen mit automatisierter Validierung für KI-Szenarien
- **Videoinhalte**: Ergänzende Videotutorials für visuelle Lernende mit Fokus auf KI-Bereitstellungen

### Version 4.0.0 (Geplant)
#### Unternehmens-KI-Muster
- **Governance Framework**: KI-Modell-Governance, Compliance und Audit-Trails
- **Multi-Tenant KI**: Muster zur Bereitstellung mehrerer Kunden mit isolierten KI-Diensten
- **Edge-KI-Bereitstellung**: Integration mit Azure IoT Edge und Containerinstanzen
- **Hybrid-Cloud-KI**: Multi-Cloud- und Hybrid-Bereitstellungsmuster für KI-Workloads

#### Erweiterte Funktionen
- **KI-Pipeline-Automatisierung**: MLOps-Integration mit Azure Machine Learning Pipelines
- **Erweiterte Sicherheit**: Zero-Trust-Muster, private Endpunkte und erweiterter Bedrohungsschutz
- **Leistungsoptimierung**: Fortgeschrittene Anpassungs- und Skalierungsstrategien für hochdurchsatzfähige KI-Anwendungen
- **Globale Verteilung**: Content Delivery und Edge-Caching-Muster für KI-Anwendungen

### Version 3.0.0 (Geplant) - Von aktueller Version abgelöst
#### Vorgeschlagene Ergänzungen - Jetzt in v3.0.0 umgesetzt
- ✅ **KI-zentrierter Inhalt**: Umfassende Microsoft Foundry Integration (Abgeschlossen)
- ✅ **Interaktive Tutorials**: Praktisches KI-Workshop-Lab (Abgeschlossen)
- ✅ **Erweiterte Sicherheitsmodule**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Leistungsoptimierung**: KI-Workload-Tuning-Strategien (Abgeschlossen)

### Version 2.1.0 (Geplant) - Teilweise in v3.0.0 umgesetzt
#### Kleinere Verbesserungen - Teilweise in der aktuellen Version fertiggestellt
- ✅ **Zusätzliche Beispiele**: KI-orientierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Erweiterte FAQ**: KI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool-Integration**: Verbesserte IDE- und Editor-Integrationsanleitungen
- ✅ **Erweiterung der Überwachung**: KI-spezifische Überwachungs- und Alarmierungsmuster (Abgeschlossen)

#### Noch für zukünftige Version geplant
- **Mobile-freundliche Dokumentation**: Responsives Design für mobiles Lernen
- **Offline-Zugriff**: Downloadbare Dokumentationspakete
- **Verbesserte IDE-Integration**: VS Code-Erweiterung für AZD + KI-Workflows
- **Community-Dashboard**: Echtzeit-Community-Metriken und Beitragsverfolgung

## Beitrag zum Changelog

### Änderungen melden
Beim Beitrag zu diesem Repository bitte sicherstellen, dass Changelog-Einträge enthalten:

1. **Versionsnummer**: Entsprechend semantischer Versionierung (major.minor.patch)
2. **Datum**: Veröffentlichungs- oder Aktualisierungsdatum im Format JJJJ-MM-TT
3. **Kategorie**: Hinzugefügt, Geändert, Veraltet, Entfernt, Behoben, Sicherheit
4. **Klare Beschreibung**: Prägnante Beschreibung der Änderungen
5. **Auswirkungsbewertung**: Wie sich Änderungen auf bestehende Nutzer auswirken

### Änderungskategorien

#### Hinzugefügt
- Neue Funktionen, Dokumentationsabschnitte oder Fähigkeiten
- Neue Beispiele, Vorlagen oder Lernressourcen
- Zusätzliche Werkzeuge, Skripte oder Dienstprogramme

#### Geändert
- Änderungen an bestehender Funktionalität oder Dokumentation
- Aktualisierungen zur Verbesserung von Klarheit oder Genauigkeit
- Umstrukturierung von Inhalten oder Organisation

#### Veraltet
- Funktionen oder Ansätze, die eingestellt werden
- Dokumentationsabschnitte, die entfernt werden sollen
- Methoden, für die bessere Alternativen existieren

#### Entfernt
- Funktionen, Dokumentationen oder Beispiele, die nicht mehr relevant sind
- Veraltete Informationen oder überholte Ansätze
- Redundante oder zusammengefasste Inhalte

#### Behoben
- Korrekturen von Fehlern in Dokumentation oder Code
- Behebung gemeldeter Probleme oder Fehler
- Verbesserungen der Genauigkeit oder Funktionalität

#### Sicherheit
- Sicherheitsbezogene Verbesserungen oder Fehlerbehebungen
- Updates zu Sicherheits-Best-Practices
- Behebung von Sicherheitslücken

### Richtlinien für semantische Versionierung

#### Major Version (X.0.0)
- Breaking Changes, die Nutzeraktion erfordern
- Bedeutende Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik verändern

#### Minor Version (X.Y.0)
- Neue Funktionen oder Inhalts-Ergänzungen
- Verbesserungen bei gleichbleibender Rückwärtskompatibilität
- Zusätzliche Beispiele, Werkzeuge oder Ressourcen

#### Patch Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleine Verbesserungen an bestehenden Inhalten
- Klarstellungen und kleinere Verbesserungen

## Feedback und Vorschläge aus der Community

Wir fördern aktiv das Feedback der Community, um diese Lernressource zu verbessern:

### Wie Feedback gegeben werden kann
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Probleme willkommen)
- **Discord Diskussionen**: Ideen austauschen und mit der Microsoft Foundry Community interagieren
- **Pull Requests**: Direkte inhaltliche Verbesserungen, besonders bei KI-Vorlagen und Leitfäden beitragen
- **Microsoft Foundry Discord**: Teilnahme am #Azure Kanal für AZD + KI-Diskussionen
- **Community-Foren**: Teilnahme an weiteren Azure Entwicklerdiskussionen

### Feedback-Kategorien
- **Genauigkeit der KI-Inhalte**: Korrekturen zur Integration und Bereitstellung von KI-Diensten
- **Lernerlebnis**: Vorschläge zur Verbesserung des Lernflusses für KI-Entwickler
- **Fehlende KI-Inhalte**: Anfragen für weitere KI-Vorlagen, Muster oder Beispiele
- **Barrierefreiheit**: Verbesserungen für unterschiedliche Lernbedürfnisse
- **KI-Tool-Integration**: Vorschläge für bessere KI-Workflow-Integration
- **Produktions-KI-Muster**: Anforderungen an Unternehmens-KI-Bereitstellungsmuster

### Reaktionsverpflichtung
- **Issue-Antwort**: Innerhalb von 48 Stunden für gemeldete Probleme
- **Feature-Anfragen**: Bewertung innerhalb einer Woche
- **Community-Beiträge**: Prüfung innerhalb einer Woche
- **Sicherheitsprobleme**: Sofortige Priorität mit beschleunigter Reaktion

## Wartungsplan

### Regelmäßige Updates
- **Monatliche Überprüfungen**: Inhaltsgenauigkeit und Linkvalidierung
- **Vierteljährliche Updates**: Große Inhaltsverbesserungen und Ergänzungen
- **Halbjährliche Überprüfungen**: Umfassende Umstrukturierung und Erweiterungen
- **Jährliche Veröffentlichungen**: Hauptversionsaktualisierungen mit bedeutenden Verbesserungen

### Überwachung und Qualitätssicherung
- **Automatisiertes Testen**: Regelmäßige Validierung von Codebeispielen und Links
- **Integration von Community-Feedback**: Regelmäßige Einbindung von Nutzeranregungen
- **Technologie-Updates**: Abstimmung auf die neuesten Azure-Dienste und azd-Veröffentlichungen
- **Barrierefreiheitsprüfungen**: Regelmäßige Überprüfung der Prinzipien inklusiven Designs

## Versionsunterstützungsrichtlinie

### Aktuelle Versionsunterstützung
- **Neueste Hauptversion**: Volle Unterstützung mit regelmäßigen Updates
- **Vorherige Hauptversion**: Sicherheitsupdates und kritische Fehlerbehebungen für 12 Monate
- **Veraltete Versionen**: Nur Community-Support, keine offiziellen Updates

### Migrationsanleitung
Bei Veröffentlichung neuer Hauptversionen bieten wir:
- **Migrationsleitfäden**: Schritt-für-Schritt-Übergangsanleitungen
- **Kompatibilitätsnotizen**: Details zu Breaking Changes
- **Tool-Unterstützung**: Skripte oder Hilfsprogramme zur Unterstützung der Migration
- **Community-Support**: Eigene Foren für Migrationsfragen

---

**Navigation**
- **Vorherige Lektion**: [Studienleitfaden](resources/study-guide.md)
- **Nächste Lektion**: Zurück zum [Haupt-README](README.md)

**Bleiben Sie auf dem Laufenden**: Beobachten Sie dieses Repository, um Benachrichtigungen über neue Veröffentlichungen und wichtige Aktualisierungen des Lernmaterials zu erhalten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->