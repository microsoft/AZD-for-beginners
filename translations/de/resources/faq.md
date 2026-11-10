# Häufig gestellte Fragen (FAQ)

**Hilfe nach Kapitel erhalten**
- **📚 Kursstartseite**: [AZD für Anfänger](../README.md)
- **🚆 Installationsprobleme**: [Kapitel 1: Installation & Einrichtung](../docs/chapter-01-foundation/installation.md)
- **🤖 KI-Fragen**: [Kapitel 2: KI-First-Entwicklung](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Fehlerbehebung**: [Kapitel 7: Fehlerbehebung & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Einführung

Dieses umfassende FAQ bietet Antworten auf die häufigsten Fragen zu Azure Developer CLI (azd) und Azure-Bereitstellungen. Finden Sie schnelle Lösungen für gängige Probleme, verstehen Sie bewährte Verfahren und erhalten Sie Klarheit zu azd-Konzepten und Arbeitsabläufen.

## Lernziele

Durch das Durcharbeiten dieses FAQs werden Sie:
- Schnelle Antworten auf häufige Fragen und Probleme mit Azure Developer CLI finden
- Wichtige Konzepte und Terminologie durch praktisches Q&A-Format verstehen
- Lösungen zur Fehlerbehebung bei häufigen Problemen und Fehlerszenarien finden
- Best Practices durch häufig gestellte Fragen zur Optimierung kennenlernen
- Fortgeschrittene Funktionen und Möglichkeiten durch Expertenfragen entdecken
- Kosten-, Sicherheits- und Bereitstellungsstrategien effizient nachschlagen

## Lernergebnisse

Mit regelmäßigem Nachschlagen dieses FAQs werden Sie in der Lage sein:
- Häufige Probleme mit Azure Developer CLI eigenständig anhand der bereitgestellten Lösungen zu beheben
- Informierte Entscheidungen über Bereitstellungsstrategien und Konfigurationen zu treffen
- Die Beziehung zwischen azd und anderen Azure-Tools und -Diensten zu verstehen
- Best Practices basierend auf Community-Erfahrungen und Expertenempfehlungen anzuwenden
- Authentifizierungs-, Bereitstellungs- und Konfigurationsprobleme effektiv zu beheben
- Kosten und Leistung unter Nutzung der FAQ-Erkenntnisse und Empfehlungen zu optimieren

## Inhaltsverzeichnis

- [Erste Schritte](#getting-started)
- [Authentifizierung & Zugriff](#authentication--access)
- [Vorlagen & Projekte](#templates--projects)
- [Bereitstellung & Infrastruktur](#deployment--infrastructure)
- [Konfiguration & Umgebungen](#configuration--environments)
- [Fehlerbehebung](#troubleshooting)
- [Kosten & Abrechnung](#cost--billing)
- [Best Practices](#best-practices)
- [Fortgeschrittene Themen](#advanced-topics)

---

## Erste Schritte

### F: Was ist Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) ist ein entwicklerorientiertes Kommandozeilenwerkzeug, das die Zeit verkürzt, die benötigt wird, um Ihre Anwendung von der lokalen Entwicklungsumgebung bis zu Azure zu bringen. Es bietet Best Practices durch Vorlagen und unterstützt den gesamten Bereitstellungszyklus.

### F: Wodurch unterscheidet sich azd von Azure CLI?
**A**: 
- **Azure CLI**: Allgemeines Werkzeug zur Verwaltung von Azure-Ressourcen
- **azd**: Entwicklerfokussiertes Werkzeug für Anwendungsbereitstellungs-Workflows
- azd hat eigene Authentifizierungs- und Bereitstellungsabläufe; Azure CLI ist ein separates, ergänzendes Werkzeug
- azd beinhaltet Vorlagen, Umweltverwaltung und Automatisierung der Bereitstellung

### F: Brauche ich Azure CLI, um azd zu verwenden?
**A**: Nicht für den Kern-AZD-Workflow. Authentifizieren Sie sich mit `azd auth login`. Installieren Sie Azure CLI separat, wenn eine Vorlagen-Hook oder eine Übung explizit `az`-Befehle ausführt.

### F: Welche Programmiersprachen unterstützt azd?
**A**: azd ist sprachunabhängig. Es funktioniert mit:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statischen Websites
- Containerisierten Anwendungen

### F: Kann ich azd mit bestehenden Projekten verwenden?
**A**: Ja! Sie können entweder:
1. `azd init` verwenden, um azd-Konfigurationen zu bestehenden Projekten hinzuzufügen
2. Bestehende Projekte an die Struktur der azd-Vorlagen anpassen
3. Eigene Vorlagen basierend auf Ihrer bestehenden Architektur erstellen

---

## Authentifizierung & Zugriff

### F: Wie authentifiziere ich mich mit Azure über azd?
**A**: Verwenden Sie `azd auth login`, welches ein Browserfenster zur Azure-Authentifizierung öffnet. Für CI/CD-Szenarien verwenden Sie Dienstprinzipale oder verwaltete Identitäten.

### F: Kann ich azd mit mehreren Azure-Abonnements verwenden?
**A**: Ja. Nutzen Sie `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, um anzugeben, welches Abonnement für jede Umgebung verwendet werden soll.

### F: Welche Berechtigungen brauche ich, um mit azd bereitzustellen?
**A**: Normalerweise benötigen Sie:
- **Contributor**-Rolle auf der Ressourcengruppe oder im Abonnement
- **Benutzerzugriffsadministrator**, wenn Ressourcen bereitgestellt werden, die Rollen-Zuweisungen erfordern
- Spezifische Berechtigungen variieren je nach Vorlage und bereitgestellten Ressourcen

### F: Kann ich azd in CI/CD-Pipelines verwenden?
**A**: Absolut! azd ist für die CI/CD-Integration ausgelegt. Verwenden Sie Dienstprinzipale zur Authentifizierung und setzen Sie Umgebungsvariablen für die Konfiguration.

### F: Wie handle ich die Authentifizierung in GitHub Actions?
**A**: Bevorzugen Sie Workload-Identitätsföderation (OIDC), konfiguriert mit `azd pipeline config`. Der generierte Workflow installiert AZD und authentifiziert AZD direkt mit einer föderierten Identität. Ein alleiniger `azure/login`-Schritt stellt keinen AZD-Login her. Ein Login-Schritt innerhalb eines bestehenden Jobs ist:
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

Stellen Sie Provisionierung oder Bereitstellung nach dem Login sicher, mit der konfigurierten AZD-Umgebung, dem Abonnement und dem Standort. Die föderierte Anmeldeinformation der Identität muss dem Repository/Ref oder der GitHub-Umgebung des Workflows vertrauen, und ihre Azure-Rollen müssen die angeforderten Operationen erlauben.

---

## Vorlagen & Projekte

### F: Wo finde ich azd-Vorlagen?
**A**: 
- Offizielle und Community-Vorlagen: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community-Vorlagen: GitHub-Suche nach "azd-template"
- Verwenden Sie `azd template list`, um verfügbare Vorlagen zu durchsuchen

### F: Wie erstelle ich eine benutzerdefinierte Vorlage?
**A**: 
1. Beginnen Sie mit einer bestehenden Vorlagenstruktur
2. Ändern Sie `azure.yaml`, Infrastrukturdokumente und Anwendungscode
3. Testen Sie gründlich mit `azd up`
4. Veröffentlichen Sie die Vorlage auf GitHub mit geeigneten Tags

### F: Kann ich azd ohne Vorlage verwenden?
**A**: Ja, verwenden Sie `azd init` in einem bestehenden Projekt, um die notwendigen Konfigurationsdateien zu erstellen. Sie müssen `azure.yaml` und Infrastrukturdateien manuell konfigurieren.

### F: Was ist der Unterschied zwischen offiziellen und Community-Vorlagen?
**A**: 
- **Offizielle Vorlagen**: Werden von Microsoft gepflegt, regelmäßig aktualisiert, mit umfassender Dokumentation
- **Community-Vorlagen**: Werden von Entwicklern erstellt, können spezialisierte Anwendungsfälle haben, unterschiedliche Qualität und Wartung

### F: Wie aktualisiere ich eine Vorlage in meinem Projekt?
**A**: Vorlagen werden nicht automatisch aktualisiert. Sie können:
1. Manuell Änderungen aus der Quellvorlage vergleichen und zusammenführen
2. Mit `azd init` neu beginnen unter Verwendung der aktualisierten Vorlage
3. Spezifische Verbesserungen aus aktualisierten Vorlagen selektiv übernehmen

---

## Bereitstellung & Infrastruktur

### F: Welche Azure-Dienste kann azd bereitstellen?
**A**: azd kann jeden Azure-Dienst über Bicep/ARM-Vorlagen bereitstellen, einschließlich:
- App Services, Container Apps, Functions
- Datenbanken (SQL, PostgreSQL, Cosmos DB)
- Speicher, Key Vault, Application Insights
- Netzwerk-, Sicherheits- und Überwachungsressourcen

### F: Kann ich in mehrere Regionen bereitstellen?
**A**: Ja, konfigurieren Sie mehrere Regionen in Ihren Bicep-Vorlagen und setzen Sie den Ortsparameter für jede Umgebung entsprechend.

### F: Wie handhabe ich Datenbankschema-Migrationen?
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

### F: Wie stelle ich auf bestehende Azure-Ressourcen bereit?
**A**: Ja, wenn die Vorlage es unterstützt. Verweisen Sie auf bestehende Ressourcen mit Bicep's `existing`-Deklarationen oder den dokumentierten bestehenden Ressourcenparametern der Vorlage und ordnen Sie Anwendungsdienste ihren Zielobjekten zu. Dies übernimmt kein Eigentum und erstellt nicht automatisch fehlende Berechtigungen. Überprüfen Sie die Vorlage vor der Bereitstellung.

### F: Kann ich Terraform statt Bicep verwenden?
**A**: Ja. AZD unterstützt sowohl Terraform als auch Bicep. Wählen Sie eine Terraform-basierte Vorlage oder konfigurieren Sie `infra.provider: terraform` in `azure.yaml` mit den passenden Terraform-Dateien und State/Backend-Konfiguration. Siehe den [Terraform-Workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

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
**A**: Im Ordner `.azure` innerhalb Ihres Projektverzeichnisses. Jede Umgebung hat einen eigenen Ordner mit Konfigurationsdateien.

### F: Wie setze ich umgebungsspezifische Konfigurationen?
**A**: Verwenden Sie `azd env set` zur Konfiguration von Umgebungsvariablen:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### F: Kann ich Umgebungs-Konfigurationen mit Teammitgliedern teilen?
**A**: Der Ordner `.azure` enthält sensible Informationen und sollte nicht in die Versionskontrolle übernommen werden. Stattdessen:
1. Dokumentieren Sie erforderliche Umgebungsvariablen
2. Verwenden Sie Bereitstellungsskripte zum Einrichten der Umgebungen
3. Verwenden Sie Azure Key Vault für sensible Konfigurationen

### F: Wie überschreibe ich Standardwerte der Vorlage?
**A**: Setzen Sie Umgebungsvariablen, die den Vorlagenparametern entsprechen:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Nur Variablen, die von der Vorlage verwendet werden, beeinflussen die Bereitstellung. `SKU_NAME` oben ist ein Beispiel für eine benutzerdefinierte Eingabe, kein universelles AZD-Setting.

---

## Fehlerbehebung

### F: Warum schlägt `azd up` fehl?
**A**: Häufige Ursachen:
1. **Authentifizierungsprobleme**: Führen Sie `azd auth login` aus
2. **Unzureichende Berechtigungen**: Prüfen Sie Ihre Azure-Rollen-Zuweisungen
3. **Namenskonflikte bei Ressourcen**: Überprüfen Sie die konfliktbehaftete Ressource und die Namenseingaben der Vorlage; wenn Isolation nötig ist, erstellen Sie eine separate Umgebung mit `azd env new`
4. **Quota-/Kapazitätsprobleme**: Prüfen Sie regionale Verfügbarkeit
5. **Vorlagenfehler**: Validieren Sie Bicep-Vorlagen

### F: Wie debugge ich Bereitstellungsfehler?
**A**: 
1. Verwenden Sie `azd deploy --debug` für ausführliche Ausgabe
2. Prüfen Sie die Bereitstellungshistorie im Azure-Portal
3. Überprüfen Sie das Aktivitätsprotokoll im Azure-Portal
4. Verwenden Sie `azd show`, um den aktuellen Umgebungszustand anzuzeigen

### F: Warum funktionieren meine Umgebungsvariablen nicht?
**A**: Prüfen Sie:
1. Variablennamen stimmen exakt mit Vorlagenparametern überein
2. Werte sind richtig zitiert, wenn sie Leerzeichen enthalten
3. Die Umgebung ist ausgewählt: `azd env select <environment>`
4. Variablen sind in der richtigen Umgebung gesetzt

### F: Wie räume ich fehlgeschlagene Bereitstellungen auf?
**A**: 
```bash
azd down
```
Überprüfen Sie zuerst die ausgewählte Umgebung und die Löschbestätigung. Dies löscht bereitgestellte Azure-Ressourcen, nicht die lokale `.azure`-Umgebungskonfiguration. `--purge` fordert zusätzlich die dauerhafte Löschung von unterstützten soft-gelöschten Ressourcen an und kann durch Aufbewahrungs-/Löschschutz blockiert werden; es ist kein routinemäßiger Wiederherstellungsschritt.

### F: Warum ist meine Anwendung nach der Bereitstellung nicht erreichbar?
**A**: Prüfen Sie:
1. Die Bereitstellung wurde erfolgreich abgeschlossen
2. Die Anwendung läuft (prüfen Sie die Protokolle im Azure-Portal)
3. Die Netzwerksicherheitsgruppen erlauben den Verkehr
4. DNS/benutzerdefinierte Domains sind korrekt konfiguriert

---

## Kosten & Abrechnung

### F: Wie viel kosten azd-Bereitstellungen?
**A**: Die Kosten hängen ab von:
- Bereitgestellte Azure-Dienste
- Ausgewählte Service-Tiers/SKUs
- Regionale Preisunterschiede
- Nutzungsmuster

Verwenden Sie den [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) für Schätzungen.

### F: Wie kontrolliere ich Kosten bei azd-Bereitstellungen?
**A**: 
1. Verwenden Sie niedrigpreisige SKUs für Entwicklungsumgebungen
2. Richten Sie Azure-Budgets und Warnungen ein
3. Nutzen Sie `azd down`, um Ressourcen zu entfernen, wenn sie nicht benötigt werden
4. Wählen Sie geeignete Regionen (Kosten variieren je nach Standort)
5. Verwenden Sie Azure Cost Management-Tools

### F: Gibt es kostenlose Stufenoptionen für azd-Vorlagen?
**A**: Einige Dienste bieten kostenlose SKUs oder monatliche Kontingente, abhängig von Anspruchsberechtigung, Hosting-Plan, Region und Abonnementlimits. Dadurch wird nicht die gesamte Vorlage kostenlos: Datenbanken, Suche, Netzwerk, Registry, Telemetrie und Modellinferenz können unabhängig Kosten verursachen. Prüfen Sie die [Liste der kostenlosen Azure-Dienste](https://azure.microsoft.com/free/) und die aktuellen Preise für jede Ressource vor der Bereitstellung.

### F: Wie kann ich Kosten vor der Bereitstellung abschätzen?
**A**: 
1. Prüfen Sie die `main.bicep` der Vorlage, um zu sehen, welche Ressourcen erstellt werden
2. Nutzen Sie den Azure Pricing Calculator mit spezifischen SKUs
3. Stellen Sie zuerst in einer Entwicklungsumgebung bereit, um tatsächliche Kosten zu überwachen
4. Verwenden Sie Azure Cost Management für detaillierte Kostenanalyse

---

## Best Practices

### F: Was sind Best Practices für die Projektstruktur in azd?
**A**: 
1. Halten Sie Anwendungscode getrennt von Infrastruktur
2. Verwenden Sie aussagekräftige Dienstnamen in `azure.yaml`
3. Implementieren Sie richtige Fehlerbehandlung in Build-Skripten
4. Verwenden Sie umgebungsspezifische Konfiguration
5. Fügen Sie umfassende Dokumentation hinzu

### F: Wie organisiere ich mehrere Dienste in azd?
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

### F: Sollte ich den `.azure`-Ordner in die Versionskontrolle aufnehmen?
**A**: **Nein!** Der `.azure`-Ordner enthält sensible Informationen. Fügen Sie ihn zu `.gitignore` hinzu:
```gitignore
.azure/
```

### F: Wie gehe ich mit Geheimnissen und sensiblen Konfigurationen um?
**A**: 
1. Verwenden Sie Azure Key Vault für Geheimnisse
2. Verweisen Sie auf Key Vault-Geheimnisse in der Anwendungs konfiguraton
3. Geben Sie Geheimnisse niemals im Versionskontrollsystem frei
4. Verwenden Sie verwaltete Identitäten für die Authentifizierung zwischen Diensten

### F: Was ist der empfohlene Ansatz für CI/CD mit azd?
**A**: 
1. Verwenden Sie separate Umgebungen für jede Stufe (Entwicklung/Staging/Produktion)
2. Implementieren Sie automatisierte Tests vor der Bereitstellung
3. Verwenden Sie Dienstprinzipale für die Authentifizierung
4. Speichern Sie sensible Konfigurationen in Pipeline-Geheimnissen/-Variablen
5. Implementieren Sie Freigabe-Gates für Produktionsbereitstellungen

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
1. Verwenden Sie azd-Befehle in bestehenden Pipeline-Skripten
2. Standardisieren Sie azd-Vorlagen teamsübergreifend
3. Integrieren Sie bestehendes Monitoring und Alerts
4. Verwenden Sie azd JSON-Ausgabe für Pipeline-Integration

### F: Kann ich azd mit Azure DevOps verwenden?
**A**: Ja, azd funktioniert mit jedem CI/CD-System. Erstellen Sie Azure DevOps-Pipelines, die azd-Befehle verwenden.

### F: Wie kann ich zu azd beitragen oder Community-Vorlagen erstellen?
**A**: 
1. **azd tool**: Beitrag zu [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Vorlagen**: Folgen Sie den [Anweisungen zur Beitragserstellung in der Awesome AZD-Galerie](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentation**: Beitrag zur Dokumentation bei [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### F: Wie sieht die Roadmap für azd aus?
**A**: Sehen Sie sich die [offizielle Roadmap](https://github.com/Azure/azure-dev/projects) für geplante Funktionen und Verbesserungen an.

### F: Wie kann ich von anderen Bereitstellungstools auf azd migrieren?
**A**: 
1. Analysieren Sie die aktuelle Bereitstellungsarchitektur
2. Erstellen Sie äquivalente Bicep-Vorlagen
3. Konfigurieren Sie `azure.yaml` entsprechend den aktuellen Diensten
4. Testen Sie gründlich in der Entwicklungsumgebung
5. Migrieren Sie Umgebungen schrittweise

---

## Haben Sie noch Fragen?

### **Zuerst suchen**
- Überprüfen Sie die [offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Durchsuchen Sie [GitHub Issues](https://github.com/Azure/azure-dev/issues) nach ähnlichen Problemen

### **Hilfe erhalten**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community-Support
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische Fragen
- [Azure Discord](https://discord.gg/azure) - Echtzeit-Community-Chat

### **Probleme melden**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fehlerberichte und Funktionsanforderungen
- Fügen Sie relevante Protokolle, Fehlermeldungen und Reproduktionsschritte bei

### **Mehr erfahren**
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektur Zentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technische Anleitung geprüft: 4. November 2026. Cloud-Verfügbarkeit und Preise müssen für Ihr Abonnement und Ihre Region überprüft werden.*

---

**Navigation**
- **Vorherige Lektion**: [Glossar](glossary.md)
- **Nächste Lektion**: [Studienführer](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->