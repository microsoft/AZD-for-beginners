<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-17T16:16:22+00:00",
  "source_file": "resources/faq.md",
  "language_code": "de"
}
-->
# Häufig gestellte Fragen (FAQ)

**Hilfe nach Kapiteln**
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)
- **🚆 Installationsprobleme**: [Kapitel 1: Installation & Einrichtung](../docs/getting-started/installation.md)
- **🤖 Fragen zu KI**: [Kapitel 2: KI-gestützte Entwicklung](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Fehlerbehebung**: [Kapitel 7: Fehlerbehebung & Debugging](../docs/troubleshooting/common-issues.md)

## Einführung

Dieses umfassende FAQ bietet Antworten auf die häufigsten Fragen zur Azure Developer CLI (azd) und Azure-Bereitstellungen. Finden Sie schnelle Lösungen für häufige Probleme, verstehen Sie Best Practices und erhalten Sie Klarheit über azd-Konzepte und Workflows.

## Lernziele

Durch die Überprüfung dieses FAQ werden Sie:
- Schnelle Antworten auf häufige Fragen und Probleme zur Azure Developer CLI finden
- Wichtige Konzepte und Begriffe durch ein praktisches Q&A-Format verstehen
- Lösungen zur Fehlerbehebung für häufige Probleme und Fehlerszenarien erhalten
- Best Practices durch häufig gestellte Fragen zur Optimierung kennenlernen
- Erweiterte Funktionen und Fähigkeiten durch Expertenfragen entdecken
- Effizient auf Leitlinien zu Kosten, Sicherheit und Bereitstellungsstrategien zugreifen

## Lernergebnisse

Mit regelmäßiger Bezugnahme auf dieses FAQ werden Sie in der Lage sein:
- Häufige Probleme mit der Azure Developer CLI eigenständig zu lösen, basierend auf den bereitgestellten Lösungen
- Fundierte Entscheidungen über Bereitstellungsstrategien und Konfigurationen zu treffen
- Die Beziehung zwischen azd und anderen Azure-Tools und -Diensten zu verstehen
- Best Practices basierend auf Community-Erfahrungen und Expertenempfehlungen anzuwenden
- Authentifizierungs-, Bereitstellungs- und Konfigurationsprobleme effektiv zu beheben
- Kosten und Leistung mithilfe der FAQ-Einblicke und Empfehlungen zu optimieren

## Inhaltsverzeichnis

- [Erste Schritte](../../../resources)
- [Authentifizierung & Zugriff](../../../resources)
- [Vorlagen & Projekte](../../../resources)
- [Bereitstellung & Infrastruktur](../../../resources)
- [Konfiguration & Umgebungen](../../../resources)
- [Fehlerbehebung](../../../resources)
- [Kosten & Abrechnung](../../../resources)
- [Best Practices](../../../resources)
- [Erweiterte Themen](../../../resources)

---

## Erste Schritte

### F: Was ist Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) ist ein entwicklerzentriertes Befehlszeilentool, das die Zeit verkürzt, die benötigt wird, um Ihre Anwendung von der lokalen Entwicklungsumgebung zu Azure zu bringen. Es bietet Best Practices durch Vorlagen und unterstützt den gesamten Bereitstellungszyklus.

### F: Wie unterscheidet sich azd von Azure CLI?
**A**: 
- **Azure CLI**: Allgemeines Tool zur Verwaltung von Azure-Ressourcen
- **azd**: Entwicklerorientiertes Tool für Anwendungsbereitstellungs-Workflows
- azd verwendet intern Azure CLI, bietet jedoch höhere Abstraktionen für häufige Entwicklungsszenarien
- azd umfasst Vorlagen, Umgebungsmanagement und Bereitstellungsautomatisierung

### F: Muss Azure CLI installiert sein, um azd zu verwenden?
**A**: Ja, azd benötigt Azure CLI für die Authentifizierung und einige Operationen. Installieren Sie zuerst Azure CLI und dann azd.

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
1. `azd init` verwenden, um azd-Konfiguration zu bestehenden Projekten hinzuzufügen
2. Bestehende Projekte an die azd-Vorlagenstruktur anpassen
3. Eigene Vorlagen basierend auf Ihrer bestehenden Architektur erstellen

---

## Authentifizierung & Zugriff

### F: Wie authentifiziere ich mich mit Azure über azd?
**A**: Verwenden Sie `azd auth login`, das ein Browserfenster für die Azure-Authentifizierung öffnet. Für CI/CD-Szenarien verwenden Sie Dienstprinzipale oder verwaltete Identitäten.

### F: Kann ich azd mit mehreren Azure-Abonnements verwenden?
**A**: Ja. Verwenden Sie `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, um festzulegen, welches Abonnement für jede Umgebung verwendet werden soll.

### F: Welche Berechtigungen benötige ich für die Bereitstellung mit azd?
**A**: Typischerweise benötigen Sie:
- **Contributor**-Rolle für die Ressourcengruppe oder das Abonnement
- **User Access Administrator**, wenn Ressourcen bereitgestellt werden, die Rollenzuweisungen erfordern
- Die spezifischen Berechtigungen variieren je nach Vorlage und bereitgestellten Ressourcen

### F: Kann ich azd in CI/CD-Pipelines verwenden?
**A**: Absolut! azd ist für die Integration in CI/CD konzipiert. Verwenden Sie Dienstprinzipale für die Authentifizierung und setzen Sie Umgebungsvariablen für die Konfiguration.

### F: Wie handhabe ich die Authentifizierung in GitHub Actions?
**A**: Verwenden Sie die Azure Login-Aktion mit Dienstprinzipal-Anmeldeinformationen:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Vorlagen & Projekte

### F: Wo finde ich azd-Vorlagen?
**A**: 
- Offizielle Vorlagen: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community-Vorlagen: GitHub-Suche nach "azd-template"
- Verwenden Sie `azd template list`, um verfügbare Vorlagen zu durchsuchen

### F: Wie erstelle ich eine benutzerdefinierte Vorlage?
**A**: 
1. Beginnen Sie mit einer bestehenden Vorlagenstruktur
2. Ändern Sie `azure.yaml`, Infrastrukturdateien und Anwendungscode
3. Testen Sie gründlich mit `azd up`
4. Veröffentlichen Sie die Vorlage auf GitHub mit geeigneten Tags

### F: Kann ich azd ohne Vorlage verwenden?
**A**: Ja, verwenden Sie `azd init` in einem bestehenden Projekt, um die erforderlichen Konfigurationsdateien zu erstellen. Sie müssen `azure.yaml` und Infrastrukturdateien manuell konfigurieren.

### F: Was ist der Unterschied zwischen offiziellen und Community-Vorlagen?
**A**: 
- **Offizielle Vorlagen**: Von Microsoft gepflegt, regelmäßig aktualisiert, umfassende Dokumentation
- **Community-Vorlagen**: Von Entwicklern erstellt, können spezialisierte Anwendungsfälle haben, unterschiedliche Qualität und Wartung

### F: Wie aktualisiere ich eine Vorlage in meinem Projekt?
**A**: Vorlagen werden nicht automatisch aktualisiert. Sie können:
1. Änderungen manuell vergleichen und zusammenführen
2. Mit `azd init` eine aktualisierte Vorlage verwenden
3. Spezifische Verbesserungen aus aktualisierten Vorlagen übernehmen

---

## Bereitstellung & Infrastruktur

### F: Welche Azure-Dienste kann azd bereitstellen?
**A**: azd kann jeden Azure-Dienst über Bicep/ARM-Vorlagen bereitstellen, einschließlich:
- App Services, Container Apps, Functions
- Datenbanken (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netzwerk-, Sicherheits- und Überwachungsressourcen

### F: Kann ich in mehreren Regionen bereitstellen?
**A**: Ja, konfigurieren Sie mehrere Regionen in Ihren Bicep-Vorlagen und setzen Sie den Standortparameter entsprechend für jede Umgebung.

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
**A**: Ja, verwenden Sie `azd provision`, um nur die Infrastrukturkomponenten bereitzustellen, die in Ihren Vorlagen definiert sind.

### F: Wie stelle ich in bestehende Azure-Ressourcen bereit?
**A**: Dies ist komplex und wird nicht direkt unterstützt. Sie können:
1. Bestehende Ressourcen in Ihre Bicep-Vorlagen importieren
2. Bestehende Ressourcenreferenzen in Vorlagen verwenden
3. Vorlagen so ändern, dass Ressourcen bedingt erstellt oder referenziert werden

### F: Kann ich Terraform anstelle von Bicep verwenden?
**A**: Derzeit unterstützt azd hauptsächlich Bicep/ARM-Vorlagen. Terraform-Unterstützung ist nicht offiziell verfügbar, obwohl Community-Lösungen existieren könnten.

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
**A**: Im `.azure`-Ordner innerhalb Ihres Projektverzeichnisses. Jede Umgebung hat ihren eigenen Ordner mit Konfigurationsdateien.

### F: Wie setze ich umgebungsspezifische Konfigurationen?
**A**: Verwenden Sie `azd env set`, um Umgebungsvariablen zu konfigurieren:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### F: Kann ich Umgebungs-Konfigurationen mit Teammitgliedern teilen?
**A**: Der `.azure`-Ordner enthält sensible Informationen und sollte nicht in die Versionskontrolle aufgenommen werden. Stattdessen:
1. Dokumentieren Sie die erforderlichen Umgebungsvariablen
2. Verwenden Sie Bereitstellungsskripte, um Umgebungen einzurichten
3. Nutzen Sie Azure Key Vault für sensible Konfigurationen

### F: Wie überschreibe ich Standardwerte von Vorlagen?
**A**: Setzen Sie Umgebungsvariablen, die den Vorlagenparametern entsprechen:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Fehlerbehebung

### F: Warum schlägt `azd up` fehl?
**A**: Häufige Ursachen:
1. **Authentifizierungsprobleme**: Führen Sie `azd auth login` aus
2. **Unzureichende Berechtigungen**: Überprüfen Sie Ihre Azure-Rollen
3. **Ressourcennamenskonflikte**: Ändern Sie AZURE_ENV_NAME
4. **Quota-/Kapazitätsprobleme**: Überprüfen Sie die regionale Verfügbarkeit
5. **Vorlagenfehler**: Validieren Sie Bicep-Vorlagen

### F: Wie debugge ich Bereitstellungsfehler?
**A**: 
1. Verwenden Sie `azd deploy --debug` für ausführliche Ausgaben
2. Überprüfen Sie die Bereitstellungshistorie im Azure-Portal
3. Sehen Sie sich das Aktivitätsprotokoll im Azure-Portal an
4. Verwenden Sie `azd show`, um den aktuellen Umgebungsstatus anzuzeigen

### F: Warum funktionieren meine Umgebungsvariablen nicht?
**A**: Überprüfen Sie:
1. Variablennamen stimmen genau mit den Vorlagenparametern überein
2. Werte sind korrekt zitiert, wenn sie Leerzeichen enthalten
3. Umgebung ist ausgewählt: `azd env select <environment>`
4. Variablen sind in der richtigen Umgebung gesetzt

### F: Wie bereinige ich fehlgeschlagene Bereitstellungen?
**A**: 
```bash
azd down --force --purge
```
Dies entfernt alle Ressourcen und Umgebungs-Konfigurationen.

### F: Warum ist meine Anwendung nach der Bereitstellung nicht zugänglich?
**A**: Überprüfen Sie:
1. Bereitstellung wurde erfolgreich abgeschlossen
2. Anwendung läuft (überprüfen Sie die Protokolle im Azure-Portal)
3. Netzwerksicherheitsgruppen erlauben den Datenverkehr
4. DNS/benutzerdefinierte Domains sind korrekt konfiguriert

---

## Kosten & Abrechnung

### F: Wie viel kosten azd-Bereitstellungen?
**A**: Die Kosten hängen ab von:
- Bereitgestellten Azure-Diensten
- Gewählten Service-Tiers/SKUs
- Regionalen Preisunterschieden
- Nutzungsmustern

Verwenden Sie den [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) für Schätzungen.

### F: Wie kontrolliere ich die Kosten bei azd-Bereitstellungen?
**A**: 
1. Verwenden Sie niedrigere Tiers für Entwicklungsumgebungen
2. Richten Sie Azure-Budgets und -Warnungen ein
3. Verwenden Sie `azd down`, um Ressourcen zu entfernen, wenn sie nicht benötigt werden
4. Wählen Sie geeignete Regionen (Kosten variieren je nach Standort)
5. Nutzen Sie Azure Cost Management-Tools

### F: Gibt es kostenlose Optionen für azd-Vorlagen?
**A**: Viele Azure-Dienste bieten kostenlose Tiers:
- App Service: Kostenloses Tier verfügbar
- Azure Functions: 1M kostenlose Ausführungen/Monat
- Cosmos DB: Kostenloses Tier mit 400 RU/s
- Application Insights: Erste 5GB/Monat kostenlos

Konfigurieren Sie Vorlagen, um kostenlose Tiers zu nutzen, wo verfügbar.

### F: Wie schätze ich Kosten vor der Bereitstellung?
**A**: 
1. Überprüfen Sie die `main.bicep`-Datei der Vorlage, um zu sehen, welche Ressourcen erstellt werden
2. Verwenden Sie den Azure Pricing Calculator mit spezifischen SKUs
3. Stellen Sie zuerst in einer Entwicklungsumgebung bereit, um tatsächliche Kosten zu überwachen
4. Nutzen Sie Azure Cost Management für detaillierte Kostenanalysen

---

## Best Practices

### F: Was sind die Best Practices für die azd-Projektstruktur?
**A**: 
1. Halten Sie Anwendungscode getrennt von der Infrastruktur
2. Verwenden Sie aussagekräftige Servicenamen in `azure.yaml`
3. Implementieren Sie eine ordnungsgemäße Fehlerbehandlung in Build-Skripten
4. Nutzen Sie umgebungsspezifische Konfigurationen
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

### F: Soll ich den `.azure`-Ordner in die Versionskontrolle aufnehmen?
**A**: **Nein!** Der `.azure`-Ordner enthält sensible Informationen. Fügen Sie ihn zu `.gitignore` hinzu:
```gitignore
.azure/
```

### F: Wie gehe ich mit Geheimnissen und sensibler Konfiguration um?
**A**: 
1. Verwenden Sie Azure Key Vault für Geheimnisse
2. Referenzieren Sie Key Vault-Geheimnisse in der Anwendungskonfiguration
3. Niemals Geheimnisse in die Versionskontrolle aufnehmen
4. Verwenden Sie verwaltete Identitäten für die Authentifizierung zwischen Diensten

### F: Was ist der empfohlene Ansatz für CI/CD mit azd?
**A**: 
1. Verwenden Sie separate Umgebungen für jede Phase (dev/staging/prod)
2. Implementieren Sie automatisierte Tests vor der Bereitstellung
3. Verwenden Sie Dienstprinzipale für die Authentifizierung
4. Speichern Sie sensible Konfigurationen in Pipeline-Geheimnissen/Variablen
5. Implementieren Sie Genehmigungsschritte für Produktionsbereitstellungen

---

## Erweiterte Themen

### F: Kann ich azd mit benutzerdefinierter Funktionalität erweitern?
**A**: Ja, durch Bereitstellungshooks in `azure.yaml`:
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
2. Standardisieren Sie azd-Vorlagen über Teams hinweg
3. Integrieren Sie bestehende Überwachungs- und Warnsysteme
4. Nutzen Sie die JSON-Ausgabe von azd für die Pipeline-Integration

### F: Kann ich azd mit Azure DevOps verwenden?
**A**: Ja, azd funktioniert mit jedem CI/CD-System. Erstellen Sie Azure DevOps-Pipelines, die azd-Befehle verwenden.

### F: Wie trage ich zu azd bei oder erstelle Community-Vorlagen?
**A**: 
1. **azd-Tool**: Beitrag zu [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Vorlagen**: Erstelle Vorlagen gemäß den [Vorlagenrichtlinien](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentation**: Trage zur Dokumentation bei unter [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### F: Wie sieht die Roadmap für azd aus?  
**A**: Sieh dir die [offizielle Roadmap](https://github.com/Azure/azure-dev/projects) an, um geplante Funktionen und Verbesserungen zu erfahren.  

### F: Wie migriere ich von anderen Deployment-Tools zu azd?  
**A**:  
1. Analysiere die aktuelle Deployment-Architektur  
2. Erstelle entsprechende Bicep-Vorlagen  
3. Konfiguriere `azure.yaml`, um die aktuellen Dienste abzubilden  
4. Teste gründlich in der Entwicklungsumgebung  
5. Migriere die Umgebungen schrittweise  

---

## Noch Fragen?

### **Zuerst suchen**  
- Sieh dir die [offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) an  
- Suche nach ähnlichen Problemen in den [GitHub-Issues](https://github.com/Azure/azure-dev/issues)  

### **Hilfe erhalten**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community-Support  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische Fragen  
- [Azure Discord](https://discord.gg/azure) - Echtzeit-Community-Chat  

### **Probleme melden**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fehlerberichte und Funktionsanfragen  
- Füge relevante Logs, Fehlermeldungen und Schritte zur Reproduktion hinzu  

### **Mehr erfahren**  
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Diese FAQ wird regelmäßig aktualisiert. Letzte Aktualisierung: 9. September 2025*  

---

**Navigation**  
- **Vorherige Lektion**: [Glossar](glossary.md)  
- **Nächste Lektion**: [Lernleitfaden](study-guide.md)  

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.