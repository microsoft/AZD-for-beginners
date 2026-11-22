# Häufig gestellte Fragen (FAQ)

**Hilfe nach Kapitel erhalten**
- **📚 Kursübersicht**: [AZD für Einsteiger](../README.md)
- **🚆 Installationsprobleme**: [Kapitel 1: Installation & Einrichtung](../docs/chapter-01-foundation/installation.md)
- **🤖 KI-Fragen**: [Kapitel 2: KI-First Entwicklung](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Fehlerbehebung**: [Kapitel 7: Fehlerbehebung & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Einführung

Dieses umfassende FAQ bietet Antworten auf die häufigsten Fragen zur Azure Developer CLI (azd) und Azure-Bereitstellungen. Finden Sie schnelle Lösungen für gängige Probleme, verstehen Sie Best Practices und erhalten Sie Klarheit über azd-Konzepte und -Workflows.

## Lernziele

Beim Durchgehen dieses FAQ werden Sie:
- Schnelle Antworten auf häufige Azure Developer CLI Fragen und Probleme finden
- Schlüsselkonzepte und Terminologie durch praktisches Q&A-Format verstehen
- Fehlerbehebungslösungen für häufige Probleme und Fehlerszenarien abrufen
- Best Practices durch häufig gestellte Fragen zu Optimierung lernen
- Erweiterte Funktionen und Fähigkeiten durch Expertenfragen entdecken
- Effizient Leitlinien zu Kosten, Sicherheit und Bereitstellungsstrategien nachschlagen

## Lernergebnisse

Mit regelmäßigem Bezug auf dieses FAQ werden Sie in der Lage sein:
- Häufige Azure Developer CLI Probleme eigenständig mit bereitgestellten Lösungen zu lösen
- Informierte Entscheidungen zu Bereitstellungsstrategien und Konfigurationen zu treffen
- Die Beziehung zwischen azd und anderen Azure-Tools und -Diensten zu verstehen
- Best Practices basierend auf Community-Erfahrungen und Expertenempfehlungen anzuwenden
- Authentifizierungs-, Bereitstellungs- und Konfigurationsprobleme effektiv zu beheben
- Kosten und Leistung mit FAQ-Erkenntnissen und Empfehlungen zu optimieren

## Inhaltsverzeichnis

- [Erste Schritte](#getting-started)
- [Authentifizierung & Zugriff](#authentication--access)
- [Vorlagen & Projekte](#templates--projects)
- [Bereitstellung & Infrastruktur](#deployment--infrastructure)
- [Konfiguration & Umgebungen](#configuration--environments)
- [Fehlerbehebung](#troubleshooting)
- [Kosten & Abrechnung](#cost--billing)
- [Best Practices](#best-practices)
- [Erweiterte Themen](#advanced-topics)

---

## Erste Schritte

### F: Was ist Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) ist ein entwicklerzentriertes Kommandozeilenwerkzeug, das die Zeit von der lokalen Entwicklungsumgebung bis zur Azure-Bereitstellung Ihrer Anwendung beschleunigt. Es bietet Best Practices durch Vorlagen und unterstützt den gesamten Bereitstellungszyklus.

### F: Worin unterscheidet sich azd von der Azure CLI?
**A**: 
- **Azure CLI**: Allgemeines Werkzeug zur Verwaltung von Azure-Ressourcen
- **azd**: Entwicklerfokussiertes Werkzeug für Anwendungsbereitstellungs-Workflows
- azd besitzt eigene Authentifizierungs- und Bereitstellungsabläufe; Azure CLI ist ein separates, ergänzendes Tool
- azd beinhaltet Vorlagen, Umweltverwaltung und Bereitstellungsautomatisierung

### F: Benötige ich Azure CLI zur Verwendung von azd?
**A**: Nicht für den Kern-AZD-Workflow. Authentifizieren Sie sich mit `azd auth login`. Installieren Sie Azure CLI separat, wenn eine Vorlage oder Übung explizit `az`-Befehle ausführt.

### F: Welche Programmiersprachen unterstützt azd?
**A**: azd ist sprachunabhängig. Es funktioniert mit:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statischen Webseiten
- Containerisierten Anwendungen

### F: Kann ich azd mit bestehenden Projekten verwenden?
**A**: Ja! Sie können entweder:
1. Verwenden Sie `azd init`, um azd-Konfiguration zu bestehenden Projekten hinzuzufügen
2. Passen Sie bestehende Projekte an die azd-Vorlagenstruktur an
3. Erstellen Sie benutzerdefinierte Vorlagen basierend auf Ihrer bestehenden Architektur

### F: Was hat sich mit der allgemeinen Verfügbarkeit der Foundry-Erweiterung geändert?
**A**: Das `microsoft.foundry` Bundle erreichte am 5. November 2026 Version 1.0 und GA. Mit AZD 1.37.0+ verwenden Sie `azd ext install microsoft.foundry`, um sieben Kern-Erweiterungen für Agenten, Verbindungen, Inspektor, Projekte, Routinen, Fähigkeiten und Toolkits zu installieren. Es ist kein neues Befehlsnamenraum, und die Komponenten haben eigene Versionen. Bewertungen, Datensätze, Feinabstimmung und benutzerdefinierte Modelle werden separat installiert; optionale Vorschaufunktionen werden nicht automatisch GA nur weil das Bundle GA ist.

Die [hosted-agent Anleitung](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) nutzt Python 3.13+ und aktuelle uv. `azd ai agent run` öffnet Agent Inspector lokal, aber Modellaufrufe verwenden weiterhin Azure und verursachen Kosten. Code-Modus `azd deploy` lädt Quellcode für einen Remote-Build hoch, ohne dass ein lokaler Container-Build nötig ist.

### F: Entfernt `azd down` einen Hosted Agent aus einem bestehenden Foundry-Projekt?
**A**: Nicht für den im Hosted-Agent-Schnellstart beschriebenen Wiederverwendungsprojektpfad: es lässt Projekt, Hosted Agent und andere Ressourcen bestehen. Entfernen Sie unerwünschte Ressourcen separat ohne gemeinsame Ressourcen zu löschen. Wenn die Umgebung ein neues Foundry-Projekt erstellt hat, löscht `azd down` dessen Ressourcengruppe und alles darin. Überprüfen Sie die [Bereinigungsleitlinien](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) und Löschaufforderungen vor der Bestätigung.

---

## Authentifizierung & Zugriff

### F: Wie authentifiziere ich mich mit Azure über azd?
**A**: Benutzen Sie `azd auth login`, das ein Browserfenster zur Azure-Authentifizierung öffnet. Für CI/CD-Szenarien verwenden Sie Dienstprinzipale oder verwaltete Identitäten.

### F: Kann ich azd mit mehreren Azure-Abonnements verwenden?
**A**: Ja. Verwenden Sie `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, um anzugeben, welches Abonnement für jede Umgebung genutzt wird.

### F: Welche Berechtigungen benötige ich für die Bereitstellung mit azd?
**A**: Üblicherweise benötigen Sie:
- Die Rolle **Mitwirkender** auf Ressourcengruppen- oder Abonnementebene
- Den Benutzerzugriffsadministrator, wenn Ressourcen mit Rollenzuweisungen bereitgestellt werden
- Spezifische Berechtigungen variieren je nach Vorlage und bereitgestellten Ressourcen

### F: Kann ich azd in CI/CD-Pipelines verwenden?
**A**: Absolut! azd ist für CI/CD-Integration konzipiert. Verwenden Sie Dienstprinzipale zur Authentifizierung und setzen Sie Umgebungsvariablen für die Konfiguration.

### F: Wie handle ich Authentifizierung in GitHub Actions?
**A**: Bevorzugen Sie Workload-Identitäts-Föderation (OIDC), konfiguriert mit `azd pipeline config`. Der generierte Workflow installiert AZD und authentifiziert AZD direkt mit einer föderierten Identität. Ein einzelner `azure/login`-Schritt stellt kein AZD-Login her. Ein Login-Schritt innerhalb eines bestehenden Jobs sieht so aus:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Bereitstellen oder Deployen nach Login, mit konfigurierte AZD-Umgebung, Abonnement und Standort. Die föderierte Anmeldeinformation der Identität muss dem Repository/Ref oder der GitHub-Umgebung vertrauen und Azure-Rollen müssen die angeforderten Operationen erlauben.

---

## Vorlagen & Projekte

### F: Wo finde ich azd-Vorlagen?
**A**: 
- Offizielle und Community-Vorlagen: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community-Vorlagen: GitHub Suche nach "azd-template"
- Verwenden Sie `azd template list` zum Durchsuchen verfügbarer Vorlagen

### F: Wie erstelle ich eine benutzerdefinierte Vorlage?
**A**: 
1. Starten Sie mit einer bestehenden Vorlagenstruktur
2. Ändern Sie `azure.yaml`, Infrastrukturdateien und Anwendungs-Code
3. Testen Sie gründlich mit `azd up`
4. Veröffentlichen Sie auf GitHub mit passenden Tags

### F: Kann ich azd ohne Vorlage verwenden?
**A**: Ja, verwenden Sie `azd init` in einem bestehenden Projekt, um die notwendigen Konfigurationsdateien zu erstellen. Sie müssen `azure.yaml` und Infrastrukturdateien manuell konfigurieren.

### F: Was ist der Unterschied zwischen offiziellen und Community-Vorlagen?
**A**: 
- **Offizielle Vorlagen**: Von Microsoft gepflegt, regelmäßig aktualisiert, umfassende Dokumentation
- **Community-Vorlagen**: Von Entwicklern erstellt, können spezialisierte Anwendungsfälle haben, unterschiedliche Qualität und Pflege

### F: Wie aktualisiere ich eine Vorlage in meinem Projekt?
**A**: Vorlagen werden nicht automatisch aktualisiert. Sie können:
1. Änderungen der Quellvorlage manuell vergleichen und mergen
2. Neu starten mit `azd init` und der aktualisierten Vorlage
3. Spezifische Verbesserungen aus aktualisierten Vorlagen selektiv übernehmen

---

## Bereitstellung & Infrastruktur

### F: Welche Azure-Dienste kann azd bereitstellen?
**A**: azd kann jeden Azure-Dienst über Bicep/ARM-Vorlagen bereitstellen, einschließlich:
- App Services, Container-Apps, Functions
- Datenbanken (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netzwerk-, Sicherheits- und Überwachungsressourcen

### F: Kann ich in mehreren Regionen bereitstellen?
**A**: Ja, konfigurieren Sie mehrere Regionen in Ihren Bicep-Vorlagen und setzen Sie den Standortparameter für jede Umgebung entsprechend.

### F: Wie handhabe ich Datenbank-Schemamigrationen?
**A**: Verwenden Sie Bereitstellungshooks in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### F: Kann ich nur Infrastruktur ohne Anwendungen bereitstellen?
**A**: Ja, verwenden Sie `azd provision`, um nur die in Ihren Vorlagen definierten Infrastrukturkomponenten bereitzustellen.

### F: Wie kann ich bestehende Azure-Ressourcen bereitstellen?
**A**: Ja, wenn die Vorlage dies unterstützt. Verweisen Sie auf bestehende Ressourcen mit Biceps `existing`-Deklarationen oder den dokumentierten existierenden Ressourcensparametern der Vorlage und ordnen Sie Anwendungsdienste ihren vorgesehenen Zielen zu. Das importiert kein Eigentum oder erstellt automatisch fehlende Berechtigungen. Überprüfen Sie die Vorlage vor der Bereitstellung.

### F: Kann ich Terraform statt Bicep verwenden?
**A**: Ja. AZD unterstützt Terraform ebenso wie Bicep. Wählen Sie eine Terraform-basierte Vorlage oder konfigurieren Sie `infra.provider: terraform` in `azure.yaml` mit passenden Terraform-Dateien und State/Backend-Konfiguration. Siehe den [Terraform Workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguration & Umgebungen

### F: Wie verwalte ich verschiedene Umgebungen (dev, staging, prod)?
**A**: Erstellen Sie separate Umgebungen mit `azd env new <environment-name>` und konfigurieren Sie unterschiedliche Einstellungen für jede:
```bash
azd env new development
azd env new staging  
azd env new production
```

### F: Wo werden Umgebungs-Konfigurationen gespeichert?
**A**: Im `.azure`-Ordner in Ihrem Projektverzeichnis. Jede Umgebung hat ihren eigenen Ordner mit Konfigurationsdateien.

### F: Wie setze ich umgebungsspezifische Konfiguration?
**A**: Verwenden Sie `azd env set` zur Konfiguration von Umgebungsvariablen:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### F: Kann ich Umgebungs-Konfigurationen mit Teammitgliedern teilen?
**A**: Der `.azure`-Ordner enthält sensible Informationen und sollte nicht in die Versionsverwaltung eingecheckt werden. Stattdessen:
1. Dokumentieren Sie die erforderlichen Umgebungsvariablen
2. Verwenden Sie Bereitstellungsskripte zum Einrichten der Umgebungen
3. Verwenden Sie Azure Key Vault für sensible Konfiguration

### F: Wie überschreibe ich Vorlagen-Standards?
**A**: Setzen Sie Umgebungsvariablen, die den Vorlagenparametern entsprechen:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Nur Variablen, die von der Vorlage genutzt werden, beeinflussen die Bereitstellung. `SKU_NAME` oben ist ein Beispiel für eine benutzerdefinierte Eingabe, keine universelle AZD-Einstellung.

---

## Fehlerbehebung

### F: Warum schlägt `azd up` fehl?
**A**: Häufige Ursachen:
1. **Authentifizierungsprobleme**: Führen Sie `azd auth login` aus
2. **Unzureichende Berechtigungen**: Prüfen Sie Ihre Azure-Rollenzuweisungen
3. **Konflikte bei Ressourcennamen**: Überprüfen Sie die widersprüchliche Ressource und die Namenseingaben der Vorlage; erstellen Sie bei Bedarf mit `azd env new` eine separate Umgebung zur Isolation
4. **Quota/Kapazitätsprobleme**: Prüfen Sie die regionale Verfügbarkeit
5. **Vorlagenfehler**: Validieren Sie Bicep-Vorlagen

### F: Wie behebe ich Bereitstellungsfehler?
**A**: 
1. Verwenden Sie `azd deploy --debug` für ausführliche Ausgaben
2. Prüfen Sie den Bereitstellungsverlauf im Azure-Portal
3. Überprüfen Sie das Aktivitätsprotokoll im Azure-Portal
4. Verwenden Sie `azd show`, um den aktuellen Umgebungsstatus anzuzeigen

### F: Warum funktionieren meine Umgebungsvariablen nicht?
**A**: Prüfen Sie:
1. Variablennamen entsprechen exakt den Vorlagenparametern
2. Werte sind bei Leerzeichen korrekt in Anführungszeichen gesetzt
3. Die Umgebung ist ausgewählt: `azd env select <environment>`
4. Variablen sind in der richtigen Umgebung gesetzt

### F: Wie bereinige ich fehlgeschlagene Bereitstellungen?
**A**: 
```bash
azd down
```
 Überprüfen Sie zuerst die ausgewählte Umgebung und die Löschbestätigung. Dies löscht bereitgestellte Azure-Ressourcen, nicht die lokale `.azure`-Umgebungskonfiguration. `--purge` fordert zusätzlich die permanente Löschung unterstützter soft-gelöschter Ressourcen an und kann durch Aufbewahrungs-/Löschschutz blockiert werden; es ist kein routinemäßiger Wiederherstellungsschritt.

### F: Warum ist meine Anwendung nach der Bereitstellung nicht erreichbar?
**A**: Prüfen Sie:
1. Die Bereitstellung wurde erfolgreich abgeschlossen
2. Die Anwendung läuft (Prüfen Sie Protokolle im Azure-Portal)
3. Netzwerksicherheitsgruppen erlauben Traffic
4. DNS/benutzerdefinierte Domains sind korrekt konfiguriert

---

## Kosten & Abrechnung

### F: Wie viel kosten azd-Bereitstellungen?
**A**: Die Kosten hängen ab von:
- Bereitgestellten Azure-Diensten
- Gewählten Service-Stufen/SKUs
- Regionalen Preisunterschieden
- Nutzungsmustern

Verwenden Sie den [Azure Preisrechner](https://azure.microsoft.com/pricing/calculator/) für Schätzungen.

### F: Wie kontrolliere ich Kosten bei azd-Bereitstellungen?
**A**: 
1. Verwenden Sie niedrigere SKUs für Entwicklungsumgebungen
2. Richten Sie Azure-Budgets und Alarme ein
3. Verwenden Sie `azd down`, um Ressourcen bei Nichtbedarf zu entfernen
4. Wählen Sie geeignete Regionen (Kosten variieren je nach Standort)
5. Nutzen Sie Azure Kostenmanagement-Tools

### F: Gibt es Free-Tier-Optionen für azd-Vorlagen?
**A**: Einige Dienste haben kostenlose SKUs oder monatliche Guthaben, je nach Berechtigung, Hosting-Plan, Region und Abonnementgrenzen. Dies macht eine ganze Vorlage nicht kostenlos: Datenbanken, Suche, Netzwerk, Registry, Telemetrie und Modellinferenz können unabhängig Kosten verursachen. Prüfen Sie die [Liste der kostenlosen Azure-Dienste](https://azure.microsoft.com/free/) und die aktuellen Preise für jede Ressource vor der Bereitstellung.

### F: Wie schätze ich die Kosten vor der Bereitstellung ab?
**A**: 
1. Überprüfen Sie die `main.bicep` der Vorlage, um zu sehen, welche Ressourcen erstellt werden
2. Verwenden Sie den Azure-Preisrechner mit spezifischen SKUs
3. Stellen Sie zuerst in einer Entwicklungsumgebung bereit, um die tatsächlichen Kosten zu überwachen
4. Nutzen Sie Azure Cost Management für eine detaillierte Kostenanalyse

---

## Beste Praktiken

### F: Was sind die besten Praktiken für die azd-Projektstruktur?
**A**: 
1. Halten Sie den Anwendungscode getrennt von der Infrastruktur
2. Verwenden Sie aussagekräftige Dienstnamen in `azure.yaml`
3. Implementieren Sie eine angemessene Fehlerbehandlung in Build-Skripten
4. Verwenden Sie umgebungsspezifische Konfigurationen
5. Fügen Sie umfassende Dokumentation hinzu

### F: Wie sollte ich mehrere Dienste in azd organisieren?
**A**: Verwenden Sie die empfohlene Struktur:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### F: Sollte ich den `.azure`-Ordner in die Versionsverwaltung aufnehmen?
**A**: **Nein!** Der `.azure`-Ordner enthält sensible Informationen. Fügen Sie ihn zu `.gitignore` hinzu:
```gitignore
.azure/
```

### F: Wie gehe ich mit Geheimnissen und sensiblen Konfigurationen um?
**A**: 
1. Verwenden Sie Azure Key Vault für Geheimnisse
2. Referenzieren Sie Key Vault-Geheimnisse in der Anwendungskonfiguration
3. Committen Sie Geheimnisse niemals in die Versionskontrolle
4. Verwenden Sie verwaltete Identitäten für die Authentifizierung zwischen Diensten

### F: Was ist der empfohlene Ansatz für CI/CD mit azd?
**A**: 
1. Verwenden Sie separate Umgebungen für jede Stufe (dev/staging/prod)
2. Implementieren Sie automatisierte Tests vor der Bereitstellung
3. Verwenden Sie Dienstprinzipale für die Authentifizierung
4. Speichern Sie sensible Konfigurationen in Pipeline-Geheimnissen/-Variablen
5. Implementieren Sie Freigabetore für Produktionsbereitstellungen

---

## Fortgeschrittene Themen

### F: Kann ich azd mit benutzerdefinierter Funktionalität erweitern?
**A**: Ja, über Bereitstellungshooks in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### F: Wie integriere ich azd in bestehende DevOps-Prozesse?
**A**: 
1. Verwenden Sie azd-Befehle in bestehenden Pipelineskripten
2. Standardisieren Sie azd-Vorlagen über Teams hinweg
3. Integrieren Sie bestehendes Monitoring und Alerting
4. Verwenden Sie azd's JSON-Ausgabe für Pipeline-Integration

### F: Kann ich azd mit Azure DevOps verwenden?
**A**: Ja, azd funktioniert mit jedem CI/CD-System. Erstellen Sie Azure DevOps-Pipelines, die azd-Befehle verwenden.

### F: Wie kann ich zu azd beitragen oder Community-Vorlagen erstellen?
**A**: 
1. **azd-Tool**: Beitragen zu [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Vorlagen**: Folgen Sie den [Anweisungen zur Beitragserstellung der Awesome AZD Galerie](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentation**: Beitragen zu den Dokumenten bei [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### F: Wie sieht die Roadmap für azd aus?
**A**: Prüfen Sie die [offizielle Roadmap](https://github.com/Azure/azure-dev/projects) für geplante Funktionen und Verbesserungen.

### F: Wie migriere ich von anderen Bereitstellungstools zu azd?
**A**: 
1. Analysieren Sie die aktuelle Bereitstellungsarchitektur
2. Erstellen Sie äquivalente Bicep-Vorlagen
3. Konfigurieren Sie `azure.yaml`, um aktuelle Dienste abzubilden
4. Testen Sie gründlich in der Entwicklungsumgebung
5. Migrieren Sie Umgebungen schrittweise

---

## Noch Fragen?

### **Zuerst suchen**
- Überprüfen Sie die [offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Suchen Sie in [GitHub-Issues](https://github.com/Azure/azure-dev/issues) nach ähnlichen Problemen

### **Hilfe erhalten**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community-Support
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische Fragen
- [Azure Discord](https://discord.gg/azure) - Echtzeit-Community-Chat

### **Probleme melden**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fehlerberichte und Funktionswünsche
- Fügen Sie relevante Protokolle, Fehlermeldungen und Reproduktionsschritte bei

### **Mehr erfahren**
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technische Anleitung geprüft: 4. November 2026. Cloud-Verfügbarkeit und Preise müssen für Ihr Abonnement und Ihre Region überprüft werden.*

---

**Navigation**
- **Vorherige Lektion**: [Glossar](glossary.md)
- **Nächste Lektion**: [Studienleitfaden](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->