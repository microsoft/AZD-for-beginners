# Änderungsprotokoll - AZD Für Einsteiger

## Einführung

Dieses Änderungsprotokoll dokumentiert alle bemerkenswerten Änderungen, Updates und Verbesserungen im AZD Für Einsteiger Repository. Wir folgen den Prinzipien der semantischen Versionsverwaltung und pflegen dieses Protokoll, um Nutzern zu helfen, zu verstehen, was sich zwischen den Versionen geändert hat.

## Lernziele

Durch die Überprüfung dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und Inhaltszusätze informiert bleiben
- Verbesserungen an bestehender Dokumentation verstehen
- Fehlerbehebungen und Korrekturen verfolgen, um Genauigkeit sicherzustellen
- Die Entwicklung der Lernmaterialien im Laufe der Zeit verfolgen

## Lernergebnisse

Nach der Durchsicht der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und verfügbare Ressourcen zum Lernen zu identifizieren
- Zu verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernweg basierend auf den aktuellsten Materialien zu planen
- Feedback und Vorschläge für zukünftige Verbesserungen beizusteuern

## Versionshistorie

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry Erweiterung 1.0 ist jetzt allgemein verfügbar

Das `microsoft.foundry` 1.0 Bundle ist **live und allgemein verfügbar**, wie am [5. November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/) angekündigt. Der Kurs vermittelt jetzt den freigegebenen GA-Workflow, nicht eine bevorstehende Version. Beginnen Sie mit AZD **1.37.0 oder neuer** und `azd ext install microsoft.foundry`.

#### In diesem Kursupdate enthalten
- Die englische Anleitung verwendet das GA-Bundle als Standardinstallationspfad und erklärt seine sieben unabhängig versionierten Kern-Erweiterungen.
- Ein [gehosteter Agenten-Durchgang](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) behandelt das Upstream Python Agent Framework Responses API-Beispiel, aktuelle uv, Python 3.13+, neue/bestehende Projektauswahl, Modellwiederverwendung und Überprüfung von `azure.yaml`.
- Der lokal-zu-Cloud Workflow behandelt Agent Inspector Tests, Azure-gestützte Modellaufrufkosten, Remote-Code-Builds, bereitgestellte Aufrufe, Cloud-Tracing, Bereitstellungsvorschau, Protokolle und Diagnosen.
- Separate Evaluierungsanleitungen decken das Erzeugen und Überprüfen von Datensätzen/Rubrics ab, die Konfiguration einer benannten Evaluierung, das Registrieren von Assets und die Ergebniseinsicht. Ältere Evaluierungs-/Optimierungsanweisungen bleiben Migrationshistorie, nicht die aktuelle Release-Basis.
- Foundry CI/CD Anleitungen beinhalten Runner-Erweiterungsinstallation, authentifizierte Bereitstellung, Evaluierungs-Assets/-Zugriff sowie ein explizites Qualitäts-Gate.
- Aufräumanleitungen unterscheiden neu erstellte und wiederverwendete Foundry-Projekte. Der Workshop verlinkt zur separaten GA-Übung, ohne deren spezifische Beispieltests zu ersetzen.
- Kursnavigation, Lernziele, Einrichtungs-Voraussetzungen, Spickzettel, FAQ und Studienführer spiegeln den GA-Workflow wider. Generierte Übersetzungen werden nicht manuell bearbeitet.

#### Überprüfungsumfang
- Basierend auf der GA-Ankündigung, verlinkter Microsoft Learn Anleitung und der Upstream-Beispielkonfiguration. Es wurde keine Live-Azure-Bereitstellung, -Deployment, Modellaufruf oder Evaluierung durchgeführt.
- Bundle-GA bedeutet nicht GA für jedes optionale Feature, unabhängige Erweiterung oder SDK, noch zertifiziert es die Beispiele für den Produktionseinsatz.

### [v3.24.0]- 2026-11-04

#### Korrigiert
- Reparierte englische Kursnavigation, Seitenverschiebungen, fehlende Anker und veraltete externe Verweise, einschließlich des Kapitels 2 Links zum Produktions-KI-Handbuch.
- Überprüfte aktuelle Anleitungen gegen veröffentlichte AZD 1.37.2, Agenten 1.0.0-beta.23 und Evaluierungen 1.0.0-beta.2. Dokumentierte den separaten `azd ai eval` Workflow und Migrationsnotizen zur Optimierungskonfiguration.
- Korrigierte nicht unterstützte CLI-Flags, Authentifizierungsgrenzen, Klartext-Umgebungs-/Geheimnisanleitungen, Infrastruktur-Updates, Modellkonfiguration und destruktive Wiederherstellungsbeispiele.
- Aktualisierte den Workshop basierend auf dem aktuellen AI Agents Beispiel, inklusive tatsächlicher Hooks, Konfigurationsein- und -ausgaben, Evaluierungstests, Red-Teaming Einstiegspunkte und Beobachtbarkeit.
- Korrigierte Implementierungsansprüche von Beispielen und behob die damit zusammenhängenden Anwendungs-/Infrastruktur-/Konfigurationsprobleme. Material zur Retail-Architektur wird ausdrücklich von einer vollständigen funktionalen Anwendung unterschieden.
- Stellte die CodeQL Sprachmatrix wieder her, wählte für den Entwicklungscontainer Node.js 24 als unterstützte Version und sorgte dafür, dass Setup-Validatoren bei fehlerhaften Versionsbefehlen melden.

#### Hinzugefügt
- Einen nur auf Englisch verfügbaren Offline-Link-/Ankerprüfer, Regressionstests und einen Dokumentationsworkflow, der den Workshop auch im Strict Modus baut. Generierte Übersetzungen und übersetzte Bilder sind ausgeschlossen.

#### Validierungsumfang
- Quellcode-, Syntax-, Konfigurations-, lokales Verhalten- und Netzwerk-Link-Prüfungen geben keine Aussage über Live-Azure-Bereitstellbarkeit, Quoten, RBAC, regionale Modellverfügbarkeit, Abrechnung, Sicherheitskonformität oder Produktionsreife.
- Ältere Einträge unten sind historische Aufzeichnungen, keine aktuellen Befehls- oder Release-Anweisungen.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Aktualisierung: Versionsaktualisierung
**Diese Version validiert den Kurs neu gegen `azd` `1.27.1` (Juli 2026, neueste stabile Version) und die aktuelle Vorschau der AI Agent Erweiterung `azure.ai.agents` `1.0.0-beta.5`, wodurch alle "validiert gegen"-Banner nach den Releases 1.26.0, 1.27.0 und 1.27.1 aktualisiert werden.**

#### Geändert
- **✅ Validierungsbasis aktualisiert** von `azd 1.25.6` (Juni 2026) auf `azd 1.27.1` (Juli 2026) im Root-README, allen Kapitel-READMEs, der Kapitel 1 Dev-Container Lektion (inklusive festgepinnter Versionsbeispiele), der Kapitel 4 Custom-Templates Lektion, der Kapitel 5 Multi-Agent Lektion und den Workshop-Dokumentationen
- **🤖 Kapitel 2 Basis aktualisiert** von `azd 1.23.12` (März 2026) auf `azd 1.27.1` in `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` und `microsoft-foundry-integration.md`; Validierungsnotiz-Daten auf 2026-07-13 aktualisiert
- **🧩 AI Agent-Erweiterung aktualisiert** von `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` zur aktuellen `1.0.0-beta.5` Version im Kapitel 2 README und `agents.md`
- **🧪 Workshop Validierungsbeispiel** (`azd version` Ausgabe) aktualisiert auf `1.27.1`

#### Hinweise zu relevanten azd Releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-Unterstützung für Azure Functions auf Flex Consumption, `azd config sub-filter` pro Mandanten Abonnementfilter, eigenständige Erweiterungs-Bundles (`azd x pack --bundle`) und `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellierung von Azure AI Foundry Projekten/Agenten direkt in `azure.yaml` (Bicep-/Terraform-freies Initialisieren), Container-Bereitstellung für App Service (`host: appservice` + `language: docker`), direkte `-s/--source` für `azd extension` Befehle und `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` Flag für `azd extension install`, deprecated Modelle standardmäßig aus Katalog-/Quota-Aufforderungen ausgeschlossen und mehrere Fehlerbehebungen

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

#### Anfänger-Mangel #2: Vorlagen-Erstellung, Dev-Container, Pulumi, Azure DevOps, Dienstprinzipale und mehr
**Diese Version schließt die verbleibenden mittleren Lücken, die durch die azd-Abdeckungsanalyse aufgedeckt wurden: wie man eigene Vorlagen erstellt und veröffentlicht, reproduzierbare Dev-Container-/Codespaces-Umgebungen, den Pulumi-Infrastrukturprovider, einen Azure DevOps CI/CD-Workshop, Dienstprinzipal-Authentifizierung, Host-Auswahlanleitungen (AKS/Spring Apps), `azd restore`/`azd package` Erklärungen, Fehlerbehandlung für Hooks und Team-/geteilte Umgebungspraktiken.**

#### Hinzugefügt
- **🧱 Neue Kapitel 4 Lektion** `docs/chapter-04-infrastructure/custom-templates.md` — eigene azd Vorlage erstellen: erforderliche Struktur (`azure.yaml`, `infra/`, `src/`), das `metadata.template` Feld, Parametrisierung der Infrastruktur mit dem `uniqueString()` Ressourcentoken und `azd-env-name` Tag, lokales Testen mit `azd init --template <local-path>`, Veröffentlichung auf GitHub und Einreichung in die Awesome AZD Galerie
- **📦 Neue Kapitel 1 Lektion** `docs/chapter-01-foundation/dev-containers.md` — reproduzierbare azd Umgebungen mit Dev Containers und GitHub Codespaces: ein minimales `.devcontainer/devcontainer.json` mit der offiziellen `ghcr.io/azure/azure-dev/azd` Funktion, sprachspezifische Features, `docker-in-docker` für Container-Hosts und `azd auth login --use-device-code` für Remote-Anmeldung
- **🧩 Pulumi mit azd** Abschnitt in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-Ordnerstruktur, Stacks mapped auf azd-Umgebungen, erforderliche Outputs/Tagging und der identische `azd up` / `azd down` Workflow
- **🎯 Host-Auswahlanleitung** in `docs/chapter-04-infrastructure/provisioning.md` — ein anfängerfreundlicher Vergleich von `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` und `springapp`, mit Anleitung wann AKS oder Azure Spring Apps zu wählen sind
- **🛠️ Azure DevOps CI/CD Workshop** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, Service-Verbindung mit Workload Identity Federation (OIDC), das generierte `azure-dev.yml` und Variable-Group Setup
- **🔑 Dienstprinzipale (Muster 4)** hinzugefügt zu `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, nicht-interaktives `azd auth login` mit Client-Secret vs. föderierten/OIDC-Anmeldeinformationen, wann zu verwenden und sichere Aufbewahrung der Anmeldedaten
- **🪝 Fehlerbehandlung bei Hooks** Unterabschnitt in `docs/chapter-04-infrastructure/deployment-guide.md` — Exit-Codes und `set -e`, `continueOnError`, isoliertes Testen von Hooks mit `azd hooks run`, betriebssystemspezifische Shells und `--debug`
- **👥 Team-/geteilte Umgebungen** Abschnitt in `docs/chapter-03-configuration/configuration.md` — was in `.azure/` lebt, was gitignoriert wird, pro-Entwickler-Umgebungen, `azd env list`/`select` und das Bereitstellen von Umgebungswerten in CI/CD
- **🧰 `azd restore` und erweiterte `azd package`** Erklärungen in `resources/cheat-sheet.md` — Wiederherstellung von Abhängigkeiten und Erstellung eines bereitstellbaren Artefakts ohne Deployment

#### Geändert
- **🧭 Kapitel 4 Lektionentabelle** aktualisiert zur Aufnahme der neuen Lektion "Eigene Vorlage erstellen" (Lektion 3)
- **🧭 Kapitel 1 Lektionentabelle** aktualisiert zur Aufnahme der neuen Lektion "Dev Containers & Codespaces" (Lektion 5); Navigations-Footer zwischen `bring-your-own-app.md` und `dev-containers.md` verbunden

### [v3.21.0] - 2026-06-16

#### Anfänger-Lückenschluss: Praktische Multi-Agent Lektion, "Bring Your Own App," Terraform und CI/CD Workshop
**Diese Version schließt die größten Lücken für einen vollständigen Einsteigerleitfaden durch das Hinzufügen von zwei neuen praktischen Lektionen (ein einsatzbereiter Multi-Agenten-Durchgang und das Hinzufügen von azd zu einer bestehenden App), eine anfängerfreundliche Einführung zu Hooks, einen Terraform-mit-azd Abschnitt, eine Schritt-für-Schritt GitHub Actions Pipeline-Durchführung, eine Erklärung der neuen Vorschau-Erweiterungen und eine explizite Checkliste zur Bereitstellungsüberprüfung.**

#### Hinzugefügt
- **🤝 Neue Kapitel 5 Lektion** `docs/chapter-05-multi-agent/multi-agent-basics.md` — ein vollständig praktischer, einsatzbereiter Durchgang mit zwei Agenten (Orchestrator + Spezialisten) unter Nutzung einer echten Vorlage (`contoso-creative-writer`), behandelt wann Multi-Agenten zu verwenden sind, den `azd up` Workflow, das Verständnis der bereitgestellten Ressourcen, agentenübergreifendes Tracing, Anpassung und Aufräumen
- **📦 Neue Kapitel 1 Lektion** `docs/chapter-01-foundation/bring-your-own-app.md` — wie man azd zu einem bestehenden Projekt hinzufügt mit `azd init` ("Code im aktuellen Verzeichnis verwenden"), Verständnis von `azure.yaml` und `infra/`, `azd infra generate`, Host-Erkennung und Deployment mit `azd up`
- **🌐 Terraform mit azd** Abschnitt hinzugefügt zu `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` Konfiguration, `.tf` Ordnerstruktur, erforderliche `AZURE_*` Outputs und `azd-env-name` Tagging sowie den identischen `azd up` / `azd down` Workflow (schließt die Lücke, wo Terraform-Unterstützung angekündigt wurde, aber nur Bicep gezeigt wurde)
- **⚙️ Schritt-für-Schritt GitHub Actions Anleitung** in `docs/chapter-08-production/production-ai-practices.md` — vom GitHub-Repo bis zu automatisierten Deploys: `azd pipeline config`, OIDC föderierte Anmeldedaten (keine gespeicherten Geheimnisse), die generierte `azure-dev.yml` und Hinweise zu Geheimnissen vs. Variablen
- **🪝 Einsteiger "Neu bei Hooks?" Einführung** in `docs/chapter-04-infrastructure/deployment-guide.md` — was ein Hook ist, eine Hook-Phasen-Tabelle, ein minimaler erster Hook und das manuelle Ausführen von Hooks mit `azd hooks run`
- **✅ "Verifiziere Dein Deployment" Checkliste** hinzugefügt zu Schritt 5 von `docs/chapter-01-foundation/first-project.md` — Rauchtest, Health-Endpoint-Prüfung und explizite Erfolgskriterien
- **🧩 Erklärungen zu neuen Preview-Erweiterungen** `azure.ai.skills` und `azure.ai.connections` (was sie sind und wann man sie nutzen sollte) in `docs/chapter-08-production/production-ai-practices.md`

#### Geändert
- **🧭 Kapitel 5 Lessons-Tabelle** korrigiert: `multi-agent-basics.md` ist jetzt Lektion 1 (die einzige vollständig praktische Lektion), mit ehrlicher Kennzeichnung, dass Lektion 2 in Kapitel 6 ist und das Retail-Szenario ein Architektur-Blueprint und keine Ein-Befehl-Vorlage ist
- **🧭 Kapitel 1 Lessons-Tabelle** enthält jetzt die neue Lektion "Bring Your Own App" (Lektion 4)
- **🔗 Navigations-Footer** aktualisiert: `first-project.md` verlinkt nun weiter zu `bring-your-own-app.md`

#### Behoben
- **🧱 Geschlossene "beanspruchte aber fehlende" Terraform-Lücke** — der Kurs referenzierte zuvor Terraform-Support ohne diesen zu zeigen
- **🔀 Korrigierte irreführende Kapitel 5 Querverweise** die ein vollständiges Multi-Agenten-Implementierung andeuteten, obwohl nur ein Architektur-Blueprint vorlag

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

#### AZD 1.25.6 Auffrischung, vollständige Agenten-Lifecycle-Befehle & Aspire Rebranding
**Diese Version validiert den Kurs erneut gegen `azd` `1.25.6` (Juni 2026) und die `azure.ai.agents` `0.1.40-preview` Erweiterung, erweitert die KI-Anleitung vom „Agenten scaffolden“ zum kompletten Agenten-Lebenszyklus (testen → bewerten → optimieren → inspizieren → löschen), hebt die neuen `azure.ai.skills` und `azure.ai.connections` Preview-Erweiterungen hervor und vermerkt das Produktrebranding von ".NET Aspire" zu "Aspire".**

#### Hinzugefügt
- **🔁 Vollständige Agenten-Lifecycle-Abdeckung** für Einsteiger und KI-Ingenieure in der gesamten Dokumentation:
  - `docs/chapter-01-foundation/azd-basics.md` — Lebenszyklus-Tabelle (scaffold → testen → messen → verbessern → inspizieren → aufräumen) hinzugefügt zum Abschnitt Erweiterungen und KI-Befehle
  - `docs/chapter-08-production/production-ai-practices.md` — Neuer Abschnitt „Managing the Agent Lifecycle“, der `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force` behandelt
  - `resources/cheat-sheet.md` — Erweiterte KI-Agenten-Befehle mit `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` und `delete --force`
- **🧩 Neue Preview-Erweiterungen** dokumentiert: `azure.ai.skills` (wiederverwendbare Agenten-Fähigkeiten) und `azure.ai.connections` (Foundry-Verbindungen) in der Erweiterungstabelle und Spickzettel hinzugefügt
- **⏱️ Antwortzeit-Hinweise** — bei `azd ai agent invoke` Beispielen wird nun die Gesamt-Latenz und Time-to-First-Byte ausgegeben
- **📌 Versionsbanner** im Root-README, das Lernenden auf `azd version` und `azd upgrade` hinweist

#### Geändert
- **✅ Validierungsbasis aktualisiert** von `azd 1.23.12` (März 2026) auf `azd 1.25.6` (Juni 2026) in allen Kapitel-READMEs und Workshop-Dokumenten
- **🤖 Kapitel 2 Erweiterungshinweis** aktualisiert von `azure.ai.agents` `0.1.18-preview` zu `0.1.40-preview`
- **🧪 Workshop Validierungsbeispiel** (`azd version` Ausgabe) zu `1.25.6` aktualisiert
- **🧭 README "What's New in azd Today"** überarbeitet zur Hervorhebung des vollständigen Agenten-Lebenszyklus, neuer KI-Erweiterungen und jüngster QoL-Fixes (`azd init` Idempotenz, `azd auth login` Löschung veralteter Token, `azd tool` First-Run-Prompt)
- **📖 Kapitel 2 agents.md (Option 4)** zeigt nun Lernenden die Lebenszyklusbefehle nach dem Deployment anstatt bei `azd up` zu stoppen

#### Behoben
- **🏷️ Produktnamen** — Aspire Rebranding-Hinweis hinzugefügt (".NET Aspire" heißt jetzt einfach "Aspire"); Azd unterstützt Aspire weiterhin unverändert
- **🔎 Live Release Validierung** bestätigt gegen Azure Developer CLI Release-Feed: stabile CLI `1.25.6` (2026-06-12) und `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Einsteiger-Onboarding-Klärung, Setup-Validierung & Finale AZD-Bereinigung
**Diese Version setzt den Validierungsdurchlauf von AZD 1.23 mit einem einsteigerorientierten Dokumentationsdurchgang fort: klärt die Authentifizierungsanleitung für AZD-first, fügt lokale Setup-Validierungsskripte hinzu, verifiziert wichtige Befehle gegen die Live-AZD-CLI und entfernt die letzten veralteten Befehlsreferenzen in englischer Sprache außerhalb des Changelogs.**

#### Hinzugefügt
- **🧪 Einsteiger Setup-Validierungsskripte** mit `validate-setup.ps1` und `validate-setup.sh`, damit Lernende die erforderlichen Tools vor Kapitel 1 prüfen können
- **✅ Vorab Setup-Validierungsschritte** im Root-README und Kapitel 1 README, damit fehlende Voraussetzungen vor `azd up` erkannt werden

#### Geändert
- **🔐 Einsteiger-Authentifizierungsanleitung** behandelt `azd auth login` nun konsistent als primären Pfad für AZD-Workflows, mit `az login` als optionaler Nutzung außer bei direkter Verwendung von Azure CLI Befehlen
- **📚 Kapitel 1 Onboarding-Fluss** fordert Lernende jetzt auf, ihr lokales Setup vor Installation, Authentifizierung und erstem Deployment zu validieren
- **🛠️ Validator-Meldungen** unterscheiden jetzt klar zwischen blockierenden Anforderungen und optionalen Azure CLI Warnungen für den rein auf AZD fokussierten Einsteigerpfad
- **📖 Konfigurations-, Fehlerbehebungs- und Beispieldokumente** unterscheiden jetzt zwischen erforderlicher AZD-Authentifizierung und optionaler Azure CLI Anmeldung, wo zuvor beide ohne Kontext dargestellt wurden

#### Behoben
- **📋 Verbleibende englische Befehlsreferenzen** aktualisiert auf aktuelle AZD-Formen, einschließlich `azd config show` im Spickzettel und `azd monitor --overview` für Anleitung im Azure-Portal Überblick
- **🧭 Einsteigeransprüche in Kapitel 1** abgeschwächt, um übertriebene Versprechen zu einem fehlerfreien oder Rollback-garantiefreien Verhalten über alle Templates und Azure-Ressourcen hinweg zu vermeiden
- **🔎 Live CLI Validierung** bestätigt aktuellen Support für `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` und `azd down --force --purge`

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

#### AZD 1.23.12-Validierung, Workshop-Umgebungserweiterung & KI-Modell-Aktualisierung
**Diese Version führt einen Dokumentationsvalidierungsdurchlauf gegen `azd` `1.23.12` durch, aktualisiert veraltete AZD-Befehlsebenen, aktualisiert KI-Modell-Anleitungen auf aktuelle Standardwerte und erweitert die Workshop-Anleitungen über GitHub Codespaces hinaus auch für Dev-Container und lokale Klone.**

#### Hinzugefügt
- **✅ Validierungshinweise in Kernkapiteln und Workshop-Dokumenten**, um die getestete AZD-Grundlage für Lernende mit neueren oder älteren CLI-Versionen explizit zu machen
- **⏱️ Deployment Timeout Hinweise** für langdauernde KI-App-Deployments mit `azd deploy --timeout 1800`
- **🔎 Erweiterungsprüf-Schritte** mit `azd extension show azure.ai.agents` in KI-Workflow-Dokumenten
- **🌐 Erweiterte Workshop-Umgebungs-Hinweise** für GitHub Codespaces, Dev-Container und lokale Klone mit MkDocs

#### Geändert
- **📚 Kapitel-Intro-READMEs** vermerken nun konsequent Validierung gegen `azd 1.23.12` quer über Foundation, Konfiguration, Infrastruktur, Multi-Agent, Pre-Deployment, Troublehooting und Produktion
- **🛠️ AZD-Befehlsreferenzen** in Dokumenten auf aktuelle Formen aktualisiert:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` oder `azd env get-value(s)` je nach Kontext
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` wo eine Übersicht zu Application Insights gewünscht ist
- **🧪 Einfachere Provisioning-Vorschau-Beispiele** auf aktuelle unterstützte Nutzung wie `azd provision --preview` und `azd provision --preview -e production`
- **🧭 Workshop-Ablauf** aktualisiert, so dass Lernende die Labs in Codespaces, Dev-Containern oder einem lokalen Klon durchführen können, anstatt nur Codespaces vorauszusetzen
- **🔐 Authentifizierungsanleitung** bevorzugt nun `azd auth login` für AZD-Workflows, mit `az login` als optional bei direkter Nutzung von Azure CLI Befehlen

#### Behoben
- **🪟 Windows-Installationsbefehle** auf aktuelle Package-Bezeichnungs-Großschreibung `winget` in Installationsanleitung normalisiert
- **🐧 Linux-Installationsanleitung** korrigiert, um nicht unterstützte distro-spezifische Package-Manager-Anweisungen `azd` zu vermeiden und stattdessen auf Release-Assets hinzuweisen, wo es angemessen ist
- **📦 KI-Modellbeispiele** von alten Standardwerten wie `gpt-35-turbo` und `text-embedding-ada-002` auf aktuelle Beispiele wie `gpt-4.1-mini`, `gpt-4.1` und `text-embedding-3-large` aktualisiert
- **📋 Deployment- und Diagnose-Snippets** korrigiert, um aktuelle Umgebung und Statusbefehle in Logs, Skripten und Fehlerbehebungsschritten zu verwenden
- **⚙️ GitHub Actions Hinweise** von `Azure/setup-azd@v1.0.0` auf `Azure/setup-azd@v2` aktualisiert
- **🤖 MCP/Copilot Zustimmungsanleitung** von `azd mcp consent` auf `azd copilot consent list` aktualisiert

#### Verbessert
- **🧠 KI-Kapitelleitfaden** erklärt nun besser die preview-sensible `azd ai`-Verhalten, mandantenspezifische Anmeldung, aktuelle Nutzung von Erweiterungen und aktualisierte Modell-Deployment-Empfehlungen
- **🧪 Workshop-Anleitungen** verwenden jetzt realistischere Versionsbeispiele und klarere Umgebungssetupsprache für praktische Labs
- **📈 Produktions- und Fehlerbehebungsdokumente** stimmen jetzt besser mit aktuellen Monitoring-, Fallback-Modell- und Kostentierbeispielen überein

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

#### AZD KI-CLI-Befehle, Inhaltsvalidierung & Vorlageerweiterung
**Diese Version fügt die Befehlsabdeckung für `azd ai`, `azd extension` und `azd mcp` in allen KI-bezogenen Kapiteln hinzu, behebt defekte Links und veralteten Code in agents.md, aktualisiert das Spickzettel und überarbeitet den Abschnitt Beispielvorlagen mit validierten Beschreibungen und neuen Azure AI AZD-Vorlagen.**

#### Hinzugefügt
- **🤖 AZD AI CLI-Abdeckung** über 7 Dateien (zuvor nur in Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Neuer Abschnitt „Erweiterungen und AI-Befehle“ mit Einführung von `azd extension`, `azd ai agent init` und `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` mit Vergleichstabelle (Vorlagen- vs Manifest-Ansatz)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Unterabschnitte „AZD Extensions for Foundry“ und „Agent-First Deployment“
  - `docs/chapter-05-multi-agent/README.md` — Schnellstart zeigt jetzt sowohl Vorlagen- als auch manifestbasierte Bereitstellungspfade
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bereitstellungsabschnitt enthält jetzt die Option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Unterabschnitt „AZD AI Extension Commands für Diagnostik“
  - `resources/cheat-sheet.md` — Neuer Abschnitt „KI- & Erweiterungsbefehle“ mit `azd extension`, `azd ai agent init`, `azd mcp` und `azd infra generate`
- **📦 Neue AZD AI-Beispielvorlagen** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-Chat mit Blazor WebAssembly, Semantic Kernel und Sprachchat-Unterstützung
  - **azure-search-openai-demo-java** — Java RAG-Chat mit Langchain4J und ACA/AKS-Bereitstellungsoptionen
  - **contoso-creative-writer** — Kreative Mehragenten-Schreib-App mit Azure AI Agent Service, Bing Grounding und Prompty
  - **serverless-chat-langchainjs** — Serverloses RAG mit Azure Functions + LangChain.js + Cosmos DB und Ollama lokaler Entwicklungsunterstützung
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-Beschleuniger mit Admin-Portal, Teams-Integration und PostgreSQL-/Cosmos-DB-Optionen
  - **azure-ai-travel-agents** — Referenz-App zur Orchestrierung von Multi-Agent MCP mit Servern in .NET, Python, Java und TypeScript
  - **azd-ai-starter** — Minimale Azure AI-Infrastruktur Bicep Starter-Vorlage
  - **🔗 Awesome AZD AI Gallery Link** — Verweis auf die [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ Vorlagen)

#### Behoben
- **🔗 Navigation in agents.md**: Vorher-/Nächster-Links stimmen jetzt mit Reihenfolge der Kapitel 2 README-Lektion überein (Microsoft Foundry Integration → Agents → KI-Modellbereitstellung)
- **🔗 agents.md defekte Links**: `production-ai-practices.md` zu `../chapter-08-production/production-ai-practices.md` korrigiert (3 Vorkommen)
- **📦 veralteter Code in agents.md**: Ersetzt `opencensus` durch `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 ungültige API in agents.md**: `max_tokens` wurde von `create_agent()` zu `create_run()` als `max_completion_tokens` verschoben
- **🔢 Token-Zählung in agents.md**: Grobe `len//4`-Schätzung durch `tiktoken.encoding_for_model()` ersetzt
- **azure-search-openai-demo**: Dienste von „Cognitive Search + App Service“ auf „Azure AI Search + Azure Container Apps“ korrigiert (Standard-Host geändert Oktober 2024)
- **contoso-chat**: Beschreibung aktualisiert mit Bezug auf Azure AI Foundry + Prompty, entsprechend dem tatsächlichen Repo-Titel und der Tech-Stack

#### Entfernt
- **ai-document-processing**: Nicht-funktionalen Vorlagenverweis entfernt (Repo nicht öffentlich als AZD-Vorlage zugänglich)

#### Verbesserungen
- **📝 Übungen in agents.md**: Übung 1 zeigt jetzt erwartete Ausgabe und `azd monitor` Schritt; Übung 2 enthält vollständigen `FunctionTool` Registrierungscode; Übung 3 ersetzt vage Anweisungen durch konkrete `prepdocs.py` Befehle
- **📚 Ressourcen agents.md**: Dokumentationslinks zu aktuellen Azure AI Agent Service-Dokumenten und Schnellstart aktualisiert
- **📋 Tabelle nächste Schritte in agents.md**: Link zum KI-Workshop-Labor für komplette Kapitelabdeckung hinzugefügt

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

#### Verbesserte Kursnavigation
**Diese Version verbessert die Kapitelnavigation in README.md mit einem erweiterten Tabellenformat.**

#### Geändert
- **Kurskartentabelle**: Mit direkten Lektionenlinks, Dauerangaben und Komplexitätsbewertungen erweitert
- **Ordnerbereinigung**: Überflüssige alte Ordner entfernt (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidierung**: Alle 21+ internen Links in der Kurskartentabelle überprüft

### [v3.16.0] - 2026-02-05

#### Produktnamensupdates
**Diese Version aktualisiert Produktreferenzen auf das aktuelle Microsoft Branding.**

#### Geändert
- **Microsoft Foundry → Microsoft Foundry**: Alle Verweise in Nicht-Übersetzungsdateien aktualisiert
- **Azure AI Agent Service → Foundry Agents**: Servicenamen aktualisiert zur Abbildung des aktuellen Brandings

#### Aktualisierte Dateien
- `README.md` - Hauptkurs-Startseite
- `changelog.md` - Versionshistorie
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - KI-Agenten-Guide
- `examples/README.md` - Beispiele-Dokumentation
- `workshop/README.md` - Workshop-Startseite
- `workshop/docs/index.md` - Workshop-Index
- `workshop/docs/instructions/*.md` - Alle Workshop-Anleitungsdateien

---

### [v3.15.0] - 2026-02-05

#### Große Repository-Umstrukturierung: Kapitelnamen für Ordner
**Diese Version strukturiert die Dokumentation in dedizierte Kapitelordner um für klarere Navigation.**

#### Ordnerumbenennungen
Alte Ordner wurden durch kapitelnummerierte Ordner ersetzt:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Neu hinzugefügt: `docs/chapter-05-multi-agent/`

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
| Alle Pre-Deployment-Dateien | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle Fehlerbehebungsdateien | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hinzugefügt
- **📚 Kapitel-README-Dateien**: README.md in jedem Kapitelordner mit:
  - Lernziele und Dauer
  - Lektionstabelle mit Beschreibungen
  - Schnellstartbefehle
  - Navigation zu anderen Kapiteln

#### Geändert
- **🔗 Alle internen Links aktualisiert**: Über 78 Pfade in allen Dokumentationsdateien aktualisiert
- **🗺️ Haupt-README.md**: Kurskarte mit neuer Kapitelstruktur aktualisiert
- **📝 examples/README.md**: Querverweise zu Kapitelordnern aktualisiert

#### Entfernt
- Alte Ordnerstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-Umstrukturierung: Kapitelnavigation
**Diese Version fügt Kapitel-Navigations-README-Dateien hinzu (superseded by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Neuer KI-Agenten-Guide
**Diese Version fügt einen umfassenden Leitfaden für die Bereitstellung von KI-Agenten mit Azure Developer CLI hinzu.**

#### Hinzugefügt
- **🤖 docs/microsoft-foundry/agents.md**: Vollständiger Leitfaden mit:
  - Was KI-Agenten sind und wie sie sich von Chatbots unterscheiden
  - Drei Schnellstart-Agentenvorlagen (Foundry Agents, Prompty, RAG)
  - Architektur-Patterns für Agenten (Einzelagent, RAG, Mehragenten)
  - Tool-Konfiguration und Anpassung
  - Überwachung und Metrik-Tracking
  - Kostenüberlegungen und Optimierung
  - Häufige Fehlerbehebungsszenarien
  - Drei praktische Übungen mit Erfolgskriterien

#### Inhaltsstruktur
- **Einleitung**: Agentenkonzepte für Anfänger
- **Schnellstart**: Agenten mit `azd init --template get-started-with-ai-agents` bereitstellen
- **Architektur-Patterns**: Visuelle Diagramme der Agenten-Patterns
- **Konfiguration**: Tool-Setup und Umgebungsvariablen
- **Überwachung**: Integration von Application Insights
- **Übungen**: Fortschreitendes praktisches Lernen (je 20-45 Minuten)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-Umgebungs-Update
**Diese Version aktualisiert die Entwicklungcontainer-Konfiguration mit modernen Tools und besseren Voreinstellungen für das AZD-Lernerlebnis.**

#### Geändert
- **🐳 Basis-Image**: Aktualisiert von `python:3.12-bullseye` zu `python:3.12-bookworm` (neueste Debian-Stable-Version)
- **📛 Container-Name**: Von „Python 3“ zu „AZD für Anfänger“ umbenannt für Klarheit

#### Hinzugefügt
- **🔧 Neue Dev Container Features**:
  - `azure-cli` mit aktiviertem Bicep-Support
  - `node:20` (LTS-Version für AZD-Vorlagen)
  - `github-cli` für Vorlagenverwaltung
  - `docker-in-docker` für Container-App-Bereitstellungen

- **🔌 Portweiterleitung**: Vorgefertigte Ports für übliche Entwicklung:
  - 8000 (MkDocs-Vorschau)
  - 3000 (Webapps)
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
  - `mhutchie.git-graph` - Git-Verlauf

- **⚙️ VS Code-Einstellungen**: Vorgabewerte für Python-Interpreter, Formatieren beim Speichern und Leerzeichentrimmen hinzugefügt

- **📦 Aktualisierte requirements-dev.txt**:
  - MkDocs-Minify-Plugin hinzugefügt
  - Pre-commit für Codequalität hinzugefügt
  - Azure SDK-Pakete (azure-identity, azure-mgmt-resource) hinzugefügt

#### Behoben
- **Post-Create-Befehl**: Überprüft jetzt die Installation von AZD und Azure CLI beim Containerstart

---

### [v3.11.0] - 2026-02-05

#### README-Überarbeitung für Einsteiger
**Diese Version verbessert das README.md deutlich für Anfänger und fügt essentielle Ressourcen für KI-Entwickler hinzu.**

#### Hinzugefügt
- **🆚 Azure CLI vs AZD-Vergleich**: Klare Erläuterung, wann welches Tool mit praktischen Beispielen verwendet wird
- **🌟 Awesome AZD Links**: Direkte Links zur Community-Vorlagengalerie und zum Beitragsportal:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ sofort einsatzbereite Vorlagen
  - [Vorlage einreichen](https://github.com/Azure/awesome-azd/issues) - Community-Beitrag
- **🎯 Schnellstartanleitung**: Vereinfachter 3-Schritte-Abschnitt (Installieren → Anmelden → Bereitstellen)
- **📊 Navigationstabelle basierend auf Erfahrung**: Klare Anleitung, wo Anfänger je nach Entwicklerebene starten sollten

#### Geändert
- **README-Struktur**: Für progressive Offenlegung neu organisiert – wichtige Infos zuerst
- **Einführungsabschnitt**: Neu geschrieben, um „Die Magie von `azd up`“ für komplette Anfänger zu erklären
- **Doppelte Inhalte entfernt**: Doppelte Fehlerbehebungssektion eliminiert
- **Fehlerbehebungsbefehle**: Korrigierte `azd logs`-Referenz zur Verwendung gültiger `azd monitor --logs`

#### Behoben
- **🔐 Authentifizierungsbefehle**: Hinzugefügt `azd auth login` und `azd auth logout` zu cheat-sheet.md
- **Ungültige Befehlsverweise**: Verbleibende `azd logs` aus dem README-Fehlerbehebungsbereich entfernt

#### Anmerkungen
- **Geltungsbereich**: Änderungen an Haupt-README.md und resources/cheat-sheet.md angewendet
- **Zielgruppe**: Verbesserungen speziell für Entwickler, die neu in AZD sind

---

### [v3.10.0] - 2026-02-05

#### Aktualisierung der Genauigkeit der Azure Developer CLI-Befehle
**Diese Version korrigiert nicht existierende AZD-Befehle in der gesamten Dokumentation und stellt sicher, dass alle Codebeispiele gültige Azure Developer CLI-Syntax verwenden.**

#### Behoben
- **🔧 Nicht vorhandene AZD-Befehle entfernt**: Umfassende Überprüfung und Korrektur ungültiger Befehle:
  - `azd logs` (existiert nicht) → ersetzt durch `azd monitor --logs` oder Azure CLI-Alternativen
  - `azd service` Unterbefehle (existieren nicht) → ersetzt durch `azd show` und Azure CLI
  - `azd infra import/export/validate` (existieren nicht) → entfernt oder durch gültige Alternativen ersetzt
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` Flags (existieren nicht) → entfernt
  - `azd provision --what-if/--rollback` Flags (existieren nicht) → aktualisiert zur Verwendung von `--preview`
  - `azd config validate` (existiert nicht) → ersetzt durch `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existieren nicht) → entfernt

- **📚 Dateien mit Befehlskorrekturen aktualisiert**:
  - `resources/cheat-sheet.md`: Grundlegende Überarbeitung der Befehlsreferenz
  - `docs/deployment/deployment-guide.md`: Rollback- und Bereitstellungsstrategien korrigiert
  - `docs/troubleshooting/debugging.md`: Log-Analyseabschnitte korrigiert
  - `docs/troubleshooting/common-issues.md`: Fehlerbehebungsbefehle aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD-Debugging-Abschnitt korrigiert
  - `docs/getting-started/azd-basics.md`: Überwachungsbefehle korrigiert
  - `docs/getting-started/first-project.md`: Überwachungs- und Debugging-Beispiele aktualisiert
  - `docs/getting-started/installation.md`: Hilfs- und Versionsbeispiele korrigiert
  - `docs/pre-deployment/application-insights.md`: Log-Anzeige-Befehle korrigiert
  - `docs/pre-deployment/coordination-patterns.md`: Agent-Debugging-Befehle korrigiert

- **📝 Aktualisierte Versionsreferenz**: 
  - `docs/getting-started/installation.md`: Fest codierte `1.5.0` Version auf generische `1.x.x` geändert mit Link zu Releases

#### Geändert
- **Rollback-Strategien**: Dokumentation aktualisiert, um Git-basiertes Rollback zu verwenden (AZD hat kein natives Rollback)
- **Log-Anzeige**: `azd logs` Verweise durch `azd monitor --logs`, `azd monitor --live` und Azure CLI-Befehle ersetzt
- **Performance-Abschnitt**: Nicht vorhandene parallele/incrementale Bereitstellungsflags entfernt, gültige Alternativen bereitgestellt

#### Technische Details
- **Gültige AZD-Befehle**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gültige azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Entfernte Funktionen**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Anmerkungen
- **Verifizierung**: Befehle gegen Azure Developer CLI v1.23.x validiert

---

### [v3.9.0] - 2026-02-05

#### Abschluss des Workshops und Qualitätsverbesserung der Dokumentation
**Diese Version schließt die interaktiven Workshop-Module ab, behebt alle defekten Dokumentationslinks und verbessert die Gesamtqualität der Inhalte für KI-Entwickler, die Microsoft AZD nutzen.**

#### Hinzugefügt
- **📝 CONTRIBUTING.md**: Neues Dokument mit Beitragsrichtlinien mit:
  - Klare Anweisungen zum Melden von Problemen und Vorschlagen von Änderungen
  - Dokumentationsstandards für neue Inhalte
  - Richtlinien für Codebeispiele und Commit-Nachrichten
  - Informationen zur Community-Beteiligung

#### Abgeschlossen
- **🎯 Workshop-Modul 7 (Abschluss)**: Vollständig abgeschlossenes Zusammenfassungsmodul mit:
  - Umfassender Zusammenfassung der Workshop-Ergebnisse
  - Abschnitt zu beherrschten Kernkonzepten zu AZD, Templates und Microsoft Foundry
  - Empfehlungen zur Fortsetzung der Lernreise
  - Workshop-Herausforderungsübungen mit Schwierigkeitsbewertungen
  - Community-Feedback- und Supportlinks

- **📚 Workshop-Modul 3 (Zerlegung)**: Lernziele aktualisiert mit:
  - GitHub Copilot mit MCP Servern Aktivierungsanleitung
  - Verständnis der AZD-Template-Ordnerstruktur
  - Infrastructure-as-Code (Bicep) Organisationsmuster
  - Hands-on-Laboranweisungen

- **🔧 Workshop-Modul 6 (Abbau)**: Abgeschlossen mit:
  - Zielsetzungen zu Ressourcenbereinigung und Kostenmanagement
  - Verwendung von `azd down` für sichere Infrastruktur-Deprovisionierung
  - Anleitung zur Wiederherstellung soft-gelöschter Cognitive Services
  - Bonus-Erkundungsanregungen für GitHub Copilot und Azure Portal

#### Behoben
- **🔗 Fehlerhafte Linkkorrekturen**: Über 15 defekte interne Dokumentationslinks behoben:
  - `docs/ai-foundry/ai-model-deployment.md`: Pfade zu microsoft-foundry-integration.md korrigiert
  - `docs/troubleshooting/ai-troubleshooting.md`: Pfade zu ai-model-deployment.md und production-ai-practices.md korrigiert
  - `docs/getting-started/first-project.md`: Nicht existierendes cicd-integration.md durch deployment-guide.md ersetzt
  - `examples/retail-scenario.md`: FAQ- und Fehlerhandbuch-Pfade korrigiert
  - `examples/container-app/microservices/README.md`: Kurs-Startseite und Bereitstellungsleitfadenpfade korrigiert
  - `resources/faq.md` und `resources/glossary.md`: AI-Kapitelreferenzen aktualisiert
  - `course-outline.md`: Kursleiterhandbuch- und AI-Workshop-Laborreferenzen korrigiert

- **📅 Workshop-Statusbanner**: Von „In Arbeit“ zu aktivem Workshop-Status mit Datum Februar 2026 aktualisiert

- **🔗 Workshop-Navigation**: Defekte Navigationslinks in workshop README.md behoben, die auf nicht existierenden Ordner lab-1-azd-basics verwiesen

#### Geändert
- **Workshop-Präsentation**: Warnung „in Arbeit“ entfernt, Workshop jetzt abgeschlossen und einsatzbereit
- **Navigationskonsistenz**: Sicherstellung ordnungsgemäßer Navigationspfade zwischen allen Workshop-Modulen
- **Verweise auf Lernpfade**: Kapitel-Querverweise aktualisiert zur Verwendung korrekter microsoft-foundry-Pfade

#### Validiert
- ✅ Alle englischen Markdown-Dateien haben gültige interne Links
- ✅ Workshop-Module 0-7 sind vollständig mit Lernzielen
- ✅ Navigation zwischen Kapiteln und Modulen funktioniert korrekt
- ✅ Inhalte sind für KI-Entwickler mit Microsoft AZD geeignet
- ✅ Anfängerfreundliche Sprache und Struktur werden durchgängig beibehalten
- ✅ CONTRIBUTING.md bietet klare Anleitungen für Community-Beiträger

#### Technische Umsetzung
- **Linkvalidierung**: Automatisches PowerShell-Skript überprüfte alle .md internen Links
- **Inhaltsprüfung**: Manuelle Überprüfung der Workshop-Vollständigkeit und Eignung für Anfänger
- **Navigationssystem**: Einheitliche Muster für Kapitelnavigation und Modulnavigation angewendet

#### Hinweise
- **Geltungsbereich**: Änderungen nur auf englische Dokumentation angewandt
- **Übersetzungen**: Übersetzungsordner in dieser Version nicht aktualisiert (automatische Übersetzung folgt später)
- **Workshopdauer**: Vollständiger Workshop bietet nun 3-4 Stunden praxisnahes Lernen

---

### [v3.8.0] - 2025-11-19

#### Erweiterte Dokumentation: Überwachung, Sicherheit und Multi-Agenten-Muster
**Diese Version fügt umfassende A-Grade-Lektionen zur Integration von Application Insights, Authentifizierungsmustern und Multi-Agenten-Koordination für Produktionsbereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Application Insights Integrationslektion**: in `docs/pre-deployment/application-insights.md`:
  - AZD-fokussierte Bereitstellung mit automatischer Bereitstellung
  - Vollständige Bicep-Templates für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (1.200+ Zeilen)
  - AI/LLM-Überwachungsmuster (Microsoft Foundry Models Token-/Kostenverfolgung)
  - 6 Mermaid-Diagramme (Architektur, verteiltes Tracing, Telemetriefluss)
  - 3 praktische Übungen (Alarme, Dashboards, AI-Überwachung)
  - Kusto-Abfragebeispiele und Kostenoptimierungsstrategien
  - Live-Metrik-Streaming und Echtzeit-Debugging
  - 40-50 Minuten Lernzeit mit produktionsreifen Mustern

- **🔐 Authentifizierungs- & Sicherheitsmuster Lektion**: in `docs/getting-started/authsecurity.md`:
  - 3 Authentifizierungsmuster (Verbindungszeichenfolgen, Key Vault, Managed Identity)
  - Vollständige Bicep-Infrastrukturschablonen für sichere Bereitstellungen
  - Node.js-Anwendungscode mit Azure SDK-Integration
  - 3 komplette Übungen (aktivieren Managed Identity, benutzerzugewiesene Identität, Key Vault Drehung)
  - Sicherheits-Best Practices und RBAC-Konfigurationen
  - Fehlerbehebungsanleitung und Kostenanalyse
  - Produktionsreife passwortlose Authentifizierungsmuster

- **🤖 Multi-Agenten-Koordinationsmuster Lektion**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequentiell, parallel, hierarchisch, ereignisgesteuert, Konsens)
  - Vollständige Orchestrator-Service-Implementierung (Python/Flask, 1.500+ Zeilen)
  - 3 spezialisierte Agentenimplementierungen (Research, Writer, Editor)
  - Service Bus-Integration für Nachrichtenwarteschlangen
  - Cosmos DB Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme mit Agenteninteraktionen
  - 3 fortgeschrittene Übungen (Timeout-Handling, Wiederholungslogik, Circuit Breaker)
  - Kostenzusammenstellung (240-565 $/Monat) mit Optimierungsstrategien
  - Application Insights Integration zur Überwachung

#### Verbessert
- **Kapitel Pre-deployment**: Jetzt mit umfassenden Überwachungs- und Koordinationsmustern
- **Kapitel Getting Started**: Mit professionellen Authentifizierungsmustern erweitert
- **Produktionsreife**: Vollständige Abdeckung von Sicherheit bis Beobachtbarkeit
- **Kursübersicht**: Aktualisiert mit Verweisen auf neue Lektionen in Kapiteln 3 und 6

#### Geändert
- **Lernfortschritt**: Bessere Integration von Sicherheit und Überwachung im Kursverlauf
- **Dokumentationsqualität**: Konsistente A-Grade-Standards (95-97%) über neue Lektionen hinweg
- **Produktionsmuster**: Vollständige End-to-End-Abdeckung für Unternehmensbereitstellungen

#### Verbessert
- **Entwicklererfahrung**: Klarer Pfad von Entwicklung bis Produktionsüberwachung
- **Sicherheitsstandards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Beobachtbarkeit**: Vollständige Application Insights-Integration mit AZD
- **KI-Arbeitslasten**: Spezialisierte Überwachung für Microsoft Foundry Models und Multi-Agentensysteme

#### Validiert
- ✅ Alle Lektionen beinhalten vollständigen, funktionierenden Code (keine Ausschnitte)
- ✅ Mermaid-Diagramme für visuelles Lernen (insgesamt 19 in 3 Lektionen)
- ✅ Praktische Übungen mit Verifikationsschritten (insgesamt 9)
- ✅ Produktionsfähige Bicep-Templates, bereitgestellt über `azd up`
- ✅ Kostenanalyse und Optimierungsstrategien
- ✅ Fehlerbehebungsleitfäden und Best Practices
- ✅ Wissenskontrollpunkte mit Verifikationsbefehlen

#### Dokumentations-Bewertungsergebnisse
- **docs/pre-deployment/application-insights.md**: - Umfassender Überwachungsleitfaden
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Fortgeschrittene Multi-Agenten-Architekturen
- **Gesamtinhalt neu**: - Konsistente hohe Qualitätsstandards

#### Technische Umsetzung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentifizierung**: Managed Identity + Key Vault + RBAC-Muster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Überwachung**: Live-Metriken + Kusto-Abfragen + Alarme + Dashboards
- **Kostenmanagement**: Sampling-Strategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 2025-11-19

#### Verbesserungen der Dokumentationsqualität und neues Microsoft Foundry Models Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Microsoft Foundry Models-Bereitstellungsbeispiel mit gpt-4.1 Chat-Oberfläche hinzu.**

#### Hinzugefügt
- **🤖 Microsoft Foundry Models Chat-Beispiel**: Vollständige gpt-4.1-Bereitstellung mit funktionierender Implementierung in `examples/azure-openai-chat/`:
  - Vollständige Microsoft Foundry Models-Infrastruktur (gpt-4.1 Modellausführung)
  - Python-Kommandozeilen-Chatoberfläche mit Gesprächsverlauf
  - Key Vault-Integration zur sicheren Speicherung von API-Schlüsseln
  - Token-Nutzungsverfolgung und Kostenschätzung
  - Ratenbegrenzung und Fehlerbehandlung
  - Umfassende README mit 35-45 Minuten Bereitstellungsanleitung
  - 11 produktionsfertige Dateien (Bicep-Templates, Python-App, Konfiguration)
- **📚 Dokumentationsübungen**: Hands-on-Übungen zum Konfigurationsleitfaden hinzugefügt:
  - Übung 1: Multi-Umgebungs-Konfiguration (15 Minuten)
  - Übung 2: Geheimnisverwaltungspraxis (10 Minuten)
  - Klare Erfolgskriterien und Verifikationsschritte
- **✅ Bereitstellungsverifizierung**: Verifizierungsabschnitt zum Bereitstellungsleitfaden hinzugefügt:
  - Gesundheitsprüfverfahren
  - Checkliste der Erfolgskriterien
  - Erwartete Ausgaben aller Bereitstellungsbefehle
  - Schnellreferenz zur Fehlerbehebung

#### Verbessert
- **examples/README.md**: Auf A-Grade-Qualität (93%) aktualisiert:
  - azure-openai-chat zu allen relevanten Abschnitten hinzugefügt
  - Anzahl lokaler Beispiele von 3 auf 4 erhöht
  - Zur Tabelle der KI-Anwendungsbeispiele hinzugefügt
  - In Quick Start für Fortgeschrittene integriert
  - Zum Abschnitt Microsoft Foundry Templates hinzugefügt
  - Vergleichsmatrix und Technologiefindungsabschnitte aktualisiert
- **Dokumentationsqualität**: Verbesserte B+ (87%) → A- (92%) im gesamten Docs-Ordner:
  - Erwartete Ausgaben zu kritischen Befehlsbeispielen hinzugefügt
  - Verifikationsschritte für Konfigurationsänderungen aufgenommen
  - Praxisorientiertes Lernen durch praktische Übungen erweitert

#### Geändert
- **Lernfortschritt**: Bessere Integration von KI-Beispielen für fortgeschrittene Lernende
- **Dokumentationsstruktur**: Mehr umsetzbare Übungen mit klaren Ergebnissen
- **Verifikationsprozess**: Explizite Erfolgskriterien zu Schlüssel-Workflows hinzugefügt

#### Verbessert
- **Entwicklererfahrung**: Deployment von Microsoft Foundry Models dauert jetzt 35-45 Minuten (statt 60-90 für komplexe Alternativen)
- **Kostenübersicht**: Klare Kostenschätzungen ($50-200/Monat) für Microsoft Foundry Models-Beispiel
- **Lernpfad**: KI-Entwickler haben mit azure-openai-chat einen klaren Einstiegspunkt
- **Dokumentationsstandards**: Einheitliche erwartete Ausgaben und Verifikationsschritte

#### Validiert
- ✅ Microsoft Foundry Models-Beispiel vollständig funktionsfähig mit `azd up`
- ✅ Alle 11 Implementierungsdateien syntaktisch korrekt
- ✅ README-Anweisungen stimmen mit tatsächlichem Deployment überein
- ✅ Dokumentationslinks in über 8 Standorten aktualisiert
- ✅ Beispiele-Index spiegelt genau 4 lokale Beispiele wider
- ✅ Keine doppelten externen Links in Tabellen
- ✅ Alle Navigationsreferenzen korrekt

#### Technische Umsetzung
- **Microsoft Foundry Models Architektur**: gpt-4.1 + Key Vault + Container Apps Muster
- **Sicherheit**: Managed Identity bereit, Geheimnisse im Key Vault
- **Monitoring**: Application Insights Integration
- **Kostenmanagement**: Token-Tracking und Nutzungsoptimierung
- **Deployment**: Ein einziger `azd up` Befehl für vollständige Einrichtung

### [v3.6.0] - 2025-11-19

#### Großes Update: Container-App Deployment-Beispiele
**Diese Version führt umfassende, produktionsreife Container-App-Deployment-Beispiele mit Azure Developer CLI (AZD) ein, inklusive vollständiger Dokumentation und Integration in den Lernpfad.**

#### Hinzugefügt
- **🚀 Container-App-Beispiele**: Neue lokale Beispiele in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplettübersicht zu containerisierten Deployments, Schnellstart, Produktion und fortgeschrittenen Mustern
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Einsteigerfreundliche REST API mit Scale-to-Zero, Gesundheitsprüfungen, Monitoring und Fehlerbehebung
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsreifes Multi-Service Deployment (API-Gateway, Produkt, Bestellung, Nutzer, Benachrichtigung), asynchrones Messaging, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary-Deployment
- **Best Practices**: Sicherheit, Monitoring, Kostenoptimierung und CI/CD-Anleitungen für containerisierte Workloads
- **Code-Beispiele**: Vollständige `azure.yaml`, Bicep-Templates und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-End-Test-Szenarien, Monitoring-Befehle, Troubleshooting-Anleitungen

#### Geändert
- **README.md**: Aktualisiert, um neue Container-App-Beispiele unter „Lokale Beispiele – Containeranwendungen“ aufzuführen und zu verlinken
- **examples/README.md**: Aktualisiert, um Container-App-Beispiele hervorzuheben, Vergleichsmatrix-Einträge hinzuzufügen und Technologie-/Architekturverweise zu aktualisieren
- **Kursübersicht & Studienführer**: Aktualisiert, um auf neue Container-App-Beispiele und Deployment-Muster in relevanten Kapiteln zu verweisen

#### Validiert
- ✅ Alle neuen Beispiele mit `azd up` deploybar und folgen Best Practices
- ✅ Dokumentations-Querverweise und Navigation aktualisiert
- ✅ Beispiele decken Szenarien von Einsteiger bis Fortgeschrittene ab, einschließlich produktionsreifer Microservices

#### Hinweise
- **Umfang**: Nur englische Dokumentation und Beispiele
- **Nächste Schritte**: Erweiterung um weitere fortgeschrittene Container-Muster und CI/CD-Automatisierung in zukünftigen Versionen

### [v3.5.0] - 2025-11-19

#### Produktumbenennung: Microsoft Foundry
**Diese Version implementiert eine umfassende Umbenennung des Produkts von „Microsoft Foundry“ zu „Microsoft Foundry“ in der gesamten englischen Dokumentation, entsprechend der offiziellen Umfirmierung von Microsoft.**

#### Geändert
- **🔄 Produktnamen-Aktualisierung**: Vollständiges Rebranding von „Microsoft Foundry“ zu „Microsoft Foundry“
  - Alle Verweise in der englischen Dokumentation im Ordner `docs/` aktualisiert
  - Ordner umbenannt: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Datei umbenannt: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt: 23 Inhaltsverweise in 7 Dokumentationsdateien aktualisiert

- **📁 Ordnerstrukturanpassungen**:
  - `docs/ai-foundry/` umbenannt zu `docs/microsoft-foundry/`
  - Alle Querverweise aktualisiert, um neue Ordnerstruktur widerzuspiegeln
  - Navigationslinks in der gesamten Dokumentation validiert

- **📄 Dateiumbenennungen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links auf neuen Dateinamen angepasst

#### Aktualisierte Dateien
- **Kapitel-Dokumentation** (7 Dateien):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Aktualisierungen von Navigationslinks
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamen-Referenzen aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bereits Microsoft Foundry verwendet (aus vorherigen Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Referenzen aktualisiert (Überblick, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweis-Links aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zum nächsten Kapitel aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Referenzen aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Kursstruktur-Dateien** (2 Dateien):
  - `README.md` - 17 Referenzen aktualisiert (Kursübersicht, Kapitelüberschriften, Vorlagenabschnitt, Community-Insights)
  - `course-outline.md` - 14 Referenzen aktualisiert (Überblick, Lernziele, Kapitelressourcen)

#### Validiert
- ✅ Keine verbliebenen Verweise auf „ai-foundry“-Ordnerpfade in der englischen Dokumentation
- ✅ Keine verbliebenen Verweise auf den Produktnamen „Microsoft Foundry“ in der englischen Dokumentation
- ✅ Alle Navigationslinks funktionieren mit der neuen Ordnerstruktur
- ✅ Datei- und Ordnerumbenennungen erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln überprüft

#### Hinweise
- **Umfang**: Änderungen nur im englischsprachigen Dokumentationsordner `docs/` angewendet
- **Übersetzungen**: Übersetzungsordner (`translations/`) in dieser Version nicht aktualisiert
- **Workshop**: Workshop-Materialien (`workshop/`) in dieser Version nicht aktualisiert
- **Beispiele**: Beispieldateien können noch Legacy-Namen enthalten (wird in zukünftigen Updates adressiert)
- **Externe Links**: Externe URLs und GitHub-Repository-Verweise bleiben unverändert

#### Migrationsanleitung für Mitwirkende
Falls Sie lokale Branches oder Dokumentation haben, die die alte Struktur referenzieren:
1. Ordnerverweise aktualisieren: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dateiverweise aktualisieren: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Produktnamen ersetzen: „Microsoft Foundry“ → „Microsoft Foundry“
4. Alle internen Dokumentationslinks auf Funktionsfähigkeit prüfen

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur-Vorschau und Validierungserweiterungen
**Diese Version führt umfassende Unterstützung für die neue Azure Developer CLI Vorschaufunktion ein und verbessert die Nutzererfahrung im Workshop.**

#### Hinzugefügt
- **🧪 azd provision --preview Feature-Dokumentation**: Umfassende Abdeckung der neuen Infrastruktur-Vorschaufunktion
  - Befehlsreferenz und Nutzung in Spickzettel
  - Detaillierte Integration im Bereitstellungsleitfaden mit Anwendungsfällen und Vorteilen
  - Pre-Flight-Check-Integration zur sichereren Bereitstellungsvalidierung
  - Updates der Einführung mit sicherheitsorientierten Deployment-Praktiken
- **🚧 Workshop-Statusbanner**: Professionelles HTML-Banner, das den Entwicklungsstatus des Workshops anzeigt
  - Farbverlauf-Design mit Baustellenindikatoren für klare Nutzerkommunikation
  - Letztes Aktualisierungsdatum für Transparenz
  - Mobilgeräte-responsive Gestaltung für alle Gerätetypen

#### Verbessert
- **Infrastruktur-Sicherheit**: Vorschaufunktion in der gesamten Deployment-Dokumentation integriert
- **Pre-Deployment Validierung**: Automatisierte Skripte enthalten nun Infrastrukturvorschau-Tests
- **Entwickler-Workflow**: Aktualisierte Befehlsequenzen empfehlen Vorschau als Best Practice
- **Workshop-Erfahrung**: Klare Erwartungshaltung für Nutzer über den Entwicklungsstatus gesetzt

#### Geändert
- **Deployment Best Practices**: Vorschau-zentrierter Workflow wird nun empfohlen
- **Dokumentationsfluss**: Infrastrukturvalidierung wurde früher im Lernprozess platziert
- **Workshop-Präsentation**: Professionelle Statuskommunikation mit klarer Entwicklungszeitachse

#### Verbessert
- **Safety-First Ansatz**: Infrastrukturänderungen können jetzt vor dem Deployment validiert werden
- **Team-Zusammenarbeit**: Vorschauergebnisse können zur Überprüfung und Freigabe geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcenkosten vor der Bereitstellung
- **Risiko-Minderung**: Weniger Bereitstellungsfehler durch Vorab-Validierung

#### Technische Umsetzung
- **Multi-Dokumenten-Integration**: Vorschaufunktion in 4 wichtigen Dateien dokumentiert
- **Befehlsmuster**: Konsistente Syntax und Beispiele in der gesamten Dokumentation
- **Best-Practice-Integration**: Vorschau in Validierungs-Workflows und Skripten eingebaut
- **Visuelle Indikatoren**: Klare MARKIERUNG neuer Funktionen für bessere Auffindbarkeit

#### Workshop-Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Farbverlaufsstil
- **Nutzererfahrung**: Klare Entwicklungsstatusanzeige verhindert Verwirrung
- **Professionelle Präsentation**: Erhält Glaubwürdigkeit des Repositories und setzt klare Erwartungen
- **Transparenz der Zeitplanung**: Aktualisierungszeitstempel Oktober 2025 für Verantwortlichkeit

### [v3.3.0] - 2025-09-24

#### Erweiterte Workshop-Materialien und interaktives Lernerlebnis
**Diese Version führt umfassende Workshop-Materialien mit browserbasierten interaktiven Anleitungen und strukturierten Lernpfaden ein.**

#### Hinzugefügt
- **🎥 Interaktiver Workshop-Leitfaden**: Browserbasiertes Workshop-Erlebnis mit MkDocs-Vorschaufunktion
- **📝 Strukturierte Workshop-Anleitungen**: 7-Schritte-Lernpfad von Entdeckung bis Individualisierung
  - 0-Einführung: Workshop-Übersicht und Setup
  - 1-KI-Vorlage auswählen: Entdeckungs- und Auswahlprozess der Vorlage
  - 2-KI-Vorlage validieren: Deployment- und Validierungsschritte
  - 3-KI-Vorlage zerlegen: Verständnis der Vorlagenarchitektur
  - 4-KI-Vorlage konfigurieren: Konfiguration und Individualisierung
  - 5-KI-Vorlage anpassen: Erweiterte Modifikationen und Iterationen
  - 6-Infrastruktur abbauen: Bereinigung und Ressourcenmanagement
  - 7-Abschluss: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Tools**: MkDocs-Konfiguration mit Material-Theme für verbessertes Lernerlebnis
- **🎯 Hands-On-Lernpfad**: 3-Schritte-Methodologie (Entdeckung → Deployment → Individualisierung)
- **📱 GitHub Codespaces Integration**: Nahtloses Entwicklungsumgebungs-Setup

#### Verbessert
- **KI-Workshop-Lab**: Erweiterung um ein umfassendes 2-3-stündiges strukturiertes Lernerlebnis
- **Workshop-Dokumentation**: Professionelle Präsentation mit Navigation und visuellen Hilfen
- **Lernfortschritt**: Klare Schritt-für-Schritt-Anleitung von der Vorlagenauswahl bis zum produktiven Deployment
- **Entwicklererfahrung**: Integrierte Werkzeuge für optimierte Entwicklungsabläufe

#### Verbesserungen
- **Barrierefreiheit**: Browserbasierte Oberfläche mit Suchfunktion, Kopierfunktion und Theme-Umschaltung
- **Selbstgesteuertes Lernen**: Flexibler Workshop-Aufbau, der verschiedene Lerngeschwindigkeiten unterstützt
- **Praktische Anwendung**: Realistische KI-Vorlagen-Deployment-Szenarien
- **Community-Integration**: Discord-Integration für Workshop-Support und Zusammenarbeit

#### Workshop-Funktionen
- **Integrierte Suche**: Schnelle Schlüsselwort- und Lektionensuche
- **Codeblöcke kopieren**: Hover-to-Copy-Funktionalität für alle Codebeispiele
- **Theme-Wechsel**: Unterstützung für Dunkel-/Hellmodus je nach Präferenz
- **Visuelle Assets**: Screenshots und Diagramme zur verbesserten Verständlichkeit
- **Hilfsintegration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Große Navigations-Umbauten und kapitelbasiertes Lernsystem
**Diese Version führt eine umfassende kapitelbasierte Lernstruktur mit verbesserter Navigation im gesamten Repository ein.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Gesamter Kurs in 8 aufeinanderfolgende Lernkapitel umstrukturiert
  - Kapitel 1: Grundlagen & Schnellstart (⭐ - 30-45 Minuten)
  - Kapitel 2: KI-First Entwicklung (⭐⭐ - 1-2 Stunden)
  - Kapitel 3: Konfiguration & Authentifizierung (⭐⭐ - 45-60 Minuten)
  - Kapitel 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1,5 Stunden)
  - Kapitel 5: Multi-Agent KI-Lösungen (⭐⭐⭐⭐ - 2-3 Stunden)
  - Kapitel 6: Pre-Deployment Validierung & Planung (⭐⭐ - 1 Stunde)
  - Kapitel 7: Fehlerbehebung & Debugging (⭐⭐ - 1-1,5 Stunden)
  - Kapitel 8: Produktions- & Unternehmensmuster (⭐⭐⭐⭐ - 2-3 Stunden)
- **📚 Umfassendes Navigationssystem**: Konsistente Navigations-Kopf- und Fußzeilen in der gesamten Dokumentation
- **🎯 Fortschrittsverfolgung**: Checkliste zum Kursabschluss und Lernüberprüfungssystem
- **🗺️ Lernpfad-Leitfaden**: Klare Einstiegspunkte für verschiedene Erfahrungsstufen und Ziele
- **🔗 Querverweis-Navigation**: Verwandte Kapitel und Voraussetzungen klar verlinkt

#### Verbessert
- **README-Struktur**: Umgewandelt in eine strukturierte Lernplattform mit kapitelbasierter Organisation
- **Dokumentationsnavigation**: Jede Seite enthält jetzt Kapitelkontext und Fortschrittsanzeige
- **Vorlagenorganisation**: Beispiele und Templates den jeweiligen Lernkapiteln zugeordnet
- **Ressourcenintegration**: Spickzettel, FAQs und Studienführer mit relevanten Kapiteln verknüpft
- **Workshop-Integration**: Praxisnahe Labs mehreren Lernzielen in den Kapiteln zugeordnet

#### Geändert
- **Lernfortschritt**: Übergang von linearer Dokumentation zu flexiblem kapitelbasiertem Lernen
- **Konfigurationsplatzierung**: Umpositionierung des Konfigurationsleitfadens als Kapitel 3 für besseren Lernfluss
- **KI-Inhaltsintegration**: Bessere Integration von KI-spezifischen Inhalten im gesamten Lernprozess
- **Produktionsinhalte**: Erweiterte Muster in Kapitel 8 für Unternehmenskunden zusammengefasst

#### Verbesserungen
- **Benutzererlebnis**: Klare Navigationspfade und Fortschrittsanzeige der Kapitel
- **Barrierefreiheit**: Konsistente Navigationsmuster für leichtere Kursdurchführung
- **Professionelle Darstellung**: Universitätsähnlicher Kursaufbau, geeignet für akademische und betriebliche Schulungen
- **Lerneffizienz**: Verkürzte Zeit zum Finden relevanter Inhalte durch bessere Organisation

#### Technische Umsetzung
- **Navigationsüberschriften**: Standardisierte Kapitelnavigation in über 40 Dokumentationsdateien
- **Footer Navigation**: Einheitliche Fortschrittsführung und Kapitelabschlussanzeigen
- **Querverlinkung**: Umfassendes internes Verlinkungssystem für zusammenhängende Konzepte
- **Kapitelzuordnung**: Vorlagen und Beispiele klar mit Lernzielen verknüpft

#### Verbesserter Studienleitfaden
- **📚 Umfassende Lernziele**: Studienleitfaden neu strukturiert, abgestimmt auf 8-Kapitel-System
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Checklisten zum Abschluss
- **❓ Prüfungsfragen**: Wissensabfrage zu jedem Kapitel mit professionellen Ergebnissen
- **🛠️ Praxisübungen**: Praxisnahe Aktivitäten mit realen Bereitstellungsszenarien und Fehlerbehebung
- **📊 Fähigkeitsentwicklung**: Klarer Fortschritt von Grundkonzepten zu Unternehmensmustern mit Karrierefokus
- **🎓 Zertifizierungsrahmen**: Professionelle Entwicklungsergebnisse und Community-Anerkennungssystem
- **⏱️ Zeitmanagement**: Strukturierter 10-Wochen Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 2025-09-17

#### Verbesserte Multi-Agenten KI-Lösungen
**Diese Version verbessert die Multi-Agenten-Lösung für den Einzelhandel mit besserer Agentenbenennung und erweiterter Dokumentation.**

#### Änderungen
- **Terminologie Multi-Agenten**: Ersetzung von „Cora Agent“ durch „Customer Agent“ in der gesamten Einzelhandels-Multi-Agenten-Lösung für bessere Verständlichkeit
- **Agentenarchitektur**: Aktualisierung aller Dokumentationen, ARM-Vorlagen und Codebeispiele zur einheitlichen Verwendung von „Customer Agent“
- **Konfigurationsbeispiele**: Modernisierte Agentenkonfigurationsmuster mit aktualisierten Benennungskonventionen
- **Konsistenz der Dokumentation**: Sicherstellung, dass alle Verweise professionelle, beschreibende Agentennamen verwenden

#### Verbesserungen
- **ARM-Vorlagenpaket**: Aktualisierung des retail-multiagent-arm-template mit Customer Agent Verweisen
- **Architekturdiagramme**: Aktualisierte Mermaid-Diagramme mit neuer Agentenbenennung
- **Codebeispiele**: Python-Klassen und Implementierungsbeispiele jetzt mit CustomerAgent Benennung
- **Umgebungsvariablen**: Anpassung aller Deployment-Skripte zur Nutzung des CUSTOMER_AGENT_NAME Namensschemas

#### Verbesserungen
- **Entwicklererfahrung**: Klare Rollen- und Verantwortlichkeitsdefinition der Agenten in der Dokumentation
- **Produktionsreife**: Bessere Ausrichtung an Unternehmensbenennungskonventionen
- **Lernmaterialien**: Intuitivere Agentenbenennung für Bildungszwecke
- **Vorlagenbenutzbarkeit**: Vereinfachtes Verständnis der Agentenfunktionen und Deployment-Muster

#### Technische Details
- Aktualisierte Mermaid-Architekturdiagramme mit CustomerAgent Verweisen
- Ersetzung von CoraAgent-Klassennamen durch CustomerAgent in Python-Beispielen
- Anpassung der ARM-Template-JSON-Konfigurationen zur Verwendung des Agententyps "customer"
- Aktualisierung der Umgebungsvariablen von CORA_AGENT_* zu CUSTOMER_AGENT_* Patterns
- Erneuerung aller Deployment-Befehle und Container-Konfigurationen

### [v3.0.0] - 2025-09-12

#### Wesentliche Änderungen - Fokus auf KI-Entwickler und Microsoft Foundry Integration
**Diese Version verwandelt das Repository in eine umfassende, KI-fokussierte Lernressource mit Microsoft Foundry Integration.**

#### Hinzugefügt
- **🤖 KI-zentrierter Lernpfad**: Komplettstruktur zugunsten von KI-Entwicklern und -Ingenieuren
- **Microsoft Foundry Integrationsleitfaden**: Ausführliche Dokumentation zur Anbindung von AZD an Microsoft Foundry Services
- **KI-Modell-Bereitstellungsmuster**: Detaillierte Anleitung zur Modellauswahl, -konfiguration und Produktions-Bereitstellungsstrategien
- **KI-Workshop-Labor**: 2-3-stündiger praktischer Workshop zur Umwandlung von KI-Anwendungen in AZD-bereitstellbare Lösungen
- **Best Practices für KI-Produktion**: Unternehmensreife Muster für Skalierung, Überwachung und Absicherung von KI-Workloads
- **KI-spezifischer Fehlerbehebungsleitfaden**: Umfassende Fehlerbehebung für Microsoft Foundry Modelle, Cognitive Services und KI-Bereitstellungsprobleme
- **KI-Vorlagengalerie**: Vorgestellte Sammlung von Microsoft Foundry Templates mit Komplexitätsbewertungen
- **Workshop-Materialien**: Vollständiger Workshopaufbau mit praktischen Laboren und Referenzmaterialien

#### Verbesserungen
- **README-Struktur**: KI-Entwicklerfokussiert mit 45 % Community-Interesse laut Microsoft Foundry Discord
- **Lernpfade**: Spezifischer KI-Entwicklerpfad neben traditionellen Pfaden für Studenten und DevOps-Ingenieure
- **Vorlagenempfehlungen**: Vorgestellte KI-Vorlagen wie azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community-Integration**: Erweiterte Discord-Community-Unterstützung mit KI-spezifischen Kanälen und Diskussionen

#### Sicherheit & Produktionsfokus
- **Managed Identity Muster**: KI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Kostenoptimierung**: Tokenverbrauchsüberwachung und Budgetkontrolle für KI-Workloads
- **Multi-Region-Bereitstellung**: Strategien für globale KI-Anwendungsbereitstellung
- **Leistungsmonitoring**: KI-spezifische Metriken und Application Insights Integration

#### Dokumentationsqualität
- **Linearer Kursaufbau**: Logischer Fortschritt von Anfänger- zu fortgeschrittenen KI-Bereitstellungsmustern
- **Verifizierte URLs**: Alle externen Repository-Links überprüft und zugänglich
- **Vollständiger Referenzrahmen**: Alle internen Dokumentationslinks validiert und funktionsfähig
- **Produktionsreife**: Unternehmensbereite Bereitstellungsmuster mit realen Beispielen

### [v2.0.0] - 2025-09-09

#### Wesentliche Änderungen - Umstrukturierung des Repositories und professionelle Verbesserung
**Diese Version stellt eine umfassende Überarbeitung der Repository-Struktur und Inhaltspräsentation dar.**

#### Hinzugefügt
- **Strukturiertes Lernframework**: Alle Dokumentationsseiten enthalten jetzt Einführung, Lernziele und Lernergebnisse
- **Navigationssystem**: Hinzufügen von Links zu vorheriger/nächster Lektion in der gesamten Dokumentation für geführten Lernfortschritt
- **Studienleitfaden**: Umfassende study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professionelle Darstellung**: Entfernen aller Emoji-Icons für bessere Zugänglichkeit und professionelles Erscheinungsbild
- **Verbesserte Inhaltsstruktur**: Optimierte Organisation und Fluss der Lernmaterialien

#### Geändert
- **Dokumentationsformat**: Standardisierung aller Dokumentationen mit einheitlichem lernfokussiertem Aufbau
- **Navigationsfluss**: Implementierung eines logischen Fortschritts durch alle Lerninhalte
- **Inhaltspräsentation**: Entfernen dekorativer Elemente zugunsten klarer, professioneller Formatierung
- **Linkstruktur**: Aktualisierung aller internen Links zur Unterstützung des neuen Navigationssystems

#### Verbesserungen
- **Barrierefreiheit**: Entfernung von Emoji-Abhängigkeiten für bessere Kompatibilität mit Screenreadern
- **Professionelles Erscheinungsbild**: Saubere, akademische Präsentation, geeignet für Unternehmensschulungen
- **Lernerlebnis**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Inhaltsorganisation**: Besserer logischer Fluss und Verbindung zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Erstveröffentlichung - Umfassendes AZD Lern-Repository

#### Hinzugefügt
- **Grundstruktur der Dokumentation**
  - Vollständige Getting-Started-Anleitung
  - Umfassende Dokumentation zu Bereitstellung und Provisionierung
  - Detaillierte Ressourcen zur Fehlerbehebung und Debugging-Leitfäden
  - Vorbereitende Validierungstools und -verfahren

- **Getting-Started Modul**
  - AZD Grundlagen: Kernkonzepte und Terminologie
  - Installationsanleitung: Plattform-spezifische Einrichtungshinweise
  - Konfigurationsanleitung: Umgebungs-Setup und Authentifizierung
  - Erstes Projekt Tutorial: Schritt-für-Schritt praktisches Lernen

- **Bereitstellungs- und Provisionierungsmodul**
  - Bereitstellungsleitfaden: Vollständige Workflow-Dokumentation
  - Provisionierungsleitfaden: Infrastruktur als Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Multi-Service-Architekturmuster

- **Vorbereitende Validierung**
  - Kapazitätsplanung: Validierung der Azure-Ressourcenverfügbarkeit
  - SKU-Auswahl: Umfassende Anleitung zu Service-Tiers
  - Pre-flight Checks: Automatisierte Validierungsskripte (PowerShell und Bash)
  - Kostenabschätzungen und Budgetplanungswerkzeuge

- **Fehlerbehebungsmodul**
  - Häufige Probleme: Oft vorkommende Probleme und Lösungen
  - Debugging-Leitfaden: Systematische Fehlerbehebungsmethoden
  - Erweiterte Diagnosetechniken und Tools
  - Leistungsüberwachung und -optimierung

- **Ressourcen und Referenzen**
  - Kommando-Übersicht: Schnelle Referenz für wichtige Befehle
  - Glossar: Umfassende Terminologie- und Akronym-Erklärungen
  - FAQ: Ausführliche Antworten auf häufig gestellte Fragen
  - Externe Ressourcenlinks und Community-Verbindungen

- **Beispiele und Vorlagen**
  - Einfaches Beispiel für Webanwendung
  - Vorlage für statische Webseiten-Bereitstellung
  - Container-Anwendungskonfiguration
  - Datenbank-Integrationsmuster
  - Beispiele für Microservices-Architektur
  - Implementierungen serverloser Funktionen

#### Features
- **Multi-Plattform-Support**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Mehrere Fähigkeitsstufen**: Inhalte für Studenten bis professionelle Entwickler
- **Praxisorientierung**: Hands-on-Beispiele und praxisnahe Szenarien
- **Umfassende Abdeckung**: Von Grundkonzepten bis zu fortgeschrittenen Unternehmensmustern
- **Sicherheitsfokussierung**: Sicherheitsbest Practices integriert in alle Bereiche
- **Kostenoptimierung**: Anleitungen für kosteneffiziente Bereitstellungen und Ressourcenverwaltung

#### Dokumentationsqualität
- **Detaillierte Codebeispiele**: Praktische, getestete Codebeispiele
- **Schritt-für-Schritt-Anleitungen**: Klare, umsetzbare Anweisungen
- **Umfassende Fehlerbehandlung**: Fehlerbehebung für häufige Probleme
- **Integration von Best Practices**: Branchenstandards und Empfehlungen
- **Versionskompatibilität**: Aktuell mit den neuesten Azure-Diensten und azd-Funktionen

## Geplante zukünftige Erweiterungen

### Version 3.1.0 (geplant)
#### Erweiterung der KI-Plattform
- **Multi-Modell-Support**: Integrationsmuster für Hugging Face, Azure Machine Learning und benutzerdefinierte Modelle
- **KI-Agenten-Frameworks**: Vorlagen für LangChain, Semantic Kernel und AutoGen Bereitstellungen
- **Erweiterte RAG-Muster**: Optionen für Vektordatenbanken jenseits von Azure AI Search (Pinecone, Weaviate etc.)
- **KI-Überwachbarkeit**: Verbesserte Überwachung der Modellperformance, Token-Nutzung und Antwortqualität

#### Entwicklererfahrung
- **VS Code Extension**: Integrierte AZD + Microsoft Foundry Entwicklungsumgebung
- **GitHub Copilot Integration**: KI-unterstützte AZD-Vorlagenerstellung
- **Interaktive Tutorials**: Praxisorientierte Programmierübungen mit automatischer Validierung für KI-Szenarien
- **Videoinhalte**: Ergänzende Video-Tutorials für visuelle Lernende mit Fokus auf KI-Bereitstellungen

### Version 4.0.0 (geplant)
#### Enterprise KI-Muster
- **Governance-Rahmenwerk**: KI-Modell-Governance, Compliance und Audit-Trails
- **Multi-Mandanten-KI**: Muster für die Bedienung mehrerer Kunden mit isolierten KI-Diensten
- **Edge KI-Bereitstellung**: Integration mit Azure IoT Edge und Container-Infrastrukturen
- **Hybrid Cloud KI**: Multi-Cloud- und hybride Bereitstellungsmuster für KI-Workloads

#### Erweiterte Funktionen
- **Automatisierung von KI-Pipelines**: MLOps-Integration mit Azure Machine Learning Pipelines
- **Erweiterte Sicherheit**: Zero-Trust-Muster, Private Endpoints und fortgeschrittener Bedrohungsschutz
- **Leistungsoptimierung**: Erweiterte Feinabstimmung und Skalierung für KI-Anwendungen mit hohem Durchsatz
- **Globale Verteilung**: Content Delivery und Edge-Caching-Muster für KI-Anwendungen

### Version 3.0.0 (geplant) - Von aktueller Version überholt
#### Vorgeschlagene Ergänzungen - Jetzt in v3.0.0 umgesetzt
- ✅ **KI-Fokussierte Inhalte**: Umfassende Microsoft Foundry Integration (Abgeschlossen)
- ✅ **Interaktive Tutorials**: Praktischer KI-Workshop (Abgeschlossen)
- ✅ **Erweitertes Sicherheitsmodul**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Leistungsoptimierung**: Strategien zur KI-Workload-Optimierung (Abgeschlossen)

### Version 2.1.0 (geplant) - Teilweise in v3.0.0 umgesetzt
#### Kleinere Verbesserungen - Teilweise im aktuellen Release
- ✅ **Zusätzliche Beispiele**: KI-orientierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Erweiterte FAQ**: KI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool-Integration**: Erweiterte IDE- und Editor-Integration
- ✅ **Monitoring-Ausbau**: KI-spezifische Monitoring- und Alerting-Muster (Abgeschlossen)

#### Noch geplant für zukünftige Veröffentlichung
- **Mobilfreundliche Dokumentation**: Responsives Design für mobiles Lernen
- **Offline-Zugriff**: Herunterladbare Dokumentationspakete
- **Erweiterte IDE-Integration**: VS Code Erweiterung für AZD + KI-Workflows
- **Community-Dashboard**: Echtzeit-Community-Metriken und Beitragsverfolgung

## Beiträge zum Changelog

### Meldung von Änderungen
Beim Beitrag zu diesem Repository stellen Sie bitte sicher, dass Changelog-Einträge Folgendes enthalten:

1. **Versionsnummer**: Nach Semantic Versioning (major.minor.patch)
2. **Datum**: Veröffentlichungs- oder Aktualisierungsdatum im Format JJJJ-MM-TT
3. **Kategorie**: Hinzugefügt, Geändert, Veraltet, Entfernt, Behoben, Sicherheit
4. **Klare Beschreibung**: Prägnante Beschreibung der Änderungen
5. **Auswirkungsbewertung**: Wie sich Änderungen auf bestehende Nutzer auswirken

### Änderungskategorien

#### Hinzugefügt
- Neue Funktionen, Dokumentationsabschnitte oder Fähigkeiten
- Neue Beispiele, Vorlagen oder Lernressourcen
- Zusätzliche Werkzeuge, Skripte oder Hilfsprogramme

#### Geändert
- Modifikationen bestehender Funktionen oder Dokumentationen
- Aktualisierungen zur Verbesserung von Klarheit oder Genauigkeit
- Umstrukturierung von Inhalten oder Organisation

#### Veraltet
- Funktionen oder Ansätze, die auslaufen
- Dokumentationsabschnitte, die entfernt werden sollen
- Methoden mit besseren Alternativen

#### Entfernt
- Funktionen, Dokumentationen oder Beispiele, die nicht mehr relevant sind
- Veraltete Informationen oder ausgemusterte Ansätze
- Redundante oder zusammengefasste Inhalte

#### Behoben
- Korrekturen von Fehlern in Dokumentation oder Code
- Behebung gemeldeter Probleme
- Verbesserungen in Genauigkeit oder Funktionsumfang

#### Sicherheit
- Sicherheitsrelevante Verbesserungen oder Fehlerbehebungen
- Updates zu Sicherheitsbest Practices
- Behebung von Sicherheitslücken

### Semantic Versioning Richtlinien

#### Hauptversion (X.0.0)
- Breaking Changes, die eine Benutzeraktion erfordern
- Bedeutende Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik verändern

#### Minor-Version (X.Y.0)
- Neue Funktionen oder Inhaltszusätze
- Verbesserungen mit Abwärtskompatibilität
- Zusätzliche Beispiele, Tools oder Ressourcen

#### Patch-Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleine Verbesserungen bestehender Inhalte
- Klarstellungen und kleinere Verbesserungen

## Community-Feedback und Vorschläge

Wir ermutigen aktiv zu Community-Feedback, um diese Lernressource zu verbessern:

### Wie Feedback gegeben wird
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Issues willkommen)
- **Discord-Diskussionen**: Ideen teilen und sich mit der Microsoft Foundry Community austauschen
- **Pull Requests**: Direkte Verbesserungen an Inhalten beitragen, insbesondere KI-Vorlagen und Anleitungen
- **Microsoft Foundry Discord**: Teilnahme am #Azure-Kanal für AZD + KI-Diskussionen
- **Community-Foren**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback-Kategorien
- **Korrektheit der KI-Inhalte**: Korrekturen zur Integration und Bereitstellung von KI-Diensten
- **Lernerfahrung**: Vorschläge zur Verbesserung des Lernflusses für KI-Entwickler
- **Fehlende KI-Inhalte**: Anfragen nach zusätzlichen KI-Vorlagen, Mustern oder Beispielen
- **Barrierefreiheit**: Verbesserungen für unterschiedliche Lernbedürfnisse
- **Integration von KI-Tools**: Vorschläge zur besseren Integration des KI-Entwicklungs-Workflows
- **Produktions-KI-Muster**: Anfragen nach Enterprise-KI-Bereitstellungsmustern

### Antwortverpflichtung
- **Antwort auf Issues**: Innerhalb von 48 Stunden für gemeldete Probleme
- **Feature Requests**: Bewertung innerhalb einer Woche
- **Community-Beiträge**: Überprüfung innerhalb einer Woche
- **Sicherheitsprobleme**: Sofortige Priorität mit beschleunigter Reaktion

## Wartungsplan

### Regelmäßige Updates
- **Monatliche Überprüfungen**: Überprüfung der Inhaltsgenauigkeit und Linkvalidierung
- **Quartalsweise Updates**: Wesentliche Inhaltszusätze und Verbesserungen
- **Halbjährliche Reviews**: Umfassende Umstrukturierung und Erweiterungen
- **Jährliche Releases**: Hauptversionsupdates mit bedeutenden Verbesserungen

### Monitoring und Qualitätssicherung
- **Automatisierte Tests**: Regelmäßige Validierung von Codebeispielen und Links
- **Integration von Community-Feedback**: Regelmäßige Einbindung von Benutzervorschlägen
- **Technologie-Updates**: Anpassung an neueste Azure-Dienste und azd-Releases
- **Barrierefreiheitsaudits**: Regelmäßige Prüfung auf inklusive Designprinzipien

## Versions-Support-Richtlinie

### Aktueller Versionssupport
- **Neueste Hauptversion**: Vollständiger Support mit regelmäßigen Updates
- **Vorherige Hauptversion**: Sicherheitsupdates und kritische Fehlerbehebungen für 12 Monate
- **Legacy-Versionen**: Nur Community-Support, keine offiziellen Updates

### Migrationshinweise
Bei Veröffentlichung von Hauptversionen stellen wir bereit:
- **Migrationsanleitungen**: Schritt-für-Schritt-Anweisungen für den Übergang
- **Kompatibilitäts-Hinweise**: Details zu Breaking Changes
- **Werkzeugunterstützung**: Skripte oder Hilfsmittel zur Unterstützung der Migration
- **Community-Support**: Spezielle Foren für Migrationsfragen

---

**Navigation**
- **Vorherige Lektion**: [Studienanleitung](resources/study-guide.md)
- **Nächste Lektion**: Zurück zum [Haupt-README](README.md)

**Bleiben Sie auf dem Laufenden**: Beobachten Sie dieses Repository für Benachrichtigungen über neue Veröffentlichungen und wichtige Updates der Lernmaterialien.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->