# Frequently Asked Questions (FAQ)

**Get Help by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **🚆 Installation Issues**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 AI Questions**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Introduction

Diese umfassende FAQ bietet Antworten auf die häufigsten Fragen zur Azure Developer CLI (azd) und zu Azure-Bereitstellungen. Finden Sie schnelle Lösungen für häufige Probleme, verstehen Sie Best Practices und erhalten Sie Klärungen zu azd-Konzepten und Workflows.

## Learning Goals

Durch das Durcharbeiten dieser FAQ werden Sie:
- Schnelle Antworten auf häufige Fragen und Probleme zur Azure Developer CLI finden
- Wichtige Konzepte und Terminologie durch praktisches Frage-und-Antwort-Format verstehen
- Zugriff auf Fehlerbehebungsansätze für häufige Probleme und Fehlerszenarien erhalten
- Best Practices durch häufig gestellte Fragen zur Optimierung erlernen
- Erweiterte Funktionen und Möglichkeiten durch Fragen auf Expertenniveau entdecken
- Anleitung zu Kosten, Sicherheit und Bereitstellungsstrategien effizient nachschlagen können

## Learning Outcomes

Bei regelmäßiger Bezugnahme auf diese FAQ werden Sie in der Lage sein:
- Häufige Azure Developer CLI-Probleme eigenständig mit den bereitgestellten Lösungen zu lösen
- Informierte Entscheidungen zu Bereitstellungsstrategien und Konfigurationen zu treffen
- Die Beziehung zwischen azd und anderen Azure-Tools und -Diensten zu verstehen
- Best Practices basierend auf Community-Erfahrungen und Expertenempfehlungen anzuwenden
- Authentifizierungs-, Bereitstellungs- und Konfigurationsprobleme effektiv zu beheben
- Kosten und Leistung mithilfe der Erkenntnisse und Empfehlungen aus der FAQ zu optimieren

## Table of Contents

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) ist ein entwicklerzentriertes Kommandozeilentool, das die Zeit verkürzt, die benötigt wird, um Ihre Anwendung von der lokalen Entwicklungsumgebung nach Azure zu bringen. Es bietet Best Practices durch Vorlagen und unterstützt den gesamten Bereitstellungslebenszyklus.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Allgemeines Werkzeug zur Verwaltung von Azure-Ressourcen
- **azd**: Auf Entwickler fokussiertes Tool für Anwendungsbereitstellungs-Workflows
- azd verwendet Azure CLI intern, bietet aber höherstufige Abstraktionen für gängige Entwicklungsszenarien
- azd umfasst Vorlagen, Umgebungsverwaltung und Bereitstellungsautomatisierung

### Q: Do I need Azure CLI installed to use azd?
**A**: Ja, azd benötigt Azure CLI für die Authentifizierung und einige Vorgänge. Installieren Sie zuerst Azure CLI und dann azd.

### Q: What programming languages does azd support?
**A**: azd ist sprachunabhängig. Es funktioniert mit:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statischen Websites
- Containerisierten Anwendungen

### Q: Can I use azd with existing projects?
**A**: Ja! Sie können entweder:
1. Verwenden Sie `azd init`, um azd-Konfiguration zu bestehenden Projekten hinzuzufügen
2. Passen Sie bestehende Projekte an, um der azd-Vorlagenstruktur zu entsprechen
3. Erstellen Sie benutzerdefinierte Vorlagen basierend auf Ihrer vorhandenen Architektur

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Verwenden Sie `azd auth login`, das ein Browserfenster zur Azure-Authentifizierung öffnet. Für CI/CD-Szenarien verwenden Sie Dienstprinzipale oder verwaltete Identitäten.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Ja. Verwenden Sie `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, um anzugeben, welches Abonnement für jede Umgebung verwendet werden soll.

### Q: What permissions do I need to deploy with azd?
**A**: Typischerweise benötigen Sie:
- Die Rolle **Contributor** auf der Ressourcengruppe oder dem Abonnement
- **User Access Administrator**, wenn Ressourcen bereitgestellt werden, die Rollenzuweisungen erfordern
- Spezifische Berechtigungen variieren je nach Vorlage und bereitgestellten Ressourcen

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolut! azd ist für die Integration in CI/CD konzipiert. Verwenden Sie Dienstprinzipale für die Authentifizierung und setzen Sie Umgebungsvariablen für die Konfiguration.

### Q: How do I handle authentication in GitHub Actions?
**A**: Verwenden Sie die Azure Login Action mit Dienstprinzipal-Anmeldeinformationen:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Offizielle Vorlagen: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community-Vorlagen: GitHub-Suche nach "azd-template"
- Verwenden Sie `azd template list`, um verfügbare Vorlagen zu durchsuchen

### Q: How do I create a custom template?
**A**: 
1. Beginnen Sie mit einer vorhandenen Vorlagenstruktur
2. Ändern Sie `azure.yaml`, Infrastrukturdateien und Anwendungscode
3. Testen Sie gründlich mit `azd up`
4. Veröffentlichen Sie auf GitHub mit geeigneten Tags

### Q: Can I use azd without a template?
**A**: Ja, verwenden Sie `azd init` in einem bestehenden Projekt, um die erforderlichen Konfigurationsdateien zu erstellen. Sie müssen `azure.yaml` und Infrastrukturdateien manuell konfigurieren.

### Q: What's the difference between official and community templates?
**A**: 
- **Offizielle Vorlagen**: Von Microsoft gepflegt, regelmäßig aktualisiert, umfassende Dokumentation
- **Community-Vorlagen**: Von Entwicklern erstellt, können spezielle Anwendungsfälle haben, unterschiedliche Qualität und Wartung

### Q: How do I update a template in my project?
**A**: Vorlagen werden nicht automatisch aktualisiert. Sie können:
1. Änderungen aus der Quellvorlage manuell vergleichen und zusammenführen
2. Mit `azd init` neu starten und die aktualisierte Vorlage verwenden
3. Bestimmte Verbesserungen aus aktualisierten Vorlagen per Cherry-Pick übernehmen

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd kann jeden Azure-Dienst über Bicep/ARM-Vorlagen bereitstellen, einschließlich:
- App Services, Container Apps, Functions
- Datenbanken (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netzwerk-, Sicherheits- und Überwachungsressourcen

### Q: Can I deploy to multiple regions?
**A**: Ja, konfigurieren Sie mehrere Regionen in Ihren Bicep-Vorlagen und setzen Sie den Standortparameter entsprechend für jede Umgebung.

### Q: How do I handle database schema migrations?
**A**: Verwenden Sie Bereitstellungshooks in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Ja, verwenden Sie `azd provision`, um nur die in Ihren Vorlagen definierten Infrastrukturkomponenten bereitzustellen.

### Q: How do I deploy to existing Azure resources?
**A**: Das ist komplex und nicht direkt unterstützt. Sie können:
1. Bestehende Ressourcen in Ihre Bicep-Vorlagen importieren
2. Referenzen auf vorhandene Ressourcen in Vorlagen verwenden
3. Vorlagen so anpassen, dass Ressourcen bedingt erstellt oder referenziert werden

### Q: Can I use Terraform instead of Bicep?
**A**: Derzeit unterstützt azd hauptsächlich Bicep/ARM-Vorlagen. Terraform-Unterstützung ist nicht offiziell verfügbar, obwohl Community-Lösungen existieren können.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Erstellen Sie separate Umgebungen mit `azd env new <environment-name>` und konfigurieren Sie unterschiedliche Einstellungen für jede:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: Im `.azure`-Ordner innerhalb Ihres Projektverzeichnisses. Jede Umgebung hat ihren eigenen Ordner mit Konfigurationsdateien.

### Q: How do I set environment-specific configuration?
**A**: Verwenden Sie `azd env set`, um Umgebungsvariablen zu konfigurieren:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: Der `.azure`-Ordner enthält sensible Informationen und sollte nicht in die Versionskontrolle committet werden. Stattdessen:
1. Dokumentieren Sie die erforderlichen Umgebungsvariablen
2. Verwenden Sie Bereitstellungsskripte, um Umgebungen einzurichten
3. Verwenden Sie Azure Key Vault für sensible Konfiguration

### Q: How do I override template defaults?
**A**: Setzen Sie Umgebungsvariablen, die den Vorlagenparametern entsprechen:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Häufige Ursachen:
1. **Authentifizierungsprobleme**: Führen Sie `azd auth login` aus
2. **Unzureichende Berechtigungen**: Überprüfen Sie Ihre Azure-Rollen
3. **Ressourcennamenskonflikte**: Ändern Sie AZURE_ENV_NAME
4. **Quota-/Kapazitätsprobleme**: Überprüfen Sie die regionale Verfügbarkeit
5. **Vorlagenfehler**: Validieren Sie Bicep-Vorlagen

### Q: How do I debug deployment failures?
**A**: 
1. Verwenden Sie `azd deploy --debug` für ausführliche Ausgabe
2. Prüfen Sie die Bereitstellungshistorie im Azure-Portal
3. Überprüfen Sie das Aktivitätsprotokoll im Azure-Portal
4. Verwenden Sie `azd show`, um den aktuellen Umgebungszustand anzuzeigen

### Q: Why are my environment variables not working?
**A**: Überprüfen Sie:
1. Die Variablennamen stimmen exakt mit den Vorlagenparametern überein
2. Werte sind korrekt in Anführungszeichen gesetzt, wenn sie Leerzeichen enthalten
3. Die Umgebung ist ausgewählt: `azd env select <environment>`
4. Variablen sind in der richtigen Umgebung gesetzt

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
Dies entfernt alle Ressourcen und die Umgebungs-Konfiguration.

### Q: Why is my application not accessible after deployment?
**A**: Überprüfen Sie:
1. Die Bereitstellung wurde erfolgreich abgeschlossen
2. Die Anwendung läuft (Protokolle im Azure-Portal prüfen)
3. Network Security Groups erlauben den Verkehr
4. DNS/benutzerdefinierte Domains sind korrekt konfiguriert

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Die Kosten hängen ab von:
- Den bereitgestellten Azure-Diensten
- Ausgewählten Service-Tiers/SKUs
- Regionalen Preisunterschieden
- Nutzungsmustern

Verwenden Sie den [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) für Schätzungen.

### Q: How do I control costs in azd deployments?
**A**: 
1. Verwenden Sie niedrigere SKUs für Entwicklungsumgebungen
2. Richten Sie Azure-Budgets und Warnungen ein
3. Verwenden Sie `azd down`, um Ressourcen zu entfernen, wenn sie nicht benötigt werden
4. Wählen Sie geeignete Regionen (Kosten variieren je nach Standort)
5. Nutzen Sie Azure Cost Management-Tools

### Q: Are there free tier options for azd templates?
**A**: Viele Azure-Dienste bieten Free Tiers:
- App Service: Free-Tier verfügbar
- Azure Functions: 1M freie Ausführungen/Monat
- Cosmos DB: Free Tier mit 400 RU/s
- Application Insights: Erste 5GB/Monat kostenlos

Konfigurieren Sie Vorlagen so, dass freie Stufen verwendet werden, wo verfügbar.

### Q: How do I estimate costs before deployment?
**A**: 
1. Überprüfen Sie die `main.bicep` der Vorlage, um zu sehen, welche Ressourcen erstellt werden
2. Verwenden Sie den Azure Pricing Calculator mit spezifischen SKUs
3. Bereitstellen in einer Entwicklungsumgebung, um die tatsächlichen Kosten zu überwachen
4. Verwenden Sie Azure Cost Management für detaillierte Kostenanalyse

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Trennen Sie Anwendungs-Code von der Infrastruktur
2. Verwenden Sie aussagekräftige Servicenamen in `azure.yaml`
3. Implementieren Sie ordnungsgemäße Fehlerbehandlung in Build-Skripten
4. Verwenden Sie umgebungsspezifische Konfiguration
5. Fügen Sie umfassende Dokumentation hinzu

### Q: How should I organize multiple services in azd?
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

### Q: Should I commit the `.azure` folder to version control?
**A**: **No!** Der `.azure`-Ordner enthält sensible Informationen. Fügen Sie ihn zu `.gitignore` hinzu:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Verwenden Sie Azure Key Vault für Geheimnisse
2. Referenzieren Sie Key Vault-Geheimnisse in der Anwendungs-Konfiguration
3. Kommittieren Sie niemals Geheimnisse in die Versionskontrolle
4. Verwenden Sie Managed Identities für die Authentifizierung zwischen Diensten

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Verwenden Sie separate Umgebungen für jede Stufe (dev/staging/prod)
2. Implementieren Sie automatisierte Tests vor der Bereitstellung
3. Verwenden Sie Dienstprinzipale für die Authentifizierung
4. Speichern Sie sensible Konfiguration in Pipeline-Geheimnissen/-Variablen
5. Implementieren Sie Freigabeschleusen für Produktionsbereitstellungen

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Ja, über Bereitstellungshooks in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Verwenden Sie azd-Befehle in vorhandenen Pipeline-Skripten
2. Standardisieren Sie azd-Vorlagen über Teams hinweg
3. Integrieren Sie mit bestehender Überwachung und Alarmierung
4. Verwenden Sie azd-JSON-Ausgabe für Pipeline-Integration

### Q: Can I use azd with Azure DevOps?
**A**: Ja, azd funktioniert mit jedem CI/CD-System. Erstellen Sie Azure DevOps-Pipelines, die azd-Befehle verwenden.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd-Tool**: Zu [Azure/azure-dev](https://github.com/Azure/azure-dev) beitragen
2. **Vorlagen**: Erstellen Sie Vorlagen gemäß den [Vorlagenrichtlinien](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentation**: Zur Dokumentation beitragen unter [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Wie sieht die Roadmap für azd aus?
**A**: Siehe die [offizielle Roadmap](https://github.com/Azure/azure-dev/projects) für geplante Funktionen und Verbesserungen.

### Q: Wie migriere ich von anderen Bereitstellungstools zu azd?
**A**: 
1. Analysieren Sie die aktuelle Bereitstellungsarchitektur
2. Erstellen Sie entsprechende Bicep-Vorlagen
3. Konfigurieren Sie `azure.yaml`, damit es den aktuellen Diensten entspricht
4. Testen Sie gründlich in der Entwicklungsumgebung
5. Migrieren Sie die Umgebungen schrittweise

---

## Still Have Questions?

### **Zuerst suchen**
- Überprüfen Sie die [offizielle Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Durchsuchen Sie [GitHub-Issues](https://github.com/Azure/azure-dev/issues) nach ähnlichen Problemen

### **Hilfe erhalten**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community-Unterstützung
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische Fragen
- [Azure Discord](https://discord.gg/azure) - Echtzeit-Community-Chat

### **Probleme melden**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fehlerberichte und Funktionswünsche
- Fügen Sie relevante Protokolle, Fehlermeldungen und Reproduktionsschritte bei

### **Mehr erfahren**
- [Dokumentation der Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure-Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Diese FAQ wird regelmäßig aktualisiert. Zuletzt aktualisiert: 9. September 2025*

---

**Navigation**
- **Previous Lesson**: [Glossar](glossary.md)
- **Next Lesson**: [Lernleitfaden](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, weisen wir darauf hin, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle, menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->